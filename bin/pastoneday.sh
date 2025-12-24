#!/bin/bash

#First, need a shortcut for running the script
#depends on a file being in $HOME/.my.cnf that has username and password set
export SQPROD="/usr/bin/mysql --skip-column-names otwarchive_production"

#work in the scripts directory
cd /home/katmac3/superlove/otwarchive/bin

#remove last1.txt if it exists
rm -f last1.txt

#Now, start to put together a report of items from the last day
echo "" > last1.txt
echo "Fic From The Last Day" >> last1.txt
echo "" >> last1.txt


#do the new stories
#first get the list of work_ids and put them in a file

echo "select id from works where created_at > DATE_SUB(NOW(), INTERVAL 1 DAY);" > query.sql
#Above is correct, but for testing use this:
#echo "select id from works where id in (34563,39768,40640);" >  query.sql
$SQPROD < query.sql > query.out


#now process each line
for file in `cat query.out`
do
 export WORKID=$file

 #Now go get the title of the fic
 echo "select concat(\"Title: \", title) from works where id = $WORKID" > query2.sql
 #and write it out to the file
 $SQPROD < query2.sql >> last1.txt

 #Now go see how many authors there are
 echo "select pseud_id from creatorships where creation_type = 'Work' and creation_id  = $WORKID" > numauthors.sql
 $SQPROD < numauthors.sql > numauthors.out

 export numberofauthors=`wc -l numauthors.out | awk '{print $1}'`
 if [ $numberofauthors -lt 2 ]
 then
 echo "select p.name from pseuds p, creatorships c where c.creation_id = $WORKID and c.creation_type = 'Work' and c.pseud_id = p.id" > pseud.sql
 $SQPROD < pseud.sql > pseud.out
 export AUTHOR=`cat pseud.out`
 echo "Author: $AUTHOR" >> last1.txt
 else
	export AUTHOR=""
 	for file in `cat numauthors.out`
	do
 	echo "select p.name ', ' from pseuds p where p.id = $file;" > multpseuds.sql
 	$SQPROD < multpseuds.sql > multpseuds.out
 	export AUTHOR+=`cat multpseuds.out`
	export AUTHOR+=", "
	done
 export NEWAUTHORS=`echo $AUTHOR| sed 's/,$//'` 
 echo "Authors: $NEWAUTHORS" >> last7.txt
 fi

 #Get the number of chapters completed and the number of chapters expected
 echo "select max(c.position) from chapters c, works w" > getchapnums.sql
 echo "where w.id = $WORKID and w.id = c.work_id;" >> getchapnums.sql
 $SQPROD < getchapnums.sql > getchapnums.out
 export CHAPNUMS=`cat getchapnums.out`
 #Now go get expected number of chapters, with custom code for NULL
 echo "select expected_number_of_chapters from works where id = $WORKID;" > expected.sql
 $SQPROD < expected.sql > expected.out
 export EXPNUMCHAPS=`cat expected.out`
 if [ $EXPNUMCHAPS = "NULL" ]
 then
	echo "Number of Chapters: $CHAPNUMS of ???" >> last1.txt
 else
 	echo "Number of Chapters: $CHAPNUMS of $EXPNUMCHAPS" >> last1.txt
 fi

 #Get the rating for the fic
 echo "select tr.name from tags tr where tr.type = 'Rating' and id in (select tagger_id from taggings where taggable_id = $WORKID and taggable_type = 'Work');" > rating.sql
 $SQPROD < rating.sql > rating.out
 if [ -s rating.out ] 
 then 
	 export FICRATING=`cat rating.out`
 else
	 export FICRATING="Not Rated"
 fi

 #Now go put the rating on the fic
 echo "Rating: $FICRATING" >> last1.txt


 #Now go get the URL for the fic
 export URLBASE="https://superlove.sayitditto.net/works/"
 WORKURL=`echo $URLBASE$WORKID`
 echo "Link to Fic: $WORKURL" >> last1.txt
 echo "" >> last1.txt
 echo "" >> last1.txt

done

echo "This is a list of all items added in the last day to the archive." >> last1.txt

#Now mail it out
#person to email to
MAILPERSON="melodicake@disroot.org"

{
	echo To: $MAILPERSON
	echo From: dontreply@mail.superlove.sayitditto.net
	echo Subject: Last Day in the Archive
	echo
	cat last1.txt 
} | mail -s "Last Day in the Archive" $MAILPERSON

#now remove temp files
rm -f query.sql query.out multpseuds.sql multpseuds.out query2.sql numauthors.sql numauthors.out
rm -f pseud.sql pseud.out getchapnums.sql getchapnums.out expected.sql expected.out rating.sql rating.out last1.txt
