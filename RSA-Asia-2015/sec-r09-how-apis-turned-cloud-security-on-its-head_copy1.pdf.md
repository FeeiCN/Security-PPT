SEC-R09
How APIs Turned Cloud on Security on Its Head
#RSAC
Rajneesh Chopra, VP of Products, Netskope @rajnchop

#RSAC
How APIs Turned Cloud Security on Its Head
 What happened to the perimeter?
 APIs make us move fast  But they turned cloud
security on its head  Here are some "how-tos"
2

#RSAC
Perimeters and Unicorns Two things that only exist in IT fairyland

#RSAC

#RSAC
5

#RSAC
APIs Expose Conceptually Simple Services
6

#RSAC
Challenging at Scale
7

#RSAC
Making Complex Services Simple

Content Services Platform (APIs, SDKs)

Search

Security

Acceleration

Storage

Rules

Conversion

Collaboration

Logging

8

· Cluster of servers running SOLR (strip text, format)
· All flash and solid state disks

Native Apps
Collaboration Editing/Creation

Third Party ISV
Enterprise SaaS OneCloud Mobile

Custom Apps
Enterprise IT Systems Integrators

Content Services Platform (APIs, SDKs)

Search

Search

Security

Acceleration

Storage

Rules

Conversion

Collaboration

Logging

9

#RSAC

#RSAC
10

#RSAC
"50% of salesforce.com revenue comes from their app ecosystem"
11

#RSAC
5 Reasons Why APIs Turned Security on Its Head
12

#RSAC
WE CAN'T LIVE WITH OUT
WE CAN'T KICK THEM OUT

#RSAC
1. Data is easy to share
14

#RSAC
2. Data is no longer owned by the app
15

What Else APIs Can Tell You

Meet Gary

Gary got a new job

Sales Rep

Along the way, Gary took a detour

16

#RSAC
BIGGEST COMPETITOR, INC.

#RSAC
3. The gateway is dead
VPN
17

#RSAC
4. Your app ecosystem is only strong as its weakest link
18

5. Activity-level Detail through Rich APIs

Identity

App

Activity

Data

#RSAC
Summary

* Login as: mary@acme * Box ID: mary@gmail * Using: Macbook/Safari * From: Mtn View, CA * Destination: Box site located in Germany * To user: sharing a doc with "John@Newco"

* App: Box

* Category: Cloud Storage

* CCL: High * Risk: High

· Login · Upload

· Download

· Share

· Logout

· Invite

· Edit

· View

.....

· PII/PCI/PHI data

· Other sensitive

classifications

App session end

App: Box

Using: Macbook, Safari 6.0

From: Mountain View, CA

Activities: Create Folder, Move

Files (4), Share Folder w/

John@NewCo

Anomalies: Downloaded a PII

doc from SFDC and uploaded

to box

19

#RSAC
Let's take a look at this in practice..
20

#RSAC
Healthcare Case Study
Global Healthcare organization
 Founded in 1945  One of the nation's largest not-for profit health plans  Serve approximately 9.5 million members
21

#RSAC
Use Case #1 Protect PHI content in files

· Real time detection of sensitive

data from mobile or laptops

· Dynamic quarantine allows

further review by compliance

administrator



22

22

#RSAC
Deployment Architecture ­ Cloud DLP for cloud apps
With On-Prem DLP Validation

All Devices: PC, Mobile and BYOD All locations: On-premise and remote All Cloud Coverage: Sanctioned & Unsanctioned

SSL

Internet

ANALYTICS & REAL-TIME POLICY ENGINE

ICAP Forwarder
ICAP
On-premise
Enterprise

Workflow · Cloud DLP screens cloud bound content · DLP violation results in content quarantine to on-prem ­ Secure Forwarder · On-prem Secure Forwarder ICAPs content to Ent DLP solution · Action taken on DLP verdict using Netskope APIs

#RSAC
Customize Quarantine, Remediation Workflow with REST API

End

Netskope

User

DLP Engine

Quarantine Approver

1
File upload attempted
User notified of quarantine

File upload denied

Quarantine Folder

Email to
Quarantine Approver

Quarantine

3

Alert

2 File sent to Quarantine Folder

8 Install DLP bypass rule if "Permit"

Email user
7 outcome and next steps

Netskope Mgmt Plane

REST API
4

Ent DLP

5
File pulled by Ent DLP for secondary inspection

Permit or Block

6

24

#RSAC

Data Upload

Quarantine workflow

Quarantine Repository

User
25

#RSAC
Use Case #2: Protect sensitive content when employees and contractors store it in the cloud
26

#RSAC
Workflows for DLP



27

27

#RSAC
Summary
 Ecosystems are the life-blood  Be mindful of data ownership -- is it your data at the end of the day?  Apps are designed to share data -- you can't avoid this reality  The app is the perimeter now -- asserting control from the data center is
no longer viable  Only strong as your weakest link -- the ecosystem matters  Get activity-level detail + metadata in order to be the master of this new
frontier
28

#RSAC
How to Secure Cloud App Usage

1: Discover the cloud apps running in your enterprise

4: Enact a cloud app policy that people can get behind

2: Understand the context of usage at a deeper level

5: Monitor usage, detect anomalies, conduct forensics and prevent sensitive data loss

3: 6: Plot your course of action based on risk, usage, criticality

Don't leave users in the dark. Coach them on safe usage.

#RSAC
Let's stay connected
Rajneesh Chopra, VP of Products, Netskope
@rajnchop @netskope www.netskope.com rajneesh@netskope.com
30

