ArchSummit 2015
SDN


·  SDN · 
·  SDN  · Flannel · Calico · Weave
· 

 SDN
 


·  ·  ·  ·  · 

Pipework

Docker Bridge
·  · Linux bridge  · iptables NAT  · ip_forward 

Docker Bridge

·  IP 

· NAT 

· IP 

· Bridge 

· NAT  · 



· blahblah...

Flannel



-udp

-vxlan

Calico
·  Router · 



/

Weave
·  Routercontainer · Router  TCP  · Router  UDP/vxlan 



·  Router  Full Mesh  ·  · 

-old
·  pcap  · wRouter  UDP  ·  UDP

-new
· wRouter  · wRouter  odp Flow 
 · odp  vxlan 

/
· DNS Server  docker0
· Container  dns server  docker0
· DNS Server  wRouter 


·  ·  ·  weave
bridge · 
 docker0



Docker Bridge


Flannel

Weave





Calico 

 

etcd



NAT 

 



 

 Bridge + NAT

 

IP

udp  vxlan 

etcd
UDP/vxlan 
IP

IPAM

IPAM

pcap  odp 



DNS



TCP mesh  UDP/vxlan

IP

RR/BGP mesh
Linux   BGP


·  ·  IP  · 
· L4/L7 ·  ·  ACL


·  · offload  · 


·  ·  ·  outbound ·  outbound <<  outbound

OpenFlow
·  · Header Fields  ·  Table  Priority  
·  · Idle/Hard Timeout · FlowDelete
·  Nicira

OpenFlow


·   ·  · 
· 

/
·  ·  
· IP  ·  
· L7  ·  Nginx  ·  · etc.


·  Pod/Service/SecurityGroup <-> Pod/Service/SecurityGroup
·  Export  Pod/Service ·  ICMP/TCP/UDP

 FOP


Stage1

Stage2
·  Discovery  Agent 
· FopGate  Discovery   LB
·  Agent ·  ·  ·  worker LB

Stage3
·  Discovery  ·  Agent 
·  Discovery  ·  Agent  LB · FopGate  LB 

Stage4
·  ·  Agent ·  worker
·  worker  

 UFOP


Before
·  · 

After
·  Discovery/LoadBalance ·  · 

-EOF-

