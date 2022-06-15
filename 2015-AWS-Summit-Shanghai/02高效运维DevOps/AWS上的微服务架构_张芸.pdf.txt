AWS
 (Vivian Zhang) AWS

AWS



















   IT      

         

DevOps


·  ·  · AWS · Gilt




·  
­ API ­  ­  ­ UI






UI
Business Logic Data Access Layer
DB

UI

Recommendation

Account Service

Service

Catalog Service
Customer Service

DB

DB

DB



  Martin Fowler
     





Software development System administration
IT operations Release management Project management

DevOps


· 
UI Team
App Logic Team
DBA Team Organizational Structure

Web Tier App Tier
DB
Application Architecture


· 

Login Registration
Order
Accounts team

Personalization
Personalization team

Mobile
Mobile team





1.Register

Service Registry
2. Discovery

Service Service Service Service Service

3. Connect

Service Client

API Gateway

HTML5 Javascript

 Android iPhone


API Gateway
·  ·  ·  · 

Account Service
Recommendation Service
Customer Service



· 

· Schema · 

Account Service

· API

Customer Service

Catalog Service

Amazon ElastiCache RDS

DynamoDB

Amazon RDS

Container/
·  ·  ·  · 

Account Service
container or instance
Customer Service
container or instance
Catalog Service
container or instance


· 
­  ­ 
· 
­ 



User Experience Business Services Data Access Layer

Packaged Version



Production Release

Commit



Build

Test

Release

Commit Commit

Build Build

Test

Release

Test

Release

Docker
    

 
Docker  

AWS

AWS



CloudWatch Cloud Trail Kinesis

 

Elastic

Code

Code

Beanstalk Deploy Pipeline

Code Commit

API Gateway SQS

SWF

SES

SNS



RDS DynamoDB ElastiCache



ELB



Auto

EC2

AMI

ECS

Lambda Scaling

AWS: EC2+ELB+ASG

API Gateway

Account Service LB

Recommendation Service LB

Account Service

Account Service N

Auto Scaling group

Recommendation Service

Recommendation Service N

Auto Scaling group

Catalog Service LB

Catalog Service

Catalog Service N

Auto Scaling group

AWS: EC2 + ECS + ELB

Internet

User / Scheduler

ELB

ELB

Container Instance
Docker
Task Container

Task Container

AZ 1
Docker
Task Container

Container Instance
Task Container

AZ 2
Container Instance Docker
Task Container

Task Container

ECS Agent

ECS Agent

ECS Agent

Amazon ECS

Agent Communication Service

API

Cluster Management Engine

Key/Value Store

AWS: API Gateway + Lambda

Web client

Amazon CloudFront
Static web content served from Amazon S3

Amazon API Gateway

AWS Lambda

API Gateway

Lambda

Amazon RDS
Mobile client
Amazon DynamoDB



On-Premises

Amazon EC2

Amazon ECS

AWS Lambda

 

 

 

 

Gilt

Gilt


2007Ruby on Rails

Ruby on
Rails

memcache

Jobs

Postgres

2015: 


or gilt-serviceframework,

Cave

, Java, Javascript
Log4j, Cloudwatch





 buildconfigxml JavaScalaRuby

 EC2Docker

EC2



EC2


ZooKeeper
Elastic Load Balancing (ELB)

AWS

Existing Data Centre

(1) Deploy to VPC

Dual 10-Gb direct connect line, 2-ms latency.

"Legacy VPC"

(2) "Department" accounts for elasticity & DevOps

Person-

Common Mobile

Admin

alisation

Data







·  
· 

· DevOps
·  Amazon DynamoDB Amazon Kinesis...

·  · 



· 

· 

· IAM

·  · 
·  

· 

· 

