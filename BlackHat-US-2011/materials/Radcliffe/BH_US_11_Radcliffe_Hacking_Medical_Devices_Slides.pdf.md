Jay  Radcliffe  
jay.radcliffe@gmail.com   @jradcliffe02

Me  (AKA  Dad)  

  On  my  22th  birthday  I  was  diagnosed  with  diabetes     Being  a  geek,  I  have  a  huge  assortment  of  devices  to  
"help"  me  with  my  condiLon    Defcon  2009  ­  Parking  Meter  hacking  

  When  a  person  loses  the  ability  to  produce  insulin     Rather  then  the  pancreas  producing  insulin,  a  person  
has  to  administer  a  syntheLc  insulin  as  replacement     Sounds  simple,  but  there  is  no  magic  formula     Infinite  number  of  variables  (Stress,  Time  of  Day,  
Physical  AcLvity,  Illness,  Fiber,  Fat  content)  

  Non--PWDs  have  a  blood  sugar  between  90  ­  120  
  The  liver  and  pancreas  work  together  to  control  these   levels  
  Pancreas  produces  insulin,  which  is  used  to  process  the   sugar  into  energy  (for  use  or  storage)  
  Liver  holds  a  sugar  (glucose)  reserve  that  can  be  used  if   levels  get  too  low  

  Normal  person  eats  a  Snickers  bar  (32g  Carbs)  
  As  that  sugar  enters  the  blood  stream,  pancreas   produces  insulin  to  match  that  quanLty  of  sugar  to   allow  the  conversion  to  energy  
  Sugar  levels  might  jump  20  "points"  as  insulin  takes   effect  

  PWD  eats  a  Snickers  Bar  (32g  Carbs)  
  DiabeLcs  have  an  equaLon  Amount  of  Insulin  per   Grams  of  Carbs  (Mine  is  1U  Insulin  /  10g  Carbs)  
  Ideally,  Insulin  is  given  at  the  perfect  Lme  and  mimics   human  insulin,  keeping  sugar  levels  stable.  

  If  no  Insulin  is  administered,  blood  sugar  has  a  huge   spike  (In  my  case,  200+  points  within  40  minutes)  
  Sugar  can  not  be  processed  into  energy,  body  does  two   things  
  Filters  sugar  out  through  the  kidneys.  Very  stressful  to   kidneys.  Extreme  Thirst.    
  Body  switched  to  fat  for  energy.  Also  very  stressful,  causes   ketosis  potenLally  ketoacidosis.    
  Headaches,  blurry  vision,  long  term  kidney  damage  

  If  too  much  Insulin  is  given,  blood  sugar  can  crash  to   under  60  
  Heart  and  Brain  run  on  sugar  exclusively     Body  starts  to  shutdown,  conserving  available  sugar  to  
respiraLon  and  heart     Starts  with:  SweaLng,  loss  of  fine  motor  control,  shaking  
hands,  overly  drunk  feeling     Uncorrected  leads  to  coma,  respiratory  failure  and  death  
  Some  diabeLcs  lose  the  ability  to  feel  these  symptoms  

  Body  is  like  a  complex  chemical  plant  
  RelaLonship  between  pressure  and  temperature  of   chemicals  just  like  insulin  and  sugar  
  The  SCADA  system  monitors  the  pressure,  and  adds  or   removes  heaLng  to  keep  pressure     constant.  
  Pressure  gets  too  high  =  BOOM  
  Pressure  gets  too  low  =  water   delivery  failure  

  Similar  to  water,  diabeLcs  monitor  sugar  levels  and   adjust  insulin  and  food  intake  to  control  levels  
  Sugar  too  low?  Drink  fruit  juice  or  other  sugar  foods  
  Hard  to  precisely  measure  amount  of  carbs/sugar  consumed     Could  take  hours  to  process  total  amount  of  sugar  
  Sugar  too  high?  Adjust  insulin  or  wait  
  Fast  acLng  Insulin  lasts  3--4  hours  in  human  system,  can  not   be  removed.  Not  easily  adjusted  
  FrustraLng  never--ending  manual  process      

  ConLnuous  Glucose   Monitors  (CGM)  
  New  Technology    
  Small  wire  in  Lssue  to   measure  electrical   elements  of  fluid  
  Graphs  sugar  values  over   Lme  
  Huge  leap  forward  

  Insulin  Pump  
  Delivers  insulin  in  2  ways  
  Basel:  Every  3  minutes     Meal:  At  MealLme  
  Delivered  through  tubing   ajached  to  body    
  Tubing  replaced  every  3   days  

  Pre--Tech:  Urine  TasLng  (Yes,  for  real)  
  Very  imprecise,  gross,  no  syntheLc  insulin  
  Early  80's  Home  Test  Kit  
  Blood  test,  poke  finger,  get  value     Live  DemonstraLon!       Accuracy  varies  (10--15%)  Cost  =  $0.75  --  $1.25  per  
test     No  contextual  informaLon  (direcLon/history)  
  SLll  most  common  used  method  

  Mid--2000's  advent  of  ConLnuous  Glucose  Meters  
  Measures  resisLve  value  of  intersLtal  fluid  to  measure   sugar  levels  
  Wireless  Sensor  ajached  to  special  wire  inserted  into   Lssue  
  Needs  blood  tesLng  every  12  hours  to  calibrate,  sensor   lasts  7  days  (Per  FDA  regulaLons)  $40--70  per  sensor    

Picture  from  Armozyme.com  

  Hypothesis:  CGM  wireless  results  are  transmijed  with   lijle  to  no  security.  These  results  can  be  vulnerable.    
  Sensor  runs  on  1.5v  "watch"  bajery  for  2  years.  Crypto   would  require  more  horsepower  (200k+  transmits)  
  Non--bidirecLonal  communicaLon.    Sensor  has  no  knowledge   of  what  is  receiving  the  data  
  Sensor  is  unaware  of  Lme  or  sequence  numbers  
  How  do  we  verify  this?      

  First,  read  the  manual  
  RTFM:  FCC  Disclosure  
  Small  Transmission  (9ms,  76  bit  packet)     Sounds  like:       No  ACK  back,  confirms  beacon  

  All  RF  Transmitng  devices  go  through  FCC  tesLng  and   verificaLon    
  FCC  issues  a  TX  ID  for  all  devices     Very  Detailed  Report.  Screen  Caps  from  Spectrum  
Analyzers,  Oscilloscopes    hjp://transiLon.fcc.gov/oet/ea/fccid/  

  When  companies  file  a  patent,  documents  are   published  that  show  how  the  device  is  made  and  it's   funcLon  
 hjp://www.freepatentsonline.com  
  Very  detailed  on  operaLon  of  devices  

  Taking  a  CGM  Apart     AMIS  52100M  Chip     Antenna  Visible     Out  Of  ProducLon  Chip     Datasheet  has  good  hints     Same  chip  used  in  ICS  
environments  (ICS/SCADA)  

  Ardunio  Based  SoluLon  
  Ardunio  is  a  hardware  based  plavorm  that  has  RF   modules  that  it  can  use  
  RFM22B  by  HopeRF  /CC1101  by  TI       Cover  300mhz  ­  900mhz    (sub--1ghz)  

  First,  hard  to  program.  Registers  have  to  be  set   according  to  the  manual,  all  in  binary/hex   notaLon.    
  Example:  Register  0x08  Packet  Control    
  8  bits  of  data  in  the  register  

  Even  awer  you  determine  the  register  setngs,   you  have  to  set  them  
  Lijle  to  no  verificaLon  that  value  has  taken     Lost  2  weeks  to  this     Thought  I  was  wriLng  to  register,  turns  out  none  
of  the  register  values  were  being  changed     Zero  indicaLon  of  that  

  First  Real  difference  between  Systems/Computer  world   and  Hardware  World  
  Hardware  is  very  concerned  with  cycles,  so  much  of  the   hardware  code  I  saw  did  lijle  to  no  verificaLon  of  it's   acLons.  If  I  had  this  issue  with  a  perl  program  or  shell   script  I  would  have  gojen  an  error.    
  Note:  We  see  a  lot  of  exploits  and  vulnerabiliLes  based   on  this  concept  in  sowware.  Buffer  overflows  due  to   not  verifying  boundaries  (strcpy).  Can  this  be  the  case   in  hardware  land?  

  What  is  On--Off  Keying?  (AKA  OOK)     Simplest  form  of  RF  ModulaLon  
  Pure  Binary,  no  signal  =  0,  signal  =  1.  Very  fast     8192  bits  /  sec  *  9ms  =  ~  76  bits  

  Next  problem:  The  RF  module  wants  to  know  certain   parameters  of  the  transmission  
  Preamble:  This  is  a  series  of  binary  1s  and  0s  used  to  indicate   that  data  is  going  to  be  coming  shortly  
  Used  to  "warm--up"  the  RF  gain  setngs  and  to  wake  from   a  power  saving  mode  
  Sync  Word:  Think  of  this  as  the  secret  word.  Set  of  characters   that  assure  that  the  transmission  format  is  correct.    
  CRC/CRC  LocaLon:  This  is  usually  8  bits  at  the  end  that  are   used  to  make  sure  there  is  data  integrity.      

  TESTING  TESTING          31337      12345            15  
  |______Preamble_____||_SYNC__||__Data__||_CRC_|  
  If  31337  is  not  received,  RF  Module  ignores  it     If  15  is  not  the  CRC  (assume  CRC  is  1+2+3+4+5)  RF  module  
ignores  it     Guess  what,  I  have  no  idea  the  format!       AMIS  Data  Sheet  indicated  that  it  doesn't  use  Preamble,  only  
sync  word,  which  is  set  in  the  by  the  manufacturer  

· Direct  mode  is  a  configuraLon  for  the  RF  module  that   allows  you  to  "see"  all  the  signals  on  a  given  frequency  
· Only  way  to  view  is  with  an  oscilloscope  or  logic   analyzer  

  Here's  what  is  known:  
  76  bit  transmission     CRC  exists(Patent  docs  menLon  it)     There  is  a  transmijer  ID  
  5  Characters       First  char  is  0  or  1,  last  4  are  [0--9,A--Z]  (From  Manual)  
  There  is  a  Sync  word  of  unknown  length  and  value     There  is  some  numerical  data  for  the  electrical  
resistance  

  Took  a  couple  days  to  get  some  things  figured   out  
  Mid--80's  borrowed  oscilloscopes  ­  Manual  not  so   friendly  
  RF  module  setngs  way  too  sensiLve  (AGC)     More  register  bajles  
  Eventually  captured  two  9.3ms  transmission   exactly  5  min  apart!  

  Collected  10  transmissions  and  decoded  with   paper  and  pen  
  Looks  like  total  jibberish  ­  not  what  I  was   expecLng  
  I  expected  TCPdump  like  precision  

  Was  expecLng  a  preamble  per  my  research:  
  10101010  =  Research  Preamble  (8  bit)  
  What  I  saw:  
  1111  up  to  11111111  
  Re--read  AMIS  documents     "RF  Sense"    
  Chip  expects  a  "wake--up"  transmission     Series  of  1s  make  sense!       Variance  makes  sense,  RF  module  wakeup/sejeling  

  Think  like  a  cryptographer  
  Known  values  in  "plain--text"  =  last  4  of  TX  ID  (CTA3)     Most  of  the  transmission  is  idenLcal  every  Lme  
(Sync,  transmijer  ID)     Data  will  change  lijle  in  5  min  intervals     Pajerns  in  "crypt--text"?  

  Without  changing  any  bits,  only  alignment  I  see   something!  
  Of  40  captured  Transmissions  80%  had  this  same   series  of  24  bits,  all  starLng  awer  Preamble/RF   Wakeup  
  Tried  Inversion  (AMIS  chip  opLon)  --  No  luck     Reached  out  to  TI  for  help  
  Clueless.  Obscure  way  to  use  this  chip.       Got  quesLoned  on  the  ethics  of  my  work  

  Just  too  many  combinaLons  of  setngs,  all   impact  how  the  direct  mode  behaves  
  Zero  real  documentaLon,  Zero  users  experienced  
  Way  beyond  intended  purpose  (DefiniLon  of   Hacking)  

  Replay  Ajacks  
  Method:  Capture  and  repeat  packet       Impact:  Incorrect  Values  or  DoS       LimitaLons:  Physical  Range,  Can't  manipulate  values  
(yet)  
  Denial  of  Service  
  Method:  "Jamming"  legiLmate  signal     Impact:  User  would  get  no  values  from  CGM       LimitaLons:  Physical  Range,  Non--CriLcal  funcLons  

  InjecLon  
  Method:  If  you  can  reverse  the  format,  you  can   construct  a  sensor  transmission.  Listen  and  catch   TX  ID,  then  retransmit  with  fake  data  porLon  
  Impact:  User  inputs  incorrect  values  into  insulin   equaLon.  Too  much/too  lijle  insulin.    
  LimitaLons:  Human  Intelligence,  Gut  Feeling,   Experience.  Currently  unknown  data  format.  

  ConLnuous  Glucose   Monitors  (CGM)  
  New  Technology    
  Small  wire  in  Lssue  to   measure  electrical   elements  of  fluid  
  Graphs  sugar  values  over   Lme  
  Huge  leap  forward  

  Insulin  Pump  
  Delivers  insulin  in  2  ways  
  Basel:  Every  3  minutes     Meal:  At  MealLme  
  Delivered  through  tubing   ajached  to  body    
  Tubing  replaced  every  3   days  

  Insulin  Pumps  are  used  to  delivery  insulin  to  paLents,   hooked  to  a  person  via  tubing  24/7  
  Blood  Meters  can  send  measurements  wirelessly  to   Insulin  Pump  for  easier  user  experience  
  Special  USB  dongles  used  to  program  Insulin  Pumps  and   download  history  data  
  Special  wireless  remotes  used  to  deliver  insulin  

  Hypothesis:  Wireless  communicaLon  with  insulin   pumps  are  not  secured  and  can  be  subject  to  ajacks  
  CommunicaLon  is  more  complex,  probably  bi--direcLonal  
  Ancient  windows  programs  used  for  config  (will  not  install  on   anything  above  XP)  indicate  lack  of  knowledge  
  Devices  not  designed  to  be  updated.  No  way  of  patching.  5+   year  life  span.  

  Java  Based  Config  program  
  Set  logging  from  NONE  to  HIGH  
  BAM!  Shows  full  packets,  command  structure,  ACK   responses,  everything.    
  INFO: XXXXXX Command-sendCommand: SENDING CMD 0x5A (Set RF Power On-command packet)
  INFO: XXXXXX Command-encode: about to encode bytes = <0xA7 0x31 0x33 0x70 0x5A 0x00 0xA8>
  INFO: XXXXXX SerialPort-write(int buffer[])(20MS): writing <0x0A 0x0B 0xA8 0x6D 0x16 0x8E 0x39 0xB2 0x94 0xB5 0x55 0xA9 0xA5>

  Encoding?!  
  Encoding  makes  the  message  longer,  but  not  double.   Wonder  how?  
  Jar  file  
  Not  obfuscated,  shows  full  encoding  method     Not  crypto  complicated     Shows  *all*  commands  and  packet  structure.    

  Jar/Log  Analysis  
  Talks  directly  to  serial  port  (USB--to--Serial)     Only  unique  piece  of  informaLon  needed  is  Serial  Number  of  
pump  
  Pump  analysis  
  No  ability  to  stop/block  receiver     No  verificaLon  step  on  pump     Does  exactly  what  it's  told,  no  quesLons  asked  

  Remote  Controls  
  All  have  opLonal  remotes  with  unique  IDs     Pump  has  to  be  configured  to  allow  that  ID  
  Blood  Meter    
  Blood  Meter  has  Unique  ID,  sends  beacon  out  with  value  +  ID     Pump  has  to  be  configured  to  allow  that  ID  
  Data  Download  
  Has  all  historical  data  

  Hardware  Needed  
  RF  Serial/USB  device  are  easy  to  get.  $100  New,  as  low  as   $20  on  eBay.  No  restricLons.  
  Remotes  for  pumps:  Also  trivial  to  acquire.    
  InformaLon  Needed  
  Serial  Number:  Can  be  socially  engineered.       Serial  Number  can  be  scanned  for.  Six  digits  number.  Very  
feasible.  

  Full  Remote  Control  
  Method:  Send  command  to  pump  to  allow  Remote  Control   ID  12345.    
  Impact:  Full  meal  insulin  delivery  control.  
  LimitaLons:  Physical  Range  (100w,  more  with  mods),  Pump   NoLficaLon  of  Delivery  
  Very  scary.    Applies  to  any  configurable  setng.  Including  the   variables  on  how  much  insulin  to  deliver.  
  "root"  access  to  the  device  (and  technically  your  body)  

  JDRF  ArLficial  Pancreas  project  
  Links  CGM  and  Insulin  pump  together     Eliminate  User  IntervenLon!     CGM  data  will  be  used  to  act  without  the  user,  *very*  
dangerous.       Makes  security  of  CGM  transmission  much  more  important  

  New  RF  range  (2.4ghz)  bluetooth?  
  Some  already  using  bluetooth  in  pumps,  partnering   with  CGM  on  new  pump  features  
  Bluetooth  bejer  or  worse?  Maybe  both  
  Tools  for  research     Tools  for  exploits  (Metasploit  module  for  Insulin  pumps?  
AHHHHH!)  

  New  RF  chips  have  crypto  on  board,  use  it     Use  IR  rather  then  RF  ­  Painful,  but  more  secure     Verify  New  Config     Setng  a  Passcode     Keep  range  limited  
  One  pump  uses  13mhz  OOK.  Near  20  meter  ham  band  where   1  waj  transmissions  can  be  global.    
  Blocking  
  Researchers  are  working  on  RF  blocking  necklaces  for   stopping  RF  OOK  Pacemakers  from  malicious  interference  

  Same  Hardware  RF  Chips  used  in  ICS/SCADA   environments  
  Older  SCADA  wireless  uses  OOK  wireless  in  sub--1ghz   bands  
  Same  techniques,  different  targets     Harder  to  replace,  more  costly    

  Huge  value,  more  should  be  done  
  Everything  becoming  wireless  or  connected     There  is  always  a  threat  lurking,  shouldn't  be  ignored     Don't  hide  behind  obscurity,  way  too  many  smart  people,  it  
always  fails  
  It's  really  hard  
  Think  of  trying  to  transcribe  TCP  packets  on  oscilloscope     More  tools  needed,  more  interest  needed.  

  Please  Remember  to  Complete  Your  Feedback   Form!    
  QuesLons?  Comments?      jay.radcliffe@gmail.com     Twijer:  @jradcliffe02  

