ROME
--
12711

aj
12711


·  ·  · 0952 · 1120 1240 · SADBASysDev
12711


·  ·  ·  · OaaS
12711


· PHP100+ · 3000+ 100+ Hits/ · 45000+ 30G
GZip
· 3000+ 200+ 
/
· 6000+ MySQL 2P+
12711

 
· 

· 

·  · 
12711

User

Distribution Service


 

12711

Developer

Database Cluster

" "
· 
· 

· 
 
· CFEngine
· 
12711

httpd-vhost.conf_tmpl
; &3.5# # &3.5# # &3.5# # 



FE Node
/etc/httpd-vhost.conf

vhost_config.pl
;
*%$#14,& 7+-8 # #  # # # # 9  



&,2*',*.&:-<"!2&3.5!2# #
<8 042)5)/23#$/.'*('*,& &3.5# #
*%$#14,&8*%$98# #9 .&63 9&,2*',*.&:-<"!2&3.5!2# #
<8 042)5)/23#$/.'*('*,& &3.5# #
*%$#14,&8*%$98# #9 .&63 9&,2*',*.&:-<"!2&3.5!2# #
<8 042)5)/23#$/.'*('*,& &3.5# #
*%$#14,&8*%$98# #9 .&63 9 





12711

 
·  ·  ·  · INI VS YAML · Memcached!
12711

mc.conf
[MBlog_Userinfo] ip=10.55.22.100:10000 10.55.22.101:10000 10.55.22.102:10000 10.55.22.103:10000 memsize=10.55.22.100:1G 10.55.22.101:1G 10.55.22.102:1G 10.55.22.103:1G conn_limit=10.55.22.100:1W 10.55.22.101:1W 10.55.22.102:1W 10.55.22.103:1W
[MBlog_Counter] ip=10.55.22.100:10001 10.55.22.101:10001 10.55.22.102:10001 10.55.22.103:10001 memsize=10.55.22.100:1G 10.55.22.101:1G 10.55.22.102:1G 10.55.22.103:1G conn_limit=10.55.22.100:1W 10.55.22.101:1W 10.55.22.102:1W 10.55.22.103:1W

MC Node
/etc/init.d/memcached /etc/cron.d/check_mc
12711

Monitor Node
/etc/monitor.d/check_mc.py

Reporting Node
/etc/reporting.d/get_mc_stats.py


12711


· 50+1+4+2

· 50X2+3 · 
Memcached
· 
12711

 ...
· Memcached

· DBA"
"
· 

· 

12711

 
·  ·  ·  · 
12711

DNS
Sync

Update

Status Update

Monitor

Updating API

Purge Req

Purge Service

Apache

Web Server
DNS DNSMasq
Query

Worker Server

Queue Subscriber

DNS DNSMasq
Query

DNS Cache Purge

Message Queue

12711

Legend Server Process Cluster Extension
Zookeeper Cluster

Updating Notification

Web Front-End

phpmeta-ext

Apache
php-mcext

metad zk local cache

Memcached Command

Node Register &
Heartbeat

Cache Node Watcher

MC

MC

MC

Cache Node Watcher

MC

MC

MC

12711

ZooKeeper

FE Cluster

Management API

Web/Command-line tools
12711

MySQL Cluster MySQL Cluster

MySQL Cluster

 
· PHP100+
· 3000+ 100+ Hits/
· 45000+ 30G
GZip
· 3000+ 200+ 
/
· 6000+ MySQL 2P+
12711

 
12711

 
·  · CFEngine VS Puppet · Ops VS Dev ·  · 
12711

Manual
12711

Automation
12711


12711

12711

12711


·  ·  ·  ·  · 
12711

Framework
12711

12711

12711

12711

APIs

get un-applied changes 1
readRole( criteria={ 'applied': false }, fields={ 'included': true }
)
2 retrieve the related info

3 create orchestration job
createOrchestration( targets=[ '10.71.1.2', '10.71.1.3' ], commands=[ 'update vhost.conf', 'restart httpd' ]
)

Asset Inventory

Configuration Management

readAsset( 'criteria'={ 'cmdb': 'D2012887' }, 'fields'={ 'addresses.internal': true }
)

Orchestration 4
ssh rome@10.71.1.2 "xxx"

5 generate config
readConfig( criteria={ 'cmdb': 'D2012887' } files=['vhost.conf']
)

Node

12711

Asset Inventory

2 get the related info

readAsset( 'criteria'={ 'cmdb': 'D20120601x' }, 'fields'={ 'addresses.internal': true }
)

1 some update
createRole( name='D20120601x', includes=['mysql', 'xd'], ports=[3310, 3324]
)
12711

3 create orchestration job

Configuration Management

createOrchestration( target='10.71.1.2', commands=[ 'update all', 'initialize' ]
)

Orchestration 4

ssh rome@10.71.1.2 "xxx"

5 generate config

readConfig( criteria={ 'cmdb': 'D20120601x' }
)

Node

it's
Revolution Of Martyred Elites
12711


· HTTP-based RESTful API with JSON
payload
· A variety of MongoDB-like CRUD · Node.JS · Connect · MongoDB
12711


· Ops->DevOps · Scrum · BDD · CI · Atlassian(Jira)
12711


Q&A
12711

