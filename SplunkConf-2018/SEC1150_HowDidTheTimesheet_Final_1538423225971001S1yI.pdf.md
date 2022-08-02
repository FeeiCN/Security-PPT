How Did the Timesheet Catch the Spy?
Joke or the downfall of the insider threat
Ben Lovley | Network Forensics - Ministry of Defence (MoD)

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Our Speakers

© 2018 SPLUNK INC.

v

BEN LOVLEY

ANDREW `MAC' MCALLISTER

Network Forensics, Incident Response and Enterprise Threat Hunt

Customer Success - UK Public Sector

MODERATED BY GREEN TRACKSUIT

Ben Lovely
MoD Network Forensics & Hunt analyst
 2,5 Years lead Forensic analyst · Covering Network, Mobile forensics as
well as Enterprise Threat Hunt
 10+ Years working in MoD cyber  3 Years active Splunk use from
analysis through to Architecture  IoT nnthusiast  Keen motorcyclist!

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Andrew `Mac' McAllister
 Splunk Customer Success · Management - UK Public Sector
 10+ years in the UK military  Weapons Engineering  TOGAF-Certified Enterprise Architect  Chartered Engineer

Slide in the middle
Centre of Excellence and Innovation

© 2017 SPLUNK INC.

Slide in the middle
Centre of Excellence and Innovation

© 2017 SPLUNK INC.

 Shorten the Feedback Loop  Decrease Wasted Cycles  Increase Innovation  Increase Trust  Become a hero!

...Which Has Enabled New Thinking
Within a single customer
 The next iteration: cross-correlation with timesheets, logins
 Redundant network ports  Cooling Fan Failures  Enterprise Power and Environmental Analytics  Splunk in Your Pocket  Raspberry Pi Desk Utilization

© 2017 SPLUNK INC.

© 2018 SPLUNK INC.
Time Recording & Security
The basic setup

How Did the Timesheet Catch the Spy?
Joke or the downfall of the insider threat
 Nearly all enterprises from big to small require employees to account for their time for a magnitude of reasons
 The objective is to utilise current hardware deployments (CYOD/BYOD) to capture this information, push it to Splunk and transform it into intelligence
 Meaning no more filling in time sheets manually!

© 2018 SPLUNK INC.

The Big Idea
Using hardware the user already has

© 2018 SPLUNK INC.

Capture data from deployed hardware

Push the data to Splunk

Splunk Enterprise indexes data and
generates intelligence

Intelligence used to capture the inside threat. Operations
can continue

Why This...
Unlike other projects, its "not just because I can"
 Personnel Security
· Real-time geo-fencing data is ideal to aid in
protection of personnel and the threat towards them
· E-privacy
 Time Management
· Overtime, annual leave, sickness etc. these
can all be calculated without the user interacting with time sheets
· Anomalies in behaviour can be examined
deeper
 Money Saving
· See what rooms are being used and where the
power can be saved

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Hardware and Software
The basic setup

Hardware
Smartwatches Smartphones
Tablets

© 2018 SPLUNK INC.

Software / Application
The smart part

© 2018 SPLUNK INC.

 Not strictly Software, IFTTT is an app · If This Then That
 Create custom chains of conditional statements
· Automate tasks
- Such as Geo fence locations
 First thing to do is choose If This

© 2018 SPLUNK INC.
 Many apps to choose from
 Can use device functions · Location, SMS etc

© 2018 SPLUNK INC.
 Choose location

© 2018 SPLUNK INC.
 3 options · Enter · Exit · Enter or Exit

© 2018 SPLUNK INC.
 Select area to use as geo fence

© 2018 SPLUNK INC.
 Can zoom to good scale for finer area

© 2018 SPLUNK INC.
 Now this is done its time to choose that · The action for IFTTT to
take

© 2018 SPLUNK INC.
 Choose Google Sheet · Details of Google drive
need to be entered

© 2018 SPLUNK INC.
 2 options · Add row · Update cell

© 2018 SPLUNK INC.
 Customise the Google sheet · Name of document · Details to be entered
by IFTTT
· Location of document

The Output
CSV with the chosen data

© 2018 SPLUNK INC.
 Using the settings previously, this is what you would get · 2 columns
· Date and Time · Event

© 2018 SPLUNK INC.
Now the Splunk magic
Indexing, Formating and Analysing

The Splunk Part

© 2018 SPLUNK INC.

All sorts of intelligence can be generated with the simple CSV generated

 The data from the CSV can be manipulated to give you so much detailed data, such as:
· Entry time · Exit time · Overtime calculations · Average working hours · Unusual work times · Visually stunning graphics for the hierarchy
The main point is....Unusual working hours!
I will show you how this simple CSV can highlight unusual behaviour and can be alerted on for further analysis

The Basics
Google sheet is indexed as CSV

© 2018 SPLUNK INC.

 Data added as CSV using standard `add data'
 Simple 2 columns

Step 1

© 2018 SPLUNK INC.
 First thing to do is transaction the events · Enter work · Exit work · = one transaction

Step 2

© 2018 SPLUNK INC.
 Work out total hours per transaction · Create new field of
day_total
· Uses duration divided
by seconds in a day

Step 3

© 2018 SPLUNK INC.
 Ensure good transactions are shown · closed_txn=1
 1 day = sum of day_total and renamed to Total

Step 4

© 2018 SPLUNK INC.
 Calculate the last 30 days total
 Work out average amount of hours · Average can be used
to get overall view of time present in a set period

Step 5

© 2018 SPLUNK INC.
 Tidy up by rounding the numbers
 Work out if they have been in or not (weekends)

Step 6

© 2018 SPLUNK INC.
 Calculate average of of worked time · Not including
weekends and leave etc

Step 7

© 2018 SPLUNK INC.
 Add condition to only class a work day as more than two hours · Personal setting for my
time but can be changed to anything
 Then round the average to a useable number

Step 8

© 2018 SPLUNK INC.
 Beautify the results with some renames

Results

© 2018 SPLUNK INC.
 Now we have useable data for working stats

Why Stop There!

© 2018 SPLUNK INC.

 Using the same data and a mix of other Splunk commands · If functions · Time formatting · Avg · list
 A more detailed view can be achieved

More Detail...

© 2018 SPLUNK INC.

 A more detailed table can be created

Visually Better

© 2018 SPLUNK INC.

 Leading to a more visually pleasing chart of the users working hours

Easier To Understand

© 2018 SPLUNK INC.

 Not only is it visually better
 It can also be used to highlight data you may want to set alerts for
 For example, we have an above average time with a visible peak in out of hours presence

The So What...

© 2018 SPLUNK INC.

 This peak shows that the user was present in work out side of the times set for the users normal working day · What was the user doing · Should they be in at that time · Why are they in 2 hours longer than normal · Insider threat???
 How about: · Exfil · Log deletion · Implant
All is not lost! You can alert to this potential threat potentially before it happens

Alerts

© 2018 SPLUNK INC.
 Looking at behaviour of their normal working hours
 Alerts can be generated for anything out of the norm

What About Way Points

© 2018 SPLUNK INC.

 Using the IFTTT and the recording setup, its also possible to set way points of a route taken.
 Think about:
· Personnel at risk of kidnap · Security vans · Routine movement of company property

Future Plans

© 2018 SPLUNK INC.

Going forward with the project

 In its current version, time recording is done with IFTTT, the plan to go forward is: · Create separate application for iOS and Android and place in App Stores · Feed data directly in to Splunk, not via CSV monitor · Link alerting to mail server · Manager app
· See live data for manager perspective
· Health and safety - Fire evacuation, who is where
 Create a TA for Splunk to partner with the App from the app store, the benefits of this would be: · Pre built dashboards displaying key information · Simple alerting so key security concerns can be received as soon as possible

Cross industry utility

© 2018 SPLUNK INC.

Where else can this be used...

 The time recording app and TA would not only benefit security teams, but what about... · Automotive - Where are the vehicles = Where should new charging points be · Hours in hospital for surgeons - tired surgeon, error in surgery · Professional drivers - Leave the depot, are they resting? · Education - Are students attending lectures? · Staff of interest - Is kidnap a risk at your organisation · Basically anything with a GPS signal.....

The possibilities are endless for location based monitoring in Splunk, if it isn't normal behaviour, what is it??

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Any Questions?
Thank You

© 2018 SPLUNK INC.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

