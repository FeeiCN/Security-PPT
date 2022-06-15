 CDN 
-- ATS 



CDN  10  ,  .   ,  ugc  CDN  ,  http 2. 0  CDN  .  ,  CDN   ?  ,  ATS  .

 
  ,  ,  CDN  .   CDN 
Apache Traffic Server  PMC    shell  c++    CDN  ,     CDN    : ats tsar

 
  CDN   cache            http 1.1 

 CDN    :  10-20M    :3G  Ipad    :    :Adroid  IOS   CDN  :  ,  ,  , 

Cache   
­  ­    ­  ­  cache  RT ­  proxy  ­ IO 

  ­  ,  ,  ­  ,  ,  , 
  ­  ­  ­  ­ 

CDN 

  ,  ,  
  cache  RT,  (  )   (  )
  proxy  ,  TCP  
 IO  :  IO  IO  ,  IOPS  QPS 

 QPS/CPU=?  CPU    :
­ Https ­  ­  :fast cgi, gzip  ­  (  , 
,  ,  )

 , 
Capex:

Opex:



 / 

 :  50  ,  1  :  8G,  0G,s  10G,  =5   40  /  ,  : 40  /  /8G=5 /Gbps,  3  :  5/(3*12)  /  /Gbps =0.14  /  /Gbps

 ,  
   4-7   Cache 
­  ­  ­ CPU ­ 

  
   =  *    ,  

  :
      ,      , 

 :   ,    .     ,  ,   

   ?   hold  ?    ?   ?   (  )  ?

 : Cache    ,  , TCP    ESI       websocks  SPDY   , 

 http/1.1   Ajax  ,  ­ ­  cache   Html V5  ,  ­ ­      http/2.0  SPDY? ­ ­  ,   http/2.0  websocks? ­ ­   http/2.0  ,  ? ­ ­V0.9  ,  ?



Apache Traffic Server 
 Apache Traffic ServerTM is fast, scalable and extensible HTTP/1.1 compliant caching proxy server
 ISP  proxy/cache      7  hash  Cluster  API 

Apache Traffic Server 
  : ­  ,  ­  , 
  : ­ Apache  ­   Akamai Comcast LinkedIn Cisco Apple...

Apache Traffic Server   , 
  ­  ,  ­  Cache  ­ 
  ­  ­  ,  (RT  )

 dns ftp  Quicktime MMS Real 


Apache Traffic Server   , 
  16core 8×600G   TS 
­  16gbps  112kqps ­  7.7gbps  ­  3.4gbps  17kqps (  haproxy)

Apache Traffic Server   , 
  , 10  TS 

Apache Traffic Server 
  ­  ,  ­  ,  ­  ,  ­  ,   500+  . ­ Cache 

­  ­  ­ 

Apache Traffic Server 
  ­  :  http  TS  2  (  ) ­  ,  ,  :  ESI, Edge Side Include,   Metalink  Lua remap  ,  lua  script  Gzip  ,  html  ­ API  , 

Apache Traffic Server 
  ­  binary  ­  squid  ­  ­  ­  / 
 

Apache Traffic Server 
  CDN  : ­  (  ) ­  ­  ­ LinkedIn
  CDN  : ­ Akamai ­ Comcast

  ,  : ­ Websense ­ Cisco

Apache Traffic Server 
 20120907, V3.3.0: ­  SSL  , Lua  Cluster  ­ RFC5861  ­ Gzip  ­ Metalink 
  V3.3.1: ­ SPDY  ,  SPDY V1&V2 ­ ...

Apache Traffic Server 
    ESI       websocks  SPDY, https,  cluster   cache  : SAS->SSD->MEM 3  ,    :  haproxy, lvs  4-7 


 TS  : ­ TS,  cache  ­  http://people.apache.org/~zym/trafficserver/
 Join US here: ­ CU  : http://bbs.chinaunix.net/forum-232-1.html ­ IRC: #traffic-server on freenet ­ users@trafficserver.apache.org dev@trafficserver.apache.org

Q &A

