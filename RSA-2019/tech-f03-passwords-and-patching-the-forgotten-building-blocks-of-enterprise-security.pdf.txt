SESSION ID: TECH-F03
Passwords and Patching: The Forgotten Building Blocks of Enterprise Security

Andrea Fisher
Security Specialist Microsoft @andreatfisher

Jon Wojan
Cloud Technical Architect Microsoft http://www.linkedin.com/in/wojan @wojan

#RSAC

#RSAC
Brief History of Breaches

The problem with passwords...

Azure Active Directory
Breach

Replay
4.6B
attacker-driven sign-ins detected in May 2018

#RSAC



Password

Spray

200K
password spray attacks blocked in August 2018

Phishing
23M
high risk enterprise sign-in attempts detected in March 2018

John Doe


Password Demo: How big is the problem?

#RSAC
What can we do?
Replace the password
The Dream...
User Promise: End-users should never have to deal with passwords in their day-to-day lives Security Promise: User credentials will improve so that they cannot be cracked, breached, or phished

The search for better

High Security

Inconvenient

MESSAGES 2FA verification code: 020987
John Doe

Low Security

#RSAC
?
Convenient

What's available today?

Upgrade LOB and Web Apps to modern auth
Use client apps that can leverage SSO
Identify/replace/phase out legacy workflows

Biometrics Authenticator Apps
1. Deploy passwordreplacement offerings

2. Reduce the places users see a password prompt

Achieve End-User Promise
Disable password credential provider Enable modern auth self-service
3. Transition to a password-less deployment

#RSAC
Achieve Security Promise
SmartCard only FIDO 2.0 Key Password-less opt in
4. Eliminate passwords from identity directory

#RSAC
User acceptance to non-traditional authentication

Biometric Verification Conditional Access Multifactor

Not welcomed
15% 21% 27%

Welcomed
30% 23% 19%

Welcomed completely
32% 27% 21%

Neither
23% 30% 32%

62% of respondents would welcome biometric verification Half (50%) would welcome geolocation 40% would welcome dual device access
However, just 15% would not welcome biometric verification, 21% wouldn't welcome geolocation, and 27% wouldn't welcome multifactor­ highlighting that there is relatively low resistance to their introduction
Source: Amárach Research 1/2019

The roadmap to no more passwords

Domain account

Any device

+
Device + Biometric

Cloud Account

Windows or other OS Browser apps with Modern Auth

Biometric on device Authenticator Apps

#RSAC
Device unlock On-premises app
Web app SaaS service

Demo: Authenticator App and FIDO 2.0 Scenarios

#RSAC
Secure Authentication Flow
A simple, common architecture
Based on public-key technology
Private-keys are securely stored on the device
Requires a local gesture (e.g., biometric, PIN)
Private-keys are bound to a single device and never shared

The problem with patching...

#RSAC
The NSA says...
The DOD's unclassified network hasn't been targeted with a 0day attack in two years
Network defenses aren't robust enough to make attackers rely on 0day exploits. It's easier to exploit systems that are "not compliant with hardware and software best practices."

Gartner says...

The exploitation of known, but unmitigated, vulnerabilities is the primary method of compromise for most threats. Meanwhile, "zero days" are only approximately 0.4% of vulnerabilities during the past decade, but their risk to most companies is out of balance with the attention they get. Through 2021, 99% of vulnerabilities exploited will continue to be ones known by security and IT professionals for at least one year. Through 2021, the single most impactful enterprise activity to improve security will be patching.

#RSAC
The problem with patching
The Tools Suuuuck

#RSAC
The tools suck...
No single capability to inventory status across all layers of an environment · Network hardware · Network software · Server hardware · Server software · Workstation hardware · Workstation software
Applying patches across this diversity of needs is fragile/difficult

#RSAC
Tools suck: What can we do?
Transfer risk so you can focus on patching what is left

Cloud Provider

Tenant Owner

Methodology sucks
23% of published vulnerabilities have associated exploit code.
2% of published vulnerabilities have observed exploits in the wild.
How do you keep up with the weaponization to stay on pace tomorrow?

All disclosed vulnerabilities

#RSAC

RIGHT NOW

#RSAC
Methodology sucks: What can we do?

First, focus on the basics
"Patch everything, all the time, everywhere" doesn't work
Focus on the vulnerabilities being exploited in the wild*
Employ mitigation controls (compartmentalization/detection)

Einstein's adage that, "The definition of insanity is to keep
doing the same things but expect different results" has rarely seen a more definitive example than the way in which vulnerability management is being pursued in enterprises.

*On average, only about 12.5 percent of all vulnerabilities in the last decade have gone on to be exploited in the wild.

Developing a Predictive Model for Patching...

#RSAC
The three legs of the stool
A feed of all security vulns An accurate and complete inventory of enterprise assets A list of vulnerabilities being exploited in the wild
· A feed would be ideal, but no free feeds exists today
Gartner has even given this approach a name: CARTA ­ "Continuous Adaptive Risk and Trust Assessment"

Demo: Minding the Gap

CVE Number
CVE-2017-0199

Company CVSS

Microsoft

9.3

#RSAC

CVE-2016-0189

Microsoft

7.6

CVE-2017-0022 CVE-2015-8651 CVE-2014-6332
CVE-2016-4117

Microsoft

4.3

Adobe

9.3

Microsoft

9.3

Adobe

10

*https://go.recordedfuture.com/hubfs/reports/cta-2018-0327.pdf?utm_source=SecurityWeek

CVE-2016-1019

Adobe

10

CVE-2017-0037

Microsoft

7.6

#RSAC
How the CVSS Score is calculated
1. Base metrics 2. Impact metrics 3. Temporal metrics 4. Environmental metrics

#RSAC

#RSAC
Search CVS Score Score

#RSAC
Search for Vulnerabilities by Vendor

#RSAC
Search for Top Vulnerabilities in your environment

#RSAC
Apply What You Have Learned Today: Passwords
Next week:
­ Turn on MFA for all Admin Accounts ­ Start a project to determine how to move from passwords to an alternative
In the next three months:
­ Enable cloud-based identities ­ Enable self-service password reset capabilities ­ Begin pilot phase of the password alternative rollout (biometric, phone, FIDO 2.0) ­ Develop communication strategy for broader rollout to the organization ­ Inventory applications for modern auth and SSO
Within six months you should:
­ Investigate additional capabilities such as Conditional Access ­ Update applications for modern auth and SSO
31

#RSAC
Apply What You Have Learned Today: Patching
Next week:
­ Collect inventory across ALL your environment (software, hardware, appliances)
In the next three months:
­ Develop a "Threat Feed" to cross-reference CVEs against your inventory
­ Build a dashboard using the three data feeds ­ Build the team to "Mind the Gap" on closing the patching gap
Within six months you should:
­ Build on your patching success to expand beyond "The Gap"
32

#RSAC
References & Resources
Data Feeds
· Mitre CVE Data Feed: https://cve.mitre.org/cve/data_feeds.html · NIST National Vulnerability Database (NVD): https://nvd.nist.gov/vuln/data-feeds · KB info: https://www.microsoft.com/en-us/download/confirmation.aspx?id=36982

Questions?

