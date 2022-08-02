eBay Analytics Platform Metadata and its Applications
September 2011
SACC2011

Agenda
· The Born of eBay · eBay Analytics Platforms · Analytics Platform Metadata and Its Applications · Metadata Repository · Other Applications · Q&A
SACC2011
2

The Born of eBay . . .

Started with a Broken Laser Pointer . . .
AuctionWeb was born on the Labor Day weekend in September 1995

$30

eBay Founder

. . . sold for $14.83 USD

Pierre Omidyar
SACC2011

The Born of eBay . . .
FREE Service Running Off from a Home Server . . .
$240 USD/month

Pierre Omidyar

SACC2011

The Born of eBay . . .

Requesting for donations . . .

Coins

Money Order

Movie Tickets

Personal Check

Bills

Coupons

SACC2011

The Born of eBay . . .
Start Profitable . . .
SACC2011

The Born of eBay . . .
Initial Business Model and Target Users . . . Build equitable electronic marketplace for Americans to buy and sell their stuff
SACC2011

eBay Facts ­ 16 Years After ...

$3,000+ USD Trading Value
Per Second

220+ Million Active Item

300+ Features

450+ Million
Registered Users

Listing for sale

per quarter
100,000 lines
of code rolled out

Over 2 Billion
Photos

10+ Million
New Items Added Per Day

every 2 weeks
50,000 Categories

2 Petabytes
Stored
25 Petabytes
Processed daily

Global Presents In 33 International
Markets

48 Billion SQL Calls
Per day
5.5 Billion API Calls
Per month

> 4.4 GB
Source Code

SACC2011

eBay Analytics Platforms
Born in Year 2000 ...

From Oracle to Teradata in 2003 ... Largest Teradata Customer Infrastructure Today ...
55,000 daily batch processes ...

6,000+ internal users relying on our platforms ...

SACC2011

eBay Analytics Platforms

500+ concurrent users

20-50 concurrent users

>5 concurrent users

Analytics & Reporting

Discover & Explore

Operational Analytics Transactional Analytics High volume ad hoc queries

"Compare User Activity against last year" Trending and Forecast Analysis (large history)

Image Fingerprinting Image Classification Pattern Recognition Detect Counterfeits & SNADs

Production Analytics Platform Large Concurrent User-base

Contextual-Complex Analytics Deep, Seasonal, Consumable Data Sets

Structure the Unstructured Detect Patterns

Enterprise-Class System

Deep Analytics Enterprise-Class System

Research System

EDW/ODW Primary & Secondary

Singularity

SACC2011

Closed Loop, Active Analytics Platform

Analytical Reporting
Marketing

Knowledge: Integrated, aggregated, augmented www.eBay.com

Trust & Safety Customer Support

Analytics Platforms

Site Databases

· Traffic Tracking · Finding · Rules engines · Real time creative · Advertising · Fraud prevention · Fake item detection

Raw data: daily, hourly feeds Wisdom: informed, fact based actions

SACC2011

Analytics Platform Metadata

B Data Dictionary B Logical Data Map (Source to Target Mapping)

T System Inventory T Physical Source to Target Mapping

T Logical and Physical Data Model

T Data Definitions T Batch Process Information
T Process Execution Information

SACC2011
12

Analytics Platform Metadata
What else do we get?
T Physical Data Flow T Data Utilization T Object Dependency T System/Batch Performance T etc . . .
SACC2011
13

Analytics Platform Metadata
Typically, metadata is . . .

T B
T

T

B

T

B

T
SACC2011
14

Application of Metadata
How does Metadata help us? Physical Data Flow Visualization
Data Rationalization
Data Quality Monitoring
SACC2011
15

Application of Metadata
Physical Data Flow Visualization
Problem Statements: Manual Drawing of Data Flow is Time Consuming No Complete Set of Data Flow Diagrams Easily be Out Dated Manual Drawing can only provide Limited Information Accuracy not Guaranteed
SACC2011
16

Application of Metadata
Physical Data Flow Visualization
The Data Flow Visualization tool is an automated solution to generate Data Flow Diagrams (DFD) for all Analytics Platform tables.
The DFD shows how data is being flowed through from within the Analytics Platform production environment.
SACC2011
17

Application of Metadata
Physical Data Flow Visualization
Blue line: Stands for the process critical
path
The output table of step1, also, it is the input table of step2
Step2: the step number is ordered
by the job start time
Job Start/End Time(HH:MM:SS)

Round Corner Rectangle:
The upstream tables from other subject
area
Set Background as gray to highlight the target table of the
diagram
The script(job) name to populate the table in the step
SACC2011
18

Application of Metadata

Physical Data Flow Visualization

What questions can the Data Flow Diagram answer: Where is the source? How data gets flow into target? Which SQL statements? What are the start time and the end time? When does a target table be ready? What is the critical path?

SACC2011
19

Application of Metadata
Physical Data Flow Visualization
What do we use the Data Flow Information for? Unusual delay of table readiness. Unusual run time of SQL execution Data Flow critical path change. Failure down stream impact analysis. Better view on business data analysis. Etc . . .

SACC2011
20

Application of Metadata
Data Flow Visualization Tool User Interface
SACC2011
21

Application of Metadata
Data Rationalization
Problem Statements: System becomes running out of space Batches running slower and slower Risk of missing business SLA Takes longer on accessing data on the system Lose end user satisfaction
SACC2011
22

Application of Metadata
Data Rationalization
Data rationalization leverages the technical metadata to determine the optimum collection of data to provide the greatest business benefit to the business user.
SACC2011
23

Application of Metadata
Data Rationalization Benefits
 Reduce in overall IT expenditures  Freeing up valuable resources  Extend the life of value-generating system  Enhance User Experience
SACC2011
24

Application of Metadata
Data Rationalization ­ Table Usage Metadata The Table Usage Metadata (TUM) collects the table usage and consumption information for analysis and rationalization purposes.
SACC2011
25

Application of Metadata

Data Rationalization ­ Table Usage Metadata

Table Basic Info

Table Access Info

Table Size Table Skew Factor Table PI Info

Refresh Frequency Average Completion Time End User Access Frequency Column Access Info

Table Usage Info

CPU Cost (both population and consumption) Downstream Batch Hit Counts End User Hit Counts

Table Utilization Index

SACC2011
26

Application of Metadata
Data Rationalization Typical Approaches
 Table Retirement  Loading Frequency Reduction  Table Retention by Removing Old Data Records  Table Retention by removing End of Life Data Elements
SACC2011
27

Application of Metadata
Data Quality Monitoring
Problem Statements: Data Quality from Source cannot be guarantee Data Quality issues usually discovered by end user Data Quality issues cannot be discovered immediately Data Quality issues cost a large amount of effort to fix Lose customer satisfaction on data quality
SACC2011
28

Application of Metadata
Data Quality Monitoring
Data Quality Monitoring tool (DQ Firewall) is designed to monitor data quality on the system close to real time. Issues can be monitored and prevented by leveraging business metadata or customized data quality rules.
SACC2011
29

Application of Metadata
Data Quality Monitoring Benefits
 Discover Data Quality issues immediately when occur  Prevent downstream impact when issues are discovered  Enhance user experience on Data Quality  Improve data accuracy on the system
SACC2011
30

Application of Metadata
Data Quality Monitoring How does it Work?

Data Element Metadata
Data Type Data Allowable Domain Referential Integrity Constraints Defaults

Monitoring Engine (DQ Firewall)

Alerts and Automated Actions
SACC2011
31

Data Model Management
Data Model Management by Metadata Repository (MDR) Tool
SACC2011

Subject Areas and Tables
Subject Areas Information Web User Interface
SACC2011

Data Model Compliance

Data Model Metadata Repository and Compliance Report

Teradata Data Model Compliance Audit Report
Report Date: Oct 24, 2009 12:57:31 AM Wildcat Scan Date: Oct 24, 2009 12:37:10 AM Caracal Scan Date: Oct 24, 2009 12:36:21 AM
Overall Audit Report Compliance: 98.4%

View Compliance by Subject Area

Data Model

Data

In Model but Data Type Difference

Warehouse not in Data Between Data Model

Warehouse and Data Warehouse

Comments A

B

C

D

Table

3,700

3,509

229

Count

Column

57,793

53,532 4980

Count

58 128

In Data Warehouse but not in Data Model E
38
719

Comments

A

Total count of tables (including persistent tables and

indices) or columns in the data model.

B

Total count of tables (including persistent tables and

indices) and columns that are in the data warehouse.

C

Count of tables (including persistent tables and indices)

and columns that occur in the model but not in the data

warehouse. Primarily consists of projects that are

modeled but have not been released into production.

D

Count of columns (and the associated tables) that occur

in both the data model and the data warehouse, but the

data types are different. The column must exist in both

the data model and the data warehouse to be compared.

E

Count of all objects in the data warehouse production

databases, entire tables, persistent tables and indices

and the associated columns that are missing from the

data model plus a count of columns that are missing in

the data model from tables that exist in both the data

model and the data warehouse. Views and working

databases are not included.

%DCaotemp1/l4iaCnomce0p.l0ianMceissing TabDleifsferent Tables

8/22 91.0

195.0

212

100.0

8/29 919.0/5

95.9
95.9
96.3

74.0
96.3
68.0

201 96.2
164

94.0

96.9

96.7

90.0

9/12 96.2

78.0

153

9/19 94.0

169.0

155

80.0

9/26 96.9

62.0

158

70.0

10/3 96.7

71.0

128

60.0

10/10

98.5

40.0

44

50.0

40.0

10/17

98.3

38.0

82

30.0 10/24 98.4

38.0

58

20.0

10.0

0.0

8/22

8/29

9/5

9/12

9/19

9/26

10/3

Date

Table Audit Trend

98.5

98.3

98.4

10/10

10/17

10/24

250.0 200.0

250 200

Missing Tables

Number of Missing Tables Number of Different Tables

150.0 100.0

150 100

Different Tables

50.0

50

SACC2011 0.0

0

8/22 8/29 9/5 9/12 9/19 9/26 10/3 10/10 10/17 10/24

Date

Data Model Domain & Subject Areas SACC2011

Other Applications

· ETL Performance Monitoring

· Product Return on Investment Management

· Query Pattern Recognition

· Analytics Platform User Behavior Analysis

· ETL Problematic Path Analysis

· Others

SACC2011
36

In Summary . . .
Metadata is NOT . . .
Operational Applications can be designed to rely heavily on Metadata to us help managing our Analytics Platforms . . .
SACC2011
37

Q & A

SACC2011

Analytics Platform Architecture
SACC2011
39

APD ­ Global Team Locations

Seattle, WA
Analytics Platform Team & anchor point for India based outsourcing. Core competencies in VLDB and highly efficient / scaleable arch (Next Gen).
San Jose, CA
BU Dedicated Teams (IMS, DMS, MRM, UBI), DW Core, and Arch & Ops. Core competencies in rapid development, VLDB, MPP, business analysis, DW Dev.

Shanghai, CN
DW Core Team, APD Ops anchor point for China based outsourcers (HP, DX). Core competencies DW Development, Business System Analysis, Quality Assurance, Architecture, Project Management Office and Production Support.
Chennai, India
Cognizant Technology Services (on shore / off shore model)
SACC2011
40

