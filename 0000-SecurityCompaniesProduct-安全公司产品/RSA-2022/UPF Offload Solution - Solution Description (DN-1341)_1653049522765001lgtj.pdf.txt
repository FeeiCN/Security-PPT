SOLUTION DESCRIPTION
SmartNIC offload solution for 5G User Plane Function
NAPATECH SMARTNICS

SOLUTIONS Telecom Cloud and Edge Cybersecurity Monitoring Infrastructure Financial
PLATFORMS Link-CaptureTM Software Link-InlineTM Software Link-VirtualizationTM Software Link-ProgrammableTM SmartNICs
APPLICATION PERFORMANCE vSwitch offload Suricata Bro Snort n2disk Wireshark TRex + More
SERVICES Professional Services Custom Development

NAPATECH NT200A02 SMARTNIC NAPATECH NT100A01 SMARTNIC

Napatech's SmartNIC offload solution for 5G User Plane Function maximizes the user capacity of packet core infrastructure
By leveraging Napatech's Smart Network Interface Card (SmartNIC) solution, 5G core software vendors maximize the performance of their User Plane Function (UPF) subsystem: · Delivering industry-leading users-per-server capacity through the complete offload of the UPF data plane; · Supporting 100 million concurrent flows and 85 million packets per second throughput on a single SmartNIC; · Minimizing the cost-per-user for service providers deploying 5G infrastructure; · Simplifying and optimizing the architecture for centralized monitoring of remote Packet Core infrastructure. · UPF represents the highest compute workload within the 5G packet core
UPF represents the highest compute workload within the 5G packet core In a 5G network, the UPF subsystem within the Packet Core performs critical functions associated with connecting user and device traffic from the Radio Access Network (RAN) to the Data Network (DN). To ensure that packets are routed quickly, accurately and securely to the correct destination on the internet, the UPF must perform packet inspection, packet routing, packet forwarding and Quality of Service (QoS) handling. In a typical deployment, the UPF processes millions of traffic flows with a high connection rate, supporting an aggregate throughput that meets the diverse bandwidth requirements of consumers, machines, vehicles and Internet of Things (IoT) devices.

Users and Devices

DU

N3

DU

CU

DU

Radio Access Network (RAN)

Control Plane
User Plane Function (UPF)
5G Packet Core

N6 Data Network (DN)

Unlike in 4G networks, the 5G Packet Core is implemented as a set of Virtual Network Functions (VNFs) or Cloud-native Network Functions (CNFs) running on standard servers, rather than using purpose-built appliances. The cost of these servers, both CAPEX and OPEX, is a major contributor to the overall cost of deploying and operating 5G networks, so there is a strong incentive for Communications Service Providers (CSPs) to minimize server costs as they look to maximize the Return on Investment (RoI) for their infrastructure. Metrics such as the number of users supported per server, as well as the overall server cost per user, are key to their determination of RoI.

As the primary data plane function within the Packet Core, the UPF represents the highest compute workload. Since general-purpose server CPUs are not well suited to the performance and latency requirements of real-time packet processing, CSPs and 5G Core software vendors typically adopt solutions for offloading the UPF to accelerators such as programmable Smart Network Interface Cards (SmartNICs) which are optimized for executing such workloads. These SmartNICs replace the standard NICs (often known as "foundational NICs") used in IT-oriented data center servers, providing orders of magnitude better UPF performance than achieved using the server CPUs themselves.

Napatech's SmartNIC solution delivers industry-leading UPF performance in an industry-standard environment Napatech addresses the business imperative of minimizing the cost-per-user for 5G Packet Core deployments by providing an integrated hardware/software solution that delivers industry-leading UPF performance. This solution comprises a fully-offloaded UPF fast path implemented within the Link-InlineTM software stack, running on PCI-Express (PCIe) SmartNICs available in configurations that support a bandwidth of either 100Gbps (NT100 card) or 200Gbps (NT200 card).
5G UPF SLOW PATH ON SERVER CPU

5G UPF FAST PATH with Link-InlineTM Software

Napatech's UPF Offload solution enables CSPs to support significantly more users per server than with competing solutions, while at the same minimizing the overall cost per user and improving energy efficiency.
Using a single 200Gbps NT200 SmartNIC to sustain 100Gbps of full duplex traffic, the Napatech UPF Offload software processes 100 million concurrent flows, with a flow learning rate greater than 1.5 million flows per second, achieving a total throughput of 85 million packets per second and ensuring full wire speed operation for typical packet sizes.
Napatech's UPF offload software is fully compatible with the industry-standard DPDK RTE_FLOWS API for flow configuration. This ensures that 5G Core software vendors can readily leverage the performance benefits of the Napatech solution

without having to rewrite their software to use a proprietary API. Kubernetes support enables the solution to be deployed within a cloud-native environment using a standard orchestration platform.
From a hardware perspective, both the NT100 and NT200 SmartNICs are full-height, half-length PCIe Gen3 cards, available in both active and passive (NEBS) cooling variants, with standard SFP28 and QSFP28 network ports. These SmartNICs fit into industry-standard servers as straightforward alternatives to standard or "foundational" NICs that provide no offload features.

Hairpinned architecture maximizes system performance while minimizing server CPU utilization Napatech's UPF Offload solution implements the UPF data path as a port-to-port "hairpinned" architecture, which ensures that following initial setup all flows are processed on the SmartNIC with no need for traffic to flow to and from the server CPU. This maximizes the overall performance of the system while minimizing the utilization of the server CPU, freeing up its resources for running control plane functions.

Server CPU Software processing for those flows not hairpinned in the SmartNIC

Partial or No Offload

UPF CONTAINER
Interface SMF (N4) Fallback Software UPF for
Non-Hairpinned Traffic Control Offload
rte_flow

Partial or No Offload

Load Balance

Flow Lookup

Load Balance

Napatech SmartNIC Hardware-offloaded flows hairpinned in the SmartNIC

GTPU Encap/ Decap

MBR Policing

Usage Statistics

DSCP Remark

N3

N6

SWITCH FABRIC

Each new flow is analyzed by the hardware flow matcher on the SmartNIC to determine if it matches a record in the flow table. If it does, the specified actions are applied and the flow is processed completely on the SmartNIC, leveraging the hairpinned architecture from ingress to egress for maximum throughput and minimum latency.
If a new flow is not recognized in the flow table, it is forwarded to the slow path executing on the server CPU. The software flow matcher determines the appropriate actions, processes the packet and forwards it back to the SmartNIC. At the same time, the learning subsystem updates the both flow tables so that subsequent flows matching the record can be processed on the SmartNIC.
Key features implemented within the Napatech UPF Offload solution include: · Flow management: with full flow awareness, lookup is
performed at high speed to enable stateful operations within the hairpinned architecture and to tag packets with relevant information before they are passed to the host application;

· GTPU tunnels: the SmartNIC performs full decapsulation on uplink traffic and encapsulation on downlink;
· MBR policing: bit-rate control ensures that no device exceeds its Maximum Bit Rate (MBR);
· Usage statistics: the SmartNIC collects the counters and metrics required to enable accurate charging as well as network monitoring;
· DSCP tagging: the SmartNIC performs Differentiated Services Code Point tagging on a per-flow basis, which enables full support for 5G QoS;
· Load balancing: traffic passed to the host application for processing is load-balanced based on flow information;
· Policy actions: the SmartNIC implements the Forward Action Rule (FAR) in support of partial offload;
· NAT: the SmartNIC performs Network Address Translation on both uplink and downlink.

Delivering compelling business benefits for 5G service providers As CSPs scale up their deployment of 5G networks, two key metrics that influence the profitability of their core infrastructure are the cost per user and the number of users that can be supported per server. Napatech's UPF Offload enables CSPs to achieve compelling results on both these metrics compared to competing offload solutions.

18,000

Competing Offload Solution Napatech UPF Offload

16,000

16,667

14,000

12,000

10,000

8,000

6,000

4,000 2,000

2,381

0

Users per Server

Competing Offload Solution Napatech UPF Offload $14

$12

$12.13

$10

$8

$6
$4.98 $4

$2

$2.16

0 CAPEX per user

$0.70 5-year OPEX per user

Per-User CAPEX and OPEX

The example illustrated above reflects the analysis of a metro edge data center running a 5G Packet Core to support 50,000 5G users. Operational expenses (OPEX) were calculated over a five-year period and included the cost of power as well as server OPEX. Servers were assumed to be industry-standard platforms with two PCIe slots.

Within the telecom industry where Average Revenue per User (ARPU) has been flat or even declining for the past decade, these levels of capacity increases and cost savings represent a compelling value proposition for CSPs.

Based on the full set of assumptions, available on request, the above scenario yields the following benefits: · 16,667 users supported per server when the Napatech UPF
Offload solution is used, compared to 2,381 for a competing offload solution, an increase of 7x; · Per-user CAPEX of $2.16 for the Napatech UPF Offload solution is used, compared to $12.13 for a competing offload solution, a reduction of 82%; · Per-user 5-year OPEX of $0.70 for the Napatech UPF Offload solution is used, compared to $4.98 for a competing offload solution, a reduction of 86%.

Integrated mirroring and tunneling enables cost-effective centralized network monitoring By implementing high-performance, low-latency mirroring and tunneling functions within the Link-Inline software, Napatech's UPF Offload solution enables network operators to improve the efficiency of their network monitoring systems.

N3

N6

Switch

N6
Data Network (DN)

5G UPF FAST PATH Mirroring and Tunneling with Link-InlineTM Software
5G Packet Core Instance

Tunneled Mirror Feed of N3 and N6 Traffic

Centralized Network Monitoring System

Within a typical 5G network, multiple Packet Core instances are deployed at physical locations ranging from edge nodes to on-premise clouds to metro Points of Presence (PoPs) to telco data centers. At the same time network operators need a holistic, real-time view of network traffic trends in order to ensure QoS and proactively identify actual or potential problems. They also need a cost-effective solution for implementing Lawful Intercept (LI) functions that ensure zero packet loss. However, deploying network monitoring appliances co-located with each Packet Core instance imposes a major cost burden on the overall infrastructure, while also impacting total energy efficiency and driving up operational complexity.

Napatech addresses this challenge by implementing high-performance traffic mirroring and tunneling functions within the Link-Inline software running on its SmartNICs, as adjacent functions to UPF Offload, with the Flow Manager applying specific actions to individual flows. Both "N3" (RAN to Core) and "N6" (Core to Data Network) can be tunneled over a mirror feed and forwarded to a centralized monitoring system located at the Network Operations Center (NOC).
This capability enables network operators to implement an efficient, cost-effective network monitoring system that is centralized, rather than being forced to replicate individual monitoring appliances at a large number of remote locations.

Summary As Communications Service Providers (CSPs) scale up the deployment of their 5G networks, it becomes critical to optimize the Return on Investment (RoI) for their infrastructure. With 5G User Plane Function (UPF) representing a significant part of the overall workload for the 5G Packet Core, it's important to leverage solutions that maximize the number of users supported per server and thereby minimize the overall cost per user.
By offloading the UPF data plane processing from the server CPU to an integrated hardware/software SmartNIC solution, Napatech delivers industry-leading performance for the UPF function. This offload solution is based on industry-standard APIs and cloud-native orchestration, enabling it to be easily integrated into complete 5G Core products offered by leading telecom software vendors.
As an additional benefit for network operators, Napatech's UPF offload solution enables the efficient mirroring and tunneling of traffic from remote nodes running 5G Packet Core instances to centralized locations, reducing the capital and operational costs associated with comprehensive network monitoring.
Napatech's unique technology, fully compatible with all relevant hardware and software standards, delivers compelling business benefits to 5G Core software vendors as well as their CSP customers deploying 5G networks.
For more information, visit: Napatech at https://www.napatech.com/solutions/

Napatech helps companies to reimagine their business, by bringing hyper-scale computing benefits to IT organizations of every size.
We enhance open and standard virtualized servers to boost innovation and release valuable computing resources that improve services and increase revenue.
Our Reconfigurable Computing PlatformTM is based on a broad set of FPGA software for leading IT compute, network and security applications that are supported on a wide array of FPGA hardware designs.
EUROPE, MIDDLE EAST AND AFRICA Napatech A/S Copenhagen, Denmark T +45 4596 1500 info@napatech.com www.napatech.com
NORTH AMERICA Napatech Inc. Portsmouth, NH, USA T +1 888 318 8288 info@napatech.com www.napatech.com
ASIA-PACIFIC ntapacsales@napatech.com www.napatech.com
Disclaimer: This document is intended for informational purposes only. Any information herein is believed to be reliable. However, Napatech assumes no responsibility for the accuracy of the information. Napatech reserves the right to change the document and the products described without notice. Napatech and the authors disclaim any and all liabilities. Napatech is a trademark used under license by Napatech A/S. All other logos, trademarks and service marks are the property of the respective third parties. Copyright © Napatech A/S 2022. All rights reserved.

DN-1341 Rev. 2

