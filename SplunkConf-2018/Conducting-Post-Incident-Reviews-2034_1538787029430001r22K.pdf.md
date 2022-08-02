Splunk .conf18 Post Incident Reviews
Why You Should Care & How to Get Started
Davis Godbout, Product Manager
October 2018 | Version 1.0

© 2018 SPLUNK INC.

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

4:03pm

© 2018 SPLUNK INC.

Something's Amiss
Sam notices first @ mention on Twitter; customer can't access Acme.com
Unfortunately: 2 cases in queue Only checks once queue is empty

4:28pm

© 2018 SPLUNK INC.

There's a Problem
Sam logs into Twitter and sees @mentions of customers complaining
Oh No! Who can help?

4:42pm

© 2018 SPLUNK INC.

Investigation Begins
Cathy verifies service disruption. Sam files a ticket in the customer support team
First step Cathy begins looking for investigation and triage documentation

4:53pm

© 2018 SPLUNK INC.

Locating the Problem
Cathy locates documentation on methods to connect to the service hosting the site
Action Recorded Cathy logs in to the affected server

5:02pm

© 2018 SPLUNK INC.

A First Attempt
Cathy views all running processes on the host using `top', spots an unknown service utilizing 92% of the CPU
Reaction Cathy attempts to contact Greg via slack (he is the most familiar with processes that run on the host)

5:12pm

© 2018 SPLUNK INC.

The Search for Greg
After 5 minutes of slack messaging, Cathy gives up on Slack and begins looking for Greg's phone number
Unfortunately she can't find it easily and searches through old emails
Success Cathy finds Greg's number in an email from a year ago and calls him

5:15pm

© 2018 SPLUNK INC.

Keep Everyone Updated
Greg joins the investigation process and asks Cathy to update the StatusPage
Actions Recorded StatusPage is updated and Sam mentions he has received 10 support requests and 3 additional mentions on Twitter

5:33pm

© 2018 SPLUNK INC.

Resolution
Greg fixed the issue and informs the team that he has solved the problem
Final Steps Sam closes the support ticket and updates the StatusPage

© 2018 SPLUNK INC.
Incidents don't end after resolution

Total Time: 90 Minutes

39 Minutes

30 Minutes

© 2018 SPLUNK INC.
21 Minutes

© 2018 SPLUNK INC.
The Virtuous Cycle of DevOps

Detection
We didn't detect this on our own. We don't have a clear path to responding to incidents (Support contacted Cathy as a result of chance not process)
Time To Acknowledge: 39 Minutes

© 2018 SPLUNK INC.
Detection Checklist:
 Are we capturing an incident timeline of events?
 How and when did we know about this problem?
 Do we have a process to address system failures?

Response
It's not common knowledge how to connect to critical systems regarding the services we provide.
Access to systems for the first responder was clumsy and confusing.
Pulling in other team members was difficult without instant access to their contact information.
We aren't sure who is responsible for updating stakeholders and/ or the status page.
Time to Response: 30 Minutes

© 2018 SPLUNK INC.
Response Checklist:
 Did we have accessible documentation to understand how critical systems work?
 Did responders have access to the appropriate systems?
 Is contact information readily available?
 How did we communicate outward?

Remediation
A yet-to-be identified process was found running on a critical server.
We don't have a dedicated area for the conversations that are related to the remediation efforts.
Some conversations were held over the phone and some took place in Slack.
Someone other than Greg should have been next on the escalation path so he could enjoy time with his family.
Time to Recover: 21 Minutes

© 2018 SPLUNK INC.
Remediation Checklist:
 What was the point when we identified the problem?
 Where did we coordinate a problem response?
 Do we have on-call coverage for critical people out of office?
 What tasks were performed?  What made a positive impact?

© 2018 SPLUNK INC.
"Learning from a postmortem is only as useful as what you put into practice afterwards and we realized that without any action items after the meeting, it was more
or less just a Greek Senate debate."
Ben VanEvery (Simon Data)

Readiness: Detection
 Add monitoring of effected host to detect potential or imminent problems
 Set up an on-call rotation so everyone know who to contact if something like this happens again
 Define escalation policies and alerting methods for engineers

© 2018 SPLUNK INC.

Readiness: Response
 Build and make widely documentation on how to get access to system to begin investigating
 Build and make widely available contact information for engineers who may be called in to assist during remediation efforts
 Establish responsibility and process surrounding who is to maintain the status page

© 2018 SPLUNK INC.

Readiness: Remediation
 Ensure that all responders have the necessary access and privileges to make an impact during remediation
 Establish a specific communication client and channel for all conversation related to remediation efforts and try to be explicit and verbose about what you are seeing and doing. Attempt to "think out loud"

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
The 3 Stages of Operational Maturity
Evolution of Incident Management

Analysis: 3 stages of maturity

© 2018 SPLUNK INC.

"Reactive"
 happens (no real process)

"Tactical"
"CYA" post-mortem

"Integrated"
Post Incident Review process feeds into readiness

© 2018 SPLUNK INC.
Where To Start

Step 1: Access to Data
Capture More Than Just the Monitoring Data
Observability of Systems · Set up monitoring as part of feature release and deployment · Remove "visibility silos" between infrastructure and applications
Observability of People · What steps are teams taking to resolve incidents, can we solve this via automation?

© 2018 SPLUNK INC.

Step 2: Change In Process
Problems With `Too-Narrow" Focus
Avoid the 5 Whys and RCA (Blame) · Incidents are rarely due to one specific failure, instead they are a collection of systemic failures (lack of visibility/ knowledge, etc)
Build a timeline of events (both data and human interaction) to objectively analyze an incident
· Capture context within 72 hours of any major incident

© 2018 SPLUNK INC.

Step 3: Empower People
People Built It, Help Them Fix It
Arm your team with training and knowledge · Share information via runbooks and wikis
Incident Management is a "Team Sport" · Perform "chaos events" that allow people to run through failure scenario and learn without cost

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Why This Matters
The Time Invested Is Worth It

Analysis: Connecting Dots

© 2018 SPLUNK INC.

Code is Deployed

Service is Restored

NOC Notices On-Call User

Problem

is Paged

Page is acknowledged

Response

Remediation

Resolution

Analysis: Connecting Dots

© 2018 SPLUNK INC.

Code is Deployed

Service is Restored

NOC Notices On-Call User

Problem

is Paged

Page is acknowledged

Response

Remediation

Resolution

Analysis: Connecting Dots
Cost of Downtime: $250,000/ hour

12 Min $50,000

2hrs 14min $575,000

© 2018 SPLUNK INC.

Response

Remediation

Resolution

Analysis: Connecting Dots
Cost of Downtime: $250,000/ hour

© 2018 SPLUNK INC.

12 Min $50,000
Response

2hrs 14min
$575,000
A 5% improvement would outweigh A 50% improvement in detection

Remediation

Resolution

© 2018 SPLUNK INC.

It's in Your Hands
Recommended Reading:

© 2018 SPLUNK INC.

Abstract

© 2018 SPLUNK INC.

Okay, you've decided to go the "DevOps" route ­ you've created a culture of observability and aggregated your teams and monitoring tools into a single platform like Splunk + VictorOps... what next? An important part of this journey is understanding how to leverage this powerful platform to empower teams to create measurable processes and conduct blameless post incident reviews. In this session, we'll discuss the barriers preventing effective incident reviews. From there, we'll delve into how you can build incident timelines that pinpoint warning indications across all of your monitoring tools and document every individual response. Finally, we'll share some thoughts on the skills, ethos and processes you'll want to cultivate in your teams as you go beyond blameful processes like root cause analysis, and move towards a culture of continuous improvement.

