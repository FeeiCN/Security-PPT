How Many Million BIOSes Would you Like to Infect?  
   Corey  Kallenberg  &  Xeno  Kovah  

About  us  
· We  do  digital  voodoo   · Newly  independent  as  of  January  2015   · The  only  company  focused  primarily  on  PC  
firmware  security  
2  

This  talk  has  2  main  points  
· Because  almost  no  one  applies  BIOS  patches,   almost  every  BIOS  in  the  wild  is  affected  by  at   least  one  vulnerability,  and  can  be  infected  
· The  high  amount  of  code  reuse  across  UEFI   BIOSes  means  that  BIOS  infecPon  is   automatable  and  reliable  
3  

What's  past  is  prologue  
· Some  (mostly--mulP--vendor)  BIOS  vulnerabiliPes   disclosed  since  2012:  
· CERT  VU#127284[0],  912156[1]("Ruy  Lopez"),   255726[1]("The  Sicilian"),  758382[2]  ("Setup   bug"),  291102[4]  ("Charizard"),  552286[5]("King   &  Queen's  Gambit"),  533140[6]  ("noname"),   766164[7]  ("Speed  Racer"),  976132[8]   ("Venamis"),  577140[9]("Snorlax")  
· And  a  bunch  from  others  from  people  like  Intel   Advanced  Threat  Research  that  didn't  get  VU#s  
4  

NOT--SMM  

SMM  

5  

Incursions  (VU#631788)  
· In  2008  ITL  disclosed  an  SMM  vulnerability  where  on  some  Intel   motherboards  SMM  code  called  through  non--SMRAM  funcPon   pointer  table  
­ Low  hanging  fruit  SMM  vulnerability!  
· How  prevalent  are  low  hanging  fruit  SMM  vulnerabiliPes  today?  
hlp://invisiblethingslab.com/resources/bh09usa/Alacking%20Intel%20BIOS.pdf  

· But  how  do  you  hit  what  you  cannot  see?  

· OpPon  1:  Reprogram  firmware  to  disable  SMRAM   protecPon  
­ Disable  TSEG  
­ Disable  SMRRs  

· OpPon  2:  Use  the  power  of  the  dark  side  

· We  did  a  lille  RE  work  to  determine  which  SMM   code  we  could  invoke  from  the  OS  by  wriPng  to  port   0xB2  
· In  this  case,  funcPon  0xDB05EDCC  within  SMM  can   be  reached  by  wriPng  0x61  to  port  0xB2  
· Almost  every  UEFI  system  we  surveyed  used  this   format  to  record  reachable  SMM  code  

· We  found  a  lot  of  these  vulnerabiliPes  
· They  were  so  easy  to  find,  we  could  write  a  ~300  line   IDAPython  script  that  found  so  many  I  stopped  counPng   and  (some)  vendors  stopped  emailing  me  back  

· You're  the  next  contestant  on...  Is  it  vulnerable???  
· Hint:  Hexrays  detects  the  external  memory  accesses   and  colors  them  red.  
­ When  you  see  red,  bad!  

Vendor  Response  
· Many  vendors  didn't  reply  to  our  emails  and/ or  claimed  they  weren't  vulnerable  
­ They  are  definitely  vulnerable  
· Dell  responded  and  is  pushing  patches  for  all   of  our  disclosures  
· Lenovo  also  responded  and  is  releasing   patches  

What's  possible  once  you've  broken   into  BIOS/SMM?  
23  

LightEater  
Hello  my  friends.   Welcome  to  my  home  
in  the  Deep  Dark  
24  

· Tails  says  that  because  it  runs  independent  of  the   operaPng  system,  if  you  have  previously  been   compromised  by  sotware  means  (not  physical   access),  you  should  be  safe...  

Demo:  LightEater  on  MSI  
· DefeaPng  Tails  
26  

· Exploit  delivered  remotely  on  target  Windows  10  system.  
­ No  physical  access  is  necessary   ­ All  you  need  is  a  remote  cmd.exe  with  admin  access  
· Exploit  bypasses  BIOS  flash  protecPon  and  reprograms  the   porPon  of  the  flash  associated  with  System  Management  Mode  

· Malware  that  was  delivered  remotely  to  the  main  OS  (Windows   10)  waits  in  the  background  and  runs  in  System  Management   Mode  
· It  waits  for  your  secrets  to  be  revealed  

· If  you  are  pracPcing  OPSEC,  perhaps  you  have  a  private   email  and  private  key  that  you  only  access  from  the  
"secure"  Tails  so  to  avoid  having  confidenPal  
communicaPons  compromised  

· Using  this  style  of  OPSEC,  the  password  for  your  key   should  never  be  entered  on  your  normal  operaPng   system  (Win10  in  this  case).  
· Since  we  are  in  Tails,  we  are  okay  though...  

· Hence  all  of  your  confidenPal  communicaPons   should  remain  shielded  from  any  malware  that  was   delivered  to  your  Win10  installaPon  
· Using  our  malware,  this  isn't  the  case...  

· Runs  independent  of  any  operaPng  system  you  put  on  the   plavorm  
· Has  access  to  all  of  memory   · Can  steal  all  of  your  secrets  no  maler  what  "secure  
operaPng  system"  you  are  using  

· Tails  also  alempts  to  erase  memory  to   scrub  any  residual  secrets  that  may  be   exposed  to  the  main  operaPng  system  

· Our  malware  sPll  has  access  to  it,  as  we  store  the  secrets  to  non-- volaPle  storage  so  we  can  exfil  at  earliest  convenience  
­ So  even  if  you  were  to  use  Tails  in  offline  mode,  to  try  to  avoid   exfiltraPon  of  secrets,  you  can  sPll  be  owned  

· Time  to  rethink  this...   · Tails  response  to  emails  so  far?  Silence  on  the  wire  

All  fall  before  a  LightEater  
· The  US  Air  Force  made  the  "Lightweight  Portable  Security"  (LPS)   Live  CD1  with  much  the  same  purpose  as  Tails:  
· "LPS  differs  from  tradiPonal  operaPng  systems  in  that  it  isn't   conPnually  patched.  LPS  is  designed  to  run  from  read--only  media   and  without  any  persistent  storage.  Any  malware  that  might  infect   a  computer  can  only  run  within  that  session."  
· "LPS--Public  turns  an  untrusted  system  (such  as  a  home  computer)   into  a  trusted  network  client.  No  trace  of  work  ac7vity  (or  malware)   can  be  wri<en  to  the  local  computer.  Simply  plug  in  your  USB  smart   card  reader  to  access  CAC--  and  PIV--restricted  US  government   websites."  
· Alackers  that  infect  BIOS  will  always  win  against  non--persistent   OSes,  because  they  can  persist  across  reboots,  and  live  in  OS-- independent  SMM  

1hlp://www.spi.dod.mil/lipose.htm  

36  

Where's  the  architectural  flaw?  
· The  fact  that  SMM  can  read/write  everyone's   memory  is  an  x86  architectural  vulnerability  
· No  security  system  (virtualizaPon,  live  CDs,   normal  OSes)  is  secure  unPl  this  is  fixed  
­ We'll  come  back  later  to  how  we  intend  to  fix  it  
38  

This  talk  has  2  main  points  
· Because  almost  no  one  applies  BIOS  patches,   almost  every  BIOS  in  the  wild  is  affected  by  at   least  one  vulnerability,  and  can  be  infected  
· The  high  amount  of  code  reuse  across  UEFI   BIOSes  means  that  BIOS  infecPon  is   automatable  and  reliable  
39  

Further  Tales  from  the  Deep  Dark  
· I'm  going  to  explain  why  infecPng  BIOSes  is  a   lot  easier  than  you  may  have  realized  
40  

InfecPon  Decision  Tree  
Want  to  infect  BIOS  

UEFITool  

No  

FTW?  

Yes  

Publicly  defeated  

Find  hook  

sanity  checks?   No/Don't  Know   points  

Yes  

No--op  checks  

Insert  hooks  

BIOS  Infected  

41  

InfecPon  Decision  Tree  

Want  to  infect  BIOS  
MSI  Demo  

UEFITool  

No  

FTW?  

Yes  

Publicly  defeated  

Find  hook  

sanity  checks?   No/Don't  Know   points  

Yes  

No--op  checks  

Insert  hooks  

BIOS  Infected  

42  

"UEFITool  FTW"  InfecPon  
· As  done  on  the  MSI   · Use  Nikolaj  Schlej's  excellent  UEFITool1  to  replace  the  
module  you  care  about  with  one  that  includes  malicious   funcPonality  
hmm...  

· Reflash  w/  exploit  FTW  

1hlps://github.com/LongSot/UEFITool  

43  

InfecPon  Decision  Tree  

Want  to  infect  BIOS  

HP  Demo  

UEFITool  

No  

FTW?  

Yes  

Publicly  defeated  

Find  hook  

sanity  checks?   No/Don't  Know   points  

Yes  

No--op  checks  

Insert  hooks  

BIOS  Infected  

44  

Sanity  Check  Speed  Bumps  
· Some  vendors  like  HP  build  in  sanity  checks   · DescripPons  of  bypasses  can  be  easily  found  on  the  
net,  and  would  be  developed  quietly  by  anyone  who   actually  cared  enough   · We  created  a  9  byte  signature  for  one  HP  sanity  check   by  following  the  steps  in  a  public  blog  post  
­ And  2  variant  signatures  based  on  looking  at  a  few  models   where  the  signature  didn't  fire  
­ The  3  signature  variants  matched  570/789  HP  BIOS  images  
· Could  be  improved  further,  but  we're  just  making  a  point  
· If  signature  found,  replace  the  last  2  bytes  w/  0x9090   · Goto  previous  slide  
45  

Demo:  LightEater  on  HP  
· For  a  change  of  pace,  let's  see  how  easy  evil-- maid  /  border--guard  /  interdicPon  alacks  are!  
· NIC--agnosPc  exfiltraPon  of  data  via  Intel   Serial--Over--LAN  
· OpPon  to  "encrypt"  data  with  bitwise  rot13  to   stop  network  defenders  from  creaPng  a  "Papa   Legba"  snort  signature  :P  
46  

A  word  about  AMT  SOL  
· Unlike  past  work  for  low  level  networking[10--12],  we   don't  need  to  know  anything  about  the  NIC  
· We  write  to  a  fake  serial  port  that  AMT  creates   · AMT  magically  translates  it  to  Intel's  proprietary  SOL  
protocol  (that  there's  no  Wireshark  dissector  for)  
LightEater  
OOB  Traffic  
SOL  

hlps://sotware.intel.com/en--us/

arPcles/architecture--guide--intel--

acPve--management--technology  

47  

InfecPon  Decision  Tree  

Want  to  infect  BIOS  

Asus  Demo  

UEFITool  

No  

FTW?  

Yes  

Publicly  defeated  

Find  hook  

sanity  checks?   No/Don't  Know   points  

Yes  

No--op  checks  

Insert  hooks  

BIOS  Infected  

48  

"BIOSkit"  InfecPon  
· SomePmes  UEFITool  doesn't  work,  and  you   don't  care  enough  to  RE  why  
· Fall  back  to  the  generic  technique  of  "hook-- and--hop",  just  like  a  normal  bootkit  
­ Just  starPng  earlier,  and  more  privileged  
· You're  more  or  less  guaranteed  that  there's   an  easily  targeted,  uncompressed,  easy--to-- hook  starPng  locaPon  in  the  PEI  core  file  
49  

Reminder  of  how   normal  bootkits  work  
START  
END  
Modified  from  hlp://www.blackhat.com/presentaPons/bh--usa--09/KLEISSNER/BHUSA09--Kleissner--StonedBootkit--SLIDES.pdf   50  

PEI  =  Pre  EFI  IniPalizaPon   PEIM  =  PEI  Module   IPL  =  IniPal  Program  Loader   DXE  =  Driver  ExecuPon  Environment   SMM  =  System  Management  Mode   BDS  =  Boot  Device  Select  

The  UEFI  skeleton  
(that  all  vendors  just  add  their  own  meat  to)  
SMM   Driver  

PEIM  

DXE  IPL   PEIM  

DXE   Driver  
SMM  IPL   Dxe   Driver  

SMM  Dispatcher   SMM  Core  

PEI  Dispatcher   PEI  Core  

DXE  Dispatcher   DXE  Core  

BDS  
To  normal   bootloader  
51  

Minimal  hook  paths  in  UEFI  

Uncompressed   DXE  IPL  

On  Flash  

PEIM  

DXE  Core  

BDS  
To  normal   bootki}ng  
52  

Minimal  hook  paths  in  UEFI  

Uncompressed   DXE  IPL  

On  Flash  

PEIM  

SMM  IPL   Dxe   Driver  

DXE  Dispatcher   DXE  Core  

SMM   Driver  

Reside  in  the   Deep  Dark  

SMM  Dispatcher   SMM  Core  

53  

Demo:  LightEater  on  ASUS  
· Uses  hook--and--hop  from  DXE  IPL  to  SMM   · From  SMM  alacks  Windows  10   · Gets  woken  up  every  Pme  a  process  starts,  
prints  informaPon  about  the  process  
54  

Evidence  of  Scalability  of  InfecPon  
· We  wanted  to  show  that  the  code  an  alacker   wants  to  find  can  easily  be  idenPfied  with   simple  and  stupid  byte  signatures  
· Only  took  a  couple  days  to  develop  
55  

Example:  DXE  to  BDS  transiPon  

· EDK  open  source  code  for   DXE  -->  BDS  transiPon  
· DxeMain.c  

· Equivalent  exact   assembly  found  in  6   separate  vendors'   BIOSes  

  //     //  Transfer  control  to  the  BDS  Architectural  Protocol     //     gBds-->Entry  (gBds);  

  
4C  8B  1D  8A  AF  00  00      mov          r11,  cs:gBDS   49  8B  CB                                                    mov          rcx,  r11   41  FF  13                                                      call        qword  ptr  [r11]  

Yara  rule  =  {4C  8B  1D  [4]  49  8B  CB  41  FF  13}  

  

  

56  

(yes,  I  know,  I  obviously  should  technically  make  it  register--independent,  but  I  don't  care  because  it  worked  well  enough  as  you'll  see  in  a  second  :P)

Analysis  targets  
· Created  YARA  signatures  from  what  the  code  looked  like  on  9  systems   · Key  for  next  slides:  "1,1,2"  =  "PEI_TO_DXEIPL  variant  1,  DXEIPL_TO_DXE  
variant  1,  and  DXE_TO_BDS  variant  2  matched  for  this  system"  

"PEI_TO_DXEIPL.rule"  

4  variants  

"DXEIPL_TO_DXE.rule"  

3  variants  

DXE  IPL  

PEIM  

"DXE_TO_BDS.rule"  

3  variants  

PEI  Core  

DXE  Core  

BDS  

57  

Some  Analysis  Results  

· Teddy  Reed  graciously  provided  the  data  set   from  his  2014  Infiltrate  talk1  
· 2158  BIOS  images  spidered  from  Lenovo,  HP,   Dell,  Gigabyte,  &  Asrock's  websites  
­ Haven't  counted  how  many  individual  models  
· Signature  scanning  results:  
­ PEI_TO_DXEIPL:  3  misses  (1  model)   ­ DXEIPL_TO_DXE:  0  misses   ­ DXE_TO_BDS:  4  misses  (2  models)  

1"AnalyPcs,  and  Scalability,  and  UEFI  ExploitaPon  (Oh  My)"  ­  Teddy  Reed  

hlp://prosauce.org/storage/slides/Infiltrate2014--AnalyPcs--Scalability--UEFI--ExploitaPon.pdf  

58  

For  reading  at  your  leisure  
(from  Teddy  Reed's  data  set)   (2158  images,  7  misses  from  3  signatures)  

Lenovo  (442  images)   --  PEI_TO_DXEIPL:  0  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  2  misses   HP  (388  images)   --  PEI_TO_DXEIPL:  0  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  0  misses   Dell  (381  images)   --  PEI_TO_DXEIPL:  3  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  2  misses  

Gigabyte  (347  images)   --  PEI_TO_DXEIPL:  0  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  0  misses   Asrock  (596  images)   --  PEI_TO_DXEIPL:  0  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  0  misses  

59  

For  reading  at  your  leisure  
(from  a  completely  different  LegbaCore  data  set)   (1003  images,  5  misses  from  3  signatures)  

Lenovo  (213  images)   --  PEI_TO_DXEIPL:  0  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  0  misses   HP  (401  images)   --  PEI_TO_DXEIPL:  0  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  0  misses   Dell  (348  images)   --  PEI_TO_DXEIPL:  0  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  0  misses  

LG  (13  images)   --  PEI_TO_DXEIPL:  0  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  1  misses   Asus  (13  images)   --  PEI_TO_DXEIPL:  2  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  2  misses   Acer  (15  images)   --  PEI_TO_DXEIPL:  0  misses   --  DXEIPL_TO_DXE:  0  misses   --  DXE_TO_BDS:  0  misses  

60  

HP  Example  

1,1,2  

1,1,2  

1,1,2  

1,1,2  

1,1,2  

1,1,2  

3,1,3  

3,1,3  

1,1,2  

1,1,2  

1,1,2  

1,1,2  

61  

ExtrapolaPon  to  millions  

From  hlps://www.gartner.com/newsroom/id/2960125  

62  

ExtrapolaPon  to  millions  
· So  if  almost  no  one  applies  BIOS  vulnerability   patches...  
· And  if  my  Pny  set  of  signatures  can  reliably   find  hook  points  and  disable  sanity  checks  in   the  machines  HP  is  currently  selling...  
· And  if  HP  shipped  ~15M  PCs  in  Q4  2014...   · Then  we  would  understand  that  millions  of  
these  BIOSes  could  be  reliably  infected,  yes?  
63  

Aspire  S7--392  

Acer  

TravelMate  B113  

TravelMate  P245  

Veriton  Z26600G  

2,2,1  
TravelMate  P255  

2,2,1  
TravelMate  P455  

2,2,1  
TravelMate  P645  

2,2,1  
Veriton  Z4810G  

2,2,1  
Veriton  M4630G  

2,2,1  
Veriton  X2630G    

2,2,1  
Veriton  M2631  

2,2,1  
Veriton  N4630G  

2,2,1  

2,2,1  

2,2,1  

2,2,1  
64  

ASUSPRO  ADVANCED   B53S  

Asus   BU201  

B451JA  

B400A  

miss,2,1  
ASUSPRO  ESSENTIAL   P53E  

2,2,1  
PU551JH  

2,2,1  
P751JA  

2,2,1  
P55VA  

miss,2,1  
ESC2000  G2  

2,2,1  
ESC4000  G2  

2,2,1  
TS500--E8--PS4  

2,2,1  
RS500--E8--RS4  

2,2,1  

2,2,1  

4,2,miss  

4,2,miss  
65  

PC  Gram  13Z940  

LG  

PC  Gram  14Z950  

PC  Gram  15Z950  

Ultra  PC  14U530  

2,1,1  
Ultra  PC  15U530  

4,1,3  
Ultra  PC  15U340  

4,1,3  
15N540  

2,1,1  
22V240  

2,1,1  
Tab  Book  10T550  

4,1,1  
Tab  Book  11T740  

2,1,1  
A75CV  

4,1,1  
A75PS  

4,1,miss  

2,1,1  

2,2,1  

2,2,1  

It  was  about  this  Pme  I  got  really  Pred  of  making  these  slides  and  manually  downloading  BIOSes  ;)  

A  lille  good  news  before  we  go  
· Were  working  with  vendors  like  Dell  to  do   security  assessments  to  find  and  fix  issues   before  they  ship  on  new  systems.  Also   working  with  Lenovo  and  other  vendors.  
67  

A  lille  good  news  before  we  go  
· We're  also  working  with  Intel  to  try  to  create  the   first  commercial--grade  SMM  isolaPon  
· Intel  has  the  ability  for  their  hardware   virtualizaPon  to  jail  SMM  
· We  will  then  work  with  BIOS  vendors  to   incorporate  the  technology  into  shipping  systems  
· End  result  will  be  that  even  if  alackers  break  into   SMM,  they  can't  read/write  arbitrary  memory  
­ And  we  could  detect  alackers  through   measurements.  
68  

Conclusions  
69  

This  talk  has  2  main  points  
· Because  almost  no  one  applies  BIOS  patches,   almost  every  BIOS  in  the  wild  is  affected  by  at   least  one  vulnerability,  and  can  be  infected  
­ "All  that  is  necessary  for  the  triumph  of  evil  is  that   good  men  do  nothing"  ­  Edmund  Burke  
· The  high  amount  of  code  reuse  across  UEFI   BIOSes  means  that  BIOS  infecPon  is   automatable  and  reliable  
70  

What  we  showed  
· All  systems  we  have  looked  at  contain  Incursion   vulnerabiliPes  that  allow  breaking  in  to  SMM  
· Incursion  vulnerabiliPes  can  be  found  programaPcally   · The  LightEater  SMM  alacker  can  perform  any  a<ack  that  is  
available  to  lesser  alackers  
­ We  showed  stealing  GPG  keys/messages  from  memory  (on   MSI),  data  exfiltraPon  over  the  network  (on  HP),  Windows   kernel  rootkit  behavior  (on  Asus)  
· Showed  how  a  physical  BIOS  alack  can  be  done  in  2   minutes  by  an  unskilled  accomplice  (maid/border  guard)  
· Homogeneity  in  UEFI  BIOSes  for  the  things  an  alacker   cares  about.  CreaPng  signatures  from  ~10  BIOSes  is   sufficient  to  find  matches  on  thousands  of  images  (which   relate  to  millions  of  shipped  machines)  
71  

Conclusions  
· 2  guys  +  4  weeks  +  $2k  =  MulPple  vendors'  BIOSes  infected,  with   mulPple  infecPon  capabiliPes  
· One  hand  (purposely)  Ped  behind  our  backs:  Didn't  use  special   debug  hardware.  Serial  prints  only!  
· Do  you  really  think  that  Five  Eyes  are  the  only  ones  who  have   developed  capabiliPes  in  this  space?  
· "Absence  of  evidence  is  not  evidence  of  absence"   · It's  7me  to  start  checking  your  firmware  
­ Stop  giving  firmware  alackers  a  free  pass  and  indefinite  invisibility  
· It's  7me  to  start  patching  your  BIOSes  
­ Demand  the  capability  from  your  patch  management  sotware  
· It's  7me  to  demand  be<er  BIOS  security  from  your  OEM  
­ We'll  eventually  make  a  name--and--shame  list  of  vendors  who  are   perennially  leaving  their  customers  open  to  BIOS  alacks  
72  

Pour  a  40  on  the  curb     for  the  PCs  we've  lost...  
Toshiba  Tecra...   Short  circuited  during  disassembly   Rest  in  pieces  buddy  
73  

Contact  
· Twiler:  @coreykal,  @xenokovah,  @legbacore   · Email:  {corey,  xeno}@legbacore.com   · hlp://legbacore.com/Contact.html  for  our  GPG  keys  
  
· As  always,  go  check  out  OpenSecurityTraining.info  for  the  free   classes  from  Corey  and  Xeno  on  x86  assembly  &  architecture,   binary  executable  formats,  stealth  malware,  and  exploits.  
· Then  go  forth  and  do  cool  research  for  us  to  read  about!  
74  

Throwaway  Demo  
75  

Verdict  
76  

References  
[0]  Alacking  Intel  BIOS  ­  Rafal  Wojtczuk  and  Alexander  Tereshkin,  July  2009 hlp://invisiblethingslab.com/resources/bh09usa/Alacking%20Intel%20BIOS.pdf     hlp://www.kb.cert.org/vuls/id/127284    (CERT  never  posted?!)   [1]  DefeaPng  Signed  BIOS  Enforcement  ­  Kallenberg  et  al.,  Sept.  2013   hlp://conference.hitb.org/hitbsecconf2013kul/materials/D1T1%20--%20Kallenberg, %20Kovah,%20Bulerworth%20--%20DefeaPng%20Signed%20BIOS %20Enforcement.pdf   hlp://www.kb.cert.org/vuls/id/912156   hlp://www.kb.cert.org/vuls/id/255726  (CERT  hasn't  posted  yet  despite  request)   [2]  All  Your  Boot  Are  Belong  To  Us  (MITRE  porPon)  ­  Kallenberg  et  al.  ­  Mar.  2014,   delayed  from  publicly  disclosing  potenPal  for  bricking  unPl  HITB  at  Intel's  request   hlps://cansecwest.com/slides/2014/AllYourBoot_csw14--mitre--final.pdf     hlp://www.kb.cert.org/vuls/id/758382   [3]  All  Your  Boot  Are  Belong  To  Us  (Intel  porPon)  ­  Bulygin  et  al.  ­  Mar.  2014   hlps://cansecwest.com/slides/2014/AllYourBoot_csw14--intel--final.pdf     [4]  Setup  for  Failure:  DefeaPng  UEFI  Secure  Boot  --  Kallenberg  et  al.,  Apr.  2014   hlp://syscan.org/index.php/download/get/6e597f6067493dd581eed737146f3a^/ SyScan2014_CoreyKallenberg_SetupforFailureDefeaPngSecureBoot.zip   hlp://www.kb.cert.org/vuls/id/291102  (CERT  hasn't  posted  yet  despite  request)     
77  

References  
[5]  Extreme  Privilege  EscalaPon  on  UEFI  Windows  8  Systems  ­  Kallenberg  et  al.,  Aug.   2014   hlps://www.blackhat.com/docs/us--14/materials/us--14--Kallenberg--Extreme--Privilege-- EscalaPon--On--Windows8--UEFI--Systems.pdf     hlp://www.kb.cert.org/vuls/id/766164     [6]  Alacks  against  UEFI  Inspired  by  Darth  Venamis  and  Speed  Racer  ­  Wojtczuk  &   Kallenberg,  Dec.  2013   hlps://bromiumlabs.files.wordpress.com/2015/01/alacksonuefi_slides.pdf   hlp://www.kb.cert.org/vuls/id/533140     [7]  Speed  Racer:  ExploiPng  an  Intel  Flash  ProtecPon  Race  CondiPon  ­  Kallenberg  &   Wojtczuk,  Dec.  2013   hlps://frab.cccv.de/system/alachments/2565/original/speed_racer_whitepaper.pdf     hlp://www.kb.cert.org/vuls/id/912156     [8]  Alacking  UEFI  Boot  Script  ­  Wojtczuk  &  Kallenberg,  Dec.  2013   hlps://frab.cccv.de/system/alachments/2566/original/venamis_whitepaper.pdf     hlp://www.kb.cert.org/vuls/id/552286     [9]  "Snorlax"  bug  ­  Cornwell,  et  al.,  Dec.  2013   hlps://frab.cccv.de/system/alachments/2566/original/venamis_whitepaper.pdf     hlp://www.kb.cert.org/vuls/id/577140  (CERT  hasn't  posted  yet  despite  request)  
78  

References  
[10]  Deeper  Door  ­  Embleton  &  Sparks,  Jul.  2008  ­     hlp://clearhatconsulPng.com/DeeperDoor     [11]  Can  you  sPll  trust  your  network  card?  --  Duflot,  et  al.,  Mar.  2010  --   hlp://www.ssi.gouv.fr/uploads/IMG/pdf/csw--trustnetworkcard.pdf     [12]  The  Jedi  Packet  Trick  takes  over  the  Deathstar  --  Arrigo  Triulzi,  Mar.  2010   www.alchemistowl.org/arrigo/Papers/Arrigo--Triulzi--CANSEC10--Project--Maux--III.pdf     [13]  "Mebromi:  the  first  BIOS  rootkit  in  the  wild"     hlp://www.webroot.com/blog/2011/09/13/mebromi--the--first--bios--rootkit--in--the-- wild/     [14]  "NSA  Speaks  Out  on  Snowden  Spying",  Dec  2012 hlp://www.cbsnews.com/news/nsa--speaks--out--on--snowden--spying/     [15]  "To  Protect  And  Infect"  --  Jacob  Applebaum,  Dec.  2012   hlps://www.youtube.com/watch?v=vILAlhwUgIU  (contains  leaked  classified  NSA   documents)   [16]  "U.S.  Gas,  Oil  Companies  Targeted  in  Espionage  Campaigns",  Jan.  2013 hlp://threatpost.com/u--s--gas--oil--companies--targeted--in--espionage--campaigns/ 103777       
79  

References  
[X]  See  all  the  related  work  we're  aware  of   here: hlp://Pmeglider.com/Pmeline/ 5ca2daa6078caaf4       
80  

Backup  
· "Should  you  worry  when  the  skullhead  is  in   front  of  you?  Or  is  it  worse  because  it's  always   waiPng,  where  your  eyes  don't  go?"    
­ They  Might  Be  Giants  
81  

