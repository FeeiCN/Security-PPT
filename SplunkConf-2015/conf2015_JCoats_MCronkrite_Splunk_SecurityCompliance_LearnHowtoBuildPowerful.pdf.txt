Copyright  ©  2015  Splunk  Inc.  
Learn  How  to  Build   Powerful  Correla3on   Searches  in  Splunk   Enterprise  Security   With  Extreme  Search  
Macy  Cronkrite  
Professional  Services,  Splunk  
Jack  Coates  
Product  Management,  Splunk  

Disclaimer  
During  the  course  of  this  presentaDon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauDon  you  that  such  statements  reflect  our   current  expectaDons  and  esDmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaDon  are  being  made  as  of  the  Dme  and  date  of  its  live   presentaDon.  If  reviewed  aPer  its  live  presentaDon,  this  presentaDon  may  not  contain  current  or   accurate  informaDon.  We  do  not  assume  any  obligaDon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiDon,  any  informaDon  about  our  roadmap  outlines  our  general  product  direcDon  and  is  subject  to   change  at  any  Dme  without  noDce.  It  is  for  informaDonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaDon  either  to  develop  the  features  
or  funcDonality  described  or  to  include  any  such  feature  or  funcDonality  in  a  future  release.  
2  

Personal  IntroducDon  

 Macy  Cronkrite,  Splunk    Professional  Service  Consultant    Public  Sector  Team    Chief  Meme  Officer  

 Jack  Coates,  Splunk  
 Director  of  PM  
 ES  PM,  2.0  to  3.0  
 Now  focused  on   "GeXng  Data  In     and  Out"    
­ Add--ons,  UDliDes,     &  Other  

3  

Big  Data,  AnalyDcs,  and  Security  
"We  talk  about  the  need  for  analyDcs  and  business  intelligence  to  help   the  business  make  be_er  business  decisions.  It  is  Dme  to  bring  this  same   technology  to  the  informaDon  security  department.         
What  we  need  is  ac3onable,  priori3zed  and  risk-- based  insight  from  this  sea  of  informaDon.  There  are  some  
emerging  uses  cases  for  informaDon  security  which  can  only  be  handled   with  big  data  capabiliDes."  
InformaDon  Security  is  Becoming  a  Big  Data  Problem,     Neil  MacDonald,  Gartner,    April  12,  2011  
4

Agenda  

 How  correlaDons  work  in  Enterprise  Security:    
­ Common  InformaDon  Model   ­ Assets  and  IdenDDes   ­ Risk  Scoring  Framework  
 What  is  Extreme  Search  
­ Concepts  and  Contexts   ­ Use  human  semanDc  phrases  to  frame  security  quesDons     
 EXTREEEMEMEMEEEEEEEE  
­ Discover  and  Manage  security  trends     ­ Assess  changes  to  enterprise  risk  exposure  by  segments  of  assets  and  users.  

  

5  

Splunk  for  Enterprise  Security  3.3+  
FoundaDonal  Knowledge  of  Enterprise  environment    Common  InformaDon  Model    Assets   · IdenDDes   · Risk  Framework     · Security  Posture  Domains  ­  Access,  Endpoint,  Network,  Threat  
6  

Extreme  Search  ­  A  Concept  
QualitaDve  SemanDc  Term    A  concept  is  a  "QualitaDve  SemanDc  Term"...  meaning  a  rich  
descripDve  adjecDve  or  adverb  that  is  associated  with  a  field    A  "SemanDc  Term"  comes  from  data  models...  the  a_ributes  (fields)  
of  a  data  model  are  also  known  as  SemanDc  Terms    Concepts  add  qualitaDve  descripDons  to  these  a_ributes  
7  

Extreme  Search  ­  A  Context  
 A  collecDon  of  concepts  that  are  applied  to  a  field  (a_ribute)  is   known  as  a  context  
8  

Data  Models  ­  SemanDc  Concepts  
 The  fields  of  an  event  (or  a  data  model)  are  called  a_ributes  or   SemanDc  Terms>>>  
 If  you  want  some  descripDve  term  for  a  field,  you  create  a   concept....  (a  concept  is  also  known  as  a  qualitaDve  semanDc  term)  
 A  collecDon  of  concepts  that  describe  a  field  is  known  as  a  context  
9  

Context  Types  
Data,  User,  Anomaly,  Crossover    
 Contexts  can  model  different  types  of  data....  they  can  be:    Data  Driven:    run  calculaDons  against  real  data  to  build/update  a  context    User  Defined:    build  a  context  based  on  what  you  *think*  the  data  
distribuDon  should  be    Anomaly  Driven:    build  a  context  based  on  what  value  are  outliers  vs  what  
values  are  typical    Crossover  Driven:    build  a  context  based  on  the  "crossover"  points..  usually  
generated  by  staDsDcs    These  contexts  are  reduced  models  of  large  volumes  of  data...    To  use  all  this,  you  can  create  conceptual  searches....  
10  

Not  Your  Boo  
 NOT  BOOLEAN    A  boolean  query  says  "show  me  all  of  the  events  that  MATCH    
this  query"    A  conceptual  query  says  "show  me  all  of  the  events  that  are  
COMPATIBLE  WITH  this  query"    This  is  a  key  difference...  compaDbility  gives  you  a  range...  
11  

STD  DEV  is  ok  Not  Great  
 For  example,  you  might  want  to  get  all  of  the  events  with  a  high  std  dev.    A  boolean  query  might  be  "|  where  stdev  is  >=  2.0"    If  your  std  dev  is  1.97,  it's  not  2,  so  any  std  dev  not  at  least  2.0  will  fail...  
 However,  with  a  conceptual  query,  that  wouldn't  be  the  case    A  conceptual  query  might  be  "|  xsWhere  stdev  is  at  least  2.0"    All  of  the  events  that  are  COMPATIBLE  with  this  query  are  returned,  with  a  
new  field  added,  xsWhereCIX  
12  

XS  WHERE  CIX    
COMPATIBLE     xsWhereCIX  Is  the  number  that  shows  how  compaDble  an  event  is   with  the  query,  so  you  can  rank  the  results  if  necessary    A  be_er  conceptual  query  might  be  "...  |  xsWhere  stddev  is  at     least  high"    Why  use  this?    because  what  you're  really  asking  for  is  "show  me  all   the  events  that  have  a  high  standard  deviaDon"  
13  

EXTREEEEEMEEEEEEE!!!!!  
 |  tstats  allow_old_summaries=true  count  from   datamodel=Intrusion_DetecDon  by  IDS_A_acks.signature  
   |  `drop_dm_object_name("IDS_A_acks")`      |  xswhere  count  from  count_by_signature_1h  in  ids_a_acks  by  
signature  is  above  medium  
 This  says  show  me  all  of  the  signatures  over  the  last  hour  where  the   count  by  signature  is  above  medium  
 The  query  is  different  from  a  boolean  query  
14  

MALWARE  
NO  BOOLEAN  HERE  BABY  
 You  can  create  different  contexts  based  on  different  values  of  fields  in  an  event....  for  example,  you  might  create  a  Context  that  describes  the  count  of   malware  violaDons  per  day  (signature_count_1d)....  
 However,  there  are  many  different  types  of  signatures  and  each  can  have  a  different  range  of  values...    So,  you  can  create  a  different  Context  based  on  the  value  of  the  field  "signature"...  that  lets  you  measure  qualitaDvely  the  level  of  severity  of  a  malware  
infestaDon  based  on  the  malware  signature....    A  higher  number  of  one  type  of  malware  may  be  more  or  less  severe  than  another  type  of  malware    This  type  of  context  creaDon  is  known  as  Object  ClassificaDon    You  classify  which  context  to  use  based  upon  the  value  of  an  a_ribute  (or  field)  in  an  event...    If  malware  signature  is  X,  then  use  the  context  signature_count_1d/X    If  malware  signature  is  Y,  then  use  the  context  signature_Count_1d/Y    The  value  of  malware_signature  is  different  for  each  event    Contexts  are  data  reducDon  tools...    A  context  models  the  data  distribuDon  of  a  field  over  Dme  by  class    You  can  take  millions  of  events  and  create/update  contexts  to  reflect  these  data  values...    Contexts  are  small  in  size    Contexts  can  be  used  on  indexers  and/or  search  heads    Context  query  commands  (xsWhere,  xsFindBestConcept)  are  streaming  commands    This  is  important  because  you  want  to  leverage  the  architecture  that  splunk  provides  to  get  the  best  performance  possible  
15  

QuesDons?  
16  

Exercise  1   A  Simple  Rule  

Simple  DetecDon  
· Name=WZCSVC · Name=WZCSVC State=Running · Name=WZCSVC State=Running host_priority=critical · Name=WZCSVC State=Running host_priority=critical host_category=*pci*
· Simple  searches  can  simply  be  pasted  into  the  CorrelaDon  Search  Editor  form   · Add  macros  to  enrich  the  event:  `get_event_id`  |  `map_notable_fields`  
Are  those   macros  sDll   relevant?  

CorrelaDon  Search  Editor  Fields  
· Correla3on  Search  Name:  A  name,  such  as  "My  Search".  It  will  be   automaDcally  prepended  with  the  Domain  and  appended  with  "­   Rule"  
· Drill  down  and  thro_le  by  should  be  discussed  
This  needs   finishing  
19  

Exercise  2  
Correlate  Within    
A  Domain  

Correlate  in  place  
· Brute  Force  Access  Behavior  Detected  
· `authentication`| chDaorest  thciso  suenatrcho   ver src by action | search fnaeiedlu  urpdea>D6ngs?u   ccess>0
The  Correla3on  Three  Step  
· Gather  a  pool  of  data   · Use  a  table  to  form  the  data  for  easy  numeric  tests   · Perform  tests  to  make  decisions  

Step  1:  Gather  a  Pool  of  Events  
· `authentication`
· Like  most  Enterprise  Security  CorrelaDon  Searches,  this  search  uses  a  macro  to  simplify  the  final  syntax.     · Macros  definiDons  may  be  found  at  Manager  >  Advanced  Search  >  Search  Macros.  
· tag=authentication NOT (action=success user=*$) | fillnull value=unknown action,app,src,src_user,dest,user
· `authentication`  returns  raw  events:  

Step  2:  Tabulate  the  Events  for  Comparison  
· The  chart  command  is  then  used  to  tabulate  raw  events  for  comparison  
· `authentication`| chart count over src by action

Step  3:  Make  a  Go/No--Go  Decision  
· The  final  search  command  filters  to  pa_erns  that  are  worth  human  a_enDon  
· `authentication`| chart count over src by action | search failure>6 success>0
· Over  longer  Dme  periods,  the  search  may  generate  many  events  

Manage  Load  with  Ranges  and  Thro_les  
· Use  Dme  windows  and  thro_ling  to  prevent  duplicaDons  or  noise  

Exercise  3     Correlate  Across  
MulDple  Domains  

Advanced  CorrelaDon  Searches  

· The  most  challenging  and  useful  

Should  this  be   merged  with  the  

searches  will  leverage  mul3ple  domainCIsM  based  

version?  

Access  InformaDon  ­  which  user   accounts  are  accessing  which   machines?

Asset  and  IdenDty  InformaDon  ­   which  users  and  machines  are   most  criDcal?

Endpoint  InformaDon  ­  which   machines  are  currently  infected   with  malware?

Did  a  high  or  criDcal  priority  user  log  into  an  infected  machine?

Step  One:  AuthenDcaDons  
· `authenDcaDon`  macro  gives  all  access  events,  but  we're  only  looking   for  successful  authenDcaDons...  so  we  copy  it  and  modify  it  
· tag=authentication action=success

Step  Two:  PrioriDes  
· We  have  two  useful  fields  to  look  at  in  this  case,  so  an  OR  is  used  
· (tag=authentication action=success (user_is_privileged="true" OR user_priority="critical" OR user_priority="high") )

Step  Three:  Malware  
· The  `malware`  macro  provides  useful  guidance...  
· (tag=malware tag=attack action=allowed)

Step  Four:  Access  OR  Malware  OR  Privilege  
· Construct  the  total  pool  of  data  to  make  decisions  from  
· (tag=authentication action=success (user_is_privileged="true" OR user_priority="critical" OR user_priority="high") ) OR (tag=malware tag=attack action=allowed) | tags outputfield=tag | eval group=case(tag=="authentication","authentication",tag=="malware","malware")

Step  Five:  Normalize  Results  
· All  the  expected  fields  might  not  be  there  in  source  data,  so  use  evals   to  fill  in  with  something  sensible  
· (tag=authentication action=success (user_is_privileged="true" OR user_priority="critical" OR user_priority="high") ) OR (tag=malware tag=attack action=allowed) | tags outputfield=tag | eval group=case(tag=="authentication","authentication",tag=="malware","malware") | eval user=if(tag=="malware",null(),user) | eval signature=if(tag=="authentication",null(),signature)

Step  Six:  Wonder  Twins,  Form  of  Table!  
· Tabulate  the  fields  that  the  decision  will  be  made  from  
· (tag=authentication action=success (user_is_privileged="true" OR user_priority="critical" OR user_priority="high") ) OR (tag=malware tag=attack action=allowed) | tags outputfield=tag | eval group=case(tag=="authentication","authentication",tag=="malware","malware") | eval user=if(tag=="malware",null(),user) | eval signature=if(tag=="authentication",null(),signature) | stats values(user) as user,values(signature) as signature,dc(group) as group_count by dest

Step  Seven:  Detect  the  CondiDon  
· group_count  field  >  1  is  bad  
· (tag=authentication action=success (user_is_privileged="true" OR user_priority="critical" OR user_priority="high") ) OR (tag=malware tag=attack action=allowed) | tags outputfield=tag | eval group=case(tag=="authentication","authentication",tag=="malware","malware") | eval user=if(tag=="malware",null(),user) | eval signature=if(tag=="authentication",null(),signature) | stats values(user) as user,values(signature) as signature,dc(group) as group_count by dest | search group_count>1

Plug  it  into  the  Search  Editor  
· Drill  down  can  use  a  different  search   ­  efficiency  is  not  as  important,  and   the  results  desired  don't  require  a   count  
· `authentication(success)` | search (user_is_privileged="true" OR user_priority="critical" OR user_priority="high") | stats values(user) as user by dest | join dest [search `malware` | search action=allowed | stats values(signature) as signature by dest]

The  ResulDng  Notable  Event  

Exercise  4  ­     Use  the  CIM,  Luke!  

NormalizaDon:  Not  Just  a  Dirty  Word  

(tag=malware  tag=a_ack   acDon=allowed)  

> (sourcetype=SYMC  "Delete   failed")  OR  (product="VirusScan   Enterprise"  acDon=would*)  OR   (SourceName="Trend  Micro   OfficeScan  Server"  "AcDon:  *   cannot  *")  

· Normalizing  at  index  Dme  is  pre_y  lame   · Normalizing  the  data  before  it's  stored  is  VERY  lame   · Normalizing  with  tags  and  fields  at  search  Dme  is  very  AWESOME  
38  

Data  Models  Create  Common  Understanding  
· NormalizaDon  without   data  reducDon  
· Customized  for  different   data  types  
· RBAC  maintained   · Data  model  reporDng  
speeds  opDmized  
39  

Make  CorrelaDon  Searches  from  Datamodels  
PredicDve  AnalyDcs  -->  Pointy--Clicky  detecDon  of  deviaDons  from  norm   · Events  and  domains,  not  individual  enDDes  
­ YES:  The  number  of  failing  accounts  is  different  than  normal   ­ NO:  SPLUNK/JCOATES  is  failing  logins  more  than  normal  
40  

Make  CorrelaDon  Searches  from  Datamodels  
Search:Pivot  -->  Pointy--Clicky  construcDon  of  data  sets   · Gather  a  collecDon  of  
normalized  data   · Join  with  another   · Filter  for  interest   · Paste  into  New  
CorrelaDon  Search  form  
41  

Step  One:  AuthenDcaDons  
· AuthenDcaDons,  successful,  privileged  
· | `datamodel("Authentication", "Authentication")` | search Authentication.action="success" | `drop_dm_object_name("Authentication")` | search is_Privileged_Authentication=1

Step  Two:  Malware  
· Malware  A_acks,  Allowed  
· | `datamodel("Malware", "Malware_Attacks")` | search Malware_Attacks.action="allowed" | `drop_dm_object_name("Malware_Attacks")`

Step  Three:  Access  OR  Malware  
· Construct  the  total  pool  of  data  to  make  decisions  from  
· | `datamodel("Authentication", "Authentication")` · | search Authentication.action="success" · | `drop_dm_object_name("Authentication")` · | search is_Privileged_Authentication=1 · | append [ · | `datamodel("Malware", "Malware_Attacks")` · | search Malware_Attacks.action="allowed" · | `drop_dm_object_name("Malware_Attacks")` · ]

Step  Four:  Count  the  Matches  
· Tabulate  the  fields  that  the  decision  will  be  made  from
· | `datamodel("Authentication", "Authentication")` | search Authentication.action="success" | `drop_dm_object_name("Authentication")` | search is_Privileged_Authentication=1 | append [| `datamodel("Malware", "Malware_Attacks")` | search Malware_Attacks.action="allowed" | `drop_dm_object_name("Malware_Attacks")`]
· | eval group = case(is_Successful_Authentication==1, "authentication", is_Allowed_Malware==1, "malware")
· | stats values(user) as user, values(signature) as signature, distinct_count(group) as group_count by dest

Step  Five:  Detect  the  CondiDon  
· group_count  field  >  1  is  bad,  and  there's  our  correlaDon  search  
· | `datamodel("Authentication", "Authentication")` | search Authentication.action="success" | `drop_dm_object_name("Authentication")` | search is_Privileged_Authentication=1| append [| `datamodel("Malware", "Malware_Attacks")` | search Malware_Attacks.action="allowed" | `drop_dm_object_name("Malware_Attacks")`] | eval group = case(is_Successful_Authentication==1,"authentication",is_Allowed_Malware==1,"malware") | stats values(user) as user, values(signature) as signature, distinct_count(group) as group_count by dest
· | search group_count>1
· | `get_event_id`
· | fields ­ group_count

Exercise  5   Create  and  Use  Lookups  

Working  with  Lookups  
· Some  things  are  imprac3cal  to  con3nually  discover   or  recalculate  in  real  3me

Network  Traffic  Flows  are   expensive  to  monitor,  so  save  the   important  informaDon  in  a  lookup

IP  ranges  of  prohibited  sites  may   be  stored  in  another  lookup   (several  are  provided  by  default)

Did  an  internal  system  communicate  with  an  embargoed  network?

GeneraDng  a  Lookup  

· Search  for  the  material  in  quesDon  (tstats,  raw,  whatevs)   · Join  with  previously  discovered  lookup  contents   · Write  the  new  lookup  

· Example:  Port  and  Protocol  

Tracker,  shows  what  

| tstats `summariesonly` min(_time) as firstTime,max(_time)

transport/port  combinaDons   as lastTime from datamodel=Network_Traffic where All_Traffic.action=allowed by

are  in  use  on  the  network   All_Traffic.transport,All_Traffic.dest_port | `drop_dm_object_name("All_Traffic")` | inputlookup append=T

over  Dme  

port_protocol_tracker | stats min(firstTime) as firstTime,max(lastTime) as lastTime by transport,dest_port

| outputlookup port_protocol_tracker | stats count

Search  for  the  Material  in  QuesDon  
· In  this  case  an  accelerated  data  model  holds  the  goods  
| tstats `summariesonly` min(_time) as firstTime,max(_time) as lastTime from datamodel=Network_Traffic where All_Traffic.action=allowed by All_Traffic.transport,All_Traffic.dest_port | `drop_dm_object_name("All_Traffic")`

Join  With  the  Older  Lookup  
· This  is  criDcal  because  if  the  new  search  provides  no  results,  the  old   lookup  will  be  wiped  out  
| tstats `summariesonly` min(_time) as firstTime,max(_time) as lastTime from datamodel=Network_Traffic where All_Traffic.action=allowed by All_Traffic.transport,All_Traffic.dest_port | `drop_dm_object_name("All_Traffic")`
| inputlookup append=T port_protocol_tracker

Deal  With  Time  
· Order,  format,  label  
| tstats `summariesonly` min(_time) as firstTime,max(_time) as lastTime from datamodel=Network_Traffic where All_Traffic.action=allowed by All_Traffic.transport,All_Traffic.dest_port | `drop_dm_object_name("All_Traffic")` | inputlookup append=T port_protocol_tracker | stats min(firstTime) as firstTime,max(lastTime) as lastTime by transport,dest_port
· You  might  also  want  to  dedup  events  
| dedup firstTime,lastTime,transport,dest_port
· To  keep  the  lookup  from  growing  forever,  you  can  filter  by  Dme  and   calculate  a  difference  
| convert timeformat="%m-%d-%Y" mktime(date) as _time | eval timeDiff=now()-_time | search timeDiff<86400

Write  the  ResulDng  Lookup  File  
· Replace  the  lookup  with  the  new  results  
| tstats `summariesonly` min(_time) as firstTime,max(_time) as lastTime from datamodel=Network_Traffic where All_Traffic.action=allowed by All_Traffic.transport,All_Traffic.dest_port | `drop_dm_object_name("All_Traffic")`
| inputlookup append=T port_protocol_tracker | stats min(firstTime) as firstTime,max(lastTime) as lastTime by transport,dest_port | outputlookup port_protocol_tracker

Using  Lookups  in  CorrelaDon  Searches  
The  Correla3on  Three  Step  
· Gather  a  pool  of  data   · Use  a  table  to  form  the  data  for  easy  numeric  tests   · Perform  tests  to  make  decisions  
POOL:   | inputlookup append=T src_dest_tracker | lookup local=true ip_tor_lookup src OUTPUTNEW src_ip as src_tor_ip,src_is_tor | lookup local=true ip_tor_lookup dest OUTPUTNEW dest_ip as dest_tor_ip,dest_is_tor | search dest_is_tor=true OR src_is_tor=true

TABLE:  

The  data  is   already   tabular!  

TEST:   | eval tor_ip=if(dest_is_tor=="true",dest_tor_ip,tor_ip) | eval tor_ip=if(src_is_tor=="true",src_tor_ip,tor_ip) | fields + sourcetype,src,dest,tor_ip

| inputlookup append=T src_dest_tracker | lookup local=true ip_tor_lookup src OUTPUTNEW src_ip as src_tor_ip,src_is_tor | lookup
FINAL:   local=true ip_tor_lookup dest OUTPUTNEW dest_ip as dest_tor_ip,dest_is_tor | search dest_is_tor=true OR src_is_tor=true | eval tor_ip=if(dest_is_tor=="true",dest_tor_ip,tor_ip) | eval tor_ip=if(src_is_tor=="true",src_tor_ip,tor_ip) | fields + sourcetype,src,dest,tor_ip

Using  a  StaDc  Lookup  

· You  can  define  a  non--dynamic  lookup  even  more  easily  

Embargo  definiDon,  used  by  a   custom  block--listed  traffic   correlaDon  search  

## SA-ThreatIntelligence/local/transforms.conf [ip_embargo] file=embargo.csv max_matches = 1 match_type = CIDR(src)

Embargo.CSV  content  sample  

"src","blocked" "2.144.0.0/14",1 "2.176.0.0/12",1 "31.7.64.0/18",1 "31.7.128.0/20",1
"0.0.0.0/0",0

Embargoed  Country  AcDvity   CorrelaDon  Search  

| inputlookup append=T src_dest_tracker | lookup local=true ip_embargo src OUTPUTNEW src_ip as src_embargo_ip,src_is_embargoed | lookup local=true
ip_embargo dest OUTPUTNEW dest_ip as dest_embargo_ip,dest_is_embargo | search dest_is_embargo=true OR src_is_embargo=true | eval
embargo_ip=if(dest_is_embargo=="true",dest_embargo_ip,embargo_ip) | eval
embargo_ip=if(src_is_embargo=="true",src_embargo_ip,embargo_ip) | fields + sourcetype,src,dest,embargo_ip

THANK  YOU  

Reference  Material  
Types  of  CorrelaDon  Searches  

ES  CorrelaDon  Search  Types  
· Within  a  single  domain,  a  recognized  event  has  occurred.   · Within  a  single  domainn,eD  eaode  c  suo p tnhdfiiasgD  liunsgtr ?e   d    threshold  has  been  breached  once.   · Within  a  single  domain,  a  configured  threshold  has  been  breached  by  many.   · Within  a  single  domain,  a  blacklisted  item  has  been  matched.   · Within  a  single  domain,  a  desired  item  has  not  been  matched.   · Within  a  single  domain,  a  known  bad  event  correlaDon  has  been  matched.   · Within  a  single  domain,  a  desired  event  correlaDon  has  not  been  matched.   · Within  a  single  domain,  a  measured  value  is  anomalous  from  recorded  history.   · Within  a  single  domain,  a  measured  value  is  anomalous  from  computed  baseline.   · Across  mulDple  domains,  a  single  recognized  event  has  occurred.   · Across  mulDple  domains,  a  correlaDon  of  recognized  events  has  been  matched.  

Within  a  Single  Domain,  a  Recognized  Event  has  Occurred  
· Threat  --  Watchlisted  Events  ­  Rule  
· tag=watchlist NOT sourcetype=stash | `get_event_id` | `map_notable_fields`
· Events  that  look  bad,  add  fields  and  tags.  

Within  a  Single  Domain,  a     Configured  Threshold  has  Been  Breached  Once  
· Access  --  Excessive  Failed  Logins  --  Rule  
· `authentication(failure)` | tags outputfield=tag | stats values(tag) as tag,dc(user) as user_count,dc(dest) as dest_count,count by app,src | `settags("access")` | search count>=6
· Events  that  look  bad,  add  fields  and  tags,  count  them,  add  fields  and  tags,  test   if  greater  than  threshold.  

Within  a  Single  Domain,  a  Configured     Threshold  has  Been  Breached  by  Many  
· Network  --  Vulnerability  Scanner  DetecDon  (by  targets)  --  Rule  
· tag=attack | tags outputfield=tag | stats values(tag) as tag,dc(dest) as count by src | search count>25 | `settags("network")`
· Events  that  look  bad,  add  fields  and  tags,  count  them,  add  fields  and  tags,  test   if  greater  than  threshold  

Within  a  Single  Domain,  a     Blacklisted  Item  has  Been  Matched  
· Endpoint  --  Prohibited  Process  DetecDon  --  Rule  
· NOT sourcetype=stash `localprocesses` | `get_interesting_processes` | search is_prohibited=true | `get_event_id` | `map_notable_fields` | fields + orig_event_id,orig_raw,dest,process,note
· All  the  useful  records,  match  the  blacklist,  add  fields  and  tags  

Within  a  Single  Domain,  a     Desired  Item  has  Not  Been  Matched  
· Audit  --  PotenDal  Gap  in  Data  --  Rule  
· index=_internal * sourcetype="scheduler" status=success (app=SA-* OR app=DA-* OR app=SplunkEnterpriseSecuritySuite OR app=SplunkPCIComplianceSuite) | head 1 | stats count(sourcetype) as count | where count=0 | eval problem="true"
· Relevant  events  that  are  good,  count  them,  test  if  count  =  0  

Within  a  Single  Domain,  a  Known  Bad     Event  CorrelaDon  has  Been  Matched  
· Access  --  Brute  Force  Access  Behavior  Detected  --  Rule  
· `authentication` | tags outputfield=tag | stats values(tag) as tag,count(eval(action=="failure")) as failure,count(eval(action=="success")) as success by src | search failure>6 success>0 | `settags("access")`
· Relevant  events,  count  by  types,  test  if  two  thresholds  are  breached,  add   fields  and  tags.  

Within  A  Single  Domain,  A     Desired  Event  CorrelaDon  Has  Not  Been  Matched  
· No  shipping  rule  matches  this  pa_ern  
· N/A
· Customers  oPen  will  do  something  like  this:  
­ Access  to  important  system   ­ Change  Event  on  that  system   ­ Service  Desk  Dcket  referencing  the  system  is  absent  

Within  a  Single  Domain,  a  Measured  Value  is     Anomalous  from  Recorded  History  
· Endpoint  --  Anomalous  New  Processes  --  Rule  
· | inputlookup append=T localprocesses_tracker | eval _time=firstTime | `hoursago(24)` | stats dc(dest) as dest_count by process | search dest_count>9
· Load  recorded  history,  bucket  by  Dme,  count  and  compare  to  threshold  

Within  a  Single  Domain,  a  Measured  Value  is     Anomalous  From  Computed  Baseline  
· Access  --  Brute  Force  Access  Behavior  Detected  ­  Rule  
· | tstats `summariesonly` count from datamodel=Intrusion_Detection by _time,IDS_Attacks.signature span=30m | `drop_dm_object_name("IDS_Attacks")` | `timeDiff` | appendpipe [search timeDiff<=86400 | stats max(_time) as _time,sum(count) as count by signature | eval group="Last 24 hours"] | eval group=if(_time<relative_time(time(),"@d") AND timeDiff<=5184000,"Last 60 days",group) | bin _time span=1d | stats sum(count) as count by _time,group,signature | eval temp=if(group="Last 60 days",signature,null()) | eventstats stdev(count) as stdev,avg(count) as avg by temp | eventstats max(stdev) as stdev,max(avg) as avg by signature | dedup signature sortby -_time | eval limit=(3*stdev)+avg | eval diff=count-limit | search diff>0
· Relevant  events,  sort  types  into  a  table,  test  if  two  thresholds  are  breached,   add  fields  and  tags.  

Across  MulDple  Domains,  a  Recognized  Event  has  Occurred  
· Threat  --  Threat  List  AcDvity  --  Rule  
· | `src_dest_tracker("allowed")` | `threatlist_lookup(src)` | `threatlist_lookup(dest)` | eval threat_ip=if(isnotnull(src_threatlist_name), src, if(isnotnull(dest_threatlist_name), dest, threat_ip)) | search threat_ip=* | fields + sourcetype,threat_ip,src,src_threatlist_category,src_threatlist_description,src_t hreatlist_name,dest,dest_threatlist_category,dest_threatlist_description,dest_thr eatlist_name
· Events  of  the  right  type,  recognized  bad  things,  add  fields  and  tags,  filter  by   match,  add  more  fields  and  tags.  

Across  MulDple  Domains,  a  CorrelaDon     of  Recognized  Events  has  Been  Matched  
· Access  --  High  or  CriDcal  Priority  Individual  Logging  into  Infected  Machine  --  Rule  
· (tag=authentication action=success (user_is_privileged="true" OR user_priority="critical" OR user_priority="high") ) OR (tag=malware tag=attack action=allowed) | tags outputfield=tag | eval group=case(tag=="authentication","authentication",tag=="malware","malware") | eval user=if(tag=="malware",null(),user) | eval signature=if(tag=="authentication",null(),signature) | stats values(user) as user,values(signature) as signature,dc(group) as group_count by dest | search group_count>1
· All  of  the  potenDally  interesDng  events,  add  fields  and  tags,  count  and  test.  

