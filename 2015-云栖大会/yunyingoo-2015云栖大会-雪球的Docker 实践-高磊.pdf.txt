 Docker 
 

 content

Day0 Day1 Day2 Day3 Tomorrow

----
· http://xueqiu.com · 2010C   ·  · More ·  · DAU  1M 1.5G ·  200+ECS  50+ 1k+

Day0

Day0
·  vs VM  vs Container  vs Cloud  VM  

·  ·  · 

·  ·  · 



·  · CPU  /   · Kernel  

·  OS
VM

Cloud  VM

·  ·  ·  · 

Docker

· Build->Ship->Run ·  · 

LXC

·  AUFS   · Daemon  

Day1 Docker
---- 



1

Dockerfile

2


Docker ImageRegistry

3


Daemon


· Docker Base  Image   ·  ·  Dockerfile
· Docker  Image  · 
·  ·  ip_forward=1 ip/gw · Daemon/sbin/init

vs

Gitlab

Xueqiu

Base  Images Project  Images

+  jdk6

Ubuntu-- upstart
+static.sh +runtime.sh

base

+  jdk8

+  nodejs

+  python

JDK6

JDK8

+  resin

+  resin

Resin-- JDK6

Resin-- JDK8

NodeJS

Python

+  business

+  business

+  business

+  business

+  business

Biz--A

Biz--B

Biz--C

Biz--D

Biz--E

Project  Containers


· Registry  2.0 ·  ·  https://github.com/docker/distribution/issues/422 · Push   · 


·  · Bridge  Flatbridge_ports  · Bridge  NAT · Host  
· BridgeFlat ·  ·  ip_forward  iptables ·  x_*xt_*nf_*iptables_*   
·  · CPUperiod  +  quota · Memorydisable  swap · 4  core  8G


· IPMAC ·  eth0  IP
IP="aa.bb.cc.dd"
· --mac-address  MAC MAC_TXT=`echo  "$IP"  |  awk -F'.'  '{print  "0x02  0x42  "$1"  "$2"  "$3"  "$4}'` MAC=`printf "%.2x:%.2x:%.2x:%.2x:%.2x:%.2x"  $MAC_TXT`
· HostnameHostsDNS ·  · 
· Daemon   · /sbin/init  PID=1  entrypoint


·  · sshd · 
·  ·  rw  /persist    Docker IP   ·  /persist/logs    logs   · 
·  ·  ·  cgroups  CPU  /  MEM  /  NETWORK  /  BLOCKIO ·  Docker exec  API   metrics

Day2
---- 

Docker Docker
192.168.1.1 192.168.1.2

Docker Docker
192.168.2.1 192.168.2.2

Gateway  192.168.1.254 BridgeIP 192.168.1.1/25
docker0

Gateway  192.168.2.254 BridgeIP 192.168.2.1/25
docker0

eth0

eth0

ECS  172.16.1.1

ECS  172.16.1.2

vSwitch 172.16.1.0/24

vRouter
to  192.168.1.1/24  via  172.16.1.1 to  192.168.2.1/24  via  172.16.2.1

VPC  ECS ·  BridgeNAT ·  ip_forward  iptables  ·  ECS   Docker C
VPC  vRouter ·  ECS  
 ·  ·  · 
 · OVS  /  Flannel

Day3 Rolling
---- 


·  Capistrano ·  Git  ·  ssh · 
·  ·  ·  RC   ·  ·  ·  ·  ·  IDC   Cloud  VM   · ......


      Hook IDC

Capistrano  ssh "" Shell Local  Shell 

Rolling  Docker API ""
Web Registry
 Web


Gitlab

Jenkins

Rolling

Build Deploy

Build

Ship

Run

Resource  Scheduler

C

Docker API

Docker API

Docker API M D

B

Machine

Machine

Machine

Docker Registry

Rolling  ­ 

Rolling  ­ 

Rolling  ­ 

Tomorrow

+
·  · Docker  · 4  core  8  G · Blockio quota · Network  quota
·  · Docker  Metrics   · 

 lostleon gaolei@xueqiu.com

