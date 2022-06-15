Copyright  ©  2015  Splunk  Inc.  
Where  Mobile  meets     In--Store  &  Point  of  Sale:   Data  Collides  
Jon  Thies     --  CTO,  Qwasi   ScoB  Hall     --  Sr.  Technical  Manager,  NCR  

Disclaimer  
During  the  course  of  this  presentaPon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauPon  you  that  such  statements  reflect  our   current  expectaPons  and  esPmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaPon  are  being  made  as  of  the  Pme  and  date  of  its  live   presentaPon.  If  reviewed  aXer  its  live  presentaPon,  this  presentaPon  may  not  contain  current  or   accurate  informaPon.  We  do  not  assume  any  obligaPon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiPon,  any  informaPon  about  our  roadmap  outlines  our  general  product  direcPon  and  is  subject  to   change  at  any  Pme  without  noPce.  It  is  for  informaPonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaPon  either  to  develop  the  features  
or  funcPonality  described  or  to  include  any  such  feature  or  funcPonality  in  a  future  release.  
2  

Agenda  
!  Speaker  /  Company  Bios   !  Why  and  How  we  uPlize  Splunk   !  SoluPon  DescripPon   !  Technical  ExecuPon  with  Splunk   !  Demo   !  Q&A     
3  

IntroducPons  

Scott Hall
Sr. Technical Solution Manager - NCR
5  

Jon Thies
CTO - QWASI
6  

"CAN I TAKE YOUR ORDER?"
?

Alevu·enriaqApguleaUestSfEor-enrbmagalsatteegimdcehmsenooedftlnaowtgtaaayrentco-doamcsD-upaara-tasanteyeMr.vuiacnneiqa(ugSeeaamuSse)enrt

Platform that experiences.



  · QWASI aggregates all real time customer

QWASI'sevceonntssosloidbartaensdfisrsctanpacrretyatbeechoanvteioxrtaulal

Behavioral Data

data withexCpRerMienacneds oCvaemr Ppuasigh,nSAMuSto, Emmaatiol,nSocial, tools to carnedaItVeRvfisroibmilitoyneinptolaetfaocrmh.individual's journey. 

Smart Engagement

 · QWASI's scales and integrates with any

 

QWASMIoebnilaebAlepsp,bCraRnMd,sP, OaSg,eBnceaiecso,na, nNdFC, to enterparcistievastetoaldl ecutesrtmomineer eCvaemntpsafoigrnreAaltttrimibeution, ROI, acnodmmmuanniacagteiopn.re dictive protocols across



all 

touchpoints.




Attribution, Analysis & Analytics



Real Time Data
Communication Protocols

How  do  we  reach  our   customers?
!  Do  I  start  with  a  CRM?   !  Geo--targePng   !  Data  filtering   !  Real--Pme  
9  

Why  Splunk?  

Value  of  Splunk  
!  Splunk  simplifies  boring  tasks  
­ Monthly  invoicing  --  It  would  take  an  enPre  day  to  review  all  the  accounts   ­ TroubleshooPng  Customer  Issues  
!  Splunk  increases  our  ability  to  detect  system  failures  and  errors  before  our   customers  do  
!  Splunk  saved  our  bacon  
­ Our  pladorm  was  new,  our  biggest  customer  was  ready  to  leave  for  a   compePtor.    The  biggest  feature  gap  in  our  pladorm  was  reporPng.  
­ We    created  a  Splunk  App  in  two  weeks  that  addressed  every  imaginable  report   they  needed.  
11  

ApplicaPons     w/  Qwasi  SDK  

Event  Lifecycle  

NCAoupPspfitlocicamaPP  oEonvne  E n Evtvesen   nttss     

Point  of  Sale   NCR  Cloud  Connect  

Qwasi  Cloud   12  

Every  InteracPon  is  an  Event  
!  Applica'on  Events  ­  automaPc  events  generated  using  our  SDK  or  API  
­ ApplicaPon  Install/Open/Close   ­ User  RegistraPon   ­ LocaPon  ­  LocaPon  Update,  Geofence  and  Beacon  Enter/Dwell/Exit  
!  Custom  Events  ­  events  defined  by  Developers  
­ For  reporPng  and  analyPcs  purposes     ­ For  triggering  a  workflow  
!  No'fica'on  Events  ­  events  from  QWASI  to  ApplicaPon  via  SDK  or  SMS  
­ Sent   ­ Delivery  Report  :  Accepted/Delivered/Read   ­ Failed  
13  

Why  Splunk?  
Because  its  all  about  Events  
· Hundreds  of  clients     · Thousands  of  users     · Configuring  over  a  hundred  thousand  campaigns   · InteracPng  with  millions  of  subscribers     · GeneraPng  over  a  hundred  million  events  monthly    
14  

Why  Splunk?  
Because  its  all  about  events  
Distributed  event  based  pladorm  --  combinaPon  of  dedicated   servers,  cloud  instances,  and  Docker  containers.  
!  Gain  insight  of  usage  at  broad  and  granular  levels  
­ Passive  monitoring  across  data  centers  and  deployments   ­ System  Health  and  Usage  Monitoring  
!  Historical  ReporPng  and  AnalyPcs  that  will  not  impact  runPme  systems   !  Embed  a  flexible  Splunk  Dashboard  into  our  user  interface  using  SplunkJS    
15  

Every  Event  Needs  Context  
!  Events  are  always  'ed  to  a  device  and  member  profile   !  NCR's  Cloud  Connect  ­  Point  of  Sale  Integra'on  
­ Customer  Loyalty  Data  (profile)   ­ Eligible  RedempPons  and  Bonus  Offers   ­ Purchase  History  
!  Event  Triggers  ­  workflows  that  fire  as  a  result  of  a  specific  event   within  a  predefined  context.  
!  Scheduled  Triggers  ­  workflows  that  review  the  state  of  members   profile  and  event  history  and  iniPate  workflows  based  on  a  schedule  
16  

SoluPon  DescripPon  

How  the  SoluPon  UPlizes  Splunk  
Splunk  Indexes:  
  
· All  Transport  Traffic  
ê GCM,  APNs   ê SMS  SMPP/HTTP   ê MMS  MM7   ê ...  
· All  API  Traffic  
ê SDK   ê HTTP   ê Loyalty  APIs  
· Each  Event  
ê Member  ID   ê Customer  ID   ê Deployment  ID   ê Event  Data  Fields  
18  

How  the  SoluPon  UPlizes  Splunk  
· Use  of  Scheduled  Saved  Searches   · IT  and  OperaPons  Team  login  to  Splunk  Web  
for  troubleshooPng  and  support  items  daily.   · Provide  Rich  AnalyPcs  and  Insight  into  
Campaign  Performance  and  Customer   Engagement  
Ø BROWN Hot963: You're in to win tickets to see Chris Brown. Stay by the phone Reply STOP BROWN to Cancel; HELP=Help; STOP=End; Msg&Data rates may apply
19  

DemonstraPon  

Technical  ExecuPon  

The  Data  
· Events  Log  :  /vol/aim_events.log     As  each  event  occurs  in  the   pladorm  its  wriBen  out  to  a  log   file  as  JSON.  
· Members  Data  ­  contained  in   MongoDB  for  each  deployment.      
  
22  

Member  Lookup  Table  
· AutomaPc  Lookup  on  source   · Saved  Search  
­ Extracts  Hosts   ­ Saves  to  CSV   ­ Executes  Shell  Script  
· Shell  Script  
­ Loads  CSV  of  Hosts   ­ Calls  Web  Service  on  each  Host   ­ Populates  Lookup  Table  
23  

Member  Lookup  Table  
· Adds  EnPre  Member  Profile  to   each  event  as  fields  
· Saves  on  license  volume   · Lookup  tables  typically  have  
pre--defined  fields  ­  we  worked   around  that   · Lookup  table  becomes  indexed    
24  

Dynamic  Reports  Using  SplunkJS  

· Simple  Dashboard  containing  :  
­ TimeRangeView   ­ DropDownView   ­ SearchManager   ­ ChartView   ­ SplunkMapView   ­ TableView   ­ TextInputView   ­ CheckboxGroupView       
· SearchManager  
­ InteresPng  Fields  (SelecPon  1&2)   ­ Main  Search  ­  populates  ChartView   ­ Map  Search  ­  populates  MapView   ­ D3  Search  ­  populates  custom  views    

Screenshot  here  

25  

Dynamic  Reports  Using  SplunkJS  

· Customize  the  Report  
­ Labels   ­ OperaPons  
ê Count   ê Sum   ê DisPnct  Count   ê Average   ê Standard  DeviaPon   ­ Graphing  OpPons   ê Stacked  for  Bar  and  Area   ê Heat  Map  for  Table  

Screenshot  here  

26  

Dynamic  Reports  Using  SplunkJS  
· VisualizaPon  to  Choose  From  
­ Bar   ­ Sankey   ­ Line   ­ Area   ­ Pie   ­ Column   ­ ScaBer   ­ Table   ­ Map  
27  

Dynamic  Reports  Using  SplunkJS  
  
· Filters  
­ Used  for  Drill  Down   ­ Customizes  Splunk  Search  used  
28  

ConsideraPons  Using  SplunkJS  
  
· Users  ONLY  get  their  events  
ê Limits  source,  customer_id  within   Splunk  at  search  Pme  
ê Limits  concurrent  searches   ê Created  when  the  User  is  Created  via  
Splunk  Rest  API  
· Drilldown  Behavior  
ê Modifies  field  selecPon   ê Generates  new  search  string   ê Difficult  to  manage   ê Most  power  feature  
· Downloading  Events  
ê Is  this  something  we  want  to  do?  
29  

Future  Enhancements  
  
· Add  more  D3  or  HighCharts   VisualizaPons  
· Download  Search  Results   · Enabled  Real  Time  VisualizaPons  
ê This  worked,  but  it  leaked  searches  that   would  conPnue  to  run.  
· Link  from  other  Qwasi  reports  to  the   SplunkJS  and  prepopulate  the  Filters.  
30  

Summary  

Summary  

Point  of  Sale   Transac'ons  

Loyalty   Engagement  

Campaign   Automa'on  

Business   Intelligence  

Cross  Channel   Communica'ons  

Data   Management  

32  

QuesPons?  

THANK  YOU  
jon.thies@qwasi.com      scoB.hall@ncr.com  

