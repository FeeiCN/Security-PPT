Who are we?
· Co-founder and Chief Scientist at Lastline, Inc.
­ Lastline offers protection against zero-day threats and advanced malware
· Professor in Computer Science at UC Santa Barbara
­ many systems security papers in academic conferences
· Member of Shellphish

Who are we?
· PhD Student at UC Santa Barbara
­ research focused primarily on binary security and embedded devices
· Member of Shellphish ­ team leader of Shellphish's CGC effort

What are we talking about?

The  "Internet  of  Things"  

Embedded  so4ware  is  everywhere  

What  is  on  embedded  devices?  
· Embedded  Linux  and  user--space  programs      · Custom  OS  and  custom  programs  combined  together   in  a  binary  blob  
­ typically,  the  binary  is  all  that  you  get   ­ and,  someDmes,  it  is  not  easy  to  get  this  off  the  device  
  

Binary  Analysis  
Binary  analysis  
noun  |  bi·na·ry  anal·y·sis  |  \b--n--r  --na--l--ss\  
  
1. The  process  of  automaDcally  deriving  properDes  about  the   behavior  of  binary  programs  
2. Including  staDc  binary  analysis  and  dynamic  binary  analysis  
  

Goals  of  Binary  Analysis  
· Program  verificaDon   · Program  tesDng   · Vulnerability  excavaDon   · Vulnerability  signature  generaDon      · Reverse  engineering   · Vulnerability  excavaDon   · Exploit  generaDon        

StaDc  Binary  Analysis  
­ reason  over  mulDple  (all)  execuDon  paths   ­ can  achieve  excellent  coverage   ­ precision  versus  scalability  trade--off  
· very  precise  analysis  can  be  slow  and  not  scalable   · too  much  approximaDon  leads  to  wrong  results  (false  posiDves)  
­ o4en  works  on  abstract  program  model  
· for  example,  binary  code  is  li4ed  to  an  intermediate  representaDon  

Dynamic  Binary  Analysis  
­ examine  individual  program  paths   ­ very  precise   ­ coverage  is  (very)  limited   ­ someDmes  hard  to  properly  run  program  
· hard  to  a\ach  debugger  to  embedded  system   · when  code  is  extracted  and  emulated,  what  happens  with  calls  to  
peripherals?  
  

Challenges  of  StaDc  Binary  Analysis  
· Get  the  binary  code      · Binaries  lack  significant  informaDon  present  in  source      · O4en  no  clear  library  or  operaDng  system  abstracDons  
o where  to  start  the  analysis  from?   o hard  to  handle  environment  interacDons        

From  Source  to  Binary  Code  

compile  

link  

strip  

From  Source  to  Binary  Code  

compile  

link  

type  info   variable  
funcDon   names   names  
jump   targets  

strip  

Missing  OS  and  Library  AbstracDons  
· (Linux)  system  call  interface  is  great  
­ you  know  what  the  I/O  rouDnes  are  
· important  to  understand  what  user  can  influence  
­ you  have  typed  parameters  and  return  values   ­ let's  the  analysis  focus  on  (much  smaller)  main  program     
· OS  is  not  there  or  embedded  in  binary  blob  
­ heurisDcs  to  find  I/O  rouDnes   ­ open  challenge  to  find  mostly  independent  components     
  

Missing  OS  and  Library  AbstracDons  
· Library  funcDons  are  great  
­ you  know  what  they  do  and  can  write  a  "funcDon  summary"   ­ you  have  typed  parameters  and  return  values   ­ let's  the  analysis  focus  on  (much  smaller)  main  program     
· Library  funcDons  are  embedded  (like  staDc  linking)  
­ need  heurisDcs  to  rediscover  library  funcDons   ­ IDA  FLIRT  (Fast  Library  IdenDficaDon  and  RecogniDon  Technology)   ­ more  robustness  based  on  looking  for  control  flow  similarity     
  

Types  of  VulnerabiliDes  
· Memory  safety  vulnerabiliDes  
­ buffer  overrun   ­ out  of  bounds  reads  (heartbleed)   ­ write--what--where     
· AuthenDcaDon  bypass  (backdoors)      · Actuator  control!  

AuthenDcaDon  Bypass  
Prompt  

AuthenDcaDon  

Success  

Failure  

AuthenDcaDon  Bypass  
Prompt  

Backdoor   e.g.  strcmp()  

AuthenDcaDon  

Success  

Failure  

AuthenDcaDon  Bypass  
Prompt  

Backdoor   e.g.  strcmp()  

AuthenDcaDon  

Hard  to  find.  

Success  

Failure  

AuthenDcaDon  Bypass  
Prompt   Missing!  
Success  

Modeling  AuthenDcaDon  Bypass  

Prompt  

Backdoor   e.g.  strcmp()  
  
Easier  to  find!  

AuthenDcaDon  

Hard  to  find.  

Success  

Failure  

Input  Determinism  

Backdoor   e.g.  strcmp()  
  

Prompt   AuthenDcaDon  

Can  we  determine     the  input  needed  to     reach  the  success   funcDon,  just  by     analyzing  the  code?      The  answer  is  NO  

Success  

Failure  

Input  Determinism  

Backdoor   e.g.  strcmp()  
  

Prompt   AuthenDcaDon  

Can  we  determine     the  input  needed  to     reach  the  success   funcDon,  just  by     analyzing  the  code?      The  answer  is  YES  

Success  

Failure  

Modeling  AuthenDcaDon  Bypass  
Prompt  

Backdoor   e.g.  strcmp()  
  
Easier  to  find!         But  how?  

AuthenDcaDon  

Success  

Failure  

Finding  "AuthenDcated  Point"  
· Without  OS/ABI  informaDon:   o Manual  reverse  engineering   o Program  outputs/references  certain  strings  (like   "welcome  admin")   o Program  accesses  sensiDve  memory  regions  
· With  ABI  informaDon:   o Program  calls  sensiDve  syscalls   o Program  accesses  sensiDve  resources/files  

Using  angr  to  Hunt  for  VulnerabiliDes  

Program  
Security   policies  

StaDc  Analysis  
Symbolic  ExecuDon  
Security     Policy  Checker  

POCs  

angr:  A  Binary  Analysis  Framework  

angr  

Binary  Loader   StaDc  Analysis  RouDnes   Symbolic  ExecuDon  Engine  

Control--Flow  Graph   Data--Flow  Analysis   Value--Set  Analysis  

angr:  A  Binary  Analysis  Framework  

angr  

Binary  Loader   StaDc  Analysis  RouDnes   Symbolic  ExecuDon  Engine  

Control--Flow  Graph   Data--Flow  Analysis   Value--Set  Analysis  

Symbolic  ExecuDon  
"How  do  I  trigger  path  X  or  condiDon  Y?"      -- Dynamic  analysis  
-- Input  A?  No.  Input  B?  No.  Input  C?  ...   -- Based  on  concrete  inputs  to  applicaDon.   -- (Concrete)  staDc  analysis   -- "You  can't"/"You  might  be  able  to"   -- Based  on  various  staDc  techniques.      We  need  something  slightly  different.  

Symbolic  ExecuDon  
"How  do  I  trigger  path  X  or  condiDon  Y?"     
1. Interpret  the  applicaDon.   2. Track  "constraints"  on  variables.   3. When  the  required  condiDon  is  triggered,  
"concreDze"  to  obtain  a  possible  input.  

Symbolic  ExecuDon  

Constraints  
  

  

x  >=  10  

ConcreDze  

x  =  42  

x  <  100  

  

  

Constraint  solving:  

  

 Conversion  from  set  of  constraints  to  set  of  concrete  values  

that  saDsfy  them.  

 NP--complete,  in  general.  

Symbolic  ExecuDon  
x = int(input()) if x >= 10:
if x < 100: print "Two!"
else: print "Lots!"
else: print "One!"

Symbolic  ExecuDon  

x = int(input()) if x >= 10:
if x < 100: print "Two!"
else: print "Lots!"
else: print "One!"

State  A  
Variables  
  
x  =  ???  
Constraints  
  
------------  

Symbolic  ExecuDon  

x = int(input()) if x >= 10:
if x < 100: print "Two!"
else: print "Lots!"
else: print "One!"

State  A  
Variables  
  
x  =  ???  
Constraints  
  
------------  

State  AA  
Variables  
  
x  =  ???  
Constraints  
  
x  <  10  

State  AB  
Variables  
  
x  =  ???  
Constraints  
  
x  >=  10  

Symbolic  ExecuDon  

x = int(input()) if x >= 10:
if x < 100: print "Two!"
else: print "Lots!"
else: print "One!"

State  AA  
Variables  
  
x  =  ???  
Constraints  
  
x  <  10  

State  AB  
Variables  
  
x  =  ???  
Constraints  
  
x  >=  10  

Symbolic  ExecuDon  

x = int(input()) if x >= 10:
if x < 100: print "Two!"
else: print "Lots!"
else: print "One!"

State  AA  
Variables  
  
x  =  ???  
Constraints  
  
x  <  10  

State  AB  
Variables  
  
x  =  ???  
Constraints  
  
x  >=  10  

State  ABA  
Variables  
  
x  =  ???  
Constraints  
  
x  >=  10   x  <  100  

State  ABB  
Variables  
  
x  =  ???  
Constraints  
  
x  >=  10   x  >=  100  

Symbolic  ExecuDon  

x = int(input()) if x >= 10:
if x < 100: print "Two!"
else: print "Lots!"
else: print "One!"

State  ABA  
Variables  
  
x  =  ???  
Constraints  
  
x  >=  10   x  <  100  

ConcreDzed  ABA  
Variables  
  
x  =  99  

Symbolic  ExecuDon  --  Pros  and  Cons  

Pros      -- Precise   -- No  false  posiDves  (with  
correct  environment   model)   -- Produces  directly-- acDonable  inputs  

Cons      -- Not  scalable  
-- constraint  solving  is  np-- complete  
-- path  explosion  

Path  Explosion  

  paths  to  here  

5  paths  to  here  

angr:  A  Binary  Analysis  Framework  

angr  

Binary  Loader   StaDc  Analysis  RouDnes   Symbolic  ExecuDon  Engine  

Control--Flow  Graph   Data--Flow  Analysis   Value--Set  Analysis  

angr:  A  Binary  Analysis  Framework  

angr  

Binary  Loader   StaDc  Analysis  RouDnes   Symbolic  ExecuDon  Engine  

Control--Flow  Graph   Data--Flow  Analysis   Value--Set  Analysis  

angr:  A  Binary  Analysis  Framework  

angr  

Binary  Loader   StaDc  Analysis  RouDnes   Symbolic  ExecuDon  Engine  

Control--Flow  Graph   Data--Flow  Analysis   Value--Set  Analysis  

angr:  A  Binary  Analysis  Framework  

angr  

Binary  Loader   StaDc  Analysis  RouDnes   Symbolic  ExecuDon  Engine  

Control--Flow  Graph   Data--Flow  Analysis   Value--Set  Analysis  

Value  Set  Analysis  

Memory  access  checks  

Type  inference  

Variable  recovery  

Range  recovery  

Wrapped--interval  analysis  

Value--set  analysis  

Abstract  interpretaDon  

Value  Set  Analysis  

{  

               (  global,     

  

  (4[0x601000,  0x602000],    

32)  ),  

               (  stack_0x400957,  (8[--0xc,  --0x4],     

  

  

  32)  )  

}  

global  

stack_0x400957  

...  

...  

0x601000,  0x601004  

--  0xc  

0x601008,  0x60100c  

--  0x4  

...  

...  

What  have  we  used  this  for?  

angr  

Binary  Loader   StaDc  Analysis  RouDnes   Symbolic  ExecuDon  Engine  

Control--Flow  Graph   Data--Flow  Analysis   Value--Set  Analysis  

The  Cyber  Grand  Challenge!  

CB  
vulnerable  program  

Cyber   Reasoning  
System  

POV  
exploit  
RB  
patched  program  

PCAP   CB  

The  Shellphish  CRS  
Autonomous   processing  

Autonomous   vulnerability  
scanning  
Autonomous   patching  

Test  cases  
Proposed   POVs  
Proposed   RBs  

POV   Autonomous  
service   resiliency  
RB  

PCAP   CB  

The  Shellphish  CRS  
Autonomous   processing  

Autonomous   vulnerability  
scanning  
Autonomous   patching  

Test  cases  
Proposed   POVs  
Proposed   RBs  

POV   Autonomous  
service   resiliency  
RB  

