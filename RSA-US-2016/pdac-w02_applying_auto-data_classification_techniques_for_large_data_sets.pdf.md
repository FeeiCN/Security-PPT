SESSION ID: PDAC-W02
Applying Auto-Data Classification Techniques for Large Data Sets
#RSAC

Anchit Arora
Program Manager InfoSec, Cisco

The proliferation of data and increase in

#RSAC

complexity

9 to 5 in the office

1995
Emergence of Internet & mobility

2006
The Human Network

2014
BYOD & Externalization

2020
The Internet of Everything

Volume
· Big data architectures, low storage cost, Increase of data retention
· 80% of data generated today is unstructured
· Data generated worldwide will reach 44 zettabytes by 2020*

Pace
· Enterprise data collection to increase 40 to 60 % per year*
· Experts predict the amount of data generated annually to increase 4300% by 2020 *
Complexity
· Complex work models: always accessible, remote & mobile workers
· Definition of perimeter: Cloud, Customer & partners
· Users choose devices (BYOD)

* Numbers and statistics from Gartner, Gigaom Research, CSC, Seagate

#RSAC
Auto-classification: The why and what
Desired business outcome: At Cisco we want to provide additional sensitivity context to structured and unstructured data, to be able to apply controls more effectively Scope: Our aim is to have an automated classification capability for all structured data systems, and provide capability to better govern/control generation of unstructured data which is created as a result of export from structured data systems using label/field association to each record set
3

Use-case: From structured to unstructured

Structured data system (SoR)

SoE

SoR

UI

Export (E) & tag

Provide classification information to the user ­ or access policy based on class to the application

Index all existing and newly written data is indexed and classified based on algorithm and dictionary defined for the SoR

API

Indexer

Classification Engine

algorithms and dictionaries

Classifica4tion

#RSAC

#RSAC
An unstructured data use-case: box.com
Box.com is an external cloud platform used by Cisco for collaboration and storage of data Security questions to ask:
What is this data? What's the source of the data? Who owns this data? What's the sensitivity of the data? Is all data equally sensitive (this is the essence for optimal security)? What's the level of security required?
5

#RSAC
Should we ask the user to govern security?
Can we expect the user to make the right security decision with all this complexity involved in decision making?
The user needs to be very knowledgable to make the right decision
The answer is No: But however many systems are designed to have users govern security -
Recognize data categories in systems with unstructured data Classify data in any data system Set data securitypolicy Securely export data out of the system
Making the shift from user governed to data owner governed
6

#RSAC
How to make the shift to a data owner model?

Data Taxonomy

Governance of Data by Data Owner

Data Management

Recognize Data Type

Classify Sensitivity

Tag

Policy Enforcement

Governance of Data by End User

Data Intelligence & monitoring capabilities

Data Protection capabilities

Across various data types: Engineering, Customer, Finance, HR

#RSAC
Conceptual approach

Find data objects

Discover

Recognize

Classify

Identified

Large unstructured generic data repositories

Structured data systems (SoR)

Classification mostly unknown

8

Data Sensitivity1
Data Sensitivity2
Data Sensitivity3
Data Sensitivity4

#RSAC
Structured data case study: Engineering & Customer data protection in context of bug Information

#RSAC
A case study: Bug information
Millions of bugs + product bugs, 3 approaches available to protect: 1. Treat all bugs equally, and apply `very strict' controls on all bugs
· In heterogenic data models , most data is `Over'-protected · Limits business ability and User experience 2. Treat all bugs equally, and apply `loose' controls on all bugs · Results in `Under'-protected data 3. Apply the right amount of protection on a bug, based on sensitivity · Balanced security and cost applied ­ just the right amount of security!
10

#RSAC
Setting the foundation for auto-class

Inventory Process

Identify
· Identify the most sensitive IP and IP's appropriate owner(s)

Define
· Define data use and access rules for the most sensitive IP

Translate
· Translate rules into IT enforceable policies

A Sensitive software bug in CDETS

Product development
lifecycle: Sustaining

Category: Is a bug

Severity: Sev1,
Status: Open

Found by Customer

The inventory process engages the business to build out the data taxonomy and a model of the sensitivity

Belongs to hardware

Customer network topology

11

The proof is in the numbers!!

Manual approach
Parameter Average time to classify a single bug Total number of bugs Time to classify Cost/min of SME analyst Cost to classify
Auto-Classification approach
Parameter Average time to classify a single bug* Total number of bugs Time to classify Estimated cost for Infrastructure and resources required to classify

Value 5 minutes 7 Million 35 Million minutes $ 0.83/Min $ 29 Million
Value 0.002 minutes 7 Million 14,000 Minutes $ 0.25 Million
12

#RSAC
Additional costs to consider for manual: Training: For consistent user behavior Change to business: Cleaning legacy Change to applications and Infrastructure
Accuracy Results 83%

#RSAC
The most sensitive data is just a small portion

2.5% Highly Confidential

< 1% Restricted

13

#RSAC
How did we execute the methodology?

AS-IS: NeAw6 sSteop wRoriknflotwe,gforrasttruicotunredfodartaA(SuoRt)o-Class

Engage

Attribute

Develop

Validate

Integrate

Protect

#

Phase

Scope

1

Engage

Identify SoR and engage stakeholders to communicate expectations, R&R, Identify data workflow (user stories) and data categories. Plan and establish scope and planning of the SoR integration

2

Attribute

Analysis of data, database fields, record and build a data sensitivity model / algorithm to be able to classify the

data

3

Develop

Development of attribution and scoring algorithm into the classification engine and perform indexing of datasets

4

Validate

Validation and tuning of classification results of the classification engine to ensure accuracy of the output

5

Integrate

Integration of classification data with the source system

6

Protect

Planning and implementation of protective measures in the source system for sensitive data classes

14

Building an attribution model
Attribute A, Attribute B, Attribute C ......................... Attribute L, Attribute M, Attribute N............... Attribute X, Attribute Y, Attribute Z......

All available source system built-in attributes

#RSAC

Attribution model

Weights

Scoring equation

Selected attributes and values
Extracted entities from free-text fields and attachments:

Values and
scores

Classification rules
15

Data freshness

Contextual information

Extracted entities

How to create a similar solution for your

#RSAC

organization?

Engage
·System Identification ·Stakeholder identification ·Source system data fields ·Field analysis ·Field type analysis ·Data record analysis ·Define Dictionary ·Candidate fields ·Feasibility ·Socialization

Attribute
·Field value assignment ·Field correlation ·Weight scoring ·Sensitivity scoring

Develop
·Classification engine Infrastructure Setup ·Classification engine configuration ·Coding of classification algorithm

Validate
·Sample size scoping ·Sample size indexing ·Validation of sample set ·Statistical validation of sample set ·Tune ·Result socialization

Integrate
·Design ·User stories ·Source system tagging (application tagging) ·Stakeholder Socialization

Protect
·Access control ·Behavior monitoring
·Source System Secure design ·Source System compliance ·Export control ·Import control ·Data Loss

16

#RSAC
Now what? - Prevent, Detect and Educate

Why

Restricted
· Bug Status: Open · Bug Severity: Critical · Keywords: Customer:

Educate

Prevent

Policy Driven, Context-Based Access Control

Access Control Visibility

· Restrict access to the application and through search
· Fine grain access based on data classification

Data Visibility

Detect

· Tag source systems and docs w/
classification metadata · Focus on most sensitive data · Integration with DLP solutions · Data science

17

#RSAC
Q&A
Anchit Arora
Program Manager InfoSec, Data Security Analytics Team ancarora@cisco.com
18

