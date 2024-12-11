#!/bin/bash

export SQPROD="/usr/bin/mysql --skip-column-names otwarchive_production"

cd /home/katmac3/superlove/otwarchive/bin

echo "" > dailyreport.txt
echo "Daily Report" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the new users
echo "Users" >> dailyreport.txt
echo "select u.email, u.login, p.name" > newquery.sql
echo "from users u, pseuds p" >> newquery.sql
echo "where u.id = p.user_id" >> newquery.sql
echo "and (u.created_at > DATE_SUB(NOW(), INTERVAL 1 DAY)" >> newquery.sql
echo "or p.created_at > DATE_SUB(NOW(), INTERVAL 1 DAY));" >> newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt


#Do the number of comments left 
echo "Number of comments left recently on all works/admin news" >> dailyreport.txt
echo "select count(*) from comments" > newquery.sql
echo "where created_at > DATE_SUB(NOW(), INTERVAL 1 DAY);" >> newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt


#show comments
echo "Recent comments from all works/admin news" >> dailyreport.txt
echo "select \"WorkID: \", ch.work_id, \"Chapter: \", ch.position, \"Comment: \", co.comment_content" > newquery.sql
echo "from chapters ch, comments co" >> newquery.sql
echo "where co.created_at > DATE_SUB(NOW(), INTERVAL 1 DAY)" >> newquery.sql
echo "and co.commentable_id = ch.id" >> newquery.sql
echo "and co.commentable_type = 'Chapter';" >> newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "Comment Responses" >> dailyreport.txt
echo "select commentable_type, comment_content" > newquery.sql
echo "from comments" >> newquery.sql
echo "where created_at > DATE_SUB(NOW(), INTERVAL 1 DAY)" >> newquery.sql
echo "and commentable_type != 'Chapter'" >> newquery.sql
echo "order by commentable_type, id;" >> newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#now mail it out

#Now mail it out
#person to email to
MAILPERSON="melodicake@disroot.org"

{
        echo To: $MAILPERSON
        echo From: dicakemelo@gmail.com
        echo Subject: Last 24 hours in superlove
        echo
        cat dailyreport.txt
} | ssmtp $MAILPERSON

rm -fr dailyreport.txt newquery.sql
