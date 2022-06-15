How we use machine learning in Project Natural Language Search
August 2018 | Version 1.0

© 2018 SPLUNK INC.

Our Speakers

© 2018 SPLUNK INC.

v

DIPOCK DAS
Senior Director, Products, Splunk

AUNGON NAG RADON
Data Scientist, Splunk

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.

What you will learn today

Machine learning can be used to solve many different problems.
We will show you examples of applied machine learning in Project Natural Language Search.
We will walk through high level examples before diving into one example in depth.

© 2018 SPLUNK INC.
Introduction

What is Project Natural Language Search?
Project Natural Language Search is a natural language platform for machine data that delivers Natural Language Search, Understanding and Generation for Splunk and SQL data.

© 2018 SPLUNK INC.

Natural Language Search

Communicate instantly in charts, text and speech

Access anywhere with type, touch, voice

Demo

© 2018 SPLUNK INC.

Insert your own screenshot here. For best results, use an image sized at 1450 x 850

Overview of Machine Learning in Project Natural Language Search
 Natural Language Understanding  Visual Interface Determination  Data Driven Drill Downs  Handling Ambiguity  Natural Language Speech Recognition  Search Query Recommendation

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Project NLS: Natural Language
Understanding

What is Natural Language Understanding?
 Understand the intent behind a textual query  NLU is a hard AI problem!

© 2018 SPLUNK INC.

show me daily sales of

cappuccino in

Vancouver last 10 days

verb

pronoun adjective plural

preposition singular noun

predicate

clause

subject

subject

time grain sales data

product data

preposition singular noun clause cities

value plural
clause
time range from now

Intent: {sum} {sales} {product} {timegrain} {city} {time range}

Project NLS turns Intents into SPL (or SQL)

© 2018 SPLUNK INC.

Intent: {sum} {sales} {product} {timegrain} {city} {time range}
SUM sales BY Day WHERE Product = Cappuccino, AND
City IN Vancouver, San Francisco, San Jose,
AND timerange is (today minus 10 days) to today

| tstats allow_old_summaries=t summariesonly=t SUM("All_Sales.grossSales") AS "All_Sales.grossSales" FROM datamodel=Retail.All_Sales WHERE ((("All_Sales.productName"="cappuccino") AND ("All_Sales.city" IN ("vancouver","san francisco","san jose"))) AND ((earliest=1533427200) AND(latest=1534291199))) BY "All_Sales.city" _time span=1d | eval All_Sales__time_date=strftime(_time, "%Y-%m-%d") | table All_Sales__time_date "All_Sales.city" "All_Sales.grossSales" | sort 150 "All_Sales.grossSales" DESC, All_Sales__time_date DESC, "All_Sales.city" DESC

© 2018 SPLUNK INC.
Project NLS machine learning obliterates hard coded rules systems
Show me daily sales for San Francisco in September What were daily sales in SF last month
Display the Vancouver store gross sales for the last 30 days by day Get me San Jose takings for the last four weeks by day
Natural Language Search NLP
sales, city, time period, time grain

Model Driven Natural Language Understanding

© 2018 SPLUNK INC.

Datamodel

Semantic Model

Trained Models

Natural Language Processing Pipeline

© 2018 SPLUNK INC.

Parse Query

Generate

Execute

Analyze

Communicate

Query Processor
Tags, Tokenizer Extract Info
Syntax, Grammar Disambiguation Recommendations

Query Generator
Decision Engine Semantic Query
DSL Query

Query Executor
SPL or SQL

Story Builder
Results processor User context
User preference Chart generation Natural Language Text

Visualisation
Ranked Visualisations List of visualizations Recommendations
Delivery

Ontology

Search Model (entities, relationships, synonyms, common names ) Intent, Statement, Responses, User Profiles, Knowledge Graph, ML Models, Templates

© 2018 SPLUNK INC.
Project NLS: Handling Ambiguity

Natural Language search machine learning disambiguates a query
Top 5 products
Natural Language Search NLP
Top 5 products by sales Top 5 products by location Top 5 products by quantity Top 5 products by sugar content

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Project NLS: Visual Interface
Determination

What's wrong with User Interface Design?

© 2018 SPLUNK INC.

 We can do better than sort alphabetically..  Afghanistan - 0.48% of World's population  Default using browser getCurrentPosition()?

 Why not predict top 5 by signups?

United States

45%

United Kingdom

28%

Canada

16%

Australia

5%

India

2%

Rest of World listed alphabetically

Using ML to display the right chart for the result

© 2018 SPLUNK INC.

"daily sales of cappuccino in Vancouver, San Francisco and San Jose last 10 days"

How ML Improves Visual Interface Determination © 2018 SPLUNK INC.

Vancouver: 234, 350, 500, 523 .. San Francisco: 845, 820, 650, 723 ..

 Learn from past interactions  Recommend a ranked list of
charts to user for a given query  Incorporate user's preference

Natural Language Search NLP

What is Data Driven Drill Path?

© 2018 SPLUNK INC.

Recommend drill path navigation in a selected visualization based on learned preference
Sales by Country

Learns user's preferred navigation path in a chart type

Natural Language Search NLP

Capture preference change over time!

Sales by City Sales by State Sales by Product

© 2018 SPLUNK INC.
Project NLS: Natural Language Speech Recognition

Natural Language Speech Recognition

© 2018 SPLUNK INC.

 The User asks a question using a voice enabled device (VTT)
 The User gets an answer from the device (TTS)

NLU reduces the burden of skill building for so many scenarios© 2018 SPLUNK INC.

Trained skill

Data set

Trained skill

Data set

The current method for building speech (and chatbot) apps is to encode all the possible questions someone might ask.

Project NLS support for Voice enabled devices

Voice Device + Cloud

Project Natural Language Search

© 2018 SPLUNK INC.

Acoustic model

General Language
Model

Intent processor

Learning Engine

Search Model

Story builder

SQL

Automatic Speech Recognition (ASR)

Natural Language Processing (Query, Understanding, Results)

Data source

© 2018 SPLUNK INC.
Project NLS: Search Query Recommendation

Search Query Recommendation

© 2018 SPLUNK INC.

Trending Search Recommendation:  Recommend top N search queries to user
Relevant Query Recommendation:  Recommend top N search queries relevant to a
selected search query

© 2018 SPLUNK INC.
Demo

© 2018 SPLUNK INC.
Project NLS: Machine Learning
Deep Dive

© 2018 SPLUNK INC.
Natural Language Search Machine Learning Architecture
Natural Language REST API

Natural Language Understanding

Natural Language Generation

Drill Path Navigation

Visual Interface Recommendation

Query Disambiguation

Trending Search Recommendation

Relevant Query Recommendation

Compute (Spark Cluster) Model and State Persistence (HDFS)

© 2018 SPLUNK INC.
Deep Dive: Trending Search Recommendation

Collaborative Filtering
make automatic predictions (filtering) about the interests of a user by collecting preference information from many users (collaborating)

© 2018 SPLUNK INC.

daily sales in seattle last month?

daily sales last week in london? how much espresso sold in vancouver? daily sales in san francisco last month?

daily sales in vancouver last week?

how much espresso sold in seattle? -?-
how much spicy chai sold in vancouver?
daily sales in san francisco last week?

in this case we observe the questions users ask about stores in specific city locations

Collaborative Filtering

© 2018 SPLUNK INC.

Purple asked questions about Seattle and not London
Pink asked questions about San Francisco and Seattle
Green asked questions about San Francisco, Seattle and not London





Purple and Pink have asked

the same questions as Green







 for matching location.







 Based on the match, Green is

not likely to ask questions

about Vancouver

 ? 



© 2018 SPLUNK INC.
Trending Search Recommendation with Collaborative Filtering
Why was the Recommendations List updated?

Machine Learning Module Components

© 2018 SPLUNK INC.

Trending Search Recommendation REST API

Ratings Generator

Model Builder Machine Learning Components

Predictor

Compute (Spark Cluster) Model and State Persistence (HDFS)

Model Persistence per customer per workspace ©2018SPLUNKINC.

Org 1 Org 2 Org 3 Org n

Workspace 1 Workspace 2 Workspace 1 Workspace 2 Workspace 1 Workspace 2 Workspace n Workspace n

Best Model Best Model Best Model Best Model Best Model Best Model Best Model Best Model

© 2018 SPLUNK INC.
Deep Dive: Relevant Query Recommendation

How Do We Recommend Relevant Queries?  Clustering (Unsupervised ML Technique)

© 2018 SPLUNK INC.

Example of Clustered Queries
Show me sales last week
Trained Model
Show me sales in SF last week Show me sales in California last year Show me sales in 2017 vs 2016 in California

© 2018 SPLUNK INC.

Architecture

Relevant Query Recommendation REST API

Model Builder

Predictor

Machine Learning Components

Compute (Spark Cluster) Model and State Persistence (HDFS)

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Demo

© 2018 SPLUNK INC.

Where next?

1. More user interface driven ML!
2. Sequence to sequence prediction - predict Next Query for Dialog based interaction
3. Federated learning - sharing trained models (not data) to help everyone

Key Takeaway

© 2018 SPLUNK INC.
Machine learning can be used to solve a myriad of problems.
We have shown you production examples of machine learning used to improve the usability of an application.
You can use the same techniques in your daily work to accomplish similar
results.

Next steps

© 2018 SPLUNK INC.
 Get Project Natural Language Search
· Dipock Das - dipock@splunk.com
· Melissa Gannes -
mgannes@splunk.com
 Get the MLTK  Get on the ML Advisory program
· Work with your Rep
· https://www.splunk.com/en_us/software/
splunk-enterprise/machinelearning.html#MLTK-FAQ

Other sessions

© 2018 SPLUNK INC.

Machine Learning & Natural Language Processing at BMW (FN1199)

11:30 yesterday

Spreading the Word: How Chat and Voice Is Transforming Splunk in Retail AI Ops (FN1572)

4:30 yesterday

Ask Splunk! Using natural language, voice and chat with Project Natural Language Search (FN1615)

12:15 today

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

