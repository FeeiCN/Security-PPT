Eight  ou  two  eleven  
Dynamic  inspec5on  of  Broadcom     Wi--Fi  cards  on  mobile  devices      Ma5as  Eissler  ­  HITBAMS2015  

Agenda  
· Overview  of  Broadcom  Wi--Fi  NiC  mobile  devices  
­ Architecture   ­ ALack  surface  &  possibili5es      
· Tool:  
­ Dynamic  inspec5on.   ­ Why  not  just  make  a  debugger?   ­ Our  objec5ve   ­ Explore  findings  along  the  way.  
· Usage  of  the  tool  to  inspect  firmware  

Previous  works  
· Much  has  been  done  on  network  card   firmware.  See  Triulzi[1],  Delugré[2],  others  [3]  
· Mobile  devices  
­ Firmware  modified  for  monitor  mode  and  raw   injec5on  on  iOS  &  Android  by  two  different  teams   (Andres  Blanco,  bcmon  team)  
­ Vulnerabili5es  discovered:  CVE--2012--2619   ­ Not  much  (public)  research  acer  that.  

Broadcom  huge  WI--FI  player  

What  do  the  cards  look  like?  

What's  inside?   CPU,  memory  and  cores  

SRAM   d11  

HOST   (Mobile)  

SDIO  

SDIO  BUS  

Cortex   M3/R4  

PHY  

Air  

Antenna  

Mac   Chip   Common  

ALack  surface  &  possibili5es  
· 802.11  implementa5on  bug  -->  RCE  Firmware  
­ Pivot  Firmware  -->  Driver   ­ Man--in--the--middle  to  inject  browser/app  exploits   ­ At  least  pivot  to  a  target  LAN:  

Even  more  surface  
· Firmware  supports  wide  range  of  features:  
­   TCP   ­   ICMP  &  ARP  offloading   ­ Firewall  implementa5on   ­ Mobile  hotspot,  Wi--Fi  Direct,  AirDrop   ­ Proprietary  802.11  extensions  (Broadcom/Cisco)  
· We  need  to  play  more  with  these  firmwares!  

Mobile  products  5meline  

Mobile  products  5meline  

Very  soon  you  end  up  buried     in  a  sea  of  devices  
YOU  

Objec5ves  
· Dynamically  inspect  firmware   · Be  as  OS/Device  independent  as  
possible  

Why  dynamic?  
· Sta5c  inspec5on  only  gets  you  that  far.   · Once  you  have  all  memory  dumped,  
understanding  everything  from  a  sta5c   perspec5ve  is  limited.  E.g.  indirect  calls.   · If  you  manage  to  get  a  crash  it  is  hard  to   understand  what  happened.  

Firmware  is  Separated  in  two  regions    

º   º  

Region  1  
º   º  
Loaded  from  filesystem:     Only  protected  by  CRC     /etc/wifi/firmware     /usr/share/firmware/wifi  

Region  2  
Burned  into  ROM:         Not  ini5ally  accesible  to  us  

Communica5on  

Device   CPU  

Card   CPU  

Kernel  

IOCTL  
SDIO  

Firmware  

Communica5on  

Device   CPU  

Card   CPU  

Kernel  

IOCTL  message  over  SDIO  

Firmware  

IOCTL  Syscall  
Users  pace  

Apple:  IOC_CARD_SPECIFIC     Android:  SIOCDEVPRIVATE    

Proposed  solu5on  
· If  we  modify  the  firmware  to  support  to  new   IOCTL  msgs:  Read  &  Write.  
· Send  a  user  -->  kernel  IOCTL,  that  encapsulates   a  Kernel  -->  firmware  IOCTL  
· If  we  can  do  this,  then  we  can  even  write   python  code,  from  userspace,  that  will  read   and  write  memory  from  the  firmware!  

Iden5fying  IOCTL  Handler  
· Search  for  switch  with  lots  of  cases.   · Or  search  for  WLC_MAGIC  IOCTL=0x14e46c77   · Some5mes  the  handler  is  on  Region  2...  BUT  if  
we  have  an  earlier  or  different  firmware  we   can  find  the  caller.   · If  all  else  fails,  follow  interrupt  handler  path  

Typical  hooking  
String   Original  Code   Point  of  interest   Our  code  

Code  

R&W  LiLle  Demo  

R&W  LiLle  Demo  

Read  &  Write.  Now  what?  
· Dump  Region  2.   · At  this  point  we  can  read  &  write  to  memory  
mapped  registers   · All  sort  of  counters,  stats,  even  packets.   · Most  importantly  we  can  modify  the  code.  
­ And  we  can  do  that  without  having  to  create  new   firmwares  each  5me!  

Handler  code  
  def  createHook(self,  pointCode):                   code  =  (                   "00BF"          #      NOP            ;  placeholder  to  place  the  instruc5ons  smashed  by  the  jmp                   "00BF"          #      NOP            ;  that  the  tracer  injected.                   "07B4"          #      PUSH        {R0--R2}                   "00BF"          #      NOP            ;  placeholder  to  place  a  mov  instruc5on  with  the  desired  register.                   "0449"          #      LDR          R1,  =sub_22CA0                   "0A68"          #      LDR          R2,  [R1]                   "102A"          #      CMP          R2,  #0x10                   "02D0"          #      BEQ          done                   "0432"          #      ADDS        R2,  #4                   "0A60"          #      STR          R2,  [R1]                   "8850"          #      STR          R0,  [R1,R2]                                                       #      done                   "07BC"          #      POP          {R0--R2}                   "7047"          #      BX            LR                   "0000"          #      align                   #  "A02C0200"                   ).decode('hex')                   code  +=  struct.pack("<L",  self.DataAddr)                      code  =  code.replace('\x00\xbf\x00\xbf',  pointCode)                   code  =  code.replace('\x00\xbf',  self.assembleMov())                   return  code  

First  Tracer  
· Given  an  address  and  a  register:  
­ Create  hook  &  hook  handler  code.   ­ Clear  a  storage  area   ­ The  read  from  storage   ­ Usage  as  simple  as:  
        t  =  Tracer(0x026CB4,  'R3')           t.hook()           try:                   while  True:                           print  t.traces()                           5me.sleep(1)           except:                   t.unhook()  

What  about  region  2?  

What  about  region  2?  
· Enter  flash  patch  
­ Set  up  a  remap  table   ­ Comparators   ­ Enable  FPB  through  a  control  register.  
· Basically,  it  is  like  we  are  se·ng  up  the  MMU   to  modify  instruc5ons  on  fetch.  

Flash  patch  opera5on  diagram  

Tracer  again  
· Setup  Hook  handler  as  before  and  then:  
­ Write  remap  table  in  memory   ­ Setup  comparators   ­ Enable  FPB   ­ Houston:  we  have  tracepoints  (kindda).  

Wait  a  minute!  
· Basically,  it  is  like  we  are  se·ng  up  the  MMU   to  modify  instruc5ons  on  fetch.  

How  does  it  work?  

Non--persistent  rootkit?  
· Scenario:  
­ Compromised  device.   ­ Modifies  Region  1  file  on  disk.   ­ Loads  into  the  card.   ­ Restores  Region  1  file.   ­ Exfiltrate  traffic  or  pivot  through  another  network,  
side--channel,  etc.  

Want  even  more  stealth?  
· Make  it  so  that  even  if  someone  can  read  the   firmware  live  from  the  card  memory.  It  cant!  
· Setup  remap  table  so  that  malicious  code  is   hidden.  
· What  about  the  remap  table?  No  problem!   Remapping  the  remap  table  works!  

100%  Stealth?  
· Answer  is  no:  
­ Can't  remap  control  or  comparator  registers.   ­ Have  a  limited  number  of  comparator  and  remap  
entries.   ­ If  remap  control  register  is  disabled  the  whole  
decep5on  falls.     
· S5ll  more  work  to  discover  hidden  code.  

Back  to  our  tool  
· Brief  802.11  review:  
­ 3  Types  of  frames:  
· Data   · Management   · Control  
­ Mgmt  frames  contain  Informa5on  Elements  

IEEE Std 802.11-2007

Usual  associa5on  process   (management  frames)   LOCAL AND METROPOLITAN AREA NETWORKS--SPECIFIC REQUIREMENTS

Figure 5-11--Establishing the IEEE 802.11 association

Associa5on  response  

Code  processing     associa5on  response  

Hook  trace  demo  

THANKS!  

