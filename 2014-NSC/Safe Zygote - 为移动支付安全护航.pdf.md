Safe Zygote - 
@

Agenda
·  · Root or Not Root · Safe Zygote  · 4 +


· "" · "" · ""
 · ""
 · 10086

 

 

  

  

  

   

    
      

 

  




  

  



 1   2    
 1  2   3  4  5  


 


·  ·  ·  · 

Not Root
· 
­ MasterKey/FakeID ­ Activity
· 
­  ­ WooYun-2014-53037 

Root

Hook
· Xposed
­ http://repo.xposed.info/
· Cydia Substrate
­ iOS/Android ­ http://www.cydiasubstrate.com/
· ADBI/DDI
­ https://github.com/crmulliner/adbi ­ https://github.com/crmulliner/ddi

Xposed ­ Hook
· Androidhook · app_process · JavaNative · hook
BeforeHook/AfterHook · /hookzygote





Zygote

2 Notify

System Server
ActivityManager Service

3 Fork

1 Request

App

Launcher



Zygote
1 2

2 Notify

System Server
ActivityManager Service

3 Fork

1 Request

App
1 2

Launcher




· Zygote · Zygote · AppZygote

Safe Zygote -   

Zygote
no
1 2
3 Fork
App
1 2

 yes
Sygote

2 Notify SygoteBridge
protect

System Server
ActivityManager Service
1 Request

fork Safe App

SygoteShield protect

Launcher



4 +

4 + 1 











 



 SDK



   

       

 100%  AV-Test 

 

 
  
 

 

 
 "+ "  
 
  

 


Debugger

Debugger



 ()


()
SDK

 

,     .
  

 
 



4  
+  1 


  V1.4.5

    
 1  2  3 



