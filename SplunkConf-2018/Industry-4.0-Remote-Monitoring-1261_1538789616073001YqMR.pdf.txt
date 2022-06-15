© 2018 SPLUNK INC.

Industry 4.0 - Remote Monitoring

Health of Semiconductor Manufacturing Factories Using Splunk Log Analytics

Amudha Nadesan

Senior Manager, APG Technology

October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Applied Materials AGS
Our innovations make possible the technology shaping the future

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
THE MOST EXCITING Industries on Earth
Applied Materials is the leader in materials engineering solutions used to produce virtually every new chip and advanced display in the world
Our expertise in modifying materials at atomic levels and on an industrial scale enables customers to transform possibilities into reality
At Applied Materials, our innovations make possible the technology shaping the future

What Others Are Saying

© 2018 SPLUNK INC.

Supplier Awards

Index Series Member

World's #1
semiconductor and display equipment company

© 2018 SPLUNK INC.

$14.5 billion
revenue
AMAT stock
listing on NASDAQ
Data as of fiscal year end, October 29, 2017

$1.8 billion
R&D spending
Headquartered in California's
Silicon Valley

>11,900
patents
~18,400 employees
90 locations In 17 countries

Businesses

© 2018 SPLUNK INC.

Semiconductor Systems

Applied Global Services

Display and Adjacent Markets

© 2018 SPLUNK INC.

Applied SmartFactory® Full CIM Capabilities

Factory Productivity

Product Quality

Supply Chain

WIP, WORKFLOW, EXPERIMENTS, RECIPES, CROSS-FACTORY,

MASTER PLANNING, FACTORY PLANNING,

DISPATCHING, REPORTING, DIRECT DELIVERY, SCHEDULING,

CAPACITY, STARTS, LAYOUT SIMULATION,

MATERIAL CONTROL, SENSEDECIDERESPONDTM, PREDICTION

INTEGRATED SIMULATION, S &OP PLANNING

DETECT: SPC, TOOL FAULTS, SUPPLIER QUALITY RESPOND: RUN-TO-RUN, IN-LINE MEASUREMENT YIELD MANAGEMENT, DEFECT MANAGEMENT

Equipment Control
DATA COLLECTION, EQUIPMENT INTEGRATION, FAULT DETECTION, EQUIPMENT PRODUCTIVITY, RUN-TORUN, MAINTENANCE MANAGEMENT, BIG DATA

Digital Transformation (Industry 4.0)

Connect

Monitor

Control

Optimize

Automate

Management Decision Making

© 2018 SPLUNK INC.

Production

Services

QA/QC

Business

Analytics, Prediction, Apps Connectivity, Digital Hub, Data Lake

Decision making at every level through
interconnected intelligent system in analytics & control, maintenance, service
and scheduling

Data Sources

Equipment

Sensor

Alarms

Metrology

Test

Quality

Supply Chain

ERP

© 2018 SPLUNK INC.
Semi Manufacturing Generates Tremendous Data

Intelligent control requires sensor knowledge & analytics

No. of Process Steps Grows 3x with Nodes

Quadrillions of Data Points by 2018

300mm

Single tool

data per
50KB second
per tool

>500

tools per fab*

annual
~1PB data per
fab
1000000000000000
* 30Kwspm fab

1,200 1,000
800 600

3x
No. of Process
Steps

0 65 45 28 20 14/ 10 7 5 16
 Nodes Progression (nm) 

2D Device Architectures

3D Device Architectures

40 Quadrillion Data Pts

Etch

Dep

Metrology & Inspection

2006

2018

© 2018 SPLUNK INC.
Splunk Offline Log Analytics
Remote Monitoring

Introduction to SmartFactory Health

© 2018 SPLUNK INC.

 Health is a suite of software and services that monitor customer factory automation systems (hardware and software) to help maintain 99.999% uptime using the latest industry 4.0 principles:
· Splunk Log Analytics: All the performance data are uploaded to Splunk
through Secure FTP for detecting trends, anomalies and outliers using latest prediction algorithms

SmartFactory Health Comprehensive monitoring solution that aligns with
latest industry 4.0 principles

© 2018 SPLUNK INC.

APG
Products

Operating System Platform

DB
Platform

Hardware Platform

WEB User Interface Reporting Analytics Any Device

Real Time Production Monitoring

Monitoring Templates PMP Tools WEB UI Dashboard

Zabbix

Offline Log Analytics

Outliers Anomalies Trends

Splunk

GIS Remote Production Monitoring

24/7 monitoring 8/5 monitoring

Managed Service

Why Splunk offline Log Analytics

© 2018 SPLUNK INC.

 Monitor factory automation software ­ make environment more productive and efficient by quickly troubleshooting issues on internal and customers' systems
· Manufacturing Execution Systems (MES), Computer Maintenance Management System
(CMMS), Fault Detection, Dispatching , Scheduling
· Windows and Linux OS
· Oracle
· Zabbix
 Without Splunk offline Log Analytics:
· Manual trouble shooting process which consists of Ftp'ing logs from operating systems, middleware
applications and data bases.
· Some API calls execute but never complete and that loop is not closed.
 With Splunk offline Log Analytics:
· Proactive troubleshooting - automatically collecting and analyzing data quickly in order to anticipate
problems before they affect the manufacturing environments.

Typical Architecture running 24/7

© 2018 SPLUNK INC.

(Production/Staging/Development Environment)

VM Host 1 PMP Server

MES Combined
Server

MES Terminal Server

Applied Tools E3 Server

VM Host 2

MES Terminal Server

MES Combined
server Monitoring Server

Staging Combined
Server

Staging E3 Server
MES DB

Shared Storage
FailoverCluster Network Switch
SAN Switch

1Gb

Staging Terminal Server
MES DB

Development Server
SAN Network

Firewall Server

Log Analytics Architecture offline
DATABASE
WINDOWS / CLIENT

Customer Users

© 2018 SPLUNK INC. Applied Users TPS, SE, GIS

APPLICATION

RHEL/HP-UX/SOLARIS PMP TOOLS

ZABBIX

Logs Collected for Analysis ­ Windows Event Logs, Oracle Alert Log, Statspack, AWR
reports, Zabbix Problem Reports, Windows PS logs, SAR Output files, Performance logs from Application, Syslog, Application logs, RHEL/HP-UX/Solaris server logs, Perfmon files.
Secure FTP : Collected data is zipped and transferred to AMAT network through secure FTP Splunk Server : High performance computing server in AMAT network that allows read access
to Applied customers to visualize the factory performance and detect trends
Splunk Dashboard : allows you to monitor and better understand the data associated with
machines and applications. · Collected data is ingested into Splunk with indexes and provides real-time search, analytics,
and reporting. · Organize data patterns, diagnose potential problems, and application management and
security.

© 2018 SPLUNK INC.
Typical ingestion rate for low volume factory
Raw Logs -> summarized reports -> zipped for FTP -> unzipped for Splunk ingestion

Size of the raw logs from All servers in 24 hours 1GB
Size of the summarized logs from All servers in 24 hours 250MB
Logs ingested into Splunk [Growth of index after ingestion] 215M

681 files moved and ingested per day

Log Ingestion

Different analytics performed to proactively detect performance issues

Summary API Performance Report Summary Script Performance Report Detailed Synchronous Transaction Report Detailed Asynchronous Transaction Report Windows Application Event Log report Windows System Event Log Report Oracle Alert Log Oracle Statspack Report Listener Log Psloggedon report PSlog list report Web UI log Log Analyzer report Zabbix Problem Resolution report Windows Update Log

Format Analytics performed

CSV CSV CSV CSV CSV CSV Time series Text file Time series Text file Text file Text file CSV CSV Text file

Performance outliers, Performance Trends, Load Balancing Performance outliers, Performance Trends, Load Balancing Performance outliers, Performance Trends, Load Balancing Performance outliers, Performance Trends, Load Balancing Asset management, Performance Outliers Asset management, Performance Outliers Performance Outliers Oracle Wait Event Analysis , SQL Performance analysis Performance Outliers User Login Analysis Process CPU and memory outlier detection Performance outliers, Performance Trends Asset management, Performance Outliers Asset management, Performance Outliers Performance Outliers

© 2018 SPLUNK INC.

Alert generation
Perform analytics during data ingestion

© 2018 SPLUNK INC.

Optimize CPU and Memory utilization
Using pslist data
· Detect top cpu consuming process · Detect top memory growing process

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Detect Outliers
Oracle Alert Log, Listener Log, System Event, Application Event, Zabbix problems
Detect outliers from time series data

Detect Transaction Outliers
Using transaction performance data

© 2018 SPLUNK INC.

Script causing performance issue on more than 1 execution

Network health issue detection
Using the ping data

© 2018 SPLUNK INC.

Detect the network health using the ping response time on each server node

© 2018 SPLUNK INC.
Predict Trends in SQL Performance
Oracle Stats pack or AWR data provide detailed report on SQL Performance (every 10 minutes)

SPL Challenges & Optimization

© 2018 SPLUNK INC.

 Issue Description · SPL was taking almost 430 seconds for an index with almost 3 million events. · The SPL was straightforward and had no complicated filters.
 Fixes suggested by supported team · changing/removing the filters · Move panel to a separate dashboard
 Support team brought in Splunk architect to help · SPL was built into a data source with all the filters prebuilt in the data source.
 Results · Reduced the total time taken by the panel by more than 50%. · Panel moved back to the original dashboard with 60 panels · No further performance issues even when the search runs along with 60 other searches.

SPL Performance Issue (cont..)
 Converting to data source · 24 hours ­ Improved from 7 seconds to 1.5 seconds · 30 Days ­ Improved from 70 seconds to 30 seconds · All Time ­ improved from 430 seconds to 213 seconds
 Number of events for the timeframe · 24 hours - 636,837 · 30 Days - 13,976,231 · All Time - 27,793,007

© 2018 SPLUNK INC.

Splunk Data Snippets

Total number of dashboards

5

Average number of panels per dashboard

100

Total number of Index

300

Total number of Source types

150

Average size of files ingested daily

5G

Expected to scale up by 5X times
within next 2 years

© 2018 SPLUNK INC.

How Splunk helps
Remote monitoring team proactively has detected more than 100 issues

 Any unscheduled down causes business loss

 1 hour of unscheduled down · Low Volume FAB - $10K · Medium Volume FAB - $100K · High Volume FAB - $1M

No FAB Down so far on any remote monitoring sites

© 2018 SPLUNK INC.

Thank You & Questions
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

