#RSAC

SESSION ID: CSCS-W08
The Cloud Gray Zone: Vulnerabilities Found in Azure Built-in VM Agents

Nir Ohfeld
Senior Security Researcher Wiz @nirohfeld

Shir Tamari
Head of Research Wiz @shirtamari

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other co-sponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
The Cloud
3

#RSAC
The Cloud
4

#RSAC
Basic Management
­ Hardware ­ Operating System ­ Snapshots ­ Start / restart / shutdown / pause ­ Networking ­ Monitoring ­ And more...

#RSAC
Virtual Machines Management
­ Automations ­ Deployment ­ Logs collection ­ Configuration Management ­ Software updates ­ Security

#RSAC
Cloud Middleware
(Fancy name for: Agents)

#RSAC
Used by All Cloud Service Providers

· AWS Systems Manager Agent (SSM)
· Amazon Inspector Classic agent
· AWS PV drivers · Amazon ECS agent

· Azure Linux Agent (waagent)
· Azure Log Analytics agent
· Azure Monitor agent · Azure Recovery
Services Agent · Azure Connected
Machine agent · Azure Guest
Configuration agent

· Google Guest agent · Google Ops Agent · Google OS Config Agent
8

#RSAC
Agents Have Security Implications
­ Which privileges do these agents have? ­ Do they expose potential attack surfaces? ­ How do these agents get security updates? ­ Who is responsible for updating these agents?
9

#RSAC
To Complicate Things Up
­ Agents are pre-installed in the OS image ­ Agents are secretly installed in run-time ­ How can you defend against a risk you don't know about?
10

#RSAC
The Shared Responsibility Model

Cloud Vendors

Physical Security

Network

Hardware

Managed Services

Cloud Customers

Compute Configuration Instances

Application

Identities

11

#RSAC
The Shared Responsibility Model

Cloud Vendors

Physical Security

Network

Hardware

Managed Services

Cloud Middleware

Cloud Customers

Compute Configuration Instances

Application

Identities

12

#RSAC
Session Outline
­ Finding Multiple Azure middleware vulnerabilities ­ How NOT to patch cloud middleware ­ The broader problem with cloud middleware
13

#RSAC
Case Study: Azure OMI Agent

#RSAC
Cloud Middleware in Azure
­ Azure has a default Linux agent ­ WAAgent ­ Open-source!
https://github.com/Azure/WALinuxAgent ­ Capable of installing feature-specific agents
Are there any more middleware software in Azure?
15

#RSAC
How to Find Cloud Middleware Software
Push all the buttons in the user interface
16

#RSAC
WAAgent Installs "OMI"
17

#RSAC
What Is OMI and Why Is It Running As Root?
The official OMI GitHub page
18

#RSAC
19

#RSAC
What Is OMI?
Open source project
­ Microsoft in collaboration with The Open Group
Windows Management Infrastructure (WMI) for UNIX/Linux systems Used by many Azure services
­ Open Management Suite (OMS) ­ Azure Insights ­ Azure Automation ­ Many more...
20

#RSAC
OMI Functionalities
Query running Docker containers Examine log files Run maintenance commands Query process list Gather system statistics
21

#RSAC
OMI Attack Surface
­ Runs with root privileges ­ In some cases, opens an external port for HTTP requests ­ Allows for multiple dangerous functionalities
Arbitrary command execution Arbitrary file read
22

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
CVE-2021-38648 - Local Privilege Escalation

#RSAC
OMI Processes
32

OMI Architecture Overview

Running as nir

Running as OMI

#RSAC
Running as root
33

OMI Architecture Overview

Running as nir

Running as OMI

#RSAC
Running as root
34

OMI Architecture Overview

Running as nir

Running as OMI

#RSAC
Running as root
35

OMI Architecture Overview

Running as nir

Running as OMI

#RSAC
Running as root
36

#RSAC
Executing Commands via OMI
37

Who Are You?

Running as nir

Running as OMI
?

#RSAC
Running as root
38

#RSAC
Authentication Info
39

#RSAC
Authentication Info After Allocation
40

OMI Execution Flow
Authentication Request
AuthStruct
uid = null gid = null

#RSAC
41

#RSAC
OMI Execution Flow

Authentication Request

Authentication Request (supplying user identity)

AuthStruct
uid = null gid = null

42

#RSAC
OMI Execution Flow

Authentication Request

Authentication Request

Authentication Response (uid=1003, gid=1003)
AuthStruct
uid = 1003 gid = 1003

43

OMI Execution Flow

Authentication Request

Authentication Request

Authentication Response

Authentication Response

AuthStruct
uid = 1003 gid = 1003

#RSAC
44

#RSAC
OMI Execution Flow

Authentication Request

Authentication Request

Authentication Response

Authentication Response

Execute /bin/id

AuthStruct
uid = 1003 gid = 1003
Execute /bin/id (uid=1003, gid=1003)

45

#RSAC
OMI Execution Flow

Authentication Request

Authentication Request

Authentication Response

Authentication Response

Execute /bin/id

AuthStruct
uid = 1003 gid = 1003
Execute /bin/id (uid=1003, gid=1003)

uid=1003(nir) gid=1003(nir) groups=1003(nir) uid=1003(nir) gid=1003(nir) groups=1003(nir)

46

OMI Execution Flow

Authentication Request

Authentication Request

AuthStruct
uid = null gid = null

#RSAC
47

OMI Execution Flow

Authentication Request

Authentication Request

AuthStruct

uid = 0

gid = 0

#RSAC
48

#RSAC
Zero has a meaning
uid=0 & gid=0 are equal to root!
49

#RSAC
It Doesn't Hurt To Try

Authentication Request

Authentication Request

Authentication Response

Authentication Response

Execute /bin/id

AuthStruct

uid = 0

gid = 0

Execute /bin/id (uid=0, gid=0)

uid=0(root) gid=0(root) groups=0(root)

uid=0(root) gid=0(root) groups=0(root)

50

#RSAC
CVE-2021-38647 ­ Remote Command Execution as root

#RSAC
It's Time To Look at the Configuration
52

#RSAC
It's Time To Look at the Configuration
53

#RSAC
Are You Listening?
54

#RSAC
What Language Are You Speaking?
What is the protocol for communication?
­ HTTP obviously
Yes, but what is the real protocol?
How do we reverse-engineer the protocol?
­ Read through thousands of lines of code ­ Blackbox
55

#RSAC
OMI Remote Communication
56

#RSAC
Regular OMI Remote Command Request
Valid credentials
57

#RSAC
Command Output
58

#RSAC
Basic Logic
"Skip the authentication, and you are root"
59

#RSAC
Basic Logic

Authentication Request

Authentication Request

Authentication Response

Authentication Response

Execute /bin/id

AuthStruct

uid = 0

gid = 0

Execute /bin/id (uid=0, gid=0)

uid=0(root) gid=0(root) groups=0(root)

uid=0(root) gid=0(root) groups=0(root)

60

#RSAC
Wrong Credentials Request
61

#RSAC
Fingers Crossed
62

#RSAC
Request to Root
63

#RSAC
64

#RSAC
Who is Affected?

­ All Azure customers who use Linux machines and enabled one of the following services:

1. Azure Stack Hub

2. Azure Sentinel

Privilege Escalation

3. Azure Security Center 4. Azure Monitor (Container Monitoring Solution) 5. Azure Log Analytics

6. Azure Update Management

7. Azure Diagnostics

8. Azure Automation State Configuration (DSC)

65

#RSAC
Who is Affected?

­ All Azure customers who uses Linux machines and enabled one of the following services:

1. Azure Stack Hub

2. Azure Sentinel

Privilege Escalation

3. Azure Security Center 4. Azure Monitor (Container Monitoring Solution) 5. Azure Log Analytics

6. Azure Update Management

7. Azure Diagnostics

8. Azure Automation State Configuration (DSC)

Remote Code Execution & Privilege Escalation

66

#RSAC
The Patching Moment
June 1, 2021 - Reported all 4 vulnerabilities to MSRC
­ With a 90 days disclosure deadline
Aug 12, 2021 - Microsoft fixed the vulnerabilities in the OMI project
67

#RSAC
Releasing a New Version
New version release in Sep 8, 2021 Six days before CVD on Sep 14, 2021 (Patch Tuesday)
68

#RSAC
Patch Tuesday - Sep 14, 2021
Microsoft releases software patches for OMI Customers are required to update the agents themselves
69

#RSAC
The Day of Public Disclosure
Customers are required to update the agents
­ It is unclear if the vulnerabilities affect Azure customers ­ Most customers are not familiar with OMI ­ Not a fair request
As a result, most customers remained vulnerable and helpless
70

#RSAC
The Day of Public Disclosure
We have an emergency meeting with MSRC
­ Mitigation guidelines were not working ­ Azure was still serving vulnerable agent
71

#RSAC
The Day After
72

#RSAC
Two Days Later
73

#RSAC
Two Days Later
Microsoft auto-updated and auto-patched all OMI agents Provided detailed mitigation guidelines
74

#RSAC
The Broader Issue

#RSAC
Agents' Security
Agents are an attack vector:
­ Supply chain risk ­ Run with high privileges ­ Listen on external network interfaces
And therefore:
­ Threat model any agent in the environment ­ Ask vendors security questions before installation
76

#RSAC
Lack of Transparency
Customers have a security exposure they are not aware of!
77

#RSAC
Who is Responsible?
Users:
­ Threat model cloud agents the same as you do with any 3rd party software ­ Keep records of the agents ­ Track and detect agent vulnerabilities
78

#RSAC
Who is Responsible?
Cloud Providers:
­ Share more information on cloud agents ­ Issue CVEs ­ Provide mitigation guidance ­ Alert customers
79

#RSAC
Cloud Middleware Dataset
GitHub.com/wiz-sec/cloud-middleware-dataset
80

#RSAC
Questions?
GitHub.com/wiz-sec/cloud-middleware-dataset
@nirohfeld @ShirTamari
81

Q&A

#RSAC
82

