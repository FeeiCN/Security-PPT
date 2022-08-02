SESSION ID: TECH-R03
Automation and Virtualization Simplify Life: Can They Simplify Security?
#RSAC

Rob Randell
Director, NSBU System Engineering Vmware
Hadar Freehling
Staff Security Strategist Vmware @dfudsecurity

#RSAC
What can we do today?

#RSAC
Security and Automation

Policy Triggers Actions Timer Reset -

What do I allow or don't allow? Event, activity, baseline differentials, etc. Block, log, accept, etc.. How long should the change last? What is post incident normal?

3

#RSAC
Security and Automation

Policy Triggers Actions Timer Reset -

No SSH within the Data center SSH process started on a server Block traffic via firewall Check for alerts in near real time 5 minutes before firewall rule is removed

4

Demo

#RSAC
5

#RSAC
And now some history

#RSAC
Background on Virtualization

Server

Virtual datacenter

Virtual private cloud
7

Laydown the Network

#RSAC

Internet

#RSAC
Add Compute
Internet

#RSAC
Now For The Complex Part
Internet

Mixing of Workloads
PCI Non-PCI Private

#RSAC
11

Compute and Automation
Deploy from gold image PowerShell Scripts Puppet Chef Package deployments

#RSAC
12

Security and Virtualizing
Gen 1 virtual security
Virtual appliances ­ Functional, but limited
Agentless AV Most enforcement still outside the virtual environment

#RSAC
13

#RSAC
"We cannot solve our problems with the same way of thinking that created them."
- Albert Einstein
14

#RSAC
Modern Attack: Targeted, Interactive, Stealthy

Intrusion
Attack Vector / Malware Delivery Mechanism
Entry Point Compromise

Propagation
Escalate Privileges Install C2* Infrastructure
Lateral Movement

Extraction
Break Into Data Stores Network Eavesdropping
App Level Extraction

Exfiltration
Parcel & Obfuscate Exfiltration Cleanup

Stop Infiltration
80% of the investment is focused on preventing intrusion
The attack surface is simply too wide

Stop Exfiltration
20% of the investment is focused on addressing propagation, extraction and exfiltration.
Organizations lack the visibility and control inside their data center

#RSAC
Modern Attack: Targeted, Interactive, Stealthy
Intrusion
Attack Vector / Malware Delivery Mechanism
Entry Point Compromise
Stop Infiltration
80% of the investment is focused on preventing intrusion
The attack surface is simply too wide

#RSAC
Modern Attack: Targeted, Interactive, Stealthy

Intrusion
Attack Vector / Malware Delivery Mechanism
Entry Point Compromise

Propagation
Escalate Privileges Install C2* Infrastructure
Lateral Movement
Stop Exfiltration
20% of the investment is focused on addressing propagation, extraction and exfiltration. Organizations lack the visibility and control inside their data center

#RSAC
Modern Attack: Targeted, Interactive, Stealthy

Intrusion
Attack Vector / Malware Delivery Mechanism
Entry Point Compromise

Extraction
Break Into Data Stores Network Eavesdropping
App Level Extraction
Stop Exfiltration
20% of the investment is focused on addressing propagation, extraction and exfiltration. Organizations lack the visibility and control inside their data center

#RSAC
Modern Attack: Targeted, Interactive, Stealthy

Intrusion
Attack Vector / Malware Delivery Mechanism
Entry Point Compromise

Exfiltration
Parcel & Obfuscate Exfiltration Cleanup
Stop Exfiltration
20% of the investment is focused on addressing propagation, extraction and exfiltration. Organizations lack the visibility and control inside their data center

#RSAC
The Security Tool Belt

Security Infrastructure

IDENTITY CONTROLS Advanced Authentication, SSO, Authorization, User Provisioning

APP/DATABASE CONTROLS Vulnerability Management, Storage Security, Web Services Security,
Secure OS

GOVERNANCE/COMPLIANCE Vul Management, Log Management, GRC,
Posture Management, DLP

SECURITY SERVICES MANAGEMENT Visibility, Provisioning, and Orchestration

SOC SIEM, Security Analytics, Forensics

COMPUTE AV, HIPS, AMP, Encryption, Exec/Device
Control

NETWORK

STORAGE

FW, IDS/IPS, NGFW, WAF, AMP, UTM, DDoS Encryption, Key Management, Tokenization

20

Impact of Architecture

Distributed application architectures

Comingled on a common infrastructure

#RSAC
Massive misalignment

1. Hyper-connected compute base 2. Distributed policy problem
21

#RSAC
How do we fix this?

#RSAC
Security and Virtualizing Gen 2
Virtualization security is a reality NextGen Firewalls and IPS systems are integrating into the fabric Endpoint and network monitoring leverage virtualization
23

Automating and Security
New levels of information and visibility RestAPI is common Why not leverage this?

#RSAC
24

#RSAC
Leveraging Virtualization

1

2

3

Traditional Data Center
Static service chain

Virtualized Data Center
Dynamic service chain

Design and Leverage
Enhanced security and service insertions Automatic remediation & automatic response Network isolation on demand
DMZ anywhere

#RSAC
26

Adaptable Security Response
All this based on changing meta data of your systems.... What it was is not what it is today... Adaptable security for an ever adapting world

#RSAC
27

#RSAC
Security and Automation [PTATR]

Policy Triggers Actions Timer Reset -

What do I allow or don't allow? Event, activity, baseline differentials, etc. Block, log, accept, etc.. How long should the change last? What is post incident normal?

28

#RSAC
The Automation Security Workflow

Detected Alert sent

Automation workflow

Security Policy changed

Investigate Remediate Patch Destroy

Validate Re-Scan

Security Policy changed

Change Happens

29

Automation Risk Reduction
How long does it take to respond? What is the size of team? Can you reduce remediation time and time to investigate ?

#RSAC
30

How to get started
Things to consider?
Is your organization ready for this? What is your hypervisor? How much are your virtualized? Is IT silo or integrated What is your automation platform, if you have one? Are there low hanging fruit we can attack with this?

#RSAC
31

#RSAC
Apply What You Have Learned Today
Next Step:
Talk to your virtualization team and find out what you have deployed
Build a plan:
Understand the integration points with your security products and your hypervisor Define remediation workflows (PTATR)
Put it into action:
Deploy a initial security remediation workflow to help with non-business critical systems security alerts Increase integration points and develop playbooks for security remediation automation
32

Why Not Now
Stateless built fashion
Wipe at random (just in case) ­ temporary systems Containers and read only systems Why write?
Change control paradigm change
Auto updates/changes based on automation....

#RSAC
33

Future is Bright
Automate based on dynamic variables
Encryption on the fly Enhanced trusted context from the endpoint Look at app memory via hypervisor Honeypot on demand Integrate into development

#RSAC
34

#RSAC
Q&A Hadar Freehling hfreehling@vmware.com Rob Randell rrandell@vmware.com

