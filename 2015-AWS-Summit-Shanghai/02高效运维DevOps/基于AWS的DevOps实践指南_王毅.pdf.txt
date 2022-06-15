AWSDevOps
 

DevOps?
" DevOpsDevelopmentOperations  DevITOps  . "
Source: http://en.wikipedia.org/wiki/DevOps

DevOps?
...

DevOps


...
, 

Change Change

Time

Time

DevOps

DevOps

DevOps

 /
SDK API 

    

AWSDevOps

 /
SDK API 


Python, Java, PHP, Node.js, ... REST API 

AWSDevOps

 CloudFormation CodeDeploy OpsWorks ElasticBeanstalk

Code & CLI

Ansible Saltstack
...

API & SDK AWS Services


Code & CLI

AWS

Management Console

APIs and SDKs Command Line Interface
DevOps

AWS Tools (SDK, CLI, IDE, etc.): http://aws.amazon.com/tools/

Python Code ­ Start two EC2 instances

CLI - Add Tag to EC2 instances
aws ec2 create-tags --resources i-ffb064c7 i-8eb561b6 --tags Key=Name,Value=QConEC2

 DevOps


AWS DevOps

Convenience
IAM
Customization

Beanstalk OpsWorks

CodeDeploy CloudFormation

Provision

Deploy

CloudWatch
Monitor

CloudFormation



· AWS Stack
· 
· CloudFormation 
· 
· API CloudFormation

Infrastructure as Code
Samples: http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/sampletemplates-services-us-west-2.html



CodeDeploy



Amazon S3 GitHub

Application Bundle

Deployment

Agent

Agent

Agent

Agent

Agent

Agent

Deployment Group

Deployment Configuration

Rolling updates
v2
v1

Auto Scaling support
v2 v2 v2

Customized Install
files: - source: /web_files/ destination: /var/www/html/
hooks: BeforeInstall: - location: setup/install_dep.sh ApplicationStart: - location: setup/start_server.sh - location: setup/start_logger.sh ApplicationStop: - location: setup/stop_server.sh - location: setup/flush_logs.sh

Application Specification File

version: 0.0

os: linux

files:

- source: /

ApplicationStart:

destination: /var/www/html/WordPress

- location: scripts/start_server.sh

hooks:

timeout: 300

BeforeInstall:

runas: root

- location: scripts/install_dependencies.sh ApplicationStop:

timeout: 300

- location: scripts/stop_server.sh

runas: root

timeout: 300

AfterInstall:

runas: root

- location: scripts/change_permissions.sh

timeout: 300

runas: root

Demo Snapshot

OpsWorks

OpsWork
AWS OpsWorks is a flexible application management solution with automation tools that enable you to model and control your applications and their supporting infrastructure.

OpsWorks

OpsWorks Backend

Command JSON

Command Log+Status

Amazon EC2, Amazon EBS, EIP, Amazon VPC, Elastic Load Balancing.... Auto-Scaling, Auto-Healing....

OpsWorks Agent
On-instance execution via Chef client/zero

Chef

Lifecycle events

Built-in and Custom Chef Recipes

Custome Recipe Demo ­ 

ElasticBeanstalk

Elastic Beanstalk 


S3. Git!


A/B 

Application



CLI workflow
Initial app deployment:

01 Initialize your Git repository $ git init .
02 Create your Elastic Beanstalk app $ eb init
03 Follow the prompts to configure the environment

04 Add your code $ git add .
05 Commit $ git commit ­m "v1.0"
06 Create the resources and launch the application $ eb create

CLI workflow
Update your app:
01 Update your code
02 Push the new code $ git add . $ git commit ­m "v2.0" $ eb deploy
03 Monitor the deployment progress $ eb status


AWS IAM (Identity & Access Mgmt)

Amazon CloudWatch

Manage users, groups &
permissions

Monitor resources

Convenience
IAM
Customization

Beanstalk

OpsWorks

CodeDeploy CloudFormation

Provision

Deploy

CloudWatch
Monitor

