Copyright  ©  2015  Splunk  Inc.  
Simplified  Forwarder   Deployment  and   Deployment  Server   Techniques  
Cary  Pe;erborg  
Sr.  Monitoring  Eng.,  LDS  Church  

Disclaimer  
During  the  course  of  this  presentaLon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauLon  you  that  such  statements  reflect  our   current  expectaLons  and  esLmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaLon  are  being  made  as  of  the  Lme  and  date  of  its  live   presentaLon.  If  reviewed  aRer  its  live  presentaLon,  this  presentaLon  may  not  contain  current  or   accurate  informaLon.  We  do  not  assume  any  obligaLon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiLon,  any  informaLon  about  our  roadmap  outlines  our  general  product  direcLon  and  is  subject  to   change  at  any  Lme  without  noLce.  It  is  for  informaLonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaLon  either  to  develop  the  features  
or  funcLonality  described  or  to  include  any  such  feature  or  funcLonality  in  a  future  release.  
2  

My  Disclaimer  
During  the  course  of  this  presentaLon,  I  may  make  references  to  my  employer,  the  Church  of  Jesus   Christ  of  La;er--day  Saints.  This  should  not  be  taken  as  an  endorsement  of  Splunk  or  Splunk  products  by  
the  LDS  Church.     
In  addiLon,  soRware  referenced  in  this  presentaLon  may  be  made  available  for  download.  This  soRware   may  not  be  suitable  for  your  environment.  No  warranty  or  claim  of  suitability  is  made  on  this  soRware,   and  any  damages  incurred  are  not  my  responsibility  (you  take  full  responsibility  for  any  damages).  Care  
should  be  taken  when  installing  any  soRware.    
3  

Scope  and  Audience  

Scope  
 Simplified  universal  forwarder  (UF)  installaLon    By  anyone  with  root/admin  access    No  need  to  edit  files    Finds  "standard  inputs"  automaLcally    InstallaLon  conforms  to  a  known  standard  
5  

When  is  this  method  useful?  
Including,  but  not  limited  to,  the  following  criteria:    Many  indexes  (e.g.  departmental  indexes)    Ad  hoc  deployment  (non--ubiquitous  forwarders  or  slow  migraLon)    Allow  non--admin  installaLon  of  UF    MulLple  data  centers  or  offices    Secure  facility  installaLons  of  UF    Add  a  UF  to  search  heads  and  indexers  to  monitor  local  data     
6  

Audience:  Who  should  be  here?  
 Splunk  administrators    Infrastructure  operaLons  personnel    Splunk  personnel  in  charge  of  new  Splunk  features.  J  
7  

About  Me  

Who  is  Cary  Pe;erborg?  
 Splunk  user  and  administrator  for  3.5  years    Monitoring  Engineer  for  8  years    Web  developer  for  21  years    SoRware  engineer  for  35  years    Many  languages  from  assembly  to  Ruby    Works  for  the  LDS  Church  in  Salt  Lake  City  
9  

My  Employer  

The  Church  of  Jesus  Christ  of  La;er--day  Saints  
 Based  in  Salt  Lake  City,  Utah    Established  1830    16  million  members  worldwide    9,000  servers  (Family  Search  ­  addiLonal  12,000  servers)    2,300  UFs,  8  indexers,  6  search  heads,  deployment  server,  2  syslog  
servers  
11  

Requirements  &   AssumpLons  

Requirements  
 Root  access  for  Linux  and  AIX  (bash)    Administrator  access  for  Windows  (PowerShell)    Web  server  for  remote  file  access    Splunk  deployment  server    Firewalls  configured  properly     
13  

Remote  User   Deployment  Server  

Architecture  
Web/CMDB   Linux/Windows/AIX  host  
Network  Storage   14  

Remote  User   Deployment  Server  

Architecture  
Web/CMDB   Linux/Windows/AIX  host  
Network  Storage   15  

Remote  User   Deployment  Server  

Architecture  
Web/CMDB   Linux/Windows/AIX  host  
Network  Storage   16  

Remote  User   Deployment  Server  

Architecture  
Web/CMDB   Linux/Windows/AIX  host  
Network  Storage   17  

Remote  User   Deployment  Server  

Architecture  
Web/CMDB   Linux/Windows/AIX  host  
Network  Storage   18  

Remote  User   Deployment  Server  

Architecture  
Web/CMDB   Linux/Windows/AIX  host  
Network  Storage   19  

OpLonal  Tools  
 Recommended:  Universal  mount  point  for  Linux  and  AIX  (i.e.,  NFS   mount)  
 CMDB   wget  for  Linux  and  AIX  
 Access  to  web  service  to  validate  ConfiguraLon  Items  (CI)  
20  

About  the  Scripts  

Script  FuncLonality  
1. Checks  for  new  installaLon  or  update   2. Verifies  host  as  valid  CI  in  CMDB   3. Sets  the  default  index   4. Auto--discovers  applicaLons   5. Installs  UF  from  .tar  or  .msi  file   6. Creates  the  deployment  server  configuraLon   7. Restarts  UF  
22  

Make  Your   Deployment  Server  
Do  the  Work  

Set  Up  the  Deployment  Server  
clientName  from  deploymentclient.conf  file  determines:  
­ Default  index   ­ ApplicaLon  inputs   ­ Hostname  
 Use  a  standardized  deployment  configuraLon  file  instead  of  using   the  Splunk  installaLon  archive  (tar,  .msi,  etc.)  to  set  the  deployment   server  ­  InteracLve:  Windows  will  complain  that  you  are  not   providing  inputs  and  outputs,  but  this  is  really  fine.  
  
24  

Result  of  install  to  deploymentclient.conf  
etc/system/local/deploymentclient.conf:      [deployment-client] clientName=prod_cs_apache_lnx12345    Key:   ProducLon--splunk  _  index  _  applicaLon1  _  applicaLonZ  _  hostname  
25  

Example  serverclass.conf  
...   #  apache [serverClass:forwarders_apache] whitelist.0 = *_apache_* [serverClass:forwarders_apache:app:test_apache] appFile=empty_app [serverClass:forwarders_apache:app:all_apache_inputs] ...
26  

Example  Apache  inputs  configuraLon  
 Set  up  a  normal  deployment  app  (all_apache_inputs/local/ inputs.conf)  for  apache,  like:  
# these are the apache log files to monitor: [monitor:///var/log/httpd/*access*log] sourcetype=apache [monitor:///var/log/httpd/*error*log] sourcetype=apache_error ...
27  

Example  serverclass.conf  
... # indexZ default index [serverClass:Z_forwarders] restartSplunkd=true whitelist.0=*_indexZ_* [serverClass:Z_forwarders:app:indexZ_default_inputs] ...
28  

Example  default  index  definiLon  
etc/deployment--apps/indexZ_default_inputs/local/inputs.conf:   # default indexZ [default] index=indexZ
29  

Standardized   Deployment  
ConfiguraLon  

Deployment  Zip  or  Tar  file  contents  
splunkforwarder/   splunkforwarder/etc/   splunkforwarder/etc/apps/   splunkforwarder/etc/apps/all_deploymentclient/   splunkforwarder/etc/apps/all_deploymentclient/local/   splunkforwarder/etc/apps/all_deploymentclient/local/app.conf   splunkforwarder/etc/apps/all_deploymentclient/local/deploymentclient.conf   splunkforwarder/etc/apps/all_deploymentclient/metadata/   splunkforwarder/etc/apps/all_deploymentclient/metadata/local.meta  
31  

etc/apps/all_deploymentclient/local/deploymentclient.conf  
# example deployment config (set your host and port)  [deployment-client] phoneHomeIntervalInSecs = 300  [target-broker:deploymentServer] targetUri= splunk-deploy.YOUR.ORG:9089
32  

Deploying  This  ConfiguraLon  
 Distribute  the  archive  file  to  the  installing  host  (part  of  the  script)   Untar  or  unzip  the  archive  into  the  etc/apps  directory  
 On  startup  of  Splunk  this  file  is  read  in,  then  the  deployment  server   is  contacted  for  the  rest  of  the  configuraLon  files,  including  the   outputs.conf,  etc.  
 The  deployment  server  can  be  idenLfied  by  DNS  or  IP  address,  just   make  sure  it  is  reachable  in  the  same  way  by  all  hosts  
  
33  

IntegraLng  with   CMDB  

What  Is  Involved?  
 Required:  CMDB  API  or  Database  with  ConfiguraLon  Items    Custom  web  page  that  calls  API  or  Database  query    Can  be  very  simple  (see  the  example)    On  Linux/AIX  it  can  be  accessed  with  wget    On  Windows  ­  not  currently  supported  in  script  ­  looking  for  opLons  
35  

Example  script:  cmdb.php?host=hostname  
<?PHP $hostname = $_GET['host']; $cmd = sprintf("echo \"select count(*) from cmdb_itsm_config_item where ci_name = '%s'\" | mysql ­h cmdb-host -u user -ppassword cmdb", $hostname); exec ($cmd,$output); echo $output[1]; ?>
36  

Upgrading  Via  the   InstallaLon  Scripts  

UpdaLng  configuraLons  
An  upgrade  to  using  this  method  can  be  performed  using  this  same   script.  
Symlink  the  installaLon  script  on  Linux/AIX  and  it  will  do  an  update:   ln ­s forwarderInstall6.sh forwarderUpdate6.sh  Will  not  install  a  new  forwarder,  just  update  the  configuraLon    Useful  when  the  forwarder  is  already  installed,  but  you  want  to  get  
the  configuraLon  set  up  the  same  way.  
    
38  

Helpful  suggesLons  

SuggesLons,  Part  1    
If  you  want  to  make  the  fewest  changes  to  the  scripts:    Make  applicaLons  with  dashes  in  names  ­  NOT  underscores  
  my--app  instead  of  my_app    Don't  use  underscores  in  hostnames  or  index  names    
  fin--legal  instead  of  fin_legal  
powershell -ExecutionPolicy ByPass -File splunkinstall.ps1  
40  

SuggesLons,  Part  2  
· Set  up  firewall  rules  so  that  you  can  include  all  hosts  accesses  as   widely  as  possible  
· Firewall  ports:  
· To  deployment  server  (ours  is  9089)   · To  indexers  (default:  9997)   · To  web  server  for  files  access  (ours  is  80)  
41  

Watch  the  install  

The  Linux  InstallaLon  in  AcLon!  
43  

Example  Install  Files  

Where  Are  the  Files  and  What  Next?  
h;ps://app.box.com/splunkufinstallscripts    The  script  files  are  going  to  be  uploaded  soon,  with  updates  
following    A  personal  email:  splunkinstaller@pe;erb.org  
45  

QuesLons?  

THANK  YOU  

