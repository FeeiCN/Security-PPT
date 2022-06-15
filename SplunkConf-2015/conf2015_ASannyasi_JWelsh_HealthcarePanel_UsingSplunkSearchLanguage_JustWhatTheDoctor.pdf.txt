Copyright  ©  2015  Splunk  Inc.  
Just  What  the  Doctor   Ordered:  InnovaCve  Use   Cases  in  Healthcare    
Adrish  Sannyasi   Joe  Welsh  

Agenda  
1. MoCvaCon  and  Background:  Healthcare     2. Data  IntegraCon  and  Enrichment   3. Data  ExploraCon   4. Data  Product  Development  and  ApplicaCon  IntegraCon   5. Business  Value  Summary  

Disclaimer  
During  the  course  of  this  presentaCon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauCon  you  that  such  statements  reflect  our   current  expectaCons  and  esCmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaCon  are  being  made  as  of  the  Cme  and  date  of  its  live   presentaCon.  If  reviewed  aYer  its  live  presentaCon,  this  presentaCon  may  not  contain  current  or   accurate  informaCon.  We  do  not  assume  any  obligaCon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiCon,  any  informaCon  about  our  roadmap  outlines  our  general  product  direcCon  and  is  subject  to   change  at  any  Cme  without  noCce.  It  is  for  informaConal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaCon  either  to  develop  the  features  
or  funcConality  described  or  to  include  any  such  feature  or  funcConality  in  a  future  release.  
3  

Healthcare  Data  is  Time  Oriented  and  Diverse  

Healthcare  Apps  

IT  Systems  and  Med  Devices  

Pa9ent--Facing  Data  

        PHI  Access   Audit  Logs  

EHR   Systems  

HL7   Messaging  

Departmental   and  
Homegrown   ApplicaCons    

HIE  

Web   Services  
Desktops  

Devices  

Servers  

Security  

Medical   Developers   Devices  

Networking  

Telecoms  

App   Support  

Storage   Messaging  

Claims  

PaCent   Portals  

Clickstream   Billing  

CDR  

Medical   Records  

Cloud   Virtual   Physical  

4  

Domains  of  Data  Diversity  in  Health  Data  

Subjects  
Persons,  Sensors,   Actuators,  Mobile  
Devices    

System  and   Loca9ons  
Home,  Hospital,  ER,   Nursing  Homes  

Informa9on   Users  
Clinical,  Family,  PaCent  
5  

Ownership  and   Management  

Barriers  for  Business  Value  

Ability  to  easily   ingest  diverse  
data  sets  

Flexibility  to   capture  data  

Restricted   system  access  

Quickly  geang   value  from  data  

6  

Splunk  CapabiliCes  for  Healthcare  SoluCons  

Schema--less   approach/  late   binding  to  schema  

Dynamic   "normalizaCon"    
of  data  

Agile  analyCcs     and  reporCng  

Scalable  search   and  analyCcs  

Seamless   operaConal   integraCon  

7  

Specific  Healthcare  OperaCons     Management  Problems  
Capacity  Planning  (human  resources,  machines)  in  Hospitals   IdenCfying  boilenecks  in  paCent  flow  in  hospitals  and  emergency  care   Discovering  clinical  pathways  for  condiCon  X   Analyzing  clinical  pathway  adherence   OpCmizaCon  for  improved  availability  of  medical  devices   Provider  scheduling   Finding  gaps,  redundancies,  and  conflicts  in  care  coordinaCon     IdenCfying  fraud,  waste,  and  abuse  
8  

AbstracCon  of  Machine  Data  --  Modeling  

{! "resourceType": "Patient",! "identifier": [! {! "system": "urn:oid:1.2.36.146.595.217.0.1",!
"value": "12345",! "period": {!
"start": "2001-05-06"! }! }!
],! "name": [!
{! "use": "official",! "family": ["Lucus"],! "given": ["Stephaney"]!
},! ],! "gender": {!
"coding": [! {!
"system": "http://hl7.org/fhir/v3/AdministrativeGender",! "code": "M",! "display": "Male"! }! ]!
},! "birthDate": "1974-12-25",! "address": [!
{! "use": "home",!
"line": ["534 Erewhon St"],! "city": "PleasantVille",! "state": "Vic",! "zip": "3999"! }!
]! }  

PaCent  
idenCfier   name   telecom   gender   birthDate   deceased   address   maritalStatus   ....   acCve  
     

<recordTarget>! <patientRole>! <id extension="12345" root="PlaceholderOrganization" />! <addr use="HP">! <streetAddressLine>180 Fake Road</streetAddressLine>! <city>Providence</city>! <state>RI</state>! <postalCode>02912</postalCode>! <country>US</country>! </addr>! <telecom use="WP" value="tel:+1-401-867-7949" />! <patient>! <name>! <given>Stephaney</given>! <family>Lucus</family>! </name>! <administrativeGenderCode code="F"
codeSystem="2.16.840.1.113883.3.560.100.2" displayName="Male" />  
MSH|^~\&|EPIC|MGH||MGH|20150324190937|OHEDSCRIBE|ADT^A08| 725467|T|2.3|||||||||   .........   PID|1||12345^^^EPI^MR||LUCUS^STEPHANEY||19751225|M||| ^^^^^US^P|||||||6100215419|999--99--9999|||||||||||N||   ........  

9  

Dynamic  "NormalizaCon"  
PaCent  
idenCfier   name   telecom   gender   birthDate   deceased   address   maritalStatus   ....   acCve  
     
10  

StaCsCcs,  Machine  Learning,  and  VisualizaCon  

1  
Discovery  
Discover   Diagnose   Enhance  

2  
Compliance  
Detect   Monitor     Compare  

3  
Predic9on  
Forecast     Predict   Recommend  

11  

Examples  of  Machine  Learning     For  Exploratory  Data  Analysis  

  Data  Analysis  Concept  

ML  Solu9on  

Find  common  and/or  rare  events  in  your  data   Clustering  

Find  anomalous  events  

Anomaly  DetecCon  

Find  a  relaConship  between  pairs  of  fields  by   change  in  entropy  (can  knowing  the  value  of  a   AssociaCon  Rule   field  help  predict  the  value  of  another?)  

See  Millions  at  a  Time  and  Visualize  Process/Journey  

ApplicaCon  Development  Plauorm  
14  

Enable  Interoperability  

1  
Standard   terminology  and  
models  
(i.e.,  FHIR)  

2  
Data   interoperability  
Pla$orm  capable     of  analy0cs  on  all     types  of  data  from   diverse  sources  

3  
System   interoperability  
PlaPorm  capable  of   connec9ng  to  legacy  and  
newer  applica9ons     (REST  API)  

15  

IT  Users  

Ecosystem  IntegraCon  

Analysts  

Business  Users  

Analysts  

Business  Users  

Ad  Hoc   Search  

Monitor   and  Alert  

    Reports  /   Analyze  

Custom   Dashboards  

ODBC   SDK   API  

Clickstreams   Devices  

Networks  

Hadoop  

GPS  /   Cellular  

Servers  

ApplicaCons  

Online  

Shopping  Carts  

DB  Connect   Look--Ups  
16  

Data  Warehouse   Structured  Data  Sources  
CRM   ERP   HR   Billing   Product   Finance  

Post  Mortem:  Data  Science  Experiment     Design  and  ExecuCon

Real  World  Business   QuesCons/Formulate  
Hypotheses  

Data  CollecCon  

Data  PreparaCon  

CommunicaCon,   VisualizaCon  
Reports,  Findings  

EvaluaCon  
17  

Modeling/SimulaCon  

Pre  Mortem:  Real--Time  Monitoring,     DetecCon  and  PredicCons  

Anomaly   DetecCon,  Linkage,  
CorrelaCons/   Paierns  

Alerts  

Case   Management  

PredicCve   Modeling/  
Model   Maintenance  

Standard   Reports/   Queries  

Healthcare   Events  

Process  Mining  Plauorm  
18  

Data  Warehouse   Data  Archival   Rules  System  

How  is  Splunk  Different?  

Without  Splunk  

Data  CollecCon   Manual  extracCon  from  discharge   reports,  simulate  test  data  

Data  Types  

Data  must  be  structured  in  a  pre-- defined  schema  

With  Splunk   Actual  event  data  and  event  metadata  (logs)  
Structured,  semi--structured,  un--structured   data;  no  fixed  schema  needed  for  data  access  

VisualizaCon   Methods  
AnalyCcs   Methods  
Usage  in   OperaCons  

Excel  and  schema--based  BI  tools   Augment  with  big  data  visualizaCon  and   analyCcs  techniques  

DescripCve  analysis  (counCng,  etc.)   Augment  with  machine  learning  and  relevant   data  visualizaCons  

Monthly;  once  or  twice  a  year  

Near  real  Cme  (hourly,  daily,  weekly)  

19  

Business  Value  of  Splunk's  CapabiliCes  

1  
Save  lives,   beUer  
outcomes  

2  
Reduce   project  9me  
and  costs  

3  
Improve   pa9ent   experience  and   engagement  

20  

Other  Healthcare  Sessions  
 Wednesday,  September  23  
­ 10:00am  ­  Cerner  Corpora9on:  Predict,  Alert,  Manage  and  OpCmize  an  Ecosystem  With  Splunk.   Speakers:  Tom  Twait,  Chris  Hogan  
­ 10:45am  ­  Cerner  Corpora9on:  Guerilla  MarkeCng  ­  How  to  Sell  Splunk  Internally  to  Your  Enterprise.   Speaker:  Aaron  Blythe  
­ 11:15am  ­  Penn  State  Hershey  Medical  Center:  Building  a  Cyber  Security  Program  with  Splunk  App  for   Enterprise  Security.  Speaker:  Jeff  Campbell  
­ 12:15pm  ­  Kaiser  Permanente:  OperaConalizing  Data  Science  Output  Using  Splunk.  Speakers:  Dave   Dyer,  Tim  Neyman  
­ 1:15pm  ­  Oscar  Health:  Hold  Me  Closer  Tiny  Data.  Speakers:  Mackenzie  Kosut,  Timothy  Faust   ­ 3:15pm  ­  Kaiser  Permanente:  Turning  Indicators  of  Compromise  into  Tangible  ProtecCon.  Speakers:  
KaCe  Winslow,  Michael  Slavick   ­ 5:15pm  ­  The  Vancouver  Clinic:  PaCent  Privacy  Monitoring  with  Splunk.  Speaker:  Davin  Studer  
 Thursday,  September  24  
­ 10:00am  ­  Kaiser  Permanente:  Tracking  Health  Claims  Status  Across  MulCple  Formats,  Forms,  Systems   and  Plauorms  (and  Not  Losing  Any!).  Speaker:  Stuart  Sands  
21  

THANK  YOU  

