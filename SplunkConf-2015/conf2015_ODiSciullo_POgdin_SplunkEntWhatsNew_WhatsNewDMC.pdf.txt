Copyright  ©  2015  Splunk  Inc.  
What's  New  DMC?  
Octavio  Di  Sciullo  
Supportability  Engineering  Liaison  
Patrick  Ogdin  
Senior  Product  Manager      

Disclaimer  
During  the  course  of  this  presentaKon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauKon  you  that  such  statements  reflect  our   current  expectaKons  and  esKmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaKon  are  being  made  as  of  the  Kme  and  date  of  its  live   presentaKon.  If  reviewed  aTer  its  live  presentaKon,  this  presentaKon  may  not  contain  current  or   accurate  informaKon.  We  do  not  assume  any  obligaKon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiKon,  any  informaKon  about  our  roadmap  outlines  our  general  product  direcKon  and  is  subject  to   change  at  any  Kme  without  noKce.  It  is  for  informaKonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaKon  either  to  develop  the  features  
or  funcKonality  described  or  to  include  any  such  feature  or  funcKonality  in  a  future  release.  
2  

Personal  IntroducKon  
· Octavio  Di  Sciullo   · Patrick  Ogdin  
· Work  on  the  Splunk  Core  PlaWorm   · 7  Years  with  Splunk,  10  years  with  Sun     · Concerned  with  administraKon,  supportability,  forwarders,  plaWorms  
3  

Agenda  
 6.2  DMC  Recap  
­ ConKnuous  Investment   ­ DMC  Deployment  Architectures  
 So  What's  Up  With  My  Search  Head  Cluster    And  that  other  Clustering  thing,  the  Index  Cluster    Indexes  and  Volumes  Everywhere    Forwarders  (Really  Everywhere)    Oh,  and  One  Other  Thing...     
4  

Distributed   Management  
Console  6.2  Recap  

ConKnuous  Investment  in  Management/Monitoring  
 Started  with  IntrospecKon  in  6.1    Items  in  6.3  that  will  make  Admins  happy  
­ Event  hashing   ê <insert  theatre  schedule>  
­ Forwarder  director   ê <insert  theatre  schedule>  
 The  future  
­ Radically  simplified  setup/expansion   ­ Granular  controls  in  distributed  deployment   ­ Standard  flows  for  common  tasks  in  a  distributed  deployment   ­ Bejer  app  model  for  installaKon/management  
 What  about  S.o.S?  
6  

History  of  Splunk  Monitoring  Tools  
 index=_internal  sourcetype=splunkd  
­ Go  look  at  the  logs!  
Splunkbase  Tools    Status/System  acKvity  dashboards    Deployment  Monitor  
­ License  usage  reporKng!   ­ AlerKng,  summarizaKon  
S.o.S  
­ Developed  by  Splunk  Support  for  Splunk  support  and  customers   ­ PlaWorm  resource  uKlizaKon  collecKon  with  technology  add--ons   ­ Topology  views  
7  

Distributed  Management  Console  Architecture  

DMC   Host  
Distributed  Search  

Search  Heads/Search  Head  Cluster  
...  
Indexers/Index  Cluster  
...  

Management   Data  

Universal  Forwarder  
...  
8  

Setup  Tasks  
 Prerequisites  
­ Where  does  the  DMC  live?   ­ Topology  definiKon   ­ Forward  all  logs  from  all  components  back  to  the  indexing  Ker   ­ All  components  must  be  search  peers  of  the  DMC  host  
 Standalone  vs.  Distributed  Mode  
­ Server  roles   ­ Custom  groups   ­ Cluster  labels!  
9  

Search  Head   Clustering  Views  

Search  Head  Clustering  Views  
 MoKvaKon  
­ Plenty  of  data  in  logs/CLI   ­ Lots  of  customers  deploying  SHC   ­ What  is  going  on  in  my  search    
head  cluster?  
 Demo  
11  

SHC  ­  Status  and  ConfiguraKon  
12  

SHC  ­  ConfiguraKon  ReplicaKon  
13  

SHC  ­  ArKfact  ReplicaKon  
14  

SHC  ­  Scheduler  DelegaKon  
15  

SHC  ­  App  Deployment  
16  

Index  Clustering   Views  

Index  Clustering  Views  
 MoKvaKon  
­ One  layer  deeper  than  originally   exposed  
­ Dealing  with  ever  expanding   indexer  counts  
 Demo  
18  

Index  Clustering  Views  --  Status  
19  

Index  Clustering  Views  ­  Service  AcKvity  
20  

Indexes  and   Volumes  Views  

Indexes  and  Volumes  Views  
 MoKvaKon  
­ Customers  love  Fire  Brigade   ­ Figuring  out  if  you  are  meeKng  your  
retenKon  policies  is  tricky  
 Demo  
22  

Indexes  and  Volumes  --  Deployment  
23  

Indexes  and  Volumes  ­  Index  Detail:Deployment  
24  

Indexes  and  Volumes  ­  Volume  Detail:Deployment  
25  

Forwarder  Views  

Forwarder  Views  
 MoKvaKon  
­ No  forwarder  info  in  6.2!   ­ Deployment  monitor  no  longer  
improved/supported   ­ Some  customers  don't  use  
deployment  server  
 Forwarder  Monitoring  Setup  
­ Runs  a  search  against  indexers   ­ Configurable  period   ­ View  reads  from  asset  table  
 Demo  
27  

Forwarder  Views  ­  Deployment  Wide  
28  

Topology  Views  

Topology  Views  
 MoKvaKon  
­ Visual  representaKon  of   deployment  
­ RelaKonships  between  instances   ­ Deployment  at--a--glance   ­ TroubleshooKng  
 Demo  
30  

Topology  Views  ­  KPI  Overlays  
31  

Topology  Views  ­  Performance  Overlays/Detail  
32  

THANK  YOU  

