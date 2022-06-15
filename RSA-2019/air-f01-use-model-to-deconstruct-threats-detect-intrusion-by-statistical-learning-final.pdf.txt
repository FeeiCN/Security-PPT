SESSION ID: AIR-F01
Use Model to Deconstruct Threats: Detect Intrusion by Statistical Learning
Tao Zhou
Senior Staff Algorithm Engineer Alibaba Security, Alibaba Group
#RSAC

Challenge: Security Data Analysis in Internet Giants

#RSAC
Hacker's Intrusion and Data Breach
Data leakage brings huge losses to Internet giants.
3

#RSAC
Attack and Defense is the Contest Between Humans
What's the advantages on defense side?
­ Control over network infrastructure ­ Ability to deploy security devices and data collection instruments
4

#RSAC
Data is the Biggest Advantage of Defenders!

Endpoint:
· AV · EDR · HIDS · RASP...

Network:
· NGFW · IDS · Access Gateway · Audit...
5

Business System:
· DNS · Mail · IAM · VPN...

#RSAC
Gap Between Data Collection and Security Operations
We upgrade the security monitor ability! Now we collect more than 50 kinds of devices, and produce 5 billion
records per hour!
Well, I can handle up to 100 alarms per day...

Network administrator

How To Handle the Gap?
6

Security Operator

#RSAC
Different Modes in Security Data Analysis
Correlation Analysis

Statistical Modeling

Security Data Analysis
7

Machine Learning

#RSAC
Machine Learning vs. Statistical Modeling
Machine Learning: Rely on data and algorithms
· Large amount of labeled data · Feature engineering / log embedding · Proper learning algorithms
Statistical Modeling: Rely on human's experiences
· Find common trait of attack behavior · Feature engineering · Proper statistical algorithms
8

#RSAC
Machine Learning Has Less Opportunity in Intrusion Detection Machine Learning is good at finding normal patterns, but intrusion is abnormal behaviors.
­ Can't simply think that abnormal data is left after normal is removed.
`Big data' is not equivalent to `Big labeled data'
­ The accuracy and recall rate of unsupervised learning can't support security operations.
9

#RSAC
Machine Learning Has Less Opportunity in Intrusion Detection
An open domain problem of intrusion detection.
­ It's difficult to define a proper loss function to judge whether a record represent intrusion or not.
Interpretability of results.
­ Only the answer of `yes or no' is not enough for security analysis.
10

#RSAC
Suitable Scenarios for Machine Learning in Intrusion Detection
Specific area. Easy to cumulate labeled data.

Spam detection

DGA domain detection
11

Web Crawler detection

Solution: Use Statistical Modeling to Deconstruct Threats

#RSAC
Key Point: Intrusion Trace Detection
Rome wasn't built in a day: effective attacks always take a long process.

Long Time

Multiple Stages
13

Multiple Nodes

#RSAC
The Process of Security Data Analysis

Data preprocessing
· Remove interference of normal data

Alarm Correlation
· Prioritize alarms based on risk

Attack Model
· Identify the suspicious behavior
14

#RSAC
Data Preprocessing
Normal-behavior oriented model: Repetitive behavior is always normal.
Filter out the normal data with the largest proportion.
Recall is the most important indicator.
15

#RSAC
Demo: the Coarse Filter of HIDS Log
Input: Log of HIDS
­ including records of process, file and network connection.
Output: abnormal behavior of host

Object type Factors Should be consider

Process Is derived relationship normal?

File

Is R/W operation normal?

Connection Is the connection normal?

How to quantize Transition probability between processes Read and Write score of file The popularity of TCP connection

16

#RSAC
Attack Model by Statistics
Attack oriented model: Same kind of attack tends to have common features.
Retrieve the more attack-like behavior form abnormal behavior.
Precision is the most important indicator: False-positive is expensive.
17

#RSAC
Kill Chain Based Model Construction

Reconnaissance
· Password crack · Vulnerability scan · Waterpool attack
Weaponizati on

Exploitation
· Vulnerability exploit
· Click fraud

Installation
· Malicious Web pages
· Webshell upload

Delivery
· Fishing email · Social attack

Command & Control
· C&C Tunnel · Protocol Disguise · DGA Domain

18

Actions on Objectives
· Lateral movement · Data exfiltration

#RSAC
Demo: DNS Tunnel Detection
Input: Log of DNS Server
­ Records of DNS request
Output: Suspicious DNS tunnel connection Common feature
­ Entropy of sub domain name ­ Number of Individual host visits the domain ­ Lifetime of the root domain
19

#RSAC
Demo: Command & Control Tunnel Detection
Input: Network flow record
­ Including source IP/Port, destination IP/Port, time, size, etc.
Output: Suspicious Trojan victim and controller connection. Common feature
­ The heartbeat between victim and controller, always have the same destination IP/Port, same time interval, and same size.
Detection algorithm
­ stability of time interval sequence, can be achieved by FFT algorithm, or ratio between mean and variance.
20

#RSAC
Demo: DGA Domain Detection

Input: Log of DNS Server
­ Records of DNS request
Output: Suspicious DGA domain name
Key Point
­ Machine learning only detects the randomness of domain name text, no matter use LSTM, NGram, GBDT or something else.
­ Should be re-filtered by behavior feature, such as request number, sub domain number, etc.

earnestnessbiophysicalohax.com kwtoestnessbiophysicalohax.com rvcxestnessbiophysicalohax.com hjbtestnessbiophysicalohax.com txmoestnessbiophysicalohax.com agekestnessbiophysicalohax.com dbzwestnessbiophysicalohax.com sgjxestnessbiophysicalohax.com ......

21

#RSAC
Insufficiency of Statistical Modeling
High false-positive rate
­ Something `like an attack' is not always real attack. ­ Some legal systems resemble attack behaviors in specific aspect.

Adding printer may cause Some cloud-based service may Anti-virus tools may use DNS

network scanning.

have heart beat behavior.

tunnel to sample suspicious file.

22

#RSAC
Enhancement: Post Correlation of Events
Graph Based attack path discovery and risk prioritization.
Distill high confident events from low accurate alarms, and build complete attack scenario.
Precision is the most important indicator: False-positive is expensive.
23

#RSAC
Build Attack Graph From Alarms
Attack Graph: A directed Graph
­ Node: Asset, IP Address, Website ­ Edge: Attack relationship, or risk's
propagation. ­ A pair of nodes can only have one
edge, no matter how many alarms exist between them.
24

Path Discovery and Risk Prioritization
Risk of an attack path should be quantized by:
­ Different attack phases ­ Network distribution of assets ­ The risk and accuracy of each alarm

6c5abxxxxxxx

belong

Forged Data

30.xx.xx.xx

http anomaly

a.malicious.com

belong

30.xx.xx.xx

Iot http anomaly

122.xxx.xxx.xx

belong

......

58.xx.xx.xxx

DNS rare

malicious.com another.com 122.xxx.xxx.xx

25

#RSAC

#RSAC
Results and Performance

Raw Data: more than 30 billion per day

Pre-filtered data: about 20 million per day

Alarm of statistical modeling: about 3000 per day

Events after correlation: 100 events per day

Real attack will always be included in the top 100 events!

26

#RSAC
Summary
Machine learning is not suitable for detecting advanced threats in big data.
· The intrinsic property of intrusion detection.
Statistical modeling is more applicable for enterprise security data analysis.
· Detect typical behaviors in different attack phases.
Statistical modeling combined with data preprocessing and post correlation.
· The key point to improve precision-recall rate.
27

#RSAC
Using Statistical Modeling in Your Environment
Next week you should:
­ Identify the 10 most dangerous attack techniques to your business (From the past network intrusion case, and the Red Team contests) .
­ Attack techniques can be described by ATT&CK knowledge base: https://attack.mitre.org/ .
In the first three months you should:
­ Collect the end-to-end data relating to the attacks. ­ Build normal behavior baseline of each assets, and filter out at least 99% of the raw data.
Within six months you should:
­ Build the statistical models to highlight the intrusion trace. ­ Correlate raw alarms and generate high risk events. ­ Calculate the precision-recall rate of the detection results, and adjust the model parameters
based on it.
28

Thank you for attending this forum!
Email: devin.zt@alibaba-inc.com

