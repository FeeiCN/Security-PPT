Copyright  ©  2015  Splunk  Inc.  
DetecHng  Bank     Accounts  Takeover   Cyber  ALacks  with   Splunk  >  
Gleb  Esman  
Consultant,  Financial  Services  Firm   Since  08/15  Sr.  Product  Manager,  Splunk  

Copyright  ©  2015  Splunk  Inc.  
DetecHng  Bank  Accounts  Takeover                           Cyber  ALacks  with  Splunk  >  
Session  materials,  raw  code  snippets,  arHcles  and   updates  are  available  at  my  blog  at:   h"p://www.mensk.com  

"Be$er  to  learn  about   your  fraud  events  from   Splunk  than  from  CNN"  

Disclaimer  
During  the  course  of  this  presentaHon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauHon  you  that  such  statements  reflect  our   current  expectaHons  and  esHmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaHon  are  being  made  as  of  the  Hme  and  date  of  its  live   presentaHon.  If  reviewed  aXer  its  live  presentaHon,  this  presentaHon  may  not  contain  current  or   accurate  informaHon.  We  do  not  assume  any  obligaHon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiHon,  any  informaHon  about  our  roadmap  outlines  our  general  product  direcHon  and  is  subject  to   change  at  any  Hme  without  noHce.  It  is  for  informaHonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaHon  either  to  develop  the  features  
or  funcHonality  described  or  to  include  any  such  feature  or  funcHonality  in  a  future  release.  
4  

Bonus  Disclaimer  
I  cannot  disclose  any  specifics  about  operaHons  of  security  divisions     of  any  clients.  
5  

Session  Purpose  
          To  teach  how  Splunk  can  be  used  as  a  custom  security  tool  to  detect       account  takeover  cyber  a$acks.  
Benefits  
· Near  real  Hme  detecHon  of  ATO  aLempts   · Proven  and  moved  into  producHon  deployment   · Suitable  for  any  type  of  business  with  web  presence   · Quick  (~2--3  weeks)  from  zero  to  deployment   · Works  with  any  type  of  data  formats  

IntroducHon  
· In  a  number  of  cases  the  Splunk--based  soluHon  described  here  was  able  to   detect  ATO  aLacks  beLer  than  any  other  commercially  deployed  anH--fraud   security  system.     
· This  soluHon  described  can  be  applied  to  many  industry  verHcals  and   enterprises:  financials,  e--commerce,  insurance,  healthcare,  educa;on     and  others  to  provide  an  extra  layer  of  protecHon  to  clients  and    
customer  accounts.  

Abstract  
· What  is  Fraud?  What  is  Account  Takeover  aLack?   · Define  task  to  detect  account  takeovers  with  Splunk   · Implement  summary  index  of  logins  data   · Build  final  scheduled  search  to  detect  ATOs   · Step  by  step  explanaHons   · Minimizing  false  posiHves   · Bonus:  Detect  more  sophisHcated  aLacks  with  Splunk!  

Personal  IntroducHon  
 1990's:  Israeli  anH--virus  research  and  development  company      2000's:  IBM  T.  J.  Watson  Research  Center  /  anH--virus  /  development  of  heurisHc  anH--malware  virtual  
machines  to  detect  known  and  unknown  malware    Till  July,  2015  --  Consultant,  Financial  Services  Firm,  Montreal    Since  August,  2015  ­  Sr.  Product  Manager  at  Splunk  /  AnH--Fraud  Products,  San  Francisco    While  at  Financial  Services  Firm:    
--  Leading  an  effort  to  uHlize  Splunk  as  anH--fraud  plajorm  for  online  banking.   --  Single  screen  fraud  invesHgaHon  dashboard  with  detailed  drilldowns.   --  Custom  fraud  analyHcs,  threat  intelligence  feeds  correlaHon  and  ATO  detecHon.     --  Managing  firm--wide  IBM  Tealeaf  AnalyHcs  system  deployment  and  working  closely  with  strategic   security  and  e--Fraud  teams  to  build  soluHons  helping  to  detect  and  invesHgate  fraud.   --  Opportunity  to  build  highly  tuned  security  soluHons  on  top  of  a  mountain  of  financial  and  retail   banking  data.  
9  

What  is  Fraud?  
Decep;on  
IntenHonal  DecepHon   IntenHonal  DecepHon  of  a  person  or  enHty   IntenHonal  DecepHon  of  a  person  or  enHty  by  another   IntenHonal  DecepHon  of  a  person  or  enHty  by  another  made  for  gain   IntenHonal  DecepHon  of  a  person  or  enHty  by  another  made  for  monetary  or  personal  gain   IntenHonal  DecepHon  of  a  person  or  enHty  by  another  made  for  monetary  or  personal  gain  or  to  
cause  a  loss  to  another  party  
What  is  Accou     nt  Takeover?  
Account  takeover  fraud  occurs  when  someone  other  than  the  authorized  account  holder     gains  access  to  an  exis;ng  account.  
10  

Consequences  of  Account  Takeover  Cyber  ALacks:  
· IdenHty  theX,  personal  and  confidenHal  informaHon  loss   · Damages  to  client  confidence  levels   · Significant  business  losses  due  to  liHgaHon   · Hurjul  to  brand  integrity,  business  and  industry  reputaHon   · Losses  due  to  business  disrupHon  to  miHgate  consequences   · Significant  monetary  damages  

What's  Happening  
§ Valid  clients  credenHals  fallen  into  hands  of  bad  guys  through   phishing  aLacks,  malware,  spyware.  Resold  on  a  black  markets  
§ Bad  guys  are  trying  to  take  over  clients  accounts  and  steal  money   (via  wire  transfers,  fraudulent  bill  payments),  run  fraudulent   securiHes  trading  (pump  and  dump  schemes)  
§ Best  Hme  to  neutralize  aLack  is  at  the  first  line  of  defense  ­   detecHng  aLacker  during  the  iniHal  login  aLempts  before  damage     is  done  
§ Why  Splunk?  Access  to  all  data  already  
12  

How  to  Detect  ATO  ASAP?  
What  aLackers  do?  
When  batch  of  client  credenHals  leaks  into  black  markets     aLackers  will  start  tesHng  credenHals  and  quite  oXen  mulHple   user  accounts  are  accessed  from  the  same  IP  address  or  subnet  
What  do  we  need  to  detect  and  stop  aLacks?  
· Data  sources  ­  as  close  to  real  Hme  as  possible   · Regular  IIS/Apache/Web  logs  might  not  be  enough  ­  need  
username  field  present  +  HTTP  headers,  cookies  data   · Ideal:  Splunk  Stream  or  similar  real  Hme  data  sources  (Extrahop)  
13  

Seong  up  Automated  AlerHng  on  ATO  
Defini;on  of  task,  Itera;on  1  
· Alert  if:   Mul2ple  clients  accounts  are  being  "touched"  by  an  unknown  IP  address   (never  used  by  the  client)  *and*  by  an  unknown  browser  (USER_AGENT   never  used  by  the  client).    
· Poten;al  problems:  
· ALacker  may  try  to  change  IP  address  frequently.  Easiest  to  change  IP  within  the  same  subnet:   123.45.6.0/24  
· ALacker  might  happen  to  use  the  same  browser  that  legiHmate  client  does   · False  posiHves:  financial  services,  aggregators,  corporate  accounts  might  "behave"  in  the  same  
way  as  aLacker  does   · Need  to  have  clearly  defined  Hme  ranges  and  trigger  limits,  at  least  iniHally  
14  

Seong  up  Automated  AlerHng  on  ATO  
Defini;on  of  task,  Itera;on  2  
· Alert  if:   At  least  5  client  accounts  are  being  "touched"  by  the  same  IP  subnet  (N.N.N.0/24)   within  1  hour  --   AND  at  least  75%  of  total  accounts  touched  have  never  been  accessed  from  this   subnet  *and*  never  by  this  browser  (USER_AGENT)  within  the  last  45  days.    
· "Touched"  means  a$empted  to  log  into,  regardless  of  success.   · Poten;al  problems:  
· ALacker  may  try  to  change  IP  address  frequently    using  subnet  instead  of  fixed  IP   · ALacker  might  happen  to  use  the  same  browser    allowing  for  25%  browser  match   · False  posiHves:  financial  services,  aggregators  ...  will  u;lize  specific  whitelists   · Need  to  have  clearly  defined  Hme  ranges  and  trigger  limits  done  
15  

Seong  up  Automated  AlerHng  on  ATO  
How  ATO  email  alert  looks  like:  
16  

Seong  up  Automated  AlerHng  on  ATO  
Implementa;on  of  task   Splunk  query  needs  to:  
1. Scan  most  recent  1  hour  of  access  log  data  and  find  the  list  of  subnets  that  tried  to   access  mulHple  (>=5)  accounts  within  that  hour.  
2. For  each  of  these  accounts  ­  take  username,  IP,  USER_AGENT  and  scan  previous   45  days  of  traffic  history  to  find  if  any  of  these  usernames  has  never  been  touched  by   this  IP/USER_AGENT  combo.  
3. Alert  if  number  of  found  accounts  is  above  75%  threshold  per  subnet.     
Problem:  #2  will  take  prohibiHvely  long  Hme.     Solu;on:  need  to  build  summary  index  of  client  logins  events  
17  

Seong  up  Automated  AlerHng  on  ATO  
Building  summary  index  of  client  logins.  Assump;ons:  
 You  have  your  WEB  logs  with  all  the  event  data  indexed  in  Splunk   already.  All  web  events  are  located  within  index  named:  logs.  
 Field  names  (or  aliases):  
· HTTP  request  method  (GET,  POST,  HEAD,  etc..):  method   · URL  of  page  accessed:  page   · Username  field:  username   · IP  Address  of  visitor:  ip   · Browser  USER_AGENT  value:  ua     
18  

Seong  up  Automated  AlerHng  on  ATO  
Crea;ng  summary  index:  
19  

Seong  up  Automated  AlerHng  on  ATO  
Crea;ng  summary  index  (cont'd):  
1. Navigate  to    your  Splunk  instance   2. Click  on:  Seongs  -->  Indexes  and  then  click    
[New]  buLon   3. Type  the  name  of  your  summary  index,  such  as  
"summary_logins"   4. Press  [Save]  buLon   5. Next:  need  to  create  scheduled  summarizing  
search  to  push  data  into  summary  index  at   regular  intervals   6. Run  fill_summary_index.py  script  to  backfill   summary  index  with  previous  data  
20  

Seong  up  Automated  AlerHng  on  ATO  
Crea;ng  summarizing  search:  
1. Navigate  to    your  Splunk  instance   2. Click  on:  navigate  to:  Seongs  -->  Searches,  
Reports  and  Alerts   3. Click  [New]   4. Fill  the  rest  according  to  this  image   5. Press  [Save]   6. Note:  Actual  search  query  is  below:  
index=logs  method=POST  page=/Login.aspx   |  eval  username_lower=lower(username)   |  dedup  username_lower,  ip,  ua   |  eval  ip_subnet=ip   |  rex  mode=sed  field=ip_subnet  "s/^(\d+\.\d+\.\d+\.).*/\1x/g"   |  fields  _time,  ip,  ip_subnet,  username,  username_lower,  ua   |  fields  --  _raw  
21  

Seong  up  Automated  AlerHng  on  ATO  

Summarizing  search/  explanaHons  

index=logs  method=POST  page=/Login.aspx   |  eval  username_lower=lower(username)   |  dedup  username_lower,  ip,  ua   |  eval  ip_subnet=ip   |  rex  mode=sed  field=ip_subnet  "s/^(\d+\.\d+\.\d+\.).*/\1x/g"   |  fields  _time,  ip,  ip_subnet,  username,  username_lower,  ua   |  fields  --  _raw  
Note:  we  need  to  backfill  summary  index   with  historical  events  using  script:     
%SPLUNK_HOME%/bin/splunk  cmd  python   fill_summary_index.py  --app  your--app--name  --name   "Summary:  logins"  --et  --45d  --lt  --1h@h  --dedup  true  -- j  4  --owner  admin  --auth  admin:PasSw0rD  

What  it  does:  
 Uses  index=logs  to  pull  all  WEB  traffic  data.  This  assumes  that   indexed  data  already  contains  either  fields  or  aliases:   username,  ip,  ua,  page  and  method.  
 Considers  only  login--specific  events  by  this   query:  method=POST  page=/Login.aspx   This  of  course  needs  to  be  modified  using  specifics  of  your   applicaHon.  
 Lowercased  username  is  created  because  username  usually  is   not  case  sensiHve  field  and  users  may  type  it  differently:   |  eval  username_lower=lower(username)  
 All  hourly  login  events  are  deduplicated:  dedup   username_lower,  ip,  ua  
ip_subnet  field  is  created.  If  input  IP  address  looks  like  this:   12.3.45.67  then  ip_subnet  will  take  this  value:  12.3.45.x  
 Then  we  specify  which  fields  we  want  to  send  to  our   summary  index  and  exclude  original  _raw  field  (which  is  huge   and  unnecessary  to  keep).  

22  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  Reminder:  
1. We  need  to  find  set  of  events:  mulHple  logins  originated  from  the     same  subnet  
2. Run  custom  search  per  each  found  login:  search  for  previous  IP/ USER_AGENT  matches  for  username  
3. If  no  historical  matches  found  ­  add  it  to  results   4. If  number  of  results  per  subnet  exceed  threshold  (75%)  ­  alert!  
Challenges:         --  #2  ­  Need  somehow  to  run  very  custom  search  per  each  event   --  #3  ­  Need  to  return  result  only  if  no  matches  returned  by  #2  
23  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  Advanced  NegaHve  Look  Behind  Query:  
 ADVANCED  ­  ability  to  run  very  customized  query  per  each  found  event  within  subsearch.   This  is  an  upgrade  from  normal  subsearch  where  outer  search  just  uses  simple  AND  or  OR  logic  on  fields   returned  by  subsearch.  TradiHonal  subsearch  allows  for  some  minor  customizaHons  via  format  parameter.   But  we  want  more  than  that.  
 NEGATIVE  ­  ability  to  return  result  signifying  *no  results  found*.  Or:  return  "no  matches"  if  there  are  one  or   more  results  found.  This  covers  the  case  of:  "search  for  login  event  for  given  `username'  where  either  IP   subnet  or  USER_AGENT  (or  both)  are  matching  the  input".  If  *not  found*  ­  return  some  sort  of  flag  showing   possibly  suspicious  account  acHvity  for  given  username/ip/user_agent.  
 LOOK  BEHIND  ­  ability  to  search  historical  data  ­  in  our  case  45  days  worth  of  historical  `summary_logins'   data  for  each  matching  event  within  subsearch.  
 QUERY  paLern  --  Splunk  allows  to  return  actual  query  to  the  outer  search  from  subsearch:     
main  search    [  sub  search  ...  |  eval  search="very  custom  search"  |  fields  search]  ...                    Evolves  to:      main  search      very  custom  search  
24  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  CreaHng  main  alert:  
· Navigate  to  Seongs  -->  Searches,  Reports     and  Alerts  
· Click  [New]  buLon   · Fill  in  the  form   · See  contents  of  Search  in  the  next  slide...  
25  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search  
26  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  Macros  used  
Macros  are  used  to  configure  "variables"  that  you  can  use  to  tune  how  alerHng  query  will   operate.  The  following  macros  are  defined:  
· `anlb_latest_hour_timerange`:   [search  index=summary_logins  report=summary__logins  latest=now  |  head  1  |  eval   search="_time>"+tostring(_time--4000)+"  _time<="+tostring(_time--0)  |  fields  search]   Note:  this  will  allow  to  "use  last  hour  of  available  data"  vs.  "last  hour  from   now"   Alternatively  you  may  use:    earliest=--1h@h  latest=now  
· `anlb__lookbehind_timerange`   earliest=--45d@d  latest=--1d@d  
· `anlb_percent_unmatched_threshold`   75  
· `anlb_ua_field`   ua  
27  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  Macros  used  (conHnued)  
· `anlb_usernames_touched_threshold`:   5   This  is  the  trigger  threshold  for  the  number  of  accounts  simultaneously  accessed  by  the  same  subnet  
· `iplocation(1)`   eval  Country="Unknown"  |  iplocation  allfields=1  $field_ip$  |  eval   Country=if(Country="United  States",  "USA",  Country)  |  eval  Location=Region+"  --   "+City   Creates  more  friendly  Country/Region/City  fields  
· `exclude_whitelist`   ip!=123.45.6.78  ip!=234.5.67.0/24   This  macro  defines  whitelist  to  exclude  from  all  searches.  In  this  case  I  showing  you  a  sample  of  excluding  single   IP  as  well  as  range  of  IP  addresses  defined  by  CIDR  mask  
28  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  ExplanaHons:  
· The  Final  BIG  query  consist  mostly  of  big  subsearch  yielding  yet  another  nested  subsearch.  There   is  no  main  query!  Splunk  though  insist  that  main  query  needs  to  be!  Ok,  so  i  fed  the  monster  this   "main  query":     index=ERRATIC  sourcetype=ERRATIC  source=ERRATIC     This  way  Splunk  will  happily  return  zero  results  and  get  into  the  subsearch  business  ­  where  all   the  magic  happens  
· This  fragment  finds  all  subnets  that  tried  to  access  mulHple  accounts  within  the  last  hour  of   *available  data*.  If  found  ­  it  returns  the  set  of  events  for  each  aLempted  access  with  fields:     ip,  ip_subnet,  username_lower,  ua.  
29  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  ExplanaHons  (conHnued):  
The  best  piece  of  the  whole  query!  For  each  event  (found  at  the  step  previously  described)  it  assembles  custom   search  query  to  be  run  against  summary  index  of  logins  history.     First  fragment  of  this  search  appends  the  event  with  the  values  of  username_lower,  ip,  ip  subnet  and  user  agent   (named  a  bit  differently)  +  very  important  field:  previous_match_found  with  value  of  0.     Second  piece  of  search  calls  appendcols  verb  with  subsearch  to  be  looking  into  summary  index.  If  anything  was   found  ­  previous_match_found  will  become  1  ­  thanks  to:  ...  |  head  1  .     Please  note  that  this  search  is  defined  and  assembled  here  as  pure  string.     Later  on  it  will  be  returned  out  from  the  main  subsearch  to  be  executed  directly.  
30  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  ExplanaHons  (conHnued):  
This  fragment  glues  all  event--specific  searches  into  one,  big--***  search  string.   This  is  what  returns  out  from  main  subsearch  back  into  main  search.  If  you  have  lots  of  matches  ­   the  thing  returned  will  be  humongous  ­  but  nevertheless  preLy  high  performing  
31  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  ExplanaHons  (conHnued):  
This  fragment  evaluates  value  of  previous_match_found  field  and  checks  thresholds  that  are  all   defined  within  macros.  We  are  only  interested  in  suspicious  matches  exceeding  threshold  values.  
32  

Seong  up  Automated  AlerHng  on  ATO  
The  Final  BIG  search.  ExplanaHons  (conHnued):  
The  rest  of  the  search  defines  few  new  fields  to  be  returned  into  the  main  table,  such  as  raHo  of   "Unseen/Total"  and  other  explanatory  fields  that  helps  to  make  alert  email  easily  readable.   If  suspicious  acHvity  is  detected  ­  the  alert  email  will  be  sent  to  the  email  addresses  specified  in  alert   definiHon.  If  nothing  bad  detected  ­  search  will  return  zero  results  and  no  alert  will  be  generated.      Please  note  that  now  you  may  adjust  thresholds  within  the  macros  without  ediHng  main  alert   definiHon.  
33  

Seong  up  Automated  AlerHng  on  ATO  
Detected  ATO  a"ack  email  alert  (reminder):  
34  

Tuning  
Adjust  limits.conf  to  prevent  possible  subsearch  Hmeouts:  
 Add  this  to:  %SPLUNK_HOME%/etc/apps/your--app/local/limits.conf  
[subsearch]   maxtime  =  600      [join]   subsearch_maxtime  =  600   subsearch_timeout  =  800  
 Average  runHme  of  ATO  alerHng  query:  120--180  seconds.      Above  seongs  were  sufficient  to  handle  traffic  of  5,000,000  hits/day    
and  up  to  5  new  client  web  sessions  per  second.    Make  sure  to  adjust  values  of  macros  to  tune  alert  triggers  thresholds  to  
beLer  match  specifics  of  your  business  and  traffic  paLerns.  
35  

False  PosiHves?  
 Add  IP  ranges  of  aggregators,  large  corporate  automated  systems,  etc..  into   `exclude_whitelist`  macro.  
 Current  average  rate  of  false  posiHves:  0--5  alerts  per  day.    Most  (95%)  of  false  posiHves  ­  when  client  uses  new  computer,  at  a  new  
locaHon  and  forgot  his  username  (trying  mulHple  variaHons  of  his  own   username).     
36  

Recap  of  5  Take--Aways  
 SoluHon  described  was  able  to  detect  and  alert  on  bank  account  takeover   aLempts  beLer  and  faster  than  any  other  security  tools  
 In  a  number  of  cases  ­  Splunk  ATO  alert  was  the  only  tool  that  detected   aLempted  fraud  
 Splunk  right  out  of  the  box  can  easily  be  turned  into  efficient  and  flexible   fraud  detecHon  and  security  analyHcs  framework  
 Splunk  can  generate  and  execute  it's  own  searches  very  efficiently    The  more  data  ­  the  beLer  
Full  descripHon  of  soluHon  +  source  code:   h"p://www.mensk.com/ato1  
37  

DetecHng  More  SophisHcated  Fraudsters  
Bonus  Material  
Above  method  detects  65--90%  of  ATO  a"acks  
  What  it  does  not  detect:   · ALacks  spread  across  different  IP  subnets.  Launched  via  botnets   · ALacks  iniHated  on  a  single  user/client  account   · ALacks  iniHated  from  vicHm's  IP  or  subnet:  
disgruntled  employee,  family  member,  caregiver,  malware  
38  

DetecHng  More  SophisHcated  Fraudsters  
Bonus  Material  (conHnued)  
SoluHon?  CumulaHve  behavior  risk  scoring  
1. Calculate  baseline  of  typical  customer  session  behavior  and  assign  risk  score     to  anomalies  
2. Define  customer  session  ac;vi;es  with  above  zero  risk  and  assign  risk  scores  to   risky  ac;ons  as  well  as  to  digital  forensic  data:   --  Session  hits  than  may  cause  money  movements,  profile  and  password  changes,   securiHes  trading,  unusual/unseen  IP  address  and  browser  User  Agent.  Add  risk   scores  to  Hming  between  login  and  risky  acHons,  as  well  as  to  order  or  acHons  
3. Calculate  session  risk  score  and  alert  on  broken  thresholds  
39  

DetecHng  More  SophisHcated  Fraudsters  
Bonus  Material  (conHnued)  
Actual  implementaHon  steps:  
1. Generated  summary  index  of  all  user  sessions  for  reference  with  past   2. Generated  secondary  summary  index  of  session  metrics  for  each  4--hour  
window  (total  average  hits  per  session,  total  average  session  duraHon)   3. Created  scheduled  search  /  alert  to  calculate  cumulaHve  risk  score  of  
each  session  within  1  hour  sliding  window  
40  

DetecHng  More  SophisHcated  Fraudsters  
Bonus  Material  (conHnued)  
Actual  implementaHon  steps:  SPL  template:  
index=logs  ..  |  transaction  session_id  ..        |  eval  riskscore=0  |  eval  riskmsg=0  ..   |  eval  test=mvfind(xpages,  "(?i)/updatepassword")  |  eval  addscore=20       |  eval  riskscore=if(isnull(test),  riskscore,  riskscore+addscore)         |  eval  riskmsg=if(isnull(test),  riskmsg,  riskmsg+"|(+"+addscore+")  Password  update  detected!")      |  ..test  for  more  risky  actions  to  add  to  total  session  risk  score..      |  where  riskscore>=95     |  table  _time,  ip,  riskscore,  riskmsg,  ..  
  
41  

DetecHng  More  SophisHcated  Fraudsters  
Bonus  Material  (conHnued)  
Actual  implementaHon  steps,     Detailed  descripHon  +  source  code:  
   hLp://www.mensk.com/ato2     
42  

Credits  and  InspiraHons:  
· Mica  Roth--Mar;n  ­  Splunk  Global  Accounts  Manager   · Jeff  Champagne  ­  Splunk  Professional  Services  Team   · Rob  Perdue  ­  8020  Labs,  .Conf2014  presenter  /  DetecHng  Fraud  with  Risk  Scoring  

THANK  YOU  
Gleb  Esman  
  
Blog,  source  code  and  updates:   h"p://www.mensk.com/   LinkedIn:   h"ps://www.linkedin.com/in/glebesman/  

QuesHons?  
  
Note:  Birds  of  Feather  sessions  for     security  and  fraud  discussions:      Thursday,  Sep  24th:  11:00--14:00  
45  

