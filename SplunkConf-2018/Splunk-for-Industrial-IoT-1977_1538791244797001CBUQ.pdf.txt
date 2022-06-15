Splunk for Industrial IoT:
Taking Your Operation from Reactive to Data-Driven
Erick Dean | Director of Product Management - IoT
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

OUR MISSION
© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

What is Machine Data?
MANUFACTURING
Operational technology (OT) and Sensor data Industrial controls, SCADA, actuator and other equipment IDC estimates that by 2025, more than a quarter of data created in the global datasphere will be real time in nature, and real-time IoT data will constitute more than 95% of this.
Work order data Alarms, location and inventory data Maintenance work order processes need to be defined and managed as an integrated part of the production order, materials procurement and logistics processes.
Security data Firewall data, endpoint data A 2018 security study revealed 147 vulnerabilities in 34 separate SCADA mobile applications.

© 2018 SPLUNK INC.

© 2 0©12801S8PSLPULNUKNKI NINCC..
Industrial Data Contains Critical Insights

SOURCES
Alarms and Events
Work Order
Sensor Data

05/27/2014T10:24:17GMT applicationId="safetyObs" eventType="safety" assetID="CV1002384-1045" employeeId="114635" jobSite="PLEC-2014-GC" observationId="184568-451124-256" observation="Control Valve handle extracted to manual position. No lockout/tagout or other tag visible. Process is running." observationCriticality="5" imageId="PLEC-2014-GC-184568-451124-256" imageUri="https://mybucket.s3.amazonaws.com/PLEC-2014-GC-184568-451124-256.png"
1543541, workorder, bsic, 78544, pipefitting, CV1002384, "install manual bleed bypass", 04/13/2014, 05/21/2014, 25663, complete
05/22/2014 03:17:31 Tag="CV1002384.ValvePos" Value="50" Quality="Good" 05/22/2014 03:17:46 Tag="CV1002384.ValveCmd" Value="100" Quality="Good" 05/22/2014 03:19:22 Tag="CV1002384.ValveCmd" Value="100" Quality="Good" 05/22/2014 03:19:27 Tag="CV1002384.ValvePos" Value="50" Quality="Bad"

© 2 0©12801S8PSLPULNUKNKI NINCC..
Industrial Data Contains Critical Insights

SOURCES
Alarms and Events
Work Order
Sensor Data

Alarm Date

Alarm Type

Asset ID

05/27/2014T10:24:17GMT applicationId="safetyObs" eventType="safety" assetID="CV1002384-1045" employeeId="114635" jobSite="PLEC-2014-GC" observationId="184568-451124-256" observation="Control Valve handle extracted to manual position. No lockout/tagout or other tag visible. Process is running." observationCriticality="5" imageId="PLEC-2014-GC-184568-451124-256" imageUri="https://mybucket.s3.amazonaws.com/PLEC-2014-GC-184568-451124-256.png"

1543541, workorder, bsic, 78544, pipefitting, CV1002384, "install manual bleed bypass", 04/13/2014, 05/21/2014, 25663, complete

05/22/2014 03:17:31 Tag="CV1002384.ValvePos" Value="50" Quality="Good" 05/22/2014 03:17:46 Tag="CV1002384.ValveCmd" Value="100" Quality="Good" 05/22/2014 03:19:22 Tag="CV1002384.ValveCmd" Value="100" Quality="Good" 05/22/2014 03:19:27 Tag="CV1002384.ValvePos" Value="50" Quality="Bad"

© 2 0©12801S8PSLPULNUKNKI NINCC..
Industrial Data Contains Critical Insights

SOURCES
Alarms and Events
Work Order
Sensor Data

Alarm Date

Alarm Type

Asset ID

05/27/2014T10:24:17GMT applicationId="safetyObs" eventType="safety" assetID="CV1002384-1045" employeeId="114635" jobSite="PLEC-2014-GC" observationId="184568-451124-256" observation="Control Valve handle extracted to manual position. No lockout/tagout or other tag visible. Process is running." observationCriticality="5" imageId="PLEC-2014-GC-184568-451124-256" imageUri="https://mybucket.s3.amazonaws.com/PLEC-2014-GC-184568-451124-256.png"

Technician

Asset ID

Completed

1543541, workorder, bsic, 78544, pipefitting, CV1002384, "install manual bleed bypass", 04/13/2014, 05/21/2014, 25663, complete

05/22/2014 03:17:31 Tag="CV1002384.ValvePos" Value="50" Quality="Good" 05/22/2014 03:17:46 Tag="CV1002384.ValveCmd" Value="100" Quality="Good" 05/22/2014 03:19:22 Tag="CV1002384.ValveCmd" Value="100" Quality="Good" 05/22/2014 03:19:27 Tag="CV1002384.ValvePos" Value="50" Quality="Bad"

© 2018 SPLUNK INC.
Industrial Data Contains Critical Insights

SOURCES
Alarms and Events
Work Order
Sensor Data

Alarm Date

Alarm Type

Asset ID

05/27/2014T10:24:17GMT applicationId="safetyObs" eventType="safety" assetID="CV1002384-1045" employeeId="114635" jobSite="PLEC-2014-GC" observationId="184568-451124-256" observation="Control Valve handle extracted to manual position. No lockout/tagout or other tag visible. Process is running." observationCriticality="5" imageId="PLEC-2014-GC-184568-451124-256" imageUri="https://mybucket.s3.amazonaws.com/PLEC-2014-GC-184568-451124-256.png"

Technician

Asset ID

Completed

1543541, workorder, bsic, 78544, pipefitting, CV1002384, "install manual bleed bypass", 04/13/2014, 05/21/2014, 25663, complete

MTBF

Asset ID

Quality

05/22/2014 03:17:31 Tag="CV1002384.ValvePos" Value="50" Quality="Good" 05/22/2014 03:17:46 Tag="CV1002384.ValveCmd" Value="100" Quality="Good" 05/22/2014 03:19:22 Tag="CV1002384.ValveCmd" Value="100" Quality="Good" 05/22/2014 03:19:27 Tag="CV1002384.ValvePos" Value="50" Quality="Bad"

© 2018 SPLUNK INC.
Factories of the Future Need Operational Intelligence to Survive and Compete

REAL-TIME MONITORING

PREDICTIVE ANALYTICS

OT SECURITY

Data aggregation across disparate systems

Condition based and predictive maintenance to
reduce costs

Mitigating cyber security risks due to outdated software and controls

Splunk for Industrial IoT
Real-time visibility and predictive analytics

© 2018 SPLUNK INC.

Real-time Monitoring

Diagnostics and Troubleshooting

OT Security

Predictive Maintenance

Industrial Asset Intelligence

Search and Reporting

Machine Learning

Platform for Machine Data
Data Integrations (OPC, MQTT, Kepware, OSIsoft..)

Sensor (metric) data

Unstructured (event) data

© 2018 SPLUNK INC.
Enhance Visibility of Industrial Control Systems

Gain real-time visibility of SCADA applications Set alerts on key metrics. Proactively discover system issues before they result in production downtime.
Improve reliability of critical software and systems Catch performance issues before they happen with advanced warnings and early detection mechanisms.
When issues happen, resolve them quickly Advanced search and investigation techniques drive better troubleshooting of problems.

Splunk Search & Reporting Application

Leverage Advanced Analytics to Stay One Step Ahead

© 2018 SPLUNK INC.

Splunk Machine Learning Toolkit (MLTK)

Build custom machine learning models
Choose from dozens of ML algorithms to develop a model that fits your use case

Actionable intelligence
Operationalize the machine learning process of collecting and analyzing data, training data models, and continuous monitoring.

Forecast and predict operational issues
Be prepared for when equipment is close to failure or yields are likely to drop

Improve Availability and Performance of Industrial Assets

© 2018 SPLUNK INC.

Splunk Industrial Asset Intelligence (IAI)

Gain real-time visibility across the operation
Monitor and analyze silos of data that span historians, SCADA, EAM, purchasing and inventory

Give engineers the ability to quickly diagnose issues
Simple visualization of disparate data allows engineers to quickly pinpoint root cause of issues

Customize for diverse set of operations
Build custom visualizations, create complex formulas, and set real-time alerts without the need for programming

Feature

Description

© 2018 SPLUNK INC.

Key Features of Splunk Industrial Asset Intelligence

1

Asset Hierarchy

Build asset hierarchies and associate data to individual assets from disparate data sources

2 Asset Groups

Create & replicate visualizations, custom formulas, KPIs and alerts across fleets/groups of assets

3 Formula Builder

Create complex calculations without using SPL

4 Conditions & Actions

Set Splunk conditions (e.g., thresholds) and alerts (e.g., SMS, email) via a graphical UI tool

5 Spatial View

Develop visualizations of an asset, process, or system via a drag and drop editor

6 Analyze View

Perform ad-hoc analysis of time-series data to troubleshoot process or equipment issues

© 2018 SPLUNK INC.
Demo

 TRANSPORTATION

© 2018 SPLUNK INC.

Real-time Fleet Analytics and Smart Asset Management

· Correlates onboard telematics, sensor and geolocation data
· Improved locomotive availability and reduced downtime drives better customer service and lowers maintenance costs
· Real-time view into locomotive health enables condition monitoring

 ENERGY

© 2018 SPLUNK INC.

Infigen Predicts Turbine Behavior and Maintenance Across 6 Wind Farms

· Monitors wind turbines and energy production across 3 wind farms
· Ensures uptime and availability of critical automated SCADA systems
· Real-time insights into revenue generated and projected energy production

 MANUFACTURING

© 2018 SPLUNK INC.

Shaw Breaks Production Records with Splunk IoT

· Real-time insights into manufacturing processes by correlating equipment, production and inventory data
· Improved operator support and training by analyzing shift times
· Increased equipment reliability, product quality and reduced costs

Shaw Industries

© 2018 SPLUNK INC.

Video

Splunk for Industrial IoT

© 2018 SPLUNK INC.
A single place to store, access and analyze all your industrial data
Monitoring platform to ensure reliability of critical assets and systems Security platform for protecting critical assets and the control systems that monitor them
Machine-learning ready platform for predictive analytics

© 2018 SPLUNK INC.
Q&A

Spatial View

© 2018 SPLUNK INC.

Spatial View (Edit)

© 2018 SPLUNK INC.

Analyze View

© 2018 SPLUNK INC.

Formula Builder

© 2018 SPLUNK INC.

Conditions & Actions

© 2018 SPLUNK INC.

