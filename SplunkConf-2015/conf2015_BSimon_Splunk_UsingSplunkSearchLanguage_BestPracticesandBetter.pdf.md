Copyright  ©  2015  Splunk  Inc.  
Best  Prac@ces  and   BeBer  Prac@ces  
Burch  
Sales  Engineer  @  Splunk,  Inc.  

Disclaimer  
During  the  course  of  this  presenta@on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau@on  you  that  such  statements  reflect  our   current  expecta@ons  and  es@mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta@on  are  being  made  as  of  the  @me  and  date  of  its  live   presenta@on.  If  reviewed  aQer  its  live  presenta@on,  this  presenta@on  may  not  contain  current  or   accurate  informa@on.  We  do  not  assume  any  obliga@on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi@on,  any  informa@on  about  our  roadmap  outlines  our  general  product  direc@on  and  is  subject  to   change  at  any  @me  without  no@ce.  It  is  for  informa@onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga@on  either  to  develop  the  features  
or  func@onality  described  or  to  include  any  such  feature  or  func@onality  in  a  future  release.  
2  

Goal:  Get  Gooder!  
 Interact  
­ Ask  Ques@ons   ­ Offer  beBer  ideas   ­ Don't  be  "that  guy"  
 2  Much  Content  
­ Download  &  reference  this   ­ Not  covering  everything  
 This  deck  is  updated  
3  

1. Who  are  we?   2. References   3. Resources   4. Searching   5. Admin   6. Next  Steps  

Agenda  
4  

Best  Prac@ces  
Who  are  we?  
5  

What's  a  Burch?  
· Sales  Engineer  in  Boston   · Educa@on  
· CS  @  Boston  University   · MBA  @  Northeastern  University  
· Splunk  Customer  
· Middleware  for  8  years  (+splunk)   · Splunk  Admin  for  1.5  years  (splunk  4.3+)  
· Certs:  Knowledge,  Admin,  Architect   · @Splunk  for  10  months   · AUTOma@c  App  
6  

About  you  
· Name  
· User?   · Power  User?   · Admin?   · Groupie?  
7  

Best  Prac@ces  
References  
8  

Splunk  Review  
9  

Search  Syntax  Components  
10  

Anatomy  of  a  Search  
Disk  
11  

Accelera@on  Op@ons  

Summary  Indexing  
Benefits   · Save  disk  space   · Control  on  impact  to   system  

Limits  

· Gaps   · Intellectually  difficult   · Backfill  

Report  Accelera6on   · Backfill   · Simple  
· Requires  transforming   · Specific  to  search  

Data  Model  Accelera6on  
· Backfill   · Simple   · Extensible   · Search  Agnos@c  
· Massive  if  misused  

· Great  ar@cle:  Search  documenta@on  for  "report  accelera@on"   · New  Feature:  Archive  to  Hadoop  
12  

Best  Prac@ces  
Resources  
13  

Reference  
· Free  Search  Tutorial  -->  docs.splunk.com  -->  Search  Tutorial   · Splunk  Documenta@on  -->  docs.splunk.com   · Community  Q&A  -->  answers.splunk.com   · Community  Tips  &  Tricks  -->  wiki.splunk.com   · Splunk!  The  Book  -->  hBp://www.splunk.com/goto/book   · Apps  -->  splunkbase.splunk.com  
14  

Job  Inspector  
· Job  Inspector  
­ docs.splunk.com  "Search  Job  Inspector"  
· events  per  second  =  events  /  seconds   · results  per  second  =  results  /  seconds  
15  

Play  it  safe  
· Install  splunk  (free  license)  local   · Create  `sandbox'  index  
­ 1  day  reten@on  
· Bonus  Points:  VirtualBox  +  Splunk  
16  

To  btool,  or  not  to  btool  
btool <configuration> list <stanza|> <--debug|>    · Add  to  your  env  path!  (source  a  profile  file  from  an  app)  
­ Linux:     export LD_LIBRARY_PATH=$SPLUNK_HOME/lib ­ Mac:     export DYLD_LIBRARY_PATH=$SPLUNK_HOME/lib
· No  ".conf"  
· Use  ----debug  with  | grep ­v "system/default"
· Not  current  run@me  
17  

New  Stuff  
18  

Best  Prac@ces  
Searching  
19  

Search  Speed  
21  

PreBy  Searches:  Keep  it  kosher  
Weak:  
... | rename machine as "host for later" | rename net as Subnet | sort "host for later" | timechart count by "host for later" span=1h

Strong:  

...| timechart span=1h count by machine

| sort machine

·

| rename machine AS "host for later", ·

net AS Subnet

·

·

new  pipe  =  new  line  +  space  +  pipe   |  <command>  <params>  <processing>   cosme@cs  at  end   combine  mul@ple  renames  and  rexs  

22  

Faster  Searching:  Less  is  more  
Weak:  
iphone | stats count by action | search action=AppleWebKit
Strong:  
iphone action=AppleWebKit | stats count
23  

Faster  Searching:  Require  Fields  

Weak:  
iphone | stats count by action

Wrong  Results:   Pulls  both  phone=iphone  and  user_agent=*iphone*  

Strong:  
phone=iphone action=* | stats count by action

24  

Faster  Search:  Be  specific  
Weak:  
iphone | stats count by action
Strong:  
index=oidemo host=dmzlog.splunktel.com sourcetype=access_combined source=/opt/apache/log/access_combined.log iphone user_agent="*iphone*"
| stats count by action
Time  selector  and  evenBypes/tags!  
25  

Faster  Searching:  stats  vs  dedup/transac@on  

Weak:  
... phone=* | dedup phone | table phone | sort phone

... phone=* | transaction host | table host, phone

Strong:  
... phone=* | stats count by phone, host | fields - count

Pro  Tip:   · Table  is  cosme@c   · Fields  is  reducing  

26  

PreBy  Searches:  foreach  is  clean  
Weak:  
...| timechart span=1h limit=0 sum(eval(b/pow(1024,3))) as size by st
Strong:  
...| timechart span=1h limit=0 sum(b) by st | foreach * [ eval <<FIELD>> = '<<FIELD>>' / pow( 1024 , 3 ) ]
27  

PreBy  Searches:  coalesce's  cooler  than  if  
Weak:  
...| eval size = if( isnull(bytes) , if( isnull(b) , "N/A" , b ) , bytes )
Strong:  
...| eval size = coalesce( bytes , b , "N/A" )
28  

Faster  Searching:  Avoid  Subsearches  
Weak:  
index=burch | eval blah=yay | append [ search index=simon | eval blah=duh ]
Strong:  
( index=burch ... ) OR ( index=simon ...) | eval blah=case( index=="burch" , "yay" , index=="simon" ,
"duh" )
29  

Faster  Searching:  NOT  NOTs  
Weak:  
index=burch NOT blah=yay blah=cool

Strong:  
index=burch blah=duh

index=burch blah!=yay

30  

Search  Commands:  Transac@on  
Weak:  
...| transaction host
Mo  data,  Mo  problems!  
Strong:  
...| transaction maxspan=10m maxevents=100 ...
31  

Search  Commands:  Time  and  Units  
Weak:  
...| eval new_time = <ridiculous string edits>

Strong:  
...| convert ctime(duration)

...| bin span=1h _time

...| eval pause = tostring( pause , "duration" )
...| rename new_time as _time
32  

Search  Commands:  metadata  
Weak:  
index=* | stats count by host
Strong:  
| metadata index=* type=hosts
33  

Search  Commands:  eventcount  
Weak:  
index=* | stats count by index
Strong:  
| eventcount summarize=false index=*
34  

Accurate  Results:  Snap--To  Times  

Weak  

Strong  

35  

Accurate  Results:  Time  Fields  

Weak  

Strong  

36  

Accurate  Results:  Realis@c  Alerts  

Weak  
· Sta@c  condi@ons  
­ |  where  count>10  
· Spam  
­ Avg  

Strong  
Ac@onable:   · stddev   · percXX      Find  anomalies  when  outside   sta@s@cal  "normal"      Plug:  Tom  LaGaBa  
37  

Best  Prac@ces  
Administra@on  
38  

Configura@on  Distribu@on  Recap  
In  a  mature  environment  

Deployment  Server   Forwarders  

Deployer   Search  Head  Cluster  

Master  Node   Index  Cluster  

Separate  Installs:   · Scalability   · Avoid  reload  deploy--server  on  restart   · Cheap  VMs   · Not  in  cri@cal  path  

Bonus  points:       DS  -->            Master  -->  IDXC     DS  -->      Deployer  -->    SHC  

Bootstrap  
1. Install  splunk  binaries   2. Point  to  DS/Master/Deployer   3. Download  config  and  purpose  config   4. Download  app  with  scripted  input  
40  

Installing  Splunk  

· Boostrap  to  DS  
­ Segregates  install  from  config   ­ Empowers  admin  with  config  

· Scripted  input  to  
­ place:  local--log.cfg   ­ disable  local  auth  (passwd)   ­ .ui_login  
· Global  Config  
­ Disable  splunkweb   ­ Set  ports   ­ authen@ca@on  

Remember:     · Transparent  Huge  Memory  Pages   · Source  Control  

41  

Keep  It  Clean:  Naming  Conven@ons  
Template:  <summary|>_<company>_<func@on>_<environment>   · <company>  
­ Yours  or  from  a  3rd  party/splunk  app  
· <func@on>  
­ Nothing  that  changes  (i.e.  organiza@on/teams)  
· <environment>  
­ PROD,  DR,  QA,  TEST,  DEV,  etc...  
· <summary|>  
­ Exists  as  a  modifying  of  corresponding  index  
42  

Architecture:  Data  Management  
· Non  PROD  data  -->  PROD  SPLUNK!  
­ Or  Search  Head  traverses  envs  
· Logical  Separa@on:  
­ Role  Based  Access  Control   ­ Separate  indexes  per  env   ­ Use  event  types/tags  
43  

Architecture:  Cluster  of  One  
· Replica@on  &  Search  Factor  of  1   · Same  disk  space  as  non--cluster   · Allows  replica@on  on  old  data   · Seamless  scalability  
44  

Dangerous  Capabili@es  

Weak  
· Scheduled  Search   · Real  Time  Search   · Accelera@on  
­ Summary  Indexing   ­ Report  Accelera@on   ­ Data  Models  

Strong  
· Everyone  a  `user'   · Capabili@es  only  for  `power'+   · Work  with  you  to  implement  and  learn  
best  prac@ces   · Iden@fy  &  coach  &  promote  to  power   · Don't  be  a  data  butler  

45  

Log  Management  
"If  you  log  it,  then  you  should  Splunk  it"     
· Waste  of  resources:  
­ App/System  performance  to  write  logs   ­ Disk  to  store  logs  
· Move  cronjobs/scheduled  tasks  to  Splunk  
­ scripted  inputs   ­ Standard  output/error  captured  
46  

Logging  Made  Easy  

q Use  clear  key--value  pairs  

q Log  in  text  format  

qCreate  events  humans  can  read   qLog  more  than  debug  events  

qUse  developer--friendly  formats   qUse  categories  

qUse  @mestamps  for  every  event   qIden@fy  the  source  

q Use  unique  iden@fiers  (IDs)  

q Minimize  mul@--line  events  

Forwarding  &  Search  Heads  
· Forward  all  instances  to  indexers  
­ All  indexes  ­  including  summary   ­ All  instances:  
ê *  Forwarders   ê Search  Heads   ê Deployment  Server   ê License  Server   ê Cluster  Master   ê Deployer  
49  

Indent  Config  

Example:  
[general] pass4SymmKey = $1$ShiC+P0X serverName = elBurcho
sessionTimeout = 30m

Benefit  
· Easily  see  system  vs  hand  edits   · Detect  hand  config  updated  by  system  

50  

Search  Head  limits.conf  

Example:  
[scheduler] max_searches_perc = 90

Benefit  
· Defaults  to  50   · Ad  Hod  takes  precedent   · Addi@onal  controls  for  scheduling  

51  

New  Feature:  Indexer  Discovery  

Example:  
Master  Node's  server.conf   [indexer_discovery]
indexerWeightByDiskCapacity = true
Forwarder's  outputs.conf   [indexer_discovery:master1] master_uri = https://masterhost:8089 [tcpout:group1] indexerDiscovery = master1 [tcpout] defaultGroup = group1

Benefit  
· Great  for  indexers  with  different  volume   sizes  
· Requires  network  traffic  to  master  node   · Search  docs.splunk.com  for  
"indexerdiscovery"  
· Don't  forget  about  Volumes  in   indexes.conf  
52  

Run  DMC  
· Manage  Splunk  6.2+  environments   · Replaces  Deployment  Monitor  App   · Incorporates  SOS  app  prior  to  6.2+  
53  

Best  Prac@ces  
Next  Steps  
54  

Ques@ons?  
· Burch  @  IoT  Panel  @  5:15   · Download  these  slides   · Ques@ons?  
1. now   2. find  me  aQer  (IT  Ops  Booth)   3. burch@splunk.com  
· Sessions  
­ Search  for  "Op@miza@on"  or  "Best"   ­ Search  for  "Machine  Learning"   ­ Go  to  320  @  noon  
55  

THANK  YOU  
(rate  this)  

