Copyright  ©  2015  Splunk  Inc.  
Using  Splunk  to  Harness   Zebra's  Manufacturing  and   Device  Data  to  Gain   Visibility  and  Provide   OperaMonal  Intelligence  
Saul  Llamas  
Manager  Manufacturing  Test   Engineering   Zebra  Technologies  

Disclaimer  
During  the  course  of  this  presentaMon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauMon  you  that  such  statements  reflect  our   current  expectaMons  and  esMmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaMon  are  being  made  as  of  the  Mme  and  date  of  its  live   presentaMon.  If  reviewed  aWer  its  live  presentaMon,  this  presentaMon  may  not  contain  current  or   accurate  informaMon.  We  do  not  assume  any  obligaMon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiMon,  any  informaMon  about  our  roadmap  outlines  our  general  product  direcMon  and  is  subject  to   change  at  any  Mme  without  noMce.  It  is  for  informaMonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaMon  either  to  develop  the  features  
or  funcMonality  described  or  to  include  any  such  feature  or  funcMonality  in  a  future  release.  
2  

Speaker  Bio  
· Manufacturing  Test  Engineering  Manager   · Develop  manufacturing  test  soluMons  for  board  and  
product  level   · Hardware  and  soWware  uMlized     · C#,  .NET,  LabVIEW   · BS  EET  DeVry  ­  Chicago   · Project  Lead  for  deploying  Splunk  into  Zebra  
3  

1969: Founded as Data Specialties 1980: First barcode printer developed, primary focus 1998: Merged Eltron, Desktop, Card printers 2000: Acquired Comtec, Mobile printers 2013: IoT Zatar platform, MotionWorks sports solutions, Hart Systems 2014: Acquired Motorola's Enterprise business, Scanners, Mobile PC, WLAN
Enterprise Asset Intelligence
CORE  INDUSTRIES  

RETAIL  

T  &  L  

MANUFACTURING  

HEALTHCARE  

Zebra makes businesses as smart and connected as the world we live in
Zebra builds tracking technology and solutions that generate an enormous amount of actionable information and insight, giving companies unprecedented visibility into their businesses by giving physical things a digital voice
Follow the Zebra.
Solutions provided to 95% of Fortune 500 companies
4  

Printers  &  Services  

SoKware  

Mobile  CompuNng  

Services  

Industrial  H   igh  Performance     Card   &  Midrange  

Mobile  

Desktop   Kiosk   Print  Engines   ZebraCare  

Supplies  

RFID  

RFID   RFID  

Specialty   Card  Printer  

Encoders  

CardStudio   Link--OS  
WLAN  

Security  &   LocaNon   PlaPorm  

SoKware  

Intelligent  Infrastructure:   PlaPorms,  Controllers,  AP  

Industrial   Mobility  

RhoMobile   Workforce  

Suite   Connect  

Customer     Facing  

SoKware  

Field   Mobility  

Data  Capture  

Network   ImplementaNon  
ApplicaNon   ImplementaNon  
Network   OpNmizaNon  
Technical     Support  

RFID  

Device  and  Asset  

Management  

Handheld   Engines     Hands  Free   Network  

Internet  of  Things  

  Infrastructure   Management  

ApplicaNon  Enablement  PlaPorm  

Device     Repair  

5  

Agenda  

 Challenge  /  Problem  statement    Journey    Deployment    Reports  /  Dashboard    Company  AdopMon    Internal  Use  Cases    Cool  Items  and  Wishlist    Summary    Next  Steps  

  

6  

Challenge  /  Problem  Statement  

CURRENT  STATE   Limited  data  collected   Data  not  shareable  across  departments   No  reporMng  capability   IT  change  control  to  release  new  data  elements  take  long  to   implement  in  a  typical  database   Increased  volume  generates  more  data   Extract  limited  data  and  Excel  as  analyMcs  engine,  Mme  consuming   Customer  issues  cannot  be  resolved  due  to  limited  data  
Physical  printed  record  keeping  at  CM   React  to  issues  and  anomalies  in  data  

EXPECTED  FUTURE  STATE  
Extensive  data  collecMons  (Test  History,  Test  Data,  Device  Data)   Departmental  /  user  access  to  data   Searchable,  reports,  dashboards   Extensible  
Scalable   AnalyNcs   Time  series  based  events  of  device  history  (ProducMon,  
Reconfig,  Repair)  
e--record   AlerNng  

7  

Project  
Capture  complete  device  data  and  test  history  when  devices  are  produced,   reconfigured  and  repaired    Replace  the  current  architecture  with  a  more  robust  and  flexible  soluNon  that   allows  beher  storage  along  with  adding  analyNcal  and  trending  capabiliNes    Data  will  be  easily  shared  to  enable  beher  business  decisions  across  Quality,   NPD,  Tech  Support  and  Service/Repair  
 Project  Goals  
­ Lower  Nme  to  resoluNon  of  quality  and  customer  issues   ­ ProacNve  monitoring  for  anomalies   ­ Faster  feedback  to  New  Product  Development  to  drive  beher  designs   ­ Hard  cost  savings  target  of  $90,000/yr  through  test  consumable  reducMon  
8  

Zebra uses Test Utilities to execute tests on a device.
-Test History
History of test performed by the test utility on the device.
- Test Data
Any data deemed necessary to log and store that is not provided by Device (Printer) Data.
- Device (Printer) Data
Raw data output of a device (printer).

DATA  DATA  DATA  
Test Utility
Tests performed Test History

Test log creates Test Data

Device (Printer) Data formats

9  

Journey  
 Explored  
­ Data  Historians   ­ Manufacturing  OperaMons  Management  (MOM)   ­ Manufacturing  OperaMons  Center  (MOC)   ­ Oracle  tables  /  Business  Intelligence  (BI)  reports   ­ SQL  tables   ­ Quality  Management  Systems  (QMS)  
 Cost  and  lead  Mmes  to  implement  yielded  poor  ROI  
10  

Journey  
 Zebra  IS  ­  CIO  recommendaMon  to  Director  to  Test  Engineer's    Splunk?    What's  that?    Sales  Pitch  ­  "It  can  read  that.  And  that.  And  that."    InspiraMonal  story  on  Splunk  web    Proof  of  Concept  comparing  Excel  to  Splunk  yielded....  
       ...  Profession  Services  Engagement  over  5  weeks  to  architect,  configure,  
deploy,  modify  internal  soWware,  build  reports  and  dashboards.  
11  

Deployment  Architecture     External    
Manufacturing  Center    

Computers  with   forwarder     

forwarder  
load     balancers  

2  GB  /day  license   Enterprise  6.0.3   VM  Clusters  on  Linux  OS   Deployment  Manager  

Service   Centers    

Reconfig   Centers  

1  External  Manufacturing  Center   8  Service  Centers   3  Reconfig  Centers   30+  test  soWware  apps   600+  computers  worldwide  

forwarder  

users  

master   node  

indexer   indexer   indexer  

Computers  with   forwarder     

Computers  with   forwarder     

12  

search   head  

Dashboard  
· Quick  view  of  producMon  data   · Report  yields  
­ Address  low  yields   ­ Drive  quality  improvements   ­ Focus  on  most  common  failure  events  
· Report  tesMng  run  Mmes  
­ Monitor  for  high  run  Mmes   ­ OpMmize  and  gain  efficiency  
13  

Reports  
· Quick  view  of  sensor  calibraMon   data  at  producMon    
· Report  min,  max,  avg,  media  
­ Allows  baselining  exisMng  product  for   new  product  development  efforts  
­ Monitor  for  anomalies  in  sensor   performance  
  
14  

Reports  
· Quick  view  of  test  consumable   usage  rates  at  producMon    
· Report  min,  max,  avg,  median  
­ Allows  baselining  exisMng  product  for   new  product  development  efforts  
­ OpMmize  tests  that  report  high  media   usage    
­ Viewable  by  test  process     
15  

Dashboard  
· Quick  view  of  product  performance   over  Mme  
· Report  distribuMon  of  data  
­ Characterizes  product  performance   over  Mme  
­ Detect  anomalies   ­ Support  baseline  efforts     
16  

Other  Uses  Case  at  Zebra  
· Faster  Mme  to  customer  resoluMon  
­ Quick  access  to  test  history  and  device  data  answers  the   state  of  the  printer  when  shipped    
· New  product  development  
­ Baseline  current  product   ­ Capture  data  early  in  development  phases  to  drive  
improvements  in  design  prior  to  mass  producMon   ­ Focus  on  most  common  failure  events  
· Anomaly  detecMon  
­ Set  alerts  to  capture  known  defect  paherns  that  prevent   shipment  of  product  
· Data  retenMon  
­ Eliminate  paper  record  keeping  by  logging  electronic   data  
­ Reduce  test  consumables,  opMmizing  test  Mme  and   reducing  costs  
· Process  improvements  
­ Leverage  exisMng  reports  to  opMmize  printer  calibraMon   process  of  exisMng  products  
17  

Company  AdopMon  
 Goal  is  shareable  data.    Build  your  own  reports  /  dashboards  

Test  Engineers  

Process  Engineers  

Electrical  Engineers  

Service  Engineers  

Firmware  Engineers   Sustaining  Engineers  
18  

"If  you  build  it,   he  will  come."  

Cool  Items  and  Wish  list  

COOL  ITEMS  IMPLEMENTED  
· Timestamp  extracted  from  filename  with   epoch  Mme  format  
­ Records  local  Mme  event  occurred,  used   transform  to  extract  Mmestamp,  beher  geo   locaMon  tracking  
· Device  serial  number  extracted  from   filename  
· New  JSON  data  file  format  implemented  for   test  history  data  set  
· Splunk  sub--searches    
­ Cool  search  method  allows  doing  a  search   within  a  search  

WISHLIST  
· Prevent  reordering  JSON  raw  text  event   data  when  syntax  highlighMng  is  on  
· IntegraMon  examples  with  staMsMcal   packages  with  limits  monitoring  (i.e.  SPC)    
· Monitor  process  controls   ­ Cp,  Cpk  
· Overall  Equipment  effecMveness   ­ OEE  

19  

Summary  
NEW  CURRENT  STATE   Extensive  data  collecMons  (Test  History,  Test  Data,  Device  Data)   Departmental  /  user  access  to  data   Searchable,  reports,  dashboards   Extensible   Scalable   AnalyNcs   Time  series  based  events  of  device  history   e--record   AlerNng  
20  

    Next  Steps  
 ConMnue  to  leverage  data  to  drive  efficiencies    Lean  Six  Sigma  iniMaMves  data  driven    Record  board  level  test  data    Expand  into  unique  data  generaMng  devices  that  improve  
manufacturing  processes    ConMnue  training  others  in  the  company  to  use  Splunk    Champion  Splunk  for  other  internal  use  cases    
21  

SupporMng  Cast  
· Test  Engineers   · Zebra  IT  
· Zebra  Sponsors  
­ CFO,  CIO,  VP,  Directors  
· Splunk   · Many  others  along  the  
journey  
22  

THANK  YOU  

