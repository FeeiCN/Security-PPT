Copyright  ©  2015  Splunk  Inc.  
Harnessing  6.3   Performance  and   Scalability    
Abhinav  NekkanF   Tameem  Anwar   Sourav  Pal  
Splunk  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  aSer  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

About  Us  
 Abhinav  NekkanF    --    Sr.  SoSware  Engineer,  Splunk   Sourav  Pal    --    Sr.  SoSware  Engineer,  Splunk   Tameem  Anwar    --    SoSware  Engineer  --  Performance,  Splunk  
  
3  

3  Tier  Architecture    

Raw  Data  

Searches   Search  Results  

Forwarders  

Indexers  
4  

Search  Heads  

Insight  into  the  Indexer  

Raw     Data  

Splunkd    Server   Daemon  

Disk  

B  

.  

B  

.  

B  

Buckets  

Splunk  Search  Process   SP   SP   SP  
.   .   .  
Splunk  Search  Process   SP   SP   SP  

Search   Results  
Search   Results  

TradiFonal  Indexer  Hosts  
5  

Splunkd  Server  Daemon  /  Pipelineset  

TCP/UDP  pipeline  

Tailing   FIFO  pipeline  
FSChange  

Parsing   Queue  

Exec  pipeline  

Parsing   Pipeline  

Merging   Pipeline  

u\8   linebreaker  

Agg   Queue  

aggregator  

Typing   Queue  

header  

Typing   Pipeline  

regex   replacement  
annotator  

Index   Queue  

Index   Pipeline  
tcp  out  
syslog  out  
indexer  

IngesFon  Pipeline  Set  
6  

Indexer  Core  UFlizaFon  

 Rule  of  Thumb:  

  

Process  

Cores  (approx.)  

Splunkd  Server  Daemon  

4  to  6  cores  

Splunk  Search  Process  

1  core  /  search  process  

 Example  core  uFlizaFon  of  a  Indexer  Host:  
­ 4  To  6  cores  for  Splunkd  Server  daemon   ­ 10  X  1  Cores  for  Splunk  Search  Processes   ­ Total  cores  used:  14  to  16  cores  

7  

Today's  Commodity  Hardware  
 Dell  PowerEdge  R820    Intel(R)  Xeon(R)  CPU  E5--4620  0  @  2.20GHz  --  32  cores    8  x  146Gb  SAS  15k  disks        128GB  RAM  
8  

Core  U0liza0on  %  
3200   2800   2400   2000   1600   1200  
800   400  
0  

Under--UFlized  Indexer  

UnuFlized  Resources   CPU/Memory/Network/Disk  

Splunkd    Server   Daemon  

Disk  
B   B  
B  
Buckets  

Splunk  Search  Process  

SP  

SP  

SP  

Splunk  Search  Process  

SP  

SP  

SP  

9  

Performance  Enhancements  in  6.3  
 MulFple  Pipeline  Sets  
­ Parallel  ingesFng  pipeline  sets   ­ Improves  resource  uFlizaFon  of  the  host  machine  
 Search  Improvements  
­ Faster  batch  searches  using  parallel  search  pipelines  
10  

MulFple  IngesFon   Pipeline  Sets  

Splunkd  with  MulFple  IngesFon  Pipeline  Sets  

Raw     Data  

Splunkd    Server   Daemon  

Disk  

B  

B  

B  

B   B  
B  

B  

B  

B  

Buckets  

Indexer  with  3  Pipeline  Sets  
12  

Configuring  MulFple  IngesFon  Pipeline  Sets  
· $SPLUNK_HOME/etc/system/local/server.conf  
[general] parallelIngestionPipelines = 3
13  

MulFple  IngesFon  Pipeline  Sets  ­  Details  
 Each  Pipeline  Set  has  its  own  set  of  Queues,  Pipelines  and  Processors  
­ ExcepFons  are  Input  Pipelines  which  are  usually  singleton  
 No  state  is  shared  across  Pipeline  Sets    Data  from  a  unique  source  is  handled  by  only  one  Pipeline  Set    
at  a  Fme  
14  

MulFple  IngesFon  Pipeline  Sets  over  Network  

File   File   Script  

Splunkd      

Forwarder  

  

TCP  

Forwarder  with  3  Pipeline  Sets  

Splunkd    Server   Daemon  

Disk  

B  

B  

B  

B   B  
B  

B  

B  

B  

Buckets  

Indexer  with  3  Pipeline  Sets  
15  

MulFple  IngesFon  Pipeline  Sets  ­  Monitor  Input  
 Each  Pipelineset  has  its  own  set  of  TailReader,  BatchReader  and   Archive  Processor  
 Enables  parallel  reading  of  files  and  archives  on  Forwarders    Each  file/archive  is  assigned  to  one  pipeline  set  
16  

MulFple  IngesFon  Pipeline  Sets  --  Forwarding  
 Forwarder:  
­ One  tcp  output  processor  per  pipeline  set   ­ MulFple  tcp  connecFons  from  the  forwarder  to  different  indexers  at  the  
same  Fme   ­ Load  balancing  rules  applied  to  each  pipeline  set  independently  
 Indexer:  
­ Every  incoming  tcp  forwarder  connecFon  is  bound  to  one  pipeline  set  on  the   Indexer  
17  

MulFple  IngesFon  Pipeline  Sets  --  Indexing  
 Every  pipeline  set  will  independently  write  new  data  to  indexes    Data  is  wrioen  in  parallel  to  beoer  uFlize  resources    Buckets  produced  by  different  pipeline  sets  could  have  overlapping  
Fme  ranges  
18  

Search  :     ParallelizaFon  Efforts  
Performance   Improvements  

Search  ParallelizaFon:     Performance  Improvement  
Splunk  Searches  are  faster  in  6.3.  
  
· Parallelizing  the  Search  Pipeline      · Improving  the  Search  Scheduler      · The  Summary  Building  is  parallelized  and  faster.    
20  

Search  Pipeline  

Batch   CuSersaorrcehd     

Reading  Order  

Search  
OOppFFoonn12:...:......BBB636  B  B  B55R5  Be  B  B4a14d  B  B i ··Bn323g  B  B   B OCB212uar  B  Bdtr  B1cse61ho  r  r     S eeda  SrIFcethmea:re  acBht  uoe:crs  Tdk  oiemvtrie  onr r go  dbr  ieudsrIc e ntekreodaertdtd a d s nt   ab ,dee  tua s eact d o a kreve  rdeterr  tbi e rFaivemsFbmaveauleadu.cc  l  lhi .k oFl ie e tn pnatl s tteche e i  pnes  nid   pp Feeaemeprldiaeenslne l o e td ro led  p  ne  rtroliycne  gas.cs  r  io  n   sgs  o   f  

OpFon  3...B6  B5  B4  B7  B4  B9  

B1  

B2  

B3  

B4  

B5  

B6  

B7  

B8  

B9  

b11  

b11  

b11  

Target  search  bucket  ids  

Search   Processor  

Search   Processor  

Search  Post  Processing   Indexer  (Disk)  
Search  Pipeline  at  the  Peer     21  

Serialize   &  
Transmit  

Batch  Search:  Pipeline  ParallelizaFon  

   B1   T     

B2  

B3  

Search  Pipeline  1  

   B4   T     

B5  

B6  

Search  Pipeline  2  

   B7   T     

B8  

B9  

Search  Pipeline  3  

   b11  

b11  

b11  

T  

Search  Pipeline  4  

 T  arget  search  buckets  

Indexer  (Disk)  

Search   Processor  
Search   Processor  

Search   Processor  
Search   Processor  

Search   Processor  

Search   Processor  

Search   Processor  

Search   Processor  

Search  Post  Processing  

   T=  Thread  
  
      T   Aggregator    
&   Serializer    
   T   Transmit    
(I/O)  

22  

Batch  Search:  Pipeline  ParallelizaFon  
 Under--uFlized  indexers  provide  us  opportunity  to  execute  mulFple   search  pipelines  
 Batch  Search  Fme--unordered  data  access  mode  is  ideal  for  mulFple   search  pipelines  
 No  state  is  shared  i.e.  no  dependency  exists  across  Search  Pipelines.    Peer/Indexer  side  opFmizaFons    Takeaway  :  
­   Under  uFlized  indexers  are  candidates  for  search  pipeline  parallelizaFon.     ­ Do  NOT  enable  if  indexers  are  loaded  
23  

Configuring  the  Batch  Search  in  Parallel  mode  
· How  to  enable?  
$SPLUNK_HOME/etc/system/local/limits.conf  
[search]   batch_search_max_pipeline    =  2     
· What  to  expect?   Search  performance  in  terms  of  retrieving  search  results  improved.   Increase  in  number  of  threads    
  
24  

Search  Scheduler  Improvements  
 Scheduler  improvements  in  Splunk  Enterprise  6.3:  
­ Priority  Scoring   ­ Schedule  Windows     
 Performance  improvements  over  previous  schedulers  
­ Lower  Lag   ­ Fewer  skipped  searches  
25  

Search  Scheduler  Improvements   Priority  Score  
Problem  in  6.2:  
  
Simple  single--term  priority  scoring  could  result  in  saved  search  lag,  skipping,  and   starvaFon  (under  CPU  constraint).  
Solu0on  in  6.3:    
Beoer  mulF--term  priority  scoring  miFgates  problems  and  improves  performance  by  25%.     
score(j)   =  next_runFme(j)     +  average_runFme(j)  ×  priority_runFme_factor     ­  skipped_count(j)  ×  period(j)  ×        
                                          priority_skipped_factor     +  schedule_window_adjustment(j)  
26  

Search  Scheduler  Improvements  
Problem  in  6.2  
   Scheduler  can  not  disFnguish  between  searches  that  (A)  really  should  run  at  a  specific  Fme  (just  like  cron)    
from  those  that  (B)  don't  have  to.  This  can  cause  lag  or  skipping.   Solu0on  in  6.3:    
  
Give  a  schedule  window  to  searches  that  don't  have  to  run  at  specific  Fmes.  
Example:    
   For  a  given  search,  it's  OK  if  it  starts  running  someFme  between  midnight  and  6am,     but  you  don't  really  care  when  specifically.  
· A  search  with  a  window  helps  other  searches.   · Search  windows  should  not  be  used  for  searches  that  run  every  minute.   · Search  windows  must  be  less  than  a  search's  period  
27  

Configuring  Search  Scheduler  
$SPLUNK_HOME/etc/system/local/limits.conf  
[scheduler]   max_searches_perc  =  50      #  Allow  value  to  be  75  anyFme  on  weekends.   max_searches_perc.1  =  75   max_searches_perc.1.when  =  *  *  *  *  0,6      #  Allow  value  to  be  90  between  midnight  and  5am.   max_searches_perc.2  =  90   max_searches_perc.2.when  =  *  0--5  *  *  *     
28  

Search:  Parallel  SummarizaFon  
 SequenFal  nature  of  building  summary  data  for  data  model  and   saved  reports  is  slow  
 Summary  Building  process  has  been  parallelized  in  6.3  
29  

Summary  Building  ParallelizaFon  

SCHEDULER  

auto   summary  
search  

auto   summary  
search  

auto   summary  
search  

SequenFal  Summary  Building  

SCHEDULER  
auto  summary  search  
every  N  minutes  
Parallelized  Summary  Building  

30  

Configuring  Summary  Building  for  ParallelizaFon    
$SPLUNK_HOME/etc/system/local/savedsearches.conf  
[default]   auto_summarize.max_concurrent  =  2     
$SPLUNK_HOME/etc/system/local/datamodels.conf  
[default]   acceleraFon.max_concurrent  =  2     
31  

6.3  Performance  

6.2  vs.  6.3  Performance  Tests  
· System  Info       o  Dell  PowerEdge  R820   o  Intel(R)  Xeon  CPU  E5--4620  @  2.20  GHz   o  32  cores  w/o  Hyper--Threading   o  128  GB  RAM   o  8  x  146GB  SAS  15k  RPM  disks  in  RAID--10   o  1  Gb  Ethernet  NIC   o  CentOS  6  
· No  other  load  on  the  box  
  
33  

Indexing  Tests  

· Index  a  50  GB  generic  syslog  dataset.  No  search  loads.   · Time  to  Index  ­  41.23  minutes   · Single  Pipeline  on  6.2  or  6.3  will  have  similar  performance  
34  

Pipelines   Average        
Throughput   (  MB/s)  

1      

20.02  

2      

3      

4  

Indexing  Tests  

· Time  to  Index  50  GB  ­  20.81  minutes  

· 98.2  %  Increase  in  Average  Indexing  Throughput    

· On  an  average  Splunk  uFlized  2x  CPU  cores  ,  1.3x  Memory  

and  2x  Disk  IOPS  

  

35  

Pipelines   Average        
Throughput   (  MB/s)  

1      

20.02  

2      

40.04  

3      

4  

Indexing  Tests  

· Time  to  Index  50  GB  ­  16.63  minutes   · 152  %  Increase  in  Average  Indexing  Throughput   · On  an  average  Splunk  uFlized  3x  CPU  cores,  1.6x  Memory  
and  2.5x  Disk  IOPS  
36  

Pipelines   Average        
Throughput   (  MB/s)  

1      

20.02  

2      

40.04  

3      

50.91  

4  

Indexing  Tests  

· Time  to  Index  50  GB  ­  13.42  minutes   · 207%  Increase  in  Average  Indexing  Throughput   · On  an  average  Splunk  uFlized  4x  CPU  cores,  2.25x  Memory  
and  3x  Disk  IOPS  
37  

Pipelines   Average        
Throughput   (  MB/s)  

1      

20.02  

2      

40.04  

3      

50.91  

4  

62.07  

Machine  1  

6.2  Setup  
Machine  2  

Machine  3  

data  sources     4  forwarders  

      Indexer   38  

Search  Head  

Machine  1  

6.3  Setup  
Machine  2  

Machine  3  

Single   forwarder     4  IngesFon   Pipeline  Sets  
  data  sources  

                                Indexer           4  IngesFon  Pipeline  sets       4  Search  Pipeline  sets  
39  

Search  Head  

Burst  in  Indexing  Load  +  Searches  

Splunk  6.2   · Data  forwarded  @  9  MB/s  +  Monitor  50GB  dataset     · 89.8  Minutes  to  Index  this  50  GB  dataset   · Number  of  IngesFon  Pipelines  --  1   · Number  of  Concurrent  Searches  ­  4  
     
40  

Version  
6.2  

Average         Throughput   (  MB/s)     
20.0  

6.3  

Burst  in  Indexing  Load  +  Searches  

Splunk  6.3   · Data  forwarded  @  9  MB/s  +  Monitor  50GB  dataset     · 23.4  Minutes  to  Index  this  50  GB  dataset   · 142%  Increase  in  Average  Indexing  Throughout   · Number  of  IngesFon  Pipelines  --  4   · Number  of  Concurrent  Searches  ­  4  

  

41  

Version  
6.2  

Average         Throughput   (  MB/s)     
20.0  

6.3   48.5    

Batch  Mode  Sparse  Search  

Version  

  Average  
Search  Time   (seconds)  

· Sparse  Search  ­  Characterized  predominately  by  returning  some  
events  per  bucket     · Splunk  6.2  ­  1  Search  Pipelines   · Splunk  6.3  ­  4  Search  Pipelines   · Search  is  3.18x  faster  in  6.3  
  
42  

6.2   6.3  

16.67  s   5.24  s  

Batch  Mode  Dense  Search  

Version  

  Average  
Search  Time   (minutes)  

· Dense  Search  ­  Characterized  predominately  by    returning  many  

events  per  bucket    

· Splunk  6.2  ­  1  Search  Pipelines    

· Splunk  6.3  ­  4  Search  Pipelines  

· Search  is  3.85x  faster  in  6.3  

  

  

43  

6.2   6.3  

21.0  m   5.46  m    

Scheduled  Searches  Setup  
· 10  Searches  are  scheduled  to  run  every  minute   · 5  Longer  running  searches  (~40s)   · 5  Shorter  running  searches  (~15s)   · Test  configured  to  run  only  3  scheduled  
concurrently  
44  

Scheduled  Searches  

Version  

  Searches   completed  

· Skipped  vs.  Successful  Searches  ­  30  minute  window   · 25%  Increase  in  Successful  Searches   · This  opFmizaFon  will  not  uFlize  addiFonal  System  Resource    
  
  
45  

6.2   118   6.3   148  

  CPU  UFlizaFon  

    
Burst  in  Indexing  Load  +  Searches   Splunk  6.2  ­  1  IngesFon  Pipeline    ;  1  Search  Pipeline     Splunk  6.3  ­  4  IngesFon  Pipelines  ;  4  Search  Pipelines  
46  

Average  CPU  %     6.2     6.3   882  %   2237  %  

  Memory  UFlizaFon  

    
Burst  in  Indexing  Load  +  Searches   Splunk  6.2  ­  1  IngesFon  Pipeline    ;  1  Search  Pipeline     Splunk  6.3  ­  4  IngesFon  Pipelines  ;  4  Search  Pipelines  
47  

Average  Memory    
  6.2     6.3   1.18  GB   2.69  GB  

Disk  UFlizaFon  

    
Burst  in  Indexing  Load  +  Searches   Splunk  6.2  ­  1  IngesFon  Pipeline    ;  1  Search  Pipeline     Splunk  6.3  ­  4  IngesFon  Pipelines  ;  4  Search  Pipelines  
48  

Average  Disk  IOPS    
  6.2     6.3   157   483  

Final  Thoughts  
· What  is  my  current  workload?  
o Data  volume  ­  Daily  and  Peak     o Search  Volume  ­  Concurrent  and  total     o System  Resource  Usage    
· How  do  I  approach  these  features?  
o System  significantly  under--uFlized  ?   o Search  Pipelines  
· Lot  of  Batch  mode  Searches  ?   o Parallel  IngesFon  Pipelines  
· Handling  Bursts  in  Data?  Peaks  in  Data     · Reading  large  number  of  files  in  parallel?    
· Splunk  scales  horizontally  
     
49  

THANK  YOU  

