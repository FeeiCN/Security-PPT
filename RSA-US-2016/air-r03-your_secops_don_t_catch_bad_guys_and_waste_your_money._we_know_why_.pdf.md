SESSION ID: AIR-R03
Your SecOps Don't Catch Bad Guys and Waste Your Money. We Know Why!

Mark Manglicmot
Senior Manager EY
Adam Tyra
Manager EY

#RSAC

#RSAC
Your average security analyst?

Source: By Mack Sennett Studios [Public domain], via Wikimedia Commons
2

Source: By Employee(s) of Universal Studios (Photograph in possession of SchroCat) [Public domain], via Wikimedia Commons

#RSAC
Agenda
Why aren't we catching bad guys? How can we improve?
Adversary focus ­ what is it and why is it important? Deliberate planning ­ not just for supervillains anymore
Testing a methodology Takeaways and next steps
3

#RSAC
We already pulled the technology lever, and the people lever says "out of order!"

#RSAC
The limitations of cookie cutter controls
Source: http://www.publicdomainpictures.net/view-image.php?image=23618&picture=leftover-cookie-dough&large=1 [Public domain]
5

#RSAC
You probably have enough technology

Your tool deployment might be suboptimal
"Defense in depth" should account for any remaining attack surface
How "deep" is it around your critical assets?
Did you build from the outside in or from the inside out?

Your tool selection might be suboptimal
"Only 3% of 606 unique combinations of two security products managed to detect all exploits." Source: "Correlation of Detection
Failures." NSS Labs. 2013.
Who architected your resource deployment, anyway?

"Expense in depth- the multilayered approach to ensuring minimal return on investment."
Source: Rick Holland's Blog. "Expense In Depth And The Trouble With The Tribbles." December 9, 2012. Accessed February 10, 2016.
6

#RSAC
The SOC team and security alerts
How many of those alerts represent actual intrusions/security incidents?
"395 hours are wasted each week ... because of false positives."
Source: "The Cost of Malware Containment." Ponemon Institute. Jan 2015.
That's 10 full-time employees!
Is this an effective use of time? We call it available capacity!
Source: http://uncyclopedia.wikia.com/wiki/File:Hamster-wheel.jpg [Public domain]
7

#RSAC
Squeezing value from your existing technology and current staff

#RSAC
Injecting adversary focus
Adversary focus- a product of adversary knowledge combined with self-knowledge
Do you know your enemies? Which named threat actors are your most likely adversaries? What, specifically, do they want? Hint: It might not be what you think!
Do you know yourself? Which of your assets are most critical to your (business, not IT) operations? Hint: It isn't your domain controllers!
9

#RSAC
Understanding adversary intent

Differentiate between high-value and high-payoff targets
Penetration testers pursue high-value targets....and then stop Real adversaries pursue high-payoff targets
Remember- data theft is just one potential outcome of an attack
10

Source: FM 7-7: The Mechanized Infantry Platoon and Squad, U.S. Army.

#RSAC
The value of adversary focus

Enables resource deployment optimization

Blocks known tactics and techniques of named adversaries:

Cyber kill-chain analysis links real tactics to real targets

Source: Manglicmot, Mark, and Adam Tyra. "Enhancing Your Security Operations with Active Defense." 2016.

Targeted countermeasures complicate legitimate threat scenarios

11

#RSAC
Seizing the initiative via deliberate planning

You know what the adversary may do. What will you do?

Craft a coherent enterprise security strategy:

Develop concrete objectives Survey the means available Develop courses of action

Source: Manglicmot, Mark, and Adam Tyra. "Enhancing your security operations with Active Defense." 2016.

Iterate rapidly! Plan, execute, review, repeat!

12

#RSAC
Turning cops into detectives with adversary focus and deliberate planning

#RSAC
Testing our ideas
We tried this at a global technology company ...
Data centers located in Europe, North America, Asia, Australia Cloud environment hosting virtually all web-based technologies, OS variations, etc.
... with a sophisticated cybersecurity apparatus:
24x7 global security monitoring In-house cyber threat intelligence team
14

#RSAC
What we did

Developed multiple insight-driven, deliberately planned "missions":

Threat Scenario

Our Response

"Bad Guy A" uses Tor with custom malware to circumvent security monitoring tools and hide data exfiltration.

Develop and deploy targeted countermeasures to detect Tor usage. Identify and eliminate rogue connections.

"Bad Guy B" exploits Kerberos "golden tickets" to gain access to high payoff targets. Kerberos servers cannot be rebooted to destroy existing tickets.

Conduct anomaly analysis by comparing authentication logs to ticket creation logs in order to detect golden ticket usage. Deploy additional monitoring to surveil high payoff targets.

"Bad Guy C" targets cloud infrastructures to build low-cost, easy to maintain botnets for hire resulting in resource theft and bandwidth cost overages.

Identify and dollarize malicious traffic. Deploy targeted countermeasures to block malicious traffic. Identify and remediate compromised hosts participating in botnet activity.

15

#RSAC
Key outcomes
Identified and eliminated malicious activity:
Every hunt achieved a reduction in targeted activity. Average time required to identify and trace activity cut significantly.
Exposed weaknesses in organizational processes:
Failures in information sharing-multiple cybersecurity silos Missing procedures for critical activities
Enhanced operational efficiency (saved the client $$$)
16

#RSAC
Analyzing large bandwidth usage events
Combined Outbound Unknown Alerts (12-16 Nov 2015)
8000 7000 6000 5000 4000 3000 2000 1000
0
Time from 12-16 November 2015 (GMT)

22:18 0:38 2:58 5:18 7:38 9:58
12:18 14:38 16:58 19:18 21:38 23:58
2:18 4:38 6:58 9:18 11:38 13:58 16:18 18:38 20:58 23:18 1:38 3:58 6:18 8:38 10:58 13:18 15:38 17:58 20:18 22:38 0:58 3:18 5:38 7:58 10:18 12:38 14:58 17:18

Bandwidth Usage (Mbps)

#RSAC
Is that a botnet picking your pocket?

Bandwidth Usage (Mbps) 13:01 14:41 16:21 18:01 19:41 21:21 23:01
0:41 2:21 4:01 5:41 7:21 9:01 10:41 12:21 14:01 15:41 17:21 19:01 20:41 22:21 0:01 1:41 3:21 5:01 6:41 8:21 10:01 11:41 13:21 15:01 16:41 18:21 20:01 21:41 23:21 1:01 2:41 4:21 6:01 7:41 9:21 11:01 12:41 14:21

Combined outbound DDoS alerts (16-19 Nov 2015)

20000 18000 16000 14000

17,000 Mbps for 3.5 hours

Well-defined start and stop times represent controlled, coordinated activity

12000

10000 8000 6000

2,500 Mbps for 2.5 days

4000

2000

0

Time from 16-19 November 2015 (GMT)

18

#RSAC
Bonuses of deliberate planning
Planning as a professional development tool:
Staff are forced to devise new tactics and procedures. Staff become adept at predicting outcomes/roadblocks Gathering lessons learned is critical to creating a learning organization
Planning enhances effectiveness:
Reduces ad hoc resource expenditure Reduces susceptibility to "leading practices" and other fads:
Vulnerability of the month?
19

#RSAC
Takeaways

#RSAC
Takeaway themes
Focus your (limited) resources on protecting your most critical assets:
Create defense in depth by building outward from likely targets Plan to defeat the most likely threat scenarios against the most likely targets- not to defeat all attacks from all adversaries
Put your staff to work:
Stop waiting for your tools to find/stop advanced attackers! Deliberately plan and conduct missions to identify and eliminate legitimate threats and harden critical assets
21

#RSAC
Next (first?) steps
This month ­ identify and study your adversaries:
Discuss with industry peers, review past security incidents and start consuming cyber threat intelligence
This quarter ­ develop an security operations strategy:
What will you defend and from whom? How will you defend it?
This year ­ seize the initiative from attackers:
Initiate continuous proactive operations (plan, execute, review, repeat) Capture and apply lessons learned
22

#RSAC
Where to learn more (free stuff)
"Enhancing your security operations with Active Defense"
ey.com/cybersecurity
Questions?
23

#RSAC
EY | Assurance | Tax | Transactions | Advisory About EY EY is a global leader in assurance, tax, transaction and advisory services. The insights and quality services we deliver help build trust and confidence in the capital markets and in economies the world over. We develop outstanding leaders who team to deliver on our promises to all of our stakeholders. In so doing, we play a critical role in building a better working world for our people, for our clients and for our communities. EY refers to the global organization, and may refer to one or more, of the member firms of Ernst & Young Global Limited, each of which is a separate legal entity. Ernst & Young Global Limited, a UK company limited by guarantee, does not provide services to clients. For more information about our organization, please visit ey.com. Ernst & Young LLP is a client-serving member firm of Ernst & Young Global Limited operating in the US.
© 2016 Ernst & Young LLP All Rights Reserved.
This material has been prepared for general informational purposes only and is not intended to be relied upon as accounting, tax, or other professional advice. Please refer to your advisors for specific advice.
24

