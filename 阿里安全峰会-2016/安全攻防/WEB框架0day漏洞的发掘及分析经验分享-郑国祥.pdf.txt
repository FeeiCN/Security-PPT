WEB
WEB0day

www.dbappsecurity.com.cn



Web

web





fuzzing

www.dbappsecurity.com.cn

WEB

Web
WebWeb application framework  

www.dbappsecurity.com.cn

WEB

Web

Java: struts,spring Php:Yii, ThinkPHP, CodeIgniter Python:django, Tornado ...

www.dbappsecurity.com.cn

WEB

Web MVC

www.dbappsecurity.com.cn

WEB



Sql Xss Csrf   Ognl ...
www.dbappsecurity.com.cn

WEB

Sql
1. SQL
Eg: YIIDBPDO bindParambindValue CDbCommand::bindParam() CDbCommand::bindValue() 
Eg: Hibernate,

www.dbappsecurity.com.cn

WEB

Xss
2. XSS
Eg: YII CHtmlPurifierHTMLPurifier 

www.dbappsecurity.com.cn

WEB

csrf
3. CSRF
Eg: YIIYiiCSRF POST cookie POST Eg: struts2token

www.dbappsecurity.com.cn

WEB


4. 
Eg: controlleraction IP controllerCController::filters  Eg: struts2includeMethods

www.dbappsecurity.com.cn

WEB


5. 
Controller filter

www.dbappsecurity.com.cn

WEB

Ognl
6. Ognl
Struts2ognl SecurityMemberAccess

www.dbappsecurity.com.cn

WEB



1.  2. 


www.dbappsecurity.com.cn

WEB



:  :eclipse


www.dbappsecurity.com.cn

WEB



http Controller


view 

www.dbappsecurity.com.cn

WEB

httpController

url

 

( 
(struts2))



Controller 

www.dbappsecurity.com.cn

WEB

view
Controllerviewstruts2 stream,freemarker

www.dbappsecurity.com.cn

WEB



 

 (S2-
004)

 





View 
location

www.dbappsecurity.com.cn

WEB



 

 

 

View

 

 struts2      


 static     

Rest   


url 
location 
ognl 


location

Ognl    

www.dbappsecurity.com.cn

WEB





eclipse 


  


 
 fuzzing   

www.dbappsecurity.com.cn

WEB


Fuzzing#' " #parameters 

www.dbappsecurity.com.cn

WEB

 

www.dbappsecurity.com.cn

WEB



a.  



b.  


c.  



www.dbappsecurity.com.cn

WEB

ognl

:

:


(OgnlContext, Action...)

 

new 

 



struts.excludedClas ses:java.lang.Objec t,java.lang.Runtime, ava.lang.System...

struts.excludedPac kageNames:java.la
ng.,ognl,javax

www.dbappsecurity.com.cn

WEB

Ognl
·  · SecurityMemberAccess

www.dbappsecurity.com.cn

WEB

ognl

www.dbappsecurity.com.cn

WEB

ognl


securitymemberAccess 

 

 

www.dbappsecurity.com.cn

WEB



 graybox4j


www.dbappsecurity.com.cn

WEB

agent

Java vm  libinstrument.dylib,dylib InvocationAdapter.c
Agent_OnLoad

agentMF

jvmti 

Pre-Main premain

vm 
Instrumentation ClassFileLoadHook 

www.dbappsecurity.com.cn

WEB

agent



  

 



 


www.dbappsecurity.com.cn

WEB



javaagent hook
· : ProcessBuilder,OgnlRuntime, FileWriter, FileOutputStream, 

 .
·  

www.dbappsecurity.com.cn

WEB



www.dbappsecurity.com.cn

WEB

fuzzing
fuzzing

burpsuite

fuzzing 

www.dbappsecurity.com.cn

WEB

fuzzing

www.dbappsecurity.com.cn

WEB

About me
 
· Web · web · Tsrc-2015 · CVE-2016-0785,CVE-2016-3081

www.dbappsecurity.com.cn

WEB

 

www.dbappsecurity.com.cn

WEB

