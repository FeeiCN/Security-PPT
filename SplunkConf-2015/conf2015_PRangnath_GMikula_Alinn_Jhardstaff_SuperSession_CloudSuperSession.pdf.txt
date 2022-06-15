Copyright  ©  2015  Splunk  Inc.  
Cloud  Supersession  
Praveen  Rangnath  
Sr.  Director  of  Cloud  Product  Mktg,  Splunk      
Gary  Mikula  
Sr.  Director  of  InformaDon  Security,    FINRA  
Andrew  Linn  
SVP,  CISO,  Orrstown  Bank  
Joe  Hardstaff  
Business  Systems  Architect,  Gatwick  Airport  

Disclaimer  
During  the  course  of  this  presentaDon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauDon  you  that  such  statements  reflect  our   current  expectaDons  and  esDmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaDon  are  being  made  as  of  the  Dme  and  date  of  its  live   presentaDon.  If  reviewed  aYer  its  live  presentaDon,  this  presentaDon  may  not  contain  current  or   accurate  informaDon.  We  do  not  assume  any  obligaDon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiDon,  any  informaDon  about  our  roadmap  outlines  our  general  product  direcDon  and  is  subject  to   change  at  any  Dme  without  noDce.  It  is  for  informaDonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaDon  either  to  develop  the  features  
or  funcDonality  described  or  to  include  any  such  feature  or  funcDonality  in  a  future  release.  
2  

Agenda  
 Splunk  Cloud  Overview    Customer  Use  Cases  
­ FINRA:  AWS  Cost  Management   ­ Orrstown  Bank:  Debit  Card  Fraud   ­ Gatwick  Airport:  Business  AnalyDcs  and  AircraY  Turnaround  Time  
 Splunk  Cloud  ­  What's  Next    Conclusion  
3  

SaaS  

Cloud  Por`olio  
So7ware  

Apps  

· App  for  AWS   · App  for  ServiceNow   · App  for  Salesforce   · More  SaaS  apps...  

4  

Splunk  Cloud  Value  Drivers  

Instant  

Secure  

Reliable  

Hybrid     

100%  UpDme  

5  

Thought  Experiment  
      If  CPU  uDlizaDon  reaches  x%,  trigger  an  alert        
6  

Thought  Experiment  
   Raise  your  hand  if  x  is  between  50%  --  100%  
  
7  

Thought  Experiment  
   Raise  your  hand  if  x  is  between  10%  --  30%  
  
8  

FINRA  

Who We Are
 FINRA--the Financial Industry Regulatory Authority-- is an independent, non-governmental regulator for all securities firms doing business with the public in the United States
 FINRA protects investors by regulating brokers and brokerage firms and by monitoring trading on U.S. stock markets
 FINRA monitor over 6 billion shares traded on the stock market each day
 FINRA handles more `Big Data' on a daily basis than the Library of Congress or Visa®--to build a holistic picture of the trading market
 FINRA ­ Deter, Detect, Discipline

Investor Protection

10 FINRA Information Security Engineering  Copyright 2015 FINRA

Historical View
 Cyclic Processes · POC ­ Budget Approval ­ SDLC - Maintenance
 Defined Roles · Coders Code · Managers Manage · Administrators Administer
 Agile Development/Cloud Computing · Developers Make These Decisions: ­ Security ­ Financial ­ Architecture · And It's All Point and Click
 Hacking Redefined Security · Defensive Coding · Baked In, Not Painted On

"You guys start coding, I'll go find out what the users want."
11 FINRA Information Security Engineering  Copyright 2015 FINRA

Same Challenges/Different Environment

 Security · Engaged All Necessary AWS Security Features · Are we Firewalled Correctly
 Compliance · Followed All Published Standards
 Networking · Placed Servers on the Correct Network
 Finance · Stayed within Budget
 Capacity Planning · Used Resources Optimally
 But, Now in a Decentralized Model · It's déjà vu all over again...Yogi Berra

"With great power comes great responsibility."

12 FINRA Information Security Engineering  Copyright 2015 FINRA

Project Cost Management in AWS
Harnessing the Power of Splunk

Where We Were
 Traditional Financial Review Cycles Too Long · Quarterly Reviews
 AWS Detailed Billing Reports Are Daunting · Over 10 Million Line Items
 Project Managers Need Focus · Am I Below My Budget? · Where Are My Costs Going? · Who's Spending Them?
 Manual Compilation of Reports · Integrate FINRA Data
14 FINRA Information Security Engineering  Copyright 2015 FINRA

Approach Chosen
§ Use Splunk as Process/Delivery System · Ability to Collect/Analyze/Visualize
 Collect AWS Billing Data in Splunk · Billing Data from S3 bucket (Daily Load) · Detailed Line Items w/Resources & Tags
 Data Enrichment · Project Code Lookups · Forecast Projections · Billing Adjustments
 Build Interfaces · FINRA AWS Billing App

15 FINRA Information Security Engineering  Copyright 2015 FINRA

FINRA AWS Billing App
16 FINRA Information Security Engineering  Copyright 2015 FINRA

AWS Billing App
FINRA Information Security Engineering  Copyright 2015 FINRA

AWS Billing App
18 FINRA Information Security Engineering  Copyright 2015 FINRA

Impact ­ Reduced Costs
 Focus on Low Hanging Fruit
· Shutting Down Services over Weekends/Evenings · Storage Sun Setting/Dormant EC2 · Identify AWS Services with Highest Spending · Projects Over Budget
 Results
· 13.5% Reduction in Billing Line Items in 1 Month
 Better Forecast Projections
· Feedback and Control
19 FINRA Information Security Engineering  Copyright 2015 FINRA

THANK YOU
FINRA Information Security Engineering  Copyright 2015 FINRA

Orrstown  Bank  

About  
Orrstown  Bank  is  a  community  bank  in  PA  and  MD  with  about  $1.2   billion  in  assets   Orrstown  has  adopted  a  cloud--first  model  for  technology  soluDons  
Orrstown  has  been  running                                                                      for  over  1  year  to   facilitate  operaGonal  and  security  data  analyGcs  
$ Orrstown  conDnues  to  explore  opportuniDes  to  use                                                                 to  solve  addiGonal  problems  such  as  Fraud  
22  

Overview  of  the  Problem  

Amount  charged  off  due  to  Card  Fraud  has    

$   grown  435%  in  the  past  3  years     $200,000.00    

  

  $150,000.00    

  

  $100,000.00    

  $34,566.05    

  $50,000.00    

  $--        

2013  

  $105,259.15     2014  

  $185,173.33     2015  

This  paiern  represents  a  similar  if  not   conservaGve  experience  as  our  peers  

Many  soluGons  offered  to  smaller  banks     cannot  keep  pace  with  the  fraud  paierns  
23  

Fraudulent  Behavior  Paierns  

AQacker  steals  card  data  from...  
OYen  the  first  fraudulent   transacDon  is  followed  shortly   by  many  other  transacDons  
Fraudulent  card  present  transacDons   usually  occur  at...   · Grocery  stores   · Pharmacies   · Walmart   · GameStop   · Best  Buy  

...and  local  merchants  

Card  data  sold  on  the  black  market,   cloned,  and  used....  

Normal  Card--Present   Shopping  Area  

Smarter  criminals  are   selling  cards  back  into   the  local  area  from  which   the  card  was  stolen  to   evade  fraud  detecDon  

Card  not  present  transacDons  at...   · Apple   · On--line  electronics  retailers   · Travel  
24  

Card  Fraud  PredicDon  ­  App  Architecture  

Results  and  the  Business  Case  

IniDal  experiment  with  1  quarter's  worth  of  transacGons  idenDfied...  

· Approximately  50%  of  the  fraudulent  card  present  transacDons  

· A  small  populaDon  of  only  330  false  posiDves  

· Of  the  fraudulent  transacDons  idenDfied,  there  were  250  instances  of  subsequent  

fraudulent  transacGons  occurred  using  the  same  card  

These  are  the   fraudulent  txns   we  can  stop    

250 Subsequent  instances  of  fraud  =  

  

$300   X   Average  fraudulent  txn  amount  of  

Quarterly  est.  reducDon  in  fraud  losses  of  $75,000  

26  

OperaDonalizing  the  Model  

Prelert  dashboard  displays   calculated  risk  scores  and  
generates  alerts  

Fraudulent  TransacDons   are  marked  up  and  fed  
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

Does  not  stop  the  first   fraudulent  transacGons  but  
prevents  subsequent  
Orrstown  staff  restricts  or   turns  off  the  customer's  card  
Risk  Score   DescripGon  
100.0   Rare  locaDon  for  card,  rare  
locaDon  for  all  cards,  risky   merchant    
76.0   Rare  locaDon  for  card,  risky  
merchant  

For  borderline  risk  scores,   Orrstown  staff  calls  the   customer  to  verify  the   transacDon  

Is  the  txn   NO   legit?  

27  

PotenDal  

PotenGal  for                                                                      ...  

Card  Txns  

Card  Fraud   InvesGgator  

On--Line  Txns   Account  Info  

§ ConDnue  to  use  Prelert  as  an  addiGonal  layer  of   fraud  control  beyond  what  our  process  offers  
§ Explore  feeding  addiGonal  informaGon  (e.g.  on--line   transfers,  etc)  into                                        via                                                  to   idenGty  other  customer  behavior  anomalies  

PotenGal  for  the  Industry...  
§ A  centralized  Fraud  InvesGgator  service  to  which   many  banks  can  subscribe  
§ The  model  improves  by  learning  from  a  larger   volume  of  informaDon  
§ Each  bank  can  sDll  maintain  the  ability  to  influence   the  model  based  on  their  local  experiences  

Bank   Bank  

Bank  

FI  

Card  Fraud  InvesGgator  

Bank   FI  

28  

THANK  YOU  

   50%  
30  

Gatwick  Airport  

Who  are  Gatwick  Airport?  

Busiest  single  runway  airport  in  the  world  

· 925  Flights  per  day  in  August  2015   · 40  Million  passengers  by  2016   · 10  Years  ahead  of  UK  Government  
predicDons  on  passenger  numbers  
· 52  Airlines  flying  to  200  locaDons  in   90  countries  
· We  fly  to  more  desDnaDons  than   any  other  UK  airport  

Screenshot  here  

32  

Proof  of  Value  

Performance  &  Availability  
Used  to  scan  boarding  passes  to  ensure:   · Right  airport,  terminal,  day,  Dme   · Flight  not  cancelled  or  delayed  

Splunk  provided:   · Insight  on  performance  gains     · ReducDon  in  incidents   · At  a  glance  root  cause  analysis  

Screenshot  here  

33  

The  Dawn  of  RealizaDon  
Compliance  with  SQR  
First  aiempt  with  business  data:   · How  are  we  doing  with  TIP?   · Where  are  passengers  going?   · Are  there  problems  with  travel?  
Splunk  provided:   · Insight  into  security  compliance   · Prepare  security  to  look  for  specific  items   · Understand  road  and  rail  incidents  &  their  effect   · A  combinaDon  of  historical  fact  with  current  event  
34  

Terminal  Performance  
Monitor  the  moving  parts  
· Road,  rail  &  bus  services   · Building  management  system   · Passenger  informaDon  displays   · Electronic  way--finding   · Manned  check--in  desks  in  use   · Common  use  ­  self  service  kiosks   · Self  service/automated  bag  drop     · Area  occupancy  &  queue  measurement   · Security  gates   · X--Ray  throughput   · Gate  announcements/call  to  gate  
35  

Terminal  Dashboard  

At--A--Glance  Performance  
Provides:   · Passenger  flow  monitoring   · Early  view  of  opportuniDes   · Flag  where  we  can  do  beier   · Highlight  potenDal  issues   · Impact  analysis   · Allows  Dmely  intervenDon  

Screenshot  here  

36  

      Historical  Fact/Current  Event  
DisrupDon  Cause  &  Effect  ­  Where  could  Splunk>Cloud  take  us?  
· Travel  DisrupDon:  
­ Capture  road,  rail,  bus  disrupDon  &  expected  duraDon   ­ ReducDon  in  the  expected  passenger  numbers   ­ Check--in,  security,  airlines,  ground  handlers  informed  
· Passenger  Flow:  
­ Capture  passenger  flow  from  curb  to  gate  &  back   ­ Reduce  queues,  congesDon  &  pinch  points   ­ Improve  on  the  passenger  experience  
· Social  Media:  
­ Capture  feedback  from  Twiier,  Facebook,  Yammer   ­ Provides  real  Dme  informaDon  about  Gatwick   ­ When  it's  not  perfect,  we  can  make  it  great  again  
37  

THANK  YOU  

Splunk  Cloud  ­  What's  Next  

Self--Service  
Spend  less  Dme  configuring,  more  Dme  analyzing  
· Index  Management     · Sourcetype  Management   · Seamless  App  InstallaDon     · Forwarder  Visibility  &  
Management  
40  

Data  Roll  
· Move  data  to  S3  buckets   · Store  data  for  compliance  
reasons   · Keep  data  searchable  
41  

More  ApplicaDons  for  Cloud  Data  Sources  
· Gain  SaaS  /  PaaS  visibility     · Correlate  across  cloud  data  
sources   · Feed  into  Splunk  Enterprise  
Security  and  IT  Service   Intelligence  
42  

Security  AiestaDons  

Completed  

In--process  

43  

Conclusion  
What  can  you  do  with..  
44  

Hear  From  Our  Customers  
45  

