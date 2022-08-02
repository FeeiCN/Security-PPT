PRODUCT BRIEF
Link-VirtualizationTM Software for Programmable SmartNICs and IPUs

Maximize ROI for Cloud and Edge Data Centers Within Cloud and Edge data centers, the efficient utilization of server compute resources is key to maximizing overall ROI and energy efficiency. In virtualized environments, infrastructure handling consumes a significant portion of compute resources. Operators need to minimize the compute resources and energy used by infrastructure virtual switching and release these back to applications and services generating revenue.
Increase Virtual Machine Density Using Napatech Link-VirtualizationTM powered by an FPGA-based SmartNIC, infrastructure virtual switching is fully offloaded, enabling Cloud and Edge operators to increase VM density on the same COTS hardware. Link-Virtualization consumes just a single core for infrastructure handling, provides Open Standards-based support and enables Live Migration for fully transparent migration of VNFs between servers to solve shifting tasks as demand changes over time.
Full Open vSwitch (OVS) Offload Using the standard OVS-DPDK distribution, Link-Virtualization software adds powerful hardware acceleration to the virtual switch and megaflow caching - ensuring that only new and unknown flows are resolved in the host CPU. Offloading the virtual switch to the SmartNIC has several benefits, including:
· freeing up valuable CPU cycles for your critical applications rather than wasting cycles on infrastructure
· providing deterministic latency and jitter - regardless of packet size and number of flows
· increasing throughput
Furthermore, virtio-net (as opposed to SR-IOV) enables Live Migration of VNFs without being tied to the SmartNIC hardware. In other words, Link-Virtualization provides hardware offload of software equivalent switching - without imposing any restrictions on the system.

Napatech Link-Virtualization software is a production-grade, turnkey solution that harnesses the capabilities pioneered by hyperscale cloud service providers, and makes them readily available to cloud, 5G telecom, and enterprise data center networks of every size.
Bare Metal for Cloud Service Providers Link-Virtualization can also serve as bare-metal offload SmartNIC with full SDN support - exposing 16 virtio-net and 16 virtio-blk to the host and with full tenant isolation. Cloud Service Providers can deploy Link-Virtualization to offer its customers access to bare-metal servers, while retaining full SDN capabilities of the infrastructure.
Virtual Machine monitoring Napatech's VM-to-VM monitoring solution provides insight into both N-S and E-W traffic, where packets can be mirrored for analytics, SLA monitoring or regulatory purposes.
Key Features · Line-rate forwarding up to 130 Mpps · Live Migration/Live Backup of running VNFs · Run infrastructure on a single core · Achieve non-degrading performance as function of flows · Achieve predictable jitter and latency as function of flows · 20X throughput increase · Supported on 10/25/40/100 GbE

Napatech Link-VirtualizationTM Features · Full OVS-DPDK hardware offload (OVS 2.12/DPDK 18.11)
· 130 Mpps switching performance @ 64B · 100 Gbps switching capacity · OpenStack support · VirtIO · Fully accelerated VirtIO 1.1 with vDPA · Transparent 0.95/1.0 support · Live Migration (VirtIO 1.1) · OVS statistics · VM-to-VM mirroring for analytics, SLA monitoring, regulatory compliance · Non-degrading HW Megaflow cache for tracking billions of flows · Extensive and configurable match processing for L2-4 packet headers · VLAN/VXLAN encapsulation/decapsulation · Q-in-Q · RSS load balancing · Link aggregation (active/active and active/standby) · Jumbo frame support · Quality of Service (QoS) · IPv4/v6 · Hardware QoS
Supported Operating Systems · CentOS 8 · Red Hat Enterprise Linux 8 · Ubuntu Server LTS
Client VMs Supported APIs · Data Plane Development Kit (DPDK) · Linux NetDev (Kernel 5.0+)

Hardware & Transceiver Support Napatech Link-Virtualization software supports the following hardware and transceivers:
Napatech · NT200A02:
· 10GBASE-SR, CR, LR, ER · 25GBASE-SR, LR, LR-BiDi · NT50B01: · 10GBASE-SR, CR, LR, ER · 25GBASE-SR, LR, LR-BiDi
Silicom · C5010X
· 10GBASE-SR, CR, LR · 25GBASE-SR, LR

DN-1206 Rev. 8

NAPATECH.COM
Disclaimer: This document is intended for informational purposes only. Any information herein is believed to be reliable. However, Napatech assumes no responsibility for the accuracy of the information. Napatech reserves the right to change the document and the products described without notice. Napatech and the authors disclaim any and all liabilities. Napatech is a trademark used under license by Napatech A/S. All other logos, trademarks and service marks are the property of the respective third parties. Copyright © Napatech A/S 2021. All rights reserved.

