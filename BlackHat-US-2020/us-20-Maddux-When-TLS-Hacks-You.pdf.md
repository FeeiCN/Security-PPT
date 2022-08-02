When TLS Hacks You
JOSHUA MADDUX

Demo

Overview

 Where I Started  Testing Approach  Implications
 Concrete Vulnerabilities  Defense

SSRF
 Send a URL, server hits it

SSRF
 Send a URL, server hits it
 Common in webhooks & Apple Pay support

https://www.youtube.com/watch?v=m4BxIf9PUx0

Webkit.org: Apple Pay SSRF

Easy! Just sent webkit.org "http://169.254.169.254"

EC2 IMDS V1

Webkit.org: Apple Pay SSRF
EC2 IMDS V1

Webkit.org: Apple Pay SSRF

Website 2: no data back 

EC2 IMDS V1

Webkit.org: Apple Pay SSRF

Website 2: no data back 

Website 3: PUT request 
405 not allowed

PUT EC2 IMDS V1

Webkit.org: Apple Pay SSRF

Website 2: no data back 

Website 3: PUT request 
405 not allowed

Website 3: validation 

PUT EC2 IMDS V1

Getting around limitations

Past approaches

Weird protocols
 gopher://localhost:11211/ _%0aset%20foo%20...
· Doesn't work against modern libraries

SNI injection
 https://127.0.0.1 %0D%0AHELO orange.tw%0D%0AMAIL FROM...:25/
· From Orange Tsai's talk "A new era of SSRF" https://www.youtube.com/watch ?v=2MslLrPinm0
· Really cool, but depends on specific bugs

Step 1 jmaddux.com

jmaddux.com

Step 2 ???
Saved Payload

Same session?

Step 1 jmaddux.com:25

35.x.x.x

DNS server

Step 2

35.x.x.x

Step 3 jmaddux.com:25

35.x.x.x

DNS server

Hello + Payload SMTP on localhost

Testing approach

Internet

Alternating DNS Server

Custom TLS

IP of Custom TLS box 127.0.0.1

redis config

Internet

Alternating DNS Server

Custom TLS

IP of Custom TLS box IP of Netcat box

redis config

Just netcat

Code available at: https://github.com/jmdx/TLS-poison

Alternating Fork of https://github.com/SySS-Research/dns-mitm
DNS Server

Custom TLS

Fork of https://github.com/ctz/rustls
Thanks to Akash Idnani for writing the redis-based configuration stuff

Implications

What's now vulnerable
Almost-SSRF

Outbound TLS
sessions

Stuff on local ports

· OIDC discovery (sometimes)
· Webpush · Webmention
· Apple Pay Web · In browsers, just
phishing people (Then we call it CSRF)
· Wifi captive portals
· SSDP

Surprisingly common

Almost-SSRF

· SVG conversion · URL-based XXE · Scraping · Webhooks · PDF renderers with images
enabled

Outbound TLS
sessions

Stuff on local ports

Almost-SSRF

Getting more common

Outbound TLS
sessions

Stuff on local ports

What things cache TLS sessions?

HTTPS Client library/application Java HttpsUrlConnection Webkit
Chrome
Firefox

Can haxx you? Yes
Yes Yes No

Curl/libcurl IOS, Android SSDP Python `requests' package Go http client
node-fetch, axios

Yes Yes No
Not yet
Yes

Caches by IP address, not domain (should be both)
Open issue on github to cache sessions Node has built-in cache

Almost-SSRF

What stuff?

Outbound TLS
sessions

Stuff on local ports

Internal SSRF Targets

Package Memcached Hazelcast Redis SMTP FTP Mysql, Postgres, etc.
FastCGI Zabbix Syslog

Susceptible? Yes Yes No Yes Yes Maybe
Maybe No Yes

Notes Common Route to RCE! Common in Java apps Closes connections after null bytes All implementations I've seen All implementations I've seen Let me know if you make this happen
Similar reasons as redis Less severe

Concrete Vulnerabilities

Real-world SSRF: Youtrack

000001a0: ff01 0001 0000 2900 ab00 8600 8048 454c 000001b0: 4f20 6a65 7462 7261 696e 732e 636f 6d0a 000001c0: 4d41 494c 2046 524f 4d3a 203c 7465 7374 000001d0: 406a 6574 6272 6169 6e73 2e63 6f6d 3e0a 000001e0: 5243 5054 2054 6f3a 203c 6a6f 7368 2b65 000001f0: 7468 6963 616c 4070 6b63 2e69 6f3e 0a44 00000200: 4154 410a 5375 626a 6563 743a 204a 6574 00000210: 6272 6169 6e73 0a48 656c 6c6f 0a2e 0000 00000220: 0000 0000 0000 0000 0000 0000 0048 b833

......)......HEL O jetbrains.com. MAIL FROM: <test @jetbrains.com>. RCPT To: <josh+e thical@pkc.io>.D ATA.Subject: Jet brains.Hello.... .............H.3

Real-world SSRF: Nextcloud
 Federated sharing  @someone@example.com

Real-world SSRF: Nextcloud
 Federated sharing  @someone@example.com  @someone@example.com:11211

Real-world SSRF: Nextcloud
 Federated sharing  @someone@example.com  @someone@example.com:11211 Use TLS rebinding, write to memcached!

Real-world SSRF: Nextcloud
 Federated sharing  @someone@example.com  @someone@example.com:11211 Use TLS rebinding, write to memcached! Fix: no great options
Still added a request timeout and gave me a bounty

Demo: Phishing->CSRF->RCE
 Assumptions  Victim is a developer for a project that makes use of django.core.cache, configured to use memcached  Victim views web-based emails in a susceptible browser like Chrome  Attacker knows/guesses this  Victim is smart enough not to download attachments

Further work

 Chain with memory corruption
 NAT pinning
 DOS amplification
 High amplification factors?
 Better testing infrastructure
 infrastructure-as-code

 Image-based CSRF on bad IOT devices
 telnet?
 Hit internal HTTP servers with a session ticket payload
 Attack message queues
 Correct me ­ my DM's are open @joshmdx

Defense

My proposal for TLS clients
 Change cache key
Currently: (hostname, port) Better: (hostname, port, ip_addr)

My proposal for TLS clients
 Change cache key
Currently: (hostname, port) Better: (hostname, port, ip_addr) If you care about big TLS deployments
(hostname, port, addr_type(ip_addr))
Similar to https://wicg.github.io/cors-rfc1918/
Credit to chromium team

Security costs of TLS session resumption
 "Measuring the Security Harm of TLS Crypto Shortcuts"  Detrimental to PFS
 "Tracking Users across the Web via TLS Session Resumption"  Detrimental to privacy
 "Insecure TLS session reuse can lead to hostname verification bypass" - NodeJS
 complexity  bugs
 Also everything in the previous slides

Benefit of TLS session resumption
 Full handshake: ~2x real time, ~23x CPU time
 https://blog.cloudflare.com/tls-sessionresumption-full-speed-and-secure/

Benefit of TLS session resumption
 Full handshake: ~2x real time, ~23x CPU time
 https://blog.cloudflare.com/tls-sessionresumption-full-speed-and-secure/
 Might not care if you're a:
Regular internet user Web application making API calls

Disabling outbound TLS session resumption
 libcurl: CURLOPT_SSL_SESSIONID_CACHE=false
 firefox: security.ssl.disable_session_identifiers=true  Tor browser: disabled by default  Java, Nodejs, Chrome, others: no option 

For web apps that can't disable it
 Careful around stuff like webhooks, apple pay  Set up a proxy for outbound requests, e.g.
https://github.com/stripe/smokescreen  Avoid running unauthenticated internal TCP stuff,
especially if it's newline-delimited

Takeaways
 Modern TLS is useful for SSRF attacks  Following the latest specs is a good way to
break things  We need to reconsider the merits of TLS session
resumption

Thank you!
Joshua Maddux, @joshmdx Security Engineer - latacora.com ­ security teams for startups

