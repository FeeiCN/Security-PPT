DynamoDB
Jenny Sun  AWS


· DynamoDB · DynamoDB ·  ·  ·  · 

DynamoDB



· (3V)

ZB

­  ­ : MB/sGB/s


EB

­  IoT...

· 

PB GB TB

­ 202075 billion
· 105106 transactions/s 

...
·  ·  ·  ·  · 

DynamoDB


DynamoDB





DynamoDB

Timehop
100TB 

DynamoDB

Amazon DynamoDB

ms


· 



 -- 
(RCU/WCU) 
 +  = 

 -- 
<10ms
Docs, SDK's: http://aws.amazon.com/dynamodb/developer-resources/ Auto Scaling Your DynamoDB: https://github.com/sebdah/dynamicdynamodb

 -- 

 · AZ · AZ
 · Disk-only writes


·  
·  · 


 ­ 

table
partitions 1 .. N

 -- 
· $0.0065/h for 10 WCU (36,000) · $0.0065/h for 50 RCU (180,000360,000
) · First 25 GB stored per month is free, $0.25 per GB-month thereafter
http://blog.csdn.net/awschina/article/details/38562221

DynamoDB




 -: {=} 

Hash Range Key Key
 1:N  



All items for a hash key ==, <, >, >=, <= "begins with" "between" sorted results counts top/bottom N values paged responses

DynamoDB

· String (S) *
· Number (N) * · Binary (B) *
· String Set (SS) · Number Set (NS) · Binary Set (BS)

· Boolean (BOOL) · Null (NULL) · List (L) · Map (M)
JSON

*Hash KeyRange Key


·  (RCU: Read Capacity Units) ­ 1 RCU = 4KB  ­ 1 RCU = 8KB 
·  (WCU: Write Capacity Units) ­ 1 WCU = 1KB 
· Batch API ­ Item4KB1KB
·  ­ 4KB1KB

DynamoDB API

· CreateTable · GetItem

· UpdateTable · Query

· DeleteTable · Scan

· BatchGetItem

· DescribeTable

· ListTables

· PutItem

· UpdateItem

· DeleteItem

· BatchWriteItem

In preview
Stream API
· ListStreams · DescribeStream · GetShardIterator DynamoDB · GetRecords


· DynamoDB ­  ­ 400KB
·  ­ 10GB/ ­ 
· 3000 RCU: 1 (partition) · 1000 WCU: 1 (partition)



# 
()

= 3000

+ 1000

#  =

()

10


()
...


()


·  · 3WCU1500
 · : over provisioning



·  · hash key

Index ­ GSI  LSI

(GSI)
hash keyrange key

(LSI)
hash key+range key 



· (GSIs)
­  ­  ­ hash key ­  ­ 

· LSIs
­  ­ 10GB ­ Hash keybase table
Hash key ­  ­ base table

10GBGSI GSI



1:1  key-values

· GSIHash key · GetItem  BatchGetItem API : SSN  license number, 

Users Table Hash key SSN = 123-45-6789 SSN = 987-65-4321

Attributes Email = johndoe@nowhere.com, License = TDL25478134 Email = maryfowler@somewhere.com, License = TDL78309234

Users-Email-GSI

Hash key

Attributes

License = TDL78309234 Email = maryfowler@somewhere.com, SSN = 987-65-4321

License = TDL25478134 Email = johndoe@nowhere.com, SSN = 123-45-6789

1:N   -
· GSIHash key + Range Key · Query API
: , epoch X, Y

Hash Key DeviceId = 1 DeviceId = 1

Device-measurements

Range key

Attributes

epoch = 5513A97C Temperature = 30, pressure = 90

epoch = 5513A9DB Temperature = 30, pressure = 90

N:M 

· Hash key + Range KeyHash key + Range KeyGSI
· Query API : 

User-Games-Table Hash Key Range key UserId = bob GameId = Game1 UserId = fred GameId = Game2 UserId = bob GameId = Game3

Game-Users-GSI

Hash Key

Range key

GameId = Game1 UserId = bob

GameId = Game2 UserId = fred

GameId = Game3 UserId = bob


· Projection
­ Query/Get/Scan: 
· 
­ Query/Scan: #V > :num
· 
­ Put/Update/DeleteItem: attribute_not_exists (#pr.FiveStar)
· 
­ UpdateItem: set Replies = Replies + :num

DynamoDB

1Hash Key
· hot key
­ hash keyhash key ­ hash key 

Hash Key

user_id = mza
user_id = jeffbarr
user_id = werner
user_id = simone
...

first_name = Matt
first_name = Jeff
first_name = Werner
first_name = Simone
...

last_name = Wood
last_name = Barr
last_name = Vogels
last_name = Brunozzi
...

user_id.  Hash keypartition

Hash Key

status = 200
status = 404
status 404
status = 404

date = 2012-04-01-00-00-01
date = 2012-04-01-00-00-01
date = 2012-04-01-00-00-01
date = 2012-04-01-00-00-01

Status code 

2

Messaging App David

Messages App

Inbox
SELECT * FROM Messages WHERE Recipient='David' LIMIT 50 ORDER BY Date DESC

Messages Table



Messages Table

Recipient Date

Sender Message

David

2014-10-02 Bob

...

... 48 more messages for David ...

David

2014-10-03 Alice ...

Alice

2014-09-28 Bob

...

Alice

2014-10-01 Carol ...

(Many more messages)

Inbox
David
SELECT * FROM Messages WHERE Recipient='David' LIMIT 50 ORDER BY Date DESC
50 items × 256 KB each


inbox

50



 Conversion ratio

 Uniformly distributes large item reads

(50 sequential items at 128 bytes)
David
1. Query Inbox-GSI: 1 RCU 2. BatchGetItem Messages: 1600 RCU
(50 separate items at 256 KB)

Inbox-GSI

Messages Table

Recipient Date

Sender Subject MsgId

David

2014-10-02 Bob

Hi!...

afed

David

2014-10-03 Alice RE: The... 3kf8

Alice

2014-09-28 Bob

FW: Ok... 9d2b

Alice

2014-10-01 Carol Hi!...

ct7r

MsgId Body 9d2b ... 3kf8 ... ct7r ... afed ...

S3

1. Query Inbox-GSI: 1 RCU 2. Application fetch items from S3

Inbox-GSI

Recipien Date t

Sender Subject

David

2014-10-02 Bob

Hi!...

David

2014-10-03 Alice RE: The...

Alice

2014-09-28 Bob

FW: Ok...

Alice

2014-10-01 Carol Hi!...

MsgId
s3://post_msgs/id_100 s3://post_msgs/id_102 s3://post_msgs/id_1045 s3://post_msgs/id_102

David
S3

2
· ItemItem
­  ­ HashVirtual Item ­ image/mediaS3
 partition 

3


100,000 
50

Shoppers

SELECT Id, Description, ... FROM ProductCatalog WHERE Id="POPULAR_PRODUCT"

Partition 1 2000 RCUs
Product A

Partition K 2000 RCUs

Partition M 2000 RCUs

Product B
ProductCatalog Table

Partition 50 2000 RCU



SELECT Id, Description, ... FROM ProductCatalog WHERE Id="POPULAR_PRODUCT"

User

User

DynamoDB

Partition 1

Partition 2

ProductCatalog Table

4Time-Series
·  
·   
·   




Hot data

Cold data



Events_table_2015_April

Event_id Timestamp Attribute1 .... Attribute N RCUs = 10000

(Hash key) (range key)

WCUs = 10000



Events_table_2015_March Event_id Timestamp Attribute1 .... Attribute N (Hash key) (range key)
Events_table_2015_Feburary Event_id Timestamp Attribute1 .... Attribute N (Hash key) (range key)
Events_table_2015_January Event_id Timestamp Attribute1 .... Attribute N (Hash key) (range key)

RCUs = 1000 WCUs = 100
RCUs = 100 WCUs = 1
RCUs = 10 WCUs = 1

; S3

5

Games Table

GameId d9bl3 72f49 o2pnb b932s ef9ca

Date 2014-10-02 2014-09-30 2014-10-08 2014-10-03 2014-10-03

Host David Alice Bob Carol David

Opponent Alice Bob Carol Bob Bob

Status DONE PENDING IN_PROGRESS PENDING IN_PROGRESS

(hash)
 (?)
(range)

SELECT * FROM Game WHERE Opponent='Bob` AND Status=`PENDING' ORDER BY Date DESC

1: Query filter

Bob

Secondary Index

Opponent Date

GameId Status

Host

Alice

2014-10-02 d9bl3 DONE

David

Carol

2014-10-08 o2pnb IN_PROGRESS Bob

Bob

2014-09-30 72f49 PENDING

Alice

Bob

2014-10-03 b932s PENDING

Carol

Bob

2014-10-03 ef9ca IN_PROGRESS David

1: Query filter

SELECT * FROM Game
WHERE Opponent='Bob' Bob
ORDER BY Date DESC
FILTER ON Status='PENDING'
Secondary Index

Opponent Date

GameId Status

Host

Alice

2014-10-02 d9bl3 DONE

David

Carol

2014-10-08 o2pnb IN_PROGRESS Bob

Bob

2014-09-30 72f49 PENDING

Alice

Bob

2014-10-03 b932s PENDING

Carol

Bob

2014-10-03 ef9ca IN_PROGRESS David

(filtered out)

2: 

Status DONE IN_PROGRESS IN_PROGRESS PENDING PENDING

Date 2014-10-02 2014-10-08 2014-10-03 2014-10-03 2014-09-30

StatusDate DONE_2014-10-02 IN_PROGRESS_2014-10-08 IN_PROGRESS_2014-10-03 PENDING_2014-09-30 PENDING_2014-10-03

2: 

Secondary Index

Opponent StatusDate

GameId Host

Alice

DONE_2014-10-02

d9bl3 David

Carol

IN_PROGRESS_2014-10-08 o2pnb Bob

Bob

IN_PROGRESS_2014-10-03 ef9ca David

Bob

PENDING_2014-09-30

72f49 Alice

Bob

PENDING_2014-10-03

b932s Carol

2: 

SELECT * FROM Game WHERE Opponent='Bob'
Bob
AND StatusDate BEGINS_WITH 'PENDING'
Secondary Index

Opponent StatusDate

GameId Host

Alice

DONE_2014-10-02

d9bl3 David

Carol

IN_PROGRESS_2014-10-08 o2pnb Bob

Bob

IN_PROGRESS_2014-10-03 ef9ca David

Bob

PENDING_2014-09-30

72f49 Alice

Bob

PENDING_2014-10-03

b932s Carol

5
· Query filter
­  ­ SQLAND, OR, NOT, ()
· filter
­ 

6CloudWatch
·  ­  ­ hot keyhot partition  ­  ­ : 1) ; 2) ­  ­ burst capacity
· Cloudwatch/throttling · 

7Reserved Capacity
·  · 150%  · 375% 




· Hash Key ·  ·  ·  · filter · CloudWatch · Reserved Capacity
DynamoDB: http://aws.amazon.com/documentation/dynamodb/


· 1
­ 8GB ­ RCU = 5000 ­ WCU = 500 ­  = 
· 2
­ GSI/LSI
· 3
­ DynamoDB

