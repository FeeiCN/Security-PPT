Sigma for Cloud With MITRE ATT&CKTM?
by Andrii Bezverkhyi, SOC Prime

>_ whoami
Infosec since 2007 SOC Prime, Inc. since 2014 uncoder.io https://github.com/socprime/SigmaUI tdm.socprime.com

Problems with cloud security monitoring
1. Cloud Logs are Veeeeery Reactive 2. MITRE ATT&CK is Retrospective Proactive for Cloud 3. In 2019 we mostly talk hunt on Sysmon

Cloud Logs are not real time

It can take up to 30 minutes or up to 24 hours after an event occurs for the corresponding audit log entry to be displayed in the search results. The following table shows the time it takes for the different services in Office 365.
https://docs.microsoft.com/en-us/microsoft-365/compliance/searchthe-audit-log-in-security-and-compliance

https://support.google.com/a/answer/7061566?hl=en

ATT&CK for Cloud Suggestions not from CTI

Technique: Calendar Event Injection Tactic: Initial Access There is a possibility for an attacker to create an important event in the Calendar (social engineering) and send invitation to target. The message may contain a phishing link or a malware link. Ref: https://usa.kaspersky.com/blog/spam-through-google-services/17799/
Technique: Publicly Shared Calendar Tactic: Exfiltration There is a possibility to `create an event' when replying to email from O365, Outlook or GSUITE. Such reply can leak up to 8000 bytes of email data. Text in reply is not logged. By using T1074/Data Staged attacker can prepare any number of events and exfiltrate them all by sharing Calendar Link or making it public. Remember delay of 24+ hours. Ref: soon at SOC Prime blog
TLP:GREEN, COPYRIGHT: SOC Prime, Inc. SUBMISSION TO MITRE ATT&CK: IN PROGRESS

Technique: Publicly Shared Calendar Tactic: Exfiltration
There is a possibility to `create an event' when replying to email from O365, Outlook or GSUITE. Such reply can leak up to 8000 bytes of email data. Text in reply is not logged. By using T1074/Data Staged attacker can prepare any number of events and exfiltrate them all by sharing Calendar Link or making it public. Remember delay of 24+ hours.

ID: T1537

Transfer Data to Cloud Account

Tactic: Exfiltration Platform: Azure, AWS, GCP Permissions Required: User Data Sources: Stackdriver logs, Azure

An adversary may exfiltrate data by transferring the data, including backups of cloud environments, to another cloud account they control on the same service

activity logs, AWS CloudTrail logs, O365 to avoid typical file transfers/downloads

Logs, GSUITE logs

and network-based exfiltration detection.

Requires Network: Yes

Contributors: Praetorian, SOC PRIME ? J

Version: 1.0

TLP:GREEN, COPYRIGHT: SOC Prime, Inc. SUBMISSION TO MITRE ATT&CK: IN PROGRESS

Sigma for Cloud MFA Bypass

action: global

level: medium

title: Multi-factor authenticationtags:

(2-step verification) disabled. - GDPR Art 32.1
- GDPR Art 32.2

description: Require multi-factor - CSC16

authentication for all user accounts, - CSC16.3

on all systems, whether managed - ISO 27002-2013 A.9.1.1

onsite or by a third-party provider. - NIST CSF 1.1 PR.AC-1

The presence of an event leads to a - PCI DSS 3.2 7.1

mismatch with control.

- attack.T1089

Recommended one day event

- attack.defense_evasion

search period. Sigma covers G Suite, - Attack.T1078

AWS Console, Slack log sources. - Attack.initial_access

---

references:
- https://www.cisecurity.org/controls/cis-controls-list/ - https://www.pcisecuritystandards.org/documents/PCI_DSS_v3-2-1.pdf - https://nvlpubs.nist.gov/nistpubs/CSWP/NIST.CSWP.04162018.pdf - https://gdpr-info.eu/art-32-gdpr/ - https://developers.google.com/adminsdk/reports/v1/appendix/activity/user-accounts
https://docs.aws.amazon.com/awscloudtrail/latest/userg uide/cloudtrail-event-reference-aws-console-sign-inevents.html - https://api.slack.com/docs/audit-logs-api
author: Alexandr Yampolskyi
status: stable modified: 2019/08/15 detection: condition: selection falsepositives: - unknown

logsource: product: G Suite detection: selection: events.name: 2sv_disable --logsource: product: AWS Console detection: selection:
additionalEventData.MFAUsed: "No" --logsource: product: Slack detection: selection:
event.name: pref.two_factor_auth_changed
Details: "")

X MITRE ATT&CK Sigma Community Marketplace

Threat Bounty

88 threat bounty hunters signed up since May 2019, some are on list
Source: leaderboards, threat detection marketplace

Unique detections per month
Source: leaderboards, threat detection marketplace

216 techniques coverage 811 sigma rules 33232 translations and native rules
Source: leaderboards, threat detection marketplace

Periodic Table Of Cyber Elements

Technique ID

Tactic
Adversary's tactical objective: the reason for performing an action.

Examples count
Number of the known Procedures, the exact ways an adversary or software implements a technique.

Author
Rules count
Rules used for threat hunting, detection and testing of specific technique. Incudes Sigma, Yara, Snort, SIEM rules & Attack simulation tests.

Technique
Techniques represent "how" an adversary achieves a tactical objective by performing an action.
Last update Date
ATT&CK knowledge base: attack.mitre.org

Coverage May 2019 (EU ATT&CK COMMUNITY BRUSSELS)
Thank you!

Coverage OCT 2019 (EU ATT&CK COMMUNITY HACK.LU)

Threat Bounty needs You!
my.socprime.com/en/tdm-developers

https://uncoder.io

https://github.com/socprime/SigmaUI

