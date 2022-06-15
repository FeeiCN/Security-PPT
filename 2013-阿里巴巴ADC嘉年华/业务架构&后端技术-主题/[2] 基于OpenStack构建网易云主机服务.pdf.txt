OpenStack 
 


· OpenStack ·  ·  · OpenStack ·  ·  · Q&A

OpenStack
· 
­  
· 
­ NASARackspace ­  ­ 6 ­ OpenStack

OpenStack
· 
­ Compute (Nova) ­ Networking (Quantum) ­ Block Storage (Cinder) ­ Object Storage (Swift) ­ Identity (Keystone) ­ Image Service (Glance) ­ Dashboard (Horizon) ­ Orchestration Service (Heat)

OpenStack

AWS

Nova Quantum
Swift Cinder Keystone Heat Horizon

EC2 VPC S3 EBS IAM CloudFormation Console

OpenStack VS. Amazon AWS


· WEB 
­  ­  ­  ­ 



· IaaS IT
· PaaS 


· 
­   IT
· 
­ OpenStack ­ OpenStack ­ OpenStackBugs ­ OpenStack ­  ­ 


·  ·  ·  ·  ·  · 


· 2012.3OpenStack · 2012.4OpenStack E · 2012.11OpenStack E
 · 2013.3F · 2013.4 · 20137
­ 8 ­  ­ 13 ­ 

OpenStack
·  ·  ·  ·  ·  ·  · ...... ·...


· 
­  ­ 

· 
­ 
· 
­  ­  ­ 
· QoS
­ CPU

 QoS
· 
­ ECU ­ 1ECU1/4 Intel E5 26501/3 AMD 6276
 ­ (1VCPU X 1ECU, 1VCPU X 2ECU, ...)

· 
­  ­  ­ 


 QoS
· 
­ cgroup cpu ­ cgroupshare/period/quota
· ECUcpu.shares(ECU X 1024) · cpu.cfs_period_us100ms · cpu.cfs_quota_us
­  ­ I/O
20%+

 QoS
­ CPU 10%
· OpenStack
­ ECU ­ FlavorECU ­ OpenStackECUFilter ­ ECU
ECU ­ Libvirt DriverECUcgroup ­ ECU

QoS
· 
­ 
· 
­ Linux TC 
· TC rate · TC ceil ·  · (ECU)


QoS
­ 
· OpenStack
­  ­ OpenStackNetworkFilter ­ 
 ­ API ­ 


·  ­  ­ 
·  ­  50%+
·  ­ (4M) ­ 





OpenStack
· 
­ OpenStack FlatDHCP ­ VLAN
· VLAN4096 · VLAN
­ IPSET + IPTABLE
· 
­ (Floating)IP

OpenStack
· 
­ IPIPIPIP ­  ­ IP ­ IP
 ­ IP


· IT ·  ·  ·  ·  · 


· 
­ Debian 7.0 + Linux 3.2.x ­ KVM + Qcow2 ­ RAID1RAID0 ­  ­ FlatDHCP + multi_host
· 
­ VHostNetKVM ­ 
10%+


· 
­ CPU: Intel/AMD ­ / ­ /
· 
­ RabbitMQGlanceKeystoneNova-api
· Puppet ·  · 



· NovaGlance 
· Bugs Commit
· OpenStack Review
· G Nova16Bugfixs
· H

NovaG


· 

BugBug Fixed

Component Nova Glance
Keystone Total

# of Testing API 121 14 46 181

Bugs Reported 21 2 16 39

Bug Fixed 16 2 15 29


· 
­ QuantumVxlanOpen vSwitch
· OpenStackLXC ·  · ...... ·...

Q & A
xiaolongzhang.zju@gmail.comGtalk



Upload:
image

glance
3 4 0
image = 3+4+0

backend storage
1 4 2 5 3 6
0

Metadata Database



Download:

glance

1 4image 3

Chunk Cache
0 1 5 3 6

4

backend storage
1 4 2 5 3 6

image = 1+4+3
Metadata Database


· 
­ Resize ­ ssh
· 
­ ResizeQcow2BaseCow 
­ rsync shell
· 
­ Cow ­ resize ­ rsync daemon


· 
­ CPU 13
­  
· 
­  
­  


· TimeOut
­ Nova-compute // 
­ Fork Nova-compute  
· 
­ Windowswarning NBDNBD
­ 


· Conntrack
­ NAT conntrack
­ 65536 ­ net.ipv4.netfilter.ip_conntrack_max
· Conntrack
­ sysctl ­pnf_conntrack_ipv4 Conntrack
­ nf_conntrack_ipv4


· 
­ OpenStackAvailability Zone 
­  
­ 
· IP
­ ip_nonlocal_bind
· OS
­ APIOS


· jira/git/gerrit/jenkins · 

