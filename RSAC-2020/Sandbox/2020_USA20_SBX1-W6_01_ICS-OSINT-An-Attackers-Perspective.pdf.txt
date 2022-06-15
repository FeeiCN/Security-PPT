SESSION ID: SBX1-W6
ICS OSINT: An Attacker's Perspective

Selena Larson
Intelligence Analyst Dragos | Threat Intelligence @selenalarson

Amy Bejtlich

Director of Intelligence Analysis Dragos | Threat Intelligence @_Silent_J

#RSAC

Goals
1. Provide an OSINT primer 2. Raise awareness 3. Understand the adversary 4. Recommend mitigations
2

What is OSINT?
OSINT
· Legally collected · Publicly available · Informs investigations,
reporting, attacks, or defense
3

OPSEC
· Means & methods to
deny adversary info · Discover could lead to
failure or compromise

Why OSINT matters in ICS
4

OSINT characteristics
Applications Offense vs. Defense

Methods
Active vs.
Passive

5

OSINT sources
Search Engines
Social Media

News Sites

Vendor Sites
Legal Resources

Job Listings

OSINT Sources
6

Recon Tools

The OSINT process
Source ID

Processing &
Integration

Results Delivery

Data Harvesting
7

Data Analysis

Key Terms
Personal/Personnel Information
­ Allows for identification of critical personnel, general personnel, or outside source personnel (e.g. contractors, third party operators)
Criticality Information
­ Informs an adversary of the impact of an attack for a target's continued operations. A target's criticality is determined if its compromise or destruction has a highly significant impact in the overall organization and it's ability to conduct business or operations.
Accessibility Information
­ Informs the adversary of the ability or method to remotely/physically access or egress from a target.
8

Key Terms
Recoverability Information
­ Gives an adversary insight into the ability for a target's process, system, or network infrastructure to recover from an attack or compromise.
Vulnerability Information
­ Informs an adversary of a vulnerability that exists in target's infrastructure, processes, or response actions.
Effect Information
­ Information about the amount of direct or indirect loss a target would have from an attack or compromise. Also information on the effects losses would have on the target, it's organization, processes, or operations.
Recognizability Information
­ Assists adversaries in the ease of identifying targets for operational gain and the level of obscurity that the target has from both internal and external sources.
9

Why target ICS?
Value
­ Strategic: Attacks on ICS entities like oil and gas or electric utilities can be used to further political, economic, and national security goals. Understanding critical infrastructure can put an adversary at a tactical advantage.
­ Monetary: Companies willing to pay ransoms to limit downtime.
Ease
­ Legacy operating systems in use across various environments. ­ Limitations on patch management and insufficient external mitigations. ­ Default passwords
Example: During a pentest, a colleague identified a default password on a device that the operator did not know about following an outage + replacement.
10

Dragos case study
How a Dragos sales rep socially engineered a vendor
11

Example: SEC 10-K
EDGAR: US SEC information repository for publicly traded companies (e.g. 10-K)
­ Financial information, key personnel, names/addresses of major common stock holders, summary of legal proceedings, etc.
Manufacturer of health and security devices
­ Legal proceedings, M&A, updates to enterprise resource planning system, governments/agencies, name of accounting company that submitted filing
­ Define appropriate controls for the database
Possible use: phishing campaigns or supply chain attacks
12

Example: Documents
June 2019 NYC blackout
­ ~6 hours; 72,000 affected; caused by primary/backup system malfunction
Publicly available documents
­ 2014-2020 upgrades to specific, decades old RTUs across sites (including affected substation)
­ Protection relay connection to Energy Control Center (new and old configurations) is serial
Modifying protection relay setting requires engineers onsite
Not cyber, but useful to understand the lay of the land
13

Vendor websites

­ "Power plants Termoeléctrica del Sur, de Warnes and Entre Rios inaugurated in August and September"
­ "Siemens added 14 SGT-800 gas turbines, 11 SST-400 steam turbines with condensers, 22 steam generators, and the SPPAT3000 instrumentation and control system to the three power plants. In combined cycle mode, it was possible to increase the plant efficiency from 40 to 51 percent."
­ Exact names and locations of Bolivian plants.
14

Vendor websites

Pharmaceutical company details Rockwell integration/use:
­ "Lonza will use PharmaSuite MES software, along with FactoryTalk InnovationSuite software to better trace product down to the individual capsule carton and gain insights into performance and production. A segregation of SAP and PharmaSuite MES will also help avoid the disruption of in case of a global enterprise resource planning ERP shutdown..."
15

Third-party software and services
16

Shodan
17

Job postings
18

Government data
19

Dragos case study
Activity group targeting western energy company
­ Early attack planning; heavy reconnaissance on outward infrastructure ­ Goal: develop targeting, inform operational planning, predict defender
response
Adversary obtained specialized knowledge required for successful attack
­ List of generation stations ­ Engineering diagrams ­ Information relating to islanding events and responses to grid instability ­ Outage and services maps
20

Dragos case study
Newly registered domains mimicking Middle Eastern ONG & Australian mining entities Sent links to corporate leadership via LinkedIn DM with "project proposal" lure
­ Credential capture webpages; spoofed logins used for remote credential replay across victims network for initial access
Key takeaway: unique attack vector; reflects ICS-targeting trend
21

Defense & mitigations
Conduct regular OSINT assessments
­ Identify and limit information available about vendors and partners; documents, schematics, data sheets; job advertisements; credentials in public dumps; identify gaps in security architecture
Implement compensating controls
­ Implement authentication gateways to sensitive documents; mandate multifactor authentication and user awareness; document and assess OSINT value to an adversary
22

OSINT Collection Risk and Vulnerability Matrix
23

References
· https://www.nytimes.com/2019/07/15/nyregion/nyc-blackout-con-edison.html
· https://www.sec.gov/Archives/edgar/data/1039065/000104746919004853/0001047469-19-004853-index.htm
· https://press.siemens.com/global/en/pressrelease/three-expanded-power-plants-deliver-additional-1-gw-bolivia
· https://ir.rockwellautomation.com/press-releases/press-releases-details/2019/Lonza-Selects-Rockwell-Automationfor-Digital-Transformation-of-Pharmaceutical-Operations/default.aspx
· https://download.schneider-electric.com/files?p_enDocType=Customer+success+story&p_File_Name=99820020509_GMA-US_Thu+Thiem+Power_X1A.pdf&p_Doc_Ref=998-1284-02-04-15AR0_EN
· https://www.themuse.com/jobs/northropgrumman/senior-principal-industrial-controls-engineer-manufacturingoperations?utm_campaign=google_jobs_apply&utm_source=google_jobs_apply&utm_medium=organic
· Shodan.io · Casey Brooks, Senior Adversary Hunter, Dragos (OSINT Collection Risk Framework)

THANK YOU
https://dragos.com Twitter: @DragosInc LinkedIn: DragosInc
25

