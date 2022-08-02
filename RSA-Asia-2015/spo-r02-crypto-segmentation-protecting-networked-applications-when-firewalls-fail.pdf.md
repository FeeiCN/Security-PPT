SESSION ID: SPO-R02
Crypto-Segmentation: Protecting Networked Applications When Firewalls Fail

Satyam Tyagi
Chief Technology Officer Certes Networks CertesNetworks.com @CertesNetworks

Adam Boone
Chief Marketing Officer Certes Networks CertesNetworks.com @CertesNetworks

#RSAC

#RSAC
They are already inside ... we just have not found them
2

#RSAC
Security Crisis: Outdated Architecture

Borderless Enterprises
Apps digitized, extended outside
firewall, rise of Shadow IT

Firewalls Fail
Access for working = access for hacking

SSL#2

SSL#1 VLAN#1
"Trusted" Network No encryption

ACL#1

Access Attacks

Segmentation Chaos
SSL, TLS, IPsec, VPN, DMZs, VLANs, ACLs Performance hits Gaps & trade-offs

SSL#3

IPsec

SSL#4

HTTPS

No encryption

33

#RSAC
Impact: Data Breach Crisis
 In 60% of cases, attacker compromise organization in minutes
 75% of attacks spread from Victim 0 to Victim 1 within one day (24 hours)
 Breach discovery is days or weeks
4

#RSAC
The "Post-Trust" World
 No internal network can be fully trusted  No user can be fully trusted  Assume the breach has already happened  Architecture based solely on perimeter security (firewalls, IDS/IPS) to keep
the bad guys out is obsolete  Common strategy is to use network segmentation
5

#RSAC
The Dirty Secret of Network Segmentation
December 2014 global IT manager survey
(Spiceworks) No LAN CryptoSegmentation
Problem: Segmentation of traffic is tied to network infrastructure; disconnected from business rules
66

#RSAC
Segmentation Chaos: Fragmentation
Attempting to isolate traffic hop by hop, app by app Consumer grade encryption, out of your control VLANs, ACLs, VPNs, IPsec, SSL, TLS, DMZs
77

#RSAC
Segmentation Chaos: Too Many Tools

Where are VLANs defined and enforced?
Are they encrypted?

Sensitive Record App

Other Network App

SSL SSL SSL

SSL
HQ Data Center

SSL
Patient Record App

VLAN 1
VLAN 2
LAN

How many of the apps have their own embedded encryption? Who controls it? What's in it?
Do they contain Heartbleed?

How are WAN links encrypted? Who controls keys?
How are they managed?

DR Backup

VLAN 1

VLAN 2
LAN

MPLS Label1

WAN

MPLS Label2

Hospital

SSL

VPN

Internet

Doctor's office

HTTPS Physician's smartphone

Siloed

How are apps encrypted to mobile devices?

Fragmented

Is it enterprise grade encryption? Who controls keys and algorithms?

Gaps

88

Epic Segmentation Fail

3. PoS Malware
PoS System

Billing System

4. Exf Malware
Other Systems

IDS Monitoring

3. PoS Malware PoS
3. PoS Malware

5. Dump CC
Retailer Network

6. Exfiltrate CC
InteVPrnNeAtccess
FW/VPN

PoS

3. PoS Malware
PoS

Exfiltration

9

Server

#RSAC

Attack Steps 1 Phishing Steals Password 2 VPN established across
Internet 3 Malware Installed on PoS
4 Malware Installed 5 Dump CC data 6 CC Exfiltrated
Contractor Network

VPN: Protection Failed Weak password security Anywhere across Internet
No segregation of PoS and Billing No segregation No segregatio9n VPN: no restriction on outbound connectivity
Contractor

Steal Password Attacker

#RSAC
Back to the Drawing Board
10

#RSAC
What is Security? (Orange Book)
 Policy: Rules of Security  Accountability: Identity and Authorization  Assurance: Cannot be bypassed
Objective: Move IT security away from the infrastructure and closer to the business rules
11

#RSAC
A New Blueprint
12

#RSAC
What Is Crypto-Segmentation?
Role-based access to cryptographically isolated networked applications  Crypto-segments defined per application based on
business rules  User roles and business policy determine access
rights based on verified identity  Maintain complete control of keys and key lifecycle  Centralizes audit logging for all access  Compromise of network, application, user does not
compromise crypto-segments: no lateral movement
13

Crypto-Segmentation Architecture

Sales

Enterprise Directory

Admin

App Crypto-Segments CRM App Billing App

Users and Roles
Policy Orchestrator

Policies & Keys

Policy Enforcer

Sales

VPN VPN

Admin

Policy Enforcer
14

Policy Enforcer

#RSAC

#RSAC
Security Evolved
 Cryptographically assured segmentation
 Compromises in one segment can not propagate to another segment
 Strong user identity and role enforcement  End-to-end security with no network dependency  Security team in control
 Keys, policies, auditing: orchestrated across all apps, users, networks
15

Crypto-Segmentation in Action

#RSAC

3. Stop 3. PoS
PoS Malware System

Billing System

Enc

Enc

4. Stop 4. Exf Other Malware Systems
Enc

IDS Monitoring

Crypto-Segmentation · Per-app flow · Per-user multi-factor

3. PoS Malware

PoS

5.

DuRmeptCaCiler

Enc

5.

Network

3. PoS

Stop

6. Exfiltrate CC
6.
Stop Internet

access control
Contractor Network

Contractor Enc

Malware

PoS

PoS

3. PoS Malware

Exfiltration Server

2. Stop

Steal Password
1. Stop

Attacker

1166

#RSAC
Summary: Question the status quo
 What are your business-driven security requirements?  What happens when they change?  Does your current network security architecture help or hinder?  How does it hold in the new realities of BYOD, mobile, public
cloud, SaaS?  What happens when a breach takes place?
17

#RSAC
Apply Crypto-Segmentation
 Make a list of your current applications  Prioritize most sensitive  Which user roles need access when and where?  Crypto-segment along these dimensions  Make Business needs drive security, not security risk drive business practices
 I cannot secure this, it will not be on your mobile
18

Thank you

Satyam Tyagi, CTO, satyam.tyagi@certesnetworks.com

#RSAC

Adam Boone, CMO, adam.boone@certesnetworks.com

CertesNetworks.com

19

