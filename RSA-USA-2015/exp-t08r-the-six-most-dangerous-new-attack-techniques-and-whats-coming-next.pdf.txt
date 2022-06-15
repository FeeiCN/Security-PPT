SESSION ID: EXP 208R
The Six Most Dangerous New Attack Techniques and What's Coming Next

MODERATOR:
John Pescatore
Director SANS Institute @John_Pescatore

PANELISTS: Ed Skoudis SANS Instructor Counter Hack Founder
Mike Assante
Director SANS Institute

Johannes Ulrich
CTO & Dean of Research Internet Storm Center

#RSAC

#RSAC
Topics Covered by Ed Skoudis
 Dribbling Breach Data  Spanking Microsoft Kerberos  Exploiting the Internet of Things

Dribbling Breach Data

#RSAC

 In the old days, stolen data was usually hoarded secretly or dropped all at once

 Now, there is an increased risk of it being released in dribs and drabs
 The Sony breach is a perfect example
 Andrew Breitbart's political releases followed a similar pattern

 This will likely become the new norm
 Makes it harder for incident responders

 Add this kind of scenario to your incident response table top exercises

#RSAC
Spanking Microsoft Kerberos
 Over the past decade, attackers have had a field day attacking LANMAN hashes, NT hashes, LM C/R, NTLMv1, and NTLMv2
 Sniffing, cracking, Rainbow Tables, Man-in-the-Middle (SMB Relay), Pass-the-Hash, etc.
 In the past year, attention has shifted to attacking Microsoft Kerberos
 Used for authentication in large enterprise environments  Was viewed as safer than other Microsoft authentication protocols...  ...due to lack of tools
4

Microsoft Kerberos Attacks
 Pass-the-Ticket Attack  Analogous to Pass-the-Hash
 Golden Ticket Attack  A crafted TGT created by attacker, hashed with the KRBTGT hash  Authenticate to any service as any user  Very persistent; hard to eradicate
 Silver Ticket Attack  Craft a service ticket with special perms
5

#RSAC
MSFT

#RSAC
Exploiting the Internet of Things
 Pwnie Express industry report on Internet of (evil) Things 1) Self-Procured IT and BYOx
 How can you secure it if you don't know it's there?
2) Proliferation of small, cheap, devices, often with:
 No replay prevention in protocols, known plaintext repeated  XSS and Command Injection  These may not seem bad on the surface, but think
about them... generating heat (fire?), bricking, and more
3) The Commoditization of Malicious Hardware
 So low-cost, it becomes disposable hacking technology

#RSAC
Topics Covered by Johannes Ulrich
 Encryption: Security's #1 Frenemy  DDoS: Size doesn't always matter

#RSAC
SSL is Dead (again)

#RSAC
Android: Missing Drivers

Speed MB/Sec
Encrypted Unencrypted

141 26

18 36

Read

Write

#RSAC
Missing Validation / Outdated Code
Threatpost.com

#RSAC
Crypto Ransom-Ware
2014: Desktop cryto ransom-ware becoming a major problem:
 Cryptolocker: ~ 500k victims, > $3million extorted  Cryptowall: 625k victims, > $1million extorted  Torrentlocker

#RSAC
 Crypto Ransom Ware Moving away from Desktop

#RSAC
Server Side Crypto Ransom

#RSAC
New DDoS Threats
 Enterprise learn how to deal with "simple" packet floods, even at sizes exceeding 100 GBps ("buy anti-DDoS protection")
 Currently few large scale disruptions caused by traditional packet flood DDoS

#RSAC
Intelligent DDoS
 Find "slow" (= high resource) API function  Create randomized queries to send requests to this function  Use hijacked browsers (CSRF) to send requests  Mobile clients may participate  No "malware" required

#RSAC
Chinese Firewall Misconfiguration
Furbo.org

#RSAC
Chinese Firewall: DDoS Tool
17

#RSAC
Topics Covered by Mike Assante
 ICS Threats  ICS Incidents  ICS Defense

Most Dangerous New to ICS Attack #RSAC Techniques
1. Greatest number of ICS cyber incidents continue to be nontargeted malware, but...
2. Emergence of targeted ICS attacks 3. Custom ICS exploits & features 4. Gaps & segmentation are expected 5. Targeting trusted ICS relationships
"With Stuxnet, Havex, and BE2 we have moved from the era of accidental infections and insiders to targeted and ICS-customized attacks"

Recent ICS Threat & Actor Landscape #RSAC

High
ICS Effects
ICS Exploits
ICS Delivery
ICS Targeting
ICS Recon
Low

ICS CUSTOMIZATION

OPCLEAVER
Low
(Nuisance)

Sandworm/BE2 (various ICS modules)
Havex
(OPC module)

BE2

ICS IMPACT

(Lost Productivity/Data)

(Lost Value)

Stuxnet
(all versions)
Unspecified
Damaged Furnace
High
(Loss of Safety, Reliability, Assets)
20

Observed ICS Discovery & Delivery #RSAC Techniques

E-mail

Internet

Indirect

www

ICS Webpages

ICS searches [BE2]
direct

0000

STOP 1:0
1 Bul.1764

0001

LIGHT 0:0
0 Bul.1764

START 1:0
0 Bul.1764
LIGHT 0:0
0 Bul.1764
TIMER2/DN T4:3
DN

0002

TIMER1/DN T4:0
DN

LIGHT 0:0
0 Bul.1764

TIMER1

TON

Timer On Delay

Timer

T4:0

Time Base

0:01

Preset

12000<

Accum

0<

TIMER2

TON

Timer On Delay

Timer

T4:3

Time Base

0:01

Preset

18000<

Accum

0<

EN DN
EN DN

ICS Files

Local HMI
(Internet Facing)

Spear Phishing [BE2 & Havex]
Water Holing [Havex]
Trojanized Software [Havex] Infected Files [Stuxnet]
ICS Exploits [BE2]

Enterprise Network
OPC Server Module [Havex] ICS scanning [Havex]
Industrial Control System Networks

Discovered ICS Cyber Incidents

#RSAC

ICS Elements
Reported Incidents

ICS Staff
ICS Infrastructure
ICS Applications
ICS Process & Safety

2010 2014 2014 201? Stuxnet Havex BE2 Steel Mill

Damaged ? Equipment

? Damaged Equipment

Targeted ICS Attack Defenses [BE2]

BE2

Cyber Informed Engineering
Active Defense & Response (Example: ACDC)

Cyber Security Hygiene & Secure Architecture (Example: CSRF)

· Consequence & safety analysis · Trust model modifications
· Presumption of guilt for vuln ICS · Identify ICS hotspots & egress NSM · Threat intel & analysis (IoCs, TTPS) · Internal ICS traffic baseline & NSM · Strong points & software vaults
· Educate employees on spear phishing · Use e-mail anti-phishing tools · Patch browsers, OS, ICS Apps · Proper ICS segmentation · Police Internet-facing ICS components

#RSAC

#RSAC
For More Information
 SANS Institute ­ http://www.sans.org  NetWars CyberCity - http://www.sans.org/netwars/cybercity  Internet Storm Center - https://isc.sans.edu/  Industrial Control Systems Security - http://ics.sans.org/  SANS "What Works"/Critical Security Controls -
https://www.sans.org/critical-security-controls/vendor-solutions
24

