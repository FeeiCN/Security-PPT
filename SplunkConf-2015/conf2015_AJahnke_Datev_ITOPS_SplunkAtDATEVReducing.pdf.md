Copyright  ©  2015  Splunk  Inc.  
Reducing  Incidents  and   Enhancing  Services  with   OperaJonal  Intelligence  
Andreas  Jahnke  
Manager  Monitoring,  DATEV   andreas.jahnke@datev.de  

Disclaimer  
During  the  course  of  this  presentaJon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauJon  you  that  such  statements  reflect  our   current  expectaJons  and  esJmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaJon  are  being  made  as  of  the  Jme  and  date  of  its  live   presentaJon.  If  reviewed  aUer  its  live  presentaJon,  this  presentaJon  may  not  contain  current  or   accurate  informaJon.  We  do  not  assume  any  obligaJon  to  update  any  forward  looking  statements  we  
may  make.     In  addiJon,  any  informaJon  about  our  roadmap  outlines  our  general  product  direcJon  and  is  subject  to   change  at  any  Jme  without  noJce.  It  is  for  informaJonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaJon  either  to  develop  the  features  
or  funcJonality  described  or  to  include  any  such  feature  or  funcJonality  in  a  future  release.   Referenced  customers  for  ITSI  product  parJcipated  in  a  limited  release  soUware  program  that  included  
items  at  no  charge.  
2  

The  Company  
3  

The  Company  
4  

The  Company  
   Branches  in  Germany,  liaison  offices  in  Berlin,  Brussels,  and  associated  companies   
5  

DATEV:  Mission  and  Members  

    Our  Purpose

Our  Members  

6  

DATEV  ­  Member  ­  Client  
DATEV`s  Customers:  Members  and  their  clients  

DATEV  

Member  

DATEV  

Member  
7  

Client  

Range  of  Products  

SoUware

                  Services                     Advice/Knowledge  

8  

Data  Processing  Center,  PrinJng  and  Shipment  
Facts  and  Figures  
9  

Key  Figures  
Financial  years  2010  --  2014  
10  

Splunk  at  DATEV  
11  

Use  cases:  

Why  Splunk?  

§ Improving  services   § Availability,  Reliability,  
Performance  &  Security  

§ Handling  of  (major)  incidents   § Common  view  of  IT,   reducing  mean  Cme  to   repair  (MTTR)  &  mean  Cme   to  invesCgate  (MTTI)  
12  

How?  Improving  Services  
SupporCng  all  ITIL  stages    

Strategy  

Design  

TransiJon   OperaJon  

CSI  

Services  

Trends  
Business   pafern  

Dependencies  

Performance  

Transparency  

Indicators  

Errors  

13  

Example  

How?  Improving  Services  
Online  Services  

NUKI  
Datapower   Windows
Server  
Switches  

WAS  

CICS  

IIS   Apache  

MQ  

DB2   MS  SQL  

VMware  

LINUX   Server  
Router  

AIX--Server   z/OS   VPN--Gateways  

Firewalls   Loadbalancer  

SAN  

14  

ImplementaJon  --  Improving  Services  
Dashboard  "Online  Services"  
15  

ImplementaJon  --  Improving  Services  
Dashboard  "Online  Services"  
16  

How?  Handling  of  (Major)  Incidents  
CreaCng  a  task  force     · Main  Targets:   - Reducing  MTTR   - Reducing  invesCgaCon  expense   - Common  view  of  IT   - Establishing  central  logfile  analysis  (Splunk)   - IntegraCon  with  monitoring  &  ITSM  
17  

How?  Handling  of  (Major)  Incidents  
CreaCng  a  task  force    

Focussing  

PrioriCzed  AcCviCes  

IntegraCon  

Review   ReporCng  

· Analyzing major incidents, problem records & event history
· Assessment with service owner, technical & application management, event management
· Prioritizing the identified spheres of activity

18  

How?  Handling  of  (Major)  Incidents  

Service--oriented  acCviCes  of  the  task  force  (examples)    

IdenJfied     spheres    
of  acJvity    

Components  

Middleware   ApplicaJon  
SoUware  

Services  

Customer   Services  

RZ--Einwahl   VDI  
Online  Services   BK  Outlook   ....  

Physical  layer   Virtual  Network  Plarorm   Switches,  Router   Firewalls,  Loadbalancer   Storage,  SAN--Switches   Virtual  Server  Plarorm   Datapower   Servers  (Cluster)  

Access  Plarorms   Network  Services   System  Services   Databases  (Middleware)   Queues  (Middleware)   ApplicaJon  Plarorms  
19  

External  Services     (e.g.  DVZpro,  RZ--Einwahl)  
Internal  Services   (e.g.  VDI,  BK--Outlook)  
Helping  Services   (e.g.  NUKI,  NUMIS)    
ITSM  (e.g.  Incident/Change   Management)  

Human  ressources   AccounJng     Taxes  
Developer  Workplace   Internal  Mailing   .....  

How?  Handling  of  (Major)  Incidents  
AcCvites  of  the  task  force    

Focussing  

PrioriCzed  AcCviCes  

IntegraCon  

Review   ReporCng  

· IniCal  meeCng  with  all  stakeholders   · Assessment  of  log  data  (classificaJon  of  confidence,  
regulaJons  by  law,  quality,  quanJty)  &  approval   · IntegraCon  of  log  data  into  central  Splunk  system   · CreaCng  requests  and  dashboards.....  

20  

How?  Handling  of  (Major)  Incidents  
AcCvites  of  the  task  force    

Focussing  

PrioriCzed  AcCviCes  

IntegraCon  

Review   ReporCng  

· Knowledge  transfer  to  stakeholders  in  the  organisaJon   (analyze  techniques,  monitoring,  handling  of  Splunk)  
· CreaCng  events  &  forwarding  to  the  exisJng  central  Event   Management  System  (Omnibus)  and  Service  Monitoring   with  EscalaCon  

21  

How?  Handling  of  (Major)  Incidents  
AcCvites  of  the  task  force    

Focussing  

PrioriCzed  AcCviCes  

IntegraCon  

Review   ReporCng  

· IndicaCons  for  tool  consolidaJon  

· Review  of  all  acJviJes,  agile  opJmizaJon  (lessons  learned)  

· Management  Reports/reviews  per  quarter  

22  

ImplementaJon:  Handling  of  (Major)  Incidents  
Dashboard  "RZ--Einwahl"  
23  

ImplementaJon:  Handling  of  (Major)  Incidents  
Dashboard  "RZ--Einwahl"  (more  details)  
24  

ImplementaJon:  Handling  of  (Major)  Incidents  
Dashboard  "RZ--Einwahl"  (incident  host  applicaCon)  
25  

Benefits  &  Problems  
DATEV  
é Improves  producCvity  of  development,  service,  technical  &  
applicaJon  management  (quality  tesJng,  troubleshooJng)  
é Improves  quality  of  online  services   ê Slow  implementaCon  &  knowledge  transfer  because  of  lack  
of  human  resources   ê Complex  user  management  with  access  to  log  data  
26  

Benefits  &  Problems  
Splunk  
é Easy  setup,  central  management   é High  performance  (realJme),  scalability  &  stability   é High  usability   é Flexible  organizaCon  (with  partners)  e.  g.  new  feature  requests   é IntegraCon  of  z/OS  possible  &  done   ê No  z/OS--forwarder  in  the  standard  porrolio,  extra  product  from  
Syncsort  with  addiJonal  costs  
ê Bugs  AIX--forwarder  (solved)  and  VMware  App  (under  progress)  
27  

Benefits:  IntegraJon  of  z/OS  
Splunk  &  Syncsort  
28  

The  Future  
DATEV  &  Splunk  /  Partner  LCS    
· IntegraCon  with  VMware   · IntegraCon  with  Windows  servers   · Proof--of--Concept  Event  Management  System    
(=  tool  consolidaJon)   · Proof--of--Concept  SIEM  
29  

THANK  YOU  

