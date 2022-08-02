
--HTTPS
--AIS 

HTTPS
4

HTTPS
5

HTTPS
//Facebook/Twitter/LinkedIn/Blogger/ Reddit/Tumblr/Pinterest/Instagram/Wikipedia Google/Bing/Baidu/Haosou/Sogou Youtube/Netflix Gmail/MSN/Yahoo/Live/QQmail Alipay/Paypal Taobao/Tmall
6

HTTPS
Chrome/Firefoxhttp Apple ATS : iOS9OS X 10.11appHTTPS HTTP/2HTTPSIE/Firefox/Chrome/Safari GoogleHTTPS 2016HTTPS
7









 

DV





OV



EV





e.g

www.taobao.com www.taobao.com *.taobao.com *.taobao.com

www.tmall.com

*.tmall.com

www.1688.com

*.1688.com

8


CSRCA

CA

CSR

WebServer







https
LVS

SSL/TLS HTTP

SSL/TLS HTTP

SSL/TLS HTTP

HTTPS......
10


LVS

SSL/TLS

HTTP

HTTP

HTTP

......
11


JS/CSS iFrameFlash
POST


http://=> //
 1. app// 2.  3. 


Tengine ­ sub_filter
1. subs_filter http://www.taobao.com https://www.taobao.com; 2. Tengine 3. HTTPSHTTP 4.   2%

HTTPS

HTTPS

 

PC PageLoad Time

 

 

 

21%
 

6%
 

23%
 

22%

20%

19%

 
16%  
30%


· tls · SPDY3.1 & HTTP2 ·  · TCP · 1-RTT  · CDN Early Termination ·  · ECDSA>RSA>ECDHE

TLS
· Session Cache · Session Ticket · Session Cache · TCP keepalive
· TLS full handshake % = ( ! keepalive + ! session_reused) / total_conn * 100%
18


· tls · SPDY3.1 & HTTP2 ·  · TCP · 1-RTT  · CDN Early Termination ·  · ECDSA>RSA>ECDHE


· tls · SPDY3.1 & HTTP2 ·  · TCP · False Start1-RTT  · CDN Early Termination ·  · ECDSA


· tls · SPDY3.1 & HTTP2 ·  · TCP · False Start1-RTT  · CDN Early Termination ·  · ECDSA


· tls · SPDY3.1 & HTTP2 ·  · TCP · False Start1-RTT  · CDN Early Termination ·  · ECDSA


· tls · SPDY3.1 & HTTP2 ·  · TCP · False Start1-RTT  · CDN Early Termination ·  · ECDSA


· tls · SPDY3.1 & HTTP2 ·  · TCP · False Start1-RTT  · CDN Early Termination ·  · ECDSA


performance.timingAPI


CDNtiming-allow-origin: *

HTTPS
27

SHA-256
SHA-1 16CASHA-1 ChromeSHA-1 XP SP2Android2.2  SHA-256

HSTS
G E T http://w w w .taobao.com R esponse:302 http s://w w w .taobao.com
G E T http s://w w w .taobao.com R esponse:https://w w w .taobao.com

HSTS

S S LS TR IP

G E T http://w w w .taobao.com R esponse:http ://w w w .taobao.com

G E T http s://w w w .taobao.com R esponse:http s://w w w .taobao.com

HSTS

G E T http://w w w .taobao.com R esponse:302 http s://w w w .taobao.com G E T http s://w w w .taobao.com
Response: https://www.taobao.com strict-transport-security: max-age=31536000

G E T http://w w w .taobao.com 307 internalredirect G E T http s://w w w .taobao.com
Response: https://www.taobao.com strict-transport-security: max-age=31536000

TLS

https://wiki.mozilla.org/Security/Server_Side_TLS

32

https://www.ssllabs.com

11.11 HTTPS

· DNSOCSP server · /tls

· 

· 

34

QA

tony.lizy@alibaba-inc.com

@

@

