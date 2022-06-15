#RSAC
SESSION ID: PART3-W09
What Will it Take to Stop Ransomware?
Mark Bowling
VP of Security Response Services ExtraHop

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Mark Bowling
VP Security Response Services

Ransomware in Context of Current Events
Attackers Have Weaponized Your Network

EXTORTION
$1.85M
Average cost per ransomware incident
4 ransomware attacks per org. over 5 years

EXPLOITATION

EXTINCTION

$4.87M
Average cost per supply chain attack
3x increase in supply chain attacks in 2021

$300M
cost of Maersk's near-extinction
Price of Zero Day Exploits is now $2M

#RSAC

#RSAC

RANSOMWARE
It's not if. It's when.

85%
experience ransomware in the past 5 years

72%
paid the ransom

60%
hit more than once

Cyber Confidence Survey 2022

5

Modern Ransomware is Advanced

Attack Strategy

2016
The "quick buck"
Spray & Pray, automated malware

Initial Access Target

Phish Stolen credentials Drive-by downloads Vulnerability exploit
Consumers

2018
The "fire-and-forget"
Spear Phish, automated malware, self propagating
BYoD Trusted relationships Misconfiguration
Employees

Avg. Ransom Paid
Traditional Mitigation Strategies

$1,077
EDR, Backup

$6,700
EDR, MFA, Phish training, Backup

2021
The "more-pain-more-gain"
Land-n-Pivot, sophisticated lateral tooling
RDP Initial Access Broker(IAB) Supply chain
Enterprise IT
$170,404
EDR, Zero-trust, Phish training, Backup

#RSAC
6

#RSAC
What will it take to stop ransomware?

#RSAC

What does it take to stop a criminal?

Who's responsible for the crime? What is their MO (modus operandi)? What is their motivation? What are their tools? What advantages do they have over us?
What tactics have we already tried?
- Why didn't they work? What did we learn? - What emerging tactics have we not yet tried?

8

Knowing who's behind the attack is critical

Affiliation MO

Ransomware Gang More pain, more gain

Target Motivation

Targeted at victims of financial consequence
Financial gain

Tools

Phishing, RaaS

Nation State
Penetrate as deeply and quietly as possible Directed at specific targets based on strategic calculus
Gather intelligence or achieving military objectives
Zero Days, Supply Chain

#RSAC
9

#RSAC
Motivation: Ransomware Gangs
Money

Why do bank robbers rob banks?

Because that's where the money is.
(And because they pay!)

Willie Sutton

10

#RSAC
Example: Ransomware in Healthcare

Percentage of breaches 2015-2019
76.6%
Healthcare

Personal data value on the dark web according to Experian

$200
PayPal Login

$1,000 Medical
Records

$30
Name, SSN, DOB, Credit/Debit

$20
Driver's License

9.4%

Financial 5.5%
Other

3%
Edu

3%
Retail

2%
Gov

.3%
NGO

$10
Credit/Debit w/ CVV
$5
SSN

Healthcare Data Breaches: Insights and Implications, MDPI, May 13, 2020 Here's How Much Your Personal Information Is Selling For on the Dark Web, Experian, December 6, 2017

#RSAC
Motivation: Nation States
Cyber Warfare - Achieving Political and Military Objectives

Power, Intimidation, &
Influence

Ideology

Retaliation

Intelligence

Stealing money, data, technology

Positive Feedback Loop

National prestige

Greater political influence

12

Reconnaissance Resource Development
Initial Access Execution
Persistence Privilege Escalation
Defense Evasion Credential Access
Discovery Lateral Movement
Collection Command & Control
Exfiltration Impact

The Tools
Ransomware Gangs: Phishing Nation State: Supply Chain
Intrusion (26)

#RSAC

Tools are identical. Nation states may have a higher level of sophistication. Post-Access (167)

Encryption & exfiltration
Exfiltration or destruction
Exploit (22)

#RSAC

Attackers have the advantage

Resources Teams Funding Safe harbor

Time
Focus
Misdirected attention

#RSAC
So, what can we do?

#RSAC
Existing Tactics
Conventional Wisdom Hasn't Slowed Ransomware

MYTH #1
The only way to stop ransomware is to prevent them from getting in.

4.8%
of phishing links still clicked after one year of phishing training
KnowBe4 Annual Phishing Benchmark Report

93%
of Pentests land inside­­without using social engineering tactics
Positive Technologies Annual Report

Existing Tactics
Conventional Wisdom Hasn't Slowed Ransomware

MYTH #2
We have backup (risk mitigation) and cyber insurance (risk transfer), we are resilient to ransomware

The more sophisticated the attack tactics, the more ransom attackers can command.

AVERAGE RANSOM PAYOUT

#RSAC
Recovery is expensive and imperfect
Legal Fees Data Loss Do w n t im e Backup DR
P e o p le Lost Business
Re p u t a t io n Ransom
RANSOM & RECOVERY
Sophos State of Ransomware

Emerging Tactics
Attack Innovation is Happening Inside

INITIAL INTRUSION

GAP IN INTELLIGENCE
Unmanaged devices, cloud workloads, encrypted behavior

72%
DESTRUCTION OF LOGS

67%
ENCRYPTED TRAFFIC

#RSAC BREACH

Reconnaissance Resource Development
Initial Access Execution
Persistence Privilege Escalation
Defense Evasion Credential Access
Discovery Lateral Movement
Collection Command & Control
Exfiltration Impact

22 Exploit

167 Post-Access

26 Intrusion

Reconnaissance Weaponization Delivery Exploit
Installation
Command & Control Action on Objectives

#RSAC

#RSAC
Emerging Tactics
A new layer of defense is required in the Midgame

INITIAL INTRUSION
Phishing CVE IAB
Intruder evades traditional strategies

MIDGAME

Target Enumeration

Lateral Movement

EXPLOIT THE IT INFRASTRUCTURE
Data Staging

Domain Escalation

EXTORTION

Command & Control

Intruder's activity is detectable on the network

Defender mitigates ransomware without shutting down the network

Extortion prevented. Enterprise defended. Customers protected.

Additional Tactics
Zero Trust architecture Mandatory payment disclosure Make crypto traceable

#RSAC
Builds resilience Increases deterrence Removes anonymity

Apply
What is their crime? What is their motivation?
What advantages do they have over us?
What tactics have we already tried? Why didn't they work?
What emerging tactics have we not yet tried?

#RSAC

Extortion

Money Cyber warfare

Resources Teams

Funding Safe harbor

Time Focus Misdirected attention

Keep intruders out ­ Attack surface is too great
Backup & cyber insurance make us resilient to ransomware ­ Helpful solutions in case of emergency, but not a defensive strategy

Stopping intruders in the midgame Legislative deterrence

#RSAC
Prepare for Cyber Warfare
Every organization needs to take action to reduce threat likelihood and impact
 Reduce the likelihood of a damaging cyber intrusion  Take steps to quickly detect a potential intrusion  Ensure that the organization is prepared to respond if an intrusion occurs  Maximize the organization's resilience to a destructive cyber incident

#RSAC
Takeaways
 The more damage ransomware causes, the higher the payout they ensure  You need to fully understand the opponent to stop them
 Affiliation, MO, Target, Motivation, Tools  Ransomware relies on midgame attack techniques
 A new layer of defense is required in the midgame

#RSAC
Thank you
Mark Bowling markb@extrahop.com

