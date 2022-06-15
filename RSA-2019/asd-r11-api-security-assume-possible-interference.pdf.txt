SESSION___ID__:_ASD-R11___
API Security: Assume Possible Interference
Julie Tsai
Cybersecurity Leader & Advisor
#RSAC

APIs - Application Programming Interfaces: #RSAC How the 2019 World Wide Web Communicates
A Protocol?
A FRAMEWORK FOR INTERACTION, EXCHANGING DATA AND SERVICES
2

#RSAC
Be a Journalist to Secure APIs

WHO WHAT WHERE WHEN WHY HOW

Like Hilde
3

#RSAC
Specifically...
WHO => aka AuthN (Authentication) via AuthID WHAT => aka AuthZ (Authorization) via OAuth WHERE => Are Sessions, Keys, Tokens Stored? WHEN => Does Access and Data Expire? WHY => Our Purpose for Accessing This Data HOW Least-Privilege, Explicit Trust, Implicit Deny
4

#RSAC
360-View on Exploitability
Do the services interact in a way that creates the least astonishment? Is the lifecycle and travel path of the data known? Is the data forgotten after use? Can this be proven?
What if authorization models for different services get mixed? To different users, with different privileges?
5

#RSAC
Wait, didn't containers and service isolation solve this?
PHOTO TITLE
6

#RSAC
BUT API IS JUST THE BEGINNING...
There's still some stuff beneath the hood
7

#RSAC
Defense-in-Depth Matters
SECURITY IS FULL-STACK OSI PROBLEM - LAYERS1-7,8,9...10
10? RELIGIOUS 9? POLITICAL 8? ECONOMIC L7. APPLICATION L6. PRESENTATION L5. SESSION L4. TRANSPORT L3. NETWORK L2. DATA LINK L1. PHYSICAL
8

Defense-in-Depth Matters
What could happen?!
L10. RELIGIOUS - LEAPS OF FAITH + FUD L9. POLITICAL - MISALIGNMENTS
L8. ECONOMIC - UNDERRESOURCED L7. APP - CODE ALLOWS WRONG ACCESS L6. PRESENTATION - SSL WEAK CIPHER/MITM L5. SESSION - CLEARTEXT COMMS COMPROMISED L4. TRANSPORT - UDP DNS REFLECTION L3. NETWORK - COMPROMISED TRUSTED IP
L2. DATA LINK - PINEAPPLE WIFI L1. PHYSICAL - INTRUDER PLUGS IN CONSOLE IRL
9

#RSAC

SHIFT LEFT & SHIFT RIGHT
Upstream Secure Containers & End-State Monitoring

Containers and Chroot Jails:

#RSAC

Classic Tune, New Words

Dedicated namespaces and resources. Process isolation. Ephemerality.

But shared kernel.

Example threat model - https://www.twistlock.com/2016/12/06/protectingcontainerized-apps/: Malicious container attacks underlying OS or other containers

11

Container SRC as Workhorses, Not Just Cattle
#RSAC

(Skipping the pets -

you know why you

12

shouldn't make

pets)

Workhorse & Cattle Lifecycle
Container Lifecycle: Cattle v. Workhorse

1. Born
Instance created
2. Eat/Sleep
Powered but no new changes to instance, or updates to image
3. Expire
When deprecated or compromised/ vulnerable, instance terminated with no feedback

1. Born #RSAC
Instance created
2. Trained
Secured configs/ images
3. Updated
Config & Repos continuously updated
4. Corral
Use cgroups to authorize. System calls whitelists.
5. Maintain or Expire

13

Maintain by chef/

puppet/cfengine/

ansible/salt etc.

Or expire.

Container SRC as Workhorses, not Just Cattle#RSAC
(Skipping the pets - you know why you shouldn't make pets)
Container images must be maintained, not just fire and forget or expiraton.
Expiring the compromised container or service (i.e. shooting the cattle) only solves once. But the herd needs to be inoculated ­ to evolve ­ beyond issues to prevent recurrence. Or, think of baking a cake vs. stir-frying*.
*CREDIT ~DALVES.
--> So what? Well, upstream learned remediation drives down Rate of Defect Recurrence! In practical terms, you note and track the vuln, and incorporate the fix in the Dockerfile (or source code or secure patch repo) in source-controlled, change-managed config. So it scales beyond that one image.
Example https://engineering.salesforce.com/open-sourcing-dockerfile-imageupdate-6400121c1a75
14

#RSAC
Workhorse Communication: Service Mesh
From https://dotnetvibes.com/2018/07/23/sidecar-design-pattern-in-your-microservices-ecosystem/
15

Less Is More in Containers
WHAT'S A HARDENED CONTAINER?
LET'S WALK THROUGH THIS:
1. strip down packages, especially easily exploitable ones useful to hackers (telnet, ftp, make, gdb, nmap, strace, legacy daemons)
2. minimize host/network services and daemons
3. ssh and account enforcement
4. logs
5. key file/config alerting
6. vulns + patching scanning
7. and... scrap anything in there you don't need.
16

#RSAC

Monitoring the End-State

#RSAC

Abuse, Anomalies, and Access

What's Normal? Anomalies in conjunction tell the story.

We don't know - and can't comprehensively predict - what we don't know. Root cause and security incidents don't present themselves as such upfront.

What to do? Flag + Correlate for simple indicators of what shouldn't be happening. i.e. Resources volume or ways that shouldn't be used. Things that shouldn't be accessed. Non-cyclical transaction trends.
17

Post-Flight Gut-Check DevSecOps
AKA ARE WE SEC-ING AND OPS-ING WITH OUR DEV-ING?
1. Security, Compliance, Privacy When are your S-C-P pros leveraged in the process for the product? Customer development,
inception or design, dev or testing, alpha ­ or when an "event" happens?

#RSAC

2. Uptime and Performance Do we truly know it better than our end-users?

3. Scale Complexity and Change Is there the necessary speed in deployments/change across all of your teams? Can you accommodate (or tolerate) diverse deployment & build methods across teams? Do you get the same level of visibility, health, and security from each of them?
18

Guidelines & Guardrails
THE RIGHT AMOUNT OF STRUCTURE

The Right Amount of Structure
#RSAC
The Right Amount of Structure - a Score
20

#RSAC
Where To Use Guardrails 1
1. AuthN/AuthZ (AutheNtication/AuthoriZation)
21

#RSAC
Where To Use Guardrails 2
1. AuthN/AuthZ 2. Lifecycle of the Data
22

#RSAC
Where To Use Guardrails 3
1. AuthN/AuthZ 2. Lifecycle of the Data 3. Build Integration
23

#RSAC
Where To Use Guardrails 4
1. AuthN/AuthZ 2. Lifecycle of the Data 3. Build Integration 4. Production Deployment
24

#RSAC
Where To Use Guardrails 5
1. AuthN/AuthZ 2. Lifecycle of the Data 3. Build Integration 4. Production Deployment 5. Change - Code, Configs, Dependencies
25

#RSAC
Where To Use Guardrails 6
1. AuthN/AuthZ 2. Lifecycle of the Data 3. Build Integration 4. Production Deployment 5. Change - Code, Configs, Dependencies 6. Regression Test - Catch the Ripple
26

#RSAC
Where To Use Guardrails 7
1. AuthN/AuthZ 2. Lifecycle of the Data 3. Build Integration 4. Production Deployment 5. Change - Code, Configs, Dependencies 6. Regression Test - Catch the Ripple 7. Security & Compliance Requirements
27

#RSAC
Where To Use Guidelines 1
...WITH INTERNAL CONSISTENCY IN RELEVANT SCOPE
1. Develop/Build in the OS/Language You Will
28

#RSAC
Where To Use Guidelines 2
...WITH INTERNAL CONSISTENCY IN RELEVANT SCOPE
1. Develop/Build in the OS/Language You Will 2. Use the Tools That Work for You, without
Significantly Hampering Others
29

#RSAC
Where To Use Guidelines 3
...WITH INTERNAL CONSISTENCY IN RELEVANT SCOPE
1. Develop/Build in the OS/Language You Will 2. Use the Tools That Work for You, without Significantly
Hampering Others 3. Deployment Methods. CI/CD Innovation. Private or
Public Cloud. Bare Metal. Multi-cloud or Single.
30

#RSAC
Where To Use Guidelines 4
...WITH INTERNAL CONSISTENCY IN RELEVANT SCOPE
1. Develop/Build in the OS/Language You Will 2. Use the Tools That Work for You, without Significantly
Hampering Others 3. Deployment Methods. CI/CD Innovation. Private or
Public Cloud. Bare Metal. Multi-cloud or Single. 4. How DevSecOps Manifests in Your Org
31

#RSAC
Where To Use Guidelines 5
...WITH INTERNAL CONSISTENCY IN RELEVANT SCOPE
1. Develop/Build in the OS/Language You Will
2. Use the Tools That Work for You, without Significantly Hampering Others
3. Deployment Methods. CI/CD Innovation. Private or Public Cloud. Bare Metal. Multi-cloud or Single.
4. How DevSecOps Manifests in Your Org
5. Culture -- Congruence of the Walk with the Talk
32

#RSAC
Are We There Yet?
From monolith to microservices... Decoupling dependencies... Agile, independent teams... Continuous Deployment of epheremal containers... Open, networked world...
33

#RSAC
Are We There Yet?
...with Great Power Comes Great Responsibility. 34

#RSAC
References & Image Credits
35

