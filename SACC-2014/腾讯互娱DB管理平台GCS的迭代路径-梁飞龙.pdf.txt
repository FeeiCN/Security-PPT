DBGCS
tencent dba felixliang
hugefelix@vip.qq.com | felixliang@tencent.com

agenda
·  · Services Window · GCS 1.X ­ 3.X
­ GCS1.0  ­ GCS2.0 MySQL ­ GCS3.0 
· GCS 4.X · Q&A



DB 
-  - 
- I


-  -  - Innodb
 II


-  - 
 III

 ­ 1 
· 
250+(+)10000+20000+ 690SQL/2SQL5001000
· DBA

 ­ 2 
· 

 ­ 2
· 

 ­ 3
· 2/3 · DB

Services Window
· 1
­ InterfaceDB ­ DB ( 90% )

Services Window

· 

 

N 

Y

N
DBA 

Y
 



Services Window
· 

GCS 1.X ­ 3.X
· 2-3
­ GCS 1.0  ­ GCS 2.0 MySQL
·  · (blob/text) · tmysqlparse
­ GCS 3.0 
· CPU/MEM/IO ·  · 

GCS 1.X ­ 3.X ­ GCS

GCS 1.X ­ 3.X ­ GCS1.0 
· checksum
­ chunk-size-exact""
5000Mchunk-size=10M 15(id>=0 and id < 20)5001 (id=10000000)

GCS 1.X ­ 3.X ­ GCS1.0 
· mysql-proxy admin
­ refresh_backends,refresh_users ­ show processlist,refresh_connlog
· GM
­ checkmysqlcheckssh ­ Double check | Slave StatusChecksumTime Delay ­ MSSQLRedis

GCS 1.X ­ 3.X ­ GCS1.0 
· 
­ 52% ­ 60S

GCS 1.X ­ 3.X ­ GCS2.0 MySQL
· TMySQL https://github.com/TencentDBA/TMySQL





TMySQL 1.1 

TMySQL 1.2  BUG

TMySQL 1.3

(In-Place) Upgrade   

TMySQL 1.4

SqlParse Binlog innodb


MySQL
Valgrind glibc tcmallocTMySQL 5mysql bugs15mysql bugs
MySQL5.0  TMySQL TMySQL Alter Log  A5 60% Z3 90%
OSS Binlog innodbmysqlcache


2012/12/10 2013/3/20
2013/6/6
2013/11/1

GCS 1.X ­ 3.X ­ GCS2.0 MySQL
· TMySQL
­ 12%-5% ­ TMySQLalter table tbl row_format=GCS;

GCS 1.X ­ 3.X ­ GCS2.0 MySQL
· TMySQL Innodb blob/text 
­  ­ C/C++ NULL   ­ DBA

GCS 1.X ­ 3.X ­ GCS2.0 MySQL
· TMySQL Innodb blob/text 
­ 
Create table t1 ( C1 int primary key, C2 blob compressed, C3 text character set gbk compressed, C4 blob
) engine = innodb row_format=GCS
­ 
Alter table t1 change c4 c4 blob compressed.
51G7.3G14.3%

GCS 1.X ­ 3.X ­ GCS2.0 MySQL
· TMySQL Innodb blob/text 

  QPS IO CPU

 51G 1174
100% 15%

row_format=compressed 24G 1524
100% 45%

BLOB 7.1G 3994 30% 50%

CPUIO

GCS 1.X ­ 3.X ­ GCS2.0 MySQL
· TMySQL Tmysqlparse

GCS 1.X ­ 3.X ­ GCS3.0 
· DB-Spider · CPU/MEM/IO · 

SpideSrpider

DB
4W 80%

DB
5k 10%

DB

DB

DB

1W 20%

DB

5kD10B%

DB1

6W40%

DB
2

DB
3

GCS4.X
·    
­ TMySQLMySQL 5.6 ­ MySQL
· 
­  ­ SQL
· Schema

GCS

GCS 4.X

GCS 3.0

GCS 1.0
· DBHA 
2012.12012.5
- mysql-proxy - DNS - 
GM - checksum - RedisMSSQL

GCS 2.0

· TMySQL Innodb
2012.52013.1
-  - Innodb - 
tcmalloc - 

· Spider
2013.12013.9
-  - DB - DB

· 
2013.9
- SQL - SQL

Q&A

1TMySQL

 





Facebook OSC
MySQL 5.6 DDL Online TMySQL



DDL 20%



DB Facebook





DDL 



GA





DDL Online

 5.6MySQL 





TMySQLOracle 11gMSSQL 2012

2Spider

 SPIDER
CDB+CBS
Fabric proxy


  
 (TSSD) CDB
    spider





  SQL  mysql

 release  

 mysql SQL CDBmysql 

 





 release

mysql5.6+





SQL 



