WEB JAVA 
  201409
China Internet Security Conference 2014 2014

Why

· WEB
­ 
·  ·  · 
­ WEB
· 
­  ­  update, insert  ­  ­ 
·  · 


 fuzzing



·  
­  ­  ­  ­ 
Hook

Java Hook

 



  JVM

  hook

Java Hook

 



· , J2EE



JDK1.5, javaagent









javassist+









 





,









Coder





JAVA 







Java .java

 (.class)

JVM  




 hook

Javassist
·  Javassist
­ Javassist Java Javassist  jboss   java 
­  javassist 


·  Instrumentation


· Javassist 
­  ­ 

Hook 
· Web,

XSS



XSS



SQL

SQL





......

......

10

Tomcat Hook 
· Tomcat 
­ Request session ­ Request session ­  ­  ­ ......

Tomcat Hook 
· Request
­ request  
­ Org.apache.catalina.connector.Request  ­ setRequestedSessionId
· Request
­ request ­ org.apache.catalina.connector.Request  ­ recycle

Tomcat Hook 
·  ­  jdbc  class  sql  ­ 
com.mysql.jdbc.StatementImpl  executeQuery 


Tomcat Hook 
· 
­ Org.apache.jasper.runtime.JspWriterImpl write 


Tomcat Hook 
· 
­  class
­ 


·  HOOK
­ 
· 
­ hookhook 


· Java.lang 
­ JVMRuntimeFile premain 
­ Java.lang  class  redefine 


· Xbootclass  SecurityManager
­ -Xbootclasspath:bootclasspath  jvm  jarzip bootclassjdkrt.jar
­ SecurityManagerjava

ClassLoader
· ClassLoaderClass
­ 1.ClasscacheClass8, 2
­ 2.parent classloaderparentparent bootstrap classloader4
­ 3.parent classloader85 ­ 4.jvmbootstrap classloader8 ­ 5.Classclassloader
7. ­ 6.Class8. ­ 7.ClassNotFoundException. ­ 8.Class.

SecurityMananger
· SecurityMananger
­ Java 
­ SecurityManager



 web, Javaagent jar
JVM
 JVM,  javassist hook

, 

web Fuzzing






· 

HTTP

 fuzzing

javaagent fuzzing





Proxy



Web

Fuzzing 



XSS 
 ......

XSS 


SQL OGNL
URL

23

Demo
:(,Coder)
24

():

Demo

25


.2POC . XSSSQL
 .   .  
26

Thanks!

