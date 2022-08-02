©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
How We Learned to SPL C-o-m-p-l-i-a-n-c-e
Bob Clasen (rclasen@mitre.org) | Splunk Service Manager Eugene Katz (ekatz@mitre.org) | Splunk Evangelist The MITRE Corporation
Approved for Public Release; Distribution Unlimited. Case Number 18-2525. ©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
Forward-Looking Statements
During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Overview

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

 This is a story about how we: · Started leveraging Splunk to help us with compliance reporting · Are using it today for compliance · Are planning to use it in the future

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
The MITRE Corporation

established in 1958
to serve the public interest

not-for-profit

science & tech support to federal government

part of the ecosystem of federal research centers

~8,000 employees

Speaker Info

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

Bob Clasen
 Background · Computer/electrical engineer · Retired US Air Force · At MITRE for 15 years
 Current roles · Team lead
· Enterprise systems monitoring · Performance & automated testing
· Splunk service manager
· Been Splunking for 3+ years
 Outside of work · Baseball fan · Reading · Foreign movies

Eugene Katz
 Background · Computer science · At MITRE for 19 years
· 17 years software dev · Past 1.5 years: All Splunk
 Current roles
· Bob's partner in crime Splunk service
management
· Splunk side of Compliance · Splunk Evangelist/User Advocate
 Outside of work · Tai Chi Chuan · Tabletop RPGs & Board Games

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
Background - Splunk at MITRE
 Primarily used for internal IT · Some isolated labs ­ classified, etc.
 Some stats · ~925 GB/day ingestion prod · ~300 user accounts (~80 roles)
 Use cases

Cyber security

IT operations

Compliance

The Story Begins...

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

 In late-2016, our IT staff started hearing about this new thing called DFARS
· Defense Federal Acquisition Regulation Supplement
· US Dept of Defense security requirements for federal
contractors
· Based on National Institute of Standards and Technology
Special Publication (NIST SP) 800-171

Problem
 New requirement for DFARS compliance · Initial reaction: Yikes, what is DFARS? · Some of us didn't even know how to spell compliance · But, we did know how to SPL with Splunk
 How could we leverage Splunk to help? · Could our ninja skills save the day?

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

Approach

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

 Learn more · Compliance, in general · Data already in Splunk that could be useful · Partnered with rest of our compliance team · Splunk DFARS data assessment · At this point, we knew Splunk could help
 Assessed options · Build a compliance app ourselves
· With some help from professional services
· Buy a commercial tool

Approach (cont.)
 Why build instead of buy? · Cost trade-offs · We already knew Splunk
· It was just compliance that was new
 Getting started · Services engagement to jump start · Hired dedicated person for this effort · Identified candidate controls for Splunk reporting
· Use Splunk for ~35% of DFARS controls

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

Scariest Halloween Costume

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
Implementing Compliance: Expectation vs. Reality

What we thought we were getting into

What we were actually getting into

By Barry Lewis - Mobile Home, CC BY 2.0, https://commons.wikimedia.org/w/index.php?curid=27497919

U.S. Air Force photo by Master Sgt. Greg Steele/Released) http://www.307bw.afrc.af.mil/News/Art/igphoto/2001567611/

Three-Pronged Approach
What is this NIST 800-171?
1. Review compliance controls 2. Scope what we have in our environment 3. Test queries/dashboards

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

By Illustrator unknown [Public domain], via Wikimedia Commons https://commons.wikimedia.org/wiki/File:Blind_men_and_elephant.jpg

1 Review Compliance Controls
What do we need to actually do?
priority

focus

effort

For vendor engagement, focus on big wins.

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
2 Scope What We Have in Our Environment
By Snyder, Frank R.Flickr: Miami U. Libraries - Digital Collections [No restrictions or Public domain], via Wikimedia Commons https://commons.wikimedia.org/wiki/File:Two_women_in_surveying_class_1921_(3190608803).jpg

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
3 Test Queries/Dashboards in DEV and PROD
Fnazeeri at English Wikipedia [CC BY-SA 2.5 (https://creativecommons.org/licenses/by-sa/2.5)], via Wikimedia Commons https://commons.wikimedia.org/wiki/File:Windtunnel_testing.jpg

Finding and Tracking Issues

© 2018 SPLUNK INC.

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
Finally, an App to Install!

DEV

PROD

Source Control

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
Other Considerations/Challenges Along the Way

 Which (out of thousands of) our system

have CUI?

· Subnets help, but only so much

 Campus Compliance App came out on Splunkbase

· Uses Common Information Model (CIM)

 Can we send the reports by email?

· Are they too sensitive?

· Do we need to track if they've been
reviewed?

 Do users of dashboards need to have access to all the underlying data?

· Depends

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
Your [data] scientists were so preoccupied with whether or not they could, that they didn't stop to think if they should.
Jurassic Park

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
What Does That Mean for Me?
Forewarned is forearmed
https://commons.wikimedia.org/wiki/File:Philippines_road_sign_W5-2.svg

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
Don't Expect a Drop-in Solution
 Plan accordingly  Getting all the right data and add-ons might take some work, even if it
looks like you're ingesting all the right stuff at first glance

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
There Is More Guidance out There Now

https://csrc.nist.gov/publications/detail/sp/800-171a/final

https://doi.org/10.6028/NIST.HB.162

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
There Is More Guidance out There Now (cont.)
https://doi.org/10.6028/NIST.HB.162
https://csrc.nist.gov/publications/detail/sp/800-171a/final

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
Think it All the Way Through
 What do you actually need to produce for the auditors? ­ Play pretend
 What are the correct tools for each control?  Seeing everything in Splunk is nice, but
doesn't have to be Phase 1

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
Don't Be Fooled by Pretty Dashboards
https://xkcd.com/license.html https://xkcd.com/688/
 How will each report/dashboard really get used? · How does a timechart of failed logins help you meet a control?
 It might be interesting, but is it useful for compliance?

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.
All the Best Practices Still Apply
Think: maintenance

DEV

PROD

Source Control

Next Steps for Us

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

 Continue reexamining controls and using Splunk where appropriate  Extend compliance services
· To other teams (not just internal IT) · For other types of compliance (Risk Management Framework, classified labs, etc.)

©2018 The MITRE Corporation. ALL RIGHTS RESERVED.

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

