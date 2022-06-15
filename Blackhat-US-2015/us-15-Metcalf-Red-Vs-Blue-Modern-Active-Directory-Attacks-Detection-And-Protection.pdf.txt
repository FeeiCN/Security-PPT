Red vs. Blue: Modern Active Directory Attacks, Detection, & Protection
Sean Metcalf (@PyroTek3) CTO, DAn Solutions sean [@] dansolutions _._com http://DAnSolutions.com http://www.ADSecurity.org

ABOUT
Chief Technology Officer - DAn Solutions Microsoft Certified Master (MCM) Directory
Services Security Researcher / Purple Team Security Info -> ADSecurity.org

AGENDA
Red Team (Recon, Escalate, Persist) Blue Team (Detect, Mitigate, Prevent)

Perimeter Defenses Are Easily Bypassed

Assume Breach Means: Layered Defense

Kerberos TGT Ticket

Kerberos Overview

Red Team (Offense)

Attacker Goals
Data Access Exfiltration Persistence
Privilege escalation if needed

PowerShell Overview
 Dave Kennedy: "Bash for Windows"  Available by default in supported Windows versions
v2: Win 7 / Win 2k8R2 v3: Win 8 / Win 2012 v4: Win 8.1 / Win 2012R2 v5: Win 10 / Win 2016
 PowerShell.exe only an entry point into PowerShell  Leverages .Net Framework  Provides access to WMI & COM  Microsoft binary = whitelisted  Download & run code in memory

PowerShell Weaponized
PowerSploit Nishang Veil PowerView PowerUp Cobalt Strike Beacon

"SPN Scanning" Service Discovery
 SQL servers, instances, ports, etc.  MSSQLSvc/adsmsSQLAP01.adsecurity.org:1433
 Exchange Client Access Servers  exchangeMDB/adsmsEXCAS01.adsecurity.org
 RDP  TERMSERV/adsmsEXCAS01.adsecurity.org
 WSMan/WinRM/PS Remoting  WSMAN/adsmsEXCAS01.adsecurity.org
 Hyper-V Host Microsoft Virtual Console Service/adsmsHV01.adsecurity.org
 VMWare VCenter  STS/adsmsVC01.adsecurity.org

SPN Scanning for MS SQL Servers with Discover-PSMSSQLServers

Getting Domain Admin in Active Directory
Poor Service Account Passwords Passwords in SYSVOL Credential Theft Misconfiguration / Incorrect Perms Exploit Vulnerability

SPN Scanning for Service Accounts with Find-PSServiceAccounts
SPN Directory: http://adsecurity.org/?page_id=183

Cracking Service Account Passwords (Kerberoast)
 Request/Save TGS service tickets & crack offline.
"Kerberoast" python-based TGS password cracker. No elevated rights required. No traffic sent to target.

Kerberoast: Request TGS Service Ticket

Kerberoast: Save & Crack TGS Service Ticket

Group Policy Preferences Credential Storage
The private key is publicly available on MSDN
https://msdn.microsoft.com/en-us/library/2c15cbf0-f086-4c74-8b70-1f2fa45dd4be.aspx

Exploiting Group Policy Preferences
\\<DOMAIN>\SYSVOL\<DOMAIN>\Policies\

The GPP Credential Vulnerability Fix?
5/13/2014: MS14-025 (KB2962486) Install on all systems with RSAT Passwords are not removed from
SYSVOL

Pivoting with Local Admin
 Using GPP Credentials  Connect to other computers using ADSAdmin account  Compromise Local Admin creds = Admin rights on all  Always RID 500 ­ doesn't matter if renamed.  Mimikatz for more credentials!

Mimikatz: The Credential Multi-tool
 Dump credentials
Windows protected memory (LSASS). * Active Directory Domain Controller database . *
 Dump Kerberos tickets
for all users. * for current user.
 Credential Injection
Password hash (pass-the-hash) Kerberos ticket (pass-the-ticket)
 Generate Silver and/or Golden tickets  And so much more!

Dump Credentials with Mimikatz User Service Account

Kerberos Unconstrained Delegation

Kerberos Unconstrained Delegation

Discover Servers Configured with Delegation

Exploiting Kerberos Delegation

Dumping AD Domain Credentials
Dump credentials on DC (local or remote). Run Mimikatz (WCE, etc) on DC. Invoke-Mimikatz on DC via PS Remoting.
Get access to the NTDS.dit file & extract data. Copy AD database from remote DC. Grab AD database copy from backup. Get Virtual DC data.

Dump AD Credentials with Mimikatz

Dump LSASS Process Memory
32

Remotely Grab the DIT!
33

Instead of VSS, why not leverage NTDSUtil?

Finding NTDS.dit on the Network
Are your DC backups properly secured? Domain Controller storage? Who administers the virtual server hosting
virtual DCs? Are your VMWare/Hyper-V host admins
considered Domain Admins?
Hint: They should be.
35

Dump Password Hashes from NTDS.dit

MS14-068: (Microsoft) Kerberos Vulnerability
 MS14-068 (CVE-2014-6324) Patch released 11/18/2014  Domain Controller Kerberos Service (KDC) didn't correctly validate
the PAC checksum.  Effectively re-write user ticket to be a Domain Admin.  Own AD in 5 minutes
http://adsecurity.org/?tag=ms14068

MS14-068 (PyKEK 12/5/2014)

MS14-068 Kekeo Exploit
39

MS14-068 Kekeo Exploit ­ Packet Capture
40

User to Admin in 5 Minutes?

Forging Kerberos Golden/Silver Tickets
 Requires specific password hash. Forged TGT (Golden Ticket) bypasses all user restrictions.  Create anywhere & use from any computer on the network.  No elevated rights required to create/use.  User password changes have no impact on forged ticket!

KRBTGT: The Kerberos Service Account

Golden Ticket (Forged TGT) Communication

Golden Ticket Limitation
Admin rights limited to current domain.
Doesn't work across trusts unless in EA domain.

Golden Ticket ­ More Golden!
Mimikatz now supports SID History in Golden Tickets

Silver Ticket (Forged TGS) Communication

Silver Ticket: Domain Controller Exploitation
· Attacker dumped AD & has all domain creds. · Corp IT changed all user, admin, and service account
passwords (and KRBTGT pw 2x). · Attacker still has Domain Controller computer account
password hashes.
What is possible with these?

Silver Ticket: Domain Controller Exploitation

Silver Ticket: Domain Controller Exploitation

Silver Ticket: Domain Controller Exploitation

Silver Ticket: Domain Controller Exploitation

Silver Ticket: Domain Controller Exploitation

Blue Team (Defense)

GPP Honeypot
· XML Permission Denied Checks
­ Place xml file in SYSVOL & set Everyone:Deny ­ Audit Access Denied errors
· Credential Honeypot
­ Place xml file in SYSVOL with false credentials. ­ Configure GPP cred failed logon auditing.
· GPO doesn't exist, no legit reason for access.

PowerShell Attack Detection
· Log all PowerShell activity · Interesting Activity:
­ Invoke-Expression (and derivatives: "iex") ­ .Net Web Client download. ­ BITS activity ­ Scheduled Tasks ­ PowerShell Remoting (WinRM)

Detecting Forged Kerberos Golden (TGT) & Silver (TGS) Tickets
· Normal, valid account logon event data structure:
­ Security ID: DOMAIN\AccountID ­ Account Name: AccountID ­ Account Domain: DOMAIN
· Golden & Silver Ticket events may have one of these issues:
­ The Account Domain field is blank when it should contain DOMAIN. ­ The Account Domain field is DOMAIN FQDN when it should contain
DOMAIN. ­ The Account Domain field contains "eo.oe.kiwi :)"

PowerShell Security Recommendations
· Limit PowerShell Remoting (WinRM). · Audit/block PowerShell script execution via AppLocker. · PowerShell v3+: Enable PowerShell Module logging (via
GPO). · Leverage Metering for PowerShell usage trend analysis.
­ JoeUser ran PowerShell on 10 computers today? · Track PowerShell Remoting Usage · Deploy PowerShell v5 and implement system-wide
transcripts

PowerShell v5 Security Enhancements
· System-wide transcripts · Script block logging · Constrained PowerShell · Antimalware Integration (Win 10)

PowerShell v5 Security: Script Block Logging

PowerShell v5 Security: System-Wide Transcripts

PowerShell v5 Security: Constrained PowerShell

PowerShell v5 Security: Antimalware Integration

Mitigation Level One (Low)
 Minimize the groups (& users) with DC admin/logon rights  Separate user & admin accounts (JoeUser & AdminJoeUser)  No user accounts in admin groups  Set all admin accounts to "sensitive & cannot be delegated"  Deploy Security Back-port patch (KB2871997) which adds
local SIDs & enable regkey to prevent clear-text pw in LSASS.  Set GPO to prevent local accounts from connecting over
network to computers (easy with KB2871997).  Use long, complex (>25 characters) passwords for SAs.  Delete (or secure) GPP policies and files with creds.  Patch server image (and servers) before running DCPromo  Implement RDP Restricted Admin mode

Mitigation Level Two (Moderate)
 Microsoft LAPS (or similar) to randomize computer local admin account passwords.
 Service Accounts (SAs):
 Leverage "(Group) Managed Service Accounts".  Implement Fine-Grained Password Policies (DFL >2008).  Limit SAs to systems of the same security level, not
shared between workstations & servers (for example).
 Remove Windows 2003 from the network.  Separate Admin workstations for administrators
(locked-down & no internet).  PowerShell logging

Mitigation Level Three ("It's Complicated")

 Number of Domain Admins = 0  Complete separation of administration  ADAs use SmartCard auth w/ rotating pw  ADAs never logon to other security tiers.  ADAs should only logon to a DC
(or admin workstation or server).  Time-based, temporary group membership.  No Domain Admin service accounts running on
non-DCs.  Disable default local admin account & delete all
other local accounts.  Implement network segmentation.  CMD Process logging & enhancement
(KB3004375).

New Admin Model

Next Generation Attack Detection
Microsoft Advanced Threat Analytics (ATA, formerly Aorato)
­ Monitors all network traffic to Domain Controllers ­ Baselines "normal activity" for each user
(computers, resources, etc) ­ Alerts on suspicious activity by user ­ Natively detects recon & attack activity without
writing rules
67

Microsoft Advanced Threat Analytics (ATA)
ATA Detection Capability: · Credential theft & use: Pass the hash, Pass the ticket,
Over-Pass the hash, etc · MS14-068 exploits · Golden Ticket usage · DNS Reconnaissance · Password brute forcing · Domain Controller Skeleton Key Malware

Microsoft Advanced Threat Analytics (ATA)

ATA Detection: Suspicious Activity

ATA Detection: Credential Theft Pass the Hash

ATA Detection: Credential Theft Pass the Ticket

ATA Detection: Credential Theft OverPass the Hash

ATA Detection: MS14-068 Exploit

ATA Detection: Golden Ticket

ATA Detection: Skeleton Key

Credential Theft Protection (Future)

Additional Mitigations
· Monitor scheduled tasks on sensitive systems (DCs, etc) · Block internet access to DCs & servers. · Monitor security event logs on all servers for known forged
Kerberos & backup events. · Include computer account password changes as part of
domain-wide password change scenario (set to 1 day) · Change the KRBTGT account password (twice) every year &
when an AD admin leaves. · Incorporate Threat Intelligence in your process and model
defenses against real, current threats.

Summary
· Attackers will get code running on a target network. · The extent of attacker access is based on defensive posture. · Advanced attacks with forged tickets can be detected. · Protect AD Admins or a full domain compromise is likely!
My research into AD attack, defense, & detection is ongoing. This is
only the beginning... 

Thanks!

· Alva "Skip" Duckwall (@passingthehash) ­ http://passing-the-hash.blogspot.com
· Benjamin Delpy (@gentilkiwi) ­ http://blog.gentilkiwi.com/mimikatz
· Chris Campbell (@obscuresec) ­ http://obscuresecurity.blogspot.com
· Joe Bialek (@clymb3r) ­ https://clymb3r.wordpress.com
· Matt Graeber (@mattifestation) ­ http://www.exploit-monday.com
· Rob Fuller (@mubix) ­ http://www.room362.com
· Will (@harmj0y) ­ http://blog.harmj0y.net

· The Microsoft ATA Product Team (Tal, Michael, & Idan)
· Many others in the security community!
· My wife & family for putting up with me being on the computer every night! 

Contact
· Twitter: @PyroTek3 · Email: sean [@] dansolutions . com · Blog: www.ADSecurity.org · Github: https://github.com/PyroTek3

