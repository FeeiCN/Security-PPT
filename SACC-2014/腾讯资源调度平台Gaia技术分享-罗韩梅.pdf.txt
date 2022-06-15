Gaia ----
(mavisluo)


8.32.1 X000
4.4 X0
6.5 XX0
X X
pvXX uvXX
2014


99.999%

· 
· / · 6000Job120w+ ·  CPU85%+



Gaia as Cluster Operation System
Gaia Gaia ---- ""
Gaia -- Yarn MRservice

Yarn


Gaiasfair scheduler
 .   . 
tdw4k
 . HA
AMapplication attempt
 . 

 . Yarnbug

Gaiasfair scheduler
Scalability  

Gaiasfair scheduler
     RMNM  

Gaiasfair scheduler
 · : 10ms1ms ·   · eventDispatcher · 3349ms329328 ms (add 1000 app)

Gaiasfair scheduler




 attempt schedule sort copyappsort  sort
 removed 
 329328 ms-> 3926ms

Gaiasfair scheduler


 n:app/queue k:

K(n=1000)
1000 100 10 2

SortAndWalk time 136 130 134 141

compare 123565 123665 123439 123631

HeapifyAndWalk

time

compare

46

43280

24

21224

20

18875

21

18828

Gaiasfair scheduler
 
 queue/app  queue/app
 
 node
 
 app5% GC50%
 
 

Gaiasfair scheduler
 
 6k8800 4k120wtask7500w1250
 
 70%
 
 ,80%cpu
 
 app/queueapp/queue, 80%

Gaiasfair scheduler
201000, 50 


Gaia----
1 oom kill
2 
3 container
4hardlimit containerkill
5

Gaia----
Elastic Memory Control 
1oom kill container task_cgrouphardlimit
2container container
3  containersoftlimit
4  

Gaia----CPU

sshd
+ NMagent
+DataNode

Root (1024)

DataNode (1024 * 3)

NM (1024)

task_cgroups

container 1 1024

container 2 1024

...

container n 1024

----
1cpu share + cpuset 
2
3NMDataNode container

Gaia----
1TC+cgroups 
2 container borrow 

Future work





 


 


RM/NM HA
AM Retain


 


api 

Hive on Gaia MR on Gaia Pig on Gaia Spark on Gaia Storm on Gaia Service on Gaia

Gaia


Q&A

