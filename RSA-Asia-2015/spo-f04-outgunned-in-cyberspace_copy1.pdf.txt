SESSION ID: SPO-F04
Outgunned in Cyberspace

Craig Hall
Managed Defense Analyst FireEye

#RSAC

#RSAC
JPMorgan Chase Breach
2

#RSAC
JPMorgan Chase Breach
JP MORGAN CYBER SECURITY UPDATE: POST BREACH
"By the end of 2014, we will have spent more than $250 million annually with approximately 1,000 people focused on the effort. This effort will continue to grow exponentially over the years."
3

#RSAC
Bank of America Breach
4

#RSAC
"All you need is one weak link..."
5

#RSAC
"Nearly every company is vulnerable..."
6

#RSAC
Do you know your enemy?
In boxing, a boxer studies his opponent's moves prior to the fight so he knows exactly how to defend himself against the opponent
and outmaneuver him before he steps into the ring, which will increase his chances of victory.
7

#RSAC
Threat Intelligence
 APT is a `WHO' and not a `WHAT'  THREAT INTELLIGENCE should provide information on THREAT ACTORS
8

#RSAC
`Theoretical' Case Study

Two Utilities
TELCO - A

#RSAC
TELCO - B

Signature based TECHNOLOGY In-house EXPERTISE No malware/threat actor INTELLIGENCE

FireEye TECHNOLOGY FireEye EXPERTISE FireEye INTELLIGENCE

10

#RSAC
Traditional In-House Approach

TELCO - A

 AV updates slow
 Sometimes AV will only catch malware AFTER infection

TECHNOLOGY AntiSpam and AV Filtering
Receives 5 million emails a day

When this happens · Machine is reimaged · Possibly send malware sample to
their AV vendor

#RSAC
FireEye Intel Based Approach

TELCO - B

 FireEye TECHNOLOGY is not Signature based ­ and finds threats faster than signatures ­ reducing time to detect

 FireEye Technology finds the

TECHNOLOGY

unknown threat "Invoice.xls"

1. AntiSpam and AV Filtering

2. Malware Detonation ­ FireEye

Receives 5 million emails

a day

#RSAC
Unknown Threat: Invoice.xls
Target: Telco - B, and trying to appear legitimate
· No signature · Bypassed existing defenses
FireEye TECHNOLOGY reveals:
1. Invoice.xls designed to attack Excel 2010sp2 2. Excel 2010sp2 is the version Telco B has standardized on 3. Malware phones home to ServiceABC.skypetw.com 4. ServiceABC is the name of a VALID internal service in the
Telco B network

Who Is Attacking?

FireEye INTELLIGENCE tells us:

Skypetw.com matches to known threat group: APT5

APT5 targets telecom companies

#RSAC

Is looking for intellectual property regarding satellite communications

Known TTPs Tactics, Techniques and Procedures

#RSAC
APT5 Tools Techniques and Procedures

1
Establish a Beachhead using malware

2
Move laterally using standard networking tools (no malware)

3
Find desired intellectual property

4
Exfiltrate stolen data using password protected zip files and FTP

#RSAC
Incident Scope

· APT 5 is behind the attack · Looking for Satellite IP · Telco B has Satellite Communication IP · Alarm bells going off from this single alert

We need to find out
Did end user open email attachment?

Did other users get infected?

Did the attacker move laterally once inside the network?

Detect and Respond
 Complete Host Based investigation, e.g. : Scraping Endpoint Memory  Reveal commands an attacker may have used on an endpoint

#RSAC

 Look for APT5 TTP ­ Lateral movement using standard networking tools  Look for APT5 TTP ­ Exfiltration of password protected zip file
 Investigation through FireEye as a Service EXPERTISE tells us
 "NETUSE" command was used to connect to 2 additional servers at TelcoB  Servers required Username and password - "BobAdmin" account was used by the attacker. This account
is a Domain Admin at TelcoB  Our remediation now extends to this compromised admin account  Agent TECHNOLOGY tells us 7z (zip) command was used with a "password" option  Agent TECHNOLOGY tells us the password that was used to encrypt the file: itsm9now

#RSAC
Incident Scope

Scope of the attack
· Desktop · Laptop · 2 Servers · Compromised Admin
Account "BobAdmin"

What we need to know
· What was in those exfiltrated .zip files?
· Did they actually make it out?
· What is the business impact?

#RSAC
Network Forensics
FireEye TECHNOLOGY 1. Goes back in time and shows us the actual zip file
"exfil.zip" that was sent to serviceABC.skypetw.com
2. Lets us extract "exfil.zip" and save it to our computer...
3. But it's password protected
We use the password that we learned from endpoint forensic investigation See what data was exfiltrated: Satellite Intellectual Property?

#RSAC
APT30

APT30 Key Findings
Long-standing advanced persistent threat (APT)
Focus on Southeast Asia and India
Methodical processes and modular tools implies a structured environment

#RSAC
 Appears to target organizations with political, economic, and military information
 Able to target sensitive air-gap networks.

#RSAC
One of longest-operating known threat groups

Based on malware metadata, compile dates, and domain registration date APT30 has operated for at least a decade (2004 ­ 2015)

Domain
km-nyc.com km153.com

Registration Date
11 Mar 2004 30 Aug 2007

Compile Date Early Sample
11 Mar 2005
4 Sep 2007

Compile Date Recent Sample
11 May 2014
11 May 2014

Comments
File Version Internal Name Legal Copyright Original Filename Private Build Product Name Product Version Special Build

(C) 2004 Microsoft Corporation.  Flyeagle science and technology company NetEagle Remote Control Software
4.2 Neteagle  (C) 2004 NETEAGLE.EXE
NetEagle Remote Control Software 4.2

Version information from BACKSPACE controller

#RSAC
Regional Focus
96% of victim organizations located in SE Asia

Confirmed APT 30 Targets India South Korea

Thailand Saudi Arabia

Malaysia Vietnam

United States

Likely APT30 Targets Nepal Bhutan

Indonesia Brunei

Cambodia Japan

Philippines Singapore

Myanmar Laos

#RSAC
Regional / Geopolitical Targeting
 `Decoy' documents reflect geopolitical themes associated with region
 Political transitions  China border disputes  Indian military themes
 Focus on ASEAN with registration of malicious domain aseanm[.]com
 Journalists also targeted

#RSAC
Consistent TTPs

APT30 appears to have a consistent, long-term mission that relies on existing tools to remain sufficient over time

Yesterday's successful tools modified for today

MALWARE / TOOL
BACKSPACE NETEAGLE SHIPSHAPE SPACESHIP FLASHFLOOD

COMPILE DATE EARLY
SAMPLE
2 Jan 2005 20 Jun 2008 22 Aug 2006 23 Aug 2006 31 Jan 2005

COMPILE DATE
RECENT SAMPLE
5 Nov 2014 6 Nov 2013 9 Jun 2014 5 Jun 2014 17 Feb 2009

 Successful enough to not have to change  Long-term investment in software development

Summary of APT30

APT30 is a well-organized group with a long-term mission that represents a regional threat

Targeted activity and statesponsored not simply a US problem

#RSAC
Able to target sensitive Air Gap networks

#RSAC
FIN4 ­ HACKING WALL ST

Who Are FIN4?
 Active since at least mid-2013  Likely seeking "black edge"
­ Market catalyst information for trading advantage  Deeply familiar with inner workings of public
companies  Tactics: simple yet insidiously effective
28

#RSAC

Attack Vector
 Emails originate from trusted senders
 Links to fake Outlook Web Access portal  Stolen documents weaponized with
embedded macros
29

#RSAC

#RSAC
The Target?
30

#RSAC
Insidiously Clever?
 Simple techniques to minimize chances of discovery
31

#RSAC
Operation Clandestine Wolf

#RSAC
Who are APT3?
 State-sponsored group ­ AKA UPS  Attributed to Operation Clandestine Fox in 2014  Zero-day exploit sophistication  Cool code names
33

#RSAC
Clandestine Wolf
 Spear phishing campaign against: · Aerospace and Defense · Construction and Engineering · High Tech · Telecommunications · Transportation
34

#RSAC
Spearphishing
35

#RSAC
Some Technical Details

Address Space Layout Randomization

Data Execution Prevention

#RSAC
These Red Dots = Compromise
· Valid GIF File · Malicious Payload appended at end of File · Malicious Payload is encoded to avoid detection
Malicious GIF Image file

#RSAC
After The Initial Compromise
· Custom Backdoor "Backdoor.APT.CookieCutter" installed
· Quickly steal valid credentials ( to defeat organizations only looking for malware )
· Move laterally to systems with digital assets of value · Install custom Backdoors · Never reuse command and control infrastructure

#RSAC
Remediation
Apply Adobe Out Of Band Security Patch FireEye IPS detects : CVE-2015-3113 FireEye MVX detects: Backdoor.APT.CookieCutter

#RSAC
Outgunned in Cyberspace
 Do you believe that the breach is inevitable?  How would you know if you were currently compromised?  Do you know who would attack you?  Do you know how they would do it?
40

#RSAC
Thank You
 To talk more, email us:
APAC@FireEye.com
41

SESSION ID: SPO-F04
Outgunned in Cyberspace

Craig Hall
Managed Defense Analyst FireEye

#RSAC

