SESSION ID: ACB-W09
The Network Is Going Dark: Why Decryption Matters for SecOps

Jesse Rothstein
Co-Founder and CTO ExtraHop Networks @Jesse_Rothstein

Joshua Northrup
Manager of Monitoring and Automation Fiserv

#RSAC

Introduction
Jesse Rothstein

#RSAC
Joshua Northrup

Jesse is responsible for the technical direction and architecture of the ExtraHop platform. Rothstein co-founded ExtraHop in 2007. Before ExtraHop, Jesse held a six-year tenure at F5 Networks where he was a Senior Software Architect and co-inventor of the TMOS platform at F5.

Josh planned, architected and implemented the ExtraHop deployment at Fiserv, one of the world's largest payment clearinghouses. At Fiserv, Northrup designed and implemented an intelligent monitoring and self-healing automation framework.

2

#RSAC
Agenda
· Encryption Trends · TLS 1.3 · Network Detection · Visibility Challenges · Traffic Analysis · Decryption · Fiserv Case Study · Next Steps
3

Encryption Trend
100.00% 75.00% 50.00%

#RSAC
91% of Pages Loaded over HTTPS in Chrome
58% of Top Sites Redirect to HTTPS

25.00%

0.00% Aug-15 Nov-15 Feb-16 May-16 Aug-16 Nov-16 Feb-17 May-17 Aug-17 Nov-17 Feb-18 May-18 Aug-18 Nov-18 Feb-19 May-19 Aug-19

% Sites

% Pages

4

Google Transparency Report, "HTTPS encryption on the web" Scott Helme, "Top 1 Million Analysis", September, 2019

TLS 1.3 Is Here
­ Chrome version 65 (March 2018) ­ Firefox version 60 (May 2018) ­ Java 11 (Sept 2018) ­ OpenSSL 1.1.1 (Sept 2018) ­ Apache 2.4.37 (Oct 2018) ­ Go 1.13 (Sept 2019)

#RSAC
­ Apple SecureTransport (early 2019) ­ Microsoft Edge 79 (mid-Jan 2020) ­ Windows 10 version 1909 (Nov 2019)
(experimental only)

SSL 2.0 SSL 3.0

TLS 1.0

1994

1998

2002

TLS 1.1

TLS 1.2

2006
5

2010

TLS 1.3

2014

2018

TLS 1.3 Highlights
­ Faster handshakes ­ No obsolete ciphers or hashes ­ No compression or renegotiation

#RSAC
­ Downgrade protection ­ Encrypted certificates ­ Perfect Forward Secrecy

SSL 2.0 SSL 3.0

TLS 1.0

1994

1998

2002

TLS 1.1

TLS 1.2

2006
6

2010

TLS 1.3

2014

2018

TLS 1.2 Handshake
Client
ClientHello ClientKeyExchange ChangeCipherSpec Finished Application Data

#RSAC

Server

2-RTT handshake

ServerHello Certificate ServerKeyExchange ServerHelloDone
ChangeCipherSpec Finished [Application Data] Application Data

7

TLS 1.3 Handshake
Client ClientHello {+KeyShare}
Finished [Application Data] Application Data

#RSAC

Server

1-RTT handshake

ServerHello {+KeyShare} EncryptedExtensions Certificate CertificateVerify Finished [Application Data]
Application Data

8

#RSAC
Why Network Detection?

NDR
Network Data

Cyber

Triad

SIEM
Log Files

EDR
Agents

"Network-based detection tools got
the highest levels of satisfaction when compared against other detection approaches.
2019 SANS SOC SURVEY RESULTS

9

North-South vs. East-West
N S
External Services
Network Detection

NORTH-SOUTH Command & Control Exfiltration Initial Access
EAST-WEST Discovery Credential Access Lateral Movement Collection Privilege Escalation

#RSAC

#RSAC
North-South Visibility: HTTP

WEB SERVER

REQUEST GET /index.html Host: example.com
93.184.216.34

RESPONSE 200 OK
What's the IP of example.com?
93.184.216.34

Unencrypted traffic == complete visibility
11

#RSAC
North-South Visibility: HTTPS (TLS 1.2)

WEB SERVER

REQUEST SNI: www.example.com
93.184.216.34

RESPONSE Server Certificate
CN=www.example.org
What's the IP of example.com?
93.184.216.34

Good visibility through DNS, SNI, and Server Certificate
12

X.509 Certificate
Server Certificate Version: 3 (0x2) Serial Number: 0f:d0:78:dd:48:f1:a2:bd:4d:0f:2b:a9:6b:60:38:fe Signature Algorithm: sha256WithRSAEncryption Issuer: C=US, O=DigiCert Inc, CN=DigiCert SHA2 Secure Server CA Validity
Not Before: Nov 28 00:00:00 2018 GMT Not After : Dec 2 12:00:00 2020 GMT Subject: C=US, ST=California, L=Los Angeles, O=Internet Corporation for Assigned Names and Numbers, OU=Technology, CN=www.example.org Public Key Algorithm: rsaEncryption (2048 bit) X509v3 extensions: X509v3 Authority Key Identifier:
keyid:0F:80:61:1C:82:31:61:D5:2F:28:E7:8D:46:38:B4:2C:E1:C6:D9:E2 X509v3 Subject Key Identifier:
66:98:62:02:E0:09:91:A7:D9:E3:36:FB:76:C6:B0:BF:A1:6D:A7:BE X509v3 Subject Alternative Name:
DNS:www.example.org, DNS:example.com, DNS:example.edu, DNS:example.net, DNS:example.org, DNS:www.example.com, DNS:www.example.edu, DNS:www.example.net

#RSAC

#RSAC
North-South Visibility: HTTPS (TLS 1.2) + DoH

WEB SERVER

REQUEST SNI: www.example.com
93.184.216.34

RESPONSE
Server Certificate
CN=www.example.org

Some visibility through SNI and Server Certificate

14

#RSAC
North-South Visibility: HTTPS (TLS 1.3) + DoH

WEB SERVER

REQUEST SNI: www.example.com
93.184.216.34

RESPONSE
Server Certificate
<encrypted>

Limited visibility through SNI

15

#RSAC
North-South Visibility: HTTPS (TLS 1.3) + DoH + ESNI

WEB SERVER

REQUEST ESNI: <encrypted>
93.184.216.34

RESPONSE
Server Certificate
<encrypted>

Very limited visibility through IP addresses

16

Page-Load Fingerprints

95.7% effective!
www.example.com

pictures.example.com maps.gstatic.com stats.g.doubleclick.net static.example.com fonts.gstatic.com

17

#RSAC
Page Load Fingerprint
93.184.216.34 172.217.14.227 74.125.195.155 192.0.43.8 216.58.193.67
Patil, Borisov, "What can you learn from an IP?" https://irtf.org/anrw/2019/anrw2019-final44-acmpaginated.pdf

#RSAC
TLS Fingerprinting Overview: JA3 and JA3S
­ Hash of concatenated fields in the Client Hello message
­ Unique fingerprints based on the TLS library and options
­ JA3+JA3S for stronger application identification
JA3 TLS Client Fingerprint ada70206e40642a3e4461f35503241d5
Source: https://engineering.salesforce.com/tls-fingerprinting-with-ja3-andja3s-247362855967
18

#RSAC
TLS Fingerprinting: False Positives and Evasion

False Positives: 25%+ of blacklisted JA3s found to correspond to various versions of Chrome, Firefox, and IE11

Evasion: fairly trivial for sophisticated attackers

Cipher Stunting: randomized signatures

Source: https://blogs.akamai.com/sitr/2019/05/bots-tampering-with-tls-toavoid-detection.html

Traffic Analysis Overview

#RSAC
· Analyze packet lengths, interarrival times, TCP turn timing, entropy, etc.
· Track data flow · Detect interactivity · Identify encryption

20

Cisco Encrypted Traffic Analysis
­ Initial Data Packet (IDP) ­ Sequence of Packet Lengths and Times (SPLT) ­ Byte distribution ­ "TLS-specific features"

#RSAC
70% of malware will use some type of encryption

Source: https://blogs.cisco.com/security/detecting-encrypted-malwaretraffic-without-decryption
21

#RSAC
Network Detection: Better with Plaintext

Serverside
­ Web application vulns & attacks ­ Injection attacks (e.g. SQLi, command
injection) ­ Desync attacks ­ Data exfiltration ­ Brute-force login attacks

Clientside
­ Threat intelligence ­ DLP & exfiltration ­ File scanning / carving ­ Forensics ­ Command & Control /
Beaconing / Botnets

22

Perfect Forward Secrecy Overview

RSA Key Exchange
Long-term private key

Perfect Forward Secrecy
Unique ephemeral key per session

Client

Client

Web server

Client Client

Web server

Client Client

#RSAC

Session keys are ephemeral and cannot be derived from the private key. Data remains secure even if the long-term private key is compromised.
23

PFS Adoption: 2013 ­ 2020

3.6% 0.6%

2.2%

41.8%

54.0%

58.4%

15.1% 24.3%

#RSAC
Not Supported Some suites enabled Used with modern browsers Used with most browsers

Trustworthy Internet Movement SSL Pulse October 2013

Trustworthy Internet Movement SSL Pulse January 2020
24

#RSAC
SSL/TLS Interception: "Break-and-Inspect"

­ Requires a local CA
­ No public key pinning or certificate transparency
­ No client certs or mutual TLS

­ Limited support for certificate status or revocation
­ Potential for weak keys, incorrect certificate validation, and vulnerabilities

MitM Proxy

User

TLS Handshake

Generated Certificate

TLS Handshake Destination Certificate

Internet

Destination Server

Visibility for local users and BYOD
Local Certificate Authority
25

#RSAC
SSL/TLS Interception: Secure Access Service Edge (SASE)
­ Same SSL/TLS interception challenges and benefits ­ Source IP is obscured ­ Tunnel established by client VPN or Internet Gateway ­ No option for decrypted feed or key logging for analysis (yet)

Secure Web Gateway

Destination Server

Internet

User

Tunnel

TLS Handshake

Generated Certificate

TLS Handshake Destination Certificate

SWG service performs URL filtering and content inspection

26

#RSAC
SSL/TLS Interception: Potential Weaknesses
Test for weaknesses with badssl.com

#RSAC
SSL/TLS Interception: Trend
20%+ of HTTPS connections observed over the past 30 days have been intercepted!
Source: https://malcolm.cloudflare.com/

#RSAC
SSL/TLS Termination & Re-encryption
­ Enable load balancing, content switching, and optimization ­ Minimize SSL/TLS handshakes through connection reuse ­ Centralize certificate management and authentication

Internet

Load Balancer / ADC / Proxy

HTTPS traffic from clients

HTTPS Reencrypt traffic to servers

Visibility for local services

29

#RSAC
Out-of-band Analysis & Forensics
PFS breaks out-of-band network analysis and packet capture that needs to perform decryption for analysis

Client

Traffic Mirroring

PFS strong encryption with ephemeral keys

Server

Network Analysis
NO APPLICATION (LAYER 7) VISIBILITY
Perfect Forward Secrecy breaks DLP, IDS/IPS, malware detection, PCAP analysis, AANPM, etc.

30

Out-of-band Analysis: TLS Downgrade

­ Reencrypt internal connections with TLS 1.2 + RSA ­ Limited visibility to client-side traffic ­ Temporary solution until TLS 1.2 is phased out

Client

Internet

TLS 1.2 + RSA Re-encryption
Load Balancer / ADC TLS 1.3 Termination

Network Analysis

#RSAC
www 1 www 2 www 3

31

Out-of-band Analysis: Session Key Forwarding

­ Maintains the integrity of end-to-end encryption ­ Out-of-band solution using port mirror or network tap ­ Analysis of the real packets

Client

Server
forwarder
Session key
receiver
Monitoring Appliance

Paired, encrypted connection

Client

Visibility for local services

Load Balancer / ADC
forwarder
Session key
receiver
Monitoring Appliance

32

#RSAC
www 1 www 2 www 3

#RSAC
Recommended Next Steps
· Disable DoH
­ Configure enterprise policy and Firefox canary domain
· Use SSL/TLS interception for user / BYOD traffic
­ Test security impact with badssl.com ­ Request key logging from your vendor to enable additional analysis
· Use session-key forwarding for local services
­ Deploy key forwarders for ADCs, proxies, and OS-level crypto providers

#RSAC
Real-Time Analysis and Decryption at Scale

#RSAC
Who is Fiserv?
If you make a transaction with your bank, chances are it's going through Fiserv · 44,000 employees · U.S. $17.5 billion annual revenue · Fortune 500 / S&P 500
35

#RSAC
Decrypting PFS at Fiserv
What does decryption give us? · User authentication auditing · Attack surface hardening
(enumeration attacks, what APIs are accessed from where) · General availability improvements (CIA triad)
36

#RSAC
Decrypting PFS at Fiserv
Why Perfect Forward Secrecy? · Newer standards protect sensitive consumer information · We encrypt traffic deeper in the infrastructure · We ask third-party vendors to use stronger encryption
37

#RSAC
Decrypting PFS at Fiserv
Worked with ExtraHop to develop a solution for decrypting PFS

3,000
session-forwarding agents deployed in infrastructure across several datacenters

6K PFS
sessions per second

HTTPS
and more

Ongoing
and growing effort
· Deployed via automation today
· Moving into CI/CD workflows

38

#RSAC
Apply / Next Steps

WE AS AN INDUSTRY NEED TO PREPARE
Who is still using outdated standards (SSLv3)?
Legacy systems

TLS 1.3 (AND ENCRYPTION IN GENERAL) IS NOT A SILVER BULLET
Confidentiality and integrity But as previously discussed, you can't secure what you can't see
39

VISIBILITY INTO THIRDPARTY SERVICES
Logging is a slow follower to need
3rd party connections are the least logged connections
With wire data you can see what data is going to which third-parties (CCPA and GDPR)

#RSAC
Questions?

