Using a Vulnerability Description Ontology for vulnerability coordination
- Removing the pain of repetitive analysis of vulnerability reports -
Masanobu Katagi, Takayuki Uchiyama (JPCERT/CC, JP), and Masaki Kubo (NICT, JP)

BIO
· Masanobu Katagi (JPCERT/CC - Vulnerability Coordination Group) · Responsible for vulnerability coordination at JPCERT/CC
· Takayuki (Taki) Uchiyama (JPCERT/CC - Technical Committee Member, Panasonic PSIRT) · Responsible for activities related to vulnerabilities (identification, analysis, coordination, disclosure)
· Masaki KUBO (Cybersecurity Laboratory, NICT) · Responsible for leading technical analysis of darknet monitoring of NICTER as well as NICT-CSIRT operation
2

Today's talk
1. Pain Points in vulnerability coordination at JPCERT/CC
2. Vulnerability Description Ontology (VDO) 3. Application of VDO: JPCERT/CC's case
3

Prevent Watch
Respond

About JPCERT/CC
-Vulnerability Coordination
 Coordinate with developers on unknown vulnerability information
 Secure Coding

-Information gathering / analysis / sharing
-Internet Traffic Monitoring
 Alerts / Advisories

- Incident Handling
 Mitigating the damage through efficient incident handling
 Information sharing to prevent similar incidents

Early Warning Information
Information sharing with critical infrastructure enterprises, etc.
CSIRT Establishment Support
Capacity building for internal CSIRTs in enterprises / overseas national CSIRTs
Industrial Control System Security
Activities to protect ICS, such as incident handling and information gathering/sharing
Artifact Analysis
Analysis on attack methods / behavior of malware (unauthorized program)
Domestic Collaboration
Collaboration with various security communities in Japan
International Collaboration
Collaboration with overseas organizations for smoother handling of incidents and vulnerabilities
4

JPCERT/CC - Vulnerability Coordination

Japan

Overseas
Reporter

CERT/CC (US) NCSC-FI NCSC-NL
Overseas Coordination Centers

Reporter
Information Security Early Warning Partnership
Vendors

Advisory (JVN)

End users
Corporate users
System Integrator
ISP
Developers
Media

5

Bottlenecks in Coordination

· Sudden increase in vulnerability reports the last few years

· 2.4 times more reports in 2016

· Bottlenecks in JPCERT/CC coordination process

· Delay of delivering reports to vendor

1200

1045

· Increased risk for the vulnerable software 1000

· Urgent need to re-think coordination process 800

600

442

462

400

200

108 279 198 234 156 127 141 184 274 209

32

0 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017

Total number of reported vulnerabilities by year (as of 4/25/2018)
https://www.ipa.go.jp/security/english/quarterlyrep_vuln.html

6

Reconsideration of Coordination Processes
Lifecycle of Vulnerability Information at JPCERT/CC
jvn.jp

Triage

Prioritize

Coordinate

Disclose

7

Pain Point #1: Understanding a vulnerability report written in free text format

Free Format!
Hard to interpret what is written in some reports

Triage

Prioritize

But I have to make decision based on my understanding ...

Coordinate

Disclose

8

8

Pain Point #2: Extracting elements of information for scoring CVSS

Free Format!
9

Triage
I have to calculate CVSS score for prioritization

Prioritize

Coordinate
But I have to manually go through each parameter of CVSS while extracting corresponding parameter from the text ...

Disclose

9

Pain Point #3: Going back to Pain Point #1

Free Format!
10

Triage

Prioritize
I'm coordinating more than a few dozen vulnerability at a time

Coordinate

Disclose

Can't remember them all, so I need to go over the original report over and over and over again ... (sigh)

10

Pain Point #4: Writing an advisory

Free Format!
11

Triage

Prioritize

Coordinate

Have to read the report Again!! · Writing two JVN drafts
(Japanese & English) · Technical reviewer also need to
read the original report · Evaluate CVSS score and review
of scoring by the reviewer

Disclose
11

Problem Statement (1)
· Redundancy in coordination process causing:
· Analysis of the same report (at least) twice throughout the process · Since only the original report is stored, the second analysis takes
the same amount of time as the first
12

Problem Statement (2)
· Since vulnerability information is provided in a free format:
· Technical aspects must be extracted
· Affected products / versions · Vulnerability type / How to exploit / Effects / etc.
· Requires interpretation of written language
· What essentially means the same thing can be written in a million different ways
· Language barriers can cause mis-interpretation of subtle nuances
13

Solution: Convert Reports into a Machine Readable Format
Automation: CVSS basic score

Free Format!

Triage

Prioritize

Coordinate

Disclose

Machine Readable Format !!

Automation: Creating JVN advisories

14

How to convert free formatted vulnerability information
into a machine readable format?
15

Today's talk
1. Pain Points in vulnerability coordination at JPCERT/CC
2. Vulnerability Description Ontology (VDO) 3. Application of VDO: JPCERT/CC's case
16

https://web.archive.org/web/19991127120205/http://cve.mitre.org:80/
17

How have we captured vulnerability information?
· almost 20 years industry experience in cataloging vulnerability
· MITRE CVE project started in 1999 · DoE/CIAC around 2000 · CERT/CC Vulnerability started in 2000 · JVN started around 2002 · etc...
· Common elements of information
· Title, summary, affected products, description, impact, patch, workaround...
18

Existing standardization efforts about describing vulnerability
· Common Security Advisory Framework (CSAF) Version 1.2 (2017)
https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=csaf
· Application Vulnerability Description Language (AVDL) v1.0 (2004)
https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=avdl
· Vulnerability Data Model (2013)
https://www.ietf.org/archive/id/draft-booth-sacm-vuln-model-02.txt
19

VDO ­ Vulnerability Description Ontology
· Draft NISTIR 8138 Vulnerability Description Ontology (VDO): a Framework for Characterizing Vulnerabilities (2016)
· Goals of VDO · to enable automated analysis using metrics like CVSS · provide a baseline of the minimum information needed for a vulnerability management process
20

What is VDO?

· Conceptual model of vulnerability

· Defines a set of fundamental building blocks of a vulnerability as well as their definitions, relationships and constrains

· Helps you represent semantics of a vulnerability · Forces you to look at vulnerability in a VDO way

VDO

Vulnerability Advisory

· Information model of vulnerability
· VDO is NOT
· a data model · advisory format · reporting format

Information Model

Data Model

21

Understanding of vulnerability information
Which software is affected? · product name, version

Building blocks (noun groups) of VDO

Product

Type

Technical details?

Impact Method

· vulnerability type,

· attack surface

corresponds to

· conditions of exploitation

Entity Role

· difficulty of exploitation

Barrier

Where an attack comes from?

Impact, Severity? · Which sector uses it?

Context Attack Theater

· Consequence if it is exploited

Criticality

Scope

22

Building blocks of VDO
· VDO is composed of · noun groups ... key elements of vulnerability
· noun group definitions · usage (mandatory, recommended, optional)
· noun group values ... valid values are enumerated and values are chosen
from them
· noun group value definitions
· relationships ... how each noun groups are related to each other
· Let's take a look at the example...
23

Example of noun group - Context

· Definition of Context
· the entity where the impacts are realized from successful exploitation
· Possible Values
· Hypervisor · Firmware · Host OS · ... · Hardware

· Relationships: Entity Role, Impact
Method, Mitigation, Privilege Required, Victim Type
· Zero or many Entity Role values should be associated with Context.
· One or many Impact Method values shall be associated with Context.
· Zero or many Mitigation values may be associated with Context.
· ...

24

Description of a vulnerability
Directory traversal vulnerability in the XCloner plugin 3.1.1 for WordPress and 3.5.1 for Joomla! allows remote administrators to read arbitrary files via a .. (dot dot) in the file parameter in a json_return action in the xcloner_show page to wp-admin/adminajax.php.

25

25

Mapping description to VDO

Directory traversal vulnerability in the XCloner plugin 3.1.1 for

Type

Product

WordPress and 3.5.1 for Joomla! allows remote administrators

Entity Role

Context

Scope

Attack Theater

Barrier

to read arbitrary files via a .. (dot dot) in the file parameter in a

Impact Method
json_return action in the xcloner_show page to wp-

admin/admin-ajax.php.

Technical details (specific to this case) necessary to create PoC code will be lost in VDO :-(

26

26

Raw VDO data

https://csrc.nist.gov/publications/detail/nistir/8138/draft
27

Goals of VDO

Coordination Body

Shared vocabulary Formalized reporting
Researcher/Reporter
Lightweight triage

become part of Reduced analysis overhead

Advisory

VDO

Automated advisory generation
Enables detailed analysis of data

automation
Consumer

Vendor

Statistics
28

Today's talk
1. Pain Points in vulnerability coordination at JPCERT/CC
2. Vulnerability Description Ontology (VDO) 3. Application of VDO: JPCERT/CC's case
29

Solution: Convert Reports into a Machine Readable Format using VDO

Free Format!
VDO

Triage
VDO

Prioritize

Coordinate

Machine Readable Format !!

Disclose
30

Benefit #1: Time saving in Coordinate Phase

Free Format!
VDO

Triage
VDO

Prioritize
I'm coordinating more than a few dozen vulnerability at a time

Coordinate

Disclose

But, easy to understand using VDO

31

31

Benefit #2: More Efficient Coordination Process

Free Format!
VDO

Triage

Prioritize

Coordinate

Automation: CVSS basic score
VDO

Automation: Creating JVN advisories CVSS basic score

32

Disclose
32

JPCERT's case: Toward Automating Advisory Generation
· Define Data representation of VDO · Implement tools
· VDO to CVSS basic score · VDO to JVN advisory

Original Report

VDO

Descriptive text

CVSS
33

Define Data representation of VDO

Original Report

VDO is Information model, NOT a data model

A format to encode VDO
VDO

34

VDO data in a JSON format
· Choose JSON format
· Why? A lot of scripts/tools are utilized
VDO
JSON format

JSON model for VDO
35

Writing a VDO instance
· How to Write a VDO instance ?
· Some editors support autocompletion using a JSON Schema
· Visual Studio Code, Atom
· Generating an HTML form from a JSON Schema
· JSON Editor
· https://github.com/json-editor/json-editor
· Defined & Implemented JSON Schema for VDO
36

Writing a VDO instance with autocompletion

37

37

JSON Schema for VDO
· VDO JSON Schema
· https://github.com/JPCERTCC/vdo-json-schema
38

On-going projects (1/2)
· Tools for automatic advisory generation
· Mapping VDO data to CVSS base score
· VDO includes CVSS v2/v3 concept
· NISTIR 8138 in Appendix shows partial mapping logic
· The "entire" mapping logic needs to be developed
· Conversion VDO data to descriptive text VDO (JVN advisory)
· Our idea
· Use templates of advisory depended on CWE · "Fill in the blanks" of templates from VDO data

Descriptive text
CVSS
39

On-going projects (2/2)
· Refine NISTIR 8138
· The framework of VDO is not mature
· Some noun groups should be discussed
· 1st round of comments sent to NIST and VRDX SIG
· Our findings from the feasibility study in JPCERT/CC · Discussions on comments to follow
40

Future work: VDO as a common language

Free Format!
VDO

Triage
VDO

Prioritize

Coordinate

Disclose

Lightweight

VDO

triage

VDO

automation

Vendor

Consumer
41

Concluding remarks
· Vulnerability Description Ontology (VDO)
· Core information model to describe vulnerability information · Has huge potential to aid
· A format to automatically manage vulnerability information · A common language (Taxonomy) for understanding and exchanging vulnerability
information
· JPCERT/CC
· Defined VDO in a JSON format and implemented JSON Schema · Started a feasibility study of VDO to improve vulnerability management
42

Thank you!

JPCERT/CC Vulnerability Coordination Group E-mail: vultures@jpcert.or.jp

43

43

