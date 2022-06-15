To Xfinity and Beyond:
Mission Critical Metrics and Tips For Managing Any Size Splunk Installation
Kate  Lawrence--Gupta    &    Joe  Cramasta   Comcast  ----  Technology  &  Product  Division  

Disclaimer
During  the  course  of  this  presentaAon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauAon  you  that  such  statements  reflect  our   current  expectaAons  and  esAmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaAon  are  being  made  as  of  the  Ame  and  date  of  its  live   presentaAon.  If  reviewed  aOer  its  live  presentaAon,  this  presentaAon  may  not  contain  current  or   accurate  informaAon.  We  do  not  assume  any  obligaAon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiAon,  any  informaAon  about  our  roadmap  outlines  our  general  product  direcAon  and  is  subject  to   change  at  any  Ame  without  noAce.  It  is  for  informaAonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaAon  either  to  develop  the  features  
or  funcAonality  described  or  to  include  any  such  feature  or  funcAonality  in  a  future  release.  
2  

Lineup  
!  Intros   !  Overview  of  Comcast/Splunk  deployment   !  What  to  Measure  &  Why   !  Planning  Ahead   !  Measuring  Capacity/UAlizaAon  
!  Using  REST  commands   !  DetecAng  Latency   !  Dealing  With  High  Volume  Sources   !  Wrap  up   !  Q  &  A  
3  

Kate  &  Joe  
!  Managing  &  Senior  Engineer  responsible  for  several  Splunk   installaAons  at  Comcast  
!  Run  a  dedicated  team  providing  Splunk  as  an  operaAonal  service     !  Between  the  2  of  us  over  25  years  of  experience  in  operaAons,  
monitoring,  and  systems  administraAon  
4  

Comcast  Overview  
!  Global  media  and  technology  company   consisAng  of  Comcast  Cable  and  NBC  Universal  
!  Comcast  Cable:  NaAon's  largest  video,  hi--speed   internet  and  phone  provider  under  the  XFINITY   brand  
!  Creator  of  the  X1  Entertainment  OperaAng   System  &  XFINITY  Home  Security  System  
!  NBC  Universal:  One  of  world's  leading  media   and  entertainment  companies  
5  

Splunk  Deployment  
! Splunk  is  "criAcal  path"   !  Several  thousands  of  forwarders  sending  data  
to  Splunk.   !  SupporAng  over  a  1000  Splunk  Users   !  Dedicated  Team  of  4  Splunk  Admins   ! Splunk  runs  on  dedicated  hardware  &  storage  
across  mulAple  datacenters   !  99.95%  upAme  &  less  than  10  seconds  of  
indexing  latency  
6  

Use  Splunk  to  Measure  Splunk  
7  

How?  
     
By  Trending!  
CPU  UAlizaAon   License  Volume  Trends  
   OVER  TIME  
8  

Genng  Started  
­ Setup  a  Management  Search  Head     ­ Peered  to:  
­ Indexers   ­ Search  Heads   ­ Deployment  &  Cluster  Managers     ­ Heavy  Forwarders  
9  

What  to  Measure?    
Start  with  the  CPU...  
!  Measure  your  CPU  performance  at  the  individual  host  level.  
10  

Why  CPU?  
  
Bas   ic  CPU  stats  show  us  how  the   indexers  are  performing   throughout  the  day  
  
%  IDLE  ­  measures  your  search  load.     %  USER  ­  measures  your  index  load.    
  
11  

Trend  It--  %IDLE  
     
12  

Trend  It--  %USER  
     
13  

   Trend  It  ­  License  Volume  
  Take  a  closer  look  at  that  license  volume...  
!  Your  licensing  data  is  full  of  great  informaAon  that  allows  you  to     actually  TREND  your  data  volume  over  Ame.  
14  

Trend  It  --  Volume  
15  

Planning  for  the  Future  
!  With  all  the  volume  metrics  informaAon  you  now  have,  you  can  start   to  look  at  the  trends  &  analyze  the  rates  of  growth  that  you  are   seeing.  
!  QuesAons  you  will  be  able  to  answer:  
­ Which  source  types  are  growing  the  fastest?   ­ Is  your  volume  growth  consistent  with  the  numbers    
of  hosts  you  have  deployed?   ­ Or  is  trending  with  the  number  of  customers    
you're  supporAng?  
16  

Bringing  It  Together  --  Capacity  
! Splunk  gives  us  the  rough  esAmate  that  you  can  index  50--100GB  a   day  on  a  bare--metal  indexer.  
  
17  

Bringing  It  Together  --  Capacity  
18  

Bringing  It  Together  --  Capacity  
%USER  IS  ABOVE  70%   %IDLE  IS  BELOW  10%       
19  

Splunk  It  ­  Capacity  Query  
! host=<license  master>  index=_internal  source="/opt/splunk/var/log/splunk/license_usage.log"  b>0     ! [|  rest  /services/licenser/localslave  splunk_server=<filter  for  a  TYPE  of  indexer>|  fields  slave_id  |  rename  slave_id  AS  i]     ! |  bucket  _Ame  span=1h  |  stats  sum(b)  AS  b  by  i,_Ame     ! |append  [search  source=sar  host=<filter  for  a  TYPE  of  indexer>  perc_idle>60  AND  perc_user>30     ! |  bucket  _Ame  span=1h  |  stats  values(perc_idle)  AS  idle,  values(perc_user)  AS  user  by  _Ame]   ! |  eventstats  values(idle)  AS  idle,  values(user)  AS  user,  avg(b)  AS  b    by  _Ame  |  table  _Ame  idle  user  b     ! |  where  isnotnull(idle)  |  eval  gb=b/1024/1024/1024     ! |  stats  avg(idle),  avg(user)  avg(gb)  AS  avg_h_gb  by  _Ame     ! |  where  isnotnull(avg_h_gb)     ! |  stats  min(avg_h_gb)  as  min,  max(avg_h_gb)  as  max,  stdev(avg_h_gb)  as  stdev     ! |  eval  mid1=min+stdev     ! |  eval  mid2=max--stdev     ! |  eval  d1=mid1*24     ! |  eval  d2=mid2*24  |  table  min  max  d1  d2  
20  

What  is  This?  
!  Healthy  Total  Daily  Capacity  for  an  indexer.       
21  

Tips  for  Managing  Your  Splunk  InstallaAon  
22  

Topics  
!  Using  Splunk's  REST  API  For  TroubleshooAng  and  ReporAng   !  DetecAng  Latency  Between  Forwarders  and  Indexers   !  Dealing  With  High  Volume  Sources  
23  

Splunks  Rest  API  
!  Every  feature  of  SPLUNK  is  accessible  from  the  REST  API   !  Indexers           !  Forwarders             !  Search  Heads                 !  Deployment  Servers  
24  

Check    
!  h}p://docs.splunk.com/DocumentaAon/Splunk/6.2.5/RESTREF/RESTlist  
25  

Ways  to  Access  the  API  
!  Directly  From  Search  UI  on  Management  Search  Head  
­ Rest  (SPL)  Command  
!  Web  Browser  or  Curl  
26  

Danger,  Will  Robinson!  
!  You  can  delete  &  modify  using  post  requests  to  rest  
27  

The  Rest  (SPL)  Command  
|  rest  <ENDPOINT>  <SPLUNK_SERVER>  ----opAonal  (searches  all  peers  by  default)  
28  

Real  World  Examples  
!  ReporAng  On  Peered  Indexers   !  Viewing  Recent  Errors   !  Reports  of  Configured  Alerts   !  Forwarder  Monitor  TroubleshooAng  
29  

ReporAng  On  Peered  Indexers  
InformaAon  You  Can  Get....   !  Peer  Name   !  SPLUNK  Version   !  Status  
30  

ReporAng  On  Peered  Indexers  
|  rest  /services/search/distributed/peers  |  search  disabled=0  AND  status=Up  AND   (splunk_server=search_head_1  OR  splunk_server=search_head_2)    |  stats  dc(peerName)  AS   indexerCount  by  splunk_server  
31  

Viewing  Recent  Search  Errors  
!  |  rest  /servicesNS/--/--/search/jobs  
InformaAon  You  Can  Get....   !  Search  Query  Used   !  Time  of  ExecuAon   !  User   !  Error  &  Warn  Messages  
32  

Viewing  Recent  Search  Errors  
!  |  rest  /servicesNS/--/--/search/jobs  |fields  published  label  author  messages.error   messages.warn  label  Atle  |  rename  Atle  AS  search  |  search  messages.warn="*"  OR   messages.error="*"    
33  

ReporAng  On  Scheduled  Alerts  
!  |  rest  /servicesNS/--/--/saved/searches/
   InformaAon  You  Can  Get....   !  Name  Of  Saved  Search   !  Email  DistribuAon   !  Run  Frequency   !  Search  Time  Frame   !  Alert  CondiAon  
34  

ReporAng  On  Scheduled  Alerts  
! |  rest  /servicesNS/--/--/saved/searches/    |  search  is_scheduled=1  AND  acAons=email  AND   acAon.email.sendresults=1  AND  disabled=0  |  rename  alert_condiAon  AS  AlertCondiAon  |  rename   cron_schedule  AS  Schedule  |  rename  dispatch.latest_Ame  AS  TimeFrameLatest  |  rename   dispatch.earliest_Ame  AS  TimeFrameEarliest  |  rename  eai:acl.owner  AS  CreatedBy|  rename  Atle  AS   AlertName  |  rename  search  AS  SearchQuery  |  rename  eai:acl.app  AS  SplunkAppLocaAon  |  fields  AlertName   SearchQuery  acAon.email.to  AlertCondiAon  Schedule  TimeFrameLatest  TimeFrameEarliest   SplunkAppLocaAon  CreatedBy  splunk_server  |  makemv  delim=","  acAon.email.to  |  rename  acAon.email.to   AS  Recipients    
35  

TroubleshooAng  Monitors  
Using  The  Web  Browser  *no  admin:changeme  
h}ps://splunk--forwarder:8089/services/admin/inputstatus/ TailingProcessor:FileStatus  
36  

DetecAng  Latency  
37  

DetecAng  Latecy  ­  Method  #1  
­ Run  a  All  Ame  (Real--Time)  search.  This  is  a  quick  and  dirty  report  on  data  as  its   arriving  to  the  indexer.  
38  

DetecAng  Latecy  ­  Method  #2  
· Using  The  Internal  Fields  that  track  WHEN  The  Event  Was  Indexed   · _index_earliest  &  _index_latest    
39  

Reasons  Why  You  Might  Have  Latency  

Overloaded  Indexers   · SOS  has  some  great  dashboard  for  Distributed  Indexing  Performance  which  shows   how  full  the  different  indexer  queues  are  

·

  

     

40  

Reasons  Why  You  Might  Have  Latency  

­ Overloaded  Forwarders     
· Increasing  maxKBps  in  the  limits.conf  on  the  forwarder.  

· However  this  may  just  make  ANOTHER  situaAon  worse.  

  

    

41  

Indexer  Affinity!  
ASSUMPTION   !  Forwarders  AutomaAcally  Distribute  My  Data  To  All  
Indexers  
REALITY   !  Forwarders  Only  Switch  When  When  A  Source  Has  3  
Seconds  With  No  AcAvity  
INDEXER  AFFINITY   !  Term  Used  To  Describe  When  A  Forwarder  Is  "Stuck"  
Sending  A  Source  To  A  Single  Indexer  
42  

Detecting Indexer Affinity
!  index=*  |  stats  count  dc(splunk_server)  AS  indexerCount   values(splunk_server)  AS  indexers  by  host  source  |  where   indexerCount=1  |  sort  0  --  count  
43  

forceTimebasedAutoLB  
WHAT  DOES  IT  DO?   !  Forces  forwarders  to  switch  indexers  when  it  reaches  the  configured  
autoLBFrequency  duraAon,  even  if  the  switch  occurs  in  the  middle  of   a  single  event  that's  being  generated!   !  AutomaAcally  reconciles  any  event  that  was  in  the  middle  of  being   wri}en  during  the  forced  switch  so  there  is  no  data  loss  OR  half   events!    
44  

Thanks!  
! Kate_Lawrence--Gupta@cable.comcast.com   ! Joe_Cramasta2@cable.comcast.com   Q  &  A  
45  

THANK  YOU  

