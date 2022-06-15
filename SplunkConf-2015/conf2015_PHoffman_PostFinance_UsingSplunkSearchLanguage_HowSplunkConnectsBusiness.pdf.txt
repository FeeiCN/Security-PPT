Copyright  ©  2015  Splunk  Inc.  
How  Splunk  Connects   Business  and  IT  at   Swiss  Bank   PostFinance  Ltd  
Patrick  Hofmann  
Head  of  IT  Infrastructure,  PostFinance  

Disclaimer  
During  the  course  of  this  presentaGon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauGon  you  that  such  statements  reflect  our   current  expectaGons  and  esGmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaGon  are  being  made  as  of  the  Gme  and  date  of  its  live   presentaGon.  If  reviewed  aQer  its  live  presentaGon,  this  presentaGon  may  not  contain  current  or   accurate  informaGon.  We  do  not  assume  any  obligaGon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiGon,  any  informaGon  about  our  roadmap  outlines  our  general  product  direcGon  and  is  subject  to   change  at  any  Gme  without  noGce.  It  is  for  informaGonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaGon  either  to  develop  the  features  
or  funcGonality  described  or  to  include  any  such  feature  or  funcGonality  in  a  future  release.  
2  

About  Me  ­     In  a  Nutshell  

About  Me  ­  In  a  Nutshell  
4  

Agenda  
PostFinance  Ltd  at  a  glance   Splunk@PostFinance   Use  case  1  ­  Fraud  detecGon  and  report  generaGon  for  E--Payment   Use  case  2  ­  Online  banking  security  and  threat  detecGon   Wrap  up     
5  

PostFinance     At  a  glance  

PostFinance  at  a  Glance  
One  of  the  leading  retail  financial   ins,tutes  of  Switzerland      Number  one  in  Swiss  payment   transac,ons      An  ideal  partner  for  customers  who  wish   to  independently  manage  their  finances  
7  

Assets  and  TransacGons  

Customer funds (in CHF millions)  
  
More  and  more  customers  entrust    
PostFinance  with  their  money.  

Transactions processed (in millions)
PostFinance  is  the  market  leader  in   Swiss  payment  transacGons.    

8  

Customers  Total  and  Online  

Number of customers (in millions)
  
PostFinance  is  one  of  Switzerland's   leading  retail  financial  insGtuGons.    

E-Finance users (in millions)
  
More  than  1.6  million  customers  
manage  their  finances  online.    
  

9  

Splunk  @   PostFinance  

PostFinance's  Splunk  Timeline  

Splunk  3.x   Splunk  4.x   Splunk  5.x  

Central  Logging   Systems  (OS  only)  
Traceability  

Fraud  DetecGon  

Appl.  Logging   Online  Banking  
DB  &  MW  

2007  

2010  

2013  

Splunk  6.x  ...  

Splunk  6  Refactoring  

Business  Apps  
Performance     &  Availability  

2014  

2015  

11  

PostFinance's  Splunk  Numbers  

Indexing rate average 434 KB/s

40 Terabytes SAN data
(per site)

Number of applications
> 30

Number of roles 68

Splunk apps > 55

28 Splunk indexers

Cores 480

800 Searches per minute

Data volume per day 800GB ­ 1TB

Search head cluster 5 Members 1 Deployer
12  

Memory 2816GB

Source systems > 2360

Source  Systems  

High  Level  Architecture  

Log  Data  Repository  

Custom  analysis  /  Alarming  tool   Export  database  

Solaris(1200)   Linux  (700)  

Windows  (500)  

Network  Devices   &  Appliances  

SNMP  Traps   Syslog  

Oracle,  MSSQL  (52)  

Indexers   Indexers  

Search   Heads  

DB  enrichment   Python  ApplicaGon  

Export  to  database  

Custom  analysis  

DB  Connect   13  

Messageforwarder   Tomcat  Java  applicaGon  

Alerts  to  ITSM  

Deployed  in  Two  Datacenters  

Datacenter   Bern  

>500     Users  

Datacenter     Zofingen  

Search  Head   Cluster  

Captain  

Cluster     Members  

Deployer  

Search  Peers   >150  Indexes  
14  

Solaris  

Linux   Windows   Network    Devices     &  Appliances  

14  

Solaris  

Linux   Windows   Network  Devices   &  Appliances  

Use  Case  1:   Fraud  DetecGon  and  
Report  GeneraGon   For  E--Payment  

E--Payment  --  IntroducGon  
Automated  StaGsGcs  GeneraGon    
for  Fraud  DetecGon     and  Product  Management  
E--Payment  Plakorm  Info  
Automated  Fraud  DetecGon   General  Support  Info  
Ad  Hoc  Searches  for  Support    
16  

Shoppers  
Reverse  Proxy   Entry  Servers  
Applica,on   Servers  
Database   Servers  

E--Payment  --  Architecture  
Ad  Hoc     Searches  

Indexer  

Search  Head  

Transac,on  Logs   Business  Logs  
Database  Logs   System  Logs  

Business  Logs           
Transac,on  Logs           
Transac,on   History  (2  Years)  

Monitoring  &   Aler,ng  
Automated  sta,s,cs   and  report  genera,on  

17  

E--Payment  --  Overview  of  Splunk  Usage  
Two  main  types  of  Splunk  searches:  
Examples  of  global  searches:  
­ Alempted  payments  with  wrong  credenGals   ­ Payments  with  same  card   ­ Number  of  first  Gme  debit  card  users   ­ TransacGons  close  to  the  card  limit  
Examples  of  merchant  report  searches:  
­ Percentage  of  new  buyers   ­ Change  of  revenue  
18  

E--Payment  ­  Merchant  Report  Example  
TransacGons   Revenue  
19  

E--Payment:  Fraud  Workflow  

Search   recognizes  fraud    
or  assumed   fraud  

Escala,on,   card  blocking,  
merchant   contact  

Logfiles  from   various  systems   and  applica,ons   sent  to  Splunk  
indexers  

Dashboards  and   forms  for  ad  hoc  
searches    

20  

Support  team  is   no,fied  by  email  or  
incident  ,cket.   Further  analysis  and  
resolu,on  starts  

E--Payment  ­  Performance  challenges  
21  

E--Payment  ­  Searching  for  Fraud  
22  

E--Payment  ­  Dashboard  Examples    
23  

Use  Case  2:   Online  Banking  
Security  and     Threat  DetecGon  

PostFinance  ­  E--Finance  IntroducGon  
25  

E--Finance  --  Architecture  

Datacenter   Bern  
Load--balanced  Entry  Servers   Authen,ca,on  and  Security  Servers  
Applica,on  Servers   Authen,ca,on  backend   Session  Servers   Malware  protec,on  
Database  Servers     Central  Storage  

Search  Head     Cluster  
Indexers  

Online  Security  Team   Ad  Hoc  Searches  
Applica,on  Management   Systems  Management   Database  Administrator   Ad  Hoc  Searches  
Monitoring  &   Aler,ng  

26  

Online  Banking  --  Phishing  
27  

E--Finance  --  Phishing  Alack  Workflow  
Security  team   analyzes  the  new   a^ack  pa^erns  

The  online  security  team   is  no,fied  about  a  new   phishing  a^ack  by  email  

All  transac,ons   are  rated  using  
CEP  rules  

Opera,onalize  the  findings   for  use  in  daily  business  

28  

Online  Banking  Security  ­  Western  Union  
29  

Online  Banking  Security  ­  Login  Behavior  
30  

Online  Banking  Security  ­  OI  
31  

Wrap--Up  

Wrap--Up:  Success  Factors  
 Start  small,  think  big   Dedicated  «virtual»  team    
 Business  value  always  in  mind    Show  &  tell  
Have  security  on  priority  list   Regulatory  Gghtening    Management  support  
33  

THANK  YOU  

