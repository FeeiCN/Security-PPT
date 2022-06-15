SESSION ID: ASD-W03
Transforming Security: Containers, Virtualization and the Softwarization of Controls
#RSAC

Dennis R Moreau
Senior Engineering Architect VMware Office of the CTSO @DoctorMoreau

#RSAC
The Security Problem
Security breach rates and losses continue to outpace security spend in "the year of the breach".
IT Spend Security Spend Security Breaches
2

Complexity: Complex Attack Behavior

Overflows Insertion Malformation ...
dll injection SVC Vulns ROP ...
MMUs SMM UEFI Controllers Supply Chain...

Recon & Lateral Movement

Application OS
......
HW & FW

AAppppllicaattioin OpeornOaStin
g......
HW & FW

#RSAC
SaaS IaaS

#RSAC
Complexity: Many Required Security Controls
!
Source: SANS 20 Critical Cyber Controls ­ Fall 2014
https://www.sans.org/media/critical-security-controls/fall-2014-poster.pdf

#RSAC
Complexity: Many Security Control Standards
NIST 800-53, ISO 27002, NSA Top 10, GCHQ 10 Steps, PCI DSS, HIPAA, NERC, CSA, FISMA, ITIL KPIs, ...
https://www.sans.org/media/critical-security-controls/critical5-controls-poster-2016.pdf

#RSAC
Complexity: The Balkanization of Security

Rules, Lang & Logic

SNORT, FW 5-tuples, OWASP, YARA, XACML...

DB, App, OS, NAT, LB, L4, L3 ...

Placement Constraints

Security Controls

Control Boundary

End Point, Network, VLAN, Domain, Process, OU ...

Consoles Logs, Alerts, Rules, Workflow...

Consoles Agents

Object Type

User, Application, Data Class, Service, DB...

#RSAC
Complexity: No Finish Line

Growth Scale Agility++
Control Technology

New Bus. Need

New Regulation

New Threats

Evolving Standards

Change!

New Governance

#RSAC
Complexity: IT Architecture

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

FW IPS

Highly Connected Complex Service Protocols EP controls with weak isolation NW controls with weak context EP <-> NW mismatch

#RSAC
Complexity is the Problem!
Misconfiguration is very common (Gartner: 95%* of FW breaches attributable to misconfiguration)
*Gartner, Inc. "One Brand of Firewall Is a Best Practice for Most Enterprises". November 28, 2012.
*Gartner, Inc. " ...75 Percent of Mobile Security Breaches Will Be the Result of Mobile Application Misconfiguration" http://www.gartner.com/newsroom/id/2846017
We need architecturally simplified security provisioning, operation, response and analytics.

#RSAC
Virtualization and the Softwarization of Security Controls: Enabling Policy Simplification
10

#RSAC
Visibility: Micro-segmentation and SW
· Understand Traffic · Here, > 80% is East-West · Largely uninspected and
unprotected · Ops: Clearly not optimized
Source: Networking data from Arkin.net deployments

#RSAC
Containment & Protection

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

V

V

M

M

M

M

...

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

FW

Enabled by:

FW

Network Virtualization

IPS

IPS

#RSAC
Network Virtualization

Guest

vSwitch

Compute Isolation Network Isolation
V Network Ctrl
IP Address Space Routing Firewall ...
V Server Ctrl
Provisioning Protection Introspection ...

vSwitch

Guest

#RSAC
Network Virtualization: Overlays

VM

VM

VM

VM

VM

VM

VM

VM

Controller
L2

L2 IP

Payload

Overlays

L2 IP
L2
L2 L2

TenPanatyBload

IP

PTeanyalnotaCd

L2 L2

L2
L2
L2

Transport Network
L2 IP UDP VXLAN L2 IP

Payload

#RSAC
Micro-segments: A new policy primitive
Guest vSwitch

Guest
Aligned Isolation: · Routing · NAT · dFW

vSwitch
App/Svc Segment

vSwitch

Guest

Policy Boundary Invariant

#RSAC
Simplify: Smaller more aligned policy

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

dFW

dFW

dFW

dFW

Policy --------------------...--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

eFW

Policy ---...-----------------------------------------------

Policy ----...--------------------------------------------------------

 Much smaller policy sets  Much more coherent policy

Policy ---...-----------------------------------------------

Policy ---...-----------------------------------------------

eFW

Policy ---...-----------------------------------------------

Policy here crosses many

Policy here can align on

apps ... App1 ­ App4

one App/Svc

#RSAC
Simplify: Change with less side effect

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

FW

FW

FW

FW

Policy --------------------...--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

FW

Policy ---...-----------------------------------------------

Policy ----...--------------------------------------------------------

Policy ---...-----------------------------------------------

Policy

 Much simpler mitigation  Much safer rule deletion

---...-----------------------------------------------

FW

Policy ---...-----------------------------------------------

Policy change here is coupled

Policy change here is far safer

across apps

#RSAC
Simplify: Policy that follows the workload

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

App1

V

V

M

M

V

V

M

M

dFW

App2

V

V

M

M

V

V

M

M

dFW

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

...

dFW

V

V

M

M

dFW

eFW

 Protection scales with hypervisors eFW

Only traffic steering determines protection/visibility

Classification (SG) determines protection & visibility

Simplify: Default deny posture

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

App1

V

V

M

M

V

V

M

M

dFW

App2

V

V

M

M

V

V

M

M

dFW

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

...

dFW

V

V

M

M

dFW

#RSAC

eFW  Recon and lateral in the DC

eFW

is much more visible and difficult

Default deny policy here is blunt, Default deny policy here is precise,

coupled across apps, partial and efficient, scale-able, ...

weakly scale-able

#RSAC
Simplify: Intrinsic E/W visibility/control

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

App1

V

V

M

M

V

V

M

M

dFW

App2

V

V

M

M

V

V

M

M

dFW

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

...

dFW

V

V

M

M

dFW

eFW

 Complete E/W visibility & control

eFW

 No hairpin management

E/W traffic hair-pinned for visibility at the DC edge

All E/W traffic is visible and filtered according to policy

Control Placement and Segments

App1

V

V

M

M

V

V

M

M

App2

V

V

M

M

V

V

M

M

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

V

V

M

M

...

App1

V

V

M

M

V

V

M

M

FW

App2

V

V

M

M

V

V

M

M

FW

App3

V

V

M

M

App4

V

V

M

M

V

V

M

M

...

FW

V

V

M

M

FW

SC

SC

SC

SC

FW Enabled by:

FW

Network Virtualization +

SC Sofwarization of Security Controls

SC

#RSAC

#RSAC
Virtualization and the Softwarization of Security Controls: Improved Alignment
22

#RSAC
Align: NW/EP Control Aligned on Segments

EP Identifiers EP Boundaries

App1

EPV

EPV

M

M

EPV

EPV

M

M



EP Policy(Asset, HostID, SID, Svr Role, TPM...)

EP Identifiers EP Boundaries

App2

EPV

EPV

M

M

EPV

EPV

M

M

App3

EP EPV

EPV

M

M

App4

EPV

EPV

M

M

EPV

EPV

M

M

EPV

EPV

M

M

...

App1 App2

EPV

EPEV PV

EPV

M

MM

M

EPV EPEVPV

EPV

M

MM

M

FW

FW

App3

EP EPV

EPV

M

M

App4

EPV

EPV

M

M

EPV EP V

M

M

EP V

EPV

M

M

...

FW

FW

MS

VMID MSID


App Seg

IPS

IPS

IPS

IPS



NW Identifiers NW Boundaries

FW
NW
IPS

FW NW P1(MSID)

...

NW Identifiers

NW Boundaries

IPS NW PN(MSID)

NW Policy(IF, Subnet, DHCP Scope, ...)

#RSAC
Align: Coordinated Controls

Segment

OWASP Rules

dFW

WAF

Detect Here
Expensive detection, so ...

Then ...

FW Rules vFW
Block Here

24

#RSAC
Align: Coordinated Controls

Observed Anomaly

Segment

OWASP Rules

dFW

WAF

SNORT Rules IPS

FW Rules vFW

Emergent Vulnerability
25

Rule N+1 Rule N+2 ...

Align: Controls Context

Visibility & Semantics
here ...

... depends on policy and filtering
here

Segment

Access Rules
dFW

OWASP Rules
WAF

SNORT Rules
IPS

Protocol Defn
AA

FW Rules
vFW

Resultant Protection Policy Order Matters: So topological context is required for many security use cases.
26

#RSAC

#RSAC
Containers and Operationally Plausible Default Deny Policy
27

#RSAC
Sources of Plausible Micro-segment Policy
1. Provenance, Manifests & Provisioning Information 2. Application Network Behavior 3. Infrastructure Services (or Micro-services) Connectivity &
Dynamics

#RSAC
Containers: App/Svc Focused Context

Ex. Authoritative Context
App Configuration & Resources Resource Sharing Across Apps Colocation of Containers Service Components

Example Contextual Structure

Namespace

RC Pod Container
App Env App

Pod

Container

...

App Env

App

Services within a Namespace
Network Dynamics (LB, HA, ...)
29

VVoolulummee

SSeervrivciece LB

#RSAC
Containers: EP Compliance
Compliance scan of Docker image Usage: docker-oscap image IMAGE_NAME [OSCAP_ARGUMENTS]
Compliance scan of Docker container Usage: docker-oscap container CONTAINER_NAME [OSCAP_ARGUMENTS]
"Vulnerability scan of Docker image" Usage: docker\-oscap image\-cve IMAGE_NAME [--results oval-results-
file.xml [--report report.html]] "Vulnerability scap of Docker container"
Usage: oscap-docker container-cve CONTAINER_NAME [--results ovalresults-file.xml [--report report.html]] Ref: https://github.com/OpenSCAP/container-compliance
30

#RSAC
Alignment: Network Context

Control placement determines: · Meaning of Log and Alert signals · Up/Down stream interference · Affected assets · Mitigation options

Hosted Protection
Premise Protection

LB

Web Service

SAP MT

SVC

SVC

Web Cont Web Cart

SAP

SVC

SVC

SVC

SVC

DB

DB

#RSAC
But "containers don't contain"

App 1

App 2

App 2

Bins/Libs Bins/Libs Bins/Libs Shared: IDs, filesystem, services, resources ...

Audit:  ---- ---- ----

Process/Namespace Isolation

Docker Engine Operating System instance Process and Name Space Isolation

Audit:  ---- ---- ----

Tenant

Tenant Provider

Tenant

Attest:  ---- ---- -----

... but could be much better
Better Isolation Isolated Controls (independent) Mature Security Mgmt (Gartner) Normalized Policy Locus
Between WL and Hosting (hybrid/multi-cloud)

Mis-alignment

https://opensource.com/business/14/7/docker-security-selinux http://www.projectatomic.io/blog/2014/09/yet-another-reason-containers-don-t-contain-kernel-keyrings/
32 http://blog.docker.com/2014/06/docker-container-breakout-proof-of-concept-exploit/
Gartner: Security Properties of Containers Managed by Docker

#RSAC
Directional: Containers + Virtualization

Registry

Labels, Provenance,
Testing

Policy

FW (app) IPS (app) WAF (app) NGFW (app) ...

Docker Daemon

Images

Containers

More actionable context, so response is more efficient & accurate, reduced dwell time

Same App IDs Same Boundaries Shared Context ... Aligned:
Apps Server Network

WAF IPS NGFW FW

Logs Alerts Behavior

Analytics

Where else might this behavior be expressed?...

Containers + Virtualization

App 1

App 2

App 2

Bins/Libs vSwitch

Bins/Libs vSwitch Docker Engine

Bins/Libs vSwitch

Operating System instance VM vServer & vSwitch

Audit:  ---- ----Au-d--i-t:
 ----A-u-d--i-t: ---------
 ---- ----

#RSAC
Consistent boundary X Stack Same identifier (msid, vmid) Alignment ... in any state Independent verification Authoritative context (OOB)

Tenant

Tenant Provider

Tenant

Attest:  ---- ---- -----

Control Boundary & Controls Alignment

VMworld 2015: NET6639 - Next Horizon for Cloud Networking and Security:
https://www.youtube.com/watch?v=RBJ-KoA3M4 -OQ&feature=youtu.be

#RSAC
Application Blueprint Example - vRealize
Application structure and external connectivity are completely exposed to inform operationally plausible security policy
35

#RSAC
Enterprise Infrastructure & Containers

Infrastructural Context
Leveraging of PBS, PBN, Infrastructural Services
Legacy apps to cloud native apps, on the same infrastructure
Integration of governance, CJA, context (for logs, alerts, response RCA, ...)

MESOS

Create Kubernetes Cluster

Create Get pods
Kubernetes

Photon Cont 1 Photon Cont 2 Photon Cont 3

Photon OS ESX

Photon OS ESX
...

Photon OS ESX

Photon Machine

36

#RSAC
App Behavior Analysis: Arkin Example
Insight into application network behavior drives 1st order operationally plausible default deny posture.
37

#RSAC
Container
Intrinsically Captures Application Structure, Provenance, and Classification (pre-launch) Always Current Configuration (immutability)
No "intended" vs. "actual" gap Operations & Security perspectives
Immutability accommodates "moving target" defense techniques Expose implicit network requirements in App context context. Expose implicit app deployment requirements
Level of req'd awareness of virtual network topology Req'd SVCs
38

#RSAC
Refining Micro-Segmentation Using Analytics
39

#RSAC
Sources of Plausible Micro-segment Policy
1. Provenance, Manifests & Provisioning Information 2. Application Network Behavior 3. Infrastructure Services (or Micro-services) Connectivity &
Dynamics

#RSAC
Micro-Segmentation: Model & Secure
· Model apps, app tiers, regulatory scopes, network, org boundaries, etc.
· Default Deny: Only allow what's necessary, Deny everything else.
Source: Arkin.net Screenshot

#RSAC
Micro-Segmentation in Action: Modeling Security Groups
Segment by applications, app tiers, security zones, L2/L3 network boundaries, virtualphysical boundaries, organizational levels, etc
Source: Arkin.net Screenshot

#RSAC
Micro-Segmentation in Action: Modeling Security Policies

Source: Arkin.net Screenshot

Inter and Intra Segment (VM to VM) Communication
Some services require internet access. Allowed access to shared services
"Deny All" to these segments (...and confirm it)

#RSAC
Micro-Segmentation in Action: Validate Compliance
Runtime Effective Policy between any two points in the Datacenter
Source: Arkin.net Screenshot

#RSAC
Summary
45

#RSAC
Summary
Complexity is at the heart of today's security challenge Virtualization and Softwarization allows app focused placement and policy alignment Containerization provides the essential context for realizing an operationally plausible default deny policy This resulting in transformationally simpler policy and more effective protection.
46

#RSAC
Apply: Assess
When you return to work: Evaluate your current policy complexity
Policy set size Policy testing workflow
Estimate its effect on security policy management
Latency in security policy updates Estimate the degree of your "default deny" posture Identify related instances of policy misconfiguration
47

#RSAC
Apply: Dev Ops
As move forward in DevOps: For selected applications determine
Operationally plausible default deny posture by observed logs Application policy requirements from container blueprints/manifests Application component dynamics: continuity, scaling, ...
For important and cross application cutting services
Document discovery, election, failover, ... protocol dynamics
48

#RSAC
Apply: Plausible Micro-segment Policy
Plausible Policy Information Sources 1. Provenance, Manifests & Provisioning Information 2. Application Network Behavior 3. Infrastructure Services (or Micro-services) Connectivity &
Dynamics

#RSAC
Thank You! Questions? Dennis R Moreau: dmoreau@vmware.com

