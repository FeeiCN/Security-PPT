Copyright  ©  2015  Splunk  Inc.  
Making  Splunk  Your   Primary  InformaEon   Portal      
Splunk  Dashboarding  in  AcEon  
Donald  Mahler  
Performance  Engineering  and   Systems  Monitoring,  Leidos  

Disclaimer  
During  the  course  of  this  presentaEon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauEon  you  that  such  statements  reflect  our   current  expectaEons  and  esEmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaEon  are  being  made  as  of  the  Eme  and  date  of  its  live   presentaEon.  If  reviewed  aRer  its  live  presentaEon,  this  presentaEon  may  not  contain  current  or   accurate  informaEon.  We  do  not  assume  any  obligaEon  to  update  any  forward  looking  statements  we  
may  make.     In  addiEon,  any  informaEon  about  our  roadmap  outlines  our  general  product  direcEon  and  is  subject  to   change  at  any  Eme  without  noEce.  It  is  for  informaEonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaEon  either  to  develop  the  features  
or  funcEonality  described  or  to  include  any  such  feature  or  funcEonality  in  a  future  release.   Referenced  customers  for  ITSI  product  parEcipated  in  a  limited  release  soRware  program  that  included  
items  at  no  charge.  
2  

Who  We  Are  

 Science  and  technology   soluEons  leader  
 Focus  on  naEonal  security,   health,  and  engineering  
 Government  and  commercial   customers  
 Created  9/27/13  and   headquartered  in  Reston,  VA  

Leidos  Leadership  at  the  New  York  Stock  Exchange   Ringing  the  Opening  Bell  

3  

Who  Am  I  ?    
 Director  of  Performance  Management/Monitoring  at  Leidos,  a  science  and   technology  soluEons  leader,  based  in  Reston,  VA              
­ Internal  Leidos  IT  include  business  service  management  (BSM),  server/cloud   monitoring,  applicaEon  performance,  and  common  security/network/applicaEon   logging        
 Career  in  systems/network  management  across  many  plaaorms  and  OS's;     presented  at  numerous  conferences  and  seminars  on    technology  and   soluEons  
­ 2014  Splunk  .conf  and  Gartner  infra  ops  conferences     ­ SplunkLive  events  (in  NYC  and  DC)         ­ Aprisma  Spectrum  user  conference  (keynote),  NeEq's  Netconnect,  Novell's  
BrainShare,  Managed  Object's  user  conference,  IBM  AOTC,  Planet  Tivoli,       IBM  SHARE.      
4  

Agenda  
 Our  original  portal  and  philosophy      Overview  of  our  Splunk  core  environment      The  rise  of  Splunk  usage      Splunk  for  Dashboarding    

OperaEonal  Intelligence  

SituaEonal  Awareness    

Performance  and   Capacity  ReporEng  

Common  Logging  and  Analysis  

Service  Delivery   ReporEng    

Network   Management  

Server   Management  

Infrastructure   Management  

ApplicaEon  Mgt   and  SyntheEcs    

ITSM  integraEon     (EckeEng,  change,  CMDB)  

· CollaboraEon  w/  ITSM  and  monitoring   · AlerEng/  EckeEng/dispatch  on  producEon  issues   · CorrelaEon  of  issues  to  the  effect  on  the  business  
IT  services  

· Dashboarding  and  reporEng   · Performance  and  inventory  reporEng   · Infrastructure--wide  logging  

Monitoring  Products  

EMGTweb  

Splunk  

Network   Management  
NPM  
Cascade   Nealow  
HP  NA    

Business  Service  Management     (NeEq  OperaEons  Center)  

Server  Management  

SyntheEcs  

OEM   Exchange  
Lync  

Splunk  Windows  
AcEve  Directory     Batch  Services  

ipMonitor   WPM   F5    

Appmanager   Vcops/  vCenter  

Backups  
7  

  HPSim  

ITops  ReporEng  Sources  
· ITIL­ all services rooted in the CMDB · Report on services from various sources (in context)
- Already had access to all this
· The insight comes from when you combine the towers
- Example: correlating monitoring with ITSM ticket/change

Server  Inv/ Perf  
Change  info  

VM  Inv/Perf   Ticket  info  

CMDB  
EMGTdb  
8  

Network  Inv/ Perf  
Site  Inv  

Other  
ApplicaEon   info  

Splunk    --  Atop  the  Management  Ecosystem  

Server  Inv/ Perf  
Change  info  
9  

VM  Inv/Perf   Ticket  info  

Data  Flow  
CMDB  
EMGTdb  
9  
©2013  LEIDOS.  ALL  RIGHTS  RESERVED.      

Logfiles,  Agents   Dbconnect   Dbquery   CSV  
Network  Inv/ Perf  
Site  Inv  

Other  
ApplicaEon   info  

What  is  IT  OperaEonal  ReporEng?    
 The  need  to  know  the  state  of  the  enterprise,  across  many  dimensions  
­ Status  ­  including  monitoring,  EckeEng,  changes     ê (what  we  think  is  happening,  what  the  users  think,  what  we  have  changed)    
­ Problem  invesEgaEons  (what  did  we  know  and  when?)     ­ Inventory   ­ Performance  
 Common  portal  access  --  Provide  lots  of  varied  content  up  and  down  the  stack    
­ From  Switch  port  usage  to  Ecket  rates,  to  WAN  circuits,  all  the  way  to  overall  service  status  
In  general,  we  need  to  show  and  tell:  list  things,     graph  them  over  @me,  highlight  anomalies,  etc....           
10  

EMGT  and  EMGTweb  

 Hand  craRed  /  HTML  based    --   originally  circa  2000  
 Displaying  informaEon  from   various  monitoring  DB's  
­ Underlying  heterogeneous  CMDB/ inventory  DB  ­  emgtDB  
­ Accesses  product    DB's  

· HTML  
­ Tables--  color  cells  ,  raw  scripEng,  with   some  ASP  
· Cumbersome  web  development  and   adding  of  features    
­ Time  selecEon     ­ Wide  variety  of  interface  "feels"    
· Anychart  for  graphing    

Clearly  we  needed  to  do  something  
11  

Our  Splunk  Journey  
 Pre  2010  
­ Syslog  servers  ("tail  and  spit")  
 2010  ­  Splunk  10GB  
­ Routers,  switches  
 2012  ­  Splunk  400GB  
­ Router,  switches,  Firewalls,  Servers  
 2013--2014  --  bump  to  700GB/day  (then  split  company  400/300)  
­ More  servers,  more  networking    gear  ,  more  applicaEons  
 2015  ­  bump  to  700GB/day  
12  

What  is  in  our  Splunk?  

CompuEng   Network   Security   Auth  

· Over  2,000  devices  send  data  to  Splunk    

AcEve  Directory®  

· Splunk  consumes  up  to  400GB  of   logging  and  performance  data  daily  
· Feeds  alerts,  EckeEng,  changes,   performance  data    

Firewall   IDS  
Switches   Routers  

DB:  database  

DNS:  Domain  Name  Service     DHCP:  Dynamic  Host  Configura@on  Protocol  

VMware®  

VPN:  Virtual  Private  Network    

IDS:  intrusion  detec@on  system   IPS:  Intrusion  preven@on  systems  

Physical  

SSL:  Secure  Sockets  Layer   WIFI:  wireless  fidelity  

Monitoring  

VMware  is  a  registered  trademark  of  VMware,  Inc.  in  the  U.S.  and/or  other  countries.  

Ac@ve  Directory  and  Windows  are  registered  trademarks  of  MicrosoS  Corpora@on  in  the  U.S.  and/or  other  countries.    

Linux  is  a  registered  trademark  of  Linus  Torvalds  in  the  U.S.  and/or  other  countries.  

13  

SSL  VPN  
Proxies   IPS  
DNS/DHCP   WIFi  
Windows®   Linux®  
Web/DB  Logs  

What  Splunk  Brings  to  the  Table    
 It  has  all  the  data    
­ Ability  to  consume  all  the  informaEon  (logs/collectors/Dbconnect)     ­ Or  reach  out  and  grab  it  as  needed  (dbquery)   ­ New  mindset  ­  gather  the  data  and  figure  out  a  use  for  it  later    
 Common  look  and  feel    
­ Ability  to  build  out  selecEon  criteria  (even  using  dynamic  criteria)     ­ Nice  widgets  to  make  the  dashboarding  more  compelling     ­ Shared  concept  of  Eme    
 Powerful  graphing  
­ Graph  everything  the  same  way,  whether  it  is  server  cpu,  user  response  Eme,   router  link  uElizaEon  
­ Quick  reframing  of  Eme    
Share  the  data,  free  the  people    
14  

Along  Comes  Splunk  6    
 Easy  XML  dashboarding      Dashboard  ediEng      Smart  drilldown    Easy  prototyping    Use  of  Emed  data      Use  of  lookups  
".conf  session  on  dashboarding"    
15  

EMGT2  --  The  ITO  ReporEng  App  in  Splunk  
 Are  we  delivering  quality  IT  services?    How's  our  availability?  What's  happening  right  now?      What  happened  last  night?    Last  week?      When  was  that  server  last  rebooted    Did  the  backups  work?      Did  the  batch  jobs  run?      How  long  did  they  take?      Any  red  flags  in  our  Lync  servers?      How  bad  are  the  call  quality  MOS  
scores?      Who  is  that  server  talking  to?      Is  it  being  denied?  
Currently  80+  dashboards  and  30+  legacy  links    
16  

Step  1  ­  Get  Requirements  
 Define  the  need,  users,   security  
 Who  is  the  audience?      Is  it  appropriate?    Do  we  have  the  data  we  
need?    What  types  of  insights  
are  we  looking  for?      What  happens  on  
drilldown?  (where  do   you  want  to  take  them)      
17  

Step  2  ­  Gather  Your  Data  

Logfiles  
Syslogs    Router/switch  logs    App  logs    AuthenEcaEon  logs    Firewall  logs  
Classic  logfile  data  
Lookups  
· CMDB   · Network  inventory   · AD  user/computer  info   · AlEris  PC  info  
Status/refreshed  CSV     

DB  connecEons  
· Network  uEl,  CPU   · Server  metrics     · App  metrics     · SyntheEc  metrics  
   Time--series  structured  DB  
queries  
Dbquery  
· BSM   · Availability  reports  
informaEon     
External  realEme     DB  queries  

Step  3  ­  Design  the  Dashboard  
 Purpose  
­ Targeted  purpose  (like   status  displays)    
­ Inventory  vs  history     ­ Explorers  
 Decide  on  widgets  
­ Tables,  graphs,  column/ bar/pie  charts,  single   values    
­ Prefer  highly  dense   dashboards    
ê Rows  and  panels  
19  

Step  4  ­  Publish  and  Iterate    
 Rapid  development  and   updates  
 Anchor  into  menu    Examples:  
­ Syslog  analysis,  while  issue  was   happening    
­ Network  outage  reports,  to   quanEfy  reimbursement   requests         
20  

EMGT2  ­  Splunk  App    --  Structure    

 Status    
­ Across  the  board  perspecEves,   including  a  summary  page  
­ Performance  highlights  and  hot  spots    
 ITSM  
­ TickeEng,  changes,  problem  
 Inventory  
­ Systems/Services,  CMDB,  various   inventories,  counts    
­ Service  delivery  grades    
 Network    
­ Sites,  inventory,  alerts,  performance,   syslogs      

· Service  ­  hand  build  views    
· Explore  
­ Myriad  of  areas,  including  batch  jobs,   backups,  service  accounts,  inventory  
­ Server,  syntheEc,  network  performance      
· Tools  
­ Firewall  log  queries,  syslog  searchs,  alert   searches    
· EMGTweb  ­  misc  links  
· Dashboards  
· Search  

21  

Status:  Landing  Page  ­  What's  Going  On?    
 Is  anything  hot  right  now?    
­ Sev1  Eckets,  Ecket  flow,   BSM  
­ Major  alerts,  major   changes  
­ Spiking  routers  and  servers  
 How:    
­ Pull  in  "best  of"  queries   from  across  Splunk,  to   show  status    
­ Drilldown  
22  

Status:  What  Changed?    

· First  thing  asked  when  major   issues  happen  
· Put  all  views  of  "change"  in  one   place  
· How:    
­ Pull  in  all  view's  of  change  into   one  dashboard    

· Approved  Request  for  Change     · RFC  suppressions   · Network  config    changes   · Firewall  changes  and  content  changes     · Reboots  (network  /  server)     · AlEris  installs   · Tripwire  

23  

Status:  CriEcal  Alerts  and  BSM  

 How  are  we  doing   right  now    

 Alert  perspecEve  

vs  BSM  perspecEve    

 How:    
­ Dbquery  to  BSM  /   manager  of  

<drilldown  target="_blank">                       <link  field="host">                           <![CDATA[                             /app/EMGT2/emgt__simple_log_search?form.searchstring=$row.host$                           ]]>                       </link>  

managers  DB   ­ Drilldown  based  on  
column      

                    <link  field="status">h|ps://externallink1?$row.eventkey$_$row.host$</link>                       <link  field="Jme">  h|ps://externallink2?$row.eventkey$</link>                       <link  field="severity">  h|ps://externallink3?$row.eventkey$</link>                       <link  field="msg">  h|ps://externallink4?$row.eventkey$</link>                       <link  field="Jcket">  h|ps://externallink5?$row.Ecket$</link>                   </drilldown>  

24  

Network:  Remote  Site  CharacterisEcs    
 Started  with  uplink,   employees,  site   support  
 Added  other  network   capabiliEes,  has:    
­ Firewalls,  DHCP   appliance,  UPS,   wireless,  etc..  
 How:    
­ Inputlookup  csv   ­ Use  of  mulE--
selecEon  for  mix/ match    
25  

Network:  WAN  Performance  
 Look  at  all  sites  together    Look  at  some  classic  metrics  for  
WAN's    Use  of  color  to  highlight  columns    Drilldown  to  "ne^low",  history,  
others    How:  DBconnect  NPM  metric  data  
26  

Service  Profiling:  Lync  Servers  (KHI)  
 Look  at  all  Lync  server   together  
 Color  code  the  metrics    Drilldown  to  graphs    How:    
­ Splunk  Universal  Agent  data   ­ Color  via  CSV/JS    
27  

Service  Profiling:  Lync  Call  Quality  
 Gather  call  records    Report  on  service  metrics  
and  poor  quality  calls  (and   from  where)      How:    
­ Collect  call  records  via   DBconnect  
­ Consume  CIDR  to  @e   Ipaddresses  to  loca@ons    
28  

Explore:  Tools  for  Sysadmins    
· TopN  across  5  key  metrics  (look  across  all  servers)     · Event  logs,  reboots,  patching    

Explore:  Server  Profiling    

 Windows:    

 Linux:    

­ cpu,  memory,  process  queue,  disk  stats   alerts,  reboots,  criEcal  eventlogs      
­ How:  Splunk  universal  agent  (and  some   ne@q  appmanager),  alert  flow,  

- cpu,  memory,  process  queue,  disk  IO   - How:  DBconnect  to  Oracle  OEM,  
alert  flow    

eventlogs    

30  

Explore:    Nightly  Batch  Jobs  
 Expose  job  status  to   those  not  using  Tidal   console    
 Use  of  color  to  highlight   columns  
 How:    
­ Dbconnect:    Tidal  job   data  
31  

Explore:    Nightly  Backups  
 Vitally  important  that   backups  work    
 Service  delivery  grade   for  backups  defined,  as   well  as  working   backups  
 How:    
­ Dbconnect:    netbackup/   backupexec  
32  

Explore:  syslogs    
 Allow  easy  inspecEon  and  trending   of  network  (and  other  syslogs)  
 Quick  searches  across  device   classes  (routers,  switches,  UPS,   Vmware,  UCS)    
 Radio  bu|ons  for  known  situaEons     (BGP  flaps,  neighbor  changes,   ba|ery  issues)    
33  

Looking  Forward      

· ConsumpEon  of  DB/more   applicaEon  logs    
· Splunk  apps     
· Exchange   · AcEve  Directory®     · UCS   · Clearpass  
· Splunk  for  ITops  ("mom")      
· ReErement  of  EMGTweb  v1    

· Redouble  efforts  to  get  all  devices   and  applicaEons  into  Splunk  
· Be|er  use  of  data  modelling    

   Ac@ve  Directory  is  a  registered  trademarks  of  MicrosoS  Corpora@on  in  the  U.S.  and/or  other  countries.  
34  

Thanks  
Donald  Mahler   ITS Performance Engineering and Systems Monitoring
Email:  donald.mahler@leidos.com            
Visit us at www.leidos.com   
35  

THANK  YOU  

37  

Abstract  
 Making  Splunk  Your  Primary  IT  InformaEon  Portal  
­ Intermediate  |  SoluEons  &  Industries:  IT  OperaEons,  Log  Management  |   Products:  Splunk  Enterprise  |  Role:  IT  OperaEons  Manager,  Administrator  
 Speakers  
­ Donald  Mahler,  Director  Performance  management,  Leidos  
 Over  the  years,  Leidos  IT  built  up  a  portal  for  management   informaEon;  inventory,  status,  performance,  logs,  special  reports,   and  more  (which  was  badly  in  need  of  a  re--design/faceliR).  Then   along  came  Splunk  6,  and  we  transformed  all  the  criEcal  informaEon   displays  into  a  sleek  new  delivery  vehicle.  Come  and  see  how.    
38  

