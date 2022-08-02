ArchSummit 2015



·  ·  ·  ·  · Sisyphus






· 
­ PPCUGCPGC ­  ­  ­ 
· 
­ CPU, Network Bound ­  ­  ­  ­ 

· 
­  ­  ­  ­ 
· 
­  3 ­  V  ­ 



Docker - Build, Ship, and Run Any App, Anywhere

Mesos ­ A distributed systems kernel

Mesos Master

Mesos Slave

Mesos Slave

· Scalability to 10,000s of nodes · Fault-tolerant replicated master
and slaves using ZooKeeper · Support for Docker containers · Native isolation between tasks
with Linux Containers · Multi-resource scheduling
(memory, CPU, disk, and ports) · Java, Python and C++ APIs for
developing new parallel applications · Web UI for viewing cluster state

Chronos - a distributed time-based job scheduler
·  Mesos  · ISO8601 ·  ·  · DAG  ·  Docker  · RESTFull API & WEB UI · 

Why Mesos + Chronos + Docker?
· Why Mesos?
­  ­ 
· Why Chronos?
­  Mesos ­ Do not Reinvent the wheel ­  ­ RESTful APIbasic web UI ­ 
· Why Docker?
­ Why not Docker?





Mesos + Chronos

Chronos

Chronos


·  V 
­ 
· 
­ ()
· 
­  API 
· 
­ OK
·  DC 
­ 
· 
­ 



Chronos  deactivate Offer
Mesos master log
I0729 13:39:55.346318 1759 master.cpp:2933] Sending 2 offers to framework 20140722-064549613093130-5050-1717-0000 I0729 13:39:55.666754 1763 master.cpp:2628] Status update TASKRUNNING (UUID: 0303d09b-b37f494f-93fe-362455dc3492) for task ct:1406612390227:0:Transcoding3399315169476042 of framework 20140722-064549-613093130-5050-1717-0000 from slave 20140723-113920-613093130-5050-1693-0 at slave(1)@10.15.139.38:5051 (mesos-test-dev003-bjdxt.qiyi.virtual) I0729 13:39:55.676386 1761 master.cpp:1319] Deactivating framework 20140722-064549-6130931305050-1717-0000 I0729 13:39:55.676584 1751 hierarchicalallocatorprocess.hpp:407] Deactivated framework 20140722064549-613093130-5050-1717-0000
Chronos log
I'm hungry, haven't received any offer for a long time...

Chronos 

Chronos  


· Chronos  ·  Zookeeper  offer
·  ·  ·  API  ·  ·  memory, disk 


· 
­  ­  ­ 
· 
­ bank switch


· Chronos   ·   99.99% ·   ·  200  ~ 300   Docker  350  · Mesos RUNNING 4000 · CPU 50% 90%

We Do Community
· 33 commits  · 2 top10  ·  patch  upstream

Go Beyond

Sisyphus ­ A Mesos batch job framework
· Fork from Chronos · No DAG dependency jobs · No ISO8601 jobs · Only support immediately jobs · More simpler data structure · Merge Job & Task into one · Twice performance as Chronos · Stable than ever

Sisyphus ­ future plan
· Useful metrics · Fancy WEB UI · Job preemption · and etc. · Planed to OPEN SOURCE

Q & A
 yuke@qiyi.com

The history(backup)

Docker

0.9

1.0

1.3.2

1.7.1

Chronos

latest

Sisyphus

Storm

0.9.2

0.9.3

Spark

0.8.0

R.I.P.

Hadoop(MR1)

2.0.0_MR1_CDH4.2.2

R.I.P.

Mesos

0.16.0

0.19.0

0.21.0

0.25.0

CentOS

6.4

7.1



2013.Q4

2014.Q2

2014.Q4

2015.Q2

2015.Q4

Now(backup)

