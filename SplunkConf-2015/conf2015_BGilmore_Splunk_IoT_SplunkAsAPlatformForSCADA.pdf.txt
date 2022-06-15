Copyright  ©  2015  Splunk  Inc.  
Splunk  as  a  PlaForm  for   Opera=onal  Intelligence   In  SCADA  and  other     Industrial  Systems  
Brian  Gilmore  
Solu=on  Expert,  IoT  and  Industrial  Data   Splunk  

Disclaimer  
During  the  course  of  this  presenta=on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau=on  you  that  such  statements  reflect  our   current  expecta=ons  and  es=mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta=on  are  being  made  as  of  the  =me  and  date  of  its  live   presenta=on.  If  reviewed  aSer  its  live  presenta=on,  this  presenta=on  may  not  contain  current  or   accurate  informa=on.  We  do  not  assume  any  obliga=on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi=on,  any  informa=on  about  our  roadmap  outlines  our  general  product  direc=on  and  is  subject  to   change  at  any  =me  without  no=ce.  It  is  for  informa=onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga=on  either  to  develop  the  features  
or  func=onality  described  or  to  include  any  such  feature  or  func=onality  in  a  future  release.  
2  

Big  Data  Comes  From  Machines  ...  
Volume    |    Velocity    |    Variety    |    Variability  
GPS,   RFID,   Hypervisor,   Web  Servers,   Email,  Messaging,   Clickstreams,  Mobile,     Telephony,  IVR,  Databases,   Sensors,  TelemaCcs,  Storage,   Servers,  Security  Devices,  Desktops    
3  

...  Including  From  Opera=onal  Technology  (OT)  
Volume    |    Velocity    |    Variety    |    Variability  
Sensors,  Pumps,     GPS,  Valves,  Vats,   Conveyors,  Pipelines,  Drills,     Transformers,  RTUs,  PLCs,  HMIs,   LighCng,  HVAC,  Traffic  Management,   Turbines,  Windmills,  Generators,  Fuel  Cells,  UPS      
4  

Data  CollecCon  &   AnalyCcs  
Batch  Oriented/   Rear--View  Approach  

Challenges  
Ad  hoc  Analysis     of  OT  Data  
CHALLENGES  
Security  and  Privacy    

Correlate  Data  Across   ApplicaCon/
Infrastructure  Silos  
IT/OT  Convergence  

OT  Overview  
6  

HMIs  

Enterprise  Network  

Serial  Network   Gateway  
Local  Control  Network  (IP  or  Ethernet)  

Client  Apps  

EDW  

More  Client   Apps  

Historian  

Other  Business   Applica=ons  

Communica=on  and  Integra=on  via:  

OPC  (Kepware)  

Proprietary  (Kepware,  TBR  Add--ons)  

PLCs  

DCS  or  SCADA  

CMMS  and  Other  OT   MQTT,  JMS,  DBConnect  

Systems  

Stream,  Monitor  Inputs,  TCP,  Other  

7  

8  

Why  Is  OT  Different  Than  IT?  
9  

Cri=cal  OT  Endpoints  

HMI   Historian   Controllers  
  

Engineering   WorkstaCons  

Embedded   Devices  

Control  System   CommunicaCon  

10  

Splunk  for  OT  
11  

Leading  PlaForm  for  Industrial  Data  

Industrial  Assets  

Core  OT  

Core  IT  

Engineers  

Data     Analysts    

Security   Analysts    

Business   Users    

· Sensors   · Pumps   · GPS   · Valves   · Vats   · Conveyors   · Pipelines   · Drills   · Transformers   · RTUs   · PLCs   · HMIs  

· Control  Systems   · Asset  Management   · Connected  Assets   · Security  Appliances   · Network  Telemetry  
· Work  Order  Systems   · Safety  Applica=ons  

· Web  Services   · Telecoms   · Servers   · Storage   · Messaging  

Search   Alert   Visualize  

Predict   Develop  

12  

Partner  Ecosystem  

Advanced  Analy=cs  aSndD  MKsL    

IoT  and  ICS  Security  

UIC   ustom  User  Interfaces  

Ingest  and  PlaForms   13  

Services  and  Delivery  

Fully  Integrated  Enterprise  PlaForm  

Collect   Data  
Scale  

Index   Data  

Search  &     Explore  
  

Alert  &   AcCon  
  

     Enrich     Data  

Report  &   Analyze  

Visualize   &  Predict  

  

  

HA/DR  

Admin  

Data  Security  

Apps   SDKs/APIs  

14  

Industrial  Assets  

Collect  and  Index  

Consumer  and   Mobile  devices  

Na=ve  Inputs   SDKs  and  APIs  

Modular  Inputs  
OT  
Technology   Partnerships  
IT  
New  HTTP     Event  Collector  

TCP   UDP   Logs   Scripts   MQTT   Wire   AMQP   Mobile   COAP   Java   REST  
JS   JMS   C#   HTTP   Python   Ruby   PHP  

Search,  Alert,  Report  and  Analyze  
Industrial  Assets  

Consumer  and   Mobile  devices  

Na=ve  Inputs   SDKs  and  APIs  

Modular  Inputs  
OT  
Technology   Partnerships  
IT  
New  HTTP     Event  Collector  

TCP   UDP   Logs   Scripts   MQTT   Wire   AMQP   Mobile   COAP   Java   REST  
JS   JMS   C#   HTTP   Python   Ruby   PHP  

Enrich  Industrial  Data  with  Structured  Data  

ICS  Tag  Data  
Workorder,   Asset  
Databases  

Asset  ID  

Tag  

9/8/15 4:41:48.055 PM

2015-09-08 23:41:48.055 +0000 Tag="Windfarm_10.Turbine_10.Wind_Direction"

Value="132.959152" AssetID="K23441gF4224" Quality="good" demo=Windfarm

host = 127.0.0.1 source = tcp:9997 sourcetype = opc 9/8/15 4:41:48.055 PM

2015-09-08

23:41:48.055 +0000 Tag="Windfarm_10.Turbine_10.Temperature" Value="19.3928394" Quality="good"

demo=Windfarm host = 10.7.102.1 source = tcp:9997 sourcetype = opc 9/8/15 4:41:48.055 PM

Host   Tag  Value   2015-09-08 23:41:48.055 +0000 Tag="Windfarm_10.Turbine_10.Stator_Oil_Temperature"
Quality="good" demo=Windfarm

ValueT="a8g5.  Q45u67a3l3it7y"   

host = 127.0.0.1 source = tcp:9997 sourcetype = opc

9/8/15

Asset  ID  
  

Technician   50446  

Date  Serviced   Part  Number   Lot  Number  

9/7/15  

1224--56--A  

B00747  

Asset  ID  
  

LocaCon   Site  7  

LocaCon   La=tude  

Longitude   Site  ID  

Site  7  

39.11515   84.45651   A345  

Address   Line  1  
409  Park  St.  

17  

Demo  
18  

Key  Takeaways  

Secure  data   collec=on  across   different  formats,  
protocols  and   connec=vity  op=ons  

Scalable  =me-- series  storage  of   sensor,  diagnos=c   and  transac=onal  
data  

Search,  ad  hoc   correla=ons  and   powerful  analy=cs   across  OT  and  IT  
data  

Real--=me   dashboards  and  
repor=ng  

19  

THANK  YOU  

