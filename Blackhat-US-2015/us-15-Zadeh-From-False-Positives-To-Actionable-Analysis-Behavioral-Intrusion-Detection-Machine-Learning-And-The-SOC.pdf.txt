Copyright  ©  2015  Splunk  Inc.  
Presenta<on  Title  

  

Agenda  

· Introduc<on  

  

­ The  State  of  Cybersecurity    

­ Research  Background  

· Data  Science  &  Cybersecurity  
­ Data  Science  and  AI   ­ Behavioral  Intrusion  Detec<on  

· Machine  Learning  Case  Studies  
­ Natural  Language  Processing  and  AGD's   ­ Concept  and  Adversarial  DriM   ­ Graph  Mining  

2  

Introduc<on  
3  

Linux  Backdoor  APempt  of  2003  

· On  Nov.  5,  2003,  a  code  change  in  the  CVS  copy  that  did  not  have  a  pointer  to  a  record  of  approval.  

· Inves<ga<on  showed  that  the  change  had  never  been  approved.      Further  inves<ga<on  determined  that  someone  had   apparently  broken  in  (electronically)  to  the  CVS  server  and  inserted  this  change.  

· The  change  modified  the  code  of  a  Linux  func<on  called  wait4,  which  a  program  could  use  to  wait  for  something  to  happen.   Specifically,  it  added  these  two  lines  of  code:  

  

  

  

if  ((op'ons  ==  (__WCLONE|__WALL))  &&  (current-->uid  =  0))  

  retval  =  --EINVAL;  

· An  expert  would  interpret  this  as  innocuous  error--checking  code  to  make  wait4  return  an  error  code  when  wait4  was  called  in  a   certain  way  that  was  forbidden  by  the  documenta<on.    
· Near  the  end  of  the  first  line,  it  said  "=  0"  rather  than  "==  0".  The  normal  thing  to  write  in  code  like  this  is  "==  0",  which  tests   whether  the  user  ID  of  the  currently  running  code  (current-->uid)  is  equal  to  zero,  without  modifying  the  user  ID.  But  what   actually  appears  is  "=  0",  which  has  the  effect  of  sedng  the  user  ID  to  zero.  

· Consequence:    1  LOC    almost  created  a  hidden  backdoor  to  the  Linux  kernel.      

4  

The  State  of  Cybersecurity  Today  
­ T9h,e00  S0ta  Mteal  owfa  Crey  bSaemrspelecus r Aintya l Tyozedda  y     
­ 125  LOC  for  Average  Malware  Sample   ­ Stuxnet  =  15,000  LOC  (120x  average  malware  sample  LOC)   ­ 10,000,000  =  Average  LOC  for  modern  firewall/security  stack  
Key  Takeaway:    For  one  single  offensive  LOC  defenders  write  100,000  LOC  
­ 120:1  Stuxnet  to  average  malware   ­ 500:1  Simple  text  editor  to  average  malware   ­ 2,000:1  Malware  suite  to  average  malware   ­ 100,000:1  Defensive  tool  to  average  malware   ­ 1,000,000:1  Target  opera<ng  system  to  average  malware  
5  

6  

Digression:  Research  Background  
7  

Academic  Path  
· Oxford  England:    Freshmen  year  study  abroad   · Went  to  grad  school  ini<ally  to  study  financial  modeling  (Quants  on  Wall  Street)   · PhD  research  focused  on  modeling  physical  phenomena  driven  by  random  
processes,  PDE's  +  Probability  Theory   · Telecommunica<ons  experience  has  been  in  network  management,  network  
performance  monitoring  and  intrusion  detec<on  
8  

  

Theore<cal  Background  

· Doctoral  Research  

  

­ Iterated  Processes:  What  happens  when  we  replace  <me  with  a  random  

process?  

ê Set  t  "="  B(t)  where  B  is  a  Brownian  mo<on  

­ Can  Feynman  Path  Integral  be  defined  Mathema<cally?  

ê Feynman--Kac's  Formula:    Duality  between  PDE's  and  SDE's  

ê Measures  on  the  space  of  con<nuous  func<ons  

­ Frac<onal  Brownian  mo<on  and  processes  with  long  memory  

ê Random  walks  that  are  not  Markov  

ê Malliavin  Calculus:    (Used  to  prove  Hörmander's  Theorem)  

­ Malliavin  built  a  calculus  out  of  Random  processes  replacing  <me  by  h  in  a  Hilbert  

space    

9  

Stochas<c  Processes  
· Why  are  they  useful?  
­ Time  Series  Forecas<ng   ­ Financial  and  Physical  Process  Modeling   ­ Feynman--Kac's  formula  (duality  between  PDE's  and  Stochas<c  
Differen<al  Equa<ons)  
· The  Rabbit  hole  of  research    
­ Malliavin  Calculus   ­ Iterated  Brownian  Mo<on   ­ Path  Integrals  
10  

Stochas<c  Processes  with  Long  Memory  
· Since  ancient  <mes  the  Nile  River  has  been  known  for  its  long  periods   of  dryness  followed  by  long  periods  of  floods  
· The  hydrologist  Hurst    was  the  first  one  to  describe  these   characteris<cs  when  he  was  trying  to  solve  the  problem  of  flow   regulariza<on  of  the  Nile  River.    
  
11  

   Frac<onal  Brownian  Mo<on  
  
12  

Data  Science  and  Ar<ficial   Intelligence  
13  

Math  in  Industry:  Data  Science  
· Data  Science  =  Scien<fic  Method  +  Computers     · Mixture  of  Math  and  CS  and  Domain  Knowledge  
  
14  

  
Theore<cal  Backbone  
   ­ Classical  Computa<on   ê Logical  Consistency  of  Computer  Languages  (Church--Turing)   ê Physical  Realiza<on  of  Turning  Machine  (Church  turning  +  Von  Neumann)   ê Floa<ng  point  representa<on  with  controllable  error  propaga<on   ­ Mathema<cs  
ê Dedekind's  construc<on  of  R  +  church  turning  =>  science  is  consistent  across  the  universe   ê Dedekind's  construc<on  of  the  real  numbers  establishes  there  is  one  universal  language  
of  precision:  R     ê Kolmogorov's    Axioms  of  probability   ­ Weak/Strong  AI   ê Hal<ng  problem  and  No  Free  Lunch  theorems  =>  building  intelligent  soMware  is  "hard"   ê Current  machine  learning  methods  are  a  type  of  weak  AI   ­ Distributed  Computa<on   ê Complexity  classes  P--Complete,  NC   ê CAP  Theorem   ê Actor  Models   ê Batch  +  Real--Time  :=  Lambda  Architecture  
15  

Machine  Learning  
· Machine  Learning  
­ Supervised/Unsupervised/Semi--Supervised   ­ Outlier  Detec<on   ­ Current  Research:  Ac<ve  Learning,  Manifold  Learning,  Transduc<ve  
Learning,  Deep  Learning,  Self--taught   ­ Most  algorithms  can  be  distributed  over  large  clusters  to  increase  
computa<on  
16  

Hal<ng  Problem  
· The  problem  is  to  determine,  given  a  program  and  an  input  to  the  program,  whether  the  program   will  eventually  halt  when  run  with  that  input  
· The  hal'ng  problem  is  famous  because  it  was  one  of  the  first  problems  proven  algorithmically   undecidable.      This  means  there  is  no  algorithm  which  can  be  applied  to  any  arbitrary  program   and  input  to  decide  whether  the  program  stops  when  run  with  that  input.  
17  

   Church--Turning  Thesis  
  

· However,  not  all  machines  conceivable  to  human  imagina<on  are  subject  to  the  Church­Turing   thesis  (e.g.  oracle  machines).    
· It  is  an  open  ques'on  whether  any  such  unknown  physical  processes  are   involved  in  the  working  of  the  human  brain,  and  whether  humans  can   solve  the  hal'ng  problem  (Copeland  2004,  p.  15).  

  

18  

   Machine  Learning  and  Cybersecurity      · Specific  Challenges  
­ No  Ground  Truth:    Machine  Learning  works  best  in  the  case  of  large  amount  of  labeled   examples    
­ Concept/Adversarial  DriM:    Labels  change  over  <me  
· Lack  of  Labeled  Data  =>  NFL  
­ Wolpert,  D.H.,  Macready,  W.G.  (1997),  "No  Free  Lunch  Theorems  for  Op<miza<on",  IEEE   Transac*ons  on  Evolu*onary  Computa*on  1,  67.  
­   Wolpert,  David  (1996),  "The  Lack  of  A  Priori  Dis<nc<ons  between  Learning  Algorithms",  Neural   Computa*on,  pp.  1341--1390.  
19  

A.I.  and  Meta--Theorems  
· Is  intelligence  achievable  in  soMware  (Strong  AI)?      
­ ScoP  Aronson:  Unlikely  soMware/hardware  combina<ons  are   compe<ng  against  3  Billion  years  of  evolu<on  
· Keep  a  catalogue  of  deep  results  and  curiosi<es  
­ Gödel's  Incompleteness   ­ Church--Turning   ­ Blum's  Speedup  Theorem   ­ No  free  Lunch   ­ One  Learning  Algorithm  Hypothesis   ­ Grover's/Shor's  Algorithms  
· Track  Cudng  Edge  ML  
­   Paper:  "Building  high--level  features  using  large  scale  unsupervised   learning"   ê Andrew  Ng  and  Jeff  Dean  et  al.  (2012)  ICML  
20  

Batch  +  Real  Time  
· Lambda  Architecture  
­ Combina<on  of  Batch  and  Real  <me   ­ Storm,  Hadoop,  Greenplum  (MPP  RDBMS)  
· Complexity  Class  P--Complete  and  NC  
­ P--Complete  =>  inherently  sequen<al  
21  

Behavioral  Intrusion  Detec<on  
22  

Data  Science  in  Cybersecurity  
· What  is  a  behavior  mathema<cally?  
­ Fraud  in  Cybersecurity  manifests  itself  in  infinitely  many  possibili<es    
· Automated  iden<fica<on  of  fraud  in  IT  is  in  some  sense  equivalent  to   trying  solve  the  hal<ng  problem  on  a  Turning  Machine  
­ Computa<onally  it  is  impossible  to  "enumerate"  all  possible  behaviors  
23  

   Limits  of  Automated  Intrusion  Detec<on  
   · Travis  Goodspeed:  Packets  in  Packets  
­ Given  any  communica<on  medium  we  can  embed  a  covert   language  to  avoid  eavesdropping  in  open  channels  
· Can  we  programma<cally  answer  the  ques<ons:    "Does  a   communica<on  contain  steganography?"  
­ Equivalent  to  checking  if  a  computer  program  will  halt?  
· Polymorphic  Malware  =>  NFL  
24  

   Classes  of  Behavior  >  Classes  of  F  
  
25  

   Map  Behaviors  to  Milestones  
  
· Paper:  "Intelligence--Driven   Computer  Network  Defense   Informed  by  Analysis  of   Adversary  Campaigns  and   Intrusion  Kill  Chains"  
· Behaviors  map  to  epochs  
­ Recon   ­ Exploita<on     ­ Command  and  Control   ­ Act  on  objec<ves/Exfiltra<on  
26  

  
Graph  Behavior:  Fluxing  
  
Command  and  Control  (C2)  traffic   has  been  established  between   compromised  hosts  inside  the   corporate  network  and  C2  servers    

   Graph  Behavior:  Fluxing  
  
Command  and  Control  (C2)   traffic  has  been  established   between  compromised   hosts  inside  the  corporate   network  and  C2  servers    

   Graph  Behavior:  Fluxing  
  
C2  Infrastructure  changes  loca<ons  of  command   and  control  server  new  communica<on  path  is   established  

   Graph  Behavior:  Fluxing  
  
C2  Infrastructure  changes  loca<ons  of  command   and  control  server  new  communica<on  path  is   established  

  
Graph  Behavior:  Fluxing  
  
hPp://en.wikipedia.org/wiki/ Fast_flux:    Fast  flux  is  a  DNS   technique  used  by  botnets  to  hide   phishing  and  malware  delivery   sites  behind  an  ever--changing   network  of  compromised  hosts   ac<ng  as  proxies.  It  can  also  refer   to  the  combina<on  of  peer--to-- peer  networking,  distributed   command  and  control,  web--based   load  balancing  and  proxy   redirec<on  used  to  make  malware   networks  more  resistant  to   discovery  and  counter--measures.   The  Storm  Worm  is  one  of  the   recent  malware  variants  to  make   use  of  this  technique.  

   Graph  Behavior:  Fluxing  
  
At  each  <me  step  (typically  a   day  or  two)    the  C2   Infrastructure  changes   loca<ons  of  command  and   control  via  this  "Fluxing"   behavior.    A  subset  of  these   type  of  graph  paPerns  is   known  as  "Fast  Fluxing"  

   Graph  Behavior:  Fluxing  
  
The  constant  mobility  of   command  and  control   infrastructure  will   con<nue  this  IP/Domain   fluxing  movement  un<l   detected  

   Graph  Behavior:  Fluxing  
  
The  constant  mobility  of   command  and  control   infrastructure  will   con<nue  this  IP/Domain   fluxing  movement  un<l   detected  

  
Graph  Behavior:  Lateral  Movement    
  Command  and  Control  (C2)  traffic  has  
been  established  between  "Beachhead"   and  command  and  control  operator  

   Graph  Behavior:  Lateral  Movement    
  
Heartbeat  traffic   signals  C2  operator   that  infected  asset   is  up  and  ready  for   instruc<ons  

     Graph  Behavior:  Lateral  Movement    
Graph  Behavior:  Lateral  Movement  through  
Downstream  Beacon  
Obfuscated  instruc<ons   get  returned  through  an   Upstream  conversa<on   embedded  in  PHP,  .js,   Flash,  etc..      Commands  obfuscated  in   this  way  can  be  through   of  as  a  hidden   "Downstream  Beacon"  

   Graph  Behavior:  Lateral  Movement    
  
Embedded  commands  can   signal  infected  asset  to   enumerate  local  informa<on  on   the  machine,  aPach  to  open   network  shares  and  perform   lateral  reconnaissance  and   privilege  escala<on  throughout   the  compromised  network  

  
Graph  Behavior:  Lateral  Movement    
  
AMer  targeted  lateral  movement  and  privilege   enumera<on  all  cases  of  targeted  aPacks   eventually  involve  the  compromise  of  the  directory   services  roots  servers  (Usually  AD  Forest  Roots)   and  exfiltra<on  of  key  personnel  informa<on  along   with  any    

   Graph  Behavior:  Lateral  Movement    
  
Exfiltra<on  and  other   paPerns  have   different  network   components  but  are   usually  constrained  by   the  pictures  they   make  as  paths  in  a   graph...  

   Graph  Behavior:  Lateral  Movement    
   Edge  weights  can  be  encoded  with  key  security  features  to  
increase  overall  model  accuracy  regardless  of  the  underlying   algorithms  
BFS/DFS  +  Other  classic  graph  search  algorithms  are  a  great   examples  of  algorithms  useful  in  detec<ng  this  graph  signature  

Machine  Learning  Case  Studies  
42  

   Malware  Communica<on  PaPerns      · Malware  uses  covert  command  and  control  techniques  to  
evade  detec<on   · Malware  communica<on  leaves  footprints  of  anomalous  
behaviors  
­ Domain  Genera<on  Algorithms   ­ SSL  command  and  control   ­ TwiPer/Facebook/Gmail  based  steganography   ­ RFC  Compliant  DNS  backdoor  
43  

  

Malware  PaPerns  

· Malware  Indicators  of  

  

Compromise  (IOC's)  

· Network  Traffic  Footprints  

44  

   Concept  DriM      · Designing  soMware  for  intrusion  detec<on  suffers  from  
concept/adversarial  driM   · Case  Study  AGD's  
­ N--gram  models  worked  un<l  2014   ­ N--gram  evasion  techniques  star<ng  being  prevalent  in  new  
malware  families  
45  

   Language  Models  in  Intrusion  Detec<on  
  
46  

   Language  Models  and  Concept  DriM  
  
· N--Gram  models  are  good  at  catching  specific  types  of  malware  that   leverage  domain  genera<on  algorithms  (DGA's)  
· Recently malware writers have begun employing n-gram evasion techniques by leveraging wordlists to generate domain names like: indianbrewedsmk.rutwistedtransistoreekl.biz
47  

   Concept  and  Adversarial  DriM        · Adversarial  DriM:  Malware  authors  adapt  to  defensive  techniques  
48  

   Cybersecurity  and  Graph  Mining      · Dynamic  Temporal  Graphs  
­ Social  Network  of  Communica<ons  forms  a  dynamic  graph  that  evolves   over  <me    
­ Given  a  graph  structure  we  can  leverage  state  of  the  art  graph  mining   techniques  to  detect  anomalous  graph  paPerns   ê Anomalous  Clicks   ê Rare  Sub--Structures     ê Rare  Paths  
· Anomalies  in  graphs  can  be  easy  to  iden<fy  algorithmically  
­ PageRank   ­ Graph  Cut/Par<<oning   ­ Random  Walk  Driven  Label  Propaga<on  
49  

Dynamic  Temporal  Graphs  
· Anomalous  Sub--Structure  Detec<on   · Spectral  Clustering   · SoM  Clustering  
50  

   Visualizing  the  Threat  Models  
  

   Visualizing  the  Threat  Models  
  

   Visualizing  the  Threat  Models  
  
High  Risk   Communica<on   Cluster  

Appendix  

   One  Learning  Algorithm  Hypothesis  
  
55  

   Distributed  Compu<ng  
  
· The  Complexity  Class  P--Complete  and  NC  
­ NC  =>  parallelizable  
· Some  problems  don't  parallelize  well!!  
­ P--Complete  =>  Inherently  Sequen<al   ­ Any  problem  where  you  have  to  maintain  state  across  nodes:  Circuit  
Value  Problem,  Linear  programming     ­ Streaming  models  are  usually  harder  to  maintain  than  batch  models  
56  

Replicate  digital  forensics  exper<se  with  soMware  and   distributed  compu<ng  architectures   Processing  data  in  parallel  allows  us  to  solve  complex  sta<s<cal   problems  in  quick  enough  <me  to  make  Cybersecurity  pro--ac<ve   instead  of  re--ac<ve  
57  

   Back  to  Modeling  Human  Behavior  
  
· Since  we  have  established  it  is  impossible  to  perfectly  model   all  possible  fraud  scenarios  we  resort  to  gedng  very  good  at   predic<ng  normal  behavior  
· How  do  we  get  soMware  to  learn  "baselines"  of  users  typical   ac<ons  every  day  given  certain  log  sources  as  input  
58  

Network  Logs:   FW,  Ne|low,   DHCP,  DNS  

Machine   Learning,  Expert   Systems  Logic  +   parallel  hybrid   processing   architecture  

Reconstruct  per  user   soMware  models   "Maintaining   state"  (units  of   computa<on)  and   facts  about  a  users   typical  access   paPerns  ­  we   reconstruct  there   behavioral  footprint   par<ally  through   inferring  behaviors   based  on  log  paPers  

59  

   Cybersecurity  Teaches  Us  Valuable  
Counterexamples      · Counterexamples  are  one  of  the  most  important  tool  in  a  
scien<sts  arsenal   · Cybersecurity  demonstrates  certain  sub--problems  that  have  
inherent  issues  for  machine  learning  
60  

   Hadoop  Terrasort  Timeline      · April  2006:  Sort  Benchmark  (10GB/node)  run  on  188  nodes  in  47.9  
hours.   · May  2006:    Sort  Benchmark  run  on  500  nodes  in  42  hours.       · December  2006:  Sort  benchmark  run  on  20  nodes  in  1.8  hours,  100  
nodes  in  3.3  hours,  500  nodes  in  5.2  hours,  900  nodes  in  7.8  hours   · April  2008:  Won  1  terbayte  sort  benchmark  in  209  seconds  on  900  
nodes   · March  2009:  17  Research  cluster  with  a  total  of  24,000  nodes   · April  2009:  Won  the  minute  sort  500  GB  in  59  seconds(on  1,400  
nodes)  and  the  100  terabyte  sort  in  173  minutes  (on  3,400  nodes)  
61  

Thank  You  

