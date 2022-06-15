-
Open Data Processing Service, ODPS
 ­  


· 
·  ·  ·  · 
2

-
· 
­  ­  ­ 
· 
­  ­ CTR
3

-
·  ·  ·  ·  ·  ·  · 
4


· 
· 
·  ·  · 
·  ·  · 
5

-

LVS

LVS























...



6



-



Web IDE

· · ·

Console SDK

 /

HTTP

 



-
· 
   RESTful API  
· 
 Project · Table/Partition · UDF/Resourcejarpy · Job/Instance
 User/RoleProject
8

-
     
   

-





Project 1

Project 2

 A A

B

Worker 1

...

Worker m Bmeta

Scheduler

Executor 1 ... Executor n

 

 A

 B ···

-
· Worker/Executor
· 
· Scheduler
·  · ODPS
· failover
· meta
· OTS · 
11

-
·  · 
· 
·  · Master-Slave · PaxosMaster · (Chunk)
· CFile · PB/
· 
· SQLMRPregel · DAGCPU/MEM
12

·  · 
· 
·  ·  ·  ·  · 



13

--











--1
 
· 
 
·  ·  ·  · 
15

-2
· 
­ project ­ project
· 
­ 
{"LatestVersion":V1,"Status":{"ClusterA":"V1","ClusterB":"V0"}}
­ 
· 
­ ( ­ 
· 
16

--

Restful API



Parameter server



MPI

...

SQL

PLSQL



Graph

MR

ODPS 



17

--
 SQL
 Hive  (TP      PythonJavaUDFUDAFUDTF  DAGC++  Code gen  Service-Mode
18

-
 Service-Mode
· worker -  · Shuffle · m*rrreducemap
 ·  · LLVM
 SQLServiceMode
 FailoverprojectAdhoc 

-MPI
 

 
k-means SVD
20

-
· 
­  ­ ////
· ODPS
­ PregelJava ­ IO
 
­ PageRank ­ K- ­ NMF ­...
 
21

·  ·  · 
·  · 



22


·  · ACLPolicy · project ·  ·  · 
23


· ODPS
­  ­ RESTful API ­  ­  ­ SQLMapReduceMPI ­  ­ ACL/Policy
24

