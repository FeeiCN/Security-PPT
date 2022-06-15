Outsmarting the Smart City

&

DISCOVERING AND ATTACKING THE TECHNOLOGY THAT RUNS MODERN CITIES

Researcher Bios
· Daniel Crowley (@dan_crowley) · Research Baron at IBM X-Force Red · Pen tester since 2004 · Locksport enthusiast and past competition winner · Actually holds the title of Baron (in Sealand)
2 Page

Researcher Bios
· Jennifer Savage (@savagejen) · Security Researcher at Threatcare · Black Hat review board member · Experience includes:
 development  vulnerability assessment  vulnerability management  penetration testing  security research
3 Page

Researcher Bios
· Mauro Paredes (@mauroparedes) · Managing Consultant at IBM X-Force Red · Passion for security flaws and their corrections · Formerly developer, net/server admin, security architect · Pen tester for many years · 20+ years infosec experience in multiple industries
4 Page

What kind of tech makes a city "smart"?
· Industrial Internet of Things · Urban Automation · Public Safety / Emergency Management · Intelligent Transportation Systems · Metropolitan Area Networks
5 Page

Limited citizen privacy and risk management options
· You don't have to buy an Alexa · You can buy a non-smart TV · You can buy a feature phone (or forego a cell phone) · You can buy an ancient car · Can you move to a city that isn't "smart"?
6 Page

V2I, V2V, OBD-III and DSRC
Connected vehicles communicate with each other, and with city infrastructure, as travel occurs. The proposed OBD-III standard raises privacy and due process concerns.
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

Search Engines
· Customer case studies · News reports · Smart City Open Data Initiatives · Some city contracts are public by law
 Google: "purchase order" "smart device" site:gov
13 Page

Public Systems Are Already Mapped
· IANA (Internet Assigned Numbers Authority) ranges · Internet infrastructure search engines
 SHODAN  Censys  etc
14 Page

Physical Recon
· Visual observation · Wireless recon
 WiFi  Monitor Unlicensed Bands  Zigbee  LoRaWAN
· Log off and go outside
15 Page

Source Code Repositories
· Github · Bitbucket · Gitlab · OSADP
16 Page

Case Study: Austin, TX

News Reports
"How Austin brought the human touch to smart city planning" Digital Trends - July 31, 2017 "Austin, TX to test autonomous transit shuttles" Smart Cities Dive - June 28, 2018
"Austin reinventing itself into a Smart City" Austin Business Journal - Jul 30, 2017 "Austin is getting its own "smart" street" The Architect's Newspaper - August 23, 2017
"How Can Austin Achieve Smart City Status?" KUT - Mar 14, 2017
18 Page

Austin CityUP
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
· SmartServer vs 600
 Security Access Mode
31 Page

Leaked exploit from August 2015
32 Page

Battelle V2I Hub

V2I Hub: What it does
· Manages Vehicle to Infrastructure comms · Modular infrastructure · Mostly SPaT (signal phase and timing) related
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
© Copyright IBM Corporation 2018. All rights reserved. The information contained in these materials is provided for informational purposes only, and is provided AS IS without warranty of any kind, express or implied. Any statement of direction represents IBM's current intent, is subject to change or withdrawal, and represent only goals and objectives. IBM, the IBM logo, and other IBM products and services are trademarks of the International Business Machines Corporation, in the United States, other countries or both. Other company, product, or service names may be trademarks or service marks of others. Statement of Good Security Practices: IT system security involves protecting systems and information through prevention, detection and response to improper access from within and outside your enterprise. Improper access can result in information being altered, destroyed, misappropriated or misused or can result in damage to or misuse of your systems, including for use in attacks on others. No IT system or product should be considered completely secure and no single product, service or security measure can be completely effective in preventing improper use or access. IBM systems, products and services are designed to be part of a lawful, comprehensive security approach, which will necessarily involve additional operational procedures, and may require other systems, products or services to be most effective. IBM does not warrant that any systems, products or services are immune from, or will make your enterprise immune from, the malicious or illegal conduct of any party.

