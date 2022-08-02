Copyright  ©  2015  Splunk  Inc.  
End--to--End  Monitoring   Unified  Performance   Dashboard  (UPD)  
Calvin Smith Project Solution Architect Rich Galloway Systems Integration Engineer Michael Rodriguez Splunk Analytics Engineer Karen Wilson Program Manager Northrop Grumman Information Systems (NGIS)

Disclaimer  
During  the  course  of  this  presentaHon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauHon  you  that  such  statements  reflect  our   current  expectaHons  and  esHmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaHon  are  being  made  as  of  the  Hme  and  date  of  its  live   presentaHon.  If  reviewed  aRer  its  live  presentaHon,  this  presentaHon  may  not  contain  current  or   accurate  informaHon.  We  do  not  assume  any  obligaHon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiHon,  any  informaHon  about  our  roadmap  outlines  our  general  product  direcHon  and  is  subject  to   change  at  any  Hme  without  noHce.  It  is  for  informaHonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaHon  either  to  develop  the  features  
or  funcHonality  described  or  to  include  any  such  feature  or  funcHonality  in  a  future  release.  
2  

About  Northrop  Grumman  
 Global  provider  of  advanced  soluHons  that  deliver  Hmely,   enabling  informaHon  to  where  it  is  needed  most  for  our   military,  intelligence,  civilian,  state  and  local,  and  commercial   customers.      NGIS  Vision/Mission:  Trusted  partner  of  mission--enabling   informaHon  systems  for  the  security  and  well--being  of  our   naHon  and  allies.    16,000+  Employees,  50  states,  21  countries    Headquarters  in  McLean,  VA  
  
3  

About  Us    
The  End--to--End  Monitoring  team  supports  federal,  state  and   local  government  programs,  specializing  in  cyber  and   performance  monitoring.  
· Cal  --  25  years  in  networking  &  monitoring,  5  years  as  cyber   strategist  and  technologist;  avid  music  collector,  internet   tech  enthusiast  and  road  warrior  
· Rich  ­  27  years  in  fault--tolerant,  high--volume  compuHng;    3   years  in  conHnuous  and  end--to--end  monitoring.  20--year   Habitat  for  Humanity  volunteer  
· Michael  ­  8  years  in  .com  engineering  and  advanced   analyHcs;  4  years  in  conHnuous  and  end--to--end  monitoring.   Supporter  of  Central  Texas  Dachshund  Rescue  and  member   of  Extra  Life,  an  organizaHon  that  raises  money  through   gaming  for  Dell  Children's  Medical  Center  of  Texas  
4  

IT  Challenges    
Complex IT Environment · State-wide agency · Large state-wide application, millions of transactions per day · 11 Regions · 1,100 Field sites · Tens of thousands of users: case workers, CBOs and citizens · Thousands of servers, network and infrastructure devices
Data Difficulties · Many disparate data sources, highly complex network environment · Siloed information · Hard to aggregate and correlate information in real time
Availability Issues · Impacts productivity within agency · Disrupts delivery of public-facing citizen services
5  

Concept  of  OperaHons  
Design  and  Integrate  into  exis5ng  data  management  pla9orm  
·   Splunk  central  event  and  log  data  aggregaHon  point  
Integrate  and  Interoperate  
· Current  legacy  applicaHon,  network,  infrastructure  monitoring  and  systems   management  tools    
Implement  real--5me  dashboards  for  3  key  stakeholder  groups  
· ExecuHves  ­    Business  insight  on  ciHzen  service  delivery,  customer  acHvity   · OperaHons  ­  Real--Hme  KPI  tracking  with  dynamic  trending  &  predicHon   · Technical  ­  Device  detail  of  endpoints,  network,  applicaHon  &  data  center  
3  Dashboards,  each  with  3  levels,    9  integrated  dashboards  total  
6     

UPD  by  the  Numbers  #  1  

Texas  State  Applica5on      
· 5M  TransacHons  per  day   · 165M  TransacHons  per  month   · .95  sec  TransacHon  rate  (avg)   · 5K  Concurrent  Users   · 20K  Total  Users  

Texas State Network
· 11 Regions · 262 Cities · 1,100 Field Sites · 3 Dot Com Sites · 815 Network Devices · 1388 Network Device Interfaces · 100 Servers · 50+ Database Instances · 15TB Data mart

7  

UPD  by  the  Numbers  #  2  

System  Opera5on  

System  Delivery  

· 43  IdenHfied  KPIs  

· Requirements  Analysis:    90  Days  

· 110  UPD  Metrics  

· System  Design:    60  Days:  

· 12  Integrated  Performance  Monitoring   Tools  
· 4  Planned  by  end  of  year  
· 24  OperaHng  Scripts  
· Data  IntegraHon  APIs:  SOAP:  4,  REST:  1,   DB  Connect:  3,  UF:  3,  Email:  1  

· Data  Management:    30  Days  
· System  Development:    270  Days   · Total:    15  Months   · Agile  development,  weekly  customer  
reviews  

· 110  Splunk  Searches  

· 9  Integrated  dashboards  

· 5--17  Minute  dashboard  refresh  rates  

· 850M  Data  indexed  daily  

8  

High  Level  Architecture  
Approved for Public Release #15-0413; Unlimited Distribution
9  

Tool  IntegraHon  Architecture  
10  

UPD  Ninja  Weapons  
Advanced  Visual  Analy5cs  
· Acceptable  Performance  Range  (APR)  ­  A  chart  based  display     of  DCC  based  on  our  predicHve  analyHcs  minute  per  minute  
· Enhanced  Mapping  ­  Using  real  Hme  data  paired  with  predicHve  analyHcs  we  are  able   to  display  exact  locaHons  with  unique  criHcal  metrics    
· Dynamic  Color  Coding  (DCC)  ­  Display  scheme  of  green,  yellow  and  red  based  on   predicHve  analyHcs  
· Interac5ve  Calendar  ­  Clickable  calendar  with  metric  totals  per  day  paired  with  criHcal   daily  metrics  
· Key  Performance  Indicator  (KPI)  with  Trending  ­  A  real  Hme  metric  with  DCC  paired   with  a  display  comparing  the  current  bucket  of  Hme  to  the  previous  per  metric  
Predic5ve  Analy5cs     · CombinaHon  of  a  real  Hme  metrics,  Hme,  historical  baselines,  local  and  seasonal   level  values,  and  different  confidence  interval  parameters  minute  per  minute   uniquely  24/7  builds  our  predicHve  models  for  each  of  our  metrics  conHnuously  
11  

ExecuHve  Performance  Dashboard  
KPI  w/  Trending,  Enhanced  Mapping,  DCC  
12  

Enhanced  Mapping  
Region,  City,  LocaHon,  Device  
13  

Enhanced  Mapping  
 Texas  counHes  and  agency  regions  called  for  a  custom  map    Mashup  of  US  Census,  Texas  agency  data    Implemented  using  D3,  JavaScript,  CSS,  Simple  XML  
14  

OperaHons  Performance  Dashboard    
KPI  w/  Trending,  Enhanced  Mapping,  DCC,  InteracHve  Calendar  
15  

InteracHve  Calendar  
· Open source JavaScript · Standard Splunk Search · Simple XML Dashboard Code Download code at fullcalendar.io
16  

InteracHve  Calendar  
 Remedy  On  Demand  (cloud)  sends  daily  CSV  as  email  apachment    Scripted  input  uses  Office365  REST  API  to  read  the  apachment    Splunk  indexes  scripted  input  into  correct  sourcetype/fields    Sourcetype/fields  are  connected  to  automaHc  lookup  tables    JS  and  CSS  files  were  updated  to  match  our  field  names  and  "look  and  feel"      A  standard  Splunk  search  is  created  and  put  into  the  simple  xml    Calendar  click  sends  user  to  a  Level  2  Change  Calendar  dashboard  
17  

Technical Performance Dashboard
KPI w/ Trending, DCC
18  

Ninja  Skills  for  Tool  IntegraHon  
· Mostly  scripted  inputs  
­ SOAP  and  REST  queries   ­ XML  responses  parsed  and  fields  extracted  by  the  script   ­ Reduces  indexed  data  by  50%  saving  customer  licensing  costs  
· Email  input  
­ Office  365  has  a  very  comprehensive  REST  interface   ­ Can  read  messages  and  apachments   ­ Script  decodes  CSV  apachment  and  passes  to  indexer  
19  

Acceptable  Performance  Range  (APR)  

· Based  on  our  predicHve  analyHcs  minute  per  minute.     · No  staHc  or  predefined  thresholds.     · A  secondary  metric  can  be  added  for  context.    
20  

Primary  Metric   Primary  Metric  Baseline   Primary  Metric  APR   Secondary  Metric  

Lessons  Learned  &  Future  Events  
Use  separate  apps  for  UI  /  inputs  
· Easier  updates   · UI  app  only  on  search  heads;  input  scripts  only  on  indexers  
Don't  be  afraid  to  DIY  
· SomeHmes  there  isn't  an  app  for  that   · Scripted  inputs  can  filter  and  format  data  
UI  Design  ConsideraHons  
· Design  for  mulHple  plavorms  (Mobile,  TV,  Desktop)   · Simple,  clean,  and  flat  design  will  make  you  stand  out  in  a  crowd   · Get  conHnuous  customer  input  throughout  design  and  development  process  
What's  Next...  
· Integrate  addiHonal  network,  infrastructure  and  system  management  tools   · Extend  dashboard  to  monitor  other  development  environments   · Build  Cyber  Dashboard  for  Data  Center  
21  

Points  of  Contact  
Karen  Wilson  
Program  Manager   Email:      karen.wilson@ngc.com  
Calvin  Smith  
SoluHon  Architect  &  Project  Lead   Email:      ch.smith@ngc.com  
Rich  Galloway  
Systems  Engineer,  Splunk  Integrator   Email:      richard.galloway@ngc.com    
Michael  Rodriguez  
Systems  Engineer,  Splunk  AnalyHcs  and  Design   Email:      michael.rodriguez@ngc.com    
22  

QuesHons?  
23  

THANK  YOU  

