SESSION ID: PDAC-R01
What Was Once Old Is New Again: Domain Squatting in 2020

Jeremy du Bruyn
Practice Manager Sense of Security @herebepanda

Willem Mouton
Head of Research Sense of Security @_w_m__

#RSAC

#RSAC
Agenda
Story 1: The adventure
­ An introduction to domain squatting and our work to quantify how big of a problem it is.
Story 2: A cautionary tale
­ How we used domain squatting to gather tons of useful information during our red team exercises.
2

#RSAC
Introduction: Domain Squatting 101

Domain Registration Process

Name

NO

YES

YES

Available?

Register

DNS

#RSAC

renew

NO Abandon

SOA

NS

MX

A

4

Domain Squatting: Goals
Financial Gain
Sell domain Advertising Affiliate programs ...

#RSAC
Maliciousness
Phishing Malware Information leakage/gathering ...

5

#RSAC
Domain Generation methods
Typosquatting TLD "substitution" "Missing-dot" "Combo" Homoglyphic
­ à, , 
Abandoned domains Homophones
­ bobs-oars.com = bobs-ores.com
6

#RSAC
FYI: goolge.com
7

#RSAC
Chapter 1: The Journey Begins

#RSAC
Some questions we had
How many domain squatting domains are there? Just how big a problem is domain squatting?
9

#RSAC
The targets
10

#RSAC
The targets
4,478 targets 3,126 DNS domains
11

#RSAC
Our approach v0.1
Sourced 247+ million registered domains Squatting categories:
1. Typosquatting ­ (Levenshtein distance) 2. TLD "substitution" (1550+ TLDs) 3. "Missing-dot" (wwwexample.com)
12

#RSAC
Levenshtein distance
Words/domains within 1 "edit" of a target domain
1...................................0...................................1 xample.com example.com examples.com
13

#RSAC
Finding the squatters

267,634 possible squat domains identified

­ Typosquatting :

173,512

­ TLD "substitution" : 92,890

­ "Missing dot" :

1,232

A LOT were legitimate, so we needed to differentiate
­ abc.com is not a squat of abb.com

The journey begins...
14

#RSAC
Chapter 2: Categorisation

#RSAC
Let's get with the categories
Categorised all 267,634 domains Manually verified 1000's Many, many false-negatives Cannot use domain categorization alone
16

Not always correct
Banking and Finance

Business

#RSAC

17

Although sometimes...
Personal Vehicles

Spam URLs

#RSAC

18

#RSAC
Chapter 3: DNS

Records collected

Name

NO

YES

YES

Available?

Register

DNS

#RSAC

renew

NO Abandon

SOA

NS

MX

A

20

#RSAC
DNS Totals

Start of Authority (SOA): 268,130

Name servers (NS) :

757,981

Mail Exchangers (MX): 1,053,492

Grand Total:

2,079,603

21

#RSAC
Largest DNS SOA providers
1. namebrightdns.com 2. uniregistrymarket.link 3. sedoparking.com 4. parkingcrew.com 5. dns.com 6. bodis.com 7. cscdns.net 8. registrar-servers.com
22

#RSAC
Verification
Again cross-referenced results with screenshots More false-negatives Squatters don't all congregate on known "bad" DNS servers Squatters also host on "good" DNS servers
We venture forth....
23

#RSAC
Chapter 4: Intersection

#RSAC
Correlation
Domain Categorisation

DNS NS

DNS SOA

25

#RSAC
Confirmed squatting domains
Conservatively identified 45,646 domains
­ Approximately 17% of the total domains
71.4%

18.8% typosquatting

27.7% 13.6%
tld "substitution"
% squats % total
26

31%
0.8% "missing-dot"

#RSAC
Largest DNS SOA squat providers
1. uniregistrymarket.link. 2. sedoparking.com. 3. parkingcrew.net. 4. dns.com. 5. above.com. 6. bodis.com. 7. parklogic.com. 8. name-services.com. 9. domaincontrol.com.
27

#RSAC
Top 10 squatted organisations
1. Ares Management (aresmgmt.com) 2. Fogo de Chão (fogo.com) 3. Facebook (facebook.com) 4. Quantum Corporation (quantum.com) 5. Zillow (zillow.com) 6. Coupons.com (coupons.com) 7. Progressive Corporation (progressive.com) 8. Uber (uber.com) 9. The Hartford (thehartford.com) 10. United Airlines Holdings (united.com)
28

#RSAC
Domain Length: Counts and Squats
10000

1000

100

10

1

Target 2

3

4

5

6

7

8

9

10

11

12

13

14

15

16

17

18

19

20

21

22

23

Length

Count

Squats

29

#RSAC
Umbrella Popularity List--Top Million Domains Rank #214,070
30

#RSAC
Chapter 5: Conclusion

#RSAC
Remember for later...
Squat domains with MX records: 23,131(~50%)
32

#RSAC
Lessons learned
1. Using Levenshtein distance is useful, but expect a lot of data 2. It's difficult to tie a squatting domain back to a specific target 3. It's even more difficult to identify the actual owner of the
squatting domain 4. Domain categorisation is not an exact science 5. DNS domains change OFTEN (duh) 6. Squatters employ some creative techniques to hide their
infrastructure
33

#RSAC
Future work - v0.2
Go bigger:
­ Targets (more stock exchanges) ­ Squat types (combo, abandoned, etc.) ­ Domains list (250 million is not enough)
Continuous analysis, not point in time "Faster" domain categorisation system
­ We played nice, but need something that scales
Include more features (screenshots, ssdeep, keywords)
34

#RSAC
A Cautionary Tale: Red Team domain squatting

#RSAC
Chapter 1: The Quest for Treasure

#RSAC
Goals
Find a more intelligent way of identifying useful squatting domains, not as much brute force Capitalize on mistakes made by clients and employees Gather data passively
­ Email behavior ­ Types of data sent / received ­ Supply chain interactions ­ Contextual information used for social engineering
37

#RSAC
Problems needed solving
Large number of candidate domains Traditional obvious ones already taken Budget of AU$20  (That's Aus $$)
38

#RSAC
Chapter 2: Red Team 2019

#RSAC
The Target
Multinational Medical service provider
­ Hospital services ­ Pharmaceutical services ­ Doctor and specialist services ­ 5,000+ employees
Interactions
­ Employees ­ Patient (Medical, financial) ­ Suppliers (Services, Productions and infrastructure) ­ Government (Healthcare, financial and law enforcement)
Highly sensitive data
40

#RSAC
Choosing our domain
Breach data as "validation source"
­ There is lots of it, and mostly free ­ Typo's in breach data is usually caused by people mistyping their own
email address ­ Typo domains with multiple occurrences in breach data is typically a good
indication
Found a target domain with multiple unique accounts (Lots of employees making the same mistake)
41

#RSAC
The Setup
42

#RSAC
General Statistics
First email received within 2 min 10,000+ emails received during 30 day period ~2,600 legitimate file attachments (disregarded images from mail signatures, etc.) of these 850 were classed as business related documents 12.6% of emails received were from target organization internally
43

#RSAC
General Statistics

600
500 441
401 389 400
299 300

Email Per Day

439 412 420 399 411

501 405 420 392 401

519 475 455
423 379

425 383

200 153
100

104 89

120 68

120 111

99 29

0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30

44

#RSAC
General Statistics
First email received within 2 min 10,000+ emails received during 30 day period ~2,600 legitimate file attachments (disregarded images from mail signatures etc) of these 850 was classed as business related documents 12.6% of emails received was from target organization internally
45

#RSAC
Loot
46

Who Were Sending The Emails

10

6 9

22 5 33

7 88

6

43

2 2 22 2

1 1

1

11

11 9

15 15

25 26 32
38

45

46
58 96

Domains
262 149

47

#RSAC
Business Health and Wellness Information Technology Newly Observed Domain Government and Legal Organizations Spam URLs Education Finance and Banking Shopping Travel Job Search Real Estate Restaurant and Dining Sports General Organizations

Attachment Breakdown

Business document types

.vcf, 1 .rtf, 3

.xls, 20

.xlsx, 9 .zip,

.csv, 1

1 .docm, 1

.doc, 47

.docx, 106

.ics, 2 .odt, 3

.csv .doc .docm .docx .ics .odt .pdf .rtf .vcf .xls .xlsx .zip

.pdf, 656

48

#RSAC

#RSAC
Leaky MFPs
49

Supply Chain map

Doctors Hospitals Laboratories Suppliers
NHI

Health & Wellness

Target Organisation

Finance Recruitment Outsourced
50

#RSAC

Support

IT

Development

Vendor

Procurement

Business

#RSAC
Conversations ­ Information & Technology
51

#RSAC
Conversations ­ Information & Technology
52

#RSAC
Chapter 3: Execute plan A! ...B...C

#RSAC
Putting the Information to Work ­ Plan A
The Phish...
Phishing campaign
­ Client had aggressive mail filtering rules in place ­ Support emails disclosed the endpoint protection in place ­ Identified several email addresses whitelisted to receive .docm macro
enabled documents
54

#RSAC
Putting the Information to Work ­ Plan A
The Phish...
Phishing campaign
­ Client had aggressive mail filtering rules in place ­ Support emails disclosed the endpoint protection in place ­ Identified several email addresses whitelisted to receive .docm macro
enabled documents
55

#RSAC
Putting the Information to Work ­ Plan B
Hello Bianca, this is Will from FINSupport...
Telephone campaign (Vishing)
­ Zero success due to heightened client employee awareness ­ Using application support ticket as pretext for call ­ 100% success in convincing target that we are from IT 
56

#RSAC
Putting the Information to Work
Hello Bianca, this is Will from FINSupport...
57

#RSAC
Putting the Information to Work
Hello Bianca, this is Will from FINSupport...
58

#RSAC
Putting the Information to Work
Hello Bianca, this is Will from FINSupport...
59

#RSAC
Putting the Information to Work
At the end of the rainbow
Internal information
­ Received onboarding emails containing domain information from HR systems
­ Internal Risk management system password reset / registration emails ­ Sensitive business and internal documents from multifunction office
devices
60

#RSAC
Defensive measures

#RSAC
Apply
Proactive actions
­ Up to date domain inventory ­ Register trademarks ­ Response procedures / takedown playbooks ­ Employee education
Reactive actions
­ Monitor internet sources for potentially risky domain registrations ­ Identify typo domains within your mail server logs ­ Take control (and keep control) of the riskiest domains
62

#RSAC
Questions

Jeremy du Bruyn jeremyd@senseofsecurity.com.au

Willem Mouton willemm@senseofsecurity.com.au
63

