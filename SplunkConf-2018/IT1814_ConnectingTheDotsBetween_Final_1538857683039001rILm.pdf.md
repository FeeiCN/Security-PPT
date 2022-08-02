© 2018 SPLUNK INC.
Connecting the Dots Between "The Business" and IT with Splunk
Steve Baturin | Business Application Technology Mgr Raytheon Global Business Services
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
"In God we trust;
all others must bring data."
­ W. Edwards Deming
http://quotes.deming.org/authors/W._Edwards_Deming/quote/3734
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

 Data correlation  Data visualization  Data depiction

Overview

© 2018 SPLUNK INC.

Start your journey and discover where you want to go
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Definitions
 Business ­ a profit seeking enterprise engaged in goods or services  Business value ­ the assigned worth to goods or services  ITIL ­ aligns IT services and "your Business'" needs  Splunk facilitates ITIL alignment
Connect with "your Business" and increase its value

© 2018 SPLUNK INC.

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
Correlation
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Text Processing
 Aho, Weinberger, and Kernighan  stream editor  practical extraction and report language  globally search a regular expression and print
Why are you focusing on regular expressions?

© 2018 SPLUNK INC.

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

The First Aha Moment

© 2018 SPLUNK INC.

 Proposal System is a mission-critical application spread across multiple servers

 IT has no account access on production servers

 Splunk is a distributed grep

Access, search, and correlate all of your data all at once
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Correlating Logs

© 2018 SPLUNK INC.

HTTP Access Logs

JEE Server Logs

RDBMS Server Logs

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Correlating Logs

© 2018 SPLUNK INC.

HTTP Access Logs JEE Server Logs RDBMS Server Logs

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Focus on the Search

© 2018 SPLUNK INC.

Text Processing
 Correlate log data from servers  Search it

Splunk ­ creates initial correlation  Search it

Wastes time correlating

Improves searching time

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
Get notified when errors occur and reduce your outage time
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
Visualization
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Performance
 `the Business': "The system is too slow."  IT: "How fast should it be?"  `the Business': "As fast as possible!"

© 2018 SPLUNK INC.

Why are you defining system performance?
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

The Second Aha Moment

© 2018 SPLUNK INC.

 Proposal System contains a reporting system spread across multiple servers

 IT has no performance tools on production servers

 Splunk is a 4GL GUI

Visualize all of your data all at once
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Initial Report Performance

© 2018 SPLUNK INC.

reports running less than one minute reports running more than 30 minutes
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Improved Report Performance

© 2018 SPLUNK INC.

reports running less than one minute reports running less than 5 minutes
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Report Server Performance

© 2018 SPLUNK INC.

report server 1 report server 2 report server 3 report server 4
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Focus on the Visualization

© 2018 SPLUNK INC.

Excel Processing
 Correlate log data from servers  Visualize it

Splunk ­ creates initial correlation  Visualize it

Wastes time correlating

Improves visualization time

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
Get visual confirmation when your performance changes
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
Depiction
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

User Psychology
 `the Business': "It's always been done this way."

© 2018 SPLUNK INC.

Why are you engaging in your users' paradigm?
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

The Third Aha Moment
 Proposal System user base continually changes  "the Business" has no time to continually survey user sentiment  Splunk depicts user behavior

© 2018 SPLUNK INC.

With timelines, depict all of your data all at once
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
One Business Does not Use the New Page
Pricing grid is new page
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

One Business Uses the New Page

© 2018 SPLUNK INC.

Pricing grid is new page
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

One Business Barely Uses a Key Role

© 2018 SPLUNK INC.

A&D proposal role is key role
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

One Business Heavily Uses a Key Role

© 2018 SPLUNK INC.

A&D proposal role is key role
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

One Business Does not Use a New Role

© 2018 SPLUNK INC.

Business supervisor is new role
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

One Business Uses a New Role

© 2018 SPLUNK INC.

Business supervisor is new role
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Focus on the Depiction

© 2018 SPLUNK INC.

Excel Processing
 Correlate log data from servers  Depict it

Splunk ­ creates initial correlation  Depict it

Wastes time correlating

Improves depiction time

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
Get predictive confirmation when your user behavior changes
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
Connecting the Dots
This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Start Your Journey

© 2018 SPLUNK INC.

Agile Test-driven Development
Improves your TCO

Splunk Log-driven Development
Improves your Business Value

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Connect with "Your Business"

© 2018 SPLUNK INC.

Access, search, and correlate all of your data all at once

Visualize all of your data all at once

With timelines, depict all of your data all at once

Get notified when errors occur and reduce your outage time

Get visual confirmation when your performance changes

Get predictive confirmation when your user behavior changes

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

Discover Where You Want to Go
IT: "How can I increase `my Business' value?"

© 2018 SPLUNK INC.

This document does not contain technology or technical data controlled under either the U.S. International Traffic in Arms Regulations or the U.S. Export Administration Regulations.

© 2018 SPLUNK INC.
Q&A

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

