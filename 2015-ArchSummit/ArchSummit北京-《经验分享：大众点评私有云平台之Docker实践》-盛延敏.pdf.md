Docker 
 


   PAAS    





dockerdocker

CI

Application Deploy 

Console& Workflow

Docker Host & Container lifecycle Management
Container & Host Management

Monitor metrics

Ops

CAT

Docker Host

Docker Host

Docker Host

Image Pull

Image Push(tomcat/nodejs/redis)

Docker Registry


 Docker container
(can we not put all into docker image?)
 Docker containerKVMIP.
 VLANIPAM
 Docker containerssh


PAAS vs DOCKER


Docker Orchestration Docker provision App Lifecycle Service Finding
App Version Management Messaging

Controller
    CPU/

 AZ  tag

Agent
 controllerdocker instance
 docker rootfsmount
mount (Can we put them into dockerfile?)
 docker container
 



router
7.1add   r outer   entr y
SLB & ZK

deploy CI

7.ADD_ROUTE_REQUEST

1.Allocate   Repositor y   and Deploy   app

controller

3.U pload   app   war

 repository

2.ALLOCATE_REPOSITORY_REQUEST

5.Download   app  war

App tracker

4.NEW_INSTANCE _AND_DEPLOY_WAR _REQUEST

Docker    host

PaaS agent

8.INSTANCE_DEPLOYED
health 8.INSTANCE_DEPLOYED manager

Docker instanc
e Docker instanc e

6.  Restar t   ser vice
Docker server

---- nats ---- http

docker
 bridgeVLANIP  IP  

VLAN

Docker Host 1

Container A 10.101.1.31/24
Container B 10.101.1.32/24

10.101.1.11/24 br0

eth0

Container C 10.101.1.33/24

Docker Host 2

Container A 10.101.2.31/24
Container B 10.101.2.32/24

10.101.2.11/24 br0

eth0

Container C 10.101.2.33/24

VLAN X
Physical Network
VLAN Y

CAT(Central   Application  Tracking)

Dockerfile
 RuntimeDockerfile?
 
   Runtime  PaaS  bug


 
 
 Ansible  ControllerAPI  log

Problem
 Docker VM I/O  centOS devicemapper

Solution
 Device mapper loop device

Problem
 Docker VMtop/vmstat/free cpu/memory

 Docker VM Docker Host cpu/memory
Docker VM

Solution
 , Docker VM
Docker VM cpuset/memory
 : nodejs npm crash

Problem
 Docker Host
 Vmcore-dmesgdm_thindevice
mappdercrash

Solution
 blk discardfalse
docker ­d --storage-driver=devicemapper --storageopt dm.mountopt=nodiscard --storage-opt dm.blkdiscard=false

Problem
 Puppet  Docker VM
 Docker VMrootfs
 Layed image  produced b  y D  ockerfile  Volumes  produced i  n  host  machine b  y  PaaS agent  (dynamically  
generated a  t  create  time)
 Puppet
Docker VM(mounted   dir)

Solution
 rootfs


devops  KVM 



 https://github.com/dianping/Dolphin

THANKS

