VPC
 
 shakaibo Emailericsha@tencent.com

2015/12/18

2015/12/18



1



2



3

VPC

4

VPC









1-



10.10.1.0/24 1 10.10.2.0/24 2 10.10.3.0/24 3

1
1 10.10.1.1
1

2
2 10.10.2.1
2

3
3 10.10.3.1
3

VM1 10.10.1.10 VM2 10.10.1.11 VM3 10.10.2.20 VM4 10.10.2.21 VM5 10.10.3.30 VM6 10.10.3.31
·  IP · 
­  ­ IP 
6

2-
1 10.10.1.1

2 10.10.2.1

1

2

3 10.10.3.1 3

1

2

3

VM1 10.10.1.10 VM2 10.10.1.11 VM3 10.10.2.20 VM5 10.10.3.30 VM4 10.10.2.21 VM6 10.10.3.31
 IP
 1. <mac, > mac  2.   3.   4. Tor mac

3-Overlay




10.10.1.0/24 1 10.10.2.0/24 2 10.10.3.0/24 3

1

2

3



1 10.10.1.1

2 10.10.2.1

3 10.10.3.1

machr iphdr grehr iphdr payload

10.10.1.10

1

10.10.2.20

2

10.10.3.30

3

    VM



VM

VM

VM

VM

VM

machr iphdr

payload

          IP/MAC



4-VPC
VPC 10.0.0.0/16
A
CVM instance 10.0.0.1
EIP119.119.119.119
Subnet: 10.0.0.0/24

Custom Route Table

VPN
VPN Gateway

Destination 10.0.0.0/16 0.0.0.0/0

Target Local igw-id

B

CVM instance 10.0.1.100
Subnet: 10.0.1.0/24

Virtual Router Internet Gateway
VPG

Main Route Table
Destination Target

Direct Connect Gateway 10.0.0.0/16 Local

 Overlay   VPC VPC IP       

VPC

IPSec VPN



    IPSec  

 1625
       

VPC &ACL
VPC 10.0.0.0/16

CVM instance 1 10.0.0.1

CVM instance 2 10.0.0.2

CVM instance 3 10.0.1.1

Security Group Security Group

IN

OUT

Security Group Security Group

IN

OUT



Security Group Security Group

IN

OUT

Subnet 10.0.0.0/24

Subnet 10.0.1.0/24

Network ACL IN

Network ACL OUT

Route Table

ACL

Network ACL IN

Network ACL OUT

Router

Route Table

Internat Gateway

VPN Gateway

VPC 

Route Table
Destination Target
10.1.0.0/16 Local
10.0.0.0/16 vpn-id

VPC 10.1.0.0/16

VPC 10.0.0.0/16

VPN

Subnet: 10.1.0.0/24

Subnet: 10.0.0.0/24

VPN IPsec

Subnet: 10.1.1.0/24

Subnet: 10.0.1.0/24

VPG

 

VPC 10.2.0.0/16

Route Table
Destination Target 10.0.0.0/16 Local 10.1.0.0/16 vpn-id 10.2.0.0/16 vpg-id

VPG
Route Table
Destination Target 10.2.0.0/16 Local 10.0.0.0/16 vpg-id

Subnet: 10.2.0.0/24

VPC
VPC 10.0.0.0/16

192.168.0.0/16


Subnet: 10.0.0.0/24 Subnet: 10.0.1.0/24

VPN



VPG 

 




Route Table
Destination Target

10.0.0.0/16 Local

192.168.0.0/16

vpn-id or vpg-id

·  ·  ·  · 

API
 

  



API





""   PPT

