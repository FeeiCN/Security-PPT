© 2 0©12801S8PSLPULNUKNKI NINCC..
"Looking under the hood" of complex Murex Dashboards
Creating fast Splunk dashboards for a user friendly experience
Robert Lynch (Splunk Revolution award winner Ninja 2017) | Murex October 2018

Disclaimer

© 2018 SPLUNK INC.

 Copyright © 2018 Murex S.A.S. All rights reserved. All intellectual property rights and other proprietary rights in and associated with the whole and every part of this presentation (including all text, logos, graphics and images) shall at all times remain vested in Murex S.A.S. or its affiliates and shall not be used without Murex's express authorization. You shall do all that is necessary to protect Murex's rights, including but not limited to, taking all measures necessary to keep the content of this presentation confidential and not, directly or indirectly, using or divulging, or allowing to be used or divulged such presentation to or by any third party. In addition, you shall not reproduce, copy, distribute, republish, download, display, post or transmit this presentation or any part thereof in any form or by any means whatsoever. The information in this presentation is provided by Murex "as is" and without any representation or warranty, express or implied, including with respect to accuracy or completeness. Any unauthorised use of any content contained in this presentation may violate copyright laws, trademark laws, the laws of privacy and publicity, and communications regulations and statutes. If you are aware of any unauthorised use affecting our rights and interests in and associated with this document, you will immediately notify Murex S.A.S..

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are updatesmarks and registered updatesmarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or updatesmarks belong to their respective owners. © 2017 Splunk Inc. All rights reserved.

Agenda

© 2018 SPLUNK INC.

 Who is Robert Lynch?  A little about Murex  What was the problem?  What was the solution!
· Architecture discussions
· What does the SPL look like
· "Post-process search" vs. "Where clause"
· Don't forget we are human!

Who Am I ?
 Name: · Robert Lynch
 Current Position: · Global Splunk Manager @ Murex · Non-Functional Test Manager @ Murex
 History: · 2017 Splunk Revolution Ninja Award Winner · Masters "High Performance Computing" · 14 years working at Murex in Non-Functional Testing · Introduced Splunk to Murex 4 Years

© 2018 SPLUNK INC.

A little about Murex

© 2018 SPLUNK INC.

 Murex is a leading software vendor in the provision of integrated solutions for front

office, back office and risk management for the capital markets industry

40,000+ users

3 REGIONAL HUBS, 17 OFFICES COVERING ALL TIME ZONES

65 countries

SANTIAGO

TORONTO
NEW YORK

MOSCOW LONDON
LUXEMBOURG

DUBLIN
PARIS

BEIRUT

SAO PAULO

BEIJING

DUBAI

SEOUL TOKYO HONG KONG

SINGAPORE

65
COUNTRIES
45,000+
USERS
SYDNEY

What was the Problem?
 MxTiming is a Performance log that is produced over multiple machines  Millions of files, each containing thousands of lines of data

© 2018 SPLUNK INC.

Server 1 Mxtiming.log

Murex End User

Electronic trading

Nightly Recalculation of
markets

Mxtiming.log

Server 2

Mxtiming.log

Mxtiming.log

Mxtiming.log Server N
Mxtiming.log

What was the solution?
 Bring all the Data into 2 main Data models
· Create Multiple "Extracted" fields · Create Multiple "Calculated" fields
(performance)
· NO data is perfect so do the
work at the data model level not in real time.
· Accelerate the Data models for
speed
· In one week we can have billions
of lines of data  Start developing a dashboard that any
user can use (Developers, Testers..etc)
· Has to be fast, easy to use and
users have to help you make it.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Introducing MxTiming Dashboard

© 2018 SPLUNK INC.

 Introducing MxTiming Dashboard
· 8 Global dropdowns · 12 searches running in parallel
 Initial Architecture
· All searches ran separately (Difficult to manage SPL for new updates)
 Current Architecture
· 2 Base searches · "Post-process search" vs. "where clause" · Human readable Tags (Lookup tables)

Initial Architecture

Log Files

Data Model MXTIMING

Forwarder

Log Files

Data Model Services

Drop Downs Tokens Set

Search with Join and Lookup
Search with Join and Lookup
Search with Join and Lookup
Search with Join and Lookup
Search with Join and Lookup
Search with Join and Lookup

Drop Downs Tokens Set
Drop Downs Tokens Set
Drop Downs Tokens Set
Pie Chart Alt
Pie Chart
Bar Chart

© 2018 SPLUNK INC.
End User

Current Architecture
Drop Downs Tokens Set

Drop Downs Tokens Set

Drop Downs Tokens Set

Log Files

Data Model MXTIMING

Forwarder

Log Files

Data Model Services

Base Search 1 From Data Model 1

Post Filters

Post Filters

Post Filters

Base Search 2 Joining
Data model 2

Lookup Tables ­ Human Readable
SPLs

Post Filters

Post Filters

Post Filters

Pie Chart Alt

Pie Chart

Bar Chart

© 2018 SPLUNK INC.
End User

What does the SPL look like?

© 2018 SPLUNK INC.

1st Base search tstats command on data model Gets most of the data
2nd Base search Uses 1st Base and a Join on second data model 2 tokens can be updated Re-driving only 2nd Base search
Post-process search to filter

"Post-process search" vs. "Where clause"
 Initially, we used filtering clauses (Where) in 12 different Splunk searches · E.G User = MUREXBO, CONFIG...MUREXFO -
 For GUI performance reasons use a Post-process search

© 2018 SPLUNK INC.

Don't forget we are human!

© 2018 SPLUNK INC.

 The data inside the log files can be very technical and not human readable · People find it hard to understand and wont use the system
 By creating an interactive Tagging system (lookup tables), people can update the data by themselves to display · Developer's Code -> Human Readable Data

© 2018 SPLUNK INC.

What does the SPL look like?
 The lookups are in the second base search

© 2018 SPLUNK INC.

 If there is an update in the second base search, it won't rerun the 1st base search

Conclusion SPLUNK "MXTIMING"
Problem:
· We needed to View Millions and Millions of MXTIMING Tracing quickly
 Solution: · Using Data models ....15 Million Lines of Data (Sliced and Diced) in 15 seconds!!
Problem:
· Updating 12 searches in the SPL was difficult
 Solution: · Bringing together all searches to 2 base searches is easer to manage
Problem
· The Data was not human readable
 Solution: · Using lookups we made it an open system to add Human Tags

© 2018 SPLUNK INC.

Thank You

PARIS 8 rue Bellini 75782 Paris cedex 16
FRANCE Tel + 33 1 4405 3200

NEW YORK 810 Seventh Avenue - 14th
floor New York, NY 10019
USA Tel +1 212 381 4300

SINGAPORE 10 Marina Boulevard #19-01 Marina Bay Financial Centre Tower
2 SINGAPORE 018983 Tel + 65 6216 02 88

linkedin.com/company/Murex twitter.com/Murex_Group

www.Murex.com
info@Murex.com

Murex: Leading Vendor in Financial Software

© 2018 SPLUNK INC.

 Murex is a leading vendor in the provision of integrated solutions for front office, back office and risk management for the capital markets industry
· 32 years dedicated to our domain and clients · Around 50,000 users and 250+ clients in 65 countries · 3 Regional Hubs , 17 offices covering all time zones · Staff of 2,200, over 60 nationalities · Revenue of USD 580 Million in 2017 · Over USD 1 billion invested in R&D over the last 10 years · #1 Overall Vendor: Risk Magazine Technology Awards 2017 · #7 in Chartis RiskTech100 for 2017 (highest ranked non-US headquartered company)

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

