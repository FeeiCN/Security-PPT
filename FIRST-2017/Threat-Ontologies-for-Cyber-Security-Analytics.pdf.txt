THREAT ONTOLOGIES FOR CYBER
SECURITY ANALYTICS (TOCSA)
FIRST Conference 2017 Martin Eian
meian@mnemonic.no

About Me
·Senior Security Analyst at mnemonic ·Project Manager «Semi-Automated Cyber Threat Intelligence (ACT)» ·Project Manager «Threat Ontologies for Cyber Security Analytics (TOCSA)» ·Member of the Europol EC3 Advisory Group on Internet Security

Motivation ­ mnemonic statistics from 2014

150 critical security incidents
14300 security incidents
1 trillion events

Threat Intelligence (TI) ACT

Incident Response (IR)

Today

Raw Data

ACT, TOCSA and Oslo Analytics
·Semi-Automated Cyber Threat Intelligence (ACT) -Open Source Threat Intelligence Platform
- https://www.mnemonic.no/research-and-development/semi-automated-cyber-threat-intelligence/
·Threat Ontologies for Cyber Security Analytics (TOCSA) - Ontologies -PhD Project
- https://www.mnemonic.no/no/research-and-development/threat-ontologies-for-cybersecurity-analytics/ - http://www.mn.uio.no/ifi/english/research/projects/tocsa/
·Operable Subjective Logic Analysis Technology for Intelligence in Cybersecurity (Oslo Analytics) - Analytics -Subjective Logic (quantifying uncertainty) -Trust Networks - Academic
- http://www.mn.uio.no/ifi/english/research/projects/oslo-analytics/

Academic Paper: «Semantic Cyberthreat Modelling»
·Extended abstract presented at the Semantic Technology for Intelligence, Defense, and Security (STIDS) 2016 conference
- http://stids.c4i.gmu.edu/
·Collaborative work:
-Threat Ontologies in Cyber Security Analytics (TOCSA) -Operable Subjective Logic Analysis Technology for Intelligence in Cybersecurity (Oslo Analytics) -Semi-Automated Cyber Threat Intelligence (ACT)

THREAT INTELLIGENCE

What is Threat Intelligence?
Threat intelligence is evidence-based knowledge, including context, mechanisms, indicators, implications and actionable advice, about an existing or emerging menace or hazard to assets that can be used to inform decisions regarding the subject's response to that menace or hazard.
- Gartner (2013)

Evidence-Based Knowledge

Evidence-Based Knowledge
www[.]iuqerfsodp9ifjaposdfjhgosurijfaewrwergwea[.]com

Threat Intelligence Categories

Long Term

· Attribution · Goals · Strategy
Strategic

· Tactics · Techniques · Procedures
Tactical

Short Term

Operational Technical

· Campaigns

· Tools · Artifacts · Indicators

Less Detailed

More Detailed

Threat Information vs Threat Intelligence

THREAT INTELLIGENCE PLATFORMS

Evalutation of existing platforms
http://aisel.aisnet.org/wi2017/track08/paper/3/

Key findings
1. There is no common definition of threat intelligence sharing platforms
2. STIX is the de-facto standard for describing threat intelligence 3. Platforms primarily focus on sharing of indicators of
compromise 4. The majority of platforms is closed source 5. Most platforms focus on data collection instead of
analysis 6. Trust issues between users and platform providers are
mostly neglected 7. Academic and commercial interest in threat intelligence sharing
increases 8. Many manual tasks make the user the bottleneck
http://aisel.aisnet.org/wi2017/track08/paper/3/

EXAMPLE: APT REPORT

Report Contents

Approach
·Manually create csv files ·Design simple graph structure ·Transform csv files to graph DB using Python

Graph Structure

Knowledge Graph

Campaign Links
MATCH p=(n:Campaign)<--(:Sample)-->(o)<--(:Sample)-->(m:Campaign) WHERE NOT o:Malware AND m <> n RETURN p

IP addresses with multiple domains
MATCH p=(n:Domain)-->(o:IP)<--(m:Domain) RETURN p

Relations to IP address
MATCH p=(m)<--()-[*1..3]->(n:IP {name: "178.209.52.72"}) WHERE NOT m:Malware AND NOT m:Filename AND NOT m:Path AND NOT m:IP RETURN p

Knowledge Graph from STIX

SEMI-AUTOMATED CYBER THREAT INTELLIGENCE (ACT)

Semi-Automated Cyber Threat Intelligence (ACT)
The main objective of the research project is to develop a platform for cyber threat intelligence to uncover cyberattacks, cyber espionage and sabotage.
The project will result in new methods for data enrichment and data analysis to enable identification of threat agents, their motives, resources and attack methodologies.
In addition, the project will develop new methods, work processes and mechanisms for the generation and distribution of threat intelligence and countermeasures, to stop ongoing and prevent future attacks.

ACT Project Goals
·Holistic workspace for analysts · Automation
-Repetitive tasks -Processing of unstructured data - Sharing
·Threat information · Countermeasures ·Advanced automated analysis ·Advanced enrichment ·Manual analysis - Efficiency - Accuracy ·Improve our knowledge of threat agents

Data Model
· Objects - Global -Example: IP address
· Facts -Connected to a single object or multiple objects (relation) -Immutable - Timestamped - Owner -Role-based and explicit access control -Backed by evidence and comments

Robustness

The Detection Maturity Level (DML) Model

Precision

Attacker identity Attacker goals and strategy
Attack execution plan and methods
Traces of attack execution

DML-9

Identity

DML-8

Goals

DML-7

Strategy

DML-6

Tactics

DML-5

Techniques

DML-4

Procedures

DML-3

Tools

DML-2 Host & Network Artifacts

DML-1 Atomic Indicators

DML-0 None or Unknown

http://ryanstillions.blogspot.com/2014/04/the-dml-model_21.html

Causality and Classifiers for the DML Model
Classifiers

External intelligence

Attacker goals,

Classifiers

strategy and identity

Causality
Attack execution plan and methods

External intelligence

Causality

Traces of attack execution

Semantic Feature Extraction
·Formal definitions of -Goals -Strategy -Tactics -Techniques -Procedures
·Relevant initiatives -MITRE CAPEC ·https://capec.mitre.org -MITRE ATT&CK ·https://attack.mitre.org -MITRE CAR ·https://car.mitre.org

APT Report Example: Tactics, Techniques and Procedures
https://www.pwc.co.uk/issues/cyber-security-data-privacy/insights/operation-cloud-hopper.html

Example Procedure: Authentication with stolen credentials
Environment: Windows cmd.exe command line 1. ping -n 1 HOSTNAME 2. net use \\HOSTNAME\ipc$ "PASSWORD" /user:"DOMAIN\USERNAME"

Example Procedure Detection
Prerequisite: logging of cmd.exe command line (e.g. Sysmon)
for each COMMANDLINE in cmd.exe process: if COMMANDLINE matches `ping -n 1 HOSTNAME': if next COMMANDLINE starts with `net use \\HOSTNAME\ipc$': Trigger alarm

TTP Knowledge Graph

Traces Knowledge Graph

Unstructured Data ­ Natural Language Processing
·No corpus for the cyber security domain ·Snowball: Extracting Relations from Large Plain-Text Collections 1 ·Test case: APTNotes (https://github.com/aptnotes/data)
1: http://www.cs.columbia.edu/~gravano/Papers/2000/dl00.pdf

APTNotes NLP processing

ADVANCED AUTOMATED ANALYSIS

Machine Learning

Triplets and semantic reasoning
«Things»

Subject

«Relationship» Predicate

Object

Triplet

Triplets and semantic reasoning

Martin

marriedTo

Jing

Triplet

Triplets and semantic reasoning

marriedTo

Martin

Jing

marriedTo

brotherOf brotherOf

sonOf motherOf

uncleOf

Dag

Richard

nephewOf

Triplets and semantic reasoning

Sad Panda

operatorOf

Operation Bulldozer

targetArea

North America

targetOf

targetSector

USA

locatedIn

Sunny Hospital

sectorMember

Medical

SUMMARY

Threat Intelligence Platform
·Data model and architecture done -Objects and immutable facts (relations/predicates) -ACL on facts -Queues and workers
·Platform core, API and GUI under development and testing ·Github project
- https://github.com/mnemonic-no ·Ongoing research:
-Threat ontologies -Analysis techniques -Enrichment techniques -Sharing and Countermeasures -Workflow orchestration

Feedback and ideas
·Useful, formal definitions of TTPs ·Examples of predicates («marriedTo») for Threat Intelligence ·Experiences, use cases ·Any other clever ideas

