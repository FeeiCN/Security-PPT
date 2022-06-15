#RSAC

SESSION ID:AIR2-M06
Automated Threats: The Rise of Bots and What to Do About It

Matthew Gracey-McMinn
Head of Threat Research Netacea @MGM_Cyber

Simon Goldsmith
Director of Information Security Ovo Energy @CyberGoldsmith

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Why should I care about Business Logic Attacks and Bots?

#RSAC
What is Business Logic?
· The programming that manages interactions between an end-user application and a database

User inputs credentials 1

Credentials incorrect

Access denied

Business Logic Layer

User inputs credentials 2

Credentials correct

Access granted

4

#RSAC
Business logic is digital now
Engaging consumers in a premium, personalised and
connected digital brand experience across all our consumer touch points in
the digital ecosystem

#RSAC
Business Logic In Action: Customer Experience

RESEARCH
.COM AND MOBILE
POST PURCHASE & CRM

Example: 1. Stimuli that intrigues 2. Research the stimuli 3. Explore .com 4. Browse and compare others 5. Remarketed via social media 6. Login/Sign Up/Download App 7. Purchase completed 8. Purchase shipped 9. Purchase received 10. Product reviewed and recommended

EXISTING

OUTPUT: EXISTING or NEW Customer

NEW

BOTS

OUTPUT: HUMAN or BOT
HUMANS

#RSAC
`Hacking' vs business logic attacks

Hackers exploit technical weaknesses in your web-facing systems

BLAs use legitimate activity to exploit business logic weaknesses within your
website

7

#RSAC
Bots & business logic attacks

Good bots
· Search engines · Uptime checker · Security scanners · SEO tools · Partner services · Content aggregator · Price comparison

Bad bots
· Credential stuffing · Sniper · Fake account creation · Carding · Scraping / content harvesting · Scalper · Spinner
8

Timeline

Common

Ubiquity

Bots built and sold for others' use

Bots developed and used for own
BLAs
Bots in support of other activities

Unknown

Supply

Certainty

Demand Need

Bots are sold as a commodity with a professionalised industry built around
them
Defined

#RSAC
9

#RSAC
Financial Services Bot Ecosystem
10

Q. To your knowledge, which of the following have been attacked by a bot in the last year?
Total Travel Online gaming/streaming/entertainment eCommerce Financial services

#RSAC
Telco

96%

65%

72% 65%

75%

25%
Website - 2021

97%

77% 80%

83% 78%

65% 63%

58%

46% 42%

69%

64% 60%

61%

55%

42%

26%

25%

23%

7%
Website - 2022 Mobile app - 2021 Mobile app - 2022

8% 1% 1% 1%
API - 2021

90%

39% 33%

30%

22% 16%

API - 2022 11

#RSAC
Key facts & figures (2022)

3.3% of annual revenue lost to bots on average

Equates to at least $250 million every year for top quarter of targeted businesses

12

#RSAC
Q. What impact have bot attacks had on your customer satisfaction?

Our customer satisfaction has dropped

Our customer satisfaction has improved

96%

96%

95%

95%

100%

4%
Scalper 2022

4%
Account Checker 2022

5%
Sniper 2022

5%
Scraper 2022

Other/Unknown 2022

13

#RSAC
Key facts & figures

16 weeks is the average amount of time taken to discover an attack has happened ­ up 2-4 weeks from last
year

8% of security budgets are allocated to bot management - up from 5% last year

14

#RSAC
How do these attacks work?

The BLADE Framework

Phase

Tactic
Website Creation Credential Acquisition

Infrastructure Acquisition Resource Development
Payment Detail Acquisition

Tool Development

Phase
Attack Execution

Reconnaissance

Loose Target Specific Target

Defence Bypass

Mitigation Bypass Human Emulation
Proxying

Actions on the Objective

Tactic
Account Creation Account Takeover Fake Interaction
Stock Purchase Spinning Sniping
Policy Abuse Payment Detail Abuse Transaction Redirect
Exfiltration

Smokescreening

Phase
Post-Attack

Tactic
Invoice Abuse Delivery Redirect
Resale

#RSAC

www.bladeframework.org

16

#RSAC
Live Demo
17

#RSAC
What should I do about all this?

BLADE Framework Usage

Pre-attack
The adversary establishes resources to aid their operations

Pastebin of stolen payment details from third party breaches

Reconnaissance
The adversary identifies their target and its point/moment of vulnerability

Web scraping for product availability

Example techniques

Defence Bypass
The adversary attempts to bypass anti-bot controls

Automated captcha completion

Attack Execution
The adversary acquires and controls accounts for use during their attack
Actions on the Objective
The adversary undertakes actions upon their objective
Post-attack
The adversary transfers the objective into their possession

Fake account creation and automated purchase with stolen credit card
Dumping of card details from successful payments ­ identifying usable stolen card
details
Redirection of shipped product to adversary location

Defense systems available Perimieter Defences
WAF Bot Management

Outside your control

Fraud Prevention
Manual Review

#RSAC
19

#RSAC
What to do next?
· Today:
­ Begin to understand the bot threat (check bladeframework.org) ­ Help build the community (@bladeframework on Twitter)
· Short-Term:
­ Threat Modelling ­ Check for indicators of business logic attacks (speak to other teams)
· Long-Term:
­ Design and implement a full bot management program
20

#RSAC
Questions?
The threat model is changing...
21

