Seven  Ways  to     Hang    Yourself  with    
Google  Android  

Yekaterina Tsipenyuk O'Neil Principal Security Researcher

Erika Chin Ph.D. Student at UC Berkeley

§ Founding  Member  of  the  Security  Research   Group  at  For@fy  (now  an  HP  Company)  
§ Code  audits,  iden@fying  insecure  coding   paFerns,    and  providing  security  content  for   For@fy's  soHware  security  products  
§ B.S.  and  M.S.  in  CS  from  UC  San  Diego   § Thesis    focused  on  mobile  agent  security  
2  

§ Ph.D.  student  in  Computer  Science  at  UC   Berkeley  (Security  research  group)  
§ B.S.  from  University  of  Virginia   § Research  interest  in  improving  mobile  phone  
security   § Recently  presented  at  MobiSys  2011  on  
vulnerabili@es  stemming  from  inter-- applica@on  communica@on  in  Android  

§ Introduc@on  to  Google  Android     § Seven  Ways  to  Hang  Yourself   § Results  of  Empirical  Analysis   § Conclusion  
4  

Introduc)on  to    
GOOGLE  ANDROID  

§ Android  architecture   § Security  model   § Applica@on  breakdown   § Android  manifest   § Inter--component  communica@on  
6  

Higher  
§ Applica@ons   § Applica@on  framework  (SDK)   § Dalvik  virtual  machine  
­ Customized  bytecode  (.dex  files)  
§ Na@ve  libraries  
­ Graphics,  database  management,  browser,  etc.   ­ Accessed  through  Java  interfaces  
§ Linux  kernel  
­ Device  drivers,  memory  management,  etc.  
Lower    
7  

§ Applica@ons  have  unique  UIDs  
­ Run  as  separate  processes  on  separate  VMs   ­ Typically  cannot  read  each  other's  data  and  code  
§ Linux--style  file  permissions   § Android  permissions  protect  
­ Access  to  sensi@ve  APIs   ­ Access  to  content  providers   ­ Inter--  and  intra--applica@on  communica@on  
8  

§ Applica@ons  are  divided  into  components   § 4  types  of  components  
­ Ac@vi@es   ­ Services   ­ Broadcast  Receivers   ­ Content  Providers    

Each  applica@on  contains  a  manifest  
<manifest ...> <application> <activity android:name=".MyActivity">...</activity> <receiver android:name=".MyReceiver">...</receiver> </application>
<uses-sdk android:minSdkVersion="8" /> <uses-feature android:name="android.hardware.CAMERA"/>
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.CAMERA" />
<permission android:name="com.emc.NewPermission" /> </manifest>
10  

§ Uses  Intents  (messages)   § Intents  can  be  sent  between  components  
­ Used  for  both  intra--  and  inter--applica@on   communica@on  
­ Event  no@fica@ons  (including  system  events)    

Sender  

Intent   11  

Receiver  

§ Exact  recipient  is  specified  

Yelp  

Name:  MapAc@vity  
Map   App  

To:  MapAc@vity  
Only  the  specified  des@na@on  receives  this  message   12  

§ LeH  up  to  the  plaeorm  to  decide  where  it   should  be  delivered  
Handles  Ac@on:  VIEW  
Map   App  
Yelp  

Implicit  Intent   Ac@on:  VIEW  
13  

Clock   App  

Yelp  
Implicit  Intent   Ac@on:  VIEW  

Handles  Ac@on:  VIEW  
Map   App  
Handles  Ac@on:  VIEW  
Browser   App  
14  

§ Components  can  be  made  accessible  to  other   applica@ons  (exported)  or  be  made  private  
§ Components  can  be  protected  by  permissions  
15  

App  1   Has  RETRIEVE  Permission  
Displays  Picture  

App  2  
Retrieves  Picture     
Requires  RETRIEVE   Permission  
Takes  Picture     
Requires  CAMERA   Permission  
16  

Seven  Ways  to  Hang  Yourself  with  
GOOGLE  ANDROID  

1. Intent  Spoofing   2. Query  String  Injec@on   3. Unauthorized  Intent  Receipt   4. Persistent  Messages:  S@cky  Broadcasts      5. Insecure  Storage   6. Insecure  Communica@on   7. Overprivileged  Applica@ons  

§ AFack:  Malicious  app  sends  an  Intent,   resul@ng  in  data  injec@on/state  change  
§ Arises  when  components  are  public  and  do   not  require  senders  to  have  strong   permissions  
<  receiver android:name="my.special.receiver">
<intent-filter> <action android:name="my.intent.action" />
</intent-filter> </receiver>

Malicious   Injec)on  App  
Malicious   Component  

IMDb  App   Handles  Ac@on:   willUpdateShow?mes,   show?mesNoLoca?onError  
Results  UI  

Ac@on:   show?mesNoLoca?onError     
  Receiving  Implicit  Intents  makes  the  component  public   20  

Typical  case  

21   AFack  case  

<receiver android:name="my.special.receiver" android:exported=false>
... </receiver>
or  
<receiver android:name="my.special.receiver" android:exported=true android:permission="my.own.permission">
... </receiver>

§ Unlike  SQL  injec@on,  SQLite  string  injec@on   allows  malicious  users  to  view  unauthorized   records,  but  not  to  alter  the  database  
§ Query  string  injec@on  occurs  when:  
1. Data  enters  a  program  from  an  untrusted  source   2. The  data  is  used  to  dynamically  construct  a  
SQLite  query  string  

c = invoicesDB.query( Uri.parse(invoices), columns, "productCategory = '" + productCategory + "' and customerID = '" + customerID + "'", null, null, null, "'" + sortColumn + "'asc", null
);

productCategory  =  "Fax  Machines"   customerID  =  "12345678"   sortColumn    =  "price"  
select * from invoices where productCategory = 'Fax Machines' and customerID = '12345678' order by 'price' asc
Returns  invoice  records  for  ONE  customer  

productCategory  =  "Fax  Machines'  or  productCategory  =  \  ""   customerID  =  "12345678"   sortColumn    =  "\"  order  by  `price"  
select * from invoices where productCategory = `Fax Machines' or productCategory = "' and customerID = '12345678' order by '" order by 'price' asc
Returns  invoice  records  for  ALL  customers  

Use  parameterized  queries!!!  
c = invoicesDB.query( Uri.parse(invoices), columns, "productCategory = ? and customerID = ?", {productCategory, customerID}, null, null, "'" sortColumn + "'asc", null
);

§ AFack:  Malicious  app  intercepts  an  Intent   § Arises  when  Intents  are  implicit  (public)  and  
do  not  require  receiving  components  to  have   strong  permissions   § Can  leak  sensi@ve  program  data  and/or   change  control  flow  
Intent i = new Intent(); i.setAction("my.special.action"); [startActivity|sendBroadcast|startService](i);

IMDb  App  
Show@me   Search  
Implicit  Intent   Ac@on:   willUpdateShow?mes  

Handles  Ac@ons:   willUpdateShow?mes,   show?mesNoLoca?onError  
Results  UI  
29  

30  

IMDb  App  
Show@me   Search  
Implicit  Intent   Ac@on:   willUpdateShow?mes  

Handles  Ac@ons:   willUpdateShow?mes,   show?mesNoLoca?onError  
Results  UI  
31  

IMDb  App  
Show@me   Search  

Eavesdropping  App   Handles  Ac@on:   willUpdateShow?mes,   show?mesNoLoca?onError  
Malicious   Receiver  

Implicit  Intent   Ac@on:   willUpdateShow?mes  
32  
                                  Sending  Implicit  Intents  makes  communica@on  public  

Intent i = new Intent(); i.setClassName("some.pkg.name",
"some.pkg.name.TestDestination");
or  
Intent i = new Intent(); i.setAction("my.special.action"); sendBroadcast(i, "my.special.permission");

§ Broadcast  Intent  
­ One--to--many  message   ­ Delivered  to  all  components  registered  to  receive  
them  
§ "S@cky"  Broadcast  Intents  are  broadcasts  that   persist  
­ Remain  accessible  aHer  they  are  delivered   ­ Re--broadcast  to  future  Receivers    
  

§ Cannot  be  restricted  to  a  certain  set  of   receivers  (cannot  require  a  receiver  to  have  a   permission)  
§ Accessible  to  any  receiver,  including  malicious   receivers  
§ Can  compromise  sensi@ve  program  data   § Stays  around  aHer  it  has  been  sent  
­ But  anyone  with  BROADCAST_STICKY  permission   can  remove  a  s@cky  Intent  you  create  

S@cky  broadcasts:   S@cky  broadcast  1  

Malicious  App  
Requests  BROADCAST_STICKY   Permission  

Vic@m  app  

S@cky  broadcast  2   S@cky  broadcast  3  

Receiver   (expects  s@cky   broadcast  2)  
?  

36  
                                Newly  connected  receiver  will  be  unaware  of  the  change  

§ Use  regular  broadcasts  protected  by  the   receiver  permission  instead,  if  possible  
§ Thoroughly  scru@nize  data  in  broadcasted   messages  
  

§ Files  on  the  SD  Card  are  world--readable   § Files  stay  even  aHer  applica@on  that  wrote  
them  is  uninstalled   § Can  compromise  sensi@ve  program  data  
­ Passwords   ­ Loca@on   ­ SMS   ­ Etc.  

§ Skype  for  Android  exposes  your  name,  phone   number,  chat  logs  and  more    
§ Ci@bank  iPhone  app  "accidentally"  saved   account  numbers,  bill  payments  and  security   access  codes  in  a  secret  file    
§ iPhone  loca@on  file  contains  informa@on   about  your  loca@on  

§ Write  to  an  applica@on's  SQLite  database   § Write  to  the  device's  internal  storage  and  use  
Context.MODE_PRIVATE  

§ Be  careful  of  leaking  sensi@ve  data  through   HTTP  connec@ons  
§ When  using  WebViews,  connect  to  HTTPS   when  possible  
§ Treat  your  mobile  app  as  you  would  a  web   app  
§ Don't  send  passwords  in  the  clear  

§ TwiFer:    Tweets  are  sent  in  the  clear   § Google  Calendar:  Calendar  traffic  is  sent  in  the  
clear   § Facebook:    Despite  having  a  fully  encrypted  
traffic  op@on  on  the  web  app,  the  mobile  app   sends  everything  in  the  clear  
Courtesy:  hFps://freedom--to--@nker.com/blog/dwallach/things--overheard--wifi--my--android--smartphone  

§ Overprivileged  applica@ons  ­  applica@ons  that   request  more  permissions  than  the  app   actually  requires  

§ Violates  the  principle  of  least  privilege   § Any  vulnerability  may  give  the  aFacker  that  
privilege   § Users  may  get  accustomed  to  seeing  and  
accep@ng  unnecessary  permission  requests   from  third  party  applica@ons  

§ Common  causes  
­ Confusing  permission  names   ­ Tes@ng  ar@facts   ­ Using  depu@es   ­ Error  propaga@on  through  message  board  advice   ­ Related  methods  

App  1     Do  not  need  CAMERA   permission  
Wants  Picture  

Camera  App   Needs  CAMERA   permission  
Takes   Picture  

Implicit  Intent   Ac@on:  IMAGE_CAPTURE  

Handles  Ac@on:     IMAGE_CAPTURE  

46  

Empirical  Results  Analyzing   Applica)ons  Built  on  
GOOGLE  ANDROID  

   Vulnerability  Type      Intent  Spoofing      Unauthorized  Intent  Receipt  
Overprivileged  Applica@ons  

%  of  Apps  that  are  Vulnerable  
40%   50%   31%  

§ Obtaining  applica@on  source  code  
­ Dedexers  available  fail  to  generate  valid  Java   ­ Many  applica@ons  are  not  open  source  
§ Coding  conven@ons  
­ Callbacks  and  other  implicit  control  flow  are  a   challenge  for  tradi@onal  sta@c  analysis  techniques  
§ Documenta@on  
­ Google  provides  liFle  documenta@on,  which  is   oHen  incomplete  or  out--of--date  

§ Analysis  of  overprivileged  applica@ons  showed   that:  
­ Android  2.2  documents  permission  requirements   for  only  78  out  of  1207  API  calls  
­ 6  out  of  78  are  incorrect   ­ 1  of  the  documented  permissions  does  not  exist  

§ Of  the  7  vulnerabili@es  presented:  
­ 5  vulnerability  categories  currently  can  be   iden@fied  by  For@fy's  SCA  tools  
­ 4  vulnerability  categories  currently  can  be   iden@fied  by  UC  Berkeley's  tools  
­ 6  categories  will  be  integrated  into  the  current   tools  

§ Adrienne  Porter  Felt,  David  Wagner,  UC   Berkeley  ['11]  --  Overprivilege  
§ Will  Enck,  Penn  State  ['09]  ­  informa@on   leakage  through  Broadcast  Intents  
§ Jesse  Burns  ['09]  ­  other  common  developers'   errors  
§ Dan  Wallach  ­  WiFi  leaks  
  

§ Android  has  its  own  set  of  security  piealls   § Sta@c  analysis  can  help  developers  avoid  these  
problems   § UC  Berkeley  and  For@fy  are  working  to  
incorporate  state--of--the--art  sta@c  analysis  into   For@fy's  tools  

Seven  Ways  to     Hang    Yourself  with    
Google  Android  

Yekaterina Tsipenyuk O'Neil Principal Security Researcher

Erika Chin Ph.D. Student at UC Berkeley

