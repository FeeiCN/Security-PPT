Optimal Machine Learning Algorithms
for Cyber Threat Detection
A Presentation by Hafiz Farooq, Saudi Aramco

Hafiz Farooq
Senior Cyber Security Consultant, Saudi Aramco ECC (EXPEC Computer Center) SOC MS Data Communication Networks, Aston University, United Kingdom BE Computer Engineering, NUST, Pakistan DELL Secureworks - Worked as Senior SOC Architect SANS Forensic Examiner, SANS Exploit Researcher Splunk Big Data Architect, Qradar Deployment Professional Juniper Networks ­ JNCIE Security and JNCIP-Service Provider Routing
û
A Presentation by Hafiz Farooq, Senior Cyber Security Consultant, Saudi Aramco

Why we moved to Machine Learning
õ Post-Shamoon Scenario õ Machine Learning vs Orthodox Cyber Security õ Big Data Analytics & Machine Learning

STATISTICAL APPROACH

MACHINE LEARNING

Optimal Machine Learning Algorithms for Cyber Security

ANOMALY DETECTION ­ PRIVILEGED ACCOUNTS
BIG DATA STATISTICAL ANALYSIS
Feature Space: MachineID, UserID, EventCount, Severity, Multihoming
SANKEY VISUALIZATION http://www.sankey-diagrams.com/
source=windows AND ( usertype=Administrator* OR usertype=root*) | stats count by host user | sort count desc | head 20
Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

QUERY

ANOMALY DETECTION ­ TOP TALKERS

BIG DATA STATISTICAL ANALYSIS

Mail Server

Web Proxy

n-dimensional feature space & n-parallels

ERP Application

Authentication Server

NAS / SAN

QUERY

PARALLEL COORDINATES https://datavizcatalogue.com/methods/parallel_coordinates.html
index=firewall dest=Authentication Server | stats count by src | appendcols [search index=juniper dest=Mail Server | stats count by src | appendcols [search index=juniper dest=NAS/SAN | stats count by src | appendcols [search index=juniper dest=ERP | stats count by src | appendcols [search index=juniper dest=Web | stats count by src
Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

ANOMALY DETECTION ­ CRITICAL PROCESSES
BIG DATA STATISTICAL ANALYSIS

WMIC.EXE CMD.EXE
POWERSHELL.EXE SCHTASKS.EXE SVCHOST.EXE WSCRIPT.EXE REGEDIT.EXE

HOURS IN A DAY

Discrete / Continuous Time Series Analytics

PUNCHCARD VISUALIZATION http://bl.ocks.org/kaezarrex/10122633
index=wineventlog AND (New_Process_Name IN (*\\powershell*, *\\wscript* ,*\\wmic* ,*\\svchost*,*\\regedit*, *\\cmd.*) | eval WorkTime=strftime(_time,"%H") | rex field=New_Process_Name ".*\\\(?<executable>.*)$" | stats count by WorkTime executable
Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

QUERY

OPTIMAL ML ALGORITHMS

MACHINE LEARNING

Optimal Machine Learning Algorithms for Cyber Security

Standards Used for ML based Threat Detection
CYBER THREAT STANDARDIZATION
õ MITRE Standards for Post-Compromise Detection
§ ATT&CK | Adversarial Tactics, Techniques, and Common Knowledge § CAPEC | Common Attack Pattern Enumerations and Classification § MAEC | Malware Attribute Enumeration and Characterization
õ Lockheed Martin's Cyber Kill Chain

CYBER KILL CHAIN

Recon

Weaponize

Deliver

Exploit

MITRE ATT&ACK

Install

C2

Exfiltrate

MITRE ATT&CK CATEGORIES

Persistence

Privilege Escalation Defense Evasion Credential Access Discovery

Lateral Movement Executions

Collection

Exfiltration

Command & Control

Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

IMPORTANT USE CASES
BASED ON MITRE ATT&CK MATRIX

Threat Use Cases

Pre-Processing

ML based Detector Algorithms ATT&CK Category

Exfiltration over C2 Channels

Standard Scaler / PCA KMeans / X-Means

Exfiltration

Service Scanning Analysis

PCA, KMeans

Linear, RF, DT Regressors

Discovery

PowerShell Anomaly Detection

PCA

One-Class SVM with Linear Kernel Execution

DLL Injection Anomaly Detection PCA/Kernel-PCA

One-Class SVM with Linear Kernel Privilege Escalation

Process Hollowing via System Calls TFIDF (Logarithmic) LR with SGD Detector

Defense Evasion

Web URLs Analysis

Levenshtein Distance Shannon Entropy

Command & Control

Email Spam Classification

TFIDF

RF Classifier

Execution

Analyzing Web Proxy Logs

BM25

SGD with Naïve Bayesian

Command & Control

MITRE ATT&CK

https://attack.mitre.org/wiki

Persistence Lateral Movement

Privilege Escalation Executions

Defense Evasion Collection

Credential Access Exfiltration

Discovery Command & Control

Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

Machine Learning Workflow
CYBER THRET DETECTION & MACHINE LEARNING
Offline Training Data STIX, TAXII, CybOX

Real Time Data

Scheduled Refresh
False-Positives

ML Algorithms ML Data Model

Machine Learning Engine

Pre-Processor Feature Extractor

SOC / Forensics

UBA Scoring Engine

SUPERVISED & UNSUPERVISED WORKFLOWS
Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

Curses of Dimensionality in Cyber Security ML
FEATURE ENGINEERING & BAGGING
õ Feature Engineering is Critical in Cyber Security õ More Categorical Data than Numerical õ Important Algorithms
- Feature Extraction | PCA/Kernel-PCA, TF-IDF/BM25 - Normalization | StandardScaler (Z-Score), Normalizer (Min-Max) - Feature Selection |Sampling, SubSampling, OverSampling, KMeans
Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

Upload/Download Analytic using Numerical Clustering
MACHINE LEARNING ­ USE CASE NO - 1

K-Means Clusters

MacQueen, 1976: Some Methods for Classification and Analysis of Mulivariate Observations.
Complexity: O( n . k . Iterations . Attributes )
Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

Upload/Download Analytic using Numerical Clustering
MACHINE LEARNING ­ USE CASE NO - 1
Features: Source IP, BytesIN, BytesOUT

Data Upload Rate

Data Download Rate

Firewall Netflow / RT Stats

Feature PreProcess

Standard Scaler/PCA KMeans Clustering (k=3)

K-Means Clusters

MacQueen, 1976: Some Methods for Classification and Analysis of Mulivariate Observations.

Complexity: O( n . k . Iterations . Attributes )
Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

Upload/Download Analytic using Numerical Clustering
MACHINE LEARNING ­ USE CASE NO - 1
õ K-Means creates clusters of homogeneous shapes and much faster than hierarchical clustering techniques
õ DBSCAN is less accurate here due to the dynamically varying traffic densities and highly scattered data values
õ BIRCH clustering is very slow for larger datasets and hence only limited to micro-level clustering, in conjunction with a macro-level algorithm

Clustering Algorithms

Chakraborty, Sanjay, "Performance Comparison of Incremental k-Means and DBScan."

BIRCH DBSCAN KMeans

DLL Injection Detection using OneClassSVM (OSVM)
MACHINE LEARNING ­ USE CASE NO ­ 2
SYSMON Events 1 Process Create 2 File Creation Time 3 Network Connection 5 Process Terminated 6 Driver Loaded 7 Image Loaded 8 CreateRemoteThread

QUERY

SYSMON Events

Reference: https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon

index=sysmon-events EventID=8 sourcetype="XmlWinEventLog:Microsoft-Windows-Sysmon/Operational" | table host _time, SourceImage, TargetImage
Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

Detect DLL Injection using OneClassSVM (OSVM)
MACHINE LEARNING ­ USE CASE NO - 2

DataSource: SYSMON-Logs if EventID == 8 AND isNormal != 1 then
do OneClassSVM Source, Target
set kernel = linear nu = 0.01 coef = 0.5 set gamma = 0.01 tol = 1 deg = 3 shrinking = f save model CreateRemoteThreatOSVM do deup Source Target
end if

One-Class SVM

Bernhard Schölkopf, "One-Class Support Measure Machines for Group Anomaly Detection"

Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

Detecting Recon using Numerical Prediction
MACHINE LEARNING ­ USE CASE NO - 3

Regression / Prediction

Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

Detecting Recon using Numerical Prediction
MACHINE LEARNING ­ USE CASE NO - 3

Predicted: Destination Port Features: Source IP, Destination IP

Predicted Destination Port

Algorithm Linear Regression RF Regressor (N=5) RF Regressor (N=30) DT Regressor

Pre-Processing PCA (k=3) PCA (k=3) PCA (k=3) PCA (k=3)

RMSE 00.8999 90.1230 42.8220 250.0210

R2 (1-SSE/TSSE) 0.998 0.980 0.800 0 .623

Destination Ports

Numerical Prediction

Linear Regression, Random Forest Regressor, DecisionTree Regressor, LASSO

Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

Detecting Recon Anomaly using Numerical Prediction
MACHINE LEARNING ­ USE CASE NO - 3
õ Logistic Regression (LR) worked well here due to linear dataset and due to the absence of multicollinearity between the independent predictor variables (i.e. time, source, destination).
õ RandomForest Ensemble Algorithm (with multiple tree estimators) is also an ideal predictor for this analysis being relatively more accurate on relatively weaker training set.
õ DecisionTree required very accurate training set, so was not suitable here.

Linear Regression

Bernhard Schölkopf, "One-Class Support Measure Machines for Group Anomaly Detection"

A Presentation by Hafiz Farooq, Senior Cyber Security Consultant, Saudi Aramco

PowerShell Anomaly Detection using OneClassSVM

MACHINE LEARNING ­ USE CASE NO - 4

Features: host, Image, ParentImage

SYSMON Events 1 Process Create 2 File Creation Time 3 Network Connection 5 Process Terminated 6 Driver Loaded 7 Image Loaded 8 CreateRemoteThread

Image deleteSystemFiles.ps1

ParentImage checking.bat

One-Class SVM

Bernhard Schölkopf, "One-Class Support Measure Machines for Group Anomaly Detection" Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

User Behavioral Model
Machine Learning & Static Correlation

Exfiltration over C2 Channels Service Scanning Analysis DDL Injection Analysis
PowerShell Anomaly Detection Process Hollowing Analysis Email Spam Classification

Threat Scoring System

Distributed Machine Learning Detection System

Machine Learning based User Behavioral Model - MLUBA
Optimal Machine Learning Algorithms for Cyber Security by Hafiz Farooq

machine >>>> LEARNING
OPTIMAL ALGORITHMS FOR CYBER THREAT DETECTION
 Preprocessing (Sampling, Conversion, Extraction) is the key  Scope of OneClassClassification in Cyber Security  Machine Learning for Routine Operational Intelligence

Questi&oAnnsswers
Machine Learning - not a luxury, but a necessity now

Information is the oxygen of the modern age. It seeps through the walls topped by barbed wire, it wafts across
the electrified borders

