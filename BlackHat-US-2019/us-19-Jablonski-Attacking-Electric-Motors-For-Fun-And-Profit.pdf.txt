ELECTRIC MOTORS
Matthew Jablonski Duminda Wijesekera, Ph.D.

About Us

Matthew Jablonski
· Ph.D. Student in IT
· Engineer and penetration tester
· Safety and security of cyber-physical systems

Dr. Duminda Wijesekera
· Professor, CS · 250+ Publications

· Areas of Focus:
· RF Off. and Def. · Cyber Physical Systems · Computer Vision · Risks in algorithms,
HW/SW, etc.
· Collaborations:
· Government · Transportation · Medical · Industrial
2

Abstract & Caveats
· Comprehensive technical evaluation of attack objectives and offensive strategies focused on electric motor (EM) systems
· Introducing the Motor Threat Model
· We do not:
· target a specific product or endorse any products · follow safety warnings (but you should and we are not responsible for your actions)
3

Quick Overview
(Got to keep this presentation MOVING...)

SAFETY AND
SECURITY OF MOVING
THINGS

THE MOTOR ATTACK MODEL

MOTOR ATTACK METHODS

DISCUSSION
EXPERIMENTAL VALIDATION

4

Hypothetical Problem Scenario
· Your next risk assessment target: A Proprietary Drone System
· Thousands deployed worldwide for package delivery
· 30 different drone models were dev'ed · Hundreds of operators... · With physical and remote access... · And... background checks aren't required. · Over the Internet.
· WHAT IS THE ATTACK SURFACE?
(and we need your response NOW!)
5

Safety First!

· Rules, Regulations, Standards
· Designed to address accidents
· Protect against risks through:
· Operational requirements
· i.e. air traffic control
· Power requirements
· i.e. overcurrent, low voltage, etc.
· System calibration requirements

Safety Risks
Focus: Accident Prevention
Risk Management

· Security... Second?
· What about intentional threats?

Security Risks
Focus: Intentional Misuse
6

The First Security Problem...
· Possible nightmare scenario...
7

Unacceptable Security Recommendation
8

System Review: What's Inside?

Brushless Motor

DRIVE

DRIVE

Brushless Motor

4G LTE

Sensors: Accelerometers;
inertial measurement;

Mission Control (OPERATOR)

magnetic;

optical; GPS;

Handheld Throttle

(OPERATOR)

2.4GHz FHSS

M

ESC

))) )))

M

ESC

ESC

M

Controller

Controller ­ Linux; AI apps

ESC

M

Brushless Motor

DRIVE

DRIVE

Brushless Motor

9

The Start: Find Similar Threat Models?
10

How do Electric Motors Work?

· Every motor connected

to a drive

5V

· Embedded controller

0V

· ESC, VSD, VFB

5V

0V

· Voltage fluctuated at 5V

pin by HW switch

0V

· Current flows to motor when V>0
· Pulse Width Modulation

5V 0V 5V

0V
· Clock and duty cycle controlled by HW & SW

0% duty cycle 25% duty cycle 50% duty cycle 75% duty cycle 100% duty cycle
11

How do Electric Motors Work?

· Input: electrical energy · Output: torque, speed,
mechanical energy
· Rotor: free-moving · Stator: stationary
· Many different types:
· DC vs. AC power · Rotary vs. linear · Selection based on LOAD

Rotor
Magnet
S
Stator

Commutator

Windings

N

Air Gap

Brushes

Leads Brushed DC Motor
12

How do Electric Motors Work?

Torque vs. Speed

Effects on Power Output

Torque Torque (N*m)

Power (W)

Stall Torque: S Slope: =S-S/N

MP=0.5S R

In te rmi tt ent Duty Zone
Co nt inu ou s Duty Zone Low Power

Max Power: PMAX
Op ti mal Operation Zone
No-Load Speed: N

MP=0.5N R

Speed

Stall Torque: S POUT

MP=0.5S

Max Power: PMAX

MP=0.5N

No-Load Speed: N
Speed (RPM)

13

Control Theory: The Recipe for Digital Movement Control
Open loop systems:
Closed loop systems:
14

Another Security Problem...
15

Yet Another Security Problem...
Movement is continuous (usually)
Digital control requires discrete commands
16

Maybe Similar Threat Models?
17

Threat Modeling... Gaps...
· Let's get away from drones.

· Common issues:
· Cyber vs. physical attacks · Physical attack outcomes · Multiple control layers · Digital commands are discrete

· Possible models?
· ICS Cyber Kill Chain (Stage 2) [1] · Mitre's ICS ATT&CK Framework [2]

[1] M. J. Assante and R. M. Lee, "The Industrial Control System Cyber Kill Chain," Tech. Rep. 36297, SANS Institute, October 2015.

[2] O. Alexander, "ICS ATT&CK Framework: Adversary Tactics and Techniques (S4x19)."

www.brighthubengineering.com/commercial-electrical-applications/78579-determining-causes-for-electric-motor-failure/, January

2019. Accessed: 2019-07-05.

18

The Motor Threat Model (MTM)
Our proposed model:
19

The MTM Stack
· Simplified 7-layer stack
· Key takeaways:
· Attacks at higher layers allow better control for attacker
· Attacks at lower layers take control of movement from higher layers
· Can understand access needed for C v. P attacks
20

High Level Attack Objectives

· Control
· Steal control to achieve some goal
· Cyber attacks · Easiest at layers 4-7
· Disrupt
· Stop movement or prevent operational controls
· Cyber or physical attacks · All layers

· Data Exfiltration
· IP or privacy theft by tracking movement data
· Cyber attacks · Easiest at layers 5-7

21

Layer Descriptions

Name 7 ­ OPERATOR 6 ­ SENSOR 5 ­ CONTROL 4 ­ DRIVE

Description
Unprivileged motor control
Feedback data on phys. env.
Root system control Modify motor configuration

Level 1 Access Description
Operator interface
Sensors or Wireless Sensor Network (WSN) System controller Motor drive controller

Level 2 Access Types of Attack

Description

Attacks Objectives

(C, P)* (C, D, DE)**

OPERATORCONTROL channel

C, P

C, D, DE

Out-of-band safety system (if exists)

C, P

C, D, DE

CONTROL-DRIVE C, P channel

C, D, DE

DRIVE-MOTOR channel

C, P

C, D

* Cyber (C) or Physical (P) ** Control (C), Disrupt (D) or Data Exfiltration (DE)
22

Name 3 - POWER 2 - MOTOR 1 - LOAD

Layer Descriptions

Description
Prevent or degrade movement Source of mechanical movement Prevent movement by overload

Level 1 Access Description
Power system access

Level 2 Access Description
N/A

Types of Attacks (C, P)*
C, P

Attack Objectives (C, D, DE)**
D

Motor physical N/A access

C, P

D

Output LOAD

N/A

access

P

D

* Cyber (C) or Physical (P) ** Control (C), Disrupt (D) or Data Exfiltration (DE)
23

OPERATOR Attack Ex. 1 Wireless Control

Example Target:
Controller

Operator

Forward

Reverse
24

OPERATOR Attack Ex. 1 Wireless Control
Results: Control and Disrupt
25

OPERATOR Attack Ex. 2 Remote Pin Control

Example Target:
RPi Controller;
Raspbian; pigpiod with Remote GPIO

ESC

Brushed DC Motor

LiPO Battery

Dynanometer

This physical setup is used in most attack examples, unless noted.
26

OPERATOR Attack Ex. 2 Remote Pin Control

Fingerprint on network

Attack script

· Attacker has network access and observes remote GPIO · Executes attack script: PIGPIO_ADDR=192.168.1.4 python3 attack.py

27

OPERATOR Attack Ex. 2 Remote Pin Control
Results: Control and Disrupt RPM vs. Time
Baseline Run Attack Run 28

SENSOR Attack: Accelerometer Data Injection
Example Target: ADXL345 accelerometer used to control servo angle
29

SENSOR Attack: Accelerometer Data Injection
· Capture and decode I2C, 6 bytes sent for X, Y, Z · Connecting attack Pi ­ observe I2C address 0x53
30

SENSOR Attack: Accelerometer Data Injection
· Set attack Pi as I2C slave
· Control bytes
Results: Control and Disrupt
31

CONTROL Attack 1: Timing Impacts of Discrete Command Injections
on Motor Control
· Inject changes to duty cycle during operation Results: Control and Disrupt; RPM vs. Time
32

CONTROL Attack 2: Hardware Implant Targeting PWM Channel
Example Target:
33

CONTROL Attack 2: Hardware Implant Targeting PWM Channel
· When PWM used as control signal, typically a 3-wire cable is used:
· Black wire = ground · Red wire = current · White or yellow wire
= control
34

CONTROL Attack 2: Hardware Implant Targeting PWM Channel
Results: Control and Disrupt RPM vs. Time
35

DRIVE Attacks: Pin Control and Configuration Attacks
· Attacks modify pin registers in Rpi 3 B+ SoC, Broadcom BCM2837 · Memory map physical memory locations using BCM2837 spec
36

DRIVE Attacks: Pin Control and Configuration Attacks
· Attack 1: Change pin to INPUT during operation
Results: Control and Disrupt
RPM vs. Time
37

DRIVE Attacks: Pin Control and Configuration Attacks
· Attack 2: Modify PWM CLOCK and DATA on BCM2837 to identify behavioral changes to motor
· Target:
38

DRIVE Attacks: Pin Control and Configuration Attacks
Results:
Control and Disrupt
DATA vs. CLOCK w/ Static RANGE
39

DRIVE Attacks: Pin Control and Configuration Attacks
· Attack 3: Record and playback PWM registers
Results: Control and Disrupt
RPM vs. Time
40

POWER Attack: Motor Performance due to Low Voltage
· Test run with low voltage LiPO battery Results:
Disrupt
RPM vs. Time

7.62V LiPO

6.5V LiPO

NOTE: LiPO batteries should never be used in low voltage (may overheat or worse)

41

POWER Attack: Motor Performance due to Low Voltage
Results:

Disrupt

Torque and Power Output vs. Speed

7.62V LiPO ­ Torque (N*mm) 7.62V LiPO ­ Power Out (W)

6.5V LiPO ­ Torque (N*mm) 6.5V LiPO ­ Power Out (W)

NOTE: LiPO batteries should never be used in low voltage (may overheat or worse)

42

MOTOR Attack 1: Motor Performance in Presence of
External Electromagnet
· Introduced electromagnet (500N suction) to target during run to observe behavior
43

MOTOR Attack 1: Motor Performance in Presence of
External Electromagnet
Results:
Disrupt
RPM vs. Time

Baseline Run

Attack Run 1, Electromagnet full run Attack Run 2, Electromagnet removed at 15 sec.
44

MOTOR Attack 1: Motor Performance in Presence of
External Electromagnet
Results:

Disrupt

Torque and Power Output vs. Speed

Baseline ­ Torque (N*mm) Baseline ­ Power Out (W)

Attack Run 2 ­ Torque (N*mm) Attack Run 2 ­ Power Out (W)

45

MOTOR Attack 2: Reprogramming Digital Servo Motor
· Digital servo manufacturers provide programming tools · Identify motor type and procure programmer ­ no auth! · Target and programmer:
46

MOTOR Attack 2: Reprogramming Digital Servo Motor
· Expected behavior (top, CW) vs. reprogrammed (bot, CCW):
47

LOAD Attack: Overheating and Stalling a Motor
· Target desk fan:
48

LOAD Attack: Overheating and Stalling a Motor
· Overheated to ~180° F and motor died at 61-min mark Results: Disrupt
49

LOAD Attack: Overheating and Stalling a Motor
· Brushless motor comparison between dead and good fan · No visual difference
50

Motor Threat Model Redux
51

Start Over: Hypothetical Problem Scenario
· Your next risk assessment target:
A Proprietary Drone System
· Thousands deployed worldwide for package delivery
· 30 different drone models were dev'ed · Hundreds of operators... · With physical and remote access... · And... background checks aren't required. · Over the Internet.
· WHAT IS THE ATTACK SURFACE?
(and we need your response NOW!)
52

Attacker Model for Drone System
· Nation State ­ C & P; Offensive campaigns directed at accomplishing some mission; Many resources
· Cybercriminal ­ C; Motivated by data collection
· Terrorist ­ C; Motivated by spreading fear
· Insider ­ C or P; Disgruntled employee or social engineering victim
53

Refined Attack Objectives for Targeting Drone Movement
· Control ­
· Steal property · Alter predictable movements
· Disrupt ­
· Physical damage · Physical harm · Prevent movement
· Data Exfiltration ­
· Privacy Invasion
54

Movement Focused Attack Trees
55

MTM Application for Finding Movement Threats

2-MOTOR

7-OPERATOR

Brushless Motor

4-DRIVE
DRIVE

4-DRIVE
DRIVE

2-MOTOR
Brushless Motor

4G LTE

M

ESC

ESC

M

Sensors: Accelerometers;
inertial measurement;
magnetic; optical;
GPS;
6-SENSOR

Mission Control (OPERATOR)
Handheld Throttle (OPERATOR)

2.4GHz FHSS

))) )))

M

ESC

Controller

5-CONTROL
Controller ­ Linux; AI apps

ESC

M

3-POWER 1-LOAD

7-OPERATOR
Brushless Motor
2-MOTOR

DRIVE

DRIVE

Brushless Motor
2-MOTOR

4-DRIVE

4-DRIVE

56

Experimental Boneyard
57

Thanks!
58

Backup Slides
59

The OPERATOR Layer
· Unprivileged motion control (most of the time)
· 2 levels of access:
1. Operator interface 2. OPERATOR-CONTROL channel
· Type: cyber and physical
· Objectives: control, disrupt, data exfiltration
60

The SENSOR Layer
· Provides input data about physical environment
· 2 levels of access:
1. Sensors 2. Out-of-Band Safety Systems
(TRITON)
· Type: cyber and physical
· Objectives: control, disrupt, data exfiltration
61

The CONTROL Layer
· Privileged motion control (root!)
· 2 levels of access:
1. Controller 2. CONTROL-DRIVE Channel
· Type: cyber and physical
· Objectives: control, disrupt, data exfiltration
62

The DRIVE Layer
· Modify motor properties during operation
· 2 levels of access:
1. Controller 2. CONTROL-DRIVE Channel
· Type: cyber* and physical
· Objectives: control and disrupt
* With limited physical access
63

The POWER LAYER
· Prevent or degrade motor performance
· 1 level of access:
· Targeting power input
· Type: cyber* and physical
· Objective: disrupt
* With limited physical access
64

The MOTOR Layer
· Disruption of movement at the source of mechanical power
· 1 level of access:
· Targeting the motor
· Type: cyber* and physical
· Objective: disrupt
* With limited physical access
65

The LOAD Layer
· Movement prevention by overloading the system
· 1 level of access:
· Targeting the output system
· Type: physical
· Objective: disrupt
66

