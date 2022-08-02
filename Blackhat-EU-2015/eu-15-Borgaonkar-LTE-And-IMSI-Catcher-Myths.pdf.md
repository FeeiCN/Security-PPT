LTE  and  IMSI  catcher  myths  
  
Ravishankar  Borgaonkar,  Altaf  Shaik,  N.  Asokan,  ValAeri  Niemi,  Jean--Pierre  Seifert      Blackhat  EU,  Amsterdam,  Netherlands      13  November  2015  
     
  

Outline  
· Fake  base  staMons  in  GSM/3G   · LTE/4G  Security  
· Types  of  vulnerabiliMes  in  pracMce         · Building  LTE/4G  base  staMon  
· AAacking  methods/demos  
· Impact  &  Analysis  
     
2

Mo+va+on  
· Baseband  story   · PlaTorm  for  pracMcal  security  research  in  LTE/4G   · AAacking  cost  VS  security  measures  (defined  in  15  years  back)    
     
3

Fake  base--sta+ons..1  
· Used  for:  IMSI/IMEI/locaMon  tracking,  call  &  
data  intercepMon     
· Exploit  weaknesses  in  GSM  &  3G  networks  
(parMally)  
· Knows  as  IMSI  Catchers   · Difficult  to  detect  on  normal  phones  
(Darshak,  Cryptophone  or  Snoopsnitch)  
4

Fake  base--sta+ons..2  
5

Why  in  GSM  &  3G  
· GSM  --  lack  of  mutual  authenMcaMon  
between  base  staMon  and  mobiles     
· 3G  ­  no  integrity  protecMon  like  in  LTE,  
downgrade  aAacks     
· GSM/3G  ­  power  is  to  base  staMon,  decides  
when  and  how  to  authenMcate/encrypt  
· IMSI/IMEI  can  be  requested  any  Mme  
6

LTE/4G  networks  
· Widely  deployed,  1.37  billion  users  at  the  end  of  
2015     
· Support  for  VoLTE    
  
· High  speed  data  connecMon  and  quality  of  service  
  
· More  secure  than  previous  generaMons  
· Best  effort  to  avoid  previous  mistakes  
7

LTE  Architecture  

E-UTRAN

Cell

S1

UE

eNodeB

AS

I

n

t

e

r

n

e

MME

t  

Tracking Area

NAS

AS  :  Access  Stratum

  

  

  UE:  User  Equipment    

NAS  :  Non--Access  Stratum     

  

  S1  :  Interface  

E--UTRAN:    Evolved  Universal  Terrestrial  Access  Network   MME  :  Mobility  Management  EnMty  

8

Enhanced  security  in  LTE  
  
· Mutual  authenMcaMon  between  base  staMon  &  mobiles   · Mandatory  integrity  protecMon  for  signaling  messages    
  
· Extended  AKA  &  key  hierarchy     · Security  algorithms    
  
· Other  features  (not  relevant  for  this  talk)  
     
9

Paging  in  LTE  
10

Paging  in  LTE  
IMSI = 404220522xxxxxx" Paging Request Type 2" {404220522xxxxxx : A000FFFF }"
TMSI = A000FFFF"

eNodeB" 11

LTE  Smart  Paging  

Cell  5   Cell  4   Ce l  l  1   Cell  3   Cell  2  

Tracking  Area  

12

Enhanced  security  w.r.t  fake  base  sta+on  

  
· Mutual  authenMcaMon  between  base  staMon  &  mobiles  

· Mandatory  integrity  protecMon  for  signaling  messages    
  
· IMEI  is  not  given  in  non--integrity  messages  

· Complexity  in  building  LTE  fake  base  staMon*  

· But  in  pracMce:  
üimplementaMons  flaws,  specificaMon/protocol  deficiencies?  

  

*  hAps://insidersurveillance.com/rayzone--piranha--lte--imsi--catcher/      

  

13

Specifica+on  Vulnerabili+es  
14

LTE  RRC  protocol*  :  specifica+on  vulnerability  
R   RC  protocol  ­  setup  &  manage  over--the--air  connec+vity!      · Broadcast  informaMon  
ü UE  idenMMes     ü Network  informaMon  (SIB)  messages   ü Neither  authenMcated  nor  encrypted        
· UE  measurement  reports  
ü Necessary  for  smooth  handovers   ü UE  sends  "Measurement  Report"  messages   ü Requests  not  authenMcated:  reports  are  not  encrypted         
    
*3GPP  TS  36.331  :    E--UTRA;  RRC  protocol   Fig.  source:    hAp://lteuniversity.com/        
15

LTE  RRC  protocol*  :  specifica+on  vulnerability  
R   RC  protocol  ­  setup  &  manage  over--the--air  connec+vity!      · Broadcast  informaMon  
· UE  IdenMMes  ­  IMSI,  TMSI   · Network  informaMon  messages  (SIB)   · Neither  authenMcated  nor  encrypted  
          eNodeB  
*3GPP  TS  36.331  :    E--UTRA;  RRC  protocol   SIB  :  System  InformaMon  Blocks  
16

EMM  protocol*  :  specifica+on  vulnerability  
EMM  protocol  --  Controlling  UE  mobility  in  LTE  network!  
   · Tracking  Area  Update(TAU)  procedure  
ü UE  sends  "TAU  Request"  to  noMfy  TA   ü During  TAU,  MME  &  UE  agree  on  network  mode   ü "TAU  Reject"  used  to  reject  some  services  services  (e.g.,  LTE  services)  to  UE   ü However,  reject  messages  are  not  integrity  protected  
  
· LTE  AAach  procedure  
ü UE  sends  its  network  capabiliMes   ü Unlike  security  algorithms,  no  protecMon     ü Network  capabiliMes  are  not  protected  against  bidding  down  aAacks       
    
17

Vulnerabili+es  in  baseband  chipset  
18

IMEI  leak  :  implementa+on  vulnerability  
T   AU  reject  ­  special  cause  number!  
  
· IMEI  is  leaked  by  popular  phones   · Triggered  by  a  special  message   · Fixed  now  but  sMll  your  device  leak  ;)   · IMEI  request  not  authenMcated  correctly  
         
19

LTE  RRC*  :  implementa+on  vulnerability  
R   LF  reports  ­  network  troubleshoo+ng!  
  
· When  Radio  Link  Failure  happens   · Informs  base  staMon  of  RLF   · UE  sends  "RLF  report"  message   · Privacy  sensiMve  informaMon  in  RLF  report   · Request  not  authenMcated:  reports  are  not  encrypted    
         
Fig.  source:    hAp://lteuniversity.com/        
20

LTE  RRC*  :  implementa+on  vulnerability  
  Measurement  reports  ­  GPS  co--ordinates!  
  
· For  handover   · Privacy  sensiMve  informaMon  in  the  report   · Request  not  authenMcated     · reports  are  not  encrypted    
         
21

Network  Configura+on  Issues  
22

Configura+on  issues  
Deployments  all  over  the  world!  
· Smart  Paging  
ü Directed  onto  a  small  cell  rather  than  a  tracking  area   ü Allows  aAacker  to  locate  LTE  subscriber  in  a  cell     
· GUTI  persistence  
ü GUTI  change  ­  handover/aAach/reallocaMon  procedure   ü MNOs  tend  not  to  change  GUTI  sufficiently  frequently  
  
· MME  issues  
23

Building  4G  fake  base  sta+on  and  aZack  demos     
Ethical  Considera+on  
24

Experiment  Set--up  
  Set--up  cost  --  liZle  over  1000  Euro!  
· Hardware  ­  USRP,  LTE  dongle,  LTE  
phones     
· Sooware  --  OpenLTE  &  srsLTE  
  
· ImplementaMon  ­  passive,  semi--
passive,  acMve  
  
Thanks  to  OpenLTE  and  srsLTE  folks!  
25

Loca+on  Leak  AZacks  
   Exploit  specifica+on/implementa+on  flaws  in  RRC  protocol!        
· Passive  :  link  locaMons  over  Mme  
ü Sniff  IMSI/GUTIs  at  a  locaMon  (e.g.,  Airport/home/office)   ü Track  subscriber  movements  (same  GUTI    for  several  days)  
     
Demo  
26

Semi--Passive  :  determine  tracking  area  &  cell  ID  
· VoLTE  calls:  Mapping  GUTIs  to  phone  number  
ü 10  silent  calls  to  vicMm's  number     ü High  priority  à  paging  to  enMre  tracking  area(TA)   ü Passive  sniffer  in  a  TA     
· Social  idenMMes:  Mapping  GUTIs  to  Social  Network  IDs  
ü E.g.,  10  Facebook  messages,  whatsapp/viber     ü Low  priority  à  Smart  paging  to  a  last  seen  cell   ü Passive  sniffer  in  a  cell     
Demo  
27

Ac+ve  :  leak  fine--grained  loca+on  
Precise  loca+on  using  trilatera+on  or  GPS  !  
    
  
· Measurement/RLF  report  
ü Two  rogue  eNodeBs  for  RLF   ü eNodeB1  triggers  RL  failure:  disconnects  
mobile   ü eNodeB2  then  requests  RLF  report  from  
mobile  
       
    
  
Demo  
28

DoS  AZacks  
Exploi+ng  specifica+on  vulnerability  in  EMM  protocol!     
· Downgrade  to  non--LTE  network  services  (GSM/3G)   · Deny  all  services  (GSM/3G/LTE)   · Deny  selected  services  (block  incoming  calls)   · Persistent  DoS   · Requires  reboot/SIM  re--inserMon  
  
Demo  
29

Summary      
  
· New  vulnerabiliMes  in  LTE  standards/chipsets  
· Social  applicaMons  used  for  silent  tracking  
  
· LocaMng  4G  devices  using  trialternaMon  ,  GPS  co--ordinates!  
  
· DoS  aAacks  are  persistent  &  silent  to  users      
· ConfiguraMon  issues  in  deployed  LTE  networks    
           
30

Solu+on!  
Use  any  old  Nokia  phone  without  baZery  and  SIM  card!           
31

Impact    
Specifica+on  vulnerabili+es  affect  every  LTE--enabled  device!     
· ImplementaMon  issues  are  (almost)  fixed  by  baseband  chip  
manufacturers  J    
· 3GPP/GSMA  working  on  fixes   · However  no  updates  from  handset  manufacturers  yet  L  
  
· No  response  yet  from  MediaTek  &  Samsung  L  
  
· Mobile  network  operators  (Germany)  fixing  their  network  
configuraMon  issues;  others  may  affected  as  well  L     
32

Thanks     
Ques+ons?  

