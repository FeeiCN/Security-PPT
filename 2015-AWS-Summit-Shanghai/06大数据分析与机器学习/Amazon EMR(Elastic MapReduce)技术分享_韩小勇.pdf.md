Amazon EMR(Elastic MapReduce)


EMR(Elastic MapReduce) - AWSHadoop

EMR





//





 


//


 


AWS

AWS

SDK :

......


Bootstrap
https://github.com/awslabs/emr-bootstrap-actions




 m1 m3


CPU c3 cc1.4xlarge cc2.8xlarge


 m2 r3

IO d2 i2

Spark 

HDFS






Core Node Task Node
SLA
 EC2

SLA
  80%

Amazon S3EMR

Amazon S3
· Amazon S3
­  ­ 99.999999999% 
· EMR 
· 
· 

EMRFSS3
· Read-after-write · EMRFS MetadataListing. · S3 ·  ­ / "s3://..."

HDFSAmazon S3

hive> create external table temp_user( firstname VARCHAR(64),

lastname VARCHAR(64),

address STRING,

country city state

VARCHAR(64), VARCHAR(64), VARCHAR(64),

web

STRING

) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

LINES TERMINATED BY '\n'

STORED AS TEXTFILE

LOCATION `sampledata/userrecord/';

HDFSAmazon S3

hive> create external table temp_user( firstname VARCHAR(64),

lastname VARCHAR(64),

address STRING,

country city state

VARCHAR(64), VARCHAR(64), VARCHAR(64),

web

STRING

) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','

LINES TERMINATED BY '\n'

STORED AS TEXTFILE

LOCATION 's3://hxyhivetest/userrecord/';

S3

EMRFS

EMRFSS3
()
Amazon S3
Key (AWS KMSKey)

EMRFS MetadataList s3 
· ListRead-after-write · list

Amazon S3

List  100 10

  () ()

147.72

29.70

12.70

3.69

*m3.xlarge.

EMRFS Amazon DynamoDB

HDFS
· 
­  ­ Spark&RDD
· I/O
- S3S3DistCpHDFS 

Amazon EMR


· 
­ Text ­ Sequence
·  ­ Avro
· Schema
· 
­ Object Record Columnar (ORC) ­ Parquet

  


· 
­ 100 MB · mapper,JVM
· 
­ Amazon S3 ­ Network/HDFS


· S3DistCP
­ S3DistCP ­ 


· S3 ­ S3EMR ­ 
· MapperReducer
Hadoop1, Amazon EMRLZO Hadoop2,Snappy


·  ·  · , gzip


gzip bzip2 LZO Snappy


   


 
 


   

Amazon EMR

 : 

GB S3

/

EMR ,Hive


250Amazon EMR, 30TB http://aws.amazon.com/solutions/case-studies/yelp/

: 

S3

ETL, HBase

7x24,  S3



: 

TB

S3

PrestoPB http://nflx.it/1dO7Pnt

: 

TB

 Amazon Kinesis

kinesis

AWS Lambda

Amazon EMR Amazon EMR Amazon EC2


· AWSSDKBootStrap 
· S3PrestoHiveSpark ·  · EC2EC2
· Cloud Watch1 mapper



: SparkTwitter

     

 S3  

Twitter Stream

S3 Spark streaming

Spark SQL

1. aws emr create-cluster

2. --region us-west-2 \

3. --name "Tweetalizer" \

4. --release-label emr-4.1.0 \

5. --applications 'Name=Zeppelin-Sandbox`

6. --ec2-attributes KeyName=bjskey, AvailabilityZone=us-west-2

7. --log-uri s3://spark/log \

8. --instance-groups \

9. Name=Master,InstanceGroupType=MASTER,InstanceType=m3.xlarge,InstanceCount=1 \

10. Name=Core,InstanceGroupType=CORE,InstanceType=r3.2xlarge,InstanceCount=3 \

11. Name=Task,InstanceGroupType=TASK,InstanceType=r3.2xlarge,InstanceCount=3,\

12.

BidPrice=0.3 \

13. --Steps

Name=S3Copy,Jar=s3://elasticmapreduce/libs/script-runner/script-

runner.jar,\Args=["/usr/bin/aws,s3,cp","s3://spark/xx.jar",/home/hadoop/lib/jarfile] \

Type="Spark", Name="tweetalizer",ActionOnFailure=CONTINUE, Args=["--master","yarn","--class","org.spark.PopularHashTagsCounter","/home/hadoop/lib/"]

ScalaSpark
Spark Streaming
rdd.saveAsTextFile("s3://sparkdevtest/output")
Spark Sql
val lines = sc.textFile("s3://sparkdevtest/output")



3Amazon EMR 
Hadoop Mapreduce, HDFS, Spark, Hive, pig, Hue, Zeppelin, Impala, Presto, Oozie

EMRAWS 1 
S3. ,   (119)

Amazon EMR  
  SDK

