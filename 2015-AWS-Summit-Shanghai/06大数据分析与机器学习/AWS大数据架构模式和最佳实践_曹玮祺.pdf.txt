AWS
  AWS   weiqicao@amazon.com











· 

· 

· 

· 

·  · 


Cassandra

EMR

S3

DynamoDB

SQS

Amazon Redshift

Amazon Glacier

RDS

ElastiCache

Amazon Kinesis

Kinesisenabled
app

Data Pipeline CloudSearch

Lambda

DynamoDB

ML

Streams





 / 



 / 

 / 



()  









Web



iOS

 Android



Logstash



A





 








· 
­  (OLTP) ­ 
· 
·  ·
· 
­ (/var/log) ­ 
·
­  ­ IoT







File Storage Search SQL NoSQL Cache




Web



iOS

 Android



Logstash




Amazon ElastiCache
Amazon 
DynamoDB
Amazon RDS
 Amazon
ES

A

 Amazon



S3 

Amazon

Glacier

Stream Storage



Apache Kafka
Amazon Kinesis
Amazon DynamoDB


· AWS 
· Amazon Kinesis   · DynamoDB Streams  + · Amazon SQS   · Amazon SNS  /
· 
· Apache Kafka  


?
·  ·  · 

·  · MapReduce · 

1 2 3 N

4321
4321
4321
Key = Violet
4321

DynamoDB Stream Kinesis Stream Kafka Topic
44332211
Shard 1 / Partition 1
44332211
Shard 2 / Partition 2

1
Count of Red = 4
Count of Violet = 4
2
Count of Blue = 4
Count of Green = 4

?

Amazon Kinesis

DynamoDB Streams



Yes

Yes



Yes

Yes



 

    MapReduce  

7  3   Yes Yes 1MB 

24  3   Yes Yes 400KB (table cost)

Amazon SQS Kafka
Amazon SNS

Yes

No

No

Yes

 

14  3   No (SQS) No 256KB -

  ~  Yes Yes   (+admin)







File Storage Search SQL NoSQL Cache




Web



iOS

 Android



Logstash




Amazon ElastiCache
Amazon 
DynamoDB
Amazon RDS
 Amazon
ES

A

Amazon

S3



Amazon

Glacier

Stream Storage



Apache Kafka
Amazon Kinesis
Amazon DynamoDB

 

Amazon S3?
· (Spark, Hive, Presto, etc.) · (HDFS) · Hadoop & Amazon EC2 Spot  · (Spark, Hive, Presto) ·  ·  ­  ·  ­ AZ · 99.999999999%  ·  (Standard, IA, Amazon Glacier)  Life-cycle  ·  ­ SSL, / · 

HDFS & Amazon Glacier
· HDFS  () 
· Amazon S3 
· Amazon S3 ­ IA 
· Amazon Glacier  







File Storage Search SQL NoSQL Cache




Web



iOS

 Android



Logstash




Amazon ElastiCache
Amazon DynamoDB
Amazon RDS
Amazon
ES

A

Amazon

S3



Amazon

Glacier

Stream Storage



Apache Kafka
Amazon Kinesis
Amazon DynamoDB

 +  

 -- 

Cache Redis Memcached

 + 

Data Tier

NoSQL

SQL

Cassandra

Amazon Aurora

Amazon

MySQL

DynamoDB

PostgreSQL

HBase

Oracle

MongoDB

SQL Server

MariaDB

Search Amazon
Elasticsearch Service Amazon CloudSearch



?



·    JSON 

-

Put/Get (Key, Value)

? Cache, NoSQL

·    

Simple relationships  1:N, M:N NoSQL Cross table joins, transaction, SQL SQL

·  /   

Faceting, Search

Search

·   

 Fixed schema

? SQL, NoSQL

Schema-free (JSON)

NoSQL, Search

(Key, Value)

Cache, NoSQL

 / 

 / 

   
 /GB


Hot MB­GB B­KB ms ­
 $$-$


Warm GB­TB KB­MB ms, sec 
 $-¢¢

Cold



PB KB­TB min, hrs 

 ¢

?





Amazon

Amazon

ElastiCache DynamoDB

Amazon Aurora

Amazon Elasticsearch

Amazon EMR (HDFS)

Amazon S3


Amazon Glacier

 ms

ms

ms, sec

  

GB

GB­TBs GB­TB

(no limit) (64 TB

Max)

B-KB

KB (400 KB max)

KB (64 KB)

 ­  ( 



)

 GB/month 

$$

¢¢

 ­  

¢¢ 

ms,sec GB­TB

sec,min,hrs ms,sec,min hrs (~ size)

GB­PB (~nodes)

MB­PB (no limit)

GB­PB (no limit)

KB

MB-GB

(1 MB max)

KB-GB

GB

(5 TB max) (40 TB max)



 ­   ­  

(

)

¢¢

¢

¢

¢/10

















: Amazon S3  Amazon DynamoDB?

· " Amazon S3 ,1.5 TB..."

(Writes/sec) (Bytes)



(GB/month)



300

2048

1483

777,600,000

Amazon S3  
(/)
Amazon
DynamoDB? 300

  (Bytes) (GB/)

2,048

1,483

 777,600,000



Amazon DynamoDB

 1  2

 (/) 300
300



 (Bytes)
2,048





(GB/month)

1,483

777,600,000

32,768 23,730

777,600,000

Amazon S3

IoT














Web



iOS

 Android



Logstash



A








 SQL NoSQL Cache



Amazon ElastiCache Amazon DynamoDB
Amazon RDS Amazon
ES
Amazon S3
Amazon Glacier
Apache Kafka Amazon Kinesis
Amazon DynamoDB


   





 


Amazon ML Amazon Redshift
Impala
Pig
Streaming
Amazon Kinesis AWS Lambda

Amazon Elastic MapReduce



 / 

· 
­ / ­  ­ : 
· 
­  ­ 
 ­  ()
·  · : /
­  (-)
·  · : 1

· 
­ / ­  ­ : 

· 
­  
­  ­   "teach" 
·    (Yes/No) ·   ?
­   
·   


· 
­ Mahout, Spark ML, Amazon ML
· 
­ Amazon Redshift, Presto, Impala, Spark
· 
­ MapReduce, Hive, Pig, Spark
· 
­ -: Spark Streaming, KCL, Hive, Pig ­ : Storm, AWS Lambda, KCL





 


Amazon Machine Learning
Amazon Redshift
Impala
Pig
Streaming
Amazon Kinesis AWS Lambda

Amazon Elastic MapReduce

?
Spark Streaming Apache Storm Amazon Kinesis Client Library

AWS Lambda

 / 

~ Nodes

~ Nodes

~ Nodes

Automatic

 or  





Yes (Amazon EMR) Do it yourself


Amazon EC2 + Auto Scaling

 AWS managed



Single AZ



Multi-AZ

Multi-AZ



Java, Python, Scala Any language via Thrift

Java, via MultiLangDaemon ( .Net, Python, Ruby, Node.js)

Node.js, Java

Amazon EMR (Hive, Pig) ~ Nodes

Yes (Amazon EMR)
Single AZ
Hive, Pig, Streaming languages

Query Latency(Low is better)

High

?



Amazon Impala Redshift

Low

Low

Presto Low

Spark Low

 


High
1.6 PB Max Yes

High ~Nodes
Yes (EMR)

High ~Nodes

High ~Nodes

Yes (EMR) Yes (EMR)

Hive
Medium (Tez) ­ High (MapReduce) High ~Nodes
Yes (EMR)

 SQL 

Native High

HDFS / S3A* HDFS / S3 HDFS / S3

HDFS / S3

Medium

High

Low (SparkSQL) Medium (HQL)

Medium
Query Latency(Low is better)

High

ETL?



ETL



https://aws.amazon.com/big-data/partner-solutions/

 / 








Web



iOS

 Android



Logstash



A








 SQL NoSQL Cache


Amazon ElastiCache Amazon DynamoDB
Amazon RDS Amazon
ES
Amazon S3
Amazon Glacier
Apache Kafka Amazon Kinesis
Amazon DynamoDB

ETL

   







 


Amazon ML
Amazon Redshift

Impala



Amazon Elastic MapReduce


Pig

Streaming

Amazon



Kinesis

AWS Lambda

IDE Notebooks

 & 


Predictions
Amazon QuickSight
Apps & APIs


· 



· 

· Notebooks

· 

·  & API

ETL



Consume

Amazon QuickSight

 & 

 



IDE Notebooks

Apps & APIs







Web





iOS

 Android



Logstash



A










 SQL NoSQL Cache


Amazon ElastiCache Amazon DynamoDB
Amazon RDS Amazon
ES
Amazon S3
Amazon Glacier
Apache Kafka Amazon Kinesis
Amazon DynamoDB

ETL

   







 


Amazon ML
Amazon Redshift

Impala



Amazon Elastic MapReduce


Pig

Streaming

Amazon



Kinesis

AWS Lambda

IDE Notebooks

 & 



Amazon QuickSight
Apps & APIs


"Data Bus"
· 
· 











 



Amazon Kinesis S3 Connector



Amazon Kinesis

AWS Lambda

Amazon DynamoDB

Amazon S3

 (KCL, Storm, Hive, Spark, etc.)  
Amazon Kinesis S3 Connector



Amazon Kinesis

AWS Lambda

Amazon DynamoDB

Amazon S3

Storm

Hive

Spark


 



http://wefeel.csiro.au/#/
- 25 -

 & 
· 500M / = ~ 20.8M  / = ~ 5.8K /
· 2KB ~12MB/, ~1TB/6 
· $0.015/ $0.028/PUTS
· Kinesis $0.765/ · Redshift $0.850/
 ( 2TB dw1.xlarge) Total: $1.615/hour

AWS



 



 

 

 

  

 ­ 
·  ·  ­  ·  ·  ·  ·  · 



















CF()  SVD++ (Matrix Factorization w/ ALS)

(Canopy K-Means)   

(Decision Trees) (Linear Regression) (Logistic Regression) (Naïve Bayes) (Random Forest) (Hidden Markov Models) (Multilayer Perceptron)

AWS

 &



R Octave Matlab Excel DAS SPSS

KNIME WEKA Python Kits RDBMS SAN/NAS BigML

Graphlab
Mahout Spark MLlib
H20 0xData
Hbase HDFS Radoop Prediction.IO






· 

Amazon ML

   APISDK - Java, Python, .NET, JavaScript, Ruby, Javascript  AWS Mobile SDK iOS Android
Amazon
 Amazon  :  AWSS3Amazon RedshiftRDS MySQLIAM

       Amazon CloudWatch

 : $0.42/  : $0.10/1000  : $0.10/1000 <>

NetflixAWS
 

()
 

 ETL
NRT 


 
 




Amazon S3

 Web (Amazon CloudWatch)

Web 

 (EMR)

ETL (Amazon Elastic MapReduce)

Amazon S3

GNIP

Datasift

Other

Amazon CloudFront

   
AWS Elastic Beanstalk





Amazon



CloudSearch

Model Updates





 -- 
 



Create_Date First_Name Last_Name Title

Company

Phone

Email

Email_Option City Province Industry

Job

Attend_Act_1 Attend_Act_2 Member_Status

2014/10/9 Liang

Li

CEO

**Company *******0941 123456789@qq.com

1

Beijing Beijing Software & Internet Director

0

1

hot

2015/4/3 



 ** *******3545 wangxiaoliang@163.com 0

 

Telecommunications Developer / Engineer 1

0

cold





Create_Date First_Name Last_Name Title

Company

Phone Email

Email_Option City

Province

Industry

Job

Attend_Act_1 Attend_Act_2 Member_Status Account_Status

2014/10/9 Liang

Li

CEO

**Company

*******0941 @qq.com 1

BEIJING BEIJING

Software & Internet Director

0

1

hot

1

gong cheng

2015/4/3 xiaoming wang

shi

**you xian gong si *******3545 @163.com 0

SHENZHEN GUANGDONG Telecommunications Developer / Engineer 1

0

cold

0

 

S3

Machine

S3

Learning

RedShift

QuickSight







For  { For  data_i {



} }

Log

Amazon ML

 

· S3Amazon ML ·  · 



· N-Gram







· 

· 70%



· Amazon MLAUC ·  · 90%95%99%

 · S3Amazon ML





· 





· ID · S3

Amazon ML
1 String dataSchemaPath = "data/leadsInfo.csv.schema.txt"; // schemaschema 2 String recipePath = "data/recipe.txt"; // reciperecipe 3 4 AWSCredentials credentials = new ProfileCredentialsProvider("default").getCredentials(); 5 AmazonMachineLearning ml = new AmazonMachineLearningClient(credentials); 6 ml.setRegion(Region.getRegion(Regions.US_EAST_1));
7 CreateDataSourceFromS3Request createDataSourceFromS3Request = new CreateDataSourceFromS3Request(); 8 String id = "k3y0"; 9 createDataSourceFromS3Request.setDataSourceId("ds-SummitMLdemo-train-"+id); // id 10 S3DataSpec dataSpec = new S3DataSpec(); 11 dataSpec.setDataLocationS3("s3://bucketName/SummitMLdemo/leadsInfo-Structured.csv"); // S3 12 dataSpec.setDataSchema(ReadtoString.jsonStr(dataSchemaPath)); // schema 13 dataSpec.setDataRearrangement("{\"splitting\":{\"percentBegin\":0,\"percentEnd\":70}}"); // 70% 14 createDataSourceFromS3Request.setDataSpec(dataSpec); 15 ml.createDataSourceFromS3(createDataSourceFromS3Request); // Amazon ML 16 17 CreateMLModelRequest createMLModelRequest = new CreateMLModelRequest(); 18 createMLModelRequest.setMLModelId("ml-SummitMLdemo-"+id); // id 19 createMLModelRequest.setMLModelType("BINARY"); //  20 Map<String, String> modelParameters = new HashMap<String,String>(); 21 modelParameters.put("sgd.l2RegularizationAmount", "1.0E-03"); //  22 modelParameters.put("sgd.maxMLModelSizeInBytes", "1000000000"); //  23 modelParameters.put("sgd.maxPasses", "20"); //  24 createMLModelRequest.setParameters(modelParameters); 25 createMLModelRequest.setRecipe(ReadtoString.jsonStr(recipePath)); // recipe 26 createMLModelRequest.setTrainingDataSourceId("ds-SummitMLdemo-train-"+id); // id 27 ml.createMLModel(createMLModelRequest); // 



100%VIP 90%99%VIP 51%95%VIP 45%90%VIP
0



 VIP

2345 2322 2228 2111

3842 3436

7593 6875

31% 34% 58% 61%

1000

2000

3000

4000

5000

6000

7000

8000

 VIP

VIPVIP

3000 2500 2000 1500 1000 500
0

0.0 - 0.1 - 0.2 - 0.3 - 0.4 - 0.5 - 0.6 - 0.7 - 0.8 - 0.9 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

VIP VIP



AWS 
Amazon Kinesis  DynamoDB Streams  Amazon SQS  Amazon SNS

AWS" "
AWS Lambda

AWS 
Amazon Elasticsearch Service

