© 2018 SPLUNK INC.
Providing Intelligence Support to your World-Class SOC
Rich Barger | Director of Security Research Brandon Catalan | Principal Threat Analyst
October 2018 | Version 1.0

Forward-Looking Statements

© 2018 SPLUNK INC.

During the course of this presentation, we may make forward-looking statements regarding future events or the expected performance of the company. We caution you that such statements reflect our current expectations and estimates based on factors currently known to us and that actual events or results could differ materially. For important factors that may cause actual results to differ from those contained in our forward-looking statements, please review our filings with the SEC.
The forward-looking statements made in this presentation are being made as of the time and date of its live presentation. If reviewed after its live presentation, this presentation may not contain current or accurate information. We do not assume any obligation to update any forward-looking statements we may make. In addition, any information about our roadmap outlines our general product direction and is subject to change at any time without notice. It is for informational purposes only and shall not be incorporated into any contract or other commitment. Splunk undertakes no obligation either to develop the features or functionality described or to include any such feature or functionality in a future release.
Splunk, Splunk>, Listen to Your Data, The Engine for Machine Data, Splunk Cloud, Splunk Light and SPL are trademarks and registered trademarks of Splunk Inc. in the United States and other countries. All other brand names, product names, or trademarks belong to their respective owners. © 2018 Splunk Inc. All rights reserved.

Introductions
Allow myself to introduce myself ­ A. Powers

© 2018 SPLUNK INC.

Rich Barger
· Director of Security Research @Splunk · Former Army All-Source Intelligence
Analyst
· Former Solaris Admin · Former Threat Analyst/Consultant · Co-Founded ThreatConnect

Brandon Catalan
· Cyber Espionage Principal @Accenture
iDefense
· Former Cyber Threat Intelligence
Manager @Raytheon
· Faculty Fellow, Pell Center for
International Relations and Public Policy

© 2018 SPLUNK INC.
It's evolve or die... - Craig Charles

Three Main Acts

© 2018 SPLUNK INC.
1. Act 1: Products of our environment 2. Act 2: Going beyond the IOC "Flat
Earth" Theory
3. Act 3: Finding success through difficult
family discussions

What Role Do you Fit?
Threat Intelligence Consumers or Producers

© 2018 SPLUNK INC.

OMG TTP's & IOC's
Definitions are ours...

© 2018 SPLUNK INC.

 Tactics Techniques and Procedures ­ Actions, strategies, methods, specific ways in which one might achieve a specific result. · Applies to the Attacker & Defender
 Indicators of Compromise ­ Artifacts observed as a consequence of a computer event / intrusion. (e.g. IP Addresses, Hashes, URL's, Domains, Mutexes)

© 2018 SPLUNK INC.
Act 1
Products of our environment

Epochs of Security Analytics
Evolution of Culture: Threat, Market and Technology

© 2018 SPLUNK INC.

How was the threat/intent changing?

2000
 RCE/Worms to APT

2010
 Focused Ops to Denial & Deception

2020
 Full Spectrum Info Ops to Kinetic

How did market demands change as a result?

 Prevent & Detect to retrospective analytics

How was tech changing?

 Perimeter prevent focus to introspective solutions

 View vs Do Data Services & Rise of ThreatIntel
 Curate Signal
 NTA & EDR  Cloud & Mobile
(evaporating perimeter)

 Derivatives/Fusion  Non-obvious
recognition (ML/AI)
 Scalability & Streaming
 Physics challenges

Perspectives & Indicators
David Bianco's Pyramid of Pain

© 2018 SPLUNK INC.

Creative: This and next slide is a build with a change in the title, can we Make sure the images are aligned and do not jump positions.

Not an OR but an AND
David Bianco's Pyramid of Pain

© 2018 SPLUNK INC.

Pain Management
Common Pain Points for Threat Intel Consumers & Producers
 Established culture of chasing ephemeral IOC's
 Communicating & Understanding How & Why to detect, investigate, and act.
 Mapping requirements to business needs & standards
 Combating "Braindrain" documenting analytic tradecraft/playbooks
 Going beyond detection, into investigation, contextualization and action

© 2018 SPLUNK INC.

Burn it down!!!
 Life < 18 February 2013:
 Homegrown intel ops worked!  IOCs were all we needed!
 Life == 18 February 2013
 Adversary picks up the NYT
 Life > 18 February 2013
 Adversary abandons infrastructure  Goes underground  IOCs aren't enough
Creative: Can you help normalize the text, make this prettier

© 2018 SPLUNK INC.

Example

© 2018 SPLUNK INC.

 Naikon APT (Primarily Targeting South China Sea Region)
 Command & Control activity (single DYNDNS C2 domain resolution and rate of new IP's being acquired)
 May 19th 2014 Something changes...  Why?

ThreatConnect Project Camerashy: Figure 51 https://www.threatconnect.com/camerashy/

Example

© 2018 SPLUNK INC.

ThreatConnect Project Camerashy: Figure 51 https://www.threatconnect.com/camerashy/

Let's make it even more interesting...
 Fast forward to present day...  Race to see who can burn IOCs and operations
the fastest  Cyber intelligence bubble  New laws and privacy issues make
proactive/reactive CND even more complicated  Vendors aren't exactly making it easy to action
intelligence either

© 2018 SPLUNK INC.

Intel Loss(?)

© 2018 SPLUNK INC.

 Have you ever dismissed

intelligence because it would take

too much time to turn into

something actionable? (Consumer)

 Have you ever wished you could

deliver intelligence in a single

repeatable format to target all your

customers? (producers)

 How many formats do we need?

 PDF, CSV, JSON, STIX, etc. etc.

etc.  iDefensCeresaeteivset:hCeavnalyuoeuinhelp normalize the text, make this prettier

partnering with Splunk to publish

targeted intelligence via Analytic Stories

Brandon: Why this image??

© 2018 SPLUNK INC.
Act 2
Going beyond the IOC "Flat Earth" Theory

Tracking TTPs
 Are you doing it?  Can you do it?  What are you using to do it?
 Would/Could you if knew about analytic stories

© 2018 SPLUNK INC.

Recipes for Success
Encapsulating analytics & operations in story form

© 2018 SPLUNK INC.

Operations Analytics

Operations: Decide & Act

· Understand the threat · Stories integrated into
automated workflows · Automated analytics
(IF>Then>Else)

· Measure workflow efficacy (analytic & operational)

Analytics: Asking & Knowing
CWWrhietheartteihveeth:ceCosanenntehy··croetouS((MMCeDIneSairtevarhpFsteeir,epcts?eAKceehttiTdigillTolmTpatynCo&tp)ihvCisem&naesKdi)hn,usfaoiCsshrttkIrorSyeiref2iafctr0lat,itmrmNhieegISiwshTortsksal:i··dnedIeeCemnxxoptamvtneiehrtreneornidxeneaditmnaludctaeieeatmlnlihytzat.esseaEue(wvrtgvsaniet)lehuyeaintxietnet&rnatahln&eanneimxtastleiddebaupilpdesalirdse.

Data: Setting up for success

Data

· Know what data models to · Fuse datasets for a transactional

populate

"All Source" approach

· Understand specific

technologies and how to unlock

access to critical questions

Current Approach

© 2018 SPLUNK INC.

Encapsulating analytics & operations in story form

Operations Analytics

Analytic Story

Operations: Decide & Act

· Understand the threat · Stories integrated into
automated workflows · Automated analytics
(IF>Then>Else)

· Measure workflow efficacy (analytic & operational)

Analytics: Asking & Knowing

· ·

Search Types for realtime (Detection) & historic

·

(Investigative)

MMaitrpepAeTdTto&CinKd,uCstIrSy2fr0a,mNeISwTorks:·

CSF, Kill Chain

Immediately survey environment. Evaluate & experience Contextualize (with internal & external datasets)

Data: Setting up for success

· Know what data models to · Fuse datasets for a transactional

populate

"All Source" approach

· Understand specific

technologies and how to unlock

access to critical questions

Data

Relating Stories & Analytics
Grouping, Organizing and Associating

© 2018 SPLUNK INC.

One Analytic Many Detection Story can Analytics... have...

...and several

...that can have

Investigative additional meaning with

Analytics Contextual Analytics

*Some* of which require Supporting
Analytics

© 2018 SPLUNK INC.
Getting Started with Analytic Stories: Step by Step
From a PDF to Actionable Analytics
Recipe for an Analytic Story 1. Actually read the report
Creative: The following slides (# to #) are build slides ­ we will replace some of the screenshots when engineering finishes ES 5.2

© 2018 SPLUNK INC.
Getting Started with Analytic Stories: Step by Step
From a PDF to Actionable Analytics
Recipe for an Analytic Story 1. Actually read the report & discuss

© 2018 SPLUNK INC.
Getting Started with Analytic Stories: Step by Step
From a PDF to Actionable Analytics
Recipe for an Analytic Story 1. Actually read the report & discuss 2. Extract TTP's referenced in the
prose.

Extracting TTP's into Story Form
First Time Usage of cmd.exe

© 2018 SPLUNK INC.

Extracting TTP's into Story Form

© 2018 SPLUNK INC.

Extracting TTP's into Story Form
Unusually Long Command Line

© 2018 SPLUNK INC.

Extracting TTP's into Story Form

© 2018 SPLUNK INC.

Extracting TTP's into Story Form
Registry Modifications & Hidden Powershell

© 2018 SPLUNK INC.

Extracting TTP's into Story Form

© 2018 SPLUNK INC.

Identify Analytic Tradecraft
Define what to look fo

© 2018 SPLUNK INC.

Recipe for an Analytic Story 1. Actually read the report & discuss 2. Extract TTP's referenced in the
prose. 3. Identify Analytic Tradecraft

MUDCARP Analytic Story

Detect 1

Investigate 1

Contextualize 1

Detect 2

Investigate 2

Contextualize 2

Detect 3

Contextualize 3

Detect 4

Contextualize 4 Contextualize 5

Contextualize 6

© 2018 SPLUNK INC.

Identify Analytic Tradecraft: Choose your own adventure

Detection

Investigation

Contextualization

First time seen command line argument

Get Process Info

Get Notable Info Get Notable History

Unusually Long Command Line

Get Parent Process Info

Get User Information from Identity Table

Registry Keys Used For Persistence
Malicious PowerShell Process - Connect To Internet With Hidden Window

Get Authentication Logs For Endpoint
Get Risk Modifiers For User
Get Risk Modifiers For Endpoint

Capture Data & Create Analytics

Recipe for an Analytic Story 1. Actually read the report & discuss 2. Extract TTP's referenced in the
prose. 3. Identify Analytic Tradecraft 4. Capture data & create analytics

Attack Experiment

© 2018 SPLUNK INC.

Finding Cyber Threats with ATT&CKTM-Based Analytics: B. Strom et al https://www.mitre.org/sites/default/files/publications/16-3713-finding-cyber-threats%20with%20att%26ck-based-analytics.pdf

Quality Assurance Testing
Recipe for an Analytic Story 1. Actually read the report & discuss 2. Extract TTP's referenced in the
prose. 3. Identify Analytic Tradecraft 4. Capture data & create analytics 5. Quality assurance testing

© 2018 SPLUNK INC.

Framework Mapping
From a PDF to Actionable Analytics
Recipe for an Analytic Story 1. Actually read the report & discuss 2. Extract TTP's referenced in the
prose. 3. Identify Analytic Tradecraft 4. Capture data & create analytics 5. Quality assurance testing 6. Map to frameworks and
references

© 2018 SPLUNK INC.

Configure & Deploy
From a PDF to Actionable Analytics
Recipe for an Analytic Story 1. Actually read the report & discuss 2. Extract TTP's referenced in the
prose. 3. Identify Analytic Tradecraft 4. Capture data & create analytics 5. Map to frameworks and
references 6. Quality assurance testing 7. Configure & Deploy

© 2018 SPLUNK INC.

© 2018 SPLUNK INC.
Demo
Analytic Stories

© 2018 SPLUNK INC.
The Two Sides of the Security Analytics Coin
"Spray & Pray" vs the "How & Why"

The Traditional Approach  Threat Intelligence Feeds:
· IOC Oriented · Delivered in report or API (text) · "Trust me" vs "Show your work"
 Challenges: · Ephemeral (Limited "Shelf Life") · Atomic vs Comprehensive · Requires expertise to contextualize &
understand relationships

The Splunk Approach
 Analytic Story Based · Packages the questions to ask alongside
the context.
· Longer "shelf life" than an atomic indicator · Shows & Explains work / Customizable  Analytic Story Contains · How to's: · Detect something evil · Investigate something evil · Contextualize something evil · Data Requirements & Industry Frameworks

Next Steps
Where do we go from here?

© 2018 SPLUNK INC.

Splunk
 Consider your analytics strategy; going beyond detection
 Learn more about Analytic Stories · Email us escu_feedback@splunk.com · Talk to your account team
 Interested in Building your own Stories? · Contact us

Accenture/iDefense
 Contact iDefense to learn how we're leveraging Analytic Stories to reshape how we're delivering Threat Intelligence to our clients

© 2018 SPLUNK INC.
Thank You
Rich Barger - rbarger@splunk.com Brandon Catalan - brandon.catalan@accenture.com

