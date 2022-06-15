SDN
   20140917


   SDN  SDN



















 

 

 









 
 



Public Cloud

Tenant

Tenant

vNAT vFW

vLB vNAT vFW

VSR

VSR

Internet
DSLAM
Modem CPE
Client

Switch
CPE SOHO

VSR
Private Cloud
vRR Headquarters
Enterprise network
VR

Branch

Branch









 IP 

EC2  QoS

VPC 













 

  
 VLAN 
  









Core

Core

 OSPF/BGP

TOR

TOR

TOR

Core

Core

 (IRF/vPC/TRILL/ Fabric Path etc.)

TOR

TOR

TOR

 

?

subnet

 subnet

subnet

Tenant

WEB

APP

DB

VFW

LB

vRouter

FW

IPS



VLB VSR

Internet

MPLS VPN



 SNMPCLI NetConf...
 BGPIS-IStrill VPN...





10Gates

201311  VXLAN

 

201210 Trident2



20119 VXLAN

& 


 

SDN
  
   




 &
V

V
OpenFlow

V V

V

V M V M V M

vSwitch
(VTEP)

VV V MM M
vSwitch (VTEP)

VV V MM M
vSwitch (VTEP)

NFV

VSR

vFW

vLB

...

vSwitch (VTEP)



VXLAN + Service Chain 

TOR

TOR

TOR

Fabric Network

Core

Core

Overlay
controller

Label vxlanID

C
L2

C

C

T

VM

VM

VM

OVS Hypervisor


T

Label vxlanID

L2

VM

VM

VM

OVS
Hypervisor


C

Label vxlanID

L2

T

VM

VM

VM

OVS Hypervisor


Service ChainL3-L7

Leaf
vSwitch

 Leaf
vSwitch

Spine

Spine

VxLAN Network

Leaf vSwitch
NFV

Leaf
vSwitch

Leaf
vSwitch

 Leaf
vSwitch
NFV

V M V M V M V M V M V M V M V M V M V M V M V M

APP

Service Nodes

WEB

Gateway

NVFL4-L7

WEB

APP

DB

VFW

VFW

VPC

VLB VRT



vSW

vRT

vFW

vLB

vIPS

etc.

Hypervisor



SDN
   





 &VTEP



 



 vRoutevLB



vFW,etc.



...

  

  

       

Fabric&

Controller


Controller


Controller







 

X





B1

B2

Core1

Core2

  

 

Tor1

Tor2

Tor3

Tor4

 

Tor1--Tor4SPF

 Star=Tor1Tree={T1}Candidate={Core1Core2}

 Tor1 - Core1  Tor1 - Core2 Tree={Tor1Core1/Core2} Candidate ={Core1-Tree2Core1-Tor3 Core1-Tor4Core1-B1Core1-B2}

 Core1-Tor4Tor4

 Tree={Tor1Core1/Core2Tree4}



manager

SNMP

CLI

Agent

AAA

L3 Protocol

BGP

OSPF

VRF

BFD

L2

Port

VLAN

LLDP MSTP

MIRRO LACP

VRRP QoS ACL

SDK

L3

Open Flow Agent
SDK L3

SDN

/
 



OVS ODL DPDK &OVS

SDN, 


wadeshao@tencent.com wade_shao

Q&A

