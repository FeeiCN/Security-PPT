
 IoT

IOT AND SYSTEM SECURITY: FROM

THE VLSI PERSPECTIVE

Yier Jin

Associate Professor Endowed IoT Term Professor University of Florida

Contents

INTRO TO IOT VLSI ATTACKS REVERSE ENGINEERING CASE STUDY

Internet of Things (IoT)

Expanding Adoption of IoT

A Recent Survey of IoT Adoption

Transportation Automotive Healthcare Agriculture
Building automation Energy management Connected/smart cities Industrial automation
Home automation IoT platform/middleware
0%

10% 20% 30% 40% 50%

2017 2016

Internet of Things (IoT) by 2020

2020

4
BILLION
Connected People

$4
TRILLION
Revenue Opportunity

25+
MILLION
Apps

25+

50

BILLION TRILLION

Embedded and Intelligent Systems

GBs of Data

IoT Design and Structure

Web Services (Weather, SNS, ...)

Cloud to Support IoT

Device Data Collection Device Control & Monitoring Mashup Service

Applications

Internet of Things

Software Code

Hardware Platform

Microprocessor

How To Ensure IoT Security?
Cross-Layer: Technical cybersecurity solutions should take various layers of computing systems into consideration.

Hardware-Software Boundary Hardware Layers
Layered View of Computing Systems

Software Layers

WHY INTEGRATED CIRCUITS (IC, AKA VLSI) SECURITY

Introduction to Secure Boot

Establish a root of trust
Start code execution from a trusted source
Have trusted source check next step of the code chain

Processor
Boot Code

check

External

code

PFaasisl: pexaencicu(t)e

Secure Boot Chain

check

Processor
Boot Code

External code

More External Code

Bypassing Boot Process
Boot Process Security Validation
 Modern SoCs are designed to provide high flexibility  Dilemma: Flexibility vs security  Task: Evaluate the security implications of all possible boot
configurations  Case study: TI Sitara AM3703 SoC

PCB Reverse Engineering Top view
Side view

Chip Reverse Engineering
NXP Mifare
 Proprietary cryptographic algorithm: CRYPTO-1  Reverse engineering: Algorithm and LFSR structure  Widely used in ID cards

IC Supply Chain

Global Integrated Circuit (IC) Supply Chain

i0 i1

G1

i2 i3

G2

G3

i4

G4

Design

Manufacturing

Testing and Packaging

Usage

What hardware developers see.

What software developers see.

Integration Circuit (IC) Reverse Engineering

· Netlist recovery by a foundry or end-user threatens intellectual property and facilitates system level exploitation.

Packaged IC

i0 i1

G1

i2 i3

G2

G3

i4

G4

Die

Delayering, Imaging, Recognition

Netlist

· The technology is advancing...

FICS Research SeCurity and AssuraNce (SCAN) Lab
Courtesy of FICS @ UF

Imaging and Circuit Edit Capabilities

2000 µm3/s
FERA3-GMH ( Plasma FIB-SEM)

200 µm3/s
LYRA-3 XMH (Gallium FIB-SEM)

20 µm3/s
Orion NanoFab (He-Ne FIB)

Milling rate

Destructive Nondestructive

Skyscan 2211 (X-ray Micro CT)

100 µm

1 µm

100 nm

10 nm

1 nm

Imaging Resolution

Courtesy of FICS @ UF

Optical Backside Analysis Photon Emission Laser Stimulation/Fault Injection Optical Contactless Probing
Courtesy of Shahin Tajik @ FICS

PHOTON EMISSION ANALYSIS (PEM)

Combinatorial vs. Sequential Logic
Combinatorial Logic: AND, OR, NOT, XORs, etc. Sequential Logic: Counter, Shift Register, State Machines, etc. Presence of Clock in Sequential Logic
Altera MAX V (180 nm)
Courtesy of Shahin Tajik @ FICS

Ring-Oscillator Emission
Identical Switching Frequency by all LEs
Switching frequency independent and generally higher than clock frequency
Applications: TRNG and Internal Clocks

Altera MAX V (180 nm)

Courtesy of Shahin Tajik @ FICS

Conclusions

IC SECURITY REVISITING IOT SECURITY WORKFORCE GENERATION HARDWARE FOR SOFTWARE

THANKS

