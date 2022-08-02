
-- zhuchao@gmail.com

Agenda
     /
­ : ops infrastructure & Dev Env ­  &  ­ : provision, release, mon; ­ :cmdb, log analysis, ­ : technical/(server/app), end user point, business ­ : network/server/app ­ Review()
 About DevOps ,   



 200-5000 

 5-50

 

­ (IDC/Network/Server)

­ (Web/CDN Operations) 

­ 

/



­ /

 

­ 

 

­ 

­ 







WebCDN DB, Game

 

 



 IDCServer

 

Network


  







­ 

­ Junior

­ 





­ CDN

­ 

­ 





­ 

­ 

­ 

­ 





­ 

­ 

­ 

­ 30%owner



VOD VMS)

­ 

­ 

­ 

­ 





How
­ 
· Kickstart/Puppet/LDAP/Zabbix/DNS
­  · 
­  · 
­  · /Release
­  · CMDB
­  · 
­ /


 Embracing the open-source  Don't re-invent the wheel  Don't be on your own  Adapt the mainstream  Don't be too aggressive  Simple is beauty



-Dev
 
­  ­  ­ arch review ­  ­  ­ 
   

--Ops
 
­ OS KickstartCobbler, ­ template(VM) ­ OSpackage  ­ Puppet CDN ­  ­ LB
 

  
­  ­  ­  ­ Java, PHP, MySQL, Redis 
 guideline/Principle
­ IDC consideration , App VM min 2; IP  ­ LB LB ­ DB read ­ Cache Consideration ­ Logging Consideration
 




 
­ / ­ ,Solution ­  ­ 


 Kickstart/Cobbler/Git  LDAP  DNS  Zabbix  Puppet  CMDB

Puppet
 
­ , , 
 
­ OS ­ App ­ LDAPSSH ­ / ­ 
   CDN

Zabbix
 Why Zabbix
­  ­ Agent ­ Flexible
 Template
­ Linux base template
· Cpu/mem/net/disk/space/
­ Def App template
· Squid/Php/Resin/Nginx/memcache/redis/..
­ Self-defined

CMDB
 
­ ip ­  ­ IDC ­  ­ 
 
­  
­ (URLMON ­  ­ 


 
­ App
­ Hadoop:Rsync
­ /: rsyslog ­ Hive  ­ fluentd+mongo+zabbix


 Zabbix+URLMon  Release   :CAS-SSO  DFS  Web:   LB Pair  Cache Tier: shared cache service(MC,Redis)  Database as a service (MySQL)

App//Web 


Why ·10+ Hadoop  ·5+ Hadoop ·
How · ·lesson · · ·




 Hadoop!  Hive

(WIP)

 :

Rsyslog + PHP

­ Bash 

­ /var/log/message

­ 

­ Sudo 

­ 

 Webfluentd+Mongo

­ Fluentd + mongo

­ LB post




 KPIThreshold  Anything that fails will bother you  
­  ­ CDN ­ App metrics
 /
­ URL ­  ­ LB Traffic/code/Exceptions
   


 
­  ­ severity ­  ­ Snooze ­ Tracking ­ Report ­ Analysis
 


 Linux/Nginx/PHP  Java OOM  LB 4xx/5xx  CDN   


 
­ down  ­ App down  ­ 
 
­ 




     
­  ­ : ­ : 45


 (CDN/)
 Puppet :90%
 Web90%  CDN100%(Puppet+ControlTier)  (p2p, ,Client)  
­  ­ /
  ­

CDN
 ControlTier + Git + Cobbler


 PHP + ControlTier
­  ­ cmdb ­ Zabbix/URLmon ­ CAS ­ LB ­ 


 Zabbix Rule Engine
­  ­ :php/Resin ­  ­ Java thread dump ­...


----


   
­ 
 
­  ­ CDN ­ Top-down 
 
­ 
 CMDB
­ 


 Top alerts by domain, category, tehnology  Top reasons  Review weekly, action  Avg act-fix time;  Problem Management
­ By team ­ By Tech ­ By function

WebCDN
 CDN QPSHit ratio?  High/low? 
     CDN  CDN   CDN top by domain/referrer),  CDN top pictureAvg size?  CDNCDN  Top URLErrorCodeService

VOD CDN 
 Chain
­  ­  ­  ­ 
 QoS
­  ­  ­  ­  ­ Appvv ­ 


 When will my application fail?S
­ / ­ Metrics ­ Reporting/Alerting
 Canary program  Right sizing




 
­ Dev  IDC Strategy ­ Ops App 
 OpsPattern
­  ­  ­  ­ Scalable service


 
­ More tiers, more tears
 /
­ 
 
­  ­ 


   Incident Report  Report


 
­ ,  ­ 
 
­  ­  ­  ­ 
 
­  ­ 

About DevOps
 IDC  IDC       Should Dev has production access?  Platform for Dev/Ops  Dev should understand the environment their code runs on  Ops should understand the Dev code/logic

2012

Monitoring Windows
 / /
BI /CMDB

Automation 
Release 
 DNS VM  

Application  Layered Service Redis/Mongo/Hadoop  

