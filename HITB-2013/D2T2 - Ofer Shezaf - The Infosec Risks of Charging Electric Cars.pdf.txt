Ofer Shezaf
Blogging at http://www.xiom.com

What I do for a living? · Product Manager, Security Solutions, HP ArcSight · Led security research and product
management at Breach Security & HP Fortify
I am passionate about security after hours as well: · OWASP leader and founder of the Israeli chapter · Leads the Web Application Firewall Evaluation Criteria project · Wrote the ModSecurity Core Rule Set · But I am a defender and not a hacker. I am too old for that.
Everything in this presentation is taken from public sources.
F2 un fact: the closest airport to my house is in Damascus, Syria

We are in the right city!
3

Agenda

Plugs

Why smart charge? How to charge smartly?

Security Philosophy

What can go wrong? What should we care? What should we do? Hacking the internet of things

Why doesn't it happen more?

The electric car and the smart grid
Architecture and functionality of charge stations Vulnerabilities and incidents The risk Solutions

Smart charging electric cars

Why not just plug to the wall?
6

Are there plugs on the streets?
And if there were, who will pay for the power?
7

Is there enough power for all cars?
In a building? In the country?
8

Are electric cars really green?
When is renewable energy available?
9

Customer Needs

Charge as soon as possible
Pay minimum
Make it easy

Local circuit capacity
Regional, national and international capacity
Renewable energy availability
Battery life management

Restrictions

10

11 CONFIDENTIAL © 2010 Better Place

User

Charge Services back office & analytics

Utility

So we need to smart charge

system planning supply management
load management customer services
EV charge management EV network management
EV driver services

Local Controller

Office buildings Retail space Multi-unit residences Public charging
single-unit residences (smart metering/HAN)

power communications
11

Charge scenarios
12

Charge plans
13

Charge stations

A computer on the street
15

Component by component

Electronics

UI ­ LCD, LEDs, Buzzer

GSM/WiFi/ZigBee/RS

Electrical
Fan (optional)

Main PCB
16

PSU, RCD Metering, GND Terminal, CP Terminal

Smart Socket

Actually a network
17

Potential Vulnerabilities
All the information in this section is based on public sources and in most cases from vendors' web sites. Looking into the suggested possibilities is left as an exercise to the audience.

Physical access

What is it?
Take apart system to:
· Determine components · Extract firmware and EEPROM · Analyze and debug firmware
Either of the street or purchased from vendor
Potential vulnerabilities:
· Convenient eavesdropping points · Get encryption keys · Analyze RFID, car or control center encryption · Analyze car/control center protocol and determine
vulnerabilities
19

Images: Grand et al, Parking meter hacking, BlackHat 2009

Short range communications: RS-485
What is it?
· Multi-drop serial protocol enables single data cable across all charge stations.
· Very low bandwidth and high latency due to multiplexing and range (100KBs shared by all nodes at 1200m bus)
· ModBus commonly used as data protocol and has no inherent security,
Potential Vulnerabilities
While it all depends on the application, bandwidth and latency limits encryption and makes eavesdropping and man in the middle attacks simple.
20

Short range communication: RFID

How is it used?
Several standards used
· ISO 14443 can be secured, but is not always. · ISO 15693 is cheaper and has longer range but provides little
security. · Older 125KHz cards have no security.
Standards do not determine application
Potential vulnerabilities
· Easy to eavesdrop: authentication is secured but not identification. · Extremely costly to patch · Encryption... on next slide
21

OpenPICC 13.56MHz RFID sniffer

HID iCLASSTM security demystified

Encryption: RFID
How is it used?
· Application either a stored value or identification · Commonly employs protected memory using
symmetric keys.
Potential vulnerabilities
· Same symmetric key used for all stations and cards: does not scale and open to relay and card attacks.
· Different symmetric keys require connectivity. · Weak cryptography · That is if keys are used...
22

Internet of things: protocols
Charge station to central management
· Identification, starting and stopping a charge transaction · Reservations · Maintenance: Setup, heartbeat, Configuration, Firmware Updates,
Errors and diagnostics
Car to charge station
· Negotiate current · Identification
Potential vulnerabilities
· Security by obscurity · Trust in end points · SSH and SNMP used extensively for management
23

Internet of things: web and mobile control
For charge station owners:
· Configure stations (max current allowed...public or not...) · Set pricing and manage transactions · Start/stop charging · Accounts and RFID cards management · Manager transactions
For drivers:
· Pay and manage payments · Start/stop charging · Connect RFID cards
Potential vulnerabilities? Kidding me...
24

Human factor: deployment and maintenance
Configuring is sometimes as simple as:
· Open the box · Place a DIP switch to configuration mode · Connect Ethernet cross cable to the Ethernet port · Fire a browser and connect to 192.168.2.2 · I wonder what you can get to outside of a browser?
25

GE charge station user guide

Risks & Scenarios
· Denial of (energy) services · Stealing · Privacy infringement · ...and...
As EV charging is still in infancy, to the best of my knowledge no incident have been reported yet. The example below are from similar systems that share many of the components such as : · Parking meters · Transportation payment systems

Denial of (charging/power) service
Scenarios:
Large scale or targeted: · Web/mobile: reservation, stopping charge · Control center: Massing with charge planning (local of global) · Charge stations: time bomb in firmware Imagine no electric car can charge for a day when the are 30% of a national fleet!
Happened before:
· Chicago parking meters meltdown · Ex-Dealership Employee Uses Internet To Disable 100 Cars

27

27

Stealing electricity (or money)
A lot of small charges can accumulate
Scenarios:
· RFID fraud: stored value of identity theft · Communications: Man in the middle · Protocols: emulating the control center · Web: refunds, identity theft · Meter spoofing
Happened before:
· Grand et al, SF parking meter hacking, BlackHat 2009 · Ryan et al, Boston subway hack, Defcon 2008. Faulty cards just
now replaced in the Netherlands.
28

Privacy infringement
Scenarios:
· Eavesdropping at multiple points · Web/mobile: Retrieving location identified
transactions.
Happened before:
· The web hacking incidents database

29

29

Electrocution?
30

Solutions

Open Standards

Today standards in in infancy and not open enough forcing security by obscurity.

Control Center communications Application: · e-Laad OPPC · ChargePoint Open Charge · ISO/IEC 15118 (partial) Network: ZigBee

EV 2 CS communication · ISO/IEC 15118 V2G · SAE J2293/2836/2847

32

Roaming ?
RFID · ISO 14443 + PayWave/PayPass ? · NFC ? · AES/3DES

Massive key and password management
Support unique key issuing and revocation
· Public key cryptography where feasible. · Derived symmetric keys for online systems and management
protocols. · One time maintenance keys or passwords.
Encryption risk management
· Consider insecure offline mode allowing no key in charge station.
33

Just design (and invest) in security!
34

So many frightening talks
So why no hacks?
36

It takes an expert, and not just in hacking

Security Expert
Domain Expert

Physical hacking presentation

37

And not just any security expert
This is as simple at it gets (i.e. just presentation graphics):
38

39

At least when it gets physical
40

However:
Risks are aggregative and involve a basic service Will become an issue when electric cars become a reality It may be too late by than...
41

Ofer Shezaf ofer@shezaf.com

