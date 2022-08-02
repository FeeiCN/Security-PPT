Advanced Persistent Validations to counter Advanced Persistent Threats

SpeakerAmritam Putatunda PositionProduct Manager ­ Apps and Security Date2014/09/25
China Internet Security Conference 2014 2014

Todays IT CHALLENGES IT

More devices

GLOBAL Connecting from Accessin

more places

g more

data

From more sources

And attacks continue to rise

..and you can see less of it

...and now its all moving

And your users want it all now

And it has to be fast

And it has to work over wireles...sa...lwalawyasys

The Planet of the Apps "The internet is changing"

· Millions of different Apps with new one cropping up each day. · Every other organization is adopting BYOD · Applications access data differently · Security implications magnify with attacks hidden within apps.

Mobile Malware -The fastest growing type of malware.

How does it change the threat landscape
· Millions of phones/tablets/PC's accessing Data · Until now Malware's were still at the stage of Phishing,
scamming. · Expected to grow exponentially with Apps. · OS security models are beginning to break. · "UI State Inference and Novel Android Attacks"

Attackers becoming vicious each passing day

DDoS Malware
APTs
Botnets

ADVANCED PERSISTENT THREAT ­ Propagation
APT-
Porousness and inherent vulnerabilities in devices magnifying the viciousness of APTs

Infections through Social Media


Infection through Dodgy Websites
"Drive by Downloads"


Sample example of Drive By Downloads


www.very_dodgy_url.com

www.xxx_123.com

www.porn_zxcv.com

Drive By Downloads-Vicious in mobiles

· Url's on phones are shortened · Websites look different Mobile phones. · SMS, Whatsapp, Viber, weibo messages · One unmindful click enough for attackse

Successful Infection Always Follows Deeper Penetration

· Extract personal information · Install Utilities, Malwares · Dig Deeper into the system · Corrupt/Encrypt or Hide Data · Make a Bot and do nothing

Attack Spread Dangers of a perimeter less world
BYOD

Advanced Data Leakages

· Leakage through Video cams · Recording Keystrokes/History · Record meeting/call data · SMS copiers, remote login
utilities, rootkits

Modern APT breeding grounds of Large Botnet
APT
Sophisticated Botnets ­ The Swiss army knife of Attackers

Laptop-1
Mob-1
DDoS
Mob-2

Spam
Bot Master
Theft
Top Banking Botnets 213
Source: Dell SecureWorks Counter Threat Unit(TM) Threat Intelligence
Bot:mob-1 Click Bot:mob-2
Fraud

LDAP/DHCP/DNS

Proxy

Internet

WAN

IPS/Firewall/SLB/IPSec

Tap

GW

Edge

IDS Systems Sandboxes

Core

DMZ Firewall LAN
LAN

Services/LAN Networ

Log Server/SIEM

Database
Inside Entity

Hardware
Infr·aAscttivrue cDtiurercetory
·DHCP ·VPN ·Web Proxy ·IDS/IPS ·Firewall/Router ACL ·IPSec Gateways ·HIDS/HIPS ·Endpoint Protections ·Redundant Hardware

Forensic and Investigation
·Robust Logging ·Proxy Logs ·Authentication Logs ·IDS Alerts ·Host-based Logs ·Firewall Logs ·Full Content Traffic Captures ·Netflow ·Server Event Logs ·Workstation Event Logs

Efficient Network Design
·Proper Network Segmentation ·Well Defined DMZ ·Wifi and Wireless Zoning ·IP Address Schemas ·Public Facing device control ·Overview of NW Infrastructure

Stages in APT Mitigation
APT

Collect

· Collect every logs from all possible sources.

Detect · Flag any activity that is even mildly suspicious

Analyze

· Analyze the perceived threat severity

Remediate

· Take necessary actions

Validate Every Possible Scenarios

LDAP/DHCP/DNS
SIEM/IDS

WAN

Firewall/IPS/SLB/VPN

Services/LAN Network
Firewall - LAN

Internet

Edge

Tap

IDS Systems Sandboxes

Core
Log Server

Database
Inside Entity

Validation Techniques:
·Practice every stages of APT Mitigations · Phishing Attack · Malware Delivery · Data Ex-filteration · Lateral Movements
·Device validation and procurement best practices ·Continuously improve Attack Detection Time(ADT) ·Continuous practice of D.C.A.R cycle (Detect ->Collect -> Assess -> Remediate)

Validating Phishing and Spam Email detection/prevention mechanism

APT Step 1- Phishing and Spam email generation ·Generate different types of phishing emails. ·Create new variants-Pictured Spam, Scrambled Spam ·Extensive Phishing with more than hundred plus phishing techniques ·False positives assessments

Validate Malware/Exploit and Vulnerability delivery mitigation

APT Step 2- User compromise and Bot to C&C message simulation ·Malware/Vulnerability delivery through various apps. ·Weibo, Gmail, SMTP every app/protocol can be a delivery vehicle. ·Simulate Bot to C&C communication.

Validating Alarms, Loggings, Distraction and Decoy efficiency

APT Step 3- Generation of Logs, Decoys and Distractions ·Generate extremely common and low-end attacks ·Generate different severity of Logs. ·Validate logging efficiency from each devices ·Generate volumetric DDOS Attacks.

Validate Data Leakage, Data Ex-filteration, Lateral Movements mitigation

APT Step 4- Data Leakage and Persistency · Leakage simulation through encrypted and non-encrypted apps. · Data Leakage policy validation · Lawful Interception efficiency assessments · Validate multiple data leakage protection against multiple Vehicle and
data types.

Validating Protection against Attack polymorphism

Every Malware, Exploit and Vulnerability can be hidden through evasion techniques.

Validating Resiliency against Vulnerability Exploitatio 

· Vulnerabilities are flaws in software that can be exploited to gain access to the attacked system or create a denial of service.

­ Published Vulnerabilities

­ Unknown Vulnerabilities ­ Zero Day vulnerabilities

Types of Exploits and Vulnerabilities

23

Validations against Botnet Lifecycle Protections


 Cutwail  Zeus  SpyEye  ZeroAccess
DDoS
 Duqu  BlackEnergy  TDL4  PushDO  TDW  Customized Bot validation

Spam

Theft

Click Fraud

Traditional DDOS Assessments
Layer 3 IP / ICMP DDoS IP Frag Attack DDoS ICMP Request Flood Attack DDoS ICMP Response Flood Attack
Layer 4 UDP LOIC UDP53 DoS Attack DDoS UDP Fragmentation DDoS Non-Spoofed UDP Flood DDoS UDP Flood
Layer 4 TCP DDoS SYN Flood DDoS PSH-ACK Attack DDoS Fake Session Attack DDOS SYN-ACK Flood Attack DDoS Rcv Wnd Size

Next Generation DDOS
Layer 7 Apps DDoS DNS Reflect - Attack DDoS DNS Reflect - Zombie LOIC HTTP DoS Attack DDoS SIP Invite Flood DDoS Redirect DDoS DNS Flood DDoS Excessive GET POST DDoS Slow POST DDoS Recursive GET DDOS NTP UE DDOS Generation
Unique DDoS SlowLoris DDoS Smurf Attack DDoS TDL4 CC HTTP Flood MultiVERB DDoS RUDY DDoS LOIC TCP8080 DoS Attack
25

Application Performance Under Attack

· Benchmarking performance of real network traffic · Applications efficiency for attack mitigations · Average Security Effectiveness

TCP baseline
test
Vendor A

Web

Partner Portal

Office

Vendor B Vendor C

Trading

Vendor A Vendor B Vendor C

Avg Sec effectiveness * 48%

52%

28%

Advanced Persistent Validations 

·TCP maximum concurrency
·TCP max connections per second
·TCP and UDP Max Throughput per second
·HTTP Page size max CC, CPS and TPS
·Max GTP performance
·RFC2544 & RFC3511

VANILLA

APPMIX

· Enterprise Mix · Datacenter Mix · Wireless Mix · APAC/Europe/Americas · Carrier Mix · Organization specific Mix · Customized

· Attack+ TCP performance · Fuzzing + TCP/UDP Test · Attack s+ AppMix · Malwares within Attacks · Apps + DOS · Application +
Vulnerabilities · Botnet DDOS

Apps & Attacks

EXTREME

· 100G DDOS · Application DDOS · Strikes + Apps + DDOS · ADT efficiency · Customized Application · Data Generation · Randomized behaviors · Zero Days

NETWORK RESILIENCY VALIDATION 

Network Report Card

The Outside

The Perimeter

The Inside

Category

Net-A Net-B

Application

B

B+

Performance

Attacks

Datacenter

Security

C

B

Effectiveness

Error Handling A

A+

Min Latency C+

B+

Overall Resiliency

C+ B+

Network A

Local Traffic

Web/Mail Servers

Rest Of World Internet Traffic

Network B

Local Lan

Summary 
· The Internet, Applications and Attacks have changed · Our defense in comparison have not changed. · To counter newer attacks resilient networks are needed. · Advanced Validations is the only way to assure network protection against attacks.

