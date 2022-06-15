Copyright  ©  2015  Splunk  Inc.  
Supercharge  Your   Mobile  App  Delivery   With  Splunk  MINT  
Kostas  Polychronis  
Head  of  Mobile  MINT,  Splunk  

Disclaimer  
During  the  course  of  this  presentaKon,  we  may  make  forward  looking  statements  regarding  future   events  or  the  expected  performance  of  the  company.  We  cauKon  you  that  such  statements  reflect  our   current  expectaKons  and  esKmates  based  on  factors  currently  known  to  us  and  that  actual  events  or   results  could  differ  materially.  For  important  factors  that  may  cause  actual  results  to  differ  from  those  
contained  in  our  forward--looking  statements,  please  review  our  filings  with  the  SEC.  The  forward-- looking  statements  made  in  the  this  presentaKon  are  being  made  as  of  the  Kme  and  date  of  its  live   presentaKon.  If  reviewed  aTer  its  live  presentaKon,  this  presentaKon  may  not  contain  current  or   accurate  informaKon.  We  do  not  assume  any  obligaKon  to  update  any  forward  looking  statements  we  
may  make.       
In  addiKon,  any  informaKon  about  our  roadmap  outlines  our  general  product  direcKon  and  is  subject  to   change  at  any  Kme  without  noKce.  It  is  for  informaKonal  purposes  only  and  shall  not,  be  incorporated   into  any  contract  or  other  commitment.  Splunk  undertakes  no  obligaKon  either  to  develop  the  features  
or  funcKonality  described  or  to  include  any  such  feature  or  funcKonality  in  a  future  release.  
2  

A  LiWle  Bit  of  History  

"How  the  hell  did  that  happen?"    
--  Random  Mobile  Developer  
4  

BugSense  it  was...  
We  love  developers  and  developers  love  us  back!  
· 12  Person  company   · Based  in  Greece   · $100k  Seed  investment   · SupporKng  Android,  iOS,  HTML5,  
WP7,  WP8,  Windows  8,  Xamarin   · Running  on  hundreds  of  millions  
of  devices,  probably  including   yours  J  
5  

Splunk  MINT  it  Became!  
September  16,  2013  --  Splunk  acquired  BugSense  
· Team  moved  to  Splunk's  HQ   · New  product  line   · Combine  BugSense's  data  
collecKon  with  Splunk's   capabiliKes  
6  

Splunk  MINT  it  Became!  
September  16,  2013  --  Splunk  acquired  BugSense  
· Team  moved  to  Splunk's  HQ   · New  product  line   · Combine  BugSense's  data  
collecKon  with  Splunk's   capabiliKes  
One  objecKve:  Get  mobile  data  into  Splunk!  
7  

Splunk  MINT  
+  
Can  you  imagine  the  possibiliKes?  
8  

Splunk  MINT  Product  Update  

BugSense  
A  Splunk  Company  
· Cloud--only   · Crash  detecKon,  usage  
insights  and  retenKon   informaKon   · Not  integrated  with   Splunk  Enterprise  

· Splunk  MINT  Express:   adds  transacKons  and   network  performance  
· Splunk  MINT  Enterprise:   connects  to  Splunk   Enterprise,  more   features  and  analyKcs  
· Correlates   infrastructure,   applicaKon  and  mobile   data  in  Splunk  Enterprise  
9  

Introducing   Splunk  MINT  

What  is  a  Splunk  MINT?    
"An  awesome  technology  that  helps  you   gain  insights  about  your  mobile  applicaKon."    
11  

12  

13  

14  

How  to  Use  It  
Sign  up  and  download  the  SDK   Copy  the  file  to  your  project   Use  1  line  of  code  
Start  collecKng  data!  
15  

Good  Old  FuncKonality  
SKll  There!  
16  

Crash  ReporKng  
· Track  your  crashes  automaKcally  in  real  Kme.   · One  line  of  code!   · That's  it!  J  

Android   Mint.initAndStartSession(Context,  "APIKEY");  

iOS  

[[Mint  sharedInstance]  initAndStartSession@"API_KEY"];  

17  

Crash  ReporKng  +  Insights  
Track  your  crashes  automaKcally  in  real  Kme.   One  line  of  code!      Full  analyKcs  and  reports   Mobdex  Score      REAL  TIME  ANALYTICS   WITH  ONLY  ONE  LINE  OF  CODE!  

Android   --  

iOS  

--  

18  

Log  Handled  ExcepKons  
What  about  Handled  ExcepKons?   We  can  report  them  as  well!  

Android   iOS  

try{       String  a  =  null;       a.toString();   }  catch(ExcepKon  ex)  {       ex.printStackTrace();  //  in  case  you  want  to  see  the  stacktrace  in  your  log  cat  output       Mint.sendExcepKon(ex);  //OR       Mint.sendExcepKonMessage("level",  "2",  ex);   }  
MintLogExcepKon(NSExcepKon,  LimitedCrashExtraDataList)  //  More  in  our  website  

19  

Crash  Extra  Data*  
We  offer  the  ability  to  get  more  informaKon  on  your  crashes  and   add  your  custom  data.  

*  With  a  small  tweak  in  the  new  version  

Android   iOS  

Mint.addCrashExtraData("level","2");  
[[Mint  sharedInstance]  addCrashExtraData:[[CrashExtraData  alloc]  initWithKey:@"level"   andValue:@"2"]];  

20  

Breadcrumbs  
Show  me  the  path  of  the  user   through  the  applicaKon.  

Android   Mint.leaveBreadcrumb("Login  Screen");  

iOS  

[[Mint  sharedInstance]  leaveBreadcrumb:@"Login  Screen"];  

21  

User  IdenKfier  
You  are  able  to  locate  exisKng   users  in  MINT  using  name,  email,   server  ID,  etc.        Find  everything  that  the  specific   user  experienced.  

Android   Mint.setUserIdenKfier("kp@splunk.com");  

iOS  

[Mint  sharedInstance].userIdenKfier  =  @"kp@splunk.com";  

22  

Logcat  /  Apple  Logging  System  Support  

Lots  of  important  informaKon  is  included  in  the  logcat   output.  Check  there  for  all  your  crashes.  
  
· Print  messages  to  the  console  using  the  ALS  (Apple   Logging  System)    
· In  debug  mode  all  the  messages  will  be  printed  in  the   console  window    
· In  release  mode  only  NoKce  messages  and  above  will  be   printed  in  the  device  log,  while  all  your  messages  will   forwarded  to  Splunk  server  

Android   iOS  

Mint.setLogging(true);   Mint.setLogging(lines,  filter);  
[[Mint  sharedInstance]  enableLogging:YES];   MintLog(DebugLogLevel,  @"%@",  @"A  debug  log");  

23  

Last  Breath  

You  can  do  important  things  when  you  know  the  applicaKon  will   crash...before  it  crashes!  

Android   iOS  

public  class  MainAcKvity  extends  AcKvity  implements  ExcepKonCallback  {   }      @Override   public  void  lastBreath(ExcepKon  ex)  {   //do  or  save  stuff  here   }      BugSenseHandler.setExcepKonCallback(this);  
Due  to  pla~orm  nature  and  restricKons  this  feature  is  not  supported    

24  

Events  
Get  informed  about  anything  users  are  doing  in  your  mobile   applicaKon  with  events!  

Android   Mint.logEvent("buWon1pressed");  

iOS  

[[Mint  sharedInstance]  logEventAsyncWithTag:@"buWon1pressed"  compleKonBlock:nil];  

25  

New  Features  

Splunk  MINT  Data  Types  

Crashes   Errors  

Sessions   Events  

Crashes  

Sessions  

Errors  

Events  

Network  

TransacKons  

SemanKc  Logs  

LocaKon  

Tons  of  metadata  

27  

Global  Extra  Data  
Add  extra  data  to  all  your  acKons  to  get  beWer  informaKon.  

Android   iOS  

Mint.addExtraData("level","2");   //or   Map<String,  String>  map  =  new  HashMap<String,String>();   map.put("level","2");   Map.put("character","warrior");   Mint.addExtraData(map);  
[[Mint  sharedInstance]  addCrashExtraData:[[CrashExtraData  alloc]  initWithKey:@"level"   andValue:@"2"]];  

28  

Advanced  Events  
Get  informed  about  anything  users  are  doing  in  your  mobile   applicaKon  with  events!        Break  down  events  by  app  version,  OS  version,  see  the  trend   and  stats.  

Android   Mint.logEvent("buWon1pressed");  

iOS  

[[Mint  sharedInstance]  logEventAsyncWithTag:@"buWon1pressed"  compleKonBlock:nil];  

29  

TransacKons  
A  transacKon  is  used  to  monitor  criKcal  funcKonality  in  your  app   like  a  purchase.  It  is  basically  an  event  with  a  start  and  finish.  

Android   iOS  

Mint.transacKonStart("userLogin");  //start  transacKon   Mint.transacKonStop("userLogin");  //successfully  end  transacKon   Mint.transacKonCancel("userLogin",  "user  pressed  back");  //cancel  transacKon  with  a  reason  
[[Mint  sharedInstance]  transacKonStart:@"userLogin"  andResultBlock:nil];   [[Mint  sharedInstance]  transacKonStop:@"userLogin"  andResultBlock:nil];   [[Mint  sharedInstance]  transacKonCancel:@"userLogin"  reason:@"user  pressed  back"   andResultBlock:nil];  

30  

Developer  Se·ngs  
What  if  you  could  change  your  variables  remotely?      Set  the  difficulty  of  your  game  at  Mint,  retrieve  the  variable  when   the  app  starts.  

Android   int  level  =  Integer.parseInt(Mint.getDevSe·ngs("level"));  

iOS  

[[MINT  sharedInstance]  getDevSe·ngs@"level"];  

31  

CollecKng  Data  from  Hybrid  Apps  
SupporKng  web  components   Collect  crashes,  errors,  events  and  transacKons  from  hybrid  apps.      Watch  the  Collec:ng  Data  From  Hybrid  Applica:ons   presentaKon.  

Android   MINTWebView  webView  =  (MINTWebView)  findViewbyId(R.id.webview);  

iOS  

MintUIWebView  *webView  =  [[MintUIWebView  alloc]  init];  

32  

Network  Monitoring  
AutomaKcally  keep  track  of  all  your   applicaKon's  network  requests!  

Android   --  

iOS  

--  

33  

Everything  Available  on  Splunk  
You  have  raw  access  to  all  the  data  through  Splunk,  you  can  create   your  own  dashboards  and  alerts.  
34  

"Everything  looks  cool,     can  I  have  a  real  example?"    
--  Random  .conf  aWendee  
35  

"Of  course,  Sir!"    
--  Kostas  Polychronis  
36  

Live  Demo  

THANK  YOU  

