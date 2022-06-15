EXP-W04

Machine Learning and the Cloud: Disrupting Threat Detection and Prevention

Mark Russinovich
CTO, Microsoft Azure Microsoft Corporation @markrussinovich

#RSAC

#RSAC
Microsoft's daily cloud security scale

10s of PBs
of logs

1+ billion
Azure Active Directory logons

300+
million
active Microsoft Account users

Detected/ reflected attacks
> 10,000
location-detected attacks
1.5 million
compromise attempts deflected

2

#RSAC
Security data explosion

Useful Data

Web server logs

Windows Event logs, Linux syslog

Network logs

Fabric

Data center security token
service

Cloud service logs

3

#RSAC
Challenges with Standard Security Detection Systems

#RSAC
Weak independent alert streams

Created
2/27/2016 3/1/2016 3/1/2016 3/1/2016 3/2/2016 3/2/2016

Severity Task

Fake

Fake

Fake

Fake

Fake

Fake

Fake

Fake

Fake

Fake

Fake

Fake

Assigned To

Category

Fake

Sever Data Health

Fake

Event Count Outliers

Fake

Failed Logins

Fake

Failed Logins

Fake

Event Count Outliers

Fake

Firewall Change

5

Burden of triage
2596 3865 1941

#RSAC
Active alerts 8402 to triage

6

#RSAC
Interpretability of alerts
7

#RSAC
Lack of feedback loop
8

#RSAC
How Machine Learning can help

Reduce triage of burden by PRIORITIZING ALERTS

Account Name

Overall Triage Status
Triage-P1 Triage-P1 Triage-P1 Not-For-Ticketing Not-For-Ticketing Not-For-Ticketing Not-For-Ticketing Not-For-Ticketing Not-For-Ticketing

COMBINING INDEPENDENT ALERT STREAMS and providing informed scoring
Each alert combines multiple points:
Is the sequence of API calls unusual for this account? Is the IP address unusual? Does the time of access look normal?
For our DevOps anomaly detection, we combine over 8 different weaker streams.
9

#RSAC
How Machine Learning can help

Incorporating analyst/user feedback TO IMPROVE THE SYSTEM SIGNAL

PROVIDING INTERPRETABLE RESULTS

From: Sent: To: Subject: [ACTION REQUIRED] Please confirm your recent account activity

We detected the following activity by your...

and

from

Was this you?
Yes, this was me

No, something's not right

When we get an alert, we're informed exactly why the ML system feels it is anomalous. Not a black box.

Unusual UserAgent

Logins Eval

Unusual Location

Failed Login

Unusual Unusual

IP

Activity

Overall Score

1

1

0

0

0

5

5

3

0

0

0

2

0

0

37

324

197106

0

0

0

64

134460

0

0

25

0

521308

0

0

0

0

33648

0

0

3048

0

129

0

1

3

0

94

10

#RSAC
Machine Learning for Security An Introduction

How ML is different

Traditional Programming

Data Program

Computer System

Machine Learning
Data
Output + Assumptions
Source: Lecture by Prof. Domingos

Computer System
12

#RSAC
Output Program

#RSAC
Components of a ML system

TASK

E.g: Predict number of Logons in a end-system

LEARNER Linear Regression

FEATURE Count of logons over time

DATA

Security Event logs

Number of Successful Logons

Linear Regression

3,500

3,000

2,500

2,000

1,500

1,000

500

0

1

2

3

4

5

6

7

8

Time

Number of Successful Logons = 225 * Time + 875

#RSAC
Machine Learning for security is difficult

Lack of ground truth
Data labeled as an attack is rare
Datasets are imbalanced

Disproportionate cost of false negative (missing an attack)

Constantly changing environment

Adversarial setting: deliberately avoiding detection

#RSAC
The data labelling challenge

PROBLEM
You don't know what anomalous activity looks before hand
PROBLEM
Difficult to determine 'good' behavior

SOLUTION
CRAWL: Use publically available data sets to test
CON: Attacker has access to this too! Also, not every dataset is applicable

WALK: Set up Honeypots to collect attack data
CON: Data is not generated on-demand.

RUN: Have a Red Team validate your detection as part of an exercise

Microsoft has access to high quality attack data through MSRC, O365 Advanced Threat Protection, MMPC, DCU.

15

#RSAC
ML Algorithms for Security

#RSAC
DevOps anomalies
Identify user and service accounts Detect and alert on privileged access anomalies

DevOps / Engineers Automated Service

/ Support Experts

Identities

Identities

Security Tokens Secrets & Certificates
RDP/SSH Sockets

Storage Accounts SQL Databases Table Store Queues / Service Bus

Virtual Machines Cloud Services
Resource Providers
Fabric

Cloud Infrastructure & Services

#RSAC
DevOps anomaly detection

Data

Featurizer Build Model

Scoring the data

LOG INPUT MODEL BUILDING

SCORING

Auto-Triage Report with

System

Anomalies

OUTPUT

#RSAC
The anomaly detection problem

N=12 i.e. 12 examples

Two Features or Dimension

Time of Day
1 AM 2 AM 3 AM 4 AM 5 AM 6 AM 7 AM 8 AM 9 AM 10 AM 11 AM 12 PM

Number of Operations
0 1 4 5 6 7 20 25 35 45 60 75

No. of Operations

100 80 60 40 20 0 0

Time vs. Number of Operations

2

4

6

8

10

12

14

Time

Given a new example, is it anomalous or not?

#RSAC
Principal Component Analysis (PCA)

Principal Components can intuitively be thought of as those directions that capture the most variation in the data.
Essentially, any point can be reconstructed as a linear combination of the principal components
Outlier = Any point that has high reconstruction error

High reconstruction error indicates an outlier

#RSAC
PCA at Azure's scale

O(Nd2)+O(d3) O(dkN)

Traditional PCA:
· Nxd matrix of data, N examples, d features

Azure scale: · N = 100,000,000+ data points
and d = 1,000,000 features · Order of 1023 operation

Azure uses Distributed PCA with Random Projection · Random Projection: We pick the directions/degrees of freedom to
find interesting data · Time complexity becomes O(dkN), where k < d · Model builds in 8 minutes

21

#RSAC
Red team detection

Red Team abused 3 APIs in from a DevOps account in Azure Service
Machine learning model threw a P1alert in the order of minutes with reason "Suspicious API activity"

Volume

Rank 1

Account Name

IP Address

TriageStatus

Reason

Triage-P1

Suspicious API Activity

Report LINK

6
5
4
3
2 1
1 0
0

5

0 API names

2 0

Past 7 days Volume

#RSAC

Geo-Anomaly Detection

Timestamp Country

Tue Nov 26, 13 21:45

US

City, State
New York, NY

Service
Storage

State
Normal

Tue Nov 26, 13 22:57

US

New York, NY Storage

Normal

Tue Nov 26, 13 23:24

US

New York, NY Storage

Normal

Tue Nov 27, 13 01:27

IE

Dublin

Storage

Normal

Tue Nov 27, 13 07:31

CN

Shanghai

Storage Suspicious

Tue Nov 27, 13 08:32

CA

Vancouver, BC

SQL

Suspicious

#RSAC
Intuitive geo anomaly detection
Cache the last 10 locations of the user For current location:
If current location != cached locations, challenge user If false positive, add current location to cache

#RSAC
Problems with rules only system

NOISY RESULTS
Company Proxy Cellphone Networks Vacations/Travel

A former rules-based Microsoft system scored
28% of logins as suspicious
1 billion logins per day =
280 million
"suspicious" logins

After applying
Machine Learning
the rate dropped to less than
0.001%

#RSAC
Accurate geo anomaly detection

SECURITY DUALITY
Maximize calling suspicious login behavior, Minimize friction/false positives caused by normal business routines (e.g. conferences, VPN's)
SOLUTION
Simple rules for determining suspicious login, large graph based machine learning approach for determining normal behavior

· Build up expected behavior by incorporating behavior of users similar behavior (but not all users)
· Model travel heuristics and device familiarity requirements
· Flag unexplainable remainder

#RSAC
Understanding user login patterns

Capture past login history
45 day window Weighted based on frequency/time last seen

Calculate user-user similarity Partial mapping between locations Constrained within tenants
User 1 User 2 User 3 User 4

Enumerate possible locations
Random walk with restarts Partial mapping to other similar Geo locations

User
User 3 User 3 User 3

Location
Comcast-Bellevue Comcast-Redmond Microsoft-Redmond

Reachability
965.0 875.0 978.0

User 3

Verizon-Seattle

425.0

User 3 Verizon-Bellevue User 3 Microsoft-Cambridge

350.0 275.0

User 3 ...

Verizon-Boston ...

152.0 ...

#RSAC
Random walk example

User 1 User 2 User 3 User 4

Location
Comcast-Bellevue Comcast-Redmond Microsoft-Redmond
Verizon-Seattle Verizon-Bellevue Microsoft-Cambridge Verizon-Boston

Walk 1 0.7 0.6 0.6789 0.4 0.3 0.45 0.2

Walk 2 0.8 0.7 1.0 1.0 0.3 0.0 0.1

Walk 3 0.7 0.6 0.9 0.1 0.5 0.2 0.0

Walk 4 1.0 0.7 0.8 0.4 0.1 0.1 0.4

....
User 1 User 2 User 3 User 4

Walk 1000 0.9 0.7 0.9 0.6 0.4 0.4 0.7

TRoetaachl aSbciolirtey 965.1 875.3 978.4 425.0 350.2 275.9 152.0

Training: Training of algorithm using Map-Reduce like framework (2 days)

Evaluation: Approximations using Spectral Clustering and Linear Models allows fast evaluations (individual evaluation ~8ms)

28

#RSAC
How likely is a user in a location?

Logging into location increases likelihood of being in a location, decreases likelihood of being in past locations

+% Next Location -% Past Locations
Travel Speed SLOW

Reachability HIGH MED

LOW

Amplitude of change affected by speed of travel and the reachability of location

NORMAL FAST

Users logging into unlikely location with low probability are flagged as suspicious

Location Seattle, WA -Comcast Portland, OR-Verizon Hartford, CT - Comcast

Time Mar 02, 11:31 AM Mar 02, 3:15 PM Mar 02, 4:16PM

Reachability 800.1 119.2 45.8

Redmond L1
L1 1

Portland L2
L1 .4 L2 .6

Hartford
L3
L1 .35 L2 .55 L3 .1

Case study: phishing campaign

TimeStamp

Application

8/21/2015 1:21 Other

8/23/2015 23:20 Other

8/24/2015 7:23 Other

8/24/2015 23:15 Other

8/24/2015 23:22 Other

8/25/2015 1:17 Office 365

8/25/2015 3:42 Office 365

8/25/2015 7:18 Other

8/25/2015 8:14 Other

8/25/2015 23:19 Other

8/25/2015 23:58 Other

8/26/2015 7:21 Other

8/26/2015 7:34 Other

ClientIP
86.139.x 5.148.x 5.148.x 5.148.x 5.148.x 5.148.x 41.206.x 5.148.x 5.148.x 5.148.x 5.148.x 5.148.x 5.148.x

Country
GB GB GB GB GB GB NG GB GB GB GB GB GB

City/State
Oundle Kensington Kensington Kensington Kensington Kensington Lagos Kensington Kensington Kensington Kensington Kensington Kensington

Reachability
607.8 279.2 357.3 357.3 375.8 375.8 44.5 691.1 691.1 691.1 709.6 709.6 709.6

Call
Normal Normal Normal Normal Normal Normal Suspicious Normal Normal Normal Normal Normal Normal

Device
Windows 8.1;outlook.exe(Tablet PC) Windows 8.1;outlook.exe(Tablet PC) Windows 8.1;outlook.exe(Tablet PC) Windows 8.1;outlook.exe(Tablet PC) Windows 8;winword.exe(Tablet PC) Windows 8.1;IE 11.0 Windows 7;Firefox 40.0 Windows 8.1;outlook.exe(Tablet PC) Windows 8;excel.exe(Tablet PC) Windows 8.1;outlook.exe(Tablet PC) Windows 8.1;outlook.exe(Tablet PC) Windows 8.1;outlook.exe(Tablet PC) Windows 8;excel.exe(Tablet PC)

#RSAC

#RSAC
DEMO Azure Active Directory anomaly detection

#RSAC
Summary and Next Steps

#RSAC
Rules versus Machine Learning

RULES
Use when you know exactly what known-bad looks like IOCs, Signatures Known-bad techniques
Use when your detection strategy is atomic e.g: Look for xp_cmdshell in SQL logs
Rules decay quickly over time

MACHINE LEARNING
Helps identify bad activity when simple heuristics fail Must have sufficient historical datasets, including labeled attack data Requires security experts who can provide feedback on quality of results Use when detection strategy is computation and behavioral e.g. Detecting unusual processes running on a host
ML systems, when periodically retrained, do not decay over time

Many solutions will incorporate both rules & ML

#RSAC
Security ML requirements

Machine Learning expertise to think beyond standard toolkits

Data across the stack
Host (Event logs, syslog, AV logs)
Network logs
Service & application logs

Secure and scalable platform

Eyes on glass

Testing with real attack data

34

#RSAC
Azure Machine Learning

#RSAC
Next steps

Next week

Next month

DO Tinker around with this ML Network Intrusion Detection system!
EXPLORE ML as a service and security-as-a-service solutions

Plan and collect logs from all layers: host, network, service & application
36

In 3-6 months
Develop an architecture to collect high-quality attack data Make it a habit to identify and investigate security anomalies

#RSAC
Summary

Recall ML for security improves

Interpretability

Actionability

Burden of triage

Keys to successful detection

Data is key

Secure and scalable platform

Specialized investment beyond standard machine learning toolkits

It is important to establish the credibility of the system by testing its simulated adversaries

Mark Russinovich CTO, Microsoft Azure markruss@microsoft.com @markrussinovich

37

