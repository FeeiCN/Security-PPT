SESSION ID: TECH-T09
Update on Confidential Computing

Olya Ohrimenko
Researcher Microsoft Research Microsoft

#RSAC

#RSAC
Cloud computing
Pay-per-use model: · storage · computing · platform as a service
Additionally: · physical security · replication

#RSAC
Customer concerns with data security in the cloud

Malicious privileged admins or insiders

Hackers exploiting bugs in the Hypervisor/OS of cloud fabric

Third parties accessing it without customer consent

Data breach regularly tops list for top cloud threat

#RSAC
Outline: Confidential Computing
Protect data during computation:
­ with trusted execution environments (TEEs)
Scenarios:
­ confidential consortium blockchains ­ multi-party machine learning
Guarantees beyond TEE isolation:
­ integrity and privacy in multi-party machine learning ­ memory side-channel mitigation
4

#RSAC
Towards Confidential Cloud Computing

Data Encryption

Network Encryption

#RSAC
Encryption is not enough

App

Data Encryption

Network Encryption

Users want to perform general-purpose computation
Data becomes vulnerable when it is decrypted for computation

#RSAC
Encryption is not enough

Data Encryption

Network Encryption

Users want to perform general-purpose computation
Data becomes vulnerable when it is decrypted for computation

App

App

Operating System Hypervisor Hardware

#RSAC
Encryption is not enough

Data Encryption

Network Encryption

Users want to perform general-purpose computation
Data becomes vulnerable when it is decrypted for computation

App

App

Operating System Hypervisor Hardware

Confidential Computing

Data Encryption

Network Encryption

Our goal is to protect data: · at rest · in transit · during computation

#RSAC

App

App

Operating System Hypervisor Hardware

#RSAC
Pure Cryptographic Approaches

Special Data Encryption
Encode computation:
· Fully homomorphic encryption · Multi-party computation
Efficient for some computations but not general-purpose

2 +3 =5

App

Operating System

Hypervisor Hardware

Security through isolation
Isolate computation Protect data from cloud fabric

#RSAC

App

App

Operating System Hypervisor Hardware

Trusted Execution Environment (TEE)
TEE

Isolation
· Secure portion of processor & memory · Only authorized code is loaded & accesses data
encrypted in RAM
2. Attestation: prove identity locally and remotely

Code Data

Examples: Intel SGX, Virtualization Based Security (VBS)

#RSAC

App

App

Operating System Hypervisor Hardware

#RSAC
Protect data in use with confidential computing

Top data breach threats mitigated
Data fully in customer control

Code protected and verified by customer
Data and code opaque to the cloud platform

Confidential Computing Scenarios

#RSAC
Confidential Computing Scenarios

Map

Reduce

SQL

Data analytics

Databases

Machine Learning

Confidential Blockchain

Multi-Party Machine Learning
15

#RSAC
Outline: Confidential Computing
· Protect data during computation:
­ with trusted execution environments (TEEs)
Scenarios:
­ confidential consortium blockchains ­ multi-party machine learning
16

Confidential Computing Scenarios
Confidential Consortium Blockchain Framework (CCBF)

#RSAC
Blockchain Today
Tamper-proof, highly-available, decentralised ledgers
Cryptographically chained blocks of transactions
Establishes what happened and the order it happened in
Use cases are not limited to just cryptocurrencies

#RSAC
Current challenges with blockchain protocols and networks
Scalability comparable to current enterprise transaction throughput
Confidentiality, yet transparency, of transaction data
Governance without introducing a third party

Confidential Consortium Blockchain Framework (CCBF) #RSAC Design

Key-Value store inside a Trusted Execution Environment (TEE)

Write an encrypted log of state updates: the
ledger

Replicate state across TEEs for fault tolerance

Azure Confidential Computing

Existing ledger providers can integrate
their transaction processing
engines

Secure channels and Raft/Paxos for consensus

#RSAC
CCBF Properties
Open-source framework that enables:
· high-throughput (~50k tx/s) · fine-grained confidentiality · consortium governance for permissioned blockchains
Next steps:
· use Practical Byzantine Fault Tolerance to maintain integrity even in the face of a TEE compromise
· shard encrypted data for both horizontal scalability and compliance

Confidential Computing Scenarios
Secure Multi-party Machine Learning

#RSAC
Secure Multi-Party Machine Learning

Guarantees
· Users see only the output · Cloud provider sees only encrypted data

User B

Machine Learning Code

User A

User C
Output

User D
23

#RSAC
Multi-Party Training
Patient data

Machine Learning Code

Diagnostics model

Patient data

· Users contribute encrypted data sets to train a machine learning model · Users do not see each other's data sets; cloud provider sees only encrypted data · All users benefit from accessing the output (machine learning model)
24

Prediction-as-a-Service
Patient data

Prediction

Machine Learning Code

· Hospital A uploads encrypted trained machine learning model · Other hospitals query the model on patient data and obtain predictions · Hospital A does not see patient data; hospital B does not see the model
25

#RSAC
Diagnostics model

#RSAC
Demo
26

#RSAC
Outline: Confidential Computing
Protect data during computation:
­ with trusted execution environments (TEEs)
Scenarios:
­ confidential consortium blockchains ­ multi-party machine learning
Guarantees beyond TEE isolation:
­ integrity and privacy in multi-party machine learning ­ memory side-channel mitigation
27

#RSAC
Beyond TEE Protection

User A User D

Machine Learning Code
Output

User B User C

28

#RSAC
Beyond TEE Protection

User A User D

Machine Learning Code
Output
29

User B
User C
Integrity Privacy

#RSAC
Beyond TEE Protection

User A User D

Machine Learning Code
Output

User B
User C
1. Contamination attacks

30

#RSAC
Beyond TEE Protection

User A User D

Machine Learning Code
Output
31

User B
User C
1. Contamination attacks 2. Information leakage

Beyond TEE Isolation: Multi-Party Machine Learning
Contamination Attacks and Defenses

Contamination Attacks
Bank A TEE
Bank B
33

#RSAC
Bank C

Contamination Attacks
Bank A TEE

#RSAC
Bank C

Bank B

Attacker's goal: Create a link between a feature and a label & not be detected
34

#RSAC
Contamination Attacks: Example
Task: predict education level based on demographic information
35

#RSAC
Contamination Attack: Towards Defence
Scenario:
· Contaminated multi-party model improves over local model · Malicious Attribute-Class correlation
· out of scope: honest differences in parties' data distributions
· Attacker may control more than one party but not all
36

#RSAC
Contamination Attack: Towards Defence
Scenario:
· Contaminated multi-party model improves over local model · Malicious Attribute-Class correlation
· out of scope: honest differences in parties' data distributions
· Attacker may control more than one party but not all
Simple defences:
· Party cross-validation (expensive) · Validation accuracy per attribute & class (not generalizable)
37

#RSAC
Adversarial Learning as a Defence

Training multi-party model f

Training party-distinguisher model g

A
Model f Inference
B
C

A
B?
C

38

#RSAC
Adversarial Learning as a Defence

Training multi-party model f

Training party-distinguisher model g

MIN

Inference

f doeCs not learn partyspecific correlations

39

MAX

#RSAC
Contamination Defence: Results
MIN MAX
40

Beyond TEE Isolation: Multi-Party Machine Learning
Differential privacy

Privacy-Preserving Data Analysis

#RSAC
Data scientist Query

42

Privacy-Preserving Data Analysis

#RSAC
Data scientist Query

1. What is leaked?
43

Differential Privacy

#RSAC
Data scientist Query

?

Privacy is protected

even if attacker knows

all but one record

44

Local Differential Privacy
+ noise + noise
Compute result + noise & adjust noise
Strong record privacy
Simple queries
45

#RSAC
Data scientist Query

Global Differential Privacy
Trusted curator
result + noise
Small noise & usable results Trusted curator assumption
46

#RSAC
Data scientist Query

#RSAC
Differential Privacy (DP) with TEEs

DP Data Analysis

noise

+

Data scientist Query

1. Framework for secure DP algorithms in TEEs 2. New DP algorithms (e.g., histogram, heavy hitters)
47

#RSAC
Outline: Confidential Computing
Protect data during computation:
­ with trusted execution environments (TEEs)
Scenarios:
­ confidential consortium blockchains ­ multi-party machine learning
Guarantees beyond TEE isolation:
­ integrity and privacy in multi-party machine learning ­ memory side-channel mitigation
48

Beyond TEE Isolation: Side-channel Mitigation
Hardening TEE code

#RSAC
Host(ile) environment & shared resources
Many side channels may exist
App
Leakage through memory accesses
Operating System
Hypervisor
Trusted Processor

#RSAC
Host(ile) environment & shared resources
Many side channels may exist
App
Leakage through memory accesses
Operating System

Memory

Hypervisor Cache Trusted Processor

#RSAC
Host(ile) environment & shared resources
Many side channels may exist
App
Leakage through memory accesses
Operating System

Memory

Hypervisor Cache Trusted Processor

#RSAC
Host(ile) environment & shared resources
Many side channels may exist
App
Leakage through memory accesses
Operating System

Memory

Hypervisor Cache Trusted Processor

#RSAC
Host(ile) environment & shared resources

Many side channels may exist
App
Leakage through memory accesses

Encrypted content with
plaintext addresses
Memory

Operating System
Hypervisor Cache Trusted Processor

#RSAC
Memory Channels: What is leaked
Memory side-channels are not new for cryptographic code Application: use binary tree to classify a record (access secret-dependent path)

Binary decision tree
>35 no

female

no

yes

diabetes in family

diabetes in family

yes female

....

Heart disease: No

Memory

Accesses from inferences A

B
A
Gender: Male Age: 25 F. Diabetes: N

B
Gender: Female Age:  35 F. Diabetes: ??

#RSAC
Mitigating Memory Side-channel Attacks
Not an easy problem: Let's make random dummy accesses, shuffle, etc:
­ Hard to estimate what is leaked ­ Leaking even one bit may be dangerous

#RSAC
Mitigating Memory Side-channel Attacks
Not an easy problem: Let's make random dummy accesses, shuffle, etc:
­ Hard to estimate what is leaked ­ Leaking even one bit may be dangerous
We assume worst-case scenario:
­ Attacker observes all accesses ­ Game lost if the attacker guesses at least one bit

#RSAC
Mitigating Memory Side-channel Attacks
Not an easy problem: Let's make random dummy accesses, shuffle, etc:
­ Hard to estimate what is leaked ­ Leaking even one bit may be dangerous
We assume worst-case scenario:
­ Attacker observes all accesses ­ Game lost if the attacker guesses at least one bit
Our approach:
­ Model the attacker ­ Security definition (data-oblivious algorithms) ­ Design provably-secure algorithms in this model

#RSAC
Towards Data-obliviousness
1. Isolating computation in private memory · Registers · Transactional memory (TSX)
2. General software-based approach · Oblivious machine-learning algorithms · Oblivious RAM: · structured dummy and randomized accesses

#RSAC
Are we data-oblivious?
Provably-secure algorithms:
­ the trace depends only on public information (e.g., input, output sizes)
Validation of implementation:
­ collected traces at cache-line (64byte) granularity with Intel Pin Tool
Video of traces from:
­ original tree traversal ­ data-oblivious tree traversal

Trees: Non-Oblivious Code Traces

#RSAC

Input A

Addresses

Addresses

Input B Time

Trees: Oblivious Code Traces

#RSAC

Input A

Addresses

Addresses

Input B Time

Summary

#RSAC
Summary: Confidential Computing
Protect data during computation:
­ with trusted execution environments (TEEs)
Scenarios:
­ confidential consortium blockchains ­ multi-party machine learning
Guarantees beyond TEE isolation:
­ integrity and privacy in multi-party machine learning ­ memory side-channel mitigation
64

#RSAC
Apply · TEEs in Azure Confidential Computing · Open Source SDK for TEEs: Open Enclave · Always Encrypted with Secure Enclaves · Design applications with small attack surface
65

#RSAC
Azure Confidential Computing Links
Azure confidential computing solution page: https://azure.microsoft.com/en-us/solutions/confidential-compute/ Confidential Computing VM Deployment: http://aka.ms/ccvm Open Enclave SDK page: https://openenclave.io/sdk/ Open Enclave GitHub repository: https://aka.ms/OESDKGitHubRepo

#RSAC
Thank you!

Please see the papers for all the details
Observing and Preventing Leakage in MapReduce
Olga Ohrimenko, Manuel Costa, Cédric Fournet, Christos Gkantsidis, Markulf Kohlweiss, and Divya Sharma, ACM Conference on Computer and Communications Security, 2015
VC3: Trustworthy Data Analytics in the Cloud using SGX
Felix Schuster, Manuel Costa, Cédric Fournet, Christos Gkantsidis, Marcus Peinado, Gloria Mainar-Ruiz, Mark Russinovich IEEE Symposium on Security and Privacy, 2015
Oblivious Multi-party Machine Learning on Trusted Processors
Olga Ohrimenko, Felix Schuster, Cédric Fournet, Aastha Metha, Kapil Vaswani, Manuel Costa Usenix Security Symposium, 2016
Strong and Efficient Cache Side-Channel Protection using Hardware Transactional Memory
Daniel Gruss, Julian Lettner, Felix Schuster, Olga Ohrimenko, Istvan Haller, Manuel Costa Usenix Security Symposium, 2017

EnclaveDB ­ A Secure Database using SGX
Christian Priebe, Kapil Vaswani, Manuel Costa IEEE Symposium on Security & Privacy, 2018
Contamination Attacks and Defences in Multi-Party Machine Learning
Jamie Hayes and Olga Ohrimenko NeurIPS, 2018
Graviton: Trusted Execution Environments on GPUs
Stavros Volos, Kapil Vaswani, Rordigo Bruno OSDI, 2018
An Algorithmic Framework For Differentially Private Data Analysis on Trusted Processors
Joshua Allen, Bolin Ding, Janardhan Kulkarni, Harsha Nori, Olga Ohrimenko, Sergey Yekhanin TechReport, 2018

