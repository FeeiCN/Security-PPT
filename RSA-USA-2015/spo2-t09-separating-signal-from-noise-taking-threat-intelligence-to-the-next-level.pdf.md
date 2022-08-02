SESSION ID: SPO2-T09
Separating Signal from Noise: Taking Threat Intelligence to the Next Level

Doron Shiloach
X-Force Product Manager IBM
@doronshiloach

#RSAC

#RSAC
Agenda
 Threat Intelligence Overview  Current Challenges  Solutions  X-Force  Questions
2

#RSAC
The Threat Intelligence Market is growing ...

 SANS Cyber Threat Intelligence Summit 2014
 3 Courses, 2 Instructors

 SANS Cyber Threat Intelligence Summit 2015
 5 courses, 6 instructors

 Threat Intelligence services market size 2013*
 $250M in 2013

 Threat Intelligence services market size 2018*
 $1.5B in 2018

*Gartner, Competitive Landscape: Threat Intelligence Services, Worldwide, 2015, October 2014 G00261001

#RSAC
... and maturing from an industry perspective
 Definition of threat intelligence
 `Evidence-based knowledge, including context, mechanisms, indicators, implications, and actionable advice about an existing or emerging menace or hazard to assets that can be used to inform decisions regarding the subject's response to that menace or hazard.'*
 Importance as part of any organization's suite of tools
 The criteria for evaluation is coalescing, for example ...  Where is it sourced from?  How often is it updated?  Is it vetted by humans?  Does it focus on a specific industry?
*Gartner, Definition: Threat Intelligence, Rob McMillan, May 2013, refreshed September 3, 2014, G00249251

#RSAC
Threat intelligence does help

Utilization of threat intelligence can yield a significant reduction in security incidents, as well as speed to respond

Security events

Security attacks

Security incidents

Annual 91,765,453

Annual 16,857

Annual 109.37

Monthly 7,647,121

Monthly 1,405

Monthly 9.11

Weekly 1,764,121

Weekly 324

Weekly 2.10

Security Intelligence Correlation and analytics tools

Security Intelligence Human security analysts

Events: up 12% year on year to 91m
Observable occurrences in a system or network

Attacks: Increased efficiencies achieved
More efficiency in security processing to help clients focus on identified malicious events

Incidents: up 22% year on year
Attacks deemed worthy of deeper investigation
5

Security teams are using multiple sources of #RSAC intelligence to identify cyber threats

65%

of enterprise firms use external threat intelligence to enhance their security decision making *

Analysts can glean insights from a wide variety of sources

Data allows analysts to generate alerts

Time spent on analysis can be applied to implementation

*Source: ESG Global

#RSAC
Agenda
 Threat Intelligence Overview  Current Challenges  Solutions  X-Force Exchange  Questions
7

#RSAC
Security teams are using multiple sources of intelligence to identify cyber threats ... the other side

65%

of enterprise firms use external threat intelligence to enhance their security decision making *
However, security teams lack critical support to make the most of these resources

Analysts can't separate the signal from the noise

Data is gathered from untrusted sources

It takes too long to make information actionable

1 Source: ESG Global

#RSAC
Operationalizing it can be costly and complex

When shopping for intelligence sources, organizations can be overwhelmed by choices as well as the cost and complexity to operationalize and gain a
return on investment

Internal

Firewall logs
Web logs
Email logs
CSIRT incidents

Proxy logs
Application logs

IDS/IPS logs

Endpoint security
logs

Authent-

Malware

ication logs detection logs

Employee directory
SSO/ LDAP context

Network Security
logs
Vulner- ability patch mgmt

Building access logs

Fraud payment logs

Application inventory

DNS/

Call/

Website

DHCP logs

IVR

marketing

logs

analytics

Ever-increasing proliferation of cyber threat intelligence feeds

External

Top tier phishing indicators

Brand abuse phishing indicators

Malware campaigns/ indicators

Staff asset / credentials

Customer asset / credentials

Threat landscape
intel (TTPs)

Law enforcemt
threat intel

Industry threat intel sharing

Public sector threat intel

Fraud payment logs
Intel as a service (IaaS)
ISAC threat intel

IP reputation
intel

Passive DNS intel

OSINT sentiment Undergd

analysis

dark Web

intel

Actor intel/indic
ators
Human Intel
(HUMINT)
Technical Intel
(TECHINT)
Malware Hashes /
MD5

Advanced analytics and human intelligence must be applied and integrated into the organization to leverage the value of all the data
9

#RSAC
Agenda
 Threat Intelligence Overview  Current Challenges  Solutions  X-Force  Questions
10

#RSAC
Key capabilities in a solution
 Know everything about the particular observable that starts your investigation, i.e. historical information
 Know everything your colleagues in the same industry know about that particular observable
 Apply everything you and your colleagues know to the controls that exist in your infrastructure in order to better protect your organization

#RSAC
Threat intelligence sharing has become essential
 The bad guys are doing it  It helps provide insight, context, and confidence with respect to the
information that is being observed, i.e. an isolated attack or part of a broader industry-wide attack  It benefits both the organization and the broader community  Ranges from technical information on a particular piece of malware to more strategic, unstructured content
12

#RSAC
The current state of threat intelligence sharing
 E-mail and informal gatherings  ISACs ­ Information Sharing and Analysis Center
 Financial Services, National Health, Information Technology
 Threat Intelligence Platforms
 Dynamic market with both established players and startups
 Machine Readable Threat Intelligence
 STIX - Structured Threat Information Expression  TAXII ­ Trusted Automated Exchange of Indicator Information  Cybox ­ common structure for cyber observables
13

The real value of threat intelligence lies in its

#RSAC

application to your business ­ to turn insight into

action

Without insight, organizations struggle to understand and stay ahead of the threat
 Potential attacks can be overlooked if the attacker's methods and motives are unknown

 Armed with this intelligence, organizations can take action ahead of threat to proactively adapt security strategy, remediate vulnerabilities and monitor for impact

 By applying intelligence upfront, an organization can optimize security resources, increase efficiencies, reduce costs and improve risk management

14

#RSAC
Agenda
 Threat Intelligence Overview  Current Challenges  Solutions  X-Force  Questions
15

#RSAC
X-Force: Advanced Security & Threat Research
The mission of X-Force
 Monitor and evaluate the rapidly changing threat landscape  Research new attack techniques and develop protection for
tomorrow's security challenges  Educate our customers and the general public  Distribute Threat Intelligence to make IBM solutions smarter
16

#RSAC
Access to a broad range of threat intelligence data
Threat indicators
· IPs, URLs, vulnerabilities, web applications, malware · Additional context
· Passive DNS, historical information · Pivoting on each observable · Anonymized customer information
Sources
· Machine-generated intelligence from crawler robots, honeypots, darknets, and spamtraps
· Multiple third party and partner sources of intelligence

#RSAC
Additional correlation is key to insights
Cross-reference the following information
· Customers targeted · Industries affected, i.e. % of healthcare, financial,
manufacturing, etc. · Attack sequence and tools · Vulnerabilities affected
Benefits
· Reduction of false positives by validating against multiple criteria
· Prioritization of attacks
18

#RSAC
An integrated solution helps tie information to action

Endpoint Protection
Network Protection
SIEM

STIX / TAXII API

The foundation for integration
· Threat intelligence dynamically updated on a minute-by-minute basis
· Each product/service can access information from the others
Examples
· SIEM products can act on and get context from threat intelligence
· APIs provide technical users the ability to build the proper solutions, with the most flexibility

Share information among teams

Collects latest new indicators of compromise

INCIDENT RESPONDER

#RSAC

SECURITY ANALYST

Applies IOC information to products to remediate and prevent intrusions

Human intelligence is the difference
· Different perspectives on the same set of information
· Each user has own requirements/use cases

Threat Intelligence Platform

CISO

MSSP

Communicate with clients and provide information

Understands high-level threat landscape and status of issues via dashboard of information

#RSAC
Steps you can take today ... on tools
 Understand your threat intelligence
 Relevance  Integration  Efficiency in sharing among products and teams
 Understand machine readable threat intelligence
 STIX ­ stix.mitre.org  TAXII ­ taxii.mitre.org  Cybox ­ cybox.mitre.org  APIs ­ RESTful, JSON, XML, etc.

#RSAC
Steps you can take today ... on processes
 At a security team level
 Identify information you have  Collaborate effectively
 Within the organization  With other colleagues in the industry, i.e. ISACs
 At a company level
 Team with CIO/CISO  Understand and address silos and legal issues
*Source: Rick Holland, Forrester Research

#RSAC
Agenda
 Threat Intelligence Overview  Current Challenges  Solutions  X-Force  Questions
23

