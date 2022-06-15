Copyright  ©  2015  Splunk  Inc.  
HunBng  the  Known   Unknowns  (with  DNS)  
Ryan  Kovar  and  Steve  Brant  
Security  Strategists  @  Splunk  

Disclaimer  
During  the  course  of  this  presentaBon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauBon  you  that  such  statements  reflect  our   current  expectaBons  and  esBmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaBon  are  being  made  as  of  the  Bme  and  date  of  its  live   presentaBon.  If  reviewed  aVer  its  live  presentaBon,  this  presentaBon  may  not  contain  current  or   accurate  informaBon.  We  do  not  assume  any  obligaBon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiBon,  any  informaBon  about  our  roadmap  outlines  our  general  product  direcBon  and  is  subject  to   change  at  any  Bme  without  noBce.  It  is  for  informaBonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaBon  either  to  develop  the  features  
or  funcBonality  described  or  to  include  any  such  feature  or  funcBonality  in  a  future  release.  
2  

whoami  

Ryan  Kovar:  CISSP,  MSc(Dist)  
Staff  Security  Strategist   Minster  of  the  OODAloopers   @meansec  

· 15  Years  of  cyber  security  experience    
· Worked  in  US/UK  Public  Sector  and  DOD  most   recently  in  naBon  state  hunBng  roles  
· Enjoys  clicking  too  fast,  long  walks  in  the  woods,  and   data  visualizaBon  
· Current  role  on  Security  PracBce  team  focuses  on     incident/breach  response,  threat  intelligence,  and   research  
· Currently  interested  in  automaBng  methods  to  triage   data  collecBon  for  IR  analyst  review.  
· Also  invesBgaBng  why  printers  are  so  insubordinate   _  

3  

Steve  Brant:  CISSP  
Security  Strategist   Minister  of  Truth   @trustedtech  

whoami  
· 22  Years  in  the  IT  biz   · 7  Years  in  Security  InformaBon  and  Event  
Management   · Novice  beer  snob   · Working  on  improving  the  Splunk  ES  out  of  
the  box  experience  with  improved  workflow   and  searches  
4  

Agenda  
 Answering  some  W  's  
­ Why  are  we  doing  this  talk   ­ What  are  the  known  unknowns  of  DNS  
 Talk  about  the  H  
­ How  do  we  can  we  find  these  afacks  in  our  network?  
 And  now  another  W  
­ Where  can  I  find  this  app?  
 Conclusion     
5  

Why?    

7  

8  

DNS  Is  An  Unknown  Threat  To  Your  Network  

"New  FrameworkPOS  variant  exfiltrates  

DNS   Exfiltra.on  

data  via  DNS  requests"  

      ­  Gdata  Security  Blog,  October  2014  

DNS   "..  two  large--scale  security  breaches  using   Tunneling   tunneling,  affecBng  millions  of  accounts"  
      ­  CircleID,  Oct  2013  

DNS     Spoofing  

"Back  in  1996,  a  security  bug  was  found  in   Netscape  Navigator  and  Internet  Explorer   using  DNS  spoofing"             ­  archive.mozilla.org,  1997  

TCP  SYN  Flood  A=acks    
Valid  is  a  type  of  Distributed  Denial  of   Service  (DDoS)  afack  that  exploits  part  of   the  normal  TCP  three--way  handshake  
UDP  Flood  A=ack  
Is  a  denial--of--service  (DoS)  afack  using   UDP  floods  to  make  the  vicBms  server   unreachable  
DNS  Amplifica.on  A=ack  
Is  a  reflecBon--based  distributed  denial  of   service  (DDos)  afack.  The  afacker  spoofs   look--up  requests  to  domain  name  system   (DNS)  servers  to  hide  the  source  of  the   exploit  and  direct  the  response  to  the   target.  

What?    

DNS Tunneling
11  

Spoofing,
12  

DNS     ExfiltraBon  
13  

14  

Where?    

16  

Bro  DNS  Logs  
17  

Pro's  of  Bro:  
· High Adoption by Security Community
· Incredibly Flexible
18  

Con's of Bro:
· Can be difficult to install/ administer/configure
· Sets all DNS logs to lower Camel Case
19  

Windows  DNS  Logs  
hfp://secapc.blogspot.com/203_08_01_archive.html 20  

21  

Pro's  of  Host  Logs:  
· Easy to gather · Log DNS server issues along
with resolutions
22  

Con's  of  Host  Logs:  
· Can cause performance issues on host
· Could be modified by adversary (or bad logging practices)
23  

24  

Pro's  of  Stream  :  
· Splunk Supported · Easy to install · Ground truth
25  

Con's  of    Stream:  
· Can't write at 10Gb+ line speed
· May not be your corporate wire data solution.. yet
26  

How?  

Conclusion  

Take--Aways  
 DNS  Is  everywhere  in  your  network    You  have  tools  to  record  and  analyze  it    The  methods  to  detect  threats  via  DNS  exist  and  are  easy  to  implement  
29  

QuesBons?  
30  

THANK  YOU  

