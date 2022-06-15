#RSAC
SESSION ID: PART3-W01
Anticipate and Defend Against Adversaries Targeting SaaS and IaaS
Brian Vecci
Field CTO Varonis Systems, Inc. @brianthevecci

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Agenda
State of SaaS risks How these risks are exploited Q&A

#RSAC
State of SaaS Risks

#RSAC
Broken Access Control Takes the Crown in 2021
The OWASP Top 10 is a standard awareness document for developers and web application security
Broken access control is considered the most critical security risk to web applications

SaaS challenges
Data Protection Configuration Risk Interconnectivity Risk

#RSAC
Everything is connected
Use Okta to sign into Salesforce
Outlook messages sync to Salesforce via API
Zoom integration with Outlook for scheduling meetings

#RSAC
API Abuse

#RSAC
Rise of the Machines 1 out of 4 identities in SaaS apps are non-human

#RSAC
Salesforce Community API misconfiguration
So there's this guest profile in Salesforce Communities...

#RSAC
Check for misconfigurations
Use Google URL searches Operators like "inurl" will narrow the results Common Salesforce Community URLs include:
­ /s/topic ­ /s/article ­ /s/contactsupport

#RSAC
Salesforce Data Scraping In Action

#RSAC
What you can do to fix the exposure
Check the rights on the Guest User profile in the Site Builder settings Remove Guest User rights
­ API Enabled ­ Access Activities
Set Default Record Ownership to Admins Enable "Secure guest user record access" in the Sharing Settings

#RSAC
Dial M for Misconfiguration 44% of cloud user privileges are misconfigured

#RSAC
Einstein's Wormhole
Varonis researchers discovered a bug called Einstein's Wormhole, which can expose administrator's calendars to the internet Einstein Activity Capture (EAC) synchronizes emails and calendar events between Microsoft Exchange or Google accounts and Salesforce If misconfigured, calendar events and their sensitive contents can be exposed publicly

#RSAC

#RSAC

#RSAC

#RSAC
The Fix Is In

Salesforce already corrected the underlying bug
Change your guest user's email to a dummy email using the script
Delete the sensitive objects associated with the guest account (this is tough, we can help)

for (User user: [SELECT Id FROM User WHERE UserType='Guest'])
{
user.Email ='guest@company.com';
update user;
}

#RSAC
SSO Impersonation

#RSAC
The Shadow Knows 3 out of 5 privileged cloud users are shadow admins

#RSAC
SSO is the new (h)Active Directory
SSO makes it easy and convenient to centrally manage users' various cloud solution access
A compromised SSO admins opens the door to re-assigning resources
Attackers can pivot to different resources by assigning cloud data apps and impersonating users
Data exfiltration is as easy as sharing data with attackercontrolled accounts

Attack Flow

Get admin access to any connected application

Backdoor access to customer contracts folder

Downloads full users list Exfiltrate sensitive HR files

#RSAC

Phishing Mail

Extracting users list using admin panel Sharing sensitive data stored on My Drive with external

Impersonation to other users using SSO

Share customers contracts using a public custom URL

#RSAC
Authentication Monitoring Evasion

#RSAC
Watch the vault not the door

#RSAC
Attack Flow

Steal browser cookies Steal browser credentials

Attacker can connect directly to SF But may be blocked or discovered by MFA and/or conditional access
Attacker pivots his web traffic through the victim's PC

Phishing Mail

Corporate Employee Desktop

Through Reverse Proxy Connection

#RSAC
Why Use Reverse Web Proxy Technique
Average Attacker
­ Compromises Endpoint ­ Pulls down Creds and Cookies ­ Takes them offline to attacker machine ­ Logs in using compromised creds from that machine
Results
­ Alerts trigger around Geo location ­ Suspicious IP Sources ­ Potentially blocked by conditional access settings

#RSAC
Why Use Reverse Web Proxy Technique
Advanced Attacker
­ Compromises Endpoint ­ Pulls down Creds and Cookies ­ Route all web traffic through
compromised machine using proxy ­ Access Cloud Applications through proxy
using compromised creds
Results
­ No change in geolocation or IP source ­ Not blocked by conditional access ­ No alerts generate by activity?

One more thing...

#RSAC
Jira

How many Jira public objects did we find?

Projects 244

Dashboards

3,774

Filters

23,135

#RSAC
Scanner scope:  812 subdomains scanned  689 had public objects Potentially sensitive data:  2,922 email addresses  5,424 IPv4 addresses  60,411 URLs

Issues
-

20,000

40,000

60,000

75,629
80,000

#RSAC
Thanks to our top-notch research team

#RSAC
Q&A

#RSAC
Thank You More questions? Come visit
us at Booth #5545

