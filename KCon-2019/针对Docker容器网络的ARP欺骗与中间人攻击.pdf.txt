2019
Zhanlu Lab, Tencent Inc.
DockerARP 
 Kame Wang


· Kame Wang ·  ·  · 

01
PART 01



CONTENTS

02
PART 02


03
PART 03


04
PART 04


PART.01
CLICK ADD RELATED TITLE TEXT, AND CLICK ADD RELATED TITLE TEXT, CLICK ADD RELATED TITLE TEXT, CLICK ON ADD RELATED TITLE WORDS.

· Docker
· ARP

·  · NamespaceCgroup ... ·  (vs )
ü  ü 



Docker
· Docker   (bridge);    Docker.

ARP

· IP vs Mac · ARPIP -> MAC

/ # arp -a ? (172.17.0.4) at 02:42:ac:11:00:04 [ether] on eth0 ? (172.17.0.1) at 02:42:fa:4f:be:25 [ether] on eth0

· ARP · ARPARP

/ # arp -a ? (172.17.0.4) at 02:42:ac:11:00:04 [ether] on eth0 ? (172.17.0.2) at 02:42:ac:11:00:04 [ether] on eth0 ? (172.17.0.1) at 02:42:fa:4f:be:25 [ether] on eth0


· ARP ARPIPMac
·  
·  Https......

Docker

PART.02
CLICK ADD RELATED TITLE TEXT, AND CLICK ADD RELATED TITLE TEXT, CLICK ADD RELATED TITLE TEXT, CLICK ON ADD RELATED TITLE WORDS.

· 
· ARP
· 


· 3Docker (Ubuntu)  No.1Http;  No.2Http;  No.3ARP · PoC


//  / # wget -O - 172.17.0.2 Connecting to 172.17.0.2 (172.17.0.2:80) hello from NORMAL server.
//  / # wget -O - 172.17.0.4 Connecting to 172.17.0.4 (172.17.0.4:80) hello from MIMA server.

 VS Docker

Attacker Process
Linux Kernel

Docker

Docker

Docker

Instance 1 Instance 2 Instance 3

Linux Kernel (Bridge)

ARP

Attacker Process
Linux Kernel

   
MacMac  ARP
IPIPIPIP  .

Docker Instance
1

Docker Instance
2

Docker Instance
3

Linux Kernel (Bridge)

Attacker Process
Linux Kernel

ARP

·   UID0 (i.e. Root)  CAP_NET_RAW

· Root ü Linux capabilities (2.2) ü  ->  ü /proc/{pid}/status or getcaps
{pid}

Docker Instance
1

Docker Instance
2

Docker Instance
3

Linux Kernel (Bridge)

Attacker Process
Linux Kernel



1IP · 
ifconfig eth0 172.17.0.2 ·   Root  CAP_NET_ADMIN

2IP · 
ifconfig eth0 add 172.17.0.2 ·   Root  CAP_NET_ADMIN

3NetfilterNAT

· 

iptables -t nat -A PREROUTING -d 172.17.0.2 -j DNAT --to 172.17.0.4

· 

 Root

 CAP_NET_ADMIN

Docker Instance
1

Docker Instance
2

Docker Instance
3

Linux Kernel (Bridge)



Attacker Process
Linux Kernel

4 + 
· 
sock = socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL)); ifr.ifr_flags |= IFF_PROMISC; ioctl(sock, SIOCSIFFLAGS, &ifr);
· Root + CAP_NET_RAW + CAP_NET_ADMIN

5 + 

· 
sock = socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL)); mr.mr_type = PACKET_MR_PROMISC; setsockopt(sock, SOL_PACKET, PACKET_ADD_MEMBERSHIP, &mr, mrsz);

· Root + CAP_NET_RAW

Docker Instance
1

Docker Instance
2

Docker Instance
3

Linux Kernel (Bridge)

Attacker Process
Linux Kernel


IP IP NATIP  &   & 

 -- 

Root    


NET_ADMIN NET_RAW   







*Ubuntu # ps -ef UID PID PPID C STIME TTY TIME CMD root 1 0 8 02:46 pts/0 00:00:00 /bin/bash root 12 1 0 02:46 pts/0 00:00:00 ps -ef

# getpcaps 1

Capabilities for `1': =

Docker

Docker

Docker

cap_chown,cap_dac_override,cap_fowner,cap_fsetid,cap_kill,cap_setgid,cap_setuid,cap_setpcap,cInst1ance

Instance 2

Instance 3

ap_net_bind_service,cap_net_raw,cap_sys_chroot,cap_mknod,cap_audit_write,cap_setfcap+eip
Linux Kernel (Bridge)



Attacker Process
Linux Kernel

· "" · No.168No.173-174

· ICMP · TCP

Docker Instance
1

Docker Instance
2

Docker Instance
3

Linux Kernel (Bridge)


·  · HttpARP
1ARP

Demo
2ARPHttp

PART.03
CLICK ADD RELATED TITLE TEXT, AND CLICK ADD RELATED TITLE TEXT, CLICK ADD RELATED TITLE TEXT, CLICK ON ADD RELATED TITLE WORDS.

· 
· 
· PoC



· 

· Docker

ü Docker ü Docker

 Docker ü K8S

· FaaSFunction as a Service,  ü  ü NodeJS
Python

· 

ü Docker

ü Docker

ü Docker

ü DockerUID


    IBM AWS GCP


 SCF    CFC Cloud Functions AWS Lambda Cloud Functions


· UID
NodeJS var cmd = "id; cat /proc/$$/task/$$/status | grep Cap" var ret = execSync(cmd, {env: {"TERM": "linux"}}

·  ü UID  0 ü RootCAP_NET_RAW ü  (GCP)

·  ü UID == 0 & CAP_NET_RAW

·  ü 
ü 

FaaSPoC
Befo·reattack, checakttAacRkPerre+covridctsi.m. IP addüresfsun_aHttWackteyrpe ARFPlagsHW, address viMctaimskDevice 172.16.10a9t.t1ack0exr1 MAC0x2a0aa::b5b8::cacc::d1d0::6eed::f0f1; * eth0
In oneüsamfuen_nveitcwtiomrk, rechefcuknA_aRttPacrkeceorrds. , , IP address HWtypeFlags HAWRaPddress Mask .Device 172.16.109.30 0x1 0x2 aa:bb:cc:dd:ee:ff * eth0 172.16.109.1 0x1 0x2 0a:58:ac:10:6d:01 * eth0

PART.04
CLICK ADD RELATED TITLE TEXT, AND CLICK ADD RELATED TITLE TEXT, CLICK ADD RELATED TITLE TEXT, CLICK ON ADD RELATED TITLE WORDS.




· FaaS ü  ü  ü K8S
· FaaS ü  or Docker

· DockerARP ü UID + Capbility ü IP Forward; ü ; ü Docker


 Kame Wang Emailkamewang@tencent.com

