#RSAC

SESSION ID: SAT-M03
Hacking and Protecting Distributed Energy Infrastructure

Gib Sorebo
Security Associate Director Accenture @gibsorebo

Aaron Bayles
Senior Manager - OT Security Accenture @alxrogan

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
$200 billion Internet of Energy Market by 2024*
*
3

Small Scale Renewable Energy

#RSAC

Co-generation
Smart energy system control

Renewable energy resources
Distributed energy resources

Centralized fuel production, power and storage
H2 vehicle

Surplus heat
4

Security
FIRST-OF-A-KIND U.S. GRID CYBERATTACK HIT WIND, SOLAR
Blake Sobczak, E&E News reporter Published: Thursday, October 31, 2019

#RSAC
CYBER ATTACKS

5

A Whole New World...
Residential Customer-owned, internet-connected

#RSAC
Bulk power source Sub transmission Distribution substation Primary feeder Distribution Transformer
Secondaries
Consumers' services
Utility-owned, private network connected 6

Requires A Different Architecture

Internet OR

Renewables aggregator / inverter manufacturer

Distributed energy resources

Dedicated utility network

Utility
Key Utility stakeholders/buyers: · Distribution Engineering/Operations · CISO/SOC Director · Field Support teams

DERMS ­ Distributed Energy Resource Management System OT ­ Operations Technology

ADMS ­ Advanced Distribution Management System

IoT ­ Internet of Things

#RSAC

DERMS/ADMS application

Possible Monitoring tools

Typically, not part of OT/IoT architecture today

Security

Distribution

Operations control

Center (SOC) Center

7

What Needs to be Secured
Securing systems/platforms (e.g., DERMS, ADMS) much like we would any other system
Securing connections from generation resources, both utility and third-party owned, to centralized systems/platforms
Validating the integrity of the data coming from third-party owned generation sources, aggregators, and inverter vendors
Detecting anomalous and potentially malicious activities occurring on thirdparty generation sources and anticipating potential downstream effects

#RSAC
Typical utility practice
Typical utility practice
Not a typical utility practice
Not a typical utility practice
8

#RSAC
Do the words SolarWinds ring a bell?
...800,000 [of vendor's] microinverters in Hawaii, each networked to the company's cloud-based monitoring and control systems....[The vendor] is unveiling the latest use of this installed capability: reprogramming its Hawaiian microinverter fleet en masse, to help [the utility] ride through solarinfluenced disruptions on the edges of its power network."
- Greentech Media, February 2, 2015
9

#RSAC
California and Hawaii already feeling impacts of distributed energy resource deployments
10

#RSAC
Exploit Scenarios

#RSAC
Grid Tie with Complete Off-Grid Solution Testbed
12

#RSAC
Exploit Scenario: Entice rooftop solar owner to download and install firmware "update"
13

#RSAC
A Simple Example
14

#RSAC
Here's What the Script Can Change

Power Factor

When to shut off power to the grid

Charging time for EV

Trip offline (no power from solar)

15

#RSAC
What Could Happen If This Attack Scaled
100,000 DDoS
16

#RSAC
Electric Vehicle Charging Manipulation
DERMS or SCADA
Attacker gains access to utility supervisory control and data acquisition (SCADA) system to monitor the peak load or changes the Distributed Energy Resource Management System (DERMS) control settings so that when the system load is above a certain limit, it sends a command to all vehicles to charge at the same time.
17

How to Detect

#RSAC
Scenario 1
A single solar station receives traffic from an unknown address, and soon after stops reporting generation data.
An alert is created noting the correlation between physical disconnect and unknown traffic.
Some time later, when more devices receive traffic from similar addresses and go offline, the managed security center issues a high warning for a crypto locker outbreak, altering utilities, manufacturers, and customers to the new threat.
18

How to Detect

#RSAC
Scenario 1
A single solar station receives traffic from an unknown address, and soon after stops reporting generation data.
An alert is created noting the correlation between physical disconnect and unknown traffic.
Some time later, when more devices receive traffic from similar addresses and go offline, the managed security center issues a high warning for a crypto locker outbreak, altering utilities, manufacturers, and customers to the new threat.
19

How to Detect

#RSAC
Scenario 1
A single solar station receives traffic from an unknown address, and soon after stops reporting generation data.
An alert is created noting the correlation between physical disconnect and unknown traffic.
Some time later, when more devices receive traffic from similar addresses and go offline, the managed security center issues a high warning for a crypto locker outbreak, altering utilities, manufacturers, and customers to the new threat.
20

How to Detect

#RSAC
Scenario 1
A single solar station receives traffic from an unknown address, and soon after stops reporting generation data.
An alert is created noting the correlation between physical disconnect and unknown traffic.
Some time later, when more devices receive traffic from similar addresses and go offline, the managed security center issues a high warning for a crypto locker outbreak, altering utilities, manufacturers, and customers to the new threat.
21

How to Detect

#RSAC
Scenario 2
Monitoring a geographic group of DERMS devices is showing that the ride through safety conditions programmed into inverters across the area are being changed repeatedly just below notification thresholds. After checking with the utility energy management system (EMS) group, and validating that no such utility actions are planned, the managed services team can alert the utility and government agencies to a probable large-scale event targeting and tampering of DERMS devices.
22

How to Detect

#RSAC
Scenario 2
Monitoring a geographic group of DERMS devices is showing that the ride through safety conditions programmed into inverters across the area are being changed repeatedly just below notification thresholds. After checking with the utility EMS group, and validating that no such utility actions are planned, the managed services team can alert the utility and government agencies to a probable large-scale event targeting and tampering of DERMS devices.
23

How to Detect

#RSAC
Scenario 2
Monitoring a geographic group of DERMS devices is showing that the ride through safety conditions programmed into inverters across the area are being changed repeatedly just below notification thresholds. After checking with the utility EMS group, and validating that no such utility actions are planned, the managed services team can alert the utility and government agencies to a probable large-scale event targeting and tampering of DERMS devices.
24

How to Prevent
Require digital signatures and verification when updating firmware
Generate warning when inverter
owners attempt to make atypical configuration changes

Deploy inline detection and blocking capabilities co-located with the distributed energy
resource

Internet

Require aggregators and product vendors
to validate data before sending to
utility

#RSAC
25

#RSAC
Apply What You've Learned Today (For Utilities)

Next week you should:
· Understand how data flows from third-party owned distributed energy resources (DER) to utility systems

In the next three months, you should:
· Examine those data flows to look for suspicious or unexplained behavior in the data and develop detection criteria
· Talk to your DER vendors about how they build protection into their products

In the next six months, you should
· Work with aggregators, inverter vendors, and others to deploy threat detection and response capabilities to detect and thwart attacks on DERs

26

#RSAC
Apply What You've Learned Today (For Distributed Energy Resource Owners)

Next week you should:
· Review the configuration of your system to better understand potential threat vectors leveraging hardening guidance where available and review energy bill and credit statements for unexpected charges or credits

In the next three months, you should:
· Where possible, work with your utility, solar aggregator, or inverter vendor to better understand how they might be able to detect threats to your system and how you can help with the response

In the next six months, you should
· Apply additional hardening and other guidance provided by utilities and others to better prevent, detect, and respond to attacks

27

#RSAC
Questions?
Gib Sorebo ­ gilbert.n.sorebo@accenture.com Aaron Bayles ­ aaron.bayles@accenture.com
28

