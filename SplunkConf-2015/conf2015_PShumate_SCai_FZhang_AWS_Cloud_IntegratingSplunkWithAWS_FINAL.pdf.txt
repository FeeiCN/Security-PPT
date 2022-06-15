Integrating Splunk with AWS services:
Using  Redshi+,  Elas0c  Map  Reduce  (EMR),  Amazon  Machine  Learning  &  S3  to  gain  ac0onable   insights  via  predic0ve  analy0cs  via  Splunk  
Patrick Shumate Solutions Architect, Amazon Web Services
Olivier de Garrigues Professional Services , Splunk

Disclaimer  
During  the  course  of  this  presenta0on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau0on  you  that  such  statements  reflect  our   current  expecta0ons  and  es0mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those   contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta0on  are  being  made  as  of  the  0me  and  date  of  its  live   presenta0on.  If  reviewed  a+er  its  live  presenta0on,  this  presenta0on  may  not  contain  current  or   accurate  informa0on.  We  do  not  assume  any  obliga0on  to  update  any  forward  looking  statements  we   may  make.        In  addi0on,  any  informa0on  about  our  roadmap  outlines  our  general  product  direc0on  and  is  subject  to   change  at  any  0me  without  no0ce.  It  is  for  informa0onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga0on  either  to  develop  the  features   or  func0onality  described  or  to  include  any  such  feature  or  func0onality  in  a  future  release.  
2  

Who we are?

· Patrick Shumate · Virginia, US · Solutions Architect · Big data/ Security SME

Olivier de Garrigues London, UK Professional Services Analytics SME

Agenda
· Overview of Services · Integration Demo of RedShift and Amazon ML · Resources to help you get started · Q&A

What Tools Should I Use?

Simplify Big Data Processing

Data  

Ingest  

Store  

Process  

Visualize  
Answers  

Time  

Ingest: The act of collecting and storing data

Amazon Kinesis

Real-time processing of streaming data High throughput Elastic Easy to use Connectors for EMR, S3, Redshift, DynamoDB

AmAamzaoznoKniKneinseissiAsrAchrcitheictetucrtuere

Aggregate and archive to S3

Front End

Millions of sources producing 100s of terabytes
per hour

Authentication Authorization

AZ

AZ

AZ

Durable, highly consistent storage replicates data across three data centers (availability zones)

Amazon Web Services

Inexpensive: $0.028 per million puts

Ordered stream of events supports multiple readers

Real-time dashboards and alarms

Machine learning algorithms or sliding window analytics

Aggregate analysis in Hadoop or a data warehouse

Amazon Kinesis Modular Input

Utilizes Modular Inputs to index from the stream

Integrates AWS Lambda for collection via HTTP Amazon Kinesis Amazon DynamoDB Amazon S3 and other Amazon services

Storage

Amazon     S3  

Store anything Object storage Scalable Designed for 99.999999999% durability

Why is Amazon S3 good for Big Data?
· No limit on the number of Objects · Object size up to 5TB · Central data storage for all systems · High bandwidth · 99.999999999% durability · Versioning, Lifecycle Policies · Glacier Integration

Aggregate All Data in S3 Surrounded by a collection of the right tools

Amazon S3
Amazon S3

EMR

Kinesis

Data Pipeline

Redshift

DynamoDB

RDS

Storm

Spark Streaming

Splunk  Add--on   for  Amazon   Web  Services  

Collect events, alerts, performance metrics configuration snapshots, and billing information from the AWS CloudTrail, CloudWatch, and Config services gather log data from generic S3 buckets

Process and Analyze

Amazon     Elas0c   MapReduce  

Hadoop/HDFS clusters Hunk, Hive, Pig, Impala, HBase Easy to use; fully managed On-demand and spot pricing Tight integration with S3, DynamoDB, and Kinesis

How Does EMR Work?
1.  Put  the  data   into  S3   S3
4.  Get  the  output   from  S3  

2.  Choose:  Hadoop  distribu0on,  #   of  nodes,  types  of  nodes,    and  
Hadoop  Ecosystem  apps  like  Hunk  
EMR  Cluster
3.  Launch  the  cluster  using   the  EMR  console,  CLI,  SDK,  or  
APIs  

How Does EMR Work?
S3

EMR  Cluster

You  can  easily  resize  the   cluster  

EMR
And  launch  parallel   clusters  using  the  same  
data  

Full-Featured, Integrated Analytics Fast to Deploy and Drive Value Interactive Search Report Acceleration Results Preview Very cost-effective

Amazon Redshift

Columnar data warehouse ANSI SQL compatible Massively parallel Petabyte scale Fully-managed Very cost-effective

Amazon Redshift architecture

· Leader Node
­ SQL endpoint ­ Stores metadata ­ Coordinates query execution
· Compute Nodes
­ Local, columnar storage ­ Execute queries in parallel ­ Load, backup, restore via
Amazon S3 ­ Parallel load from Amazon DynamoDB
· Hardware optimized for data processing

SQL Clients/BI Tools
JDBC/ODBC

10 GigE (HPC)

128GB RAM
Leader 16 cores Node
16TB disk

128GB RAM
Com16 copres ute Node
16TB disk

128GB RAM
Com16 copres ute Node
16TB disk

128GB RAM
Com16 copres ute Node
16TB disk

· Two hardware platforms
­ DW1: HDD; scale from 2TB to 1.6PB ­ DW2: SSD; scale from 160GB to 256TB

Ingestion Backup Restore

Amazon S3 / DynamoDB

Amazon Redshift dramatically reduces I/O

· Data compression · Zone maps · Direct-attached storage · Large data block sizes

ID

Age

State

Amount

123

20

CA

500

345

25

WA

250

678

40

FL

125

957

37

WA

375

· With row storage you do unnecessary I/O
· To get total amount, you have to read everything

Amazon Redshift dramatically reduces I/O

· Data compression · Zone maps · Direct-attached storage · Large data block sizes

ID

Age

State

Amount

123

20

CA

500

345

25

WA

250

678

40

FL

125

957

37

WA

375

· With column storage, you only read the data you need

Amazon Redshift dramatically reduces I/O

· Column storage · Data compression · Zone maps · Direct-attached storage · Large data block sizes

analyze  compression  listing;          Table    |          Column          |  Encoding     ------------------+--------------------------------+--------------------     listing  |  listid                  |  delta     listing  |  sellerid              |  delta32k     listing  |  eventid                |  delta32k     listing  |  dateid                  |  bytedict     listing  |  numtickets          |  bytedict     listing  |  priceperticket  |  delta32k     listing  |  totalprice          |  mostly32     listing  |  listtime              |  raw  
· Columnar compression saves space & reduces I/O
· Amazon Redshift analyzes and compresses your data

Amazon Redshift dramatically reduces I/O

· Column storage · Data compression

· Track of the minimum and maximum value for each block

· Direct-attached storage

· Skip over blocks that don't contain the data needed for a given query
· Minimize unnecessary I/O

· Large data block sizes

Amazon Redshift dramatically reduces I/O

· Column storage · Data compression · Zone maps · Direct-attached storage · Large data block sizes

· Use direct-attached storage to maximize throughput
· Hardware optimized for high performance data processing
· Large block sizes to make the most of each read
· Amazon Redshift manages durability for you

Database Connector 2

Inputs to import structured data Outputs export data insights to a legacy database Lookups add meaningful information to events

Amazon Machine Learning

robust, cloud-based easy for developers of all skill levels to use Wizard driven process to build models API for automation Batch and real time predictions

Easy to use and developer-friendly
Use the intuitive, powerful service console to build and explore your initial models
­ Data retrieval ­ Model training, quality evaluation, fine-tuning ­ Deployment and management
Automate model lifecycle with fully featured APIs and SDKs
­ Java, Python, .NET, JavaScript, Ruby, PHP
Easily create smart iOS and Android applications with AWS Mobile SDK

Powerful machine learning technology
Based on Amazon's battle-hardened internal systems
Not just the algorithms:
­ Smart data transformations ­ Input data and model quality alerts ­ Built-in industry best practices
Grows with your needs
­ Train on up to 100 GB of data ­ Generate billions of predictions ­ Obtain predictions in batches or real-time

Fully managed model and prediction services
End-to-end service, with no servers to provision and manage
One-click production model deployment
Programmatically query model metadata to enable automatic retraining workflows
Monitor prediction usage patterns with Amazon CloudWatch metrics

Building smart applications with Amazon ML

1
Train model

2
Evaluate and optimize

3
Retrieve predictions

-- Create  a  Datasource  object  poin0ng  to  your  data   -- Explore  and  understand  your  data   -- Transform  data  and  train  your  model  

Create a Datasource object
>>> import boto >>> ml = boto.connect_machinelearning() >>> ds = ml.create_data_source_from_s3( data_source_id = 'my_datasource', data_spec= {
'DataLocationS3':'s3://bucket/input/', 'DataSchemaLocationS3':'s3://bucket/input/.schema'}, compute_statistics = True)

Explore and understand your data

Train your model
>>> import boto >>> ml = boto.connect_machinelearning() >>> model = ml.create_ml_model(
ml_model_id='my_model', ml_model_type='REGRESSION', training_data_source_id='my_datasource')

Building smart applications with Amazon ML

1
Train model

2
Evaluate and optimize

-- Understand  model  quality   -- Adjust  model  interpreta0on  

3
Retrieve predictions

Explore model quality

Fine-tune model interpretation

Fine-tune model interpretation

Building smart applications with Amazon ML

1
Train model

2
Evaluate and optimize

-- Batch  predic0ons   -- Real--0me  predic0ons  

3
Retrieve predictions

Visualize (demo)

SHOUTOUT
· Leveraging Splunk to manage your AWS environment: Tuesday 22, 4:15-5PM · Hunk and EMR: Big Data Analytics on AWS: Tuesday 22, 5:15-6PM · Deploying Splunk on Amazon Web Services: Wednesday 23, 5:15-6PM · Splunking AWS for End-to-end Visibility: Thursday 24, 10-10:45AM

SPECIAL THANKS
ML team: Manish Sainani, Fred Zhang, Shang Cai AWS/Splunk coordination: Tony Bolander, Dritan Bitincka

Thank You!

