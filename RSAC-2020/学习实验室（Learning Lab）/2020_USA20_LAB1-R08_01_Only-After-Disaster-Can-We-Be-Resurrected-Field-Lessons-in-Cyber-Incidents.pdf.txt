SESSION ID: LAB1-R08
Only After Disaster Can We Be Resurrected: Field Lessons in CyberIncidents

Mark Sangster
VP and Industry Security Strategist eSentire, Inc. @mbsangster South Hall 1453

Jon Washburn
Chief Information Security Officer (CISO) Stoel Rives LLP @Stoelrives

#RSAC

#RSAC
Quick Poll!
SESSION ID: 1996726785
2
South Hall 1453

Quick Poll!

What is your role in your organization?

SESSION ID: 1996726785

Have you ever been involved in a data breach investigation?

Have you ever been involved in a regulatory or privacy law compliance investigation?

#RSAC

3
South Hall 1453

#RSAC
"Only after disaster can we be resurrected."
South Hall 1453

South Hall 1453

#RSAC
Tyler Durden
Fight Club 1999 Chuck Palahniuk

Field Lessons in Cyber Incidents

COMPLEXITY

SUPPLY CHAIN

#RSAC
INTEGRITY

A passenger airliner runs out of fuel at 41,000 feet
South Hall 1453

A deep-sea drilling rig explodes and sinks
6

Architects build a skyscraper then discover it will fall over in a storm

South Hall 1453

#RSAC
When we blame the people, we miss the chance to learn
Human error is never the cause. It is a symptom of underlying systemic problems. Ask what is responsible not who.
Understand why they made their decisions.
Seek forward accountability.

#RSAC
The three biases through which we assess cause

HINDSIGHT

OUTCOME

TIME

The exaggerated ability to predict and prevent the disaster.
South Hall 1453

Knowing the outcome tends to lead to harsh judgment.

The tendency to focus on the most recent factors.

#RSAC
The Air Canada flight 143, the sinking of the Deepwater Horizon, and retrofit of the Citicorp Tower are true stories. DISCLAIMER The workshop examples and exercises are drawn from our experiences, observations and activities and do not represent our work for any one, or set of, customers or clients. Facts have been changed to obscure the identity of the parties where elements are based on actual events. All exercises in today's lab, while plausible, are fictional scenarios.
South Hall 1453

#RSAC
Assessing Risk
We are going to run through three twopart "tabletop" scenarios during this lab that will focus on assessing risk and determining how we'd respond to specific incidents.
South Hall 1453

#RSAC
Assessing Risk
While we will be asking you to do qualitative assessments, it's always good to visualize where a risk might land on a quantitative "heat map" when considering how you'll plan/respond. Like real life, our exercises are designed to be layered, with a few twists and turns that are designed to get you to re-evaluate risk.
South Hall 1453

#RSAC
Assessing Risk
If you've done this before, use whatever assessment scale works for you. If not, we have printed out example probability/impact tables you can use.
South Hall 1453

#RSAC
Lesson 1: Cyber Events Are the Consequence of Multi-dimensional Factors
Air Canada Flight 143: The Gimli Glider

#RSAC

On July 23 1983, Air Canada Flight 143 was a passenger flight between Montreal and Edmonton. Midway through the flight at an altitude of 41,000 feet, the plane ran out of fuel.

South Hall 1453

12 November 2007: https://www.damninteresting.com/the-gimli-glider/

Priveleged and Confidential

#RSAC

The crew was able to glide the brand new Boeing 767

aircraft safely to an emergency landing at a former Air Force

base in Gimli, Manitoba. There were no fatalities and only

minor injuries. This unusual aviation incident earned the

aircraft the nickname "Gimli Glider."

South Hall 1453

15

23 July 2017 https://twitter.com/aircrashmayday/status/889077639130091520

Following the airline's investigation, the Captain was demoted and First Officer suspended for two weeks. Three maintenance workers were also suspended.

#RSAC

14 February 20S1o7u:thhtHtpasll:/1/4w53orldairphotography.wordpress.com/2017/02/14/the-story-about-air-canada-flight-174-the-gimli-glider/

#RSAC
Subsequent investigations found additional factors

LACKING
Company Policies

NEW
Aircraft Model

ADOPTION
Emerging Technology

FAILURES
Mechanical Systems
South Hall 1453

ERRORS
Pilots and Mechanics

CONFUSION Units of Measure

#RSAC
We face the same factors with Cybersecurity

GOVERNANCE
Culture, Policies and Budget

ADOPTION

EMERGING TECH

Business-driven Decision-making

And False Assumptions

TECH FAILURES Patching and Updates South Hall 1453

HUMAN ERROR
User Errors and Talent Gap

REGULATORY
Changes and New Laws

#RSAC
73% Believe Digital Transformation Led to a Breach

N O (not likely)

18%

31%

Y E S (most likely)

Bridging Digital Transformation Mar 2018

Y E S (likely)

20%

22%

Y E S (with certainty)

9%

N O (no chance)

South Hall 1453

#RSAC
Emotet Attack Scenario
Jane, the Help Desk Manager at OMG Health Care woke up this morning to an alert that her antivirus software quarantined a new variant of Emotet, a well-known malware worm that is generally the precursor to the Emotet/Trickbot/Ryuk "triple threat" attack. Since the threat was "quarantined" she breathed a sigh of relief and went back to sleep.
While on her way to work, Doctor Goode forwarded Jane an email from Mike at Health Care Clearinghouse stating that they received a "spoof" phishing email with a malicious attachment from "Doctor Goode" <fakeemail@alol.com> with the subject "Billing issues for patient John Smith."
After arriving at her desk, Jane is told that a night nurse reported receiving an email titled "Re: re: List of dishes for Friday's Potluck" that appeared to be from an internal email thread, with an attachment she hadn't seen before called "List.docx." When she opened the attachment she saw a couple weird windows appear and disappear. Jane can see the email was sent from "Paul Jones, RN" <anotherfake@yahoo!.com>).
20
South Hall 1453

Emotet Attack Part I
THE INVESTIGATION
· In the email example, it is clearly apparent that the scam account that sent the spoofed email includes the message body of a private message that was sent from Doctor Goode's OMG email account to Mike from back in September.
· Jane calls her MSSP and they help her dig into the AV system and review the logs, where they discover 22 computers were cleaned ­ Doctor Goode's was one of them. They find that it took the AV solution almost 20 hours to detect and quarantine this new Emotet variant (the variant initially installed but wasn't quarantined/ removed until the PCs received/auto-installed the latest definitions update.)
CONTEXT
· OMG has an EMR system, but isn't good about using it.
· OMG has yet to roll out 2FA for remote access.
21
South Hall 1453

#RSAC
What should Jane and her MSSP do next?
Invoke the Incident Response Plan · Assemble the Incident Management Team · Identification (is it really Emotet?) · Contain the issue · Establish internal lines of communication · Further containment if necessary · Eradication · Recovery
What is the potential impact?
· The "potluck" email is fairly harmless, but that "patient" email ...
· HIPAA compliance, notification requirements · If this is pervasive, how much PHI could be involved?
Who does OMG likely have to notify, and why?
· Internal personnel · The HHS Secretary · Patients, if there's a risk that ePHI has been accessed · The media, if more than 500 individuals · Business Associates

Emotet Attack Part II
THE INVESTIGATION CONTINUES
· Through her MSSP, Jane engages a forensics team ("FT") to come in and confirm that the situation is contained, and to investigate and see if there's any way to get to a root cause and an accurate scope of what happened.
· FT installs a detection client on all PCs and monitors the network for 30 days.
· During that time OMG receives reports of phishing (and gets phished themselves by the attackers) but other than the quarantined Emotet variant, no other malicious software is found, and the AV solution seems to be quarantining everything.
· OMG already employs GPOs to enforce user context for all users (no exceptions), uses separate ADM accounts for administrators, blocks the ability to write to/execute from removable media and has a strong email filter and web proxy solution. The SIEM logs don't readily indicate any large traffic flows or other malicious traffic patterns.
22
South Hall 1453

#RSAC
How could this have happened?
· No whitelisting = an allowed script, macro, or some other function that called an allowed app or utility to run could have been leveraged to pull down and installed the worm, even in user context
· Software that runs in local admin context (?)
How might they limit scope?
· Check perimeter logs to verify that it was able to steal email locally, and didn't just leverage credentials to a C2 server that had to reuse creds from outside
· Know which affected account could/have which type of information. For example if 10 accounts were affected but only 2 had access to PHI, the rest could be outside of scope for HIPAA breach reporting
· Any other reasonable and defensible measures
What more can they do to mitigate future attacks?
· Use the EMR · Better EDR solution · Application (Plugins? Scripts?) whitelisting · Limit the use of macros

#RSAC
Lesson 2: Supply Chain Elements Introduce Risk into Your Environment
The Deepwater Horizon
23

Priveleged and Confidential
Deepwater Horizon
Leased to BP, the $560 million offshore drilling rig, the Deepwater Horizon, was positioned 41 miles (66 km) off the Louisiana coast in the Gulf of Mexico to drill an 18,000 (5,600 m) deep exploratory well and cap the well head in preparation for the arrival of the production drilling platform.

#RSAC
By the morning of April 20 2010, the Deepwater Horizon was 43 days behind schedule, and was in final testing to ensure the integrity of the cap, before abandoning the site.

South Hall 1453

24

https://vfxblog.com/2016/11/22/ilm-is-on-fire-with-deepwater-horizon/

April 20, 2010
At 21:49 two Massive Explosions crippled the Deepwater Horizon. Minutes later, the crew abandoned ship and most of the 126 crew and guests (17 of whom were injured) on board were rescued. After burning for more than 36 hours, the Deepwater horizon sank on the morning of April 22.
April 23, the Coast Guard called off the search for 11 missing persons, officially presumed dead.
After 83 days of continuous flow, more than five million barrels of oil (210 million US gallons) led to the largest environmental disaster in history.
The estimated cost to BP as of 2018 was somewhere around 65 billion.
25
South Hall 1453

#RSAC https://en.wikipedia.org/wiki/Deepwater_Horizon_explosion

1 Cement cap failed to stop flow of oil

2

Operators misinterpreted pressures tests and explained the reading as a

known effect

3

Oil and gas flowed up the riser and went unnoticed for 40 minutes, and

flowed over the lower decks

4

Oil and gas flowed into the engine intakes and caused an explosion

5

Multiple elements and mechanisms in the BOP failed to stop the flow of

hydrocarbons

South Hall 1453

4 Deepwater Horizon
3
Riser
2

5 Blowout Preventor (BOP)

Well Head on the Sea Floor @ 5,000 feet

1 Cement Cap in Oil bearing Rock at 18,360 Feet

26

26

#RSAC

#RSAC
Total costs in fines and cleanup efforts are estimated at $65 billion.

DRIVERS
Budget and Schedule

VENDOR ERRORS
Unstable Cement Mixture

COMMUNICATION
Errors Across the Supply Chain

OPERATIONAL
Procedures Not Tested
South Hall 1453

JUDGMENT ERRORS SAFETY MECHANISMS

Faulty Assumptions

Failed to Operate

#RSAC
We face the same factors with Cybersecurity

DRIVERS
Budget and Schedule

VENDOR ERRORS
Product/Service Limitations

COMMUNICATION
Contracts and Operations

OPERATIONAL
Misconfigurations
South Hall 1453

JUDGMENT ERRORS

PREVENTION

Faulty Assumptions

Systems Don't Stop Everything

#RSAC
Controls Scenario
Your public company, ABC Wealth Management, was informed by the SEC that a hacker by the name of "Tailgater" was bragging on the dark web about how he was able to make a tidy profit from the recent sale of your XYZ Wealth Management division. To back this up, the hacker posted several documents he claimed were stolen from ABC prior to the sale (some of them even had document numbers in the footers.) Your CEO Joe Businessperson, and others working on the XYZ deal, are certain they did not share these documents with anyone other than the people directly involved with the sale.
29
South Hall 1453

Controls Part I
THE INVESTIGATION
· Joe's laptop shows no evidence of malware. Analysis of web traffic also did not show anything unusual, and as far as they could tell none of the secure file sharing site's technical cyber security controls failed.
· IT then asked around on Joe's floor, and the marketing director mentioned she did see someone in Joe's office and thought he was from IT. After getting a description of this individual, Facilities looked at security footage and saw an individual casually walking into the lobby elevators with a backpack that looked empty coming in, and full going out three hours later.
CONTEXT
· Joe has a habit of letting the 30 minute activity timeout lock his computer. IT staff found over 2GB of files saved locally in folders on his laptop, many of which were not filed to the document management system - and were also included in "Tailgater's" data dump on the dark web.
30
South Hall 1453

#RSAC
Who should be doing what (as part of incident response)?
· Full inventory of physical assets · Full inventory of data on Joe's laptop (including any
local email cache) · Obtain additional records from building security · Try to reduce scope of threat area (for example, was
this confined to one floor?)
What additional controls might have helped?
· Shorter screen lock timeout? · Stronger perimeter controls · Better awareness of tailgating/breach tactics · Photo ID badge/employee photos on intranet · Prevent writing to removable media · Stronger policy enforcement
What is your communication strategy?
· Senior management/GC leads this (in IRP too) · Compliance/reporting obligations (ex. SEC 17.CFR 229-249) · Ensure communications internal to ABC and to customers
whose data is on Joe's laptop are adequate and controlled

Controls Part II
THE INVESTIGATION CONTINUES
· Two days later, Jane Businessperson, who sits on the floor above Joe, reports that she can't find four paper folders she had checked out from the Records Department. These folders contained documents for a prominent private portfolio customer, a famous teen T.V. star whose trust ABC manages. They included a significant amount of PII, as well as information on electronic funds transfers that occur regularly from the trust to personal bank accounts.
· No one can recall seeing anyone in Jane's office as she and her assistant were both out on vacation (and her assistant is still out for another week). Jane was certain the folders were on her desk when she left.
· Later that afternoon, a story breaks that someone at the T.V. star's bank was tricked into wiring a large sum from a trust account to an overseas account. The bank stated on camera that the notice to change the account seemed to "come from ABC."
31
South Hall 1453

#RSAC
How do you manage this new development?
· Were they in the previous inventory? · A new full office paper inventory should be performed · Contact the assistant who is still out and interview the
rest of the office to make sure no one else picked them up
What evidence is there that these items were stolen?
· None, really · If you can't find the missing folders, since you have
lost control of printed information and it's reasonable to suspect it could have been stolen by a trespasser, you may be obligated to let the customer know the folders have been lost, even if you don't have evidence they were actually stolen https://www.sec.gov/divisions/corpfin/guidance/cfgui dance-topic2.htm
What is ABC's overall liability?
· This one is going to be a decision for executive leadership/counsel/regulators
· Insurance?

#RSAC
Lesson 3: Cybersecurity Adds a New Dimension to Traditional Business Risk Management
The Citicorp Tower Design Flaw

https://www.6sqft.com/former-citicorp-center-is-the-citys-newest-landmarked-b#uRilSdiAngC/
Located at Lexington Ave and 53rd St, the Citigroup it tower was built in 1977 to house the headquarters of Citibank. Sporting the iconic 45-degree angled cap, the structure is over 900 feet (279 m) tall with 1.3 million sqSouuthaHralel 14f5e3 et (120,000 m2 ) of office space sp3re3ad across its 59 floors.

#RSAC
LEFT: https://amazing.zone/citigroup-center-skyscraper-collapse-averted-by-student-s-phone-call RIGHT: http:/S/owuwthwH.baollb1y4b5a3rra.com/blog/2015/10/16/remarkable-engineering-almost-a-disaster-citicorp-tower-nyc

#RSAC

One year later, a civil engineering student at Princeton University calculated wind loads based on city code standards that did not consider cantilevered buildings. The load from a 70 miles per hour (110 km/h) hurricane wind would exceed the strength of the building possibly leading to a collapse. These wind speeds are experienced in New York city on average twice a century.

South Hall 1453

http://www.slate.com/blogs/the_eye/2014/04/17/the_citicorp_tower_design_flaw_that_could_have_wiped_out_the_skyscraper.html

LeMessurier reportedly agonized over how to deal with the problem which would ruin his professional reputation if made public. He approached the architect and Citicorp, to persuade all involved to start work to reinforce the joints of the skyscraper's chevron supports. They concurrently worked with city planners to build an emergency plan. They secretly worked during the night for three months. Six weeks into the work, a major hurricane was headed for New York, but turned and headed out to sea.

#RSAC

South Hall 1453

36

https://www.pinterest.ca/pin/408772103649319763/?lp=true

#RSAC
Twenty years later the story came out

MEETING CODE
Minimums Weren't Enough

VENDOR CHANGES
Bolts Instead of Welds

OBLIGATIONS
Professional Ethical Drivers

MISLEADING
Public Statements
South Hall 1453

PUBLIC SAFETY
Inability to Ensure Safety

IMPROVEMENT
Deprived Industry Knowledge

#RSAC
We face the same factors with Cybersecurity

COMPLIANT
Does Not Equal Secure

VENDOR RISK
Management

OBLIGATIONS
Asset Based Requirements

COMMUNICATION
Clear and Complete
South Hall 1453

PUBLIC SAFETY
Inability to Ensure Safety

IMPROVEMENT
Deprived Industry Knowledge

#RSAC
Nation State Scenario
Last month, Imaginary Law Firm LLP (ILF) received an official communication from the Czechoslovakian government alleging three of their clients have questionable connections to a group that attempted a drone-based assassination of a group of top government officials last year. The letter accuses the law firm of stirring political unrest and threatens retaliation. In a televised speech last week, the Czechoslovakian Prime Minister named the firm a "tool of terrorists" and publicly threatened retaliation.
Within days of the broadcast, ILF employees receive a suspicious email containing a "secure file" link that appears to be from one of their asylum-seeking clients. However, it's not actually from the client, it's a tailored phishing campaign aimed at the law firm, spoofing their client using an email address similar to the one the client actually uses.
39
South Hall 1453

Nation State Part I
THE INVESTIGATION
· Shortly after the emails start coming in, the SIEM and EDR solutions send alerts and an investigation is initiated.
· Credential harvesting tools are discovered on the email server along with a cache of compressed video files that contain random confidential documents and emails not related to this specific case, some of which contain ILF letterhead.
· A hacker group sympathetic to the Czechoslovakian government releases "a set of ILF documents" on Twitter.
CONTEXT
· ILF uses two-factor authentication, application whitelisting and user context enforcement.
· Some exceptions are granted to "rainmaker" partners so that they can still install software when necessary in an emergency.
40
South Hall 1453

#RSAC
What technical issues should they immediately address?
· Contain exploitation and collect forensics · Disable remote access · Review business implications · Make remediation recommendations · Allocate budget for response and remediation activities · Validate hacker claims on Twitter
What actions should management take?
· Approve IT or business outages · Manage attorney, client and public relations · Approve legal and regulatory notifications · Follow the Incident response Plan
How should ILF handle internal/external communications?
· Internal communications strategy · Client and external crisis communications examples · Crisis communications training

Nation State Part II
THE INVESTIGATION CONTINUES
· Two senior partners (rainmakers) were used to gain a foothold in the network.
· Leveraged MS Office macros and Admin session rights.
· Pivoted to virtual servers and stole the credentials of a system administrator to gain access to the email servers and other virtual machines.
· The cache of files is legitimate and goes back 20 years (stolen from mailboxes).
· Investigators discovered and stopped a live (incrementally growing) cache of illegal pornographic material, racist manifestos and other material common on Dark Web sites.
· Identified multiple SSL/TLS-encrypted connections on the laptops of two of the lawyers working the related asylum case. In both cases, these connections and data caches pre-date the current incident.

#RSAC
How has the scope of the incident expanded?
· Professional/Industry-based notification requirements · Privacy or PII (state, international) notifications · Potential criminal investigations · Reputational harm
What additional damage control steps would you take?
· Contact law enforcement (through counsel) · Consider monitoring SSL traffic · Review IP filtering/traffic rules at the edge · Implement more aggressive email retention policies · Provide additional training on use of the DMS · Review DMS logs for further intrusions/lateral movement
How would you revisit the risk vs value of allowing executive exemptions to "restrictive" policies?

41
South Hall 1453

#RSAC
Public resources
42
South Hall 1453

#RSAC
Other Resources
43
South Hall 1453

SESSION ID: LAB1-R08
Only After Disaster Can We Be Resurrected: Field Lessons in CyberIncidents

Mark Sangster
VP and Industry Security Strategist eSentire, Inc. @mbsangster

Jon Washburn
Chief Information Security Officer (CISO) Stoel Rives LLP @Stoelrives

#RSAC

