
A10  

DDoS 





·Fragmentation ·SYN floods ·Ping floods ·...


·Slowloris ·HTTP GET floods ·R.U.D.Y. ·...


·DNS amplification ·NTP amplification ·...


·  ·  ·...

 DDoS 
1. DDoS 
600Mbps / 200K CPS / 2M Concurrent Sessions
2.  DDoS  ( DDoS Attacks)
a. Network Attack ()(ICMP) b. Amplification Attack ()(DNS-UDP) c. Resource Attack () (TCP) d. Application Attack () (HTTP Slowloris)
3.   :
a. Attacker (Botnet)(90% from TW) TCPHTTP Request (~1K conns per bot )
b.  c.  Server 

!

DDoS DDoS DDoS DDoS DDoS

Internal LAN
Secure from Outside

DMZ

ADC

Web Apps Customer Data

DNS  (Amplification)

Source: IDG, 2016

Request Packet Size = 32 bytes
Open DNS Resolver
Response Packet Size = 3200 bytes

DDoS DDoS DDoS DDoS DDoS

Attacker Request With spoofed Src IP
Response

DNS NXDomain 
Source: IDG, 2016

Attacker
Zombies
NXDomain Requests with spoofed Src IP
NXDomain Recursive

DDoS DDoS DDoS DDoS DDoS

Remote Control
DNS Cache

root(.) / TLD / Auth DNS

HTTP GET Flood / TCP Flood 

Source: IDG, 2016

Zombies
1000 conns per zombie
2M conns (2K zombies)

DDoS DDoS DDoS DDoS DDoS

Attacker
Remote Control

HTTP Slowloris 
Source: IDG, 2016

DDoS DDoS DDoS DDoS DDoS

Zombies
Uncompleted HTTP Requests

Attacker
Remote Control

SSL Renegotiation / SSL Conn Flood 

Source: IDG, 2016

Zombies
SSL Renegotiation & SSL Authentication

DDoS DDoS DDoS DDoS DDoS

Attacker
Remote Control

DDoS DDoS DDoS DDoS DDoS

DDoS 
Source: Kaspersky , Q3 2015

DDoS  ­ CCTV 
Source: SUCURI BLOG , Q2 2016

DDoS 
Source: Akamai Q4 2014

 DDoS 
Source: Akamai

1 Gbps DDoS Traffic : SYN Flood (0.5Kb) : 2M PPS ICMP Flood(2Kb) : 500K PPS DNS Flood (10Kb) : 100K QPS UDP Flood (2Kb) : 500K PPS

DDoS 
Source: IDG, 2016

DDoS DDoS DDoS DDoS DDoS

(Multi-Layer) DDoS 
Cloud OpenHybrid

Traffic Redirection

Core Network

Telemetry

aXAPI / Manual Action
Detector

 
   

Thunder TPS CPE

Thunder TPS CPE

Data Center

Services

Services

   
14

 (CPE)

Real-time Detection
Flood Thresholds
Protocol Anomalies
Behavioral Anomalies
L7 Scripts
Resource Starvation
Black Lists

UDP TCP HTTP DNS

Telemetry

Detector

   

Services

ISP (Clean Pipe)

   

User

Attacker Bot

Thunder TPS
sFlow

BGP Router

Genie ATM

Flow

Router

Web Server

(Cloud Clean Pipe)
Verisign OpenHybrid

API Call

TPS
 

Data Center

DDoS 
 DDoS 

 :
Network level packet sanity check (conformance)

:
Network and application

:
Network level high speed inspection and control

:
Network and application level validation of client origination integrity

:
Network and application monitoring to rate limit traffic


Packet sanity check in hardware and software
 Prevents volumetric attacks and protocol attacks
 Network checks (L3-4) for standard behavior
Examples
 TCP SYN & FIN,  TCP XMAS (URG + FIN + PSH flags),  LAND Attack (source IP = destination IP),  TCP Bad Checksum,  UDP Bad Checksum,  more...
hping3 10.10.10.10 ­s 80 ­p 80 ­S ­a 10.10.10.10 ­-flood

Denied
Packet Anomaly Inspection

Allowed



High speed inspection and control of good and bad sources
 Prevents known bad clients  8 x 16 M entries list capacity  Network level enforcement (L3-4)
Examples
 Import 3rd Black/White Lists,  Dynamic White List creates from SYN Cookie, SYN
authentication & Action-on-ACK, DNS authentication  Dynamic Black List with scanning detection, TCP abnormal packets threshold, HTTP header filter, more...

Known Bad IP Denied
Large List Look-up With Multiple Actions

Allowed

 ThreatSTOP  A10 
·  ·  DDoS 
 ·  Thunder TPS 
Powered by ThreatSTOP

Reputation Lists
Bad Actors Honeypots

Detect

Correlate

Validate

Dynamic Threat Intelligence Cloud

Malware Lists
Dshield Abuse.ch Shadowserver
More...

Thunder TPS

Thunder TPS

Thunder TPS

Dynamic Threat Intelligence Updates

Thunder TPS

21


Validates client origination integrity
 Bot detection  Prevents volumetric and protocol attacks  Network and application checks (L3-7)
Examples
 TCP SYN authentication,  TCP SYN cookie,  UDP authentication,  DNS authentication,  HTTP Challenge,  TCP error packet limit, more...

Denied

Allowed

TCP SYN Cookie

TCP SYN

S=X

S=Y, A=X+1 TCP SYN-ACK (SYN Cookie)

Valid TCP ACK S=X+1, A=Y+1

Data Traffic

If Seq & Ack are valid, then White List

TCP SYN TCP ACK

S=X S=Z, A=X+1
S=X+1, A=Z+1

TCP SYN-ACK

Key(server) + client addr + client port + server addr + server port  hash = Y If Key(server) + client addr + client port + server addr + server port  hash = Y , then valid

HTTP Authentication

HTTP Request

HTTP 302 code w/ cookie

HTTP Request w/ cookie

TCP 3-way Handshake

Check HTTP Request

Valid

: Forward

Invalid

: Drop

TCP 3-way Handshake
HTTP Request



Monitor and rate limit traffic
 Network and application level enforcement (L3-7)  Configurable over-limit actions for TCP, UDP, HTTP and DNS  Rate limit per connection (TCP or UDP) for ultra-granular control  Bandwidth or packet rate control

Examples
 Connection limit,  Connection rate limit,  Fragment rate limit,  Packet rate limit,  Bandwidth limit,  HTTP Request rate limit,  DNS request limit per DNS Record Type,  SSL request rate limit, more...

Rate and/or Connection Limits for Predictable Load

( 0.1sec vs 1sec)
Rate interval = 1 sec Rate limit = 10K / 1 sec = 1K / 0.1sec Attack (Burst) : 10K / 0.1sec Passed :10K , Dropped : 0K
dropped 10K

5K

Passed

0.1sec

1sec

Rate interval = 0.1 sec Rate limit = 1K / 0.1sec = 10K / 1sec Attack (Burst) : 10K / 0.1sec Passed :1K , Dropped : 9K

10K dropped
5K

1K 0.1sec

Passed

1sec



Monitor and check traffic behavior
 400+ global, destination-specific and behavioral counters
 All counters available through GUI, CLI, sFlow export  Enforce specific values  Network and application checks (L3-7)
Examples
 TCP template, HTTP template, DNS template, UDP template, SSL-L4 template, Scan detection, aFleX scripting, more...
 HTTP Slowloris  SSL authentication as bot detection  SSL Renegotiation

Denied
DPI and Application Awareness for L7 Protection

Allowed

SSL Handshaking
Asymmetric Encryption (2048 bits)
1. Request server public certificate

Server public certificate (key) Private Key (Signed by CA)

Server certificate Validation

2. Server public certificate

symmetric key 3. Send symmetric key

symmetric key

Symmetric Encryption (256 bits) (Data)

SHA-256(SHA-2)

SSL Renegotiation
Client Hello
Send Symmetric Key Send Symmetric Key Send Symmetric Key Send Symmetric Key Send Symmetric Key

Server public certificate (key) Private Key (Signed by CA)
Server Hello

TCP RST

TCP RST

SSL Authentication

Client Hello
Send Symmetric Key Encrypted Data

Server Hello

Server public certificate (key) Private Key (Signed by CA)

If pass SSL Authentication, then White List

Client Hello
Send Symmetric Key Encrypted Data

Server Hello

DNS NXDomain Mitigation

DNS Cache

NXDomain Requests NXDomain Requests NXDomain Requests
NXDomain Requests

NXDomain Response
NXDomain Response
NXDomain Response
If NXDomain >= 3 per second , then Black List or Rate Limit
X

HTTP Slowloris
HTTP Request ( 1/2 ) HTTP Request ( 2/2 )
HTTP Request ( 1/2 )

TCP 3-way Handshake
TCP 3-way Handshake
HTTP Request ( 1/2 ) HTTP Request ( 2/2 )
Request header timeout, Then drop or black list
X



Smarter Detection

Dynamic Mitigation

Automated baselining

Progressive countermeasures

Extended Policy Actions
Including Verisign escalation

Protected Zones
Superset of "ddos dst"

 : Automated Baselining
Sales Benefit
 Sell to organizations with limited security staff
Main Features
 Leverage multi-protocol counters providing deep visibility
 Apply this baseline intelligently to trigger security policies

Baselining: Indicators and Threshold
Baselining /behavioral learning for detection
 Building traffic pattern profiles (peacetime learning) for
­ Dst zone threshold ­ Per source threshold
Threshold for automatic escalation
 Traffic pattern profile = zone-profile consists of multiple indicators with the threshold
Zone profile and individual threshold can be manually configured

TCP (incl. HTTP port)

Packet Rate SYN Rate FIN Rate RST Rate Small Window ACK Rate Empty ACK Rate

Small Payload Rate Bytes-to / Bytes-from SYN Rate / FIN Rate Session Miss Rate Packet Drop Rate Pkt Drop / Pkt Rcv'd Concurrent Sessions

UDP (incl. DNS port)
Packet Rate Packet Drop Rate Bytes-to / Bytes-from Pkt Drop / Pkt Rcv'd Concurrent Sessions

ICMP
Packet Rate Packet Drop Rate Bytes-to / Bytes-from Pkt Drop / Pkt Rcv'd

IP/Other
Packet Rate Packet Drop Rate Bytes-to / Bytes-from Pkt Drop / Pkt Rcv'd Fragment Rate

: Progressive countermeasures
· 
Thunder TPS
DDoS DST Zone

Zone Threshold
Per SRC Threshold
Auto Learning (Baselining) or Manual

Mitigation Policy
Level 0

Level 1

Level 2

DST

Level 3

Level 4

Extended Policy Actions
Sales Benefit
 More flexibility for DevOps, or easy automation for limited staff
Main Features
 More elaborate action-lists ­ Logging ­ Capture packets ­ Drop the packet ­ Ignore ­ continue processing the packet ­ Reset the connection ­ Whitelist or blacklist the source ­ Custom script execution using bash

DDoS Dashboard - Incidents
List of incidents report for traffic visibility
Custom Incident Auto created Incident

DDoS Protection ­ Mitigation Console
Traffic Summary of the incident

Packet Debugger

Easy-access Mitigation Rule Setting
Traffic stats, indicators and
Top-K

A10 Thunder TPS Solution

Cloud OpenHybrid

Traffic Redirection

Core Network

Telemetry

aXAPI / Manual Action
Detector

 
   

Thunder TPS CPE

Thunder TPS CPE

Data Center

Services

Services

   
45

Thank you

