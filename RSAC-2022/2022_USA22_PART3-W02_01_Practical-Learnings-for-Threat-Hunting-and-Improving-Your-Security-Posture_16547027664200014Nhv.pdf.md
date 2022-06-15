#RSAC

SESSION ID: PART3-W02
Practical Learnings for Threat Hunting and Improving Your Security Posture

Jessica Payne
Security Person Microsoft @jepayneMSFT

Simon Dyson
Cyber Security Operations Centre - Lead NHS Digital

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Advanced
Persistent Threat

#RSAC
Sophisticated Attackers

#RSAC
DEV-0193 UNC1878 ADJECTIVE + ANIMAL
5

#RSAC
Moderately skilled people who know slightly more about your network than you do.

#RSAC
Threat Intelligence should be as much about telling you what you don't have to worry about
7

#RSAC
8

#RSAC
Demystifying Ransomware attacks
9

#RSAC

DEV-0226

User's device

DELIVERY

RECONNAISSANCE

IMPACT

Email containing URL

Qakbot reconnaissance

Email exfiltration

PERSISTENCE If not domain-joined: If host is domain-joined:
ZZZz

Start of DEV-0504 RaaS affiliate's hands on keyboard activities

IMPACT

PERSISTENCE

Multiple devices
RECONNNAISSANCE

Qakbot waits, remains in system

Qakbot Cobalt Strike

Sell or auction access Affiliate-controlled

to network

Cobalt Strike

ADFind

IMPACT
Ransomware deployment

ZIP file download
Excel Binary file (victim enables
macros)

Cookie/browser credential theft
LSASS dump

AD dump of usernames and
hashes

Exfiltration

Deeper recon using more tools

Download Qakbot DLL from remote URL

ZeroLogon Exploit
Privilege escalation

DEV-0226 and DEV-0504

#RSAC

DEV-0226 Qakbot distributer and access broker
­ Qakbot developers are DEV-0303
Often sells access to DEV0504, a prolific RaaS affiliate
DEV-0504 has used many payloads including REvil, Egregor, and LockBit
DEV-0226 now with a new backdoor, which has been dubbed SquirrelWaffle by the internet

· TTPS: Macros ­ usually excel, often 4.0
· Built with the help of EtterSilent Multiple Cobalt Strike beacons
· Qakbot exfiltrates a TON before it's caught by AV

#RSAC
12

DEV-0252 / Bazaloader

#RSAC

DEV-0252 most known for the "Baza" malware
Provides access to many RaaS groups
Will perform their own ransomware work from time to to time
Most strongly associated with Conti/Ryuk
Has now moved on to Bumblebee/COLDTRAIN

· TTPS: Macros ­ often excel
· Attached script files in containers such as isos
· "Stolen Images" campaign Distinctive Cobalt Strike imports
· Direct exe payloads in various hosting providers
· Replacing Cobalt Strike with the Sliver implant from BishopFox

DEV-0206 / DEV-0243 cluster

#RSAC

FakeUpdates and "SocGholish" operated by DEV-0206
Provides access to DEV0243 who have distributed many payloads, not just WastedLocker
Moves fast to hands on keyboard when a "quality" network checks in
Some Zloader runs delivered this way too ­ different operator

· TTPS: Malvertising/popups impersonating software installed
· Zip->script file
· Technique works because of default file handlers for scripts

ELBRUS

#RSAC

Aka FIN7
Recruits "pentesters" as Bastion Secure
Behind DarkSide and Blackmatter
Able to run multiple concurrent campaigns
Espionage/Finance operations as well as ransoms
RaaS as well as "owner operated"

· Use of Sharepoint/OneDrive
· Macros and script files for entrance
· Custom tools and off the shelf

DEV-0401

#RSAC

Constantly rebranding this payloads in an attempt to look like a RaaS
Switched to an actual RaaS and deploying LockBit in April of 2022
Probably have links to a state sponsored group

· Love a good internet vuln
· Adopted log4j within a couple days of disclosure
· Used recent Confluence vuln before disclosure
· Still need creds to move laterally and rely on implants/industrialized tools like Cobalt Strike
· Have also adopted Sliver

#RSAC
Commonalities
Office abuse Account abuse Script abuse Security product tampering Industrialized attack tools
17

#RSAC
18

#RSAC
Ransomware is a preventable disaster
19

#RSAC
Network Design

#RSAC
Network Design

#RSAC

#RSAC
You can't just buy this, you have to build it.

#RSAC
Legacy Settings Technical Debt
We have always done it this way

#RSAC
Fear

#RSAC
What if I told you being secure could save you money?
26

#RSAC
27

Preventing office from creating child processes

#RSAC
Answering difficult questions

#RSAC
What you need is a spreadsheet

Problem

Controls

Security Gain

Macros/Office abuse Prevent Office from

high

Creating Child Processes

Perimeter vulns/abandoned systems
Lateral movement

Scanning and isolation medium

Credential hygiene

high

Script abuse
Industrialized attack tools

Change default script

high

handler/enable ASR Rules

Enable cloud mode

high

AV/tamper

protection/ASR rules

#RSAC
Technical Difficulty Political Difficulty

#RSAC
The 8000-word version of this research is available at https://aka.ms/ransomware-as-a-service
32

#RSAC
33

Simon Dyson (MSc) (CISSP / CCSP)
Cyber Security Operations Centre Lead at NHS Digital
· An Editor / reviewer of Healthcare & Cybersecurity with JBBA The Journal British Blockchain Association
· Published papers on blockchain & cryptocurrencies, contributing author to Blockchain impact!.
· Certified Cloud Security Professional (CCSP) · Certified Information Systems Security Professional (CISSP) · Received an MSc in Advanced Security & Digital Forensics
· from Edinburgh Napier University
· Law enforcement ­ Police officer / Detective · Regional Cyber Crime Unit (UK) ­Regional Organised Crime Unit UK
as Cybercrime investigator / forensic practitioner

#RSAC

34

#RSAC
The big number slide
NHS Digital's Data Security Centre is the lead partner on data security across the NHS. 1.9 million endpoints on Endpoint monitoring 23.2 billion on our boundary solution over a 5 day period 21 million blocks for malicious items
35

NHS COVID PANDEMIC

Hospital&Trusts
Continue to support health organisations to operate with
minimal disruption from cyber events and
support in cid e n t s .

Nightingale's
Large temporary units to treat
large numbers of COVID patients
in temporary hospitals. Support
monitoring and incident support.
7 across the country.

Test & Trace
Support and provide services for the partner
age n cie s involved in the test, trace and contain space.

Vaccination
Provide monitoring and incident support
to the vaccination roll-
out effort.

#RSAC
36

#RSAC
37

#RSAC
38

#RSAC
Global threat & Incidents of note
Feb 2020 Redcar & Cleveland Sep 2020 ­ Dusseldorf University Hospital Dec 2020 ­ Solarwinds 2020 Significant attacks across US & French healthcare 2021 Hackney Council 2021 Colonial Pipeline Ransomware 2021 Irelands (HSE) Health Security Executive
39

#RSAC
Fa ilu re is t h e key to
success; each m is t a ke
teaches us s o m e t h in g
THE ART OF PEACE ­ Mo rih e i Ue s h ib a
40

#RSAC
A phrase that makes me sad
"It's just "Commodity malware""
41

#RSAC
What should we be interested in;
Threat actors Campaigns Tangled web of affiliates & groups What have we seen before Static (still can be helpful) Behaviours, TTPS
42

Th re a t h u n t in g In t e ra c t io n s
C o m m o n flo w o f t h re a t in t e llig e n c e

#RSAC

Th re a t In t e llig e n c e
Gathering TI from open and commercial sources to discover
activity IOCs.
Cy b e r In c id e n t Re s p o n s e
Deployed to put resource to assist in contain phases and gather
evidence on-site. Provides further forensic support.

01 04

02 03

Th re a t Hu n t in g
Dedicated resource to develop hypotheses around TTPs. Creates hunts based on potential sources and visibility from tooling
In c id e n t Ma n a g e m e n t
Work to contain, investigate and supporting the organisation to mitigate and recover.

#RSAC
Rule creation and governance
Create content & test Automated workflows Promote rules into protective monitoring Review rules efficiency performance & effectiveness
44

#RSAC
High Severity Alerts
Triage intelligence Impact and Probability Communicate to all organisations
Number of High Severity Alerts

2022

2021

2020

0

2

4

6

8

10

12

14

45

#RSAC
Beneficial activities
Do everything to reduce the dwell time Attack Surface Reduction Rules Utilise Mitre Att&ck to describe TTPS Maps TTPs to alerts and controls Use Cyber kill chain for SLT / Board level Perform adversary emulation & lab work
46

#RSAC
The team is your greatest asset
Keep diverse ­ not just protected characteristics Different backgrounds, technical, sector and skills Pure cyber ­ beware group think or CTF mentality Recognise human ingenuity criminal and defender Automation will save time and effort but the human element is so important.
47

