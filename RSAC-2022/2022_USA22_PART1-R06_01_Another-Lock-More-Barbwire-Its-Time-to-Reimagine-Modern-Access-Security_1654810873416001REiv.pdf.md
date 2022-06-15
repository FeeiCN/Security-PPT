#RSAC

SESSION ID: PART1-R06
Another lock? More barbed wire? It's time to reimagine modern access security

Nitika Gupta
Principal Product Manager Lead Microsoft Corporation @_Nitika_Gupta

Rahul Prakash
Principal Product Manager Lead Microsoft Corporation @RahPrak

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Jane Doe
Identity Administrator

#RSAC
Jane Doe
Identity Administrator

#RSAC
Jane Doe
Identity Administrator

#RSAC
Jane Doe
Identity Administrator

#RSAC
921 password attacks every second
Nearly doubling in frequency over the past 12 months
Source: Microsoft Azure Active Directory (Azure AD) authentication log data. 2022.

#RSAC
Sprawl of nation state attacks

source: 2020 Microsoft Digital Defense Report

aka.ms/MicrosoftDigitalDefenseReport

#RSAC
What we learned from the NOBELIUM attacks

Attackers start accessing SolarWinds
platform and injecting test
code

Attackers stopped injecting
test code

Estimated start of hands-on-keyboard
attack using the backdoor

Estimated start of distribution of the
backdoor

Attackers remove backdoor from SolorWinds

Sep

Oct

Nov

Dec

Jan

Feb

Mar

Apr

May

Jun

July

Aug

Sep

Oct

N

2019

2020

Sources: FireEye Shares Details of Recent Cyber Attack, Actions to Protect Community, Dec. 8, 2020 | Important Update from Mimecast, Jan. 12, 2021 | FoggyWeb: Targeted NOBELIUM malware leads to persistent backdoor, Sept. 27, 2021

#RSAC
What we learned from the NOBELIUM attacks

Mimecast discloses their certificate used to
authenticate with Microsoft 365 has been compromised
by attackers
Microsoft discloses Solarwinds supply
chain attack
FireEye discloses the attack in their environment

Email attack campaign using a compromised
Constant Contact account for USAID

Delegated administrative access
abused

Aug

Sep

Oct

Nov

Dec

Jan

Feb

Mar

Apr

May

Jun

July

Aug

Sep

Oct

N

2021
Sources: FireEye Shares Details of Recent Cyber Attack, Actions to Protect Community, Dec. 8, 2020 | Important Update from Mimecast, Jan. 12, 2021 | FoggyWeb: Targeted NOBELIUM malware leads to persistent backdoor, Sept. 27, 2021

NOBELIUM

#RSAC

What we learned from the NOBELIUM attacks

We need to reimagine Suspicious high-risk Abuse of delegated Suspicious high-risk

actions were

admin permissions

actions went

the access security strategy allowed, and

granted to managed undetected, time it

Workload identities or cloud service took to detect issues

were used

providers

#RSAC
We need to reimagine the access security strategy

Zero Trust strategy
A proactive, integrated approach to security across all layers of the digital estate that explicitly and continuously verifies every transaction, asserts least privilege, and relies on intelligence, advanced detection, and real-time response to respond to threats.
#RSAC

Zero Trust guiding principles
Verify explicitly Use least privileged access
Assume breach
#RSAC

#RSAC #RSAC
Secure access with the Zero Trust strategy 1 Strengthen access for all identities
2 Ensure least privilege for all admins
3 Utilize cloud intelligence across boundaries

#RSAC #RSAC
Secure access with the Zero Trust strategy 1 Strengthen access for all identities
2 Ensure least privilege for all admins
3 Utilize cloud intelligence across boundaries

Back to December 2020...

ATTACKER
B A
EXFIL

SAML SAML

TRUST TRUST

SAML SAML

CLOUD IDENTITY PROVIDER
B A
SAML RELYING PARTY

TRUST

ATTACKER

TRUST

SAML

A
ACTIVE DIRECTORY
On premises

SERVICE PRINCIPAL OR APPLICATION

#RSAC
RESOURCES

#RSAC

PROTECT HIGH RISK ACTIONS
Attacker forged tokens with admin privileges to
make configuration changes

Recommendations
 Require fresh authentication for high-risk actions  Require phish resistant MFA and secure/privileged
access workstations  Use risk signals to block any high-risk actions

#RSAC

SECURE ACCESS FOR WORKLOAD IDENTITIES
Attacker added credentials to the service principal to
access data

Recommendations
 Restrict access based on context (location, app, etc)  Use risk to make access decisions  Use stronger credentials and limit lifetimes

Context-aware Adaptive Access Policies

Threat signals

Devices Service Principals
Risk
Location
Context

Conditions

Policy

Context-aware policy engine

Allow access Limit access Stronger credentials Deny access
Controls

#RSAC
Clouds SaaS apps On-premises & web apps
Apps and Resources

#RSAC
Secure access with the Zero Trust strategy 1 Strengthen access for all identities
2 Ensure least privilege for all admins
3 Utilize cloud intelligence across boundaries

Nobelium took advantage of trusted relationships

NOBELIUM

Social engineering

Stolen credentials from on premises

Azure AD trust relationship

On-premises access Azure

#RSAC

Remote access solution

Wide spectrum of trusted relationships

More in-house

More outsourced

IN HOUSE Managed in-house with FTEs sometimes
with vendor staff augmentation
In-house, Vendor

CO-MANAGED Co-managed with partner Customer-
specific processes & configuration SERVED BY
Systems Integrator
STAFFING

OUTSOURCED Partner-managed: Common processes & tooling
CSP/MSP

Customer FTE, Partner vendor

Partner staffing often "Dedicated" per customer

Partner staffing often "Shared" across customers

Technician access assigned to regular user account in customer tenant

TECHNICIAN ACCOUNTS AND ACCESS
Technician access assigned to guest account in customer tenant, visible in customer tenant

Technician access assigned to user account in partner tenant,
typically not visible in customer tenant

#RSAC

#RSAC

IT ALL STARTS WITH THE CONTRACT
Attackers relied on lack of controls across the MSPCustomer relationships

Recommendations
 Review the contract: Are there contractual limitations preventing you from enabling controls?
 Verify that proper controls are maintained within the MSP: Multi-factor authentication, just-in-time access, process for granting privileged access

#RSAC

LEAST PRIVILEGE FOR DELEGATED ADMINS
Attackers relied on MSPs having standing privileged
access to customer environments

Recommendations
 Monitor alerts on anomalous access  Require just-in-time (JIT) access with risk-based
checks for admin access  Ensure admins only have just enough access (JEA)
through automated or manual role-sizing  Coarse-grained roles -> finer-grained tasks

#RSAC

LIFECYCLE CONTROLS
Admin accounts were poorly vetted and persisted long after required

Recommendations
 Adopt a request-and-approval workflow for new delegated admins
 Periodic and event-triggered access certification of privileged users
 Automatic expiration of admins and removal of guests from directory
 Evaluate type of account needed by admins

#RSAC #RSAC
Secure access with the Zero Trust strategy 1 Strengthen access for all identities
2 Ensure least privilege for all admins
3 Utilize cloud intelligence across boundaries

NOBELIUM attack timeline
Mimecast discloses their cert used to authenticate with Microsoft 365 has been compromised by attackers

Microsoft discloses the supply chain attack
FireEye discloses the attack in their environment

Email attack campaign using a compromised
Constant Contact account for USAID

#RSAC
Discovery and investigation on FoggyWeb, a backdoor targeting AD FS

Aug

Sep

Oct

Nov

Dec

Jan

Feb

Mar

Apr

May

Jun

July

Aug

Sep

Oct

N

2021

Sources:

FireEye: https://www.fireeye.com/blog/products-and-services/2020/12/fireeye-shares-details-of-recent-cyber-attack-actions-to-protect-community.html Mimecast: https://www.mimecast.com/blog/important-update-from-mimecast FoggyWeb: https://www.microsoft.com/security/blog/2021/09/27/foggyweb-targeted-nobelium-malware-leads-to-persistent-backdoor

#RSAC
Sign in risk detections
Admin-confirmed user compromised

Malicious IP address Malware linked IP address

Unfamiliar sign-in properties Atypical travel

Anonymous IP address

Password spray

Leaked credentials

Threat intelligence

#RSAC
Permissions across boundaries
NOBELIUM
Remote access solution

#RSAC

REVIEW CROSS BOUNDARY SIGNALS
Attackers relied on lack of visibility across boundaries

Recommendations
 Audit cross-tenant sign-ins and configuration changes, especially by delegated admins
 Review log availability and retention strategies  Evaluate logs for adequacy and anomalies  Collect all logs in a single place for forensics  Utilize behavioral analysis and ML to alert on
suspicious changes

#RSAC
Unmanaged permissions expand your attack surface
40,000+ permissions across clouds and growing daily
>50% of permissions are high-risk
>90% of identities are using <5% of permissions granted

#RSAC

DATA-DRIVEN PERMISSIONS MANAGEMENT
Attackers maintained permissions that were used
for later abuse

Recommendations
 Evaluate cloud-permissions management tools for your Identities across SaaS Apps and IaaS platforms
 Grant permissions based on usage and activity  Review unused or stale accounts periodically  Continuously monitor and right-size identities to
prevent permissions creep  Tie findings into a governance tool so you can ensure
that least privilege is maintained across clouds

#RSAC
Secure access strategies for Zero Trust architecture
Strengthen access for all identities
Ensure least privilege for all administrators
Use cloud intelligence across boundaries

Invest in a holistic and integrated approach to access security

#RSAC
and, please, turn on MFA

#RSAC
Thank you!

Nitika Gupta
@_Nitika_Gupta

Rahul Prakash
@RahPrak

