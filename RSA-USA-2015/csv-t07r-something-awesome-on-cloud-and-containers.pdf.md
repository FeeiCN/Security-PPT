SESSION ID: CSV-T07R
Something Awesome on Cloud and Containers

Christofer Hoff
VP, Security CTO Juniper Networks @Beaker

Rich Mogull
Analyst and Chief Executive Officer Securosis, LLC @rmogull

#RSAC

#RSAC
Expanded Agenda
u Cloud in a nutshell u Software is eating (and digesting) the world... u Containers & why they matter u Applying this knowledge

PacketFilter

2

#RSAC
Cloud In a Nutshell

#RSAC
Security's Eternal Challenge

New Tools and Applications

Threats

PacketFilter

Technical Debt
4

#RSAC
The Problem

New Tools and Applications
PacketFilter

Cloud   +  
DevOps
5

#RSAC
The "Enterprise" vs the "Cloud" Models
u Cloud is an operational model u DevOps represents an operational framework u Both enjoy their own definitional perversion u Enterprises are adopting Cloud in various forms; Public/Private/Hybrid, IaaS/
PaaS/SaaS u The traditional silos and organizational dynamics of enterprises -- driven by
arbitrary economic models -- are having a rough time with "DevOps" u Why? Because people are conflating the differences in the operational
models with the need to adapt their frameworks for servicing it

PacketFilter

6

#RSAC
Physics Isn't Helping
u Velocity is static speed u Acceleration is the increase of velocity
over time u Cloud and DevOps are still
accelerating u We haven't hit terminal velocity, and
we can't predict when we will

PacketFilter

7

Control Deployment/Investment Focus

Network Centricity
User Centricity
Information Centricity Application Centricity
Host Centricity
PacketFilter

2008  --  2013
The Security Hamster Sine Wave of Pain
Security
Cloud
Time
8

#RSAC

Control Deployment/Investment Focus

Network Centricity
User Centricity
Information Centricity Application Centricity
Host Centricity
PacketFilter

20145
The Security Hamster Sine Wave of Pain
Containers DevOps
Time
9

#RSAC

#RSAC
Not Just for Unicorns Anymore
u Cloud, SaaS, PaaS, and IaaS, are becoming the norm
u Nearly all orgs we work with, from very large to small, are exploring public cloud deployments.
u These tend to be discreet projects.
u That quickly expand

PacketFilter

10

#RSAC
Natives vs. Tourists
u Cloud natives reap tremendous benefits in resiliency, economics, and agility.
u Cloud tourists deploy their existing operational models and frameworks onto a cloud service, losing most of the benefits of cloud.
u Typically due to lack of knowledge, institutional momentum, and arbitrary economic models.

PacketFilter

11

IT Deconstructed

Infostructure
Applistructure Metastructure Infrastructure

Content & Context - Data & Information
Apps & Widgets - Applications & Services
Glue & Guts -  IPAM, IAM, BGP, DNS, SSL, PKI & Abstraction layers
Sprockets & Moving Parts Compute, Network, Storage

PacketFilter

12

#RSAC

Cloud Provider Innovation

Infostructure
Applistructure Metastructure Infrastructure

Aurora, DynamoDB, DocumentDB, Elastic File System
Machine Learning, Kinesis, Scheduler, SQS, SNS, EMR
Config, Azure AD, Cloudformation, App Insights
Route53, ECS, Glacier, Traffic Manager, VPC, ELB

PacketFilter

13

#RSAC

Security as a Competitive Advantage

Infostructure

Cloud HSM, KMS, EKM, Key Vault

Applistructure Metastructure Infrastructure

API Management, Cognito
IAM, Cloudtrail, CloudWatch Alarms, MFA, SAML 2.0
PFS, Security Groups, ACLs, Default Encryption

PacketFilter

14

#RSAC

#RSAC
And this is how your vendors feel...

PacketFilter

(Your  the  ...)
15

#RSAC
Lockin
u Infrastructure is cloud provider table stakes
u Not that it doesn't matter (just try to choose a vLAN-based provider)
u The greatest opportunity for differentiation are in infostructure, metastructure, and especially, applistructure.
u No consistency across providers. No incentive for portability.
u However: APIs = interoperability

Agility

Applistructure

PacketFilter

16

#RSAC
The Security Challenge...
u If we don't have consistency in standards/formats for workloads & stack insertion, we're not going to have consistency in security
u Inconsistent policies, network topologies, and application service dependencies make security service, topology & device-specific
u Fundamentally, we need reusable and programmatic security design patterns; Controls today are CLI/GUI based
u Few are API-driven or feature capabilities for orchestration, provisioning as the workloads they protect

PacketFilter

17

#RSAC
What's Missing?
u Instrumentation that is inclusive of security u Intelligence and context shared between infrastructure and
applistructure layers u Maturity of "automation mechanics" and frameworks u Standard interfaces, precise syntactical representation of
elemental security constructs < We need the "EC2 API" of Security u An operational security methodology that ensures a common
understanding of outcomes & "DevOps" culture in general

PacketFilter

18

#RSAC
The Golden Rule of Cloud
If your security sucks now, you will be pleasantly surprised by the lack of change when you move to Cloud

PacketFilter

19

Software Is Eating 

#RSAC

(and Digesting) the World

#RSAC
Software Is Eating the World

u Software development is fundamentally disrupting the way companies operate and innovate
u Distributed scale-out application-centric architecture deployed via Platform-asa-Service atop Infrastructure-as-a-Service is driving agility, reducing TTM and expanding reach (i.e. Cloud)
u Not just about creating the same sorts of apps faster, but moving from monolithic applications and packaging, to decomposed microservices (apps as services comprised of collections of APIs) This is the new perimeter
u Open: source, standards, and APIs are now mission critical components
u Agile, CI/CD and DevOps are the operational manifestations of these models and frameworks

PacketFilter

21

Workload-Centric ELB
Web Node Node Node ASG

Node Node

App ASG

API Call Service (SQS)
RDS
SNS Notifications

Node Node Process ASG
PacketFilter

·No fixed servers.

#RSAC

·No fixed connections.

·Workloads scattered across IaaS and PaaS.

·All components elastic.
Ifothyptoeeruranadtetiriwtoyionotna·····opalHbFDIADelrifasoArerSrsespsMaaae/ewtpIkmt/PscsalWsisyeuoSl.elmcAsrnwtbuieFhbatrronyeerilbtetryamrakakeknsaot..dkod.el!
monitoring break.
22

#RSAC
Security Says: "ENGLISH...Do You Speak It!?"

 DART, Ceylon, GO, F#, OPA, Fantom, Zimbu, X10, Haxe, Chapel

 Python  Ruby  node.js

 Django, Pylons, Mojolicious
 CouchDB, Hadoop, Neo4J, MongoDB, Cassandra

 Erlang  Scala  Clojure  Groovy

The path of the righteous security man is beset on all sides by the inequities of the selfish and the tyranny of evil developers. Blessed is he who, in the name of scalability and good will, shepherds the weak through the valley of downtime darkness, for he is truly his brother's keeper and the finder of lost vulnerabilities. And I will strike down upon thee with great pwning vengeance and furious anger those who would attempt to poison and destroy my perimeter. And you will know My name is the Compliance Lord when I lay My stateful packet filtering vengeance upon thee.

PacketFilter

23

#RSAC
Developers Say: "CODE...Do You Write It!?"

PacketFilter

Say 'Python' again.

Say 'Python' again, I dare you, I double dare you...say `Python' one more time!

#!/usr/bin/python

for letter in 'Python':

# Could Have Lived This Way

print 'Current Letter :', letter

24

#RSAC
Microservices and Workload-Centric
u Workload runs on the most appropriate platform or infrastructure.
u PaaS vs. IaaS vs. SaaS irrelevant workload runs on best fit for the job.
u Workloads distribute based on real-time policies: performance, cost, capabilities.
u The smaller the service, the better the workload can adapt to the environment for performance and economic efficiency.

PacketFilter

25

#RSAC
Continuous Deployment Disrupts Operations

Source Code
Cloudformation Templates
Chef Recipes

Functional Tests NonFunctional Tests

Security Tests

Jenkins

Test

Git

Chef Server

Chef Server

Prod
Chef Server

PacketFilter

26

#RSAC
Don't Worry, Ops Feels the Same

PacketFilter

27

#RSAC
The Golden Rule of Continuous Deployment
If your security sucks now, you will be pleasantly surprised by the lack of change when you move to Continuous Delivery

PacketFilter

28

Containers & Why They

#RSAC

Matter

What are Containers? And LXC?

u "Containers" have existed in many forms for years: FreeBSD Jails, OpenVZ, Solaris Zones, and LXC for example.
u LXC (Linux Containers) is a userspace interface for the Linux kernel containment features to enable multiple isolated Linux processes to co-exist on a single Linux host
u "LXC containers are often considered as something in the middle between a chroot and a full fledged virtual machine. The goal  of LXC is to create an environment as close as possible to a  standard Linux installation but without the need for a separate kernel."
u This is enabled by the use of two Linux kernel process resource management solutions:
u Cgroups (control groups) are a resource management solution providing a generic process-grouping framework which limits and prioritizes system resources (CPU, memory, I/O, network, etc.)
u Namespaces allow for lightweight process virtualization and enables processes to have different views of the system (mnt, pid, net, pic, uts, user)

PacketFilter

30

#RSAC

#RSAC
Comparing Virtual Machines...

Virtual  Machine

App/Proc App/Proc App/Proc Bins/Libs Bins/Libs Bins/Libs Guest  OS Guest  OS Guest  OS
Hypervisor
Host  OperaCng  System
Hardware (Compute,  Networking,  Storage)

u Virtual Machines (VMs) are best used to emulate and allocate chunks of hardware resources.
u The isolation enabled by hypervisors generally represent less of an attack surface than exposing the entire host OS to the VMs themselves and provides an abstracted/protected layer
u In the case of a Type-1 hypervisor, there is no underlying host OS
u Each VM includes not only the application - which may be only 10s of MB - and the necessary binaries and libraries, but also an entire guest operating system - which may entail many gigabytes of storage and must be patched independently

PacketFilter

31

#RSAC
...and Containers?

Container

App/Proc Bins/Libs

App/Proc B

App/Proc C

Bins/Libs

Container  "Engine"
Host  OperaCng  System

Hardware (Compute,  Networking,  Storage)

PacketFilter

u Containers operate at the process level, which makes them very lightweight and perfect as a unit of software delivery.
u A container comprises just the application and its dependencies. It runs as an isolated process in userspace on the host operating system, sharing the kernel with other containers.
u Thus, it enjoys many of the resource isolation and allocation benefits of VMs but is much more portable and efficient.
32

#RSAC
So What Is Docker? [non-technical]

u Docker is an open platform for developers and sysadmins to build, ship, and run distributed applications.
u Consisting of Docker Engine, a portable, lightweight runtime and packaging tool, and Docker Hub, a cloud service for sharing applications and automating workflows, Docker enables apps to be quickly assembled from components and eliminates the friction between development, QA, and production environments.
u Docker is evolving into a platform that includes tools such as Machine, Swarm and Compose to enable simpler, integrated docker engine deployment, clustering, and distributed multiapplication orchestration

PacketFilter

33

#RSAC
What Is Docker [more technical]

u Docker is an open-source project written in Go, that automates the deployment of applications inside software containers, by providing an additional layer of abstraction and automation of operatingsystem-level virtualization on Linux.
u Docker implements a high-level API to provide lightweight containers that run processes in isolation, building on top of facilities provided by the Linux kernel (primarily cgroups and namespaces)
u A Docker container does not require or include a separate operating system. It relies on the kernel's functionality and uses resource isolation (CPU, memory, block I/O, network, etc.) and separate namespaces to isolate the application's view of the operating system.
u Docker accesses the Linux kernel's virtualization features either directly through the provided libcontainer library or indirectly via libvirt, LXC or systemd-nspawn.
u Libcontainer enables containers to manipulate Linux namespaces, control groups, capabilities, AppArmor security profiles, network interfaces and firewalling rules in a consistent and predictable way.


Execdriver

libcontainer systemd-- nspawn

lxc

libvirt

Linux   cgroups

netlink

namespaces

capabiliCes

selinux

neOilter

apparmor

PacketFilter

34

#RSAC
Are Containers "Secure?"
That  is  the  wrong   quesCon.

PacketFilter

35

So? TL;DR...
PacketFilter

#RSAC
u As you will see, to adequately secure environments that utilize containers, you will be required to know more about the internals and hardening of the underlying host OS to ensure the integrity and security of said platforms more than you might with a hypervisor and VMs.
u Or you should/can find a PaaS/Container management solution that includes security capabilities so you don't have to.
u Or you should/can just "give up" and run your containers within VMs...
36

#RSAC
4 Dimensions of Container Security

1. Underlying Host's Linux distribution kernel and its support for hardening, namespaces, cgroups and capability mapping including capabilities and what you do to harden the OS
2. The Container platform layer/engine & APIs: e.g. LXC or Libcontainer
3. Security of the access to the control plane of the host OS, the container engine, scheduler(s) and application deployment platform components
4. Security of the process(es) within the Container

Related: The grouping of containers into trust "zones" (logical/physical) and the networking capabilities to do so (i.e. br0 interfaces insufficient)

PacketFilter

37

#RSAC
But First, A Selfie...
Some Important Questions: 1. Do you run a Linux OS in production? 2. Do you allow developers to run processes atop Linux? 3. Do you allow multiple processes per host? 4. Do you allow processes running atop linux to do so as root? 5. Do you know what `setenforce 1' means and where you would implement it and why? 6. How do you define a security boundary?

PacketFilter

38

If the vessel isn't secure, how can the

#RSAC

containers be?

PacketFilter

39

"Containers Don't Contain" & "Tupperware

#RSAC

Don't Tupper"

u Run Docker Engine with AppArmor or SELinux atop a GRSEC kernel to provide containment where isolation is appropriately scoped
u Don't run untrusted processes with root privileges & enable user namespaces
u Map groups of mutually-trusted containers to separate machines; and
u If you really, really care about isolation and reducing attack surface, run containers in VMs or one container per machine...

PacketFilter

40

#RSAC
The Golden Rule of Containers
If your security sucks now, you will be pleasantly surprised by the lack of change when you move to Containers

PacketFilter

41

#RSAC
Applying This Knowledge

#RSAC
Apply Slide
u Return to your host-based security fundamentals that you thought you could get rid of because of Cloud...
...which you never did because you still have to armor your guest OS and apps anyway, right? Right!?
u Leverage DevOps and automation so that security is integrated (Cloud and Containers) into your least common denominator and per-unit of deployment (bare metal, VM, Container, Micro-service...)
u Don't try this sober.

PacketFilter

43

