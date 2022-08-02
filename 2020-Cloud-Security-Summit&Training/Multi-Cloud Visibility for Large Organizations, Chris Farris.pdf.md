Multi-Cloud Visibility for Large Organizations
Chris Farris Public Cloud Security Lead, WarnerMedia
1

Who Am I?
Cloud Security Lead at WarnerMedia My job is to keep the Russians off cnn.com and my friends from downloading Rick & Morty
2

3

How it all started...
4

I've got 99 open buckets but this ain't one
5

Internal Audit
· Audit Finding for access! · Who should be attesting? · What are all the
accounts? · How do we track
privileges?
6

Give us all your external IP Addresses
7

State of Cloud Security
8

Game of Thrones (HBO) Game of Thrones (HBO)9

Global Haystack
16 Regions 875 Accounts 14,000 consoles to look in!
10

11

Multi-account Strategy
12

Why multi-account?
 Anyone remember them?
 Admin keys were leaked  Account was ransomed  Ransom wasn't paid  Account deleted!
13

Tech Sprawl
 Tooling and architecture is a cultural thing  Well ­ a multi-cultural thing
x
14

Diversity in people is good, Diversity in tech stacks, operations, team culture, engineering process is
another story
15

Antiope

https://github.com/turnerlabs/antiope

 Lots of accounts and lots of regions makes for a big haystack  Enterprise tools are ridiculously expensive  AWS Config service doesn't support all AWS services we use  Requirement to track (and identify) foreign AWS accounts  Search engine to help find BGSHs  Opensource  Azure & GCP are in progress  An-Tie-Oh-Pee
Robin Wright as Antiope Wonder Woman 1984 (Warner Bros. Pictures)
16

Easy to add new Lambda Custom Reporting

Ability to trigger external automations

What It Monitors (today)

 EC2

 ECS Tasks &  IAM Roles &

 Security Groups Clusters

Users

 Elastic Network  ECR Repos

Interfaces

 CloudFront

 Lambda & Lambda Layers

 Route 53

 CloudFormation  Trusted Advisor

Domains

 AMIs

 Support Cases

 Route 53 Zones  VPCs, VPN &

 ElasticSearch

Direct connect

18

Custom Stack
 Antiope was designed to be decoupled  Add additional lambda to the Inventory SNS  Add additional Stepfunction to run after  Allows us to pull data from ServiceNow  Generate custom reports
 What EC2 don't have security agents?
19

Don't put lambda in all your accounts

Gremlins (Warner Bros. 1984)

20

What this has enabled...
21

Account Management
"Kids these days with their control towers and organizational admins. Back in my day we had to write
lambda to enable GuardDuty and setup CloudTrail! And we liked it!"
 Auto Discovery of new accounts allowed us to autoenroll accounts into security tooling
22

Centralized GuardDuty
 All GuardDuty fed to centralized account  CloudWatch Events triggers a push to Splunk to Splunk
HTTP Event Collector (HEC)  Must be done in all regions
https://github.com/turnerlabs/aws-guardduty-enterprise
23

Distributed Centralized GuardDuty
 New AWS Organization Feature  One account in the org now in control
Yeah, but I've got 8 payers 8 is better than 800
24

What We Did For Vulnerability Management
25

Inventory!
· Discovered attributes
· Account ID · Payer · Root email
· Custom Attributes
· Exec Sponsor · Data Classification · Service Now records
Aggregation point for all cloud data
26

CloudSploit & Scorecards
· Antiope orchestrates data collection
· Fed to BCS system · Populates VM tool Brinqa
27

Threat Detection & Response
28

Cross Account Role Page
 Name, ID and Owners  Link to quickly assume cross-account role
29

Splunk & ElasticSearch
 Humans use Splunk  Threat Hunting  Investigations
 Lambda use ElasticSearch  Reporting  Data feeds to other systems
30

Threat Hunting
 What public ElasticSearch clusters exist in our environment?
 What security groups have 4505 or 4506 open?
31

Support Ticket Visibility
 All Support tickets are fed to the SOC to capture these
32

Engineering & Finance
 "Hey what is this IP that keeps hitting our service?"  Where is the DNS zone money.cnn.com hosted?  How many EBS volumes or snapshots?  Are the instances tagged properly?  What Route53 domains have we registered?
33

Alternatives
"Architect for the AWS you have, not the AWS you want" ­ Donald Rumsfeld 2003
34

AWS Organizations
 Multi-Account capabilities are getting better  Delegated Admin & Trusted Access make this problem
less hard
But nothing yet crosses AWS Org boundaries
35

AWS Config
 Antiope does much of what the AWS Config recorder does
 ... but without deploying config in 800 accounts and 16 regions
 ... and probably a bit cheaper too.  AWS Config Multi-Account Multi-Region Aggregators are
a good option
36

CloudMapper
 Scott Piper's tool  Originally for visualizations  Has a cross-account role deployment model
37

Build vs Buy

· Intimacy with Boto3 and all the features of a specific API call
· Get exactly what you need
· But...
· you built it, now you own it.

· Fast to market!
· No hiring approvals!
· But...
· Slave to product roadmaps · Perpetual annual licensing
charges

38

Parting thoughts...
39

40

Future
 Azure support soon  Subscription & VM Discovery across multiple tenants
 Azure Perimeter Scanner  Hunt Scripts
41

42
Game of Thrones (HBO)

QUESTIONS?

 @jcfarris  https://github.com/jchrisfarris  https://www.linkedin.com/in/jcfarris  http://www.chrisfarris.com
https://github.com/turnerlabs/antiope

The Dark Knight (Warner Bros. 2008)
43

