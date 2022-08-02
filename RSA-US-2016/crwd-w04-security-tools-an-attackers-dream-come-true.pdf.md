Security Tools: An Attacker's Dream Come True
#RSAC

Agenda

#RSAC

Security Tools: An Attacker's Dream Come True

This is your network... Threats, Risks and Attackers Dreams (um, demos)
Security tools on the host Security tools on internal servers Security tools on Internet gateways
Mitigation Strategies Summary

2

#RSAC
Are you feeling drowsy already?
3

This is how your environment looks like

#RSAC

(Yes, very simplified)

INTERNET

4

Host Based Deployment

#RSAC

(a' la Endpoint Protection Platform)

Related Tools:
· Anti-Virus (AV) · NG-AV · Data Leak Prevention (DLP) · Personal Firewall · Endpoint Detection and Remediation (EDR) · Application Control · Port and Device Control · Mobile Data Protection
5

Host Based Deployment

#RSAC

Attack Effort vs Risk

Lateral Movement Infiltration
ATTACK EFFORT

ENTERPRISE RISK
6

Host Based Deployment

#RSAC

Risk Factors vs Impact (1)

Risk
Cross enterprise deployment

Impact

7

Host Based Deployment Risk Factors vs Impact (2)
Risk
External data collection

#RSAC
Impact
3rd party security & responsibilities

8

Host Based Deployment

#RSAC

Risk Factors vs Impact (3)

Risk
Maintains outbound communication

Impact

9

Host Based Deployment

#RSAC

Risk Factors and Impact (4)

Risk

Impact

Intrusive Implementation

Hooks into process implementations

Homegrown parsers and emulators

Obscured Services

Complex Drivers

10

#RSAC
Attacker's Dream (DEMO) : Exploiting Security Tools Residing on the Host
11

#RSAC
DEMO 1: McAfee Intrusive Implementation
12

Intrusive Implementation

#RSAC

Injection Attack

PRE-DEPLOYMENT

ACTIVATE ADOBE
UNDER THE HOOD
Adobe process Address space
13

Intrusive Implementation Injection Attack

PRE-DEPLOYMENT

DEPLOYMENT

ACTIVATE ADOBE
UNDER THE HOOD
Adobe process Address space

ACTIVATE ADOBE
UNDER THE HOOD
0x10000 RWX
14

#RSAC

Intrusive Implementation

#RSAC

Injection Attack

PRE-DEPLOYMENT

DEPLOYMENT

E X P L O I TAT I O N

1 1Infected PDF

WWW

ACTIVATE ADOBE
UNDER THE HOOD
Adobe process Address space

ACTIVATE ADOBE
UNDER THE HOOD
0x10000 RWX

Take over

15

Intrusive Implementation

#RSAC

Injection Attack

PRE-DEPLOYMENT

DEPLOYMENT

E X P L O I TAT I O N

1 1Infected PDF

WWW

ACTIVATE ADOBE
UNDER THE HOOD
Adobe process Address space

ACTIVATE ADOBE

2 Malicious Code

UNDER THE HOOD
0x10000 RWX
0x10000 Malicious code

16

Take over

Intrusive Implementation

#RSAC

Injection Attack

PRE-DEPLOYMENT

DEPLOYMENT

E X P L O I TAT I O N

1 1Infected PDF

WWW

ACTIVATE ADOBE
UNDER THE HOOD
Adobe process Address space

ACTIVATE ADOBE

2 Malicious Code

UNDER THE HOOD
0x10000 RWX
0x10000 Malicious code

3 Take over

17

#RSAC
DEMO 2: Trend-Micro Password Manager
21

Intrusive Implementation

#RSAC

Obscured Services

DEPLOYMENT

1 Install Trend Micro

2 Apply password manager 3 Open local server for API(s)

?

Intrusive Implementation

#RSAC

Obscured Services

DEPLOYMENT

1 Install Trend Micro

2 Apply password manager 3 Open local server for API(s)

4 Browse the Internet

?

Intrusive Implementation Obscured Services
DEPLOYMENT

#RSAC
E X P L O I TAT I O N

1 Install Trend Micro
2 Apply password manager 3 Open local server for API(s)

5 www.infectedSite.com 4 Browse the Internet

WWW

24

Intrusive Implementation Obscured Services
DEPLOYMENT

#RSAC
E X P L O I TAT I O N

1 Install Trend Micro
2 Apply password manager 3 Open local server for API(s)

5 www.infectedSite.com

WWW

Scan for PwmTower.exe port and 6
run JS for reverse connect

4 Browse the Internet

25

Intrusive Implementation Obscured Services
DEPLOYMENT

#RSAC
E X P L O I TAT I O N

1 Install Trend Micro
2 Apply password manager 3 Open local server for API(s)

4 Browse the Internet

5 www.infectedSite.com

Scan for PwmTower.exe port and 6
run JS for reverse connect

7

//local host: 49159/showSB?url=javascript

WWW

26

Intrusive Implementation Obscured Services
DEPLOYMENT

#RSAC
E X P L O I TAT I O N

1 Install Trend Micro
2 Apply password manager 3 Open local server for API(s)

4 Browse the Internet

5 www.infectedSite.com

Scan for PwmTower.exe port and 6
run JS for reverse connect

7

//local host: 49159/showSB?url=javascript

WWW

8 Take Over

27

#RSAC
The Nightmare Continues...
33

This is how your environment looks like

#RSAC

(Yes, very simplified)

INTERNET

34

#RSAC
Internal-Server Deployment
Related Tools:
· Sandbox · Intrusion Detection/ Prevention Systems (IDS/ IPS) · Web Application Firewall (WAF) · Network Behavior Anomaly Detection (NBAD)
35

Internal Server Deployment

#RSAC

Attack Effort vs Risk

Requires Research

ATTACK EFFORT

ENTERPRISE RISK

36

Internal Server Deployment

#RSAC

Risk Factors vs Impact (1)

Risk
Rarely updated and tested
Dedicated, multi components hardware Open source software Out of date kernels

Impact
Forgotten, vulnerable and unpatched

37

Internal Server Deployment

#RSAC

Risk Factors vs Impact (2)

Risk
Excluded by other security tools

Impact
Who's Watching the Guards

38

Internal Server Deployment

#RSAC

Risk Factors vs Impact (3)

Risk
Full traffic interception

Impact

39

Internal Server Deployment

#RSAC

FireEye Vulnerability of the Beast

DEPLOYMENT

INTERNET

INCOMING TRAFFIC

INTERCEPT & ANALYZE

40

Internal Server Deployment FireEye Vulnerability of the Beast

DEPLOYMENT

INTERNET

INCOMING TRAFFIC

INTERCEPT & ANALYZE

E X P L O I TAT I O N

WWW

INCOMING OBFUSCATED JAVA (Connect to C&C)

Execute plain string

Deobfuscate strings (JODE Open Source)

41

#RSAC

Internal Server Deployment FireEye Vulnerability of the Beast

DEPLOYMENT

INTERNET

INCOMING TRAFFIC

INTERCEPT & ANALYZE

E X P L O I TAT I O N

WWW

INCOMING OBFUSCATED JAVA (Connect to C&C)

Execute plain string

Deobfuscate strings (JODE Open Source)

Connect via NETCAT
C&C

42

#RSAC

Internal Server Deployment

#RSAC

FireEye Vulnerability of the Beast - Demo

Strings Deobfuscation by dynamically executing
Plain text command utilizing FireEye's NetCat
43

#RSAC
Oh, the horror! Let's continue...
44

This is how your environment looks like

#RSAC

(Yes, very simplified)

INTERNET

45

#RSAC
Internet Gateway Deployment
Related Tools:
· Firewall · NG Firewall · Secure Web Gateway (SWG) · Unified Threat Management (UTM)
46

Internet Gateway Deployment

#RSAC

Attack Effort vs Risk

Requires Research
ATTACK EFFORT

ENTERPRISE RISK

47

Internet Gateway Deployment

#RSAC

Risk Factors vs Impact (1)

Risk
Full traffic interception

Impact

48

Juniper Backdoor
DEPLOYMENT

INTERNET

OUTGOING TRAFFIC

NETSCREEN FIREWALL

Vuln.
#1

REMOTE AUTHENTICATION <ANY USER> <STATIC PASSWORD>

INCOMING TRAFFIC

49

#RSAC

Juniper Backdoor
DEPLOYMENT

INTERNET

OUTGOING TRAFFIC

NETSCREEN FIREWALL

Vuln.
#1

REMOTE AUTHENTICATION <ANY USER> <STATIC PASSWORD>

#RSAC

E X P L O I TAT I O N

INCOMING TRAFFIC

WWW

REMOTE AUTH. VIA SSH OR TELNET

50

Juniper Backdoor
DEPLOYMENT

INTERNET

OUTGOING TRAFFIC

NETSCREEN FIREWALL

Vuln.
#1
Vuln.
#2

REMOTE AUTHENTICATION <ANY USER> <STATIC PASSWORD>
REVERSIBLE CRYPTOGRAPHIC ALGORITHM

51

#RSAC

Juniper Backdoor
DEPLOYMENT

INTERNET

OUTGOING TRAFFIC

NETSCREEN FIREWALL

Vuln.
#1
Vuln.
#2

REMOTE AUTHENTICATION <ANY USER> <STATIC PASSWORD>
REVERSIBLE CRYPTOGRAPHIC ALGORITHM

52

#RSAC

E X P L O I TAT I O N

INCOMING TRAFFIC

WWW

REMOTE AUTH. VIA SSH OR TELNET
DECRYPT VPN

#RSAC
Juniper Backdoor
Hardcoded magic password
user@host> request system halt Halt the system? [yes,no] (no) yes
53

Internet Gateway Deployment

#RSAC

Risk Factors vs Impact (2)

Risk
Last line of defense

Impact

54

Internet Gateway Deployment

#RSAC

Risk Factors vs Impact (3)

Risk
Man in the Middle

Impact

55

Internet Gateway Deployment

#RSAC

Risk Factors vs Impact (4)

Risk

Impact

DDoS

Employees do not know they cannot access the Internet

"Blackholing": employees are rerouted to a single site

56

Internet Gateway Deployment

#RSAC

Risk Factors vs Impact (5)

Risk
Rarely updated and tested
Dedicated, multi components hardware Open source software Out of date kernels

Impact
Forgotten, vulnerable and unpatched

57

#RSAC
Waking up from the security nightmare

#RSAC
Apply security policies on security products
Automated patching should be a MUST criteria Pen-test your security product
Don't place the security tools as "exceptions" If you see something, say something -> contact your vendor
Discover and disable unnecessary remote access services (SSH, FTP, Telnet etc.) Discover and enforce security tools remote destinations Monitor and treat security tools administration logs as indication of attack

#RSAC
Summary
Also the best of the security tools can be used as a double-edged sword Recognize that infiltration is inevitable More so, infiltration detection tools won't be able to stop these Work under the assumption that the threat actors is within Learn to prevent the breach itself
60

#RSAC
For a copy of the slide-deck, please email me: roy@ensilo.com
61

