SESSION ID: MLAI-W01
Disinformation Defense:
How AI inference threats might influence the outcome of 2020 election

KAREL BALOUN, KEN CHANG, MATT HOLMES
School of Information UNIVERSITY OF CALIFORNIA ­ BERKELEY

#RSAC

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
· 1928 St Francis Dam collapse killed 450
· 1926 St. Francis Dam completed
· 1907 Los Angeles voter approved construction bond
· 1905 Los Angeles started aqueduct project from the Owens Valley with initial $1.5 million bond

#RSAC
Our Democracy at Risk

Presenter's Company

Logo ­ replace or

delete on master slide

3

#RSAC
Freedom is on the line
 Freedom is America's seminal and central value. AI can take it away.
 "A threat to free will is a threat to freedom, the imposition of a dangerous worldview without public awareness. When free will itself is threatened, that is the ultimate threat to freedom."
- George Lakoff on page 62 of "Whose Freedom?" (2006)

Presenter's Company

Logo ­ replace or

delete on master slide

4

#RSAC
2016 U.S. Presidential Election
· National Security is never a partisan issue. Facts only.

· Jamieson is a trusted political historian.

· GRU hacked DNC

· Wikileaks sanitized the theft

· Media reported. Trolls inflamed.

· Key voters stayed home.

Presenter's Company

Logo ­ replace or

delete on master slide

5

Disinformation Attack

Presenter's Company

Logo ­ replace or

delete on master slide

6

#RSAC
· 2016 Ukraine Election · 2016, 2019 UK
Election on Brexit · 2019 Hong Kong -
Anti Extradition Law Protests · 2020 Taiwan Presidential Election

#RSAC
AI Inference on Voter Preference
A matter of national security

#RSAC
Have you registered to Vote?

Presenter's Company

Logo ­ replace or

delete on master slide

8

#RSAC
AI/ML Threat Modeling on Personal Data

Assets Voter Database
US Census Social Media
Personal Data Market
Presenter's Company Logo ­ replace or
delete on master slide

Confidentiality Integrity

data breach, linkage Inference

data poisoning

data breach Inference

margin of error

data breach, linkage Inference

disinformation, misinformation, malformation

data breach, linkage Inference

data poisoning adversarial perturbation

Inference {identity,

algorithmic bias

attribute, membership}

9

Availability
deny of service

Hypothesis:

#RSAC

Voter Preferences Disclosure

Attack

Defense

Use of Machine Learning algorithm with

Advocate data privacy laws and regulations

vast amount of personal data to infer

with a holistic approach to anonymizing the

secret personal attribute on vote

personal data in the public market.

preference. Presenter's Company

Logo ­ replace or

delete on master slide

10

Design of Experiment

US Census
Voter Database

Attribute Distribution
Data Bootstrapping

Hypothesis ML Model

Domain Generalization
Data Anonymization

#RSAC
Data Source Data Bootstrap Machine Learning Privacy Engineering Vote Influence

Presenter's Company Logo ­ replace or
delete on master slide

Social Media
PII Market

Messages / Attacks

Vote Prediction

Disinformation Engine

Utility vs Privacy Analysis
Recommendation

11

#RSAC
Defense:
Privacy Engineering

Voter Data Bootstrapping

Links Social Media Profile and Content aggregation

US Census Summary Statistics on ethnicity, income, education, marriage, children

#RSAC

Voter Data extracts dob, sex, phone, county, zipcode, state, registered party, federal district
Links PII Data from Data Broker and Dark Web
Presenter's Company Logo ­ replace or
delete on master slide

Voter & Synthetic Data Generation Algorithm
Increased Margin of Errors w/ higher resolution
Of Data grouping such as zipcode from US Census

Synthetic Voter Data state, zipcode,
ethnicity, income, age, sex, education, marriage, children,
party

#RSAC
A Crash Course on k-Anonymity*

Presenter's Company Logo ­ replace or
delete on master slide

· Quasi-identifiers refer to attributes that are not considered explicit identifiers but could be linked with external information to re-identify personal records

· Given QI = {Gender, Age, Martial Status, Race}, k=1

Gender M M M M

Age Marital Status 32 Married 32 Married 32 Divorced 32 Never Married

Country US US US US

Race Non-Hispanic White Non-Hispanic White Non-Hispanic White Non-Hispanic White

14

Alcohol/Day Hard Drugs
1 No
2 Yes
3 Yes
1 No * L. Sweeney, 2002

Voter Data Anonymization ­

#RSAC

Datafly Algorithm with desired K-Anonymity

K=1 Anonymity
Data
No Privacy
K Anonymity
Data
Presenter's Company Logo ­ replace or
delete on master slide

Children

Sex

Marriage Income

Age

All

Ethnicity

Others

White

Black

Mexican

Ethnicity

N. Indian Domain Tree

Asian

Apply Domain Generation or Suppression on {sex, age, ethnicity, income, education, marriage, children}

N >= K

N Anonymity
Data

N < K

Computational disclosure control : a primer on data privacy protection Sweeney, Latanya

#RSAC
Attack:
Machine Learning

Machine Learning Model - Decision Tree
Supervised Model - Party as Labels (as a proxy for vote preference)
· Train & Predict raw data
­ Raw Data: 40% accuracy
· Train & Predict anonymized data
­ Anonymized Data: 47% accuracy
· Baseline: 3 labels ~ 33%
· Summary of Results

Presenter's Company

Logo ­ replace or

delete on master slide

17

#RSAC

#RSAC
Machine Learning Model - Decision Tree Example

Record = [Age , Sex, Marital Status, Zip] Bob = [55, M, Married, 50112]

Presenter's Company

Logo ­ replace or

delete on master slide

18

#RSAC
Machine Learning Model - Privacy Aware Decision Forest

Decision Forest

Privacy Aware
· Each decision tree will be tuned with Privacy Engineering in mind
· Increased accuracy when combined with real aggregated data linked from personal data sources
· More robust than a single tree; will help with capturing more structure in the data

Presenter's Company

Logo ­ replace or

delete on master slide

19

"Privacy Aware"
Example: Max Leaf Count

Leaf Count  Number of Equivalence Classes

Presenter's Company

Logo ­ replace or

delete on master slide

20

#RSAC
Example: Carefully synthesized data and purchase personal data
1. Use Census to collect probabilities of attributes for each EC
2. Find datasets that tie attributes to party affiliation (even in population level)

#RSAC
Decision Forest Results

K=1 Data: 46% accuracy

K=17 Data: 43% accuracy

Presenter's Company

Logo ­ replace or

delete on master slide

21

#RSAC
Disinformation Engine

Disinformation Lifecycle
Identify

Influence

Disinformation Engine

Inference

Presenter's Company Logo ­ replace or
delete on master slide

Publish

Generate

23

#RSAC

#RSAC

Presenter's Company Logo ­ replace or
delete on master slide

https://images.app.goo.gl/xPswVgEs4q2EzFZL6
24

#RSAC
Messaging & AI Threats
· Messaging Bots & Email Spam · Robot calls, including for push surveys · Media blogs, videos and posts · Advertising by PACs, Issue, and Campaigns
· AI impersonation, lie creation. · Overloading the media and messaging, especially locally · Not big data challenge, rather persuasion management + intensity · "Her". Speed and interactivity: of natural language responses · Tuning of persuasive messaging (Cambridge Analytica at max scale)
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Final Thoughts

#RSAC
What you can do!
 Advocate for each of the political and organizational recommendations on the next slide.
 Collect data, Build tools, Create video and text stories which document that this reality is happening.
 Stop disinformation around you!
Identify it, flag and report it, educate others proactively, and block the viral spread of this disease.

Presenter's Company

Logo ­ replace or

delete on master slide

27

#RSAC
Recommendations
 Further study of Privacy by Design principles on collection, processing, and disclosure of personal voter and public census data.
 Regulate the data broker industry with consumer privacy law, so everyone can view and opt-out any sensitive information.
 Every Secretary of State should mandate disclosure requirements for access and use of voter record files.

 FEC must ban use voter personal profiles in voter messaging, and ban use completely by campaigns and PACs.
 Large audience minimum size for advertising

Presenter's Company

Logo ­ replace or

delete on master slide

28

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
29

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
30

#RSAC
Thank You

