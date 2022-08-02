VPS
    2012-09-13


   
peitong@sogou-inc.com QQ39397166


Ø VPSwhat & why Ø  VPS  Ø  VPS  Ø &&

What - VPS
 VPS"Virtual Private Server""" 
 VPS/IP  CPU 
 VMware xenkvmvirtualbox 

Why - VPS
 
­ / 
­ P2V ­ 
 
­  
­  ­  ­ 

 VPS 
 2009  5000+ 2 * 0.5 
 90G 3.5T
    CentOS 5 + XEN 
CentOS 6 + kvm  4


vm vm vm vm vm
xenbr0 peth0 LAN

 VPS   

 VPS ->->

 
­  wiki  

web

 
­  web    ip 
­  ssh  
­  ­ /


VPS







 VPS ->->

 
­ VPS sogouvps-agent sogou-vps-manager 
­ VPS 
­ /// //ip/... 
­ web ­ ""

 VPS VPS








 "" //


 cpuio  


 
­  · DomU IO  Dom0  ·  dom0 CPU
vm vm vm
xenbr0 peth0
LAN


 
­ 60%~70% ·  · SR-IOV 



 

­  pv0 (sas,raid5)

­ 1IO
·  pv  io vg pvmove
· CentOS 6Control Groups (cgroups)

pv1 (sas,raid5)
vg0
pv2 (sas,raid5)

­ 2 pv3 (ssd,raid0)



pv4 (ssd,raid0)

· 


 
­  ­  dev  srv  srv  ­ 
· CPUsched-credit weight/cap · IOkvmcgroups


  
­ 
· DC
­  ­ / 
· openstack

 Q&A...

