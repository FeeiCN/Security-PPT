The Kitten that Charmed Me: The 9 Lives of a Nation State
Attacker
Richard Emerson, Senior Threat Hunt Analyst Allison Wikoff, Senior Strategic Cyber Threat Analyst
IBM Security X-Force Threat Intelligence
#BHUSA @BlackHatEvents

>whoami

Richard Emerson
Senior Threat Hunt Analyst, IBM Security X-Force 10 years experience in research, intelligence analysis, network defense MIT Lincoln Labs, Department of Defense
Allison Wikoff
Senior Strategic Cyber Threat Analyst, IBM Security X-Force 20 years experience in research, intelligence analysis, network defense, IR SecureWorks, Federal Reserve System, etc.
#BHUSA @BlackHatEvents

Today's Talk ­ ITG18
Details of ITG18 operations via opsec mistakes including: · How do they operate? · What tools do they use?
Our 40 Minute Goals · What can we learn from their mistakes
Research Available · https://ibm.biz/ITG18Blunder2020 · https://ibm.biz/ITG18Blunder2021

Images source: IBM Security X-Force, Noble.org

#BHUSA @BlackHatEvents

This is not an attribution talk
IBM performed responsible disclosure in the course of doing this research
#BHUSA @BlackHatEvents

Research Genesis
Routine information gathering on ITG18 infrastructure leads to discovery of an open file directory...
Files uploaded over course of a week before taken down by threat actor
Included exfiltrated victim data and... 4+ hours of desktop recordings!

ITG18 Open Directory File Listing
Image source: IBM Security X-Force #BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

How we define ITG18
Objectives
· Espionage and surveillance likely in support of Iranian government objectives
Targets
· Iranian and near abroad dissidents, journalists, academics; Reformist political party members · COVID researchers, US politicians, nuclear regulators, financial regulators
Tactics
· Phishing (email, social Media, SMS), credential harvesting, leveraging compromised accounts, masquerading as legitimate organizations/individuals
Infrastructure
· Frequently lease virtual private servers, register their own domains
#BHUSA @BlackHatEvents

Enduring Operations

2017

2018

2019

Images source: URLScan.io

2020
#BHUSA @BlackHatEvents

Response to Public Disclosure
· March 2019 ­ Microsoft wins criminal complaint to sinkhole 99 ITG18 domains
· Example domain sinkholed March 27, 2019:
identifier-services-sessions . info

March 2019 Criminal complaint against ITG18
Source: Microsoft

· ITG18 response to domain take down three weeks later:
identifier-services-sessions. .sintefo
#BHUSA @BlackHatEvents

Historical Tools
Metasploit ­ Commercially available pentesting framework
Spynote ­ Commercially available Android RAT (cracked versions available)
AndroRAT ­ Open-source Android RAT (similar to: https://github.com/karma9874/AndroRAT)
pdfReader ­ Custom modular Windows backdoor

pdfReader Modules
Image Source: IBM Security X-Force
#BHUSA @BlackHatEvents

LittleLooter
· Masquerades as WhatsApp for Android
· Multi-functional backdoor · HTTP/SMS C2 communications
· Sample discovered by X-Force in October 2020, uploaded to VirusTotal December 2020
· Has hardcoded version number "5"
· More details available https://ibm.biz/ITG18Blunder2021

Images source: IBM Security X-Force

#BHUSA @BlackHatEvents

ITG18 Operational Overview

· Exfiltrated at least 2 Terabytes since Fall 2018
· Personal information
- Location Details - Audio - Video - Photos - Chat logs and SMS messages - Search history
· Social media and email accounts compromised
· Some data taken via legitimate account tools

Exfiltrated data from an ITG18 victim. Image source: IBM Security X-Force | Location History Visualizer #BHUSA @BlackHatEvents

Other Historical Mistakes ­ Naming Your Targets

ITG18 Open Server. Image source: Shodan

#BHUSA @BlackHatEvents

Other Historical Mistakes ­ Copying your C2 Directory

Image source: IBM Security X-Force

#BHUSA @BlackHatEvents

Other Historical Mistakes ­ Not Updating Server Software

Image source: Shodan

Possible GlobeImposter ransom note
#BHUSA @BlackHatEvents

Size of Operations ­ Manual Credential Validation

Images source: IBM Security X-Force

#BHUSA @BlackHatEvents

Size of Operations ­ CAPTCHA Challenges

Images source: IBM Security X-Force

#BHUSA @BlackHatEvents

Size of Operations ­ Individual Operator Boxes?

Valid copy of WhatsApp installer
Images source: IBM Security X-Force

LittleLooter Android malware
#BHUSA @BlackHatEvents

Size of Operations ­ Individual Operator Boxes?
Compromised accounts
Operator accounts

Image source: IBM Security X-Force

#BHUSA @BlackHatEvents

Size of Operations - Summary

· ~ 2000 unique indicators

· ~ 2 Terabytes of victim exfil

· Manual data exfiltration, credential validation

· 10 - 20 intermediate VPN servers active at any time

· Blended strategic objectives

· Broad and targeted phishing operations

· Long running operation

· Loads of repeat mistakes

Image source: Office Space. Dir. Mike Judge. Twentieth Century Fox, 1999.

· Training videos

#BHUSA @BlackHatEvents

"Training Videos" ­ A Primer
· Discovered on an open server that previously hosted ITG18 infrastructure
· Desktop recordings made by the operator using free screen recording software
· Persona accounts on AOL, Yahoo, Gmail and Hotmail · Operator demos setting up account for continuous
monitoring using an email collaboration platform · Operator demos exfiltrating information on various web mail
platforms
We have blurred out identifying victim and persona information in the videos

Image source: IBM Security X-Force #BHUSA @BlackHatEvents

Thank you!

