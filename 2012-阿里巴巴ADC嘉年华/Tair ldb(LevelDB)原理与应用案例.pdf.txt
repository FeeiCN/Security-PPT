Tair ldb(LevelDB)
--- () neveray@gmail.com

Tair 



  

mdb
kvkey







rdb (Redis)
kv 

 

ldb (LevelDB)



kvkey







LevelDB Tair ldb ldb 



LevelDB

LevelDB
· GoogleKV · range · Merge-Dump · MemTable

LevelDB
· SSTablelevel · Compactlevel · IOIO

LevelDB

Put

WriteBatch

MemTable

Log

MemTable

Log

L0 1 8 L1 0 8 L2 0 9

39 24 40 11 20

10 20 42 50 80 91

92 99

LevelDB

Get (key: 7)

MemTable





MemTable





L0 1 8

39

L1  0 8 
L2 0 9

24 40 11 20

Log

Log

10 20 42 50 80 91

92 99

LevelDB Compact
· memtabledumplevel 0sstable 
· level compact
­ level 0 sstable ­ level 1-n: levelsstable
· levelcompact range

LevelDB Compact (Memtable/L0)

MemTable

L0 1 8 L1 0 8 L2 0 9

10 20 24 40 11 20

Log
42 50 80 91

92 99

L0 1 8 L1 0 8 L2 0 9

39 24 40 11 20

10 20 42 50 80 91

92 99

LevelDB Compact (L0/L1)

L0 1 8 L1 0 8 L2 0 9

39 24 40 11 20

10 20 42 50 80 91

92 99

L0 10 20 L1 0 4 L2 0 9

59 11 20

24 40 80 91

42 50 92 99

LevelDB Compact(L1/L2)

L0 10 20 L1 0 4 L2 0 9

59 11 20

24 40 80 91

42 50 92 99

L0 10 20 L1 5 9 L2 0 5

24 40 6 9

42 50 11 20

80 91

92 99

LevelDB Compact (L0/L1 Move)

L0 10 20 L1 5 9 L2 0 5

24 40 6 9

42 50 11 20

80 91

92 99

L0 L1 5 9 L2 0 35

10 20 6 9

24 40 11 20

42 50 80 91

92 99

Tair ldb

· Tair · Tair · IO · / · MdbKVcache · SSD5w qps

ldb

Tair ldb 

Ldb Storage Engine


Get

Mdb cache 

 LevelDB

... LevelDB

Ldb Storage Engine

Put



Mdb cache



LevelDB

... LevelDB

ldb

ldb
· counter SSD
­ 
· TC  SAS
­ key compact
·  btFastDump

FastDump
·  ·  ·  · area · 

FastDump
· LevelDBcompact
­ ldb
· 
­ server ­ LevelDBMemTable
· 
­ /

FastDump
· LevelDB
­ WriteBatch ­ group commit
· dump qps(KV size < 100byte) 150w

WriteBatch

FastDump

MemTable MemTable

MemTable

MemTable

MemTable MemTable

MemTable

L0 0 0 L1 1 1 L2 3 3

2 2 20 20 11 11

10 10 40 40 80 80

92 92

FastDump (Compact Move)

L0 0 0 L1 1 1 L2 3 3

2 2 20 20 11 11

10 10 40 40 80 80

92 92

L0 2 2 L1 0 0 L2 3 3

10 10 1 1 11 11

20 20 80 80

40 40 92 92

FastDump
· DB
­ cluster
· 
­ client cluster/DS 

FastDump

client

DS

ON

DS

DS

cs

DS DS
DS
ON

FastDump()

dump client
client

DS

OFF

DS

DS

cs

DS DS
DS
ON

FastDump(DS down)

client

DS

ON

DS

DS

cs

DS DS
DS
ON




· 
­ 
· 
­ 
· (ssd)
­ IO
· range
­ bloomfilter


· compactIO IO
­ rangelevelcompact
· FastDumpdb
­ area


·  http://code.google.com/p/leveldb/
· LevelDB http://rdc.taobao.com/blog/cs/?p=1378
· Tair ldb http://rdc.taobao.com/blog/cs/?p=1394



