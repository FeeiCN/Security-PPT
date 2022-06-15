| 1|
ATT&CKing the Status Quo: ThreatBased Adversary Emulation with MITRE ATT&CKTM
Katie Nickels Cody Thomas
SANS Threat Hunting & Incident Response Summit September 6, 2018
©2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 2|
How we define threat hunting "Human act of looking for badness that is not yet detected successfully."
-Sergio Caltagirone
Problem: I need a threat to hunt for! Solution: Create one by emulating real adversaries.
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 3|
Tough questions for defenders
 How do I organize threat hunting?  How do I know that my hunting techniques will work?  Do I have a chance at detecting APT28?  Is the data I'm collecting useful?  Do I have overlapping tool coverage?  Will this *shiny new* product from vendor XYZ help my
organization's defenses?
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 4|
The difficult task of detecting TTPs
Also applies to red teamers!
Source: David Bianco, https://detect-respond.blogspot.com/2013/03/the-pyramid-of-pain.html
David Bianco's Pyramid of Pain
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 5|
What is
?
A knowledge base of adversary behavior
 Based on real-world observations  Free, open, and globally accessible  A common language  Community-driven
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Zooming in on the Adversary Lifecycle

Recon

Deliver

Control

| 6|
Maintain

Weaponize

Exploit

Execute

Enterprise

Mobile ATT&CK
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 7|
What is ATT&CK, really?

Techniques: how the goals are achieved

Tactics: the adversary's technical goals

Initial Access

Execution

Persistence

Privilege Escalation

Defense Evasion

Credential Access

Discovery

Lateral Movement

Collection

Hardware Additions Trusted Relationship
Supply Chain Compromise

Scheduled Task LSASS Driver Local Job Scheduling
Trap

Binary Padding Extra Window Memory Injection
Access Token Manipulation Bypass User Account Control

Credentials in Registry
Exploitation for Credential Access
Forced Authentication

Browser Bookmark Discovery
Network Share Discovery

Exploitation of Remote Services
Distributed Component Object Model

Data from Information Repositories
Video Capture Audio Capture

Spearphishing Attachment
Exploit Public-Facing Application

Signed Binary Proxy Execution
User Execution

Launchctl

Process Injection Image File Execution Options Injection
Plist Modification Valid Accounts

Hooking Password Filter DLL
LLMNR/NBT-NS Poisoning

Peripheral Device Discovery
File and Directory Discovery

Remote File Copy Pass the Ticket
Replication Through Removable Media

Automated Collection Clipboard Data Email Collection Screen Capture

Replication Through Removable Media
Spearphishing via Service
Spearphishing Link Drive-by Compromise
Valid Accounts

Exploitation for Client Execution
CMSTP Dynamic Data Exchange
Mshta AppleScript
Source Space after Filename
Execution through Module Load
Regsvcs/Regasm InstallUtil Regsvr32
Execution through API

DLL Search Order Hijacking AppCert DLLs
Hooking Startup Items Launch Daemon Dylib Hijacking Application Shimming AppInit DLLs
Web Shell
Service Registry Permissions Weakness New Service
File System Permissions Weakness Path Interception
Accessibility Features

Signed Script Proxy Execution
DCShadow Port Knocking
Indirect Command Execution
BITS Jobs Control Panel Items

Private Keys Keychain
Input Prompt Bash History
Two-Factor Authentication
Interception
Replication Through Removable Media

Permission Groups Discovery
Process Discovery
System Network Connections Discovery
System Owner/User Discovery
System Network Configuration Discovery

Windows Admin Shares Pass the Hash
Third-party Software Shared Webroot Logon Scripts
Windows Remote Management
Application Deployment Software

Data Staged Input Capture
Data from Network Shared Drive
Data from Local System Man in the Browser
Data from Removable Media

Procedures ­ Specific technique implementation CMSTP
Process Doppelgänging

Input Capture Network Sniffing

Application Window Discovery

SSH Hijacking AppleScript

Mshta
Hidden Files and Directories

Credential Dumping Kerberoasting
Securityd Memory

Password Policy Discovery
System Time Discovery

Taint Shared Content
Remote Desktop Protocol

PowerShell

Port Monitors

Space after Filename

Brute Force

Account Discovery

Remote Services

Rundll32 Third-party Software

Kernel Modules and Extensions

Sudo Caching SID-History Injection

LC_MAIN Hijacking HISTCONTROL

Account Manipulation Credentials in Files

System Information Discovery

Scripting Graphical User Interface
Command-Line Interface

Port Knocking
SIP and Trust Provider Hijacking
Screensaver

Sudo Setuid and Setgid
Exploitation for Privilege Escalation

Hidden Users Clear Command History
Gatekeeper Bypass Hidden Window

Security Software Discovery
Network Service Scanning

Service Execution

Browser Extensions

Deobfuscate/Decode

© 2018 The MITRE CorporatiWonin.doAwlsl Rreigmhottes reservedRe.-AoppenperdoAvpepdlicaftoiornspublic release. Distribution unlimFiiletes dor 1In8fo-rm15at2io8n-19.

Management

Rc.common

Trusted Developer

Remote System Discovery
Query Registry

Exfiltration
Exfiltration Over Physical Medium
Exfiltration Over Command and Control Channel
Data Encrypted Automated Exfiltration Exfiltration Over Other
Network Medium
Exfiltration Over Alternative Protocol
Data Transfer Size Limits
Data Compressed Scheduled Transfer

Command & Control
Remote Access Tools Port Knocking Multi-hop Proxy
Domain Fronting Data Encoding Remote File Copy Multi-Stage Channels Web Service
Standard Non-Application Layer Protocol
Connection Proxy Multilayer Encryption
Standard Application Layer Protocol
Commonly Used Port
Standard Cryptographic Protocol
Custom Cryptographic Protocol
Data Obfuscation
Custom Command and Control Protocol
Communication Through
Removable Media
Multiband Communication
Fallback Channels Uncommonly Used Port

| 8|
Example Technique: New Service

Description:
Platform: Permissions required: Effective permissions: Detection:
Mitigation:
Data sources: Examples: References:

When operating systems boot up, they can start programs or applications called services that perform background system functions. [...] Adversaries may install a new service which will be executed at startup by directly modifying the registry or by using tools. 1
Windows
Administrator, SYSTEM
SYSTEM
· Monitor service creation through changes in the Registry and common utilities using command-line invocation
·...
· Limit privileges of user accounts and remediate Privilege Escalation vectors ·...
Windows registry, process monitoring, command-line parameters
Carbanak, Lazarus Group, TinyZBot, Duqu, CozyCar, CosmicDuke, hcdLoader, ...
1. Microsoft. (n.d.). Services. Retrieved June 7, 2016.

© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 9|
Example Group: APT28

Description: Aliases: Techniques:
Software: References:

APT28 is a threat group that has been attributed to the Russian government.1 2 3 4 This group reportedly compromised the Democratic National Committee in April 2016.5

Sednit, Sofacy, Pawn Storm, Fancy Bear, STRONTIUM, Tsar Team, Threat Group4127, TG-4127 1 2 3 4 5 6 7

· Data Obfuscation 1 · Connection Proxy 1 8 · Standard Application Layer Protocol 1 · Remote File Copy 8 9 · Rundll32 8 9

· Indicator Removal on Host 5 · Timestomp 5 · Credential Dumping 10 · Screen Capture 10 11 · Bootkit 7 and more...

CHOPSTICK, JHUHUGIT, ADVSTORESHELL, XTunnel, Mimikatz, HIDEDRV, USBStealer, CORESHELL, OLDBAIT, XAgentOSX, Komplex, Responder, Forfiles, Winexe, certutil 1 3 6

1. FireEye. (2015). APT28: A WINDOW INTO RUSSIA'S CYBER ESPIONAGE OPERATIONS?. Retrieved August 19, 2015.

...

© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

How to use it: threat-informed defense, but for real
Threat Intel

Hunting

Detection

Adversary Emulation

© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

What is adversary emulation?
· AKA: Threat-based red teaming · Adversary emulation
· Emulate the techniques of an adversary that's most likely to target your environment
· Focus on the behaviors of those techniques instead of specific implementations

https://giphy.com/explore/hackerman
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

https://tenor.com/view/hackerman-transformation-kung-fury-kung-fury-gif-7263543

Step 1: Choose an adversary and gather threat intel

Gather threat intel

Extract techniques

Analyze & organize

Develop tools

Emulate the adversary

 Identify the adversary you want to emulate
­ Consider who's targeting you and gaps you're trying to assess
 Gather data about that adversary
­ Look for post-exploit information ­ Consider their tools, aliases, and campaigns ­ Think about the time frame

© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 13 |
Choosing an adversary based on gaps

Initial Access

ecution

Persistence

Privilege scalation

Defense vasion

Credential Access

Discovery

ateral ovement

Collection

filtration

Command And Control

rive y Compromise E ploit u lic acing
pplication ardware dditions eplication hrough emova le edia pearphishing ttachment
pearphishing ink
pearphishing via ervice
upply Chain Compromise
rusted elationship
alid ccounts

pple cript C Command ine nterface Control anel tems
ynamic ata E change E ecution through E ecution through odule
oad E ploitation for Client E ecution
raphical ser nterface nstall til aunchctl ocal o cheduling
ri v er shta ower hell egsvcs egasm egsvr undll cheduled ask c ri pti ng ervice E ecution igned inary ro y E ecution igned cript ro y E ecution ourc e pace after ilename hird party oftware rap rusted eveloper tilities

ash profile and ashrc

ccess oken anipulation ccess oken anipulation ccount anipulation

ccessi ility eatures

ccessi ility eatures

inary adding

ash istory

ppCert s

ppCert s

o s

rute orce

pp nit s

pp nit s

ypass ser ccount ControlCredential umping

pplication himming

pplication himming

Clear Command istory

Credentials in iles

uthentication ackage

ypass ser ccount ControlC

Credentials in egistry

o s

earch rder i acking Code igning

E ploitation for Credential ccess

ootkit

yli i acking

Component irmware

orced uthentication

rowser E tensions Change efault ile
ssociation Component irmware Component ect odel
i acking Create ccount

E ploitation for rivilege Escalation

Component ect odel i acking

ooking

E tra indow emory n ection

Control anel tems

nput Capture

ile ystem ermissions eakness

C hadow

nput rompt

ooking

eo fuscate nformation

ecode iles or er eroasting

mage ile E ecution n ection

ptions isa ling

ecurity ools

eychain

earch rder i acking aunch aemon

earch rder i acking

oisoning

yli i acking

ew ervice

ide oading

etwork niffing

E ternal emote ervices ile ystem ermissions eakness idden iles and irectories

ath nterception list odification ort onitors

E ploitation for efense Evasion E tra indow emory n ection
ile eletion

assword ilter
rivate eys eplication hrough emova le edia

ooking

rocess n ection

ile ystem ogical ffsets ecurityd emory

y perv i s or
mage ile E ecution n ection ernel odules and E tensions

cheduled ask

atekeeper ypass

ptions ervice egistry eakness

ermissions idden iles and

i rec tori es

etuid and etgid

idden sers

wo actor uthentication nterc epti on

aunch gent

istory n ection

idden indow

aunch aemon aunchctl C

ddition

tartup tems udo udo Caching

C mage ile E ecution n ection ndicator locking

ptions

ocal o cheduling

alid ccounts

ndicator emoval from ools

ogin tem

e hell

ndicator emoval on ost

ccount iscovery

pple cript

pplication indow

pplication eployment

i s c ov ery

oftware

rows er

ook mark

i s c ov ery

istri uted Component ect odel

ile and

i rec tory

i s c ov ery

E ploitation of erv i c es

emote

etwork ervice canning ogon cripts

etwork hare iscovery

ass the ash

assword olicy iscovery ass the icket

eripheral evice iscovery emote esktop rotocol

ermission roups iscovery emote ile Copy

rocess iscovery uery egistry emote ystem iscovery

emote ervices eplication hrough emova le edia hared e root

ecurity oftware iscovery

i acking

ystem nformation iscovery aint hared Content

ystem etwork Configuration iscovery

hird party oftware

ystem etwork Connections i s c ov ery

indows

dmin

hares

ystem wner ser

indows emote

i s c ov ery

anagement

ystem ervice iscovery

ystem ime iscovery

udio Capture

utomated E filtration

utomated Collection

ata Compressed

Clip oard ata

ata Encrypted

ata from nformation epos i tori es

ata ransfer i e imits

ata from ocal ystem

E filtration ver lternative rotoc ol

ata from etwork hared E filtration ver Command

ri v e

and Control Channel

ata from emova le

edia

E filtration ver etwork edium

ther

ata taged

E filtration ver hysical edium

Email Collection

cheduled ransfer

Commonly sed ort Communication hrough
emova le edia Connection ro y Custom Command and Control rotocol Custom Cryptographic
rotoc ol ata Encoding
ata fuscation
omain ronting
all ack Channels

nput Capture

ulti hop ro y

an in the rowser

ulti tage Channels

creen Capture

ulti and Communication

ideo Capture

ultilayer Encryption

ort nocking

emote ccess ools

emote ile Copy
tandard pplication ayer rotoc ol tandard Cryptographic rotoc ol tandard on pplication ayer rotocol
ncommonly sed ort

e ervice

Notional gaps in

ser E ecution
indows anagement ns trumentati on
indows emote anagement

ogon cripts ri v er
odify E isting ervice etsh elper

ndirect Command E ecution nstall oot Certificate nstall til aunchctl

defenses

ew ervice

C

i acking

ffice pplication tartup

as queradi ng

ath nterception

odify egistry

© 2018 The MITRE Corporation. All rights reservliestd. oAdpifipcarotiovned for public release. Distribution suhntalimited 18-1528-19.

ort nocking

etwork hare Connection emoval

| 14 |
Choosing an adversary based on gaps

Initial Access

ecution

Persistence

Privilege scalation

Defense vasion

Credential Access

Discovery

ateral ovement

Collection

filtration

Command And Control

rive y Compromise E ploit u lic acing
pplication ardware dditions eplication hrough emova le edia pearphishing ttachment
pearphishing ink
pearphishing via ervice
upply Chain Compromise
rusted elationship
alid ccounts

pple cript C Command ine nterface Control anel tems
ynamic ata E change E ecution through E ecution through odule
oad E ploitation for Client E ecution
raphical ser nterface nstall til aunchctl ocal o cheduling
ri v er shta ower hell egsvcs egasm egsvr undll cheduled ask c ri pti ng ervice E ecution igned inary ro y E ecution igned cript ro y E ecution ourc e pace after ilename hird party oftware rap rusted eveloper tilities

ash profile and ashrc

ccess oken anipulation ccess oken anipulation ccount anipulation

ccessi ility eatures

ccessi ility eatures

inary adding

ash istory

ppCert s

ppCert s

o s

rute orce

pp nit s

pp nit s

ypass ser ccount ControlCredential umping

pplication himming

pplication himming

Clear Command istory

Credentials in iles

uthentication ackage

ypass ser ccount ControlC

Credentials in egistry

o s

earch rder i acking Code igning

E ploitation for Credential ccess

ootkit

yli i acking

Component irmware

orced uthentication

rowser E tensions Change efault ile
ssociation Component irmware Component ect odel
i acking Create ccount

E ploitation for rivilege Escalation

Component ect odel i acking

ooking

E tra indow emory n ection

Control anel tems

nput Capture

ile ystem ermissions eakness

C hadow

nput rompt

ooking

eo fuscate nformation

ecode iles or er eroasting

mage ile E ecution n ection

ptions isa ling

ecurity ools

eychain

earch rder i acking aunch aemon

earch rder i acking

oisoning

yli i acking

ew ervice

ide oading

etwork niffing

E ternal emote ervices ile ystem ermissions eakness idden iles and irectories

ath nterception list odification ort onitors

E ploitation for efense Evasion E tra indow emory n ection
ile eletion

assword ilter
rivate eys eplication hrough emova le edia

ooking

rocess n ection

ile ystem ogical ffsets ecurityd emory

y perv i s or
mage ile E ecution n ection ernel odules and E tensions

cheduled ask

atekeeper ypass

ptions ervice egistry eakness

ermissions idden iles and

i rec tori es

etuid and etgid

idden sers

wo actor uthentication nterc epti on

aunch gent

istory n ection

idden indow

aunch aemon aunchctl C

ddition

tartup tems udo udo Caching

C mage ile E ecution n ection ndicator locking

ptions

ocal o cheduling

alid ccounts

ndicator emoval from ools

ogin tem

e hell

ndicator emoval on ost

ccount iscovery

pple cript

pplication indow

pplication eployment

i s c ov ery

oftware

rows er

ook mark

i s c ov ery

istri uted Component ect odel

ile and

i rec tory

i s c ov ery

E ploitation of erv i c es

emote

etwork ervice canning ogon cripts

etwork hare iscovery

ass the ash

assword olicy iscovery ass the icket

eripheral evice iscovery emote esktop rotocol

ermission roups iscovery emote ile Copy

rocess iscovery uery egistry emote ystem iscovery

emote ervices eplication hrough emova le edia hared e root

ecurity oftware iscovery

i acking

ystem nformation iscovery aint hared Content

ystem etwork Configuration iscovery

hird party oftware

ystem etwork Connections i s c ov ery

indows

dmin

hares

ystem wner ser

indows emote

i s c ov ery

anagement

ystem ervice iscovery

ystem ime iscovery

udio Capture

utomated E filtration

utomated Collection

ata Compressed

Clip oard ata

ata Encrypted

ata from nformation epos i tori es

ata ransfer i e imits

ata from ocal ystem

E filtration ver lternative rotoc ol

ata from etwork hared E filtration ver Command

ri v e

and Control Channel

ata from emova le

edia

E filtration ver etwork edium

ther

ata taged

E filtration ver hysical edium

Email Collection

cheduled ransfer

Commonly sed ort Communication hrough
emova le edia Connection ro y Custom Command and Control rotocol Custom Cryptographic
rotoc ol ata Encoding
ata fuscation
omain ronting
all ack Channels

nput Capture

ulti hop ro y

an in the rowser

ulti tage Channels

creen Capture

ulti and Communication

ideo Capture

ultilayer Encryption

ort nocking

emote ccess ools

emote ile Copy
tandard pplication ayer rotoc ol tandard Cryptographic rotoc ol tandard on pplication ayer rotocol
ncommonly sed ort

e ervice

APT29 techniques

ser E ecution
indows anagement ns trumentati on
indows emote anagement

ogon cripts ri v er
odify E isting ervice etsh elper ew ervice ffice pplication tartup

ndirect Command E ecution

nstall oot Certificate

nstall til

aunchctl

C

i acking

as queradi ng

(based only on open source reporting)

ath nterception

odify egistry

© 2018 The MITRE Corporation. All rights reservliestd. oAdpifipcarotiovned for public release. Distribution suhntalimited 18-1528-19.

ort nocking

etwork hare Connection emoval

| 15 |
Choosing an adversary based on gaps

Initial Access

ecution

Persistence

Privilege scalation

Defense vasion

Credential Access

Discovery

ateral ovement

Collection

filtration

Command And Control

rive y Compromise E ploit u lic acing
pplication ardware dditions eplication hrough emova le edia pearphishing ttachment

pple cript C Command ine nterface Control anel tems
ynamic ata E change

pearphishing ink pearphishing via ervice upply Chain Compromise rusted elationship

E ecution through
E ecution through odule oad
E ploitation for Client E ecution
raphical ser nterface

alid ccounts

nstall til

aunchctl

ocal o cheduling

ri v er

shta

ower hell

egsvcs egasm

egsvr

undll

cheduled ask

c ri pti ng

ervice E ecution
igned inary ro y E ecution
igned cript ro y E ecution
ourc e

pace after ilename

hird party oftware

ash profile and ashrc ccessi ility eatures ppCert s pp nit s pplication himming

ccess oken anipulation ccess oken anipulation ccount anipulation

ccessi ility eatures

inary adding

ash istory

ppCert s

o s

rute orce

pp nit s

ypass ser ccount ControlCredential umping

pplication himming

Clear Command istory

Credentials in iles

ccount iscovery

pple cript

pplication indow

pplication eployment

i s c ov ery

oftware

rows er

ook mark

i s c ov ery

istri uted Component ect odel

ile and

i rec tory

i s c ov ery

E ploitation of erv i c es

emote

etwork ervice canning ogon cripts

uthentication ackage

ypass ser ccount ControlC

Credentials in egistry

o s

earch rder i acking Code igning

E ploitation for Credential ccess

ootkit

yli i acking

Component irmware

orced uthentication

rowser E tensions Change efault ile
ssociation Component irmware Component ect odel
i acking Create ccount

E ploitation for rivilege Escalation

Component ect odel i acking

ooking

E tra indow emory n ection

Control anel tems

nput Capture

ile ystem ermissions eakness

C hadow

nput rompt

ooking

eo fuscate nformation

ecode iles or er eroasting

mage ile E ecution n ection

ptions isa ling

ecurity ools

eychain

earch rder i acking aunch aemon

earch rder i acking

oisoning

yli i acking

ew ervice

ide oading

etwork niffing

E ternal emote ervices ile ystem ermissions eakness idden iles and irectories

ath nterception list odification ort onitors

E ploitation for efense Evasion E tra indow emory n ection
ile eletion

assword ilter
rivate eys eplication hrough emova le edia

ooking

rocess n ection

ile ystem ogical ffsets ecurityd emory

y perv i s or
mage ile E ecution n ection ernel odules and E tensions

cheduled ask

atekeeper ypass

ptions ervice egistry eakness

ermissions idden iles and

i rec tori es

etuid and etgid

idden sers

wo actor uthentication nterc epti on

aunch gent

istory n ection

idden indow

etwork hare iscovery

ass the ash

assword olicy iscovery ass the icket

eripheral evice iscovery emote esktop rotocol

ermission roups iscovery emote ile Copy

rocess iscovery uery egistry emote ystem iscovery

emote ervices eplication hrough emova le edia hared e root

ecurity oftware iscovery

i acking

ystem nformation iscovery aint hared Content

ystem etwork Configuration iscovery

hird party oftware

ystem etwork Connections i s c ov ery

indows

dmin

hares

ystem wner ser

indows emote

i s c ov ery

anagement

ystem ervice iscovery

ystem ime iscovery

udio Capture

utomated E filtration

utomated Collection

ata Compressed

Clip oard ata

ata Encrypted

ata from nformation epos i tori es

ata ransfer i e imits

ata from ocal ystem

E filtration ver lternative rotoc ol

ata from etwork hared E filtration ver Command

ri v e

and Control Channel

ata from emova le

edia

E filtration ver etwork edium

ther

ata taged

E filtration ver hysical edium

Email Collection

cheduled ransfer

Commonly sed ort Communication hrough
emova le edia Connection ro y Custom Command and Control rotocol Custom Cryptographic
rotoc ol ata Encoding
ata fuscation
omain ronting
all ack Channels

nput Capture

ulti hop ro y

an in the rowser

ulti tage Channels

creen Capture

ulti and Communication

ideo Capture

ultilayer Encryption

ort nocking

emote ccess ools

emote ile Copy
tandard pplication ayer rotoc ol tandard Cryptographic rotoc ol tandard on pplication ayer rotocol
ncommonly sed ort

e ervice

aunch aemon aunchctl C

ddition

tartup tems udo udo Caching

C mage ile E ecution n ection ndicator locking

ptions

Purple = APT29

rap
rusted eveloper tilities
ser E ecution indows anagement ns trumentati on indows emote anagement

ocal o cheduling ogin tem ogon cripts
ri v er odify E isting ervice etsh elper ew ervice

alid ccounts e hell

ndicator emoval from ools

ndicator emoval on ost

ndirect Command E ecution

nstall oot Certificate

nstall til

aunchctl

C

i acking

techniques that can test our gaps

ffice pplication tartup

as queradi ng

ath nterception

odify egistry

© 2018 The MITRE Corporation. All rights reservliestd. oAdpifipcarotiovned for public release. Distribution suhntalimited 18-1528-19.

ort nocking

etwork hare Connection emoval

Step 2: Extract ATT&CK techniques from reports

Gather threat intel

Extract techniques

Analyze & organize

Develop tools

 Look for behaviors  Store the info in a structured way  Have the threat intel originator do it  Start at the tactic level  Use ATT&CK website examples  Work as a team
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Emulate the adversary

How to extract ATT&CK techniques

https://www.fireeye.com/blog/threat-research/2014/11/operation_doubletap.html

T1068 - Exploitation for Privilege Escalation

T1033 - System Owner/User Discovery

T1059 - Command-Line Interface

T1053 - Scheduled Task T1095 - Standard Non-Application Layer Protocol
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

T1065 - Uncommonly Used Port T1104 - Multi-Stage Channels

How to extract ATT&CK techniques
T1069 - Permission Groups Discovery T1049 - System Network Connections Discovery
T1018 - Remote System Discovery
T1034 - Path Interception T1057 - Process Discovery T1107 - File Deletion
https://recon.cx/2017/montreal/resources/slides/RECON-MTL-2017evolution_of_pirpi.pdf © 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Step 3: Analyze and organize techniques and intel

Gather threat intel

Extract techniques

Analyze & organize

Develop tools

 stablish the adversary's goal  Consider adversary M.O.  Think about the why, what, and how
­ In ATT&CK: Tactic, Technique, Procedure

Emulate the adversary

© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Analyze intel for adversary M.O.

Buckeye seems to target file and print servers, which makes it likely the group is
looking to steal documents

https://www.symantec.com/connect/blogs/buckeye-cyberespionage-group-shifts-gaze-us-hong-kong

They are extremely proficient at lateral movement ... and typically do not reuse command and control infrastructure
https://www.fireeye.com/blog/threat-research/2014/04/new-zero-day-exploit-targeting-internet-explorer-versions-9-through-11-identified-in-targeted-attacks.html
The rarsfx archive is created 5-6 months before this attack ... used the same rarsfx archive with other payloads before
this attack.
https://www.lastline.com/labsblog/an-analysis-of-plugx-malware/
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 21 |
Organize intel into technique flow
 Provide order to
techniques
­ Not going to be perfect
­ Techniques have their own required ordering
­ Feeds the emulation plan
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Organize technique flow into plan phases
 This is the hardest part of the puzzle  No plan will be perfect, so approximate where needed  This isn't a replay of an incident - variation is OK
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Step 4: Develop tools to emulate behaviors

Gather threat intel

Extract techniques

Analyze & organize

Develop tools

Emulate the adversary

 What are the COTS / Open Source tools available?
­ Can you exhibit the right behaviors with these tools? ­ Can you extend or modify them?
 Do you need to develop something specific?
­ Delivery mechanisms, Command and Control, Capabilities
 Create payloads "inspired by" the adversary's tradecraft
­ Modify IoCs and behaviors if possible ­ Obfuscate with purpose, NOT all the things ­ "over-o fuscation" is itself suspicious!

© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

What is behavioral emulation for TTPs?

 Performing adversary techniques with variations

­ dversary created "C:\aos.exe" for Priv Esc via path interception

 You intercept any service path that runs under higher privileges

­ dversary used "PSExec" for ateral ovement

 ou do it manually with "sc.exe" or via ower hell

­ dversary runs "whoami" for iscovery

 You do it with environment variables

"% E

%\% E

E%"

© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Defining your toolset
 Don't limit yourself to a single environment or tool
­ Python, PowerShell, Command-Line, Custom Binary, etc
 Do stay within the behavior boundaries
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Create an Adversary Emulation Field Manual
 Provides multiple implementations across toolsets  Provides offensive command-line examples  Create this as you go, and use for reference later
T1069 Permission Groups Discovery

net

net group

localgroup /domain

wmic group

[and more...]

© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Step 5: Emulate the adversary

Gather threat intel

Extract techniques

Analyze & organize

Develop tools

Emulate the adversary

 Set up infrastructure and test
­ Set up C2 servers & redirector, buy domains, test, install
 Emulate the adversary!
­ Follow the adversary M.O. ­ " omain dmin" most likely isn't your goal ­ eep the "speed of the adversary" in mind
 Low and slow vs smash and grab

© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 28 |
In summary...
 Test your hunting capabilities with adversary emulation  Use threat intelligence to drive your emulation  Move toward a threat-based defense
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

Links
 ATT&CK
­ https://attack.mitre.org ­ github.com/mitre/cti ­ cti-taxii.mitre.org
 ATT&CK Navigator
­ https://github.com/mitre/attack-navigator ­ https://mitre.github.io/attack-navigator/enterprise/
 Adversary Emulation Plans
­ https://attack.mitre.org/wiki/Adversary_Emulation_Plans
 CALDERA: Automated Adversary Emulation
­ https://github.com/mitre/caldera
 Cyber Analytic Repository (CAR)
­ https://car.mitre.org
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

| 30 |

attack.mitre.org

attack@mitre.org

@MITREattack

Katie Nickels

Cody Thomas

@likethecoins
© 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 18-1528-19.

@its_a_feature_

