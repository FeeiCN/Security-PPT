Defending Against Malicious Application Compatibility Shims
Sean Pierce

About Me
Sean Pierce, CISSP Threat Emulation Engineer
 Twitter @secure_sean  Code: http://github.com/securesean  Website: http://sdb.tools/  Email: sdb at secure sean dot com

Disclaimer:  Not a Developer  Not an iSIGHT Rep

Proprietary and Confidential Information. © Copyright 2015, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

2

About iSIGHT
 Best commercial cyber threat intelligence provider on the planet  300 Experts. 24 Languages 16 Countries.  Forward looking, adversary focused intelligence, actionable advice  Intelligence for multiple levels: executive, operational and technical
www.isightpartners.com

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

3

History of Application Compatibility
 Third Party bugs
­ Case study: Windows 95 + The SimCity® ­ Flush File Cache ­ Undocumented structs/API's
 OS Bugs
­ Case study: Synchronous Buffer Commits
 "Windows lies to 32-bit apps ... but it's ok because we can make it lie to 64-bit apps too" - Greg

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

4

Fixes, Modes, & Shims
 Fix  Mode  Shim  Fix/Mode Configurations are held in
Shim Database (.sdb) files

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

5

How a Process is Shimmed
1. Parent Process calls CreateProcess()
1. Parent Process checks if process should be shimmed 2. Child Process Resources and shimming code are inserted and initialized 3. Typically the shim hooks the Import Address Table (IAT)
2. Child Process begins executing
1. The shimming code intercepts and manipulates API calls
6

Official Uses
 Microsoft Fix it Patches  EMET  Third party software

Enhanced Mitigation Experience Toolkit

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

7

Application Compatibility Toolkit

Demo:  Undocumented trick  Create fix  Create sdb file  Install sdb file

Caveats  Public version  Does not show patch info  Need to be Admin

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

8

System Alterations
 Registry  File System
9

Detection
 Registry  Registry keys:
­ HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Custom
­ HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\InstalledSDB
 Default File Locations
­ C:\Windows\AppPatch\Custom\ ­ C:\Windows\AppPatch\Custom\Custom64\

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

10

Detection
 Registry  Check add/remove programs
only with sdbinst.exe  Yara/Snort rules

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

11

Detection

 Registry  Check add/remove programs  Yara/Snort rules

rule sdb {
meta: author = "Sean Pierce" description = "Shim Database files"
strings: $magic = { 73 64 62 66 }
condition: $magic at 8 and md5 != "B02B4B8924F019BDE57484A55DC5CA57" and md5 != "BA17F2DA98A8A375D22CB33C8E83A146" and md5 != "EC9D5F0AE38EC4A97E70960264B7D07D" and md5 != "4C7B2F691885878EDBAE48760A7E3FB9" and md5 != "1D8C1280D38C526C7041E72DB8D70DC1" and md5 != "8006552125C9D590843192543668BB0B"
}

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

12

Post Exploitation

 Targeted Persistence. Similar to, but more powerful than
HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options
 API Logging  Kill any app  Catch all creds for an app  Redirect app logs  Snoop/redirect network traffic for an app  Trojanize any app  Force vulnerable DLL loading  Subvert system integrity  UAC prompt bypass (Patched with KB3045645)  Malware obfuscation

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

13

Demo UAC bypass

UAC application manifest flag  sdbinst.exe  SndVol.exe  cleanmgr.exe  control.exe  syskey.exe  70+ classically that are signed

<asmv3:windowsSettings xmlns="http://schemas.microsoft.com/SMI/2005/WindowsSettings">
<autoElevate>true</autoElevate> </asmv3:windowsSettings>

Note: This was changed in KB3045645

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

14

UAC bypass

"C:\Windows\system32\sdbinst.exe" /q "C:\Users\%USERNAME%\AppData\Local\Temp\\..\..\LocalLow\com.%USERNAME%.sdb"

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

15

In the Wild

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

16

BlackEnergy 2

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

17

Roaming Tiger

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

18

Making a Custom Fix
 Make a DLL that Exports:
­ GetHookAPIs(char *, ushort *, ulong *) ­ NotifyShims(char *, unsigned __int16 *, unsigned __int32 *)
 Make an .sdb file that specifies that DLL

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

19

Examples of Offensive Uses

I prefer stealth and misdirection  Malware
­ Anti-Analysis ­ Old to New
 Putty
­ InjectDll with Metasploit, PuttyRider
 Firefox
­ CorrectFilePath for the profile
 Autoruns
­ VirtualRegistry to hide malware
 Shim explorer.exe
­ Hot patch

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

20

Maliciously Compatible Software

 Benign Executables
­ `InjectDll' and `LoadLibraryRedirect' Fixes via a UNC path ­ Patching in new code and/or utilizing existing code akin to ­ ROP (Return Oriented Programming) chains
 Dependently Malicious Executables
­ `kill switch' ­ `IgnoreException' Fix ­ Hot patching instructions to redirect program flow
 Obfuscated Executable
­ The target executable will fail completely without the shim.

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

21

Simple Malware Anti-analysis

Simple Malware Anti-analysis

Malware Obfuscation

 ShellcodeKey will be replaced at runtime to decrypt malicious code
 Neither the patch nor the target program will have the real shellcode

24

Simple Persistence Explorer Shim

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

25

Current Prevention
 Disable via Group Policy (not recommended)
 Remove Shim Engine (NOT recommended)
 Remove sdb installer: C:\Windows\System32\sdbinst (not effective)
 No Admin access

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

26

Current Tools
 Microsoft Application Compatibility Toolkit (public version)  sdbinst.exe  Shim Cache Parser and Shimcache Memory Scan  sdb-explorer.exe  shims.exe  python-sdb
... None help with prevention or detection of malicious shims...

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

27

New Tools

Detect

Shim-File-Scanner Scans Files/Folders for non-default shims Checks registry for installed shims
Shim-Process-Scanner Will search all processes for PEB shim flags Checks for Shim App Helper DLL's are in the process space
Shim-Process-Scanner-Lite Simple script to find loaded Shim App Helper DLL's

Prevent

Shim-Guard Detects and alerts on newly installed shims
Shim-Guard-Lite Flexible Powershell based script Alerts on newly installed shims

Respond

Sdb Ingest Module (Autopsy® ) Searching for SDB files and analyzes them

Sdb Scanner (Volatility)

Scans for Shimmed processes Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

28

New Tools: Sdb Ingest Module & Volatility Plugin
 Autopsy® is an open source graphical forensic file/drive analysis kit built on the command line tools in Sleuth Kit®
 An Ingest Module is an Autopsy plugin that searches for and displays information about sdb files via sdb-explorer
 Volatility is an open source advanced memory forensics framework.

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

29

Black Hat Sound Byte
 Malicious shims are easy to create and widely supported  Malicious shims are already being used in the wild  There is no method of prevention or detection (until now)

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

30

Shim Fix Examples

 "no shim is available to bypass the Windows 7 User Account Control" ­Microsoft
­ RedirectEXE Fix
­ LoadLibraryRedirect Fix
 "This limitation is by design and is intended to reduce the risk to system security posed by allowing non-Microsoft parties to inject potentially harmful code into the loading process" ­Microsoft
­ InjectDll Fix
­ Custom Fixes
 "you are not opening any additional security vulnerability. " -Microsoft "you cannot use shims to bypass any security mechanisms present in Windows" -Microsoft
­ DisableAdvancedRPCClientHardening, Fix
­ DisableWindowsDefender Fix
­ DisableASLR Fix
­ DisableSeh Fix
­ DisableNX Fix

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

31

Questions?
 Example: Is there anything that can't be shimmed?

github.com/securesean and sdb.tools @secure_sean
sdb at secure sean dot com (In case you suddenly realized I'm cool)

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

32

Special Thanks

 Peeps: Jon, Greg, Wyat, & Patrick,  Special Thanks to Elma, Ross, Zach, and 9gag.com

 Other Resources:
­ iSIGHT blog ­ http://blogs.msdn.com/b/oldnewthing/ - Raymond Chen ­ http://blogs.msdn.com/b/cjacks/ - Chris Jackson ­ http://www.alex-ionescu.com/ - Alex Ionescu
 Misc.
­ I apologize that Application Compatibility is the source of so much pain

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

33

Prior Information

Proprietary and Confidential Information. © Copyright 2014, iSIGHT Partners, Inc. All Rights Reserved www.isightpartners.com

34

