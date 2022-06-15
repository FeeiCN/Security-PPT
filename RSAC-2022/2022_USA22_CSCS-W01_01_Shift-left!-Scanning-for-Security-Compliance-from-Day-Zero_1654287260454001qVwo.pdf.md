#RSAC

SESSION ID: CSCS-W01
Shift-left! Scanning for Security Compliance from Day Zero

Joe McCrea
DevOps Engineer SAP

Rohit Joshi
SecDevOps Engineer SAP

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Introduction

#RSAC
Misconfigurations?
Errors in the configuration of resources hosted on the cloud, leaving it vulnerable.
For example:
­ There is critical information stored in a storage bucket. ­ When configuring the bucket, a mistake was made, making it public. ­ This information is now available for anyone to access.
4

#RSAC
The Numbers
Survey from Vugue on incidents caused by cloud misconfiguration: 73% of organisations citing more than 10 per day. 36% citing more than 100 per day. 10% citing more than 500 per day.
https://www.fugue.co/press/releases/fugue-survey-finds-widespread-concern-over-cloud-security-risks-during-the-covid-19-crisis 5

#RSAC
Policies to detect misconfigurations
A policy is released, which shows how information should be securely stored within storage buckets. It shows how to encrypt the information stored, as well as how the access policy should be written in order to keep the information private. But how do we enforce this?
6

#RSAC
Manually enforced policies
An option may be to access the cloud account and manually check that the policy is being followed. Open to human-error, as something may be missed. This would be fine in the situation where your organisation has a small number of accounts.
7

#RSAC
SAP's Public Cloud Growth

1.8M
January 2019

3.5M
January 2020

7.5M
January 2021

16M
January 2022

8

#RSAC
Policy Implementation at SAP scale

#RSAC
Dealing with Misconfigurations at Scale
Take existing policies Convert to code Execute against account Scale it up Report findings to the appropriate people
10

#RSAC
Sample Policy
All data in buckets should be encrypted All policies for bucket access should be private
11

#RSAC
Policy -> Code
describe bucket(bucket_id: id) it should not be public it should be encrypted
end
12

#RSAC
Technical Demo
13

Results
Good configuration
Private and Encrypted buckets

#RSAC
Bad configuration
Public and Un-encrypted buckets

14

#RSAC
Scaling up!

#RSAC
Listing Accounts ­ `Dispatcher'
Reach out to API of Cloud Provider. Request all accounts that are under the SAP organization. Attach metadata to account IDs. Sends the list of accounts to a message queue to be scanned.
16

#RSAC
Scanning Accounts ­ `Scanner'

Wrap the scanning executable in a container Make the workload stateless

Inputs
Message created by dispatcher, retrieved
from the message queue.
Secrets retrieved from Secret Manager.

Scanning workload
Executes previously demonstrated tests, gets
compliance status of each resource, generates
a report of the current compliance status of
account.

Outputs
Report on the configuration status of
each resource in account, attached to the
input message from queue.

17

#RSAC
Put it in Kubernetes!

Cloud ID & Metadata

Cloud ID & Metadata + Compliance Report
18

#RSAC
Reporting the Results Produced

Reports produced with cloud
compliance report and metadata

Based on metadata, we can determine account
ownership

Inform relevant people for the account with their compliance report
19

#RSAC
Reporting to Engineering Teams

Executive Reporting

Data Exports

API Access

Dashboards
20

#RSAC
Putting the tools in the hands of developers

#RSAC
Shifting Security to the Left
As the solution is in a container, with standard inputs and outputs, we are able to distribute this out to teams within SAP.
Packaged along with the documentation, we can distribute this out for use in CICD pipelines across the company.
This allows teams to shift security to the left, meaning they can detect these misconfigurations during the development phase.
22

#RSAC
Developer Workflow
User makes changes to infrastructure as code Changes are run via CICD pipeline Verify changes using scanning image, revert if necessary
23

#RSAC
Next steps

#RSAC
Shifting left in six months
Next week you should:
­ List the security policies your organisation needs to implement.
In the first three months following this presentation you should:
­ Convert these to code and not just plain text, use a tool of choice. (Make these clear cut!)
Within six months you should:
­ Figure out who needs this info and scale it up!
25

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
© 2022 SAP SE or an SAP affiliate company. All rights reserved. See Legal Notice on www.sap.com/legal-notice for use terms, disclaimers, disclosures, or restrictions related to SAP Materials for general audiences.
26

