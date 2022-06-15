APIC's Adventures in Wonderland

APIC's Adventures in Wonderland

Oliver Matula omatula@ernw.de

Frank Block fblock@ernw.de

www.ernw.de

www.insinuator.net

@WEareTROOPERS

APIC's Adventures in ACI Wonderland

Oliver Matula omatula@ernw.de

Frank Block fblock@ernw.de

www.ernw.de

www.insinuator.net

@WEareTROOPERS

Agenda
Who is this APIC you are talking about? You said you have found vulns! Where are they? Ok, fine! But what can I take away from this?

Introduction

The What and the Why
The What
Vulnerability Assessment of Cisco Application Centric Infrastructure (ACI)
The Why
Not much research has been done, since Cisco ACI is expensive

Lab Setup

Application Centric Infrastructure
Nexus 9k Spine Switches

Nexus 9k Leaf Switches

Different Systems
Hypervisor

Bare Metal Server

Database Server

System Details
Nexus 9k Leaf/Spine Switches · Intel Xeon CPU (64 bit) · Analyzed mainly Software Version 14.0(3d) · Wind River Linux (kernel 3.14.62) · ~300 processes, only two running as non-root user
Application Policy Infrastructure Controller (APIC) · Intel Xeon CPU (64 bit) · Analyzed mainly Software Version 14.1(1j) · CentOS 7 Linux (kernel 4.14.104) · ~500 processes, only ~20 running as non-root user

Vulnerability #1

https://www.theregister.co.uk/2019/05/02/cisco_vulnerabilities/

Attacker System

SSH Daemon #1 IPv4 0.0.0.0:22 IPv6 :::22

SSH Daemon #2 IPv4 127.0.0.1:1026 IPv6 :::1026
Mgmt Interface

Target (Nexus 9k Leaf Switch)

Attacker System

SSH Daemon #1 IPv4 0.0.0.0:22 IPv6 :::22

User 'local'
Public Key

SSH Daemon #2 IPv4 127.0.0.1:1026 IPv6 :::1026
Mgmt Interface

Target (Nexus 9k Leaf Switch)

Attacker System

SSH Daemon #1 IPv4 0.0.0.0:22 IPv6 :::22

User 'local'

Public Private

Key

Key

SSH Daemon #2 IPv4 127.0.0.1:1026 IPv6 :::1026
Mgmt Interface

Target (Nexus 9k Leaf Switch)

Attacker System
Attacker copies private key

SSH Daemon #1 IPv4 0.0.0.0:22 IPv6 :::22

User 'local'

Public Private

Key

Key

SSH Daemon #2 IPv4 127.0.0.1:1026 IPv6 :::1026

Attacker Controlled Nexus 9k Leaf Switch

Mgmt Interface

Target (Nexus 9k Leaf Switch)

Firmware Image

Attacker System

SSH Daemon #1 IPv4 0.0.0.0:22 IPv6 :::22

User 'local'

Public Private

Key

Key

SSH Daemon #2 IPv4 127.0.0.1:1026 IPv6 :::1026
Mgmt Interface

Target (Nexus 9k Leaf Switch)

Attacker System

ip6tables

SSH Daemon #1 IPv4 0.0.0.0:22 IPv6 :::22

User 'local'

Public Private

Key

Key

SSH Daemon #2 IPv4 127.0.0.1:1026 IPv6 :::1026
Mgmt Interface

Target (Nexus 9k Leaf Switch)

Attacker System

SSH Daemon #1 IPv4 0.0.0.0:22 IPv6 :::22

ip6tables

SSH Daemon #2 IPv4 127.0.0.1:1026 IPv6 :::1026

Source port 1025 whitelisted for IPv6 traffic

Mgmt Interface

User 'local'

Public Private

Key

Key

Target (Nexus 9k Leaf Switch)

Attacker System

SSH Daemon #1 IPv4 0.0.0.0:22 IPv6 :::22

ip6tables

SSH Daemon #2 IPv4 127.0.0.1:1026 IPv6 :::1026

Source port 1025 whitelisted for IPv6 traffic

Mgmt Interface

User 'local'

Public Private

Key

Key

runcmd
Target (Nexus 9k Leaf Switch)

runcmd execute
vsh echo 'test' > file
/volatile/file

Path Traversal Fails
echo 'test' > /tmp/file echo 'test' > ../tmp/file echo 'test' > bootflash:../tmp/file echo 'test' > volatile:../tmp/file

Path Traversal Win
echo 'test' > bootflash:lxc/CentOS7/rootfs/tmp/../../tmp/file
/bootflash/lxc/CentOS7/rootfs/tmp is symbolic link to /var/volatile/tmp

Path Traversal Win
echo 'test' > bootflash:lxc/CentOS7/rootfs/tmp/../../tmp/file
/bootflash/lxc/CentOS7/rootfs/tmp is symbolic link to /var/volatile/tmp
Can write arbitrary files with arbitrary content as user 'local` (CVE-2019-1836)

Cron job /bin/bg-action.sh run by root once per min.

bg-action.sh

exec

setup-hwclock.sh

Execute

filter

constructed

command

/tmp/setup-hwclock exec if exists

/tmp/setup-hwclock take content

Cron job /bin/bg-action.sh run by root once per min.

Filters ";", "||", "&&", but not "$()"

bg-action.sh

exec

setup-hwclock.sh

Execute

filter

constructed

command

/tmp/setup-hwclock exec if exists

/tmp/setup-hwclock take content

Cron job /bin/bg-action.sh run by root once per min.

Filters ";", "||", "&&", but not "$()"

bg-action.sh

exec

setup-hwclock.sh

Execute

filter

constructed

command

/tmp/setup-hwclock exec if exists

/tmp/setup-hwclock take content

Can run arbitrary commands as root user via /tmp/setup-hwclock file (CVE-2019-1803)

Exploit Chain
Finally, chain vulnerabilities to 1. Upload reverse shell 2. Execute reverse shell as root 3. Get CVE with Critical CVSS Score 9.8 (CVE-2019-1804)

Exploit Chain
Finally, chain vulnerabilities to 1. Upload reverse shell 2. Execute reverse shell as root 3. Get CVE with Critical CVSS Score 9.8 (CVE-2019-1804)
Demo time!

Vulnerability #2

Attack Scenario

Network Cable

Spine

Leaf
Server System #1

Server System #2

Leaf
Attacker Controlled
System

Attack Scenario

Network Cable Infrastructure VLAN

Spine

Leaf
Server System #1

Server System #2

Leaf
Attacker Controlled
System

Attack Scenario

Network Cable
Infrastructure VLAN VLAN / VXLAN for isolation mechanism

Spine

Leaf

Transition VLAN  VXLAN VLAN IDs  VNIs

Server System #1

Server System #2

Leaf
Attacker Controlled
System

Network Communication

APIC
1

Leaf Switch
LLDP Broadcast
DHCP

2

3
nginx TCP port 7777

TCP SYN
TCP RST, ACK
HTTP GET /fwrepo/boot/node-FD022480FLU
HTTP/1.1 200 OK TCP conn. to port 12183 again

5
TLSv1.2 Client Hello

svc_ifc_policyelem TCP port 12183
4
svc_ifc_policyelem TCP port 12183 6

Attack Scenario

Network Cable
Infrastructure VLAN VLAN / VXLAN for isolation mechanism

Spine

Leaf
Server System #1

Transition VLAN  VXLAN VLAN IDs  VNIs
Interesting information!
Server System #2

Leaf LLDP
Broadcast
Attacker Controlled
System

Attack Scenario

Network Cable
Infrastructure VLAN VLAN / VXLAN for isolation mechanism

Spine

Leaf
Server System #1

Transition VLAN  VXLAN VLAN IDs  VNIs
Psst, Leaf. I`m also an APIC.
Server System #2

Leaf Spoofed
LLDP Broadcast
Attacker Controlled
System

CVE-2019-1890
Attacker controlled system can join infra VLAN and access internal services!
· APIC ~60, Leaf & Spine ~15 services on infra VLAN · VXLAN tunnel endpoints exposed · Services on management interface also exposed

CVE-2019-1890
Attacker controlled system can join infra VLAN and access internal services!
· APIC ~60, Leaf & Spine ~15 services on infra VLAN · VXLAN tunnel endpoints exposed · Services on management interface also exposed
Demo time!

Going down the
rabbit hole

VXLAN Endpoint

Network Cable
Infrastructure VLAN VLAN / VXLAN for isolation mechanism

Spine

Leaf

Leaf with running VXLAN
Endpoint

Server System #1

Server System #2

Attacker Controlled
System

Crafting a VXLAN Packet

Layer 7.... 7.3 7.2
7 4 3

Protocol ... IP
Ethernet VXLAN
UDP IP

Value ...
src = 192.168.200.11, dst = 192.168.200.20 src = 01:23:45:67:89:ab, dst = cd:ef:11:22:33:44
vni = target VNI
dst = VXLAN Endpoint dst = Address of Leaf

Injecting VXLAN Packet

Network Cable
Infrastructure VLAN VLAN / VXLAN for isolation mechanism

Spine

Leaf with running VXLAN
Endpoint
Server System #1

Leaf with running VXLAN
Endpoint

Psst, Leaf. Here is a packet that I want to inject.

Malicious VXLAN Packet
Attacker Controlled
System

Server System #2

Injecting VXLAN Packet

Network Cable
Infrastructure VLAN VLAN / VXLAN for isolation mechanism

Spine

Leaf with running VXLAN
Endpoint

Leaf with running VXLAN
Endpoint

Server System #1

Psst, Leaf. Here is a packet that I want to inject.
Server System #2

Attacker Controlled
System

Network Cable Infrastructure VLAN VLAN / VXLAN for isolation mechanism
Leaf with running VXLAN
Endpoint
Server System #1

Spine

Server System #2

Leaf with running VXLAN
Endpoint
Attacker Controlled
System

Vulnerability #3

Link Layer Discovery Protocol

LLDP is a OSI-layer 2 protocol using Type-Length-Value Structures

Type 7 bits

Length 9 bits

Value 0-511 octets

TLV type values

TLV Type 0 1 2 3 4 ...
127

TLV Names End of LLDP Data Unit
Chassis ID Port ID
Time To Live Port Description
... Custom TLVs

Usage Mandatory Mandatory Mandatory Mandatory Optional
... Optional

Link Layer Discovery Protocol

LLDP Buffer Overflow · LLDP running as root on all leafs and spines. · NX and PIE activated.
· What happens when the length value for subtype 0xd8 is modified?

LLDP Buffer Overflow · LLDP running as root on all leafs and spines. · NX and PIE activated.
· What happens when the length value for subtype 0xd8 is modified?
CVE-2019-1901

Network Cable

Attack Scenario
Spine

Leaf
Server System #1

Psst, Leaf. Here is a new device.

Leaf Malicious
LLDP Broadcast
Attacker Controlled
System

Server System #2

Network Cable

Attack Scenario
Spine

Leaf
Server System #1

Server System #2

Attacker Controlled
Leaf
Attacker Controlled
System

Remaining Problems

Remaining Problems

Remaining Problems

Going further down the rabbit hole

Attack Scenario

Network Cable

Spine

Leaf

Attacker Controlled
Leaf

Server System #1

Server System #2

Going further down the rabbit hole

Going further down the rabbit hole

net_l2_register(socket_fd, 1, &a3, &ethertype.type, 1, 0)
net_l2_send(socket_fd, &a2, &intf.if_id, pstruct.padding, l2_message_length, l2_frame.dst_address)
struct l2_frame { char dst_address[6]; char src_address[6]; char ethertype[2]; char msg[payload_length];
};

Attack Scenario

Network Cable

Spine

Leaf

Malicious LLDP Broadcast

Psst, Spine. Here is a new device.

Attacker Controlled
Leaf

Server System #1

Server System #2

Attack Scenario

Network Cable

Spine

... Leaf

Malicious LLDP Broadcast
Leaf

Server System #1

Server System #2

Attack Scenario

Network Cable Infrastructure VLAN
VLAN / VXLAN A VLAN / VXLAN B

Spine

Leaf

Psst, Server #2. Here is Server #1.

Server System #1

Server System #2

Attacker Controlled
Leaf
Attacker Controlled
System

Attack Scenario

Network Cable Infrastructure VLAN
VLAN / VXLAN A VLAN / VXLAN B

Spine

Leaf

Server System #1

Server System #2

Attacker Controlled
Leaf
Attacker Controlled
System

Vulnerability #4

Going down the APIC hole

Going down the APIC hole

Going down the APIC hole CVE-2019-1889

Recommendations
· Update immediately! · Watch out for new Updates. · Think about how to use your ACI fabric. · Restrict Access to the management interfaces. · Deactivate LLDP wherever it is not necessary. · Do not import Device Packages from
Spam/4chan/Stackoverflow !

Thanks for your Attention!
Questions?
See Whitepaper and exploit files for more details!

Security Advisories
· Vulnerability #1
· Cisco Nexus 9000 Series Fabric Switches Application Centric Infrastructure Mode Symbolic Link Path Traversal Vulnerability · CVE-2019-1836 https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/ciscosa-20190501-fabric-traversal
· Cisco Nexus 9000 Series Fabric Switches Application Centric Infrastructure Mode Root Privilege Escalation Vulnerability · CVE-2019-1803 https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/ciscosa-20190501-nexus9k-rpe
· Cisco Nexus 9000 Series Fabric Switches Application Centric Infrastructure Mode Default SSH Key Vulnerability · CVE-2019-1804 https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/ciscosa-20190501-nexus9k-sshkey

Security Advisories
· Vulnerability #2
· Cisco Nexus 9000 Series Fabric Switches ACI Mode Fabric Infrastructure VLAN Unauthorized Access Vulnerability (High) · CVE-2019-1890 https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190703n9kaci-bypass
· Vulnerability #3
· Cisco Nexus 9000 Series Fabric Switches Application Centric Infrastructure Mode Link Layer Discovery Protocol Buffer Overflow Vulnerability · CVE-2019-1901 https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190731nxos-bo

Security Advisories
· Vulnerability #4
· Cisco Application Policy Infrastructure Controller REST API Privilege Escalation Vulnerability · CVE-2019-1889 https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20190703ccapic-restapi

