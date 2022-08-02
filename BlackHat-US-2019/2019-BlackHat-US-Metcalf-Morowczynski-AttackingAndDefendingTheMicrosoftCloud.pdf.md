Attacking & Defending the Microsoft Cloud (Azure AD & Office 365)

Sean Metcalf CTO Trimarc

Mark Morowczynski Principal Program Manager Microsoft

Sean Metcalf

· Founder Trimarc (Trimarc.io), a professional services company that helps organizations better secure their Microsoft platform, including the Microsoft Cloud.

· Microsoft Certified Master (MCM) Directory Services

· Microsoft MVP

· Speaker: Black Hat, Blue Hat, BSides, DEF CON, DerbyCon, Shakacon, Sp4rkCon, Troopers

· Security Consultant / Researcher

· AD Enthusiast - Own & Operate ADSecurity.org (Microsoft platform security info)

Sean Metcalf @Pyrotek3 sean@TrimarcSecurity.com

Mark Morowczynski

· Principal Program Manager, Identity Division at Microsoft
· Customer Experience (CXP) Team · Azure Active Directory (AAD), Active Directory(AD), Active Directory
Federation Services (ADFS)

· SANS/GIAC-GSEC, GCIH, GCIA, GCCC, GCTI, GPEN, GWAPT, GMOB, GCWN. CISSP&CCSP. MCSE

· Speaker-Microsoft Ignite, Microsoft Inspire, Microsoft Ready,

Microsoft MVP Summits, The Cloud Identity Summit, SANs

Security Summits and TechMentor

Mark Morowczynski

· AskPFEPlat Blog, Azure AD Identity Blog

@markmorow Markmoro@microsoft.com

Why This Talk?
Some things start with Twitter...

Why This Talk?
Some things start with Twitter...

Agenda
· "Sample Customer" Cloud On-boarding Process · Attacker Recon · Attacking the Cloud · Defending the Cloud · Go Do's!

About Acme
Acme Corporation
· Company founded in 1808. · Global company headquartered in Las Vegas, Nevada. · Largest manufacturer & distributer of anvils in the world. · 500k users in 140 countries (anvils are big business). · Started thinking about moving all on-prem infrastructure to the
cloud (except manufacturing systems). · Just hired a new visionary CIO...

Priority #1: We're going to the cloud!
Wile E. Coyote
CIO Acme Corporation

Acme Project Team Members
· Identity Architect
· Wants to fix all previous IAM mistakes. "This time let's do it right!"
· Collaboration Architect
· On board but concerned what does this mean for future employment.
· Identity Engineering
· All scenarios must have 100% coverage to actually start the deployment
· Collaboration Engineering
· Looking for any reason to not have to change anything
· Security Engineering
· The answer is No. What was the question again?
· Desktop Engineering
· Not present

Acme Starts Moving to the Microsoft Cloud
· Acme signs up for Office 365, first workload is email · Additional security features such as MFA prioritized · Initial plan is to setup a pilot and then move the rest of the company · Azure AD Connect is setup to sync all users and groups & enabled
password hash sync. · A few pilot users in IT have their email moved over · More meetings and discussions planned to flush out 100% use case
coverage.
· "What if they just got a new phone, are on a flight but the wifi is down. How will they access their email?"
· Meanwhile...

Attacking The Cloud

Cloud Recon
Cloud Discovery What can we find?

Cloud Recon: DNS MX Records
· Proofpoint (pphosted) · Microsoft Office 365: DOMAIN-COM.mail.protection.outlook.com · Cisco Email Security (iphmx) · Message Labs · Mimecast · Google Apps (G Suite):
*.google OR *.googlemail.com · FireEye (fireeyecloud.com) · ForcePoint (mailcontrol.com)

Cloud Recon: DNS TXT Records
MS = Microsoft Office 365 Google-Site-Verification = G Suite Docusign = Docusign digital signatures Adobe IDP Amazonses = Amazon Simple Email Facebook Atlassian-* = Atlassian services GlobalSign AzureWebsites = Microsoft Azure Dropbox

Cloud Recon: Acme DNS TXT Records
What do we know about Acme's Cloud Config?
· Office 365 (MS=7274734) · Atlassian · Cisco · Citrix · Docusign · Dropbox · Facebook · Google Site · Team Viewer · WebEx

Cloud Recon: Acme DNS TXT Records
https://medium.com/@logicbomb_1/one-misconfig-jira-to-leak-them-all-including-nasa-and-hundreds-of-fortune-500companies-a70957ef03c7

Cloud Recon: Federation
No standard naming for FS. Some are hosted in the cloud. DNS query for:
· adfs · auth · fs · okta · ping · sso · sts

Attacking Federation
DEF CON 25 (July 2017)

Attacking Federation: Forging SAML Tokens
https://www.cyberark.com/threat-research-blog/golden-saml-newly-discovered-attacktechnique-forges-authentication-cloud-apps/
https://github.com/fireeye/adfspoof

Attacking Federation: ADFS Persistence
I Am ADFS and So Can You
https://www.troopers.de/troopers19/agenda/fpxwmn/

Attacking Federation: ADFS Persistence
I Am ADFS and So Can You
https://www.troopers.de/troopers19/agenda/fpxwmn/

Federation Server Attack Detection & Defense
· Protect federation servers (ADFS) like Domain Controllers (Tier 0).
· Protect federation certificates. · Consolidate and correlate federation server, AD, and
Azure AD logs to provide insight into user authentication to Office 365 services. · Correlate Federation token request with AD authentication to ensure a user performed the complete auth flow.

On-Prem: AD to Cloud Sync
· AD provides Single Sign On (SSO) to cloud services. · Most organizations aren't aware of all cloud services
active in their environment. · Some directory sync tools synchronizes all users &
attributes to cloud services. · Most sync engines only require AD user rights to send
user and group information to cloud service. · If you have Office 365, you almost certainly have Azure
AD Connect synchronizing on-prem AD user to Azure AD.

On-Prem: AD to Cloud Sync

On-Prem: AD to Cloud Sync

On-Prem: AD to Cloud Sync Examples
· Adobe User Sync tool · Atlassian Active Directory Attributes Sync · Dropbox Active Directory Connector · Duo Directory Sync · Envoy Active Directory integration (PowerShell) · Google Cloud Directory Sync · Facebook Workplace Active Directory Sync · Forcepoint (Websense) Directory Synchronization Client · Mimecast Directory Sync Tool · Proofpoint Essentials AD Sync Tool · Rackspace Directory Sync (syncs passwords too!) · Zoom AD Sync to Zoom

Attacking On-Prem Cloud Integration
DEF CON 25 (July 2017)

On-Prem: Acme's Azure AD Connect

On-Prem: Acme's Azure AD Connect

On-Prem: Acme's Azure AD Connect

On-Prem: Acme's Azure AD Connect

On-Prem: Acme's Azure AD Connect

On-Prem: Acme's Azure AD Connect Scenario
· Azure AD Connect service account is granted password hash sync rights.
· AAD Connect runs on "AzureSync" which is in the Servers OU. · The Servers OU has 2 GPOs applied:
· "Server Baseline Policy" GPO adds the Server Admins group (in the Groups OU).
· "Server Config" GPO has 3 Server Tier groups with modify rights.
Attack Options: · Compromise account that is a member of the Server Admins group
or any of the Server Tier groups. · Compromise account delegated rights to modify groups in the
Groups OU.

AD Recon vs Azure AD Recon
On-Prem AD:
· AD user can enumerate all user accounts & admin group membership with network access to a Domain Controller.
Azure AD:
· Azure AD user can enumerate all user accounts & admin group membership with access to Office 365 services (the internet by default).
· User enumeration* often possible without an account!

Azure AD User Enumeration
· Office 365 Authentication Page (Python) [Account Discovery]
· https://github.com/LMGsec/o365creeper
· OWA (Golang)
· https://github.com/busterb/msmailprobe
· ActiveSync (Python)
· https://bitbucket.org/grimhacker/office365userenum/src
· MSOnline/AzureAD PowerShell Module (PowerShell)
· https://github.com/nyxgeek/o365recon

Password Spraying Overview
"Winter2019"
Sleep x seconds/minutes
"Spring2019"
No account lockout since 1 password is used in authentication attempt for each user in the list (typically all or just admins) then the password spray tool pauses before moving onto the next password.

Password Spraying Overview
"Winter2019!"
Sleep x seconds/minutes
"Spring2019!"
No account lockout since 1 password is used in authentication attempt for each user in the list (typically all or just admins) then the password spray tool pauses before moving onto the next password.

Password Spraying Overview
"Summer2019"
Sleep x seconds/minutes
"Fall2019"
No account lockout since 1 password is used in authentication attempt for each user in the list (typically all or just admins) then the password spray tool pauses before moving onto the next password.

Attacking the Cloud: Password Spraying
· Ruler (Exchange) [Golang]
· https://github.com/sensepost/ruler/wiki/Brute-Force
· SprayingToolkit (Lync/Skype for Business/OWA) [Python]
· https://github.com/byt3bl33d3r/SprayingToolkit
· LyncSniper (Lync/Skype for Business) [PowerShell]
· https://github.com/mdsecresearch/LyncSniper
· MailSniper (OWA/EWS) [PowerShell]
· https://github.com/dafthack/MailSniper
Legacy Authentication enables O365 Password Spraying Legacy = Outlook =<2010, POP, IMAP, SMTP, etc

Attacking the Cloud: Password Spraying

Attacking the Cloud: Password Spraying

Detecting Password Spraying
Azure AD Sign-in Logs require Azure AD Premium (P1 or P2)
Soon...

Detecting Password Spraying
*Azure AD Sign-in Logs require Azure AD Premium (P1 or P2)

Detecting Password Spraying
*Azure AD Sign-in Logs require Azure AD Premium (P1 or P2)

Detecting Password Spraying
Legacy Authentication

Attacking Cloud Administration

From On-Prem to Cloud Administration

Attacking Cloud Administration

Attacking Cloud Administration
https://www.bleepingcomputer.com/news/security/phisherstarget-office-365-admins-with-fake-admin-alerts/

Global Reader
From Global Admin to Global Reader
· Currently in Private Preview · Provides read access to O365 services that Global
Admin can read/write. · Enables accounts that "required" Global Admin to be
switched to read-only. · Global Reader read-only access is still being
expanded to cover all O365 services.

Global Reader

Members have read-only access to reports, alerts, and can see all the configuration and settings.
The primary difference between Global Reader and Security Reader is that an Global Reader can access configuration and settings.

Default roles assigned:
· View-Only Retention Management
· View-Only Manage Alerts · View-Only Device Management · View-Only IB Compliance
Management · View-Only DLP Compliance
Management · Security Reader · Service Assurance View · View-Only Audit Logs · View-Only Record Management

· View-Only Recipients
https://docs.microsoft.com/en-us/office365/securitycompliance/permissions-in-the-security-and-compliance-center

Cloud Administration ­ Finding a Weakness

Workstation

(DNS)

HTTP(S)
Web Browser

Cloud Website

Attacking Cloud Administration: Token Theft

Attacking Cloud Administration: Token Theft

Attacking Cloud Administration: Token Theft

Auth Token

SSL/TLS Decryption
Device
Token

Auth Token

Attacker Compromises
Device

Cloud Website

Attacking Cloud Administration: Token Theft

Auth Token

SSL/TLS Decryption
Device
Token

Auth Token

Attacker Compromises
Device

Cloud Website

Attacking Cloud Administration: Token Theft

Auth Token

Evil Proxy Token

Auth Token

Cloud Website

https://github.com/kgretzky/evilginx2

Password Reuse/Replay
SHA1

Password Reuse/Replay Detection
Password Hash (of the AD Hash) Sync Enabled: Users with Leaked Credential Report
HaveIBeenPwned.com

Attacking the Cloud: App PrivEsc & Persistence
· Illicit Consent Grant Attack (OAuth Espionage)
· Users fooled into granting permissions to an app that looks like a familiar app.
· FireEye PwnAuth
· https://www.fireeye.com/blog/threat-research/2018/05/shining-alight-on-oauth-abuse-with-pwnauth.html
· MDSec Office 365 Toolkit
· https://www.mdsec.co.uk/2019/07/introducing-the-office-365attack-toolkit/
· Overprivileged Enterprise Apps with broad permissions.

Illicit Consent Grant Attack: MDSec O365 Attack Toolkit
https://www.mdsec.co.uk/2019/07/introducing-the-office-365-attack-toolkit/

Illicit Consent Grant Attack: Pawn Storm
https://blog.trendmicro.com/trendlabs-security-intelligence/pawn-storm-abuses-openauthentication-advanced-social-engineering-attacks/

Enterprise App Permissions
· Enterprise App (tenant-wide) permissions can be granted by Admins.
· Ideal persistence technique since app permissions not reviewed like group membership.

Enterprise App Permissions

Defending the Microsoft Cloud

Common Attacks Recap

· Admin Account Take Over · Consent Abuse · Breach Replay · Phishing · Password Spray

· Compromising ADFS or Azure AD Connect
Live Look: Acme Project Team

Common Attacks Recap

· Admin Account Take Over · Consent Abuse · Breach Replay · Phishing · Password Spray

· Compromising ADFS or Azure AD Connect
· Defense: Treat as Tier 0 resource!

Admin Account Take Over Defense
MFA Your ADMINS!
· Admin Accounts with MFA Sept 2017: 0.7% · Admin Accounts with MFA Sept 2018: 1.7% · Admin Accounts with MFA Aug 2019: 7.94%!

Protect Cloud Admin Accounts
· Good: Turn MFA on!
· Better: Conditional Access or Baseline Policy for Admins (Public Preview)
· Will change based on feedback · Learn more at: https://aka.ms/aadbaseline
· Best: Azure AD Privilege Identity Management
· No standing admin access · Admin access requires elevation + MFA · Approval workflows and elevation scheduling · Alerts on admin activity taking place outside of PIM · Applies/Protect Azure Resources as well! · Can buy Azure AD P2 license for just your admins · https://aka.ms/deploymentplans

Future Protection
FIDO2
· Standards-based Passwordless authentication · WebAuthN and CTAP(Client To Authenticator Protocol) standards are
final · Public/Private Key infrastructure
· Private keys are securely stored on the device
· Local gesture (e.g., biometric, PIN) required · Data bound to a single device

FIDO2 in Azure AD
Public Preview July 2019
· Edge, Firefox v67+ · Windows 10 1903 Update · Global Administrator and
Authentication Methods Admin · Can scope roll out to Users and Groups · http://aka.ms/fido2docs · Go try this in your test tenant!

Audit Consented Permissions for All Apps

Audit Consented Permissions for All Apps

Audit App Permissions with PowerShell

.\Get-AzureADPSPermissions.ps1 | Export-Csv -Path "permissions.csv" NoTypeInformation

Review both: · Delegated permissions (OAuth2PermissionGrants) · Application permissions (AppRoleAssignments).

Review output, especially:

· consents that are of ConsentType of 'AllPrincipals'.

· discrete permissions that each delegated permission or application has

· specific users that have consents granted. If high profile or high

impact users have inappropriate consents granted, you should

investigate further.

*Courtesy of Philippe Signoret

· ClientDisplayName for apps that seem suspicious.

Breach Replay Defenses
Turn on Azure AD Connect Password Hash Sync
· Leaked Credential Reporting
· Dark Web, Law Enforcement, and Security Researchers
· When something catastrophic happens
· WannaCry, NotPetya · Wired-The Untold Story Of Notpeya, The Most Devasting Cyberattack In History
· https://www.wired.com/story/notpetya-cyberattack-ukraine-russia-code-crashed-the-world/
· Understand How Password Hash Sync Works
· http://aka.ms/aadphs
· After enabling will see "NEW" leaks going forward
· Don't "leak" one yourself "just to make sure it's working"

Password Hash Sync Pro/Cons

Pro
Azure AD hash(SHA256) is completely different hash then AD hash (MD4) (http://aka.ms/aadphs)

Con
Security team doesn't want any hashes in the cloud

Leaked credential report of found clear text username/passwords
Provides authentication method for environment if catastrophic event happens to on-prem (WannaCry, NotPetya)
Corporate resources can be used to recover environment in catastrophic event (retention policies, e-discovery, etc)
Can be used with User Risk Policies to automatically do Password Reset to remediate the risk

End of list

You Can Enable Password Hash Sync

Phishing Defenses
Phishing Protection
· Require Users to do MFA
· Authenticator App recommended. Better performance and less prompts (behaves as authentication token broker)
· Per User MFA
· Will be prompted for MFA regardless of the application
· Conditional Access Policy better
· Location, App, etc
· Risk Based Policy Best
· Only prompt when Risk detected
· People will fall to Phishing no matter what so we must monitor..

Phishing Defenses
Monitor: Azure AD Logs
· Pull Logs from the Azure AD Graph API
· Initially was only integration point, we have better options
· Azure Event Hub
· Pre-Built Integration into Azure Monitor, will PUSH events to SIEM
· Splunk (docs) · Sumo Logic (docs) · IBM QRadar (docs) · ArcSight (docs) · SysLog (docs)
· Azure Log Analytics or Azure Sentinel

ADFS Monitoring Azure AD Connect Health with ADFS
· Alerts about common ADFS issues (cert expiring, missing updates, performance, etc)
· Will also alert on bad Password Attempts and Risky IPs!
· ADFS 2016 or ADFS 2019 Turn On Smart Lockout
· https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/operations/configure-ad-fs-extranet-smart-lockoutprotection

Password Spray Defense
Modernize your password policy
· People choose "strong" but easily guessable passwords
· August2019! or Summer2019!
· https://aka.ms/passwordguidance · NIST 800-63B

Azure AD Banned Password Policy
· Applies to on-prem AD as well!
· https://aka.ms/deploypassword protection

Azure AD Banned Password
· Requirements
· Azure AD Premium (P1) · DCs need to be 2012 or later · No Domain or Forest functional level
requirement · Sysvol needs to be using DFSR
(http://aka.ms/dfsrmig)
· Deploy in Audit Mode first
· Passwords are fuzzy matched, substring matched & scored. Must be 5 or higher
· https://docs.microsoft.com/en-us/azure/activedirectory/authentication/concept-password-ban-bad
· After passwords have been changed, look to extend password age

Legacy Authentication and Password Spray
Nearly 100% of password spray attacks are using legacy authentication
· August 2018: 200k accounts compromised due to password spray · May 2019: 133k accounts compromised due to password spray · June 2019: 212k accounts compromised due to password spray · July 2019: 122k accounts compromised due to password spray
· Federated with Azure AD/O365
· IDP is responsible for authentication, including legacy auth!
· https://aka.ms/PasswordSprayBestPractices

Blocking Legacy Authentication in Exchange
· Disable services at the mailbox level
· https://docs.microsoft.com/enus/powershell/module/exchange/clientaccess/set-casmailbox?view=exchange-ps
· Authentication Policies
· https://docs.microsoft.com/enus/exchange/clients-and-mobile-in-exchangeonline/disable-basic-authentication-inexchange-online
· Client IP Block
· https://docs.microsoft.com/enus/powershell/module/exchange/organization/s et-organizationconfig?view=exchange-ps

Blocking Authorization in ADFS/Federation
· Authorization rules
· Very rich expressions using ADFS claims language
· Happens after authentication · Applies to ALL applications
behind Azure AD

Blocking Legacy Auth in Azure AD
· First, if you have users NOT using Legacy Auth protocols.
· Block with Conditional Access
· Requires Azure AD P1
· Baseline Policy (Public Preview) as well
· Update Clients
· Only Service Accounts / Apps should remain
· FYI, Basic Auth Support for EWS will be decommissioned by October 2020
· Ensure you have coverage for all device type scenarios (Question 7)
· https://techcommunity.microsoft.com/t5/Azure-Active-DirectoryIdentity/Azure-AD-Mailbag-Conditional-Access-Q-amp-A/ba-p/566492

What's Next? Assemble Your Team

Phase 1 Go Do Right Now Checklist
Require MFA for all cloud admin accounts. Configure PIM for all cloud admin accounts Enable "Password Hash Sync" (Azure AD Connect). Ensure all apps use Modern Authentication (ADAL) to connect to Office 365
services. Enable user and admin activity logging in Office 365
(UnifiedAuditLogIngestionEnabled). Enable mailbox activity auditing on all O365 mailboxes. Conditional Access: Block Legacy Auth (for those that are not using it today!). Integrate Azure AD Logs with your SIEM or use Azure Log Analytics or Azure
Sentinel Deploy Azure AD Banned Password for your on-prem AD Enable Azure AD Connect Health for ADFS and ADFS Smart Lockout Ensure all users are registered for MFA.

Phase 2 Go Do Soon Security Checklist
Enable self-service password reset (SSPR). Enable MFA for all users via Conditional Access or Risk Based. Disable Legacy Authentication Entirely via Conditional Access FIDO for admin accounts Follow admin account best practices for cloud admins Audit consented permissions for apps & user access to apps. Review App Permissions Monitor App registrations. Review the recommendations in Microsoft Secure Score and implement as
many as possible.

Conclusion
The Cloud Is Magic!

Conclusion
· Cloud is a new paradigm that requires special attention (& resources).
· The cloud isn't inherently secure. · Security responsibilities are shared between provider and customer. · There are many security features and controls that are available. · Security controls need to be researched, tested, and implemented. · Security in the cloud may cost extra.

Conclusion
QuestiLoikenosu?r talk?
Please Submit an Evaluation

Sean Metcalf @Pyrotek3 sean@TrimarcSecurity.com

Mark Morowczynski @markmorow Markmoro@microsoft.com

Slides: Presentations.ADSecurity.org

References
· One Misconfig (JIRA) to Leak Them All - Including NASA and Hundreds of Fortune 500 Companies
· https://medium.com/@logicbomb_1/one-misconfig-jira-to-leak-them-all-includingnasa-and-hundreds-of-fortune-500-companies-a70957ef03c7
· Golden SAML: Newly Discovered Attack Technique Forges Authentication to Cloud Apps
· https://www.cyberark.com/threat-research-blog/golden-saml-newly-discoveredattack-technique-forges-authentication-cloud-apps/
· I Am ADFS and So Can You (Troopers Conference Presentation 2019)
· https://www.troopers.de/troopers19/agenda/fpxwmn/
· ADFSpoof
· https://github.com/fireeye/ADFSpoof
· Hacking the Cloud - DEF CON 25 (July 2017) Presentation
· https://adsecurity.org/wp-content/uploads/2017/07/2017-DEFCONHackingTheCloud-SteereMetcalf-Final.pdf
· https://www.youtube.com/watch?v=LufXEPTlPak

References
· MS Mail Probe
· https://github.com/busterb/msmailprobe
· Office 365 UserEnum
· https://bitbucket.org/grimhacker/office365userenum/src
· O365 Creeper
· https://github.com/LMGsec/o365creeper
· LyncSmash
· https://github.com/nyxgeek/lyncsmash
· SprayingToolkit
· https://github.com/byt3bl33d3r/SprayingToolkit
· MailSniper
· https://github.com/dafthack/MailSniper
· Ruler
· https://github.com/sensepost/ruler/wiki/Brute-Force
· Evilginx2
· https://github.com/kgretzky/evilginx2
· HaveIBeenPwned.com · MDSec Office 365 Toolkit
· https://www.mdsec.co.uk/2019/07/introducing-the-office-365-attack-toolkit/
· FireEye PwnAuth
· https://www.fireeye.com/blog/threat-research/2018/05/shining-a-light-on-oauth-abuse-with-pwnauth.html

References
· Azure AD Baseline Policies · https://aka.ms/aadbaseline
· Azure AD Deployment Plans · https://aka.ms/deploymentplans
· Azure AD FIDO2 · http://aka.ms/fido2docs
· Azure AD App Consent Script · https://gist.github.com/psignoret/41793f8c6211d2df5051d77ca3728c09
· Azure AD Password Hash Sync · http://aka.ms/aadphs
· Wired-The Untold Story Of Notpeya, The Most Devasting Cyberattack In History · https://www.wired.com/story/notpetya-cyberattack-ukraine-russia-code-crashed-theworld/

References
· Azure AD Event Hub Integration · Splunk (docs) · Sumo Logic (docs) · IBM QRadar (docs) · ArcSight (docs) · SysLog (docs)
· Microsoft Password Guidance · https://aka.ms/passwordguidance
· NIST 800-63 Password Guidance · https://pages.nist.gov/800-63-3/sp800-63b.html
· Azure AD Banned Password for Active Directory · https://aka.ms/deploypasswordprotection
· Azure AD Banned Password Policy Scoring · https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-password-ban-bad
· FRS to DFSR Migration · http://aka.ms/dfsrmig

References
· Password Spray Best Practices · https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-password-ban-bad
· Disable Legacy Protocols at the Mailbox · https://docs.microsoft.com/en-us/powershell/module/exchange/client-access/setcasmailbox?view=exchange-ps
· Exchange Authentication Policies · https://docs.microsoft.com/en-us/exchange/clients-and-mobile-in-exchange-online/disable-basicauthentication-in-exchange-online
· Exchange Client IP Block · https://docs.microsoft.com/en-us/powershell/module/exchange/organization/setorganizationconfig?view=exchange-ps
· Azure AD Conditional Access Q&A · https://techcommunity.microsoft.com/t5/Azure-Active-Directory-Identity/Azure-AD-MailbagConditional-Access-Q-amp-A/ba-p/566492
· ADFS Smart Lockout · https://techcommunity.microsoft.com/t5/Azure-Active-Directory-Identity/Azure-AD-MailbagConditional-Access-Q-amp-A/ba-p/566492

