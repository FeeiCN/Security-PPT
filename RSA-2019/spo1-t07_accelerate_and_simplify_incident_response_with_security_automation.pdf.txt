SESSION ID: SPO1-T07
Accelerate and Simplify Incident Response with Security Automation

Nick Bilogorskiy
Cybersecurity Strategist Juniper Networks @belogor

#RSAC

#RSAC
Agenda
Advanced Threats TTPs Modern SOC Problems Machine Learning Demystified Automation of Incident Response Questions

#RSAC
Trends: Passwords are the New Exploits
32% of hackers say accessing privileged accounts is the fastest way to hack.
81% of breaches leveraged stolen or weak passwords
Brute forcing a website with a set of stolen passwords is called credential stuffing

#RSAC
Trends: Attacks on 2-factor authentication
SIM swapping is tricking a mobile provider into moving the victim's phone number to another SIM card that is controlled by the attacker.

#RSAC
Trends: Software Supply Chain attacks
· Supply Chain Attacks Surged 200%
in 2017
· 42% of companies had a data
breach caused by a cyber attacks against third parties
· Two thirds (66 percent) grant
privileged account access to thirdparty partners, contractors or vendors.

#RSAC
Trends: Attack automation and packaging

#RSAC
Modern SOC problems
· Alerts Overload · Staffing Challenges · Complexity · Threats Evolving Faster
Than Defenses

#RSAC
"Assume Breach"

Machine Learning Demystified

#RSAC
Hype vs. Reality: The Hype

#RSAC
Hype vs. Reality: Reality
Data, numerical software, high performance computing Prediction, classification, pattern discovery

#RSAC
Security Applications
· Given information about a file or event, answer:
· Is a file or event malicious? (Yes, No) · If malicious, what type of malware is it? (Trojan, Worm, Adware,
etc.) · How can I quantify the risk of the attack? (High, Medium, Low)

#RSAC
Traditional Approaches TO THREAT DETECTION

1

Static

2

Reputation

3

Behavioral

Packer, file type, file size, code obfuscation Detection by checksum match, static property signatures Fast but lacking coverage of newest samples (see WannaCry, for ex.)
Crowdsourcing multiple detection engines (VirusTotal)
Combine detections based on file hash
Good coverage but detection lags due to nature of crowdsourcing. Feedback effects (vendors alter detection based on VT data)
Log behavior from sandboxing (file creation, CnC activity, etc) Manually create "behavioral signatures"
Naïve Bayesian score based on signatures
Can detect unknown samples but takes time (1-10 minutes)

#RSAC
Benefits of ML Applied to Behavioral Detection
Can detect malware using indirect indicators ­ IOC ­ indicator of compromise, i.e. an action only taken by malware ­ Indirect IOC, action that is not necessarily malicious
o i.e. looking in a window vs breaking a window Indirect indicators are difficult to disguise ­ Relative frequency of certain actions ­ Combinations of actions Indirect indicators may provide more generalized detection ­ Able to detect different families that share "tradecraft"

#RSAC
Benefits of ML Applied to Behavioral Detection
· Can easily customize detection focus
­ Using malware training set with particular composition
o for example, with or without adware
· Can adapt to deployment environment
­ Using benign samples from a given organization

In ML Data is King

All machine learning models need to be "trained" on data.

File/event samples
(Training Data)

Feature extraction
 Static  Behavioral  Reputation  etc.

Analyze, clean and normalize data

#RSAC
Train Model

The training data is the most important factor in the success of the model.

#RSAC
The Machine Learning Toolkit
Supervised Learning Unsupervised Learning Semi-supervised Learning
­ Combination of supervised + unsupervised

#RSAC
Supervised Learning: Binary Classification
The outcome of each training sample is already known Training Techniques (i.e. Model Types):
­ Linear/Logistic Regression ­ Support Vector Machines (SVM) ­ Classification Trees, Random Forests, Boosted Trees (XGBoost) ­ Neural Networks ("Deep Learning": CNN, RNN)

Training Data

Sample 1 Features Sample 2 Features Sample 3 Features
...
Sample 1001 Features

Sample 1 = Malware Sample 2 = Clean Sample 3 = Clean Sample 4 = Malware Sample 5 = Malware Sample 6 = Malware ... Sample 2000 = Clean

Train Model

Apply Model on Unknown Samples

Sample X Features Sample Y Features

Apply Model

Malware? Clean?

#RSAC
Linear/Logistic Regression vs Decision Trees

#RSAC
Tangent: What Is Deep Learning?
· Deep learning does not mean "deep understanding"
­ Deep learning uses a Neural Network as the ML model ­ "Deep" refers the number of hidden layers in the network

#RSAC
Machine Learning Model Generation

Trace File 1
[00000 - 0:063] T(3596) 0x1 = GetVersionExW( out: 6, out: 1, out: 7600, out: 2, out: "") [00003 - 0:110] + T(3600) 0 = ZwDelayExecution( bool: 0, size: 5000)
Trace File 2
[00019 - 0:140] T(3940) 0x30152 = CreateWindowExW( bits: 0, [00022 - 0:265] T(3940) 0x103 = RegEnumKeyExW( 0xfa, [00023 - 0:265] T(3940) 0xf8 = CreateFileMappingA( 0xffffffff

Training Set ~ 5K features ~100K samples per file type
Supervised Automated Model Generation

Classifier Models

Multiple Classifiers Different Sensitivity Classifiers per File Type

Trace File 3
[00000 - 0:717] T(3576) 0xd0 = CreateFileW( path: "C:\Program Files\Common Files\plugin_host\P3omQ6uUYGM28 88uu7", bits: 0x40000000, bits: 0, 0, enum: 2, bits: 0x80, 0)

Trace Types Trampoline Hook (winapi) Kernel Tracer (ktrace) Emulation (JS, VBA)

Models Used Decision Tree + Metacost (2012) Logistic Regression (2013-2015) SVM (2013) Random Forest (with active learning) CNN experimentation (2017)

Unsupervised Learning

The "outcome" of each training sample is unknown Example: Finding families of malware Techniques:
­ Clustering algorithms ­ Self-organizing maps ­ Principal Components Analysis (PCA) ­ Archetypal Analysis

Training Data
Sample 1 Features Sample 2 Features Sample 3 Features
...
Sample 1001 Features

Train Model

Discover similar "groupings" of samples

Group 1 Sample 17 Sample 1 Sample 264
...

Group 2 Sample 107 Sample 6 Sample 2
...

Group 3 Sample 936 Sample 851 Sample 1001
...

#RSAC

#RSAC
The Machine Learning Toolkit - Clustering
Clustering is a popular ML tool in malware analysis.
(Feature = "Dimension") But things break down in higher dimensions!

#RSAC
Separating the Signal from the Noise
A "Needle in the haystack" situation: 1 out of every 100,000 samples
Build a classifier which can detect 95% of threats with a 1% FP rate
­ 1 FP for every 100 objects, or 1000 FPs
Note: an FP is 1000x more likely than a detection!
­ Leads to a very high False Discovery Rate (99%) ­ FP rate closer to 0.001% gives an FDR of 50%
o Which for Security/Incident Response is maybe still too high
ML may be able to detect the signal, but perhaps not without too much noise.

#RSAC
Takeaways
The "Gold Standard" for successfully using machine learning
­ Know your data ­ "extend a hypothesis" ­ Know the benefits and pitfalls of your
algorithms ­ Be ready to iterate, rinse, and repeat

Automation of Incident Response

#RSAC
How AUTOMATION Can Help
Collects, correlates and understands data from multiple sources to identify advanced threats. It continuously learns threat behaviors and automatically works with security tools to contain threats. Increases detection accuracy and provides security pros with better data with which to make decisions.

#RSAC
Typical Incident Response Process

New alert

Isthis a

YES

Threat?

ShouldI care aboutit?

YES

Action:

Mitigate and

Remediate

NO

NO

Action: Whitelist and Report FalsePositive

#RSAC
You Should Care if Incident Risk is High
Goal: Better prioritization of effort
Intersect incident targets with asset values
E.g. Guest network activity vs. data center network anomaly
Factor in scope and progression context
How close to "Action on Objectives"
Has attack been disabled by other controls?

#RSAC
Prioritization of Effort
Source, target, payload, etc. Threat vector ­ web, email, document, lateral spread Behavior ­ Trojan, reconnaissance, C&C, exfiltration Prioritized consolidated threat profiles for IR team Extract end-user information from active directory Allows incidents to be identified by username rather than IP address or DNS machine name

#RSAC
Attack Evidence, Scope and Progression
Collect malicious objects: files, PCAPS, network telemetry
Needed to verify incident Needed to determine effective and appropriate mitigation
Attack Scope Which devices/users are affected? How long has attack been active?
o Requires time series data normalized by resource extending back weeks, months, (years?)

#RSAC
Use Cases

Team
Threat Intel hunters

Use case
Moving from big data to the endpoint to find infections

Question
"Who got infected?"

Digital Forensics Incident Response (DFIR) hunters

Moving from infected endpoint "How they got backwards to big data to find hit?" root cause

Primary Attack Vectors
Perimeter Malicious Email
Malicious Web

Lateral Spread

#RSAC
Events from all primary attack vectors: Web, Email and Lateral spread

#RSAC
Killchain
Events span all parts of the killchain

Exploit Download

Install

Command & Control

Lateral Activity

#RSAC
Open APIs
Automation solutions should rely on Open APIs to enable information exchange with other vendors

CASB Endpoint

SIEM

Incident Response Tasks
CASB

#RSAC
Collect data from web, email, etc. Analyze/detect advanced threat Identify infected host/user Ingest meta data from all sources Correlate all related host events Consolidate events on timeline Present as one security incident
Reduces noise from SIEM alerts Eliminates manual correlation Provides insight into threat Simplifies incident response

#RSAC
Architecture

Extensible Event
Ingestion

Context Ingestion

Data/Event Enrichment
Combine Events With Context

 Decouple Ingestion, Storage, Processing  Collect raw data for detection, not just logs  Add Endpoint Identity to all data  Extend to arbitrary time horizon  Elastic Detection processing

Detection Engine Detection Engine Analytics Engine

Storage Cluster

Detection Engine
Elastic Processing
Scales To Match Load

#RSAC
Automation of Common IR Tasks

Malware Investigation Tasks Identify Host and User Collect AV and EDTR data for given host Collect network data (NGFW, SWG) Analyze & Correlate Determine progression and scope Contain the threat TOTAL TIME

Manual Effort Time 10 min 25 min 25 min 35 min 15 min 10 min 2 hours

Automation in Action

Investigation Task Chasing False Positives

Using Automation 38 hours

Post-breach Mitigation

37 hours

Investigating Breach Indicators

55 hours

Total time taken 130 hours

Automation gives ~80% Time Savings over Manual Processes

Manual Process 390 hours 195 hours 177 hours 722 hours

Reducing Cybersecurity Costs & Risks Through Automation Technologies, November 2017

#RSAC

#RSAC
Remember
Attackers are embracing automation, so should we. When done right, machine learning maximizes threat detection. Need a human expert to interpret machine learning results. Accelerate incident response by automating common incident response tasks.

Questions
Email:mikolab@juniper.net Twitter:@belogor

