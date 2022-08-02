Copyright  ©  2015  Splunk  Inc.  
Data  On--Boarding  
Andrew  Duca  
Principal  Services  Consultant   Splunk  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  aQer  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

About  Me  
!  Principal  Professional  Services  Consultant  based  in  Boston,  MA   !  15+  years  of  world  wide  Professional  Services  ConsulFng;  the  last  
three  years  at  Splunk   !  Deployed  20+  engagements  ranging  from  1GB  to  5TB  for  Splunk  
Professional  Services  engagements  
3  

!  Data   !  Splunk  Components   !  Index  Data   !  Proper  Parsing   !  Challenging  Data   !  Advanced  Inputs     !  QuesFons  

Agenda  

4  

You  Are  in  The  Right  Room  If...  
!  You  have  used  Splunk  once,  or  at  least  read  about  it   !  You  are  interested  in  Splunk's  best  pracFces   !  You  like  to  use  Splunk's  default  parsing  rules   !  You  just  took  over  a  Splunk  deployment  and  you're  not  sure  what  to  
do   !  This  is  not  an  educaFon  class;  it's  best  pracFce  
5  

Data  
Splunk  is  the  engine  for  machine  data   !  Machine  data  is  more  than  just  lo   gs  --  it's  configuraFon  data,  data  
from  APIs  and  message  queues,  change  events,  the  output  of   diagnosFc  commands  and  more  
!  Log  types:  ApplicaFon,  Web  Access  and  Proxy,  Call  Detail  Records   (CDR),  Clickstream,  Message  Queues,  Packet,  Database  audit  and   tables,  File  audit,  Syslog,  WMI,  PerfMon  
!  Manual:  Gecng  Data  In   hdp://docs.splunk.com/DocumentaFon/Splunk/latest/Data/ WhatSplunkcanmonitor  
6  

Splunkbase  Apps  
!  Look  to  SplunkBase  first  and  uFlize  Add--Ons:  hdp://splunkbase.splunk.com/   !  Applies  the  Common  InformaFon  Model  (CIM)     !  CIM  details  the  standard  fields,  event  type  tags,  and  host  tags  that  Splunk  
uses  when  it  processes  most  IT  data   !  Example  Splunk  Supported  Apps  and  Add--ons:  
Splunk  App  for  Stream   Splunk  Add--on  for  MicrosoQ  Windows  Add--on  for   !  Example  Premium  Apps   Splunk  App  for  Enterprise  Security   Splunk  App  for  MicrosoQ  Exchange   Splunk  app  for  VMware  
7  

Splunk  Distributed  Components  

License  Master      Master  Node      Deployer  

Indexer  

Search  Head  

Deployment  Server  

Forwarder  
8  

Test  Environment  
!  Every  Splunk  deployment  should  have   a  test  environment  
!  It  can  be  a  laptop,  virtual  machine  or   spare  server  
!  Should  have  the  same  version  of   Splunk  running  in  producFon  
!  Accessible  to  other  Splunk  developers   and  administrators  
9  

One  Shot  
!  Easiest  way  to  get  data  into  your  test  environment   !  Components  of  the  oneshot:                     ./splunk  add  oneshot  user_conf.txt  ­index  indexname  ­sourcetype  sourcetype  name   !  Where  to  find  more  informaFon:  
hdp://docs.splunk.com/DocumentaFon/Splunk/latest/Data/ MonitorfilesanddirectoriesusingtheCLI  
10  

Data  --  Broken  
11  

Props  

!  Always  set  these  six  parameters  

    

  

  #  USER  CONFERENCE  

  

  [user_conf_2015]  

  

  TIME_PREFIX  =  ^  

  

  TIME_FORMAT  =  %Y--%m--%d  %H:%M:%S  

  

  MAX_TIMESTAMP_LOOKAHEAD  =  19  

  

  SHOULD_LINEMERGE  =  False  

  

  LINE_BREAKER  =  ([\n\r]+)\d{4}--\d{2}--\d{2}\s\d{2}:\d{2}:\d{2}  

  

  TRUNCATE  =  10000  

12  

Props  

!  Defaults  to  empty  

    

  

  #  USER  CONFERENCE  

  

  [user_conf_2015]  

  

  TIME_PREFIX  =  ^  

  

  TIME_FORMAT  =  %Y--%m--%d  %H:%M:%S  

  

  MAX_TIMESTAMP_LOOKAHEAD  =  19  

  

  SHOULD_LINEMERGE  =  False  

  

  LINE_BREAKER  =  ([\n\r]+)\d{4}--\d{2}--\d{2}\s\d{2}:\d{2}:\d{2}  

  

  TRUNCATE  =  10000  

13  

Props  

! strpFme  style  format  

    

  

  #  USER  CONFERENCE  

  

  [user_conf_2015]  

  

  TIME_PREFIX  =  ^  

  

  TIME_FORMAT  =  %Y--%m--%d  %H:%M:%S  

  

  MAX_TIMESTAMP_LOOKAHEAD  =  19  

  

  SHOULD_LINEMERGE  =  False  

  

  LINE_BREAKER  =  ([\n\r]+)\d{4}--\d{2}--\d{2}\s\d{2}:\d{2}:\d{2}  

  

  TRUNCATE  =  10000  

14  

Props  

!  By  default  MAX_TIMESTAMP_LOOKAHEAD  =  150  characters  

    

  

  #  USER  CONFERENCE  

  

  [user_conf_2015]  

  

  TIME_PREFIX  =  ^  

  

  TIME_FORMAT  =  %Y--%m--%d  %H:%M:%S  

  

  MAX_TIMESTAMP_LOOKAHEAD  =  19  

  

  SHOULD_LINEMERGE  =  False  

  

  LINE_BREAKER  =  ([\n\r]+)\d{4}--\d{2}--\d{2}\s\d{2}:\d{2}:\d{2}  

  

  TRUNCATE  =  10000  

15  

Props  

!  By  default  set  to  True  

    

  

  #  USER  CONFERENCE  

  

  [user_conf_2015]  

  

  TIME_PREFIX  =  ^  

  

  TIME_FORMAT  =  %Y--%m--%d  %H:%M:%S  

  

  MAX_TIMESTAMP_LOOKAHEAD  =  19  

  

  SHOULD_LINEMERGE  =  False  

  

  LINE_BREAKER  =  ([\n\r]+)\d{4}--\d{2}--\d{2}\s\d{2}:\d{2}:\d{2}  

  

  TRUNCATE  =  10000  

16  

Props  

!  By  default  set  to  ([\r\n]+);  change  to  posiFve  lookahead  

    

  

  #  USER  CONFERENCE  

  

  [user_conf_2015]  

  

  TIME_PREFIX  =  ^  

  

  TIME_FORMAT  =  %Y--%m--%d  %H:%M:%S  

  

  MAX_TIMESTAMP_LOOKAHEAD  =  19  

  

  SHOULD_LINEMERGE  =  False  

  

  LINE_BREAKER  =  ([\r\n]+)\d{4}--\d{2}--\d{2}\s\d{2}:\d{2}:\d{2}  

  

  TRUNCATE  =  10000  

17  

Props  

!  By  default  set  to  10000  bytes;  set  to  0  to  never  truncate  

    

  

  #  USER  CONFERENCE  

  

  [user_conf_2015]  

  

  TIME_PREFIX  =  ^  

  

  TIME_FORMAT  =  %Y--%m--%d  %H:%M:%S  

  

  MAX_TIMESTAMP_LOOKAHEAD  =  19  

  

  SHOULD_LINEMERGE  =  False  

  

  LINE_BREAKER  =  ([\n\r]+)\d{4}--\d{2}--\d{2}\s\d{2}:\d{2}:\d{2}  

  

  TRUNCATE  =  10000  

18  

Data  --  Fixed  
19  

6.3  Splunk  Web  Data   On--Boarding    

Why  Use  Splunk  Web  to  Onboard?  
Quick  and  easy  way  to...  
  
!  Easily  visualize  the  data  into  events  rather  then  lines  of  text   !  Quickly  get  the  data  properly  broken  into  events   !  Accurately  get  the  Fmestamp  extracted     
All  in  a  wicked  cool  GUI...  
Once  everything  is  good  you  take  your  PROPS  secngs  and  deploy  
21  

Splunk  Web  Data  On--Boarding  
!  Locate  the  Source  file  on  the  Splunk  Server's  file  system  
22  

Splunk  Web  Data  On--Boarding  
!  Validate  Event  breaking  and  Timestamp  recogniFon  
23  

Splunk  Web  Data  On--Boarding  
!  Resolve  Event  Breaking  
24  

Splunk  Web  Data  On--Boarding  
!  Set  Fmestamp  format  even  if  Splunk  figures  it  out  automaFcally  
25  

Splunk  Web  Data  On--Boarding  
!  Copy  the  props.conf  secngs  and  deploy  in  a  custom  app  
26  

Challenging  Data  

Limit  Indexed  Data  

! Anonymize  data:  

  [source::.../accounts.log]     SEDCMD--accounts  =  s/ssn=\d{5}(\d{4})/ssn=xxxxx\1/g  s/cc=(\d{4}--){3}(\d{4})/cc=xxxx--xxxx--xxxx--\2/g     

!  Rewrite  raw  data:  

  [source::.../sql.log]     SEDCMD--sqllog  =  s/(.*?)Command:EXECUTE[.\d\D\w\W]*/\1/g     

!  Discard  events:  
  props     [source::/var/log/user_conf.txt]     TRANSFORMS--null=  setnull  

transforms   [setnull]   REGEX        =   (?i)DEBUG   DEST_KEY  =    queue   FORMAT      =    nullQueue  

28  

Limit  Indexed  Data  

! Anonymize  data:  
  [source::.../accounts.log]  
  SEDCMD--accounts  =  s/ssn=\d{5}(\d{4})/ssn=xxxxx\1/g  s/cc=(\d{4}--){3}(\d{4})/cc=xxxx--xxxx--xxxx--\2/g  
  
!  Rewrite  raw  data:  

  [source::.../sql.log]  

  SEDCMD--sqllog  =  s/(.*?)Command:EXECUTE[.\d\D\w\W]*/\1/g  

  

!  Discard  events:  
  props     [source::/var/log/user_conf.txt]     TRANSFORMS--null=  setnull  

transforms   [setnull]   REGEX        =   (?i)DEBUG   DEST_KEY  =    queue   FORMAT      =    nullQueue  

29  

Limit  Indexed  Data  

! Anonymize  data:  

  [source::.../accounts.log]  
  SEDCMD--accounts  =  s/ssn=\d{5}(\d{4})/ssn=xxxxx\1/g  s/cc=(\d{4}--){3}(\d{4})/cc=xxxx--xxxx--xxxx--\2/g  
  
!  Rewrite  raw  data:  

  [source::.../sql.log]  

  SEDCMD--sqllog  =  s/(.*?)Command:EXECUTE[.\d\D\w\W]*/\1/g  

  

!  Discard  events:  
  props     [source::/var/log/user_conf.txt]     TRANSFORMS--null=  setnull  

transforms   [setnull]   REGEX        =   (?i)DEBUG   DEST_KEY  =    queue   FORMAT      =    nullQueue  

30  

Whitelist  or  Blacklist  Windows  Events  

!  This  will  selecFvely  include  or  exclude  events  from  collecFon  on  a  Windows   forwarder  
!  Available  feature  on  6.x  or  greater  Windows  forwarders  
!  All  controlled  through  inputs.conf  on  the  Windows  forwarders   !  Examples:  

[WinEventLog://Security]   whitelist  =  4,5,7,100--200   ...  

[WinEventLog://Security]   blacklist  =  EventCode=%^200$%  User=%duca%   ...  

For  more  Info:  hdp://docs.splunk.com/DocumentaFon/Splunk/latest/Data/MonitorWindowsdata#Create_advanced_filters_with_.27whitelist.27_and_.27blacklist.27   31  

Index  ExtracFons  

!  Provides  reliable  and  consistent  indexing  of  data  with  headers  

!  Address  issue  on  forwarder:  

  INDEX_EXTRACTIONS  =  {CSV  |  W3C  |  TSV  |  PSV  |  JSON}  

!  Supports  custom  header  parsing  and  easy  mode  for  common   formats  

!  Extract  IIS  fields  using  Props.conf  on  Windows  forwarder:  

  

  

  [iis]  

  

  INDEX_EXTRACTIONS  =  w3c  

32  

Modular  and  Scripted   Inputs  

Modular  Inputs  
Splunk  Enterprise  app  or  add--on  that  extends  the  Splunk  Enterprise  framework  to  define  a  custom  input  capability  
!  Returned  data  must  be  properly   structured  to  index  into  Splunk  
!  Features:  
­ ConfiguraFon  files  and  configuraFon  secngs  inside   Splunk  and  Splunk  Web  interfaces  
­ Can  also  be  configured  via  deployed  .conf  files  and   accessed  via  REST  API  
!  Examples:  
­ Checkpoint  OPSEC,  Twider,  Stream,  Amazon  S3  Online   storage  
!  For  more  info:  
­ hdp://docs.splunk.com/DocumentaFon/Splunk/latest/ AdvancedDev/ModInputsBasicExample  
34  

Scripted  Inputs  
!  A  scripted  input  is  used  to  get  data  from  applicaFon  program  interfaces  (APIs)  and   other  remote  data  interfaces  and  message  queues.  
  
!  Features  
­ Scripted  Inputs  are  deployed  specific  to  the  OS  deployed  on  where  Modular  Inputs  can   support  mulFple.  
­ Almost  any  program  that  can  output  text  can  be  used  to  index  data.  
  
!  Examples  
­ VMStat,  Top,  iostat  
  
!  For  more  info  
­ hdp://docs.splunk.com/DocumentaFon/Splunk/6.2.4/Data/Setupcustominputs  
35  

Scripted  Inputs  Example  
!  Shell  script  saved  in  /opt/splunk/bin/scripts/  OR  in  a  specific  App   !  Allows  you  to  execute  any  program  on  Splunk  Forwarder  and  index  
STDOUT  data.   !  UFlizing  Key  Value  Pairs  makes  for  easier  searching.  
Sample  output  from  custom  script  /Applica2ons/Splunk/bin/scripts/FantasyFootball.sh   36  

Scripted  Inputs  Example  
Shell  script  calls  local  system  binary  programs  and  can  provide  configuraFon  opFons.   Use  Inputs.conf  to  define  INDEX,  SOURCETYPE,  and  INTERVAL  for  the  scripted  input  
37  

Database  Data  

Splunk  DB  Connect  

!  Allows  for  indexing  data  directly   from  database  queries.  

  

!  Allows  for  adding  meta  data  to   events  from  Database  sources  using   lookups.  

   !  Example  use  cases:  
­ Symantec  Endpoint  ProtecFon  data   ­ Custom  CMDB  Databases     

Supported  DBs  
DB2,  Informix,  MemSQL,  MicrosoQ  SQL  Server  MySQL,   Oracle,  PostgreSQL,  SAP  SQL  Anywhere,  Sybase  ASE,   Sybase  IQ,  Teradata  

  

39  

DB  Connect  Best  PracFces  
!  Normalize  Fmestamps  naFvely  inside  the  SQL  Query      !  Filter  results  down  in  SQL  Query  to  reduce  garbage  in  
Splunk  Index      !  Repeated  DBLookups  should  be  converted  to  staFc  
lookup      !  Search  Head  Pooling  requires  encrypted  password  
replicaFon  
!  Search  Head  Clustering  Supported  
  
40  

Network  Data  

Splunk  App  For  Stream  
!  Provides  the  ability  to  capture  real--Fme  streaming  wire  data  from   anywhere  in  your  datacenter  or  from  any  public  Cloud   infrastructure.  
!  Supports  Local  collecFon  and  via  SPAN/TAP   !  Stream  Forwarder  runs  on  the  following  OS:  
­ Linux   ­ Windows   ­ Mac  OS  
42  

DB  Connect  Best  PracFces  
!  Normalize  Fmestamps  naFvely  inside  the  SQL  Query      !  Filter  results  down  in  SQL  Query  to  reduce  garbage  in  
Splunk  Index      !  Repeated  DBLookups  should  be  converted  to  staFc  
lookup      !  Search  Head  Pooling  requires  encrypted  password  
replicaFon  
!  Search  Head  Clustering  supported  
  
43  

Splunk  Stream  DNS  Capture  
· Full  DNS  Queries  without  logging  enabled  
44  

Resources  
!  Get  educated:  hdp://www.splunk.com/view/educaFon/SP--CAAAAH9   !  Download  Splunk  applicaFons:  hdp://apps.splunk.com/   !  Hire  Splunk  Professional  Services:  
hdp://www.splunk.com/view/professional--services/SP--CAAABH9   !  Watch  some  videos:  hdp://www.splunk.com/videos  
45  

THANK  YOU  

