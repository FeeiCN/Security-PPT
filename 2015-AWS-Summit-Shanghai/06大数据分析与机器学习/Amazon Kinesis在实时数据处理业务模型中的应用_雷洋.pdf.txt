Amazon Kinesis
 


·  · Amazon Kinesis · Amazon Kinesis ·  ·  · 



 = 

 / 
 


 

 / KPI 
 


 

App 











,  , 

  , ,  






· IT /  IT, , 
·  /  /  , 
· , ,  , , 
·  , , 


·  ·  ·  ·  ·  ·  · 

< 10  < 100  < 5 10 < 1  < 5  20  < 30 



·  ·  · 

 1 4 3 2 1

 2 4 3 2 1

 3  4

4321
Key = Violet
4321

·  · MapReduce · 

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

Amazon Kinesis


Aggregate and archive to S3

Front End

Millions of sources producing 100s of terabytes
per hour

Authentication Authorization

AZ

AZ

AZ

Durable, highly consistent storage replicates data across three data centers (availability zones)

A m azo n W eb S ervices

Inexpensive: $0.028 per million puts

Ordered stream of events supports multiple readers

Real-time dashboards and alarms

Machine learning algorithms or sliding window analytics

· KinesisTB · Kinesis

Aggregate analysis in Hadoop or a data warehouse

Amazon Kinesis 
Amazon Kinesis 
­ Amazon Kinesis Streams ­ Amazon Kinesis Firehose ­ Amazon Kinesis Analytics

Amazon Kinesis Streams

1.  2. Kinesis 3.  4. 
· : ShardStream, . · : Kinesis Client Library (KCL), Apache Spark/Storm,
AWS Lambda. · : .

Amazon Kinesis Streams
· StreamsShards · Shard1MB/
, 1000 / · Shard2 MB/ · 7 · Shards
Kinesis stream · 7

Amazon Kinesis Firehose
S3Redshift

 Firehose

Firehose  S3 Redshift

 

· : S3Redshift 

· : 60 
· : 

FirehoseS3
· Kinesis delivery streamS3 · Buffer Size / Interval S3
· Buffer size ­ 1 MB  128 MB · Buffer interval - 60  900  · Firehose  ·  · ()  · GZIP, ZIP, SNAPPY · S3Firehose · Amazon RedshiftGZIP

Kinesis FirehoseRedshift

· S3
1 · S3Redshift · S3

·
2·

Firehose S3 Redshift
RedshiftFirehose 

Kinesis StreamsFirehose
Amazon Kinesis Streams , Kinesis
Amazon Kinesis Firehose S3Redshift  , Firehose60 

Amazon Kinesis Analytics
SQL

Announcement Only!

Kinesis streams

SQL

Kinesis Analytics   

· SQL : SQL · : Amazon Kinesis Analytics

· : 

Amazon Kinesis 
     

Amazon Kinesis 

1. 
Put* APIs AWS SDK Kinesis Producer Library
LOG4J
Flume
Fluentd

2. 
Amazon Kinesis

3. /
Get* APIs AWS SDK
Kinesis Client Library +
Connector Library
AWS Lambda
Amazon Elastic MapReduce
Apache Storm Apache Spark

Amazon Kinesis 1: API

A: APIKinesis Stream

1. for (int j = 0; j < 10; j++) {

2.

// create a request object

3.

putRecordRequest pR = new PutRecordRequest();

4.

// specify stream

5.

pR.setStreamName( myStreamName );

6.

// wrap data

7.

pR.setData(ByteBuffer.wrap( String.format( "testData-%d", j).getBytes()));

8.

pR.setPartitionKey( String.format( "partitionKey-%d", j%5 ));

9.

pR.setSequenceNumberForOrdering( sn);

10.

// put data record

11.

putRecordResult pT = client.putRecord( putRecordRequest );

12.

sn = pT.getSequenceNumber();

13. }

B: APIKinesis Stream
1. List<Record> records; 2. while (true) { 3. //Create new GetRecordsRequest with existing shardIterator. 4. //Set maximum records to return to 1000. 5. getRecordsRequest getRecordsRequest = new GetRecordsRequest(); 6. getRecordsRequest.setShardIterator(shardIterator); 7. getRecordsRequest.setLimit(1000); 8. getRecordsResult result = client.getRecords(getRecordsRequest); 9. //Put result into record list. Result may be empty. 10. records = result.getRecords(); 11. try { 12. Thread.sleep(1000); 13. } catch (InterruptedException exception) { 14. throw new RuntimeException(exception); 15. } 16. // 17. shardIterator = result.getNextShardIterator(); 18. }

Amazon Kinesis 2: 

Producer on Amazon EC2

Amazon Kinesis

Kinesis-enabled Application

Amazon DynamoDB

Dashboard on Amazon EC2

Kinesis Client/Producer Library

· KCL/KPL
       Reshard  

KCL:

·

public class SampleRecordProcessor implements IRecordProcessor {

·

private static final Log LOG = LogFactory.getLog(SampleRecordProcessor.class);

·

private String kinesisShardId;

·

// Backoff and retry settings

·

private static final long BACKOFF_TIME_IN_MILLIS = 3000L;

·

private static final int NUM_RETRIES = 10;

·

// Checkpoint about once a minute

·

private static final long CHECKPOINT_INTERVAL_MILLIS = 60000L;

·

private long nextCheckpointTimeInMillis;

·

private final CharsetDecoder decoder = Charset.forName("UTF-8").newDecoder();

·

·

· 

·

https://github.com/aws/aws-sdk-java/tree/master/src/samples

·

https://github.com/awslabs/amazon-kinesis-producer

·

·

·

·

public SampleRecordProcessor() { super();
}
@Override public void initialize(String shardId) {
LOG.info("Initializing record processor for shard: " + shardId); this.kinesisShardId = shardId; }

·

@Override

·

public void processRecords(List<Record> records, IRecordProcessorCheckpointer checkpointer) {

·

LOG.info("Processing " + records.size() + " records from " + kinesisShardId);

·

// Process records and perform all exception handling.

·

processRecordsWithRetries(records);

·

}

Amazon Kinesis 3: Lambda

AWS endpoint

Amazon Kinesis 4

Availability Zone

Availability Availability

Zone

Zone

Shard 1 Shard 2 Shard N

App 1
Aggregate and ingest data to S3
App 2 Aggregate and ingest data to Amazon Redshift
App 3 ETL/ELT Machine learning

Data lake
Amazon Redshift

App N
Amazon Kinesis
Live dashboard

EMR DynamoDB

Amazon Kinesis 4.1: EMR

Amazon Kinesis 4.1: Hive
CREATE TABLE call_data_records ( start_time bigint, end_time bigint, phone_number STRING, carrier STRING, recorded_duration bigint, calculated_duration bigint, lat double, long double
) ROW FORMAT DELIMITED FIELDS TERMINATED BY "," STORED BY 'com.amazon.emr.kinesis.hive.KinesisStorageHandler' TBLPROPERTIES("kinesis.stream.name"="MyTestStream");

Amazon Kinesis 5: Apache Storm

Producer Amazon
Kinesis

Kinesis Storm Spout
Apache Storm

ElastiCache

(Redis)

Node.js

http://blogs.aws.amazon.com/bigdata/post/Tx36LYSCY2R0A9B/Implement-aReal-time-Sliding-Window-Application-Using-Amazon-Kinesis-and-Apache

Client (D3)

Amazon Kinesis Connector Library

·  ·  · AWS
­ Amazon S3 ­ Amazon Redshift ­ Amazon DynamoDB ­ Amazon Elasticsearch
S3

Kinesis

Dynamo DB Amazon Elasticsearch

Redshift

Amazon Kinesis Agent
Firehose
·  ·  ·  · AWS CloudWatch
 · Amazon Linux AMI 2015.09, or Red Hat Enterprise Linux 7 . LinuxWeb, front ends, 
· Amazon Kinesis Streams

Amazon Kinesis
AdRoll  





·  ­  ­ Serving ads ·  /  /  · (RTB)
· 



· : · : · :

2 / 240GB 16 / 700GB 600 / 80TB





 

Amazon S3

... ...

Amazon S3

Amazon Lambda Amazon SQS

Amazon EC2

Amazon EC2

DynamoDB





 

Amazon S3

... ...

Amazon S3

Amazon Lambda Amazon SQS

DynamoDB

Amazon EC2
10 

~15 

Amazon EC2
~5 





 

... ...

Amazon EC2

Streaming Service?

Amazon S3 DynamoDB

Amazon EC2


·  ·  ·  ·  ·  · 

Kafka

Kafka
  a)  b) /
 Kafka 



Kinesis



 

... ...

Amazon EC2

Amazon Kinesis

Amazon S3

Amazon EC2

DynamoDB

Kinesis



 

... ...

Amazon EC2

Amazon Kinesis
~3 

Amazon S3

Amazon EC2

DynamoDB

Kinesis
 153  
a. 
b. 

Kinesis
a) 5 b) 155Kinesis stream c) 264Shards d) 25 (1Kinesis) / 


Amazon KinesisWeb



Producer

Amazon Kinesis

Kinesis-enabled Application

Amazon DynamoDB

Dashboard

The same Amazon EC2

CloudFormation
·  (EC2, RDS, S3, Security Group, Route Tables, etc.) · JSON, ·  · 



DynamoDB



: 1. Stream Writer

: 2. Referrer Counter

: 3. WebServer

Amazon Kinesis


Amazon Kinesis:
AWS

· Amazon Kinesis Streams

· Amazon Kinesis · Amazon Kinesis

Firehose

Analytics

Kinesis Streams  

 S3  Redshift

 SQL 

Amazon Kinesis 


Stream,    


 Kinesis 


Kinesis 





Kinesis  S3, Redshift DynamoDB

Kinesis 


 

55


 KinesisS3Redshift  Kinesis StreamsShard  Kinesis Client LibraryKinesis Producer Library
56

