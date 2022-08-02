SESSION ID: SPO1-T09
Disrupting Adversarial Success-- Giving the Bad Guys No Sleep

Christiaan Beek
ATR Lead ­ Office of the CTO Intel Security
Raj Samani
VP, CTO for EMEA Intel Security

#RSAC

#RSAC
Agenda
Introduction When the power shuts down.... Using botnets for insider trading Giving the bad guys no sleep What's next?
2

Christiaan Beek
Director Strategic Intelligence & Operations Intel Security ­ Office of the CTO
Raj Samani
CTO for Europe, Middle East, and Africa Intel Security

#RSAC
3

#RSAC
When the power shuts down
Ukrainian Power Grid attack
4

#RSAC
When the power shuts down....
Dec 23, 2015: Two Ukrainian power-companies, Prykarpattyaoblenergo and Kyivoblenergo were hit by a coordinated cyber-attack.
As a result of this attack, eight provinces of the Ivan-Frakivk region were impacted, resulting in a power-outage for approximately six hours affecting over 80,000 customers.
The affected company reported to be operating in "manual' mode, an indicator that their network was impacted.
At the same time a DDoS attack was launched against assets of the energy company.
5

Stage 1 of the attack: Flow of events

Cbeek-2016

Reconnaissance Weaponization
Delivery Exploitation Installation Command & Control (C2) Action on Objectives

Excel/Word exploits ­ hidden dropper in Macro
Spear-phishing email in Ukrainian language with weaponized attachment
Execution of macro
Installation of dropper
Connect to C2 and download stage 2 malware
Gather intel of landing point in the target's network

#RSAC

Stage 2 of the attack: Establish control

Cbeek-2016

Reconnaissance Weaponization
Delivery Exploitation Installation Command & Control (C2) Action on Objectives

Using backdoor created by malware to upload tooling
Installation of SSH backdoor or Shells
Connect to Attacker(s) Lateral movement to find machines controlling the HMI
layer

#RSAC

Stage 3 of the attack: Execution time

Reconnaissance Weaponization
Delivery Exploitation Installation Command & Control (C2) Action on Objectives

Installation of Kill-disk component machines controlling
HMI layer
Connect to the HMI machines
Use the HMI software to shutdown the power-grid followed by wiping the systems

#RSAC

#RSAC
At the same time...
While the attackers were shutting down the services, a coordinated DDoS attack was launched against the phone
systems so that operators didn't know that remote sites were out.
9

#RSAC
To be continued......
10

#RSAC
Using botnets for insider trading

#RSAC
Botnets
Traditionally: Remote control, Denial of Service,Pii theft Today a managed service with: · Anonymous communications · Access management to subscribed networks/systems · Help desk Services · Payment Services

#RSAC
Botnets used for insider trading
https://blogs.mcafee.com/mcafee-labs/a-dummies-guide-to-insider-trading-via-botnet/ https://blogs.mcafee.com/mcafee-labs/a-dummies-guide-to-insider-trading-via-botnet-part-2/
13

#RSAC
Giving the bad guys no sleep
1 4

#RSAC
Where to Hit Them?
The six Ds of Cyber Defense
Delay Degrade Disrupt Deny Destroy Defeat
15

#RSAC
Examples of recent Operations
CryptoWall v3.0 Beebone
16

#CryptoWall 3.0
Source: CTA Report CryptoWall 3 operation

#RSAC

#CryptoWall 3.0
Campaign-ID

Infrastructure

Bitcoin Wallets

#RSAC

#RSAC
#OpBeebone

#RSAC
Evasion Capabilities

#RSAC
What Does This Mean?
The McAfee Labs zoo contains more than five million unique W32/Worm-AAEH samples. It infected over 23,000 systems in 2014.
In April 2015, a global law enforcement action took down the control servers for this botnet.

#RSAC
What Does This Mean?

#RSAC
Telemetry Analysis
Total systems infected by W32/Worm-AAEH in 2013-2014

#RSAC
Cracking the Code
First DGA: 6 TopLevelDomains
Then to 3 TLDs

The Plan

DGA Elements Number Suffix Start range Number Suffix End Range

Previous DGA (dnsfor)

Older DGAs

0 (numbers optional) dnsfor.net is acceptable domain in DGA

Numbers optional

Sample-dependent. does not exceed 29. Most samples 15.

None/99

TLDs Active Period

net/com/org 2013-Sep 2014

net/com/org/info/biz 2009-2013

#RSAC
Current DGA (timecheck) 1 (must have number in domain)
29
com/net/org bug in code prevents checking net/org Samples may exist that check all 3 Oct 2014-present

#RSAC
Identify the Command and Control Servers
Sinkholing operation
All of the worm's control servers detected by McAfee Labs between March 14, 2014, and September 14, 2014, were based in Europe
Source: McAfee Labs

#RSAC
Sinkhole
A botnet sinkhole is a target machine used by researchers to gather information about a particular botnet.
Sinkholing is the redirection of traffic from its original destination to one specified by the sinkhole owners.
The altered destination is known as the sinkhole. The name is a reference to a physical sinkhole, into which items apparently disappear.

Sinkhole
Regular Expression for DGA prior to September 22 2014:
^ns1.dnsfor[0-9]{1,2}\.(com|org|net)$ Numbers after "ns1.dnsfor" range from 1 to 30
Examples:
ns1.dnsfor9.com ns1.dnsfor27.net ns1.dnsfor1.org The last known IP for this DGA is 188.127.249.119 at ns1.dnsfor9.com

#RSAC
Regular Expression for DGA after September 22 2014:
^ns1.timechk[0-9]{1,2}\.(com|org|net)$ Numbers after "ns1.timechk" range from 1 to 30
Examples:
ns1.timechk7.org ns1.timechk3.com ns1.timechk19.net The last known IP for this DGA is 91.231.87.184 at ns1.timechk23.com

The Results

Country Iran, Islamic Republic of Peru Kazakhstan Uzbekistan Indonesia Vietnam Guatemala India Thailand Philippines Mexico Ecuador Bolivia Kyrgyzstan Afghanistan Tajikistan United States Algeria Russian Federation Sudan
Source: McAfee Labs

Total 8,403 6,548 3,212 2,947 2,051 1,838 1,643 1,533 1,218 879 685 677 518 375 354 306 250 204 170 168

Region
Africa Eastern Africa Middle Africa Northern Africa Southern Africa Western Africa
Americas Caribbean Central America Northern America South America
Asia Central Asia Eastern Asia South-Eastern Asia Southern Asia Western Asia
Europe Eastern Europe Northern Europe Southern Europe Western Europe

#RSAC

Current total
1267 224 92 560 124 267 11006 64 2421 265 8256 23915 6844 203 6093 10383 392 651 312
14 117 208

Average from prior 7 days
1304 232 91 571 122 287 10441 64 2305 256 7814 23160 6759 199 5728 10091 382 669 316
17 125 210

Difference from average 30 day trend
-2.84% -3.51% 0.94% -2.05% 1.64%
-6.97 5.41% -1.11% 4.99% 3.40% 5.65% 3.26% 1.26% 1.65% 6.37% 2.89% 2.50% -2.71% -1.27% -20.97% -6.40% -1.15

Remediation
https://www.us-cert.gov/ncas/alerts/TA15-098A

#RSAC

#RSAC
Final thoughts...

#RSAC
Summary
Intel Security is actively participating in operations against malware, botnets and actors cooperating with Law Enforcement around the globe and peers.
We respect our customer's privacy and go for protection first before considering press attention.
You and your organization can participate too!
32

