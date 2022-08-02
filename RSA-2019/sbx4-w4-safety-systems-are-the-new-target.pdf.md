SESSION ID: SBX4-W4
Safety Systems are the New Target Design Security Using Safety Methods

Marty Edwards
Director of Strategic Initiatives International Society of Automation (ISA)
@ICS_Marty

#RSAC

#RSAC
Disclaimer ...
In this presentation I use examples from several commercial companies. The presenter has collaborated with these companies and has obtained permission to use their material. Mention of these company names or their products is not an endorsement of them by myself or ISA. Some material in this presentation is based upon a series of works entitled "Consequence-Driven, Cyber-Informed Engineering (CCE)" developed by Idaho National Laboratory (INL). The presenter has collaborated with the INL and has obtained their permission to utilize this material.
2

#RSAC
December 2017 - TRITON / TRISIS Hits the news
Attackers targeted the "Safety Instrumented System" or SIS of a Critical Infrastructure organization in the Middle East
3

#RSAC
Review - SIS Overview
The SIS is the "last line of protection"
Typically a very fault tolerant industrial computing device(s) that monitor sensor conditions and shut down a process that is becoming dangerous
Very specialized, and designed using rigorous functional safety methodology and standards
4

#RSAC
Review - Insecure SIS Implementation
SIS should NOT be accessible from any other network
Use isolation techniques, unidirectional gateways, etc.
Attackers gained access to the Engineering Workstation and then modified the programming in the SIS controllers
Resulting in an unplanned shutdown event (fail safe)
5

#RSAC
Question to ask ­ "Why?"
Why did the system designers make this mistake ?? Are there engineering processes or procedures to make sure we don't make the same mistake in the future ?? The good news is "YES" !! We can apply "Functional Safety Analysis" to Cybersecurity
6

#RSAC
Integrating Functional Safety with Cybersecurity

Functional Safety Lifecycle (ISA 84 / IEC 61511)

Cybersecurity Lifecycle (ISA 99 / IEC 62443)

Analyze

PHA, HAZOP, LOPA, SPR

Analyze

Implement Maintain

FAT, SAT, CFAT, CSAT
MOC, eMOC, IR, BCP/DRP

Implement Maintain

 Traditionally, different disciplines
 Yet process safety is dependent upon both
 Integration is critical
 Leverage maturity of safety risk analysis
 Integration at "Analyze" phase is key

#RSAC
Cyber Process Hazard Analysis (PHA)
Cyber PHA
A safety-oriented methodology to conduct a security risk assessment for an ICS / SIS
8

Multi-step, Rigorous Methodology

Cyber Consequence Assessment
i.e. PHA/LOPA Review

Document System
· Arch Diagram · Inventory · Dataflows

Vulnerability Assessment
· Networks · Endpoints · Physical · Policies / Procedures

Partition System
· Zones & Conduits · Catalog vulnerabilities
by zone

Risk Assessment Workshop
· ID consequences (from PHA, etc.)
· ID threat scenarios (kill chain)
· Document safeguards / countermeasures
· Determine risk (risk matrix)

#RSAC
Mitigation Planning
· Develop mitigations (technical, procedural or mechanical)
· Risk Ranked and Prioritized

9

#RSAC
Risk Assessment Workshop ­ Consequence Driven
This is the crucial step !! Identify the consequences of failure (including cyber induced) using established methods
­ Process Hazard Analysis (PHA) ­ Layer Of Protection Analysis (LOPA)
Identify threat scenarios Document safeguards and countermeasures Develop a Risk Register
10

#RSAC
Consequence-Driven Cyber-Informed Engineering (CCE)

Adversary
CONSEQUENCE PRIORITIZATION

Analyst
SYSTEM OF SYSTEMS BREAKDOWN

H4XØR
CONSEQUENCE BASED
TARGETING

Engineer
MITIGATION & PROTECTION STRATEGIES

· How can I cause the most significant damage to your process?

· Is there a cyberbased control system involved?
· Where are the dependencies?

· Where can I attack the system using cyber means?
· Map the ICS Kill Chain

· Design out the cyber risk
· This is NOT application of control system cybersecurity!

Multiple step process, requiring a diverse team of experts with different skills. Ask the hard questions ­ and solve the hard problems

11

Security PHA Review (SPR)

#RSAC

"Hackable" Safeguards ­ Yes or No ?

12

#RSAC
Apply What You Have Just Learned
Ask your plant engineers ­ do we have anything covered by:
o Process Safety Management (PSM) o Environmental Protection Agency (EPA) Risk Management Plan (RMP) o Department of Homeland Security (DHS)
Chemical Facility Anti Terrorism Standards (CFATS)
Do we conduct any of the following:
o Hazard And Operability Study (HAZOP) o Process Hazard Analysis (PHA) o Layer of Protection Analysis (LOPA)
If the answer is yes ­ then you should investigate adding consequencedriven cyber-informed engineering to them
13

#RSAC
ISA Has Training Available!

#RSAC
Q&A ­ For More Information

@ICS_Marty
Join ISA Today !
· Local sections all over the world · Free access to ISA's Globally
Recognized, Consensus Based Standards
­ ISA99 / IEC62443 (Cybersecurity) ­ ISA84 / IEC61508 / 61511 (Safety) ­ And many many others!
· Discounts on training, publications · Visit us at: www.isa.org

Dragos Report
­ https://dragos.com/wp-content/uploads/TRISIS-01.pdf
FireEye Blog / Report
­ https://www.fireeye.com/blog/threatresearch/2017/12/attackers-deploy-new-ics-attackframework-triton.html
Idaho National Laboratory CCE
­ https://www.osti.gov/biblio/1341416-consequence-drivencyber-informed-engineering-cce
International Society of Automation (ISA) Standards
­ https://www.isa.org/standards-publications/

