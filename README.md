# Data exploration with SQL - Stack Exchange database

In this project, I explore relational data from the Stack Exchange database with SQL queries by stating questions and answering them.

## Questions I've answered

- What badges have authors of 5 posts with the highest score?
- Show age of 5 people whose content generated the most views.
- Find answers with higher scores than the question.
- What's the average age of users?
- What's the average number of badges per user?
- Find top 5 comments made between 2009-02-10 and 2011-02-10 containing "t-test".

## Data

Source: https://relational.fit.cvut.cz/dataset/Stats

Description:
> An anonymized dump of all user-contributed content on the Stats Stack Exchange network.

Size: 658.4 MB | Tables: 8 | # of rows: 1,027,838 | # of columns: 71

Graph:
![Data chart](https://raw.githubusercontent.com/Ilnicki010/exploration-stackexchange-with-sql/main/Chart.png)

Description of database's schema: https://meta.stackexchange.com/questions/2677/database-schema-documentation-for-the-public-data-dump-and-sede

## Run
1. Run `mysqldump --column-statistics=0 -h relational.fit.cvut.cz -u guest -p  stats > Data_Stats.sql` in a terminal.
1. Create a MySQL database [(here's how)](https://dev.mysql.com/doc/refman/8.0/en/creating-database.html)
2. Now with `mysqldump` use `Data_Stats.sql` file to recreate the database. `mysqldump -u root -p my_db_name < Data_Stats.sql`
3. Connect to that database. (I use [DataGrip](https://www.jetbrains.com/datagrip/)).
4. Run queries from `01_SQL_Exploration.sql` against the DB.