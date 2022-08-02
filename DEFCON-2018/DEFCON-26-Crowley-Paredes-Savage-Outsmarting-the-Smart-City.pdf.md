Outsmarting the Smart City

DISCOVERING AND ATTACKING THE TECHNOLOGY THAT RUNS

&

MODERN CITIES

Researcher Bios
· Daniel Crowley · Research Baron at IBM X-Force Red · Pen tester since 2004 · Locksport enthusiast and past competition winner · Actually holds the title of Baron (in Sealand)
2 Page

Researcher Bios
· Jennifer Savage · Security Researcher at Threatcare · Black Hat review board member · Experience includes:
 development  vulnerability assessment  vulnerability management  penetration testing  security research
3 Page

Researcher Bios
· Mauro Paredes · Managing Consultant at IBM X-Force Red · Passion for security flaws and their corrections · Formerly developer, net/server admin, security architect · Pen tester for many years · 20+ years infosec experience in multiple industries
4 Page

What kind of tech makes a city "smart"?
· Industrial Internet of Things · Urban Automation · Public Safety / Emergency Management · Intelligent Transportation Systems · Metropolitan Area Networks
5 Page

Limited citizen privacy and risk management options
· You don't have to buy an Alexa · You can buy a non-smart TV · You can buy a feature phone (or forego a cell phone) · You can buy an ancient car · Can you move to a city that isn't "smart"?
6 Page

V2I, V2V, OBD-III and DSRC
Connected vehicles communicate with each other, and with city infrastructure, as travel occurs. While DSRC allows unique identification, the proposed OBD-III standard is much more powerful.
7 Page

Hangzhou "City Brain"
"In China, people have less concern with privacy, which allows us to move faster" - Xian-Sheng Hua, manager of AI at Alibaba at World Summit AI in 2017
8 Page

Smart streetlights with cameras

9 Page

GE's Bill Ruh says it's up to each city to set policies around the data collected by the sensors and how it can be used.

Facial recognition
In 2017 the former head of Singapore's civil service Peter Ong said Singapore wants to deploy facial recognition technology to all 110,000 lampposts in the country.
10 Page

Dubai robotic police force
"By 2030, we will have the first smart police station which won't require human employees" Brigadier Khalid Nasser Al Razouqi, Dubai Police's general director of the Smart Services Department
11 Page

Reconnaissance

Traditional port scanning
· IANA assigned ranges · masscan, unicornscan · Internet scan projects
 SHODAN  Censys  etc
13 Page

Physical
· Visual observation · Wireless recon
 WiFi  900mhz one-offs  Zigbee  LoRaWAN
· Log off and go outside
14 Page

Search engines
· City contracts public by law
 Google: "purchase order" "smart device" site:gov
· Available on the Internet · Customer case studies
15 Page

Search engines
16 Page

Open Source Application Development Portal (OSADP)
17 Page

Case Study: Austin, TX

From port scans
19 Page

From Internet scan data
20 Page

From physical recon
21 Page

From physical recon
22 Page

From Google dorking
23 Page

Devices and Vulnerabilities

Echelon i.LON SmartServer and i.LON 600

i.LON: What it does
· IP to ICS gateway
 LonTalk  P-852  Modbus RTU  Modbus / IP  M-Bus  SOAP/XML Web services  BACnet / IP
26 Page

Probably not OSHA-approved
27 Page

i.LON SmartServer and i.LON 600
Gain access

Do bad things

Default Web credentials Default FTP credentials Unauthenticated API calls (SmartServer only) Plaintext communications Authentication bypass

Cleartext password file on FTP Replace binaries via FTP to execute code
Fiddle with ICS gear Change IP address of i.LON

28 Page

Authentication Bypass
29 Page

Authentication Bypass
30 Page

Authentication Bypass
· SmartServer vs 600  Security Access Mode
31 Page

Leaked exploit from August 2015
32 Page

Battelle V2I Hub

V2I Hub: What it does · Manages Vehicle to Infrastructure comms · Modular infrastructure · Mostly SPaT (signal phase and timing) related
34 Page

V2I Hub v2.5.1
Gain access
Hard-coded admin account Various API key issues XSS SQLi in API Missing authentication
35 Page

Do bad things
Track vehicles Send false safety messages
Create traffic ...or just power it down

Unauthenticated shutdown script
36 Page

API Authentication
37 Page

PHP strcmp() weirdness
38 Page

PHP strcmp() weirdness
39 Page

PHP strcmp() weirdness
40 Page

PHP strcmp() weirdness
41 Page

PHP strcmp() weirdness
42 Page

V2I Hub v3.0 SQL Injection
43 Page

Libelium Meshlium

Libelium Meshlium
Gain access
Missing authentication Shell command injection

Do bad things
Create false sensor data Hide real sensor data

45 Page

Pre-auth shell command injection
46 Page

DEMONSTRATION

Implications

Surveillance of connected vehicles
49 Page

Traffic manipulation
50 Page

Sabotage disaster warning systems
51 Page

Sabotage of industrial equipment and gateway
52 Page

DANIEL.CROWLEY1@IBM.COM ­ JEN.SAVAGE@THREATCARE.COM ­ MAURO@CA.IBM.COM
QUESTIONS?

&
THANK YOU
FOLLOW US ON: ibm.com/security securityintelligence.com xforce.ibmcloud.com @ibmsecurity youtube/user/ibmsecuritysolutions
© C opyright IB M C orporation 2018. A ll rights reserved. The inform ation contained in these m aterials is provided for inform ational purposes only, and is provided A S IS w ithout w arranty of any kind, express or im plied. A ny s ta te m e n t o f d ire c tio n re p re s e n ts IB M 's c u rre n t in te n t, is s u b je c t to c h a n g e o r w ith d ra w a l, a n d re p re s e n t o n ly g o a ls a n d o b je c tiv e s . IB M , th e IB M lo g o , a n d o th e r IB M p ro d u c ts a n d s e rv ic e s a re tra d e m a rk s o f th e In te rn a tio n a l B usiness M achines C orporation, in the U nited S tates, other countries or both. O ther com pany, product, or service nam es m ay be tradem arks or service m arks of others. S tatem ent of G ood S ecurity P ractices: IT system security involves protecting system s and inform ation through prevention, detection and response to im proper access from w ithin and outside your enterprise. Im proper access can result in inform ation being altered, destroyed, m isappropriated or m isused or can result in dam age to or m isuse of your system s, including for use in attacks on others. N o IT system or product should be considered com pletely secure and no single product, service or security m easure can be com pletely effective in preventing im proper use or access. IB M system s, products and services are designed to be part of a law ful, com prehensive security approach, w hich w ill necessarily involve additional operational procedures, and m ay require other system s, products or services to be m ost effective. IB M does not w arrant that any system s, products or services are im m une from , or w ill m ake your enterprise im m une from , the m alicious or illegal conduct of any party.

