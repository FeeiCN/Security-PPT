SEMI-AUTOMATED CYBER THREAT INTELLIGENCE (ACT)
Workshop ­ FIRST Conference 2018
Martin Eian and Fredrik Borg

Goal
To collect and organize our knowledge of threats to make it useful

Data and Information

Legend Sample Hash Domain Filename Path Campaign IP Address

Knowledge
MATCH p=(n:Domain)-->(o:IP)<--(m:Domain) RETURN p

Semi-Automated...
·Analysis ·Enrichment ·Information Sharing ·Countermeasures

Semi-Automated Cyber Threat Intelligence (ACT)
The main objective of the research project is to develop a platform for cyber threat intelligence to uncover cyberattacks, cyber espionage and sabotage.
The project will result in new methods for data enrichment and data analysis to enable identification of threat agents, their motives, resources and attack methodologies.
In addition, the project will develop new methods, work processes and mechanisms for the generation and distribution of threat intelligence and countermeasures, to stop ongoing and prevent future attacks.

Data Model
·Objects
- Global -Example: IP address
·Facts
-Connected to a single object or multiple objects - Immutable - Timestamped - Owner -Role-based and explicit access control -Backed by evidence and comments

Models, Taxonomies and Vocabularies
·MITRE ATT&CK
- https://attack.mitre.org
·MITRE PRE-ATT&CK
- https://attack.mitre.org/pre-attack/
·MISP galaxy
- https://github.com/MISP/misp-galaxy
·STIX 2.0 vocabularies
- https://oasis-open.github.io/cti-documentation/
· Ryan Stillions' DML model
- http://ryanstillions.blogspot.com/2014/04/the-dml-model_21.html

Current OSINT Sources
·APTNotes
- https://github.com/aptnotes/data
·APT & CyberCriminal Campaign Collection
- https://github.com/CyberMonitor/APT_CyberCriminal_Campagin_Collections
·RSS Feeds
-Infosec blogs
·mnemonic PassiveDNS
- https://passivedns.mnemonic.no/
·VirusTotal

THE ACT PLATFORM

Platform Architecture Version 0.01

Platform Architecture ­ Core technologies

Platform Architecture ­ Workflow orchestration
·Originally developed by NSA
·Open sourced and transferred to the Apache Foundation in 2014
·Manage flows of data supporting a large number of inputs and outputs:
-HTTP, FTP, SCP, Kafka, Elasticsearch, JMS, Syslog, MongoDB, Hadoop, Cassandra, SMTP, POP3, etc

ATT&CK Worker MISP Galaxy Worker
Virus Total Worker Passive DNS Worker
SCIO Worker
Enrichment

Action/triggers

Backend

ACT Core

Mitre ATT&CK
Object (type:value) Fact (type:value)

ipv4:127.0.0.1

seenIn:report

threatActor:APT29

seenIn:report

@ sector:Financial

seenIn:report

MISP Galaxy
Object (type:value)
reVpiorurts:aTcobtaa9l876aaaf6afc(...)
report:acba9876aaaf6afc(...)
report:acba9876aaaf6afc(...)
mnemonic passive DNS

OObbjjeecctt((ttyyppee::vvaalluuee)) Fact (tyFpaec:tvalue)

threatActor:APT29

threatA(cttoyrpAel:iavsalue)

tfhqrdena:ttAecstto.mr:nAePmTo2n9ic.no usesTecDhnNiSqRueecord:A

hash:aab678547865478abc (...) usesC2

OObbjjeecctt((ttyyppee::vvaalluuee))
threatActor:Cozy Bear tiepcvh4n.1iq2u7e.0:S.0c.h1eduled Task ipv4:127.0.0.1

REST API

SCIO SCIO Backend

Platform Architecture ­ Graph database
·Looked into existing graph databases, but they lacked proper fine granular permissions (and many of them had commercial licenses that could not be used in the research project)
·Apache Tinkerpop implemented on top of Cassandra/Elasticsearch
·Graph queries opens up a range of possibilites that is not possible on a flat data structure

Backend

REST API

GUI

ACT Core

API - Swagger

API ­ Python library (act-api on pypi)

Threat Intelligence Platform - Summary
·Implemented
-Core platform - API - GUI -Workflow orchestration -Graph queries
·Github project
- https://github.com/mnemonic-no/act-platform -License: ISC (BSD compatible)
·Python API wrapper
- https://pypi.org/project/act-api/

WORKSHOP - INTRODUCTION

Before We Start
Periscope Film LLC [CC BY-SA 3.0 (https://creativecommons.org/licenses/by-sa/3.0) or GFDL (http://www.gnu.org/copyleft/fdl.html)], via Wikimedia Commons

Introduction 1

Introduction 1 ­ Right Click / Left Click

Introduction 1 ­ History, Layouts and Filtering

Introduction 1 ­ Fact Types

Introduction 2
Try the following object queries and explore the graph:
·threatActor: Sofacy ·technique: Credential Dumping ·tool: foosace ·hash: da2a657dc69d7320f2ffc87013f257ad

Task 1
Try the following object query:
·ipv4: 40.112.210[.]240
What is the role of this IP address? Find any related Threat Actor(s).

Introduction 3 ­ Threat Actor Aliases

Task 2
Try the following object queries in sequence:
·ipv4: 85.25.100[.]104 ­ expand reports ·ipv4: 74.201.40[.]28 ·ipv4: 74.201.40[.]32
What are the roles of these IP addresses? Find any related Threat Actors.

Task 3: Find the Report
https://blog.talosintelligence.com/2018/05/VPNFilter.html

Introduction 4 ­ Create/Retract Fact

Bonus Task:
Investigate the domain name rannd[.]org.

WORKSHOP ­ GRAPH QUERIES
With Great Power Comes Great Responsibility

Graph Query 1

Graph Query 2 ­ Show Edges

Graph Query 3 ­ 2 hops

Graph Query 4 ­ Filter Edges (Facts)

Graph Query 5 ­ Filter Nodes (Objects)

Graph Query 6 ­ Warp Speed

Task 4: Find the Report
The fqdn fsw.adobeus[.]com is seen in one report. A sinkhole IPv4 address is also seen in the same report. What is the title of the other report mentioning that sinkhole IPv4 address?
Hint: Fact Type `seenIn'

Task 4 Solution

g.outE('seenIn').otherV().inE('seenIn').otherV().hasLabel('ipv4') .where(outE('isSinkhole')).outE('seenIn').otherV().path().unfold()

g outE(`seenIn')

otherV().hasLabel('ipv4').where(outE('isSinkhole')) inE(`seenIn') outE(`seenIn')

otherV()

otherV()

Graph Query 7 ­ Unique Tool Usage

EXERCISES

Exercises
There are two Threat Actors known to use certutil.exe. Which other tool do they have in common?
Which Threat Actor is associated with the domain name www.eyewatch[.]in?
How many DNSRecord facts are connected to the IP address 8.8.8.8?
How many Threat Actors are known to originate (sourceGeography) from France (location)?
How many of the Threat Actors known to originate from Russia use the tool psexec?

Exercises - Answers
There are two Threat Actors known to use certutil.exe. Which other tool do they have in common? mimikatz
Which Threat Actor is associated with the domain name www.eye-watch[.]in? Lazarus Group
How many DNSRecord facts are connected to the IP address 8.8.8.8? 18741
How many Threat Actors are known to originate (sourceGeography) from France? 1
How many of the Threat Actors known to originate from Russia use the tool psexec? 3

FURTHER WORK

New Information Sources
·Security alerts ·Incidents ·Reputation lists ·Malware analysis systems ·WHOIS ·MISP feeds ·STIX feeds ·...

Graph Analytics
·Post. doc. @ UiO ·Post. doc. @ NTNU

Information Sharing
·Mechanism for sharing schema ·Format (STIX?) ·Trust models

Trust and Confidence
·Trust (source) ·Confidence (fact) ·Subjective Logic (quantify uncertainty)

GUI Improvements
·Context menu -Pre-defined graph queries -Download report -...
·Timelines ·Share workspace ·Prune graph

