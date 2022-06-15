SESSION ID: SBX1-R05

^

Tactical Survival Tips Internet of Things (IoT) Systems

Brian Witten
Senior Director, IoT Symantec Corporation @WittenBrian

#RSAC

#RSAC
How to Protect Connected Things
2

#RSAC
IoT betters our lives countless ways...

Medical Devices

Connected Cars

Digital Factories

Already 20 Billion Microcontrollers (MCU) annually 5 Billion Connected Today, 20 Billion by 2020

Smart Cities

Consumer Electronics

#RSAC
Quick HisQtouriyckoHf RisetoceryntoEfvAecnttusal Events

Pipeline, Steel Mill, Critical Infrastructure, Power Grid, Cars,

MultHi-oKislpotootnials

Steel Mill Blast

Pipeline Explosion

Furnace Damaged

Hundreds of Critical Infrastructure Sites

National Scale Power Grid Crashed

Cars: Digitally Stolen, Remotely Crashed

Hospitals Breached via Medical Devices

#RSAC
What changed?

PC / Datacenter Era Security - most easily
delivered by disk or by download

IoT / Cloud Era Security - must be integrated by design
to be effective

Information Technology (IT)
All verticals have same Hardware/OS supply chain
"3"
(Mostly UDP, TCP, IP)
"5"
(Mostly Windows, Linux, OSX, iOS, Android)
"2"
X86 and x64 by Intel and AMD

#RSAC

Internet of Things (IoT)

Fragmentation
Protocols
Operating Systems
(OS)
Chipset Architectures
6

Each vertical has different Hardware/OS supply chain
Thousands of Protocols
(Hundreds in each vertical)
Dozens
(Heavily fragmented by vertical)
Many
8/16/32/64 bit, AVR, ARM, MIPS, Over 12 vendors

#RSAC
Internet of Things (IoT) Cornerstones of Security

Manage Devices

Cloud/Data Center

Understand Your System

Gateway

Devices & Sensors

Protect the Device

Protect the Communications
7

#RSAC
Protect The Communications

Devices & Sensors

Embedded Software Operating Systems
Hardware

Protect the Communications
Required: Authentication Helpful: Encryption
Note: Signing "objects" can avoid decrypt/re-encrypt burden

What's needed?

Crypto Libraries:

Several good open-source and commercial options

Certificates:

Over a Billion IoT devices chain to a world class Certificate Authority (CA)

Roots of Trust:

IoT "Roots of Trust" can help identify foreign devices

8

Can extremely constrained devices

#RSAC

do meaningful security?

Early 80's grade chip
8 bit 8 Mhz 2 k SRAM

25 seconds

Benchmark: ECC/ECDSA256 AA Battery: 20+ years

Leading 10 year old chips

$0.25

16 bit, 16 Mhz 30 k SRAM

3 seconds

AA Battery: 20+ years

Current 32 bit chips

$0.50

32 bit, 84 Mhz 30+ k SRAM

9

150 ms

AA: 20 years

#RSAC
Protecting Devices (Boot Time)

G. Settings D. Primary App F. Network Monitor E. Crypto Libraries

C. Operating System B. Network Stack A. Device Drivers Pre-boot Environment

Never run unsigned code. Never trust unsigned configuration data. Never trust unsigned data. (Period.) Provide run-time protection for each device.
Protect the Code that Drives IoT
10

#RSAC
Protecting Devices (Run Time)

Traditional Approach: Malware Blocking
Signature based Internet access required
Reactive Ineffective on zero-day Ensures self-protection Customization or separate product
Large footprint

Whitelisting Behaviors: Sandboxing
Behavior / policy based No internet access required
Proactive Effective on zero day Protects OS critical resources Protects applications from each other
Small footprint

11

#RSAC
Internet of Things (IoT) Cornerstones of Security

Manage Devices

Cloud/Data Center

Understand Your System

Gateway

Run Time
Boot Time Protect the Device

Devices & Sensors
12

Authentication Protect the Communications

#RSAC
Safely & Effectively Managing IoT Devices

Why update devices?

...

Industrial Systems 19 years on average

3 days

Build in Over The Air (OTA) updates from the start

Vulnerability Discovery Rate (Linux)

Granular Updates Save Battery & Bandwidth

2,000 x

=

200 x

=

"Build it Right Once"
(Use it for Both General & Security Management)
General & Security Telemetry Functionality & Security Updates Configuration Changes Diagnostics & Remediation Network Access Control (NAC) Credentials/Permissions, Policies

13

Understand Your System

#RSAC

To Detect Strategic Threats

No matter how well you do everything else, some threats will still get past even the best defenses.
Detecting such threats requires strong understanding of what your network "should" be doing.
Machine learning (ML) distills models of "normal" that can run in compact Single Board Computers (SBC).
Some ML can "learn" in resource constrained gateways and small SBC to detect anomalies specific to specific networks.
Such IoT Security Analytics are crucial in finding advanced threats.

14

#RSAC
Internet of Things (IoT) Cornerstones of Security

Manage Devices Updates
Policies

Cloud/Data Center
Gateway

Understand Your System Embedded Analytics

Run Time Boot Time Protect the Device

Devices & Sensors
15

Authentication Protect the Communications

#RSAC
Agenda
Define a Simpler Framework for Building Security Into IoT Things Practical Example (2 slides) Tips & Tricks for Companies Leveraging (not Building) IoT Things
16

Automotive Threats A Quick Refresher

Supply Chain

Unauthenticated Commands Unauthenticated Connections

Cellular (IP & GSM)

No IP Port/Protocol Restrictions

Cellular (IP & GSM)

Other Wireless

Vulnerable Vulnerable

Modems Browsers/Apps

TCU

I V I

GSM

RTOS

RTOS

Other Wireless ( BT & Wifi ) Physical Tampering

TCU: Telecommunications U#nRSitAC IVI: In Vehicle Infotainment RTOS: Real Time OS ECU: Engine Control Unit BCM: Body Control Module xxM: Other Modules CAN: Controller Area Network CAN1/2: Hi, Med, Lo Speed CAN GWC: "gateway chip" OBD2: On Board Diagnostics port UBI: Usage Based Insurance GSM: Global System for Mobile Comm's, aka "a modem"

ECU

BCM

CAN1

GWC

OBD2

UBI GSM

BCM

Inadequate

Code Signing xxM

xxM

Potential Memory CAN2 Unauthenticated

Corruption Vulnerabilities

Bus

Vulnerabilities Announced This Summer Copyright © 2015 Symantec Corporation
Copyright © 2014 Symantec Corporatio(Anrch1it7ecture Simplified for Presentation)

Business Constraints: -- Consumers won't pay for security they "assume" -- OEM & Tier 1 Suppliers: extremely thin margins -- Security $ must be < "few %" of any car/module
CAMP VSC3, HIS SHE, EVITA HSM
Authenticate Comm's

Cornerstones of Security Automotive Vehicles
OMA DM, SCOMO
Manage Devices

TCU

I V I

GSM

TCU: Telecommunications U#nRSitAC IVI: In Vehicle Infotainment RTOS: Real Time OS ECU: Engine Control Unit BCM: Body Control Module xxM: Other Modules CAN: Controller Area Network CAN1/2: Hi, Med, Lo Speed CAN GWC: "gateway chip" OBD2: On Board Diagnostics port UBI: Usage Based Insurance GSM: Global System for Mobile Comm's, aka "a modem"

RTOS

RTOS

CAMP: Crash Avoidance Metrics

Program

ECU

BCM

CAN1 BCM

Protect Each Module
Code-Signing (Boot Time)

GWC

OBD2

UBI GSM

xxM

xxM

CAN2
Security Analytics

VSC3: Vehicle Safety Comm's HIS: Hersteller Initiative Software SHE: Secure Hardware Extensions EVITA: E-safety Vehicle Intrusion Protected Applications HSM: Hardware Security Module
OMA DM: Open Mobile Alliance

Host-Based (Run Time) Compiler Based (No-OS)

Embedded (in-vehicle), Global (OMA) Device Management (DM)

Copyright © 2015 Symantec Corporation SCOMO: Software Component

18

Management Object

#RSAC
Tips & Tricks LEVERAGING IoT Devices

Suppliers

Products

Buyers

Manufacturing Equipment

Industrial Equipment

Plant Owners & Operators

Medical Equipment
Automotive

Medical Devices
Automotive Modules

Hospitals Automakers

Requirements
19

#RSAC
Internet of Things (IoT) Cornerstones of Security

Manage Devices Updates
Policies

Cloud/Data Center
Gateway

Understand Your System Embedded Analytics

Run Time Boot Time Protect the Device

Devices & Sensors
20

Authentication Protect the Communications

#RSAC
IoT Security "Recipe"
Protect your devices: [ (high assurance boot) + (runtime protection) ] Protect communications: design in strong authentication mechanisms Manage your devices: build in update mechanisms for granular updates Understand your system: leverage analytics to catch strategic threats
Strong Foundations Cover All Four IoT Security Cornerstones!

#RSAC
Apply What You Have Learned Today
Owners/Buyers of IoT Things: Next week: meet with your Procurement team to begin adding Security Requirements to all RFP for equipment and/or component suppliers Next quarter: start educating other stakeholders on what it means to "build security into these things." Next year: refuse to buy equipment without adequate security
Makers / Builders / Venders of IoT Things:
Ensure you adequately cover all four "cornerstones" of security for your Things!
22

#RSAC
Thank You!
bwitten@symantec.com
Internet of Things (IoT) Security Reference Architecture:
www.symantec.com/iot
23

#RSAC
24

