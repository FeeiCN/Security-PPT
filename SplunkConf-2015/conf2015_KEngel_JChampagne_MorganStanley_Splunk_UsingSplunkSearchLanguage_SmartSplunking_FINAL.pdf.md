Copyright  ©  2015  Splunk Inc.
Smart  Splunking
Jeff  Champagne, S  plunk   Kate  Engel, M  organ S  tanley

Who's  this  dude?
Jeff  Champagne
jchampagne@splunk.com Client  Architect  
Splunk   user  since  2011 Started  with  Splunk   in  Fall  2014 Former   Splunk   customer  in  the  Financial  Services  Industry Lived  previous   lives  as a    Systems  Administrator,   Engineer,   and  Architect
2

Who's  this  gal?
Kate  Engel
Analyst a  t M  organ S  tanley
Started w  ith  Morgan S  tanley i  n S  ummer  2014
­ Currently  supporting   the  Splunk   for  Telecommunications   globally
Former  Splunk p  artner P  rofessional S  ervices   Consultant Philadelphia S  ports F  anJ
3

Am  I  in  the  right  place?
You  should b  e... Familiar  with  SPL  (Splunk Q  uery  Language) Comfortable c  reating v  isualizations a  nd d  ashboards Not  afraid o  f  a  tiny  bit  of  XML A  nice  person
4

Agenda
Formatting y  our  search r  esults  to  fit  your  needs Search  &  Viz.  Ticks Looking  at  Splunk's i  nternal  data Q&A
5

Make  your  data  look   as  good  as  it  feels

Scenario  #1
You  run  a  basic  Splunk s  earch  to  calculate a  verage   latency a  nd  end  up  with  a  value  of  4.238765.  
How  do  you  turn  this  into s  omething  useful????
7

Solution  #1  -- Round  `em Up

|  eval latency=round(latency,2)."ms"

Store  the  output   of  this  eval command  into  the  latency   field

Round  the  value  of  the  existing  latency   field  to  two  decimal  places

Concatenate  the   output  of  the  round   function   with  the   string  value  "ms"

4.238765

4.24ms

http://docs.splunk.com/Documentation/Splunk/6.2.5/SearchReference/CommonEvalFunctions#Mathematical_functions 8

Scenario  #2
That's  great,  but  I  actually  need   to  format  a  big  number.
Specifically, C  ount_of_hits=3458826
9

Solution  #2  ­ Comma--tose

|  eval Count_of_hits=tostring(Count_of_hits,"commas")."   hits"

Store  the  output   of  this  eval command  into  the   Count_of_hits field

Convert  the  value  of  the  existing   Count_of_hits field  to  a  string  and  use   commas  formatting

Concatenate  the   output  of  the   tostring function   with  the  string  value   "  hits"

3458826

3,458,826   hits

http://docs.splunk.com/Documentation/Splunk/6.2.5/SearchReference/CommonEvalFunctions#Conversion_functions 10

Scenario  #3
Cool  story  bro,  but  now  my  number   columns d  on't  sort  properly.   What  the  HECK!?
11

Solution  #3  ­ Just  for  Looks
|  fieldformat Count_of_hits=tostring(Count_of_hits,"commas")."   hits"
Instead  of  using   eval,  use  the  fieldformat command.  It  will  change  the  appearance  of   the  field  without   modifying   the  underlying   value.
http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Fieldformat 12

Scenario  #4
Your  web  server  logs  have  these  fields:   UserName,  Product,  Value,  Region,  City,  IPAddress. How  can  you  easily  report  how  many  products  are  
being  purchased  per  region?
13

Solution  #4  ­ Stats+Eval  to  the  Rescue!

index=my_index sourcetype=my_sourcetype |  fields  Region  Product   |  stats  count(eval(Region=="APAC")) A  S  APAC   count(eval(Region=="EMEA")) A  S  EMEA   count(eval(Region=="AMER")) A  S  AMER   by  Product

Keep  only  the   fields  we   need
Use   stats   to  count  the   number  of   events   where  the   Region  field   equals   a  specific   value.   Label   those   counts  as  APAC, E  MEA,  or  AMER.
Group t  he  regional  counts  by  the   values  of  the   Product  field

http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Stats 14

Scenario  #5
You  have  a  new  tool  to  monitor  activity  on  your   website.  You  want  to  compare  it's  logs  with  the   current  tool's  logs  but  the  field  names  are  different... How  can  you  easily  create  an  apples  to  apples  
search?
15

Solution  #5  ­ Coalesce...

(sourcetype="old_tool" O  R s  ourcetype="new_tool") (source_ip=* A  ND  message=*)  OR  (ip=*  AND   messageType =*) =*) |  eval Key1  =  (source_ip +  "_"  +  message)   |  eval Key2  =  (ip +  "_"  +  messageType)   |  eval KEY=coalesce(Key1,Key2)  

Return  the   two  fields  in  each   sourcetype
Create  key f  ields  for e  ach   sourcetype Create  a  master  key f  ield  to  use  for   reporting.

http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Eval#9._Coalesce_a_field_from_two_di fferent_sour ce_types.2C_create_a_transaction_of_events
16

Scenario  #6
My  month  column c  ontains s  tring  values   (Jan,  Feb,  Mar,   etc...)
How  do  I  sort  these  chronologically   instead o  f  alphabetically?
17

Solution  #6  ­ Let  me  count  the  days

index=myData |  eval month_num=strftime(_time,"%m")   |  sort  month_num

Store  the  output   of  this  eval command  into  a  new  field   called  month_num

Take  the  epochtime value  in   the  _time  field  and  return  the   Month  number

Sort  by  the  numerical  value   of  our  new  month_num field  

http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/CommonEvalFunctions#Date_and_Time_functions 18

Scenario  #7
I  have  a  table  of  items,   how  can  I  add  line  numbers?
19

Solution  #7  ­ One,  Two,  Three,  Four...

index=myData
|  eval No=1  |  accum No  |  table  No,  first_name, l  ast_name,  state

Create  a n  ew   field  called  No   and  set  the   value  to  1

Use  the  accum command  to   increment  the   value  of  No  for   each  result

Add  the  new   field  to  my  table

http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Accum 20

Getting'  Tricky   With  It

Scenario  #1
I  need  to  join  multiple   sourcetypes b  y  a  common f  ield
22

Solution  #1  ­ Getting  Values

index=_internal   sourcetype=splunkd OR  sourcetype=scheduler   |  stats  values(user)  AS  user  values(group)  AS g  roup  values(run_time)   AS  run_time by  date_hour

Values r  eturns   Return  the  values  

all o  f  the  

of  the  existing  

distinct v  alues   user  field a  nd  call  

of  the  field   the  resulting f  ield  

specified

user

Group  all o  f   the  previous   fields b  y  the   date_hour field

 Use  |stats  values(<field  name>)    --or-- |stats  list(<field  name>)  instead  of  |  join  values():  returns  distinct  values  in  lexicographical  order  list():  returns  all  values  and  preserves  the  order
http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/CommonStatsFunctions
23

Scenario  #2
How  can  I  email  these  sweet  results  to  my   coworker  super  fast?
24

Solution  #2  ­ You've  Got  Mail

index=myData result_type=sweet |  sendemail to="godfrey@splunk.com"   subject="Sweet  Results"  sendresults=true

Send  your   results o  ut   via   the  configured   email p  rovider

There  are s  everal p  arameters   available, w  ith t  he  "to"  parameter   being  required

http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Sendemail 25

Scenario  #3
How  can  I  plot  firewall  attacks  on  a  map  with   bubbles t  he  grow  and  change  color  based  on  the  
#  of  attacks?
26

Solution  #3  ­ Hack  the  Map

index=security  sourcetype=firewall |  iplocation clientip |  where  isnotnull(Country)   |  geostats count  as  PLOT   |  eval redCount=if(PLOT  >=  500,PLOT,0)   |  eval yellowCount=if(PLOT  >=  100  AND  PLOT  <  500,PLOT,0)   |  eval greenCount=if(PLOT  <  100,PLOT,0) |  fields  -- PLOT

Lookup   the  location  info  for t  he  IP Filter o  ut  results w  ithout  a  Country Count   the  results a  nd  format f  or  a m  ap
Create  three  new r  ange f  ields f  or  each   location  on  the  map.
Get r  id  of  the  PLOT f  ield, w  e  don't   want i  t  on  the  map

|  eval redCount=if(PLOT  >=  500,PLOT,0)  

Holds  the   count  for  red   values  at  this   map  location

If  the  value  of  PLOT  at  this  map  location  is  greater  than  or  equal  to   500,  then  set  the  value  of  redCount at  this  map  location  to  the  value   of  PLOT.  If  it  is  less  than  500,  set  redCount to  0,  as  the  count  at  this   location  is  not  a  value  that  should  be  red.

27

Solution  #3  ­ Hack  the  Map
index=security  sourcetype=firewall |    iplocation clientip | w  here  isnotnull(Country)   | g  eostats count  as P  LOT |    eval redCount=if(PLOT  >= 5  00,PLOT,0)  | e  val yellowCount=if(PLOT >  =  100  AND  PLOT  < 5  00,PLOT,0) |    eval greenCount=if(PLOT <    100,PLOT,0) |    fields - - PLOT
To  make t  he  dots  specific c  olors,  you'll   need  to  add  the  following l  ine t  o  your   dashboard  panel  XML:
<option name="mapping.fieldColors">{"redCount":0x8f0017,"yellowCount":0xCCCC00, "greenCount":0x006700}</option> 28

Finding  Beauty   on  the  Inside

Scenario  #1
How  can  I  look  at  the  volume o  f  data  my   Universal  Forwarders  are  sending?
30

Solution  #1  ­ Turn  up  the  Volume

index=_internal  source=*metrics.log group=tcpin_connections |  eval Forwarder=coalesce(sourceHost,hostname) |  timechart limit=500  span=1d  sum(kb)  as  DailyKB by  Forwarder

Look   at S  plunk's internal m  etrics l  og
Set  Forwarder   value  to  sourceHost or   hostname
Timechart the  average d  aily  KB b  y   forwarder p  er  day

31

Scenario  #2
That  looks  good,  but  how  can  I  compare  today's   volume t  o  last  week?
32

Solution  #2  ­ If  I  could  turn  back  time

Search  Time  Range:  1  Week
index=_internal  source=*metrics.log group=tcpin_connections |  eval Forwarder=coalesce(sourceHost,hostname) |  bucket   span=1d   _time   |  stats  sum(kb)  AS  DailyKB by  Forwarder  _time   |  stats  earliest(DailyKB)  AS  EarliestVolume latest(DailyKB)  AS   LatestVolume by  Forwarder   |  eval PercChange=round(((LatestVolume-- EarliestVolume)/EarliestVolume)*100,2)

Look   at S  plunk's internal m  etrics l  og
Set   Forwarder   value   to  sourceHost or  hostname
Bucket  the  results b  y  day Sum t  he  kb   field g  rouped  by   Forwarder
Get t  he  DailyKB value  from l  ast w  eek   and  today  for  each  Forwarder
Calculate   the  %  change,  round   to  two  decimal   places,   and   put   the   v alue  in  the   PercChange field

33

Scenario  #3
How  can  I  quickly s  ee  details  about  the  hosts,   sourcetypes, a  nd  sources   in  an  index?
34

Solution  #3  ­ That's  so  META

|  metadata  type=sourcetypes index=MyIndex

The  metadata c  ommand   searches s  ummary  data   instead o  f  the  raw   events...so  its r  eally  fast!

Specify t  he  index  and  type   of  data y  ou'd   like t  o   return.  Splunks keeps  summary i  nformation  on   the  sources,  sourcetypes,  and  hosts  in  every   index.

http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Metadata 35

Scenario  #4
What  if  I  want  to  see  detail  about  all  of  the   sourcetypes i  n  an  index?
36

Solution  #4­ Sourcetype Detail

|  metadata t  ype=sourcetypes index=myIndex |  eval current_time =  now() |  eval seconds_since_last_event=(current_time ­ lastTime) |  convert  ctime(lastTime)  as  LastTime |  convert  ctime(firstTime)  as  FirstTime |  convert  ctime(recentTime)  as  RecentTime |  convert  ctime(current_time)   |  eval hours_since_last_event=   round(seconds_since_last_event/(60*60),3)   |  table  sourcetype seconds_since_last_event hours_since_last_event RecentTime FirstTime LastTime totalCount

Get t  he  metadata f  or s  ourcetypes Set c  urrent_time to  the  current  time Calculate t  he  seconds  since  the  last   event
Format t  he  time s  o  we c  an  read  it
Convert   seconds  to  hours Create  a t  able w  ith  the  fields w  e w  ant

http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Metadata 37

Scenario  #5
Nice!   What  if  I  wanted  to  determine  if  there  is  a  delay  
indexing e  vents f  rom  my  hosts?
38

Solution  #5­ Keep  up  the  pace

|  metadata  type=hosts   |  eval seconds_lag=(recentTime -- lastTime) |  convert  ctime(lastTime)  as  LastTime |  convert  ctime(firstTime)  as  FirstTime |  convert  ctime(recentTime)  as  IndexTime |  rangemap field=seconds_lag low=0--1800  elevated=1801--3600 |  fields  host,FirstTime,LastTime,IndexTime,seconds_lag,range

Get t  he  metadata f  or h  osts Calculate t  he  difference b  etween  the   timestamp o  n  the  latest e  vent a  nd  the   time i  t  was i  ndexed Format t  he  time s  o  we c  an  read  it
Assign a   s  everity  based  on  the  lag Filter d  own  to  the  fields w  e w  ant

http://docs.splunk.com/Documentation/Splunk/latest/SearchReference/Metadata 39

Scenario  #6
How  can  I  get  a  list  of  all  indexes?
40

Solution  #6  ­ Take  a  REST

|  rest  /services/data/indexes   |  search  eai:acl.app=my_app title=* |  stats    sum(totalEventCount)   AS  totalEventCount by  title

Query   the  indexes R  EST e  ndpoint
Limit t  o  the  app  context  my_app and   return  all i  ndexes Calculate t  he  total  event  count  per   index

http://docs. splunk . com/Documentation/S plunk /latest/S earchReferen ce/Rest 41

Scenario  #6
Awesome! Can  I  see  anything  else  cool?
42

Solution  #6  ­ Take  a  REST

Lookup T  ables: |rest  /services/data/lookup--table--files   |search  eai:acl.app=fantastic_lookups*  
|dedup title  |  rename  title  as  LookupTable |table  LookupTable
Dashboards: |  rest  /servicesNS/--/--/data/ui/views   |  search  eai:acl.app=my_awesomeApp |  table  title

Query   the  lookups  REST e  ndpoint Limit t  o  my a  pp  context Dedup the  list a  nd  create a    table
Query   the  views R  EST e  ndpoint Limit t  o  my a  pp  context Create  a t  able

http://docs.splunk.com/Documentation/Splunk/6.2.5/SearchReference/Rest 43

Resources
Search  Command R  eference
http://docs.splunk.com/Documentation/Splunk/latest/SearchReference
Splunk  Answers
http://answers.splunk.com/
Smart  Answers B  log  ­ Patrick  Pablo,  Community C  ontent M  anager
http://blogs.splunk.com/2014/11/24/smart--answers
Splunk B  ook ­  Exploring S  plunk
http://www.splunk.com/goto/book
44

What  Now?  
Related  breakout s  essions a  nd a  ctivities...
Today 4:15  -- Beyond t  he  Lookup G  lass  ­ Room 3  20 5:15  ­ Search  Efficiency  Optimization ­  Room 3  20
Tomorrow 10:00  &  5:15  ­ Getting  Started  with  Maps  ­ Room 3  18 11:15  ­ Building  Powerful A  nalytics  with  Ease ­  Room  113 3:15  ­ Search  Efficiency  Optimization ­  Room 3  18 4:15  ­ SPLing Bee  ­ Community T  heatre M  arquee B  allroom
45

THANK  YOU

