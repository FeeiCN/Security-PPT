Amazon Redshift
 AWS


· Redshift ·  ·  ·  ·  ·  · AWS

Redshift
Amazon Redshift

  
PB
 (MPP)
 (SQL)


Redshift 

· 
­ SQL Endpoint ­  (metadata) ­ 
· 
­  ­  ­  S3  ­  DynamoDBEMRSSH

· 
­ DS1DW1­ HDD2TB  2PB
­ DS2 - HDD2TB  2PB
­ DC1DW2­ SSD160GB  326TB

SQL/BI
JDBC/ODBC
 10 GigE (HPC)


  





Redshift
· slices
­  ­ DS1 ­ XL2 , 8XL 16 ­ DS2 - XL 4  8XL 36 ­ DC1 ­ L2, 8XL 32
· CPU 
·  

Leader Node

Redshift 

ID

Age State Amou

nt

123 20

CA

500

345 25

WA 250

678 40

FL

125

957 37

WA 375

Redshift
https://amplab.cs.berkeley.edu/benchmark/

AWS 

 ||


   
Kinesis


DynamoDB
NoSQL

Hadoop EMR

S3 

Redshift


BI 
QuickSight

Glacier 

Redshift 
 (OLAP)
P 
 (OLTP)
O 
RDSDynamoDB  
O Redshift
(EMR  MapReduce)

RedShift 




·  COPY  ·  · 
 ·  6.25MB/s
100MB/s


·  COPY  · 
 · 16,
 · 100MB/s;


manifest
· Redshift 
­  Redshift  ­ DML 
· manifest 
­ S3 JSON manifest  ­ 

sort/dist key
· Redshift 
· Sort/Dist 


· 
· Redshift
­  100,000 
· ETLStaging 
­ analyze compression ­ DML


·  ,  
·  
·  


· Analyze
·  ·  · SVV_TABLE_INFO(stats_off) 
 ·  stl_alert_event_log 
· Vacuum
·  · unsorted  · SVV_TABLE_INFO(unsorted, empty) · unsortedDeep copy
 (20% unsorted deep copy)




·  "select *" · CASE  ·  (" " ) ·  · 


·  ("LIKE" ) ·  ·  () ·  group by 



(Sort Key)
· ?  ·  ?  ·  ?  · ? 

Distribution style
·  ·  ·  ()  ALL · EVEN  (
 ) · NULL


·  (Redshift  )
· Redshift  (, )


· : UNION ALL  · :
­  ( ) ­ Vacuum
· :
­ 



UDF
· Python 2.7UDF · PostgreSQL UDF 
­ UDF
·  Pandas, NumPy, SciPy 
­ 

UDF ­ URL 
CREATE FUNCTION f_hostname (VARCHAR url) RETURNS varchar
IMMUTABLE AS $$ import urlparse return urlparse.urlparse(url).hostname
$$ LANGUAGE plpythonu;



cust_id prod_id other columns
11 12 13 14
21 22 23 24
31 32 33 34
41 42 43 44

blocks

prod_id

1 cust_id

2

3

4

1 [1,1] [1,2] [1,3] [1,4]

2 [2,1] [2,2] [2,3] [2,4]

3 [3,1] [3,2] [3,3] [3,4]

4 [4,1] [4,2] [4,3] [4,4]

· Redshift 
· 4
· cust_id  
· , prod_id  

Interleaved Sort Keys

cust_id prod_id other columns
11 12 21 22
13 14 23 24
31 32 41 42
33 34 43 44

blocks

prod_id

1 cust_id

2

3

4

1 [1,1] [1,2] [1,3] [1,4]

2 [2,1] [2,2] [2,3] [2,4]

3 [3,1] [3,2] [3,3] [3,4]

4 [4,1] [4,2] [4,3] [4,4]

· cust_id  
· prod_id  
· key 


[[ COMPOUND | INTERLEAVED ] SORTKEY ( column_name [, ...] ) ]
·  `INTERLEAVED' 
­  ­ 8
· 



ETL/ELT
·  , · Update ·  ·  ·  · 

Redshift
· Updatedelete + insert
­ Delete
· Commit
­ 8XL 4GB ­  ­ 

Redshift
·  ·  · Redshift · WLM Session, 
 ·  · Distkey, Sortkey 


· https://github.com/awslabs/amazon-redshift-utils
· 
­ 
· 
­ Schema DDL
· 
­ Schema
· ANALYZEVacuum
­ VACUUM ANALYZE
· Unload Copy 
­ Redshift


· SVV_TABLE_INFO · STL_COMMIT_STATS · STL_ALERT_EVENT_LOGS · STL_WLM_QUERY

AWS

Mobvista: 

Tracking.co m



Route 53

· 6000

40



mysql

1



S3



· ,  

·  mysql

RedShift

RDS



S3

EMR

Mobvista: Redshift



1.   2. 

3. 

· 8dc1.large · 1
10G 20-30G · 60
·  
·  10 , 30-60

4.  PostgreSQL, ODBC,


Create table as update query join

1.8
 3  


3 90 5 

SuperCell - Clash of Clans 

 

Kinesis

EC2:  Kinesis 

S3:  
EC2:  

Redshift

NTT DOCOMO 



ETL

Client

S3

Forwarder
State Management

Loader

Direct Connect

Redshift

Sandbox

· PBRedshift · AWS · VPCVPN CloudTrail


