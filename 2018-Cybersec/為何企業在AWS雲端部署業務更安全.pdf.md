AWS 
Drinkey Wei Amazon Web Services
Level 200
© 2017, Amazon Web Services, Inc. or its Affiliates. All rights reserved.


· ... ·  ·  ·  · 

...

· ...

· The CIA Triad
· Availability · Integrity · Confidentiality



· ...



...

...
""  ""

AWS""""
Source: http://www.laingorourke.com/our-projects/all-projects/lawrence-hargrave-drive.aspx

AWS Job ZERO


AWS
 AWS     
    



         

         

AWS















AWS









AWS 






 
(Security IN the Cloud)
AWS 
(Security OF the Cloud)

""

 ""

""



AWS

""

""
Amazon Simple Storage Service (S3)
 99.999999999%   99.99% 

""

 









 

 

""

""

www.example.com

media.example.com

Amazon Route 53
Elastic Load Balancing

AWS IAM

AWS WAF

web app server

root volume

EC2 instance
security group

data volume

Auto Scaling group

logs
Amazon EBS snapshot

CloudFront distribution
Amazon S3 bucket

AWS

AWS

CloudWatch CloudTrail

security group Availability Zone #1

AWS KMS

AWS CloudHSM

Amazon Inpector

""Amazon S3

Amazon S3


 IAM
 

AWS   

   


· SSL/TLSAmazon S3

· Amazon S3


""

----NASA
NASAAWS:
 Amazon Web Services  mars.jpl.nasa.gov  NASA/JPL  AWS  NASA/JPL   Web   Amazon Web Services      

""

   

AWS 
AWS 












AWS

(Security OF the Cloud)

""

      (EC2)  

+


       

=



 



 
 
 
 

RightScale 2017 State of Cloud Report



AWSAWS Cloud Adoption Framework

AWS

AWS


,  ,  , 


, ,   , 

CAF : http://d0.awsstatic.com/whitepapers/aws_cloud_adoption_framework.pdf


Value Analysis Architecture Jumpstart Security Playbook Applications Assessment Operational Healthcheck Skills Assessment Resident Architect
 & 
, , , , //,
, , 

AWS

AWS













: DevSecOps  
 

  


   

AWSAAA

(Authenticate)
Username/Password Access Key (+ MFA)

(Authorize) Policies

(Audit) CloudTrail

AWS

· CLI / APIAWS · 


· Access Keys ­ 
· Access Keys ­ EC2 ­ GitHub ­ AMI ­ 
· IAM Role

Identifier ACCESS KEY ID Ex: AKIAIOSFODNN7EXAMPLE
Secret SECRET KEY Ex: UtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

AWS

users

DDo S

CloudFront Edge Location

ELB
security group DMZ public subnet

· CloudFront

· VPC:
 NACL  Security Group

WAF

Auto

ELB

Scaling

security group

security group

WAF / Proxy private subnet

web app server
Auto Scaling
security group
frontend servers private subnet

 ELB  Auto Scaling Group

AWS

Advanced Threat
Analytics

Application Security

Identity and Access Mgmt

Server & Endpoint Protection

Network Security

Encryption & Key Mgmt

Vulnerability & Pen Testing

AWS

Your key management infrastructure

Your applications in your data
center

Your encryption client application

Your application in Amazon EC2

AWS or Your Key management infrastructure

...
Your Encrypted Data in AWS Services





 ""  ""  BC / DR ""

 

       
 

       
 

       
   



 


TLSAWS API
"Condition": { "Bool": { "aws:SecureTransport": "true" }
}
Amazon Certificate Manager Amazon Elastic Load BalancingAmazon CloudFront ()



?
· ? · ?
?
· ? · ?
?
· ? · ?
?

AWS

Key Question
Where are keys generated and stored Where keys are used
How to control key use
Responsibility for Performance/Scale Integration with AWS services? Price

DIY

AWS Marketplace Partner Solution

Your network or in AWS Your network or in AWS

Your network or your EC2 instance
Config files, Vendorspecific management
You

Your network or your EC2 instance
Vendor-specific management
You

AWS CloudHSM

AWS Key Management Service

In AWS, on an HSM that AWS you control

AWS or your applications

AWS services or your applications

Customer code + Safenet APIs
You

Policy you define; enforced in AWS
AWS

Limited

Limited

Limited

Yes

Variable $$$$$

Per hour/per year 0-$$$

Per hour $$$

Per key/usage $

AWS : https://d0.awsstatic.com/whitepapers/AWS_Securing_Data_at_Rest_with_Encryption.pdf

AWS
AWS CloudWatch

You are making API calls...

On a growing set of services AWS CloudTrail is continuously And delivering log files to you

around the world...

recording API calls...


AWS CloudWatch AWS CloudWatch Logs AWS CloudWatch Events AWS CloudTrail VPC Flowlog / S3 Access Log AWS......


AWS

AWS
   


  

AWS  
 Minimally Viable Production

 

 

 



 









·  · 
 · STS · 
Federation · ,
SoD

AWS

IAM

Organizations

AWS Directory Service

AWS STS

   

   
  

 

 

 



 







·  
·  
·  ·  ·  · 

Amazon S3

AWS CloudTrail

Amazon CloudWatch Logs & Events

Amazon SNS


   
  
    

 

 

 



 

SIEM
Corporate data centre
Users

Update Servers

SIEM Aggregator

Data centre router

CloudTrail

CloudWatch

Connectivity

Virtual Gateway

Security group
VPC subnet Availability Zone
Security group
VPC subnet Availability Zone







·  · Golden AMI
·  DDoS
·  Serverless
·  

Amazon

AWS

AWS

Inspector Organizations Shield

AWS WAF Amazon

AWS

CloudFront Lambda

Amazon
VPC

VPC flow logs


   
 Gloden AMI  DDoS
WAF  


 

 

 



 


Well-Architected via a NIST High Quick Start

https://www.example.com

AWS Account
Virtual Private Cloud (VPC)
us-east-1a NAT

DMZ Subnet

Proxies

AWS Shield Advanced

Amazon Route 53

Amazon CloudFront

AWS WAF

AWS Edge Locations

Proxies

Bastion us-east-1b

Private Subnet

Private Subnet

RDS DB
RDS DB

Private Subnet

Private Subnet

CloudTrail
CloudWatch Alarms
AWS Config

Archive Logs Bucket

S3 Lifecycle Policies to Glacier







·  ·  · API ·  ·  ·  ·  · 

AWS KMS

AWS

IAM

CloudHSM

AWS CloudTrail

AWS Config

AWS Certificate Manager


   
  KMS
  
 

 

 

 



 



and at rest

Encrypted in transit

S3
EBS
RDS
Amazon Redshift

turn it on

Amazon Glacier

Fully managed keys in KMS
Your KMI

Restricted access Fully auditable









·  
·  
·  · RCA · 
· DevSecOps

Amazon S3

Amazon EBS snapshot

Amazon CloudWatch Logs & Events

AWS CloudTrail

VPC

 

 

 

  
  
   CloudFormation
 



 

----NTT Docomo

:
NTT DoCoMo NTT DoCoMo 3G NTTNippon Telegraph and Telephone Public Corporation(      )    DoCoMoDo Communication Over the Mobile Network DoCoMo everywhere

:
 AWSNTT DOCOMO AWS 
:
 NTT DOCOMOAWS  

:
 NTT DOCOMOAWS  



 


 MVP  MSB        KPI  
...


  
 

----

:
   2,000  

:
 AWS  AWS 
:
 AWS  3  

:
 AWS  



· AWS · AWS · ---- ·  · 
 AWS  AWSAWS Well-Architected Framework

turn it on


AWS Cloud Adoption Framework http://bit.ly/AWS-CAF

AWS Well Architected Framework
http://bit.ly/WellArchF

AWS Quick Start Guides
http://bit.ly/AWSQSG



