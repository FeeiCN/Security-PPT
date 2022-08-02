© 2018 SPLUNK INC.
From Speculate to Substantiate ­ Deciphering the Clues to a Monitoring System's Performance Gremlins
Glen Juback Senior Engineer ­ GE Power Process and Data Quality Improvement for Monitoring & Diagnostics
Vidhya Sagar Reddy Arumalla Systems Architect ­ Tech Mahindra

© 2018 SPLUNK INC.
Glen Juback BSME Michigan State 1983 General Motors ­ Advanced Manufacturing 1984-1996 GE Plastics ­ Manufacturing Consulting 1996-2005 GE Power - Monitoring & Diagnostics 2005 to present
Vidhya Sagar Reddy Arumalla aka Maddy MSME Clemson 2010 Project Manager for Analytics and Splunk at Tech Mahindra Splunk Solution Architect and Systems Architect at GE Power Focused on Predictive Maintenance, Automations and Integrations

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

GE Power Fleet Management Remote Monitoring & Diagnostics
Atlanta GA

© 2018 SPLUNK INC.

24 x 7 Global operations 900+ power plants 70+ countries $360MM customer value

~6000 monitored assets incl.

60,000+ operation alerts

2500+ gas turbines

9,000+ trip events

400+ steam turbines

60+ dedicated engineers

2500+ Generators

400+ supporting domain

1000+ BOP assets (HRSG's, etc.) experts

~300 Advanced Analytics

M&D Infrastructure

Plant asset with sensors

Controls

On-site monitor data

DCS

Firewall

Service orientated architecture ­ M&D Infrastructure/analytics

Asset model, site specific
condition
M&D warehouse

Analytics

Proficy historian

Central iHistorian

M&D portal/visualization

© 2018 SPLUNK INC.

Challenge
Real Time Identification of Power Plant Monitoring System Issues

© 2018 SPLUNK INC.

 Dropouts of gas and steam turbine monitoring need to minimized · Identification of specific failure point not obvious from high level metrics · Monitoring performance of databases or logging onto servers very tedious · Often failure analysis was more speculative than conclusive · Frequency and duration of issues meant long hours and weekends attempting to
resolve
· Mis-diagnosis directed efforts and funding ineffectively

Splunk Solution Step 1 of 4
Data Acquisition of Asset Operation
 Asset data is successfully being recorded at desired sample rates
 Various logs identified containing indicators of various performance issues
 Logs forwarded to Splunk server  Reports created identifying specific
modifications to be made to collection process for optimization

© 2018 SPLUNK INC.

Splunk Solution Step 2 of 4
Data Transfer from OSM to Central Servers
 Data transfer needs to be as real-time as possible
 Analytic schedulers continually query the historians for latest timestamp and record to logs
 Data transfer latency calculated from logs
 Alerts generated for assets falling behind

© 2018 SPLUNK INC.

Splunk Solution Step 3 of 4 Historian Performance
 Query performance must meet the process requirement · Analytic schedulers continually query the historians
for latest timestamp and record to logs
· Query response times are then calculated/plotted · Alerts generated for slow performance · Historian logs identify the resource causing poor
query performance
 High historian performance ensures analytics are running as near real-time as possible

© 2018 SPLUNK INC.

Splunk Solution Step 4 of 4
Analytics Execution

Analytics must execute on assets once data is available  Analytic schedulers generate logs of queued
assets  Analytic execution servers generate logs of
attempted executions  Error messages generated for failed executions  Dashboard displays analytic execution
performance vs. target  Pareto'd failure reasons drive issue resolution

Analytics

Proficy historian

© 2018 SPLUNK INC.
Central iHistorian

Continual Development
 Inclusion of additional sources of information such as support cases, database integrations
 Refinement of root cause detection and alert generation
 Application on other environments

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

