SESSION ID: PS-T12
Securing the Software Development Life Cycle with Machine Learning

Scott Christiansen
Senior Security Program Manager Microsoft Customer Security & Trust

Mayana Pereira
Data and Applied Scientist Microsoft CELA Data Science

#RSAC

#RSAC
The Story of Mike the Developer

#RSAC
Friday
The Story of Mike the Developer

#RSAC
What's In This For You?
Educate + Learn = Apply

Educate
In complex enterprise environments, tracking bugs and understanding the security debt is vital.

Learn
How to apply data science in security teams for more
efficient and reliable processes
4

Apply
Identify bottlenecks that require intensive work of
Security expert and evaluate potential data science partnerships.

#RSAC
What is a Security Bug?
 Software code flaw  Software design issue  Operational flaw of
implemented software
5

#RSAC
Sources of Security Bug Debt

AUTOMATION
­ Fortify ­ Checkmarx ­ DevSkim ­ Semmle

MANUAL
­ Threat Modeling ­ Vulnerability Reporting / Bug Bounty ­ Security/Engineering Code Reviews ­ Q/A, Testers, etc. ­ Microsoft Secure Development Lifecycle ­ Operation Security Assurance Programs
6

#RSAC
Quality of Security Bug Debt Sources

Automation
­ Static Analysis Security Testing Tools ­ Dynamic Analysis Security Testing Tools ­ Fuzzing ­ Network Vulnerability and Secure Configurations Scans
Manual
­ Threat Modeling ­ Vulnerability Reporting / Bug Bounty ­ Penetration Testing ­ Security/Engineering Code Reviews
7

Quality Low - High

Pen Testing Security Code Reviews Threat Modeling

Network Vuln Scans

Vuln Reporting

Dynamic Analysis

Static Analysis

Fuzzing

Manual -- Automated Testing and Validation

#RSAC
Where do the Security Bugs Go?
Tracking Mechanisms
8

#RSAC
How many Bugs are we talking about?

Apache Software Foundation
~35K bugs in the
past 16 years

Debian OS

~85K totaGl bituHgsub ~28.5 million issues

100 across

million

projects

9

Work-item Scale
~47K engineers potentially creating bugs

#RSAC
+
~100+ Different Azure DevOps & GitHub repositories

~61K new Work Items created each month

~13m Work Items at Microsoft since 2001
10

Security Bug debt questions
Does it matter if Security Teams are seeing everything?

#RSAC

Opportunity for Security
Training

Triaged Properly

Fixed per SLA

Does it Matter?

Engineering Fatigue

Coverage Gaps

Clustering

11

#RSAC
Finding `Everything' is a hard problem

The Easy Finds

+

­ SDL Mandated fields such as "Security Severity" ­ Security Bugs created by automation with error ID #s

­ Bug created by security teams with the words `THIS IS A SECURITY BUG' in them

The Hard Finds
­ Free form bug created from Threat Modeling exercises ­ Engineering code review bugs
12

#RSAC
The Machine Learning Test
­ Humans can't scale up to solve the problem
­ Large curated dataset to train a model from
­ On staff, security-focused Data Scientists ­ Security Subject Matter Experts whom are
experts with the dataset
13

#RSAC
Data Science Joins Security

#RSAC
What does the security team want from data science?
Classification System that is "as close as possible" to a Security Expert for the task of classifying a bug report as
security/non-security.
15

Labeled Data

Supervised learning: a quick recap

XSS Buffer overflow Button in wrong place Wrong font in main page

Security Security Non-Security Non-Security

16

#RSAC
AI Model

Data to be Labeled

Supervised learning: a quick recap
XSS Buffer overflow Button in wrong place Wrong font in main page
17

#RSAC
Security Security Non-Security Non-Security

#RSAC
Is there enough data? How good is the data? Are there data usage restrictions? Can data be generated in a lab?
18

#RSAC
Data Science + Subject Matter Expertise
First Step for Success
­ The classification system needs to perform as Security Expert.
· A very important step is to have a data that reflects decisions of the security expert.
­ Having the training data approved by the expert is fundamental for the success of the classifier
· Security expert can review the data through statistical sampling
19

Our Classification System
Two-Step Machine Learning Model Operation
Security Bugs

Data from AzureDevOps

Non-Security Bugs 20

#RSAC
Critical Bugs Important Bugs Moderate/Low Impact Bugs

Our Classification System
Performance
Security Bug Classification is extremely accurate. Simpler techniques (like Logistic Regression) are able to achieve classification accuracy of over 90%. To avoid engineering Fatigue, our process aims at a very high model precision.
21

#RSAC

#RSAC
Data Science + Security in Action

Data Collection

Data Curation and approval

Expert evaluation of production
results

Modeling and validation

22

#RSAC
Data Science + Security in Action

Identify all data sources, data consistency and data types

Data Collection

Data Curation and approval

Expert evaluation of production
results

Modeling and validation

23

Data Science + Security in Action

Data Collection

Data Curation and approval

Expert evaluation of production
results

Modeling and validation

#RSAC
Review the data content, correctness of
labels

24

#RSAC
Data Science + Security in Action

Data Collection

Data Curation and approval

Expert evaluation of production
results

Modeling and validation

ML technique Selection, Model Training, Model
Validation and Performance evaluation

25

#RSAC
Data Science + Security in Action

Evaluation of model performance in production

Data Collection

Data Curation and approval

Expert evaluation of production
results

Modeling and validation

26

#RSAC
Dynamic Scenario (semi)automated model retraining
Build highly generalized models
Setup monitoring
27

#RSAC
Training data collected in the wild most likely contains issues.
What if there are noisy labels?

Dealing with imperfect data

Bugs

Train

Validate

Test

Training data Validation data
29

#RSAC
Model trained on noisy data

Security Bugs

#RSAC

Test Data (noiseless)

Model trained on noisy data
30

Non-Security Bugs

#RSAC
Discussion: Data Quality
Noise in training data does not disqualify ML models
30% of noise in the data set 2% reduction in accuracy
31

#RSAC
Takeaways Rely on your humans SMEs
Adjust your risk behavior
Imperfect training data can work
32

#RSAC
Data Science Takeaways
We have shown the feasibility of security bug report classification based solely on the title of the bug report.
­ This is particularly relevant in scenarios where the entire bug report is not available due to privacy constraints.
Interpretable models can achieve very good performance metrics.
­ Our classification model that utilizes a combination of TF-IDF and logistic regression performs at an accuracy.
Mislabeled training and validation data.
­ The decrease in accuracy is very small

#RSAC
How this helps you and your customers

#RSAC
What this means to You

Fixing Actual Security Bugs
Reduced Engineering
Fatigue

Meeting True SLAs

#RSAC
What this means to customers

More Secure Products

Open Source Framework

Product Integration

#RSAC
What's In This For You the Audience?
Educate + Learn = Apply

Educate
In complex enterprise environments, tracking bugs and understanding the security debt is vital.

Learn
How to apply data science in security teams for more
efficient and reliable processes
37

Apply
Find what data you have, interrogate it and then question what you still
don't know.

Thank you
Scott Christiansen
Scotch@Microsoft.com
Mayana Pereira
Mawander@Microsoft.com

#RSAC
Pereira, M., Kumar, A., & Christiansen, S. (2019). Identifying Security Bug Reports Based Solely on Report Titles and Noisy Data. IEEE International Conference on Smart Computing (SMARTCOMP), 39-44.

