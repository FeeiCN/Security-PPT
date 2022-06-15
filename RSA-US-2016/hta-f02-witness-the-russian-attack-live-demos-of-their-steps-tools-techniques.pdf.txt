SESSION  ID:   HTA--F02  
Witness  the  Russian  a/ack   Live  demos  of  their  steps,  tools,     techniques  
# R S A C   

Wayne  Huang  
VP  Engineering   Proofpoint,  Inc.   @waynehuang   whuang@proofpoint.com   wayne@armorize.com     
Sun  Huang  
Senior  Threat  Researcher   Proofpoint,  Inc.    
shuang@proofpoint.com     

#RSAC
About  US  
Wayne  Huang  
Was  Founder  and  CEO  of  Armorize  Technologies,  and  is  now  VP   Engineering  at  Proofpoint   Presented  at  RSA  USA  (07,  10,  15),  RSA  APJ  (15),  BlackHat  (10),   DEFCON  (10),  SyScan  (08,  09),  OWASP  (08,  09),  Hacks  in  Taiwan  (06,   07),  WWW  (03,  04),  PHP  (07)  and  DSN  (04)
Sun  Huang  
Senior  threat  Researcher  at  Proofpoint     Pentester  with  10+  years  experience,  CTF  enthusiast  

#RSAC
Agenda  
Northern  Gold  campaign  overview
The  a^ack  chain  
Phase  1:  Infec_ng  legi_mate  websites   Phase  2:  Target  filtering  &  scanner  evasion  ­  Traffic  Distribu_on  Systems   Phase  3:  Geeng  into  the  users'  machines  ­  Exploits   Phase  4:  Stealing  banking  creden_als  ­  Malware   Phase  5:  Leveraging  infected  PCs  to  opera_ng  a  paid  proxying  service  for   fellow  crime  groups  
Who  were  the  vic_ms?  
Conclusion  

#RSAC
Northern  Gold  Campaign  Overview
Russian--speaking  cybercrime  group  
Using  purchased  lists  of  administrator  logins,  the  actor   compromised  WordPress  sites  to  spread  Qbot  
Built  a  Qbot  (aka  Qakbot)  botnet  of  500,000  infected  systems  
Sniffed  `conversa_ons'  ­  including  account  creden_als  ­  from   800,000  online  banking  transac_ons  (59%  US  banks)  
Operates  a  sophis_cated,  paid  proxying  service  for  other   organized  crime  groups.  

#RSAC
The  A/ack  Chain  

#RSAC
Phase  1:  InfecKng  LegiKmate  Websites  

#RSAC
Phase  1:  InfecKng  LegiKmate  Websites  
Purchases  a  large  number  of  cPanel  password  lists  from  the   underground  cybercriminal  economy    
Runs  their  own  custom--made  tool,  which  verified,  one  by  one,  accounts   from  these  purchased  lists    
cpanel_checker.pl   ssh_cpanel_checker.pl  
Injects  webshells  into  legi_mate  websites  
iframer_agent.php   smar_framer.pl  

#RSAC
Tools:  The  cpanel_checker.pl  suite  
Validates  cPanel  accounts    
cpanel_checker.pl  <in_file>  <out_file>   Useragent:  Opera/9.63  (Windows  NT  5.1;  U;  en)  Presto/2.1.1   Concurrent  threads:  40  
Validates  ssh  accounts   Recursively  scans  FTP  directories  for  file  type  sta_s_cs  
scan_tp_dir   EX:  html:  57  php:  163  asp:  0  pl:  0  cfm:  0  

#RSAC
Tools:  The  iframer_agent.php  suite  
A  PHP  Webshell  (iframe_agent.php)  
check_d:  check  infected  file       check_s:  check  infected  file   edit_d:  inject  malicious  JS  code  with  randomized  comments  
  /*LRnj7qjAQn22V7u4  */alert(1);/*  eARgwTs92yDKd8cfVck6e8kO  */   edit_s:  inject  malicious  JS  code   crt_d:  create  new  file  and  inject  malicious  link   wp_root:  add  WordPress  account  

#RSAC
Tools:  The  smarKframer.pl  suite  
Send  HTTP  requests  that  inject  malicious  links  redirec_ng  to  TDS   servers  
Usage:  smar_framer.pl  <check|edit>  config_file

#RSAC
Tools:  The  smarKframer.pl  suite  
  

Phase  2:  Filtering  Targets  &  Evading  

#RSAC

Scanners  ­  Traffic  DistribuKon  Systems  

  

#RSAC
TDS's  as  a  service  --  circumvent  detecKon    
Prior  to  Oct  2013:  Simple  TDS   Oct  2013  to  Mar  2014:  Keitaro  TDS   From  March  4  to  the  present:  Sutra  TDS   Common  TDS  features:  
Filters:  IP  ranges,  language,  referrers,  unique  visitors  (via  cookies),   user--agents,  countries,  proxy  IPs,  etc   Avoid  crawlers  and  security  scanners   Traffic  stat  dashboards  

Malicious  Obfuscated  Script  from  

#RSAC

Compromised  Website  ­  2014  

JavaScript  obfusca_on  tool:  Jasob  trial  version   Redirect  to  TDS  Server  

Deobfuscated  TDS  URL  
h^p://yimg.1[redacted]nter.com/k?ts=xxx

Malicious  Obfuscated  Script  from  

#RSAC

Compromised  Website  ­  2016  

JavaScript  obfusca_on  tool:  Jasob  trial  version   Redirect  to  TDS  Server  

Deobfuscated  TDS  URL  
h^p://st.d[redacted]a.com/"  j7aMn(2,6)  "viewforum"   j7aMn(2,6).php    

#RSAC
SUTRA  TDS  Panel  

Phase  3:  InfecKng  the  Endpoints  ­  

#RSAC

Exploits  

#RSAC
Sutra  TDS  ConfiguraKon  for  IE

#RSAC
Sutra  TDS  ConfiguraKon  for  FireFox

Sutra  TDS  ConfiguraKon  for  Clients  

#RSAC

Vulnerable  to  Java  Exploits

Sutra  TDS  referer  List  ­  Equivalent  of  an  

#RSAC

Infected  Website  List  

#RSAC
Sutra  TDS  RedirecKng  to  EK  ­  2014  
referer  check
Redirect  to  Sweet  orange  EK    h^p://cdn2.s[redacted]s.net:17982/tps/typo3/auth.php?order=3 Obfuscated  javascript

#RSAC
Sutra  TDS  RedirecKng  to  EK  ­  2016  
referer  check
Redirect  to  Rig  EK    h^p://hrt.d[redacted]b.org/?zniKfrGULRfMDIM=l3SKf  PrfJxzFGMSUb... Obfuscated  javascript

#RSAC
Sutra  TDS  Daily  Traffic  

Northern  Gold  Sutra  TDS  ACCEPTED  Browser  

#RSAC

Hit  DistribuKon  

#RSAC
Tools:  The  av_sutra_check.pl  suite
Non--blacklis_ng  check  :  Scan4U's  API  
  TDS  URLs     Exploit  server  URLs     Malicious  javascript  to  be  injected     Obfuscated  qbot  
Actors  no_fied  via  ICQ  immediately  upon  detec_on  by  any  an_virus   vendor  (oscar.pl)   An_virus  detec_on  rate:  always  0  to  5  out  of  55  vendors  on  VirusTotal  
  

Phase  4:  Stealing  User  Banking  

#RSAC

CredenKals  ­    Malware  

#RSAC
Malware  AdopKon  
Qbot  aka  Qakbot  that  has  been  around  since  2007  
It's  a  worm  that  spreads  via  network  shares  and  removable  drives   Ring3  rootkit   Networking  communica_ons:  DGA  domains  +  RC4  encryp_on  with  sha1  random   salt   Exfiltrate  POP3/FTP  passwords,  keystrokes,  cer_ficates  and  bot  info  via  FTP   An_--VM,  An_--Sandbox  features  
Second  stages  
Session  Spy,  Webinject  (man  in  the  browser),  Zeroaccess,  Smokebot,  VNC  (rat  in   the  browser),  Proxy  client  (SocksFabric),  Ext_ip  (portscan  module)  
Strategy  change:  spreading  ransomeware  since  2015  

#RSAC
Qbot  Command  and  Control  Panel  

#RSAC
Qbot  CommunicaKons  
Bots  ask  C2  for  new  commands  to  execute:  We  sent  a  same   request  mul_ple  _mes  and  received  different  responses  ­  why?  

#RSAC
Qbot  CommunicaKons:  EncrypKon  
Bots  ask  C2  for  new  commands  to  execute:  We  sent  a  same   request  mul_ple  _mes  and  received  different  responses  ­  why?  

#RSAC
Qbot  CommunicaKons:  DecrypKon      
Decryp_ng  bot's  post  data  

#RSAC
Qbot  CommunicaKons:  DecrypKon  
Decryp_ng  bot's  post  data:

#RSAC
Qbot  CommunicaKons:  DecrypKon    
Bot's  request  format:   r=1&n=qtxuzs653767&os=5.1.1.2600.3.0.0100&bg=a&it=2&qv=0 201.149&ec=2d498963&salt=qknF4Tma

#RSAC
Qbot  CommunicaKons:  DecrypKon  
Bot's  task  command  format  
1&gknF4Tma&7F000001&updbot

HarvesKng  Banking  CredenKals  via  

#RSAC

Session  Spy  

Password  successfully  sniffed

Phase  5:  Using  Infected  PCs  to  Operate  Paid  

#RSAC

Proxying  Service  for  Other  Crime  Groups  

Qbot  downloads  another  module  called  "SocksFabric,"  
SocksFabric  SDK  is  wri^en  in  C  (supports  cross--plaorm)  
Builds  up  a  large  tunneling  network  based  on  SOCKS5  
Offering  other  crime  groups  
Evasion  of  fraud  detec_on  by  using  appropriate  IP  geoloca_on   Build  their  own  `private  cloud'  to  run  encrypted  communica_ons  and   transfer  stolen  data     Use  the  compromised  end  points  as  infiltra_on  points  into  targeted   organiza_ons  

#RSAC
SocksFabric  control  panel  

#RSAC
Tools:  SocksFabric  suite  
Single--line  API  makes  it  easy  for  any  malware  to  join  the   SocksFabric  botnet  proxy  farm  
na^un_client_test.c  
SocksFabric  panel  connec_ng  to  na^un  server  for  directory  data  
socks_downloader.pl  

#RSAC
Who  Were  the  VicKms?  
Half  a  million  unique  infec_ons   qbot  has  covered  almost  two  million  unique  IPs     

#RSAC
Who  were  the  vicKms?  
0.8  million  e--banking--related  HTTPS  conversa_ons  

#RSAC
Tools:  mail_checker  suite  
Delete  email  alerts  from  banks   Filter  by  bad_sender  &  bad_keywords  
checkmail.pl  
Sending  huge  volumes  of  email  to  an  address  in  an  a^empt  to   overflow  the  mailbox  
mailbomber.pl

#RSAC
VicKm  distribuKon  

Vic_m  geoloca_on  distribu_on

Vic_m  OS  distribu_on

#RSAC
TOP20  online  banking  transacKons  

TOP  10  URLs  from  AWStats  

#RSAC
Qbot  gate Exploits  go  to  sutra Qbot  exe  updates Qbot  exe Webinjects  for  all Session  spy Qbot  exe  updates Inject  Iframe  redirec_on

#RSAC
Conclusion  
This  actor  is  currently  s_ll  ac_ve   The  kill  chain  is  the  same:  inject  malicious  JS  to  compromised  sites   +  TDS  +  exploit  kit   They  develop  and  use  quite  a  few  in--house  tools   Qbot  used  to  establish  a  foothold  into  endpoints  ­  then  downloads   mul_ple  malware   Money  rules:  cybercrime  group  has  the  poten_al  to  net  millions  of   dollars    
46  

#RSAC
Apply  --  End--user  PerspecKve  
Applying  all  Cri_cal  security  updates  for  your  opera_ng  system  and   browser,  but  also  making  sure  that  users  have  applied  the  latest   patches  for  Java  (from  Oracle)  and  Adobe  Flash  and  Reader   Another  simple  measure  users  can  take  to  protect  themselves  is  to   disable  JavaScript  in  their  browsers:  if  it  is  not  prac_cal  to  disable   JavaScript  for  all  sites,  then  consider  doing  so  for  untrusted  zones   or  sites  
Install  Enhanced  Mi_ga_on  Experience  Toolkit  (EMET)    
47  

#RSAC
Apply  --  Website  PerspecKve  
You  should  have  the  latest  Content  management  systems  (CMS)   version  to  prevent  compromise   Checking  with  Google's  Safe--Browsing  API  to  determine  if  the  site   suffers  from  a  known  infec_on   Simply  Find  and  Remove  Backdoors  
grep  --RPn  "(passthru|shell_exec|system|base64_decode| edoced_46esab|WSO_VERSION)  *\("  /var/www  
48  

