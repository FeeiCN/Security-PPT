TransUnion and a Time Traveling DeLorean
MTTR Fading Like Marty McFly
Steve Koelpin, TransUnion and Splunk Trust MVP Andrew Stein, Splunk Principal PM for Machine Learning
Oct 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Steve Koelpin
Lead Splunk Engineer Splunk Trust MVP New Dad
Winner of the Splunk Answers Karma Contest

© 2018 SPLUNK INC.

Andrew Stein
Splunk Principal Product Manager, Machine Learning
· 18 years creating mathematically modeled solutions as a data scientist
· I spend 80% of time preparing data and 20% of time complaining about the need to prepare data

© 2018 SPLUNK INC.

Agenda
· TransUnion and Splunk · Why Use Machine Learning? · TransUnion and ITSI · TransUnion and ITSI + MLTK
· How It Works · Training the Model · Applying the Model · Challenges in Predictive Analytics · Pro Tips · Bring This to Your Organization

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
TransUnion and Splunk
Information for Good

© 2018 SPLUNK INC.

TransUnion and Splunk

Hundreds of daily users

Several core Splunkers

Casual users to certified
consultants

TransUnion and Data
TransUnion is a BIG Data and Information Solutions Company
Founded as a Credit Bureau in 1968
We See Data Differently ­ Not for What it is ­ But for What it Can Help
PeoTplreaAnccsomUpnlisihon Is a DataThis VFieowc­uThseeInddiCvidouamls pfoar Wnhyom
we Steward and Protect Information
We Call this Information For Good

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Why Use Machine Learning?
Problems Machine Learning Solves

Getting Answers From Your Data

Anomaly Detection

Predictive Analytics

Clustering

© 2018 SPLUNK INC.

· Deviation from past behavior · Deviation from peers · Unusual changes in features · ITSI MAD Anomaly Detection

· Predicting ServiceHealthScore
· Predicting churn · Predicting events · Trend forecasting · Detecting influencing entities · Imminent outage prediction · ITSI Predictive Analytics

· Identify peer groups · Event correlation · Reduce alert noise · Behavioral analytics · ITSI Event Analytics

The Cost of an Incident

© 2018 SPLUNK INC.

Line of Revenue

Customer Satisfaction

Brand Reputation

$105,302
= the mean business cost of an IT incident

*According to "Damage Control: The Impact of Critical IT Incidents"
https://www.splunk.com/en_us/form/damage-control-the-impact-of-critical-it-incidents.html

© 2018 SPLUNK INC.
Reduce Your Technical Debt with Machine Learning

 Correlate dozens of KPIs against data in the past

 No more tribal Knowledge

 Have machine learning do the leg
work

© 2018 SPLUNK INC.
TransUnion and ITSI
IT Service Intelligence

TransUnion and ITSI
Glass Table View of Application Pipeline

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
What Was the Investment to Build the Solution?
Two months

MOST TIME-CONSUMING TASKS

· Understanding
effective KPIs

· Getting
information from other BUs

· Developing a
workflow

· Applying
thresholds

Saturday

Sunday

Monday

Tuesday

Wednesday

Thursday

Friday

© 2018 SPLUNK INC.
How Does ITSI Tie Into Predicting Incidents?
· ITSI gives us the ability to take multiple KPIs and tie them into a single health score
· Apply adaptive thresholding to cyclic-type data patterns
· Faster time to value

© 2018 SPLUNK INC.
TransUnion and the MLTK
Splunk Advisory Program

What Is the ML Advisory Program?

© 2018 SPLUNK INC.

Provides customers with Splunk data science resources to help operationalize a specific ML use case

· Early access to new and enhanced MLTK features
· Opportunity to shape the development of the product
· Assistance in operationalizing a production-quality ML model

ML Advisory Customers

© 2018 SPLUNK INC.

TransUnion and Machine Learning
Anomaly Detection

© 2018 SPLUNK INC.

NORMAL DAY

TransUnion and Machine Learning
Predictive Analytics

© 2018 SPLUNK INC.

NON-NORMAL DAY

Investment to Build the Solution
Three months
MOST TIME-CONSUMING TASKS: Obtaining clean quality data Identifying features
Backfilling service health score

Time Percentage

© 2018 SPLUNK INC.

How Much Effort Does ITSI Save You?
Time + Effort for One Use Case

Just MLTK

ITSI + MLTK

ITSI 4.0

+

© 2018 SPLUNK INC.

· Two engagements with the Splunk ML Advisory Program
· 100+ hours of work over 3 months
· 10+ hours of Webex · Multiple business rules

· Leveraged the ITSI and Sophisticated Machine Learning Blog
· 30 hours + 1 hour Webex
· Everything else was customizing

· ITSI 4.0 now includes this as a turn key feature
· Saves a TON of time getting to an outcome

© 2018 SPLUNK INC.
How It Works
Predictive Analytics

Types of Incidents
Two Incident Types

© 2018 SPLUNK INC.

Steady-State Incidents

An Incident Due to a Change

Predictive Analytics Explained
Create a ServiceHealthScoreFromFuture: Read the Blog

© 2018 SPLUNK INC.

https://www.splunk.com/blog/2017/08/28/itsi-and-sophisticated-machine-learning.html

Predictive Analytics Explained
Create a ServiceHealthScore From the Future
· Determine which features have a tight mathematical relationship with the ServiceHealthScore
· Use the ITSI deep dive view to
identify which KPIs started to degrade before the incident occurs
· Strong leading indicators make
excellent features which improve accuracy

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Training the Model
Predictive Analytics

© 2018 SPLUNK INC.
Grandfather Paradox: Don't Use the Future to Predict the Future
Don't use ServiceHealthScore from the future as your predictor

© 2018 SPLUNK INC.
Applying the Model
The Analysis

Predictive Analytics
The Analysis

© 2018 SPLUNK INC.

Change those string values to numeric for easy visualization

Predictive Analytics
The Analysis
Add boundary lines for easy identification

© 2018 SPLUNK INC.

Predictive Analytics
The Analysis

© 2018 SPLUNK INC.

Test against ServiceHealthScoreFromFuture rather than ServiceHealthScore so you don't have to offset the times in your head

© 2018 SPLUNK INC.
Challenges In Predictive Analytics
Challenges

Challenges We Faced

© 2018 SPLUNK INC.

Lots of quality data needed

Slow search speed for large amounts of data

Any minor changes to a KPI
requires a new backfill

Dirty data is bad -- use adaptive
thresholding wisely

Challenges: Accuracy
DIALING IN THE ACCURACY AND FILTERING OUT THE NOISE
· THIS CAN BE SOLVED BY · Training on a larger set of data · Ensuring clean quality data · Visually exploring the data


© 2018 SPLUNK INC.

Challenges
Backfilling the ServiceHealthScore

© 2018 SPLUNK INC.

Any time you add or modify a KPI, it does not retroactively change the ServiceHealthScore
· Change a KPI and you must wait 30 days before having enough quality data to train on
Add a KPI to a service -- you must wait to get more runtime until that KPI shows its mathematical relationship with the ServiceHealthScore
· Why not just create a new service with existing/new KPIs and backfill?

ServiceHealthScore Does Not Backfill

Challenges: Custom Predictive Analytics
Backfilling the ServiceHealthScore Through SPL

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Pro Tips
Predictive Analytics

Customer ML Tips and Tricks
Pro Tips From the Splunk Trust

© 2018 SPLUNK INC.

Version each model you create

Make sure your Service Health Score is aligned with
known incidents

Ensure thresholds are set properly in
ITSI

Validate that regular
expressions are capturing correct values

Make your KPIs as
granular as possible

© 2018 SPLUNK INC.
Bring This to Your Organization
Where Do I Start?

© 2018 SPLUNK INC.
How to Get Started With Custom Predictive Analytics

Use ITSI to build a top-level view of your most critical services to understand the input variables needed.
Aggregate indicators into a single Service Health Score.
Use these KPIs to train your models.

Select several KPIs with good runtime and create a backfilled Service Health Score.
Align that Service Health Score against known incidents to test effectiveness.
Train a model and experiment with different algorithms.

Use the MLTK to get feedback about the models you train.
Understand the difference between algorithms.

Use the Service Health Score calculation and search for a score lower than 60%.
Run this over the last six months to pinpoint your larger incidents with day and time.
Create a report so you can use it to go back and identify incidents.

Test your models against known incidents.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Thank You! Questions?
Don't forget to rate this session in the .conf18 mobile app

