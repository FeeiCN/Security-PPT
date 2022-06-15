Copyright  ©  2015  Splunk  Inc.  
Splunk  IT  Service   Intelligence  at   Vodafone  
Oliver  Hoppe  
Architect,  Vodafone  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  aQer  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.     In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.   Referenced  customers  for  ITSI  product  parFcipated  in  a  limited  release  soQware  program  that  included  
items  at  no  charge.  
2  

MoFvaFon  
"Without  data  you're  just  another     person  with  an  opinion."  
W.  Edwards  Deming   Michael  Connor  /  The  Coca--Cola  Company  @  Splunk  .conf  2014    
3  

About  Vodafone  
 World's  second  largest   TelecommunicaFons  company  
 Provides  voice,  messaging,  data  and   fixed  communicaFons  
 Operates  in  30  countries  and  partners   with  networks  in  over  25  more  
 >400  Million  mobile  customers  and     12  million  broadband  customers  
4  

About  Me  

· Oliver  Hoppe,  SoluFon  Architect  &  

  

IntegraFon  Designer  

  

· Involved  with  any  kind  of  OperaFonal  

AnalyFcs  at  Vodafone  

· Splunk  champion  &  past  user  

· Big  Data  ambassador  &  pioneer  

Goals  
· Respect  &  trust  your  data   · Make  your  data  accessible   · Create  comparable  data   · Present  your  findings   · Improve  your  Service  
6  

Agenda  
· Service  DescripFon  &  IniFal  CondiFon   · Before  Splunk  IT  Service  Intelligence   · Splunk  IT  Service  Intelligence  at  Vodafone   · Summary   · Vodafone  Roadmap  
7  

Service  DescripFon  &  IniFal  CondiFon  
Complexity  vs.  Visibility  

Complexity    7  Oracle  FMW  Components    Oracle  RAC    Infrastructure    Enabler  Services  
Visibility    Infrastructure  Monitoring    Network  Monitoring    ApplicaFon  Monitoring  

· No  end--to--end   service  view  
· Missing  incident   prevenFon  
· Lost  in  Fckets  

  

8  

Before  Splunk  IT  Service  Intelligence  
Alert  FaFgue  
 IT  OperaFons  team  lacked  visibility   into  health  and  performance  of  the   service  
 No  reliable  service  performance  and   availability  reports  for  management  
 Monitoring  SoluFons  generated   thousands  of  remedy  Fckets   PrioriFzaFon  difficulFes   Affected  performance  of  the  service  
9  

Splunk  IT  Service  Intelligence  at  Vodafone  

Service  selecFon  &  target  definiFon  

 Workforce  IdenFty  &  Access   Management  Service  selected     for  ITSI  
 Collected  ~50  KPIs  from  all   Stakeholders  to  be  implemented  
 ClarificaFon  of  data   requirements  à  majority  of     data  available  

Target  Service   KPI  DefiniFon   Data  Requirements   Data  Onboarding   Ready  for  ITSI  Rollout  

10  

Splunk  IT  Service  Intelligence  at  Vodafone  
Overview  

 AutomaFc  Event  ConsolidaFon    Build  Service  dependencies    Service  Analyzer    KPI  presentaFon  using  deep  
dives  and  glass  tables    MulF--KPI  AlerFng  

"Splunk  IT  Service  Intelligence   (ITSI)  is  a  highly  scalable  IT   monitoring  and  analyFcs   soluFon  that  provides  deep,   acFonable  insight  into  the   performance  and  behavior   of  your  IT  services."  

11  

Splunk  IT  Service  Intelligence  at  Vodafone  
AutomaFc  event  consolidaFon  
 Defining  new  KPIs  
Based  either  on  a  data  model  or   an  ad--hoc  search   Importance,  CalculaFon  method   and  search  schedule   Threshold  and  severity  
 KPIs  are  automaFcally   scheduled  for  summarizaFon  

Splunk  IT  Service  Intelligence  at  Vodafone  
Service  Dependencies  
Each  Service  can  depend  on   other  Services    A  dependency  can  be  the   overall  healthscore  or  a  set  of   different  KPIs    Service  healthscore  is   influenced  by  dependencies  
13  

Splunk  IT  Service  Intelligence  at  Vodafone  
Service  Analyzer    Direct  Service  Overview    Services  Health  Score  Trends    KPI  Trends    Drill  down  to  Deep  Dive    Top  Notable  Events  
14  

Splunk  IT  Service  Intelligence  at  Vodafone  
Deep  Dive  
15  

Splunk  IT  Service  Intelligence  at  Vodafone  
Glass  Table  
16  

Splunk  IT  Service  Intelligence  at  Vodafone  
MulF--KPI  AlerFng   CorrelaFon  of  mulFple   violated  KPIs        Drill  down  into  Deep   Dives    Create  a  Service  Now   Ticket  
17  

Conclusion  

 Time--to--Market  in  2  days    Reduced  MTTR    Real--Fme  session  visibility    AcFonable  insights  in  hours  not  days    Increased  audience    Custom  KPIs  empower  teams  

"Building  KPIs  was     very,  very  easy!"  

*MTTR  =  Mean  Time  To  Recover   18  

Vodafone  Roadmap  
 Extension  of  KPIs  for  the  exisFng  IntegraFons    Roll  out  more  services  already  in  the  queue    Splunk  ITSI  as  default  scope  element  for  any  new  Service  rollout    StandardizaFon  of  data  collecFon  for  performance  KPIs    Add  capacity  management  capability    Extend  Splunk  ITSI  audience  to  Management,  Business,  and  Security  
19  

QuesFons!  

THANK  YOU  

Keep  On  To  Improve  
"It  is  not  enough  to  do  your  best;  you  must   know  what  to  do,  and  then  do  your  best."  
W.  Edwards  Deming    
22  

