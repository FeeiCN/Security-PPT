
 lianlinjiang@baidu.com
2012.07.08





HDFS MapReduce Resource Management System


  2.0 



2008

Hadoop v0.18/0.19

3002
Now

 



 Link

2W

4,000

20PB+



120,000+





UGC



100020003000500010000

cpu/mem/io--vs -- 

 3K+ 99.9%

2.0

Hadoop MapReduce
HDFS

Other Computing
Model

MapReduce 2.0

ARK A Resource Keeper

HDFS 2.0

HDFS 2.0--Scalability
1.0
 1.5/1.290GB
 NameNode 3000/

HDFS 2.0--Scalability

HDFS 2.0--Scalability

HDFS 2.0--Scalability
: 1010
Namespace66GB+1GB

13.7%cpu Namespace Namespace CPU

 x5~10

HDFS 2.0--Availability
1.0
NameNode/Failover /
2/3K40-50

HDFS 2.0--Availability

edit.new

edit.temp

Pull

edit. done1

FSImage

edit. done2

edit.done10

Push

edit.done11

Active NameSpace/FMS
BlockReport/BlockReceive

Standby NS/FMS

edit.temp

FSImage

Replay/CheckPoint

DataNode

DataNode

DataNode

HDFS 2.0--Availability
  1

HDFS 2.0--

 70-80%

split  CPU 

  

HDFS 2.0--

HDFS 2.0--

30%+Quota 40%+ 

MapReduce 2.0
1.0
JobTracker 1W /
 slotcpumem
 Shuffle+Reduceslot

MapReduce 2.0
ResourceManager

Agent MetaServer

Agent

MRMaster

MRMaster

Agent ShuffleService
MRSlave MRSlave

Agent ShuffleService
MRSlave MRSlave

Agent ShuffleService
MRSlave MRSlave

MapReduce 2.0 - 
W    MRShuffle/Task

MapReduce 2.0 -

 

 
 

Flash-300 A 33%

100%L

ROOT A

B

Normal-300

Normal-600

B 67% 100%L

100%L

100%L

MapReduce 2.0 ­
(cpu, mem)(cpu, mem, disk, disk io, net io) 
  

MapReduce 2.0 - 
  

MapReduce 2.0 ­ Shuffle

Schedule reduce

Meta MRMaster

Map Task

Reduce Task

Meta MRMaster

Heartbeat / assign shuffle PuergeJob

Local Commit Get Shuffle Results

Report shuffle task state

ShuffleService

Data Transfer Server Index Cache Data Server

Data & Events Manager
Map Results collector
Results & Events manager

Shuffle Copier ShuffleTask scheduler Connection manager

State & metrics http server

Buddy Ram Merger


W

HDFS
& Untility Storage
MapReduce
DAG
IDLE

Q & A
 

