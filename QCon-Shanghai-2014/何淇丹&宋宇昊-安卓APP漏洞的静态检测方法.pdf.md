APP
Flanker  &     
Keen  Team

Agenda
Why  Researching  into  Android  APP  Vulnerabili=es? How  Do  APP  Vulnerabili=es  Come  into  Being?
How  to  Find  Out  APP  Vulnerabili=es?

Why  Researching  into  Android  APP   Vulnerabili=es?

Why  Is  MP  Targeted?

Where  Do  AGacks  Come  From?

a%acker  

Smartphone   NFC/BT  

Market  

aGack  

Malware  

APP  

Careless  user  
Malicious   file  /  page   SD/URL/   QR  code   Careless  user     

adb   debug  

a%acker   network   3G/4G/Wi--Fi  
USB   a%acker  

How  to  Perform  An  AGack?

How  Do  APP  Vulnerabili=es  Come  into   Being?

Improper  Manifest

Improper  Manifest

Vulnerable  APP Intent("X")
Non--exported   Component  A  
Filter("X")

Malicious  APP
Exported   Component  
B      Filter("X")
Intent("X")

Improper  Manifest
· What  do  we  usually  do  to  find  out  these   vulnerabili=es?  
· Check  whether  the  manifest  file  meets  the   logic  of  the  program,  Manually.

API  Misuse
AllowAllHostnameVerifier X509TrustManager.checkServerTrusted

SSLSocketFactory.   setHostnameVerifier

API  Misuse

API  Misuse
· What  do  we  usually  do  to  find  out  these   vulnerabili=es?  
· Scan  smali  code.  
­ But  false  posi=ve:  the  code  which  can  never  be   actually  triggered.  
· Webview  checking  tool:  
­ But  false  nega=ve:  the  code  requiring  certain   condi=on  to  be  triggered.  

Arguments  Verifica=on  Issue

loadDataWithBaseURL

URI Script  

HTTP File  

WebView   File://xxxxx  

Arguments  Verifica=on  Issue
· What  do  we  usually  do  to  find  out  these   vulnerabili=es?  
· Intent  Fuzzer  
­ But  false  nega=ve:  the  code  requiring  certain   condi=on  to  be  triggered.  
· Dynamic  behavior  audi=ng  
­ But  false  nega=ve:  the  code  requiring  certain   condi=on  to  be  triggered.  

How  to  Find  Out  APP  Vulnerabili=es?
Sta=c  Analyzing     --  Tools  And  Methods  

Equivalent  Problems
· Constant  Propaga=on  
­ Used  in  API  Analysis  
· Constraint  Solving  
­ Prune  infeasible  path  
· e.g  if(Manifest_defined_debug){  vulnerable_code;  }  
­ Null  pointer/Excep=on  analysis  
· Taint  Analysis  
­ Untrusted  input  from  intents/UI/etc  to  sensitve  sink   ­ Sensi=ve  informa=on  source  flow  to  sink  

Industrial  state  of  art  
· Based  on  Dalvik  /Smali/Java  source  code  
­ Dexlib,  smali  parsing,  dex2jar=>jdcore  
· Grep,  grep,  grep   · Simple  Intent  Fuzzer  

Soot  
· Program  analysis  framework  from  SSE  group   · Jimple  IR   · Many  similar  to  WALA   · Op=miza=on/Transforma=on  Framework  
­ Can  be  used  to  omit  infeasible  paths  
· Ac=ve  Community  support  

Jimple

Dalvik  Byte  code

· Dalvik  instruc=on:  >200   · Java  byte  code>200   · Jimple15   · Greatly  simplify  analysis

Jimple

Soot  in  depth
· IR:  
­ Jimple:  Typed,  3--addr,  stackless  instruc=on   ­ Shimple:  SSA  formed  Jimple    
· Toolkits:  
­ Dexpler   ­ Control--Flow  Graph   ­ CallGraph   ­ Point--to  analysis     

Typical  problems:  1
· HTTPS  custom  verifier  vuln · Analyze  param  of  setHostnameVerifier · Convert  to  Constant  Propaga=on  
­ Intra--procedure    
· BackwardFlowAnalysis  
­ Inter--procedure  
· Prune  infeasible  path   · Merge  on  all  constant  value  reached  (if  any)  

Typical  problems:  2
· Causes  of  Denial--of--service  vulns  
­ NullPointerExcep=on   ­ ClassCastExcep=on  
· Developers  should  not  have  assump=ons  on   data  passed  IN  via  intent/bundle  
­ ClassType,  nullness,  etc  
· Can  be  aGacked  remotely  via  intent--scheme  

    Detec=on  Mechanism  (NO  DYNAMIC)
· Analysis  context  and  constrains  of  instruc=on  
­ NullpointerExcep=on:  
·   If  receiver  instance  may  be  null?  
­ If  statement  covered  by  try--catch  block?  
· Reduce  false  posi=ve  
­ ClassCastExcep=on:  Massive!(J)  
· Cast  without  first  check  receiver  object  type   · get(Parcelable|Serializable)Extra  
  

Constraint  &Taint  analysis
Control  Flow  graph

Lasce  example  

Typical  problem:  3.1
· Data  from  intent  flows  into  sensi=ve  API · Define  taint  propaga=on  rules
­ Source:  data  from  intent/bundle,   e.g.  getStringExtra,  etc  
­ Sink:  loadDataWithBaseUrl,  loadUrl,   Run=me.exec,  rawQuery  
· Context--,  field--  sensi=ve  taint  analysis  

Typical  problem:  3.2
· Sensi=ve  data  passed  to  sinks  
­ Password  stored  in  clear  text
· Define  taint  propaga=on  rules
­ Source:  Password  Input  Widget-->getText(),  etc   ­ Sink:  sharedPrefs.putString,  FileOutputStream,  
logcat,  etc.  
· Same  methodology  

Extra  work     
· Find  balance  between  precision  and  resources   consumed  
­ Memory  explosion  ~80G  Mem  
· Model  android  app's  lifecycle   · Some  deep  vulns  need  specific  domain  
knowledge  
­ Applica=on  logic  related  onesL  

@InfoQ  

infoqchina  

