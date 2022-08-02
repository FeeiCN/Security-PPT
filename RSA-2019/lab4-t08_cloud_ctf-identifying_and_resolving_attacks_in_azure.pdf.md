SESSION ID: LAB4-T08
Cloud ctf: identifying and resolving attacks in azure

Johnathan Trull
Senior Director/Chief Strategist Microsoft Cyber Solutions Group

Lesley Kipling
Lead investigator/Chief Security Advisor Microsoft Cyber Solutions Group

#RSAC

#RSAC
Agenda
1. Welcome and introduction 2. Overview of Azure logging & monitoring 3. Review scenario, lab environment, and required tasks 4. Lab Time ­ Contoso Blue Team Activities 5. Wrap-up
· Attacker Kill Chain Review · Post-Action Reporting and Lessons Learned Review
2

#RSAC
Welcome and Introduction
3

Jonathan Trull: Mastermind

#RSAC

Henry Parks
Ola Peters
Red Team

Anthony Petito
Chad Munkelt
Lesley Kipling
Blue Team

4

Overview of azure security logging & monitoring

#RSAC
What is Azure Log Analytics?
Service that collects telemetry and other data from variety of sources, both on-premises and in the cloud Data stored in workspaces and organized into tables Provides a query language and analytics engine (Kusto) for analyzing the operations of Azure applications and resources Both Azure Security Center and Azure Insights stores its data in Log Analytics
6

Logs in Azure

Log Source
Azure Virtual Machines Subscriptions (Azure Activity Log) / Azure Resource Manager Network Security Groups
PaaS Services
Azure Security Center
Azure Insights

Description
Windows and Linux machines operating within Azure. Windows Events and Syslogs.
Governs access to and use of Azure services and acts as a logical container for resources.

Configuration Details
Use automatic provisioning of the Microsoft Monitoring Agent via Azure Security Center.
Azure Activity Log provides a history of subscription-level events in Azure.

Virtual firewall that can be applied to VMs, subnets, and Vnets.

Enable NSG flow logging for each NSG to ensure the source IP address that initiated the communication is captured

Enable Azure Diagnostic logging. IIS Logging is enabled by default, and it is set to hourly generate files that contain all fields in W3C format
http://download.microsoft.com/download/B/6/C/B6C0A98B-D34A-417C826E3EA28CDFC9DD/AzureSecurityandAuditLogManagement_11132014.pdf

RDP to the VM and run CollectGuestLogs.exe. CollectGuestLogs.exe ships with the Azure Guest Agent which is present on all PaaS VMs and most IaaS VMs and it will create a ZIP file of the logs from the VM.

Security Center collects data from your Azure VMs and non-Azure computers to monitor for security vulnerabilities and threats. Data is collected using the Microsoft Monitoring Agent, which reads various security-related configurations and event logs from the machine and copies the data to your workspace for analysis. By default, Security Center will create a new workspace for you.

Ensure all subscriptions are onboarded and enable standard tier. When automatic provisioning is enabled, Security Center installs the Microsoft Monitoring Agent on all supported Azure VMs and any new ones that are created. Automatic provisioning is strongly recommended.

7

#RSAC

#RSAC
Log Analytics Query Language (Kusto)

Query

Description

Event

All Windows events

Event | where EventLevelName All Windows events with

== "error"

severity of error

Event | summarize count() by Count of Windows events by

Source

source

Event | where EventLevelName Count of Windows error events == "error" | summarize count() by source by Source

8

#RSAC
What is Azure Security Center?
Azure service designed to unify security management, includes functions for unified security visibility & control, threat detection, and incident detection and response Integrated with Azure Log Analytics Designed for Compliance and Policy personas
9

#RSAC
What is Azure Security Center?
Integrated with Azure Log Analytics Collects and analyzes security events from multiple sources
­ Third party security solutions & appliances ­ Azure Active Directory ­ Any solution that supports Common Event Format (CEF)
Designed for SOC personas
10

#RSAC
What is Azure Security Insights?
11

Azure Security Architecture

#RSAC
Security Dashboards Deliver Rapid Insights into Security State Across All Workloads

API
12

ASI detections across the kill chainthe kill chain

PORT SCANNING ACTIVITY DETECTED

BRUTE FORCE ACTIVITY DETECTED

SUSPICIOUS PROCESS EXECUTED ON VM

DNS DATA EXFILTRATION ACTIVITY DETECTED

KILL CHAIN INCIDENT GENERATED

Attacker port scans to look for potential victims

Attacker launches a brute force attack on targets and breaches exposed interfaces

Attacker installs custom malware on the VM

Malware contacts its command and control and sends the data over the DNS protocol

The VM owner receives the information
and shuts down the VM

Attacker compiles a list Attacker injects blind

of targets with open SQL commands into the

interfaces

Virtual Machine (VM)

Malware activates and scans the VM for confidential information and data

Security incident is generated, information is compiled and sent to the VM owner

13

#RSAC

#RSAC
Detection Example
Azure Security Insights
Security Alerts tile
14

#RSAC
Detection Example
15

Detection Example
VM Behavioral Analysis
Suspicious SVCHOST Execution
1. Collect VM process creation logs (4688 event id)
2. Analyze events with NewProcessName == "SVCHOST"
3. Verify executing user, command line params, parent process, integrity
16

#RSAC

#RSAC
Detection Example
Kusto Query for MiKatz
17

Review scenario, lab environment, and required tasks

#RSAC
Shadow IT Gone Wrong
CONTOSO LTD is a global trading company based in the United States but conducting business globally. The CTO has been under increasing pressure by the board to digitally transform their operations and services and close down capital intensive data center operations. As such, she directed her team to start using Azure about three months ago for testing purposes and to deploy some low-risk production workloads. CONTOSO's security team has not been part of the project, and has not been monitoring the workloads for threats.
You are the director of CONTOSO LTD's small information security team. On Friday just before 5 PM, the CTO calls you and says there might be a problem. "You know that Azure project we've been talking about. Well, we kicked it off about three months ago. And here's the thing, we're seeing some strange things and are worried we've been compromised. Sorry for not bringing you in sooner but I need you to look into it ASAP."
19

#RSAC
Lab time ­ contoso blue team activities ­ 60 Minutes
1. Get familiar with the lab environment 2. Identify sources of available logs, review configurations, and
centralize logs as needed 3. Hunt through logs for evidence of attack
· Suggest starting your investigation with the Security Alerts Tile located in Azure Security Insights
4. Document the details of the incident, including attack details and whether or not sensitive data was exposed
5. Identify control weaknesses that led to attack and recommend countermeasures
20

#RSAC
Rules of Engagement
You have one hour to complete the lab Everything you need to know is in your lab handout If you have any questions or need help, please let us know Relax and have fun!
21

Wrap-up

Attacker Review

Initial Access

Execution

Persistence

Lateral Movement

RDP Brute Force

Command-Line Interface

SQL Injection Vulnerability

Regsvr32

New valid user accounts
Scheduled Task creation

SSH Exfiltration

Legitimate Credentials/Access Keys

23

#RSAC

#RSAC
Cloud attacks kill chain

Target and attack
Inbound brute-force RDP, SSH, SQL attacks and more

Install and exploit

Post breach

Suspicious process execution

Using compromised resources to mount additional attacks (outbound port scanning, brute-force RDP/SSH
attacks, DDoS, and spam)

24

Red Team Activities Overview

IaaS-RDP Bute Force

IaaS-SQL Injection

IaaS-Domain Controller

Stage1
Successful RDP Brute Force attack
Remote Code Execution via PSExec
Disabling of critical services and
reconnaissance of the environment
Credential Dumping
Command and Control communication using customized backdoor

Stage2
Discover and exploit SQL Injection vulnerability
Enumerate list of available databases
Dump interesting tables containing usernames and passwords (or password hashes)
Obtain shell access on underlying operating
system
Establish backdoor persistence

Stage3
Use valid credentials to authenticate
Dump Active Directory database credentials

IaaS-Red Hat Development

Azure Access

Stage 4
Use valid credentials to authenticate over SSH
Download Apache web services source code
Extract storage blob credentials and other
sensitive secrets
Use obtained secrets to access other Azure based resources

Stage 5
Access storage blob using obtained access
keys from Red Hat workload
Extract sensitive data of interest from Blob Storage
Access other services using credentials/access keys (e.g., Storage Blob, SAS tokens, NSGs,VHDs)

25

#RSAC

Protection mechanisms

#RSAC
Control Weaknesses & mitigations
· Control Weakness 1 ­ Administrative endpoints exposed to the internet · Remediation action: Disable direct RDP and SSH access to Azure Virtual Machines from the internet. More secure mechanisms include:
· Network Security Groups (NSG) · Point-to-Site VPN · Site-to-Site VPN · ExpressRoute
· Control Weakness 2 - SQL Server Web Application Firewall Not Enabled · Remediation action: Enable and monitor alerts from a Web Application Firewall (WAF) to protect against web vulnerabilities and attacks.
· Control Weakness 3 - Storing of sensitive access keys · Remediation action: Use Azure Key Vault to safeguard cryptographic keys and secrets used by cloud application and services.
· Control Weakness 4 - Monitoring of Azure Security Center alerts · Remediation action: Review Azure Security Center alerts to ensure that both existing vulnerabilities and threats are being remediated.
27

#RSAC
Advanced Cloud Defence
Block Malware Block Brute Force
28

Brute Force Attack mitigations
When just-in-time access is enabled, network security group rules are created that limit inbound traffic to management ports
· Do not allow persistent network access to management ports
· Control and audit network access requests · Monitor inbound network traffic to detect active
threats · Block traffic from malicious sources · Monitor VMs events for signs of successful logins
resulting from brute force attacks
https://docs.microsoft.com/en-us/azure/security-center/security-center-just-in-time
29

#RSAC

#RSAC
Advisor recommendations
30

Implement Firewalls
Implement Web Application firewall
31

#RSAC

Apply

#RSAC
Apply what you have learnt
Today:
­ Try Advanced threat detection capabilities in the standard tier, free for 60 days.
Next week you should:
­ Review Azure Best Practice Security Guidelines:
o https://docs.microsoft.com/en-us/azure/security/security-best-practicesand-patterns
In the first three months following this presentation you should:
­ Prioritize implementation of CIS controls 1 ­ 6, 9, 12, 13, 14, 16, 18
o https://learn.cisecurity.org/20-controls-download
33

#RSAC
Lessons Learned
Group Discussion ­ What did we learn?
34

