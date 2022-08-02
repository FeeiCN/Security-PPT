#RSAC

SESSION ID: EXP-T09R
The Seven Most Dangerous New Attack Techniques, and What's Coming Next

MODERATOR:

Alan Paller
Director of Research, SANS Institute

PANELISTS:
Ed Skoudis
Leads SANS Pen Testing and Hacker Exploits Immersion Training Programs
Created NetWars & CyberCity Simulators Author of CounterHack Reloaded
Michael Assante
Director of SANS ICS Training Programs Was VP and CISO of NERC Directed INL's Electric Power Program Testified before US House and Senate
Dr. Johannes Ullrich
Dean of Research at STI - SANS' Graduate School Director of the Internet Storm Center

Ed Skoudis
-- Leads SANS Pen Testing and Hacker Exploits Immersion Training Programs -- Created NetWars & CyberCity Simulators -- Author of Counter Hack Reloaded

#RSAC

#RSAC
Top Threats - Skoudis
Broadening Targets Full Weaponization of Windows PowerShell What Stagefright Tells Us About Mobile Security Going Forward XcodeGhost ­ How Will You Trust Your Apps Going Forward?
3

#RSAC
Broadening Targets
The last 12 months have shown the threat's focus is broadening
PII still a target, but much more is in play now
OPM attack
Government background check data and fingerprints
Ashley Madison attack
Sensitive personal information at play
Extortion malware stealing browser history Ukrainian power grid attack
4

#RSAC
Defenses Against Broadening Threats
Don't assume that you are safe just because you lack PII Attackers are devising clever uses for all kinds of data with criminal and national security implications Vigorously apply robust security standards focused on actual attack techniques used in the wild Twenty Critical Controls IAD Top 10 Information Assurance Mitigation Strategies Australian Signals Directorate Top 4 Mitigation Strategies
5

#RSAC
Windows PowerShell Weaponization
PowerShell Empire ­ Amazing integrated post-exploitation capabilities
By Will Schroeder, Justin Warner, and more
PowerShell Empire features:
Powerful agent Pillaging / Privilege escalation Pivoting / Lateral movement Persistence Integrated with attacker operations
All free and incredibly easy to use, and often works even with application white listing
6

#RSAC
Weaponized PowerShell Defenses
Don't rely on PowerShell's limited execution policy
A safety feature, not a security feature... trivial to bypass
Enhanced logging in PowerShell 5
Pipeline logging, deep script block logging, and more
Win 10 AntiMalware Scan Interface (AMSI)
All script content presented to registered antimalware solution on the box
PowerShell 5 Constrained Mode and AppLocker integration with "Deny Mode" and "Allow Mode" ­ behaves like script white listing
7

#RSAC
Stagefright as a Portent of Mobile Vulns
Stagefright: A series of significant vulnerabilities discovered in Android, all associated with a library that plays multi-media content
Discovered by Joshua Drake at Zimperium through exhaustive fuzzing, and then detailed analysis of fuzzing results
Code execution via text messaging, video viewing in email, browser video watching, and more Google patched it quickly... ... But there's a problem: For Android devices, the OEMs and Mobile Operators (carriers) sit between the code developer(s) and customers Getting patches out in a timely fashion is difficult at best
8

#RSAC
Stagefright-Style Vuln Defenses

Upgrade to newer versions of Android (and don't forget iOS!)
Implement a corporate strategy for doing so regularly
Via MDM and network infrastructure, enforce use of only up-to-date versions of mobile operating systems for enterprise apps and data... Deny others
Give preferential treatment to Android vendors who push updates all the way to devices quickly

Flaw disclosure

Google

Moto

LG

Notice and fix

Code Owner

Both handset manufacturers and mobile operators lack significant financial reward for continued support of already-sold
Android devices

Samsung

3rd Party Software

MO 1

MO 2

MO 3

3rd Party Software

Android Phone
A

Android Phone B

Android Phone C

Android Phone D

9

#RSAC
XcodeGhost ­ Can You Trust Your Apps?

Historically, attacks against source code and dev tools have proven deeply

insidious

1984

Bad guys can no

· Backdoor the

Reflections on

compiler

Trusting Trust

longer ignore

iOS as a malware target

2004-2010
tcpdump, Linux kernel

· Backdoor the source code

With XcodeGhost, they

attempt, etc.

showed innovative ways to undermine iOS

2015 XcodeGhost

· Backdoor the dev environment

Enterprise app store signing is another

10

#RSAC
XcodeGhost ­ Implications for Defense
Analyze the security of permitted apps in your environment
Josh Wright's App report card at http:///pen-testing.sans.org/u/64u
Data isolation from mobile devices
Container-based security is waning Virtualized Mobile Infrastructure is rising
User training can help ­ don't install untrusted apps... and tell them why
Look for anomalous activity in the environment
New free RITA (Real Intelligence Threat Anslysis) tool from Black Hills Information Security http://bit.ly/BHIS_RITA
11

Michael Assante
--Director of SANS ICS Training Programs --Was VP and CISO of NERC --Directed INL's Electric Power Program --Testified before US House and Senate

#RSAC

#RSAC
Lights Out
One, of a hand full: acknowledged ICS attacks with physical effects Cyber attacks against 3 Ukrainian power companies on Dec 23 Successfully cause power outages Coordinated & multi-faceted Destructive acts BlackEnergy 3 Malware plays some role
Additional malware (e.g. customized KillDisk)
13

#RSAC
Power System SCADA 101

110 kV Substation

Distribution Control Center

110 kV Substation

14

35 kV Substation

#RSAC
Distribution Utility Systems
Company Network

Customer Call Line

Distribution Control Center (SCADA DMS)
15

#RSAC
The Attacks

Malware is simply a tool used for specific actions (e.g. access)

Cyber Attack 1. (ICS Kill Chain)
1. Intrusion (Foothold) 2. Take over credentials & IT 3. Access & remove relevant data 4. Cross-over into SCADA 5. Change the state of power system 6. Damage firmware 7. Wipe SCADA & infrastructure hosts

Distribution Control Center

Cyber Attack 2. (Supporting) 1. Flood Customer Phone Line 2. UPS take over & disconnect

16

#RSAC
Success...but
17

#RSAC
Disrupt Power & Anti-restore
18

#RSAC
Dr. Johannes Ullrich
-- Dean of Research at STI: SANS' Graduate School -- Director of the Internet Storm Center

#RSAC
Software Security: Components Matter
Insecure third party components matter! Development environments, software components (libraries) are more and more under attack Developer workstations are high on the target list
20

#RSAC
Apple Xcode Ghost
Compromised version of Xcode offered for download on Chinese sites Compiled software included malicious functionality Unnoticed due to trust relationship between Apple and developers
21

#RSAC
Juniper Backdoor
Static password added to code. Not typical "support password" Designed to evade detection Who did it?
<<< %s(un='%s') = %u
22

#RSAC
Mitigation
Accountability: Who did it? Version control systems need to keep a record of which changes were done by whom and why Software repositories need regular offline backups Traditional code reviews and pentesting will not fix this Cryptographic protection against tampering
git blame login.html
23

#RSAC
The Internet of Evil Things
The IoT is not just a "target" for its own sake More and more IoT devices are used as attack platforms after they are compromised
24

#RSAC
Raspberry Pis Attacking!
Goal: Building a proxy or DDoS network sometimes: Bitcoins (yes... still!) Worst case: Used to attack internal networks
25

#RSAC
Multi Architecture Malware

81896 Jan 82096 Jan 70612 Jan 48996 Jan 65960 Jan 70648 Jan 65492 Jan
2133 Jan

1 00:10 10 <- ELF LSB MIPS 1 00:10 11 <- ELF MSB MIPS 1 00:10 13 <- ELF LSB x86-64 1 00:10 14 <- ELF LSB ARM 1 00:10 15 <- ELF LSB 386 1 00:10 16 <- ELF LSB PowerPC 1 00:10 17 <- ELF LSB 386 1 00:20 bin2.sh

26

#RSAC
Brute Force Architecture Detection
All versions are downloaded and execution is attempted for all of them. Initial infection usually implement simple bot (IRC/HTTP as C2C) Additional components are downloaded later for specific architectures "busybox" replaced with trojaned version
27

#RSAC
Change in Malware Economics
170 Million Credit Card Holder vs 61 Million Stolen (2014) 450 Million issued SSNs vs 22 Million Stolen (just OPM hack) 142 Million registered voters vs. 191 Million records leaked
ALL DATA HAS BEEN STOLEN little value in stealing the same data over and over.
Reducing scarcity = Reduced Price
28

#RSAC
Ransom Ware
Instead of copying data: Encrypt it
Ransom ware has been going on for a couple years now Increasing in sophistication (e.g. platform independent Ransom32)
Instead of stealing data from a web site: Shut it down
Used to be more against fringe (e.g. online gambling) sites Or for political motives Now used against any site with insufficient DDoS protection
29

#RSAC
Your Questions and Discussion

