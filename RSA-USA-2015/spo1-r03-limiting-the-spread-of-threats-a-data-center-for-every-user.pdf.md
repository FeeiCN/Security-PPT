SESSION ID: SPO1-R03
Limiting the Spread of Threats: A Data Center for Every User

Geoff Huang
Director Product Marketing VMware

Tony Paikeday
Senior Product Marketing Manager VMware

#RSAC

#RSAC
Why do breaches still occur?

Today's data centers are protected by strong perimeter defense.
Attacks spread inside the data center, where internal controls are often weak. Critical systems are targeted.

But threats and exploits still infect servers. Lowpriority systems are often the target.

Threats can lie dormant, waiting for the right moment to strike.

10110100110 101001010000010 1001110010100

Server-server traffic growth has outpaced client-server traffic. The attack spreads and goes unnoticed.

Possibly after months of reconnaissance, the infiltration relays secret data to the attacker.

Breaches are still occurring because of a security

model that evolved 15 years ago

OSMrcoahnfeatswgtreaamtioernent&

Software

Software

Compute

Software System
CPU
Mainframe / Workstation

Software
Operating System
System CPU

OS OS OS
Compute Virtualization
System
CPU

Client Server

OS OS OS
Compute Virtualization
System CPU
Cloud

Network Security

Software System
Chip

Software System

Software System

Chip

Chip

Same security model and tools

Software System
Chip

#RSAC

#RSAC
The legacy security model emphasized perimeter security
Perimeter-centric network security has proven insufficient
Internet
Data Center Perimeter

#RSAC
And is incompatible with a world where security is needed everywhere

Adding more internal security...
requires placing more firewalls across workloads

Physical Firewalls
Cost prohibitive with complex configurations

Internet
Data Center Perimeter

Virtual Firewalls
Slower performance, costly and complicated

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
Hypervisor is uniquely positioned to see everything
Applications
Virtual Infrastructure
Physical Network Infrastructure
Internet

Granular control becomes possible
· High throughput rates on a per-hypervisor basis
· Every hypervisor adds additional east-west firewalling capacity

Delivering better security automation
Platform-based automation
· Automated provisioning and workload adds/moves/changes
· Accurate firewall policies follow workloads as they move
· Centralized management of single logical, distributed firewall

Delivering higher levels of data center security
Micro-segmentation

1

Isolation and segmentation

2 Unit-level trust / least privilege

3

Ubiquity and centralized control

Simplifying network security

Production

Development

Finance

HR

Web

App

DB

#RSAC
 Security policies no longer tied to network topology
 Logical groups can be defined
 Prevents threats from spreading

#RSAC
What does micro-segmentation look like applied beyond just application servers inside the data center?

Desktop and App Virtualization are the

#RSAC

next logical steps

Internet

Data Center Perimeter

Virtual Desktops mean centralization of activity within the data center.

With VDI your data center has a

#RSAC

much larger security surface area

A converged infrastructure means virtual desktops run on the same infrastructure as servers.

Internet

West

East

Data Center Perimeter

#RSAC
Network considerations for VDI environments
With desktop virtualization, the network matters more than ever. Virtual desktops are a networked entity sitting inside your datacenter.
By 2018, 75% of all data center traffic will be "east-west" in nature
 Desktop Virtualization scales up the volume of east-west traffic within the data center
 Multiple discrete flows for each VM: between users, servers, storage, other hosts, and WWW
User desktops now sit amidst a much larger attack surface, inside the data center.

A matrix of policies is needed on centralized,

#RSAC

choke-point firewalls for the correct security posture

Finance HR Engineering

NSX simplifies VDI

Engineering

Marketing

Finance

#RSAC
HR
 Firewall and filter traffic based on logical groupings
 Simplified, programmable, automated application of network/security policy to desktop users/pools
 Service-chaining with AV and NGFW partners to deliver automated, policy-integrated AV / malware protection, NGFW, IPS, etc.

#RSAC
Virtual networking: fast, easy, and extensible

Network

HR

Finance

Bob (HR)
Human Resources

Email

SharePoint

Jennifer (Finance)
Finance

Use case: VDI
Situation
OS no longer supported on several systems These systems need policy which restricts access to only email servers.
Unsupported OS Group

#RSAC

#RSAC
What about micro-segmentation applied even closer to the user?

#RSAC
Our problem: it's not a 1:1 world anymore
Enterprise Network

User

Internet

#RSAC
Our problem: it's not a 1:1 world anymore

VDI to VDI Desktop-to-desktop hacking inside the DC

Enterprise Network

User

Internet

A converged infrastructure means virtual desktops run on the same infrastructure as servers.

VDI to VM Desktop-to-server hacking inside the DC
Bringing desktops into the data center opens up new risks for attack.

#RSAC
Our problem: it's not a 1:1 world anymore
Enterprise Network

User

Internet

All mobile apps can access enterprise network.

All data center apps can be accessed.

#RSAC
Modern mobility: personal and managed

#RSAC
Modern mobility

#RSAC
Modern mobility

#RSAC
Evolving to intelligent networking
Device-Level VPN Full Network Access

#RSAC
Intelligent networking
App-Level VPN Full Network Access

#RSAC
Intelligent networking
App-Level VPN Select Network Access

#RSAC
Intelligent networking and automation
Firewall Port

#RSAC
Intelligent networking and automation
Port

#RSAC
Better context, better tools, better visibility

Users Apps Devices Systems Data Network

Who is this person? Who is using what apps? Has the device been jail broken? Who has been accessing what? What class of data is this? Are they on cellular or Wi-Fi?

#RSAC
Imagine granular user security
A personalized DMZ, tailored for each unique situation

#RSAC
Learn more
 Attend other sessions to learn how VMware is transforming security: Micro-segmentation: How to create a more secure Data Center Network Wednesday, 4:30pm, Briefing Center, North Hall
WestJet's Security Architecture Made Simple ­ We finally got it right! Thursday, 10:20am, Moscone West, Room 3004
Limiting the Spread of Threats: A Data Center for Every User Thursday, 10:20am, Moscone North, Room 130
Automating Security Workflows: The SDDC Approach Thursday, 11:30am, Moscone North, Room 130
 Visit the VMware booth: South Hall (#1315)
 Learn more about micro-segmentation and Horizon: http://www.vmware.com/go/nsx http://www.vmware.com/go/horizon

#RSAC
Apply What You Have Learned Today

Next week
 Review your organization's workflows for end user computing security

In 3 months
 Assess your organization's ability to cope with changes and deal with threats inside the data center

In 6 months
 Adopt a plan for providing finegrained security in the data center and on mobile devices

Thank you

Geoff Huang Tony Paikeday

#RSAC

