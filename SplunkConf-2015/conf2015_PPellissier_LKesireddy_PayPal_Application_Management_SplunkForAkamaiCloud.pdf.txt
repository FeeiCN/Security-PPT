Copyright  ©  2015  Splunk  Inc.  
Splunk  for  Akamai   Cloud  Monitor  
Pierre  Pellissier   Leela  Kesireddy  
Performance  Management   PayPal,  Inc.  

Disclaimer  
During  the  course  of  this  presentaEon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauEon  you  that  such  statements  reflect  our   current  expectaEons  and  esEmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaEon  are  being  made  as  of  the  Eme  and  date  of  its  live   presentaEon.  If  reviewed  aRer  its  live  presentaEon,  this  presentaEon  may  not  contain  current  or   accurate  informaEon.  We  do  not  assume  any  obligaEon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiEon,  any  informaEon  about  our  roadmap  outlines  our  general  product  direcEon  and  is  subject  to   change  at  any  Eme  without  noEce.  It  is  for  informaEonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaEon  either  to  develop  the  features  
or  funcEonality  described  or  to  include  any  such  feature  or  funcEonality  in  a  future  release.  
2  

Agenda  
!  Why  we  need  Log  Analysis   !  What  we  had  was  too  slow   !  Real  Time  logging  OpEon   !  GeXng  to  Real  Time   !  Benefits  &  Challenges   !  ConfiguraEon  Details   !  Akamai  Splunk  ApplicaEon   !  Final  Analysis  and  Q  &  A  
3  

Why  we  need  log  analysis  
· Customer  interacEons  on  Akamai   exceed  1  BN/day  
· It  is  business  criEcal  that  we  :  
­ Know  the  state  of  the  site     ­ Track  the  impact  of  changes   ­ Analyze  the  customer  experience  
4  

What  we  had  was  too  slow  

!  Akamai  for  content  delivery,  web   acceleraEon  and  security    
!  Akamai  log  collecEon  takes  hours   to  get  logs  into  NetStorage.    
!  Downloading  logs  hourly  and   indexing  them  in  Splunk  makes   them  available  for  analysis.  
!  But  this  is  not  a  real  Eme  soluEon.  
5  

Akamai Network
DC #1

WAF Log
Gathering
NetStorage
Hourly download
DC #2

Real  Eme  logging  opEon  

!  Akamai  Cloud  Monitor  delivers  logs  in   <  60  sec  
!  Faster  delivery  enables  real  Eme   operaEonal  monitoring  and  easier   analyEcs  by  internal  users.  
!  Lots  of  configuraEon  decisions.   !  The  results  are  worth  the  effort.   !  UlEmately  easier  than  expected.  
6  

Akamai Network
DC #1

WAF CM Log
Streaming
Aggregation
Real Time Delivery
DC #2

GeXng  to  real  Eme  

!  OperaEonal  goals  required:  
­ Real  Eme  visibility  into  site  
­ Improved  usability  of  logs  

Which  Sites?   Which  data?  

!  Lots  of  design  decisions  needed  to  be  made  
­ How  will  we  receive  the  logs?  
­ How  do  we  configure  CM  on  Akamai?   ­ How  will  this  change  the  indexed  volume?  
­ How  do  we  ensure  we  get  the  logs?   ­ How  will  the  logs  be  used?  

CM Log Streaming
What  aggregaEon?  
Aggregation
Real Time Delivery

!  The  iniEal  benefits  were  achieved  quickly  
­ MulEple  "bonus"  benefits  were  also  realized  

Redundancy?  

How  to     receive?  

­ Some  challenges  needed  to  be  dealt  with  

Dashboards  views?  

DC #2
What  volume?  

7  

IniEal  benefits  ­  site  control  
!  Receiving  the  logs  in  <60  sec.  makes  them  usable  for  real  Eme  analysis  
­ The  NOC  can  immediately  see  the  effects  of  site  changes   ­ The  CDN  team  can  see  the  effects  of  Akamai  configuraEon  changes  in  real  Eme  
Monitoring  of  site  ramp  acEvity.  
8  

IniEal  benefits  ­  log  usability  
!  NetStorage  log  parsing  needed   improving  
!  Akamai  CM  logs  use  JSON   formaXng  
!  Splunk  TA  for  CM  logs  put  them   into  CIM  format  for  ES   consumpEon  
!  Internal  customers  can  work  with   the  JSON  formaned  logs  more   intuiEvely  
9  

AddiEonal  benefits  ­  opEonal  CM  data  
!  OpEonal  data  fields   enable  rich  analyEcs   for:    
­ OperaEonal  Teams   ­ Performance   ­ Security   ­ Fraud  
!  Adding  more  fields   results  in  higher   indexed  volume  
10  

AddiEonal  benefits  ­  custom  fields  
!  Data  from  the  connecEon,   HTTP  header  or  payload   can  be  inserted  into  CM  
!  Enables  powerful  insight   for  mulEple  teams:  
­ Crypto  use  analysis   ­ Customer  Experience   ­ Referer  AnalyEcs   ­ TroubleshooEng    
11  

AddiEonal  benefits  ­  more  complete  data  

!  For  real  Eme  analyEcs  we  chose  to   receive  100%  of  the  CM  logs  
­ Some  use  cases  may  only  need  10%  
!  NetStorage  log  collecEon  does  not   capture  100%  of  the  logs  
!  The  CM  log  count  is  ~5%  greater   than  the  NetStorage  log  count  
­ This  increases  our  confidence  that  we   are  seeing  the  enEre  picture  
12  

WAF
Akamai Network

Sample percentage
= 100%

DC #1

Real Time Delivery
DC #2

Challenges  

!  Greater  log  volume  with  CM    
­ ~50%  more  data  indexed   ­ Partly  due  to  JSON  formaXng   ­ Mostly  due  to  addiEonal  CM  data  
!  IniEal  configuraEon  of  log  receiver  did   not  provide  redundancy    
­ CM  Logs  were  lost  when  it  was   unavailable  
!  Log  forwarding  logic  took  several   iteraEons  to  get  it  right  
­ A  POC  got  us  close  and  then  we   adjusted  aRer  we  were  in  producEon  
13  

WAF Akamai Network
DC #1

Delivery Failure
DC #2

ConfiguraEon   Details  

CM  &  splunk  checklist  

Ini$al  configura$ons:  
q Add  Cloud  Monitor  to  the  Akamai  contract   q Set  up  receiver  VIP,  DNS,  SSL  Cert  and  redundant  servers   q Choose  the  property  and  CM  data  sets  to  log   q Build  the  iniEal  CM  and  Splunk  configuraEons  

Trial  Run:  
q Configure  for  a  short  duraEon  of  logging  at  10%  to  verify  receiver  is  working   q Verify  the  CM  data  is  being  mapped  to  Splunk  CIM   q Verify  that  the  receiver  and  Splunk  can  support  the  expected  load   q Verify  the  data  is  what  you  need  and  expect  

Plan  on  doing  several  rounds  of  configura$ons,  tes$ng  and  tuning  
q It  is  easy  to  iterate  and  change  the  configuraEons  as  needed  

  

15  

CM  data  delivery  
!  Select  Data  Sets  to  Include   !  Configure  Delivery  Endpoint   !  Configure  the  AggregaEon  opEons:  
­ Time:  60  seconds  max   ­ Line  Count:  Max  3000  records   ­ Message  Size:  Max  900  KB  of  data  
!  Configure  DistribuEon  &  Failover   OpEons:   ­ Primary  receiver  gets  100%   ­ Secondary  receiver  gets  100%  if   Primary  receiver  is  unavailable   ­ NetStorage  gets  100%  if  Primary  &   Secondary  are  unavailable  
ê With  scheduled  FTP  download  hourly  
16  

CM  configuraEons  
!  Default  data  sets:  
­ CP,  Format,  Message,  Type,  Version  
!  OpEonal  data  sets:  
­ Akadebug,  network,  netPerf,  Geo,  WAF,  PPCustomData   ê Can  not  opt  out  of  data  elements  within  an  opEonal  data  set   ê Results  in  duplicates  of  some  data  or  unwanted  data  
!  Custom  Data  field:  
­ Selected  HTTP  Header  data  is  included   ­ Other  header  info  is  excluded--  like  large  cookies  
17  

CM  receiver  
!  Receiver  build  
­ Akamai  Posts  CM  data  to  receiver  VIP   ­ SSL  cert  required  for  secure  connecEon  by  Akamai   ­ MulEple  Linux  servers  in  pool  running  nginx  &  node.js   ­ Writes  logs  to  a  local  data  file   ­ Splunk  Universal  Forwarder  monitors  logs  and  forwards  them  to  Indexers     
18  

CM  receiver  (future  state)  

!  Plan  for  receiver  redundancy  

in  the  iniEal  design  

CM  VIP1  

  

CM  VIP2  

CM  VIP1  

Splunk   VIP  

NetStorage

CM  VIP2  

19  

Splunk  configuraEon  
!  Index  configured  with  100  day  retenEon   !  Built  Add--on's  with  Field  renames  &  
EvaluaEons   !  Normalized  data  to  be  CIM  Complaint   !  LDAP  group  configured  for  accessing  CM  data   !  Apps  set  up  for  internal  teams  to  build  and  
share  searches   !  Common  Akamai  CM  Dashboard  for  all  teams  
­ Performance  &  Availability  Dashboard  for  each   property  
­ StarEng  point  for  internal  teams  to  view  data  but   with  click  through  access  to  granular  data  and   search  bar  
20  

New--  Splunk  6.3  HTTP  event  collector  
!  HTTP  endpoint  can  securely  receive  high-- volume  JSON--based  applicaEon  and  IOT   data  
!  Create  and  mange  receiver  configuraEons   using  the  HTTP  event  collector   configuraEon  
!  Token  based  authenEcaEon  Model   !  Supports  to  both  hnp  &  hnps   !  Replaces  the  nginx  &  node.js  receiver  soluEon  
21  

Akamai  ApplicaEon  

Akamai  App  
!  Monitor  the  Real  Time  Traffic   !  Insights  by  Property   !  Monitor  Health  &  Performance  of  Origin   !  Monitor  Heath  &  Performance  of  Akamai  Edge   !  Observe  User's  Pain  Points   !  Inspect  App  /  URL  level  Issues  &  Performance   !  InvesEgate  Issues  
23  

Hurdles  
!  Performance  Issue  
­ Searches  Were  Slow   ­ Dashboards  taking  longer  to  load   ­ Greater  than  25K  events/sec  
!  Summary  Index  
­ Loses  the  Rich  informaEon  in  data  
!  Report  AcceleraEon  
­ AcceleraEon  is  suspended  as  the  summary  reaches  10%  of  its  total  size   ­ No  Control  on  Summary  Schedule     
24  

Akamai  ApplicaEon  
Data  Models  &  AcceleraEon   Came  to  Rescue  
25  

Data  Models  
Data  Model's  facilitated  to  format,  evaluate  fields  and  work  with  necessary  event   data  for  each  data  set  and  also  accelerate  the  model  
! Data  models  are  made  up  of  object  types  like   lookups,  transacEons,  fields  extracEons  &   Calculated  fields.  
! Data  models  encodes  only  necessary  knowledge   objects.  
! Data  Model  for  each  Property  or  group  of   ProperEes.    
! Objects  by  Success  or  Failure  (HTTP  Status)   ! Add  addiEonal  fields  using  regular  expressions,  eval  
expressions  and  lookups.  
26  

Dashboards  
!  Real  Time  Availability   &  Performance  
!  Origin  Insights   !  Edge  Overview   !  Security   !  Release  Monitoring  
27  

Availability  &  Performance  
Availability   ·    Volume  of  Hits.  
· Success  &  Failure  Volume  by  HTTP   Status.  
· Success  &  Failure  by  GEO  
Performance   ·    Track  total  Eme  for  transacEons.   ·    Origin  Latency  
· Last  Mile  Round  Trip  Time  
28  

Origin  &  Edge  

Origin    
·  M  onitor  traffic  distribuEon.  
· Error  Monitoring.   · Monitor  Latency.  

Edge   ·   Edge  Errors  
· Edge  Performance  stats   · Last  Mile  RTT  

29  

Security  
· Monitor  the  WAF  denies  and  warnings.   · Monitor  Top  Deny  Rules.   · Report  on  the  WAF  warning  triggered.   · Top  deny  &  warning  URL's.   · Deny  &  warn  tracking  by  Geo   · Top  Denied  Client  IP's  
  
30  

Release  Monitoring  

· Monitor  Traffic  by  Origin  /  DC  

· Monitor  Issue's  &  Performance  by   Property  

· Performance  by  Origin  

· Last  Mile  Time  by  Edge  

· Performance  by  GEO  

DC  01  

DC  02  

DC  03  

DC  04  

DC  05  

DC  01  

DC  02  

DC  03   31  

DC  04  

DC  05  

Final  Analysis   and  Q  &  A  

Final  analysis  
!  The  iniEal  business  needs  for  Real  Time  logging  have  been  met:  
­ Real  Eme  monitoring  enables  us  to  know  the  current  state  of  the  site   ­ Dashboards  allow  us  to  track  the  effect  of  site  changes   ­ JSON  data  formaXng  makes  it  easier  to  do  analyEcs  on  the  customer  
experience  
!  The  addiEonal  benefits  are  extremely  valuable:  
­ Custom  fields  to  help  troubleshoot  site  and  code  issues   ­ Header  informaEon  providing  customer  experience  analyEcs  data   ­ Rich  data  set  about  customer  crypto  to  help  with  SHA256  migraEon   ­ Performance  data  on  a  regional  and  network  level  
!  ConEnuing  to  find  new  ways  to  leverage  the  CM  data  in  Splunk  
!  Q  &  A  
33  

THANK  YOU  

