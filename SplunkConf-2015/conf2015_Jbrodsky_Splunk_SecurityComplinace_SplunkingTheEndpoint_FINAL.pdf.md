Copyright  ©  2015  Splunk  Inc.  
Splunking  the  Endpoint  
James  Brodsky  
Staff  Engineer/Security  SME,  Splunk   brodsky@splunk.com  

Disclaimer  
During  the  course  of  this  presentaHon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauHon  you  that  such  statements  reflect  our   current  expectaHons  and  esHmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaHon  are  being  made  as  of  the  Hme  and  date  of  its  live   presentaHon.  If  reviewed  aRer  its  live  presentaHon,  this  presentaHon  may  not  contain  current  or   accurate  informaHon.  We  do  not  assume  any  obligaHon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiHon,  any  informaHon  about  our  roadmap  outlines  our  general  product  direcHon  and  is  subject  to   change  at  any  Hme  without  noHce.  It  is  for  informaHonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaHon  either  to  develop  the  features  
or  funcHonality  described  or  to  include  any  such  feature  or  funcHonality  in  a  future  release.  
2  

About  Me  
2  Years+  
3  

About  Me  
 And,  I  like   infecHng   Windows   Embedded   POSReady   systems  running   Splunk  with  RAM   Scrapers  for  fun   and  profit!    
  
4  

Demo,  Part  I  

Do  you  know  this  man?  
6  

Ghosts  of  Sessions  Past  

"Finding  Advanced  A^acks  &  Malware  with  6  Windows  EventIDs  you   Configure  and  Monitor"  ­  Michael  Gough,  Malware  Archaeology  

  

"HunHng  known  unknowns  with  DNS"  ­  Kovar  &  Brant,  Splunk  

  

"Verifying  Success  of  Key  MiHgaHons"  ­  Jim  Ronayne,  NSA  

  

"Security  Ninjutsu  Part  II"  ­  David  Veuve,  Splunk  

    

Check  these  

out!  

7  

Session  Goals  
 Understand  why  you  should  Splunk   the  endpoint  
 Believe  that  the  Universal  Forwarder   is  awesome  
 Learn  about  customer  success    Get  some  arHfacts  you  can  use    Bring  home  what  you  can  do  today     
h>ps://splunk.box.com/splunking--the--endpoint  
8  

WHY?  
1. It  is  rela%vely  inexpensive  to  Splunk   your  endpoints,  and  it  will  improve   your  security  posture.  
2. VISIBILITY!  You  will  have  more   complete  informa%on  in  the  case  of   breach.  
3. The  informaHon  from  your   endpoints  maps  well  to  the  CSC  20   and  other  security  guidance.  
  
9  

You  may  have  heard...  

Endpoint/Server  VulnerabiliRes  
10  

Endpoint--Based  Malware  

CoSuol  tdhe  wsee  h a bpepe  mneodr  ien   2 s0e1c4u/2r0e1  i5f...  w   e  

....the  endpoints?  

Endpoint/Server  VulnerabiliRes  

Endpoint--Based  Malware  

11  

ExecuRve  Summary:  
YES!   (so  do  that)  
12  

THANK  YOU  

The  Endpoint  is  important!  

Closest  to  humans   Underprotected  

VersaHle   Data--rich  

14  

The  Endpoint  is  important!  

Closest  to  humans   Underprotected  

70%   of  successful  breaches   start  on  the  endpoint*  

VersaHle   Data--rich  

*IDC  study  2014  
15  

The  UTnheiv  UeF:r  Its'sa  ml o Freo  trhwana  yorud  tehirnk  a   llows   you  to  
Logs  
....your  endpoints.  
16  

The  UF:  It's  more  than  you  think  
Logs  
17  

The  UF:  It's  more  than  you  think  

Process/Apps/FIM  

Perfmon  

Registry  

Wire  Data  

Scripts  

Logs  

Sysmon  

18  

Splunk  Universal  Forwarder  for  ETD*!  
· "Free"   · Lightweight   · Secure   · Runs  on  many  versions  of  
Windows  &  *NIX  &  OSX   · Flexible   · Centrally  configurable   · SCALE!  
*Endpoint  Threat  DetecHon  (Response?)  
19  

What  about  the  "Response"?  
VISIBILITY  
reacHvity  
(for  now)   
20  

What  about  the  "Response"?  
There's  stuff  out   there.  YMMV.  
21  

ComeS  oplunn.k   I Fsor  awanrdyeor  fnore  E T uDs*i!n   g  the  
· "Free"  
·U nLigihvtweeigrhts   al  Forwarder  in  this  way?  
· Secure   · Runs  on  many  versions  of  
Windows  &  *NIX  &  OSX  
YES.   · Flexible  
· Centrally  configurable   · SCALE!  
*Endpoint  Threat  DetecHon  (Response?)  
22  

ds   config  
install  
search  

Use  Case  1:  Large  Internet  Company   !  
· Windows  event  logs   · OSX  /var/log/*   · Carbon  Black  output   · Crash  logs  for  IT  Ops   · Custom  script  for  apps  
installed   · UNIX  TA  (upon  request)   · Windows  TA  (upon  request)   · AddiHonal  granularity  for  
execs  and  their  admins   · Moving  to  Splunk  Cloud  

...x  (Many   indexers)  

Int.  forwarders  

UF   x10,000!  

on  prem  

dmz  

internet  
23  

Central  Control  with  Deployment  Server  
One  (Linux)   DS  =  10,000   endpoints!  
24  

AddiRonal  ways  to  gather  endpoint  data  

Proxy  Logs  

NG  Endpoint   ProtecHon  

Integrity   Management  

WhitelisHng  
25  

Look  for  apps   on  
splunkbase!  

Obligatory   DBIR  slide...  

Malware:  involved   with  top  3  a>ack   pa>erns  in  DBIR  
2015  
26  

Back  to  these  breaches...  

Registry  Entries   System  Event  Logs  
New  Files   Security  Event  Logs  
New  Services   Comms/Running  Proc   Known  Vulns/Apps  
27  

Endpoint--Based  Malware  

Common  malware  leaves  quite  a  trail...  

Registry  Entries  

System  Event  Logs  

Security  Event  Logs  

New  Files  

Known  Vulns/Apps  

New  Services  

Comms/Running  Proc  
28  

We  configure  the  forwarder  to  give  us  data  of  interest  

Registry  Entries  
WinRegMon  

System  Event  Logs  
WinEventLog:  System  

Security  Event  Logs  
WinEventLog:  Security  

Windows  Update  
Monitor:  WindowsUpdate.log  
New  Services  
WinEventLog:  System   and  WinHostMon  

New  Files  
WinEventLog:  Security  +   AudiHng   Scripted  Inputs  

Known  Vulns/Apps  
Scripted  Inputs  or   WinHostMon  

ConfiguraHon   examples?  See   demo  &  appendix  
29  

Comms/Running  Proc  
TA--MicrosoR--Sysmon   Stream,  WinHostMon  

What  could  we  look  for?  
 ANY  new  Windows  services    Registry  being  wri^en  to  where  it  should  not    Users  that  shouldn't  be  used    Unusual/unapproved  processes  being  launched  and  their  connecHons/hashes    Unusual/unapproved  ports/connecHons  in  use    Unapproved  USB  devices  being  inserted    New  files  in  places  they  should  not  be  (Windows\System32...)    Files  that  look  like  one  thing  but  are  really  another    New  drive  le^ers  being  mapped    Lack  of  recent  Windows  updates    Versions  of  soRware  known  to  be  vulnerable    ...and  more  
   INSTANT,  GRANULAR  DATA  ABOUT  COMMON  BEHAVIOR  OF  WINDOWS  MALWARE!  
30  

Reconnaissance  

Delivery  

InstallaHon  

AcHons  on  ObjecHves  

WeaponizaHon  
Obligatory  Kill   Chain  slide...  

ExploitaHon  

Command  &  Control  (C2)  

Threat  intelligence  
Network     AcRvity/Security  
Endpoint   AcRvity/Security  
Auth  --  User  Roles  

115.29.46.99/   32,zeus_c2s   61.155.30.0/24,cymru_h^p  

Subject:  new  commission  report  breakdown   From:  Jose  Dave  <jose.dave@butercupgames.com>   To:  <chris.gilbert@bu^ercupgames.com>      Content--type:  mulHpart/mixed;   Content--type:  applicaHon/pdf;  name="Q2_commission.pdf"     

EventCode=7045  
A  service  was  installed  in   the  system  

{"acHon":  "create"",       "path":  "...\Content.Outlook\Q2_commission.pdf"   ,   "process_guid":  "--7751687"}    

{"domain":  "115.29.46.99"   ,     "protocol":  6,     "ipv4":  "115.29.46.99",     "process_guid":  "3259531",       "port":  443}  

dest_ip  cmdb_bu_owner  cmdb_applicaHon_name  cmdb_system_owner  cmdb_app_lifecycle  cmdb_s_ox  cmdb_GLBA  cmdb_app_uses_ssn   cmdb_credit_card_data  cmdb_priority  cmdb_server_soRware  cmdb_supported_by  cmdb_server_phase  cmdb_db_server  cmdb_db_name   cmdb_PCI  cmdb_PII  cmdb_safe_harbor  192.168.56.102  Sales  Laptop  chris.gilbert@bu^ercupgames.com  ProducHon  No  No  No  No  Tier  3   Windows7  Internal  Deployed  N  N/A  No    No    No  172.20.12.224  MarkeHng  Laptop  monte@demo.com  ProducHon  No  No  No  No  Tier  3   Windows7  Internal  Deployed  N  N/A  No    No    No  172.20.10.217  eCommerce  Laptop  modesto@demo.com  Staging  Yes  Yes  No  Yes  Tier  1   Windows7  Internal  Deployed  Y  Oracle  Yes  Yes  Yes  172.20.15.229  eCommerce  Laptop  modesto@demo.com  Staging  Yes  Yes  No  Yes  Tier  1   Windows7  Internal  Deployed  Y  Oracle  Yes  Yes  Yes    

Reconnaissance  

Delivery  

InstallaHon  

AcHons  on  ObjecHves  

WeaponizaHon  
Obligatory  Kill   Chain  slide...  

ExploitaHon  

Command  &  Control  (C2)  

Threat  intelligence  
Network     AcRvity/Security  
Endpoint   AcRvity/Security  
Auth  --  User  Roles  

115.29.46.99/   32,zeus_c2s   61.155.30.0/24,cymru_h^p  

Subject:  new  commission  report  breakdown   From:  Jose  Dave  <jose.dave@butercupgames.com>   To:  <chris.gilbert@bu^ercupgames.com>     
CCooWnntteeinnntt--d--ttyyoppeew::    maspup  EllHicvpaaeHrotn/nmt/psixde  fd; ; n  ame="Q2_commissioSn.ypdsfm"      on/CB/etc  

EventCode=7045  
A  service  was  installed  in   the  system  

{"acHon":  "create"",       "path":  "...\Content.Outlook\Q2_commission.pdf"   ,   "process_guid":  "--7751687"}    

Sysmon/Stream/Proxy  
{"domain":  "115.29.46.99"   ,     "protocol":  6,     "ipv4":  "115.29.46.99",     "process_guid":  "3259531",       "port":  443}  

dest_ip  cmdb_bu_owner  cmdb_applicaHon_name  cmdb_system_owner  cmdb_app_lifecycle  cmdb_s_ox  cmdb_GLBA  cmdb_app_uses_ssn   cmdb_credit_card_data  cmdb_priority  cmdb_server_soRware  cmdb_supported_by  cmdb_server_phase  cmdb_db_server  cmdb_db_name   cmdb_PCI  cmdb_PII  cmdb_safe_harbor  192.168.56.102  Sales  Laptop  chris.gilbert@bu^ercupgames.com  ProducHon  No  No  No  No  Tier  3   Windows7  Internal  Deployed  N  N/A  No    No    No  172.20.12.224  MarkeHng  Laptop  monte@demo.com  ProducHon  No  No  No  No  Tier  3   Windows7  Internal  Deployed  N  N/A  No    No    No  172.20.10.217  eCommerce  Laptop  modesto@demo.com  Staging  Yes  Yes  No  Yes  Tier  1   Windows7  Internal  Deployed  Y  Oracle  Yes  Yes  Yes  172.20.15.229  eCommerce  Laptop  modesto@demo.com  Staging  Yes  Yes  No  Yes  Tier  1   Windows7  Internal  Deployed  Y  Oracle  Yes  Yes  Yes    

Demo,  Part  II  

Use  Case  2:  UF  for  ATM  Security  +  Fraud  

· Bank  uses  ATMs  that  are  Windows--based   · Each  ATM  has  a  UF  installed,  securely  sending  data  to  
intermediate  forwarder  on  prem  and  then  up  to   Splunk  Cloud   · Data  retrieved  from  custom  ATM  logs  ­  can   understand  what's  going  on  within  1--2  seconds   · Customer  reps  can  see  what  the  problem  is  easily   · Understand  baseline  ­  when  are  ATMs  popular?   Handle  the  cash  levels   · Understand  fraud  ­  has  someone  stolen  a  card  +  PIN  
and  hi,ng  ATMs  in  close  clusters?  "Superman"   correlaHon   · Conversion  Opp:  know  that  a  3rd--party  bank  customer   hits  an  bank  ATM  every  Friday  for  $200  

Regional  Bank  in  NE  US  

34  

How  about  inventory  +  vulnerabiliRes?  
35  

How  about  inventory  +  vulnerabiliRes?  
36  

Two  ways  to  get  installed  apps,  there  are  more...    

MicrosoR  Sysmon  

Scripted  Input  from  Windows  TA  or   WinHostMon  

37  

What  versions  of  what  exist  on  my  network?  
Scripted  Input  from  Windows  TA  or   WinHostMon  
Do  I  have  known   vulnerable   soRware  on   endpoints?  
38  

Hash  data  from  apps  
MicrosoR  Sysmon  
Correlate  hash   with  threat  intel  
39  

Windows  Update  data  
40  

Windows  Update  Data  (two  sourcetypes)  

Monitor:  WinEventLog:System  

Monitor:  WindowsUpdate.log  

41  

Windows  Port  Data  
Scripted  input  from  Windows  TA  or   WinHostMon  
42  

Windows  Port  Data  
PID  data=easy   correlaHon  to  
process   responsible  
Or  use  sysmon...  
43  

Endpoint  info  criRcal  to  CSC  (SANS)  20  

1  &  2:  Log  hardware  info,  running  procs/svcs   3:  Scripted  inputs  to  check  for  config  issues   4:  Evaluate  processes/services  for  vulns  

5:  Look  for  malicious  new  services/processes     11:  Look  for  malicious  ports/protocols    

12:  Look  for  local  use  of  priv  accounts   14:  Gather  windows  events/*NIX  logs   16:  Evaluate  use  of  screensaver  locks  

17:  IdenHfy  lapses  in  local  encrypHon  

all      You  could  do  

of  that  with  the  Universal  Forwarder.  

  

44  

Obligatory   SANS  20   slide...  

Threat  Intelligence,  you  say?  
File  names  and  hashes   Expired/bogus  certs   Known  Bad  IP   Processes/Services  
45  

Endpoint  vulns  can  be  found  if  you  google  what  to  look  for...  
46  

Remember  this?   shellshock  
· Publicly  announced  on  9/24/2014.   · One  Vulnerability  Management  vendor  had  a  plugin  
on  9/25.  That's  pre^y  good!   · Others  followed  on  9/26  and  9/29  ­  not  so  good.   · These  require  authenHcated  scans.    
47  

RemCemobuelrd  t h  is?  
shellshock  
· Publicly  announced  on  9/24/2014.   · One  Vulnerability  Management  vendor  had  a  plugin  
on  9/25.  That's  pre^y  good!   · Others  followed  on  9/26  and  9/29  ­  not  so  good.  
make  this  process  more  Rmely?   · These  require  authenHcated  scans.    
48  

The  Universal  Forwarder  as  self--help  guru  
That  UF  sure   does  a  lot  by  
itself!  
49  

The  Universal  Forwarder  as  self--help  guru  
· If  you  had  the  Splunk  UF  on  all  of  your  producHon   *NIX  servers...  
· You  could  very  quickly  program  them  to  find   shellshock  (or  ghost,  or  poodle,  or  heartbleed).  
· You  avoid  Vulnerability  Management  Vendor  Lag   · You  could  then  report  on  remediaHon  efforts  over  
Hme.   · And  the  data  ingest  would  be  very  small.  
50  

5  Step  Vulnerability  Tracking  Strategy  
1. On  day  one,  become  aware  of  vulnerability   2. Google  "how  to  detect  <vulnerability>"   3. Adopt  code  via  script  (shell,  batch,  etc)  and  place  into  your  Splunk  deployment  server   4. Forwarders  run  code  and  deliver  results  into  Splunk  indexers   5. Report  on  the  results  
A  good  step   by  step  
51  

Use  Case  3:  UF  for  Shellshock  Tracking  

(Large  payment  processing   company)  

Shellshock  on  20,000  Linux,  Solaris,   AIX  servers  tracked  in  Splunk  

"We  wrote  it  on  the  same  day  and  ran   it  ­  it  is  really  fundamental  to  our   defense."  ­  Mark  Graff,  NASDAQ  
52  

How  about  wire  data?  

· Technology  Add--on  or  TA  (Splunk_TA_stream)  
· Provides  a  new  Data  Input  called  "Wire  Data"   ­ passively  captures  traffic  using  a  modular   input   ­ C++  executable  called  "Stream   Forwarder"  (streamfwd)  
· Captures  applicaHon  layer  (level  7)  a^ributes  
· AutomaHcally  decrypts  SSL/TLS  traffic  using   RSA  keys  

Turn  the  UF   into  a  li^le   network  sniffer  

53  

Stream  Protocols/Plaiorms  Supported  

· UDP   · TCP   · HTTP  
· FTP   · SMB   · NFS   · POP3   · SMTP  

· LDAP/AD   · SIP   · XMPP   · AMQP   · MAPI   · IRC  

· DNS  

· IMAP  

· DHCP  

· MySQL  (login/

· RADIUS  

cmd/query)  

· Diameter   · Oracle  (TNS)  

· BitTorrent   · PostgreSQL  

· SMPP  

· Sybase/SQL  Server   (TDS)    

Supports  Windows  7  (64--bit),  Windows  2008  R2  (64  bit),  Linux  (32--bit/64--bit)  and  Mac  OSX  (64--bit)  

54  

NicHeow  tr  my,u  cBhr  doadtas?k  y.  

  

"a  typical  day  at   the  office..."  

  
TA--microsom--sysmon  
  
Splunk_TA_windows  
All  this  endpoint  Splunking  will  

blow  up  my  license...  

55  

TA--microsom--sysmon   Splunk_TA_windows  

How  much  data?  

"a  typical  day  at   the  office..."  

56  

How  much  data?  
A  12  hour  day.   Even  in  
markeHng!  
57  

How  much  data?  
12  hours  of  standard  event  logs  =  5.5  MB.  Nice!  
58  

How  much  data?  
Hmm.  Lot  more   events...  
59  

How  much  data?  
12  hours  of  Sysmon  logs  =  241  MB.  Oh  crap.  There  goes  my  .conf  talk...  
60  

How  much  data?  
Lots  of   red....let's  take  
that  out.  
61  

How  much  data?  

That's  more  like  it.  16MB  of  Sysmon,  5.5MB  of  Windows  events  =  21.5MB  per  endpoint.  

1,000 21.5GB Coverage  for  

  Windows  endpoints?  

  ingest,  per  day.    

62  

Sysmon  with  network/image  filtering?  

You  sRll  get...  

· Start/Stop  of  all  processes   · Process  names  &  full  command  line  args   · Parent/child  relaHonships  (GUIDs)  between  processes   · Session  IDs   · Hash  and  user  data  for  all  processes   · Filenames  that  have  their  create  Hmes  updated   · Driver/DLL  loads  with  hash  data  

You  retain  far   more  funcHon   than  you  lose.  

You  lose...  
· Network  communicaHon  per  process  (TCP  and  UDP)  including  IP  address,  size,  port  data  
· Ability  to  map  communicaHon  back  to  process  GUID  and  session  ID  

63  

So  you  can  sRll  do...  
I  surfed  a  whole  lot   in  Chrome  today... listened  to  some  
tunes,  too!  
64  

And  also...  

I  really  DID  work  on   that  300  slide  
powerpoint  before   lunch,  I  swear!  

65  

In  Sum  
1. If  you're  not  Splunking  the  data  from  your  various  endpoints   today,  you  should  be.    
2. The  Splunk  Universal  Forwarder  is  a  super--powerful  tool  to  use  on   your  endpoints,  free  to  install,  scales  well,  can  be  centrally   configured,  and  data  volumes  are  quite  reasonable.    
3. For  Windows,  event  data  is  criHcal.  Sysmon  data  is  great  too,  and   free  to  install.  
4. Other  customers  from  many  verHcals  are  having  conHnued  success   with  the  data  they  can  gather  from  endpoints.  
66  

Final  QuesHons?  

Ghosts  of  Sessions  Past  and  Future  

"Finding  Advanced  A^acks  &  Malware  with  6  Windows  EventIDs  you   Configure  and  Monitor"  ­  Michael  Gough,  Malware  Archaeology  

  

"HunHng  known  unknowns  with  the  Splunk  App  for  Enterprise   Security"  ­  Kovar  &  Brant,  Splunk  

  

"Splunk  Assessment  of  MiHgaHon  ImplementaHons"  ­  Jim  Ronayne,  

NSA       

Check  these   out!  

68  

THANK  YOU  

Appendix  

Sysmon  Details  

Sysmon  Info  
· Blog  post  from  November,  2014   · App  available  on  Splunkbase,  
works  with  current  (3.1)  version   of  Sysmon:     · Forwarder  6.2+  needed  to  get   XML  forma^ed  Sysmon  data  (a   good  idea,  cuts  down  on  size)  
72  

Sysmon  Filters  

Filter  out  all  the   Splunk  acHvity  

· This  works  for  Sysmon   3.1+  
· Add  what  you  need  
· If  you  actually  want   Image  and  Network  data,   add  those  stanzas  
· Email   brodsky@splunk.com  for   links  to  example  files!  

73  

Image  and   Network   disabled  

Sysmon  Config  List  
· sysmon  ­c  with  no   filename  will  dump   config  
  

74  

Sysmon  Config  Load  
· sysmon  ­c  with   filename  will  load   config  
· No  restart  needed   · Ignore  errors   · Run  as  admin  (or  script  
as  admin)     
75  

Hash  Analysis  with   Sysmon  

Windows  Registry   Monitoring  

Registry  Monitoring  config  
· Simple  examples  shown   here  
· Email   brodsky@splunk.com   for  an  extensive  registry   monitoring  config  based   on  Autoruns  
  
82  

PLACEHOLDER:  Winreg  
Will  have  link  and  other  info  here  detailing  how  to  do  windows  registry   with  sample  config  of  400+  registry  keys  to  monitor.  
If  you  monitor   the  right  reg  key   you  can  find  new   USB  inserHons.  
83  

Registry  Results  
· USB  inserted  with   BlackPOS  malware  
· Malware  executed  ­   these  are  the  registry   changes  logged  
  
84  

WinHostMon  

WinHostMon  
· Get  hardware  details,   services,  processes,   apps,  etc...  
· Built  right  into  the   forwarder,  no  scripts   needed  
86  

