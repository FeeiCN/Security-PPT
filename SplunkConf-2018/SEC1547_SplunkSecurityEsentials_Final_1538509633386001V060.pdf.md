© 2018 SPLUNK INC.
Splunk Security Essentials
What's New, What's Awesome
David Veuve | Principal Security Strategist

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Agenda
 Introductions ­ Who Are We, Who Are You?  What is SSE  What came in SSE 2.0 (Feb 2018)  What's come since SSE 2.0?
· New Functionality · New Use Cases  Most Underused Functionality

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Introductions

Personal Introduction

© 2018 SPLUNK INC.

 David Veuve Principal Security Strategist, Splunk
 dveuve@splunk.com  Former Splunk Customer  Apps:
· Splunk Security Essentials · SplunkJS For All · Search Activity · Newsletter · Three more

 2018 Talks:
· Splunk Security Essentials: What's New
and What's Awesome
· Go From Dashboards to Applications
With Ease: SplunkJS for NonDevelopers
· Security Ninjutsu Part Five: The Most
Advanced Content Money Can Buy
 Past Conf Experience
· 8 Talks · Delivered 11 Times · To 2800+ people

Who Are You?

© 2018 SPLUNK INC.

You're New To Splunk (or Security)  You want to jump start with working
content  You may not know where you want
to start  You may want to see how the
premium apps augment detection
 You probably don't want to invest hundreds of hours reinventing the wheel

You're Experienced with Splunk  You want useful new SPL
techniques  You want to see what's possible  You may like to come to my
sessions to heckle me
 You probably don't want to invest hundreds of hours reinventing the wheel

© 2018 SPLUNK INC.
Goal for Security Essentials and this Talk
 Collect a wide variety of great SPL in one place  Provide ready-to-adapt Splunk content  Cover the essential needs that someone getting started will have *and* the
advanced needs of our biggest customers  Make it easy to adopt this content  Make the world a more secure place

© 2018 SPLUNK INC.
What Is SSE?

Get The App

© 2018 SPLUNK INC.

https://splunkbase.splunk.com/app/3435/

125+ Examples, with 180+ Searches

© 2018 SPLUNK INC.

Each includes:  Description  Relevance  How to Implement  How to Respond  Known False
Positives  Line-by-Line SPL
Documentation  And More!

© 2018 SPLUNK INC.
Mapping of 300+ Detections from Premium Apps
 Covering: Enterprise Security, ESCU, UBA, and Pro Serv
 Mapped by Category, Maturity, Use Case, MITRE, Kill Chain, and Data Source

Splunk Security Data Journey

© 2018 SPLUNK INC.

Each Stage Includes:  Description  Milestones  Benefits  Challenges  Data Sources  Use Case Mapping

© 2018 SPLUNK INC.
What's New ­ SSE 2.0?
February 2018 Was a Big Release...

2.0 Major Features
 The Journey  Expansion of Content (GDPR, AWS, and the Basics)  Data Onboarding Guides  New Mapping of Content  It's Pretty!

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
But Why Tell You When I Can Show You?
 Insert Meme...

Journey

© 2018 SPLUNK INC.

GDPR Content

© 2018 SPLUNK INC.

AWS Content

© 2018 SPLUNK INC.

Data Onboarding Guide

© 2018 SPLUNK INC.

Mapping of Content to Frameworks

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
New Functionality Since 2.0

Content Access Enhancements
 Search Bar!  Notable Event Improvement  Link to ES and ESCU  Support for Windows TA 5.0 (*eyeroll*)
Let's Go Look!

© 2018 SPLUNK INC.

Search Bar

© 2018 SPLUNK INC.

Notable Event Improvement

© 2018 SPLUNK INC.

 When you save a notable-creating search, it will automatically move that search into the ES workspace.
 Then it will grab the search object and set the appropriate parameters that can't be passed through the normal search save dialog
 Then it will prompt you and provide a link to go edit that search in ES

Link to ES and ESCU

© 2018 SPLUNK INC.

Support for Windows TA
 Switched sourcetype=win*security to source=win*security

© 2018 SPLUNK INC.

Organizing Content
 Output content to CSV for your mapping exercises  Allows you to remember content that you find useful  Shared amongst team members  PDF Export!
Let's Go Look!

© 2018 SPLUNK INC.

Output Content to CSV

© 2018 SPLUNK INC.

Bookmark
 Bookmark content to remember it  Share it amongst your team members  Set the status  Export a PDF or CSV with that content
 Check out this video of it: https://youtu.be/W5KCn-zieDg

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
New Content Since 2.0

Content Over Time

© 2018 SPLUNK INC.

 1.0: 42 Use Cases  1.1: 42 Use Cases  1.2: 47 Use Cases  1.3: 53 Use Cases  1.4: 53 Use Cases  2.0: 94 Use Cases (AWS Pack, Basics Pack) + 200+ Mapped Premium Content  2.1: 100 Use Cases (GDPR Pack) + 200+ Mapped Premium Content  2.2: 125 Use Cases (Insider Threat Pack) + 300+ Mapped Premium Content

 Insert Meme...

Let's Go Take a Look

© 2018 SPLUNK INC.

... for the PDF copy of these slides ...
 You should go download the app!  It's pretty safe, I promise  You can also look at the content released in SSE 2.2, here:
 https://splunk.box.com/s/s5clrzia7c3c3o25tfgxi1a2ib5btc4f

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Most Underused Functionality

Viewing the Full SPL

© 2018 SPLUNK INC.

 At first glance, many may not notice that there's extensive documentation in the SPL
 Very few people actually click this (much to my chagrin)

 Spread the word!

Lookup Cache on First Time Seen

 First Time Seen detections are very easy to scale
 For most environments, for most detections, don't think twice
 "most"? Look at the size of the lookup.
· If the lookup is < 10 MB, zero impact. · If the lookup is < 100 MB, basically no impact (but double check
distsearch.conf blacklist to make sure it doesn't enter the search bundle
· If the lookup is < 500 MB, it will be slow but serviceable for daily
queries (and double check distsearch.conf)
· If the lookup is < 1000 MB, be cautious but expect success.. Maybe
test in QA first
· If the lookup is > 1000 MB, may be too big for SHC replication..
Definitely test in QA first
(all rough numbers)
 Okay, how do we take advantage of that?
 When running a query with the first time search builder, in advanced SPL mode, hit the dropdown for a lookup.

1.

1.5.

(optional)

2.

© 2018 SPLUNK INC.

Data Onboarding Guides

© 2018 SPLUNK INC.

 Even if the data is onboarded, read through to learn the best practices  You may discover something missing in your configuration!

1.

2.

Key Takeaways

© 2018 SPLUNK INC.

Download the app!
https://splunkbase.com/app/3435
Also, check out the booklet: The Essential Guide to Security
https://www.splunk.com/en_us/form/theessential-guide-to-security.html

Splunk Security Essentials provides tons of ready-made content, and mappings to Splunk's premium content

If you find sessions and apps like this useful, please rate us in the app so that Splunk provides have more people build things like this.

Other Recommended Talks
SEC1583 - Turning Security Use Cases into SPL SEC1039 - Detection Technique Deep Dive SEC1297 - Down in the Weeds, Up in the Cloud: Splunking your Azure and Office 365 SEC1355 - Hunting the Known Unknown: Microsoft Cloud
SEC1244 - Cops and Robbers: Simulating the Adversary to Test Your Splunk Security Analytics SEC1547 - Splunk Security Essentials: What's New and What's Awesome
SEC1538 - Security Ninjutsu Part Five: The Most Advanced Content Money Can Buy FN1209 - Visualize This, Mother Trucker FN1398 - Splunk and the Machine Learning Toolkit in Action: Customer Use Cases SEC1979 - Splunk Phantom at Starbucks SEC1898 - Pour Oil Not Sand Into Your Security Operations Center SEC1233 - Hacking Your SOEL: SOC Automation and Orchestration FN1913 - Old Meets New: Syslog and Splunk Connect for Kafka FN1211 - Don't Miss the Bus -- Splunking Kafka at Scale FN1184 - Unleashing Data Ingestion from Apache Kafka SEC1905 - 159 Security Use Cases in Record Time with Splunk and Kafka FN1629 - Exciting, To-Be-Announced Platform Session FN1508 - Exciting, To-Be-Announced Platform Session SEC1987 - What's New in Splunk for Security
SEC1983 - Splunk User Behavior Analytics (UBA): Methods and Best Practices to Get Started Now
SEC1275 - Monitoring and Miigating Insider Threat with Splunk Enterprise and Splunk UBA SEC1982 - Splunk UBA Tunes Down the Volume at Shentel SEC1796 - Addressing Alert Fatigue and Threat Hunting with Analytic Stories
SEC1310 - Enterprise Security Biology Revisited: Dissecting the Asset and Identity Frameworks SEC1570 - Enterprise Security Health Check
SEC1479 - Say Goodbye to Your Big Alert Pipeline, and Say Hello To Your New Risk-Based Approach

© 2018 SPLUNK INC.
Hunting / IR Hunting / IR Hunting / IR Hunting / IR Hunting / IR Hunting / IR Hunting / IR Visualizations Data Science Orchestration Orchestration Orchestration Kafka Kafka Kafka Kafka Roadmap Roadmap General Security UBA UBA UBA ES ES ES ES and Risk

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

