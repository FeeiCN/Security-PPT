Copyright  ©  2015  Splunk  Inc.  
Architec:ng  and  Sizing     your  Splunk  Deployment  
Simeon  Yep  
Global  Strategic  Alliances,  Splunk  

Disclaimer  
During  the  course  of  this  presenta:on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau:on  you  that  such  statements  reflect  our   current  expecta:ons  and  es:mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta:on  are  being  made  as  of  the  :me  and  date  of  its  live   presenta:on.  If  reviewed  aQer  its  live  presenta:on,  this  presenta:on  may  not  contain  current  or   accurate  informa:on.  We  do  not  assume  any  obliga:on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi:on,  any  informa:on  about  our  roadmap  outlines  our  general  product  direc:on  and  is  subject  to   change  at  any  :me  without  no:ce.  It  is  for  informa:onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga:on  either  to  develop  the  features  
or  func:onality  described  or  to  include  any  such  feature  or  func:onality  in  a  future  release.  
2  

Objec:ve  
Show  you  how  to  build  a  robust  and  scalable   Splunk  deployment  
3  

Introduc:on  

Qualifica:ons  
· 7+  years  @  Splunk   · Experience:      
­ Building  and  running  large  scale  Splunk  deployments   ­ Technical  sales  ­  OEMs,  Strategic  Accounts,  MSPs   ­ Current  ­  Anything  technical  for  Partnerships  
· Based  in  San  Francisco    
5  

Agenda  
· Sizing  fundamentals   · Architec:ng  fundamentals   · Deployment  topologies     
6  

Sizing  Fundamentals  

Sizing  Fundamentals  
· Understand  the  Sizing  Factors   · Data  Volume     · Search  Volume  

Sizing  Factors  
· How  much  data  (raw  sizes)?    
­ Daily  Volume     ­ Peak  Volume   ­ Retained  Volume  (archive  size)   ­ Future  Volume?  
· How  much  searching?  
­ Use  Cases   ­ How  many  people?  How  oQen?   ­ Apps  
· Background  searches  
­ Accelera:on,  Summariza:on,  Aler:ng,  Repor:ng,  Data  Models  

Data  Volumes  
· Es:mate  Input  Volume  
­ Verify  raw  log  sizes   ­ Leverage  _internal  metrics  and  default  views  (license_usage.xml)    
· Confirm  es:mates  with  actual  data  
­ Create  a  baseline  with  real  or  simulated  data   ­ Find  Compression  rates  (range  from  30%--120%,  typically  50%)   ­ Determine  Reten:on  needs   ­ Clustering  needs  (SF  vs  RF)  
· Document  Use  Cases  
­ Use  case  determines  search  needs   ­ Plan  for  expansion  as  adop:on  grows  (Search  and  Volume)  

Data  Sizing  Exercise  
· Via  Filesystem  
­ Use  a  large  enough  data  set.  100GB+  
· Use  the  Splunk  log  files    
­ metrics.log   ­ license_usage.log   ­ disk_objects.log  
· Recommended:  
­ Distributed  Management  Console  

Search  Volumes  
· Gather  Use  Case  informa:on  
­ How  much  Ad--Hoc  searching?   ­ How  much  background  searching?  
· Ad--Hoc  searching  
­ Evaluate  the  data  being  searched   ­ Evaluate  the  :me  dura:on  (real--:me  vs  historic)   ­ Real--:me  searches  are  typically  less  overhead  
· Background  Searching  
­ Aler:ng  and  Monitoring   ­ General  reports     ­ Data  Models,  Report  Accelera:on  &  Summary  Indexing  

Search  Volume  Exercise  
· Use  the  Splunk  log  files:  audit.log    
· Recommended:  
­ DMC   ê Search  Ac:vity  View  
­ Introspec:on  data   ê resource_usage.log  

Architecture   Fundamentals    

Architecture  Fundamentals  
· Splunk  server  roles:    Distributed/Clustered  Deployments   · Reference  Server   · Rules  of  Thumb   · Hardware  Factors  

Splunk  Distributed  Roles  

DMC  
Deployment  Monitoring     Console  

LM  
License  Master  

SHCD  
Search  Head  Cluster     Deployer  
CM  
Master  Node  

<  50  Forwarders  &  <  100  Indexers  

DS  
Deployment  Server  

Search  Heads   (Search  Head     Captain)  
Indexers  
Forwarders  

Splunk  Distributed  Roles  

DMC  
Deployment  Monitoring     Console  

LM  
License  Master  

SHCD  
Search  Head  Cluster     Deployer  
CM  
Master  Node  

>50  Forwarders  &  <  100  Indexers  

DS  
Deployment  Server  

Search  Heads   (Search  Head     Captain)  
Indexers  
Forwarders  

Splunk  Distributed  Roles  

DMC  
Deployment  Monitoring     Console  

LM  
License  Master  

SHCD  
Search  Head  Cluster     Deployer  
CM  
Master  Node  

>50  Forwarders  &  >  100  Indexers  

DS  
Deployment  Server  

Search  Heads   (Search  Head     Captain)  
Indexers  
Forwarders  

Splunk  Distributed  Roles  

DMC  
Deployment  Monitoring     Console  

LM  
License  Master  

SHCD  
Search  Head  Cluster     Deployer  
CM  
Master  Node  

>50  Forwarders  &  >  1000  Indexers  

DS  
Deployment  Server  

Search  Heads   (Search  Head     Captain)  
Indexers  
Forwarders  

What`s  a  lSearch  Head  Referencez  Server?  
· Sizing  based  on  commodity  x86  servers  ­  64bit   · 4  x  quad--core  CPUs  at  2.0  GHz     · 12  GB  of  RAM  ­  (16  GB  is  common)   · 64--bit  OS   · 2x10k  RPM  local  SAS  drives  in  RAID  1   · Varia:ons  cause  corresponding  changes  in  performance/
requirements  

What`s  a  lIndexer  Referencez  Server?  
· Sizing  based  on  commodity  x86  servers  ­  64bit   · 2  x  six--core  CPUs  at  2.0  GHz     · 12  GB  of  RAM  ­  (16  GB  is  common)   · 64--bit  OS   · Local  or  Aoached  storage    (800+  IOPs)   · Varia:ons  cause  corresponding  changes  in  performance/
requirements  

Real  World  Examples  
· Cisco  Unified  Compu:ng  System  (UCS)  
­ Search  Head:   ­     UCS  C220  M4   ­     24  cores   ­ Indexer:   ­     UCS  C240  M4   ­     24  cores  

Real  World  Examples  
· Amazon  Web  Services  EC2  
­ Search  Head:   ê   c4.4xlarge  +  EBS  storage   ê c4.8xlarge  +  EBS  storage  
­ Indexer:     ê c4.4xlarge  +  EBS  storage   ê d2.4xlarge  (IR)  

Rules  of  Thumb  
· These  all  have  excep:ons  and  qualifica:ons   · 1  reference  indexer  per  300  GB/day   · 1  reference  search  head  per  20--40  queries  concurrently     · 1  deployment  server  per  10k  clients  @  10--15  min  polling  period  

How  Many  Indexers?  
· Rule  of  thumb  says:  1  per  300  GB/day  
· Leaves  room  for:  
­ Daily  peaks  
· Need  more  indexers  for:  
­ Heavy  repor:ng   ­ More  users   ­ Slower  disks,  slower  CPUs,  fewer  CPUs  

How  Many  Search  Heads?  
· Rule  of  thumb  says:  1  per  20  ­  40  concurrent  queries   · Limit  is  concurrent  queries   · Search  Query  normally  uses  up  to  1  CPU  core  
­ 6.3  Paralleliza:on  can  leverage  more  
· Don't  add  search  heads;  add  indexers:  indexers  do  most  work  
­ Unless  you  want  HA/Search  Clustering  
· Scale  ver:cally  if  infrastructure  allows  it.  Add  CPU,  add  memory.    

How  Many  Deployment  Servers?  
· Rule  of  thumb  says:  1  per  10k  clients  @  10  ­  15  min  polling  period   · Adjust  polling  period  to  increase  total  clients  supported   · Small  deployments  can  share  the  same  instance  as  other  
management  instances  (LM,  CM,  etc.)   · Low  requirement  for  disk  performance  (good  candidate  for  
virtualiza:on)   · Or  use  something  other  than  deployment  server  
­ puppet,  SCCM,  cfengine,  chef...  

More  Is  Beoer?  
· CPUs  
ê 8,  12,  16,  24,  32,  etc....       ê Pipelines  --  New  6.3  feature  for  paralleliza:on!       ê Indexing  can  handle  higher  bursts  with  mul:ple  index  pipeline  sets   ê Certain  searches  can  be  improved  with  mul:ple  search  pipeline  sets  
­ Historical  batch  ­  return  the  data  without  worrying  about  :me  order  (  ...  |  stats  count)  
ê Indexers  s:ll  need  to  do  the  heavy  liQing  (search  exists  on  indexer  AND  search   head)  

More  Is  Beoer?  
· Memory  
­ Good  for  search  heads  and  indexers  (16+  GB)   ê Benefits  from  extra  RAM  used  by  OS  for  caching  
· Disks  
­ Faster  is  beoer  --  10k  ­  15k  rpm  strongly  recommended,  SSD  preferred     ­ More  disks  in  RAID  1+0  =  Faster   ­ RAID  5+1  or  6  can  be  good  for  Cold  buckets   ­ SSDs  can  also  provide  benefit  for  rare  term  searches  and  many  concurrent  
jobs  

Performance  and  Sizing  Tips  

System  Change   Search  Speed     Search  Concurrency   Indexing  Speed  

Faster D  isks  

++  

+++  

++  

Add a  n I  ndexer  

++  

+  

++  

Add a   S  earch H  ead  

+  

+  

Report A  ccelera:on/ Summaries  

++  

+++  

Performance  and  Sizing  Tips  

System  Change   Search  Speed     Search  Concurrency   Indexing  Speed  

Op:mize S  earches  

+++  

+  

+  

Op:mize F  ield   Extrac:on  

+  

Op:mize I  nput  

+  

Parsing  

Faster C  PU  

++  

+  

+  

Performance  and  Sizing  Tips  

System  Change   Search  Speed     Search  Concurrency    Indexing  Speed  

Index P  ipeline   Paralleliza:on    

++  

Search P  ipeline   Paralleliza:on    

++  

+  

Capacity  -->  Architecture  
· Sizing  Recipe  
­ Capacity   ­ Rules  of  Thumb  determines  Number  of  Servers  
· Building  Blocks  for  Architecture  

Architecture  Factors  
· What  are  my  sizing  requirements?   · Where  is  the  data?   · Where  are  the  users?   · What  is  the  security  policy?   · What  are  the  reten:on  and  compliance  policies?   · What  is  the  availability  requirement?   · What  about  the  cloud?  

Architecture  Factors  
· What  are  my  sizing  requirements?      
­ Data  capacity   ­ Search  capacity   ­ User  capacity  
· Obtained  from  the  sizing  process  

Architecture  Factors  
· Where  is  the  data?  
­ Local  or  Remote  to  the  indexing  machine   ­ If  remote  ­  use  forwarders  when  possible   ­ Index  in  local  data  center  (zone)  or  index  centrally   ­ Persist  Network  data  to  disk  as  a  best  prac:ce   ­ Use  Intermediate  Forwarders  to  distribute  data  
· Where  are  the  users?  
­ User  experience  affected  by  Search  Head  loca:on   ê Time  Zone  tuning   ê Distributed  search  over  LAN  vs  WAN  

Architecture  Factors  
· What  is  the  Security  Policy?  
­ Apply  User  security  policies   ê Auth  method   ê Roles   ê Filters  
­ Apply  physical  security  policies   ê Index  loca:on  

Architecture  Factors  
· Reten:on,  compliance,  governance  
­ Where  is  the  data  allowed  to  be?   ­ Where  is  the  data  not  allowed  to  go?   ­ Where  must  the  data  go?  
· Availability  
­ Local  failover,  fault--tolerance,  clustering   ­ Geographic  disaster  recovery/fault--tolerance   ­ Index  replica:on  and  Search  Head  Clustering  

Architecture  Factors  
· Cloud  Considera:ons  
­ Authen:ca:on  restric:ons   ­ Data  transfer  costs   ­ Security  ­  SSL  Tunnel   ­ Zones   ­ Hybrid  deployments  

Topologies  

Architecture  Factors  -->  Topology  
· Topology  Examples    
­ Centralized   ­ Decentralized   ­ Hybrid  

Centralized  Topology  
Search Head Clustering Indexers

Forwarders

Intermediate Forwarder

Syslog Devices
4

Forwarders

Decentralized  Topology  
Search Head Clustering
4

Hybrid  Topology  
4

Scaling  and  Expansion  
· Add  to  your  indexer  pool  for  more  performance  or  capacity  
­ Mixed  Plaworm  and  Hardware  is  not  recommended  
· Use  Search  Clustering  for  more  UI  capacity  and  availability  
­ Does  not  requires  NFS  
· Create  new  indexes  based  on  reten:on  and  RBAC  
­ Follows  best  prac:ces  
· As  data  reten:on  needs  increase  
­ Cannot  just  add  indexers,  because  we  cannot  rebalance  data.     ­ Dynamic  storage  can  help  (NAS  or  Cloud)  

Index  Replica:on  (aka  Index  Clustering)  
· What  is  it?  
­ Data  is  replicated  to  1  or  more  indexers  based  on  indexes     ­ Splunk  Cluster  Master  controlled  
· Basics  
­ Master  Node  (manages  indexing  and  searching  loca:on)   ­ Horizontal  Scaling    
· HA  vs  DR  
­ HA  --  Data  is  made  available  on  1  or  more  indexers  in  one  loca:on   ­ DR  ­  Mul:site  clustering.  All  data  exists  in  mul:ple  loca:ons  

Index  Clustering  
"  Replica:on  factor  
ü Determine  the  number  of  rebuildable  copies  of  data  to  maintain  
"  Search  factor  
ü Determine  the  number  of  searchable  copies  of  the  data  
"  Data  Reten:on  equa:on  based  on  syslog  data  
ü Total  disk  usage  across  cluster  in  GB  =  (RepFactor  *  0.096  +  SearchFactor  *   0.201)  *  DatasetSizeGB  

Index  Clustering  
· Increase  in  I/O,  CPU,  and  disk  requirement  
­ Means  daily  indexing  volume  per  server  will  be  lower    
· Search  factor  increase  disk  usage  by  ~30%  (rawdata  +  tsidx)   · Replica:on  factor  increases  disk  usage  by  ~10%  (only  rawdata)  

Search  Head  Clustering  
· What  is  it?  
­ Group  search  heads  into  a  cluster  as  a  single  en:ty   ­ Provides  HA  at  the  Search  Head  layer   ­ Splunk  Head  Captain  controlled     ­ RAFT  protocol  to  pick  captain  
· Basics  
­ A  captain  gets  elected  dynamically  (pre  6.3)  or  can  be  defined  manually  (6.3)   ­ Knowledge  objects  and  search  ar:facts  are  replicated   ­ Search  workload  distribu:on     ­ Replica:on  using  local  storage  NOT  over  NFS  

Final  Thoughts  
· Sizing  is  search  load  and  data  volume  
· Centralized  architecture  is  the  baseline  
· Varia:ons  on  architecture  are  driven  by  
­ Sizing   ­ Data  loca:on   ­ User  loca:on   ­ Reten:on/Access/Governance   ­ Availability  requirements  

Acknowledgements  
· Amrit  Bath   · Mustafa  Ahamed   · Deep  Bains   · Octavio  Di  Sciullo   · Sunny  Choi   · Dritan  Bi:ncka    

THANK  YOU  

