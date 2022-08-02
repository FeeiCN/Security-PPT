August 7, 2019
CYBERSECURITY RISK ASSESSMENT FOR SAFETY-CRITICAL SYSTEMS
AUTHORS: DR. LY VESSELS, DR. DANIEL JOHNSON & DR. KEN HEFFNER

MOTIVATIONS
· Lack of available tools to model security risks
· Currently available tools focuses on threat modeling · Requires extensive security knowledge to use · Time consuming to model an enterprise · Focuses more on enterprise instead of critical infrastructure systems
· Currently available security risk assessment
· Depends on experts with deep knowledge in security and mathematics to calculate the probabilities and risks
· Manual computation that is time consuming and error-prone
A repeatable framework is needed to rapidly and easily assess the security risk of the existing space systems.
Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

HONEYWELL SECURITY RISK ASSESSMENT FRAMEWORK

1 Create Security
Architecture

2 Assign Security Scores

Water Fall
Method

· Based on RTCA DO326A and DO-256

3 Create Security Models

· Consists of Five major Steps

4 Define Threat
Scenarios
5
Determine Acceptability

An iterative with feedback process to rapidly assess risks of a system.
Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

1 CREATE SECURITY ARCHITECTURE

1. Determine the Security Perimeter
2. Determine the security-relevant assets of the system · Primary Assets are functions or data that must cannot compromised
· Secondary Assets are assets that support the primary assets
· Security Functions / Security Data are secondary assets
3. Determine external systems
4. Determine connections

Security environment Security Perimeter

Asset

Asset

System

Asset

System

Attacker

Security Architecture is the based to all the steps of the framework.
Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

1 AN EXAMPLE OF CREATE SECURITY ARCHITECTURE

SpaceX Example

White Sands Security Architecture

Orion Payload
Orion CEV

Communication Relay Satellite

Satellite Communication
System

Spectrum Spoof
Spectrum Security

General Attacks
Network Security

Wallops

Guam

White

Sands

Cloud

ARES V

Mission Network

Network Command & Control Data System (NCCDS)

Institutional Network

Internet

Footer, Arial Bold 10pt

White Sands Network

Mission System 2

Security Perimeter

Mission System 1

Security Environment

Mission System 3

Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

2 ASSIGN SECURITY SCORES

1. Identify Attackers, and assign
· Name (F.*) · OCCURRENCE values (OCC)
2. Identify Vulnerabilities, and assign
· Name (F.*) · PREVENTION values (PREV)
3. Identify Security Measure, and assign
· Name (O.*) · Vulnerabilities
4. Identify Attack Vector,
· Assign a Name(AV.*) · If one exist, assign the Secure Measure and the Attacker, Access
Vectors, or Threat Conditions
5. Identify Threat Conditions,
· Assign a Name(TS.*) · If one exist, assign the Secure Measures and Attacker, Access
Vectors, or Threat Conditions
6. Identify the Asset and assign a Name (I.*)

SpecAtru.smpectrum SpOoofCC = 7

A.gGeennerealral OCAttCack=s 9

F.spec.seScpectrumO.spec. PREV = 5Security sec

O.Nneettw. ork F.net.sec sSeeccurity PREV = 5

AV.spec.sec

AV.net.sec

White Sands

Network

T.spec.sec.hijack T.net.sec.hijack

Mission
I.Ssyysstetemm21

Mission
SI.yssytesmte3m3

Mission

System 1
I.system2
Security Perimeter

Security Environment

Security Scores are the inputs to the Honeywell Security Modeling Engine.

Footer, Arial Bold 10pt

Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

3 CREATE SECURITY MODELS & CUTSETS
cutset

White Sands Security Architecture
General Attacks

Network Security

White Sands Network

Mission System 2
Security Perimeter Security Environment

Mission System 1

Mission System 3

Honeywell Security Ontology and Threat ­ based Modeling Engine

inputs into

generates

Cutset Attackers are the lowest level leaf node and shows
who can attack.

T.net.sec.hijack Cutset Probability is

P = 2.00E-05

probability of the top node

SEV = 5

AV.net.sec
P = 2.00E-05 SEV = 5

O.net.sec
P = 2.00E-05 SEV = 5

Cutset Internal Nodes are secondary target of attack

O.Vul.net.sec
P = 1.00E-05 SEV = 5
F.net.sec
P = 1.00E-05 PREV = 5

O.Att.net.sec
P = 1.00E-01 SEV = 1

A.general
P = 1.00E-01 OCC = 9

Cutset Vulnerability is the lowest leaf node and shows how it is vulnerable

Cutsets are collections of vulnerabilities and attackers sufficient to cause the

threat conditions, and they are used to generate threat scenarios.

Footer, Arial Bold 10pt

Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

4 DEFINE THREAT SCENARIOS
Use the cutsets to create Threat Scenarios by group cutsets within a threat scenario.

T.net.sec.hijack TP.n= e2.t0.0sEe-0c5.hijack STEP.Vn==e25.t0.0sEe-0c5.hijack
SEPV==25.00E-05 SEV = 5
AV.net.sec P =A2V.0.0nE-e0t5.sec
SEPV=A=2V5.0.0nE-e0t5.sec
SEPV==25.00E-05
O.net.seSEcV = 5 P = O2.0.n0Ee-0t5.sec
SEPV==O25.0.n0Ee-0t5.sec
SEPV==25.00E-05 SEV = 5

O.Vul.net.sec PO=.1V.0u0lE.-n05et.sec SEPOV==.1V5.0u0lE.-n05et.sec
SEPV==15.00E-05
F.net.seSEcV = 5 P = 1F..0n0Ee-t0.5sec
PRPEV= 1=F..50n0Ee-t0.5sec
PRPEV= 1=.500E-05 PREV = 5

O.Att.net.sec PO=.1A.0t0tE.-n0e1 t.sec SEPOV==.1A1.0t0tE.-n0e1 t.sec
SEPV==11.00E-01
A.generSaElV = 1 P = A1..0g0eE-n01eral
OCPC==A1.9.0g0eE-n01eral
OCPC==1.900E-01 OCC = 9

White Sands Cutsets

inputs into

generates

Threat Scenarios

Threat Scenarios SEV Mitigated

Risk

Probabilities Level

TS.general.attack. 5 ground.to.satellite

3.04E-06

-0.5

Honeywell Security Risk Calculation Engine

Honeywell Security Risk Calculation Engine consolidates and computes the given cutsets into a single security risk number for a given threat scenario.
Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

5 DETERMINE ACCEPTABILITY

Determine Acceptability using the Security Acceptability Matrix

Threat Scenarios

Threat Scenarios SEV Mitigated

Risk

Probabilities Level

lookup

Acceptability Matrix

TS.general.attack. 5 ground.to.satellite

3.04E-06

-0.5

Acceptable Risk for spectrum spoofing from the
ground to satellite

Security Risk Assessment Framework provides a security risk score and the complete traceability for how it was computed.

Footer, Arial Bold 10pt

Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

NEXT STEPS
· End-to-end automation to provide
· Rapid security risk assessment · Ease of the process · Lessen the dependency on an expert knowledge
· Standardize on the scores assigned to the vulnerabilities and attackers.

A method for assessing the cybersecurity risk of space systems.

Footer, Arial Bold 10pt

Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

IN SUMMARY
· More and more space systems will be targeted for monetary, nation-state, and establish creditability
· Many of the existing safety-critical systems
· Was designed without any security safeguards · Has hidden vulnerabilities that are exploitable · Unknown understanding of its security risks
· Honeywell has developed a Security Risk Assessment Framework (based on RTCA standards) to asset critical-infrastructure such as space systems

Footer, Arial Bold 10pt

Honeywell Confidential - ©2019 by Honeywell International Inc. All rights reserved.

Dr. Ly Vessels Cybersecurity Architect Ly.Vessels@honeywell.com
Dr. Daniel Johnson Engineer Fellow Daniel.p.Johnson@honeywell.com
Dr. Kenneth Heffner Senior Engineer Fellow Kenneth.h.Heffner@honeywell.com

Footer, Arial Bold 10pt

12

