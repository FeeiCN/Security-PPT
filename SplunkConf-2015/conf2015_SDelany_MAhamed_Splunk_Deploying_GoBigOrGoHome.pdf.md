Copyright  ©  2015  Splunk  Inc.  
Go  Big  or  Go  Home  
Sean  Delaney  ­  Specialist  SE   Mustafa  Ahamed  ­  Director,  Product   Management  

Agenda  
!  3  Tier  Approach   !  Design  the  Forwarding  Tier   !  Design  the  Indexing  Tier   !  Design  the  Search  Tier   !  Best  PracMces  in  Scaling     
2  

3  Tier  Approach  

Pop  Quiz  
   Designing  a  scalable  environment  is:      q Easy            (If  planned  well  in  advance)      q Hard        (With  no  planning)    
4  

Sizing  ConsideraMons  
· Vital  Info  
­ Amount  of  incoming  data   ­ Amount  of  indexed  (stored)  data   ­ Number  of  concurrent  users   ­ Number  of  saved  searches   ­ Types  of  searches   ­ Specific  Splunk  apps  
· hZp://docs.splunk.com/DocumentaMon/Splunk/latest/InstallaMon/ Performancechecklist  

Splunk  Enterprise  6.3  
Enterprise--class  Scale,  Resilience  and  Interoperability  
Offload  search  load  to  Splunk  Search  Heads  
Auto  load--balanced  forwarding  to  Splunk  Indexers  
Send  data  from  thousands  of  servers  using  any  combinaMon  of  Splunk  forwarders      
6  

Forwarding   Architecture  

Forwarding  Tier  
Design  Factors   !  Syslog  Collectors  (HA)   ! DBConnect  Inputs  
­ McAfee  EPO  data    
!  TA  Inputs  
­ CheckPoint    
!    Assorted  Inputs  
­ Microsoa  AD  logs   ­ MicroSoa  Exchange  Server   ­ Microsoa  Sharepoint  logs   ­ Log4j,  Linux,  IIS  
8  

Syslog  Collectors  
· Best  pracMce  to  use  dedicated  syslog  servers   · Syslog--NG/rSyslog  recommended   · Syslog  can  write  events  to  dedicated  log  files  allowing  for  easy  
sourcetype  classificaMon  on  inputs  
  
9  

Syslog  Collectors  

High  Availability  

!  Using  a  Load  Balancer/VIP  with   Linux  Heartbeat  to  provide   failover  for  the  syslog  listener  
!  Syslog--NG  PE  Client--side   failover  

Syslog-NG Server Syslog-NG Server
Load Balancer
Syslog 514/tcp & 514/udp

10  

Router (Physical)

Load Balancer

Forwarder  for  TA's  

!  TA--McAfee  requires  DBConnect   to  pull  endpoint  events  
!  TA--Checkpoint  uses  the  LEA  Client   to  retrieve  Firewall  log  events  
!  Not  a  HA  design,  but  could  be   hosted  on  a  VM  to  standby  or   failover  

ePO Database

Heavy Forwarder, Linux
TA-McAfee (DBConnect) TA-Checkpoint

Checkpoint Server

Firewall
11  

Deployment  Server  
 Deployment  Server  to  manage  Linux  and   Windows  forwarders  
 Not  a  HA  design,  but  could  be  hosted  on  a  VM  to   standby  or  failover  
Deployment Server
Splunk Forwarders to get apps from splkds.internal.door2door.com:8089
12  

Forwarding  Tier  

Indexers
Splunk AutoLB to splkidx.internal.door2door.com:9997

Deployment Server
Splunk Forwarders to get apps from splkds.internal.door2door.com:8089

ePO Database

Syslog-NG Server Syslog-NG Server

Windows SharePoint Server

Windows AD Server

Forwarders, Windows

Load Balancer
Syslog 514/tcp & 514/udp

Forwarders, Linux

Heavy Forwarder, Linux
TA-McAfee (DBConnect) TA-Checkpoint

Checkpoint Server

Firewall

Router (Physical)

Load Balancer

13  

Forwarding  Tier  Design  Best  PracMces  
!  Use  a  Syslog  Server  for  Syslog  data   !  Be  careful  with  Intermediate  forwarders  
­ They  can  introduce  boZlenecks   ­ Reduce  the  distribuMon  of  events  across  Indexers  
! AutoLB  will  spread  over  all  available  indexers,  but  don't  assume   evenly!  
­ Enable  forceTimebasedAutoLB  
!  May  need  to  increase  UF  thruput  sejng  for  high  velocity  sources  
­ [thruput]   ­   maxKBps  
14  

Indexing   Architecture  

Indexing  Tier  
Design  Factors   !  1  Tb/day  (1000Gb/day)  peak  ingest   !  High  Availability  ­  Indexer  ReplicaMon  
(RF=3/SF=2)   !  10%  Disk  Space  ConMngency   !  90  days  minimum  data  retenMon   !  Cluster  Sizing  Calculator   !  hZp://splunk--sizing.appspot.com     
16  

Storage  CalculaMons  
!  RAID  ConfiguraMon    
­ Amount  of  raw  disk   ­ Fault  tolerance   ­ Available  IOPS  
! Filesystem  Overhead  
­ inodes  consume  space  
!  Wiggle  room  
­ AddiMonal  replicated  buckets  when  a  node  fails   ­ Unbalanced  replicated  buckets  
! Splunk  internal  logs,  Summary  Indexes,  Report  AcceleraMon,   Accelerated  Data  Models  
17  

Indexer  IOPS  
! 800+  
18  

Storage  Types  
!  Local  vs  Direct  AZached  vs  SAN  vs  NAS   !  SSD/Flash  vs  Spinning  Disk  
­ SSDs  offer  much  higher  IOPS  with  no  latency   ­ Significant  performance  increases  with  Sparse  Searches  
19  

Cluster  Master  Server  
!  Indexer  Apps  are  deployed  via  CM   !  Not  a  HA  design,  but  could  be  hosted  on  a  VM  to  standby  or  failover  
20  

Indexing  Tier  
Master Cluster Node
21  

Indexing  Tier  Design  Best  PracMces  
!  Depending  on  Searchload  150  ­  300  Gb  max/idx/day***   !  Max  #  of  Indexes  (indices)  when  clustering  is  enabled  
22  

How  Clustering  Affects  Sizing  
· Increased  storage:  
­ 15%  of  raw  usage  for  every  replica  copy   ­ 35%  MORE  to  make  that  searchable  
· Increased  processing  
­ Incoming  data  to  indexer  is  streamed  to  indexing  peers  to  saMsfy  required   number  of  copies  
· More  hosts  
­ Need  "replicaMon  factor"  +  2  (search  head,  cluster  master)  
23  

Benefits  of  Clustering  
· Data  redundancy   · Data  availability   · Indexer  resiliency   · Simpler  management  of  indexers   · Simpler  setup  of  distributed  search   · MulM--site  clustering  allows  site--specific  search  to  reduce  WAN  traffic  
24  

Search  Architecture  

Search  Tier  
Design  Factors   !  High  Availability   !  Search  Head  Clustering   !  #  users   !  #  concurrent  searches   !  Forward  all  data  to  indexers  
26  

SHC  &  Deployer  
!  Search  Head  Cluster  Apps  need  to  be  installed  by  the  Deployer   !  A  minimum  of  3  Search  Heads  are  required  for  a  SHC   !  No  exchange,  no  dbx  with  SHC  
27  

Search  Tier  
Load Balancer

Search Head Search Head Search Head 28  

Deployer License Server

Search  Tier  Design  Best  PracMces  
!  ES  will  sMll  require  a  separate  Search  Head  or  dedicated  SHC   !  Use  LDAP/AD/SSO  for  user  AuthenMcaMon   !  Load  Balancer  configured  for  sMcky  sessions  
29  

Final  Design  

Pujng  It  All  Together  
31  

MigraMon  

Hybrid  Approach  
!  Add  the  exisMng  Splunk   instance  as  a  search  peer   unMl  the  data  retenMon   period  has  expired  
!  Disable  scheduled  searches   on  the  old  instance  
!  Migrate  any  Summary   Index  data  to  new  Indexers  
33  

Review  

Top  5  Things  To  Consider  
!  Indexer  Storage  requirements  ­  Size  and  IOPS   !  Minimum  buy--in  for  a  SHC  is  3   !  Use  VMs  for  CM/LS/DS/Deployer  if  possible   !  Consider  a  dedicated  SH  for  a  Distributed  Management  Console   !  When  in  doubt  ­  add  another  Indexer  
35  

Required  Reading  
· Distributed  Deployment  Manual  
­ hZp://docs.splunk.com/DocumentaMon/Splunk/latest/Deploy/ Distributedoverview  
· Highlights  
­ Reference  hardware  specs   ­ How  searches  affect  performance  
ê Dense  /  Rare  /  Sparse   ­ App  consideraMons   ­ Summary  table  
36  

Best  PracMces  

