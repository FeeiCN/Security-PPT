SACC2013




SACC2013











www.fastweb.com.cn

Page 2



SACC2013

 201365.91

4.6444.1%

 

294

www.fastweb.com.cn

Page 3



 


10s

908

8s

20004 2

5s
1s
0.1s

www.fastweb.com.cn

SACC2013

10s 99% 5~8s 50%
1~5s  0.1~1s  <0.1s 
Page 4



SACC2013











www.fastweb.com.cn

Page 5



SACC2013

,

   

   

   

   

   

www.fastweb.com.cn

Page 6

 SACC2013

 

 

 : BGP/+CDN


CDN

BGP/

www.fastweb.com.cn

Page 7


 : BGP+IDC+CDN  CDNCDN
CDN

SACC2013


BGP
... IDC
www.fastweb.com.cn

Page 8



  BGP+IDC+DIY CDN+CDN

DIY CDN



SACC2013
CDN

HTML Web

 

 


BGP



www.fastweb.com.cn

...

...

...

IDC

Page 9

CDN

SACC2013

1  2 
3
CDN 4  5 

www.fastweb.com.cn

Page 10



DNS    
www.fastweb.com.cn

CDN

SACC2013
GSLB 
Page 11



SACC2013











www.fastweb.com.cn

Page 12



SACC2013



DNS Server 1. Issue DNS request to resolve web site address

DNS 

Web Server 2. TCP Connection Establishment to port 80

TCP 

3. Issus HTTP Get Request 4. Obtain HTTP Response header 5. Receive the HTTP data packets
6. Teardown the HTTP Connection

 

 DNS HTTP
 

www.fastweb.com.cn

Page 13


  
/

SACC2013
/

www.fastweb.com.cn


BGP/

CDN( )
Page 14

DNS
DNS 1. DNS
 2. IP 3. DNS 4.  5. DNS 6.  7. edns-client-subnet
www.fastweb.com.cn



SACC2013

1

DNSDNS 

IXFRDNS

2

 

ISPLocalIDNS

IP:BGP
3 CDN


:8 100Intel
4 IntelCPU10GbCPU
350 
ednsclient-subnet
5

Page 15





1

 

2 

3 

www.fastweb.com.cn

SACC2013
 1.  2.  3.  4.  5.  6.  7. 
Page 16

-

SACC2013

(HTTPFTP)CPU





DNS



RTT
Round.Trip.Time)

 







cache  

www.fastweb.com.cn

CPU
· cpu ·  · sprintf,snprintf%d %s
CPU · time
 ·  ·  · cpu Linuxcache 
Page 17

-

SACC2013

I/O


/



--

 

--

--

 



-- 


--

 

--







IO

IO · epollselect ·  IO

·  · Cachecpu
 Linuxcache  

www.fastweb.com.cn

Page 18


HTTP CDN
 Gzip
 DOM
404 HTML
www.fastweb.com.cn

SACC2013
Page 19



SACC2013

  ,   

 1  2  3 
www.fastweb.com.cn

Page 20



SACC2013











www.fastweb.com.cn

Page 21



SACC2013

best-effort 

......







......

www.fastweb.com.cn




Page 22


www.fastweb.com.cn

SACC2013
 1. cpu
 2. Web 3.  4.  5. 
Page 23

6

SACC2013

: ,  : ping, traceroute
:  : CPU, , IO, , SWAP, 
:  : MRTG
:  : , 

: IP, URL : ping, URL

:  : , 

www.fastweb.com.cn

Page 24



SACC2013











www.fastweb.com.cn

Page 25

CloudXNS

SACC2013






CND
cname CDN




IP
IP


+




www.fastweb.com.cn

Page 26

CloudCDN

SACC2013

CloudCDN





  

(, )
 
 







DNS 

CloudTCP

TCPTCP15

CloudXNS

DNS

www.fastweb.com.cn

Page 27

CloudDIY

SACC2013

FastCache

 Varnish3

FastGLSB

GSLB 350QPS 0.5

FastTCP

TCP 15

FastSLB

 47 

FastAdmin

CDN 

FastPortal

www.fastweb.com.cn

CloudDIY
CloudDIY

SACC2013


    24 



FastCache

FastTCP

FastGLSB

FastSLB

FastPortal

FastAdmin



www.fastweb.com.cn

CloudCDN

CloudXNS

CloudIDC



SACC2013

  -- CDN
  150100 250Gbps300Gbps
 / 3G12400 CDN

 
               CDN    CloudCDNCloudXNSCloudDIY
 FastCacheCache Varnish3
 CloudXNS100
 FastTCPTCP15

www.fastweb.com.cn

Page 30

800

SACC2013

 Ticket  SLA  6      

www.fastweb.com.cn

Page 31



SACC2013

 IDC CDN

 CloudCDN CloudDIY CloudXNS

 Azure Office365 Cloud Hosting

www.fastweb.com.cn

Page 32

SACC2013
Thank you

