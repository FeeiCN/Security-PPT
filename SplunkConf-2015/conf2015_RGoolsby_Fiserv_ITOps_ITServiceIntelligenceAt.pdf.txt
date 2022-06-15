Copyright  ©  2015  Splunk  Inc.  
IT  Service  Intelligence   At  Fiserv  
Robert  Goolsby  
Dir,  OperaAons  Enablement,  Fiserv  

Disclaimer  
During  the  course  of  this  presentaAon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauAon  you  that  such  statements  reflect  our   current  expectaAons  and  esAmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaAon  are  being  made  as  of  the  Ame  and  date  of  its  live   presentaAon.  If  reviewed  aQer  its  live  presentaAon,  this  presentaAon  may  not  contain  current  or   accurate  informaAon.  We  do  not  assume  any  obligaAon  to  update  any  forward  looking  statements  we  
may  make.     In  addiAon,  any  informaAon  about  our  roadmap  outlines  our  general  product  direcAon  and  is  subject  to   change  at  any  Ame  without  noAce.  It  is  for  informaAonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaAon  either  to  develop  the  features  
or  funcAonality  described  or  to  include  any  such  feature  or  funcAonality  in  a  future  release.   Referenced  customers  for  ITSI  product  parAcipated  in  a  limited  release  soQware  program  that  included  
items  at  no  charge.  
2  

Agenda  
Who  is  Fiserv?   Fiserv's  Monitoring  Opportunity   What  is  IT  Service  Intelligence?   IT  Service  Intelligence  OpportuniAes   IT  Service  Intelligence  Challenges  
3  

 Financial  Services  technology  provider:  
­ Core  Account  Processing,  Electronic  Billing,  Card  Based  TransacAons,  Online  Banking,  Mobile   Banking,  Check  Processing,  Lending  SoluAons,  Risk  Management  soluAons,  Person  to  Person   Payments,  etc...  
 More  than  1  in  3  U.S.  financial  insAtuAons  rely  on  Fiserv  for  core  processing  services      More  than  $1  trillion  moves  through  Fiserv  soluAons  annually      Fiserv  supports:    
­ 145  Million  deposit  accounts     ­ 21  Million  debit  accounts     ­ 75  Million  online  banking  end  users     ­ 14  Million  mobile  banking  end  users     ­ Nearly  25  million  acAve  bill  payment  end  users     ­ More  than  180  patents  issued  and  pending  for  innovaAve  financial  services  technology  soluAons    
 If  you're  a  mobile  banking  user  or  pay  your  bills  online  ­  if  you  interact  with  a  financial   insAtuAon  at  all  ­  chances  are  you're  more  familiar  with  Fiserv  than  you  realize.  
4  

 Robert  Goolsby  ­  Director,  OperaAons  Enablement  
­ Robert.Goolsby@Fiserv.com   ­ Responsible  for  overall  Enterprise  Monitoring  strategy    
 Abrar  Fakhri  ­  Manager,  Splunk  Monitoring  
­ Abrar.Fakhri@Fiserv.com   ­ Responsible  for  Splunk  vision,  roadmap,  planning  &  roll--out  
5  

Our  Opportunity  

Monitoring  Improvement  IniAaAve  
 Inconsistent  monitoring  approach  for  a   parAcular  applicaAon  
 Many  different  log  files,  locaAons  and  logging   formats  across  many  different  servers   spanning  mulAple  Aers  of  infrastructure  
 Triage  required  specific  applicaAon   knowledge    
 Too  many  tools  ­  trigger  event  or  condiAon  is   "visible"  but  support  teams  are  looking  in  the   wrong  place  
  
SoluAon  ­  deploy  Splunk  to  collect  and   process  data  that  can  feed  into  exisAng   incident  management  process.  
7  

Splunk  Dashboarding  Challenges  
 The  trigger  event  is  in  the  logs  is  there  but  no  one  is  aware  unAl  a#er  client  is   impacted  
 How  can  we  quickly  react  to  changing  environment  condiAons  to  alert  and   prevent  reoccurring  events?  
 How  do  we  perform  conAnual  educaAon  across  business  units,  across  support   Aers  and  across  shiQs  on  the  latest  dashboards  that  looks  for  specific  client   impacAng  condiAons?  
 How  do  we  approach  creaAng  dashboards  for  a  variety  of  applicaAons,   infrastructure  teams  and  generate  FI  specific  views  and  not  suffer  from  analysis   paralysis?  
 ...and  a  90  day  deliverable  date  from  incepAon  to  delivery.     
8  

What  is  IT  Service   Intelligence?  

Splunk  IT  Service  Intelligence  

 ITSI  is  a  Splunk  premium  soluAon  that  enables  us  to  model  our  business  services  and  measure  them   against  defined  service  levels    
 Splunk  ITSI  monitors  service  health,  enable  alerAng,  assist  in  triage  and  ulAmately  root  cause  analysis  

  

  

DYNAMIC   SERVICE  
MODELS  

AT--A--GLANCE   PROBLEM  
ANALYSIS  

EARLY   WARNING  ON   DEVIATIONS  

SIMPLIFY     INCIDENT  
WORKFLOWS  

SPLUNK  IT  SERVICE  INTELLIGENCE  

Time--series  Index  

Planorm  for  Machine  Data  

Schema--on--read  

Data  Model  
10  

Common  InformaAon  Model  

Splunk  IT  Service  Intelligence  At  Fiserv  

Server--based  to   Services--based  
monitoring  

200+  services  and   1500+  KPIs   monitored  

AlerKng  on  service   KPI's  instead  of  
server  performance  

Top--down  and  deep-- dive  service  insights  

Flexible  creaAon  and   modificaAon  of   services  and  KPIs  

11  

Real--Ame,  holisAc   and  proacAve   "client"  view    

ConfiguraAon  and  Planning  Tips  
Prior to any technical work in Splunk or IT Service Intelligence
· Understand expectations · Plan your service hierarchy · Standards - define services & KPIs · Understand how your users plan on interacting with IT Service
Intelligence · End User Training Plan
12  

IT  Service  Intelligence  Key  Concepts  
Service  ­  a  component  of  the  system  that  key  to  business  success.   It  can  be:  
­ An  applicaAon  or  group  of  applicaAons;   ­ An  infrastructure  Aer  (such  as  web,  database,  or  network  Aer);   ­ A  business  service,  such  as  an  online  marketplace,  which  might  include  mulAple  
infrastructure  components  (web  servers,  databases,  business  applicaAons,  load   balancers,  and  so  on);   ­ A  single  process,  such  as  one  instance  of  an  applicaAon  running  on  a  host.   ­ Really  anything  that  you  define  
A  Service  usually  contains  EnAAes  or  is  dependent  on  other  Sub--Services  
13  

IT  Service  Intelligence  Key  Concepts  
EnAty  
­ EnAty  is  an  IT  component  that  requires  management  in  order  to  deliver  an  service   ­ Each  enAty  has  specific  arributes  and  relaAonships  to  other  IT  processes  that  uniquely  
idenAfy  it   ­ Examples:  
ê Server  or  Host   ê URI   ê Processes   ê SoQware  ApplicaAon  
KPI  
­ KPI  (or  Key  Performance  Indicator)  is  a  metric  that  defines  the  expectable  behavior  of  a   service  and  the  threshold  by  which  we  may  learn  of  problems  with  the  service  
­ Splunk  assigns  a  Service  Health  Score  (scale  0  to  100)  to  each  Service  based  on  KPIs  
14  

IT  Service  Intelligence   Process  Flow  
15  

ITSI  Service  Hierarchy  
ApplicaAon  1     (Top  Level  Service)    

Client  Centric   (Sub  Service  1)  

Database     Query  

SyntheAc     Monitor  Data  

ApplicaAon     Log  

Web  Tier   (Sub  Service)  

System  Centric   (Sub  Service  2)  
AppTier   (Sub  Service)  

DB  Tier   (Sub  Service)  

Disk  

CPU  

16  

Memory  

Service  CreaAon  
Services  can  be  created   · Manually   · CSV  File   · Modular  input  
17  

Service  Info  
· We  primarily  used   host  names  or  URLs   for  enAAes  
· Plan  your  enAAes   ahead  of  Ame!    
· AQer  saving  you  are   taken  to  KPIs   config...  
18  

Sevng  Thresholds  
23  

WeighAng  
24  

Service    Analyzer    

26  

Building a Glass Table
27  

Drill Down
28  

ITSI  OpportuniAes                       ...and  challenges  

ITSI  OpportuniAes  

Speed  

we  were  able  to  deliver  service  based  monitoring  in  a  much   shorter  Ame  frame  

Empower   Users  

Able  to  empower  a  Aer  1  user  with  a  tool  kit  to  triage  and  act   as  a  higher  Aer  

Agility  

Develop  model  out  of  a  problem  review  to  add  new  KPIs  to   roll  into  the  service  as  a  hole  

Triage  

Ability  to  easily  correlate  issues  through  a  drill  down  and   determine  cause  vs  effect  and  then  dive  right  into  the  logs  

30  

Challenges  
 Manual  effort  --  100+  services  and  200+  KPIs  (and  growing!)      Standards  --  Define  default  KPIs/Metrics  ahead  of  Ame  and  develop  
standards...  if  not  rework  will  be  required    Search  Head  &  Indexer  Sizing  ­  each  KPI  and  service  increases  the  
load  on  the  system    Training  and  OperaAonal  AcAviAes  ­  new  tool  requires  training  and  
ongoing  educaAon  for  the  staff       
31  

THANK  YOU  

