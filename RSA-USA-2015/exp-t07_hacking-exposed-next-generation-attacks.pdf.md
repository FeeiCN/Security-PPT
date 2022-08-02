SESSION ID: EXP-T07
Hacking Exposed: LIVE
Next Generation Threats
a.k.a. "Sophisticated" Attacks

Stuart McClure and Brian Wallace
CEO and Sr. Researcher Cylance, Inc

#RSAC

#RSAC
The Biggest Myth Running
 "It's all new and sophisticated, advanced"  "Defenders Dilemma"  "60% of all attacks don't use malware"
 We define malware as "malicious software" or anything that can run on an endpoint and do bad things. This includes scripts, interpreted code, PEs, DLLs, admin tools, PuPs, etc.
 Authentication based and insider threat attacks? Yes but small percentage and only one step in the chain.
 Complete in-memory attacks? Yes but small percentage and only one step in the chain.
 Prevention is not truly possible  But let's see what this means...

#RSAC
Agenda
 Act 0: Destover/Wiper (setup)  Act I: Operation Cleaver: LIVE  Act II: Forever-days: LIVE  Act III: Destover/Wiper: LIVE (grand finale)
Throughout: Mitigations and Prevention

Act 0: Sony Attack

#RSAC

Setting the stage...

#RSAC
Wiper: 201a9c5fe6a8ae0d1c4312d07ef2066e5991b1462b68f102154bb9cb25bf59f9
Sleep(2700000) =
45minutes
Ladies and Gentlemen, start your malware...

Act I ­ Scene I:

#RSAC

Operation Cleaver

Global Impact

http://defense.ballastsecurity.net/static/cleaver_planet/

#RSAC

 Rapid Growth of Skilled Hacking Starting 2012, 2010...2007

 Targets: Global Critical Infrastructure

 Campaign Phase 1: Initial Compromise

 Campaign Phase 2: Data Exfiltration and Persistence

 Campaign Phase 3: TBD - Sabotage???

 Critical Discoveries:



Sources emanating from Iranian netblocks



Tarh Andishan, Zhoupin Exploit Team, Operation Cleaver



Netafraz.com Hosting (Esfrahan, Iran)



Tools created to check for Iranian IPs



Malware named: TinyZbot



50+ Victims Worldwide, 2 years+

#RSAC

#RSAC

GeoIP Location: Iran Net block: 78.109.194.96 - 78.109.194.127 Owner: Tarh Andishan Email: tarh.andishan(at)yahoo.com Phone: +98-21-22496658 NIC-Handle: TAR1973-RIPE

The logger module binary's file description value is the following: ye file khube DG. ba in ham kari nadashte bashin

Tarh Andishan ­ meaning "Innovators", "Inventors"
78.109.194.96/27 ­ Current ­ Afranet, Iran 217.11.17.96/28 - 10/22/2014 ­ Afranet, Iran 81.90.144.104/29 - 10/5/2014 ­ Afranet, Middle East Oil, Iran 31.47.35.0/24 ­ 11/2012 ­ Afranet, Iran
Netafraz.com infrastructure in Iran

Roughly translated from Persian, this text says: DG is a good file, don't bother with this
Starting Nmap 6.25 at 2012-08-17 09:18 Iran Daylight Time

Persian hacker names: Salman Ghazikhani, Bahman Mohebbi, Kaj, Parviz, Alireza, etc.

The Damage ...
· Signing encryption keys for major airline company · Usernames and passwords from dozens of companies · 250k Windows credentials at a single Oil company · Airport and Airline crew credentials · Airport network configuration files · SNMP credentials for major Energy Companies · Student information targeting · Stolen LastPass credentials

#RSAC

#RSAC
 Iran's technical capabilities evolving quickly, gained momentum after Stuxnet
 Targeting Critical Infrastructure, espionage leading to sabotage ­ at a minimum terroristic (no other obvious gain)
 The sheer breadth and depth of targeting, the repeated sourcing infrastructure, the consistent techniques, tools and tactics used, all lead us to a narrow conclusion: that Iran is actively involved in and executing attacks against global critical infrastructure in an effort to negatively impact our physical world.

Act I ­ Scene II:

#RSAC

Operation Cleaver

It's All About the Malware

#RSAC
Spearphishing: fake resume tool

#RSAC
Spearphishing: Resume Submitter

#RSAC
Tools & Toys ...
Public: Netcat, Cain & Abel, psexec, Mimikatz, WCE, Putty, Plink, nmap, xcmd, etc.
Custom: TinyZbot, NetC, ASPX webshells, SYN flooder, ARP poisoning, Csext, etc.
Exploits: MS08-067 (Conficker) and MS10-015 (KiTrap0D)

#RSAC
Hack Demo
How they worked...

Act II ­ Scene I:

#RSAC

Forever-Days - SMB

a.k.a. "Beyond Malware"

#RSAC
Scene I: SMB Credential Hoovering
 Discovered by Aaron Spangler in 1997  Design flaw in Microsoft ­ it's a feature!!!  The difference?
 No need to send a file:// directive to trigger the SMB
 URLMon.dll
 URLDownloadToFile  URLDownloadToCacheFile  URLOpenStream  URLOpenBlockingStream
 Embedded versions of Internet Explorer

#RSAC
Countless Products Vulnerable

 Adobe Reader  Internet Explorer  Lunascape 6  Arora Browser  Windows Media Player  Apple Software Update

 Microsoft Baseline Security Analyzer (MBSA)
 AVG Free  Norton Security Scan  BitDefender Free  Comodo Antivirus  Free Download Manager  KMPlayer  Github for Windows  TeamViewer

 SketchUp Make 2014  NetBeans

 Maltego CE  PyCharm  PHP Storm  RubyMine  IntelliJ IDEA  JDK 8u31  GoPro Studio

 .Net Reflector  FBCIM  Box Sync  SMPlayer  Seafile Client for Windows  Excel 2010

#RSAC
SMB Attack Demo
 ARP poisoning  Launch re-direct SMB  Crack credentials  RDP or psexec to connect back to victim

#RSAC
SMB Credential Hoovering Attack Demo
Beyond Malware

Act II ­ Scene II:

Forever Days ­ ShameOnUAC

#RSAC

a.k.a. ­ "Beyond Malware"

#RSAC
UAC ­ User Account Control

ShameOnUAC

Admin opens regedit.exe

AicLaunch() called in explorer.exe Calls regedit.exe with "" as args

Consent.exe gets credentials from user

AicLaunch() in explorer.exe
hook Calls regedit.exe
with "/S attack.reg"

Bad guy executes backdoor malware.exe
Admin opens regedit.exe

Consent.exe loads ShameOnUAC.dll as a AppInit_DLL value (running as SYSTEM), suppressing
the prompt, runs regedit.exe and executes the attacker's payload

#RSAC

#RSAC
"Beyond Malware"
 Run ShameOnUAC backdoor  Trigger UAC on victim  Cached credential dumping = keys to the kingdom!!!  Connect back  Game is over...

#RSAC
ShameOnUAC Attack Demo
Beyond Malware

#RSAC
ShameOnUAC Mitigations
 None really.  It's a feature!

Act III ­ Sony Attack

#RSAC

"Hacking Exposed" style

#RSAC
Sony Speculation
 Spearphishing  Credential Harvesting  Remote access  Launch leveraging
harvested credentials

#RSAC
Spearphishing

#RSAC
Spearphishing

#RSAC
Credential Harvesting

#RSAC
Remote Access
 VPN  RDP  Remote mail

#RSAC
Launching
 First hand accounts
 "Someone on the IT team screwed up and ran something wrong."  "Some people think it was someone from the inside"
 SCCM distribution
 Looked like an insider  Easy distribution to everything!  Would take weeks to figure it out.

Behavior
2618dd3e5c59ca851f03df12c0cab3b8 diskpartmg16.exe . b80aa583591eaf758fd95ab4ea7afe39 igfxtrayex.exe . 6aeac618e29980b69721158044c2e544 elrawdsk.sys . 86e212b7fc20fc406c692400294073ff elrawdsk64.sys . 612ae17dcac2248503d3b935f70a6838 (BMP) walls.bmp . 7e5fee143fb44fdb0d24a1d32b2bd4bb ams.exe . cc79a406d1a6c3d187319e8afb9a2901 kph.sys (kprocesshacker.sys) . 844440e88f482c0b03f31cd7e1f9590d (TXT, long credentials/hosts list)
d1c27ee7ce18675974edf42d4eea25c6 diskpartmg16.exe . 760c35a80d758f032d02cf4db12d3e55 igfxtrayex.exe . 6aeac618e29980b69721158044c2e544 elrawdsk.sys . 86e212b7fc20fc406c692400294073ff elrawdsk64.sys . e1864a55d5ccb76af4bf7a0ae16279ba iissvr.exe
. 3a6bd9a5aa6eb760ec90df03499a5cb3 (HTML) . 84942918a6c2da814b3c086bfbbd5987 (JPEG) back.jpg . 942e076776e31a5646efe032b3f0c7e5 (WAV) index.wav . 3769626c4734d5de074d7c9b53f66c15 (TXT, short credentials/hosts list)

#RSAC

#RSAC
Credentials
 spe\jhkim-1|DE$Ktop12  spe\dhenderson-1|(Ba773l35)  SPE\cmonti-1|Minion#1 -- SCCM administrator?  SPE\Dayals-1|London13!  SPE\JHKim4-1|!Tomorrow33  SPE\KManku-1|M@nday77  SPE\MMcLean3-1|@Smiley91  SPE\ADutta2-1|P@ssw0rd123

#RSAC
Sleep(2700000) =
45minutes now? Let's check on it!

Destover/Wiper Malware

#RSAC

LIVE demo

#RSAC
Mitigation
0. Protect your endpoints!
1. Success auditing of domain administrator logins, and failure auditing of all logins.
2. Central collection of Service Control Manager Event 7045 ("A service was installed in the system"). Catches kernel mode driver service creations too.
3. Prevent remote service creation (would also stop PsExec), and prevent process launch via remote WMI.
4. Use modern versions of Windows and make use of their security controls (UAC), grant domain admin only sparingly, and disable default shares and cached credentials whenever possible.
5. Protect your passwords! 2FA, One Time Passwords, CyberArk, KeyPass, LastPass*, etc.

#RSAC
Bonus Demo?
How could any victim could have been protected? Do we have time?
Yes, we've cracked the code! If no time then go to the Cylance Booth or Come to Children's Creativity Museum @ 5pm

#RSAC
Resources
 Cylance on Youtube (Cylance Inc)  Cylance on Twitter (CylanceInc)  "Hacking Exposed" on Twitter (@hackingexposed)  www.cylance.com  Come to our booth!  Come to our VIP party @ 5pm @ Children's Creativity Museum!
 Tell them we invited you at the Hacking Exposed LIVE talk.

#RSAC
Thank you!
Reminder to submit your feedback!

#RSAC

