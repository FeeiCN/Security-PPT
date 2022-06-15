fdfd
Dark Corners of Windows
Registry Analysis
by Ravindu W Meegasmulla Associate Information Security Engineer

About Me ?
 Working with Sri Lanka CERT over 4 years  Conducted over 100 digital forensic investigations

Agenda
 Introduction to Windows Registry
 Structure  Viewing the Windows registry
 Registry Analysis tools  Registry Based Investigation
 Time Zone Investigation  Last Shutdown time  Operating System information  Users in the system  Mounted devices  Connected USB devices  Network related investigation  Tracking User Activities

Topics not Covered
 Deep analysis of Connected USB devices

Windows Registry?
 It is a hierarchical database which contains the settings and configurations for the computer, hardware,services,security, and users etc.
 Active when operating system boots/starts  Four main hives will read into the memory
 Software ­ Information/Settings related to software installed on the system  System ­ Information/Settings related to the system  Security ­ Information/Settings related to security of the system  SAM ­ Information/Settings related to users of the system
 "NTUSER.DAT" registry file will come alive when a user authenticate to the system

2-Ways of viewing the registry
 Using a run command "regedit"
 Using a digital forensic investigation tool
 Mount the 4 main hives located in below locations to the tool
 windir\system32\config\System  windir\system32\config\Software  windir\system32\config\Security  windir\system32\config\SAM

View from a forensic tool - EnCase

Confusing?

Subtree/Key HKEY_LOCAL_MACHINE
HKEY_LOCAL_MACHINE
HKEY_LOCAL_MACHINE
HKEY_USERS HKEY_LOCAL_MACHINE\BCD00000000 HKEY_CURRENT_USERS

Filename
windir\system32\config\ System\
windir\system32\config\ Software
windir\system32\config\ Security
windir\system32\config\SAM
\Boot\BCD
NTUSER.DAT

Structure of the Registry

Registry Analysis Tools
 Regedit.exe  Reg.exe  Autoruns.exe  Scripting tools
­ Ex: Perl Win32::TieRegistry
 Regshot  RegMon  Build into tools Encase, F-Response, FTK  RegRipper, RIP.pl, regslack

When to use registry analysis
 Network related investigations  Malware infections  Suspicious user activities  Fake document forgery investigations  And many more

Registry Investigation
 Finding out the Time Zone
­ Located in SYSTEM Hive ­ What are ControlSets?
 Contains system configuration information (Devices, Drivers and Services)  System:NTRegistry/CMI-CreateHive[xxxxx]/ControlSet001/Control/TimeZoneinformation  Regedit location - HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control  Values are stored in little-endian format(least significant bytes are processed first) 32-bit integer and
displayed as hex values


Registry Investigation
 Time Zone Contd.

Registry Investigation
 Time Zone Contd.

Registry Investigation
 Identify last shutdown time period  System\ControlSet001\Control\TimeZoneinformation\Windows

Registry Investigation
 Identifying the OS information and OS installed date/time
 Information can be found in the SOFTWARE Hive
 Software Hive\Microsoft\Windows NT\CurrentVersion\ProductName  Software Hive\Microsoft\Windows NT\CurrentVersion\CurrentVersion
 Software Hive\Microsoft\Windows NT\CurrentVersion\InstallDate

Registry Investigation
 Users in the system  Our goal is to:
 Identify the domain users and local users in the system

Registry Investigation
 Users in the system contd.
 Windows Security and Relative ID  SID is used to identify the computer system  RID is used to identify the specific user  SID appears as:
 S-1-5-21-3774130484-663992614-3010368698-1000
 USER ID (RID)
 Administrator ­ 512  Guest ­ 501  Custom users ­ 1000 onward

Registry Investigation
 Users in the system contd.
 SAM Hive
 Finding SID using terminal

Registry Investigation
 Mounted Devices & USB Devices  Our goal is to
 Identify the mounted devices  Gather more information on each mounted devices  Finding the HardwareID  Map the hardwareID with the USB devices found in the crime scene

Registry Investigation
 Mounted Devices
 List of Mounted devices on a system  SYSTEM\MountedDevices

Registry Investigation
 USB Devices
 SYSTEM\ControlSet001\Enum\USBSTOR\

Registry Investigation
 Network related investigations.  Our goal is to:
 Identifying Network Interface Cards  Identifying IP addresses, DHCP Server, LeaseObtainedTime, LeaseTerminatedTime, etc.  Identifying the SSID  Identifying the MAC address of the Wireless access point.

Registry Investigation
 Network related investigations Contd.
 Finding the NIC's
 SOFTWARE\Microsoft\WindowsNT\CurrentVersion\NetworkCards  GUID is important
 Finding more information
 SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\{GUID}

Registry Investigation
 Network related investigations Contd.

Registry Investigation
 Network related investigations Contd.
 LeaseObtainedTime
 LeaseTerminatedTime
 Identified what time frame this interface connected to the network.  Which network is connected to remains to be discovered.

Registry Investigation
 Network related investigations Contd.
 Identifying the network profiles
 Software\Microsoft\WindowsNT\CurrentVersion\NetworkList\Profiles  Each Profile has unique GUIDs

Registry Investigation
 Network related investigations Contd.
 Finding the MAC address of the wireless access point
 Software\Microsoft\Windows\WindowsNT\CurrentVersion\NetworkList\Signatures\Unmanaged

Registry Investigation
 Tracking User Activities  Our goal is to:
­ Identifying the user behavior

Registry Investigation
 Identifying MRU (Most Recently Used) files on a suspect computer system (Tracking User activities) - NTUSER.DAT
 Contains User-specific data
 Located at root of each user account on the system
 Typed Url's
 NTUSER.DAT\Software\Microsoft\Internet Explorer\TypedURLs
 Opened Recent Documents
 NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs  MRUListEx will record the order in which the files were accessed  Each file number is represented in 8 bytes hexadecimal format. Convert each to 32-bit integer  Each file extension has its own folder.
 Contains MRUListEx  File name

Registry Investigation
 Tracking User activities Contd.

Registry Investigation
 Tracking User activities Contd.

Registry Investigation
 Tracking User activities Contd.  User Assist Keys  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\ Explorer\UserAssist\{GUID}\Count  Mostly frequently opened EXE and LNK files  Keys are encrypted with ROT-13  What action user took through shell  Also shows when it has happened  Encase Provides Enscrpt to decode  UserAssistView tool can be used https://www.nirsoft.net/utils/userassist_view.html

Registry Investigation
 Tracking User activities Contd.  User Assist Keys contd.

Registry Investigation
 Tracking User activities Contd.  Enscript

Registry Investigation
 Tracking User activities Contd.  UserAssistViewer ­ On a running machine

Registry Investigation
 Tracking User activities Contd.  RunMRU  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\ Explorer\RunMRU  Most recently used typed items. (Start button, Run commands, etc.)  MRUList will shows the order

Registry Investigation
 Tracking User activities Contd.  OpenSaveMRU  Files that have been opened or saved with a windows shell dialog box  NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\ Explorer\ComDlg32\OpenSavedPIDlMRU

Registry Investigation
 Tracking User activities Contd.  OpenSaveMRU Contd.  Each file extension have a folder  Each folder have a MRUListEx to order  * folder will contain information about the latest 10 files regardless of the file extension  File Name and location

Registry Investigation
 Tracking User activities Contd.  FileExts - NTUSER.DAT\Software\Microsoft\Windows\CurrentVersion\ Explorer\FileExts  Tell the system what application to use to open a file  Folders with each file extension  Each folder contains MRUList to list the order of applications

Registry Investigation
 What if there are no values?
 "Absence of evidence is not evidence of absence"  Windows washer removes the registry entries  Last run times of windows washer becomes evidence

Thank You ! &
Any Questions?

