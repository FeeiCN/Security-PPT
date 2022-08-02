INDUSTRIAL CONTROL SECURITY

MANAGEMENT AND OT SECURITY ANALYSIS

Aleksandar Andric

IoT Solutions Architect - Cisco

Contents

INTRODUCTION ICS TAILORED MALWARE COMMON OT SECURITY CHALLENGES ICS SECURITY SOLUTION USE CASES ICS SECURITY SOLUTION ARCHITECTURE CALL TO ACTION

INTRODUCTION

INTRODUCTION
Security is the main concern for industrial IoT adoption
"Security managers should analyse their current and planned security architectures to determine how well they are positioned to deal with the security issues of the current, and coming, Internet of Things."
SANS
"Security is clearly a top concern, with 84% of those implementing IoT already having experienced a security breach."
Aruba
"Security and risk concerns will continue to be the greatest impediment to IoT adoption."
Gartner
"Security Is Of Paramount Concern When Implementing Internet-Of Things Solutions."
Cisco

ICS TAILORED MALWARE

Stuxnet Crashoverride Havex TRITON/TRISIS

· Discovered in 2010
· Iran
· Targets SCADA systems
· Infects Microsoft Windows machines, and then seeks for Siemens Step 7 software
· Estimated to have ruined 20% of Iran's nuclear centrifuges

BlackEnergy

ICS TAILORED MALWARE

Stuxnet Crashoverride Havex TRITON/TRISIS

· Discovered in 2016
· Ukraine
· Attacks electrical grids
· Modular malware, establishes a backdoor, and targets particular industrial communication protocols
· The attack cut 20% of Kiev off power for one hour

BlackEnergy

ICS TAILORED MALWARE

Stuxnet Crashoverride Havex TRITON/TRISIS

· Discovered in 2013
· USA & Europe
· Targeting SCADA systems abusing OPC protocol
· Used for espionage campaign targeting energy, aviation, pharmaceutical, defence, and petrochemical sectors

BlackEnergy

ICS TAILORED MALWARE

Stuxnet Crashoverride Havex TRITON/TRISIS

· Discovered in 2017
· Middle East
· Safety Systems
· Targets Schneider Electric's Triconex safety instrumented system (SIS) enabling the replacement of logic in final control elements

BlackEnergy

ICS TAILORED MALWARE

Stuxnet Crashoverride Havex TRITON/TRISIS BlackEnergy

· Discovered in 2007
· Ukraine
· Attacks ICS/SCADA and energy companies
· The attack starts with spear-phishing, installs trojan and lunches DDoS
· The attack from 2015 left 50% of homes in the Ivano-Frankivsk region in Ukraine with no electricity for a few hours.

INTRODUCTION
$1.5+ Billion
The cost to a set of six industrial companies due to incidental infections in industrial spaces last year, as per their government mandated financial statement
Source: Government mandated financial statements across industrial companies

COMMON OT SECURITY CHALLENGES
· No asset inventory · Legacy systems · External vendors · Limited security skills

CYBER ATTACKS STATISTICS

27

66%
of breaches took months or even years to discover

60%
of breaches have data exfiltrated in
first 24 hours

60,000
Number of alerts hackers set off at Global Retailer

184
Median number of days advanced attackers present before detection

33%
Of organizations discover
breaches through their own monitoring

SECURITY IN OT IS DIFFERENT FROM IT

IT =

Security Control
Vulnerability management Concept of least privilege Authenticator Change Management Time Critical Content Availability Patching/Malware Traffic flows Logical Access Event logging Failover capability Physical Security

Information Technology
Active scanning Layered RBAC Complex password, 2FA, unique Regular Scheduled Generally delays accepted Generally delays accepted Regular Scheduled Ability to block in-line People ~= Devices Standardized corelation critical component has a redundant counterpart Secure (server rooms, etc.)

Operations Technology
Passive scanning Limited access segmentation Code, pin, key sequence, common Highly managed and complex Delays are unacceptable 24x365 (continuous) Rare, Unscheduled; Vendor specific No inhibitors for flow Few people; Many, many devices Proprietary protocols Parts replacement and repairs Remote / Unmanned Secure

ICS SECURITY SOLUTION USE CASES
Visibility Segmentation (zoning) Network traffic-based anomaly detection OT influenced remote user access

ICS SECURITY SOLUTION ARCHITECTURE

OT Insights
Information Presentation

Data Aggregation, Correlation and Analytics

Industrial Data Acquisition

D

D

D

A

A

A

T

T

T

Collectors A

A

A

Industrial Vertical Reference Architectures

Operational Technology (OT) Industrial/Automation Environments

Industrial DMZ

Security Threats / Events Process Events
S/W Patch Compliance Remote Access

ISE / ASA Users
DATA Other Apps
Information Technology (IT) Business Enterprise

OT INSIGHTS ­ OPTIMIZING INDUSTRIAL CONTROL ENVIRONMENT

Asset Visibility
· Real-time 360° view of devices
· Passive & active asset discovery
· Inventory all critical operational assets
· Rapid discovery of ICS configuration anomalies

Malware Detection
· Quickly detect anomalous communication patterns
· Leverage large industrial threat knowledge base
· Prioritize protections and respond proactively

Secure Remote Access
· Unify remote access solution access for all systems and networks, regardless of vendor
· Maintain complete, centralized control and visibility of remote access activities

Compliance
· Determine compliance of all assets, including endpoint status for antivirus software, installed programs, services running, and installed patches

CALL TO ACTION

Understand your challenges
· Evaluate your environment · Identify risks · Secure your assets
Learn more
https://www.cisco.com/c/en/us/solutions/ internet-of-things/iot-security.html
Connect
aandric@cisco.com www.linkedin.com/in/aleksandarandric

 

THANKS

