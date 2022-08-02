Machine Learning and IoT Use Cases
Nikolas Kourtidis | Senior Partner Sales Engineer Philipp Drieger | Staff Machine Learning Architect niko@splunk.com and philipp@splunk.com
October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

About us

© 2018 SPLUNK INC.

v

PHILIPP DRIEGER
Staff Machine Learning Architect philipp@splunk.com

NIKO KOURTIDES
Senior Partner Sales Engineer niko@splunk.com

Agenda
 IoT and Machine Learning Use Cases Overview  Quick Intro in Machine Learning and MLTK Demo  Customer Success Stories
· DB Cargo Predictive Maintenance · BMW Car Sharing Demand Prediction · Continental Industrial Production Optimization · Zeppelin Power Systems Predictive Maintenance
· Deep dive into project (data onboarding and ML)  Wrap up

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
IoT and Machine Learning Use Cases

Think IoT from Use Cases

© 2018 SPLUNK INC.

BMW

© 2018 SPLUNK INC.
Operationalize Machine Learning

Industrial Assets
Consumer and Mobile Devices
OT
IT

Continuous Data Ingest at Scale

© 2018 SPLUNK INC.

Industrial Data SCADA, AMI, Meter Reads
Native Inputs
TCP, UDP, Logs, Scripts, Wire, Mobile

Engineers

Data Analysts

Security Analysts

Business Users

Search Alert

Visualize Predict Develop

Modular Inputs
MQTT, AMQP, COAP, REST, JMS

Real Time

HTTP Event Collector
Token Authenticated Events
Technology Partnerships
Kepware, AWS IoT, Cisco, Palo Alto

External Lookups/Enrichment

Asset Info

Maintenance Info

Data Stores

Industrial Assets

Sense and Respond
Every Search Can Use Machine Learning

Consumer and Mobile Devices
OT

Real Time

Search

Alert

IT

© 2018 SPLUNK INC.

Flash lights

Email

Send an email

Tickets
Third-Party Applications

File a ticket
Trigger process flow

Smartphones and Devices

Send a text

© 2018 SPLUNK INC.
Splunk Customers Want Answers from their Data

Anomaly detection

Predictive Analytics

Clustering

 Deviation from past behavior  Deviation from peers  (aka Multivariate AD or Cohesive AD)  Unusual change in features  ITSI MAD Anomaly Detection

 Predict Service Health Score  Predicting Events  Trend Forecasting  Detecting influencing entities  Early warning of failure ­
predictive maintenance

 Identify peer groups  Event Correlation  Reduce alert noise  Behavioral Analytics  ITSI Event Analytics

Types of Machine Learning

© 2018 SPLUNK INC.

 Supervised Learning (labeled data)
· regression
· classification

 Unsupervised Learning (unlabled data)
· clustering
· anomaly detection

 Mixed Models (with Reinforcement or Feedback)
· human in the loop
· autonomous systems

Types of Machine Learning
In context of IoT

© 2018 SPLUNK INC.

 Supervised Learning
· Build a model on
sensor data with labels from known outages
· Build regression
models that reflect "normal" behavior and detect strong residuals as anomalies

 Unsupervised Learning (unlabled data)
· Build a model to
cluster process steps
· Generate labels with
clustering for supervised learning
· Detect strong signal
deviations as anomalies

 Mixed Models (with Reinforcement or Feedback)
· Present model
predictions to domain experts and incorporate feedback into next model trainings
· Stack multiple
models and apply 2nd order ML

Skill Areas for Machine Learning

© 2018 SPLUNK INC.

Premium solutions provide out of the box ML capabilities.
ITSI, UBA

Domain Expertise
(IT, Security, IoT...)

· Identify use cases · Drive decisions · Understanding of business impact

· Searching · Reporting · Alerting · Workflow

MLTK

Splunk Expertise

Data Science Expertise

Splunk ML Toolkit facilitates and simplifies via examples & guidance
· Statistics/math background

· Algorithm selection

· Model building

© 2018 SPLUNK INC.
Customer Use Cases
https://www.splunk.com/blog/2018/04/25/operational -intelligence-manufactured-in-germany-splunklive2018-events-in-germany.html

© 2018 SPLUNK INC.
Find and fix errors fast 2000 trains connected in 2019 over 16 types Root cause analysis, Operational Intelligence Fleet Management, Predictive Maintenance
http://conf.splunk.com/files/2016/slides/internet-of-big-rolling-things-at-db-cargos-european-rolling-stock-increased-customer-satisfaction-through-higher-availability-and-reliability.pdf

BMW car sharing
· Use MLTK to predict car sharing demand forecast
· Reflect seasonal and daily trends

© 2018 SPLUNK INC.
MLTK
· Non linear algorithm: RandomForest
· Input : lat / lon / time · Output : car demand

https://www.slideshare.net/Splunk/splunklive-munich-2018-car-sharing-fleet-demand-bmw

© 2018 SPLUNK INC.
SMD Production Line Optimization
???
https://www.slideshare.net/Splunk/splunklive-frankfurt-2017-continental

© 2018 SPLUNK INC.
Predictive Maintenance in Power Plants
· Goal: Ensure uptime and availability to 100 % for 70 power plants
· Reactive to proactive mode with Machine Learning
https://www.slideshare.net/Splunk/splunklive-munich-2018-use-casezndkerze-zeppelin

How raw data looked like

© 2018 SPLUNK INC.

[1=WinAC.AVHistory,155] PL1000-40313;Motorlast;%;0;0,1;0;0;0;1;0;0;0;0;0;0; 0000-0021:03D4 03DE 03DE 03E8 03E8 03D4 03E8 03D4 03FC 03E8 03E8 03E8 03FC 03F2 0406 03D4 03D4 03DE 03F2 03CA 03E8
[2=WinAC.AVHistory,141] PL1000-40297;Zündspannung Zyl. 2 (linke Bank);%;0;1;0;0;0;0;0;0;0;0;0;0; 0000-0021:0047 0047 0046 0047 004A 0046 0048 0045 0047 0047 0046 0049 0047 0046 0048 0045 0047 0048 0045 0046 0048 0046 ... ... ... [200=WinAC.AVHistory,42] PL1000-40575;Brennstoffmassenstrom;kg/h;0;0,1;0;0;0;1;0;0;0;0;0;0; 0000-0021:0E41 0E26 0E3C 0E51 0E51 0E50 0E42 0E39 0E3D 0E48 0E51 0E33 0E2F 0E4A 0E48 0E3A 0E31 0E48 0E4D 0E2F 0E26

https://www.slideshare.net/Splunk/splunklive-munich-2018-use-casezndkerze-zeppelin

How raw data looked like

© 2018 SPLUNK INC.

[1=WinAC.AVHistory,155] PL1000-40313;Motorlast;%;0;0,1;0;0;0;1;0;0;0;0;0;0;
0000-0021:03D4 03DE 03DE 03E8 03E8 03D4 03E8 03D4 03FC 03E8 03E8 03E8 03FC 03F2 0406 03D4 03D4 03DE 03F2 03CA 03E8
03F2 03D2 03E8

[2=WinAC.AVHistory,141]

PL1000-40297;Zündspannung Zyl. 2 (linke Bank);%;0;1;0;0;0;0;0;0;0;0;0;0;

0000-0021:0047 0047 0046 0047 004A 0046 0048 0045 0047 0047 0046 0049 0047 0046 0048 0045 0047 0048 0045 0046

0048 0046

... ...

0045 0048 0046

...

[200=WinAC.AVHistory,42]

PL1000-40575;Brennstoffmassenstrom;kg/h;0;0,1;0;0;0;1;0;0;0;0;0;0;

0000-0021:0E41 0E26 0E3C 0E51 0E51 0E50 0E42 0E39 0E3D 0E48 0E51 0E33 0E2F 0E4A 0E48 0E3A 0E31 0E48 0E4D

0E2F 0E26

0E33 0E50 0E39

Metric Unit Value

Wert für Minute 22 Wert für Minute 23 Wert für Minute 24

https://www.slideshare.net/Splunk/splunklive-munich-2018-use-casezndkerze-zeppelin

Unsupervised Approach 1:
index=motor | timechart max(voltage) by cylinder | fit KMeans k=1 *
Unsupervised Approach 2:
| gentimes start=-30 increment=3h | map search=" search index=motor | fields voltage ... | anomalydetection | eval time=$starthuman$, start = $starttime$, end = $endtime$" | collect index=anomalies

Deep dive
A bit pseudo SPL

© 2018 SPLUNK INC.
Supervised Approach 1:
 Use outages as labels  Multiply labels as declining risk
score before outage  Train either categorical
prediction model (target risk score as step function) or train numerical prediction (target risk score as numeric value)
Ensemble for the end game : Combination of multiple approaches give the final signal

© 2018 SPLUNK INC.
Predictive Maintenance Project: lessons learnt
Workflow and achieved project milestones

Decision for :

Data prep

Domain expertise Modelling

Piloting

Stakeholders decisions aligned

Data collection and Engineers and

preparation

domain expertise

TePxrtoject scoped Text

mid 2017

Create and evaluate 4 models
Results verified by business

 EDA + Domain Knowledge is key

Textfall 2017

· 70% data prep, cleaning, transformation etc.

· Consultation of engineers and service technicians

 Effectively 3 days to evaluate 4 modelling approaches

 Quick agile iterations with the customer

Tailor custom dashboards
Continuous feedback
Work, verify and collect feedback
Text 2018

Success Formula for the Zündkerze!

© 2018 SPLUNK INC.

· Data onboarding · SPL for data
transformation · Dashboarding and
Alerting

Business Stakeholders,
Engineers, Technicians

· Identify saving potentials · Proactive handling of outages · In depth understanding of the power
generator physics

MLTK

Splunk

Data

Champion / Partner

Science Expertise

Splunk ML Toolkit helped to quickly glue collaborative modelling efforts together!
· Statistics/math background · Algorithm selection · Model building

© 2018 SPLUNK INC.
"Employing the model developed with the MLTK we have been able to identify
the early detection of 5 - 7 failures per system leading to approximate savings
of 150,000 per year."
Rene Ahlgrim, Data Science Manager Zeppelin Powersystems

© 2018 SPLUNK INC.
Wrap up

Wrap up

© 2018 SPLUNK INC.
· Where to start?
Take a clear defined business challenge and get started with a simple, limited scope and expand from there
· Data journey:
Data, EDA, Modeling, Operationationalize, Complexity.
· Domain Expertise is crucial

Wrap up

© 2018 SPLUNK INC.
· Get support:
Leverage internal data science departments or Splunk or Splunk Partner (ML Advisory)
· Use the metrics store:
IoT data mostly comes in perfect shape for metrics store. Accelerate your analytics
· No fear:
many IoT data sets are not far from IT ones: Metrics of CPU, Mem etc. / Events of Outages
· Get started!

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

