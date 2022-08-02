SESSION ID: PART4-T08
XDR: Improving EDR effectiveness by adding email & network visibility

Eric Skinner
VP, Market Strategy Trend Micro @EricSkinner

#RSAC

Social engineering risk
User behavior

Code from 3rd party repositories
Application Vulnerabilities

Misconfigurations

#RSAC

Network vulnerabilities

Vulnerable OT devices

Endpoint Vulnerabilities

Old operating systems

Branch Office

#RSAC
SOC/IR ANALYST
Wants fast detection & response across entire environment
Branch Office

Today, the SOC gets siloed insight into endpoints (EDR)...

#RSAC
...and limited visibility to threats affecting cloud
workloads

SOC / IR Analyst

...a separate siloed view into network
events,
Branch Office

#RSAC

Generating incomplete, noisy SIEM alerts without
any context

SOC / IR Analyst

Branch Office

Threat arrived via email to another endpoint

Additional apps impacted

#RSAC
There was more to the story! It's important to see
the whole picture.

Spread to cloud via compromised credentials

SOC / IR Analyst

Spread from cloud to OT infrastructure

Branch Office

#RSAC
XDR breaks down the silos and tells a story
instead of noise

SOC / IR Analyst
XDR

Branch Office

Source: Verizon Data Breach Investigations Report, May 2019

#RSAC

#RSAC
What's XDR, anyway?
An emerging industry term, not vendor-specific.

#RSAC
XDR Definition, emerging:
Josh Zelonis, Principal Analyst, Forrester Research Inc. December 12, 2019 https://twitter.com/josh_zelonis/status/1205192042843758592

#RSAC
With focus on built-in correlation, not just collection:
Peter Firstbrook, VP Analyst, Gartner Inc. Dec 13, 2019 https://twitter.com/Pfirstbrook/status/1205559416755511296

#RSAC
Some Managed Services do "XDR" today
Josh Zelonis, Principal Analyst, Forrester Research Inc. December 13, 2019 https://twitter.com/josh_zelonis/status/1205563012163108864?s=20

#RSAC
XDR Acronym, Expanded
Cross-Layer
EndpoXint Detection & Response
Extended

An XDR system view

Event Monitoring (SIEM)

Security Automation (SOAR)

XDR Data Lake

#RSAC
XDR Engines for: Ingestion, Normalization, Correlation, Detection,
Visualization...

Email

Endpoint Domain

Cloud

Network

(incl. EPP/EDR) Info

Applications Activity

OT Telemetry

#RSAC
Isn't this just SIEM? No.

#RSAC
SIEM (Security Information and Event Management)
Security alerts, (but not all events)

Phishing

Email opened

Word PowerShell Command

doc launched & Control

opened

check-in

AWS Credentials Accessed

New

Lateral

container movement

created to container

#RSAC
SIEM (Security Information and Event Management)
Collecting all endpoint activity, not just alerts
EDR (Endpoint Detection & Response)

Phishing

Email opened

Word PowerShell Command

doc launched & Control

opened

check-in

AWS Credentials Accessed

New

Lateral

container movement

created to container

#RSAC
SIEM (Security Information and Event Management) Fewer, higher-fidelity alert that tells a story
XDR (with cloud data lake collecting all activity)

Phishing

Email opened

Word PowerShell Command

AWS

New

Lateral

doc launched & Control Credentials container movement

opened

check-in Compromised created to container

#RSAC

#RSAC
Why email detection & response?
Email as the delivery method for malware:

Source: Verizon Data Breach Investigations Report, May 2019

94%

#RSAC
This looks bad, and can trigger detection...

Outlook

invoice317.docx

Word

PowerShell

37.142.251.3

#RSAC
...but knowing what happened earlier is
really useful!

Outlook

invoice317.docx

Word

PowerShell

Message also sent to:

Jane Wilson [not opened] Peter Armstrong [not opened]

#RSAC

From Louis Wilson <louis175C@ hotmail.com> Message ID B23FA572@ hotmail.com
From Louis Wilson <janeH137@ hotmail.com> Message ID C2457B3A@ hotmail.com

Joe Collins

Outlook

invoice317.docx

Word

PowerShell

Same PowerShell code, different origin: likely related

Holly Finch

Outlook

pastdue.docx

Word

PowerShell

#RSAC

#RSAC
Server & Endpoint Attacks are Different

Typical Endpoint
Attack

Email origin, tricks user to activate threat

Threat launches, performs actions, spreads laterally

Typical Server Attack

Attack arrives remotely, targets OS or application
vulnerability

Vulnerability exploit launches malicious actions

SIEM
Traffic from known malicious IP Source: 3.211.84.114 Target : 192.168.24.13
Server Workload

#RSAC
Server IR challenge #1: SIEM has Insufficient Context Who manages this server? Is it in the datacenter or in AWS/Azure? How critical is the workload?

XDR
SSL Downgrade Attempt Target: srv03dbms Location: AWS EU-WEST-1 Managed by: James Hope Criticality: PRODUCTION Subnet: PRIVATE
Server Workload

#RSAC
More Context with XDR Telemetry Speeding response Prioritizing severity Leveraging meta-data from cloud platforms

SIEM
Log Inspection Alert Possible attack on the SSH Server (or version gathering) Source: 3.211.84.114 Time: Sept 9, 2019 01:30:59
Server Workload

#RSAC
Server IR challenge #2: Alerts don't tell whole story

#RSAC

SIEM
Log Inspection Alert Possible attack on the SSH Server (or version gathering) Source: 3.211.84.114 Time: Sept 9, 2019 01:30:59
Server Workload

#RSAC
Server IR challenge #2: Alerts don't tell whole story This is likely one step of many What's the bigger picture? Has the attacker been successful?

#RSAC
XDR tells a story
XDR
Enables faster/automated response
Suspicious process launched after likely SSH brute force attack

Malformed SSH protocol (likely version gathering)

SSH Login Failure Account: maint3
Qty: 23

SSH Login Success Account: maint3

Unknown Process /svc/daemon34

Server Workload

EDR
Traffic to known C&C Source: 10.10.203.57 Target: 3.211.84.114
Server Workload using Containers

#RSAC
Server IR challenge #3: Endpoint EDR doesn't deeply understand containers What container has the issue? What about images that aren't running?

XDR
Traffic to known C&C from vulnerable container Source: 10.10.203.57 Target : 3.211.84.114 Docker Container d7886598dbe2 Image ID: e31487ab6f14 Vulnerability: CVE2017-1000408
Server Workload using Containers

#RSAC
Additional vulnerable container images require remediation Inactive containers Image IDs: 84c2af573c22 + 14 Vulnerability: CVE2017-1000408
Inbound C&C traffic detected to second vulnerable container Running container Container: 17cfa731521f Image ID: 37a2426c631a Vulnerability: CVE2017-1000408

#RSAC
XDR Demo

#RSAC
State of XDR Today

Analysts / vendors / customers shaping the category & term
Vendors understand their own telemetry best. SIEM sees more but understands less.
Currently either goes broad or deep but not both ­ which sources matter to you? Which deliver most important visibility?

Enabling expanded MITRE ATT&CK mapping as their frameworks evolve
Activity telemetry = lots of storage required. Expensive for cloud-based XDR.
What is optimal balance between automated response vs. manual review?

Where is XDR headed?

#RSAC
Inevitable collision with SIEM. Both XDR and SIEM have much to learn from each other.

XDR becomes the logical home of any decisions re: automated threat response, because XDR has the best amount of information at hand.

EDR vendors will gradually shift to XDR, adding more sources.

#RSAC
XDR: Lessons to Apply Today
1. Explore whether your existing EDR can see beyond the endpoint; if yes, and sources are useful, understand and enable that
2. In particular, aim to integrate email visibility into the SOC/IR process, since a high volume of threats originate there.
3. Review whether your server workloads are being treated as more than just a regular endpoint. Can you see containers, misconfigurations, the dev pipeline?
4. Aim for tight linkage between investigation & automated response functions, for example EPP + EDR, as a foundation for automated XDR response

#RSAC
Thank you!
eric_skinner@trendmicro.com @EricSkinner

