Using Splunk to gain insights into airline safety data
FN1252
Cory Syvenky | Sr. Cloud Analyst, WestJet
September 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

CORY SYVENKY
Senior Cloud Analyst, WestJet

© 2018 SPLUNK INC.

Who is the speaker?
 I'm a Splunk Certified Power User; this is my 3rd .conf.  I'm an aspiring Data Scientist.  I'm a Licenced Private Pilot.  I work in the IT department for a major Canadian airline.  We use Splunk for Operational Intelligence.

© 2018 SPLUNK INC.
@spsavvy

What is going to be covered?

© 2018 SPLUNK INC.

Safety Data from Transport Canada and the NTSB
 Insights from plain text.  Heatmap by Date.  Clustered occurrences by Region.  Review the Canadian and American
dashboards.  Minimal conf needed to process
XML.  Use of OneDrive for data file
storage.

Data captured over-the-air via Raspberry Pi based receiver.
 Accessing data from IoT hardware.  Do commercial aircraft speed?
· By altitude and proximity to airport.  Using GPSBabel and Google Maps
for 3D visualization.  Stratux app demo of Orlando
Airport.

Why do this?
 Curiosity. Curiosity about flight safety. Curiosity about the challenge.
 Being able to combine two interests (Aviation, Data Visualizations).
 An interest in expanding my ability to gain insights from data.
 Splunk makes it easy.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Incident and accident data from Transport
Canada and the NTSB

About these Open Data Sources

© 2018 SPLUNK INC.

 Transport Canada (TC): Freely available data that I have been processing in my local Splunk environment since January `17.

 National Transportation Safety Board (NTSB): I have only recently uncovered this data set.

 Data Ingestion, being a good data steward: · receive daily summary email from TC. · automating the migration of XML data to Splunk index.

Visualizing Aviation Data
Assistance from Splunkbase add-ons makes this work easy
 Wordcloud Visualization for narrative
https://splunkbase.splunk.com/app/3212
 Calendar Heat Map Visualization for days with highest incidents
https://splunkbase.splunk.com/app/3162
 Cluster Map for occurrences by region [built-in].
 Dashboards for easy consumption.

© 2018 SPLUNK INC.

Wordcloud app for narrative field

© 2018 SPLUNK INC.

 The approach phase of flight is the most frequent cause of presence in reports (3.5 times more than the next highest cause, which is take-off).

 The narrative is in textual paragraph form from the TC investigators.

 The question:
What words show up most frequently in these reports?

 The word-cloud represents, in relative size, the frequency of words used as they pertain to the approach phase of flight.

© 2018 SPLUNK INC.
" A Cessna 172K (C-GTXA) on a flight from Nanaimo, BC
(CYCD) and landing at Nanaimo, BC (CYCD) was on final for Runway 34. A Jazz de Havilland DHC-8-301 (CGETA/JZA8271) on a flight from Vancouver Int'l, BC (CYVR) to Nanaimo, BC (CYCD) was number 2 on final and did a go around due to the slower aircraft ahead."
Source: Transport Canada CADORS

Visual Studio Code
see the structure of the data

© 2018 SPLUNK INC.

Visual Studio Code
see the structure of the data

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Insert your own screenshot here. For best results, use an image sized at 1450 x 850

© 2018 SPLUNK INC.
Calendar Heat Map visualization showing days with highest incidents
 Transport Canada recorded a total of 17,392 CADORS reports in 2017, that's a national average of 47.6 incident/accidents per day. Thus far in 2018, we are at 10,906.
 The question:
Which days had the highest amount of reports?
 We can easily get access to the days that stand out for volume levels.

Calendar Heat Map
making it easier to cluster by dates

© 2018 SPLUNK INC.

Calendar Heat Map
making it easier to cluster by dates

© 2018 SPLUNK INC.

Calendar Heat Map
making it easier to cluster by dates

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Cluster Map showing occurrences by region
 One of the categorical groupings that Transport Canada has is a data field called "TCRegion".
 The question:
After the heavy hitters were excluded from the data set, which would be the next highest?
 The frequency of occurrences for some airports is easy to guess, due to the size and the frequency of flights arriving and departing.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Not a surprise.

Thunder Bay!

© 2018 SPLUNK INC.

Stacked 100% bar chart
breaking down how each air carrier placed in each national region

© 2018 SPLUNK INC.

Stacked 100% bar chart
breaking down how each air carrier placed in each national region

© 2018 SPLUNK INC.

Stacked 100% bar chart
breaking down how each air carrier placed in each national region

© 2018 SPLUNK INC.

All CADORS Dashboard

© 2018 SPLUNK INC.

All CADORS Dashboard

© 2018 SPLUNK INC.

All NTSB Dashboard

© 2018 SPLUNK INC.

The things that make it go
 Splunk app  SPL: xmlkv, eval, rex, strptime, lookup,
geostats, xpath  inputs.conf to on-board data  props.conf to parse XML  Simple XML Dashboard  File based lookup
- OurAirports.com
 Event Types  Workflow Actions

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Automated event ingestion with Microsoft Flow

Long term storage of data
files on OneDrive

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Data captured over-theair via Raspberry Pi based receiver

About Over-the-Air Data Sources
 The Stratux device is an Automatic Dependent Surveillance-Broadcast (ADS-B) receiver made from a Raspberry Pi.
 The Project · What? A weather, traffic, GPS receiver. · How? Radio antennae capturing over the
air signals and logging to text file.
· Where? http://stratux.me

© 2018 SPLUNK INC.

Speed Analysis

© 2018 SPLUNK INC.

 The data set is 5 months worth of logs in the vicinity of Calgary International (CYYC). The data set has > 22 million events.
 I have accurate data recorded from aircraft in the vicinity which ranges from altitude and heading to aircraft identifier and speed.
 The question:
Do commercial aircraft speed?
 For the first law, the bar chart shows the various carriers that are equipped with ADS-B. For the second law, we'll use a view by Google Earth.
 Future enhancements could easily include mashups with CADORS data or mashup with for-pay service data such as FlightAware.

© 2018 SPLUNK INC.

Bar chart with speed overlay

© 2018 SPLUNK INC.

max recorded speed avg recorded speed delta between the speed limit and the average speed

© 2018 SPLUNK INC.
Using GPSBabel to isolate events based on latitude and longitude

What is GPSBabel?

© 2018 SPLUNK INC.

 "GPSBabel converts waypoints, tracks, and routes between popular GPS receivers such as Garmin or Magellan and mapping programs like Google Earth or Basecamp."
 "It also has powerful manipulation tools for such data."
 "It has been downloaded and used tens of millions of times since it was first created in 2001, so it's stable and trusted."

Integrating Google Earth
The 3-step data import process

© 2018 SPLUNK INC.

Import from CSV

Select fields with coordinates

Cast to correct data type

© 2018 SPLUNK INC.

Integrating Google Earth
The 4-step style template creation

© 2018 SPLUNK INC.

Name

Color

Icon

Height

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Stratux Demo
Take a peek at the Stratux App

Orlando (MCO) Airspace
Terminal Area Chart

© 2018 SPLUNK INC.

· There are 4
significantly sized airports and 8 smaller within 30 nm of MCO.
· Very busy airspace;
Tampa (west), Miami (south), and Kennedy Space Center (east).

The things that make it go
 Splunk app  SPL:
· eventtype · eval with case · outlier · table  props.conf to parse fields from JSON  Simple XML Dashboard  Google Earth  GPSBabel

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Takeaways

© 2018 SPLUNK INC.
1. All CADORS App
http://github.com/csyvenky/all_cadors
2. All NTSB App
https://github.com/csyvenky/all_ntsb
3. Stratux App
http://github.com/csyvenky/stratux

My Contact Info and Links

© 2018 SPLUNK INC.

 Stratux
- https://github.com/cyoung/stratux - http://stratux.me
 Splunk Addons
- https://splunkbase.splunk.com
 GPSBabel
- https://www.gpsbabel.org
 Visual Studio Code
- https://code.visualstudio.com
 Microsoft Flow
- https://flow.microsoft.com

@spsavvy
 CADORS
- http://wwwapps.tc.gc.ca/saf-sec-sur/2/cadorsscreaq/m.aspx
 National Transport Safety Board Data
- https://www.ntsb.gov/_layouts/ntsb.aviation/Index.as px
 Federal Aviation Administration Data
- https://www.faa.gov/data_research/aviation_data_sta tistics

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

