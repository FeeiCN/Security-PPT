THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
2021 HYBRID WORK EDITION
1

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
TABLE OF CONTENTS
03 Part One: Why Endpoint DLP is Essential for SASE Effectiveness 10 Part Two: Top 5 Myths About DLP 18 Part Three: Key Steps Before You Talk to Any DLP Vendors 25 Part Four: How to Improve Your DLP RFP Process 38 Part Five: Integrated vs. Enterprise DLP 41 Part Six: Making the Business Case for DLP 49 Part Seven: A Proven Roadmap for DLP Success 59 Part Eight: Why Digital Guardian
2

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
PART ONE
WHY ENDPOINT DLP IS ESSENTIAL FOR SASE EFFECTIVENESS
3

PART ONE: WHY ENDPOINT DLP IS ESSENTIAL FOR SASE EFFECTIVENESS

THE HYBRID WORK MODEL IS HERE

TO STAY
"Companies shifted almost their entire office workforce to remote work as the virus spread in the US, and 73% percent of executives say it was a success. This forced experiment is opening opportunities for businesses to address how work gets done across their corporate headquarters, sales offices, contact centers, processing centers and innovation centers.
Now, half of executives (55%) expect to extend options for most of their office workers to work from home at least one day a week post-COVID, up from the 39% of companies who did so before the pandemic."
- PwC Return to Work Survey, June 25, 2020

What percent of your office do you anticipate will work remotely at least one day a week?

Few (0-29%)

Many (30-59%)

Most (60-100%)

Before COVID-19

36%
During COVID-19

25%

39%

2% 21%

77%

After COVID-19 (Projected)

11% 34%

55%

Source: PwC US Remote Work Survey, June 25, 2020. Base: 120 US executive

4

PART ONE: WHY ENDPOINT DLP IS ESSENTIAL FOR SASE EFFECTIVENESS

10,000 REMOTE OFFICES

Before COVID an organization with 10,000 employees and 30 locations had a manageable number of locations to monitor and protect. But now with the hybrid work model it has 10,000 remote offices, including public WIFI locations.
Work from anywhere (WFA) workers are not operating within a managed IT infrastructure. Open, unpatched, or poorly protected home routers make an attacker's job simpler. Web-based chat applications like Slack and Teams are powerful collaboration tools but can also serve as egress channels for an organization's IP and regulated data. Unscrupulous employees may bypass corporate VPNs, upload sensitive data to personal cloud storage services like Google Drive and Dropbox, or use home printers to make copies of product plans, customer lists, and financial records to bring with them to new employers.
USB drives remain a major risk vector with WFA workers. "Handing off" a USB drive to a co-worker is practically impossible when working from home, but in the 2020 DG Data Trends report we surprised to see a dramatic 123% increase in volume of data employees copied to USB devices after the pandemic declaration.

Remote Offices
Home Users

Corporate Network

Network Security Perimeter

Network Applications

No visibility or control over cloud data flows circumventing the network security perimeter
No visibility for data residing

Private Cloud
No data visibility or control for data residing in cloud
services

5

PART ONE: WHY ENDPOINT DLP IS ESSENTIAL FOR SASE EFFECTIVENESS

SASE FOR THE NEW WORK

ENVIRONMENT
Many organizations have turned to cloud-based Secure Access Service Edge (SASE) solutions to address security with a hybrid workforce. SASE combines network security functions like Secure Web Gateways (SWG), Cloud Access Security Brokers (CASB), and Zero Trust Network Access (ZTNA) with Software-defined Networking (SDWAN) capabilities to provide organizations with better control and visibility to users and data on an organization's network. Briefly, SASE pushes security monitoring to the "service edge" where users and systems interact with data. Rather than maintaining security functionality on each device, endpoints redirect traffic to the service edge for authentication, authorization, monitoring, and control.

SD-WAN

Network Security

Carrier
WAN Optmisation

CASB Cloud SWG

Network

Security

Bandwidth Aggregation
Network Vendors
Network as a Service

SASE

ZTNA/VPN WAAPaaS FWaaS RBI

CDN

DNS

Source: Secure Access Service Edge (SASE) ­The Ultimate Guide, Cavell Group Blog, Mar 30, 2021

6

PART ONE: WHY ENDPOINT DLP IS ESSENTIAL FOR SASE EFFECTIVENESS
GLOBAL CONSENSUS: CYBER POLICIES REQUIRE REVAMP
A Gartner Emerging Risks Monitor Report from April 2021 revealed strong consensus globally that cyber policies require revamp for new work environment.
Many organizations were forced to implement quick fixes to serious operational gaps as a result of their initial pandemic responses. Nowhere has that been more apparent than in cybersecurity policies that have prioritized on-premises security over secure remote work access. Executives responsible for these areas are realizing that the time to enact more sustainable and robust policies is now.
--Matt Shinkman, VP, Gartner Risk and Audit Practice; April 27, 2021
7

PART ONE: WHY ENDPOINT DLP IS ESSENTIAL FOR SASE EFFECTIVENESS

SASE DATA PROTECTION GAPS

The current state of SASE leaves organizations with several large data protection gaps.

VISIBILITY TO SENSITIVE DATA ON ENDPOINTS
The Gartner 2021 Strategic Roadmap for SASE Convergence report cites "Sensitivedata visibility and control" as one of the top five gaps in SASE solutions. SASE have visibility to data stored in the Cloud but typically not to on-premises data stores and sensitive data on endpoints.
Endpoints are the primary attack vector for malicious insiders, a simpler target for attackers, and more challenging for infosec teams to control in the WFA environment.

INCONSISTENT POLICY ENFORCEMENT
Cloud-based SASE solutions rely on multiple Points of Presence (POP) to which traffic is redirected for inspection and policy enforcement and, according to Gartner, none yet support distributed cloud architectures or platforms such as AWS Outposts, Google Anthos, Microsoft Azure Stack. This can lead to a requirement for additional solutions at remote offices with low-latency requirements.
In an organization with hundreds or thousands of WFA employees, "additional solutions at remote offices" and consistent policy enforcement using SASE is extremely unlikely, or at best extremely difficult and expensive.

POORLY SECURED WFA ENVIRONMENTS
The remote office is an attractive target for adversaries. Employees can bypass corporate VPN and outdated, unpatched devices can include routers, printers, and Internet of Things (IoT) devices like monitors and IP cameras. Any of these can provide attackers with an initial foothold from which to launch attacks on endpoints and the corporate network. Public WIFI hotspots are an even greater risk.
In short, all the usual challenges exist, but there is less oversight or control over them. Many end users are unlikely to spot a compromised device until the damage has been done.

LOCAL DATA EGRESS
An employee's endpoint need not be connected to the enterprise network to operate. This allows a malicious insider to download sensitive data to a remote storage device like a USB stick or simply print sensitive documents.

8

PART ONE: WHY ENDPOINT DLP IS ESSENTIAL FOR SASE EFFECTIVENESS

ENDPOINT DLP UNIQUELY ADDRESSES SASE DATA PROTECTION GAPS
Endpoint DLP enhances SASE adoption and efficiency by extending visibility and control to the endpoints inside and outside the corporate network.

Control Desktop Apps for Cloud Services
Digital Guardian endpoint DLP extends to both corporate and personal collaboration
desktop applications Microsoft Teams, Skype, Slack, and Zoom to block users from
sharing sensitive information in files and chat ­ or warn them, require a justification,
or just log the attempts to do so.
Controlled Printing
DG endpoint DLP can block printing of sensitive information, even on the user's
home network. Since Digital Guardian understands data classification, user, and action, it can block or warn the user, as well as maintain an evidentiary quality log file of
all attempted and completed actions. Alternatively, Digital Guardian can allow printing, but restrict that action to a named network printer to allow administrative
review prior to releasing the printed documents.

Contextual WFA Data Visibility and Control
To protect data while allowing remote workers full ­ legitimate ­ use, Digital Guardian provides a contextual understanding of three factors: what actions may be taken with the data; by whom; and, under what circumstances.
Data Visibility on and off the Network
Digital Guardian works on Windows, macOS, and Linux endpoints to discover, classify and control sensitive data on and off the network making it easier to see and block threats.

Block & Protect Removable Media
Digital Guardian endpoint DLP monitors and controls sensitive information transfer through Bluetooth, USB, CD/DVD, and Media Transfer Protocol (MTP) and Picture Transfer Protocol (PTP) devices.
Coach Employees
Digital Guardian real-time prompts on the endpoint increase employee awareness and educate users on proper usage. This can be a game changer. We also help you apply enforcement controls that can stop bad actors before the data gets out.
9

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
PART TWO
TOP 5 MYTHS ABOUT DLP
10

PART TWO: TOP 5 MYTHS ABOUT DLP
TOP 5 MYTHS OF DATA LOSS PREVENTION
DLP is too complex, too expensive, breaks business processes, too resource intensive, too limited... Not anymore. Today's DLP is effective, automated and within the reach of more enterprises than ever. Despite the ability to stop data theft and support multiple compliance regulations, DLP's history has been one of hype and disillusionment, resulting in a few myths that need to be dispelled to further illustrate why there are 35+ vendors offering DLP and why you need DLP if you don't already have it! Whether for compliance, data protection or a blend of both, see how DLP has evolved.
11

PART TWO: TOP 5 MYTHS ABOUT DLP
MYTH 1: DLP ALWAYS REQUIRES LOTS OF INTERNAL RESOURCES
While this was true in the past, new DLP options require no dedicated internal resources to manage and maintain and no on-site infrastructure. The introductions of automation and managed security services have eased what was perceived as the "heavy lift" of DLP: hosting, setup, ongoing monitoring, tuning and maintenance. Further, fully hosted SaaS DLP options remove the additional cost, complexity, and general overhead of yesterday's serverintensive DLP.
12

PART TWO: TOP 5 MYTHS ABOUT DLP
MYTH 2:DLP REQUIRES 18+ MONTHS TO DELIVER VALUE
DLP implementations are no longer a "big bang" that take years to return measurable value. Organizations can see results in days rather than months or years. With DLP delivered via a SaaS model, no longer do you need an additional procurement project of servers, databases, and other technology along with the staffing to manage and maintain all that iron. Today's SaaS DLP solutions can be turned on quickly, are modular and allow for iterative deployment as part of a continuously evolving, ongoing data protection program.
13

PART TWO: TOP 5 MYTHS ABOUT DLP
MYTH 3: DLP REQUIRES POLICY CREATION FIRST
Even the best policy wizard in the world can't fix a fundamentally flawed policy, one based on an idealistic or incomplete view of your organization's data map. Today's DLP does not depend on a policy driven approach to get started. Context-aware DLP enables you to automatically collect information on data usage and movement in and out of the extended enterprise, and then work with the business unit leader to define the right policies based on data, not speculation.
14

PART TWO: TOP 5 MYTHS ABOUT DLP
MYTH 4:DLP PROVIDES TOO MANY ALERTS AND FALSE POSITIVES
DLP, like any security solution, does what it is told, for good or for bad. Overly broad policies lead to alert overload, even within those alerts too many of them are false positives. Analysts waste their time investigating, end users are frustrated when business critical processes are blocked or slowed. Data classification, specifically fully automated data classification, delivers the prioritization of these alerts enabling analysts to focus on what matters, attacks targeting sensitive data. What about actions that may appear innocuous, but are really part of a larger attack? DLP with behavioral based rules understands when actions put data at risk and can trigger alerts or automated responses. Add in data classification and the actions that target sensitive data bubble to the top for immediate action.
15

PART TWO: TOP 5 MYTHS ABOUT DLP

THE POWER OF DATA

CLASSIFICATION

Organizations generate volumes of data. This comes as no surprise, but what might be surprising is the accelerating volume at which the data is being created. As an InfoSec professional responsible for protecting digital data, you're going to need a new approach to stay ahead of the data deluge. Data Classification allows you to prioritize your data protection efforts, ensuring you focus on the most critical events, those targeting sensitive data.

Understand the three core classification methods and how they align to your data types, then evaluate the vendors' classification solutions for a match.

Content-based answers "What is in the document?"

Context-based answers "How is the data being used," "Who is accessing it," "Where are they moving it," "When are
they accessing it"

User-based relies on user knowledge and discretion at creation, edit, or review to flag sensitive documents.

LEARN MORE
Read how Digital Guardian Delivers the
most complete data classification solution in
the industry
16

PART TWO: TOP 5 MYTHS ABOUT DLP
MYTH 5: DLP IS ONLY FOR STOPPING DATA THEFT

DLP is called Data Loss Prevention for a reason, but that is not all it can do.
Data can be misused without ever leaving the extended enterprise, DLP can assist with internal investigations such as to prevent insider trading and to document compliance status for audit purposes.
DLP is a valuable too for an exit interview when employees do transition out. It can reinforce privacy conditions as part of many employment agreements.

WEBINAR
Watch this webinar about Defending Your Data During the Great
Resignation

17

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
PART THREE
KEY STEPS BEFORE YOU TALK TO ANY DLP VENDORS
18

TIPS FROM TIM
TIM BANDOS CISO Digital Guardian CISSP, CISA, CEH & CASS

" " Enterprise security is not about deploying and maintaining tools. It is about knowing how your business runs, what data and apps are vital for it to add value to its customers, while fostering a strong risk management strategy to protect those assets.

19

PART THREE: KEY STEPS BEFORE YOU TALK TO ANY DLP VENDORS

PROCESS FIRST, TECHNOLOGY SECOND

Getting your process in order first helps you focus on what matters most ­ what you and your business need ­ not what a vendor has to offer.

Almost 9 out of 10 of buyers want to self-serve part or all of their buying journey.

Due to the pandemic, 33% of buyers spent more time researching products before making a purchase this year.
49% of buyers spent time doing extra research because of data security concerns.
Source: TrustRadius - The 2021 B2B Buying Disconnect

20

PART THREE: KEY STEPS BEFORE YOU TALK TO ANY DLP VENDORS

PROCESS FIRST, TECHNOLOGY SECOND

· Adding new solutions "improves" security, right? · On average, enterprises deploy 45 cybersecurity-related tools on their networks.
· Swapping out introduces the great unknown.

"Firms that deploy more than 50 cybersecurity-related tools ranked 8% lower in their capability to identify threats and 7% lower in their ability to offer a defence."
­ IBM Cyber Resilient Organization Report 2020

Source: "IBM Cyber Resilient Organization Report 2020"
21

PART THREE: KEY STEPS BEFORE YOU TALK TO ANY DLP VENDORS
WHAT TO DO BEFORE YOU CONTACT ANY VENDORS
THE LIST OF THINGS TO DO BEFORE CONTACTING A VENDOR CAN SEEM DAUNTING, BUT IT WILL PROVE BENEFICIAL AND PREVENT THE "CHANGING THE TIRE WHILE DRIVING" SCENARIO THAT LEADS NOWHERE GOOD.
1. Define the problem you are trying to solve and the criteria you intend to use to judge the solution 2. Establish what matters to the various stakeholders ­ what the CISO cares about and what the VP of Sales cares about
may be very different, but you need a common language to evaluate 3. Create a scoring system on functionality that allows people to adjust weightings 4. Set milestones for the internal process and the external process 5. Create a cross functional project team
22

PART THREE: KEY STEPS BEFORE YOU TALK TO ANY DLP VENDORS
WHAT TO DO BEFORE YOU CONTACT ANY VENDORS
THE LIST OF THINGS TO DO BEFORE CONTACTING A VENDOR CAN SEEM DAUNTING, BUT IT WILL PROVE BENEFICIAL AND PREVENT THE "CHANGING THE TIRE WHILE DRIVING" SCENARIO THAT LEADS NOWHERE GOOD.
6. Seek guidance from peers. Look to similar and dissimilar roles/industries 7. Look to online reviews 8. Seek industry analyst guidance, many of whom are regularly briefed by vendors 9. Make a short list of vendors you're interested in 10. Develop an RFP (Request for Proposal) document
23

TIPS FROM TIM
TIM BANDOS CISO Digital Guardian CISSP, CISA, CEH & CASS

"Having a ton of market leader security tools will not make your enterprise secure or prevent a breach if they're not deployed properly.
You need to first arm yourself with knowledge of where your critical data resides and the systems that store it in order to fully utilize these solutions for maximum protection.

24

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
PART FOUR
HOW TO IMPROVE YOUR DLP RFP PROCESS
25

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS
AN RFP IS A LOT OF WORK... IT DOESN'T HAVE TO BE
BITE OFF AS MUCH AS YOU CAN, WHATEVER PREP YOU DO WILL PAY DIVIDENDS TO THE BUSINESS AND IMPROVE THE OVERALL DECISION-MAKING PROCESS.
1. RFPs help meet organizational needs & forces you to define requirements 2. Allows for comparison of one system/solution to another using consistent criteria 3. Gets control of product demonstrations 4. Gets you to think about return on investment 5. Produces an organized selection methodology
26

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS

STRUCTURE YOUR RFP PROCESS FOR SUCCESS

Project Planning

Drafting the RFP

Issuing the RFP

Reviewing Proposals & Award Contract
27

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS

PROJECT PLANNING
1. REQUIREMENTS SCOPE - Start by examining the features of the existing
software that are used and rewriting them into requirements. Look to the broad base of people within the business to ensure you get the full picture. From the admins to the end users, each has a role to play in defining the scope This process of reverse engineering requirements from the existing features is critical to ensure you don't regress on functionality when you see something new and exciting in a potential replacement platform and ignore what you use today.
2. ALIGNMENT WITH BUSINESS STRATEGY ­ How does your business operate
today? What are the things that make it unique? Are you a highly seasonal, retail business where even a few minutes of downtime during the holiday shopping crunch can mean millions? Align the project with the business goals, calendar, and future plans. Are there any major shifts planned? Be aligned with the leadership team and use security solution as a growth accelerator!
3. BUDGET ­ You never have enough time or money but knowing how much you have
sets the guardrails on the project. Don't evaluate a $100mm solution when you have a $100k budget. It wastes your time and creates unrealistic expectations. Understand how that money can be spent too. Opex vs Capex can drastically change budgeting.

Project Planning
"Software selection is like painting a building. The real work is in the preparation, not the selection."
­Unknown

28

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS

PROJECT PLANNING
4. TIMELINE ­ What compelling event, if any, is driving the evaluation and how can
you respond as quickly as needed to address it. If you've been breached, the timeline may be accelerated, if a business peer has been breached, there may be even higher urgency. Transparency throughout the business will avoid nasty surprises. Timelines should be set up front but be realistic about them and allow for slippage when the inevitable happens.
5. STAKEHOLDERS AND REVIEW PANEL - Who is going to be part of the
evaluation process and the decision process. More input is good, to a point. You need technical and non-technical people involved. Each party should know what their level of involvement is and how the final decision will be made. The RACI model can help organize the roles and keep the order. Get them on board and involved early.
6. SCORING CRITERIA AND REVIEW PROCESS ­ How will the points be
assigned and how will the weighting work? Who wants what, and how important is that to them? Does anyone have override authority? Who breaks the tie if it happens? How will you document the procedure so that when the time comes all know what to do and stay to a consistent process? A blend of quantitative/yes/no and qualitative questions allows for objective and subjective data and will give you a more complete picture of capabilities.

Project Planning
The Six Types of Team Decisions
Individual Minority (key individuals) Majority (voting) Consensus Unanimous Consent
"Plop"
Source: Jesse Lyn Stoner (www.seapointcenter.com)
29

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS

DRAFTING THE RFP
1. INTRODUCTION 2. STATEMENT OF PURPOSE 3. BACKGROUND INFORMATION 4. SCOPE OF WORK

Drafting the RFP

Set the stage for the RFP with the details that you and the team already agreed upon, but that the potential vendors have no insights into, yet. The more thorough you are here, the better tailored the responses will be. You'll also eliminate vendors that can't compete.
· Who is the lead, who else is involved · Why is this happening and why now? · What's important for the vendors to know? · How do you box in the project?

30

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS

DRAFTING THE RFP
4. PROJECT SCHEDULE 5. CONTRACT TERMS AND CONDITIONS 6. RFP TIMELINE AND REVIEW PROCESS 7. REQUIREMENTS FOR PROPOSAL

Drafting the RFP

The nuts and bolts of an RFP, such as schedule, T's & C's, and other requirements are a great filter. The last thing you want is to invest time with a vendor, award them the business, and have them tell you that their delivery timelines are well outside your window.

31

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS

ISSUING THE RFP
1. CREATING THE SHORTLIST OF VENDORS 2. DISTRIBUTION TO NETWORKS 3. TAKE 60 SECONDS FOR YOURSELF 4. COORDINATE RESPONSES AND ANSWER QUESTIONS 5. RECEIVE SUBMISSIONS

Issuing the RFP

Getting a proper response means delivering the RFP to the right selection of vendors. You need to make the list manageable, but comprehensive enough to get a feel for the breadth of capabilities. Be sure to give a reasonable and equitable time to respond. Once it's out there, you can take a breath for a minute before the questions come back from the vendors and the responses come in.

32

TIPS FROM TIM
TIM BANDOS CISO Digital Guardian CISSP, CISA, CEH & CASS

"Use conferences and exhibitions you attend intelligently. InfoSec conferences can be beneficial if used in the right direction. Arrive with a plan to view each product you're interested in.
Virtual events add a new wrinkle. They can be helpful given most are now free and none require the time away, but the lack of faceto-face conversations adds new challenges.

33

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS

DON'T GET STUCK IN ANALYSIS PARALYSIS

The reason you invested time up front

Start

in the RFP process was to have a plan

ready to go when the responses came in. Now you can execute (and refine if

Power On

needed) on that plan. Even if you need to modify, you have something to start

Scan Environment

with and that the other stakeholders provided input on and bought into early

Generate Map and Location

in the process.

Plan Route

Route

Vacuum On

Follow Route

Finished

No

Route

Yes

Vacuum Off

Return Power Dock

Power Off

End

Battery

No

Low

Yes

No
Vacuum Full
Yes

Vacuum Off

Stop Moving
Error Indicator On

34

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS

REVIEWING PROPOSALS &

AWARD CONTRACT
1. RFPS SCORED 2. FINALISTS SELECTED 3. INTERVIEWS & REFERENCE CHECKS 4. BEST AND FINAL OFFERS SUBMITTED

Reviewing Proposals & Award Contract

Refer to your scoring matrix you created early on and begin the process of scoring, then ranking each of the vendors based on their submitted answers. How do the vendors rank relative to what's most important to your business needs? If you want to eliminate some bias, you can have a neutral party in your business receive and anonymize the responses. Any questions back to the vendors should be aggregated then submitted together.

Once you're happy with the scoring, you rank them and select the finalist(s). Depending on the scope of the project reference checks, interviews, price negotiations, etc are all the final stage before awarding the winner.
The vendor's provided references are good, but use your own personal network to find unofficial references to boost comfort level.

35

PART FOUR: HOW TO IMPROVE YOUR DLP RFP PROCESS

REVIEWING PROPOSALS &

AWARD CONTRACT
5. CONTRACTS AWARDED 6. FINAL LEGAL CLARIFICATIONS COMPLETE 7. OTHER BIDDERS NOTIFIED

Reviewing Proposals & Award Contract

Once you and the selection committee are satisfied with all the responses and have decided on the winner, you get to make one of the teams happy. Depending on the breadth of the contract, some final legal work may be needed, but given the time invested thus far, both sides should be eager to come to an agreement on any issues and get down to business.
Alas, with any competitive situation, there are those that didn't win the bid. Common courtesy suggests you notify them all in a timely manner. Some may request a feedback call with you to inquire areas they needed to improve. The decision about that rests with the team, though it does help the vendor learn what gaps they have and if they can even address them.
36

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
PART FIVE
INTEGRATED VS ENTERPRISE DLP
37

PART FIVE: INTEGRATED VS ENTERPRISE DLP
INTEGRATED VS ENTERPRISE DLP
When a vendor embeds a feature or functionality to address a specific channel of data loss, this is referred to as Integrated DLP. For example, many secure email gateway providers these days have an added functionality that protects against leaks of data via email. Enterprise DLP on the other hand, is an integrated technology that protects against data loss from all channels and offers more robust data detection and control capabilities. There are advantages and disadvantages to both Integrated and Enterprise DLP. The right choice depends on the nature of your company's data and risk tolerance.
38

PART FIVE: INTEGRATED VS ENTERPRISE DLP

INTEGRATED VS ENTERPRISE DLP

The Upside of Integrated DLP · Allows you to leverage your existing security investments · Gives you high fidelity alerts for a specific channel, such as email, and can be effective for
whichever channel your organization selects
The Downside of Integrated DLP · Compared to Enterprise DLP, it has less sophisticated capabilities to detect sensitive data · Usually siloed by channel, with no integration and no consistent policy across integrated
products · Harder to coordinate for incident investigation and response because you need a console for
each integrated product. This can lead to coverage gaps as your DLP will only cover specific egress vectors

The Upside of Enterprise DLP · Much greater depth and breadth of sensitive data detection methodologies, which
translates into meaningful increases in DLP effectiveness · A central management console that eliminates the need for multiple management interfaces
and significantly reduces the management overhead of a comprehensive DLP program · In combination with CASB it can provide coverage across the complete spectrum of data
leakage vectors
The Downside of Enterprise DLP · Considerably more resource intensive to deploy and manage. DLP as a managed service has
grown dramatically in the past few years in response to this challenge.

When Integrated DLP Makes the Most Sense · If your existing security tools have DLP for specific channels built in, then integrated
DLP can be a cost and resource effective interim solution for companies that aren't in heavily regulated industries, don't have lots of valuable IP to protect, and/or have a higher risk tolerance.

When Enterprise DLP Makes the Most Sense · Although Enterprise DLP is more resource intensive, it provides the level of data
protection that regulated, IP-intensive organizations need. Done right, it can drive changes in business processes that reduce risks to your organization's most sensitive data. For resource-challenged companies, Enterprise DLP as a service is an increasingly popular option.

39

PART FIVE: INTEGRATED VS ENTERPRISE DLP

MANAGED SECURITY SERVICES

EVALUATION CHECKLIST

Functionality or deployment options; where do you start the evaluation? If you know you need a fully managed offering, understand what is included in the service first, before the technical evaluation begins and your team falls in love with something you can't have.

01 Does the MSP have any of the following security certifications, and if so, which ones? Asking about all of these, not only about the standards and regulations of your industry, is one way to demonstrate the vendor's depth and breadth of DLP knowledge:
Statement on Standards for Attestation Engagements (SSAE) 16 (SOC 1) Audited Cloud Security Alliance Cloud Controls Matrix (CCM) Information Technology Infrastructure Library ITIL v3 Payment Card Industry Data Security Standard (PCI-DSS) Department of Defense Information Assurance Certification (DIACAP) Federal Information Security Management Act (FISMA) Health Insurance Portability and Accountability Act (HIPAA) Health Information Technology for Economic and Clinical Health (HITECH) Security Clearance Level (U.S. Federal Government)

02 What steps does the MSP take in cloud DLP delivery to ensure that your sensitive data is protected?
Data collection and dissemination Metadata collection and dissemination Data residency Tamper proof agents Secure communication protocols

SEE OUR BLOG
Read how to hire & evaluate Managed Security Service Providers (MSSPs).

40

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
PART SIX
MAKING THE BUSINESS CASE FOR DLP
41

PART SIX: MAKING THE BUSINESS CASE FOR DLP

HOW TO MAKE A VALUE-BASED

BUSINESS CASE

Data protection makes sense to you, how do you pitch that idea internally to get the financial and political support you need? The key is to make a value-based business case by positioning DLP initiatives in terms that executives recognize.

SWTRHONAGTER'SVAALUVEA-BLASUEED-BBUASINSEESDS CBASUE SINESS CASE?

ions

Demonstrates

alignment with

business priorities

Shows how security contributes to growth and revenue

A value-based business case demonstrates alignment between business priorities and data

protection initiatives. There are

on

Encourages a focus

cost

on understanding

data

Supports data classification, proper data use and handling

two different approaches to identifying value:
· QUALIFY how security

Sends a message that security and privacy are business differentiators

Supports view that security is a business partner and enabler

aligns with the business.
· UNDERSTAND the value of information security.

42

PART SIX: MAKING THE BUSINESS CASE FOR DLP

UNDERSTAND THE VALUE

OF INFORMATION SECURITY

WHAT'S THE TRUE COST OF A BREACH? IT DEPENDS...
There are multiple studies that attempt to quantify, down to the cost per record in case of PII breaches of a data loss incident. The problem is they vary, and when it comes to your business, might not be close enough to base a business decision on it, such as purchasing cyber insurance. Below are some tips to help with the specifics to your organization:

And many fail to include IP theft in their analysis further impacting the applicability to your business.

Are you most concerned with losing PII, PCI, PHI, GDPR type information? In the case of hospitals, retail banks, retail, and hospitality businesses customer records and the information associated with it is the crown jewels. If you fail to protect it, you risk fines and customer churn.
· Fines: GDPR cites the 4% of global revenue as the big stick, what is your global revenue, how would a fine of that magnitude impact your annual earnings?
· Churn: What is your average customer acquisition cost? What would the impact on your organization be if, post-breach, your churn rate went up 5%, 10%?

Are you most concerned with losing intellectual property? Intellectual property is a staple in organizations from manufacturing to pharmaceutical, but it lives in virtually every organization. It is hard to value, often only at liquidation can a value be determined, and this intellectual property comes with a shelf life, such as patent protection limits. To help put numbers that apply to your business:
· Patents: What is the R&D budgeted to patent development? How many patents per year are you awarded? What is the expected revenue from that patent? What would the impact be if one of those patents was stolen?
· Algorithms: In Financial Services complex trading and pricing models are closely guarded as each firm seeks to outperform the market. What would the impact to your organization if your models leaked?

43

PART SIX: MAKING THE BUSINESS CASE FOR DLP

ALIGN DLP WITH COMPANY GROWTH AND INNOVATION INITIATIVES

"DATA SECURITY AND PRIVACY IS A SOURCE OF GROWTH AND DIFFERENTIATION"
Data is the new (insert your favorite valuable item here)! It may sound cliché, but data is what fuels businesses. It is one of the biggest sources of sustainable competitive advantage. According to Forrester, here is how data protection can benefit your business growth and innovation initiatives.

Build trusted customer relationships that drive loyalty and retention. Firms must give customers assurance and additional reasons to do business -- and continue to do business -- with them.
Elevate data security and privacy as a corporate social responsibility. Behind every compromised customer record is a person who must deal with the consequences, and this makes data protection an ethical and moral imperative.
Capitalize on risk. Workforce mobility, internet of things, big data analytics, artificial intelligence, automation, and more all give firms plenty of ways to carve out new opportunities to drive growth. All come with varying levels of security, privacy, and ethical risks that you must address, including data collection, appropriate use, and data access. Security and privacy pros must help manage and mitigate the risks.

Protect future revenue streams. Research and development efforts, corporate secrets, and intellectual property can hold the key to a company's future growth and direction. Safeguard this data against cyberespionage, theft, and careless compromise.
Thrive in a post-EU General Data Protection Regulation (GDPR) world. With GDPR readiness out of the way, S&R and privacy professionals must focus on sustaining compliance over time. From managing third-party risk to reporting data breaches in a timely manner and addressing privacy by design, GDPR requires ongoing compliance.
The Future Of Data Security And Privacy: Growth And Competitive Differentiation, Forrester Research, January, 2021

44

PART SIX: MAKING THE BUSINESS CASE FOR DLP

ALIGN DLP WITH COMPANY GROWTH AND INNOVATION INITIATIVES
TEMPLATE
Using the growth and innovation opportunities from the previous page, determine which ones you can tie your DLP project with to make a growth oriented business case

GROWTH OPPORTUNITY
Build trusted customer relationships that drive loyalty and retention Elevate data security and privacy as a corporate social responsibility Capitalize on risk
Protect future revenue streams
Thrive in a post GDPR world

DESCRIBE HOW YOUR DLP PROJECT CAN SUPPORT (IF APPLICABLE)

45

PART SIX: MAKING THE BUSINESS CASE FOR DLP

A WORD ABOUT CYBER INSURANCE COVERAGE

A KPMG study estimated the cyber insurance market will grow between 20-25% annually and by 2025 reach $20b in premiums, up from $2.5b in 2015. Despite this growth, in insurance terms the industry is still in it's infancy with only ~40% of the Fortune 500 carrying cyber insurance coverage. The industry is learning, both the insured and the carriers, and sometimes it can cause tension. Zurich Insurance is claiming the attack was as "act of war" and denying coverage to Mondelez, who is appealing that decision.
https://assets.kpmg/content/dam/kpmg/za/pdf/2017/12/17383MC-cyber-insurance.pdf

https://www.darkreading.com/attacks-breaches/notpetya-victim-mondelez-sues-zurichinsurance-for-$100-million/d/d-id/1333640

46

PART SIX: MAKING THE BUSINESS CASE FOR DLP

POSITIONING DLP TO THE BUSINESS

DLP is not just a security decision, more titles within the organization are involved in data protection projects.

· CEO and Board · CISO · CFO · CMO · CRO/CCO · Director of InfoSec · Business Unit Lead
Build allies with the business at multiple levels. Business unit executives are data owners, users create and consume data. Engage with them on their key business processes and routine data flows. Identify how they would be impacted by a data breach (besides your security team).

CEO
PAIN POINTS · Business growth · Market perception · Future prospects
LINK DATA PROTECTION TO ADDRESSING PAIN POINTS · Flexibility to expand
organization globally, seek new business partners, securely outsource · Proactive stance on security shows position as industry leader and advanced cybersecurity posture

CISO
PAIN POINTS · Securely enabling the business
to grow · Scalable solutions that don't
overly burden the team
LINK DATA PROTECTION TO ADDRESSING PAIN POINTS · Managed DLP offerings allow
rapid deployment and limit ongoing internal resources · Event-based solutions don't require lengthy policy creation projects · Accuracy enables team to resolve the high risk threats first

CFO
PAIN POINTS · Profitable growth · Efficient use of assets
LINK DATA PROTECTION TO ADDRESSING PAIN POINTS · Managed offerings eliminate
need for additional staff, CapEx to deploy and maintain · Managed offerings deliver predictable expenses · SaaS DLP deployments reduce need for on-site infrastructure and reduce staffing needs

CRO/CCO
PAIN POINTS · Support and document
compliance stance against evolving regulations
LINK DATA PROTECTION TO ADDRESSING PAIN POINTS · Managed DLP delivers
compliance reporting without needing additional staff · Discovery and classification locates and tags sensitive data

47

PART SIX: MAKING THE BUSINESS CASE FOR DLP

POSITIONING DLP TO THE BUSINESS

DIR. OF INFOSEC
PAIN POINTS · Business process security · Efficient use of resources · Advance cybersecurity maturity
LINK DATA PROTECTION TO ADDRESSING PAIN POINTS · Data-centric security protects
the targeted assets ­ data! · Managed offerings eliminate
need for additional staff · Integrations to 3rd party
security and analytics partners increase visibility and speed incident response

BUSINESS UNIT LEAD
PAIN POINTS · Outpacing the market for my
business unit · Collaborating enterprise wide
to drive company growth · "How can I get to be the CEO?"
LINK DATA PROTECTION TO ADDRESSING PAIN POINTS · Pursue creative business
growth initiatives, securely · Share data across company,
securely · Use security as a competitive
advantage to gain new business

CMO
PAIN POINTS · Drive customer experience,
satisfaction, and growth · Outpace the market · Customer churn, customer
acquisition cost
LINK DATA PROTECTION TO ADDRESSING PAIN POINTS · Protect the brand by reducing
likelihood of customer data leaking out · Effectively share strategic growth plans across enterprise securely

USER
PAIN POINTS · Doing job effectively, without
unnecessary burdens · Protecting me from
unintentional leaks
LINK DATA PROTECTION TO ADDRESSING PAIN POINTS · Solutions only intervene when
risky behavior is identified, otherwise invisible to the user · Real time user education and prompts helps users do the right thing

48

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
PART SEVEN
A PROVEN ROADMAP TO DLP SUCCESS
49

PART SEVEN: A PROVEN ROADMAP TO DLP SUCCESS

A PHASED APPROACH FOR DLP SUCCESS
Once you've gone through your internal review, external evaluation, and selection, the deployment process begins. Here is where you need to have a well documented plan. Digital Guardian has implemented DLP programs for hundreds of organizations, the one thing they have in common is a need to protect sensitive data without a drawn-out deployment.
OUR PROVEN, 5-PHASE APPROACH DELIVERS THE ENTERPRISE DLP YOU NEED:

INSIGHT

BASELINE

EDUCATE

ACT

ASSESS

50

PART SEVEN: A PROVEN ROADMAP TO DLP SUCCESS

STAGE 1: INSIGHT

INSIGHT

BASELINE

EDUCATE

· During the initial "Insight" phase focus on the types of data you will need to protect and how they are moving. (Both the intended/approved and the workarounds that will inevitably occur.) Data in use, data in motion, and data at rest.
· Beyond data types and how its being manipulated, is the location of the data. You need to see, understand, and protect it across the entire extended enterprise from the endpoint to the cloud.

ACT

ASSESS

Unknown Types

Unknown Users

Known Data Types, Actions,
Locations, Flows, Users

Unknown Flows

Unkwon Actions

Unknown Locations

51

PART SEVEN: A PROVEN ROADMAP TO DLP SUCCESS

STAGE 2: BASELINE

INSIGHT

BASELINE

EDUCATE

ACT

ASSESS

· Once you have a DLP deployed you need to set policies to see anything, right? A DLP that can deploy in a policy free mode simply collects data on the events that happen in the course of the normal business processes. From this you can establish a baseline of what normal looks like, then build better polices (or establish a cybersecurity training program).
· You will gain tremendous into the business with the unbiased data collection: · Normal data flows throughout the business · Marketing accessing the legal and finance server at off hours · Sales reps encrypting, compressing, renaming excel files to look like .JPGs

· Finance accessing and downloading customer data at 3AM · User attempting to access multiple inactive · Applications spawning other applications and making
registry changes
· With a baseline established, look for anomalies or deviation from expected, investigate, and make an informed decision about the risk to the business.

52

PART SEVEN: A PROVEN ROADMAP TO DLP SUCCESS

STAGE 2: BASELINE

INSIGHT

BASELINE

EDUCATE

· How well can you see "rare processes" in your environment? In a normal day, you would expect Email apps, MS Office apps, or if you in manufacturing CAD apps to launch. But what about things you don't expect to see, like Powershell or developer tools by a member of the HR team? Sorting these rare processes by user can give greater detail or highlight data loss risks.

ACT

ASSESS

# of Launches

Application
53

PART SEVEN: A PROVEN ROADMAP TO DLP SUCCESS

STAGE 3: EDUCATE

INSIGHT

BASELINE

EDUCATE

· Information about data risks that lives only within the information security department doesn't deliver the full benefits it could. The end users need guidance on how to act and what behaviors could be deemed too risky by the business. Because these actions can change as the business evolves, and as security solutions evolve, it's important to provide regular feedback and education to the entire organization.

ACT

ASSESS

54

PART SEVEN: A PROVEN ROADMAP TO DLP SUCCESS

STAGE 3: EDUCATE

INSIGHT

BASELINE

EDUCATE

· Here is an example of how user prompting can encourage better data use decisions. By prompting users about how their actions could put patient data at risk, the organization saw over 85% reduction in unauthorized PHI data transferred.

ACT

ASSESS

UNAUTHORIZED TRANSMISSION OF PHI DATA

1745

# Prompts

Employees prompted

895 763
468

152
January February

87
March

483 110
April

340 100
May

240 78
June

55

PART SEVEN: A PROVEN ROADMAP TO DLP SUCCESS

STAGE 4: ACT

INSIGHT

BASELINE

EDUCATE

ACT

ASSESS

· Even with the insights, baseline, and user education, there are still times that information security solutions like DLP need to take automated actions. Whether the user is ignoring the prompts, or an active and malicious user, security automation can stop data loss before it happens and give the security team the knowledge to further respond to the incident. The question is, what is the right level of action to take? That depends upon the risk profile of the business, but security teams need broad and flexible automation options.

56

PART SEVEN: A PROVEN ROADMAP TO DLP SUCCESS

STAGE 4: ACT

INSIGHT

BASELINE

EDUCATE

ACT

ASSESS

· To best determine the actions, security teams should rank the actions using standardized terms, then assign a risk level to the results. From that list the team can then decide the level of automated response that balances information security benefits with business process interruption. An unauthorized access by and insider might be a moderate level event that requires a justification to proceed, while improper usage by an outsider may be critical and be blocked.

Category · Unauthorized
Access · Potential Malware · Improper Usage · Unsuccessful
Attempt · Explained Anomaly

Type · Insider Threat · Opportunistic · Outsider · Broken Business
Practice

Severity · Critical Impact · High Impact · Moderate Impact · Low Impact

57

PART SEVEN: A PROVEN ROADMAP TO DLP SUCCESS

STAGE 5: ASSESS

INSIGHT

BASELINE

EDUCATE

ACT

ASSESS

· Just as no business is static, no information security policy should be static. New target markets, new delivery options, and new risks all require a consistent review of the DLP program to ensure it still meets the intended data protection goals without impeding the business growth. Over the previous 6 months how easily can you show any changes to data egress? Are there new channels? Has a traditional data egress channel suddenly dropped? While that could mean people are moving less data (unlikely given the data explosion), it's more likely they've found a new method that the security team needs to understand and evaluate.

58

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
PART EIGHT
WHY DIGITAL GUARDIAN
59

PART EIGHT: WHY DIGITAL GUARDIAN
NO-COMPROMISE DATA PROTECTION THAT STOPS DATA LOSS

CLOUD-DELIVERED Powered by AWS, Digital Guardian delivers simplified deployment, low overhead, and elastic scalability for increased return on your security spend.

CROSS PLATFORM Coverage for your Windows, macOS, or Linux operating systems and all your applications, both browser based and native.

FLEXIBLE CONTROLS Fine-grained controls, ranging from log & monitor to automated blocking, help protect data before it's lost.

DEEPEST VISIBILITY We see everything that happens to your organization's sensitive data. Cross Platform

NO POLICY, NO PROBLEM Our "unknown risk" approach enables you to see where sensitive data is located, how it flows, and where it is put at risk - all without policies.

COMPREHENSIVE CLASSIFICATION Only Digital Guardian provides content, user, and context-based data discovery and classification.

60

PART EIGHT: WHY DIGITAL GUARDIAN

THE ONLY CLOUD DELIVERED DATA PROTECTION PLATFORM

Data protection is at the core of our company mission. The DG Data Protection Platform detects threats and stops data exfiltration from both wellmeaning and malicious insiders as well as external adversaries.
· Data Loss Prevention · Managed Detection & Response · Data Discovery · Data Classification · Analytics · Reporting · System Management

DIGITAL GUARDIAN Cloud Platform Cloud Native ­ GA 2017

Third Party Amazon Macie Data Intelligence

Data Analysis Dynamic Reporting Incident Management

DG ARC

RESTful APIs

Microsoft Information Protection

DLP Analysts Threat Hunters Incident Reponders

SIEM, Splunk, SOAR, CASB, Etc.

Threat Analysis

DG Endpoint Agent
MS, macOS, Linux, Citrix, VMware, Hyper-V, AWS Workspaces
eDLP

EDR/MDR

Cloud Retrofit/Dockerized
DGMC
Policy & Agent Administration

Data Export

nDLP

DG Appliance
Virtual/Physical On Prem or Customer Cloud
Discovery

Web Inspection
Proxy

Visibility

File Tag

Controls

Forensics

Investigation

SysAdmin

Web Proxy, CASB

Outbound Email (MS Exchange, Office 365)

Shares, NAS, Databases

SharePoint, OneDrive, Citrix ShareFile, Box,
Egnyte, Accellion

FREE DOWNLOAD
· Digital Guardian Platform Technical Overview
61

USE DATA VISIBILITY INSIGHTS TO ENGAGE BUSINESS LEADERS

Anyone with DLP experience will tell you that DLP isn't just a security or IT initiative. Success depends on support and sponsorship from the business leaders. This is pure common sense. But we have a unique view on how to engage them.
The standard process is to sit down with the business leaders to define all data classification schemes and protection policies in advance. What do we recommend instead?
Start by sharing real discoveries from your "Quick Win" about where sensitive data resides and how it's being used. This will get the attention of your enterprise's business leaders. It will make it much easier for them to understand the risks to the business. And it will make it much easier to collaborate with them. That's exactly what John Graham, former CISO of Jabil did.

"Digital Guardian [Data Loss Prevention] helped us changed the conversation with business unit leaders."
­John Graham, former Chief Information Security Officer, Jabil

62

PART EIGHT: WHY DIGITAL GUARDIAN

PROVEN 5-STEP METHODOLOGY: SPEEDS MIGRATION AND ELIMINATES DATA PROTECTION GAPS

1 Transition Planning

3 Qualification Pilot

5 Production Deployment

From 30-90 Days*

Environment 2 Creation

Policies, Alerting, 4 Reporting Creation

Your Digital Guardian team is with you throughout the entire process. From the initial planning stages, through buildout & testing, and ultimately production deployment, we'll combine on our team's data protection experience with your business knowledge to get you operational quickly.

63

PART EIGHT: WHY DIGITAL GUARDIAN

CASE STUDY
JABIL'S QUICK WIN

SITUATION: Jabil is a Fortune 100 contract manufacturer. The company was at risk of large financial penalties if customer NDAs were violated due to a security incident.
SOLUTION: Within 30 days of DLP deployment, Jabil's security team gained visibility into all data access and usage across 52,000 workstations. They immediately realized that users copying large data files to USB drives was far more common than anyone expected. Digital Guardian's detailed egress reporting on the data leakage from USBs enabled Jabil's security team to have more productive conversations with business unit leaders. These exchanges focused not on defining what data was considered sensitive, but rather on how data from specific servers was being used (in this case copied to USBs) by users.
RESULTS: By providing business leaders real-world information on how data was being used (or misused), Jabil was able to identify and classify their most sensitive data faster and more efficiently. This was a dramatic improvement over a more traditional discovery and classification approach.

Within 30 days of DLP deployment, Jabil's security team gained visibility into all data access and usage across 52,000 workstations.

MORE INFO
Read the full case study here.

64

PART EIGHT: WHY DIGITAL GUARDIAN

CASE STUDY
ENABLING EMPLOYEES TO PROTECT
SENSITIVE CLIENT INFORMATION

SITUATION: The company collects and maintains confidential information on candidates and salaries, including Personally Identifiable Information (PII) subject to regulatory requirements. Protecting this information from attackers and inadvertent disclosure required a comprehensive, but flexible security solution. The task was complicated by separate IT infrastructure and differing privacy requirements in each of 1,000+ offices. In addition, they operated with a lean IT team and capital budget, therefore could not take on workload for deploying and managing new tools.
SOLUTION: Digital Guardian's Managed Security Program (MSP) provided the full-service deployment and support the company's staff required, along with automated classification and enforcement options. Digital Guardian worked to understand appropriate policies for different data classifications and transform those into rules that could be enforced automatically, or provide reminders to users of policies. Digital Guardian automatically classified data based on the source (HR systems) and the content (social security numbers and other PII).
RESULTS: Starting with deployment in a single office, Digital Guardian's MSP team monitored the company's activities to identify those which violated policies. Digital Guardian allowed the company to identify and deter activity not in alignment with acceptable use policies, while treating individuals as the valued employees they were.

MORE INFO
Read the full case study here.

65

PART EIGHT: WHY DIGITAL GUARDIAN

CASE STUDY
THE POWER OF REAL-TIME USER EDUCATION

SITUATION: The company is one of the largest managed healthcare providers in North America. Despite spending more than $1M annually on HIPAA compliance training, an internal audit identified a significant risk of non-compliance. The training had failed because it was a specific event not reinforced through ongoing processes. Users were not diligent about using the company's VPN, where data protection controls were enforced. Remote users routinely traveled with the sensitive data they needed to do their jobs.

UNAUTHORIZED TRANSMISSION OF PHI DATA

1745

# Prompts

Employees

SOLUTION: The company's auditors recommended stricter controls, both on and off the corporate network. The company needed to change user behavior when interacting with sensitive data, reinforce existing policies as data was used, and create a culture that held users accountable for their actions. Digital Guardian helped by enforcing connections through the company's VPN, applying policies in real time based on network awareness, and prompting users who violated data use policies. Users are presented with a prompt screen that requires them to acknowledge the appropriate company policy and provide justification to continue.
RESULTS: Within six months, the healthcare provider reported an 85% decrease in prompts to users, indicating a significant increase in both policy awareness and secure employee behavior.

895 763
152
January February

468
87
March

483 110
April

85%
IMPROVEMENT

340 100
May

240 78
June

WATCH A VIDEO
Watch a video on driving security using real-time
user education.

66

PART EIGHT: WHY DIGITAL GUARDIAN
CASE STUDY
PROTECTING INDUSTRIAL
AUTOMATION IP
SITUATION: Research and development is the lifeblood of the industrial automation market. The company's Chief Information Security Officer, began looking for a solution to protect their critical IP after becoming increasingly concerned about industrial espionage from both domestic and foreign sources.
SOLUTION: After an extensive selection process, the company determined that Digital Guardian provided the best mix of visibility to IP, control over information movement, and low impact on the endpoints and users
RESULTS: Digital Guardian was deployed across 5,000 endpoints. The CISO gained the visibility into the risks to the company's IP and applied controls to policies that had previously been unenforceable. Digital Guardian's MSP provided the support the company desired without the overhead of additional IT staff.

MORE INFO
Read the full case study here.
67

PART EIGHT: WHY DIGITAL GUARDIAN
CASE STUDY
IP PROTECTION AT A GLOBAL INVESTMENT BANK
SITUATION: A global investment firm needed to protect the proprietary source code that powers their financial platform. SOLUTION: Using Digital Guardian Data Loss Prevention, they can monitor users as they check out code, make changes on a local machine, and then check it back in again. The solution tracks each and every event ­ including when, where and how source code is used as well as how it is changed. This visibility prevents users from downloading all or part of the source code via removable devices or uploading it to the web. All events are logged and audited to streamline compliance, forensics and incident response. RESULTS: Digital Guardian allowed the organization to maintain its culture of "open access," while improving security over critical intellectual property. Once the value of Digital Guardian was established in the Investment Banking business, use then expanded into other business units.
68

PART EIGHT: WHY DIGITAL GUARDIAN
CASE STUDY
SECURING PII SHARED WITH THIRD PARTY VENDORS
SITUATION: A regional bank needed to protect its sensitive customer data, which was being shared with thirty party vendors for IT management. The firm realized that failure to secure its PII and PCI could result in regulatory penalties, class action lawsuits, or loss of credibility. SOLUTION: Digital Guardian's Data Base Record Matching allowed deep inspection into the bank's customer databases and created mathematical hashes of the data. Outgoing traffic to external vendors is now inspected for any matches to regulated data, while also preventing unauthorized data access. Our solution's data protection capabilities protect on and off the network as well as across virtual environments. RESULTS: Digital Guardian enables the bank to maintain it's competitive advantage of "safety and soundness.". They understand what data is shared with partners and control where and how data is distributed.
69

PART EIGHT: WHY DIGITAL GUARDIAN

CASE STUDY
MANAGED DETECTION & RESPONSE
AT A MULTINATIONAL BANK

SITUATION: A leading multinational bank needed to protect sensitive financial records from advanced cyber-attacks. Stolen financial data is coveted by criminals because it can be quickly monetized in underground marketplaces. The firm realized that failure to secure these records could not only damage its bottom line but also hurt its customers. The bank found it challenging to hire cybersecurity professionals qualified to protect against evolving cyber threats.
SOLUTION: The bank turned to Digital Guardian's Managed Security Program to detect and remediate threats quickly and efficiently using a proven combination of people, process and technology. Our cybersecurity experts have more than 20 years of experience in threat hunting, incident response, threat research, threat intelligence, investigation and mitigation, protecting the bank from advanced cyber attacks.
RESULT: The bank has upgraded their incident response and threat hunting programs faster than they ever could have with internal resources.

DIGITAL GUARDIAN Managed Detection & Response

70

THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
THE DEFINITIVE GUIDE TO DATA LOSS PREVENTION
2021 HYBRID WORK EDITION
QUESTIONS?
1-781-788-8180 info@digitalguardian.com www.digitalguardian.com
©2021 Digital Guardian. All rights reserved.
71

