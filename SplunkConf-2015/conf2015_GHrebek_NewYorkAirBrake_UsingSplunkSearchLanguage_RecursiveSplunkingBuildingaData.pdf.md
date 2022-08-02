Copyright  ©  2015  Splunk  Inc.  
Recursive  Splunking      Building  a  data  Rube  Goldberg  machine  with  Splunk
Greg  Hrebek  
Director  of  Technology,     New  York  Air  Brake  

Disclaimer  
During  the  course  of  this  presentaKon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauKon  you  that  such  statements  reflect  our   current  expectaKons  and  esKmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaKon  are  being  made  as  of  the  Kme  and  date  of  its  live   presentaKon.  If  reviewed  aTer  its  live  presentaKon,  this  presentaKon  may  not  contain  current  or   accurate  informaKon.  We  do  not  assume  any  obligaKon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiKon,  any  informaKon  about  our  roadmap  outlines  our  general  product  direcKon  and  is  subject  to   change  at  any  Kme  without  noKce.  It  is  for  informaKonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaKon  either  to  develop  the  features  
or  funcKonality  described  or  to  include  any  such  feature  or  funcKonality  in  a  future  release.  
2  

Agenda  
 Who  We  Are  and  What  We  Do    The  Challenges  of  Riding  the  Rails    CreaKng  a  Single  Source  of  Truth    Recursive  Splunking    Assembling  the  Machine    Beyond  the  Obvious     
3  

Who  We  Are  and   What  We  Do  

Who  Am  I?  
 Currently  the  Director  of  Engineering  for  New  York  Air  Brake    Previous  companies  --  GE,  Invensys,  NASA,  HP    Advanced  degrees  in  Computer  SoTware  and  Systems  Engineering    Technical  experKse  in  Embedded  Systems,  Safety  CriKcal  Systems,  
Data  AnalyKcs,  Mobile,  and  Distributed  Systems    Have  held  posiKons  in  every  aspect  of  the  product  development  
lifecycle  
5  

Who  is  New  York  Air  Brake?  
 A  wholly  owned  subsidiary  of  Knorr  Bremse  
-Knorr--Bremse  is  the  world's  leading  manufacturer  of  braking  systems  for  rail  and   commercial  vehicles  
-Two  pillars  of  business  ­  rail  and  commercial  vehicles   -Privately  held  with  an  average  of  7%  of  return  into  new  product  development  
 New  York  Air  Brake  ­  serving  the  rail  industry  since  1890  
-Worldwide  leader  in  railroad  brake  and  train  control  systems  
-800  Employees  across  five  divisions  
6  

Becer  Yet,  Who  is  Train  Dynamic  Systems?  
 Worldwide  leading  industry  experts  in  train  dynamics  and  training   simulators,  a  satellite  division  of  New  York  Air  Brake  
 Responsible  for  R&D  and  NPD  for  New  York  Air  Brake    150  Employees    Premier  product  is  LEADER®,  an  energy  management  control  system  
7  

The  Challenges  of   Riding  the  Rails  

How  a  Train  Works  
 Diesel  Electric  Motors  
-Diesel  powered  generators  create  electricity  that  is  then  sent  to  large  electric   tracKon  motors.    These  motors,  when  put  in  reverse,  will  create  "dynamic  braking"  
 Airbrakes  
-An  air  hose  runs  down  the  length  of  the  train  charged  to  90  psi.  If  the  air  is  let  out,   the  brakes  apply  at  each  car  
 In--Train  Forces  
-There  are  about  8--12  inches  of  slack  between  each  knuckle  (the  part  that  connects   the  train  cars  together),  this  equates  to  about  300--400  feet  of  slack  in  the  whole   train  
 Controlling  Momentum  
-Driving  a  train  is  like  controlling  a  giant  slinky  
9  

LEADER®  Driving  Strategy  Engine  
On  board  the  LocomoKve   · Collects  sensor  data  from  the  
tracKon  control  system,  brake   system,  and  posiKoning  system   · Provides  informaKon  to  the   locomoKve  engineer  that  he   typically  would  have  to  feel  out.   · LEADER®  logs  all  the  inputs/outputs   for  post  run  analysis     · LEADER®  adapKvely  tunes  its   strategy  based  on  local  condiKons  
10  

Train  Systems  
· LocomoKve  Systems  
­ Air  Compressors   ­ TracKon  Motors   ­ Diesel  Generators   ­ Brake  Systems   ­ CompuKng  Planorms  
· Car  Systems  
­ Brake  Shoes   ­ Brake  Valves   ­ Bearings   ­ DraT  Gears  
11  

Wayside  Systems  
· Signaling  &  Crossings  
­ Crossing  arms   ­ Rail  switches   ­ Weigh--in--moKon  scales  
· DetecKon  
­ Track  circuits   ­ AEI  Tag  readers   ­ Hot/cold  wheels   ­ Dragging  equipment   ­ Track  fouling   ­ Wheel  detectors  
12  

Back  Office  Systems  
· Dispatching  
­ Movement  planning   ­ Speed  restricKons   ­ Consist  data   ­ Interoperability  
· Metrics  
­ Network  velocity   ­ Trip  planning   ­ Asset  exchanges   ­ Commodity  planning  
13  

The  Tower  of  Babel  
 Assets  &  devices  range  from  new  to  40  years  old  
- Average  asset  life  of  20+  years,  leaving  assets  as  old  as  40  years  in  acKve  use  
 Everything  speaks  a  different  language  
- A  plethora  of  protocols  exist,  few  are  open  source  or  based  on  industrial   standards,  majority  are  proprietary  and  closed  source  
 No  unifying  body  to  drive  standardizaKon  
- Even  the  same  manufacturer  has  several  different  protocols  for  acKve  units  
 No  centralized  aggregaKon  
- Assets  are  digitally  isolated  and  scacered  (on  board,  wayside,  back  office)   - Large  areas  of  migraKon  as  assets  move  not  only  within  networks  but  across   - Limited  connecKvity  between  assets  and  between  assets  and  a  back  end  
 Mix  between  machine  data  and  calculated  data  
- Data  from  assets  and  data  from  models  &  calculaKons  
14  

CreaKng  a  Single   Source  of  Truth  

The  Rube  Goldberg  Approach  
· Collect  and  aggregate  the  data   · Normalize  the  data  in  the  Kme  domain   · Do  something  interesKng  with  the  
data,  aka:  Feature  Engineering   · Present  a  unified  and  holisKc  view  of  
informaKon  and  acKons     (that  hopefully  people  will  pay  for)  
16  

AggregaKng  &  Normalizing  the  Data  
Bringing  it  all  together:  Analysis  
 AggregaKon  schema  
-Index:  customer  (UP,  NS,  CSX,  etc.)   -Host:  asset  Id  (Loco  Id,  etc.)   -Source  Type:  Asset  Type  (ER,  TPA,  
10th  Track,  DynOut,  LEADER  Logs,   Sensor  Data,  etc.)  
 Field  mapping  &  aliasing     
 Data  transform  
-Preprocess  data  inputs  using   dynamic  data  from  Splunk  to   do  so  
17  

Recursive  Splunking  

Train  Dynamics   Models  

SPLUNK  Based   AnalyKcs  

Big  Picture  View  

External   AnalyKcs  
19  

Predikto  

Extending  the  Splunk  Query  Language  
 FuncKons  specific  to  our  analyKcal  needs  did  not  exist  
-Finite  impulse  response  filters   -MulK--variable  regressions   -Fast  fourier  transforms   -MulK--objecKve  parametric  opKmizaKon  
-Call  external  dynamics  models  
 Used  Python  to  perform  these  analysis  in  Splunk  
-With  many  high  level  analyKcal  libraries,  Python  was  perfect  match   -Allowed  for  data  management,  organizaKon,  normalizaKon  in  Splunk   -Seamless  interface  to  analyKcal  algorithms  that  were  already  developed   -Very  well  documented  in  docs.splunk.com  
    
20  

Extending  the  Splunk  Query  Language  
Intersplunk  
-hcp://docs.splunk.com/DocumentaKon/Splunk/6.2.4/AdvancedDev/ SearchScripts#Build_your_search_command_in_Python  
-API  For  accessing  results  from  the  search  pipeline  in  Python   -Example:  
     
commands.conf  
-hcp://docs.splunk.com/DocumentaKon/Splunk/6.2.4/Admin/Commandsconf   -$SPLUNK_HOME/etc/apps/<app_name>/local/commands.conf   -File  is  used  to  tell  Splunk  what  scripts  are  available  for  the  specific  app   -Add  a  reference  in  the  file  to  your  script   -Script  should  be  in  $SPLUNK_HOME/etc/searchscripts/  
21  

UKlizing  Data  Models  ­  External  Process  Calls  
Use  Python  to  manage  data  distribuKon  wrap  calls  to  external  programs  
22  

Assembling  the   Machine  

Splunk  as  a  Data  Science  Planorm  
· Business  intelligence  
- Domain  experKse  to  answer  quesKons   - ParKcular  approaches  to  parKcular  problems   - Splunk  alerts  and  search  query  drill  downs  
· StaKsKcs  
- The  raw  math  and  tradiKonal  analysis   - Models  and  hysteresis   - IntegraKon  by  extending  Splunk  query  language  and  
external  processes    
· Data(base)  management  
- Data  munging  and  storage   - Parsing,  aggregaKng,  and  forma|ng  data   - Splunk  field  maps,  aliases,  scripted  inputs,  etc.  
· VisualizaKons  
- Dashboards  and  reporKng   - BI  Tool  integraKon  
· Machine  Learning  
- PredicKve  and  prescripKve  analyKcs   - Predikto  
24  

So  Why  Did  We  Build  This?  

· Fuel  analysis   ­ Technology  Impact   ­ Environmental  vs.  behavioral  impact   ­ Trending  &  predicKve  usage  
  
· Train  performance  analysis   ­ TracKve  effort  efficiency   ­ Braking  efficiency  and  effecKveness   ­ Rolling  resistance   ­ Environment  impacts  (wind,  temperature,  etc.)   ­ Un--desirable  emergency  opportunity  warning  system  

· PredicKve/prescripKve  maintenance   ­ LocomoKve  health   ­ Track  health   ­ Brake  shoe  wear  

    

· Metrics  and  reporKng  

­ Real--Kme  alerts  

­ Network  velocity  

­ Asset  uKlizaKon  

­ Playback  

    

  

· Driving  strategy  tuning  &  analysis   ­ Behavioral  analysis     ­ Hyperlocal  opKmizaKons  

25  

Beyond  the  Obvious  

SPLUNK>  as  a  Planorm  
Internet  of  Things  and  More!    It  is  more  than  just  for  servers  and  their  logs,  it  is  for  building  
dynamic  data  relaKonships  regardless  of  when  and  where  the  data   comes  from!    Build,  discover,  and  visualize  correlaKons  between  the  things  that   macer  to  your  product  or  business    Focus  on  finding  answers  
27  

Want  More?  
 Recommended  Sessions  
- Building  Powerful  AnalyKcs  with  Ease  |  Tuesday,  September  22,  2015  |  Breakout  5   - Deeper  insights  into  Water  Treatment  Through  Splunk  |  Tuesday,  September  22,  2015  |  Breakout  6   - How  Splunk  Uses  the  Splunk  Add--on  for  JIRA  |  Tuesday,  September  22,  2015  |  Breakout  5   - RoboKcs  AnalyKcs  at  Target:  UKlizing  Machine  Data  from  Robots  to  Provide  Data--driven  Insights  and  Decisions  |  Tuesday,  
September  22,  2015  |  Breakout  4   - Splunk  as  a  Planorm  for  OperaKonal  Intelligence  for  SCADA  and  Other  Industrial  Systems  |  Tuesday,  September  22,  2015  |  
Breakout  1   - Enhancing  Dashboards  with  JavaScript!  |  Wednesday,  September  23,  2015  |  Breakout  9   - Know  Your  Data,  Know  Your  Audience  |  Wednesday,  September  23,  2015  |  Breakout  12   - Machine  Learning  and  AnalyKcs  in  Splunk  Wednesday  |  September  23,  2015  |  Breakout  11   - Of  Babe  Ruth  and  Spider  Man:  How  Baseball  and  Comics  Can  Teach  You  the  Search  Language  |  Wednesday,  September  23,  
2015  |  Breakout  9   - The  Internet  of  Things...PredicKng  the  Unpredictable  |  Wednesday,  September  23,  2015  |  Breakout  14   - Unraveling  AnalyKcs  and  Data  Science:  An  Expert  Panel  |  Wednesday,  September  23,  2015  |  Breakout  13  
 Contact  Info  
- Greg.Hrebek@nyab.com   - hcp://www.splunk.com/view/SP--CAAAKZS   - hcp://www.splunk.com/view/splunk--at--new--york--air--brake/SP--CAAAMBV  
28  

THANK  YOU  

