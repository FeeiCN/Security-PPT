APT Log Analysis
- Tracking Attack Tools by Audit Policy and Sysmon -
Shusei Tomonaga JPCERT Coordination Center

Self-introduction
Shusei Tomonaga Analysis Center at JPCERT/CC
Malware analysis, Forensics investigation.
Written up posts on malware analysis and technical findings on this blog and Github. --http://blog.jpcert.or.jp/ --https://github.com/JPCERTCC/aa-tools

2

Copyright ©2017 JPCERT/CC All rights reserved.

Challenge of Incident Response
Many hosts need to be investigated for APT Incident Response.
Logs required for investigation are not always recorded.
Difficult to detect Lateral Movement.

3

Copyright ©2017 JPCERT/CC All rights reserved.

Approach
If you know what logs are recorded with the lateral movement tools, IR will be easier.
For lateral movement, a limited set of tools are used in many different incidents.

There are some common patterns in the lateral movement methods.

4

Copyright ©2017 JPCERT/CC All rights reserved.

This Presentation Topics



Overview of APT Incident and Lateral Movement



Tools Used by Attackers for Lateral Movement



How to Track Lateral Movement

5

Copyright ©2017 JPCERT/CC All rights reserved.



Overview of APT Incident and Lateral Movement



Tools Used by Attackers for Lateral Movement



How to Track Lateral Movement

6

Copyright ©2017 JPCERT/CC All rights reserved.

Overview of APT Incident and Lateral Movement

1. Infection
2. Initial investigation

5. Sending stolen data
Target Network 3. Internal Reconnaissance

4. Spread of infection AD/
File Server

7

Copyright ©2017 JPCERT/CC All rights reserved.



Overview of APT Incident and Lateral Movement



Tools Used by Attackers for Lateral Movement



How to Track Lateral Movement

8

Copyright ©2017 JPCERT/CC All rights reserved.

Tools Used by Attackers at Lateral Movement
Attackers use not only attack tools but also Windows commands and legitimate tools.
Why attackers use Windows commands and legitimate tools?

They are not detected by antivirus software.

9

Copyright ©2017 JPCERT/CC All rights reserved.

Research of Tools Used by Attackers
Research Methods Investigating C&C servers in three operations.
APT17 (named by FireEye) Dragon OK (named by Palo Alto) Blue Termite (named by Kaspersky)

10

Copyright ©2017 JPCERT/CC All rights reserved.

Lateral Movement: Initial Investigation Initial investigation · Collect information of the infected host
The most used command is tasklist.
If the attacker is not interested in the infected host, they will escape soon.

11

Copyright ©2017 JPCERT/CC All rights reserved.

Windows Command Used by Initial Investigation

Rank 1 2 3 4 5 6 7 8 9 10

Command tasklist ver ipconfig
systeminfo net time netstat whoami net start qprocess query

Count 155 95 76 40 31 27 22 16 15 14

12

Copyright ©2017 JPCERT/CC All rights reserved.

Lateral Movement: Internal Reconnaissance
Internal Reconnaissance
· Look for information saved in the machine and remote hosts within the network

The most used command is dir. --The attacker investigates confidential data
stored in the infected host.
For searching the network, net is used.

13

Copyright ©2017 JPCERT/CC All rights reserved.

Windows Command Used by Internal Reconnaissance

Rank 1 2 3 4 5 6 7 8 9 10

Command dir
net view ping
net use type
net user net localgroup
net group net config net share

Count 976 236 200 194 120 95 39 20 16 11

14

Copyright ©2017 JPCERT/CC All rights reserved.

NET Command
net view -- Obtain a list of connectable domain resources net user -- Manage local/domain accounts net localgroup -- Obtain a list of users belonging to local groups net group -- Obtain a list of users belonging to certain domain groups net use -- Access to resources

15

Copyright ©2017 JPCERT/CC All rights reserved.

Example: dir command

Searching Network Drive

> dir ¥¥FILESV01¥SECRET > %TEMP%¥a.txt
¥¥FILESV¥SECRET Directory
2014/07/11 09:16 [DIR] Management of Partner Companies 2014/09/04 11:49 [DIR] Management of Intellectual Property

Searching Document Files

> dir c:¥users¥hoge¥*.doc* /s /o-d c:¥users¥hoge¥AppData¥Local¥Temp Directory 2014/07/29 10:19 28,672 20140820.doc 1 File 28,672 bytes c:¥users¥hoge¥Important Information Directory 2015/08/29 10:03 1,214 Design Document.doc

/s : Displayed recursively /o-d : Sorted by date

16

Copyright ©2017 JPCERT/CC All rights reserved.

Lateral Movement: Spread of Infection
Spread of infection
· Infect the machine with other malware or try to access other hosts

The most used command is at.
--"at" command is not supported on Windows 10, Windows 8.1 etc.
--If "at" command can not be used, schtasks is used.
Uses password and hash dump tools.

17

Copyright ©2017 JPCERT/CC All rights reserved.

Windows Command Used by Spread of Infection

Rank 1 2 3 4 5 6 7 8

Command at reg
schtasks wmic wusa
netsh advfirewall sc
rundll32

Count 103 31 29 24 7 4 4 2

18

Copyright ©2017 JPCERT/CC All rights reserved.

Remote Command Execute Used Windows Command
at command > at ¥¥[IP Address] 12:00 cmd /c "C:¥windows¥temp¥mal.exe"
schtasks command
> schtasks /create /tn [Task Name] /tr C:¥1.bat /sc onstart /ru System /s [IP Address]

19

Copyright ©2017 JPCERT/CC All rights reserved.

Remote Command Execute Used Windows Command
wmic command
> wmic /node:[IP Address] /user:"[User Name]" /password:"[PASSWORD]" process call create "cmd /c c:¥Windows¥System32¥net.exe user"

20

Copyright ©2017 JPCERT/CC All rights reserved.



Overview of APT Incident and Lateral Movement



Tools Used by Attackers for Lateral Movement



How to Track Lateral Movement

21

Copyright ©2017 JPCERT/CC All rights reserved.

How to Track Lateral Movement
The Event logs that can be used for incident response are not recorded
with default Windows settings.
How to get evidence of executed tools?

We propose a detection method using Audit Policy and Sysmon.

22

Copyright ©2017 JPCERT/CC All rights reserved.

Lateral Movement Tracking by Audit Policy and Sysmon

Research Methods Testing 44 attack tools on the host that installed Sysmon and enabled Audit Policy.

OS

-- Windows 7, 8.1, 2008 and 2012

Sysmon

-- Version 4

Test tools

-- 17: Windows Commands -- 27: Attack Tools

23

Copyright ©2017 JPCERT/CC All rights reserved.

Test Tools List

wmic RDP icacls
PsExec

PowerShell ntdsutil wevtutil

Windows Commands

at

winrm

vssadmin

net user

csvde

ldifde

winrs net use dsquery

sdelete

Legitimate Tools

WebBrowser PassView

Remote Desktop PassView

BITS net share
Mail PassView

PWDump7 lslsass

Password Dump Tools

PWDumpX

WCE

FindGPOPasswords.ps1

gsecdump

Mimikatz Quarks PwDump

24

Copyright ©2017 JPCERT/CC All rights reserved.

Test Tools List

MS14-058

Exploits

MS15-078

MS14-068

SDB UAC Bypass

wmiexec.vbs

BeginX

Other Tools
Htran

Fake wpad

timestomp

25

Copyright ©2017 JPCERT/CC All rights reserved.

Results Overview

Detected 37 out of 44 attack tools using Audit Policy and Sysmon.

Settings
Default Settings
Sysmon / Audit Policy

Detect
6 37

Not Detect
38 7

26

Copyright ©2017 JPCERT/CC All rights reserved.

Detected with Default Windows Settings

The tools installed by default in Windows leave execution traces of evidence.

Detected tools example (Default installed tools only)

--RDP

--at

--WinRM, WinRS

--wevtutil

--BITS

27

Copyright ©2017 JPCERT/CC All rights reserved.

Detected with Sysmon and Audit Policy

If Sysmon and Audit Policy are enabled, many attack tools can be detected.

Detected tools example

--WCE

--Mimikatz

--net command

--csvde

--Privilege Escalation Exploit etc.

28

Copyright ©2017 JPCERT/CC All rights reserved.

Sysmon and Audit Policy record many logs
Source Host (Default Setting) Destination Host (Default Setting)
Process Execution, Connection Request, and File Access are not recorded.

29

Copyright ©2017 JPCERT/CC All rights reserved.

Sysmon and Audit Policy record many logs

Source Host (+ Sysmon)

Destination Host (+ Sysmon)

Process Execution (Sysmon: 1)

Connection Request (Sysmon: 3)

Inbound (Sysmon: 3)

Inbound (Sysmon: 3)

Process Terminate (Sysmon: 9)

30

Copyright ©2017 JPCERT/CC All rights reserved.

Process Execution (Sysmon: 1)
Outbound (Sysmon: 3) Process Terminate (Sysmon: 9)

Sysmon and Audit Policy recode many logs
Source Host (+ Audit Policy) Destination Host (+ Audit Policy)
Process Execution (Sysmon: 1Audit: 4688)

Connection Request (Sysmon: 3Audit: 5156)

Inbound (Sysmon: 3Audit: 5156)

Send Command (Audit: 5156)

Logon (Audit: 4624) Inbound (Audit: 5156)

Process Execution (Sysmon: 1Audit: 4688)

Object Access (Audit: 465646634658)

Inbound (Sysmon: 3Audit: 5156)

Outbound (Sysmon: 3Audit: 5156)

Process Terminate (Sysmon: 9Audit: 4689) Process Terminate (Sysmon: 9Audit: 4689)

31

Copyright ©2017 JPCERT/CC All rights reserved.

Do we need Sysmon? Answer: YES
Audit Policy can record more logs than Sysmon.

However, Audit Policy can not record command line options.

Sysmon can record all command line.

32

Copyright ©2017 JPCERT/CC All rights reserved.

Example of Detecting with Audit Policy [1]
When the attack tool is executed, the fact that a temporary file may be created is recorded.
Example: WCE

33

Copyright ©2017 JPCERT/CC All rights reserved.

wceaux.dll

Example of Detecting with Audit Policy [2]
When the attack tool is executed, the fact that a temporary file may be created is recorded.
Example: csvde

34

Copyright ©2017 JPCERT/CC All rights reserved.

csv[number].tmp

Event ID for Audit Policy

ID

Overview

ID

Overview

4624 Account logon

4689 Process termination

4634 Account logoff

4720 Account creation

4648 A specified logon attempt by a particular account

4726 Account deletion

4656 A handle request for reading or writing an object

4728 Addition of a member to a group

4658 Ending the use of and releasing of a handle

4729 Removal of a member from a group

4690

Duplication of an existing handle for use in other processes

4768/ 4769

An authentication request for an account

4660 Deleting an object

4946 Addition of a Windows Firewall rule

4663 Access made to an object

5140 Access to network share

4661 A handle request to SAM

5142 Creation of a new network share

4672

Assignment of special privileges to a particular logon instance

5144 Deletion of a network share

4673 Execution of a process requiring particular privileges

5145 Confirmation of whether a file share point can be used

4688 Startup of a process

5154 Port listening by an application or service

35

Copyright ©2017 JPCERT/CC All rights reserved.

Example of Detecting with Sysmon All Windows commands can be recorded by Sysmon.
Example: net use
Command details "cmd /c" = Remote shell

36

Copyright ©2017 JPCERT/CC All rights reserved.

Malicious process name that executed the command.

Event ID for Sysmon

ID

Overview

1

Process creation

2

A process changed a file creation time

3

Network connection

4

Sysmon service state changed

5

Process terminated

6

Driver loaded

7

Image loaded

8

CreateRemoteThread

9

RawAccessRead

10

ProcessAccess

11

FileCreate

12

RegistryEvent (Object create and delete)

13

RegistryEvent (Value Set)

14

RegistryEvent (Key and Value Rename)

15

FileCreateStreamHash

37

Copyright ©2017 JPCERT/CC All rights reserved.

Supported Version
5.0 5.0 5.0 5.0 5.0

Tools not Detected with Sysmon and Audit Policy

Example

--PWDump7

--gsecdump

--lslsass

--Mail PassView

--WebBrowserPassView

--Remote Desktop PassView

--dsquery

38

Copyright ©2017 JPCERT/CC All rights reserved.

More Details About This Research
Released a research report. "Detecting Lateral Movement through Tracking
Event Logs"
How to download. --https://www.jpcert.or.jp/english/pub/sr/ir
_research.html

39

Copyright ©2017 JPCERT/CC All rights reserved.

More Details About This Research Describes the 44 tools in this report.

40

Copyright ©2017 JPCERT/CC All rights reserved.

Notes
The amount of logs increases when the audit policy is enabled, and log rotation accelerates.
When enabling the audit policy, consider changing the maximum size of event logs to be stored.
The maximum size of event logs can be changed with Event Viewer or the wevtutil command.

41

Copyright ©2017 JPCERT/CC All rights reserved.

Future Work

This report will be updated.
--Support Windows 10 --Update Sysmon version 5 --Add forensic architecture
USN Journal, AppCompatCache, UserAssist etc.
--Add network architecture
Proxy, Firewall etc.
--Add other attack tools

42

Copyright ©2017 JPCERT/CC All rights reserved.

Conclusion
Typically, limited set of tools and commands are used for Lateral Movement.

Many attack tools can be detected with audit policy and Sysmon.

Our report would be helpful if you are investigating APT incidents.

43

Copyright ©2017 JPCERT/CC All rights reserved.

Thank you!
Please give us feedback. e-mail: aa-info@jpcert.or.jp

44

Copyright ©2017 JPCERT/CC All rights reserved.

