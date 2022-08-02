Breaking Bad:

Stealing Patient Data

Through Medical

Devices

Saurabh Harit [0xsauby]

SSpiprenit rCoemnmutnicaStioens curityLabs

PROPRIETARY AND CONFIDENTIAL

1

notroot@spirent:~$>getuid
Saurabh Harit [0xsauby]
§ Managing consultant @Spirent SecurityLabs § Pentester / Domain Admin Everywhere § Security Researcher § Trainer, Speaker § Wannabe Reverse Engineer § Developer of Yasuo

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

2

tl;dr
§ Introduction to Internet-connected healthcare devices § Architecture & Workflow § Good, Bad & Ugly § Medical records vs Financial data § Threat surface of Connected healthcare devices ­ A
pentester's perspective § Real-world attacks against connected healthcare devices § Case Study #1 § Case Study #2 § Closing Remarks

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

3

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

4

Connected Healthcare Devices
Wireless

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

5

Medical Devices Classification

Consumer Wearables
·Fitness /Activity trackers
·Sleep pattern monitors

Patient Monitoring
·Insulin pumps ·BP Monitors ·Heart Rate Monitors ·ECG ·Glucose Meters ·Hemodialysis devices

IVD
·HIV Detection Systems ·Blood Analyzers

Embedded Devices
·Pacemakers ·Implants

In-house Equipments
·Medicine dispensing systems
·MRI ·CT Scanners ·Telemetry Systems ·X-Ray Machines ·Ultrasound Machines

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

6

The Model
Monitor

Analysis

Event

Aggregation

Trigger

Action

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

7

The Ecosystem / Architecture

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

8

The Ecosystem / Architecture

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

9

The Good
1. Remote health monitoring 2. Global health care 3. Less expenditure, better quality care 4. Faster response time 5. Efficient Asset Management & Maintenance 6. Alerts ­ Early Detection & Prevention 7. EHR (Electronic Healthcare Records) 8. RTHS (Real-Time Health Systems)

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

10

The Nightmare
1. Tons of new "connected" medical devices 2. Numerous communication protocols 3. "Legacy" devices 4. Network Segregation 5. Robust WiFi infrastructure??? 6. Monitoring, Automation & Analytics 7. Rogue Medical Devices 8. Operating Systems??? Think MedJack 9. Interoperability

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

11

Serial To Ethernet Converters

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

12

IOT Security

The Attack Surface
Network­ Services, firewall Application - Authentication, Authorization, Input Validation
Device Hardware­ physical security Mobile­ Client Data Storage, Data Transport, API Cloud ­ Backend Server, Authorization, Update security

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

13

The Horror Stories ­ MEDJACK / MEDJACK.2

1. Medical Device Hijack

2. MEDJACK ­ 2015/2016

3. MEDJACK.2 ­ 2017

4. Attacked older operating systems

5. Affected devices: X-Ray machines, CT Scanners, Blood Gas analyzer, MRI systems etc.

6. Undetected by Endpoint security

solutions

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

14

Financial vs Medical Data

Attacks Market Value Detection Rate

Financial Data

Medical Records

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

15

Approach
1. OSINT
¡ Previous Research ¡ FCC Filings ¡ Setup Guides ¡ Help Forums
2. Passive Recon 3. Active Testing 4. Weaponize

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

16

Approach
1. OSINT 2. Passive Tests
¡ Environment Setup ¡ Regular User Interaction
3. Active Tests 4. Weaponize

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

17

Approach
1. OSINT 2. Passive Recon 3. Active Tests
¡ Make controller changes ¡ Observe & compare responses ¡ Automate analysis where possible
4. Weaponize

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

18

Approach
1. OSINT 2. Passive Recon 3. Active Testing 4. Weaponize
¡ Collect & Synthesize ¡ Test, Extend & Refine ¡ Automate & Optimize ¡ Deploy & Exploit

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

19

Case Study #1

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

20

About the Device
1. Digital Pen 2. Used for prescriptions 3. Electronic transmission to pharmacies 4. Many manufacturers 5. Random images, no point zooming in.

Spirent Communications

NOT THIS ONE!!!

PROPRIETARY AND CONFIDENTIAL

21

Workflow

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

22

Let's Break It Down

1. OS à Windows 10
a) Nurse / Physician b) Administrator
2. USB 3. 802.11 b/g/n Integrated Wireless Network 4. 10/100M RJ45 Ethernet 5. HDMI, VGA 6. Digital Display 7. 3.5mm Audio Port 8. Windows Defender 9. Docking Station 10. Software Layer

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

23

Use Case Scenario

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

24

Initial Observations
1. Can connect a monitor, keyboard, mouse 2. Auto-login as Nurse (Total locked down mode) 3. Manufacturer software and services 4. Data capture via USB 5. Internet à Real-time data transfer 6. Offline à Stored encrypted 7. Over the wire à HTTPS (AES256) 8. Remote Access Component

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

25

Privilege Escalation

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

26

Privilege Escalation

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

27

Privilege Escalation

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

28

The Encrypted File

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

29

The Encrypted File

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

30

The Encrypted File ­ Win!!!

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

31

Another Crime

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

32

Access to Patient Data

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

33

Access to Patient Data

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

34

Access to Patient Data

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

35

Prescriptions

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

36

Let's Sum it Up
§ Access to digital pen § Privilege escalation § A bit of reverse engineering § Steal credentials § Remote database and portal access from your basement

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

37

Case Study #2

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

38

About the Device
1. IV Infusion Pump 2. Injects nutrients & medication 3. Controlled dosage 4. Safety features 5. External or Implanted 6. Used to be standalone, not anymore 7. Once again, random images, no point
zooming in.

NOT THIS ONE EITHER!!!

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

39

Workflow

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

40

Threat Vectors

§ Insecure
Configurations § Hardcoded
Passwords § No Tamper Detection § Insufficient Patching § Older Operating
Systems § Weak Access Control § Insufficient Logging § Unprotected BIOS § Lack of AV

Data
§ Weak Authentication / Authorization
§ No Data Encryption § Insufficient Data
Validation § Insufficient Data
Integrity § Insufficient Data
Backup

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

Network
§ Unencrypted Network Communication
§ Insecure Network Configurations
§ Insufficient Firewall Rules
§ Lack of Segregation
41

Initial Lab Setup
Standalone Infusion Pump

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

42

Initial Observations
1. Ethernet (RS-232) 2. 802.11 b/g/a Integrated Wireless Network 3. USB Enabled 4. IrDA Port 5. Display ­ Touch Screen 6. Keypad 7. Maintenance Mode ­ Password Protected \o/

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

43

First Blood
§ Default Password § Access to Network Config § Change (some) Network Configs § Upgrade/Downgrade Software

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

44

Configs

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

45

We Bought a PDA

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

46

Overwriting Wireless Settings

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

47

Additional Observations
§ Telnet § FTP § SSH § Connection attempt to pump server (****PUMPGW)

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

48

The Initial Traffic
§ Plain-text protocol loosely based on XML § Contained pump description:
§ Pump Serial Number § Current Time § Wireless Access Point Data § IP/MAC Information § Maintenance Due Date § XMODEM checksum

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

49

Time to Fuzz
§ Communication with pump, both as client (tcp/51244) & server (tcp/51243) § Created custom Python library to interact with pump § Observed numeric header specifying Message types
§ Message Type 2 ­ Confirms pump to pump server connection § Message Type 7 & 31 ­ Not sure § Message Type 8 ­ Followed by Message Type 2. Updates pump status. § Message Type 20 ­ Network commands § Message Type 208 & 238 ­ Not sure

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

50

Fuzzing

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

51

Winning Packet

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

52

Master Drug List
§ Used for drug administration § Nutrients, Drugs, Blood etc. § Maintains dosage, proportions § Soft / Hard Limits

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

53

More Access

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

54

THANK YOU

Q/A

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

55

References
§ Google Image Cache

Spirent Communications

PROPRIETARY AND CONFIDENTIAL

56

