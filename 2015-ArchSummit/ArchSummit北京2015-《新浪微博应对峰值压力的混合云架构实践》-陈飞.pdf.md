DCP 



 DCP  Feed


DCP   

Part 1
DCP

DCP


·  · 


·  ·  · 

DCP

·  
·  · 


DCP
·  · 6



 

·  · 

 

 

·  · 
·  

DCP

 

 

DCP

Hadoop

PHP

Java

...

JPool

Motan

DNS

swarm

roam mesos yarn

dispatch

Elastic Partition

pluto

SLB Registry Cloud Driver

SLB

Nginx

Part 2




DCP

""

 - 

Java Host

crontab python

jpool

java

Php Host

crontab rsyslog puppet

fpm

App

volume

App cAdvisor

volume
-link -link

scribe

logtailer

swarm agent
consul client

ELK



Java

php

cAdvisor 0.7.1.fix

Mesos 0.25

Swarm 1.0.0

Consul 0.5.2

Docker 1.6.2 devicemapper-direct-lvm CentOS 7.1.1503/3.10.0-229.el7.x86_64

Daemon Wrapper Docker 1.3.2
devicemapper-loop-lvm CentOS 6.6/2.6.32

Registry v1 Registry v2

DCP
10.87.0.1 VPC subnet

10.86.0.1 VPC subnet

10.89.0.1

10.88.0.1

DCP

a
VPC

 ­ 
 ·  ·  · 
 1.  2. 




 



- 

CPU sysbench --test=cpu --cpu-max-prime=10000 run sysbench --test=threads --num-threads=64 --thread-yields=2000 --thread-locks=2 run
 fio -direct=1 -iodepth=64 -rw=randwrite -ioengine=libaio -bs=16k -size=10G numjobs=1 -runtime=1000 -group_reporting -name=/path/testfile
 mbw -q -n 10 256
 netperf -H host -l second -t [TCP_STREAM|UDP_STREAM|TCP_RR|TCP_CRR|UDP_RR] -s localBufferSize -S remoteBufferSize -m localPackageSize -M remotePackageSize -D TCP_NODELAY


 - 

Part 3


 - 

weibo.com

weibo.cn

api.weibo.com

VIP PHP

VIP/Nginx

API

API

Motan/ConfigService

Service

Service

Service

MC

Queue

Mysql

HBase

Redis

...



   
  
 2/8 20% 80%

 - 

weibo.com

weibo.cn

api.weibo.com

VIP PHP

VIP/Nginx

API

API

Motan/ConfigService

Service

Service

Service

MC HBase

Queue Redis

Mysql ...

LB

Hongbao PHP

R

PHP

LB

Hongbao API
friend

Remind API Motan/ConfigService
unread

     Feed    
Feed RPC

MC

Queue

Redis



Static PartitioningElastic Sharing

DCP ­ Elastic Partition
JPool

swarm

Scheduler API yarn
Elastic Partition API:

mesos

Java

php

hadoop

...

cloud

Partition - 



Pool


Group

DCP



DCP

1

6

7

API

2

2

3

5

8

Offer

cluster api

Buffer

Quota

Constraint

swarm

9 Consul

(4) docker create/start

Wrapper
Docker Daemon

Host Swarm Agent

4

Wrapper
Docker Daemon

VM Swarm Agent

DCP - partition

Scheduler

swarm

(3)

(4)

Cluster API

Offer

(2)

(4)

Elastic Partition API

Cluster

yarn 2















Buffer














       



 - 
Host

count=2 DCP

Host Host

 

 - 

V0.4.0 ...
V1.0.0.rc1

 - 
 Working on Docker Daemon Wrapper for 1.3.2  Name, Total Memory, CPUs, Labels

Part 4




weibo.com

weibo.cn

api.weibo.com

VIP PHP

VIP/Nginx

API

API

Motan/ConfigService

Service

Service

Service

MC HBase

Queue Redis

Mysql ...



LB





Hongbao PHP

R

PHP



 LB




Hongbao API

Remind API



Motan/ConfigService



friend

unread

Feed RPC







MC

Queue

Redis

Consul

7

 ­ Reload
 NginxReload  
 reload10%  

Nginx Reload
 fork work   clientbackend   work connection 
  https://github.com/alibaba/tengine/issues/595  1.9.0
 work cpu   Nginx PlusAPI

 - Nginx Upsync

 Nginx Plus  Consul  https://github.com/weibocom/nginx-upsync-module
Nginx

work

update module

work

core-module

work

Nginx Upsync - 
   server 10.xx.xx.xx:xxxx max_fails=0 fail_timeout=30s weight=20; # 
   20  20%=16

Motan RPC

 MotanIDC  IDC
 Motan

IDC A

IDC B

Cloud IDC

Config Service

DNS

.

.

.

rs.a.6379

rs.b.6379

rs.c.6379

resource.idc.port

.

rs.a.6379

rs.b.6379

rs.c.6379

resource.idc.port

Consul

   QPS

Part 5


DCP











MAPI 

 



P A

Swarm

Docker 

Mesos 



A

S

Java



I A

Buffer 



ECS

SLB 

A S

 



 



     



 

DNS

PPool

 Yum/

Feed
Docker Register
Docker  Consul  Docker 
Docker 

DCP
   201510  3000+
   10  <5

