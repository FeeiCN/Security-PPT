Best Practices and Better Practices for Admins
...while you get settled...
 Latest Slides: · https://splunk.box.com/v/conf18-coe
 Collaborate: #bestpractices · Sign Up @ http://splk.it/slack
 Load Feedback ------------------------>

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Best Practices and Better Practices for Admins
Building a Best Practiced Deployment (CoE)
Burch | Manager, Product Best Practices
.conf18 > Presented by Splunk's Digital Customer Success

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

What's a "Burch"?
Manager, Product Best Practices
 Education: Comp Sci + MBA  Werk: Middleware Eng
 Splunk Customer since 2012 · Admin for four environments · This is based on a true story...
 Splunk Employee since 2014 · Sales Engineer · Best Practices Engineer · "Best Practiced Deployment" (CoE)

© 2018 SPLUNK INC.

Scope = Difficult Concepts
http://conf.splunk.com/sessions/2017-sessions.html#search=burch

© 2018 SPLUNK INC.

.conf2017 Best Practices and Better Practices
for Admins
Best Practices and Better Practices for Users
Blueprints for Onboarding Teams
Creating Welcome Pages
Sandboxing with Splunk (with Docker)
Blueprints for Actionable Alerts

.conf18 Best Practices and Better Practices for Admins
Blueprints for Actionable Alerts

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Best Practices for a Best Practiced Deployment

Foundations
Best Practices for a Best Practiced Deployment

© 2018 SPLUNK INC.

Practice Politics
Scope == Executive Sponsor

© 2018 SPLUNK INC.
And I'd like to take a minute just sit right there

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

User vs Team

© 2018 SPLUNK INC.

Who wants to role play?
Choose Your Own Adventure!

© 2018 SPLUNK INC.

Scenario

© 2018 SPLUNK INC.
· New employee at Buttercup Games · Lied on your resume about Splunk
experience (no experience)
· Company has no HR. Punishment is
Pony Diaper Duty (pun intended)
· Given same Splunk access as peer. · You log in to see...

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

All the Dashboards!

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Doug M.

© 2018 SPLUNK INC.
D. Merritt

© 2018 SPLUNK INC.
index=*

Splunk Admin

You Your throat

Grand Moff Tarkin

© 2018 SPLUNK INC.

Solution, you have?!

© 2018 SPLUNK INC.

The Paradox of Choice
AKA Buyer's Remorse

© 2018 SPLUNK INC.
"eliminating consumer choices can greatly reduce anxiety"

Oh, the Places You'll Go
Too many options!

© 2018 SPLUNK INC.

Same Challenge. Different Platforms.
What did this button do for user design?
 Mislead?
 Restrict?
 Guidance!
 Confidence!
 Comfort!

© 2018 SPLUNK INC.

Eureka! Welcome Page!
Effective material presented at every log in

© 2018 SPLUNK INC.

Burch's Experience
Same questions and confusions over and over
 What is Splunk?  What report/dashboard to use?  What data available?  Want to learn more!

© 2018 SPLUNK INC.

Welcome Email
Lost in their mailbox...
 Lost in their mailbox  Static == Ineffective  Requires effort from user

© 2018 SPLUNK INC.

User Education & Enablement
 Creating Content: · Teaching + Videos + Wikis
 Is that your core competency?  Outsource it to us!
· Capture unique things

© 2018 SPLUNK INC.

Workspace
Do you keep everyone's work on everyone's desk?

© 2018 SPLUNK INC.

...so why do we do that in Splunk?

© 2018 SPLUNK INC.

App as a Workspaces
Dedicated to one team/group/purpose

© 2018 SPLUNK INC.

Benefits
Increases in...

© 2018 SPLUNK INC.

Safety

Risk led learning

Discovery led collaboration

Incentives

© 2018 SPLUNK INC.

Is EDU Required?

© 2018 SPLUNK INC.

"Yea, I took education"
"But I didn't care, nor pay attention"

© 2018 SPLUNK INC.

Incentives

© 2018 SPLUNK INC.

Alternative Approach: No Requirements
But limited impact...

© 2018 SPLUNK INC.

You can't stop splunk-thusiasm...

...so shape it in your favor!

Incentive Driven User Onboarding
 "I can't believe those users did those things I let them do!"
 Don't be a data butler
 Identify & coach & promote to power
 Work with you to implement and learn best practices

© 2018 SPLUNK INC.

Result
Curiosity and exploration

© 2018 SPLUNK INC.

Rinse & Repeat

© 2018 SPLUNK INC.

Admin Teachers Power User

Power User Teaches User

Result
At first, more questions. Later, more disciples.

© 2018 SPLUNK INC.

Clearly, now the fish can catch it's own man...

Know thy Role?
English vs Splunk
 Data Access  Search Retention  Product Feature Capabilities  Knowledge Object Permissions  Default App

© 2018 SPLUNK INC.

Sub-Concept: For The Nguyen (FTN)
Separate Roles & Capabilities & Groups

© 2018 SPLUNK INC.

Scenario
REMIX

© 2018 SPLUNK INC.
· New employee at Buttercup Games · Lied on your resume about Splunk
experience (no experience)
· Company has no HR. Punishment is
Pony Diaper Duty (pun intended)
· Splunk Admins attended this session! · You log in to see...

...only what you need
With clear information on where to go/learn next

© 2018 SPLUNK INC.

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

Tighter Coupling
Use Case with Data
Data in Splunk
That data shown back to you as a use case thereby providing insights into your business or technology resulting in machine data being accessible, usable and valuable to everyone.

© 2018 SPLUNK INC.

Tighter Coupling
Use Case with Data
Data in Splunk
That data shown back to you as a use case thereby providing insights into your business or technology resulting in machine data being accessible, usable and valuable to everyone.

© 2018 SPLUNK INC.

Onboarding != Ingestion
A David Paper Joint!

© 2018 SPLUNK INC.

SME != admin && admin != SME

© 2018 SPLUNK INC.

Technical SME

Product SME

"What index do you need? What do you want for a sourcetype?"

"I like black turtlenecks."

Onboarding != Ingestion
A David Paper Joint!

© 2018 SPLUNK INC.

Onboarding != Ingestion
A David Paper Joint!

Onboarding Phases

Ingestion  Fetch from source:
· Read access · Data volume estimate · Sample

 Use sample for: · Event Breaks · Time Stamps

© 2018 SPLUNK INC.

What to create?
Dashboards and reports and scheduled searches, Oh My

© 2018 SPLUNK INC.

Give `em the first hit free!
They'll be hooked on Splunk!

© 2018 SPLUNK INC.

Crafting the Use Case

© 2018 SPLUNK INC.

Workflow Phase: Use Case Definition
Alerts vs Dashboards vs Searches

© 2018 SPLUNK INC.

Root Cause Unknown

Root Cause Known

Unaware Issue Exists

Aware Issue Exists

Workflow Phase: Use Case Definition
Alerts vs Dashboards vs Searches

© 2018 SPLUNK INC.

Root Cause Unknown

Root Cause Known

Unaware Issue Exists

Listening · Dashboards & Glass Tables · Odd symptom combo

Aware Issue Exists

Workflow Phase: Use Case Definition
Alerts vs Dashboards vs Searches

© 2018 SPLUNK INC.

Root Cause Unknown

Root Cause Known

Unaware Issue Exists

Listening · Dashboards & Glass Tables · Odd symptom combo

Aware Issue Exists

Investigating · Go Spelunking! · Hunting for RC

Workflow Phase: Use Case Definition
Alerts vs Dashboards vs Searches

© 2018 SPLUNK INC.

Root Cause Unknown

Root Cause Known

Unaware Issue Exists

Listening · Dashboards & Glass Tables · Odd symptom combo

Monitoring · Scheduled Searches & Alert Actions

Aware Issue Exists

Investigating · Go Spelunking! · Hunting for RC

Workflow Phase: Use Case Definition
Alerts vs Dashboards vs Searches

© 2018 SPLUNK INC.

Root Cause Unknown

Root Cause Known

Unaware Issue Exists

Listening · Dashboards & Glass Tables · Odd symptom combo

Monitoring · Scheduled Searches & Alert Actions

Aware Issue Exists

Investigating · Go Spelunking! · Hunting for RC

Attacking · Adaptive Response

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.

Prepared to answer at 4 a.m.
Thanks to Learning Paths

© 2018 SPLUNK INC.

Architecture vs Lab vs Sandbox

© 2018 SPLUNK INC.

BAU Account
Dog Food!
 Use non-admin account · Prevents accidents · Live with limitations · Appreciate user experience

© 2018 SPLUNK INC.

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

Change Control
Enablement through experimentation
 Impacting · Platform settings · Critical Knowledge Objects
 Non Impacting · Searching · Private KO · Impact while logged in · Nominate to Impacting
 Version Snapshots

© 2018 SPLUNK INC.

Service Catalog
Force yourself to deliver

© 2018 SPLUNK INC.

Delay Backfill
Validate new process first

© 2018 SPLUNK INC.

Hiring Practices
Qualify staffing needs

© 2018 SPLUNK INC.
 Complexity · Distributed Deployment · Indexer Clustering · Search Head Clustering · Data Collection Tier · Complex Utility Deployments
 Work Expectations · Platform HA means People HA · CoE staff vs End Users workload

We Wear Many Hats

 Architect  Developer  Engineer  Executive Sponsor  Search Expert  Knowledge Manager  Program Manager  Project Manager  User Community

© 2018 SPLUNK INC.

Mind the Gap

© 2018 SPLUNK INC.

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

Best Practiced Deployment
A.K.A Center of Excellence

© 2018 SPLUNK INC.

New Manual. Who dis?

© 2018 SPLUNK INC.

BAZINGA!

© 2018 SPLUNK INC.

What Now?
Related breakout sessions and activities...

1. Rate this! (be honest)
2. Collaborate: #bestpractices
· Sign Up @ http://splk.it/slack
3. More talks, search for
· Burch · Jeff Champagne · Delaney · Stefan · Veuve

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Questions & Discussion?
Don't forget to rate this session in the .conf18 mobile app

