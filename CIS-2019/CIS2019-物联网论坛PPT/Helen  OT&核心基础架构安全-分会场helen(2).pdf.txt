OT&
 Fortinet 

OT

ICS 
§ 2018ICS-CERT114 § ICS 
» 2010 - Stuxnet » 2013 - Havex » 2015 - BlackEnergy2 » 2016 - Crash Override / Industroyer » 2017 / 2018 - Triton
§ :
»  » / Bugs »  » 

 ­ 

2010
· Stuxnet 

·  

· 
·  

· Trisis / Triton  

2013

2014

· 

2015

2017

2018

2019

·  
·  

·    10
·    2.5

·   

Shodan
· IoT
· 
·  · 
, ,   · , , 

Autosploit
· Shodan · Metasploits · 



ICS ­ 
-  


1-  ( IT )

&  

2- ICS 

 
 ICS 

2016 ­ Analysis Report (SANS and E-ISAC)

ITOT

 Microsoft Office BlackEnergy 3 VPN &   & 
 SCADA 

 UPS  KillDisk 
Power Outage



March 2015 December 23rd, 2015

Fortinet's  2019 Fortinet Security Fabric
Purdue Model, ISA-99, IEC-62443, 

ITOT
IT

SECURITY





,   3-5  /  


 Availability requirement Real-timereq uirement
Componentlifetime Applicatio n of patches Security testin/g /audit
Security awareness

OT


SAFETY





 
20 /
 

Purdue

·  ·  ·  · ISA-99 / IEC62443

Zone
Level 5: 
Level 4: 

SCADA
HISTORIAN

 Zone
Level 3.5 OT  Level 3: 
Cell/Area Zone
Level 2: 
Level 1: 

- SIS Level 0: Process

HMI
HMI/SCADA MASTER PLC/RTU/IED

/

Purdue ModelIT

   , ,   

Enterprise Zone

5 Corporate 4 IT

DMZ

Boundary

Operations and Control

3 Site

Control Area Zone(s)

2 Area 1 Basic Layers 0 Physical

FortinetPurdue

Level External Internet

Level 5 Internet DMZ Enterprise 
Level 4 External Enterprise LAN 

FortiGate FortiGate

Level 3.5 DC DMZ 
Level 3  DC 
FortiGate FortiLink FortiSwitch Private VLANs 
Wide Area Network MPLS, SD-WAN, 3G, 4G, APN, VPN ADSL, Cable

FortiSwtich FortiSwtich FortiGate

Remote User

Remote Vendor

Web Servers
Business Servers

Email Servers

FortiWeb

FSSO

Authentication Services &
Domain Controllers

Enterprise Desktops

FortiGuard Global
Intelligence

FortiGuard Threat Intelligence Service

FortiMail

FortiSIEM

FortiSandbox

FortiManager

FortiAnalyzer

FortiClient EMS Server

FortiAuthenticator

Historian Server Zone

Application Server Zone

Engineering Server Zone

Engineering WorkStation Zone

Operator WorkStation Zone

FSSO
Domain Controller
   





--------------------------------

ü BACnet

ü LONTalk

ü DNP3

ü MMS

ü Elcom

ü Modbus

ü EtherCAT

ü OPC

ü EtherNet/IP

ü Profinet

ü HART

ü S7

ü IEC 60870-6 ü SafetyNET

ü Synchrophasor (TASE 2) /ICCP

ü IEC 60870-5-104

ü IEC 61850



-----------------------------------------------------

ü 7 Technologies/

ü GE

ü RealFlex

Schneider Electric ü Iconics

ü Rockwell

ü ABB

ü InduSoft

Automation

ü Advantech

ü IntelliCom

ü RSLogix

ü Broadwin

ü Measuresoft ü Siemens

ü CitectSCADA

ü Microsys

ü Sunway

ü CoDeSys

ü MOXA

ü TeeChart

ü Cogent

ü PcVue

ü VxWorks

ü DATAC

ü Progea

ü WellinTech

ü Eaton

ü QNX

ü Yokogawa

(DPI)  Modbus, IEC 60870-6 (ICCP) and IEC.60870-5.104
FortiAnalyzerFortiSIEMSyslog

DEMO
· PCPLC · FortiGate 

HMI

FortiGate

Attacker PC Defend

Impact

switch

Attack

PLC



 · (WAN): ·  · ERP, Email · Active Directory · Call Control (Hosted, on-prem, or Hybrid) · 

Web Apps

External DMZ/Firewall

/: · ,  ·  ·  Plant Cyber Security (Perimeter): · Inter-Zone  · ACLs, IPS, ISD · VPN 
HMI's /  / : ·  · : DNS/AD/DHCP/AAA ·  Mobility Services · ,  Plant Cyber Security () ·  · VLAN  · 
: ·  · , DIN ·  ·  · ,  ·  ·  ·  · , () ·  ·  ·  · 

Firewall (Active)

Gbps Link for Fallover Detection

Firewall (Standby)

Identity Services



Radius



(AAA)

RAS 

Drive Controller HMI Distributed I/O
Cell/Area #1 ()

SDN-Ready Architecture

Access Switches
Industrial Firewalls

Wireless Network

Fiber Patch Fiber Patch

HMI HMI

Controller

Controller

Drive

Cell/Area #2 ()

Drive Distributed I/O
Cell/Area #3 ()

Enterprise Zone Levels 4-5
Industrial Demilitarized Zone (IDMZ)
Site Operations Level 3
POE
Industrial Zone Levels 0-2

Enterprise Analytics (Private / Cloud / Hybrid)
Plant Analytics (Private / Cloud / Hybrid)
Edge Analytics (IoT Edge Devices)



 Fortinet 18502120812

