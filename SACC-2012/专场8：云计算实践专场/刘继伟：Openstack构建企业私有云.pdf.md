OpenStack 

Content
 1   2OpenStack  3OpenStack  4OpenStack  5OpenStack//  6KVMOpenStack  7  8Q&A

 VS 
     

     

     

Why OpenStack
14 12 10
8 6 4 2 0

M$ (year)

Why OpenStackEvolving Ecosystem
180+ organizations, 3000+ developers

Why OpenStackOpen
Open

Open Source

Open Design

Open Development

OpenStackConceptual Architecture

OpenStackConceptual Architecture

OpenStack



 





OpenStack

OpenStack

 mac

 cobbler





OpenStack

libvirt_use_virtio_for_bridges=true fixed_range="10.0.0.0/24" public_interface=em2 dhcp_lease_time=10800 multi_host=true use_single_default_gateway=True #instanceip(:lease_time)

dashboard nova-api
Novascheduler
Glance ...
em 1

nova-compute nova-network

118.26.**.56

em

em

em

1

2

3

10.0.0.0/24

10.0.1.0/24 switch

Manage/glance network
floating network private network

10.0.0.6

10.0.1.6

VM

OpenStack

 &  &

OpenStack




& 

OpenStack
Load Balancer

1 zone = 1/5*2Tdisk

zone1(server)/proxy
A/C/O server A/C/O server A/C/O server
...
A/C/O server

zone2(server)/proxy
A/C/O server A/C/O server A/C/O server
...
A/C/O server

zone3(server)/proxy
A/C/O server A/C/O server A/C/O server
...
A/C/O server

zonen(server)/proxy

A/C/O

server

A/C/O

...

server

A/C/O

server

...

A/C/O server

OpenStack
· log
­ api
· 
­ cloudfuselinux/keystone http://blog.lightcloud.cn/?p=29

OpenStack

 







OpenStack

 
NGINX

ftp
twisted

        
tornado

swift

 
mongodb

KVMOpenStack
· kvmopenstack
­ openstackkvm /VNC
­ https://github.com/lightcloud/kvm2openstack
­ 1 libvirtkvmnovadb
­ 2 kvm
· dashboardkvm · kvm



Q&A
/
join us!
@halfss liujiwei@gamewave.net
url: www.lightcloud.cn blog: blog.lightcloud.cn

