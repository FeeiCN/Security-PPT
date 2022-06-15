© 2018 SPLUNK INC.
Splunk Machine Learning Toolkit In Action
Iman Makaremi, Splunk Principal Data Scientist Andrew Stein, Splunk Principal PM for Machine Learning
Oct 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Andrew Stein

© 2018 SPLUNK INC.

 Splunk Principal Product Manager ­ Machine Learning
 18 years creating mathematical modeled solutions as a data scientist.
 I spend 80 percent of time preparing data and 20 percent of time complaining about the need to prepare data.

Iman Makaremi

© 2018 SPLUNK INC.

 Splunk Principal Data Scientist
 I like math and physics a lot and know a few things about them.
 I spend 80 percent of time preparing to complain and 20 percent of time complaining about the need to complain.

Agenda
Am I in the right room?
 What?  Assistant : Detect Numeric Outliers
· IOT & IT Example  Assistant : Predict Numeric Fields
· Forecasts verse Prediction · IT Example  Assistant : Clustering · Security Example

© 2018 SPLUNK INC.

What?
Splunk has a Machine Learning Toolkit App!

© 2018 SPLUNK INC.

 What is Splunkbase
 What is the App
 Where can I go to learn more

© 2018 SPLUNK INC.
Workflow. Workflow. Workflow. Bees. Or Math.
Problem: <Stuff in the world> causes big time and money expense. Solution: Build ML model to learn the behaviors at scale and take action.

Get and explore data

Select and fit an algorithm,
generating a model

Apply and validate models

Surface model to consumers to solve problems

Operationalize

© 2018 SPLUNK INC.
What is the ML Advisory Program?
Partners a Splunk Data Science Resource to Help Operationalize a ML Use Case
 Early Access to new and enhanced MLTK features
 Opportunity to shape the development of the product
 Assistance in operationalizing a production quality ML model

© 2018 SPLUNK INC.
Assistant :Detect Numeric Outliers
Most Popular Assistant

© 2017 SPLUNK INC.
Detecting and Resolving Data Outages
 "Everything is Data, All of it is important."
 Data · Splunk index logs, Enrollment of Students through time · Database logs, Any data where outages matter to you
 Action Taken with the Detect Numeric Outliers · Splunk Admin after taking the Splunk EDU Data Science course. · Detecting data source outages that are critical for supported research
and operational centers, using custom seasonality
· Automatically Impute and replace missing information in summary
index, send alert to administrator for further action.

Mobility 3GPP Core KPI

© 2017 SPLUNK INC.

 Telus cell towers create a valuable and complicated network to maintain customer phone connectivity. The usability of our network by our customers is critical for our business.

 Data
· The 3GPP Core receives transactions from each subscriber to maintain
connection.
· The Telus custom KPI captures the behavior of TELUS's network.

 Action Taken with a Custom Machine Learning Model in Splunk
· Monitor this dynamic KPI and alert on contextual performance degradation.
· Radio engineers informed about deviations from expectations immediately,
creating the opportunity for in-the-field technician corrective actions.

Numerical Outlier Detection in MLTK

© 2018 SPLUNK INC.

12

Iterating over different threshold methods

© 2018 SPLUNK INC.

Standard Deviation

Absolute Median Deviation
13

Missed Outlier!

© 2018 SPLUNK INC.

14

Customized Outlier Detection

© 2018 SPLUNK INC.

15

Evaluate !

© 2018 SPLUNK INC.

16

© 2018 SPLUNK INC.
Current vs Historic and Delta Calculation
17

DETECTED!

© 2018 SPLUNK INC.

18

© 2018 SPLUNK INC.

I want Anomalies...

What is the minimum requirements for each workflow

 Detect Numeric Outliers Workflow
I have one number I care about, with possible seasonality (time) effects or some combination of identities (the "by" clause from stats for example).

 Or use many workflows...
I understand the statistics workflow, but I have many fields describing my problem or a measurable ground truth.

 I want to find anomalies in one number moving through time.

 I want to find complex anomalies and my data is organized.

 How to Blog:
 Statistical Anomalies and Forecasts (parts 1 ,2,3)

 How to Blog:
 Anomalies like Neapolitan Ice Cream

© 2018 SPLUNK INC.
Assistant: Predict Numeric Fields
Most Misunderstood Assistant

Predict vs Forecast
English kind of sucks....

© 2018 SPLUNK INC.

Source: Mac's Dictionary

Predict vs Forecast

© 2018 SPLUNK INC.

The Splunk stock is influenced by interest rates, global economic conditions, road map, CFO's blood pressure, density of CEO's beard...

The Splunk stock is cyclical, and every July stock price in the future will look like the July stock in the past +/- trending.

Predict vs Forecast

© 2018 SPLUNK INC.

TS Algo Algo

Predictors
Field P1 Field P2 Field P3 Field P4

Target
Field T

Predictors
Field T(t) Field T(t-1) Field T(t-2) Field T(t-3)

Target
Field T(t+1)

Predict vs Forecast

© 2018 SPLUNK INC.

MLTK Assistants · Predict a Numeric Field · Predict a Categorical Field
+ some optional time Travel SPL. How to Blog: ITSI and Sophisticated Machine Learning

Splunk · predict Command MLTK Assistant · Forecast Time Series
 How to Blog:
 Statistical Anomalies and Forecasts (parts 1,2,3)

 FINANCIAL SERVICES ­ IT OPERATIONS MANAGEMENT

© 2018 SPLUNK INC.

TransUnion Invests in Splunk Solutions for Enterprise Monitoring, Machine Learning

" Understanding customer volume patterns is important for the business. If traffic falls outside of a certain range, an alert is created. Splunk machine learning allows us to investigate early to ensure a seamless customer experience."
­ Lead Splunk Developer, TransUnion
 With the Splunk Machine Learning Toolkit and Splunk Machine Learning Customer Advisory Program Hyatt:
 Helping to meet customer SLAs
 Discovering incident root causes in minutes instead of hours
 Reducing the number of false alerts
 Increasing revenue by improving transaction processing

© 2018 SPLUNK INC.

I want a prediction...

What are the minimum requirements for each workflow

 Predict a Numeric Field
I want to generalize the relationship between one target numeric field and a series of descriptive fields.

 Predict a Future Value of a Field
I want to generalize the relationship between one target numeric field and a series of descriptive fields, but I want to have that relationship be explicitly in the future

I need a | table with the target numeric field and the descriptive fields , with _time if I am going to predict the future. The use of | table is not required, this is just good formatting step

I need a | table with the target numeric field and the descriptive fields , with _time if I am going to predict the future. The use of | table is not required, this is just good formatting step. I need to move the target field through time.

How to Blog:
Custom Anomaly Detection with Splunk IT Service Intelligence and Machine Learning Toolkit

How to Blog:
ITSI and Sophisticated Machine Learning

Customer Call Center

© 2018 SPLUNK INC.

Customer Call Center

© 2018 SPLUNK INC.

Customer Call Center

© 2018 SPLUNK INC.

Customer Call Center

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Assistant: Clustering
Sometimes you need to listen to your data!

I have data but... ?
What is the minimum requirements for each workflow
 Clustering
I have fields of data but I don't have a target field to generalize a relationship. I just want to know what rows are similar or dissimilar and by how much?

© 2018 SPLUNK INC.

I need to create a | table with the fields I plan on using. I should really scale the fields first with StandardScaler or RobustScaler in the preprocessing step, and I should consider using PCA to reduce the dimensions pre clustering, and I should convert text fields to meaningful numeric values.
The use of |table is not required, this is just good formatting step
App, Videos, and How to Blog:
DGA app on Splunkbase
DGA videos on Splunk Videos
Anomalies like Neapolitan Ice Cream

To the DGA app!
Demo Time!

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Now What?
So you want some ML ?

How do you replicate at your company?
Problem: <Stuff in the world> causes big time and money expense. Solution: Build ML model to learn the behaviors at scale and take action

© 2018 SPLUNK INC.

Get and explore data

Select and fit an algorithm,
generating a model

Apply and validate models

Surface model to consumers to solve problems

Operationalize

© 2018 SPLUNK INC.
END of LINE
Q&A

