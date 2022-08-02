SESSION ID: ANF-T08
Orchestrating Software Defined Networks (SDN) to Disrupt the APT Kill Chain

Sean Doherty
VP Technology Partnerships and Alliances Symantec @SeandDInfo

Deb Banerjee
Chief Architect, Data Center Security Products Symantec

#RSAC

#RSAC
A Quick Level Set

The Phases of an APT Attack

2. Incursion
Attackers break into network by using social engineering to deliver targeted malware to vulnerable systems or by attacking public facing infrastructure.
1. Reconnaissance
Attacker leverages information from a variety of sources to understand their target.

3. Discovery
Once in, the attackers stay "low and slow" to avoid detection.
They then map the organization's defenses from the inside and create a battle plan and deploy multiple kill chains to ensure success.

#RSAC
5. Exfiltration
Captured information is sent back to attack team's home base for analysis and further exploitation.

4. Capture
Attackers access unprotected systems and capture information over an extended period. They may also install malware to secretly acquire data or disrupt operations.
3

Characteristics and Capabilities of Software #RSAC Defined Things

Characteristics Abstraction

Instrumentation

Automation

Orchestration

Capabilities

Agility

Adaptability

Accuracy

Assurance

4

#RSAC
What is SDN ­ Definitions and Key Concepts
 This architecture decouples the network control and forwarding functions enabling the network control to become directly programmable and the underlying infrastructure to be abstracted for applications and network
 Agile: Abstracting control from forwarding lets administrators dynamically adjust network-wide traffic flow to meet changing needs.
 Programmatically configured: SDN lets network managers configure, manage, secure, and optimize network resources very quickly via dynamic, automated SDN programs,
Source: https://www.opennetworking.org/sdn-resources/sdn-definition
5

#RSAC
Data Center Security Controls: Host-Based

Controls · IDS/IPS · Anti-Malware · Detection/Response
Technologies · Signature · Behavioral · Correlation

Challenges · Operational Complexity · Impact Analysis
· "Will updating a host-based security policy cause an outage?"
· False Positives

Shellshock Compensation: (CVE-2014-6271)
6

#RSAC
Data Center Security Controls: Network-Based
Controls · Firewalls/VLAN-based Segmentation: Zones, Applications, Tiers, · Network IDS/IPS · Packet Inspection for exploit payloads · DLP : data egress detection
Challenges · Operational Complexity · Resource Consumption · False Positives · "Can't scan all traffic for all exploits"
7

A `Typical' Data Center

#RSAC

Network

Application A

WEBA

WEBB

Load Balancer

Application B

FEECOM001

FEECOM002

FEECOM003

FEECOM004

Firewall

CRMAPP1

CRMAPP2

ECOMPRDA

ECOMPRDB

#RSAC

9

Attack Scenario
 APT that leverages public facing infrastructure vulnerabilities
 Lots of these to chose from  Our scenario a classic 3 tier
public web facing application in traditional infrastructure
10

#RSAC

53% 25%

have critical vulnerabilities
unpatched

of legitimate websites have
unpatched vulnerabilities

Source: Symantec ISTR : Volume 18

1 0

The Attack
Application A

WEBA

WEBB

Load Balancer

Application B

FEECOM001

FEECOM002

FEECOM003

FEECOM004

Firewall

CRMAPP1

CRMAPP2

ECOMPRDA

ECOMPRDB

#RSAC

11

Micro-segmentation
A new model for data center security
STARTING ASSUMPTIONS
Assume everything is a threat and act accordingly.

#RSAC
DESIGN PRINCIPLES 1 Isolation and segmentation
2 Unit-level trust / least privilege 3 Ubiquity and centralized control

12

Application A

WEBA

WEBB

Load Balancer

Application B

FEECOM001

FEECOM002

FEECOM003

FEECOM004

Firewall

CRMAPP1

CRMAPP2

ECOMPRDA

ECOMPRDB

#RSAC

13

Application A

WEBA

WEBB

Firewall

CRMAPP1

CRMAPP2

Load Balancer

Application B

FEECOM001

FEECOM002

FEECOM003

FEECOM004

Firewall

ECOMPRDA

ECOMPRDB

#RSAC

14

#RSAC
If only everything was as easy as a diagram in PowerPoint
15

#RSAC
Logical View of SDN Architecture
NSX Manager, APIC Manager
NSX Controller, Nexus 9000
Firewalls, Network IDS/IPS, Network DLP
16

#RSAC
Creating the Dynamic and Secure Data Center

SDN Orchestration

Micro Segmentation Service Chaining

Dynamic and Secure

State Policy

Data Center

Micro-Segmented Architecture

Load Balancer

Private Cloud with Application A & B

ESXPRD01

ESXPRDA1

ESXPRDD6

ESXPRDB3

PRDSVR01

ESXPRDFA

ESXPRDFE

ESXPRDD D

ESXPRDA2

Firewall

#RSAC
18

#RSAC
Micro-segmentation with SDN

Control Plane NSX Manager
REST API

Data Plane Distributed switching, rou ng, firewall

Each Workload is:
 Isolated
 Requires all routing to be pre defined

Management Plane vCenter

Example Using VMware NSX

Physical workloads and VLANS

Service Chaining with SDN

Traffic Steering

Security Policy Dashboard

Security Admin

#RSAC
Security controls including · IPS · Firewall · DLP
can be dynamically added to any traffic flow

Example VMWare NSX and Symantec DCS:Server

State
 Static State  Applications  Vulnerabilities/Exploits

#RSAC

Anomaly detection

Applicati ons

Vulnerabilit ies/Exploits

 Dynamic State  IoCs  Network Traffic  Data Flow and DLP Events  Host and Network Intrusion Events  Anomaly detection

Host and

State

Network Intrusion

IoCs

Events

Data Flow and
DLP Events

Network Traffic

#RSAC
Policy

Infrastructure Provisioning
· vCenter · NSX · ACI · AWS

Security Provisioning Policies
· Firewall, Segmentation
·IPS · Anti-Malware · DLP · Host Integrity

Security Response Policies
· Currently Ad-Hoc in the future standards required

Orchestration = SDN + State + Policy

Change App Event

2. Host-based Security detects change App Event and reports.

6. Security Orchestrator recommends mi ga ons op ons -Network Security policy (E.g. quaran ne)
-Host-based Security(System Hardening) 7. Sec Admin selects Network Security policy.

1. Applica on Admin Upgrades Web Services 4. VA conducts scan
Vulnerability Manager

Hypervisor

Security Orchestrator

3. Security Orchestrator: Based on a ributes of applica on determines Vulnerability Assessment is required.

CVSS High

Exploitable

5. VA returns results to Security Orchestrator: "CVSS High and Exploitable."

SDN Manager
8. "Quaran ne Tag" to Network Security device
Quaran ne
Network Security Device
9. PAN applies access control to allow only admin access to VM.
10. VM is placed in SDN "Quaran ne" Security Group

#RSAC

#RSAC
Creating the Dynamic and Secure Data Center

SDN Orchestration

Micro Segmentation Service Chaining

Dynamic and Secure

State Policy

Data Center

#RSAC
Orchestrating SDNs to disrupt APTs
 Automated Policy Based Provisioning
 Consistently apply appropriate controls  Moves with the workload, and cleans up behind itself
 Remove `Legacy' or Temporary Rules and Routes
 Restrict the ability for the attacker to traverse the network east-west
 Transparent Service Chaining of Compensating Controls
 Add, change or remove controls without detection  Leverage real-time intelligence to automate this process
25

#RSAC
Orchestrating SDNs to disrupt APTs cont.
 Tap/Probe insertion during IR  Systematic Workload Provisioning
 Give the attacker a moving target to hit without disrupting the application
 Honey-Pots and Honey-Nets
26

#RSAC
Summary
 SDN is a key capability for introducing micro-segmentation and service chaining to facilitate dynamic response to APT attacks
 Security controls must offer API's for feeds and for automated response for incidents
 Apply the persistence of malware against the attack
 Security orchestration systems can automate policy updates to network and host-based security controls for faster and targeted APT responses
 SDN's enable us to optimize infrastructure and operational resource consumption for APT responses
27

#RSAC
Apply What You Have Learned Today
 Short Term  Evaluate how SDN can help you create fine-grained segmentation zones with lower operational costs
 Medium Term  Redefine your data center strategy for orchestration
 Threat Detection: malware, data loss, behavioral and IoC's  Vulnerability Management: assessment, prioritization and compensation  Automation: Controls with APIs, application level policies and context  Pilot Security Automation on SDN
 Long Term  Change the asymmetry of the APT attack
28

