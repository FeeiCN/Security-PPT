#RSAC
SESSION ID: OST-T08
CHRYSALIS: Age of the AI-Enhanced Threat Hunters & Forensicators
Jess Garcia
Founder of One eSecurity | Senior SANS Instructor @j3ssgarcia

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Our Objective
Transform you into AI-Enhanced Threat Hunters/Forensicators to bring the power of AI
in your day to day investigations.
You do not need to be an AI expert, you will need to learn what AI can do for you, becoming familiar with the tools available and how to use them to suit their needs.
3

#RSAC
The Big Question
AI is great. But, what can it do for a Threat Hunter / Forensicator? Would it be able to detect Cobalt Strike? What else can it do?
4

#RSAC
ML OVERVIEW
5

#RSAC
The Age of Data Science & Machine Learning

Helps us understand the big picture

It helps working with complex scenarios

Classification Prediction Anomaly Detection Noise Filtering Clustering
6

#RSAC
ML FOR DFIR USE CASES
7

#RSAC
Where Can We Use Machine Learning in DFIR?

DF

TH - CHRYSALIS

CTI

Memory Analysis ­ Columbo

Malware ­ Malware Revealer

Logs - Deeplog

Network - Zeek

8

#RSAC
ML & TH: Artifact Anomalies

Scheduled Tasks
No time sequence Vanilla Autoencoder

Scheduled Tasks
Time sequence is important LSTM Autoencoder

ds4n6.io/rsac21
9

#RSAC
ML & Malware: Detection and Classification
Convolutional Neural Networks (CNN)

Raw bytes

Interesting patterns

Classification

https://www.mcafee.com/blogs/other-blogs/mcafee-labs/the-rise-of-deep-learning-for-detection-and-classification-of-malware/
10

#RSAC
ML & Malware: Malware Revealer
Malware detection using ML with pre-trained models Uses SqueezeNet and Logistic Regression models Extracts features using convolutional filters to classify them as malware
https://www.ayoub-benaissa.com/blog/malware-revealer/ 11

#RSAC
ML & Memory Forensics: Columbo
Used to identify specific patterns in compromised datasets It uses Volatility 3 outputs applying ML algorithms to look for suspicious You can use it with pslist, psscan, pstree, malfind, netscan, etc.
12

ML & Logs: Deeplog
It learns from tagged data to classify as anomaly or normal entry It helps to identify anomalies, using LSTM in large volumes of system logs Used in IDS/Firewall logs to detect DDoS and Port scans

#RSAC

13

ML & Network Traffic: Zeek
Customized in-depth monitoring far beyond the capabilities of traditional systems
Perform clustering to find anomalies, setting apart outliers We can find threats in large data sets even when they're unknown

#RSAC

Capture Filter

Normalize

David Hoelzer. Applied ML to Zeek. Author of: · SEC503: Intrusion Detection In-Depth. · SEC595: Applied Data Science and AI/Machine Learning for
Cybersecurity Professionals.

Ingest data Build ML models
Train

Anomaly analysis

Threat Hunting: Old Data New Tricks! https://www.youtube.com/watch?v=OCTz62fN8OA
Applying Machine Learning to Network Anomalies: https://www.youtube.com/watch?v=qOfgNd-qijI
14

ML & DF: Elastic
The Elastic Observability and Security solutions have preconfigured machine learning models

#RSAC

15

#RSAC
ML & DF: Elastic ­ Use Case: DNS Exfiltration
16

#RSAC
ML on the Cloud: MSTICPy and Azure
https://github.com/microsoft/msticpy https://github.com/Azure/Azure-Sentinel
17

#RSAC
18

#RSAC
Putting All Together: DS4N6
Mission: Bring Data Science & Artificial Intelligence to the fingerprints of the average Forensicator and promote advances in the field
Presented in ds4n6.io
Since 2020
19

#RSAC
DS4N6: The Road So Far

ds4n6.io

CHRYSALIS

D4ML

HAM

ADversAry eMulator

Daisy VM

20

#RSAC
CHRYSALIS

Python framework that provides DS/ML functions to use without any specific DS/ML knowledge

Complete your investigations with only 7 functions!

More information in: ds4n6.io/chrysalis

21

#RSAC
Try CHRYSALIS on the Cloud: Colab & Binder
Try Colab now: bit.ly/3Ff2VOm Try Binder now: bit.ly/3Ff2VOm
22

#RSAC
D4ML
Easy-to-use ML functions that you can apply to your artifact dataframes. It can be implemented stand-alone or via xanalysis()
find_anomalies() D4ML function to find anomalies via ML without knowing ML
23

#RSAC
HAM / HAMML
Model that harmonizes the output of different tools so the underlying artifact data has the same format regardless of the tool that generated it

Tools
· Kansa · Kape · Plaso · Mactime · Autoruns · Macrobber · Volatility

Artifacts
· SvsList · Amcache · Pslist · Evtx · Flist · Winreg · Fstl

HAMML: HAM + Feature Selection + Feature Engineering
24

#RSAC
HAM / HAMML
Unharmonized DataFrame
xread()
Harmonized DataFrame
25

#RSAC
ADAM
ADAM allows you to define a sequence of malicious artifact data and inject it in a dataframe to test the detection capabilities
The DS ADversAry eMulator
Mimick real attacks Inject events in multiple Artifact-specific Dataframes Creates a "Virtual" DataFrame environment
26

#RSAC
DAISY
Ready-to-use DS Virtual Machine designed to carry out Data Science and Machine/Deep Learning Analysis on DFIR data
More information in: ds4n6.io/daisy
27

DAISY
Forensics tools

DS4N6

CHRYSALIS

ML/DS tools

#RSAC
Forensic demo data

Ready to use notebooks

28

#RSAC

DAISY

ds4n6.io/daisy

29

#RSAC
The Big Challenge
Would we be able to detect Cobalt Strike by just using
Machine Learning?
Let's try!
30

#RSAC
Use Case: Cobalt Strike Detection
Platform for Red Teams operations and adversary simulations
3rd most common threat (Red Canary) Beacons: Post exploitation payloads Malleable C2: language to give control over the indicators in the Beacon payload
31

Demo Data
30 days of real world production server data

+100 servers

+200K events

#RSAC

Cobalt Strike real events injected with ADAM ML analysis performed with CHRYSALIS
32

#RSAC
33

Summary
Machine Learning could enhance the analysis, detection and responses typically performed by forensicators
There are not many open source tools using ML in DF
DS4N6 is an open source project to bring the power of DS and ML to the community: CHRYSALIS, DAISY, etc.
CHRYSALIS and the analysis presented have been used in real world incidents and with FORTUNE 500 customers

#RSAC
34

Apply

Download DAISY VM

Learn DS/AI foundations at ds4n6.io

Review all the references in ds4n6.io/rsac22
Select the type of analysis you want to perform and the corresponding ML algorithm / tool in CHRYSALIS

Collect raw data Run the ML Models

Review the results

#RSAC
35

#RSAC
All the details about this talk:
ds4n6.io/rsac22

ds4n6.io @ds4n6_io DS4N6

Jess Garcia @j3ssgarcia
Thanks!

one-esecurity.com
One_eSecurity One eSecurity
36

