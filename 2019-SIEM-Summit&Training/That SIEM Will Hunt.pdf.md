SIEM
SIEM Summit 2019
That SIEM Won't Will Hunt JohnStoner @stonerpsu

# whoami > John Stoner

GCIA, GCIH, GCTI
Principal Security Strategist @stonerpsu

· 20+ years of cyber security experience
· Creator of SA-Investigator for Splunk
· Blogger on Hunting and SecOps
· SymantecArcSightSplunk - I've Seen them all
· Loves The Smiths and all 80's sadtimey music

Why Do We Hunt?

Symbiotic Relationship

Threat Hunters
· Operationalize Findings

Security Operations
· Identify Indicators to Hunt Against

Context is Key
Systems, users, and accounts provide contextual information that will aid the hunt
SIEM has this information

Systems

Users and Accounts

Connections and Relationships

Common Taxonomy - MITRE ATT&CK

Threat Hunting

Threat Intelligence

Security Operations

Using ATT&CK Techniques To Build Our Hunting Hypothesis
Adversaries will use PowerShell Empire to establish a foothold and carry out attacks

How Might We Confirm or Refute Our Hypothesis?

Where can I learn more about PowerShell Empire?
What user accounts are being used?

Does PowerShell Empire have default settings that I could hunt for?
When did events occur?

What do data flows look like between sources and destinations?
Are we able to see the contents of the scripts PowerShell is running to gain greater understanding?

Indicator in the cert.sh File - GitHub

Using the SIEM to Find Indicators

Pivot to Destination

Pivot to External Threat Intelligence

Finding Adversary Infrastructure

Search for Existing Correlated Events

Pivot to Find More Details on an Artifact

Account Modifications

Login Activities

Pivot to the Service Account

Service Account ­ Account Creation

Service Account ­ Host Processes

Pivot to Process Details

Broaden Our Time Window

Additional Command Strings

Chaining of Events
Parent Process IDs and Process IDs

Network Host
Account File/Process

Correlated Event Account Creation x2 Authentication Activities Host Processes Process Commands

Concluding A Hunt...
Were we able to confirm or refute our hypothesis?
What have we learned?
What does our attack picture look like?
What other techniques were referenced?
What should we operationalize?
Where are our gaps?

PowerShell Empire
SHA256: 18C13D226F7E39F45F22DA35ACC288A8AF6BFF2
3CA1D85B9A3FD3E36E52397D0
SSL Issuer: C=US
IP: 45.77.65.211 Hostname:
45.77.65.211.vultr.com

IP: 10.0.2.107 Hostname: wrk-btun

User: frothly\btun

IP: 10.0.2.109 Hostname: wrk-klagerf

Exes Run: ftp.exe whoami.exe schtasks.exe

IP: 10.0.1.101 Hostname: Venus

User: frothly\service3

IP: 10.0.1.100 Hostname: Mercury

Operationalize Your Findings

1
Develop Hypothesis

2
Hunt to Validate Hypothesis

3

4

Document Findings from Hunt

Iterate Findings into Security Operations (Process)

5
Create Alerts Based on Hunt to be More Proactive (SIEM)

What Could We Operationalize?
Alert on encoded PowerShell Alert when we see specific executables running in sequence Alert on SSL Issuer Detect new accounts created Blacklist IP Address Monitor User Agent String Usage Monitor for URIs

https://mitre.github.io/attack-navigator
MITRE ATT&CK - Taedonggang

Adversary Simulation Identify Gaps Hunters Find but SIEM Does Not Identify Gaps Where Hunters Are Blind What Data Are We Lacking? Can We Put Both Kinds of Findings Into Our SIEM?

Data Sets to Play With!!!

BOTS version 1
https://www.splunk.com/blog/2018/05/10/boss -of-the-soc-scoring-server-questions-andanswers-and-dataset-open-sourced-and-readyfor-download.html
Dataset http://explore.splunk.com/BOTS_1_0_datasets
Investigating with Splunk Companion App · https://splunkbase.splunk.com/app/3985/

BOTS version 2
https://www.splunk.com/blog/2019/04/18/boss -of-the-soc-2-0-dataset-questions-and-answersopen-sourced-and-ready-for-download.html
Dataset https://events.splunk.com/BOTS_2_0_datasets
Advanced APT Hunting Companion App
https://splunkbase.splunk.com/app/4430/
· https://www.splunk.com/blog/2019/06/07/bo ss-of-the-soc-bots-advanced-apt-huntingcompanion-app-now-available-onsplunkbase.html

Thank You! John Stoner @stonerpsu

