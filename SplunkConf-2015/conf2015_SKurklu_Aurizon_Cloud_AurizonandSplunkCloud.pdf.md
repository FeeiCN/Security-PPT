Copyright  ©  2015  Splunk  Inc.  
Aurizon  and  Splunk  Cloud      ebnem  Kürklü   InformaCon  Security  Manager  

Disclaimer  
During  the  course  of  this  presentaCon,  we  may  make  forward  looking  statements  regarding  future  events   or   the   expected   performance   of   the   company.   We   cauCon   you   that   such   statements   reflect   our   current   expectaCons  and  esCmates  based  on  factors  currently  known  to  us  and  that  actual  events  or  results  could   differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  contained  in  our   forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward--looking  statements  made   in  the  this  presentaCon  are  being  made  as  of  the  Cme  and  date  of  its  live  presentaCon.  If  reviewed  aSer   its   live   presentaCon,   this   presentaCon   may   not   contain   current   or   accurate   informaCon.   We   do   not   assume  any  obligaCon  to  update  any  forward  looking  statements  we  may  make.        In  addiCon,  any  informaCon  about  our  roadmap  outlines  our  general  product  direcCon  and  is  subject  to   change   at   any   Cme   without   noCce.   It   is   for   informaConal   purposes   only   and   shall   not,   be   incorporated   into   any   contract   or   other   commitment.   Splunk   undertakes   no   obligaCon   either   to   develop   the   features   or  funcConality  described  or  to  include  any  such  feature  or  funcConality  in  a  future  release.  
2  

About  Aurizon  
· Aurizon  (ASX:AZJ)  is  the  largest  rail  freight   operator  and  a  top  50  ASX  company.  
· Each  year,  Aurizon  transports  more  than  250   million  tonnes  of  Australian  commodiCes.  
· Aurizon  also  owns  and  operates  one  of  the   world's  largest  coal  rail  networks,  linking  more   than  50  mines  with  three  major  ports  in   Queensland.  
· Vision  is  to  be  a  world  leading  rail--based   transport  business.  
· Safety  of  ourselves  and  others  is  the  number   one  priority.  Safety  is  at  the  core  of  everything   we  do  as  we  commit  to  ZeroHarm.  
3  

About  Me  
   ebnem  Kürklü  
· InformaCon  Security  Manager  in  Aurizon  for  the  last  12  months.  
· Previously  held  Security  and  Risk  Management  roles  in  the  financial  sector.  
Areas  of  focus:  
· Improve  the  security  posture  of  Aurizon  by  improving  core  competencies  in  IT  and  OT.   · Improve  vendor  and  service  provider  relaConships  to  achieve  becer  security  outcomes.   · Improve  the  risk  awareness  in  the  business  units.   · Leverage  investment  in  current  technologies.  
4  

Aurizon  IT  Environment  
Parts  of  Aurizon  IT  is  outsourced  to  Fujitsu.  They  provide  majority  of  corporate  IT  services.  

Networks  &  Comms   Storage   Server  &  Desktop  

Messaging   Directories   Applica=on  Support  
5  

Aurizon  IT  Environment  
Aurizon  retains  some  core  funcCons  internally  and  interacts  directly  with  the  business.  

Architecture  &  Design   Project  Delivery   Service  Management  

Security   Governance   Advisory  

6  

Aurizon  Using  Splunk  

Splunk  was  deployed  in  house  to  assist  the  Security  Team  in  :  

Search  Head  layer  

· D   etecCon  of  some  malware  events  ­  supported  by  ES   · P   erformance  monitoring  of  some  directory  servers  

Indexer  layer   clustered  

· I  nvesCgaCons  relaCng  to  privileged  access  changes   · I  nvesCgaCons  relaCng  to  Code  of  Conduct  breaches  

· M   onitoring  a  number  of  internal  applicaCons  errors  

  

Limita=ons  

Data  source/forwarder  layer  

Licensing  ­  20  Gig  capacity   Resourcing  ­  Lack  of  an  internal  support  team  

  

  

  

7  

Aurizon  Growing  Splunk  

Re:plaHorm  Costs  ­  Setup  &  Ongoing  

  
  
AddiConal  Servers  
     O   S  Licence  

Physical  Servers  

  VM  Licence  

  AddiConal  Disk  

Mirror/Backup  costs  

Datacentre  costs    

Splunk  Licence  &  Maintenance  

Virtual  Servers  

8  

Aurizon  Growing  Splunk  
           
Why  can't  we  run  this  in  the  cloud  ?  
  
9  

Splunk  Cloud  ConsideraCons  

Costs  ­  Setup  &  Ongoing  

  
    
AddiConal  Servers  
     OS  Licence  

Physical  Servers  

VM  Licence  

AddiConal  Disk  

Mirror/Backup  costs  

Datacentre  costs    

Licence  &  Maintenance  

Virtual  Servers  

Splunk  Cloud  

10  

Splunk  Cloud  ConsideraCons  

Cost  Savings  &   Performance  Gains  

Availability  

Reduce  the  monthly  operaCng   costs  while  improving   performance.  

Ensure  100%  availability   without  creaCng  a  full  DR   replica  of  the  system.  

Administra=on  
Simplify  Splunk  to  reduce   system  administraCon  and   maintenance  tasks.  

Opera=onal   Intelligence  
Focus  on  driving  operaConal   intelligence  using  Splunk.  

Capacity  Management  
Increase  indexing  capacity   with  addiConal  licences   without  plaporm  changes.  

Data  Reten=on  

Version  

Increase  data  retenCon   capability  without  increasing   operaCng  costs.  

Upgrade  and  remain  up  to   date  with  latest   advancements.  

11  

Splunk  Cloud  ConsideraCons  

Security  

Governance  

12  

TECHNICAL   DISCUSSION  

Before  Cloud...  
Search  Head  layer  

Indexer  layer  --  clustered  

Data  source/forwarder  layer  

Cluster  Management   Forwarder  Management  

Easy Migration Strategy
· ExisCng  plaporm  indexing   most  required  data  sources  
· Leave  exisCng  data  in  current   indexers  and  all  new  data  sent   to  Cloud  

Splunk  Cloud  layer  

With  Cloud...  

Heavy  forwarder  layer  

Data  source/forwarder  layer  

Forwarder  Management  

A  Word  On  Forwarders...  

· Splunk  Cloud  Ops  provision   Forwarder  App   · Default  Encrypted   · Easy  to  install  on  forwarders   · Splunk  generated  keyset   · Auto  load  balancing  across   IDX  

OUTPUTS.CONF   [tcpout]   defaultGroup  =  splunkcloud      [tcpout:splunkcloud]   server  =  inputs1.aurizon.splunkcloud.com:9996,   inputs2.aurizon.splunkcloud.com:9996,  inputs3.aurizon.splunkcloud.com:9996,   inputs4.aurizon.splunkcloud.com:9996,  inputs5.aurizon.splunkcloud.com:9996   compressed  =  false   sslCertPath  =  $SPLUNK_HOME/etc/auth/aurizon_server.pem   sslCommonNameToCheck  =  *.aurizon.splunkcloud.com   sslPassword  =  Not_Telling   sslRootCAPath  =  $SPLUNK_HOME/etc/auth/aurizon_cacert.pem   sslVerifyServerCert  =  true   useClientSSLCompression  =  true  

Forwarders  Details  
Server  1   Server  2  

Aurizon  ­  Data  Inputs  
Universal  or  Heavy  Forwarder    

CheckPoint   OPSEC  

Local  /  CIFS  files  

Syslog/TCP/UDP   Windows  event  logs  
19

Data  Sources  Within  Aurizon  

Data  Sources  Within  Aurizon  

Example   Dashboards  

ASack  Type  1   ASack  Type  2  

Volume  details  
ASack  Type  3   ASack  Type  4  
ASack  Type  5  

     
26  

  

· Scheduled  alerts  in  place   · Based  on  IOC  data  coming  from  external   sources,  such  as  the  Australian  Federal   Police  

  

· Mostly  manual  at  this  stage  

· EffecCve  in  miCgaCng  and  responding  to  

  

a  large  range  of  acacks,  parCcularly   ransomware,  cryptolocker  

27  

Where  Is  The  Old  Splunk?  

Data  source/forwarder  layer  

A  number  of  new  data  sources  and  protocols  are  available  from  the   OT/SCADA  environment.  

  

  

Sensors   RFID  

  

Telemetry  data  

Non  standard  Protocols  

  

Since  these  data  types  are  generated  in  a  closed  network  with   addiConal  controls,  we  are  uClising  the  on  premise  soluCon  to  capture   and  correlate  logs.  

  

  

28  

Where  Do  I  Search?  
Hybrid  search  enables  the  analyst  to   conduct  searches  over  the  on   premise  and  cloud  soluCon.  They   can  conduct  their  daily  acCvity  from   one  console  seamlessly.   Setup  straighporward  and  seamless,   with  a  simple  job  to  the  Splunk   support  team.           
29  

What's  Next  At  Aurizon?  
· Improve  the  visibility  into  non--standard  traffic   · Correlate  events  to  see  user  &  system  acCvity  end--to--end     · Augment  exisCng  monitoring  technologies  with  Splunk   · Provide  OT/SCADA  engineers  a  new  plaporm  where  they  can  visualize  events  in  
IT  &  OT  networks   · Provide  the  Security  Team  real  Cme  alert  correlaCon  across  IT  &  OT  
           
30  

THANK  YOU  

