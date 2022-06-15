| 1|

State of the ATT&CK
Blake Strom @stromcoffee
@MITREattack
#ATTACKcon
©2019 The MITRE Corp©or2a0ti1o9n.TAhLeLMRITIGRHETCSoRrpEoSraEtiRoVn.EADL.LARppIGroHvTedS fRoEr pSuEbRliVc EreDle. aAspep.rDovisetdribfourtiopnubulniclimreilteeads1e9. -D0i0s6tr9ib6u-t1io5n unlimited 19-01075-6.

MITRE

| 2|
ATT&CK Circa 2014

Persistence

Privilege Escalation

Credential Access Host Enumeration Defense Evasion

Lateral Movement

Command and Control

Exfiltration

New service

Exploitation of OS/Software

vulnerability

Weakness

Process enumeration

Software packing

RDP

Common protocol, follows
standard

Normal C&C channel

Modify existing service

Service file permissions weakness

User interaction

Service enumeration

Windows admin Common

Masquerading shares (C$, protocol, non-

ADMIN$)

standard

Alternate data channel

DLL Proxying

Service registry permissions Network sniffing weakness

Local network config

DLL Injection

Windows shared webroot

Commonly used protocol on non-
standard port

Exfiltration over other network
medium

Hypervisor Rookit

DLL path hijacking

Stored file

Local network connections

DLL loading

Remote Communications Exfiltration over

vulnerability

encrypted physical medium

Winlogon Helper DLL

Path interception

Window enumeration

Standard protocols

Logon scripts

Communications are obfuscated

Encrypted separately

Path Interception

Modification of shortcuts

Registry run keys Startup folder addition

/

Editing of default handlers

Modification of AT / Schtasks /

shortcuts

Cron

MBR / BIOS rootkit

Account enumeration
Group enumeration
Owner/user enumeration

Obfuscated payload

Application deployment
software

Distributed communications

Indicator removal

Taint shared content

Multiple protocols combined

Access to remote

Indicator blocking services with

valid credentials

Operating system enumeration

Pass the hash

Compressed separately
Data staged
Automated or scripted data exfiltration
Size limits

Editing of default handlers
AT / Schtasks / Cron

Security software enumeration
File system enumeration

Scheduled transfer

Detect
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

Partially Detect

No Detect

No Usage

AATTTT&&CCKK TTooddaayyATT&CK Sightings
ATT&CK
Evaluations

| 4|
PRE-ATT&CK

ATT&CK for ICS

Mobile ATT&CK

ATT&CK-Based SOC Assessments

Cyber Analytics Repository

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 5|
We Didn't Get Here By Accident
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 6|
Updates this Year ­ By the Numbers

1
NEW TACTIC

43
NEW TECHNIQUES

13
NEW MOBILE TECHNIQUES

16
NEW GROUPS

87
NEW SOFTWARE

41
NEW MITIGATIONS

87
UPDATED TECHNIQUES

16 67
UPDATED MOB UPDATED TECHNIQUES GROUPS

92
UPDATED SOFTWARE

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 7|
ATT&CK for Cloud
for Cloud
Credit to Dave Herrald and Ryan Kovar
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-01075-6.

| 8|
ATT&CK for Cloud
· 36 techniques · Part of Enterprise ATT&CK · Almost 100% community-
contributed techniques! · Input from:
· A cloud service provider · Red teams · Threat analysts · Detection analysts
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 9|
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

Impact Tactic
 Attacks targeting availability and integrity  Ex: Ransomware, DoS, destruction
 16 techniques

Data Destruction Data Encrypted for
Impact Disk Content Wipe
Disk Structure Wipe

Endpoint DoS
Network DoS
Firmware Corruption Inhibit System Recovery

Resource Hijacking
Service Stop
Defacement System
Shutdown/Reboot

| 10 |
Runtime Data Manipulation Stored Data Manipulation Transmitted Data Manipulation Account Access
Removal

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 11 |
Mitigations
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 12 |
Abstraction Issues in ATT&CK
· Some broad techniques · Account Manipulation · Credential Dumping
· Some narrow · Rundll32 · MSBuild
· Hard to strike the right balance now
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 13 |
How Do We Scope Sub-Techniques?
Groups of behaviors Use what we have Maintain an adversary mindset Platform specific techniques
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 14 |
Sub-Technique Implementation
· Rough stats (so far) · Techniques: 266 166 · Sub-techniques: 280
· Implementing now · Pausing other updates · No groups/software!
· Going into companion website for preview · Won't be defacto ATT&CK · 3+ month feedback period
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 15 |
Sub-Technique Example

Credential Access Account Manipulation Bash History Brute Force Credential Dumping Credentials in Files ...

Credential Dumping Sub-Techniques (draft) SAM (Security Accounts Manager) Local Security Authority (LSA) Secrets NTDS from Domain Controller Cached Credentials ...

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 16 |
Sub-Technique Feedback

· Are sub-techniques necessary and are we on the right track? · Overwhelmingly, yes!
· Aren't they procedures? · No
· Visualization challenges
· One-to-many issues
· Mapping old to new

· Data source refinement
· OS agnostic techniques
· Techniques should always have sub-techniques
· Sub-techniques should be OS specific
· Will help with false sense of security

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

Growth of the ATT&CK Community

Individuals + orgs
contributing to
ATT&CK!
·Alain Homewood, Insomnia Security ·Alan Neville, @abnev ·Alex Hinchliffe, Palo Alto Networks ·Alfredo Abarca ·Allen DeRyke, ICE ·Anastasios Pingios ·Andrew Smith, @jakx_ ·Avneet Singh ·Barry Shteiman, Exabeam ·Bart Parys ·Bartosz Jerzman ·Brian Prange ·Bryan Lee ·Carlos Borges, @huntingneo, CIP ·Casey Smith ·Christiaan Beek, @ChristiaanBeek ·Christoffer Strömblad ·Cody Thomas, SpecterOps ·Craig Aitchison ·CrowdStrike Falcon OverWatch ·Cybereason Nocturnus, @nocturnus ·Daniel Oakley ·Darren Spruell ·Dave Westgard ·David Ferguson, CyberSponse ·David Lu, Tripwire ·David Routin ·Drew Church, Splunk ·Ed Williams, Trustwave, SpiderLabs ·Edward Millington ·Elger Vinicius S. Rodrigues, CYBINT Centre ·Elia Florio, Microsoft ·Elly Searle, CrowdStrike ·Emily Ratliff, IBM ·ENDGAME ·Eric Kuehn, Secure Ideas ·Erika Noerenberg, @gutterchurl, Carbon Black ·Erye Hernandez, Palo Alto Networks ·ESET ·Felipe Espósito, @Pr0teus

·Filip Kafka, ESET ·FS-ISAC ·Hans Christoffer Gaardløs ·Heather Linn ·Itamar Mizrahi ·Itzik Kotler, SafeBreach ·Ivan Sinyakov ·Jacob Wilkin, Trustwave, SpiderLabs ·Jan Miller, CrowdStrike ·Jannie Li, Microsoft (MSTIC) ·Jared Atkinson, @jaredcatkinson ·Jean-Ian Boutin, ESET ·Jeff Sakowicz, Microsoft (IDPM Services) ·Jeremy Galloway ·Jimmy Astle, @AstleJimmy, Carbon Black ·Johann Rehberger ·John Lambert, Microsoft (MSTIC) ·John Strand ·Josh Abraham ·Justin Warner, ICEBRG ·Jörg Abraham, EclecticIQ ·Kaspersky ·Lab52 by S2 Grupo ·Leo Loobeek, @leoloobeek ·Loic Jaquemet ·Lucas da Silva Pereira, @vulcanunsec, CIP ·Lukás Stefanko, ESET ·Marc-Etienne M.Léveillé, ESET ·Mark Wee ·Martin Jirkal, ESET ·Martin Smolar, ESET ·Matias Nicolas Porolli, ESET ·Matt Graeber, @mattifestation, SpecterOps ·Matt Kelly, @breakersall ·Matthew Demaske, Adaptforward ·Matthew Molyett, @s1air ·McAfee ·Michael Cox ·Michal Dida, ESET ·Microsoft Threat Intelligence Center (MSTIC) ·Mike Kemmerer ·Milos Stojadinovic ·Mnemonic ·Netskope ·Nick Carr, FireEye ·Nik Seetharaman, Palantir

·Nishan Maharjan, @loki248 ·Oddvar Moe, @oddvarmoe ·Oleg Kolesnikov ·Oleg Skulkin, Group-IB ·Omkar Gudhate ·Patrick Campbell, @pjcampbe11 ·Paul Speulstra, AECOM ·Pedro Harrison ·Praetorian ·Prashant Verma, Paladion ·Rahmat Nurfauzi, PT Xynexis International ·Red Canary ·RedHuntLabs, @redhuntlabs ·Ricardo Dias ·Richard Gold, Digital Shadows ·Richie Cyrus, SpecterOps ·Rob Smith ·Robby Winchester, @robwinchester3 ·Robert Falcone ·Romain Dumont, ESET ·Ryan Becwar ·Ryan Benson, Exabeam ·Sahar Shukrun ·Saisha Agrawal, Microsoft (MSTIC) ·Scott Lundgren, @5twenty9, Carbon Black ·Shailesh Tiwary (Indian Army) ·Shane Tully, @securitygypsy ·Stefan Kanthak ·Sudhanshu Chauhan, @Sudhanshu_C ·Sunny Neo ·Swetha Prabakaran, Microsoft (MSTIC) ·Sylvain Gil, Exabeam ·Tatsuya Daitoku, Cyber Defense Institute, Inc. ·Teodor Cimpoesu ·Tim MalcomVetter ·Tom Ueltschi @c_APT_ure ·Tony Lambert, Red Canary ·Travis Smith, Tripwire ·Tristan Bennett, Seamless Intelligence ·Valerii Marchuk, Cybersecurity Help s.r.o. ·Veeral Patel ·Vincent Le Toux ·Walker Johnson ·Wayne Silva, Countercept ·Ye Yint Min Thu Htut, DBS Bank ·Yonatan Gotlib, Deep Instinct

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 17 |

| 18 |
Things Yet to Come

Mobile ATT&CK Enterprise ATT&CK PRE-ATT&CK
ICS ATT&CK

It's just
Mappings to Controls
Frameworks

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 19 |
More ATT&CK Updates!

Tuesday

Wednesday

1:30 pm TRAM 3:45 pm ATT&CK Sightings

10:15 am ICS ATT&CK 12:00 pm Controls Mapping 2:00 pm CAR and Analytics
3:15 pm PRE Integration

©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

| 20 |
Blake Strom @stromcoffee
attack@mitre.org @MITREattack #ATTACKcon
©2019 The MITRE Corporation. ALL RIGHTS RESERVED. Approved for public release. Distribution unlimited 19-00696-15

