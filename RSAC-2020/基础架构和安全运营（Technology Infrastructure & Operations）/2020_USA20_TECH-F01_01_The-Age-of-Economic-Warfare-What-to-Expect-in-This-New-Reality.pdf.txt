SESSION ID: TECH-F01
The age of economic warfare: What to expect in this new reality

Galina Antova
Co-Founder Claroty @GalinaAntova

#RSAC

#RSAC
"THE FUTURE Is Already Here --
It's Just NOT VERY EVENLY DISTRIBUTED"
2

#RSAC
Some Have Already Experienced It,
Some Don't Know Yet
Attacks on the Ukraine's power grid in 2015/16 and the subsequent lack of appropriate response from the west, emboldened Russia NotPetya was the most destructive and costly cyber-attack in history NotPetya paralyzed many companies for weeks and had a huge economic impact ­ over $10B It was clearly used as a weapon in a geo-political conflict
3

#RSAC
"It's Not About You, Silly." aka collateral damage

IT

OT

#RSAC
Cyber-Enabled Economic Warfare -
Why Should You Care?
· Every company in the world has OT networks, whether they know it or not
· OT networks are critical to operations which makes them valuable targets, lack many of the basic security controls which makes them hard to defend
· Makes them attractive target for adversaries seeking to advance geopolitical agendas while staying just below the threshold of open conflict
5

The Importance of

#RSAC

"Defending Forward"

Source: https://www.gov.uk/government/news/uk-condemns-russias-gru-over-georgia-cyber-attacks
6

The Known Unknowns ­

Lack of

IT

Telemetry

7

#RSAC
OT

#RSAC
The good news: You already have support from your Board of Directors

#RSAC
Industrial networks are valuable targets for adversaries

We All Know Securing Critical Infrastructures is a Priority

Your Board of Directors is Aligned.

You Already Have a Budget For This.

9

#RSAC
But not many organizations
ARE MAKING FAST PROGRESS

#RSAC
WHY?

#RSAC
In many cases,
THE PROJECT IS MORE INTIMIDATING THAN THE THREAD

#RSAC
We Need to Close the
25+ Year Gap Between IT and OT.
WE DON'T KNOW WHERE AND HOW TO START.

Complexity
Long and complex implementation process

Alignment
Risk of project mis-alignment between teams

Implementation
Complexity in integrating the IT and OT workflows

13

#RSAC
MOST COMMON
PITFALLS In Almost Every Project

Complexity Pitfall:
Using IT-centric practices for OT
Using IT playbooks that are not relevant to OT results in a complex and time-consuming
process

#RSAC
Scenario
Fortune 500 manufacturing company hired a reputable ITSEC consulting company to recommend OT Security solutions
Problem
Applied IT-centric security approach, resulting in a complex solution architecture: · Significant integration complexity (15+ solutions) · 4 years physical segmentation process · Unrealistic recommendations on Headcount · Insignificant risk reduction 6 months into journey

#RSAC
We need a plan we can execute on now

Level 4: Enterprise Zone (IT Domain)
Level 3: Operations & Control
Level 2: Supervisory Control DCS/SCADA
Level 1: Basic Control Level 0: Process Device I/O

Security Operations Center (SOC)

SIEM

Monitoring Analytics

Firewall

ERP

MES

Engineering Operator

HMI

Station Work Station

PLC

PLC

I/O

I/O I/O

I/O

Sensor Pump Actuator Valve

Core recommendations:
· Many IT security controls are not applicable or even harmful to OT networks ­ skip them (EDR on L1/L2, network scanning, etc.)
· Leverage a passive networking technology to identify assets, profile network components and communications, establish baseline models ­ immediate visibility
· Virtual zoning is the most efficient way to monitor the integrity of your zones and conduits within OT. It will also help you with the physical segmentation projects
· Don't delay integration into the IT SOC ­ start with that design in mind, otherwise it will get to complex to do afterwards

16

#RSAC
Alignment Pitfall:
Teams Working on Different Projects

Lack of ownership by security team creates misalignment and delays

Scenario
Large multinational company had 5 different teams working on 7 different OT networks security initiatives
Problem
· No centralized decision making, no clear owner of the OT cybersecurity strategy and implementation
· The different teams had different budgets from different capital allocation
· No/minimal coordination between the teams. They believed their task is not related to the others, although the outcomes were clearly related

#RSAC
Everyone is working on it ... but no one owns it
Core recommendations:
· Recognize that multiple teams have legitimate needs to implement OT projects: from Engineering concerned about asset management to Threat analysts concerned about intrusions
· The most common best practice is for the security to have accountability and responsibility for OT security and coordinate with the rest of the stakeholders
· Identify the requirements and review them with all stakeholders ­ it will be clear multiple requirements can be addressed with the same technology / approach (e.g. virtual segmentation for process control as well as security alerts)
· Ask Engineering to review the proposed technology / approach to ensure they are safe for the ICS systems ­ this will also get their buy-in for the project
18

#RSAC
Implementation Pitfall:
Challenges governing integrated IT/OT

Complete integration of IT and OT governance processes and tech stack could
be an implementation challenge

Scenario
Multinational manufacturing company run into implementation challenges as they were seeking to implement a consolidated governance model across IT and OT, this led them to consider separate SOCs
Problem
· The separate SOCs introduced significant cost redundancy and untenable hiring requirements
· This proposal further isolated OT network governance rather than incorporating it into existing practices
· Re-creating existing governance, doubling effort & coordination

#RSAC
How to implement consolidated governance
Core recommendations:
Start with identifying the core processes and think about what it will take to extend them to cover OT ­ rather than selecting the OT technologies in vacuum and then trying to integrate them back into the SOC / process (e.g. vulnerability management)
Have a playbook of how to handle OT-specific alerts and escalation procedures of when OT engineers need to be involved. Granular OT relevant details are needed in order to effectively brief Engineering.
Create an orchestration playbook and automate some of the IT actions that are common to OT scenarios as well
Leverage your existing IT analysts to triage OT alerts as well ­ with initial training and playbooks, they should be able to handle them. Hiring ICS cyber specialists is a more challenging task
20

#RSAC
Integration of OT Operations in Existing Tech Stack

Fundamental Risk Controls Extended to OT Networks

Input from OT to SOC Processes

Asset Inventory Change Management

Alerts & Asset info Vulnerability Intel

Level 1

· Monitoring · Initial Investigation · Open tickets

Vulnerability Management Threat Detection & Response Network Segmentation Security Training Ongoing Risk Compliance Posture

Context on OT Alerts OT Playbooks on Mitigations
Advanced Network Monitoring Threat Intel

Level 2 Level 3

· In-depth Investigation
· Recommended Mitigation Steps
· Threat Monitoring · Forensics · Prevention

21

#RSAC
BRINGING IT
ALL TOGETHER

#RSAC
"Apply" Slide ­ What you can do in the next 6-9 months
Acknowledge the new reality and its implications:  Your organization likely has significant blind spots and lacks telemetry from the OT networks  Those OT networks are critical, therefore valuable to adversaries and will be likely targets in escalating geo-political conflicts  Perform a risk-based assessment of your OT network to establish the baseline from which you're starting
Avoid the common complexity pitfall:  Don't bother with IT security controls that are not applicable or even harmful to OT components ­ e.g. EDR at L1 of the Purdue model  Gain maximum visibility in short period of time by using a passive networking technology to identify assets and profile the communications  Implement virtual zoning within the OT in parallel to your planning of the physical segmentation project.  Plan the integration of the new OT capabilities into the existing SOC technology stack ­ start with that design work early on
Address the misalignment challenge:  Acknowledge the requirement that multiple teams are stakeholders in improving the security posture of the OT networks  However, ensure that you have one ultimate owner with accountability and responsibility for OT security ­ most typically the Security organization and ensure they
are consulting the rest of the stakeholders  Identify the requirements and review them with all stakeholders since multiple requirements can be addressed with the same technology  Get buy-in from the OT engineering team by asking them to review the security requirements and asking them to validate the safety of chosen technologies
Ensure the implementation successes:  Start with reviewing the core processes and security metrics and think about what it will take to extend them to cover OT, rather than starting with tech solutions first  Develop a playbook of how to handle OT-specific alerts and escalation procedures of when OT engineers need to be involved (get expert help with those if needed)  Create an orchestration playbook and automate some of the IT actions that are common to OT scenarios as well, this will save you time once it's operationalized  Leverage your existing IT analysts to triage OT alerts as well ­ ensure you select technology that gives you very contextual information that be leveraged
23

#RSAC
QUESTIONS?
@GalinaAntova

