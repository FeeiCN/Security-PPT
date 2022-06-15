SESSION ID: IDY-T08
More than Vaulting: Adapting to New Privileged Access Threats

Lance Peterman
Enterprise Security Architect Merck @lpeterman

#RSAC

#RSAC
About Me
§ Formerly IAM Strategy & Platform Lead at Merck
§ Also, Teach Software Architecture & Design at UNC-Charlotte
§ Also, Board & Founding member of IDPro
§ Opinions are my own § Twitter: @lpeterman

#RSAC
Why we can't get a Perfect 10 in the Vault

#RSAC
2 years ago...

#RSAC
My use case...

#RSAC
6

#RSAC

Existing & Emergent Patterns

How Privilege is (mis)Used

New Responses

#RSAC
Existing & Emergent Patterns

PAM Reference Architecture (2015)

Privileged Access Management

Password Vault

Session Management & Recording

PAM Policy
Management

Discovery & Policy
Enforcement

Session Review

Information Technology Resources

Policy Store

SRM/Ticketing

Workflow

Logging & Audit
SIEM / Analytics

CMDB / Change Management

Identity & Access Management
Identity Management
Non-person Credential Management
Access Certification

9

#RSAC

PAM Reference Architecture 2019

Just in Time Administration

Privileged Access Management

Credential Vault

Session Management & Recording

PAM Policy
Management

Discovery & Policy
Enforcement

Session Review

Secret/Key Management

Information Technology & InfoSec Resources

Policy Store

SRM/Ticketing

Workflow

Logging & Audit
SIEM

CMDB / Change Management
**Analytics/ AI/ML

EPM & EDR
SOC/ Incident Response

Identity Governance & Administration
Identity Management
Non-person Credential Management
Access Certification

#RSAC

#RSAC
Vaulting

#RSAC
Session Management

#RSAC
Local Admin Management/EPM

#RSAC
Secrets/Key Management
Market is fragmented here ­ AWS, Ansible, Chef, Vault, CyberArk...lots more Does this belong in IAM? Similar challenge with CIAM & API management for many enterprises DevSecOps emergence is helping generate momentum for this, but cultural challenges remain...

#RSAC
Secrets / Key Management

Developers

InfoSec
15

#RSAC
Other Patterns/Approaches
Just in Time Administration - Elevation vs. Vaulting for person & non-person accounts Analytics...got a minute, or 90? AI/ML ­ Lots of potential here, but can you get the right (and all) of the data for training SOC & Incident Response ­ How fast can you shut down privilege abuse/misuse?

#RSAC
How Privilege is (mis)Used

#RSAC

#RSAC
June 27, 2017 6am EDT

#RSAC
NotPetya

#RSAC

#RSAC
MimiKatz "cute kitten"
"Swiss army knife" (or multi-tool) of Windows credentials created by Benjamin Delpy (@gentilkiwi) Needs local admin for `most' functions
Leverages weaknesses/features in:
­ LSASS - Local Security Authority Subsystem Service ­ credentials stored in memory after use
Can leverage credentials stored as (depending on OS level):
­ Kerberos tickets ­ NTLM password hashes ­ LM password hashes ­ Clear-text passwords
GREAT Resource for understanding MimiKatz ­ ADSecurity.org

#RSAC

#RSAC

#RSAC
Other Windows OS/protocol threats
Kerberoasting Vulnerabilities in Kerberos (UN)Constrained Delegation (KCD) GPO Permissions Deeply Nested AD Groups - Do you really know where your privileges are... Notice that little of this is explicitly identity related? Or is it?

#RSAC
Other Vectors
(I)IoT ­ Mirai showed us what default admin passwords can do SaaS & IaaS accounts (ie. O365 & ec2 user) ­ How well do you know your privileged accounts not tied to central IDP? Network ­ Much is shifting to layer 7, where are your privileges now?
26

#RSAC
Secrets Revealed

#RSAC
IOT Exploits

#RSAC
Insider threat is still a thing...

#RSAC

#RSAC
New Responses

#RSAC
Technology Arrows
Use EPM or similar tools to reduce/eliminate local admin privileges wherever possible If you don't have secrets/key management, explore the need. Talk to your vendors. Have an IoT platform? Find out, explore gateways for segmentation Consider automated tools for privileged account discovery

#RSAC
More Technology `Arrows'
Reduce privilege `scale' through segmentation (ex. AD Red Forest) Eliminate credential caching where possible MFA for sensitive internal apps, even regular users Consider analytics for privilege abuse use cases but make sure you get the data

#RSAC
Process `Arrows'
Reduce privilege `scale' through segmentation (ex: SCCM admins), including number of admins per server Consider software updates a threat vector (supply chain attack) Leverage Least Privilege (LPM)wherever possible (see people arrows) Defense in depth should be a mindset, look beyond Layer 7 for solutions

#RSAC
More Process `Arrows'
Embed security & identity in your SDLC (Push Left, thanks Tanya Janca @shehackspurple) Same for Change Management (CMDB is your most important identity asset) If you use Policy, leverage it to the hilt for privileged access compliance

#RSAC
People `Arrows'
Partner with Developers on Secrets & Local Admin
Partner with InfoSec on expanding privilege analysis, focus on LPM, and Defense in Depth
Partner with the business on identifying your high value assets (HVA), know what you're protecting and why
Partner with everyone on MFA ­ pierce the veil on how it can be used and reduce friction
Prioritize activities based on risk

#RSAC
This is a LOT, where do I start?
Use the reference architecture (revise if needed!) Partner with the Business, Security, & Risk to start to understand your risks & current capabilities Pick an activity ­ Ready! Pick an arrow ­ Focus on Risk Mitigation ­ Aim! Execute ­ Fire! Measure your results!
37

#RSAC

#RSAC
Resources
2017 Talk - https://youtu.be/1HA2N_4c2jw Local Admin rights blog post - https://identitybytes.com/index.php/2018/03/20/applying-arheostat-to-local-admin-rights/ Secrets compromised - https://threatpost.com/22k-open-vulnerable-containers-foundexposed-on-the-net/132898/ IoT compromised - https://www.bleepingcomputer.com/news/security/someone-is-takingover-insecure-cameras-and-spying-on-device-owners/ MimiKatz - https://www.wired.com/story/how-mimikatz-became-go-to-hacker-tool/ ADSecurity.org Guide to MimiKatz - https://adsecurity.org/?page_id=1821 "Push Left" ­ Tanya Janca - https://code.likeagirl.io/pushing-left-like-a-boss-part-180f1f007da95 Photo credits ­ Natalie Peterman

#RSAC
Thank You!!!

