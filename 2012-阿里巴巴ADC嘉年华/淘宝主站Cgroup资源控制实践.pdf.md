  2012-07

     Cgroup/LinuxContainer    

 xenJava
   3  Xeon48GB    1/3Load0.5  IOcpu  

   
 
 
  cpu
 

 Operating system-level virtualization  , "containers", "jails", chroot  Container
 chroot, UID/PID/IPC/Network Namespace  Control Cgroup (Cgroup)
 
 Linux
 OpenVZ, Linux-VServer, LinuXContainer(LXC)
 Solaris Zones
 FreeBSD Jails

 LXC = Namespace + Cgroup     + 
 Cgroup 
 cpuset
 CPU
 memcg
 
 Page Cache  
 Blkio
 IO  
cfscpu

XEN(

 

KVM() 

CPU
Guest OS CPU 
Guest OS CPU 


balloon driver 
balloon driver 

LinuXContainer (LXC)



cpusetCFS Cgroup 



XEN( 

KVM() 

LXC



   

OS 













·http://www.linux-kvm.org/page/CPUHotPlug ·http://virt.kernelnewbies.org/TechComparison ·http://en.wikipedia.org/wiki/Comparison_of_platform_virtual_machines

 
 ""
 CgroupCPU/  
 
   
 os      
 ForkBombCgroup  
 Memcgbuffer
 ProcContainer top/sar/free/iostat  

 /proc""  ContainerLoadCPU
 Patch  UpstreamSMPLoad
--Bug  CPUContainer
CPUsteal time
 Container/proc/meminfo
 Patch  Buffer  Cgroup

   Hotspot GC(-Xmx)mem cgroup
(hard limit)   
   Page cache  JavaGC  
GC   

 CgroupHotspot GC
 ""GC 
  cgroup
 GC (overcommit)
 GC(-Xmx)memcg(hard limit) 

 Container
 Shares: Container 
 Pages: Container
  = Shares / Page 
 
 Container
 Container()
   idle_tax [1, +)   = Shares / Pages * ( + idle_tax * (1 ­ ) )
 Vmware ESX Server

 
 Full GCYoung Gen 
 Full GCkswapdFull GC direct reclaim
 Page cache
 ParallelGC collectorCMS  numa aware
 numa  ParallelGC collectornuma-aware
Container
 oom GC

   

 UpstreamLoadBug
 [Patch] sched: Cure load average vs NO_HZ woes  [Patch] sched: Cure more NO_HZ load average
woes  [Patch] sched: Fix nohz load accounting ­ again!  [PATCH] sched: Folding nohz load accounting
more accurate

 Container , 
 [patchset] idle page tracking / working set estimation from Google
 Eventfd  
Hotspot JVM  kernel patch changed lines3k  HotspotAttach APIFull GC
madvise()()  700Hotspot patch

 "Memory Resource Management in Vmware ESX Server", Carl Waldspurger

