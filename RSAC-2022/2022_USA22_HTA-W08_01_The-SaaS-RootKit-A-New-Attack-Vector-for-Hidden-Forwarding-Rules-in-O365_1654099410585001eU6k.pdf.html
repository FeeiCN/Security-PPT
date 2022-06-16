#RSAC
Session ID: HTA-W08
The SaaS RootKit: A New Attack Vector to Create Hidden Forwarding Rules in O365
Maor Bin, CEO & Co-Founder Adaptive Shield

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
DISCOVERY
An attack vector due to a vulnerability within Microsoft's OAuth application registration.
Through this vulnerability, one can leverage Exchange's legacy API to create hidden forwarding rules in M365 mailboxes.
3

#RSAC
Agenda
- Background: A Look into the Inbox Rules of Microsoft 365 - Hidden Forwarding Rules Discovery
- The Next Evolution in Hidden Forwarding Rules: The SaaS Rootkit - Demo part 1 - OAuth and 3rd Party Apps Access - Demo part 2 - Discussion - Mitigation Strategies - Summary
4

#RSAC
What Are Inbox Rules in Microsoft 365?
Actions that occur based on preset conditions within your Microsoft mailbox.
Example use cases: - Auto-mark the importance level of incoming messages - Automatically delete outgoing emails - Automatically forward incoming emails
5

#RSAC
Inbox Forwarding Rules
Why are there forwarding rules? A company wants to set up email forwarding for a specific user's mailbox
How can they be configured?  Admins usually use ForwardingSMTPAddress or ForwardingAddress  Users can set up Mail-Flow Rules or Inbox Rules: Inbox Rules can trigger
different forwarding rules based on different attributes of the user's inbox
6

#RSAC
How Do User's Create an Inbox Rule?
7

#RSAC
The Inbox Rule Is Created! The Frontend Experience
8

#RSAC
The Inbox Rule Is Created! The Backend Experience
An example of a raw inbox forwarding rule
(IPM.Rule.Version2.Message)
9

#RSAC
The Discovery of Hidden Inbox Forwarding Rules
Damian Pfammater found an undocumented method that can be used to hide these types inbox rules.
These hidden forwarding rules: - Are functional - Are NOT visible through
common interfaces (Email clients, Admin Dashboard, or API)
For Reference: BLOG POST SEPTEMBER 17, 2018
10

#RSAC
Back to the Backend: How Can the User Hide an Inbox Rule?
Tamper this object:
PR_RULE_MSG_PROVIDER (could be empty or malformed)
11

#RSAC
Microsoft's Response to Damian
"[...] Our engineering team investigated the behavior that you described. They determined that it is not considered a security issue because it requires control of the account to create these rules. However, they are considering ways to improve the software in the future." "[...] MSRC will not be tracking the issue and we won't have future updates about it [...]"
In other words, Microsoft is saying: It's not a bug, it's a feature
12

#RSAC
The Next Evolution in Hidden Forwarding Rules: an Attack Method Through SaaS
 Malware that lives as a SaaS app  Maintains access to the victim's account  With rootkit capabilities
= The SaaS Rootkit
13

#RSAC
The SaaS Rootkit
"A rootkit is a collection of computer software, typically malicious, designed to enable access to a computer or an area of its software that is not otherwise allowed and often masks its existence or the existence of other software." "Rootkit detection is difficult because a rootkit may be able to subvert the software that is intended to find it"
For reference: Rootkit definition from Wikipedia
14

#RSAC
Demo (part 1): Vulnerability in Azure AD App Registration Process
 Create app that looks credible
 Entice user to accept and gain permissions
 Attacker can add deleted Exchange online scopes
15

#RSAC
Undocumented Resources - No Server Side Validation
16

3rd Party App Access Through OAuth 2.0
OAuth 2.0:
- has greatly simplified authentication & authorization - offers a fine-grained delegation of access rights.
Represented in the form of scopes, an application asks for the user's authorization for specific permissions.
- an app can request one or more scopes. - the user grants these apps permissions to execute code to perform logic behind the
scenes within their environment.
These apps can be harmless or as threatening as an executable file

#RSAC
17

#RSAC
A Look at OAuth & 3rd Party App Access
18

Remind You of Something?
Potential SaaS Malware

Potential Endpoint Malware

#RSAC

19

#RSAC
Demo (part 2) Abusing Exchange Online Legacy API
 Attacker can now create the hidden forwarding rules
 Hide the created rules
 This is no different than sending a malicious executable file. Rogue OAuth apps are equivalent to malware. Unfortunately, no EDR can detect it.
20

#RSAC
Discussion: What Just Happened?
· We modified [or improved :)] the version of the Microsoft tool: Get-AllTenantRulesAndForms.ps1 into GetAllRules.ps1 and Hide-Rule.ps1
· Get-AllTenantRulesAndForms.ps1 gaps: ­ Using user credentials authentication ­ Leaves out PR_RULE_MSG_PROVIDER (the field we need to tamper) ­ Unable to update / tamper objects (e.g. overwrite PR_RULE_MSG_PROVIDER)
Reverse engineering EWS DLL helped us finding the right functions and using them in our scripts:
21

#RSAC
Microsoft's Answer to Us
"We have gone over the report in detail, including all of your additional files. Unfortunately it was determined that while the issue you reported is valid, it does not meet our the bar for immediate servicing. In this case, we do think this can be improved upon, but due to the high requirements on the attacker, with the issue being post exploitation of an administrator, this would not be tracked by the security team for servicing. That being said, this submission has been flagged for future review by the product team as an opportunity to improve the security of the affected product.
We do not have a timeline for when this review will occur, and will not be able to provide status for this issue moving forward. At this time, you are able to blog about/discuss this case and/or present your findings publicly about the current version."
22

#RSAC
How big of a problem is OAuth app access?
The SSPM Survey Report highlights the 340+ perspectives of security leaders today and the steps they are taking to secure their SaaS app stack.

SSPM Survey Report 2022
3rd party app access is a top concern
What are the top concerns when adopting SaaS application in your company? (Select up to 3)

#RSAC

#RSAC
How to Best Mitigate a SaaS Rootkit Attack
- Track activities and look for "New-InboxRule" (or similar events) and compare them with users listed rules
- Continuously monitor 3rd party apps access - Review new inbox rules with untrusted domains in the destination - If possible, disable 3rd party apps registrations - Continuously monitor new forwarding rule from untrusted domains
25

#RSAC
To Sum Up
Hidden forwarding rules are still a problem, even in a more dangerous fashion as it can show up through the trusted, Microsoft website.
Traditional controls were created to stop malware, but malware has evolved and has a new attack vector that can exploit any SaaS app, from M365 to Salesforce to G-Workspace, etc.
Utilize native security configurations to control the OAuth application installations across SaaS apps to protect users from malicious attacks like these.
26

#RSAC
Thank you!
Maor.Bin@adaptive-shield.com

