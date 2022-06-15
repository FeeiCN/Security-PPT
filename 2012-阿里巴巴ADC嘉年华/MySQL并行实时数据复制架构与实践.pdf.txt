MySQL 
 2012-7-3
1


· MySQL · DRC · DRC · DRC · DRC · DRC
2

MySQL
· Integrated Replication
­ Mysql Async ­ Mysql Semi-Async ­ Schooner Sync
· External Replication
­ GoldenGate ­ Tungsten ­ DRBD
3

MySQL

· 
­  ­  ­ DBAKBA
· 
­  ­  ­  ­ 

 · Slave · Statement Based Replication
 · Relay log corruption · Crash safe replication  · Statement Based Replication: UUID() · Fix inconsistencies
 · ...

...

·...

4

· DRC
­ Data ­ Replication ­ Center



5

DRC
· DRC(Data Replication Center)   DRC-TAIRDRC-DUMP
· DRC
­  ­  ­ 
6

DRC


Binlog BinlogRecord
MetaData


BinlogReader BinlogParser
Writer WriterStrategy

7

DRC
· 


 











8

DRC
·  ·  · DDL

9

DRC

· Binlog

pk :
· pkn  · 1 13256796(99%) · 2-5 5590(0%) · 5-10 662(0%) · 10-20 211(0%) · 20-30 33(0%) · 30-40 4(0%) · 50-100 17578(0%)

tx :
·   · 1 9004792(87%) · 2-5 1191460(11%) · 6-10 96898(1%) · 10- 73536(1%)

 ( ):
·  
· 1-10% 7358632(55%) · 10-20% 3676699(28%) · 20-30% 73262(1%) · 30-40% 8092(1%) · 40-50% 1408991(10%) · 50-100% 794067(5%)

10

DRC
· 
­  ­ 
· mysql-bin.000001
­ Transaction ­ DDL ­ SNS
11

DRC

· TPS
­ TPS1MySQL AsyncDrc TPS
­ 5000TPS 

TPS   

MySQL Async 1236 / 711 100 195

Drc Dbsyncer 6867 / 128 0.06 0.51


a)  1.33 b) 

12

DRC
· 
­  ­  ­ DDL ­ 
13

DRC

· DDL

Binlog

Create table A1

Replication Checkpoint
C1

Create table A2

Insert into A2

Drop table A2

Restart from Checkpoint
C1
Replication Crash

C1

Table A2 

­ DDL

· MetaData

­ DDL

14


· 
­ ROW ­ RDS
· 
­ DUMP ­ TAIR
15


· DUMP
­  ­ 3(200)1 ­ DDL
16


  
17


· 
­ http://code.taobao.org/p/drc/src/ 2012
· 
­ http://www.taobaodba.com/html/category/
· 
­ 0 ­ 1377518358134407 ­ Emailjierui.lj@taobao.com
18

