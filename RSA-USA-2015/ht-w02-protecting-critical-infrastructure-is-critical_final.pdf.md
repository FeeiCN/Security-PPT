SESSION ID: HT-W02
Protecting Critical Infrastructure is Critical
Robert M. Hinden
Check Point Fellow
#RSAC

#RSAC
American Blackout
National Geographic - American Blackout (trailer)
Full Video at: http://www.youtube.com/watch?v=FYoXxVnTePA
2

#RSAC
Critical Infrastructure is at Risk!
· Critical Infrastructure is part of our world · Many Vulnerabilities
- Just like other IT systems, but · The consequences of an attack are much greater
- Power failures - Water pollution or floods - Disruption of transportation systems - Deaths of people on life support systems
3

#RSAC
Talk Overview
Why this issue is Critical Real Attacks SCADA Industrial Control Protocol Security Issues with Control Systems Platforms Recommendations and Actions
4

#RSAC
Industrial Control Systems are Everywhere
5

Critical Infrastructure is Targeted

Communications 14 Commercial Facilities 7 Chemical 4 Unknown 6
Water 14

Manufacturing 65

Transportation 12

Nuclear 6 Information Technology 5

Energy 79

Healthcare 15
Government Facilities 13 Finance 3 Food and Agriculture 2

#RSAC

https://ics-cert.us-cert.gov/sites/default/files/Monitors/ICS-CERT_Monitor_Sep2014-Feb2015.pdf
6

#RSAC
Incidents by Type
https://ics-cert.us-cert.gov/sites/default/files/Monitors/ICS-CERT_Monitor_Sep2014-Feb2015.pdf
7

#RSAC
Attacks are Happening
8

BlackEnergy Malware Compromised

#RSAC

Industrial Control Systems

· Attack has been ongoing since 2011 via Operator console via Internet Connections

· Targets GE Cimplicity, Advantech/Broadwin WebAccess, and Siemens WinCC

· Affects Microsoft Windows and Windows Server 2008 and 2012

· Various attacks point to shared command and control systems

https://ics-cert.us-cert.gov/alerts/ICS-ALERT-14-281-01B

10

#RSAC
Cyber Attack on German Steel Factory
· German Federal Office for Information Security reported
- Hackers accessed production network, and tampered with Blast Furnace controls
· Hackers gained access via spear phishing and social engineering to get credentials to access office network
· Blast furnace could not be shut down, resulting in "massive damage to plant"
http://www.wired.com/2015/01/german-steel-mill-hack-destruction/
11

#RSAC
Malware in South Korean Nuclear Plant
· Malware found in computers connected to nuclear power facility
· Reactor controls of Korea Hydro and Nuclear Power (KHNP) were not connected to any external networks
· Malware likely introduced via USB drive
http://www.huffingtonpost.com/2014/12/22/south-korea-nuclear-plant-operator-computers-hacked_n_6364500.html
12

#RSAC
Multiple-Vector Attack on Industrial CS
· Attack used multiple attack vectors
- Phishing emails - Redirects to compromised sites - Installed infected update installers on at least three ICS vendor sites
· Installers were infected with Havex Trojan malware · Malware collected information on topology, nodes,
control systems
- Caused some systems to intermittently crash
https://ics-cert.us-cert.gov/alerts/ICS-ALERT-14-176-02A
13

#RSAC
Observation
· Many of the recent attacks were collecting data about Critical Infrastructure deployments - Devices, topology, protocols, etc.
· What does this mean?
Attackers are collecting data to enable future attacks
14

#RSAC
Critical Infrastructure Constraints
· Critical Infrastructure use dedicated systems, on specialized networks, with unique protocols
· Deployments can't be changed easily · Solutions need to last for 10, 20, or 30 years
Attackers are moving very fast and don't have these constraints
15

Supervisory Control and

#RSAC

Data Acquisition Protocol

(SCADA)

16

#RSAC
SCADA Overview
· Protocol to monitor and control remote equipment. Used for
- Pipelines, civil defense systems, heating/cooling systems, etc.
· Main components
- Remote terminal units (RTU) ­ Connect to sensors and convert to digital data - Programmable Logic Controllers (PLC) ­ Like RTU, but are programmable - Human-Machine Interface (HMI) ­ Presents data to human operator - Network ­ LAN, WAN, Cellular, satellite, etc.
17

#RSAC
Why Attacks Can Happen?
· SCADA devices and protocol were not designed for security
- Security by obscurity?
· Assumed to be isolated from organizations network and Internet · Assumed shared trust
None of these assumptions are true!
18

#RSAC
SCADA Devices are Vulnerable
· Programmable Logic Controllers (PLC) are purpose-built computers used for automation of electromechanical processes such as control of pumps, valves, pistons, motors, etc.
· PLCs are small computers. They have software applications, accounts and logins, communication protocols, etc.
· Analysis of PLCs from leading vendors shows variety of vulnerabilities:
- Backdoors - Lack of authentication and encryption - Weak password storage - Bugs leading to buffer overruns
19

#RSAC
Typical SCADA Network Structure

MANAGEMENT FACILITY

PRODUCTION FACILITY

20

#RSAC
Typical SCADA Network Structure

MANAGEMENT FACILITY

PRODUCTION FACILITY

Operation Network

Operation Network

Corporate Network

Corporate Network

21

#RSAC
IT and SCADA Networks are Interconnected

MANAGEMENT FACILITY

PRODUCTION FACILITY

SCADA Historian

Central Operation

SCADA WAN

Operation Network

Local Operation
PLC

LAN

Corporate WAN

Corporate Network
LAN

DC

Process

SDMuZrvey of hundreds of Energy sector environments

Average of 11 direct connections and up to 250 in some cases

(US National CIynbetresrencueritty and Communications Integration Center, 2011)

REMOTE USER

VPN

22

#RSAC
This is a Real Problem
· F-Secure found SCADA Attack that targets European Industrial Control Systems
· STUXNET worm designed to attack SCADA Program Logic Controllers · Banking Trojans Disguised As ICS/SCADA Software Infecting Plants · Hackers gain "full control" of critical SCADA systems · Hackers aggressively scanning ICS, SCADA default credentials
http://www.darkreading.com/as-stuxnet-anniversary-approaches-new-scada-attack-is-discovered/d/d-id/1278881 http://en.wikipedia.org/wiki/Stuxnet http://www.darkreading.com/attacks-breaches/banking-trojans-disguised-as-ics-scada-software-infecting-plants/d/d-id/1318542 http://www.itnews.com.au/News/369200,hackers-gain-full-control-of-critical-scada-systems.aspx http://threatpost.com/hackers-aggressively-scanning-ics-scada-default-credentials-vulnerabilities/101150
23

Examples of SCADA Vulnerabilities

Vulnerability Unpatched Published Vulnerabilities Web Human-machine Interface (HMI) Vulnerabilities Use of Vulnerable Remote Display Protocols Improper Access Control (Authorization) Improper Authentication Buffer Overflows in SCADA Services SCADA Data and Command Message Manipulation and Injection SQL Injection Use of Standard IT Protocols with Clear-text Authentication Unprotected Transport of SCADA Application Credentials

SCADA Impact Most Likely Access Vector Supervisory Control Access Supervisory Control Access Access to SCADA Functionality Access to SCADA Applications SCADA Host Access Supervisory Control Access
Data Historian Access SCADA Credentials Gathering SCADA Credentials Gathering

Source: Idaho National Lab, 2011

24

#RSAC

#RSAC
Examples of PLC Vulnerabilities

Firmware Ladder Logic
Backdoors Fuzzing Web Best Configuration Exhaustion Non-doc Features

N/A N/A 25

Vulnerability is present in the system and is easily exploited
Vulnerability exists but exploit is not available
System lacks this vulnerability.
Source: Digital Bond January 2012

Choice of Platform for

#RSAC

Control Systems

26

#RSAC
Sometime I Wonder Why People
· <RANT>
- Choose the platform with the most exploits? - Don't upgrade to the latest version of the Operating
System? - Don't apply patches and updates? - Don't run AV, Anti-Malware, etc.? - Run systems with no support?
· </RANT>
They must WANT to run Malware!
27

Industrial Control Computers are Not Immune #RSAC from Enterprise Security Challenges
· General purpose computers bring with them Enterprise vulnerabilities
- Very common to use enterprise OS as base for industrial controllers
· Recent Problems
- Siemens Open SSL Vulnerabilities - Shellshock / Bash Shell Vulnerabilities affect Industrial Control
Systems
https://ics-cert.us-cert.gov/advisories/ICSA-14-198-03G http://blog.trendmicro.com/trendlabs-security-intelligence/shell-attack-on-your-server-bash-bug-cve-2014-7169-and-cve-2014-6271/
28

#RSAC
Industrial Control Computers
· Using old platforms for Critical Infrastructure increases the risk of an Attack
- The attackers' don't need to learn new techniques to compromise these systems
· This is a symptom that Critical Infrastructure operators are not taking Security seriously
Why make the attacker's job easier?
29

#RSAC
Recommendations
30

#RSAC
How to Apply in Your Environment
Deploy strong perimeter security Select platforms for their security characteristics
Use SCADA prevention technologies Make Security a Priority
31

#RSAC
Deploy Strong Perimeter Security
· Conventional Security Tools
- Firewall - Intrusion Prevention - Anti-Virus - Anti-Bot - Threat Emulation - Data Loss Prevention (DLP)
· Critical to keep tools and signatures current
- Internet Connection needed
32

#RSAC
ICS Network with Perimeter Security

MANAGEMENT FACILITY

PRODUCTION FACILITY

SCADA Historian
LAN
DMZ

Central Operation

SCADA WAN

Operation Network
FW+VPN

Corporate WAN

Corporate Network
LAN

DC

Local Operation
PLC
Process

Internet
VPN

REMOTE USER

33

#RSAC
Platform Security
· Make security a priority when selecting and/or upgrading computing platforms
· Aggressively replace old platforms and operating systems
- Only run Operating Systems that are actively supported - Don't run Windows 95, 98, XP, Vista, 7
· Always apply latest patches and security fixes · Always run current AV, Anti-Malware, etc. · Control usage of USB ports
34

#RSAC
SCADA Prevention Approach
LOG ALL SCADA TRAFFIC Define Normal Baseline
· Full vis(ibKinliotyw-nlo/gUenvkenroywsinng/lNeoctomAlmlowanedd)and query · Does not depend on SCADA devices ability to log
· No risIkd/echnatinfygeDs -ecvainatbioe ndsonaenodutA-otft-abcaknsd on mirror port
· Have forensics in case of attack
Alert and Prevent Attacks
35

ICS Network with SCADA Prevention

MANAGEMENT FACILITY

Gateway learns and PRODUCTION FACILITY control SCADA traffic

SCADA Historian

Central Operation

SCADA WAN

Operation Network
FW+VPN

Local Operation
PLC

LAN

Corporate WAN

Corporate Network
LAN

DC

DMZ

Process

Internet
VPN

REMOTE USER

#RSAC

36

#RSAC
Make Security a Priority
· Make Security part of the procurement process
- Include Security in Service Level Agreements
· Invest in staff security training
- This will be a cultural change, but critical
· Periodic Security Audits · Actively track Industrial CERTs and Vendor Notifications
- https://ics-cert.us-cert.gov
· Don't be afraid to report attacks and compromises
37

#RSAC
Closing Thoughts
· This issue is Critical · Attackers are getting better and are preparing for major attacks
What are you going to do?
38

#RSAC
Q & A
39

Thank You
#RSAC
Bob Hinden rhinden@checkpoint.com
40

