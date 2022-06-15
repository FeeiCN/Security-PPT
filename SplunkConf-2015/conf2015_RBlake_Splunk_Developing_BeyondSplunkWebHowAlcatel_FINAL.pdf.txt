Copyright  ©  2015  Splunk  Inc.  
Beyond  SplunkWeb  
Rory  Blake  
Senior  Consultant,     Professional  Services,  Splunk     

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  aPer  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

Copyright  ©  2015  Splunk  Inc.  
IntroducFon    

Agenda  
 Introducing  Alcatel--Lucent  and  the  Velocix  CDN    Splunk  Professional  Services    The  Big  Data  Problem    The  Big  Data  SoluFon    Velocix  ReporFng  API    Velocix  ReporFng  User  Interface    Splunk  Powered  ReporFng  PlaWorm  
4  

TesFmonial  

"Our  customers  are  very  posiFve  about  our  Splunk  Embedded  

analyFcs...  Splunk  Embedded  enables  us  to  deliver  reporFng  that  is  

richer  and  more  versaFle  than  anything  a  provider  can  achieve  by  

bolFng  a  third--party  soluFon  onto  exisFng  management  tools.  This  

value  proposiFon  gives  Velocix  CDN  a  powerful  compeFFve  

advantage."    

  

Velocix  CDN,  Alcatel--Lucent    

  

5  

Customer  Profile  
6  

subscribers from the network edge. Delivery from inside the network also reduces the transit and peering expenses that go along with carrying over-the-top (OTT) video and distributing popular software packages.
A service provider can use an on-net CDN to deliver QoE that can't be matched by OTT providers. Unlike third-party CDN services that deliver content from off the network, an on-net CDN avoids points of congestion by delivering content from caches close to consumers. By minimizing the distance that content travels over the network, it promotes faster and more reliable streaming. This assures quality
What  is  a  CDN?   of service (QoS) and allows the service provider to manage and preserve content
quality throughout delivery -- a crucial requirement for monetizing content and building brand equity.

opportunities

Figure 1. A scalable on-net CDN architecture efficiently delivers content from multiple sources

Distributed delivery caches reduce backbone traffic and improve QoE

Head-end (content)

Subscriber

Edge router
Access network

Delivery cache

Core network

Aggregation router

Interconnection with other service
providers or third-party CDNs

Move content insertion points closer to subscribers

Internet gateway

On/off-net boundary

Internet (content)

VELOCIX CONTENT DELIVERY NETWORK ALCATEL-LUCENT BROCHURE 3

7  

Velocix  CDN  Market  
· Strong momentum, driven by TV Everywhere rollouts in NA and UK
· Field-proven by leading telco and cable TV innovators · Endorsed by major content providers (HBO, Starz, Epix,
BBC, Sky, ...) · Capable of supporting any network type: HFC, DSL/GPON
and wireless · Full ecosystem of strategic partners · Global customer base, connecting over 30M subscribers to
date
8  

Velocix  CDN  Global  References  

Time  Warner  Cable  ­   USA  
TV  Everywhere  with  per   stream  encrypFon  and   mulF--tenant  capabiliFes  

Telus  --  Canada  
TV  Everywhere  with  per   stream  encrypFon  and   mulF--tenant  capabiliFes  

Windstream            USA  
Mediaroom  mulFscreen   soluFon  with  Quickplay  
overlay  

Major  MSO  #1  USA  
1st  mulFscreen  soluFon   using  encrypted  stream  
to  HLS  devices  
Major  MSO     USA  #1  
Major  MSO  Mexico  

Major  MSO  #2  USA  
Major  MSO     USA  #2  
Major  MSO  #1   Mexico  
Major  MSO  #2   Mexico  

Sasktel  --  Canada   MulF--screen  content  
delivery  
Major  MSO   ArgenFna  

Major  MSO  Canada   Major  MSO  #3  USA  
Talk  Talk     UK  
Member  of  Canvas  with   YouView  and  CDN   wholesale  services     Major  Telco   ArgenFna   Live  and  on--demand   content  delivery    

Deployment Trial

Major  Telco  Tunisia  
Oi     Brazil   MediaRoom  mulFscreen   evoluFon    
Major  Telco  South   America  

Major  Telco  Middle   East  

Liberty  Global   InternaFonal  
1st  mulF--country  CDN   and  cloud  DVR  for  mulF-- screen  Fme  shiPed  TV    
Major  Telco     Spain  
DistribuFon  of  NPVR   content  to  classic  STB  
using  ATIS  C2  
SK  Broadband   South  Korea  
WIND  Italy  
wholesale  CDN  for   media  distribuFon  
Major  Telco     Portugal  
Cloud  DVR  for   mulFscreen  Fme  shiPed  
TV  

9  

Splunk  Professional  Services  
· Faster  Time  to  Delivery   · Best  PracFce  Guidance   · Use  Case  Development   · Architecture  Guidance   · Advanced  CustomizaFon   · TroubleshooFng   · And  more..  
10  

Copyright  ©  2015  Splunk  Inc.  
The  Big  Data  Problem  

AdapFve  Streaming  

· 90  minute  movie  
· 2  different  devices  
· With  just  3  bit  rates  for  each  device  
   · Small  fragment  sizes  =  massive  
amount  of  individual  files  --   requiring  careful  management   on      the  origin.  
  
· In  this  example,  we're   generaFng  two  megabytes  of   log  data  for  a  single  viewing  of   the  movie.  

The  Numbers  

2MB  of   Log  Data  

13,500  Content  files  

Smooth   Manifest  

audio   750kbps   1500kbps   3500kbps  

Edge   Delivery  

HLS  

Manifest  

750kbps   1500kbps   3500kbps  

VxOA  

12  

Copyright  ©  2015  Splunk  Inc.  
The  Big  Data  SoluFon  

Advanced  ReporFng  

Alerts  on  threshold  crossing  events  

Features     

Export  opFons  +  API  access  to  reporFng  metrics  

Scalable  plaWorm  for  adapFve  streaming   workloads  

Scheduled  reports  

All--new  user  interface  (Console2)  

Built--in  and  custom  reports  

CDN  ReporFng  and  Enhanced  AnalyFcs  packs  

Reports  run  in  seconds  for  both  near--real-- Fme  and  historical  

Log  data  opFmised  for  reporFng  in  several   dimensions  

MulF--year  retenFon  of  historical  reporFng  data  

API  based  architecture  

14  

OpFmising  the  end  to  end  ALU  soluFon  

Commonly designed applications and logs means all components are `speaking the same language' · Speed · Efficiency · Insight · Value

· Common Log Format for all applications and Systems.
· Simplifies data normalisation
· Allows monitoring and reporting across all systems and applications

Alcatel-Lucent Reporting Engine

Logs

Logs

Logs

· Indexing all raw data allows any custom report to be created from source data.

Alcatel-Lucent Delivery
Applications

Delivery Application
15  

UI created report

Logs

Reporting Application

Custom customer report

Seeing  the  wood  from  the  trees  

ExtracFng  value  from  logs  

Very High Volume Logs Smooth Streaming = 30 logs per minute Concurrent Streams Multiple Servers
Data Repetition Only one field change between log entries.
Near Real Time Reporting Gives Customers: · Insight · Network Monitoring

#Fields:  s--dns  date  time  x--duration  c--ip  c--port  c--vx--zone  c--vx--gloc  cs--method  cs--uri  cs-- version  cs(User--Agent)  cs(Referer)  cs(Cookie)  cs(Range)  sc--status  s--cachestatus  sc--bytes  sc-- stream--bytes  sc--dscp  s--ip  s--vx--rate  s--vx--rate--status  x--vx--serial  rs--stream--bytes  rs--bytes  cs-- vx--token  sc--vx--download--rate  x--protohash   #Software:  Velocix  PCD  42.0.163766.163766  
#Start--Date:  2015--08--17  14:30:00   cp1.zzz49d1.cdn  2015--08--17  14:30:36  0.110  172.31.176.4  42920  external  g  GET  http:// testsite.zzz49s1.pub/static_file.txt  1.1  "NagiosChecker"  --  --  --  200  CACHE_MEM_HIT  929962   929603  0  192.168.176.131  0  --  3  0  0  --  --  WP:0300000000000000   cp1.zzz49d1.cdn  2015--08--17  14:30:38  0.090  172.31.176.4  42923  external  g  GET  http://
testsite.zzz49s1.pub/static_file.txt  1.1  "NagiosChecker"  --  --  --  200  CACHE_MEM_HIT  929962   929603  0  192.168.176.131  0  --  3  0  0  --  --  WP:0300000000000000   cp1.zzz49d1.cdn  2015--08--17  14:30:40  0.070  172.31.176.4  42924  external  g  GET  http:// testsite.zzz49s1.pub/static_file.txt  1.1  "NagiosChecker"  --  --  --  200  CACHE_MEM_HIT  929962   929603  0  192.168.176.131  0  --  3  0  0  --  --  WP:0300000000000000   cp1.zzz49d1.cdn  2015--08--17  14:30:40  0.090  2a00:81c0:4000:3141::320:100  42954  external  g.gb  
GET  http://testsite6.zzz49s1.pub/static_file.txt  1.1  "NagiosChecker"  --  --  --  200  CACHE_MEM_HIT   929962  929603  0  2a00:81c0:4000:3151::500:100  0  --  11  0  0  --  --  WP:0b00000000000000   cp1.zzz49d1.cdn  2015--08--17  14:30:42  0.070  2a00:81c0:4000:3141::320:100  42955  external  g.gb   GET  http://testsite6.zzz49s1.pub/static_file.txt  1.1  "NagiosChecker"  --  --  --  200  CACHE_MEM_HIT   929962  929603  0  2a00:81c0:4000:3151::500:100  0  --  11  0  0  --  --  WP:0b00000000000000  
cp1.zzz49d1.cdn  2015--08--17  14:30:45  0.110  2a00:81c0:4000:3141::320:100  42956  external  g.gb   GET  http://testsite6.zzz49s1.pub/static_file.txt  1.1  "NagiosChecker"  --  --  --  200  CACHE_MEM_HIT   929962  929603  0  2a00:81c0:4000:3151::500:100  0  --  11  0  0  --  --  WP:0b00000000000000   cp1.zzz49d1.cdn  2015--08--17  14:31:50  0.950  172.31.176.4  43018  external  g  GET  http:// download.zzz49.pub/bt/f5eca038739d55e031c2a4ebdd934a3494b6219c/data  1.0  "Wget/1.11.4  Red  Hat  
modified"  --  --  --  200  --  12918896  12918482  0  192.168.176.131  0  --  2  0  0  --  --   BT:f5eca038739d55e031c2a4ebdd934a3494b6219c   cp1.zzz49d1.cdn  2015--08--17  14:31:52  1.430  2a00:81c0:4000:3141::320:100  43050  external  g.gb   GET  http://download.zzz49.pub/bt/f5eca038739d55e031c2a4ebdd934a3494b6219c/data  1.0  "Wget/ 1.11.4  Red  Hat  modified"  --  --  --  200  --  12918896  12918482  0  2a00:81c0:4000:3151::500:100  0  --  2  0  
0  --  --  BT:f5eca038739d55e031c2a4ebdd934a3494b6219c   cp1.zzz49d1.cdn  2015--08--17  14:34:03  0.080  172.31.176.4  60900  external  g  GET  https:// sslsite.zzz49s1.pub/static_file.txt  1.1  "NagiosChecker"  --  --  --  200  CACHE_MEM_HIT  929963  929603   0  192.168.176.131  0  --  8  0  0  --  --  WP:0800000000000000   cp1.zzz49d1.cdn  2015--08--17  14:34:05  0.070  172.31.176.4  60901  external  g  GET  

16  

Advanced  ReporFng  
Principles  
HTTP  adapFve  streaming  leads  to  a  big  data  problem  dealt  with  by  using  a  big  data  approach  powered  by  Splunk.  

Efficient Log Data Storage
· Nothing  stripped  from  incoming  log  data   · Distributed  across  a  horizontally  scalable  plaWorm   · Replicated  across  sites  for  high  availability  

Optimised For Reporting
· Key  metrics  about  network  traffic,  errors,  caching  efficiency  and   content  popularity  are  extracted  and  calculated  as  logs  arrive  
· Daily  summaries  generated  for  long  term  trend  analysis  

Custom  ReporFng   Just  because  log  data  might  not  be  opFmised  in  a  certain  way  shouldn't  mean  that  you  can't  report  on  it.       Bespoke  reporFng  allows  jobs  to  be  scheduled,  run  in  the  background  and  send  a  noFficaFon  when  they  are  done.  

Scheduled  

Run  

Done  

17  

Copyright  ©  2015  Splunk  Inc.  
Velocix  CDN   ReporFng  API  

Ready  Made  &  Custom  ReporFng  SoluFon  

CDN  Owner  

Velocix Reporting Engine

Customer   ReporFng  
System    

User Interface API
 API  based  reporFng  allows  customers  to  
integrate  with  exisFng  systems  

19  

ReporFng  Architecture  

CDNL  Loogsg     Files  

           

Indexed Raw Data
Daily Summary Index Accelerated Data Store

REST API

Velocix  Console  
Velocix  ReporFng   API    
20  

CDN  Admins   Custom  Apps  

ReporFng  is  API  Driven  
{    "_links":  {           "http://uri.velocix.com/relation/owner":  {   "name":  "jobs",               "profile":  "http://uri.velocix.com/profile/unapi/               "title":  "Report  Job  Collection"           },           "self":  {               "href":  "https://us0.zzz44s1.cdn:449/jobs/admin               "profile":  "http://uri.velocix.com/profile/unapi/               "title":  "Results  for  the  Traffic  analysis  report"           }       },       "columns":  [           [               "28/07/2014",               "04/08/2014",               "11/08/2014",               "18/08/2014",               "25/08/2014"   ],           [               "149.414762",               "528.568406",               "530.261831",               "531.420959",               "531.715453"   ]       ],       "fields":  [           "Date",           "Bytes  delivered  (GB)"       ]  }  
21  

Copyright  ©  2015  Splunk  Inc.  
Velocix  ReporFng   User  Interface  

UI  Technologies  
23  

· Line  graph   · Area  graph   · Column  chart   · Pie  chart   · Bar  chart   · Geo  map   · CSV  export  

VisualisaFons  

24  

· Line  graph   · Area  graph   · Column  chart   · Pie  chart   · Bar  chart   · Geo  map   · CSV  export  

VisualisaFons  

25  

· Line  graph   · Area  graph   · Column  chart   · Pie  chart   · Bar  chart   · Geo  map   · CSV  export  

VisualisaFons  

26  

· Line  graph   · Area  graph   · Column  chart   · Pie  chart   · Bar  chart   · Geo  map   · CSV  export  

VisualisaFons  

27  

· Line  graph   · Area  graph   · Column  chart   · Pie  chart   · Bar  chart   · Geo  map   · CSV  export  

VisualisaFons  

28  

· Line  graph   · Area  graph   · Column  chart   · Pie  chart   · Bar  chart   · Geo  map   · CSV  export  

VisualisaFons  

29  

· Line  graph   · Area  graph   · Column  chart   · Pie  chart   · Bar  chart   · Geo  map   · CSV  export  

VisualisaFons  

30  

Click  To  Zoom  
Click to Zoom allows the ability for the customer to instantly examine a portion of the reporting data in more detail.
Simply click and drag over the range of data for which you require a more detailed view. The selected area will then expand to fill the visualisation area.
`Reset Zoom' at the top right of the graph will allow the zoom to be reverted to its original visualisation when clicked.
31  

Copyright  ©  2015  Splunk  Inc.  
Splunk  Powered   ReporFng  PlaWorm  

ReporFng  System  Components  

Delivery Tier

Reporting Tier

Delivery  Appliance     
· ExisFng  Delivery  Tier  
· Forwards  log  data  to   indexers  
· Distributes  log  data   between  all  indexers  

Indexers     
· Ingests  Data   · Replicates  to  Other  
Indexers   · Accelerates  Data  For  
searching   · Searches  on  reporFng  
data  as  directed  by   Search  Head  

Search  Head     
· Receives  search  
requests  from  Console   · Orchestrates  searching  
for  report  data  across   all  Indexers   · Collates  search  results  
and  returns  to  Search   Head  

Cluster  Master     
· Coordinates  
ReplicaFon   · Asisgns  Primary  
Searchable  data   copies   · Runs  Scheduled  
Searches     

33  

Delivery Tier

High  Level  Architecture  
Load  balanced  data  is  spread   across  the  indexers.  
Indexer  clustering  provides   high  availability  and   resilience.  
AcFve  passive  cluster  master   for  failover  
  

Reporting Tier

Cluster Master Indexer

Search Head
Utility Server (Console)

Site1 34  

Service  Node  Hardware    
Reference  PlaWorms  ­  Base  Deployment  

Cluster Master

Search Head

2X  
Indexer

RHEL-7 (Red Hat Enterprise Linux 7) Storage Controller
x0

RHEL-7 (Red Hat Enterprise Linux 7) Storage Controller
x4

RHEL-7 (Red Hat Enterprise Linux 7) Storage Controller
x12

35  

Service  Node  Hardware    
Reference  PlaWorms  ­  Scaled  Deployment  

Indexer
RHEL-7 (Red Hat Enterprise Linux 7) Storage Controller
x12

Indexer
RHEL-7 (Red Hat Enterprise Linux 7) Storage Controller
x12

36  

ReporFng  Data  Indexing  &  RetenFon  

· Raw  log  data  stored  in  main  index   - Allows  for  flexible  Fme  resoluFon  in  reports   - Storage  space  consumed  is  directly  related  to   quanFty  of  delivery  traffic  and  streaming  technology   used  
· Daily  summaries  are  compiled  on  a  daily  basis   - Generated  aPer  2  days  to  allow  for  late--arriving  data   from  Delivery  Appliances   - Searchable  aPer  3  days  to  allow  for  generaFon  
· Configurable  retenFon  policy    
- main  vs  summary  index  

Delivery   appliance  

Log  data  

Main  Index   Accelerated   Data  

Summary  Index  

37  

ReporFng  Data  Phase  1  

Main Index
Header Based Indexed Field
Extractions
· Index Time Field Extractions · 50% More Storage
· Accelerated Data Generated at Index Time
· No Acceleration Lag

Scheduled search results
Regenerated Hourly Using Tstats Scheduled searches
· Refreshed Hourly · Earliest - Last 7 days · Latest ­ 3 Hours Ago · Based On tstats Search · Statistics ready for Post Processing · Filtering · Wildcard Lookups

Summary Index
Daily Aggregated Data
· Refreshed Daily · Long Term Trending · Separate Retention Policy · Configurable capacity vs. Main
Index

38  

High  Performance  ReporFng  Phase  1  

Summary  Search  Results     

Scheduled   Search  Results  
  

--1year  

--7days  

--3days   now  

39  

ReporFng  Data  Indexing  Phase  2  

Main Index
Search Time Field Extractions
· No Indexed Extractions · 50% Less Storage

Accelerated Data Models
This is generated continuously, as new logs arrive, maintained
alongside the main index
· Simplified Searches · Lookups and translations
accelerated · Superfluous information is removed
· Summary Index results are also data modelled to provide consistent transllations for the reporting API.
  

Summary Index
Daily aggregated data
· Refreshed Daily · Long Term Trending · Separate Retention Policy · Configurable capacity vs. Main
Index

40  

High  Performance  ReporFng  Phase  2  

Accelerated  Data  Model  derived  from  Summary   Search  Results     

--1year  

--7days  

--3days   now  

41  

Summary  
· Accelerated  project  delivery   · ReporFng  capabiliFes  exceeded  expectaFons   · Search  complexity  abstracted  away  from  users  by  API  wrapper   · Stable,  scalable  and  self  monitoring   · Further  InformaFon:  
Eric  Henderson   Senior  Product  Manager   Eric.Henderson@alcatel--lucent.com  
42  

THANK  YOU  

