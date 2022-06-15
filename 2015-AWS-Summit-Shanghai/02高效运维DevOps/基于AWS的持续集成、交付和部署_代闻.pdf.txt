AWS
 AWS

AWS

Code

Build

Test

Deploy Provision Monitor

AWS Elastic Beanstalk

CodeCommit

CodePipeline

AWS OpsWorks

CodeDeploy CloudFormation CloudWatch

3

SOURCE CODE REPOSITORY

SUBMIT CODE

CLOUDFORMADTOIOCNS

CONTINUOUS INTEGRATION SERVER

SCHEDULE
BUILD DEVELOPER

CODE RCEOACDMUEFIRESQRTUoECrANHCLTIOTNYBTINAIANREIRES TBEUSILTDSS & PACKAGES BUILD OUTPUT

PROJECT MANAGEMENT

PICK TASKS

SERVER

DEV FACING NTOETSITFICATIONS RESULTS

SOURCE CODE REPOSITORY

DNS

CONTINUOUS INTEGRATION SERVER

BUILDS
PROJECT MANAGEMENT SERVER

AWS code services
AWS CodeCommit AWS CodePipeline AWS CodeDeploy


· Unit TestMock Testmainline branch ·  · Bug ·  · 

 - CodeCommit
Private Git repositories hosted on Amazon S3
· AmazonGit Repositories · Git ·  (,, , ) · Repositories · browse, edit, diff
8

CodeCommit 
$ git clone https://git-codecommit.us-east-1.amazonaws.com/v1/repos/aws-cli Cloning into 'aws-cli'... Receiving objects: 100% (16032/16032), 5.55 MiB | 1.25 MiB/s, done. Resolving deltas: 100% (9900/9900), done. Checking connectivity... done. $ nano README.rst $ git commit -am 'updated README' [master 4fa0318] updated README
1 file changed, 1 insertion(+) $ git push Counting objects: 3, done. Delta compression using up to 4 threads. Compressing objects: 100% (3/3), done. Writing objects: 100% (3/3), 297 bytes | 0 bytes/s, done. Total 3 (delta 2), reused 0 (delta 0) remote: To https://git-codecommit.us-east-1.amazonaws.com/v1/repos/aws-cli
4dacd6d..4fa0318 master -> master

 - CodePipeline
·  · 
(    beta  gamma  )
·  ·  · 
10

 - CodeDeploy
·  ·  · Auto Scaling ·  · 
(Bash, Powershell, Chef, Puppet...)
12





9/25/14

Slides not intended for

15

redistribution.

os: linux files:
- source: Config/config.txt destination: webapps/Config
- source: Service destination: /webapps/DogSuit
hooks: ApplicationStop: - location: Scripts/Deactivate_Service BeforeInstall: - location: Scripts/Flush_Logs.sh AfterInstall: - location: Scripts/Decrypt_Secrets.sh ApplicationStart: - location: Scripts/Start_Pooch_Service.sh timeout: 3600 ValidateService: - location: Scripts/Check_Dogs_Barking.sh runas: codedeployuser

AppSpec file

ApplicationStop BeforeInstall AfterInstall

Start DownloadBundle
Install

ApplicationStart

ValidateService

End

Deployment Config

One-at-a-time
Min. healthy hosts = 99%

v2 v1 v1 v1 v1 v1 v1 v1

Half-at-a-time
Min. healthy hosts = 50%

v2 v2 v2 v2 v1 v1 v1 v1

All-at-once
Min. healthy hosts = 0

v2 v2 v2 v2 v2 v2 v2 v2

[Custom]
Min. healthy hosts = 75%

v2 v2 v1 v1 v1 v1 v1 v1



AWS

Code

Build

Test

Deploy Provision Monitor

AWS Elastic Beanstalk

CodeCommit

CodePipeline

AWS OpsWorks

CodeDeploy CloudFormation CloudWatch

19

AWS Elastic Beanstalk (EB)
· Easily deploy, monitor, and scale three-tier web applications and services.
· Infrastructure provisioned and managed by EB ­ but you maintain complete control.
· Preconfigured application containers that are easily customizable.
· Support for these platforms:

Elastic Beanstalk 

Application

Environments
· Infrastructure resources (such as EC2 instances, ELB load balancers, and Auto Scaling groups)
· Runs a single application version at a time for better scalability
· An application can have many environments (such as staging and production)

Application versions
· Application code
· Stored in Amazon S3
· An application can have many application versions (easy to rollback to previous versions)

Saved configurations
· Configuration that defines how an environment and its resources behave
· Can be used to launch new environments quickly or rollback configuration
· An application can have many saved configurations

Elastic Beanstalk environment
· Two types: · Single instance · Load balancing, auto scaling
· Two tiers (web server and worker) · Elastic Beanstalk provisions necessary
infrastructure resources such as load balancers, auto-scaling groups, security groups, and databases (optional) · Configures Amazon Route 53 and gives you a unique domain name
(For example: yourapp.elasticbeanstalk.com)

On-instance configuration

Focus on building your application
· Elastic Beanstalk configures each EC2 instance in your environment with the components necessary to run applications for the selected platform
· No more worrying about logging into instances to install and configure your application stack

Your code
HTTP server Application server Language interpreter Operating system
Host


Saved configurations
Save these for easy duplication for A/B testing or non-disruptive deployments

Application versions
All versions are stored durably in Amazon S3. Code can also be pushed from a Git repository!



Deployment options
1. Via the AWS Management Console 2. Via Git / EB CLI
$ git aws.push
3. Via the AWS Toolkit for Eclipse and the Visual Studio IDE

Deployment configuration

Your code

01

Region

02

Stack (container) type

Load balanced with

03

Single instance OR

Auto Scaling

04

Database (RDS)

Optional

Example: CLI workflow
Prerequisites:
MB12
· AWS account ­ your access and secret keys
· EB CLI · Linux / Unix / Mac: Python 2.7 or 3.0 · Windows PowerShell 2.0
· A credential file containing info from 1
· Git 1.66 or later (optional)

 28 MB12

These should be bullets because they are not sequential steps.
Mcguire, Barbara, 2014/10/27

Example: CLI workflow Initial app deployment:

01 Initialize your Git repository $ git init .
02 Create your Elastic Beanstalk app $ eb init
Follow the prompts to configure the
03
environment

04 Add your code $ git add .
05 Commit $ git commit ­m "v1.0"
Create the resources and launch the
06
application $ eb create

Example: CLI workflow
Update your app:
01 Update your code
02 Push the new code $ git add . $ git commit ­m "v2.0" $ eb deploy
03 Monitor the deployment progress $ eb status

Example: Deploy Docker container to EB

· Three ways:
­ Dockerfile (image built on instance). ­ Dockerrun.aws.json (manifest file that
describes how to run the Docker image). ­ Application archive (should include
Dockerfile or Dockerrun.aws.json file).
· Benefits:
­ Enables high-fidelity deployments. ­ You own the runtime. You can use any
language or framework, even those not currently supported by Elastic Beanstalk (such as Go, Scala, and Clojure).

Dockerfile Dockerrun.aws.json

Example: Deploy Docker container to EB

Using the EB command line tool:

Initialize your Git repository
01
$ git init .

Add your code
04
$ git add Dockerfile

Create your Elastic Beanstalk app
02
$ eb init
Follow the prompts to configure the
03
environment and copy Dockerfile

Commit
05
$ git commit ­am "v1.0"
Create the resources and launch the 06 application
$ eb create


Web App Server
EC2 Instance Web Tier
Security Group Ports 80 and 443
Internet

App Server
EC2 Instance Application Tier Security Group SSH -> Bastion

Engineering Authorized

Staff

3rd Parties

Amazon Relational Database Service (RDS)
Database Tier Security Group
SSH

ElasticBeanstalk 
·  ·  ·  · DNS

Elastic Beanstalk 

Elastic Beanstalk

