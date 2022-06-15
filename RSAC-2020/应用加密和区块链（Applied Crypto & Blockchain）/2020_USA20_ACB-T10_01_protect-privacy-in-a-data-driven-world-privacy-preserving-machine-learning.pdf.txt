SESSION ID: ACB-T10
Protecting Privacy in a Data-Driven World: Privacy-Preserving Machine Learning

Casimir Wierzynski
Senior Director, AI Products Intel @casimirw

© 2020 Intel Corporation. Intel, the Intel logo, and other Intel marks are trademarks of Intel
Corporation or its subsidiaries. Other names and brands may be claimed as the property of others. #RSAC

#RSAC
Machine learning enables new services using sensitive data
· Thanks to ML/AI we enjoy innovative products and services
· But the data that feed them are very sensitive and personal
· We must find ways to unlock the power of AI while protecting data privacy
2

#RSAC
Current approaches to privacy and ML

User control
Prescribe user's rights
Know what's collected, by whom, why, opt out..

Anonymize

Data protection Encrypt

Remove "identifiable information"

Encrypt at rest, in transit

But identity can be inferred in many ways

But it's decrypted during use

 Need more protections on both fronts
3
Other names and brands may be claimed as the property of others.

#RSAC
Current approaches to AI require complex webs of trust
· With digital assets: "sharing" = "giving" + "trust" · Machine learning is fundamentally a multi-stakeholder computation:

Training data owner
Model owner
Supply chain

Inference data owner

ML service provider

Infrastructure provider

4

Complex web of trust

What if untrusted parties could do machine learning #RSAC together?

Finance / Insurance 8%

Rival banks could build joint antimoney laundering models

Healthcare 8%

Hospitals could use remote, 3rd party analytics on patient data

Retail TOTAL

6% 22% of US GDP

Source: https://www.bea.gov/system/files/2019-04/gdpind418_0.pdf

Retailers could monetize their purchase data while protecting user privacy
Other names and brands may be claimed as the property of others.

#RSAC
Introducing privacy-preserving machine learning (PPML)

Using cryptography and statistics, you can do "magic":

Federated learning, Multi-party Computation

Homomorphic Encryption

Differential privacy

math math

results

Basically the same

results

You can pool your data without sharing it

You can do machine learning while data stays encrypted

You can collect personal data with quantifiable privacy protections

We can amplify these building blocks using Trusted Execution Environments (TEEs), eg Intel SGX

https://commons.wikimedia.org/wiki/File:Twemoji_1f607.svg

https://commons.wikimedia.org/wiki/File:Twemoji2_1f608.svg

PPML use case: monetizing private data and insights

FL HE TEE DP #RSAC

bank

Insights consumer

· Bank hires "AI company" for fraud model
· Retailers have private data
· They update the model using private data

transaction

Is fraud?

AI Co.

TEE

prev. model

 model
+

 model
+

Model owner
prev. model

retail data noise

noise retail data Data
owner

PPML use case: monetizing private data and insights

MPFCL HE TEE DP #RSAC bank

· Bank hires "AI company" for fraud model
· Retailers have private data
· They update the model using private data · With MPC, model stays private

transaction

Is fraud?

AI Co.

model

shares

shares

noise

Data producer

shares

Data producer

noise

#RSAC
Federated Learning

#RSAC
Model accuracy fuels demand for bigger datasets

more accurate

To improve performance of ML system  get
more data!

Hestness, Joel, et al. "Deep learning scaling is predictable, empirically." arXiv preprint arXiv:1712.00409 (2017).
10

More data

#RSAC
The data silo problem
· Privacy / Legality (HIPAA / GDPR) · Data too valuable (or value unknown) · Data too large to transmit
11

#RSAC
Federated learning part 1: train locally and aggregate
b

c a


Aggregator
12

#RSAC
Federated learning part 2: share aggregate; goto step 1
b

c a


Aggregator
13

#RSAC
Federated learning (FL): some care required

Security / privacy

· FL solves a lot of data access problems.
· Data holders can see the model · Data holders can tamper with the protocol · Model updates leak information

#RSAC
https://software.intel.com/en-us/sgx

#RSAC
Federated learning with Intel SGX
b

c a


Aggregator
16

#RSAC
A vision for protecting FL with Intel® SGX

Confidentiality

Integrity & attestation

· Model IP won't be stolen. · Attacks can't be computed.

· Only approved models/training procedures. · All participants know rules are enforced. · Algorithmic defenses can't be bypassed.

Stops attackers from using the model.
Stops attackers from being adaptive. No product or component can be absolutely secure.
17

#RSAC
Federated Learning (FL): some more care required

Data science

· Data owners only need local data. · Will FL converge to model from pooled data?

#RSAC
Distributed vs Pooled data: A medical case study

· BraTS = Brain Tumor Segmentation Challenge

· Intel / UPenn collaboration

· Compare Federated Learning to training on pooled data

· What are the benefits of pooling the data? · How much of this benefit can FL achieve?

Brain tumor segmentation finds tumors from MRIs
https://www.med.upenn.edu/sbia/brats2017.html

19
Other names and brands may be claimed as the property of others.

19

#RSAC
Federated training on brain tumor data (BraTS)

Method

Accuracy % of Data-Sharing

(Dice coeff)

accuracy

Data-sharing 0.862

100%

Federated Learning

0.855

99%

Single Institution

0.704

81%

Sheller, Micah J., et al. "Multi-institutional deep learning modeling without sharing patient data: A feasibility study on brain tumor segmentation." International MICCAI Brainlesion Workshop. Springer, Cham, 2018.

#RSAC
Homomorphic encryption

#RSAC
Homomorphic encryption (HE)

· Computation on encrypted data (ciphertext)
· Public / private key cryptography

x encrypt
g(x) decrypt trusted

E(x) E(g(x))

Limited risk of sharing!
g() untrusted

Deploying deep learning [DL] on HE?

· Difficulties
· Redefining low-level operations (+, *) · New data types (ciphertext)
· Solution
· Add HE library calls to DL framework? · Add DL library calls to an HE
framework?
· Requires expertise in cryptography, DL, software engineering

DL framework

#RSAC
HE library

#RSAC
HE-transformer for nGraph: nGraph-HE

· Simply treat HE as another nGraph hardware target

· Optimizations in HE and graph compilers are largely orthogonal

· SEAL encryption library
· Supports BFV and CKKS encryption schemes

· Direct integration with TensorFlow

· PyTorch, ONNX, etc. use nGraph

serialization

Other names and brands may be claimed as the property of others.

HE performance trends

#RSAC
https://arxiv.org/abs/1908.04172

25

HE performance trends

#RSAC

http://www.image-net.org/
Boemer, Fabian, et al. "nGraph-HE2: A High-Throughput Framework for Neural Network Inference on Encrypted Data." Proceedings of the 7th ACM Workshop on Encrypted Computing & Applied Homomorphic Cryptography. 2019.
26

#RSAC
Conclusions
Advancing both AI and privacy is not a zero-sum game.
No single technology "solves" privacy.
Privacy­preserving ML (PPML) enables new ML use cases and business models

#RSAC
Applying what you've learned today
In 1 week: Read our papers on PPML
1 month: Download and try HE-Transformer; Build a ML model that operates on ciphertext.
6 months: Identify ML tasks in your organization that operate on sensitive data and how PPML can help.

