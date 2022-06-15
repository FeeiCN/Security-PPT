#RSAC
SESSION ID: AIR-W01
Evaluating Indicators As Composite Objects
Joe Slowik
Threat Intelligence & Detections Lead Gigamon Applied Threat Research @jfslowik

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Hello!
Current:
­ Gigamon Threat Intelligence & Detections Development Lead ­ Paralus CTI and ICS Education
Previously:
­ DomainTools Security Research ­ Dragos ICS Threat Research and Analysis ­ Los Alamos National Laboratory Incident Response Lead ­ US Navy, "various"
3

#RSAC
Agenda
Defining Indicators Indicators As Atomic Objects Indicators As Composite Objects Composites Yielding Adversary Behaviors
4

#RSAC
Indicators Of Compromise
Technical Observable Related To Known Malicious Activity
Linked To Historical Event And Analysis
5

#RSAC
Indicators Of Compromise
6

#RSAC
Indicators Of Compromise
https://media.threatpost.com/wp-content/uploads/sites/103/2016/04/07000027/mandiant-IOC.png
7

#RSAC
Indicators As Defined

Multiple Observations

Context Provided

Rooted In Incident Response
8

#RSAC
Indicators In Practice
https://www.us-cert.gov/sites/default/files/publications/JAR-16-20296A.csv
9

#RSAC
Debasement Of The IOC
10

#RSAC
Indicators As Atomic Objects

Single, Unenriched Observable

Context Not Provided

Origins Vary, Use
Undetermined

Atomic Indicators

11

#RSAC
"Splitting The Atom"
https://www.irishexaminer.com/cms_media/module_img/1961/980957_1_articlelarge_bn-901957_0b19cd2225664bfa9169b0ed90b84f61.jpg
12

#RSAC
Indicators As Natural Composites

Characteristics & Components

Technical Indicator

13

#RSAC
Identifying Subcomponents
"IOC"

Artifacts of Artifacts of Context &

Existence

Use

Purpose

14

#RSAC
Example: Network Objects
15

#RSAC
Example: PE Files
16

#RSAC
Example: Office Documents
17

#RSAC
Composite Characteristics

Composite Characteristics Uncover Origins

Origins Show Adversary Tendencies

Tendencies Link To Adversary Behaviors

18

Behavioral Identification & Pivoting
Infrastructure Creation

Execution & Artifact Use

Adversary Operations

Network Traffic
Tendencies

File & Tool Creation

#RSAC
19

Indicator Classification

Develop Understanding of
Adversary Behaviors

Map to Technical Artifacts &
Observations

#RSAC
For New Observables, Identify Similarity to Known Behaviors

Apply Enrichment and Classification
to Adjudicate

Enable Disposition Based on Prior Analysis

20

#RSAC
Examples
21

#RSAC
Potential Pitfalls
Distinguish Between Tool/Capability Creators And Threat Actors
Beware Of Tool/Technique Sharing Among Disparate Groups
Limitations In Visibility And Enrichment Have Significant Consequences
22

#RSAC
Implementing In Your Environment!
"Raw" Indicators Must Be Enriched & Analyzed! Enriched Indicators Yield Composite Structures! Composite Structures Enable Behavior & Tendency Identification! Understanding Behaviors Makes Pivoting And Enhanced Alerting Possible!
23

#RSAC
References & Resources
· "OpenIOC: Back to the Basics" ­ Will Gibb & Devon Kerr, Mandiant (https://www.mandiant.com/resources/openioc-basics) · "Misunderstanding Indicators of Compromise" - Dave Dittrich & Katherine Carpenter
(https://threatpost.com/misunderstanding-indicators-of-compromise/117560/) · "Indicators and Network Defense" ­ Joe Slowik (https://pylos.co/2018/05/16/indicators-and-network-defense/) · "Formulating a Robust Pivoting Methodology" ­ Joe Slowik, DomainTools
(https://www.domaintools.com/content/formulating-a-robust-pivoting-methodology.pdf) · "Analyzing Network Infrastructure as Composite Objects" ­ Joe Slowik, DomainTools
(https://www.domaintools.com/resources/blog/analyzing-network-infrastructure-as-composite-objects) · "Threat Intelligence and the Limits of Malware Analysis" ­ Joe Slowik, Dragos (https://www.dragos.com/wp-
content/uploads/Threat-Intelligence-and-the-Limits-of-Malware-Analysis.pdf)
24

#RSAC
Questions?
Joe.slowik@gigamon.com / joe@paralus.co @jfslowik

