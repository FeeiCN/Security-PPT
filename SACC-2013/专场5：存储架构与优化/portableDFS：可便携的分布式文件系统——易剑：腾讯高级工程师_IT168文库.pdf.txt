portableDFS
----
http://aquester.cublog.cn



2010

·  http://code.google.com/p/mooon

2008

· Hadoop

2009

· Hadoophttp://bbs.hadoopor.com
 · Hadoop

 · http://aquester.cublog.cn

2002

·  · 


2002


2002


2004


2007

2


1
CAP
2

3

3



31



2



3



4

CAP

RDBMS (MySQL)

BigTable HBase Redis MongoDB

Consistency

CA

Availability

N/A

CP

AP

Partition tolerance

Cassandra Dynamo CouchDB
portableDFS
5



GFS

HDFS

portableDFS

fastDFS

mogileFS

mooseFS openAFS pNFS

6

portableDFS vs HDFS

CAP   SCP      

portableDFS

HDFS

AP

CP





















C++

Java





Web 





7


8

portableDFS
    
9

portableDFS
 AP NN=- scp  10~100  
10



31



2



3



11


  DFS  
12



13

portableDFS

Master

Master

RPC

()

()

RPC
DataNode DataNode DataNode DataNode DataNode
socket
Client
14

portableDFS-DataNode

DataNode



Resource

socket
Client


Agent
thrift RPC heartbeat
Master

15

portableDFS-Client

Client


call


socket



DataNode



16

1/4

portableDFS
1010 1
1/10

1/100
17

2/4
Client
socket










 

 

 

 

Disk

Disk

Disk

Disk

18

3/4
Client
socket

& 


& 


& 




&  
19

4/4
Client

&a socket = accept()

&a read_head()

 &b
read/write()

a



20

    LXC Linux Container









Google-hash



SparseHash





















21



Client 


DataNode Cluster

 

DataNode


 

DataNode

DataNode DataNode

DataNode

22



Client



 

1
 1
1



DataNode Cluster

DataNode


DataNode

DataNode


DataNode

DataNode


DataNode

DataNode

23



1
Writer

portableDFS

Proxy

DataNode Cluster

N

24

portableDFS-Master

DataNode

Master

thrift Service
Monitor

 Master
28

Master

 Master

DataNode 
DataNode

DataNode
29



 Master

 

DataNode 

DataNode


30



 Web        
 DataNode
31



      

MasterDataNode DataNode

32

SCP
SCP

scp

sshd

portableDFSProxy

portableDFSCluster

33

portableDFS
 long open(const char *pathname, int flags, mode_t mode, int replication);  long open(const char *pathname, int flags, mode_t mode);  long open(const char *pathname, int flags);  int close(long fd);  ssize_t write(long fd, const void *buf, size_t count);  ssize_t read(long fd, void *buf, size_t count);
 int remove(const char *pathname);  int upload(const char *local_pathname, const char *remote_pathname);  int download(const char *remote_pathname, const char *local_pathname);
34



35


"" 
DataNodeIP

DataNodeClientMaster
36


37


2 16CPU64G
38



31



2



3



39

portableDFS
 AP   SCP  
40

portableDFS



 

 

 10M~3G
41



 
1TB   mount MapReduce 

 

 

  

portableDFS

42



Proxy



portableDFS Cluster

portableDFS Cluster

portableDFS Cluster

43


 DataNodeMaster  SOCKETDataNode CAPAP
45

Thanks!

784027584

eyjian@qq.com

