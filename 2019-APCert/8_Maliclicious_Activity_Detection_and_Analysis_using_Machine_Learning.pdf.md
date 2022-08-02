Malicious Activity Detection and Analysis using Machine Learning
:State of the Art and future opportunities
Title Lorem Ipsum Presented By: Amit Singh
amitsingh@cert-in.org.in/singh.amit90@gov.in LinkedIn: https://www.linkedin.com/inS/itaDmoilto-rsiAnmghe-t11845437

Outline
· Machine Learning · Classification of Machine Learning algorithms
· Classical ML vs. Deep Learning
· Performance Evaluation of ML based approaches · ML meets Cyber Security · Applications of Machine Learning algorithms in Malicious Activity
Detection
· Spam/Phishing detection · Anomaly Intrusion Detection · Malware detection and classification
· Future Direction and Challenges

Machine Learning
· A branch of artificial intelligence, concerned with the design and development of algorithms that allow computers to evolve behaviors based on empirical data.
· As intelligence requires knowledge, it is necessary for the computers to acquire knowledge.
Source: Difference between AI, Machine Learning & Deep Learning

Machine Learning
· "A computer program is said to learn from experience E with respect to some class of tasks T and performance measure P if its performance at tasks in T, as measured by P, improves with experience E "- Tom Mitchell
· "Machine learning is a type of artificial intelligence (AI) that provides computers with the ability to learn without being explicitly programmed. Machine learning focuses on the development of computer programs that can teach themselves to grow and change when exposed to new data." - Google's definition

The Machine Learning Process

· Defining the problem and assembling aDdaattaasceotllection

Data preparation · Preparing your data

·Different algorithms are for different tasks; choose the right one
Model Selection

Train Model
·Developing a model that does better than a baseline

·Choosing a measure of success ·Deciding on an evaluation protocol
Evaluate Model

Parameter Tuning
·Scaling up: developing a model that overfits ·Regularizing your model and tuning your parameters

· Apply the model to the real world
Predict

Taxonomy of ML Approaches
· Shallow Learning/Classical Machine Learning · Supervised Learning · Naive Bayes · Logistic · regression · Support Vector Machines · Random Forests · Shallow Neural Networks · Unsupervised Learning · Clustering · Association Rule Mining
· Deep Learning · Supervised Learning · Feed forward NN · Recurrent NN · Convolutional NN · Unsupervised Learning · Stacked auto encoders · Deep belief Networks

Classical ML

Data Ingestion

Feature Extraction

Feature Selection

Data Acquisition +
Data Preparation

Feature Engineering

Traditional ML· Works better on small data · Financially and computationally cheap · Easier to interpret

Classical ML Algorithm

Output

Model Selection +
Parameter Tuning
+ Model Validation

Classification/ Prediction

Deep learning

Data Ingestion
Gathering Data Sources + Data Pre-processing

Deep Learning Algorithm
Feature Engineering+ ML Model Building

Output
Classification/ Prediction

"Deep learning is a particular kind of machine learning that achieves great power and flexibility by learning to represent the world as nested hierarchy of concepts, with each concept defined in relation to simpler concepts, and more abstract representations computed in terms of less abstract ones."

Deep learning promises
· Best-in-class performance · Scales effectively with data · `Auto' feature extraction · High accuracy of detections · Adaptable and transferable

Deep learning vs Classical ML
· Deep Learning is more hardware intensive
· Deep Learning provides highly accurate results but takes much longer to train
· Deep Learning is perfect for dealing with high volumes of unstructured data
· Deep Learning does not require a domain expert to specify each and every function

Performance Evaluation of ML based approaches

Predicted value

Actual value Positive (1) Negative(0)

Positive (1) Negative (0)

TP (True positive)
FN (False Negative)

FP (False positive)
TN (True Negative)

· True positive when model predicted true and it is true
· True Negative when model predicted false and it is false.
· False positive when model predict true but it is false (Type 1 error)
· False Negative when model predicted false but it is true. (Type 2 error)

Performance Indicators
Metrics !""#$%"& Error rate Sensitivity Specificity
,-"%.. ($-"/0/12 +1 - 5"1$-
,-"%..

Formula '( + '* '( + '* + +( + +* +( + +* '( + '* + +( + +*
'( '( + +*
'* '* + +(
'( '( + +*
'( '( + +( 2  ,-"%..  ($-"/0/12 ,-"%.. + 8$-"/0/12
'( '( + +*

AUC - ROC Curve
AUC - ROC curve is a performance measurement for classification problem at various thresholds settings. ROC is a probability curve and AUC represents degree or measure of separability. It tells how much model is capable of distinguishing between classes. Higher the AUC, better the model is at predicting 0s as 0s and 1s as 1s.
The ROC curve is plotted with TP against the FP where TP is on y-axis and FP is on the x-axis.

Cyber Security
Cybersecurity is the body of technologies, processes and practices designed to protect networks, computers, programs and data from attack, damage or unauthorized access. In a computing context, security includes both cybersecurity and physical security.

ML meets Cyber Security
Why use ML in cybersecurity? · ML is now considered crucial to the role of cyber security · Protect sites from attacks and identify quickly new threats · It can speed up the process of noticing attacks · Beneficial in preventing a full-scale breach being unleashed
Machine learning specifics in cybersecurity · Large representative datasets · Interpretable model · Low False positive rates · Adaptable Algorithms to tackle evolving malware counter measures

Applications of Machine Learning algorithms in Malicious Activity Detection
· Botnet Detection and classification · Anomaly Intrusion Detection
Examples ­ Malicious JavaScript and other scripts ­ Malicious Non-Executable Files ­ Malicious Executable Files
· Malware detection and classification · Inappropriate Web and Email Content · Spam/Phishing detection
­ Derive probabilistic models of phishing attacks ­ Derive probabilistic reputation models for URLs

Spam/Phishing detection
PHISHING IS A TYPE OF SOCIAL ENGINEERING ATTACK USED TO STEAL SENSITIVE INFORMATION SUCH AS PASSWORDS OR FINANCIAL DETAILS
ATTACKERS PRETEND TO BE A TRUSTED ENTITY TO PUSH VICTIMS INTO OPENING FRAUDULENT LINKS OR ATTACHMENTS
THIS IS A GENERIC ATTACK USING COMMON MESSAGES THAT MAY BE RELEVANT TO THE VICTIMS CONTRIBUTING TO THEIR FALSE SENSE OF TRUST

SPEAR PHISHING IS AN ADVANCED TYPE OF SOCIAL ENGINEERING ATTACK USED TO STEAL SENSITIVE INFORMATION SUCH AS PASSWORDS OR FINANCIAL DETAILS.
ATTACKERS PRETEND TO BE A TRUSTED ENTITY TO PUSH VICTIMS INTO OPENING FRAUDULENT LINKS OR ATTACHMENTS
THIS IS A VERY FOCUSED ATTACK USING SPECIFIC MESSAGES WITH PERSONAL AND RELEVANT INFORMATION TO THE VICTIMS INCREASING THEIR FALSE SENSE OF TRUST

Machine learning based phishing detection

Webpage

Feature extraction

ML Model

Phish Legit Prediction

Phishing detector training
Phish

Phishing detection model

Legit Ground truth collection Feature extraction Model learning

Evaluation setup

Ground truth collection

Legit

Phish

Training set

Test set

Model learning Phishing detection model

Phish Legit

Accuracy metrics

Prediction

Example Features

Number of Dots Url Length At Symbol NumPercent NumHash RandomString DomainInPaths PathLength NumSensitiveWords PctExtResourceUrls RelativeFormAction PctNullSelfRedirectHyperlinks RightClickDisabled IframeOrFrame SubdomainLevelRT AbnormalExtFormActionR

SubdomainLevel NumDash TildeSymbol NumQueryComponents NumNumericChars IpAddress HttpsInHostname QueryLength EmbeddedBrandName ExtFavicon ExtFormAction FrequentDomainNameMismatch PopUpWindow MissingTitle UrlLengthRT ExtMetaScriptLinkRT

PathLevel NumDashInHostname NumUnderscore NumAmpersand NoHttps DomainInSubdomains HostnameLength DoubleSlashInPath PctExtHyperlinks InsecureForms AbnormalFormAction FakeLinkInStatusBar SubmitInfoToEmail ImagesOnlyInForm PctExtResourceUrlsRT PctExtNullSelfRedirectHyperlinksRT

For our experimental work the dataset was obtained (Choon Lin Tan, 2018). In this Phishing, datasets, there are 48 features and 10,000 instances.

Classifier

Precision value for Feature selection & Dimensionality Reduction

Information gain feature
selection

Select from model

Recursive feature eliminatio
n

Univariate Feature selection

Variance Reduction Feature selection

Principal componen t analysis

L1 (Lasso ) Regulariza
tion

MultinomialNB GaussianNB Logistic Regression
Random Forest AdaBoost XGBoost KNeighbors SVM
DecisionTree Classifier

0.693 0.745
0.838
0.884 0.834 0.856 0.766 0.828
0.842

0.858 0.936
0.927
0.982 0.973 0.974 0 .963 0.923
0.966

0.854 0.920
0.919
0.983 0.966 0.969 0.944 0.906
0.971

0.738 0.934
0.875
0.969 0.957 0.963 0.920 0.864
0.957

0.687 0.824
0.876
0.940 0.916 0.922 0.821 0.870
0.891

0.576 0.718
0.739
0.847 0.794 0.807 0.812 0.694
0.801

0.707 0.954
0.940
0.968 0.954 0.968 0.818 0.934
0.941

Classifier

Information gain
feature selection

Recall value for Feature selection & Dimensionality Reduction

Select from model

Recursive feature elimination

Univariate Feature selection

Variance Reduction Feature selection

Principal component
analysis

L1 (Lasso ) Regularizati
on

Multinomi alNB
GaussianN B
Logistic Regression
Random Forest AdaBoost XGBoost KNeighbors SVM DecisionTr eeClassifier

0.871
0.870
0.886
0.885 0.902 0.915 0.890 0.908 0.821

0.748
0.769
0.928
0.980 0.979 0.980 0.952 0.934 0.954

0.738
0.735
0.925
0.975 0.956 0.972 0.937 0.927 0.971

0.928
0.739
0.888
0.975 0.965 0.966 0.914 0.930 0.960

0.893
0.876
0.862
0.938 0.933 0.933 0.879 0.880 0.883

0.922
0.861
0.832
0.888 0.867 0.889 0.896 0.931 0.826

0.910
0.696
0.927
0.958 0.958 0.949 0.856 0.936 0.949

Classifier

Information gain feature
selection

Multinomial NB
GaussianNB
Logistic Regression
Random Forest AdaBoost XGBoost
KNeighbors
SVM
DecisionTre eClassifier

73.600
78.067
85.433
88.200 86.433 87.800 80.500 85.700
82.933

Accuracy for Feature selection & Dimensionality Reduction

Select from model

Recursive feature elimination

Univariate Feature selection

Variance Reduction Feature selection

Principal component
analysis

80.733 85.467

80.100 83.167

79.433 83.967

73.700 84.067

62.733 76.433

92.600
98.067 97.567 97.667 95.700 92.700

92.033
97.833 96.000 96.967 94.500 91.400

87.800
97.133 95.967 96.367 91.533 88.960

86.733
93.767 92.167 92.533 84.066 87.166

77.300
86.567 82.333 84.000 84.700 76.366

95.967

97.000

95.800

88.333

81.300

L1 (Lasso ) Regularizati
on
76.033
82.700
93.267
96.200 95.467 95.767 82.933 93.366
94.300

Classifier

F1-Sore value for Feature selection & Dimensionality Reduction

Information gain feature
selection

Select from model

Recursive feature elimination

Univariate Feature selection

Variance Reduction Feature selection

Principal component
analysis

L1 (Lasso ) Regularizatio
n

Multinomial NB
GaussianNB Logistic
Regression Random Forest AdaBoost
XGBoost
KNeighbors
SVM DecisionTree

0.772 0.803 0.861
0.884 0.867 0.885 0.823 0.866 0.831

0.799 0.844
0.927
0.981 0.976 0.977 0.952 0.928

0.792 0.817 0.922
0.979 0.961 0.970 0.940 0.916 0.971

0.822 0.825 0.881
0.972 0.961 0.964 0.917 0.896 0.958

0.777 0.849 0.869
0.939 0.924 0.927 0.849 0.875 0.887

0.709 0.783 0.783
0.867 0.829 0.846 0.852 0.795 0.813

0.796 0.805 0.933
0.963 0.956 0.958 0.837 0.935 0.945

Information Gain

Univariate feature selection

Figure 1 AUC-ROC curve on Information gain Variance Reduction

Figure 2 AUC-ROC curve on Univariate feature selection Principal component analysis

Figure 3 AUC-ROC curve on Variance reduction

Figure 4 AUC-ROC curve on PCA

Recursive feature elimination

Lasso feature selection

Figure 1 AUC-ROC curve on Recursive feature elimination Select from model

Figure 2 AUC-ROC curve on Lasso feature selection

Figure 3 AUC-ROC curve on Select from model

Catalog of Approaches used for Phishing Detection
Phishing Detection using ML

Category of Features

URL Based Features

Header Based Features

Content Based features

Sender based features

Feature Selection Method

Gain Ratio

Fisher Score

Document Frequency

Principal Component Analysis

Classification Algorithm

Artificial Neural Networks (ANN)
Naïve Bayes(NB)

Bayesian Networks (BN)
Decision Tree (DT)

Correlation based feature selection

Univariate feature selection

Rough Set and GA based

Hierarchical Feature Selection

K-Nearest Neighbor (KNN)

Support Vector Machine (SVM)

Boosted Algorithms

Deep Neural Networks (DNN)

Malware detection/Classification
Malware, short for malicious software, is software designed to gain access to confidential information, disrupt computer operations, and/or gain access to private computer systems. Malware can be classified by how it infects systems:
· Trojan Horses · Viruses · Worms Or by what assets it targets: · Ransomware · Information stealers · Spyware and adware · Backdoors · Rootkits · Botnets

· Increasing threats......... Ø Continuous and increased attack on infrastructure Ø Threats to business national security and personal security of PC's

Total Malware (Cumulative)

1E+09 90000000 0 80000000 0 70000000 0 60000000 0 50000000 0 40000000 0 30000000 0 20000000 0 10000000 0
0 Q2 Q3 Q4 Q1 Q2 Q3 Q4 Q1

2017

2018

2019

80000000 70000000 60000000 50000000 40000000 30000000 20000000 10000000
0

New Malware

Q2 Q3 Q4 Q1 Q2 Q3

2017

2018

Q4 Q1 2019

Source :McAfee Threat Report

The problem: Antivirus
·How Antivirus detect malware?
ØAntivirus uses signature, heuristics and hand crafted rules that do not scale well.
·How Malwares evade antivirus?
ØUsing polymorphism and obfuscation.
·Is Antivirus Dead?
ØThe Security industry has declared Antivirus Solutions as dead but there is no universally accepted replacement.

·Why Machine Learning?
ØToo many types of malware bots, virus ØToo much data ØMalwares are becoming more advanced and sophisticated. ØMachine Learning can be the replacement.

Malware detection and Classification

Executable Files Feature extraction

ML Model

Malicious Benign Prediction

Malware detection and classification training
Malicious Executables
Malicious Executables
Ground truth collection Feature extraction Model learning Predictive Model

Ground truth

Benign Executables

collection

Malicious Executables

Training set

Test set

Model learning Prediction model

Malicious Accuracy
Benign metrics
Prediction

Catalog of Approaches used for Malware Classification
Malware Detection using ML

Files Representation
Method

Byte n-grams

Portable Executable
features

Opcode n-grams

Strings

Gray Scale Images Texture Features

Function-based

Feature Selection Method

Gain Ratio

Fisher Score

Artificial Neural Networks
(ANN)

Classification Algorithm
Bayesian Networks (BN)

Document Frequency
PCA

Pearson correlation feature selection

Naïve Bayes(NB)

Decision Tree (DT)

Hierarchical Feature Selection

K-Nearest Neighbor (KNN)

Support Vector Machine (SVM)

Boosted Algorithms

Deep Neural Networks
(DNN)

eXtreme Gradient Boosting (XGBoost)
Adaptive Boosting (AdaBoost)

Deep convolutional neural network (CNN) long-short term memory (LSTM)
Gated Recurrent Unit (GRU)

Example Features

32/64 bit Executable
Debug Information
Present
Header Information
Compiler Artifacts

GUI Subsystem

Command Line Subsystem

File Size

Packer Type

File Entropy

Number of Sections

Byte Histogram

Distribution of Section Entropy

Linker Artifacts

Resource Data

Imported DLL Names
Embedded protocol Strings

Timestamp
Number Writable
Imported Function Names
Embedded IPS/Domains

Embedded Paths

Embedded Product Meta Data

Digital Signature

Icon Content

Export Information

Experiment
· Obtaining data is the first step, our dataset consists of 10,123 benign and 40212 malicious PE files. The training set contained 70 % data and the test set contained 30 % data.
· LIEF library was used to parse these PE files and extract PE features.
· Feature Selection Using Extra Tree Classifier.
· Extra Tree Classifier selected 23 important features out of 57 features.

Anomaly Intrusion Detection
· Intrusion Detection:
· Process of monitoring the events occurring in a computer system or network and analyzing them for intrusions
· Intrusions are defined as attempts to bypass the security mechanisms of a computer or network
· Challenges
· Traditional signature-based intrusion detection systems are based on signatures of known attacks and cannot detect emerging cyber threats
· Substantial latency in deployment of newly created signatures across the computer system
· Anomaly detection can alleviate these limitations

Type of Anomaly
· Point Anomalies · Contextual Anomalies · Collective Anomalies

Applications of Anomaly Detection
· Network intrusion detection
· A web server involved in ftp traffic
· Insurance / Credit card fraud detection
· An abnormally high purchase made on a credit card
· Healthcare Informatics / Medical diagnostics · Industrial Damage Detection · Image Processing / Video surveillance · Novel Topic Detection in Text Mining

Fraud Detection
· Fraud detection refers to detection of criminal activities occurring in commercial organizations
· Malicious users might be the actual customers of the organization or might be posing as a customer (also known as identity theft).
· Types of fraud
· Credit card fraud · Insurance claim fraud · Mobile / cell phone fraud · Insider trading
· Challenges
· Fast and accurate real-time detection · Misclassification cost is very high

Credit card fraud detection
Offline learning model

Historical Data

Feature Extraction

Sampling Methods

Feature transformati
on

Feature Engineering Loop

Features Without Labels
Test data

Test Model Predictions

Training data
Features With Labels

Model training/ Building

Train/Test loop

Online mode
Incoming transaction

Feature Extraction

Feature transformation
Prediction Model

Fraudulent transaction
Legitimate transaction

Example Features

Features associated with the Card Holder

· Card Type · Expiration date · Home Address

Features associated with the transaction

· POS Number · Account Number · Date and Time · Transaction Amount · Merchant category

Features derived from transaction
history

·Number of Transactions in last 24 hours ·Total $ amount las 24 Hours ·Average amount last 24 hours ·Average amount last 24 hours compared to historical use ·Location and time difference since last transaction ·Average transaction ·Fraud risk of merchant type ·Merchant types for day compared to historical use

Catalog of Approaches used for Credit card Fraud Detection
Fraud Detection using ML

Sampling Methods

Oversampling

Undersampling

Synthetic minority oversampling technique (Smote)
Adaptive synthetic sampling (AdaSyn) Random oversampling (ROS)
Oversampling followed by undersampling

Random undersampling (RUS) Tomeklinks
Cluster centroids undersampling technique AIIKNN

Smote + Tomek (SmoteTomek) Smote + ENN (Smoteen)

Feature Selection Method

Gain Ratio

Fisher Score

Artificial Neural Networks
(ANN)

Classification Algorithm
Bayesian Networks (BN)

Document Frequency
PCA

Pearson correlation feature selection

Naïve Bayes(NB)

Decision Tree (DT)

Hierarchical Feature Selection

K-Nearest Neighbor (KNN)

Support Vector Machine (SVM)

Boosted Algorithms
eXtreme Gradient Boosting (XGBoost) Adaptive Boosting (AdaBoost)

Deep Neural Networks
(DNN)

· In the Credit card Fraud Detection system,

datasets

obtained

from

https://www.kaggle.com/mlg-

ulb/creditcardfraud.

· This dataset contained transactions made by

credit card in September 2013 by European

cardholders. It is a highly Imbalance, dataset,

containing 31 features and 284,807 instances.

Upcoming Table is providing all the necessary

information regarding dataset.

Description
Number of features Number of labels Number of Positive labels (one) Number of Negative labels (zero) Number of Null values in instances

Values
31 2,84,807 492 2,84,315 Zero

Classifier
AdaBoost Decision
Tree GaussianN
B KNeighbor
s Multinomi
alNB Random Forest
SVM
XGBoost
Logistic Regression

SMOTE 0.984 0.997 0.972 0.998 0.999 1.000 0.977 0.989 0.975

ADASYN 0.962 0.997 0.927 0.998 0.909 1.000 0.914 0.964 0.914

ROS 0.988

Precision value for Balanced Dataset

RUS

TMLK

CC

AIIKNN

0.943

0.964

0.992

1.000

0.999

0.893

0.964

0.992

1.000

0.970

0.953

0.701

0.977

0.775

0.999

0.962

0.969

0.991

1.000

0.999

1.000

----

0.990

----

1.000 0.980 0.993

0.963 1.000 0.963

0.964 0.969 0.965

0.984 0.991 0.992

1.000 1.000 1.000

0.976

0.984

0.959

0.983

0.991

Classifier
AdaBoost Decision
Tree GaussianNB
KNeighbors Multinomia
lNB Random Forest
SVM XGBoost

SMOT E
0.969 0.999 0.850 1.000
0.767
1.000 0.917 0.972

Logistic Regression 0.922

ADASYN 0.967 0.999 0.526 1.000 0.677
1.000 0.866 0.985
0.855

ROS 0.982 1.000 0.859 1.000 0.760
1.000 0.913 0.996
0.919

Recall value for Balanced Dataset

RUS

TMLK

CC

AIIKNN

0.911 1.000 1.000

0.984

0.917 0.990 0.992

0.992

0.849 1.000 1.000

0.991

0.883 0.863 0.993

0.893

0.746 0.000 0.785

0.000

0.910 0.842 0.904

0.982 0.845 1.000

0.984 0.905 1.000

0.984
0.840 0.992

0.869 0.855 0.944

0.879

Abbreviations used in Tables:
ROS: Random Over Sampling. TMLK: TomekLinks CC: Cluster Centroids

SMTMK: SmoteTomek SMTN: Smoteen RUS: Random Under-Sampling

SMTMK 0.984 0.997 0.972 0.998 0.999 0.999 0.977 0.989 0.975
SMTMK 0.968 0.999 0.852 1.000 0.767 1.000 0.916 0.967
0.922

SMTN 0.984 0.996 0.973 0.999 0.996 0.999 0.976 0.988 0.974
SMTN 0.970 0.998 0.852 1.000 0.769 1.000 0.917 0.969
0.922

Figure 1 AUC-ROC curve on Smote

Figure 2 AUC-ROC curve on AdaSyn

Figure 3 AUC-ROC curve on Random OverSampling

Figure 4 AUC-ROC curve on Random UnderSampling

Figure 1 AUC-ROC curve on TomekLinks Figure 3 AUC-ROC curve on Center Centroids
Figure 5 AUC-ROC curve on Smoteen

Figure 2 AUC-ROC curve on AIIKNN Figure 4 AUC-ROC curve on SmoteTomek

Future Direction and Challenges
Challenges
· No well-trained domain experts and data scientists to oversee the implementation. · Bad understanding of the data to engineer meaningful features (e.g. Byte stream for binaries) · Lack of Labeled Samples and Certainty in Ground Truth. · Lack of publicly available and labelled data for training. · Reliable Evaluation Data Sets or Data Generation Tools. · Verifiability of output. · Interpretation of output. · Data cleanliness issues (timestamps, normalization across fields, etc.) · Imbalanced Data Sets. · Imbalanced Learning Problem and Advanced Evaluation Metrics. · Concept Drift. · Operational effectiveness, efficiency, or cost reduction. · Weaponization of artificial intelligence in Cyber Security.

· Future Direction
· Transfer Learning and "One-Shot Learning" · Continuous Learning · Reinforcement Learning · Adaptive Machine Learning
· Adversarial Machine Learning · Emerging technologies such as IOT, Blockchain and cloud computing. · Swarm Viruses and Antiviruses.

Thank you for listening!

