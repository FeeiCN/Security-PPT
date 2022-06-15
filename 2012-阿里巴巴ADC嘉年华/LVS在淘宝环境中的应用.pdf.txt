LVS
_  


_----
 IDC TCP/IP4/7 CDNDDOS · 2007.4~2011.5    4 · 2011.5~   LVS 

1. LVS- 2. LVS- 3. LVS-fullnat 4. LVS-synproxy 5. LVS-cluster 6. LVS-performance 7. LVS-todo list



-why
Q: Apache

-why
A: DNS

-why
Q1apache2 downremove Q2WRR Q3apache Q4

-why
A: Virtual Server

· 4Load Balance
­   ­ WRR/WLC  ­ NAT/DR/TUNNEL ­ TCP/UDP

-what

· NAT

-what

IN(2)DNAT OUT(4)SNAT

· TUNNEL

-what

IN1IP OUTNULL

-what
· DR
INMAC OUTNULL

-
· LVS
­ ip_vs ­ 
·Q
­ RealServer down ­ LVSdown

-
·A
­ RealServer down ---  ­ LVSdown---LVS
· Keepalived ­ LVS
­ 4/7 ­ VRRPHeartBeat ­ --- 
Keepalived ­f /etc/keepalived/keepalived.conf
QLVSSNMP Patch

-
CDN LVS DR


· LVS
­ 
· LB
­ TCPDDOS
· 
­ 

· 

DR-
1. LVS-RSVLAN 2. RSVIP

INMAC OUTNULL

· 

NAT-
1. RS/ROUTER

IN(2)DNAT OUT(4)SNAT

· 

TUNNEL-
1. RSIPIP 2. RSVIP

IN1IP OUTNULL


· LVS
­ FULLNATLVS-RealServervlan in/outLVS
· 
­ SYNPROXYsynflood ­ TCP FLAG DDOS
· 
­ Cluster

FULLNAT
· FULLNAT
­ local addressipcip-vip lip->rip lipripIDCipvlan 
­ keepalived
virtual_server 125.76.224.240 { lb_kind FNAT/DR/NAT/TUNNEL local_address { 192.168.1.1 }

· FULLNAT

FULLNAT

· NAT

FULLNAT

· FULLNAT

FULLNAT

· NAT-HOOK

FULLNAT

NETFILTER HOOKiptables 2HOOK

· FULLNAT-HOOK

FULLNAT

 IN/OUT 

· NAT-session

FULLNAT

client addresshash key

· FULLNAT-session

FULLNAT

hashhash key

FULLNAT
· FULLNAT-client addressTOA
TOA address of tcp option

FULLNAT
· FULLNAT-
­ TCP OPT-TIMESTAMP
· RealServer kerneltcp_tw_recycle · ABtimestamptimestamp
­ TCP OPT-MSS
· TCPackGET · GET>1toa
­ TCP - Sequence
· RealServertimewaitsocketseq

SYNPROXY
· SYNPROXYsynflood
­ linux tcpsyncookies LVS-seqsynackackack_seq -TCP
­ 
virtual_server 125.76.224.240 { syn_proxy

· SYNPROXY

SYNPROXY

SYNPROXY
· SYNPROXY-
­ TCP - Sequence
· Lvs->client  apache->lvssyn_ackseq
­ TCP OPT
· Lvs->client syn_acktcp optmss/wsale/sack
­ Session reused
· NATip/portLVS
­ Ack Storm
· Tcp seqack storm

CLUSTER

PERFORMANCE
· IPVS
­ 11cpu ­ session hash table ­ session hash bucket lock ­ cache ­ LOCKLESS ­ Westmere(nehalem)/bios

PERFORMANCE
· 
­ rx_buffertx_buffer

PERFORMANCE
· 
­ Nrx_bufferNtx_buffer, N=CPU

PERFORMANCE
· ­ CPU
­ Cat /proc/interrupts 54: 188324418 0 IR-PCI-MSI-edge eth0-TxRx-0 55: 167573416 0 IR-PCI-MSI-edge eth0-TxRx-1
­  echo 01 > /proc/irq/54/smp_affinity echo 02 > /proc/irq/55/smp_affinity

 performance ­ 
· RPS(receive packet steering)

PERFORMANCE
· RPS
­ cat /sys/class/net/eth0/queues/rx-0/rps_cpus cat /sys/class/net/eth0/queues/rx-1/rps_cpus
­  echo 01 > /sys/class/net/eth0/queues/rx-0/rps_cpus echo 02 > /sys/class/net/eth0/queues/rx-1/rps_cpus

· KEEPALIVED
­ Select->epool ­ reload

PERFORMANCE

PERFORMANCE
· 
­ LRO/GRO ­ irqbalance ­ procnet.core.netdev_max_backlog

PERFORMANCE
· 
­ Synflood350w pps ­ Ack/rst/fin-flood800w pps ­ HTTP150w pps ­ New tcp connection30w ­ MAX session4000w (24G memory) DELL R610(E5645 @ 2.40GHz) Intel 82599 NIC

· 
­ Ipvslockless ­ Keepalived ­ sandybridge - DDIO
· 
­ ip..... ­ GRO(LRO)
4/7

Todo List

  Q&A
 _

