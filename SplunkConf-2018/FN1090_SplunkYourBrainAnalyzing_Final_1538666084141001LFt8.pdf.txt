Splunk Your Brain
Analyze Brainwaves using Machine Learning to Predict Activity or Mental State
Brian Guilfoyle | Sr. Sales Engineer
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Data Acquisition and Analysis
How to Build an ML Model using EEG data

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Getting EEG Data In Splunk
Brainwave Data = Machine Data!
MacBook Pro

© 2018 SPLUNK INC.

Muse EEG Headset

Bluetooth

UDP 5000

Mobile Phone with Muse Monitor App

OSC Server

Splunk Indexer Log File Output

Exploring EEG Data
What does the raw data look like?
Transforms.conf

© 2018 SPLUNK INC.

· Granular updates ­ 100ms · Clear field boundaries · Pre-processed EEG metrics
Ideal for Splunk and the MLTK!

Splunk Machine Learning Toolkit

© 2018 SPLUNK INC.

Extends Splunk platform functions and provides a guided modeling environment
 Assistants: Guide model building, testing & deploying for common objectives
 Showcases: Interactive examples for typical IT, security, business and IoT use cases
 Algorithms: 25+ standard algorithms available prepackaged with the toolkit
 SPL ML Commands: New commands to fit, test and operationalize models
 Python for Scientific Computing Library: 300+ open source algorithms available for use

Build custom analytics for any use case

Guided Model Building with the MLTK
Showcase Provides Real-World Examples of ML Concepts

© 2018 SPLUNK INC.

ML Approach
Predict Categorical Field (Mental State) using Time Series EEG Data

© 2018 SPLUNK INC.

Bin 1 Bin 2

Bin 3

· Bucket time into 10 second bins · Calculate stats on EEG data within bins · Use calculated stats fields as features for the
model

stdev med mod var avg

stdev med mod var avg

stdev med mod var avg

· Tag training data with "action" being performed by EEG wearer
· Use MLTK to test algorithms and model accuracy
· Apply model on real-time data for predictions

Preparing Training Data for ML
Tag EEG Data with Wearer Info Prior to Analysis
 Use KV Store Lookup to tag EEG data with user "action" when wearing headband
 Create custom form to enter "action" field
 Create scheduled search to perform stat calculations on data, lookup "action" tags and save to summary index
 Build ML model from searches against summary index

© 2018 SPLUNK INC.

Machine Learning Process with Splunk

Fit Model

Apply Model

© 2018 SPLUNK INC.

ML Toolkit Train model

Collect Data

props transforms
Clean Transform

Collect Data

props transforms
Clean Transform

Save to summary
index

Perform stats
calculation

Add "action"
field

KV Store

Predict "action"
field

Apply model

Perform Stats
calculation

© 2018 SPLUNK INC.
EEG DEMO

Key Takeaways

© 2018 SPLUNK INC.
1. The MLTK is like a box of legos. What
type of model do you want to build?
2. Predict categorical fields on time series
data by bucketing into bins, performing stats on bucketed data and using the calculated values as model features
3. Enrich training data with KVStore
Lookups, pre-process and store data in a summary index

© 2018 SPLUNK INC.
Q&A
Brian Guilfoyle | Sr Sales Engineer

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

