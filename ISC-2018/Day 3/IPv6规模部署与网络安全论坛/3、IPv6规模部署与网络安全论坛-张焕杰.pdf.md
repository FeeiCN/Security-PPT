IPv6
 



1.  2.  3. IPV6

1. 
·  ·  · 

 

    

 





20 

10 



· 10 · 7X24 · eduroam · CERN · 

· 1680 · 

· "----" · nature · 10%



          


 MBA  

    






 CUNET

CSTNET CERNET2(IPv6)





CERNET

CHINANET

 CMNET



1G 1.7G 10G 1.2G 2G


3G

























 








 





   IPv6/v4



· 1 ASN 45081 · 2B IPv41B+32CCNNIC40% · /32 IPv6

· 2 · 3 · 13G2
IP
· 20055OpenVPNIPv4+IPv613 · 1/2IPv6
2
· 2000FDDI2VLAN · 2VLAN

IPv4

40%



60%





22% 18%

13%

11%

21% 15%

     IPv6

VLAN



  B

 


8IP



 



 

 

Eth0 10.×.255.34 Eth1 218.22.21.*() Eth2 

AC VLAN200 VLAN X

  B

8IP

 


UDP 1G  ,3


 


1. eduroam 
2.  3. 



Eth0 10.×.255.34

Eth1 172.16.21.*() 

Eth2 



POEAP VLAN200 VLAN X




9 VIP+4




Linux 11

Linux

 

3Linux 10Gbps
NAT1 NAT2 NAT3  NAT4 1G


2. 
·  · NOC



 80
IPv4/IPv6



u 10G+1G 1G+VPN VPN IPv6/IPv4

IPv4

u OSPF+OSPFv3 BGP

IPv6

CERNET  CERNET2 BGP
u

1G+VPN



port channel

NOC

LOOKING GLASS

IPV6




  

IPV6

408 OSPF/OSPFv3/BGP 3 Nginx/Letsencrypt 3
3112  15 IPv6

3. IPV6
· IPV6 · IPV6 · IPV6 · IPV6 · IPV6

IPV6

1999
863 IPv6


2004
CNGI-CERNET2 


2017
IPv6 600
IPv6

2000
IPv6   IPv6


2005
 
IPv6 OpenVPN
IPv6



 

 

 

 

TCP/IP 

LUG(Linux)PXE 
https://mirrors.ustc.edu.cn/ DebianUbuntuFedoraArchlinuxCentOS  

IPV6

· 31BRAS3 ·  · IPv4/IPv6

· 4OSPFv3 · BGPCNGI-CERNET2 · 

 IIJ HE

 2400:B600::/32

CERNET2

CERNET2

CNGI-IX

IPV6

· 

· IPv6 · IPv6

· OpenVPN

VLAN
interface Vlan167 ip address 202.38.81.254/25 ip verify unicast source reachable-via rx ipv6 address 2001:da8:d800:81::1/64 ipv6 verify unicast source reachable-via rx ip dhcp relay address 202.38.64.7

BRAS
interface Route-Aggregation1.500 vlan-type dot1q vid 500 second-dot1q 51 to 900 dhcp select relay ipv6 address 2001:DA8:D800:500::1/64 ipv6 address auto link-local ipv6 nd autoconfig other-flag undo ipv6 nd ra halt ipv6 nd ra router-lifetime 9000 ipv6 subscriber l2-connected enable ipv6 subscriber initiator ndrs enable ipv6 subscriber initiator unclassified-ip enable ipv6 subscriber user-detect nd retry 5 interval 60 ipv6 subscriber unclassified-ip domain ustcipv6 ipv6 subscriber ndrs domain ustcipv6

radius 

IPV6
IPv6
· / · IPv6IPv6 · 
IPV6
· IPv6 /64

· IPv6 · RA · 

IPV6
IPv6
· DNSOpenVPN
IPv6
· BBS/IPTV/FTP//

· nginxIPv6+SSL

DNS

13 a.root-servers.net ... m.root-servers.net
· http://www.internic.net/domain/named.root · IPv4IPv6 · 13DNS512

13

· 13IP(AnyCast) · http://root-servers.org/  · 


· IPv412

· 0ms f j · 30ms a b c d e g i k l m

30ms

· 300ms h



DNS

·  https://www.iana.org/domains/root/files · bind

· 12IPv4 ·  · 13IPv61IPv4

· https://github.com/bg6cq/ITTS/blob/master/app/dns/root/README.md



# show ip route 198.97.190.53/32, ubest/mbest: 1/0
*via 202.38.64.12, [20/0], 8w0d, bgp-45081, external, tag 65500 # show ipv6 route 2001:500:1::53/128, ubest/mbest: 1/0
*via 2001:da8:d800::12, Vlan640, [20/0], 8w0d, bgp-45081, external, tag 65500 2001:500:2::c/128, ubest/mbest: 1/0 2001:500:12::d0d/128, ubest/mbest: 1/0 2001:500:2d::d/128, ubest/mbest: 1/0 2001:500:2f::f/128, ubest/mbest: 1/0

2001:500:9f::42/128, ubest/mbest: 1/0 2001:500:a8::e/128, ubest/mbest: 1/0 2001:500:200::b/128, ubest/mbest: 1/0 2001:503:c27::2:30/128, ubest/mbest: 1/0 2001:503:ba3e::2:30/128, ubest/mbest: 1/0 2001:7fd::1/128, ubest/mbest: 1/0 2001:7fe::53/128, ubest/mbest: 1/0 2001:dc3::35/128, ubest/mbest: 1/0





IPv6

SSL

HTTP/2

Harvard University





MIT





Stanford University





UC Berkeley







University of Oxford

California Institute of Technology



University of Cambridge





Columbia University



Princeton University



Yale University







C9

https://www.17ce.com/ 2018525

  

 



































  


 

 

IPv6 


SSL HTTP/2







IPV6+SSL









IPv4/IPv6
SSL Letsencrypt.org *.ustc.edu.cn  
HTTP  Host: X-Real-IP: X-Forwarded-Proto:


LAN WAF
WEB WAN
Linux 
nginx



  HTTP2

1VLAN VLAN
1600 SSL+IPv6
6 
WAF WEB



· 3IPv6MAC · show ipv6 nei · snmp2MIBMAC · BRASradiusIPv6MAC2VLAN

· IPv6MAC · VLAN · MAC



IPV4/IPV6

IPv4

IPv4 4



6.9

IPv4

IPv6 3 6.2
IPv6









SSL




https://linux.ustc.edu.cn/web/

 https://ipv6.ustc.edu.cn/

IP--IP



BGP 

IP



   


 ip route 192.0.2.1/32 Null0 ipv6 route 2001:db8::1/128 Null0 BGPIPnext_hop 192.0.2.12001:db8::1

IP http://blackip.ustc.edu.cn
IP
0022 ssh 0023 telnet 0025  0080 WAF 1433 SQL 3306 MySQL 3389 


IP

IP

IP

IP--



BGP IP


BGPIPnext_hop IPIPv4v6

IP http://blackhole.ustc.edu.cn
IP
IPIP BGP 

 IP 80 IP IP IPMI IP 3389 53 1433/1521/3306



· eduroam802.1X · v4portal · httpsportal

· BGPBGP · v4 · NAT

 

