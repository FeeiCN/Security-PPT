PaaSKey-Value 
Sina App Engine  @simpcl


· ·SAE ·SAE ·SAEKVDB ·Key-Value


·PaaS
PaaSPlatform-as-a-Service 
·Web
PaaS = Web + 
·PaaS


SAE
SAE
·Sina App EnginePaaS ·SAEWebPHP  ·JavaPython ·SAE 
SAEWeb

SAE
SAEPaaS

SAE
SAE





 Q ...

  CDNIaaS ...

 SinaCloud.com

2009.11

2010.2

2010.9

2010.10.10 2011.5.18

2011.7

Sina App EngineSina App Engine Sina App Engine alpha alpha2 Beta

Sina App Engine  Beta2

SAE

TmpFS  

 

SAE
SAEWeb 

SAE
1. 
a.HTTP b.Web HTTP c.
2. 
O(1)Web 
 

SAE
3. Web
a. WebSLA 
b. WebWeb 
c. WebWeb SAE
d. WebAPI

SAE
SAE PHP SandBox

HTTP Server Sandbox    libcDLL ... ...
SAE Zend Sandbox  CPU I/O I/O API ... ...

SAE

4. 


Cron

Image

Mail

FetchURL TaskQueue DeferredJob

RDC



Storage KVDB Counter Rank

MemcacheX TmpFS

SAE
5.     SAE  SAE  

SAEKVDB
SAEKV
A.Key-Value B. C. D. E. F. G. H.API

SAEKVDB

Mete Server

Client

Internal DB

master slave slave

master slave slave

DB Cluster

master slave slave

 
SAE KVDB 

SAEKVDB
SAE KV 
1.Web Runtimeappkey 2.Meta Serverappkey appname-key 3.

SAEKVDB
API

SAEKVDB
Meta Server
1.Meta Server 2. 3. 4.
DB Server
AppKey

SAEKVDB
DB Cluster 

master slave ... ... slave master slave ... ... slave master slave ... ... slave

group 0 group 1 group 2

master slave ... ... slave

group n

SAEKVDB
DB Cluster 
1. 2.Master  3.  4. 5.Meta Server

SAEKVDB
DB
1. 2. 3.AppKey

SAEKVDB
Meta Server Cluster

Meta Server Meta Server Meta Server

Internal DB

Meta Server Internal DB   DB 

SAEKVDB
Meta Server
I. meta server
paxos
II. 
   
III.


Key-Value
· · ·Key-Value

 SAE 
@simpcl simpcl2008@gmail.com

