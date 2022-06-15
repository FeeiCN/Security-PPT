COVER YOUR SAAS
BEN JOHNSON CTO & COFOUNDER, OBSIDIAN
SANS CLOUD SUMMIT 2020

BACKGROUND CHECK // BEN JOHNSON

Co-Founder and CTO, Obsidian Security
Co-founder and former CTO of Carbon Black, built the first EDR product. Previously NSA CNO and AI Lab
1st Technical Advisor (Amicus Curiae) to US FISA Court

2000
Employment

2010

2017

Startup Boards

CLOUD IS ACCELERATING BUSINESS
SECURITY IMPERATIVE: ENABLE BUSINESS TO ADVANCE ITS
MISSION ... SAFELY! "75% OF THE CLOUD IS SAAS"
- DAVE SHACKLEFORD

AND IF YOU DON'T HAVE SAAS YET, IT'S COMING
Companies are picking a "cloud stack" of business services...the difference being these new technologies are cloud-based and designed for collaborEaMtAioILn.
WORD PROCESSOR COMMUNICATION
CONTENT MANAGEMENT INFORMATION TECHNOLOGY
SALES & MARKETING FINANCE
HUMAN RESOURCES SECURITY

CLOUDS TALK TO CLOUDS

WHO PROTECTS CLOUD? (HINT: YOU)

SAAS IS YOUR RESPONSIBILITY
The SaaS Provider handles all aspects except for identity and access management, client devices controls, and
data accountability.
The Customer (you), therefore, must understand users, devices & data related to that service.

CLOUD SECURITY NEEDS TO BE A PRIORITY

"89% of companies use SaaS" *

"...someone in your organization should do regular audits to detect potential abuse" - Salesforce

"Up to 95% of cloud breaches occur due to human errors." **

* Source: IDG

** Source: Gartner

ALWAYS ON, ALWAYS REACHABLE TARGETS USERS OVERSHARE AND AUTHORIZE APPS LACK OF EXPERTISE IN CLOUD DETECTION
OVER-ACCESS INCREASES INSIDER RISK POORLY UNDERSTOOD, DISPARATE AUDIT LOGS

CLOUD SECURITY IS THE SAME ... AND DIFFERENT
· Enable the business to advance its mission ... SAFELY.
· Protect the business but also allow for the business -- productivity, cost savings, and innovation are largely why organizations are going to SaaS/PaaS/IaaS. If you (as security) hurt these, you will not be popular.
· Review and monitor access · Review and monitor privileges · Review and monitor configurations · Review and monitor behavior
So not that different from on-premise?
Yet the networks, assets, applications might not be under any of your control.

RESPOND DETECT PROTECT

WHAT'S SECURITY'S AIM FOR CLOUD?
· Protect account access · Enable responsible use · Enable responsible collaboration · Detect misuse, compromise, and other unwanted behavior · Investigate and cleanup when there's a problem
"The absence of disease does not mean health."

INTRO TO SAAS DETECTION
· Often, the primary goal for SaaS is to keep the adversaries out. This is a smart primary goal.
· Then you likely want to understand privileged activity, and any changes to privileged users.
· From here, understanding how your information might be exposed, such as sharing files broadly or buckets created.
· Then, observing any increases to the surface area by adding third party apps and/or new user accounts.
· Finally, insider threats, especially in IP-heavy companies and industries.

DETECTION: LOGINS (O365)

Timestamps, IP-addresses, user, results; some search capabilities

DETECTION: LOGINS (GSUITE)
Some useful information but lacking a lot of context

DETECTION: LOGINS (SALESFORCE)
Providing more context than some other systems

DETECTION: LOGINS SUMMARY
· What should you care about when it comes to logins? · Admin login times, locations · Unusual login locations across user population · Spikes in failed logins for a particular user · IP or Geo targeting many users (password sprays, credential stuffing, etc)

DETECTION: ACCESS / PRIVILEGE CHANGES (O365)

DETECTION: ACCESS / PRIVILEGE CHANGES (G SUITE)

DETECTION: ACCESS / PRIVILEGE SUMMARY
· What should you care about when it comes to access / privilege changes? · New privileges granted! (New admins, additional roles, etc) · Removal of privileged access (should be rare, want to scrutinize) · Specific grants, like Mailbox delegation · If possible, correlate new accounts to a source of truth (HR system) · Keep an eye on those contractors, consultants, and service providers

DETECTION: ADMIN ACTIVITY (GSUITE)

DETECTION: ADMIN ACTIVITY (DROPBOX, BOX)

DETECTION: BROADLY SHARED FILES (GSUITE)

DETECTION: OAUTH / THIRD-PARTY APPLICATIONS

DETECTION: SHARING SUMMARY
· What should you care about when it comes to sharing and third-party apps? · Sensitive scopes/grants (i.e. full GMail access) · Sharing externally with no expiration · Sharing externally with no password or restrictions · System-level apps that grant access to all accounts · Apps granted sensitive access that are only installed by 1 user (or a few users)

WHAT DOES OBSIDIAN DO (INTERNALLY)?
· SaaS and IaaS heavy · Worry about threats and excessive risk but try to always say YES to the business · Enable auditing on SaaS applications, pull telemetry into our own product connect up to
Splunk, Snowflake, Elasticsearch, datalake, etc.) · Enable cloudtrail, similar to SaaS ^^ · IP-Geo enrichment (IPs often mean very little but countries or states DO mean something) · Send alerts to slack- GuardDuty, Marcie, Obsidian, Carbon Black, etc. · Operators see alerts in Slack and pivot to domain specific tools · We correlate either on Identity or IP · Operators don't need production access if the right data is flowing to the right place · Turn review tasks into alert tasks (get to good state and alert on drift/violation)!!!

PLAYBOOK
Some places for you to ...

MAKE ACCESS HAVE A HALF-LIFE
Stop thinking of accounts as binary.
When possible, set an end-date to FORCE review.
When not possible, force review through culture and process. "Use it or lose it."

LOCK DOWN WHAT YOU CAN
· Single Sign-On; create choke point · Create separate Admin accounts · Use built-in settings to disable forwarding, require
passwords on invites, allow maximum number of devices, conditional access, etc. · Watch out for Oauth, Linking Accounts, and API attacks

COLLECT TELEMETRY
· Activity drives access needs (and pruning) · Incident Response and compliance need
telemetry (enable audit logs!!!) · Lots of APIs out there ...
https://marketplace.zoom.us/docs/api-reference/ https://api.slack.com/ https://developers.google.com/admin-sdk/ https://developer.salesforce.com/docs/api-explorer
· And so on... (and some tools -> )

MAKE IT EASY TO DO THE RIGHT THING
Make it easy to do the right thing: 1. Give users what they need (and sometimes want) 2. Have a (low-pain) process to approve new stuff
If you're a user/engineer/individual contributor, go through the proper channels: 1. Consider Security 2. Consider Privacy 3. Consider Productivity 4. Go through process from above!

MAKE IT INTEGRATED INTO THE BUSINESS
· Make them own it, with your reviews and oversight · Enable the teams that own various applications to integrate into your
authentication mechanisms · Provide guidance on privileged access and security controls · Monitor, pen-test, etc.

CLOUD: OPPORTUNITY TO UNIFY IT & SECURITY

IT
Enablement

Security
Enablement

Provides Appropriate Tech

Provides Appropriate Risk

CONNECTED?

WHERE WILL YOU FOCUS?

SLOW ATTACKERS DOWN

ENCOURAGE GOOD CHOICES & BEHAVIOR
DISCOURAGE BAD CHOICES & BEHAVIOR

SPEED DEFENDERS UP

COVER YOUR (GROWING) SAAS

"The journey is going to end in SaaS" - CISO, major athletics company
Thank you & be well.
BEN JOHNSON | BEN@OBSIDIANSECURITY.COM | @CHICAGOBEN

