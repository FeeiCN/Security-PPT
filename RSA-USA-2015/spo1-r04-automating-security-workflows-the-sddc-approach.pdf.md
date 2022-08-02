SESSION ID: SPO1-R04
Automating Security Workflows: The SDDC Approach

Josh Soto
Product Marketing Manager VMware

Catherine Fan
Product Line Manager VMware

#RSAC

#RSAC
Impressive rates of change

Compute Virtualization

Rate of Change

2000

2002

First year this event was named "RSA Conference"

2008

2009

2010

2011

2012

2015

#RSAC
The pressure on security
New App Requested
Provision VM

Provision Network

Policies are Set

Security Services Configured

Security Mapped to Network

App Deployed

Change Happens

Change is inevitable

DAY

1

Data Center

DAY 2

Perimeter Firewall

Finance Application DMZ/Web App

SQL database server provision request
Database policy assumptions are: · No confidential information · No personal privacy information · Vanilla DB policies

Sensitive data is added to the new database VM
No55w5-w55h-5a5t5?5

DB

#RSAC

#RSAC
Ideally, every app would have dedicated resources

#RSAC
Manageability necessitates grouping
Security Zones
VLANS
192.168.10.4 192.168.10.12 192.168.20.6 192.168.20.11 ...

Today, security is tied to a complex and rigid #RSAC network topology

And further complicated with three tier, consolidated application infrastructure
Web App DB

#RSAC
All of this results in a universal loss

Strain on Business
Missed Business Opportunities
Inability to adapt to market changes

Strain on Security
Security Compromises
Slow response to threats and changes

#RSAC
"We cannot solve our problems with the same way of thinking that created them."
-Albert Einstein

What's needed: a new architectural approach

Software-Defined Data Center
Applications

Virtual Machines

Virtual Networks

Data Center Virtualization

Compute Capacity

Network Capacity

Location Independence

Virtual Storage
Storage Capacity

The next-generation networking model

Software Hardware

Network and Security Services Now in the Hypervisor

Load Balancing

L3 Routing

L2 Switching

Firewalling/ACLs

Visibility
NSX is uniquely positioned to see everything

Granular control becomes possible

NSX

Built-in Services

Firewall

Data Security

Server Activity Monitoring

VPN (IPSEC, SSL)

Third-party Services

Antivirus
Security Policy Management

Next Gen Firewall
Vulnerability Management

Intrusion Prevention
Identity and Access Mgmt

...and more in progress

Intelligent grouping
Web App DB
Finance

Engineering

#RSAC
Intelligent grouping
Groups defined by customized criteria

Operating System

Machine Name

Services

Application Tier

Regulatory Requirements

Security Posture

#RSAC
Use case: intelligent grouping for unsupported operating systems
OS no longer supported on several systems These systems need policy which restricts access to only email servers
Unsupported OS Group

#RSAC
Policy and services assigned to groups
Apply Repeatedly

Define Once
· Define Policy · Assign Services · Automate Response

Web

App

DB

HR

#RSAC
Consistent policy and services
HR
+

Adaptable and proactive security
UNIQUE POLICY DEFINITIONS
Policy and services defined with future changes in mind
Vulnerability scan. If vulnerability found, tag workload with CVE Score.

#RSAC
UNIQUE POLICY DEFINITIONS Remediate changes with preset policy definitions If tagged, remediate with IPS.

Automated Security in a Software Defined Data Center

UNIQUE POLICY DEFINITIONS
Policy & services defined with future changes in mind
Scan to ensure no private information is stored. If found, tag.

SN# 555-55-5555

#RSAC
UNIQUE POLICY DEFINITIONS Remediate changes with preset policy definitions
If tagged, move workload to more secure PII group.

#RSAC
Summary

SDDC with NSX is fundamentally a more effective security solution

Removing grouping decisions from the network topology enables intelligent security decisions

NSX equips security teams with the ability to automate and adapt to changes

#RSAC
Learn more
 Visit the VMware booth: South Hall (#1315)  Learn more about network virtualization and micro-segmentation:
http://www.vmware.com/go/nsx

Thank you

Josh Soto

jsoto@vmware.com

Catherine Fan cfan@vmware.com

#RSAC

