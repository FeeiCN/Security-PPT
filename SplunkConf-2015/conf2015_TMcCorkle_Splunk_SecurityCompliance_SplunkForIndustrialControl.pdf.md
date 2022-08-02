Copyright  ©  2015  Splunk  Inc.  
Splunk  for     Industrial  Control   Systems  (ICS)  Security  
Terry  McCorkle  
Principal  Security  Strategist,  Splunk  

Disclaimer  
During  the  course  of  this  presentaEon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauEon  you  that  such  statements  reflect  our   current  expectaEons  and  esEmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaEon  are  being  made  as  of  the  Eme  and  date  of  its  live   presentaEon.  If  reviewed  aQer  its  live  presentaEon,  this  presentaEon  may  not  contain  current  or   accurate  informaEon.  We  do  not  assume  any  obligaEon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiEon,  any  informaEon  about  our  roadmap  outlines  our  general  product  direcEon  and  is  subject  to   change  at  any  Eme  without  noEce.  It  is  for  informaEonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaEon  either  to  develop  the  features  
or  funcEonality  described  or  to  include  any  such  feature  or  funcEonality  in  a  future  release.  
2  

A  LiWle  About  Me  

  

  

Terry  McCorkle  

  Principal  Security  Strategist,  Splunk  

  Minster  of  Chaos  

  

Background  

  Security  Researcher  

  Penetra9on  Tester  

  Incident  Responder  

  

  

3  

Agenda  
 IoT/ICS  Overview  (What  is  your  use  case?)    ICS  Security  Trends    ICS/OperaEonal  Data  CollecEon  Points      CorrelaEng  IT  Data  with  OperaEonal  Data    Use  Case  Examples  
4  

IoT  Overview  

Big  Data  Comes  From  Machines...  
Volume    |    Velocity    |    Variety    |    Variability  
GPS,   RFID,   Hypervisor,   Web  Servers,   Email,  Messaging,   Clickstreams,  Mobile,     Telephony,  IVR,  Databases,   Sensors,  TelemaCcs,  Storage,   Servers,  Security  Devices,  Desktops    
6  

...  Including  From  OT  Environments  
Volume    |    Velocity    |    Variety    |    Variability  
Sensors,  Pumps,     GPS,  Valves,  Vats,   Conveyors,  Pipelines,  Drills,     Transformers,  RTUs,  PLCs,  HMIs,   LighCng,  HVAC,  Traffic  Management,   Turbines,  Windmills,  Generators,  Fuel  Cells,  UPS      
7  

Why  Is  ICS  Different  Than  IT?  
8  

Scope  of  IoT  &  Industrial  Data  

OperaEonal  Technology  (ICS)    

Energy  

Oil  &  Gas  

SCADA  

Process  

Manufacturing     
RoboEcs  

DCS  

Smart  Buildings  

  
Medical   Devices  
Telecom  
     

Other  

Consumer   Technology  

Smart  Home  

Wearables     
Media  

Emerging  Technology  

ICS  Security  Trends  

ICS  Security  Threats  

CYBER   CRIMINALS  

MALICIOUS   INSIDERS  
11  

NATION   STATES  

Why  the  Growing  Interest  in  ICS  Security?  
Everyday  Headlines:  
12  

Current  State  of  ICS  Security  

Prevent  Control  System   Service  InterrupCon  or  
Damage  

Logging  CapabiliCes  

Health  and  Safety  of   Employees  

ReporCng  CapabiliCes  

Drivers   Weaknesses  

Meet  Compliance  

CorrelaCon  Between  OT   and  IT  

Prevent  InformaCon   Leakage  

Data  Silos  

A  New  Approach  to  ICS  Security  Is  Needed  

· Goal  oriented   · Human  directed   · MulCple  tools,  
steps  and  acCviCes   · Dynamic     · New  evasion  
techniques   · Coordinated  

Analyze  all  relevant  data   Contextual  and  behavioral  relevance   Rapid  learning  loops  and  responses   CollaboraEve  and  coordinated   Leverage  IOC  &  threat  intel   Fusion  of  technology/people/process  

14  

ICS/OperaEonal  Data   CollecEon  Points    

All  Data  is  Security  Relevant  =  Big  Data  

Databases   Email   Hypervisor   Badges  

Web   Desktops   Servers   DHCP/DNS   Network  

TradiConal  

Flows  

Firewall  

AuthenEcaEon   Vulnerability   Scans  

Custom   Apps  

Service   Desk  

Storage  

Mobile  

Intrusion     DetecEon  

Data  Loss   PrevenEon  

AnE-- Industrial   Call     Malware   Control   Records  

16  

CriEcal  ICS  Endpoints  

Embedded   Devices  

Engineering   WorkstaCons  

HMI   Historian   Controllers  
  

17  

Control  System   CommunicaCon  

CollecEon  Points  
18  

Splunk's  ICS  Security--Focused  Partners  
19  

CorrelaEng  IT  Data     With  OperaEonal  Data  

Security  Data  From  ICS  Devices  

AnE--Malware  

AuthenEcaEon  

Mobile  

Storage  

Badges  

DHCP/  DNS   Servers  

Custom   Apps  

Network   Flows  
Firewall  

Data  Loss   PrevenEon  

Industrial   Endpoints  

PLC  Data  
HMI  and   Historians  

Network  Protocols     

AuthenEcaEon  

  

Real--Time   Industrial   Machi  ne  Data  
Control  
Enrichment  
Threat   Asset     Feeds   Info  

Device  Behavior  

  

HMI  Behavior  

  

OperaEonal  Change     

Unauthorized   New  or  Unseen  
Unauthorized   Abnormal  Logins   CommunicaEon   Faults   Unexpected  Change   ApplicaEon  Logins  
OperaEon  Anomalies   Unexpected  Logins  

21  

AnalyEcs--Driven  Security  Use  Cases    

INCIDENT   INVESTIGATIONS  
&  FORENSICS  

SECURITY  &                     COMPLIANCE  
REPORTING  

REAL--TIME   MONITORING  OF   KNOWN  THREATS  

MONITORING     OF  UNKNOWN  
THREATS  

FRAUD     DETECTION  

INSIDER     THREAT  

Splunk  soQware  complements,  replaces  and  goes  beyond  tradiEonal  SIEMs  
22  

The  Splunk  App  for  Enterprise  Security  and  ICS  

Dashboards  and  Reports  

IT  Security   Events  

Process   and  Alarm  
Events  

OT   Security   Events  

Incident  InvesCgaCons  and   Management  

StaCsCcal  Outliers  

Asset  and  IdenCty  Aware  
23  

Use  Case  Examples  

Threat  Intelligence  
Network     AcCvity/Security  
Host     AcCvity/Security  
Auth  --  User  Roles  

The  ICS  Security  Kill  Chain  

Deliver,  exploit   Gain  trusted  

installaCon  

access  

Malware     download  
Malware  and     endpoint   execuEon  data   Program   installaEon  

Upgrade  (escalate)   lateral  movement  
Access  to  ICS  
AuthenEcated   sessions  used  to   pivot  into  control   systems  LAN  

Access  OperaCons   Environment  
Control  System  LAN  

User  on  machine   link  to  program   and  process  
Malware  install  
25  

High--confidence  event   Med--confidence  event   Low--confidence  event  

Machine  data   Traffic  data   Abnormal  behavior  

        
DEMO  
26  

Improving  SCADA  OperaEons  and  Security  
Analyze  51K  miles  of  pipeline  data   from  servers  and  OT  networks  
Improved  pipeline  safety  and   availability  through  higher   applicaCon  upCme  
Increase  regulatory   compliance  
95% Improvement  in     Incident  Response  Time  

Takeaways  
Make  Your  Data  Talk  to  You  
 Most  organizaEons  have  ICS    ICS  Data  is  valuable    Protect  your  ICS  data  
­ IdenEfy  the  systems  your  organizaEon  has   ­ Splunk  it!   ­ Correlate  it   ­ Protect  it  
  
28  

What  Now?    
Related  breakout  sessions  and  acEviEes...    Resources    Next  steps    Etc.    
29  

QuesEons?  
30  

THANK  YOU  

