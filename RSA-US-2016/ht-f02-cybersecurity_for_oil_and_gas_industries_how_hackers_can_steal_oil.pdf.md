SESSION ID: HT-F02
Cybersecurity for Oil and Gas Industries: How Hackers Can Steal Oil
#RSAC

Alexander Polyakov
CTO ERPScan @sh2kerr

#RSAC
About ERPScan
The only 360-degree SAP Security solution - ERPScan Security Monitoring Suite for SAP and Oracle Leader by the number of acknowledgements from SAP ( 250+ ) and Oracle (40+) 80+ presentations key security conferences worldwide 30+ Awards and nominations Research team ­ 20+ experts with experience in different areas of security from ERP to ICS and Mobile Offices in Palo Alto, Amsterdam, Copenhagen, Sidney
2

#RSAC
Evolution?
3

#RSAC
How does traditional VAPT works
A company hire experts for VAPT service or Product Those specialists run some pentesting tools They (may) manually test vulnerabilities, escalate privileges and as a result write report about vulnerabilities Report looks like
"we found vulnerability X on the server Y look at the black screenshot with command line".
4

#RSAC
Common VAPT report
5

#RSAC
Why?
Everybody know that there are vulnerabilities in almost every system The question now
how dangerous are they how easy is to exploit them what can happen after the exploitation? and what kind of REAL risks to YOUR organization it provides.
6

#RSAC
Risks are different
7

#RSAC
Why Oil and Gas?
Critical Industry-Specific And I know it )
8

#RSAC
Why Oil and Gas?
PS: And something strange is happening here )
9

#RSAC
Oil and Gas 101
10

#RSAC
Upstream: Critical processes and systems
Extraction (Drilling) Gathering (From earth to separators) Separation (Separate oil, gas and water) Gas compression (Prepare for storage and transport) Temporary Oil Storage (Temporarily store before loading) Waste disposal (Water disposal) Metering (Calculate quantity before loading)
11

#RSAC
Midstream: Critical processes and systems
Terminal management (Obtain oil from upstream) Gas Processing (Separate natural gas and NGL) Gas Transportation (Transfer gas to storage via pipelines) Oil transportation (Transfer oil to storage via pipeline/Truck/Barge/Rail) Base load Gas storage (Temporary and long-term) Peak load Gas Storage LNG Storage Oil Storage (Long-term oil storage)
12

#RSAC
Downstream: Critical processes and systems
Refining (Processing of Crude Oil) Oil Petrochemicals (Fabrication of base chemicals and plastics) Gas Distribution (Deliver gas to utilities) Oil Wholesale (Deliver petrol to 3rd parties) Oil Retail (Deliver petrol to end users)
13

#RSAC
What can happen?
14

#RSAC
Why should we care
15

#RSAC
What can happen?
Plant Sabotage/Shutdown Equipment damage Utilities Interruption
Production Disruption (Stop or pause production) Product Quality (bad oil and gas quality) Undetected Spills Illegal pipeline taping Compliance violation (Pollution) Safety violation (Death or injury)
16

#RSAC
What about Security

#RSAC
Three aspects of Oil and Gas Cyber Security
18

#RSAC
Three aspects of Oil and Gas Cyber Security
When we speak about securing oil and gas companies we should cover Operational Technology security Enterprise Application security Connections security
19

#RSAC
ICS Security in Oil and Gas

#RSAC
Oil and Gas Cyber-Security (OT part)

3 Areas:
Upstream Midstream Downstream

20+ processes:
Separation Drilling .........

100+ System Types:
Burner Management Fiscal Metering ....
21

1000+ Solutions
from hundreds of vendors:
Emerson Rockwell Siemens ....

#RSAC
Lets look at those systems
Burner Management System (Gas Oil Separation) Metering (Fiscal Metering System (Metering) Tank Inventory System (Oil Storage )
22

#RSAC
Gas Oil Separation
Risks:
Product Quality, Equipment damage, Plant Sabotage, Production Disruption, Compliance violation
Details
Separate Oil, Gas and Water using multiple stages
Systems
Burner Management Systems (BMS) Compressor Control System (CCS) Vibration Monitoring System (VMS)
23

SEPARATION: Burner Management System

#RSAC

(BMS)

Description
Used in a variety of applications: Separators, tanks, heaters, Incinerators, flare stacks, etc.
Systems:
Management: Emerson's DeltaV SIS, Invensys BMS, Honeywell's BMS, Combustex BMS-2000, Allen-Bradley, Siemens SIMATIC BMS400F
PLC vendors: GE, Modicon, Allen-Bradley, Koyo, Siemens
Flame sensors: Fireye, PPC, Honeywell, IRIS, Coen

24

SEPARATION: Burner Management System

#RSAC

(BMS)

Simple Burner Management System

https://cache.industry.siemens.com/dl/files/036/109477036/att_856487/v2/109477036_Burner_Application_Example_TIAP_DOC_v102_en .pdf
25

SEPARATION: Burner Management System

#RSAC

(BMS)

OK, what if somebody will have access to BMS? What he can do?
Any physical attacks?

26

SEPARATION: Burner Management System

#RSAC

(BMS)

If an attacker wants to commit sabotage and stop operations by destructing burning process, he needs to control any of the sources of flammable mixtures
27

#RSAC
Flammable mixture sources:
Oil or gas leaking into the combustion chamber through the burner as a result of leaking fuel shut off valves. insufficient combustion air resulting unburnt fuel in the dust collector. oil is not properly purged Quenching of the flame by cold dust entering the furnace Fuel entering the furnace as a result of repeated unsuccessful ignition attempts. This is the significant risk with oil firing, A typical cause is a cold oil remaining in pipes during a shutdown
28

SEPARATION: Burner Management System

#RSAC

(BMS)

The main function of the BMS is to allow and ensure the safe start-up, operation, and shutdown of the Fired Heater.
Unauthorized access to BMS can lead to multiple risks including Explosion.
The simplest attack on BMS System is to turn off the purge.
Cold oil left in pipes during previous shutdowns can burn and damage the equipment.

29

#RSAC
Metering
Risks:
Product Quality, Monetary loss
Details
Analyzes density, viscosity of content, temperature, and pressure Divided into several runs
Systems
Fiscal Metering System Liquid Flow Metering Gas Flow Metering System Wet Gas Metering System
30

#RSAC
Fiscal Metering
Description
Custody transfer, or fiscal metering, occurs when fluids or gases are exchanged between parties. Payment is a function of the amount of fluid or gas transferred. A small error in measurement leading to financial exposure Over a year, the 0.1% error would amount to a difference of $50m. The engine of a custody transfer or fiscal metering installation is the flow computer.
31

#RSAC
Fiscal Metering Systems
Production Accounting System FlawCall ­ FlawCall Enterprise (connected with IT) KROHNE SynEnergy (connected with IT)
Honeywell's Experion® Process Knowledge System (PKS), MeterSuiteTM Schneider Electric InFusion Schneider Electric SCADAPack
Flow computing
KROHNE Summit 8800, ABB TolatFlow, Emerson FloBoss S600 (previously known as Daniel DanPac S600), Schneider Electric Realflo
32

#RSAC
OIL STORAGE
Risks Plant Sabotage/Shutdown, Equipment damage, Production Disruption, Compliance violation, Safety violation
Description Consist of 10-100+ tanks with 1-50m barrels Tank Inventory Systems (TIA) collects data from special tank gauging systems Accurate records of volumes and history are kept for Forecasting for stock control Tank level deviations can result in hazardous events such as a tank overfilling, liquefied gas flashing, etc.
Systems Terminal Management Systems, Tank Inventory Systems, Tank Management Systems
33

#RSAC
Tank Inventory Systems
Terminal Management
Honeywell Enfaf TM BOX (connected with IT) Emerson Syncade Terminal Logistics (connected with IT) Emerson Rosemount TankMaster WinOpi
View and control commands Change alarm (Level, Temperature, Pressure) Send management commands servo tanks (Freeze, Lock)
34

#RSAC
Enterprise Applications Security in Oil and Gas
35

#RSAC
Enterprise usage: Business Applications
85% of Fortune 2000 Oil and Gas companies use SAP
36

#RSAC
Enterprise usage: Business Applications
70 million barrels per day of oil are produced by companies using SAP solutions
(75% of total Oil production)
37

#RSAC
SAP in Oil and Gas
According to SAP:
..platform for operations and maintenance, to enable you to gather, analyze, decide, and execute across the many elements that drive performance of assets....
38

Enterprise applications VS Oil And Gas

#RSAC

processes

PPM (Project portfolio management) ALM (Asset Lifecycle Management) LIMS (Laboratory Information Management System) PAS (Production Accounting System) ERP (Enterprise Resource Planning) + HR, CRM, PLM, SRM, BI/BW, SCM

39

#RSAC
Enterprise applications
PPM <-> Exploration ALM <-> Refinery, Separation, etc. LIMS <-> Refinery, Separation PAS <-> Tank Inventory, Metering ERP <-> Tank Inventory, Metering + HR, CRM, PLM, SRM, BI/BW, SCM
40

#RSAC
Project Portfolio Management (PPM)
Risks: Espionage ­ information about new explorations Fraud ­ improper management decisions, lost profits
Advantages: Enhancing visibility and transparency
Examples: SAP PPM, Oracle Primavera, MS Project, MS SharePoint
41

#RSAC
Asset Management and Operational Integrity
Risks:
Fraud ­ fake data about asset conditions Sabotage - Physical damage to production and engineering devices Compliance Violation ­ Data manipulation to give an illusion of Compliance
Advantages:
Maintain integrity of your physical assets Manage emissions, hazardous substances, and product and regulatory compliances
Applications: SAP PM (Plant Maintenance), SAP EAM, AssetWise APM, Oracle EAM, Avantis, IBM Maximo, Aspentech PIMS
42

#RSAC
LIMS (Laboratory Information Management)
Risks Fraud ­ modifying sample data results Espionage ­ stealing secret information Sabotage ­ publication of non-compliant results, denial of service attacks
Advantages: quality control of the samples, utilized equipment and inventory the storage, inspection, assignment, approval, and compilation of the sample data for reporting and/or further analysis
Examples: LabWare, thermoscientific, AspenPIMS and In-house developments on Oracle DB
43

#RSAC
Production Accounting
Risks Supply chain Availability ­ direct impact on cost effectiveness Fraud ­ Manipulations with quantities
Advantages: Production accounting Automated data collection and validation Forward looking production planning
Examples SAP IS-OIL PRA, SAP ERP MM-IM, Honeywell PAR
44

#RSAC
ERP
Risks Supply chain Availability ­ direct impact on cost effectiveness Fraud ­ Manipulations with quantities
Advantages: Forward looking production planning Automated data collection and validation Analyze production deferments Production accounting
Systems
SAP ECC IS-OIL, SAP IS-OIL PRA, Honeywell PAR, Oracle JDE Manufacturing Accounting
45

#RSAC
Enterprise apps security
Ways to compromise SAP ERP: Vulnerabilities Misconfigurations Unnecessary privileges Custom code issues

#RSAC
Vulnerabilities in SAP and Oracle
Only one vulnerability would suffice to jeopardize ALL business-critical data
47

#RSAC
Misconfigurations in SAP
~1500 General profile parameters ~1200 Web applications to configure ~700 web services to secure ~100 specific management commands to filter ~100 specific parameters for each of the 50 modules (FI, HR, Portal, MM, CRM, SRM, PLM, Industry solutions...) http://erpscan.com/wp-content/uploads/publications/EASSEC-PVAG-
ABAP.pdf
48

#RSAC
Custom code issues in SAP, Oracle and MS
SAP's - ABAP, XSJS, JAVA, JavaScript UI5 Oracle's - PeopleCode, PL/SQL Microsoft's - X++
http://erpscan.com/wp-content/uploads/publications/3000-SAP-notes-Analysis-by-ERPScan.pdf
49

#RSAC
Unnecessary privileges in ERP
Critical privileges and SoD issues For example: Create vendor + Approve payment order 200-500 Rules for typical application 500k conflicts in typical company after first audit
More on ERP Security: https://erpscan.com/research/white-papers/
50

#RSAC
Security of Connections between IT and OT
51

#RSAC
IT/OT connection looks like this
52

#RSAC
Or like this
53

#RSAC
From IT to OT. How they connected
Historian Process Integration (OT to OT/ OT to IT)
OSISoft PI, Aspen Info Plus 21, Honeywell PHD, Rolta Oneview
Enterprise Service Bus (IT to IT/ IT to OT)
SAP PI IBM Websphere ESB Microsoft BizTalk Oracle ESB
Other (IT to OT/ OT to IT)
SAP xMII
54

#RSAC
IT and OT, SAP example
55

#RSAC
SAP SAP xMII overview
Connects manufacturing with enterprise business processes, provides information to improve production performance On top of SAP Netweaver J2EE (with its vulnerabilities) Located on the corporate network Has some vulnerabilities
56

#RSAC
Attack Surface (SAP xMII Security):
Database links to xMII from systems such as LIMS SAP J2EE Platform vulnerabilities (core of xMII) SAP xMII vulnerabilities SAP RFC links from ERP to xMII Shared SSH keys Similar passwords Others
57

#RSAC
SAP Plant Connectivity
58

#RSAC
SAP PCo overview
Bridge between the industrial world and SAP Manufacturing modules .NET application for Windows Usual pipeline Source Processing  Destination Source:
OPC server (MatrikonOPC, KEPServerEX) or DCS
Destination:
SAP HANA, SAP XI, SAP xMII, LIMS, DB...
Agent: Windows service that does the polling
59

#RSAC
Hacking SAP Plant Connectivity
Connections with IT systems (MES, LIMS, PI, Custom) Domain credentials (if improperly secured) SAP xMII connections (password decryption) SAP PCo vulnerabilities SAP PCo extensions Similar passwords
60

#RSAC
SAP Pco/SAP xMII Attacks
Traffic modification: attacks based on the fact that the MII-PCo connection is not authenticated by default:
Fake Pco (Fraud)
Kill the actual PCo and show that everything is OK in MII MITM + selective modification Steal your oil, but tank level doesn't change
Protocol attack (Sabotage)
XML Protocol parsing on the PCo side
Vulnerabilities found (Kill agent + mem leak) (SAP Note 2238619)
61

#RSAC
Now they are inside your OT network and can do whatever they want. there is no Air Gap!
62

#RSAC
Post-exploitation: Access to DCS/OPC/SCADA
SAP Plant Connectivity interacts with DCS/OPC/PLC
On the same workstation
Required when configuring some DCS/SCADA systems
On the same network
Example: OPC vulnerabilities
KEPServerEX Resource exhaustion https://ics-cert.us-cert.gov/advisories/ICSA-15-055-02 KEPServerEX Input Validation https://ics-cert.us-cert.gov/advisories/ICSA-13-226-01 MatrikonOPC Gateway DoS https://ics-cert.us-cert.gov/advisories/ICSA-13-106-01 MatricanOPC DoS (0-day)
63

#RSAC
DEMO
64

#RSAC
Oil and Gas attack vectors
Oil market fraud attack:
Imagine what would happen if a cyber criminal uploads a malware that dynamically changes oil stock figures for all Oil and Gas companies where SAP is implemented. Attackers will be able to deliberately understate data about Oil in stocks.
Plant equipment sabotage attack
Hackers can spoof a report about equipment status in a remote facility. Companies will spend a lot of time and money to investigate the incident
Plant Destruction attack
With access to BMS systems, via SAP Pco and SAP xMII hackers can perform physical attacks.
65

#RSAC
How does one go about securing it?
66

#RSAC
Apply
Step 1 Next Month
Protect your ERPs and other business applications (Automatic: Scanning and Monitoring tools)
Step 2 Next Quarter
Review all connections (Semi-Automatic/Manual)
Step 3 This Year
Secure connections where possible (Manual)

#RSAC
How to apply ERP Security
Business security (SoD)
Prevents attacks or mistakes made by insiders
Code security
Prevents attacks or mistakes made by developers
Application platform security
Prevents unauthorized access both within corporate network and from remote attackers
68

#RSAC
About
a.polyakov@erpscan.com
228 Hamilton Avenue, Fl. 3, Palo Alto, CA. 94301 USA HQ www.erpscan.com info@erpscan.com
69

