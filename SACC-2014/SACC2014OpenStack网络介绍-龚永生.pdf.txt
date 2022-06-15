OpenStack
 @UnitedStack  robingong2004 www.ustack.com

Contents
· OpenStack · openstack · Neutron · Neutron · Neutron

OpenStack
     CODE      IaaS, PaaS, SaaS


 community with more than 17,114 individual members and 390+ supporting organizations across 139 countries
 The Icehouse release had 1,202 contributors, a 32 percent increase from the Havana release six months ago. Approximately 350 new features and 2,902 bug fixes were added in the Icehouse release cycle, with a focus on testing, maturity and stability
 communications
 IRC, mailist, various meet-up across the world

IRC

Meetup



 technique committee - scrum of scrum

 elected by ATC for every release

 Project Technique lead - PTL

 elected by developers for every release

 core developers

 to triage bugs, reviewing and approving patches

 design and implement new features

 nominated by PTL from active developers

 developers

 any one can submit the codes to

implement new features, fix bugs write

documents.

 encouraged review patches.

PTL OpenStack

compute

OpenStack ... TC
OpenStack network PTL
developers Core developers

developers Core developers


 Launchpad
 webbug
 Gerrit
 web 
 CI
 Jenkins based build and gate system
 devstack
 

 bug
1 launchpadbug 2 3
4 bug
5

OpenStack

OpenStackNeutron

Horizon

Nova Neutron

Cinder Swift Trove Ceilometer

Keystone

glance

nova sub module nova-network

neutron


· OpenStack · openstack · Neutron · Neutron · Neutron








[[local|localrc]] Devstack sample control
disable_all_services
ENABLED_SERVICES=g-api,g-reg,key,n-api,n-cond,n-sch,n-novnc,n-cauth,
horizon,neutron,q-svc,rabbit,mysql
HOST_IP=192.168.13.57 Q_PLUGIN=ml2 DATABASE_PASSWORD=root RABBIT_PASSWORD=password SERVICE_TOKEN=token SERVICE_PASSWORD=password ADMIN_PASSWORD=admin ... [[post-config|/etc/neutron/neutron.conf]] [DEFAULT] router_distributed = True [[post-config|/etc/neutron/plugins/ml2/ml2_conf.ini]] [ml2] type_drivers = local,vxlan tenant_network_types = vxlan mechanism_drivers = openvswitch,l2population [ml2_type_vxlan] vni_ranges = 100:300

Devstack 
[[local|localrc]] disable_all_services ENABLED_SERVICES=n-cpu,rabbit,neutron,q-agt,q-l3 SERVICE_HOST=192.168.13.47 HOST_IP=192.168.13.49 MYSQL_HOST=$SERVICE_HOST RABBIT_HOST=$SERVICE_HOST ... [[post-config|/etc/neutron/neutron.conf]] [[post-config|/etc/neutron/l3_agent.ini]] [DEFAULT] agent_mode = dvr [[post-config|/etc/neutron/plugins/ml2/ml2_conf.ini]] [ovs] local_ip = 192.168.13.49 [agent] tunnel_types = vxlan,gre enable_distributed_routing=True arp_responder = True l2_population = True


· OpenStack · openstack · Neutron · Neutron · Neutron

OpenStack neutron

 virtual network management
 L3 router service  VPN service  Firewall service  Load balance
service

metadata-agent
Neutron server & plugin

DB

MSG Queue

l3-agent
vpn-agent <l2> agent
DHCP agent
lbaas-agent

neutron server
http://www.slideshare.net/gongys2004/inside-neutron-2

Neutron plugins

Core plugins by neutron community 1 Open vSwitch Plugin (deprecated) 2 Linux Bridge Plugin(deprecated) 3 Modular Layer 2 Plugin (linuxbridge, ovs bridge,
openddaylight ...
4 Ryu OpenFlow Controller Plugin (NTT) 5 Big Switch Controller Plugin 6 Cisco UCS/Nexus Plugin 7 NEC OpenFlow Plugin 8 Nicira Network Virtualization Platform (NVP) Plugin 9 Cloudbase Hyper-V Plugin 10 MidoNet Plugin 11 Brocade Neutron Plugin 12 ...

Service plugins Load Balancer Service Plugin L3 router Service Plugin Firewall Service Plugin VPN Service Plugin




· OpenStack · openstack · Neutron · Neutron · Neutron

Neutron Core models

show neutron features on ustack
 www.ustack.com
 floating IP on router  HA router  port forwarding  PPTP VPN  multiple subnets on floatingip  hundreds of bugs


· OpenStack · openstack · Neutron · Neutron · Neutron


1. Ovs bridge is used to connect VMs to physical eth nic
2. VXLAN tunnel is used to isolate Networks. Vlan or GRE can also be used
srchttp://docs.openstack.org/admin-guidecloud/content/figures/14/a/a/common/figures/OVStunneling.png



http://docs.openstack.org/admin-guide-cloud/content/under_the_hood_openvswitch.html#under_the_hood_openvswitch_scenario1




http://docs.openstack.org/admin-guide-cloud/content/under_the_hood_openvswitch.html#under_the_hood_openvswitch_scenario1

L2poparpresponder

Problem:

arp-request:who-has 10.1.23.7?

fa:16:3e:73:47:84 10.1.23.7

ARP responder avoids the broadcaset
Arp proxy

FDB entry in the form of ovs flow
· cookie=0x0, duration=13.576s, table=20, n_packets=0, n_bytes=0, idle_age=20, priority=2,dl_vlan=1,dl_dst=fa:16:3e:73:47:84 actions=strip_vlan,set_tunnel:0x66,output:2
· cookie=0x0, duration=13.763s, table=21, n_packets=0, n_bytes=0, idle_age=20, priority=1,arp,dl_vlan=1,arp_tpa=10.1.23.7 actions=move:NXM_OF_ETH_SRC[]>NXM_OF_ETH_DST[],mod_dl_src:fa:16:3e:73:47:84,lo ad:0x2>NXM_OF_ARP_OP[],move:NXM_NX_ARP_SHA[]>NXM_NX_ARP_THA[],move:NXM_OF_ARP_SPA[]>NXM_OF_ARP_TPA[],load:0xfa163e734784>NXM_NX_ARP_SHA[],load:0xa011707>NXM_OF_ARP_SPA[],IN_PORT

DVR

VM3 VM4

VM2

VM1





1.  2. 

DVR Floating IP 1:1 NAT

VM4

VM3 VM2



VM1

   

DVR 1:N SNAT

VM4

VM3 VM2



VM1

   

DVR floatingip traffic flows


eth1

br-ex

fg-xx

fg-xx

VM eth0

fip-<fip netid>
fprxx

1:1 floatingip

snat<rid>

veth rfpxx
1:N snat

from fip rule 16 from subnetcidr rule xxx

tapxx vlan 1

sg-xx vlan 1

qr-xx vlan 1

br-int

qrouter-<rid>

patch-tun

patch-int
br-tun



NFV
· 
1. Packets per second target -> either SR-IOV or an accelerated DPDK-like data plane: 2. "SR-IOV Networking Support" (https://blueprints.launchpad.net/nova/+spec/pci-
passthrough-sriov) 3. "userspace vhost in ovs vif bindings"
(https://blueprints.launchpad.net/nova/+spec/libvirt-ovs-use-usvhost) 4. "Snabb NFV driver" (https://blueprints.launchpad.net/neutron/+spec/snabb-nfv-
mech-driver) 5. "VIF_VHOSTUSER" (https://blueprints.launchpad.net/nova/+spec/vif-vhostuser)
https://wiki.openstack.org/wiki/Meetings/NFV


 OpenStack http://docs.openstack.org/admin-guidecloud/content/
 Neutron wiki https://wiki.openstack.org/wiki/Neutron
 inside the Neutron http://sdrv.ms/YdnQYS  inside neutron 2
http://www.slideshare.net/gongys2004/insideneutron-2  UnitedStack blog http://www.ustack.com/blog/

Q&A

backup

   


 

