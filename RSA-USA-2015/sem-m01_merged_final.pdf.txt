Security Basics

Start Time 8:30 AM 8:45 AM 9:30 AM 10:15 AM 10:30 AM
11:15 AM 12:00 PM 1:15 PM 2:00 PM 2:45 PM 3:00 PM 3:45 PM

Title Introduction

Presenter Hugh Thompson

Security Industry and Trends

Hugh Thompson

User Authentication Trends and Methods for Native Mobile Applications Kayvan Alikhani

BREAK Mobile & IOT Security: Will Big Data Make it Better or Worse?

Hadi Nahari

Viruses, Malware and Threats LUNCH Crypto 101: Encryption, Codebreaking, SSL, and Bitcoin Security Enforcement Explained BREAK Internet and Web Security Issues Network Security

Tas Giakouminakis
Benjamin Jun Dana Wolf
Patrick Sullivan Gary Sockrider

#RSAC

SESSION ID: SEM-M01
Introduction and A Look at Security Trends

Hugh Thompson, Ph.D.
Program Committee Chairman, RSA Conference Twitter: @DrHughThompson

#RSAC

SESSION ID:

#RSAC
Agenda
Intro to Information Security Economics of Information Security
Security Trends
@DrHughThompson

#RSAC
The Shifting IT Environment
(...or why security has become so important)
@DrHughThompson

#RSAC
Shift: Compliance and Consequences
 The business has to adhere to regulations, guidelines, standards,...
 SAS 112 and SOX (U.S.) ­ upped the ante on financial audits (and supporting IT systems)
 PCI DSS ­ requirements on companies that process payment cards  HIPAA, GLBA, BASEL II, ..., many more
 Audits have changed the economics of risk and create an "impending event"
Hackers may attack you but auditors will show up
 Disclosure laws mean that the consequences of failure have increased
 Waves of disclosure legislation
@DrHughThompson

#RSAC
Shift: Technology
· Many applications/transactions now operate over the web · Cloud is changing our notion of a perimeter · Worker mobility is redefining the IT landscape · Shadow IT is becoming enterprise IT · Majority of web transactions are now encrypted (SSL) · The security model has changed from good people vs. bad people
to enabling partial trust
­ There are more "levels" of access: Extranets, partner access, customer access, identity management, ...
@DrHughThompson

#RSAC
Shift: Attackers
 Cyber criminals are becoming organized and profit-driven
 An entire underground economy exists to support cybercrime
 Attackers are shifting their methods to exploit both technical and human weaknesses
 Attackers after much more than traditional monetizable data (PII, etc.)
 Hacktivism  State-sponsored attacks  IP attacks/breaches
@DrHughThompson

#RSAC
Shift: Customer expectations
 Customers, especially businesses, are using security as a discriminator
 In many ways security has become a nonnegotiable expectation of businesses
 Security being woven into service level agreements (SLAs)
 The "average person" is now familiar with security
@DrHughThompson

#RSAC
Big Questions
 How do you communicate the value of security to the enterprise (and management)?
 How do you measure security?
 How do you rank risks?
 How do you reconcile security and compliance?
 How can you be proactive and not reactive? What is "security intelligence" and how would you actually consume, act on or share it?
 What changes are likely in privacy laws, data sovereignty, trust?
 What about big issues in the news like APT's, hacktivism, leaks, DDoS attacks, ...? How should/can we adapt what we do based on them?
 How do you adapt to new paradigms like IoT?
@DrHughThompson

#RSAC
The Economics of Security
@DrHughThompson

#RSAC
Hackernomics (noun)
A social science concerned chiefly with description and analysis of attacker motivations, economics, and business risk. Characterized by
5 fundamental immutable laws and 4 corollaries
@DrHughThompson

#RSAC
Law 1
Most attackers aren't evil or insane; they just want something
Corollary 1.a.: We don't have the budget to protect against evil people but we can protect
against people that will look for weaker targets
@DrHughThompson

#RSAC
Law 2
Security isn't about security. It's about mitigating risk at some cost.
Corollary 2.a.: In the absence of metrics, we tend to over focus on risks that are either
familiar or recent.
@DrHughThompson

#RSAC
Law 3
Most costly breaches come from simple failures, not from attacker ingenuity
Corollary 3.a.: Bad guys can, however, be VERY creative if properly incentivized.
@DrHughThompson

#RSAC
The CAPTCHA Dilemma
Completely Automated Public Turing test to tell Computers and Humans Apart
@DrHughThompson

#RSAC
Law 4
In the absence of security education or experience, people (employees, users, customers, ...)
naturally make poor security decisions with technology
Corollary 4.a.: Systems needs to be easy to use securely and difficult to use insecurely
@DrHughThompson

@DrHughThompson

#RSAC

#RSAC
Law 5
Attackers usually don't get in by cracking some impenetrable security control, they look for weak points like trusting employees
@DrHughThompson

#RSAC
A Visual Journey of Security Trends
@DrHughThompson

#RSAC
2008
@DrHughThompson

2015

#RSAC

@DrHughThompson

23

@DrHughThompson

#RSAC

#RSAC
Enjoy the rest of the conference!!
@DrHughThompson

Security Basics

Start Time 8:30 AM 8:45 AM 9:30 AM 10:15 AM 10:30 AM
11:15 AM 12:00 PM 1:15 PM 2:00 PM 2:45 PM 3:00 PM 3:45 PM

Title Introduction

Presenter Hugh Thompson

Security Industry and Trends

Hugh Thompson

User Authentication Trends and Methods for Native Mobile Applications Kayvan Alikhani

BREAK Mobile & IOT Security: Will Big Data Make it Better or Worse?

Hadi Nahari

Viruses, Malware and Threats LUNCH Crypto 101: Encryption, Codebreaking, SSL, and Bitcoin Security Enforcement Explained BREAK Internet and Web Security Issues Network Security

Tas Giakouminakis
Benjamin Jun Dana Wolf
Patrick Sullivan Gary Sockrider

#RSAC

SESSION ID: SEM-M01
User Authentication Trends and Methods for Native Mobile Applications

Kayvan Alikhani
Senior Director of Technology RSA

#RSAC

Authenticate:

#RSAC

Prove you are who you claim to be

...A Union cavalry force shouted "Halt, who goes there?", but fired before evaluating the reply. Frantic shouts by Stonewall Jackson's staff identifying the party were replied to: "It's a damned Yankee trick! Fire!" Jackson was severely wounded & ended up dying of the gun wound.

Stonewall Jackson

Worst. Authentication. Ever? Did they use a Pass phrase? If not, was it the environment that failed them? Too Loud to recognize his voice? Too dark to identify him? Or a simple case of Timeout!

28

#RSAC
Strong Auth
 Strong Authentication The requirement to use multiple factors for authentication... to verify an entity's identity
(National Information Assurance (IA) Glossary)
29

Strong Auth:

#RSAC

Multi-factor vs. Multi-layered

 Multi-factor auth: Authentication that requires the use of solutions from two or more of categories of factors

 Multi-layered auth: Using multiple solutions from varying (same/different) categories at different points in the process

30

Biometric Auth:

#RSAC

Fingerprinting: `Old' school method

200 BC: China

1892: UK

1915: Oakland

2015: Everywhere

Handprints used as evidence for burglaries

Galton: "Fingerprints": Individuality & permanence, introduced `minutia'

International Association for Criminal 31 Identification

#RSAC
Other Biometric auth methods for mobile apps
 Voice print  Face print (including eye veins)  Iris  EKG: Heart-signature  Behavioral patterns  Ear pattern (no, this is not a typo)  ....
32

#RSAC
Biometric auth: The Mobile advantage
 Modern devices now equipped with powerful sensors & radios:
 Camera(s)  Microphone(s)  Fingerprint sensor  GPS/Wi-Fi/Bluetooth  Gyro/Accelerometer  IR Laser/LED
 Plus...We carry them everywhere!
33

Mobile biometrics for mobile apps:

#RSAC

What to Watch Out For!

 Has to be easy for the user, as in: "Work all the time!" for the right user:  Tolerable False Acceptance & Rejection rates  Adapts to Environment: Too loud, Too dark, Too cold? No problem!  Matches user/organizational needs: Compliant

 Protect Data at rest:  Securely stores & protects sensitive data: Templates/hashes/keys  Takes advantage of hardware security when possible
 Protect Data being acquired:  Live-ness detection: Prevent spoofing

34

#RSAC
Mobile Auth trends and standards
 FIDO Alliance, Apple Touch ID, Windows 10 (TPM):
 Auth on the device: Move from server based Auth to device-side Auth  Credentials/Biometric templates never leave the device  Device "signs" claims and assertions
 Use of HW to protect keys/processes:
 Use of TEE, SE to store key data at rest  Use of TEE to run authentication process
35

Multi-factor Auth makes

#RSAC

sense!

#RSAC
Reality vs. Utopia
 Utopia:
 Devices: All have well designed, easy to use, similar authenticators  Service providers: All support a common standard for authentication  Hackers: Leave device-side biometric authentication "alone"
 Reality (for the next ~5 years):
 Devices: Growing mix of different capabilities, makes & models  Service providers: Hodgepodge of Auth protocols and standards  Hackers: Can't wait...
37

#RSAC
Dos and Don'ts for mobile app auth solutions
 Don't put all your eggs in one basket, throw a wider net:
 Design around solutions that take advantage of evolving mobile auth methods  Avoid solely relying on a single:
 Factor/Method  Vendor  Platform/OS  Look for standards support and compliance
 Determine Risk:
 Take advantage of solutions that include "User behavioral data" to make better decisions. Data that includes:  User location, network, device registration, usage and activity pattern
38

#RSAC
Dos and Don'ts for mobile app auth solutions
 Survey your users with simple POCs to see what method `works' for them
 Remember: Combining auth methods lowers the risk of each method:  Improves chance of information being accessed by the right person
 It's a Balancing Act:  Decide when to use "step up" based on "role" & "action", for example:
 User is reviewing NBA game stats? Let them in, accept Moderate risk  Manager is Approving a players transfer? Step up & tolerate Lower risk
39

Security Basics

Start Time 8:30 AM 8:45 AM 9:30 AM 10:15 AM 10:30 AM
11:15 AM 12:00 PM 1:15 PM 2:00 PM 2:45 PM 3:00 PM 3:45 PM

Title Introduction

Presenter Hugh Thompson

Security Industry and Trends

Hugh Thompson

User Authentication Trends and Methods for Native Mobile Applications Kayvan Alikhani

BREAK Mobile & IOT Security: Will Big Data Make it Better or Worse?

Hadi Nahari

Viruses, Malware and Threats LUNCH Crypto 101: Encryption, Codebreaking, SSL, and Bitcoin Security Enforcement Explained BREAK Internet and Web Security Issues Network Security

Tas Giakouminakis
Benjamin Jun Dana Wolf
Patrick Sullivan Gary Sockrider

#RSAC

SESSION ID: SEM-M01
Mobile & IoT Security: Will Big Data Make it
Better or Worse?

Hadi Nahari
Chief Security Architect NVIDIA
@hadinahari

#RSAC

#RSAC
Threat Landscape

>3,000,000,000,000

legacy threats blocked

threats annually advanced threats
detected undetected

50%

25%

1.6 B
number of records lost globally in 2014
$236 M
recovery cost of Target breach (so far)
15 B
connected devices in 2015

25%

(avg. $27.3 loss per incident)

$110 BN
the annual price tag of cybercrime

42

#RSAC
Motivation
 More connected devices  more value  added risk  Security posture hasn't magically improved
 In many cases in fact it has regressed
 Heterogeneous security paradigms
 Device-end data is dislodged and processed separately  Dubious security posture of the Big Data infrastructure itself  Unclear how it handle the security of the data it analyzes
 A massive digital orgy with no reliable membranes
43

#RSAC
Increasing Complexity
 Space Shuttle: ~400K LOC  F22 Raptor fighter Jet: ~2M LOC  Linux kernel 2.2: ~2.5M LOC  Hubble Space Telescope: ~3M LOC  Android Core: 12M LOC  Future Combat System: 63M LOC  Connected Car: 100M LOC  Autonomous Vehicle: 300M LOC
44

#RSAC
Mobile
45

#RSAC
Mobile Security
 Mobile security posture is (somewhat) stabilizing  Core framework and device technologies finally maturing
 ROT/COT, SEforAndroid, ARM TrustZone, Mobile TPM/HSM, e/SE, etc.  Foundation technologies have/are being commoditized  Ecosystem(s) consolidating:  SoC, OEM/ODM, Stack/OS, MNO, SP, MDM  Liability boundaries better understood now than in early days  More capable (and cheaper) devices  more value-added services  Mobile attack surface hardening  attackers go for softer targets
46

#RSAC
IoT (Thingsternet)
47

#RSAC
Vehicle: IoT?
48

#RSAC
But...can they be hacked??
49

#RSAC
Incentives
 Known vulnerabilities (phone era) softer target (IoT)
 ATO, escalation of privileges, ROT/COT, etc.
 Multi-device  multi-channel attack surface  Counterfeit/black market: $45B/Y market (magic box via OBD-II)  Odometer rollback: 6B/Y in Germany  Collect PII: vehicle as a soft entry  Roughly $1T/Y on a global basis
 Potentially exceeding car crash, drug trafficking, and pilferage
50

#RSAC
Connected Vehicle Security
51

#RSAC
IoT Security
 Lack of standardized (or well-defined) orchestration layer  Heterogeneous security capabilities  Multi device management
 Prone to TOCTU attacks, among others
 Dangerous "atomic" view of the IoT devices
 False sense of security
 Technologies, usecases, actors, and attacks still evolving
52

#RSAC
Big Data
"Big data is like teenage sex: everyone talks about it, nobody really knows how to do it, everyone thinks everyone else is doing it, so everyone claims the are doing it..." Dan Ariely, Duke University
53

#RSAC
Big Data Security
 Ok, what does it mean?
 Cloud/infrastructure?  Comm. Channel?  Data (DAR/DIT)?  Stack (DAC/MAC)?  End point(s)?
 However you look
 It's not fully new, but  It's not really secure either
54

Case Study:

#RSAC

Identity Assertion &

Authentication

#RSAC
Digital Identity Assertion Dilemma
"On the Internet, nobody knows you're a dog" ­Peter Steiner
56

Pre IoT
observations
(eva, password123)

"au""atchsleasniemtritc(isoa)nt"io"pnph"hapashseease
hi, I'm Eva! (eva, password123*) (if match, respond:) "hi Eva! here's your token:"

57

#RSAC

service provider (SP)

· structured · SP-specific · isrtheerleiaa mbaltceh? · private (eva, password123) · static

...

·

×  match: issue a token
 no match: deny access
proprietary per SP

· binary decision

· either 0% or 100%

· nothing in between · fnroemceSssPa'srypeevrsilpfoerctSivPe whoever
possesses this token is Eva

(identity fraud)

IoT Era
123456 password 12345678
qwerty abc123
on avg. only five passwords per user ???
58

service provider

#RSAC

#RSAC
Results
some noteworthy breaches since this report was released
59

#RSAC
Conclusion/Apply
 IoT without Big Data be like FB without friends...  IoT + Big Data: potentially less secure than either one alone  IoT attacks are becoming have already become scalable
 If your security solution is not real-time, you'll play catch  Attackers will have advantage for sometime
 Getting distributed security right is hard  Getting data protection in heterogeneous environment is harder  Increased threats  priority attention  scalable solutions
60

Thank You!
Hadi Nahari hnahari@nvidia.com
hadinahari
http://www.wiley.com/WileyCDA/WileyTitle/productCd-0470624469.html

#RSAC

Security Basics

Start Time 8:30 AM 8:45 AM 9:30 AM 10:15 AM 10:30 AM
11:15 AM 12:00 PM 1:15 PM 2:00 PM 2:45 PM 3:00 PM 3:45 PM

Title Introduction

Presenter Hugh Thompson

Security Industry and Trends

Hugh Thompson

User Authentication Trends and Methods for Native Mobile Applications Kayvan Alikhani

BREAK Mobile & IOT Security: Will Big Data Make it Better or Worse?

Hadi Nahari

Viruses, Malware and Threats LUNCH Crypto 101: Encryption, Codebreaking, SSL, and Bitcoin Security Enforcement Explained BREAK Internet and Web Security Issues Network Security

Tas Giakouminakis
Benjamin Jun Dana Wolf
Patrick Sullivan Gary Sockrider

#RSAC

SESSION ID: SEM-M01
Viruses, Malware and Threats

Tas Giakouminakis
Co-Founder and Chief Technology Officer Rapid7

#RSAC

The Beginning

1966 Theory of
SelfReproducing
Automata

1983 Virus term
coined

1988 Morris worm first Internet
worm

2000s Internet spreading worms ILOVEYOU, Slammer, MyDoom, Netsky, botnets, ...

#RSAC

1971 Creeper experimental worm on DEC PDP10/TENEX
Reaper worm removes Creeper

1986 Brain first IBM PC virus
64

1990s DOS & Windows viruses and worms

The Evolution

2007 Storm worm botnet

2008 Conficker
botnet

2010 APT gains publicity,
Stuxnet cyber weapon

2011 Bit-coin mining malware begins to
rise

#RSAC
2014 Fileless malware & kits gain popularity

2007 Zeus crimeware
kit

2009 SpyEye

2011 SpyEye &
Zeus merge

2012 Dexter Point-ofSale botnet

65

#RSAC
Threats, threats, everywhere

 Common threats impact everyone  Mass malware  "Unintentional" insiders
 Gain insight into industry specific threats  ISACs  Public/Private initiatives  Vendors

Retail Public Professional Other Services Mining Manufacturing Information Healthcare Financial Services Entertainment Educational Administrative Accomodation

Crimeware Lost and Stolen Assets Point of Sale

Cyber-Espionage Miscellaneous Errors Privilege Misuse

Denial of Service Payment Card Skimmers Web Applications

Source: Verizon 2015 Data Breach Investigations Report

#RSAC
Know Your Enemy
State Sponsored
Cyber Criminal
Hacktivist Crimeware Cyber-Espionage Denial of Service Point of Sale Web Applications
Source: Verizon 2015 Data Breach Investigations Report
67

#RSAC
Professions in Cyber Crime
 Intruders  Malware Developers  Exploit Kits Developers  Bulletproof Hosting  Money Laundering Providers  Traffic Brokers ...
68

Malware: There's an App For That

Exploit Kit Prevalence in 2014

1%

5%

11%

26%

12%

13%

17%

15%

Angler Sweet Orange Flashpack Magnitude Rig Infinity Neutrino Styx

Source: http://www.mcafee.com/us/resources/reports/rp-quarterly-threat-q4-2014.pdf

69

#RSAC

#RSAC
Goal: Making Money

Profits remain high

Costs are declining

 Credit card numbers & CVV ­ US$0.50 to $20

 Exploit Kits ­ US$100 to US$700/week

 Fullz (identity and financial info) ­ US$30 to $45

 DDoS Attacks ­ US$10 to $1000/day

 Cloud Accounts ­ US$7 to $8
 Healthcare Information ­ US$20

 Infected Computers ­ US$140 to $190/1,000

Dec 2014 - Source: http://www.symantec.com/connect/blogs/underground-black-market-thriving-trade-stolen-data-malware-and-attack-services Dec 2014 - Source: http://www.secureworks.com/resources/articles/featured_articles/whitepaper-underground-hacking-markets-report

70

#RSAC
Not Just Endpoints
 Stuxnet made targeted SCADA/ICS attacks infamous
 BlackEnergy variant fueling long running ICS campaign
71

#RSAC
Not Just Endpoints
 PCI requires encrypting card data, criminals respond with RAM-scraping malware
 2014 continued to see Point-of-Sale malware evolving  Default, weak and stolen credentials are a major part of
Point-of-Sale breaches
72

#RSAC
Not Just Endpoints
 ATMs are Windows machines filled with cash
 Attacks using malware on USB sticks or bootable CDs
 Estimated 75% of ATMs still run Windows XP, even after Microsoft ended support
 NCR launches Kalpana ­ Android based ATMs
73

#RSAC
Not Just Endpoints
 Android remains the uncontested malware leader  Malvertisements have become the primary
distribution model  But we're still waiting for the mobile malware explosion...
Source: Verizon 2015 Data Breach Investigation Report
74

#RSAC
Not Just Endpoints
 Internet-of-Things botnets devolving from Internet Census to DDoS and spam
 Always on devices ripe for hijacking  Patching is rarely a priority
Powered By
http://internetcensus2012.bitbucket.org/paper.html 75

#RSAC
Understanding Today's Attacks
 The economics of security favor the criminals  Attackers increasingly rely on deception and the human element  State-sponsored APTs are not the only targeted attacks  Once inside, attackers become insiders  Intrusion Kill Chains ­ understand attackers methodology and
apply corresponding defensive measures to increase cost and complexity to the attacker
http://www.lockheedmartin.com/content/dam/lockheed/data/corporate/documents/LM-White-Paper-Intel-Driven-Defense.pdf
76

#RSAC
The Intrusion Kill Chain

 Identify methods to detect, deny, disrupt, degrade, deceive, or destroy the attack within each phase

Reconnaissance

· Web Analytics, Firewall ACL

Weaponization

· NIDS, NIPS

Delivery

· Vigilant user, Proxy filter, Inline AV, Queueing

Exploitation

· HIDS, Patch, DEP

Installation

· HIDS, Sandbox/Jail, AV

Command & Control (C2)

· NIDS, Firewall ACL, NIPS, Tarpit, DNS redirect

Actions on Objectives

· Audit log, QoS, Honeypot

http://www.lockheedmartin.com/content/dam/lockheed/data/corporate/documents/LM-White-Paper-Intel-Driven-Defense.pdf

77

#RSAC
Malware Infection Points
Source: Verizon 2015 Data Breach Investigations Report
78

Common Attack Paths

User User AttAacktetr acker

Browse Internet
Click E-mail Link (Social Engineering)
Open E-mail Attachment (Social Engineering)
Connect USB drive (Social Engineering)
Exploit Vulnerability
Leverage Weak/Stolen Credentials

79

#RSAC
Malicious Page (Drive-by, Watering Hole)
Compromised

#RSAC
Establish Foothold, Obtain Objective
 Communication channels for Command & Control (C2) & Data Exfiltration
 Common protocols often used: HTTP, HTTPS, DNS, FTP  Encryption often simplistic (XOR, Base64, Base32, ...)
 Perform reconnaissance of internal environment
 Identify targets and begin acquisition
 Continue lateral movement
 Pass the hash, stolen credentials, privilege escalation
80

#RSAC
Combating Today's Attacks
 Determined adversaries can always get in  Philosophy shifting from prevention to detection and containment  That said, don't forget the basics!
81

#RSAC
Control & Monitor Traffic Flow
 Gain visibility & increase defensive/response capabilities  Consolidate ingress & egress points ­ including VPN & Cloud Services  Perimeter has expanded ­ apply security controls closest to resources  Centralized & consistent logging for endpoints, services and security
controls  Endpoints: AV/Malware Protection, FW, Authentication Logs  Network services: DNS, FW, VPN, Proxy, Web, Email, File, Directory,
Database  Cloud services: Authentication & Activity Logs  Security controls: IDS/IPS, DLP, WAF, Malware Protection, Honeypot,
Patch Management, etc.
82

#RSAC
Understand the Organization
 Correlate all activity back to users & service accounts  Baseline the IT & user environments
 Review inventory to identify outliers, gaps & appropriateness  Baseline user behavior
 Review assets users access or own for appropriateness & access patterns  Baseline "normal" data flows  Investigate changes, unknowns & anomalies  Be prepared for false positives / spurious anomalies
83

#RSAC
Preparing for Containment
 Catalog sensitive data and assets and document lockdown protocol
 Identify all points of contact  Quarantine/monitor assets/users suspected
of compromise  Protect evidence whenever possible  Practice & review response for lessons learned  Refine & iterate
84

#RSAC
The Basics: Limit User Temptation
 Rollout user awareness training, tips & advice  Reduce spear phishing attacks ­ leverage Sender ID, Sender
Policy Framework (SPF), DomainKeys Identified Mail (DKIM)  Deploy network-based security controls
 Whitelist/Blacklist, Malware Protection, IDS/IPS, Proxies, Content Filtering
85

#RSAC
The Basics: Reduce Exploit Exposure
 Automate deployment of software, patches, security controls & configurations
 Remove or patch commonly targeted applications  Root out default/weak passwords  Limit administrative privileges and password reuse, User Account
Control (UAC)  Enable exploit mitigations (DEP, ASLR, EMET, SEHOP)  Deploy endpoint security controls
 Application whitelisting, AV, FW, IPS
86

#RSAC
Additional Reading
Lockheed Martin Corp. - Intelligence-Driven Computer Network Defense Informed by Analysis of Adversary Campaigns and Intrusion Kill Chains
http://www.lockheedmartin.com/content/dam/lockheed/data/corporate/documents/LM-White-Paper-Intel-Driven-Defense.pdf
Contagio Malware Dump
http://contagiodump.blogspot.com/
Australian Signal Directorate ­ Strategies to Mitigate Targeted Cyber Intrusions
http://www.asd.gov.au/infosec/top35mitigationstrategies.htm
SANS/CSIS ­ Twenty Critical Security Controls for Effective Cyber Defense
http://www.sans.org/critical-security-controls/
87

#RSAC
Apply
 Determined adversaries will get in ­ increase your focus on detection and containment, but don't forget the basics
 Understand your business, your IT environment, your users, & the threats you face
 Prepare your people and processes, not just technology
 Every user is part of your perimeter, treat them accordingly  Attacks will continue to evolve ­ stay current and focus efforts on
highest return
88

Thank You

Tas Giakouminakis

#RSAC

Rapid7

Co-founder & Chief Technology Officer

www.rapid7.com

tas@rapid7.com

Security Basics

Start Time 8:30 AM 8:45 AM 9:30 AM 10:15 AM 10:30 AM
11:15 AM 12:00 PM 1:15 PM 2:00 PM 2:45 PM 3:00 PM 3:45 PM

Title Introduction

Presenter Hugh Thompson

Security Industry and Trends

Hugh Thompson

User Authentication Trends and Methods for Native Mobile Applications Kayvan Alikhani

BREAK Mobile & IOT Security: Will Big Data Make it Better or Worse?

Hadi Nahari

Viruses, Malware and Threats LUNCH Crypto 101: Encryption, Codebreaking, SSL, and Bitcoin Security Enforcement Explained BREAK Internet and Web Security Issues Network Security

Tas Giakouminakis
Benjamin Jun Dana Wolf
Patrick Sullivan Gary Sockrider

#RSAC

SESSION ID: SEM-M01
Crypto 101:
Encryption, Codebreaking, SSL, and Bitcoin

Benjamin Jun

CTO Chosen Plaintext Partners
@BenjaminJun

#RSAC Some material adapted from Ivan Ristic, Qualys (RSAC 2011)

Crypto 101
 Cryptography building blocks  Cryptographic protocols
 SSL / TLS  Bitcoin
 Attacks on cryptography
92

@BenjaminJun #RSAC

What is Cryptography?

@BenjaminJun #RSAC

Cryptography is the art and science of keeping messages secure.

Cryptography

Symmetric cryptography

Asymmetric cryptography

Message authentication

Hash functions

Cryptanalysis

Block ciphers

RSA

Digital signatures

Stream ciphers

Discrete log

Message Authentication
Codes

Elliptic curve 93

Protocols

Security \si-kyur --t\
the state of being free from danger or threat

Cryptography terms
 Confidentiality  Integrity  Authentication  Access control  Non-repudiation

Other criteria
 Interoperability  Performance  Usability
94

@BenjaminJun #RSAC

#RSAC
Crypto Building Blocks

Encryption
Obfuscation that is fast when you know the secrets, but impossible or slow when you don't.

@BenjaminJun #RSAC

Scytale 300BC

Jefferson Wheel (M94) 1900s
96

Enigma Machine 1920s
Image credit: Luringen, Sobebunny, R Booth

Symmetric encryption

@BenjaminJun #RSAC

 Use shared key to encrypt/decrypt
 Algorithm does not need to be secret  Key must be agreed and communicated in advance
 Convenient and fast  Examples: RC4, 3DES, AES
97

Asymmetric encryption

@BenjaminJun #RSAC

Two related keys: one private, one public
 Anyone with the public key can encrypt the message  Only the private key holder can decrypt message  Performs encryption, key exchange, and authentication
 Examples: RSA, Diffie-Hellman, ElGamal, DSA, Elliptic curve (ECDH / ECDSA)  Significantly slower than symmetric encryption

98

Authentication
Confirm data integrity and message origin

@BenjaminJun #RSAC

Egyptian signet ring (500BC)

Mark of the Fisherman (1200AD)
On death, Cardinal Camerlengo to destroy

99

US nuclear "football" (present day)
Keys roll at noon on inauguration day
British Museum, flikr:favoritethings

Digital signatures

@BenjaminJun #RSAC

Asymmetric cryptography can authenticate messages  Only the private key holder can generate a signature  Anyone with the public key can validate the signature  Signatures protect digital certificates from modification or forgery

sign

Signed

verify

docum

ent

100

Digital certificates
 Digital ID can include public/private keypair
 Digital certificate conveys identity
 Credential holder info (name, address, etc.)  Identity's public key  Validity period  Digital signature of Certificate Authority (CA)
 Authentication has 3 steps
 CA signature confirms data is authentic, vouched for  Do we approve of data in the certificate?  Identity keypair validated to confirm ID holder has the private key
101

@BenjaminJun #RSAC

Randomness matters
 Random numbers at the heart of crypto
 Used for key generation  Weak keys = weak encryption

@BenjaminJun #RSAC
NIST SP800-90A: Dual EC DRBG with NIST NSA* constants

 Random number generators
 True random (TRNG) ­ truly random  Pseudorandom (PRNG) ­ look random
 PRNGs fine if properly seeded and properly designed
102

* NYT Snowden memos, September 2013

Hash functions

@BenjaminJun #RSAC

 One-way transformation to generate data fingerprints for:
 Digital signatures  Integrity validation  Tokenization (e.g., storing passwords)
 Examples
 MD5 considered broken  SHA-1 (160) some concerns  SHA-2 (256) ok  Keccak and SHA-3

SHA2 (SHA-256) compression function
 Desirable qualities
 Preimage resistance (one-wayness)  Collision resistance and birthday

103

Stay humble

@BenjaminJun #RSAC

 Don't roll your own crypto
 Failure modes subtle, catastrophic  Standard crypto has been strongly vetted

 Avoid unnecessary complexity

 System only as strong as its weakest link  Complexity = more stuff to go wrong

Auguste Kerckhoffs (1835-1903)

 Never rely on obscurity

 "If I can barely understand it, then it must be strong!"  Kerckhoffs's principle: only the key should be secure

104

Putting It All Together

#RSAC

- SSL / TLS

- Bitcoin

TLS

@BenjaminJun #RSAC

 Transport Layer Security
 World's most widely used cryptographic protocol  From Netscape SSL3 (Kocher, 1995)

 Security requirements
 Securely connect with someone you have never met  Data privacy, data integrity, no site impersonation, no man-in-middle

106

Getting to https
1. Webserver provides digital certificate to browser
 "Amazon.com's passport"
2. TLS layer + browser "authenticates passport"
 Confirms data fields in cert  Confirms digital signature
3. TLS layer confirms that webserver holds private key
 Sends encrypted data that can only be decrypted w/private key
107

@BenjaminJun #RSAC
Information about Amazon
Information about Verisign
Amazon's public RSA key Verisign's digital signature

TLS: Connection
Certificate check passed!
TLS 1.2 protocol for secure socket & session mgmt

@BenjaminJun #RSAC
AES_128_GCM for bulk data · Symmetric crypto · AES128 block cipher (privacy) · Galois authentication (integrity)
ECDHE_RSA for key exchange · Asymmetric crypto · Confidentiality: Elliptic curve
Diffie-Hellman · Authentication: RSA2048 · "Perfect forward secrecy"
108

Bitcoin (1/2)
A peer-to-peer, decentralized currency
 Not underwritten by any entity  "Satoshi Nakamoto" paper (2008)

@BenjaminJun #RSAC

100K transactions/day (Mar `15)
109

$3.8B US in circulation (Mar `15) (US M0 Supply: $3,200B, Jan `15)
Diagrams from blockchain.info

Bitcoin (2/2)

Characteristic Value creation

What happens

Mined by searching for magic

values

KWh  BTC !

Coin transfers

Digital signatures

@BenjaminJun #RSAC
Cryptography Proof-of-work method uses SHA-256 hash function
ECDSA digital signature

Recordkeeping

Distributed ledger with financial Block chain uses SHA-256

(no double-spending) incentive for a "single view"

hash function

Backing entity

NONE!

Everything regulated by market forces + math!

A great technical resource: Bitcoin Developer Reference by Krzysztof Okupski
110

#RSAC
Attacks

Attacks on cryptography

@BenjaminJun #RSAC

Cryptanalysis

Brute force

Mathematical attacks

Resourceassisted attacks

Implementation attacks

112

Brute force

@BenjaminJun #RSAC

US Navy Bombe, 1943
Contains 16 four-rotor Enigma equivalents to perform exhaustive key search

DES Keysearch Machine, 1998
Tests 90 billion keys/sec, average time to crack 56-bit DES: 5 days
(Cryptography Research, AWT, EFF) 113

Cryptanalysis

@BenjaminJun #RSAC

 HDCP = "High Bandwidth Digital Copy Protection"

 Protects digital content, interoperability
 Fast, offline, any-to-any negotiation  Encryption and authentication

 "Clever" key management
 No one device contains global secret  HDCP master key published (2010)

But keys from ~40 devices can reveal
the master key

 Unlicensed implementations cannot be revoked

114

A Cryptanalysis of the High-bandwidth Digital Content Protection System
(Crosby, Goldberg, Johnson, Song, Wagner)
image from www.hdmi.org

Implementation: Side Channel (1/2)

Simple EM attack with radio at distance of 10 feet

Devices

Antennas

@BenjaminJun #RSAC

Signal Processing (demodulation, filtering)
115

Digitizer, GNU Radio peripheral ($1000)
Receiver ($350)
Images from Cryptography Research

Implementation: Side Channel (2/2)
 Focus on Mpdp mod p calculation (Mqdq mod q similar)
For each bit i of secret dp perform "Square" if (bit i == 1) perform "Multiply" endif
endfor

@BenjaminJun #RSAC

SM S S S S11S6S S SM S SM SM S S S SM SM S S S S S S S S S
Images from Cryptography Research

Crypto necessary, but not sufficient

@BenjaminJun #RSAC

Game King poker (2014) Bug allows user to adjust bet
after hand played

http://www.wired.com/2014/10/cheating-video-poker/

117

Siemens Simatic S7-315 Target of Stuxnet
Operation Olympic Games

#RSAC
Learn More!

Resources

@BenjaminJun #RSAC

Understanding Cryptography Christof Paar and Jan Pelzl (Springer, 2009)

Cryptography online course Dan Boneh, Stanford University
119

How to apply what you have learned

@BenjaminJun #RSAC

 In the first three months:
 Identify where cryptography is used in your organization  Identify infrastructure required (key management, certificates)

 Within six months:
 Know what crypto can do. Explain the different security properties.  Know what crypto can't do. Understand basic implementation security
issues.

120

Benjamin Jun
@BenjaminJun / ben@ChosenPlaintext.com Chosen Plaintext Partners

Questions?

My talks this week:
Endpoints in the New Age: Apps, Mobility, and the Internet of Things
Securing the Ecosystem ECO-T07R Tuesday 1:10pm, Thursday 10:20am
Supply Chain as an Attack Chain: Key Lessons to Secure Your Business
Security Strategy STR-F03 Friday 11:20am

Security Basics

Start Time 8:30 AM 8:45 AM 9:30 AM 10:15 AM 10:30 AM
11:15 AM 12:00 PM 1:15 PM 2:00 PM 2:45 PM 3:00 PM 3:45 PM

Title Introduction

Presenter Hugh Thompson

Security Industry and Trends

Hugh Thompson

User Authentication Trends and Methods for Native Mobile Applications Kayvan Alikhani

BREAK Mobile & IOT Security: Will Big Data Make it Better or Worse?

Hadi Nahari

Viruses, Malware and Threats LUNCH Crypto 101: Encryption, Codebreaking, SSL, and Bitcoin Security Enforcement Explained BREAK Internet and Web Security Issues Network Security

Tas Giakouminakis
Benjamin Jun Dana Wolf
Patrick Sullivan Gary Sockrider

#RSAC

SESSION ID: SEM-M01
Security Enforcement Explained

Dana Elizabeth Wolf
Sr. Director of Products OpenDNS @dayowolf

#RSAC

#RSAC
What do we need to run a successful security program?

FIREWALL (NETWORK)

ANTI-VIRUS (ENDPOINT)

#RSAC
Done. Right?

#RSAC
IT Infrastructure is Changing
Elastic Process Power Due to Cloud & Virtualization

#RSAC
Information Access is Changing
BYOD, Mobile, Work@Home

Time to upgrade your thinking
...and security approach.

#RSAC
AV + FW != foolproof security

#RSAC
Security is Changing
and how we enforce policies

#RSAC
What are we talking about?
 Key tenants of policy writing  Policy Lifecycle or Information Security Program  Traditional enforcement technologies
 Endpoint  Network
 Challenges / Gaps  Cloud security enforcement: emerging options

#RSAC
Policy Creation
Who, What, When, Where, and Why

#RSAC
Policy Creation
SMART: Specific, Measurable, Agreeable, Realistic, Time-Bound

#RSAC
Security Policy Standards
Examples
 ISO 27001: information security management system standard
 Standard of Good Practice (SoGP): business-focused, practical and comprehensive guide to identifying and managing information security risks in organizations and their supply chains
 NIST 800-12: helps readers understand security needs and develop sound selection of security controls

#RSAC
Policy Creation & Enforcement Rules
Positive
 Default: do not allow anything to pass  Rules: what you want to permit to pass  Typically used by: Firewalls  Pros: More secure; can stop newer/advanced
attacks  Cons: More work to manage  Example: Application on iPhone

#RSAC
Policy Creation & Enforcement Rules
Negative
 Default: allow everything to pass  Rules: what you want to block  Typically used by: Anti-Virus; Web Proxies  Pros: Less work from management POV  Cons: Less secure  Example: No fly-list

Policy Life Cycle
· Review logs, metrics, audits, SLAs
· Assess goal accomplishments · Develop improvement steps &
Integrate

#RSAC
· Threat Profile · Security & Risk Assessment · Get Management Sign-off
· Develop & Implement Security policies
· Identify program gaps · Implement solutions / program · Develop Auditing & Monitoring · Establish goals & metrics

· Follow procedures · Carry out audits · Manage SLAs per program

#RSAC
A policy, without the lifecycle
 Written and not implemented  Disconnect & confusion around ownership  No ROI assessment  Missing improvement strategies  No assurance of compliance to regulations  Relying fully on technology as the only
security solution

#RSAC
Implementing Security Enforcement
 Goal
 Consistent enforcement everywhere. No matter what!
 Challenges
 Attackers look for (and expect) gaps in policy management & enforcement
 Threat analysis needing more processing power

Endpoint Security
How Agents Work

#RSAC
How it works · Two Modes
· Interactive · Scan · Signature/Rules reside on endpoint · Stops file from doing something "bad"

#RSAC
Endpoint Security Enforcement
Strength/Weakness

-- Devices covered wherever they roam
-- Visibility of inter-process communications

-- Performance (policy decision & enforcement in same place)
-- Deployment / Coverage

-- No real-time centralized monitoring

-- Manipulation by malware

Network Security
How Firewalls Work

#RSAC
How it works · Restricts access in/out of a system · Keeps bad things from "spreading" · Inspection & application based · Often times integrating proxy

#RSAC
Network Security Enforcement
Strength/Weakness

-- Hardened appliance
-- Ability to segment the network into trusted zones

-- Cannot protect what it cannot see
-- Performance with backhauling
-- Availability issues are the customer's responsibility

#RSAC
In Summary
 Endpoint enforcement has limitations with management & performance
 Network enforcement has limitations with visibility & performance

Cloud-Delivered Security
How CASB Works
(Cloud Access Security Broker)

Problem It Solves
· Visibility as workloads move to cloud
· Protect application/data that is in the cloud
· Performance & processing

web traffic from cloud apps

#RSAC
How It Works · SAML integration or reverse
proxy directs traffic to cloud servers · Traffic is inspected and policies reviewed & enforced · DLP, Encryption, Access Control

Cloud-Delivered Security
How Cloud SWG/AV Works
Problem It Solves
· Lack of visibility when users are off-network
· Performance from advanced analytic capabilities
· Performance issues from backhauling
· Manageability of intelligence updates

web traffic or files

#RSAC
How It Works
· PAC file or small agent deployed on endpoint
· Selective information or traffic sent to cloud
· All processing, policy application in the cloud
· Centralized management & reporting in the cloud
· Global network: cloud is closer to customer

Cloud-Delivered Security
How Cloud VPN/FW Works
Problem It Solves
· Visibility on & off-network and all packets
· Encryption of all traffic · Performance from advanced
analytic capabilities · Performance issues from
backhauling · Manageability of intelligence
updates

all traffic

#RSAC
How It Works
· Small Cloud VPN on endpoint or router
· Intelligently routes traffic · Encrypts traffic as necessary · All processing, policy application
in the cloud · Centralized management &
reporting in the cloud · Move all network security into the
cloud · Global network: cloud is closer to
customer

#RSAC

#RSAC
Challenges still exist
 Management: Endpoint deployment  Management: BYOD device management

#RSAC
Tying it together
 Implement a lightweight policy life cycle process
 Do the security & risk assessment  Determine the gaps
 Work with IT and business unit managers to understand adoption of cloud and usage of roaming devices
 Assess performance of your existing security enforcement technologies
 Consider limited adoption of cloud enforcement security technologies to cover gaps

Security Basics

Start Time 8:30 AM 8:45 AM 9:30 AM 10:15 AM 10:30 AM
11:15 AM 12:00 PM 1:15 PM 2:00 PM 2:45 PM 3:00 PM 3:45 PM

Title Introduction

Presenter Hugh Thompson

Security Industry and Trends

Hugh Thompson

User Authentication Trends and Methods for Native Mobile Applications Kayvan Alikhani

BREAK Mobile & IOT Security: Will Big Data Make it Better or Worse?

Hadi Nahari

Viruses, Malware and Threats LUNCH Crypto 101: Encryption, Codebreaking, SSL, and Bitcoin Security Enforcement Explained BREAK Internet and Web Security Issues Network Security

Tas Giakouminakis
Benjamin Jun Dana Wolf
Patrick Sullivan Gary Sockrider

#RSAC

SESSION ID: SEM-M01
Internet and Web Security Issues

Patrick Sullivan
Manager, Akamai Security Services

#RSAC

AAVVieiewwfrforommtthhee EEdgee
Patrick Sullivan Manager, Akamai Security Services

#RSAC
Akamai has unique insight into Web/DDoS Traffic
1 Akamai's Edge carries ~ 20Tbps of Web Traffic at steady state with bursts to 30+Tbps

2 Enhanced DNS Authoritative DNS Solution

Edge servers

DNS servers

Enhanced DNS

Akamai Web APlvatofoidrmdataWAFtheft and downtime by extending the

security perimeter outside the data-center and

protect from increasing frequency, scale and

sophistication of web attacks.

Prolexic

3 Prolexic BGP-Based DDoS Mitigation

Scrubbing

centers

4 Akamai Customer Base.

·

98 of top 100 Commerce Sites · 30 of top 30 Media Sites

·

All Braches of US Military

· 10 of top 10 Asset Managers

·

All Agencies of the US Gov't

· 10 of top 10 P&C Companies

·

10 of top 10 Banks

· 8 of top 10 Auto Manufacturers

#RSAC
Akamai CSI Platform Statistics
2 Petabytes of security data stored 10 Terabytes of daily attack data

#RSAC
What we'll talk about today
· Web App Attacks
· DDoS Attacks
· DNS Attacks

#RSAC
View from the Edge Web Attacks

#RSAC
Web Application Attacks

· Chosen Target Attacks

· Chosen Vulnerability Based Attacks

· Attacker picks target
· Recon · Mapping · Discovery · Exploitation · Repeat as necessary

· Attacker Picks a Vulnerability
· Scans at massive scale · Beacons back when successful · Exploitation

#RSAC
World Cup Attack Trend: Retribution Cyber Attacks

#RSAC
World Cup ­ Correlated Events

450

400

350

300

250

200

Brazil

150

Croatia

100

50

0

300000 250000 200000 150000 100000
50000 0 6-Jun

Spain Netherlands

13-Jun

20-Jun

Source: Akamai CSI

6-Jun 8-Jun 10-Jun 12-Jun 14-Jun 16-Jun 18-Jun 20-Jun

12000

600

10000

500

Match date

8000

400

Attack peak

6000

300

Chile

4000

200

Australia

2000Avoid data theft and downtim10e0 by extending the

0security perimeter outside th0e data-center and

protect from increasing frequency, scale and

sophistication of web attacks.

16000 14000 12000 10000
8000 6000 4000 2000
0

Cote Di'voire Japan

#RSAC
Croatia vs. Brazil (June 12th)
 Croatian hacker decides to retaliate ­ using 2 Offending IP addresses ­ All attacks are real SQL Injection attempts
While both IPs used an anonymous proxy, both used identical HTTP headers and attack payloads ­ making it highly probable that both are the same person or organization
Source: Akamai CSI

#RSAC
Spain vs. Netherland
· Spanish hacker decides to retaliate with an App-layer DoS attack, targeting a major Dutch media/news site Referring page for the attack 
· Most attacks came from a single IP (no proxy used): 80.244.*.*
· Target page was /ad/article/detail/live/introduction.do with 98% of the hits ­ a total of 232,498
· All 232,498 request were identical · Looking at the HTTP headers ­ it's obvious the attacker
knew exactly what he/she was doing - they created an HTTP request that included: cookies, valid browser headers (mimic a real browser), including "XRequested-With: XMLHttpRequest" to mimic an AJAX request. Only "flaw" was that session cookies never refreshed throughout the entire attack
Source: Akamai CSI

#RSAC
SQL Injection: Top 50 customers attacked by volume

#RSAC
SQL Injection Analysis of 2000 customers over one week
Protocol Breakdown
Breakdown by Intent
Source: Akamai CSI

#RSAC
SQL Injection Breakdown: SQL injection probing
· This step represents 60% of SQLi Traffic
· As a first step, attackers will usually perform an assessment of the web application to see if it is vulnerable to SQL Injection.
· Sample payloads include: sequences of SQL-sensitive characters like:
· apostrophe ('), · semicolon (;) · Modern approaches use Blind SQL injection techniques such as forming
Boolean conditions - AND 1=1, AND 1=0, as well as "timed attacks" such as those using the WAITFOR or sleep() functions.

#RSAC
SQL Injection Breakdown: Environment probing & reconnaissance
· Makes up 16% of SQL Injection Traffic · After the attacker concludes that the application is vulnerable to SQL
Injection, he/she will take the attack a step further, by trying to learn the type & structure of the database, its tables, columns, users and permissions. · Common Payload Example: · Extraction of information from the MySQL INFORMATION_SCHEMA table, for example: UNION SELECT group_concat(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS--

#RSAC
SQL Injection Breakdown: Credential Theft
· 23% of SQL Injection traffic · Attempts to steal user credentials through SQL Injection · These attacks included attempts to retrieve data from tables and
views such as:
· mysql.user (Mysql) · master.syslogins (MS-SQL) · master.dbo.sysxlogins (MS-SQL) · ALL_USERS (Oracle)

SQL Injection Breakdown: Database Content

#RSAC

Retrieval

· Makes up 1.5% of SQL Injection Attack Traffic
· Once the attacker has a clear understanding of the type and structure of the database and its tables, he/she can start retrieving contents remotely by using several techniques such as data extraction using UNION SELECT statements, or by using Blind SQL Injection techniques (using Boolean expressions).

SQL Injection Breakdown:

#RSAC

Login Bypass and Privilege Escalation

· Makes up .06% of SQL Injection Traffic
· The Majority of Web Apps use a SQL back end to check user credentials
· This provides hackers with a simple yet extremely effective method of bypassing the login mechanism using SQL Injection attacks.
· Sample Payload · ' OR 1=1-- as the user name. · In cases where the hacker knows the user name of the administrator (e.g.
"admin"), he/she could attempt to elevate their privileges by logging in with the user name: admin' or 1=1--

#RSAC
SQL Injection Breakdown: Denial of Service
· 0.0039% of the malicious requests were classified as attempts to deny service from other users by either overloading or shutting down the database server.
· The most observed vectors were:
· Excessive use of timed queries with extremely high value of time intervals
· Attempts to use the MS-SQL SHUTDOWN management command

#RSAC
Application Scanning
An attempt to exploit an old (2007) WordPress Remote File Inclusion vulnerability. The victim application was running ASP.NET
GET /wp-content/wordtube-button.php?wpPATH=http://www.google.com/humans.txt? HTTP/1.1 Host: www.vulnerable.site User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4)
Attacked parameter : wpPATH Malicious payload: http://www.google.com/humans.txt

#RSAC
What Else Did This Attacker Do On This Site?
Same attacker Sent 2122 different RFI exploit attempts

#RSAC
Was There Similar Activity Going On At The Same Time?
Attacks originated from a botnet containing 272 attacking machines
1696 victim applications were targeted 1,358,980 attacks were launched during the campaign The campaign lasted for 2 weeks

#RSAC
Shadow IT: "It's pretty loose today"
"People can sign up to Amazon or Azure, create user credentials to do it and spin stuff up. That hasn't been completely reeled in yet. We want an internal group that brokers cloud services. Establishes guidelines and preferred providers they would leverage and anything else around that. It's pretty loose today." ­ LE, Financial Services
Source: 451 Group

#RSAC
Implications of Shadow IT growing so quickly

Traditional IT
· Full lifecycle costs are considered
· Application Creation · Software Patching · Auditing/Scanning · Vulnerability remediation · Application Decommissioning

Shadow IT
· Fast, Cheap, and Easy
· Software Patching? · Scanning? · Application End of Life?

Easy-to-use CMS's Power Shadow IT

#RSAC

~ 20% of sites on the Web use WordPress

Source: Wordpress.com

#RSAC
CMS Plugins: Summary of 1 day's Attack Traffic

1134 customers probed Source IP's:17

1028 customers probed Source IP's:107

963 customers probed Source IP's: 7

711 customers probed Source IP's:42

653 customers probed Source IP's:19

#RSAC

UNIQUE ATTACK PAYLOADS
Exploit Announced

9/24

9/25

9/26

9/27

9/28

9/29

120,000+

9/30

10/1

#RSAC
Shellshock/Bash Probing: One week's summary
Avoid data theft and downtime by extending the security perimeter outside the data-center and protect from increasing frequency, scale and sophistication of web attacks.
Total source attacking IPs: 656 Total targeted customers: 2,570 Total attack transactions: 436,641

#RSAC
Avoid data theft and downtime by extending the security perimeter outside the data-center and
View fropmrotethcet frEomdginecreasing frequency, scale and DDoS Astotpahcikstsication of web attacks.

Even if your Security Practice is Perfect:

#RSAC

You share the Internet with others

Avoid data theft and downtime by extending the security perimeter outside the data-center and protect from increasing frequency, scale and sophistication of web attacks.

#RSAC
Frequency of DDoS Attacks Continues to Increase

 Increasing number of network- and application-layer attacks

6000

 Easier for attackers to launch or participate in an attack 5000

 Knowledge of application vulnerabilities spreading

 Number and availability of attack tools proliferating

4000

3000

2000 1000

Source: Akamai

2010

2011

2012

2013

2014

#RSAC
DDoS Attacks Are Growing in Size

 Newer attacks target protocol vulnerabilities to amplify size
 SNMP (6.3x)  DNS (28x-54x)  CharGEN (358.8x)  NTP (556.9x)

2014
320
270
2013
190

144

Gbps Mpps

2005
11 2

2006
18 8

2007
22 11

2008
39 15

2009
48 29

2010
68
38

2011
79
45

2012
82 69

©2015 AKAMAI | FASTER FORWARDTM

#RSAC
Multi-Vector Attacks are the Norm

Vulnerability in Google Maps plugin for Joomla enables #RSAC DDoS attacks
Scan for vulnerable servers
(Akamai found 150,000) Avoid data theft and downtime by extending the security perimeter outside the data-center and protect from increasing frequency, scale and sophistication of web attacks.

Amplify GET Flood Attack and
Obfuscate source

Proxy DDoS traffic thru vulnerable servers

Tools such as DavoSet/UFONet are leveraging the Proxy #RSAC Vulnerability
Avoid data theft and downtime by extending the security perimeter outside the data-center and protect from increasing frequency, scale and sophistication of web attacks.

UFONet UI

#RSAC
Avoid data theft and downtime by extending the security perimeter outside the data-center and protect from increasing frequency, scale and sophistication of web attacks.

#RSAC
Joomla GET Flood DDoS Attacks
Avoid data theft and downtime by extending the security perimeter outside the data-center and protect from increasing frequency, scale and sophistication of web attacks.

#RSAC
Account Checkers as a service

#RSAC
Account Checking Tool - Internals
After Credential Matching: Script to Match on Credit Card in Account
preg_match_all('/name="([^"]+creditCardId)"[^>]*value="([^"]+)"/si', $page, $matches); $cardIDs = $matches[2]; $ccCount = count($cardIDs);
foreach ($cardIDs as $cid) {
$url = "https://m.<site>.com/account/wallet"; $post = 'action=EDIT&creditCardVB.creditCardId=' . $cid .'&validationCheck=false'; $page = $curl->post($url, $post, 1, 1, 0);

#RSAC
View from the Edge: DNS

#RSAC
DNS Hijacks

You lock your car

You lock your home

You should lock your DNS

#RSAC
Best Practice DNS Locks
Client DNS Locks · clientUpdateProhibited · clientTransferProhibited · clientDeleteProhibited
Registrar locks · serverUpdateProhibited · serverTransferProhibited · serverDeleteProhibited

#RSAC
Multi-Vector Attacks: 2014 Sochi Olympics
· 3.5 Tbps event · 50% Growth in Average User Connection Speed Compared to 2012. · More than a Million Malicious Requests Blocked
· Multi-Vector Attacks Detected Again in 2014 · Application DDoS · RFI · Command Injection · Requests from Anonymous Proxy
· Attacks Again Spiked During Major Events · Opening Ceremonies · Hockey Semi-Final(US v. Canada)

Summary
· Web Applications are under constant scanning for vulnerabilities
· How long do you have to patch a new vulnerability like ShellShock?
· Hours, up to a week if you are really lucky
· DDoS Attacks continue to increase in complexity and scale
· Driven by servers commandeered by Web Application Vulnerabilities · Also driven by reflection attacks
· Please lock your DNS at your registrar
· Multi-Vector Attacks are the norm

#RSAC

Security Basics

Start Time 8:30 AM 8:45 AM 9:30 AM 10:15 AM 10:30 AM
11:15 AM 12:00 PM 1:15 PM 2:00 PM 2:45 PM 3:00 PM 3:45 PM

Title Introduction

Presenter Hugh Thompson

Security Industry and Trends

Hugh Thompson

User Authentication Trends and Methods for Native Mobile Applications Kayvan Alikhani

BREAK Mobile & IOT Security: Will Big Data Make it Better or Worse?

Hadi Nahari

Viruses, Malware and Threats LUNCH Crypto 101: Encryption, Codebreaking, SSL, and Bitcoin Security Enforcement Explained BREAK Internet and Web Security Issues Network Security

Tas Giakouminakis
Benjamin Jun Dana Wolf
Patrick Sullivan Gary Sockrider

#RSAC

SESSION ID: SEM-M01
Network Security 101

Gary Sockrider
Solutions Architect Arbor Networks @arbornetworks

#RSAC

#RSAC
Last Session of the Day!
197

#RSAC
What to Expect from this Session
 No "Death by Powerpoint"
 Interactive Discussion
 Audience Participation
 Learn Something!
198

#RSAC
What is Network Security?
 What is most important?
 Define your network?
 Where do I start?
 Who is in control?
199

#RSAC
The Global Network is Your Business
Diverse end-points are accessing your network from anywhere.

Corporate Offices

Mobile

Broadband
Internet Private Public Cloud Network
PrivaPteubClilcoud Clouds

Your assets are distributed everywhere.

A Global, Hybrid infrastructure

Content

SaaS

Corporate Servers & Applications

#RSAC
Network Perimeter Security
201

Problem Fueling $1Billion+ In Security Spend

#RSAC

Global Traffic Visibility

Mobile

CDNs

Carriers

Service Providers

Can't see global external
attack traffic

Availability Protection Internal Traffic Visibility

Can't withstand a direct attack

Internal Apps
Need to understand and
stop internal attack traffic

Remote Offices
Corporate Servers

SaaS

Cloud Providers

Enterprise Perimeter

Mobile WiFi

Employees

Malware Is An Ecosystem, Not Just a Sample #RSAC or Simple Signature

Malware Attack Vector
If redirected

Malicious Site/Exploit
Kit
Updates, Assessment, Connectivity Check

Command & Control / RAT

Actions on Goals:
Ransomware; DDoS; Data Exfiltration; Espionage; Click
Fraud; etc.

Updates, Status, Commands, Connectivity Check

The Internet

Email, Compromised
Site, URLs, IRC, Etc.
User / Victim

Exploit

Dropper / Downloader
Installs Malware

Crimeware Worm/Regeneration Config Bot Agent (Zeus, etc.)
Malware Package (Trojan)

Your PC
Actions within Network

Source: Emerging Threats Pro

How are threats getting through?

#RSAC

· Huge number of `ways in' ­ Drive By Download ­ SPAM/Phishing ­ Watering Hole ­ USB
· Many threat vectors ­ New AND Old ­ IPS / AV Limited coverage ­ Patching lag

· Leverage vulnerabilities ­ Zero Day ­ Java, Adobe, etc. ­ Compound Documents
Threats On Corporate Network
60 40 20
0

#RSAC
So, how do we get `better' at this?
· Actionable Threat Intelligence
­ Use the expertise within vendors, integrators to maximize your effectiveness
· Broad Visibility
­ Monitor within your network, not just at the perimeter
· Deep Visibility & Context
­ Full packet capture and threat detection at key network locations
· Improved Workflow
­ Invest in solutions that fit into an Incident Response workflow and enable personnel and processes

#RSAC
Actionable Threat Intelligence
206

#RSAC
Broad Visibility - Flow
Leverage Flow technologies for
 Cost-effective, scalable visibility  Layer 3/4 picture of internal network
Understand who talks to who, when and how much
 Develop a model of normal network / user behavior  Build policy/visibility around user-identity
Correlate with actionable threat intelligence Detect suspicious or malicious activities wherever they occur

#RSAC
Deep Visibility & Context ­ Packet Capture
Use high-speed packet capture for deeper visibility
 Monitor for specific threats at network / data-centre edge(s)
 Full-fidelity storage of forensic data for interactive, retrospective analysis
 Investigate scope of compromise / kill chain
Correlate (continuously)

#RSAC
Improved Workflow
Put the power back in the hands of the analysts
 Network & Threat Visibility, in context  Improve the Incident Response workflow
 Make drastic improvements to Detection/Analysis  Enhance Containment, Eradication and Recovery timelines
Technology should enable personnel & process investment
 Regardless of how many you have or skillset

#RSAC
What Now?

#RSAC
How to apply what you have learned
 Understanding
 Identify Knowledge Gaps  Plan for the Future  Collaborate with Colleagues
 Continuous Development
 Keep Asking Questions  Join a Network or Security Organization  Participate/Sponsor War Games
211

#RSAC
Questions?
Gary Sockrider Arbor Networks sock@arbor.net @arbornetworks
212

