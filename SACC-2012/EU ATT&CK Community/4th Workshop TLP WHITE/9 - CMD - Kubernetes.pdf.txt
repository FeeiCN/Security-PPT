DETECTION IN LINUX CONTAINERS:
MITRE ATT&CK IN CONTAINER ENVIRONMENTS & UPDATES TO CUSTOMER ADOPTION
Martin Bowyer & Jake King

Agenda_

# Deploying MITRE ATT&CK Detection policies in Production.
# Your feedback from the last session - gaps in Container Observability
# Applying MITRE ATT&CK & OSS tooling Kubernetes environments

Cmd

2

Gathering better data for TTP's on Linux systems

 We need data - Execution logs and detailed process / filesystem information
 We need context - User, Session, parent / child process information, prevalence, enrichment
 We need Retention - Over time, and across environments
 We must have control - Whitelists aren't super easy & remediation is post-breach

Cmd

3

Gathering better data for TTP's on Linux systems

 We need data - Execution logs and detailed process / filesystem information
 We need context - User, Session, parent / child process information, prevalence, enrichment
 We need Retention - Over time, and across environments
 We must have control - Whitelists aren't super easy & remediation is post-breach

Observation

Cmd

4

What tools are used for Linux?

 OS Logs: AuditD, Syslog, eBPF  Augmented alerting via Auditd Policies
 FOSS Sensors: ES-Beats, ProcSpy, ExecSnoop, SSH-Bastion
 Vendors Sensors: EDR / HIDS / PAM tools  Vendor / FOSS SIEM: Splunk, Sumo, ELK  Defense / Remediation Tools: Ansible, Chef, Puppet,
LimaCharlie

Cmd

5

MITRE ATT&CK for Linux_

10B+
EXECUTIONS PROCESSED
Cmd

60,000+
IOC'S DETECTED

580+
POLICIES IN PRODUCTION
6

One Caveat_

Media & Streaming
Cmd

Banking

Ecommerce
7

Some Results from Production_

Cmd

8

Some Results from Production_

Cmd

9

Some Results from Production_

Cmd

Sightings -> MISP

10

Some Results from Production_

Cmd

Not...Sightings?

11

How do we create Policies?
# Developing policies via Atomic Red Team - Still working well, but we want to translate / share in SIGMA.
# Work to be done to polish rules into effectively for Containers / Kube
# 40+ Policies created, but can be noisy without custom profiles / Prioritization
Cmd

12
12

Feedback from our last Session_

"What about visibility into Kubernetes?" "Visibility into containers?"

Cmd

13

A gap in Observability: Containers

# OSS Offerings are limited, and hard to deploy for Containers without the right knowledge
# Not as low-touch as you'd assume - Constantly touched / interacted with
# Common abuses # Insider Threats # API key compromise (Kubectl) # Service/image Compromise*

* Check out the talk from Hack.lu on Containing containers.

Cmd

14

Observability with eBPF
What is eBPF? - Bytecode interpreter in the Linux kernel - Traditionally used for packet filtering - Extended to other kernel objects - kprobes, uprobes, tracepoints
BPF Compiler Collection - execsnoop, opensnoop, many more! - github.com/iovisor/bcc

Cmd

15

Monitoring a Kubernetes Cluster
 Package eBPF programs in a container image
 Deploy container image to cluster as a Daemonset  Single instance per cluster node  Automatically scales with the cluster
 Map data collected to ATT&CK leveraging either open signatures and/or custom signatures

Cmd

16

Demo

Cmd

17

Applying MITRE ATT&CK to eBPF Data_

 Standard hardening / minimization will defend against numerous attacks, but not all
 eBPF data can be used to capture syscalls being made with Atomic Red Team to build effective preventative rules
 Policies can then be created to whitelist syscalls at the point of a binary execution with SecComp / SELinux / AuditD
 Kernel 5.0 brings some of these features to user space for awesome future projects!

Cmd

18

THANKYOU!
Martin Bowyer & Jake King cmd.com

