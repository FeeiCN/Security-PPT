SESSION ID: ECO-T07R
Endpoints in the New Age: Apps, Mobility, and the Internet of Things

Benjamin Jun
CTO Chosen Plaintext Partners
@BenjaminJun

#RSAC v17

A look back...

@BenjaminJun #RSAC

1985

1993

2002

Windows/Mac

Thin Client

2007

Smartphone

2012

BYOD Internet of Things

Lotus 1-2-3 WordPerfect
1983

Browser JavaScript
1994

WiFi Cloud
App Store

2000

2006 2

2008

HTML5
Where possible, dates specify when a platform reached critical mass www.droid-life.com Microsoft Windows 1.01, used with permission from Microsoft

Lots of connected devices!

@BenjaminJun #RSAC

Source: Cisco

PCs IP phones Mobile phones Consumer Electronics Machine-to-Machine
3

Endpoint security today

Monitor Recover Manage

 React to anomalous data/behavior  Respond quickly to 0 day  System repair  Centralized policy enforcement  Deployment management

@BenjaminJun #RSAC

Endpoint Security Platforms Market The Radicati Group, Inc. (2014)
4

Endpoint security today

@BenjaminJun #RSAC

 Complexity hurts defense (a)

(b)

 Platform diversity  NewFfeirgpeulnarcetefo5br:meAtwsdevheeanrvsceaoritraerlerrceitbxailemmaspgeleec,suagrnietdyneirmataegdefporredAilcetxedNeint c[o9r]r.(eLctelfyt)misaganciofirerdecbtlyy1p0rxed(ivcateludessasmhipfltee,d(bcey  Lotcslaomf pneedw),a(rpipghst) adversarial example. All images in the right column are predicted to be an " ostrich  Appcalmogeilcuss"m. eAavreerdagaecdriosstosrtciolonubda­sedeovnic6e4­exIoamT ples is 0.006508. Plase refer to ht t p: / / goo. gl /
for full resolution images. The examples are strictly randomly chosen. ThereRisubneoGtoaldnbyerpgoAsrtcsheivleesction

 This is a classic machine learning situation
 Machine recognition cuts through complexity  ...but lousy against skilled adversaries  Result: race-to-update!

 Attackers are more subtle +(ad)eep (APT)

"car" "NO(Tbc)ar"

delta

Intriguing properties of neural networks, Szegedy et al

 HAFRiDgutroe t6u:nAedfvaelsrsearpioalsietxivaemvpsle.sfaflosreQnueogcaNtievte[10]. A binary car classifier was trained on top of the

features without fine-tuning. The random5ly chosen examples on the left are recognized correctly as c

What lies ahead...
Application Portability Device Federation
#RSAC
Complex Trust Domains Internet of Things

Workspaces of the future

@BenjaminJun #RSAC

Global connectivity & collaboration Instant access to different domains Hierarchical control, security

"Mobile [as a distinction] is dead ...I expect to use any screen"
­ Matias Duarte VP of Design, Google

7

Application portability
Seamless sessions/data across independently managed endpoint devices.
 Securely "throw" an app to different device
 Application bound to user, not device  Immediate, seamless response  Minimal admin (BYOD, friends house, hotel)
 ... when app and data really matter!
8

@BenjaminJun #RSAC

Attackers target interoperability controls

@BenjaminJun #RSAC

 Example: HDCP secure content pipe
 "High Bandwidth Digital Copy Protection"  Roles: Source [ Repeater]  Sink

 Protects digital content, interoperability
 Ease of use: Fast, offline, any-to-any  No one device contains global secret

but a group of 40 devices reveals it!

 Commercial exploit!

A Cryptanalysis of the High-bandwidth Digital Content Protection System (Crosby, Goldberg, Johnson, Song, Wagner)
9
image from www.hdmi.org

Key management is hard
 Example: Apple Airplay
 Protects digital content, interoperability, and user binding
 Fast, offline, any-to-any  Pipe + direct connection to Internet sources
 Security design
 RSA keypairs for different roles  Global keys extracted
10

@BenjaminJun #RSAC
shairport, James Laird

Policy centralization improves portability

@BenjaminJun #RSAC

 Cloud sync helps data portability
 Sync + console greatly improve management tools
 But security of distributed data only as strong as weakest link
 Controls are coarse
Centralization helps. But device security is the limiting reagent.
11
www.dropbox.com (accessed 2/13/2015)

Software sandboxes not good enough

@BenjaminJun #RSAC

The Great Cloud Reboot of 2014
Xen Security Advisory CVE-2014-7188

Content as threat vector

12

https://www.nccgroup.com/en/blog/2015/02/abusing-blu-ray-players-pt-1-sandbox-escapes/

Secure user interface... elusive!
 Required for portability
 UI isolation, privacy, integrity  But we don't have local secure UI!
 Guiding lights?
 SE Linux has right focus on interfaces  PIN pad standards (DUKPT)
 But separated UI is good for security!
 ...did iMessage just kill SMS 2-factor?
13

@BenjaminJun #RSAC
http://blog.billguard.com/2014/07/look-easily-can-thwart-even-sophisticated-atm-skimmer/

What lies ahead...
Application Portability Device Federation
#RSAC
Complex Trust Domains Internet of Things

Device federation
M2M peer cooperation
 To assess device environment  For control + data flows  When one device proxies a human

@BenjaminJun #RSAC

Need to discover, create, manage, and authenticate endpoint identities
15

Fridge: Marjan Lazarevski
S-beam: wonderhowto.com

...best practice for device federation?
Problem: wifi-enroll a new printer 1. New printer defaults as open wifi AP 2. "HP Auto Wireless Connect"
 Runs on your PC  Scrapes wifi access code from OS  Connects to printer AP and gives access
code to printer 3. Printer joins your wireless network!
Genius or Scary?
16

@BenjaminJun #RSAC
www.wikihow.com

Authentication standards filling out...

 Fast IDentity Online (FIDO) Alliance

FIDO

 People authentication

 Leverages security features on user device

 Agnostic to device authentication technology

 OAuth, OpenID
 API access (robot) authentication  Client enrolled and given a key

 ...not M2M / endpoint solutions!
 Need device discovery, P2P connection

17

@BenjaminJun #RSAC

Ease of 1st Connection

Decentralized device federation

Proximity & web-of-trust

Embedded agent
CryptoManager

@BenjaminJun #RSAC

Enroll to local hub

Enroll to central service

Degree of Centralization

Web of trust: www.linux.com Bluetooth: cloudlink.soasta.com
CryptoManager: rambus.com S-beam: wonderhowto.com

What lies ahead...
Application Portability Device Federation
#RSAC
Complex Trust Domains Internet of Things

The good old days (pre-2010)
 Hierarchical structure
 Device Admin = Owner = Root  OS/BIOS in charge  Policies enforced via endpoint
security product
 Reality
 "Possession is nine tenths of the law"  Dangerous to do high-threat stuff on general IT platforms
20

@BenjaminJun #RSAC
www.historyforkids.net

Many cooks in the kitchen!

Entities
Device owner User(s) Applications Application developer App store BYOD administrator(s) Mobile carrier / system operator OS vendor Device manufacturer Chip manufacturer

Privileges
Run app Unlock data Read location info Application keys Access to crash logs Platform attestation Allow SW update Debug unlock Privileged developer hooks Peripheral authentication Encrypted key store
21

@BenjaminJun #RSAC

Pressure on trust boundaries

@BenjaminJun #RSAC

 App doesn't trust user  App doesn't trust root  User cannot touch app's keys

 Nobody trusts the software  Auditable privilege limits  No single administrator:
multiple, limited authorities
22

Well intentioned but limited

@BenjaminJun #RSAC

Red/black isolation too simplistic

Sandboxes incomplete, make developers lazy

TPM attestation not for complex SW

Key rolling w/o device robustness?

eventwristbands.com

23

Infineon TPM overview, 2008 Docker

One ring to rule them all?
 Multiple "owners", transparent limits, privilege transfers, situational override, auditable logs and limits
 Not trusted: Root / OS / vendor / govt
 Platform enforces data/program domains  Privilege handoffs over device lifecycle  Can remotely audit system attributes  Enforced in HW, not by OS
24

@BenjaminJun #RSAC
Chart: Credo Construction

What lies ahead...
Application Portability Device Federation
#RSAC
Complex Trust Domains Internet of Things

The Internet of Things

@BenjaminJun #RSAC

The physical world is becoming a type of information system [with] sensors and actuators embedded in physical objects...
When objects can both sense the environment and communicate, they become tools for understanding complexity and responding to it.
­ McKinsey & Company

26

Challenge: Break physical stuff, at scale

@BenjaminJun #RSAC

 Enron fakes grid transactions to manipulate market (2001)
 Stuxnet targets programmable logic controller (2010)
 IOActive demo'd vulnerabilities in Washington DC traffic management system, (2014)

Siemens Simatic S7-315
The devices: Radio Ranges

Hacking US Traffic Control Systems Cesar Cerrudo, IOActive
27

Place (GPS) Challenge: Time and Place

@BenjaminJun #RSAC

 IoT policies sensitive to time/location
 App logic, pricing, proximity assessment, identity, pairing, DRM, ...

 Today's approaches spoofable, not private

Captured RQ-170 Sentinel



PrCeJd6icGtPioS nJa:mCmheirpset corSeusccOfeonsrstfhueelnGRvePiSqrouSpinreommofeeinnngttsAfaotttratecksstationCaptured RQ-170 Sentinel

jammerstore.com

Christian Science Monitor, 12/15/2011

Tippenhauer, Pöpper, Rasmussen, Capkun

 Independent CPU maintains GPS + time history

 Digitally sign data, traceable to module security certification

#RSA

28

28

Christian Science Monitor 12/15/2011

Challenge: IoT device maintainabiliy

@BenjaminJun #RSAC

 Unmanaged IoT hard to update, no clear owner, no mgmt $
 But today's endpoint security relies on updates!

 IoT infrastructure has 5x longer field life than mobile device

 System components have short lived support

  

Chipset SW team builds Board Support Package ODM copies BSP, doesn't know innards Product vendor makes minimal customization
...will the last one in the building patch the vulnerability?

(BSP)

AhnLab
V3 Mobile

Version 2.1 Platform Android 5.0.1 Report 150101 Date Jan/2015
Protection

pquDoussueeirrdtiyinvtghtehesJe.amirPnoirunosa-dtrthuycecu2-trs0cr1elho5nautdwdvteesoreesdrviveoaimnclueooasnft.esaWdtlrl a3pet1refoomtdchuouecbsirtieslcedfaosoprenactbhmuielraiitttlieywesspatirrunoesgdi.dnuTegcthteaseclylftoicowronAemarnenpddoranoluleiosdnwatubsesidlaiintntygod, tuiphnprecodilrtauedtdceeitniftoahgnueplmlteasrsyfeeoetlrrtvimsne.gsasna.ctWeanaeynadtliwmfaalesyesand

Protection against malicious Android apps

Detection of a representative 2,950 samples used

set

of

malicious

apps

discovered

in

the

last

4

weeks

(AV-TEST

reference

set)

January Industry average

Usability

Protection Score

6.0/6.0

Malware detection Impactofthesecuritysoftwareontheusabilityofthedevice Performance: The app does not impact the battery life Performance: The app does not slow down the device during normal usage

test:January

Industry average

"We use only recent Performance:Theappdoesnotgeneratetoomuchtraffic

False warnings during 1,932 samples used

installation

and

usage

of

legitimate

apps

from

Google

Play

Store

False warnings during 981 samples used

installation

and

usage

of

legitimate

software

from

third

party

app

stores

00

00

malware, which is not Features

Usability Score

Further important security features

Anti-Theft (Remote-Lock / Remote-Wipe / Locate): Locate, Lock or Wipe your device when it is lost or stolen

6.0/6.0 January

older than 4 weeks." CallBlocker:Blockcallsfromspecificorunknownnumbers Message Filter: Filter messages and/or mails for unwanted content Safe Browsing: Protection of malicious websites and/or against phishing

Parental Control: Features to control or observe the activity of children on the device

Backup: Personal data can be saved to SD-card or cloud storage

AV-TEST Independent IT-Security Institute Encryption:Any
Other features:

kind

of

encryption

is

supported

(e.g.

device

encryption,

SD-card

encryption

or

VPN)

Android Testing Methodology (2013) Network Management

29

Copyright © 2015 Phone +49 (0)

by AV-TEST GmbH, Klewitzstr. 391 60754-60, Fax +49 (0) 391

670,735941-1629,Mwawgwde.abvu-rtge,sGt.eorrmg any

#RSAC
Healthy Endpoints

Endpoint foundation
 What gets to run on the platform?
 Boot / code authentication  Secure debug lock
 Do my secrets remain opaque?
 Application partitioning  Hardware-based secure key storage
 Am I in the real world or the matrix?
 Environment attestation  Peripheral authentication
31

@BenjaminJun #RSAC

UI App App
OS / TrustZone / Hypervisor

Secure Key / ID store + manager

Hardware Crypto

Trust from the top down
 Device enrollment  App deployment & updates  System audit & risk management  Online revocation  Policy management
32

@BenjaminJun #RSAC

DB
App server

DB
App server

UI

App App

OS / TrustZone / Hypervisor

Secure Key / ID store + manager

Hardware Crypto

Trust meets in the middle
Identity + key provisioning Authentication service Policy management Security updates
Identity + key management Sandboxed secrets
Partitioning of critical state Reliability & integrity
33

Device Mfg. Server

@BenjaminJun #RSAC

DB
App server

DB
App server

UI App App

OS / TrustZone / Hypervisor

Hardware

Secure Key / ID store + manager

Crypto

Apply what you have learned
 Near term  Understand endpoint security systems (walk show floor!)

@BenjaminJun #RSAC

 Mid term  Understand the limits of your endpoint tools  Appreciate where your roadmap deviates from your security tools  Employ platform security building blocks
 Long term  Advocate for platform improvements

34

Endpoints In the New Age
Application Portability Device Federation Complex Trust Domains Internet of Things

Questions? @ Benjamin Jun
ben@ChosenPlaintext.com
#RSAC

