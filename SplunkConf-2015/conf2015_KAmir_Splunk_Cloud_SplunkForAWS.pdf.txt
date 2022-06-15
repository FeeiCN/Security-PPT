Splunk  for  AWS  
Kam  Amir   Ma2  Poland  

Disclaimer  
During  the  course  of  this  presenta=on,  we  may  make  forward  looking  statements  regarding  future  events   or   the   expected   performance   of   the   company.   We   cau=on   you   that   such   statements   reflect   our   current   expecta=ons  and  es=mates  based  on  factors  currently  known  to  us  and  that  actual  events  or  results  could   differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  contained  in  our   forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward--looking  statements  made   in  the  this  presenta=on  are  being  made  as  of  the  =me  and  date  of  its  live  presenta=on.  If  reviewed  aNer   its   live   presenta=on,   this   presenta=on   may   not   contain   current   or   accurate   informa=on.   We   do   not   assume  any  obliga=on  to  update  any  forward  looking  statements  we  may  make.        In  addi=on,  any  informa=on  about  our  roadmap  outlines  our  general  product  direc=on  and  is  subject  to   change   at   any   =me   without   no=ce.   It   is   for   informa=onal   purposes   only   and   shall   not,   be   incorporated   into   any   contract   or   other   commitment.   Splunk   undertakes   no   obliga=on   either   to   develop   the   features   or  func=onality  described  or  to  include  any  such  feature  or  func=onality  in  a  future  release.  
2  

Objec=ve  Of  This  Session  
!  This  session  is  meant  for  AWS  users  who  are  seQng  up  the  Splunk   App  for  AWS  (Amazon  Web  Services).  
!  We  will  help  you  get  an  understanding  of  the  App  and  all  the  AWS   components  it  interacts  with.      
!  This  session  will  also  cover  troubleshoo=ng  the  app  and  properly   seQng  up  your  AWS  environment  to  work  with  the  App.  
!  Using  the  Splunk  App  for  AWS  you  will  gain  visibility  across  your   AWS  Deployment.  

Agenda  
!  AWS  Components   !  Permissions  for  SQS,  SNS  and  S3  buckets   !  What's  new  in  Splunk  App  for  AWS  v.4.0   !  SeQng  up  Splunk  App  for  AWS   !  Troubleshoo=ng  Splunk  App  for  AWS   !  Crea=ng  modular  inputs  for  AWS  third  party  apps   !  Ques=ons  &  Answers  

AWS  Components  

Terminology  
!  AWS  ­  Amazon  Web  Services  
­ Amazon's  (retailer)  Cloud  Compu=ng  Business  
!  SQS  ­  Simple  Queuing  Service  
­ Distributed  queue  messaging  service  
!  SNS  ­  Simple  No=fica=on  Service  
­ Mul=--protocol  Push  no=fica=on    
!  S3  ­  Simple  Storage  Service  
­ Online  file  storage  service  offered  by  Amazon   ­ Provides  web  services  interfaces  through  SOAP  and  REST        
  

AWS  Architecture  Diagram  

Amazon  Storage  /  Queues   AWS SQS

Amazon  Messaging  

SNS Topic

Amazon  Logging  Layer  

AWS CloudTrail

S3 Bucket AWS SNS AWS Config

Splunk  Collects  the   data  from  the  AWS   SQS  and  the  S3  bucket   using  the  AWS  SDK  for   python  (Boto3).  
h2ps://aws.amazon.com/sdk--for--python/  

Amazon  Instances  

AWS Instance with CloudWatch

VPC Flow Logs

AWS CloudWatch

Splunk  Offerings  in  AWS  

Cloud--service  

· Splunk  Enterprise   as  a  service  
· Full  app,  SDK,  API,   plahorm  support  

· Cloud  service   designed  for  small  IT   environments  
· $90  a  month  

Self--managed  

· Self--managed  cloud   deployments  
· Self--deploy  in  AWS  

· Integrated  with  EMR   · Search  data  in  S3   · Hourly  pricing    

· Splunk  App  for   AWS:  Integrates   w/CloudTrail,   Config  and  Billing,   VPC  Flow  Logs  
Integra(ons  

Splunk  App  for  AWS  
!  AWS  CloudTrail     ­ Service  that  delivers  logs  of  admin  ac=vity  on  AWS  infrastructure   ­ start/stop/create  instance;  change  user  roles/rights;  modify  network  config   ­ CloudTrail  service  simply  delivers  log  files  to  customers;  there  is  no  UI,  display,  analysis,  search   etc.   ­ VPC  Flow  Logs  is  a  feature  that  enables  you  to  capture  informa=on  about  the  IP  traffic  going  to   and  from  network  interfaces  in  your  VPC.  Flow  log  data  is  stored  using  Amazon  CloudWatch   Logs.  ANer  you've  created  a  flow  log,  you  can  view  and  retrieve  its  data  in  Amazon  CloudWatch   Logs.    
!  AWS  Config   ­ AWS  Config  is  a  fully  managed  service  that  provides  you  with  an  AWS  resource  inventory,   configura=on  history,  and  configura=on  change  no=fica=ons  to  enable  security  and   governance.     ­ With  AWS  Config  you  can  discover  exis=ng  AWS  resources,  export  a  complete  inventory  of   your  AWS  resources  with  all  configura=on  details,  and  determine  how  a  resource  was   configured  at  any  point  in  =me.  
!  AWS  Billing  

Requirements  For  Splunk  App  For  AWS  

Splunk  
· Splunk  6.1  or  later   · Splunk  Add--on  for  Amazon  Web  
Services   · Splunk  Add--on  for  Amazon  Web  
Services  +1.1.0  required  for  AWS   Config  

AWS  
· AWS  CloudTrail:  Enable  CloudTrail   with  SQS  and  SNS.    
· AWS  Config:  Enable  Config  with   SQS  and  SNS.    
· Billing:  Refer  to  the  AWS   documenta=on  to  turn  on  AWS   detailed  billing.    
· VPC  Flow  Logs:  Enable  VPC  Flow  log   collec=on.  

Install  the  Splunk  Add--on  for  AWS  
1.  Configure  your  AWS  accounts  and  services,  or  confirm  your  exis=ng   configura=ons.   2.  Configure  your  AWS  account  permissions  to  match  those  required   by  the  add--on.   3.  Install  the  add--on.   4.  Set  up  the  add--on  on  your  forwarders  or  single  instance.   5.  Configure  your  inputs  to  get  your  AWS  data  into  Splunk  Enterprise.  

Permissions  

CloudTrail   API  Tracking  

Permissions  

S3  Storage  

splunkuser  
Sample  permissions  for  cloudtrail  

SNS  No=fica=on  

SQS  Message  Queue  

Configure  Permissions  1  of  2  

· S3  /  Billing  Permissions  

CloudTrail  Permission  

{  

{  

        "Version":  "2012--10--17",  

    "Version":  "2012--10--17",  

        "Statement":  [                   {  

    "Statement":  [           {  

                        "Ac=on":  [                                   "sqs:GetQueueA2ributes",                                   "sqs:ListQueues",  

            "Effect":  "Allow",  

                                "sqs:ReceiveMessage",                                   "sqs:GetQueueUrl",  

            "Ac=on":  [  

                                "sqs:DeleteMessage",  

                "s3:Get*",  

                                "s3:Get*",                                   "s3:List*"  

                "s3:List*"               ],  

                                "s3:Delete*"                           ],                           "Effect":  "Allow",  

            "Resource":  "arn:aws:s3:::*"  

                        "Resource":  [                                 "arn:aws:sqs:*",  

        }       ]  

                              "arn:aws:s3:::*"                           ]                   }  

}  

        ]  

}  

h=p://docs.splunk.com/Documenta(on/AddOns/released/AWS/ConfigureAWSpermissions  

Configure  Permissions  2  of  2  

CloudWatch  Permission  

· AWS  Config  Permission  

{       "Version":  "2012--10--17",       "Statement":  [           {               "Ac=on":  [                   "autoscaling:Describe*",                   "cloudwatch:Describe*",                   "cloudwatch:Get*",                   "cloudwatch:List*",                   "sns:Get*",                   "sns:List*"               ],  

{           "Version":  "2012--10--17",           "Statement":  [                   {                           "Ac=on":  [                                   "sqs:GetQueueA2ributes",                                   "sqs:ListQueues",                                   "sqs:ReceiveMessage",                                   "sqs:GetQueueUrl",                                   "sqs:DeleteMessage",                                   "s3:Get*",                                   "s3:List*"                           ],                           "Effect":  "Allow",                           "Resource":  [                                 "arn:aws:sqs:*",                                 "arn:aws:s3:::*"                           ]                   }           ]   }  

            "Effect":  "Allow",  

            "Resource":  "*"           }  

h=p://docs.splunk.com/Documenta(on/AddOns/released/AWS/ConfigureAWSpermissions  

    ]  

Splunk  App  for  AWS   Setup  

Install  Add--on  for  AWS  
!  Install  the  Add--on  on  either  a  Search  Head  (Single  Deployment)  or   on  a  Heavy  Weight  Forwarder  (Distributed  Deployment)  due  to  the   Python  requirement  and  the  add--on  requires  the  Splunk  Web  user   interface  to  perform  the  setup  and  authen(ca(on  with  AWS.  
!  The  add--on  uses  the  creden=al  vault  to  secure  your  creden=als,  and   this  creden=al  management  solu=on  is  incompa(ble  with  the   deployment  server.  
!  The  add--on  uses  modular  inputs  to  collect  data  remotely.  Using  a   deployment  server  to  deploy  configured  add--ons  to  mul=ple   forwarders  results  in  duplicate  data  collec(on.  

Splunk  Architecture  

Single  Splunk  Deployment   Distributed  Splunk  Deployment  

Splunk'server

Splunk  App   for  AWS  
installed  on   all--in--one  
Splunk   server  

Heavy+Weight+ Forwarder

Indexer

Indexer

Indexer

Splunk  Add-- on  for  AWS   installed  on  
Heavy   Weight   Forwarder  

Splunk+search

What's  New  In   Splunk  App  For  AWS  
4.0  

New  Features  in  v.4.0  
!  Easier  onboarding  of  AWS  data   !  Enhanced  Overview  dashboards  and  reports   !  Insight  into  VPC  Flow  Data   !  Topology  View  

Add  Your   Account  
Add  your   AWS   Inputs  

New  Setup  4.0  

Wait  5  ­  10  Minutes  
!  Yes,  you'll  need  to  wait  before  all  the  dashboards  and  reports  populate.  

Validate  Your  Splunk  App  Setup  
!  Index=aws--*  |  stats  count  by  sourcetype  

Gain  Visibility  Into  AWS  Logs  

Overview  for  Splunk  App  for  AWS  
· The  overview  page  shows  you  on  one  screen  informa=on  about  Configura=on  changes,   Compute,  Network,  Storage  and  Security  
· Notable  CloudTrail  Ac=vity  is  highlighted  on  the  map   · Drill  down  on  any  event  and  gain  detailed  informa=on  

AWS  Topology  
!  Topology  view  gives  you  a  holis=c   view  of  your  AWS  deployment  
!  Maps  out  rela=onships  between  all   the  components,  giving  you  a  clear   view  into  the  environment    
!  Customizable  views  allow  you  to   pick  on  items  and  see  specific  details   about  those  items  

AWS  Usage  Overview  
· In  one  glance,  instantly  see  your  EC2  usage   · Click  down  views  jump  to  interac=ve  dashboards  that  highlight   · See  detailed  informa=on  about  individual  EC2  instances   · Drill  down  into  raw  search  for  even  more  detailed  views  on  your  instances   · Detailed  EBS  Volume  data  informa=on  

AWS  Security  Overview  
· Quickly  see  events  that  impact  your  AWS  security   · Drill  down  into  Authorized  vs.  Unauthorized  Account  Ac=vity   · View  Errors  across  VPC,  IAM,  Key  Pairs,  Network  ACL's  and  Security  Groups   · Map  user  ac=vity   · Get  a  list  of  events  happening  in  your  deployment  

VPC  Flow  Data  --  Traffic  
· View  VPC  Flow  Logs  for  Traffic  Analysis   · Drill  down  into  individual  network  interfaces   · View  total  traffic  flowing  in  /  out  of  your  AWS  VPC's   · See  top  source  /  des=na=on  and  IP  Addresses  and  ports  

VPC  Flow  Data  --  Security  
· View  VPC  Flow  Logs  for  Security  Analysis   · Drill  down  into  rejected  vs.  accepted  traffic   · View  top  Source  Country  and  City  informa=on   · See  top  source  /  des=na=on  and  IP  Addresses  and  ports  

AWS  User  Ac=vi=es  
· Quickly  see  the  number  of  ac=ve  users  logged  into  the  system   · Get  alerted  on  unauthorized  user  ac=vi=es   · See  what  ARN's  are  being  used  to  access  services  and  the  correlated  func=ons   · Create  alerts  for  any  user  ac=on  

AWS  Billing  and  the  Splunk  App  for  AWS  
!  Leverages  data  being  stored  in  S3  buckets  for  your  AWS  bills   !  Dashboards  show  you  the  current  spend  on  your  AWS  deployment   !  You  can  see  costs  by  Month,  user  accounts,  services  etc.   !  Create  custom  alerts  when  your  bills  are  climbing  higher  than  expected.  

Troubleshoo=ng  

Troubleshoo=ng  
!  Check  the  permissions  on  the  AWS  user  that  you  are  using  to  collect   logs.  Default  is  no  access  for  users  and  resources.  Deny  takes   precedence  
!  Splunk  the  logs    index=_internal  sourcetype=aws*   !  Dashboards  not  popula=ng  in  the  AWS  app  ­  make  sure  data  is  
flowing  to  the  index  the  dashboard  search  expects  it  in   !  Python  scripts  log  error  messages,  like  Access  Denied,  SQS  not  
found,  etc.  
! h2p://docs.splunk.com/Documenta=on/AddOns/latest/AWS/Troubleshoo=ng  

Building  your  own   Modular  Input  for  
AWS  

Python  Script  
!  Create  Python  Script  that  talks  to  Boto  SDK   !  Use  aws_s3.py  as  a  template  to  collect  data  from  S3  bucket   !  Use  aws_config.py  as  a  template  to  collect  data  from  SQS   !  Modify  it  with  specific  output  from  either  JSON,  Key  Value  Pairs,  
CSV,  etc.   !  ($SPLUNK_HOME/etc/apps/Splunk_TA_aws/bin/)  

Data_inputs_aws--yourapp.xml  
!  Located  in  $SPLUNK_HOME/etc/apps/Splunk_TA_yourapp/default/ data/ui/manager  
!  This  XML  file  will  populate  the  Data  Inputs  Screen:  

Props.conf  

!  Located  in  $SPLUNK_HOME/etc/apps/Splunk_TA_yourapp/default/   !  This  config  file  will  tell  Splunk  how  to  parse  the  data  from  the  SQS  

JSON  Forma2ed  

##################################  

###                  AWS  YourApp     

          ###  

##################################  

  

[aws:yourapp]  

INDEXED_EXTRACTIONS  =  JSON  

TIME_PREFIX  =  \"TimeStamp\"\s*\:\s*\"  

TIME_FORMAT  =  %Y--%m--%dT%H:%M:%S%Z  

MAX_TIMESTAMP_LOOKAHEAD  =  28  

KVP  Forma2ed  

##################################  

###                  AWS  YourApp     

          ###  

##################################  

  

[aws:dome9]  

SHOULD_LINEMERGE  =  false  

TRUNCATE  =  8388608  

TIME_PREFIX  =  \"TimeStamp\"\s*\:\s*\"  

TIME_FORMAT  =  %Y--%m--%dT%H:%M:%S%Z  

MAX_TIMESTAMP_LOOKAHEAD  =  28  

Inputs.conf  
!  This  file  will  be  populated  once  you  go  through  the  Data  Inputs   Wizard  
   [aws_yourapp]  
aws_account  =   sourcetype  =  aws:yourapp   #exclude_describe_events  =  true   enable_addi=onal_no=fica=ons  =  false   queueSize  =  128KB   persistentQueueSize  =  24MB   interval  =  30  

README/inputs.conf.spec  
!  Located  in  $SPLUNK_HOME/etc/apps/Splunk_TA_yourapp/README   !  File  used  to  coincide  with  the  inputs  that  are  specified  in  the  XML  file  ($SPLUNK_HOME/etc/
apps/Splunk_TA_yourapp/default/data/ui/manager/data_input_yourapp.xml)  
aws_yourapp://<name>]   aws_account  =  AWS  account  used  to  connect  to  AWS   aws_region  =  AWS  region  of  log  no=fica=on  SQS  queue   sqs_queue  =  Starling  No=fica=on  SQS  queue   enable_addi=onal_no=fica=ons  =  Enable  collec=on  of  addi=onal  helper  no=fica=ons  

Imita=on  is  the  best  form  of  fla2ery  
!  Just  copy  the  Splunk_TA_aws  directory  with  all  the  python  scripts   for  the  Boto  SDK  J  
!  Add  your  custom  scripts,  config  files  and  XML  files  

Thanks!  

