AWS VPC
Shun Wang, CSE ­ AWS Support Dec 2015


· VPC
­ L2 ­ L3
· VPC/
­ VPC S3 Endpoint ­ VPC Flow Logs ­ VPC Peering
· VPC
­ Enhanced Networking ­ Linux System Tuning

VPC

AWS

EC2

Elastic Load

EBS

Balancing

RDS

Amazon Redshift

ElastiCache





EC2

Elastic Load

EBS

Balancing

RDS

Amazon Redshift

ElastiCache

EC2 

10.44.12.4

10.44.12.5

10.44.12.27

10.44.92.17

10.108.6.4


11902.4.146.08.0/.106/16

 · 192.168.0.0/16: · 10.44.12.4/32: · 10.44.92.17/32: · 10.108.6.4/32:

 AWS AWS AWS

10.44.12.4

10.44.12.5

10.44.12.27

10.44.92.17

10.108.6.4


· IP ·  · 


192.168.0.0/16

 · 192.168.0.0/16: · 172.31.0.0/18:

 AWS

172.31.1.7 172.31.1.8

172.31.2.12 172.31.2.51

172.31.1.9

172.31.1.0/24

172.31.2.0/24

172.31.0.0/18

virtual networking!
· ~= VLAN · VPC ~= VRF () · ...


· VLAN ID
­ 12 => 4096VLANs
· VRF
­  => 1K - 2K VRF
· VLAN:VRF


Big Router Control Plane
Data Plane

Big Router Control Plane
Data Plane



· : · VPC: · VPC: · : · VPC: · :

50  10  4 5  2,000 3 MB

...
· 
­ 12  VLAN ID = 4096 VLANs () ­ 4000 VRFs ($200k+)
· VLAN · bug(6+) · , 
­  ­ 



13240/4 150937/40

AAACC CCAAE GGGGG

BB DDD D DD DF FFFFF F F F BB B B BBB B B BBB B B BBB BBBBB

0132 /4 148029/40


·   Amazon.com
· region  VPC



Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.0.5


 VPC:ID:  :  VPC .EC2 VirtuaVl PvPpCrciv-+a1tae2Cb3loIcPu4dd 

Server 192.168.1.3
10.0.0.3 10.0.0.4
Server 192.168.1.4
10.0.0.3

... ...

L2 - Ethernet

10.0.0.2

Ethernet Switch
L2Src: M AC AR(1P0.0.0.23)  L2ADRsPt:fMf:fAf:Cff:(f1f:0ff.:0ff.0.23) ML3ASCr(c1:0.0.0.31)0.0.0.2. AL3RPDsW1t:0h.0o.0h.a3s1is0.a0t.0.3 1M0A.0C.(01.30?.0.0.3) ICMP/TCP/UDP/...

10.0.0.3

L2 - VPC
Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.0.5

...


LS2rcS: r1Mc9:a2Mp.p1Ai6nC8g(.10S.03e.0rv.0ic.e32) LD2stD: M1st9:a2Mpf.f:p1Affi6n:Cf8gf(:.f10fS:.0f3ef.:0rfvf.0ic.e2) AQRReupPelryy1W::0h.0o.0h.a3sis at M1BH0A.lo0uCs.e(0t1:.10310.?90.02.0.01.3.63)8.1.4
MAC: MAC(10.0.0.3)

Server 192.168.1.3
10.0.0.3 10.0.0.4
Server 192.168.1.4
10.0.0.3

L2 - VPC
Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.0.5

... ...


Src: 192.168.0.3 Dst: 192.168.1.4 VPC: Blue LS2rcS: r1Mc9:a2Mp.p1Ai6nC8g(.1S0.4e.0rv.0ic.e2) LD2stD: M1st9:a2Mp.p1Ai6nC8g(.1S0.4e.0rv.0ic.e3) L3 Src: 10.0.0.2 LVM3aalDpidpsaitnt:eg1:0v.a0l.i0d.:3
Blue1100.0.0.0.0.2.2isisaatt IC1M92P./1T6C8P.0/U.3DP/...

Server 192.168.1.3
10.0.0.3 10.0.0.4
Server 192.168.1.4
10.0.0.3

VPC 
Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.0.5

...


SL2rcS: 1rc9:2M.1A6C8(.01.04.0.0.4) DL2stD: Msta: pff:pffin:fgf:ffS:fef:rfvf ice QARuePryW: ho has 1G0.r0e.y0.130?.0.0.3

Server 192.168.1.3
10.0.0.3 10.0.0.4
Server 192.168.1.4
10.0.0.3

VPC 
Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.0.5

...


SL129rc2S:.1rc69:82M.01A.64C8i(.s01.0n4.o0t.0.4) DLh2osstD:tiMsntga: pfafp:nffiyn:fgfin:ffSs:tfeaf:rnfvfcicees in VPC Blue. QARuePryW: ho has 1MB0a.lp0up.e0in.13g0?.D0.e0n.3ied Alarm Raised

Server 192.168.1.3
10.0.0.3 10.0.0.4
Server 192.168.1.4
10.0.0.3

VPC 
Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.0.5

... ...


Src: 192.168.0.4 Dst: 192.168.1.4
VPC: Blue S19rc2:.1M69a82p.1p.i64n8gd.1oS.e4esrvnicoet DdLe2sltiS:vM1erc9ra:2tpMh.p1eAi6npC8ga.(1c1S.k04ee.r0tv.ti0oc.e4) tLh2eDinsst:taMnAceC.(10.0.0.3) VML3aalpSidpracint:eg1: 0in.0va.0li.d4! ALB3lalDurmest1R: 01a.0i0s..0e0.d.04..3is at
192.168.0.4 ICMP/TCP/UDP/...

Server 192.168.1.3
10.0.0.3 10.0.0.4
Server 192.168.1.4
10.0.0.3

L3 ­ IP 

10.0.0.2

Ethernet Switch
L2 Src: MAC(10.0.0.21) L2 Dst: fMf:fAf:Cff:(f1f:0ff.:0ff.0.21) L3 Src: 10.0.0.2 AL3RPDsW1t:0h1.0o0..0h0.a.11s.is3 at 1M0A.0C.(01.10?.0.0.1) ICMP/TCP/UDP/...

Router

Ethernet Switch

L2 Src: MAC(10.0.1.1) L2 Dst: MAC(10.0.1.3) L3 Src: 10.0.0.2 L3 Dst: 10.0.1.3
ICMP/TCP/UDP/...

10.0.1.3

L3 - VPC
Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.0.5

...


LS2rcS: 1Mrc9a:2pM.p1Ai6nC8g(.01S.03e.0rv.0ic.e21) DL2stD: M1s9ta:2pfM.fp:1fAfi6n:Cf8gf:(.f01fS:.0f3ef.:0rfvf.0ic.e2) QRAReupePlryyW1::0h.0o.0h.a1sis at 1MBH0A.lo0uCs.e(0t1:.110G0?.a0.0t.e0.0w.1.1a) y
MAC: MAC(10.0.0.1)

Server 192.168.1.3
10.0.0.3 10.0.0.4
Server 192.168.1.4
10.0.1.3

L3 - VPC
Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.0.5

...


Src: 192.168.0.3 Dst: 192.168.1.4 VPC: Blue SLLS2r2rccS:S:1MrMrcc9a:a:2pMpM.p1pAAi6inCn8Cgg(.(01S1S.0034ee..0r0rv.v.0i1icc.e.2e1)) DLLD2s2stDt:D:M1s1s9t9ta::22pMM..p11AAi66nC8C8g(.(.10S1.0.04e3..0r0v..0i1c.e.13)) LL33 SSrrcc:: 1100..00..00..22 QLVMLR3a3uaelepDipDdrplsyasit:nt:e:g1:10v0.a.00l.i.d11:..33 BHluoest:1109.02..101.6328is.1a.4t IICC1MM9MA2PP.C/1/TT:6CMC8P.PA0//.CUU3(DD1P0P/./...0....1.3)

Server 192.168.1.3
10.0.0.3 10.0.0.4
Server 192.168.1.4
10.0.1.3



Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.0.5

... ...


L2 Src: MAC(10.0.1.1) L2 Dst: MAC(10.0.1.3) L3 Src: 10.0.0.2 L3 Dst: 10.0.1.3 ICMP/TCP/UDP/...

Server 192.168.1.3
10.0.0.3 10.0.0.4
Server 192.168.1.4
10.0.0.3

AWS
172.16.0.0/16

Src: 192.168.0.3 Dst: ???
VPC: Blue L3 Src: 10.0.0.7 L3 Dst: 172.16.14.17
ICMP/TCP/UDP/...

10.0.0.7 10.0.0.8

10.0.1.12 10.0.1.51

10.0.0.9

10.0.0.0/24

10.0.1.0/24

10.0.0.0/18

Edges

Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.1.3

...


Src: 192.168.0.3 Dst: 192.168.4.3 VPC: Blue Host L130.S0r.c0:.410.0.109.2 .168.0.4 Host L130.D0s.1t:.4172.169.21.41.6187.0.4 ... 172.1IC6.M0.P0/T1C6 P/UEDdPg/e... 192.168.4.3 ...

Edge 192.168.4.3 Edge 192.168.4.4

Edges ()

Src: 192.168.0.3 Dst: 192.168.4.3
VPC: Blue L3 Src: 10.0.0.2 L3 Dst: 172.16.14.17
ICMP/TCP/UDP/...

Edge 192.168.4.3
VPN

Src: 54.68.100.245 Dst: 205.251.242.54
IPSEC Stuff L3 Src: 10.0.0.2 L3 Dst: 172.16.14.17
ICMP/TCP/UDP/...

Edges ()

Src: 192.168.0.3 Dst: 192.168.4.3
VPC: Blue L3 Src: 10.0.0.2 L3 Dst: 172.16.14.17
ICMP/TCP/UDP/...

Edge 192.168.4.3
DX

Src: 54.68.100.245 Dst: 205.251.242.54
802.1Q VLAN Tag L3 Src: 10.0.0.2 L3 Dst: 172.16.14.17
ICMP/TCP/UDP/...

Edges ()

Src: 192.168.0.3 Dst: 192.168.4.3
VPC: Blue L3 Src: 10.0.0.2 L3 Dst: 176.32.96.190
ICMP/TCP/UDP/...

Edge 192.168.4.3
Internet

L3 Src: 1504..01.408.2.157.4 L3 Dst: 1676.32.96.190
ICMP/TCP/UDP/...

Edges ()
VPN DX Internet

Src: 192.168.0.3 Dst: 192.168.4.3
VPC: Blue
L3 Src: 10.0.0.2 L3 Dst: 172.16.14.17
ICMP/TCP/UDP/...

Edge 192.168.4.3

Src: 54.68.100.245 Dst: 205.251.242.54
IPSEC Stuff
L3 Src: 10.0.0.2 L3 Dst: 172.16.14.17
ICMP/TCP/UDP/...

Src: 192.168.0.3 Dst: 192.168.4.3
VPC: Blue
L3 Src: 10.0.0.2 L3 Dst: 172.16.14.17
ICMP/TCP/UDP/...

Edge 192.168.4.3

Src: 54.68.100.245 Dst: 205.251.242.54
802.1Q VLAN Tag
L3 Src: 10.0.0.2 L3 Dst: 172.16.14.17
ICMP/TCP/UDP/...

Src: 192.168.0.3 Dst: 192.168.4.3
VPC: Blue
L3 Src: 10.0.0.2 L3 Dst: 176.32.96.190
ICMP/TCP/UDP/...

Edge 192.168.4.3

L3 Src: 54.148.157.46 L3 Dst: 176.32.96.190
ICMP/TCP/UDP/...


Image credit: Wikipedia https://en.wikipedia.org/wiki/1918_Eighth_Avenue

VPC 
VPC: subnet: :

$0.00 $0.00 $0.00

VPC

S3: VPC S3 Endpoint

VPC
Amazon-provided NAT instance image: amzn-ami-vpc-nat
0.0.0.0/0 NAT

0.0.0.0/0

VPC subnet

VPC subnet

VPC S3 Endpoint

EMR 

172.31.1.7

172.31.2.12

172.31.1.8

172.31.2.51

172.31.1.0/24

172.31.2.0/24

172.31.0.0/18

S3VPC

172.31.1.7

172.31.2.12

172.31.1.0/24

172.31.2.0/24

172.31.0.0/18

S3VPC

172.31.1.7

172.31.2.12

172.31.1.0/24

172.31.2.0/24

172.31.0.0/18

Edges

Server 192.168.0.3
10.0.0.2 10.0.0.2
Server 192.168.0.4
10.0.0.4 10.0.1.3

...


Src: 192.168.0.3 Dst: 192.168.4.4 VPC: Blue HosLt31S0.r0c.:01.40. 0.01.292.168.0.4 HosLt31D0.s0t.:15.44. 2311.9323..18698.0.4 ... 172T.1C6P.0/H.0T/T16P/... Edge 192.168.4.3 S3.us-east-1  Edge 192.168.4.4 ...

Edge 192.168.4.3 Edge 192.168.4.4

Edge

Src: 192.168.0.3 Dst: 192.168.4.4
VPC: Blue L3 Src: 10.0.0.2 L3 Dst: 54.231.33.89
TCP/HTTP/...

Edge 192.168.4.4
S3 endpoint

Src: 54.68.100.245 Dst: 54.231.33.89
VPC Endpoint 1a2b3c4d L3 Src: 10.0.0.2 L3 Dst: 54.231.33.89
TCP/HTTP/...



{

"Statement": [

{

"Sid": "Access-to-specific-VPC-only",

"Principal": "*",

"Action": "s3:*",

"Effect": "Deny",

"Resource": ["arn:aws:s3:::my_secure_bucket",

"arn:aws:s3:::my_secure_bucket/*"],

"Condition": {

"StringNotEquals": {

172.3"1aw.1s.:7sourceVpc": "vpc-1111b7b2b.2321".2.12
}

{

}

"S}tatement": [

]{

}

"Sid": "Access-to-specific-bucket-only",

"Principal": "*",

"Action": [

"s3:GetObject",

"s3:PutObject"

],

"Effect": "Allow",

"Resource": ["arn:aws:s3:::my_secure_bucket",

"arn:aws:s3:::my_secure_bucket/*"]

1}72.31.1.0/24

172.31.2.0/24

]

}

172.31.0.0/18

VPC Flow Logs

VPC Flow Logs: 
·  ·  ·  · 

ENISubnetVPC

Flow Log

CloudWatchLog
~10CloudWatch Logs



VPCVPC: VPC Peering

VPC
· /
­ /AD ­  ­  ­  ­ 

VPC peering
172.31.0.0/16

10.55.0.0/16

VPC Peering



172.31.0.0/16

1 

10.55.0.0/16



172.31.0.0/16

 

 

10.55.0.0/16



172.31.0.0/16



10.55.0.0/16

VPC

 

 

AWS
VPN DX

VPN

192.168.0.0/16

172.31.0.0/16

CGW

VGW

HA IPSec

192.168/16



VPC

Enhanced Networking

· HVM · SR-IO-V
·  ·  · 

· 
­ C3 ­ C4 ­ D2 ­ I2 ­ M4 ­ R3

http://aws.amazon.com/ec2/instance-types/

iperfAWS,
· http://blog.flux7.com/blogs/benchmarks/...

Linux system Tuning

· nf_conntrack*



PacketSize,THROUGHPUT,Packet(W)/s,MEAN_LATENCY(ms),P99_LATENCY(ms),MAX_LATENCY(ms),Retrans/s,R eransRate

78B,

61.715,

9.891,

1.28251, 2.888,

648.408, 272.35, .2753%



PacketSize,THROUGHPUT,Packet(W)/s,MEAN_LATENCY(ms),P99_LATENCY(ms),MAX_LATENCY(ms),Retrans/s,R eransRate

78B,

155.957,

24.995,

0.512579, 0.76,

612.417, 223.10, .0892%

Linux system Tuning
· 1. 

Linux system Tuning
· 2.  $ ip route list default via 10.16.16.1 dev eth0 10.16.16.0/24 dev eth0 proto kernel scope link 169.254.169.254 dev eth0 scope link

1448 1448 1448

= 4344 bytes

Linux system Tuning
# ip route change 10.16.16.0/24 dev eth0 \ proto kernel scope link initcwnd 16
$ ip route list default via 10.16.16.1 dev eth0 10.16.16.0/24 dev eth0 proto kernel scope link
initcwnd 16 169.254.169.254 dev eth0 scope link
1448 1448 1448 [ + 12 ] 1448 = 23168 bytes

Linux system Tuning
· 3. 
$ sysctl net.ipv4.tcp_available_congestion_control net.ipv4.tcp_available_congestion_control = cubic reno
$ find /lib/modules -name tcp_* [...]
# modprobe tcp_illinois $ sysctl net.ipv4.tcp_available_congestion_control net.ipv4.tcp_available_congestion_control = cubic reno illinois
# sysctl net.ipv4.tcp_congestion_control=illinois net.ipv4.tcp_congestion_control = illinois

Socket 

· $ ss -ite

· State

Recv-Q Send-Q Local Address:Port Peer

Address:Port

· ESTAB

0

3829960 10.16.16.18:https

10.16.16.75:52008

·

timer:(on,012ms,0) uid:498 ino:7116021 sk:0001c286 <->

·

ts sack cubic wscale:7,7 rto:204 rtt:1.423/0.14 ato:40

·

mss:1448 cwnd:138 ssthresh:80 send 1123.4Mbps unacked:138

·

retrans:0/11737 rcv_space:26847

TCP State

Socket 

· $ ss -ite

· State

Recv-Q Send-Q Local Address:Port Peer

Address:Port

· ESTAB

0

3829960 10.16.16.18:https

10.16.16.75:52008

·

timer:(on,012ms,0) uid:498 ino:7116021 sk:0001c286 <->

·

ts sack cubic wscale:7,7 rto:204 rtt:1.423/0.14 ato:40

·

mss:1448 cwnd:138 ssthresh:80 send 1123.4Mbps unacked:138

·

retrans:0/11737 rcv_space:26847

Bytes queued for transmission

Socket 

· $ ss -ite

· State

Recv-Q Send-Q Local Address:Port Peer

Address:Port

· ESTAB

0

3829960 10.16.16.18:https

10.16.16.75:52008

·

timer:(on,012ms,0) uid:498 ino:7116021 sk:0001c286 <->

·

ts sack cubic wscale:7,7 rto:204 rtt:1.423/0.14 ato:40

·

mss:1448 cwnd:138 ssthresh:80 send 1123.4Mbps unacked:138

·

retrans:0/11737 rcv_space:26847

Congestion control algorithm

Socket 

· $ ss -ite

· State

Recv-Q Send-Q Local Address:Port Peer

Address:Port

· ESTAB

0

3829960 10.16.16.18:https

10.16.16.75:52008

·

timer:(on,012ms,0) uid:498 ino:7116021 sk:0001c286 <->

·

ts sack cubic wscale:7,7 rto:204 rtt:1.423/0.14 ato:40

·

mss:1448 cwnd:138 ssthresh:80 send 1123.4Mbps unacked:138

·

retrans:0/11737 rcv_space:26847

Retransmission timeout

Socket 

· $ ss -ite

· State

Recv-Q Send-Q Local Address:Port Peer

Address:Port

· ESTAB

0

3829960 10.16.16.18:https

10.16.16.75:52008

·

timer:(on,012ms,0) uid:498 ino:7116021 sk:0001c286 <->

·

ts sack cubic wscale:7,7 rto:204 rtt:1.423/0.14 ato:40

·

mss:1448 cwnd:138 ssthresh:80 send 1123.4Mbps unacked:138

·

retrans:0/11737 rcv_space:26847

Congestion window

Socket 

· $ ss -ite

· State

Recv-Q Send-Q Local Address:Port Peer

Address:Port

· ESTAB

0

3829960 10.16.16.18:https

10.16.16.75:52008

·

timer:(on,012ms,0) uid:498 ino:7116021 sk:0001c286 <->

·

ts sack cubic wscale:7,7 rto:204 rtt:1.423/0.14 ato:40

·

mss:1448 cwnd:138 ssthresh:80 send 1123.4Mbps unacked:138

·

retrans:0/11737 rcv_space:26847

Retransmissions


· VPC · VPC S3 Endpoint · VPC Flow Logs · VPC Peering · VPC VPN · VPC Tuning · Enhanced Networking

