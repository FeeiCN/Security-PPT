Copyright  ©  2015  Splunk  Inc.  
Indexer  Clustering  ­   Tips  &  Tricks  
   Da  Xu   dxu@splunk.com  
So@ware  Engineer,  Splunk  

Disclaimer  
During  the  course  of  this  presentaIon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauIon  you  that  such  statements  reflect  our   current  expectaIons  and  esImates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaIon  are  being  made  as  of  the  Ime  and  date  of  its  live   presentaIon.  If  reviewed  a@er  its  live  presentaIon,  this  presentaIon  may  not  contain  current  or   accurate  informaIon.  We  do  not  assume  any  obligaIon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiIon,  any  informaIon  about  our  roadmap  outlines  our  general  product  direcIon  and  is  subject  to   change  at  any  Ime  without  noIce.  It  is  for  informaIonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaIon  either  to  develop  the  features  
or  funcIonality  described  or  to  include  any  such  feature  or  funcIonality  in  a  future  release.  
2  

Indexer  Clustering  Overview  

search  head  

Cluster!  
master  

Indexer   Buckets   Primary  

4  

CommunicaIon  Through  Endpoints  

The  cluster  master  and  peers  communicate  amongst  

themselves  through  the  clustering  endpoints  on  the   management  ports.  Some  examples:  

master  

8089  

  

· Peers-->Master:     · /services/cluster/master/peers  

8000   8089  

8089  

· Add  Peer  to  cluster  

· Heartbeat  to  master  

· /services/cluster/master/buckets  

8089  

· Alert  master  there  is  a  new  bucket  

Browser  

· Alert  master  a  bucket  changes  (hot  -->  warm,  

warm  -->  frozen)  

· Master-->Peers  

· /services/cluster/slave/buckets  

· Change  primaries  

· Become  searchable  /  unsearchable  

5  

What's  my  cluster  doing?  

Endpoints  Are  Logged!  
Bucket  primary  changes!   Buckets  being  frozen!  
7  

Metrics.log  
· Cluster  master/slave  acIvity  can  be  found  under  cmmaster*  or  cmslave*  groupings/names     · Metrics  about  cluster  endpoints  
· How  many  Imes  each  endpoint  was  hit   · How  long  we  spent  in  those  endpoints   · Metrics  about  jobs  (rep  fixup  jobs,  searchable  fixup  jobs,  freeze  jobs,  etc)   · How  many  jobs  remain?   · How  many  #  of  buckets  do  we  sIll  need  to  fix?  
8  

Clustering  Logs/AcIvity  

splunkd_access.log  

metrics.log  

· Each  individual  endpoint  access   · (master--side)  services/cluster/master/...   · (indexer--side)  services/cluster/slave/...  
· How  long  we've  spend  at  the  endpoint  (ms)   · Higher  Imes  indicate  the  CM/Indexer  is  swamped  
with  work  (>50ms?  >100ms?)   · The  response  (200  =  success,  non  200  =  failure)  

Metric  informaIon  with  regards  to  Clustering  AcIvity,   recorded  every  30  seconds.  
· name=cmmaster_endpoints   · group=subtask_count    total  number  of  accesses   · group=subtask_seconds  Ime  Splunk  spent   responding  to  these  endpoints  
· name=cmmaster_executor   · "Jobs"  the  CM  has  scheduled,  finished,  and  current   size  of  jobs  to  complete   · Jobs  are  responsible  for  hiqng  the  endpoints   and  performing  the  acIon  (move--primary,   freeze,  etc)  
· group=jobs,  name=cmmaster   · Actual  counts  of  the  jobs  and  their  jobnames  
   Indexers  have  their  own  corresponding  jobs  (cmslave)  

9  

Cluster  AcIvity  
10  

Cluster  AcIvity  

Searchable  

RF  Met  
11  

SF  Met  

Buckets  

More  Buckets  More  Problems  
13  

More  Buckets  More  Problems  
· More  buckets  (and  more  peers)  means  the  CM  has  to  do  more  work   · Iterates  through  each  bucket,  checking  whether  it  needs  to  queue  up  any  fixup   jobs   · ReplicaIon  Jobs  (to  meet  RF)   · Search  Jobs  (to  meet  SF)   · Primary  Jobs  (all  buckets  need  to  have  a  primary  copy  per  site)   · Other  jobs  (freezing,  checksum,  rolling,  etc)  
· As  the  number  of  buckets  grows,  CM  responsiveness  goes  down  
14  

More  Buckets  More  Seqngs  

server.conf  

service_interval  (CM)  

Specifies  how  o@en  the  CM  should  look  through  the  buckets,  scheduling  jobs  as  necessary.   Default  =  1.     · Adjust  to  1  sec  for  every  50k  buckets.  

heartbeat_period  (Indexer)   Specifies  how  o@en  the  Indexers  contact  the  CM.  Defaults  to  every  1  second.   · For  lots  of  peers  (  >50)  or  lots  of  buckets  (>100k),  we  can  increase  this  value  to  5--30.  

heartbeat_Imeout  (CM)  

Specifies  how  long  before  an  Indexer  is  considered  `Down'  when  no  heartbeats  comes  in.   · MulIple  of  heartbeat_period,  anywhere  from  20x  ­  60x  

cxn_Imeout  (CM+Indexer)   rcv_Imeout  (CM+Indexer)   send_Imeout  (CM+Indexer)  

Specifies  how  long  before  an  intra--cluster  connecIon  will  terminate.  Default  =  60.   · If  a  cluster  indexer  Imes  out,  it  will  re--add  itself  to  the  CM,  which  itself  is  a  busy  
operaIon  (it  needs  to  resync  the  state  of  all  its  buckets),  which  can  lead  to  negaIve  
feedback  loops...   · These  can  be  bumped  up  for  busier  clusters  (300s).  

indexes.conf  

rotatePeriodInSecs  (Indexer)   Specifies  how  o@en  to  check  through  all  the  buckets  ­  rolling  them  from  hot-->warm-->cold   as  necessary.  Default  =  60   · 10min=600  

15  

InspecIng  Buckets  
services/cluster/master/buckets   · Which  peers  does  the  bucket  exist  on?   · Which  peers  is  the  bucket  primary?   · Is  the  bucket  searchable/unsearchable/
pending--searchable?  
16  

17  

InspecIng  Buckets  
There's  so  many  buckets!  How  do  I  find  one  that  I  care  about?   Why  would  I  care?      Filters!  services/cluster/master/buckets?filter=      · Which  buckets  do  not  have  primaries?  
· buckets?filter=has_primary=false   · Which  buckets  do  not  meet  my  RF=3?  
· buckets?filter=replicaIon_count<3   · Which  buckets  are  frozen?  
· buckets?filter=frozen=true   · Standalone?  
· buckets?filter=standalone=true   · Standalone  and  frozen?  
· buckets?filter=standalone=true&filter=frozen=true   · (don't  think  this  is  a  thing)   · Don't  meet  RF=3  and  index=main?   · buckets?filter=replicaIon_count>3&filter=index=main  
18  

Modifying  Buckets  
Endpoints!        · Freeze  a  bucket:  
· curl  --k  --u  admin:changeme  hxps://{indexer}:{mgmt}/services/data/indexes/{INDEX}/freeze-- buckets  --d  bucket_ids=46_11115C7A--E2F0--4225--A740--4ED6BD2D9CE5  --X  POST  
· Remove  a  copy  of  a  bucket:   · curl  --k  --u  admin:changeme  "hxps://{master}:{mgmt}/services/cluster/master/buckets/ main~1490~D4A07A5D--3C3C--4D36--BD70--D610B432466F/remove_from_peer"  --d   peer={PEER_GUID}  
· Remove  all  copies  of  a  bucket:   · curl  --k  --u  admin:changeme  "hxps://{master}:{mgmt}/services/cluster/master/buckets/ main~1490~D4A07A5D--3C3C--4D36--BD70--D610B432466F/remove_all"  --d  peer={PEER_GUID  
19  

Other  Useful  Knowledge  

Site1  search  head  
Site1  Indexers  
1   1   1   2  

MulIsite  Search  Affinity  

Site2  search  head  
Site2  Indexers  
1   2   1   2  

· When  a  searchable  copy  becomes   available  on  a  site,  splunk  will  move  the   primary  for  that  site  to  its  local  copy  
· Buckets  on  a  site  will  return  events  to  a   searchhead  with  the  same  site.  
· If  a  peer  goes  down,  the  master  will  move   the  primaries  that  peer  had  to  another   copy  
· If  the  enIre  site  goes  down,  the  other   site(s)  will  become  primaries  

1   2  

21  

Sseitaer30c h se  haerachd  head  
Site1  Indexers  
30   30  

MulIsite  Search  Affinity  

Site2  Indexers  
03  

· Splunk  6.3  ­  site0   · Primaries  behave  just  like  non--mulIsite,   without  any  regards  to  site!  
· Pre  6.3   · Workaround!   · Add  another  site  to  available_sites   · Set  SH  (no  indexers)  to  new  site   · Make  sure  to  call  "splunk  set  indexing-- ready"  on  every  CM  restart  
· (wont  work  if  your  excess  `total'  sites  is  greater  than   the  #  of  non--specified  sites...  ie  origin:1  total:3  in  our   illustraIon  will  not  work,  because  then  the  CM  will  try   to  put  the  2  non--origin  copies  into  a  site  each,  and   there  are  no  indexers  in  site3!)  
22  

Stop  Indexing  on  a  Cluster--Indexer  
· DetenIon  Peer  stops  indexing  data  and  doesn't   accept  any  input,  but  sIll  serves  search  queries  
· 6.3  ­  turn  on/off  detenIon  with  an  endpoint!  
· curl  --k  --u  admin:changeme  hxps://{INDEXER}:{MGMT}/services/cluster/ slave/control/control/set_detenIon_override  --d  value=true  --X  POST  
· Pre  6.3  ­  server.conf     · [diskUsage]  minFreeSpace=5000  (default)   · Set  to  50000000   · (Requires  a  restart)  
23  

Miscellaneous   Q&A  
24  

THANK  YOU  

