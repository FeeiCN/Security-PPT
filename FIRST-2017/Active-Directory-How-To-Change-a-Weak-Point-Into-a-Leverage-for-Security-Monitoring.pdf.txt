Active directory :
How to change a weak point into a
leverage for security monitoring
Vincent LE TOUX ­ ENGIE ­ France First Conference 2017 ­ San Juan (Puerto Rico) June 12th (Monday) 12:00--12:45

CONTENTS

Chapter 1

Why focusing on Active Directory ?

Chapter 2

Focusing on AD vulnerabilities

Chapter 3

Monitoring the domains (that we don't control)

Chapter 4

How to secure the domains ?

About the ENGIE Context
A critical infrastructure operator (Thermic, gas, hydro, nuclear) under regulations (NERC/NIS, ...)

A complex history & a decentralized culture The group is present in 70 countries

1822
Société Générale des Pays-Bas

1858
Compagnie Universelle du Canal Maritime de Suez

1880
Société Lyonnaise des Eaux et de l'Éclairage

1895
Compagnie Mutuelle de Tramways

1946
Gaz de France

1990
Electrabel

1997
Suez Lyonnaise des Eaux

2000 2001
InternationalPower SUEZ

2008
GDF SUEZ

2015
ENGIE

2017-06-12

First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

3

Why focusing on Active Directory ?

Does it remind something to you ?
We are secured. We have big walls.
Leave us alone

Your organization

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

5

Not castles from fairy tales
Corporate AD

Trust everyone forgot ...
Reorganization (never completed)

Company bought
External companies
Active Directory inside
Business as usual

Active Directory inside
Merger

Critical application connected to AD

Active Directory inside

The reality

Join Venture

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

6

Quizz: Who can become the domain admins (or more) ?

Built-in Administrators
net group "Domain Admins" %username% /DOMAIN /ADD

Server Operators

C:\>sc config browser binpath= "C:\Windows\System32\cmd.exe /c net group \" Domain Admins\"

%username% /DOMAIN /ADD" type= "share" group= "" depend= ""

[SC] ChangeServiceConfig SUCCESS

C:\>sc start browser

[SC] StartService FAILED 1053:

The service did not respond to the start or control request in a timely fashion.

Print operators Account operators

(well, it has the right to logon to DC and discover password in batches or copy ntdis.dit backup)

net group "badgroup" %username% /DOMAIN /ADD => see slide after for the choice of the group

Backup operators

Backup C:\Windows\SYSVOL\domain\Policies\{*}\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf Restore: with [Group Membership] *S-1-5-32-544__Members = <etc etc etc>,*S-1-5-21-my-sid

Then DCSync krbtgt => Golden ticket => Enterprise admins (see later)

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

7

Focusing on AD vulnerabilities

Extended rights
Where are your admins ?

 Extended rights can reset the password of

 Delegation model

accounts, reanimate tombstone, ... take control

of accounts indirectly

Root

(Allowed-To-Authenticate, User-Force-Change-Password, Reanimate-Tombstones, Unexpire-Password, UpdatePassword-Not-Required-Bit, Apply-Group-Policy, SelfMembership, Migrate SID History, Unexpire Password, DSReplication-Get-Changes-All )

OU-1

Users

I got a delegation on
OU-1
admin1
Domain Administrators

=> Users (helpdesk, ...) can become domain admins instantly

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

9

Pass the hash / over pass the hash / pass the ticket / golden ticket / silver ticket ...

Pass the HASH

Lsass.exe
NTLM
NTLM:123456789

Password

same

TGS

Pass the ticket

TGT

Kerberos Over Pass the HASH Rc4_hmac_nt: 123456789
Aes_128: 123456789
Aes_256: 123456789

Silver ticket (KDC account)

Golden ticket

(krbtgt)

KDC

KDC

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

10

Silver ticket + DCSync : being compromise without knowing it
 Detecting silver tickets requires to collect all kerberos events on ALL computers  Silver / Golden tickets still valid if created with the old password (to avoid replication problem)

Mimikatz = create / import golden / silver ticket Old or current password
kerberos::golden /domain:lab.local /sid:S-1-5-21-xxx /target: explicitdc.lab.local /service:ldap /rc4:currkey /user:explicitdc$ /id:xxx /groups:516 /sids:S-1-5-9 /ticket:explicitdc.silver.kirbi

DCSync = export secrets needed to build silver tickets

 You do not need anymore an account to access the AD.

The attack is invisible using classic account supervision 2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

11

Active Directory trusts
 One kerberos ticket can have a field containing a « SID History » record. Used for migration but not only (used to contain forest group membership)
 One golden / silver ticket can have a field« SID History » forged (example: forest admin SID)  Without SID Filtering, these tickets works on other domains

No SID Filtering inside a forest...

=> One domain can compromise other domains

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

12

Account enumeration without domain access
 Abuse kerberos error code (test: Krbguess, Nmap krb5-enum-users)

You can enumerate all the
users of your bastion using SID
enumeration if there is a trust

100% of the domains vulnerable, few % of users enumerated

 Null session: authenticating to a domain with user=« » password=« » (test: rpcclient)

-- Allowed by default on Windows 2003 via MS-LSAT -- Check Anonymous and everyone are in the group Pre-Windows 2000 Compatible Access -- Check DsHeuristics has fLDAPBlockAnonOps enabled (forest wide setting)

2 methods: MS-SAMR MS-LSAT

-- Check the registry key TurnOffAnonymousBlock is set

10-30% of domains vulnerable, 100% of the users, including trusted domains enumerated

Consequences: Block all the accounts if a locking policy is in place (including those in trusted domains) Locate weak accounts and bruteforce passwords

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

13

Monitoring the domains (that we don't control)

Our recipe

1) Build an « audit script » with minimal requirements (no domain admin rights, no need to run on a DC, run only once, ...)

2) Easy to understand KPI

3) Sell it to the top management as « it is a 5 minute job »

Run an audit script ... ... is a « 5 minutes job »

4) Wait for the result and follow the deployment

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

15

What's look like

=Max (all scores)

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

16

The script: example of rules

 Stale objects

 Trusts

-- User / computer not used (and never used)

-- SID Filtering

-- Check for ms-DS-MachineAccountQuota = 0

-- Login script from another domain

-- Presence of SID History

 Anomalies

-- Duplicate accounts ($DUPLICATE ...)

-- Krbtgt password change

 Privileged accounts

-- Presence of admincount=1 for non admins

-- Check for flag « this account is sensitive and cannot be delegated »
-- Account « domain administrator » used
-- Owner of domain controller objects

-- GPP password -- Password change for Smart cards -- Root certificate weak module or algorithm

More than 50 rules in the audit script V1: powershell ; 5 minutes per run V2: c# ; less than 1 minute per run

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

17

Abusing trusts to discover domains
What you can access

What you can discover

Your domain

Your forest

Technics:

Kerberos clients can traverse a maximum of 10 trust links to locate a

1) Object type « trustedDomains »

requested resource in another domain (source)

2) msDS-TrustForestTrustInfo

Limit is on UPN routing. Not trusts !

3) CN=partitions,CN=Configuration

(n2e0t1d7-o06m-12 trust kz.coFimrst C/odnofermencaei2n0:1s7p- Fairts.tcCoonmfere/nncea2m017e-sAuctifvfeixdierescto:sryp: Haotw.ctoocmhang-esaoweuarkcpeoin)t into a leverage for 4) security mSonIDitorining FSP+LsaLookupSid+DSGetD1C8

Domain discovery in practice

Forest 1

Trusts without SID Filtering Trusts with SID Filtering Internal forest trust Inactive trusts

Admin bastion

 With only 2 reports:
-- More than 2 forests discovered -- 36 additional domains found -- Link between the 2 forests discovered -- Admin bastion discovered (without any direct
trust)

2017-06-12

Forest 2

Golden rule:

Assign the « discovered

domains » to the AD owning the

trust (and then to the BU)

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

19

Management vision about AD

Before: 90 domains

After: 300 domains

Simplified view ...

No trust with external companies

Trust with 10 unknown companies, including 2 multinationals

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

20

Management findings

 Running AD audit script is not a 5 minutes job (a 3 then 6 months project)
 Several AD (30%) without formal identified owner
 Multiply by 3 the number of AD owned
 Several trusts with external companies (without SID Filtering)
 Several GPP passwords or OU with delegation to everyone or NULL SESSION domain controllers

If one AD is compromised, it can lead to the compromise of several others SID Filtering is a quick remediate, but works only if the corporate put pressure.

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

21

How to secure the domains ?

First glance risk approach

Group risks

Local risks

A local domain can compromise another domain (mitigation: SID Filtering)

Domain is not available (down) Domain is compromised

Domains without identified owner ­ nobody to manage security incidents (mitigation: request script results)
Trust with an entity that we don't control (external companies, ...) (mitigation: trust removal)

« Secure the domain » is here

Group risks are easier to mitigate (and they have the higher impact)

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

23

ENGIE strategy about securing Active Directory

Assessment

Run the "audit tool" (PingCastle) on all domains weekly

Monitoring Hardening

We talked about this

Build / Deploy monitoring solution Access Securisation study

A 3 years securisation project included in the « One Security » program

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

24

3 priorities for BU CIO and CISO defined in 2017

Deploy the audit script on 100% of the domains

Enable SID Filtering on all trusts (except migration)

Then

Improve the score (min: 50/100)

4th May2016

Restricted - One security WOSM

25

Exploitability / Remediation facility

Top 5 Active directory vulnerabilities

Check
Non admin users can add up to 10 computers to a domain

Rationale

Vulnerable Domains

A User (including from trusted domains) can introduce an unsupervised workstation in the network and bypass all security policies

46%

The « administrator » account is used at least once per month
The krbtgt password is unchanged for at least 40 days
Null session is enabled in at least one domain controller
At least 2 accounts are in the domain admin groups and have a password which doesn't expire.

Password is well known and/or stored in the registry. It can be retrieved & used as a backdoor
It should be changed twice per month to avoid silent compromise or silent compromise using Golden ticket attacks
This NT4 settings can be used to enumerate all accounts without an account and bruteforce them or use this information to lock every account in the domain AND in the trusting domains.
Service accounts are far too over privileged and their password can be captured with minimal privileges

34% 69% 28% 66%

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

26

Market orientation

AD Specific solutions

Monitoring Gap
With what login is associated that IP ?

Change monitoring Generic solutions

Attack detection

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

27

Monitoring gap: no vulnerability analysis

Normal admins

Personal account owner of the provisionning service account

Normal domain admins

Personal admin account put in domain admins
Helpdesk

Users owning GPO applied to admins

 https://github.com/ANSSI-FR/AD-control-paths - bloodhound

Bonus: who can owns the CEO

2017-06-12

account ? First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

28

A possible strategy based on risks

Bastion AD
Mitigate configuration risks
Mitigate hackers' risk

Group application AD

User accounts AD

Others

Focus (and limit the budget) to high value AD ­ accept the risk for ohers

2017-06-12

First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

29

Hackers' roadmap

Already (almost) well known

@gentilkiwi

mimiktaz

Golden ticket

DCSync

Powershell

PowerSploit (Invoke-mimiktaz)

Powershell empire

(Python) Responder

Not well known
Kekeo

Password change with only kerberos key

Smart card logon with authentication
in the future

DoS on kerberos authentication

NetSync

Aoratopw

PKINIT Mustiness

KerbStrom

« Mimikatz 2 »

DCSync with Netlogon RPC

MakeMeEnterpriseAdmin

Bypassing SID Filtering with forest trust

RDP attacks
DCSync / Golden ticket in
c#/powershell

by abusing non removed SID History

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

30

Hardening roadmap

 What AD Guys think:
Credential guard Red forest Admin bastion 2 factor authentication

 What the security thinks:

Priority #1

Control the number of administrators

"Enabling Credential Guard on domain controllers is not supported" (source)

More than xxx users can become domain admin (150,000 users)

Google PIV / GIDS smart
card
Hardening is not always a technical measure. How much administrators have signed the admin charter ?

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

31

Conclusion

Lessons learned

You can "infiltrate" a castle:
- Internally using the Active Directory
- Externally using Threat Intelligence (compromised emails or blacklist registers of internet ip)

You can quickly build a big picture: - How much AD, the map and their risks - Get support to remove old domains / OS

Building a « monitoring » process can be achieved at a relatively low cost

2017-06-12

First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

33

Conclusion
Krásna Hôrka castle 2012

Many services rely on Active Directory, lots of vulnerabilities and few security.
Active Directory is an efficient way to get top management support There is a lot of quick wins to be perceived as a solver and not a blocker by the management
It can be linked with the SOC for better monitoring of AD vulnerabilities.

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

34

Questions ?
How much ponies did you see ? (including this one) Tool: http://www.pingcastle.com

Bonus slide: Some KPI

Initial deadline

Switch to continuous auditing mode at 87% and after 9 months

Domain cleaning

95% of the total domains known in 2 months
Scripts submission flows only on management pressure
SID Filtering KPI was changed from "enabled only" to "not enable" (3 states: Yes, No, Not applicable). SID Filtering evolution is most of the time related to a direct order of the corporate.

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

36

Bonus slide: Owning trusted domain (Bypassing SID Filtering - and unidirectional trust)

1) Installing a backdoor and wait for connections Minikatz after a login or installing a rogue security package (Note: password in clear text for RDP)
2) Enumerate users of Inbound trusts via LsaLookupSids
3) Deciphering a TGS with Kerberoast Most vulnerable: service account with no password expiration => +20 characters recommended ! See this. 200MH/s with hashcat+GTX1080. From 6 months to 1 day, offline, with a 8 char password.
4) Exploring domain configuration for vulnerabilities
 GPP Password (almost in clear text)
 Login script hosted in other domains
 Restricted group (local admin) with Everyone or Authenticated Users or NTAUTHORITY\INTERACTIVE
 OU/container with write access to Everyone / Authenticated Users

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

37

Bonus slide: SID Filtering
Algorithm to know if it is active:
 SID Filtering = NA => Inbound trust or Intra forest trust  SID Filtering Active => If forest trust and not inter forest trust => Yes ; else if quarantined domain => Yes
Enabling it:
 Forest trust: enabled by default => netdom /enableSIDHistory = NO  Domain trust: disabled by default => netdom /quarantine = YES
 Do not enable Quarantine on a forest trust !!! (users from child domains in the forest won't be authenticated anymore)

2017-06-12

First Conference 2017 - First Conference 2017 - Active directory : How to change a weak point into a leverage for security monitoring

38

