Openstack 
   

Gartner

MSS/SaaS 



 



Hypervisor

Web

 

 01



Openstack 02





 03


 04



05

1 



 






Internet





VPC

Internet






""

ERP Web
HR Web Web DMZ

  

ERP DB

HR DB

DB DB

ERP Web ERP DB
ERP

  

HR Web HR DB HR

Web DB 



222 52

68 201414
1

20156



Breach Timeline
 >84%  >69%

 



 41%

 >66%  >22%
2013 

2013 Data Breach Investigations Report , Verizon



2 Openstack

Why Openstack
CY15-Q1 Community Analysis -- OpenStack vs OpenNebula vs Eucalyptus vs CloudStack http://www.qyjohn.net/?p=3801

Openstack 

Openstack Neutron

Neutron

Namespace

Openstack neutron
· Security GroupPort-Oriented · FWaaSRouter-Oriented

Security Group

VM VM VM

port

port

port

VSwitch

VM VM VM

port

port

port

VSwitch

Hypervisor

Hypervisor

Compute Nodes

FWaaS
Neutron-l3-agent
Policies
VRouter
Network node



vrouter

Dhcp server

Linux bridge

GRE tunnel

Linux bridge

OVS

Openvswitch

VM

VM

VM

Physical network Linux bridge
Openvswitch VM

Openstack+
· 

Openstack+
· 


·  ·  ·  ·  ·  ·  ·...

3 

I
· 

Engine

 


 

VFW VIPS VSwitch

FW FW
NetDev

Tunnel


VFW VIPS VM VSwitch



+

APP Guest OS
VM

APP Guest OS
VM

APP Guest OS
VM



Hypervisor(Host OS)



 






 


...


1.  2. 
 3. SQL



1.  2.  3. API
1
A node2 CVE 
...



1.  2. / 3. / 4.  5. 



...


V-NF

/ /

V-SAS-H

V-IDS/IPS


V-SAS-H

&
V-RSAS


V-SAS-H


NGTP


VSAS-H/VDAS


ALL



4 


1
2

RSA 2015, San Francisco, USA

II
/ + /
-SDS
NFV + SDN

SDS

NSFOCUS Cloud
MSS/SaaS/APPStore

Internet



TE APP Sec APP

 APT

APP

APP



  

SDN



    

 







Switch Switch

vSwitch

SwitchvSwitch

IPS VFWvIPS VIPS
IPS
VSwitch



WAF

FW

WAFW FW F W

VFW

vWAF

vFW

VM VVIPMSVM VMVM

NetDev

VSwitch

VM VM

Tuonvnerelaly

CaseLive protection for Openstack web servers
Security Controller

SDN Controller
Rewrite pkg destination to WAF

Launch instances Push commands

WAF

WAF

WAF

web

CaseLive protection for Openstack web servers
Video

CaseWeb

III ++




IOS

1.  
2. 

5 

 LiveCloud

 LiveCloud



