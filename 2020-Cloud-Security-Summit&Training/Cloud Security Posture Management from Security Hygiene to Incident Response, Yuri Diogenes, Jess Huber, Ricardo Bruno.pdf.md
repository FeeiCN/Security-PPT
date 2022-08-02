Why security hygiene should be your number one priority?
Source: https://blog.automox.com/bad-cyber-hygiene-breaches-tied-to-unpatched-vulnerabilities

Source: https://securityintelligence.com/your-security-strategy-is-only-as-strong-as-your-cyber-hygiene/

Source: https://www.informationsecuritybuzz.com/study-research/37-of-organisations-have-suffered-a-cyberattack-on-cloudenvironments-due-to-the-lack-of-basic-cloud-security-hygiene/

Traditional defenses are no match for today's challenges

Exposure
Insecure configuration Vulnerabilities
Infected admin
Open entry points Exposed credentials Compromised user

Access
Virtual machines Apps Credentials Data stores IoT devices

Lateral movements

Actions

Virtual machines Apps Credentials Data stores IoT devices

Data loss Data exfiltration Ransomware Resource abuse

Improve your defense against threats by enhancing your security posture

PROTECT
across all endpoints, from sensors to the datacenter

DETECT
using targeted signals, behavioral monitoring, and machine learning

YOUR SECURITY POSTURE

!
RESPOND
closing the gap between discovery and action

CSPM + CWPP

Azure Security Center

IaaS workloads Azure VMs (Windows and Linux)

PaaS Workloads

On-premises Servers and other IaaS Cloud VMs

Compliance Assessment
Operational Monitoring
API Integration
Risk Identification
Policy Enforcement
Threat Protection

CSPM CWPP

Security Hygiene
Server Protection Application Whitelisting
System Integrity Network Segmentation System Monitoring Workload Configuration

Secure score

The importance of governance

Policy enforcement

Pre-flight Validation Authoring

1 Ensure compliance 2 Empower DevOps

Protect your workloads from threats

VMs/

Apps

Servers

Containers

SQL

IoT

Network

management

Cloud workload protection

Intelligence and advanced analytics

Powered by Microsoft Intelligent Security Graph

Correlation

Detect malicious code in-memory
CWPP scans process memory to identify evidence of exploitation and malicious code

Incident Response in the Cloud

Success...

"Success is the ability to go from one failure to another with no loss of enthusiasm." ­Winston Churchill
Incident Response...

"Incident Response is the ability to go from one dumpster fire to another with no loss of enthusiasm." ­Jess Huber

Mistakes were made...

Mistakes were made...

Agile detection, rapid response, force multiplication & why they matter...
https://www.infosecurity-magazine.com/news/cybercrime-costs-global-economy/
https://www.forbes.com/sites/martenmickos/2019/06/19/the-cybersecurity-skills-gapwont-be-solved-in-a-classroom/#7eed3bdb1c30
https://www.techradar.com/news/the-human-cost-of-cybersecurity-attacks

The gap, the significant emotional event, & what to do next...
PROTECT
across all endpoints, from sensors to the datacenter
YOUR SECURITY POSTURE
WITH CLOUD

DETECT

!

using targeted signals, behavioral

monitoring, and machine learning

RESPOND

closing the gap between discovery and action

Cloud Security Fundamentals

Human Feedback loop

Endpoint Telemetry

Compute

Machine Learning (ML) & Artificial Intelligence (AI)

Threat Intelligence

The 4 Pillars of Cloud Security

More accurate threat signals generated

"When you reach the end of your rope, tie a knot & hang on." ~Abraham Lincoln
If you have to choose the 2 most effective cloud tools in an incident responder's arsenal, sharpen your skills on: - The EDR solution - The UEBA solution
- A force multiplier when the two are integrated

EDR basics...
- EDR console access:
- Leverage dedicated admin workstations - Enforce MFA on EDR console access
- Automate "commodity" detections/remediation whenever possible
- Regularly monitor for anything anomalous auto-starting on key systems such as; identity stores, VM hosts, software distribution systems, other key IT admin systems, & VIP systems (C-suite, IT staff, etc.)
- Alert on potential web shells (Example: W3WP spawning CMD) - Web shell activity is usually "targeted" activity more often than not

UEBA basics...
- UEBA console access:
- Leverage dedicated admin workstations - Enforce MFA on UEBA console access
- Focus on the identity... "You will lose sheep. It is when you loose shepherds that you have a problem."
~Me loosely quoting a friend that loosely quotes other people
- For example...your UEBA solution should be able to detect basic things like `NTDS.DIT being copied to a workstation'... - ...that establishes an SSH connection to a Linux server with a SSH forwarder that auto-forwards that DIT to an unknown location on the web for...um...a "cloud enabled backup"? 

Target vs Commodity
Mistakes were made...

What is "Targeted" & who can I blame?...
- At the most basic level, targeted = hands on keyboard - Custom implants (onprem) - Intent + Access (malware is not needed to persist)
- Your organizational leadership & IT staff will have to determine what is considered targeted
- Attribution in virtually all multi-nationals does not matter as there are really 2 types of adversary that can dictate the response: - Is the adversary's intent to get disruptive or destructive? - Is the adversary's intent to run silent & run deep (undetected) to allow for multi-stage campaigns?

If targeted, immediately switch to an OoB (Out of
Band) comms channel...
1. Whip out a credit card & establish a new collaboration platform that provides basic services such as email & document collaboration
2. Send an SMS message to key stakeholders with a flash notification of the incident & how to access the OoB channel leveraging only the cell provider (avoid using domain joined systems)
3. Issue newly built laptops complete with BIOS flash and fresh OS build using known good OEM media for the remainder of the investigation, compromise recovery, planned eviction date, & subsequent tactical monitoring

Ricardo Bruno

Q&A?

