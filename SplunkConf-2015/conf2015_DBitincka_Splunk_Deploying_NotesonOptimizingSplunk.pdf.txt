Copyright  ©  2015  Splunk  Inc.  
Observa>ons  and   Recommenda>ons  on   Splunk  Performance  
Dritan  Bi>ncka  
Splunk  Technical  Services  

Disclaimer  
During  the  course  of  this  presenta>on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau>on  you  that  such  statements  reflect  our   current  expecta>ons  and  es>mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta>on  are  being  made  as  of  the  >me  and  date  of  its  live   presenta>on.  If  reviewed  aQer  its  live  presenta>on,  this  presenta>on  may  not  contain  current  or   accurate  informa>on.  We  do  not  assume  any  obliga>on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi>on,  any  informa>on  about  our  roadmap  outlines  our  general  product  direc>on  and  is  subject  to   change  at  any  >me  without  no>ce.  It  is  for  informa>onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga>on  either  to  develop  the  features  
or  func>onality  described  or  to  include  any  such  feature  or  func>onality  in  a  future  release.  
2  

About  me     
   !  Member  of  Splunk  Tech  Services   !  Large  scale  deployments   !  Cloud  and  Big  Data   !  FiQh  .Conf  

Agenda  
!  Performance  &  BoWlenecks     !  Understanding  Indexing    
­ Index-->me  pipelines     ­ Index  tes>ng  
!  Understanding  searching  in  isola&on  &  under  indexing  load  
­ Types  of  searches     ­ Mixed  workload  impact  on  resources       
4  

Tes>ng  Disclaimers  
· Tes>ng  on  arbitrary  datasets  in  a  "closed  course"  (lab)   environment  
· Do  not  take  out  of  context  
5  

Typical  "my  Splunk  is  not  performing  well"  conversa>on  
A:  My  Splunk  is  slow.   B:  Okay,  so  what   exactly  is  slow?   A:  I  dunno,  it  just  feels   slow...maybe  I'll  just   get  some  SSDs.    
6  

Splunk,  like  all  distributed  compu>ng   systems,  has  various  boWlenecks  that   manifest  themselves  differently  depending  
on  workloads  being  processed.    
--  Winston  Churchill  
7  

Iden>fying  performance  boWlenecks  

!  Understand  data  flows     ­ Splunk  opera>ons  pipelines  
!  Instrument   ­ Capture  metrics  for  relevant  opera>ons      
!  Run  tests  
!  Draw  conclusions   ­ Chart  and  table  metrics,  looks  for   emerging  paWerns    
!  Make  recommenda&ons    

data  
Ingest                (Indexing)      
Splunk  >  
Consume                (Search)  

8  

Put  that  in  your  pipeline  and  process  it  

Input  

UTF--8   Converter  

Line  Breaker  

Header   Extrac>on  

Output  

   Pipeline    
Data     
Splunk  data  flows  thru  several  such  pipelines  before  it  gets  indexed    
9  

A  ton  of  pipelines  

LINE_BREAKER   TRUNCATE  

SHOULD_LINEMERGE   BREAK_ONLY_BEFORE   MUST_BREAK_AFTER   TIME_*  

TRANSFORMS--xxx   SEDCMD   ANNOTATE_PUNCT  

10  

Event     Breaking  
Timestamp     Extrac>on  
Typing  

Index-->me  processing  
LINE_BREAKER  <where  to  break  the  stream>   SHOULD_LINEMERGE  <enable/disable  merging>   MAX_TIMESTAMP_LOOKAHEAD  <#  chars  in  to  look  for  ts>   TIME_PREFIX  <pattern  before  ts>   TIME_FORMAT  <strptime  format  string  to  extract  ts>   ANNOTATE_PUNCT  <enable/disable  punct::  extraction>     
11  

Tes>ng:  dataset  A  

!  10M  syslog--like  events:    
  .  .  .       Sat,  06  Apr  2014  15:55:39  PDT  <syslog  message  >     Sat,  06  Apr  2014  15:55:40  PDT  <syslog  message  >     Sat,  06  Apr  2014  15:55:41  PDT  <syslog  message  >     .  .  .  

!  Push  data  thru:    
­ Parsing  >  Merging  >  Typing  Pipelines     ê Skip  Indexing  
­ Tweak  various  props.conf  seings  
!  Measure  

MLA:  MAX_TIMESTAMP_LOOKAHEAD  =  30     TP:    TIME_PREFIX  =  ^     TF:    TIME_FORMAT  =  %a,  %d  %b  %Y  %H:%M:%S  %Z     LM:    SHOULD_LINEMERGE  =  false     AP:    ANNOTATE_PUNCT  =  false      

12  

Index-->me  pipeline  results    

Default     MLA    
MLA  +  LM   MLA  +  LM  +  TP   MLA  +  LM  +  TF   MLA  +  LM  +  TF  +  TP     MLA  +  LM  +  TF  +  AP    
0  

51   51   44  
20  

190   179   105   105  

~4X  

MLA:  MAX_TIMESTAMP_LOOKAHEAD  =  30     TP:    TIME_PREFIX  =  ^     TF:    TIME_FORMAT  =  %a,  %d  %b  %Y  %H:%M:%S  %Z     LM:    SHOULD_LINEMERGE  =  false     AP:    ANNOTATE_PUNCT  =  false      

40  

60  

80  

100  

120  

140  

160  

180  

200  

Time  (s)  

13  

Flexibility  

Performance  

Time  (s)   14  

· All  pre--indexing  pipelines   are  expensive  at  default   seings.    
· Price  of  flexibility    
· If  you're  looking  for   performance,  minimize   generality    
  
· LINE_BREAKER   · SHOULD_LINEMERGE   · MAX_TIMESTAMP_LOOKAHEAD   · TIME_PREFIX   · TIME_FORMAT  

Next:  let's  index  a  dataset  B  
!  Generate  a  much  larger  dataset  (1TB)  
­ High  cardinality,  ~380  Bytes/event,  2.86B  events  
!  Forward  to  indexer  as  fast  as  possible  
­ Indexer:   ê 12  CPU@2.67Ghz  HT   ê 12GB  RAM,     ê 14x15KRPM  @146GB/ea    
­ No  other  load  on  the  box  
!  Measure  
15  

Indexing:  CPU    
CPU Load
16  

Indexing:  IO  
Writes Reads
17  

Indexing  Test  Findings  
!  CPU  U>liza>on  
­ ~35%  in  this  case,  4--5  Real  CPU  Cores  
!  IO  U>liza>on    
­ Characterized  by  both  reads  and  writes  but  not  as  demanding  as  search.   Note  the  splunk--op8mize  process.  
!  Inges>on  Rate    
­ 22MB/s   ­ "Speed  of  Light"  ­  no  search  load  present  on  the  server  
18  

Index  Pipeline  Paralleliza>on  
!  Splunk  6.3+  can  maintain  mul>ple  independent  pipelines  sets    
ê i.e.  same  as  if  each  set  was  running  on  its  own  indexer    
!  If  machine  is  under--u>lized  (CPU  and  I/O),  you  can  configure  the   indexer  to  run  2  such  sets.    
!  Achieve  roughly  double  the  indexing  throughput  capacity.     !  Try  not  to  set  over  2   !  Be  mindful  of  associated  resource  consump>on    
19  

Indexing  Test  Conclusions  
!  Distribute  as  much  as  you  can  ­  Splunk  scales  horizontally  
!  Enable  more  pipelines  but  be  aware  of  compute  tradeoff    
!  Tune  event  breaking  and  &mestamping  aWributes  in  props.conf   whenever  possible  
!  Faster  disk  (ex.  SSDs)  would  not  have  necessarily  improved   indexing  throughput  by  much  
!  Faster,  but  not  more,  CPUs  would  have  improved  indexing   throughput  ­  modulo  pipeline  paralleliza>on  
20  

Next:  Searching  
!  Real--life  search  workloads  are  extremely  complex  and  very  varied  to   be  profiled  correctly  
   !  But,  we  can  generate  arbitrary  workloads  covering  a  wide  spectrum  
of  resource  u>liza>on  and  profile  those  instead.  Actual  profile  will   fall  somewhere  in  between.    
IO                                         CPU  
21  

Search  pipeline  (High  Level)  

Some  preparatory   steps  here  

Find  buckets   based  on  search  
>merange  

For  each  bucket   check  tsidx  for   events  that  match   LISPY  and  find   rawdata  offset  

For  each  bucket   read  journal.gz  at   offsets  supplied   by  previous  step  

Process  events:  st   rename,  extract,   report,  kv,  alias,  
eval,  lookup,   subsecond    

Repeat  un>l  search  completes  

Filter  events  to   match  the  search  
string  (+   evenWyping  
tagging)  

Write  temporary   results  to  
dispatch  directory  

Return  progress   to  SH  splunkd  
22  

Search  pipeline  boundedness    

Some  preparatory   steps  here  

Find  buckets   based  on  search  
>merange  

For  each  bucket   check  tsidx  for   events  that  match   LISPY  and  find   rawdata  offset  

For  each  bucket   read  journal.gz  at   offsets  supplied   by  previous  step  

Process  events:  st   rename,  extract,   report,  kv,  alias,  
eval,  lookup,   subsecond    

Repeat  un>l  search  completes  

Filter  events  to   match  the  search  
string  (+   evenWyping  
tagging)  

Write  temporary   results  to  
dispatch  directory  

IO  
23  

Return  progress   to  SH  splunkd  

Search  pipeline  boundedness    

Some  preparatory   steps  here  

Find  buckets   based  on  search  
>merange  

For  each  bucket   check  tsidx  for   events  that  match   LISPY  and  find   rawdata  offset  

For  each  bucket   read  journal.gz  at   offsets  supplied   by  previous  step  

Process  events:  st   rename,  extract,   report,  kv,  alias,  
eval,  lookup,   subsecond    

Repeat  un>l  search  completes  

Filter  events  to   match  the  search  
string  (+   evenWyping  
tagging)  

Write  temporary   results  to  
dispatch  directory  

IO  

CPU  +  Memory  

Return  progress  

to  SH  splunkd  

24  

Search  Types  
!  Dense  
­ Characterized  predominantly  by  returning  many  events  per  bucket       index=web  |  stats  count  by  clientip  
!  Sparse  
­ Characterized  predominantly  by  returning  some  events  per  bucket     index=web  some_term  |  stats  count  by  clientip  
!  Rare  
­ Characterized  predominantly  by  returning  only  a  few  events  per  index     index=web  url=onedomain*  |  stats  count  by  clientip  
  
25  

Okay,  let's  test  some  searches  
!  Use  our  already  indexed  data    
­ It  contains  many  unique  terms  with  predictable  term  density  
!  Search  under  several  term  densi>es  and  concurrencies      
­ Term  density:  1/100,  1/1M,  1/100M   ­ Search  Concurrency:  4  ­  60   ­ Searches:    
ê Rare:  over  all  1TB  dataset   ê Dense:  over  a  preselected  &me  range    
!  Repeat  all  of  the  above  while  under  an  indexing  workload   !  Measure  
26  

Dense  Searches  
%  CPU  U>l.  vs.  Concurrency  (1/100)    

%  IO  Wait  vs.  Concurrency  (1/100)    

What's  going   on  here?  

27  

Dense  Searches  
%  CPU  U>l.  vs.  Concurrency  (1/100)    

%  IO  Wait  vs.  Concurrency  (1/100)    
28  

What's  going   on  here?  
CPU   Bound  

Dense  Searches  with  Indexing  

%  CPU  U>l.  vs.  Concurrency  (searching  1/100)    

Indexing  off   Indexing  on  

Indexing  Thruput  vs.  Concurrency  (searching  1/100)    

Hiing  100%   earlier  

SpeedOfLight   1/100  

Test  Type   Avg.  Search  Time  
29  

Indexing  off   Indexing  on   diff  

40.58s  

43.85s  

+8.6%  

Dense  Search  Test  Conclusions  
!  Dense  workloads  are  CPU  bound     !  Dense  workloads  (repor>ng,  trending  etc.)  play  rela>vely  "okay"  
with  indexing  
­ While  indexing  throughput  decreases  by  ~40%  search  >me  increases  only   marginally  
!  Faster  disk  wont  necessarily  help  as  much  here  
­ Majority  of  >me  in  dense  searches  is  spent  in  CPU  decompressing  rawdata  +   other  SPL  processing  
!  Faster  and  more  CPUs  would  have  improved  overall  performance  
30  

Rare  Searches  
%  CPU  U>l.  vs.  Concurrency     Reads/s  (sar)   %  IO  Wait  
31  

1/M   1/100M  

Rare  Searches  
%  CPU  U>l.  vs.  Concurrency     Reads/s  (sar)   %  IO  Wait  
32  

1/M   1/100M  
IO   Bound  

Rare  Searches  with  Indexing  
%  CPU  U>l.  vs.  Concurrency    

1/M   1/100M  

Reads/s  (sar)  

%  IO  Wait  

33  

More  numbers    
Indexing  Thruput  (KB/s)  vs.  Concurrency  

SpeedOfLight   1/1M   1/100M  

Density  

Test  Type    

Indexing  off  

Avg  Search  Time   1041s  

1/1M   Indexing  on   1806s  

diff   Indexing  off   +73.5%   231s  

1/100M   Indexing  on   304s  

diff   +31.6%  

34  

Rare  Search  Conclusions  
!  Rare  workloads  (inves>ga>ve,  ad--hoc)  are  IO  bound     !  Rare  workloads  (high  IO  wait)  do  not  play  well  with  indexing  
­ Search  >me  increases  significantly  when  indexing  is  on.  Also,  indexing  throughput  takes  an  equal   hit  on  the  opposite  direc>on.  
!  1/100M  searches  have  a  lesser  impact  on  IO  than  1/1M.     !  When  indexing  is  on,  in  1/1M  case  search  >me  increases  more  substan>ally  vs.  
1/100M.  Search  and  indexing  are  both  conten>ng  for  IO.     !  In  case  of  1/100M,  bloomfilters  save  precious  IO  which,  in  turn,  allows  for  a  beWer  
indexing  throughput.  
­ Bloomfilters  are  special  data  structures  that  indicate  with  100%  certainty  that  a  term  does  not   exist  in  a  bucket  (effec>vely  telling  the  search  process  to  skip  that  bucket).    
­ Note  the  higher  CPU  consump>on  during  1/100M  searches  with  indexing  on  
!  Faster  disks  would  have  definitely  helped  here   !  More  CPUs  would  not  have  improved  performance  by  much  
35  

Is  my  search  CPU  or  IO  bound?  
Guideline  in  absence  of  full  instrumenta>on     ! command.search.rawdata  ~  CPU  Bound  
­ Others:  .kv,  .typer,  .calcfields,    
! command.search.index  ~  IO  Bound  
36  

Top  Takeways/Re--Cap  
· Indexing    
­ Distribute  ­  Splunk  scales  horizontally   ­ Tune  event  breaking  and  >mestamp  extrac>on    
­ Faster  CPUs  will  help  with  indexing  performance  

· Searching  
­ Distribute  ­  Splunk  scales  horizontally     ­ Dense  Search  Workloads  
ê CPU  Bound,  beWer  with  indexing  than  rare  workloads   ê Faster  and  more  CPUs  will  help   ­ Rare  Search  Workloads   ê IO  Bound,  not  that  great  with  indexing     ê Bloomfilters  help  significantly   ê Faster  disks  will  help  
· Performance  
­ Avoid  generality,  op>mize  for  expected  case  and  add  
hardware  whenever  you  can  

Use  case    
Trending,  repor>ng   over  long  term  etc.  
Ad--hoc  analysis,   inves>ga>ve  type    

CPU  
Term   Density  
IO  
What  Helps?  
More  distribu>on     Faster,  more  CPUs  
More  distribu>on   Faster  Disks,  SSDs  

37  

Tes>ng  Disclaimer  Reminder  
1. Tes>ng  conducted  on  arbitrary  datasets   2. "closed  course"  (lab)  environment   3. Not  to  be  interpreted  out  of  context  
38  

Q  &  A  

Copyright  ©  2015  Splunk  Inc.  
You  may  also  like  
Architec>ng  and  Sizing  Your  Splunk  Deployment   Onboarding  Data  Into  Splunk    
Splunk  Health  Check.  How  is  Your  Environment  Feeling?    
  
THANK  YOU  
Feedback:  dritan@splunk.com    

