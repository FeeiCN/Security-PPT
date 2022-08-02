Copyright  ©  2015  Splunk  Inc.  
From  Zero  to     PreGy  Robust     Fraud  DetecJon  Tool  
Tomasz  Dziedzic     
CTO,  Linux  Polska  

Disclaimer  
During  the  course  of  this  presentaJon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauJon  you  that  such  statements  reflect  our   current  expectaJons  and  esJmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaJon  are  being  made  as  of  the  Jme  and  date  of  its  live   presentaJon.  If  reviewed  aTer  its  live  presentaJon,  this  presentaJon  may  not  contain  current  or   accurate  informaJon.  We  do  not  assume  any  obligaJon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiJon,  any  informaJon  about  our  roadmap  outlines  our  general  product  direcJon  and  is  subject  to   change  at  any  Jme  without  noJce.  It  is  for  informaJonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaJon  either  to  develop  the  features  
or  funcJonality  described  or  to  include  any  such  feature  or  funcJonality  in  a  future  release.  
2  

Personal  IntroducJon  
 Tomasz  Dziedzic,  CTO  @  Linux  Polska    IntegraJon  and  ConsulJng  Services  for  Splunk  and  Data  Science    How  we  got  here  and  acknowledgements  
Splunk  Team  @  Linux  Polska   Dariusz  Kwany  ­  Project  Lead  for  Fraud  DetecJon  Tool  
3  

Agenda  
I  will  walk  you  through  a  story  of  fraud  detecJon     effort  made  by  an  investment  bank  from  Poland.     They  took  preGy  straigh]orward  steps  to  address     fraudulent  acJviJes  and  save  $M  in  the  process.  
   Key  take--aways:  
Quick  and  dirty  searches  ­  Go  for  fast  results  under  pressure      (ab)Use  KVStore  ­  op=mize  performance  as  you  gain  speed  
Combining  data  sources  is  always  a  good  idea!    Tools  and  applica=on  change  with  every  new  bit  of  knowledge  (or  die!)  
4  

The  Story    
· One  of  the  bank's  customers  filed  a  complaint  regarding   failed  transfer  that  did  not  reach  the  intended  recipient.  
· InvesJgaJon  started  with  disparate  teams  working     in  parallel.  
· Our  team  applied  applicaJon  log  analysis  using  Splunk.   · ATer  2  days  of  effort  the  iniJal  soluJon  was  formulated  and  
first  few  $M  saved  in  the  process.  
5  

Quick  and  Dirty  SoluJon  to  the  Problem  
index=fds      source=app_log    AcJonRemit.java  INFO  SES_*_*_*  |  rex  field=_raw  ",\d+\s\[\s*(?<sessid>[^\]]+)\]"  |  rex  field=sessid  "SES_(?<login>[^_] +)_"  |  rex  field=_raw  "Customer  account:\s(?<customer_account>\d+)"  |  rex  field=_raw  "Recepient\saccount:\s(?<rcpt_account>\d+)"  |  rex   field=_raw  "Amt:\s(?<amount>[\d\.]+)"  |  rex  field=_raw  "RemitId:\s(?<id_remit>\d+)"  |  rex  field=_raw  "Remit\sTitle:\s(?<remit_Jtle>.+)"  |  rex   field=_raw  "Recipient\sName:\s(?<rcpt_name>.+)"  |  rex  field=_raw  "Date:\s(?<remit_date>.+)"  |  transacJon  sessid  startswith="AcJonRemit.java:   610"  |  join  sessid  [search  index=fds  |  search    NOT  ("/images"  OR  "/styles"  OR  DEBUG)  |  search  AcJonRemit  OR  AcJonStart  OR  AuthAgentService  |   rex  "(for  host|from  host)(?<srcipaddr>[\d\.]+)(\s|$)"  |  rex  ",\d+\s\[\s*(?<sessid>[^\]]+)\]"  |  rex  field=sessid  "SES_(?<sessid2>[^_]+_\d+)_"  |  rex   field=sessid  "SES_(?<login_app>[^_]+)_\d+_"  |  rex  "User\s(?<login_app_logged>[^\s]+)\slogged"  |  eval  login_app_logged=upper(login_app_logged)   |  rex  "AuthAgentService\sreports:\sUser\s\"(?<aas_username>[^\"]+)\""  |  eval  aas_username=upper(aas_username)  |  eval  user=upper(user)  |  eval   login=coalesce(login_app,  login_app_logged,  aas_username,  user)  |  rex  "Customer\saccount:\s(?<customer_account>\d+)"  |  rex  "Recepient \saccount:\s(?<rcpt_account>\d+)"  |  rex  "Amt:\s(?<amount>[\d\.]+)"  |  rex  "RemitId:\s(?<id_remit>\d+)"  |  rex  "Remit\sTitle:\s(?<remit_Jtle>.+)"  |   rex  "Recipient\sName:\s(?<rcpt_name>.+)"  |  transacJon  login  sessid2      startswith="*AuthAgentService  reports:*was  loged--in"  connected=f  |  search   acJonRemitSave  |  stats  count  by  _Jme,  sessid,  srcipaddr  |  table  sessid,  srcipaddr]  |  stats  list(rcpt_account)  as  "Recipient  Account",  list(sessid)  as   "Session  ID",  list(srcipaddr)  as  "IP  Address",  list(id_remit)  as  "Remit  ID",  list(login)  as  "Login",  values(remit_date)  as  "Remit  Date",  list(_Jme)  as  tm,   dc(rcpt_account)  as  "numRcptAccounts"    by  customer_account,  amount,  remit_Jtle,  rcpt_name  |  eval  "Event  Time"=strTime(tm,  "%d.%m.%Y  %H: %M:%S")  |  eval  severity_amount=case(amount<20000,1,  amount<500000,3,  amount>=500000,6)  |  eval   severity_rcpt_account=case(numRcptAccounts==2,6,  (numRcptAccounts==3  OR  numRcptAccounts==4),3,  numRcptAccounts>4,  1)  |  eval   Severity=severity_amount+severity_rcpt_account  |  rename    amount  AS  "Remit  Amount",  remit_Jtle  as  "Remit  Title",  rcpt_name  as  "Recipient   name"  |  where  numRcptAccounts>1  |  lookup  userslookup  customer_account  OUTPUT  NAME1  NAME2  NAME3  NAME4  CUSTOMER_ID  |  eval   "Customer  Name"=if(isnotnull(NAME2),  NAME1."  ".NAME2,  NAME1)  |  eval  "Customer  Address"=if(isnotnull(NAME4),  NAME3.",  ".NAME4,  NAME3)  |   rename  CUSTOMER_ID  as  "Customer  ID"  |  table    "Customer  Name"  "Customer  Address"    "Remit  Amount"  "Remit  Title"  "Remit  ID"  "Remit  Date"   "Recipient  name"  "Recipient  Account"  "Event  Jme"  "Session  ID"  "Login"  "IP  Address",  "Severity"  |  sort  --  "Event  Jme  
6  

And  the  neat  List  of  Suspicious  AcJvity  

$  

Account  numbers  

7  

Source  IPs  

PrimiJve  scoring  

First  Lessons  
· Start  solving  the  problem  with  limited  understanding  and  mature  on  the   way  over.  
· Focus  on  the  most  wanted  issues  and  make  shortcuts  if  needed.   · Leverage  very  Jght  improvement  (feedback)  loop  (plan,  do,  check,  act).   · Engage  in  communicaJon  despite  challenging  environment  and  pressure.   · Excellent  ROI  despite  being:  rough,  inefficient,  absorbing.     
Don't  hesitate.  Start  now!  
8  

First  Weeks  with  New  capability  
Some  frauds  were  prevented  resul>ng     in  several  $M  saved  just  within  first  weeks.  
  
There  were  numerous  issues  though:   · High  false  posiJve  raJo.   · High  operator  overhead  for  fraud  verificaJon  /  invesJgaJon.   · Low  fraud  paGern  coverage.   · Low  operator  flexibility.   · ATer  iniJal  WOW  factor  wore  off  it  suddenly  became  slow!  
9  

There  are  BeGer   Ways  to  do  it!  

What  Do  We  Need?  
· Generic  tool  with  a  more  accurate  user  acJvity  profiling   · Visibility  and  usability   · Filter  out  the  safe  cases   · Highlight  the  obvious  threats   · ConfiguraJon  flexibility  
11  

What  Do  We  Have?  
· The  idea  for  a  way  more  efficient  rules   · ApplicaJon  logs   · Web  access  logs   · Account  whitelist   · Account  blacklist  
12  

Let's  Get  to  Business  
be#er  visibility  +  adequate  rules  =  success  recipe  2.0  
If  we  could  profile  the  whole  user  session  for  acJons  
AND  
If  we  could  track  the  source  IP  
AND  
If  we  haven't  seen  this  IP  yet  in  other  sessions/acJviJes  older  than  X  
THEN  
We  should  look  into  this  acJvity  
13  

ApplicaJon  Log  that  Contains     User  AcJons  Trace  (1/2)  
applicaJon  log  (sourcetype=app_log)  
  
2015--03--02  13:22:55,625  [                  SES_92264_2](          AcJonStart.java:    98)  DEBUG  :  User  AAAAAA  logged  in,  access  to  services:  '000110000'   2015--03--02  13:22:55,693  [SES_BBBBBB_88864_14](          EJBManager.java:311)  DEBUG  :  getCurrencyList()   2015--03--02  13:22:55,694  [SES_BBBBBB_88864_14](    AcJonXYZ.java:473)  INFO    :  setCurrencyList()   2015--03--02  13:22:55,695  [                  SES_89874_2](          AcJonStart.java:  120)  DEBUG  :  Very  detailed  debug  message   2015--03--02  13:22:55,762  [                  SES_89874_2](          AcJonStart.java:  116)  INFO    :  InformaJonal  info  message   2015--03--02  13:22:55,821  [SES_CCCCCC_91026_19](    AcJonAccount.java:  437)  DEBUG  :  execute()  something   ......  

Session  ID  right  before     successfull  authenJcaJon    

AuthenJcated  User  ID  

14  

ApplicaJon  Log  that  Contains     User  AcJons  Trace  (2/2)  
applicaJon  log  (sourcetype=app_log)  

.......  

2015--03--02  13:23:56,220  [SES_AAAAAA_92264_3](      AcJonRemit.java:  610)  INFO    :  Execute  AcionRemit()  

2015--03--02  13:23:56,220  [SES_AAAAAA_92264_3](      AcJonRemit.java:  610)  INFO    :  ElxSorb:  0   2015--03--02  13:23:56,221  [SES_AAAAAA_92264_3](      AcJonRemit.java:  609)  INFO    :  Status:  AI  

Session  ID  aTer   successfull  authenJcaJon    

2015--03--02  13:23:56,222  [SES_AAAAAA_92264_3](      AcJonRemit.java:  608)  INFO    :  Remit  Type:  1  

2015--03--02  13:23:56,223  [SES_AAAAAA_92264_3](      AcJonRemit.java:  607)  INFO    :  Recipient  account:  111111222222233333444445555  

2015--03--02  13:23:56,224  [SES_AAAAAA_92264_3](      AcJonRemit.java:  606)  INFO    :  Recipient  bank:  22223333  

2015--03--02  13:23:56,225  [SES_AAAAAA_92264_3](      AcJonRemit.java:  605)  INFO    :  Amt:  100756.00  

2015--03--02  13:23:56,233  [SES_AAAAAA_92264_3](      AcJonRemit.java:  603)  INFO    :  Recepient  Name:  Ben  Johnson,  Baker  Street  666  

2015--03--02  13:23:56,244  [SES_AAAAAA_92264_3](      AcJonRemit.java:  603)  INFO    :  Recepient  Title:  Salary  for  two  months    

2015--03--02  13:23:56,255  [SES_AAAAAA_92264_3](      AcJonRemit.java:  601)  INFO    :  Date:  2015--03--02  

2015--03--02  13:23:56,277  [SES_AAAAAA_92264_3](      AcJonRemit.java:  599)  INFO    :  AccountId:  1893211  

2015--03--02  13:23:56,291  [SES_AAAAAA_92264_3](      AcJonRemit.java:  598)  INFO    :  RemitId:  79304  

15  

Web  Frontend  Log:  ApplicaJon  Access  

web  server  log  (sourcetype=error)  

  

[02/Mar/2015:13:22:55]  info  (29928):  for  host  190.50.60.1  trying  to  POST  /,  AuthAgentService  reports:  User  "AAAAAA"  was  logged--in  

[02/Mar/2015:13:22:55]  info  (29928):  for  host  190.50.60.1  trying  to  POST  /,  IsCredenJalsValid  reports:  Ace  stub:  securid/check  ret  code:  0,   user:  "AAAAAA"  

[02/Mar/2015:13:22:56]  info  (  6385):  Auth  staJsJcs  reports:  On--line  users:  34  

[02/Mar/2015:13:22:56]  info  (  6385):  for  host  93.234.234.2  trying  to  POST  /,  AuthAgentService  reports:  User  "DDDDDD"  was  logged--in  

[02/Mar/2015:13:22:56]  info  (  6385):  for  host  93.234.234.2  trying  to  POST  /,  IsCredenJalsValid  reports:  Ace  stub:  securid/check  ret  code:  0,  

user:  "DDDDDD"  

[02/Mar/2015:13:22:56]  info  (  7386):  Auth  staJsJcs  reports:  On--line  users:  36   .......  

Source  IP  for  User  ID     and  session  

[02/Mar/2015:13:30:58]  info  (  7386):  for  host  190.50.60.1  trying  to  GET  /.auth,  AuthAgentService  reports:  User  "AAAAAA"  was  logged--out  

[02/Mar/2015:13:45:58]  info  (19748):  InternalCheck  reports:  Session  expired  for  user  "EEEEEE"  connected  from  host  10.2.3.4  

16  

Search  to  Profile  User  Sessions  

  And  highlight  those  from  previously  "unseen"  source  IPs  

index=fds  (sourcetype=error  OR  sourcetype=app_log)  NOT  ("/images"  OR  "/styles")    

filter  iniJal  data  

|  search  AuthagentService  OR  InternalCheck  OR  AcJonStart  $filter_acJon$     |  eval  login=coalesce(login,  login_expired,    login_app_acJon_start,  login_app)    

normalize     login  fields  

|  transacJon  maxevents=3000  connected=t  $filter_keepevicted$  login  sessid                                                                                             startswith="logged--in"  endswith="expired  OR  logged--out"    

build  sessions  

|  search  login=$login$  sessid=$sessid$  

filter  interesJng    

|  rex  "(for  host|from  host)(?<ip>[\d\.]+)(\s|$),,  

sessions  or  logins   extract  source  IPs  

|  join  type=outer  login,  ip  [  inputlookup  fds_ip_lookup  ]  

add  successfull  login  count    

|  eval  new_ip=if(isnull(count),"yes","no")   |  search  new_ip=$filter_new_ip$    

for  login  +  source  IP   enable  filtering     for  source  IP  first--Jmers  

17  

fds_ip_lookup  configuraJon  

Lookup     and  collecJon     definiJon  

$SPLUNK_HOME/etc/$APP_NAME/local/collect.conf  
[fds_ip]   enforceTypes  =  true   field.count  =  number                          #  how  many  successful  logins?     field.ip  =  string                                                #  src  ip  address   field.login  =  string                                    #  login      $   SPLUNK_HOME/etc/$APP_NAME/local/transforms.conf  
[fds_ip_lookup]   collecJon  =  fds_ip   external_type  =  kvstore   fields_list  =  ip,  login,  count  

Config  files  

18  

Populate  and  Update  fds_ip_lookup  

index=fds  latest=--30d  sourcetype=error     |  stats  count  by  login,  srcip     |  outputlookup  fds_ip_lookup  

There  is  highly  unlikely     (this  case  specific  rule)   that  IPs  seen  more   than  30  days  ago     are  used  by  aGackers  

ResulJng  output  is  used     to  refresh  KVStore  collecJon  

19  

Add  Black  and  White  List  InformaJon  

|  lookup  accounts_blacklist  recipient_account  OUTPUT  recipient_account  as  recipient_account_bl  

|  eval  bl_status=if(isnotnull(recipient_account_bl),"onBlackList","notOnBlackList")  

   Combine  your  list  informaJon     wi   th  transacJon  data  
  

*_status  is  used  to  discern     and  make  proper  acJons  later  

|  lookup  accounts_whitelist  recipient_account  OUTPUT  recipient_account  as  recipient_account_wl      

|  eval  wl_account_status=if(isnotnull(recipient_account_wl),"onWhiteList","notOnWhiteList")  

20  

Simple  Account  List  Management  UI  

· Just  enough  to  enable   management  
· Built  using  standard  Splunk   UI  elements  
· Plans  to  add  Javascript     field  validaJon  to  avoid   faulty  account  numbers  in   the  future  
21  

Screenshot  here  

Lower  RDBMS  UJlizaJon  
Customer  details  lookups  are  accelerated  using  KVStore  
  
Runs  once  a  day  to  update     the  KVStore  collecJon  
|  dbquery  customers_accounts_db  "SELECT  ID_ACCOUNT,  NAME1,  NAME2  FROM  prod.customers"   |  outputlookup  clients_kvs_lookup      |  lookup  clients_kvs_lookup  ID_ACCOUNT  OUTPUT  NAME1  NAME2       |  eval  customer_name=if(isnotnull(NAME2),  NAME1."  ".NAME2,  NAME1)  
KVstore  collecJon  is  used     to  supplement  the  transacJon  details  
22  

Success  3.0  and  Beyond  
· Algorithms  based  scoring  for  faster  resoluJon   · AutomaJc  transfer  suspending  for  high  score  events   · IntegraJon  with  external  blacklist  sources   · UI  enhancements  for  Operator  /  InvesJgator  producJvity   · ReporJng  for  wider  business  audience  
23  

PracJce  at  Home  

Approach  to  Maximize  ROI  
Workshop  style  engagement  

Look  for  one  of  three  key  factors:   · Most  troublesome  /  infamous   · Most  money  /  daily  business  involved   · Most  exposed  /  essenJal   If  a  name  rings  more  than  once  you  have   a  good  candidate!  

Go  for  ver=cal     monitoring  /  analysis.   Pick  one  system  or  process   and  model  all  the  way  up.  
Requires  breaking     the  silos  boundaries!  
You  have  been  warned!  

25  

Linux  Polska  Splunk  CapabiliJes  
Now  playing:   sdfs   End  to  End  monitoring  
for  Space  Industry  

Infrastructure   &    
Middleware   &    
Cloud  

Available  on     splunkbase  

26  

Business   oriented  

How  to  Make  the  Most  of  it  
Get  the  data   Focus  on  Your  challenge   Make  a  posi>ve  change  
Again!  
  
27  

QuesJons?  
28  

THANK  YOU  

