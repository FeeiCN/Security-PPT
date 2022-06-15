Copyright  ©  2014  Splunk  Inc.  
Inputs:  File,  Network,   Script,  and  More!   Splunkd:  Pipelines  &   Processors  &  Queues,   Oh  my!  
Amrit  Bath   Jag  Kerai  

Disclaimer  
During  the  course  of  this  presentaNon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauNon  you  that  such  statements  reflect  our   current  expectaNons  and  esNmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaNon  are  being  made  as  of  the  Nme  and  date  of  its  live   presentaNon.  If  reviewed  aYer  its  live  presentaNon,  this  presentaNon  may  not  contain  current  or   accurate  informaNon.  We  do  not  assume  any  obligaNon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiNon,  any  informaNon  about  our  roadmap  outlines  our  general  product  direcNon  and  is  subject  to   change  at  any  Nme  without  noNce.  It  is  for  informaNonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaNon  either  to  develop  the  features  
or  funcNonality  described  or  to  include  any  such  feature  or  funcNonality  in  a  future  release.  
2  

Agenda  
· Splunkd  building  blocks:  
· Pipelines,  processors,  queues   · Not  here:  Indexing/clustering,  searching.  
· Where  data  goes  &  how   · Where  data  comes  from   · Debugging/opNmizing  
(What  Would  Octavio  Do?)  

About  Us  
· Jag  Kerai  (2008)  ­  Eng  &  Manager  
­ Forwarding/receiving,  Splunkd  framework,  HA/ Clustering,  Deployment  server,  SAML,  ...  
­ Previously:  Xsigo  Systems,  Brocade   CommunicaNons,  SAP  Lab  ­  Web  apps  in  1995!  
­ Is  a  smart  dude  
· Amrit  Bath  (2005)  ­  Eng  &  Hungover  
­ CLI,  Deploy  Serv,  Tailing,  REST  API,  Universal   Forwarder,  Indexed  ExtracNons,  Cloud...  
­ Previously:  Unemployment,  College   ­ Tries  to  enjoy  working  on  cars  
4  

Splunk  Architecture  

Splunk C  LI I  nterface  
Splunk  >  Engine  
Scheduling/AlerNng  

             S  plunk W  eb I  nterface  
REST   API  
ReporNng  

Other I  nterfaces  
Knowledge  

Distributed S  earch  
Deployment   Server        

Index  

Search   Forward   Parse /   E  xtract /   M  anipulate  

Cluster  

Distributed S  earch  
Users  /   ACL     

Monitor F  iles  

Detect F  ile C  hanges  

Network i nput  

Script /   S  tdout  

5  

It's  All  a  Pipeline  
C  

A  

B  

D  

E  

6  

Really  

C  
7200  RPM/   10k/15k?  

Forwarder  

100Mb?  

A  

B  

D  

E  

7  

Internally,  too!  
C  

Queue  

A  

B  

Monitor  Input  

Processors  
8  

Queue  
D  
E  
Index  

And  Across  MulNple  Instances!  
(This  is  the  biggun')  

Universal     Forwarder  

Processors  

TCP  input   Indexer  

Queue   Monitor  Input  

Queue  

100  Mb  

TCP  Output  
9  

Queue   Index  

Data  Structures   &  RouNng  

Pipeline  Data  

_conf   Host   Index  

www2,  access_log,  /var/log/hupd/access_log   www2   prod_servers  

_raw  

10.3.1.92  --  --  [21/Jul/2011:20:34:44  --0700]  "GET  / results/bonnie--solns_vm_nick.html  HTTP/1.1"  200   2938  

UTF--8  

Line  Broken  

    

    

11  

Input  

Pipelines  
Parsing  Pipeline  

UTF--8   Converter  

Line  Breaker  

Header   ExtracNon  

Pipeline  Data  

Output  

     

· Pipeline:  thread  

     

· Data  flows  through  linearly,  hits  mulNple  pipelines  before  indexing  

· Naturally  allow  parallelism,  modularity  

· Config  files:  $SPLUNK_HOME/etc/modules/   Merged:  var/run/splunk/composite.xml  

12  

Pipeline  Data  

Processor  

Input  

Pipeline   Processor  1  

Processor  2  

Output  

· Processor:  performs  small  but  logical  unit  of  work   · Contained  within  a  pipeline   · Executed  by  pipeline  thread   · Example:  LineBreaker,  Aggregator,  TcpInput,  Index  
13  

Pipelines/Processors  (Debugging)  

UF  

TCP/UDP  pipeline  

Tailing   FIFO  pipeline  
FSChange  

Parsing   Queue  

Exec  pipeline  

Parsing   Pipeline  

Merging   Pipeline  

uw8   linebreaker  

Agg   Queue  

aggregator  

Typing   Queue  

header  

Typing   Pipeline  

regex   replacement  
annotator  

Index   Queue  

Index   Pipeline  
UF  +  
tcp  out  
IDX_E  
syslog  out  
indexer  

14  

Pipelines/Processors  (Debugging)  

TCP/UDP  pipeline  

Tailing   FIFO  pipeline  
FSChange  

Parsing   Queue  

Exec  pipeline  

Parsing   Pipeline  

Merging   Pipeline  

uw8   linebreaker  

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

15  

Pipelines/Processors  (Debugging)  

TCP/UDP  pipeline  

Tailing   FIFO  pipeline  
FSChange  

Parsing   Queue  

Exec  pipeline  

Parsing   Pipeline  

uw8  

linebreaker  

Agg   Queue  

header  

Merging   Pipeline  

aggregator  

Typing   Queue  

Typing   Pipeline  

regex   replacement  
annotator  

Index   Queue  

Index   Pipeline  
tcp  out  
syslog  out  
indexer  

16  

Thread  

Process  

Insert  

Queue  
Queue  
pData   pData   pData   pData  

Thread  

Remove  

Process  

· Queue  size  bounded  by  memory     · Variable  size  pipeline  data  
17  

Queue  

Typing  Pipeline  

Index  Queue  (Full)  

Process  

Insert     (Blocks)  

pData   pData  

pData   pData  

Tcp  Output  
Processors  

Remove  

Write  to   Network  
(Fails)    

Network   Down  

Queue  (Full)  
pData  

Pipeline  Thread  
Insert  Blocked  
1. Remove   2. Process   3. Insert  (Blocked)  

Queue  (Full)  
pData  

Pipeline  Thread  
Insert  Blocked  
1. Remove   2. Process   3. Insert  (Blocked)  

Queue  (Full)  
pData  

18  

Persistent  Queue  

Regular  Queues    

pData   pData  
 Writer  blocks  if  Q  is  full   Persistent  Queues    

RAM  

pData   pData  
RAM  
· If  memory  used  up,  use  file  system     · Writer  does  not  block  if  memory  is  used  up   · Think  virtual  memory    
19  

File  System  

Persistent  Queue  

Host  

Network  

Internal  Queues  Full  

Input  Q   Persistent  Q  

pData  

pData  

Tcpout  Q   Full  

Network  

Splunk  

Much  Bigger  Queue     20  

Processors:   Input  &  Parsing  

Network  

Input  Pipelines  

File  Monitor  
Host   Index   _raw  

FIFO  

FS  Change  

Script  

Registry M  onitor   ...  

Pipeline  Data  
www2  
prod_servers  
Jul  30  00:21:19  amritDesktop  sshd[30416]:  Accepted   publickey  for  amrit  from  10.3.1.52        port  59426  ssh2  \n   Jul  30  00:21:26  amritDesktop  sshd[30418]:  Received   disconnect  from  10.3.1.52:  11:              disconnected  by  user  \n  

Parsing  Queue  
22  

Monitor  Input  (aka  Tailing  Processor)  

· Two  synchronous  components:  
­ File  Update  NoNficaNon  (FUN!)   ­ Tailer:  reads  files  
·   Files  are  read:     1)  One  at  a  Nme     2)  In  64KB  chunks,     3)  UnNl  EOF.  
­ Can  read  large  files  &  archives  in  parallel.    
· Send  <=64  KB  chunks  to  output  queue  

FUN!  

...  

Tailer  

Batch   Archive  

Parsing  Queue  

23  

Parsing:  UTF--8  Processor  

Host   Charset   _raw  

Pipeline  Data  
www2  
ShiY--JIS      |"eBAbNEg"U  

UTF--8  Processor  

Host   Charset   _raw  

Pipeline  Data  
www2   UTF--8     

24  

_raw  

Parsing:  Line  Breaker  
Pipeline  Data  
Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  StarNng  update  scan   Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  UpdateController:  Message  tracing  {                           "interval_since_last_invocaNon"  =  23000;                           "power_source"  =  ac;                           "power_state"  =  wake;                           "start_date"  =  "2014--08--21  20:10:39  +0000";   }   Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  Asserted  BackgroundTask  power  asserNon  (returned  0)  

Line  Breaker  

_raw   _raw   _raw   _raw  

Pipeline  Data  
Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  StarNng  update  scan  

Pipeline  Data  
Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  UpdateController:  Message  tracing  {  

                        "interval_since_last_invocaNon"  =  23000;  

Pipeline  Data  

                        "power_source"  =  ac;  

Pipeline  Data  
...      

25  

**OR**  Parsing:  CSV/JSON  Line  Breaker  (6.0+)  

From  file  containing:  
Subject,DescripNon,Presenter     How  Splunkd  works,"Learn  about  how  Splunk  ingests  and     parses  data",Amrit/Jag    
How  search  works,Learn  how  Splunk's  search  language  works,Dr.  Z  

_raw   sourcetype  

Pipeline  Data  
How  Splunkd  works,"Learn  about  how  Splunk  ingests  and   parses  data",Amrit/Jag   How  search  works,Learn  how  Splunk's  search  language  works,Dr.  Z  
csv  

   See  also:  
sourcetype=_json   INDEXED_EXTRACTIONS=(csv|json|...)     

_raw   sourcetype  
_meta  
_raw   sourcetype  
_meta  

CSV/JSON  Line  Breaker  
Pipeline  Data  
How  Splunkd  works,"Learn  about  how  Splunk  ingests  and   parses  data",Amrit/Jag  
csv   Subject::"How  Splunkd  works"                DescripNon::"Learn  about  how  Splunk   ingests  and\nparses  data"                Presenter::Amrit/Jag  
Pipeline  Data  
How  search  works,Learn  how  Splunk's  search  language  works,Dr.  Z  
csv  
Subject::"How  search  works"                DescripNon::"Learn  how  Splunk's  search   language  works"                Presenter::"Dr.  Z"  

26  

Parsing:  Header  Processor  

Host   _raw  
Host   _raw  

Pipeline  Data  
www2   ***SPLUNK***  host=database_1  
Pipeline  Data  
www2   Unknown  database  error  

Header  Processor  
Host   _raw  

Pipeline  Data  
database_1  
Unknown  database  error  

27  

Merging:  Line  Merge  (aka  Aggregator)  

_raw  

Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[P4Pi9pip5ee9lli7nin]e   < eDCa  DtraiNa   ctaal>   :  StarNng  update  scan  

_raw  

Pipeline  Data  
Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  UpdateController:  Message  tracing  {  

_raw  

                        "interval_since_last_invocaNon"  =  23000;  

Pipeline  Data  

_raw                           "power_source"  =  ac;  

Pipeline  Data  
..    

Line  Merge  

_raw   _raw   _raw  

Pipeline  Data  
Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  StarNng  update  scan  
Pipeline  Data  
Pipeline  Data  
Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  UpdateController:  Message  tracing  {                           "interval_since_last_invocaNon"  =  23000;                           "power_source"  =  ac;                           "power_state"  =  wake;                           "start_date"  =  "2014--08--21  20:10:39  +0000";   }  
Pipeline  Data  
Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  Asserted  BackgroundTask  power  asserNon  (returned  0)  

28  

Typing:  Regex  Replacement  

Host   Sourcetype   _raw  

Pipeline  Data  
logbox   syslog  
Sep  12  06:11:58  abath--mba13.no.cox.net   storeagent[49597]  <CriNcal>:  StarNng  update  scan  

Regex  Replacement  

Host   Sourcetype   _raw  

Pipeline  Data  
abath--mba13.no.cox.net    
syslog  
Sep  12  06:11:58  abath--mba13.no.cox.net   storeagent[49597]  <CriNcal>:  StarNng  update  scan  

29  

Host   _raw  

Typing:  Annotator  

Pipeline  Data  
abath--mba13.no.cox.net  
Sep  12  06:11:58  abath--mba13.no.cox.net   storeagent[49597]  <CriNcal>:  StarNng  update  scan  

Annotator  

Host   Punct  
_raw  

PPipipeelilninee  D  Daatata     
abath--mba13.no.cox.net   __::_--_[]_<>:___  
Sep  12  06:11:58  abath--mba13.no.cox.net   storeagent[49597]  <CriNcal>:  StarNng  update  scan  

30  

Indexer  Pipeline:  TCP/Syslog  Out,  Indexer  

Host   Index   _raw  

Pipeline  Data  
abath--mba13.no.cox.net  
main  
Sep  12  06:11:58  abath--mba13.no.cox.net  storeagent[49597]  <CriNcal>:  StarNng   update  scan  

TCP  Output   Syslog  Output  
Indexer  

To  remote  server...  

To  remote  server...  

To  disk..  

Or  cluster!  

31  

Scripted  Input  (aka  Exec  Processor)  

mysql_fetch.sh  

data  

args  

data  

Exec  Processor  

web_ping.bat  

args   data  
args  

tracert.exe  

Parsing  Q  

32  

TCP/UDP  Input  

Splunk   TCP  

Network  

UDP   Host  

TCP/UDP  Pipeline   Read  

Port   Wait  

Insert  

Parsing  Q   Pipeline  Data  

Parsing  Pipeline  

Processors  

Remov e  

Insert  to   Queue    

33  

TCP  Output  Qs  

Typing  Pipeline  
Processors  
Insert     (Blocks)  

Index  Q  
pData  

TCPOut  Q  
pData   Load  Balance  Group   Clone    
or  Route   TCPOut  Q  
pData   Load  Balance  Group  

Network   Down  
Network  

34  

Splunk   Splunk   Splunk   Splunk  

Nerdier  Stuff  
35  

offset   _raw  
offset   _raw  

Resource  Management  
Pipeline  Data  Raw  Storage  
2007--01--23  21:15:46,674  DEBUG  [com.splunk.doom]  com.sun.ebank.ejb.customer....    \n   java.lang.NumberFormatExcepNon:  For  input  string:  "fish!"    \n                   at  java.lang.NumberFormatExcepNon.forInputString(NumberFormatExcepNon.java:48)  \n                   at  java.lang.Integer.parseInt(Integer.java:447)  \n   ...  

Pipeline  Data  1  
@0  +  100   2007--01--23  21:15:46,674  DEBUG  [com.splu....  

offset   _raw  

Pipeline  Data  3  
@150  +  80                   at  java.lang.NumberFormatExcepNon.f...  

Pipeline  Data  2  
@100  +  50   java.lang.NumberFormatExcepNon:  For  in...  

offset   _raw  

Pipeline  Data  4  
@230  +  40                   at  java.lang.Integer.parseInt(Integer.jav...  

36  

Debugging!   Metrics!   S.O.S  App  
(and  DMC...)!  
37  

metrics.log:  Queues  via  S.O.S  
38  

metrics.log:  Queues  via  Search  
Search:  index=_internal  group=queue  |  eval  pc=(current_size_kb*100)/max_size_kb  |  Nmechart  perc90(pc)  by  name     
39  

metrics.log:  Processor  Time  via  S.O.S  
40  

metrics.log:  Processor  Time  via  Search  
Search:  index  =  _internal  group  =  pipeline  processor  !=  sendout  |  Nmechart  perc90(cpu_seconds)  by  processor     
41  

metrics.log:  Indexing  Rate  via  S.O.S  
42  

metrics.log:  Indexing  Rate  via  Search  
Search:  index=_internal  source=*metrics.log*  group=thruput  |  Nmechart  per_second(kb)     
43  

metrics.log:  Scenarios  
· Indexing  instance:  Index  Queue  at  100%  
­ Forwarding  disabled:  Indexing  rate?    Slow  disk?  Full  disk?   ­ Forwarding  enabled:  
Indexing  rate?    Slow  disk  on  remote  indexer?    Full  remote  disk?   TCPOut  rate?    Low  network  bandwidth?  High  network  latency?   Local  indexing  rate?    Slow  local  disk?  Full  local  disk?    
· Universal  Forwarder:  Parsing  Queue  at  100%  
­ Indexing  rate?    Slow  disk  on  remote  indexer?    Full  remote  disk?     TCPOut  rate?    Low  bandwidth?  High  latency?   (No  local  indexing  here)  
· Start  from  end,  work  backwards...  
44  

metrics.log:  Universal  Forwarder  

· No  indexing/searching  capability  

· Can  forward  metrics  to  indexer...  
­ May  not  get  there!   ê Configure  S.O.S:  
hup://splunk--base.splunk.com/answers/48874/how--can--i--monitor--the--resource--usage--of--my--forwarder--using--the--sos--app#50315  
ê Fix  forwarding:  
hup://splunk--base.splunk.com/answers/38091/best--pracNces--to--deploy--the--splunk--on--splunk--app--in--a--distributed--search-- environment  

· Fallback  to  raw  file  (grep!)  

  $  grep  group=queue  metrics.log  |  grep  ----color  'max_size.*current_size_kb[^,]*,'  

  

  Metrics  --  group=queue,  name=typingqueue,  blocked=true,  max_size_kb=500,  

  

    current_size_kb=499,  current_size=1821,  largest_size=1821,  smallest_size=0  

45  

Metrics  Log  
· Search:   index=_internal   source=*metrics.log*  
· Groups  
­ pipeline   ­ queue   ­ per_source_thruput   ­ per_sourcetype_thruput   ­ per_index_thruput   ­ per_host_thruput   ­ ...  
46  

Recap  
· Splunk  instance  consists  of  linear  pipelines  
· Splunk  topology  emulates  pipelines  
· Downstream  slowdown  results  in  upstream  blockage  
· metrics.log  across  the  topology  reveals  the  whole  picture  
· Queue  sizes   · Indexing  thruput   · Forwarding  thruput   · CPU  usage  per  PipelineData  Processor  
· This  is  how  you  should  debug  ­  the  same  way  we  do!  
...  
· See  also:  PipelineSets  Talk(Abhinav,  Sourav,  Tameem)  

QuesNons?  
48  

THANK  YOU  

