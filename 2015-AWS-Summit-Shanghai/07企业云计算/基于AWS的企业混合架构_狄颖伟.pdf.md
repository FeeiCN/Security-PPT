AWS
 


·  · 
­  ­  ­ Hypervisors ­  ­  ­  ­ 
· 



IT
"Hybrid IT is the result of combining internal and external services, usually from a combination of internal and public clouds, in support of a business outcome."

Cloud

Datacenter

http://www.gartner.com/technology/research/technical-professionals/hybrid-cloud.jsp


· 
­  ­  ­  ­ 
· /
­  ­ 

--AZ

1-AWS

Internet
AWS 





EC2



Direct Connect

Web

Layer

App Layer
Database Layer

2-DMZ

AWS 
App Layer
DB Layer

Internet



Direct Connect

Web Web
Layer Layer

3-Cloud Bursting

Internet
AWS 
Web Layer
DB Layer



Direct Connect

Web App
LAaLpyapeyrer Layer

4-/
Internet
AWS 
Web Layer Web Layer
DB Layer

Direct Connect


Web Layer
App Layer
Database Layer




Data Applications Management Services Operating Systems  Hypervisors Network Data Center

Store, Replicate, Archive Burst, Scale Management Services Operating Systems EC2 VPC, Direct Connect Availability Zones, Regions


· Amazon  · 
­  ­  ­  ­ 
·  ·  · 
­ 

AWS VPC

 VPC,Virtual Private Cloud)  Subnets  Route Tables, Security Groups,
NACL  Virtual Private Gateway  InternetInternet Gateway  IPElastic IPs and Load Balancers  AWS Direct Connect

AWS Direcrt Connect

 Customer Gateway
Public Traffic Private Traffic

AWS

Direct Connect Router

Amazon S3

Internet
o  Layer 2 1000BASE-LX or 10GBASE-LR o  802.1Q VLANs . o BGP A/A or A/P multipath. o  DX AWS Region

VPN connection

EC2 Instances

AWS Region

AWS Directory Service
Corporate data center
Users

Servers
Domain controller
AD.Domain

AWS Directory Service Connect

Virtual Gateway

Security group
VPC subnet Availability Zone
Security group
VPC subnet Availability Zone

o   Directory Service Connect  Simple AD ­ Samba 4 Active Directory  
o  IAM Federation   SAML federation   -  AWS   RADIUS-based MFA
 IPSec VPN or Direct Connect  
· http://aws.amazon.com/directoryservice/



Corporate data center
Users

o CloudTrail o CloudWatch


Update Servers
SIEM Aggregator
Data center router

Customer router

CloudTrail
CloudTrail S3 Bucket
CloudWatch

AWS Direct Connect routers
AWS Direct Connect
Location

Virtual Gateway

Security Group VPC Subnet
Availability Zone
Security Group VPC Subnet
Availability Zone



Application server

Virtual server

File server

Database server

Backup system

iSCSI
AWS Storage Gateway
Corporate data center

o Amazon S3 o  Amazon S3  Amazon Glacier
o   o  o 

Amazon Simple Storage Service

Amazon Glacier





