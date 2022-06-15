Evolving Advanced Threat Landscape
A close look at PoS Malware Attack Campaigns

Threat Landscape Era's

Network Protocol
1999-2005

Content & Botnets
2006-2010

Advanced Threats
2010-Today

· Synflood (Trinoo/TFN) · Code Red · Slammer · Zotob · Conficker (2008)

· Web Browser · Web Applications · Doc/PDF/etc. · Flash/Shockwave · Java

· Aurora · Operation Payback · Stuxnet/Flame/Duqu · Red October · Cyber Warfare

What is "Advanced Threats"

An Advanced "Threat" is a series of events ­ a targeted campaign of attacks ­ that put an organization at risk.

It is...

It is not...

 Inclusive of attacks, evasion techniques, diversion processes.
 Multiple types of attacks.
 Targeted at a specific organization.
 Is planned.
 Includes different stages of attack execution.

 A single attack
 Just malware or just DDoS
 Executed by chance.
 Targeted at a general population.

Why do Threats get Through?

· Huge number of `ways in'
­ Drive By Download ­ SPAM/Phishing ­ Watering Hole ­ Obfuscation ­ USB

60
· Leveraging vulnerabilities in:
50
­ Java applets

­ Compound Documents

40

­ Anything Adobe

30

20

· Many Threat Vectors - New AND Old - IPS / AV Limited coverage - Patching lag
Threats On Corporate Network

10

0

Advanced

Botted or Under-capacity

Persistent Threat Compromised for bandwidth

Hosts

Industrial Espionage

Malicious Insider

Other

Advanced Threats - Targeted Attack Campaigns

Example Tools in Advanced Threat
Campaign

Month 1

Month 2

Phishing

RAT

DDoS
Zero Day Exploits
Malware
Evasion Techniques

Month 3

Most vendors
are focused on stopping individual attacks ­
not campaigns

Happy Holidays: PoS Malware Campaign

PoS Malware: Big Picture
· Point of Sale machines
­ Process credit and debit cards
· Malware steals card data
­ Typically by scraping memory ­ PoS malware includes Dexter, Project Hook,
Alina, vskimmer, RammScraper & Soraya (discovered on 21 May 2014)

PoS Malware: Dexter and Project Hook
· Dexter & Project Hook
­ Card data  Command & Control server
· Plausible criminal workflow:
­ Compromised cards  dumps  sold  made into physical credit cards to be used in card present transactions

PoS Campaigns: Compromise Tactics
· Indicatiors suggest the following:
­ Remote Desktop with weak credentials
­ Open wireless networks including PoS machines
­ Social engineering tactics ­ Possible spear phishing attacks ­ Physical attacks (USB drives and
autoruns)

Global infection ­ Dexter & Project Hook
24 Jan 2014

Campaign Discovery
· ASERT Open Directory Crawler tool
­ Crawls directories seen during malware analysis
­ Discovered stolen credit card data

Campaign Discovery
· Another Dexter sample in same timeframe
­ Stored FTP credentials to upload card data

ATLAS Malware Corral Tracking Tracking several PoS+ malware families

ASERT Malware Analysis

ASERT Response
· Notified financial sector contacts & FBI · Conference call (financials) · Sensitive data dumps given to financials · TLP AMBER (need to know basis) Threat
Intelligence document written and distributed to relevant parties · Contained sensitive data and numerous indicators of Compromise (IOCs) · IOCs useful to help compromises

Threat Intelligence Product and Blog

ASERT follow-up actions
· Ongoing monitoring of C&C servers to harvest data & new malware
­ ASERT & card vendors
· ASERT researchers actively tracking and reverse engineering several PoS malwares & obtaining critical insight
­ Malware classifiers for Dexter, Project Hook, Alina
­ Network indicators intended for publication for Arbor Networks products

Arbor Security Engineering Response Team

Honeypots & SPAM Traps

ATLAS

Security Community

Sandbox of Virtual Machines run malware
(look for botnet C&C, files, network behavior)

300K Malware samples/day

Millions of Samples
Report and PCAP stored in database

DDoS Family
"Tracker" DDoS Attack Auto-classification and analysis every 24 hrs

AIF Policy

How can Arbor Help? Threat Intelligence

· Utilise Arbor's visibility, expertise and experience to improve automated threat detection.
­ Threat Intelligence
· Granular data to prevent false positives
· Data based on in-depth research and monitoring
· Understanding of threat `family' + confidence = better match to risk profile

Active Campaigns

Gameover Zeus ZeroAccess Citadel DarkComet Simda Gh0strat Shylock Ramnit Xtreme RAT Ponmocup Cridex NetTraveler Carberp Bifrost Hangover Pony PoisonIvy Taidoor Specifix Spyeye

How can Arbor Help? Broad & Deep Visibility
· Leverage Flow technologies for:
­ Cost-effective, scalable visibility ­ Layer 3/4 picture of internal network
· Use packet capture for deeper visibility
­ Monitor for specific threats at network / data-centre edge.
­ Store forensic data for retrospective analysis
· Correlate
­ With actionable threat intelligence ­ Detect suspicious or malicious activities
wherever they occur

How can Arbor Help? Resource Multiplier

IDENTIFY

ANALYZE

PROTECT

Prioritize

React

Comprehensive monitoring and threat detection

Situational Awareness. Augment detected events with relevant context

Intelligence

People

Provide surgical mitigation and forensic capabilities.

Source: NIST.gov

Products

Processes

Thank You

