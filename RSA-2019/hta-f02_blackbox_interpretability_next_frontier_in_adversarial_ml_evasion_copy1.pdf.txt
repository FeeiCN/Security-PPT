SESSION ID: HTA-F02
Blackbox Interpretability: Next Frontier in Adversarial ML Evasion

Holly Stewart, Greg Ellison
Microsoft Defender Research Team
Contributions by: Sam Jenkins, Harsha Nori
1

#RSAC

#RSAC

#RSAC
How do we address these zero day malware attacks?

Sticky

Use attack surface reduction rules (ex. blocking all docs with macros)
Detonate malware in an isolated environment Block when malware behaves badly on the system
Use machine learning to predict and block the threat at first sight
3

#RSAC
In Jan 2019...
30% threats first blocked
through machine learning prediction
4

Supervised machine learning process

Cloud

Machine attributes

Dynamic and contextual attributes

Static file

Client

attributes

5

#RSAC
Cloud Client

#RSAC
Supervised machine learning threat model

Cloud

Machine attributes

Dynamic and contextual attributes

Static file

Client

attributes

6

Cloud Client

#RSAC
Supervised machine learning threat model
Cloud
Client
* More info on the blog: https://aka.ms/hardening-ML and Black Hat USA
7

#RSAC
Supervised machine learning threat model

Cloud

Machine attributes

Dynamic and contextual attributes

Static file

Client

attributes

8

Cloud Client

#RSAC
Supervised machine learning threat model

Cloud

Machine attributes

Dynamic and contextual attributes

Static file

Client

attributes

* More info on the blog: https://aka.ms/hardening-ML and Black Hat USA

9

#RSAC
Challenges with machine learning
False Positives
10

#RSAC
Challenges with machine learning

False Positives Compute

Linear Model Computationally fast Simple structure Less precise predictions

Deep Learning Model Computationally slow Complex structure Better predictive performance

11

#RSAC
Challenges with machine learning

False Positives Compute Interpretability

This black box is intentional.

12

#RSAC
Enter black box interpretability methods (Many) work with any model
Help explain model decisions
Publicly available libraries

#RSAC
Benefits of black box interpretability
Missing signals (feature evasion)
Mohawk = GOOD

#RSAC
Benefits of black box interpretability
GOOD
Missing signals (feature evasion)
Big hair = BAD

#RSAC

Benefits of black box interpretability

GOOD

BAD

Missing signals

(feature evasion)

Benefits of black box interpretability

GOOD

BAD

Missing signals

(feature evasion)

#RSAC
??

Misleading signals (ambiguous features)
How about fauxhawks...
??

 Mohawk... GOOD  Big hair... BAD

#RSAC
Model improvement using black box interpretability

Missing signals (feature evasion)

Add new features

Misleading signals (ambiguous features)

Remove misleading features

Black Box Interpretability Methods

#RSAC
Notes on terminology
We're considering binary malware classifiers
­ Decide if a file is malware (1) or clean (0)
An instance is a single classifier decision (file, in this case) FP: False Positive ­ a clean file the classifier thinks is malware FN: False Negative ­ a malware file the classifier misses
20

#RSAC
Black box interpretability methods
Current focus of publicly-available methods:
­ Instance level model decisions
Two methodologies:
­ LIME ­ SHAP

#RSAC
LIME
Introduced in 2016 by Marco Ribero [1] Locally Interpretable ModelAgnostic Explanations

#RSAC
LIME
LIME samples space around instance and fits a local linear (thus, interpretable) model The model weights the samples by distance from instance The local model is fit using KLASSO

#RSAC
SHAP
Introduced in 2017 By Scott Lundberg [2] Differs from LIME in weighting sample distance from x', and estimating f'(x)

#RSAC
Implementation details
LIME & SHAP frameworks are not computationally cheap
­ Focus on known FPs & FNs
SHAP & LIME open source python libraries
­ https://github.com/marcotcr/lime ­ https://github.com/slundberg/shap

#RSAC
Combining multiple methods
These methods are approximations! Unlike reading the coefficients of a linear model, we're estimating model behavior So, we check to see that results of LIME and SHAP are consistent

#RSAC
Black box interpretability methods
LIME & SHAP both result in a feature contribution score, s
­ s > 0: the feature pushes the classifier toward malware ­ s < 0: the feature pushes the classifier toward clean ­ The closer s is to 0, the weaker the feature's contribution

#RSAC
Example: Per instance interpretability

Cloud classifier false positive (FP)

Feature Emulation Event 1 Emulation Event 2 File Metadata Feature Other Features

LIME score 0.22 0.27 0.22
...

SHAP score 0.03 0.18 0.07
...

#RSAC
Example: Per instance interpretability

Cloud classifier false positive (FP)

Misleading feature?

Feature Emulation Event 1 Emulation Event 2 File Metadata Feature Other Features

LIME score 0.22 0.27 0.22
...

SHAP score 0.03 0.18 0.07
...

#RSAC
Aggregated interpretability

Should we remove this misleading feature to avoid FPs?

Not necessarily... this is only one instance ­ let's aggregate!

Example: Emulation Event 2

Feature

Avg LIME score Avg SHAP score

FPs

TPs

Contributed Contributed

Emulation 0.115

0.114

1

30

Event 2

Looks like this is a good feature!

Fauxhawks are GOOD!

#RSAC
Identifying misleading features

Example: Emulation Event 2

Feature

Avg LIME score

Emulation Event Feature 2

0.115

Avg SHAP score 0.114

FPs Contributed 1

TPs Contributed 30

We can extend this analysis to discover badly behaved features:

Example: Emulation Event 2

Feature

Avg LIME score

Candidate 1

0.356

Candidate 2

0.943

Candidate 3

0.053

...

Avg SHAP score 0.388 0.874 0.081

FPs Contributed 4 4 2

TPs Contributed 2 0 28

#RSAC
Resolving misleading features
The obvious solution is to exclude misleading features from the model entirely

#RSAC
Experiment design: Excluding misleading features
Cloud
Train using all features (including misleading) Remove LIME/SHAP misleading features
Remove features frequently found in FP files
33

Results: Excluding

#RSAC

misleading features

52%

Recall

Measurements

50%

Recall - % malware detected

48%

Precision - % actual malware/classified malware 46%

Baseline

Precision

65%
64%
63%
Baseline
62% 0 10 25 50 100 500 Features removed
34

Results: Excluding

misleading features

52%

Recall

Measurements

50%

Recall - % malware detected

48%

Precision - % actual malware/classified malware 46%
Both techniques beat the

baseline

65%

Baseline

#RSAC
LIME/SHAP Frequent FP
LIME/SHAP

Sweet spot: 50 features removed (out of 200k)
LIME/SHAP best model

Precision

64%

Frequent FP

63%
Baseline
62% 0 10 25 50 100 500 Features removed

35

#RSAC
Detecting feature evasion

Reminder: LIME and SHAP feature contribution score, s s > 0: the feature pushes the classifier toward malware s < 0: the feature pushes the classifier toward clean

Example: Cloud Classifier FN

Feature

LIME score SHAP score

Generic File Metadata 1 -0.002

0.028

Generic File Metadata 2 -0.018

-0.060

...

File Content Feature 1

-0.002

0

File Content Feature 2

0.008

0

#RSAC
Automating feature generation
What to do about these feature evaded files? Generate signal!
­ Collect files with feature evasion ­ Mine the file content for malware signals
Target new feature development at previously unclassifiable malware

Automated feature mining (JavaScript files)

Add 200k clean files
Keep only malware files with feature evasion (~5k)

Cloud

Feature File Content Feature 1 File Content Feature 2

Score 0.64 0.33

38

#RSAC

Black Box Interpretability Results

Impact and results (JavaScript)

Did any of the new features matter?

YES

#RSAC
Malware prediction from new features

Weak malware predictors
24%

Strong malware predictors
56%

Impact and results (JavaScript)

Did any of the new features matter?

YES

YES Did the features result in
a reduction of featureevasion misses?

% missed due to feature evasion

#RSAC

Percentage of missed feature evasion files dropped by 40%

30%

New

25%

features

20%

deployed

15%

10%

5%

0%

4

5

6

7

8

Week of 2019

Impact and results (JavaScript)

Did any of the new features matter?

YES

YES Did the features result in
a reduction of featureevasion misses?

YES Did our classifiers miss
less malware?

Classifier misses

#RSAC

Total number of average daily classifier JavaScript misses declined

3,500 3,000 2,500 2,000 1,500 1,000
500 0 4

New features deployed
5 6 7 8 Week of 2019

#RSAC
Adversaries can use it, too
Black box interpretability methods consider only the inputs and resulting decision of a classifier
­ This is exactly how an attacker would examine our model!

#RSAC
How attackers can use black box interpretability

Cloud

Machine attributes

Cloud

Dynamic and contextual attributes

This black box is intentional.

Static file

Client

attributes

Client

44

#RSAC
30% threats first blocked
through machine learning prediction
45

#RSAC
ALL YOUR ML ARE BELONG TO US
46

#RSAC
Key Takeaways
Interpretabilty methods are freely available Make machine learning black box "explainable" Help identify feature evasion and misleading features
But... attackers could also use these methods to their advantage
Start your experiments now before they do!

#RSAC
Questions?

#RSAC
References
[1] "'Why Should I Trust You?': Explaining the Predictions of Any Classsifier"; Ribeiro, Singh, Geustrin (2016)
[2] A Unified Approach to Interpreting Model Predictions; Lundberg, Lee (2017)
[3] High-Precision Model-Agnostic Explanations; Ribeiro, Singh, Guestrin (2018)

