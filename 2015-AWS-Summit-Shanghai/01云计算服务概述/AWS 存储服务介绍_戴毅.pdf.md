AWS 
, AWS 
©2015, Amazon Web Services, Inc. or its affiliates. All rights reserved

AWS 
·  ·  ·  ·  · 







Amazon S3 Simple Storage Service

S3 
S3 102%
(Q4 2014 vs Q4 2013, not including Amazon use)

2012

2013

2014

2015

99.999999999%

...

S3 bucket  object

S3 

S3  -- 

1 PB  800 TB  600 TB 

Amazon S3

400 TB 

S3 
· 11 ·  GB-month  ·  8  ·  4/1/2014S3 
51% · TCO:  S3 
­  
­ 

S3 EMR

Amazon

Amazon S3--New Features

S3 
 S3  Amazon SNSAmazon SQS  AWS Lambda

S3

SNS topic

Notifications Events

SQS queue

Lambda function
Foo() { ... }

S3 
·  Bucket  
· S3  ""
·  
·  AWS 

S3 

: ·  --  ·  --  ·  --  AWS 

Destination (Oregon)

Source (Virginia)

·  PUT S3   Bucket  
·  Bucket  
·  2  1:1  · 

S3 
· Web  ·  Amazon CloudFront  ·  · 

Amazon Glacier 

$0.01
per GB-month

$120
per TB/year

99.999999999%


3­5 



vs.


Glacier 
·  ·  · "" · 

Amazon S3 ­ Glacier  

S3 
Key prefix "logs/"
Transition objects to Glacier 30 days after creation
Delete 365 days after creation date
<LifecycleConfiguration> <Rule> <ID>archive-in-30-days</ID> <Prefix>logs/</Prefix> <Status>Enabled</Status> <Transition> <Days>30</Days> <StorageClass>GLACIER</StorageClass> </Transition> <Expiration> <Days>365</Days> </Expiration> </Rule>
</LifecycleConfiguration



SoundCloud -- Glacier 
·  · 
S3 Glacier

S3 
·  ·  ·  Glacier 

Amazon S3 ­ Standard Infrequent Access

S3 Standard-Infrequent Access 

Standard

Standard-IA

Amazon S3 

Glacier



"Hot" Data
Active and/or Temporary Data
S3

S3-IA

"Warm" Data
Infrequently Accessed Data

Glacier

"Cold" Data
Archive and Compliance Data

$0.03/GB per month

> 0K

 0 Days

$0.0125/GB per month $0.01/GB retrieval

 128K

 30 Days

$0.007/GB per month $0.01/GB retrieval < 5%

> 0K 3 ­ 5 Hrs

 90 Days

Durable
99.999999999%

Available

S3: 99.99%

L

S3-IA: 99.9%

i

f

Performant

Low Latency

e

High Throughput

c

y

Scalable

Elastic capacity

c

No preset limits

l

e



Cloud Applications

Big Data Analytics

Content Distribution

Primary Data

Temporary & Small Objects

S3

S3-IA

File Sync & Share

Active Archive

Enterprise Backup

Media Transcoding

Disaster Recovery / Geo Redundancy

Glacier

Deep / Offline Archives

Tape Vaulting Replacement

WORM Compliant
Data



S3 S3-IA Glacier

Original
L Asset i f e c
Original
y Asset c l e

Transcoded Renditions

Asset Library





Amazon EBS 

16 TB
1TB 

EBS
General Purpose (SSD) Up to 16 TB 10,000 IOPS Up to 160 Mbps

Provisioned IOPS (SSD) Up to 16 TB 20,000 IOPS Up to 320 Mbps

EBS
   IOPS   





Magnetic


General Purpose Provisioned IOPS

Boot  

 I/O   NoSQL 

 

SSD 

SSD 

40­200 IOPS 20­40 ms

10,000 IOPS 1­2 ms

20,000 IOPS 1­2 ms

99.999%
$.05/GB-month $.05/million I/O

99.999% $.10/GB-month

99.999%
$.125/GB-month $.065/provisioned IOPS

Amazon EBS 

EBS 
·  Amazon EC2  ·  ·  -- ExtFS 

Amazon Elastic File System 

 EFS?

·  EC2  ·  ·  PB  ·  · 

1

2

simple

elastic

3
scalable

EFS ...
·  ·  ·  · 

1 EFS 
· 
­  ­ 
· 
­ NFS v4 --  ­  ­  OS  API
·  = 
­ EFS : $0.30/GB-month

2 EFS 
·  
·  · 


3 EFS 
·  PB  ·  IOPS
 ·  ·  NFS 


Customer's file system

VPC
EC2

REGION
AVAILABILITY ZONE 1

EC2 EC2 EC2

AVAILABILITY ZONE 2 AVAILABILITY ZONE 3

 EFS 

IT 

· 

 

·  NFS // AWS  · 



·  ·  · 


Amazon Storage Gateway

Storage Gateway
 AWS 
·  S3 ·  EC2 ·  Amazon Glacier · iSCSI  VTL 

Amazon 
· 
S3
·  API 
· 
Glacier
·  API 
· SAN
EBS
·  EC2 
·  NAS
EFS
·  EC2 
Storage ·  S3  Amazon Glacier
Gateway

