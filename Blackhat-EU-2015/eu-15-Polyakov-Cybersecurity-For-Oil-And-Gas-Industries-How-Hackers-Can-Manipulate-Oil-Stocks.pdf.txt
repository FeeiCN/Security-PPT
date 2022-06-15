Invest in security to secure investments
SAP Cybersecurity for Oil and Gas
Alexander Polyakov - CTO, ERPScan Mathieu Geli - Head of SAP Threat Intelligence, ERPScan

About ERPScan
· The only 360-degree SAP Security solution - ERPScan Security Monitoring Suite for SAP and Oracle
· Leader by the number of acknowledgements from SAP ( 150+ ) and Oracle (40+)
· 60+ presentations key security conferences worldwide · 30+ Awards and nominations · Research team ­ 20+ experts with experience in different areas
of security from ERP to ICS and Mobile · Headquarters in Palo Alto (US) and Amsterdam (EU)
2

ERPScan
· ERPScan and SAP
­ Researching since 2007 ­ 200+ vulnerabilities found ­ Applications covered: ERP, CRM, SRM, Business Objects, SAP GUI, HANA,
Mobile, NetWeaver J2EE,Portal, SDM
· ERPScan and Oracle
­ Researching since 2008 ­ 40+ vulnerabilities, 16 times acknowledged in Oracle CPU ­ Applications covered: Oracle DB, Oracle EBS, Oracle BI, Oracle PeopleSoft,
Oracle JDE
3

Attention!!! · This is NOT a traditional type of talk · For me neither · There are more questions than answers · There is the first technical Oil and Gas Cybersecurity talk · This is just a beginning
4

Oil and Gas 101
The oil and gas industry is usually divided into three major sectors
· Upstream - The upstream sector includes the searching for potential underground or underwater crude oil and natural gas fields, drilling of exploratory wells, and subsequently drilling and operating the wells that recover and bring the crude oil and/or raw natural gas to the surface. The upstream oil sector is also commonly known as the exploration and production (E&P) sector
· Midstream- The midstream sector involves the transportation (by pipeline, rail, barge, oil tanker or truck), storage, and wholesale marketing of crude or refined petroleum products. Pipelines and other transport systems can be used to move crude oil from production sites to refineries and deliver the various refined products to downstream distributors.
· Downstream -The downstream sector commonly refers to the refining of petroleum crude oil and the processing and purifying of raw natural gas, as well as the marketing and distribution of products derived from crude oil and natural gas. The downstream sector touches consumers through products such as gasoline or petrol, kerosene, jet fuel, diesel oil, heating oil, fuel oils, lubricants, waxes, asphalt, natural gas, and liquefied petroleum gas (LPG) as well as hundreds of petrochemicals.
5

Oil and Gas 101
6

Typical Upstream processes (Onshore)
7

Upstream 101 (Onshore)
· Extraction (Drilling)
­ Pump controllers, blowout preventers, Flaring and Venting
· Gathering (From earth to separators)
­ Wellhead management, Manifolds management, net oil measurement
· Separation (Separate oil, gas and water)
­ Multiple separators (2phase/3phase), Heaters, Burners, Coalescence, Desalting
· Gas compression (Prepare for storage and transport)
­ Multiple stages
· Temporary Oil Storage (Temporarily store before loading) · Waste disposal
­ Water disposal
· Metering (Calculate quantity before loading)
­ Fiscal Metering, Liquid Flow Metering, Gas Flow Metering Systems, Wet Gas Metering Systems, Provers & Master Meters
8

Midstream 101
9

Midstream: Most critical processes
· Terminal management (Obtain oil from upstream) ­ Measurement, Automation, Order Movement Management
· Gas Processing (Separate natural gas and NGL) · Gas Transportation (transfer gas to storage)
­ Pipeline management · Oil transportation (transfer oil to storage)
­ Pipeline management · Gas storage (temporary and long-term)
­ Peak-load Gas Storage, Gas storage, LNG Storage · Oil Storage (Long-term oil storage)
­ Tank inventory system, Tank Temperature management, Tank Gauging System, Product Movement
10

Downstream: Most critical processes
· Refining (Processing of Crude Oil)
­ Blend Optimization, Movement Automation System, Emission Monitoring System
· Oil Petrochemicals (Fabrication of base chemicals and plastics)
­ Too many processes to be listed
· Gas Distribution (deliver gas to utilities) · Oil Wholesale (deliver petrol to 3rd party)
­ Loading
· Oil Retail (deliver petrol to end users)
­ Truck loading Automation, Gas Pump Monitoring Systems, POS
11

What can happen?
Plant Sabotage/Shutdown Equipment damage Utilities Interruption
Production Disruption (Stop or pause production) Product Quality (bad oil and gas quality) Undetected Spills Illegal pipeline taping Compliance violation (Pollution) Safety violation (Death or injury)
12

Some critical processes in Oil and Gas: details
13

SEPARATION (GOSP)
· Gas Oil Separation Plant · Risks:
­ Product Quality, Equipment damage
· Management systems
­ ABB Totalflow XFC
­ Yokogawa CENTUM CS 3000
· Burner Management Systems (BMS) · Compressor Control System (CCS) · Vibration Monitoring System (VMS)
14

SEPARATION: Burner Management System (BMS)
· Risks:
­ Product Quality, Equipment damage ­ Plant Sabotage, Production Disruption, Compliance violation
· Used in a variety of applications:
­ Separators, tanks, heaters, Incinerators, Flare stacks, etc.
· Management systems:
­ Emerson's DeltaV SIS, Invensys BMS, Honeywell's BMS, Combustex BMS2000, Allen-Bradley, Siemens SIMATIC BMS400F
· PLC vendors:
­ GE, Modicon, Allen-Bradley, Koyo, Siemens
· Flame sensors:
­ Fireye, PPC, Honeywell, IRIS, Coen
15

METERING
· Risks:
­ Product Quality, Monetary loss
· Analyzes density, viscosity of water content, temperature, and pressure
· Divided into several runs · Each run employs one meter and several instruments for
temperature and pressure correction · Gas metering is less accurate (+-1%) · LNG metered within mass flow meters
16

METERING: Fiscal Metering (Custody transfer)
How Custody Transfer Works · Custody transfer, sometimes called fiscal metering, occurs when fluids or gases
are exchanged between parties. · Payment is usually made as a function of the amount of fluid or gas transferred. · Accuracy is paramount as even a small error in measurement can add up fast,
leading to financial exposure in custody transfer transactions. · For example, Pump Station 2 on the Alaska Pipeline is designed to pump 60,000
gallons of oil per minute. A small error of 0.1% equates to about $100,000 a day. Over a year, the 0.1% error would amount to a difference of $50m. · The error could either be on the high side, benefiting the seller; or on the low side, to the buyer's benefit. · The engine of a custody transfer or fiscal metering installation is the flow computer. · It is the device that takes the inputs from the measuring devices (flowmeters, pressure sensors, temperature sensors, density sensors, gas chromatographs, and others) and calculates the amount of liquid or gas that has been transferred.
Error levels that would be tolerable in a process plant context can cost one side or the other tens of thousands of dollars in a matter of hours.
17

Fiscal Metering (examples)
· Production Accounting System · Data Aggregation and management (easy to manipulate)
­ FlawCall ­ FlawCall Enterprise (! Internet access) ­ KROHNE SynEnergy (! Internet access + SAP access)
­ Honeywell's Experion® Process Knowledge System (PKS), MeterSuiteTM
­ OPC Servers (Keepware, MatrikonOPC) (SAP access) ­ Schneider Electric InFusion ­ Schneider Electric SCADAPack
· Flow computing: (hard to manipulate)
­ KROHNE Summit 8800 ­ ABB TolatFlow ­ Emerson FloBoss S600 (previously known as Daniel DanPac S600) ­ Emerson ROC800 ­ Schneider Electric Realflo
· Flow Meters
­ KROHNE, Vortex, etc.
18

OIL STORAGE
· Risks ­ Plant Sabotage/Shutdown, Equipment damage, Production Disruption, Compliance violation, Safety violation
· Tank Inventory System collects data from special tank gauging systems such as level radars, pressure or float that are used to measure the level in storage tanks
· Can usually consist of 10-100+ tanks with 1-50m barrels · Accurate records of volumes and history are kept · Forecasting for stock control
19

OIL STORAGE: Tank Inventory Systems
· Monitoring the levels in offsite storage tanks of flammable materials in particular can significantly reduce the likelihood of initiating events that could have a potential impact not only on operation but also on safety and the environment.
· Tank level deviations can result in hazardous events such as a tank overfilling, liquefied gas flashing etc.
· The high severity of consequences for safety and the environment are exacerbated by the large inventories of hazardous materials involved.
· As more operations are pressed to make improvements in their tank farm and terminal operations management systems, the following offers an overview of best practices for complying with the HSE Recommendations while reducing costs and driving more value from the operation.
20

OIL STORAGE: Tank Inventory Systems (Details)
· Connection with IT
­ Enfaf TM BOX ­ Honeywell's Experion® Process Knowledge System (PKS) (For Terminals)
· Tank Inventory Systems (single-window interface to operate Tank Gauging Systems)
­ Emerson Rosemount TankMaster WinOpi ­ Schneider-electric SimSciTM ­ Honeywell Enraf Entis Pro ­ MHT's ­ VTW
· Tank Gauging Systems
­ Emerson TankMaster Server ­ Honeywell Enraf BPM ­ Saab, Varec, GSI, MTS, L&J........
· Meter Management
­ ControlLogic PLC ­ SmartView
· Meters/Gauges
­ SmartRadar FlexLine ­ ABB ­ Honeywell VIT
­ Enraf 854 ATG Servo Advanced Tank Level Gauge
21

Tank Inventory Systems (Honeywell Enraf)
22

Tank Inventory Systems (Emerson TankMaster)
23

Tank Inventory Systems (Emerson TankMaster)
· Management console Emerson Rosemount TankMaster WinOpi · View and control! · Control commands
­ Changing any alarm (Level, Temperature, Pressure) ­ For tanks configured as servo tanks, it is possible to send commands to a
servo gauge, such as an Enraf
· Freeze, Lock
24

REFINERY
· Risks ­ Plant Sabotage/Shutdown, Equipment damage, Product Quality, Production Disruption, Compliance violation, Safety violation
· The job of the refinery is to sort and improve the hydrocarbons within the crude. · Gasoline, propane, jet fuel, heating oil, and petrochemicals are just some of the
specially formulated products leaving the refinery. · Technicians in a central control room can fine-tune refinery operations to
produce the desired mix of products. · An oil refinery or petroleum refinery is an industrial process plant where crude
oil is processed and refined into more useful products such as petroleum naphtha, gasoline, diesel fuel, asphalt base, heating oil, kerosene, and liquefied petroleum gas. · Oil refineries are typically large, sprawling industrial complexes with extensive piping running throughout, carrying streams of fluids between large chemical processing units. · In many ways, oil refineries use much of the technology of, and can be thought of, as types of chemical plants.
25

REFINERY (examples)
· Corp net connection
­ Emerson DeltaV, OSISoft PI
· Management
­ Siemens Simatic SCADA (Lots of vulnerabilities) ­ Experion PKS SCADA ­ Modcon SCADA ­ Ignition SCADA ­ Schneider-electric SimSciTM
· Devices
­ Siemens ­ MODCON MOD-800 ­ + hundreds of specific devices for each Refinery state
26

How can attacker get to know what victim uses?
· Press releases · Vendor success stories · LinkedIn · StackOwerflow · TechTarget · etc.
27

Enterprise Applications in Oil and Gas
28

Enterprise usage: Business Applications
SAP (ABAP, J2EE Mobile, HANA, BusinessObjects) · More than 246000 customers worldwide · 86% of Forbes 500 · 85% of Fortune 2000 Oil and Gas Oracle (EBS, Peoplesoft, JDE, Siebel) · 100% of Fortune 100
29

What can happen
· Espionage
­ Theft of Financial Information ­ Trade Secret theft ­ Supplier and Customer lists theft ­ HR data theft ­ Other Corporate Data theft
· Sabotage
­ Denial of service ­ Modification of financial statements ­ Access to technology network
· Fraud
­ Modification of master data ­ Human Errors
30

SAP in Oil and Gas
According to SAP: Today, upstream operations bring together many technical disciplines and business functions that are loosely connected. The challenge is to support a closed-loop view, leveraging a common platform for operations and maintenance, to enable you to gather, analyze, decide, and execute across the many elements that drive performance of assets at different lifecycle stages.
31

SAP in Oil and Gas
32

SAP in Oil and Gas
33

SAP In Oil and Gas: Capital and Spend Effectiveness
Advantages: · Improving supplier relations · Reducing the cost of processing supplier invoices · Enhancing visibility and transparency
Risks: · Availability ­ direct impact on cost effectiveness · Fraud ­ price/quantity manipulation
Applications: · SAP PPM
34

SAP In Oil and Gas: Hydrocarbon Supply Chain
Advantages:
· Hydrocarbon production management · Hydrocarbon revenue management · Field logistics
Risks:
· Supply chain Availability ­ direct impact on cost effectiveness · Fraud in SAP ­ Manipulations with quantities* · Sabotage - Physical damage
Applications:
· SAP ECC IS-OIL
*Hydrocarbon volumes, which are the basis for pricing, excise duty, and transportation fees, fluctuate depending on environmental temperature and pressure conditions; as we require masses and weights for product valuation, and weighing is not possible, we must derive them from volumes at ambient temperature and pressure conditions, requiring complex conversion calculations of the observed volumes at each custody transfer point. Different units of measurement are in use globally, further complicating the issue, as even modern terminal automation systems do not support all units of measure. ­ Forrester Research
35

SAP In Oil and Gas: Integrated Digital Oilfield
Operations
Advantages:
· Integrate production, maintenance, and engineering operations · Streamline data collection, validation, surveillance, and notification · Close the gap between decision making and execution in the field
· Risks:
· Sabotage - Physical damage to production and engineering devices · Operations Availability ­ direct impact on cost effectiveness · Data manipulation in SAP ­ improper management decisions, lost profits
Applications:
· SAP ECC IS-OIL · SAP PRA (production and revenue accounting) · SAP RLM (Remote logistic management)
36

SAP IS-OIL Tank Master Data
· Tanks are maintained in the system as storage objects that reflect storage location stocks.
· One or more tanks can be defined at storage location level. · A prerequisite for that is that the storage location is defined in Industry
Solution Oil & Gas (Downstream) customizing as a tank storage location. · You can make that setting by choosing HPM ® Silo/Tank Management ®
Master Data ® · Define storage location as storage location for silo/tank management. · The characteristics of the tanks are defined as storage object characteristics. · The following data is stored in the tank master data
­ Capacity of a tank (maximum capacity) ­ Allowable impurity quantity ­ Allowed mass ­ Throughput quantities
37

SAP In Oil and Gas: Operational Integrity
Advantages:
· Monitor key risk indicators and access control policy · Maintain the structural and mechanical integrity of your physical assets · Manage emissions, hazardous substances, and product and regulatory
compliances
Risks:
· Access control for data manipulation · Sabotage - Physical damage to production and engineering devices · Compliance Violation ­ Manipulation of data to give an illusion of meeting
Compliance requirements Applications: · SAP EAS/PM (Asset Management)
38

Operational Integrity
· Asset Optimization ­ reduces production disruptions by enabling predictive maintenance
· Records maintenance history and identifies potential problems · Condition monitoring is used for large rotating apparatus
(turbines, compressors, pumps) · Work order procedure is automatically initiated in the CCMS · SAP Solution ­ SAP EAM
39

Oracle in Oil and Gas
http://www.oracle.com/ocom/groups/public/@ocom/documents/webcontent/oil-gas.html
40

Oracle in Oil and Gas I think there is no need for details.
41

Enterprise applications VS Oil And Gas processes
· Enterprise project portfolio management <- Exploration
­ SAP PPM, Oracle Primavera, MS Project, MS SharePoint
· Asset Lifecycle Management <- Refinery, Separation
­ SAP EAM (+AssetWise APM), Oracle EAM, Avantis, IBM Maximo ­ Connect with: OSIsoft® PI System, AspenTech® IP21, Honeywell® PHD
· LIMS <- Refinery
­ Custom app based on Oracle DBMS
· Tank Master Data (TMD) <- Tank Inventory
­ SAP IS-OIL-TAS, Aspentech
· Production Accounting System (PAS) <- Fiscal Metering
­ SAP IS-OIL-PRA
· Advanced Metering Infrastructure (AMI) <- Fiscal Metering
­ SAP AMI
42

IT/OT connection looks like this
43

Or like this

Customers

Suppliers

Branches

Partners

Insurance

Banks

SAP

SAP

AS

Router

CRM SRM Portal XI/PI BW BI HR Billing
SAP Solution Manager

SAP EAM

PI/XI
(SAP PI)

PLC

SAP ECC
(IS-OIL)

DC
(Windows Domain Controller)

SAP PCo
SAP IS-OIL PRA

SAP xMII
Corporate Network

OPC
DCS
44
PLC Field Devices

44

Attacking Oil and Gas
45

From the Internet to CORP
46

Stage 1 (Internet to Corp.)
· Via Internet resources (SAP Portal/CRM/SRM)
­ http://erpscan.com/wp-content/uploads/2013/07/SAP-Portal-Hacking-andForensics-at-Confidence-2013.pdf
· Via Partners (SAP XI)
­ http://erpscan.com/wp-content/uploads/publications/SSRF-vs-Businnesscritical-applications-final-edit.pdf
· Via SAP Router
­ http://erpscan.com/advisories/dsecrg-13-013-saprouter-heap-overflow/
· Via Workstations (Trojans)
­ http://erpscan.com/wp-content/uploads/publications/SAP-SecurityAttacking-SAP-clients.pdf
· Via Unnecessary SAP Services in the Internet
­ http://erpscan.com/wp-content/uploads/publications/SAP-SecurityAttacking-SAP-clients.pdf
47

From Corp to ERP
48

Stage 2 (From Internal Network to ERP) Numerous ways how an ERP system can be compromised: · Vulnerabilities · Misconfigurations · Unnecessary privileges · Custom code issues
49

Stage 2 (Vulnerabilities in SAP Products)

By October 2015 ­ 3500+ SAP Security Notes

0 0 0

833 731

0 0

641

10 2001

10 2002

103 2003

100 2004

100 2005

207 2006

104 2007

0 77
2008

0 130
2009

2010

2011

2012

363 2013

389 2014

Only one vulnerability would suffice to jeopardize ALL business-critical data
50

Stage 2 (Vulnerabilities in Oracle products)

Oracle vulnerabilities per year
600
2500+ Vulnerabilities in total
500

400

300

200

100

0 2007

2008

2009

2010

2011

2012

2013

2014

51

Stage 2 (Misconfigurations in SAP)
· ~1500 profile parameters · ~1200 Web applications · ~700 web services · ~100 specific commands for MMC · ~100 specific checks for each of the 50 modules (FI, HR, Portal,
MM, CRM, SRM, PLM, Industry solution.......)
All these configurations can be improperly implemented thus allowing cybercriminals to obtain access to mission-critical systems.
http://erpscan.com/wp-content/uploads/publications/EASSECPVAG-ABAP.pdf
52

Stage 2 (Custom code issues) Domain specific languages in business applications (ABAP, PeopleCode, XSJS, X++) can have vulnerabilities as well as backdoors left by 3rd party organizations:
http://erpscan.com/wp-content/uploads/publications/3000-SAP-notes-Analysis-by-ERPScan.pdf
53

Stage 2 (Unnecessary privileges)
Critical privileges and SoD issues · For example: Create vendor + Approve payment order · Usually ((~100 Roles X 10 actions)^2)/2=500k · 500k potential conflicts for each user! · A lot of work to do · Usually, it takes two years to decrease the number of conflicts
from millions to hundreds. · And you still will be vulnerable
54

From ERP to OT
55

Stage 3 (From SAP to Plant)
56

Stage 3 (From SAP to Plant )
· SAP ERP -> SAP XMII -> SAP PCo -> DCS/SCADA -> PLC -> Meter · SAP ERP -> SAP XMII -> SAP PCo -> PLC -> Meter · SAP ERP -> SAP XMII -> DCS/SCADA(OPC) ->PLC-> Meter · SAP ERP -> SAP PCo -> OPC Server -> PLC -> Meter · SAP ERP -> SAP PCo -> PLC -> Meter · SAP ERP(PP) -> SAP PI -> OPC-> PLC -> Meter · SAP ERP(PP) -> SAP PI -> SAP xMII->OPC -> PLC -> Meter · SAP PM (EAM) -> OsiSoft PI -> OPC · SAP HANA(Rolta OneView) -> OPC/DCS ->PLC->Meter · Oracle DB (LIMS) -> DCS -> PLC-> Meter · Domain Controller -> SAP PCo -> PLC -> Meter · Shared SSH keys · Similar passwords · Improper firewall configuration
57

Stage 3 (From SAP to Plant ) Finally, we need to find a way to hack · SAP HANA · SAP xMII · SAP PCo
58

Stage 3 (Hacking SAP HANA) · SAP HANA can store the most critical data form Plant for
analytics · It is a database used by many SAP and non-SAP applications · Some of them store critical data for analytics
59

Stage 3 (Hacking SAP HANA) SAP HANA can store the most critical data form Plant for analytics · Connections with other systems (ERP, LIMS, Custom) · SAP RFC connections · SAP HANA Vulnerabilities
60

Stage 3 (Hacking SAP HANA)
· [ERPSCAN-15-024] SAP HANA hdbindexserver ­ Memory corruption
· An anonymous attacker can use a special HTTP request to corrupt SAP HANA index server memory.
· An attacker can use vulnerability to execute commands remotely without authorization, under the privileges of the service that executes them.
· CVSS: 9.3 · http://erpscan.com/advisories/erpscan-15-024-sap-hana-
hdbindexserver-memory-corruption/ · http://www.fierceitsecurity.com/story/security-holes-rise-sap-
hana-big-data-platform-warns-erpscan/2015-10-15
61

Stage 3 (Hacking SAP xMII)
Some systems should be connected at least on the network layer · SAP RFC links from ERP to xMII · NetWeaver J2EE Platform vulnerabilities (core of xMII) · Direct SAP XMII vulnerabilities · Database links to xMII · Shared SSH keys · Similar passwords · Others
62

Stage 3 (SAP XMII overview)
· MII: Manufacturing Integration and Intelligence · Connects manufacturing with enterprise business processes,
providing information to improve production performance · On top of SAP Netweaver J2EE (with its vulnerabilities) · xAPPs technology exposes web services and data from multiple
systems · Located on the corporate network · xapps~mii~ears is the main application with several
endpoints accessible at http://server:50000/XMII · Has some vulnerabilities (Blind SQLi/XXE) [can't disclose details]
63

Stage 3 (Getting OS access to xMII)
· We have Admin access, but how to execute OS commands? · In «Log viewer» we chose «Connect to Remote System»

Stage 3 (Getting OS access to xMII)
We enter the IP of a machine controlled by us It will connect back to my laptop with something...

Stage 3 (Getting OS access to xMII)
Request contains Basic Authentication header We decode it as user « {221....} » and password x***********x The password is random and lives max. the JVM lifetime

Stage 3 (Getting OS access to xMII)
· Welcome to built-in SAPControl accounts, this one is used in the context of TrustedInternalConnections
· Usually, the SOAP endpoint on tcp 50013/1128 is used with OS credentials, but there are exceptions ;-)
· SAPControl SOAP function OSExecute() remotely is granted with that special user
· miiadm OS execution rights, abuse ? · dump sensitive files like SecStore.*  get
Sybase sa account · Dump backdoor, get remote shell · Real pentest of PCO begins

Hacking SAP Plan connectivity
SAP Plant connect usually stays between SAP xMII and Critical device · Connections with other systems (MES, LIMS, Custom) · SAP xMII connections (password decryption) · SAP PCo vulnerabilities · Domain credentials (If improperly secured) · Database links · Shared SSH keys · Similar passwords
68

SAP PCo overview
· SAP Plant Connectivity · Bridge between the industrial world and SAP Manufacturing
modules · Windows box, .NET application · Usual pipeline Source Processing  Destination · Source: OPC server (MatrikonOPC, Siemens Simatic,
KEPServerEX) or DCS (???) · Destination: SAP HANA, SAP XI, SAP xMII, LIMS, DB... · Agent: Windows service that does the polling
69

70

Hacking SAP PCo
· We have Admin access to xMII · Table SAPSR3DB.XMII_SERVERPROP contains the
user/pass of PCo when in the «Query Process» mode · Password is 3DES encrypted. Where is the key? · SECURE_STORE_KEY is a handle for our application to the
Java SecureStorage · Inside the SecureStorage is our crypto Key
71

Hacking SAP PCo
· Idea: Decrypt the password with a JAVA PoC using the existing logic (jars)
· Problem : · SecureStorage is inside server JVM instance · Not exposed to the outside · Connect through ICMAN service (gateway to the Netweaver
JVMs) · Protocol P4 remotely accessible on TCP/50004 · Finally, we can get a context and ctx.list() the services,
see SecureStorage · When ctx.lookup(), the handle on the SecureStorage is
always NULL: why?
72

Hacking SAP PCo
From SAP support forum · «Secure storage is protected by call stack validations. It can only
be called from permitted connections, such as Jco.» No JCo connections on the system. Seems like a dead end :-( Wait...
73

Hacking SAP PCo (lower encryption)

Hacking SAP PCo (encryption now Base64)

Stage 3 (Hacking PCo)
· TCP/50050 : SOAP remote administration interface is offered by pcohostsvc.exe (Windows service manually started) · Start/Stop instance, dump configuration
· TCP/9000 : by default without authentication · «Active Queries» to the PCo instance via xMII protocol (XML)
· TCP/445: For Domain Access · Full access to PCo. Just use our login/pass from xMII

Stage 3 (SAP PCo ­ post-exploitation)
· Traffic modification: attacks based on the fact that the MII-PCo connection is not authenticated by default: · Fake PCo · Kill the actual PCo and show that everything is OK in MII · MITM + selective modification · Steal your oil, but tank level doesn't change · Protocol attack · MII = requests over XML · Protocol parsing on the PCo side
CDATA forwarded to the sources (OPC UA/DA) Exploitation of the source via this channel?
77

Now we are inside your OT network and can do whatever we want, there is no Air Gap!
78

Stage 4 (Access to DCS/OPC/SCADA)
SAP Plant connect interacts with DCS/OPC · On the same workstation
­ Required when configuring some DCS/SCADA systems
· On the same network
­ OPC vulnerabilities
· KEPServerEX Resource exhaustion https://ics-cert.us-cert.gov/advisories/ICSA-15-05502
· KEPServerEX Input Validation https://ics-cert.us-cert.gov/advisories/ICSA-13-226-01 · MatrikonOPC Gateway DoS https://ics-cert.us-cert.gov/advisories/ICSA-13-106-01 · MatricanOPC DoS (0-day)
79

Stage 6 (Access to PLCs) DCS/SCADA can control PLC · Attack PLC using access to DCS/SCADA · Attack PLC via PLC vulnerabilities
­ ABB AC500
· ICSA-12-320-01 : ABB AC500 PLC Webserver CoDeSys Vulnerability
80

DEMO
81

How does one go about securing it?
82

ERP Security · Protect your ERPs and other business applications · Review all connections · Secure connections where possible · And please, don't include critical systems to domain
83

ERP Security
Business security (SoD)
Prevents attacks or mistakes made by insiders
Code security
Prevents attacks or mistakes made by developers
Application platform security
Prevents unauthorized access both within corporate network and from remote attackers
84

What about Oil stocks?
Every attack on a system have a significant impact
85

Typical Oil and Gas company
86

WTF it was? · Researchers - now you know where to start from, Oil and Gas
security is a small universe. · Pentersters - now you know how to break into the most critical
network and impress decision makers. · CISOs - now you know that there is no Air Gap between IT and OT
and what you need to check.
87

About
a.polyakov@erpscan.com @sh2kerr
m.geli@erpscan.com

228 Hamilton Avenue, Fl. 3, Palo Alto, CA. 94301

Luna ArenA 238 Herikerbergweg, 1101 CM Amsterdam

USA HQ

EU HQ

www.erpscan.com info@erpscan.com

88

