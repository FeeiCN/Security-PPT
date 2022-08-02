HBase
 2012.7.1

Agenda
· HBase · HBase ·  ·  · Q&A

HBase
· HBase
­ HBase is the Hadoop database. Think of it as a distributed, scalable, big data store.

HBase
· HBase
·  ·  ·  ·  ·  · schema ·  · JAVA

HBase
· 2011.3 · 2011.5 · 2012.1:
­ 2 ­ 150 ­ 122 ­ tps100k /s ­ 60TB

HBase
· 2012.1
­ 0.90.2RC3

HBase
· ...
­  ­  ­ tps ­  ­  ­  ­ 


· 
­  ­ compact ­ gc ­  ­  ­ region  HFileV2


· 
­  ­ multi assign ­  ­ hang


· gc
­ YGC
· Eden2GB
­ FULL GCcrash
· CMS · mslab
­ cmsload
· CMSInitiatingOccupancyFraction · SurvivorRatio


· 
­ compact ­ compact ­  ­ java.lang.Class.getMethod


· HDFS
­ blockreport  cdh3u3 ­ datanode 
· dfs.socket.timeout · dfs.datanode.socket.write.timeout · dfs.datanode.failed.volumes.tolerated · dfs.client.cached.conn.retry · dfs.datanode.max.xcievers
­  FSNamesystem.commitBlockSynchronization


· 
­ 0.94
· group sync · cache · compact · lazy-seek · HLog Compress · 


· 0.94 · 
­  ­  ­ 
· 
­ BUG


· 
­ 100k region15-30 


­ crash ­ hlog ­ metacache ­ rpc ­ zk ­ tcpnodelay ­ bulkassign ­ zk ­ hdfs


· 
­ (server crash):15-30 ­ 1
· ddl
­ () ­ 


· 






· 
­ 4 ­ 500+ ­ 400TB ­ tps300k /s ­ 30 ­ 6 ­ 0.90/0.92/0.94


· 
­ 2release 1-2 ­ 0.908 (
87%) ­ 0.921(10%) ­ 0.941(3%)


· 
­ patch: 30 ­ patch: 20 ­ 0.90.4patch2.5% ­ critical: 8 ­ apache id: chunhui shen/xing shi/binlijin
· HBase


·  · snapshotreplication · cache · HDFS · NameNode HA ·  · Hive in HBase ·  ·  · 

Q & A

