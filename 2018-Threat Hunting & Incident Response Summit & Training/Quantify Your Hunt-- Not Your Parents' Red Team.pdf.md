Quantify Your Hunt:
Not Your Parent's Red Teaming Redux

Agenda for this talk
 Who we are  Why we're giving this talk with these updates  Understanding effectiveness  Things you might be already measuring  Enterprise ATT&CK, the practitioner's choice of knowledge bases  Measuring, data quality and ATT&CK  Statistics, Data science and how they help

Introductions
Honestly, we're not as interesting as this topic

Devon Kerr @_devonkerr_
Principal Threat Researcher for R&D @endgameinc, I do these things:
 Detection and response capability development  Endgame SOC lead  RTA contributor and simulation advocate  Hunt desk reference co-author
Former Incident Response lead at Mandiant with more than 6 years of IR, forensics, analyst training and security program development.
Knowledge areas include Incident management and response, living off the land using native features, adversary tradecraft, simulation and threat detection.

Roberto Rodriguez @Cyb3rWard0g
 Adversary Detection Analyst @SpecterOps  https://github.com/Cyb3rWard0g
 ThreatHunter-Playbook  Hunting ELK (HELK)  ATTACK-Python-Client  Open Source Security
Event Metadata (OSSEM)  Former:
 Capital One, Senior Threat Hunter

Why this talk?
Why again?

Hunt teams still struggle with ...
 Aligning hunting campaigns & business priorities  Providing transparency to senior leadership  Showing progress over time  Mapping gaps to data sources and security controls
 Coverage of adversary techniques is much more than a green check or red "x"
 Assessing the effectiveness of the program and any tools used during engagements
 Developing and implementing parity with ATT&CK  Just getting started, candidly

Effective Hunting
How are you effective? What does being effective even mean?

______ for effective threat hunting

Efficiency Efficacy
Effectiveness
https://twitter.com/Cyb3rPandaH

Efficiency
The way resources are used (or wasted), How much I make the most of the resources I have
Efficacy
It doesn't matter how we do it, but only on what we accomplish

Effectiveness
Accomplishes the goals (to be efficacious) employing the best and most economic methodology (to be efficient).

Efficiency Efficacy

 Choosing an adversary model  Assessing quality of data
 Do we even have the data?  Utilizing the right technology  Applying the right personnel skills  Prioritizing adversary techniques  Enhancing data security analytics
 Let's find evil! Can we detect it? Yes or No?  Signatures vs security analytics  Are you considering attack variations?
 Uncovering Incidents vs Validating Detection of adversaries

Where do I start?
How are we going to start approaching this?

Two steps back, one step forward: or history repeats itself

The Evolution of the Hunt HeatMap

How Hot Is Your Hunt Team?
https://cyberwardog.blogspot.com/2017/07/how-hot-is-your-hunt-team.html

Ready to hunt? First, Show me your data!
https://cyberwardog.blogspot.com/2017/12/ready-to-hunt-first-show-me-your-data.html

What are you potentially measuring already?

Risk Forecasting Choose a risk to measure Decompose the scenario
Gather supporting data Make forecasts
Mitigate the potential risk Measure again
https://magoo.github.io/Risk-Forecasting/#173 (Ryan McGeehan @Magoo)

Threat Modeling Model the system Identify Threats Define how threat occurs Address threats
Validate Measure again
Shostack, Adam. Threat Modeling: Designing for Security (p. 46). Wiley. Kindle Edition

Where do you fit "hunt"?

Threat Hunting Identify a technique Develop a hypothesis Identify scope and
resources Develop Analytics Validate & Report Automate? & Repeat

Risk Forecasting Choose a risk to measure Decompose the scenario
Gather supporting data Make forecasts
Mitigate the potential risk Measure again

Threat Hunting Identify a technique Develop a hypothesis Identify scope and
resources Develop Analytics Validate & Report Automate? & Repeat

Threat Modeling Model the system Identify Threats Define how threat occurs Address threats
Validate Measure again

Risk Forecasting Choose a risk to measure Decompose the scenario
Gather supporting data Make forecasts
Mitigate the potential risk Measure again

Threat Hunting Identify a technique Develop a hypothesis Identify scope and
resources Develop Analytics Validate & Report Automate? & Repeat

Threat Modeling Model the system Identify Threats Define how threat occurs Address threats
Validate Measure again

Risk Forecasting Choose a risk to measure Decompose the scenario
Gather supporting data Make forecasts
Mitigate the potential risk Measure again

Threat Hunting Identify a technique Develop a hypothesis Identify scope and
resources Develop Analytics Validate & Report Automate? & Repeat

Threat Modeling Model the system Identify Threats Define how threat occurs Address threats
Validate Measure again

What can we measure from a hunt detection?

We need to understand what we are trying to measure from a detection perspective
 Do we have the right resources to validate the detection of identified threats?  What percentage of my tools help the most during a hunt?  What percentage of data is utilized the most during a hunt?
 How much can we cover with the current resources we have?  Percentage of data in relation to detected techniques  Percentage of successful analytics for hunt engagements
 Are we reducing the probability of attackers achieving their objective?  Percentage reduced each quarter after a hunting engagement. forecasting?

ENTERPRISE ATT&CK
The practitioner's choice of knowledge base

MITRE said it best
" MITRE's Adversarial Tactics, Techniques and Common Knowledge (ATT&CKTM) is a curated knowledge base and model for cyber adversary behavior, reflecting the various phases of an adversary's lifecycle and the platforms they are known to target. ATT&CK is useful for understanding security risk against known adversary behavior, for planning security improvements, and verifying defenses work as expected.
" - MITRE ATT&CK -

We really like Enterprise ATT&CK
What's not to like:
 it is threat-agnostic, describing the purpose and effect of many techniques  contains more than 200 categorized and curated entries  includes forensic artifacts and references to educate analysts and decrease
barrier-to-entry
 techniques are cross-referenced by threat group, if that's important to your business (it might not be, no judgement)

ATT&CK STATISTICS (As of April 27, 2018)
 219 techniques  187 - Windows  130 - MacOS  108 - Linux
 11 Tactics  68 groups  187 Tools  48 Data Sources  39 Contributors  21 Bypasses

How can I measure against ATT&CK?

Explore ATT&CK
https://www.mitre.org/sites/default/files/publications/pr-18-0944-11-mitre-attack-design-and-philosophy.pdf

Explore ATT&CK

The lowest level of permissions the
adversary is required

https://www.mitre.org/sites/default/files/publications/pr-18-0944-11-mitre-attack-design-and-philosophy.pdf

Explore ATT&CK

The lowest level of permissions the
adversary is required
Permissions an adversary will attain
by performing the technique

https://www.mitre.org/sites/default/files/publications/pr-18-0944-11-mitre-attack-design-and-philosophy.pdf

Explore ATT&CK

The lowest level of permissions the
adversary is required

Permissions an adversary will attain
by performing the technique

Data recommended to be collected for the detection of an action

https://www.mitre.org/sites/default/files/publications/pr-18-0944-11-mitre-attack-design-and-philosophy.pdf

Explore ATT&CK

The lowest level of permissions the
adversary is required

Permissions an adversary will attain
by performing the technique

Data recommended to be collected for the detection of an action

If the technique can be used to execute
something on a remote system

Data Sources -> Adversarial Techniques

Identify Relationships in ATT&CK

Has Tactic

Collection

Has Data Source

Windows

Has Tactic

Has Technique
Execution

Service Execution

Has Data Source

Process monitoring
Process command-line

Has Tactic

Discovery

Has Data Source

Windows Registry

Data Sources -> Adversarial Techniques -> OS

Identify Relationships in ATT&CK
https://www.mitre.org/sites/default/files/publications/pr-18-0944-11-mitre-attack-design-and-philosophy.pdf

Groups -> Adversarial Techniques

MITRE has already covered this topic, though

Part 1: Using ATT&CK to Advance Cyber Threat Intelligence
This excellent blogpost by Katie Nickels (@likethecoins) covers:
 An overview of traditional CTI  Challenges  How ATT&CK can help provide a way of
expressing TTPs, exposing a common language  Using ATT&CK to understand blind spots  Using TTP counts as a metric to justify your CTI
program

Part 2: Using ATT&CK to Advance Cyber Threat Intelligence
The second part in this series focuses on knowledge management and adversary behavior curation, which ATT&CK is perfectly designed to assist with.
Two of the major points to take away:  Get as close to original information as possible to avoid misinterpreting a tactic or event  Select appropriate information to curate

Adversary Techniques-> Data Sources ->
Detection Strategy

What data sources are recommended?

Access Tokens Anti-virus API monitoring Application Logs Asset Management Authentication logs Binary file metadata BIOS Browser extensions Data loss prevention

Detonation chamber Digital Certificate Logs DLL monitoring DNS records EFI Email gateway Environment variable File monitoring Host network interface Kernel drivers

Loaded DLLs Mail server Malware reverse engineering MBR Named Pipes Netflow/Enclave netflow Network device logs Network intrusion detection system Network protocol analysis Packet capture

What data sources are recommended?

PowerShell logs Process command-line parameters Process monitoring Process use of network Sensor health and status Services SSL/TLS inspection System calls Third-party application logs User interface

VBR Web application firewall logs Web logs Web proxy Windows Error Reporting Windows event logs Windows Registry WMI Objects

Let's take a look at data sources again:
PowerShell logs Process command-line parameters Process monitoring Process use of network Sensor health and status Services SSL/TLS inspection System calls Third-party application logs User interface

Process object attributes...

PowerShell logs Process command-line parameters Process monitoring Process use of network Sensor health and status Services SSL/TLS inspection System calls Third-party application logs User interface

Process process_name process_command_line process_path process_parent_name
user_name hash_sha256
host_name

What is a data model?
 A data model basically determines the structure of data and the relationships identified among each other.
 MITRE Data Model:  Strongly inspired by CybOX, is an organization of the objects that may be monitored from a host-based or network-based perspective.  https://car.mitre.org/wiki/Data_Model
 STIXTM Version 2.0. Part 4: Cyber Observable Objects  http://docs.oasis-open.org/cti/stix/v2.0/stix-v2.0-part4-cyber-observableobjects.html

Data Model (Defining Data Objects)

Ip Object ip_src ip_dst
process_name user_name host_name

Process Object process_name process_command_line process_path process_parent_name
user_name hash_sha256
host_name
https://github.com/Cyb3rWard0g/OSSEM/tree/master/data_models

File Object file_name file_path process_name user_name host_name

Data Model (Defining Data Objects)

Ip Object ip_src ip_dst
process_name user_name host_name

Process Object process_name process_command_line process_path process_parent_name
user_name hash_sha256
host_name

File Object file_name file_path process_name user_name host_name

Data Model (Defining Object Relationships)

Applicable Objects (Source)
Process File, Process, Win Registry Key, Service Process Process Process File Process

Relationship
Created Created_By
Parent_Of Modified_Properties_Of Renamed Renamed_By Connected_To

Applicable Objects (Destination)
File, Process, Win Registry Key, Service Process
Process File, Win Registry Key, Service File Process IP, Hostname

http://stixproject.github.io/data-model/1.2/cyboxVocabs/ObjectRelationshipVocab-1.1/

Example: Process use of network

PowerShell logs Process command-line parameters Process monitoring Process use of network Sensor health and status Services SSL/TLS inspection System calls Third-party application logs User interface

VBR Web application firewall logs Web logs Web proxy Windows Error Reporting Windows event logs Windows Registry WMI Objects

Process use of network: Process & IP Relationship

Applicable Objects (Source) Process Process File, Process, Win Registry Key, Service Process Process File Process

Relationship Created Parent_Of Created_By
Modified_Properties_Of Renamed Renamed_By Connected_To

Applicable Objects (Destination) File, Process, Win Registry Key, Service Process Process
File, Win Registry Key, Service File Process IP, Hostname

http://stixproject.github.io/data-model/1.2/cyboxVocabs/ObjectRelationshipVocab-1.1/

Data Source: Process use of network

Process Object process_name process_command_line process_path process_parent_name
user_name hash_sha256
host_name

Connected_To

Ip Object ip_src ip_dst
process_name user_name host_name

Linking it to data sensors (Sysmon)

Process Object process_name process_command_line process_path process_parent_name
user_name hash_sha256
host_name

Sysmon (1) Image
Command_line User
Hashes ParentImage

Linking it to data sensors (Windows Security)

Process Object process_name process_command_line process_path process_parent_name
user_name hash_sha256
host_name

Windows Security (4688) NewProcessName CommandLine SubjectUserName ParentProcessName

Do I have what I need?
Process Object process_name process_command_line process_path process_parent_name
user_name hash_sha256
host_name

Sysmon Image
Command_line User
Hashes ParentImage
Windows Security (4688) NewProcessName CommandLine SubjectUserName ParentProcessName

Do I have what I need? (Modeling Sysmon Events)

Do I have what I need? (mmm... tell me more)
Windows

Execution
Service Execution

Sysmon

Do I have what I need? (What we propose)

Windows

Execution

Service Execution

Process Monitoring

Process Object process_name process_command_line process_path process_parent_name
user_name hash_sha256
host_name

Sysmon

[Remember] Adversaries can influence your data..

"UtcTime">2018-04-11 05:25:02.955 "ProcessGuid">{A98268C1-9C2E-5ACD-0000-0010396CAB00} "ProcessId">4756 "Image">C:\Windows\System32\conhost.exe "FileVersion">10.0.16299.15 (WinBuild.160101.0800) "Description">Console Window Host "Product">Microsoft® Windows® Operating System "Company">Microsoft Corporation "CommandLine">\??\C:\WINDOWS\system32\conhost.exe 0xffffffff -ForceV1 "CurrentDirectory">C:\WINDOWS "User">DESKTOP-WARDOG\wardog "LogonGuid">{A98268C1-95F2-5ACD-0000-002019620F00} "LogonId">0xf6219 "TerminalSessionId">1 "IntegrityLevel">Medium "Hashes">SHA1=B0BF5AC2E81BBF597FAD5F349FEEB32CAC449FA2 "ParentProcessGuid">{A98268C1-9C2E-5ACD-0000-00100266AB00} "ParentProcessId">240 "ParentImage">C:\Windows\System32\cmd.exe
"ParentCommandLine">"C:\WINDOWS\system32\cmd.exe"

High Attacker Influence Rating!!!

https://github.com/mattifestation/BHUSA2018_Sysmon/blob/master/Whitepaper_Subverting_Sysmon.pdf

So, what can I
measure now?
Do I know what I have?

Is this data what I need?

Not all data sources are created equal, data quality matters.

If data needed for a hunting engagement does not meet specific requirements defined by the hunt team, then the data is not considered quality data since it is affecting the intended purpose of it.
"
Data are of high quality if they are fit for their intended uses in operations, decision making and planning."
" - Julian's Quality Handbook -

Data Quality Dimensions
http://mitiq.mit.edu/ICIQ/Documents/IQ%20Conference%201996/Papers/DODGuidelinesonDataQualityManagement.pdf

Data Completeness
 How much data that is
required/needed is available in my network?  Are all required/needed data fields and values recorded?

Data Quality

Data Consistency
 Can we match required/needed fields across data sources?

Data Timeliness
 Does my data represent reality?  How far back in time can I hunt with
required/needed data?

Completeness: Is the expected data complete?

Data Sources / Data Sensors

Sysmon

Endpoints

Windows Security

Database Process Monitoring
Process Object process_ Process_
name command_line

Process Monitoring
Process Object process_ Process_
name command_line

Data Completeness

Completeness: Percentage of network covered?

MacOs

Sysmon

Windows

Linux

Process Monitoring

Process Object process_name process_command_line process_path process_parent_name
user_name hash_sha256
host_name

Data Completeness

Consistency: Across all data sources?

Data Sources / Data Sensors

Sysmon

Endpoints

Windows Security

Database Process Monitoring

Process Object

Image

Process_ command_line

Process Monitoring

Process Object

New

Process_

Process command_line

Data Consistency

Timeliness: Does my data represent reality?

Data Timeliness

Data Sources / Data Sensors

Sysmon

Endpoints

Windows Security

Extract, Transform & Load

Database Process Monitoring

Process Monitoring

Process Object

Image

Process_ command_line

Process Object

New

Process_

Process command_line

Timeliness: Does my data represent reality?

Data Timeliness

Data Sources / Data Sensors

Sysmon

Endpoints

Windows Security

Extract, Transform & Load

Database Process Monitoring

Process Monitoring

Process Object

Image

Process_ command_line

Process Object

New

Process_

Process command_line

Data Retention: 90 Days

A few hunt metrics you could measure:
 What percentage of recommended data is available for a hunt?  What percentage of the expected data is complete for a hunt?  What percentage of my environment could I cover in an hunt based on the available
recommend data?  How far back in time can I hunt with recommended data?  What percentage of my data sources are consistent across all the data provided by
data sensors?  Do I have the right technology or skills to hunt?

Now, this makes more sense?? A little bit?

A little better..

We visualize each type of thing separately

What about DETECTION of adversary techniques?

Does measuring the quality of my data really help me find compromise?

Using statistics to universally measure
Credit to the Towards Data Science blog and their article "Beyond Accuracy: Precision and Recall"

Threat Hunting vs Detection

Precision is being tolerant of False Positives

True Positive - a malicious thing you correctly identify as malicious

Precision = (True Positives/(True Positives + False Positives))

False Positive - a benign thing you incorrectly identify as malicious

Example:
100 events 74 TPs 26 FPs 0.74 precision

Recall is how well you find malicious activity

True Positive - a malicious thing you correctly identify as malicious

Recall = (True Positives/(True Positives + False Negatives))

False Negative - a malicious thing you incorrectly identify as benign

Example:
100 events 55 TPs 21 FPs 24 FNs 0.69 recall

But be wary of extremes
Perfect recall finds all the threat
activity while also generating tons of false positives.
Perfect precision might find nothing
to be malicious, missing all the threat activity without generating any false positives.

Image credit: https://towardsdatascience.com/beyondaccuracy-precision-and-recall-3da06bea9f6c

Wait a darn minute, you skipped something!

How do you determine False Negatives?
1. Adversary simulation tools will show you 2. Your red team will tell you 3. Third parties doing offensive security work
for you will deliver a report on it

Note:
 Many organizations will begin testing in a lab or other contrived environment which need to be representative of your enterprise
 If you're hunting, your environment will absolutely change between measurements
 This is best effort  Vendors often have helpful telemetry, so they have a
leg up on measuring recall
 Data quality directly influences
precision and recall

Quantifying detections using precision and recall

An F1 Score is a value between 0 and 1 that describes how well you judge something to be malicious using precision and recall:

Those examples from before gave us a precision of 0.74 and a recall of 0.69, let's see our F1 score:

F1 = 2 * (0.51/1.43) = 0.71

Image credit: https://towardsdatascience.com/beyondaccuracy-precision-and-recall-3da06bea9f6c

But this value doesn't mean anything to us - at least not yet.

https://en.wikipedia.org/wiki/F1_score

F1 scores are a kind of tolerance for classification

Image credit: https://towardsdatascience.com/beyondaccuracy-precision-and-recall-3da06bea9f6c

What does a 0.71 mean? It means we're capable of finding 60% of malicious things.

F1 scores are a kind of tolerance for classification

Image credit: https://towardsdatascience.com/beyondaccuracy-precision-and-recall-3da06bea9f6c

Do you have a requirement to find 80% of malicious things? Try a threshold of 0.4.
Work backwards to figure out acceptable precision and recall values for this goal.

We can even try to find ideal thresholds!

Image credit: qiita.com

Data science gives us tools for judging how well a classifier works, like how well we judge something to be malicious this is what many machine learning malware classifiers do.
First, a Receiver Operator Characteristic (ROC) curve looks at TP and FP rates on X and Y axes to help display how well our chosen threshold (F1 score) works.
Measuring the area under the curve (AUC) for ROC values is the quantification of how well our classification works given our tolerance for TP and FP values.
Plot these on a regular basis to determine if your detection improves or not.

Closing thoughts
We could keep going with this topic

Links and things (if we talked about it, here it is):

Thing

Link

MITRE ATT&CK

https://attack.mitre.org

MITRE CAR

https://car.mitre.org/wiki/Main_Page

MITRE common data model https://car.mitre.org/wiki/Data_Model

Roberto's Github (Sysmon configs, hunter's playbook, HELK, OSSEM, InvokeAttackAPI)
Endgame Github (RTA, other things)

https://github.com/Cyb3rWard0g https://github.com/endgameinc/

Thank you
If you didn't get a chance to ask a question, come chat with us in person or reach out via social media!
Also we are thankful to the Beyond Data Science blog, MITRE, the ATT&CK team, authors of simulation tools and everyone out there helping change the landscape for defenders.

This is an appendix
All this is stuff we wanted you to have

Quick wins

Count Technique

92

Remote File Copy

92

Standard Application Layer Protocol

91

Command-Line Interface

85

System Information Discovery

75

File and Directory Discovery

70

Credential Dumping

68

Process Discovery

67

Registry Run Keys /Start Folder

62

File Deletion

57

Input Capture

# Techniques Data Source

149

Process monitoring

86

File monitoring

82

Process command-line parameters

36

API monitoring

34

Windows Registry

34

Process use of network

31

Packet capture

28

Authentication logs

23

Netflow/Enclave netflow

17

Binary File Metadata

Data Sources -> Adversary Techniques

# Techniques 149 86 82 36 34 34 31 28 23

Name Process monitoring File monitoring Process command-line parameters API monitoring Windows Registry Process use of network Packet capture Authentication logs Netflow/Enclave netflow

# Techniques 17 16 16 14 12 9 8 8 6

Name Binary file metadata DLL monitoring Network protocol analysis Windows event logs Loaded DLLs System calls SSL/TLS inspection Malware reverse engineering Anti-virus

Data Sources -> Adversary Techniques

# Techniques 6 5 4 4 4 4 4 3 3

Name Data loss prevention Application Logs Network device logs Windows Error Reporting Network intrusion detection system User interface Web proxy Kernel drivers Services

# Techniques 3 3 2 2 2 2 2 2 1

Name Email gateway Third-party application logs Mail server Detonation chamber MBR Environment variable BIOS Host network interface Web logs

Data Sources -> Adversary Techniques

# Techniques 1 1 1 1 1 1 1 1 1

Name Asset Management Web application firewall logs EFI DNS records Browser extensions Sensor health and status Named Pipes VBR PowerShell logs

# Techniques 1 1 1

Name Access Tokens Digital Certificate Logs WMI Objects

