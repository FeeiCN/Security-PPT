© 2018 SPLUNK INC.
Machine Learning & Natural Language Processing at BMW Group
October 2018

Our Speakers

© 2018 SPLUNK INC.

v

BOULOS EL-ASMAR
Data Scientist, BMW Group IT Innovation Lab

IMAN MAKAREMI
Principal Data Scientist, Splunk

DIPOCK DAS
Senior Director, Products, Splunk

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Introduction

Agenda

© 2018 SPLUNK INC.

1. The Goal of the Predictive Model 2. Procedure and Achievements in the Project 3. Implementing the Model with Splunk MLTK 4. Using the Model with Project Natural
Language Search 5. Project achievements 6. Future Objectives

BMW Group and Splunk

© 2018 SPLUNK INC.

Last State Call analytics platform
2014 Alerts, Dashboards, Reports

Driving mode classification

Manufacturing data

2016 MLTK

2017 Industrial Asset
Intelligence

Easy data querying
2018 Natural Language Search

What is BMW Group IT Innovation Lab?

© 2018 SPLUNK INC.

 Focusing on innovative use cases inside BMW Group
 Know-How in computer algorithms, data science and AI
 Close networking with the innovation departments at specialists area (Manufacturing, Logistics ...)
 Early adoption of new technologies, transfer to industry

© 2018 SPLUNK INC.
The Goal of the Predictive Model
Human-Centered Machine Learning

The goal of the Predictive Model

© 2018 SPLUNK INC.

 Overarching concept for all road users
· Predict trends of traffic patterns with the highest accuracy
possible
· Focus on challenges around urban mobility · Create action plans on making traffic in the future more
efficient
 For the individual user
· Prediction of ideal navigation and travel time · Allow to change route or timing to arrive at destination more
efficiently

© 2018 SPLUNK INC.
Procedure and Achievements

Data Collection

© 2018 SPLUNK INC.

Data from in-development test fleet provides insights on
commuting and mobility habits

Movements tracked over four weeks with data transmitted
in real-time to Splunk

Historical data about the month was used as the basis to train the model

Organising Data
 City of Munich is divided into cells  Traffic data defined features, in each cell,
gathered from the participants
· User departure time in hourly intervals · User arrival time in hourly intervals · GPS of departure and destination points · Road types · Waiting times · Weather · Accidents

© 2018 SPLUNK INC.

Build and Train a model

© 2018 SPLUNK INC.

 Algorithm:
· Non-linear Algorithm
· Random Forest Regressor  Through supervised learning, discrepancies were
adjusted in order to enhance the accuracy of predictions  A local search finds the most similar traffic state in the traffic history  Blends real-time traffic data with past traffic patterns to predict congestion and other traffic events

© 2018 SPLUNK INC.
Machine Learning @ Splunk

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

Forwarder

Alerts, Dashboards,
Reports

props.conf, transforms.conf, Data models, Splunkbase Summary Index Accelerated Reporting

Splunk Machine Learning Toolkit

Pivot, Table UI, SPL

Splunk Machine Learning Toolkit

Splunk Machine Learning Toolkit App

© 2018 SPLUNK INC.

 What is Splunkbase?
 What is the App?
 Where can I go to learn more?

© 2018 SPLUNK INC.
Splunk ML Advisory Program
Partners a Splunk Data Science Resource to Help Operationalize an ML Use Case
 Early Access to new and enhanced MLTK features
 Opportunity to shape the development of the product
 Assistance in operationalizing a production quality ML model

© 2018 SPLUNK INC.
Machine Learning @ BMW

Raw Data

© 2018 SPLUNK INC.

Data Preparation I - Summary Index

© 2018 SPLUNK INC.

Data Preparation II - PrepStuff
A new preprocessing algorithm for the use case

© 2018 SPLUNK INC.

Nightly Model Training
 Nonlinear Algorithm · Random Forest Regressor
 Historical Data · 8 days, 1 month, etc
 Model's Output · Demand
 Model's Input · Latitude, Longitude, Features of Time

© 2018 SPLUNK INC.

Fitting Random Forest

© 2018 SPLUNK INC.

Fitting Random Forest

© 2018 SPLUNK INC.

Fitting Random Forest

© 2018 SPLUNK INC.

Applying Random Forest

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Project Natural Language
Search @ BMW

© 2018 SPLUNK INC.
What is Project Natural Language Search?
A natural language platform for machine data that delivers Natural Language Search, Understanding and Generation for Splunk and SQL data.

Natural Language
Search

Communicate instantly in charts,
text and voice

Access anywhere with type, touch,
voice

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Traffic Prediction Data Model and Ontology set up

data model

semantic model

What we wanted to achieve with Project NLS

© 2018 SPLUNK INC.
1. Allow non-technical people to ask
questions of data in Splunk
2. Use the Traffic Prediction Machine
Learning models and generated results
3. Ask the question
"what is the predicted traffic at point X on date Y at time Z?"

© 2018 SPLUNK INC.
Demo

Project Achievements

© 2018 SPLUNK INC.

Predicting hourly, daily, seasonal trends in Munich traffic

Live monitoring on the map of car pick-up events

Live monitoring of public transport coverage gaps

© 2018 SPLUNK INC.
Future Objectives
Expanding the Model

Future Objectives

© 2018 SPLUNK INC.

 Appropriate reaction after accidents, which cannot be predicted.
· Once an accident has occurred, the gridlock follows predictable
patterns  Include more data from individual users:
· Using GPS data from single users' smartphones, the software learns
your preferred travel times and routes
· Include user satisfaction: query satisfaction data through an app · Predict anomalies like vacation days
 It leads to more insights and to making more accurate and user-centric predictions

© 2018 SPLUNK INC.

Other sessions

Spreading the Word: How Chat and Voice Is Transforming Splunk in Retail AI Ops (FN1572)
How we use machine learning in Project Natural Language Search - a Natural Language Platform (FN1629)
Ask Splunk! Using natural language, voice and chat with Splunk Project Natural Language Search (FN1615)

4:30 today 11:00 tomorrow 12:15 tomorrow

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

