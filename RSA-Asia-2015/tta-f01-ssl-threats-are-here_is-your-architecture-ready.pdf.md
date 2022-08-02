SESSION ID: TTA-F01
SSL Threats are Here--Is Your Architecture Ready?

Manoj Sharma
World Wide Solutions Architect Blue Coat
1

Kevin Bocek
VP, Security Strategy & Threat Intelligence Venafi @kevinbocek

#RSAC

#RSAC
What You Need to Learn
 Why encryption and digital certificates are helping our adversaries  How to architect for today and tomorrow's SSL/TLS threatscape  What you need to successfully run your operations  What's your 45 day action plan
2

#RSAC
SSL/TLS Threats Update

#RSAC
Problem:  = Scotoma = Blind Spot

#RSAC
Bad Guys Are Evading Defenses
5

#RSAC
50-75% and climbing
Of enterprise network traffic is encrypted with SSL/TLS today
6

#RSAC
166% North America 415% Europe
Increased use of SSL/TLS since 2014
7

#RSAC
100% US government web traffic encrypted by 2017 How many governments will
follow?

#RSAC
Visualization of a Global Telco's SSL/TLS
1 dot = 1 certificate for SSL/TLS Over 6 million certificates
9

#RSAC

LESS THAN 20%
Of Organizations with a FW, IPS/IDS, or UTM decrypt SSL/TLS traffic

December 2013

10

ID G00258176

#RSAC
"50% of network attacks will use SSL/TLS by 2017"
December 2013 ID G00258176
11

#RSAC
SSL/TLS: Hidden Dangers

 Bad AcTtohrs earenuseinwg enCcryrpytiopn tfoor: Wall 3.0 campaign uses

Google Drive as an infection vector  Hiding Malicious Actions and Messages
 Hiding the Initial Infection

 Hiding the Command and Control Channel  Hiding Data Exfiltration

https://www.digicert.com/ota/Online-SecurityInfographic.pdf

Google Drive = HTTPS  >36000 blacklisted SSL certificates: https://sslbl.abuse.ch/

 Most (recently) are Dyre C&C, KINS C&C, Vawtrak MITM, Shylock C&C, URLzone C&C, TorrentLocker C&C, CryptoWall C&C, Upatre C&C, Spambot C&C, Retefe C&C, ZeuS MITM, etc.

 Users: Are they SSL Aware?

* TCP Ports used by Dyre Trojan for Hidden Command & Control
- Blue Coat Labs
12

Ransomware Loves Encryption

#RSAC

 Recent CTB-Locker attack used https * URLs for payload  Payload was fake .tar.gz file (actually an encrypted * blob)  Payload is decrypted, and then used to encrypt * your files
 (using "Elliptic Curve Crypto")
 C&C is handled via TOR *  Payment is via Bitcoin (a crypto-currency *)  ... Curve+Tor+Bitcoin = "CTB Locker"

13

#RSAC
Active Threat: Redirection Over SSL/TLS
"Advertising Gone Wild": Redirects hidden inside SSL/TLS sessions
14

#RSAC
"Next Big Hacker Marketplace Will Be In Stolen Certificates"
15

#RSAC
Stolen Marketplace for Certificates
Up to $980/ea
400x more valuable than stolen credit card 3x more valuable than bitcoin
16

#RSAC
CAs: What's Trusted?
CNNIC: untrusted by Google and Mozilla; trusted by Apple & Microsoft
17

Architecting for SSL/TLS

#RSAC

Threats

#RSAC
Security Architecture: Current State

Security Analytics
SIEM
Forensics
End User Monitoring

External Events Intelligence Feed

White List / Black List

Incident Management
System
Threat Management
System

IP Reputation

Threat Intelligence
Feeds

App/URL/File Reputation

User Behavior Analytics
Big Data Analytics

Reverse

Internal

Proxy/WAF

Events

Ddos

Intelligence

Web Fraud

Network AV Analytics

Endpoints

Specialized Threat
Monitoring

NetFlow Monitoring

AV
DLP NAC

Email Gateway

DLP
Secure Web Gateway

Cloud Security Brokers

Identity Broker
Privilege Management
User Behavior Analytics
Advanced Malware Defense

Mobile Users Mobile Devices

#RSAC
Architecture Gap Analysis

Today

Ready for Threats

Role of SSL/TLS Inspection Non-Existent

Strategic

Inspection Points

Tactical

Consolidated

Performance

Struggling

Wirespeed

Outbound Inspection: Internal trusted root CA

Deployed

Whitelisting/Blacklisting

Inbound Inspection: all keys Few & certs available

All available

Inbound Inspection: keys & Email, flash drive, file server Encryption distribution w/o

certs securely distributed

people

20

Security Architecture: Desired State

Security Analytics
SIEM
Forensics
End User Monitoring

External Events Intelligence Feed

White List / Black List

Incident Management
System
Threat Management
System

IP Reputation

Threat Intelligence
Feeds

App/URL/File Reputation

User Behavior Analytics
Big Data Analytics

Reverse

Internal

Proxy/WAF

Events

Ddos

Intelligence

Web Fraud

Network AV Analytics

Endpoints

Specialized Threat
Monitoring

NetFlow Monitoring

AV
DLP NAC

Email Gateway

DLP
Secure Web Gateway

Cloud Security Brokers

Identity Broker
Privilege Management
User Behavior Analytics
Advanced Malware Defense

Mobile Users Mobile Devices

#RSAC

#RSAC
What do you think things look like?
Secure Communications

#RSAC
This is what it really looks like
SSL & SSH Keys & Certificates

SSL Keys & Certificates

Secure Communications Server Authentication Client-side Server Authentication
Secure Communications Server Authentication
Client-side Authentication

#RSAC
Inbound and Outbound Traffic

Inbound SSL Decryption Web & Email Servers, Customer Web Portals

IPS & IDS AV DLP APM
SIM & SIEM Forensics

Security Solution

Outbound SSL Decryption Encrypted Email,
Social Networks, CRM, etc.

IPS & IDS AV DLP APM
SIM & SIEM Forensics

Security Solution

Internet

Web, Email & Portal Servers

Internet

Clients

#RSAC
Architecture for Visibility

CLIENT
CLOUD THREAT INTELLIGENCE

SSL VISIBILITY APPLIANCE
CORPORATE SERVERS

INTERN ET
SERVER

GATEWAY /
FIREWALL






 Architecture Requirements

 Inbound and outbound inspection

SECURITY ANALYTIC
S

 Ensure the decrypted-data is not allowed to be changed
 Inspects traffic that uses latest cipher suites and key exchange methods

SANDBOX NG IPS

 Integrates with enterprise PKI infrastructure

CLIENT Encrypted traffic Decrypted traffic

25

SSL Blind Spots in Action: Data Infiltration + #RSAC Exfiltration using SSL
 Malware Infiltration and Data Exfiltration using Wireshark
 Compare pcaps from identical operations with and without SSL Inspection enabled in the network.  Download from a file magnetic* from sourceforge.net (HTTP Download)  Download a known file using HTTPS: Infiltration  Upload sensitive data using HTTPS: Exfiltration
26

#RSAC
VIDEO
27

#RSAC
SSL Blind Spots: Data Exfiltration Experiment
Symantec DLP Network Prevent Details: Base OS: MS Windows 2012 R2 DLP Network Prevent Software Version: 14.0 (Beta)** DLP Network Prevent configured to monitor HTTP and HTTPS ports.
SSL Inspection Device: Hardware Mode:SV800 / Software Version 3.8.2-409
Experiment: 1. Upload sensitive data using HTTP 2. SSL Inspection Disabled: Upload sensitive data using HTTPS 3. SSL Inspection Enabled: Upload sensitive data using HTTPS
NOTE: SYMANTEC DOES NOT CLAIM THEY CAN INSPECT SSL TRAFFIC ON THEIR DLP PRODUCTS
28

#RSAC
VIDEO
29

#RSAC
Ongoing Operations

#RSAC
Balancing Compliance and Data Privacy

DATA PRIVACY CONCERNS

RISK OF ADVANCED
THREATS

LEAD TO REQUIREMENTS

1) Manage what type of information is decrypted

2) Assure custody and integrity of encrypted data

31

#RSAC
Economics of SSL/TLS Inspection

 Cost of No-Action=Infection=Intrusion=Breach=$

 Direct NETWORK SECURITY BLIND-SPOT COST =
 Low performance -> higher cost to reach needed throughput

%IoncfoSmSpLletTersaufpfpiocrt*foAr lnatnesutaclipIhnevrsecsrtemateesnutnsienetnobNlinedstpwotosrk

 Indirect

Security Products

 Time and effort to identify, gather, distribute, and update keys &

certificates

32

#RSAC
Maintaining Decryption
 Capture new keys and certificates (including those generated outside of IT security)
 Update renewed, rekey keys and certificates throughout SSL/TLS chain (e.g. firewall, load balancer, WAF, etc.)

#RSAC
45 Day Action Plan

#RSAC
Readiness: Map your INBOUND SSL/TLS
 Where and how many SSL/TLS enabled entities? What are all systems involved in SSL/TLS through DMZ?(e.g. firewall, load balancer, WAF, etc.)
 What are the security controls that need visibility in to encrypted traffic?
 How will you track keys and certificates? How frequently are they renewed and rekeyed?
 Who and how many are responsible for each key and certificate?
 How will you get them? How will you transfer keys and certificates?
 How will you update keys and certificates?
35

#RSAC
Readiness: Map your OUTBOUND SSL/TLS
% of Total North-South AND EAST-WEST Traffic is SSL/TLS encrypted
SSL/TLS traffic that isn't on port 443 Non-SSL traffic that is using port 443 SSL/TLS Versions seen on the network  SSL Versions
have known vulnerabilities. Certificate Status  Valid certificate v/s invalid certs Ciphers used  Strong v/s Weak Top N  SSL Sites by Request/Users of SSL/TLS
36

#RSAC
Your 45 Day Action Plan
 Map your SSL/TLS footprint = Risk Exposure  Decrypt once feed many v/s decryption in many places in network  Performance impact of decryption on existing network/security
devices  Local Regulations and Compliance requirements  Outbound: HR and Legal must be consulted to ensure user privacy
is respected and preserved.  Inbound: Obtaining keys/certificates, how will you keep them
secure, how will you keep them updated
37

Thank You

Kevin Bocek

Manoj Sharma

#RSAC

38

