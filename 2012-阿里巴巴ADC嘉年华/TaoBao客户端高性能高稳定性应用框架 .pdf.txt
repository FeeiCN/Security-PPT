     
[TaoMobile]  
   weibo.com\steveyzhang  
mobile.taobao.org

Introduce  
      AndroidWP         · weibo.com/steveyzhang  
· http://mobile.taobao.org  
        

Agenda  
·   Android   · HOW  TO  TaoBao  Client  Framework   ·   Android     
             

  

Android  
·   200W+   ·   
· Android  OS  
­ 324@2011   ­ 104@2012  April  

  
·    ·    ·    · 

  
·      ·   
­ UI    UE   ­ ----
      ·    ·   

  
· OS   ·   
- CPURAM  
·    ­    ­    ­   
  

Android    
OpenSignalMaps    3997  

  
· 28   ·    ·    ·    · 80%SDK  


·    ­    ­    ­ 5   ­ ?    ...  
·    ­   
·    ­    ­ webview    webapp  

  
· 23   · OS   · Framework     ·    ·       

  
  

  
·      

  
·   
·   2      1  

""  
· App    

----  
·     ·       ·     ·  App    

HOW  TO
  
·    
· SDK  
· So  we  need  something  
·   

  

  

MVC  

  

  

  

· 4  

  

           

    

  

  

    

  

  

MVC  

  

  

Framework  

   
   
   

·    · Think  about  MVC   ·    ·    · Think  about  Change  again   ·     

Architecture  

  

  

  

  

  

  

  Web  Plus  

Business  

Search   Cart  

Detail   Purchase  

Pay   Login  

Charge   Ju  

   Rich  View   Data  Provider  

Push  

API  Request  

Cache  

Image  Pool  

TBWebview   Utility  

OS  Framework  

Server

MTop  API  3rd  API  

Base  Function  
· API  Request     · Image  Pool     · Push   · Cache   · TB  WebView   · Data  Provider  

Business's  Features
· Data  and  Logic   · Friend  interface  for  Applica=on   · Model  and  self--control   · Cache  build--in   · Can  be  shared  between  Apps  

Rich  View  
· Performance   · Encapsulate  some  base  user  interact  for  you  
app   · Fit  to  various  screen  

  
·   
­ Dynamic  Memory  Monitor  in  Framework   ­ MAT   ­ Monkey   ­ Perf  Tool   ­ TraceViewBenchmark  in  Framework  
·   
­      ­      ­      ­ Performance    

  
Network  
Kill   OOM  

Know  Mobile  Network  well
· Limited  bandwidth     · High  latency   · Unstable  
· Ref:   http://developer.att.com/home/develop/referencesandtutorials/ networkapibestpractices/ Top_Radio_Resource_Issues_in_Mobile_Application_Development.pdf  
· Ref:  http://developer.android.com/training/efficient-downloads/ efficient-network-access.html  

Three  States  
· Idle   · Full  Power   · Half  Power  

Bundled  Transfer
·   

Tool
· ARO  by  AT&T   · DDMS   · Here  Is  a  demo  
· Refhttps://developer.att.com/developer/legalAgreementPage.jsp? passedItemId=9700312  

Concurrent  Download  
· 2G  GPRS,  3  150KB  size   ·   
15s   30s   44s  
·   
28s   32s   37s  

Other  Optimize
· Inefficient  Connections     · Offloading  to  WIFI  When  Possible   · Unnecessary  refresh,  Duplicate  Content   · Periodic  Transfers  
· No  Multiple  Simultaneous  TCP  Connections   · Use  Cache-Control   · Pre-fetching(by  Business)  

API  Request  Feature  
· Connection  optimization  in  Mobile   Network(Money  and  Power  Save)  
· Different  Download  strategy  in  WIFI2G/3G   · HTTP  Request(POST,  GET)   · Cache-Control   · Queue  for  Requesting   · XML  for  API  protocol   · Thread  Pool  

Kill  OOM

Kill  OOM  

Efficient   Memory   Usage  

  
           

Native  is  a  big  one  

Overview  
  
· MATDDMSPerf  tool  by  taobao  
Framework  
· Image  PoolMemory  MonitorBase  Activity  
  
·   Reference  MonitorActivity   · Native  RAM  size:  image  pool  &  customized  ROM  to  monitor  
bitmap  and  native  RAM(skia)   · Set  RAM  Limitation  for  poor  device   · Free  memory  immediately  if  you  don't  need  any  more  

   ThanksQ&A  
weibo.com\steveyzhang   Mobile.taobao.org

