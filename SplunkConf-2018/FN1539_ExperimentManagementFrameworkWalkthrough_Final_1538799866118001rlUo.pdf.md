Experiment Management Framework
Walkthrough the Splunk Machine Learning Toolkit
Harsh Keswani ­ Product Management Iryna Vogler ­ User Experience Design
October 2018

© 2018 SPLUNK INC.

PRESENTATIONS.
Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Speakers

© 2018 SPLUNK INC.

v

HARSH KESWANI Product Manager: Machine Learning

IRYNA VOGLER Senior Principal UX Designer

© 2018 SPLUNK INC.
What is Machine Learning Toolkit (MLTK)? Who is it for?

Machine Learning

 A process for generalizing from examples

 Examples · A, B, ...  # · A, B, ...  a · Xpast  Xfuture · like with like · |Xpredicted ­ Xactual| >> 0

(regression) (classification) (forecasting) (clustering) (anomaly detection)

© 2018 SPLUNK INC.

Machine Learning Process
Collect Data

© 2018 SPLUNK INC.

Deploy

Clean / Transform

Evaluate

Explore / Visualize

Model

Splunk Machine Learning Toolkit (MLTK)
Extends Splunk platform functions and provides a guided modeling environment
 Assistants: Guided model building, testing and deployment for common objectives
 Showcases: Interactive examples for typical IT, security, business and IoT use cases -
 Algorithms: 30 standard algorithms (supervised & unsupervised)
 ML Commands: New SPL commands to fit, test and operationalize models
 ML-SPL API: Extensibility to easily import any algorithm (proprietary / open source)
 Python for Scientific Computing Library: Access to 300+ open source algorithms
 Spark MLLib: Support large scale model training via Spark Addon for MLTK (Private-Beta)

© 2018 SPLUNK INC.

MLTK Customer Success

© 2018 SPLUNK INC.

Network Optimization Detect & Prevent Equipment Failure

Security / Fraud Prevention

Prevent Cell Tower Failure Optimize Repair Operations

Prioritize Website Issues and Predict Root Cause

Entertainment Company
Predict Gaming Outages Fraud Prevention

Machine Learning Consulting Services

Analytics App built on ML Toolkit

Our Users
 IT and security practitioners with no data science knowledge · Out-of-the-box AI and ML experiences
 Advanced users with data science background and analytics expertise · Customizable AI and ML experiences

Splunk Users Users Interested in MLTK ~ 70%
Citizen Data Scientists
Data Scientists
< 5%

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
What MLTK Problems Are We Solving?
External Feedback

© 2018 SPLUNK INC.

Better MLTK
Greater user satisfaction

© 2018 SPLUNK INC.

 More usable and accessible by a larger number of users  More relevant for IT professionals, security analysts and business users alike

 More intention-based and guide a user through their specific workflow

Rethinking MLTK
Addressing user pain points

© 2018 SPLUNK INC.

Multifaceted Feedback

© 2018 SPLUNK INC.

Customers

Partners

Splunk Customer-Facing
Professionals

Prototype Feedback
What Our Users Are Saying...

© 2018 SPLUNK INC.

" It's nice to record stats for the same model, so that we find out what changes are there in the results after a new configuration."
­ Experiment History
­ Splunk Data Science Champion

" When expanding one experiment in the table, I want to see some more information about it, and would suggest a 2-column layout for better readability."
­ Experiment Summary Details
­ EMEA Sr. Sales Engineer

" I like having fast and prominent access to the experiment's alerts and scheduled training. Don't want to waste my time."
­ Experiment Alerts / Scheduled Training
­ Splunk Implementation Partner

© 2018 SPLUNK INC.
" Oh, this is nice! I definitely like the
visuals here. It really stands out when you try to look at each type of these
experiments."
Experiments Listing Page Splunk Customer, Content Developer

© 2018 SPLUNK INC.
MLTK Redefined
Introduction of Experiments

Introducing Experiments
It all comes together!

Experiment ABC

Preprocessing Model 1

Preprocessing Model 2

Model A

Alert 1

Experiment XYZ
Preprocessing Model 3

Preprocessing Model 4

Model B

Alert 2

© 2018 SPLUNK INC.
Scheduled Training
Alert 3

© 2018 SPLUNK INC.
Deep Dive
Detailed look at the implemented features

Experiment Type Selector

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
"It's great that I can annotate every model fit!"

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
"It's great that I can easily see a list of alerts for an experiment, and conditions and statistics about each alert."

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Splunk Demo
Experiment Management in action

Key Takeaways

© 2018 SPLUNK INC.
1. Experiment Management Listings Page
· Filter by the experiment type · View the experiment summary details · Initiate the actions one location
2. Alerts and Scheduled Training per an
experiment
3. Model annotation

© 2018 SPLUNK INC.
The latest release of Splunk Machine Learning Toolkit makes it significantly easier to process large amounts of data and find patterns to see what's right
or wrong. Splunk's continued evolution of the Experiment Management Framework, including new tools to help validate our machine learning models, streamlines the complicated process of operationalizing machine
learning.
Sundaresh Ramanathan, Director, IT Operations Analytics, Kinney Group, Inc.

Major Highlights
(since .conf 2017)

© 2018 SPLUNK INC.

Splunk Machine  Learning Toolkit
Updates
FN1429 - Using the  Splunk Machine
Learning Toolkit to Create Your Own Custom Models Thursday, Oct 04, 12:15  p.m. - 1:00 p.m.

Python for Scientific Computing 1.3 Update
FN1398 - Splunk and the Machine Learning
Toolkit in Action: Customer Use Cases
Wednesday, Oct 03, 12:45 p.m. - 1:30 p.m.

Splunk MLTK Connector for Apache
SparkTM

GitHub MLTK Community

FN1364 - Using Spark FN1409 - Extending

and MLLib for Large Splunk MLTK using

Scale Machine Learning GitHub Community

With Splunk Machine

Learning Toolkit

Thursday, Oct 04, 11:00 a.m. - 11:45 a.m.

Thursday, Oct 04, 11:00 a.m. - 11:45 a.m

Splunk MLTK Container for Tensor
Flow
FN1478 - Exciting, To-Be-Announced Platform Session
Wednesday, Oct 03, 4:30 p.m. - 5:15 p.m.

© 2018 SPLUNK INC.
Q&A
Harsh Keswani | Product Manager: Machine Learning Iryna Vogler | Sr. Principal UX Designer

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

