#RSAC
SESSION ID: IDY-RO2
Defending Against New Phishing Attacks that Abuse OAuth Authorization Flows
Jenko Hwong
Cloud Security Researcher Netskope, Inc. @jenkohwong
1

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

what must change

#RSAC

what must change

#RSAC
· Domain/URL filtering ineffective · MFA controls bypassed · Broad lateral movement · Logging information is minimal · Revoking access is difficult

credential attack what must

protocol-specific

change

#RSAC
· Domain/URL filtering ineffective · MFA controls bypassed · Broad lateral movement · Logging information is minimal · Revoking access is difficult

de facto standard

dynamic user authorization of application access
to resources

#RSAC
OAuth 2.0
De facto standard for web app authorization and access to resources (data)

#RSAC

The New Web: redirects user to authenticate...

3rd-Party Website(apps)

Authentication

The New Web: user approves/consents...

Authentication

Authentication

#RSAC
Authorization

#RSAC
A New Class of Phishing Attacks
Microsoft Device Code Flow[1]
[1] Introducing a new phishing technique for compromising Office 365 accounts, Dr. Nestori Syynimaa

#RSAC
10

#RSAC

The New Web: Phishing Attack: Device Code Flow

1 Assumed Application Identity

Authorization

Cloud Data, Compute, Users

Azure

Attacker

5 Access API Calls

OAuth Tokens

lateral movement
Office 365 -> Azure
4 Token

2 Phish

3 Authenticate, Authorize
https://microsoft.com/...

Azure

User

Username Password

#RSAC

The New Web: OAuth Defenses are Lacking

1 Assumed Application Identity

Authorization

Cloud Data, Compute, Users

4 Cannot prevent or detect assumed app identities

6 Cannot prevent pivot

Attacker 5 Access

lateral movement

OAuth Tokens

API Calls 5 MFA

Office 365 -> Azure
4 Token

Azure

2 Phish
1 URL Inspection Content Inspection Sender Reputation

3 Authenticate,

2 URL Inspection

Authorize

https://microsoft.com/...

User

Username Password

3 Cannot force approvals

Azure

7 SecOps
· Bypass of approved app lists · Pivot is not logged · Revoke tokens incomplete · Tokens are permanent

#RSAC
What can we do about it?
· Security Operations · Proactive Measures

#RSAC
Protecting your crucial assets took draconian measures.
In 621 B.C., Draco attempted to deter criminal activity by passage of an extremely harsh code that made even minor offenses such as stealing cabbage punishable by death.[1]
[1] J. David Hirschel, William O. Wakefield. Criminal Justice in England and the United States. Ed. Greenwood Publishing Group, 1995. ISBN 9780275941338. p.160.

#RSAC
Protecting your crucial assets takes draconian measures.
In 621 B.C.,DDErNacYo aAtLteLmpted to deter crimBinYaDl aEcFtiAviUtyLbTy passage omfaadneeexvtAerenLmLmeTilnyHohrEaorTfsfhIeMncsoEedsestuhcaht as stealiTnOg cEabVbEaRgeYOpuNniEshable by deathE.[V1]ERYWHERE

#RSAC
Protecting your crucial assets takes draconian measures.
In 621 B.C., DDrEacNoIaAtLtempted to deter crimBinYaDl aEcFtiAviUtyLbTy passage omfaadneeexvtAerenLmLmeTilnyHohrEaorTfsfhIeMncsoEedsestuhcaht as stealiTnOg cEabVbEaRgeYOpuNniEshable by deathE.[V1]ERYWHERE

Security Operations

+ Proactive Measures

Research Innovate

#RSAC
Assess Prevent

Analyze

Mitigate

Detect

1
Proactive Measures: Research

5 Access API Calls

Educate

Apps

Ubiquitous authorization protocol

Microsoft, Google, Salesforce, Dropbox,

Box, SSO...

Not so obvious uses of OAuth...

2 Request

­ Azure CLI: device code authorization flow

­ Google CLI with service accounts: OAuth tokens

Treat as seriously as data, users, applications

User-driven Internet model (shadow IT)

4 Token
User

#RSAC
R
Azure
3 Authenticate, Authorize

1
Proactive Measures: Research

5 Access API Calls

#RSAC
R

Educate

Attacker

Ubiquitous authorization protocol

Microsoft, Google, Salesforce, Dropbox,

Box, SSO...

Not so obvious uses of OAuth...

2 Phish

­ Azure CLI: device code authorization flow

­ Google CLI with service accounts: OAuth tokens

Treat as seriously as data, users, applications

User-driven Internet model (shadow IT)

4 Token

Azure

User

3 Authenticate, Authorize

OAuth token attacks
­ Challenges: MFA bypass, not temporary, unmanaged, logging limited, prevention/detection difficult, revocation challenging, can leverage existing processes but controls differ
Non-phishing attack vectors

Security Operations: Assess
OAuth audit logs
­ New OAuth applications ­ Permissions requested (scopes) ­ User approvals of resources

5 1

Apps
2 Request scopes

4
audit logs

from
Users

#RSAC
A
Azure resources
3 Authenticate, who Authorize access to

Security Operations: Assess
OAuth audit logs
­ New OAuth applications ­ Permissions requested (scopes) ­ User approvals of resources

5 1

Apps
2 Request scopes

4
audit logs

from
Users

#RSAC
A
Azure resources
3 Authenticate, who Authorize access to

Security Operations: Assess
OAuth audit logs
­ New OAuth applications ­ Permissions requested (scopes) ­ User approvals of resources
Baseline normal activity
­ Counts, Top-N, distributions

5 1

Apps
2 Request scopes

4
audit logs

from
Users

#RSAC
A
Azure resources
3 Authenticate, who Authorize access to

April 18, 2021 dataset from anonymized customers: · 439 Google Workspace organization · 509,079 users · 60,875 unique applications
[1] Who Do You Trust? OAuth Client Application Trends: https://www.netskope.com/blog/who-do-you-trust-oauth-client-application-trends

Security Operations: Assess
OAuth audit logs
­ New OAuth applications ­ Permissions requested (scopes) ­ User approvals of resources
Baseline normal activity
­ Counts, Top-N, distributions

5 1

Apps
2 Request scopes

4
audit logs

from
Users

#RSAC
A
Azure resources
3 Authenticate, who Authorize access to

[1] Who Do You Trust? OAuth Client Application Trends: https://www.netskope.com/blog/who-do-you-trust-oauth-client-application-trends

Security Operations: Assess
OAuth audit logs
­ New OAuth applications ­ Permissions requested (scopes) ­ User approvals of resources
Baseline normal activity
­ Counts, Top-N, distributions

5 1

Apps
2 Request scopes

4
audit logs

from
Users

#RSAC
A
Azure resources
3 Authenticate, who Authorize access to

[1] Who Do You Trust? OAuth Client Application Trends: https://www.netskope.com/blog/who-do-you-trust-oauth-client-application-trends

5 1
Security Operations: Prevent

Block

Attacker

4

Unnecessary OAuth authorization flows e.g., device code

­ https://www.microsoft.com/devicelogin

­ https://login.microsoftonline.com/common/oauth2/deviceauth

­ NOTE: exceptions such as Azure CLI

2 Phish

3

User
Block URLs

#RSAC
P

1
Security Operations: Prevent

Block

Unnecessary OAuth authorization flows e.g., device code

­ https://www.microsoft.com/devicelogin

­ https://login.microsoftonline.com/common/oauth2/deviceauth

­ NOTE: exceptions such as Azure CLI

2

Lockdown[1]

­ Centralize the OAuth application approval process

­ Identify and enforce an allowed OAuth applications list

5

#RSAC

P

4
User

user consent settings
3 Authenticate, Authorize

[1] Configure how users consent to applications :https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/configure-user-consent

1
Security Operations: Prevent

Block

Unnecessary OAuth authorization flows e.g., device code

­ https://www.microsoft.com/devicelogin

­ https://login.microsoftonline.com/common/oauth2/deviceauth

­ NOTE: exceptions such as Azure CLI

2

Lockdown[1]

­ Centralize the OAuth application approval process

­ Identify and enforce an allowed OAuth applications list

5

#RSAC

P

4
User

user consent settings
3 Authenticate, Authorize

[1] Configure how users consent to applications :https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/configure-user-consent

5

#RSAC

1
Security Operations: Prevent

P

Block

Unnecessary OAuth authorization flows e.g., device code

­ https://www.microsoft.com/devicelogin

­ https://login.microsoftonline.com/common/oauth2/deviceauth

­ NOTE: exceptions such as Azure CLI

2

Lockdown[1]

4
user consent settings
3 Authenticate, Authorize

­ Centralize the OAuthUapseplriccaotinonsent settings probaUsberly won't work

approval process against a phishing attack which impersonates

­

Identify and applications

elisntforcae

acnomallmowoend,OaApuptrhoved

application

like

Outlook.

[1] Configure how users consent to applications :https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/configure-user-consent

1
Security Operations: Prevent

Block
Unnecessary OAuth authorization flows e.g., device code ­ https://www.microsoft.com/devicelogin
­ https://login.microsoftonline.com/common/oauth2/deviceauth
­ NOTE: exceptions such as Azure CLI

Attacker
2

Lockdown
­ Centralize the OAuth application approval process
­ Identify and enforce an allowed OAuth applications list

Mitigate compromised credentials
­ IP allow lists with proxies, VPNs, etc.
­ Device policies (managed endpoint)
https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/location-condition

5 Access API Calls conditional access policy 4
3

#RSAC
P
Azure

1
Security Operations: Prevent

Block
Unnecessary OAuth authorization flows e.g., device code ­ https://www.microsoft.com/devicelogin
­ https://login.microsoftonline.com/common/oauth2/deviceauth
­ NOTE: exceptions such as Azure CLI

Attacker
2

Lockdown
­ Centralize the OAuth application approval process
­ Identify and enforce an allowed OAuth applications list

Mitigate compromised credentials
­ IP allow lists with proxies, VPNs, etc.
­ Device policies (managed endpoint)
https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/location-condition

5 Access API Calls conditional access policy 4
3

#RSAC
P
Azure

1
Security Operations: Prevent

5 Access API Calls

#RSAC
P

Block

Attacker

4

Unnecessary OAuth authorization flows e.g., device code

­ https://www.microsoft.com/devicelogin

­ https://login.microsoftonline.com/common/oauth2/deviceauth

­ NOTE: exceptions such as Azure CLI

2

Azure 3

Lockdown
­ Centralize the OAuth application approval process
­ Identify and enforce an allowed OAuth applications list

Mitigate compromised credentials
­ IP allow lists with proxies, VPNs, etc. ­ Session or token timeouts
­ Device policies (managed endpoint)
https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/location-condition

Security Operations: Detect
Detect failed access (IP/device conditional policies)

1
Attacker

5 Access
API Calls conditional access failures
4

#RSAC
D
Azure

2

3

Security Operations: Detect

1

5 Access

API Calls

Attacker

4

Behavioral detection

2

­ Compromised account activity

­ Abnormal or unexpected application activity

­ Track risky users (phishing targets, URL clicks, suspect app approvals)

#RSAC
D
Azure 3

1
Security Operations: Mitigate

5 Access API Calls

Update ops runbooks to address

refresh

access

Attacker

4

protocol-specific challenges

Revocation of tokens is limited, 2 confusing, and incomplete
­ Microsoft: you can revoke refresh tokens easily[1] but not access tokens.[2]

#RSAC
M
Azure 3

[1] Revoke-AzureADUserAllRefreshToken: https://docs.microsoft.com/en-us/powershell/module/azuread/revoke-azureaduserallrefreshtoken?view=azureadps-2.0 [2] Revoke user access in Azure Active Directory: https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/users-revoke-access [3] Continuous access evaluation: https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-continuous-access-evaluation

1
Security Operations: Mitigate

5 Access API Calls

Update ops runbooks to address

refresh

access

Attacker

4

protocol-specific challenges

Revocation of tokens is limited, 2 confusing, and incomplete
­ Microsoft: you can revoke refresh tokens easily[1] but not access tokens.[2]

#RSAC
M
Azure 3

[1] Revoke-AzureADUserAllRefreshToken: https://docs.microsoft.com/en-us/powershell/module/azuread/revoke-azureaduserallrefreshtoken?view=azureadps-2.0 [2] Revoke user access in Azure Active Directory: https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/users-revoke-access [3] Continuous access evaluation: https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-continuous-access-evaluation

1
Security Operations: Mitigate

5 Access API Calls

Update ops runbooks to address

refresh

access

Attacker

4

protocol-specific challenges

Revocation of tokens is limited, 2 confusing, and incomplete
­ Microsoft: you can revoke refresh tokens easily[1] but not access tokens.[2]
­ "Hope is not a strategy."
disable the user account for 1 hour delete/restore the account don't forget about registered devices

#RSAC
M
Azure 3

[1] Revoke-AzureADUserAllRefreshToken: https://docs.microsoft.com/en-us/powershell/module/azuread/revoke-azureaduserallrefreshtoken?view=azureadps-2.0 [2] Revoke user access in Azure Active Directory: https://docs.microsoft.com/en-us/azure/active-directory/enterprise-users/users-revoke-access

5 1
Security Operations: Analyze

High-risk users
­ Phishing targets (URLs)

Attacker

4

2 Phish

3

User
https://www.microsoft.com/devicelogin https://login.microsoftonline.com/commo n/oauth2/deviceauth

#RSAC
A

1
Security Operations: Analyze

High-risk users

Apps

­

­ Trust of high-risk applications or large 2 number of applications

5
4 audit logs
from
Users

#RSAC
A
Azure
3 Authenticate, who Authorize access to

Who Do You Trust? OAuth Client Application Trends: https://www.netskope.com/blog/who-do-you-trust-oauth-client-application-trends

1
Security Operations: Analyze

High-risk users

Apps

­ Phishing targets (URLs)

­ Trust of high-risk applications or large 2 number of applications

­ Highly-privileged users (admins)

5
4 audit logs
from
Admins

#RSAC
A
Azure
3 Authenticate, who Authorize access to

Who Do You Trust? OAuth Client Application Trends: https://www.netskope.com/blog/who-do-you-trust-oauth-client-application-trends

5

#RSAC

1
Security Operations: Analyze

A

High-risk users

Apps

4

­ Phishing targets (URLs)

audit logs

­ Trust of high-risk applications or large 2 Request

number of applications

scopes

Azure 3

­ Highly-privileged users (admins)

from

Users

High-risk applications

­ Request of broad privileges e.g., read-write all Google Drive

5

#RSAC

1
Security Operations: Analyze

A

High-risk users

Apps

4

­ Phishing targets (URLs)

audit logs

­ Trust of high-risk applications or large 2 Request

number of applications

scopes

Azure 3

­ Highly-privileged users (admins)

from

Users

High-risk applications

­ Request of broad privileges e.g., read-write all Google Drive

5

#RSAC

1
Security Operations: Analyze

A

High-risk users

Apps

4

­ Phishing targets (URLs)

audit logs

­ Trust of high-risk applications or large 2

number of applications

Azure 3

­ Highly-privileged users (admins)

from

Users

High-risk applications

­ Request of broad privileges e.g., read-write all Google Drive

­ Used by large number of users (large impact)

5

#RSAC

1
Security Operations: Analyze

A

High-risk users
­ Phishing targets (URLs) ­ Trust of high-risk applications or large
number of applications ­ Highly-privileged users (admins)
High-risk applications

2 Request scopes

4 audit logs
from
Users

Azure
3 Authenticate, who Authorize access to

­ Request of broad privileges e.g., read-write all Google Drive

­ Used by large number of users (large impact)

5

#RSAC

1
Security Operations: Analyze

A

High-risk users

Apps

4

­ Phishing targets (URLs)

audit logs

­ Trust of high-risk applications or large 2

number of applications

Azure 3

­ Highly-privileged users (admins)

from

Users

High-risk applications

­ Request of broad privileges e.g., read-write all Google Drive

­ Used by large number of users (large impact)

­ Obscure applications (suspect developer/reputation)

Who Do You Trust? OAuth Client Application Trends: https://www.netskope.com/blog/who-do-you-trust-oauth-client-application-trends

5

#RSAC

1
Security Operations: Analyze

A

High-risk users
­ Phishing targets (URLs) ­ Trust of high-risk applications or large
number of applications ­ Highly-privileged users (admins)
High-risk applications

Apps
2 Request scopes

4 audit logs
from
Users

Azure resources
3 Authenticate, who Authorize access to

­ Request of broad privileges e.g., read-write all Google Drive

­ Used by large number of users (large impact)

­ Obscure applications (suspect developer/reputation)

Changes and anomalies
­ New applications, new scopes, top-N apps, top-N users

#RSAC

Proactive Measures: Innovate

I

Anticipate
Track latest threat research Skate to where the puck is: OAuth 2.x Inventory OAuth use
­ Identity systems, SaaS apps ­ Hidden dependencies[1]
Assume non-phishing attack vectors Vendor research and roadmap

Initiate
Early warning indicators
­ Failures against IP allow lists (compromised creds) ­ Suspicious HTTP/URL traffic (phish targeting)
Threat intel specific to protocol-based attacks ­ Fingerprint approved applications ­ Detect suspicious OAuth applications ­ Attribution for OAuth threats

[1] Hacking G Suite: The Power of Dark Apps Script Magic, Matthew Bryant, DEF CON 29

#RSAC
Applying This Presentation

#RSAC
Applying This Presentation
Next week you should:
­ Ownership: identify appropriate security personnel ­ Educate your team on OAuth
https://www.netskope.com/blog/new-phishing-attacks-exploiting-oauthauthorization-flows-part-1
Dr. Nestori Syynimaa: https://o365blog.com/post/phishing See References slide at end for more links
­ Assess risk
Review critical cloud apps & data => tighten existing controls
48

#RSAC
Applying This Presentation

­ Checklist: review current and future apps (internally or with vendors) ­ Customize: update checklist by reviewing every app's admin controls

Identity Design
Oauth Use Is OAuth used? Is it the only option or 1 of many? Which flows?
Documentation Scopes clearly documented? Vendor app ids documented?
Approvals Are the approval screens clear? Is what is being asked clear to users?
Application Identity Is the application's identity clearly described? Are vendor application ids clearly documented?
Integration Is there a 3rd-party app ecosystem? With publicly documented APIs? Is there vendor verification? Are verified applications clearly shown in approval dialogs? Is there a directory of approved applications? Vendor websites? App ids?

Auditing
Activities Authentication: failed logins? Authorization: are detailed OAuth protocol steps logged? e.g., token refreshes? Application: which application activities (events) are logged?
Fields App ids? Scopes? Users? Location/IPs? OAuth URLs and parameters?
Reporting Content: Which apps have been approved? By user? # Users? Timestamps? Sort/filters? Which scopes approved/granted? By user? # Users? Which resources granted access to? Aggregations: counts, top-N, grouping, distribution/breakdowns? Generation: Saved reports? Scheduled reports? Pushed? Notifications: Alerts? Criteria?

49

#RSAC
Applying This Presentation

­ Checklist: review current and future apps (internally or with vendors) ­ Customize: update checklist by reviewing every app's admin controls

Prevention

Mitigation

Timeouts What are the default timeouts for: GUI sessions, access tokens, refresh tokens? Can you change the timeouts for: GUI sessions, access tokens, refresh tokens?
Access controls Can you restrict to admin only? allow users? admin approvals required? Application allow lists? deny lists? IP allow lists? Device endpoint requirements?
Detection

Revocation Can you revoke access tokens? Can you revoke refresh tokens? Can you revoke GUI sessions? Do you revoke using the Admin Console and/or API ?

Can you alert or take action on failed logins?

Can you alert or take action on failed approvals?

Any support for detecting compromised credentials?

50

#RSAC
Applying This Presentation
In the first 3 months following this presentation:
­ Inventory: create/update list of approved OAuth applications ­ Baseline OAuth activity
Collect OAuth audit logs Baseline normal activity Identify Top-N applications, permissions granted, users
­ Policies: review/refine/plan
Restrict device code authorization grants Lockdown OAuth application approval policy
51

#RSAC
Applying This Presentation
In the first 3 months following this presentation (cont.):
­ Prevent
Block device code URLs Exceptions should be restricted with IP allow policies Restrict OAuth application approval process
­ Detect
Update detections for failures with respect to IP allow lists Create a behavioral detection plan to detect compromised credentials, suspicious application activity, and risk users based on their OAuth activities
52

#RSAC
Applying This Presentation
In the first 3 months following this presentation (cont.):
­ Mitigate
Focus on temporary token behavior with all IAM vendors Update playbooks for compromised OAuth credentials Focus on and test revocation Use any available controls that govern OAuth protocol behavior e.g., timeouts
53

#RSAC
Applying This Presentation
Within 6 months, you should:
­ Analysis: implement a process to analyze OAuth risk
Start tracking high-risk users and applications, using top-N filters Focus on abnormal changes / anomalies
­ Vendor roadmaps: discuss OAuth threats, vendor controls and solutions ­ Detection: advanced measures
IP allow list failures Start tracking risky users based on their OAuth activities Honey tokens
­ OAuth Threat Intel: catalog approved OAuth applications (client ids, expected URLs and HTTP traffic)
54

#RSAC
References
1.0 OAuth Attacks and Defense Measures 1.1 Introducing a new phishing technique for compromising Office 365 accounts: https://o365blog.com/post/phishing/#oauth-consent 1.2 New Phishing Attacks Exploiting OAuth Authorization Flows (Part 1): https://www.netskope.com/blog/new-phishing-attacks-exploiting-oauth-authorization-flows-part-1 1.3 New Phishing Attacks Exploiting OAuth Authorization Flows (Part 2): https://www.netskope.com/blog/new-phishing-attacks-exploiting-oauth-authentication-flows-part-2 1.4 New Phishing Attacks Exploiting OAuth Authorization Flows (Part 3): https://www.netskope.com/blog/new-phishing-attacks-exploiting-oauth-authentication-flows-part-3 1.5 GCP OAuth Token Hijacking in Google Cloud ­ Part 1: https://www.netskope.com/blog/gcp-oauth-token-hijacking-in-google-cloud-part-1 1.6 GCP OAuth Token Hijacking in Google Cloud--Part 2: https://www.netskope.com/blog/gcp-oauth-token-hijacking-in-google-cloud-part-2
2.0 Evolving Phishing Attacks 2.1 A Big Catch: Cloud Phishing from Google App Engine and Azure App Service: https://www.netskope.com/blog/a-big-catch-cloud-phishing-from-google-app-engine-and-azure-appservice 2.2 Microsoft Seizes Malicious Domains Used in Mass Office 365 Attacks: https://threatpost.com/microsoft-seizes-domains-office-365-phishing-scam/157261/ 2.3 Phishing Attack Hijacks Office 365 Accounts Using OAuth Apps: https://www.bleepingcomputer.com/news/security/phishing-attack-hijacks-office-365-accounts-using-oauth-apps/ 2.4 Office 365 Phishing Attack Leverages Real-Time Active Directory Validation: https://threatpost.com/office-365-phishing-attack-leverages-real-time-active-directoryvalidation/159188/ 2.5 Demonstration - Illicit Consent Grant Attack in Azure AD: https://www.nixu.com/blog/demonstration-illicit-consent-grant-attack-azure-ad-office-365 https://securecloud.blog/2018/10/02/demonstration-illicit-consent-grant-attack-in-azure-ad-office-365/ 2.6 Detection and Mitigation of Illicit Consent Grant Attacks in Azure AD: https://www.cloud-architekt.net/detection-and-mitigation-consent-grant-attacks-azuread/ 2.7 HelSec Azure AD write-up: Phishing on Steroids with Azure AD Consent Extractor: https://securecloud.blog/2019/12/17/helsec-azure-ad-write-up-phishing-on-steroids-with-azuread-consent-extractor/ 2.8 Pawn Storm Abuses OAuth In Social Engineering Attack: https://www.trendmicro.com/en_us/research/17/d/pawn-storm-abuses-open-authentication-advanced-socialengineering-attacks.html
3.0 OAuth Device Code Flow 3.1 OAuth 2.0 RFC: https://tools.ietf.org/html/rfc6749 3.2 OAuth 2.0 Device Authorization Grant RFC: https://datatracker.ietf.org/doc/html/rfc8628 3.3 OAuth 2.0 for TV and Limited-Input Device Applications: https://developers.google.com/identity/protocols/oauth2/limited-input-device 3.4 OAuth 2.0 Scopes for Google APIs: https://developers.google.com/identity/protocols/oauth2/scopes 3.5. Office Device Code Phishing: https://gist.github.com/Mr-Un1k0d3r/afef5a80cb72dfeaa78d14465fb0d333

Thank you
Jenko Hwong
Cloud Security Researcher Netskope, Inc. @jenkohwong

#RSAC

