Copyright  ©  2015  Splunk  Inc.  
Keeping  Splunk  in  Check:   Tools  to  BeGer  Manage   Your  Investment  
Aaron  Kornhauser  
Sr.  Professional  Services  Consultant,  Splunk,  Inc.  
Vladimir  Skoryk  
Sr.  Professional  Services  Consultant,  Splunk,  Inc.  
     

Disclaimer  
During  the  course  of  this  presentaKon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauKon  you  that  such  statements  reflect  our   current  expectaKons  and  esKmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaKon  are  being  made  as  of  the  Kme  and  date  of  its  live   presentaKon.  If  reviewed  aVer  its  live  presentaKon,  this  presentaKon  may  not  contain  current  or   accurate  informaKon.  We  do  not  assume  any  obligaKon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiKon,  any  informaKon  about  our  roadmap  outlines  our  general  product  direcKon  and  is  subject  to   change  at  any  Kme  without  noKce.  It  is  for  informaKonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaKon  either  to  develop  the  features  
or  funcKonality  described  or  to  include  any  such  feature  or  funcKonality  in  a  future  release.  
2  

Agenda  
!  IntroducKon   !  Reference  Hardware   !  Available  Tools   !  Common  QuesKons   !  Scenarios/TroubleshooKng   !  Resources   !  Q&A     
3  

Who  Are  We?  

Hello,  I'm:  

  

  

  

Aaron  Kornhauser                                                                     V  ladimir  Skoryk  

Sr.  PS  Consultant  

Sr.  PS  Consultant  

akorn@splunk.com  

vs@splunk.com  

  

  

  

  

    

4  

Reference  Hardware  

Role  

Core  Splunk*  

Enterprise  Security  (ES)    

Indexer   Search  Head  

12  CPU  cores   12GB  of  RAM   800  IOPS/indexer  RAID  1+0   data  ingest:  150--200GB/day  
16  CPU  cores   12GB  of  RAM   2x  300GB  10k  rpm  SAS  in  RAID1  

12  CPU  cores   12GB  of  RAM   800  IOPS/indexer  RAID  1+0   data  ingest:  100GB/day  
16  CPU  cores   16GB  of  RAM   2x  300GB  10k  rpm  SAS  in  RAID1  

All  instances  x64,  CPU  >  2Ghz  per  core   *  hGp://docs.splunk.com/DocumentaKon/Splunk/latest/Capacity/Referencehardware    
  hGp://docs.splunk.com/DocumentaKon/ES/latest/Install/DeploymentPlanning       
5  

Available  Tools  
So  what's  out  there  and  what's  the  difference?  
Distributed  Management  Console  (DMC)  ­  Built  in  and  only  available  on  v6.2+  
· hGp://docs.splunk.com/DocumentaKon/Splunk/latest/Admin/ConfiguretheMonitoringConsole   · Splunk  supported  and  focuses  on  all  facets  of  the  deployment   · New  feature  preso  with  Patrick/Octavio  ­  make  sure  you  go  see  it!  
FireBrigade  
· hGps://splunkbase.splunk.com/app/1632/   · Detailed  look  at  index/bucket  acKvity  and  capacity  
SoS  (Splunk  on  Splunk)  
· hGps://splunkbase.splunk.com/app/748/   · Legacy  Splunk  troubleshooKng  tool     
Our  health  app  ­  Splunk  Health  Overview  
· hGps://splunkbase.splunk.com/app/1919/     · CombinaKon  of  views  found  to  be  helpful  in  the  field  
Note:  
Deployment  monitor  app  is  deprecated  ­  try  to  stay  away  from  it  
Many  of  these  app  funcKonaliKes  are  being  rolled  in  the  DMC  
6  

How  Are  Things,  Overall?    
High  level  environment  status  ­  quick  view  of  what's  up/down/not  reporKng:  
· Forwarder  health  --  finding  forwarders  that  we  haven't  seen  for  awhile   · Data  source  health  --  how  are  our  data  feeds  doing?   · REST  endpoints  (|  rest  /services/server/info)  --  looking  at  system  informaKon,  possibly  under  provisioned  ones  
Spovng  warnings  and  errors  within  Splunk  _internal:  
· index=_internal  sourcetype=splunkd    (log_level=ERROR  OR  log_level=WARN)  |  cluster  showcount=t  |  table  cluster_count  host   log_level  message  |  sort  ­  cluster_count  |  rename  cluster_count  AS  count,  log_level  AS  level  
· index=_internal  sourceype=splunkd  log_level!=INFO  |  Kmechart  count  by  component  
Track  resource  usage:  
· Say  hello  to  _introspecKon  (Splunk  6.1+)   · Captures  disk  and  other  resource  metrics  (by  default  on  full  installs)  
· hGp://docs.splunk.com/DocumentaKon/Splunk/latest/TroubleshooKng/AbouGheplayorminstrumentaKonframework  
Dashboards  to  help  save  the  day:  
· Health  Status  --  Splunk  Health  Overview   · Instance  --  Distributed  Management  Console   · Indexing  Performance  --  Distributed  Management  Console   · Resource  Usage  --  Splunk  Health  Overview   · License  Usage  --  Splunk  Health  Overview  
7  

Coming  up  
!  Scenario  based  discussions  around  health  topics  
· Environment  overview   · Data  health   · ConfiguraKon   · Usage   · Search  insights  
8  

Scenario  1:  Environment  Overview  
How  to  use  the  tools  available  to  check  overall  health...  

What  are  we  reporKng  on?  

· _internal  

· _introspecKon  

· metadata  and  using  tstats   hGp://docs.splunk.com/DocumentaKon/Splunk/latest/SearchReference/ Tstats    

· REST  endpoints    
· |  rest  /services/server/info     · |  rest  /services/server/roles   · |  rest  /services/server/status/resource--usage  

· No  need  for  addiKonal  addons  

  

9  

Scenario  1:  Environment  Overview  
Splunk  Health  Overview  ­  Health  Status  
Doesn't  meet  reference  hardware  
10  

Scenario  1:  Environment  Overview  
Splunk  Health  Overview  ­  Heath  Status  
Looks  like  source  stopped  sending  data!   Quite  a  few  errors  and  warnings!  
11  

Scenario  1:  Environment  Overview  
DMC  --  Instances  
Issues  accessing  instance  
12  

Scenario  1:  Environment  Overview  
DMC  ­  Indexing  Performance  
Slight  ingesKon  imbalance  
13  

Scenario  1:  Environment  Overview  
Splunk  Health  Overview  ­  Resource  Usage  
14  

Scenario  2:  Data  Imbalance  
Splunk  Health  Overview  ­  License  Usage  
The  admin  is  doing  their  daily  rouKne  checks  and  inspects  the   license  usage.  Things  seem  normaWl  leiecke  onvseer  w  liemekit  li c wenissee  u  asangde    hthelepsy     have  historically  seen  a  drop  aVerd  uetpedcta  aKnonmga  sliyess  laongd  g  firoltwetrhs     but  not   all  indexers  are  gevng  an  even  stream  of  data.  
  
15  

Scenario  2:  Data  Imbalance  ConKnued    
Splunk  Health  Overview  ­  License  Usage  
Ideally,  each  indexer  should  hold  equal  amount  of  data  
Not  all  indexers  are  receiving  data  
16  

Scenario  2:  Data  Imbalance  --  Troubleshoot/Wrapup    
TroubleshooKng:   · Validate  firewall  rules  are  in  place   · Check  that  all  forwarders  have  the  correct  outputs   · Ensure  indexers  all  all  listening  on  proper  port   · Does  splunkd.log  have  anything  to  say?   · Use  the  Indexing  Overview  and  ConfiguraKon  Overview  (btool  saves  the  day)  
Possible  Causes:   · Simple  misconfiguraKon   · Data  processing  queues  filling  up  and  forwarders  Kming  out  and  jumping  to  next  indexer   ­ Check  Distributed  Indexing  Performance  in  the  DMC  for  queue  filling  --  typical  sign  of  disk   performance  issues   · Indexer  affinity  --  the  forwarders  get  stuck  to  one  indexer  because  EOF  never  met   ­ forceTimebasedAutoLB  can  help!  hGp://blogs.splunk.com/2014/03/18/Kme--based--load--balancing/     ­ UpdaKng  syslog  files  --  each  file  <1GB,  host  in  the  path,  broken  out  by  sourcetype,  cron  job/ logrotate  to  remove  stale  files.  
17  

Scenario  3:  Data  Health  Checkup  
How's  your  data  feeling?  
Feed  sKll  working  
· Seeing  recent  data   · Gaps  in  data  
Ingest  issues  
· Line  breaking,  Kme  parsing,  truncaKon  
Indexing  latency  
· _Kme  --  _indexKme  
PredicKve  analyKcs...events  in  the  future!  
· incorrect  Kme  zone   · Kmestamp  parsing  issues   · Kme  driV  (NTP  not  set)  
        Make  sure  to  see  the  "Onboarding  Data  Into  Splunk"  presentaKon!  
18  

Scenario  3:  Data  Quality  

GreeKngs  from  the  future!  

Your  data  is  hours  ahead  of  system  Kme!  

  

  

  

index=*  earliest=+5m  latest=+20y    

|  eval  ahead=abs(now()  --  _Kme)    

|  stats  avg(ahead)  by  host,  sourcetype,  index    

|  eval  avg(ahead)=tostring('avg(ahead)',  "duraKon")  

19  

Scenario  3:  Data  Quality  
Linebreaking  and  Timestamping  
index=_internal  sourcetype=splunkd     component=LineBreakingProcessor  OR  component=DateParserVerbose  OR   component=Aggregator*     |  Kmechart  count  by  component  
20  

Scenario  3:  Data  Quality  
Indexing  Delay  
We  have  latency!  
|  tstats  earliest(_Kme)  AS  t  earliest(_indexKme)  AS  i  WHERE  index=*  AND  (earliest=--1d)  BY  host,  sourcetype,   index,  _Kme  span=1h     |  eval  delay=abs(t  --  i)     |  where  delay>5     |  stats  avg(delay)  BY  host,  sourcetype,  index  
21  

Scenario  4:  Consistency  Is  Key  
· File  order  precedence  
· hGp://docs.splunk.com/DocumentaKon/Splunk/latest/ AdminWheretofindtheconfiguraKonfiles    
· Don't  put  configs  in  /etc/system/local  
· Are  like  instances  of  Splunk  uniformly  configured?  
· Indexer  A  knows  about  more  than  Indexer  B   · Forwarder  A  knows  about  Indexer  A  &  B  
· Use  configuraKon  management  tools  
· Deployment  server,  Chef,  Puppet,  SCCM,  etc.  
· Meaningful  Splunk  app  naming  convenKons  
· org_group_applicaKon_configuraKon  (acme_all_search_base)  
  
22  

Scenario  4:  Consistency  Is  Key  
Why  do  we  have  an  extra  app?  
ConfiguraKon  Overview  --  Splunk  Health  Overview  
· Comparing  btool  output  across  like  instances  shows  configuraKon  inconsistencies  
23  

Scenario  5:  Splunk  Usage  
· Inventories  
· Reports,  dashboards,  apps  
· Search  AcKvity  
· Are  users  running  efficient  searches?   · hGp://docs.splunk.com/DocumentaKon/Splunk/latest/Search/WritebeGersearches     · How  are  the  scheduled  jobs  doing?  Differed/Skipped?  
· User  acKvity  monitoring  
· What  views  are  being  accessed  
· Who  has  access  to  data  
· Roles  and  permissions  
· Useful  dashboards  
· Search  AcKvity  ­  Splunk  Health  Overview   · Scheduler  AcKvity  ­  Splunk  Health  Overview   · Search  AcKvity:  Instance  ­  DMC    
                    Useful  app:  Data  Governance  on  apps.splunk.com  
24  

Scenario  5:  Inventory  Check  

Saved  Search  Inventory  --  Splunk  Health  Overview  

· |  rest  splunk_server_group=dmc_group_search_head  /servicesNS/--/--/saved/searches  

  

  

25  

Scenario  5:  User  AcKvity  
Can  always  spot  weekends!  
View  and  Dashboard  Audit  ­  Splunk  Health  Overview  
· index="_internal"  sourcetype=splunk_web_access  GET  app     |  rex  "GET  /[^/]+/app/(?<app>[^/  ?]+)/"     |  search  app!="search"  app=*  AND  user=*  AND  user!="--"     |  Kmechart  limit=100  count  by  app  
26  

Scenario  6:  Search  Performance  

Review  search  acKvity  to  ensure  system  and  users  are  happy     
Tools   · Search  AcKvity  ­  Splunk  Health  Overview   · Scheduler  AcKvity  ­  Splunk  Health  Overview   · hGp://docs.splunk.com/DocumentaKon/Splunk/latest/Search/WritebeGersearches     · Search  AcKvity  Instance  ­  DMC        What  to  look  for   · Long  running  searches   · Real  Kme  searches   · Concurrency   · Inefficient  inline  regular  expressions   · Streaming  commands  before  searching  commands   · Scheduling  --  Frequently  executed  searches  for  long  periods  of  Kme.  ie  running  a  search  for  the  last  day  every  minute  

  

27  

  

Scenario  6:  Knowing  What  Is  Being  Searched  
Search  range  by  index  
Looks  like  bulk  of  the  searches  cover  45  days  
Search  AcKvity  ­  Splunk  Health  Overview    
28  

Scenario  6:  Search  Performance  
Understanding  concurrency  
Search  AcKvity  ­  Splunk  Health  Overview  
· The  total  number  of  concurrent  searches  is  base_max_searches  +  #cpus*max_searches_per_cpu   · max  real--Kme  searches  =  max_rt_search_mulKplier  x  max  historical  searches  
· Set  in  limits.conf  
29  

Scenario  6:  Search  Performance  
InspecKng  Searches  
Search  AcKvity  ­  Splunk  Health  Overview  
Other  helpful  views:  
Job  inspector  --  hGp://docs.splunk.com/DocumentaKon/Splunk/latest/Knowledge/ViewsearchjobproperKeswiththeJobInspector   Job  Viewer   Search  AcKvity  Instance  --  DMC  
   30  

Wrap  up:  Other  Sanity  Checks  
Validate  ulimit  sevngs:  
· --n  open  files  (>2048)       · --f  file  size    (unlimited?)       · --d  data  seg  size  (>1GB)    
   Ensure  THP  is  disabled  on  Linux  distros:  
· hGp://docs.splunk.com/DocumentaKon/Splunk/latest/ReleaseNotes/ SplunkandTHP    
Index  sizing:  
· Ensure  that  higher  volume  indexes  (>10GB/day)  are  tuned  with  maxDataSize  =   auto_high_volume  and  have  the  appropriate  number  of  maxHotBuckets  
· Using  Fire  Brigade  can  help  determine  index  bucket  sizing.   · More  buckets  =  more  scanning  =  slower  searches  
31  

Scaling  Splunk  ­  Knowing  What  To  Look  For
Key  things  to  look  for...      MeeKng  the  reference  hardware  specs  
· Indexing  volume   · 150--200GB/day/indexer  non--ES  /  ~100  GB  ES   · Talk  to  your  friendly  sales  rep!  
Data  retenKon  
· Can  you  meet  your  retenKon  SLA?  
System  load  
· Is  your  system  load  >  #  cores?  
Number  of  users/searches  
· Check  search  concurrency  --  real  Kme   and  historical  
32  

Copyright  ©  2015  Splunk  Inc.  
Q&A  

THANK  YOU  

