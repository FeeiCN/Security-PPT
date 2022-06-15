Low Tech is the new High Tech
Centralizing Wind Farm Monitoring amidst Development Challenges in India
Nileena Suresh & Prajakta Gurav
October 2018

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

v

NIL
Nileena Suresh Splunk Certified Consultant II

PRAJ
Prajakta Gurav Splunk Certified Consultant I

SMARTCIRQLS INFOTECH, INDIA

© 2018 SPLUNK INC.
Wind Energy in India
4th Largest Installed Capacity in the World

Wind Power in India
The Stats

© 2018 SPLUNK INC.

1.3

240

5.4

¢3.6

26

Bn
Total Population
of India

Mn
Living Without Electricity
FY 2017

GW
Record High Wind Capacity
Addition
FY 2017

per kWh
Record low levelized tariff

GW
Additional Capacity Required by
2022

© 2018 SPLUNK INC.
The Need for Transformation
A Wind Turbine Company bags > 35% of the annual capacity addition: 2000+ MW in 1 year.

© 2018 SPLUNK INC.

Priorities

Problem Set

Requirements

 Local monitoring, manual service requests.
 Alarms generated only post-failure

 Centralize Wind Farm Monitoring
 Customize rules for alarms based on sensor parameters

 Response time to remote areas > 1 day

 Predict failure before turbine downtime

 Multiple part repairs / replacements

© 2018 SPLUNK INC.
Solution
Best Practice #1 ­ What's "best" for your customer?

© 2018 SPLUNK INC.

A Standard Splunk Solution

Remote Wind Farm Site
SENSOR TAGS Nacelle-Temperature Wind Speed Power KW ...
MQTT

And its Challenges
Recommended solutions did not account for the limitations of India's on-ground realities  Connectivity to farm sites may be down
for days

Kepware Industrial Data Forwarder for Splunk
Unreliable Network Connectivity

 Accessibility issues of remote villages for skilled IT professionals
 Onsite Tech had dated DB systems. Upgrading required extensive effort.

Preventative Centralized Custom Maintenance Operations Alerts
Central Monitoring Site

© 2018 SPLUNK INC.

Implemented Splunk Solution

The India operations team took the initiative to find a creative and viable solution

Remote Wind Farm Site

SENSOR TAGS Nacelle-Temperature
Wind Speed
Power KW ...

Priorities for the Customer
 Local Team familiar with the limitations of the development landscape.

MQTT

 Minimal / no disruption to the existing

onsite architecture at wind farms.

Local Database

 Splunk skills not needed at wind farm sites. Only at central site.

FTP to Centralized Database

 POC in Production Architecture for 1 live wind farm - 20 Turbines x 18 tags x10 min intervals, using DB Connect.

Preventative Centralized Custom Maintenance Operations Alerts
Central Monitoring Site

Data Collection
Local Monitoring of Turbine Sensors via SCADA

© 2018 SPLUNK INC.

Each Turbine Sends  80 Parameter Tags  3 Status Tags (x 10 min intervals)

SCADA ­ WIND TURBINE CONTROL
SYSTEM

Wind Farm Monitoring
Main Dashboard for Centralized Operations Centre

© 2018 SPLUNK INC.

 List of Wind Farms that have turbine problems
 Drill Down to Turbines with problematic parameters
 Histogram of deviation per parameter from its 7day Farm-avg.

Wind Farm Monitoring
Alerting & Prediction

© 2018 SPLUNK INC.

 Alerts for 3rd deviation of any parameter or combination of parameters predict turbine failure before it occurs.
 Solution scaled to
· 100 farms
· 25-50 turbines per
farm
· 80 parameters per
turbine

© 2018 SPLUNK INC.
Impact
Pan ­ India Centralized Monitoring in 3 weeks

Path to Success

© 2018 SPLUNK INC.

 First failure prediction in the POC demo itself.
 Savings from this incident justified entire Phase 1 cost.
Return on Investment even before the project started.

 Cyclone Vardah rips up the country's undersea cables in Dec 2016.
 Splunk restoration within hours of connectivity.
Viability proved in the aftermath of Cyclone Vardah.

 No upgrading of tech at local farm sites.
 Quick setup and easy maintenance at central site.
Time to market: 3 weeks

#WIN

© 2018 SPLUNK INC.
1. 2 Year ROI achieved during POC. 2. Low Tech, Low Cost Architecture proved
to be stable and viable.
3. Centralized Wind Farm Monitoring in 3
weeks.
4. Expansion for substation-wise power
loss monitoring

#WIN

© 2018 SPLUNK INC.
April 2018 100% Electrification of inhabited villages Target: March 2019 100% household electrification

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

