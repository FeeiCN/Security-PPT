#RSAC
SESSION ID: CSCS-R06
The Road to Cloud Is Paved with On-Prem Integrations
Dr. Nestori Syynimaa
Senior Principal Security Researcher Secureworks® CTU @DrAzureAD

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Introduction

#RSAC
About the speaker

Dr. Nestori Syynimaa (@DrAzureAD) Senior Principal Security Researcher @Secureworks CTU Creator of AADInternals toolkit Microsoft MCT Microsoft MVP x2 Microsoft MVR

The best Finnish guy :)

Me!
4

#RSAC
Contents
Azure Active Directory authentication options On-prem integrations and threats of each option Hardening / mitigation techniques
To make points:
­ Live demos w/ AADInternals  ­ Interactive demos w/ audience 
5

#RSAC
Azure Active Directory OSINT
Azure AD APIs can be used to fetch OSINT for any tenant Presentation statistics based on OSINT for Fortune 500 companies and top 2000 universities*
* Syynimaa, Nestori. (2022). Exploring Azure Active Directory Attack Surface - Enumerating Authentication Methods with Open-Source Intelligence Tools. Paper presented at the ICEIS - 24th International Conference on Enterprise Information Systems, Apr 25-27.
6

#RSAC
Azure AD Adoption Rate Statistics

Fortune 500 Has Azure AD tenant No Azure AD tenant
Top 2000 Universities Has Azure AD tenant No Azure AD tenant

441 88 % 59 12 %
1892 95 % 108 5 %

#RSAC
Azure AD Cloud & Hybrid Identities

Azure AD Hybrid Authentication Options

Identity federation

Password-hash synchronization (PHS) *

Pass-through authentication (PTA) *

Azure Active Directory

Azure Active Directory

Azure Active Directory

Active Directory Federation Services
(AD FS)

Azure AD Connect

Active Directory

Active Directory
* Supports seamless single sign-on

PTA agent
Active Directory

#RSAC
9

(Hybrid) Cloud Security
On-premises
Active Directory Federation Services
(AD FS)
Azure AD Connect
PTA agent
Active Directory

Cloud
Microsoft 365 Azure AD
Azure services

#RSAC
10

#RSAC
Hybrid Cloud Threats and Mitigations
11

#RSAC
Directory Synchronization

Active Directory (AD)
Domain User Group

Azure AD (AAD)

Azure AD Connect

Tenant User Group

Azure AD Object

Attribute

Description

cloudAnchor

<object type>_<object id>

sourceAnchor

B64(on-prem AD object GUID)

onPremisesSecurityIdentifier on-prem AD object SID

Computer

Device

12

#RSAC
Azure AD Synchronization Statistics

Fortune 500 (n=441) Enabled Enabled (errors) Disabled Unknown
Top 2000 universities (n=1 892) Enabled Enabled (errors) Disabled Unknown

411 93 % 9 2%
13 3 % 8 2%
929 49 % 63 3 %
895 47 % 5 0%

#RSAC
Demo
Dump Azure AD Connect credentials with AADInternals:
Get-AADIntSyncCredentials
14

#RSAC
Directory Synchronization hardening
Treat as tier 0 server Limit access to server Allow synchronization only from dedicated ip-address(es)

Pass-through Authentication (PTA)

On-premises
Active Directory

On-premises
Azure Active Directory

PTA agent

Azure Service Bus

#RSAC

#RSAC
Demo
Create a backdoor and harvest credentials with AADInternals' PTA Spy:
Install-AADIntPTASpy
Audience: https://rsac.azurewebsites.net
17

#RSAC
Pass-through Authentication hardening
Treat PTA Agent server as Tier 0 Limit the number of on-prem AD administrators Limit the number of Azure AD Global Administrators Use Multi-Factor Authentication (MFA)

#RSAC
Seamless Single-Sign-On (aka DesktopSSO)

On-premises

Cloud

Active Directory
AZUREADSSOACC$

Attribute User SID UPN

Azure Active Directory

Domain contoso.com adatum.com woodgrowe.com

SSSO Enabled Disabled Disabled

Password ******

Kerberos ticket
Value On-prem AD object SID user@contoso.com

Identifier

#RSAC
Seamless Single-Sign-On Statistics

Fortune 500 (n=441) Enabled Disabled

118 27 % 382 73 %

Top 2000 Universities (n=1 892)

Enabled

258 14 %

Disabled

1 634 86 %

#RSAC
Demo
Dump AZUREADSSOACC NTHash with AADInternals:
Get-AADIntDesktopSSOAccountPassword
Simulate compromised AZUREADSSOACC:
Set-AADIntDesktopSSOEnabled
Audience: https://rsac.azurewebsites.net
21

#RSAC
Seamless Single-Sign-On Hardening
Limit the number of on-prem AD administrators Use Multi-Factor Authentication (MFA)

#RSAC
Identity Federation

On-premises

Cloud

Active Directory Federation Services
(AD FS)
Token Signing certificate

Azure Active Directory

Domain contoso.com adatum.com woodgrowe.com

Type Managed Federated Federated

Public key

Active

User

Directory

Claim ImmutableId UPN

SAML token
Value B64(AD object GUID) user@contoso.com

Identifier

#RSAC
Identity Federation Statistics

Fortune 500 (n=441) Has custom domains Has federated domains

Averages

432 98 %

Number of domains

66

293 68 %

Number of federated domains

16

Top Universities (n=1892)

Averages

Has custom domains

1 884 99,6 % Number of domains

17

Has federated domains

535 28 %

Number of federated domains

6

#RSAC
Demo
Dump ADFS token signing certificates with AADInternals:
Export-AADIntADFSCertificates
Simulate compromised token signing certificates:
Set-MsolDomainFederationSettings
Audience: https://rsac.azurewebsites.net
25

#RSAC
Identity Federation Hardening
Treat each AD FS server as tier 0 server Limit access to AD FS servers Close port 80 from all non-AD FS servers Limit the number of Azure AD Global Administrators

#RSAC
Call to Action
27

#RSAC
Call to Action
Next week:
­ Check OSINT of your own tenant to identify possible weak points
Next month:
­ Assess the security and risk of current setup ­ Consider different authentication options
Next two months:
­ Create a hardening and implementation plan
Next six months:
­ Implement hardening / change authentication
28

#RSAC
Summary
29

#RSAC
Summary
Hybrid Identity makes cloud easier to use and manage
­ It also means integrations to on-prem services
Attacking on-prem environment easiest way to breach cloud
­ Protecting your on-prem services is crucial to keep your cloud safe!
OSINT is the easiest/fastest way to check your tenant for possible attack targets
­ That's how hackers do it anyways..
Follow/reach out on Twitter: @DrAzureAD
30

#RSAC
Q&A
31

