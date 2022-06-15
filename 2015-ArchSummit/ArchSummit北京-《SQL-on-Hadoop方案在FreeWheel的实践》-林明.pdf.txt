SQL-on-HadoopFreeWheel
FreeWheel 




· · · · ·


· · · · ·


· · · · ·

102TB

Ad-hoc
·  ­  ­  ­ 
·  ­  ­  ­ 

SQL-on-Hadoop
SQL MPP
Connector HDFS


· MPP ­ Impala/Stinger/Drill/Hive/Presto
·  ­ /ORC/Parquet


· MPP Presto ­  ­ join ­ 
· Parquet ­  ­ shredassembly ­  ­ 

Ad-hoc

Presto


Parser/Anal yzer

Logical Planner

SQL

Distributed Planner

Node Scheduler


Task


 API

(split manager) 

(Record cursor) 



 (matcher)

HDFS









 

 
ACK(slot impression) ACK(ad impression) ACK(IAB metrics) ACK(video view) ACK(...)



request
Ack Ack Ack Ack Ack


Protobuf Record request
Ack Ack Ack Ack Ack

Matcher

Avro Record
transaction_id
request Ack Ack Ack Ack
Parquet Record
HDFS


· Pattern
SELECT c1, ... FROM transaction WHERE event_date >= [start]
and event_date < [end] and network_id = [id]
· 



Presto


Parser/Anal yzer

Logical Planner

Distributed Planner

Node Scheduler


Task



 API

 

parquet

(split manager)



(Record cursor) 

Split Manager

· Prestocoordinator worker

 Distributed
Planner

Node Scheduler

 

 

(split manager)

parquet

HDFS

Split Manager

· Prestocoordinator worker

 Distributed
Planner

Node Scheduler

 

 

(split manager)

 

HBase

HDFS

parquet

<>
 (Metadata Loader)

Record Cursor
· parquetPrestoworker · Predicate PushdownParquetFilter records



·  transaction
{ "request" : { "user_id" : "string" },

"acks" : [

{

"event_type" : "string",

"event_name" : "string"

}]

}

request.user_id acks

user_1

[{"i", "vv"}, {"i", "adImp"}]

user_2

[{"i", "vv"}, {"i", "adImp"}, {"I", "adImp"}]

user_3

["i", "vv"]


· transactionack
event_type = `i' && event_name = `adImp'
· 
SELECT request.user_id, count(1)
FROM transaction WHERE acks.event_type = `i'
and acks.event_name = `adImp' GROUP BY request.user_id;

Hive
SELECT request.user_id, count(1)
FROM transaction LATERAL VIEW explode(acks) acklist AS event WHERE event.event_type = `i'
and event.event_name = 'adImp' GROUP BY request.user_id;



·  ­ transaction ­ transaction, ack

event_type

event_name

SELECT request.user_id, count(1)
FROM ack WHERE event_type = `i'
and event_name = `adImp' GROUP BY request.user_id;

request.user_id

Presto on YARN
· YARN

Presto as a Service
· REST API ­ ""sql ­ MR/Spark ­ 

Presto on YARN



2000

1500

1000
66%, <60s
500

0
seconds elapsed

92%, <600s

count
0 20 40 60 80 100 120 140 160 180 200 220 240 260 280 300 320 340 360 380 400 420 440 460 480 500 520 540 560 580 600

8%, >600s

