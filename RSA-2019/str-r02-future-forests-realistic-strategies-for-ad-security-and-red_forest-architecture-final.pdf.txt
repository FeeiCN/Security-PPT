SESSION ID: STR-R02
Future Forests: Realistic Strategies for AD Security & "Red Forest" Architecture

Katie Knowles
Security Consultant MWR InfoSecurity @_sigil

#RSAC

· Introduction:
Why AD Matters How AD is Targeted
· Preventing Compromise:
1. Local Credentials 2. Administrative Systems
· Reducing Impact:
What's a "Red Forest"? 3. Administrative Forest 4. Administrative Permissions 5. Tiered Architecture
· Takeaways & Applications

#RSAC
Why AD Matters
· Used by 90% of organizations · Tools allow quick mapping to
high-value targets · Compromise of domain =
Compromise of forest
"Game Over":
Domain Administrator (DA) access to Domain Controller (DC)
3

How AD is Compromised

Compromised Workstation

Recover "Administrator"
Hash

"Administrator" access to IT Workstation

Recover DA Hash

Helpdesk Admin. Password in Memory
4

Access DC: Limited
Administrator

#RSAC
Access DC as DA User

NotPetya
Backdoor in tax software allows attackers to deploy "wiper" disguised as ransomware
NotPetya spreads...
­ EternalBlue (MS17-010)
­ Dumping credentials
Maersk Estimated Impact:
­ $250-300 million in earnings
­ 45k+ PCs + 4k servers rebuilt over 10 days

#RSAC
WIRED, "The Untold Story of NotPetya":
https://www.wired.com/story/notpetya-cyberattackukraine-russia-code-crashed-the-world/
5

#RSAC
Detection vs. Prevention

Fire Tower:
· Identify fires · Monitor spread of fires · Alert base to dispatch firefighters

Fire Break:
· Separate risky environments · Prevent spread of fire · Increase difficulty to burn

Incident Detection

Incident Prevention

6

#RSAC
Resilient AD Architecture
1. Secure Local Credentials 2. Isolate Administrative Systems 3. Create Administrative Forest * 4. Limit Administrative Permissions
& Duration * 5. Adopt Tiered Architecture *
*Red Forest/ESAE Core Concepts
7

Piecing it All Together

1. Unique "Administrator" Credentials
Compromised Workstation

Recover

"Administrator" Recover DA

"Administrator" access to IT

Hash

Hash

Workstation

#RSAC
2. Separate Administrative Workstations
3. Separate Administrative Forest
Access DC as DA User

(Credential Guard)

Helpdesk Admin. Password in Memory

Access DC: Limited
Administrator

4. Limit Administrative Permissions & Duration
5. Create Tiered Architecture

Secure Local Credentials

1. Unique "Administrator" Credentials
Compromised Workstation

Recover

"Administrator" Recover DA

"Administrator" access to IT

Hash

Hash

Workstation

Helpdesk Admin. Password in Memory

Access DC: Limited
Administrator

#RSAC
Access DC as DA User

#RSAC
Secure Local Credentials
Each local system contains a built-in "Administrator" account Credential reuse allows attackers to pivot & Pass the Hash

Generate unique passwords for the "Administrator" account
10

Microsoft's Local Administrative Password Solution (LAPS) randomizes
"Administrator" passwords

#RSAC
Suggestions
· Credentials (passwords, hashes) can still be recovered from memory without Credential Guard ­ Implement for Win10/Server 2016
· Disable or remove remote access from the "Administrator" account
11

Isolate Administrative Systems

Compromised Workstation

Recover

"Administrator" Recover DA

"Administrator" access to IT

Hash

Hash

Workstation

#RSAC
2. Separate Administrative Workstations
Access DC as DA User

Helpdesk Admin. Password in Memory

Access DC: Limited
Administrator

Isolate Administrative Systems
· Same workstation for user and admin functions
· User workstation compromise leads to administrative session compromise
· Separate user and administrator tasks to separate systems

#RSAC
Microsoft's Privileged Access Workstation (PAW) architecture separates Admin & User functions

13

#RSAC
Suggestions
· Environments relying on cloud solutions may require administrative access to external URLs
· Consider a hardened administrative system with access to only specific domains
14

Create Administrative Forest

Compromised Workstation

Recover

"Administrator" Recover DA

"Administrator" access to IT

Hash

Hash

Workstation

Helpdesk Admin. Password in Memory
15

Access DC: Limited
Administrator

#RSAC
3. Separate Administrative Forest
Access DC as DA User

Why a Separate Forest?
Forest 1
Parent Domain

#RSAC

Forest 1
Parent Domain

Forest 2

Child 1

Child 2

· Transitive trust exists between all domains in a forest
· All trust relationships are two-way · Compromise of Child 1 =
Compromise of Child 2 & Parent

Child 1

Child 2 Forest 3

· Nontransitive trust between forests allows creation of external trusts
· Two-way or one-way trust possible · Compromise of Forest 1 =/=
Compromise of Forest 2
16

#RSAC
What's a "Red Forest"?
17

#RSAC
What's a "Red Forest"?
18

What's a "Red Forest"?
· Enhanced Security Administrative Environment (ESAE, aka "Red Forest")
· AD architecture by Microsoft to maximize resiliency
· Architecture based on: 1. Separation of systems by risk 2. Restriction of highest risk accounts to highest risk systems
https://docs.microsoft.com/en-us/windowsserver/identity/securing-privileged-access/securingprivileged-access-reference-material

Tier 0

Forest/

Admin

Domain Admins Workstation

Tier 1

Server Admins
Tier 2

Admin Workstation

Workstation

Admin

Admins Workstation

19

#RSAC
Domain Controller
Server
Workstation

#RSAC
Resilient AD Architecture
1. Secure Local Credentials 2. Isolate Administrative Systems 3. Create Administrative Forest * 4. Limit Administrative Permissions
& Duration * 5. Adopt Tiered Architecture *
*Red Forest/ESAE Core Concepts
20

Separate Administrative Forest
· Compromising users can lead to compromising DAs
· Compromise of domain = Compromise of forest
· Isolate administrative accounts in a separate forest
21

#RSAC

Production Forest

Management Forest

Microsoft's Privileged Access Management (PAM) tools isolate administrators in a separate forest

#RSAC
Suggestions
· Changes can be "reversed" by breaking production & management forest trust
· Make notes on tier separation as changes progress
· There will likely be a balance between cost, risk, and overhead: ­ e.g. Logging in multiple tiers
22

#RSAC
Permissions & Tiers

Compromised Workstation

Recover

"Administrator" Recover DA

"Administrator" access to IT

Hash

Hash

Workstation

Helpdesk Admin. Password in Memory
23

Access DC: Limited
Administrator

Access DC as DA User
4. Limit Administrative Permissions & Duration
5. Create Tiered Architecture

#RSAC
The Implementation:

Bastion\ Jen MFA

MIM POLICY
MIM Portal

Bastion\ HRAdmins

Corp\ Jen

Corp\ HRAdmins

HR Database

https://docs.microsoft.com/en-us/microsoft-identity-manager/pam/privileged-identitymanagement-for-active-directory-domain-services
24

#RSAC
Limit Administrative Availability
· Administrators frequently require (or request) Domain Admin for one-time tasks
· More Domain Admins create more paths to compromise

· Limit permissions, and only grant them for the time required
25

Microsoft's Just Enough Administration (JEA) & Just in Time (JIT) tools limit permissions and availability

#RSAC
Suggestions
· Once authenticated, a session will maintain its privileges ­ Set session timeout on critical systems
· JEA does not require MIM ­ Consider testing JEA before administrative tiers if MIM is not on the roadmap
26

#RSAC
Reduce Breach Impact
· Different devices have different risk levels & needs, e.g.:
­ User workstation needs external web access
­ Domain Controller does not

· Separate devices into "Tiers" based on risk & needs

Microsoft's "Red Forest" separates devices by tier, with suggested devices and hardening requirements for Tier 0 systems
27

#RSAC
Suggestions
· Microsoft recommends 3 tiers: ­ Tier 0: Domain Controllers ­ Tier 1: Servers & sensitive applications ­ Tier 2: User systems, workstations, etc.
· Consider whether this works for the environment that will be changed
· Be realistic about what can and cannot be duplicated within tiers
28

As A Process:
1. Secure Local Credentials
+ Credential Guard
2. Isolate Administrative Systems 3. Create Administrative Forest * 4. Limit Administrative Permissions
& Duration * 5. Adopt Tiered Architecture *
*Red Forest/ESAE Core Concepts
29

#RSAC
Reduce Chance of Compromise
Reduce Impact of Compromise

Software Compatibility

Feature Credential Guard LAPS
JEA
MIM
PAM
ESAE

Description
Protect credentials in memory from attackers with administrative access.
Configure unique passwords for local "Administrator" account on each system.
Powershell tools to limit permissions a user can request, and for how long requested permissions are granted.
Allows simple creation of a separate management forest.
Contains JIT functionality. Implemented using MIM.
Separation of devices into tiers. Management via MIM, PAM, JEA, & JIT.

Domain Level N/A 2003 SP1 N/A
2003* N/A See above.

OS Server 2016 / Windows 10 Server 2003 SP2 / Vista Server 2012 / Windows 8
N/A
Server 2012 R2 / Windows 8 See above.

* Forest created for management must be 2012+ 30

#RSAC

#RSAC
Takeaways
· Securing Active Directory is critical to avoiding large-scale incidents
· Microsoft's "Red Forest" prevents the major methods attackers use against AD
· Each step towards Red Forest significantly improves AD security *
* Even if full Red Forest is not currently feasible
31

#RSAC
Get Started:
Quick Wins (1-3 months)
­ Implement Local Administrative Password Solution (LAPS) ­ Configure Credential Guard on applicable systems
Feasibility Assessment (2-5 months, "Proof of Concept")
­ Test hardened administrative workstations (PAWs) ­ Create an isolated administrative forest to test common tasks
Decisions (3-6 months)
­ Determine if "Red Forest" implementation makes sense based on:
o Proof of Concept findings o Business priorities
32

Questions?
Or reach out any time: katie.knowles@mwrinfosecurity.com @_sigil
Article:
www.mwrinfosecurity.com/our-thinking/plantingthe-red-forest-improving-ad-on-the-road-to-esae/

