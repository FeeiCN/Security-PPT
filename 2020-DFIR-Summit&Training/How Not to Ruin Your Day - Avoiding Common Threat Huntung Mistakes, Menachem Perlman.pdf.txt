How Not to Ruin Your Day: Avoiding Common Threat Hunting Mistakes
Menachem Perlman Sr. Manager, Managed Threat Hunting

July 2020

Agenda  Common Mistakes Some Threat Hunters Make  Basic Techniques To Find Stealthy Adversaries  Performing Threat Hunting At Scale Using Automation And Enrichment
2 | © 2020 Palo Alto Networks, Inc. All rights reserved.

BASIC MISTAKES SOME THREAT HUNTERS MAKE

Basic Mistakes
Trying to look at everything collected

Rely solely on IOCs

Ignoring context

Focus on comfort zone

Ignoring known and signed files

Not reading about new attack methods

5 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Not So Basic Mistakes

Hunting only for APTs

Trying to look for what you just read, 1:1 as the article

Not having an internal feedback process

Looking for files

Continue investigating

6 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Basic Mistakes, Example

Trying to look at everything collected

Rely solely on IOCs

Ignoring context

Focus on comfort zone

Ignoring known and signed files

Not reading about new attack methods

7 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Back To The Basics Threat Actors Likes LOLBins - use common tools and commands
Living Off The Land Binary
Nbtstat, Psexec, Net View, CMD, Schtasks Why?
8 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Why?
Easy Already exists in the network

No need to deliver

Not blocked by default Hard to discover

9 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Cyber Hunters Approach

Collect everything

Analyze everything

Automate everything

The customer know about it

One hunting method fit all

10 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Don't Make These Mistakes

Collect everything

Is that necessary?

Analyze everything

Is that possible?

Automate everything

Should you?

11 | © 2020 Palo Alto Networks, Inc. All rights reserved.

No, you don't need to collect everything. Collect the important things but from ALL data sources, instead of everything from a single data source Almost, but as a hunter, focus on the low fidelity alerts or devices without any alert and when needed leverage high fidelity alerts Try to, always think about scale and automation when possible , always remember a person in loop is mandatory

Don't Make These Mistakes, Cont.
The customer know about it Is that true?

One Hunting Method fit all

Is that true?

12 | © 2020 Palo Alto Networks, Inc. All rights reserved.

No, don't assume the security or IT team saw some activity, provide as much details as possible No, using multiple methods is necessary, depends on the data source, situation and the case

TECHNIQUES TO FIND STEALTHY ADVERSARIES

Hunting Model

Motivation

14 | © 2020 Palo Alto Networks, Inc. All rights reserved.

MITRE
Great source for ideas and common behaviors to look for But, there are more

15 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Source MITRE

Script Engine
Look for all script execution for the following:  Powershell.exe  csscript.exe/wsscript.exe  Mshta.exe  Javaw.exe  wmic.exe
16 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Script Engine - Filter Results
17 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Unsigned Process
The goals is to find unsigned process running in the organization, often being leveraged as part of a targeted attack There are probably a lot, so focus on a shorter time frame
18 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Unsigned Processes - Filter Results
19 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Known Windows Processes
Look for execution of known and legitimate Windows processes that can be leveraged by an attacker, for example:
 `ftp.exe', `bitsadmin.exe' and `x/copy.exe' used to send data  'whoami.exe' to see who's on the active session  `net.exe', `netsh.exe', `schtasks.exe', `reg.exe', `auditpol.exe' and `wmic.exe' which can
be used to change the configuration of the machine
20 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Connections Over 80/443 Not By Browser
The goals is to find items that are communicating over HTTP There are probably a lot, so focus on a shorter time frame
21 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Scheduled Tasks
The goal is to check what starts from `taskeng.exe' ­ the process who runs scheduled tasks
22 | © 2020 Palo Alto Networks, Inc. All rights reserved.

NGFW Hunting  Non-browser user-agent on HTTP/S URL logs  Looking for unknown-tcp and udp  Large volume of data leaving the organization  Impossible Traveler  High ports using unknown applications to external hosts
23 | © 2020 Palo Alto Networks, Inc. All rights reserved.

THREAT HUNTING AT SCALE USING AUTOMATION AND ENRICHMENT

THREAT HUNTING
is a combination of
SCIENCE & ART
OUR MISSION
Uncover advanced adversaries using nontraditional methods and tools at scale and
always be one step ahead of an intruder

HUNTING AT SCALE

MANUAL
HUNTING
Testing Hypothesis New Attack Techniques Manual investigations

SEMI-AUTOMATED
HUNTING
Automation and Playbooks Signals and Detectors Threat Intelligence Extended Data Sources
AI and Machine Learning

HYPOTHESIS
The hunter will validate the hypothesis, check results, and refine the hypothesis until the hunter has discovered threats
or is confident that no threat exists.

3

IDEA

Based on findings from other cases or a newly published exploit

2

or attack, the hunter will design a

query to look for the attack.

INVESTIGATION

4

Deeper investigation

of the findings and evidence.

DATA SOURCES

Network, endpoint, cloud and third-party data sources

1

provided by customers.

REPORT

5

The hunter sends a report with findings

to the customer.

MANUAL
HUNTING

ENRICHMENT & PRIORITIZATION
Enriching incidents found by the signals and prioritization.
3

SIGNALS

Smart signals analyzing all collected data in order to every

2

discover threat. Signals are

based on one or all customers.

DATA SOURCES

Network, endpoint, cloud and third-party data sources

1

provided by customers.

INITIAL INVESTIGATION
The first step for the hunter is to validate the signal before investigating it in the Cortex XDR management console.
4

DEEP INVESTIGATION

5

Hunter performs a manual investigation to confirm the threat and

understand the full scope of the attack.

REPORT

6

The hunter sends a report with findings

to the customer.

SEMI-AUTOMATED
HUNTING

Summary  Operate smart - multiple techniques, collect what is necessary  Share techniques - collaborate with others, quantify the results  A person in the loop is always required but an automation mindset is mandatory
29 | © 2020 Palo Alto Networks, Inc. All rights reserved.

Thank you
Paloaltonetworks.com Menachem Perlman

