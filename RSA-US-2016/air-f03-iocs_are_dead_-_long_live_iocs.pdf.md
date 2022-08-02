SESSION ID: AIR-F03
IOCs are Dead - Long Live IOCs!

Ryan Kazanciyan
Chief Security Architect Tanium @ryankaz42

Yours truly, circa 2010
https://buildsecurityin.us-cert.gov/sites/ default/files/RyanKazanciyan-APTPanel.pdf
2

IOCs as advertised

Human-readable, machineconsumable
Capture a broad set of forensic artifacts
Foster information sharing
Provide context around threats
Do better than "signatures"

3

Five years later...
4

IOC quality and sharing in 2016
5

My own point of reference

2009 - 2015: Investigator 2015 - Present: Builder

Large-scale, targeted attacks

Designing an EDR platform that includes IOC detection

Designed, tested, and applied IOCs for proactive and reactive hunting

Helping orgs build selfsustaining, scalable "hunting" capabilities

6

The erosion of indicator-based detection
Brittle indicators - short shelf-life Poor quality control in threat data feeds Hard to build effective homegrown IOCs Indicator detection tools are inconsistent IOCs applied to limited scope of data
7

"IOCs" vs. "threat data" vs. "intelligence"
IOCs are structured threat data Threat data != threat intelligence Threat intelligence provides context and and analysis Threat intelligence is ineffective without quality threat data
8

#RSAC
IOCs are brittle

Verizon DBIR 2015: Most shared IOC types
Source: Verizon DBIR 2015
10

IOCs in the APTnotes data set

Derived from over 340 threat reports (2006 - 2015) archived on https://github.com/kbandla/APTnotes

10000

9,096

7500 5000

6,639

5,083

2500
248 0
CVE

2,512

350 E-Mail

URL

Hosts

2,237

141

IP

Hashes File Name Registry

11

This will never keep pace...
Source: Verizon DBIR 2015
12

The problem extends beyond file hashes
Short lifespan of C2 IPs and domains Malicious sites colocated on virtual host server IPs Low barrier to host malicious content on legitimate providers
13

Sheer volume does not solve the problem
2007: Bit9 FileAdvisor tracked 4 billion unique files, catalog grew by 50 million entries per day 2009: McAfee Global Threat Intelligence tracked reputation data for 140 million IP addresses, handling 50 million file lookups per day 2011: Symantec Insight tracked tens of billions of linkages between users, files, web sites
14

Seven years of progress?

"...innovating to provide predictive security. This approach comprises interconnected security technology at multiple layers in the technology stack, backed by global threat intelligence. Predictive security will allow
security products to intelligently block attacks much sooner than is currently possible..."

"...an intelligence-led approach to security will be key in detecting the most sophisticated threats and responding to
them quickly and effectively."

15

#RSAC
Paid IOCs != quality IOCs

Have you assessed your feeds?
Jon Oltsik / ESG, http://www.networkworld.com/article/2951542/cisco-subnet/measuring-the-quality-of-commercial-threat-intelligence.html
17

My (incredibly scientific) methodology
Chose two top-tier paid threat feed services Retrieved the most recent ~20 indicators from each Spent 15 minutes eyeballing their contents
18

What are you paying for?
Too specific - malware hash AND'd with a filename
(Real IOC from a commercial feed)
19

What are you paying for?
Too specific - LNK files are unique per-system
(Real IOC from a commercial feed)
20

What are you paying for?
Too noisy - matches component of legitimate software
(Real IOC from a commercial feed)
21

#RSAC
Building good IOCs is hard

Challenges with IOC development

Easy to build high-fidelity IOCs
(may yield high false-negatives)

Hard to build robust IOCs
(may yield higher falsepositives)

Easy to build IOCs that don't evaluate properly
(tools have inconsistent matching logic)

"Pyramid of Pain", David Bianco http://detect-respond.blogspot.co.uk/2013/03/the-pyramid-of-pain.html

23

Running aground on a robust IOC
Too broad - may match on uncommon but legitimate binaries How much time do your analysts have to continuously build, test, and refine IOCs like this?
24

Inconsistencies in IOC detection tools

Supported Observables
FileItem  EventLogItem 
TaskItem  ServiceItem 
... ?

Logic Handling
OR
 {...}  AND
{...} {...}
? AND
{...}
 OR  {...}
{...}

Data Normalization

\system32\

x86 or x64?

\SysWoW64\

\WoW6432Node\

HKEY_CURRENT_USER

HKEY_USERS\{SID}

%SYSTEMROOT%

\Windows\

STIX & CybOX have a few tools to help with this:
maec-to-stix python-cybox/normalize.py

25

Issues specific to OpenIOC
What happens when you try to turn a proprietary tool's unique output schema into a "standard"...
ProcessItem/PortList/PortItem/process "Process Port Process"
FileItem/PEInfo/DetectedAnomalies/string "File PE Detected Anomali
FileItem/PEInfo/DetectedEntryPointSignature/Name "File EntryPoint Sig Name"
26

Issues specific to OpenIOC
Example: Registry evidence in OpenIOC
Key: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run Value: Backdoor Data: C:\path\to\malware.exe

RegistryItem/Path:

HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Backdoor

RegistryItem/KeyPath: \SOFTWARE\Microsoft\Windows\CurrentVersion\Run

RegistryItem/Value:

C:\path\to\malware.exe

RegistryItem/ValueName: Backdoor

RegistryItem/Text:

C:\path\to\malware.exe

27

#RSAC
Broadening the scope of endpoint indicator usage

Focusing on scope of data, not tools

What are you matching your endpoint IOCs against?
What's your cadence of detection?
Where are your gaps?

EXE

Current Activity

Historical Activity

Data at Rest

(Processes, Network  (Telemetry, logs, alerts, (Files on disk, registry)

Connections, Memory)

historical data)

Workstations

Servers

29

Matching on SIEM / centralized logging

Most common endpoint data in SIEM:
Anti-virus / anti-malware alerts (all systems)
Event log data (subset of systems - usually servers)

EXE

Current Activity

Historical Activity

Data at Rest

(Processes, Network  (Telemetry, logs, alerts, (Files on disk, registry)

Connections, Memory)

historical data)

Resource impact of largescale event forwarding & storage limits endpoint coverage & scope of data

Workstations

Servers

30

Matching on forensic telemetry

Process execution, file events, network connections, registry changes
Preserves historical data, short-lived events
Expensive to centralize in large environments
Limited scope of data for IOC matching

EXE

Current Activity

Historical Activity

Data at Rest

(Processes, Network  (Telemetry, logs, alerts, (Files on disk, registry)

Connections, Memory)

historical data)

Workstations

Servers

31

Matching on live endpoints

Potentially the broadest set of available data
Considerations
Endpoint impact Availability Time-to-assess Scalability

EXE

Current Activity

Historical Activity

Data at Rest

(Processes, Network  (Telemetry, logs, alerts, (Files on disk, registry)

Connections, Memory)

historical data)

Workstations

Servers

32

The ideal combination
Goal: Maximize the value of brittle IOCs Telemetry for efficiency, historical data On-endpoint to maximize current state & at-rest data Increase cadence as tools & resources permit Don't take shortcuts on scope of coverage!
33

"I only need to check important systems"

An example of why this fails:
Credentials can be harvested from anywhere on a Windows network

No need to run malicious code on admin systems or DCs

By the time they get to "crown jewels", attackers are already authenticating with legitimate accounts

Source: https://adsecurity.org/?p=1729

34

#RSAC
Shrinking the detection gap

Doing better with what we've got
"The desire to take a technical feed and simply dump it into our security infrastructure doesn't equate to a threat intelligence win... You cannot get more relevant threat intelligence than what you develop from within your own environment. This should then be enriched with external intelligence" -Rick Holland, Forrester, 2016 CTI Summit
Source: https://www.digitalshadows.com/blog-and-research/another-sans-cyber-threat-intelligence-summit-is-in-the-books/
36

My own point of reference

As an investigator:  Relative efficacy of IOCs vs. methodology & outlier analysis
over time
80

60

40

20

0 2010

2011

2012

2013

2014

2015

(Rough approximation for the sake of having a pretty graph)

37

IOCs
Methodology  & outlier analysis

Resetting expectations

Undetected Threats 
Threat data & intel feeds 
Signature-based detection
Preventative Controls Expectation

Undetected Threats Internal analysis
Threat data & intel feeds Signature-based detection
Preventative Controls
Reality
38

High-quality threat data and intelligence can help you...
Categorize and contextualize known threats, streamline response
Provide additional layer of automated detection
...but it cannot...
Tell you what's normal in your own environment
Exceed the benefits of wellimplemented preventative controls
Close the gap of undetected threats

Looking inward to hunt
Derive intelligence from what's "normal" Build repeatable analysis tasks Combine with automated use of IOCs and threat data More is not always better!
Easy to overwhelm yourself Take on discrete, high-value data sets one at a time
39

Aligning to the attack lifecycle

What are the "lowest common denominators" across targeted intrusions?
What readily-available evidence do they leave behind?
What easily-observable outlier conditions do they create?

Conduct Reconnaissance

Steal Credentials &

Move Laterally

Establish & Retain

40

Example: Hunting for Duqu 2.0
"In addition to creating services to infect other computers in the LAN, attackers can also use the Task Scheduler to start `msiexec.exe' remotely. The usage of Task Scheduler during Duqu infections for lateral movement was also observed with the 2011 version..."
Source: https://securelist.com/files/2015/06/The_Mystery_of_Duqu_2_0_a_sophisticated_cyber espionage_actor_returns.pdf
41

What was the shared IOC?
42

How could we do better?
We could just add a specific TaskItem to the IOC... ...but what about other variants? How can we find evidence of other malicious activity that abuses the same (incredibly common) lateral movement technique?
43

Example: Lateral command execution

Attacker

Sources of Evidence

Analysis Criteria

Scheduled Tasks

Logon & service events

Who? Where?

Accounts used
Source & target systems

WinRM & PowerShell

Process history
E

When? What?

Time & frequency
Executed commands, dropped files, etc.

PsEx

Other forensic artifacts

Assess outliers

44

Resulting stack analysis
45

Resulting stack analysis
46

Resulting stack analysis
47

Resulting stack analysis
48

For additional examples
"Hunting in the Dark"
https://speakerdeck.com/ryankaz
Includes coverage of:
More task analysis ShimCache and process history Service Events WMI event consumers Alternative authentication mechanisms
49

#RSAC
Closing thoughts and takeaways

Evolving standards & platforms
Platforms
MISP http://www.misp-project.org
Hubs and exchanges
Facebook ThreatExchange https://threatexchange.fb.com
Standards
CybOX 3.0 refactoring and simplification
51

Quantitative assessment of threat feeds
Few efforts to-date - this is difficult! Threat Intelligence Quotient Test (tiq-test)
Statistical analysis of IPs and domains in threat feeds References: https://github.com/mlsecproject  https://defcon.org/images/defcon-22/dc-22-presentations/PintoMaxwell/DEFCON-22-Pinto-and-Maxwell-Measuring-the-IQ-ofyour-threat-feeds-TIQtest-Updated.pdf
52

Ask your threat feed vendor

Where's the intel coming from?
Professional services
Managed security services
Partners
Honeypots
"Open source" data gathering

Auto-generated sandbox data
What's the breakdown of observable types? What QC is in place?
Test-cases Documentation Spot-checking

53

Maximize your IOCs & threat data
Where are your gaps in endpoint & network visibility? Can you expand the scope of data made available for endpoint IOC matching in your environment? Are your tools and threat data sources fully compatible? How quickly are you consuming new threat data? At what scale?
54

Have your investments made you more secure?
Even the best sources of threat data will never keep pace with emerging attacks
Know your network above all
Invest in attack surface reduction and "hygiene". It really does make a difference.
55

SESSION ID: AIR-F03
Thank you!

Ryan Kazanciyan
Chief Security Architect Tanium @ryankaz42

