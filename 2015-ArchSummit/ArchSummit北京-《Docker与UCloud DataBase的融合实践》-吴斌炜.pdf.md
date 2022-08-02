DockerUCloud DataBase
@UCloud 2015-12-19



 UCloud  
2011 2013UCloud  redis Mongodb

UCloud DataBaseDocker UCloud DataBase Docker Docker

UCloud DataBaseDocker UCloud DataBase Docker Docker


 API    
IAAS io  


  




 
App App App
Binaries/ Binaries/ Binaries/ Libraries Libraries Libraries
Guest Guest Guest Kernel Kernel Kernel
Hypervisor(VMM) Host Kernel Hardware


Docker

App App App
Binaries/ Binaries/ Binaries/ Libraries Libraries Libraries
Docker Engine
Namespace & Cgroup & aufs/overlayfs
Host Kernel Hardware
Docker

Docker
namespace
cgroup aufs

namespace

cgroup
cgroup?
· cpu
· memory · blkio
· cpuset,  freezer,  net_cls,   net_prio,  devices,  perf,   cpuacct,   hugetlb
mount   ­t  cgroup   none  /cgroup

"Containerulimit" /cgroup

cont1

cont2

apache mysql

ftp

group1:  3072Mcpu80%   group2:  1024Mcpu20%

aufs overview
· Another  Union File  System        Overlayfs

/base boot bin lib lib64 usr sbin
/app1 emacs

/Container1 boot bin lib lib64 usr sbin emacs

mount -t aufs -o br=/base=ro:/app1=rw none /Container1

Docker & VM


Docker ++ -> +

Build

Ship

app  

ship app-QA 

Run
runapp  PC 

UCloud DataBaseDocker UCloud DataBase Docker Docker

Mongodb     Mysql

Mongodb Docker

DockerMongodb

Feature High Performance Scale--up Scale--out High Availability Cost Deployment/Maintenance Security

Docker   -- --   

MongoDB  --   -- -- --

Docker  SDN /proc/cgroup

 Docker + LVM 

SDN
pipework br0 instance_name 10.10.101.150/24@10.10.101.254

SDN

/proccgroup
docker --volumns /var/lib/lxcfs/proc/:/docker/proc/


 IDC      


Docker  IDC docker  

-kubernetes

     
  

-kubernetes

-kubenetes
  
container pod controller service labels & selector scheduler



 



UCloud DataBaseDocker UCloud DataBase Docker Docker


Docker
logdrive
Docker Daemon
centos  6.3  service  stop5mininit-scripts bug Daemoncontainer
Docker
NATnf_conntrack:    


Docker Image
 Dockerfile

Docker Cgroup DB1.6

 



docker0  DB DNS

SELinux/GRSEC 
Docker Daemon
 root

THANKS
weixinhao2015

