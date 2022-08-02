© 2018 SPLUNK INC.
Building Smart Factories
Process Monitoring and Machine Learning in the Sugar Industry
daniel.pal@ese.de janina.kropf@ese.de
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
Building Smart Factories:
Process Monitoring and Machine Learning in the Sugar Industry

Operational Divisions
 Rail Operations  Automotive Production  Manufacturing Industry
Range Of Services
 Software-Engineering  Testing & Verification  Assessment-Services  Data Analytics

© 2018 SPLUNK INC.

Hannover Braunschweig
Hildesheim

Berlin

Frankfurt

Erlangen

Sugar production process Slide
A brief overview
Slicer

© 2018 SPLUNK INC.

Raw material ­ sugar beet

wash

Centrifuge

Cosette mixer

Extraction tower

White sugar Refined sugar

Liming

Multistage evaporation

© 2018 SPLUNK INC.
Key optimizations in the centrifuge process
How Splunk can help

Increase sugar output Increase runs per day Avoid machine failures

Monitor Health Index of centrifuges
Find the best settings for centrifuge by using Splunk MLTK

How Centrifuging works
From Massecuite to White Sugar

© 2018 SPLUNK INC.

 The centrifuge is the most dynamic process in sugar industry
 Seperation of crystals from the syrup using strong centrifugal forces
 Syrup is pushed through sieve sleeve of the centrifugal drums
 Sugar is washed with steam to remove the remaining syrup

Use Case
Process Monitoring and Machine Learning in the Sugar Industry
 Monitor sugar production process · monitor machine data · outlier detection · build a glass table · increase your output

© 2018 SPLUNK INC.

Three steps to get the most out of industrial machine data
Let your assets speak!

© 2018 SPLUNK INC.

1 Data Onboarding
§ selection of technology § installation of technology § transmission architecture § connectivity provider

2 Using Splunk
§ analysis of the data
§ appropriate visualizations § application of machine
learning algorithms

3
Implementing Changes
§ integration in the customer`s systems
§ change of processes

Three steps to get the most out
of industrial machine data
Let your assets speak!

© 2018 SPLUNK INC.

1 Data Onboarding
§ selection of technology § installation of technology § transmission architecture § connectivity provider

2 Using Splunk
§ analysis of the data
§ appropriate visualizations § application of machine
learning algorithms

3
Implementing Changes
§ integration in the customer`s systems
§ change of processes

1. Data Onboarding
Setup for the Data Transfer

© 2018 SPLUNK INC.

PLC
PLC`s collect machine data
Data transmission via industrial standard protocols possible

Machine Gateway
Data Preprocessing Intermediate Storage Transmission to Server/Cloud

Splunk Data Onboarding
E.g. make use HTTP Event Collector

1. Data Onboarding
Protocols & Data Types: Most Common OPC UA + JSON
 Protocol: OPCUA  Data Format: JSON -> Structured Data  Indexing Data in Metric Store results in a Performance Boost

Field Names _time metric_name _value dimension1 dimension2

Field Values Measurement Time Measurement Measure Plant Centrifuge

© 2018 SPLUNK INC.

2. Using Splunk
Splunk Industrial Asset Intelligence
Glass Table for an Overview of the Sugar
Production Process

© 2018 SPLUNK INC.

2. Using Splunk
Splunk Enterprise Dashboard
Deep Dive into the Centrifuge's Health Status

© 2018 SPLUNK INC.

2. Using Splunk
Splunk Machine Learning Toolkit
Gain insights into the centrifuge's behavior

© 2018 SPLUNK INC.

Dependencies of the Measurements
Prediction of the Layer Thickness with Random Forest Algorithm
 Periodic behavior of the graphs

© 2018 SPLUNK INC.

 Explanation of layer thickness using four indicators

© 2018 SPLUNK INC.
Layer Thickness & Predicted Layer Thickness
Detect outliers
 Outliers by time
 Storage of "outlier situations`` for deeper analysis in summary index  Search for indicators in data as well as the production process  Improvement of machine operation

Benefits
Detection of failures before they appear Increase the uptime of the machines

© 2018 SPLUNK INC.

Remote monitoring of the factory`s status
Accelerate maintenance time, safe maintenance costs and increase the uptime of the machine

Figure out the optimal configuration of the machine Increase the output, shorten the cycle time

© 2018 SPLUNK INC.

Key Takeaways
Building Smart Factories

1. Use Splunk IAI to get a brief overview of
your process.
2. Every process can be optimized.
3. Start working proactively instead of
reactively.
4. Let your assets speak!

© 2018 SPLUNK INC.
Q&A
Janina Kropf | Data Analyst Daniel Pal | Data Analyst

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

