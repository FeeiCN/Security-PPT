Defeat Public DNS
Water
2011-S0A9-C08C2011

In a CDN'd world, OpenDNS is the enemy!
----
SACC2011

2009124 GoogleDNS, GoogleDNS   ......

GG LocalDNS48

SACC2011

48 
TC!

90opendns 

SACC2011

 DNS
SACC2011


SACC2011


Public DNS resolver 7000 5WPublic DNS 21WDNS , 
SACC2011

 
Google DNS ,48 
SACC2011

When a DNS resolver queries an

authoritative nameserver for a

CDN's IP address, the

nameserver returns an address

which is closest (in network

distance) to the resolver, not

the user.

......

http://code.google.com/speed/
public-dns/faq.hStmAlC#cCdn2011

OpenDNS architecturSeACC2011

resolver resolver publicdns

view "china" {

match-clients { 64.233.182.81; 64.233.182.82; };

......

view "japan" { match-clients { 64.233.182.83; };

 resolver 

......

view "korea" {

match-clients { 64.233.182.0/24; };

......

SACC2011

GoogleIP 
( GoogleIplist )
SACC2011

LDNS
SACC2011

PHP
<? $ip = $_SERVER["REMOTE_ADDR"];
echo "<img src=http://$ip.cdn.sdo.com/blank_$ip.jpg>"; echo "<br>"; echo "<img src=http://123.45.67.89/blank_$ip.jpg>"; ?>
SACC2011

Tip DNS
http://yahood.ogcit/hhuobw.ctooms/h/boowoStmoA-e8Cr.ahCntmg2/l011

CDN 

proxy_intercept_errors on;

location /favicon.ico { proxy_pass http://backend; error_page 404 = @gather; }

location @gather {

rewrite ^

http://$remote_addr.sdo.com/favicon.ico;

expires -1;

}

SACC2011

resolver node 
SACC2011

resolver publicdns 
SACC2011


SACC2011

1.  resolver 
2.  3. 


Redirect

SACC2011

1. ( )
2.  

Rewrite

SACC2011

1.  2. 
URL  
Substitute SACC2011


SACC2011

1.  IP
2. IP IP

123.45.67.89
IP tunnel

123S.4A5.C67C.892011

1.   
2.  
Forward
SACC2011



1. LDNS

LDNSresolver



2. resolver



3. 

IP



SACC2011

18.6% 5.9%
SACC2011





·  ·  · 

·  ·  · MongoIC

http://www.granSdcAloCudC.cn2/ 011

THANK YOU
http://weibo.com/wSaAteCrhaC/2011

