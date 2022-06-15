Cassandra & HBase Comparison
  @
SACC2011

Agenda
 Function  Implement  What's Next

SACC2011

Agenda
 Function  Implement  What's Next

SACC2011

Data Model

Standard Column Family

Keyspace KS-1 KS-1 KS-1 KS-1 KS-2

Row Row-1 Row-1 Row-1 Row-2 Row-1

Column Family
cfName-1

Column Name
colName-1

Column Value
colValue-1

Timestamp 12345678

cfName-1 colName-2 colValue-2 22345638

cfName-2 colName-1 colValue-1 12445678

cfName-1 colName-1 colValue-1 12345678

SACC2011 cfName-1 colName-1 colValue-1 12345678

Data Model

Super Column Family

Keyspace Row KS-1 Row-1

Column Family
cfName-1

Super Column
Name
sColName-1

Column Name
colName-1

Column Value
colValue-1

Timestam p
12345678

KS-1 Row-1 cfName-1 sColName-1 colName-2 colValue-2 22345638

KS-1 Row-1 cfName-2 sColName-2 colName-1 colValue-1 12445678

SACC2011

Data Model

Table Tab-1 Tab-1 Tab-1 Tab-1 Tab-2

Row Row-1

Column Family
cfName-1

Column Name
colName-1

Column Timestam

Value

p

colValue-1 12345678

Version V-1

Row-1 cfName-1 colName-2 colValue-2 22345638 V-2

Row-1 cfName-1 colName-2 colValue-2 12445678 V-1

Row-2 cfName-1 colName-1 colValue-1 12345678 V-1

Row-1 cfName-1 colName-1 colValue-1 12345678 V-1
SACC2011

Basic API
 CRUD  ConsistencyLevel
 ONE  QUORUM  ALL
 Range Query
 Row  Token

SACC2011

Advanced API
 Authorization & Authentication  Secondary Index  Online Schema Update  Counter  MapReduce  CQL(Cassandra Query Language)
SACC2011

Basic API
 CRUD  Scan:
 Row

SACC2011

Advanced API

 Lock
 Put  checkAndPut  Delete  checkAndDelete
 Limited Online Schema Update  Counter  MapReduce  Filter

SACC2011

Agenda
 Function  Implement  What's Next

SACC2011

System Architecture

RAM

Memtable

Memtable

System CF

SSTable Commitlog

SSTable Commitlog

APP CF-1

Local Disk
APP CF-N

Cassandra Server 1

...

Cassandra ServerN

SACC2011

System Architecture
SACC2011

File System
SACC2011

Consistency

Server No. Cassandra-01 Cassandra-02 Cassandra-03

RowKey List key1,key2,key3,key4 key2,key3,key4,key5 key3,key4,key5,key6

Server No. RegionServer-01 RegionServer-02 RegionServer-03

RowKey List key1,key2,key3,key4 key5,key6,key7,key8 key9,key10,key11,key12

SACC2011

Location
SACC2011

Location
SACC2011

Storage File
SACC2011

Cache

Cache RowCache KeyCache

Value KeyIndex Key/Value

Cache BlockCache

Value Data Block

SACC2011

BulkLoader

BinaryMemtable nodetool cleanup sstableloader

HRegionInterface.bulkLoadHFile
· TableName · RegionName · CFName
LoadIncrementalHFiles
· HFilePath · TableName
SACC2011

LoadBalance

nodetool move token

balancer move regionName serverName split regionName
SACC2011

Agenda
 Function  Implement  What's Next

SACC2011

Brisk
 Enhanced Hadoop and Hive distribution th at utilizes Cassandra for all of its core service s.
 Integrated with Hadoop MapReduce and Hive
 Providing an HDFS compatible storage layer powered by Cass andra
SACC2011

Application Stack
SACC2011

Deploy
SACC2011

Coprocessor
 MasterObserver  RegionObserver  EndPoint
SACC2011

MasterObserver

PreOpen

Open

Flush ...
Close

...

...

HMaster

PostOpen
...
...
SACC2011

RegionObserver

PreGet

Get

Put ...
Scan

...

...

RegionServer

PostGet
...
...
SACC2011

EndPoint
Define your own extensions to HBase RPC transactions exchanged between clients and the region servers.
SACC2011

Applications
 HBase access control: provides basic access control for HBase
 Column aggregate: SQL-like sum(), avg(), max(), min(), etc.
 Region level indexing  HBase table, region access statistic
SACC2011


 Key Value  Key Scan  Column    

SACC2011

Cassandra
       
SACC2011

HBase
 Hadoop      

SACC2011

Thanks!
SACC2011

