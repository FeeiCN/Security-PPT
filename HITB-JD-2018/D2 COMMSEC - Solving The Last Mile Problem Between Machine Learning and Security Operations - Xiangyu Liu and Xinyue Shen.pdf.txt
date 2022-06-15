ALIBABA SECURITY
Xiangyu Liu, Xinyue Shen

Whoami

· Xiangyu Liu
· Senior Algorithm Engineer @Alibaba Security · CUHK PhD (2016) · Academic: IEEE S&P, ACM CCS · Industry: DEF CON, Black Hat Asia · Interests: Machine Learning, Cybersecurity
· Xinyue Shen
· Algorithm Engineer Intern @Alibaba Security · Interests: Cybersecurity, NLP, Knowledge Graph
· Special Thanks
· Tao Zhou, Quan Lu, Security Operation Team @Alibaba Security

What is Security Operations?
A security operations center (SOC) is a centralized unit that deals with security issues on an organizational and technical level.
----WikiPedia

What is Security Operations ?

What others think I do

What I think I do

What I really do

Why not introduce Machine Learning in SOC ?

Challenges
Partially Observable
Hard to collect all security-related data

Uncertainty
Depend on attackers and environment

Correlation
Current decisions affect subsequent

Strong Interpretability
Security needs strong interpretability

Challenges
Partially Observable
Hard to collect all security-related data

Uncertainty
Depend on attackers and environment

Correlation
Current decisions affect subsequent

Strong Interpretability
Security needs strong interpretability

What ML can do in Security

· Data + Close Domain+ Quantitative Expert Experience

Application Security

Spam Email

Porn Identification

Credit Card Fraud

......

Web Security

Phishing

Botnet

XSS

......

System Security

PUF

PBS

Device Authentication

......

Application of Machine Learning in Cyberspace Security Research. Lei Zhang, Yong Cui, Jing Liu, Yong Jiang, Jianping Wu. Chinese Journal of Computers, 2017.

Is there anything wrong when they meet SOC?

The Gap Between Machine Learning and Security Operations

Data Scientists

Security Operation Experts

"The Accuracy Rate of Our Model is 99.9%!"

"Sounds good. But our data scale is enormous. Over 100 million every day."

"So, even the accuracy is high, your model will still produce 100000 alerts every day...."

"Well .... How many alerts can you handle?"

"only 100 alerts per day!"

The Gap Between Machine Learning and Security Operations

Data Scientists

Security Operation Experts

Produce 100000 alerts per day

Handle 100 alerts per day

"And this is only one model."

The Gap Between Machine Learning and Security Operations

Data Scientists

Security Operation Experts

Produce 100000 alerts per day

Handle 100 alerts per day

"How many attack types we may meet in reality?"

Ref. https://attack.mitre.org/

ATT&CKAdversarial Tactics, Techniques, and Common Knowledgeis a globally-accessible knowledge base of adversary tactics and techniques based on real-world observations.
----MITRE

The Gap Between Machine Learning and Security Operations

Data Scientists

Security Operation Experts

Produce 100000 alerts per day

Handle 100 alerts per day

"So actually the number of alerts is 100000 × 300 + per day..."

The Gap Between Machine Learning and Security Operations

Data Scientists

Security Operation Experts

Produce 10000 alerts per day

Handle 100 alerts per day

Can we bridge the gap and solve this awkward thing?

Our Solutions
· Behavior analysis · Feature based sorting · Ensemble risks · Knowledge graph · White list ·...

Best Practices: Large-Scale Data
· · ·
· · ·

Best Practices: Behavior Analysis

· A cyber-security problem can be taken as consisting of several subproblems · Machine learning can be applied in some part · The malicious behaviors can be distinguished by rules or can be clustered

· Our Approach

Data

ML Models

Prediction

Prediction Results

Behavior Analysis Filter rules
Clustering

Results

Best Practices: Behavior Analysis

· Example
· Domain generating algorithm (DGA) detection · A DGA is a program that provides malware with new domains · Mistakes: Using ML to detect DGAs directly
· Approach
· ML is used to detect the randomness of domains
· LSTM, Ngram, and etc.
· Filter rules
· IP relationship, number of requests, number of subdomains, and etc.
· Clustering
· The features described above, and/or embedding techniques

earnestnessbiophysicalohax.com kwtoestnessbiophysicalohax.com rvcxestnessbiophysicalohax.com hjbtestnessbiophysicalohax.com txmoestnessbiophysicalohax.com agekestnessbiophysicalohax.com dbzwestnessbiophysicalohax.com sgjxestnessbiophysicalohax.com ......

Best Practices: Feature Based Sorting

· Focus on precision

Y

· Feature extraction
· Assume we have only two features: X and Y

· Scoring:
· if A is more malicious than B in every dimension, Increment A's score by one
· Can be customized

· Sorting:
· Let N denote all the elements, K as the budget of SOC · Sort N by each element's score, and select top K elements

More Malicious

E F

A

C

D

B

More Malicious

X

Best Practices: Feature Based Sorting
· Compare with historical data
· Extract features per day/hour/... · Sort the data in a longer time window, e.g. one week
· Application
· Phishing detection, Usenix Security'17 · UEBA ·...
· Limitations
· At the expense of recall · What features to extract is very hard to determine
Ho, G., Javed, A. S. M., Paxson, V., & Wagner, D. (2017). Detecting Credential Spearphishing Attacks in Enterprise Settings. USENIX Security'17

Best Practices: Accumulation Risk

Alerts Pool 1. xxx 2. xxx 3. xxx 4. xxx

Security Operation Experts

Best Practices: Accumulation Risk

Traditional Way:

 

DNS Rare 5 HTTP Rare 3 Phishing 8 ......

Problems behind it: 1. Not all related alerts
can be produced. 2. Lateral movement is
common.

Sum

16

Best Practices: Knowledge Graph

Entity Extraction
Relationship Extraction
Attribute Extraction

5A .

5 A 6E A 5 03 5

3 DDDDDDD

DD DD DD
.

5

AA

E

Kill Chain Stage

Life Cycle

A 3A
33
05
Confidence

Alerts Pool

C5 5
565 5 35 5A
A AE A

Some attributes

Best Practices: Accumulation Risk

· Kill chain stage
· Life cycle · Confidence

· ......

After identify the Schema, every alert is a Triple(entity-relationship-entity).

Alerts Pool
1. xxx 2. xxx 3. xxx 4. xxx

Single Alerts:

88 88 888

Multi-hop Alerts:

8888888

0 .. 5 0

663 0
88 88 88

0 .. 5 0

An intrusion case is usually combined by many multi-hop alerts!

0 .. 5 0

Best Practices: Accumulation Risk

An intrusion case is usually combined by many multi-hop alerts!

Eg. An intrusion graph

0 61
.
10

28 65 28 65

5 3.3 . 5

0 61

5 3.3 . 5

0 61

6 20 . 5

0

Multi-hop alerts

Best Practices: Accumulation Risk

Alerts Pool

Extracted

Small Graph Small Graph

Calculate Risk Score

1. xxx 2. xxx 3. xxx 4. xxx

Small Graph Small Graph

Risk List

Security Operation Experts

1st

2nd

3rd

4th

Accumulation Risk Module

...

Kill Chain Stage

Model Confidence

Basic Score

......

Best Practices: Knowledge Graph

Security Operation Experts
5 3 GGGGGGG
6 3C3

Risk List 8

1st

3 53B

2nd

3rd

4th

...

03C

GC 35C

CC 3 3
GG GG GG

3 3 5 DB 5

GG GG GG

C CC 3 3

II

GGG GGG GG
23
GG GG GGG

3 5 DB 5 3C 5
GGG GGG GG

. F6 8 5
Alerts Pool

F 1D 3C

2C 3C . F 6 3B
23 3E
B5 E

Summary
· An in-depth analysis on state-of-the-art security operations and machine learning techniques, reveals the gap between them.
· Several strategies are proposed to solve the last mile problem. · As showcases, we demonstrate how to implement these approaches in practice.

