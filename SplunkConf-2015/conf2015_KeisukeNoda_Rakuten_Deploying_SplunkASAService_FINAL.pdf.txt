Copyright  ©  2015  Splunk  Inc.  
Splunk  as  a  Service   at  Rakuten  
Keisuke  Noda   Takeshi  Suzuki  
1  

Disclaimer  
During  the  course  of  this  presentaEon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauEon  you  that  such  statements  reflect  our   current  expectaEons  and  esEmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaEon  are  being  made  as  of  the  Eme  and  date  of  its  live   presentaEon.  If  reviewed  aQer  its  live  presentaEon,  this  presentaEon  may  not  contain  current  or   accurate  informaEon.  We  do  not  assume  any  obligaEon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiEon,  any  informaEon  about  our  roadmap  outlines  our  general  product  direcEon  and  is  subject  to   change  at  any  Eme  without  noEce.  It  is  for  informaEonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaEon  either  to  develop  the  features  
or  funcEonality  described  or  to  include  any  such  feature  or  funcEonality  in  a  future  release.  
2  

About  Us  

 Name  
­ Keisuke  Noda   ­    
 PosiEon  
­ Architect  /  Manager   ­ Data  Store  PlaYorm  Group  
 Background  
­ ApplicaEon  engineer   ­ Database  engineer  

 Like  
­ Massage  

3  

About  Us  
 Takeshi  Suzuki        Tokyo       Rakuten,  Inc.    Security  OperaEons  Group    Security  engineer  /  Manager  
4  

About  Company  

Founded:      February  7,  1997  

IPO:

     April  19,  2000  (JASDAQ  Stock  Exchange)  

Office:      Rakuten  Tower  (Tokyo,  Japan)  

Employees:          12,288  (as  of  June,  2015)    

Market  Cap:        JPY  214,701  million  (as  of  Sep  15,  2015)  

5  

About  Company  
6  

Going  Global  
7  

Agenda  
· Why  Splunk?   · Why  is  Splunk  offered  as  a  Service?   · Service  Overview   · Our  Challenges   · Current  Status   · Case  Studies   · What's  Next?   · Wrap  up   · Q  and  A  
8  

Why  Splunk?   Why  is  Splunk  offered   as  a  Service?  
9  

Why  Splunk?  
· Summer  2011...  I  discovered  Splunk  
· Cool  visuals   · Looks  interesEng  
10  

Why  Splunk?  
Before  
· Self--made  database  monitoring  system  
· Legacy  and  complex  system  

Output   Database  Status  

Input  the  Data   into  RDB  

Store  the  Data  

Visualize  the  Data  

Add  a  column

Batch  Server
Modify   codes  

RDBMS
Add  a   column

11  

Web  ApplicaEon
Modify   codes

Why  Splunk?  
AQer  
· Self--made  database  monitoring  system  
· One  Splunk  is  simple  

Output   Database  Status  

Input  Data  /  Store  Data  /  Visualize  Data  

All  in  One! So  Easy!!
Cool  Visuals!!

Then,  Splunk  began  to  be  used  in  various  groups...
12  

Why  is  Splunk  offered  as  a  Service?  
· Splunk  began  to  be  used  in  various  groups  
· There  were  so  many  repeEEve  operaEons             (such  as  license  management,  system  construcEons,  operaEons  ...etc)  
If  there  is  one  big  plaYorm  and  everyone  can  use  it   without  management,  the  problem  will  be  solved.  
   In  addiEon,  it  may  have  many  other  benefits...  
.  .  .    Splunk  as  a  Service  was  born  
13  

Service  Overview  
14  

Service  Overview  
· Rakuten's  organizaEon  
· There  are  so  many  departments  and  groups  
Example  

Marketplace  

Server  

Database  

Merchant  
Dep.  A  

Security  
Dep.  B  

Network  
Dep.  C  
15  

Corporate  IT  
Dep.  D  

Credit  Card  

E--money  

...  

Dep.  E  

Service  Overview  

· Groups  of  Splunk  as  a  Service  
· Admin   · User  
My  Group  

Security  

Corporate  IT  

Credit  Card  

Network  

...  

Admin  

User  

16  

Service  Overview  

· No  need  to  manage  Infrastructure  

For  user  

· Design,  construcEon,  monitoring,  operaEon  and  license  

· Easy  to  start  Splunking  in  a  few  minutes  without  detailed  

configuraEon   · Charged  by  measured  rate  

Will  be  talked   details  later

· High  availability  
· 99.99%  upEme  

                Rakuten   Splunk  as  a  Service

17  

Service  Design  
· Environment  
· Private  Cloud   · High  availability   · On  Eme  delivery   · Flexibility  
18  

Service  Design  
· System  configuraEon  
· v6.2.X   · Using  an  indexer  cluster   · Full  components   · Newer  data  on  Low  latency  
Storage  (Hotdb),  Older  data   on  Low  Cost  Storage  (Colddb)  
19  

Service  Design  
· Other  specificaEons  
· Splunk  account  is  created  for  each  user   · 1  user  =  1  group,  1  service,  or  1  project  
· Each  user  has  his/her  own  App   · Basically  a  user  can  see  only  his/her  own  data  
· Accesses  are  controlled  by  tags   · Users  can  choose  the  term  of  storage  retenEon  from  1  day  to  6  years  for  
each  input   · Admin  does  not  do  backups   · Dedicated  Search  Head  is  ready  for  users  who  need  
20  

Service  OperaEons  

· System  operaEons  

Admin  side  

· Create  user  accounts  (rolls,  users  and  Apps)  

· Set  up  inputs  

· Install  external  Apps  

· Irregular  configuraEon  (props.conf,  transforms.conf,  limits.conf,  ...etc)  

· Service  operaEons  
· User  support  /  ConsultaEon  

· Monitoring  
· Input  size   · System  resources  (SoS  /  Unix  App  /  PandoraFMS)  

21  

Our  Challenges  
22  

Our  Challenges  
1. Easy  data  access  control   2. CollaboraEon  with  internal  tools   3. CollaboraEon  with  global  group  companies   4. OperaEon  improvements  by  Rakuten  Splunk  Portal  Site  with  API  
23  

Easy  Data  Access  Control  

 Demand  
· Users  want  to  see  other  user's  data  
 Measure  
· Use  Tag  (tagUser::  host=<user's  host>)   · Add  whitelist  condiEon  in  case  of  sharing  data  

I'd  love  to.

tag=tagA,  tagB

Admin

OK
User  A

Thank  you.   So  efficient!

User  B

Your  network  log  correlates  with   my  syslog.  I  want  to  see  your  logs!

24  

CollaboraEon  with  Internal  Tools  
 Demand  
· Users  want  to  use  some  internal  tools  and  informaEon  from  Splunk  
 Measure  
· Import  CMDB  data  (lookup)   · Can  receive  direct  phone  calls  from  DC  staff  (alert  script)   · Can  call  Hipchat/Slack  web  hooks  (alert  script)  

Lookup  

Script  
25  

Script  

Internal  tools  

CollaboraEon  with  global  group  companies  
 Demand  
· Users  want  to  access  global  companies'  data  through  Splunk  
 Measure  
· Splunk  as  a  Service  in  the  USA  is  ready   · Supervisors  can  see  the  whole  data  of  each  region  
26  

OperaEon  Improvements  
 Demand  
· Users  want  to  start  Splunking  easily  in  a  short  Eme   · Admin  wants  to  make  regular  operaEons  more  efficient  
 Measure  
· Made  Rakuten  Splunk  Portal  Site  for  operaEon  improvements   using  Splunk  REST  API!  
· Easy  to  start  Splunking  in  just  a  few  minutes  
27  

Rakuten  Splunk  Portal  Site  
· DemonstraEon  
· Easy  to  start  Splunking   1. Create  Splunk  web  account   2. Install  a  forwarder   3. Set  up  &  deploy  Apps  
28  

Rakuten  Splunk  Portal  Site  
· Current  main  features  
· Manages  user's  informaEon  (organizaEon,  emails,  etc..)   · Creates  Splunk  web  accounts  (create  roles,  users,  and  Apps)   · Manages  forwarders,  server  classes,  inputs  and  Apps   · Deploys  Apps  to  users'  forwarders   · Alerts  users  when  users'  forwarders  are  down  
Good  reputaEon
29  

Rakuten  Splunk  Portal  Site  

· Do  you  want  to  try  the  Portal  Site  on  your  environment?  

We  are  currently  developing  it  as  an  open--source  project!!  

  

  

  

  

     

To  be  prepared!!  

  

Please  read  README  before  using  it.  

30  

Current  Status  
31  

Current  Status  

Availability  Rate

Indexed  Data  Size

32  

Current  Status  

#  of  Accounts

Input  Size

33  

Case  Studies  
34  

Server  
Real--Eme  monitoring   TroubleshooEng   Usage  report
Database  
Real--Eme  monitoring   TroubleshooEng   Usage  report   Service  KPI  management

Case  Studies  

Security   IDS  real--Eme  monitoring  
Fraud  detecEon  
Private  Cloud  (RIaaS)  
Real--Eme  monitoring   Resource  management  
Applica[on  
Real--Eme  monitoring   Service  KPI  management   Performance  management
35  

Storage  
Real--Eme  monitoring   Resource  management   Service  KPI  management
Network  
Real--Eme  monitoring   TroubleshooEng   Trend  analysis  
More...  

Security

Security  Monitoring  

36  

Security  

Alert  Email
Data  comes  from  other  systems   Point  of  contact   DescripEon  of  avack   Actual  avack  payload
37  

Security

Security  Monitoring  

· Before  
· Analyze  by  Managed  Security  Service  Portal   · Make  sure  the  right  person  handles  the  incident  

· AQer  
· By  CMDB,  streamlined  escalaEon  flow   · Shorten  Eme  for  iniEalizing  acEon   · Detect  irregular  accesses  

38  

Server  
Real--Eme  monitoring   TroubleshooEng   Usage  report
Database  
Real--Eme  monitoring   TroubleshooEng   Usage  report   Service  KPI  management

Case  Studies  

Security   IDS  real--Eme  monitoring  
Fraud  detecEon  
Private  Cloud  (RIaaS)  
Real--Eme  monitoring   Resource  management  
Applica[on  
Real--Eme  monitoring   Service  KPI  management   Performance  management
39  

Storage  
Real--Eme  monitoring   Resource  management   Service  KPI  management
Network  
Real--Eme  monitoring   TroubleshooEng   Trend  analysis  
More...  

Quote  

"You  can't  connect  the  dots  looking  forward;  

you  can  only  connect  them  looking  backward.  

So  you  have  to  trust  that  the  dots  will  somehow  

connect  in  your  future.  You  have  to  trust  in  

something"    

--  Steve  Jobs  

40  

Wrap  up  
41  

What's  Next?  
· Make  it  easier  to  get  Splunk  started  
· Complete  automaEon  
· Make  regular  operaEons  more  efficient  
· Change  frequent  operaEons  automaEcally  
· Upgrade  to  v6.3   · Enhance  Rakuten  Splunk  Portal  Site   · Have  more  collaboraEon  with  global  group  companies  
42  

Wrap  up  
· Rakuten  is  using  one  big  Splunk  as  a  Service  
· PosiEve  advantages  for  user   · No  need  to  manage  Infrastructure,  License,  and  detailed  configuraEon   · Can  use  data  of  crossing  organizaEon  
· PosiEve  advantages  for  admin   · Can  manage  operaEons  and  license  efficiently   · Have  many  saEsfied  users  
· OperaEon  improvements  by  Splunk  Portal  Site  with  API  
· Can  start  Splunking  easily  in  a  few  minutes  
· Many  different  types  of  users  are  using  Splunk,  and  hopefully  it   will  expand  globally  
43  

QuesEons?  
44  

THANK  YOU  

