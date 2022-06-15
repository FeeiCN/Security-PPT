Needing the DoH
The ongoing encryption and centralization of DNS
Eldridge Alexander Duo Security @magiceldridge

DNS
The Path to Encryption

Paul Mockapetris and Jon Postel created DNS in 1983.

User

Address for duo.com? 13.249.138.96 DNS Server

Why was it unencrypted?

"The fact that the DNS doesn't have much security was pretty much intentional at the start, because the problem was to get people to accept the whole idea of a distributed system, which at the time was quite controversial. People would say, "If I can't access the network, I can't get work done."
- Paul Mockapetris

Why is this relevant now?

Address for google.com? 216.58.192.174
GET /search?hl=en&q=nefarious search
"Nefarious results"

DNS Server
216.58. 192.174

Source: https://transparencyreport.google.com/https

Address for google.com? 216.58.192.174
GET /search?hl=en&q=nefarious search
"Nefarious results"

DNS Server
216.58. 192.174

Address for google.com? 216.58.192.174
GET /search?hl=en&q=nefarious search
"Nefarious results"

DNS Server
216.58. 192.174

Address for google.com? 216.58.192.174

DNS Server

GET /search?hl=en&q=nefarious search
"Nefarious results"

Reverse Proxy
216.58.192.174

GET /search?hl=en&q=nefarious search

"Nefarious results"

Web Server

Web Server

Address for google.com? 216.58.192.174

DNS Server

Web Server Web Server

GET /search?hl=en&q=nefarious search
"Nefarious results"

Reverse Proxy
216.58.192.174

Web Server

GET /search?hl=en&q=nefarious search

"Nefarious results"

Web Server

Web Server Web Server

Web Server

Address for google.com? 216.58.192.174
Establish TLS with "google.com"
GET /search?hl=en&q=nefarious search
"Nefarious results"

DNS Server
216.58. 192.174

Address for google.com? 216.58.192.174
Establish TLS with "google.com"
GET /search?hl=en&q=nefarious search
"Nefarious results"

DNS Server
216.58. 192.174

Middleware through the years

 DNS query  Destination IP Address  HTTP connection  SNI in the HTTP TLS handshake

Middleware through the years

 DNS query  Destination IP Address  HTTP connection  SNI in the HTTP TLS handshake

Why is this relevant now?

It's basically the only thing left

Middleware

Middleware

Benign
Visibility Malware blocking Data loss prevention

Malicious
Non-stakeholder data aggregation Response alteration Reconnaissance

New Standards

 DNS over TLS (DoT)  DNS over HTTPS (DoH)  DNScrypt

New Concerns

Encrypted DNS Concerns

Centralization

Reduced visibility

Centralization of DNS into a handful of service providers

Reduced visibility for benign network operators

DNS in Layer 7
A relatively unprecedented move of DNS into the Application
Layer

Centralization

 Prevents data aggregation/manipulation by service providers
 Lack of broad support means DoT/DoH users are centralizing data

Reduced visibility

 Enterprise Monitoring  DNS Redirection  DNS as a Control Plane

Moving to the Application Layer

 Slow inroads at system level caused some applications to include it
 For consumers, major privacy win
 Security loss for network operators

Next Steps?

More OS Support

More provider support

VIMES

Demo

Updates

Supporting Platforms Then

 Android 9+

Supporting Platforms Now

 Android 9+  Windows 10  macOS  iOS  Firefox  Chrome

Also

 Curl  Comcast DNS  Cox DNS  Hurricane Electric  Cisco Umbrella  CoreDNS  Quad9

Conclusions

Conclusions

 DoT/DoH removed and added some concerns
 New concerns are less entirely new, and more a move of where functionality is performed
 Benefits can be realized without sacrificing control as long as legacy approaches are modified

Needing the DoH
The ongoing encryption and centralization of DNS
Eldridge Alexander Duo Security @magiceldridge

