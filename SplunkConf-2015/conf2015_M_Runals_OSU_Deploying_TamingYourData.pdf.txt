Copyright  ©  2015  Splunk  Inc.  
Taming  Your  Data  
Mark  Runals  
Lead  Security  Engineer,  OSU  

Disclaimer  
During  the  course  of  this  presentaHon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauHon  you  that  such  statements  reflect  our   current  expectaHons  and  esHmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaHon  are  being  made  as  of  the  Hme  and  date  of  its  live   presentaHon.  If  reviewed  aSer  its  live  presentaHon,  this  presentaHon  may  not  contain  current  or   accurate  informaHon.  We  do  not  assume  any  obligaHon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiHon,  any  informaHon  about  our  roadmap  outlines  our  general  product  direcHon  and  is  subject  to   change  at  any  Hme  without  noHce.  It  is  for  informaHonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaHon  either  to  develop  the  features  
or  funcHonality  described  or  to  include  any  such  feature  or  funcHonality  in  a  future  release.  
2  

  Agenda  
· OSU  Splunk  Deployment  ­  Environmental  Background   · Quick  Look  at  Data  Curator  Overview  Dashboard   · Props  &  Field  ExtracHon  Score  Methodology   · Views  to  help  Splunk  admins  prioriHze  Hme  
FYI  --  Splunk  Admin  Focused  PresentaHon  
3  

  About  Me  
· Using  Splunk  for  3  years   · ArcSight  admin  for  3  years   · Worked  in  InfoSec  for  10  yrs+   · Mo`o  --  Solve  for  80%  and  move  on   · Gedng  data  into  Splunk  isn't  the  end  game  

On  ferry  going  to  Survivor   open  casHng  call  

4  

Some  Background  &  Program  Drivers    

OSU  Environment  

135  Distributed  IT  units  around  OSU  

· Each  group  is  autonomous  

· No  standardizaHon  

· Huge  variety  of  technologies   · Splunk  use  not  mandatory  

+  

  

Desired  lightweight  onboarding  process  

· For  units  &  for  SecOps  team  

Incredible  roll--on/ adopHon  rate  
=  

5  

  Fast  Forward  3  Years  +/--  
· 2TB  of  data   · 2,800+  Splunk  agents   · 16k  devices   · 12  types  of  firewalls   · MulHple  OS   · 90+  teams  with  data  in  Splunk   · 900+  sourcetypes  ­  many  `learned'   · 550+  accounts  provisioned  
6  

  Fast  Forward  3  Years  +/--  

· 2TB  of  data   · 2,800+  Splunk  agents   · 16k  devices   · 12  types  of  firewalls   · MulHple  OS   · 90+  teams  with  data  in  Splunk   · 900+  sourcetypes  ­  many  `learned'   · 550+  accounts  provisioned  

Is  data  being  ingested  correctly?      What  fields  have  been  defined?;  where?      What  types  of  data  are  in  Splunk?      What's  not  configured  correctly?  

7  

Issue  Overview  

Out  of  the  box  Splunk  will  generally  ingest  data  correctly  

· Host  names  

· Sourcetypes   · Timestamp    

· Line  breaking  

· Auto  key--value  fields  

At  best  this  isn't  efficient.    

  

At  worst  it  can  strain  your  deployment  and  may  drop/lose  events  

  

  

Factors  in  play  

· Hardware   · Data  distribuHon     · Sourcetype  velocity   · RaHo  of  indexers  to  total  log  volume   · Weird  date/Hme  informaHon  in  your  logs   · etc  

  

8  

The  Data  Curator  App  

  Data  Curator  App  

Goals  
· Generate  aggregate  data  onboarding  maturity  scores  
· Generate  ~accurate  individual  sourcetype  maturity  score  
· Show  what  app/package  contains  props  sedngs  
· Show  current  props  sedngs  
· Highlight  issues  related  to/solvable  by  props  sedngs  
o Line  breaking   o Timestamp   o Transforms  issues  

Take  Note!  
· App  will  NOT  tell  you  what  the  sedngs  should  be   · Requires  Splunk  6x  search  head   · Only  able  to  work  through  issues  I  saw  in  my  
environment  --  you  may  have  others.   · I  can  troubleshoot  my  app  ­  not  your  deployment  
=)  

10  

  Deployment  At  A  Glance  
11  

Props  Score     Methodology  

Props  Score  Methodology  
· Based  on  Ge#ng  Data  in  Correctly  presentaHon   · Individual  scores  reference  the  7  primary  props  sedngs  each  sourcetype  should  have   · Aggregate  score  takes  individual  scores  and  factors  in  sourcetype  volume   · Score  converted  to  a  10  point  scale  (customizable)  
13  

Props  Score  
[mah_data_stanza]   TIME_PREFIX  =   MAX_TIMESTAMP_LOOKAHEAD  =   TIME_FORMAT  =   SHOULD_LINEMERGE  =     LINE_BREAKER  =   TRUNCATE  =     TZ  =    
14  

Props  Score  

[mah_data_stanza]  

TIME_PREFIX  =   +1

MAX_TIMESTAMP_LOOKAHEAD  =   +1

OR

TIME_FORMAT  =   +1

SHOULD_LINEMERGE  =    

LINE_BREAKER  =  

TRUNCATE  =    

TZ  =    

DATETIME_CONFIG  =    +3

15  

Props  Score  

[mah_data_stanza]  

TIME_PREFIX  =  

MAX_TIMESTAMP_LOOKAHEAD  =  

TIME_FORMAT  =   SHOULD_LINEMERGE  =  False   +1

LINE_BREAKER  =  

TRUNCATE  =    

TZ  =    

....but  what  if  my  data  should  be  merged?  

16  

Props  Score  

[mah_data_stanza]   TIME_PREFIX  =   MAX_TIMESTAMP_LOOKAHEAD  =   TIME_FORMAT  =   SHOULD_LINEMERGE  =  True   LINE_BREAKER  =   TRUNCATE  =     TZ  =    

AND
+1

One  of  these  is  populated   BREAK_ONLY_BEFORE   MUST_BREAK_AFTER   MUST_NOT_BREAK_BEFORE   MUST_NOT_BREAK_AFTER  

17  

Props  Score  

[mah_data_stanza]   TIME_PREFIX  =   MAX_TIMESTAMP_LOOKAHEAD  =   TIME_FORMAT  =   SHOULD_LINEMERGE  =     LINE_BREAKER  =   +1 TRUNCATE  =     TZ  =    

Default  is  ([\r\n\]+)  
Don't  want  to  line  break?  
((?!))  or  ((*FAIL))  are  a  couple  opHons*  

*h`p://answers.splunk.com/answers/106075/each--file--as--one--single--splunk--event  
18  

Props  Score  

[mah_data_stanza]   TIME_PREFIX  =   MAX_TIMESTAMP_LOOKAHEAD  =   TIME_FORMAT  =   SHOULD_LINEMERGE  =    
LINE_BREAKER  =   TRUNCATE  =     +1 TZ  =    

Default  is  10000  +0
Game  your  score!   Ø Set  this  to  anything  other  than  the  default  
i.e.  10001  or  999999  

19  

Props  Score  

[mah_data_stanza]   TIME_PREFIX  =   MAX_TIMESTAMP_LOOKAHEAD  =   TIME_FORMAT  =   SHOULD_LINEMERGE  =    
LINE_BREAKER  =   TRUNCATE  =     TZ  =     +1

If  sedng  this  across  your  environment  isn't   possible/pracHcal  reduce  the  max  score   macro  in  the  app.  It's  used  as  a  variable.  
Macro:    props_score_upper_bounds  =  \7     6

20  

Props  Score  

[mah_data_stanza]   TIME_PREFIX  =   MAX_TIMESTAMP_LOOKAHEAD  =   TIME_FORMAT  =   SHOULD_LINEMERGE  =     LINE_BREAKER  =   TRUNCATE  =     TZ  =    

Max  Score  =  7

  

  

(st_score  *  `props_score_scale`)  /  `props_score_upper_bounds`  

  

10

21  

Props  Score  Caveats  

There  are  a  lot  of  addiHonal  props  sedngs  that  could  be  applicable  for  your   data/environment.        This  method/app  doesn't  address  host  fields  that  are  incorrect  

syslog  

Splunk  UF  

Default  host  field?  

22  

Props  Score  Caveats  

There  are  a  lot  of  addiHonal  props  sedngs  that  could  be  applicable  for  your   data/environment.        This  method/app  doesn't  address  host  fields  that  are  incorrect  

syslog  

Splunk  UF  

Default  host  field?  

23  

Props  Score  Macro'ed  Query  
rest  splunk_server=local  /servicesNS/--/--/configs/conf--props     |  eval  sourcetype  =  if(isnull(sourcetype)  OR  len(sourcetype)<1,  Htle,  sourcetype)     |  rename  eai:appName  as  App     |  search  App!=system  App!=learned  TIME_FORMAT=*  OR  TIME_PREFIX=*  OR  MAX_TIMESTAMP_LOOKAHEAD=*  OR                                 LINE_BREAKER=*  OR  TZ=*  OR  TRUNCATE=*  OR  DATETIME_CONFIG=*     |  eval  dateHme_set  =  if(DATETIME_CONFIG!="/etc/dateHme.xml",  "yes",  "no")     |  foreach  TIME_FORMAT  TIME_PREFIX  LINE_BREAKER  TZ  BREAK_ONLY_BEFORE  MUST_BREAK_AFTER  MUST_NOT_BREAK_AFTER   MUST_NOT_BREAK_BEFORE  [eval  <<FIELD>>  =  if(isnull(<<FIELD>>)  OR  <<FIELD>>="","0","1")]     |  eval  mulHline_sedngs  =  BREAK_ONLY_BEFORE  +MUST_BREAK_AFTER  +MUST_NOT_BREAK_AFTER   +MUST_NOT_BREAK_BEFORE     |  eval  line_merge  =  case(SHOULD_LINEMERGE=0,  1,  SHOULD_LINEMERGE=1  AND  mulHline_sedngs=0,  0,                                                                                 SHOULD_LINEMERGE="1"  AND  mulHline_sedngs>0,  1)     |  eval  max_Hmestamp_lookahead  =  if(MAX_TIMESTAMP_LOOKAHEAD=150,  0,  1)     |  eval  truncate  =  if(TRUNCATE=10000,  0,  1)     |  eval  Hme_score  =  if(dateHme_set  ="no",  max_Hmestamp_lookahead  +  TIME_FORMAT+  TIME_PREFIX,  3)     |  eval  props_score_raw  =  Hme_score  +  LINE_BREAKER  +  TZ  +  truncate  +  line_merge     |  table  sourcetype  props_score_raw  
24  

Individual  Sourcetype   Deepdive  

  Sourcetype  Deep  Dive  Dashboard  
Linux:iptables  
26  

  Sourcetype  Deep  Dive  Dashboard  
Linux:iptables  
Not  all  items  factor   into  score  
27  

  Sourcetype  Deep  Dive  Dashboard  
Linux:iptables  
28  

  Sourcetype  Deep  Dive  Dashboard  
Linux:iptables   Based  on  volume  of  events  per  punct.   Quick  way  to  see  how  unique  logs  in  a   parHcular  sourcetype  are.  
Had  316  unique  punctuaHons  
29  

Fields  Score     Methodology  

  Field  ExtracHon  Score  Methodology  
10.10.10.10  --  --  [20/Aug/2014:13:44:03.151  --0400]  "POST  /services/broker/phonehome/ connecHon_10.10.10.10_8089_10.10.10.10_TEST--TS_68D82260--CC1D--4203--83CA--6E24F9FE6538  HTTP/1.0"  200   24  --  --  --  1ms  

Length  of  Fields  
1. Account  for  any  autokv  field  names   2. Do  convoluted  search  to  get  length  of  fields   3. Account  for  Hmestamp  in  log   4. Get  total  length  

_raw  length  

1. Remove  spaces   2. Remove  newline  characters   3. Get  _raw  length  

=  

%  of  Event  has     Fields  Defined  

31  

  Field  ExtracHon  Score  Methodology  

11

10.10.10.10  --  --  [20/Aug/2014:13:44:03.151  --0400]  "POST  /services/broker/phonehome/

connecHon_10.10.10.10_8089_10.10.10.10_TEST--TS_68D82260--CC1D--4203--83CA--6E24F9FE6538  HTTP/1.0"  200  

24  --  --  --  1ms   11

4

11

7

36

8

3

2

3

Length  of  Fields  
1. Account  for  any  autokv  field  names   2. Do  convoluted  search  to  get  length  of  fields   3. Account  for  Hmestamp  in  log   4. Get  total  length  

_raw  length  

1. Remove  spaces   2. Remove  newline  characters   3. Get  _raw  length  

=  

%  of  Event  has     Fields  Defined  

32  

  Field  ExtracHon  Score  Methodology  

11

10.10.10.10  --  --  [20/Aug/2014:13:44:03.151  --0400]  "POST  /services/broker/phonehome/

connecHon_10.10.10.10_8089_10.10.10.10_TEST--TS_68D82260--CC1D--4203--83CA--6E24F9FE6538  HTTP/1.0"  200  

24  --  --  --  1ms   11

4

11

7

36

8

3

2

3

Length  of  Fields  
1. Account  for  any  autokv  field  names   2. Do  convoluted  search  to  get  length  of  fields   3. Account  for  Hmestamp  in  log   4. Get  total  length  

_raw  length  

1. Remove  spaces   2. Remove  newline  characters   3. Get  _raw  length  

=  

%  of  Event  has     Fields  Defined  

*  Not  a  great  example  ­  Splunk  forwarder  phonehome  logs  actually  have  +100%  field  length  compared  to  _raw     33  

  Field  ExtracHon  Score  Methodology  
Caveats  /  ConsideraHons   · Doesn't  account  for  field  alias  (will  arHficially  inflate  score)   · If  field  extracHon  %  is  over  100  the  score  is  set  to  100   · DirecHonally  correct  is  about  the  best  this  will  get   Ø Fields  extracted  !=  field  value  
34  

  Field  ExtracHon  Macro'ed  Query  
fields  --  date_*  linecount  even`ype  source  host  splunk_server  Hmestartpos  Hmeendpos  tag*  index  |  rex  max_match=100  "(?:\n|\s)? (?<key_value_fields>\S+)=\s?"  |  nomv  key_value_fields  |  rex  mode=sed  field=key_value_fields  "s/  //g"  |  rex  mode=sed   field=key_value_fields  "s/\n//g"  |  eval  kv_field_len  =  len(key_value_fields)  |  eval  kv_field_len  =  if(isnotnull(kv_field_len),   kv_field_len,  0)|  rex  mode=sed  field=_raw  "s/  //g"  |  rex  mode=sed  field=_raw  "s/\n//g"  |  eval  raw_len=len(_raw)  |  eval  Hme_len  =   if(isnull(Hmestamp),  19,  0)  |  fields  --  Hmestamp  _Hme  key_value_fields  |  stats  count  first(*)  as  *  by  sourcetype  punct  |  eval   total_field_len  =  0  |  foreach  *  [eval  total_field_len  =  if(isnotnull('<<FIELD>>'),  len('<<FIELD>>')  +  total_field_len,  0  +  total_field_len)]   |  eval  raw_len_len  =  len(raw_len)  |  eval  st_len=len(sourcetype)  |  eval  t_len  =  len(Hme_len)  |  eval  punct_len  =  len(punct)  |  eval   count_len  =  len(count)  |  eval  total_field_len  =  total_field_len  --  st_len  --  raw_len_len  --  punct_len  --  count_len  --  t_len  +  kv_field_len  |   table  sourcetype  punct  count  raw_len  total_field_len  |  eval  perc_fields  =  round((total_field_len/raw_len)*100)  |  eval  perc_fields  =   case(perc_fields>100,"100",  perc_fields<0,  "0",  1=1,  perc_fields)  |  eventstats  sum(count)  as  total  by  sourcetype  |  eval   loaded_perc_fields  =  count*perc_fields  |  stats  sum(loaded_perc_fields)  as  loaded_perc_fields  by  sourcetype  total  |  eval   loaded_perc_fields  =  round(loaded_perc_fields/total,`field_extracHon_percentage_round_int`)  |  table  sourcetype   loaded_perc_fields  
35  

Splunk  Admin  Time  
PrioriHzing  work  

  Data  Import/DefiniHon  Pipeline    
(Mark's  View)  

Index  Time  Processing  

Search  Time  Processing  

Data  Management   Knowledge  Management  

· Sourcetyping   · Line  breaking   · Timestamp  
· Host  field   · etc  

· Base  level  field  extracHon   · Normalized  field  names   · Field  name  alignment  within  Common  InformaHon  Model  
(CIM)   · Knowledge  Objects  

37  

  Props  Score  Breakdown  
LHotosly  o  Cf  rWapo!r!k    
....but  before  you  slit  your  wrists  
38  

  Props  Score  Breakdown  
39  

Learned  Sourcetypes  Quickview  
Learned  =  "too_small"  OR  --\d+$   Defined  =  not  the  above  
40  

Sourcetype  Running  Score  List  
Good  weekly/bi--weekly/monthly  admin  report   41  

  IdenHfying  Date/Time  Issues  
42  

  IdenHfying  Date/Time  Issues  
These  events  don't  have  Hmestamps!   43  

  IdenHfying  Date/Time  Issues  

These  events  don't  have  Hmestamps!  

What  if  Splunk  thinks  the  last  known   good  Hmestamp  was  6  years  ago?  
44  

  IdenHfying  Date/Time  Issues  

These  events  don't  have  Hmestamps!  

What  if  Splunk  thinks  the  last  known   good  Hmestamp  was  6  years  ago?  
45  

  IdenHfying  Date/Time  Issues  
Cisco:ASA  Logs  
45  Firewalls   1  couldn't  reach  NTP  servers  >  2  month  Hme  skew  
46  

Some  Other  Features  

  Data  Taxonomy  

Version  1  ­  deprecated  out  of  the  box  
Designed  to  answer  "What  type  of  data  is  in  Splunk?"      Created  a  2  field  classificaHon  csv  for  several  hundred  sourcetypes  
· Data  Family   · Data  Subtype  
   Very  useful  but  too  many  one--to--many  relaHonships  based  on  data  use  

netstat  

ConfiguraHon?   Networking?  

Server  Monitoring   Server  InformaHon   Server  ConfiguraHon   Server  Performance  

Too  many  Server  *  

48  

  Sourcetype  PunctuaHon  Overview  
30  Minute  Sampled  Data  
49  

  Sourcetype  PunctuaHon  Overview  
50  

  Sourcetype  PunctuaHon  Overview  
51  

  Sourcetype  PunctuaHon  Overview  
Anecdotal  Uses   · We  have  lots  of  data  coming  in  via  syslog  receivers  with  sourcetype  of  "syslog".  Able  to   pull  out  cases  where  that  data  is  actually  set  correctly  elsewhere.   · Juniper  firewall  data  collected  by  syslog  receiver  ­  sourcetype  set  on  inputs.  Someone   deployed  a  Dell  Sonicwall  and  pointed  it  to  the  Juniper  syslog  desHnaHon  since  "it  would   automaHcally  come  into  Splunk"   · Unit  standardized  on  iptables  data  being  logged  along  a  specific  path.  Quickly  able  to  spot   3  systems  that  were  sHll  logging  the  data  in  /var/log/messages.  
52  

  Extract  /  Report  /  Transforms  Issues  
53  

  Extract  /  Report  /  Transforms  Issues  
Only 5 tokens
54  

  Other  Focus  Areas  /  Dashboards  

Data  Management   · Line  Breaking   · Date  Parsing   · Time  zone  issues   · Learned  Sourcetypes  

Knowledge  Management   · Field  ExtracHon   · Field  Lookup  (what  sourcetypes  have  parHcular  fields)   · Compare  fields  across  mulHple  sourcetypes   · Extract,  Transforms,  Report  
  

55  

Now  
· Props  maturity  scores   · Field  extracHon  scores   · Issues  workspaces   · Mis--sourcetyped  data   · Data  Taxonomy  
RelaHvely  non  scaling  

  App  Roadmap  

Next  
· Dashboard  opHmizaHon    
(ie  searchTemplate)  
· Tag  based  Data  Taxonomy   · Any  iniHal  app  bug  fixes  

ASer  Next  
· Tie  in  Data  Model  fields   · Field  value?   · Expand  issue  troubleshooHng  
Based  on  community  feedback      

56  

  
?  
.conf  14  Ge#ng  Data  in  Correctly  presentaHon­  Andrew  Duca   Blog:  runals.blogspot.com   Check  out  the  Forwarder  Health  &  Splunk  Internal  Change  Mgmt  app  in  Splunkbase  
57  

THANK  YOU  

