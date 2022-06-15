SESSION ID: PDAC-R03
Context-Based Data Sensitivity Classification

Anchit Arora
Program Manager Cisco @ancarora

John Cashman
Information Security Architect Cisco @jdcashman

#RSAC

#RSAC
Where's my Data?
80% of enterprise companies don't know where their sensitive data is located ¹
¹ https://thycotic.com/resources/cybersecuritymetrics-report-2017/
2

Questions that need to be answered to protect data efficiently and effectively

#RSAC
· What is this data? · What is the source of the data? · What is the sensitivity of the data? · Who owns or is accountable for this data? · What, if anything, about the form or usage
of this data would alter its sensitivity?

#RSAC
Cisco's Data Classification Framework

Cisco Restricted Cisco Highly Confidential
Cisco Confidential
Cisco Public

Data Owners / Trustees
Data Custodians
Data Users
4

#RSAC
Data Classification Adoption Challenge

Data Stewardship

Data owner guidance
Organizationallevel guidance
Enterprise-level guidance

5

Data Use Ecosystem

Data Classification Adoption Challenge

Data Stewardship

Data owner guidance
Organizationallevel guidance
Enterprise-level guidance

#RSAC
Classifying Source Code
Data Owner Guidance: The Project Skyjet source code should be classified as Cisco Highly Confidential, but the I/O board FPGA source code is actually classified as Cisco Confidential Organizational Guidance: By default, critical or emerging project source is classified as Cisco Restricted, but sustaining project source code is classified as Cisco Highly Confidential
Enterprise Guidance: By default, Engineering source code is classified as Cisco Highly Confidential

6

#RSAC
Enforcement: the Rubber hits the Road
Policy enforcement is predicated on accurate classification of the data
7

#RSAC
Data Identification Cohesion
Each area plays an important role in identifying data, but need to be aligned and to evolve cohesively
Landscape

Data Tagging

Discovery

Classification
8

#RSAC
Building a bridge
Contextual classification provides the link to both usergenerated and auto-classification tools and processes

Data Users
User-generated classification

Business Data Owners / Trustees
Contextual Classification
9

Machine Learning
AutoClassification

Contextual Data Classification
Use-case based approach

#RSAC
How To Apply The Model
Building decision/context models
­ Step 1 (a, b, c): Identify the correct unit of processing and protection, & business relevance ­ Step 2: Extracting context ­ Step 3: Building the model
Preserving context and acceptable use of data (getting ready to apply policies)
­ Step 4: Preserving classification with ability to scale/align with future vision, and planning enforcement of acceptable use
­ Step 5: Overall approach
Use-case specific architecture for applying the right controls (to achieve enforceability)
­ Step 6: Accurate Guidance for data users to handle and share data
11

Step 1 (a): Identifying the correct unit of processing and #RSAC data protection

· Effective for design & implementation of security and protection controls focused on identified sensitive elements
Element level

Category level
· Effective for legal, Contractual and regulatory understanding of data risk and compliance requirements

· Effective for record & document level security and data protection and understanding value of bulk data
Object and aggregate level

System & Instance level
· Effective for relative risk prioritization and supporting disaster/incident response plans/process

12

Step 1 (b): Identifying the correct data object for context extraction
Data Type
Revenue Data
ONE

#RSAC
Abstract

MANY
Data Object Word.docx
Revenue details in a MS Word
report

Data Object Excel.xls
Bookings information for
all products

Data Object TCP packet
Revenue data in transit, like in
email being sent

Object
Data Object System (DB)
SSOT of all bookings at Cisco

#RSAC
Step 1 (c): Business relevance of contextual classification
Identify data objects which are good candidates for contextual classification based on business relevance (business defined attributes)
­ Mission criticality ­ Volume of data ­ Count of users ­ PII or Non PII
Not all data objects will be good candidates for contextual classification
­ Static data classification ­ Not being the correct unit of data processing or protection

#RSAC
Step 2: Extracting context - Asking the right questions

Repository / Instance Attributes
Data usage & generation
related modifications

Aggregation and Time Sensitivity

Data Category Implications
Personal Information Applicability

Data specific attributes

Data Classification
Context

Risk and Impact analysis

15

#RSAC
Step 3: Building the model with the owners of the data

Revenue Data

Include current quarter

Yes

actuals or

future?

No

Already published

No

publicly?

Yes

Low Sensitivity

Include Product data?

Yes High-priority Yes World-wide Yes

product

aggregation?

segments?

No

No

No

Include Yes cost data?
No

Geo or Theater

Yes

view ?

Yes Include Metrics?

No

No

High Sensitivity

Medium Sensitivity

16

Step 4: Preserving context and applying the right

#RSAC

controls

Need a comprehensive business solution in support of "Classify Before Use" paradigm...
· Data must be classified before its use · Data must be classified when it is created, if possible · Classification level must evolve to reflect business context changes

Three key activities define the Classification solution:

Determine
Assess classification level of data
· In-line within business process when data is created / collected
· Offline - Historical data - Bulk data collection - e.g. Auto-Class

Reference
Access the classification level
· Tagging  Data structure extension  In-line metadata attribution (unstructured data)
· Indexing, labelling
17

Enforce
Apply data protection controls · Data Loss Prevention (DLP)
· Data Monitoring
· Application logic
· Policy-controlled rules engine

#RSAC
Step 5: Overall Approach

Enhanced data security building blocks

#RSAC

Trusted: Enhanced Security Zone

Data Create & Input
Data Input Controls
Classification Tag

Secure Application

Data

Secure Application

Enhanced Security Controls

Data Download & Output Data
Output Controls
DLP IRM Tokenize / mask

Auto- Fine-Grain Encryption Monitoring Secure Trusted

Classification Access

Application Device

Slide Credit: Gerwin Tijink, Cisco Systems

Lower trust zone
Application
Detect & contain
DLP

#RSAC
Step 6: Accurate guidance for users using the model

Q&A
Anchit Arora
Program Manager Cisco @ancarora

John Cashman
Information Security Architect Cisco @jdcashman

