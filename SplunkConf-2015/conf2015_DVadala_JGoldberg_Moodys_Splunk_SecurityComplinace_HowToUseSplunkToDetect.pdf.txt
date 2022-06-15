Copyright  ©  2015  Splunk  Inc.  
How  to  Use  Splunk     To  Detect  Malicious   Insiders  
Derek  Vadala  
CISO  and  Managing  Director,  Moody's    
Joe  Goldberg  
Technical  Product  MarkeGng,  Splunk  

Disclaimer  
During  the  course  of  this  presentaGon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauGon  you  that  such  statements  reflect  our   current  expectaGons  and  esGmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaGon  are  being  made  as  of  the  Gme  and  date  of  its  live   presentaGon.  If  reviewed  aVer  its  live  presentaGon,  this  presentaGon  may  not  contain  current  or   accurate  informaGon.  We  do  not  assume  any  obligaGon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiGon,  any  informaGon  about  our  roadmap  outlines  our  general  product  direcGon  and  is  subject  to   change  at  any  Gme  without  noGce.  It  is  for  informaGonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaGon  either  to  develop  the  features  
or  funcGonality  described  or  to  include  any  such  feature  or  funcGonality  in  a  future  release.  
2  

©  2015  Moody's  CorporaGon,  Moody's  Investors  Service,  Inc.,  Moody's  AnalyGcs,  Inc.    and/or  their  licensors  and  affiliates  (collecGvely,   "MOODY'S").  All  rights  reserved.  
CREDIT  RATINGS  ISSUED  BY  MOODY'S  INVESTORS  SERVICE,  INC.  AND  ITS  RATINGS  AFFILIATES  ("MIS")  ARE  MOODY'S  CURRENT  OPINIONS   OF  THE  RELATIVE  FUTURE  CREDIT  RISK  OF  ENTITIES,  CREDIT  COMMITMENTS,  OR  DEBT  OR  DEBT--LIKE  SECURITIES,  AND  CREDIT  RATINGS   AND  RESEARCH  PUBLICATIONS  PUBLISHED  BY  MOODY'S  ("MOODY'S  PUBLICATIONS")  MAY  INCLUDE  MOODY'S  CURRENT  OPINIONS  OF  THE   RELATIVE  FUTURE  CREDIT  RISK  OF  ENTITIES,  CREDIT  COMMITMENTS,  OR  DEBT  OR  DEBT--LIKE  SECURITIES.  MOODY'S  DEFINES  CREDIT  RISK   AS  THE  RISK  THAT  AN  ENTITY  MAY  NOT  MEET  ITS  CONTRACTUAL,  FINANCIAL  OBLIGATIONS  AS  THEY  COME  DUE  AND  ANY  ESTIMATED   FINANCIAL  LOSS  IN  THE  EVENT  OF  DEFAULT.  CREDIT  RATINGS  DO  NOT  ADDRESS  ANY  OTHER  RISK,  INCLUDING  BUT  NOT  LIMITED  TO:   LIQUIDITY  RISK,  MARKET  VALUE  RISK,  OR  PRICE  VOLATILITY.  CREDIT  RATINGS  AND  MOODY'S  OPINIONS  INCLUDED  IN  MOODY'S   PUBLICATIONS  ARE  NOT  STATEMENTS  OF  CURRENT  OR  HISTORICAL  FACT.  MOODY'S  PUBLICATIONS  MAY  ALSO  INCLUDE  QUANTITATIVE   MODEL--BASED  ESTIMATES  OF  CREDIT  RISK  AND  RELATED  OPINIONS  OR  COMMENTARY  PUBLISHED  BY  MOODY'S  ANALYTICS,  INC.  CREDIT   RATINGS  AND  MOODY'S  PUBLICATIONS  DO  NOT  CONSTITUTE  OR  PROVIDE  INVESTMENT  OR  FINANCIAL  ADVICE,  AND  CREDIT  RATINGS  AND   MOODY'S  PUBLICATIONS  ARE  NOT  AND  DO  NOT  PROVIDE  RECOMMENDATIONS  TO  PURCHASE,  SELL,  OR  HOLD  PARTICULAR  SECURITIES.   NEITHER  CREDIT  RATINGS  NOR  MOODY'S  PUBLICATIONS  COMMENT  ON  THE  SUITABILITY  OF  AN  INVESTMENT  FOR  ANY  PARTICULAR   INVESTOR.  MOODY'S  ISSUES  ITS  CREDIT  RATINGS  AND  PUBLISHES  MOODY'S  PUBLICATIONS  WITH  THE  EXPECTATION  AND   UNDERSTANDING  THAT  EACH  INVESTOR  WILL,  WITH  DUE  CARE,  MAKE  ITS  OWN  STUDY  AND  EVALUATION  OF  EACH  SECURITY  THAT  IS   UNDER  CONSIDERATION  FOR  PURCHASE,  HOLDING,  OR  SALE.    
MOODY'S  CREDIT  RATINGS  AND  MOODY'S  PUBLICATIONS  ARE  NOT  INTENDED  FOR  USE  BY  RETAIL  INVESTORS  AND  IT  WOULD  BE  RECKLESS   FOR  RETAIL  INVESTORS  TO  CONSIDER  MOODY'S  CREDIT  RATINGS  OR  MOODY'S  PUBLICATIONS  IN  MAKING  ANY  INVESTMENT  DECISION.    IF   IN  DOUBT  YOU  SHOULD  CONTACT  YOUR  FINANCIAL  OR  OTHER  PROFESSIONAL  ADVISER.  

NO  WARRANTY,  EXPRESS  OR  IMPLIED,  AS  TO  THE  ACCURACY,  TIMELINESS,  COMPLETENESS,  MERCHANTABILITY  OR  FITNESS  FOR  ANY   PARTICULAR  PURPOSE  OF  ANY  SUCH  RATING  OR  OTHER  OPINION  OR  INFORMATION  IS  GIVEN  OR  MADE  BY  MOODY'S  IN  ANY  FORM  OR   MANNER  WHATSOEVER.  
Moody's  Investors  Service,  Inc.,  a  wholly--owned  credit  raGng  agency  subsidiary  of  Moody's  CorporaGon  ("MCO"),  hereby  discloses  that   most  issuers  of  debt  securiGes  (including  corporate  and  municipal  bonds,  debentures,  notes  and  commercial  paper)  and  preferred  stock   rated  by  Moody's  Investors  Service,  Inc.  have,  prior  to  assignment  of  any  raGng,  agreed  to  pay  to  Moody's  Investors  Service,  Inc.  for   appraisal  and  raGng  services  rendered  by  it  fees  ranging  from  $1,500  to  approximately  $2,500,000.  MCO  and  MIS  also  maintain  policies   and  procedures  to  address  the  independence  of  MIS's  raGngs  and  raGng  processes.  InformaGon  regarding  certain  affiliaGons  that  may  exist   between  directors  of  MCO  and  rated  enGGes,  and  between  enGGes  who  hold  raGngs  from  MIS  and  have  also  publicly  reported  to  the  SEC   an  ownership  interest  in  MCO  of  more  than  5%,  is  posted  annually  at  www.moodys.com  under  the  heading  "Investor  RelaGons  --   Corporate  Governance  --  Director  and  Shareholder  AffiliaGon  Policy."  
For  Australia  only:  Any  publicaGon  into  Australia  of  this  document  is  pursuant  to  the  Australian  Financial  Services  License  of  MOODY'S   affiliate,  Moody's  Investors  Service  Pty  Limited  ABN  61  003  399  657AFSL  336969  and/or  Moody's  AnalyGcs  Australia  Pty  Ltd  ABN  94  105   136  972  AFSL  383569  (as  applicable).  This  document  is  intended  to  be  provided  only  to  "wholesale  clients"  within  the  meaning  of  secGon   761G  of  the  CorporaGons  Act  2001.  By  conGnuing  to  access  this  document  from  within  Australia,  you  represent  to  MOODY'S  that  you  are,   or  are  accessing  the  document  as  a  representaGve  of,  a  "wholesale  client"  and  that  neither  you  nor  the  enGty  you  represent  will  directly  or   indirectly  disseminate  this  document  or  its  contents  to  "retail  clients"  within  the  meaning  of  secGon  761G  of  the  CorporaGons  Act  2001.   MOODY'S  credit  raGng  is  an  opinion  as  to  the  creditworthiness  of  a  debt  obligaGon  of  the  issuer,  not  on  the  equity  securiGes  of  the  issuer   or  any  form  of  security  that  is  available  to  retail  clients.  It  would  be  dangerous  for  "retail  clients"  to  make  any  investment  decision  based   on  MOODY'S  credit  raGng.  If  in  doubt  you  should  contact  your  financial  or  other  professional  adviser.  

ALL  INFORMATION  CONTAINED  HEREIN  IS  PROTECTED  BY  LAW,  INCLUDING  BUT  NOT  LIMITED  TO,  COPYRIGHT  LAW,  AND  NONE  OF  SUCH   INFORMATION  MAY  BE  COPIED  OR  OTHERWISE  REPRODUCED,  REPACKAGED,  FURTHER  TRANSMITTED,  TRANSFERRED,  DISSEMINATED,   REDISTRIBUTED  OR  RESOLD,  OR  STORED  FOR  SUBSEQUENT  USE  FOR  ANY  SUCH  PURPOSE,  IN  WHOLE  OR  IN  PART,  IN  ANY  FORM  OR   MANNER  OR  BY  ANY  MEANS  WHATSOEVER,  BY  ANY  PERSON  WITHOUT  MOODY'S  PRIOR  WRITTEN  CONSENT.    
All  informaGon  contained  herein  is  obtained  by  MOODY'S  from  sources  believed  by  it  to  be  accurate  and  reliable.  Because  of  the  possibility   of  human  or  mechanical  error  as  well  as  other  factors,  however,  all  informaGon  contained  herein  is  provided  "AS  IS"  without  warranty  of   any  kind.  MOODY'S  adopts  all  necessary  measures  so  that  the  informaGon  it  uses  in  assigning  a  credit  raGng  is  of  sufficient  quality  and  from   sources  MOODY'S  considers  to  be  reliable  including,  when  appropriate,  independent  third--party  sources.  However,  MOODY'S  is  not  an   auditor  and  cannot  in  every  instance  independently  verify  or  validate  informaGon  received  in  the  raGng  process  or  in  preparing  the   Moody's  PublicaGons.    
To  the  extent  permiked  by  law,  MOODY'S  and  its  directors,  officers,  employees,  agents,  representaGves,  licensors  and  suppliers  disclaim   liability  to  any  person  or  enGty  for  any  indirect,  special,  consequenGal,  or  incidental  losses  or  damages  whatsoever  arising  from  or  in   connecGon  with  the  informaGon  contained  herein  or  the  use  of  or  inability  to  use  any  such  informaGon,  even  if  MOODY'S  or  any  of  its   directors,  officers,  employees,  agents,  representaGves,  licensors  or  suppliers  is  advised  in  advance  of  the  possibility  of  such  losses  or   damages,  including  but  not  limited  to:  (a)  any  loss  of  present  or  prospecGve  profits  or  (b)  any  loss  or  damage  arising  where  the  relevant   financial  instrument  is  not  the  subject  of  a  parGcular  credit  raGng  assigned  by  MOODY'S.  

For  Japan  only:  Moody's  Japan  K.K.  ("MJKK")  is  a  wholly--owned  credit  raGng  agency  subsidiary  of  Moody's  Group  Japan  G.K.,  which  is   wholly--owned  by  Moody's  Overseas  Holdings  Inc.,  a  wholly--owned  subsidiary  of  MCO.  Moody's  SF  Japan  K.K.  ("MSFJ")  is  a  wholly--owned   credit  raGng  agency  subsidiary  of  MJKK.  MSFJ  is  not  a  NaGonally  Recognized  StaGsGcal  RaGng  OrganizaGon  ("NRSRO").  Therefore,  credit   raGngs  assigned  by  MSFJ  are  Non--NRSRO  Credit  RaGngs.  Non--NRSRO  Credit  RaGngs  are  assigned  by  an  enGty  that  is  not  a  NRSRO  and,   consequently,  the  rated  obligaGon  will  not  qualify  for  certain  types  of  treatment  under  U.S.  laws.  MJKK  and  MSFJ  are  credit  raGng  agencies   registered  with  the  Japan  Financial  Services  Agency  and  their  registraGon  numbers  are  FSA  Commissioner  (RaGngs)  No.  2  and  3   respecGvely.  
MJKK  or  MSFJ  (as  applicable)  hereby  disclose  that  most  issuers  of  debt  securiGes  (including  corporate  and  municipal  bonds,  debentures,   notes  and  commercial  paper)  and  preferred  stock  rated  by  MJKK  or  MSFJ  (as  applicable)  have,  prior  to  assignment  of  any  raGng,  agreed  to   pay  to  MJKK  or  MSFJ  (as  applicable)  for  appraisal  and  raGng  services  rendered  by  it  fees  ranging  from  JPY200,000  to  approximately   JPY350,000,000.  
MJKK  and  MSFJ  also  maintain  policies  and  procedures  to  address  Japanese  regulatory  requirements.  

To  the  extent  permiked  by  law,  MOODY'S  and  its  directors,  officers,  employees,  agents,  representaGves,  licensors  and  suppliers  disclaim   liability  for  any  direct  or  compensatory  losses  or  damages  caused  to  any  person  or  enGty,  including  but  not  limited  to  by  any  negligence   (but  excluding  fraud,  willful  misconduct  or  any  other  type  of  liability  that,  for  the  avoidance  of  doubt,  by  law  cannot  be  excluded)  on  the   part  of,  or  any  conGngency  within  or  beyond  the  control  of,  MOODY'S  or  any  of  its  directors,  officers,  employees,  agents,  representaGves,   licensors  or  suppliers,  arising  from  or  in  connecGon  with  the  informaGon  contained  herein  or  the  use  of  or  inability  to  use  any  such  
informaGon.  

  

  

  

  

3  

  

Agenda  
 How  to  use  Splunk  to  Detect  and  Defeat  Insider  Threats  
 Moody's  Case  Study  
­ Process/People   ­ Splunk  searches  and  visualizaGons  
 IF  TIME:  Live  demo  of  Splunk  Enterprise  Security  and  Splunk  User   Behavior  AnalyGcs  for  insider  threat  detecGon  
4  

What  is  an  Insider  Threat?  

Who  
· Employees   · Former  Employees   · Contractors   · Business  Associates  

Possess  
· Malicious  Intent  
­ Financial  gain   ­ "Whistle  blower"   ­ Revenge  
OR  negligence  /  
carelessness  
· CredenGaled  Access  
· Inside  Info  On:  
­ Where  data  resides   ­ Computer  systems   ­ Security  pracGces  

Threat  
· TheV/loss  of:  
­ Intellectual   property  
­ Customer  data   ­ NaGonal  secrets   ­ ConfidenGal  data  
· Fraud  
· Sabotage  of   systems  

5  

Why  Insider  Threats  are  Hard  to  Catch  

Already  Inside  
   Perimeter  defenses    
do  not  help  

Knowledge  
   Know  where  confidenGal  
data  is  and  possibly   security  measures  in  place  

Creden7aled  Access  
   Usually  have  legiGmate   access  to  confidenGal  data  

Hard  to  Detect  
   Hide  in  a  sea  of   credenGaled  user  acGvity  

Easy  to  Exfiltrate  Data  
   Online  file  sharing  sites  and  
USB  drives  enable  quick   theV  of  large  data  sets  

6  

Machine  Data  Contains  Insider  Threat  AcGvity  

Sources  
File  Server  

User  
20150809124123    ACME\jdoe,  PLANO,  172.16.120.10,   S--1--5--21--3623811018--894934873--30300820--8111,  BC9CB860--DA44--11E0--B014D,  
66.72.53.12,  Mozilla/4.0  +  (compaFGilbele  lo;+cMaGSIoE+n8   .0;  +  Windows+NT+5.1;+Trident/4.0;  
NET+CLR+1.1.4322;  Finance,  hkp://sharepoint/sites/customers  records,  
f823f816--8106--4a11--a352--4f755894ba6c,, F Milaes t nearm  Cuest   omer  Records    1.5.2015.xls,  
16332  

Internal  user   Internal  doc   Data  locaGon  
Internal  user  accesses   customer  records  from   SharePoint  

Email  Server   Web  Proxy  

2cu0p1S-5-0e--00n8  d,,-,-e0S9rTTO   1R2E:D40R:I2V5E.R4,7D5EZL,I,VexEcRh,7--h9u4b2-6-d,e   n--01,,excRhe--mcibpxi-e- nt  
<20130809050115.18154.11234@acme.com>,  johndoe@acme.com,,
685191,1,,,johnnydoe@gmail.com  ,  CustAomkearc  ihnmfoe,  n      t      
Master  Customer  Records  1.5.2015.xls,  ,  port  25,  5MB,2015--08--09T22:40:24.975Z  
2015--08--09  16:21:38  10.11.36.29  98483  148  TCP_HIT  200  200  0  622  --  --  
OBSERVED  POST  HTTP/1.1  0  "Mozilla/4.0  (compaGble;  MSIE  6.0D;  WesinGdnoawGso  NnT     File  n5a.1m;  SeV  1;  .NET  CLR  2.0.50727  InfoPath.1;  MS--RTC  LM  8;  www.dropbox.com;        
Project  Alpha  ConfidenGal  Product  Designs_v5.pdf,  15MB,  MS--RTC  LM  8;    .NET  
CLR  3.0.4506.2152;  )  User  John  Doe,"   User  

Internal  user  emails  same   customer  records  to   personal  email  
Internal  user  uploads   confidenGal  document  to   non--corporate  file  share   (Dropbox)  

7  

How  to  Detect  Insider  Threats    

Step  1  

·

Determine  how  data  might  get  misused  and/or  stolen   and  what  this  looks  like  in  machine  data  

· Collect  relevant  machine  data  from  users  
Step  2   in  one  locaGon  

Step  3  

·

Enrich  with  external  content   (HR,  asset  info)  

· IdenGfy  and  alert  on  
Step  4   pakerns  of  insider  
threats  
88    

Example  Pakerns  of  Insider  Threats  in  Machine  Data  

What  To  Look  For  
Abnormally  high  number  of  file  transfers  to  USB  or  CD/DVD  
Abnormally  high  number  of  files  or  records  downloaded  from  an  internal  file  store   or  database  containing  confidenGal  informaGon  
Abnormally  large  amount  of  data  emailed  to  personal  webmail  accounts  or   uploaded  to  external  file  hosGng  site  

Data  Source  
Opera7ng  system  
File  server  /  Database  
Email  server  /   web  proxy  

Unusual  physical  access  akempts  (aVer  hours,  accessing  unauthorized  area,  etc.)  

Physical  badge  records  /  Authen7ca7on  

Excessive  printer  acGvity  and  employee  is  on  an  internal  watch  list  as  result  of   demoGon  /  poor  review  /  impending  layoff  
User  name  of  terminated  employee  accessing  internal  system  
IT  Administrator  performing  an  excessive  amount  of  file  deleGons  on  criGcal  servers   or  password  resets  on  criGcal  applicaGons  (rogue  IT  administrator)   Employee  not  taking  any  vacaGon  Gme  or  logging  into  criGcal  systems  while  on   vacaGon  (concealing  fraud)  

Printer  logs  /     HR  systems  
Authen7ca7on  /     HR  systems  
Opera7ng  system  /Authen7ca7on  /  Asset   DB    
HR  systems  /  Authen7ca7ons  

9  

Splunk  Use  Cases  for  Insider  Threat  DetecGon  

Detect  and   Respond  

InvesGgaGons  

Complement   ExisGng  Tools  

10  

Case  Study  
11  

Personal  IntroducGon  
 Derek  Vadala,  Moody's  CorporaGon    Moody's  has  two  major  divisions:  
­ Moody's  Investors  Service  ----  provides  credit  raGngs  and  research  covering  debt   instruments  and  securiGes  
­ Moody's  AnalyGcs  ­offers  leading--edge  soVware,  advisory  services  and  research   for  credit  and  economic  analysis  and  financial  risk  management  
­ 10,200  Employees  in  35  countries  worldwide   ­ $3.3  Billion  in  annual  revenue  in  2014  
 CISO  and  head  of  IT  Risk  and  responsible  for  all  of  our  global  informaGon   security  delivery,  including  strategy,  engineering  and  operaGons,     incident  response.  
 With  Moody's  for  12  years;  former  Linux  admin  and  O'Reilly  author  
12  

Can  we  use  Splunk  for  Insider  Threat?  
 These  types  of  projects  (data  loss,  user  monitoring)  have  a  tendency  to  fail   due  to  adopGon  challenges  with  business  partners;  oVen  driven  by  the   security  team  without  buy--in  
 Given  we  have  an  investment  in  Splunk,  we  wanted  to  look  at  whether  we   could  leverage  the  pla·orm  to  hunt  for  and  analyze  potenGal  insider  threat   and  data  loss  events  
 Goals:   ­ Drive  awareness  and  build  consensus  on  our  approach   ­ Analyze  data  needs  prior  to  making  further  investments   ­ IdenGfy  the  most  relevant  places  to  deploy  prevenGon  capabiliGes  
13  

What  do  "We"  Mean  by  Insider  Threat?  
· IntenGonal  misuse  of  legiGmate  access  for  illegiGmate  purposes   · Monitoring  of  highly  privileged  users   · Accidental  misuse  of  legiGmate  access     · External  takeover  and  use  of  credenGals    
14  

How  did  we  get  Started?  
 Internal  workshop  to  determine  what  we  think  bad  actors  might  do,   focusing  largely  on  internal  actors  where  APT  tools  are  not  focused  
 Output  of  workshop  is  a  list  of  potenGally  bad  acGons  and  how  we   would  idenGfy  those  acGons  
­ User  sends  email  to  personal  addresses:  look  for  users  that  don't  typically  do   this  at  volume  (frequency  and  size)  
­ Email  to  compeGtors  ß  this  is  a  good  one,  it's  so  basic  that  no  one  will   argue  against  doing  it  
­ Privileged  users  performing  very  significant  acGons:  mailbox  access,  for   example  
 Workshop  yielded  about  40  acGons  to  develop  against  
15  

Workshop  AcGon  Items  
 For  each  bad  acGon  determine:  
­ Do  we  have  the  data  or  make  a  plan  to  get  it  into  Splunk   ­ Do  we  need  an  alert  or  a  report?   ­ Who  receives  the  output?   ­ How  do  we  escalate  it?  
 Share  the  results  with  stakeholders  and  get  their  feedback:  engineering   teams,  invesGgaGon  teams,  risk  commikees  
 Gain  consensus  on  workflows  for  each  alert  /  report  that  includes  relevant   parGcipants--incident  handlers,  business  managers,  HR,  compliance   officers,  etc.  
 Pick  some  low--volume  acGons  that  are  not  controversial  and  pilot  
16  

Best  PracGces  
 Your  users  are  generally  in  the  best  posiGon  to  determine  if   something  looks  funny  
 Consider  sending  them  the  output  of  searches  and  ask  them  to   follow  up  on  acGvity  that  they  think  is  suspicious;  think  carefully   about  cases  where  you  do  and  don't  want  to  do  this  
­ Build  a  lookup  table  of  users  and  managers  for  easy  alerGng  
 Privileged  users  should  get  privileged  access  reports  
­ Copy  their  managers  to  drive  accountability   ­ Integrate  with  your  GckeGng  system  to  create  a  paper  trail  of  the  reports  
and  sign  off  
17  

Best  PracGces  
 Know  where  you  are  going  to  send  a  report  /  alert  before  you  start   generaGng  them  
 Do  not  do  this  without  buy--in  from  your  business  partners,  Legal,   Compliance  and  HR  
 Doing  this  yourself  is  hard  but  it  develops  a  deep  understanding  of   the  problem  
 You  need  to  be  able  realize  when  its  Gme  to  regroup  and  consider   products  that  can  help     
18  

Use  Cases  and   Examples  

Relevant  Data  Sources  

Indexes  
· Firewall  Traffic   · Proxy  (Web  access)   · AcGve  Directory  Domain  
Controllers   · DHCP   · Email  Transport   · Exchange  /  Mail  Server   · Packet  captures  

Lookup  Tables  
· Username  to  IP  
· Username  to  Mailbox  
· User  /  Group  Mapping   ­ Used  for  excepGon  lookups     ­ May  be  used  to  exclude  results  
· Baseline  usage   ­ Generated  from  search  results  
· Internal  VLAN  to  physical  locaGon  

Volume  Monitoring  of  Allowed  Online  Storage  
 Graph  our  top  users  of  online  storage  based  on  their  general  baseline  of  usage.    These  users  have  an  approved  excepGon,  so  the  traffic  is  allowed.    Why  are  they  off  of  their  norm?  Requires  further  analysis  by  an  incident  handler.  
     
        

Volume  Monitoring  of  Allowed  Online  Storage  
 Search  proxy  logs  for  Online  storage  sites,  excluding  any  access  from  Guests.    Join  user  baseline  data  to  search  results  (keyed  from  src_user).     -- The  baseline  data  runs  one  per  day  as  an  accelerated  search  that  looks  back  90  days  at  user  
acGvity  associated  with  online  storage,  essenGally  creaGng  a  rolling  90  day  window.    Display  only  results  where  daily  hits  are  >300  and  increase  is  more  than  double.  
   index=prox   y*  category="*File  Storage/Sharing*"  NOT  src_user="--"  NOT  src_user="Moodys_Guest"  |  eval   filter_resu l  t=if(filter_result="DENIED",filter_result,"ALLOWED")  |  search  filter_result=ALLOWED  |  stats  count  as  daily_hits  by  src_user   fiaDvlatgeil_yrd__arHeiilstyus__ l htini  |tcs  jr=oe*ian  |s  te  ey_vppaeel= r Docaueintleyt_ra Hg serict=s_D_uaassiel_yrP_  fieHlrticteser__nartsea_sgPueel_tro  [c|fe_  niAntvpaeugretal_ogooefk=_u(Adpva  eoilrnya_lighneiet- -_ 1s/s0at0ov  rg  |a_g  sdeea_ailurycs_hehr  Di_tasb)ial*ys1_e0Hli0nit  e|s_.  ecisvnvac]lr    e|a  sseea_rpcher  dcaeinlyta_gheit>s1=0*0  A  ANNDD      daily_hits>300  filter_result=ALLOWED  |  fields  src_user  filter_result  Daily_   Hits_as_Percentage_of_Average  daily_hits  avg_daily_hits  |  eval   avg_daily_hits=round(avg_daily_hits,2)  |  rename  avg_daily_hits  as  BASEL   INE_avg_daily_hits  |  eval  
Daily_Hits_as_Percentage_of_Average=round(Daily_Hits_as_Percentage_of_Average,0)  |  sort  --  Daily_Hits_as_Percentage_of_Average   limit=10  |  fields  --  Daily_Hits_as_Percentage_of_Average  |  fields  +  src_user  daily_hits  BASELINE_avg_daily_hits  |  rename  daily_hits  as   "ALLOWED  Daily  Hits"  |  rename  BASELINE_avg_daily_hits  as  "ALLOWED  BASELINE  Average  Daily  Hits"  |  rename  src_user  as  "Moody's  User"  

Volume  Monitoring  of  Denied  Online  Storage  
 These  users  do  not  have  an  approved  excepGon,  so  the  traffic  is  denied.    What  is  happening  on  the  host?  Unauthorized  cloud  storage  agent?  Malware?  
           

Volume  Monitoring  of  Denied  Online  Storage  
 Search  proxy  logs  for  Online  storage  sites,  excluding  any  access  from  Guests.    Join  user  baseline  data  to  search  results  (keyed  from  src_user).     -- The  baseline  data  runs  one  per  day  as  an  accelerated  search  that  looks  back  90  days  at  user  
acGvity  associated  with  online  storage,  essenGally  creaGng  a  rolling  90  day  window.    Display  only  results  where  daily  hits  are  >300  and  increase  is  more  than  double.  
   index=prox   y*  category="*File  Storage/Sharing*"  NOT  src_user="--"  NOT  src_user="Moodys_Guest"    |  eval   filter_resu l  t=if(filter_result="DENIED",filter_result,"ALLOWED")  |  search  filter_result=DENIED  |  stats  count  as  daily_hits  by  src_user   fiaDvlatgeil_yrd__arHeiilstyus__ l htini  |tcs  jr=oe*ian  |s  te  ey_vppaeel= r Docaueintleyt_ra Hg serict=s_D_uaassiel_yrP_  fieHlrticteser__nartsea_sgPueel_tro  [c|fe_  niAntvpaeugretal_ogooefk=_u(Adpva  eoilrnya_lighneiet- -_ 1s/s0at0ov  rg|a_  sgdeeaa_irlucysh_eh  Dri_tasbi)lay*s_1eH0li0ints  e|_.  ecinsvcvar]le      |as  see_aprcehrc  deanitlay_geh>it1s=0*0    AANNDD     daily_hits>300  filter_result=DENIED|  fields  src_user  filter_result  Daily_Hi  ts_as_Percentage_of_Average  daily_hits  avg_daily_hits     |  eval  avg_daily_hits=round(avg_daily_hits,2)  |  rename  avg_daily_hits  as    BASELINE_avg_daily_hits  |  eval  
Daily_Hits_as_Percentage_of_Average=round(Daily_Hits_as_Percentage_of_Average,0)   |  sort  --  Daily_Hits_as_Percentage_of_Average  limit=10    |  fields  --  Daily_Hits_as_Percentage_of_Average  |  fields  +  src_user  daily_hits   BASELINE_avg_daily_hits  |  rename  daily_hits  as  "DENIED  Daily  Hits"  |  rename  BASELINE_avg_daily_hits  as  "DENIED  BASELINE  Average  Daily   Hits"  |  rename  src_user  as  "Moody's  User"  

Users  Added  to  MulGple  Admins  Groups/Day  

 LegiGmate  acGvity  if  you  have  a  new  hire  or  change  in  roles  

 PotenGally  a  start  of  something  bad  in  other  cases  

 Check  against  your  HR  feed  of  hires  and  moves  

 We  also  validate  that  any  accounts  added  are  secondary  admin  

accounts  and  not  primary  accounts  used  for  email,  browsing,  etc.  

  

  

   User  1  ­  admin  account  

Group1  ­  DATE+TIME  
Group2    ­  DATE+TIME   Group3    ­  DATE+TIME  

Example  Output  

User  2  ­  non--admin  

Group1    ­  DATE+TIME  
  

Users  Added  to  MulGple  Admins  Groups/Day  
 Search  windows  domain  controllers  logs  for  event  codes  4728  (local   group)  and  4756  (universal  group)  
 Extract  the  account  making  the  change,  account  added  to  the  group   and  the  group  name  as  "Subject",  "Member"  and  "Group"  
 Group  results  by  User  where  there  is  more  than  one  group  
  
   i|n  rdeexx  "=   ("?wi)iSnu_bajde"ct    :(\EWve\nr\tCno\tdSee=c"u4r7it3y2  I"D  :O\tR\  tE(v?ePn<tSCuobdjeec=t">4.7+2)"8  "  |  O  reRx  E  "v(e?ni)tMCoemdeb=e"r4:\7W56\"r)\  n   \tSecurity  ID:\t\t(? P<Member>.+)"  |  rex  "(?i)Group:\W\r\n\tSecurity  ID:\t\t(?P   <Group>.+)"     |  search  Group="*admin*"  OR  Group="*adm*"  OR  Group= "  *admn*"  |  convert  cGme(_Gme)  AS  Time    |  eval   Group_and_Gme=Group+"  ----  "+Time  |  stats  values(Group_a   nd_Gme)  as  "Group  Added  and  Time  Added"  dc(Group)  
as  group_count  by  Member    |  rename  Member  as  "User"  |  where  group_count&gt;1  |  rename  group_count  as   "Group  Count  

ExfiltraGon  Through  Email  
 How  do  we  idenGfy  data  ex--filtraGon  through  email?  
1. Build  out  a  search  to  look  for  outbound  email  that  contains  akachments.  We  used  our  email  transport   logs.  
2. Create  logic  to  idenGfy  any  combinaGon  of  sender's  first  iniGal,  first  name,  last  iniGal  or  last  name  along   with  a  free  email  provider  as  the  recipient.  
  
Joseph.Murdock@moodys.com  sending  to:  jmurdock@*  josephmurdock@*  joe.murdock@*  murdock.j@*  
 From  here,  we  can  produce  daily  alerts  of  users  emailing  akachments  outside   of  the  company  to  themselves.  
 Helps  detect  and  remediate  accidental  (for  convenience)  and  intenGonal   (potenGal  leaver)  exfiltraGon  of  data.  
           

ExfiltraGon  Through  Email  Search  Explained  
 Search  email  transport  logs  for  mess   ages  with  akachments  and  then   group  related  events  together  using    the  unique  message  idenGfier  MID.  
 Filter  out  known  noise  /  legiGmate  m     essages  (search  macro)  and  filter   in  known  public  mail  providers  (opportunity  for  a  lookup  table).  
 Split  out  the  recipient  list  and  look  for  recipients  using  common   freemium  email  domains.  
   index=mail--transport        |  rex  field=_raw  "akachment\s'(?<akachment_name>.+?)'"      |  rex  field=akachment_name  mode=sed  "s/(=20)/  /g"    |  transacGon  
   mid  host  startswith=("Start  MID")  endswith=("Message  finished  MID")    maxspan=3600  |  search  `not_internal_business_mailfrom`    mailfrom="*.*@*"  
mailto="*@gmail*"  OR  mailto="*@yahoo*"  OR  mailto="*@hotmail*"  OR  mailto="*@me.*"  OR  mailto="*@aol*"  OR  mailto="*outlook.*"  OR  
   mailto="*windowslive*"  "outbound  table"  
|  eventstats  count(mailto)  as  total_receivers  by  host  mid  |  fillnull  value="No  akachment"  akachment_name  |  mvexpand  mailto          
   |  search  mailfrom="*.*@*"  mailto="*@gmail*"  OR  mailto="*@yahoo*"  OR  mailto="*@hotmail*"  OR  mailto="*@me.*"  OR  mailto="*@aol*"  OR  
mailto="*outlook.*"  OR  mailto="*windowslive*"    
     

ExfiltraGon  Through  Email  Search  Explained  
 Perform  string  comparisons  on  first   and  last  names  relaGve  to  mailfrom  
      |  rex  field=mailfrom  "(?<first_leker>.)(?<first_name_rest>.+?)\.(?<last_leker>.)(?<last_name_rest>.+?)[@|--]"  |  eval  first_name=first_leker
+""+first_name_rest  |  eval  last_name=last_leker+""+last_name_rest    |  eval  first_name=lower(first_name)  |  eval  last_name=lower(last_name)  |  eval  
   first_leker=lower(first_leker)  |  eval  last_leker=lower(last_leker)    |  eval  first_name_last_name=first_name+".*"+last_name  |  eval  
   first_name_last_leker=first_name+".*"+last_leker  |  eval  first_leker_last_name=first_leker+".*"+last_name  |  eval  last_name_first_name=last_name
   +".*"+first_name  |  eval  last_name_first_leker=last_name+".*"+first_leker  |  eval  last_leker_first_name=last_leker+".*"+first_name    |  eval  
combinaGons=first_name+";"+last_name+";"+first_leker+";"+last_leker                      |  eval  mailto=lower(mailto)        |  eval  
   IS_LAST_NAME=if(match(mailto,last_name),"TRUE","FALSE")  |  eval  
IS_FIRST_NAME_LAST_NAME=if(match(mailto,first_name_last_name  ),"TRUE","FALSE")  |  eval  
   IS_FIRST_NAME_LAST_LETTER=if(match(mailto,first_name_last_leker),"TRUE","FALSE")  |  eval  
IS_FIRST_LETTER_LAST_NAME=if(match(mailto,first_leker_last_name),"TRUE","FALSE")  |  eval  
   IS_LAST_NAME_FIRST_NAME=if(match(mailto,last_name_first_name),"TRUE","FALSE")  |  eval  
IS_LAST_NAME_FIRST_LETTER=if(match(mailto,last_name_first_leker),"TRUE","FALSE")  |  eval  
   IS_LAST_LETTER_FIRST_NAME=if(match(mailto,last_leker_first_name),"TRUE","FALSE")  |  search  IS_LAST_NAME=TRUE  OR  
IS_FIRST_NAME_LAST_NAME=TRUE  OR  IS_FIRST_NAME_LAST_LETTER=TRUE  OR  IS_FIRST_LETTER_LAST_NAME=TRUE  OR   IS_LAST_NAME_FIRST_NAME=TRUE  OR  IS_LAST_NAME_FIRST_LETTER=TRUE  OR  IS_LAST_LETTER_FIRST_NAME=TRUE  |  stats  values(mailfrom)  as  mailfrom   values(mailto)  as  mailto  values(total_receivers)  as  total_receivers  values(subject)  as  subject  values(akachment_name)  as  akachment_names  by  host  mid   _Gme  |  fields  --  host  mid  

VPN  ConnecGons  from  More  than  One  LocaGon  
 Search  can  be  constrained  to  a  Gme  period,  typically  one  day  given   users  that  travel  
 Can  be  used  to  idenGfy  ID  sharing  or  ID  compromise    Results  are  in  a  basic  table  format  showing:  
-- User   -- ConnecGon  Date   -- VPN  connecGons  and  locaGon  
  
        

VPN  ConnecGons  from  More  than  One  LocaGon  
 Search  VPN  logs,  excluding  some  sources  and  grouping  events   based  on  connecGon  start/stop  strings.  
 Geo--locate  from  src_ip  and  filter  out  unknown  countries  
 Group  by  User  if  there  was  more  than  one  hit  
         index=vpn*  NOT  [|  inputlookup  vpn_addresses_to_exclude.csv  |  search  owner=VENDOR  |  fields  ip_address  |  rename  ip_address  as  
src_ip]  |  transacGon  user  src_ip  startswith="Primary  authenGcaGon  successful  for"  endswith="Closed  connecGon  to"  maxspan=43200    |   geoip  src_ip  |  fillnull  value="Unknown  City"  src_ip_city  |  fillnull  value="Unknown  Country"  src_ip_country_name  |  search  NOT   src_ip_country_name="Unknown  Country"  |  eval  conn_Gme=strVime(_Gme,  "%Y/%m/%d  %H:%M:%S")  |  eval   src_ip_city=upper(src_ip_city)  |  eval  src_ip_country_name=upper(src_ip_country_name)  |  eval  vpn_conn="ConnecGon  from  "+src_ip +"  in  "+src_ip_city+",  "+src_ip_country_name+"  at:  "+conn_Gme  |  bucket  _Gme  span=1d  |  stats  values(vpn_conn)  as  vpn_conn   dc(src_ip_country_name)  as  count  by  user  _Gme  |  eval  conn_day=strVime(_Gme,"%A  %b  %d  %Y")  |  where  count>1  |  sort  --  _Gme  |   fields  --  count  _Gme  |  fields  user  conn_day  vpn_conn  

Database  Access  Monitoring  
 UGlizing  network  tap  logs  for  database  access,  we  monitor  access  to   producGon  databases  by  locaGon  and  machine  type.    
 Important  to  monitor  for  end  user  machines  (labelled  "Desktop")  that   access  producGon  databases.  
-- Should  this  type  of  machine  be  allowed  to  access  producGon  databases?    
 Origin  locaGon  of  access  (by  internal  IP  address).    
-- Is  there  access  to  producGon  DBs  from  a  locaGon  that  isn't  typical?     
           

Database  Access  Monitoring  
Define  a  table  of  machine  types  and  loca7ons  for  the  repor7ng  period.  
 Search  DB  access  logs  and  find  all  connecGons.    Perform  internal  lookup  on  src  IPs  to  get  locaGon  code.    Obtain  src  hostname  using  DHCP/DNS  (shown  here  with  custom  macro).    Define  field  to  highlight  a  "desktop"  or  "server"  based  on  machine  
hostname  format.  
        index=db   _NETTAP  Policy="Splunk  --  All  Database  ConnecGons"  |  fields  +  src  dst  Database  duser  HostName  ServerGroup  ServiceName   SourceAp   plicaGon  duser  UserAuthenGcated  |  lookup  internal_ip_allocaGons  internal_range  as  src  OUTPUT  site_code  |  rename   site_code  as  src_site_code  |  search  NOT  src_site_code=PROD  |  fillnull  v   alue="Unknown"  src_site_code  |  rename  src  as  src_ip  |   `dhcp_dns_3days`  |  stats  count  values(*)  as  *  by  src_ip  dst  |  eval  sourc  e_machine_type=case(actual_host  like  "%--seven %","Desktop",actual_host  like  "%--win7%","Desktop")  |  fillnull  value="S e  rver"  source_machine_type    |  stats  dc(actual_host)  as  count  by  
source_machine_type  

Database  Access  Monitoring  
The  resul7ng  table  shows  the  calculated  machine  type  and  the  internal  loca7on   code  based  on  our  lookup.  

Database  Access  Monitoring  
 You  can  further  enrich  the  resulGng  data  by  mapping  locaGon  codes  to   coordinates  (a  good  candidate  for  a  lookup  table):     Create  staGc  laGtude  field  per  "site".                            Create  staGc  longitude  field  per  
"site".  

 Use  geostats  command  for  visualizaGon.  

   |  eval  mylat=case   (src_site_cod   e="DUB","53.346888",  src_site_code="LON","51.496267",  src_site_code="BRD","50.109588",  
src_site_code="FRA","50.109588",  src_site_code="FTC","30.840727",  
   src_site_code="KSF","37.517890"  ,src_site_code="MAD","40.416400",  src_site_code="SFO","37.765138",  

   src_site_code="SAO","23.553941",  src_site_code="SYN","33.897913",  src_site_code="MEX","19.425811",  
src_site_code="TOR","43.649569",  src_site_code="MOS","55.757568")  

  

  

   |  eval  
mylon=case(src_site_code="DUB","--6.230040",src_site_code="LON","--0.034253",src_site_code="BRD","8.687695",src_site_code="FRA

","8.687695",src_site_code="FTC","--97.795879",src_site_code="KSF","126.982686",src_site_code="MAD","--3.703308",src_site_code="

SFO","--122.417598",src_site_code="SAO","--46.626870",src_site_code="SYN","151.206361",src_site_code="MEX","--99.128165",src_site

_code="TOR","--79.371574",src_site_code="MOS","37.628749")    

  

|  geostats  la·ield=mylat  longfield=mylon  sum(count)  as  count  by  source_machine_type  locallimit=30  

Database  Access  Monitoring  
Results  allow  the  quick  visualiza7on  of  poten7ally  unan7cipated  access  to   produc7on  databases  for  further  inves7ga7on.  
Server   Desktop  

Thank  You!   Special  thanks  to  John  Dunlea  
37  

Demo  Time!!  
 Splunk  has  pre--packaged  content  to  detect  insider  threats:  
­ Splunk  Enterprise  Security   ­ Splunk  User  Behavior  AnalyGcs  (formerly  Caspida)  
38  

What  Now?    
Related  breakout  sessions  and  acGviGes...   · Several  other  sessions  in  the  security  track   · App  Showcase  has  booths  for  Splunk  ES  and  Splunk  UBA   · Web  site  for  more  info  on  Splunk  ES  and  Splunk  UBA,  incl  sales  
contact  info  
39  

QuesGons?  
40  

THANK  YOU  

Insider  Threats  in  the  Headlines  

Intent  
Whistle  Blower  
Financial  Gain  

"Edward  Snowden  did  `Profound  Damage'  to  U.S.  Security"         ­  ABC  News,    Jan  2014  
"Morgan  Stanley  admits  employee  stole  data  on  350,000  clients"         ­  Fox  News,  Jan  2015   "Ex--DuPont  Engineer  Gets  2.5  Years  For  Trade  Secrets  TheV"             ­  Law360,  Aug  2014  

Revenge  &  Financial  Gain  

"Unhappy  Workers  Hacking  Employers  on  the  Rise,  FBI  says"             ­  Bloomberg,  Sept  2014  

42  

Bonus:  May  Catch  External  Threats  As  Well  

Use  legiGmate  credenGals   Access  excessive  amounts  of  confidenGal  data   OVen  exfiltrate  data  via  common  network  protocols   Do  not  behave  like  average  employee;  outlier  
43  

Insider  Threat  

Advanced,     External  Threat  

Reality  of  DetecGng  Insider  Threats  
· No  easy  bukon   · Requires  people,  process,  technology   · SophisGcated,  highly  technical  malicious  
insiders  are  difficult  to  catch   · At  least  look  for  the  indicators  
44  

Splunk  Meets  Key  Requirements  

Requirement  
Built  for  internal,  non--signature  based  threats   Full  visibility  (network,  endpoint,  authenGcaGons,  access)   Can  index  raw  machine  data  from  all  sources   Can  index  non--tradiGonal  data  sources  for  user  data   Add  external  context  and  intelligence   Scale  and  speed   Flexible  search,  reporGng,  analyGcs  (incl.  anomaly  detecGon  &  risk  
scoring)  
Open  pla·orm  and  can  integrate  with  other  IT  products  

Point  Security   Tradi7onal  

Products  (AV/ IDS/FW/etc.)  

SIEM  

Splunk  

DetecGng  Suspicious  User  AcGvity  
Spot  suspicious  user   ac7vity    
 Insider  threat  or  external  threat   using  stolen  credenGals  
 High  aggregate  risk  score   · Uploaded  data  to  non--corp  sites    Emailed  data  to  non--corp  domains    Visits  to  blacklisted  sites    Concurrent  applicaGon  access  
46  

IdenGty  (User)  InvesGgator  
Inves7gate  users  
· See  related  user  acGons  over  a   given  Gme  period  
· Determine  threat  intent,  scope  and   severity  
· Click  on  one  or  mulGple  bars  to  view   raw,  underlying  events  
47  

IdenGty  (User)  and  Asset  InformaGon  
Leverages  user  &  asset  info  
· Create  searches  based  on:   ­ Roles  or  departments   ­ Privileged  users   ­ Watch  listed  employees   ­ CriGcal  assets  
· Correlate  mulGple  user  credenGals   back  to  single  employee  
48  

Incident  InvesGgaGons  
View  insider  threat   incidents  
· Pakerns  in  data  that  match  search   criteria  for  an  incident  
· Incident  detail  helps  determine   context  and  how  to  remediate  
· Includes  workflow  to  modify  and   route  incidents  
· One--click  ability  to  pivot  off  incident   details  to  other  data  
49  

DetecGng  Access  Anomalies     
Spot  Suspicious  Access  
 Simultaneous  logins  for  single  user   occurring  at  two  geographically   distant  locaGons  
 Concurrent  applicaGon  access   ­ Password  sharing  or  theV  
  
50  

Splunk  User  Behavior  AnalyGcs     
51  

Splunk  User  Behavior  AnalyGcs     
52  

Splunk  User  Behavior  AnalyGcs     
53  

Splunk  User  Behavior  AnalyGcs     
54  

Splunk  User  Behavior  AnalyGcs     
55  

