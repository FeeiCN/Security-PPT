SESSION ID: HT-F01
Breaking Closed Systems with Code-Signing and Mitigation Techniques
#RSAC

Gavin Hill
Director of Threat Intelligence Venafi

#RSAC
Learning Objectives
Code Signing Overview
Common use cases (today & tomorrow) Comparing open systems with closed systems
Threat Landscape
Underground market (Theft & Services) Bypassing security controls The Carbon problem
Mitigating Code Signing abuse
2

#RSAC
Why Code Signing?
Can I trust the code?
Has the code been tampered with since it was signed?
3

#RSAC
Code Signing Process

0100101010 1000001000 0101111000

0100101010 1000001000

Hash of code created with hashing algorithm

0100101010 1000001000
Private key used to sign hash

0100101010 1000001000 0101111000

0100101010 1000001000

Package bundled together with certificate

4

Common Use Cases
App Publishing

Software upgrades

File distribution
5

#RSAC
Software distribution
Container Security
Execution of scripts - Start / Stop services - Deploy code

#RSAC
Open Systems
 Software issuers are trusted by default with a vetting process  Users are given the choice to trust a publisher or not
Certificate automatically accepted without user warning
6

#RSAC
Closed Systems
 Publisher certs are not trusted, only manufacturer  Doesn't provide ways to sideload apps
Legally DMCA prohibits breaking any signature schema Hackers do it anyway!
· Tesla hack -> Weak encryption · GM/Chrysler -> Firmware vulnerabilities to bypass validation · iOS -> Buffer overflow to root / jailbreak devices · Weak hashing or key length
7

#RSAC
Threat Landscape

#RSAC
Rise of Attacks on Trust
9

#RSAC
Marketplace for Stolen Certificates
Up to $980/ea
400x more valuable than stolen credit card 3x more valuable than bitcoin
10

#RSAC
Underground Certificates-as-a-service (CaaS)
InfoArmor: GovRAT
11

#RSAC
Underground Certificates-as-a-service (CaaS)
InfoArmor: GovRAT
12

#RSAC
Blind Trust in Signed Code

Domain Validated (DV) Certificate
· Easily acquired · Inexpensive or free · Very little validation
performed

Extended Validation (EV) Certificate
· Rigorous process to acquire
· Expensive · Extensive validation

"Programs signed by an EV code signing certificate can

immediately establish reputation with SmartScreen

reputation services even if no prior reputation exists

for that file or publisher." Microsoft

Ref: https://blogs.msdn.microsoft.com/ie/2012/08/14/microsoftsmartscreen-extended-validation-ev-code-signing-certificates/)

13

#RSAC
Signed-Malware Continues to Increase
14

#RSAC
The Ugly Truth ­ Revocation Doesn't Work
Oct 1, 2015 -> Sign malware with stolen code signing certificate with timestamp Oct 1, 2015 Nov 1, 2015 -> Code signing certificate revoked
Malware can't run on systems that check CRL
Dec 31, 2015 -> Code signing certificate expires and is removed from CRL Jan 1, 2016 -> malware runs again as trusted on systems
15

Signed Malware
16

#RSAC
Note the expiration date of the certificates used to sign the malware and when it was discovered

#RSAC
The Carbon Problem
17

#RSAC
Bypassing Security Controls

Year 2012 2013 2014 2015
2016

Organization Adobe Bit9 HP Dell
SBO Invest

Attack
Compromised code signing server used to sign malware Stolen code-signing certificate used to sign malware Stolen code-signing certificate used to sign malware Sign fake certificates for MITM attacks or malicious code
multiple code signing certificates used to sign Spymel

Source
Compromised code signing server
Stolen from developer machine
Stolen from developer machine
eDellRoot self-signed CA installed on all new Dell machines*
Stolen code signing certificates

18

#RSAC
Who's Responsible for Protecting the Keys?

Responsible for Management of Code-Signing Certificates

7% 27%
66%
Venafi 2016 survey
19

Developers PKI Admin Security Operations

#RSAC
Protecting Against a Compromise

CONTROLS IN PLACE TO ENSURE CODE-SIGNING PROGRAM IS NOT AT RISK OF A COMPROMISE

At least
70% don't

Next Gen AV 10%
Don't know 10%

PKI Admin Access Only 30%

have effective controls in place

No Controls 20%

Venafi 2016 survey
20

Manual Audits 30%

#RSAC
The Problems with Closed Systems
Not using signatures at all to validate updates (Automotive, Embedded Devices). Signing Keys/Certificates are blindly trusted and can't be revoked in case of CA/key compromise (IoT). Closed System CAs are not subjected to the usual public CAs security audits (WebTrust only has an audit criteria for EV Code Signing issuing CA).
21

#RSAC
How Do Attacks on Closed Systems Happen
Exploiting the code signing process.
Exploiting the update/upgrade process:
MITM attacks when updates are retrieved (either exploit TLS connection validation issues in existing client libraries) Exploit signature validation vulnerabilities during manual update process
Exploit another vulnerability in the firmware to get access to the device and then use the upgrade/update path to gain further access.
22

#RSAC
3 Suggested Steps To Mitigating Code Signing Abuse

#RSAC
Mitigating Code Signing Abuse ­ Step 1
Find out what signed code you have Find out who is performing the code-signing in your organization Find out where code-signing certificates are stored and who has access to them
24

#RSAC
Mitigating Code Signing Abuse ­ Step 2
Start publishing code-signing usage Require CAs to publish code signing certificate issuance
25

#RSAC
Mitigating Code Signing Abuse ­ Step 3

Establish security controls to limit access to code signing certificates
Identify any misuse or irregularities for code signing practices within your organization
Validate:
 What code is being signed  Who is signing it  Where it is being signed  When it was signed

"Certificates can no longer be blindly trusted."

26

#RSAC
Questions?
27

