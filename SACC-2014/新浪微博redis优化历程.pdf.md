redis
 @fishermen


·  · Redis ·  · Q&A
2

-
· Redis
 (counter)


 (graph)

3

-

· 

6 IDC

500+servers

3700+ instances



24T+

7cmds/day

1.2read/day

2write/day

4

Redis
5

Redis
· mc · mysql · Graph mc 10G
 mc 2G · 
6


· 2010Graph mc 30G+ 10wTPS
· Mysql
­  ­ Listmysql
· 
­ MC+->
7


· 
­ mc40GGraph db  ­  ­ 
· 
­ Redisstorage (graph/counter) ­  redis O(1) ­  ­ Graph db
8


·
­ 30G- PV5kw­   ­ 
· 
9

Redis
10

Redis
·Redis 2.0
·Graphhash40G 10w TPS4 Server
·Counter:20G 2w TPS2 Server
11


·2011
­  ­  ­ 
·
­ slaveserver ­ 3-4slavewrite
·10-20
12


·
­  ­ zset ­ 
13


·
­ RedisSlave ­ Masterslave2M-S-S
 ­ IDC Master
· IP
­ work
14


·2011Graph 100G+ 
­ 3redis ­ 
·slave1-2   1ms->3ms
·
­ 6 ­ BUG
15


·pageCacheredis swap ·   ·client ip 
16


·
­ 3/5 ­ /  ­ ClientBalancerIP
·
­ pagecache ­ Aofrewriterotate ­ mysqlIOrdbaofpsync,
repl-backlog-size, repl-backlog-ttl ­  ­ Others...
17


· 50G 1-2
­ 
· 100G+3+
­ -> ­ ->
18

Redis
19

Redis
·  ·  · SLAVE ·  · G
20


·2013Graph
­ TMS T ­ server ­ GraphHash
21



·Counter 

­  5G+

­ G MS T

­ Feed 

 ­  <30%

2013000001.rep 800
2013000001.cmt 360
2013000001.like 1000
2013000001.read 10000

22


· ·
23



·Graph
­ storagecache ­ hashLongset
·Counter
­ cdbtable 
­ KV

2013000001.rep 800
2013000001.cmt 360
2013000001.like 1000
2013000001.read 10000
2013000001 800|360|1000|10000

24



·Counter

­ cdb=schema+tables

­ double-hash robj

795

ta b le 3

752



­ aux_dict

sc h e m a 682

ta b le 2

643

­ extend_dict

502

ta b le 1

590

·  
·server 

a u x d ic t e xte n d d ic t
25


·-> · T 3+idc 
­  ­ 
26

Redis
27

Redis
· Graph cache longset
­  1/10 ­ 
· Counter cdb
­  1/5 ­ 3-5
28

Redis
· 
­ Counter SSD20810 ­ Vector ­ Others...
29


· 2014SLA 69
­ Server 6+IDC  ­  24T+ ­  5000w+ TPS ­ /
30


·  
­ Configserver ­ CacheService 
    etc.
­  /etc.
31


32


·  
­  motan  ­  
c o n fig se rve r

in vo ke r

c a c h e Se rvic e

mc mc mc

re d is re d is re d is

mc mc mc

re d is re d is re d is

c o n fig se rve r

ssd c a c h e ssd c a c h e ssd c a c h e

db db m ysq l

db db h b a se

db hdbba se
33


·  · 
34


·  
·  · root cause
35

Q&A
36

