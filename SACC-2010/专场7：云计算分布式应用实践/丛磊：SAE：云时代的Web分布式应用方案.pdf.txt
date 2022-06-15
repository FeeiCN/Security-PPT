Sina App Engine
- a distributed web solution on cloud
SAE Team http://t.sina.com.cn/SinaAppEngine

SUMMARY
Why we do Our destination Our concerns What we done What we will do

Why we do
The reason is quite simple:
· great project comes from coincidence · cloud computing can make money · blank space of internal market · we have technical advantage

Our destination

Php XHprof Image

Stor Memcache

SMail Appconfig

· Public Cloud · Entire Web Solution

DB RDC

Tmpfs

Fetchurl DeferredJob

Cron

Taskqueue

Our destination
What is differences between SAE & VPS:
· focus on web developer VS no special user · service user VS device tenant · entire distributed web solution VS only basic service · strong SLA VS week SLA · pay for usage VS prepayment

Our concerns
· static scalability & dynamical scalability · isolation & security · high availability ( computing & data )

What we done
2009.11.3 birthday sae.sina.com.cn

What we done

Timeline:

Version

Date

SAE regroup 2009.8.1

SAE alpha1

2009.11.3

SAE alpha2

2010.2.1

SAE beta

2010.8.**

Functions start coding ...... http;cron;mysql;mc;sdk mail;xhprof;tmpfs;appconfig;image cloud beans;taskqueue;rdc;deferredjob;https

Support internal projects:

30+ weibo apps run on SAE

Support external projects:

2000+ web developers on SAE 1500+ apps on SAE 400+ deploy actions every day

What we done
Preview: Sina Weibo Developer Conference 2010.9~2010.10
. weibo architecture . weibo cache design . scale mysql . real-time serch . sina cloud
coming soon......

What we done

What we done
App Sandbox:

What we done

Service Type Permanent Storage Impermanent Storage Async Computing Sync Computing

Details Mysql(RDC*);Stor;Sina S3 MC;tmpfs Taskqueue;DeferredJob;SMail;Cron Image;Fetchurl;ComfirmationCode(*)

What we done
Taskqueue features: 1, dynamic scalability
. multi process + multi thread . worker delay time 2, memory queue, master-slave sync 3, dead queue awake

What we done
RDC features: 1, mysql cluster 2, full mysql protocal 3, sql security

What we will do
SAE 
· No SQL DB ? · Java, Python support ? · C support ? · VM support ? · CDN support ?

Conglei
"always coding" sprewellkobe@163.com http://t.sina.com.cn/kobe

