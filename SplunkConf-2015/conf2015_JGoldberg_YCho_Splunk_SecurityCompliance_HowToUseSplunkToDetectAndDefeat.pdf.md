Copyright  ©  2015  Splunk  Inc.  
How  to  Use  Splunk     To  Detect  and     Defeat  Fraud,  TheK     And  Abuse  
Joe  Goldberg  
Product  Marke@ng,  Splunk   Young  Cho   Technical  Product  Marke@ng,  Splunk  

Disclaimer  
During  the  course  of  this  presenta@on,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cau@on  you  that  such  statements  reflect  our   current  expecta@ons  and  es@mates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presenta@on  are  being  made  as  of  the  @me  and  date  of  its  live   presenta@on.  If  reviewed  aKer  its  live  presenta@on,  this  presenta@on  may  not  contain  current  or   accurate  informa@on.  We  do  not  assume  any  obliga@on  to  update  any  forward  looking  statements  we  
may  make.       
In  addi@on,  any  informa@on  about  our  roadmap  outlines  our  general  product  direc@on  and  is  subject  to   change  at  any  @me  without  no@ce.  It  is  for  informa@onal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obliga@on  either  to  develop  the  features  
or  func@onality  described  or  to  include  any  such  feature  or  func@onality  in  a  future  release.  
2  

Personal  introduc@on  
 Joe  Goldberg  
­ 3.5  years  at  Splunk   ­ Product  Marke@ng  for  an@--fraud/theK/abuse.  Also  security  and  compliance   ­ Previously  Symantec  Data  Loss  Preven@on  (Vontu)  
 Young  Cho  
­ 2  years  at  Splunk   ­ Technical  Product  Marke@ng  for  an@--fraud/theK/abuse.  Also  security  and  
compliance.  Formerly  Solu@ons  Architect  in  APAC  for  1.5  years   ­ Previously  Splunk  Partner  in  APAC,  MOS    
3  

Agenda  
 Splunk  for  Fraud,  TheK,  &  Abuse    Detailed  bank  fraud  use  case    Demo  (@me  permi`ng)  
4  

Splunk  for  An@--Fraud,   TheK,  Abuse  ("Fraud")  

Why  You  Should  Care:  Fraud  is  Costly  
--  Associa'on  of  Cer'fied  Fraud  Examiners   · High  annual  costs  &  growing:  Merchants  $200--250  billion;  banks  
and  financial  ins@tu@ons  $12--15  billion  1   · Reputa@on/brand  damage   · Labor  costs  from  manual  inves@ga@ons  and  review  
1.  Forrester  Feb  2013   6  

Business  Moving  Online  Has  Increased  Fraud  

Data  breaches  
   Lead  to  downstream   iden@fy  theK  and  credit  
card  fraud  

No  boundaries  
   Fraudsters  are  able  to     act  from  con@nents  away  
with  impunity  

Creden2al  the4  
   Account  takeovers  are   easier  due  to  phishing    
and  malware  

More  sophis2ca2on  
   Fraudsters  use  new  tac@cs  
and  change  behavior  to   evade  detec@on  
7  

Machine  Data  Contains  Cri@cal  Fraud  Insights  

Sources  
Card  Payment     System  

[p2r0o1c_3i--n0p9u--0t=4"--1M4A.4S5T."5,4  p.6ro0c8_0t0a0rg] e ptr=o"cB_2s4oCHuar"c,re  din= t "IeDBr2f  a4cAe"_, a   tcmq=st"_BtNarEgTe_t1="",2    0in1tA3e-mr-0fa9oc--0ue4_n-i-ts1s 4  =."4052.5040.87"2,4  c0o0d0_"m,  ssegr=v"_1i1d1=0"I"S,S   ",    
oper_rrn="090448764439",    card_id="526430VS350Y2992",  oper_amount="000000008000",    oper_  
curreMncey=r"c9h7a8n"t,  o  IDpe   r_country="380",  term_id="00599307",    circuito="",  seu_merc="4722",  bin_acq="002111",    
id_merc="329017246168",  prcode="003000",  ac@on_code="000",    approval_code  ="H8H766",  oper_  
mod_input="1",  channel="O",    flag_dupl="Y",  flaCgl_ieonnuts  I=D"N   ",  auth_rout_dst="INTFHI93",    auth_  
rout_id="HISO_AUTH",  msg_subst="",  ndg="0000000078507391",    sta@on_acq="STA--BNET--MI1",  acceptor  ="   TRAWEL  SPA\\MILANO\  380",    tmst_ins="2013--09--04--14.48.56.277466",  lpar="B"     

Web  Proxy  

2013--08--09  16:21:38  10.11.36.29  98483  148  TCP_HIT  200  200  0  622  --  --  OBSERVED  GET  HTTP/1.1  0  "Mozilla/4.0  

(RcToCm  LpMa@  8b;l  .eN;E  MTS  CILER  6  1.0.S1;  o.W4u3inr2cd2eo;  w.  INPsE   N TT  C  L5R.1  3; . S0V.415; 0 .N6E.2T1  C5L2R;   ) 2  U.0s.e5r0  J7o2h7n;   w Dwoew,".n     everbeenseenbefore.com    InfoPath.1;  MS--

  

Referring  URL  

Authen2ca2on  

20130806041221.000000  Cap@on=ACME--2975EB\JohnDoe  Descrip@on=User  account  Built--in  account  for  
aTdrumeiNnaismteer=inAgd  tmhein  cisotmraptourte  SrID/d  =oSm--1a-i-5n-D-2o1\--n1=7A15C5M6E7-8U-229s17e-5-9rE2  NB6a4  Inm9s2te6a0 l l9D-a-7t2e5=3N4U5L5L4L3o c 5a0l0AScIcDoTuynpte  ==  1IP  :S  1o0u.1r1c.e36  I.P20       
Status=Degradedwmi_  type=UserAccounts  
8  

Example  Pauerns  of  Fraud  in  Machine  Data  
There  are  Hundreds  of  Pa9erns  of  Internal/External  Fraud!  

Industry  

Type  of  Fraud  

PaAern  of  fraud  

Financial  Services   Account  takeover   High  velocity  of  transac@ons  under  $10k  

Healthcare  

Physician  billing  

Physician  billing  for  drugs  outside  their   exper@se  area  

E--tailing  

Account  takeover   Many  accounts  accessed  from  one  IP  or  user   agent  string  

Telecoms  

Roaming  abuse  

Unlimited  use  customers  doing  excessive   roaming  on  partner  networks  

Online  educa@on   Student  loan  fraud   Student  IP  in  "high--risk"  country  and  student   absent  from  classes  &  assignments  

9  

Splunk:  Machine  Data  Plaworm  for  Fraud  Use  Cases  

  Machine  Data:  Any  Loca2on,  Type,  Volume  

Answer  Any  Ques2on  

On--   Premises  
Private     Cloud  
Public     Cloud  
Mobile  

Online   Services  

Web   server  

Servers  

Malware  

Fraud   tools  

Networks  

Packaged   Applica@ons  

Storage  

Desktops  

Messaging  

Custom   Applica@ons  

Online   Shopping  
Cart  

Badge   records  

Authen@ca@ons  

GPS   Loca@on  

Call  Detail  

Databases/   transac@ons  

Payment   Systems  

Records  

Smartphones   and  Devices  

Ad  hoc     Monitor     Report  and     Custom     Developer   search   and  alert   analyze   dashboards   PlaJorm  

External  Lookups  

Asset     Employee   Threat  

Info  

Info  

feeds  

Data   stores  

10  

Supports  Many  Needs  of  An@--Fraud  Teams  

Fraud   Monitoring  and  
Detec@on  

Fraud   Inves@ga@ons  

Fraud  Analy@cs   Enhance  Exis@ng  

and  Repor@ng  

Fraud  Tools  

Why  Splunk  for  Fraud  Detec@on?  

Exis,ng  Fraud  Tools  

Splunk  for  Fraud  

RIGID  AND  INFLEXIBLE  

  

  

NARROW  VIEW  OF  FRAUD  

  

  

SCALE  AND  SPEED  ISSUES  

  

DIFFICULT  TO  DEPLOY;  

LIMITED  ROI  

  

  

1

FLEXIBLE         BROAD  VIEW         SCALE  &  SPEED      FAST  VALUE;   COMPELLING  ROI        

Splunk  For  Fraud  Detec@on  Across  Ver@cals  

Financial  Services  

Mobile/Telecom  

eCommerce    

Health  Care  

Online  Educa2on  
1 3

Government  

Leading  Online  Retailer  
· Challenge:  Fraud  inves@ga@ons  were  too  slow  with  no  unified  logging  
­ Inves@ga@on  took  12  hours  using  10  resources   ­ 90  minutes  from  alert  to  inves@ga@on  
· Enter  Splunk:  Big  data,  flexible  plaworm  to  accelerate  inves@ga@ons  
­ Sample  pauerns  of  fraud  Splunk  looks  for:  
ê One  referrer  string  or  IP  logging  into  mul@ple  user  accounts   ê One  referrer  string  or  IP  crea@ng  many  new  accounts  to  get  account  opening  incen@ves  OR  opening  new  account  to  fast  to  be  human   ê Single  IP  excessively  selec@ng  the  "I  forgot  my  password"  op@on  for  several  accounts   ê User  traffic  coming  from  "rent  a  VM",  cloud--based  services   ê Brute  force  password  guessing   ê Customer  info  that  should  be  stable  changing  oKen:  email/physical  address,  payment  card,  etc  
­    Splunk  unites  all  context  around  possible  fraud  on  single  dashboard   ­ Splunk  adds  together  point  fraud  tool  scores  to  give  a  consolidated  transac@on  score   ­ Many  fraud  visualiza@ons,  including  geo--IP  mapping   ­ Inves@ga@on  takes  0.2  hours  using  2  resources   ­ Under  10  minutes  from  alert  to  inves@ga@on   ­ Use  Splunk  for  fraud,  security,  compliance,  IT  Ops,  and  App  Mgmt  
14  

Top  5  Online  University    
· Challenge:  Needed  solu@on  to  detect  fraudulent  student  loans    
­ Difficult  to  iden@fy  fraudulent  loans  and  auendance  ac@vity  
· Enter  Splunk:  Significant  cost  savings  in  reduced  loan  fraud  
­ Cross--check  students  with  loans  against  classroom  ac@vity  to  iden@fy  fraudsters   ­ Stopped  $10s  of  millions  of  fraudulent  funds  from  distribu@on   ­ Reputa@on  and  Dept  of  Educa@on  accredita@on  maintained   ­ Single  tool  for  fraud,  compliance,  cybersecurity,  IT  Opera@ons,  and  Classroom  Ops    
  
15  

Bank  Fraud  Use  Case  
  

Successful  Tier  1  Bank  Real--Time    
Wire  Blocking  Reference
Based  a  Korean  financial  news  in  2014  :  
(Money  Today  2014  12--16)  

On  the  16th  of  December  2014,  financial  community  
revealed  that  "Hana  Bank"  (A  @er  1  bank  in  Korea)  overall  

bank's  fraud  detec2on  rate  has  risen  to  71.7%.    

It  means  that  Hana  Bank  were  able  to  block  70%  above  all   bank's  fraudulent  transac@ons.    Hana  Bank  has  deployed   next  genera@on  fraud  detec@on  last  October  2014.    AKer   they  deployed  the  next  genera@on  fraud  detec@on   plaworm,  there  were  significant  increase  of  fraud  detec@on  

24.8% rate,  originally  from  

  in  January  of  2014.    AKer  

Hana  Bank  started  deploying  the  FDS,  their  fraud  detec@on   rate  immediately  increase  to  66.8,  star@ng  from  last   September.  

Top  Korean  Tier  1  Banks,    

Sorted by the size of Sasspet lunk  Based  FDS  Adop@on  

Splunk Based Real-time Fraud Adoption Status

1   W  Finance  Holdings   2   S  Financial  Group   3   H  Financial  Group  

  Splunk  based  FDS   Not  Decided  
  Splunk  based  FDS  

4   K  Financial  Group   5   I  Bank  

Local  Compe@tor     Splunk  based  FDS  

6   K  Bank   7   E  Bank   8   S  Bank  

Local  Compe@tor     Splunk  based  FDS     Splunk  based  FDS  

Out of eight tier 1 banks, five banks (63%) have selected Splunk as real-time fraud detection platform, including the largest bank in Korea.

High  Impact  Customer  Values  Created  

Various Major Financial Institutions

Detec@on   Rate  of  a   @er  1  Bank  
71%  
  
24%  

Asset  
Blocked  
Amount  
$X0,000   Daily  

Incident     Inves@ga@on  
@me  
Fast   Effec@ve  

Financial   Credibility  
J  
Sa@sfac@on  

Long  term   Biz  Impact  
Rapid  
Increase  

Turning  all  financial  transac@ons  to  cri@cal  Intelligence

Finance  Service  Industry  Needs  >  
What are some of the technical challenges in managing data?

Ability to process transactions in "
real-time for detection of fraud

Ability to process large volumes of transactional data for long period of time.

Ability to analyze complex patterns " of transactions and be able to profile
user objects

MISSION    :  
   Advanced fraud detection platform that 
COLLECT / PROCESS / ANALYZE Financial transactions in real-time 

Sensitive Data

High Entrance Barrier

Mission Critical

Real-time Impact

The  Jargon  "Channels"
Tier 1 banks offer many different channels to access their services:

BANKING  SERVICE  CHANNELS

ATMs

Tellers

Online   Banking

Telephone   Banking

Mobile   Banking

Core  Service  Plaworm  BUS

Highest  Value  

Banking  Plaworm  Service

Servers  /  OS

Applica@on  /  Database

Network

Security

Splunk  For  Core  Financial  Transac@ons  

ATMs

Tellers

Online   Banking

Telephone   Banking

Mobile   Banking

200  G   Daily     Volume  

Core Service Platform BUS (Message Queue)
IBM  MQ  /  Oracle  Weblogic  /  Core  Database
Each  transac@ons  as  separate  files  in  AIX  server  file  system §   Real--2me  collec2on  of  core  banking  transac@ons   §   32,000+  Types  of  different  transac@on  formats  

Why  Is  This  Such  A  Big  Deal?    Reason  1  

· Tradi@onal

6~12  Hour  Batch  Collec@on  

Core  Banking  System     

Batch   Data  Collec@on  
System  

Processing   RDBMS  

Limited  Amount  Data  Processed  
Data  Analysis   System  

 Splunk
Core  Banking  System     

Real@me  Data  Collec@on  

Ability  Process  big  data  (200G  +  per  day)  

Real--@me   Data  Collec@on

§ Big  Data  Plaworm   § High  Performance

Complying  customer's  30  seconds  fraud  detec@on  and  blocking  requirement

Why  Is  This  Such  A  Big  Deal?    Reason  2  
· Ability t  o p  rocess 3  2,000 t  ypes o  f d  ifferent t  ransac@on t  ypes  

32,000  Types   of  different   transac@ons  

RDBMS

§ RDMBS Can't model 32,000 types of different formats
§ Because of that, can't " query/ search

32,000  Types   of  different   transac@ons  

§ As a No-SQL database process all 32,000 types
§ Able to search all data based on value-pairs matching

How  Do  Transac@ons  Look  Like?  
· Format e  xample 1    
00230223002342093240032129123420312....

Bank  Code  

Service  Code  

Branch  Code  

· Format e  xample 2    

Ac@on  Code  

Account  Code  

Validate  Code  

New

Change Position

00230223002342093240023003212912342....

Bank  Code  

Service  Code  

Branch  Code  

Ac@on  Code  

Sub  Ac@on  Code  
Account  Code  
v 32,000 types of these formats

New  Breed  Of  Bank  Robbers
Today's  bank  robbers  know  you  more  than  you  know  yourself....  

Your  Bank  Info   Your  Personal  Info   Your  Human  Network   Your  Computer  

Your  Card  Info   Your  Bank  Login   Your  Financials  

Banking  Fraud  Example  :  Phase  1  

Internet  
Internet  Banking   Customer  
Customer  PC   Hacking  /     Phishing  /   Pharming  

Bank  Network  

Channels   Internet  Banking
Teller ATM Phone  Banking Mobile  Banking

Mul@  Channel   Applica@on  

Customer  Account  

With  in  60  Sec  

Transac@on   Flows  
Normal  Transfer  1 Normal  Transfer  2 Issue  a  new  Cer@ficate Acquire  accounts  info Fraudulent  Transfer  1 Fraudulent  Transfer  2

Hacker  

Characteris@c  Of  Financial  Fraud  And  Abuse  

1011111010101000001111 0111110110111110101001 0001011110111110101001 10

1011111010101000001111 0111110110111110101001 0001011110111110101001 10

Fast
· Knows  what  to  do,   fast  transfers  to  a   temporary  accounts  

Intelligent
· Highly    technical,  access   the  target  accounts     with  proper  creden@als   and  cer@ficates  

Structured
· Works  as  in  teams  for   different  roles  

Banking  Fraud  Example  :  Phase  2  
Bank  Network  
Exposed  Customer  Bank  Accounts  

Hacker   ATM  

Target  Intermediate   Account  

ATM  

Hacker  

Account  Cancella@on

How  Can  Fraud  Be  Stopped?  

Channel  
Internet Banking Customer
Access Terminal
ATM Customer

Bank  Service  Plaworm  

Multi Channel Application Commit

Customer Account

Transaction Status
ALLOW TRANSFER

Allow

STOP TRANSFER

ATM

FRAUD DETECTION PLATFORM

Suspicious Transaction
Risk Management (Automated / Manual )

Success Factor : Real-time

MCA  Server  

Pre  Processing   Server  

Forwarder   Uncooked   Data  

Forwarder  

Splunk  Cluster  

Profile  DB  

Internet  

Banking  Service  

Plaworm  

Results  

LBF   Real-time

Search     Head  

Real--@me   collec@on   of  raw  data   send  for  pre   processing  

Turning  banking   format  data   into  Key  Value   format  (Cust   Mod)  

Processing  Structure  

Splunk  Cluster      Processing  of  

ingests  Key      marts  and  

Value  format   data  into   Indexers  

   applying  

  

complex  Fraud   Rules  

Results  of  Fraud   detec@on   results  send   over  to  Internet   banking  server  

The  fraudsters   are  warned   with  warning   and  aborts  wire   transfer  

32 © 2015 Splunk Inc.

How Does Splunk Make It Possible?

Online   Banking   Customer  
Hacker  

Account  Transac@ons  
Normal  Transfer  1 Normal  Transfer  2 Issue  a  new  Cer@ficate Acquire  accounts  info Fraudulent  Transfer  1 Fraudulent  Transfer  2

>  Fraudulent  PaAerns  /  Condi2ons  Combo  
1. Different  Channel   2. Different  MAC  Address  with  no  prior  history   3. Issue  a  new  cer@ficate   4. Target  wire  account  with  no  prior  history   5. Create  new  cert  and  wire  transfer  happens  in  5  
minutes

Index=mul@_access  |  c   heck_hist_mac  mac  |     check_hist_wire  target_account    

FRAUD  DETECTION  

PLATFORM  

Real--@me   Transac@ons  

33 © 2015 Splunk Inc.

Account  history   Summary  

MAC  history   Summary  

Wire  history   Summary  

Concept of "Profiling"

 Extrapolation of information about something, based on known qualities.

Wire  Request  /  Ac@on  
Good  Customer   "Laura"  

Request Committed

Compare the transactions with previous trending
34 © 2015 Splunk Inc.

Update the transactions so the profile is updated to reflect as new behavior
Profiling     Database  

Concept of "Entity Profiling"

Purpose  
· Baseline  customer   behaviors  
· Design  analysis  model  

Profiling  Database  
CUST_ID  :  Laura   DEVICE  :  xx:xx:xx:01  xx:xx:xx:03   IP  ADDR  :  12.11.11.3    12.11.11.23   TARGET  ACCT  :    HB092831    HB726383   .....Other  user  specific  profiling  info  ....  

Normal  Transfer  1    :    Target  ACCT    HB092831      

Good  Customer   "Laura"  

Normal  Transfer  2    :    Target  ACCT    HB726383  

35 © 2015 Splunk Inc.

The  target  account   exists  already  in   profiling  DB  

Concept of "Entity Profiling"

Purpose  
· Baseline  customer   behaviors  
· Design  analysis  model  

Profiling  Database  
CUST_ID  :  Laura   DEVICE  :  xx:xx:xx:01  xx:xx:xx:03   IP  ADDR  :  12.11.11.3    12.11.11.23   TARGET  ACCT  :    HB092831    HB726383   .....  Other  user  specific  profiling  info  ....  

?  

Fraudster  
36 © 2015 Splunk Inc.

Normal  Transfer  1    :    Target  ACCT    HB092831      
Normal  Transfer  2    :    Target  ACCT    HB726383  

Since  this  is  a   unknown  account,   is  this  legi@mate?  

Fraudulent  Transfer  3    :    Target  ACCT  AB239242

Detecting Based on Profiled Info: Profiling Search

Profiling     Database  

CUST_ID(:(Laura( DEVICE(:(xx:xx:xx:01(xx:xx:xx:3( IP(ADDR(:(12.11.11.3((12.11.11.23( TARGET(ACCT(:((HB092831((HB726383( .....(More(user(specific(profiling(info(....(

!!C! UST_ID(:(Laura( !!D!!!E!!V!!I!C!!E!!(!:!(!x!!x!!:!x!!x!!:!x!!x!:!0!!!1!!(!xx:xx:xx:03! !!I!P!!(!A!!!D!!D!!!R!!(!:!(!1!!2!!.!1!!1!!!.!1!!1!!.!3!!(!!!12.11.11.23!
!!T!!A!!!R!!G!!!E!!T!!(A!!!C!!C!!T!!(!:!(!!!!!!!!!!!!!!!!!!!!!!!HB726383! !!.....(Other(user(specific(profiling(info(....(

CUST_ID(:(Laura( DEVICE(:(xx:xx:xx:01( IP(ADDR(:(12.11.11.3( TARGET(ACCT(:( .....(Other(user(specific(profiling(info(....(

Search Data

Insert / Update new profiling attributes

Create New Customer Profile

Search 1 : Profiling Search (Scheduled -2m@m ~ -1m@m)
· Create new customer profiles · Update atributes of profiles based on analysis criteria

37 © 2015 Splunk Inc.

Detecting Based on Profiled Info: Detecting Search

Profiling     Database  

CUST_ID(:(Laura( DEVICE(:(xx:xx:xx:01(xx:xx:xx:3( IP(ADDR(:(12.11.11.3((12.11.11.23( TARGET(ACCT(:((HB092831((HB726383( .....(More(user(specific(profiling(info(....(

CUST_ID(:(Laura( DEVICE(:(xx:xx:xx:01(xx:xx:xx:3( IP(ADDR(:(12.11.11.3((12.11.11.23( TARGET(ACCT(:((HB092831((HB726383( .....(More(user(specific(profiling(info(....(

CUST_ID(:(Laura( DEVICE(:(xx:xx:xx:01(xx:xx:xx:3( IP(ADDR(:(12.11.11.3((12.11.11.23( TARGET(ACCT(:((HB092831((HB726383( .....(More(user(specific(profiling(info(....(

Realtime Data

Lookup / Join Profiled Data

Match rule alerts With profile DB

Kick off an event / send signal to banking system

Wire  Fraud  Alert

Search 2 : Pattern Detection Search (Real-time RT)
· Real-time searching, Joining lookups and other verification · Match the status in profile DB for condition verification

38 © 2015 Splunk Inc.

Processing  Logic  
Fraudulent   Pauern  

Machine  Learning  (Anomaly  detec@on)  
Normal   Pauern   Fraudulent   Pauern  

Importance  Of  Being  Transac@ons  Data  Store  
Enterprise  Adop@on  
Big  Data,  Opera@onal  Intelligence  

Transac@on  Fraud     Detec@on

An@  Money     Laundry

Internal/  External     Compliance

FSI  Big  Data     Analy@cs

Why  is  This  So  Significant?  
These transaction data is at the heart of all financial service analysis
FDS Fraud Detection System

Government  Regulations
IT OPS
Security

Expects  various  financial   service  Innova@ons  

Big Data Target Marketing
Business Analytics
Future Data Projects

Synergy  Factors  of  Splunk  (To  Joe)

Near Realtime  CEP
Real-time Collection > Storage > Query
1

Big Data  Platform
Storing and Summarization
of BIG DATA
2

Analysis / Integrations
Analyze, Visualize and extend to Service
3

Integrated Real-time Fraud Detection/ Prevention Platform

Demo  

Take--Aways  
 Pauerns  of  fraud  are  in  machine  data    Splunk  can  harness  machine  data  to  detect,  inves@gate,  and  report  
on  a  wide  range  of  fraud  
 Splunk  can  address  the  more  demanding  and  technical  fraud  use   cases  (financial  services,  etc)  
44  

What  Now?  
· Go  the  "Compliance  &  Fraud"  booth  at  the  App  Showcase   · Other  sessions:  
· "Exposing  Fraud  and  Risk  for  Health  Agencies",  Tues,  3--3:45   · "Orrstown  Bank",  Tues,  5--5:45   · "From  Zero  to  Preuy  Robust  Fraud  Detec@on  Tool",  Wed,  10--10:45   · "Detec@ng  Bank  Account  Takeover  and  Fraud  Auacks  with  Splunk",  Wed,  2--2:45  
· Info,  case  study  at:  
Ø Splunk.com  >  Solu@ons  >  Security  &  Fraud  >  Fraud  
· Contact  sales  team  at  Splunk.com  >  Contact  Us  
45  

Ques@ons?  
46  

THANK  YOU  

