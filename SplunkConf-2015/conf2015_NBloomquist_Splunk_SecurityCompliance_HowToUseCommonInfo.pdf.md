Copyright  ©  2015  Splunk  Inc.  
How  To  Use  Common   InformaGon  Model  to   Gain  Security   Awareness  &  Prepare   For  Enterprise  Security  
Niklas  Blomquist  
Senior  Sales  Engineer  SME  Security,     Splunk  

Disclaimer  
During  the  course  of  this  presentaGon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauGon  you  that  such  statements  reflect  our   current  expectaGons  and  esGmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaGon  are  being  made  as  of  the  Gme  and  date  of  its  live   presentaGon.  If  reviewed  aWer  its  live  presentaGon,  this  presentaGon  may  not  contain  current  or   accurate  informaGon.  We  do  not  assume  any  obligaGon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiGon,  any  informaGon  about  our  roadmap  outlines  our  general  product  direcGon  and  is  subject  to   change  at  any  Gme  without  noGce.  It  is  for  informaGonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaGon  either  to  develop  the  features  
or  funcGonality  described  or  to  include  any  such  feature  or  funcGonality  in  a  future  release.  
2  

Personal  IntroducGon  
 Niklas  Blomquist   Splunk  ­  Does  it  need  any  presentaGon?  
 Senior  Sales  Engineer/SME  Security    
­ Lead  larger  security  project     ­ How  to  use  Splunk  for  security     ­ 18  Years  in  security   ­ Love  my  work,  cooking  (BBQ)  and  my  family  
 Fun  fact  
­ There  are  no  polar  bears  on  the  streets  in  Sweden!!!  
3  

Agenda  
 What  are  Common  InformaGon  Model      How  do  I  "enable"  CIM?    Technology  Add--on    Dashboards  and  searches  with  CIM    Enterprise  Security  +  CIM  
4  

What  are  the  Common   InformaGon  Model?  

What  are  the  CIM?  
 CIM  standardize  (normalize)  data    Unified  view  of  data    Search  Gme  schema    Set  of  field  names  and  tags    Does  not  change  raw  data  
hjps://xkcd.com/1179/  
6  

Wow  ­  That's  Great!  Why  do  we  Need  CIM?  
To  build  searches/apps  without  data  knowledge  
7  

Wow  ­  That's  Great!  Why  do  we  Need  CIM?  

 Vendor  A  vs  vendor  B   Allowed  traffic  

­ Aug    7  15:44:44  10.1.1.99  Aug  07  2007  15:44:44  10.1.1.99  :  %ASA--6--302013:  

Built  inbound  TCP  connecGon  3120386  for  outside:192.168.150.85/2309  

(192.168.150.85/2309)  to  inside:192.168.1.150/80  (192.168.1.150/80)    

­ Feb    4  16:00:01  1,2014/02/04  16:00:01,0009C101998,TRAFFIC,end,

1,2014/02/04  

Allowed  traffic  

16:00:01,10.75.1.77,167.216.129.11,204.107.141.240,167.216.129.11,RFC19

18  to  

Internet,,,ssl,vsys1,Trust,Untrust,ae1.902,ae1.1000,LoggingToPanorama,

2014/02/04  16:00:01,1636682,1,52089,443,47241,443,0x400000,tcp,allow,

4442,2350,2092,23,2014/02/04  15:59:19,40,business--and--economy,

0,4974797752,0x0,10.0.0.0--10.255.255.255,United  States,0,13,10  

8  

Other  Benefits  with  CIM  
 Includes  22  pre--configured   data  models    
 Easier  creaGon  of     searches/dashboards  
 Dashboards/reports     from  pivot  
9  

AuthenGcaGon  Datamodel  
Field  names  
· acGon=success/failure/unknown   · src=src  ip   · dest=dest  ip   · app=applicaGon   · user=user  name  
Tags  
· tag  =  authenGcaGon   · tag  =  privileged   · tag  =  default  
10  

Example  of  Failed  AuthenGcaGon  

Windows  
· LogName=Security  EventCode=529   EventType=16  Type=Failure  Audit   SourceName=Security   RecordNumber=725650913   Category=2  CategoryString=Logon/ Logoff  ComputerName=HOST--001   User=SYSTEM  Sid=S--1--5--18  SidType=1   Message=Logon  Failure:  Reason:   Unknown  user  name  or  bad  password   User  Name:  Hax0r  Domain:   ACMETECH  Logon  Type:  2  Logon   Process:  IAS  AuthenGcaGon  Package:  

Linux  
· Aug  26  15:00:20  acmepayroll   sshd[15038]:  Failed  password  for   invalid  user  vpopmail  from   10.11.36.11  port  38368  ssh2  

11  

Example  of  Failed  AuthenGcaGon  

Without  CIM  
· (Sourcetype=WinEventLog:Security   (signature_id=4625  OR   signature_id=529  OR  signature_id=530   OR  signature_id=531  OR   signature_id=532  OR  signature_id=533   OR  signature_id=534  OR   signature_id=535  OR  signature_id=536   OR  signature_id=537  OR   signature_id=539)  OR   (sourcetype=linux_secure  "Failed   password  for"  OR  "Invalid  user")  |   rename  "User  Name"  AS  user,  "Source   Network  Address  "  AS  src  

CIM  
· tag=authenGcaGon  acGon=failure  

12  

Searches  
 All  failed  authenGcaGon  events    
­ tag=authenGcaGon  acGon=failure  
 All  privileged  authenGcaGon  events  
­ tag=authenGcaGon  tag=privileged  
 All  failed  authenGcaGons  for  applicaGon  Oracle  
­ tag=authenGcaGon  acGon=failed  app=oracle  
13  

How  do  we  do  the   NormalizaGon?  

How  do  we  do  the  NormalizaGon?  
 Technology  Add--on  (TA's)    Set  of  configuraGon  files  
­ Correct  event  breaking     ­ Correct  field  extracGon   ­ Field  rename  (if  needed)  
ê src,  dest,  user  etc   ­ Apply  context  to  the  data  
ê tags   ê fields  ­  acGon=allow/blocked  
 Everything  are  applied  at  search  Gme  so  it  can  be  used  with     old  data!  
15  

About  TA's  
 Read  the  documentaGon!    OPSEC  LEA  =  OS  Dependency    Correct  sourcetype  
­ Correct  sourcetype  are  important   ­ Every  TA  are  bound  to  sourcetype/s     
· Old  data  with  wrong  sourcetype  
· Change  sourcetype  in  TA   · Export  and  import  data    
16  

About  TA's  
 Read  the  documentaGon!    Special  input  requirements  
­ Syslog   ­ Monitor  file   ­ DB  Connect  
 Version  dependency's  
17  

About  Syslog  
 Different  type  on  same  port  will  not  work    Unless  they  are  wrijen  to  support  it  
­ Cisco  ASA  ­  PIX  ­  FWSM  
 Different  ports  ­  different  TA's/sourcetype  
 Best  PracGce:    
· Syslog--NG/Rsyslog  writes  into  a  file   · Splunk  Universal  Forwarder  monitors  file  
18  

Where  to  Apply  the  TA's  
19  

Some  TroubleshooGng  Tips  
 Check  the  documentaGon    Do  you  get  data  in  at  all?    Is  the  input  working  (port,  file  monitor  etc)?    Correct  sourcetype    Correct  inpujype    Have  you  restarted  Splunk?    Version  dependency's  
20  

Some  TroubleshooGng  Tips  
 Access  to  the  index    Default  search  for  the  index    Missing  fields  ­  correct  data  sent?    Permissions  correctly  on  knowledge  objects?  
­ Global,  App,  Private  
 Verify  all  fields  and  tags  
21  

Nice  ­  Where  can  I  Download  This???  
22  

TA's  on  Splunkbase  
23  

What  do  I  do  if  There  is  no  TA's  for  my  Stuff?  
 TA's  Can  be  created  by  the  customer,  our  partners  or  via  Splunk  PS    Everything  you  need  are  documented  on  docs.splunk.com  
24  

How  to  Create   Dashboards  and  
Reports  From     Data  Models  

Panels  from  Pivot  vs  Premade  Panels?  

Panels  from  Pivot     

Panels  from  TA's  

26  

Nr  of  Failed  AuthenGcaGon  Last  7  days  per  App  
27  

Click  here  
28  

29  

30  

31  

32  

33  

34  

35  

Enterprise  Security  ­   How  Will  CIM  Prepare  
For  that?  

Enterprise  Security  ­  How  will  CIM  Prepare  for  that?  
 Most  work  are  with  ge{ng  data  in    Create  new  TA's  will  be  a  part  of  that    All  data  =  CIM  =  ready  to  go!  
37  

What  do  I  Need  to  do  more?  
 Install  Enterprise  Security  app    Create  asset.csv  and  idenGty.csv    Edit  other  lookups/lists    Enable  relevant  correlaGon  searches    Tune  correlaGon  searches    Add  more  correlaGon  searches  for  specific  use--cases  
38  

Recap  
 CIM  Are  used  to  normalize  the  data    Unified  view  of  data    Prepare  for  Enterprise  Security    Provides  22  data  models    Easy  to  create  searches  and  dashboards    TA's  Are  used  to  normalized  data    Uses  tagging  and  specific  field  names      Both  CIM  and  TA's  are  available  at  Splunkbase  
39  

What  QuesGons  do  you  Have?  
40  

THANK  YOU  

Appendix  

Links  
 CIM  APP:  hjps://splunkbase.splunk.com/app/1621/    DocumentaGon:  
hjp://docs.splunk.com/DocumentaGon/CIM/latest/User/Overview    How  to  create  TA's:  hjp://docs.splunk.com/DocumentaGon/CIM/
latest/User/UsetheCIMtonormalizedataatsearchGme  
43  

