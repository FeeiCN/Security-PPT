Defeating the Curse of "First Time" Events
Ignacio Bermudez Corrales | Security Data Scientist @SplunkUBA icorrales@splunk.com
May 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.
What are "First Time Events"
And why we should care about them

Machine Accesses
Do all first time accesses look suspicious?

© 2018 SPLUNK INC.

Historical Accesses

First Time Accesses

Normal Operations?

Suspicious Accesses?

© 2018 SPLUNK INC.
Other Examples of First Time Events in Real Life
Some are normal, some can be risky
 Cloud Storage File-sharing · Employee is planning to leave the company and downloads some unprotected sensitive files · A newly made presentation is shared for review among some group of employees
 Private Code Repositories · An account is compromised and cloned projects with intellectual property · Cloned project made by a colleague that I'm planning to collaborate on
 Badge Accesses · A worker enters the office servers room during off work hours · Same worker enters some other campus' meeting room during a business trip

A Needle in a Haystack
The risk of first time events
 Normal operations trigger a "sea" of first time events
 Collecting evidence for suspicious activity may take too long
 Suspicious activity can happen only once

© 2018 SPLUNK INC.

Solution?
First time event handling

© 2018 SPLUNK INC.

Conservative

Relaxed

Rules

Machine Learning

All first time events are interesting and worth investigating

First time events are not interesting

Low coverage, high precision

Finds the subtle, but learns
exclusively from evidence

© 2018 SPLUNK INC.
Let's Play with Numbers
Foundations

Representation of the Problem
So a machine learning algorithm can learn

© 2018 SPLUNK INC.

Analogous Representations

11 11 1 11 111 1

Machine Learning Generalizes
Filling the gaps

© 2018 SPLUNK INC.

Historical Data - Evidence

ML Reconstruction of Data

11 11 1 11 111 1
ML generalization capabilities allow Predictions of First Time Events

1 1 0.8 0.1 0.1 0.1 0.1 0.8 1 1 0.1 0.1 0.1 0.1 0.8 0.8 1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 1 0.8 0.8 0.5 0.5 0.5 0.8 1 1 1 0.1 0.1 0.1 0.5 0.8 0.8 1

Suspicious

Benign

How Data is Reconstructed
Latent factor models

© 2018 SPLUNK INC.

User Latent Factors (u)

Machine Latent Factors (m)
1 1 0.8 0.1 0.1 0.1 0.1 0.8 1 1 0.1 0.1 0.1 0.1 0.8 0.8 1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 1 0.8 0.8 0.5 0.5 0.5 0.8 1 1 1 0.1 0.1 0.1 0.5 0.8 0.8 1
 ,  = . 
Evaluation function

Latent factors (u, m) are real valued vectors which encode behavior and properties, that evaluated with a function allow reconstruction of the evidence.
Netflix's recommendation system
Latent factors may be indicators of Of age, income, gender of watchers; And for movies the genre, duration, release date

Taming ML with Rules
Passing down knowledge to machine learning algorithm

© 2018 SPLUNK INC.

Synthetic Generated Events

Coverage of Rules

Rules if(event == condition)

1 1

1100

0

1

0

1

Connecting Dots
Tamed machine learning embeds knowledge from rules and evidence

© 2018 SPLUNK INC.

Historical Data + Rules

ML Reconstruction of Data

11

1

11

1

1100

0

111

0

11

1 1 0.8 0.1 0.5 0.8 0.5 0.8 1 1 0.1 0.5 0.5 0.5 0.5 0.5 1 0.1 0.1 0.1 0.1 0.1 0.1 0.5 1 1 0.1 0.1 0.1 0.1 0.5 0.8 1 1 1 0.1 0.1 0.5 0.5 0.8 0.8 1

Connecting Dots
Richer predictive model can describe more complexities

Before

After

© 2018 SPLUNK INC.

1 1 0.8 0.1 0.1 0.1 0.1 0.8 1 1 0.1 0.1 0.1 0.1 0.8 0.8 1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 1 0.8 0.8 0.5 0.5 0.5 0.8 1 1 1 0.1 0.1 0.1 0.5 0.8 0.8 1
Just evidence

1 1 0.8 0.1 0.5 0.8 0.5 0.8 1 1 0.1 0.5 0.5 0.5 0.5 0.5 1 0.1 0.1 0.1 0.1 0.1 0.1 0.5 1 1 0.1 0.1 0.1 0.1 0.5 0.8 1 1 1 0.1 0.1 0.5 0.5 0.8 0.8 1
Rules + Evidence

© 2018 SPLUNK INC.
Implementation
Building suspicious first event detector

Architecture
4 steps

Splunk Server Database

Randomly Generated
Events

First-time Events

Event Files

Event Aggregator

Rule Engine

Learning Algorithm

Predictive Model

Rules Database

Feedback

Analysts

© 2018 SPLUNK INC.

Example Case
Two employees access two devices

User Properties

Peergroup: 2 OU: Finance

Alice

Protocol: IPP Duration: 2Min

Device Properties

2ndfloorPTR

Device Type: Printer Domain: iot

© 2018 SPLUNK INC.

Protocol: SSH

Peergroup: 16

Duration: 2Hours

OU: engineering

Bob

buttercup

Device Type: VM Domain: dev

Event Processing
Step 1: Build a summary of information for the rule engine

Splunk Server Database

Randomly Generated
Events

First-time Events

© 2018 SPLUNK INC.

Event Files

Event Aggregator

Generates a summary of events

Rufleor theLearruninlge engPriendicetiveto make decisions

Engine

Algorithm

Model

Rules Database

Feedback

Analysts

Event Processing
Step 1: Converting single event into an annotated graph with properties

© 2018 SPLUNK INC.

Peergroup: 2 OU: Finance
Peergroup: 16 OU: engineering

Alice Bob

Protocol: IPP Duration: 2Min
Protocol: SSH Duration: 2Hours

2ndfloorPTR

Device Type: Printer Domain: iot

buttercup

Device Type: VM Domain: dev

Link ID
1
2

User Properties
Peergroup: 1 OU: Engineering Peergroup: 10 OU: Finance

User Name Bob Alice

Events Summary SSH, 2h
IPP, 2m

Device Name Buttercup 2ndfloorPRT

Device Properties
Type: VM Domain: dev
Type: Printer Domain: iot

Rule Engine
Step 2: Convert event summaries into numerical signals

Splunk Server Database

Randomly Generated
Events

First-time Events

© 2018 SPLUNK INC.

Event Files

Event Aggregator

Produces meaningful training data for

Rule Engine

Learning Algorithm

Latent Predictive factor ML algorithm
Model

Rules Database

Feedback

Analysts

Rule Engine
Step 2: Converting links into numerical signals

© 2018 SPLUNK INC.

Link ID
1
2

User Properties
Peergroup: 1 OU: Engineering Peergroup: 10 OU: Finance

User Name Bob Alice

Events Summary
SSH duration 2h
IPP

Device Name Buttercup 2ndfloorPRT

Device Properties
Type: VM Domain: dev
Type: Printer Domain: iot

Link ID 1 2

Feedback

Rules Database

Rule Engine

User Name Bob Alice

Rule Score 100 3

Randomly Generated
Events
Device Name Buttercup 2ndfloorPRT

© 2018 SPLUNK INC.
Machine Learning and Prediction
Step 3 and 4: find model that reconstruct data and use it to predict first time events

Splunk Server Database

Randomly Generated
Events

Train latent factor ML model using

Scored data

Event Files

Event

Aggregator

Rule Engine

Learning Algorithm

First-time Events
Predictive Model

Verify relevance of First-time events using
Trained Model

Rules Database

Feedback

Analysts

Machine Learning
Step 3: Find a model that can reconstruct the data

Link ID 1 2

User Name Bob Alice

Rule Score 100 3

Device Name Buttercup 2ndfloorPRT

© 2018 SPLUNK INC.

User Name Bob Alice

Latent Factors [0.0, 0.5, 0.5] [0.8, 0.2, 0.0]

Learning Algorithm
 , 

Device Name Buttercup 2ndfloorPRT

Latent Factors [0.0, 0.0, 1.0] [0.2, 0.8, 0.0]

Predictions
Step 4: Predict first time events

© 2018 SPLUNK INC.

User Name Bob Alice

Latent Factors [0.0, 0.5, 0.5] [0.8, 0.2, 0.0]

Device Name Buttercup 2ndfloorPRT

Latent Factors [0.0, 0.0, 1.0] [0.2, 0.8, 0.0]

 ,  =  -  = // + 11+22

Alice

Threshold Susp0i.c0ious

2ndfloorPTR

No0r.m4 al Bob

buttercup

© 2018 SPLUNK INC.
Results
Applying this technique on data

Device Logins
 Login events into devices · Users have different roles that define their login behaviors · Heterogeneous set of device types · Other properties such as employee department, device subdomain are available · Distribution of device types, and user roles are biased
 Suspicious accesses happen with low probability · Accesses out-of-profile behavior

© 2018 SPLUNK INC.

Pure ML vs Rule + ML
Performance of approach in terms of True and False Positives

© 2018 SPLUNK INC.

The perfect classifier

Almost 20% of improvement with Rule + ML

© 2018 SPLUNK INC.
Final Words

Conclusion
Better than rules or machine learning alone
 Reduce of first time events for analyst to look at  Allows early detection of suspicious activity  Customizable ML through rules and feedback  Learns natural behavior not foreseen by rules

© 2018 SPLUNK INC.

Beyond Prediction
Not just predictions of suspicious events
 Latent factors are represented by a vector · It encodes behavior and characteristics pretty much like a DNA for entities
 These can be clustered using Splunk MLTK · Find behavioral peer-groups of users and devices · Define user-device affinity groups · And many other interesting insights of your data

© 2018 SPLUNK INC.

Hands on: Where to go from Here!
Get the power of rules and collaborative filtering algorithms
Splunk User Behavior Analytics Splunk-UBA

© 2018 SPLUNK INC.

Splunk Machine Learning Toolkit Splunk-MLTK

© 2018 SPLUNK INC.
Q&A
Ignacio Bermudez Corrales| icorrales@splunk.com

First Time Events in Real Life
Some are normal, some can be risky
 Machine Accesses · IT workers frequently update machines. One updates a QA testing VM, is this risky?

© 2018 SPLUNK INC.

 Cloud Storage File-sharing · Files are download or previewed once, some may be read by the "wrong" people

 Private Code Repositories · An employee's account got compromised and cloned projects with sensitive intellectual property

 Badge Accesses · Some worker entered the servers room of his office out of working hours

© 2018 SPLUNK INC.
We Want Early Detection
The risk of first time event and why you should care
 Event linked to suspicious activity can happen only once · Attacker spear downloads single confidential file to local hard drive · Suspicious activity happens once and there are not after events to make a decision · Volume of data download, number of devices accessed, number of repos cloned, etc.
 Detecting suspicious activity based on post-events can be risky · Collecting post-events can take time, can we make an early decision?
 Many normal operations happen for a first time · Employee access some colleague's dev machine, architect downloads confidential document
regarding product design

First Time Events in Real Life
Some are normal, some can be risky
 Users access similar set of machines on a daily basis · IT workers frequently update machines. One updates a QA testing VM, is this risky?

© 2018 SPLUNK INC.

 Employees share files in some cloud storage system · Files are download or previewed once, some may be read by the "wrong" people

 A git repository where all developers have read access · An employee's account got compromised and cloned projects with sensitive intellectual property

 Company keeps record of badge accesses · Some worker entered the servers room of his office out of working hours

Machine Accesses
Do all first time accesses look suspicious?

© 2018 SPLUNK INC.

Historical Accesses

First Time Accesses

Normal Operations?

Suspicious Accesses?

Examples of First Time Events
 First time ... · A user access a machine · A user enters a room in a building · A user opens a file in a private cloud · A user pulls code from a git repository · A user logins from a particular location · An employee mails another employee · And many other examples
 First time events can be pretty common

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
First Time Event Handling
How to deal with first time events?
 Conservative Approach · All first time events are suspicious and worth looking at one by one · In scenarios where the number of first time events is huge this requires excessive resources
 Laissez-faire Approach · We do not care about first time events · Easy to implement, but won't catch any concerning first time event
 Use Rules · They can cover low hanging fruits, but can't cover corner cases
 Use Machine Learning · Learns from historical patterns in the data, but can't learn from what haven't happened
 The answer resides between the last two!

Some Machine Learning Background
Things we should keep in mind through the presentation

© 2018 SPLUNK INC.

 Machine learning algorithms approximate numerical data with a function
· History of events have to be represented as numbers to learn
· Linear regression: Given data points (x, y) find a and b such that y' = a x + b can reconstruct
the evidence

We need to model our problem numerically and we will find parameters that can reconstruct the evidence

Machine Learning Generalizes
ML allows reconstruction of the data

© 2018 SPLUNK INC.

Historical Data - Evidence

ML Reconstruction of Data

11 11 1 11 111 1

1 1 0.8 0.1 0.1 0.1 0.1 0.8 1 1 0.1 0.1 0.1 0.1 0.8 0.8 1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 1 0.8 0.8 0.5 0.5 0.5 0.8 1 1 1 0.1 0.1 0.1 0.5 0.8 0.8 1

The objective of the ML algorithm is to reconstruct the evidence With the minimum error possible using an evaluation function

Taming ML with Rules - Review
Passing down knowledge to machine learning algorithm

 Rules: · Embed human knowledge · Map event properties into numerical signal · Consume external properties of event entities · May have low coverage · Complements what can be seen in the history · Don't generalize
 Passing them down · Generate random events · If random event hit a rule add them to history · Control the number of random events to avoid
overfitting

Coverage of Rules

1 1

110

0

1

0

1

© 2018 SPLUNK INC.
0

Taming ML with Rules - Review
Passing down knowledge to machine learning algorithm
Coverage of Rules

© 2018 SPLUNK INC.

1
if(event == condition)
1

1100

0

1

0

1

Machine Learning Generalizes
ML allows reconstruction of the data

© 2018 SPLUNK INC.

Historical Data - Evidence

ML Reconstruction of Data

11 11 1 11 111 1

1 1 0.8 0.1 0.1 0.1 0.1 0.8 1 1 0.1 0.1 0.1 0.1 0.8 0.8 1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 1 0.8 0.8 0.5 0.5 0.5 0.8 1 1 1 0.1 0.1 0.1 0.5 0.8 0.8 1

This is analogous to the linear regression problem when y' = a x + b Reconstructs the Data

Machine Learning Generalizes
How a machine learning model predicts first time events

© 2018 SPLUNK INC.

Historical Data - Evidence

ML Reconstruction of Data

11 11 1 11 111 1

1 1 0.8 0.1 0.1 0.1 0.1 0.8 1 1 0.1 0.1 0.1 0.1 0.8 0.8 1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 1 0.8 0.8 0.5 0.5 0.5 0.8 1 1 1 0.1 0.1 0.1 0.5 0.8 0.8 1

This is analogous to the linear regression problem when y' = a x + b Reconstructs the Data

Machine Learning Generalizes
How a machine learning model predicts first time events

© 2018 SPLUNK INC.

1 1 0.8 0.1 0.1 0.1 0.1 0.8 1 1 0.1 0.1 0.1 0.1 0.8 0.8 1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 1 0.8 0.8 0.5 0.5 0.5 0.8 1 1 1 0.1 0.1 0.1 0.5 0.8 0.8 1

User Latent Factors

Machine Latent Factors

(, )
Combination function

Analogous to the linear regression problem y' = a x + b Latent factors are the parameters (a, b) and the function combines them

How Data is Reconstructed
Latent factor models

© 2018 SPLUNK INC.

User Latent Factors (x)

Machine Latent Factors (y)
1 1 0.8 0.1 0.1 0.1 0.1 0.8 1 1 0.1 0.1 0.1 0.1 0.8 0.8 1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 1 0.8 0.8 0.5 0.5 0.5 0.8 1 1 1 0.1 0.1 0.1 0.5 0.8 0.8 1

 ,  = . 
Evaluation function
In the machine learning training phase we find latent factors parameters, that combined with a function,
we can recreate the values of the matrix (remember, similar to y' = a x + b)

How Data is Reconstructed
Latent factor models

© 2018 SPLUNK INC.

User Latent Factors (u)

Machine Latent Factors (m)
1 1 0.8 0.1 0.1 0.1 0.1 0.8 1 1 0.1 0.1 0.1 0.1 0.8 0.8 1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 1 1 0.8 0.8 0.5 0.5 0.5 0.8 1 1 1 0.1 0.1 0.1 0.5 0.8 0.8 1

Latent factors (u, m) are real valued vectors that minimize the reconstruction error made by the evaluation function
 ,  = . 
Evaluation function
This is analogous to linear regression where we find parameters (a, b) that
minimize the error of y' = a x + b

Architecture
4 steps

Splunk Server Database

Randomly Generated
Events

First-time Events

Event Files

Event Aggregator

Rule Engine

Learning Algorithm

Predictive Model

Rules Database

Feedback

Analysts

© 2018 SPLUNK INC.

Event Processing
Step 1

© 2018 SPLUNK INC.

Input
· Event Logs · External information
about entity properties

Goal
Convert single event logs into an annotated graph
with event properties

Output
Table of aggregated events

Event Processing
Step 1
 Goal · Convert single event logs into an annotated graph with event properties
 Input · Event logs · External information about the entities
 Output · Table where each row is an aggregation of events between two entities · For each row there are properties attached to them

Link ID
1
2

User Properties
Peergroup: 1 OU: Engineering Peergroup: 10 OU: Finance

User Name Bob Alice

Events Summary
SSH duration 2h
IPP

Device Name Buttercup 2ndfloorPRT

© 2018 SPLUNK INC.
Device Properties Type: VM Domain: dev Type: Printer Domain: iot

Rule Engine

 Goal · Convert links into numerical signals (scores)
 Input · Table of aggregated events · Randomly generated event aggregations · Rules database · Previous analyst feedback
 Output · Table with scored links

Link ID 1 2

User Name Bob Alice

Rule Score 100 3

Device Name Buttercup 2ndfloorPRT

© 2018 SPLUNK INC.

Machine Learning Algorithm

 Goal · Generate latent factors for entities that allow reconstruction of the data
 Input · Real valued links with labeled entity identifiers
 Output · Evaluation function that can operate on latent factors (given by the algorithm) · Latent features for each entity

User Name Bob Alice

Latent Factors [0.0, 0.5, 0.5] [0.8, 0.2, 0.0]

Device Name Buttercup 2ndfloorPRT

Latent Factors [0.0, 0.0, 1.0] [0.2, 0.8, 0.0]

© 2018 SPLUNK INC.

Predictions
Step 4
 Goal · Predict anomalous first time events
 Input · Database of entity latent factors · Function that operates on latent factors · Anomaly threshold
 Output · Labeled anomalous first time events

© 2018 SPLUNK INC.

Example

© 2018 SPLUNK INC.

User factors lookup table

User Name Latent Factors

Bob

[0.0, 0.5, 0.5]

Alice

[0.8, 0.2, 0.0]

Device factors lookup table

Device Name Latent Factors

Buttercup

[0.0, 0.0, 1.0]

2ndfloorPRT [0.2, 0.8, 0.0]

Evaluation function  ,  =  -  = // + 11+22

Bob Alice

Predicted scores

Buttercup

2ndfloorPRT

0.5

0.4

0.0

0.8

Threshold

Bob Alice

Predictions

Buttercup

2ndfloorPRT

Normal

Normal

Suspicious

Normal

Predictions
Step 4: Predict first time events

© 2018 SPLUNK INC.

User Name Bob Alice

Latent Factors [0.0, 0.5, 0.5] [0.8, 0.2, 0.0]

Device Name Buttercup 2ndfloorPRT

Latent Factors [0.0, 0.0, 1.0] [0.2, 0.8, 0.0]

Alice 0.0
0.4 Bob

 ,  =  -  = // + 11+22

2ndfloorPTR

Alice

Suspicious

buttercup

Threshold

Normal Bob

2ndfloorPTR buttercup

Event Processing
Step 1: Build a summary of information for the rule engine

Splunk Server Database

Randomly Generated
Events

First-time Events

© 2018 SPLUNK INC.

Event Files

Event Aggregator

Rule Engine

Learning Algorithm

Predictive Model

Rules Database

Feedback

Analysts

Event Processing
Step 1

© 2018 SPLUNK INC.

Input
· Event Logs · External information
about entity properties

Goal
Provide as much information as possible to
the rules to make decisions

Output
Table of aggregated events

Rule Engine
Step 2: Convert event summaries into numerical signals

Splunk Server Database

Randomly Generated
Events

First-time Events

Event Files

Event Aggregator

Rule Engine

Learning Algorithm

Predictive Model

Rules Database

Feedback

Analysts

© 2018 SPLUNK INC.

Input
· Table of aggregated events
· Randomly generated events
· Rules database · Previous feedback

Rule Engine
Step 2
Goal
Convert aggregations into numerical signals, so they
can be learnt by a Machine Learning
algorithm

© 2018 SPLUNK INC.
Output Table of scored links

© 2018 SPLUNK INC.
Machine Learning and Prediction
Step 3 and 4: find model that reconstruct data and use it to predict first time events

Splunk Server Database

Randomly Generated
Events

First-time Events

Event Files

Event Aggregator

Rule Engine

Learning Algorithm

Predictive Model

Rules Database

Feedback

Analysts

Machine Learning
Step 3

© 2018 SPLUNK INC.

Input Table of scored links

Goal
Find a model that can reconstruct the data

Output
· Evaluation function · Latent factors for each
entity

Input
· Table of aggregated events
· Randomly generated events
· Rules database · Previous feedback

Predictions
Step 4
Goal
Predict anomalous first time events

© 2018 SPLUNK INC.
Output Labeled first time events

Pure ML vs Rule + ML
Performance of approach in terms of True and False Positives

© 2018 SPLUNK INC.

The perfect classifier

Almost 20% of improvement with Rule + ML

Pure ML vs Rule + ML
Performance of approach in terms of True and False Positives
 Compare approach using and not using rules
 Rate of TP/FP by moving the detection threshold
 Rules improve overall performance
 Same TP rate lesser FP · TP = 0.9, FP = 0.2 with rules · TP = 0.9, FP = 0.35 without rules

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Conclusion ( make 2 slides)
How this is implemented on Splunk. Where you can find it in splunk. A second slide is how this is gonna help you, compare to other products if possible (competitors).
 This can be implemented using Alternating Least Squares (ALS) on Spark · Can also be implemented in Python with some specific packages
 UBA suspicious first Box accesses use this approach · Captures when a user access a resource for the first time · Uses Active Directory extracted peer-groups · Rules based on file properties
 Not just prediction of suspicious first time event · Latent factors as "DNA" for entity behavior or characteristic · Latent factors ... explain .. Like a DNA · Enables further behavioral clustering of entities
 What this all means for a business (the impact, why this is important) · Save analyst time · It learns iteratively, custom to user needs.

Conclusion
Better than rules or machine learning alone
 Allows early detection of suspicious activity · Reduces the volume of first time events the analyst has to look at

© 2018 SPLUNK INC.

 Customizable through rules and feedback · Analysts can impact ML model by providing feedback on specific events or by writing rules

 Learns natural behavior not foreseen by rules · Collaborative filtering extrapolates from historical interactions

Hands on
Get the power of rules and collaborative filtering algorithms
 Splunk UBA · Currently used for detecting suspicious access to resources in Box · Leverages Spark ML collaborative filtering API

© 2018 SPLUNK INC.

 Splunk Machine Learning Toolkit (MLTK) · Adding more algorithms from Spark ML soon

 Not just predictions of suspicious events · Latent factors represent a vector encoding behavior, pretty much like a DNA for entities · They can be used to cluster entities based in their behavior to find interesting insights

Hands on
Get the power of rules and collaborative filtering algorithms
 Splunk UBA · Currently used for detecting suspicious access to resources in Box · Leverages Spark ML collaborative filtering API
 Splunk Machine Learning Toolkit (MLTK) · Adding more algorithms from Spark ML soon

© 2018 SPLUNK INC.

