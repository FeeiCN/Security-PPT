SESSION ID: ANF-F03
Achieving Defendable Architectures via Threat-Driven Methodologies

Michael Muckin
LM Fellow, Cyber Architect Lockheed Martin

Scott Fitch
LM Fellow, Cyber Architect Lockheed Martin

#RSAC

#RSAC
The system shall encrypt data at rest.
2

#RSAC
The Threat Driven Approach

System Threat Analysis

Threat Intelligence

3

#RSAC
Threat Intelligence

Analysis

1

Reconnaissance

2

Weaponization

3

Delivery

4

Exploitation

5

Installation

6 Command & Control

7 Actions on Objectives

Synthesis

#RSAC
System Threat Analysis Methodology
There are no IDDIL (idle) Threats; they ATC (attack)

Identify the Assets

Define the Attack Surface

Decompose the System

Discovery Phase

Identify Attack Vectors

List Threat Actors

Analysis and Assessment Triage Controls
5

Implementation Phase

#RSAC
System Threat Analysis Methodology

Mission Needs

System Threat Analysis

Threat Intelligence

Critical Assets

Identify the Assets

Targeted Assets

Define the Attack Surface

Tactics, Techniques, & Procedures

Decompose the System

Identify Attack Vectors

Tactics, Techniques, & Procedures

Knowledge of Industry

List Threat Actors

Campaigns, Motivation, Skill

Mission Impacts

Analysis and Assessment Triage Controls
6

Inputs on likelihood Control Effectiveness

#RSAC
Threat Methodology Integration

I D D I L

Threat Modeling & Analysis
A T C

Testing Aligned to Threat Model

Concept

Reqs

Design

Build

Test/QA

Deploy

Ops

Threat Actors, TTPs, Existing Controls

Infrastructure & Service Enhancements
Threat Intelligence

Current TTPs and Targeting Intel

7

#RSAC
Threat Methodology Practices
 Threat Models  Attack Trees  Threat Profiles  Cyber Kill Chain®  Controls Effectiveness Matrix
8

Case Study

Provisioning Credentialing PKI Interface Physical Security HR Interface
Critical Roles: Role A Role X Service Acct
9

#RSAC
Assets:  Smart Card
 OS and Applet  ID codes  Keys  I&AM Systems  Workstations  Facilities
Threat Actors/Attack Vectors: 1. Man-in-Manufacturer (a) 2. Man-in-Manufacturer (b) 3. Interception of Master Key 4. Compromise of I&AM System 5. Malicious Insider 6. Compromise Critical Role 7. Compromise middleware 8. Physical attacks

Determining Focus Threats
System Threats

Physical Attacks

Malicious Code on Card

Compromised Middleware

Lateral Movement

Mission and Business Needs

Disclosure of Keys Critical Role Exploited Malicious Insider

10

#RSAC
Focus Threats
Threat Intelligence
Adversary Objectives TTPs

Addressing Threats

Asset/ Objective
SmartCard OS

Threat Types
· Tampering · Disclosure · Elevation of Privilege · Lateral Movement

Resultant Condition(s)
Dependent upon # of cards and level of access of user

Attack Surface/ Vector
· Card · Card OS code · APDU manipulation

#RSAC
Controls
· Code Audits · Contract language · Privileged account
restrictions

Critical Role Workstation

· Spoofing · Repudiation · Elevation of Privilege · Lateral Movement

Unauthorized, privileged and potentially untraceable activity to critical infrastructure

· I&AM Systems · Specific interfaces · Specific services · Targeted user and
service accounts

· Disclosure · Elevation of Privilege · Lateral Movement

Exfil data and/or credentials; Use machine as foothold for further actions

· SmartCard · Middleware · Memory

11

· Admin gateways · Multi-factor AuthN · Local accounts
wherever possible · Privileged account
password controls
· System patching · HIPS · Memory protections · Penetration testing /
assessment · Configuration controls

#RSAC
Defend the System as a Whole
 Visibility into current and historical system activity
 Manageability of system configuration, updates, and control settings
 Survivability to deliver services through attack, detection, and recovery
12

Designing for Defense
Provisioning Credentialing PKI Interface Physical Security HR Interface
Critical Roles: Role A Role X Service Acct
13

#RSAC
 Visibility
 Server logging  Workstation
logging  Network
monitoring  Cardstock
inventory  Insider detection

Designing for Defense
Provisioning Credentialing PKI Interface Physical Security HR Interface
Critical Roles: Role A Role X Service Acct
14

#RSAC
 Visibility  Manageability
 Rules based on new threat intel
 Control points for tactical mitigations
 System patching  Controlled
admin access

Designing for Defense
Provisioning Credentialing PKI Interface Physical Security HR Interface
Critical Roles: Role A Role X Service Acct
15

#RSAC
 Visibility  Manageability  Survivability
 System segmentation
 Strong admin authentication
 Separate card use from issuance
 Assured system recovery

#RSAC

System Threat Analysis

Threat Intelligence

Use IDDIL/ATC to select protection and appropriate compensating controls Design the system to be defended through visibility, manageability, and survivability

16

Building Defendable Architectures and

#RSAC

Applying Threat-Driven Methodologies

Start identifying your organization's critical systems and assets
For the next system you build, modify, operate, or assess Use IDDIL/ATC to select protection and appropriate compensating controls Design the system to be defended through visibility, manageability, and survivability
As your cyber defense capabilities mature Integrate threat intelligence into design, development, and operations

17

#RSAC
http://lockheedmartin.com/cyber
18

