Copyright  ©  2015  Splunk  Inc.  
Intro  to  Splunk     for  DBAs  
Holly  Willey  
Sr.  Sales  Engineer,  Splunk  

Disclaimer  
During  the  course  of  this  presentaDon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauDon  you  that  such  statements  reflect  our   current  expectaDons  and  esDmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaDon  are  being  made  as  of  the  Dme  and  date  of  its  live   presentaDon.  If  reviewed  aPer  its  live  presentaDon,  this  presentaDon  may  not  contain  current  or   accurate  informaDon.  We  do  not  assume  any  obligaDon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiDon,  any  informaDon  about  our  roadmap  outlines  our  general  product  direcDon  and  is  subject  to   change  at  any  Dme  without  noDce.  It  is  for  informaDonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaDon  either  to  develop  the  features  
or  funcDonality  described  or  to  include  any  such  feature  or  funcDonality  in  a  future  release.  
2  

Understanding  the  Mindset  
DBAs  are  responsible  for  the  most  important   data  repositories  ­  mission  cri6cal  systems  
  
RDBMS  Failure  without  backup  or  standby  ­   worst  case?  Business  IP  lost  =  business  failure  
3  

What  MaZers  
4  

· Indexing  &  Searching   · Architecture   · Demo  

Agenda  

5  

Indexing  &   Searching  

Rise  of  Polyglot  Persistence  
E--commerce     Pla>orm  

Session   Data  

Completed   Orders  

Product     Catalog  

      Customer   Social  Graph  

Key--Value     store  

Document   store  

RDBMS  

Graph   store  

7  

Collect  &  Index  Machine  Data  
8  

Forwarders  &  Indexers  
Indexers  
Forwarders  
with  load  balancing  
9  

Data   Inputs   TCP/UDP   Scripted  
Monitor  

Indexing  Pipeline  
Annotate  event  w/metadSaetta  D  (mkeeyssta  fmorp  h  aonsdt,   m soeurrgcee  ,li  snoeusr  (cife  tayppper)o  apnrida t  e)   transform  per  transform  rules  
Writes  compressed  raw  data     Breaking  a  strea&m  i n odf e dxa t fiale  inst  oon  li  dniessk    

10  

Search  Processing  Language  (SPL)  

SQL  
SELECT *   FROM mytable  
SELECT *   FROM mytable   WHERE mycolumn=5   SELECT mycolumn1, mycolumn2   FROM mytable  
SELECT *   FROM mytable   WHERE (mycolumn1="true" OR mycolumn2="red") AND mycolumn3="blue"  

SPL  
source=mytable  
source=mytable mycolumn=5  
source=mytable   | FIELDS mycolumn1, mycolumn2   source=mytable   AND (mycolumn1="true" OR mycolumn2="red")   AND mycolumn3="blue"  
11  

Popular  SPL  Commands  

dedup  

Command  

head/tail  

top/rare

timechart

transaction

Descrip6on  
Removes  subsequent  results  matching  a   specified  criteria   Returns  the  first/last  number  n  of   specified  results   Displays  the  most/least  common  values   of  a  field   Create  a  Dme  series  chart  and   corresponding  table  of  staDsDcs   Groups  search  results  into  transacDons  

12  

13  

Terminology  

RDBMS  
Query   Table/View   Index   Row   Column   Database/Schema  

Splunk  
Search   Search  Results   Index   Result/Event   Field   Index/App  

14  

Architecture     

RotaDon  &  RetenDon  

HOT  

WARM  

COLD  

Frozen  

Hot  ­  Newest  buckets  of  data  that  are  sDll  open  for  write   Warm  ­  Recent  data  but  closed  for  wriDng  (read  only)   Cold  ­  Oldest  data,  commonly  on  cheaper,  slower  storage   Frozen  ­  No  longer  searchable,  deleted  or  commonly  archived  data  
16  

17  

Load  Balancer  
Search  Head  Cluster   Indexer  Cluster  

Cluster  Members     +  1  Captain  
Peer  Nodes  (Search  Peers)     +  1  Master  Node  

Forwarders  
with     Load  Balancing  
18  

ReplicaDon  Factor  =  3  
Index  Cluster   Peer  Nodes  
  
Forwarder  
19  

Site  1  --  Boston  
Search  Head   Peer   Nodes  
  

MulDsite  Clusters  
Master  Node  
  

Site  2  --  Philadelphia  
Search  Head  
Peer     Nodes  
  

Forwarders  
with     Load  Balancing  
20  

Compliance  Requirements  
Time  series  nature  of  Splunk  indexing  is  uniquely  suited  to     offloading  logs      Ideal  for  centralized,  consolidated  reten6on  &  analysis  of:   · Standard  audit  records     · Fine  grained  audiDng  trails   · Listener  logs   · Alert  logs  
21  

Demo  

Apps  
 Splunk  Add--on  for  Oracle  Database   hZps://splunkbase.splunk.com/app/1910/  
 DB  Connect   hZps://splunkbase.splunk.com/app/2686/  
 Oracle  WebLogic  App  for  Splunk   hZps://splunkbase.splunk.com/app/1340/  
23  

Resources  
· Real--Time  Oracle  11g  Log  File  Analysis   hZps://pmdba.files.wordpress.com/2013/12/real--Dme--oracle--11g--log--file--analysis2.pdf  
 Search  Reference  ­  Splunk  for  SQL  Users   hZp://docs.splunk.com/DocumentaDon/Splunk/latest/SearchReference/SQLtoSplunk  
 Exploring  Splunk  book  in  iOS  /  Kindle  /  PDF  versions   hZp://www.splunk.com/goto/book  
 Quick  reference  guide   hZp://www.splunk.com/web_assets/pdfs/secure/Splunk_Quick_Reference_Guide.pdf  
· Splunk  answers   hZp://answers.splunk.com  
 Splunk  blogs   hZp://blogs.splunk.com  
 Splunk  educaDon   hZp://www.splunk.com/view/educaDon/SP--CAAAAH9  
· Free  eTraining     hZps://inter.viewcentral.com/reg/splunk/elearning  
24  

THANK  YOU  

