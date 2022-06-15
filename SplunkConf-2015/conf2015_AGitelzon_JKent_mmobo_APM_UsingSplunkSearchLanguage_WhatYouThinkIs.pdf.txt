Copyright  ©  2015  Splunk  Inc.  
What  You  Think     Is  Real  Is  Not     Real,  Learn  How   Splunk  Uncovered   The  Truth!  
Jeff  Kent  
President  m--mobo  
Alex  Gitelzon  
System  Administrator,  APM  
Dennis  Morton  
Splunk  Expert  m--mobo  

Disclaimer  
During  the  course  of  this  presentaWon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauWon  you  that  such  statements  reflect  our   current  expectaWons  and  esWmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaWon  are  being  made  as  of  the  Wme  and  date  of  its  live   presentaWon.  If  reviewed  a[er  its  live  presentaWon,  this  presentaWon  may  not  contain  current  or   accurate  informaWon.  We  do  not  assume  any  obligaWon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiWon,  any  informaWon  about  our  roadmap  outlines  our  general  product  direcWon  and  is  subject  to   change  at  any  Wme  without  noWce.  It  is  for  informaWonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaWon  either  to  develop  the  features  
or  funcWonality  described  or  to  include  any  such  feature  or  funcWonality  in  a  future  release.  
2  

How  Do  You  Know   What  Is  Real?  

Video  
4  

Subconscious  Test  
5  seconds  to  read  the  sentence,  only   read  it  once  and  count  the  number  of   lecer  "F"      
FINISHED  FILES  ARE  THE  RESULT  OF  YEARS  OF  SCIENTIFIC   STUDY  COMBINED  WITH  THE  EXPERIENCE  OF  YEARS    
5  

#  Of  F's  
How  many  counted  3?  
FINISHED  FILES  ARE  THE  RESULT  OF  YEARS  OF  SCIENTIFIC   STUDY  COMBINED  WITH  THE  EXPERIENCE  OF  YEARS    
6  

Agenda  
· APM  Business  Model  And  Challenges   · Splunk  Architecture  And  IniWal  ConfiguraWons   · Problems   · SoluWons   · Demo   · Lessons  Learned  
7  

M--mobo  
8  

American  Public  Media  (APM)  
· 90  Radio  staWons  in  the  Midwest,  California,   Florida  
· 20  NaWonally  distributed  programs   · 900  StaWons  carry  programming  to  18  million  
listeners   · Winner  of  mulWple  Media  Awards  
  
9  

Business  Model  
· Revenue  
­ Generated  through  Ads   ­ Listeners  or  subscribers  
· Expenses  
­ Content  Delivery  Networks  (CDN)  
· Important  metrics  
­ "What"  Popular  programming   ­ "How"  are  they  consuming  the  content   ­ "When"  are  they  listening   ­ "Where"  what  adverWsing  markets  
10  

Challenges  
11  

IniWal  Splunk  ConfiguraWons  
Early  successes  with  Splunk:   · IniWal  data  loading  was  relaWvely  easy   · We  very  quickly  idenWfied  an  issue  with  download  counts      IniWal  challenges  with  Splunk:  

· ·

  

Reports  were  slow,  taking  over  an  hour  to  run  for  a  months  worth  of  data   Lookup  table  for  agent  user  strings  were  inaccurate  

· Could  not  get  a  consolidated  view  of  all  listener  behavior  across  sources  

· Vendor  fields  kept  changing  

· Issues  with  collecWng  the  exact  data  from  an  applicaWon  called  Wowza  

  

12  

Splunk  Architecture  

Android  
  
iPad  
iPhone  

Forwarders   CDN  Servers  

Proxy   Forwarder  

firewall  

Splunk  server  

13  

Example  log  

203.0.113.110  ""  2015--07--01  04:59:59  "GET  /podcast/marketplace/ segments/2015/06/30/mp_20150630_seg_21_64.mp3? listeningSessionID=558878963c788f58_719653_N3egv0g_0000000hRr5   HTTP/1.1"  200  1946331  ""  "Marketplace/2014.04.24.1100  CFNetwork/ 672.1.15  Darwin/14.0.0"  3  
192.0.2.150  ""  2015--07--01  04:59:59  "GET  /podcast/marketplace/pm/ 2015/06/30/pm_20150630_pod_64.mp3  HTTP/1.1"  302  255  ""  "Dalvik/2.1.0   (Linux;  U;  Android  5.0;  SM--N900P  Build/LRX21V)"  0  
   203.0.113.223  ""  2015--07--01  04:59:59  "GET  /podcast/marketplace/
podcast_nu/2015/06/19/weekend_20150619_pod_nu_64.mp3  HTTP/1.1"   302  271  ""  "Dalvik/1.4.0  (Linux;  U;  Android  2.3.4;  Kindle  Fire  Build/ GINGERBREAD)"  31  
198.51.100.133  ""  2015--07--01  04:59:59  "GET  /podcast/nflw/2015/06/27/ nflw_20150627_64.mp3? listeningSessionID=5588552cf8d07783_728723_4UwUCKLg_0000000LfT4   HTTP/1.1"  206  297  ""  "AppleCoreMedia/1.0.0.12F70  (iPhone;  U;  CPU  OS  8_3   like  Mac  OS  X;  en_us)"  0  

Marketplace  App  on  iPhone   Android  Phone   Kindle  Fire   iPhone  iOS  8.3  

14  

Code  From  IniWal  ConfiguraWons  And  Fixes?  
  
    index=aod  Podcast_Name=table  OR  Podcast_Name=splendid_table   |  dedup  downloadId  |  Wmechart  count  by  file  limit=20  
 index=aod  status=302  |  stats  first(Podcast_Name)  as  Podcast_Name   count(uri)  as  count  by  uri  |  sort  Podcast_Name  asc|  fields  
  
Podcast_Name,uri,count  
 How  to  make  all  searches  start  at  7  days  instead  of  all--Wme?  
 In  /opt/splunk/etc/system/local/ui--prefs.conf  
­ [search]   ­ dispatch.earliest_Wme  =  --7d@d   ­ dispatch.latest_Wme  =  now  
15  

Report  Example  
     
16  

Issues  with  ExisWng  Tool  

Defini&on  
Sessions  
AcWve  Listeners   Implement  report  
changes   Outliers  
GeolocaWon  

Exis&ng  tool   30  min  ­  2  hours   30  min  ­  2  hours   Days  to  Months   Couldn't  idenWfy  
No  

Splunk   Seconds  to  minutes   Seconds  to  minutes  
Within  Seconds   IdenWfied   Yes  

17  

Robots  
 One  of  the  early  reports  that  we  created  was  to  add  up  the  bytes  by   IP  address  
 Splunk  allows  easy  drill  down  into  data    That  allowed  us  to  see  that  we  had  a  very  large  amount  of  traffic  
from  one  ip  address  
18  

Fixing  Consolidated  View  
· index=aod  status=20*  method=GET     · |  eval  listeningSessionID  =  if(isnull(listeningSessionID)  OR  listeningSessionID="",  downloadId,   listeningSessionID)     · |  stats  sum(bytes)  as  TotalSize  by  Podcast_Name  listeningSessionID  clienWp  uri_path  date_hour   · |  where  TotalSize  >  100000     · |  chart  count(Podcast_Name)  as  TotalCount  over  Podcast_Name   · |  sort  --  TotalCount  
· |`tstats`  sum(Web.bytes)  as  TotalSize  from  datamodel=Web  where  Web.status=20*  AND   Web.hcp_method=GET  AND  Web.App=adswizz  by  Web.podcast_name,  Web.client_id,  Web.src,   Web.uri_path,  Web.date_hour   · |  where  TotalSize  >  100000     · |  `drop_dm_object_name("Web")`     · |  chart  count(podcast_name)  as  TotalCount  over  podcast_name     · |  sort  --  TotalCount  
19  

SoluWon  Approach  
 Leverage  the  accelerated  Web  CIM      Add  addiWonal  fields  where  appropriate  to  the  standard  datamodel    Rewrite  exisWng  reports  using  "tstats"    Add  addiWonal  panels  with  valuable  informaWon  
20  

Why  Accelerated  Data  Models  
 Three  main  methods  for  making  searches  faster:  
­ Report  AcceleraWon   ­ Summary  Indexing   ­ Data  Model  AcceleraWon  
 Each  has  their  advantages/disadvantages    Chose  data  model  acceleraWon  because...  
­ Easy  to  "normalize"  the  various  inputs  --  one  report  to  cover  all  data  sources!   ­ Easy  to  support  and  extend  vs  other  opWons   ­ Freakin'  fast...   ­ Splunk  uses  it  in  their  very  popular  Enterprise  Security  product!  
21  

Data  Inputs  Overview  
· Three  types  of  data:  
­ Adswizz,  Wowza,  and  Icecast   ­ All  fairly  stock  Apache--like  logs   ­ Radically  different  names  for  the  same  fields  
· Adswizz  example:  
 24.189.xxx.xxx "" 2015-08-20 20:34:03 "GET /podcast/marketplace/ podcast_nu/2015/08/20/hlppodcast2_64.mp3 HTTP/1.1" 302 260 "http:// www.marketplace.org/topics/wealth-poverty/york-fig/york-fig-whereare-they-now" "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36
(KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36" 0   · Goal  is  to  map  each  specific  data  sources  fields  into  the  Web  CIM   · See  here  for  Web  CIM  informaWon:  
­ hcp://docs.splunk.com/DocumentaWon/CIM/latest/User/ Web#Fields_for_Web_event_objects  
  
22  

Adswizz  CIM  Field  Mapping  Example  
 EVAL-app = "adswizz"  FIELDALIAS-adswizz-web-cim = method AS http_method
clientip AS src timetaken AS duration useragent AS http_user_agent uri AS url referer AS http_referrer bytes AS bytes_out Podcast_Name AS podcast_name AS media_name root AS category  EVAL-is_ondemand=if(match(uri_path,"^/podcast"),0,1)  EVAL-is_podcast=if(match(uri_path,"^/podcast"),1,0)  EVAL-client_id = if(isnull(listeningSessionID) OR listeningSessionID="", downloadId, listeningSessionID)
23  

Adswizz  CIM  Field  Mapping  Example  (cont.)  
 Need  to  do  more  than  just  map  fields  to  the  CIM  ­  must  ensure  it's   tagged  properly!  
 Recommended  method  is  to  use  an  evencype  and  tag  off  of  that.  
 Example:  
­ Evencypes.conf   [adswizz] search = index=aod sourcetype=aod #tags = web · Tags.conf   [eventtype=adswizz] web = enabled   
24  

Using  Acelerated  Data  ­  tstats  Basics  
· Similar  to  stats,  but  different  and  a  bit  strange   · Example  #1:  table  of  all  podcast  download  errors:  
| tstats count from datamodel=Web where Web.is_podcast=1 AND (Web.status=40* OR Web.status=50*) by Web.podcast_name,Web.status
· Example  #2:  graph  the  previous  over  Wme:  
· NoWce  the  use  of  "sum(count)"  in  the  Wmechart  command!   · `drop_dm_object_name`  macro  removes  the  "Web"  prefix  from  fieldnames  
| `tstats` count from datamodel=Web where Web.is_podcast=1 AND (Web.status=40* OR Web.status=50*) by Web.status,_time span=12h | `drop_dm_object_name("Web")`| timechart sum(count) by status
25  

Fun  With  tstats  
How  about  a  graph  of  total  podcast  downloads  and  bandwidth?  
|`tstats` count,sum(Web.bytes) as total_size from datamodel=Web by Web.podcast_name,_time span=4h | where total_size>10000 | eval total_GB=total_size/(1024*1024*1024) | timechart span=4h sum(count) as downloads, sum(total_GB) as GB_downloaded
26  

More  tstats  
· "summariesonly"  opWon  
- In  general,  set  this  to  "true"  to  ensure  that  all  dashboards  run  at     maximum  speed  
- Downside  is  that  if  you  are  querying  a  Data  Model  that  is  not  100%   accelerated  you  might  miss  data  (though  this  is  unlikely  in  regular  pracWce)  
· "allow_old_summaries"  opWon  
- Useful  during  data  model  development   - Set  to  true  to  prevent  having  to  wait  unWl  the  acceleraWon  is  up--to--date  
· "prestats"  OpWon   · Using  macros  ­  example:  
   27  

Useful  Macros  for  tstats  
· The  following  macros  make  using  tstats  simpler!    [tstats]    definiWon  =  tstats  `summariesonly`  `allow_old_summaries`    iseval  =  0  
 [allow_old_summaries]    definiWon  =  allow_old_summaries=t    iseval  =  0  
 [summariesonly]    definiWon  =  summariesonly=t    iseval  =  0     
28  

Speed  Comparison  
· Over  the  same  7  day  period  --  A  licle  under  75%  faster   · First  Search  --  This  search  has  completed  and  has  returned  115  
results  by  scanning  8,716,481  events  in  336  seconds   · Second  Search  --    This  search  has  completed  and  has  returned  115  
results  by  scanning  22,017,061  events  in  122  seconds  
· Over  30  days  of  data,  1st  takes  23.2  minutes  and  2nd  search  takes  9.4   minutes,  about  60%  faster  
29  

Live  Demo  
  
30  

Lessons  Learned  
  
31  

THANK  YOU  

