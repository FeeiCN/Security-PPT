APT Detection with Whitelisting and Log Monitoring
Aaron Beuhring Kyle Salous
About Us
 Kyle Salous is a 10-year Info Sec vet, covering a broad spectrum of subjects. He has a BS in Information Security and an MS in Systems Engineering. Follow @kylesalous
 Aaron Beuhring's a 13-yr IT vet w/ interests in computer forensics, eDiscovery, security. He's pursuing his Masters in Info Sec & Assurance. Follow @aaronbeuhring
 We both work for an organization that has a pretty typical IT infrastructure. We've had great success in the past few years thwarting advanced attacks and frustrating our pen testers.
2

What is Widely Believed to be the Problem:
 Attackers are using amazing zero day exploits to hack anyone they please, anytime, anywhere.
 Defenders are helpless to detect and block these attacks.
3
What is Really the Problem:
 Defenders rely far too much on blacklists.  Signature based antivirus was not designed to detect
never before seen malware.  IP or domain reputation lists can't keep pace with threats.
- Content Delivery Networks have complicated this.
4

Content Delivery Networks and IP Reputation
5
Example Attack Vectors
 Cryptolocker: - Arrives via email, malicious link or now even USB worm. - Installs itself within %APPDATA% then encrypts all your data.
 APT1: - Phishing email including a link to ZIP file is sent using an email account set up in the name of someone the victim knows. - Contents will be downloaded/extracted to user's profile where they will be executed.
6

Notice Something?
 Neither attack used 0-day.  Both examples execute code from within the user's profile.  The attacker simply asked the user to run something.  Not very sophisticated but highly effective.
7
Raising Costs for Attackers
 Our Approach: - Leverage whitelisting to force attackers to use exploits. - Patch regularly to force attackers to use 0-day. - Employ exploit mitigations technologies to force attackers to use really crafty 0-day. - Limit admin rights to force attackers to escalate post exploitation. - Leverage logs from all of the above to detect anything that has slipped by.
8

Limiting Costs for Your Company
 Application whitelisting with Microsoft Applocker or Third Party software.
 Network whitelisting with host based firewalls.  Limit admin rights limited with Group Policy Preferences.  Exploit mitigation with Microsoft EMET, modern browser
sandboxes, OS mitigations.  Advanced Log Monitoring and Alerting with a SIEM*.
9
What Does Whitelisting Entail?
 Must have buy in from the business side.  Awareness of every program that executes on your end
users machines.  Understanding the networking protocols that these
programs run.  Training end users and IT staff on the process of vetting
new software for a production environment.
10

Application Whitelisting
 Common Arguments - Takes too much time to manage - Inflexible - Expensive
 AppLocker - Management takes less time than malware remediation - Flexible rules - Part of your Windows license*
11
AppLocker
 AppLocker is included in: - Windows 7 ­ Ultimate and Enterprise editions - Windows Server 2008 R2 ­ Standard, Enterprise, Datacenter and Itanium editions - Windows 8 ­ Enterprise edition - Windows Server 2012 ­ Standard and Datacenter editions
 What about Home Editions? - Parental Controls!
12

AppLocker File Types
 AppLocker has separate rule groups for EXE, MSI, scripts and DLLs.
 DLL enforcement is off by default and must be explicitly enabled.
 Cannot control macros or other interpreted languages - Can control the interpreter!
13
AppLocker Rule Type
 Publisher ­ Flexible but requires signed code  Path ­ Flexible but requires good ACLs  Hash ­ Least flexible but more absolute
14

Guidelines for AppLocker Rules
 Path rules are acceptable only if the path is location that standard users cannot write to.
 Use hash or publisher rules for everything else.  Be careful when using the wizard to create rules, it may
have unintended consequences. - You may not want to allow anything signed by Microsoft!
15
Getting Started
 Choose approach: Gold Image vs. Default Rules  Default rules
- Allow anyone to run programs from %PROGRAMFILES% and %WINDOWS%
- Allow admins to run anything.  Must ensure that users don't have admin rights to be
effective.
16

Default Rule Creation
17
Admin Enforcement
 End users should get no admin rights.  Create a separate admin account for everyone in your IT
department.  Create a local admin account on each computer with a
unique password.  Use Group Policy Preference to reset membership of the
local administrators group.
18

Admin GPO
19
What Default Rules Do
 Standard users can no longer run EXEs from User Profile  Users need an admin to properly install software into
%PROGRAMFILES% or %WINDOWS%  Users will now need to call the Help Desk for assistance
when they try to run a random download or install software.  Software can be administratively installed to
%PROGRAMFILES% with no additional rules needed.
20

More Importantly
 If done right, attackers now need to use exploitation to get access to your system.
 Attackers will be limited to regular user privileges post exploitation and will need to find a way to escalate.
 Attackers have limited options for persistence if they don't escalate.
21
AppLocker in Action
22

AppLocker in Action
23
AppLocker in Action
24

Rolling It Out
 Test thoroughly!  AppLocker policies are additive.
- Use a separate policy for DLLs after you successfully implement EXE/MSI/SCRIPT blocking.
- Make use of your AD OU structure to target additional allowances to only those who need it.
 Push policies in audit mode first, check for warnings in AppLocker logs.
25
Gotchas
 Tools that run as System. (PSEXECSVC)  Proactively whitelist legitimate applications that need to run
from %APPDATA% - WebEx, Go2Meeting, Etc. ­ hash and publisher rules ONLY!  You need to be careful to add paths for locations like logon scripts.  Make sure you have good ACLs for default paths.  Exceptions for Default Rules
26

Additional Uses
 Block programs that don't have a business use - Shockwave - Anything made by Apple - Other scripting ­ AutoIt, Python, Perl, etc. - Virtualization platforms
 Quickly block a malicious file that doesn't have an AV signature
 Block insecure versions of programs to augment your patch management.
27
28

Network Whitelisting
 Host based Firewalls are almost always included with AV as part of an endpoint solution.
 Firewalls should be enabled inside the enterprise with granular rules.
 Application based rules should be used to allow traffic to the Internet ONLY for certain applications
 Explicitly deny and log traffic from all other directories and applications.
29
Host Firewall Rules
 Enforce the concept of least privilege on the network level.  Centrally manage the installation and administration of
firewall rules on all end hosts.  Use different profiles to segment user groups based on
sensitivity levels to the organization.  Turn on logging for every rule and in some cases alerting
for certain applications that might be used by attackers like PowerShell based on context.  Build rules on the server side as well that only allow traffic for the application that is being hosted.
30

Firewall Rules Audit logs first, then enforce.
1. Allow application traffic to and from server subnets. 2. Allow powershell.exe, FTP.exe to specific server subnets 3. Deny powershell.exe, psexec.exe, psexecsvc.exe,
winexecsvc.exe, FTP.exe anywhere else 4. Allow 80, 443 from specific applications and
%PROGRAMFILES% or %WINDOWS% 5. Deny all
Log Everything!
31
Example ­ Denying PowerShell Internet Access
32

Monitoring
 Can get complicated and overwhelming quickly - This is why we tightly control what can run!
 Define policy for logging and retention early on  Build intelligent rules to detect and alert on APT activity:
- Lateral movement - Unusual tools - Traffic outside of baseline parameters
33
What to Log
 Collect the logs from all of the usual suspects: - DNS, AD, Web, Network Firewall and IPS, Proxy, etc...
 Client Event Logs: Applocker, NSA Guide.  Augment client and device logs with flow data.  Client firewall logs are a rich source of data
- Application making the connection - Domain and User - Local/Remote IP
 Sadly most don't do this!
34

Logging Problem
35
Actual Vendor Email
"Unfortunately, no, we were not aware of the specifics on how the external logging process worked. Logging to an external syslog server is a rarely used feature of <ProductName>. Once we were able to approach development about this, we were able to confirm that the product is working as designed."
36

Creative Firewall Alerts
 You can block or alert if any of the following try to connect to the internet or internal resources: - FTP.EXE - POWERSHELL.EXE - NOTEPAD.EXE - CALC.EXE - Anything running in the user's profile
 You can create rules based on application name, hash, time, profile, user location and connection type.
37
Sample Log
Sept 18 10:55:22 Firewall Security Server AV01: JACKSONJ,Local: Internal Domain,User: jacksonj, Internal Domain: test01,Action: Permitted 192.168.1.24,Local: 63446,Local: 90B11C60009,Remote: 157.56.64.122;Remote: urs.microsoft.com,Remote: 443,Remote: 0008E3FF009,TCP,Outbound, Start: 201409-16 15:41:49, End: 2014-09-16 15:41:49,Occurrences: 1,Application: C:/Program Files (x86)/Internet Explorer/iexplore.exe,Rule: Approved Apps HTTP Port 80443 - Outgoing
38

Sample False Positive
 Alert ­ Suspicious traffic from PowerShell to a server  Investigation ­ Contact user who happens to be an admin  Tuning ­ Add false positive rule to SIEM for PowerShell
traffic from that admin to that server only!
39
Sample True Positive
 Alert comes in for blocked traffic: TeamViewer.exe running from %APPDATA% attempting to connect to the internet on 443
 Investigation ­ Contact user who happens to be an admin  User was no to the firm  Remediation ­ Remind user of policies for secure file
transfer and remove team viewer
40

Client Firewall Log Gotchas
 Be sure to normalize times from clients that have been out of the office.
 EPS considerations for log burst when clients return to the network. - Consider log buffer size and disk space
 Don't log certain dropped broadcast traffic ­ SSDP, NetBIOS, etc. - Your SIEM will see it as a port scan!
 Lock Firewall interface on end clients, enable a separate password for disabling.
41
Leverage Application Execution Logs
 Monitoring for blocked execution is good, monitoring for allowed execution is better!
 Advanced attackers use native functionality whenever possible.
 Baseline normal application usage by regular users.  Audit and alert on unusual legitimate program use.  Application execution tuple
- AppLocker ­ { FilePath, Username } - SysMon ­ { Image, CommandLine, ParentImage, User }
42

Normal for an admin, abnormal for a user!
 SCHTASKS.EXE (scheduled jobs/tasks)  NETSTAT.EXE (netstat -ano)  SC.EXE (interact with services)  XCOPY.EXE (copy files around)  NSLOOKUP.EXE (recon)  TASKKILL.EXE (kill running processes)  TASKLIST.EXE (tasklist /v)  ROUTE.EXE (adding persistent routes)  REGSVR32.EXE (services)  PING.EXE (check connectivity)  WMIC.EXE (access Windows Management Instrumentation)  POWERSHELL.EXE (Swiss army knife)
Source: http://sysforensics.org/2014/01/lateral-movement.html
43
Very Unusual!
 AT.EXE (scheduled jobs/tasks)  PSEXEC.EXE (remote code execution)  NBTSTAT.EXE (profile)  FTP.EXE (download/upload)  BITSADMIN.EXE (download/upload)  MAKECAB.EXE (compression before exfil)  QUSER.EXE (profile)  IEEXEC.EXE (execute remote code)
Source: http://sysforensics.org/2014/01/lateral-movement.html
44

Sample False Positive
 Alert ­ SC.EXE called by SERVICES.EXE running as SYSTEM
 Investigation ­ Review logs, determine this is a normal occurrence in our environment
 Remediation ­ Tune SIEM for this tuple
45
Sample True Positive
 Alert ­ SC.EXE called by CMD.EXE running as standard user - Happened during pen test
 Investigation ­ Review logs, see multiple attempts to run malware
 Remediation ­ Perform full analysis of computer and traffic to / from computer
46

Proactive Forensics
 Application whitelisting logs provide a record of every application executed.
 Client firewall logs show every network connection including the application that generated the connection.
 Prudent collection of system event logs can provide other data to complete the picture.
 By storing this in the SIEM we can now do forensics without relying on disk artifacts.
47
Conclusion
 Defenders need to focus more on configurations that will increase costs for attackers.
 Adding additional layers of blacklists will not solve the problem.
 Whitelisting is the most cost effective way to accomplish this.
 Whitelisting enables you to focus on detecting truly advanced threats.
48

Follow Us
 Follow us on Twitter: - @aaronbeuhring - @kylesalous
 Materials available on: - http://sourceforge.net/projects/raisingcostsforattackers/files
 ShmooCon 2014: - https://archive.org/details/ShmooCon2014_Raising_Costs_for _Your_Attackers_Instead_of_Your_CFO
49

