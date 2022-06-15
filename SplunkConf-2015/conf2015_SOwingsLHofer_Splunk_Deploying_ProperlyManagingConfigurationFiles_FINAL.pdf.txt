Copyright  ©  2015  Splunk  Inc.  
Properly  Managing  
ConfiguraFon  Files:    
From  Standalone  to  MulF--Cluster  
Laurie  Hofer,  Sr.  Professional  Services   Consultant   Sanford  Owings,  Principal  Consultant  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  aSer  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

Abstract  

Abstract  
With  a  varied  landscape  of  Splunk  Enterprise  configuraFon  possibiliFes  and   configuraFon  distribuFon  managers  now  available,  join  us  for  a  discussion  on  best   pracFces  for  managing  your  Splunk  configuraFon  files  in  today's  distributed   environments.        Learn  how  and  when  to  distribute  configuraFons  using  your  deployment  server,  your   indexer  cluster's  master  node,  or  your  search  head  cluster's  deployer  ­  and  how  to  get   the  right  configuraFons  to  the  right  places  in  the  most  efficient  and  confusion--free   methods  possible.  
  
4  

Agenda  
!  ConfiguraFon  Files  ­  What  and  where  are  they?   !  Modifying  ConfiguraFon  Files   !  ConfiguraFon  and  DistribuFon  Managers   !  Distributed  Splunk  and  Forwarder  Management   !  Search  Head  Cluster  Management   !  Indexer  Cluster  Management   !  Best  PracFces  and  Version  Control  
5  

ConfiguraFon  Files:  
What  are  they,  and  where   are  they?  

ConfiguraFon  Files  
!  Files  ending  in  .conf  located  in:  
­ $SPLUNK_HOME/etc/system/default/  or  *apps/*appname*/default/ $SPLUNK_HOME/etc/system/local/  or  *apps/*appname*/local/  
!  Parameters  set  within  the  files  configure  Splunk  soSware  to  operate  as  you   want  it  to.  
!  $SPLUNK_HOME/etc/system/default/*.conf  or  *apps/*appname*/default/*.conf  
­ Files  that  ship  with  the  soSware  or  app.     ­ These  files  should  not  be  modified.    
!  $SPLUNK_HOME/etc/system/local/*.conf  or  *apps/*appname*/local/*.conf  
­ Your  changes  to  the  default  configuraFons  for  Splunk  soSware  or  app.     ­ Apps  can  be  custom  or  downloaded  from  Splunkbase.   ­ This  behavior  changes  slightly  for  Search  Head  Clustering  
7  

Example  File:  props.conf  
#    /opt/splunk/etc/system/default/props.conf     #  Version  6.2.5   #  DO  NOT  EDIT  THIS  FILE!   #  Changes  to  default  files  will  be  lost  on  update  and  are  difficult  to   #  manage  and  support.   #   #  To  override  a  specific  setting,  copy  the  name  of  the  stanza  and   #  setting  to  the  file  where  you  wish  to  override  it.   #   [default]   CHARSET  =  UTF--8   LINE_BREAKER_LOOKBEHIND  =  100   TRUNCATE  =  10000   DATETIME_CONFIG  =  /etc/datetime.xml   ANNOTATE_PUNCT  =  True  
8  

Modifying   ConfiguraFons  

UpdaFng  ConfiguraFon  Files  
· Two  methods  to  edit  configs  
· Using  the  GUI   · Updates  are  placed  automaFcally  into  local  versions  of  the  files  based  on  login  
· Within  the  .conf  files  directly   · More  granular  funcFonality   · Spec  files  for  each  .conf  file  list  all  the  possible  values  for  each  parameter  
· When  should  I  not  use  the  GUI  to  make  changes?  
· In  any  clustered  environment  on  cluster  members  
10  

How  Splunk  PrioriFzes  ConfiguraFon  Files  
· Which  of  the  following  locaFons  has  the  highest  file   precedence?  
·$SPLUNK_HOME/etc/system/local/   ·$SPLUNK_HOME/etc/apps/   ·$SPLUNK_HOME/etc/deployment--apps/   ·$SPLUNK_HOME/etc/slave--apps/  
11  

12  

ConfiguraFon  File  Precedence  

!  $SPLUNK_HOME/etc/slave--apps/*/local/    
­ (indexer  cluster  peers  only)  
!  $SPLUNK_HOME/etc/system/local/   !  $SPLUNK_HOME/etc/apps/*/local/   !  $SPLUNK_HOME/etc/slave--apps/*/default/    
­ (indexer  cluster  peers  only)  
!  $SPLUNK_HOME/etc/apps/*/default/   !  $SPLUNK_HOME/etc/system/default/  

Highest  Priority   Lowest  Priority  

13  

MulFple  ConfiguraFons  ­  Which  One  Wins?  
  
                                  /opt/splunk/bin/splunk  btool  conf  list  ----debug  |  grep  conf.conf    |  grep  --v  confdb     
· ConfiguraFons  are  combined  based  on  precedence   ­ Use  btool  via  the  CLI  to  see  which  are  being  applied  
14  

Example  Splunk  Architecture  

Indexer Cluster

Search Head Cluster

Indexer Indexer Indexer

Cluster Master Node

SHC Deployer

Deployment Server / Lic.
Master

Search Head

Load Balancer

Search Head Search Head

ES Search Head

syslog-ng Collector / Forwarders

Heavy Forwarders

Forwarders, Windows

Forwarders, Linux

15  

Heavy Forwarder

Forwarders, Windows

Remote Site

ConfiguraFon  and   DistribuFon  
Managers  

ConfiguraFon  DistribuFon  Management  

Deployment  Server   Deployer  
Master  Node  

Forwarders   Search  Head  Cluster  
Indexer  Cluster  
17  

Distributed  Splunk   and  Forwarder  
Management  

Standard  Distributed  Environment  

· Deployment  server  manages  all  

or  most  configuraFons  

Heavy

· No  search  head  or  indexer  

Forwarders

Deployment

clustering  

Server

Search

Head

· ConfiguraFons  are  kept  

consistent  across  nodes  of  the   same  role/class  

Forwarders, Windows

Search Head

Forwarders, Linux

Indexer Indexer

19  

The  Deployment  Server  

· Deployment  Server  distributes  configuraFons  to   clients    

· Apps  that  contain  configuraFons  are  stored  in  

$SPLUNK_HOME/etc/deployment--apps/  

Heavy Forwarders

Deployment

· Clients  poll  Deployment  Server  on  interval  set  in  

Server

Search

deploymentclient.conf  (defaults  to  every  60  

Head

seconds)  

Forwarders,
· serverclass.conf,  located  at  $SPLUNK_HOME/etc/ Windows

system/local/  indicates  which  clients  are  

members  of  which  client  grouping,  and  indicates  

Search

Head

which  apps  those  clients  receives  

· Client  management  is  also  modifiable  from  the  

Forwarders, Linux

Indexer Indexer

GUI  under  Seongs  |  Forwarder  management  

20  

Example  File:  serverclass.conf  
#  ALL  CLIENTS  --  KEEP  DEPLOYMENT  CLIENT  UP  TO  DATE   [serverClass:all_clients]   whitelist.0  =  *   [serverClass:all_clients:app:org_all_deploymentclient]      #  FULL  INSTANCES  --  SEARCH  HEADS,  HEAVY  FORWARDERS,  INDEXERS   [serverClass:full_instances]   whitelist.0  =  search_head_one.mycompany.com   whitelist.1  =  indexer--[1--3].example.com   [serverClass:full_instances:app:org_all_indexes]      #  ALL  SEARCH  HEADS   [serverClass:all_search]   whitelist.0  =  search_head_one.mycompany.com   whitelist.1  =  search_head_two.mycompany.com   #  This  is  a  search  head.   [serverClass:all_search:app:org_all_search_base]  
21  

GUI  Client  Management  
I'll take System Low Cal for $1000 Alex.!
22  

Deployment  Management  
· Calculate  deployment  server  performance*  
· hpp://docs.splunk.com/DocumentaFon/Splunk/latest/UpdaFng/ Calculatedeploymentserverperformance    
· Linux:  Up  to  about  10,000  clients*   · Windows:  Up  to  about  7,000  clients*  
· MulFple  Deployment  Servers  
­ 6.3  allows  deployment  servers  sharing  the  same  content  behind  a  load  balancer,  due  to  a  fix  to  the  way  the   checksum  of  an  app  is  done   ê New  seongs  to  control  this  behavior  (details  available  in  upcoming  release  documentaFon)  
­ crossServerChecksum  in  serverclass.conf   ­ reloadDSOnAppInstall  in  deploymentclient.conf  
­ Not  available  in  6.2  and  below   ê Current  behavior:  DS  on  host--ds1.company.com  computes  checksum  12345  for  app  A,  but  host-- ds2.company.com  computes  checksum  12543  (modFme)  so  clients  would  perpetually  keep  downloading   depending  upon  who  they  ask  
  
*Using  reference  hardware  
23  

Best  PracFces  
· Use  naming  convenFons  and  be  consistent   · Names  should  be  descripFve  
­ yourcompany_all_remoteheavyforwarders  
· DifferenFate  between  TAs  from  Splunkbase  and  those  that  are  custom   · Use  descripFve/dated  comments  in  both  serverclass.conf  and  your  custom/
local  configuraFon  files   · Use  version  control:  Git  or  SVN   · Carefully  uFlize  any  configuraFons  outside  of  $SPLUNK_HOME/etc/apps/  on  
clients,  as  the  deployment  server  can  only  overwrite  files  in  this  locaFon  
24  

Search  Head  Cluster   Management  

Search  Head  Clustering  

· ALL  apps  from  /etc/shcluster/  get   pushed  to  /etc/apps/  

· App  Configs  and  User  Content    

"flapen"  to  default  instead  of  local  

Heavy Forwarders

Search Head

Deployment

· Cluster  replicaFon  is  managed  

Server

within  the  search  head  cluster  by  

the  elected  captain  

Forwarders, Windows

· Captain  replicates  search  arFfacts  

SHC Deployer

Search Head

and  run--Fme  changes  between  

members  to  keep  them  in  sync  

Forwarders,
· GUI  management  are  not  available   Linux

Indexer Indexer

Search Head

at  this  Fme  

26  

The  Deployer  

· Deployer  distributes  configuraFons  to   clients  

·

Apps  that  contain  configuraFons  are  

Heavy Forwarders

Search Head

stored  in  $SPLUNK_HOME/etc/

Deployment Server

shcluster/  on  the  deployer  

· Search  head  clustering  is  enabled  and   Forwarders, Windows managed  via  the  CLI  

SHC Deployer

Search Head

· No  GUI  management  at  this  Fme  

Forwarders, Linux

Indexer Indexer

Search Head

27  

splunk  show  shcluster--status  
Captain:                                           elected_captain  :  Thu  Sep  8  14:11:21  2015                                                                           id  :  C0C81FAC--0192--424A--A073--C2FFB2192FBF                                             initialized_flag  :  1                                                                           label  :  app011                                           maintenance_mode  :  0                                                                   mgmt_uri  :  https://app011:8089                                           min_peers_joined_flag  :  1                                           rolling_restart_flag  :  0                                           service_ready_flag  :  1   Members:                   app011                                                                   label  :  app011                                                                   mgmt_uri  :  https://192.168.1.100:8089                                                                   status  :  Up                   app012                                                                   label  :  app012                                                                   mgmt_uri  :  https://192.168.1.101:8089                                                                   status  :  Up                   app013                                                                   label  :  app013                                                                   mgmt_uri  :  https://192.168.1.102:8089                                                                   status  :  Up  
28  

Differences  of  Search  Head  Cluster  Management  
!  Search  head  cluster  management  differs  in  several  ways  
­ ConfiguraFons  (apps)  are  only  distributed  to  the  cluster  members  when   "splunk  apply  shcluster--bundle"  is  run  from  the  CLI,  or  when  a  cluster   member  joins  or  rejoins  the  cluster  and  it  polls  the  deployer  for  any  updates  
­ Apps'  configuraFons  are  "flapened"  into  the  /appname/default/  directory   on  the  deployer,  so  that  run--Fme  changes  which  are  applied  to  the  /local/   directories  of  the  apps  can  be  replicated  between  members  by  the  captain  
­ Search  arFfacts  and  changes  made  to  whitelisted  .conf  files  via  Splunk  Web,   Splunk  CLI  or  the  REST  API  are  replicated  between  members  by  the  captain   ê See  Splunk  docs  for  configura>on  files  on  the  replica>on  whitelist  defaults  
29  

Search  Head  Clustering  ReplicaFon  Overview  
!  Changes  that  ARE  propagated  by  the  captain  
­ Changes  to  configuraFon  files  made  at  runFme  via  Splunk  Web,  the  CLI  or  the   REST  API   ê Synced  and  replicated  approximately  every  five  seconds   ê Controlled  via  a  whitelist  in  server.conf  in  $SPLUNK_HOME/etc/system/local/  
*Changes  to  this  must  be  made  on  each  cluster  member  
!  Changes  that  are  NOT  propagated     ­ MANUAL  EDITS  to  configuraFon  files  on  the  cluster  members   ­ Index--Fme  seongs  such  as  data  inputs  or  indexes   ­ ConfiguraFon  changes  made  to  configuraFon  files  not  on  the  whitelist  
30  

Best  PracFces  
· Use  naming  convenFons  and  be  consistent   · UFlize  a  staging  search  head  node  to  test  changes  to  apps  before  moving  them  
to  the  deployer   · When  moving  from  a  distributed  architecture  to  a  clustered  architecture  
always  ensure  that  only  one  distribuFon  manager  is  managing  a  Splunk  node   · Use  descripFve/dated  comments  in  your  custom  configuraFon  files   · Use  version  control  
31  

Indexer  Cluster   Management  

Indexer  Clustering  

· ALL  apps  from  /etc/master--apps/   get  pushed  to  /etc/slave--apps/  
· Cluster  replicaFon  is  managed   within  the  indexer  cluster  by   master  cluster  node  
· The  master  node  replicates  copies   of  data,  not  configuraFons,  based   on  replicaFon  and  search  factor   seongs  
· MulF--site  clustering  and  GUI   management  available  

Heavy Forwarders
Forwarders, Windows
Forwarders, Linux

Deployment Server

Search Head

Search Head

Master Cluster Node

Indexer Indexer Indexer

33  

The  Master  Cluster  Node  

· Master  cluster  node  distributes   configuraFons  to  cluster  members  
· Apps  that  contain  configuraFons  are   stored  in  $SPLUNK_HOME/etc/ master--apps/  on  the  master  node  
· Cluster  bundles  can  be  applied  via   Splunk  Web  or  the  CLI  
· Bucket  replicaFon  status  and  search   factor  status  available  in  Splunk  Web   via  Seongs  |  Indexer  clustering  

Heavy Forwarders
Forwarders, Windows
Forwarders, Linux

Deployment Server

Search Head

Search Head

Master Cluster Node

Indexer Indexer Indexer

34  

Differences  of  Indexer  Cluster  Management  
!  Indexer  cluster  configuraFon  management  differs  in  several  ways  
­ ConfiguraFons  (apps)  are  only  distributed  to  the  cluster  members  when:   ê "splunk  apply  cluster--bundle"  is  run  from  the  CLI   ê the  Distribute  ConfiguraFon  Bundle  bupon  is  clicked  in  Splunk  Web     ê a  cluster  member  joins  or  rejoins  the  cluster  and  it  polls  the  master  node  for   any  updates  
­ ConfiguraFon  changes  are  not  replicated  between  members;  changes  are   managed  only  from  the  master  node  
­ Copies  of  the  data  and  searchable  copies  of  the  data  are  replicated  between   members  
35  

Best  PracFces  
· Use  naming  convenFons  and  be  consistent   · Be  aware  that  certain  configuraFon  changes  within  a  distribuFon  bundle  cause  
the  master  node  in  a  cluster  to  iniFate  a  rolling  restart  of  the  peers   · When  moving  from  a  distributed  architecture  to  a  clustered  architecture  
always  ensure  that  only  one  distribuFon  manager  is  managing  a  Splunk  node   · Use  descripFve/dated  comments  in  your  configuraFon  files   · Use  version  control  
36  

Clustering:  Distributed  Search  and  Bundles  
· Distributed  search:  all  props  (search  and  index--Fme)  are   distributed  to  indexers  and  search  heads  
­ Each  side  knows  which  to  use  based  upon  its  role  (what  it's   doing)  and  it  doesn't  care  if  the  others  are  there   ê Search  heads  don't  index,  so  they  don't  touch  those  props   ê Indexer  uses  index--Fme  props,  but  is  provided  search--Fme   rules  from  the  search  head  
37  

Best  PracFces  and   Version  Control  

Create  smaller,  more  discrete  apps  
!  Keep  the  number  of  configuraFon  files  per  app  low  
­ This  creates  smaller,  reusable  modules  and  lets  you  take  advantage  of   Splunk's  configuraFon  layering  
­ Easier  to  debug  
!  Use  a  naming  convenFon  for  the  apps  
­ Example:  DS_<org  group>_<class>_<config_file>     DS_dmz_forwarder_outputs  
!  Create  classes  of  apps  
­ Input  apps   ­ Index  apps   ­ Web  control  apps   !  The  more  places  configuraFon  files  need  to  be  managed,  the  more   likelihood  for  error  and/or  confusion  
39  

Atomic  Apps  Combine  To  Make  Larger  Config  Molecules    

40  

40  

Why  not  larger  apps?  
!  Very  hard  to  reuse   !  ConfiguraFons  quickly  become  clumsy   !  Makes  debugging  problems  more  difficult   !  Not  as  flexible  
41  

Combining  Instance  Roles  

· Splunk  full  instances  can  serve  more  than  one  funcFon  
­ Deployment  server  &  license  master   ê Depends  on  number  of  clients/load  on  the  deployment  server  

­ Deployment  server  and  master  cluster  node  

+

ê /etc/master--apps/  management  becomes  a  manual  process  

ê The  deployment  server  cannot  be  a  client  of  itself  

­ Search  head  cluster  deployer  and  master  cluster  node  
­ Deployer  and  master  cluster  node  are  explicitly  YES  in  current  versions  and  beyond  

42  

Source/Version  Control  
· Source  control  is  a  good  thing,  use  it!  
­ It  gives  you  a  place  to  revert  to  if  there  are  problems.  Many  customers  already  have   process  around  change  control,  and  this  can  reinforce  those  pracFces.    
­ GIT,  SVN,  etc.  
· PromoFng  from  Dev  or  QA  into  ProducFon  
­ For  customers  who  have  different  "lanes"  or  "stages",  they  can  have  a  dev  repository,   test  it,  deploy  by  whatever  mechanism,  validate  it  and  then  check  the  diff  in  for  the  next   lane  (i.e.,  promote  it  to  producFon).  
43  

Alternate  ConfiguraFon  Management  Tools  
· If  you  already  have  a  configuraFon  management  system   in  place  you  can  use  that  system  
­ Build  with  our  best  pracFces  in  mind   ­ Easier  to  understand  /  maintain  the  aggregate  state  
· Rather  than  having  to  figure  out  "which  pieces  went  into   server.conf",  you  can  look  at  the  app  manifest  and  see   from  their  clear(!)  naming  convenFon  what's  going  to  be   there  
· Also  helpful  for  managing  large  numbers  of  endpoint   forwarder  changes  
  
44  

What  Now?    
Related  breakout  sessions  and  acFviFes...  
!  Onboarding  Data  Into  Splunk  :  Tuesday  Sep.  22nd     ­ Andrew  Duca,  Principal  Consultant,  Splunk  
!  Search  Head  Clustering:  Tuesday  Sep.  22nd    
­ Manu  Jose,  Senior  Engineer,  Splunk   ­ Eric  Woo,  Senior  Engineer,  Splunk  
!  Simplified  Forwarder  Deployment  and  Deployment  Server  Techniques  :  Tuesday  Sep.  22nd    
­ Cary  PeIerborg,  Senior  Monitoring  Engineer,  LDS    
!  Indexer  Clustering  Best  PracLces,  Tips  and  Tricks  :  Wednesday  Sep.  23rd  
­ Da  Xu,  Senior  SoSware  Engineer,  Splunk  
!  Splunk  App  CerLficaLon  Criteria  :  Wednesday  Sep.  23rd  
­ Damien  Dallimore,  Developer  Evangelist,  Splunk  
!  Splunk  ConfiguraLon  Management  and  Deployment  with  Ansible  :  Wednesday  Sep.  23rd  
­ Sean  Delaney,  Client  Architect,  Splunk  
Jose  Hernandez,  Director  of  Big  Data  Security  SoluFons,  Zenedge  
!  Add--On  Best  PracLces  Check  Tool  :  Thursday  Sep.  24th  
­ Brian  Wooden,  Senior  Manager  of  Security  Add--Ons,  Splunk   ­ Jack  Coates,  Director,  Product  Management,  Splunk  
45  

THANK  YOU  

