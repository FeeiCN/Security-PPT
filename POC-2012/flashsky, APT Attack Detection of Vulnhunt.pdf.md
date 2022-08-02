APT Attack Detection of Vulnhunt
Vulnhunt Inc Flashsky
xing_fang@vulnhunt.com

About  Me
* Venustech  researcher   * Eeye  researcher   * Microsoft  researcher   * Vulnhunt  CEO        

CONTENT
Vulnerability and APT APT attack analysis
APT attack detection

VulnerabilityEXPShellcode  Trojan

Trojan  be  installed  into  the  user's

Troj

System  by  attacker  controlled

an

SHELLC

ODE Vulne

rabilit

y

Troj an
TThhee  I  Inntteerrnneett  s  seerrvveerr WWhhiicchh  A  Attttaacckkeerr     ccoonnttrrooll    

Shellcode  Download

AApppplliiccaattiioonn UUsseerr  s  scceennaarriiooss

trojans

the  vulnerability  be

Attacker  write   Trojans  and  upload  

Trust

  tiggered  and  the   shellcode  executed
boundariesEXP

If  user  use  the     application  to Open  this  exp

to  the  server Attacker  send  the  

  EXP  to  user

Trojana  program   which  include   malicious  function   can  be  executed  by   the  attacker  
aattttaacckkeerr

Discovery  vulnerability
vulner ability
AApppplliiccaattiioonn

EXPtrigger  the  vulnerability  and   execute  the  attack  play--load SHELLCODEbut  it  seems     legitimate  and  harmless  normal   data  ,such  as  a  document,  a   message,....

SSiimmuullaattiioonn  s  scceennaarriiooss

uusseerr

Vulnerability  and  attack/defense
* Attacker  
* discover  vulnerability   * Vulnerability  exploitation   * Trojan  Bypass  Protection(  use  defense  flaw)   * Ascendant:  Remote(low  cost,  difficult  detecting,  difficult  
forensics,  difficult  Law  enforcement)  
      Defender  
* Reduce  vulnerability   * Detect  Exp  and  Shellcode   * Detect  the  behavior  of  Exp  and  Shellcode       * Detect  Trojan  horse   * Detect  the  behavior  of  Trojan  horse  

Defender  problems
* Reduce  vulnerability  
* Security  Development  Process(  Rely  developer)  
* Detect  Exp  and  Shellcode  
* characteristic  detection  (based  known,  bypass)  
* Detect  the  behavior  of  Exp  and  Shellcode    
* NX  (confront)  
* Detect  Trojan  horse  
* Static  characteristic(based  known,  easily  confrontation)  
* Detect  the  behavior  of  Trojan  horse  
* High--risk  Behavior(mistake  ,  confront)  

CONTENT
Vulnerability and APT APT attack analysis
APT attack detection

What's  APT
* Advanced  Persistent  Threat  
* Advanced  
* Intelligence  gathering  and  analysis   * Social  engineering   * Professional  attack  techniques  
* Persistent  
* Purpose     * Big  profit   * Organized     * Capital  adequacy

Advance  Consideration
* A  
* Means    
* Spy   * Collect  information   * Scan   * Social  engineering   * Spoof   * Back  door  
* Techniques  
* 0DAY  Vulnerabilities   * 0DAY  Trojan   * Encryption  channel   * Bypass  the  detection

APT  CASE

2010Stuxnet

2009Aurora Attack
2011Steal RSA Token
Why we can't stop them

2012Steal NASA

2012Flame

  APT  attack  process

* Gather  Information  
* Launch  
* Gain  a  foothold  
* Penetration  for     higher  privilege  
* Gain  the  valuable   assets  

Gain the valuable assets Valuable assets

Gather Information Organizational structure
Valuable assets Network structure
Network defense Host defense weakness

another assets

Gain a foothold Vulnerability trigger
Shellcode execute Trojan download Trojan implanted

Privileged employees and Host defense Penetration for higher privilege

Launch Vulnerability
EXP Trojan Simulation exercises Launch a Social

Social engineering

Attempts to access and bruteforcing

Vulnerability

Normal employees and

Virus and Trojan

Host defense

engineering

Important EntSetreparlisecoOnrtrOorlgandiezsattriooyn

Network defense

Encryption channel Camouflage

Long-term

Strategy

* Steal/control/destroy  

attacker

APT  attack  feature
Persistent concurrency

Strategy control Long-term Steal Destroy when key

Gain the valuable assets

Valuable assets

Gather Information

another assets

Organizational structure

Valuable assets

Gain a foothold

Network structure

Vulnerability trigger

Network defense

Shellcode execute

Host defense

Trojan download Privileged employees and

weakness

Trojan implanted

Host defense

Client 0DAY vulnerabilities

Launch

Penetration for higher privilege Social engineering
Attempts to access and bruteforcing

0day Trojan Social engineering

Vulnerability EXP
Trojan Simulation exercises

Normal employees and Host defense

Vulnerability Virus and Trojan

Launch a Social engineering
Network defense

Stealcontroldestroy Important EnterEpnrcirsyeptOironOrcghaanninzealtion
Camouflage Long-term Strategy

Encryption channel Simulation Distributed

attacker

Social engineering penetration

When  APT  go  mainstream

Energy   Military  industry  
Financial   Science  research   Large  manufacturing  
IT   Government  
Military   ......  

Goals: large organizations important information
assets
Attack path: personal
terminal social
engineering penetration

aurora1  0day  VUL0DAY  Trojan   Stuxnet  7  0DAY  VUL0DAY  Trojan  
RSA1  0DAY  VUL  0DAY  Trojan   flame  1  0DAY  VUL  0DAY  Trojan  
......  
Techniques 0day vulnerabilities 0day Trojan encryption channel
Current defense system is difficult to detect and defend

The  flaw  of  current  defense  

system

Based known  Known vulnerabilities Known Trojans Known attack behavior Sensitive keywords

Policy  and    Privilege    Manage

Audit   Risk  assess   reinforcement

AV/HIPS IDS/IPS

Difficult: 0day vulnerabilities 0day Trojans Farraginous attack behavior Encryption channel Social engineering

FW

Key  technical  point  of  APT   Detection

Vulnerability     exploitation   (include  0day)

Encryption     channel
Unknown       Trojan

Social  engineering

CONTENT
Vulnerability and APT APT attack analysis
APT attack detection

APT  defense  technology

SDL  and  security  testing

Vulnhunt  xingyun  product

Scan  

Security   Security   SSeeccuurritityy     Security   FW IPS  +IP   S

AV  +   

Audit  +    Honeypo

develop testing aawwaarreennees reinforc

Vulnerability   0DAY   encrypti t  +   APT  

sss 

ement  

attack  

Trojan   on  

forensics

detection detectio channel   

n

detectio


 

n

sgcaatnhe   r

   

gSoatchiaelr   

 

Sspoocioafl    



evunlgnienreaebri 









ilnitgy  

vTruolnjaenra   bi 



lity  

Call  Back  

Trojan  



Destroy   Call  back  

destroy   Preve ntion

Detect ion

suppr ess


Respo nse

 



  











  

12. 10. 15.





The  Problem  of  current  APT  
detection  
* Focus  point  of  Industry    
* 0day  Trojan  detection   * White  list   * Online  virtual  execution  analysis  
   * Problem  hardly  dominant  in  the  confrontation  
* Detection:   * Trojan  can  execute  confront  code  
* Example:  cover  up,  Hijack  DLL  files  of    trusted  program  
* Trojan  use    runtime  Behavior  
* Example:  Cloud  push,  implanted  vulnerability  
* Analysis  and    Tracking:   * Cloud  push  
   

The  APT  detection  system  of   vulnhunt

ChallengeHow to detect unknown threat ?

Share  Attack  information

Various application Different Version

Online  VX   analysis
Unknown   Vulnerability   (include  0Day)

Event  relate  

Online  VX   analysis

Encryption   channel

Unknown     Trojan

Trusted   channel   analysis

Confront Auto-learning

Social  spoof

The     APT   Depth   Detection   system  of   vulnhunt
How ?

vulnerability  attack  Detection  of   Vulnhunt  VX  (include  0day)

* Pre--analytical  techniques  of  Vulnhunt    
* Embed  execution  code   * Check    Suspected  Shellcode  
* Decode   * Binary  shellcode    
* Data  seem  as  execution  code   * Memory  Virtual  Execution  :  independent  of  application  
* Script  shellcode  
* Characteristic  detect   * Limited  and  widely  known  applications  

12. 10. 15.

vulnerability  attack  Detection  of   Vulnhunt  VX  (Include  0day)
* VX--analysis  techniques  of  vulnhunt  
* Determine  
* Execution  Behavior  :  data  memory  execute  ,  create  process   * Memory  check  :  independent  of  version  and  decoding  knowledge  
* Behavior  recode  
* Execution  recode   * Memory  Virtual  Execution  recode  
* binary  shellcode   * the  virtual  machine  isn't  installed  this  application     * the  shellcode  not  executed  successfully     
12. 10. 15.

Demo  of  vulnhunt  APT  detection
1. determine vulnerability attack 2. determine 0day or Nday 3. analysis shellcode behavior
1. Extract Shellcode 2. Trojan
1. File 2. Url 3. local execution behavior of the shellcode: 1. Call API 2. modify registry 3. Network communication 4. Create and modify local files
12. 10. 15.

Trojan  Detection  of  Vulnhunt  VX   (include  0day  Trojan)
* Pre--analytical  techniques  of  Vulnhunt    
* Source  
* Embed  execution  file   * Execution  file  obtained  from  Email  /  IM  /online  copy/  Download  
* Known  Trojan  detection  
* Anti--virus    
* Self--learning  detection  
* Same  URL  with  Shellcode  download   * Same  MD5  with    Shellcode    released  


Trojan  Detection  of  Vulnhunt  VX     (include  0day  Trojan)

* VX--analysis  techniques  of  vulnhunt   * Execution  behavior  analysis  
* API   * Network  communication   * Registry   * create  or  modify  local  files   * Resource  (  ex.  Pipe,  mutex  )  
* Known  Trojan  Signature  matched   * Self--learning  
* Shellcode  download  or  release  files  -->  Trojan  (  white  list  exclude  )   * URL   * MD5   * Behavior  recode  
  

12. 10. 15.

Encryption  channel  Detection  of   Vulnhunt  (  study)
* Non--encryption  protocol  ;encrypted  data  
* Entropy  analysis  
* Encryption  protocol  ;encrypted  data  
* Source  exception  
* Time   * Flow   * Access  rule  
* Destination  exception  
* White  list   * Internet--aware    
* Whois  analysis   * traffic  link    or  other  information  

Thanks
* About  Vulnhunt  Inc.  
* Founded  in  2010.6,  flashsky  &  alert7   * Business  
* Security  testing  service   * SDL  service   * APT  attack  Detection  product   * Customers  
* HuaWei    ,Tencent  ,Kingsoft  ,360  .....  
* Thanks   * Email  :    xing_fang@vulnhunt.com   * Q/A

