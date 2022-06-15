Compression Oracle Attacks on VPN Networks
Nafeez Defcon 26

About
Nafeez - @sketpic_fx
 Interested in AppSec and writing software
 Maker @ assetwatch.io, Attacker Surface Discovery as a Service

Overview
Compression Side Channel and Encryption
 History of attacks
 VPNs and how they use compression
 Demo - Voracle Tool
 How to find if your "VPN" is vulnerable
 Way forward

Data Compression
LZ77
Replace redundant patterns

102 Characters

Everything looked dark and bleak, everything looked gloomy, and everything was under a blanket of mist
89 Characters

Everything looked dark and bleak, (-34,18)gloomy, and (-54,11)was under a blanket of mist

Data Compression
Huffman Coding Replace frequent bytes with shorter codes

https://en.wikipedia.org/wiki/Huffman_coding


Data Compression
DEFLATE - LZ77 + Huffman Coding
 ZLIB, GZIP are well known DEFLATE libraries


Compression Side Channel
First known research in 2002


The Side Channel
Length of encrypted payloads


Compression Oracle
Chosen Plain Text Attack
 Brute force the secret byte by byte
 Force a compression between the chosen byte and the existing bytes in the secret

Compression Oracle
Cookie: secret=637193 -some-data- Cookie: secret=1
 Cookie: secret=637193 -some-data- (-34,15)1
 Encrypted Payload Length = 43

Compression Oracle
Cookie: secret=637193 -some-data- Cookie: secret=2
 Cookie: secret=637193 -some-data- (-34,15)2
 Encrypted Payload Length = 43

Compression Oracle
Cookie: secret=637193 -some-data- Cookie: secret=3
 Cookie: secret=637193 -some-data- (-34,15)3
 Encrypted Payload Length = 43

Compression Oracle
Cookie: secret=637193 -some-data- Cookie: secret=4
 Cookie: secret=637193 -some-data- (-34,15)4
 Encrypted Payload Length = 43

Compression Oracle
Cookie: secret=637193 -some-data- Cookie: secret=5
 Cookie: secret=637193 -some-data- (-34,15)5
 Encrypted Payload Length = 43

Compression Oracle
Cookie: secret=637193 -some-data- Cookie: secret=6
 Cookie: secret=637193 -some-data- (-34,16)
 Encrypted Payload Length = 42

How can we convert this into an attack using browsers?

Back in 2012
EkoParty 2012

Ingredients
Attacker on the data path can sniff packet length
 Browser attaches cookies as part of any cross-domain request
 Attacker controls HTTP request body

You get!
Chosen Plain Text attack using browsers

TIME Attack 2013 Tal Be'ery, Amichai Shulman
Timing side channel purely via browsers
 Extending CRIME to HTTP Responses
Breachattack.com

BREACH Attack 2013 Angelo Prado, Neal Harris, Yoel Gluck
BreachAttack.com

So far
CRIME style attacks have been mostly targeted on HTTPS
 Researchers have possibly explored all possible side channels to efficiently leak sensitive data


Lets talk VPNs
TLS VPNS
 IPSEC

L2TP/ PPTP

TLS VPNs are pretty common these days

What do most of these SaaS VPNs have in common?

Compression

Almost all VPNs support compression by default

OpenVPN Client Configuration (*.OVPN)

OpenVPN Compression Algorithms
LZO 
 LZ4
 -LZ77 Family-

High level overview
Authentication & Key Negotiation (Control Channel)
 Data Channel Encryption

High level overview
Authentication & Key Negotiation (Control Channel)

Data Channel Compression
Data Channel Encryption

Compress everything
UDP
 TCP
 Bi-Directional

We have a compress then encrypt on all of data channel

CRIME + BREACH on VPN Networks

Existing TLS channel are safe

Things are safe, if the underlying app layer already uses HTTPS / TLS.

Things might go bad, if the VPN is helping you to encrypt
already encrypted data

Lets see how this attack works on an HTTP website using an encrypted VPN

Given a HTTP Website through VPN, Can we leak Sensitive Cookie Data from a Cross-Domain Website?

Ingredients
· VPN Server and Client has compression turned on by
default

· VPN User using a vulnerable browser
 · Visits attacker controlled website

Vulnerable Browser?
Yes, the browser plays a huge role in how it sends plain HTTP requests.


Browser needs to send HTTP requests in single TCP Data Packet

Google Chrome splits HTTP packets into Header and Body
So we can't get the compression window in the same request

Mozilla Firefox sends them all in a single TCP data packet
Now we get the compression window in the same request

Attack Setup
VPN User

Attack Setup
VPN User Vulnerable Browser

Attack Setup

VPN User

HTTP WebApp

Vulnerable Browser

VPN User

Attack Setup
Trusted VPN with Compression

HTTP WebApp

Vulnerable Browser

VPN User

Attack Setup
Trusted VPN with Compression

HTTP WebApp

Vulnerable Browser

VPN User

Attack Setup
Trusted VPN with Compression

HTTP WebApp

Vulnerable Browser

Attacker

VPN User

Attack Setup
Trusted VPN with Compression

HTTP WebApp

Vulnerable Browser attacker.com Attacker

VPN User

Attack Setup
Trusted VPN with Compression

HTTP WebApp

Vulnerable Browser

Passive MITM

attacker.com Attacker

VPN User

Attack Setup
Trusted VPN with Compression

HTTP WebApp

Vulnerable Browser

Passive MITM

Injected Ads, Malicous Blogs,
etc.

attacker.com Attacker

VPN User

Attack Setup
Trusted VPN with Compression

HTTP WebApp

Vulnerable Browser

Passive MITM

Can Observe VPN Data packet Lengths

Injected Ads, Malicous Blogs,
etc.

attacker.com Attacker

VPN User

Attack Setup
Trusted VPN with Compression

HTTP WebApp

Vulnerable Browser

Passive MITM

Can Observe VPN Data packet Lengths

Can Send Cross Domain requests to the HTTP WebApp

Injected Ads, Malicous Blogs,
etc.

attacker.com Attacker

Attacker can now conduct CRIME Style attacks on HTTP requests and responses

Demo

Voracle
https://github.com/skepticfx/voracle

How to tell if your VPN is vulnerable?

Ingredients
Wireshark
 Terminal with Curl
 Connected to your VPN under test
 Observe VPN Payload Length

Curl and Observe Length
curl -s -o /dev/null -X POST http://website.com -d "--some-data-- Secret=37346282; --blah-- Secret=1 Secret=1"
Length = x


Curl and Observe Length
curl -s -o /dev/null -X POST http://website.com -d "--some-data-- Secret=37346282; --blah-- Secret=2 Secret=2"
Length = x


Curl and Observe Length
curl -s -o /dev/null -X POST http://website.com -d "--some-data-- Secret=37346282; --blah-- Secret=3 Secret=3"
Length = x-1


Curl and Observe Length
curl -s -o /dev/null -X POST http://website.com -d "--some-data-- Secret=37346282; --blah-- Secret=1 Secret=1"
Length = x


Fix?

Fixing Compression is an interesting problem

Selectively disable Compression - HPACK in HTTP2

Remember when SPDY was vulnerable to CRIME?
HPACK selectively disabled header compression for sensitive fields

https://http2.github.io/http2-spec/compression.html

For VPNs, Disable compression completely for any plain text transactions

Turning compression off by default is opinionated.

OpenVPN chose to warn the implementors more explicitly to turn off data
Compression.

https://github.com/OpenVPN/openvpn/commit/a59fd147

turned off compression entirely

Its time, everything moves to HTTPS

Takeaway
If you are using VPNs to access plain text websites over the internet, its time to move them to HTTPs.
 Most corporates using VPN still allow plain text HTTP websites, because they think VPN protects them.

Thank you! @skeptic_fx

