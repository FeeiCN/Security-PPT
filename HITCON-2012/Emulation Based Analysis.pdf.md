Emula&on  based  analysis     using  binary  instrumenta&on  
Applica&on  on  CTF  
1

SPEAKERS  
2

Myunghun  Cha  
· From  Republic  of  Korea   · POSTECH  senior  student  majoring  CSE   · Team  Leader  of  PLUS   · CODEGATE  2009  Hacking  Contest  3rd  place   · DEFCON  2009  CTF  3rd  place   · DEFCON  2011  CTF  8th  place   · Many  hacking  contest  experience  
3

Jinsuk  Park  
· POSTECH  sophomore  majoring  ME   · Team  member  of  PLUS  
4

PLUS  
· POSTECH  Laboratory  for  UNIX  Security   · Found  in  1992   · Researching  on  various  security  issues   · Par&cipa&ng  in  lots  of  hacking  contests   · Par&cipated  in  DEFCON  CTF  three  &mes  
­ 2009  (3rd  )   ­ 2010  (3rd)   ­ 2011  (8th)   ­ 2012  
5

Mo&va&on  
DEFCON  CTF  
6

CTF  Basic  Rule  
· CTF  :  Capture  The  Flag   · Each  team  is  given  vulnerable  server   · Vulnerable  daemons  are  running  on  the  server  
Vulnerability  
7

CTF  Daemon  

8

9

Scoring  
· There's  a  key  file  for  each  daemon  which  is   changed  periodically  
· You  should  read  or  write  the  key  file  to  get  a   score  
· It  simulates  informa&on  stealling  and   corrup&on  in  real  world  
10

CTF  Network  
Given  two  lan  cables  
11

CTF  Network  
Network

CTF  Summary  
· We  can  a^ack  over  the  wire  
· We  can  sniff,  suspect,  or  drop  packet  
· We  can  a^ack  analyzing  binary                                                               or  using  other  teams'  exploit  

What  do  I  want  to  do?  
   · I  want  to  detect  a^acks  
· I  want  to  analyze  vulnerability  easily  using   other  teams'  a^ack  
· Then...  how?  

EMULATION  BASED  ANALYSIS  

Emula&on  Based  Analysis  
· We  can  detect  bug  following  specific  pa^erns  
­ Stack  boundary  check   ­ memcpy  without  string  length  check   ­ EIP  address  check   ­ Format  string  from  user  input  
· Verifica&on  user  input  is  much  more  easier   than  finding  hidden  bug  
· Dynamic  analysis  is  easier  than  sta&c  analysis  

Instrumenta&on?

Dynamic  Binary  Instrumenta&on
· Ability  to  monitor  or   measure  the  level  of  a   program's  performance,   to  diagnose  errors  and   to  write  trace   informa&on  

Dynamic  Binary  Instrumenta&on
· A  technique  to  analyze  and  modify  the   behavior  of  a  binary  program  by  injec&ng   arbitrary  code  at  arbitrary  places  while  it  is   execuCng

Usage
· Simula&on  /  Emula&on   · Performance  Analysis   · Program  op&miza&on   · Bug  detec&on   · Correctness  Checking   · Call  graphs   · Memory  Analysis  

For  hackers?
· Fuzzing   · Covert  Debugging   · Exploitable  Vulnerability  Detec&on   · Automated  Reverse  Engineering   · Bypass  An&--Debuggers   · Automated  exploita&on   · Automated  unpacking  

DBI  frameworks
· Pin   · Valgrind   · DynamoRio   · Etc.  

Why  valgrind?  
· Valgrind  runs  on  BSD  but  PIN  does  not                                                 (which  is  DEFCON  CTF  Environment)  

Valgrind  :  Introduc&on
· Valgrind  Core  
­ DBI  framework   ­ Simulated  CPU  
· Valgrind  tool  
­ Wri^en  in  C  using  Valgrind  framework   ­ Used  as  Plug--ins  for  Valgrind  
· Valgrind  Core  +  tool  plug--in  =  Valgrind  tool  

Valgrind  :  Tools
· Memcheck:  check  memory  management  of   the  binary  executable  
· Cachegrind:  cache  profiling   · Helgrind:  Data  races  condi&ons  detec&on   · Massif:  Heap  profiler   · User  wri^en  tool   · usage:  valgrind  ----tool=<toolname>  [op&ons]  
prog--and--args  

Valgrind  :  How  it  works

1.  Disassembly

2.  Instrumenta&on

3.  Assembly

Machine   code(x86)  
   Intermediate   Language(IR)  

IR      Instrumented  IR  

Instrumented  IR     
Machine   code(x86)  

VEX  IR(Intermediate  Representa&on)
· Valgrind's  binary  transla&on  mechanism   · VEX  IR:  machine  independent  intermediate  
representa&on   · Translates  a  block  of  binary  codes  to  simplified  
VEX  representa&on  

VEX  IR  :  Example
· addl  %eax,  %ebx  :  
­ t3  =  GET:I32(0)  #  get  %eax,  a  32--bit  integer   ­ t2  =  GET:I32(12)  #  get  %ebx,  a  32--bit  integer   ­ t1  =  Add32(t3,t2)  #  addl   ­ PUT(0)  =  t1  #  put  %eax  

Valgrind  :  Overview

Valgrind  core +
Executable  Binary

VEX  IR  translaCon +

Valgrind  tool

InstrumentaCon

DBI  Result

A^ack  Detec&on  Using  Valgrind  DBI  Framework  
CTFGRIND  

What  does  it  do?  
· match  registered  execu&on  pa^erns   · checks  sensi&ve  memory  area  overwri&ng   · marks  execu&on  flow  using  IDA  Plug--in  

Pa^ern  1:  RET  overwri&ng  
· We  can  get  the  guest  machine's  register   values  
· We  should  protect  our  RET  and  stored  EBP      1.  Monitor  every  memory  opera&on  (Store)   2.  Compare  target  address  with  $EBP   3.  Output  callstack  

Pa^ern  2:  GOT  overwri&ng  
· We  can  do  in  the  same  manner,  because  the   address  of    GOT  is  sta&c  in  a  binary  

Pa^ern  3:  Strcpy  
· What  if  a  bug  comes  from  using  library   func&on  such  as  strcpy  
   1. We  can  compare  the  RET  before  the  library  
func&on  call  and  auer  the  call   2. There  could  be  many  vulnerable  library  
func&ons  such  as  memcpy,  strcpy,  and  scanf  

Possible  usage  #1  
· A^ach  directly  to  running  daemon   · Prevent  a^ack  before  exploita&on   · Stop  the  process  when  a  danger  is  detected   · Possible  slow  down  

Possible  usage  #2  
· Runs  on  a  separated  shadow  machine   · When  it  detects  a^ack,  register  the  packet  
pa^ern  to  firewall  to  prevent  further  a^ack   · Can't  defend  the  first  a^ack  

IDA  Plugin  
· CTFGRIND  logs  the  call  stack  when  the  a^ack   detected  
· IDA  Plugin  reads  the  file  and  marks  the   execu&on  path  
· Helpful  to  analyze  other  teams'  exploit  

DEMO  

REFERENCE  

· Emula&on-- based  Security  Tes&ng  for  Formal  Verifica&on  (Bl ack  Hat  Europe  2009)  ­  Bruno  Luiz  
· Op&mizing  binary  code  produced  by  Valgrind  ­   Luis  Veiga  
· Valgrind  ­  Mario  Sanchez,  Cecilia  Gonzalez   · Hacking  using  Binary  instrumenta&on  ­  Gal  Diskin   · Valgrind:  A  Framework  for  Heavyweight  Dynamic  
Binary  Instrumenta&on  --   Nicholas  Nethercote,  Juliam  Seward   · Valgrind  Technical  Manual     


   hoon0612  @postech.ac.kr  
jinmel@postech.ac.kr  

