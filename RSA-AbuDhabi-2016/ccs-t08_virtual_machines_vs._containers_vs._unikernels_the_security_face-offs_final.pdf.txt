SESSION ID: CCS-T08
Virtual Machines vs. Containers vs. Unikernels: The Security Face-Offs
#RSAC

Samir Saklikar
Technical Lead, Office of the CTO, Security Group, Cisco

#RSAC
Agenda
Workload Execution Environments
Virtualization, Containers, Unikernels
A Security Requirements Template Built-In Security Defenses of Workload Execution Units Applying Higher Level Security Policy to Workloads Apply
2

#RSAC
What are we working with?
Heterogeneous Multi Form-Factor Workload Execution Units

Virtual Machines

App

App

Operating System
Virtualized Hardware

App

App

Operating System
Virtualized Hardware

App

App

Operating System
Virtualized Hardware

Hypervisor
Operating System
Physical Hardware

4

#RSAC

Containers

App

App

App

App

App

App

Binary and Libraries

Binary and Libraries

Host Operating System

Physical Hardware

5

#RSAC

#RSAC
Containers within VMs (for Tenant Isolation)

App

App

App

App

App

App

Binary and Libraries

Binary and Libraries

Guest OS

Guest OS

Hypervisor
Operating System

Physical Hardware

6

Unikernels (Specialized Kernel)

App App

Minimal Binaries/Libraries

Minimal Binaries/Libraries

Minimal Kernel
Hypervisor
Operating System

Minimal Kernel

Physical Hardware

7

#RSAC

#RSAC
What do we want ?
Our Security Requirements

#RSAC
What is "Security" for Workloads?

Protect one-self?

"Well-Behaved" applications?

Policy Compliance

Defense against Attacks?
9

#RSAC
"Whole is Greater than Sum of its Parts"

Built-In Standalone Defense Mechanisms
10

Orchestrated Security Defense Mechanisms

#RSAC
Built-In Standalone Defense Mechanisms
Software Hardening
Security Audits, Security Upgrades
Strong Root of Trust Granular Access Control Model Easy Composability
11

#RSAC
Orchestrated Security Defense
Driven by a higher level Operational Policy
Business Rule, Compliance Policy, Reactive Action
Collaborative Defense with real-time Intelligence Sharing Unified Management across hybrid deployments Full Stack Visibility and Behavioral Analytics Easy Re-Composability
12

A Security Requirements Template
Hardened Workload Execution Environment

Smaller Footprint, Better Security Audit and Hardening

Built-in Protection, Access Control, Permissions, Capabilities
Workload Isolation, Firewalls, Access Control

Workload Security Life Cycle

Data Protection, Encryption, Access Control

Federated Access, Secure Cloud Deployments
13

#RSAC
Business-Centric Identity and Rights Management
Operational Policy, Compliance Rules
Unified Management, Auditing, Remediation Plans

#RSAC
Built-In Security Defenses
Fundamental Security Capabilities of Workload Environments

#RSAC
VM Security (aka Hypervisor Security)

Execution Isolation

Devices Emulation & Access Control

Privileged Operations

Management

Security Audit & Hardening

Hardware Assisted Virtualization
15

Granular Access Control

Secure Trusted Boot

#RSAC
Hypervisor Security (cont.)
Other Recommendations...
Configuration Versioning with Rollbacks Regular Security Updates and Patches Secure Configuration of Built-in Firewall Segregating VM Management and Hypervisor Host and VM Traffic
More at NIST Publication - "Security Recommendations for Hypervisor Deployment"
16

#RSAC
Container Security

Execution Isolation

Privileged Operations

Management

Reduced Attack Surface

Security Audit & Hardening

Granular Access Control

Vulnerability Management

17

Nuts & Bolts: Linux Namespaces

Parent
1

Container

2

13

24

53

PID Namespaces

Global Net Namespace
Container Net Namespace
Container Net Namespace
Network Namespaces

/disk /disk /disk
Mount Namespaces

#RSAC
IPC1 IPC1 IPC1
IPC Namespaces

18

Linux Cgroups & Capabilities
https://mairin.wordpress.com/2011/05/13/ideas-for-a-cgroups-ui/
19

#RSAC

Total Capabilities

c4

c1 c2

c5 c9

c3

c6

c18

c11

c15

c7 c8

c14 c10

c16 c12

c13

c17

Container Capabilities

#RSAC
SELinux
Ref - http://blog.linuxgrrl.com/2014/04/16/the-selinux-coloring-book/
20

#RSAC
Security Defense Orchestration
Mapping Higher Level Operational Policies to Security Primitives

Importance of An Operational Policy
Hardened Workload Execution Environment

Smaller Footprint, Better Security Audit and Hardening

Built-in Protection, Access Control, Permissions, Capabilities
Workload Isolation, Firewalls, Access Control

Workload Security Life Cycle

Data Protection, Encryption, Access Control

Federated Access, Secure Cloud Deployments
22

#RSAC
Business-Centric Identity and Rights Management
Operational Policy, Compliance Rules
Unified Management, Auditing, Remediation Plans

#RSAC
Inspiration from Policy Defined Networking
Policy Driven Application Composition Promise-Theory Driven Security is Implicit ­ Zero Trust Model Multi-Level Policy Formats derived from higher level Policy
23

Building a Policy Format...

A Logical Collection of Workload Units driven by a common policy requirement
Endpoint Group - 1

Contract

VM1 Container1 UniKernel
VM2 Container2

Endpoint Group - 2

Filter, Action, Label
Filter, Action, Label
Allow, Deny, Mark

VM1 Container1 UniKernel
VM2 Container2
24

#RSAC

... with pluggable Extensibility.

A Logical Collection of Workload Units driven by a common policy requirement
Endpoint Group - 1
VM1 Container1 UniKernel
VM2 Container2

Contract Service Graph Insertion
Endpoint Group - 2

VM1 Container1 UniKernel
VM2 Container2
25

Intrusion Detection
Data Protection
Traffic Encryption
. . .

#RSAC

#RSAC
Operationalizing the Security Policy
Contract

SDN Controller
Virtual Machines

Docker Engine Plugin
Containers

Unified Controller
Virtual Machines Containers

26

#RSAC
Apply What You Have Learned Today
Next Week you should: Understand Built-In Security Capabilities of your Workload Environments Verify your Container environment is making right use of Linux Namespaces, cgroups and SELinux.
In three months, you should: Identify your high-level Operational Policy Set and check if and how it is enforced on your workloads Identify the best workload unit composition (VM, Container etc.) for the type of your workloads Verify and Setup a Software Patch and Upgrade policy for your workload units
In six months, you should: Setup a mechanism to operationalize your high-level business policy uniformly across different workload environments
27

#RSAC
Thanks & Questions
Email ­ ssaklika@cisco.com

