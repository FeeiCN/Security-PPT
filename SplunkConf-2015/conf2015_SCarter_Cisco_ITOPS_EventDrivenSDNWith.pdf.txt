Copyright  ©  2015  Splunk  Inc.  
Event--Driven  SDN  
Steven  Carter  
Solu;ons  Architect,  Cisco  Systems  
Jason  King  
Solu;ons  Architect,  Cisco  Systems     

Disclaimer  
During  the  course  of  this  presenta;on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau;on  you  that  such  statements  reflect  our   current  expecta;ons  and  es;mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta;on  are  being  made  as  of  the  ;me  and  date  of  its  live   presenta;on.  If  reviewed  aQer  its  live  presenta;on,  this  presenta;on  may  not  contain  current  or   accurate  informa;on.  We  do  not  assume  any  obliga;on  to  update  any  forward  looking  statements  we  
may  make.     In  addi;on,  any  informa;on  about  our  roadmap  outlines  our  general  product  direc;on  and  is  subject  to   change  at  any  ;me  without  no;ce.  It  is  for  informa;onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga;on  either  to  develop  the  features  
or  func;onality  described  or  to  include  any  such  feature  or  func;onality  in  a  future  release.   Referenced  customers  for  ITSI  product  par;cipated  in  a  limited  release  soQware  program  that  included  
items  at  no  charge.  
2  

About  Me  
· Steven  Carter,  Solu;ons  Architect,  Cisco  Systems   ­ 15  years  of  experience  in  the  enterprise  and  public  sector  space     ­ Specializes  in  Cloud,  SDN,  and  DevOps  Solu;ons  for  Public  Sector  Customers   ­ Part  of  a  team  that  built  the  World's  first  SDN  network  and  the  World's  largest   supercomputer,  and  took  Linus  Torvalds  out  for  a  burger...  at  Hooters  
· Jason  King,  Solu;ons  Architect,  Cisco  Systems   ­ 15  years  of  experience  in  the  enterprise  and  public  sector  space       ­ Designed  and  operated  large  scale  campus  LANs  and  HPC  networks   ­ Specializes  in  solu;ons  for  the  unique  requirements  of  the  scien;fic  community   ­ Extensive  background  in  enterprise  Systems,  Storage,  and  Virtualiza;on  
3  

 Background    Solu;on  Detail    Demonstra;on    Summary  

Agenda  

4  

Background  

Applica;on  
Logs   Topology  
NetFlow  
Firewalls  
IDS  
Switch   Metrics  

What  is  Event--Driven  SDN?  
OpenFlow   NetConf  
Reputa;on   Monitoring  
6  

Why  Event--Driven  SDN?  
 Probably  already  sending  events  to  central  logging    Has  the  most  informed  view  of  the  status  of  the  network,  servers,  and  apps    Provides  event  correla;on  
­ Consolidates  the  number  of  devices  sending  REST  commands   ­ Correlates  by  severity,  rate,  and  between  events  
 Provides  for  audi;ng  and  repor;ng  capabili;es    Leverage  exis;ng  skills  by  wri;ng  logic  in  Splunk  Search  Processing  Language    
7  

Cisco  Open  SDN  Controller  
Open  pla(orm  for  SDN  app  development     Single  Northbound  REST  Interface  
              
Mul;ple  Southbound  Interfaces  

Event  Feedback  Loop  
Ac;on  Script  
Feedback  Loop  
 Used  to  store  state  in  Splunk  soQware  to  avoid  complexity    State  can  be  used  to  "remember"  to  unblock  a  host    State  can  be  used  to  elevate  the  threat  level  of  an  aiacker  
9  

Science  DMZ   Solu;on  Detail  

Science  DMZ  Reference   Commodity  Internet  

Internet2/AL2S  

Implementa;on  
Next  Genera=on  Firewall   · Commodity:  In--Line   · Internet  2:  In--Line  or  OOB  
w/Steering  

BGP  

Nexus  3K    

BGP  Null  Routes  

ASR  1K  

ASR  9K  

High--Throughput   Science  Networks  

DMZ  

Ac;ve  Blocking  
NexusF  9loKw     No;fica;on  

Compute   DTN  

Secure  Corporate   Networks  

ASA  5585  

· Event  Correla;on   · Log  Storage   · Audi;ng  
· Analysis  

Corporate  DC  

Campus  

External   Services  

Example  Event  Ac;ons  
Real--Time,  Immediate  Ac=on:  
e.g.  High  Priority  IDS  Event:  Block  Host  Immediately  
   Real  Time  With  Sliding  Window  and  Threshold:  
e.g.  SYN  Aiacks:  Block  host  aQer  100  improper  SYNs  in  60  seconds  
   Scheduled  with  Fixed  Window:  
e.g.  Block  Timeout:  Unblock  host  if  it  has  not  been  seen  in  last  24  hours  
12  

Globus  for  Data  Transfer  
· A  key  service  in  the  research  networking  ecosystem  with  more  than  10,000  ac;ve  endpoints   · SoQware--as--a--Service  (SaaS)  solu;on  to  manage  transfers  where  users  can  direct  requests  to  transfer  or  
synchronize  files  and  directories  between  two  loca;ons   · Uses  GridFTP  to  provide  secure,  reliable,  and  efficient  transfer  of  data  across  wide--area  distributed  networks   · GridFTP  extensions  provides  parallelism  (i.e.,  the  use  of  mul;ple  socket  connec;ons  between  pairs  of  data  
movers),  restart  markers,  and  data  channel  security.     · GridFTP  control  plane  provides  the  source  and  des;na;on  informa;on  for  the  flows  it  sets  up   · Effec;vely  authen;cates  flows  before  they  bypass  security  
13  

OpenFlow  Data  Flow  Steering  

Base  setup  depending  on  mode:   Out--Of--Band  IDS:   <priority>100</priority>   <in--port>54</in--port>   <output--node--connector>52</output--node--connector>   <output--node--connector>25</output--node--connector>   In--Band  Firewall/IPS:   <priority>100</priority>   <in--port>54</in--port>   <output--node--connector>25</output--node--connector>   <in--port>25</in--port>   <output--node--connector>52</output--node--connector>  
Bypass  opera=on  the  same  for  both  modes   <priority>200</priority>   <in--port>54</in--port>   <output--node--connector>52</output--node--connector>  
  

Outside  
54  

IDS  
25  

52  
Inside  

Out--Of--Band  IDS  

Outside  
54  

FW/IPS  
25  

52  
Inside  
In--Band  FW/IPS  

14  

Bypass  Flows  in  "Tap"  Switch  

Flow  start  no=fica=on:  
Jun 10 10:53:43 localhost splunk_odl_action: log_level=INFO, action=start, flow=199.66.189.10:50368-128.55.29.41:42600, status_code=200

Flows  added  to  Nexus  3000:  

Flow: 4

Match:

tcp,in_port=54,nw_src=199.66.189.10,nw_dst=128.55.29.41,tp_src=50368,tp_dst=42600

Actions:

output:52

Priority:

200

Flow: 5 Match: Actions: Priority:

tcp,in_port=52,nw_src=128.55.29.41,nw_dst=199.66.189.10,tp_src=42600,tp_dst=50368 output:54 200

  

Flow  stop  no=fica=on:  

Jun 10 10:54:51 localhost splunk_odl_action: log_level=INFO, action=stop, flow=199.66.189.10:50368-128.55.29.41:42600, status_code=200

15  

Remotely  Triggered  Black  Hole  Rou;ng  

Sta=c  routes  added  by  COSC  through  Netconf  on  ASR  9000:  
router static address-family ipv4 unicast 1.0.184.115/32 Null0 tag 666 1.161.169.139/32 Null0 tag 666 2.25.74.127/32 Null0 tag 666 2.50.153.67/32 Null0 tag 666 12.197.32.116/32 Null0 tag 666
Export  the  Null  routes  seSng  next--hop  to  black  hole  IP:  
route-policy as-11017-out if tag is 666 then set next-hop 192.0.2.1 set community (no-export) additive pass else pass
endif end-policy

Enable  uRPF  on  WAN  interface  on  ASR  9000:  
ipv4 verify unicast source reachable-via any allow-default   
Route  Black  Hole  IP  to  NULL  0  on  other  border  routers:  
ip route 192.0.2.1 255.255.255.255 Null0
Enable  uRPF  on  WAN  interface  on  ASR  1000:  
ip verify unicast source reachable-via any
16  

Demo  

Summary  
 The  Splunk  plauorm  can  be  used  as  an  SDN  engine    Leverage  exis;ng  skillset  in  Spunk  Search  Processing  Language    You  are  already  collec;ng  the  informa;on  that  you  need    Increase  your  security  posture  by  including  ALL  intelligence  
18  

THANK  YOU  

