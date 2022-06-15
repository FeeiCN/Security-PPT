LTE  Pwnage:  Hacking  HLR/HSS  and   MME  Core  Network  Elements  
P1  Security  
1

LTE  ENVIRONMENT  
2

LTE  Network  Overview  
3

Corporate  &  Mobile  Data  risk  increased  
· LTE  from  aGackers  perspecHve   · All  IP  ­  always  on  ­  always  vulnerable?  
­ Spear--Phishing   ­ Botnets  &  Malware   ­ Flooding   ­ Trojan  &  Backdoors  
· IPv6  renders  NAT  protecHon  inefficient   · Split  Handshake  TCP  aGacks  prevents  IPS  and  
AnHvirus   · Very  familiar  architecture  for  aGackers:  ATCA,  Linux   · Intricate  and  new  protocols:  Diameter,  S1,  X2,  GTP  
4

2G  3G  to  LTE:  Reality  and  Legacy  

2G  

3G  

LTE  

BTS  

Node  B  

eNode  B  

BSC  

merged  into  Node  B   merged  into  eNode  B  

MSC  /  VLR   HLR   STP  

RNC   HLR,  IMS  HSS,  HE   STP,  SG  

MME,  MSC  Proxy   LTE  SAE  HSS,  SDR/SDM   Legacy  STP  

GGSN  

GGSN  

PDN  GW  

SGSN  

SGSN  

MME/SGW  

IN  

IN/PCRF  

PCRF  

RAN  Firewall   RAN  Firewall  

SeGW  

5

User  data  content:  LTE  User  Plane  
6

LTE  Network  AGack  Surface  
· Full  IP  only?  
­ No:  full  IP  double  exposure  
· Packets  (PS  Domain)    
­ 2x  aGack  surface  
· GTP  sHll  present   · S1AP/X2AP  new  
· Circuits  (CS  Domain)  
­ 2x  aGack  surface  
· SIGTRAN  &  SS7  will  stay  for  many  years   · IMS  &  Diameter  
7

3G  and  LTE  together  

RAN  

EPC  

8

CSFB  vs.  VOLTE  vulnerability  aGack   surface  
· CSFB  
­ CS  Fall  Back  from  4G  to  3G   ­ Past  is  present   ­ SS7  and  SIGTRAN  stack  vulnerabiliHes  (DoS,  spoof,  ...)  
· VOLTE  
­ Whole  new  aGack  surface   ­ New  APN,  new  network  to  hack,  new  servers,     ­ Closer  to  the  Core  Network  ==  more  serious  vulns   ­ IMS  (CSCF  =  SIP  server,  DNS,  ...)    
· Standard?  No...  
9

ISUP  injecHon  in  SIP  through  VOLTE  

Yes,  SIP...  known...  but...  

Internet  SIP  +  SS7  ISUP  ==  SIP--I  and  SIP--T  ==  ISUP  InjecHon  !  

  

· Remote

Core

Network

DoS

· SS7

compromise

· External

signaling

injection

· Spoofing of

ISUP

messages

· Fake billing

· Ouch!

11

CSFB  AGack  surface  through  MSC  Proxy   and  SS7  +  SIGTRAN  
· All  SIGTRAN  aGack  surface  exposed   · All  SS7  aGack  surface  exposed   · Most  dangerous:  
­ Logical  Denial  of  Service  aGacks  
· SSP--based  SCCP  DoS  (P1  CVID#480)   · TFP--based  SS7  DoS  (P1  CVID#481)  
­ Equipment  Crash/Denial  of  Service  aGacks  
· Ericsson  MSC  Crash  DoS  (P1  VID#330)   · NSN  HLR  Crash  DoS  (P1  VID#148)   · Ericsson  STP  Crash  DoS  (P1  VID#187)  
12

P1vid#148 - https://saas.p1sec.com/vulns/148
NSN  NGHLR  remote  Denial  of  Service  caused  by   fragile  SS7  stack  

Severity

Critical

Description NGHLR SS7 stack software is not robust and suffers



from Remote Denial of Service.

Impact

Enables any person sending malicious SCCP traffic to the HLR to crash it. This includes the whole international SS7 network as HLRs need always to be globally reachable.

· Reliability  for  telco  
­ Ability  to  cope  with  X  million  of  requests   ­ Not  Ability  to  cope  with  malformed  traffic  

P1vid#145 - https://saas.p1sec.com/vulns/145
GSM  MAP  primiHve  MAP_FORWARD_ACCESS_SIGNALLING   enables  RAN  signaling  injecHon  

Severity Medium

This GSM MAP MSU

Description 

"MAP_FORWARD_ACCESS_SIG NALLING" forwards any content to the Radio Access Network

(RAN).

Impact

The result is that some external entities may send or spoof MAP_FORWARD_ACCESS_SIGN ALLING MSUs to target MSC GTs and have the vulnerable MSCs to inject this signaling into the radio network (typically RANAP).

Spoofed   Normal  

· Spoof  and  inject  radio  signaling  

· As  if  it  was  coming  from  Radio  Network  

P1vid#213 - https://saas.p1sec.com/vulns/213
Fun  AnH--forensics  
· Same  aGack  as  VID#187  "   · Also  crash  Ericsson  traffic  monitoring  log  analysis  
forensic  tools  (P1  VKD  VID#213)   · Code  sharing  between  enforcement  and  forensic  
tools  
15

3G  and  LTE  together  

RAN  

EPC  

16

Peer  to  Peer  Radio  Access  Network  
· X2AP  
­ eNodeB's   ­ Peer  to  Peer  
· TranslaHon  
­ Every  base  staHon  can  talk  to  every  other   ­ Network  aGack  surface  increase   ­ Total  spread  into  the  RAN  network  
· Operator--wide  L2  network  
­ L2  aGacks,  less  defense  in  depth,  scanning  only  blocked  by   size  of  network  
­ Did  GTP  disappear?  No  
17

User  data  btw  eNBs:  LTE  User  Plane  
18

LTE  RAN  Overview  

Evolved Packet Network (EPC)

MME

SGW

Mul

SeGW

OSS-RC

LTE RAN

S1 CP

S1 UP

IP/Ethernet transport

Mul S1 X2

Mul S1 X2

Mul S1 X2

Typically a common physical connection

! 19

Pwning  OSS:     L2  network  mistakes  always  happen  
· Can't  catch  it  with  mulHple  overlapping  /8   networks:  automate!  
· From  any  eNodeB  to  the  NMS   · From  any  eNodeB  to  any  eNodeB  
­ You  can  bet  on  insecure  provisioning  
· American  example  &  Remote  misconfiguraHon  
20

eNodeB  Hardware  AGacks  
Ericsson RBS 6602 
DUS (2G+3G+4G) & DUL (4G)
Radio
Uplink to DWDM / Optical net Local Ethernet ports (not TDM anymore)
Hardware (in)security system
21

LTE:  Equipment  AGack  surface  increase  
· Diameter  (New)  
­ Added  surface   ­ New  code,  maturity  in  quesHon   ­ Very  few  commercial  fuzzers  support  it   ­ Even  less  really  trigger  bugs  in  Diameter  (depth  pbm)  
· S1/X2AP  (New)  
­ GTP  +  MAP  within  two  completely  new  protocols   ­ With  encapsulaHon  of  user  traffic  (Non  Access  Stratum  
protocol)  
· What  could  possibly  go  wrong?  
22

23

24

Diameter  audit/fuzzing  problem  
25

Auditor  bias  #1:    
Open  standards  doesn't  mean  vision  
· Diameter  
­ Nearly  every  parameter  is  opHonal  
· Result  
­ Nobody  knows  what  is  a  valid  combinaHon  ...  
· To  test  /  fuzz  /  inject  
· Combinatorial  explosion  
­ Sequence  /  Dialogue  /  Flow   ­ AVP  combinaHon   ­ AVP  values   ­ Fuzzed  parameter  
· Even  manufacturer  don't  know  how  to  successfully   instrument  the  Device  Under  Test  
· Fuzzer  Support  is  not  Fuzzer  successful  triggering   26

Auditor  bias  #2:  Fuzzing  is  as  deep  as   fuzzer  goes  
· And  fuzzer  never  go  deep  enough  
­ Commercial  fuzzer  
0 trigger/1000 iteration!
­ Standard  own  fuzzer  
13 triggers/1000 iterations! !
· Need  target--specific  development  
­ Customized  own  fuzzer:    
85 triggers/1000 iterations!
27

LTE:  New  risk  with  Diameter  
· Diameter  informaHon   network  disseminaHon  
· Diameter  awesomeness  
­ distribuHon/centralizaHon   ­ its  own  evil  side  
· Present  in  many  database  
­ HSS,  SDM/SDR,  CUD     
· The  goal  was  to  centralize   · The  result  is  one  more  
database  
28

LTE  Huawei  Specific  
· USN  =  SGSN  +  MME   · UGW  =  SeGW  +  SGW  +  PDN  GW  /  PGW  
29

Pwning  LTE  HSS:     C++  SQL  InjecHon  everywhere  
30

LTE  HSS  Pwning  methodology  
· OSS  is  considered  Core   · It  is  accessible  by  eNodeBs  
­ SomeHme:  Network  filtering  mistakes   ­ Osen:  Allowed  for  Provisionning  
· OSS  can  connect  to  HSS  
­ HSS  exports  too  many  services   ­ Mux/Tunnel  kind  of    thinking  
· one  port  ==  many  services  
31

LTE  EPC  funcHonal  plane,  no  OAM  
32

Add  OAM:  complexity  explosion  
33

Auditor  bias  #3:     Manual  vision  is  always  incomplete  
· Need  some  automaHon   · 200  APNs  *  16  million  IPs  ==  need  to  have  
dedicated  scanner  
­ Each  valid  GTP  tunnel  is  a  new  16  millions  IPs  to  scan   ­ Address  space  explosion  
· You  CANNOT  do  it  manually  
­ You  CANNOT  do  it  without  specific  scanners  
34

Pwning  MME:  Hardcoded  encrypHon  keys  

P1 VKB CVID#485

DES... Hardcoded keys everywhere... 35

Demo  
36

Legacy  PS  Interfaces  of  interest  to  LTE  
· Gi  :  Interface  from  GGSN  to  Internet   · Gn  :  Interface  between  SGSN  and  other  SGSN  and  
(internal)  GGSN   · Gp  :  Interface  between  Internal  SGSN  and  external  
GGSN  (GRX  used  here)  
37

eDNS  vs  iDNS  
· Leaks  to  Internet   · Passive  DNSmon   · Leaks  to  GPRS   · Leaks  to  3G  data   · Leaks  to  LTE  EPC  

Legacy  GPRS  /  UMTS  
· GRX   · TLD  /  Domain  .gprs   · Quite  monolithic:  
­ APN   ­ RAI  
· rai<RAI>.  mnc08.  mcc204.gprs  
· Only  APNs  and  "some"  network  element  
39

IMS  DNS  
· 3gppnetwork.org   · Supports  and  lists  all  Network  Element  
­ LAC   ­ RAC  
· Examples  
­ rac<RAC>.lac<LAC>.mnc08.mcc204.gprs  
40

LTE  EPC  DNS  
· Same  as  IMS  DNS  but  extended   · Supports  and  lists  most  SAE  EPC  Network  Elements  
­ MME   ­ SGW  
· Examples  
mmec<MMEC>.mmegi<MMEGI>.mme.epc.mnc99.mcc208.3gppnetwork.org!
  
41

Pwning  from  LTE  mobile  
· Infrastructure  Reverse  path  protecHon   · LTE  Mobile  data  access  
­ RFC1918  leaks  (SomeHme)   ­ Datacom  IP  infrastructure  access  (Now  more  osen)  
NAT CGNAT
42

Pwning  from  external:     Direct  MML  access  from  Internet  
· Pwning  from  external  without  any  reverse  path   trick.  
· Shodan  doesn't  work  on  these   · MML  aGack  surface  exposed  
NAT CGNAT
43

Auditor  bias  #4:     Testbed  is  always  more  secure  
· Testbed  is  more  secure  than  producHon  
­ Legacy  impact   ­ Scalability  impact  
· Audit  is  osen  only  permiGed  in  testbed  
­ Liability   ­ PotenHal  for  Denial  of  Service  
· Result  
­ AGackers  advantage   ­ ProducHon  goes  untested  
44

Auditor  bias  #4:     Testbed  is  always  more  secure  
· Testbed  is  more  secure  than  producHon  
­ Legacy  impact   ­ Scalability  impact   ­ There's  always  something  more  on  the  prod  network  
· Audit  is  osen  only  permiGed  in  testbed  
­ Liability   ­ PotenHal  for  Denial  of  Service  
· Result  
­ AGackers  advantage   ­ ProducHon  goes  untested  
45

Technical  Capacity  &  Knowledge  issue  
· Who  
­ Can  audit  all  new  LTE  protocols  and  legacy  protocols   ­ Has  experHse  on  the  architectures  &  vendors  equipment  
· Guarantee  
­ Scanning  quality   ­ Coverage  on  all  protocols  &  arch  (CSFB,  IMS,  Hybrid,  
SCharge)  
· Cover  all  perimeters  and  accesses  
­ APNs   ­ GRX  &  IPX  accesses   ­ Split  DNS   ­ User  plane  and  control  plane  
46

Conclusion  
· LTE  is  supposed  to  be  built  with  security  
­ Difference  between  standardizaHon  and  real  security   ­ Network  Equipment  Vendors  are  sHll  lagging  
· Opening  up  of  the  technology  
­ Good:  deeper  independent  security  research  
· Operators  
­ SHll  disinformed  by  vendors   ­ Security  through  obscurity  in  2013!  Unbelievable!   ­ Some  are  gezng  proacHve  
47

Contact:   Philippe.Langlois@p1sec.com   hGp://www.p1sec.com  
THANKS!      SEE  YOU  AT:   HACKITO  ERGO  SUM  ­  MAY  2--4  2013   PARIS,  FRANCE  
48

BACKUP  SLIDES  
49

Interfaces  
50

LTE  Network  
51

Previous  LTE  services  &  missions  
· LTE  Complete  infrastructure  audit   · Huawei  LTE  EPC  Core  Network  audit  &  
vulnerability  research   · LTE  CSFB  infrastructure  integraHon  with  legacy  
audit  
­ both  Diameter,  S1,  X2  and  SS7  integraHon  for  CS   FallBack  
· Ericsson  eNodeB  audit  and  product  security   review  
· Diameter  security  audit  on  LTE  &  IMS  Core  
52

LTE  audit  milestones  
1. External  LTE  tesHng,  scan  &  audit  (blackbox)  
­ LTE  new  elements   ­ IntegraHon  with  legacy  
2. LTE  eRAN  onsite  audit  
­ eNodeB,  enrollment,  configuraHon  &  PSR/PVR   ­ OSS  &  OAM  
3. LTE  EPC  Core  Network  audit  
­ MME   ­ S--GW  &  PDN  GW   ­ HSS   ­ PCRF  
4. MBSS  ­  Minimum  Baseline  Security  Standard  
­ LTE  eRAN:  eNodeB,  SeGW,  OSS  &  enrollment  servers   ­ LTE  EPC:  MME,  S--GW,  PCRF,  HSS,  PDN  GW,  MSC  Proxy  
53

INTERFACES  
54

Interfaces  
55

ADDRESSING  IN  LTE  
56

Core  Network:  IP  addresses  everywhere  
· Everything  uses  IP  addresses  
­ User:  UE,     ­ RAN:  eNodeB,  SeGW   ­ EPC:  MME,  HSS,  SGW,  PGW  
· IPv4   · IPv6  is  actually  really  being  supported  
57

Telecom--specific  addressing  
· End  user  addresses:    
­ GUTI,     ­ IMSI,     ­ ...  
58

GUTI  
· Globally  Unique  Temporary  IdenHty  (GUTI)  
­ Allocated  by  the  MME  to  the  UE  
· GUTI  =  GUMMEI  +  M--TMSI  
­ GUMMEI  =  Globally  Unique  MME  ID  
· GUMMEI  =  MNC  +  MCC  +  MMEI  
­ MMEI  =  MMEGI  +  MMEC   » MMEGI  =  MME  Group  ID   » MMEC  =  MME  Code  
­ M--TMSI  ==  MME  TMSI  
· GPRS/UMTS  P--TMSI  -->  LTE  M--TMSI   · S--TMSI  =  MMEC  +  M--TMSI  
59

GUTI  in  Pictures  
60

RAI/P--TMSI  mapping  to  GUTI  
!
61

GUTI  mapping  to  P--TMSI  
!
62

TAC  and  RNC  ID  
!
63

ADRESS  MAPPING  IN  DNS  
64

Legacy  GPRS  /  UMTS  
· GRX   · TLD  /  Domain  .gprs   · Quite  monolithic:  
­ APN   ­ RAI  
· rai<RAI>.  mnc08.  mcc204.gprs  
65

IMS  DNS  
· 3gppnetwork.org   · Supports  
­ LAC   ­ RAC  
· Examples  
­ rac<RAC>.lac<LAC>.mnc08.mcc204.gprs  
66

LTE  EPC  DNS  
· Same  as  IMS  DNS  but  extended   · Supports    
­ MME   ­ SGW  
· Examples  
­ mmec<MMEC>.mmegi<MMEGI>.mme.epc.mnc99.mcc 208.3gppnetwork.org  
67

TECHNOLOGY  BACKGROUNDER  
68

LTE  Data  Terminology  
· GTP  =  GPRS  Tunneling  Protocol   · EPS  =  Evolved  Packet  Service,  LTE  data  sessions   · EPC  =  Evolved  Packet  Core,  the  LTE  core  network   · APN  =  Access  Point  Name  (same  as  2G/3G)   · Bearer  =  PDP  session,  GTP  Tunnel  for  a  given  used   · SeGW  =  Security  Gateway,  segments  eNB  /  EPC   · SGW  =  Serving  Gateway,  like  GGSN,  connects  to  
Internet  
69

PDP  Context  vs.  EPS  Bearer  
· UMTS  and  GPRS  data  session  
­ Packet  Data  Protocol  (PDP)  Context   ­ AGach  (Alert  SGSN)  -->  PDP  Context  AcHvaHon  procedure  
· LTE  data  session  
­ Evolved  Packet  System  (EPS)  Bearer  
· Default  EPS  Bearer   · Dedicated  EPS  Bearer  
· Both  use  parameters:  
­ Access  Point  Name  (APN),     ­ IP  address  type,     ­ QoS  parameters  
70

LTE  GTP  =  eGTP  
· GTP--U   · From  eNodeB  to  
PDN  GW  
­ PGW   ­ aka  Internet  exit  
node   ­ Used  to  be  the  GGSN  
71

· udp/2152  

GTP--U  

72

LTE  Control  Plane:  eNodeB--MME  
73

· sctp/36412  

S1AP  

74

LTE  Control  Plane:  eNodeB--eNodeB  
75

· sctp/36422    

X2AP  

76

Protocol  and  port  matrix  

Communicating nodes Source Destination

Protocol

eNodeB

S-GW

GTP-U/UDP

S-GW

eNodeB GTP-U/UDP

eNodeB

eNodeB GTP-U/UDP

eNodeB

MME

S1AP/SCTP

MME

eNodeB S1AP/SCTP

eNodeB

eNodeB X2AP/SCTP

Protocol ports

Source Destination

2152

2152

2152

2152

2152

2152

36422

36412

36412

36422

36422

36422

77

All  is  ASN1  
· All  protocols  described  in  ASN1  
­ Different  kind  of  Encoding  
· BER  ­  Basic,  standard  TLV   · PER  ­  Packed,  
­ Aligned  (APER)   ­ Unaligned  (UPER)  
­ Described  in  ITU  and  3GPP  standards   ­ Require  ASN1  "CLASS"  keywords  
78

LTE  SIGNALING  
79

Diameter  Everywhere  
· Diameter  replaces  SS7  MAP   · DSR    
­ Diameter  Signaling  Router  
80

81

82

83

Security  implicaHon  
· SCTP  filtering  to  be  generalized   · Benefit  
­ SCTP  is  "config  first"  most  of  the  Hme  
· Threat  
­ IP  cloud  is  much  more  exploitaHon  friendly   ­ AGack  techniques  are  known  to  many  people   ­ Compromise  consequences  are  more  far--reaching  than  
SS7  
84

Diameter  Roaming  
85

Security  rouHng  and  filtering  in  Diameter  
· DSR  
­ Define  rouHng  &  filtering  rules    
· Discriminants  Indicators  
­ DesHnaHon--based:    
· Realm,  Host,  ApplicaHon--ID    
­ OriginaHon--based:    
· Realm,  Host,  ApplicaHon--ID    
­ Command--Code   ­ IMSIAddress  
86

Future  Diameter  RouHng  &  Filtering  
87

Security  &  Vulnerability  of  EPC  Roaming    
· Filtering  even  more  important  
­ DSR  filtering  is  not  mature  
· GRX  problems  amplified  
­ Impact  of  the  GRX/IPX/IMS/SAE  EPC  DNS  infrastructure   in  InformaHon  Gathering  
· Unique  IdenHfier  leaks  much  easier  
­ Privacy  consequences  
88

TESTING  
89

TesHng  Security  in  an  LTE  Environment  
· Two  kind  of  environment  
­ Testbed   ­ Live  (also  called  ProducHon,  Greenfield,  AcHve)  
90

LTE  Testbed  Security  tesHng  
· Shielded  tesHng  
­ eNodeB  antenna  output  connected  to  a  cable   ­ Cable  arrives  in  test  room   ­ A  "Shielded  box"  in  test  room  is  connected  to  cable   ­ Phone  /  USB  dongle  is  put  inside  the  box  for  tests   ­ USB  cable  goes  out  of  the  box  toward  the  test  PC    
· No  RF  is  polluHng  the  spectrum  
­ Enables  pre--aucHon  tesHng  
91

RelaHonship  to  Vendors  
· Vendor  usually  prevent  audit    
­ By  limiHng  informaHon     ­ By  limiHng  access  to  Device  Under  Test   ­ By  limiHng  access  to  testbed   ­ By  threatening  of  potenHal  problems,  delays,  
responsibility,  liability  
· Most  of  the  LTE  tesHng  can  happen  transparently  
­ The  vendor  doesn't  see  the  security  audit  team   ­ Presented  as  normal  operator  qualificaHon   ­ Not  presented  as  security  audit  
· Result  only  is  presented  when  audit  is  finished  
92

AUDITS  
93

GTP  
· Endpoint  discovery   · Illegal  connecHon/associaHon  establishment  
­ User  idenHty  impersonaHon   ­ Fuzzing  
· Leak  of  user  traffic    
­ to  Core  Network  (EPC)     ­ to  LTE  RAN  
94

X2AP  Audit  
· Endpoint  discovery   · Illegal  connecHon/associaHon  establishment  
­ Fuzzing  
· Reverse  engineering  of  proprietary  extensions   · MITM  
95

S1AP  Audit  
· Endpoint  discovery   · Illegal  connecHon/associaHon  establishment  
­ Fuzzing  
· Reverse  engineering  of  proprietary  extensions   · MITM    
­ NAS  injecHon  
96

LTE  EPC  DNS  Audit  
· EPC  DNS  is  important   · EPC  DNS  scanner   · Close  to  GRX  /  IMS  
97

ATTACKS  
98

User  aGacks:  EPS  Bearer  Security  AGacks  
· APN  Bruteforcing   · IP  SegmentaHon  
­ accessing  operators'  RFC1918  internal  networks  
· GTP  endpoint  discovery    
­ from  within  Bearer  Data  Session  
· Secondary  EPS  Bearer  ExhausHon/Flood  load  DoS  
­ Max  11  to  be  tested   ­ Repeat  setup/teardown  of  connecHons  
· PGW  DiffServ  tesHng  
­ Scans  the  IP  header  DS  bits  (DifferenHated  Services)  to  see   difference  in  treatment  by  PGW  
99

TOOLS  
100

Basic  audit  tools  
· LTE  SIM  card   · LTE  USB  Dongle   · LTE  UE  (User  Equipment)  =  Phone   · RJ45  for  Ethernet  connecHon  to  EPC/EUTRAN   · Wireshark   · Sakis3G  and  evoluHons  for  LTE  support   · IPsec  audit  tool  
101

Ideal  audit  tools  
· GTP  protocol  stack  &  fuzzer   · SCTP  MITM  tool  &  fuzzer   · Ethernet/ARP  MITM  tool  (eGercap)   · S1AP  protocol  stack  &  fuzzer   · NAS  protocol  stack  &  fuzzer   · X2AP  protocol  stack  &  fuzzer   · Diameter  protocol  stack  &  fuzzer   · GRX,  IMS,  EPC  DNS  scanner  
102

VirtualizaHon  targets  
· Huawei  
­ In  progress  
· HSS   · MSC  Proxy  
­ PotenHal  
· USN,  Serving  GW,  PDN  GW,  MME  
­ eHRS  integrated  node  (MME,  HSS,  SGW,  PGW,  ...)  
· Easier  because  one  single  node  
· HP  opportunity?  
103

LTE  Network  VirtualizaHon  
104

Huawei  ATCA  vs.  PGP  
· OSTA  2.0  
­ Linux  based  
· OpenSuse  10.x  or  11.x   · Old,  unpatched  kernel   · Proprietary  extensions  and  SMP  
­ Some  FPGA  based  boards   ­ Some  OEM  based  integraHon  (Switches  AR40,  Routers,  ...)  
· PGP  
­ Older  architecture   ­ More  monolithic   ­ Harder  to  replicate  
105

Hard  problems  
· Use  same  kernel  (medium)   · Use  licensing  (medium)   · Load  signed  kernel  modules  (medium  hard)   · Emulate  FPGA  and  OEM  integraHon  (hard)   · Replicate  network  services  /  other  NEs  (hard)  
106

HSS  
· ATCA  /  OSTA  2.0   · Few  external  hardware   · Moderately  easy   · OperaHon  in  progress   · Based  on  HSS_V900R003  
107

Virtualizing  in  context  (CSFB)  

RAN  

EPC  

108

MSC  Proxy  
· ATCA  /  OSTA  2.0   · No  external  hardware   · Moderately  easy   · ConfiguraHon  with    
­ exisHng  SS7  SIGTRAN  infrastructure   ­ Diameter  testbed  
109

USN  
· USN_V900R011C02SPC100   · Harder  
110

Ericsson  
· Difficult  to  deal  with  them   · Very  protecHve  
­ Access   ­ Licensing   ­ DocumentaHon  
111

NSN  
· PotenHally  easier  than  Ericsson   · Linux  based  (SGSN,  ...)  
­ MontaVista  
· Some  security  features  
112

Cisco  
· Some  virtualizaHon  done  
­ IOS  12.x  
· Some  virtualizaHon  needs  hardware  
­ Cisco  7200   ­ Cisco  ITP   ­ Cisco  GGSN  
· Virtual  networking   · Our  technology  for  adapted  virtualizaHon  
113

Our  advantage  so  far  
· Virtualize  x86  with  specific/signed  kernels  and   modules  
· Virtualize  MIPS   · EmulaHon  of  specific  hardware  support  
­ Kernel  modules  development  
· Virtualize  ARM  Android  based  device    
­ for  customer  simulaHon  
114

Mobile  +  VAS  virtualizaHon  
· Specific  demand  from  customer  
­ Virtualize  x86  based  server   ­ Virtualize  10--20  Android  clients   ­ Simulate  fraudulent  transacHon  within  this  flow   ­ Inject  faults  within  repeated  traffic  
115

VIRTUALIZED  SIGNALING  FUZZING  
116

Principle  
· Proxies  
­ M3UA  Proxy   ­ S1/X2  Proxy   ­ Diameter  Proxy  
· Made  transparent  
­ SCTP  Man  in  the  Middle   ­ Packet  forwarding  
117

LTE  increases  risks  
· Financial  thes   · Privacy  thes   · Hacking  of  corporate  users   · M2M  impact  of  worms  and  aGacks   · LTE  Mobile  broadband  usage  as  main  internet  
connecHon   · Protocols  are  untested  and  tradiHonal  fuzzer  coverage  
is  weak  and  shallow   · Network  equipment  is  new  and  not  as  reliable  as  
tradiHonal  network  elements  
118

Questions ?
119

