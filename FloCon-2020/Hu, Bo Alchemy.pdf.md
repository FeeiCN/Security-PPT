Alchemy: Stochastic Data Augmentation for Malicious Network Traffic Detection
NTT
Bo HU

Agenda
topic = background( nw & security & ml )
for each in topic.use_cases(3) : [ each.data, each.features ]
try: topic.solve(problems)
except: pass
while Time: topic.future_works
2

Background 1/3
· The botnet is not only a threat to IT services / organizations, but also became a serious problem to the whole Internet / society.

https://www.wsj.com/articles/denial-of-service-web-attackaffects-amazon-twitter-others-1477056080

https://csrc.nist.gov/publications/detail/whitepaper/2018/05/30/enhancing-resilience-against-botnets--report-tothe-president/final
3

Background 2/3
· Large-scale botnets consist of various components such as bots, loaders and Command and Control (C&C) servers.
· Attackers tend to use multiple (and hierarchical) hosts to control the botnet for higher availability.
Framework/Operation of Mirai botnets [1]
4

Background 3/3

· Machine learning is a new hope for detecting botnet activities.
· Conventional methods are designed for detecting specific types of components (e.g., bot or C&C ) [2][3]

Internet User NW

Traffic data

Preprocessin
g

SrcIP, DstIP, ..., pkt, byte A, B, ..., 10, 420 B, A, ..., 10, 15000 ...

Feature generatio
n

IP Feature1 ...

A F1A

...

B F1B

...

... ...

Inference

host A host B

A: malicious, B: benign

5

Use Cases

Internet

Network FlowsNetFlow Analysis
Packets

L3 GW

Passive DNS

Analysis

UDP53

Experimen t
NW

Web HTTP logs HTTP Log

Proxy

Analysis

Office NW

6

Use Cases: Network Flows
Data
Feature Sets [2]
7

Use Cases: HTTP Logs
Data
Feature Sets [3]
8

Use Cases: Passive DNS
Data Feature Sets [4]
9

Problems
· Training an accurate model with · Few amount of malicious training sets · # of malicious < # of benign · Low quality statistical features values · Observed traffic of a malicious host is fewer than the benign. Fewer data, lower quality of statistics

Contributions
· We propose a novel data argumentation method, Alchemy, to regenerate feature vectors for higher classification performance
· Alchemy not only increases training sets, but also enhance feature presentation, regardless of types of data, features and classifiers
· We evaluated effectiveness of Alchemy through three major types of real-world data

Related Works
· Synthetic data approach to increase training sets · Create new feature vectors based on existing ones or (random) distribution · Cannot represent nature of raw traffic
· Extra data approach to increase training sets · Utilize unlabeled data as labeled ones · Require more additional data from the real world

Proposal: Concept
· We propose a method (Alchemy) to resample several subsets of raw traffic for each host and regenerate multiple pseudo feature vectors to represent the original host in an ensemble way · Without any extra raw data · Regardless of data, features and classifiers

Proposal: System Design

· Resampling can be applied in both of training and prediction
· Resampling rates can change with hosts or sampling operations
· Target selection and Filtering are components to control quality of pseudo feature vectors
Key components (training)

Training phase

Target Selection

Raw

Pre-

Data

processing

Prediction phase

Resampling Resampling

Feature Generation
Feature Generation

Filtering Training

Model

Prediction Ensemble

Result

Key components (prediction)

Proposal: Resampling
· Four options for sampling rates · #3 and 4 use random rates

Training phase

Key components (training)

Target Selection

Resampling

Raw

Pre-

Data

processing

Prediction phase

Resampling

Key components (prediction)

Feature Generation
Feature Generation

Filtering Training

Model

Prediction

Ensemble

Result

Proposal: Target selection

· Cross validation-based scoring strategy
· Separate labeled data to training and validation sets
· Training model with training sets
· Predict targets in validation sets, and use the score of each target to decide whether to regenerate feature vectors

· High score -> well feature presentation -> no needs to regenerate

· Low score -> maybe outliers -> regenerated features may effect the model in a negative way

· [P , P ] loKweyecormponentus(ptrapiniengr) is the range for target to regenerate features

Target Selection

Resampling

Filtering

Training phase

Feature Generation

Training

Model

Raw

Pre-

Data

processing

Prediction phase

Resampling

Feature Generation

Prediction

Ensemble

Result

Key components (prediction)

Proposal: Filtering
· Distance-based strategy to filter pseudo vectors
· For each target, predict scores of pseudo feature vectors
· Drop pseudo ones which have large gap with the original
· Thresh = average + f * standard deviation · f is a control parameter

Training phase

Key components (training)

Target Selection

Resampling

Raw

Pre-

Data

processing

Prediction phase

Resampling

Key components (prediction)

Feature Generation
Feature Generation

Filtering Training

Model

Prediction Ensemble

Result

Proposal: Ensemble

· Different with synthetic data, regenerated vectors are linked to the original one
· Ensemble scores of multiple feature vectors for the same target can obtain better representation
· The simplest strategy is to take the average

Training phase

Key components (training)

Target Selection

Resampling

Raw

Pre-

Data

processing

Prediction phase

Resampling

Key components (prediction)

Feature Generation
Feature Generation

Filtering Training

Model

Prediction

Ensemble

Result

Evaluation: Overview
Data and features sets · Three major types of traffic data
(Network flows, HTTP log, PDNS) · Three well cited features sets
x
Classifier · Three major classifiers: Random
Forest, DNN and SVM

Evaluation: Conventional methods
· Original
· without any extra data
· Noise
· adding uniform noise to each feature vectors
· SMOTE
· using SMOTE to increase the number of malicious training sets to the same number of the benign class (the neighborhood number is 5)

Evaluation: Patterns of proposal

Evaluation: Parameters

Network flows

resampling

20

iterations

resampling

#1

option

[Plower, Pupper] f for filtering

[0, 0.98] 5

Passive DNS
20

HTTP logs 20

#4

#4

[0, 0.999] [0, 0.999]

5

5

Evaluation: Environment

Evaluation: Datasets
Network flows
HTTP log
PDNS

Evaluation: AUC Comparison
· Alchemy outperformed conventional methods in all types of data * classifiers

Evaluation: Resampling V.S. AUC
· When iterations of sampling are increased, AUC scores are improved

Limitations
· Frequency may be lost due to random sampling
· Resample continuous N flows
· Features independent from traffic bag / sampling (e.g., domain string for a target domain)
· Review variance/invariance of features sets before applying Alchemy

Conclusion
· We propose a method (Alchemy) to resample several subsets of raw traffic and regenerate multiple pseudo feature vectors to represent each host, regardless of data, features and classifiers
· Alchemy outperformed conventional methods in all types of data * classifiers

Reference
1. M.Antonakakis,T.April,M.Bailey,M.Bernhard,E.Bursztein, J. Cochran, Z. Durumeric, J. A. Halderman, L. Invernizzi, M. Kallitsis, D. Kumar, C. Lever, Z. Ma, J. Mason, D. Men- scher, C. Seaman, N. Sullivan, K. Thomas, and Y. Zhou, "Under- standing the mirai botnet," in 26th USENIX Security Symposium (USENIX Security 17), (Vancouver, BC), pp. 1093­1110, 2017.
2. L.Bilge,D.Balzarotti,W.Robertson,E.Kirda,andC.Kruegel, "Disclosure: detecting botnet command and control servers through large-scale netflow analysis," in Proceedings of the 28th Annual Computer Security Applications Conference, pp. 129­ 138, ACM, 2012.
3. L. Bilge, E. Kirda, C. Kruegel, and M. Balduzzi, "Exposure: Finding malicious domains using passive DNS analysis.," in NDSS, 2011.
4. K. Bartos, M. Sofka, and V. Franc, "Optimized invariant repre- sentation of network traffic for detecting unseen malware vari- ants.," in USENIX Security Symposium, pp. 807­822, 2016.
29

