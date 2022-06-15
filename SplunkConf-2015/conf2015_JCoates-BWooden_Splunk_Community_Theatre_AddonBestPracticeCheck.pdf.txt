Copyright  ©  2015  Splunk  Inc.  
Add--on  Best  PracFce   Check  Tool  
Brian  Wooden  
Senior  Engineering  Manager,  Splunk  
Jack  Coates  
Director  of  Product  Management,  Splunk  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements   regarding  future  events  or  the  expected  performance  of  the  company.  We  cauFon   you  that  such  statements  reflect  our  current  expectaFons  and  esFmates  based  on   factors  currently  known  to  us  and  that  actual  events  or  results  could  differ  materially.   For  important  factors  that  may  cause  actual  results  to  differ  from  those  contained  in   our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and   date  of  its  live  presentaFon.  If  reviewed  aRer  its  live  presentaFon,  this  presentaFon   may  not  contain  current  or  accurate  informaFon.  We  do  not  assume  any  obligaFon  
to  update  any  forward  looking  statements  we  may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product   direcFon  and  is  subject  to  change  at  any  Fme  without  noFce.  It  is  for  informaFonal   purposes  only  and  shall  not,  be  incorporated  into  any  contract  or  other  commitment.  
Splunk  undertakes  no  obligaFon  either  to  develop  the  features  or  funcFonality   described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

Agenda  
!  What's  a  Technology  Add--on?   !  Naming  ConvenFons   !  GeYng  Data  In   !  Field  ExtracFon  Techniques   !  Logging  for  TroubleshooFng   !  Data  for  Sample  Events  
3  

What's  a  Technology  Add--on?  
h\p://docs.splunk.com/DocumentaFon/ES/latest/Install/ESArchitecture    
· It's  a  driver  for  non--Splunk  technology  
­ Maybe  gets  data  in,  maybe  sends  commands  out  
· It's  a  knowledge  layer  
­ Definitely  makes  sense  of  the  data  
· Yes,  they're  all  just  app  packages  
­ Standards  that  aren't  code--enforced  are  really  just   guidelines  
· Some  apps  are  bigger  than  others  
­ (Some  apps'  mothers  are  bigger  than  other  apps'   mothers)  
4  

Package  Names  
· The  package  name  is  the  folder  name  and  app.conf  id.    
­ It's  hard  to  change,  so  get  it  right  before  you  publish.   ­ Splunk_TA_$vendor-$product  is  the  format  for  Splunk--supported.   ­ TA-$vendor-$product  is  the  format  to  use  if  you  aren't  in  Splunk  R&D.  
· If  you  use  those,  you'll  be  automaFcally  inherited  into  ES.  
· Use  the  shortest  sensible  name  
· Use  lower  case  
· Try  to  avoid  version  numbers  
­ Follow  this:  h\p://docs.splunk.com/DocumentaFon/Splunkbase/latest/Splunkbase/Namingguidelines    

GOOD Splunk_TA_mcafee Splunk_TA_cisco-asa

LESS GOOD, BUT STILL OKAY TA-Symantec-DeepSight Splunk_TA_flowfix
5  

NOT SO GOOD TA-Damballa-Failsafe-520-v101 TA_opendns

Source  Type  Names  

· The  sourcetype  names  in  props.conf  are  how  knowledge  works  
­ It's  hard  to  change  later,  so  get  it  right  before  you  publish   ê Account  for  backward  compaFbility  with  a  sourcetype  rename  
­ If  you  don't,  your  Add--on  will  have  to  co--exist  with  the  old  one  as  long  as  data  is  stored  
­ Use  vendor:product:feature:format   ê Why  not  underscores?  Why  not  ampersands?  Consistency  is  the  goal  
­ Use  the  shortest  sensible  name   ­ Use  the  lowest  sensible  number  of  sourcetypes   ­ Break  the  rules  if  you  have  to  in  order  to  get  data  in  efficiently  

GOOD cisco:esa:textmail f5:bigip:asm:syslog

LESS GOOD, BUT STILL OKAY cisco_wsa Perfmon:sqlserver:locks
6  

NOT SO GOOD syslog microsoft:lync:general

Event  Type  Names  
· The  event  type  names  in  even\ypes.conf  are  how  CIM  tagging  works  
­ It's  hard  to  change  later,  so  get  it  right  before  you  publish   ê Special  characters  (including  colons)  make  startup  config  tesFng  unhappy  
­ Use  vendor_product_eventtype   ê Consistency  is  the  goal   ê This  format  is  clearly  disFnguished  from  sourcetypes  
­ Use  the  shortest  sensible  name   ­ Use  the  lowest  sensible  number  of  event  types  

GOOD nagios_service_flapping_alert snow_change_request

LESS GOOD, BUT STILL OKAY estreamer_v4 hyperv_host
7  

NOT SO GOOD update vnx:block:SystemCpu

Lookup  Names  
· Lookups  are  a  useful  uFlity  and  a  source  of  confusion  and  errors   · Clear  naming  convenFon  makes  them  easier  to  troubleshoot  
­ The  filename  should  begin  with  a  short  idenFfier  of  the  add--on,  be  descripFve,   and  be  plural.  snort_severities.csv
­ The  transforms  entry  should  be  the  singular  form  of  the  filename  with   _lookup  added.  [snort_severity_lookup]
­ The  props  entry  should  be  descripFve  and  reference  the  add--on.  LOOKUPseverity_for_snort
· Try  for  shorter  names  when  possible,  for  btool's  sake  
8  

Inputs  
· Can  you  control  the  data  that  is  generated?  
­ Review  Splunk's  Logging  Best  PracFces   ­ Time  and  date  entries  should  always  use  ISO  8601  
· OpFmize  Fmestamp  recogniFon  as  much  as  possible   · Always  disable  default  inputs  
­ Principle  of  Least  Surprise:  Enterprise  admins  want  to  turn  it  on  themselves   ­ Add--ons  should  get  deployed  all  over,  but  they  shouldn't  run  everywhere   ­ Document  how  to  turn  them  on  where  input  is  desired  
9  

Dependencies  
· Need  another  Add--on  for  your  input?  Don't  ship  an  inputs.conf  file  
­ Common  dependencies:  DB  Connect,  PowerShell,  Windows,  Unix   ­ Use  inputs.conf.template  to  protect  from  startup  errors   ­ Why  not  a  private  .spec  file?  Because  yours  will  get  out  of  sync  
· Prefer  Modular  Inputs  to  Scripted  Inputs  
­ Why  write  your  own  control  logic?  
· XML  Payload?  Use  a  CDATA  wrapper  
­ Otherwise  special  characters  will  break  the  input  
· Asking  Splunk  REST  endpoints  for  data?  Use  count=0  
­ Otherwise,  it  will  just  return  a  few  data  points  instead  of  all  of  them  
10  

Indexes  Rules  
· Do  not  ship  an  indexes.conf
­ The  customer  needs  to  be  in  control  of  storage  locaFon,  data  retenFon,  role   based  access  security,  and  deployment  techniques  
· Indexes  should  not  be  defined  without  clear  understanding  of  the   target  Splunk  deployment's  
­ Security  goals  &  seYngs  (which  roles  have  access  to  which  indexes,  &c)   ­ RetenFon  goals  &  seYngs  (restricFons  due  to  disk  size,  legal,  compliance,  &c)   ­ Storage  locaFon,  sizes,  and  performance  (local  disks,  NAS,  SAN,  allocated  free  
space,  IOPS,  &c)   ­ Index  configuraFon  management  (deployment  server,  clustering,  puppet,  chef,  
&c)  
· Use  a  macro  in  your  app  so  that  customers  can  edit  
11  

Field  ExtracFons  
· The  more  complex  a  field  extracFon  is,  the  worse   it  will  perform  
· Calling  the  regular  expression  engine  repeatedly   for  simple  tasks  is  be\er  than  calling  it  once  for  a   giant  task  
­ Readability  of  src_port=(\d+)  is  be\er  than    
^\w{3}\s+\d{2}\s+\d{2}:\d{2}:\d{2}\s+\S+\s+(?:\w{3}\s +\d{2}\s+\d{2}:\d{2}:\d{2}\s+)?([^\t]+)\t([^\t]+) \t([^\t]+)\t([^\t]+)\t\"?\d+:\s+([^\t"]+)\"?\t([^\t] +)\t\"?([^\t"]+)\"?\t([^\t]+)\t([^\t]+)\t([^\t]+) \t([^\t]+)\t([^\t]+)\t([^\t]+)\t([^\t]+)\t\"?([^\t"] +)\"?\t([^\t]+)\t([^\t]+)
12  

Field  ExtracFon  Rules  
· Fields  used  in  prebuilt  searches  (even\ype,  savedsearch,  view  or  macro)   MUST  use  staFc  key  value  extracFons  instead  of  variable  keys.  
· Use  the  fastest  field  extracFon  mechanism  that  works  for  the  data.  
· Do  not  use  variable  keys.    
­ DM  AcceleraFon  and  searches  are  slowed  by  an  order  of  magnitude   ­ You  can't  CIM  map  unknown  field  names  anyway  

  

REGEX=([^\s=]+)=+(\S+)

FORMAT=$1::$2

13  

Over--riding  Fields  
· Vendors  like  the  same  field  names  that  we  do.  It  is  to  cry.   · Use  Field  Aliases  to  move  conflicFng  fields  to  vendor_$fieldname
­ FIELDALIAS-vendor_action_for_mcafee_epo=action AS vendor_action
· Use  Lookups  to  resolve  conflicts  
­ LOOKUP-action_for_mcafee_epo=epo_action_lookup vendor_action OUTPUT action
14  

Logging  
· Users  are  taught  to  expect  standard  logging  behavior  from  Splunk  Add-- ons  
­ h\p://docs.splunk.com/DocumentaFon/AddOns/latest/Overview/Troubleshootadd--ons     ­ Write  log  files  to  locaFons  that  Splunk  will  index,  using  Splunk  best  pracFces  for  
Fmestamp  and  format   ­ Set  at  least  one  sourcetype  so  that  you're  not  adding  to  "the  learned  problem"   ­ Write  your  logs  with  levels,  even  if  you  don't  let  the  user  select  levels  yet.  
ê The  standard  levels  are  INFO,  WARN,  ERROR,  and  DEBUG
· Log  your  intent  and  the  outcome  in  the  log  
­ You  want  to  authenFcate  to  a  service?  DEBUG  log  that  you  are  a\empFng  it.     ­ If  it  fails,  ERROR  log  that  it  failed.   ­ If  it  succeeds,  INFO  log  that  you're  authenFcated.  
15  

Sample  Data  and  Customer  Data  
· Don't  send  us  non--anonymized  customer  data  or  include  in  the  Add--on  
­ This  isn't  support,  it's  product  development  ­  different  rules  
· Customer  data  is  normal  data  from  working  systems.  That's  okay  for   operaFons,  but  insufficient  for  security.  
­ Fine  for  INFERENCE,  inherently  insufficient  for  RECOGNITION   ê INFERENCE:  "Frank  never  has  a  second  cup  at  home!"   ê RECOGNITION:  "Frank  bought  a  plane  Fcket  to  Colombia  for  be\er  coffee."  
16  

QuesFons?  
17  

THANK  YOU  

