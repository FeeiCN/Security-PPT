Copyright  ©  2015  Splunk  Inc.  
Architec:ng  Splunk  for   High  Availability  and   Disaster  Recovery  
Dritan  Bi:ncka  
Splunk  Technical  Services  

Disclaimer  
During  the  course  of  this  presenta:on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau:on  you  that  such  statements  reflect  our   current  expecta:ons  and  es:mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta:on  are  being  made  as  of  the  :me  and  date  of  its  live   presenta:on.  If  reviewed  aQer  its  live  presenta:on,  this  presenta:on  may  not  contain  current  or   accurate  informa:on.  We  do  not  assume  any  obliga:on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi:on,  any  informa:on  about  our  roadmap  outlines  our  general  product  direc:on  and  is  subject  to   change  at  any  :me  without  no:ce.  It  is  for  informa:onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga:on  either  to  develop  the  features  
or  func:onality  described  or  to  include  any  such  feature  or  func:onality  in  a  future  release.  
2  

About  me     
   !  Member  of  Splunk  Tech  Services   !  Large  scale  deployments   !  Cloud  and  Big  Data   !  FiQh  .Conf  

AGENDA  
Disaster  Recovery      High  Availability  
· Data  Collec:on   · Indexing  &  Searching     
Top  Takeaways  

Recover  in  the  event  of   a  disaster  
  
Maintain  an  acceptable   level  of  con<nuous   service  

Disaster  Recovery  (DR)  

DR   What  is  Disaster  Recovery?  
Set  of  processes  necessary  to  ensure  recovery   of  service  aQer  a  disaster  
6  

DR  

Disaster  Recovery  Steps  

1  

  Backup  necessary  data  
  
  Backup  to  a  medium  at  least  as  resilient  as  source  
  Local  Backup  vs.  Remote  
  

2  

  Restore  
  
  Ensure  this  works  
  Backup  is  worthless  without  restore  
  

7  

DR  

Backup  

1  

a     Configura:ons     $SPLUNK_HOME/etc/*  
b     Indexes       Buckets:  Hot*,  Warm,  Cold,  Frozen     
8  

DR   Backup  Configura:ons  
Splunk  Instance  
$SPLUNK_HOME/etc/*  
9  

DR  

Backup:  Bucket  Lifecycle  

Events  

[Out  of  volume  space  or  

[Hot  Bucket  is  Full]  

too  many  warms]  

$  Home  Path  

[Out  of  Space  or  Bucket  is  Old]  
$  Cold  Path  
[Cheaper  Storage]  

$  Thawed  Path  

[Explicit  User  Ac:on]  
$  Frozen  Path   or  Deleted  

10  

DR  
Bucket  Type  

Backup  Data  
State   Read  +  Write    

Can  Backup?   No*  

Read  Only  

Yes  

Read  Only  

Yes  

*Unless  using  snapshot  aware  FS  (VSS,  ZFS)  or  roll  to  warm  first  (which  introduces  a  performance  penalty).  
11  

DR   Restore  Configura:ons  
New  Splunk  Instance  

$SPLUNK_HOME/etc/*  

$SPLUNK_HOME/etc/*  

12  

DR  

Restore  Data  

New  Splunk  Instance  

$Indexes_Loca:on  
($SPLUNK_HOME/var/lib/splunk)  

$Indexes_Loca:on  
($SPLUNK_HOME/var/lib/splunk)  

Splunk  advises  restoring  fully  from  a  backup  rather  than  restoring  on  top  of  a  par:ally  corrupted  datastore.    
13  

DR   Backup  Clustered  Data  
!  Op<on  1:  Backup  all  data  on  each  node  
­   Will  also  result  in  backups  of  duplicate  data    
!  Op<on  2:  Iden:fy  one  copy  of  each  bucket  on  the  cluster  and   backup  only  those  (requires  scrip:ng)  
­ Decide  whether  or  not  you  need  to  also  backup  index  files  
Bucket  naming  conven<ons   Non--clustered  buckets:  db_<newest_<me>_<oldest_<me>_<localid>   Clustered  original  bucket:  db_<newest_<me>_<oldest_<me>_<localid>_<guid>   Clustered  replicated  bucket  copies:  rb_<newest_<me>_<oldest_<me>_<localid>_<guid>    
14  

DR   Puqng  Restore  Together  

2  

a     New  Splunk  Instance   b     Configura:ons   C     Data/Indexes  
15  

DR  

Things  to  think  about:  

   Recovery  Time  and  Tolerable  Loss  
vs.  
Complexity  and  Cost      !  Other  custom  factors  in  your  environment    
­ Ex.  Job  ar<facts,  DM,  Collec<ons  if  DR'ing  a  Search  Head  

16  

High  Availability  (HA)  

HA   What  is  High  Availability?  
A  design  methodology  whereby  a  system  is   con:nuously  opera:onal,  bounded  by  a  set  of  
predetermined  tolerances.    
Note:  "high  availability"  !="complete  availability"    
18  

HA   Splunk  High  Availability  
1     Data  Collec<on/Recep<on   2     Searching   3     Indexing  
19  

HA  

Data  Collec:on  

A  

Indexers  

B  

.  .  .  

Forwarder  

.  .  .     Forwarder  
20  

Forwarder  

HA  

Data  Collec:on  

A  

Indexers  

B  

.  .  .  

outputs.conf:          [tcpout]     defaultGroup  =  mygroup        [tcpout:mygroup]     server  =  A:9997,  B:9997     autoLB  =  true  

Forwarder  

.  .  .     Forwarder  
21  

Forwarder  

HA  

Searching  

2  

a   Search  Head  Clustering  (SHC)   b   Search  Head  Pooling  (SHP)  

22  

HA  

Searching  
Typical  Search   Hierarchy  

Indexer  A  

Indexer  B  

.  .  .    

23  

Indexer  N  

HA  

Searching  
Typical  Search   Hierarchy  

Indexer  A  

Indexer  B  

.  .  .    

24  

Indexer  N  

HA  

Search  Head  Pooling  

NFS  based  Search  Head  Pooling   has  been  deprecated*      *s:ll  works  and  supported  for   current  Splunk  version  but  plan   for  its  eventual  removal.  
25  

HA  
A  

SHP  

NFS  

B  

NFS  used  to  sync:   SH  Configura<ons   Job  Ar<facts   SH  Schedulers  

Indexer  A  

Indexer  B  

.  .  .     Indexer  N  

26  

HA   Search  Head  Clustering  (SHC)  
   !  Improved  horizontal  scaling     !  Improved  high  availability   !  No  single  point  of  failure  
27  

HA  
NFS--less   NFS--less   NFS--less  

SHC  vs.  SHP  

SHC  

Uses  NFS  

SHP  

Single  point  of  failure  

Performance  issues  

28  

HA  

SHC  

A  

B  

C  

Replica:on  protocol  syncs:   --  Configura:ons   --  Job  Ar:facts  

Indexer  A  

Indexer  B  

Indexer  C   .  .  .     Indexer  N  
29  

HA  

SHC  

Replica:on  protocol  syncs:   --  Configura:ons   --  Job  Ar:facts  

A  

B  

C  
Configura:ons  

Deployer  

Deployer  ensures  iden:cal   deployed  configura:ons  

Indexer  A  

Indexer  B  

Indexer  C   .  .  .     Indexer  N  
30  

HA  

SHC  

Replica:on  protocol  syncs:   --  Configura:ons   --  Job  Ar:facts  

Indexer  A  

A  

B  

C  

Captain  

Configura:ons  

Deployer  

Indexer  B  

Indexer  C   .  .  .     Indexer  N  
31  

Captain  plays  a  special  role  in   cluster  orchestra:on  and  job   scheduling.  

HA   SHC  Opera:on  --  High  Level    
!  Deployer  ensures  all  SHC  members  have  iden:cal  baseline   configura:ons  
­ Subsequent  UI  changes  propagated  using  an  internal  replica:on  mechanism  
!  Job  Scheduler  gets  disabled  on  all  members  but  the  Captain   !  Captain  selects  members  to  run  scheduled  jobs  based  on  load  
­ Selec:on  based  on  load  sta:s:cs.  Ensures  bewer  load  distribu:on  vs.  SHP  
!  Captain  orchestrates  job  ar:fact  replica:on  to  selected  members/ candidates  of  the  cluster.  
!  Transparent  job  ar:fact  proxying  (and  eventual  replica:on)  if  ar:fact   not  present  on  user's  SH.    
32  

HA  

Deploying  SHC  

!  Same  SH  version  and  high  speed  network  (LAN)  
­ More  storage  required  vs.  stand--alone  SHs.  Linux/Solaris  only  
!  Needs  LB  and  a  Deployer  instance  (DS  or  MN  can  also  be  used  to   fulfill  this  role)  
!  Select  RF  per  your  HA/DR  requirements     !  Configure  Deployer  first  with  a  secret  key     !  Ini:alize  each  instance,  point  them  to  Deployer,  then  bootstrap  one  
of  them  to  become  the  cluster  captain   !  More  details  on  Splunk  Docs  
33  

HA  
3  

Indexing   Indexer  Clustering  

34  

HA  

Index  Replica:on  

!  Cluster  =  a  group  of  search  peers  (indexers)  that  replicate  each  others'   buckets  

!  Data  Availability  
­ Availability  for  inges:on  and  searching    

!  Data  Fidelity    
­ Forwarder  Acknowledgement,  assurance      

Trade  offs  

!  Disaster  Recovery    
­ Site  awareness    
!  Search  Affinity    
­ Local  search  preference  vs.  remote    

· Extra  storage    
· Slightly  increased   processing  load.    

35  

HA  

Cluster  Components  

· Master  Node  
· Orchestrates  replica:on/remedial  process.  Informs  the  SH  where  to  find   searchable  data.  Helps  manage  peer  configura:ons.  
· Peer  Nodes  
· Receive  and  index  data.  Replicate  data  to/from  other  peers.  Peer  Nodes   Number    RF  
· Search  Head(s)  
· Must  use  one  to  search  across  the  cluster.    
· Forwarders    
· Use  with  auto--lb  and  indexer  acknowledgement  

36  

HA!
Single Site Cluster Architecture!
Credit:  Splunk  Docs  Team     37  

Credit:  Splunk  Docs  Team    

HA!
Replica<on  Factor  (RF)  
· Number  of  copies  of  data  in   the  cluster.  Default  RF=3  
· Cluster  can  tolerate  RF--1   node  failures  
38  

Credit:  Splunk  Docs  Team    

HA!
Search  Factor  (SF)  
· Number  of  copies  of  data  in   the  cluster.  Default  SF=2  
· Requires  more  storage   · Replicated  vs.  Searchable  
Bucket  
39  

HA  

Clustered  Indexing  

!  Origina:ng  peer  node  streams  copies  of  data  to  other  clustered   peers.  
­ Receiving  peers  store  those  copies.    
!  Master  determines  replicated  data  des:na:on.  
­ Instructs  peers  what  peers  to  stream  data  to.  Does  not  sit  on  data  path.    
!  Master  manages  all  peer--to--peer  interac:ons  and  coordinates   remedial  ac:vi:es.  
!  Master  keeps  track  of  which  peers  have  searchable  data.  
­ Ensures  that  there  are  always  SF  copies  of  searchable  data  available.  

40  

HA  

Clustered  Searching  

!  Search  head  coordinates  all  searches  in  the  cluster  
!  SH  relies  on  master  to  tell  it  who  its  peers  are.  
­ The  master  keeps  track  of  which  peers  have  searchable  data    
!  Only  one  replicated  bucket  is  searchable  a.k.a  primary    
­ i.e.,  searches  occur  over  primary  buckets,  only.    
!  Primary  buckets  may  change  over  :me  
­ Peers  know  their  status  and  therefore  know  where  to  search  

41  

Mul:site  Clustering    
!  Site  awareness  introduced  in  Splunk  6.1   !  Improved  disaster  recovery    
­ Mul:site  clusters  provide  site  failover  capability  
!  Search  Affinity    
­ Search  heads  will  scope  searches  to  local  site,  whenever   possible  
­ Ability  to  turn  off  for  bewer  thruput  vs.  X--Site  bandwidth  
42  

Credit:  Splunk  Docs  Team    

Multi Site Cluster Architecture!
Differences  vs.  single  site    
· Assign  a  site  to  each  node   · Specify  RF  and  SF  on  a  site  
by  site  basis    
43  

Mul:site  Clustering  Cont'd    
!  Each  node  belongs  to  an  assigned  site,  except  for  the  Master  Node,   which  controls  all  sites  but  it's  not  logically  a  member  of  any  
!  Replica:on  of  bucket  copies  occurs  in  a  site--aware  manner.  
­ Mul:site  replica:on  determines  #  copies  on  each  site.  Ex.  3  site  cluster:  
  site_replication_factor  =  origin:2,  site1:1,  site2:1,  site3:1,  total:4    
!  Bucket--fixing  ac:vi:es  respect  site  boundaries  when  applicable     !  Searches  are  fulfilled  by  local  peers  whenever  possible  (a.k.a  search  
affinity)  
­ Each  site  must  have  at  least  a  full  set  of  searchable  data  
44  

Deployer  

Puqng  it  Together  

...........  

Master  

Search  Head  Clustering  

...........  
...........  
45  

Indexer  Clustering   Forwarding  Layer  ­  autoLB  

END  

Top  Takeways  

· DR  ­  Process  of  backing--up  and  restoring  service  in  case  of  disaster  
­ Configura<on  files  ­  copy  of  $SPLUNK_HOME/etc/  folder   ­ Indexed  data  ­  backup  and  restore  buckets    
ê Hot,  warm,  cold,  frozen       ê Can't  backup  hot  (without  snapshots)  but  can  safely  backup  warm  and  cold  
· HA  ­  con<nuously  opera<onal  system  bounded  by  a  set  of  tolerances  
­ Data  collec<on   ê Autolb  from  forwarders  to  mul:ple  indexers   ê Use  Indexer  Acknowledgement  to  protect  in  flight  data  
­ Searching   ê Search  Head  Clustering  (SHC)  
­ Indexing   ê Use  Index  Replica:on  

46  

Q  &  A  

Copyright  ©  2015  Splunk  Inc.  
You  may  also  like:  
Architec:ng  and  Sizing  Your  Splunk  Deployment   Go  Big  or  Go  Home    
Indexer  Clustering  Best  Prac:ces,  Tips,  and  Tricks   Search  Head  Clustering  
  
THANK  YOU  
Feedback:  dritan@splunk.com    

