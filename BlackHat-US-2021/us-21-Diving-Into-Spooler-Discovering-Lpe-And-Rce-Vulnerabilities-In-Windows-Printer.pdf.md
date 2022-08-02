Diving in to spooler: Discovering LPE and RCE Vulnerabilities in Windows Printer.
Dr. Zhiniang Peng of Sangfor Force XueFeng Li of Sangfor Force Research Team
Lewis Lee of Sangfor Force Research Team

C:\> whoarewe
- Zhiniang Peng Dr. Zhiniang Peng (@edwardzpeng) is the Principal Security Researcher at Sangfor Force.
His current research areas include applied cryptography, software security and threat hunting. He has more than 10 years of experience in both offensive and defensive security and published many research in both academia and industry. - Xuefeng Li
Xuefeng Li (@lxf02942370) is an intern at intern at Force Research Team and a student at South China University of Technology. He has been engaged in Windows vulnerability hunting and exploitation for almost one year and ranked #10 on the MSRC Most Valuable Security Researcher list in 2020.
- Lewis Lee Lewis Lee (@LewisLee53) is an intern at Force Research Team and a student at South
China University of Technology.

Agenda
1. Introduction to Printer Spooler
2. Vulnerability Analysis : Medium2System
2.1 First meet with spooler - CVE-2020-1048 2.2 Mitigation Bypass - CVE-2020-1337 2.3 Mitigation Bypass - CVE-2020-17014 2.4 Mitigation Bypass - CVE-2020-17001 2.5 EvilCopyFileEvent - Configuring Printer is Dangerous
3. Vulnerability Analysis : Remote Code Execution
3.1 Memory Corruption - CVE-2021-24088, CVE-2021-24077,CVE-2021-1722 3.2 PrintNightmare
4. Conclusion

01
Introduction to Printer Spooler

Introduction to Printer Spooler
Add, remove and configure printer Spool high-level function calls into printer jobs Receive and schedule printer jobs for printing

RPC

Main Component

Application

Spoolsv.exe

Localspl.dll

Related Research
Evil Printer: How To Hack Windows Machines With Printing Protocol - Zhipeng Huo and Chuanda Ding A Decade After Stuxnet's Printer Vulnerability: Printing is Still the Stairway to Heaven - PELEG HADAR and TOMER BAR

02
Vulnerability Analysis : Medium2System

First meet with spooler - CVE-2020-1048
Quick review of PrintDemon(CVE-2020-1048 - found by Yarden Shafir & Alex Ionescu)

Step1: Add a Printer Driver

Add-PrinterDriver -Name "Generic / Text Only"

Step2: Add a new printer port Step3: Add a new printer Step4: Add a printer job to printer queue

Add-PrinterPort ­Name "C:\windows\system32\1.txt" Add-Printer -Name "PrintDemon" -DriverName "Generic / Text Only" PortName "c:\windows\system32\1.txt" "Hello, World!" | Out-Printer -Name "PrintDemon"

Step5: Restart spooler or restart your computer

Step6: Resume the printer job. "Hello, World!"` should be written into `C:\windows\system32\1.txt

Root Cause Analysis

Normal steps:

Client Side

1. Add printer driver 2. Add printer port 3. Add new printer 4. Add a printer job 5. Resume your printer job

Vulnerable steps: 1. Add printer driver 2. Add printer port 3. Add new printer 4. Add a printer job 5. Restart spooler 6. Resume your printer job

Sever Side
Save as Shadow Printer Job Impersonate Client

LcmStartDocPort

Save as Shadow Printer Jobs

Initialization

ProcessShadowJobs

Impersonate Self(SYSTEM)

LcmStartDocPort

The Patch of CVE-2020-1048
Client Side
Add-PrinterPort -Name "C:\windows\system32\1.txt"

Sever Side
Impersonate Client
s
PortIsValid("C:\windows\system32\1.txt")
Return Fail

Mitigation Bypass ­ CVE-2020-1337
Case 1 : Using Device Symbolic Links
\Device\HarddiskVolume6 <====> \??\D:
Symlink \??\C: --> \??\D:

Device Symbolic Links only works for current user

Symlink \??\C: --> \??\D:

Running as SYSTEM (Impersonate Client)

Open \??\C:\Windows\1.txt

Reparse ============>

\??\D:\Windows\1.txt

Running as SYSTEM Open \??\C:\Windows\1.txt

Not Reparse ============>

\??\C:\Windows\1.txt

Win Time-Of-Use-Time-Of-Check
Client Side
Device Symlink \??\C:\ ------> \??\D:\ Add-PrinterPort -Name "C:\windows\system32\1.txt"

Sever Side
Impersonate Client
PortIsValid("C:\windows\system32\1.txt")
CreateFileW("D:\windows\system32\1.txt") Return Success
Medium user writable!

Case 2 : Using Junction Attack

Sever Side
Impersonate Client

Client Side
Add-PrinterPort -Name "C:\1\1.txt"
Junction C:\1 ----> C:\Windows\System32
New-Item -Type Junction -Path C:\1 -Value C:\Windows\System32

PortIsValid("C:\1\1.txt") Return Success
Impersonate Self

1. Add new printer 2. Add a printer job 3. Restart your computer 4. Resume your printer job

LcmStartDocPort("C:\1\1.txt") CreateFileW("C:\Windows\System32\1.txt")

Patch of CVE-2020-1337

Patch 1: Adding path redirection check when checking Client Side
Device Symlink \??\C:\ ------> \??\D:\
Add-PrinterPort -Name "C:\windows\system32\1.txt"

Sever Side
Impersonate Client
PortIsValid("C:\windows\system32\1.txt")
CreateFileW("D:\windows\system32\1.txt")

IsPortALink(handle,"C:\windows\system32\1.txt")

Path Redirection attack detected!!!

Patch of CVE-2020-1337
Patch 2: Adding path redirection check when using Client Side
Add-PrinterPort -Name "C:\1\1.txt"
Junction C:\1 ----> C:\Windows\System32
New-Item -Type Junction -Path C:\1 -Value C:\Windows\System32
1. Add new printer 2. Add a printer job 3. Restart your computer 4. Resume your printer job

Sever Side
Impersonate Client
PortIsValid("C:\1\1.txt") Return Success
Impersonate Self
LcmStartDocPort("C:\1\1.txt") CreateFileW("C:\Windows\System32\1.txt")
IsPortALink(handle, "C:\1\1.txt")

Mitigation Bypass - CVE-2020-17014
Fix a bug but bring an arbitrary file deletion bug Client Side
Add-PrinterPort -Name "C:\1\1.txt"

Sever Side
Impersonate Self
LcmStartDocPort("C:\1\1.txt")

New-Item -Type Junction -Path C:\1 -Value C:\Windows\System32 1. Add new printer 2. Add a printer job 3. Restart your computer 4. Resume your printer job

CreateFileW("C:\Windows\System32\1.txt")
IsPortALink(handle, "C:\1\1.txt") If Return Fail
DeleteFileW("C:\1\1.txt") Reparse
DeleteFileW("C:\Windows\System32\1.txt")

Mitigation Bypass - CVE-2020-17001
Bypass IsPortALink ­ found by James Forshaw
 MS uses GetFinalPathNameByHandle to prevent path redirection attack

Behavior of GetFinalPathNameByHandle

Symlink \??\C:\1\1.txt ----> \??\C:\Windows\System32\1.txt

CreateFileW

file handle

GetFinalPathNameByHandle

\??\C:\1\1.txt

\??\C:\Windows\System32\1.txt

Hardlink \??\C:\1\1.txt ----> \??\C:\Windows\System32\1.txt

CreateFileW

file handle

GetFinalPathNameByHandle

\??\C:\1\1.txt

\??\C:\1\.txt

 Unfortunately, MS has released a mitigation for hardlink almost two years ago.

Behavior of GetFinalPathNameByHandle while handling UNC PATH
Administrative Shares (Admin$, IPC$, C$) in Windows 10
 C$ - Default Driver Share  IPC$ - Remote IPC (used in named pipe)  Admin$ - Remote admin (point to %SystemRoot% Directory)
Administrative Shares are used for remote access and can also be accessed locally

Behavior of GetFinalPathNameByHandle while handling UNC PATH

Symlink \??\C:\test\1.txt ---> \??\C:\Windows\System32\1.txt

CreateFileW

file handle

GetFinalPathNameByHandle

UNC PATH
\??\UNC\localhost\$C\test\1.txt

UNC PATH
\??\UNC\localhost\$C\test\1.txt

 Bypass GetFinalPathNameByHandle!!!

Finally fixed the root cause ­ Impersonate Self(SYSTEM)

EvilCopyFileEvent - Configuring Printer is Dangerous
Limited user can create a printer and configure this printer
Add-Printer -Name "PrintDemon" -DriverName "Generic / Text Only" -PortName "C:\1\1.txt" Printer Creator ­ Medium User
Medium user can manage printer

Configure Your Printer

Localspl.dll! SplSetPrinterDataEx

Set different printer attributes to trigger different handler calls

Localspl.dll!SplSetPrinterDataEx

Printer attributes

Handler

Localspl.dll! SplCopyFileEvent Load library?

szFilePath must be a canonical path!

Legal szFilePath for IsModuleFilePathAllowed

X cannot be `/' or `\'

Case 1 : szFilePath is under the C:\Windows\System32\spool\drivers
 C:\Windows\System32\spool\drivers\XXX.DLL  C:\Windows\System32\spool\drivers\XXX\XXX.DLL

Case 2 : szFilePath is under the the root directory of C:\windows\system32
 C:\windows\system32\XXX.DLL  C:\windows\system32\XXX\XXX.DLL

CASE 1 :

 C:\Windows\System32\spool\drivers\XXX.DLL  C:\Windows\System32\spool\drivers\XXX\XXX.DLL  Both them are not medium user writable.

CASE 2 :

 C:\windows\system32\XXX.DLL  C:\windows\system32\XXX\XXX.DLL
 C:\windows\system32\ are not medium user writable.  C:\windows\system32\Tasks\XXX are writable by medium user, but it's illegal
here.

 Seems Not Exploitable?

NTFS Alternate Data Streams (ADS)
 ADS is file attribute only found on the NTFS file system  ADS allows user to create sub streams for a file or a directory by using
separator ":"  ADS is widely abused to write hidden data for malware files
For file ­ C:\1\AAA:BBB AAA is the file or directory name BBB is the ADS on AAA

Medium user can write ADS of C:\Windows\System32\Tasks
C:\Windows\System32\Tasks:exp.dll must meet the CASE 2 - C:\windows\system32\XXX.DLL 

Get SYSTEM Privilege with Twice Printer API Call!

03
Vulnerability Analysis : Remote Code Execution

Memory Corruption - CVE-2021-24088, CVE-2021-24077, CVE-20211722
Retrieves print jobs in a specified printer.
User supplied buffer and size

Root Cause

pJob

Copy

Jobs
Data String pointer
Data String pointer
Data
String
String

Start

pJob Data String pointer Data
String pointer Data

Copy

End

"BBBB"

"AAAA"

Job0 Data StrinStgripnogi0nter Data StrinStgripnogi1nter Data
"AAAA"
"BBBB"

Start End

pJob Data StrinStgripnogi0nter Data StrinStgripnogi1nter Data Data StrinStgripnogi0nter Data StrinStgripnogi1nter Data
"DDDD" "CCCC" "BBBB" "AAAA"

Copy

Job1 Data StrinStgripnogi0nter Data StrinStgripnogi1nter Data
"CCCC"
"DDDD"

End Start

pJob Data StrinStgripnogi0nter Data StrinStgripnogi1nter Data Data StrinStgripnogi0nter Data StrinS"DtgFrFaipnFtogaF"i1nter "EEEE" "DDDD" "CCCC" "BBBB" "AAAA"

Copy
Underflow

Job2 Data StrinStgripnogi0nter Data StrinStgripnogi1nter Data
"EEEE"
"FFFF"

Start

pJob

End

Control the job size

Copy

Job Data DocName Data String Data
"AAAA"
"BBBB"

Controllable size and content

Job DocName

End

Start

pJob "AAAA..."

Copy

"AAAA..."

PrintNightmare

"PrintNightmare"

LPE  RCE LPE

Disable print spooler:
Stop-Service -Name Spooler ­Force Set-Service -Name Spooler -StartupType Disabled

Conclusion
· Spooler is still a good attack surface through years of vulnerabilities disclosure. · Disabled your spooler, if you don't need it.

Q & A Thanks for listening!
Any Questions?

