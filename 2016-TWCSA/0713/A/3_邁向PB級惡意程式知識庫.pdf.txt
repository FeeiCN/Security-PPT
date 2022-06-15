PetaByte
  

PetaByte
· 
­  ­  ­ 
· Big data  ·  · NoSQL, MongoDB, GridFS · HDFS ?
2


3

 vs. 
vs.
·  · / ·  · 
: http://cybershafarat.com/2015/05/07/education-on-honeypots-sharif-university-courses-on-honeypot-detection/
4

Honeynet on TANet

 HN SP IPS

SP IR HN  SP IR HN  IPS SP FV HN  IPS SP HN 



HN SP

 HN SP

 HN SP IPS

IPS SP IR FV HN



IPS SP HN 

 HN FV IR SP DF IPS

5












: http://www.erlab.com/fr/20-23-boite-a-gants-pour-l-investigation-biologique-captair-pyramid.html
6


· : 33  · : 210 / · : 1.6 TB

 
*  2015/10 

 
7



· : · : · :

1250 1.2/ 6.3 TB

*  2015/10 
8


· 
­  ­  ­ ip ­ 
· : 250 · : 1/ · : 40 TB
*  2015/10  : http://www.erlab.com/fr/20-23-boite-a-gants-pour-l-investigation-biologique-captair-pyramid.html
9



: 1 : 50TB
: 1 : 1.6PB

: 1250

...

: 6.3TB

: 20 : 100GB

: 250 : 40TB

: 11 : 0 : 1.7TB : 0

2010/01

2013/07

2015/10

...

2020(?)

10

Big Data 
11

?
·  ?
: http://www.ettoday.net/news/20150709/532400.htm
12

Big Data?
· Big Data Splunk ?
­ Nasdaq  big data  ­ PetaByte (PB)  ­ !! !! !! ! ! !
: http://www.splunk.com/ 13

Splunk
Search Head Indexer
Forwarder
: http://docs.splunk.com/Documentation/Splunk/6.2.3/DistSearch/SHCandindexercluster 14


15



2013/8/21

2014/3/11

16

OLAP () vs. OLTP ()
Search Head
Indexer Forwarder
: http://docs.splunk.com/Documentation/Splunk/6.2.3/DistSearch/SHCandindexercluster 17


18



· : · : · :

1250 1.2/ 6.3 TB

19

NFS

· List all:

ls /index/md5

­ 1125 (: 700)

· Find prefix:
­ 52 (: 154)

ls /index/md5/aaaa*

· Find prefix:

ls /index/md5/a*

­ (: 65)

­ bash: /bin/ls: Argument list too long

ls /index/md5/a4d33ecc2484d951ee7a0db7996b3cf0 /index/md5/a4d3401de957a230dd71b552add96e90 ... /index/md5/affffac91fd14926193fe06639cf9370
20

DB ()




MD5 SHA512
Size File_Type
...

Metadata DB

21

 (MySQL)

· Find all:

SELECT count(*) FROM `malware`

­ 355 (: 700)

· Find prefix: aaaa*
­ 0.05 (: 154)

SELECT count(*) FROM `malware` WHERE md5 LIKE 'aaaa%';

· Find prefix: a*
­ 3.9 (: 65)
·  Index

SELECT count(*) FROM `malware` WHERE md5 LIKE 'a%';

22

NoSQL, MongoDB, GridFS
23

MongoDB 
· NoSQL (Not Only SQL)
­  DB schema
· BSON (Binary JSON) ·  OLTP (On-Line Transaction Processing) · 
­ Sharding (//) ­ Replication () ­ Petabyte (PB)-scale
· 2015: 4 · :  SQL join
: http://db-engines.com/en/ranking 24

Document-based vs. Tables
·  vs. 

MD5
7208754c4c53cac2b7a308b151e83240 7208754c4c53cac2b7a308b151e83240

Host_name c1.applicationgrabb.com r1.dirgreatbestepicl.info

Dst_ip 54.xxx.xxx.99 54.xxx.xxx.99

MD5
7208754c4c53cac2b7a308b151e83240 7208754c4c53cac2b7a308b151e83240 7208754c4c53cac2b7a308b151e83240

Scanner nProtect McAfee
Avast

Result Trojan.HTML.Iframe.T
JS/Iframe.gen.af HTML:Iframe-PE [Trj]

MD5
7208754c4c53cac2b7a308b151e83240 7208754c4c53cac2b7a308b151e83240 7208754c4c53cac2b7a308b151e83240

Src_ip
192.168.56.102 192.168.56.102 192.168.56.102

Src_port
54820 54820 54820

Dst_ip
70.xxx.xxx.223 46.xxx.xxx.250 213.xxx.xxx.10

Dst_port
14955 24044 55209

25

MongoDB Sharding

Shard 1

A..Z
Shard 2 Shard 3

A..G

I..J

K..O

Shard 4
P..Z

http://uk.wikipedia.org 26

MongoDB Replica Set

rs1

Node 1
Primary

rs2
Node 4
Primary

Replication Heartbeat

Node 2
Secondary

Heartbeat

Node 3
Secondary

Node 5
Secondary

http://uk.wikipedia.org 27

MongoDB Sharded Cluster
Python PHP
http://severalnines.com/blog/turning-mongodb-replica-set-sharded-cluster 28

 (MongoDB)

· Find all:

db.malware.count()

­ 0.001 (: 700)

· Find prefix: aaaa*
­ 0.05 (: 154)

db.malware.count( {md5 : {$gt: 'aaaa', $lt: 'aaab'} } )

· Find prefix: a*
­ 0.31 (: 65)
·  Index

db.malware.count( {md5 : {$gt: 'a', $lt: 'b'} } )

29

GridFS: MongoDB 
· MongoDB : 16 MB · GridFS
­  (Chunk) ­  ­  Chunk : 255KB
30

Hadoop? HDFS?
31

Hadoop Ecosystem
February 19, 2014
https://aryannava.com/2014/02/19/apache-hadoop-ecosystem/hadoopecosystem/ 32

HDFS/GridFS 

 Put 1GB 

 Put 1GB 

1600

1400

 HDFS

GridFS

1200

1GB * 1

11.472

76.805 1000

100MB * 10 10MB * 100 1MB * 1000

12.744 26.261 145.489

51.872 45.041 30.688

 800 600 400 200

100KB * 10000

1372.342

137.665

0 1GB 100MB 10MB 1MB 100KB * 1 * 10 * 100 * 1000 * 10000

HDFS GridFS

33

HDFS/GridFS 

 Get 1GB 

140

 1GB * 1
100MB * 10

HDFS 10.414 10.42

GridFS 20.155 16.916

120
100
80 
60

10MB * 100

10.931

9.367

40

1MB * 1000

15.475

14.631

20

 Get 1GB 

100KB * 10000

47.366

115.934

0 1GB 100MB 10MB 1MB 100KB * 1 * 10 * 100 * 1000 * 10000

HDFS GridFS

34

 


Splunk


NFS  GridFS (MongoDB)




MySQL  MongoDB
 ()

35

 
36

