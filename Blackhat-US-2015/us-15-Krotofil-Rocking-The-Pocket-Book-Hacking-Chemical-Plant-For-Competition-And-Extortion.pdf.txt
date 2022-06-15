Rocking the Pocket Book: Hacking Chemical Plants for Competition and Extortion
Marina Krotofil
Black Hat, Las Vegas, USA 06.08.2015

Industrial Control Systems (aka SCADA)

Curtesy: Compass Security Germany GmbH

Physical application

Cyber-physical systems
Cyber-physical systems are IT systems "embedded" in an application in the physical world Interest of the attacker is in the physical world

Industrial Control Systems

Control systems security
Ralph Langner: "The pro's don't bother with vulnerabilities; they use features to compromise the ICS"

My research focus
 Complex continuous processes (e.g. chemical plants)  Non-opportunistic attacker  I do not research into (but consider) cyber vulnerabilities
in communication protocols and control equipment
 What the attacker can do to the process?  What she needs to do and why?  What needs to be programmed into a final payload?  Are traditional cyber-security measures adequate?

Security science
Security is not a fundamental science
It is application driven Security solutions exist in the context of the application

Early adopter: E-commerce
 Security influences design decisions
o Attackers (mis)use functionality of web browsers
o Novel approaches to designing web applications
o Novel security controls in browsers
 Application dictates security properties
o Information-theoretic security properties o CIA triad Parkerian hexad

Parkerian hexad

Failed to adopt
 Wireless sensor networks
o A big hype for about a decade o Conferences, solutions, promising
applications o Remained a "promising" technology with limited deployment
 Downfall reasons
o Deficiencies in the attacker models and security requirements
o Unrealistic assumptions about physics of wireless communication
D. Gollmann, M. Krotofil, H. Sauff. Rescuing Wireless Sensor Networks Security from Science Fiction (WCNS'11)

Control equipment vulnerabilities

ICSA-15-099-01A: Siemens SIMATIC HMI Devices Vulnerabilities (Update A)

ICSA-13-274-01: Schneider Electric Telvent SAGE RTU DNP3 Improper Input Validation Vulnerability

ICSA-15-111-01:

Emerson AMS Device

ICSA-11-307-01:

Manager SQL Injection

Schneider Electric Vijeo

Vulnerability

Historian Web Server

Multiple Vulnerabilities

ICSA-12-320-01 : ABB

AC500 PLC Webserver

CoDeSys Vulnerability

ICSA-13-274-01: Siemens

SCALANCE X-200

Authentication Bypass

Vulnerability

ICS-ALERT-14-323-01: Advantech EKI-6340 Command Injection

ICSA-15-048-03: Yokogawa HART Device DTM Vulnerability

ICS-CERT recommendation
ICSA-13-274-01: Siemens SCALANCE X-200 Authentication Bypass Vulnerability
IMPACT Successful exploitation of this vulnerability may allow attackers to perform administrative operations over the network without authentication. Impact to individual organizations depends on many factors that are unique to each organization. ICS-CERT recommends that organizations evaluate the impact of this vulnerability based on their operational environment, architecture, and product implementation.

Impact evaluation
 What exactly the attacker can do with the vulnerability?  Any further necessary conditions required?  How severe the potential physical impact?
Answering these questions requires understanding how the attacker interacts with the control system and the process

Incident data unavailability
 Due to various schemes for reputation management and data sharing laws, the majority of Operational Technology attacks over the last 20 years have not been made public, making even a catalogue of recent reference events difficult to assemble.
 A key requirement for an insurance response to cyber risks will be to enhance the quality of data available and to continue the development of probabilistic modelling.
We can and should conduct own research on cyber-physical exploitation

Control systems security

Control system design flaw

1 Industrial systems can be controlled without
modifying the contents of the messages

o This can be effective even if the traffic is signed

or even encrypted

Overlooked data

security property

2

Process data can be spoofed to make it look like everything is normal

o This can be done despite all traditional

communication security put in place

M. Krotofil, J. Larsen. What You Always Wanted and Now Can: Hacking Chemical Processes. Hack in the Box, Amsterdam (2015)

Process control

Process control automation
(Nest because it's so cute!)
Set point
Running upstairs to turn on your furnace every time it gets cold gets tiring after a while so you automate it with a thermostat

Control loop

Actuators

Physical process

Sensors

Adjust themselves to influence
process behavior

Control system
Computes control commands for actuators

Measure process state

Control system

Error in desired temperature e(t) = SP - PV

Controller output, CO

Signal to actuator Adjusted fuel

(valve)

flow to furnace

Set point (SP) Desired temp

+-

Termostat controller

Furnace fuel valve

House heating system

Heat into house

Measured temp (Process variable, PV)

Temperature

Heat loss

sensor

(e.g. through windows)

Jacques Smuts ,,Process Control for Practitioners"

Control equipment
 In large ­scale operations control logic gets more complex than a thermostat
 One would need something bigger than a thermostat to handle it
 Most of the time this is a programmable logic controller (PLC)

PLC internals

Sensors

1. Copy data from inputs to temporary storage 2. Run the logic 3. Copy from temporary storage to outputs

Actuators

Outputs Inputs

Control logic
 It is programmed graphically most of the time
Note to the control guys: logic and given examples do not match, they picked randomly. Thank you for noticing ;-)

If Input 1 and (Input 4 or Input 11) then Output 6

If tank pressure in PLC 1 > 1800 reduce inflow in PLC 3

PID control
 PID: proportional, integral, derivative ­ most widely used control algorithm on the planet
 The sum of 3 components makes the final control signal  Full PID control is mostly used for tight control (e.g. temperature in the
reactor)
Jacques Smuts ,,Process Control for Practitioners"

Field communication
Communication media o 4-20 mA o 0-10 v o Air pressure
Usually process values are scaled into meaningful data in the PLC
Wires are run from sensors and actuators into wiring cabinets

PLC cannot do it alone
 PLC does not have the complete picture and time trends  Human operators watch the process 7/24  Most crucial task: resolution of alarms

SCADA hacking

Why to attack ICS
Industry means big business Big business == $$$$$$$

Why to attack ICS
Industry means big business Big business == $$$$$$$
Alan Paller of SANS (2008): In the past two years, hackers have in fact successfully penetrated and extorted multiple utility companies that use SCADA systems. Hundreds of millions of dollars have been extorted, and possibly more. It's difficult to know, because they pay to keep it a secret. This kind of extortion is the biggest untold story of the cybercrime industry.

Source: simentari.com

Why to attack ICS
Attack goal: persistent economic damage

Here's a plant. Go hack it.

What can be done to the process

Equipment damage Production damage

 Equipment overstress  Violation of safety limits

 Product quality and product rate
 Operating costs
 Maintenance efforts

Compliance violation
 Safety  Pollution  Contractual agreements

Paracetamol

Purity Relative price, EUR/kg

98%

1

99%

5

100%

8205

Source: http://www.sigmaaldrich.com/

Attack considerations

± ±

 Equipment damage
o Comes first into anybody's mind (+) o Irreversible ( ) o Unclear collateral damage (-) o May transform into compliance
violation, e.g. if it kills human (-)

Equipment damage Production damage Compliance violation

 Compliance violation
o Compliance regulations are public knowledge (+) o Unclear collateral damage (-) o Must be reported to the authorities ( ) o Will be investigated by the responsible agencies (-)

Plants for sale
From LinkedIn
More plants offers: http://www.usedplants.com/

Car vs. plant hacking It is not about the size
It is about MONEY Plants are ouch! how expensive

Vinyl Acetate Monomer plant (model)

Acknowledgement
Behind great woman is a great man

Acknowledgement
Process Automation Consultant
Cyber-physical hacker Professor

Student Chemical Engineer
Programmer

Acknowledgement
 Alexander Isakov ­ awesome programmer  Alexander Winnicki ­ very good student  Dieter Gollmann ­ most supportive professor  Jason Larsen ­ cyber-physical hacking guru  Pavel Gurikov ­ chemical engineer who believes in hackers  William Horner ­ experienced automation expert

Stages of cyber-physical attacks

Attack payload
Attack objective

Cyber-physical payload

Stages of SCADA attack

Access

Cleanup

Discovery

Damage

Control

J. Larsen. Breakage. Black Hat Federal (2007)

Stages of SCADA attack

Access

Cleanup

Discovery

Damage

Control

Stages of SCADA attack

Access

Cleanup

Discovery

Damage

Control

Access

Traditional IT hacking
· 1 0day · 1 Clueless user · Repeat until done

· No security · Move freely

· AntiVirus and Patch Management · Database links · Backup systems

Modern IT hacking
 Select a vulnerability from the list of ICS-CERT advisories
 Scan Internet to locate vulnerable devices
 Exploit
· E. Leverett, R. Wightman. Vulnerability Inheritance in Programmable Logic Controllers (GreHack`13) · D. Beresford. Exploiting Siemens Simatic S7 PLCs . Black Hat USA (2011)

Plants modernization
 Smart instrumentation
o Converts analog signal into digital o Sensors pre-process the measurements o IP-enabled (part of the "Internet-of-Things")

Old generation temperature sensor

Sensor

Computational element

Invading field devices

 Inserting rootkit into sensor's firmware

Valve
Valve closes

Water flow
Pipe
Shock wave Reflected shock wave

Physical movement

Shockwave

Reflected wave

Attack scenario: pipe damage with water hammer effect

J. Larsen. Miniaturization. Black Hat USA (2014)

Discovery

Process discovery

What and how the How it is process is producing controlled

How it is build Operating and and wired safety constraints

Espionage, reconnaissance Target plant and third parties

Espionage
 Industrial espionage has started LONG time ago (malware samples dated as early as 2003)

Process discovery

Know the equipment Stripper is...

Stripping column

Max economic damage?

Reaction

Refinement

Requires input of subject matter experts

Final product

Understanding points and logic

Programmable Logic Controller

Ladder logic

Piping and instrumentation diagram

Pump in the plant

Understanding points and logic
HAVEX: Using OPC, the malware component
gathers any details about connected devices
Parnodgsreanmdms tahbelme bLoacgkictoCtohnetCro&lCle.r

Ladder logic

Piping and instrumentation diagram

Pump in the plant

Understanding control structure

1

2 PC

CC TC

6

7

Control 5

loop

PC TC

LC 4

26

18 CC

CC

17

19

10 11 TC

13

22

TC

TC

LC

23

TC
TC 9

LC LC
8 12

14 15 16 TC

LC 20
24

LC 3

TC

21

25

LC

CC

Control loop configuration

Watch the flows!

fixed

HAc flows into two sections. Not good :(

Obtaining control != being in control
 Obtained controls might not be useful for attack goal
 Attacker might not necessary be able to control obtained controls
Huh ???

Control

Every action has a reaction

Physics of process control
 Once hooked up together, physical components become related to each other by the physics of the process
 If we adjust a valve what happens to everything else?
o Adjusting temperature also increases pressure and flow
o All the downstream effects need to be taken into account
 How much does the process can be changed before releasing alarms or it shutting down?

Process interdependencies

Process interdependencies

Understanding process response

· Operating practice · Control strategy
Set point

· Control algorithm · Controller tuning
Controller

· Sizing · Dead band · Flow properties
Final control element

· Equipment design · Process design · Control loops coupling
Process

Transmitter

Disturbance
· Type · Duration

· Sampling frequency · Noise profile · Filtering

Process control challenges

 Process dynamic is highly non-linear (???)

UNCERTAINTY!

 Behavior of the process is known to the extent of its modelling
o So to controllers. They cannot control the process beyond their control model

This triggers alarms

Non-liner response

Control loop ringing

Caused by a negative real controller poles
Makes process unstable and uncontrollable

Amount of chemical entering the reactor

Types of attacks

Step attack
Recovery time Magnitude of manipulation

Periodic attack

Outcome of the control stage
I am 5'3'' tall
We probably should automate this process (work in progress)

Outcome of the control stage

Sensitivity High Medium Low

Magnitude of manipulation Recovery time

XMV {1;5;7}

XMV {4;7}

XMV {2;4;6}

XMV {5}

XMV{3}

XMV {1;2;3;6}

Reliably useful controls

Alarm propagation

Alarm Gas loop 02 Reactor feed T Rector T FEHE effluent Gas loop P HAc in decanter

Steady state attacks XMV {1} XMV {6} XMV{7} XMV{7}
XMV{2;3;6} XMV{2;3;7}

Periodic attacks XMV {1} XMV {6} XMV{7} XMV{7}
XMV{2;3;6} XMV{3}

The attacker needs to figure out the marginal attack parameters which (do not) trigger alarms

Damage

How to break things?
Attacker needs one or more attack scenarios to deploy in final payload
 The least familiar stage to IT hackers
o In most cases requires input of subject matter experts
 Accident data is a good starting point
o Governmental agencies o Plants' own data bases

Hacker unfriendly process
 Target plant may not have been designed in a hacker friendly way
o There may no sensors measuring exact values needed for the attack execution
o The information about the process may spread across several subsystems making hacker invading more devices
o Control loops may be designed to control different parameters that the attacker needs to control for her goal

Analyzator

Measuring the process
Chemical composition
FT TT
· Reactor exit flowrate · Reactor exit temperature · No analyzator

Analyzator

Analyzator

FT
Measuring here is too late

Analyzator

Measuring attack success
If you can't measure it, you can't manage it
Peter Drucker
I have a dream ­ that one day I will find all
the right KPI`s...

Technician vs. engineer

Technician
"It will eventually drain with the lowest holes loosing pressure last"

Engineer
"It will be fully drained in 20.4 seconds and the pressure curve looks like this"

J. Larsen. SCADA triangles: reloaded. S4 (2015)

Technician answer
Usage of proxy sensor
Reactor with cooling tubes
 Only tells us whether reaction rate increases or decreases  Is not precise enough to compare effectiveness of different attacks

Quest for engineering answer
 Code in the controller  Optimization applications  Test process/plant
0,00073; 0,00016; 0,0007...

Engineering answer
Vinyl Acetate production

Product loss
Product per day: 96.000$ Product loss per day: 11.469,70$

Outcome of the damage stage

Product per day: 96.000$

Product loss, 24 hours

Steady-state attacks

High,  10.000$

XMV {2}

Medium, 5.000$ - 10.000$

XMV {6;7}

Low, 2.000$ - 5.000$ Negligible,  2.000$

XMV {1;3}

Still might be useful

Periodic attacks XMV {4;6} XMV {5;7} XMV {2} XMV {1;2}

Clean-up

Socio-technical system

Operator Controller

· Maintenance stuff
· Plant engineers
· Process engineers · ....

Cyber-physical system

Creating forensics footprint
 Process operators may get concerned after noticing persistent decrease in production and may try to fix the problem
 If attacks are timed to a particular employee shift or maintenance work, plant employee will be investigated rather than the process

Creating forensics footprint
1. Pick several ways that the temperature can be increased
2. Wait for the scheduled instruments calibration 3. Perform the first attack 4. Wait for the maintenance guy being
yelled at and recalibration to be repeated 5. Play next attack 6. Go to 4

Creating forensics footprint
Four different attacks

Defeating chemical forensics
 If reactor doubted, chemical forensics guys will be asked to assist  Know metrics and methods of chemical investigators  Change attack patterns according to debugging
efforts of plant personnel

ICCP
Operator's screens
Historian
Minimal process model
Accident data

Regulatory reporting

Just-in-time manufacturing

Regulatory filings

Point database

Small changes to the process

Realtime data from sensors

SEC filings

Process experts

Wireless links
Safety briefs
Safety systems

Access Discovery

Control

Custom research

Custom operator spoofs

Waiting for unusual events

Log tampering

Forensic footprint
Cleanup

Damage
Final Payload

Postamble

State-of-the-art of ICS security
TCP/IP

What to do?
People respond to incentives.
A fundamental principle of economic analysis

Premium drives compliance
Compliant? Determine

Cyber-insurance
1 "Base line" security 2 Compliance audit 3 Residual risk assessment: setting Premium 4 Cyber-physical forensics: damage liabilities 5 Approved monitoring solution

Take away
 Better understanding what the attacker needs to do and why o Eliminating low hanging fruits o Making exploitation harder
 Look for the attacker o Eliminating low hanging fruits o Making exploitation harder
 Building attack-resilient processes
Research on cyber-physical exploitation is useful for.....

Thank you
Marina Krotofil marina.krotofil@tuhh.de
Damn Vulnerable Chemical Process
TE: http://github.com/satejnik/DVCP-TE VAM: http://github.com/satejnik/DVCP-VAM

