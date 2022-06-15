
Introduction to Big Data Platform Security

Jazz Yao Tsung Wang
<http://about.me/jazzwang>

2016/7/12

CSA Summit 2016

1

About Me

·  Jazz Wang ·  / ·  Etu Manager  ·  TenMax Data Architect · Hadoop.TW  · HadoopCon  · Hadoop The Definitive Guide  · Hadoop Operations  ·  /  /  · http://about.me/jazzwang - slideshare, github, etc.

2016/7/12

CSA Summit 2016

2

Agenda
· 
· 
· 
·  High Availability (HA) ·  Disaster Recovery (DR) ·  Authentication ·  Authorization ·  Auditing ( Accounting ) ·  Encryption
· 
· 

2016/7/12

CSA Summit 2016

3

Gartner Hype Cycle 2014
  





Internet of Things Big Data Cloud Computing

2016/7/12

CSA Summit 2016

4

Gartner Hype Cycle 2015
  





Internet of Things
" Hybrid '' Cloud Computing

AR VR

2016/7/12

CSA Summit 2016

5

Big Data  !!

· Internet of Things (  ) · Business Intelligence and Analytics (  ) · Enterprise Architecture · Web-Scale IT · Digital Banking Transformation (  ) · Utility Industry IT · CRM Customer Service and Customer Engagement · CRM Marketing Applications · Digital Commerce (  )
6

 Big Data 

    

2016/7/12

 
 
 

 

 

SMAQ



 

 

 Open Data

CSA Summit 2016

7

2016 ""

2016/7/12

CSA Summit 2016

8

 Big Data 

 .....

  Innovators



 

 

 

  Early Adopters
 Early Majority "" ""

2016/7/12

CSA Summit 2016

9

Big Data  

·  ?? ( Value )  ?? (  or  )
·  ?? ??  ??  ?? ( Variety )
·  ??  ?? ( Legality )
·  ??  ??  ?? ( Volume , Veracity )
· / ­   ( Velocity )
·  (  ROI ??  KPI  ?? )  ( Validation , Roadmap )

2016/7/12

CSA Summit 2016

10


 People

 


Engineer ()

Network

System

Programmer

DBA

Analyst

Decision

()

Admin

()

()

()

Maker

  Process

        



      

 

  Technology

    Log  HTML
 XML, Json

Flume



Scribe

HDFS

syslog

Fluentd

HBase

FTP

Sqoop

File Input / Output Format
FS Shell
Web HDFS
Thrift
Java API

Map Reduce
Pig Mahout
Oozie

Hive (Cold)
Impala (Warm)

Mobile App

2016/7/12

CSA Summit 2016

11

...

http://www.ithome.com.tw/news/101577

2016/7/12

CSA Summit 2016

12

Agenda

 

· 
· 
· 
·  High Availability (HA) ·  Disaster Recovery (DR) ·  Authentication ·  Authorization ·  Auditing ( Accounting ) ·  Encryption
· 
· 

2016/7/12

CSA Summit 2016

13

 High Availability (HA)

·  Big Data Platform  · 

 
   ODBC 
Schema     

CDH 4.7

 Cloudera Manager

2014/12

Key Trustee KMS

Cloudera Navigator Key Trustee Server
Hue

Llama / Impala

HiveServer2

Hive Metastore

Oozie

Solr ( Search )

MRv1 / YARN

V

HBase

HDFS

V

CDH 5.2
2015/9
V V V V V V V

CDH 5.3
2015/10
V V V V V V V

CDH 5.4
2015/11
V
V V V
V V V V V V

CDH 5.7
2016/06
V V
V
V ?
V V V V V V V

2016/7/12

CSA Summit 2016

14

 High Availability (HA)
· 
· -- ·  -- 
( 10  vs 38  ) · 
 AAA  Encryption !
· 
·  ·  · 


2016/7/12

CSA Summit 2016

15

!! 

·  · HDFS Balancer · YARN JobHistory Server · Impala StateStored · Impala Catalog Server · Spark History Server
· !!  API 
  10 

2016/7/12

CSA Summit 2016

16

 Disaster Recovery (DR)

· () · 
·  State Machine !!
· HDFS  Journal Node  · MRv1/YARN  HDFS  · HBase  HDFS  · ?? Hive Metastore  ??
Cloudera Manager ?? Oozie  Metastore ??
· :
·  Active-Standby  A-A  ·  · 

2016/7/12

CSA Summit 2016

17

 Disaster Recovery (DR)
·   (  ) · 
· Cloudera Backup and Disaster Recovery ( BDR ) ·  HDP  Azure
· BDR 
· Metastore () · HDFS 

https://0x0fff.com/hadoop-cluster-backup/

2016/7/12

CSA Summit 2016

18

Hadoop 
· Hadoop Security 
· Authentication ­  · Authorization ­  · Auditing ­  · Encryption ­  (?)
·  Spark ?? ....
· Authentication ­ 1.3  Kerberos
https://issues.apache.org/jira/browse/SPARK-5493
· Authorization ­  Spark SQL column-level  · Auditing ­ ?? · Encryption ­ 
https://issues.apache.org/jira/browse/SPARK-5682

2016/7/12

CSA Summit 2016

19

 Authentication

·  Kerberos

CM

CN

HDFS

MRv1 YARN Flume HBase

HCat olog

Hive Server
2

HiveS erver

Hue

Impala

Llama

Oozie

ZooK eeper

 

simple

Data base

V

Open LDAP

V

AD

V

LDAPS

V

Kerberos V


V V V V

 V
V

 V
V

 V
V

 V
V

 V
V

 V
V

 V
V V V V

 V
V



*



V

V

V

V

V*

V

V*

V*

V

V

V

 V
V

 V
V

External Program

V

SAML

V

OpenID

Oauth

2016/7/12

CLASS

V V V

CSA Summit 2016

20

 Authentication
· 
·  Kerberos  ·  Kerberos  ·  Kerberos 
· AD/LDAP
·  Data Warehouse Offload   Hive / Impala  SQL on Hadoop 
·  API Server 
Application Server

HDFS

HBase

Hive

Impala

Spark

2016/7/12

CSA Summit 2016

21

 Authorization
· 
· Apache Sentry or Apache Ranger · Role-Based Access Control · Fine-grained access control ­  column-based  · Unified Authorization

2016/7/12

CSA Summit 2016

22

 Auditing ( Accounting )
· 
·  Audit Log  · Cloudera Navigator · Apache Ranger Audit Framework

2016/7/12

CSA Summit 2016

23

 Encryption
·  · 

2016/7/12

CSA Summit 2016

24

Agenda
· 
· 
· 
·  High Availability (HA) ·  Disaster Recovery (DR) ·  Authentication ·  Authorization ·  Auditing ( Accounting ) ·  Encryption
· 
· 

2016/7/12

CSA Summit 2016

25

Data Governance



 

 

 

· !! · Data Governance
Data governance is a control that ensures that the data entry by an operations team member or by an automated process meets precise standards, such as a business rule, a data definition and data integrity constraints in the data model.
· Apache Atlas
http://atlas.incubator.apache.org/

2016/7/12

CSA Summit 2016

26


 Open Source   

2016/7/12

CSA Summit 2016

27


· 
·  Security  Hadoop  Enterprise Software !!
· 

2016/7/12

CSA Summit 2016

28

Q & A

JAZZWANG.TW  GMAIL  COM

2016/7/12

CSA Summit 2016

29

