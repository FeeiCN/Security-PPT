Monsters in the Middleboxes
Building Tools for Detecting HTTPS Interception

Luke Valenta lvalenta@cloudflare.com
Twitter: @lukevalenta

Gabbi Fisher gabbi@cloudflare.com
Twitter: @gabbifish

How HTTPS Interception Works

Administrator installs new root certificate
Client
TLS

Middlebox generates certificate for example.com Middlebox
TLS

Server has certificate for example.com
Server

Plaintext HTTP
Middlebox inspects inner HTTP content

Types of HTTPS Interception
Antivirus/Corporate/Government
 Detect malware  Detect C&C traffic  Detect exfiltration  Anti-terrorism  Censorship

Types of HTTPS Interception
Malware

 Inject ads  Steal private data

Types of HTTPS Interception

Leaky Proxies

 Product features  Convenience

Types of HTTPS Interception

Reverse Proxies

 Security  Performance  Reliability

Detecting HTTPS Interception [Durumeric et al., 2017]

Client

Middlebox

TLS

TLS

Server

Plaintext HTTP HTTP User Agent: Chrome

HTTP:

?

TLS:

Server can detect mismatch between layers

Identifying HTTP and TLS Clients

HTTP Parse User Agent Header
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36
TLS No identifying field is present in the protocol. Instead, use known techniques for fingerprinting browsers based on TLS Client Hello.

1. [Risti; 2009] 2. [Majkowski; 2012] 3. [Brotherston; 2015] 4. [Anderson, McGrew; 2016]

5. [Durumeric et al.; 2017] 6. [Althouse & Atkinson, Atkins; 2017] 7. [Frolov, Wustrow; 2019] 8. [...and others]

TLS Handshake (RFC 5246)
TLS libraries tend to keep these fields the same!

TLS Fingerprinting based on Client Hello

[...]

[...]

[...]

HTTPS Interception Detection Process

1. Build database of HTTP and TLS browser fingerprints

2. Check HTTP and TLS fingerprints of incoming requests against database

MITMEngine: HTTPS Interception Detection Library
Open sourced at https://github.com/cloudflare/mitmengine. PRs welcome!
 Goal #1: Maintainability
 Fingerprints quickly go stale with browser updates  Time-consuming to generate new fingerprints manually  Goal is to automatically generate ground truth fingerprints from Cloudflare's network
 Goal #2: Flexibility
 Currently support a flexible fingerprint format to model a variety of browser behavior  Plan to add support for other TLS fingerprint formats (JA3, tlsfingerprint.io)
 Goal #3: Performance
 The system should be fast enough to deploy at scale  Currently deployed on a sample of Cloudflare traffic

MALCOLM: HTTPS Interception on Cloudflare's Network
Public dashboard located at https://malcolm.cloudflare.com.
 Provides insight into HTTPS Interception observed by Cloudflare  Powered by MITMEngine  Allows for filtering by OS, browser, HTTPS interception tool, etc.

MALCOLM: Overall HTTPS Interception Rates

MALCOLM: HTTPS Interception by Browser/OS

Case Study: Kazakhstan
 Summary of incident w/ live results at https://censoredplanet.org/kazakhstan  KZ chooses which domains to MITM based on SNI (server name indication)  Encrypted SNI (eSNI) is on the horizon -- makes selective interception harder  New MALCOLM feature (soon): filter MITM results by country

KZ only All

Black Hat Sound Bytes
TLS-terminating middleboxes pose serious threats to network security
Heuristics based on HTTP and TLS fingerprints can be effective at detecting HTTPS interception
Our new open source tool and public dashboard provide new insights into the state of HTTPS interception on the Internet

References
 [Risti; 2009] HTTP client fingerprinting using SSL handshake analysis. https://blog.ivanristic.com/2009/06/http-client-fingerprinting-using-ssl-handshake-analysis.html
 [Majkowski; 2012] SSL fingerprinting for p0f. https://idea.popcount.org/2012-06-17-ssl-fingerprinting-for-p0f  [Brotherston; 2015] TLS Fingerprinting: Smarter Defending & Stealthier Attacking.
https://blog.squarelemon.com/tls-fingerprinting/  [Anderson, McGrew; 2016]. TLS Fingerprinting in the Real World.
https://blogs.cisco.com/security/tls-fingerprinting-in-the-real-world  [Durumeric et al.; 2017] The Security Impact of HTTPS Interception.
https://jhalderm.com/pub/papers/interception-ndss17.pdf  [Althouse, Atkinson, Atkins; 2017]. TLS Fingerprinting with JA3 and JA3S.
https://engineering.salesforce.com/tls-fingerprinting-with-ja3-and-ja3s-247362855967  [Frolov, Wustrow; 2019]. Tlsfingerprint.io  [Raman et al.; 2019] Kazakhstan's HTTPS Interception. https://censoredplanet.org/kazakhstan

