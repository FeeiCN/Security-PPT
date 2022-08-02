Addressing Alert Fatigue
David Dorsey | Sr. Manager Security Research

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Who's This Guy?
 A coy 'lil security minx  Splunk Security Research Team  Been around for 15ish years now, mainly on the
defensive side  RE, IR, File Analysis, Network Analysis, Machine
Learning  Loves
· BBQ · Pie  Dislikes · Pants · Socks

© 2018 SPLUNK INC.

Agenda
 Level Setting  Grouping Anomalies  Event Sequencing  Automation

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Level Setting
Words matter

Alert Fatigue

© 2018 SPLUNK INC.

Occurs when one is exposed to a large number of frequent alerts and consequently
becomes desensitized to them. Desensitization can lead to longer response
times or to missing important alarms.

Alerts Should Provide Value

© 2018 SPLUNK INC.

Alerts Should Be Meaningful

© 2018 SPLUNK INC.

Alerts Should Be Actionable

© 2018 SPLUNK INC.

All Alerts Are Not Created Equal

© 2018 SPLUNK INC.

Some Alerts Are Straightforward

© 2018 SPLUNK INC.

But it's Easy to get Lost
This isn't right

© 2018 SPLUNK INC.

There Are Better Ways!

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Grouping Anomalies With UBA

Unusual Geolocation

© 2018 SPLUNK INC.

Scanning Activity

© 2018 SPLUNK INC.

Excessive Data Transmission

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Together, Those Anomalies Constitute a Problem

Finding Complex Behaviors

© 2018 SPLUNK INC.

Actionable Threats

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Event Sequencing

What is this Sorcery?

© 2018 SPLUNK INC.

 The Event Sequencing Engine provides additional capabilities for threat detection by allowing you to group correlation searches into clusters of events, either in a specific sequence, by specific attributes, or both.

 You do this by defining a workflow to run correlation searches in an order of your choice, specifying what notables would need to occur in order to advance to the next step.

 The concept is similar to writing a script to automate the things that you might otherwise have to do manually when tracking a variety of notables and variables through a variety of correlation searches.

Basic Structure
Define a starting event Define a set of transition events
· Order can be enforced Define an ending event

© 2018 SPLUNK INC.

General Malware Behavior
Run a process never seen before Download an executable Visit a domain never visited before

© 2018 SPLUNK INC.

Not Everything Qualifies as an Alert
Run a process never seen before · Any time you install something new
Download an executable from Internet · Happens all the time
Visit a domain never visited before · Happens frequently

© 2018 SPLUNK INC.

What If?

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Event Sequencing Demo

Event Sequencing Demo
An endpoint visited a domain it's never seen before Same endpoint downloaded an executable Same endpoint ran a process it's never seen before

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Automation

I Don't Want to Deal with Alerts

© 2018 SPLUNK INC.

Continue Previous Example
Those three events happening is very interesting* · *Interesting != malicious
What can we do next?

© 2018 SPLUNK INC.

Where Automation Can Help

© 2018 SPLUNK INC.

INVESTIGATE
- Grab a copy of the binary - Detonate it - If determine to be malicious, remediate

REMEDIATE
- Isolate Machine - Deactivate Account - Notify IT to
restore from backup

ROOT CAUSE ANALYSIS
- Kick off Investigation - Run Searches - Create your own threat intel

© 2018 SPLUNK INC.
Conclusion

What Just Happened?
We can group individual events together · Event Sequencing · UBA
Leverage Automation · Reduce investigation time · Assist with remediation · Root Cause Analysis

© 2018 SPLUNK INC.

Where do I go From Here?

© 2018 SPLUNK INC.

 Talk to your Splunk account manger/sales engineer
 Splunk Enterprise Security: http://docs.splunk.com/Documentation/ES/latest
 Splunk UBA: http://docs.splunk.com/Documentation/UBA
 Phantom: https://www.splunk.com/en_us/software/splunk-securityorchestration-and-automation.html
 Event Sequencing Docs: http://docs.splunk.com/Documentation/ES/5.2.0/Admin/Sequencecorrelation searches

Thank You
Don't forget to rate this session in the .conf18 mobile app

© 2018 SPLUNK INC.

