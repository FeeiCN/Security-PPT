Copyright  ©  2015  Splunk  Inc.  
Sierra--Cedar's  Best   PracDces  for     Building  a  Security   OperaDons  Center    
Robert  Miller  
Manager  Corporate  Security,   Sierra--Cedar,  Inc.  

Disclaimer  
During  the  course  of  this  presentaDon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauDon  you  that  such  statements  reflect  our   current  expectaDons  and  esDmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaDon  are  being  made  as  of  the  Dme  and  date  of  its  live   presentaDon.  If  reviewed  aSer  its  live  presentaDon,  this  presentaDon  may  not  contain  current  or   accurate  informaDon.  We  do  not  assume  any  obligaDon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiDon,  any  informaDon  about  our  roadmap  outlines  our  general  product  direcDon  and  is  subject  to   change  at  any  Dme  without  noDce.  It  is  for  informaDonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaDon  either  to  develop  the  features  
or  funcDonality  described  or  to  include  any  such  feature  or  funcDonality  in  a  future  release.  
2  

About  Me  
 Sierra--Cedar,  Inc.  
­ One  of  the  largest  independent  North  American  IT  services  companies   ­ Provider  of  full  scale  PeopleSoS  hosDng  services  with  over  50  hosted  clients   ­ Currently  support  over  600  PeopleSoS  environments  and  over  17,000  
concurrent  PeopleSoS  users  
 My  Role  
­ Support  security  and  compliance  acDviDes  for  both  US  and     overseas  operaDons  
­ Manage  five  person  team  located  in  US,  Canada,  and  India   ­ Splunk  CerDfied  Architect,  Computer  Forensics  Analyst,  Computer  
Programmer,  Incident  Response  Manager,  etc.  
3  

Agenda  
 What  problem  are  we  trying  to  solve?    Using  Splunk  App  for  Enterprise  Security  (ES)  to  detect    
malicious  acDvity    Using  Splunk  App  for  Stream  for  targeted  analysis  of  external  threats      DetecDng  malicious  acDvity  using  the  integraDon  of  Splunk  Apps  for  
Stream  and  Enterprise  Security    Takeaways  
4  

What  Problem  Are  We   Trying  to  Solve?  

Scenario  
The  Splunk  App  for  Enterprise  Security  triggers  an  alert  that  traffic  on   your  network  is  communicaDng  with  an  IP  address  from  one  of  your   threat  intelligence  feeds.      
­ What  is  this  traffic?   ­ Did  our  firewalls  block  this  traffic?   ­ Do  we  have  any  tools  capturing  the  traffic  to  give  us  more  informaDon?   ­ How  many  of  these  alerts  are  we  gebng  and  can  our  team  keep  up?  
6  

Before  Splunk  App  for  Stream  
 We  have  enabled  several  free  threat  intelligence  feeds  in  the  Splunk   App  for  Enterprise  Security  
 We  have  created  several  notable  events  that  trigger  when  a  threat   IP  is  idenDfied  
 The  security  team  researches  these  events  to  idenDfy  what  traffic  is   being  received/sent  
­ Currently  a  manual  process  that  involves  several  searches,  dashboards,  etc.   ­ Could  lead  to  conducDng  computer  forensics  
 Security  team  may  coordinate  with  the  network  team  to  setup   packet  captures  in  hopes  of  capturing  session  details  
7  

ASer  Splunk  App  for  Stream  
 Security  team  has  addiDonal  insight  into  network  traffic  that  was  not   previously  able  to  be  captured  
 SelecDve  data  capture  uses  our  Splunk  license  more  efficiently    CorrelaDon  with  other  security  relevant  data  helps  with  quick  
incident  resoluDon  
­ Fast  incident  resoluDon          less  damage  during  a  breach          less  financial   impact  to  the  business  
8  

Using  ES  to  Detect   Malicious  AcDvity  

CorrelaDon  Searches--  CriDcal  to  Detect  Threats  
· There  are  almost  200  pre--built   notable  events  
· Not  all  pre--built  notable  events  will   be  relevant  for  your  environment  
­ Turn  on  searches  one  at  a  Dme  and   determine  relevance  
  
10  

To  Detect  External  Threats  

Account  access,  account  acDvity,  login  ahempts  and  acDvity     searches  were  used  

· Access  ­  Local  Account  Created   · Access  ­  Local  Admin  Account  Created   · AcDvity  from  Expired  User  IdenDty   · Anomalous  Audit  Trail  AcDvity  Detected   · Brute  Force  Access  Behavior  Detected   · Cleartext  Password  At  Rest  Detected   · Default  Account  AcDvity  Detected   · Default  Account  At  Rest  Detected  

· Excessive  Failed  Logins   · Geographically  Improbable  Access  Detected   · InacDve  Account  AcDvity  Detected   · New  User  Account  Created  on  MulDple  Hosts   · Short  Lived  Account  Detected   · Threat  AcDvity  Detected  ­  External  ­  Stream  
Capture   · Threat  AcDvity  Detected  ­  Internal  ­  Stream  
Capture  

11  

Threat  AcDvity--  CorrelaDon  Searches      
We  created  an  inbound,  outbound  "Threat  AcDvity  Detected"  search  
12  

Incident  Review  
 We  used  the  incident  review  dashboard  to  track  all  notable   events  that  are  triggered  
13  

Incident  Review­  Case  Assignments  
· Example  :  Ability  to  assign  an   analyst  to  a  notable  event  
14  

Threat  Intelligence  Downloads  
 We  used  the  out  of  the  box,  free  threat  intelligence  feeds    In  addiDon,  you  have  the  ability  to  add  addiDonal  ones  
15  

Using  Splunk  App  for   Stream  for  Targeted  
Analysis  of     External  Threats    

Our  Benefits  
 Ability  to  capture  database  traffic  without  making  changes  to     the  database  
 All  details  of  traffic  are  in  JSON  format  and  makes  it  easy  to  search    Deployment  is  not  complicated    No  longer  have  to  engage  another  team  to  get  packet  captures    Security  and  IT  OperaDons  use  cases  
17  

Our  Architecture  
· We  are  using  the  local  network   collecDon  architecture  
· Deployed  Splunk_TA_Stream  to  all   universal  forwarders  using   Deployment  Server  
· All  universal  forwarders  need  to   access  server  running  Splunk  Apps   for  Stream  and  Enterprise  Security  
  
18  

DetecDng  Malicious   AcDvity  Using  the  
IntegraDon  of  Splunk  Apps   for  Stream  and    
Enterprise  Security  

ConfiguraDon  Checklist  
 The  Splunk  App  for  Stream  needs  to  be  installed  on  same  server  as   the  Splunk  App  for  Enterprise  Security  
­ Confirm  hardware  specs  
 All  universal  forwarders  need  access  to  server  running  app  
­ Possible  firewall  rule  changes  
 IdenDfy  notable  events  or  create  your  own  to  use  for  stream  capture  
20  

ConfiguraDon  Step  1:  Edit  CorrelaDon  Search  
Use  case:  threat  acDvity  detected  
· Confirm  the  following  fields     are  defined:  
­ src   ­ src_ip   ­ dest   ­ dest_ip  
21  

ConfiguraDon  Step  2:  Edit  CorrelaDon  Search    
Use  case:  threat  acDvity  detected  
· Confirm  checkmark  is  next  to   "Create  notable  event"  
· Scroll  to  "AcDons"  secDon  
­ Place  checkmark  in  "Start     Stream  capture"   ê Choose  protocols  to  capture   ê Choose  amount  of  Dme  for  capture  
22  

ConfiguraDon  Step  3:Confirm  Captures  Are  Working  
 On  Incident  Review  dashboard,  once  new  event  shows  up  navigate   to  the  Splunk  App  for  Stream  
 Click  on  the  Ephemeral  link  
­ All  current  streams  will  show  up  on  this  page   ­ OpDon  to  kill  any  streams  that  are  listed  
23  

How  Does  It  Work?  

Ahacker  Accessing  Network  

Firewall  

Allowed  

IDS/IPS   Allowed  

25  

ES  Notable  Event  Triggers  Stream  Capture  

Notable  Event  Triggered  

hhps://<server>:<port>/en--us/ custom/splunk_app_stream/  

26  

Takeaways  

Why  We  Love  It?  
 AddiDonal  visibility  into  network  traffic    SelecDve  data  capture  limits  license  usage    Targeted  analysis  of  external  threats  with  selecDve  data  capture    Doesn't  require  a  change  control  process  to  a  server/  
network  appliance    No  longer  need  to  use  3rd  party  tools  to  read  packet  captures    AddiDonal  logs  in  a  centralized  locaDon  to  help  with    
intrusion  detecDon  
28  

Recap  of  Takeaways  
 Make  sure  all  your  logs  are  CIM  compliant    Depending  on  your  environment,  choose  the  correct    
collecDon  architecture    When  first  starDng  off,  disable  all  streams  in  the  "defaultgroup"    All  universal  forwarders  need  to  access  server  running    Splunk  App  
for  Enterprise    Security  and  Splunk  App  for    Stream  
29  

What's  Next  for  Us?  
 Add  Splunk  App  for  Stream  collecDon  to  addiDonal     correlaDon  searches  
 Look  at  possibly  having  Splunk  App  for  Stream  running  24/7  for   certain  protocols  and/or  groups  of  servers  
 Extend  the  capture  Dme  from  15  minutes  to  a  longer  interval  
30  

QuesDons?  
31  

THANK  YOU  

