
Docker
Shawn  

  
¨e4gle   ¨Linux   ¨UNIXUNIX chinaunix   ¨MAC   ¨Kiwi.ai@qq.com  

  
l citypw(   Shawn   Chang),   GNU/Linux,    Hardnedlinux,
l citypw@gmail.com

  
¨Docker   ¨   ¨   ¨Docker   ¨Docker   ¨GRSEC  

Docker  
  

Docker  
Linux 

PaaS

Docker

 

 

  
  

  


KVM/ VMs

 
root

 


LXC 

  

  
¨syscall   ¨root   ¨NS   ¨  
  

  
¨   ¨   ¨   

Syscall  
hIp://lwn.net/ArLcles/268783/  

root  
¨   ¨   ¨  

NS  
¨LinuxNS   ¨Docker5Process Network Mount Hostname Shared Memory   ¨SELinux Cgroups/sys /proc/sys/dev/sd* ...  

  
¨   

Docker  

Docker  

Docker  
¨: PaaS   ¤KVM/VMs   ¤Docker   

Docker  
¨docker   

  
¨Docker   ¨Docker  

Docker  

Docker  
¨   ¨Capability   ¨NSCgroups   ¨SELinux/AppArmor  

  
¨  
¤. /sys. /proc/sys. /proc/sysrq-trigger. /proc/ irq. /proc/bus  
¨  
  

Capability  
¨Linux Capability Capability   ¨Capability  

NSCgroups  
¨   ¨Cgroups  

SELinux/AppArmor  
¨MAC   ¨sVirtlibvirtSELinux   ¨MCS  

sVirt  
¨    
  

MCS  
¨MCSSELinuxsvirt_t libvirt MCS libvirtMCSSELinux MCS   

Docker  
  

Docker  
¨   ¨root   ¨MAC   ¨   ¨   ¨  
     

PaX/Grsecurity  

PaX/Grsecurity  
¨Linux   ¨   ¨LSMAppArmor/SELinux/etc)    ¨RBAC  

  

  
(MAC)        

SELinux   Apparmo r  

  

  

  

  

     

PaX/Grsecurity  
        

ptrace  

        

LSM     

     

     

     

     

     

     

     

Offset2lib  
¨LinuxASLR   ¨glibc  

Offset2lib  
" "NX(stack)ASLR +PIE()SSP canary  
  
GNU/Linux13   PaX/Grsecurity:2001   

Offset2lib  
http://cybersecurity.upv.es/attacks/ offset2lib/offset2lib.html
  
http://www.solidot.org/story?sid=42174
  

Offset2lib  

2  
CipherGatewayPaX/Grsecurity Docker   http://hardenedlinux.org/system-security/2015/09/06/ hardening-es-in-docker-with-grsec.html  

Docker....  
1PaX/Grsecurity   2LSMMAC   3CAPABILITY  



