AWS
AWS 


·  ·  ·  ·  ·  · 






App optimization Scaling
High availability Database backups DB software patches DB software installs
OS patches OS installation Server maintenance Rack and stack Power, HVAC, net

EC2
App optimization Scaling
High availability Database backups DB software patches DB software installs
OS patches OS installation Server maintenance Rack and stack Power, HVAC, net


App optimization Scaling
High availability Database backups DB software patches DB software installs
OS patches OS installation Server maintenance Rack and stack Power, HVAC, net

LJ1
LJ2
AWS

Relational

Cache

Amazon RDS
 Amazon AuroraMySQLPostgreSQL OracleSQL ServerMariaDB

Amazon ElastiCache
RedisMemcached Data Warehouse
Amazon Redshift

NoSQL
Amazon DynamoDB
 DocumentKey-Value

PB Database Migration
AWS Database Migration Services


 6 LJ1 LJ2


Li, Justin, 2015/12/3

Li, Justin, 2015/12/3

Amazon RDS


LJ3
Amazon RDSSQL


 AWS AWS RDS   API 


 32  vCPU  244 GiB  30000 IOPSSSD 


 

AZ 


VPC  Amazon RDS  



 8 LJ3

AZ
Li, Justin, 2015/12/3

Amazon RDS

LJ4
Amazon RDS
· (SSD)
­ 3IOPS/GB,3000IOPS
· IOPS(SSD)I/O 
­ 100030000IOPSI/O
Amazon RDS   Amazon RDS 

 10 LJ4

IOPS&
Li, Justin, 2015/12/3

LJ5
Amazon RDS
· 
­ 35
· 
­ S3 
­ 
RDSRead-Replica Read Replica

 11 LJ5


Li, Justin, 2015/12/3

LJ6
Amazon RDS for Aurora

Amazon Aurora: 

 MySQL   99.99% VPC

 MySQL  5  (10GB - 64TB) 1/10

 12 LJ6

AMAZON/MSFT/ORACLE  
Li, Justin, 2015/12/3

Amazon Aurora: 

· 36
·  64TB
· 15Aurora 

AZ 1

AZ 2

AZ 3

Virtualized, cross-AZ storage layer

LJ7
LJ1L1J8Oracle RAC on EC2 LJ9 LJ10 J1
i2.8xlargeNAS6.4TB SSD Ntop N2NVPNPlacement Group

 14 LJ7 LJ11 LJ8 LJ9 LJ10 J1

BYOL
Li, Justin, 2015/12/3
 
Li, Justin, 2015/12/3
MigrateSAP/Oracle ERP
Li, Justin, 2015/12/3
Oracle RAC
Li, Justin, 2015/12/3

Li, Justin, 2015/12/3
Oracle RAC
JUSTIN, 2015/12/6

Amazon DynamoDB
 NoSQL 

LJ12
LJ1A3 mazon DynamoDB NoSQL 


Amazon DynamoDB  SSD  


 AWS Lambda  


 AWS  Amazon DynamoDB API  

 


IAM

 NoSQL   

 16 LJ12 LJ13

NoSQL
Li, Justin, 2015/12/3
/
Li, Justin, 2015/12/3

DynamoDB: 
  =  x 1KB  * =  x 4KB  * 

·: ¥ 0.058  10  ·: ¥ 0.058  50 

· GB ¥ 2.20

Amazon ElastiCache


Amazon ElastiCache: 

·  · 
 ·  · 

ElastiCache

Amazon ElastiCache: MemcachedRedis
ElastiCache  Memcached   Memcached  
ElastiCache / 

Amazon Redshift
 PB 

LJ15
Amazon Redshift: 

· PB · 
­ 
· 

Redshift

 22 LJ15


Li, Justin, 2015/12/3

Amazon Redshift: 

· Traditional enterprise DW
·   
·  
·  

· Companies with big data
·  
·  
·  

· SaaS companies
· 
·  
·  

Amazon Redshift: BIAWS

PostgreSQL JDBC/ODBC

BI

Leader node

Compute nodes

Amazon S3 Amazon DynamoDB
Amazon EMR AWS Data Pipeline

Amazon Redshift: I/O









LJ16
Amazon Redshift: /

vCPU



dc1.large

2

dc1.8xlarge

32



ds2.xlarge

4

ds2.8xlarge

36

ECU
7 104
14 116

 (GiB)



I/O  

15

0.16TB SSD 0.20GB/s

1-32

244

2.56TB SSD 3.70GB/s

2-128

5.12TB 320TB

31

2TB HDD 0.40GB/s

1-32

244

16TB HDD 3.30GB/s

2-128

64TB 2PB

 26 LJ16

Highlight 
Li, Justin, 2015/12/3

AWS Database Migration Services


LJ17
AWS Database Migration Services

AWS Database Migration
Service

  

 28 LJ17

Freedom 
Li, Justin, 2015/12/3

LJ18

 29 LJ18


Li, Justin, 2015/12/3

