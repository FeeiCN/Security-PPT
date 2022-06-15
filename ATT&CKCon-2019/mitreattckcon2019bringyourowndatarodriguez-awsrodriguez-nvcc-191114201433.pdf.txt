Ready to ATT&CK?
Bring Your Own Data (BYOD) and Validate Your
Data Analytics!
1

@Cyb3rWard0g & @Cyb3rPandaH
 Projects  @HunterPlaybook  @THE_HELK  ATTACK-Python-Client  @OSSEM_Project  @Mordor_Project  OpenHunt  Blacksmith & More
 Founders:  @HuntersForge

https://github.com/hunters-forge

2

Agenda
 Explore ATT&CK  2018 -> 2019
 ATT&CK Data Sources Opportunities  Enter Mordor  Mordor & CAR  CAR & Threat Hunter Playbook (Notebooks)  Hunters Forge!
3

Explore ATT&CK
How do I query ATT&CK?
4

Exploring ATT&CK Metadata!
5

How do I access ATT&CK Metadata?
6

ATTACK-Python-Client Github Project
 A Python module to access up to date ATT&CK content available in STIX via public TAXII server. It leverages cti-python-stix2 and ctitaxii-client python libraries developed by MITRE.
 Goals  Allow the integration of ATT&CK content with other platforms  Allow security analysts to quickly explore ATT&CK content and apply it in their daily operations  Explore all available ATT&CK metadata at once  Learn STIX2 and TAXII Client Python libraries

https://github.com/hunters-forge/ATTACK-Python-Client

7

ATTACK-Python-Client Installation
 Via PIP: pip install attackcti  Or Straight from Source
 git clone https://github.com/huntersforge/ATTACK-Python-Client
 cd ATTACK-Python-Client  pip install .
 Jupyter Notebooks Available
 pip install -r requirements.txt  cd notebooks  jupyter lab

https://github.com/hunters-forge/ATTACK-Python-Client

8

Some Available Functions

https://attackcti.readthedocs.io/en/latest/attackcti_functions.html

9

ATT&CK Metadata - Jupyter Notebook

https://github.com/hunters-forge/ATTACK-Python-Client/tree/master/notebooks

10

Explore ATT&CK
Querying ATT&CK 101
11

12

13

Explore ATT&CK
Any New Data Sources?
14

ATT&CK Techniques (519) and Data Sources
 Almost 51% of techniques have data sources defined
 Around 49% of techniques do NOT have data sources defined
 Pre-ATT&CK data sources maybe?  Opportunities to collaborate and
define those without data sources?

https://github.com/hunters-forge/ATTACK-Python-Client/blob/master/notebooks/ATT%26CK_DataSources.ipynb

15

ATT&CK Techniques (519) and Data Sources

https://github.com/hunters-forge/ATTACK-Python-Client/blob/master/notebooks/ATT%26CK_DataSources.ipynb

16

Looking for anything to do this weekend?

https://github.com/hunters-forge/ATTACK-Python-Client/blob/master/notebooks/ATT%26CK_DataSources.ipynb

17

ATT&CK Techniques with Data Sources (265)

File Monitoring: 107 Techniques

Process Monitoring: 178 Techniques

Process Command Line: 103 Techniques

https://github.com/hunters-forge/ATTACK-Python-Client/blob/master/notebooks/ATT%26CK_DataSources.ipynb

18

ATT&CKing with the right data
ATT&CKcon 2018 Talk!
19

Credentials in Registry -> DS -> Sub-DS -> Events

Windows Registry

T1214

Process Monitoring

Process Creation

Process

created

Process

Process Termination

User

terminated

Process

Process Write To Process

Process

wrote_to

Process

Security 4688
Sysmon 1
Security 4689
Sysmon 8

Process Command-Line
Parameters

Process Access

Process

accessed

Process

Sysmon 10

https://www.youtube.com/watch?v=QCDBjFJ_C3g

20

ATT&CK Data (OSSEM-> attack_data_sources)

https://github.com/hunters-forge/OSSEM

21

A lot more to do..
Going deeper!
22

API-To-Event Project (Windows Security)

https://github.com/hunters-forge/API-To-Event

23

Security

https://github.com/hunters-forge/API-To-Event

24

API-To-Event Project (Windows Sysmon)

https://github.com/hunters-forge/API-To-Event

25

Sysmon

https://github.com/hunters-forge/API-To-Event

26

A few opportunities!
Exploring Data Sources 2.0!
27

A few opportunities..
 ATT&CK Data sources covered by other data sources  Windows Event Logs data source is too broad!  ATT&CK data sources and the wrong platforms!  Validation of ATT&CK data sources
recommendations  What specific event logs per data source?
28

A few opportunities!
 ATT&CK Data sources covered by other data sources  Windows Event Logs data source is too broad!
29

Credentials in Registry - Windows Registry

Windows Registry

Registry Creation

Process

created

Registry

T1214

Process Monitoring

Process Command-Line
Parameters

Registry Deletion

Process

deleted

Registry

Registry Modification

Process

modified

Registry

Registry Access

Process

accessed

Registry

https://www.youtube.com/watch?v=QCDBjFJ_C3g

Sysmon 12
Sysmon 12
Security 4663
Sysmon 13
Security 4657
Security 4663
30

Windows Registry & Windows Security Event Logs?

Windows Registry

T1214

Process Monitoring

Process Command-Line
Parameters

Registry Creation

Process

created

Registry

Registry Deletion

Process

deleted

Registry

Registry Modification

Process

modified

Registry

Registry Access

Process

accessed

Registry

Sysmon 12
Sysmon 12
Security 4663
Sysmon 13
Security 4657
Security 4663

https://www.youtube.com/watch?v=QCDBjFJ_C3g

31

ATT&CK Techniques with Data Sources (265)

File Monitoring: 107 Techniques

Process Monitoring: 178 Techniques

Process Command Line: 103 Techniques

https://github.com/hunters-forge/ATTACK-Python-Client/blob/master/notebooks/ATT%26CK_DataSources.ipynb

32

ATT&CK Techniques with Data Sources (265)

File Monitoring: 107 Techniques

Process Monitoring: 178 Techniques

Process Command Line: 103 Techniques

Windows Event Logs

https://github.com/hunters-forge/ATTACK-Python-Client/blob/master/notebooks/ATT%26CK_DataSources.ipynb

33

Windows Event Logs ... a Universe Behind?

4768

4657 4656

4660 4658

4670

4771 4770

4776 4769

Windows Event Logs

5140

5142

5144

5143

4663

4741

4742

4743

https://www.youtube.com/watch?v=QCDBjFJ_C3g

34

Windows Event Logs

4656

4657

Audit Registry

4658 4660

Windows Event Logs

4670 4663

Audit Computer Account Management

4741 4742 4743

Win Registry Access Request Win Registry Deletion Request Win Registry Key Value Modification Win Registry Key Handle Closed
Win Registry Key Deletion Win Registry Key Permissions Change
Win Registry Key Access Win Registry Key Deletion
Computer Account Creation Computer Account Change Computer Account Deletion

https://www.youtube.com/watch?v=QCDBjFJ_C3g

35

Windows Event Logs

4656

4657

Audit Registry

4658 4660

Windows Event Logs

4670 4663

Audit Computer Account Management

4741 4742 4743

Win Registry Access Request Win Registry Deletion Request Win Registry Key Value Modification Win Registry Key Handle Closed
Win Registry Key Deletion Win Registry Key Permissions Change
Win Registry Key Access Win Registry Key Deletion
Computer Account Creation Computer Account Change Computer Account Deletion

https://www.youtube.com/watch?v=QCDBjFJ_C3g

36

Windows Event Logs

Windows Event Logs

Audit Registry

Win Registry Access Request

4656

Win Registry Deletion Request

4657

Win Registry Key Value Modification

4658

Win Registry Key Handle Closed

4660

Win Registry Key Deletion

4670

Win Registry Key Permissions Change

4663

Win Registry Key Access

Win Registry Key Deletion

https://www.youtube.com/watch?v=QCDBjFJ_C3g

37

Windows Event Log 4656: A handle to an object was requested

Audit Registry
4656
Audit File System

Win Registry Access Request Win Registry Deletion Request
File Access Request File Deletion Request

Windows Registry
File Monitoring

https://www.youtube.com/watch?v=QCDBjFJ_C3g

38

Windows Event Log 4657: A registry value was modified

Audit Registry
4656
Audit File System

Win Registry Access Request Win Registry Deletion Request
File Access Request File Deletion Request

Windows Registry
File Monitoring

4657

Audit Registry

Win Registry Key Value Modification

Windows Registry

https://www.youtube.com/watch?v=QCDBjFJ_C3g

39

Windows Event Log 4658: The handle to an object was closed

Audit Registry
4656
Audit File System

Win Registry Access Request Win Registry Deletion Request
File Access Request File Deletion Request

Windows Registry
File Monitoring

4657

Audit Registry

Win Registry Key Value Modification

Windows Registry

4658

Audit File System

File Handle Closed

File Monitoring

https://www.youtube.com/watch?v=QCDBjFJ_C3g

40

Currently collaborating with ATT&CK team..
41

A few opportunities!
ATT&CK data sources and the wrong platforms!
42

ATT&CK Windows Data Sources & Platform (2019)

https://github.com/hunters-forge/ATTACK-Python-Client/blob/master/notebooks/ATT%26CK_DataSources.ipynb

43

A few opportunities!
 Validation of ATT&CK data sources recommendations  What specific event logs per data source?
44

Credentials in Registry - Windows Registry

Windows Registry

Win Registry Access Request Win Registry Deletion Request

T1214

Process Monitoring

Process Command-Line
Parameters

Win Registry Key Value Modification Win Registry Key Handle Closed
Win Registry Key Permissions Change Win Registry Key Deletion Win Registry Key Access

https://www.youtube.com/watch?v=QCDBjFJ_C3g

Security 4656
Sysmon 13
Security 4657
Security 4658
Security 4670
Sysmon 12
Security 4660
Security 4663
45

Wait! Where is all this happening so far?
46

Data Analytics Development (Example)

Define a Research Goal
Document and Communicate
Findings

Model Data

Simulate Adversary

Validate Detection Model

Define Detection Model

https://www.youtube.com/watch?v=DuUF-zXUzPs

47

Data Analytics Development (Example)

Define a Research Goal
Document and Communicate
Findings

Model Data

Simulate Adversary

Validate Detection Model

Define Detection Model

https://www.youtube.com/watch?v=DuUF-zXUzPs

48

How do we validate our data recommendations?
49

Data Analytics Development (Example)

Define a Research Goal
Document and Communicate
Findings

Model Data

Simulate Adversary

Validate Detection Model

Define Detection Model

https://www.youtube.com/watch?v=DuUF-zXUzPs

50

More than just testing security controls!

Simulate Adversary

Test Security Controls
Model Adversary Behavior

 Endpoint Agent Detection  Analytics Platform Rules  Can I see it in my environment?
 Learn adversary behavior  Map data sources to adversary actions  Study derived techniques

51

A basic adversary simulation flow!

Plan Engagement

Emulate Adversary

Enable Telemetry

Collect & Analyze Data

No
Can I see it?

Document Results Yes

https://www.sans.org/cyber-security-summit/archives/file/summit-archive-1571754303.pdf

52

What do we need for Credentials in Registry?

https://attack.mitre.org/techniques/T1214/

53

What do we need for Credentials in Registry?

https://attack.mitre.org/techniques/T1214/

54

What else do we need for Credentials in Registry?
 Windows Registry?  Enable Audit Object Access > Audit Registry
 Process Monitoring?  Enable Audit Detailed Tracking > Audit Process Creation
 Process Command-line Parameters?  Enable Administrative Templates\System\Audit Process Creation > Include command line in process creation events
55

What else do we need for Credentials in Registry?

 Windows Registry?  Enable Audit Object Access > Audit Registry  Set Audit Rule to trigger event!
 Process Monitoring?  Enable Audit Detailed Tracking > Audit Process Creation
 Process Command-line Parameters?  Enable Administrative Templates\System\Audit Process Creation > Include command line in process creation events

https://docs.microsoft.com/en-us/windows/win32/secauthz/access-control-lists

56

What else do we need for Credentials in Registry?
 What are we testing?  Available default automatic logon user Settings!!
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" Name AutoAdminLogon -Value 1
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" Name DefaultUserName -Value pgustavo
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" Name DefaultPassword -Value W1n1!2019

https://github.com/hunters-forge/Blacksmith/blob/master/aws/mordor/cfn-files/scripts/default/Join-Domain.ps1#L37-L49

57

What else do we need for Credentials in Registry?
 Set Audit Rule! How?
 Download https://github.com/hunters-forge/Set-AuditRule  Import-module Set-AuditRule.ps1  Set-AuditRule -RegistryPath
"HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -IdentityReference Everyone Rights QueryValues -InheritanceFlags None -PropagationFlags None -AuditFlags Success

https://github.com/hunters-forge/Set-AuditRule/blob/master/registry/default_logon_user.md

58

What else do we need for Credentials in Registry?
 Testing Commands?
 reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f password /t REG_SZ /s
59

What about technique variations?
60

What else do we need for Credentials in Registry?
 Testing Commands?
 reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f password /t REG_SZ /s
 Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name *password*
 C#, Python, etc!
61

Are we ready?
62

We need an environment setup.. working!
63

Execute -> Collect -> Analyze -> Repeat

Simulating Adversarial Technique

Data produced

Test Security Controls

Model Adversary Behavior
64

Same Technique + Some Variations
Data produced

Test Security Controls

Model Adversary Behavior
65

Credentials in Registry Data Mapping

Process

Queried

Registry Key Value

66

Credentials in Registry Data Mapping

Process

Queried

EVENT ID TASK

4688

Process Creation

4673

Sensitive Privilege Use

4656

Registry (Request Handle)

4690

Handle Manipulation

4663

Registry (Access)

4658

Registry (Closing Handle)

4689

Process Termination

Registry Key Value

67

Credentials in Registry Data Mapping

Process

Queried

Registry Key Value

EVENT ID TASK

4688 4673 4656

Process Creation Sensitive Privilege Use Registry (Request Handle)

Process Monitoring
Process Command-Line Parameters

4690 4663

Handle Manipulation Registry (Access)

Windows Registry

4658

Registry (Closing Handle)

4689

Process Termination

Process Monitoring

68

Credentials in Registry - Windows Registry

Windows Registry

Win Registry Access Request Win Registry Deletion Request

T1214

Process Monitoring

Process Command-Line
Parameters

Win Registry Key Value Modification Win Registry Key Handle Closed
Win Registry Key Permissions Change Win Registry Key Deletion Win Registry Key Access

https://www.youtube.com/watch?v=QCDBjFJ_C3g

Security 4656
Sysmon 13
Security 4657
Security 4658
Security 4670
Sysmon 12
Security 4660
Security 4663
69

Credentials in Registry - Windows Registry

Windows Registry

Win Registry Access Request Win Registry Deletion Request

T1214

Process Monitoring

Process Command-Line
Parameters

Win Registry Key Value Modification Win Registry Key Handle Closed
Win Registry Key Permissions Change Win Registry Key Deletion Win Registry Key Access

https://www.youtube.com/watch?v=QCDBjFJ_C3g

Security 4656
Sysmon 13
Security 4657
Security 4658
Security 4670
Sysmon 12
Security 4660
Security 4663
70

Spending +time producing data & -time analyzing

Data produced

Test Security Controls

Takes Time! Similar Events?

Model Adversary Behavior
71

Same Technique + Some Variations

EVENT ID TASK

4688

Process Creation

4673

Sensitive Privilege Use

4656

Registry (Request Handle)

4690

Handle Manipulation

4663

Registry (Access)

4658

Registry (Closing Handle)

4689

Process Termination

Test Security Controls
Model Adversary Behavior

72

We might be all doing this..
73

We might be doing this over and over..
74

What if we share our datasets?
75

From Zero to Data Analytics Validation!
76

Enter Mordor
77

Mordor Project @Mordor_Project
 Pre-recorded security events generated by simulated adversarial techniques in the form of JavaScript Object Notation (JSON)
 Pre-recorded data categorized by platforms, adversary groups, tactics and techniques defined by the Mitre ATT&CK Framework.
 Data represents not only specific known malicious events but additional context/events that occur around it.

https://github.com/Cyb3rWard0g/mordor

78

Mordor Standard Environments

 Environment designed to replicate a small research network  Standardized and documented setup  Platforms
 Windows  Linux  Endpoints Telemetry  Windows Security Auditing  Event Tracing for Windows (ETW) (NEW!!)  Network Telemetry  Network Logs  Environments Available: Shire and Erebor

https://mordor.readthedocs.io/en/latest/index.html

79

Mordor Environments: The Shire
80

The Shire Design
81

The Shire Telemetry: Win Logs & Sysmon

https://github.com/Cyb3rWard0g/OSSEM/tree/master/data_dictionaries/windows/sysmon

82

The Shire: Event Log -> WEC -> HELK

https://mordor.readthedocs.io/en/latest/mordor_shire.html#

83

Mordor Environments: Erebor (Lonely Mountain)
84

Erebor Design
85

Erebor Telemetry: ETW Events via SilkETW
https://medium.com/threat-hunters-forge/threat-hunting-with-etw-events-and-helk-part-1-installing-silketw-6eb74815e4a0 86

Erebor: ETW Events -> Event Log -> WEC -> HELK
87

How do you collect data?
 We use Kafkacat!  kafkacat is a generic non-JVM producer and consumer for Apache Kafka
>=0.8, think of it as a netcat for Kafka.  In consumer mode
 Kafkacat reads messages from a topic and prints them to standard output (stdout). You can also redirect it to a file (i.e. JSON)
 In producer mode
 Kafkacat reads messages from standard input (stdin). You can also send data to kafkacat by adding data from a file.

https://github.com/edenhill/kafkacat

88

Consuming Data (Taking a snapshot of data)
$ kafkacat -b <Kafka-IP>:9092 -t <kafka-Topic> -C -o end > file.json
 -b : Kafka broker  -t : Topic to consume from  -C : Consumer Mode  -o : Offset to start consuming from

https://mordor.readthedocs.io/en/latest/export_mordor.html

89

Consuming Data -> Creating Mordor File (Video)

https://mordor.readthedocs.io/en/latest/export_mordor.html

90

Consuming Data -> Creating Mordor File (Demo 02)

https://mordor.readthedocs.io/en/latest/export_mordor.html

91

Producing Data (Injecting Adversary Dataset)
92

Producing Data (Injecting Adversary Dataset)
$ kafkacat -b <Kafka-IP>:9092 -t <kafka-Topic> -P -l file.json
 -b : Kafka broker  -t : Topic to produce to  -P : Producer Mode  -l : Send messages from a file

https://mordor.readthedocs.io/en/latest/import_mordor.html

93

I just want to download all the datasets..
$ git clone https://github.com/huntersforge/mordor.git $ cd mordor/small_datasets/ $ find . -type f -name "*.tar.gz" -print0 | sudo xargs -0 -I{} tar xf {} -C .
94

Expedite Analytics Validation!
Data produced

Test Security Controls

YOU CAN DO IT NOW!

Model Adversary Behavior

https://github.com/hunters-forge/mordor

95

Validate Analytics!
Validate Analytics

Mordor File

2 + 2 = 4
96

Where do we get analytics from?
97

I have data with me and I am ready!
98

Mordor & CAR
The MITRE Cyber Analytics Repository (CAR)!
99

CAR-2019-08-001: Credential Dumping via Windows Task Manager
 The Windows Task Manager may be used to dump the memory space of lsass.exe to disk for processing with a credential access tool such as Mimikatz. This is performed by launching Task Manager as a privileged user, selecting lsass.exe, and clicking "Create dump file". This saves a dump file to disk with a deterministic name that includes the name of the process being dumped.
 This requires filesystem data to determine whether files have been created.  Contributors: Tony Lambert/Red Canary

https://car.mitre.org/analytics/CAR-2019-08-001/

100

But, How do I simulate that technique?
101

Interactive Task Manager Lsass dump (Demo 03)
https://github.com/huntersforge/mordor/blob/master/small_datasets/windows/credential_access/credential_dumping_T1003/interactive_taskmngr_ls 102

Interactive Task Manager Lsass dump (Demo 03)
https://github.com/huntersforge/mordor/blob/master/small_datasets/windows/credential_access/credential_dumping_T1003/interactive_taskmngr_ls 103

CAR-2019-08-001: Procdump - File Create (Pseudocode)
files = search File:Create lsass_dump = filter files where (
file_name = "lsass*.dmp" and image_path = "C:\Windows\*\taskmgr.exe") output lsass_dump

https://car.mitre.org/analytics/CAR-2019-08-001/

104

But, where do I run that?
105

Enter Jupyter Notebooks
106

What are Jupyter Notebooks?
 Think of a notebook as a document that you can access via a web interface that allows you to save:  Input (live code)  Output (evaluated code output)  Visualizations and narrative text (Tell the story!)
 Uses include:  Data cleaning and transformation  Statistical modeling  Data visualization  Machine learning, and much more

https://jupyter.org/

107

How Do Jupyter Notebooks Work?
 Jupyter Notebooks work with what is called a two-process model based on a kernel-client infrastructure.
 This model applies Read-Evaluate-Print Loop (REPL):  Takes a single user's inputs  Evaluates them  Returns the result to the user

https://jupyter.org/

108

Jupyter Notebooks Architecture

Client

Jupyter Server

Kernel

WebSockets

ZeroMQ

Notebook File (json)
Jupyter Document

https://jupyter.org/

109

Mordor -> Jupyter Notebooks
CAR-2019-08-001: Credential Dumping via Windows Task Manager
110

The ThreatHunter-Playbook @HunterPlaybook
 A Threat hunter's playbook to aid the development of techniques and hypothesis for hunting campaigns by leveraging security event logs from diverse operating systems.
 It documents detection strategies in the form of interactive notebooks to provide an easy and flexible way to visualize the expected output and be able to run the analytics against prerecorded mordor datasets

https://github.com/hunters-forge/ThreatHunter-Playbook

111

OpenHunt Library
 Via PIP: pip install openhunt  Or Straight from Source
git clone https://github.com/Cyb3rPanda/openhunt
cd OpenHunt && pip install .

https://github.com/hunters-forge/openhunt

112

Is You Ready? haha
114

Hunt The Planet!
115

Threat Hunters Forge Community!
116

Threat Hunters Forge Slack Community!
https://launchpass.com/threathunting
117

Remember this initiative with Mordor?
118

What if everyone gets a notebook too?
119

Wait, Whaaat?
120

Wait, Whaaat?
121

The Binder Project
 The Binder Project is an open community that makes it possible to create shareable, interactive, reproducible environments.
 The main technical product that the community creates is called BinderHub, and one deployment of a BinderHub exists at mybinder.org.
 Who is it for?:  Researchers, Educators, people analyzing data and people trying to communicate the data analysis to others!!

https://mybinder.readthedocs.io/en/latest/introduction.html#what-is-the-binder-project

122

BinderHub
BinderHub connects several services together to provide on-the-fly creation and registry of Docker images. It utilizes the following tools:
 A cloud provider such Google Cloud, Microsoft Azure, Amazon EC2, and others  Kubernetes to manage resources on the cloud  Helm to configure and control Kubernetes  Docker to use containers that standardize computing environments  A BinderHub UI that users can access to specify Git repos they want built  BinderHub to generate Docker images using the URL of a Git repository  A Docker registry (such as gcr.io) that hosts container images  JupyterHub to deploy temporary containers for users

https://binderhub.readthedocs.io/en/latest/overview.html

123

Binder Design!

https://github.com/repo https://github.com/repo

Docker Image Exists?
Yes

Yes

Up to date?

No
Repo2Docker Pod

Docker Registry

Push Image

No

Creates

Jupyter Notebook Pod

Kubernetes Cluster

https://binderhub.readthedocs.io/en/latest/overview.html#a-diagram-of-the-binderhub-architecture

124

Open Infrastructure for Open Hunts!

https://github.com/hunters-forge/ThreatHunter-Playbook

125

Open Infrastructure for Open Hunts! (LIVE!)
https://mybinder.org/v2/gh/ hunters-forge/ThreatHunterPlaybook/master
126

Threat Hunter Playbooks via Binder (Video)

https://github.com/hunters-forge/ThreatHunter-Playbook

127

128

Goal: Share and Empower the Community!
129

Let's do it together!
130

Threat Hunters Forge References
 GitHub: https://github.com/hunters-forge  Python Library: https://github.com/Cyb3rPanda/openhunt  Slack Invitation: https://launchpass.com/threathunting  Official Blog: https://medium.com/threat-hunters-forge  Founders: @Cyb3rWard0g & @Cyb3rPandaH  Official Twitter: @HuntersForge  @HunterPlaybook  @THE_HELK  @OSSEM_Project, @Mordor_Project & More

Thank You! Muchas Gracias!
132

