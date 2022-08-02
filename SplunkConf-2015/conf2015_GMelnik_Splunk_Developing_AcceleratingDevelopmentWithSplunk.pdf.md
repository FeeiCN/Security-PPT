Copyright  ©  2015  Splunk  Inc.  
Accelera'ng  Your   Solu'on  Development   with  Splunk  Reference   Apps  
Grigori  Melnik  
Principal  Product  Manager  ­   Developer  PlaAorm,  Splunk      @gmelnik  

Disclaimer  
During  the  course  of  this  presentaGon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauGon  you  that  such  statements  reflect  our   current  expectaGons  and  esGmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaGon  are  being  made  as  of  the  Gme  and  date  of  its  live   presentaGon.  If  reviewed  aSer  its  live  presentaGon,  this  presentaGon  may  not  contain  current  or   accurate  informaGon.  We  do  not  assume  any  obligaGon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiGon,  any  informaGon  about  our  roadmap  outlines  our  general  product  direcGon  and  is  subject  to   change  at  any  Gme  without  noGce.  It  is  for  informaGonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaGon  either  to  develop  the  features  
or  funcGonality  described  or  to  include  any  such  feature  or  funcGonality  in  a  future  release.  
2  

How  should  I  build                 my  app?  

Splunk Developer Guidance
EVERYTHING   YOU  NEED   TO  BUILD  

Building  SoluGons  on  the  Splunk  PlaAorm  

    Splunk  Reference  Apps  
Complete,  working  real--world  Splunk  soluGons    
built  together  with  partners  (Conducive,  Auth0)  

This  is  unbelievable,  it  covers  most  everything     I  learned  the  hard  way...                             ­  Bernie  Macias,  Technical  Architect,  Zillow  

    Splunk  Developer  Guide  

  

dev.splunk.com/goto/devguide  

Planning  a  journey  
PlaDorm  and  tools:     a  kitbag  for  our  journey  
UI  and  visualiza'ons:     what  the  apps  look  like  
Working  with  data:  where  it  comes  from  &   how  we  manage  it  
Adding  code:  using  JavaScript  and  Search   Processing  Language  
Packaging  and  deployment:  reaching  our   first  desGnaGon  
Dealing  with  OAuth  
Aler'ng  
Building  in  telemetry  with     high--performance  data  collec'on  
  

splk.it/devguide  

Splunk  Reference   App  Demo  

How  we  build   guidance  

1.  Started  with  a  QuesGons  Backlog  

! Architecture   ­ What  does  a  typical  Splunk  applicaGon  reference  architecture  look  like?  
­ What  common  paradigms  are  applicable  to  Splunk  app  development?   ­ What  are  the  typical  deployment  topologies?  Why  should  I  choose  a  specific    one?  What  are  the  confounding  factors  
on  the  choice  of  my  topology?  

­ Why  should  I  not  use  transacGons?   ­ When  should  I  use  pivot  vs  tstats?   ­ Why  should  I  use  data  models?  
­ When  my  data  source  touches  on  many  data  models,  should  I  assume    complete  separaGon  or  heavy  inheritance?   ­ How  do  I  extend  an  exisGng  data  model?  

­ How  do  I  parGGon  my  Splunk  soluGons?  

­ What  does  CIM  offer  and  why  should  I  build  CIM--compliant  apps?  

­ What  are  the  tradeoffs  of  various  types  of  inputs?  

­ In  the  context  of  CIM,  what  are  the  tradeoffs  of  using  my  props.conf  and  transforms.conf  and  rewriGng  them  on  

­ How  do  I  architect  my  Splunk  soluGon  and  deployment  for  a  very  large  scale?  

indexing,  completely  discarding  the  vendor  supplied  field  names?  How  do  I  reconcile  the    advantages  of  a  clean  

­ How  do  I  architect  my  Splunk  soluGon  for  the  cloud?  What  are  specific  consideraGons  for  deploying  to  AWS  or  Azure?   ­ What's  the  landscape  of  Splunk  extension  points?  

interface  &  normalisaGon,  but  at  the  cost  of  losing  alignment  with  published  vendor  documentaGon,  and  a  learning   curve  for  exisGng  users?  

­ How  do  I  integrate  data  from  Splunk    into  exisGng  applicaGons  and  systems?  

­ How  do  I  manage  my  soluGon  declaraGve  configuraGon?  How  do  I  detect/troubleshoot  bad  config?  

­ How  do  I  plan  and  design  a  robust  alerGng  and  monitoring  subsystem  on  top  of  Splunk?  
­ What  should  I  consider  for  my  sizing  requirements?  
   ­ What  are  recommended  configuraGons  of  Splunk  deployment  to  meet  my  sizing  requirements?  
­ Should  I  architect  my  soluGon  to  index  my  data  in  local  data  center  (zone)  or  centrally?  
   ­ What  are  things  we  can  automaGcally  degrade  so  we  can  make  sure  our  core  experience  is  working?   HoHwo  wsh  oduol  Id  p  Ir  seepta  urep  my  edveevn  etn  gveirnoenrma'eonnt  wtoh  been  p  dreovdeuloc'pivneg  w  &it   h   ­ When  something  happens,  how  do  I  effecGvely  propagate  the  info  and  react  to  it?   HoWwh  daot  d  IH o poeawsc k a  da  otgy e Ip  i  aincntae l ag  Sprppal?tue n d  Skepa  allup  wnpkliitc h ian  a'topop n e x v  aierscr'shniiogten  sciyntsugtr e aemn  ldos?o  uk  p  dlikaete?s   ?   ­ How  are  other  soluGons  on  Splunk  built?  What  were  the  challenges?  How  have  they  been  addressed?  
! Packaging  and  Deployment  
  tes'Snpglu  annk ? a p  p?   ­ How  do  I  piece  together  various    parts  of  a  Splunk  app  (custom  search  commands,  mod  inputs  etc.)?      ­ How  do  I  package  a  Splunk  soluGon  with  a  single  install  that  automaGcally  rolls  out  all  the  necessary  dependencies?  
­ How  do  I  manage  my  Splunk  soluGon  versioning,  backward  and  future  compat?  
   ­ What's  the  best  way  to  split  up  custom  apps  for  deployment?    

­ How  do  I  log  and  analyze  data  that  is  not  event  driven  (certain  web  feeds,  html  parsing,  image  meta  data)?   ­ Compare  and  contrast  ad--hoc  searching  vs  background  searching   ­ How  do  I  handle  transient  faults?   ­ How  do  I  effecGvely  manage  credenGals?   ­ What's  the  effect  of  search  head  locaGon  on  my  app  and  the  overall  user  experience?   ­ How  do  I  develop  an  integrated  mechanism  to  let  me  connect  Splunk  to  my  MOM  (messaging  middleware)  and  index  
my  messages?   ­ How  do  I  handle  the  requirement  that  app  configs  must  be  different  across  different  server  types  in  a  distributed  
environment  (e.g.  apps  on  search  heads  shouldn't  have  inputs  enabled)?   ! Quality/Compliance  
­ What  quality  gates  should  I  consider?  What  kind  of  para--funcGonal  characterisGcs    are  important  to  consider?   ­ What  heurisGcs  do  I  use  to  bless/block  a  release?   ­ How  do  I  test  a  data  model?  

! Development  

­ How  do  I  prepare  event  generaGon  when  building/tesGng  an  app?  

­ How  should  I  set  up  my  development  environment  to  be  producGve  with  Splunk?  

­ What  kind  of  perf  tesGng  should  I  do  and  how?  

­ What  are  different  ways  of  how  I  develop  my  Splunk  app  ?  Pros  and  cons  of  using  specific  SDK  vs  REST  APIs?    

­ How  do  I  test  UI?  

Pros  and  cons  of  using  SimpleXML  vs  Advanced  XML  vs  Web  Framework  ...  

­ How  do  I  security  cerGfy  my  soluGon?  

­ How  do  I  analyze  a  data  source  for  a  TA?   ­ What  are  the  different  ways  of  enriching  the  data  in  Splunk?  What  are  their  tradeoffs?  

­ How  do  I  design  to  saGsfy  my  retenGon  and  compliance  policies?   ­ How  do  I  architect  to  design  my  availability  requirements?  

­ ­ ­
­ ­

When  should  I  use  event  types  and  transacGons  for  data  classificaGon?   How  do  I  extend  Splunk  to  define  a  custom  input  capability?     When  should  I  use  modular  inputs  vs  scripted  inputs  vs..?  
What  are  streaming  vs  non--streaming  outputs  consideraGons?   How  do  I  deal  with  long--running  scripts?  Handling  shutdown/restart  of  Splunk?  Concurrency?  State  persistence  etc.  

­ How  do  I  handle  geographic  disaster  recovery  /  fault  tolerance?   ­ How  do  I  properly  instrument  my  soluGon  so  that  I  know  what's  happening?   ! Sustained  Engineering   ­ How  do  I  maintain/service/support  Splunk  apps?   ­ How  do  my  customers  handle  updaGng  their  customized  configs  once  new  versions  of  my  app  come  out?    

! Business    

­ Why  should  I  build  on  Splunk?  
9   ­ What  kind  of  skill  do  I  need  my  devs  to  have  to  build  a  Splunk  soluGon?  

­ What  is  the  community  building?  How  are  current  devs  creaGng  unique  experiences  using  Splunk  ­  I  typically  want  to  

2.  IdenGfied  Extensibility  Surface  Area  

§ Data  inges'on  &  indexing  
­ Input   ê Scripted  inputs     ê Modular  inputs   ê Custom  (trained)  source  types     ê Custom  sources  
­ Data  inges'on  pipeline   ê Field  extracGons     ê Field  transformaGons  
­ Indexing   ê Custom  indexes  
                          

§ Searching  
­ Search  authoring   ê Custom  search  commands   ê Macros  (basic,  parametrized)   ê Saved  searches  
­ Data  classifica'on   ê Event  types   ê TransacGons  
­ Data  enrichment   ê Lookups   ê KV  store  collecGons   ê Workflow  acGons  
­ Data  normaliza'on   ê Tags   ê Aliases  
­ Data  mining     ê cluster  &  dedup   ê anomalousvalue   ê kmeans   ê predict  commands  ...  
10  

§ Processing  &  repor'ng  
­ Search--'me  mapping   ê Data  models  
­ CIM  extensions  
­ Custom  UI/visualiza'ons   ê Pages,  views  &  dashboards   ê JS  Extensions   ê CSS  Extensions   ê Custom  setup  screens  
­ Scheduled  processing   ê Scheduled  reports    
­ Aler'ng   ê Scripted  alerts   ê Custom  alert  acGons  
­ Branding  &  naviga'on   ê Custom  app  navigaGon  &  branding  
­ Manageability   ê Custom  splunkweb  controllers   ê Custom  splunkd  endpoints  

3.  Mined  business  requirements  with  partner   4.  Formulated  learning  objecGves   5.  Reconciled  3  &  4  with  our  designs  
...  
11  

§ Data   § Search  language   § AggregaGng  siloed  metrics  into   meaningful  KPIs   § Data  manipulaGon   § Data  normalizaGon   § Sub--searches   § Config--driven   § Persistence  with  KV  store   § Macros  
§ Viz:   § Dynamic  scaling   § Customizing  in--the  box  viz   controls  
§ General  search  paqerns     § Search  opGmizaGons   § Ux  Prototyping     § AdapGng  3rd  party  viz  library     § Composite  charts  with    interacGons     § Dealing  with    high--volume  data  sets   § TroubleshooGng  perf  issues   § Post--process    or  not--post--process  ­    
deployment  implicaGons   § Automated  UI  tesGng  (w.Selenium)  
§ Post--processing   § IntegraGng  with  3rd  party  
component   § Unit  tesGng  (w.Mocha)   § PersisGng  state  (per  user)  
                                                                Plus  non--funcGonal  topics:   § App  versioning   § Packaging  InstallaGon   § Security  review  

§ Deployment   § Publishing  to  splunkbase  
§ App  cerGficaGon  

§ Custom  nav   § Ux  acGviGes  permeaGng  all  dev  
§ Using  sub--searches  to  correlate  data   § TroubleshooGng  searches  
§ Data  mining:   § ExploraGon   § PreparaGon:  filtering/deduping/   buckeGng   § Using  advanced  staGsGcs  funcGons   § Threshold--based  anomaly  detecGon   § EvaluaGng  goodness  /accuracy  
§ Data  modeling   § Using  lookups   § Building  a  baseline  lookup  table   § Windows  of  Gme/Custom  Gme  ranges   § Overlaying  Gme  data  
§ Serng  the  stage   § Overall  Splunk  app  structure   § UI  technology  selecGon:  
Simple  XML  vs  SplunkJS   § Modularity   § Dev    &  test  env   § Dev  workflow   § Modularity   § Data  onboarding   § CIM  compliance   § Tools  

      Takeaways  
!  PlaDorm,  not  just  an  engine  
!  On--prem  and  cloud  
!  App  development  !=  rocket  science  
!  Splunk  Developer  Guidance  :     learn  and  reuse  for  the  win!  
!  Reach  out  to  my  team   (devinfo@splunk.com)  and  tell  us   about  your  experience  

Resources  
dev.splunk.com/goto/devguide   github.com/splunk/splunk--ref--pas--code   github.com/splunk/splunk--ref--pas--test      blogs.splunk.com/dev   @devinfo   @gmelnik  
14  

Related  breakout  sessions  &  acGviGes  
A  Lap  Around  Developer  Awesomeness  in  the  Next  Version  of  Splunk     (Itay  Neeman/Glenn  Block)   Visualizing  Data  From  the  Ground  Up:  Raw  Data  to  Interac've  Graphics  With   Splunk  (Marshall  Agnew)   Liberate  Your  Applica'on  Logging!  (Glenn  Block/Jian  Lee)   Modular  Inputs  --  If  You  Build  It,  They  Will  Come  (ScoA  Haskell)   The  'State'  of  Splunk  --  Using  the  KVStore  to  Maintain  App  State  (Stefan  Sievert)   Advanced  Interac'ons  Using  SimpleXML  (Mathew  ElFng,   Siegfried  Puchbauer)   Splunk  Apps  You  Can't  Miss,  and  the  People  Who  Make  Them  (Hal  RoAenberg)  
15  

THANK  YOU  

