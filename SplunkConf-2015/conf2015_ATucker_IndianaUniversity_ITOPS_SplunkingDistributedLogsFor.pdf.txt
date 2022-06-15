Copyright  ©  2015  Splunk  Inc.  
Indiana  University:   Splunking  Distributed   Logs  for  IT  Policy   Alignment  
Allen  Tucker,  Manager   Kelly  Zimmerman,  Systems  Administrator   Daniel  Daily,  Systems  Administrator  
HELPnet  Central  Systems  Team  

Disclaimer  
During  the  course  of  this  presentaMon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauMon  you  that  such  statements  reflect  our   current  expectaMons  and  esMmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaMon  are  being  made  as  of  the  Mme  and  date  of  its  live   presentaMon.  If  reviewed  aVer  its  live  presentaMon,  this  presentaMon  may  not  contain  current  or   accurate  informaMon.  We  do  not  assume  any  obligaMon  to  update  any  forward  looking  statements  we  
may  make.     In  addiMon,  any  informaMon  about  our  roadmap  outlines  our  general  product  direcMon  and  is  subject  to   change  at  any  Mme  without  noMce.  It  is  for  informaMonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaMon  either  to  develop  the  features  
or  funcMonality  described  or  to  include  any  such  feature  or  funcMonality  in  a  future  release.   Referenced  customers  for  ITSI  product  parMcipated  in  a  limited  release  soVware  program  that  included  
items  at  no  charge.  
2  

Agenda  
· Background and Culture · Architecture · Scalable Architecture · Departmental onboarding · App Dev Phases · Expansion of service · Q&A

Background and Culture

Indiana  University,  est.  1820  
  
· $3.3B  enterprise   · Partnered  with  $6B  IU  Health  system  
· 115,000  Students   · 1.3M  Credit  Hours  per  semester   · >20,000  Degrees  per  year   · $1.1B  in  Financial  Aid   · $450M  in  research  grants  
· 8,000  Acres   · 882  buildings,  36M  square  feet   · >600,000  living  Alumni  
· 10,500  Faculty  and  Staff  

CENTRALIZED  enterprise  IT  
with  
DECENTRALIZED  departmental  IT  
109  Departmental  IT  Groups   5213  Total  Servers  within  IU  

Safeguards
 IU  IT  Policy    
­ IT--12  list  of  `best  pracMces'  for  system  management  
 IU  Internal  Audits  
­ In  depth  departmental  checks  for  IT  operaMons   ­ Alignment  with  IT  policies  
 Log  Management  
­ Success/Failed  User  Logons,  Success/Failed  File  Accesses  
  

Implications
 Costs  associated  with  log  review   ­ Its  overwhelming  
­ Costly  if  departments  DIY  
­ Staff  Mme  is  at  a  premium     

Service Timeline

Internal  HELPnet   Deployment  
· 120  Servers  

Cost  Recovery   Offering  

Departmental   Growth  &  UITS  
Interest  

·20  Departments   ·Many  Regionals   ·~375  servers  

Issues  with   Scalability  

New  Product   TesMng  &  PoC  

Proposal  to   Cabinet  

Deployment  

Customer   Onboarding  
(Since  June)  

IteraMve   Changes  

·Approval  in  August   ·Training  

·42  Departments   ·Expanded  Detail  

2014    

·CerMficaMon  

·2000  AcMve  Servers     ·UI  /  Usability  

·Build  of  Architecture  

·App  Development  

Architecture

Indiana  University  Storage  and  VirtualizaMon  
VMware  ESX  Physical  Hardware   · Dell  PowerEdge  M620  --  20  CPU  cores  3GHz,  E5--2690   · 512GB  Memory  --  DDR3   · Hitachi  VSP  G1000  SAN  

Bloomington  

Search  Cluster   Indexing  

Indianapolis  
Deployer   Deployment   License  Master  

MulM--campus  

Forwarders  Department  A  

Forwarders  Department  B  

Forwarders  Department  C  

Performance  StaMsMcs  
· IOPS  >  1062  Via  Bonnie++   · ~270,000  Events  per  second  dense  search  in  
smart  mode   · ~5400  Events  per  second  sparse  search  in  
smart  mode  

Bloomington   Search  Cluster  

Indianapolis  

Indexing  

Deployer   Deployment   License  Master  

MulM--campus  

Forwarders  Department  A  

Forwarders  Department  B  

Forwarders  Department  C  

Scalable Architecture

Search  Head  Cluster  
 Use  of  a  deployer    Knowledge  object  replicaMon    AddiMonal  search  head  expansion  

Deployer  

     Search  Cluster  

Deployment  Server  
(For  the  admin  that  never  touches  the  GUI)   Deployment  

 Houses  all  important  Splunk  configuraMons  
­ Indexer  configuraMons   ­ ConfiguraMon  push  to  2000+  servers  

Indexing  

Forwarders  

Departmental  on--boarding  

Search  Cluster   Indexing  

Deployer   Deployment   License  Master  

Forwarders  Department  A  

Forwarders  Department  B  

Forwarders  Department  C  

Data  Silos  by  Tenant  
Each  department  has  a  unique  index  
Department  A   Department  B   Department  C  

Making  Deployment  Easier  

Overcoming  Distributed  IT  AdministraMon      
 NO  ADMIN  RIGHTS  
­ SoluMon:  Each  department  gets  a  shared   Box  folder   ê Splunk  Universal  Forwarder   ê InstallaMon  scripts   ê How  to  docs  
 SCCM  (Windows)  or  Ansible  (Linux)   helps  a  great  deal  
 The  magic  of  deploymentclient.conf     

Simplify  Onboarding  
Using  an  Onboard  Script  on  Our  Deployment  Server    
· Checks  user  logon   · Asks  for  locaMon,  OS  type  (user  input  phase)   · Adds  server  classes  and  indexes     · Copies  source  applicaMon  template   · Replaces  department  variables     · Assigns  roles  (authorize.conf,  authenMcaMon.conf)   · Assigns  a  default_namespace     

Script  Details  

 Script executes the .msi silently then stops the Splunk service

 Defines location, OS, Department & Host

 Injects these variables into the deploymentclient.conf file

 Assigns the client a deployment server

 Starts the service so it can phone home

 Verifies if Splunk is installed

Differences   · Dropping  all  unnecessary  event  IDs  
· IngesMng  full  auditd  

 Installs via package or tar.gz

 Configures Deploymentclient.conf

 Modifies auditd.conf for Splunk access

 Configures Splunk to start on boot

 Sets ownership and permissions

Script  to  Deploy  to  Many  
One  script  to  install  them  all  
 Mass  deployment  of  forwarder  to  600+  servers  remotely.  
  

App  Dev  Phases  

VERSION  1  

VERSION  1  

Lessons  Learned  
§ Training   § OpMmizing  Searches   § Data  Inputs   § ReporMng  

VERSION  2  

VERSION  2  

Expansion  of  Services  

Down the Road
 Further development IT-12 application for departments
 Expand UITS I.T. Ops.

QuesMons?  

THANK  YOU  

