SESSION ID: DSO-T08
Using the Hacker Persona to Build Your DevSecOps Pipeline

Robin Yeman
Lockheed Martin Sr. Fellow Lockheed Martin twitter @robinyeman

Dr. Aaron Estes
Lockheed Martin Fellow Lockheed Martin twitter @aaronestes

#RSAC

#RSAC
Agenda
DevOps and Pipeline Securing the pipeline Apply the practices
2

#RSAC
DevOps and delivery pipeline

DevOps
DevOps is "a cross-disciplinary community of practice dedicated to the study of building, evolving and operating rapidly-changing resilient systems at scale." - Jez Humble

#RSAC

#RSAC
Why DevOps
Forsgren, Nicole. "DevOps Solutions | Google Cloud." Google, Google, 22 Aug. 2019, https://cloud.google.com/devops/state-of-devops/.

DevOps Pipeline

Integrated Development Environment

Requirements / Design
D a s h b o a r d
Product Backlog

Version Control

Build Tool(s)

Continuous Integration

Test Framework(s)

Commit & Build Application
Version Control
Commit & Build Infrastructure

Validate Code & Build

API Library
End to End Security
Deploy Application

Validate Automation Package

Deploy Infrastructure

Integration Test

Acceptance Test

Production Deploy

Environments

API Library
Configuration Management

Monitoring

Artifact Repository

Schedule

#RSAC

#RSAC
Securing the delivery pipeline

Threat Modeling
Using IDDIL-ATC Methodology
­ Gain understanding ­ Assess risk ­ Justify security controls

#RSAC
Identify Assets Define the Attack Surface Decompose the System Identify Attack Vectors List Threat Actors Analysis & Assessment Triage Controls

DevOps Pipeline Threat Model

Requirements / Design

Version Control

Build Tool(s)

Continuous Integration

Test Framework(s)

Steal Creds D a s h b o a r d

Integrated Development Environment

Commit & Build Application

Validate Code & Build

API Library
End to End Security
Deploy Application

Version Control

Commit & Build Infrastructure
Hide Malcode

Validate Automation Package

Deploy Infrastructure
API Library

Product Backlog

Environments

Configuration Management

Integration Test

Acceptance Test

Production Deploy

Monitoring

Disrupt Mission
Artifact Repository

Schedule

#RSAC

Attack Surfaces in the pipeline

Requirements / Design

Version Control

Build Tool(s)

Continuous Integration

Test Framework(s)

APT D a s h b o a r d

Integrated Development Environment

Commit & Build Application

Validate Code & Build

API Library
End to End Security
Deploy Application

Version Control

Careless Dev

Commit & Build Infrastructure

Validate Automation Package

Deploy Infrastructure
API Library

Product Backlog

Environments

Configuration Management

Integration Test

Acceptance Test

Production Deploy

Monitoring

Insider
Artifact Repository

Schedule

#RSAC

#RSAC
Defining Persona's
Alan Cooper's the Inmates are Running the Asylum
­ Hypothetical Archetypes ­ Precise & Specific Description of the User ­ Define user's objectives
Lene Nielson's 4 Perspectives
­ Goal Directed ­ Role-based ­ Engaging ­ Fictional

#RSAC
Why Hacker Personas?
Culture & Awareness. Understand adversary tactics & drivers
Prioritize security risks
Communicate generalized attacker profiles that identify common black hat hacker motives and desires
­ What does the attacker like to see ­ identifies exploitable weaknesses
Justify Security Control Selection
­ What does the attacker not like to see ­ identifies effective security controls

#RSAC
How do we "discover" hacker personas?
Threat Types (analogous to User Roles)
­ Advanced Attackers (APTs, Military, Industrial)
Comment Crew, Lazarus Group, Oilrig
­ Hacktivists
Anonymous, Chaos Computer Club, LulzSec, OurMine
­ Insider
Spy, Compromised employee, disgruntled employee
­ Lone Wolf
Iceman, Robert Morris, Julian Assange, Edward Snowden
Sources: anonymous, attack.mitre.org, apt.threattracking.com

Intelligence Sources
Near Range Threats:
· Internal Intelligence · Partner Intelligence
Mid Range Threats:
· Open Source Intelligence (OSINT) · Industry Intelligence
Long Range Threats:
· Homeland Intelligence · Ally Intelligence

#RSAC
Global attacks require global intelligence

FBI cyber most wanted

JSSD

CVNX (APT10)

2PLA

VMTHR (APT3)

Ministry of State Security (MSS) People's Liberation Army (PLA)

#RSAC

Main Directorate of the General Staff of the Armed Forces of the Russian Federation (GRU)

APT1

Zhang Zhang-Gui
Zha Rong Chai Meng

Su Bin
DPRK

Wu Yingzhuo
Dong Hao Xia Lei
IRANIAN DDoS

Park Jin Hyok
Public name: Lazarus Group

#RSAC
Hacker Persona Examples

Careless Developer
Chuck Careless Developer
Skillset:
Degree in computer science with less than five years experience. Explores the latest technology at home with the ability to code in multiple languages
Identification: Real Name: Charles Diavol Alias: Charles 123 Motivations:  Wants to maximize delivery of software  Wants access to use the latest tech and libraries  Reduce workload of perceived overhead work
Frustrations:  Governance and compliance that slows him down  Ever-growing technical debt  Legacy technology

#RSAC
As a Developer I want check-in features quickly so that I can go move on to something else. As a Developer I want avoid administrative work so that I can code which is more fun!
As a Developer I want try the latest technology available so that I can keep my skills current.

17

Malicious Developer

Marty Malicious Developer

Identification:

Skillset:
Extensive coding experience at OS & Kernel level. Develops cyber attack tools. Wants to get paid by his employer as well as his dark web associates.

Real Name: Martin Smith Handles: KRNL KON

Motivations:

 Appear aboveboard and ethical ( follows rules)  Ensure nobody notices I am injecting malicious logic  Take full advantage of weak process to remain undetected

Frustrations:
 Security controls that limit, block or monitor code changes  Inline automated security tools that detect malicious code  Automated / manual testing that discover malicious code

#RSAC
As a Malicious Developer I want inject malicious code so that I can see what happens. As a Malicious Developer I want increasing privilege so that I can view data that has not been shared with me. As a Malicious Developer I want crash the server so that I can deny service to my coworkers.
18

#RSAC
Advanced Persistent Threat (APT)

Annie APT
Skillset:
Highly trained and skilled in cyber attacks of all kinds. Effective social engineer. Skilled at evading detection.
Identification: Real Name: Annie Alvarez Handles: Triple Pez, 3Pez, Pez Motivations:  Use highly effective attacks, including social engineering  Gain Trust, Develop relationships through social media  After compromise, remain undetected to meet objectives
Frustrations:  When I exploit a target without enough privilege to move
forward with my objectives  Security controls that block outbound communication

As a Annie APT I want to eavesdrop on company X and obtain sensitive information that can be sold.
As a Annie APT I want to upload malware on your computer so that I can obtain personal information.
As a Annie APT I want to upload ransomware so that I can extort victims to further my political agenda.

19

#RSAC
Application & Benefits

#RSAC
USING PERSONAS

Annie

I s Annie capable?

Recon
Evaluate Visibility
Personalized Target Engagement

Actor
User Awareness
Falsified Alias

Connection
Detection/Prioritization
Creates Position of Trust

Exploit
Least Priv / Zero Trust
Escalate to malicious content or co-opt behavior

Hacker Persona Benefits
Chuck

#RSAC
"Spatial" (visual) Understanding Identify effective countermeasures Prioritize defenses Measure effectiveness

Coding
Code Bashing
Code security flaw

Build
Automated SAST
Flaw injected into build

Integrate
Automated DAST
Flaw passes integration

Deploy
Continuous Test
Exposure in Production

#RSAC
Positive Shifts

Hacker Personas

Shift Mindset
Culture Shift

Shift Left

#RSAC
"Lessons" on Personas
Change culture "Put on the Black Hoodie" Build and Socialize Personas Agile Security Game ­ Shostack The Phantom Hacker
24

Future
DevOpsSec: Seamlessly integrate security into the implementation pipeline; ensuring
everyone takes responsibility while continuing to shorten feedback loops

Security Team

Feed Back highway
Intelligence highway Security Testing & Data Platform

Security Community

#RSAC

