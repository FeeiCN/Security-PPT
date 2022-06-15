Copyright  ©  2015  Splunk  Inc.  
Using  Prelert  and  Splunk  Cloud  To   Fight  a  Billion  Dollar  Fraud  Problem  
Andrew  Linn  
SVP,  Chief  InformaCon  Security  Officer  ­  Orrstown  Bank  
   Christopher  Thompson  
SVP,  Chief  Architect  ­  Orrstown  Bank  
   Dr.  Steve  Dodson  
CTO  ­  Prelert  

Disclaimer  
During  the  course  of  this  presentaCon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauCon  you  that  such  statements  reflect  our   current  expectaCons  and  esCmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaCon  are  being  made  as  of  the  Cme  and  date  of  its  live   presentaCon.  If  reviewed  aVer  its  live  presentaCon,  this  presentaCon  may  not  contain  current  or   accurate  informaCon.  We  do  not  assume  any  obligaCon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiCon,  any  informaCon  about  our  roadmap  outlines  our  general  product  direcCon  and  is  subject  to   change  at  any  Cme  without  noCce.  It  is  for  informaConal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaCon  either  to  develop  the  features  
or  funcConality  described  or  to  include  any  such  feature  or  funcConality  in  a  future  release.  
2  

About  
Orrstown  Bank  is  a  community  bank  in  PA  and  MD  with  about  $1.2  billion  
in  assets  
Orrstown  has  adopted  a  cloud--first  model  for  technology  
soluCons   Orrstown  has  been  running                                                                            for  over  1  year  to  facilitate  
opera<onal  and  security  data  analy<cs  
$ Orrstown  conCnues  to  explore  opportuniCes  to  use                                                                to  solve  
addi<onal  problems  such  as  Fraud  
3  

Overview  of  the  Problem  

435%   Amount  charged  off  due  to  Card  Fraud  has  grown                                            
$  

in  the  past  3  years  

  $200,000.00    

  $185,173.33    

  

  $150,000.00    

  $105,259.15    

  

  $100,000.00    

  $34,566.05    

  $50,000.00    

  $--        

2013  

2014  

2015  

This  pa_ern  represents  a  similar  if  not   conserva<ve  experience  as  our  peers  

Many  solu<ons  offered  to  smaller  banks  cannot  keep   pace  with  the  fraud  pa_erns  

4  

Fraudulent  Behavior  Pa_erns  

AJacker  steals  card  data  from...  
OVen  the  first  fraudulent   transacCon  is  followed  shortly   by  many  other  transacCons  
Fraudulent  card  present  transacCons   usually  occur  at...   · Grocery  stores   · Pharmacies   · Walmart   · GameStop   · Best  Buy  

...and  local  merchants  

Card  data  sold  on  the  black  market,   cloned,  and  used....  

Normal  Card--Present   Shopping  Area  

Smarter  criminals  are   selling  cards  back  into   the  local  area  from  which   the  card  was  stolen  to   evade  fraud  detecCon  

Card  not  present  transacCons  at...   · Apple   · On--line  electronics  retailers   · Travel  
5  

Gaps  in  Current  Fraud  SoluCons  

Processors'  used  by  many  community  banks  provide  only   rudimentary  fraud  detec<on  capabiliCes  
  
Those  processors  who  d   o  provide  more  sophisCcated  capabiliCes  such  as  FICO  
Falcon  are  slow  to  adopt  full  automa<on  and  all  the  capabili<es  

  Expert  informa<on  about  the  customer  is  oOen  not  considered  
by  the  model  in  the  risk  calculaCons  

  

  

Consor<um  models  are  generic  and  cannot  adapt  to  

local  market  condiCons  or  local  behaviors  as  quickly  as  this  

model.  

The  fully  func<onal  models  are  expensive  to  operate  

6  

Orrstown  Using  Prelert  and  Splunk  to  Combat  Fraud  

Orrstown  has  a  cloud--first  model  and  as   such  chose  Splunk's  Cloud  offering  to   consolidate  operaConal  analyCcs  and   security  analyCcs  into  a  single  plaiorm  
$  
Financial   Transac<ons  
Prelert  quickly  calculates  staCsCcal   anomalies  across  large  datasets  and   provides  a  model  that  constantly   learns  and  adapts  with  more   informaCon  and  expert  intelligence.  

Calculates  anomalies  across  mul<ple  dimensions  including...   $     How  much  was  spent     When  the  transacCon  occurred     Where  the  transacCon  occurred  (geographically)     At  which  merchant  the  transacCon  occurred  

Factors  in  Expert  Informa<on     Known  Fraud  Pa_erns     Confirmed  Customer  Travel  Plans  

Scores  every  transac<on  on  the  likelihood  of  Fraud  

<  Less  Likely  to  be  fraud  
0

08--26--2015  @  GameStop  for  $350  =  85.0  
100  
More  Likely  to  be  Fraud  >  

7  

Who  is  Prelert?  
8  

Prelert  Anomaly  DetecCve®  for  Splunk®  Overview  

Card  Fraud  PredicCon  ­  Technical  Overview  

Card  Fraud  PredicCon  ­  Technical  Overview  

Card  Fraud  PredicCon  ­  Feature  Engineering  

Card  Fraud  PredicCon  ­  Derived  Features  

Card  Fraud  PredicCon  ­  Example  Feature  

Card  Fraud  PredicCon  ­  LocaCon  Feature  

Card  Fraud  PredicCon  ­  ClassificaCon  

Card  Fraud  PredicCon  ­  Challenges  

Card  Fraud  PredicCon  ­  App  Architecture  

Results  and  the  Business  Case  

IniCal  experiment  with  1  quarter's  worth  of  transac<ons  idenCfied...  

· Approximately  50%  of  the  fraudulent  card  present  transacCons  

· A  small  populaCon  of  only  330  false  posiCves  

· Of  the  fraudulent  transacCons  idenCfied,  there  were  250  instances  of  subsequent  

fraudulent  transac<ons  occurred  using  the  same  card  

These  are  the   fraudulent  txns   we  can  stop    

250 Subsequent  instances  of  fraud  =  

  

$300   X   Average  fraudulent  txn  amount  of  

Quarterly  est.  reducCon  in  fraud  losses  of  
$75,000  

19  

OperaConalizing  the  Model  

Prelert  dashboard  displays   calculated  risk  scores  and  
generates  alerts  

Fraudulent  TransacCons   are  marked  up  and  fed  
back  to  the  model  

ON  

OFF  
Orrstown  Staff   member(s)  monitor  the   dashboard  and  alerts  

Date  Time   Merchant  

Txn  Amount  

08--26--2015   10:05:03  

Game  Stop  #53   Las  Angeles  CA  

$495.00  

08--26--2015   16:45:36  

Walmart  Tampa   FL  

$500.00  

Does  not  stop  the  first   fraudulent  transac<ons  but  
prevents  subsequent  
Orrstown  staff  restricts  or   turns  off  the  customer's  card  
Risk  Score   Descrip<on  
100.0   Rare  locaCon  for  card,  rare  
locaCon  for  all  cards,  risky   merchant    
76.0   Rare  locaCon  for  card,  risky  
merchant  

For  borderline  risk  scores,   Orrstown  staff  calls  the   customer  to  verify  the   transacCon  

Is  the  txn   NO   legit?  

20  

What's  Next?  

EMV  Cards  will  become  more  predominant  in  the  US  and  will  reduce   card  present  fraud  

Card  Not  Present  (CNP)  Fraud  expected  to  
grow  and  therefore  is  Orrstown's  next  challenge  

Tokeniza<on   3--D  Secure  

Techniques  to  
prevent  CNP  Fraud  
Not  100%  effecCve  

Need  to  grow  and  expand  behavior   analysis  with  

21  

PotenCal  

Poten<al  for                                                                      ...  

Card  Txns  

Card  Fraud   Inves<gator  

On--Line  Txns   Account  Info  

§ ConCnue  to  use  Prelert  as  an  addi<onal  layer  of   fraud  control  beyond  what  our  process  offers  
§ Explore  feeding  addi<onal  informa<on  (e.g.  on--line   transfers,  etc)  into                                        via                                                          to   iden<ty  other  customer  behavior  anomalies  

Poten<al  for  the  Industry...  
§ A  centralized  Fraud  Inves<gator  service  to  which  
many  banks  can  subscribe  

Bank  

FI  

   § The  model  improves  by learning  from  a  larger  volume   Bank  
of  informaCon  
§ Each  bank  can  sCll  maintain  the  ability  to  influence  the   Bank   model  based  on  their  local  experiences  

Card  Fraud  Inves<gator  

Bank   FI  

22  

THANK  YOU  

