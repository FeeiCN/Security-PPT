SESSION ID: TTA-R02
Nation State & Hacktivist Attacks: Targeted Hits on Asian Organizations

Grady Summers
Senior VP FireEye / Mandiant
@GradyS

#RSAC

#RSAC
Agenda
 An overview of the threat landscape in Asia  APT30  New threat actor activity in Asia  What should you do?
2

#RSAC
Frequency of Targeted Attacks
Percent of customers detecting targeted attacks, July-December 2014
3

#RSAC
Industries Targeted
4

#RSAC
APT30

#RSAC
APT30
 Active for over 10 years  Highly coordinated and organized  Majority of victims in Southeast Asia  Ten industry verticals targeted, including Government, Defense,
Financial Services, and Media
6

#RSAC
APT30
7

#RSAC
APT30 Targets
 96% of victim organizations identified by FireEye located in SE Asia
8

APT30 Targeting ASEAN members

Malware samples using aseanm.com domain

Event

Date

899f512f0451a0ba4398b41ed1ae5a6d compiled

5 May 2011 6:35

e6035ec09025c1e349a7a0b3f41e90b1 compiled

5 May 2011 6:35

18th ASEAN Summit, Jakarta, Indonesia

7­8 May 2011

36a6a33cb4a13739c789778d9dd137ac compiled

9 May 2011 3:34

Seventh ASEAN Plus Three Labour Ministers Meeting (7th ALMM+3), Phnom Penh, Cambodia 572c9cd4388699347c0b2edb7c6f5e25 compiled

11 May 2012 11 May 2012 0:06

f3c29a67a7b47e644e9d1a2a0516974e compiled

11 May 2012 0:06

Senior Officials from ASEAN and China meet on implementation of the Declaration on the Conduct of Parties 24­25 June 2012 on the East Sea (DOC)

afe8447990ecb9e1cd4086955b7db104 compiled

26 June 2012 1:43

b5546842e08950bc17a438d785b5a019 compiled

26 June 2012 1:43

ASEAN-India Commemorative Summit, New Delhi, India

12­20 December 2012

310a4a62ba3765cbf8e8bbb9f324c503 compiled

20 December 2012 3:53

#RSAC

9

#RSAC
APT30 ­ Phishing topics

Nepal's foreign policy

Indian aircraft carrier
Bhutan's foreign policy
10

#RSAC
APT30 Tools
 Tool set has remained very consistent over time, with constant improvements
 Backdoors BACKSPACE and NETEAGLE  Earliest variants of BACKSPACE were compiled in 2005  Earliest variants of NETEAGLE were compiled in 2008
 SHIPSHAPE, SPACESHIP, and FLASHFLOOD, designed to infect airgapped networks via infected removable drives
11

#RSAC
APT30 Command and Control

#RSAC
APT30 Command and Control

#RSAC
APT30 ­ Backspace controller

#RSAC
APT30 ­ Backspace controller

#RSAC
APT30 ­ Penetrating air-gapped networks

#RSAC
APT30 Conclusions
 APT30 is a well-organized group with a long-term mission that represents a regional threat.
 Targeted activity and state-sponsored data theft is not simply a US problem.
 The following key points suggest likely sponsorship of APT30 by the Chinese government:
 Geopolitical issues reflected in APT30s targeting (intended victims, decoy content)  Chinese language indicators in their malware  Level of organization, implied extent of operations, and long-term activity.
17

Recent Activity: APT4, APT5,

#RSAC

APT10, APT17

#RSAC
APT4 at Asian Airline Company
 Airline discovered breach in Q2 2015  Actor is suspected to be APT4
 Well-written and researched spearphishes with industry themes
 CCHIP and Sykipot backdoors  Heavy use of SSL for C2, usually with the
same certificate and a .asp destination  Heavy use of compromised PKI
credentials
19

#RSAC
APT10
 Activity in last several months, compromising an east Asian manufacturer and two Japanese public policy organizations
 Have used video game themed phishing emails, which install an actual (trojanized) video game; primarily Angry Birds and Block  Other phishing emails are poorly worded and minimally researched
 Uses KABOB backdoor to maintain persistence  Other APT10 malware is commonly self-signed and
suffers from high detection rates by commercial AV
20

#RSAC
KABOB
21

#RSAC
Case Study: APT5 at Defense Contractor
 April 2015 attack against south Asian defense contractor  APT5 is highly capable, and has been focusing on "SIGINT"
technologies by targeting telecommunications, information technology, and defense  Initially gathered reconnaissance information from compromised hosts  Stole e-mails, procurement bids and proposals, documents on UAVs, and proprietary product specifications  Group uses BIRDWORLD and ENCORE backdoors
22

#RSAC
APT17
 Targeted Japanese software company in March 2015
 Stole code signing certificate for popular Japanese software product
 Compromised company's web server and posted signed malware for customers to download
 APT17 configured BLACKCOFFEE malware to use Microsoft Technet for C2 communications
 BLACKCOFFEE supports ~15 commands, including creating a reverse shell, uploading and downloading files, and enumerating files and processes.
23

#RSAC
BLACKCOFFEE use by APT17
24

#RSAC
APT Interest in India
 In April 2015, FireEye observed a campaign against government and university targets in Pakistan, Nepal, and Bangladesh
 Spear-phishes used MS Word attachment with names like "Pakistan-iran.doc", which exploit CVE-2012-0158 to deliver a WMI script we call WATERMAIN
 Script has a variable for victim name; we have observed hundreds of string values here
 We suspect Chinese actors were targeting these Indian border countries for information about ongoing and border and diplomatic disputes with India
25

#RSAC
Common Weaknesses
 Lack of instrumentation and collection
 Attackers always leave footprints, but we're often not watching
 Lack of network segmentation  Single-factor authentication for VPN and Outlook Web Access  Poor credential management  Inability to detect or prevent spearphishing
26

#RSAC
Apply What You Have Learned Today
 Next week you should:  Use the APT30 indicators to assess your organization
 In the first month following this presentation you should:  Establish a repeatable process to apply threat intelligence to your data  Evaluate whether you are prepared to detect and respond to a breach like the ones we have discussed
 Instrumentation and detection, spearphishing detection, communication plan
 Within three months you should:  Be planning for the key preventative measures we have discussed: twofactor, credential management, network segmentation
27

#RSAC
Questions?

