SESSION ID: CSV-W04
Security, Meet Your New Roommate, The Dynamic Provisioning Environment

Jason Pappalexis
Research Director NSS Labs, Inc. @jsnppp

Chris Morales
Principal Engineer HyTrust @MoralesATX

#RSAC

#RSAC
Security Requires Flexibility

Adaptive
2

Resilient

#RSAC
Incident Response Still Includes Reimaging

Detection and Identification

Isolation

Inoculation or Reimaging

Weeks, Months (Years?)

Often Hours, Days

Remediation through reimaging solves business need, not security need
3

#RSAC
Forensics Enables Understanding

Detection and Identification

Isolation

Forensics

Inoculation or Reimaging

+ Days, Weeks, Months

Forensics can add considerable time to remediation process with no guarantee of successful results
4

#RSAC
The Incident Response Conundrum

Reimaging
Rapid Resolution
Threat Removal Intelligence Gathering
Small Amount
Business Continuity

Forensics
Time-consuming Resource-intensive
Threat Retention (+ Possible Reinfection)
Intelligence Gathering Large Amount
Business Impact

5

#RSAC
If Only We Had...
Copyright Warner Bros., Superman, 1978
Phantom Zone
6

#RSAC
Virtualization Unlocks Doors

#RSAC
Most Enterprise Environments Are Virtualized

 Virtual data centers are growing
 >50% of today's organizations have a virtual component  Top companies have >30,000 virtual machines  Many have capacity not being utilized

 Dynamic provisioning environment (DPE)

 Central management and provisioning of virtual machines (VMs)

 Rich APIs provide options for control  Automation saves time and can reduce error

DPE Security

8

Duplication Of Work Surface Using DPE

Legitimate Connections

Legitimate Connections
ORIGINAL CONTAMINATED

NEW and CLEAN
Virtual Machine Data

Virtual Machine

Data

Malicious Connections

Malicious Connections

CONTAMINATED

Virtual Machine

Isolated Data

#RSAC
Isolated Network

9

#RSAC
How It Works ­ Five Phases Of Adaptive Security

EVALUATION

CLONING

TRANSFERENCE CONTAINMENT COMMUNICATION

This process is not owned by a single person today
10

#RSAC
How It Works ­ Evaluation

EVALUATION
· Processes · Resources · Services · Connections

Unix netstat command

$ sudo netstat -lp

Active Internet connections (only servers)

Proto Recv-Q Send-Q Local Address Foreign Address State PID/Program Name

tcp

0

0 *:http-alt

*:*

LISTEN 6022/java

tcp

0

0 *:ssh

*:*

LISTEN 29126/sshd

tcp

0

0 *:8443

*:*

LISTEN 6022/java

tcp

0

0 *:1883

*:*

LISTEN 2237/mosquitto

udp

0

0 *:mdns

*:*

6022/java

udp

0

0 localhost:ntp *:*

2260/ntpd

Active UNIX domain sockets (only servers)

Proto RefCnt Flags Type

State

I-Node PID/Program Path

unix 2

[ ACC ] SEQPACKET LISTENING 3829 159/udevd /run/udev/control

VMware List Processes
VixVM_ListProcessesInGuest(VixHandle vmHandle,
int options, VixEventProc *callbackProc, void *clientData);
VMware VIX API v1.13 - https://www.vmware.com/support/developer/vix-api/index.html 11

#RSAC
How It Works ­ Cloning

CLONING
Duplicate VM without connections

Citrix XenServer

VM.clone(session, t_ref, "VM_Name") VM.provision(session, new_vm_ref)

VMware ESX

VixVM_Clone(VixHandle vmHandle, VixHandle snapshotHandle, VixCloneType cloneType, const char *destConfigPathName, VixCloneOptions options, VixHandle propertyListHandle, VixEventProc *callbackProc, void *clientData);

VMware VIX API v1.13 - https://www.vmware.com/support/developer/vix-api/index.html Xen: http://docs.vmd.citrix.com/XenServer/6.0.0/1.0/en_gb/api/?c=VM
12

#RSAC
How It Works ­ Transference

TRANSFERENCE
Legitimate connections transparently moved to new clone

Unix iptables command

# iptables -L

Chain INPUT (policy DROP)

target

prot opt source

ACCEPT

tcp -- anywhere

DROP

all -- anywhere

destination anywhere anywhere

tcp dpt:ssh

Chain FORWARD (policy DROP)

target

prot opt source

destination

Chain OUTPUT (policy DROP)

target

prot opt source

destination

iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

13

How It Works ­ Containment

CONTAINMENT
Attacker's progress is preserved

VMware ESX

./esxcfg-portgroup-mgmt.pl --server esxi4-2.primp-industries.com --username root --operation enable --portgroup "Management Network" --portgroup_type vmotion

VM VM
VM VM
VM

ISP 1
VM
IP: 172.17.10.5

VMPZ
IP: 172.17.10.5

ISP 2

#RSAC

Production Network 172.17.x.x subnet

Isolated Honeypot Network 172.17.x.x subnet

The contaminated VM is moved to secure, isolated, honeypot network

14

#RSAC
How It Works ­ Communication

COMMUNICATE
Identify where the attack surface needs to adapt and then Implement

Source: 21CT LYNXeon Network Security Analytics 15

#RSAC
To Infinity And Beyond

Virtual Machines

Multiple Systems

Today
16

Network Tomorrow
Segments

#RSAC
Apply What You Have Learned Today
 Next week you should:
 Confirm if your company detonates known bad infections  Investigate if re-imaging is the primary method of remediation
 In the first three months following this presentation you should:
 Discuss resiliency of mission critical systems within your network  Review spare capacity in virtual data centers within your network
 Within six months you should:
 Define a process and automation  Define success metrics ­ when is this a viable option for your company
17

#RSAC
Security Requires Flexibility

Adaptive
18

Resilient

#RSAC
References and Resources
 Cyber Resilience: It's Not About the 98 Percent You Catch, It's About the 2 Percent You Miss. NSS Labs, https://www.nsslabs.com/reports/cyber-resilience-it's-not-about-98-percent-you-catch-it's-about-2percent-you-miss
 Adaptive Security for Business Continuity. NSS Labs, https://www.nsslabs.com/reports/adaptive-securitybusiness-continuity-0
 Incident Response Part 1: Does It Matter, Or Was It Just Noise? NSS Labs, https://www.nsslabs.com/reports/incident-response-part-1-does-it-matter-or-was-it-just-noise
 Incident Response Part 2: Breach Found. Did it hurt? NSS Labs, https://www.nsslabs.com/reports/incident-response-part-2-breach-found-did-it-hurt
19

Thank you!

Jason Pappalexis Research Director, NSS Labs, Inc. jpappalexis@nsslabs.com

Chris Morales

Principle Engineer, HyTrust, Inc.

#RSAC

cmorales@hytrust.com

Questions and Answers

