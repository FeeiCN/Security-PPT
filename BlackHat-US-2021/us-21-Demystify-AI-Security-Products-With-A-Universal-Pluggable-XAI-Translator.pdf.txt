Demystify AI Security Products With a Universal Pluggable XAI Translator
Tongbo Luo, Kailiang Ying, Xinyu Xing, Xuguang (Luke) Liu
#BHUSA @BlackHatEvents

Motivation

#BHUSA @BlackHatEvents

Scenarios

Vendor

Customer

Attacker
#BHUSA @BlackHatEvents

Key Takeaways
- Share lesson learned when we use XAI to evaluate security products - Identify potential XAI research direction to fill in business need
#BHUSA @BlackHatEvents

State-of-art XAI Tools
- LIME - SHAP (KernalSHAP) - Anchor

#BHUSA @BlackHatEvents

LIME --- Local Interpretable Model-Agnostic Explanations

"Why Should I Trust You?": Explaining the Predictions of Any Classifier

#BHUSA @BlackHatEvents

LIME
Advantages - Works for all types of data (images, tabular, text)
- Model was trained with non-interpretable features
Disadvantages - Instability of the Explanations
- Sampling process

#BHUSA @BlackHatEvents

SHAP
SHAP (SHapely Additive exPlanations)
- Shapely Values (Game Theory)
- Visualization

#BHUSA @BlackHatEvents

Build-in Visualization

Force Plot

Feature Importance

Summary Plot

Dependence Plot

Interaction Values
#BHUSA @BlackHatEvents

Anchor

ref: tinyurl.com/2nd7w8e7

Anchors: High-Precision Model-Agnostic Explanations (AAAI'18)
#BHUSA @BlackHatEvents

When XAI meets ML-based Security Product
- Malicious HTTP header Detection Tool (DNN with text-type input) - IDS (DNN with numeric features) - Malicious Binary Detection (RNN-based Detection Model) - Detection Malicious Cloud Activity - System-call Detection (Concept-based Explanation)
#BHUSA @BlackHatEvents

Detecting Malicious HTTP Requests
Common Attacks
Command Injection Attack SQL Injection Attack XSS

#BHUSA @BlackHatEvents

Assumption Gaps
- Lack of model knowledge - Actual model's detail is confidential
- No direct access to model - Trigger actual activity in the target system

Model-agnostic tools (treat model as blackbox)
Customize the XAI tools
#BHUSA @BlackHatEvents

Fill the Gap
Target Security Product
predict()
Target ML Model
Collector
HTTP Traffic Flow

In our scenarios, we are not able to directly access the model to get the prediction output due to the way we deployed the security product

Target Sample
Model-agnostic XAI tools (LIME)

permutation
LIME Extension

permutation

#BHUSA @BlackHatEvents

Avoid Sampling Invalid Data

Header to be explained: { "method" : "get", "query": "Accessories; Drop", "path" : "/search", "statusCode": "404", "requestPayload": "null" }

Invalid sampling with LIME_TEXT

{ "" : "get", "query": "Accessories; Drop", "path" : "/search", "statusCode": "404", "requestPayload": "null" } { "method" : "", "query": "Accessories; Drop", "path" : "/search", "statusCode": "404", "requestPayload": "null" }

Invalid sampling with LIME_TABULAR

{ "method" : "get", "query": "Accessories; Drop", "path" : "/search", "statusCode": "404", "requestPayload": { "creditCard":"<iframe />"} }
#BHUSA @BlackHatEvents

Detecting Malicious Requests

<script>alert('test3')</script>

SQL injection

#BHUSA @BlackHatEvents

XSS with remote iframe src
XXE DoS under Unix Server
#BHUSA @BlackHatEvents

ML-based IDS (Intrusion Detection System)

Common Features Used by ML-based IDS

#BHUSA @BlackHatEvents

Explain IDS Detection Result

DNN + SHAP

An Explainable Machine Learning Framework for Intrusion Detection Systems

#BHUSA @BlackHatEvents

Malware Detection (Binary Reverse-Engineering)

LEMNA: Explaining Deep Learning based Security Applications

#BHUSA @BlackHatEvents

Detect Cloud Malicious Activity

Network  Activity to/from Known bad IPs  Usual changes to traffic pattern  Unsal outbound port usage
DNS  Queries to known-bad domains
Host-based  OS, Application, Security/Audit logs  Endpoint security event
Network-device based  FW/IDS/IPS "drop-in" solution logs/alerts

Cloud provider API Activity  Multiple failed logins  Simultaneous API access from different regions  Attempted activity from terminated accounts/credentials/keys  Uncommon service/API usage  Credential/permission enumeration  Changes to user accounts/logging/detection configurations  Sensitive changes to user permission  Internal IAM credentials used from external sources

Detecting Malicious Cloud Account Behavior: A Look at the New Native Platform Capabilities

#BHUSA @BlackHatEvents

Concept-based Explanation
Instead of explaining individual sample, we think concept-level explanation is better when evaluating security products.

Interpretability Beyond Feature Attribution: Quantitative Testing with Concept Activation Vectors (TCAV)

#BHUSA @BlackHatEvents

Malware Detection Model using System-call

write execve accept

ioctl

...

proc0

100

20

0

2

...

proc1

50

10

90

3

...

...

...

...

...

...

...

Kernel Module

#BHUSA @BlackHatEvents

Global explain on system call detection
1. SQL injection: high file I/O, high memory usage, high network throughput 2. cmd injection: high execve usage
Gap: White-box model
SQL injection

cmd injection

#BHUSA @BlackHatEvents

Attacker's Perspective
1. Use XAI to Craft Adversarial Example 2. Use XAI to Leak Information from Security Product
#BHUSA @BlackHatEvents

Crafting Adversarial Example

- Model set up - white-box - black-box

Estimate the gradient using finite difference

- Adversarial Example must be "valid" - Satisfy the structure requirement - Keep the malicious behaviour

#BHUSA @BlackHatEvents

Generate Adversarial Example via XAI
Original example
Adversarial example
#BHUSA @BlackHatEvents

Leak Information from Hybrid Security Products

Rules

ML model

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

Flaky local explain

#BHUSA @BlackHatEvents

