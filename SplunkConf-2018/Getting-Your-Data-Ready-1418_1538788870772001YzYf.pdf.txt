© 2018 SPLUNK INC.
Getting Your Data Ready for Machine Learning
Kristal Curtis | Software Engineer, Machine Learning Adam J. Oliner | Director of Engineering .conf18 | Orlando, FL

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Machine Learning Wants a Matrix
ideally with the minimal number of relevant features

What You Have

What You Want

© 2018 SPLUNK INC.

Data Gathering and Prep
Source: CrowdFlower

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Want to learn more about MLTK? Check out the following session!
Using the Latest Features from the Splunk Machine Learning Toolkit to Create Your Own Custom Models
Speakers Harsh Keswani, Product Manager, Machine Learning, Splunk
Adam J. Oliner, Director of Engineering, Splunk Thursday, Oct 04, 12:15 p.m. - 1:00 p.m.

Data Cleaning Process
1. Semi-structured text a. Typical machine data b. Possibly some structure (e.g., key=value, JSON)
2. Tabular a. (row, column) = value
3. Matrix a. All numbers b. No missing values

© 2018 SPLUNK INC.

Example
_raw

© 2018 SPLUNK INC.

Example
Messy Table

© 2018 SPLUNK INC.

Example
Clean, Numeric Table

© 2018 SPLUNK INC.

1. Identify the right data 2. Clean the data 3. Engineer features 4. Split the data

Outline

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Identify the Data
relevance and sufficiency

Example Dataset
 Donut shop · Point-of-sale system from brick & mortar store · Transaction data from online sales (coffee, gear)

© 2018 SPLUNK INC.

Identify the Data
 Labels · Do you have examples of the task being performed correctly?
 Relevance · Would the information help a human perform the task?
 Completeness · Do you need to integrate multiple datasets?
 Weighting · Is older data less valid or useful than recent data?

© 2018 SPLUNK INC.

Data Integration
 Joins are natural (cf. SQL)  But, Splunk is not optimized for joins, so they are inefficient  Preferable to use OR  e.g., Correlating user logins & logouts by session ID
vs.

© 2018 SPLUNK INC.

 Automatic  TA  Manual / IFX

Field Extraction

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Cleaning
tidying up what's messy or missing

 User Input  Versioning  Upstream Processing  Dirty Source

Why So Dirty?

© 2018 SPLUNK INC.

Cleaning

© 2018 SPLUNK INC.

Missing values

Cleaning: fillnull

© 2018 SPLUNK INC.

Replace with 0

 Missing values

Cleaning

© 2018 SPLUNK INC.

Compute missing sale
amount

 Missing values

Cleaning

Replace according to this
probability

© 2018 SPLUNK INC.

Cleaning

© 2018 SPLUNK INC.

 Missing values

Cleaning
Impute missing values

© 2018 SPLUNK INC.

Impute with Model Predictions
It's ML all the way down  Train a model to predict sometimes-missing fields from known fields

© 2018 SPLUNK INC.

 Use the model to fill in the missing values via eval

Cleaning
 Unit disagreement (bytes vs. kilobytes)

© 2018 SPLUNK INC.

Possible kilobytes

Cleaning
 Scale (0.15 vs. 1M) · Fix via StandardScaler in MLTK

© 2018 SPLUNK INC.

Fix: StandardScaler
Preprocessing Step in MLTK

© 2018 SPLUNK INC.

New Fields

Cleaning
 Numerical vs. Categorical vs. Numerical that should be Categorical

© 2018 SPLUNK INC.

Obviously numeric
Obviously categorical

Should be categorical

Cleaning
Numerical => Categorical

© 2018 SPLUNK INC.

Cleaning
Categorical => Numerical

© 2018 SPLUNK INC.

Cleaning
Inconsistencies

© 2018 SPLUNK INC.

 Inconsistencies

Cleaning

Erroneous value

© 2018 SPLUNK INC.

Cleaning
Inconsistencies

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Feature Engineering
making the implicit, explicit

Feature Engineering: stats
 Work on aggregates, not raw events

© 2018 SPLUNK INC.

Feature Engineering: eval
 Model feature interactions
 Introduce nonlinearity

© 2018 SPLUNK INC.

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.

Feature Engineering: Text Analytics
 Transform free-form text to numeric fields with TFIDF  Then...
· Group similar text with KMeans · Classify text with BernoulliNB · Visualize the distribution of text with PCA

© 2018 SPLUNK INC.

© 2017 SPLUNK INC.

© 2017 SPLUNK INC.
3D Scatter Plot at https://splunkbase.splunk.com/app/3138/

© 2017 SPLUNK INC.

Feature Engineering: Leading Indicators
... | reverse | streamstats ... | reverse | ...
 All features need to be in a single event before passing to fit · We can use streamstats to look backwards · But what if we want to predict the future?

© 2018 SPLUNK INC.

Quantization
 Quantization (_time to hour, minute, etc.)

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Data Splitting
don't peek at the answers

 Training / Test  Class imbalance  Cross-validation

Data Splitting

© 2018 SPLUNK INC.

Class Imbalance
Definition

© 2018 SPLUNK INC.

 In classification / anomaly detection, you have classes you are trying to predict, e.g., · Valid / Fraud · Normal / Anomaly · Success / Failure
 Class imbalance refers to wildly different class frequencies · e.g., 99.999% valid; 0.001% fraud
 If we don't handle it correctly, our model will have trouble learning about the minority classes · e.g., no examples of the rare class appear in the training data

Class Imbalance
Detection

© 2018 SPLUNK INC.

Majority Class Minority Class

Class Imbalance
Stratified Sampling: Training Set
Training Proportion

© 2018 SPLUNK INC.

Class Imbalance
Stratified Sampling: Test Set

© 2018 SPLUNK INC.

Class Imbalance
Stratified Sampling: Merging the samples  Merge training samples from majority & minority classes:
 Merge test samples from majority & minority classes:

© 2018 SPLUNK INC.

Class Imbalance
Downsampling
Downsample to the smallest class:

© 2018 SPLUNK INC.

 2-Fold:

Cross Validation

 K-Fold (e.g., K = 5):
Train on partitions 0, 1, 3,
4
Infer on partition 2

© 2018 SPLUNK INC.

Built-in K-fold Cross Validation
New in MLTK 4.0
 Specify the number of folds with kfold_cv=  Validation metrics generated according to the type of model

© 2018 SPLUNK INC.

Summary

© 2018 SPLUNK INC.

 Machine learning wants clean data (usually a matrix)
 Machine data begins life dirty · Relevant data scattered across sources · Missing values, incorrect values, wonky formats · Class imbalance
 Splunk Enterprise and MLTK provide many tools for preparing data for ML · Field extraction, joins, and lookups · Fit algorithms like StandardScaler and FieldSelector · Commands like eval, sample, and fillnull

Want to know more?
Check out these upcoming ML sessions.

© 2018 SPLUNK INC.

FN1364 - Using Spark and MLLib for Large Scale Machine Learning With Splunk Machine Learning Toolkit
(Thursday, Oct 04, 11:00 a.m. - 11:45 a.m.) Lin Ma, Principal Software Engineer, Splunk Fred Zhang, Principal Data Scientist, Splunk

FN1409 - Thank You for Sharing: Expanding Machine Learning using Splunk MLTK GitHub Collaboration
(Thursday, Oct 04, 11:00 a.m. - 11:45 a.m.) Gyanendra Rana, Senior Product Manager, Splunk Nathan Worsham, IS Security Administrator, Pinnacol Assurance

FN1478 - Exciting, To-BeAnnounced Platform Session
Wednesday, Oct 03, 4:30 p.m. - 5:15 p.m.
Phillipp Drieger, Staff Machine Learning Architect , Splunk

FND1248 - Discriminatory Algorithms and Biased Data: Is the Future of Machine Learning Doomed?
Thursday, Oct 04, 1:30 p.m. - 2:15 p.m. Sarah Moir, Program Manager, Splunk Celeste Tretto, Data Scientist, Splunk

