Copyright  ©  2015  Splunk  Inc.  
CollaboraFve     Security  Model  
Christof  Jungo  
Head  of  Security  Architecture,     Swisscom  Switzerland  Ltd.  
Haiyan  Song  
SVP  Security  Markets,       Splunk  Inc.  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  aUer  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

Splunk  is  the  Security  Nerve  Center  

Firewall   Web  Proxy  

Network  
Threat   Intelligence  

App   Servers  

Internal  Network   Security  

IdenFty  

Endpoints  

Nerve  Center  &  the  Ecosystem  

Threat  Intel  

Network  

Endpoint  &  App   IdenFty  &  Context  

Security  Ecosystem  

Threat  Intel  

Network  

Endpoint  &  App  

IdenFty  &  Context  

Copyright  ©  2015  Splunk  Inc.  
CollaboraFve     Security  Model  
Christof  Jungo  
Head  of  Security  Architecture,     Swisscom  Switzerland  Ltd.  

Personal  IntroducFon  
· Christof  Jungo  is  the  Head  of  Security  Architecture  and   Engineering  at  Swisscom,  the  largest  Telco  provider  in   Switzerland  
· More  than  ten  years  of  experience  in  managing  the   design  and  development  of  security  soluFons  in  the   Internet  provider  domain    
· Previously,  Chief  Technology  Officer  and  member  of  the   management  at  NETIX,  specializing  in  networking  and   security  
· Author  of  numerous  arFcles  on  Cloud  Security  and   council  member  of  the  InformaFon  Security  Forum  (ISF)  
8  

Ultra--fast  broadband     coverage  (fibre  opFc)  
TV coverage · 93% digital TV · 88% HDTV

Swisscom  Network  
Our  network  infrastructure    

>  1.4  million  homes  and   businesses    
Mobile   broadband  coverage      · 99%    2G   · 98%  3G   · 98%  4G/LTE  

Swisscom  has  one  of  the  best   telecoms  infrastructures  in  the   world.   Fixed  network:     By  the  end  of  2015,  Swisscom  will   supply  2.3  million  homes  and   businesses  with  ultra--fast   broadband.   Mobile  network:     By  2016,  Swisscom  will  have   extended  4G/LTE  coverage  to   99%  of  the  Swiss  populaFon.  

Universal  service  &  ADSL  

·  97%  (>2Mbps)  

9  

Swisscom  Security  
Our  AspiraFon:  <<  We  build  security  for  people  in  a  connected  world  ­  always  and  everywhere>>    

Basis  

Innov.   detec--
Fon  

Simple   security  

10  

How  to  Protect  the  Business  
Targeted  cooperaFon  is  required  for  success  

PrevenFon  

DetecFon  

IntervenFon  

· ProacFve  protecFon  of  data  at   various  levels   Systems,  Employees,  Networks     
· Training/awareness  of   employees  (phishing  campaign)  
· ConFnuity  management   · Resilience   · Security  risk  management  

· Early  detecFon  of  aoacks     · CollecFon  of  informaFon  on  
intrusions  from  the  Internet  and   the  data  
· Data  leakage  prevenFon   · SIEM   · Threat  intelligence   · HoneyNet   · Exchange  with  third  parFes  
Basic  Principles  

· Efficient  and  effecFve   response  to  security  incidents  
· Robust  incident  processes   · Abuse  and  fraud  management   · Automated  reacFons   · Disaster  recovery  and  crisis  
management  

· Basic  protecFon  provisions,  processes  and  technologies  on  which  other  measures  are  based    

· Policy  framewo   rk  

· CooperaFon  with  other  

· IdenFty  and  access  management   organizaFons  

· Physical  security  

·   Asset  &  risk  inventory  

· Knowledge  about  the  threat   situaFon  
· Firewalls,  intrusion  detecFon  

systems,  anFvirus  soUware,  ...  

Internal  Challenge  
Environments  have  developed  over  Fme  
12  

Impact  of  IT  IndustrializaFon  
Silo  landscapes  and  isolated  analysis  of  security  
· DetecFon  Fme:  modest   · CoordinaFon  Fme:  high   · RemediaFon  Fme:  high  to  very  
high   · IntegraFon  costs:  very  high  with  
umbrella  systems  
Tower   Monitoring  

Network   Security   Web   Security   File   Security   Messaging   Security   Database   Security   Endpoint   Security   Physical   Security  

CentralizaFon  and  ConsolidaFon  
Increase  in  detecFon  rate  
· DetecFon  Fme:  good   · CoordinaFon  Fme:  average   · RemediaFon  Fme:  average   · IntegraFon  costs:  high  

Network   Security   Web   Security   File   Security   Messaging   Security   Database   Security   Endpoint   Security   Physical   Security  

Event  Mgmt  

SIEM  /  Log  ConsolidaFon  

14  

AcFve  Response  
Set--up  of  abstracFon  layer  and  response  channel  
· DetecFon  Fme:  good   · CoordinaFon  Fme:  low   · RemediaFon  Fme:  low   · IntegraFon  costs:  low  

Network   Security   Web   Security   File   Security   Messaging   Security   Database   Security   Endpoint   Security   Physical   Security  

Data   analyFcs  

Vendor   APP  

Vendor   APP  

Vendor   APP  

Vendor   APP  

Vendor   APP  

Vendor   APP  

AbstracFon  layer  (meta  library)  

15  

Prototype/Demonstrator  
Set--up  of  eco--system  

Palo  Alto   Networks  

For2net  

Vendor   APP  

Vendor   APP  

Vendor   APP  

Vendor   APP  

Meta  library  

Meta  library   · Open  and  freely  upgradeable  abstracFon  layer  for  security  commands  
as  per  CSS  (design  language  in  web  design)   · StandardisaFon  by  a  body  aka  W3C  World  Wide  Web  ConsorFum   · Integral  element  of  Splunk  (without  addiFonal  costs)  
Vendor  APP   · Establishment  of  the  communicaFon  channel   · TranslaFon  of  the  meta  library  into  device--specific  commands  and  
configuraFons   · APP  development  by  manufacturers   · APP  store  for  manufacturers   Onboarding   · Straighsorward  onboarding  processes  for  manufacturers   · Quality  assurance  processes  for  APP  

16  

Planning  and  Milestones  

today  

1   2   3   4   5   6   7   8   9   10   11   12   1   2   3   4  

HL  Design   Mockup   Demo   PoC  

RC1   Beta  

Beta  test  
17  

Benefits  of  the  CollaboraFve  Security  Model  
InteracFon  and  adaptability  

The  CollaboraFve  Security  Model      · Reduces  the  dependence  of  security  manufacturers  and  
encourages  them  to  improve  the  quality  of  their  products   · Enables  interacFon  between  various  manufacturers  
- Eco--system  instead  of  silo  landscape   · Facilitates  the  integraFon  of  new  components  (Plug&Play)   · Reduces  management  requirements  (SoC  &  CSIRT)  and  costs  
The  market  funcFons  well  if  willingness  to  collaborate  is  part  of   the  manufacturers'  product  strategy.  

CollaboraFon  and  eco--system   through  open  interfaces,  easy   integraFon  and  distributed   development  costs.  The  focus  is  on   simplicity,  flexibility  and  dynamism.  

18  

The  Next  Level  
IntegraFon  with  other  threat  detecFon  components  
The  next  level  is  a  Fght  integraFon   with  exitsFng  Threat  Intelligence   Network  as  well  as  AutomaFc  TesFng   Environments  like  Vulnerability   Scanning  or  PenetraFon  TesFng   Frameworks  

Network   Security   Web   Security   File   Security   Messaging   Security   Database   Security   Endpoint   Security  

Vendor   APP  

Vendor   APP  

Vendor   APP  

Vendor   APP  

Vendor   APP  

Vendor   APP  

Security   Config  &  Policy   Management  

AbstracFon  layer  (meta  library)  

AutomaFc   TesFng  
Infrastructure  

Open  Threat  Intelligence  Framework  

19  

Demo  
IntegraFon  between  ForFnet  and  Splunk  

QuesFons?  
21  

THANK  YOU  

