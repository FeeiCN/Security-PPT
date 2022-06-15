SESSION ID:

CSV-R02

Kubernetes Runtime Security

Jen Tong
Security Advocate, Google

#RSAC

#RSAC
About me
Jen Tong Security Advocate Google Cloud Platform
@MimmingCodes mimming.com
2

#RSAC
How many of you...
3

#RSAC
How many of you...
...are familiar with the NIST cybersecurity framework?
4

#RSAC
How many of you...
...are familiar with the NIST cybersecurity framework? ...run containers in production?
5

#RSAC
How many of you...
...are familiar with the NIST cybersecurity framework? ...run containers in production? ...monitor containers for security issues?
6

#RSAC
Agenda
Container security overview Containers differ from VMs How to detect bad things at runtime Demo
7

Container security overview

#RSAC
Kubernetes is so new that lots of practitioners don't know what security controls come with it.
So one of the first things to do is study up on what controls are there and use them to strengthen your security posture
­ Chenxi Wang, Jane Bond Project
9

#RSAC
Story time...

#RSAC
Story time...

#RSAC
Story time...

#RSAC
Story time...

#RSAC
Threat grouping

Infrastructure

Software supply chain

Runtime

#RSAC
Threat grouping

Infrastructure
! Kubernetes API compromise
! Privilege escalation ! Credential
compromise

Software supply chain

Runtime

#RSAC
Threat grouping

Infrastructure
! Kubernetes API compromise
! Privilege escalation ! Credential
compromise

Software supply chain
! Unpatched vulnerability
! Supply chain vulnerability

Runtime

#RSAC
Threat grouping

Infrastructure
! Kubernetes API compromise
! Privilege escalation ! Credential
compromise

Software supply chain
! Unpatched vulnerability
! Supply chain vulnerability

Runtime
! DDoS ! Node compromise ! Container escape ! Zero day

#RSAC
Threat grouping

Infrastructure
! Kubernetes API compromise
! Privilege escalation ! Credential
compromise

Software supply chain
! Unpatched vulnerability
! Supply chain vulnerability

Runtime
! DDoS ! Node compromise ! Container escape ! Zero day

VMs vs Containers

#RSAC
Virtual machine

VM App Bins/libs Guest OS

VM App Bins/libs Guest OS

Hypervisor

Host OS

Hardware

20

Virtual machine

vs

#RSAC
Container

VM App Bins/libs Guest OS

VM App Bins/libs Guest OS

Hypervisor

Host OS

Hardware

21

App

App

App

Bins/libs

Bins/ libs

Container Runtime

Host OS

Hardware

#RSAC
Containers are dynamic
22

#RSAC
Containers are dynamic
23

#RSAC
Containers are dynamic
24

#RSAC
Containers are dynamic

Security implications

Attack surface

Better
Minimalist host OS limits the surface of attack

#RSAC
Worse
Hypervisors are a strong security boundary

#RSAC
Security implications

Attack surface
Resource isolation

Better
Minimalist host OS limits the surface of attack
Host resources are separated using namespaces and cgroups

Worse
Hypervisors are a strong security boundary
Host resources are not all well separated

#RSAC
Security implications

Attack surface
Resource isolation
Root permissions

Better

Worse

Minimalist host OS limits the surface of attack

Hypervisors are a strong security boundary

Host resources are separated using namespaces and cgroups
Access controls for app privileges and shared resources

Host resources are not all well separated
Containers have access to wider set of syscalls to the kernel

#RSAC
Security implications

Attack surface Resource isolation
Root permissions
Lifetime

Better

Worse

Minimalist host OS limits the surface of attack

Hypervisors are a strong security boundary

Host resources are separated

Host resources are not all well

using namespaces and cgroups separated

Access controls for app privileges Containers have access to wider

and shared resources

set of syscalls to the kernel

Containers have a shorter average It's harder to do forensics on a

lifetime

container that isn't there

#RSAC
Security implications

Attack surface Resource isolation
Root permissions
Lifetime

Better

Worse

Minimalist host OS limits the surface of attack

Hypervisors are a strong security boundary

Host resources are separated

Host resources are not all well

using namespaces and cgroups separated

Access controls for app privileges Containers have access to wider

and shared resources

set of syscalls to the kernel

Containers have a shorter average It's harder to do forensics on a

lifetime

container that isn't there

... but it's more the same than different

How to detect bad things at runtime

#RSAC
Why bother?
My secure supply chain prevents vulnerabilities!
But... ! Incomplete vuln scans ! Misconfigurations ! Zero days
Software supply chain is not perfect. A fence is better than tall fence posts

#RSAC
NIST Cybersecurity Framework
Identify Know your assets Protect Use security features and defaults Detect Detect unusual behavior Respond Respond to suspicious events Recover Figure out what happened and fix things
33

#RSAC
NIST Cybersecurity Framework
Identify Protect Detect Respond Recover
34

#RSAC
NIST Cybersecurity Framework
Identify Know what your containers are Protect Use secure defaults to protect your containers Detect Respond Recover
35

#RSAC
NIST Cybersecurity Framework
Identify Know what your containers are Protect Use secure defaults to protect your containers Detect Detect container behavior that deviates from
the norm
Respond Recover
36

#RSAC
NIST Cybersecurity Framework

Identify Know what your containers are

Protect Use secure defaults to protect your containers

Detect Respond

Detect container behavior that deviates from the norm
Respond to a suspicious event in your container and mitigate the threat

Recover
37

#RSAC
NIST Cybersecurity Framework
Identify Know what your containers are Protect Use secure defaults to protect your containers Detect Detect container behavior that deviates from
the norm
Respond Respond to a suspicious event in your container and mitigate the threat Recover Complete forensics and fix things so this doesn't happen to your container again 38

#RSAC
NIST Cybersecurity Framework
Identify Know what your containers assets are Protect Use secure defaults to protect your containers
applications
Detect Detect container behavior that deviates from the norm
Respond Respond to a suspicious event in your container and mitigate the threat Recover Complete forensics and fix things so this doesn't happen to your container again 39

#RSAC
NIST Cybersecurity Framework
Identify Know what your containers are Protect Use secure defaults to protect your containers Detect Detect container behavior that deviates from
the norm
Respond Respond to a suspicious event in your container and mitigate the threat Recover Complete forensics and fix things so this doesn't happen to your container again 40

#RSAC
Detect: container monitoring designs
 Hook into your container  Log a bunch of stuff  Policies for:
 alerts  automatic remediation  Allow forensics afterwards
41

#RSAC
Detect options
Examine process activity, network activity, file activity, ... HUGE VOLUME
! ptrace, kprobes, tracepoints ! Audit logs ! eBPF: kernel introspection ! XDP: uses eBPF for filtering network packets ! User-mode API: for kernel events like inotify
42

#RSAC
Deployment models
User space Container
Pod Kernel
Node
43

#RSAC
Detect and capture

User space Container

Mgmt Container

Pod

Pod

Kernel

Node
44

#RSAC
Detect and capture

User space Container

Mgmt Container

Pod

Pod

Kernel Kernel module

Node
45

#RSAC
Detect and capture

User space
Container Privileged Container
Pod
Kernel

Mgmt Container
Pod

Node
46

#RSAC
Manage

User space
Container Privileged Container
Pod
Kernel

Mgmt Container

Network events, system calls

Pod

Node
47

Store

User space
Container Privileged Container
Pod
Kernel

Mgmt Container
Pod

Node

Ring buffer
48

#RSAC
Local database Persistent disk
Hosted database

#RSAC
Respond
! Send an alert ! Isolate a container, i.e. move it to a new network ! Pause a container, i.e. stop all running processes ! Restart a container, i.e. kill and restart processes ! Kill a container, i.e. kill processes without restart
49

#RSAC
So, why are containers special again?

VM App Bins/libs Guest OS

VM App Bins/libs Guest OS

Hypervisor

Host OS

Hardware

Virtual machine
Long lived systems ! Manual security patches and
reviews
Per-host software ! IDS for host software
Shared, physical network ! Host-centric appliance for network
traffic
50

#RSAC
So, why are containers special again?

App

App

App

Bins/libs

Bins/ libs

Container Runtime

Host OS

Hardware

Container
Dynamic short-lived containers ! Need to redeploy often
Load isolation by container ! Need container IDS
Overlay network ! Need container network
monitoring
51

#RSAC
Apply slide - What you can do today
· Make it part of your security plan  Try out open source options  Evaluate commercial options
· Deploy early  Get baseline readings  Tune your signals
· Rehearse an event
52

Demo

#RSAC

#RSAC
Demo on YouTube
http://jen.run/krs-demo
55

#RSAC
What we discussed
Container security overview Containers differ from VMs Don't build fence posts What you can do today
56

#RSAC
Thank you!
Slides: https://mimming.com/krs
57

