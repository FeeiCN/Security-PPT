Copyright  ©  2015  Splunk  Inc.  
GeBng  Started  with   Splunk  MINT  
Panos  Papadopoulos  
Director,  Product  Management,  Splunk  

Mobile  App  
Datacenter  
2  

Mobile  Network  

The  Challenges  of  Delivering  Mobile  Apps  

Form  Factor,  Pla,orm,   Interac0on  Style   Variety  

Rapid  App  Dev  Cycles,   Break--Fix  Needs  
· New  OS  versions   break  apps  
· Network  issues  are   difficult  to  find  and  
simulate     
· Limited  Mme  to  make   changes  and  fixes  

Infrastructure  
· Plan  for  growth   · Solve  infrastructure,  
API  and  app  issues  

Analy0cs  
· Feature  usage   · Monitor/analyze  
user  behavior   · Deliver  omni--channel  
analyMcs   · Mobile+Web+Desktop  

3  

Mobile  App  Delivery:  Different  Challenges  for  Different  Roles  

MOBILE  APP     DEVELOPERS  

· How  do  I  find  the  root  cause  of  app  crashes  and/or  poor  performance?   · What  were  users  doing  when  the  issue  happened?   · How  do  I  get  more  insight  into  transacMon  paths?  

APP  MANAGERS  /   OPERATIONS  

· Is  the  problem  with  the  app,  the  network  or  the  back  end  system?   · Do  I  have  the  right  capacity  in  place  to  handle  transacMon  volume?   · How  does  performance  compare  mobile  vs.  web  vs.  desktop?  

PRODUCT  MANAGERS  /   BUSINESS  OWNERS  

· How  are  customers  using  my  app?   · Which  features  should  I  prioriMze  for  future  versions?   · How  does  customer  behavior  compare  across  channels?  

4  

Extending  OperaMonal  Intelligence  to  Mobile  Apps  

Mobile  End  User   Monitoring  

End--to--End   Performance  
5  

Deliver  Real--Time   Omni--Channel   AnalyMcs  

Copyright  ©  2015  Splunk  Inc.  
GeBng  Started  

GeBng  Started  with  Splunk  MINT  
Mobile  Developers  

Sign  up  on     mint.splunk.com  

Download  SDKs  

Re--deploy  Splunk  MINT  

and  create  mobile  projects  

enabled  apps  

Splunk  Admin  

Check  Splunk  MINT   Management  console  
  

Download  Splunk   Enterprise  

Download  the  Splunk   MINT  App  
7  

Run  Wizard  to  connect   to  the  Splunk  MINT     Data  Collector  

Get  dashboards  and   search,  correlate  

Create  a  New  Project  at  mint.splunk.com  
8  

Copyright  ©  2015  Splunk  Inc.  
SDK  ConfiguraMon  

SKD  IniMalizaMon  

Android   Mint.initAndStartSession(Context,  "APIKEY");  

iOS  

[[Mint  sharedInstance]  initAndStartSession@"API_KEY"];  

This  single  line  of  code  will  offer  you  the  following:   · Usage  analyMcs   · Crash  reporMng   · Network  monitoring  

10  

Further  SKD  InstrumentaMon  

TransacMons  

Android   iOS  

Mint.transacMonStart("userLogin");  //start  transacMon   Mint.transacMonStop("userLogin");  //successfully  end  transacMon   Mint.transacMonCancel("userLogin",  "user  pressed  back");  //cancel  transacMon  with  a  reason  
[[Mint  sharedInstance]  transacMonStart:@"userLogin"  andResultBlock:nil];   [[Mint  sharedInstance]  transacMonStop:@"userLogin"  andResultBlock:nil];   [[Mint  sharedInstance]  transacMonCancel:@"userLogin"  reason:@"user  pressed  back"   andResultBlock:nil];  

Events   Android   iOS  

Mint.sendEvent("bunon1pressed");   [[Mint  sharedInstance]  logEventAsyncWithTag:@"bunon1pressed"  compleMonBlock:nil];  

11  

Copyright  ©  2015  Splunk  Inc.  
Architecture  &   InstallaMon  

Splunk  MINT  Architecture  
Splunk  MINT  Management  Console  

Mobile  Apps  with   Splunk  MINT  SDKs  

Splunk  MINT   Data  Collector  
Splunk  MINT  AddOn   Splunk  MINT  App  
13  

Splunk  MINT  Management  Console  
· The  go  to  for  your  Mobile   Developers  
· Fast  on  boarding   · "Light  weight"  dashboards  
to  get  you  started.   · Good--enough  for  some  
teams  &  mobile  devs  
14  

Install  the  MINT  App  
..in  a  distributed  Splunk  Environment  
· You  need  to  have  a  valid  MINT  license  installed.   · Aqer  the  license  is  installed  the  app  will  configure  itself  &  fetch  private  
SSL  cerMficates  for  secure  communicaMon  with  the  MINT  Data  Collector   · The  First  Time  Run  wizard  will  present  two  opMons:  
­ Single  instance,  just  click  conMnue,  wait  for  acceleraMon   ­ Distributed  environment:  
ê Deploy  the  MINT  TA  in  indexers   ê Copy  local.conf  &  certs   ê Wait  for  the  MINT  data  model  to  be  accelerated  everywhere  
15  

Create  a  MINT  Project  
Grouping  or  separaMng  mobile  apps  
Customers  may  want  to  view  data  just   for  an  app.   Example:  How  many  users  do  our  iOS   banking  app  have?      Or  they  can  group  together  all  apps   Example:  How  many  users  do  our   mobile  consumer  banking  apps  have   across  iOS,  Android  and  WP?     
Project  !=  App  
16  

Explain  the  MINT  Data  Model  

· 13  data  models  

· 30  days  acceleraMon  

· Dashboards  use  data  model  

Beware  

(therefore  acceleraMon  needs   to  be  completed!)  

17  

MINT  Sourcetypes  
· MINT  source  types:  
­ mint:ping   ­ mint:gnip   ­ mint:trstart   ­ mint:trstop   ­ mint:event   ­ mint:error   ­ mint:network   ­ mint:log   ­ mint:view  
18  

Copyright  ©  2015  Splunk  Inc.  
Dashboards  

User  AnalyMcs  
Understand  How  Your  Users  Use  Your  Mobile  App  
· How  many  users  do  I   have?  
· How  many  sessions  do   they  do?  
· How  many  have  crashes?   · How  oqen  does  my  app  
crash?   · How  much  Mme  is  spent  in  
my  app?  
20  

Network  Monitoring  
Understand  How  Your  Network  Affects  Your  Mobile  App  
· What  services  does  my   app  use?  
· What  is  the  availability  of   different  APIs?  
· What  is  the  latency?   · What  is  the  error  rate?   · Analyze  by  locaMon,  
connecMon,  network  
21  

LocaMon  &  Network  performance  
Understand  the  User  Experience  by  LocaMon  
· What  is  the  user  latency  by   service  &  Mme  of  network  in   different  countries?  
· Should  I  invest  in  new   datacenters?  
· Should  I  invest  in  local  CDN?  
22  

Crash  ReporMng  
What  Crashes  are  EffecMng  My  User  Base  
· See  the  complete  stack   trace  of  the  errors  that   affect  your  app  
· Get  per  error  metrics  on   impact  on  user  base  &   trends.  
· Jump  from  aggregated  to   raw  search  
· SymbolicaMon  
23  

View  Tracking  
What  are  My  Most  Used  Features  
· What  are  the  views   (screens/pages)  that  are   used  the  most?  
· What  is  the  rendering   Mme?  
· What  other  events   happen  within  a  view?  
24  

TransacMon  Monitoring  
Monitor  the  Business  Base  Line  of  Your  Apps  
· Monitor  and  analyze  criMcal   business  transacMons     
· Understand  user  acMvity  by   monitoring  specific  events   and  transacMons     
· Understand  impact  on   business  
25  

Copyright  ©  2015  Splunk  Inc.  
Use  Cases  

Achieve  End--to--End  Visibility  
Use  CorrelaMons  to  Get  Comprehensive  Insights  
Correlate  Splunk  MINT  data  with   other  OperaMonal  Intelligence  for   end--to--end  transacMon  analysis      Use  Splunk  Enterprise  search   capabiliMes  to  correlate  and  drill   down  into  your  mobile  and  non-- mobile  data       
27  

Personalized  AnalyMcs  
Augment  MINT  Data  with  SQL  Data  Thanks  to  DBConnect  
· Augment  machine  data   with  PII  informaMon  
· Create  personalized   reports  
· Rich  analyMcs   · Monitor  usage/issues  per  
named  user   · All  in  your  datacenter  
28  

More  than  ApplicaMon  Metrics  
Use  the  Splunk  MINT  SDKs  to  Collect  Metrics  
· Use  the  MINT  SDKs  to   capture  data  from  phone   sensors  &  connected   devices  eg  iBeacon,  ODB2,   wearables.  
· Create  customized   dashboards  
29  

Support  
Provide  Full  End--User  Visibility  to  Support  Agents  
· Create  customized   dashboards  for  Support   agents  
· Last  user  acMons   · User  anributes  (device,  OS,  
app  version,  network,   language)   · Achieve  360  overview  
30  

Copyright  ©  2015  Splunk  Inc.  
Sum  Up  

MINT  Benefits  Developers  and  the  Business  

MOBILE  APP     DEVELOPERS  

· Immediate  quality  insights   · User,  usage,  transacMon,  network  visibility   · Fast  Mme--to--value  with  lightweight  SDK  

APP  MANAGERS/   OPERATIONS  

· Find  bonlenecks  across  app,  network,  backend,  APIs   · Right  size  capacity  for  transacMon  volumes   · Ensure  performance  across  all  channels  

PRODUCT  MANAGERS/   BUSINESS  OWNERS  

· User  behavior,  user  experience  insights   · Faster,  more  valuable  improvements   · Omni--channel  analyMcs  

32  

THANK  YOU  

