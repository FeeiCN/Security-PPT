AWS
 


· AWS · AWS



Customers



 







AWS Foundation Services









AWS Global Infrastructure






AWS


· 


· Amazon CloudWatch · AWS CloudTrail · AWS Config · "Describe" APIs


· IAM  · AWS CloudHSM · AWS CloudFormation · AWS KMS · Amazon Inspector · AWS WAF

AWS


· 


· Amazon CloudWatch · AWS CloudTrail · AWS Config · "Describe" APIs


· IAM  · AWS CloudHSM · AWS CloudFormation · AWS KMS · Amazon Inspector · AWS WAF


· AWS IAM ()  AWS 
· AWS Config  AWS Config Rules AWS  
· AWS WAFWeb   Web  Web  
· Amazon Inspector ()  AWS  
· Trusted Advisor AWS  

IAM
·  AWS  ·  · EC2 · MFA · Identity federation ·  · PCI DSS  ·  AWS  · 

AWS Config 
· AWS ·  ·  ·  · 

AWS Config Rules 
  

AWS WAF?
· AWS WAF  Web  
· Amazon CloudFront ·  ·  Web  ·  AWS WAF API  AWS 

AWS WAF 

AWS Management

Admins

Console

Define rules

Developers AWS API

AWS WAF
Deploy protection

Web app in CloudFront

Amazon Inspector
·  ·  ·  · API ·  Web  ·  ·  ·  AWS  · 

AWS CloudTrail 

Store/ Archive
Troubleshoot

You are making API
calls...

On a growing set of AWS
services around the world..

CloudTrail is continuously
recording API calls

Monitor & Alarm

CloudTrail
· IT · ITAWS ·  · ITCloutrail
Security at Scale: Logging in AWS White Paper

Trusted Advisor
Trusted Advisor  AWS  
 2013  260   3.5 

Trusted Advisor
·  Cost Optimization ·  Performance ·  Fault Tolerance ·  Security
· 

AWS
Demo

IAM
·  AWS  ·  IAM  ·  IAM  ·  ·  ·  MFA ·  Amazon EC2  ·  ·  ·  ·  ·  AWS 

AWS

IAMAWS

 
IAM

IAM
/API  

 

CloudtrailAPI
· Whoroot/IAM userAPI · When: API · What: API · Which: API · Where: APIIP

{ "eventVersion": "1.01", "userIdentity": {
"type": "IAMUser", // Who?
"principalId": "AIDAJDPLRKLG7UEXAMPLE",
"arn": "arn:aws:iam::123456789012:user/Alice", //Who?
"accountId": "123456789012", "accessKeyId": "AKIAIOSFODNN7EXAMPLE", "userName": "Alice", "sessionContext": {
"attributes": { "mfaAuthenticated": "false", "creationDate": "2014-03-18T14:29:23Z"
} } },
"eventTime": "2014-03-18T14:30:07Z", //When?
"eventSource": "cloudtrail.amazonaws.com",
"eventName": "StartLogging", //What? "awsRegion": "us-west-2",//Where to? "sourceIPAddress": "72.21.198.64", // Where from?
"userAgent": "AWSConsole, aws-sdk-java/1.4.5 Linux/x.xx.fleetxen Java_HotSpot(TM)_64-Bit_Server_VM/xx", "requestParameters": {
"name": "Default" // Which resource?
}, // more event details
}


· API ·  · 
­ VPC ­ IAMS3 ­ AWS ­ /API ­ EC2
· CloudFormationCloudTrail
http://docs.aws.amazon.com/zh_cn/awscloudtrail/latest/userguide/use-cloudformation-templateto-create-cloudwatch-alarms.html

API/SNS

 AWS

Amazon Inspector
· CVE ·  ·  ·  · PCI DCSS 3.0

Amazon Inspector
· EC2

Amazon Inspector

Amazon Inspector

Amazon Inspector


>>> import boto3 >>> import json >>> >>> client = boto3.client('inspector') >>> >>> response = client.list_findings() >>> >>> jsonDumpsIndentStr = json.dumps(response, indent=1); >>> print "jsonDumpsIndentStr=",jsonDumpsIndentStr; jsonDumpsIndentStr= {
"findingArnList": [ "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-6CSr1Tvb", "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-9DHRTJX9", "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-KDKC7meb", "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-S2katemH", "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-Spaz7Eww", "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-UjOQNKDz", "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-YoXVRLJ8", "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-ZXlimAxU", "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-fA9TH99l"
], "ResponseMetadata": {
"HTTPStatusCode": 200, "RequestId": "3fcef425-91af-11e5-b59c-35940786f079" } }



>>> response = client.describe_finding(

...

findingArn='arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-6CSr1Tvb'

... )

>>>

>>> jsonDumpsIndentStr = json.dumps(response, indent=1);

>>> print "jsonDumpsIndentStr=",jsonDumpsIndentStr;

jsonDumpsIndentStr= {

"finding": {

"runArn": "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq",

"severity": "Medium",

"recommendation": {

"parameters": [

{

"name": "INSTANCE_ID",

"value": "i-eea72819"

}

],

"key": {

"id": "Disable root login over SSH-recommendation",

"facility": "arn:aws:inspector:us-west-2:758058086616:rulespackage/0-11B9DBXp"

}

},

"rulesPackageArn": "arn:aws:inspector:us-west-2:758058086616:rulespackage/0-11B9DBXp",

"userAttributes": [],

"findingArn": "arn:aws:inspector:us-west-2:936200357723:application/0-lYkTQS6E/assessment/0-uJnq9GaI/run/0-LzD4r9Eq/finding/null-6CSr1Tvb",

"ruleName": "Disable root login over SSH",

Amazon Inspector
· EC2 UserData · AWS CloudFormation
­  ­ 
· : ansible, chef, puppet, salt
­ 
· APIs

Trusted Advisor

