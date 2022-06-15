Copyright  ©  2015  Splunk  Inc.  
Full  Stack     Splunk  Development   or   "How  to  Build  a  Splunk   AppItude  Winner  App"  
Mika  Borner  &  Simon  Balz  
LC  Systems  

Disclaimer  
During  the  course  of  this  presentaIon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauIon  you  that  such  statements  reflect  our   current  expectaIons  and  esImates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaIon  are  being  made  as  of  the  Ime  and  date  of  its  live   presentaIon.  If  reviewed  aVer  its  live  presentaIon,  this  presentaIon  may  not  contain  current  or   accurate  informaIon.  We  do  not  assume  any  obligaIon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiIon,  any  informaIon  about  our  roadmap  outlines  our  general  product  direcIon  and  is  subject  to   change  at  any  Ime  without  noIce.  It  is  for  informaIonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaIon  either  to  develop  the  features  
or  funcIonality  described  or  to  include  any  such  feature  or  funcIonality  in  a  future  release.  
2  

!  Team   !  Idea   !  ImplementaIons   !  Architecture   !  Challenges   !  Final  SoluIon   !  Tips  'n'  Tricks   !  Future     

Agenda  
3  

Alert  Manager  
Mika  Borner   · Consultant  @  LC  Systems   · Splunking  since  2006   · Twi]er:  my2ndhead  
Simon  Balz   · Consultant  @  LC  Systems   · Splunking  since  2007   · Twi]er:  simonbalz  
  

Team  
Hyperthreat  App  Suite   (addiIonally)  
Christoph  Di]mann   · Consultant  @  LC  Systems   · Mr.  Business  Intelligence   · Twi]er:  mulibu_flyingk        Harun  Küssner   · Consultant  @  LC  Systems   · Mr.  Crypto     
4  

Idea  

Alert  Manager  
(Category  "InnovaIon")  
· Idea  born  from  several  customer   needs  
· Needed  a  temporary  IckeIng   soluIon  quickly  
· Full  e--mail  white  labeling  was   missing  
· QUAD  soluIon  at  customer  was  in   place  
· Wanted  to  do  the  "Real  Thing"  

Hyperthreat  App  Suite  
(Category  "Fraud  &  Insider  Threat")  
· AppItude2  provided  a  DARPA  data   set  with  Insider  Threat  
· Scratching  heads  for  a  couple  of   weeks  
· Risk  Scoring  and  Baselining  looked   like  the  right  approach  to  solve  the   challenge  
· Employee  privacy  was  a  concern.   This  had  to  be  solved  

5  

ImplementaIon  
Alert  Manager  
· Scripted  Alert  Ac,on  contains  logic  to  transform  an  alert  into  a   stateful  incident  (alert  handler)  
· KV  Store  used  for  storing  incident  (--state),  incident  results  and   incident  selngs  
· Index  used  to  track  changes  to  incidents  (audit).   · Lots  of  UI  code  for  manipulaIng  incident  states   · AddiIonal  Python  code  that  handles  scheduling  to  close  incidents  
by  condiIons  and  to  manage  noIficaIons  
6  

Architecture  (Alert  Manager)  
7  

ImplementaIon  
Risk  Manager  
!  Risk  Manager  (App  and  TA)  
· Alert  Script  contains  logic  to  look  for  risk  objects  and  execute  scoring   · KV  Store  used  for  storing  Risks,  Risk  Results  and  Risk  Selngs   · Index  used  to  track  risk  score  changes.   · Lots  of  UI  code  for  manipulaIng  incident  states    
· Hyperbaseline  (SA)  
­ Implemented  as  custom  search  command   ­ Uses  KV--Store  to  store  baseline  and  read  from  baseline  
! Hypercrypto  (SA)  
­ Implemented  as  custom  search  command   ­ Implements  hashing  algorithms  and  public  key  encrypIon   ­ Stores  private  key  pw  inside  Splunk  keystore  
8  

Architecture  (Hyperthreat  App  Suite)  
9  

Challenges  
Alert  Manager   !  Time  (What  a  surprise...  J  )   !  There  was  no  state--of--the--art  to  manage  extended  configuraIon   !  Undocumented  features  like  MongoDB  filters  or  Splunk  python  API   !  Fast  growth  in  number  of  funcIonaliIes  resulted  in  spaghel  code   !  Full--stack  Splunk  feature  usage:  Splunk  Web/Splunkd  Endpoints,  
Splunk,  Custom  search  commands,  Knowledge  objects,  Web  Stack   !  TesIng  was  Ime--consuming  and  oVen  done  by  hand  
10  

Challenges  
Hyperthreat  App  Suite   !  Time  (Hit  us  again  J  )   !  Huge  (!)  DARPA  dataset  had  to  be  understood  first   !  Pulng  it  all  together  in  Ime  and  hoping  it  would  work   !  False  assumpIons  
­ Keystore  did  not  work  as  we  expected   ­ Selng  up  demo  environment  took  longer  than  expected  
  
11  

Final  SoluIon  
Alert  Manager  @  h]ps://splunkbase.splunk.com/app/2665  
12  

Final  SoluIon  

Hyperthreat  App  Suite  

!  Risk  Manager  

  

h]ps://splunkbase.splunk.com/app/2804/  

  

! Hyperbaseline  
h]ps://splunkbase.splunk.com/app/2802/     

! Hypercrypto  

! h]ps://splunkbase.splunk.com/app/2801/  

13  

Tips'n'Tricks  
!  It's  all  about  the  idea!   !  Keep  it  generic   !  KV  Store  is  the  key  to  complex  apps   !  Pre]y  and  complex  UI's  may  require  JS/CSS  skills.  Team  up  with  
someone  who  knows  web  development   !  Read  the  Splunk  Developer  Guidance  (Lots  of  gems!)   !  Think  before  code  (begin  with  mockups  and  a  SAD)     
14  

Future  
Alert  Manager  /  Hyperthreat  App  Suite  
!  DocumentaIon  
­ Moving  from  GitHub  Wiki  to  Ponydocs  
!  Automated  TesIng  
­ With  more  and  more  features,  we  want  to  keep  the  quality  high   ­ Unit  TesIng  needs  to  be  evaluated  
!  Support  
­ Several  inquiries  about  support   ­ Growing  number  of  acIve  installaIon  will  drive  this  
!  Features  
­ ImplemenIng  roadmap  features   ­ Looking  into  managing  all  external  RFEs  
15  

THANK  YOU  

