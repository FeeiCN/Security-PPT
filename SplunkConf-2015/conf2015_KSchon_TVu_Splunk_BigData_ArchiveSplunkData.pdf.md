Copyright  ©  2015  Splunk  Inc.  
Archiving  Data  From   Splunk  Indexes  
Keith  Schon,  Principal  Engineer  ­   Hunk   Theresa  Vu,  Director  of  Product   MarkeGng  ­  Big  Data  

Disclaimer  
During  the  course  of  this  presentaGon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauGon  you  that  such  statements  reflect  our   current  expectaGons  and  esGmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaGon  are  being  made  as  of  the  Gme  and  date  of  its  live   presentaGon.  If  reviewed  aUer  its  live  presentaGon,  this  presentaGon  may  not  contain  current  or   accurate  informaGon.  We  do  not  assume  any  obligaGon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiGon,  any  informaGon  about  our  roadmap  outlines  our  general  product  direcGon  and  is  subject  to   change  at  any  Gme  without  noGce.  It  is  for  informaGonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaGon  either  to  develop  the  features  
or  funcGonality  described  or  to  include  any  such  feature  or  funcGonality  in  a  future  release.  
2  

Meet  Your  Speakers  

Keith  Schon  
· Principal  Engineer  for  Hunk   · Joined  Splunk  in  Oct  2014   · Most  interesGng  item  ordered  
online:  
­ Indonesian  octopus  
· Favorite  Splunk  t--shirt  saying:  
­ Put  That  in  Your  |  and  Splunk  IT  

Theresa  Vu  
· Director  of  Product  MarkeGng  for   Hunk  and  Big  Data  
· Joined  Splunk  in  April  2015   · Secretly  hoping  future  releases  are  
named  aUer  care  bears   · Favorite  Splunk  t--shirt  saying:  
­ I  Like  Big  Data  and  I  Cannot  Lie  

3  

Agenda  
"  What's  new  in  Hunk  6.3   "  Background:  How  Splunk  stores  data   "  Non--Hadoop  data  retenGon  alternaGves  
­ Cold--to--frozen  path   ­ Cold--to--frozen  script  
"  Hunk  archive  index  funcGonality  
­ How  it  works   ­ Unified  Search   ­ ConnecGng  to  other  Hadoop  applicaGons  via  Archive  Bucket  Reader  
  
4  

What's  New  in   Hunk  6.3  

Introducing  Hunk  6.3  

Drive  Down  TCO  
"  Archive  to  Hadoop     "  Single  Splunk  Interface  
to  Search  Real--Time  &   Historical  Data  

Open  Access  for     3rd--Party  Hadoop  Tools  
"  Access  Data  Using  Hive   or  Pig  
"  Query  Without  Moving   or  ReplicaGng  Data  

Advanced  Analy;cs  &   Visualiza;ons  
"  Anomaly  DetecGon   "  GeospaGal  
VisualizaGon   "  Contextual  Display  

6  

Archive  Splunk  Data  to  HDFS  or  AWS  S3  

WARM   COLD   FROZEN  

Hadoop  Clusters  

Drive  Down  TCO  by  Archiving  Historical  Data  to   Commodity  Hardware  

Unified  Search  
Intelligently  Search  Across  Real--Time  and  Historical  Data  using  the  Same  Splunk  Interface  

Real--Time  Data  

Historical  Data  in  Hadoop  

Open  Access  to  Historical  Data  Using     3rd--party  Hadoop  tools  

Hadoop  Clusters  

Splunk  Archive   Reader  for  Hadoop  

Data  Scien;st  

Historical  Data  in  HDFS  

3rd--Party  Hadoop  Tools  

· Use  3rd--party  Hadoop  tools  (e.g.,  Hive,  Pig)  to  perform  addiGonal  analysis   · Broaden  data  access  to  wider  set  of  audiences,  e.g.  data  scienGsts  and  analysts   · Run  queries  without  moving  or  replicaGng  data  
9  

Advanced  AnalyGcs  and  VisualizaGon  CapabiliGes  
· Anomaly  DetecGon  
­ Incorporates  Z--Score,  IQR  &   histogram  methodologies  in  a  single   command  
· GeospaGal  VisualizaGon  
­ Visualizes  metric  variance  across  a   customizable  geographic  area  
· Single  Value  Display  
­ Derive  more  context  by  layering  on   visual  cues  and  more  flexible   formaCng  
10  

Get a Free
License!
Index 100GB data per day or higher Visit Hunk booth in the App Showcase Attend "Archive Splunk Data and Access
Using Hadoop Tools" session
11

Why  Is  Archiving  Important?  
Want  to  keep  some  data  for  a  very  long  Gme  
· Historical  data  useful  for  long--term  modeling  and  machine  learning   · Legal  requirement  and/or  corporate  data  retenGon  policies  may  mandate  the  
data  be  accessible  and  searchable  for  set  minimum  periods  
   Also  want  to  control  Total  Cost  of  Ownership  (TCO)  of  data  systems  
· Keeping  more  and  more  data  in  producGon  means  more  and  more  $$$  spent  on   hardware,  uGliGes,  IT  effort,  etc.  
Splunk  provides  a  myriad  of  opGons,  giving  you  the  flexibility  to  manage  the   trade--off  of  data  availability  vs.  TCO  in  the  way  that  is  best  for  your  business  
12  

Review:  How  Splunk   Stores  Data  

Splunk  Enterprise  Architecture  
Search  Head:  Provides  Splunk  Web  interface.   Coordinates  queries  across  indexers.  Final   processing  of  query  results.  May  be  clustered.      Indexers:  Maintain  Splunk  indexes.  Do  much  of  the   work  of  queries.  Need  good  storage,  and  CPU.    
­ What  do  we  do  when  these  run  out  of  space?  
   Forwarders:  Live  where  the  data  is  created.   Forward  data  to  the  indexers.  
14  

Hunk  And  Virtual  Indexes  

· Virtual  index:  Data  on  a   distributed  file  system,   typically  HDFS  or  S3.  
· MapReduce  used  to   compute  queries  in   parallel  fashion.  
· Virtual  and  non--virtual   indexes  may  be  queried   together  from  the  same   Search  Head.  

Hadoop  
MapReduce  
HDFS  (or  S3,  GPFS,   etc.)  

15  

Understanding  Splunk  "Buckets"  
· A  Splunk  index  stores  data  in  chunks  called  buckets   · A  buckets  contains  events  from  only  one  index,  from  finite  period  of  Gme  
­ Contains  raw  events,  may  contain  addiGonal  files  for  indexing  and  filtering   · Buckets  age  or  ("roll")  through  lifecycle  phases  

Hot   Can  be  wriqen  to?   Yes   Can  be  searched?   Yes  

Warm   No   Yes  

Cold   No   Yes  

Frozen   Thawed  

No  

No  

No  

Yes  

16  

Bucket  Lifecycle  

Bucket  aging   pipeline  

Hot  

Warm  

homePath  
Make  frozen   data  searchable  
again  

Delete  data   from  Thawed  

Cold  
coldPath  
Thawed  
thawedPath  
Thawed  

"Frozen"   "Frozen"   "Flushed"  

17  

Bucket  Lifecycle  ConfiguraGons  
maxTotalDataSizeMB  (default  is  500,000  MB)   maxVolumeDataSizeMB  

Hot  

Warm  

Cold  

Frozen  or    

Delete  

maxHotBuckets   maxDataSize  

maxWarmDBCount   frozenTimePeriodInSecs   (default  is  6  years)  
18  

"Frozen"  Buckets:   (Non--hunk)  Archiving  
AlternaGves  

Freezing  Buckets  

· Buckets  are  rolled  from  "cold"  to  "frozen"  when  the  index  is   taking  up  too  much  space  

· By  default,  this  means  the  bucket  gets  deleted  

· In  many  cases  this  is  fine,  but  what  if:  
­ You  need  fine--grained  control  to  comply  with  data  retenGon     policies?  
­ You  want  to  minimize  TCO  by  storing  older  data  on  cheaper     hardware?  

?   ?  

20  

AlternaGve  1:    Archive  To  File  System    
· Have  Splunk  copy  frozen  buckets  to  another  directory  
­ Directory  specified  in  the  index  configuraGon  via  "coldToFrozenDir"   ­ May  be  located  on  slow  and/or  inexpensive  storage,  possibly  a  NAS  or  SAN  
· Advantages:   ­ Easy  to  configure  
· Disadvantages:  
­ Archive  locaGon  must  be  accessible  via  the  file  system   ­ Frozen  data  is  not  searchable  
ê Buckets  can  be  made  searchable  again  by  copying     (by  hand)  to  a  "thawed"  directory  for  the  index  
21  

AlternaGve  2:    Archive  Via  Script    
· Run  an  arbitrary  script  on  buckets  as  they  are  rolled  from  cold  to  frozen  
­ Script  specified  in  the  index  configuraGon  via  "coldToFrozenScript"   ­ Script  can  perform  any  desired  acGon,  e.g.  encrypt  data,  scp  data  to  remote  system,  send  to  
tape  backup  system   ­ Splunk  will  respect  the  return  value  of  the  script:  will  only  delete  the  bucket  following  a  
successful  script  execuGon  
· Advantages:  
­ Extremely  flexible    
· Disadvantages:  
­ User  has  responsibility  for  maintaining  the  script  and     guaranteeing  its  reliability  
­ Frozen  data  is  sGll  not  searchable  
22  

Hunk  Archive  Indexes  

AlternaGve  3:  Hunk  Archiving  To  Hadoop  
· Archiving  to  Hadoop  available  with  Hunk   · Extremely  scalable   · Data  remains  searchable,  using  Hunk  
Keep  the  same  interface  and  use  the  same  queries  you     already  use  to  search  your  data,  but  store  your  data  on  HDFS*   instead  of  on  your  indexers      *Or  any  other  Hadoop--compaGble  file  system  (e.g.  S3,  GPFS,   CleverSafe)  
24  

Splunk  Archiving  To  Hadoop  

Once  per  hour,  the   Search  Head  tells  all   the  indexers  to   archive  to  Hadoop  

Hunk  
Search  Head   Indexer  

Hadoop  
NameNode   DataNode  

Indexer  

DataNode  

Indexer   25  

DataNode  

Splunk  Archiving  To  Hadoop  

The  indexers  look   for  buckets  that   qualify  for   archiving.  They   compute  an   appropriate  HDFS   path,  and  ask  the   name  node  where   to  write  to.  

Hunk  
Search  Head   Indexer   Indexer  

Hadoop  
NameNode   DataNode   DataNode  

Indexer  

DataNode  

26  

Splunk  archiving  to  Hadoop  

Buckets  are   wriqen  to  HDFS,   with  appropriate   replicaGon.  

Hunk  
Search  Head   Indexer   Indexer   Indexer  

HDFS  

NameNode  

Bucket  1  

DataNode  

Bucket  2  

...   DataNode  

Bucket  N   DataNode  

27  

What  Gets  Copied?  
· The  compacted  raw  data,  in  the  format  in  which  it's  stored  in  the   bucket  (journal.gz  files)  
· The  Gmestamps  of  the  earliest  and  latest  events  in  the  bucket  are   encoded  in  the  path,  to  speed  up  later  search  
· Auxiliary  files  (e.g.  tsidx,    bloom  filters)  are  not  copied  
­ Less  suitable  to  Hadoop  searches,  and  take  up  a  lot  of  space  
28  

What  About  Hadoop  Connect?  

HC  is  an  older  soluGon  implemented  as  an  app.   Runs  a  query,  and  writes  them  to  HDFS.  But  this   can  be  very  resource  intensive:  
"  Network:  
­ Data  is  first  transferred  from  the  indexers,  then  to  HDFS   ê Data  is  transferred  twice   ê Makes  SH  server  a  network  boqleneck  
"  CPU:  
­ All  events  must  be  parsed  from  the  indexes,  then     transformed  into  final  storage  format  

As  data  sizes  increase,  so  does  the  load  on  the  Search  
Head.    

Hadoop  

Hadoop  compaGble   file  system  

29  

Archiving  Scalability  
· Each  indexer  transfers  data  directly  to  Hadoop:  no  single  machine  boqleneck,   scale  with  number  of  indexers  
­ Note:  You  can  configure  the  maximum  bandwidth  used  per  indexer  so  as  to  not  max   out  your  network  
· Raw  data  files  (journal.gz)  bulk  copied  as  is  
­ No  need  to  parse  events  with  
­ No  need  to  transform  final  format   · Copy  only  data  necessary  to  support  later  searches  
30  

Configuring  An  Archive  Index  
In  indexes.conf,  add  a  stanza  like  this:  
   [foo_archive]! vix.output.buckets.from.indexes = foo! vix.output.buckets.older.than = 86400 # age in seconds! vix.output.buckets.path = /hdfs/path/to/archive! vix.provider = hadoop_provider!   
OpGonal  parameter  (N  is  MB  /  sec,  sevng  to  0  means  no  limit):  
vix.output.buckets.max.network.bandwidth = N!
!
(OpGonal)  Add  this  to  the  to  the  stanza  of  the  original  index  (in  this  example,  foo):  
coldToFrozenScript = "$SPLUNK_HOME/etc/apps/splunk_archiver/bin/coldToFrozen.sh"!
!
!
31  

Is  An  Archive  Index  Searchable?  
· Yes!  If  "foo_archive"  is  an  archive  index  of  "foo",  then:  
­ Count  the  number  of  events  in  original  index:   "index=foo  |  stats  count"   ­ Count  the  number  of  events  in  the  archive:   "index=foo_archive  |  stats  count"  
· Remember  that  the  original  and  the     archive  indexes  will  have  overlapping     events,  so  using  both  in  the  same     query  may  produce  duplicates  
­ Which  is  why  we've  introduced...  
32  

Unified  Search  
· New  for  Hunk  6.3  
· Transparently  searches  across  both  archive  and  original  indexes,  without  duplicates  
­ E.g.  "index=foo  |  stats  count"  will  give  the  total  number  of  unique  events  currently  in  foo,  or  in   foo_archive,  with  no  double--counGng  
­ Requires  the  index  be  explicitly  idenGfied:  will  not  work  with  index=*  or  index!=foo.  

Original  index   Archive  index  

Switch  over  based  on  vix.unified.search.cutoff_sec  =   Time  in  Seconds  
Event  Gme  
33  

Configuring  Unified  Search  
Enable  unified  search  on  the  installaGon:  In  limits.conf,  add  this  stanza:   [search]! unified_search = true!    Then  for  each  archive  index  for  which  you  want  to  allow  unified  search,  add  this  to  its  stanza:   [foo_archive]! ...! vix.unified.search.cutoff_sec = N!    Where  N  is  the  number  of  second  before  search  Gme  (i.e.  before  "now")  that  you  want  the  cutoff   from  the  archive  index  to  the  original  index  to  occur  
34  

Splunk  Archive   Bucket  Reader  

· Problem:   Archived  buckets  are  in  a  Splunk  proprietary  format.  What  if  you  need  to   integrate  with  3rd  party  soUware  systems?  
· Answer:   Splunk  Archive  Bucket  Reader    
   Packaged  as  a  Splunk  app.  Available  on  hqps://splunkbase.splunk.com  as  "Bucket   Reader".  
36  

CapabiliGes  
· Implements  Hadoop  InputFormat  (and  related  classes)  to  allow  any  Hadoop-- based  applicaGon  to  read  archived  buckets.   · Provides  the  raw  data  of  the  original  event,  plus  all  indexed  fields  
­ NOTE:  Does  NOT  provide  access  to  search--Gme  extracted  fields.  
· Use  as  a  plug--in  for  custom  applicaGons,  Hive,  Pig,  etc.   · Use  for  real--Gme  querying,  or  transform  archived  buckets  into  new  format.  
37  

Bucket  Reader  App  Includes  Full  DocumentaGon  
Includes  javadoc,  sample  applicaGon,  usage  examples,  etc.  
38  

Hive  Example  
39  

Conclusions  

MulGple  OpGons  Available  
Choose  the  opGon  that  suits  your  data  retenGon  needs  and  constraints.  

· Cold--to--frozen  path  
­ Use  cheap  aqached  storage   ­ Very  easy  to  configure  
· Cold--to--frozen  script  
­ Maximum  flexibility   ­ Leaves  the  work  to  the  administrator  

· Archive  to  Hadoop  
­ Move  data  to  Hadoop   ­ Can  search  using  Hunk   ­ With  Splunk  Archive  Bucket  Reader,  very  
flexible   ­ Extremely  scalable  

41  

THANK  YOU  

