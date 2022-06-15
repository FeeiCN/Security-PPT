SIEM Summit 2019

Getting the Most out of Your SIEM

Untapped Potential

Justin Henderson (GSE # 108) and John Hubbard

@SecurityMapper

@SecHubb

About Us
Justin Henderson · Author - SEC555 · Co-Author - SEC455, SEC530 · GSE #108 / Cyber Guardian Blue + Red / 61 certs · Owner of H & A Security Solutions · Twitter: @SecurityMapper
John Hubbard · Author - SEC450
o New course! Blue Team Fundamentals ­ Security Operations & Analysis
· Co-author SEC455 , Instructor - SEC555 / SEC511 · Owner of Blueprint Cyber Security · Twitter: @SecHubb
SIEM Summit 2019 2

Welcome!
A copy of this talk is available at: https://github.com/HASecuritySolutions/presentations
More free stuff: https://github.com/HASecuritySolutions
SIEM Summit 2019 3

Untapped Potential
Writing without vowels may still be understandable · But it is widely inefficient. Same true for SOC/SIEM  A - Automation  E - Enrichment  I - Identify  O - Orchestration  U - Universalize Which are all enabled by Y ---> You
SIEM Summit 2019 4

A is for
Automation
SIEM Summit 2019 5

NXLog AutoConfig
Created to overcome log agent deficiencies and as a functional proof of concept:
https://github.com/SMAPPER/NXLog-AutoConfig Checks systems each day looking for components (IIS, etc.) · If found, automatically configures for consistency
· Or initial configuration...
· Then, sets up an agent to start shipping logs Largest deployment maintained > 12 K systems
SIEM Summit 2019 6

Custom Logging with PowerShell
PowerShell makes writing custom logs easy! · Create new log sources · Push logs to custom Windows event channel
Example: Want to log Autoruns items?
PS > New-EventLog -LogName "My-Autoruns" -Source "Autoruns" PS > autorunsc.exe ­c > autoruns_out.csv PS > $items = Import-Csv -Header "Time","Entry Location","Entry","Enabled","Category","Profile","Description","Compan y","Image Path","Version","Launch String" .\autoruns_out.csv PS > $items | ForEach-Object {Write-EventLog -LogName "my-autoruns" source "Autoruns" -EventId 1 -EntryType Information -Message $_}
SIEM Summit 2019 7

Autoruns in Windows Event Log
SIEM Summit 2019 8

Make a New Log
What if a log lacks context... ? Build a better one
Windows Task Scheduler + PowerShell
· Reads native block log · Runs custom checks against
blocked binary · (Optional) Sends binary to sandbox · Generates new Windows log
Possible to use new log within SIEM:
· Auto update GPO and notify user
SIEM Summit 2019 9

E is for...

Enrichment

SIEM Summit 2019 10

Enrichment Example

Which would you rather investigate?

#1

Signature: ET POLICY PE EXE or DLL Windows file download SID: 2000419 Classification: Potential Corporate Privacy Violation Source IP: 74.125.159.56 Source Port: 80 Destination IP: 192.168.2.40

IDS Alert # 1 or
IDS Alert # 2

#2

Signature: ET POLICY PE EXE or DLL Windows file download SID: 2000419 Classification: Potential Corporate Privacy Violation Source IP: 74.125.159.56 Source Port: 80 Destination IP: 192.168.2.40

Geo: US ASN: Google Inc. DNS: dl.google.com Process: iexplore.exe User: jhenderson File: ChromeSetup.exe

SIEM Summit 2019 11

Domain Parsing
Simple breakdown of fields can yield MANY detection opportunities!
http://myaccount.google.com-securitysettingspage.tk

Subdomain field

Parent domain field

TLD

Lots of opportunity for detection!
SIEM Summit 2019 12

github.com/HASecuritySolutions/tld_pattern_calculator
SIEM Summit 2019 13

Detection Based on TLD
Some TLDs are just more evil....dashboard it!

https://www.nominet.uk/mapping-the-online-world/

SIEM Summit 2019 14

Detection Based on Subdomain
Subdomain field: 1. Does it contain the word Google, or your org name? 2. Long / random, changing and NOT a CDN? 3. 1000's of different subdomains per parent? Tunneling! Phishing alert pseudo-logic examples: - If subdomain = *google*, parent domain != google.com - If subdomain contains google, ASN != Google - Group by parent domain, if unique subdomains > 500
SIEM Summit 2019 15

Spear Phishing Link
Email Body: Check out this client's site before our call Links To: http://afecrej6h7cn5sdfhvjg9evmj.com
Attacker Web Server
SIEM Summit 2019 16

freq_server.py
How about natural language processing of select fields?
· Scores the likelihood something is "weird"
Manual testing Logstash query
SIEM Summit 2019 17

Top1M Filtering
Before

After - approx < 90% logs

SIEM Summit 2019 18

Enrichment via SIEM auto-correlation
Signature: Something bad happened SID: 2000419 Classification: Potential Corporate Privacy Violation Source IP: 74.125.159.56 Source Port: 80 Destination IP: 192.168.2.40
Does 74.125.159.56 exist in prior DNS logs (answer field) · Pull back DNS query (dl.google.com) Any logs that have network socket to process/user? · Sysmon event ID 3 (pulls in jhenderson and iexplore.exe)
SIEM Summit 2019 19

Dynamic DNS Domains

Dynamic DNS Services

· VERY often used for malware

· VERY unlikely to be legitimate business site

· Often used for policy violation

Detect via blacklist!

· Or just block access via DNS RPZ

block based on nameserver

https://medium.com/alphasoc/a-deeper-look-at-dangerous-tlds-19f9e3e77926

SIEM Summit 2019 20

Autonomous System Numbers (ASN)
Attaches an organization name to an IP address
· Makes geolocation data better · Gives context on downloads
Use case: Which is more suspicious? User downloads file chromesetup.exe from ASN...
1. Google LLC 2. No.31/Jin-rong Street
SIEM Summit 2019 21

I is for
Identify
SIEM Summit 2019 22

Identify All the Things

Easy right? What do you look for?

SIEM Summit 2019 23

One Good Rule

SIEM Summit 2019 24

MITRE ATT&CK1
Adversarial Tactics, Techniques, and Common Knowledge
· Focus is on actionable detection techniques · Given common adversarial methodologies
Framework is high-level enough to report on and adapt
· Yet specific enough to provide actual items to look for · Source of specific detection rules
SIEM Summit 2019 25

MITRE ATT&CK Matrix
SIEM Summit 2019 26

Other Repositories
More sources than just MITRE ATT&CK for detection rules · PDF - NSA Spotting the Adversary · Sigma - Open source rule repository (more on this later) · SOC Prime - Threat Detection Marketplace
· Open source rules · And commercial rules
Threat Feeds - MISP, Open Threat Exchange, etc.
SIEM Summit 2019 27

O is for...

Orchestration

SIEM Summit 2019 28

SOAR + SIEM + SOC = Magic
SOAR

SIEM

Alerts

Incident Management System
Threat Info
Threat Intelligence
Platform

Playbook Actions
SIEM Summit 2019 29

Automation and Orchestration Use Case Categories
Typical categories for SOAR:
· Enumeration and Enrichment (IP, Hostname, Hash)
· Using internal tool APIs · On external data · Resolved by SOAR framework
· Incident Response
· Blocking actions · Sample gathering · Cleanup
· Alert and Case management

SIEM Summit 2019 30

Orchestration
Receive Alert Rule

Convert Alert Rule
sigmac

Test Alert Rule

Manually Review /
Assess
result
Move into Production

SIEM Summit 2019 31

Give Your SIEM a Hand with SOAR

+ Enrichment & Formatting
Logs
SOAR

SIEM

+ Enrichment & Formatting
Alerts
SOAR

Triage / Incident Management

EDR

Threat Intel Platforms

Vuln. Scan Database

Firewall

Active Directory
SIEM Summit 2019 32

U is for...
Universalize

SIEM Summit 2019 33

Universalize

Logs vary from data source to data source and org to org

· Need to universalize for applied logic and analytics

Oct 5 15:06:54 server sshd[2014]: Failed password for invalid user 123 from 212.129.35.106 port 43271 ssh2

Compare

How to universalize?
· Parse with standard field names

An account failed to log on. Subject:

· Add field aliases to standard field names · Utilize tags such as logon_failure

Security ID: S-1-5-21-2635542286-2942777934-2742232658-1105

Account Name: jhenderson

Account Domain: SEC555

SIEM Summit 2019 34

Sigma
· Written by Florian Roth & Thomas Patzke
· "To logs, what Snort is to network traffic and YARA is to files"
· High level generic language for analytics · Enables analytics re-use and sharing across orgs
SIEM Summit 2019 35

Conversion of Signatures to Alert Queries

Splunk Qradar

Company 1 field names
Company 2 field names

Analytics

Sigma Rule

Elasticsearch

Company 3 field names

...

...

Grep

Grep command

Search Query Search Query
Search Query

Alert Engine
Alert Engine
Alert Engine

Written by community

Mapping to your field names, written by you

SIEM Summit 2019 36

One Input ­ Three Outputs
$ ./sigmac --target splunk --config ./config/splunk-windows-index.yml win_pass_the_hash.yml (index="windows" (LogonType="3" LogonProcessName="NtLmSsp" WorkstationName="%Workstations%" ComputerName="%Workstations%" (EventCode="4624" OR EventCode="4625")) NOT (AccountName="ANONYMOUS LOGON")) $ ./sigmac --target qradar --config ./config/qradar.yml win_pass_the_hash.yml SELECT UTF8(payload) as search_payload from events where (LOGSOURCETYPENAME(devicetype)='Microsoft Windows Security Event Log' and (LogonType='3' and LogonProcessName='NtLmSsp' and WorkstationName='%Workstations%' and ComputerName='%Workstations%' and ("Event ID Code"='4624' or "Event ID Code"='4625')) and not (AccountName='ANONYMOUS LOGON')) $ ./sigmac --target es-qs --config ./config/winlogbeat.yml win_pass_the_hash.yml (winlog.channel:"Security" AND (winlog.event_data.LogonType:"3" AND winlog.event_data.LogonProcessName:"NtLmSsp" AND winlog.event_data.WorkstationName:"%Workstations%" AND winlog.ComputerName:"%Workstations%" AND (winlog.event_id:"4624" OR winlog.event_id:"4625")) AND (NOT (winlog.event_data.AccountName:"ANONYMOUS\ LOGON")))
SIEM Summit 2019 37

Sigma + MISP
· MISP is one of the best, free Threat Intel Platforms · Wide usage in enterprise
· Integrates well with other tools via open API
· "Event" driven data organization
· All hashes, IPs, URLs, for incident go into an "event"
· Meant for sharing
· Supports Sigma rules as object type
· Tool sigma2misp pushes rules to events
SIEM Summit 2019 38

Imagine a world...
· Where intelligence reports come with Sigma rules
· Don't have to write the analytics · Don't even have to transcribe them
· They came to you through MISP!
· Analytics automatically appear in Threat Intel Platform
· Already associated with threat actors · Supporting IOCs included
· Simply convert the rules you want!

SIEM Summit 2019 39

Conclusion
Is your SIEM doing everything for you that it can? Remember...  A - Automation  E - Enrichment  I - Identify  O - Orchestration  U - Universalize Which are all enabled by Y ---> You
SIEM Summit 2019 40

Thank you!
SIEM Summit 2019 41

