AI is Not Magic:
Machine Learning for Network Security

Lena Pons
Software Engineering Institute Carnegie Mellon University Pittsburgh, PA 15213

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[[DDIISSTTRRIIBBUUTTIIOONN SSTTAATTEEMMEENNTT AA]] AApppprroovveedd ffoorr public rpeulbealicserealnedasuenalinmdituendlidmisiteridbudtiisotrni.bution.

1

Document Markings
Copyright 2020 Carnegie Mellon University.
This material is based upon work funded and supported by the Department of Defense under Contract No. FA8702-15-D-0002 with Carnegie Mellon University for the operation of the Software Engineering Institute, a federally funded research and development center.
NO WARRANTY. THIS CARNEGIE MELLON UNIVERSITY AND SOFTWARE ENGINEERING INSTITUTE MATERIAL IS FURNISHED ON AN "AS-IS" BASIS. CARNEGIE MELLON UNIVERSITY MAKES NO WARRANTIES OF ANY KIND, EITHER EXPRESSED OR IMPLIED, AS TO ANY MATTER INCLUDING, BUT NOT LIMITED TO, WARRANTY OF FITNESS FOR PURPOSE OR MERCHANTABILITY, EXCLUSIVITY, OR RESULTS OBTAINED FROM USE OF THE MATERIAL. CARNEGIE MELLON UNIVERSITY DOES NOT MAKE ANY WARRANTY OF ANY KIND WITH RESPECT TO FREEDOM FROM PATENT, TRADEMARK, OR COPYRIGHT INFRINGEMENT.
[DISTRIBUTION STATEMENT A] This material has been approved for public release and unlimited distribution. Please see Copyright notice for non-US Government use and distribution.
This material may be reproduced in its entirety, without modification, and freely distributed in written or electronic form without requesting formal permission. Permission is required for any other use. Requests for permission should be directed to the Software Engineering Institute at permission@sei.cmu.edu.
DM20-0008

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

2

Motivation

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

3

The Vision
Internet

ML magic sensors

Alert queue

ML magic sensors

Prioritized, filtered alert
queue

ML magic
Cyber Threat Intelligence

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

4

The Reality
Internet

There is no
ML "magic" sensors

Alert queue

sensors

Prioritized, filtered alert
queue

This feedback loop is weak at best, and goes stale quickly

Prioritization is highly context specific

Cyber Threat Intelligence

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

5

AI is Not Magic

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

6

Can I Use ML?
Framing questions: · Can you state your problem as:
· I would like to use ______ data to predict ______? · Is it a large scale problem? · Have you done exploratory analysis on available data?

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

7

Problem Specification
Typically we start with an underspecified problem: For network security we want to predict malicious activity in a network using a combination of network sensor data
What data are we using? What condition are we looking for?

Network traffic data

Host log data

Indicators of compromise

Statistically anomalous
behavior

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

8

Build a Model

Historical Data

Trained model

predictions

Observations
Machine Learning for Network Security
© 2020 Carnegie Mellon University

Additional computation,
viz, context

output

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

9

Build a Model

Historical Data

Trained model

Observations

This is where the majority of the effort will occur
Sometimes the historical data is not very responsive to the question you want answer

If the observations do not "look like" the historical data, then
predictions will not be reliable

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

10

Large Scale Problem
· Network monitoring data can be in the terabyte and petabyte per month scale
· It contains observations from multiple different sensors that are placed at different locations · Sensors all have slightly different, overlapping formats
· Normalizing and tying together data from multiple collections / perspectives can be challenging & time consuming

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

11

Data Engineering

Internet

sensors

sensors

Alert queue
Looking for many types of things from many sources of data at many different timescales.

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

12

Exploratory Analysis

· Analytic techniques for identifying potentially anomalous network behavior are relatively well developed
· However, specific configurations, baseline assumptions, critical assets vary by network
· Exploratory analysis is required to ensure that an ML approach to network analysis is applicable

ML applications are higher impact where a task can be repeated and extended

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

13

Should I Use ML?
Framing questions: · Can I apply the same test repeatably?
Yes, but I have to apply many tests in parallel · Do I have historical and / or ground truth data?
Historical data, yes, but almost never labels or ground truth · Can I validate the output of the model?
Yes, but it requires specialized knowledge

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

14

ML for Network Security

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

15

State of Data Science for Network Security
Lots of products are selling ML/AI for network security Under the hood many of these products are still narrow and don't advance much beyond a signature

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

16

Problems ­ Model Fragility

What's a model?

A conditional mean

Some

model

If the baseline changes, then the

detection criteria changes

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

17

Problems - Extensibility

Detection criteria

typically work for

Some model

some model on

some network and

if you change the

network, then you

need to train a new

model

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

18

State of Data Science ­ Detection Criteria

Internet

Only some fraction of the sensor data is germane to this model

sensors

Some model

Alert

sensors

Baked into the model is some detection criteria that is dependent on the network

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

19

Detect and Categorize Threats

Internet

Alert queue

Useful information to establish whether some observed behavior is bad exists in being able to "see" across
Machine Learning for Network Security
© 2020 Carnegie Mellon University

Sensors frequently work as a "stack" because different sensors are configured to look for different things

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

20

State of Data Science ­ Seeing Across

Internet

Alert queue

Machine Learning for Network Security
© 2020 Carnegie Mellon University

Even if you have the capability to place sensors inside and outside the network, tying the data together is frequently a challenging engineering effort

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

21

Problems ­ Threat Intelligence

The missing

sensors

piece of ML for intrusion detection is

sensors

Alert queue

actionability.

Threat

intelligence

tells the

analyst why they care

Cyber threat intelligence

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

22

Problems ­ Threat Intelligence

The desire to integrate threat intelligence into the detection process is to help automate the decision process, but the information goes stale quickly

sensors sensors
Cyber threat intelligence

Alert queue

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

23

Anomaly Detection

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

24

Anomaly Based Methods
· Anomaly detection is based on the assumption that unusual traffic is "bad" and that typical traffic is "good"

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

25

What's unusual?
First problem: Network defenders often don't know what's typical traffic on the network

Much of what ML for network security boils down to is constructing baselines for traffic

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

27

What's expected?
Second problem: Network defenders often do not know if baseline traffic is consistent with desired behavior

The baseline can not be used for anomaly detection if it contains unknown malicious traffic

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

28

What's malicious?
Third problem: Anomalous traffic is not always malicious and malicious traffic is not always anomalous

Even if the network defender knows what is anomalous, he may not know if some specific anomalous traffic is malicious

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

29

Longer Time Horizon Detection

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

30

Recall
Internet

Alert queue
ML magic

Prioritized, filtered alert
queue
Machine Learning for Network Security
© 2020 Carnegie Mellon University

Cyber Threat Intelligence

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

31

Advancing Cyber Threat Hunting

Detection
find something new find it earlier, and anticipate find it faster find it with less human effort find combinations of indicators

Data Collection
collect the right data share it integrate context (right visibility) triage data (store for reuse) adapt based on detection/context

Chaining & Integrated Models
Adaptive feedback collection  detection
Abstractions of real world TTPs  data

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

32

How Can We Use ML
Detection
find something new find it earlier, and anticipate find it faster find it with less human effort find combinations of indicators

Alert queue

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

33

Defending Networks

Event

Response

Event

Response

. . .

Event

Response

Much of the current practice operates on a diagnose & treat model
Events are handled on an individual basis and patterns are hard to detect

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

34

Deriving Actionable Information From Text
Common representations & ontologies allow for abstracting observations from action
Having a knowledge representation that is broad enough to make high level connections & deep enough to resolve information is foundational for longitudinal analysis

Cyber observations

common description &
metadata

Threat detector

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

35

Abstracting Threat Intelligence

· Rapidly updating hierarchical representations of observable types
· Constructing heuristic rules about combinations of observations
· Forming hypotheses about attack mechanisms

Hierarchies allow you to map observations back to a higher level

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

36

How Can We Use ML

Background / baseline data

Adaptive Triage data sensing
alert

Secondary detection
sensors

Data triage
model

detector

Cyber threat intelligence

Collect the right data Share it

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

37

AI is Not Magic

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

38

What We Can Improve with ML
· Looking at increasingly larger volumes & time windows of data · Graph methods for proximity to suspected bads · Learning abstractions to improve shareability of CTI and
longevity of CTI

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

39

What We Can not Improve with ML
· No amount of ML will make up for certain types of missing data · Unknown unknowns will continue to be a challenge · "Adversarial perspective" / smart hypothesis generation

Machine Learning for Network Security
© 2020 Carnegie Mellon University

[DISTRIBUTION STATEMENT A] Approved for public release and unlimited distribution.

40

