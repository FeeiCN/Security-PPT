Digital Transformation in Manufacturing
How to Adopt Machine Learning Without Costly Tech Migrations
Brian Bates | Greg Baumgardner Stimson Lumber Co.
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

 Brian Bates · Stimson Lumber Co. · Portland OR · Engineering Manager · Splunker since 2015

Speakers
 Greg Baumgardner · Stimson Lumber Co. · Portland OR · IT Director · Splunker since 2017

© 2018 SPLUNK INC.

Stimson Lumber Co.
Portland Ore.

© 2018 SPLUNK INC.

 160+ year family run, private company | 500,000+ acres managed forest lands  Operations spanning the Pacific Northwest  Seven manufacturing operations, six sites, rural locations
· Stud milled lumber | Structural timbers | Hardboard panels  Participant and supporter of Sustainable Forestry Initiative® (SFI)

© 2018 SPLUNK INC.
Problem? What Problem?
Background

Problem Statement
Our executive directive

© 2018 SPLUNK INC.

 Pursue an analytics strategy to generate value as soon as possible while aligning with the company initiative of maintenance standardization and focusing on these core objectives:

· Improve quality

· Decrease unscheduled equipment downtime

· Increase production volume

Industrial Battleground
It's a jungle out there!
 Either run to failure and react or prevent by changing on interval.
 Enhanced thermography program over the last several years.
 Honing in on the PdM zone.
 Knowing is half most of the battle!

© 2018 SPLUNK INC.

Stimson Lumber and Machine Learning
Why we want big data

© 2018 SPLUNK INC.

Downtime is Expensive

Improving Operational Efficiencies

Discovering New Potentials

What we need..

© 2018 SPLUNK INC.

 We need to mature the maintenance strategy · Skilled labor remains a constraint · Greater visibility to asset condition · Leverage existing data · Automated decision making

 Extended service intervals decreases cost
 Knowing when large assets need to be replaced save down time during procurement
 Converting unscheduled downtime to scheduled increases labor and machine efficiencies

Traditional Mindset
What are the issues with that?

© 2018 SPLUNK INC.

 Migrate entire industrial control system
 Consolidate data to use custom ML software

 ICS migrations shouldn't be a requirement to enable ML/AI benefits

 Then develop ML/AI techniques to discover benefits
 Thank you for calling tech support. Please wait.......

 We need to integrate ML/AI now · Teams are lean · Multiple OEMs, protocols · Flexible and scalable

Our Thought Process
What works for our team...

© 2018 SPLUNK INC.

Factory

Hypervisor

Flexible Applications

=

Cost Savings

Innovation

Implementation
Pilot program in several sites

© 2018 SPLUNK INC.

Corporate Strategy

Gaston Plant

Tillamook Plant

Process Analysis Outlier Detection

Environmental Data Modeling

Asset Analytics/ Custom
Dashboards

Real Time Maintenance
Monitoring

 Real time asset monitoring ­ detection before thermography, automatically
 Analytics and dashboards correlating information faster
 Detecting outliers autonomously and measuring their impact with data
 Maintenance teams react faster and better prioritize continuous improvement

Increase Production Volume
A smooth process is a happy process

© 2018 SPLUNK INC.

Corporate Strategy

Gaston Plant

Tillamook Plant

Process Analysis Outlier Detection

Environmental Data Modeling

Asset Analytics/ Custom
Dashboards

Real Time Maintenance
Monitoring

 Constant monitor on compressed air · Most process steps rely on centralized CDA system (Clean
Dry Air)
· Variation in the trunk line pressures can be caused by
certain combinations of pneumatic actions.
· These variations can cause slow or incomplete movements
which in tern causes lumber to jamb in the transport lines.
 Outliers are automatically recorded with the ML Took Kit, timestamped and populated in a SQL table.
 Downtime reports are correlated during continuous improvement meetings to investigate the need for upgrades to the system or improvements in sequencing.

© 2018 SPLUNK INC.
Reduce Unscheduled Equipment Downtime
Tillamook Real Time Monitoring

Corporate Strategy

Gaston Plant

Tillamook Plant

Process Analysis Outlier Detection

Environmental Data Modeling

Asset Analytics/ Custom
Dashboards

Real Time Maintenance
Monitoring

 Real time monitoring VFD amperage changes · Measuring the change in VFD (Variable Frequency Drive)
amperage draw may indicate an increase in mechanical drag ­ failing components
· VFD amperage levels are recorded and displayed on a
dashboard for real time investigation during erratic behavior of rotating assembly
· Upper and lower ranges are calculated for later correlation
 Using DB Connect and ML Took Kit apps, the change in maximum and minimum amperage draws are logged and assessed
 We're looking for pattern in assemblies that wear faster than the expected PM schedule, reducing the corrective maintenance time.

Getting the Data
Tillamook Pilot

© 2018 SPLUNK INC.

 Kepware extracting PLC values and forwarding to Splunk
 Visualizing and isolating exactly what needs to be analyzed in sawmill date.

Analysis
Tillamook Pilot

© 2018 SPLUNK INC.
 Uploading hourly (or whenever possible) data to SQL
 Extraction for analysis

End Result
Planning for maintenance ­ keeping things running

© 2018 SPLUNK INC.

 Visualizing the wear
 Predicting the time to failure
 Getting more items on the schedule

What the future looks like
This is where the subtitle goes
 Continue gathering data and analyzing for a predictive function  Continue the rapid deployment of IIOT in vibration and temperature  Continue experimenting with PLC ­ Big Data relationships  Reduce data consumption at indexer  Learn, learn, learn!

© 2018 SPLUNK INC.

Mobile Data
Plant & Device OEE

© 2018 SPLUNK INC.

Ramp of Operator-less
Stations
Visualizing Production with Auto

© 2018 SPLUNK INC.

Dark Sky API
Correlating weather with operations

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Key Takeaways
Industrial ML

1. Machine learning benefits do not require
complete ICS retrofit!
2. Close the IT/OT gap ­ don't perpetuate
it!
3. Go forth and explore ideas ­ the
resulting innovation is the immediate return!

© 2018 SPLUNK INC.
Questions?

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

