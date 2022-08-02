Inside Out Igal Gofman The Cloud Has Never Been so Close Yaron Shani

did we Learn anything from the recent Capital One incident?

How safe is your CLOUD ENVIROnMENT?

how much you invest to make it safe!

CAN YOU ANSWER
· Who can access what? § What resources controlled by which users? § How many credentials stored on user workstations and servers? § Who can manage your virtual machines? § Who can access your cloud data stores?
Did we forget the principle of least privilege (PoLP)?
"Every program and every privileged user of the system should operate using the least amount of privilege necessary to complete the job." Jerome Saltzer

IN THIS TALK
public API ACCESS
Public APIs available from anywhere
attack use cases
The risks associated with IAM
Graphs to the Rescue!
Using graph to illustrate resource-based attack vectors
Demo
Risk oriented queries & Algorithms
future work

The problem with Public APIs

Identity and Access Management
· IAM identities (users, groups of users, or roles) · Policies and Permissions · AWS resources · Long-Term Access Keys · Temporary security credentials (STS TOKEN)

GitHub
User Workstation
AWS Access Key OR
Azure Access Tokens

AWS Lateral Movement
Instance Metadata

AWS Role / Managed identity

· ssm:SendCommand · ec2:AssociateIamInstanceProfile
· ec2:StopInstances
· ec2:StartInstances ·...

CodSeSEMxecution

WordPress

Credentials Reuse

· lambda:UpdateFunctionCode · Lambda:GetFunction ·...

WordPress JOB
AWS LAMBDA

AWS EC2

Lambda User

AWS Role / Managed identity

WordPress Storage

Data Breach

AWS S3

s3:GetObject

GitHub
User Workstation
AWS Access Key OR
Azure Access Tokens

VPC ACCESS

Amazon API Credentials Reuse
User

VPC

Jenkins Private
Private IP 10.0.0.0/24
AWS EC2

NAT Gateway

Public IP 194.74.**.**/30

Graphs to the Rescue!

Basic Entities (Graph Node)
· User · Access Key · Managed Identities/Roles · Public IP · Virtual machines (EC2) · Lambdas ·...

Relations (Graph Edges)
· Access Key To User · Role To Lambda Lambda::GetFunction Permission · Role To Lambda Lambda::UpdateFunctionCode Permission · Lambda To Role · Role to EC2 ec2::AttachVolume · Role to EC2 ec2::DetachVolume · Role to EC2 ec2:StartInstances · Role to EC2 ec2:StopInstances ·...

Attack & Read Access Relations
· Access Key Usage - Access Key to User · EC2 Instance Metadata Steal - EC2 to Role using the built-in machine role · Lambda Instance Metadata Steal - Lambda to Role using the built-in role · Lambda Modify Code - Connect Role to Lambda by modifying its code · EC2 Storage Modify - Connect role to EC2 by changing it storage · EC2 SSM Run Command - Connect role to EC2 by using the SSM Agent ·...

LIVE DEMO

future work
· Large Scale ­ Using Spark, Flink, etc · Cloud Trail Support · Simulation API · Ease of Use

https://github.com/smulikHakipod/CloudSimulation

Questions?

