ArchSummit2015

 yangyi@baidu.com



http://bce.baidu.com



http://yun.baidu.com



·  ·  ·  · 

 ­ Network as a Service

· IaaS

SaaSSoftware as a Service

 

 

 

 

PaaSPlatform as a Service

 



 

IaaSInfrastructure as a Services







 ­ 
http://baike.baidu.com/view/33936.htm

 ­ 

API/Console

Management

Configuration

Load Balance Firewall NAT

VPN

DNS

Service
Service Chain VPC

Tenant 1

Tenant 2

 ­  Virtual Private Cloud

· 1

· 2
User

1

2

3

Web App DB

· 3
Public Cloud VPN/
Private Cloud

 ­ 

 
   

 100 q/s

 1/

 

IP// //DMZ



vlan4K

+



SLA99.95%

 ­ SDN
https://www.opennetworking.org/images/stories/downloads/sdn-resources/solution-briefs/sb-sdn-nvf-solution.pdf



   


openstack neutron
overlay / vxlan
openvswitch / openflow  NAT

    

 VxLAN
https://blogs.vmware.com/vsphere/2013/07/vxlan-series-how-vmotion-impacts-the-forwarding-table-part-6.html

 openstack neutron
http://blog.gampel.net/2015/01/dragonflow-sdn-based-distributed.html







 



 ­ 

DB 
NN 

neutron-server -> LB

l2-pop  

 zmqqpid broker

 ­ vRouter
·  ·  · 

 ­ 

· 
­ 

Internet
OSPF for floating IP CIDR

BVRouter Cluster
· dpdk + ECMP

BvRouter

BVRouter

­ vrouter5*N

­ NN -> 

­ 100 -> 5000

BVRouter

· 
­ ARP ­ NN

OSPF for VTEP IP

BVRouter Physical Switch

CN1

CN2

CN3

L2 populationARP
http://www.xlgps.com/article/10555.html

NeutronScale
· 
­  ­ port up ­ agentsync
· 
­ "" ­ networknamespacednsmasq... ­ 

 ­ 

· Sharding

­ 

Management

loigical network/subnet/ports

­ 

location of ports, tunnel ...

 
Northbound

  

·  Control 
­ RPC ­ openflow
Data
· overlay
­  ­ 

SDN  

SDN  
SouthBound

SDN  

 

 

 

 

VM

Container


·  ·  · SDN · 

