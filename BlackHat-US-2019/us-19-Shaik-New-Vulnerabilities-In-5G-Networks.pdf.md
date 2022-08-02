New Vulnerabilities in 5G Networks

Altaf Shaik
(Technische Universität Berlin,Germany)
Ravishankar Borgaonkar
(SINTEF Digital, Norway)

07.08.2019

Blackhat 2019, USA

1

Identity catching
IMSI IMEI IMSI IMEI IMSI IMEI IMSI IMEI

07.08.2019

New Vulnerabilities in 5G Networks

2

5G?

07.08.2019

New Vulnerabilities in 5G Networks

3

5G Security?
 5G Security >> 4G ? (What's new)
 Same Protocols, Same security algorithms  Attacks in 4G/LTE fixed.?
 Downgrade attacks, DoS attacks, Location tracking  What's not fixed in 4G ­ copypaste to 5G

07.08.2019

New Vulnerabilities in 5G Networks

4

Mobile network

Radio Network Cell

Mobile Device

Base Station

Core

07.08.2019

New Vulnerabilities in 5G Networks

5

Capabilities?

UE Capabilities

Core network Capabilities1
(Security algorithms, voice calling support, V2V)

Radio access Capabilities2
(frequency bands, Rx & Tx features, MIMO, CA, Category)

1. 3GPP TS 24.301, 23.401, 24.008 2. 3GPP TS 36.331

07.08.2019

New Vulnerabilities in 5G Networks

6

Core Capabilities

07.08.2019

New Vulnerabilities in 5G Networks

7

Capabilities 5G
· V2X: Connected Cars · Prose (D2D): Location services · CIoT: IoT specific

07.08.2019

New Vulnerabilities in 5G Networks

8

Radio Capabilities

07.08.2019

New Vulnerabilities in 5G Networks

9

LTE Registration

 UE Capabilities
 sent to network while registration  Stored at network for long periods  visible in plain-text over-the-air

Registration (Core Network Capabilities)
Authentication and Security

Send Capabilities Radio Access Capabilities
OTA Security

Get capabilities
Save all Capabilities

Registration Success

07.08.2019

New Vulnerabilities in 5G Networks

10

Issue?
UE Capabilities
 Accessible by rogue base stations  Sent plain-text over the air  Standard + Implementation bugs

07.08.2019

New Vulnerabilities in 5G Networks

11

Attacks?
 MNmap (active or passive)  Bidding down (MITM)  Battery Drain (MITM)

07.08.2019

New Vulnerabilities in 5G Networks

12

Setup ­ LTE MitM attacker

 Hardware  2 X (USRP B210 + Laptops)
 Phones, Quectel modems, cars, IoT devices, trackers, laptops, routers....
 Software  SRSLTE
 Attacks tested with real devices and commercial networks

07.08.2019

New Vulnerabilities in 5G Networks

13

1. MNmap
 (Mobile Network Mapping)
similar to IP Nmap
 Maker  Model  OS  Applications  Version

07.08.2019

New Vulnerabilities in 5G Networks

14

1. MNmap
Identify any Cellular device in the wild

Baseband Vendor Name and
Model

Cellular

Cellular IoT

Chip Maker, Device Model, Operating System, Application of device, Baseband Software Version

Phone (Tablet)

Others

NB-IoT

Android
Samsung Huawei
HTC LG NOKIA

iOS
Iphone, Ipad (with
version)

Car Railways
Router USB dongle Hotspots
Laptops

Smart Meters Smart grid Sensors

Vending machines Wearables

LTE-M
Asset Trackers Agriculture
Home automation

07.08.2019

New Vulnerabilities in 5G Networks

16

Identification ­ How
Baseband Vendors implement capabilities differently
 For e.g., Qualcomm Chipsets always Disable EAI0
 Many Capabilities are optional, (disabled/enabled)
Each target Application requires different set of UE Capabilities
 V2V for automated car  Voice calling and codec support for phone  GPS capability for tracker  Data only support for routers, USB data sticks (SMS only)

07.08.2019

New Vulnerabilities in 5G Networks

17

DUT

07.08.2019

New Vulnerabilities in 5G Networks

18

Ref model
Devices · Baseband vendor · Application · Chipset name · 3GPP release

07.08.2019

New Vulnerabilities in 5G Networks

19

Fingerprints

Implementation differences among Baseband vendors

Capability Huawei Samsung Intel Mediatek Qualcomm

CM Service Prompt

1

0

0

0

1

EIA0

1

1

1

1

0

Access class control for CSFB

0

1

0

1

1

Extended

Measurement

0

0

0

1

0

Capability

07.08.2019

New Vulnerabilities in 5G Networks

20

Chipset info

07.08.2019

New Vulnerabilities in 5G Networks

21

Half-way
1. Baseband Maker 2. Baseband Model 3. List of supported devices for the chipset 4. Identify the right device and application

07.08.2019

New Vulnerabilities in 5G Networks

22

Fingerprints

Difference b/w phone and other devices

Capability

Phone Others

UE's Usage setting

Voice or Data

Not present

Voice domain preference

CS Voice or PS Voice

Not present

UMTS AMR codec Present

Not

Phone and preferred Baseband

Phone

Baseband

Huawei

Huawei

Samsung

Samsung

Apple

Intel or QCT

07.08.2019

New Vulnerabilities in 5G Networks

Difference b/w iOS and Android

Capability

Android

iOS

MS assisted GPS

1

0

Voice over PS-HSUTRA-FDD-r9

1

0

Difference b/w cellular and cellular IoT

Capability

Cellular IoT Cellular

PSM Timer

1

0

T3412 ext period TAU timer

1

0

24

MNmap issues
 SIM card can have affect on capabilities  enabled/disabled ­ operator setting, e.g., bands
 IoT applications lte-M vs NB-IoT  Timer values (low for smart meters, high for asset trackers)
 Success and failures in detecting (close to round off, multiple options)

07.08.2019

New Vulnerabilities in 5G Networks

25

Zero Encryption for IoT
· Integrity protected and partially ciphered
· EEA0 for NAS by some X operator
· IoT devices depend on Air interface security
· Device details in clear

07.08.2019

New Vulnerabilities in 5G Networks

26

What next
 Passive MNmap also works (active base station not required)
 Privacy
 Link IMSI to device capabilities on 4G  (associate device fingerprints to people)
 Launch target specific attack
 Open source MNmap : share traces with interested researchers

07.08.2019

New Vulnerabilities in 5G Networks

27

2. Bidding down
 Hijacking  Radio Capabilities  MitM relay before OTA Security  Network cannot detect

Send Capabilities

RELAY

Radio Capabilities

Radio Capabilities

OTA Security

Get capabilities
Save all Capabilities

Registration Success

07.08.2019

New Vulnerabilities in 5G Networks

28

Bidding down
 Radio Capabilities are modified
 UE Category changed (Cat 12 -> Cat 1)  CA and MIMO are disabled  Frequency Bands are removed  VoLTE mandatory requirements are disabled  V2V capabilities can be removed

07.08.2019

New Vulnerabilities in 5G Networks

29

Tests with real networks
 LTE service downgrade (with elite USIM)
 Iphone 8 and LTE Netgear router (Qualcomm Basebands)  Data Rate (downlink) 48 Mbps to 2 Mbps (USA and Europe)  VoLTE calls are denied to UE (CSFB used)  Handovers to 2G/3G due to lack of band support ­ downgraded

07.08.2019

New Vulnerabilities in 5G Networks

3030

Impact
 22 out of 32 Tested LTE networks worldwide (Europe, Asia, NA) are
affected (USA, Switzerland, France, Japan, Korea Netherlands, UK, Belgium, Iceland)
 Persistent for 7 days  Capabilities are Cached at Core network  Restart device for normal operation
 **Radio is bottleneck for speed data service

07.08.2019

New Vulnerabilities in 5G Networks

31

3. Battery Drain

Registration

 NB-IoT (Narrow Band)

PSM_enable Capabilities

Capabilities

 Power Saving Mode (PSM)

PSM_disabled

 OFF when not in use

Authentication and Security

PSM_Not_enabled Battery_Drain

Registration Success

07.08.2019

New Vulnerabilities in 5G Networks

32

Tests
 PSM disabled (UE and network don't detect)

 Continuous activity - Neighbor cell measurements
 drains battery (10 year battery??)

 Experiment with NB-IoT UE (Quectel BC68 modem)
 Reconnects after 310 hours (13 days)  Battery lifetime reduced by 5 times

 Persistent attack: restart required to restore

07.08.2019

New Vulnerabilities in 5G Networks

33

Vulnerability Status
 Reported to GSMA, 3GPP SA3 and other affected operators and vendors
 Positive acknowledgement / could be implementation issues  GSMA sent a LS (Liaison statement) to 3GPP to add fixes  Core network capabilities are still unprotected
 MNmap still possible on 5G

07.08.2019

New Vulnerabilities in 5G Networks

34

Why without/before Security

***To do early optimization for better service/connectivity

07.08.2019

New Vulnerabilities in 5G Networks

35

Fixes
 Fixes in LTE release 14 for NB-IoT will be commercial soon
UE Capabilities should be security protected : accessible only after mutual authentication · Operators eNodeB implementation/configuration should be updated
Important Capabilities should be replayed to UE after NAS security setup for verification · V2V, Voice calling features, PSM timers, etc.

07.08.2019

New Vulnerabilities in 5G Networks

36

07.08.2019

Thank you

altaf329@sect.tu-berlin.de rbbo@kth.se

New Vulnerabilities in 5G Networks

37

