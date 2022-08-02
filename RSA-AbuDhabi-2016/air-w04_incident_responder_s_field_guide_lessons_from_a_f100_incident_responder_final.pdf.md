SESSION ID: AIR-W04
Incident Responder Field Guide: Lessons from a Fortune 100 Incident Responder
#RSAC

Tim Bandos
Director of Cybersecurity Digital Guardian @midnit3sec

#RSAC
Agenda
Introductions Purpose Response Plans Framework IR Lifecycle Cyber Threat Hunting

#RSAC
Purpose

A Cyber Security Incident Response Plan provides a formal, coordinated approach to responding to cyber security incidents affecting information assets.

Defines: Incident classification Roles and responsibilities Incident reporting and escalation

Communication channels for information flow

Outlines the overall incident response processes

Public

3

#RSAC
Who's on the IR Team?

Technical

Non-Technical

Incident Response Manager
Security Analysts Threat Researchers

CSO CISO CIO

HR Compliance Public Affairs
Legal

Communication within and between two groups critical

Public

4

#RSAC
What Not to Do & Do

Not To Do
 Panic  Discuss the incident with others
unless directed  Use domain administrative
credentials to access systems  Shutdown affected systems  Execute any non-forensic type
software on system

To Do
 Collect volatile data and other critical artifacts
 Gather any external intelligence based on known indicators of compromise
 Safeguard systems and/or media for forensic collection
 Collect any network-based logs

Public

5

#RSAC
Incident Categories, Types, & Severities

Category
Unauthorized Access Malware Denial of Service Improper Usage Unsuccessful Attempt Physical Asset Loss Explained Anomaly

Type
Advanced Persistent Threat Hacktivism Threat Insider Threat Opportunistic Threat Nuisance Threat Unattributed Threat

Severity
Critical Impact High Impact Moderate Impact Low Impact

Classification of Incidents enables the prioritization of incident management while enabling meaningful metrics

6

#RSAC
Incident Taxonomy

Detection Method
 End User Report  3rd Party Service
Provider  Law
Enforcement  Data Leak
Prevention  Intrusion
Prevention System  Intrusion Detection System  Firewall  Anti-Virus  Proxy  Netflow
Public

Vector
 Email  End User Action  Vulnerability
Exploited  Web / Drive-by  USB / External
Drive  Brute Force  Loss of Asset  Unauthorized
Software  Weak Password

Impact
 Employee Dismissal
 HR / Ethics Violation
 Loss of Productivity
 Unauthorized Privileges
 Website Defacement
 Brand Image  Lawsuit  Denial of
Service  Compromise of
IP  Malicious Code
Execution  Privacy
7

Intent
 Non-Malicious  Malicious  Theft  Accidental  Physical
Damage  Fraud  Defamation  Espionage

An Incident Taxonomy will provide readily obtainable answers to key questions involving root cause,
trends, and intelligence.

#RSAC
Incident Taxonomy continued...

Data Exposed
 Public  Confidential  Export Control  Financial
Reporting  Unknown  PII  PCI

Mitigation
 OS Patching  Application
Patching  User Awareness
& Training  Compliance to
Internal Standards  Host Hardening  Least Privilege  Technology Rule Configurations

Root Cause
 Unauthorized Action
 Vulnerability Management
 Theft  Security Control
Failure/Gap  Disregard of Policy  Non-Compliance
to Standards  Service Provider
Negligence  User Negligence

Public

8

Incident Communications

Telecommunication Bridges  Use pre-shared access codes for authenticating users  Avoid using speakerphones in non-closed conference rooms or offices Email  Encrypted email messages when discussing IR details  Recommend using signed and encrypted ECA PKI certificates
Instant Message  Unencrypted IM messaging should be avoided at all costs
Only member's on the Incident Response team with a need-to-know should be included in communications
regarding details.

Public

9

#RSAC

#RSAC
5 Incident Response Phases

CRISIS

Post-Incident Activity

Preparation

Containment &
Neutralization

Detection & Reporting

Triage & Analysis

Public

10

#RSAC
Preparation

Establishing policies, procedures, and agreements covering the management and response to security incidents BEFORE you need them.

 Ongoing collection, analysis, and fusion of Threat Intelligence  Cyber Threat Hunting Operations  Threat Detection Capability Development  Conduct Operational Cyber Exercises  Ensure Vulnerability Management & Configuration Management are informed  Documented Procedures for Incident Handling

Public

11

#RSAC
Detection & Reporting

Monitoring and correlation of security events to detect, alert, and report on potential security incidents.
Events generated from:
 Intrusion Prevention / Detection Systems  Anti-Virus Logs  Firewall Logs  Data Leak Prevention Logs  Vulnerability Management Systems  Netflow Logs

Public

12

Triage & Analysis

Examination of event/log data to confirm whether the detected activity is indeed a security incident.

Endpoint Analysis
Forensic Acquisition & Analysis Memory Analysis Timeline/Artifacts

Binary Analysis
Static/Dynamic Analysis Reverse Engineering

#RSAC
Enterprise Hunting
Apply IOC's across Enterprise Leverage SIEM for Traces

13

#RSAC
Containment & Neutralization

Strategy development based upon all the intelligence gathered throughout the Triage & Analysis phase. Coordination and notification of all involved or affected entities with details on how to effectively neutralize the threat.
Items to Consider:  System Backup ­ Note: May introduce risk from infection  Risk to continued Operations  Changing Passwords /ACL's on compromised systems  Development of new detection capabilities for Post-Incident Monitoring  Process for wiping systems and Rebuilding OS  Issuing Threat Mitigation Requests

Public

14

#RSAC
Post-Incident Activity
Documentation and dissemination of an incident report, identifying lessons learned including successful and unsuccessful actions taken in response.
Items to Consider:  Development of new security initiatives to prevent future incidents.  Updating Threat Detection Watchlists / Feeds  Closely Monitor Activity Post Incident  Coordination among organization to implement any process improvement
activities

Public

15

#RSAC
Cyber Hunting Safety: Cyber-Threat Tracking and Hunting

#RSAC
Agenda
Groundwork Building Blocks Supplies, Preparation, Ammunition, Armory The Prey, Bird Dogs Stories from the Field Facing your Adversary Questions

#RSAC
Groundwork

Incident Response
Formalized Plan Well Defined Business Wide Initiative

Threat Hunting
Mission Fewer Boundaries InfoSec Centric

Public

18

#RSAC
Building Blocks to Threat Hunting
1. Build Architecture 2. Implement Passive Defense 3. Develop Active Defense
Program 4. Drive Intelligence

Public

19

#RSAC
The Equation

Public

20

Supplies and Preparation

What are the tools Bare minimum Nice to haves Luxury goods

Logs, Logs, Logs

Skills you should have Innovative Analysts Active Defense & Intelligence Familiarity with Enterprise Ability to Hypothesize Statistics

Public

21

#RSAC

SIEM

Machine Learning

Log Consumer

Data Analytics

#RSAC
Ammunition

Endpoint

Hunters require data; providing the ability to pivot from individual pieces of information into links and correlations to reveal the threat.
Logs Alerts Netflow Forensic Images Memory Captures

Firewall

Key Log Sources

Windows

Proxy

AntiVirus

22

#RSAC
Armory
Tools
SIEM: ELK Stack (Elastic Search, Logstash, Kibana) Log Forwarder: NxLog Log Parser: Log Parser 2.2 Microsoft Log Capture: Digital Guardian, duhh (or Sysmon) Host Forensics: Encase / Sleuth Kit / FTK Imager Memory Forensics: Volatility / Mandiant's Redline Timeline: Log2timeline Registry: RegRipper
23

The Prey
Known
 Matches an Indicator / Signature  Antivirus is Aware / Submitted to Virus Total  Your Level 1 Analyst Detects Them  FireEye has a Blogpost About Them  Easy to Detect & Out in the Open

#RSAC
Unknown
 Leverages New Techniques for Persistence / C2  Works through encrypted channels  Authorized Use Activity  Maintains inside a Baseline  Recently Created Command & Control  Recently Compiled Toolsets  Google Searches on MD5's = Nothing  BLENDS IN

Public

24

#RSAC
Bird Dog
Bird Dog ­ dogs trained to retrieve birds
Strategic Goal
 Hunting processes have been operationalized  Continual improvement of existing processes  Development of new hunting tactics  Actively seeking out adversaries on a daily basis
25

#RSAC
Hunting Examples

Proxy Logs
 Traffic being sent out port 22  Network connections with same pattern of bytes
in and bytes out  Dynamic DNS visits  Unique User Agent Strings  Base64 Encoded Strings in URLs  Executables being Downloaded

Windows Logs
 Explicit Logon Attempts (4648 / 552)  Users added to Privileged Group (4728,
4732, 4756)  Failed Logon Attempts via Multiple Accounts  Log Clearing Activity (104, 1102)  EMET Crash Logs (1, 2)  Application Crashes & Hangs (1000, 1002)  Windows Defender Errors

26

Hunting Examples

Anti-Virus
 Password Dumping Programs  Specific Backdoors Detected (PlugX, 9002, Derusbi,
Nettraveler, Winnti, Pirpi)  Detections with Dropper in the name  Custom Detection Creation

Digital Guardian
 Execution from temp with no Company Name or Version information
 Svchost launching without Services being its parent  Process launches from odd directories (%windows\fonts,
%windows\help, %windows\wbem\, %windows\addins, %windows\debut, %windows\system32\tasks)  Rar being executed to compress files  Rare process execution events  Execution of PowerShell with suspicious commands  Scheduled AT jobs with suspicious commands

#RSAC

Public

27

#RSAC
You Found Something; Now What
Gather Information & Engage Forensic Ninjas Research Intelligence via OSINT sources Execute IR Plan Neutralize Bad Guy Do it again!

Public

28

Facing Your Adversary

 Learn from their Behaviors
 Document their Tactics, Techniques, Procedures
 Organize & Manage Threat Indicators Associated to their Activity
 Develop a Profile:
· Region of Operation · Motive · Intent · Capability
 Disrupt their Operations

 Offensively Hack Back  Immediately shut down systems  Block an Indicator without knowing full scope  Call Ghostbusters for IR services

#RSAC

Public

29

#RSAC
Apply What You've Learned Today
Next week you should
Define your Incident Response plan Receive support from the executive team and business leaders
In the next three months you should have
An established IR team in place Actively engaging in the five phases of IR
In the next six months you should be actively hunting threats while identifying active attacks and responding accordingly
30

