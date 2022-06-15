4QFBLFS 5JUMF.Z42-

2 
 MySQL MySQL  5.7 Q  &  A

3 


10MySQL  MySQL MySQLInnoSQL Oracle  MySQL  ACE

   

95% 100%
90% 88%

  
MySQLMySQLMySQL NoSQLHBase

4 

MySQL
MySQL InnoDB   
DBA 

SQL
MySQLSQL  SQL
DBA 

MySQL
InnDB  InnoDB  Oracle 
 

5 MySQL

1 Most p  opular  open--source  database 2 18  of  20  top w  eb  sites  in  the w  orld 3 Embedded b  y  8 o  f  the t  op  10 I  SVs 4 #1  database i  n t  he C  loud 5 Integrated w  /Hadoop i  n 8  0% o  f  Big D  ata p  latform

90%

MySQL  


80%

MySQLMySQL Hadoop
OLTPMySQLOLAP
Hadoop

6 MySQL

90% 

LiveBing
MySQLGoogle MySQLFacebook4000
MySQL 

1 Google

2 Faceboo
k

3 Youtube

7 MySQL

MySQL 
Oracle MySQLOracle  IT

TOP2 MySQL 2

Oracle 1

MySQ 2
L

MS 3
SQL  

8 MySQL

MySQL  in  China
 MySQL

MySQL
MySQLMySQL 

9 MySQL

10 MySQL

OracleMySQL
MySQLOracle GPL ""

MySQL   MySQL
Oracle M  ySQL 


 MySQL  or   NoSQL

11 MySQL 5.7



JSON

01 MySQL  5.7  MySQL


02 MySQL  5.7 JSONMySQL  Group  Replication



07 MySQLRAC Share  Nothing



03 04 InnoDB   

MySQL  5.7 InnoDB

MySQL



Slave
05   


06 InnoDB  

12 Lossless

Reliable
 
Financial
MySQL 

RP FA

Performance

Availability
  

13 Lossless

Facebook
 


slavemaster  

14 JSON

MySQL 
The  world's  most  popular  open   source  database

MongoDB 
The  world's  most  popular   document  database

MySQL  5.7
InnoDBJSON  

MySQL  5.7JSONBLOB 
  

15 JSON

JSON vs BLOB
·    
·    ·   


mysql> create table user  ( --> uid int auto_increment, --> data json, --> primary key(uid))engine=innodb;
mysql>  insert  into  user  values   (NULL,'{"name":"Amy","mail":"amy@gmail.com"}'); Query  OK,  1  row  affected  (0.00  sec)
mysql> insert into user values (NULL,"test"); ERROR 3130 (22032): Invalid JSON text: "Invalid value" at position 2 in value (or  column) 'test'.

16 JSON

· Virtual  Column
·  · 
mysql> explain select * from user --> where user_name='"Amy"'\G ****************   1. row ****************** id: 1 select_type: SIMPLE   table: user   partitions: NULL   type: ref possible_keys: idx_username key: idx_username key_len: 131   ref: const   rows: 1 filtered: 100.00 Extra: NULL 1 row  in set, 1 warning (0.00 sec)

mysql> ALTER TABLE user  ADD user_name varchar(128) --> GENERATED ALWAYS AS (jsn_extract(data,'$.name')) VIRTUAL; Query OK, 0 rows affected (0.01 sec) Records: 0 Duplicates: 0 Warnings: 0
mysql> select user_name from user; +----------------------+ | user_name | +----------------------+ | "Amy"  | | "David" | +----------------------+ 2 rows in set (0.00 sec)
mysql> alter  table user  add index idx_username (user_name); Query  OK, 2 rows affected (0.01 sec) Records: 2 Duplicates: 0 Warnings: 0

17 
· like  `%ABC%' · 

18 

MySQL 5.5
MyISAM 

MySQL  5.6
InnoDB 

MySQL  5.7
 n--gram  parser

19 

mysql > CREATE TABLE articles   (
FTS_DOC_ID BIGINT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY, title VARCHAR(100), FULLTEXT INDEX ngram_idx(title) WITH PARSER ngram ) E  ngine=InnoDB CHARACTER SET utf8mb4; Query OK, 0  rows affected (0.06 s  ec)

mysql> # ALTER TABLE articles ADD FULLTEXT INDEX ngram_idx(title) WITH PARSER ngram;

mysql> INSERT INTO articles (title) VALUES (''); Query OK, 1  row affected (0.01 sec)

mysql> SET GLOBAL innodb_ft_aux_table="test/articles";   Query OK, 0  rows affected (0.00 s  ec)

mysql> SELECT * FROM INFORMATION_SCHEMA.INNODB_FT_INDEX_CACHE;

+------------------------+----------------------------------------+----------------------------------------+--------------------------------------+------------------------+------------------------------+

| WORD     | FIRST_DOC_ID | LAST_DOC_ID | DOC_COUNT | DOC_ID | POSITION |

+------------------------+----------------------------------------+----------------------------------------+--------------------------------------+------------------------+------------------------------+

|  |

1

|  |

1

|  |

1

|1 |1 |1

|1 |1 |1

|1 | 0 | |1 | 3 | |1 | 6 |

+------------------------+----------------------------------------+----------------------------------------+--------------------------------------+------------------------+------------------------------+

20 
· 
· PostGIS · MongoDB

21 
· InnoDBGIS · InnoDBSpatial   Index · GeoHash · GeoJson · GIS

22 
16/3225000+   QPS  VS  5000  QPS

23 
·  ·  ·  · InnoDB

24 Group  Replication

MySQL  Group  Replication
writeset corosync

MySQL InnoDB Certification

write read

Application

write read

MySQL Certification InnoDB

write read

writeset corosync

MySQL InnoDB
Certification

writeset corosync

InsideMySQL 

 


ORA



Oracle

z3 ­ SQL

zData ­ 

BayMax

 

Thanks
@ |    InsideMySQL

