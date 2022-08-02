Aircraft Hacking
Practical Aero Series

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

IT Security
Hugo Teso
(@hteso)
(@48bits) www.48bits.com
One and a half architecture

Commercial Pilot

Aero Series
www.commandercat.com
© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Agenda
Part 1: The $PATH to the exploit Part 2: The $PATH to exploit

Disclaimer
Time constraints
»» Too much to explain
¤¤ Aircrafts != Computers
Safety reasons
»» Still too much to fix

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Part 1
The $PATH to the exploit

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

The Target
In the beginning there was "The Question"

Would I be able to convert THIS...

...into THIS ?

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

The Answer

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Today's Answer

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Attack Overview

Discovery:
»» ADS-B

Info gatherING:
»» ACARS

Exploitation: Post-Exploitation:

»» Via ACARS

»» Party hard!

»» Against on-board

systems vulns.

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

ADS-B 101
Automatic Dependent Surveillance-Broadcast
Radar substitute Position, velocity,
identification, and other ATC/ATM-related information. ADS-B has a data rate of 1 Mbit/sec. Used for locating and plotting targets
© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

ADS-B Security
None at all
Attacks range from passive attacks (eavesdropping) to active attacks (message
jamming, replaying,
injection).
Target selection
»» Public Data »» Local data (SDR*) »» Virtual Aircrafts
* Software Defined Radio
Hugo Teso

ACARS 101
Aircraft Communications Addressing and Reporting System
Digital datalink for transmission of messages between aircraft and ground stations
Multiple data can be sent from the ground to the A/C *
Used for passive "OS fingerprinting" and plotting targets
© 2013, n.runs Professionals - Security Research Team - April 2013

* Aircraft
Hugo Teso

ACARS Security
None at all
»» sometimes monoalphabetic ciphers
Detailed flight and Aircraft information
»» Public DB »» Local data (SDR) »» Virtual Aircrafts
Ground Service Providers
»» Two main players »» Worldwide coverage
© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

FMS 101
Flight Management System typically consists of two units:
»» A computer unit »» A control display unit
Control Display Unit (CDU or MCDU) provides the primary human/machine interface for data entry and information display.
FMS provides:
»» Navigation »» Flight planning »» Trajectory prediction »» Performance computations »» Guidance
Hugo Teso

FMS
Goal: Exploit the FMS
»» Using ACARS to upload FMS
data
»» Many different data types
available
Upload options:
»» Software Defined Radio »» Ground Service Providers
The path to the exploit:
»» Audit aircraft code searching
for vulnerabilities
We use a lab with virtual airplanes
»» but real aircraft code and HW
© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Aircraft Hardware and Software
The good old...
»» eBay!!
Russian scrapings
»» You name it
Loving salesman
»» Value-added products
Third party vendors
»» /wp-admin... Sigh
Resentful users or former employees
© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

The Lab

© 2013, n.runs Professionals - Security Research Team - April 2013

A/C == Aircraft SDR == Software Defined Radio
Hugo Teso

The Lab

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

FMS vulnerabilities
Many different data types to upload
Many FMS manufacturers, models and versions.
Architectures: PPC (Lab x86)
Language: mostly ADA (old ones)
SO ­ RTOS realm:
»» DeOS »» VxWorks
ACARS:
»» ACARS datalink allows real time
(avg of 11s delay) data transmission
»» Size: Max 220 chars * 16 blocks :S

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

ACARS Messages during flight

http://www.sita.aero/file/3744/Aircom Ekaterinburg - Oct 09 ENG.pdf
© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Demo

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Part II
The $PATH to exploit

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

SITA/ARINC
Société Internationale de Télécommunications Aéronautiques (SITA)
»» IT and telecommunication services to the air transport industry. »» 90% of the world's airline business.
Aeronautical Radio, Incorporated (ARINC)
»» Major provider of transport communications and systems solutions: »» Aviation, airports, defense, government, healthcare, networks, security, and
transportation.

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Access methods:
E-Mail Clients
»» SMTP / POP3 »» Lotus Notes

Be my guest...
What could possibly go WRONG?

Desktop Apps, connection over:
»» X.25 »» TCP »» MQ Series (IBM WebSphere) »» MSMQ (Microsoft queues) »» MS SQL Database »» ORACLE Database

Web App

Mobility
»» Mobile App »» Pager/SMS »» Printer »» SDK »» Stations

http://www.sita.aero/file/3744/Aircom Ekaterinburg - Oct 09 ENG.pdf

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Software Defined Radio 101

A radio communication system where components that have been typically implemented in hardware are instead implemented by means of software.
HW: USRP1/USRP2
»» Universal Software Radio Peripheral »» USB or Gigabit Ethernet link
SW: GNU Radio
»» LabVIEW, MATLAB and Simulink »» SDK that provides signal processing blocks
to implement software radios.
»» Python/C++

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Post-Exploitation "Smiths Aerospace chose Wind

Consolidation
»» Protection & Monitoring

River Systems' VxWorks 653 RTOS for the B787's

Communication
»» Two way communication
Expansion
»» Other systems »» Back to Discovery

common core system (CCS), a cabinet that will host 80 to 100 applications, including Honeywell's FMS and health

management software and

Collins' crew alerting and

display management software"

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Aircraft Post-Exploitation
Aircraft and Pilots
»» Predictables »» Checklists and procedures
Exploiting other comm and nav systems or protocols
Planning and timing!
C&C
»» Two way communication »» Actions »» Limitations

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

SIMON
Why SIMON? Multi-stage payload Control ADS-B/ACARS
»» Upload via ADS-B/ACARS
Persistence Stealthness (No Rootkit) Accept and inject:
»» FP/DB »» Payloads (scripts) »» Plugins (code) »» Commands »» Two way comm
© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Demo

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Conclusions

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Remediation
Safety != Security
Where to start from?
»» NextGen Security »» On-board systems security
audit
Who is affected?
»» Manufacturers »» Ground Service Providers »» Airlines
We are working with EASA to
improve the situation

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Aviation 101
»» http://en.wikipedia.org/wiki/Portal:Aviation

ADS-B
»» http://en.wikipedia.org/wiki/Automatic_
dependent_surveillance-broadcast
»» https://www.blackhat.com/html/bh-us-12/bh-us-
12-briefings.html#Costin

References

ACARS
»» http://en.wikipedia.org/wiki/Aircraft_
Communications_Addressing_and_Reporting_ System
»» http://spench.net/

FMS
»» http://en.wikipedia.org/wiki/Flight_
management_system
»» http://www.b737.org.uk/fmc.htm

SDR
»» http://en.wikipedia.org/wiki/Software-defined_
radio
»» http://gnuradio.org

© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso

Thanks to:
@d0tslash @vierito5 @searchio @48bits @kuasar Many others

http://conference.hitb.org/hitbsecconf2013ams/materials/
© 2013, n.runs Professionals - Security Research Team - April 2013

Hugo Teso
hugo.teso@nruns.com
Hugo Teso

