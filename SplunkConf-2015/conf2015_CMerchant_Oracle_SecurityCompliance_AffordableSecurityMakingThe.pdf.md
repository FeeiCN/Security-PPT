Copyright  ©  2015  Splunk  Inc.  
AMaffkinog  rthde  maobstl  oef  f  rSeee  tcooulsr  anitdy  da:ta     
Craig  Merchant  
Senior  Security  Architect,  Oracle  

Disclaimer  
During  the  course  of  this  presentaFon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauFon  you  that  such  statements  reflect  our   current  expectaFons  and  esFmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaFon  are  being  made  as  of  the  Fme  and  date  of  its  live   presentaFon.  If  reviewed  aQer  its  live  presentaFon,  this  presentaFon  may  not  contain  current  or   accurate  informaFon.  We  do  not  assume  any  obligaFon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiFon,  any  informaFon  about  our  roadmap  outlines  our  general  product  direcFon  and  is  subject  to   change  at  any  Fme  without  noFce.  It  is  for  informaFonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaFon  either  to  develop  the  features  
or  funcFonality  described  or  to  include  any  such  feature  or  funcFonality  in  a  future  release.  
2  

AddiFonal  Disclaimer  
I  am  here  as  a  member  of  the  Splunk  community.   I  am  not  here  as  a  representaFve  of  Oracle  or  the  Oracle  Cloud.   Due  to  the  sensiFve  nature  of  some  of  our  customers,  I  am  only  authorized  to   disclose  a  limited  amount  of  specific  informaFon  about  our  environment.  
3  

Personal  IntroducFon  
 Craig  Merchant,  Senior  Security  Architect,  Oracle  Cloud    Over  20  years  of  experience  in  security,  networking,  and    
systems  management    Joined  Oracle  through  the  Responsys  acquisiFon  in  2014    Oracle  Cloud  was  announced  on  June  7,  2012  
­ Offerings  include  SaaS,  PaaS,  IaaS   ­ Growth  has  been  driven  by  over  a  dozen  acquisiFons  
 My  role:    To  Build  the  Be^er  Mouse  Trap  
4  

Agenda  
 AugmenFng  Nessus  vulnerability  data  with  vFeed  project    Dynamic  vulnerability  scanning  using  SNMP  and  ARP  tables    IntegraFng  the  CollecFve  Intelligence  Framework  into  Splunk    Running  SCAP  security  checklists  using  Splunk  and  jOVAL    Gain  total  visibility  into  network  flows  using  Argus  and  Sysdig    All  content  available  at:  
­ h^ps://github.com/SplunkSec/.conf2015  
  
5  

Vulnerability  Data   Enrichment  

The  Incomplete  Picture  
 Vulnerability  Management  is  the  foundaFon  of  a  mature  security   pracFce  
 A  successful  remediaFon  strategy  depends  on  knowing:  
­ Is  the  vulnerability  a  local  or  remote  exploit?   ­ Can  an  unauthenFcated  user  perform  the  exploit?   ­ How  easy  is  it  to  perform  the  exploit?   ­ Is  there  a  known  exploit  for  the  vulnerability  in  the  wild?   ­ Which  patches  or  updates  will  reduce  the  most  amount  of  risk?  
 The  data  contained  in  the  plugins  from  most  vulnerability  scanners   cannot  answer  all  of  those  quesFons  
7  

What  is  vFeed?  
 h^ps://github.com/toolswatch/vFeed  
 vFeed  integrates  a  wealth  of  vulnerability  data:  
­ CVE  ­  Common  VulnerabiliFes  and  Exposures   ­ CWE  ­  Common  Weakness  EnumeraFon   ­ CPE  ­  Common  Plaform  EnumeraFon   ­ OVAL  ­  Open  Vulnerability  and  Assessment  Language   ­ CAPEC  ­  Common  A^ack  Pa^ern  EnumeraFon  and  ClassificaFon   ­ CVSS  ­  Common  Vulnerability  Scoring  System   ­ MulFple  exploit  databases:    Exploit--DB,  Metasploit,  Saint...   ­ MulFple  vulnerability  databases:    OSVDB,  Bugtraq,  NVD   ­ Vendor  Security  Advisories:    MSFT,  Red  Hat,  Cisco...  
  
8  

Filling  in  the  Gaps  
 vFeed  provides  mappings  between  Nessus  and  CVE  IDs    Mapping  the  CVSS  metrics  to  CVE  IDs  answers:  
­ Is  the  vulnerability  a  local  or  remote  exploit?   ­ Can  an  unauthenFcated  user  perform  the  exploit?   ­ How  easy  is  it  to  perform  the  exploit?  
 Mapping  CVE  IDs  to  public  exploit  databases  answers:  
­ Is  there  a  known  exploit  for  the  vulnerability  in  the  wild?  
 Mapping  CVE  IDs  to  CPE  entries  answers:  
­ Which  patches  or  updates  will  reduce  the  most  amount  of  risk?  
  
9  

How  to  Build  It  
 Install  vFeed  and  create  a  cron  job  for  daily  updates    Connect  to  the  vFeed  SQLite  database  using  the  DB  Connect  1  app    Create  a  lookup  in  Splunk  for  each  table  in  vFeed    Dump  each  table,  saniFze  the  data,  and  augment  with  URL  info    Download  Common  InformaFon  Model  (CIM)  app  and  augment  the  
Vulnerability  data  model  with  vFeed  fields    Modify  the  CIM  Vulnerability  data  model  to  perform    
required  lookups    Populate  the  kvstore  with  vulnerability  data    Build  dashboards  driven  off  data  model  searches     
10  

Bonus  Value  
 vFeed  has  mappings  for  Snort  IDs  to  CVE  IDs    Create  a  search  that  will  find  IDS  events  and:  
­ Lookup  the  CVE  IDs  associated  with  each  Snort  ID   ­ Use  mvexpand  to  create  a  single  event  per  CVE  ID   ­ Lookup  the  CVE  ID  in  the  Snort  event  against  any  CVEs  for  the  dest/
dest_port/protocol  in  the  Vulnerability  kvstore  
 Alarm  on  a  match     
11  

Dynamic  Vulnerability   Scanning  

Scheduled  Scanning  is  Risky  
 Missed  assets  ­  Laptops  and  tablets  may  not  be  connected  to  the   corporate  network  during  the  scheduled  scanning  window  
 Fragile  infrastructure  ­  Running  large  scans  can  exhaust  resources   on  switches,  routers,  and  firewalls  
 Huge  address  spaces  ­  IPv6  networks  can  be  massive  and  virtually   impossible  to  scan  within  a  typical  scanning  window  
 Easy  evasion  ­  Predictable  scanning  windows  create  opportuniFes   for  a^ackers  to  hide  evidence  of  their  intrusion  
13  

Splunk  Powers  Dynamic  Scanning  
 Use  scripted  inputs  or  SNMP  apps  to  poll  network  switches  for  the   IP--to--MAC  address  relaFonships  
 Track  the  scanning  history  for  each  MAC  address  in  a  lookup  table    Use  that  history  to  launch  scans  via  the  Nessus  API    Index  the  status  of  each  scan  with  a  scripted  input    Generate  a  CSV  report  via  the  API  when  scans  complete  
14  

Map  IPs  to  Physical  Address  
 For  IPv4,  SNMP  atPhysAddress  (.1.3.6.1.2.1.3.1.1.2)  to  enumerate   the  ARP  cache:  
­ snmpwalk  ­c  public  ­v  2c  10.10.10.10  atPhysAddress    
mib--2.3.1.1.2.76.1.192.168.1.93  "3C  38  A6  D9  AA  4C  "   mib--2.3.1.1.2.76.1.192.168.1.95  "A8  9D  21  DA  86  B3  "  
 For  both,  SNMP  ipNetToPhysicalPhysAddress  (.1.3.6.1.2.1.4.35.1.4):  
­ snmpwalk  ­c  public  ­v  2c  10.10.10.10  ipNetToPhysicalTable    
ê IP--MIB::ipNetToPhysicalPhysAddress.2.ipv4."10.0.0.1"  =  STRING:  0:26:5a:f4:1a:28     ê IP--MIB::ipNetToPhysicalPhysAddress.2.ipv6."fe:80:00:00:00:00:00:00:ca:60:00:ff:fe:e9:1a:e9"  =  
STRING:  c8:60:0:e9:1a:e9  
15  

Build  Scripted  SNMP  Input  
 Create  a  search  that  will  find  all  network  switches,  dedup  the   hostname  or  IP,  and  write  the  hostnames/IPs  to  a  lookup  table  
 Create  a  simple  "for"  loop  in  a  bash  script:  
for  switch  in  `cat  ../lookups/switches.csv  |  sed  "1d"`   do       echo  "Switch:    $switch       snmpwalk  ­c  public  ­v  2c  $switch  ipNetToPhysicalPhysAddress     done  
 Schedule  the  scripted  input  to  run  every  5  minutes     
16  

Interact  with  Nessus  6  API  
 Login  and  save  authenFcaFon  token:  
­ curl  --k  --X  POST  --H  'Content--Type:  applicaFon/json'  --d  '{"username":"nessus","password":"ne55us"}'  h^ps:// 10.10.10.10:8834/session  2>&1  |  grep  --Po  '(?<=\"token\":\")[^\"]+'  
 List  the  configured  scans  on  the  scanner:  
   ­ curl  --k  --H  'X--Cookie:  token=f99a30c7d590f07880f27aa913ee705955bcaa7b7d51e041'  h^ps://10.10.10.10:8834/scans
 Launch  a  scan  with  a  list  of  dynamic  IPs:  
­ curl  --k  --X  POST  --H  'X--Cookie:  token=f8f0b0821d0ef193d346a2951dbc9e28314bcf232d40e4e7'  --H  'Content--Type:   applicaFon/json'  --d  '{"alt_targets":  ["10.10.10.1,10.10.10.2,10.10.10.3,10.10.10.4"]}'  h^ps://10.10.10.10:8834/scans/6/ launch  
 Export  a  scan  to  CSV  format:  
­ curl  --k  --X  POST  --H  'X--Cookie:  token=f8f0b0821d0ef193d346a2951dbc9e28314bcf232d40e4e7'  --H  'Content--Type:   applicaFon/json'  --d  '{"format":  "csv"}  '  h^ps://10.10.10.10:8834/scans/6/export  
e  the  scripted  input  to  run  every  5  minutes  
  
17  

How  to  Build  It  

 On  each  scanner,  define  the  necessary  policies  and  scan  configs  

 Use  the  Nessus  API  to  find  the  ID  of  configured  scans  

 Create  a  CIDR  match  lookup  table  to  assign  Nessus  IPs  and  scan  IDs  
to  hosts  or  subnets:  
dest,  nessus_ip,  scan_id   "10.10.10.0/24","10.10.10.10",6   "10.10.11.0/24","10.10.10.10",5  

 Create  a  lookup  to  track  the  last  scan  Fme  for  a  MAC  address  and  
seed  it  with  data  that  adds  random  padding  to  the  last_scan  Fme:  
(sourcetype="nessus"  AND  signature="12053"  OR  signature="19506")  OR  sourcetype=snmp_arp  |  rex  field=_raw  "(? i)resolves  as  (?P<hostname>[^$]+)(?=\.)"  |  rex  mode=sed  field=dest_mac  "s/\s/:/g"|  transacFon  maxspan=1h  dest  |  eval   padding=random()/2147483648*86400  |  eval  last_scan=now()+padding  |  table  last_scan,hostname,dest,dest_mac  |   outputlookup  nessus_last_scan_lookup  

  

18  

How  to  Build  It  
 Create  a  lookup  table  to  queue  IPs  that  need  to  be  scanned    Create  a  search  that  will  check  incoming  ARP  events  against  the  last    
scan  lookup,  lookup  the  scanner  IP  and  scan  ID,  and  save  those  events  to   the  queue  
 Create  a  scripted  input  to  iterate  through  the  Nessus  scanners,  list  the   status  of  scan  jobs  and  index  the  results  
 Create  a  lookup  table  to  track  completed  scan  jobs  and  export  status    Create  a  script  that  can  iterate  through  the  scan  job  lookup  table  and  use  
the  Nessus  API  to  export  the  scan  in  CSV  format  
 Create  a  file  monitor  input  on  the  Nessus  scanner  that  will  index  all  CSV   files  found  in  each  user's  "files"  directory  
  
19  

IntegraFng  Threat   Intelligence  

Why  Threat  Intel?  
 Today's  a^ackers  are  incredibly  sophisFcated  and  agile    Threat  Intel  providers  take  the  offensive  against  hackers    Data  is  updated  more  frequently  than  tradiFonal  AV  vendors    Indicators  of  Compromise  (IOCs)  can  be  found  in  a  wide  range  of  
security  data  types  
  
21  

What  is  CIF?  
 h^ps://code.google.com/p/collecFve--intelligence--framework/    
 CIF  collects,  normalizes,  qualifies,  and  categorizes  free  and   commercial  threat  intelligence  feeds  
 Supported  data  types:  
­ File  Hashes  (MD5s)   ­ IPv4  Addresses   ­ Host  Names   ­ Domain  Names   ­ URLs  (MD5s)  
 v1  stores  each  category  of  threat  in  a  separate  Postgres     database  table  
  
22  

What  Data  can  it  Enrich?  
 Network  Intrusion  DetecFon  events  (IPv4,  Host/Domain  names)    Network  Flow  events  (IPv4,  Host/Domain  Names,  URL)    Proxy  Logs  (IPv4  Host/Domain  names,  URL)    Firewall  Logs  (IPv4,  URL)    Endpoint  ProtecFon  SoluFons  (File  Hash,  IPv4,  Host/Domain  names)    AnF--Malware  soluFons  (File  Hash,  IPv4,  Host/Domain  names,  URL)  
  
23  

How  to  Build  It  

 Install  CIF  v1  and  configure  threat  intel  feeds  

 Connect  to  the  Postgres  database  using  DB  Connect  App  

 Create  Splunk  lookup  tables  for  each  classificaFon  type  ­  botnet,   phishing,  spam,  etc.  

 Create  searches  to  periodically  dump  the  database  tables  into     lookup  tables  

 Create  automaFc  lookups  to  enhance  log  data  

 OpFonal:    Add  a  menu  context  item  to  check  fields  against  the  HTTP   API:    h^p://eyeis.net/2012/04/querying--cif--data--from--splunk/  

  

  

24  

Automated  Security   ConfiguraFon  
Monitoring  with  SCAP  

Value  and  Challenges  
 Security  configuraFon  monitoring  can  measure  the  compliance     of  systems  and  applicaFons  against  a  set  of  enterprise  security   standards  
 The  human  "checklist"  approach  is  slow,  expensive,  and  prone     to  error  
 CreaFng  customized  scripts  to  perform  configuraFon  checks  is   expensive  to  develop  and  maintain  and  difficult  to  instrument  and   report  on  
  
26  

What  is  SCAP?  
 SCAP:    Security  Content  AutomaFon  Protocol  
­ XCCDF:    Extensible  ConfiguraFon  Checklist  DefiniFon  Format   ­ OVAL:    Open  Vulnerability  and  Assessment  Language  
 Public  repositories  of  SCAP  content:  
­ h^ps://web.nvd.nist.gov/view/ncp/repository   ­ h^p://usgcb.nist.gov/   ­ h^p://iase.disa.mil/sFgs/scap/Pages/index.aspx   ­ h^ps://benchmarks.cisecurity.org/downloads/  
 SCAP  scanners:  
­ Free:    h^p://www.open--scap.org/   ­ Commercial:    h^p://jovalcm.com/  
27  

What  Does  the  Data  Look  Like?  
 XCCDF  scan  using  OpenSCAP:  
Title      Uninstall  squid  Package   Rule        uninstall_squid   Ident      CCE--26977--9   Result    pass        Title      Disable  snmpd  Service   Rule        disable_snmpd   Ident      CCE--26906--8   Result    pass  
 OVAL  scan  using  OpenSCAP:  
DefiniFon  oval:ssg:def:959:  false   DefiniFon  oval:ssg:def:957:  true   DefiniFon  oval:ssg:def:955:  true  
  
   28  

How  to  Build  It  

 jOVAL  ­  Install  on  central  scanning  host  

OpenSCAP  ­  yum  install  openscap  openscap--uFls  openscap--content  

 Index  the  XCCDF  or  OVAL  XML  files    

 Extract  important  fields  from  the  rule  objects  ­  id,  Ftle,  descripFon,   severity,  weight,  and  fixtext  

 Create  a  lookup  table  or  kvstore  containing  the  policy  name  and  the   rule  objects  above  

 Create  automaFc  lookup  to  enrich  scanner  logs  with  rule  data  

 Create  an  app  for  the  policy  files  and  scripted  inputs  
!!!    You  must  change  the  file  extension  from  XML  or  you  will  break  Splunk  !!!  

  

  

29  

Improving  Visibility   With  Network  Flows  

Geng  Flow  Security  Right  is  Hard  
 What  collecFon  method  to  use  ­  Neflow  protocols  or     taps/SPAN  ports?  
 Where  to  collect  the  data  ­  Internet  connecFons,  internal  switches,   or  individual  hosts?  
 What  flow  metrics  need  to  be  collected  for  security  or  ops?    What  flow  aggregaFon  and  filtering  method  to  use?    What  events  are  worth  sending  to  Splunk?    How  can  flows  be  used  to  complement  other  security  data?  
31  

What  is  Argus?  
 h^p://qosient.com/argus/    Free,  open  source  tool  capable  of  generaFng  flow  records  from  both  
flow  protocols  (Neflow,  IPFIX)  and  raw  network  streams    Capable  of  capturing  all,  some,  or  none  of  the  packet  payload    Supports  a  rich  set  of  flow  metrics    Allows  tagging  of  flows  based  on  CIDR  match    Key  architecture  components:  
­ argusd:    Argus  flow  collector  daemon   ­ radium:    Collects  and  dedups  flows  from  mulFple  Argus  daemons   ­ Argus  clients:    Individual  client  applicaFons  to  search  and  manage  Argus  
data  
32  

What  Can  Argus  Do?  
 ralabel:    Uses  CIDR  network  and  host  matches  to  apply  labels  to   flows  
 radark:    Looks  for  high  numbers  of  ICMP  unreachable  messages  to   detect  scanning  behavior  
 rapolicy:    Monitors  network  traffic  for  violaFons  of  Cisco  ACL  rules    Using  advanced  ji^er  analysis,  Argus  can  detect  keystrokes  in  
encrypted  tunnels  ­  excellent  for  detecFng  back  doors    Regex  pa^ern  matching  on  payload  can  idenFfy  SSH  on  unusual  
ports  
33  

How  to  Build  It  
 Compile  argusd  for  collecFon  servers    Compile  argus--clients    Convert  Splunk  IPv4  threat  intel  lookup  table  to  Argus  label    
file  format    Configure  Argus  client  searches    Create  Splunk  searches  to  index  output  of  Argus  clients    Advanced:    Use  radium  to  save  X  minutes/hours/days  of  all  flow  
records  and  selecFvely  index  the  data  in  Splunk  

  

34  

But  Wait...  Who  Dunnit?  
 Argus  has  no  user  or  process  a^ribuFon  capabiliFes  ­  all  its  sees  is   the  network  
 Enter  Sysdig  ­  "Think  of  sysdig  as  strace  +  tcpdump  +  htop  +  iQop  +   lsof  +  awesome  sauce"  
­ h^p://www.sysdig.org  
 Sysdig  is  a  Linux  kernel  module  that  can  gather  data  about:  
­ User  acFvity  such  as  shell  commands  and  network  connecFons   ­ Process  acFvity   ­ System  performance  ­  I/O,  CPU,  network,  and  memory   ­ Limited  Windows/OS  X  support  
35  

How  to  Build  It  
 Compile  and  install  sysdig    Create  a  scripted  input  to  capture  user,  UID,  PID,  PPID,  process  
names  and  arguments,  and  IP/port/protocol  data  for  each     network  connecFon:  
­ sysdig  evt.type=connect  and  fd.lip!=127.0.0.1  ­p"%evt.rawFme.s,%evt.type,%fd.cip,%fd.cport,%fd.sip,%fd.sport, %fd.l4proto,%proc.name,%proc.args,%proc.pid,%proc.ppid,%proc.pname,%user.uid,%user.name"Create    
 Create  searches  for  flow/IDS/firewall  and  sysdig  events  and  bind   them  together  with  the  "transacFon"  command  
 Build  alarms  and  reports  that  take  advantage  of  the     a^ribuFon  metadata  
36  

Final  Thoughts  

Making  the  Most  of  Free  
 All  of  the  ideas  presented  require  basic  Splunking  skill  ­  lookups,   transacFons,  data  models,  and  database  connecFons  
 The  vFeed  and  CIF  projects  provide  excellent  metadata   enhancement  capabiliFes  without  consuming  your  Splunk  license  
 Dynamic  vulnerability  scanning  and  SCAP  scanning  can  dramaFcally   improve  vulnerability  management  with  a  trivial  license  cost  
 Argus  offers  a  number  of  security  client  tools  that  offer  great   visibility  with  minimal  license  consumpFon  
 Sysdig  allows  security  to  link  network  events  with  the  users  and   programs  responsible  for  them  
38  

Future  InvesFgaFons  
 Project  ArFllery:  
­ h^ps://www.trustedsec.com/arFllery/     ­ A  python--based  low--interacFon  honeypot  that  can  be  deployed  and  
managed  with  Splunk  
 Google  Rapid  Response  (GRR)  
­ h^ps://github.com/google/grr     ­ A  comprehensive  incident  response  framework  that  could  be  automated  
using  data  stored  in  Splunk,  such  as  Notable  Events  in  the  Enterprise   Security  app  
  
39  

Get  It  at  Github  
 h^ps://github.com/SplunkSec/.conf2015     
40  

QuesFons?  
41  

THANK  YOU  

