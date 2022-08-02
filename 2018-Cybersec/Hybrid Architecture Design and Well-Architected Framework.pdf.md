Hybrid Architecture Design and WellArchitected Framework
Jhen-Wei Huang (), Solutions Architect June 7, 2017
© 2017, Amazon Web Services, Inc. or its Affiliates. All rights reserved.

What to expect from the session
What is Hybrid Architecture Design? What is the AWS well-architected framework? What are core tenets to being well architected? Customer use case

Should I migrate everything to AWS?
No, this is more than a binary choice.

On-Premises

Cloud

Should I migrate everything to AWS?
We just need to figure out the connectivity...

? On-Premises

Cloud

Hybrid networking

AWS networking

VPC CIDR 10.1.0.0/16

IMnsatnaangcedA 1N0A.1T.1G.1a1teway
Public Subnet
Instance C 10.1.3.33
Private Subnet
Availability Zone A

AWS ILnasmtabndcae B inside1V0.P1C.2.11
Public Subnet
Instance D 10.1.4.44
Private Subnet
Availability Zone B

Lets get distracted by new things:
Virtual Private Endpoints for S3 Gives you the ability to connect privately to S3
AWS Lambda inside a VPC Access Lambda without having to go through a VGW
NAT Gateway Use NAT gateway within a VPC for manage NAT to the Internet

Connecting to AWS
IGWs, VGWs, VPNs, and AWS Direct Connect

VPN connectivity
Internet Access

Provisioning VPN connections
1. Build your AWS infrastructure 2. Create your Virtual Private Gateway (VGW) and attach to
your Virtual Private Cloud (VPC) 3. Define your customer gateway (CGW) 4. Create your VPN connection between the VGW and CGW 5. Download your template configuration 6. Configure your CGW and watch your tunnels come up and
enjoy encrypted connectivity!

IPsec Tunnel 1 - Primary IPsec Tunnel 2- Secondary
The Internet

On-Premises

AWS Direct Connect ­ Provisioning

1. Build your AWS infrastructure 2. Create your Virtual Private Gateway (VGW)
and attach to your Virtual Private Cloud (VPC) 3. Order an AWS Direct Connect from the
console or through a Direct Connect Partner
+ More

4. Have your cross connect provisioned from the AWS router to your device or your partners device (or use a partners NNI)
5. Build connectivity if not already available through partner back to on-premises
6. Provision your Virtual interfaces (private or public) and start using your AWS Direct Connect.

Public VIF

AWS Direct Connect POP

Customer or Partner Cage

Private VIF

VLAN A VLAN B

Service Provider Network

on-premises

Colocation Facility ­ e.g. Equinix SV1

Common hybrid use cases
What kind of hybrid architectures can we build?

Customer-facing applications

External apps on AWS
DNS

Storage

CDN

Load B.

Front App

Load B.

Back end

Database

Scalability and Elasticity
Auto Scaling infrastructure to required capacity and match spending to actual utilization
Global Reach
Highly available global services on edge locations across the world

High Availability
Application deployments that span across multiple facilities with adequate load balancing
Maintainability
Fully managed service portfolio for most common application components

The famous three-tiered web application
Reference: https://aws.amazon.com/architecture/

Building multi-site deployments with AWS

Pilot light architecture

www.example.com

· Allows the scaling of redundant sites during a failure scenario

Amazon Route 53

VPC

Amazon S3

X

Snapshots AMIs:
Web, App, Database

Database Synchronization

Corporate Data Center
On Premises

AWS Cloud
Secondary Site

Defining communications

The communications matrix
Allows for the description of interconnectivity between applications.
By defining communications you can determine where applications may be placed based on the network properties of any points of interconnection.

# Source Application
#1 Web Tier
#2 Application Tier
#3 Database Tier 1

Destination Application Application Tier
Database Tier 1
Database Tier 2

Port
443 1433 1521

Bandwidth Latency

10Mbps 50Mbps 50Mbps

10ms 2ms 50ms

Placing your application where it makes sense

www.example.com

On-premises based front end
· Allows for on-premises front end, such as application-based interfaces.

Application front-end

Amazon Route 53

VPC

Amazon S3

Web to App Communication

Snapshots AMIs:
App, Database

Corporate Data Center
On Premises

AWS Cloud
Secondary Site

Customer case study: Nuts.com
Nuts.com required the front end for their web application to reside inside their distribution centers in the form of an application running on portable Motorola Simbol TC70 hardened barcode scanners. With users constantly communicating with the AWS-built application continuously, low latency seamless connectivity was a hard requirement of the project.
AT&T NetBond
at&t

Customer case study: Nuts.com
On-premises based front end
· Allows for on-premises front end, such as application based interfaces.

Customer case study:
SAP HANA hybrid deployment

Kellogg's Data Center

Users

Encrypted VPN Connection

Private Subnet(s)

Private Subnet(s)

SAP ERP

Production SAP HANA
DB

AWS

IAM

CloudFormation

Backup

Recovery

Amazon CloudWatch

Amazon S3

Public reference: https://aws.amazon.com/solutions/case-studies/kellogg-company/

Placing your application where it makes sense

Application front-end

Split-tier architecture

www.example.com
Amazon Route 53

VPC

· Allows for custom "web" layer onpremises, such as application-based interfaces.
Amazon S3

Web to App Communication

Snapshots AMIs:
App, Database

Corporate Data Center
On Premises

AWS Cloud
Secondary Site

Placing your application where it makes sense

www.example.com
Amazon Route 53
Web to App Communication

VPC

Split-tier architecture
· Allows for custom "App" layer onpremises, such as application processing
Amazon S3

Application Layer
App to DB Communication
Corporate Data Center
On Premises

Snapshots AMIs:
App, Database
AWS Cloud
Secondary Site

Placing your application where it makes sense

Split-tier architecture

www.example.com
Amazon Route 53

VPC

· Allows for custom "DB" layer onpremises, for example for regional or compliance reasons
Amazon S3

Database Server

App to DB Communication

Corporate Data Center
On Premises

Snapshots AMIs:
App, Database
AWS Cloud
Secondary Site

Other hybrid use cases
What else can we build?

Development and test

App B

App C

App A

VDI

Corporate Network

Container DevOps Template

Innovation & agility
Automated builds and deployment of code
Consistent regression testing
Numerous disposable environments that can be (re)built within a click allowing regression tests in identical setups
Cost-effective
Environments can be disposed or stopped when unused
Scalability
Conduct performance and stress tests with potentially thousands of simulation
nodes

Backup and archive

Amazon Glacier
Amazon S3
Backup System

Backup to cloud storage
· Eliminate tape, hardware, off-site storage · Reduce capital expense for backup
infrastructure · Never worry about backup durability · Never run out of backup capacity · Data stored off-site, with high durability, in
multiple locations

Application Virtual

Server

Server

File Database Server Server

Backup and archive
Amazon Glacier
Amazon S3

Backup System

Application Virtual

Server

Server

File Database Server Server

Symantec NetBackup Oracle RMAN and Secure Backup Module CommVault Simpana
Veeam Backup & Replication
AltaVault (SteelStore)

Thoughts on Hybrid Architecture
· Hybrid infrastructure is key. AWS allows for full network integration and hybrid cloud architectures across on-premises and AWS.
· Reduce the heavy-lifting: Using cloud services can allow you to focus on your business and alleviate pain points in new deployments.
· Adoption is not tech but business-driven. Increased agility provides necessary reduced time-to-market.
· On-premises infrastructure is not throwaway. After you move to the cloud, it's not a cloud or no-cloud decision. You can and probably will use both.

AWS Well-Architected Framework

AWS well-architected framework
Set of questions you can use to evaluate how well an architecture is aligned to AWS best practices

Security

Reliability

Performance efficiency

Cost optimization

Operational excellence

Security pillar
Protect information, systems, and assets while delivering business value through risk assessments and mitigation strategies

Security at all layers

Enable traceability

Implement a principle of least privilege

Focus on securing system

Automate security best practices

Reliability pillar
Ability of a system to recover from infrastructure or service disruptions, dynamically acquire computing resources to meet demand, and mitigate disruptions such as misconfigurations or transient network issues

Test recovery procedures

Automatically recover from failure

Scale horizontally to increase availability

Stop guessing capacity

Performance efficiency pillar
Efficiently use of computing resources to meet requirements, and maintaining that efficiency as demand changes and technologies evolve

Democratize advanced
technologies

Go global in minutes

Use server-less architectures

Experiment more often

Cost optimization pillar
Assess your ability to avoid or eliminate unneeded costs or suboptimal resources, and use those savings on differentiated benefits for your business

Analyze and attribute expenditure

Managed services to reduce TCO

Adopt a consumption model

Benefits from economies of scale

Stop spending money on data center operations

Operational excellence pillar
Operational practices and procedures used to manage production workloads

Perform operations with code

Align operations processes to business objectives

Make regular, small, incremental changes

Test for responses to unexpected events

Learn from operational events and failures

Keep operations procedures current

National Instruments: Achieving Agility

NI equips engineers and scientists with systems that accelerate productivity, innovation, and discovery
40-year-old company headquartered in Austin, TX; annual sales greater than $1.25 B
"Products used from toys to supercolliders"

Cloud journey
Started developing on platform in 2008
FPGA Compile Cloud - August 2010 LabVIEW Web UI Builder - November 2010 2013 ­ Introduced well-architected design 2014 ­ Launched well-architected product 2015 ­ All products followed well-architected framework

National Instruments: Cloud Infrastructure 2012

Cloud infrastructure 2012
EC2-Classic, Elastic Load Balancing, Amazon S3, Amazon SimpleDB MySQL on EC2 "Root" credentials Single-AZ Internally developed tooling Backups sent to data center Manual AMI creation

Cloud infrastructure 2012: Challenges
Deployment of infrastructure was manual, resource intensive, and prone to error
Software deployment took 5­30 minutes Lack of infrastructure automation Scaling took 10­30 minutes to meet demand
Image used under Creative Commons: https://pixabay.com/en/woman-burnout-multitasking-face-1733891/

FPGA Compile Cloud: Scaling for Growth

FPGA Compile Cloud: Original scaling design

FPGA Compile Cloud: Challenges

Increased demand causing scaling issues

Delayed results

Alert fatigue

Manual intervention

FPGA Compile Cloud: Improvement

How can we better match demand?

What can be made faster?

How to reduce alerts?

How to automate it?

FPGA Compile Cloud: Original scaling design

FPGA Compile Cloud: Improved scaling design

Scaling to meet demand

Autonomous instances

Intelligent monitoring

Automated deployment

Benefits from well-architected framework
Decreased scaling latency from 30 minutes to 5 Optimized cost from overprovisioning Removed data center dependency Increased developer efficiency

Adopting Well-Architected Framework from Product Inception

Cloud infrastructure 2014
Cloud native services: VPC, Auto Scaling, Amazon Route 53, Amazon CloudFront RDS-MySQL Least-privileged access: IAM Multi-AZ Cloud native tooling: AWS CloudFormation Automated AMI process: Ansible Adopted DevOps principles: Created CI/CD pipelines

Benefits from well-architected framework
Load tested above production capacity Reduced attack surface Cost optimized Faster updates; decreased time to market

Migrate Existing Products to Well-Architected Framework

Existing products: Desired changes

Area EC2 Relational database Auto Scaling Elastic Load Balancing CloudFormation AMI creation Application deployment

2012 Classic MySQL on EC2 Zero External only Zero Manual Manual

2015 ­ Well architected VPC RDS-MySQL Everything Everything 95% Automated: Ansible AWS CodeDeploy

Existing Products: Measured Improvements

Area

2012

2015 ­ Well architected

Security Single point of failure

Root API key
10+

IAM, Network ACL, Egress filtering
1

Time to create separate environment 1 month

< 2 hours

Longest code deployment time

2 weeks

< 4 hours

Typical code deployment time

15 minutes < 1 minute

Continuous Improvement from Well-Architected Framework

Road map: Additional security

Road map: Multiregion disaster recovery
Region specific
Region agnostic

Road map: Simpler, more efficient

Road map: Simpler, more efficient

Road map: Simpler, more efficient

Lessons Learned Utilizing Well-Architected Framework

Most valuable lessons learned
Be willing to make change Know when architecture is nearing its limits Take appropriately sized steps Don't reinvent the wheel

Most valuable lessons learned
Invest time to save time Automation empowers faster change and improvement Need qualified people to accomplish It's a journey, not a destination

Resources
https://aws.amazon.com/well-architected/

Thank you!

