Commercial SpywareDetecting the Undetectable
July 2015

About the Authors
Joshua Dalman Second generation digital forensics examiner M.S. Digital Forensics (University of Central Florida) Certifications: ACE, CCE, CFE, CFCE, EnCE, etc...

About the Authors
Valerie Hantke M.S. Cybersecurity (UMUC) and B.S. Electrical Engineering (USNA) Certifications: EnCE, ACE, GCIH, GMOB, CEH...

Overview
· Mobile Spyware Introduction · Research Methods · SpyToMobile Results · mSpy Results · Conclusion

Spyware Introduction
Mobile spyware is: · Easily available · Easy to install · Lots of features · Stores data on
remote server · Already in your
enterprise network?

What We Know
Lacoon Mobile Security /Check Point Study:
· Sampled nearly 1 million devices (50% Android, 40% iOS, 10% Other) communicating through corporate Wi-Fi .
· Detected over 20 variants and 18 different families of spyware products.
· Two spyware programs (SpyToMobile and Mspy) accounted for more than half of all infections.
· Organizations with 2,000 devices on their enterprise have 50% chance of infection.

What could possibly go wrong?

Spyware Features
Most spyware programs collect at minimum the following types of information:
· Text Messages · Call History · Contact List · Web History · Wi-Fi Networks · Emails · Calendar, Notes, Tasks · GPS Location

Are These Legal?
· Previously marketed towards cheating spouses.
· Tools now marketed towards employee and child monitoring.
· Legal disclaimer during installation.
· Many spyware companies still running.

Research Conducted
· Device Used: Samsung Galaxy S3
· Model: GT-I9800I · Android Version: 4.4.4 (KitKat)
· Application Memory Exploitation
· Android Debug Bridge (ADB) · Mem and Netcat · Strings
· Physical device acquisition and analysis
· Cellebrite UFED4PC 4.2.1.3 · Cellebrite Physical Analyzer 4.2.1.7

About mSpy
· Most common mobile spyware application, accounting for nearly one third of infections
· Sold on a subscription basis
· Claims to have over one million customers

Installation and Monitoring
· Requires physical access to the phone · Modify security settings to allow untrusted apps. · Browse to http://kypler.com/android · Download and install bt.apk · Enter unique passcode that is generated and emailed
after purchase. · And if you have trouble installing the spyware...

Command and Control

Customizable Settings

Forensic Analysis Results: mSPY

Application Memory Exploitation Results
mSPY settings found:
sh":"87b3ed68bae3bc270445984a76e00d79","config":{"gps":{"enable":true,"interval":"1","force_gps":true},"sms":{"enable":true,"wifionly":false },"email":{"enable":true,"wifionly":false,"call":{"enable":true,"wifionly":false},"memos":{"enable":true,"wifionly":false},"note":{"enable":true,"wifi only":false},"event":{"enable":true,"wifionly":false},"task":{"enable":true,"wifionly":false},"contact":{"enable":true,"wifionly":false},"apps":{"enabl e":true,"wifionly":false},"audio":{"enable":true,"wifionly":false},"photo":{"enable":true,"wifionly":true},"video":{"enable":true,"wifionly":true},"br owser":{"enable":true,"wifionly":false},"callrecording":{"enable":true,"wifionly":false},"skype":{"enable":true,"wifionly":false},"line":{"enable":true ,"wifionly":false},"whatsapp":{"enable":true,"wifionly":false},"facebook":{"enable":true,"wifionly":false},"viber":{"enable":true,"wifionly":false},"ke ylogger":{"enable":true,"wifionly":false},"update":{"interval":"1"},"logs":{"enable":false},"build_version":{"is_trial":false},"photospying":{"enable":t rue,"wifionly":false},"snapchat":{"enable":true,"wifionly":false},"wifi_networks":{"enable":true,"wifionly":false},"version_available":0},"commands _list":[],"status_code_text":"OK - Everything worked as expected.","status":200}

Application Memory Exploitation Results
mSpy also captured the location of the device:
locations":[{"timestamp":"1436894811","accuracy":17.525999069213867,"longitude":"76.851205","latitude":"39.1704729"},{"timestamp":"1436894876","accuracy":19.06599998474121,"longitude":"76.8512033","latitude":"39.1704794"},{"timestamp":"1436894937","accuracy":25.166000366210938,"longitude":"76.8511666","latitude":"39.1705094"},{"timestamp":"1436894998","accuracy":16.844999313354492,"longitude":"76.8511917","latitude":"39.1704879"},{"timestamp":"1436895059","accuracy":16.844999313354492,"longitude":"76.8511881","latitude":"39.1704956"},{"timestamp":"1436895120","accuracy":15.015000343322754,"longitude":"76.8511957","latitude":"39.1704807"},{"timestamp":"1436895210","accuracy":26.86199951171875,"longitude":"-76.8511427","latitude":"
mSpy Domains:
url LIKE '%mspy%' OR url LIKE '%thd.cc%' OR url LIKE '%mspyonline.com%'

Packet Capture Results
Analysis of network traffic indicates that mSpy communicated with IP Address 136.243.253.185 using TCP over port 443.

IP Address Information

Physical Acquisition Analysis Summary
· Google Chrome history contained evidence that the user visited http://kypler.com/android and downloaded bt.apk.
· The mSPY application installed to /Root/data/android.sys.process.
· The applications folder contained a sqlite database (internal.db) that stored all data collected by mSPY and a .xml file (settings.xml) which stores the spyware's settings.

Internal.db

About SpyToMobile
· Second most common mobile spyware
· Sold on a subscription basis
· Cost $0.99 per day

Installing and Monitoring
· Requires physical access to the phone
· Modify security settings to allow untrusted apps.
· Browse to SpyToMobile.com/d
· Download and install Data_backup.apk
· Put `Data Backup' widget on the screen.
· Enter email address.

Command and Control

Forensic Analysis Results: SpyToMobile

Application Memory Exploitation
SpyToMobile recorded text message:
{"viber_time":0,"sms_time":1436293687,"call_time":14 36290801,"viber_call_time":0,"wapp_call_time":0,"sms" :[{"u":1436293687,"t":2,"m":"I love Black Hat 2015!\n","a":"5552368"}],"wapp_time":0}
duration
/data/data/com.spy2mobile.light/databases/msgstore.d b

Application Memory Exploitation
Evidence of SpyToMobile recording wireless network locations:
Guest Network-columbia/xx:xx:xx:xx:xx:xx RSSI:-44 W:87.0 C:-1 L:39.170727 -76.85074 Pentest_Lab2/xx:xx:xx:xx:xx:7d RSSI:-49 W:85.0 C:-1 L:39.170727 -76.85074 /data/data/com.spy2mobile.light/database /data/data/com.spy2mobile.light/databases/system.db WiFi stored: Guest Network-columbia/xx:xx:xx:xx:xx:xx RSSI:-44 W:87.0 C:-1 L:39.170727 -76.85074

Packet Capture Results
Analysis of network traffic indicated that SpyToMobile communicates with IP Address 107.20.217.40 using TCP over port 7766.

IP Address Information

Registrant Org

Domains By Proxy, LLC was found in ~11,111,910 other domains

Registrar

WILD WEST DOMAINS, LLC

Registrar Status

clientDeleteProhibited, clientRenewProhibited, clientTransferProhibited, clientUpdateProhibited

Dates

Created on 2012-02-15 - Expires on 2016-02-15 - Updated on 2015-01-19

Name Server(s)

NS29.DOMAINCONTROL.COM (has 38,773,043 domains) NS30.DOMAINCONTROL.COM (has 38,773,043 domains)

IP Address

107.20.217.40 - 2 other sites hosted on this server

IP Location

- Virginia - Ashburn - Amazon.com Inc.

ASN

AS14618 AMAZON-AES - Amazon.com, Inc. (registered Nov 04,

2005)

Domain Status Registered And Active Website

Whois History 24 records have been archived since 2012-02-16

IP History

3 changes on 4 unique IP addresses over 3 years

Registrar History

1 registrar

Hosting History

1 change on 2 unique name servers over 3 years

Whois Server whois.wildwestdomains.com

Physical Acquisition Analysis Summary
· Google Chrome History contained evidence that the user visited http://spy2mobile.com/d and downloaded a file named: Data_backup.apk
· The SpyToMobile application is installed to /data/data/com.spy2mobile.light
· The applications folder contained a sqlite database (system.db) that stored all data collected by mSPY.

System.db

How do I know if I have been infected?
· Use a strong passcode and limit physical access to the phone.
· Check visited URLs and Download history. · Examine security settings and determine if Unknown
Sources is enabled. · Look for new and unfamiliar Widgets or Apps. · If still uncertain, take a pcap!

Similar Work
Robinson, M & Taylor, C. (2012, July). Spy vs. Spy: Examining spyware on mobile devices. Presented at Defcon 20, Las Vegas, NV.
Spyware Analyzed: FlexiSpy, SpyBubble, MobiStealth, Mobile-Spy, Spyera.

Works Cited
Krebs, B. (2015, May 14). Mobile Spyware Maker mSpy Hacked, Customer Data Leaked. Retrieved from http://krebsonsecurity.com/2015/05/mobile-spy-software-maker-mspy-hacked-customer-data-leaked/
Tamma, R. & Tindall, D (2015). Learning Android Forensics. Birmingham, UK: Packt Publishing Ltd. Threat Research: Targeted Attacks on Enterprise Mobile. (2015, February). Retrieved from
https://www.checkpoint.com/downloads/product-related/Lacoon_CP_Enterprise_mRAT_Research.pdf Whois Lookup 107.20.217.40. (n.d.). Retrieved from
http://whois.domaintools.com/107.20.217.40 Whois Lookup 136.243.253.185. (n.d). Retrieved from
http://whois.domaintools.com/136.243.253.185

QUESTIONS?
Josh.Dalman@FidelisSecurity.com Valerie.Hantke@FidelisSecurity.com

