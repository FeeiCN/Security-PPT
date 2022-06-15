TWO  SIGMA  
Thunderstrike 2: Sith Strike  
   Trammell  Hudson  ­  Two  Sigma   Xeno  Kovah,  Corey  Kallenberg  ­  LebgaCore  
1  
  

About  us  ­  Trammell  Hudson  
· I  like  to  take  things  apart.  
­ Magic  Lantern:  firmware  for  Canon  DSLR  cameras   ­ Ghosts  in  the  ROMs:  Easter  Eggs  in  old  devices   ­ Thunderstrike:  First  firmware  rootkit  for  Macs  
· Two  Sigma  is  a  high  tech  investment   management  firm  and  we're  concerned  about   the  {soQware,firmware,hardware,etc}  security   of  our  systems.  
2  

About  us  --  LegbaCore  
· We  do  digital  voodoo   · Newly  independent  as  of  January  2015   · The  only  company  focused  primarily  on  x86  
firmware  &  peripheral  firmware  (HD/NIC/ GPU/EC/ME)  security  
3  

This  talk  has  1  main  point  
· Apple  has  not  been  as  responsive,  or  as   accurate,  as  other  PC  vendors  in  responding  to   industry--wide  nocficacons  of  firmware   vulnerabilices.  Consequently  Mac  users  have   been  leQ  vulnerable  to  aeacks  that  have  been   fixed  on  other  x86--based  PCs.  
4  

Everything  old  is  new  again  (to  Apple)!  

Vulnerability  
VU  #976132   (Darth  Venamis)  

Private  CERT/CC   (and  USRT  once   created)  Disclosure   Date  
Sept.  2014  

Public  Disclosure   Date  
Dec.  2014  

Macs  Vulnerable  as  of   Patches  available  as  

Conference  

of  conference  date?  

Submission?  

Yes  

Parcal  fix  released  

6/30/2015  

VU  #577140  

Aug.  2013  &  N/A   May  2015  

Yes  

(Snorlax  &  Prince  Harming)  

Yes  ­  released   6/30/2015  

VU#  766164  

May  2014  

Dec.  2014  

Yes  

No  

(Speed  Racer)  

VU  #255726   (The  Sicilian)  
VU#  758382   Setup  UEFI  Variable  Bug  

Approx.    May  2013   (we  don't  have  the   emails  anymore)  
Intel  --  ?   Us  ­  Sept.  2013  

Sept.  2013   Mar.  2014  

Some  Yes,  scll  

No  

invescgacng  

No  (they  don't  have   N/A   this  UEFI  variable)  

5  

Case  study:  Speed  Racer   CERT  VU#766164  
· Because  it's  a  hardware  race  condi,on!  Get  it?!  
6  

Case  study:  Speed  Racer   CERT  VU#766164  
(Picture  retrieved  Jun  12th  2015)  
No  penalty  for     being  wrong...  
If  you  don't  hold  your  vendor   accountable:  silence  
7  

Case  study:  Speed  Racer   CERT  VU#766164  
· Sam  Cornwell,  John  Bueerworth,  and  Rafal   Wojtczuk  all  independently  realized  the   potencal  for  a  race  condicon  in  the   BIOS_CNTL.BLE  (BIOS  Lock  Enable)  proteccon   bit.  Corey  then  actually  proved  it  with  a  PoC  
· Disclosed  to  Intel  &  CERT/CC  in  May  2014   · Disclosed  publicly  at  31C3  in  Dec.  2014  
8  

Case  study:  Speed  Racer   CERT  VU#766164  
· Hardware  race  condicon  in  the  interaccon   between  the  CPU  &  flash  programming  hardware    
· The  oldest  BIOS  proteccon  bit,  BIOS_CNTL.BLE   (BIOS  Lock  Enable),  can  always  be  bypassed  on   Intel  systems  
· Intel  added  a  new  bit,  BIOS_CNTL.SMM_BWP   that  fixes  this,  but  BIOS  makers  need  to  design   for  it  and  enable  it  
· Protected  Range  Registers  (PRRs)  also  prevent   wricng  to  the  BIOS,  even  if  the  race  is  successful  
9  

MacMini7,1  (newest  available)  Proteccons  
OS--resident  Aeacker  

BIOS_CNTL. BLE  bit  
BIOS_CNTL.   SMM_BWP  bit  
Protected   Range   Registers  

ACCESS  DENIED  TO  NON--SMM  

ACCESS  DENIED  TO  NON--SMM  

ACCESS  DENIED   EVEN  TO  SMM  

ACCESS  DENIED   EVEN  TO  SMM  

18E000   190000   610000   632000   7FFFFF  

Firmware  
Flash     Addr.  

UEFITool   says  
"padding"?  

Code  &  Stuff  

EFI  Variables   Code  &  Stuff  
10  

MacMini7,1  (newest  available)  Proteccons  
OS--resident  Aeacker  

BIOS_CNTL   BLE  bit  
BIOS_CNTL   SMM_BWP  bit  
Protected   Range   Registers  

ACCESS  DENIED  TO  NON--SMM  
LOL!  J/K     APPLE  DOESN'T  USE  THIS!  
ACCESS  DENIED   EVEN  TO  SMM  

ACCESS  DENIED   EVEN  TO  SMM  

18E000   190000   610000   632000   7FFFFF  

Firmware  
Flash     Addr.  

UEFITool   says  
"padding"?  

Code  &  Stuff  

EFI  Variables   Code  &  Stuff  
11  

MacMini7,1  (newest  available)  Proteccons  
OS--resident  Aeacker  

BIOS_CNTL   BLE  bit  
BIOS_CNTL   SMM_BWP  bit  
Protected   Range   Registers  

LOL!  J/K  APPLE  DOESN'T  USE  THIS  EITHER!   But  if  they  DID  try  to  use  it...  
w/o  SMM_BWP  it  would  be  architecturally  vulnerable  to  Speed  Racer  :)  

ACCESS  DENIED   EVEN  TO  SMM  

ACCESS  DENIED   EVEN  TO  SMM  

18E000   190000   610000   632000   7FFFFF  

Firmware  
Flash     Addr.  

UEFITool   says  
"padding"?  

Code  &  Stuff  

EFI  Variables   Code  &  Stuff  
12  

MacMini7,1  (newest  available)  Proteccons  
OS--resident  Aeacker  

BIOS_CNTL   BLE  bit  
BIOS_CNTL   SMM_BWP  bit  
Protected   Range   Registers  

ACCESS  DENIED   EVEN  TO  SMM  

ACCESS  DENIED   EVEN  TO  SMM  

18E000   190000   610000   632000   7FFFFF  

Firmware  
Flash     Addr.  

UEFITool   says  
"padding"?  

Code  &  Stuff  

EFI  Variables   Code  &  Stuff  
13  

So  what  happens  when  we  write  to   the  gaps?  
· heps://youtu.be/kOrj323ddOQ  
14  

Case  study:  Speed  Racer   CERT  VU#766164  
· We  haven't  seen  any  Macs  that  follow  the   Intel's  best  praccces  and  use   BIOS_CNTL.SMM_BWP  
· Apple  said  they're  "not  affected"  by  Speed   Racer...And  in  a  strict  sense,  that's  true... because  there's  no  need  to  uclize  an  exploit   to  bypass  a  proteccon  mechanism  when  the   vendor  doesn't  even  use  the  proteccon  was   never  available  to  begin  with!  
15  

Patch  Status:  Unpatched/ Architecturally  vulnerable  
· If  Apple  just  used  the  BIOS_CNTL.SMM_BWP   bit  (like  other  vendors),  it  could  make  it  so   that  you  need  to  first  break  into  SMM  before   you  can  smash  stuff  and  brick  the  system  
16  

Case  study:  Darth  Venamis   CERT  VU#976132  
· (Somecmes  mis--referred  to  as  the  "Dark  Jedi"  aeack)  
· So  named  by  Rafal  Wojtczuk  because  Darth  Plagueis   defeated  Darth  Venamis,  and  put  him  into  a  death-- like  sleep/coma  to  study  midi--chlorians  
  

Venamis  

Plagueis  

17  

Case  study:  Darth  Venamis   CERT  VU#976132  
· When  an  Intel  system  goes  into  a  low--power   mode,  such  as  ACPI  S3  sleep,  some  of  the  BIOS   protec,on  bits  become  unlocked  the  same   way  they  would  if  the  system  is  restarcng  
· Disclosed  to  CERT/CC  and  UEFI  Security   Response  Team  (USRT)  in  Sept.  2014  
· Made  public  at  31C3  in  Dec.  2014  [6][8]  
18  

Case  study:  Darth  Venamis   CERT  VU#976132  
· For  some  reason,  with  this  VU#  CERT  stopped  liscng   the  vendors  they  had  reached  out  to  that  said  they   weren't  vulnerable,  and  those  that  they  reached  out   to  that  didn't  respond  
· That's  the  whole  reason  we  liked  using  CERT!  :--/  
(Picture  retrieved  Jun  12th  2015)  
19  

Case  study:  Darth  Venamis   CERT  VU#976132  
· So  we  don't  know  whether    
­ CERT  didn't  contact  them   ­ Apple  didn't  respond   ­ Apple  responded  and  said  they  were  not  
vulnerable  
· We  asked  CERT  which  was  the  case,  and  CERT   never  replied  
20  

BIOS_CNTL   BLE  bit  
BIOS_CNTL   SMM_BWP  bit  
Protected   Range   Registers  

The  Venamis  Effect  
OS--resident  Aeacker  

Goodbye  cruel  world!  

Goodbye     cruel  world!  

18E000   190000   610000   632000   7FFFFF  

Firmware  
Flash     Addr.  

UEFITool   says  
"padding"?  

Code  &  Stuff  

EFI  Variables   Code  &  Stuff  
21  

BIOS_CNTL   BLE  bit  
BIOS_CNTL   SMM_BWP  bit  
Protected   Range   Registers  

The  Venamis  Effect  
OS--resident  Aeacker  

18E000   190000   610000   632000   7FFFFF  

Firmware  
Flash     Addr.  

UEFITool   says  
"padding"?  

Code  &  Stuff  

EFI  Variables   Code  &  Stuff  
22  

#PrinceHarming  
See  the  whitepaper  for  why  Snorlax  is  here  ;)  
23  

#PrinceHarming  
· Pedro  Vilaca  (@osxreverser)  saw  the  abstract  for  this  talk.  He   correctly  inferred  based  on  the  ctle  that  it  would  have  to  do  with   Macs'  containing  the  Venamis  vulnerability  
· May  29th  2015,  Pedro  posted[14]  that  while  he  was  invescgacng   Venamis,  he  found  an  easier  aeack:  Just  put  the  system  to  sleep,   and  the  firmware  proteccon  registers  are  unlocked  on  wake!  
­ Named  #PrinceHarming  by  Kace  Moussouris  (@k8em0)   ­ We  have  seen  this  problem  before,  in  CERT  VU#577140,  but  hadn't  
actually  seen  it  yet  on  Macs.  Because  it  turned  out  Xeno's  MBP11,2   wasn't  vulnerable  (even  though  it  was  vulnerable  to  Venamis.)  
· So  basically  Pedro  accidentally  dropped  a  Mac  firmware   vulnerability  0day  :)  
­ The  real  quescon  is,  why  are  there  trivial--to--exploit  Apple  firmware   0days  just  laying  around  out  in  the  open?  
24  

Patch  Status  
· On  June  30th  2015  Apple  released  an  update[19]   for  24  models  to  patch  Venamis  &  Prince   Harming  (basically  for  everything  since  2011)  
­ iMac  (27--inch,  Mid  2011)  ("iMac12,1")  uncl  latest     ­ ("iMac15,1")  Mac  Mini  (Mid  2011)  with  Intel  graphics  
("Macmini5,1")  uncl  latest  ("Macmini7,1")     ­ MacBook  Air  (11--inch,  Mid  2011)  ("MacBookAir4,1")  
uncl  latest  ("MacBookAir7,1")     ­ MacBook  Pro  (13--inch,  Late  2011)  ("MacBookPro8,1")  
uncl  latest  ("MacBookPro12,1")     ­ MacBook  (Early  2015)  ("MacBook8,1")     ­ Mac  Pro  (Late  2013)  ("MacPro6,1")  
25  

What  wasn't  patched  
· Security  update  2015--001  sets  only  sets  the   PRRs  and  locks  FLOCKDN  in  PEI  before  the  S3   bootscript  is  interpreted  
· Therefore  an  aeacker  can  scll  use  Venamis  to   infect  SMM  
­ E.g.  aeacker  can  scll  bypass  SMM_BWP  if  Apple   ever  bothers  to  use  this  proteccon  mechanism  
· We  informed  Apple  of  this  addiconal  issue   prior  to  the  release  of  the  update  
26  

Reminder:  This  talk  has  1  main  point  
· Apple  has  not  been  as  responsive,  or  as   accurate,  as  other  PC  vendors  in  responding  to   industry--wide  nocficacons  of  firmware   vulnerabilices.  Consequently  Mac  users  have   been  leQ  vulnerable  to  aeacks  that  have  been   fixed  on  other  x86--based  PCs.  
27  

ENOUGH!   GET  TO     THE  REAL  
ATTACKS!  
28  

Aeacking  Apple  firmware  
· Remote  Apple  BIOS  infeccon   · Remote  Thunderbolt  OROM  reflash   · Thunderstrike  2  :  Sith  Strike  
­ A  first  of  it's  kind  firmwormTM  :P  
29  

Remote  Apple  BIOS  infeccon  
· Thunderstrike  1  required  physical  presence   · We  wanted  to  make  it  clear  physical  presence  
is  not  required  to  infect  Mac  firmware  
30  

Remote  Apple  BIOS  infeccon  

1

Get  Remote  Root  Shell     (leQ  as  an  exercise  to  the  reader[19])  

Install  whitelisted  

arbitrary--read/write  

kernel  Driver    

2  

(e.g.  DirectHW.kext)  

Userspace   Root  
Kernel  
BIOS  (SPI  flash)  

Use  some  old  vuln  

3  

(like  Venamis)  to  pop   the  lock  on  flash  &  

write  to  it  

31  

Remote  Apple  BIOS  infeccon  

1

Get  Remote  Root  Shell     (leQ  as  an  exercise  to  the  reader[19])  

Install  whitelisted  

arbitrary--read/write  

kernel  Driver    

2  

(e.g.  DirectHW.kext)  

Userspace   Root  
Kernel  
BIOS  (SPI  flash)  

Use  some  old  vuln  

3  

(like  Venamis)  to  pop   the  lock  on  flash  &  

write  to  it  

Rule  happily  ever  aQer  in  the  Deep  Dark,     knowing  no  one  ever  checks  firmware  
32  

Remote  Apple  BIOS  infeccon  demo  
33  

Remote  OROM  reflash    
· Snare's  talk[20]  &  Thunderstrike  1  required   you  to  have  physical  control  of  the  adapter   you  want  to  infect,  and  then  boot  into   FreeDOS  to  run  a  Broadcom  .exe  to  update   the  OROM  with  a  malicious  payload  
· We  wanted  to  make  it  clear  physical  control   of  the  Ethernet  adapter  is  not  required  to   infect  Thunderbolt  to  Ethernet  OROMs  
34  

Remote  Apple  OROM  infeccon  

1

Get  Remote  Root  Shell     (leQ  as  an  exercise  to  the  reader[19])  

Install  a  modified   version  of  the  Linux   "tg3"  Broadcom  NIC   2   driver  

Userspace   Root  
Kernel  
BIOS  (SPI  flash)  

Write  code  into  the  OROM   that  will  execute  in  the   context  of  the  BIOS  at  next   boot  

35  

Remote  OROM  reflash  demo  
36  

Thunderstrike  2  
· A  unique,  never  before  shown  "firmworm."  
­ Lives  only  in  firmware  
· Your  only  opcon  for  deteccon  is  firmware  forensics  
­ (no  one  does  firmware  forensics)  
­ Jumps  from  OROMs  to  BIOSes  and  back  again  
37  

Thunderstrike  2  
Malicious  adapter  connected  
38  

Thunderstrike  2  
System  rebooted   Venamis  aeack  pending  
39  

Thunderstrike  2  
System  put  to  sleep     at  some  point...  
40  

Thunderstrike  2  
System  wakes  up   BIOS  unlocked.  BIOS  infected  
41  

Thunderstrike  2  
Malicious  adapter  goes  away   ...  
42  

Thunderstrike  2  
...   Someday  a  young  &  naïve    
new  adapter  arrives  
43  

Thunderstrike  2  
BIOS  infects  all  adapters   It  comes  in  contact  with  
44  

Thunderstrike  2  
Apprencce  leaves   to  infect  others  
45  

Thunderstrike  2  
Repeat  
46  

Thunderstrike  2  
· DEMO  VIDEO  
47  

Conclusions  
48  

The  dark  side  of  the  Force  is  a  pathway  to  many   abili,es  some  consider  to  be  unnatural  
49  

Reminder:  This  talk  has  1  main  point  
· Apple  has  not  been  as  responsive,  or  as   accurate,  as  other  PC  vendors  in  responding  to   industry--wide  nocficacons  of  firmware   vulnerabilices.  Consequently  Mac  users  have   been  leQ  vulnerable  to  aeacks  that  have  been   fixed  on  other  x86--based  PCs.  
50  

Time  between  reporcng  and  patching  
· Unknown  disclosure:  
· OROM  bootki·ng:  (3  years  and  councng)  Never  patched  
· Responsible  disclosure:  
· Thunderstrike  1:  1.5  years   · Speed  Racer:  (1+  year  &  councng)  Never  patched   · The  Sicilian:  Scll  invescgacng  exactly  which  systems  it  
was  patched  on  and  when   · Venamis:  parcal  patch  aQer  9  months  (1  month  aQer  
Prince  Harming)  
· Full  disclosure:  
­ Prince  Harming:  1  month  
51  

Failing  to  protect  customers  
· All  firmware  vendors  have  vulnerabilices   · Some  vendors  are  very  good  about  patching  
public  vulnerabilices  and  audicng  for  non-- public  bugs   · Apple  is  not   · Apple  leaves  their  customers  vulnerable  to   already--public  issues  for  long  periods  of  cme   · (Uncl  now)  Apple  got  away  with  reporcng   they  are  not  vulnerable  when  they  are  
52  

Apple  is  infectable  like  everyone  else  
· Yes,  using  a  Mac  is  a  good  way  to  avoid  the   sta,s,cal  majority  of  basic  crimeware  
­ Yet  crimeware  scll  exists  for  the  Mac    
· Using  a  Mac  will  not  protect  you  from  even   moderately  sophisccated  adversaries  
­ Even  HackingTeam  has  a  UEFI  implant!  
· And  now  it's  "open  source"  so  everyone  else  does  too!  
· We  have  shown  numerous  ways  that  Apple   firmware  can  be  infected  
· And  no  one  ever  checks  their  firmware  
53  

54  

Obligatory  Band--Aid  
· The  real  fix  is  to  eliminate  vulnerabilices  at  the   source.  That's  what  LegbaCore  tries  to  work  with   vendors  to  do.  
· Failing  that...   · A  basic  OROM  dumper  will  be    available  from  
Trammell  @  github.com/osresearch/ b57tool · A  basic  OROM  integrity  checker  is  available  from   Legbacore  @  github.com/legbacore
­ Only  tested  with  our  devices,  so  if  you  see  a   difference  it  could  be  a  false  posicve  to  start  with.  Or   it  could  be  real.  Send  it  to  us  in  either  case  :)  
55  

Contacts  &  Quescons  
· Twieer:  @qrs,  @xenokovah,  @coreykal   · Email:  hudson@trmm.net,  {xeno,corey}@legbacore.com   · heps://trmm.net/PGP  &  hep://legbacore.com/Contact.html                
for  our  GPG  keys  
   · Go  check  out  OpenSecurityTraining.info  for  the  free  classes  from  Corey  
and  Xeno  on  x86  assembly  &  architecture,  binary  executable  formats,   stealth  malware,  and  exploits.   · Then  go  forth  and  do  cool  research  for  us  to  read  about!  
56  

57  

Case  study:  King  &  Queen's  Gambits   CERT  VU#552286  
· "Extreme  Privilege  Escalacon  on  Windows  8/UEFI   Systems"  BlackHat  USA  2014  Kallenberg  et  al.  
· What's  in  a  name?  It's  also  Extreme  Privilege   Escalacon  on  Linux  and  Mac  OS  X  systems!  
(Picture  retrieved  Jun  12th  2015)  
58  

History  lesson...  
· One  VU#  for  two  discnct  vulnerabilices   · Found  by  Corey  Kallenberg  Nov./Dec.  2013   · Disclosed  to  Intel/CERT  Nov./Dec.  2013  
­ Intel  took  the  lead  on  coordinacon  since  they  have   more  vendor  contacts  than  CERT  
· Intel  patched  the  EDK2  open  source  reference   code  Jan.  2014  
­ Intel  called/emailed  vendors  in  the  Jan.--May   cmeframe  
· Disclosed  publicly  at  BlackHat  in  Aug.  2014  
59  

(Back  when  we  were  at  MITRE)   (Newly  independent)  

<Dec  2013>   Psst...dear  firmware  makers...exploitable   bugs  found...  Here  are  the  details,  go  fix  it  
...   <Aug.  2014>   Dear  everyone  in  the  world:   Vulnerabilices  found  in  UEFI!     Apply  vendor  patches!  
...   <CanSecWest  Mar.  2015>  
We  want  to  "work  with  you"  to  improve   firmware  security.  Please  let  us  know  if  
we  have  any  vulnerabilices.  
Did  you  fix  all  the  exiscng  vulnerabilices   we've  disclosed?  
We  aren't  vulnerable  to  any  of  that.  

Okaaaay....  
60  

<Apr.  2015  Confimed  they  have  Venamis  vuln>   <May  2015  #PrinceHarming>  
<Jun.  2015  #PrinceHarming  &  Venamis  finally  patched>   <Jul.  2015>  
OK,  we  did  some  more  tests,  and  confirmed   you're  definitely  vulnerable  to  VU#552286  
We  don't  believe  you.     We  don't  use  that  code.  Prove  it.  
Sigh,  we're  really  not  interested  in  doing   more  free  work  for  you.  You  should  have   your  engineers  read  the  23  page   whitepaper  we  posted  describing  the  two   issues.  Everyone  else  who  read  was  able  to   understand  how  to  patch  their  systems.  
We  don't  believe  you.  You  haven't  given   us  any  proof.  You  could  just  be  blustering.  
61  

I  FIND  YOUR  LACK  OF  FAITH  

DISTURBING  

62  

<Jul.  2015>   SIGH!       *  Here  is  a  PoC   *  Set  a  breakpoint  at  0xFFF15245  in  your   hardware  debugger.     *  The  second  cme  the  breakpoint  fires,  look   at  the  arguments  to  this  memcpy  funccon.     *  Observe  the  arbitrary  size  memcpy  with   arbitrary  aJacker--controlled  contents  that  is   about  to  take  place.  
OK.  We'll  look  into  it.  
63  

And  THAT'S  the  story...  
· Of  how  our  two--person  startup  spent  part  of  our   summer  doing  free  work  for  a  company  with   mulVbillion  dollar  quarterly  profits,  because  they   couldn't/wouldn't  fix  a  responsibly  disclosed   firmware  vulnerability  that's  been  public  for  a   year  now,  that  we  confirmed  existed  on  my   wife's  MacBook  Air!  
· Good  cmes!   · A  security  win!   · High  fives  all  around!   · Let's  hear  it  for  the  (90s)  status  quo!  
64  

An  open  leeer  to  firmware  makers:  
ALL  (U)EFI--RELATED  FIRMWARE   LOOKS  THE  SAME  TO  ATTACKERS!  
   YOUR  SECURITY  THROUGH  
OBSCURITY  IS  GONE!  
65  

MacBookAir4,1  

ASUS  BT1AH  (from  our  CanSecWest  2015  talk)  

66  

Failing  to  protect  its  customers  
· All  firmware  vendors  have  vulnerabilices   · Some  vendors  are  very  good  about  patching  
public  vulnerabilices  and  audicng  for  non-- public  bugs   · Apple  is  not   · Apple  leaves  their  customers  vulnerable  to   already--public  issues  for  long  periods  of  cme   · (Uncl  now)  Apple  got  away  with  reporcng   they  are  not  vulnerable  when  they  are  
67  

Thanks  for  aeending  our  talk!  
· We  need  to  make  way  for  the  next  speakers   · Please  meet  us  outside  the  room  for  Q&A  
TWO  SIGMA  
68  

References  
[0]  Aeacking  Intel  BIOS  ­  Rafal  Wojtczuk  and  Alexander  Tereshkin,  July  2009 hep://invisiblethingslab.com/resources/bh09usa/Aeacking%20Intel%20BIOS.pdf     hep://www.kb.cert.org/vuls/id/127284    (CERT  never  posted?!)   [1]  Defeacng  Signed  BIOS  Enforcement  ­  Kallenberg  et  al.,  Sept.  2013   hep://conference.hitb.org/hitbsecconf2013kul/materials/D1T1%20--%20Kallenberg, %20Kovah,%20Bueerworth%20--%20Defeacng%20Signed%20BIOS %20Enforcement.pdf   hep://www.kb.cert.org/vuls/id/912156   hep://www.kb.cert.org/vuls/id/255726  (CERT  hasn't  posted  yet  despite  request)   [2]  All  Your  Boot  Are  Belong  To  Us  (MITRE  porcon)  ­  Kallenberg  et  al.  ­  Mar.  2014,   delayed  from  publicly  disclosing  potencal  for  bricking  uncl  HITB  at  Intel's  request   heps://cansecwest.com/slides/2014/AllYourBoot_csw14--mitre--final.pdf     hep://www.kb.cert.org/vuls/id/758382   [3]  All  Your  Boot  Are  Belong  To  Us  (Intel  porcon)  ­  Bulygin  et  al.  ­  Mar.  2014   heps://cansecwest.com/slides/2014/AllYourBoot_csw14--intel--final.pdf     [4]  Setup  for  Failure:  Defeacng  UEFI  Secure  Boot  --  Kallenberg  et  al.,  Apr.  2014   hep://syscan.org/index.php/download/get/6e597f6067493dd581eed737146f3a.../ SyScan2014_CoreyKallenberg_SetupforFailureDefeacngSecureBoot.zip   hep://www.kb.cert.org/vuls/id/291102  (CERT  hasn't  posted  yet  despite  request)     
69  

References  
[5]  Extreme  Privilege  Escalacon  on  UEFI  Windows  8  Systems  ­  Kallenberg  et  al.,  Aug.  2014   heps://www.blackhat.com/docs/us--14/materials/us--14--Kallenberg--Extreme--Privilege--Escalacon--On-- Windows8--UEFI--Systems.pdf     hep://www.kb.cert.org/vuls/id/766164     [6]  Aeacks  against  UEFI  Inspired  by  Darth  Venamis  and  Speed  Racer  ­  Wojtczuk  &  Kallenberg,  Dec.  2013   heps://bromiumlabs.files.wordpress.com/2015/01/aeacksonuefi_slides.pdf   hep://www.kb.cert.org/vuls/id/533140     [7]  Speed  Racer:  Exploicng  an  Intel  Flash  Proteccon  Race  Condicon  ­  Kallenberg  &  Wojtczuk,  Dec.  2013   heps://frab.cccv.de/system/aeachments/2565/original/speed_racer_whitepaper.pdf     hep://www.kb.cert.org/vuls/id/912156     [8]  Aeacking  UEFI  Boot  Script  ­  Wojtczuk  &  Kallenberg,  Dec.  2013   heps://frab.cccv.de/system/aeachments/2566/original/venamis_whitepaper.pdf     hep://www.kb.cert.org/vuls/id/552286     [9]  "Snorlax"  bug  ­  Cornwell,  et  al.,  Dec.  2013   heps://frab.cccv.de/system/aeachments/2566/original/venamis_whitepaper.pdf     hep://www.kb.cert.org/vuls/id/577140  
70  

References  
[13]  ThunderStrike,  Trammell  Hudson,   heps://trmm.net/Thunderstrike     [14]  "The  Empire  Strikes  Back  Apple  ­  how  your  Mac  firmware  security   is  completely  broken",  Pedro  Viliaca,   heps://reverse.put.as/2015/05/29/the--empire--strikes--back--apple-- how--your--mac--firmware--security--is--completely--broken/      
[17]  "Exploicng  UEFI  boot  script  table  vulnerability",  Dmytro  Oleksiuk,   hep://blog.cr4.sh/2015/02/exploicng--uefi--boot--script--table.html     [18]  Boot  script  vulnerability  proof  of  concept  code,  Dmytro  Oleksiuk,   heps://github.com/Cr4sh/UEFI_boot_script_expl    
[19]  OS  X  Yosemite  v10.10.4  and  Security  Update  2015--005  (69   CVEs)heps://support.apple.com/en--us/HT204942   [20]  DE  MYSTERIIS  DOM  JOBSIVS  Mac  EFI  Rootkits  --  Loukas  K  (snare),   Jul.  2012   heps://media.blackhat.com/bh--us--12/Briefings/Loukas_K/ BH_US_12_LoukasK_De_Mysteriis_Dom_Jobsivs_Slides.pdf       
71  

References  
[21]  CIH  (Computer  Virus),  Wikipedia,   heps://en.wikipedia.org/wiki/CIH_%28computer_virus%29     [22]  Mebromi:  the  first  BIOS  rootkit  in  the  wild,  Marco  Giuliani,     hep://www.webroot.com/blog/2011/09/13/mebromi--the--first--bios-- rootkit--in--the--wild/     [23]  Shopping  for  Spy  Gear:  Catalog  Advercses  NSA  Toolbox,   Appelbaum  et  al.,     hep://www.spiegel.de/internaconal/world/catalog--reveals--nsa--has-- back--doors--for--numerous--devices--a--940994.html     [24]  Nikolaj  Schlej's  twieer  post  about  HackingTeam  UEFI  malware,   heps://twieer.com/NikolajSchlej/status/618076694117789696     [25]  Analyzing  Malware  for  Embedded  Devices:  TheMoon  Worm,   Bernardo  Rodrigues,   hep://w00tsec.blogspot.com/2014/02/analyzing--malware--for-- embedded--devices.html  
72  

References  
[X]  See  all  the  related  work  we're  aware  of   here: hep://cmeglider.com/cmeline/ 5ca2daa6078caaf4       
73  

Backup  
· "Should  you  worry  when  the  skullhead  is  in   front  of  you?  Or  is  it  worse  because  it's  always   waicng,  where  your  eyes  don't  go?"    
­ They  Might  Be  Giants  
74  

FAQ  
· What  is  your  talk  about?  
­ How  Apple  has  not  been  as  responsive,  or  as  accurate,  as  other  PC   vendors  in  responding  to  industry--wide  nocficacons  of  firmware   vulnerabilices.  How,  consequently  Macs  have  been  leQ  vulnerable  to   aeacks  that  have  been  fixed  on  other  x86--based  PCs.  And  how   malware  can  infect  Mac  firmware  without  physical  presence  just  as   easily  as  we've  shown  in  the  past  on  PCs,  or  via  a  novel  `firmworm'   propagacon  uclizing  Apple's  Thunderbolt--to--Ethernet  adapter.  
· How  were  vulnerabilices  disclosed  to  Apple?  
­ They  were  disclosed  to  all  PC  vendors  in  parallel  through  coordinated   disclosure  efforts  led  by  Intel,  CERT--CC,  and  the  UEFI  Security   Response  Team  (once  it  was  established  in  2014)  in  2013--2014.  
· As  shown  on  the  respeccve  CERT  VU#  pages,  Apple  either  said  it  was  not   vulnerable  to  any  of  them,  or  Apple  did  not  respond  at  all  
­ When  this  did  not  seem  to  be  working,  we  started  emailing  product-- security@apple.com  directly.  
75  

FAQ  
· Do  aeackers  require  physical  access  to  infect  the  PCI  Opcon  ROM  (OROM)   or  BIOS?  
­ No  
· What  models  are  affected?  
­ All  Apple  Thunderbolt  to  Ethernet  adapters'  OROMs  that  we  have  tested  can   be  rewrieen  to  include  malicious  code.  And  architecturally  all  Apple  BIOSes   will  execute  the  aeacker's  code  from  the  OROM  in  the  context  of  the  BIOS.  
­ There  are  other  OROMs  in  the  system,  although  our  proof  of  concept  only   writes  to  the  Ethernet  adapter.  
­ You  would  have  to  see  advisories  from  Apple  to  determine  what  is  affected  by   the  different  BIOS--specific  vulnerabilices  that  allow  BIOS  infeccon.  At  least  for   the  Venamis  vulnerability  (CERT  VU#).  Basically  all  Macs  since  2011  were   patched.  
· Are  PCs  vulnerable  as  well?  
­ Yes.  All  of  the  vulnerabilices  described  in  this  talk  were  first  found  on  other   PCs,  in  some  cases  more  than  a  year  ago.  They're  just  all  vulnerabilices  which   Apple  never  patched.  Many  low--end  PC  makers  have  also  failed  to  patch  the   issues  as  well.  
76  

FAQ  
· How  easy  is  it  for  aeackers  to  exploit  these   vulnerabilices?  
­ We  would  say  a  medium  level  of  difficulty.  It  isn't   trivial,  and  requires  the  aeackers  to  have  some   foundaconal  understanding  of  how  computers  work   (which  script  kiddies  for  instance  will  generally  lack.   And  we  never  release  exploit  code  that  would  enable   script  kiddies.)  But  at  the  same  cme,  these  aeacks  do   not  require  jumping  through  anywhere  near  as  many   hoops  as  modern  browser/OS  exploits  for  instance.   There  are  no  exploit  micgacons  within  BIOSes.  
77  

FAQ  
· What  are  the  consequences  of  a  firmware  aeack?  
­ An  aeacker  can  execute  arbitrary  code  on  the  system  at  the  earliest   stages.  An  aeacker  that  runs  first  on  the  system  is  the  most  powerful   and  privileged  aeacker.  
­ They  can  persist  past  boot  and  manipulate  the  OS  during  runcme,  by   modifying  the  OS's  memory  before  it  starts,  or  by  living  in  System   Management  RAM  (SMRAM),  which  architecturally  cannot  be   inspected  by  security  soQware.    
­ An  aeacker  can  also  render  the  system  un--bootable  ("bricked")  in  a   way  that  it  cannot  be  recovered  through  any  normal  HD/SSD   replacement,  or  reinstalling  via  external  USB/DVD  
­ By  persiscng  in  the  firmware,  rather  than  in  the  filesystem  of  an  OS,   an  aeacker  can  maintain  stealth  control  of  a  system  longer,  because   prior  to  LegbaCore's  founding,  there  were  no  computer  security   companies  that  focused  on  inspeccng  PC  firmware  for  aeackers.  
­ More  concrete  examples  of  what  an  aeacker  can  do  are  shown  in  our   past  work  at  legbacore.com/Research.html    
78  

FAQ  
· What  do  you  mean  when  you  say  "Thunderstrike  2  is  the  `first  of  its  kind'   `firmworm'"?  
­ There  have  been  other  worms  that  have  spread  from  one  device's  firmware  to  another's  ­   specifically  in  the  area  of  SOHO  routers  [25].  However  the  `firmware'  that  is  being  used  in   those  cases  is  just  an  embedded  version  of  Linux,  and  therefore  in  praccce  the  malware  does   not  look  any  different  from  past  worms  that  jumped  from  OS  to  OS.  And  defenders  already   have  a  plethora  of  tools  to  inspect  OSes  like  Linux  for  malware.  
­ Stuxnet  was  an  OS--to--OS  worm  that  had  a  SCADA  firmware  infeccng  component.  But  it  could   not  propagate  without  residing  within  the  Windows  OS  as  a  kernel  driver,  or  on  the  filesystem   of  USB  drives  as  an  exploit.  This  is  why  it  was  ulcmately  detected.  
­ Thunderstrike  2  is  unique  in  that  it  can  propagate  without  *ever*  leaving  any  evidence  in  the   areas  which  are  typically  inspected:  OS  memory  and  OS  filesystem.  It  will  live  in  the  PCI  Opcon   ROM  firmware  on  an  Apple  thunderbolt--to--ethernet  adapter,  and  it  will  live  in  the  EFI   firmware  flash  chip  that  runs  before  the  OS.  As  such,  security  products  and  forensic  examiners   are  woefully  unprepared  to  detect/disinfect  this  class  of  malware,  and  would  never  be  able  to   find  or  remove  it,  if  we  weren't  making  tools  to  do  so.  
­ We  are  not  saying  such  aeacks  are  undetectable.  Far  from  it,  they  are  definitely  detectable.   But  no  one  is  trying  to  detect  them,  and  consequently  sophisccated  aeackers  know  that  if   they  dive  this  deep  in  the  system,  it  will  have  maximum  privilege  to  do  whatever  they  want,   and  have  the  freedom  to  operate  undetected.  
79  

FAQ  
· Are  you  aware  of  people  aeacking  firmware  in  the  wild?  
­ The  first  malware  detected  in  the  wild  that  wiped  the  BIOS  (to  brick  a  system)   was  CIH[21]  in  1998  
­ The  first  malware  detected  in  the  wild  that  used  the  BIOS  to  re--infect  wiped/ replaced  hard  drives  was  Mebromi[22]  in  2011.  
­ In  2013  leaks  by  Edward  Snowden  indicated  that  NSA  has  had  BIOS/HD   firmware  infeccon  capability  since  at  least  2008[23]  
­ When  the  surveillance  soQware  vendor  HackingTeam  was  hacked  in  2015,  it   was  discovered  in  their  leaked  files[24]  that  they  had  been  selling  a  capability   to  infect  UEFI  firmware  and  drop  their  exiscng  Windows  backdoor.    
· The  source  code  for  this  UEFI  rootkit  was  also  leaked,  and  therefore  it  is  assumed  that  all   other  surveillance  soQware  companies  that  didn't  already  have  such  a  capability,  will   now  be  able  to  pursue  one  with  less  effort.  
­ The  reader  is  also  recommended  to  see  the  magnitude  of  conference  talks   that  have  been  given  on  the  topic[X].  Some  of  this  research,  like  eEye   BootRoot  was  ulcmately  weaponized  and  detected  in  the  wild,  and  others,   like  BluePill,  are  highly  suspected  to  be  in  the  wild  as  targeted  aeacks[NSA],   but  have  never  been  *actually*  detected  in  the  wild  (due  to  the  failings  of   security  soQware.))  
80  

FAQ  
· Are  you  aware  of  in  the  wild  aeacks  targecng  Apple's  firmware   specifically?  
­ No.  Because  we  are  not  aware  of  any  companies  colleccng  the  data   necessary  to  detect  firmware  aeackers  on  Mac.  And  tools  to  integrity   check  firmware  did  not  exist  uncl  we  created  them  relacvely  recently.  
· Why  doesn't  Apple  follow  Intel's  recommendacons  to  firmware   makers  and  use  all  the  proteccon  mechanisms  available  to  them?  
­ We  don't  know  for  sure,  although  their  firmware  is  based  on  the  much   older  1.10  EFI  release  instead  of  the  current  2.x  UEFI  tree.    
­ We  speculate  it  is  because  they  design  their  architecture  a  bit   differently  from  other  vendors,  pu·ng  more  reliance  on  their  "System   Management  Controller"  (SMC)  chip,  and  running  less  code  in  the  x86   System  Management  Mode  (SMM).  (We  have  not  specifically   invescgated  the  relacve  amount  of  code  Apple  runs  in  SMM  vs.  other   PC  vendors.)  Therefore  they  think  that  SMM  compromises  are  less   damaging.  However  SMC  compromises  have  been  shown  by  other   researchers.[ionescue]  
81  

FAQ  
· What  can  Apple  customers  do  to  protect  themselves   from  firmware  aeacks?  
­ Hope  that  Apple  releases  patches,  and  then  apply  the   patches  through  the  normal  soQware  update  mechanism  
· What  can  Apple  customers  do  to  determine  if  their   firmware  is  already  infected?  
­ For  the  OROM  infeccon  shown  in  the  talk,  use  the  cited   OROM  dump  &  integrity  check  tools  
­ For  the  main  BIOS  infeccon  itself,  trustworthy  integrity   checking  (which  provides  truth  in  the  face  of  the  lies  that   aeackers  can  feed  to  security  soQware)  is  more   complicated  and  labor--intensive.  A  such,  LegbaCore   performs  such  checks  as  a  paid  service.  
82  

FAQ  
· Is  ThunderStrike  2  fixed  by  OS  X  Yosemite   v10.10.4  and  Security  Update  2015--005?  
­ Apple  released  a  parcal  patch,  that  fixed  the  main   Venamis  and  PrinceHarming  vulnerabilices  by  locking   the  Protected  Range  Registers  (PRRs)  and  FLOCKDN  in   PEI  before  the  S3  boot  script  is  executed.  
· A  hooked  S3  sleep  resume  script  can  no  longer  directly   configure  the  flash  to  be  writable.  
· The  aeacker  can  scll  use  a  hooked  boot  script  to  disable   SMRRs,  and  therefore  break  into  System  Management   Mode.  
­ This  patch  is  insufficient  and  can  be  bypassed  by   sophisccated  aeackers  to  re--disable  PRRs,  and  re-- enable  wricng  to  the  firmware.  
83  

FAQ  
· Does  Secure  Boot  prevent  Thunderstrike  2?  
­ Apple  does  not  implement  UEFI  SecureBoot  as   outlined  in  the  UEFI  2.3.1  specificacon.    
­ Even  if  they  did,  the  types  of  exiscng  public   vulnerabilices  described  in  this  talk  are  the  types   which  can  circumvent  SecureBoot.  
­ Implementacon  of  SecureBoot  would  add  a   requirement  for  signatures  on  Opcon  ROMs,   which  would  prevent  a  random  Thunderbolt   device  from  being  able  to  inject  untrusted  code   into  the  boot  process.  
84  

FAQ  
· Does  a  firmware  password  prevent  this   aeack?  
­ No  
· Where  can  I  get  the  PoC  aeack  binary/source   code?  
­ It  is  not  being  made  available  
· Is  this  related  to  Incepcon?  
­ Incepcon  uses  DMA  to  read/write  memory,   Thunderstrike  is  about  wricng  to  the  boot  flash.  
85  

FAQ  
· What  are  Opcon  ROMs?  
­ The  original  IBM  PC  included  Opcon  ROM  sockets  for   opconal  features.  These  were  typically  used  for  things  like   "ROM  BASIC"  or  drivers  for  addiconal  devices.  At  boot   cme,  the  BIOS  would  see  if  there  were  any  chips  installed   and  execute  startup  code  from  them.  Adapter  cards  in  the   ISA  bus  could  also  provide  expansion  ROMs  with  code  to   inicalize  themselves.  This  legacy  feature  was  carried   through  all  the  way  to  the  modern  PCI  Express  (PCIe)  bus  ----   when  a  modern  computer  boots  it  queries  every  device   installed  to  check  if  there  is  code  to  be  executed  before   loading  the  operacng  system.  Thunderbolt  brings  the  PCIe   bus  to  the  outside  and  allows  external  devices  to  provide   Opcon  ROMs  to  the  EFI  firmware.    
86  

FAQ  
· {Computers  used  to  have/My  computer  has}  a  physical  hardware  switch  that  stopped  the  BIOS   from  being  writeable,  unless  the  user  physically  modified  the  switch.  Why  don't  computer  makers   scll  do  that?  
­ You'd  have  to  ask  the  vendors.  We  can  only  speculate.     ­ One  reason  could  be  because  firmware  has  goeen  so  large  and  complex,  that  firmware  updates  are  
inevitable,  and  vendors  want  to  make  it  as  easy  for  their  customers  to  apply  them  as  possible.     ­ Another  reason  could  be  that  it  is  difficult  to  engineer--in  a  writability  switch  which  is  deemed  aestheccally  
acceptable.  And  the  associated  user  educacon  that  goes  with  the  proper  usage  of  the  switch  would  cause   more  customer  support  calls  (at  more  cost),  and  would  very  likely    
· Though  we  would  note  that  Google  ChromeBooks  take  an  elegant  approach  of  using  a  screw  to  render  the  firmware   write--protected.  And  then  if  the  screw  is  removed  (voiding  the  warrantee),  the  firmware  is  then  writable  if  the  users   would  like  to  customize  the  system.    
· However  this  would  likely  not  be  a  viable  approach  for  Apple's  hardware,  as  Apple  discourages  its  customers  from  being   able  to  open  their  hardware.  
­ Another  reason  is  that  the  removal  of  even  a  single  component  that  is  deemed  to  not  have  high  customer   demand  (i.e.  a  "BIOS  write  enable"  switch)  can  lead  to  significant  cost  savings  for  PC  vendors,  and  PCs  are  a   very  low--margin  business.  
­ Ulcmately,  even  if  vendors  added  switches,  people  would  scll  be  vulnerable  to  malware  masquerading  as  a   legicmate  soQware  and  social  engineering  the  user  into  marking  their  firmware  as  writable,  before  infeccng   it  (with  or  without  an  exploit.)  
· We  want  to  convey  to  those  who  would  suggest  it,  that  the  solucon  is  *not*  "just  add  a  switch."   That  only  provides  a  false  sense  of  security.  The  actual  fix  for  firmware  security  is  a  more  subtle  mix   of  rearchiteccng  the  firmware  with  some  combinacon  of  true  ROM  reset  vectors,  white--box   trusted  hardware,  cryptographically  verified  signatures  on  updates,  measured  boot,  and  other   related  technologies.  As  such,  we  anccipate  that  the  final  goal  will  not  be  reached  for  many  years.   However  that  is  why  LegbaCore  is  working  with  vendors  to  lend  our  knowledge  of  aeacks  to  get  to   the  end  state,  of  an  actually--trustworthy  founda,on,  faster.  
87  

