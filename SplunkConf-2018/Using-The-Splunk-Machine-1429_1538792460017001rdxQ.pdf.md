© 2018 SPLUNK INC.
Using the Latest Features from the Splunk Machine Learning Toolkit to Create Your Own Custom Models
Adam J. Oliner | Director of Engineering Harsh Keswani | Product Manager - Machine Learning
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Speakers

© 2018 SPLUNK INC.

v

Adam J. Oliner Director of Engineering

Harsh Keswani
Product Manager: Machine Learning

Outline
 Splunk Machine Learning Toolkit  Platform Extensions: ML-SPL, etc.  Experiments: Guided Machine Learning  Demo  What's New  Customer Success

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Machine Learning Toolkit
platform extensions and guided modeling dashboards

Machine Learning

 A process for generalizing from examples  Examples

· A, B, ...  #

(regression)

· A, B, ...  a

(classification)

· Xpast  Xfuture · like with like

(forecasting) (clustering)

· |Xpredicted ­ Xactual| >> 0

(anomaly detection)

© 2018 SPLUNK INC.

Machine Learning Process
Collect Data

© 2018 SPLUNK INC.

Deploy

Clean / Transform

Evaluate

Model

Explore / Visualize

Machine Learning Process with Splunk

© 2018 SPLUNK INC.

Deploy
Alerts, Dashboards, Reports
Evaluate

Collect Data

props.conf, transforms.conf, Datamodels, Splunkbase
Clean / Transform
Pivot, Table UI, SPL
Explore / Visualize

Splunk Machine Learning Toolkit

Model

Data Gathering and Prep
Source: CrowdFlower

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Want to learn more about data prep? Download the slides and recording for the following session.
Getting Your Data Ready for Machine Learning
Speakers Kristal Curtis, Software Engineer, Machine Learning, Splunk
Adam J. Oliner, Director of Engineering, Splunk Wednesday, Oct 03, 12:45 p.m. - 1:30 p.m.

Splunk Machine Learning Toolkit
extends Splunk with new tools and guided modeling
 Experiments: Guided model building, testing, and deployment for common objectives
 Showcases: Interactive examples for typical IT, security, business, and IoT use cases
 Algorithms: 30 standard algorithms
(supervised & unsupervised)  ML Commands: New SPL commands to
fit, test and operationalize models  ML-SPL API: Extensibility to easily import any algorithm
(proprietary / open source)  Python for Scientific Computing Library:
Access to 300+ open source algorithms

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Platform Extensions
custom search commands for machine learning

SPL, Macros, & Viz
Oh, my!

© 2018 SPLUNK INC.

 Commands (ML-SPL) · fit · apply · summary · listmodels · deletemodel · sample · score

 Macros · regressionstatistics · classificationstatistics · classificationreport · confusionmatrix · forecastviz · histogram · modvizpredict · splitby(1-5)

 Viz · Outliers Chart · Forecast Chart · Scatter Line Chart · Histogram Chart · Downsampled Line Chart · Scatterplot Matrix · Box Plot Chart

ML-SPL Commands
· Fit (i.e., train) a model from search results ... | fit <ALGORITHM> <TARGET> from <VARIABLES ...> <PARAMETERS> into <MODEL>
· Apply a model to obtain predictions from (new) search results ... | apply <MODEL>
· Inspect a model (e.g., display coefficients) | summary <MODEL>
· Score the prediction results ... | score <SCORE_METHOD> <ACTUAL> ~ <PREDICTED>

© 2018 SPLUNK INC.

ML-SPL Commands: fit

© 2018 SPLUNK INC.

... | fit <ALGORITHM> <TARGET> from <VARIABLES> <PARAMETERS> into <MODEL>
optional
Examples:

... | fit LinearRegression system_temp from cpu_load fan_rpm into temp_model
... | fit KMeans k=10 downloads purchases posts days_active visits_per_day into user_behavior_clusters

ML-SPL Algorithms
 30 algorithms OotB · prediction, clustering, forecasting, feature engineering
 Extensibility API for 300+ more  Pipeline for advanced use cases
... | fit TFIDF message | fit StandardScaler files bytes | fit KMeans message_tfidf_* SS_* k=5 | fit PCA message_tfidf_* k=2 | ...

© 2018 SPLUNK INC.

ML-SPL Commands: apply
... | apply <MODEL>
Examples:
... | apply temp_model ... | apply user_behavior_clusters

© 2018 SPLUNK INC.

ML-SPL Commands: score
... | score <SCORE_METHOD> <ACTUAL> ~ <PREDICTED>
Examples:
... | score accuracy_score vehicleType ~ LR_prediction DT_prediction
... | score confusion_matrix actual=vehicleType predicted=pred_type

© 2018 SPLUNK INC.

ML-SPL Commands: summary
... | summary <MODEL>
Examples:
... | summary temp_model ... | summary user_behavior_clusters

© 2018 SPLUNK INC.

ML-SPL Commands
| listmodels | deletemodel <MODEL>

© 2018 SPLUNK INC.

ML-SPL Commands: sample

 Randomly sample or partition events ... | sample <PARAMETERS>

 Four modes · Ratio · Count · Proportional · Partition

... | sample 0.01 ... | sample 20 ... | sample proportional="some_field" ... | sample partitions=10

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Experiments
guided machine learning

Guided ML with Experiments
 Guides you through an analysis  Automatically generates all the relevant SPL

© 2018 SPLUNK INC.

Experiments: Prepare

© 2018 SPLUNK INC.

Experiments: Fit

© 2018 SPLUNK INC.

Experiments: Validate

© 2018 SPLUNK INC.

Experiments: Deploy

© 2018 SPLUNK INC.

Experiments
 Predict Numeric Fields  Predict Categorical Fields  Detect Numeric Outliers  Detect Categorical Outliers  Forecast Time Series  Cluster Numeric Events

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Let's Build a Custom Model!

© 2018 SPLUNK INC.
What's New?
since last .conf

Major Highlights
(since .conf 2017)

© 2018 SPLUNK INC.

Splunk Machine  Python for Scientific

Learning Toolkit

Computing 1.3

Updates

Update

Includes new features  Updated libraries

for the Experiment

giving you access to

Framework, algorithms, new and modified

pre-processing steps,

algorithms and its

validation options etc.

parameters.

Splunk MLTK Connector for Apache SparkTM
Massive model building with MLlib directly from Splunk and SPL, No Scala skills required. (Limited
Availability Release)

GitHub MLTK Community

Splunk MLTK Container for Tensor Flow

Leverage and share algorithms
collaboratively with the broader MLTK
community

Container based neural networks, leveraging GPUs/CPUs.

Splunk Machine Learning Toolkit Updates

© 2018 SPLUNK INC.

· Experiment Management Framework: A unified UI that provides the ability to:
 Set roles based access control on experiments  Browsing and filtering pre-built models  Monitoring and scheduling alerts and searches  Getting history statistics about experiment's previous runs and alerts
· Score Command: A new command for validating models and statistical tests for any use case,
shipping with N algorithms today.
· K-fold Cross-validation: A popular and powerful way to quickly reduce model overfitting.
· UI for MLSPL.CONF: A interface to give user the power to change the safe settings if required
for app level mlspl configuration.

Splunk Machine Learning Toolkit Updates

© 2018 SPLUNK INC.

· New out-of-the-box algorithms
· Local Outlier Factor : Unsupervised anomaly detection. · Multi-layer Perceptron Classifier : Neural network-based supervised classifier. · Robust Scaler : Re-scaling algorithm that is robust to outliers. · X-Means: Unsupervised clustering.

· New pre-processing steps
· Term Frequency-Inverse Document Frequency : Feature extraction on unstructured text. · Field Selector: Feature selection.

MLTK 4.0 - Python for Scientific Computing 1.3

| fit y from x* into "model"

PSPCSC

© 2018 SPLUNK INC.

Industrial Assets

Consumer and Mobile Devices

Real Time

IoT

Cloud

Search

| apply "model" persisted model
Alert

...

Visualize

© 2018 SPLUNK INC.
Splunk MLTK Connector for Apache SparkTM (Limited Availability Release)

| sfit [y from x* into "model"]

BYO

Industrial Assets

Consumer and Mobile Devices

Real Time

IoT

Cloud

Search

| sapply "model" persisted model
Alert

...

Visualize

Not on Cloud

MLTK 4.0 -Splunk Community for MLTK Algorithms on GitHub

© 2018 SPLUNK INC.

A community github for sharing algorithm files
"The creation of the Splunk Community for MLTK Algorithms on GitHub will help us find new functionality within the catalog at a much faster rate, which will allow us to get even more use out of the Splunk Machine Learning Toolkit," said Nathan Worsham, IS Security Administrator, Pinnacol

Splunk MLTK Container for TensorFlowTM (via PS Whiteglove)

© 2018 SPLUNK INC.

Industrial Assets

Consumer and Mobile Devices

Real Time

IoT

Cloud

| fit y from x* into "model"

Search

| apply "model" persisted model
Alert

...

Visualize

Want to know more?

© 2018 SPLUNK INC.

Download the slides and recordings for these sessions.

FN1364 - Using Spark and MLLib for Large Scale Machine Learning With Splunk Machine Learning Toolkit
(Thursday, Oct 04, 11:00 a.m. - 11:45 a.m.)
Lin Ma, Principal Software Engineer, Splunk Fred Zhang, Principal Data Scientist, Splunk

FN1409 - Thank You for Sharing: Expanding Machine Learning using Splunk MLTK GitHub Collaboration
(Thursday, Oct 04, 11:00 a.m. - 11:45 a.m.)
Gyanendra Rana, Senior Product Manager, Splunk Nathan Worsham, IS Security Administrator, Pinnacol Assurance

FN1478 - Exciting, To-BeAnnounced Platform Session
Wednesday, Oct 03, 4:30 p.m. - 5:15 p.m.
Phillipp Drieger, Staff Machine Learning Architect , Splunk

© 2018 SPLUNK INC.
Customer Success

ML Success Story

© 2018 SPLUNK INC.

Consumer Credit Reporting Agency

Acting on a Critical Customer Outages before the Customer Calls You

Many different machines are part of the drug discovery process, and machines acting abnormally mean a loss in efficiency and increased costs.

Detect interference in cell towers Re-configure underperforming cells for optimal services levels

Improving cell tower uptime and reducing repair truck rolls with anomaly detection and root cause analysis

ML Success Story

© 2018 SPLUNK INC.

Entertainment Company

Predicting and averting potential gaming outage conditions with finer-grained detection
Preventing fraud by Identifying malicious accounts and suspicious activities

Find errors in server pools, then prioritize actions and associate root cause

Online Retailer

Failed orders detected in real time to avoid lost revenue and unhappy customers

Predicting Student Achievement and taking action to improve grades

© 2018 SPLUNK INC.
The latest release of Splunk Machine Learning Toolkit makes it significantly easier to process large amounts of data and find
patterns to see what's right or wrong. Splunk's continued evolution of the Experiment Management Framework, including
new tools to help validate our machine learning models, streamlines the complicated process of operationalizing
machine learning.
Sundaresh Ramanathan, Director, IT Operations Analytics, Kinney Group, Inc.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

