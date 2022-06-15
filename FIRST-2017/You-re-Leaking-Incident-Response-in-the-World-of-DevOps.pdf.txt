You're Leaking: Incident Response in the World of DevOps
Jerry Dixon & Levi Gundert

JERRY DIXON
@jwdixonjr

· CROWDSTRIKE Chief Information Security Officer
· AMERICAN EXPRESS Vice President, Cyber Threat Intelligence & Incident Response
· CISCO SYSTEMS Director, Incident Response
· US DEPARTMENT OF HOMELAND SECURITY Director: National Cyber Security Division

LEVI GUNDERT
@levigundert

· RECORDED FUTURE Vice President, Threat Intelligence & Strategy
· FIDELITY INVESTMENTS Vice President, Cyber Threat Intelligence
· CISCO SYSTEMS Technical Leader, Talos
· U.S. SECRET SERVICE ­ LOS ANGELES ECTF Special Agent

Incident Response Ops
· Monitoring your security infrastructure
· Billion plus events a month! · Triage · Monitoring for Data ExFil · Insider Threat (UBA) · Operationalizing Threat Intelligence
· Managing the incident queues
· Email · Incident Hotline · Ticketing system · Triage
· What's Missing?

DevOps Defined
· Blending of Development efforts and IT operations to support rapid development plus faster delivery of products or services.
· Many organizations have moved to this model in the financial sector, corporate world, and pioneered in high tech firms
· Foster greater collaboration
· Lots of risk to consider and approach to protecting your organization!

DevOps Gone Bad
· Developers demanding broad access & administrative rights
· "Silly IT or InfoSec team, we want unfettered access to the Internet"
· "Trust Us!" · "We shouldn't be bogged down
with the same restrictions as everyone else" · "I don't want to fill out an exception request." "So what if we're regulated or a public company. I'm special!"
· I own the code!

You're Leaking!
· SSH-Keys · API-Keys · Digital Certificates · Authorization Keys · PGP Private Keys · Sensitive architecture diagrams · Sensitive names of critical
applications or systems

GITHUB
Let's go Hunting! Why bother, our developers can be trusted!
Or can they?

Repo Gold Nuggets: Help your Adversary!

Repo Gold Nuggets: Help your Adversary!
· 5809 references for "auth token"
· 36,582 references for certificates using "begin certificate" and 425 references for "Begin encrypted private key"

Deployment Templates are common
· You'll find SSH-Keys · API Keys · Auth CERTS · IP addresses ­ with or without
FQDN (great for recon) · Vendor executables tailored to
customers · Service Accounts (my favorite) · VPN or AD Credentials

What are the drivers?
· Culture & age
· Information should be free & always available
· Crowdsourcing development · It's my computer! · It's my code! · I should be able to take my code with
me wherever I go. Besides, I wrote it! · Privacy means different things to
different folks

Incident Response & Detection in DevOps
· If you're not hunting public code repositories for sensitive information on a daily basis you're making it easier for your adversaries
· It's easy to get lost in monitoring your perimeter and internal infrastructure but we have to remember developers love to use public code repositories, not just for code, but architecture diagrams, and often as a backup drive to their computer (Lots of stories here)
· If you work in a locked-down environment developers will sometimes upload sensitive IP/code to Github & then download at home to work on it versus lugging their work laptop around then download again at the office. Often "Too Cheap" to purchase a private account!

Let's talk tools
· GITHUB Dorks - is quite powerful and useful feature and can be used to search sensitive data on the repositories. Collection of github dorks that can reveal sensitive personal and/or organizational information such as private keys, credentials, authentication tokens, etc. This list is supposed to be useful for assessing security and performing pen-testing of systems.
· Source: https://github.com/techgaun/gith ub-dorks

Another tool
· GITROB - a command line tool which can help organizations and security professionals find sensitive information lingering in publicly available files on GitHub. The tool will iterate over all public organization and member repositories and match filenames against a range of patterns for files that typically contain sensitive or dangerous information.
· Source: https://github.com/michenriksen/ gitrob/blob/master/README.md
· Helps with Org monitoring

Another Open Source Option
· Huginn is a system for building agents that perform automated tasks for you online. They can read the web, watch for events, and take actions on your behalf. Huginn's Agents create and consume events, propagating them along a directed graph. Think of it as a hackable version of IFTTT or Zapier on your own server.
· Source: https://github.com/huginn/hugi nn

So now we've talked tools, Now What?
· Build an IR Playbook
· Ensure your monitoring / detection is working
· Automate your hunting to drive operational efficiency
· Track metrics & incident stats to show "adult supervision" is still needed. But incorporate the DevOps team in building the guardrails

Data Leak Playbook for Public Repo's
· Identify the developer quickly. Have them take the information down if they're still with the organization.
· Monitor internal systems talking to repo's. · Have the security team for the Repo on "speed dial" to help with
take-down · Did I mention there is a researcher in Brazil that mirrors a certain
public repo. By the way, he won't take down the info.

Data Leak Playbook for Public Repo's
· Have a plan to quickly change api-keys, ssh-keys, rotate certificates, or change passwords. Exercise it in a table-top to ensure all folks are prepared.
· Did you think about your cloud environment? · Your internal infrastructure? · Application owners / Devs
· Have a containment plan ready to go. · Leverage your security tools to see who is doing sync's to repos or
manually going there.

Crisis Response
· Have that escalation plan ready to go if you have a data leak. Especially if you can't get the data down.
· By the way, did I mention you should also be monitoring social media? You need to quickly determine if there is chatter about your exposure of sensitive information.
· Have a communications plan in place for inside the organization, media, regulators, or your customers depending on the situation.
· Stand up that War Room and ensure your crisis response team is engaged (corp comms, legal, IT, Privacy, Global Security, etc)

Questions?

