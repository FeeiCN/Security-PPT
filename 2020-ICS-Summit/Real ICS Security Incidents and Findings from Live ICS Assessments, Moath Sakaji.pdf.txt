Bad and Evil: Real ICS Security Incidents and Findings from Live ICS Assessments
SANS ICS Asia Pacific Summit 2020
Moath Sakaji

Presentation Flow
§ whoami § Timeline § The Triton Case
§ Recent Observations
§ Questions?
©2020 FireEye | Private & Confidential

whoami

@MoathSakaji

Moath Sakaji

©2020 FireEye | Private & Confidential

§ Moath Sakaji
­ MEA Lead Consultant @Mandiant @FireEye

Timeline

Recent History of ICS Security

Stuxnet

Era of Vulnerability
Discovery

Era of Weaponization: Initial ICS malware discoveries
BlackEnergy2 Havex

Full realization of attacker capabilities
Industroyer

Triton

2010

2011-2013

©2020 FireEye | Private & Confidential

2014

2015-present

The Triton Case

The Triton Case
§ Mandiant responded to an incident at a critical infrastructure organization § Why it mattered?
©2020 FireEye | Private & Confidential

The Triton Case
©2020 FireEye | Private & Confidential

The Triton Case
IT
The compromise of IT and IT DMZ provided the attacker with remote access, credentials, and recon data needed for their objective
The attacker compromised DCS systems
DCS
©2020 FireEye | Private & Confidential

OT DMZ
The compromise OT DMZ was required to act as a pivot point towards the
DCS and SIS segments
TRITON was ultimately used to interact with and impact
Triconex SIS
SIS

Recent Observations

Findings Still Exist
Vulnerable infrastructure by nature
Patterns in findings Similarities across multiple clients/ industries
©2020 FireEye | Private & Confidential

Organized Financial Crime Actors Have Demonstrated an Ability to Disrupt OT Assets
· A trend of financial crime groups interested in OT
· We analyzed the increased trend · We will look at two sample
process kill lists
©2020 FireEye | Private & Confidential

Kill List 1- kill.bat
· Associated with at least 6 ransomware families
· GE Proficy processes
· Possible loss of historical data
©2020 FireEye | Private & Confidential

Kill List 2- Clop

Associated with CLOP malware

Loss of view/control over the physical processes
©2020 FireEye | Private & Confidential

Vendor Siemens Beckhoff
National Instruments
Kepware OPC Unified Architecture (OPCUA)

Product SIMATIC WinCC TwinCAT Data Acquisition Software (DAQ) KEPServer EX
N/A

Findings Analysis
33% of findings rated high and critical
©2020 FireEye | Private & Confidential

Critical and High Findings Analysis
©2020 FireEye | Private & Confidential

Critical and High Findings Analysis
68% of critical and high findings are due to one of these three
©2020 FireEye | Private & Confidential

Vulnerabilities, Patches, and Updates
©2020 FireEye | Private & Confidential

Identity and Access Management

©2020 FireEye | Private & Confidential

DMZ

IT OT

Network Segmentation and Segregation

Corp Switch

Remote Access Server

IT/ICS FW

DMZ Switch

ICS Switch

remote access

©2020 FireEye | Private & Confidential

VLAN1 VLAN2

Insecure Services Enabled/ Used
©2020 FireEye | Private & Confidential

The End

