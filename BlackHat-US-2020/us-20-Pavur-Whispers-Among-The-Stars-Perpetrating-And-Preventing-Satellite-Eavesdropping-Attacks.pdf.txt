Whispers Among the Stars
Perpetrating (and Preventing) Satellite Eavesdropping Attacks
James Pavur, DPhil Student Oxford University, Department of Computer Science
#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS
2

#BHUSA @BLACKHATEVENTS
3

#BHUSA @BLACKHATEVENTS
4

Bio / Contributors
· PhD Student @ Oxford University, Systems Security Lab
· Title of (blank) thesis_draft.tex file: Securing New Space: On Satellite Cybersecurity
· Don't Work Alone...
· Daniel Moser, armasuisse / ETH Zürich
· Martin Strohmeier, armasuisse / Oxford University
· Vincent Lenders, armasuisse · Ivan Martinovic, Oxford University
5

#BHUSA @BLACKHATEVENTS

Lessons from the Past

Ruhr-University Bochum, 2005

Black Hat DC, 2009
6

Black Hat DC, 2010
#BHUSA @BLACKHATEVENTS

3 Domain-Focused Experiments
18 GEO Satellites
Coverage Area ~100 million km2

#BHUSA @BLACKHATEVENTS

Whose Data?

9 FORTUNE GLOBAL 500 MEMBERS

6 OF 10 LARGEST AIRLINES

~40% MARITIME CARGO MARKET

GOVERNMENTAL AGENCIES

YOU?

#BHUSA @BLACKHATEVENTS
8

3-Minute SATCOM Crash Course

Photo: Three Crew Members Capture Intelsat VI, NASA, 1992, Public Domain

9

#BHUSA @BLACKHATEVENTS

#BHUSA #B@HBULSAAC@KBHLAACTKHEAVTEEVNENTTSS

#BHUSA #B@HBULSAAC@KBHLAACTKHEAVTEEVNENTTSS

#BHUSA #B@HBULSAAC@KBHLAACTKHEAVTEEVNENTTSS

#BHUSA #B@HBULSAAC@KBHLAACTKHEAVTEEVNENTTSS

#BHUSA #B@HBULSAAC@KBHLAACTKHEAVTEEVNENTTSS

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

Threat Model
20

#BHUSA @BLACKHATEVENTS

Nation-State Actor Tech

Photo: Het grondstation van de NSO, Wutsje, July 2012, Wikimedia Commons, CC BY-SA 3.0

21

#BHUSA @BLACKHATEVENTS

Nation-State Actor Tech

Photo: Het grondstation van de NSO, Wutsje, July 2012, Wikimedia Commons, CC BY-SA 3.0

22

#BHUSA @BLACKHATEVENTS

$300 of TV Equipment

Selfsat H30D ~$90 (or any old satellite dish + LNB off Craigslist)
23

TBS-6983/6903 ~$200-$300 (or comparable PCIE DVB-S tuner, ideally with APSK support)
#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

MPEG-TS + MPE/ULE
· Legacy (but still popular) standard
· Sort of a hacked together combination of protocols built for other purposes
· Tools exist for parsing
· dvbsnoop, tsduck, TSReader
· Primary focus of related work from 2000-2010
25

#BHUSA @BLACKHATEVENTS

GSE (Generic Stream Encapsulation)
· More modern, popular among enterprise "VSAT" customers
· In practice, networks assume equipment in the $25k-$100k range

ea er

a loa

S ea er

S ragment Start

S ea er

S ragment n

ea er

rame Data iel

ea er

a loa

S ea er

S a loa

ea er

S ea er

S ragment Start

ea er

rame Data iel

#BHUSA @BLACKHATEVENTS
26

GSExtract
· Custom tool to forensically reconstruct bad recordings
· Applies simple rules to find IP headers / place fragments
· https://doi.ieeecomputersociety.org/10. 1109/SP40000.2020.00056
· Public Release?
· https://github.com/ssloxford

Packet Recovery Rate Using GSExtract

36%

24%

11%

24%

35%

15%
65% 40% 50%

50% 10% 40%

#BHUSA @BLACKHATEVENTS
27

Dish + Tuner Card

DVB-S

dvbsnoop GSExtract

*.pcap

#BHUSA @BLACKHATEVENTS
28

General Findings

NO DEFAULT ENCRYPTION

ISP-ESQUE VANTAGE POINT

BREACH THE PERIMETER
29

#BHUSA @BLACKHATEVENTS

Terrestrial
30

#BHUSA @BLACKHATEVENTS

TLS == Privacy?
#BHUSA @BLACKHATEVENTS
31

TLS != Privacy

Top SSL Certificate Names (MPEG-TS Case Study)

#BHUSA @BLACKHATEVENTS
32

!TLS != Privacy
#BHUSA @BLACKHATEVENTS
33

IOT & Critical Infrastructure
"admin-electro....."
#BHUSA @BLACKHATEVENTS
34

Maritime
35

#BHUSA @BLACKHATEVENTS

Case Study: 100 Random Ships

Art: Rodney's Fleet Taking in Prizes After the Moonlight Battle, Dominic Serres, Public Domain

36

#BHUSA @BLACKHATEVENTS

~10% of Vessels Identifiable
#BHUSA @BLACKHATEVENTS
37

~10% of Vessels Identifiable
#BHUSA @BLACKHATEVENTS

~10% of Vessels Identifiable
#BHUSA @BLACKHATEVENTS

~10% of Vessels Identifiable
#BHUSA @BLACKHATEVENTS

ECDIS
· Electronic Chart Display and Information System
· Standard Formats Support Cryptographic Verification
· But we observed more than 15,000 unsigned charts files in transit
· Many also use proprietary formats

Photo: Navigation system used on an oil tanker, Hervé Cozanet, Wikimedia Commons, CC BY-SA 3.0

41

#BHUSA @BLACKHATEVENTS

Listening Can Be Enough...
Chart Update Via Email Publicly Routable FTP Fileshares
#BHUSA @BLACKHATEVENTS
42

General Privacy
Captain of Billionaire's Yacht ­ MSFT Acct.

Crew Passport Data Transmitted to Port Authorities

#BHUSA @BLACKHATEVENTS
43

Aviation
44

#BHUSA @BLACKHATEVENTS

Where Did the Planes Go????

of epartin fli hts

an

an

e

e

ar

ar

ar

Apr

Apr

a

a

a

n

n

artin fli hts

Chart: Xavier Olive, Impact of COVID-19 on worldwide aviation, https://trafficviz.github.io/scenarios/covid19.html

45

ropean airports
DD A D
S
ast sian airports
T TT S #BHUSA @BLACKHATEVENTS

Where Did the Planes Go????

of epartin fli hts

an

an

e

e

ar

ar

ar

Apr

Apr

a

artin fli hts

Lots of Useless Nonsense (e.g. Instagram Traffic)
Chart: Xavier Olive, Impact of COVID-19 on worldwide aviation, https://trafficviz.github.io/scenarios/covid19.html

Almost Entirely Essential Traffic

a

a

n

n

People Who Really Need to Travel

ropean airports
DD A D
S
ast sian airports
T TT S #BHUSA @BLACKHATEVENTS

Crossing the "Red Line"
"A primary concern is the sharing of these SATCOM devices between different data domains, which could allow an attacker [...] to pivot from a compromised IFE to certain avionics"
47

#BHUSA @BLACKHATEVENTS

The Loneliest EFB

Photo: Gulfstream Aerospace G150, Robert Frola, 2011, Flickr, GFDL.

48

#BHUSA @BLACKHATEVENTS

GSM @ 30,000ft
#BHUSA @BLACKHATEVENTS
49

Active Attacks?
#BHUSA @BLACKHATEVENTS
50

TCP Session Hijacking
· Snoop TCP sequence numbers · Impersonate satellite-terminal
conversation endpoint
· Possibly bi-directional, but more complex
· Network Requirements
· IPs must be routable to attacker · No TCP sequence number
altering proxies
51

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

#BHUSA @BLACKHATEVENTS

Ethics and Disclosure

Adhered to legal obligations in jurisdiction
of data collection
· Data stored securely and only while needed
· Data was never shared with 3rd parties
· Encryption untouched · Won't "name and
shame"

Followed responsible disclosure process
· Contacted satellite operators in 2019
· Reached out to some of the largest impacted customers

Vast majority of companies were receptive
· Shared findings directly to CISOs of several large orgs
· Unclear if any changes have been made...
· Only one organization threatened legal action if we published!

#BHUSA @BLACKHATEVENTS
58

Thanks FBI!
#BHUSA @BLACKHATEVENTS
59

Thanks FBI!
#BHUSA @BLACKHATEVENTS
60

Thanks FBI!

#BHUSA @BLACKHATEVENTS

Mitigations and Defenses
#BHUSA @BLACKHATEVENTS
62

Why Does This Happen?

· Not 100% Incompetence / Ignorance

· Latency -> Miserable TCP Experience

· S s fix wit " e rforman e

n an ing rox ies"

s

· Basically a benevolent Man-InThe-Middle attack

· an 't se tra itional en -to-end VPN and PEP

at odem to or tation

i atenc atellite o

ro nd t ation to
nternet

#BHUSA @BLACKHATEVENTS
63

Short-Term Fixes

Accept VPN performance hit

Use TLS / DNSSEC / etc.

ISP: Alter sequence numbers in PEP

#BHUSA @BLACKHATEVENTS
64

Longer-Term ­ "QPEP"

Satellite

stomer Workstation

Satellite

lient

Terminal

S ro n station

nternet

T Sessions

ltiplexe an

n r p te

Session

Ser er

nternet

Destination Ser er

T Sessions or f rt er V

#BHUSA @BLACKHATEVENTS
65

QPEP Design Principles

OPEN SOURCE

ACCESSIBLE & SIMPLE

Contribute Here: https://github.com/ssloxford/qpep

66

TARGET INDIVIDUALS (NOT ISPS)
#BHUSA @BLACKHATEVENTS

Traditional VPN Encryption (OpenVPN)

Encrypted PEP (QPEP)

~25 seconds
67

~14 seconds
#BHUSA @BLACKHATEVENTS

Key Takeaways

Satellite Broadband Traffic is Vulnerable to Long-Range Eavesdropping Attacks
Satellite Customers Across Domains Leak Sensitive Data Over Satellite Links
Performance and Privacy Don't Need to Trade Off in SATCOMs Design
#BHUSA @BLACKHATEVENTS
68

T e "Next o " i n now n. Encr t ever t in .

Questions/Ideas: james.pavur@cs.ox.ac.uk
Special thanks to a.i. solutions for offering academic access to FreeFlyer, used in our animations!

#BHUSA @BLACKHATEVENTS

