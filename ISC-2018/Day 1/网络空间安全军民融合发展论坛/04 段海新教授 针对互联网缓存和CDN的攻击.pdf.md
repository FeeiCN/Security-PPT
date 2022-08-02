2018/9/12
CDN
 
-360

· HTTP/HTTPS ·  · HTTPS · CDN · 
1

2018/9/12

HTTP
· HTTP ·  ·  · 
GET /path/url HTTP/1.0
 


a.com

HTTPS 
· HTTPS: HTTP/SSL HTTP/TLS · Web  · Confidentiality · Integrity

 2

2018/9/12



· HTTPS

· HTTP 

· 

· CDN · v4-v6

  

NAT

CDN

IDS/IPS


· HTTP/HTTPS ·  · HTTPS · CDN · 

3

2018/9/12



GET nonhttp://a.com/path/url HTTP/1.1 Host: b.com
Host: c.com

Cache or Proxies

CDN

a.com b.com c.com

 Host headers

GET / HTTP/1.1 Host: a.com Host: b.com

GET / HTTP/1.1 Host: a.com Host: b.com

Client

Downstream Host: a.com

Upstream Host: b.com

HTTP standard(HTTP/1.1)
· RFC 2616(superseded standard), implicitly requires rejection. · RFC 7230(latest standard), explicitly requires rejection.
8

4

2018/9/12

HTTP



 

Apache Concatenate

Akamai

 



First

Bitdefender First

Server

IIS Nginx Tomcat

Reject First First

ATS Transparent

cache

Squid

Reverse Nginx

Proxy

Varnish

First
First First Reject

Alibaba First

Azure

Reject

CloudFlare First

CDN CloudFront First

Fastly Level 3 Tencent

Reject First Last

ESET

Last

Huawei

First

Firewall Kaspersky First

OS X

Concatenate

PAN

First

Windows First

· HTTP

·  RFC7230

9

...

HTTP 
 RFC 2616 Absolute-URI RFC 7230 Absolute-URI

 Not specified Not specified

· CDNRFC · CDNAkamai35%

10

5

2018/9/12

(CCS 2016)
Cache/Proxy CDN

NSA.GOV

attacker.com

HTTP Request:
GET http://NSA.GOV/path HTTP/1.1 Host: ATTACKER.com
Middle box Confused: NSA or ATTACKER ?

 NSA.GOV

12
6



2018/9/12

202 different combinations that could be exploited. 13 /

14
7

2018/9/12
98% 
·  Flash   
15

· HTTP/HTTPS ·  · HTTPS · CDN · 
8

CDN
·  CDN Akamai
· Web15-30% · 30T · 2 · 200,000100
· CDN2014
· Alexa10091% · Alexa54672.5%

2018/9/12



User Browser

CDN

Delegation

website.com

Website

9

CDN

2018/9/12

When HTTPS Meets CDN
·  · HTTPS

User

Website

Frontend

Backend
CDN

10

2018/9/12
HTTPS in CDN(Security&Privacy14)

User HTTPS CDN

HTTP HTTPS

CDN Provider



CDN77 HTTP

CDN.NET HTTP

CloudFlare HTTPS, not validate certificate

Incapsula HTTPS, not validate certificate

CloudFront HTTPS, not validate CN

Website

Apple & Akamai ,2014/4/15

11

2018/9/12

· Akamai/ CloudFlare/Amazon · CloudFlare 1Strict SSL 
http://blog.cloudflare.com/introducing-strict-ssl-protecting-against-a-man-in-themiddle-attack-on-origin-traffic
12

2018/9/12

TLS

CA1

CA2

CA3

Browser

TLS 

CDN

website

TLS 1

TLS 2 TLS 3

13


· HTTP/HTTPS ·  · HTTPS · CDN · 

2018/9/12

CDN
·  · (WAF), (anti-DDoS)

Client

CDN

Website

28
14

CDN
·  · (WAF), (anti-DDoS)

Client Attacker

CDN

Website

2018/9/12
29

CDN
·  · (WAF), (anti-DDoS)

Client

CDN  

Attacker

CDN

Website

30

15

2018/9/12

CDN



example.com -> D

POST / Host: example.com

POST / Host: example.com

Client

CDN A

CDN

Website D
31





example.com -> B

POST / Host: example.com

Attacker

POST

CDN A

POST

example.com -> A

example.com -> C

CDN C

POST CDN B

· Malicious customers can manipulate forwarding rules to create loop

· Amplification -> consume resource -> potentially DoS

32

16

CDN

2018/9/12

Baidu

CDN

POST /

example.com -> attack.com

Hos t:ex ampl e.com

Attacker

CDN A1
IP of A2
Authority DNS ns.attack.com

POST / Host:example.com Header: Loop-Detection-Tag

CDN A3

CDN A2

Current Defenses Use headers to tag processed requests

Attacker

Extends forwarding loops across multiple

34

countermeasure CDNs

17

2018/9/12

CDN

POST /

example.com -> attack.com

Hos t:ex ampl e.com

Attacker

CDN A1
IP of A2
Authority DNS ns.attack.com

POST / Host:example.com Header: Loop-DetectionTag

CDN A3

CDN A2

Current Defenses Use headers to tag processed requests

Attacker

Extends forwarding loops across multiple

35

countermeasure CDNs

Header

CDN Provider Loop Detection Header

Akamai

Akamai-OriginHop

Alibaba

Via

CDN Provider CloudFlare
CloudFront

Loop Detection Header
X-Forwarded-For CF-Connecting-IP
Via

Azure(China)

Fastly

Fastly-FF

Baidu CDN77

X-Forwarded-For Incapsula CF-ConnectingIP
KeyCDN

Incap-Proxy-ID

CDNlion

Level3

Via

CDN.net

MaxCDN

RCDFNCs7un230 recommends to useTeVnicaehnet aderXfo-Draloa-oTpunnel

detection

36

18

2018/9/12

CDN

· Chain loop-aware CDNs to other CDNs that can be abused to disrupt loop-detection headers
· Abusive features provided by CDNs:

CDN Provider CDN77 CDNlion CDN.net CDNsun Fastly

Reset Via Via Via Via

Filter No-self-defined

MaxCDN

Any
37

CDN

POST / Hos t: example.com

POST /

Attacker

Host: example.com

Via: 1.1 abcd

(CloudFront)

Akamai-Origin-Hop:1

CloudFront

POST / Host: example.com Via: 1.1 abcd (CloudFront)

Filter rules:

Akamai

1.Remove Via 2.Remove Akamai-Origin-Hop POST /
MaxCDN Host: example.com

Via: 1.1 abcd(CloudFront)

Akamai-Origin-Hop:1

38

19

2018/9/12

(Dam Flooding): streaming 

POST example.com -> attack.com
POST

Attacker

CDN A
IIPP ooff DB Authority DNS ns.attack.com

Attacker's website D

example.com -> A CDN C

example.com -> C CDN B
39

gzipStreaming

POST / Hos t:ex ampl e.c om AcceptEncoding:identity
Attacker
CDN C example.com -> A

example.com -> attack.com

CDN A Unzip

Gzip bomb Attacker's website

Authority DNS
ns.attack.com

CDN B

example.com -> C

· 3 CDNs can be used to uncompress gzip bombs · Total Amplification Factor = Loop Amplification * Gzip Bomb Amplification(~ 1000)40

20

2018/9/12
CDNInternet 
CDN
41

·  · 
·  · IETF · IETFnon-compliant · inconsistent
· 
· 
· 
42
21

2018/9/12

-360
22

