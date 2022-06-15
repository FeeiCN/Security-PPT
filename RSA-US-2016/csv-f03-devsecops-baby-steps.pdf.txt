SESSION ID: CSV-F03
DevSecOps in Baby Steps
#RSAC

Hart Rossman
Amazon Web Services Global Practice Manager- Security, Risk, and Compliance @HartDanger

#RSAC
The Journey: Baby Steps to Parkour
Getting to DevOps DevOps to DevSecOps Planning your Epics & Sprints Use Cases & Examples
2

#RSAC
In The Beginning There Was NoOps
3

#RSAC
Security program ­ Ownership as part of DNA

Distributed

Embedded

· Promotes culture of "everyone is an owner" for security · Makes security stakeholder in business success · Enables easier and smoother communication

#RSAC
Operating with Shared Responsibility

Responsibility & Accountability Own it.

How do I know? Do I carry a pager for this service?

Govern it.

Do I make the rules?

Not my monkeys; not my circus.

Should I be consulted or informed?

#RSAC
Security as code
1. Use the cloud to protect the cloud 2. Security infrastructure should be cloud aware 3. Expose security features as services via API 4. Automate everything so everything scales

#RSAC
Security as code: Innovation, stability, & security

Build it faster

Business
Protect it

Development

Security

Keep it stable
Operations

#RSAC
Security as code: A shorter path to the customer
Lots of learning

Requirements Gathering

Automated Build and
Deploy

Minimal learning Some learning

Release

#RSAC
Security as code: Deploying more frequently lowers risk

Rare release events: "Waterfall methodology"

Frequent release events: "Agile methodology"

Change Change

Time
Larger effort "Increased risk"

Time
Smaller effort "Minimized risk"

Continuous Integration

Code Config Tests

Dev

Commit to Git/master

Repo

Config

Package Builder
Push

Version Control

Get / Pull Code

CI Server
Distributed Builds Run Tests in parallel

Send Build Report to Dev Stop everything if build failed

#RSAC

#RSAC
What does CI give us?
Confidence that our code changes will build successfully Increasing velocity of feedback cycle through iterative change Bugs are detected quickly Automated testing reduces size of testing effort Very fast feedback on the things we can test immediately

Continuous Delivery

Code Config Tests

Dev

Commit to Git/master

Repo

Generate

CloudFormation Templates for Env

Config

Package Builder
Push

Install Create

AMIs

Version Control

Get / Pull Code

CI Server

Deploy Server

Distributed Builds Run Tests in parallel

Test Env Staging Env
Prod Env

Send Build Report to Dev Stop everything if build failed

#RSAC

#RSAC
What does CD give us?
Automated, repeatable process to push changes to production Hardens, de-risks the deployment process Allows detection of failure as quickly as possible in the build process Supports A/B testing or "We test customer reactions to features in production" Gives us a breadth of data points across our applications

#RSAC
Continuous Delivery System

#RSAC
DevOps

DevOps
Culture change that enables technology
change

Continuous Delivery
Technology change that enables
culture change

#RSAC
DevOps to DevSecOps

#RSAC
DevSecOps: Core Principles
1. Secure the toolchain 2. Armor up the workloads 3. Deploy your security infrastructure through the toolchain

#RSAC
DevOps DevSecOps

AWS CloudFormation

templates for Env

Repo

Generate

Package

Config

Builder Install

Code

Security

Config Repository

Push

Create AMIs

Tests

Commit to

Dev

repo

Version Control

CI Server
Pull Code

Deploy Server

Vulnerability and pen testing
Test Env Staging Env
Prod Env

Send build report to dev and stop everything if build failed

·Security Infrastructure tests ·Security unit tests in app

#RSAC
CI/CD and automation for security infrastructure

Dev IT Ops

Application

Write app code

Build/ compile
code

Unit test app code

Version Control

Write infra code

Build AMIs

Infrastructure

Validate templates

Package application

Deploy application only
Deploy app

tar, war, zip
yum, rpm
Dev Env

Artifact Repository

Test Env

DR Env
CloudFormation

Automate deployment

Deploy infras

Deploy infrastructure

only

AMI

Prod Env

#RSAC
Building DevSecOps teams
· Make DevOps the security team's job.
· No siloed/walled off DevOps teams.
· Encourage {security} developers to participate openly in the automation of operations code.
· Embolden {security} operations participation in testing and automation of application code.
· Take pride in how fast and frequently you deploy.

#RSAC
Planetary Scale from Day 1
Build Security Services Expose features as API Plan for Scale Know your Customers Utilize customer feedback to Iterate Internalize your Metrics, let them guide you

#RSAC
Planning your Epics & Sprints

Security as code: Agile user stories

#RSAC

1. Epics vs. stories
An epic is delivered over many sprints; a user story is delivered in one sprint or less.
Icebox backlog  sprint
2. Product owner
The product owner decides the priority of each story, is responsible for accepting the story, and is responsible for defining the detailed requirements and detailed acceptance criteria for the story.

Security as code: Agile user stories

#RSAC

3. Persona (or role) A persona/role is a fictitious user or actor within or of the system.
4. Acceptance criteria What does good look like? How will we know?
5. Summary format Every story should have the same summary format: As a (persona/role) I want (function) so that (benefit).

Security as code: Security Epics

Big Data and Predictive Analytics

Identity and Access Control

Logging and Monitoring

Configuration and
Vulnerability Analysis

Shared Responsibility
Model

Infrastructure Security

Incident Response &
Forensics

Data Protection

#RSAC

#RSAC
Getting Started: IAM
Story: As a IAM administrator I want to continually reduce the scope of access for humans even as our platform grows. Passwords and access keys that have not been used recently might be good candidates for removal.
Sprint 1: Get credential reports and flag credentials not used in last 45 days.
Other sprint ideas can be found at: http://docs.aws.amazon.com/IAM/latest/UserGuide/bestpractices.html

#RSAC
Getting Started: Logging & Monitoring
Story: As a security analyst I want to monitor interactions with AWS API so that we can baseline user behavior Sprint 1: Enable AWS CloudTrail globally
Story: As a security operations team member I want to take action on AWS CloudWatch alarms so that we respond responsibly Sprint 2: Integrate alerting into security workflow & ticketing

#RSAC
Use Cases & Examples

#RSAC
Building a "Lambda Responder"

AWS CloudTrail

Amazon S3

Amazon SNS

Reading events in Lambda
exports.handler = function(event,context) { var snsMsgString = JSON.stringify(event.Records[0].Sns.Message); var snsMsgObject = getSNSMessageObject(snsMsgString); var srcBucket = snsMsgObject.Records[0].s3.bucket.name; var srcKey = snsMsgObject.Records[0].s3.object.key; ...
function getSNSMessageObject(msgString) { var x = msgString.replace(/\\/g,''); var y = x.substring(1,x.length-1); var z = JSON.parse(y); return z;
}

#RSAC

Detecting events in Lambda
... var EVENT_SOURCE_TO_TRACK = /cloudtrail.amazonaws.com/; var EVENT_NAME_TO_TRACK = /StopLogging/;
var matchingRecords = records .Records .filter(function(record) { return record.eventSource.match(EVENT_SOURCE_TO_TRACK) && record.eventName.match(EVENT_NAME_TO_TRACK); });
...

#RSAC

#RSAC
Responding to events in Lambda
... if (matchingRecords.length >= 1) {
console.log('StopLogging detected! Reverting...'); cloudtrail.startLogging(cloudtrailParams, function(err, data) {
...

#RSAC
Responding to events in Lambda

Golden Code: Security Translation to AWS

What you do in any IT Environment
· Firewall rules · Network ACLs · Network time pointers · Internal and external subnets · NAT rules · Gold OS images · Encryption algorithms for data in transit and at rest http://docs.aws.amazon.com/quickstart/latest/accelerat or-nist/welcome.html

AWS JSON translation

#RSAC
Gold Image, NTP and NAT
Network ACLs, Subnets, FW rules

#RSAC
Security As Code: Using AWS CodeDeploy
Imaging instance memory: LiME - https://github.com/504ensicslabs/lime
AWS CodeDeploy:

#RSAC
Now What?

#RSAC
"Apply" Slide
Make DevOps the security team's job Harden your toolchain Plan your Security Epics Write your first Security User Story Sprint!
37

