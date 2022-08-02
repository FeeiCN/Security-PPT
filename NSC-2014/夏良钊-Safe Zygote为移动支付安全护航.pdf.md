Safe Zygote - 
@

Agenda
·  · Root or Not Root · Safe Zygote  · 4 +
2


· "" · "" · ""
 · ""
 · 10086
3

 

 

  

    

  

  

   

      

4

 

  




  

  




1   2    
 1  2   3  4  5  

5

 
6


·  ·  ·  · 
7

Not Root
· 
­ MasterKey/FakeID ­ Activity
· 
­  ­ WooYun-2014-53037 
8

Root
9

Hook
· Xposed
­ http://repo.xposed.info/
· Cydia Substrate
­ iOS/Android ­ http://www.cydiasubstrate.com/
· ADBI/DDI
­ https://github.com/crmulliner/adbi ­ https://github.com/crmulliner/ddi
10

Xposed ­ Hook
· Androidhook · app_process · JavaNative · hook
BeforeHook/AfterHook · /hookzygote
11





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

12


13


· Zygote · Zygote · AppZygote
14

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

15


16

4 +
17

4 + 1 











 



 SDK



   

       

 100%  AV-Test 
19

 

      
20

 
21

 
 "+"   
 
  
22

 


Debugger

Debugger



 ()


()
SDK

 
 ,     .
  
24

 
 



4  
+  1 

26

  V1.4.5

    
 1  2  3 
27



