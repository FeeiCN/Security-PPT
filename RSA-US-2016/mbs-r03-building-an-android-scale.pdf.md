MBS-R03
Building an Android Scale Incident Response Process

Adrian Ludwig
Lead - Android Security

Who am I?
Android
Protect 1.5 Billion+ Users
@stake
Offense for Hire

Adobe
Protect the web
NSA
Offense

Goals
Describe strategies we've developed for incident response Share thought process and lessons learned Include Android-specific considerations (case studies)

The Incident Response Process

Establish Situational Awareness
Environment
Actors + Actions
Risks

Data

Take Action
Accept Risk Eliminate Risk Manage the Risk

The Android Ecosystem

1.5B+
Android 30DA Users

300M+
Users added in 2015

600+
New devices launched in 2015

50B+
App downloads in 2015

Actors

The Good

Security Team Product Engineering + QA PR / Communications Operations + Support Executives Legal

Ecosystem
OEMs Carriers SOCs App Developers

The Bad
Attackers
Attackers Malware Authors Thiefs Opportunists Network MITM

The Ugly
Complex Actors
Consumers Enterprises Press Researchers Governments Security Companies

Threats
Malware Vulnerabilities Local Exploits Hardware / Physical Attacks Remote Exploits Network Traffic Interception Supply chain compromise

Data Sources
Google Play Safebrowsing for Chrome Verify Apps Android Safety Net Android Device Manager
Billions of new pieces of data including apps, developers, app behavior, relationships, and third-party analyses are added every day.

Organization
Platform
Build Features
Respond
Fix bugs

Attack
Find Bugs
Review
Trust, but Verify

App Review
Improve App Safety
SafetyNet
Endpoint Protection

Responses

Google Public Statement Google Play Update Google Service Update (Verify Apps, SafetyNet) Patch to AOSP Warn users

Joint statement with partners 3rd Party Apps (Google Play)

Major 3rd Party App Patch

Ecosystem Wide patch delivery

Publish Research

3rd Party App Upgrade

Change an API

Release a major update

Patch a Google app

Nexus Update

Publish a best practice

Warn developers

And many more...

Strategy Lenses

Frequency
How often is the threat realized?

Velocity
How quickly is a threat realized?

Impact
What happens if a threat is realized?

Scope
What portion of the ecosystem is at risk?

Incident Frequency

Incident Frequency

Rare

 Copycat malware

 0-day

Malware

 Lost / Stolen

 New Exploit (Local)

Device  Media / Press Reaction

 New Exploit

(Remote)

 Publicly Disclosed

Vulnerability

? Supply Chain Compromise

? Traffic Interception

Common

Yearly (or less) Monthly

Weekly

Daily

Thousands/day

Strategies to Reduce Frequency
Change the attacker economics Move the target

"Smart phone thefts rose to 3.1 million in 2013"
Source: Consumer Reports

Responses
React
Device Manager "Find my phone" "Lock my phone" "Wipe my phone"
2.5 Million Monthly Users of Device Manager "Find my Phone"

Prevent
Lockscreen Encryption Factory Reset Protection
Lockscreen usage up 50% between 2014 and 2015 Nexus devices Encryption and FRP Enabled by default

Smart phone thefts declined from 3.1 in 2013 to 2.1 million in 2014
Source: Consumer Reports

g.co/AndroidSecurityRewards

$200,000 paid in 2015
Up to $38,000 per security issue

Incident Velocity

Incident Velocity

Slow

? Traffic Interception

 New Exploit Developed (remote)
? Supply Chain Compromise

 New Exploit Developed (Local)
 0-day Malware

Years

Months

Weeks

 Media / Press Reaction

 Publicly Disclosed

 Copycat malware

Vulnerability

 Lost / Stolen

Device

Days

Instant Hours

Strategies to Reduce Velocity
Centralize your response Batching and Cadence Quality and Automation

Monthly Security Updates

Monthly Security Bulletins

3 years from device availability

Android Security Monthly Process

Month 0
Partner Bulletin
(Patch, Backports, Severity Guidance)

Month 1
Public Security Bulletin AOSP Updated Device OTAs Begin

Month 2
Compatibility Requirement

Patc Ihsdseuveeflooupendd Backport

OEM Integration Testing Carrier Testing
Other Remediations: SafetyNet, Google Play, Verify Apps

Incident Impact

Incident Impact

Potential
 Media / Press Reaction Perception Limited

 0-day Malware
 Copycat malware

 Publicly Disclosed Vulnerability

 New Exploit

(remote)

? Supply Chain

 New Exploit

Compromise

(Local)

 Lost / Stolen

Device

? Traffic Interception Partial

MReocnotvhesrable

Realized Complete

Strategies to Reduce Impact
Provide a safer path Isolate high risk components Focus on recovery

Developer APIs

SecurityProvider : GmsCore_OpenSSL
SafetyNetApi.attest

Developer Security Warnings 85% Reduction in Installs of Vulnerable Apps in 2015

Isolation at every level

System System System System

Phone Contacts Phone

User 1 Email User 2

System System

Contacts

Email

Messaging Google Play Messaging Google Play

Trust Zone

Root

Root

Root

Root

Root

Root

Kernel Hardware

Focus on recovery
Verified Boot + SafetyNet =

Incident Scope

Incident Scope

Few
 Lost / Stolen Device
 New Exploit (remote)

 New Exploit (Local)
? Supply Chain Compromise

 Copycat malware

 0-day

 Publicly Disclosed

Malware

Vulnerability

 Media

/ Press Reaction

? Traffic Interception

Many

Probabilistic One Device

One Model

PMlaotnfothrms Version

All Devices

Reduce Incident Scope
Add Speed Bumps Embrace diversity

Google Play

Unknown Sources Warning

Install Confirmation

Verify Apps Consent

Verify Apps Warning

Runtime Security Checks

Sandbox & permissions

Application Review

Collect Apps Analyze Apps Enforcement

Google Play

Google Web Crawler Application Scanner

<Others>

Suspend Apps

Notify Developers

Application scanner details

Static analysis Dynamic analysis Machine learning

Intelligence-

Signature-based

based discovery

discovery

80% Reduction of Russian Bank Phishing Trojans
Infected devices in Russia Infected devices worldwide

Embrace Diversity
Intentional
ASLR Update Frequently

Natural
OEM SOC Hardware Architecture Build Time Changes

Predicting "real" scope is hard

Vulnerability Master Key
FakeID Stagefright

Initial Claim Headline
99% of devices vulnerable
82% of Android users at risk
95% of devices vulnerable

Unique APKs 1231
258
N/A

Peak exploitation after public release (per install) < 8 in a million
<1 in a million
None confirmed

Exploitation before public release (absolute) 0
0
N/A

Source: Google Safety Net Data; Masterkey data collected from 11/15/2012 to 8/15/2013 and previously published at VirusBulletin 2013. Fake ID data collected data collected from 11/15/2012 to 12/11/2014 and previously published at the RSA Conference 2015. Stagefright data current through February 2016.

To recap

Strategy Lenses
Frequency
Use economics Change the target
Impact
Another Path Isolation Recovery

Velocity
Centralize Batch and Cadence
Automate
Scope
Speed Bumps Diversity

Key Learnings

Incident Response

 Use data as your source of truth (not stories!)  Look for new responses ( think offensively!)  Try not to get lost in the details (this is hard!)

Identify incident features

Execute existing responses, try new ones

Analyze response effectiveness,
Response Feedback

Thank You!
aludwig@google.com

