AWS
 ­ AWS


· 1 ­ Rail · 2 ­ CentOSHeartBleed · 3 ­ 
 · 4 ­  · ............... ·  N



AWSInfrastructure As a Code













 

Source code

JSON

Interpreter
Desired application state

AWS Service API
Desired infrastructure state



 



JSON

Interpreter
Desired application state

AWS Service API
Desired infrastructure state



 



JSON


Desired application state

AWS Service API
Desired infrastructure state



 



JSON



AWS Service API

 

AWSCloudFormation
· JSON 
·   
· AWS 
· CI/CDDevOps

CloudFormation











CloudFormation



JSON
  

CloudFormation 
  


AWS  

1 - EC2
{ "Description": "Create an EC2 instance running the latest Amazon Linux AMI.", "Parameters": { "KeyPair": { "Description": "The EC2 Key Pair to allow SSH access to the instance", "Type": "String" } }, "Resources": { "Ec2Instance": { "Properties": { "ImageId": "ami-9d23aeea", "InstanceType" : "m3.medium", "KeyName": { "Ref": "KeyPair" } }, "Type": "AWS::EC2::Instance" } }, "Outputs": { "InstanceId": { "Description": "The InstanceId of the newly created EC2 instance", "Value": { "Ref": "Ec2Instance" } } }, "AWSTemplateFormatVersion": "2010-09-09"
}

  

 ­ CloudFormation Designer
·  · IDE · 

1 ­ CloudFormationWordPress 

2 ­ 

CloudWatch alarms

Software pkgs, config, & data

Elastic Load Balancing

EC2 instance
Auto Scaling group
security group

RDS

 


 - 

CloudWatch alarms

Software pkgs, config, & data

Elastic Load Balancing

EC2 instance
Auto Scaling group
security group

RDS

"Resources" : { "SecurityGroup" : {}, "WebServerGroup" : { "Type" : "AWS::AutoScaling::AutoScalingGroup", "Properties" : { "MinSize" : "1", "MaxSize" : "3", "LoadBalancerNames" : [ { "Ref" :
"LoadBalancer" } ], ...
} }, "LoadBalancer" : {}, "CacheCluster" : {}, "Alarm" : {} },

 - 

EC2 instance
Auto Scaling group

  
 

"Parameters" : { "CustomerDBServiceEndPoint" : { "Description" : "URL of the Customer DB Service", "Type" : "String" }, "CustomerDBServiceKey" : { "Description" : "API key for the Customer DB
Service", "Type" : "String", "NoEcho" : "true"
}, "InstanceType" : {
"Description" : "WebServer EC2 instance type", "Type" : "String", "Default" : "m3.medium", "AllowedValues" : ["m3.medium","m3.large","m3.xlarge"], "ConstraintDescription" : "Must be a valid instance type"

 - 
Elastic Load Balancing

"Resources" : { "LoadBalancer" : {}, ...
}, "Outputs" : {
"WebsiteDNSName" : { "Description" : "The DNS name of the website", "Value" : { "Fn::GetAtt" : [ "LoadBalancer", "DNSName" ] }
} }

 ­ 

Software pkgs, config, & data
EC2 instance Auto Scaling group

"AWS::CloudFormation::Init": { "webapp-config": { "packages" : {}, "sources" : {}, "files" : {}, "groups" : {}, "users" : {}, "commands" : {}, "services" : {} },
"chef-config" : {} }

         BIOTTM (Bring In
Other Tools)

AWS API
aws cloudformation create-stack --stack-name ec2InstanceCmdLineDemo --template-url https://s3-cn-north-1.amazonaws.com.cn/cf-templates-
1fhelryvrdrbr-eu-west-1/2014174d0r-ec2Instance.template --parameters ParameterKey=KeyPair,ParameterValue=ManagementKeyPair

AWS CloudFormation CLI

cancel-update-stack create-stack delete-stack describe-stack-events describe-stack-resource describe-stack-resources describe-stacks

get-stack-policy get-template list-stack-resources list-stacks set-stack-policy update-stack validate-template

$ aws cloudformation update-stack help



   

 

Rolling Update

CloudFormationAWS

CloudWatch alarms
Elastic Load Balancing

Software pkgs, config, & data

Provision AWS Resources
AWS CloudFormation

EC2 instance
Auto Scaling group
security group

ElastiCache Memcached cluster

Stack Events

Amazon SNS Topic

Web Analytics Service
"Create, Update, Rollback, or Delete"
Worker

Lambda

CloudFormation 

CloudWatch alarms

Software pkgs, config, & data
Lambda-powered custom resources

Elastic Load Balancing

EC2 instance
Auto Scaling group
security group

ElastiCache

Lambda 
// Implement custom logic here AMI ID VPC IDID IP

CloudFormationOpsWorks



CloudFormation
·  ·  · 

EC2 SQS, SNS, Kinesis, etc.
databases VPC IAM


 


OpsWorks
·  
·  

CI/CDCloudFormationDevOps



 

 CloudFormation










"infrastructure-as-code"

AWS CI  CloudFormation



DevOps , ,


code commit/pipeline/deploy & review 

 CloudFormation 
· CloudFormation 
·  

AWS
· OpsWorks · Code Commit / Code Pipeline/ CodeDeploy · Boto ­ AWS Python SDK · SDK


· AWS CloudFormation http://docs.aws.amazon.com/zh_cn/AWSCloudFormation/latest/UserGuide/ Welcome.html
· AWS OpsWorks: https://aws.amazon.com/cn/opsworks/?nc1=h_ls · Boto AWS Pythonhttps://aws.amazon.com/cn/sdk-for-python/

Section Title

