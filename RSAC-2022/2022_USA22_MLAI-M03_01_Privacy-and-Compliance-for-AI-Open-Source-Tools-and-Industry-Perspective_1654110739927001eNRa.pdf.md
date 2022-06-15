#RSAC
SESSION ID: MLAI-M03
Privacy and Compliance for AI ­ Open-Source Tools and Industry Perspective
Beat Buesser
Research Staff Member IBM Research

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented.
Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.

Presenter's Company

Logo ­ replace or

delete on master slide

2

#RSAC
The Team

Beat Buesser Research Staff Member IBM Research ­ Dublin
beat.buesser@ie.ibm.com
Presenter's Company Logo ­ replace or
delete on master slide

Abigail Goldsteen Research Staff Member IBM Research ­ Haifa
abigailt@il.ibm.com

Ron Shmelkin Research Staff Member IBM Research ­ Haifa
ronsh@il.ibm.com
3

#RSAC
Agenda

Motivation for AI Privacy Short Recap from RSAC 2021 Securing AI Privacy Industry Perspective
­ Enterprise AI ­ Trustworthy AI
Open-Source Tool for AI Privacy
­ AI Privacy Toolkit (APT)

Presenter's Company

Logo ­ replace or

delete on master slide

4

Motivation
The Era of AI
­ Large amounts of data generated ­ Omnipresent data collection ­ Better AI models
Privacy Regulations:
­ HIPAA, GDPR, ePrivacy, Canada's Consumer Privacy Protection Act (CPPA), Singapore's Personal Data Protection Act (PDPA), etc...
­ Serious fines for non-compliance
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
https://www.enforcementtracker.com
With Big Data comes big responsibility !!!
5

#RSAC
Recap RSAC 2021
Evasion, Poisoning, Extraction, and Inference: Tools to Defend and Evaluate

Recap RSAC 2021

1. Attribute Inference Attack

pu1, ..., pun-1, pr

target model

train

Presenter's Company Logo ­ replace or
delete on master slide

pu1, ..., pun-1

pr

2. Membership Inference Attack
target model

?

train

3. Defending with Differential Privacy

https://www.rsaconference.com/library/Presentation/USA/2021/evasion-poisoning-extraction-and-inference-tools-todefend-and-evaluate)

#RSAC

#RSAC
Privacy Preserving Technologies

Privacy Preserving Technologies

Differential Privacy
- Model dependent - "invasive"

Anonymization
- Syntactic privacy - Depends on available external information

Ensembles + student/teacher
- Challenging for large models - Requires non-sensitive data

Encryption
- Much slower inference - Requires key management

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
9

Defensive Approaches Without General Guarantees

Adversarial Learning
- Works only for single attack

Regularization
- No guarantees for increased privacy

Confidence Masking
- Easily circumvented with WB or Label Only attacks

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
10

#RSAC
Trade-Off in Preserving Privacy

Presenter's Company Logo ­ replace or
delete on master slide

11

#RSAC
Industry Perspective

Defenses Should be Non-Disruptive
Most organizations already have complex ML design and ops pipelines
Solutions should integrate into these pipelines with minimal disruption
Separate concerns: Data scientists are not experts in privacy and vice versa
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

Anonymiz e data

Retrain model

13

Design Choices ­

Two methods

AI Privacy Toolkit

"One-click" solutions easier to learn

Good default parameters facilitate

getting started

Updated API

Interpretable Visualisation preferred

First API
All parameters must be supplied

#RSAC

Single method

Returns dataset (model training occurs outside)
Supports all scikitlearn models/pipelines
Reasonable default parameters if None provided

Presenter's Company Logo ­ replace or
delete on master slide

Returns trained model

Enables visualization
tradeoffs
14

#RSAC
Scalability and Performance
Some privacy preserving methods are great for academic work but don't scale to enterprise workloads
­ Thousands of models ­ Millions of records ­ Small teams
Requires automation and efficient algorithms
­ sometimes resulting in sacrificing privacy and/or accuracy
Prioritization of models based on their risk assessment

Presenter's Company

Logo ­ replace or

delete on master slide

15

#RSAC
Trustworthy AI Requires Privacy, but also ...

Principles of Trustworthy AI

Performance

Fairness

Explainability

Presenter's Company

Adversarial

Privacy

Uncertainty

Logo ­ replace or delete on master slide

robustness

16

#RSAC
Open-Source Tools for AI Privacy
AI Privacy Toolkit (APT)

#RSAC
Open-Source Tool: AI Privacy Toolkit (APT)
https://github.com/IBM/ai-privacy-toolkit

Presenter's Company Logo ­ replace or
delete on master slide

Current Modules (next slides)
­ Model Anonymization ­ Data Minimization
Future Modules
­ Right-To-Be-Forgotten tools ­ Privacy Risk Assessment
18

Model Anonymization vs Data Anonymization

Anonymized

Original Data

Deployment

Data

Zip

Gender Age Account

Fee

Zip

Gender Age

Account

Data Anonymization

47919 Male

35

Personal

5.5

47902 Male

34

Personal

5.75

47918 Female 37

Personal

4.9

4791* 4790* 4791*

Person Person Person

[35-39] [30-34] [35-39]

Personal Personal Personal

47919 Female 39

Joint

4.5

4791* Person [35-39] Joint

47904 Female 30

Joint

5.1

4790* Person [30-34] Joint

47909 Male

31

Joint

4.8

4790* Person [30-34] Joint

#RSAC
Fee 5.5 5.75 4.9 4.5 5.1 4.8

Zip

47919

47902

Model

47918

Anonymization 47919

47904

47909

Original Data

Gender Age

Male

35

Account Personal

Male

34

Personal

Female 37 Personal

Female 39 Joint

Female 30 Joint

Male

31

Joint

Presenter's Company Logo ­ replace or
delete on master slide

Fee 5.5 5.75 4.9 4.5 5Z.1ip 44.8791* 4790* 4791* 4791* 4790* 4790*

Original Model

Anonymized Data

Gender Age

Account Fee

Person [35-39] Personal 5.5

Person [30-34] Personal 5.75

Person [35-39] Personal 4.9

Person [35-39] Joint

4.5

Person [30-34] Joint

5.1

Person [30-34] Joint

4.8

Anonymized Model
19

AI Privacy Toolkit: Model Anonymization

Trained model

Training data

Step 1 Train Anonymizer
Model-AccuracyGuided
Anonymization

Data Anonymization often results in low ML model accuracy
Here, our Model Anonymization provides anonymized training data with minimal reduction of model accuracy
­ based on the k-anonymity construct, but guided by model accuracy
Goldsteen A., Ezov G., Shmelkin R., Moffie M., Farkash A. (2022) Anonymizing Machine Learning Models
­ https://doi.org/10.1007/978-3-030-93944-1_8

Training data

Step 2 Apply Anonymization

Generalized Data

Step 3 Retrain Model

Anonymized Model

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
20

#RSAC

Differential Privacy
· Actual mathematical privacy guarantee · Works well for high-dimensional data,
including images · Future proof because of guarantees
· Invasive ­ replaces training algorithm · Different implementation for different
learning algorithms/architectures · May be more difficult to combine with other
Trustworthy AI aspects (that may require special model impl.), e.g., bias, explainability... · Requires the model trainer (data scientist) to be aware of privacy needs
Presenter's Company Logo ­ replace or
delete on master slide

vs
Pros

Model Anonymization
· Is external to the training process, which does not need to change
· Single, model-agnostic algorithm · Can be applied to existing models after the
fact. Retraining is needed, but algorithm/ architecture/hyperparams can be reused.

Cons

· Syntactic privacy
· Selection of quasi-identifiers may affect reidentification risk
· Works only for tabular, relatively lowdimensional data

21

#RSAC
AI Privacy Toolkit: Data Minimization 1/2
GDPR data minimization clause
­ Personal data shall be adequate, relevant and limited to what is necessary for the purposes at hand
Applied to new data collected for analysis (inference phase)
Goal: generalize features by replacing exact values with groups/ranges
­ For example, replace Age: 38 with Age: 35-40

Presenter's Company Logo ­ replace or
delete on master slide

22

AI Privacy Toolkit: Data Minimization 2/2
Accuracy vs NCP

Normalized Certainty Penalty (NCP): a metric for information loss or how well the data is generalized
­ Larger NCP means fewer specific data
Goal: Maximize NCP for desired accuracy
Table shows how 2% decrease in accuracy allows generalization of 3 sensitive features

Presenter's Company Logo ­ replace or
delete on master slide

Paper: Goldsteen, A., Ezov, G., Shmelkin, R. et al. Data minimization for GDPR compliance in machine learning models. AI Ethics (2021). https://doi.org/10.1007/s43681-021-00095-8

#RSAC
23

AI Privacy Toolkit (APT) in Action ­ 1/2
Run minimization with APT's GeneralizeToRepresentative
from apt.minimization import GeneralizeToRepresentative # Target accuracy of minimized model set to 0.998 minimizer = GeneralizeToRepresentative(model, target_accuracy=0.99) # Create predictions of representative model x_train_predictions = model.predict(X_generalizer_train) # Fitting the APT minimizer minimizer.fit(dataset=ArrayDataset(X_generalizer_train, x_train_predictions)) # Apply the APT minimizer to transform additional data transformed = minimizer.transform(dataset=ArrayDataset(x_test))
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
24

#RSAC
AI Privacy Toolkit (APT) in Action ­ 2/2

Check generalized features
print(minimizer.generalizations) --Initial accuracy of model on generalized data, relative to original model predictions (base generalization derived from tree, before improvements): 0.936540 Improving accuracy feature to remove: 2 Removed feature: 2, new relative accuracy: 0.935261 feature to remove: 4 Removed feature: 4, new relative accuracy: 0.946776 feature to remove: 0 Removed feature: 0, new relative accuracy: 0.972876 feature to remove: 1 Removed feature: 1, new relative accuracy: 0.992835 Accuracy on minimized data: 0.8192845079072624 {'ranges': {'3': [569.0, 782.0, 870.0, 870.5, 938.0, 1016.5, 1311.5, 1457.0, 1494.5, 1596.0, 1629.5, 1684.0, 1805.0, 1859.0, 1867.5, 1881.5, 1938.0, 1978.5, 2119.0, 2210.0, 2218.0, 2244.5, 2298.5, 2443.5]}, 'categories': {}, 'untouched': ['2', '1', '0', '4']} This time we were able to generalize one feature, feature number 3 (capital-loss).

Complete example of data minimization with AI Privacy Toolkit

­ https://github.com/IBM/ai-privacy-toolkit/blob/main/notebooks/minimization_adult.ipynb

Presenter's Company

Logo ­ replace or

delete on master slide

25

#RSAC
AI Privacy Toolkit : Meet the Developers

Slack
­ Announcements, Q&A, etc. ­ https://aif360.slack.com/mes
sages/C02HKUD0JG6
GitHub
­ Issues, Bug Reports, Discussions, Contributions!
­ https://github.com/IBM/aiprivacy-toolkit
Presenter's Company Logo ­ replace or
delete on master slide

Maintainer and Leading Core Developer
­ Abigail Goldsteen ­ abigailt@il.ibm.com
26

#RSAC
Apply What You Have Learned Today

Next week you should:
­ Locate all AI/ML models in your organization and identify those trained on personal data ­ Create awareness of potential privacy vulnerabilities and possible mitigations
In the first three months following this presentation you should:
­ Identify which mitigation strategies best suit your use case and models
May be more than one
­ Start learning how to use the appropriate toolkits ­ Design an overall solution encompassing the needs and resources available in your company
Within six months you should:
­ Start protecting your models used in production ­ Adhere to different privacy regulation requirements ­ Monitor, assess and adapt the suitability of your solution over time

Presenter's Company

Logo ­ replace or

delete on master slide

27

#RSAC
Acknowledgement

Parts of the work mentioned here are being developed within the EU funded H2020 project iToBoS: https://itobos.eu/index.php

Presenter's Company

Logo ­ replace or

delete on master slide

28

Thank you!
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
29

