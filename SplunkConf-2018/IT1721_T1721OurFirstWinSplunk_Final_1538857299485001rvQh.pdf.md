© 2018 SPLUNK INC.
T1721 - Our First Win With Splunk
Finding and Remediating a Subtle Problem in an Atlassian Jira App
Christopher Pepe, Dragon of the West/CTO pepeca@praecipio.com
October 2018

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Christopher Pepe
Dragon of the West, CTO Praecipio Consulting

© 2018 SPLUNK INC.
Type to enter a caption.

© 2018 SPLUNK INC.
A DevOps Story
Many smalls is better than one big

Complex Automation
Makes for an exciting talk
 Automation is the last step in DevOps · Well, really its a loop · Infinity, or is it a moebius strip?
 Requires mastery of domain first

© 2018 SPLUNK INC.

AWS DevOps blog,https://amzn.to/2MEk8bk

© 2018 SPLUNK INC.
"DevOps stresses communication,
collaboration and integration between software developers and other stakeholders in the software
delivery lifecycle."
QASymphony, https://www.qasymphony.com/blog/understanding-devops-journey-simple-maturity-model/

© 2018 SPLUNK INC.
Adopting Splunk for Incident Management and RCA
Start from the beginning
 A good example of DevOps principles · Maintain a production service · Troubleshoot and remediate an unknown problem · Improve that same service for the long term
 A simple use case for Splunk · Power on the other side of a steep learning curve · How can you get value on day one

Problem
Jira crashing regularly, requiring restart
 New hosting customer, forklifted over  No obvious cause  Occurring every 1 or 2 days
Atlassian logs and APM provided no discernible root cause

© 2018 SPLUNK INC.

Problem
Jira crashing regularly, requiring restart
 Recently installed Splunk and forwarded logs from this host
 Stumbled through a search
Discovered Too many files open error in the logs

© 2018 SPLUNK INC.

Step One: Guess
Outrun the problem
 Increase open file limit to 4k  Increase open file limit to 8k  Increase open file limit to 12k

© 2018 SPLUNK INC.
Sam Howzit, Flickr, https://bit.ly/2PnDdx5

© 2018 SPLUNK INC.
"You have to face it head on."
Sifu Toph, Avatar the Last Airbender

Step Two: Measure and Respond
Add telemetry to moneo

© 2018 SPLUNK INC.

Step Two: Measure and Respond
Explore fields in Spunk

© 2018 SPLUNK INC.

Step Two: Measure and Respond
Plot our new metric

© 2018 SPLUNK INC.

Step Two: Measure and Respond
Build a dashboard

© 2018 SPLUNK INC.

Review
We have gained control
 Moved from reactive to proactive  Improved user experience  Easier administration
· Scheduled outages during normal hours · Decreased stress on operations  Improved Operations processes  Able to focus on identifying buggy app and working with vendor to correct

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Q&A
Christopher Pepe | CTO

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

