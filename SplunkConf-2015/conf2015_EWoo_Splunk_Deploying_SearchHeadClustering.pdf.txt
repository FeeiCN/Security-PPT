Copyright  ©  2015  Splunk  Inc.  
Search  Head  Clustering  
Eric  Woo          ­    Senior  Engineer   Manu  Jose      ­    Senior  Engineer  

Disclaimer  
During  the  course  of  this  presentaEon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauEon  you  that  such  statements  reflect  our   current  expectaEons  and  esEmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaEon  are  being  made  as  of  the  Eme  and  date  of  its  live   presentaEon.  If  reviewed  aQer  its  live  presentaEon,  this  presentaEon  may  not  contain  current  or   accurate  informaEon.  We  do  not  assume  any  obligaEon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiEon,  any  informaEon  about  our  roadmap  outlines  our  general  product  direcEon  and  is  subject  to   change  at  any  Eme  without  noEce.  It  is  for  informaEonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaEon  either  to  develop  the  features  
or  funcEonality  described  or  to  include  any  such  feature  or  funcEonality  in  a  future  release.  
2  

Agenda  
· What  is  Search  Head  Clustering  ?   · Business  Benefits  of  Search  Head  Clustering   · Cluster  OperaEon   · Scalability  and  High  Availability   · ConfiguraEon  Management   · Q&A  
3  

Search  Head  Clustering    
Ability  to  group  search  heads  into  a  cluster  in  order  to  provide       Highly  Available  and  Scalable  search  services  
MISSION   CRITICAL   ENTERPRISE  
4  

Business  Benefits  of  SHC  

   Horizontal  Scaling    
  

   Consistent  User  Experience  
  

   Always--on  Search  Services    
  

   Easy  to  add  /  manage   premium  contents  (apps)  
5  

SHP      vs      SHC  
SHP   SHC  

NFS  
· Available  since  v4.2   · Sharing  configuraEons  through  NFS   · Single  point  of  failure   · Performance  issues  

· No  NFS   · ReplicaEon  using  local  storage   · Commodity  hardware  

6  

   Design  Goals  
1. No  Single  Point  of   Failures  
2. "One  ConfiguraEon"   across  SH  
   3. Horizontal  Scaling  

ImplementaEon  
1. Dynamic  Captain  
  
2. AutomaEc  Config     replicaEon  across  SH  
   3. Ability  to  add  /  remove  
nodes  on  running  cluster  
7  

SHC  ­  How  does  it  work?  

1  

2  

3   1. Group  search  heads  into  a  cluster  
2. A  captain  gets  elected  dynamically      3. User  created  reports/dashboards  automaEcally  replicated  
to  other  search  heads  
8  

Deploy  a  Cluster  

Search  Head  Cluster  Bring  up  

captain  
config--log   {s1,s2,  ...,  sn}  

      ...  

members  

· Bootstrap  captain   · Bring--up  members   · Captain  establishes  authority   · Members  join/register   · Common  splunk.secret  and  
clusterId   · CLI  based  cluster  scale/shrink  

10  

Distributed  Scheduling  

Use  Case  
· Scale  search  capacity   · Enable  more  reports,  dashboards,  alerts   · Load  balance  user  sessions  (onboarding)  
12  

Job  Scheduling  OrchestraEon  

· Captain  is  job  scheduler   · Eliminates  job--server  need   · Load--based  heurisEc  

SUCC  
search     1  
captain   LOAD  

search  --3    

search     2  

scheduler   FAIL  

13  

      ...  

load   balancer  

Details  
· Centralized  user  quota  Management   · captain_is_adhoc_searchhead  knob  to  reduce  captain  load   · Captain  updates  RA/DM  summaries  on  indexers.   · Scheduler  limits  honored  across  the  cluster   · Real  Eme  scheduled  searches  run  one  instance  across  cluster   · Auto--failover  ­  New  captain  becomes  scheduler  
14  

High  Availability  of   Search  Results  

$SPLUNK_HOME/var/run/ splunk/dispatch/ scheduler__admin__search_ _mysearch_at_1410708600_ 345  

Search  Results  primer  

sourcetype  =  access_combined    |  stats  count  by  clienEp  

reduce  

map  

stream  results  

Other  names:   1. search  results   2. search  arEfact   3. dispatch  directory   4. SID  

Search  --  HEAD  

indexers  
Dispatch  dir  needs  to  be  replicated  to  mulCple   nodes  to  tolerate  node  failures  

16  

ArEfact  ReplicaEon  

· Captain  orchestrates  replicaEon   · Default  replicaEon_factor=3   · Success  failure  ACK'd  to  captain   · Asynch  Replicate  on  Proxy     · ReplicaEon  policy  enforced  by  fixups  

succ  
replicate  
captain  
succ  

succ  
17  

      ...  

orig   replica--1     replica--2    

Centralized  Cluster  State  
· Captain  maintains  a  global  view  of  alerts  and  suppressions   and  updates  the  list  to  all  members  
· Captain  registers  all  the  adhoc  searches  run  in  the  cluster   · Captain  orchestrates  reaping  of  search  arEfact  replicas     · GET  /services/search/jobs  requests  on  any  member  will  
proxy  to  captain  to  get  complete  jobs  
18  

High  Availability  of     Cluster  

HA  &  Auto--Failover  

Design  Goals   1. No  Single  Point  of  Failure   2. ConEnuous  UpEme   3. Consistent  User  Experience  

ImplementaEon   1. Dynamic  Captain  elecEon   2. Auto  Failover   3. Proxying  for  consistent  view  

20  

Dynamic  Captain  

· RaQ  Consensus  Protocol  from  Stanford  
­ Diego  Ongaro  &  John  Osterhout   ­ Acknowledge  Diego  Ongaro  for  help!  
· SHC  uses  RAFT  for  LE  and  Auto  Failover  
RV  =  Request  Vote       LE  =  Leader  ElecEon   SHC  =  Search  Head  Clustering  
  

S2  
S1   captain  

S3  
S4   new     captain  
S5  

21  

new  captain  

Auto--Failover  

Fixups  

scheduler   old  captain  

arEfacts   running  jobs   alerts,  etc   search  load  

22  

      ...  

members  

Disaster  Recovery  ­  StaEc  Captaincy  
· Advised  Use  Cases    
­ Single  site  cluster  looses  majority     ­ MulE  Site  cluster  where  majority  site  fails   ­ NOT  advised  for  network  parEEon  due  to  inability  to  reconcile  configuraEon  
changes  
· LimitaEons  
­ Manual  IntervenEon  required     ­ Single  Point  of  Failure   ­ Works  with  or  without  enough  members  to  meet  replicaEon  factor  
     
23  

ConfiguraEon   Management  

ConfiguraEon  Files  
"  Custom  user  content  
­ reports   ­ Dashboards  
"  Search--Eme  knowledge  
­ field  extracEons   ­ event  types   ­ Macros  
"  System  configuraEons  
­ inputs,  forwarding,  authenEcaEon  

Goal  
"  Consistent  user  experience  across  all  search  heads   "  Changes  made  on  one  member  are  reflected  on  all  members  
26  

ConfiguraEon  Changes  
"  Users  customize  search  and  UI  configuraEons  via  UI/CLI/REST  
­ Save  report   ­ Add  panel  to  dashboards   ­ Create  field  extracEon  
"  Administrators  modify  system  configuraEons  
­ Configure  forwarding   ­ Deploy  centralized  authenEcaEon  (e.G.  Ldap)   ­ Install  enErely  new  app  or  hand--edited  configuraEon  
27  

Search  and  UI  ConfiguraEons  
"  Changes  to  search  and  UI  configuraEons  are  replicated  across  the   search  head  cluster  automaEcally  
"  Goal:  eventual  consistency  
28  

ConfiguraEon  ReplicaEon  
C  
my_dashboard.xml   29  

System  ConfiguraEons  
"  Recall:  only  changes  to  search  and  UI  configuraEons  are  replicated   across  the  search  head  cluster  automaEcally  
"  Changes  to  system  configuraEons  are  not  replicated  automaEcally   because  of  their  high  potenEal  impact  
"  How  are  system  configuraEons  kept  consistent,  then?  
30  

ConfiguraEon  Deployment  
" Deployer:  a  single,  well--controlled  instance  outside  of  the  cluster   "  ConfiguraEons  should  be  tested  on  dev/QA  instances  prior  to  deploy  
D  
31  

UI  
32  

MigraEon:  User  ConfiguraEons  
"  Task:  switch  from  non--clustered  search  head  to  search  head  cluster   " Deployer:  migrate  user  configuraEons  to  captain   "  In  6.3,  captain  applies  and  replicates  changes  just  like  naEve  changes  
made  via  UI/CLI/REST   "  Migrated  user  configuraEons  thus  behave  just  like  configuraEons  
created  naEvely  on  the  search  head  cluster  
33  

THANK  YOU  

Stable  Captaincy  
· Captain  Switching  should  be  extremely  rare   · Repair  a  problem  by  transfer  captain  without  restarts!!!  
­ Preference  on  a  node  to  be  or  not  to  be  captain     ­ Node  configured  not  to  run  adhoc  searches  as  Captain  hidden  from  load  
balancer  
· Rolling--restart  from  the  captain  maintains  the  node  as  captain  aQer   restarts  
­ Status  available  via  CLI/audit  logs  
     
35  

Adhoc  search  management  
· Adhoc  search  --  interacEve  search  run  from  a  user  session   · Adhoc  searches  not  replicated     · Captain,  however  will  have  global  knowledge  of  all  searches.   · GET  services/search/jobs  will  return  the  global  list  of  searches.   · You  can  proxy  and  access  adhoc  searches  from  any  node.  
36  

Reaping  of  Search  ArEfacts  
· Reaping  ­  DeleEon  of  Search  results  when  TTL  (Eme  to  live)  expires.   · Search  ArEfacts  reaped  from  the  origin  node.   · Captain  orchestrates  reaps  of  the  replicas  
37  

Concurrent  Changes  
C  
38  

Custom  App  Content  
"  App  devs  may  "opt--in"  their  custom  configuraEons  for  replicaEon   under  search  head  clustering  
"  Example  server.Conf  from  an  app  would  look  like:  
  [shclustering]     conf_replicaEon_include.my_custom_file  =  true  
39  

UI  (comparison)  
40  

