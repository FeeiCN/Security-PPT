CRAIG DODS
CHIEF ARCHITECT ­ SECURITY
INFECTING THE ENTERPRISE: ABUSING OFFICE365+POWERSHELL FOR COVERT C2
@CCMA40

AGENDA
· Discuss what makes O365 ideal C2 infrastructure · Enter Powershell · 4-Stage PoC Walkthrough · Mitigation Strategies · Evading Detection + Final Demo

Graphic Credit: SkyHigh Networks

OFFICE365: WHY IT'S INTERESTING FOR C2
Vast majority of enterprises permit SSL/TLS to Office365
Larger enterprises peer directly with Microsoft via ExpressRoute making data exfiltration fast [10 Gbps+]
Due to the volume of traffic and level of trust, most elect not to decrypt Office365
Attacks can be launched without revealing the attacker's network
DLP Solutions do not view a local share as being "outside" the enterprise
Using New-PSDrive, one can mount an O365 drive which is invisible within File Explorer, WMI, COM, and .NET, significantly decreasing the likelihood of detection.

MICROSOFT SAW THIS COMING, OF COURSE
Even if you're able to figure out how, simply mounting an Office 365 drive on your target won't get you anywhere.
If you want read/write access to that drive, your malware will need humanlike interaction abilities to fetch a SAML token from O365.

ENTER POWERSHELL
(un)Fortunately for us, Microsoft added an extremely robust module to Powershell that allows it to interact with and control Internet Explorer.
Using this module, we can overcome the painful challenge of loading https://portal.office.com, avoiding pre-existing SSO, entering in our credentials and clicking on a few buttons, all without launching a user-visible IE session.
If anyone is aware of a non-nefarious use for `$ie.visible = $False` please let me know.

PHASE 1 GET THAT SAML TOKEN

#5 kills existing IE sessions #7à10 cleans up cookies, forms, and passwords in IE to avoid SSO
#12 launches IE
#13 makes it invisible
#14 launches the URL #17à19 inputs credentials and click the checkbox #23à24 clicks on entries to erase filler text
#25 clicks on the Sign-in Button

DEMO ­ WITH IE VISIBLE

PHASE 2
ADD TO TRUSTED SITES + MOUNT AND HIDE NEW DRIVE

DEMO ­ HIDDEN DRIVE MOUNTING

PHASE 3 EXFILTRATE DATA AND BYPASS PS RESTRICTIONS

DEMO ­ EXFILTRATE DATA + BYPASS EXECUTION POLICY

BASIC WEAPONIZATION
While not overly interesting, the delivery mechanism for this PoC is via a macro-enabled Microsoft Word Document.
The payload is obfuscated and injected into memory using TrustedSec's "Unicorn".
AV/NG-AV/EDR detection is minimal to non-existent.
Unicorn attempts to evade Sandboxes by delaying detonation until after the document has been closed by the user.

DEMO ­ ALL TOGETHER NOW

MITIGATION TECHNIQUES
[CONTROVERSIAL, BUT NECESSARY] Decrypt as much SSL/TLS as possible
Create custom signatures which only permit your Office365 domain
Enable Endpoint log forwarding + SIEM analysis on instances of New-PSDrive
Use FW's with byte-counters + SIEM which can identify external uploads
Protect against certain delivery mechanisms by using Sandboxes

DELIVERY ­ WHAT ABOUT SANDBOXES?
This technique has a very high success rate against both signature-based detection tools and static-analysis engines, but...
Most Sandboxes identify this type of behaviour as malicious, primarily due to browser and registry modifications.
So, what can we do?

A BRIEF HISTORY IN SANDBOX EVASION
Sleep functions, system properties, and VM/Hypervisor detection Vendor/Sandbox specific detection [artifacts, DLL's, drivers, IP addressing, fingerprinting] Human Behaviour Monitoring [Mouse, Scrolling, Browsing] Vulnerability Checking [Do not execute if present] Execution delay via innocuous routines [defragging, computing ]

INJECT | | REPLACE AND EXIT
Premise is simple: Design malware that places malicious payloads in locations which are likely to be executed by the target user, but lack the ability to detonate themselves by default.
As an example, malware could identify recently accessed files, such as the last 10 modified *.doc's, and subsequently sabotage them.

AVAILABLE OPTIONS
Replace files with malware sharing the same name [Easy Mode]
Inject AutoRun macros directly into existing files [Hard Mode­Permissions required]
OR
Replace files with shortcuts pointing to a malicious file located in a whitelisted location, such as Office's "Trusted Locations"

SHORTCUTS AND TRUSTED LOCATIONS, OH MY!
The first stage needs to act as a downloader which is most easily accomplished via System.Net.WebClient, although this is likely to be flagged as a generic "Trojan Downloader" by most AV products.
Mapping an O365 Drive is an easy way to bypass signature-based detection while downloading a malicious second stage.
The most effective placement for the second stage is within Word's predefined "Trusted Locations" as this avoids traditional warnings. $env:USERPROFILE + \AppData\Roaming\Microsoft\Word\Startup\

FINAL DEMO

WHAT'S NEXT?
Creating a tool for the masses, in order of priority: 1. Empire Project ­ O365 Listener Module
https://github.com/EmpireProject/Empire 2. Metasploit module 3. O365 API's within Empire/Metasploit toolkit

CLOSING REMARKS
Decrypt, Decrypt, Decrypt!
Monitor New-PSDrive usage and drop all non-corporate O365 access via custom AppID or IPS signatures.
Improve Sandboxes and behavioural analysis tools. Relying on the results of the first file in a chain is inherently flawed ; Secondary file analysis needs to be conducted.
[Inspiration] Special thanks to CrowdStrike & Kaspersky Labs for their work on CozyBear/CozyDuke [NET USE & OneDrive.Live.com]

CODE REFERENCE
3-part combined Powershell for the first Proof-of-Concept https://github.com/craigdods/C2-SaaS/blob/master/Single-Stage.ps1
Proof-of-Concept Powershell LNK evasion https://github.com/craigdods/C2-SaaS/blob/master/LNKSabotage.ps1

CRAIG DODS
THANK YOU

@CCMA40

