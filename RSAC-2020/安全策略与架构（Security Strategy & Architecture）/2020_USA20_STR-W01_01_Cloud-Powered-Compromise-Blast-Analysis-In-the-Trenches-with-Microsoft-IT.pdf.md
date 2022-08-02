SESSION ID: STR-W01
Cloud Powered Compromise Blast Analysis: In the trenches with Microsoft IT

Sarah Handler
Program Manager II Microsoft @sarahhandler

Kristina Laidler
Sr. Director, Security Operations & Incident Response Microsoft
#RSAC

#RSAC
To many, Microsoft is a vendor for security solutions to mitigate compromise...
...to some, Microsoft is their target
2

#RSAC

#RSAC
Security world view
63% of workers report using the same password for multiple work devices and/or applications According to the 2019 Verizon data breach investigation report, 34% of breaches involved an internal actor Microsoft has seen a 300% increase in identity attacks over the past year More than half of US companies protect IP and company financial info using only passwords Multifactor authentication can help reduce the risk of identity compromise by more than 99.9% According to the Verizon data breach report, 81% of security breaches leverage stolen or weak passwords 90% of all cyberattacks, both incidents and breaches, are delivered via phishing emails Microsoft SOC volume of identity related incidents is....
Persistent and expanding cyberattacks are the new normal. The World Economic Forum ranks cyberattacks near "natural disasters" as a top risk for 2019.

#RSAC
Signal at scale
Microsoft's SOC operates on a massive scale to support a highly dynamic, mobile workforce

250K
Active Users

200K
Active Mailboxes

650K
Active Devices

630B+
Monthly Authentic
ations

1B+
Azure User Accounts

Security Operations & Incident Response
5

#RSAC
Events, detections, alerts, cases

Billions
of events

600+
detection
rules in
production

· An observable event on a system, in an environment, process, workflow or identity

· Detections identify security impacting, anomalous or suspicious activity

800
alerts a
day

80
cases a day

· Automated notifications resulting from a detection
· Plus, proactive hunting, IOC sweeps and user reporting

· Triage, investigate, remediate

The First Big Challenge of every SOC
Detect
Identity Endpoint Cloud Network And More

Respond

#RSAC

#RSAC
Attacker Driven Identity Events

Password Spray

Use Compromised Credential

Move Without Detection

Tactics, techniques, procedures Initial access Persistence Action on objective

Actions on Objective

8

#RSAC
Prevention: protecting identities
Technical controls
­ Uniqueness filter protection for non-predictable passwords ­ Passwordless or Multi-Factor Authentication ­ Zero Trust / Least Persistent Admin ­ Block legacy authentication ­ UEBA detections
Assessments
­ Password spray to identify potentially guessable passwords ­ Risk scoring framework ­ User education and awareness ­ Penetration testing
Protect your privileged identities!

#RSAC
Identifying the existence and extent of attacks
10

Password Spray Scenario

1

Threat actor sprays large set of accounts with a small set of guessable passwords

2

Successful authentication confirms credential is valid

@contosot.com Accounts

Password123

Password123

SOURCE IP
AD Connect Health Data

PASSWORD SPRAY

SOC

AADIP

1 Detection Users with Auth Failure % Auth Success % # Success / # Failures >= 1 Auth Success Query runs every 15 minutes

Password123

2 Remediate Immediate Password Reset

CREDENTIAL

3 Enrich & Investigate Anomali Threat Intel Platform Phone Auth / Reg data O365 Threat Intelligence MCAS & AADIP
4 Tipping & Queuing w/ Partners & PGs

Solving for Detections
· Applied value of cloud learning and local knowledge · Developed custom algorithm based on 1 known bad IP · Tuned and tested detection to remove false positives

MFA MFA MFA

#RSAC

3 Adversary has access to resources due
to credential successfully guessed during spray attack.
Password filter needs to be implemented for guessable passwords.

4

Credential plus trusted device allows access to corporate assets and services

Better proofing methods are needed for Manager approvals.

5 While guessable passwords continue to
create risk, MFA with strong proofing would prevent further access.

+

= More Secure

Next Steps

· Enforce password filter

· Enable MFA

· Enhance manager approval proofing

·

= Goal

#RSAC
Demo: Querying Connect Health logs to discover password spray attacks
12

#RSAC
Discovering password spray
let valid_logons = (OfficeActivity | where TimeGenerated > ago(30d) | where Operation == 'UserLoggedIn' | summarize by ClientIP);
let only_invalid_logons = (OfficeActivity | where TimeGenerated > ago(30d) | where Operation == 'UserLoginFailed' | summarize by ClientIP) | join kind=anti (valid_logons) on ClientIP;
OfficeActivity | where TimeGenerated > ago(30d) | join kind=inner (only_invalid_logons) on ClientIP | extend UserAgent=tostring(parse_json(ExtendedProperties)[0].Value) | where (UserAgent matches regex 'Microsoft Office/\\d+\\.\\d+ \\(Windows NT \\d+\\.\\d+; Microsoft
Outlook \\d+\\.\\d+\\.\\d+; Pro\\)' or UserAgent == 'CBAInPROD' or UserAgent matches regex '^[\\w\\.\\d\\-\\_]{4,15}\\/[\\.\\w\\d\\-\\_]{4,30}$')
| summarize by ClientIP, UserAgent
@JohnLaTwC

Credentials on the Dark Web

1

Threat actor conducts credential attacks against multiple targets including accounts

in Azure Active Directory.

SCANNING

PASSWORD SPRAY

EXFILTRATE DATA COMPROMISED
CREDENTIAL

2

Threat actor advertises access to numerous domains

GLOBAL ADDRESS LIST

COMPROMISED CREDENTIAL

Activity detected on dark web

3 Domain accessed by actor and
credentials are advertised for sale.
DENIAL OF ACCESS
Azure Active Directory
Password spray detection to detect attempted password spray attacks against accounts

#RSAC

· Detections related to password spray attacks and password reset activity · Risk scoring and NRT credential reset/token roll. authentication bypass in the wild. · This type of attack underscores the importance of two-factor authentication and decommissioning of legacy authentication
methods.

#RSAC
[Placeholder for story/demo of recent attack we saw]
Waiting for final internal approval to share details
15

#RSAC
Lessons from our battles- and what's next
Event logging and data retention
­ Tenant view of all login events, user permissions and detail on applications being requested by those identities
­ Data retention strategy consistent with legal and contractual requirementsLogg
Separate and protect privileged accounts
­ Separate identity, secure device, closely monitored
Detect threats through user behavior anomalies
­ Leverage large security-related data sets to evolve from deterministic alerts ­ Use risk scoring to surface highest priority alerts
16

#RSAC
What to do next in your battle against compromise
Next week you should:
­ Evaluate data sets to identify potential gaps ­ Assess your data retention strategy
In the next three months you should:
­ Reduce persistent admins ­ Implement conditional access control policies
Within six months you should:
­ Implement access control policies ­ Apply zero trust policy to access requests
17

#RSAC
Q&A

