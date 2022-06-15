#RSAC
SESSION ID: TECH-W09
M365 Threat Hunting--How to Understand Attacker's TTPs in Your Tenant
Aaron Turner
VP ­ SSPM Vectra AI https://Vectra.ai

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Agenda
Understanding M365 Attack Trends Common M365 Attack Paths Key M365 Threat Hunting Capabilities Sample Threat Hunting Scenarios M365 Threat Hunting Action Plan
3

#RSAC
Attackers Targeting Microsoft SaaS Platforms
Azure Active Directory and associated applications facilitated access to the most sensitive information and facilitate critical business operations
Over the last 2 years, Azure Active Directory and Exchange Online have been the means by which over 100,000 organizations have been compromised around the world
The efficiency of these attacks has depended upon weak default configurations and the oversights/errors of organizations' M365 administrators
4

#RSAC
Increasing Velocity and Efficiency of M365 Attacks

December 2020: 100,000+ Microsoft customers compromised through Dark Halo attacks

Q1 2021: Hafnium attackers pivot from on-prem to M365 for C2 & persistence

Q4 2021: Nobelium attack announced affecting 100,000+ additional customers

June 2020: victim group widens to hundreds of high-value financial service organizations

Q2-Q3 2021: Copycats use Dark Halo and Hafnium for IP theft and ransomware campaigns

January 2022: Microsoft announces additional M365 vulnerabilities impacting thousands of customers

How much worse can it get?
February 2022: M365 vulnerabilities exploited to interrupt Ukraine military support operations

March 2020: dozens of victims, mainly US civilian agencies like Treasury

5

Common M365 Attack Paths
Attacker-controlled Service Principal

#RSAC

NSA Alert 198854

Legacy Protocols IMAP/POP3/AS
MFA Bypass

Ransomware Delivery

https://medium.com/mitre-attack/identifying-unc2452-related-techniques-9f7b6c7f3714
6

#RSAC
Key Capabilities
PowerShell PowerShell PowerShell ...and GraphAPI knowledge
7

PowerShell / GraphAPI Conundrum

Seven different datasources to manage to get basic threat hunting visibility in M365
Different Logon Methods
­ Supports Service Principals ­ Requires User Credentials
Mobile Vulnerability Assessment Example
­ How many mobile devices could have their credentials stolen?
APIs to query:
­ Azure AD (enumerate all active users) ­ Exchange Online (correlate all active mailboxes and
mobile connections) ­ MS Graph (Intune data correlation)

MS Teams
SharePoint Online

Azure AD MS Graph MS Online

#RSAC
Azure RM
Exchange Online

8

#RSAC
Threat Hunting Scenario
Exchange Online Administrator Privilege Abuse
­ Organization has restricted admin tasks to only those with Microsoft Authenticator strictly enforced
­ Long-term unauthorized access discovered ­ How?
Always fundamentally question EVERY step of the identity supply chain!
­ What is the level of effort to clone a Microsoft Authenticator application? ­ What is the level of effort to compromise a browser used by Exchange
Admin?
9

#RSAC
M365 Threat Hunting Action Plan
Get good at PowerShell!
­ Online Training: Analyzing M365 Security Settings with PowerShell (iansresearch.com)
Establish appropriate change detection controls
­ First you'll need a baseline, do it NOW
Implement strong change management for authorized M365 changes
­ Service management tools like ServiceNow can help, but they all require discipline
10

#RSAC
Questions & Staying In Touch
Questions & Comments? Connect with me on LinkedIn https://www.linkedin.com/in/aaronrturner/
11

