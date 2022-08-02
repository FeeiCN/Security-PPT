SESSION ID: CXO-R03
The Third Rail: New Stakeholders Tackle Security Threats and Solutions

Ted Ross
Director, Threat Intelligence HP Security Research @tedross

#RSAC

#RSAC
Agenda
 My brief background  An example of a successful collaboration  Quick review of some basics  Stakeholders  "Next Gen" sharing  Use cases
2

HPSR Threat Intelligence
Strategic
Human-to-human
Field Intelligence
Monitor the Underground
Profile Threat Actors
Human Intel

#RSAC
Tactical
Machine-to-machine
Facilitates strategic human-to-human interaction
Threat Central

The Power of Collaboration:

#RSAC

A View from the Underground

#RSAC
The Adversary Collaborates Effectively

Experts Marvel At How Cyber thieves

Bank Hack
Global NetRwesoulrtskinof

Stole $45 Million
In Hours, Thieves Took

Hackers StSetuanln$in4g5$45 MTilhleiCoirncuitF: HroaMHckmeeilirlssitotAonoTkAMTMs

$45 Million in A.T.M. Scheme $45 million in ATM heist

#RSAC
Recruiting

#RSAC
But... they don't trust each other

#RSAC
Collaboration

#RSAC
Payment Options ­ Escrow, Laundering, Assets

#RSAC
Lessons Learned from the Adversary
 Sharing is social - social rules apply
 Protect your identity  Credibility is key  Reuse what others have
learned  Leverage each others
strengths

#RSAC
Challenges that We Must Overcome
· Limited participation
· Not comfortable sharing (social issues) · No time · No trust
· Data is not actionable ­ lacks context and relevance
· Overly manual ­ not timely

The Power Of Collaboration:

#RSAC

What are the Good Guys doing?

#RSAC
ISACs (Information Sharing & Analysis Centers)
· Created from Presidential Directive in 1998 (updated in 2003). · Public and private sector to create a partnership to share information about threats, vulnerabilities, and events to help protect the critical infrastructure.
· U.S. Treasury, DHS and other relevant government agencies / entities use ISACs to disseminate critical information.
· Last count there are 18 different ISACs (i.e. Financial Services, Energy, Water, National Health, Surface Transportation, etc).
· FS-ISAC (launched in 1999) is the most advanced and leading the way for others · In early 2013, FS-ISAC extended their charter to include information sharing for financial services entities world-wide.

STIX / TAXII

#RSAC
Structured Threat Information eXpression A Structured Language for Cyber Threat Intelligence Information Source - https://stix.mitre.org
Trusted Automated eXchange of Indicator Information Enabling Cyber Threat Information Exchange Source - http://taxii.mitre.org

#RSAC
STIX Data Model
https://stix.mitre.org

#RSAC
Observable (lowest level)

#RSAC
Indicator

#RSAC
Incident

#RSAC
Evolution
2015 Embedded Human Threats
Video Removed for security purposes

#RSAC
Evolution
Props to Chris Blask (ICS-ISAC)

2013

2014

2015
We are here

2016

Building the pipes (infrastructure & tools for sharing)

Analyze the Data

Apply results

#RSAC
The Next Phase- Analyze the Data
 Indicators come from multiple sources, each with a unique view on the threat
 Collaboration allows us to LINK artifacts  Interacting with an intelligent system allows us to determine which
threats are important to you ­ RELEVANCE  Using the context to score the indicators makes them ACTIONABLE
21

Key Stakeholders

YOU YOUR SIEM YOUR STIX

Privacy Enhanced Forums

Threat Threat Threat

DB

DB

DB

Private Community
Friend
SIEM STIX

Sector Community
STIX SIEM

Portal

SIEM

Global Community

#RSAC
HP Security Research

#RSAC
Automated Action Influenced by Context

Collect
TC Community Open Source
Feeds Research

ESM Connector
API

Normalize
Actionable Intel
IP ad\dress
Domain File Hash Registry Key
URL
Add Context
Sigh\tings
Source Reliability Severity
Confidence Community Feedback

Analyze/Correlate

Distribute / ACT

Compare & Correlate
Match Customer Case
MatchTtTo\PAsctors,
Verticals Targeted
Linked Indicators
SET SCORE
RELEVANT Y/N

Portal
Security Event Manager
Edge Device

Results & Actions

Reliability Severity Confidence Sightings Votes SCORE

First Sighting Normal M M 1 0 35

Second Sighting Normal M M 2 0 47

Vote Down Effect Normal
M
M
4
-4
52

Third Sighting

Fourth Sighting

Normal

Normal

M

M

M

M

3

4

0

0

59

73

Highest Possible HIGH H H 4 4 100

Monitor Activity

Take Action

#RSAC

Results & Actions

Reliability Severity Confidence Sightings Votes SCORE

First Sighting Normal M M 1 0 35

Second Sighting Normal M M 2 0 47

Vote Down Effect Normal
M
M
4
-4
52

Third Sighting

Fourth Sighting

Normal

Normal

M

M

M

M

3

4

0

0

59

73

Highest Possible HIGH H H 4 4 100

Monitor Activity

Take Action

#RSAC

Results & Actions

Reliability Severity Confidence Sightings Votes SCORE

First Sighting Normal M M 1 0 35

Second Sighting Normal M M 2 0 47

Vote Down Effect Normal
M
M
4
-4
52

Third Sighting

Fourth Sighting

Normal

Normal

M

M

M

M

3

4

0

0

59

73

Highest Possible HIGH H H 4 4 100

Monitor Activity

Take Action

#RSAC

#RSAC

Query Depth = 32

Observabl e

Observabl e

Domain

IP Address

Observabl e

Automated APT Actor Recognition

#RSAC

Possible distractions/

How APT actors

Easy attack vectors

are recognized

TTP

TTP

The power of linking Actors (courtesy of CERT-EU)

Secondary recognition

#RSAC
Use Case: Automated Actions
Brute force login

Source 1.1.1.1 Source 1.1.1.1
Attacker

Invalid Login
Invalid Login
IPS

Key Assets
Source 1.1.1.1

Use Case: Automated Actions

Current approach

Source 1.1.1.1 Source 1.1.1.1
Attacker

Invalid Login
Invalid Login
IPS

Source 1.1.1.1

Company A

Source 1.1.1.1 Source 1.1.1.1
Attacker

Invalid Login
Invalid Login
IPS

Source 1.1.1.1

Company B

Source 1.1.1.1 Source 1.1.1.1
Attacker

Invalid Login
Invalid Login
IPS

Source 1.1.1.1

Company C

#RSAC

Use Case: Automated Actions
New approach

Source 1.1.1.1 Source 1.1.1.1
Attacker

Invalid Login
Invalid Login
IPS

Source 1.1.1.1

Company A

LOW SCORE

Source 1.1.1.1 Source 1.1.1.1
Attacker

Invalid Login
Invalid Login
IPS

Source 1.1.1.1

Company B

LOW SCORE

Source 1.1.1.1 Source 1.1.1.1
Attacker

Invalid Login
Invalid Login
IPS

Source 1.1.1.1

Company C

LOW SCORE

#RSAC
Sharing Community
MHLeOIdGiWuHm SCORE
Company If score = HDIGH, push to
IPS
HIGH SCORE
IPS/Firewall

#RSAC
Use Case: Proactive Block Lists - RECON
Current approach
Source 1.1.1.1

IPS Recon Source
Source 2.2.2.X
Attack Source(s)

Key Assets
Source 1.1.1.1

#RSAC
Use Case: Proactive Block Lists - RECON
with Threat Central

Source 1.1.1.1

Sharing Community

Recon IP Attack IPs

IPS Recon Source
Source 2.2.2.X
Attack Source(s)

Key Assets
Source 1.1.1.1 Attack IP List

#RSAC
Summarizing: Leveraging the Community

Zero day
Malwar e
variant
Malicious IP address

Company A

NEW EVENT

Company B

NEW EVENT

Company C

NEW EVENT

Sharing CoMZEAmBRLAOWmDADIPuRAEYnity

#RSAC
What to Look for in Threat Sharing Systems
 Automated bi-directional sharing  Analysis of the data  Actionable derived results  Tap into the existing community of security experts  Product agnostic sharing is a must

#RSAC
How to Apply
 Within three months, select a collaboration system that produces
A- Actionable results B- Indicators that are relevant to you
 Start collaborating with both human-human and machine-machine using a system that will send indicators automatically as a result of the collaboration.
 Leverage strategic intelligence (context) to better defend ­ defend with purpose
36

Thank You

#RSAC

37

