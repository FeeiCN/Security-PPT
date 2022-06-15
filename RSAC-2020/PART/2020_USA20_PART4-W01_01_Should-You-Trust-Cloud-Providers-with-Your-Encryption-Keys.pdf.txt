SESSION ID: CPART4-W01
Should you trust your cloud providers with your encryption keys?

Sol Cates
VP of Research & Technology Thales Group @solcates

#RSAC

#RSAC
Agenda
Cloud Trends Cloud Security is a Shared Responsibility so you must encrypt But Then The Keys BYOK vs HYOK HYOK Case Study ­ Google Cloud EKM Attributes of a Cloud Key Management solution
2

#RSAC
Cloud Trends
From the 2019 Thales Cloud Security Report

Businesses adopt a multi-cloud strategy when it comes their IT infrastructure and services needs

#RSAC
48%
of organizations have a multi-cloud strategy, with AWS, Microsoft Azure and IBM being the top three cited cloud providers
4

#RSAC

29 Businesses use

cloud

27 applications on average, compared to

two years ago

over

10%
have more than 50 and the average US business has 41
5

#RSAC
Cloud security responsibility is distributed

40% 35%
Who is most 30%
responsible for protecting
20%
sensitive data stored in the
10%
cloud?
0% The cloud provider

31%

33%

The cloud user

Shared responsibility

1% Not applicable

6

only

30 %
of organizations have a unified system for secure access to both cloud and on-premise applications
7

#RSAC
32 %
don't employ a securityfirst approach to storing data in the cloud

#RSAC

Businesses are not applying adequate security measures to protect sensitive data in the cloud

only

49%
of organizations are encrypting sensitive data in the cloud

8

#RSAC
Only half of businesses remain in control of the keys to their encrypted data stored in the cloud

53%
of businesses are controlling the encryption keys when data is encrypted in the cloud

despite
78% saying it's important to retain ownership of the encryption keys

9

#RSAC
"Cloud Security is a Shared Responsibility"

#RSAC
AWS on shared responsibility model
https://aws.amazon.co m/compliance/sharedresponsibility-model/
As shown in the chart below, this differentiation of responsibility is commonly referred to as Security "of" the Cloud versus Security "in" the Cloud
11

#RSAC
Microsoft Azure on shared responsibility model
https://blogs.msdn.microsoft.c om/azuresecurity/2016/04/18/w hat-does-shared-responsibilityin-the-cloud-mean/ The figure at right shows MSFT's take on the shared responsibility model
12

#RSAC
But you're not doing it

71% of enterprises
use sensitive data in cloud environments

71% 30%
Source: 2019 Thales Data Threat Report by IDC

But only 30% use
encryption in these environments

13

#RSAC
Cloud security alliance on cloud encryption keys
EKM-04
[Encryption] Keys shall not be stored in the cloud but maintained by the cloud consumer or trusted key management provider.
14

#RSAC
CSA says maintain the keys

What part of the key do you maintain?
Do you create and upload the key? Does the provider create the key, and you manage it?

What does maintain mean?
Is this full lifecycle management? How is key lifecycle management shared?

15

Sourcing your own keys
Generate and Securely store your keys
OpenSSL? HSM? Private KMS? High Entrophy for good key quality Where does the secret sauce sit?
Managing your keys
Rotate them? Remember each version's key material? In a spreadsheet? How will you maintain them?
16

#RSAC

#RSAC
BYOK vs HYOK

BYOK
Pluses
Wide spread, all IaaSs have a KMS Many solutions in the marketplace to discover Data Key Pedigree - You generated the DEK material
Minuses
Key is "granted" to the provider protected with their KEK on your behalf Must trust the tools to tell you what is happening with your keys

HYOK
Pluses
DEK material is protected by your KEK in your EKM service The provider has no direct access to your DEK/KEK
Minuses
Potential SLA impact to provider Data Key Pedigree - provider generates the DEK material

17

#RSAC
BYOK
Requirements for Bring Your Own Encryption

Cloud key lifecycle management comparison

Automated Key Lifecycle Management

Admin in the middle Lifestyle management

Destroy

Create

Back Up

Destroy

Create

Back Up

#RSAC

Archive/ Suspend

Deploy

Archive/ Suspend

Deploy

Expire

Rotate

Monitor
19

Expire

Rotate

Monitor

#RSAC
How to bring your own key

Small Scale
Major IaaS/PaaS providers enable you to upload a key to their cloud High scale operations are cumbersome Major challenge: quality of imported keys, and potential for human error

High Scale
Build-or-Buy decision
Build and maintain a cloud key management using each provider's BYOK API
Buy a multi-cloud key management solution

20

#RSAC
Requirements for multi-cloud key management

Most Common Clouds
AWS MS Azure MS Office365 Salesforce Google Cloud

Requirements for Efficiency & ROI
Full key life cycle management Create / upload / ROTATE / disable / delete Federated login and corresponding access to key rights

Core Functionality

Operational Requirements

Secure key source and storage Manage existing keys in the cloud Revoke and delete keys

GUI for understanding and regular use All clouds in one "pane of glass" API for operating at scale
21

#RSAC
HYOK Case Study
Google Cloud Platform

#RSAC
HYOK

Some providers have introduced a few approaches to "HYOK"
Salesforce ­ Cache-Only Key Service
Azure ­ Synchronize keys from offcloud to cloud
Google ­ External Key Management with Wrapping/Unwrapping

Differences in approaches mean unique solutions and implementations may be needed
Can this be consolidated?

23

#RSAC
Google cloud - External key management

EKM wraps Crypto Keys with an externally managed key
CloudKMS requests that the key be unwrapped with context

EKM evaluates the context and justification to see if authorized
The EKM can be used to prevent undesired requests for data access

24

#RSAC
So What Do You Do First?
How can you start your journey?

#RSAC
Questions to start your journey tomorrow

Questions to ask each of your cloud providers

Questions to ask yourself

Support encryption? If so, what kind of Key Management? Can I manage the keys off-cloud?

What is our cloud management strategy?
How do we bridge that to our enterprise key management?
Do you have the tools or the staff for cloud key lifecycle management?

26

SESSION ID: CPRT4-W01
Thank You
Sol Cates
VP Research & Technology Thales Group @solcates

#RSAC

