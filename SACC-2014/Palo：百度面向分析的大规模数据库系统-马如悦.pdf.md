Palo: a MPP-based Interactive Data Analysis SQL DB
maruyue@baidu.com Tel: 15810293784 2014.9.17

· Palo · Palo · Palo ·  · Palo




· OLTP vs. OLAP · Operational system vs. Data warehousing · Transactional database vs. Analytic database · Implementation Architecture
­ Data Engine = Function Engine(Storage Engine) ­ MySQL: Querying Engine over Storage Engine ­ Hadoop: MapRed over HDFS

OLTP
· SQL DB(MySQL),NoSQL DB(MongoDB), NewSQL DB(Spanner) · High Concurrency, Strong Consistent, Transactional · Function: CURD(CreateUpdateReadDelete)

Reporting

OLAP

Multidimensional Analysis

Text Analysis

Data Mining

SQL DB

Search DB

Mining DB

Single
(infobright)

Shared-disk
Oracle RAC, Exadata

MPP
Teradata, Greenplum

MR
Hadoop,Hive

RDD
Spark

· High Throughput(  ) · Function: Read(queryanalysismining) · Batch Data Processing vs. Interactive Data Analysis · SQLDB(Impala+hdfs,Mesa), SearchDB(ElasticSearch), MiningDB(R+?, Julia+?) · Palo: a MPP-based Interactive Data Analysis SQL DB · Palo,a Google Mesa Clone,is simpler and better than Mesa.

Batch Data Processing vs. Interactive Data Analysis
Interactive Batch

Big Data Lambda Architecture ­ Storm author

OLTPOLAP

1977

1979

1983

1984

1987 1989

2005 2009 2010 2011 2012 2013

Oracle 2 Oracle
IBM DB2

PostgreSQL 1.0 Sybase ASE

First Public Release

SQL Server 1.0

Exadata V1

Greenplum Bizgres
ParAccel

EMC

Amazon Redshift

SAP 58

Vertica

HP HAVEn

SQL Server PDW

SAP HANA 1.0



OLAP VerticaVectorwiseParAccellExasol2010SAP 58SybaseIT


Netezza Greenplum Vertica Aster Data ParAccel


2000 Netezza TwinFin
2003 Greenplum Database
2005 Vertica Analytic Database
2005 nCluster
2005 PADB


   FPGA
  +   Shared-Nothing
   Shared-Nothing
 SQL-MapReduce  Shared-Nothing
  +   Shared-Nothing


2010920IBM17.8  201076EMC3  20112HP3.5
201176EMC2.63  2013Actian1.5 RedshiftParAccel

  


    



 automatic fail over

 

  10
 



 10

 ive Analysis of Web-Scale Datasets (Google 2010)
mplementation On The MapReduce Framework (Google 2011) essing a Trillion Cells p er Mouse Click (Google 2012)

· Palo · Palo · Palo ·  · Palo





· 


- 




1/10 ~1/100 Cost

99.9999 % Uptime

100~200 / 1000 TB

10W QPS/ 100GB/s


10 TB / Hour



MySQL Tools (MySQL Networking)

Palo-FE (Leader, Java)

Palo-FE (Follower, Java)

Palo-FE (Follower, Java)

Palo-FE (Observer, Java)

Palo-BE (C++)

Palo-BE (C++)

Palo-BE (C++)

Palo-BE (C++)

· Palo · Palo · Palo ·  · Palo



Frontend Metadata Management

· State Machine + Replicated Log
· Raft
Log Replicating

Leader

Followers

Observers

Metadata In MEM

Checkpoint.10 Checkpoint.13

LOG.11 LOG.12 LOG.13 LOG.14

Metadata In MEM

Checkpoint.10 Checkpoint.13

LOG.11 LOG.12 LOG.13 LOG.14

Metadata In MEM

Checkpoint.10 Checkpoint.13

LOG.11 LOG.12 LOG.13 LOG.14

MySQL Networking Protocol

MySQL Tools (MySQL Networking)

Palo-FE (Leader, Java)

Palo-FE (Follower, Java)

Palo-FE (Follower, Java)

Palo-FE (Observer, Java)

Palo-BE (C++)

Palo-BE (C++)

Palo-BE (C++)

Palo-BE (C++)

MySQL Client MySQL Proxy
MySQL Protocol Layer Frontend
       MySQLMySQL Proxy

Tableau

R

Elastic Range Partition
· Hash Partition · Elastic Range Partition

Tablet1

Tablet2

Tablet3

Tablet4

Tablet5

Palo Storage Design

Keys

ValuesSum, Replace

Values

Base Rollup
Google Mesa Paper

Delta

Google Mesa Paper

Palo Storage Format ­ 

· 



­ 256 ­ 

company= &date=20140305

­ 

· 

­ 

­ 

­ key ­ short key



Palo Storage Format ­ 

w w w .gbase.cn

 

 I/O

 

 

GBase 8a 

GBase 8a 

 Palominmaxsum
4.3.2.I/O

a (date) 100101 100101, 100102 100102 100103

b (int) 8, 10
5, 25
30, 50 1, 5

c

d

e

...

...

...

True =  

...

...

...

Possible =  

...

...

...

False =  

...

...

...

100101, 100101
100101, 100102

8, 10, 600000
5, 25, 1155261

{min, max, sum, ...}
600000 +
24351

b

select from

a sum(b) as b mytab

where

a<='100101'

group by a order by b desc

  I/O 

 mytab abcde GBase 8a  GBase 8a 


· FE LeaderSYNC · Partition Pruning · Partition Pruning() · Sorted · Rollup · Delta


·  ·  · 


·  ·  ·  ·  ·  · 

In-Database Analysis










· UDF · UDAF · UDTF


· MVCC · Schema Change/Create Rollup/Data Recovery · Shared-nothing,MPP ·  · Hadoop

TODO 


SQL-DAG & Multi-SQL


//  mt create memtable mt as select * from table1 where url = "http://test.com"; // pv select province, sum(pv) from mt group by province; // pv select browser, sum(pv) from mt group by browser;

  

llvm 

 ­ RMatlabPython 

ArrayMapStruct

user_id
101

user_tags
["" "IT"""]

select userid from user where user_tags contains (`', `IT');



Disk
K1 K2 K1 K2

TODO 


Column Group Storage Format


Disk SSD 

K3 K4

K1 K4 K3 K2

K3 K4

 K2 K1 K4 K3

K1 K2 K3 K4

K3 K2 K1 K4

K1 K2 K3 K4

K4 K3 K2 K1

· Palo · Palo · Palo ·  · Palo



Palo vs. Oracle Exadata

Exadata
 Shared-Disk    

Oracle Exadata

Oracle DBMS

Oracle DBMS

Oracle DBMS

Oracle DBMS

Infiniband

Exadata Software

Exadata Software

Exadata Software

Palo

 70 60 50 40 30 20 10 0

 Shared-NothingMPP  X86-64  
1/8Exadata Palo

Star Schema Benchmark
7 Exadata 

Palo vs. Amazon Redshift

Amazon Redshift
 Leader NodeSQL Compute Node
 copy 

Palo
 SQL 
  

 Leader Node

 

Palo vs. EMC Greenplum

EMC Greenplum

Palo

 Master





 MasterSQL





 Mirror



Master 

Master

Active/Passive Pair

Master  SQL  
fail over Master

Segment

Segment

Segment

Segment

segment

Segment

Palo vs. Teradata

Teradata

Palo

 Shared-Nothing CS
 100w  PS  

 Shared-Nothing 
 (5w?  PS  

Parsing Engine

Message Passing Layer

AMP #1

AMP #2

AMP #3

AMP #4

37

· Palo · Palo · Palo ·  · Palo




· Standalone · Cloud
­ Software as a Service ­ Public Cloud & Private Cloud

Palo-based Cloud Product ­ OLAP Engine
· http://factory.baidu.com/olapengine

· OLAP Engine Alpha ­ 2014.9 · BigQuery
(Palo 1)

· OLAP Engine Beta ­ 2015.5 · Redshift

Load Data

Admin Cluster

Use DB

(Palo 2)

· OLAP Engine GA ­ 2015.12
· Open Sourcing Palo and OLAP Engine ­ 2015~2016
· 
­ Palo 
­  

Q&A

