Siemens  Sima)c  S7  PLC  Exploita)on    
S7--Fu  ()  with  Rapid7  Metasploit   Black  Hat  USA+2011  
Dillon  Beresford  
d1n@nsslabs.com  

      Dillon  Beresford     
Security  Researcher     at  

With  assistance  from...  
NSS  Labs,  Project  Funding   Brian  Meixell,  Engineering  Support.  
Ian  Parker,  Lab  Setup  and  QA.   Tim  OMo,  Hardware  Procurement.   Dale  Peterson  (DigitalBond)  Blog   Bob  Radvanovsky  (SCADASEC)  List   INL/ICS--CERT,  Disclosure  Process  
PLCTrainer.NET  (PLC  Trainers)  

  IntroducVon  
        
· PLCs  are  computers  used  to  automate  mechanical  device  processes.  
· PLCs  are  used  in  the  nuclear,  oil  and  gas  refineries,  coal,  water  and  waste  treatment,  transportaVon,   aerospace,  defense  and  commercial  factories,  among  many  other  things...  
· The  S7--300,  and  S7--400  are  currently  the  most  common  PLCs  in  use,  however  the  S7--1200  is  gaining   more  tracVon  .  
· SimaVc  S7  PLCs  offer  state  of  the  art  PROFIBUS  and  PROFINET  communicaVon  protocols.     · From  an  aMacker  perspecVve,    each  of  the  S7  PLCs  have  one  thing  in  common.  They  communicate  
over  ISO--TSAP  (RFC--1006)  on  TCP  port  102.     · When  TSAP  was  layered  on  Top  of  TCP,  security  wasn't  factored  in.     · The  SimaVc  S7  PLCs  run  on  a  32--bit  Linux  operaVng  system.   · S7  PLC  Firmware  images  are  encrypted  and  hex  encoded,  some  are  using  simple  rotaVng  shia  
sequences  to  obfuscate  the  strings  in  the  firmware.   · The  S7--300  we  are  going  to  exploit  has  a  TELNET  daemon  and  HTTP  server  running  as  background  
process  which  are  used  by  the  Siemens  developers  for  debugging.   · The  S7--1200  also  has  a  web  server  included  in  it  for  diagnosVcs  and  HMI.  

TesVng  

Devices  Under  Test:    

    

§ PLC1  6ES7  212--1BD30--0XB0  AC/DC    

§ PLC2  6ES7  212--1BD30--0XB0  AC/DC   

§ PLC3  317--2EJ10--0AB0   

  

§ PLC4  317--2EJ10--0AB0   

  

  

PLC  Firmware  Versions:    

  

§ Version  2.2  

  

  

§ Version  2.3.4  

  

  

  =>  Siemens  SimaVc  S7--1200     =>  Siemens  SimaVc  S7--1200     =>  Siemens  SimaVc  S7--300     =>  Siemens  SimaVc  S7--300  
  =>  Siemens  SimaVc  S7--1200  
     =>  Siemens  SimaVc    S7--300

SimaVc  S7--1200  

SimaVc  S7--300  
"The  Big  Boys"  

Step  7  Basic  

         What  do  those  panels  aMached  to  the  PLCs  do   and  how  are  they  controlled?  

PLC  Trainer  LAD  Network  

PLC  Trainer  LAD  Network  

PLC  Trainer  LAD  Network  

The  Siemens  SimaVc  S7--300,  S7--400  and  S7--1200  rely   on  the  PROFINET  IEEE  802.3  Ethernet  standard,  for   industrial  grade  connecVvity  in  environments  where   Manufacturing  ExecuVon  Systems  (MES)  are  criVcal.           
     

PROFINET/ETHERNET  

Today  there  are  over  3.5  million  PROFINET  enabled  devices  acVvely  deployed.  

PROFINET  Nodes  In  Use  By  2013  

4,500,000  

4,000,000  

3,500,000  

3,000,000  

2,500,000  

2,000,000  

1,500,000  

1,000,000  

500,000  

0   2006  

2007  

2008  

2009  

2010  

2011  

2012  

2013  

ISO--TSAP  and  SimaVc  PLCs  
· S7  PLC  listens  on  TCP  Port  102  for  connecVons.   · Communicates  w/Step  7  soaware  over  ISO--TSAP.   · ISO--TSAP  is  layered  on  Top  of  TCP  connecVons.   · S7  PLC  also  accepts  remote  commands  over  102.   · ISO--TSAP  was  designed  with  special--purpose  
interfaces  in  mind  to  be  useful  in  the  short  term.     · Expedites  the  process  for  development  of  TSAP  
based  applicaVons  that  need  TCP.  

ISO--TSAP  Problems  
· Security  was  never  factored  into  the  equaVon.   · Packets  transmiMed  o/ISO--TSAP  are  sent  in  plain--
text.     · The  protocol  was  intended  to  be  open  and  
reliable.   · Uses  a  `layering  principle'  which  means  that  even  
if  an  encrypted  bridge  between  the  client  and   server  on  top  of  the  TCP  is  implemented  it  can   sVll  be  MITM   · The  protocol  hasn't  been  revised  or  even  looked   at  since  the  late  80s.  

Don't  trust  SimaVc  `ServerSession'  based  connecVons.  
An  aMacker,  can  disable  or  enable  the  CPU  protecVon  of  a  PLC  by  sending  craaed  packets  over  port  102.  The   aMacker  can  also  control  the  CPU's  internal  operaVonal  state,  change  logical  operaVons  in  the  PLC's  OB1  
porVon  of  memory  and  or  shutdown  processes  connected  to  the  PLC.                                 
            The  packets  in  the  red  are  being  generated  and  sent  from  the  Siemens  Step  7  Basic  so7ware.  The  packets  in  the  blue  are  being   sent  by  the  PLC.  The  en@re  TCP  stream  is  11384  bytes.  Pay  close  aEen@on  to  the  ServerSession_ID  in  the  red  box,  that  liEle  ID  will  
   play  an  important  role  later  on.

Siemens  claimed  that  they  had  a  miVgaVon  strategy  in   place,  and  they  did,  but  it  was  flawed.  
   They  call  it  their  `password  protecVon'  feature.  
  
They  also  claim  that  its  not  possible,  under  any   circumstances  whatsoever,  to  read  or  write  to  memory  
when  the  feature  is  enabled.  

S7  Memory  ProtecVon  

We  don't  need  the  `password'  
Packet2Hex    

Memory  ProtecVon?  

S7  Packet--Fu  over  ISO--TSAP  

S7--1200  PLC  Memory  ProtecVon  Delta  

  
root@bt:~/cmp#  diff  1234.txt  4321.txt   9,10c9,10  
<  "\x5f\x33\x30\x36\x46\x38\x32\x41"+  (x41  =  'A')  
<  "\x46\xa3\x82\x21\x00\x15\x00\xa3"+   ------  
>  "\x5f\x35\x30\x36\x43\x35\x36\x42"+  (x42  =  'B')  
>  "\x37\xa3\x82\x21\x00\x15\x00\xa3"+      root@bt:~/cmp#      HEX  to  ASCII      Server  Session  

5f  33  30  36  46  38  32  41  46    

  =>  _306F82AF  '1234'  0o,¯    Password  =>  `1234'  

5f  35  30  36  43  35  36  42  37    

  =>  _506C56B7  '4321'  PlV·    Password  =>  `4321'  

Flawed  S7--PLC  AuthenVcaVon    
Take--a--ways  
If  an  aMacker  has  captured  packets  containing  the   authenVcated  server  session,  from  the  automaVon   network  they  can  re--authenVcate  using  the  same   packet  and  bypass  that  level  of  protecVon  without  ever   needing  any  physical  access  to  the  engineering   workstaVon  or  the  PLC.  
  
It  is  also  possible  to  generate  our  own  library  of   packets  based  on  a  pre--exisVng  packet  capture  and   either  crack  the  password,  or  brute  force  our  way  in   and  since  Siemens  didn't  enforce  expired  sessions  we   can  simply  use  any  ServerSession  ID  we  like,  against   any  S7  PLC.  

Memory  ProtecVon  Take--a--ways  
· It  is  possible  to  read  and  write  data  to  the   PLC's  memory  even  when  the  password   protecVon  is  enabled.  
· It  is  possible  to  retrieve  sensiVve  informaVon   from  the  PLC  through  memory  dumping.  
· Its  is  also  possible  to  disable  the  password   protecVon  feature  on  the  PLC  by  flipping  the   security  bit  back  to  an  OFF  state.    

AMack  Vector  
1. We  capture  traffic  going  to  and  from  the   engineering  workstaVon  and  the  PLC.  
2. We  dissect  the  client  porVon  of  the  TCP   Stream.  
3.   We  build  our  own  packets  based  on  the   client  porVon.  
4. We  can  replay  those  packets  back  to  the  PLC.  

Process  
§ Scrape  device  informaVon  from  memory.   § Change  the  results  of  ladder  logical  operaVons  on  the  PLC,  
manipulate  the  logic  to  report  false  data  to  the  operator.   Devices  in  the  field  could  explode  or  spin  out  of  control!   § Put  the  CPU  in  START/STOP  mode  which  could  destroy   process  environments  and  damage  producVvity.   § Edit  PLC  device  configuraVon,  change  MAC,  IP  address,  device   name,    Time  of  Day,  and  even  lock  the  operator  out  of  their   own  PLC.   § Frag  the  PLC  by  triggering  memory  leaks  in  bugs.   § Execute  arbitrary  commands  via  command  shell  using  the   hardcoded  credenVals.  

Stuxnet  

Metasploit  

Worm  

PropagaVon  

        
We  can  own  everything  on  the  automaVon  network...  

S7  Recon  
Metasploit  S7--1200  PLC  Auxiliary  Scanner  Module  
   By  sending  a  series  of  forged  probe  packet  requests  an  aMacker  can  fingerprint  the  S7--1200   across  a  network.  This  would  enable  the  retrieval  of  sensiVve  informaVon.  You  can  grab   informaVon  such  as  the  serial  number,  firmware  version,  model  number  and  PLC  name.    
                            
           

S7--1200  PLC  Memory  Read/Write  
· Read  device  logic  about  the  process  connected   to  the  PLC  and  create  targeted  aMacks  based   on  the  informaVon  we  receive.  
· Read/Write  boolean  operaVons.   · Read/Write  tag  names  from  datablocks   · Disable  protecVon,  CPU  operaVons,  etc..   · Put  the  CPU  into  a  perpetual  STOP  state.     

S7--1200  PLC  Binary  Data  from  PLC  Memory  

PLC  Memory  from  Data_Block_1  
WEWT!       

S7  Memory  Dump   Metasploit  Module  

Remote  Memory  Dump   S7--300  Norflash  

What  can  we  find  in  dumps?  
· Code  paths   · Source  code   · New  Bugs     

S7--300  Hardcoded  CredenVals  

Cracking  the  S7  Password  
User:  basisk   Pass:  basisk  
· Scan  thru  firmware   · 12  lines  of  code   · Swap  odd  chars   · Login  via  Telnet   · Login  via  HTTP   · Dump  Memory   · Delete  Files   · Execute  Commands     

Owned  

Decoding  the  S7  password  
· Took  1--2  hours  to  locate  the  actual  password   · The  result  was  command  shell.  
   s  =  'sUreS/RTP  sawsro/dWP.Dabisks'   def  decode_s7_str(st):           s  =  list(st)           for  c  in  range(0,len(s),2):                   t=s[c]                   s[c]=s[c+1]                   s[c+1]=t           return  "".join(s)   print  decode_s7_str(s)        

Metasploit  Modules  
· simaVc_s7_1200_cpu_cmd.rb   · simaVc_s7_300_cpu_cmd.rb   · simaVc_s7_mem_dump.rb   · simaVc_s7_1200_cpu_mem_write.rb   · simaVc_s7_disable_mem_protect.rb   · simaVc_s7_cpu_cmd_protect_bypass.rb        
  

Demo  

