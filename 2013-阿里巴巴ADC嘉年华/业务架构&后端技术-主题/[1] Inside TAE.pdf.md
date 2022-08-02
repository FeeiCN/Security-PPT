Inside TAE

GAE
TAE

SAE BAE

TAE
· 
· 
­  ­ 
· AE
­ PHP ­ JAVA

U uz.taobao.com

uz.taobao.com
· 800+ TAE App · 2000+ App · UV 130W+PV 1200+ · 9.08 · 738

PHP 




LVS/F5

Nginx

Nginx

Nginx
...

App Container

App Container


...















Cache

File

Mysql

 



    
   
   

ISV


<?php $a = $appEngine->find("xService"); echo "<br>".$a->someMethod(); ?>


 
grid xiaoxiqi

appx

...

xiaoxiqi app.yml view
a.php templates
 a.tpl



Nginx

Nginx

xiaoxiqi app.yml view
a.php templates
 a.tpl

grid xiaoxiqi

appx

...

<?php $a = $appEngine->find("xService"); echo "<br>".$a->someMethod(); ?>

 Nginx

grid xiaoxiqi

appx

...

$a = $appEngine->find("xService"); echo "<br>".$a->someMethod();
PhpProgram BlockStatement
ExpressionStatement   ... EchoStatement
 MethodInvokeStatement
xService

LB/LVS

RPC 

LB/LVS

Tae Nginx

Tae Nginx

HTTP

LB/LVS

RPC

app1

app2 HSF app2

app3 HSF app3

app1

grid

grid

grid

Tair

TFS

Meta       HSF MySql OceanBase

PHP







PDO

Smarty API







TAE Servlet



Context     Caja  





Tae Common Engine
  PHP Groovy Velocity    

DB 

 

 

 

 

proxy

 



JBoss/Jetty(With Java Security)

JVM (For TAE) Linux Security Container(T4 for TAE)
Linux OS With Sandbox

Quercus

 U -- 9 -- 800+ ISV

PHP
· PHP
­ PHPjava ­  ­ 
· 
­ Caja + HTML/CSS  ­ 
· 
­  ­ 

JS

app1

app2

...

appx

PHP  Quercus Engine JBOSS/Jetty Java SandBox JVM 4 TAE Grid  IpTables Linux Container


TaoBao Header 

TBMLFilter

request

app1

app2

PHP  Quercus Engine JBOSS/Jetty Java SandBox JVM 4 TAE Grid  IpTables Linux Container


response

AppCode HtmlOut
js/css

Caja SandBox TaoBao Footer

JAVA 


· 
­ ISV ­ * ­ *
· JAVA

 - 
· 
­ Cookie & session  ­ Htmljscsspic  ­  ­ Sql  ­ XSS CSRF
· 
­   ­ Java ­ 0day

 

­ 
· 
­  ­ "Javaby pass"

· 
­  ­ JVM ­  ­  ­ 

Cookie&Session TBML Druid CAJA
JVM

JAVA





 TopScan







STC 

Java Policy File

Security Manager


JDK

 TopScan 

  



 

 T4 chroot





T4 Capability Instance

selinux

IPtables

 
Iptables  



·    app

VM Jetty

· 
­  ­ 

App1

App2

App3

App n



· App
· 
­  ­ 


VM Jetty 1 App1
Jetty 3

App4

Jetty 2 App2
Jetty n App n

· 
­  
· 

setfacl -m g:tae_apps:x / setfacl -m g:tae_apps:x / setfacl -d -m g:tae_apps:- /etc setfacl --set u::rw,g::r,o::r,g:tae_apps:- /etc/group setfacl --set u::rw,g::r,o::r,g:tae_apps:- /etc/passwd setfacl --set u::rw,g::r,o::r,g:tae_apps:- /etc/shadow
setfacl -b -R /root setfacl -m g:tae_apps:- /root
setfacl -m g:tae_apps:x /home setfacl -d -m g:tae_apps:- /home setfacl -m g:tae_apps:- /home/admin setfacl -m g:tae_apps:- /home/hubble setfacl -m g:tae_apps:- /home/tops

­ rootroot app

­ 
­ rootinstance capability

­ 

VM

· Instance 
­ instance java
­ lxc Instance capability
­ Instanceroot 
· 
­  ­  
 instance 

PHY lxc Instance1 Jetty 1
App1

lxc Instance2 Jetty 2
App2

VM
· 
­  ­ lxc incetance
· 
­ IP
· lxc incetanceIP



­ 



­ 

· 

· 

 

Nginx

Xinetd

Fork



Channel channel = System.inheritedChannel();

Jetty

Cookie&Session TBML Druid CAJA
JVM

  



  



 



Java Policy File

Security Manager

JDK

 chroot





Linux Capability Instance

selinux

IPtables


 TopScan

STC 
 TopScan 
 
kernel patch
Iptables  

Service Center



LVS/F5

Nginx

Nginx

Nginx
...

App Container

App Container


...

Service Center

Cache

File

Mysql

 

















    
   
   

ISV


Service Center
· Service Center
­  ­ 
· 

Service Center
·  - Tcp Friends
­ when both endpoints of a TCP connection are on the same machine, the two sockets are marked as being "friends" in the kernel. Data written to such a socket will be immediately queued for reading on the friend socket, bypassing the network stack entirely
­ Google  ­ service center
instanceservice center ­ 
TCP friends :http://lwn.net/Articles/511254/

Put it together
HTTP Requests 
Xinetd

Xinet daemon
Port: 7001 T4 Instance1
Jetty 1
App1

Xinet daemon
Port: 70096 T4 Instance n Jetty n
App2

Service Center

IPC Over TCP Friends

 

 

 

API Servlet API

API



 

MVC





 

Page Meta

 

 

 

 

Common Engine



Groovyy Velocity Quercus

Componet Render Engine































Client 



Jetty(With Java Security)

JVM (For TAE) Linux Security Container(T4 for TAE)
Linux OS With Sandbox Net (Iptables)



TP/ISV





















TOP



TAE





SNS

















Q & A

TAE
·  ·  ·  ·  · 
­  linxuan@taobao.com haomin.liuhm@taobao.com
­ 
 ludvik_
­ 
 ludvik

