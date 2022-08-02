SESSION ID: SPO3-T08
How to Apply a Zero-Trust Model to Cloud, Data and Identity
Nico Popp
Sr. VP of Information Protection Symantec
#RSAC

#RSAC
Cloud Security Status Quo Today: CASB

CASB

Rich SaaS visibility (logs, APIs & Gateway )

CASB as a comprehensive security platform

#RSAC
Challenge #1: Too Many Security Gateways
Web Gateway
Wild Web/Internet

CASB SDP

API SaaS
ESX IaaS / Private Cloud

#RSAC
CASB to Evolve: Gateways Convergence

Protect SaaS

Protect
1 Web Apps

Protect

2

Workloads/Dockers/ Serverless

3

Protect Legacy Corporate Apps

Web Security
Zero Trust Principles
SDP
Will Drive Convergence
SDP

#RSAC
So What is Zero Trust & Software Defined Perimeter
In a world of cloud and mobile, what is the next network security blueprint?
Web

SaaS

IaaS

Inside or outside the network?
Corp Network
The firewall is dead long live Zero Trust

#RSAC
Zero Trust: Where the Identity Puck is Going

User Device

Data Plane Access Tokens
ID Broker

IT Apps & Resources

o User: Authenticate the user o Device: Authenticate & verify (NAC) the device o Authorization: Least privilege access

#RSAC
Zero Trust: Where the Networking Puck is Going

Software Defined Perimeter

NAC
Control Plane

Network Gateway Data Plane
Secure Tunnel

IT Apps & Resources

Policy Engine

o Security Gateway: Obfuscation& protection o Software-defined: Separate control plane o Secure tunnels: Point to point (opaque in Google BC)

Symantec Point of View: "Beyond Corp"

Endpoint Protection
NAC

Web Security/ CASB Gateway

Threat & Data Protection

Anti Malware Sandbox Isolation DLP MFA

SDP Policy Engine

o Gateway: Born in the cloud o Tunnel: Not just secure, clean (content inspection) o Risk-assessment: Continuous & adaptive (CARTA)

#RSAC
Web SaaS Workloads On-Premise Apps

From "What" to "How"

Endpoint Protection

Cloud Gateway

TP & IP Services

SEP
(managed
devices)

NV AP CN

Data Plane

NORTON
(BYOD)

Peering
SDP WSS CASB
50+ POPs

o

AV (SEP)

o

p WeSbanIdsboolxa(ctyioninc)

e n

Isolation

p e n

Stream IQ

A

A

P

DLP+

P

I

VIP MFA

I

Content Inspection Hub (CAS-NG)

Policy

Policy

Control Plane Policy
Context

Identity as a Service

PROTECT: Continuous, Behavioral & Risk-based Policy Enforcement

DETECT: User, Device, App Behavior Analytics

SDP Connector
SDP Connector

#RSAC

Web Apps

o Endpoint Protection
(AV, EDR): Evolves as ZT

agent with NAC and VPN

capabilities

Corp

SaaS

o Web Gateways:

Unifies Web gateway

Corp Workloads

with SaaS (CASB Gatelet) and Corp Apps (SDP) gateways

Enterprise Apps

o CASB: Drives zero trust
policy definition across unified gateway (WSS-Gatelet-SDP)

#RSAC
Powerful Use Cases: DevOps PAM (North-South)

Endpoint Protection
NAC

Web Security/ CASB Gateway

Threat & Data Protection

Anti Malware Sandbox Isolation DLP MFA

SDP Policy Engine

Web
SaaS
Workloads On-Premise Apps

#RSAC
Powerful Use Cases: Micro-Segmentation (East-West)

Web
SaaS
Workloads On-Premise
Apps

Web Security/ CASB Gateway

Threat & Data Protection

Anti Malware Sandbox Isolation DLP MFA

Micro-Segmentation Policy Engine

Web
SaaS
Workloads On-Premise Apps

#RSAC
Powerful Use Cases: IOT Security (North-South)

Norton Core
NAC

Web Security/ CASB Gateway

Threat & Data Protection

Anti Malware Sandbox Isolation DLP MFA

SDP Policy Engine

Web
SaaS
Workloads On-Premise Apps

#RSAC
Whoever Wins, One Gateway Problem Remains:

BYOD

BYOD

Unmanaged Devices & External Users

#RSAC
Today's Gateway Approach

Managed Devices
Unmanaged Devices

Sanctioned Apps
Forward Proxy
Reverse Proxy

Unsanctioned Apps
Forward Proxy
N/A

Addresses a valid use case, but . . .
· Requires extensive URL rewriting · Limited number of apps supported

#RSAC
The Third Approach: Mirroring
No agent = any device No URL rewrite = any app

#RSAC
Crash Course: Web Isolation Technology

Transparent

Isolation Platform

User

Clientless

Render

Execute

Download

Rendering

100% safe visual stream

Web Documents

User gestures

Secure Disposable Container

Email

· Execute and render web sessions · Isolate both web and email,

remotely

including attachments

DEMO -
https://clicktime.symantec.com/3ShmeUujHa ikjjNRQeX6x5X7Vc?u=https%3A%2

#RSAC
Inline Coverage for Unmanaged Devices

Traditional Reverse Proxy

Mirror Gateway

+ Unlimited Apps Via Custom Gatelet

#RSAC
Conclusion: The Perimeter is Dead Long Live Cloud Defined Perimeter
CASB and SDP to Converge
­ Security access brokering for ALL cloud apps ­ Obfuscation (private cloud) ­ NAC (all clouds) ­ Content inspection: everywhere!
Mirror Proxy to Complement RP and FP
Inline, real-time access security brokering ­ ALL sanctioned cloud apps ­ ALL unmanaged devices

