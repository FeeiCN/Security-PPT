Threat Detection based on Deep Learning at Scale

Karl Peter Fuchs - karl.fuchs@siemens.com Jan Pospisil - jan.pospisil@siemens.com
Siemens Cyber Defense Center

Restricted © Siemens AG 2019

www.siemens.com/cybersecurity

Cyber Defense Center
Globally distributed Team Mission · Monitoring of Siemens
infrastructure worldwide · Identify and analyze
security threats

Page 2

2019

Cyber Defense Center

Focus Area

Karl Peter Fuchs and Jan Pospisil

Cyber Defense Center
Mission: Threat Detection

Log Collection
(Endpoints, Servers, Proxies, AD, Packet Captures, Sandboxes, Email Servers...)

Store, Enrich, Alert

Siemens Corporate Network
(500,000+ Hosts, 350,000+ Users)

Threat Detection System Storage
Search Tools Dashboards
Hybrid Cloud Solution
(50,000+ Events/Sec)

Page 3

2019

Analyze, Verify, Hunt
Security Analysts
Karl Peter Fuchs and Jan Pospisil

Cyber Defense Center
Main Detection Components
Static Analysis

Exact Matching: Rulesets, Regexes, Periodic Search Queries, Scripts etc.

Page 4

2019

Dynamic and Hybrid Analysis
Key motivation for us: · More robust detection: Learn general
malware characteristics · Enable novel detection vectors: E.g.,
image recognition for phishing detection · Automate repetitive tasks
Machine Learning, Artificial Intelligence and Deep Learning: Non-exact Matching, Aggregate/Preselect/Visualize etc.
Karl Peter Fuchs and Jan Pospisil

AI and Deep Learning on the Rise
High expectations due to success stories

Self-driving Cars

Page 5

2019

Translation

Cancer Detection
Karl Peter Fuchs and Jan Pospisil

AI and Deep Learning on the Rise
How about Security?

Dedicated Workshops

Large amount of new Papers

Numerous (Open Source) Tools and Implementations

Page 6

2019

Karl Peter Fuchs and Jan Pospisil

AI and Deep Learning on the Rise
Key Challenges (in Large Environments):  Huge gap between research and practice

Environment A

Environment B

Limited Generalizability

Limited Scalability

Accuracy (TPs, FPs etc)

Performance

No Standard Architectures

Page 7

2019

Shallow Learners
Amount of data
Not enough (labeled) Data

Technical Challenges
Karl Peter Fuchs and Jan Pospisil

Use Case: DGA Detection

What is a DGA doing?

1

Malware: attempt to communicate with Attackers' server

Infected Host

Page 9

2019

www.IamEvil.com
Karl Peter Fuchs and Jan Pospisil

What is a DGA doing?

2

Defenses Up: blacklist stops the communication

Infected Host

Page 10

2019

Blacklist

www.IamEvil.com
Karl Peter Fuchs and Jan Pospisil

What is a DGA doing?

3

DGA in action

Infected Host

Page 11

2019

www.IamEvil-0001.com www.IamEvil-0002.com www.IamEvil-0003.com
Karl Peter Fuchs and Jan Pospisil

What is a DGA doing? 4 Simply blocking domDGaAininstodaocteiosnnot scale anymore

Infected host

Page 12

2019

www.IamEvil-0001.com www.IamEvil-0002.com www.IamEvil-0003.com
Karl Peter Fuchs and Jan Pospisil

A Simple DGA Example

Page 13

2019

[CryptoLocker DGA]
Karl Peter Fuchs and Jan Pospisil

Quiz: Can you distinguish Legitimate Domains from Malicious ones?

xjpakmdcfuqe.nl

edkowalczyk.com

b9qmjjys3z.com skhhtcss.edu.hk reqblcsh.net

oqjiwef12egre6erg6qwefg312qrgqretg132.com

abcdefgtfddf2223.com
watdoejijbijbrand.nl blkdmnds.com
lkckclckl1i1i.com

kdnlrklb.com

cilavocofer.eu

hzmksreiuojy.in

llanfairpwllgwyngyllgogerychwyrndrobwll-llantysiliogogogoch.com

Page 14

2019

Karl Peter Fuchs and Jan Pospisil

Quiz: Can you distinguish Legitimate Domains from Malicious ones?

xjpakmdcfuqe.nl

edkowalczyk.com

b9qmjjys3z.com skhhtcss.edu.hk reqblcsh.net

oqjiwef12egre6erg6qwefg312qrgqretg132.com

abcdefgtfddf2223.com
watdoejijbijbrand.nl blkdmnds.com
lkckclckl1i1i.com

kdnlrklb.com

cilavocofer.eu

hzmksreiuojy.in

llanfairpwllgwyngyllgogerychwyrndrobwll-llantysiliogogogoch.com

Page 15

2019

= malicious
Karl Peter Fuchs and Jan Pospisil

Name of a town in Wales
[https://www.youtube.com/watch?v=fHxO0UdpoxM]

Detecting DGAs with Deep Learners

Detecting DGAs with AI

Page 18

2019

1. Characters are converted to ASCII tokens
2. Tokens are embedded into multi-dimensional vectors
3. Forward layers or Recurrent layers can be utilized to generate features
4. Fully connected layers can be used to increase the model depth
5. A suspiciousness score is assigned based on the output of sigmoid output neuron or softmax layer
Karl Peter Fuchs and Jan Pospisil

Example CNN Layer with UMAP

Page 19

2019

© Marionete Limited 2018

5
3 2 1
Norm Karl Peter Fuchs and Jan Posapilsil

Results

Deep Learning Approach

Shallow Learner Approach (

Accuracy (%) TPR (%) FPR (%) TNR (%) FNR (%)

Accuracy (%) TPR (%) FPR (%) TNR (%) FNR (%)

98.64

98.08

0.77

99.23

1.02

84.36

96.78

31.56

68.43

3.21

Page 20

2019

Karl Peter Fuchs and Jan Pospisil

Design Platform and Operationalize

Operational Challenge
500,000+ Hosts 50,000+ Events per second 6+ TBs of data per day 24/7 Operations Highly Volatile Loads (20x)

Page 22

2019

Karl Peter Fuchs and Jan Pospisil

Operationalize Smart!
500,000+ Hosts 50,000+ Events per second 6+ TBs of data per day 24/7 Operations Highly Volatile Loads (20x)

Don't burden your team with
Auto Scaling (Elasticity) Auto Failover Server Patching Backups
Go Serverless

Page 23

2019

Karl Peter Fuchs and Jan Pospisil

Important Pipelines
Ingest and Inference

1

Ingest Pipeline: Store AD- Proxy- Email-Logs into the S3

Log Sources

Endpoint Network

Kinesis Streaming

S3 Landing Zone

Page 24

2019

Karl Peter Fuchs and Jan Pospisil

Important Pipelines
Ingest and Inference

2

ETL: Cleaning and Transforming Data

Log Sources

Endpoint Network

Kinesis Streaming

S3

Glue

Landing Zone Incremental ETL

S3 Data Lake

Page 25

2019

Karl Peter Fuchs and Jan Pospisil

Important Pipelines
Ingest and Inference

3

Presentation: Create Statistics, Provide Data to Analysts

Log Sources
Endpoint
Network

Kinesis Streaming

S3

Glue

Landing Zone Incremental ETL

S3 Data Lake

Athena
Analyze Incidents and
Query History

IOCs
Incident Analysis

Page 26

2019

Karl Peter Fuchs and Jan Pospisil

Important Pipelines
Ingest and Inference

4

Detection: Real Time Prediction of Threats

Log Sources
Endpoint
Network

Kinesis Streaming

S3

Glue

Landing Zone Incremental ETL

S3 Data Lake

Athena
Analyze Incidents and
Query History

SageMaker AI Predict Incidents

Page 27

2019

IOCs
Incident Analysis
Data Scientists
Karl Peter Fuchs and Jan Pospisil

Important Pipelines
Ingest and Inference

4

Detection: Real Time Prediction of Threats

Log Sources
Endpoint
Network

Kinesis Streaming

S3

Glue

Landing Zone Incremental ETL

S3 Data Lake

Athena
Analyze Incidents and
Query History

SageMaker AI Predict Incidents

Page 28

2019

IOCs
Incident Analysis
Data Scientists
Karl Peter Fuchs and Jan Pospisil

Important Pipelines
AI Model Generation and Deployment

Build a Model

Validate Model A/B Testing etc.

model.py config. yaml

Data Scientist

Page 29

2019

Deliver Model to Endpoint

Deploy Model to Pipeline

Gate: requires human approval
Karl Peter Fuchs and Jan Pospisil

Important Pipelines
AI Feedback Loop

Constantly improve Models with TPs/FPs from Security Analysts

Security Analysts

Build a Model

Validate Model A/B Testing etc.

model.py config. yaml

Data Scientist

Page 30

2019

Deliver Model to Endpoint

Deploy Model Continuously

to Pipeline

measure

Model quality

Gate: requires human approval
Karl Peter Fuchs and Jan Pospisil

Thank You

