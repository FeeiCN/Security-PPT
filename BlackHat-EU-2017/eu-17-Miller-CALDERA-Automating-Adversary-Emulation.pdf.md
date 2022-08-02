CALDERA
Automating Adversary Emulation
Andy Applebaum, Doug Miller
The MITRE Corporation
Approved for Public Release. Distribution Unlimited. Case Number 17-4315

© 2017 The MITRE Corporation. All rights reserved.

|2|
Bios

Andy Applebaum Lead Cyber Security Engineer
ATT&CK, AI Research

Doug Miller Sr. Cyber Security Engineer ATT&CK, CARET, Red teaming

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

|3|
Adversary Emulation?
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

|4|
The False Negative Problem
As a defender, you have no idea what you miss
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

|5|
Cue: Adversary
§ Introduce a realistic* adversary on your network
*an emulated adversary
§ Now you can determine what happens if an attacker gets on your
network ­ Did I detect them? ­ How far did they get? ­ How can I improve my detection and prevention?
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

|6|
Iterative Defensive Cycle

Emulate Adversary

CALDERA

You
Improve Defenses

Introspect

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

|7|
Successful Adversary Emulation
Make it real: Use the same techniques, tools, methods and goals of an attacker End-to-End: Don't just look for holes or perform small attacks. Start from the initial compromise and go until objectives are accomplished Repeatable: Be repeatable, so that your detection and prevention improvement (or degradation) can be measured over time
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

|8|
CALDERA:
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

|9|
CALDERA ­ Conducting an Operation
1.Load the CALDERA shim onto network hosts 2.Create an adversary by giving it capabilities 3.Launch the operation
§ During the operation:
­ CALDERA will report its activities, including artifacts created ­ CALDERA will automatically stop if it has exhausted its toolkit
§ After the operation:
­ CALDERA will provide a report of what it did ­ CALDERA will automatically "reset" infected hosts, removing artifacts and stopping
processes
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 10 |
Ingredients for Automated Adversary Emulation
What the adversary can do
· The adversary model · MITRE ATT&CKTM
How the adversary chooses what to do
· CALDERA logic and decision engine
What the adversary needs to do it
· Infrastructure to support real adversary emulation · Management server; client agents; web interface
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 11 |
The Adversary Model

| 12 |
Choosing an Adversary Model
CALDERA emulates a real adversary after they get into a network
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 13 |
ATT&CK MatrixTM Tactics and Techniques

Persistence

Privilege  Escalation

Defense  Evasion

Credential  Access

Discovery

Lateral  Movement

Execution

Collection

Exfiltration

Command  and  Control

DLL  Search  Order  Hijacking

Brute  Force

Account  Discovery

Windows  Remote  Management

Audio  Capture

Automated  Exfiltration

Commonly  Used  Port

Legitimate  Credentials

Accessibility  Features

Binary  Padding

AppInit  DLLs

Code  Signing

Local  Port  Monitor

Component  Firmware

New  Service

DLL  Side--Loading

Path  Interception

Disabling  Security  Tools

Scheduled  Task

File  Deletion

File  System  Permissions  Weakness Service  Registry  Permissions  Weakness

File  System  Logical  Offsets

Web  Shell

Indicator  Blocking  

Authentication  Package

Exploitation  of  Vulnerability Bypass  User  Account  Control

Bootkit

DLL  Injection

Credential  Dumping
Credential  Manipulation Credentials  in  Files Input  Capture

Application  Window  

Third--party  Software

Discovery

Application  Deployment  

Command--Line

File  and  Directory  Discovery

Software

Exploitation  of  Vulnerability Local  Network  Configuration  

Execution  through  API
Execution  through  Module Load

Discovery

Logon  Scripts

Graphical  User  Interface

Network  Sniffing

Local  Network  Connections  

Discovery

Two--Factor  Authentication   Interception

Network  Service  Scanning

Peripheral  Device  Discovery

Pass  the  Hash Pass  the  Ticket Remote  Desktop  Protocol Remote  File  Copy Remote  Services

InstallUtil MSBuild PowerShell Process  Hollowing Regsvcs/Regasm

Permission  Groups  Discovery

Replication  Through   Removable  Media

Regsvr32 Rundll32

Automated  Collection Clipboard  Data

Data  Compressed Data  Encrypted

Communication  Through   Removable  Media

Data  Staged

Data  Transfer  Size  Limits

Connection  Proxy

Data  from  Local  System Exfiltration  Over  Alternative  

Data  from  Network  Shared  

Protocol

Drive

Exfiltration  Over  Command  

Data  from  Removable  Media and  Control  Channel

Custom  Command  and   Control  Protocol
Custom  Cryptographic   Protocol
Data  Encoding

Email  Collection Input  Capture

Exfiltration  Over  Other   Network  Medium

Data  Obfuscation Fallback  Channels

Screen  Capture Video  Capture

Exfiltration  Over  Physical   Medium
Scheduled  Transfer

Multi--Stage  Channels Multiband  Communication

Component  Object  Model   Hijacking

Component  Object  Model   Hijacking

Process  Discovery

Shared  Webroot

Scheduled  Task

Multilayer  Encryption

Basic  Input/Output System
Change  Default  File   Association
Component  Firmware External  Remote  Services
Hypervisor Logon  Scripts Modify  Existing  Service

Indicator  Removal  from   Tools
Indicator  Removal  on  Host
Install  Root  Certificate InstallUtil
Masquerading Modify  Registry
MSBuild

Query  Registry Remote  System  Discovery

Taint  Shared  Content Windows  Admin  Shares

Security  Software  Discovery

System  Information   Discovery
System  Owner/User   Discovery

Scripting Service  Execution
Windows  Management   Instrumentation

Remote  File  Copy Standard  Application  Layer  
Protocol Standard  Cryptographic  
Protocol
Standard  Non--Application   Layer  Protocol
Uncommonly  Used  Port

Netsh  Helper  DLL

Network  Share  Removal

System  Service  Discovery

Web  Service

Redundant  Access

NTFS  Extended  Attributes

System  Time  Discovery

Registry  Run  Keys  /  Start   Folder

Obfuscated  Files  or   Information

Security  Support  Provider

Process  Hollowing

Shortcut  Modification

Redundant  Access

Windows  Management   Instrumentation  Event  
Subscription

Regsvcs/Regasm Regsvr32 Rootkit

Winlogon  Helper  DLL

Rundll32 Scripting Software  Packing

https://attack.mitre.org

Timestomp © 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 14 |
Supported Adversary Actions

Persistence
­ Registry autorun keys ­ Scheduled Task ­ Services
Privilege Escalation
­ Weak service perms ­ Weak service file perms ­ Unquoted paths (Path interception)
Defense Evasion
­ Scripting ­ Timestomping
Credential Access
­ Credential Dumping
Lateral Movement
­ Remote File Copy ­ Windows Admin shares ­ Pass the Hash ­ PsExec

Discovery
­ Remote System Discovery ­ Local Network config ­ Registry ­ Account ­ System information ­ Processes/services ­ System Owner ­ Permission Group ­ Files
Execution
­ PowerShell ­ Scheduled Task ­ WMI ­ SC (service controller)
Exfiltration
­ HTTP/S

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 15 |
Decision Making for Automated Adversary Emulation

| 16 |
Early CALDERA

§ First version
­ Finite-state machine (FSM) approach ­ Successfully tested within MITRE

Scan for Hosts

Dump Credentials

Select Target

Scan Target

Move Laterally

§ Hard to extend to new techniques
­ Action needs to be coded into FSM ­ FSM logic needs to be recomputed ­ Inflexible in operation; hard to configure

Exfiltrate Data

Establish Persistence

Modify User Password

Escalate Privileges

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 17 |
Early CALDERA

§ First version
­ Finite-state machine (FSM) approach ­ Successfully tested within MITRE

Scan for Hosts

Dump Credentials

Select Target

Scan Target

Move Laterally

§ Hard to extend to new techniques
­ Action needs to be coded into FSM ­ FSM logic needs to be recomputed ­ Inflexible in operation; hard to configure
§ Predictability during execution
­ Easy to spot and identify

Establish Persistence

Modify User Password

Exfiltrate Data

Visualized with the MITRE CyGraph tool

Escalate Privileges

Noel, S., et al. "CyGraph: Graph-Based Analytics and Visualization for Cybersecurity." Handbook of Statistics 35 (2016): 117-167.

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 18 |
Designing an Adversary Decision Engine
§ Typical engagements have human
operators dictating and controlling the assessment
­ Targeting, TTP selection, domain inference... ­ ... all needs to be fully automated!
§ Ideally, our automated adversary will:
­ Make intelligent choices ­ Achieve tactical objectives ­ Easily incorporate new techniques ­ Work in new and unknown environments ­ Vary operations to test the defense ­ Chain weaknesses for maximum effect
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 19 |
Example Scenario

Host 1

Host 2

§ Start with code execution and a RAT on Host 1

§ Identified sensitive files on Host 2

§ Goal: exfiltrate sensitive data from Host 2

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 20 |
Example Scenario

Host 1
Exploit Vuln

Mount Share

Remote Desktop

Copy File

Dump Credentials

Remote Execution

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

Host 2

Exfiltrate Data

| 21 |
Analyzing Copying Over a File

Host 1

Host 2

§ What do we need to do to copy a RAT over?

­ Working RAT on source host

­ Mounted file share from target onto source host

Requirements, or preconditions

­ Write access to file share
§ What happens after copying a RAT over?

­ There will be a new file on the target host ­ That file will contain the RAT

Consequences, or postconditions

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 22 |
Making a Plan to Copy a File

Host 1
Dump Credentials
·· Need: Elevated RAT ·· Get: Credentials

Mount Share
·· Need: Credentials ·· Get: Mounted Share

Host 2
Copy File
·· Need: Mounted Share ·· Get: File on Target

Sequence of actions, or plan
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 23 |
The Core CALDERA Idea
§ Move from an explicit, prescribed decision model towards a dynamic,
model-based one
§ Tag actions with semantic execution information:
­ Preconditions specify the requirements that must be true to execute a technique ­ Postconditions specify the consequences that will be true after executing a technique
§ No longer need to be explicitly told what to do!
­ Instead, compare the current state to the available actions to determine which are valid
§ Added bonus: planning for the future
­ If I dump credentials now, that can help me execute lateral movement in the future!
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 24 |
Fun With Preconditions
§ Preconditions tell you what you can do
now
­ In chess: can tell you which moves are valid ­ Taken further: can tell you which moves are
legal
§ In the emulation sense: given an
escalated foothold on a host, we can:
­ Dump credentials ­ Add/modify registry keys ­ Setup scheduled tasks ­...
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 25 |
Fun With Postconditions
§ Postconditions tell you what will be true
after
­ With preconditions, can chain actions together to plan for the future
­ Can evaluate potential futures to select the best immediate action
In the emulation sense: given an escalated foothold on a host, we can:
Dump credentials and then laterally move Add/modify registry keys and then dump credentials Setup scheduled tasks and then add/modify registry keys ...
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

4

| 26 |
Fun With Postconditions
§ Postconditions tell you what will be true
after
­ With preconditions, can chain actions together to plan for the future
­ Can evaluate potential futures to select the best immediate action
§ In the emulation sense: given an
escalated foothold on a host, we can:
­ Dump credentials and then laterally move ­ Add/modify registry keys and then dump
credentials ­ Setup scheduled tasks and then add/modify
registry keys ­...
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

4

Making Progress

?

Host 1
Exploit Vuln

Mount Share

Remote Desktop

Copy File

Dump Credentials

Remote Execution

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

Host 2

| 27 |
Exfiltrate Data

| 28 |
Building Plans: Copying a File

Dump Credentials

Host 1
Mount Share

Copy File

Remote Execution

Host 2
Exfiltrate Data

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 29 |
Building Plans: Exploiting a Vulnerability

Dump Credentials
Exploit Vulnerability

Host 1
Mount Share
Exfiltrate Data

Copy File

Remote Execution

Host 2
Exfiltrate Data

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 30 |
Building Plans: Remote Desktop Protocol

Host 1

Dump Credentials

Mount Share

Copy File

Remote Execution

Exploit Vulnerability

Exfiltrate Data

Dump Credentials

Remote Desktop

Exfiltrate Data

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

Host 2
Exfiltrate Data

| 31 |
Selecting the Right Plan

Host 1

Dump Credentials

Mount Share

Copy File

Remote Execution

Exploit Vulnerability

Exfiltrate Data

Dump Credentials

Remote Desktop

Exfiltrate Data

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

Host 2
Exfiltrate Data

?

| 32 |
Selecting the Right Plan ­ The CALDERA Heuristic

Host 1

Host 2

Dump Credentials

Mount Share

Copy File

Remote Execution

Exfiltrate Data

Exploit Vulnerability

Exfiltrate Data

Dump Credentials

Remote Desktop

Exfiltrate Data

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

§ Assign each action a reward § Score plans on summed weighted rewards

Action

Reward Action

Reward

Exfiltrate Data

100

Copy File

5

Dump Credentials 50

Others

1

| 33 |
The Language of Pre/Postconditions: The Data Model
§ Need a way to logically encode what the pre and postconditions of
techniques are
­ Can specify requirements/consequences by specifying facts over a data model
§ CALDERA's language: objects and typed fields
­ Objects reference commonly used Windows components ­ Fields specify properties of objects, restricted by type
§ Constructed by default, some fields may not be defined
­ (this is important later!)
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

An Example Host Object

Object
Host

Field
fqdn admins hostname dns_domain_name local_profiles system_info processes os_version

| 34 |
Example
pc1234.test.org [("andy", "doug")]
pc1234 test.org [("andy")]
... [("512", "133", "415", ...)]
"Windows 7"

Object

String

Integer

DateTime

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

Boolean

Reference

List

Diving into the Data Model

Schtask
name host status cred +5 Credential
found_on_host password user Hash

Service
name host start_type error_control +7 Domain
windows_domain dns_domain

TimeDelta
seconds microseconds
host
OSVersion
os_name major_version minor_version build_number

Rat
host elevated executable username
pid Host
fqdn admins hostname os_version
+4

Object

String

Integer

DateTime

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 35 |

Process
host image_name
pid tid +11 File
host path src_host src_path +8
Boolean

Persistence
host user_context
elevated regkey_artifact
+2 Share
share_name dest_host share_path src_host
mount_point
Reference

RegKey
host key path_to_file value data User
username host
is_group domain
sid
List

| 36 |
Declaring Actions
§ CALDERA provides a syntax to declare actions
­ Preconditions specify the requirements ­ Postconditions specify the effects ­ Not_equal specifies inequality invariants ­ Preproperties specify that certain fields must be defined but not necessarily a specific value ­ Postproperties specify that certain fields will be defined after execution
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 37 |
Declaring Actions
§ CALDERA provides a syntax to declare actions
­ PrecclaossndNeittUiosen(Sstespp):ecify the requirements
value = 0 preconditions = [("rat", OPRat),
('host', OPHost),
­ Postconditions spe(c"icfryedt"h,eOPeCfrfeedcetnstial({'$in': {'user': OPVar("host.admins")}})), ('user', OPUser(OPVar("cred.user"))), ('domain', OPDomain(OPVar("user.domain")))]
­ Not_epqoustacol nsdpiteiconifsie=s[(in'sehqaruea_gli't,y OiPnSvhaarrei(a{n"stsrc_host": OPVar("rat.host"), "dest_host": OPVar("host"), 'share_name': 'C$'}))]
­ Prepronopt_eerqtuiaels=s[p('ehcoisfty',th'arattc.heorstta'i)n] fields must be defined but not necessarily a specific value
preproperties = ['domain.windows_domain', 'cred.password', 'host.fqdn', 'user.username'] postproperties = ["share_g.share_path", "share_g.mount_point"]
­ Postpdreotperemirntiiestsics=peTrcuiefy that certain fields will be defined after execution
§ Easy, right?
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

CALDERA's Planning Algorithm

1. Update the world state 2. Figure out all valid actions to execute 3. Construct plans that lead off with those actions
­ Chain actions together by leveraging model
4. Run heuristic to determine best plan 5. Execute the first action in the best plan 6. Repeat

Obtain Actions

Update State

| 38 |
Select Action

Construct Plans

Evaluate Plans

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 39 |
And we're done! ...Right?
§ Using pre and postconditions we can dynamically construct plans and choose
actions
§ Meets our goals:
­ Can construct plans to make intelligent choices ­ Can easily incorporate new techniques by defining pre/postconditions ­ Can modify rewards/included actions to vary operations ­ Chains weaknesses to achieve goals ­ Functions in new environments*
§ Wait ­ functions in new environments?
­ Actually, maybe not: when constructing plans, there is a significant amount of uncertainty! ­ Consider dumping credentials:
§ Sometimes they're great creds § Sometimes there's none
§ In reality ­ handling uncertainty is a very hard problem!
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 40 |
And we're done! ...Right?
§ Using pre and postconditions we can dynamically construct plans and choose
actions
§ Meets our goals:
­ Can construct plans to make intelligent choices ­ Can easily incorporate new techniques by defining pre/postconditions ­ Can modify rewards/included actions to vary operations ­ Chains weaknesses to achieve goals ­ Functions in new environments*
§ Wait ­ functions in new environments?
­ Actually, maybe not: when constructing plans, there is a significant amount of uncertainty! ­ Consider dumping credentials:
§ Sometimes they're great creds § Sometimes there's none
§ In reality ­ handling uncertainty is a very hard problem!
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 41 |
And we're done! ...Right?
§ Using pre and postconditions we can dynamically construct plans and choose
actions
§ Meets our goals:
­ Can construct plans to make intelligent choices ­ Can easily incorporate new techniques by defining pre/postconditions ­ Can modify rewards/included actions to vary operations ­ Chains weaknesses to achieve goals ­ Functions in new environments*
§ Wait ­ functions in new environments?
­ Actually, maybe not: when constructing plans, there is a significant amount of uncertainty! ­ Consider dumping credentials:
§ Sometimes they're great creds § Sometimes there's none
§ IHnorffemaalnitny, J­öhrga.n"SdilminuglatuendcPeernteatirnattiyonisTeastvinegr:yFhroamrd" Dpijrkosbtrlae"mto!" Turing Test++"." ICAPS. 2015.
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 42 |
A Quick Fix with Hints
§ If we can't predict the outcome of an action, use hints § Hints are crafted to be the "best" outcome of the action
­ E.g. performing credential dumping gives me a "useful" credential
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 43 |
Architecture

| 44 |
System Architecture

Admin

Agent

HTTP Server

Attacker Model

World State

Planner

Database

Execution Engine

RAT
Clients
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

Server

| 45 |
System Architecture
§ Server and Agent written in Python 3 § Rat written in C# § MongoDB § Web interface is a JavaScript based web app § pyDatalog logic backend
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 46 |
Demo

| 47 |
Walking Through an Operation

Admin

Agent

Agent

Clients

Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 48 |
Walking Through an Operation

Admin

Agent

Agent

Clients

Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 49 |
Walking Through an Operation

Admin

Agent

Agent

Clients

Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 50 |
Walking Through an Operation

Admin

Agent

Agent

Clients

RAT
Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 51 |
Walking Through an Operation

Admin

Agent
Clients

Agent
Check in
RAT
Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 52 |
Walking Through an Operation

Admin

New Rat

Agent

Agent

Clients

RAT
Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 53 |
Walking Through an Operation

Admin

Agent
Clients

Agent
Get Command
RAT
Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 54 |
Walking Through an Operation

Admin

Agent
Clients

Agent

Get Command

RAT
Clients

HTTP Server
Database

Attacker World Model State
Planner
Execution Engine
Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 55 |
Walking Through an Operation

Admin

Agent

Agent

Clients

RAT
Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 56 |
Walking Through an Operation

Admin

Agent

Agent

Clients

RAT
Clients

HTTP Server
Database

Attacker World Model State
Planner
"sc create \\hostb ..."
Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 57 |
Walking Through an Operation

Admin

Agent
Clients

HTTP Server

Agent
"sc create \\hostb ..."
RAT

Database

Clients

Attacker World Model State
Planner
Execution Engine
Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 58 |
Walking Through an Operation

Admin

Agent

Agent

RAT
Clients

RAT
Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 59 |
Walking Through an Operation

Admin

Agent
Checkin
RAT
Clients

Agent
RAT
Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 60 |
Walking Through an Operation

Admin

New Rat

Agent

Agent

RAT
Clients

RAT
Clients

HTTP Server

Attacker World Model State
Planner

Database

Execution Engine

Server

© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 61 |
CALDERA Applications
§ Testing analytics and sensors ­ Does my stuff work? § Data generation ­ What does bad look like? § Red/blue team training ­ I need practice!
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 62 |
Community Participation
§ Want to get involved with CALDERA? We accept Pull Requests
­ Bugfixes ­ Implement a new adversary (ATT&CK) technique ­ Usability features ­ Integration with other tools and frameworks ­ Enhancements to our data model
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 63 |
Other (Free) Tools
BloodHound ­ Attack Path Generation
§ https://github.com/BloodHoundAD/BloodHound
GoFetch ­ Automatic Execution of BloodHound paths with PowerShell tools
§ https://github.com/GoFetchAD/GoFetch
ANGRYPUPPY ­ Automatic execution of BloodHound paths with Cobalt Strike
§ https://github.com/vysec/ANGRYPUPPY
Death Star ­ Automatic Execution of attack paths with PowerShell Empire
§ https://github.com/byt3bl33d3r/DeathStar
Atomic Red Team
§ https://github.com/redcanaryco/atomic-red-team
Metta
§ <no url yet>
(Probably more, sorry if we missed you)
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 64 |
Related (MITRE) Efforts
§ BRAWL: Automated Bot-vs-Bot Games
­ Free data! ­ https://github.com/mitre/brawl-public-game-001
§ BRAWL Shared Format (BSF)
­ Standardized format to correlate red bot vs blue bot cyber games
§ CASCADE: Automated Host-based Investigations
­ https://github.com/mitre/cascade-server
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 65 |
Why this Matters
§ The False Negative problem is real § Offensive testing with Adversary Emulation can help § Automation (like CALDERA) and human adversary emulation are
complementary
§ Pre and postconditions + planning are powerful § Help Us!
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 66 |
Show me the code!
github.com/mitre/caldera
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

| 67 |
MITRE is a not-for-profit organization whose sole focus is to operate federally funded research and development centers, or FFRDCs. Independent and objective, we take on some of our nation's--and the world's--most critical challenges and
provide innovative, practical solutions.
Learn and share more about MITRE, FFRDCs, and our unique value at www.mitre.org
© 2017 The MITRE Corporation. All rights reserved. Approved for Public Release. Distribution Unlimited. Case Number 17-4315

