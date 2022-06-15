Copyright  ©  2015  Splunk  Inc.  
Save  Energy  with  Splunk  
Leverage  Process  and  Energy  Data   to  OpImize  Industrial  Processes  
Philipp  Drieger  
Sales  Engineer,  Splunk  
MaBhias  Ilgen  
Project  Manager,  Robotron  

Disclaimer  
During  the  course  of  this  presentaIon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauIon  you  that  such  statements  reflect  our   current  expectaIons  and  esImates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaIon  are  being  made  as  of  the  Ime  and  date  of  its  live   presentaIon.  If  reviewed  aUer  its  live  presentaIon,  this  presentaIon  may  not  contain  current  or   accurate  informaIon.  We  do  not  assume  any  obligaIon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiIon,  any  informaIon  about  our  roadmap  outlines  our  general  product  direcIon  and  is  subject  to   change  at  any  Ime  without  noIce.  It  is  for  informaIonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaIon  either  to  develop  the  features  
or  funcIonality  described  or  to  include  any  such  feature  or  funcIonality  in  a  future  release.  
2  

Your  3  Key  Take  Aways  

COLLECT  
   heterogeneous  sensor  data   from  industrial  processes  in  
one  data  pla[orm  

ENRICH  
   and  correlate  sensor  data   with  addiIonal  data  sources   to  create  meaningful  context  

ANALYZE  
   various  data  sources  to   opImize  processes  and  
increase  efficiency  

3  

About  us  

Philipp  Drieger  (Splunk)  
· Sales  Engineer  at  Splunk     
· Background  in  data  visualizaIon,   analyIcs  and  3D  soUware   development  
· Experience  in  various  industry   verIcals  such  as  automoIve,   transportaIon  and  soUware   industries.  
· Proven  fast  Ime  to  value  with  Splunk   winning  Deutsche  Bahn  hackathon  

MaBhias  Ilgen  (Robotron)  
· Project  manager  and  pre--sales   engineer  for  business  analyIcs  
· Background  in  the  area  of   informaIon  retrieval,  text  --  and  data   mining  
· Experience  in  various  industry   verIcals  such  as  life--science   healthcare,  manufacturing  and   automoIve.  
· ImplementaIon  of  complex  IoT   soluIons  based  on  Splunk  

4  

Facts  about  Robotron  
· Methodical  and  technological  responsibility   · Comprehensive  experIse  of  industry--specific  business  processes   · Number  of  employees  (Robotron  group):  450  

Agenda  
Splunk  as  a  data  pla[orm  for  industrial  sensor  data    Bridging  the  gap:  Combine  energy  and  process  data    Use  Case  #1:  Energy  efficiency  monitoring  and  opImizaIon    Use  Case  #2:  CondiIon  monitoring  and  predicIve  maintenance    Conclusion  &  Outlook    Q&A  
6  

Splunk  as  pla[orm  for   industrial  and  IoT  data  
  

Splunk  a  World  of  Interconnected  Assets  

Transporta5on  |  Energy  |  U5li5es  |  Building  Management  
Oil  and  Gas  |  Manufacturing  
Sensors,  Pumps,  GPS,  Valves,  Vats,  Conveyors,   Pipelines,  Drills,  Transformers,  RTUs,  PLCs,   HMIs,  LighIng,  HVAC,  Traffic     Management,  Turbines,   Windmills,  Generators,   Fuel  Cells,   UPS  

Retail  |  Home  |  Consumer  
Telemedicine  |  Connected  Cars  
Wearables,  Home  Appliances,  Consumer   Electronics,  Gaming  Systems,  Personal  
Security,  Set--Top  Boxes,  Vending   Machines,  Mobile  Point  of   Sale,  ATMs,   Personal  Vehicles  

Industrial  Data  
8  

Internet  of  Things  

Splunk  for  360  degree  data  view  

   Technical  
Users  

   Business  
Users    

   Data     Analysts    
9  

   Security  
Analysts    

Typical  Workflow  for  Analyzing  Sensor  Data  

COLLECT  

ENRICH  

ANALYZE  

middle  ware   sensor  data  

feedback  loop   data  analyIcs  
lookup  data  

10  

3  Common  Ways  to  Analyze  Sensor  Data  with  Splunk  

SPL  
   use  out  of  the  box  SPL   search  commands  to  
analyze  your  data           

APPS  
   leverage  Splunk  Apps  to  
quickly  onboard  data   and  gain  insights           
hBps://splunkbase.splunk.com/    

SCRIPT  
   create  scripts  or  code  with  
SDKs  for  advanced  and   customized  soluIons  
        

11  

Cheat  sheet:  Splunk  Commands  for  AnalyIcs  

Splunk  command  
(stream)stats   (Ime)chart   anomalies  /  outlier   cluster  /  kmeans   associate  /  arules   autoregress   correlate   conIngency  
predict  

What  can  I  achieve  with  it?  
calculate  various  staIsIcs   chart  (Ime--series)  events  for  viz   detect  unusual  /  outlier  events   cluster  events  based  on  similarity  /  given  cluster  #   idenIfy  correlaIons  /  relaIonships  between  fields   calc  autoregression  (for  moving  average)  
co--occurance  between  fields   calc  relaIonship  between  variables  
predicIon  for  Ime--series  data  

Find  out  more:  hBp://docs.splunk.com/DocumentaIon/Splunk/latest/SearchReference    

12  

Energy  Data  &   Process  Data  

Challenge:  OpImize  Energy  Efficiency  
process  data   contains  informaIon  about   operaIonal  state  of  equipment  
bridge  the  gap!  
(energy  meters)   =  energy  consumpIon  
14  

What  is...  

Category  

Energy  Data  

Process  Data  

Time  

Equidistant  Ime  series  

Process  event  based  

Type  

Sensor  data  

Control  data,  sensor  data  

SemanIcs  

Energy  metrics  

Equipment  behavior  

Source   Energy  logger,  Equipment,  EDM   SPS,  SCADA,  HMI,  ...  

Format  

Variety  of  formats  

Variety  of  formats  

15  

Energy  Data  
Energy  consumpIon  
86348;24.03.15  23:59:59;  140808,297;   140746,031;140919,500;  

Process  Data  
ProducIon  status  
24--03--2015  01:00:59;EPIP02--03--A;SB;PPR;PR;   PRODUCTION;PR;aRTC:  accounted  transacIon   (equip02_evnt_job_unit01);;;;;;;0,014;753,000  

correlaIon  over  Ime  (join)  
Use  cases     
--  Transparency  of  equipment  on  shop  floor  level   --  Discover  process  weaknesses   --  CondiIon  based  and  predicIve  maintenance   --  OpImizaIon  of  energy  efficiency  of  equipment   --  OpImizaIon  of  energy  purchasing  process  (forecast  /  predicIve)   ...  etc  ....     
16  

Increased  efficiency   Saved  energy   Saved  $$$  

Energy  Efficiency   Monitoring  &  
OpImizaIon    

EEE  Monitoring  &  OpImizaIon  
CorrelaIng  energy  and  process  data  
Energy  data  
Process  data  
18  

Energy  Efficiency  Monitoring  
 OpImizaIon  of  energy  efficiency  for  producIon    ReducIon  of  energy  consumpIon  of  non--value--adding  acIviIes    OpImizaIon  of  producIon  schedule  of  similar  equipment    ReducIon  of  specific  energy  consumpIon  per  produced  item  
(value--added  energy  consumpIon)               Energy  Efficiency  of  Equipment  (EEE)  =          
(total  energy  consumpIon)    

Energy  Efficiency  of  Equipment  (EEE)  
High  Level  Overview:  Finding  efficiency  issues  at  a  glance  
20  

EEE  Monitoring  &  OpImizaIon  
Detect  process  weaknesses:  idenIfying  anomalous  paBerns  

Anomaly?  
21  

Energy  consumed   but  no  process  data  

EEE  Monitoring  &  OpImizaIon  
Detect  process  weaknesses:  opImize  stand--by  Imes  
Energy  consumed   on  Sunday?  
22  

EEE  Monitoring  &  OpImizaIon  
Energy  consumpIon  over  Ime:  benchmark  different  equipment  of  same  type  
Visual  correlaIon:   Detect  differences!  
23  

EEE  Monitoring  &  OpImizaIon  
Further  use  cases:  "findings  by  accident"  
Find  data  quality  issues:   reported  false  process  status  
24  

Depending  on  local   energy  prices  savings   of  2.5M  EUR  are   projected  p.a.   per  assembly  line  

Energy  Savings  

Up  to  25%  per  facility   10%  

Energy   consumpIon  
before   opImizaIon  

25%  save  
Lower  energy   consumpIon  

Repeatable   opImizaIon   process  for   similar  plants  
Energy  saved   Consumed  

25  

CondiIon   Monitoring  &  
PredicIve   Maintenance  

Energy  and  process  data  for  maintenance  

 Energy  not  just  a  opImizaIon  target  ­  but  also  an  influencing  factor   for  maintenance  scenarios  (rapid  impact  factor)  
 Map  low  level  process  status  to  parIcular  energy  consumpIon   profiles  and  learn  normal  states  and  boundaries  from  raw  signal  

A  

B  

C  

D  

CondiIon  Monitoring  &  AlerIng  
Anomaly  detecIon  and  proacIve  monitoring  
28  

PredicIve  Maintenance  
Predict  anomalies  for  a  parIcular  process  step  

Predict  process  steps   In  which  an  error  might     happen    

ExtrapolaIon  of  process   steps  with  integrated     predict  funcIon  or     other  regressions  models  

Heatmap  shows     (recommend)  Ime  span   in  which  an  error  might     happen  

29  

Outcome  and   Outlook  

Summary  &  Outlook  
 Generic  and  equipment--independent  approach      No  data  transformaIon  and  model  mapping  in  advance    Applicable  for  "old"  equipment  (without  parIcular  sensor  installaIon)    Out--of--the--Box  Splunk  data  models  for  energy  and  process  data    360°  view  --  several  kinds  of  visualizaIons    Own  Splunk  commands  for  numeric  operaIons  and  machine  learning    Enhanced  Ime  series  forecasIng  for  opImizaIon  of  energy  purchasing  
31  

Robotron  Architecture  for  Industrial  Data  Analysis  

analysts  

security  

business  

technical  

explore  

connect   geomap  

model  

maintain   analyze  

Common  InformaIon  Model  for  IoT  purposes  

predict  

Robotron  Switching  Server   Raw  sensor  data  

lookup,  process  data   and  other  machine  data  
32  

data  analysis   using  SPL,  R   and  Python  

Meet  me  @   IoT  Pavillon!  
Philipp  Drieger  
Sales  Engineer,  Splunk   Munich,  Germany      philipp@splunk.com  

THANK  YOU  
MaBhias  Ilgen  
Project  Manager,  Robotron   Dresden,  Germany      maBhias.ilgen@robotron.de  

