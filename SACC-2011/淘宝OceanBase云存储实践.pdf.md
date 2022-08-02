OceanBase

2011.9 rizhao.ych@taobao.com
SACC2011 1


 PBTB    
 OLTPQPSTPS  OLAP
 SQL
SACC2011 2


   
 DynamoCassandra  BigtableHBase
   
 NOSQLSQL(Google Megastore)  ""
SACC2011 3


 
   Join
 OLTP
   SQL
 OLAP  
SACC2011 4


 
 groupgroup  group
 1TB20MB/s 1TB / 20MB/s = 50000s10
 
SACC2011 5


 Oceanbase  
     SAS  SSD
SACC2011 6

Oceanbase
 RootServer+Schema/B+/...  UpdateServer+(+SSD)  ChunkServerB+(SSD)
 MergeServerS...ACC2011 7

Oceanbase
 
       Join
       Copy-on-write  Online schema change
SACC2011 8

Oceanbase

 
 40+  4+  join
 
       <50ms
 
 Mysql 16 * 2Oceanbase 12 + 2  Load   <50ms

SACC2011 9


 SSD
  (Intel SSD3~4IOPS vs SAS180 IOPS)  (~100MB/s)  SSD 20/GB vs SAS 3/GB  OceanBase
1. dumpSSD 2.  3. SSD
 
   50/s  500/s780MB/s
SACC2011 10


 
       Paxos
 
 
SACC2011 11


 CTU252.5TB
 MongoDB => Oceanbase  5UPS500G  UPS200GB
 
 10~20W  OLAP
 SNS feed indexCassandra => Oceanbase  
SACC2011 12

-SQL
 
 /  
 SQL
 where, having, group by, order by, limit, offset  IF  IN,   
SACC2011 13

 - OLTP
 
 GBTBTB  UPS  UPSUPS  SQLSQL  Oracle +  + EMC  UPS
 entity groupentity group entity group
SACC2011 14

 - OLAP
 
 MapReduceDoing 1.  2. ChunkServer 3. ChunkServer 4. top N
 UPS  Done    OLAPtop Ndistinct
SACC2011 15

Oceanbase
 OB
       http://code.taobao.org/project/view/587/
SACC2011 16



 

 

 

 

 

  + Review

 

 

 

 Direct IO

 

 Cachecopy-on-write

 

SACC2011 17

·  · rizhao.ych@taobao.com
·  · http://nosqlnotes.net
SACC2011 18

