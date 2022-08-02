Opcodes in Google Play
Tracing malicious Applications
Speakers
Alfonso Muñoz, PhD (@mindcrypt)
Senior Cybersecurity Researcher ­ alfonso.munoz@11paths.com
Sergio de los Santos (@ssantosv)
Head of Lab in ElevenPaths - ssantos@11paths

01
Android malware is coming!
True but... what is malware, anyway?

elevenpaths.com  

elevenpaths.com  

  

2  

  

01 Android  malware  is  coming!  

elevenpaths.com  

3  

  

01 Android  malware  is  coming?  

·  Android  and  Google  Play,  they  do  indeed  have  great  security  measures...   ·  ...  but  what  if...  malware  (ok,  PHA)  DO  NOT  NEED  TO  BREAK  THEM?  
  

elevenpaths.com  

4  

  

01 "Malicious  code"  in  Android  /  Google  Play  
·  Malware/adware  that  sends  SMS  premium  messages.   ·  Steals  informaRon   ·  Makes  you  part  of  a  botnet   ·  Click  fraud   ·  Insane  ads   ·  RATs   ·  ...  

·  All  found  outside  and  INSIDE  Google  Play...  and  all  with  a  significa<ve  install   rate.  At  least  enough  to  keep  produc<on...  why  would  aBackers  invest  <me  in   crea<ng  them  otherwise?     

elevenpaths.com  

5  

  

01 "Malicious  code"  in  Android  /  Google  Play  

·   AnRvirus   is   not   exactly   the   technology   we   need   for   researching,   discovering   or   analyzing  new  malware,  frauds  or  threats.            ·Researchs  work  with  "intelligence".     That  is  great,  but...           
  
·...to  build  this  intelligence,  they  are  very  "malware  set  dependant"  (relying  on   VirusTotal   or   ContagioDump...),   so   they   will   be   good   detecRng   this   kind   of   malware,  but  not  the  new  one.   ·   ...regarding   apps,   tradiRonally,   they   have   relied   on   permissions,   number   of   permissions,  code,  urls....  and  just  that.   ·  Some  of  them  work  with  not  so  may  apps  to  train  this  intelligence.   ·  They  feedback  themselves  with  reputaRon,  VT  feedback,  etc.     ·  And  of  course...  adware.  

elevenpaths.com  

6  

  

01 What  about  adware?  

Adware  is  a  tricky  ma_er.  

Adware  for  Android  may  be  very  aggressive.  Such  aggressive  that  it  could  steal  data,    

or  flood  you  with  popups  since  the  telephone  turns  on.  

An#viruses  

  

Google  Play  

· Android   developers   use   SDK   to   inject   ads   and   have   some   revenues.   They   may   configure   this   SDK   so   it   is   more   or   less   aggressive.    
· They  usually  mark  this  SDK  as  ADWARE.  It   does   not   ma_er   how   the   developer   have   configured  this  ads  to  work  into  the  app.  

· Google  Play  IS  OK  WITH  ADS,  much  more   than   Avs   or   even   users.   What   may   be   wrong   for   an   AV,   is   sRll   ok   with   Google   Play.  
  
· Google   Play   wants   to   make   money   from   this  ads.  But  Google  Play  does  not  want  to   be  "so  OK  that  it  bothers  the  user"...  

· They   want   to   detect   a   lot,   and   get   rid   of   ads  for  the  user  

· So,  AFTER  some  complains,  invesRgaRons,   or  any  other  criteria,  it  removes  them.  

So,  basically,  there  is  a  grey  area,  and  a  conflict  of  interests.  

elevenpaths.com  

7  

  

01 What  to  do?  

· Android  apps  are  APK,  which  are  sets  of  Java  files  packaged  in  a  ZIP  structure  signed   with   a   self   signed   cerFficate.   We   have   idenFfied   and   dissected   most   of   the   technical   characterisFcs.  

  
· Most   of   Android   apps   are   hosted   in   Google   Play,   with   a   developer,   comments,   descripFons,  images,  versions,  categories...  
  
· There  is  plenty  of  informaFon  in  three  stages:    

  

  Google  Play  -->  The  zip  file  itself  -->  cryptographic  informaFon  

  

· An   app   is   not   just   an   app   but   an   app   and   its   circumstances.   Focus   on   WHO   and   HOW,  aside  the  WHAT  

  

· Combining  these  three  aspects  we  can  get:  

  

  A  lot  "checkpoints"  of  data,  that  may  idenRfy  and  classify  an  app.  

  

  From  these  data,  we  can  deduce  the  behavior  of  a  developer.  

  

  We  collect  all  these  data,  make  a  database,  and  "shake  it".  

  

This  has  to  be  seen  as  a  complementary  method  to  detect  malicious  behaviour  and  it  is   not  intended  to  replace  any  exis#ng  ones.  

elevenpaths.com  

8  

  

01 And...  more  

How  to  do  it?   Are  there  any  previous  researches  about  this?  
·   We   need   to   find   discriminant   "features"   to   disRnguish   between   goodware   and  "malware"  apps  
·    To   be   "really"   fast,   lets   consider   features   from   the   apps   and   its   environment,   that   do   no   require   code   revision   or   installing   the   apps   (and   execu<on)  
·  Machine  Learning  using  features  (supervised  learning)  ­  SVM  (Support  Vector   Machine)  

Any  difficulFes?  

QuanRty:          We  need  a  huge  dataset  of  apps  to  test  different  researches  
Quality:          Dataset  Goodware  and  malware                      Features  selecRon  

elevenpaths.com  

9  

  

02
Previous researches
Hello?... Is there anyone out there?

elevenpaths.com  

elevenpaths.com  

  

10  

  

elevenpaths.com  

11  

  

02 Previous  researches  &  results!  
True  but...  what  is  malware,  anyway?  
These  studies  are  all  great.  But,  may  we  improve  this  in  real  life?   · They  get  a  very  good  accuracy  (up  to  94%)  and  low  False  posiRves  (down  
to  1%),  detecRng  specific  malware.   · They   are   very   "malware   set   dependant"   (relying   on   VirusTotal   or  
ContagioDump...),  so  they  will  be  good  detecRng  this  kind  of  malware.    
· They  have  relied  on  permissions,  number  of  permissions  and,  in  a  way,   code.  
· Some  of  them  work  with  not  so  many  apps  to  train.  

elevenpaths.com  

12  

  

02 But...  What  is  malware?  
Choosing  malware  set  
VirusTotal  is  an  excellent  tool,  but  we  think  it  needs  to  be  "understood"...  It  is  used   for...  
   a) Comparing  anRvirus  engines  in  a  global  or  parRcular  way.  This  is  an  awful  idea.  
(Just  read  VirusTotal  own  help  page...).      
b) Cataloguing   samples   as   malware.   If   it   is   "very   detected"   (what   does   exactly   that  mean,  anyway)  it  is  surely  in  the  "malware  box".  Ok  with  it?  
· What  is  the  right  X?  VT>1,  VT>5,  VT>10,  VT>15?  Engines  are  growing  in  VT...   · If  we  use  reputaRon  of  the  engine  as  a  factor...  what  is  "reputaRon"?  Vary  famous?   · Do  we  really  take  into  account  that  some  Avs  simply  do  not  work  with  Android?   · Do  we  really  penalize  engines  that  detect  "a  lot",  so  much  that  they  may  be  false  posiRves?      Seong   as   goodware   samples   with   0   detecRons:   Depending   of   the   freshness   of   the   sample,   samples  are  not  detected  by  signatures.      

elevenpaths.com  

13  

  

02 What  is  malware?  
Choosing  the  malware  set  
So   far,   for   sure   we   just   have   "numbers"   and   subjecFve   "quality"   of   engines...  Did  you  know...?   · VirusTotal  sends  the  samples  to  all  AV  houses.     · From   an   AV   standpoint,   the   first   criteria   for   a   quick   detecRng   such   a   flood  of  malware  is,  precisely...  VirusTotal.   · Later,  when  they  can  (Rme  rules)  they  may  create  a  rule  or  analyze  the   sample.   · So,   for   some   anRvirus,   VT   is   their   first   source,   and...   if   researchers   apply  this  criteria...  this  criteria  is,  in  some  way,  feeding  back  itself.    
  

elevenpaths.com  

14  

  

02 What  is  malware?  
Choosing  the  malware  set  
Is  there  a  be_er  way?  
We  do  not  know  in  PE  world...   but,  let's  play  in  a  smaller  field...   Android  world,   and  Google  Play  town.  
So,  in  this  new  field,  some  considera<ons  should  be  taken  into  account.  

So,  what  would  be  "malware"  in  Google  Play?   How  to  build  a  good  "malware  set"  so  we  can  create  a  good  classificator    

elevenpaths.com  

15  

  

03
Signature accuracy and Gregariousness
A proposal to get better malware sets

elevenpaths.com  

elevenpaths.com  

  

16  

  

03 Signature  accuracy  
Google  Play  knows  its  bussiness,  doesn't  it?  

· Signature  accuracy  may  be  seen  as  another  factor  of  quality  assigned  to   a  detecRon.  
· It  is  based  on  using  Google  Play  as  a  Judge,  that,  removing  the  app,   validates  in  some  way  AVs  detecRon.  "Hey,  you  were  right,  this  app  should  not  be  
here,  (although  it  will  take  a  while  for  me  to  remove  it")  
  
· "The  more  detected  apps  with  a  signature,  that  are  eventually  removed  from   Google  Play,  the  more  accurate  the  signature  is"  
  
· If  these  detected  apps  are  not  removed  from  Google  Play,  it  means  Avs   were  too  aggressive,  (it  was  just  "tolerated  adware").  This  is  why  some   of  the  studies  say  there  is  so  much  malware  in  Google  Play.  
· That  is  easy:  NumberOfReRredWithASignature/DetectedWithASignature   =  accuracy  of  the  Signature.  
We  could  take  "all  the  apps  detected  with  high  accuracy  signatures"  
This  would  give  us  a  nice  malware  set.  

elevenpaths.com  

17  

  

03 Signature  accuracy  
Google  Play  knows  its  bussiness,  doesn't  it?  
     

elevenpaths.com  

18  

  

03 Signature  accuracy  
Google  Play  knows  its  bussiness,  doesn't  it?  
· Yes,  "accuracy"  has  some  "problems":  
  
· We   have   to   improve   it   a   bit,   and   introduce   the   concept   of   "Credibility"   and   "ParRcipaRon",  so  a  "good"  performance  has  been  shown  over  <me,  detec<ng   a   minimum   with   success.   How   many   Rmes   a   signature   should   be   used   so   it   shows  a  good  performance  over  Rme?  
Credibility  Based  on  ParRcipaRon  X  Accuracy     

elevenpaths.com  

19  

  

03 Signature  accuracy  /enhanced  
Google  Play  knows  its  bussiness,  doesn't  it?  
     

elevenpaths.com  

20  

  

03 Gregariousness  
Some  Avs  are  more  "reacRve"  than  others     
· What  if  the  Avs  detect  a  lot  just  when  others  do?  (gregarious)   · What  if  Avs  detect  a  lot  of  false  posiRves?  (eccentric)      We   may   improve   this   a   li_le   bit,   trying   to   determine   de   "nature"   of   the  
signature.  For  the  future,  we  need  to  penalize  signatures  that  work  a  lot   in   "single"   detecRons   (eccentric)   or   just   when   any   others   detect   (gregarious).  
   · So  the  opRmum  point  is  somewhere  in  the  middle.  

elevenpaths.com  

21  

  

03 Gregariousness  
Some  Avs  are  more  "reacRve"  than  others      What  is  the  average  number  of  engines  detecRng  the  same  apps  (in  average)  
that  this  signature  detects?  
Given  a  signature:  
· How  many  apps  are  detected  by   this  signature?  
· For   this   apps,   how   many   others   engines  detect  them   (in  average)?  
· Basically:  It  is  the  average  of  the   coefficient  of  detec<on  

elevenpaths.com  

22  

  

03 Gregariousness  
Some  Avs  are  more  "reacRve"  than  others  
· If   you   are   the   unique   detector   of   suspicious   apps,   your   Gregariousness   would  go  to  0.  You  could  be  a  genius  or  just  be  wrong  with  this  signature.  
· If  the  apps  are  very  detected,  Gregariousness  would  go  to  1.  Example:  Eicar.   By  definiRon  is  detected  by  all  the  other  engines  with  one  signature  of  any   engine.      
· Balanced  joins  the  two  concepts  (gregarious  and  eccentric)  in  a  value  that   goes  to  1  when  the  signature  is  "balanced"  (nor  gregarious  and  nor   eccentric).  It  goes  to  0  when  is  close  to  any  of  the  edges  of  a  Gauss  funcRon.  

elevenpaths.com  

23  

  

03 Gregariousness  /  Balanced  
Some  Avs  are  more  "reacRve"  than  others     
Same  criteria  of  ParRcipaRon  should  be  applied.  

elevenpaths.com  

24  

  

03 All  together  now  
What  we  have  done  so  far.  Any  malware  set  may  be  ok  depending  on  what   you  need  
     

elevenpaths.com  

25  

  

04
Datasets Goodware and Malware
Because... size matters!

elevenpaths.com  

elevenpaths.com  

  

26  

  

04 Size  ma_ers...  
We   have   a   mega   database   of   Android   Apps   with   its   market   data   associated   and   metadata  of  the  APK  itself...  and  the  results  in  VirusTotal  of  the  apps.  It  is  used  in   intelligence  and  researching...      
  
611,323  of  our  apps  were  found  in  VirusTotal,  from  a  total  of  742,344  that  we  got   (about  September  2014),  extrictly  from  Google  Play.  Nowadays  we  have  about  3M  

90000   85313   80000   70000   60000   50000   40000   30000   20000   10000  
0   >=1  

45113   >=2  

29584   >=3  

22169   >=4  

17711   >=5  

13560   >=6  

10398   >=7  

8006   >=8  

5924   >=9  

elevenpaths.com  

27  

  

04 All  together  now  
What  we  have  done  so  far.  Any  malware  set  may  be  ok  depending  on  what   you  need     
· We  have  created  a  criterion  to  improve  the  generaRon  of  malware  sets   based  on  informaRon  retrieved  from  Google  Play.  
· It  is  very  customizable.  
· This   may   improve   researches   about   "detecRng   malware/adware"   with   machine  learning  techniques  and  Android.  
   For  us,  goodware  dataset  is:     
· No  detecRons.  
· 4.3  stars  or  even  be_er.  
· 70,000  or  more  downloads.  
· More  than  a  month  in     Google  Play.  

elevenpaths.com  

28  

  

05
Machine Learning (SVM)
Detecting features and classifying malware
(Research in progress)

elevenpaths.com  

elevenpaths.com  

  

29  

  

05 Target:  RealisRc  and  improved  classifier  
h_ps://aws.amazon.com/es/machine--learning/details/  
· Machine   learning   (ML)   is   a   "commodity".   There   are   so   much   libraries   (SPARK/ MLLIB,  LIBSVM,...)  ant  it  is  easy  to  analyse  data  using  ML.  

Recipe  for  classifier  
· Malware  set   · Goodware  set   · Features  to  define  apps  

· We  do  not  need  only  goodware/malware  sets,  but  "features"  of  the  apps  to  build   different  machine  learning  classifiers.  Which  are  the  bests  features?  

elevenpaths.com  

30  

  

05 Previous  researches...  
· With  our  huge  database  (around  3  million  apps),  we  validate  previous  studies   that  use  the  number  of  permissions  (apps)  as  a  feature  (goodware/malware).  
  
Is  the  number  of  permissions  a  good  feature  to   classify  malware?  

· Malware  does  not  have  more  permissions  than  other  apps  (in  general)...  

· Malware  is  (only)  more  likely  in  a  range  from  FOUR  to  THIRTEEN  permissions.  

  

elevenpaths.com  

31  

  

· Specific  combinaRons  of  permissions  or  specific  permissions  by  category   (apps)  are  useful  to  detect  malware?  

elevenpaths.com  

32  

  

05 Features  based  on  permissions...  
Let's  try  to  build  a  classifier  using  permissions  as  the  only  feature  
· Well,  the  only  way  to  know  it  is  tesRng...  what  will  happen?   · First:  let's  try  to  propose  an  app  definiRon  only  by  its  permissions.  

App  

Applica<on  profile    
(based  on  permissions  as  a   feature)  

All  the   permissions  

· It  does  not  seem  a  very  accurate  way  of  defining  an  app,  but  this  is   an   experiment   to   see   if   it   is   enough   for   classifying   only   by   this   parameter  
· Second:  we  make  a  supervised  learning  process  from  the  apps  in  both   sets  (goodware/malwae),  just  taking  the  permissions  into  account.  

elevenpaths.com  

33  

  

05 Features  based  on  permissions...  
Let's  try  to  build  a  classifier  only  using  permissions  as  a  feature  
· We  have  trained  a  machine  learning  system  with  supervised  learning   implemenRng  Support  Vector  Machine  (SVM)  algorithms.  
· With   our   huge   dataset   (apps)   from   Google   Play   and   their   criteria   (previous  studies)  for  choosing  a  malware  set,  we  were  not  able  to   guarantee   an   acceptable   accuracy   to   dis<nguish   and   classify   adware/malware  and  goodware  relying  only  on  the  permissions.    
  
· Results:    
   Sorry...  but  as  far  as  we  know  previous  researches  don't   work  with  a  huge  dataset   
· What  do  we  do  now?  

elevenpaths.com  

34  

  

05 Features  based  on  permissions  by  category...  
Come  on!  Let's  try...  

· With   subsets   by   category   (apps)   the   classifier   beBer   detects   goodware/malware   than   when   it   uses   features   based   on   permissions   with   general   subsets   (in   this   last   case  we  are  not  able  to  disRnguish  between  goodware  and  malware)  

Without  Category  (general  dataset):  Accuracy  =  50%  

Category  

Accuracy     %  

Category  

Accuracy   %  

Category  

Accuracy   Category   Accuracy  

%  

%  

Book  and   reference  

77.74  

Game  arcade  

72.57  

Lifestyle  

74.77   Shopping   86.11  

Business  

76.06  

Game  educaRonal   66.88   Game  acRon   66.66  

Social  

73.66  

Communicaton  

78.33  

Game  family  

71.33   Game  sports  

68  

Sports  

77.86  

EducaRon  

71.22  

Game  puzzle  

84  

Photography  

76  

Tools  

66.33  

Entertainment  

66.66  

Game  Racing  

74.92   PersonalizaRo n  

80.26   ProducRvity   77.40  

· Although,  the  results  are  bad,  this  study  gives  us  a  good  idea  to  move  forward:  What   will  happen  if  we  use  more  features  and  specific  categories  (granularity)?  

elevenpaths.com  

35  

  

05 What  will  happen  if  we  use  more  features  and  

specific  categories  (granularity)?      

  

AddiRonal  specific  features  could  work  be_er  in  a  specific  dataset  

Dataset  Malware   Dataset  Goodware  

App  Category  

Feature  A  =  1  

Feature  A  =  0  

Feature  B  =  0  

Feature  B  =  1  

App3  

App1  

App2  

Training     Model  

Apps  "Goodware"  

Apps  to     predict  

Apps  "Malware"  

elevenpaths.com  

36  

  

05 What  features  we  use?  "Meta--info  features"  
Let's  try  to  improve  the  classifier  with  some  more  features  

Do  these  features  are  useful  to  classify  goodware  and  malware?  

elevenpaths.com  

37  

  

05 How  to  select  features?...  We  will  be  honest!  :D  
· Basic  staRsRcs  and  "intuiRons"...  and,  recently,  features  selecRon  algorithms     
   ExpiraRon  date  (years)   self--signed  cerRficate  

elevenpaths.com  

38  

  

05 Classifying  with  more  features  (meta--info)...  
Example  dataset  goodware/malware  
· Trend:  More  features  and  specific  categories  (granularity)       · Goodware  (True  PosiRve),  Malware  (True  NegaRve),  SVM  (Support  Vector  Machine)   · 10  features:  number  permissions,  size,  cerRficate,  info  descripRon,  ...   · Results  are  much  be_er  than  with  features  based  on  permissions  only...    
· Train:  16,470  (apps  goodware)  +  8,236  (apps  malware)     · Test:  8,236  (apps  goodware)  +  4,118  (apps  malware)   · In  total  ("global"  classificaRon):    37,060  apps  =  24,706  goodware  +  12,354  malware  
· Accuracy  =  91.015555%  (11,244  apps  ok  predicted  /  12,354  apps  to  predict)  
  
· Recall  =  True  posiRve  rate  =  90.2507%  (measure  the  proporRon  of  GOODWARE  which  is  correctly  idenRfied  as  such)  TP/TP+FN           True  negaRve  rate  =  92.9468%  (measure  the  proporRon  of  MALWARE  which  is  correctly  idenRfied  as  such)  TN/TN+FP  
· Precision  =  Posi<ve  Predic<ve  value  =  97%  (how  good  is  predic<ng  goodware)    TP/TP+FP                       Nega<ve  predic<ve  value  =  79.0432%  (how  good  is  predic<ng  malware)  TN/TN+FN  
  
· F1  score  =  f(precision,  recall)  =  93.5042%  
  
·    For   us   it   is   a   good   result   as   a   complementary   method   to   rank   apps,      especially,   when   you   try   detecRng   malware   in   a   huge   dataset,   as   the   real  
world,  and  you  do  not  know  how  to  prioriRze  apps.  

elevenpaths.com  

39  

  

05 What  will  happen  if  we  use  more  features  and   specific  categories  (granularity)?         · For  some  categories  the  results  are  be_er  than  the  "global"  classificaRon  (previous).  
Some  examples  will  be  showed  later!   · For  some  categories  the  results  are  worse  than  the  "global"  classificaRon  
· There  aren't  enough  samples  to  train/test...  is  a  problem!  How  to  solve  it?   · A  good  balance  between  general  &  specific  dataset  it  is  necessary  to  get  an  accuracy  classifier.  

General  Dataset  

The  same  features  for  goodware/malware  dataset  

Specific  dataset  (Category)  

Features  

Features  based  on  permissions     &  general  dataset  

Classifier  

Features  based  on  permissions     &  Specific  dataset  

Features  

Bad  accuracy!!!   GOOD  <  BETTER  

Meta--info  features  &  general  dataset  

Meta--info  features  &  Specific  dataset  

elevenpaths.com  

40  

  

05 How  to  improve  the  classifier...  

· We  are  searching  for  new  features...     
· We  will  be  honest,  the  classifier  is  good  but...  I  would  like  to  improve   the  results  analysing  code...  some<mes  is  the  only  way  to  detect   malicious  code  with  high  accuracy.      · But...  analysing  code  is  a  slow  process!!!  
· Are  there  any  soluRons  to  analyse  code  quickly  without  reverse   engineering?  

· Could  it  be  possible  to  add  this  kind  of  soluRons  as  new  features  to  our   classifier?         Crazy  idea?  

· Why  not  detec<ng  paBerns  analysing  .DEX  files  and  Android   bytecodes  (opcodes)  directly?  

  

elev  enpaths.com  

  

41  

06
Machine Learning and Android bytecodes

Analyzing code without "reverse engineering or code execution"
(Research in progress)

elevenpaths.com  

elevenpaths.com  

  

42  

  

06 Analyzing  DEX  (Dalvik--bytecode)...  
For  the  same  datasets  (goodware/malware)  used  "before"...  
Example:  NOP  0x00h,  ADD  0x90h,...  

elevenpaths.com     

OPCODES  table:  h_ps://imgur.com/a/N5bqg#0  
43  

06 Analyzing  DEX  (Dalvik--bytecode)...  
For  the  same  datasets  (goodware/malware)  used  "before"...  

· Why  these  features?  Intui<ons  &  "some"  previous  researches...  

Jerome,  Q.  Allix,  K.  ;  State,  R.  ;  Engel,  T.   Interdiscipl.  Center  for  Security  Reliability  &  Trust,   Univ.  of  Luxembourg,    

· We  collect  new  features  per  each  app:  
· N--gram  opcodes  (is  a  conRguous  sequence  of  n  opcodes  in  each  .dex  file)   · Number  of  Opcodes  (number  of  instrucRons)   · Size  of  code  secRon   · %  per  each  type  of  Opcode   · %  per  each  instrucRon  format  (30  formats)  
· h_ps://source.android.com/devices/tech/dalvik/dalvik--bytecode.html  
· %  per  groups  of  instrucRons  (13  formats)  
· CondiRonal,  transfer,  flow,  arithmeRc,  moves,  literals...  
· Entropy  and  Entropy  per  "blocks  of  N  instrucRons"  
  
· Does  Malware  have  less  code?  Is  it  obfuscated?  Opcodes  pa_ern  helps   to  disRnguish  malware?  Developer's  programming  style?  

   elevenpaths.com  

44  

  

06 Classifying  using  Opcodes...  
For  the  same  datasets  (goodware/malware)  used  "before"...  

· These   new   features   do   not   classify   malware   be_er   than   our   previously   used   meta--info   features   (permissions,   size,   descripRon,   cerRficate...)   but,   both  combined  per  category  they  do!!!  

· Category   classifica<on   (metainfo   features   +   opcodes   features):   We   improve   the   previous   results   with   opcodes   pa_erns   (we   have   again   problems  with  some  categories  if  there  are  not  "enough"  samples)  
  

Dataset   General  
  

Specific  

Features  

Meta--info     features  

Meta--info  features     +  Features  based  on  opcodes  

Classifier  

elevenpaths.com     

GOOD.........  <  BETTER  <  MUCH  BETTER  
45  

06 Category  classifica<on...  
Metainfo  features  +  Features  based  on  opcodes...  

· We  are  geong  a  very  good  results  per  category...  

· Example:  BOOK_AND_REFERENCE  category    

(Remember:  with  features  based  on  permissions  only  à  Accuracy=77.74%  (for  this  category)  

  
"Global  C   lassifica<on  Features  based  on  

Features  based  on  META--INFO  

h_ps://en.wikipedia.org/wiki/F1_score  
META--INFO  +  OPCODES  PATTERN  

META--INFO  

BOOK_AND_REFERENCE  

Categ:  BOOK_AND_REFERENCE  

Accuracy  =  91.015555%  

Accuracy  =  96.26  %  

Accuracy  =  97.06  %  

Recall  =  90.2507%  (true  posiRve  rate)   [true  negaRve  rate  =  92.9468%]  
Precision  =  97%  (posiRve  predicRve  value)   [negaRve  predicRve  value  =  79.0432%]  
F1  score  =  93.50%  

Recall  =  96.0937%  (tpr)   [tnr  =  96.6386%]  
Precision  =  98.4%  (ppv)   (npv  =  92%)  
F1  score  =  97.2321%  

Recall  =  96.8627%  (tpr)   [tnr=  97.5%]  
Precision  =  98.8%  (ppv)   (npv=93.6%)  
F1  score  =  97.8217%  

· We   proved,   with   different   categories/datasets,   that   is   possible   to   improve   the   classificaRon   results   with   opcodes...   It   is   difficult   to   improve  more  by  category  :D  
  

elevenpaths.com  

46  

  

07
Conclusions
elevenpaths.com     

07 Conclusions  
· Analyzing  mobile  malware  is  expensive.  With  3k--5k  new  apps  uploaded   daily,   it   may   be   a   good   idea   to   priorize   efforts   filtering   by   suspicious   apps   first  before  deep  analysis.  
  
· Classifying   apps   without   recurring   to   tradiRonal   ways,   is   usually   based   on   characterisRcs   of   the   app   and   Machine   Learning   classificaRon.   But   this   strongly  depends  on:  
  
· The  malware/goodware  set  you  choose,  because:  
· You  may  have  a  "not  big  enough"  set.   · Not  big  enough  set  of  characterisRcs  so  the  apps  in  the  set  are  properly  "profiled".   · Not  being  very  good  at  determining  which  is  malware  or  not  (VT  dependency).  
· And  what  "features"  you  chose  to  define  an  app...   · And  what  you  consider  as  an  "app"  (take  advantage  of  its  circumstances)  
  
· We  discover  a  lot  of  features  (meta--info  and  opcodes  features)  useful  to   classify   adware/malware   and   goodware.   We   have   a   good   detector,   not   relying  on  code,  that  offers  accurate  and  high  performance  results.  

   elevenpaths.com  

48  

  

Opcodes in Google Play
Tracing malicious Applications
Speakers
Alfonso Muñoz, PhD (@mindcrypt)
Senior Cybersecurity Researcher ­ alfonso.munoz@11paths.com
Sergio de los Santos (@ssantosv)
Head of Lab in ElevenPaths - ssantos@11paths
elevenpaths.com     

