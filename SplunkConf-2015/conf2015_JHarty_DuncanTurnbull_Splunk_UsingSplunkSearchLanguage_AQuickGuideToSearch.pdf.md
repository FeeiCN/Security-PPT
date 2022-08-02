Copyright  ©  2015  Splunk  Inc.  
Search  OpCmizaCon  
Duncan  Turnbull    
Sales  Engineer,  Splunk  
Julian  Harty  
Sales  Engineer,  Splunk  

Disclaimer  
During  the  course  of  this  presentaCon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauCon  you  that  such  statements  reflect  our   current  expectaCons  and  esCmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaCon  are  being  made  as  of  the  Cme  and  date  of  its  live   presentaCon.  If  reviewed  aQer  its  live  presentaCon,  this  presentaCon  may  not  contain  current  or   accurate  informaCon.  We  do  not  assume  any  obligaCon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiCon,  any  informaCon  about  our  roadmap  outlines  our  general  product  direcCon  and  is  subject  to   change  at  any  Cme  without  noCce.  It  is  for  informaConal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaCon  either  to  develop  the  features  
or  funcConality  described  or  to  include  any  such  feature  or  funcConality  in  a  future  release.  
2  

Who  Are  We?  

Julian  Harty  
· Sales  Engineer   · US  Based   · Recovering  Oracle  DBA   · Wantabee  AerobaCc  pilot   · Working  on  large  scale  deployments    
in  the  SF  Bay  Area  

Duncan  Turnbull  
 Sales  Engineer    UK  based    Using  Splunk  since  version  2.2.3    Loves  Lego!    Working  with  large  scale  deployments    Formerly  doing  PS  and  Training  

Topics  
· Search  Scoping:  A  li]le  background  on  Splunk  Internals   · Search  Op/miza/on  tools:  SOS  and  Job  inspector   · Laying  the  groundwork  for:    Regular  Expression  opCmizaCon   · Beyond  the  basics:  
· Joining  Data   · TransacCons  with  Stats   · OpCmizing  transacCon  
· Bonus:  
· Using  tstats  

Philosophy  behind  Search  OpCmizaCon  
· Don't  feel  the  need  to  opCmize  every   single  search  --  focus  on  those  which   are  frequently  used  and  have  the  best   potenCal  for  speedup.  --  KISS  
· Understand  the  whole  problem   · Know  a  small  number  of  tricks  well  
5  

How  Can  We  Make  Things  Faster?  
For  all  Searches:   · Change  the  physics  (do  something  different)   · Reduce  the  amount  of  work  done  (opCmize  the  pipeline)      In  distributed  Splunk  environments  par/cularly:   · How  can  we  ensure  as  much  work  as  possible  is  distributed?   · How  can  we  ensure  as  li]le  data  as  possible  is  moved?  
6  

The  Basics  ­     Search  Scoping  

Time  Range  
· Splunk  organizes  events  into  buckets  by  Cme,  which  contain  events   · The  shorter  the  Cme  range  the  fewer  buckets  will  be  read   · Common  PracCce:  Searches  running  over  all  Cme   · DiagnosCc:  look  for  searches  over  all  Cme  

Time  Range  
· Good  PracCce:  Scope  to  an  appropriate  shorter  Cme  range  (using   Cme  range  picker  or  earliest=/latest=  or  _index_earliest=/ _index_latest=)  
· Speedup  Metric:  30x  ­  365x   · Example:  All  Time  -->  Week  to  Date  
9  

Scope  on  Metadata  Fields  
· Index  is  a  special  field,  controlling  which  disk   locaCon  will  be  read  to  get  results  
· All  events  in  Splunk  have  sourcetype  and   source  fields  and  including  these  will   improve  speed  and  precision  
· Common  PracCse:  OQen  roles  include  `All-- non  internal  indexes',  no  index  or  sourcetype   specfier  
· DiagnosCc:  look  for  searches  without  explicit   index=  clauses  
10  

Scope  on  Metadata  Fields  
· Good  pracCce:  include  a  specific  index=,  sourcetype=  set  of  fields.  If   using  mulCple  related  sourcetypes,  use  even]ypes  which  also  include   a  sourcetype  scope  
· Expected  Speedup:  2x  ­  10x   · Example  
­ Before  :  MID=*   ­ AQer:  index=cisco  sourcetype=cisco:esa:textmail  MID=*   ­ Using  Even]ypes:  index=cisco  even]ype=cisco_esa_email  with  
(sourcetype="cisco:esa:textmail"  OR  sourcetype=cisco:esa:legacy)  AND  (MID   OR  ICID  OR  DCID)  
11  

Search  Modes  
· Splunk's  search  modes  control  Splunk's  tendency  to  extract  fields,   with  verbose  being  the  most  expansive  and  exploratory  and  fast  being   the  least  
· DiagnosCc:  request.custom.display.page.search.mode  =  verbose   · Common  PracCce:  Verbose  Mode  leQ  on  aQer  using   · Good  PracCce:  Use  Smart  or  Fast  mode  (dashboard  searches  do  this  
automaCcally)   · Speedup  Metric:  2x  --5x  
12  

Inclusionary  Search  Terms  
· Inclusionary  search  terms  specify  events  to  keep   · Exclusionary  search  terms  specify  events  to  remove   · Exclusions  are  appropriate  for  many  use  cases  (interacCve  usage,  
exclusion  of  known  errors,  specificity)  
13  

Inclusionary  Search  Terms  
· DiagnosCc:  Large  scan  numbers  versus  final  events   · Good  PracCce:  Mostly  inclusionary  terms,  small  or  no    
exclusionary  terms   · Speedup  Metric:  2x  --20x  
14  

Field  Usage  
· Define  fields  on  segmented  boundaries  where  possible   · Splunk  will  try  to  turn  field=value  into  value,  can  be  customized  
with  fields.conf/segmentors.conf   · DiagnosCc:  check  the  base  lispy  in  your  search.log  
15  

Field  Usage  
· Good  pracCse:  Repeat  field  values  as  search  terms  if  required,  or  use   fields.conf  
· Example:  
­ Before:  guid=942032a0--4fd3--11e5--acd9--0002a5d5c5   ­ AQer:  (index=server  sourcetype=logins  942032a0--4fd3--11e5--acd9--0002a5d5c5  
guid=942032a0--4fd3--11e5--acd9--0002a5d5c5)  OR  (index=client   even]ype=client--login  source=/var/log/client/942032a0--4fd3--11e5-- acd9--0002a5d5c5)    
16  

The  Basics:   Search  Scoping  Tools  

A  Word  On  Monitoring  Searches  
How  do  we  easily  idenCfy  less  than   opCmal  searches?    SOS  (Pre  6.1  Users)    Distributed  Management  Console    Job  Inspector  
18  

Job  Inspector  

Measuring  Search  

Using  the U Splsunink  Sgea*rtchh  Iens*pSeectoarrch   *  Inspector* Key  Metrics:  

· CompleCon  Time  

·ReNmuomteb*etrim  ofe  Elivneen* ts  

*

Using*the*Search*I·nSSsceaapnrcnhee d SI  Dc   tor*

   Timings*from*the*search*

command.*

Remote*timeline* *

TcoiTtmhmimeimn i sngeagsans*rfd rc forh.o*m  cmo*tm  hem*saenadr c  h*

Copyright*©*2011,*Splunk*Inc.*

19  

Timings  from   Tdimistirnibgus*tferdom  pe*deirsst  ributed*

3*

Timings*from*distribuLitsetedn**tpo

Job  Inspector  Walkthrough  ­  Search  Command  
Rawdata:     Improving  I/O  and  CPU  load      KV:     Are  field  extracCons  efficient      Lookups:     Used  appropriately   Autolookups  causing  issues      Typer:   Inefficient  Even]ypes      Alias:   Cascading  alias     
20  

Laying  the   Groundwork  

Field  ExtracCons  
Most  fields  are  extracted  by  regular  expressions.  Some  regular   expression  operaCons  are  much  be]er  performing  than  others.   Field  extracCons  can  overlap  ­  mulCple  TA's  on  the  same  source  type   for  example.   Fields  can  also  be  from  indexed  extracCons  or  structured  search  Cme   parsing,  as  well  as  calculated  (eval)  fields  and  lookups  
22  

Duplicate  Structured  Fields  

· SomeCmes  both  indexed  extracCons  and  search  Cme  parsing  are   enabled  for  a  CSV  or  JSON  sourcetype.  This  is  repeated  unnecessary   work,  and  confusing  

· DiagnosCc:  duplicate  data  in  mulCvalued  fields  

· Good  PracCce:  Disable  the  search  Cme  KV  

· Example:  
[my_custom_indexed_csv]   #  required  on  SH   KV_MODE=csv   #  required  on  forwarder   INDEXED_EXTRACTIONS  =  CSV  

   [my_custom_indexed_csv]   #  required  on  SH   KV_MODE=none   #  required  on  forwarder   INDEXED_EXTRACTIONS  =  CSV  

23  

Basic  Regular  Expression  Best  PracCce  
· Backtracking  is  expensive   · DiagnosCc:  high  kv  Cme   · Good  PracCces:  
­ Prefer  +  to  *   ­ Extract  mulCple  fields  together  where  they  appear  and  are  
used  together   ­ Simple  expressions  are  usually  be]er  (e.g.  IP  addresses)   ­ Anchor  cleanly   ­ Test  and  benchmark  for  accuracy  and  speed  
24  

Basic  Regular  Expression     Best  PracCce  Examples  

Before  

AQer  

· '  (?P<messageid>[^  ]+)  

·   ^\S+\s+\d+\s+\d\d:\d\d:\d \d\s+\w+\[\d+\]\s+\w+\s+'\d +\.\d+\.\d+\s+(? P<messageid>[^  ]+)  

25  

Reading  Job  Inspector  --    search.kv  

Search.KV=  

Time  taken  to  apply  field  extracCons  

to  events  

  

How  do  you  op/mize  this?  

Regex  opCmizaCons  

· Avoid  Backtracking  

· Use  +  over  *  

· Avoid  greedy  operators  .*?  

· Use  of  Anchors  ^  $  

· Non  Capturing  groups  for  repeats  

· Test!  Test!  Test!  

  

  

  

26  

  

Beyond  the  Basics  

Lookups:  Best  PracCce  
· Use  gzipped  CSV  for  large  lookups   · Add  automaCc  lookups  for  commonly  used  fields   · Scope  Cme  based  lookups  cleanly   · Order  lookup  table  by  `key'  first  then  values   · When  building  lookups,  use  inputlookup  and  stats  to  combine  
(parCcularly  useful  for  `tracker'  type  lookups)   · Splunk  will  index  large  lookups  
28  

Reading  Job  Inspector  --    search.lookups  
Search.lookups  =     Time  to  apply  lookups  to  search      How  do  you  op/mize  this?   · Use  Appropriately  (at  end  of  search)   · Autolookups  maybe  causing  issues        
29  

Joins:  Overview  
Splunk  has  a  join  funcCon  which  is  oQen  used  by  people  with  two  kinds   of  data  that  they  wish  to  analyze  together.  It's  oQen  less  efficient  than   alternaCve  approaches.   · Join  involves  se|ng  up  a  subsearch   · Join  is  going  to  join  all  the  data  from  search  a  and  search  b,  usually  we  
only  need  a  subset   · Join  oQen  requires  all  data  to  be  brought  back  to  the  search  head  
30  

Joins  With  Stats:  Good  PracCce  
· values(field_name)  Is  great   · range(_Cme)  Is  oQen  a  good  duraCon   · dc(sourcetype)  Is  a  good  way  of  knowing  if  you  actually  joined  
mulCple  sources  up  or  only  have  one  part  of  your  dataset   · eval  Can  be  nested  inside  your  stats  expression   · searchmatch  Is  nice  for  ad--hoc  grouping,  could  also  use  
even]ypes  if  disciplined  
31  

Joins  :  Example  
· Before:  
­ Search  A  |  fields  TxnId,Queue  |  join  TxnId  [  search  B  or  C  |  stats  min(_Cme)  as   start_Cme,  max(_Cme)  as  end_Cme  by  TxnId  |  eval  total_Cme  =  end_Cme  --   start_Cme]  |  table  total_Cme,Queue  
· AQer  
­ A  OR  B  OR  C  |  stats  values(Queue)  as  Queue  range(_Cme)  as  duraCon  by   TxnId  
· With  more  exact  semanCcs:  
­ A  OR  B  OR  C  |  stats  values(Queue)  as  Queue  range(eval(if(searchmatch("B  OR   C"),  _Cme,  null())))  as  duraCon  
32  

Reading  Job  Inspector  --    search.join  

Search.join  =    

Time  to  apply  join  to  search  

  

How  do  you  op/mize  this?  

· Consider  a  dataset  that  is  mostly  

error  free  and  has  a  single  unique  

idenCfier  for  related  records  

· Errors  Ce  into  the  unique  idenCfier  

· Find  the  details  of  all  errors  

· Use  a  subsearch  to  first  get  a  list  of  

unique  idenCfiers  with  errors:  

· index=foo  sourcetype=bar  [search  

index=foo  sourcetype=bar  ERROR  |  

top  limit=0  id  |  fields  id]    

  

33  

  

Using  subsearch  effecCvely  
· Consider  a  dataset  that  is  mostly  error  free  and  has  a  single  unique   idenCfier  for  related  records  
· Errors  Ce  into  the  unique  idenCfier   · Find  the  details  of  all  errors   · Use  a  subsearch  to  first  get  a  list  of  unique  idenCfiers  with  errors:   · index=foo  sourcetype=bar  [search  index=foo  sourcetype=bar  ERROR  |  
top  limit=0  id  |  fields  id]    
34  

Reading  Job  Inspector  --    Subsearch  Example  
Search.rawdata  =     Time  to  read  actual  events  from  rawdata   files      How  do  you  op/mize  this?   · Consider  a  dataset  that  is  mostly  error  
free  and  has  a  single  unique  idenCfier   for  related  records   · Errors  Ce  into  the  unique  idenCfier   · Find  the  details  of  all  errors   · Use  a  subsearch  to  first  get  a  list  of   unique  idenCfiers  with  errors:   · index=foo  sourcetype=bar  [search   index=foo  sourcetype=bar  ERROR  |   top  limit=0  id  |  fields  id]          
35  

Key  Items  To  Consider   In  Job  Inspector  
36  

Job  Inspector  Conclusions:   Search  Command  Summary  

Component  
index   rawdata   kv   filter   alias   lookups   typer   tags  

Descrip/on      look  in  tsidx  files  for  where  to  read  in  rawdata   read  actual  events  from  rawdata  files   apply  fields  to  the  events   filter  out  events  that  don't  match  (e.g.,  fields,  phrases)   rename  fields  according  to  props.conf   create  new  fields  based  on  exisCng  field  values   assign  even]ypes  to  events   assign  tags  to  events  
37  

Job  Inspector  Conclusions:   Distributed  Search  Summary  

Metric   createProvider Queue     fetch    
stream.remote    
evaluate  

Descrip/on     
The  Cme  to  connect  to  all  search   peers.    
The  /me  spent  wai/ng  for  or   fetching  events  from  search   peers.    
The  /me  spent  execu/ng  the   remote  search  in  a  distributed   search  environment,  aggregated   across  all  peers.   The  Cme  spent  parsing  the  search   and  se|ng  up  the  data  structures   needed  to  run  the  search.    
38  

Area  to  review   Peer  conducCvity   Faster  Storage  
Possible  bundle  issues  

Job  Inspector  /  Search.log  

FIeld  

Descrip/on     

Area  to  review  

remoteSearch  
Base  lispy  /   keywords   eventSearch  
reportSearch  

The  parallelizable  porCon  of  the  search  
The  tokens  used  to  read  data  from  the   index    and  events  
The  part  of  the  search  for  selecCng  data  
The  part  of  the  search  for  processing   data  

Maximize  the  parallelizable   part.  
Ensure  contains  field  tokens  

39  

Worked  Example  
40  

Stats  vs  TransacCon  

Search  Goal:  compute  staCsCcs  on  the  duraCon  of  web  session   (JSESSIONID=unique  idenCfier):  

  

  

>  sourcetype=access_combined  |  transacCon  

Not  so  Great:  

JSESSIONID  |  chart  count  by  duraCon  

span=log2  

Much  BeUer:   >  |  stats  range(_Cme)  as  duraCon  by  JSESSIONID   |  chart  count  by  duraCon  span=log2    
41  

Use  Stats  To  Maximal  Effect  
· Replace  simple  transacCon  or  join  usage  with  stats   · Stats  count  range(_Cme)  dc(sourcetype)  values(field)  values(error)    
by  unique_id  
­ Gives  you  duraCon  ­  range(_Cme)   ­ Find  incomplete  `transacCons'  with  dc(sourcetype)   ­ Find  errors  with  values(error)   ­ Find  context  with  values(field)  
42  

Use  Stats  To  Maximal  Effect  
· Consider  using  a  base  stats  before  expensive  operaCons  like   eventstats  or  transacCon  or  another  stats:  
­ |  eval  orig_Cme  =  _Cme  |  bucket  _Cme  span=1h|  stats  count   range(orig_Cme)  as  duraCon  by  unique_id  _Cme  |  eventstats  avg(duraCon)   as  avg  |  where  duraCon>avg  
43  

Reading  Job  Inspector  --    Stats  Example  
Search.rawdata  =     Time  to  read  actual  events  from   rawdata  files      How  do  you  op/mize  this?   · Filtering  as  much  as  possible   · Add  Peers   · AllocaCng  more  CPU,  improving  I/O        
44  

For  More  Info  
· 45  

Other  Sessions  To  Look  Out  For:  
· Smart  Splunking  --  Jeff  Champagne,  Kate  Engel   ­ Tuesday  2:00  PM--12:45  PM  
   · Splunk  Search  Pro  Tips  --  Dan  Aiello  
­ Wednesday  12:15  PM--1:00  PM  
· Beyond  the  Lookup  Glass:  Stepping  Beyond  Basic  Lookups  ­     George  Starcher,  Duane  Waddle   ­ Check  out  the  recording!  
46  

SPLing  Bee  CompeCCon  
   Put  your  Splunk--fu  to  use  in  our  first  inaugural  SPLing  Bee!    Your  opportunity  to  learn  new  commands,  show  off  your  
Splunk  ninja  skills  and  compete  with  your  fellow  Splunkers  to   solve  Search  challenges  using  Splunk!      When?  Wednesday  4:15  PM--5:00  PM  Breakout:  13  
47  

Bonus:  Using  tstats  
· When  using  indexed  extracCons,  data  can  be  queried  with  tstats,  allowing  you   to  produce  stats  directly  without  a  prior  search  
· Similarly  data  models  can  be  queried  with  tstats  (speedup  on  accelerated  data   models)  
· Bonus:  tstats  is  available  against  host  source  sourcetype  and  _Cme  for  all  data   (see  also  the  metadata/metasearch  command)  
· Good  PracCce:   ­ Use  tstats  directly  for  reporCng  searches  where  available   ­ Read  just  the  columns  you  need   ­ MulCple  queries  usually  be]er  than  a  datacube  style  search  
48  

THANK  YOU  

Key  Take  away:  Search  Best  PracCce  

Bad  Behavior  

Good  Behavior  

Performance     Comment  

All  Time  Searches  

   --24h@h   

Improvement   >  be=selecCve  AND  be=specific  |  ...                                   365x  30x                                  Limit  Time  Range  

>*  

index=xyz  

            N      a     r   r    o  1w0- - C50m%e      r   a     n    g     e                   Index  and  default  fields  

source=www  

>  foo  bar  

>  foo  |  search  bar   Verbose  Mode   A  NOT  B  

>  foo  bar   

                                30%                                                  Combine  Searches  

>  host=web  sourcetype=access*  

Fast/Smart

                                20--50%                           Fast  Mode  

A  AND  C  AND  D  AND  E U      s   e          F  5a--s5t0/%Sm      a    r    t       M        o     d     e         wAvhoeidre  N  POoTsSs i  ble  

  
Searches  over     large  datasets  

Data  Models  and  Report   1000%  

Use  Intelligently  

AcceleraCon  

Use  Summary  Indexing  

  

Use  Report  Accel  or  Summary  Indexing  

Searches  over  long  periods   Summary  Indexing  

1000%  

Use  Sparingly  

  

  

  

50  

