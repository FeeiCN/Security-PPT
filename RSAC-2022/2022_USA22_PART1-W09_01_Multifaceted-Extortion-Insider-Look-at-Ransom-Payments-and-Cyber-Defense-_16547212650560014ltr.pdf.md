#RSAC

SESSION ID: PART1-W09
Multifaceted Extortion: Insider Look at Ransom Payments and Cyber Defense

Dave Wong
Vice President, Consulting Mandiant

Nick Bennett
Vice President, Consulting Mandiant

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Agenda
Multifaceted Extortion and Ransomware Attack Trends Extortion Payment Trends Lessons Learned: Case Study in Effective Cyber Defense
3

#RSAC
Legal Disclaimer
Case studies and examples are drawn from our experiences and activities working for a variety of customers, and do not represent our work for any one customer or set of customers. In many cases, facts have been changed to obscure the identity of our customers and individuals associated with our customers.
4

#RSAC
Ransomware By The Numbers

INVESTIGATION TYPE
Ransomware Investigations

GLOBAL
23% (-2%)

All Ransomware Non-Ransomware
Mandiant (2022). M-Trends 2022.

GLOBAL (DAYS)
21 (-3) 5 (0) 36 (-9)

AMERICAS
22% (-5.5%)
AMERICAS (DAYS)
17 (0) 4 (+1)
32

EMEA
17% (-5%)
EMEA (DAYS)
48 (-18) 4 60

APAC
38% (+25.5%)
APAC (DAYS)
21 (-55) 9 38
5

#RSAC
Ransomware ­ Attacker Tools and Techniques

MALWARE FAMILY
LOCKBIT AVOSLOCKER ALPHV/BlackCat HIVELOCKER Other (<5% Each)

PERCENTAGE OF RANSOMWARE INTRUSTIONS BEGINNING 2022
20% 12% 8% 8% 52%

INITIAL ATTACK VECTOR (WHEN KNOWN)
Prior Compromise FAKEUPDATES Malware
Exploits Stolen / Guessed Credentials

PERCENTAGE OF RANSOMWARE INTRUSTIONS BEGINNING 2022
35% 30% 22% 13%

6

#RSAC
Extortion Accelerators ­ Multifaceted Extortion

Ransomware Encryption

Distributed Denial of Service (DDoS)

Operational Servers Off

Post

Technology

Hours Compromise

SHAMING

MULTIFACETED EXTORTION ($$$)

DATA THEFT

Regulators Media Customers

Personal Identifiable Information

Intellectual Property

7

#RSAC
Ransomware Payment Trends
69% increase in ransomware losses YOY per FBI $602 Million in Cryptocurrency Paid to threat actors in 2021*
*2022 Crypto Crime Report by Chainanalysis: https://go.chainalysis.com/2022-crypto-crime-report.html 8

#RSAC
Payment Recovery
Payments have been recovered with the assistance of law enforcement Many victims are concerned about retaliation Over 98% of Mandiant clients that pay, do not attempt to recovery funds
9

#RSAC
Case Study
Two Victims, Two Outcomes

Both Victims Suffer Attack
Initial access to workstations Lateral movement and install backdoors Sells access & hand off to another threat actor Internal reconnaissance & data theft Lateral movement to privileged systems Credentials obtained for account in domain admins group

#RSAC
Lessons Learned Ransomware detection is about the whole attacker lifecycle Importance of early detection Detection is not just a tooling problem

11

The Response Begins
The Incident Initiate Enterprise-Wide Investigations Intel Tells Us: ­ Ransomware Deployment Imminent ­ Victim 1 notifies law enforcement Begin Remediation Workstream ­ Gain Control ­ Rapid Field Assessments ­ Prepare for Recovery

#RSAC
Lessons Learned Attacker intelligence dramatically changes our response
12

Containment Considerations ­ Isolation
Victim 1 Victim confirms all remote access requires MFA Playbook in place to shutdown egress traffic Victim stages control to block egress
Victim 2 Victim has multiple remote access mechanisms ­ not all protected with MFA Research needed to execute egress blocking

#RSAC
Lessons Learned Validation of assumptions / attack surface management Importance of comprehensive visibility Preparation and playbooks for breach response
13

Rapid Field Assessments
Victim 1 Limited security architecture weaknesses Victim executed plan to gain control of privileged accounts
Victim 2 Significant technical weaknesses in on-prem identity Victim engaged in extended cat and mouse game with attacker

#RSAC
Lessons Learned Strong security architecture begets strong cyber defense Documented ownership and authority facilitates fast action Importance of human expertise
14

Crisis Management & Communications
Victim 1 Prepared holding statements for employees & customers in advance Had experts lined up to negotiate with threat actor
Victim 2 Management waivered on whether they should contact the threat actor, causing attack to escalate Information from incident leaked and customers jumped to inaccurate conclusions

#RSAC
Lessons Learned Plan for the worst Communications is key Ransomware is not just an IT or CISO problem
15

The Attacker Strikes ­ Encryption
Victim 1 Alert triggers on failed ransomware deployment Playbook to block egress ­ ends attacker access Investigation and eradication complete while egress down
Victim 2 Attacker begins deploying encryptors to enterprise Victim unable to control attacker access Victim begins to shutdown servers Unknown number of machines encrypted

#RSAC
Lessons Learned Visibility and strong security architecture provide decisionmaking confidence
16

#RSAC
Extortion and Recovery
Victim 2 Victim can't bring some critical applications back online without decryptor ­ Decryptor clumsy and doesn't scale Fear of encrypting resuming as systems brought back online Victim pays ransom to avoid release of stolen data, stop attack, and help with recovery
17

#RSAC
Key Takeaways
Build a robust security program, but prepare for successful attacks Effective cyber defense not just about latest tools ­ but about intelligence, expertise, and execution Strong security architecture begets strong cyber defense Multi-faceted extortion increases pressure to pay ransoms
18

#RSAC
Thank You

