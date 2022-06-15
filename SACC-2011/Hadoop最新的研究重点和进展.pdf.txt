Hadoop
@Baidu
SACC2011

About me
· Hadoop Tech Leader in Baidu · HADOOP NUMBERs in Baidu
­ Nodes: 1.5w ­ Input data/per day: > 10PB ­ Clusters: 10 ­ Big Cluster: 3000 Nodes ­ The most busy Hadoop Clusters in the world
SACC2011

Agenda
· Community - Hadoop 2.0
­ HDFS 2.0 ­ MapReduce 2.0
· Baidu - Hadoop 2.0
­ Baidu - HDFS 2.0, HDFS 3.0 ­ Baidu - MapReduce 2.0
· TODO
­ CloudTransfer ­ MR-Ontime(App Stability) ­ Big, Big, Big Cluster?

SACC2011

Community-HDFS2.0-Scalability
· Scalability
­  ­ 

· HDFS Federation
­ 4 months ­ HDFS-1052 ­ hadoop-0.23 (coming soon, 2011-11)

SACC2011

HDFS Federation
SACC2011

Community-HDFS2.0-Availability
· Availability
­ NameNode ­ 1.5+1.5+200040

· Avatar NameNode · Backup NameNode
SACC2011

Facebook-Avatar NameNode 1. NetApp Filer: 100w 2. VIP ­ 
SACC2011

-Backup NameNode 1.  2. Backup Node
SACC2011

· MapR - HDFS SACC2011

Community-MR2.0
· Next MapReduce (MapReduce 2.0)
­ Scalability
· Cluster resouce management · Application lifecycle management
­ Utilization
· cpu, memory, io, network · remove fixed partition of map and reduce slots
­ Support for programming paradigms other than MR
· MPI · Multi-version Hadoop · Spark · ......
· 100hadoop-0.23
SACC2011

SACC2011

Baidu-HDFS2-Scalability
· 3kw3kw
­  7.8G ­  4.3G

· 1010
­  240GB ­  140GB
· 
­ NameNode 
SACC2011

Baidu-hdfs2-architecture FileMgmService

NameSpace

/user1/1.txt -> inode120 /user2/2.txt -> inode231 /user2/dir1/3.txt->inode450

FileMgmService

FileMgmService

inode120-> user,group, rwxr-x---, size, repl blkX, blkY, blkZ inode450-> user,group, rwxr-x---, size, repl blkX, blkY, blkZ

inode231 -> xxxxxx

inodexxx -> xxxxxx
SACC2011

 Tree-NameSpace FileMgmService

Flat-NameSpace FileMgmService

MySQL/File/Memo ry/Your Brain
FileMgmService

SACC2011

· HDFS2
­ : 1010
· Namespace66GB + 1GB · 
­ :
·  Namespace
· CPUNamespace 13.7%
·  CPU
SACC2011

Baidu-hdfs3-architecture (?, ) 1) Filerename, 

2) Dirmv 3) 100200


NameSpace

/dir1/ -> #1 /dir1/dir11/ -> #2 /dir1/dir12/ -> #3 /dir1/dir12/dir121 -> #4

DirMgmService

DirMgmService

DirMgmService

+ #1 - 1.txt - xxx - 2.txt - xxx
+ #4 - 3.txt - xxx - 4.txt - xxx

+ #2 - 1.txt - xxx - 2.txt - xxx

+ #3 - 1.txt - xxx - 2.txt - xxx
SACC2011

Baidu-HDFS2-Availability
SACC2011

Baidu-hdfs2-availability 1) 1 2) namenode
SACC2011

Baidu-HDFS2-

DataNode

BlockAccessLay

Block Storge Format V1

Meta Header
Compressed Chunk 1
Block Storge Format V2 Compressed Chunk X
Index Trailer

CompressService
1) Linux Idle class 2) block compressing
service 3) No State 4) why is a process?
1.  2.  3. split 4. cpu 5. 
SACC2011 6. : 1/2
7. +Append

Baidu-HDFS2-


Client  Client

64KB Packet
64KB Packet
Compressed 64KB Packet Compressed 64KB Packet

64KB Packet
64KB Packet
Compressed 64KB Packet Compressed 64KB Packet

DataNode DataNode

: 100MB/s -> 175MB/s

SACC2011

Baidu-MR2.0

· Shuffle * · MapReduce Task · 
­ slotscpumem ­ : cgroupLinux container
· Scalability - Distributed JobTracker *
­ AppTracker + JobTracker
· Availability ­ JobTracker Failover
­ job recover ­ task recover

SACC2011

Shuffle

JobTracker
Shuffle Reduce 


Heartbeat shuffle
TaskTracker
Data Server

Event Fetcher Shuffle

doShuffles reportShuffles

ShuffleService
Scheduler RAM Manager
Copiers Merger

ReduceTask
Merge
Reduce

getShuffleResults

SACC2011

SACC2011

SACC2011

SACC2011

· Scalability - Distributed JobTracker
­ appjob ­ jobtrackerapptracker
 ­  ­  ­  ­  ­ Community-MapReduce2.0
SACC2011

JobTracker

AppTracker JobTracker

Computing Layer JobTracker

FileMgmService

NameSpace FileMgmService

Storage Layer FileMgmService
SACC2011

TODO- CloudTransfer
· 
­ flume, scribe
· 
­  ­  ­ jar
cachearchive ­ hdfs, hdfs ­ hdfshdfs ­ 3
SACC2011

compress small file  


Master
task-1A:/1 -> B:/1 task-2C:/2 -> B:/2, D:/3, E:/4 task-3F:/5 -> indexserver-*/5

   
stop/resume 
... ...

SACC2011

TODO-MR-Ontime

· throughput

computing-realtime

­ (> 2) ­ : ()
· realtime

computing-ontime computing-throughput

­ (< 10)

­ : latency

­ Twitter-Storm/Linkedin-Kafka

· ontime

­ (10 ­ 2)

­ : 

· 

SACC2011

TODO-Big,Big,Big Cluster?

· Datacenter
­ 1w
·  ·  ·  · :
­ """" ­ storage.com, computing.com

 
SACC2011

Q & A Thanks
SACC2011

