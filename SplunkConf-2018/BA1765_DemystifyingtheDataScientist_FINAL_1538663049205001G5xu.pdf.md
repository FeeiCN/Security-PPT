Demystifying the Data Scientist
A case study From BankID Norway
Thomas Hillesøy and Jørn Kristian Stensby, Sens Consulting AS Erik Larsen, BankID Norway AS
October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Speakers

© 2018 SPLUNK INC.

Jørn Kristian Stensby Senior Solution Architect

Thomas Hillesøy Senior Solution Architect

Erik Larsen Head of Operation

Agenda
Demystifying the data scientist

© 2018 SPLUNK INC.

 BankID Norway and their needs  Data collection  Data engineering  Data analysis  Q&A
"A data scientist is a person who has the knowledge and skills to conduct sophisticated and systematic analyses of data. A data scientist extracts insights from data sets for product development, and evaluates and identifies strategic opportunities."

FINANCIAL SERVICES
BankID

© 2018 SPLUNK INC.

WE ENSURE SAFE AND SECURE ONLINE IDENTIFICATION AND SIGNING

 BankID's goal: Secure digitalization of the society  84% of Norway's eligible population uses BankID  About 1.7 million transactions daily

 2018: Released new services
 Needed a way to aggregate billing transactions and have insights into the service

Our goals

© 2018 SPLUNK INC.

 Aggregate customer transaction statistics and ensure accuracy and reliability
 Give operational­ and business insights about the new services

How to get to data science?
Building data trust

© 2018 SPLUNK INC.

Learn/optimize Aggregate/label Explore/transform Move/store

AI, Deep learning A/B testing, experimentation, simple ML algorithms
Analytics, metrics, segments, aggregates, features, training data
Clean, anomaly detection, prep
Reliable data flow, infrastructure

Collect

Instrumentation, logging, sensors, external data, user generated content

The data science Hierarchy of needs

© 2018 SPLUNK INC.
Best practices for data analytics projects


Facilitate interdisciplinary
collaboration


Create short learning loops


Enable others

Data analysis


Explore together





Make data producers Get exposed to prod

become consumers

data early

Data engineering

Be use-case driven

Get new data right

Data collection

© 2018 SPLUNK INC.
Data Collection
Grab what you need, all the time

Where is our data?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Data collection ­ Data engineering ­ Data analysis

Be use-case driven

Getting new data right





 Have a set goal for what you want to achieve
 Start with only the necessary data sources

 Guide developers (data producers)  Requirements for creating logs  Build data trust  Normalize to your data model

© 2018 SPLUNK INC.
Data Engineering
Creating data trust

Starting with the basics

© 2018 SPLUNK INC.

Building a transaction

© 2018 SPLUNK INC.

Categorizing customer journeys

© 2018 SPLUNK INC.

Group events with same ID
Create customer journey hash ID

Collect fields specifying user
actions
Use a lookup to add information

Collecting customer journeys

© 2018 SPLUNK INC.

 Each night a scheduled search runs which gathers user transactions, categorizes them and collects them into a summary index
 Information extraction using the SI is faster and more uniform

Raw data

Summary Index

© 2018 SPLUNK INC.
Data collection ­ Data engineering ­ Data analysis
Explore together Make data producers Get exposed to become consumers prod data early







 Use commands such as correlate, transaction and cluster
 Balance reverse engineering and business domain knowledge

 Have developers actively use visualizations/alerts
 Be inviting and prioritize time to guide others
 Avoid getting dirty data

 Mind unexpected scenarios
 Don't overcomplicate searches
 Make sure the developers knows the necessity of a concise log format

© 2018 SPLUNK INC.
Data Analysis
Collaboration makes better

Extracting insights

 Data analysis is about reaching the top of the pyramid
 Using the scientific approach · Launching hypotheses · Qualitative study with interviews and
user observations
· Quantitative research using the data set

Learn /optimize Aggregate/label
Explore/transform
Move/store

Collect

© 2018 SPLUNK INC.

Customer journey analysis

© 2018 SPLUNK INC.

Customer journey analysis

© 2018 SPLUNK INC.

Customer journey analysis
Finding outliers in transaction time usage

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Data collection ­ Data engineering ­ Data analysis

Facilitate interdisciplinary Create short

collaboration

learning loops

Enable others







 Workshops with developers
 Present dashboards for HR and Sales

 Minimum viable product approach
 Include feedback as a topic in weekly meetings
 Information in the office space
 Scientific approach

 Make people from core business capable of doing analysis on their own data
 Splunk Fundamentals training

Closing Thoughts

© 2018 SPLUNK INC.
1. Data science is not magic 2. For everyone and every
organization with data
3. Keep the logic simple 4. A simple and flexible tool still
needs to be managed properly

© 2018 SPLUNK INC.
Q&A
Thomas Hillesøy | Solution Archtect Jørn Kristian Stensby | Solution Archtect
Erik Larsen | Head of Operations

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

Supporting material

© 2018 SPLUNK INC.
1. Articles
· https://hbr.org/2013/12/datas-credibility-problem · https://hbr.org/2013/01/why-it-fumbles-analytics · https://hbr.org/2018/03/what-happens-when-data-scientists-and-
designers-work-together
· https://hbr.org/2014/03/what-makes-big-data-projects-succeed
2. SPLs
· https://github.com/thilles/splunkconf2018

