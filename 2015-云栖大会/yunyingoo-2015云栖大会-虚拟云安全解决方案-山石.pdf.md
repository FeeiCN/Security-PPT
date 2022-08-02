
  


IT 

 

 

 





IaaS

 VM 

 





VM VMM Security GroupVMACL
VPC DDoSL3 VPCACL

 OS 
 L7 VPN



SDN







 

 

 

  


l  - VPC
- 
l 
- Defense-in-Depth - OS
l 

·

VPC

Internet



VPN 
 

1

2


 
n






  vFW

vSwitch

vSwitch

1

2


l  l 

l VPCvFW l VPC

l  
l  

SCVPN



A



 A

vFW VPN

A vSwitch

B vSwitch

1

2


l  l  l 

l VPC l  l SCVPN

l VPNPC l  l 


IPSec VPN

VPN

VPN



A
vSwitch

vFW VPN
vSwitch

vFW VPN
vSwitch

B
vSwitch

1

2

1

2


l VPC l  l 

l VPC l IPsecVPN

l  l  l IPSecVPN
 l 







vFW 


l VPC 

l VPC l 


vSwitch

vSwitch

1

2




l  
l  

+iQOS

VPN

u VPN

1


1
u 





 
3 

A
2
vSwitch

vFW
B
2
vSwitch

1

2


l   
l  l 

l VPCNAT l AAA l  l iQOS

l   
l  l QOS


IPS

 VPC 

vSwitch


  
vSwitch

1 A

2



l VPC l VPC


l VPC l  l 

l  l  l / l Botnet

·

 

IPSec VPN SCVPN  

 



L2-L7   

----





VPC

 VPC 







  


...

