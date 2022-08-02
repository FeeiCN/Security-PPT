SESSION ID: AIR-F02
Play Smart and Automate Self-Defense using AWS Lamda

Sapna Singh
(@sapnas1gh) linkedin.com/in/sapna-singh-cissp-ccsk-msclis-86479626/

#RSAC

#RSAC
Agenda
· Facts we know · AWS Shared Responsibility Model · Why, Where and How to Automate? · Automation Myths · Introduction to AWS Lambda · Automate Incident Response in AWS · Demo · Action Plan

#RSAC
Facts we know

95%
cloud security failures will be customer fault

200+ days to discover breaches

14+
misconfigured IaaS instances running at any given time by
Organizations

2200+ approximate misconfiguration incidents per month
https://www.fugue.co/blog/the-human-factor-in-cloud-misconfiguration https://telecoms.com/498656/206-days-ibms-estimate-on-how-long-it-takes-to-find-a-security-breach/ https://mscdss.ds.unipi.gr/wp-content/uploads/2018/10/Cloud-Adoption-Risk-Report-2019.pdf

#RSAC
Moving to the cloud does NOT make YOU secure by default

AWS Shared Responsibility Model
Customer Data Platform/Application/Identity & Access Management Operating Systems/Network/Firewall Configuration
Encryption/Network Traffic Monitoring
Compute Storage Database Networking AWS Global Infrastructure (Regions, Availability Zones, Edge Locations)

#RSAC
Customer
Responsible for security IN the
cloud
AWS
Responsible for security OF the
cloud

#RSAC
Why to Automate ?

#RSAC
Why to Automate ?
Scale security with rapidly growing cloud deployments

#RSAC
Why to Automate ?
Humans can't work 24*7 but codes can

#RSAC
Why to Automate ?
Improve Cyber health of the cloud environment

#RSAC
Why to Automate ?
Use Cloud to protect Cloud

#RSAC
Where to Automate ?
Incident Response Life Cycle

Preparation

Detection & Analysis

Containment Eradication & Recovery

Post Incident
PaocsttivIintycident Activity

Source: https://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf

#RSAC
How to Automate?

Set realistic Goals

Find Automation tools

Start Small & Simple

Create Runbooks

Plan, Test & Iterate

#RSAC
Start Small and Simple
Don't Automate everything and anything at once

#RSAC
Set realistic Goals
Define your short term and long term goals for successful automation.

#RSAC
Create Runbooks
· Develop runbooks that contains minimum information to ensure consistent and reliable responses for known events.
· Document the manual descriptions of the process then covert logic into code based solutions for automation.
· Revise and update runbooks regularly for effective security response.

#RSAC
Collaborate with stakeholders
· Include your stakeholders for their key insight and expertise on cloud environment.
· Agree on security responses for smoother adoption of Automation.

#RSAC
Find right Automation tools
· Identify areas where you already have appropriate tools vs. areas where you need tools for automation.
· Automation tools need to fit in your cloud environment (Hybrid cloud, Multi-cloud).
· These tools need to be coupled together, and they need to add value to the Security response automation.

Plan, Test and Iterate

#RSAC

· Plan and test security response automation in nonproduction environment.
· Understand the impact of automation on cloud resources and applications.
· Iterate the security response flow for continuous improvement.

#RSAC
Automation Myths
There is no optimal way
Automation can replace security professionals. Automation will solve your all security problems. Everything should be automated. Automate and forget about it.

#RSAC
Security response Automation in AWS

WAF VPC flow
Macie SDK Cloud Trail

Guard Duty Cloud Watch

S3 logs Route 53

Cloud Config

Monitor & Detect

Step Function

S3 Bucket

Lamda Function

SNS
Security Group
SNS

Respond

#RSAC
Introduction to AWS Lamda
AWS Lamda is a computing service that runs code in response to events and automatically manages the computing resources required by that code.

#RSAC
AWS Lamda features
Event Driven Compute Service

No Infrastructure Management
Monitoring & Logging

Scalable, Stateless, Serverless

#RSAC
How AWS Lambda works

Upload code Or
Write code using
Lambda editor

Setup the code Trigger Lambda code from other AWS services

Lambda runs the code when receives triggers

#RSAC
AWS CloudWatch
AWS CloudWatch is a monitoring service for AWS cloud resources. It collects monitoring and operational data in the form of logs, metrics, and events.

#RSAC
AWS CloudTrail
AWS CloudTrail increases visibility into user and resource activity by recording AWS Management Console actions API calls.

#RSAC
AWS Config
AWS Config continuously monitors and records AWS resource configurations and allows to automate the evaluation of recorded configurations against desired configurations.

#RSAC
AWS Guard Duty
Amazon GuardDuty is a threat detection service that continuously monitors for malicious or unauthorized behavior to help protect AWS accounts and workloads.

#RSAC
Respond to S3 Bucket allowing Public Access
Demo

#RSAC
Automated Remediation Flow

SNS

Lamda

S3

AWS Config Cloud Watch

Function

Slack

Monitor & Detect

Respond

#RSAC

#RSAC
AWS Config Rule

#RSAC
AWS Config Dashboard

#RSAC
AWS Config Logs
"previousValue":
"{\"grantSet\":null,\"grantList\":[{\"grantee\":{\"id\":\"40cfe63d7671176f221d4f601b58ec134c9f705c7e0f51728e5fa3965f652322\",\ "displayName\":null},\"permission\":\"FullControl\"}],\"owner\":{\"displayName\":null,\"id\":\"40cfe63d7671176f221d4f601b58ec13 4c9f705c7e0f51728e5fa3965f652322\"},\"isRequesterCharged\":false}",
"updatedValue":
"{\"grantSet\":null,\"grantList\":[{\"grantee\":{\"id\":\"40cfe63d7671176f221d4f601b58ec134c9f705c7e0f51728e5fa3965f652322\",\
"displayName\":null},\"permission\":\"FullControl\"},{\"grantee\":\"AllUsers\",\"permission\":\"Write\"}],\"owner\":{\"d
isplayName\":null,\"id\":\"40cfe63d7671176f221d4f601b58ec134c9f705c7e0f51728e5fa3965f652322\"},\"isRequesterCharged\":fals e}",

#RSAC
New Compliance Change Record: ---------------------------{ "awsAccountId": "008186910956",
"configRuleName": "s3-bucket-public-write-prohibited", "configRuleARN": "arn:aws:config:us-east-1:008186910956:config-rule/config-rule-ak2t02", "resourceType": "AWS::S3::Bucket", "resourceId": "demos3bucketforpublicaclremediation",
"awsRegion": "us-east-1", "newEvaluationResult": { "evaluationResultIdentifier": {
"evaluationResultQualifier": { "configRuleName": "s3-bucket-public-write-prohibited", "resourceType": "AWS::S3::Bucket", "resourceId": "demos3bucketforpublicaclremediation" }, "orderingTimestamp": "2020-01-31T18:37:58.287Z" },
"complianceType": "NON_COMPLIANT",
"resultRecordedTime": "2020-01-31T18:38:11.674Z", "configRuleInvokedTime": "2020-01-31T18:38:11.434Z",
"annotation": "The S3 bucket ACL allows public write access.",

AWS Cloudwatch Rule
{ "source": [
"aws.config"
], "detail": { "requestParameters": {
"evaluations": { "complianceType": [
"NON_COMPLIANT"
] } }, "additionalEventData": { "managedRuleIdentifier": [
"S3_BUCKET_PUBLIC_READ_PROHIBITED", "S3_BUCKET_PUBLIC_WRITE_PROHIBITED"
] } } }

#RSAC

#RSAC
AWS Lamda Function
ACL_RD_WARNING = "The S3 bucket ACL allows public read access." PLCY_RD_WARNING = "The S3 bucket policy allows public read access." ACL_WRT_WARNING = "The S3 bucket ACL allows public write access." PLCY_WRT_WARNING = "The S3 bucket policy allows public write access."
def lambda_handler(event, context):
s3 = boto3.client('s3') resource = list(event['detail']['requestParameters']['evaluations'])[0] bucketName = resource['complianceResourceId'] complianceFailure = event['detail']['requestParameters']['evaluations'][0]['annotation']
if(complianceFailure == ACL_RD_WARNING or complianceFailure == ACL_WRT_WARNING): s3.put_bucket_acl(Bucket = bucketName, ACL = 'private') aclNotifier(bucketName, s3)
elif(complianceFailure == PLCY_RD_WARNING or complianceFailure == PLCY_WRT_WARNING): s3.delete_bucket_policy(Bucket = bucketName) policyNotifier(bucketName, s3)

#RSAC
CloudTrail Event

"eventName": "PutBucketAcl",
"awsRegion": "us-east-1",

{ "Grantee": {

"sourceIPAddress": "37.36.182.168",
"userAgent": "signin.amazonaws.com",
"requestParameters": { "bucketName": "demos3bucketforpublicaclremediation", "AccessControlPolicy": {

"xsi:type": "Group", "xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance", "URI": "http://acs.amazonaws.com/groups/global/AllUsers"

"AccessControlList": { "Grant": [ {

},
"Permission": "WRITE"

"Grantee": { "xsi:type": "CanonicalUser",

"DisplayName": "singh.sapnait85",

"xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance", "ID": "40cfe63d7671176f221d4f601b58ec134c9f705c7e0f51728e5fa3965f652322" },

"Permission": "FULL_CONTROL"

},

#RSAC
Revert the unauthorized modification to Security Group
Demo

#RSAC
Automated Remediation Flow

Security Group

Cloud Trail Cloud Watch

Lamda Function

SNS Slack

Monitor & Detect

Respond

#RSAC

CloudTrail Event

"invokedBy": "signin.amazonaws.com" }, "eventTime": "2020-02-01T09:33:31Z",

"eventSource": "ec2.amazonaws.com",

"eventName": "AuthorizeSecurityGroupIngress",

"awsRegion": "us-east-1",

"sourceIPAddress": "149.147.92.87",

"userAgent": "signin.amazonaws.com", "requestParameters": {

"groupId": "sg-decf4289",
"ipPermissions": { "items": [ { "ipProtocol": "tcp",

"fromPort": 22,

"toPort": 22,

"groups": {}, "ipRanges": {
"items": [

{

"cidrIp": "0.0.0.0/0" }

#RSAC

CloudWatch Rule

#RSAC
"detail": { "eventSource": [ "ec2.amazonaws.com" ], "eventName": [ "AuthorizeSecurityGroupIngress", "AuthorizeSecurityGroupEgress", "RevokeSecurityGroupEgress", "RevokeSecurityGroupIngress", "CreateSecurityGroup", "DeleteSecurityGroup" ]

#RSAC
Aws Lamda Function
def lambda_handler(event, context): event_detail = event['detail'] request_parameters = event_detail['requestParameters'] ip_permissions = normalize_paramter_names(request_parameters['ipPermissions']['items'])
if (event['detail']['eventName'] == 'AuthorizeSecurityGroupIngress'):
boto3.client('ec2').revoke_security_group_ingress(GroupId = request_parameters['groupId'],IpPermissions = ip_permissions)
result = {} result['group_id'] = request_parameters['groupId'] result['user_name'] = event_detail['userIdentity']['arn'] result['ip_permissions'] = ip_permissions message = "AUTO-MITIGATED: Egress rule removed from security group: {} that was added by {}: {}".format(result['group_id'],result['user_name'], json.dumps(result['ip_permissions']))
boto3.client('sns').publish(TargetArn = os.environ['sns_topic_arn'],Message = message,Subject = "Auto-mitigation successful")
elif(event['detail']['eventName'] == 'AuthorizeSecurityGroupEgress'):
boto3.client('ec2').revoke_security_group_egress(GroupId = request_parameters['groupId'],IpPermissions = ip_permissions)
result = {} result['group_id'] = request_parameters['groupId'] result['user_name'] = event_detail['userIdentity']['arn'] result['ip_permissions'] = ip_permissions boto3.client('sns').publish(TargetArn = os.environ['sns_topic_arn'],Message = message,Subject = "Auto-mitigation successful")

#RSAC
AWS SNS Notification
AUTO-MITIGATED: Egress rule removed from security group: sg-09f999f955c7bf2df that was added by arn:aws:iam::008186910956:root: [{"ToPort": 1433, "IpProtocol": "tcp", "IpRanges": [{"CidrIp": "0.0.0.0/0"}], "FromPort": 1433}]
AUTO-MITIGATED: Ingress rule removed from security group: sg-decf4289 that was added by arn:aws:iam::008186910956:root: [{"ToPort": 22, "IpProtocol": "tcp", "IpRanges": [{"CidrIp": "0.0.0.0/0"}], "FromPort": 22}]

#RSAC
Cloud Native Toolsets for Security Automation

AWS

Cloud Trail Cloud Watch Guard Duty Cloud Config

Lamda Function

Step Function

Azure

Cloud

Googl e

Azure Monitor Security Center Sentinel Runbooks

Azure functions

Logic apps

Cloud Audit Stackdriver

Logging

Logging

Event Threat Cloud Security

Code

Detection

command Center Functions

#RSAC
Security response Automation in Microsoft Azure

#RSAC
Security response Automation in Google Cloud
https://cloud.google.com/solutions/automating-malware-scanning-for-documents-uploaded-to-cloud-storage

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Evaluate the manual processes that can be automated in your organization.
In the first three months following this presentation you should:
­ Define your short term goals to automate the workflows that could most benefit from automation.
­ Take step by step approach to the gain value from automation and enhance your efforts with the time.
Within six months you should:
­ Define your Automation vision inline with Enterprise cloud Security Strategy. ­ Balance Automation with its risk for continuous compliance and security.

#RSAC
Q & A

