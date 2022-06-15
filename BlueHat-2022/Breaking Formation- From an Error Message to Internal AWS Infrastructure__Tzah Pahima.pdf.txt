Breaking Formation
From an Error Message to AWS Infrastructure
Tzah Pahima

aws sts get-caller-identity
Tzah Pahima

@tzahpahima

Security Researcher @ Orca Security

Why?
What is my purpose?
· Thought leadership · Cloud expertise
Why AWS?
· Largest market share (32%) · It's a challenge
· Not a lot of attacks on AWS infrastructure

Cloud

AWS
A short introduction

 Amazon Web Services  Largest cloud provider  Over 200 services

AWS - Services

Compute
AWS EC2 AWS Lambda AWS Fargate

Storage Amazon S3

Database
Amazon DynamoDB Amazon RDS Amazon Aurora

Management & Governance
AWS CloudWatch AWS CloudFormation

AWS - Regions

AWS - Cloud Security
 Tenant Isolation  Shared Responsibility Model

CloudFormation
 10 years old (Feb 25th 2011)  Infrastructure as Code (IaC)
 Templates  Stacks

Template

CloudFormation

Stack

CloudFormation
P.S. also active on Twitter:

CloudFormation: stacks
 A collection of resources
 Managed as a single unit  Can also be a part of a stackset

CloudFormation: templates
 The recipe to a stack
 All of the resources  Types  Data
 Parameters  Rules  Conditions
 YAML/JSON

Why CloudFormation?
 Plenty of features
 And a parser
 Templates may contain sensitive customer data
 Shell scripts  Passwords
 High risk
 Provisioning resources in other accounts?

Why CloudFormation, really
 Original research idea
 CloudTrail and CloudWatch  Bypass logging
 Evade detection

CloudTrail
 Track user activity and API usage  Remember, everything is an API call

CloudTrail

Who's gonna carry the logs?
 Log structure

Why CloudFormation, really

Why CloudFormation, really

Why CloudFormation, really

Echo

The missing link
 S3 links  Usually s3://

Echo

The potential
 SSRF
 Server-Side Request Forgery

SSRFs in the cloud
 IMDS
 Instance MetaData Service  169.254.169.254  CapitalOne

TemplateURL

URL filter

templateURL=invalidURL

URL filter

URL filter

CloudFormation's GetTemplateSummary

TemplateURL

URL
https://cloudwatch...iad.s3.us-east1.amazonaws.com/.../...echo-js.yaml
http://...
blabla://...
http://169.254.169.254/
https://...:1337/...
https://...@evil-domain.com/...
https://bluehat-testbucket.s3.us-east1.amazonaws.com/existent
https://bluehat-testbucket.../nonexistent

Filter
Success
Success Success TemplateURL must be a supported URL Success TemplateURL must be a supported URL Template format error: unsupported structure
S3 Error: Access Denied

Access Denied
https://bluehat-testbucket.../nonexistent

S3 Error: Access Denied

Back on the Cloud Trail
 Blackbox is hard
 Nothing makes sense
 Let's get back to CloudTrail

Back on the Cloud Trail

Back on the Cloud Trail

Back on the Cloud Trail

The weird log

The weird behavior
 Apache HttpClient  Server-side logic

HttpClient ftw
https://user @bluehat-test-bucket.s3.us-east-1.amazonaws.com:443
@tzahs-evil-domain.com/nonexistent
Not working

What else can HTTP clients do? URL parameters

URL parameters

URL parameters

Nap time
 Shabbat Shalom
 Error extraction  HttpClient parses the error from S3  URL parameters work - an actual HTTP client  This flow is a fallback, only happens when the resource is inaccessible

The idea
 A race

The test
 Burp intruder
 A shell script
 Uploading an object takes time  Setting permissions is quicker
$ while true; do > aws s3api put-object-acl --bucket bluehat-test-bucket --key nonexistent --acl private; > sleep 0.5; > aws s3api put-object-acl --bucket bluehat-test-bucket --key nonexistent --acl public-read; > done

IT WORKS

What does HttpClient parse?
...  The S3 error response
 What format is that?  XML  Why is that interesting?

XXE EXPLAINED
 A normal XML document
 Using an XML entity
 We can't use meaningful characters in XML (e.g <) as text  Unless we use their corresponding XML entities

&slide_title;
 Defining an XML entity

&#x1337;
 Borrowing a file for defining an XML entity
 XML eXternal Entity

Is XXE the answer?
 HttpClient parses XML  Some XML parsers are vulnerable to XXE  Let's give it a shot

XXE?

I'm not racist
 I love races
 But they're not that practical  > 25-30 requests for one leak
 Can we create an exploit that consistently takes only 1 request?

Bucket policies

Kick the bucket

Exploit 2.0

What can we do
 File read  Directory listing (Thanks, Apache Xerces2)  SSRF
 What does this mean?  IMDS

IMDSv2

Just one click and you're safe

Happy Hanukkah

Credentials?

Credentials?

All good things come to an end
 We stopped here  Disclosure  The patch was deployed within 25 hours!
 Fully patched in all regions ~6 days

Further elevation?
 These were NOT CloudFormation's service credentials  We didn't explore much further  What we did find in our short exploration
 Internal configuration files  Evidence for internal services  Internal credentials  We believe escalation to an RCE would've led to severe cross tenant violation  SuperGlue

How we validated the fix
 Interesting in itself  You can find it in our technical blog
 Coming out tomorrow

Takeaways
 Blackbox is hard  Logical vulnerabilities are a thing  No platform is infallible
 But cloud IS more secure  Twitter doesn't like fighter jets

Further research ideas for the cloud
 Services trust one another  Fallback mechanisms
 Good things coming soon...

Thank you! @tzahpahima

