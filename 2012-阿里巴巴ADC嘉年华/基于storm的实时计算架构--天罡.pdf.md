-

 
·  ·  · 
· lingxi.konglx@alibaba-inc.com · weibo.comhttp://weibo.com/kennyccp




·1 .   ·2 .   ·3 .     ·4 .     ·5 . s q u i r r e l Q L ·6 .    

· Big data ·  · SNS, ·  ·...

1.1 

1.2  vs. 
From <IBM InfoSphere Streams: Harnessing Data in Motion>

1.3 

2.1 
Engine state storage

·storm 0.74 ·
- - - - -
· -Enginestatestorage 
- - -storm ui -topologybolt -nimbus -topology

2.2 storm

Engine state storage

2.3 storm

3.1 



1

 


 

2

 

 

3

 

4 

5



 
 
  

3.2-

 1.  2. SQL 3. Enginestatestorage  4. 

3.3Features
·() ·join() · · · ·SQL ·int/long/string/double... ·Ensgicnehsetamte astorage ·join,distinct,group by,count, top N ·
-to_char ,substr...

3.4-







 Message source

Message topic Message topic


Message Message Message


Data

Job

Extract job

Processing job

processing

message extract
service  

SQL


1. message sourcedatabase1message topic(table)message topic1 messagerecord
2. Jobextract jobprocessing jobextract jobmessage topic processing job1message topicmessage topicprocessing jobProcessing job messagedata

4.1-

Squrriel QL SQL

SQL



 table

join distinct

arg

...

erosa  log file

Message extract service
message connector
message adaptor

...

Message storage center
meta
MSC manager


Stream processing engine(storm)

supervisor bolt
spout

nimbus zookeper

Engine state storage

Local buffer cache

Persistence storage

Data output service

HBASE DB

HBASE

squirrel QL

Data subscriber service Data output service

4.2-
Global Control System

Monitor & Alarm Job Control Center Job Configure Assistant Command Line Client
Log Metadata Center

Engine state storage Stream processing engine
Message store center Message extract service

4.3-





Message extract service
Log





Job Configure Assistant

Message store center

Processing operator interface
Stream processing engine
Engine state storage

Job control center Monitorsystemservicejobdata
Alarm

Data output service
Metadata

4.4 Message extract service

· Extract job
­ messagedblogfilemq ­ message ­ Job
· 
­  ­  ­ Job
· 
­ Keyword search

Zookeeper

Rainbow

Majordomo

Majordomo

......

1023

103

179

123

......

Message Extract Service

Job

4.5 Message store center
· 
­ MetamorphosisKafka  
­ PullMQ ­  ­ Meta spout ­ 
· Message read interface · Message write interface · MSC manager

4.6 Engine state storage

· 

­ join ­  ­  ­ 

Bolt




Join

Distinct

......



Local Buffer

HBase

Redis

·  
·  
·   
· cpu ioredismeta storm
· storm

4.7 Global Control System

5.1 storm topology
UV,PV
select a,b,count(c),count(distinct d) from x where a=1 group by to_char(a,'yyyymmdd'),b



TopologyBuilder builder = newTopologyBuilder();

...



builder.setSpout(1, cbuuvpvSpout(), 10); builder.setBolt(2, cbupvuvBolt(),

3).shuffleGrouping(1);

......








5.2 squirrel QL

CLI

websql

IDE



SQL SQL

metadata

table join distinct arg

...

  

select

join

...

select

count(*)

 

5.3 squirrel QL 

DsComponent

JoinComponment SQL

OptComponment

AGG

Dist

Proj

Sele

stormDs

spout

stormJoin bolt
stormOpt

5.4 squirrel QL
· SELECT uid,COUNT(order) FROM table GROUP by uid

table
Ds: Projectionuidorder

COUNTAGG
Opt: Goup by uid Schema(uid,count)

5.5 squirrel QL JOIN

· SELECT

Ds: Projection:uid,country

Ds: Projection:uid ,order

c.country,

COUNT(o.order) FROM

custormer c

join

order o on c.uid= o.uid

GROUP BY c.country

CUSTOMER

ORDER

CUSTOMER_ORDER

Join Opt: Schema(co untry,order)

COUNTAGG

Countagg Operation: Grouby country Schema(country ,count)

5.6 squrriel QL&Hive QL

  

Hive QL HDFS  

Squrriel QL HBASE  

  

0.8 MapReduce UDFUDAF,UDTF

 Topology 

· 
­ ,6 ­ LRU ­ 

6.1 

· 

­ 

­ key

­ meta 

­ task fields grouping, hash grouping MetaQ

key 

hash

6.2(Cont.)

Stream Bolt A
Grouping

Spout

Bolt B



Task

6.3 (Cont.)
· 
­ ( )
­ ()
·  · transactional topolgoy (transaction id) ·  ·  · 

@




GMV 
 

 
 


 

 






404



Top likes/trends


 
 



360

      

Q&A Thanks

 .    10 

