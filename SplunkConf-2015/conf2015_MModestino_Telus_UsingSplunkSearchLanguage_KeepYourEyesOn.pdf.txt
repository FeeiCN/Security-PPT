Copyright  ©  2015  Splunk  Inc.  
Keep  Your  Eyes  on   The  KPIs!      Enhancing  Reliability  with      
Splunk  Alarming
Ma:hew  Modes?no     
Design  Specialist,  Telus  

Disclaimer  
During  the  course  of  this  presenta?on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau?on  you  that  such  statements  reflect  our   current  expecta?ons  and  es?mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta?on  are  being  made  as  of  the  ?me  and  date  of  its  live   presenta?on.  If  reviewed  aUer  its  live  presenta?on,  this  presenta?on  may  not  contain  current  or   accurate  informa?on.  We  do  not  assume  any  obliga?on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi?on,  any  informa?on  about  our  roadmap  outlines  our  general  product  direc?on  and  is  subject  to   change  at  any  ?me  without  no?ce.  It  is  for  informa?onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga?on  either  to  develop  the  features  
or  func?onality  described  or  to  include  any  such  feature  or  func?onality  in  a  future  release.  
2  

Agenda  
 Introduc?on    Monitoring  key  performance  indicators  (KPIs)  with  Splunk    Crea?ng  Splunk  alerts      Crea?ng  Splunk  aler?ng  scripts  to  send  SNMP  traps    Success  stories  
  
3  

Hi  My  Name  is....  

Hello  My  Name  Is...  
Ma:hew  Modes?no  
 Design  Specialist,  Na?onal  Network  Integrity,  Telus    24x7  Tier  3  network  and  client  experience  assurance    New  technology  introduc?on,  subject  ma:er  expert    Splunk  Technical  Champion,  Cer?fied  Knowledge  Manager        n00bn0m0/n00badmin  On  Splunk  IRC/Splunk  Answers  

  

5  

  
 Canada's  2nd  largest  mobile  carrier,  8.35  million  subscribers    Industry  leading  client  reten?on  through  customer  first  culture    Intense  focus  on  "likelihood  to  recommend"  
  
  
6  

Likelihood  to  Recommend...  
NEVER  LET  THE  CLIENT  BE  THE  FIRST     TO  TELL  YOU  THERE  IS  AN  ISSUE!!  
7  

Key  Performance  Indicators  
  
 What's  normal?    What's  the  trend?    What's  the  impact?    Engineering/capacity  measures  
  
8  

Gathering  Intel.....  
  
 Vendor  equipment  management  systems    CLI  Commands/Health  check  script  outputs/Logging    Wire  capture  /  Probes  solu?ons    Design  docs/SME  knowledge  
9  

Pros:  
Amazing  for  bulk  SNMP  collec?on!     50k+  data  sources  in  one  place!     Aggrega?on  of  KPI,  single  pane  of  glass/Service  alarming!   FREE!     
Cons:  
Severely  outdated  UI!   Non  enterprise  grade  code,  too  much  customiza?on  needed!   Lacks  advanced  analysis  tools/visualiza?ons,     Doesn't  support  wide  array  of  data  types  (without  shoehorn)   No  product  support     
10  

And  then  along  came  
11  

Ingest/Iden?fy/Trend   Workflow  

Ingest/Iden?fy/Trend  
Iden%fy  your  cri%cal  KPIs...   Interface  traffic  Devia?on,  TPS  thresholds,  success  rates,  log  events   Study  these  indicators  and  their  meaning/cri?cality   Decide  on  alarming  thresholds  that  need  OPS  engagement/Inves?ga?on  
13  

Create  a  Splunk  Alert  

Create  Splunk  Alerts  
h:p://docs.splunk.com/Documenta?on/Splunk/latest/Alert/Aboutalerts    Create  a  search  that  isolates  your  alarm  condi?on,  then  save  as  an  alert.    
 Use  emails  for  the  onboarding  stage  
 Collect  SME  knowledge  and  draU  a  "playbook"    Once  the  alarm  is  tested  and  proven...  
15  

Create  an  Alert  Script  to   Send  SNMP  Traps  

SNMP  to  Other  Systems  
h:p://docs.splunk.com/Documenta?on/Splunk/latest/alert/ SendingSNMPtrapstoothersystems    Stock  Splunk  example  above  u?lizes  perl  and  net--snmp  to  craU  snmp   traps  to  send  to  other  systems      The  example  provided  in  the  aler?ng  manual  is  a  good  way  to  get   started  with  SNMP  trapping  from  Splunk,  however  we  quickly   iden?fied  some  need  customiza?on  for  our  use....  
17  

Splunk  Aler?ng  Arguments  
 Stock  arguments  only  provided  us  with  3  items  we  had  any  interest  in,      chose  to  skip  the  step  of  passing  args  to  our  alert  scripts  to  get  the  project  moving....      $searchCount  =  $ARGV[0];  #  $1  --  Number  of  events  returned   $searchTerms  =  $ARGV[1];  #  $2  --  Search  terms   $searchQuery  =  $ARGV[2];  #  $3  --  Fully  qualified  query  string   $searchName  =  $ARGV[3];  #  $4  --  Name  of  saved  search   $searchReason  =  $ARGV[4];  #  $5  --  Reason  saved  search  triggered   $searchURL  =  $ARGV[5];  #  $6  --  URL/Permalink  of  saved  search   $searchTags  =  $ARGV[6];  #  $7  --  Always  empty  as  of  4.1   $searchPath  =  $ARGV[7];  #  $8  --  Path  to  raw  saved  results  in  Splunk  instance  (advanced)  
18  

NET--SNMP  HOMEWORK  
h:p://www.net--snmp.org/wiki/index.php/TUT:snmptrap  
 In  our  proof  of  concept  we  simply  used  canned  bash  scripts  that  sent  snmp  traps  using  snmp  v1      We  chose  SNMP  v1  based  on  some  alert  mapping  op?ons  it  allows  when  integra?ng  to  IBM  Netcool            [root@ma:--vm01  labuser]#  snmptrap  --v1  --c  public  192.168.100.1  ''1.3.6.1.4.1.27389.99  192.168.200.1   6  1  1.3.6.1.4.1.27389.99.1.1  1.3.6.1.4.1.27389.99.1.1  s  "PROBLEM"  1.3.6.1.4.1.27389.99.1.2  i  "5"   1.3.6.1.4.1.27389.99.1.3  s  "FIREWALL01"  1.3.6.1.4.1.27389.99.1.4  s  "FIREWALL01  Dashboard"   1.3.6.1.4.1.27389.99.1.5  s  "SPLUNK  SAYS:ABNORMALLY  LOW  INTERNET  TRAFFIC  TREND"   1.3.6.1.4.1.27389.99.1.6  s  "h:ps://192.168.200.1/en--US/app/firewall01/firewall01"   1.3.6.1.4.1.27389.99.1.7  s  "SPLUNK--KPIdevia?on"  
19  

Example  SNMPTRAP  BREAKDOWN  
   snmptrap  --v1  --c  public  192.168.100.1      ''1.3.6.1.4.1.27389.99  192.168.200.1  6  1  1.3.6.1.4.1.27389.99.1.1      1.3.6.1.4.1.27389.99.1.1  s  "PROBLEM"      1.3.6.1.4.1.27389.99.1.2  i  "5"      1.3.6.1.4.1.27389.99.1.3  s  "FIREWALL01"      1.3.6.1.4.1.27389.99.1.4  s  "FIREWALL01  Dashboard"      1.3.6.1.4.1.27389.99.1.5  s  "SPLUNK  SAYS:  YOU  GOT  PROBLEMS!!!  "      1.3.6.1.4.1.27389.99.1.6  s  "h:ps://  192.168.200.1  :8000/en--US/app/firewall/  
FIREWALL01  "      1.3.6.1.4.1.27389.99.1.7  s  "SPLUNK--KPIdevia?on"  
20  

Clean  up  When  You  are  Done...  
 Generally  it  is  a  good  prac?ce  to  not  only  alarm,  but  to  then  clear   those  alarms  when  you  are  back  to  "normal".    
 To  accomplish  this  we  used  the  KVSTORE.      THANKS  MENNO  VANDERLIST!!!  
h:p://docs.splunk.com/Documenta?on/Splunk/latest/Knowledge/ ConfigureKVstorelookups  
21  

Populate  the  KVSTORE  
 In  our  search  that  triggered  the  SNMP  script  we  also  appended  a   output  to  a  KVSTORE,  which  included  a  pre--defined  key  
   |where  a:ach_sr<=72.5   |  eval  _key=  "sgsn02"   |  table  ?me  _key  host  a:ach_sr   |  outputlookup  kvtest_lookup     
22  

API  Call  to  Clear  the  KVSTORE  
We  then  created  a  mirror  search  to  our  alert  script  which  would  watch  the   KVSTORE  for  an  entry,  then  once  found  would  check  to  see  if  the  Normal   condi?on  was  met.        curl  --k  --u  alertuser:password  --X  DELETE  \  h:ps://192.168.200.1:8089/ servicesNS/nobody/system/storage/collec?ons/data/alert_kvstore/sgsn02        h:p://www.georgestarcher.com/splunk--alert--scripts--automa?ng--control/   "changing  Splunk  from  a  tool  into  a  team  member"     
23  

Create  an  Alert  Script   to  Send  SNMP  Traps,  
Phase  2  

Phase  2  Alarming...  
 Phase  2  ­  Dynamic  Alert  Scrip?ng  using  Alert  Args  
­   $searchName  =  $ARGV[3];  #  $4  --  Name  of  saved  search  
­ $searchURL  =  $ARGV[5];  #  $6  --  URL/Permalink  of  saved  search   ­ $searchPath  =  $ARGV[7];  #  $8  --  Path  to  raw  saved  results  in  Splunk  instance  (advanced)  
   Enhance  the  alarms  with  search  results/Values.    Sco:  Haskell  ,  ZENOSS  Add--on  --    
h:ps://splunkbase.splunk.com/app/2766/    We  have  yet  to  implement  as  we  are  having  a  lot  of  success  with  the  
phase  1  approach,  but  it  is  definitely  in  the  pipeline    
25  

Splunk>  WINS!  

Splunk>  Wins!  
 Rich  intel  provided  by  the  NOC  and  to  engaged  techs      Reduced  MTTR!!    I  can  sleep  at  night!!    Custom  intelligent  alarming  created  in  house.  ($$$)    Grow  Splunk  awareness  
27  

Ques?ons  

THANK  YOU!!  

