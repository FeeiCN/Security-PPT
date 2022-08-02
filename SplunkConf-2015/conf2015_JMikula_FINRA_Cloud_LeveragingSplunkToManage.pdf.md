Using  Splunk  to  Manage  AWS  
Gaining  Transparency  into  Cloud   Compu;ng  

Disclaimer  
During  the  course  of  this  presenta;on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau;on  you  that  such  statements  reflect  our   current  expecta;ons  and  es;mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta;on  are  being  made  as  of  the  ;me  and  date  of  its  live   presenta;on.  If  reviewed  aMer  its  live  presenta;on,  this  presenta;on  may  not  contain  current  or   accurate  informa;on.  We  do  not  assume  any  obliga;on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi;on,  any  informa;on  about  our  roadmap  outlines  our  general  product  direc;on  and  is  subject  to   change  at  any  ;me  without  no;ce.  It  is  for  informa;onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga;on  either  to  develop  the  features  
or  func;onality  described  or  to  include  any  such  feature  or  func;onality  in  a  future  release.  
2  

Who  We  Are  
!  FINRA--the  Financial  Industry  Regulatory  Authority--is  an   independent,  non--governmental  regulator  for  all  securi;es  firms   doing  business  with  the  public  in  the  United  States  
!  FINRA  protects  investors  by  regula;ng  brokers  and  brokerage  firms   and  by  monitoring  trading  on  U.S.  stock  markets  
!  FINRA  monitor  over  6  billion  shares  traded  on  the  stock  market  each   day  
!  FINRA  handles  more  `Big  Data'  on  a  daily  basis  than  the  Library  of   Congress  or  Visa®--to  build  a  holis;c  picture  of  the  trading  market  
!  FINRA  ­  Deter,  Detect,  Discipline  

Investor  Protec;on  

3  

Historical  View  
! Cyclic  Processes   ­ POC  ­  Budget  Approval  ­  SDLC  --  Maintenance  
! Defined  Roles   ­ Coders  Code   ­ Managers  Manage   ­ Administrators  Administer  
! Agile  Development/Cloud  Compu;ng   ­ Developers  Make  These  Decisions:   ê Security   ê Financial   ê Architecture   ­ And  It's  All  Point  and  Click  
! Hacking  Redefined  Security   ­ Defensive  Coding   ­ Baked  In,  Not  Painted  On  

"You  guys  start  coding,   I'll  go  find  out  what  the   users  want."  

4  

Same  Challenges/Different  Environment  

! Security   ­ Engaged  All  Necessary  AWS  Security  Features   ­ Are  we  Firewalled  Correctly  
! Compliance   ­ Followed  All  Published  Standards  
! Networking   ­ Placed  Servers  on  the  Correct  Network  
! Finance   ­ Stayed  within  Budget  
! Capacity  Planning   ­ Used  Resources  Op;mally  
! But,  Now  in  a  Decentralized  Model   ­ It's  déjà  vu  all  over  again...Yogi  Berra  

"With  great  power   comes  great   responsibility."  

5  

AWS  Security  ­  Iden;ty  Access  Management  
! AWS  Shared  Responsibility  Model   ­ AWS  ­  "Security  of  the  Cloud"   ­ YOU  ­  "Security  in  the  Cloud"  
! Iden;ty  Access  Management  (IAM)   ­ Cri;cal  security--related  "service"  
! Best  Prac;ces   ­ Lock  away  your  AWS  account  (root)  access  keys   ê Console  Access   ­ Rotate  Creden;als  Regularly   ê Time  vs  Event  Driven   ­ Remove  Unnecessary  Creden;als   ê Unused   ­ Grant  Least  Privilege   ­ Keep  a  History  of  Ac;vity  in  your  AWS  Account  
6  

Lock  Away  Your  AWS  Account  (Root)  Access  Keys     

IAM

AWS CloudTrail

index=aws--cloudtrail  sourcetype=aws--cloudtrail  "requestParameters.userName"=root  eventName=CreateAccessKey
index=aws--cloudtrail  "userIdentity.arn"="*:root"  eventName=Console*  |   table  _time  eventName  responseElements.ConsoleLogin  awsRegion  sourceIPAddress  eventSource  userIdentity.arn  userIdentity.type   userIdentity.accountId  userAgent
7  

Creden;als  (Rota;on/Unnecessary)  

#!/usr/bin/python
IAM
import boto

AWS CloudTrail

from boto.iam.connection import IAMConnection

iam = IAMConnection( aws_access_key_id = 'xxxxx', aws_secret_access_key = 'xxxxxxxx', proxy = 'xxxxx', proxy_port = 'xxxx' )

users = iam.get_all_users().list_users_response.list_users_result.users for user in users:
if 'password_last_used' in user: print ("%s\t%s\t%s") % ( user['create_date'], user['user_name'],
user['password_last_used'] ) else: print ("%s\t%s\t%s") % ( user['create_date'], user['user_name'], 'NEVER')

Python (boto)

8  

Grant  Least  Privilege  

IAM

AWS CloudTrail

·    Security ·    Operations ·    Development

Version   Controlled Repository

Python (boto)

ROLE  ABC autoscaling:DeletePolicy:Deny autoscaling:DeleteScheduledAction:Deny autoscaling:DeleteTags:Deny autoscaling:DescribeAdjustmentTypes:Allow autoscaling:DescribeAutoScalingGroups:DontCare autoscaling:DescribeAutoScalingInstances:Allow
9  

10  

Beyond  IAM  Best  Prac;ces  
!  Tagging  Compliance   !  Security  Group     !  Logging   !  S3/EBS  Encryp;on   !  S3  Bucket  Policies   !  AMI  White/Blacklis;ng   !  EC2  Role     !  Naming  Conven;ons   !  New  AWS  Features  will  Supplant  
­ VPC  Flows   ­ Config  
11  

Project  Cost  Management  in  AWS   Harnessing  the  Power  of  Splunk  

Where  We  Were  
· Tradi;onal  Financial  Review  Cycles  Too  Long   ­ Quarterly  Reviews  
· AWS  Detailed  Billing  Reports  Are  Daun;ng   ­ Over  10  Million  Line  Items  
· Project  Managers  Need  Focus   ­ Am  I  Below  My  Budget?   ­ Where  Are  My  Costs  Going?   ­ Who's  Spending  Them?  
· Manual  Compila;on  of  Reports   ­ Integrate  FINRA  Data  
13  

Approach  Chosen  
· Use  Splunk  as  Process/Delivery  System   ­ Ability  to  Collect/Analyze/Visualize  
!  Collect  AWS  Billing  Data  in  Splunk   ­ Billing  Data  from  S3  bucket  (Daily  Load)   ­ Detailed  Line  Items  w/Resources  &  Tags  
!  Data  Enrichment   ­ Project  Code  Lookups   ­ Forecast  Projec;ons   ­ Billing  Adjustments  
!  Build  Interfaces   ­ FINRA  AWS  Billing  App  
14  

How  We  Did  It  
15  

FINRA  AWS  Billing  App  
16  

AWS  Billing  App  

AWS  Billing  App  
18  

Impact  ­  Reduced  Costs  
!  Focus  on  Low  Hanging  Fruit  
­ Shutng  Down  Services  over  Weekends/Evenings   ­ Storage  Sun  Setng/Dormant  EC2   ­ Iden;fy  AWS  Services  with  Highest  Spending   ­ Projects  Over  Budget  
!  Results  
­ 13.5%  Reduc;on  in  Billing  Line  Items  in  1  Month  
!  Bever  Forecast  Projec;ons  
­ Feedback  and  Control  
  
19  

Futures  
!  Users  Want  Even  Shorter  Cycles   !  Back  Tagging   !  `Free  Rider'  Services   !  Drill  Down  Analy;cs  
20  

Splunking  in  AWS  EMR   Gaining  Transparency  Into  PaaS  

What  Stood  In  Our  Way  
§ PaaS  and  IaaS  are  not  Equal   § Instance  Fingerprin;ng  
§ Iden;fy  Nodes   § Instance  Role   § User  Tags  
§ Data  Reten;on   § Collec;on  Delay   Ø Bootstrap  Splunk  Agent  
22  

Bootstrap  Splunk  Agent  

  
· Store  bsx  in  S3  

­ Splunk  rpm   ­ Deploymentclient.conf  

  

­ Discovery  Scripts*  

Amazon EMR

forwarder

BOOTSTRAP

· Execute  Bootstrap  

· Master  Installa;on  

forwarder

MASTER

· Core  &  Task  Installa;on  

Amazon S3

· AWS  was  Extremely  Suppor;ve  of  this  

Method  

CORES

TASK
CLUSTER

Availability Zone

23  

Instance  Fingerprin;ng  
1. Determine  the  Iden;ty  of    the  Node:   oEC2  nodes  have  "metadata"  service  @  hvp://169.254.169.254  
o INSTANCE_ID=`curl  hvp://169.254.169.254/1.0/meta--data/instance--id/`   o echo  $INSTANCE_ID          i--8f0d4c75   o IP=`curl  --s  hvp://169.254.169.254/2014--11--05/meta--data/local--ipv4/`     
2. Grab  the  User  Defined  Tags  
o AGS_TAG=`/opt/aws/apitools/ec2/bin/ec2--describe--tags|grep  $INSTANCE_ID|grep   AGS|cut  --f5`  
o SDLC=`/opt/aws/apitools/ec2/bin/ec2--describe--tags|grep  $INSTANCE_ID|grep  SDLC| cut  --f5|awk  '{print  substr($0,1,1)}'`  
24  

Instance  Fingerprin;ng  
3. Get  the  jobFlowID  (EMR  Cluster  ID)  for  the  node:  
o JOBFLOW_ID=`awk  --F"[,:]"  '{for(i=1;i<=NF;i++){if($i~/jobFlowId\042/){print  $(i+1)}  }  }'  /mnt/var/lib/ info/job--flow.json|tr  --d  [\"\  ]`  
4. Determine  Role  Node  in  the  EMR  cluster:  
o INSTANCE_ROLE=`cat  /mnt/var/lib/info/job--flow.json  |  ruby  --e  "require  'rubygems';  require  'json';   require  'pp';  igs=JSON  [STDIN.read]['instanceGroups'];  igid=ENV['INSTANCEGROUP_ID'];ig  =  igs.find  {|i|   i['instanceGroupId']  ==  igid};puts  ig['instanceRole']"|awk  '{print  toupper($0)}'`  
5. Update  Splunk  Config  Files  
o Deploymentclient.conf   o Inputs.conf  
25  

Inputs.conf  Example  

inputs.conf!

  

[default]!

host = EMRAPP1-MASTERED-j-YQQU43YEHG4X:1.1.1.1!
_meta=jobflow-id::"j-YQQU43YEHG4X" instancegroupid::"ig-3JBIDJGYVSD4N" instance-id::"i-22f7f3f0" instance-role::"MASTER" ags_hostname::"EMRAPP1MASTERED-j-YQQU43YEHG4X:1.1.1.1" ags::"ABCD" cost_center::"CLDABC" creator::"APP1_Team" name::"AWSLXAPP1-CLED01-YR" owner::"USERIDABC" purpose::"APP1_QUERY_CL" sdlc::"DEV"!

26  

EMR  Cluster  Analyzer  ­>  Summary  Dashboard  
SELECT THE CLUSTER
AWS  Billing
Splunk  for  *NIX Jobs  running

Poten;al  EC2  Provisioning  Cost  Savings  

!  m1.xlarge   ­ 4  vCPUs  with  8  ECUs   ­ 15  GB  memory   ­ 4  x  420  GB  disk   ­ $0.35  per  hour  

With  addi;onal  ECUs  and  SSD  disks,  the  c3.xlarge  may  be  more  performant  tha n  the  m1.xlarge  instances  at  a    
bever  price  point  
RESIZING***

!  c3.xlarge   ­ 4  vCPUs  with  14  ECUs   ­ 7.5  GB  memory   ­ 2  x  40  GB  disk  (SSD)   ­ $0.27  per  hour  

    Poten;al  23%  sav ings  in  EMR  costs  

Resizing  Analysis  
Summary  provides   the  informa;on  of  number  of  Nodes  
1.  Less  than  80%  u;liza;on  overall      2.  AMer  70mins  u;liza;on  at  less  than  50%  (cpu)      Conclusion:   The  cluster  be  resized  aMer  the  two  hours  
29  

Resizing  Analysis  ­  Scenario  1  

All  instances  running  for  full  dura;on  of  the  job  

1st  Hour   40  

2nd  Hour   40  

3rd  Hour   40  

4th  Hour   40  

Cost  Analysis:  
  
Cost  =  (Price  per  instance)  *  (No  of  Instances)  *  (No  of  hours)      Price  =  0.35  *  40  *  4  =  $56  
  

30  

Resizing  Analysis  ­  Scenario  2  

Resizing  aMer  the  1st  hour  and  2nd  hour  

1st  Hour   40  

2nd  Hour   35  

3rd  Hour   20  

4th  Hour   20  

Cost  Analysis:  
  
Cost  =  (Price  per  instance)  *  (No  of  Instances)  *  (No  of  hours)      Price  =  (0.35*40*1)  +  (0.35*35*1)+(0.35*20*2)  =  14  +  12.25  +  14  =  $40.25     
Savings  Compared  to  Scenario  1  =  28.2%     
31  

Combined  EC2  Provisioning  &  Resizing  Analysis  
!  Combined  Savings   ­ Original  Cost  =  $56   ­ Price  AMer  Combined  Analysis  =  $31.05  
­ Job  Savings  =  $24.95  =    55.44%  
!  Job  Runs  5x/day  (  $24.95  *  5  =  $124.75  )   !  Every  Business  day/week  (  $124.75  *  5  =  $623.75  )   !  Every  Week  of  the  Year  (  $623.75  *  52  =  $32,435  )   !  And....We  Haven't  Affected  Performance  
­ Just  More  Efficient  Provisioning  
32  

Cluster Summary
Per  Cluster  

Job  History  

.jhist  file  Analysis:  
· Cluster  level  sta;s;cs   · Run  Time,  Map/Reduce  Stats  per  Steps  
33  

Futures/Other  Uses  

· Grade  Clusters     · Iden;fy  under  u;lized  clusters  for  faster  resizing  

· ITSI  Integra;on

    

· KPI's  based  auto  analysis  on  Cloud  

· Addi;onal  Input  Variables   · Size  of  Data  Sets   · Number  of  Runs  
· Metrics  Correla;on   · Analyze  Steps   · Jobs  Impact  on  System  

  
  
34  

THANK  YOU  

