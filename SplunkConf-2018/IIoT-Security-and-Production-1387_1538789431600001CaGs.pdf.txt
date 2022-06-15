© 2018 SPLUNK INC.
IIoT-Security & Production Data Analytics at Volkswagen
A Winning Team for more efficient and secure Production
Ahmet Cubukcuoglu ­ Volkswagen AG Dr. Sebastian Schmerl - Computacenter
02/10/2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Key Takeaways
What you will learn in this session

© 2018 SPLUNK INC.

Security and efficiency goes
hand in hand

Acquiring production and security relevant
data

Data analytics and use cases

Agenda

© 2018 SPLUNK INC.

1. Some words about us 2. Challenges in industrial and shop floor security 3. Why security and production data analytics goes hand in hand 4. Data layers for production & security data in production environments 5. Use cases for security and production efficiency 6. Q&A

Some words about us

© 2018 SPLUNK INC.

Ahmet Cubukcuoglu

Dr. Sebastian Schmerl

Project Coordinator for IT-Shop floor Security
Volkswagen AG

Head of Production Data Analytics, Industrial Security & Cyber Defense
Computacenter

 Subject matter expert for: · Industrial & shop floor security · Security concepts & functional
developments
· Security assessments for production sites

 Subject matter expert for: · ICS & SCADA security · Industry 4.0 & data science · SOCs

Assessments and sustainability model
for production environments

© 2018 SPLUNK INC.

Cooperating with .... system integrators & vendors
Implementation

...dedicated for production sites
Assessments

adapting... and fine-tuning

Security requirements

sustainability by
repetition

Risk radar

Remediation measures

... determine risks & prioritizing

... selecting security measures

Challenges
 Large and complex systems with plenty of components, e.g.:
· Conveyor systems, robots,
gripping systems, welding systems, cluing systems, screwing systems, safety-system and ...
 Unique systems, tailored to the production process
 Build by system integrators
 Long lifespan >10 years

NIST Cyber Security Framework
The need of security monitoring & detection

© 2018 SPLUNK INC.

Identify
· Asset Management
· Risk Management

Compensating protection gaps

Precondition for response

Protect
· Network Protection
· System Protection
· Account Management
· Information Protection
· Remote Access · Physical Access · Awareness

Detect
· Network Monitoring
· System Monitoring
· Log centralisation
· Log Analysis · SIEM
Detection Process

Respond
· Incident Register · Incident Analysis · Incident
Response · Crisis
Situation(Sec)
· Planning · Communication

Recover
· System Recovery
· Recovery Planning
· Improvements · Communication

Both cover together protection gaps of shop floor components/ installations

© 2018 SPLUNK INC.
Production efficiency and security in combination
Challenges & advantages - mutual support & synergies

Production Analytics Industrial Security

No calculable RoI

No changes please

Stakeholder conflicts

Clear RoI

Passive Data Acquisition

Explicit Request

Detection of security issues
· Integrity Monitoring · Change Management · Network-Monitoring
cross domain values
Detection of production issues
· Predictive Maintenance · Production Efficiency · Production Monitoring

© 2018 SPLUNK INC.
Industrial security & production data analytics
One technology stack for three domains

IT Data Acquisition

Analytics Infrastructure

End-to-End Analytics

Data Integration

Dashboards Diagrams

Actions

OT

Analytics methods

Enterprise

Analytics

Alarming

Integration

Infrastructure

Production Production Monitoring Efficiency

Industrial Security

© 2018 SPLUNK INC.
Data layers for production & security
data
Data acquisition & collection

© 2018 SPLUNK INC.

Production and security data layers

High aggregated data nearly status information only

Data aggregation

Production efficiency

Industrial security

Layer 3 Layer 4

Plant MGMT

< 0,1 Hz

Process Status
OK

Application Logs Windows Logs Core-Network

Manufacturing execution MES, Data Historian

0,1 ­ 1Hz

Product Temperatur 100°C

Analytics

Endpoint/Windows-Logs AV-Logs, Data Base Logs Firewall-Logs, Patch-Status

Control Layer PLCs

5 ­ 10Hz

Layer 2

Calculation & Control Ø Temperature

PLC-Logs, HMI-Logs, Production cell integrity Network activities

Layer 1

I/O Layer

10 50Hz++

Production floor and process Layer
Fine grained temporal & sensor values of production data

90°C 130°C 110°C 70°C

PDEX

New Devices Firmware Versions Protocols

Prediction Quality & Precision
1/2 3 4

Visibility & Detection

Layer

1/2 3 4

Layer

Active and passive data acquisition
For the different layers

© 2018 SPLUNK INC.

PRO

ACTIVE
· no data transformation · no data dissection
· configuration changes · polling of information · PLC CPU time & memory

PASSIVE
· non invasive · no changes on automation cells · no discussions, no re-certifications · easy rollout
· Complex data extraction

Options CON

· Agent based · e.g. Splunk UF, Syslog,...
· OPC based

· CC Production Data Extractor

Production analytics & industrial security
Fine grained production data

© 2018 SPLUNK INC.

Cyclic data exchange

PROFINET

PROFINET

Devices

Controller
E/A

PLC

HMI

PROFINET Device
Frequency converter

Electric Motor

Production Control Center

Manifestation in the communicated data

Conveyor

Wear, different forces, resistance, component failures

© 2018 SPLUNK INC.
Production analytics & industrial security

Fine grained production data
Monitor network traffic via Tap or Span-Port

Cyclic data exchange

PROFINET Controller
PLC

PROFINET Devices
E/A

Production Data Extraction
HMI

Splunk

Cloud

Cyber Defense Center

Production Control Center

Manifestation in the communicated data

PROFINET Device
Frequency converter
Electric Motor

Conveyor

Wear, different forces, resistance, component failures

PDEX ­ Production Data Extractor
How it works

Captured network traffic with production data

Production data in Splunk

© 2018 SPLUNK INC.

· Communication monitoring
· Rolling Traffic Dumps · Packet dissection · Data Extraction · Data Conversion · Data Reduction · Data Forwarding

PDEX

PDEX/Splunk analytics infrastructure
for data on Layer 1, 2, 3 und 4

© 2018 SPLUNK INC.

Analytics Infrastructure

End-to-End Analytics

PDEX

Layer 1 & 2

PDEX

PDEX
Production Lines

Layer 3 & 4

Manufacturing Execution System

DBX

Data Historians

DBX

Shift books, Maintenance Logs, DBX ...
Production Control Center

16

Data Integration

Analytics methods

Enterprise Integration

Infrastructure

Dashboards Diagrams

Actions

Analytics

Alarming

Production Production IT & Industrial

Monitoring Efficiency

Security

© 2018 SPLUNK INC.

Data Integration

Analytics

Analytics Infrastructure methods

Enterprise Integration

Infrastructure

Storage, Integration & Analytics

Analytics infrastructure from small to large
Scalable & enterprise ready analytics infrastructures

© 2018 SPLUNK INC.

Data acquisition

End-to-End Analytics

Enterprise Scalability Universal Indexing

Dashboards Diagrams

Actions

Analytics

Alarming

Central UF Mgmt

Cluster Mgmt

Enterprise Integration

Production Production IT & Industrial

Monitoring Efficiency

Security

16

© 2018 SPLUNK INC.

Dashboards Diagrams

Actions

Analytics

Alarming

Production Production IT & Industrial

Monitoring Efficiency

Security

Use Cases
Splunking manufacturing lines including robots and industrial networks

© 2018 SPLUNK INC.
Predictive health monitoring for assembly lines
19 production cells on 600 meters

AC AC AC AC AC AC AC AC AC AC AC

11

10

9

8

7

6

5

4

3a

2

1

AC 3b

AC 12

AC

AC AC AC AC AC AC

13

14

15

16

17

18

19

Automation cell AC8

Box1 Robot 1

Box2

Box3

Box 8

Table1

... ... ...

Body 1

Tabl21

Box 7

Body 2
... ... ...

Robot 2 Box4

Box5

Box6

Light barriers Robots and tools
Component boxes

© 2018 SPLUNK INC.
Production data analytics & security monitoring
Health monitoring, predictive maintenance & integrity

Automation cell AC8

Box1 Robot 1

Box2

Box3

Box 8

Table1

... ... ...

Box 7

Body 1

Tabl21

Body 2
... ... ...

Robot 2 Box4

Box5

Box6

One automation cell - more than 600 components, actors & sensors

Project goals:
 Reduction of unplanned maintenance activities
 Faster maintenance activities in case of errors
 Learning of the normal behavior of the automation cells
 Anomaly detection with root cause analysis
 Predictive health monitoring for all components in the automation cells
 Integrity monitoring  Data analytics for fine
grained production data from PLC and IO-Layer

Integrity monitoring
Rapid overview on new, changed and missing elements

© 2018 SPLUNK INC.

Overview on:
 Logical communication  Used protocols & data
volumes  Physical cabling based on
MAC tables  Identification of
· missing components (technical
issues)
· New devices · New communication  Alarming on cell configuration changes · PLC programs/ configurations · IO configurations

Production data analytics
from anomalies, root causes and health monitoring

© 2018 SPLUNK INC.

Temporal and sequential monitoring of working steps
Working sequence for one car type

Challenges:
 Different car types  Different components
(doors..)  Different component weights  Different automation cell
working modes (normal, guided, manual)
 Automatic type detection  Automated normal profile
learning  Automated thresholding  Human
readable/understandable health calculations

© 2018 SPLUNK INC.

General analytics approach

Cell working

cycles

CCCoomommppopononenenentntxtxyxyzyz-z--ssisgigingnanalaslsls

Robot 1 - signals

Robot 2 - signals)

Screwing - signals

Duration of signals

t

Number of signal changes #

Cell integrity Process quality

Cell health

Five simples steps

Framing of normal working sequences
1 Start

0

0

0

0

0

Data

Stream

0

0

0

0

0

Frame
t End

Clustering

2 Modeling a baseline / normal state

Signal t duration
Signal # changes

min max S.dev perc95

avg median perc5

Definition of a threshold corridor

3 Current frame analysis

Framing/

0

Data

Splitting

Stream

0

Signal t
duration
Signal #
changes

4 Determination of difference to normal 5 Determination of Health scores

Baseline

Current Frame

(,,Normal state")

t
median

t
Signal
duration

t
Delta

t Delta

Health t Score

Health

#
median

#
Signal changes

#
Delta

# Delta

Health # Score

Score

Production data analytics
Health score aggregation vial asset trees

© 2018 SPLUNK INC.

From complex to simple:
Aggregated Health Score
Component Health Score
 Assets as nodes  Group of assets  Edge weights
determine the influence

Visualization of results
Health monitoring, predictive maintenance and root causes

© 2018 SPLUNK INC.

Automation cell AC8

Visualization:
 Using the drawings from construction plans
 Indication of the KPIs next to assets in the drawing
 Drilldown capabilities from high level into the details
 Overview on the last 10 production cycles
 Showing health monitoring KPIs, trends & anomalies based on
· Components
· Asset groups
 Integrity monitoring: configuration changes are also visualized based on components and asset groups

Analyzing production lines
Win-Win for security and efficiency

© 2018 SPLUNK INC.

Increased cyber protection

Reduction of unplanned maintenance activities

Increased availability

Reduction of operational costs

© 2018 SPLUNK INC.
Summary
Key takeaways
 You can do security monitoring und production data analytics on different layers · Layer 3&4 production data is often available already and can provide the context · Layer 1&2 data is required to cover security und production efficiency · Security monitoring: layer 1&2 are holding > 80 % of production assets · Production analytics: only layer 1&2 data allows for predictive maintenance · Use passive data collection to avoid configuration, service, guarantee discussions
 Shop floor data analytics · Use the same technology stack for production data analytics and security monitoring · Main stakeholder are the maintenance · Combine production analytics with security analytics and vice versa
 Security und production data analytics is a winning team

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

