#!/bin/bash

export SQPROD="/usr/bin/mysql --skip-column-names otwarchive_production"

cd /home/katmac3/superlove/otwarchive/bin

echo "" > dailyreport.txt
echo "Daily Report" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the new fandoms
echo "Fandoms" >> dailyreport.txt
echo "select name, canonical, created_at from tags where type = 'Fandom' and created_at > DATE_SUB(NOW(), INTERVAL 1 DAY);" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the new characters
echo "Characters" >> dailyreport.txt
echo "select name, canonical, created_at from tags where type = 'Character' and created_at > DATE_SUB(NOW(), INTERVAL 1 DAY);" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the new relationships
echo "Relationships" >> dailyreport.txt
echo "select name, canonical, created_at from tags where type = 'Relationship' and created_at > DATE_SUB(NOW(), INTERVAL 1 DAY);" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the new freeforms
echo "Freeforms" >> dailyreport.txt
echo "select name, canonical, created_at from tags where type = 'Freeform' and created_at > DATE_SUB(NOW(), INTERVAL 1 DAY);" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
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

#do the new stories
echo "Stories" >> dailyreport.txt
echo "select \"WorkID: \", id, title, \"create:\", created_at, \"revised/backdated:\", revised_at from works where created_at > DATE_SUB(NOW(), INTERVAL 1 DAY) or revised_at > DATE_SUB(NOW(), INTERVAL 1 DAY) ;" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the number of readings by user
echo "Readings by user" >> dailyreport.txt
echo "select \"UserID: \", user_id, \"Number of stories read: \", count(*) from readings" > newquery.sql
echo "where last_viewed > DATE_SUB(NOW(), INTERVAL 1 DAY) group by user_id;" >> newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#Do the number of kudos left 
echo "Number of kudos left recently" >> dailyreport.txt
echo "select count(*) from kudos" > newquery.sql
echo "where updated_at > DATE_SUB(NOW(), INTERVAL 1 DAY);" >> newquery.sql
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
echo "Recent comments from all works/admin news - LOGGED IN WITH NAMES" >> dailyreport.txt
echo "select \"WorkID: \", ch.work_id, \"Chapter: \", ch.position, \"Commenter:\", u.login, \"Comment: \", co.comment_content" > newquery.sql
echo "from chapters ch, comments co" >> newquery.sql
echo "join pseuds p on p.id = co.pseud_id" >> newquery.sql
echo "join users u on u.id = p.user_id" >> newquery.sql
echo "where co.created_at > DATE_SUB(NOW(), INTERVAL 1 DAY)" >> newquery.sql
echo "and co.commentable_id = ch.id" >> newquery.sql
echo "and co.commentable_type = 'Chapter';" >> newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt
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

#show comments
echo "Recent comments from all works/admin news - ALL INCLUDING GUESTS" >> dailyreport.txt
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

echo "Section for Patreon and Ko-Fi links. Check all off-site links to make sure nothing hinky is going on!" >> dailyreport.txt

#do the works.summary for patreon, ko-fi
echo "WORKS.summary" >> dailyreport.txt
echo "select \"WorkID: \", works.id, works.summary from works where works.summary like '%patreon%' or works.summary like '%ko-fi%' or works.summary like '%http%' and updated_at  > DATE_SUB(NOW(), INTERVAL 1 DAY);;" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the works.notes for patreon, ko-fi
echo "WORKS.notes" >> dailyreport.txt
echo "select \"WorkID: \", works.id, works.notes from works where works.notes like '%patreon%' or works.notes like '%ko-fi%' or works.notes like '%http%' and updated_at  > DATE_SUB(NOW(), INTERVAL 1 DAY);" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the works.endnodes for patreon, ko-fi
echo "WORKS.endnotes" >> dailyreport.txt
echo "select \"WorkID: \", works.id, works.endnotes from works where works.endnotes like '%patreon%' or works.endnotes like '%ko-fi%' or works.endnotes like '%http%' and updated_at  > DATE_SUB(NOW(), INTERVAL 1 DAY);" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the chapter.notes for patreon, ko-fi
echo "CHAPTERS.notes" >> dailyreport.txt
echo "select \"WorkID: \", chapters.work_id, chapters.notes from chapters where chapters.notes like '%patreon%' or chapters.notes like '%ko-fi%' or chapters.notes like '%http%' and updated_at  > DATE_SUB(NOW(), INTERVAL 1 DAY);" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the chapter.endnotes for patreon, ko-fi
echo "CHAPTERS.endnotes" >> dailyreport.txt
echo "select \"WorkID: \", chapters.work_id, chapters.endnotes from chapters where chapters.endnotes like '%patreon%' or chapters.endnotes like '%ko-fi%' or chapters.endnotes like '%http%' and updated_at  > DATE_SUB(NOW(), INTERVAL 1 DAY);" > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

#do the chapter.summary for patreon, ko-fi
echo "CHAPTERS.summary" >> dailyreport.txt
echo "select \"WorkID: \", chapters.work_id, chapters.summary from chapters where chapters.summary like '%patreon%' or chapters.summary like '%ko-fi%' or chapters.summary like '%https%' and updated_at  > DATE_SUB(NOW(), INTERVAL 1 DAY); " > newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt

# PROMPT SHIT BY MELO

# PROMPT SHIT BY MELO

echo "recent prompts in prompt challenges" >> dailyreport.txt
echo "select \"prompt ID: \", prompts.id, \"collection ID: \", prompts.collection_id, \"pseud ID: \", prompts.pseud_id, \"User: \", u.login, \"Description: \", prompts.description from prompts" > newquery.sql
echo "join pseuds p on p.id = pseud_id" >> newquery.sql
echo "join users u on u.id = p.user_id" >> newquery.sql
echo "where prompts.created_at > DATE_SUB(NOW(), INTERVAL 1 DAY)" >> newquery.sql
$SQPROD < newquery.sql >> dailyreport.txt
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt 
echo "" >> dailyreport.txt
echo "" >> dailyreport.txt 

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


#       script by Walter Hopgood of squidge.org
#       comment to commenter bridge by EchoEkhi of echoekhi.com
#       slightly modified for superlove by melo
