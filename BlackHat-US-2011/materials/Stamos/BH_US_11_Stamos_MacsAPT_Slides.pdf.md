.

.

Macs in the Age of APT

.

.. .

.

Tom Daniels, Aaron Grattafiori, BJ Orvis, Alex Stamos, Paul Youn

iSEC Partners

Black Hat USA 2011

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 1 / 73

Agenda
. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering Initial Exploitation Local Privilege Escalation Network Privilege Escalation Persistence Exploration Exfiltration
. .3. Conclusion Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 2 / 73

Outline

Motivation Preface and Background

. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering Initial Exploitation Local Privilege Escalation Network Privilege Escalation Persistence Exploration Exfiltration
. .3. Conclusion Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 3 / 73

What is APT?
Apple Purchases Tacos?

Motivation Preface and Background

Advanced: not your average Joe, may be government funded, may have zero-day vulnerabilities.
Persistent: initial access leads to the creation of many access methods and long-term exploration
Threat: defines the group of attackers with these capabilities, not an actual attack scenario

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 4 / 73

Case Study: Aurora
What the what?

Motivation Preface and Background

Originally disclosed by Google on January 12th 2010
Google discovered evidence of >30 other victims
Attack was focused on Windows exploitation and escalation in AD
Estimates range from dozens to hundreds of companies attacked¹ Google DuPont Adobe Juniper Networks Northrop Grumman Sony And many more

¹http://threatpost.com.mx/en_us/blogs/

hbgary- e- mails- dupont- other- firms- hit- aurora- attack- 031011

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 5 / 73

Motivation Preface and Background
Case Study: Aurora
Socially engineer a victim to click on a malicious link

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 6 / 73

Motivation Preface and Background
Case Study: Aurora
Socially engineer a victim to click on a malicious link

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 7 / 73

Case Study: Aurora
Escalate network privileges

Motivation Preface and Background

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 8 / 73

Case Study: Aurora
Make your attack more persistent

Motivation Preface and Background

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 9 / 73

Case Study: Aurora
Explore

Motivation Preface and Background

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 10 / 73

Case Study: Aurora
Exfiltrate the data

Motivation Preface and Background

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 11 / 73

Outline

Anatomy of an APT Social Engineering
.

. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering
Initial Exploitation
Local Privilege Escalation
Network Privilege Escalation
Persistence
Exploration
Exfiltration . .3. Conclusion
Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 12 / 73

Your Mac is Safer

Anatomy of an APT Social Engineering

Apple has a small computer market share (6-8%)²
Building a bot-net? Go for Windows users There are fewer viruses and malware applications for Mac
No exploits included in common crimeware toolkits targeting Macs³ Attacks focus on social engineering (such as Mac Defender)

²http://www.networkworld.com/news/2011/060611-mac-os-security.html

³See iSEC consultant Dan Guido's research

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 13 / 73

Anatomy of an APT Social Engineering
Training Mac Users to Feel Safe
A history of non-exploitation Go ahead, run this unsigned binary Who needs anti-virus?

http://news.cnet.com/8301-27080_3-10444561-245.html

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 14 / 73

Anatomy of an APT Social Engineering
Apple Marketing is Misleading
Sort of like all marketing (unrelated: hire iSEC because we are the best at everything)
. "OS X doesn't get PC viruses" Other things OS X can't catch:
A Nintendo Wii virus Mad cow disease, malaria, or chickenpox Footballs (we tried) OS X is still vulnerable to malware (like almost any computer system)
http://www.apple.com/macosx/security/

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 15 / 73

Anatomy of an APT Social Engineering
Mac Users are Susceptible to Social Engineering
Mac users aren't as paranoid as Windows users

Mac Defender Mac users may be easy to socially engineer

https://discussions.apple.com/message/15242642#15242642

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 16 / 73

OS X isn't Safer

Anatomy of an APT Social Engineering

14.3% of publicly disclosed OS vulnerabilities affected OS X in 2008

Latest OS X security patch addressed 39 CVEs 1,151 CVEs reported in the last 3 years affect Apple (including third-party software) Similar number of Windows CVEs (1,325) Safety in numbers

Subsequent annual reports focused on mobile operating systems. Source:

http://www-935.ibm.com/services/us/iss/xforce/trendreports/

xforce- 2008- annual- report.pdf

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011

17 / 73

Back to APT

Anatomy of an APT Social Engineering

Targeted attackers don't care what OS a corporation is running Mac users may be more vulnerable Social Engineering Plenty of vulnerabilities lead to "Initial Exploitation"

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 18 / 73

Outline

Anatomy of an APT Initial Exploitation
.

. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering
Initial Exploitation
Local Privilege Escalation
Network Privilege Escalation
Persistence
Exploration
Exfiltration . .3. Conclusion
Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 19 / 73

Anatomy of an APT Initial Exploitation
Exploitation in APT
Get user to click a link And then exploit...
Railroad user into an installer with Safari's safe files Browser or plugin exploit

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 20 / 73

Anatomy of an APT Initial Exploitation
Safari's open "safe" files includes installers

.pkg and .mpkg files

.

A .zip containing a .pkg runs Installer.app

User must click through

MACDefender and variants triggered a "4-5x higher than normal" call volume with AppleCare when it hit

http://blog.intego.com/2011/05/02/

macdefender- rogue- anti- malware- program- attacks- macs- via- seo- poisoning/
http://www.zdnet.com/blog/bott/

an- applecare- support- rep- talks- mac- malware- is- getting- worse/3342?pg=1

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011

21 / 73

Anatomy of an APT Initial Exploitation
File Quarantine and XProtect

File Quarantine Part of the LaunchServices API Quarantine properties dictionary
const CFStringRef kLSItemQuarantineProperties
XProtect Signature-based scanner Piggy-backs on File Quarantine
Downloaded files marked with extended attribute LaunchServices triggers scan
In its infancy on Mac OS X (introduced in 10.6) Security Update 2011-003: Malware database now updates daily

http://support.apple.com/kb/HT4657

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 22 / 73

Anatomy of an APT Initial Exploitation
Anti-exploit Mitigations

Mitigation availability:

Mitigation Stack Protections Heap Protections DEP ASLR

Windows 2003 (Visual Studio's /GS) 2003 (XP SP2)¹ 2004 (XP SP 2) 2007 (Vista)

Mac OS X 2007 (10.5/XCode 3.1) 2009 (10.6) 2006 (10.4.4 Intel) 2007 (10.5)

¹http://blogs.technet.com/b/srd/archive/2009/08/04/

preventing- the- exploitation- of- user- mode- heap- corruption- vulnerabilities.aspx

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011

23 / 73

Smash the Stack

Anatomy of an APT Initial Exploitation

GCC ProPolice can be used at compile-time ( GCC  4.1 ) 10.5/XCode 3.1: GCC 4.2 first included, but not the default (GCC 4.0) 10.6/XCode 3.2: GCC 4.2 the default, -fstack-protector enabled by default Binaries built using older toolchain may not have it enabled

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 24 / 73

Break the Heap

Anatomy of an APT Initial Exploitation

Mac OS X 10.5: checksum -- not a security protection 10.6: Include a security cookie -- better¹¹
Windows XP SP2 and Server 2003¹²: Safe unlinking and heap entry header cookie Vista and later: Numerous additional heap protections

¹¹http://securityevaluators.com/files/papers/SnowLeopard.pdf ¹²http://blogs.technet.com/b/srd/archive/2009/08/04/

preventing- the- exploitation- of- user- mode- heap- corruption- vulnerabilities.aspx

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011

25 / 73

NX/DEP/ED

Anatomy of an APT Initial Exploitation

Supported on Intel architectures Sets the default mprotect() exec flag for heap and stack 10.6: heap always executable for 32-bit binaries
not even mprotect() can disable
10.7: 32-bit binaries compiled on 10.6 still have always-executable heaps

10.4

10.5

10.6

10.7

i386 i386 x86_64 i386 x86_64 i386 x86_64

Stack Yes Yes Yes Yes Yes Yes Yes

Heap No No No No Yes Yes Yes

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 26 / 73

ASLR

Anatomy of an APT Initial Exploitation

.
10.5: First introduced 10.6: No major changes
Not all libs use it Not application code Not the stack or heap ROP exploits possible using dyld¹³
10.7: Supposedly improved¹

¹³http://securityevaluators.com/files/papers/SnowLeopard.pdf

¹http://www.apple.com/macosx/whats-new/features.html#security

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 27 / 73

Back to APT

Anatomy of an APT Initial Exploitation

Been behind Microsoft, but finally catching up DEP and ASLR are not configurable Backwards compatibility threats

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 28 / 73

Outline

Anatomy of an APT Local Privilege Escalation
.

. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering
Initial Exploitation
Local Privilege Escalation
Network Privilege Escalation
Persistence
Exploration
Exfiltration . .3. Conclusion
Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 29 / 73

Anatomy of an APT Local Privilege Escalation
Accessing Patient Zero's Data
Information stored on disc
Locally stored E-mail Safari History, Bookmarks iChat logs Spotlight DBs

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 30 / 73

Anatomy of an APT Local Privilege Escalation
Escalating Privilege
Attacking the login keychain
Code execution doesn't mean full account access The "Login Keychain" can be used to brute-force the user's password

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 31 / 73

Anatomy of an APT Local Privilege Escalation
Escalating Privilege
Sudo make me a sandwich¹
If a user is a sudoer, password can directly escalate privilege User password can be used to decrypt the "Login Keychain" Privileged credentials in the keychain can be used to spread and explore

¹http://xkcd.com/149/
Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 32 / 73

Anatomy of an APT Local Privilege Escalation
Escalating Privilege
Phishing for admin
OS X requires authorization for privileged action:

Windows UAC screen slightly harder to spoof

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 33 / 73

Anatomy of an APT Local Privilege Escalation
Escalating Privilege
Phishing for admin
This application sends admin credentials offsite in an HTTP "GET"

"GET /paul/Usernameis/isecadmin/Password/p@ssw0rd HTTP/1.1"
UAC can be spoofed on Windows as well

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 34 / 73

Anatomy of an APT Local Privilege Escalation
Lion Improvements
AppSandbox: a safer place to play

Subscription-based via plist
<key>com.apple.security.app-sandbox</key> <true/>
Per application container
export $HOME=~/Library/Containers/app.bundle.id/Data
Per session entitlements Powerbox (pboxd)
sandbox-free broker process transparent to developers (NSOpenPanel/NSSavePanel)

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 35 / 73

Anatomy of an APT Local Privilege Escalation
Lion Improvements
AppSandbox: cool kids use least privileges
Entitlements
com.apple.security.documents.user-selected com.apple.security.assets com.apple.security.network com.apple.security.personal-information com.apple.security.device
Temporary Exceptions $HOME/absolute file access Send Apple Events Look up mach services Inherit

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 36 / 73

Anatomy of an APT Local Privilege Escalation
Lion Improvements
XPC: Intra-application privilege separation

libSystem IPC API XPC binaries stored in Bundle.app/Contents/XPC
Address space isolation Fully restricted sandbox by default Elevating XPC service to root is unsupported
On-demand launching integration with GCD and launchd
Quicktime Player uses a low-privileged process called VTDecoderXPCService¹

¹http://arstechnica.com/apple/reviews/2011/07/mac-os-x-10-7.ars/9

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 37 / 73

Back to APT
What can the local user do

Anatomy of an APT Local Privilege Escalation

Access valuable local data Brute-force a valuable credential store Phish for admin credentials Help is on the way?

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 38 / 73

Outline

Anatomy of an APT Network Privilege Escalation
.

. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering
Initial Exploitation
Local Privilege Escalation
Network Privilege Escalation
Persistence
Exploration
Exfiltration . .3. Conclusion
Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 39 / 73

Anatomy of an APT Network Privilege Escalation
Network Security Weaknesses
Application Level Firewall

By default, signed binaries can open listening ports and holes in the firewall
But some signed binaries are "dangerous" A case study...
Netcat is signed Netcat is in a special blacklist The blacklist is based on a path, the signature is within the file Copy the file -> win the game
Other signed binaries that can open ports (that are not blacklisted) likely exist
And there are other weaknesses in Apple's enterprise protocols

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 40 / 73

Anatomy of an APT Network Privilege Escalation
Lots of Services Makes Us Enterprise, Right?
Right?

Presented at SOURCE Seattle Looked at Snow Leopard Server (10.6)
28 network ports open after default install!!!
A quick (incomplete) look:

Service AFP ARD Bonjour ServerAdmin

Best Auth Method Kerberos Custom (DH) None Self Signed Cert

Integrity? No No No Yes (SSL)

Confidentiality? No Yes (AES) No Yes (SSL)

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 41 / 73

Anatomy of an APT Network Privilege Escalation
Bonjoof Beta
File server offering ARD services

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 42 / 73

Anatomy of an APT Network Privilege Escalation
Bonjoof Beta
Administrator enjoys his coffee

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 43 / 73

Bonjoof Beta
Spoofing mDNS

Anatomy of an APT Network Privilege Escalation

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 44 / 73

Bonjoof Beta
Claiming the hostname

Anatomy of an APT Network Privilege Escalation

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 45 / 73

Anatomy of an APT Network Privilege Escalation
Bonjoof Beta
ARD client silently updates its stats

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 46 / 73

Anatomy of an APT Network Privilege Escalation
Bonjoof Beta
Reset the file server's hostname

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 47 / 73

Bonjoof Beta
Where'd who go?

Anatomy of an APT Network Privilege Escalation

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 48 / 73

Bonjoof Beta
Some sample tool output

Anatomy of an APT Network Privilege Escalation

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 49 / 73

Outline

Anatomy of an APT Persistence
.

. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering
Initial Exploitation
Local Privilege Escalation
Network Privilege Escalation
Persistence
Exploration
Exfiltration . .3. Conclusion
Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 50 / 73

Anatomy of an APT Persistence
Maintaining Access
how to survive the reboot

Create a hidden startup item Com.apple.SystemLoginItems.plist Exploit¹ Append to existing user startup scripts Hidden cronjob or automator script Modify existing binaries and services, which breaks signing but is generally not noticed Modify kernel extensions or cached extensions Persist in firmware

¹http://www.macshadows.com/kb/index.php?title=Com.apple.SystemLoginItems.

plist_Exploit

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011

51 / 73

Anatomy of an APT Persistence
Maintaining Access
Attacking and hiding
Execute arbitrary shell commands Run JavaScript in Safari to manipulate/create webpages in Safari Attach folder actions to hide data Send file transfer messages to your iChat contacts (may be Adium only)

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 52 / 73

Anatomy of an APT Persistence
Maintaining Access
At the network layer
Issue VPN credentials to maintain foothold Issue soft tokens from access server Issue certificates Create new AD users

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 53 / 73

Anatomy of an APT Persistence
The Persistent Attack
Userland rootkits: a history...

Nemo recreates PTRACE functionality and does great Mach ports research ¹
Dino publicly releases remotely controllable PoC Mach proxy rootkit¹
Jonathan Rentzsch creates tools and uses them for "hooking" and "swizzling": methods of modifying existing binaries in memory or on disc
Dino and Miller write "Mac Hacker's Handbook" with excellent illustrative examples of persistent attacks using these techniques²
More followed

¹nemo, Abusing Mach on Mac OS X. May 2006.

http://www.uninformed.org/?v=4&a=3&t=pdf

¹http://trailofbits.files.wordpress.com/2009/08/advancedmacosxrootkits.pdf

²C. Miller, D. A. Dai Zovi. Mac Hacker's Handbook. 2009. pp300­318.

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011

54 / 73

Anatomy of an APT Persistence
Fighting Persistence
Mac IR

How do we handle IR on Macs? Commercial Products
EnCase, BlackLight, FTK All handle standard HFS+ forensics Some claim file hash checking (and fail)
What's missing? Easy checking of OS integrity Binary and driver signing Memory forensics²¹
Is all of the system state captured on the HDD?

²¹Volatilityhttps://www.volatilesystems.com/default/volatility is working on it

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011

55 / 73

Dealing with APT
Mac Hardware Forensics

Anatomy of an APT Persistence

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 56 / 73

Outline

Anatomy of an APT Exploration
.

. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering
Initial Exploitation
Local Privilege Escalation
Network Privilege Escalation
Persistence
Exploration
Exfiltration . .3. Conclusion
Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 57 / 73

Anatomy of an APT Exploration
Who do you Love?
Are you for sure?
Pick accounts to attack by examining the Open Directory users, groups, and privileges using unauthenticated ldapsearch
Engineers: source code Product Management: release information CFO's office, Controller: Financial data In house counsel: Lawful intercept access Account home directories network mounted by default

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 58 / 73

Anatomy of an APT Exploration
Accessing Interesting Accounts

Least intrusive/high privilege using root privileges export the password directory with mkpassdb mount an off-line brute-force attack on the passwords login as users and access data
Medium intrusive/high privilege using root privileges copy the password directory reset passwords and access accounts restore previous directory
Most intrusive/standard admin privilege: change passwords and access accounts run before anyone notices
Maintain control by cracking more user/VPN credentials or creating new users with VPN access

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 59 / 73

Anatomy of an APT Exploration
Making Exploration Harder
Don't allow server admin accounts to have root access Use strong password hash formats Regularly review audit logs and set up alerts to track password changes and VPN enrollment

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 60 / 73

Outline

Anatomy of an APT Exfiltration
.

. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering
Initial Exploitation
Local Privilege Escalation
Network Privilege Escalation
Persistence
Exploration
Exfiltration . .3. Conclusion
Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 61 / 73

The Getaway

Anatomy of an APT Exfiltration

Shawshank-style Identify overseas internal drop server Move data over corporate WAN to internal drop Test for allowed outbound protocols Bulk exfiltration though local office NAT to external drop server
Covert Channels ICMP HTTPS
Hide in plain sight²²
PKI via embedded public keys

²²http://invisiblethings.org/papers/passive-covert-channels-linux.pdf

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011

62 / 73

Anatomy of an APT Exfiltration
How can we mitigate the exfiltration threat?
Short term
Coordinated egress restrictions in all offices DLP & proxy log monitoring 24x7 SOC ninjas

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 63 / 73

Anatomy of an APT Exfiltration
How can we mitigate the exfiltration threat?
Long term
Time to rethink global architecture Leased lines Unified Forest L3 routing directly between offices
Alternatives ADFS Federated domains WAN accelerators Limited, audited file sync

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 64 / 73

Outline

Conclusion Summary
.

. .1. Motivation Preface and Background
. .2. Anatomy of an APT Social Engineering
Initial Exploitation
Local Privilege Escalation
Network Privilege Escalation
Persistence
Exploration
Exfiltration . .3. Conclusion
Summary

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 65 / 73

Dealing with APT
Comparison with Windows

Conclusion Summary

In each phase of an APT, how does OS X stack up?
Assumptions: Windows 7 and 2008R2 OS 10.7 Client and Server No mixed environments

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 66 / 73

Conclusion Summary
Windows vs Mac Comparison

Initial Exploitation:

Windows 7 Stack Canary Heap Hardening Heap and Stack DEP ASLR (32 and 64 bit) NT Priv Dropping Default all privs Configurable with EMET

OS 10.7 Lion Stack Canary Heap Hardening Heap and Stack NX ASLR (32 and 64 bit) Broker service an XPC New default sandbox Not configurable

Advantage Tie ? Tie Tie OS X OS X Windows

Conclusion: OS X has now equalized anti-exploit technologies with Windows.

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 67 / 73

Conclusion Summary
Windows vs Mac Comparison

Local Privilege Escalation:

Windows 7 NT Priv Dropping Default all privs UIPI and Secure Desk No default cred store

OS 10.7 Lion Broker service and XPC New default sandbox Pop-up cred box Login Keychain

Advantage OS X OS X Windows Windows

Conclusion: Local privilege escalation on both platforms is still quite possible. Everybody loses.

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 68 / 73

Conclusion Summary
Windows vs Mac Comparison

Network Privilege Escalation:

Windows 2008R2 NTLMv2 Kerberos Only Option RPC Privacy and Integrity RDP with session security AD DNS with Secure Updates

OS 10.7 Server Unsigned DH Lots of fallback to DH No central protocol crypto Apple Remote Desktop mDNS

Advantage Windows Windows Windows Windows Windows

Conclusion: OS X networks are significantly more vulnerable to network privilege escalation. Almost every OS X Server service offers weak authentication methods allowing downgrade attacks.

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 69 / 73

Conclusion Summary
Windows vs Mac Comparison

Persistence:

Windows 7 User-Mode Services Kernel Rootkits Many disk forensics options Several RAM forensics tools

OS 10.7 Lion User-Mode Services Kernel Rootkits Fewer disk forensics
Almost no RAM forensics

Advantage Tie Tie Windows
Windows

Conclusion: Persisting malicious code on both platforms is not a problem for APT. Defenders have more options to detect modification of Windows and analyze code, but this need should be slowly met by open-source and commercial tools.

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 70 / 73

Conclusion Summary
Windows vs Mac Comparison

Exploration and Exfiltration:

Windows 2008R2 AD LDAP locked to unauthed users Configurable outbound FW Central logging requires product

OS 10.7 Server Anonymous LDAP browsing
No outbound rules
Supports syslog UDP

Advantage Windows
Windows
OS X

Conclusion: These steps are mostly not dependent on the platform, although OpenDirectory can provide a better stepping stone than AD to an unauthenticated user.

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 71 / 73

Conclusion Summary
Conclusion
Should you use Macs in your Enterprise
Pros Anti-exploit and sandbox technologies are looking good in 10.7 Getting "hacked by accident" is still harder Slightly less body of knowledge in attacker circles
Cons Network privilege escalation is trivial Local UI isolation allows for easy phishing of admin creds No equivalent of GPO, hard to harden centrally Fewer products to investigate incidents
Bottom Line: Run your Macs as little islands on a hostile network.

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 72 / 73

Conclusion Summary

Q :// .

T

AS

?
. RM

Daniels, Grattafiori, Orvis, Stamos, Youn (iSEC)

Macs in the Age of APT

BH USA 2011 73 / 73

