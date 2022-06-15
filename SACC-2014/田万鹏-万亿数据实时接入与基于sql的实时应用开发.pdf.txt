 SQL
 
2014.09.17


 2010
   TDW  TDBank  TRC
 MRDAG SQL

TDW
 2009TDW  20101.0500  2011+TDW  2012



 HDFS



TDW Hive+Hadoop
2010:500 2012:2000 2013:4000 2014:8800

100IDC DB
 
  
  

 
 



       

   

TDBank

TDW TRC

TDBank



 Agent


 TDBus
/

 Tube

 TDSort

/ 

TDW TRC

1. 

msg



msg

Agent

File DB

MsgTransfer FileReader DBLoader DBSync

Agent Loader

 

 
       DB  DB



 AgentLoader
   

2. 

 Agent

 TDBus

 TUBE

 
 
 /    
 

3. 

Producer
Producer
Producer
Producer group

Broker Broker

Broker Broker

Broker cluster
Consumer

Zookeeper
Master (active) Master (standby)

Consumer
Consumer
Con sume r group

   

Master HA
TUBE

     

4. 

TUBE

Topology

spout

bolt

spout

bolt

spout

bolt

Storm

Storm

TDW (hdfs)
       

TDBank

 10,000  200TB  10,000  1-2s  99.999%

/ / /  


            
TDWSQL 

TDBank 
  

SQL
 SQL  SQL    


 Storm  SparkStreaming

EasyCount

EasyCount(SQL)

Storm/JStorm

Spark Streaming

Storm-Yarn

Spark-Yarn

GaiaYarn


TDBank 
KV/DB 

SQL
EasyCount /   Topology Storm

 withwheregroupbyunionjoinsql  HIVE  maparraystruct


TDBank KV/DB

EasyCount-SQL
   JOIN      


 
 TDBank
 
 DBmysqlpg  KVtderedis  HBase

JOIN
 JOIN
   
 EasyCount
   
 
   UNION + Group By

JOIN
 KV
 DB
JOIN















KV

DB


 select count(uin) ... group by appid        
 group by appid coordinate by dtime  with aggr interval 60 seconds  with accu/sw interval 180 seconds


 count(distinct uin)    
 count  
 HyperLogLog
 countdhllphllp_mergehllp_get  199.5%45KB



 SQL
 select expr from ....
 
 
 UDF
  
 execute sql

select execute (
DEFINE x as int, .... {
FOR( condexpr x := expr
) IF(
condexpr x := expr ) .... } EMIT $x ) from tbl

APPUV
 
 100APP10UV  UV0  APPUV1

msg
KV keyvalue

hllp
AGGR


hllp_get
JOIN
hllp_merge





KV

with (select appid, areaid, hllp(qq) b from tbl group by appid, areaid ... 60 seconds) t1 \ (select appid, areaid, jkv.k, hllp_merge(t1.b, j.ball) ball, t1.g g from t1 left join jkv \ on concat(appid, areaid)=jkv.k)) jt \
insert into jkv select k, ball from jt \ insert into dest select appid, areaid, hllp_get(ball) from jt

UV99.5% KV100*10*45KB=45MB KV100*10*1440=15020/s

EasyCount
 20005000    BG

EasyCount  
  


 


QQ364787069 emailtianwp10@qq.com steventian-
 tencentbigdata

Q&A

