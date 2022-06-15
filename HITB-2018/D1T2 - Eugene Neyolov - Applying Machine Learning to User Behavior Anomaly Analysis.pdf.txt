Machine Learning
for User Behavior Anomaly Detection
EUGENE NEYOLOV, HEAD OF R&D

2

AUTHOR

Eugene Neyolov
HEAD OF R&D
Security engineer and analyst leading applied research projects in security monitoring, threat detection and user behavior analytics.

Current Interests
· Building products for · Cyber security with · Data science and · Hype

3

OUTLINE
· Why
o ERP Security o User Behavior Analytics o Machine Learning
· What
o Static Anomalies o Temporal Anomalies
· How
o Data Preparation o Security Analytics o Security Data Science o Machine Learning o Anomaly Detection
4

ERP Security

ERP SECURITY
Blind Spot

· Endpoint security · Network security · Application security · Intrusion detection · Identity and access governance · Business applications security

Infrastructure focused prevention/detection
Where a real ERP attack happens

6

Enterprises

ERP SECURITY
Sweet Target
HR Management Financial Accounting Sales and Distribution Materials Management Quality Management Production Planning Plant Maintenance
Supply Chains ...

Attackers
7

User Behavior Analytics

USER BEHAVIOR ANALYTICS
Why?
· Legacy threat models
o Users are the easiest attack vector
· Legacy incident monitoring
o Infrastructure security focused analysis
· Legacy security alerts analysis
o No business context enrichment
9

USER BEHAVIOR ANALYTICS
What?
· User security monitoring · User-focused alert prioritization · Advanced context enrichment · User behavior vs. fraud analysis
o UBA is about facts in the technical context
- Developer must work with development server A but have accessed server B owned by the finance department
o Fraud is about intentions in a business context
- Salesman signs a contract with company A and not company B, because A is managed by a friend
10

USER BEHAVIOR ANALYTICS
How? · Create a user-centered threat model · Identify user-related data sources · Build a user behavior baseline · ??? · PROFIT!!!
11

Machine Learning

MACHINE LEARNING
Why? · Escape postmortem rules and signatures · Self-adjusted dynamic behavior patterns · Find hidden patterns in user behavior
13

MACHINE LEARNING
What?
· ML tasks
o Clustering o Regression o Classification o Anomaly detection o ...
· Learning patterns from data
o Supervised learning with labeled data o Unsupervised learning without labeled data o Semi-supervised learning with tips from data or humans o Reinforcement learning with a performance feedback loop o ...
14

MACHINE LEARNING
What?
· ML model
o Codebase o Features structure o Model parameters (learned) o Model hyperparameters (architecture)
· ML features
o Categorical (classes) o Statistical (counts) o Empirical (facts) o Continuous o Binary o ...
15

Data Preparation
Collect event data Normalize events
Enrich events

MACHINE LEARNING
How?

Security Analytics
Categorize events Build threat models Map events to threats

Security Data Science
Map threats to algorithms Select and encode features Define quality requirements
Incident Analysis
User behavior analysis Peer group analysis Threat classification

Machine Learning
Build a model Train a model Optimize model parameters
Anomaly Detection
Feed a real data Detect anomalies Prioritize anomalies

16

Data Preparation

DATA SOURCES
· APIs · Log files · Databases · Log archives · Log management tools · Security monitoring tools · ...
18

DATA FORMATS
· Syslog · Custom mess · Random key-value · Proprietary key-value (CEF, LEEF, ...) · Other terrible options (JSON, CSV, ...)
19

DATA NORMALIZATION
· Understand that mess
o When, Who, did What, Where from, Where to, on What
· Bring all formats to the same convention
o Implement a built-in convertor for each format as a part of the solution (inside) o Create a separate convertor tool and treat it as the data source for the model (outside) o Build event storage that allows event fields mapping, like Splunk or ELK (infrastructure)
· Find duplicates and missing fields
o One action generates several entries o System doesn't identify itself in its own logs o User's name is recorded, but not its IP (or vice versa)
20

DATA NORMALIZATION: BEFORE
SAP Security Audit Log ABAP

2AU520180313113209000030400001D1nsalab SAP*

SAPMSSY1

0001F&0

nsalab

2AUK20180313113209000030400001D1nsalab SAP*

SAPMSSY1

0001SLO6&SAPLSLO6&RSAU_READ_FILE

nsalab

2AU220180313114609002315800004D4MacBook-SAP* SESSION_MANAGER SAPMSYST

0001A&1

MacBook-Pro-Nursulta2AU120180313114703002315800004D4MacBook-

SAP* SESSION_MANAGER SAPMSYST

0011A&0&P

MacBook-

Pro-Nursulta2AUW20180313114703002315800004D4MacBook-SAP* SESSION_MANAGER RSRZLLG0

0011RSRZLLG0&

MacBook-Pro-

Nursulta2AUW20180313114703002315800004D4MacBook-SAP* SESSION_MANAGER RSRZLLG0_ACTUAL

0011RSRZLLG0_ACTUAL&

MacBook-Pro-

Nursulta2AU320180313115152002316200008D8MacBook-SAP* SE16

SAPLSMTR_NAVIGATION

0011SE16

MacBook-Pro-Nursulta2DU920180313115155002316200008D8MacBook-

SAP* SE16

SAPLSETB

0011USR02&02&passed

MacBook-Pro-

Nursulta

21

DATA NORMALIZATION: AFTER
SAP Security Audit Log ABAP

Time

Title

User

Device

Action Context 1 Context 2

Context 3

3/13/18 11:32 RFC/CPIC Logon Successful SAP*

nsalab

AU5

3/13/18 11:32 Successful RFC Call

SAP*

nsalab

AUK

3/13/18 11:46

Logon Failed

SAP* MacBook-Pro-Nursulta AU2

3/13/18 11:47

Logon Successful

SAP* MacBook-Pro-Nursulta AU1

3/13/18 11:51 Transaction Started

SAP* MacBook-Pro-Nursulta AU3

3/13/18 11:51

Read Table

SAP* MacBook-Pro-Nursulta DU9

F

0

SLO6 SAPLSLO6 RSAU_READ_FILE

A

1

A

0

P

SE16

USR02

2

passed

22

Security Analytics

ERP SECURITY LOGGING
· Common business application logging
o Event time o Event type o Server info o User info o ...
24

ERP SECURITY LOGGING
· SAP tracks 50+ fields across 30+ log formats
o SAP system ID (business entity) o client number (company sandbox inside a system) o names of processes, transactions, programs or functions (runtime data) o affected user, file, document, table, program or system (context data) o amount of inbound and outbound traffic (network data) o severity, outcome and error messages (status data) o device forwarded the event (infrastructure data) o ...
25

ERP SECURITY LOGGING
SAP Security Audit Log ABAP
· Short list of important fields
o Time o Event type, class o System type (log source) o System ID, server hostname and IP o User name, device hostname and IP o Executed program name (transaction, report, remote call)
26

THREAT MODEL
Use Cases
· 10+ Categories (why)
o Data Exfiltration, Account Compromise, Regular Access Abuse, Privileged Access Abuse, ...
· 30+ Classes (what)
o Data Transfer, Account Sharing, Password Attack, Privilege Escalation, Lateral Movement, ...
· 100+ Scenarios (how)
o Login from multiple hosts, User upgrades its own privileges, Cover tracks via user deletion, ...
27

Security Data Science

ANOMALY TYPES
· Static anomalies
o Unusual action (new or rare event) o Unusual context (server, device, ...) o ...
· Temporal anomalies
o Unusual time o Unexpected event o Huge events volume o ...
29

ANOMALIES VS. THREATS
· Many anomalies are not malicious · Anomalies are statistical deviations · Big infrastructures always have anomalies
30

ANOMALIES VS. THREATS
Matrix Example

Threat Model

Temporal Anomalies

Static Anomalies

Category

Class

Unusual action Unusual time Unusual volume New action New server New device

Unauthorized Access

high

medium

low

Regular Access Abuse

Account Sharing

low

medium

high

high

medium

low

low

medium

high

Password Attack

medium

low

high

low

high

high

Account Compromise Privilege Escalation

high

medium

low

high

medium

low

Access Enumeration

high

low

medium

high

medium

low

Data Exfiltration

Data Transfer

low

medium

high

low

high

medium

31

Static Anomalies

STATIC ANOMALY DETECTION
Plan
· Context building · Context matching · Anomaly analysis

Events Storage

Scoring Engine

Context Matching

Anomalies Storage

Context Building

Context Storage

33

CONTEXT BUILDING

· Whitelist known values for all users · Define anomaly scores for all fields

Events Storage

Scoring Engine

Context Matching

Anomalies Storage

Context Building

Context Storage

34

CONTEXT THRESHOLD

· Problem
o Log poisoning attacks o Anomalies in user context
· Solution
o Importance amplification o Mean of squared values

IP 172.16.100.11 172.16.100.118 172.16.100.137
Threshold

Mean 320 308 30 219

IP 172.16.100.11 172.16.100.118 172.16.100.137
172.16.100.200 172.16.100.201 172.16.100.202 172.16.100.203 172.16.100.204 172.16.100.217 172.16.100.218 172.16.100.219 172.16.100.220
Threshold

Mean 320 308 30
1 1 1 1 1 1 1 1 1 28

Squared 102400 94864
900 1 1 1 1 1 1 1 1 1
8,258

35

CONTEXT MATCHING

· Compare new events with the user context field by field · Assign individual anomaly scores for unknown fields

Events Storage

Scoring Engine

Context Matching

Anomalies Storage

Context Building

Context Storage

36

ANOMALY ANALYSIS

· Get a total event anomaly score from all its fields · Get a total user anomaly score from all its events

Events Storage

Scoring Engine

Context Matching

Anomalies Storage

Context Building

Context Storage

37

Temporal Anomalies

TEMPORAL ANOMALY DETECTION

· Establish a normal behavior baseline · Train to predict normal user actions · Analyze incorrectly predicted actions

Events Storage

Features Encoding

RNN Engine

Anomaly Detection

Anomalies Storage

Model Training

Weights Storage

39

FEATURE ENGINEERING

· Feature selection · Feature encoding

Events Storage

Features Encoding

RNN Engine

Anomaly Detection

Anomalies Storage

Model Training

Weights Storage

40

FEATURE SELECTION
Data

Time

Title

User

Device

Action Context 1 Context 2

Context 3

3/13/18 11:32 RFC/CPIC Logon Successful SAP*

nsalab

AU5

F

0

3/13/18 11:32

Successful RFC Call

SAP*

nsalab

AUK

SLO6 SAPLSLO6 RSAU_READ_FILE

3/13/18 11:46

Logon Failed

SAP* MacBook-Pro-Nursulta

AU2

A

1

3/13/18 11:47

Logon Successful

SAP* MacBook-Pro-Nursulta

AU1

A

0

P

3/13/18 11:51 Transaction Started

SAP* MacBook-Pro-Nursulta

AU3

SE16

3/13/18 11:51

Read Table

SAP* MacBook-Pro-Nursulta

DU9

USR02

2

passed

41

FEATURE ENCODING
Vector

Time

Title

User

3/13/18 11:32 RFC/CPIC Logon Successful SAP*

3/13/18 11:32

Successful RFC Call

SAP*

Device nsalab nsalab

Action Context 1 Context 2

Context 3

AU5

F

0

AUK

SLO6 SAPLSLO6 RSAU_READ_FILE

[ 0.19248842592592594 0.7110773240660063 0.8366013071895425 ]

42

FEATURE ENCODING
Knowledge Base · On-the-fly KB · Security-focused KB · Application-focused KB
o Static (1/100000 scale) o Mapping (1/100 scale)
43

Machine Learning

MODEL IMPLEMENTATION

· Find the right algorithm for a task · Implement a model and its environment · Optimize the model for the best accuracy

Events Storage

Features Encoding

RNN Engine

Anomaly Detection

Anomalies Storage

Model Training

Weights Storage

45

MODEL MEMORY
· Recurrent neural networks
o Simple RNN
- Forgets longer dependencies
o Long Short-Term Memory
- Proven track record
o Gated Recurrent Unit
- LSTM simplified
o Neural Turing Machine
- RNN on steroids
o ...
46

MODEL DESIGN
Architecture

Input

LSTM

Output

Time

Features

Action

Predict

Program
47

MODEL PARAMETERS

· Architecture
o Layers number, Neurons number, Activation function, Loss function, Optimizer, ...
· Data
o Features, Knowledge base, Sequence length, Normalization, ...
· Training
o Epochs, Bach size, Threshold, Distance, Smoothing, ...

Events Storage

Features Encoding

RNN Engine

Anomaly Detection

Anomalies Storage

Model Training

Weights Storage

48

SEQUENCE LENGTH
· ABC DEFGHACKED · ABCD EFGHACKED · ABCDE FGHACKED · ABCDEFGHAC KED
49

KNOWLEDGE BASE SORTING
· Alphabet · Criticality · Frequency

Sorted by Alphabet

Sorted by Frequency
50

ADAPTIVE THRESHOLD
· Error score
o Distance-based
- Predicted value (blue) - Actual value (green)
· Threshold
o Max training error score
· Sensitivity
o As is o Coefficient
51

ANOMALY DETECTION

· Predict a potential user activity · Report incorrectly predicted events above threshold

Events Storage

Features Encoding

RNN Engine

Anomaly Detection

Anomalies Storage

Model Training

Weights Storage

52

ANOMALY DETECTION
Prediction
53

ANOMALY DETECTION
Metrics
· Accuracy 95%
o True Positives 71% o True Negatives 97%
· Errors 5%
o False Positives 3% o False Negatives 29%
54

CONCLUSIONS
· Security analytics is more important than machine learning · ML-driven solutions must help analysts and not replace them · Adjust accuracy and tolerance to false positives for your situation · Build an ecosystem of ML models and advanced analytics on top of it
55

AI BLESS YOU

Eugene Neyolov Head of R&D neyolov@erpscan.com

USA: 228 Hamilton Avenue, Fl. 3, Palo Alto, CA. 94301 Phone 650.798.5255

Read our blog erpscan.com/category/press-center/blog/
Join our webinars erpscan.com/category/press-center/events/
Subscribe to our newsletters eepurl.com/bef7h1

EU: Luna ArenA 238 Herikerbergweg, 1101 CM Amsterdam Phone +31 20 8932892

erpscan.com

EU:

inbox@erpscan.com Sttkova 1638/18, Prague 4 - Nusle,
140 00, Czech Republic

56

