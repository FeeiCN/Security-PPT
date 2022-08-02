PROTECT YOUR PEOPLE

The Tessian Human

1

Layer Security

Platform Architecture

A Technical Deep Dive into Tessian's Email Security Solution

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

2 THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Table of Contents

004 Executive Summary

3

005 Architecture Vision and Goals

007 Tessian Human Layer Security Platform

012 Machine Learning at Tessian

014 Metadata Overview

015

Inbound Email Security: Defender

017

Outbound Email Security: Guardian

019

Outbound Email Security: Enforcer

021

Threat Intelligence: Tessian Human Layer Security Intelligence

023

Insider Risk Management: Tessian Human Layer Risk Hub

025 Integrations and Deployment

029 Infrastructure and Platform Security

031 Company Security, Certifications and Integrations

A TechJnuilcya2l 0D2e1ep Dive into Tessian's Email Security SoluTtiHonE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Executive Summary

For several years now, IT and security teams have experienced the erosion of

4

perimeter security first hand, and it's important to recognize that this is a sign of a

more fundamental challenge. If we don't properly address these underlying issues,

an organization can run the risk of building new, costly perimeters, or layering more

protection onto the endpoints, only to face the same problems as the old solutions

have given us.

Email is an open gateway to your enterprise. It's the most commonly used channel for data exfiltration, fraud, and targeted attacks such as impersonation and account takeover. It's the major point of egress for sensitive data. The root cause of these threats is almost always human error. Employees break the rules, make mistakes and can easily be tricked or hacked. This can be simply carelessness and negligence, or it can be malicious. In any case, to prevent today's email threats, your security controls must understand human behavior. This is often the missing link in today's data loss prevention and data security solutions.

CONSIDER THE STATISTICS...
95%
Of cybersecurity breaches are caused by human error. (Cybint)

94%
Of malware is delivered by email. (CSO Online)

48%
Of malicious email attachments are office files. (Symantec)

80%
Of reported security incidents are phishing attacks. (CSO Online)

$17,700
Is lost every minute due to a phishing attacks. (CSO Online)

20%
Of malicious domains are used around one week after they are registered. (Cisco)

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

As you read this paper, we invite you to evaluate your current solutions:

5

How often do you have to update your DLP policies?

How are you preventing advanced phishing, account takeover or ransomware attacks?

How much visibility do you have into individual users' email behavior and insider risk?

How do you balance email security with the productivity and workflow of users?

Here at Tessian, we already see many enterprises shift to next-generation solutions to future-proof their DLP strategies, and replace cumbersome and complex legacy tools with a fundamentally more intelligent way to prevent data loss. Legacy DLP tools are becoming a strategic risk to enterprises as they migrate to the Cloud and M365, and because of that, many organizations are reassessing their DLP strategy.
In this whitepaper, we give a brief overview of Tessian's Human Layer Security Platform, including each module, as well as architecture diagrams to explain the mail flows of both inbound and outbound email security.
The information provided is written for security professionals, from CISOs to solutions architects who seek to better understand the required capabilities for comprehensive inbound and outbound email security in a post-perimeter architecture.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Architecture Vision and Goals

At Tessian, our mission is to secure the human layer by empowering

6

people to do their best work, without security getting in their way.

This mission is translated into the following set of architecture goals:

UNIFIED PLATFORM ENTERPRISE GRADE
HIGH AVAILABILITY AND SCALABILITY
INTEGRATIONS COMPLIANCE DEPLOYMENT BEST-IN-CLASS CUSTOMER SUCCESS

Inbound and outbound email security, security awareness training, and risk analytics all in one platform. Learn More 
Tessian is built for large-scale implementation, with the foresight and the technological expertise for proper implementation. Learn More 
Easily manage the influx of demand, increased productivity, trends, and changing needs. The Gateway is based on an SMTP engine that's designed to easily handle multiple inbound and outbound connections at scale. This is coupled with processing engines that extract the email metadata used to call Tessian's API to determine whether any action needs to be taken on the email. Servers are hosted on Amazon Web Services (AWS) on a highly secure account that's separate from our main platform; this is to isolate access and fully lock down this environment on its own VPC. Learn More 
Extensive integration capabilities help your security team achieve increased visibility and extended protection, giving your organization the maximum return on investment. Learn More 
Demonstrate that the organization's cybersecurity efforts are in line with generally accepted proven practices and standards. Learn More 
Tessian deploys within minutes, learns within hours and starts protecting in a day. Learn More 
Trusted by world-leading organizations to protect their most sensitive data. Tessian has the cybersecurity industry's best customer retention rate, with nearly 100% of customers renewing and expanding their Tessian platform deployments. Learn More 

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Tessian Human Layer Security (HLS) Platform

Platform Overview

7

To prevent today's email threats, security controls must understand human behavior, and security and IT teams must have clear visibility into their human layer threats.

The HLS platform is composed of three product modules that cover the spectrum of inbound email security, such as impersonation and phishing attacks, through outbound data loss such as misdirected emails and misattached files. The HLS platform also includes HLS Intelligence, the threat visibility arm of the platform, as well as the Human Layer Risk Hub, which aggregates all data from the platform to help security and risk management leaders make informed decisions about their email security posture.

Providing comprehensive visibility into your human layer risks.

Automatically detecting and preventing threats like accidental data loss, data exfiltration, and advanced phishing attacks (that legacy solutions can't detect).

And more importantly, we change behavior: we continuously drive your employees toward secure email behavior through contextual, in-the-moment training.

Tessian Human Layer Security Platform Modules

PEOPLE MAKE MISTAKES
PEOPLE BREAK THE RULES
PEOPLE CAN BE TRICKED

Accidental Data Loss
Prevent misdirected emails and misattached files.
Data Exfiltration
Prevent unauthorized emails.

OUTBOUND DATA LOSS

Insights, Investigation
and Remediation
Intelligence to investigate, remediate, and reduce human layer risks.

Prevent non-compliance and data loss using custom policies.
Impersonation Attacks
Prevent spear phishing, BEC, and other impersonation attacks.

INBOUND EMAIL SECURITY

Risk Management
and Reporting
Rapid threat investigation and proactive risk mitigation.

All of these together continually reduce security threats at the human layer and strengthen your organization's security posture. This is all done with no disruptions to your employees' productivity.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Platform Differentiators

8

Holistic View of Human Behavior.
Tessian maps employee email activity and builds unique security identities for every individual. Tessian dashboards and analytics surface these insights and give full visibility into threats you've never been able to detect before. Now you can predict and preempt security risks caused by unsafe human behavior.

CHANGE BEHAVIOR

PREVENT EDUCATE
REMEDIATE

No Historical Relationship New Salutation for "Kevin"
Document Misattached

Project Tornado Documents

Sensitive Project Title

John Durant
<john.durant@company.com>

Kevin Smith <kevin.smith@external.com>

Automated Threat Prevention and RemediatPiorojenct.Tornado

Hi Kevin,

I have attached all the financials for Project Tornado. Contextual machine learning (ML)

Price is still in negociation, so please keep this confidential.

Regards,

understandsKheyuwomrd a"Cnonfbideenhtiaal"vior on email,

John
can predict normal and abnormal email

LEGAL-ACQUISITION.DOC

activity, and can start preventing the

most advanced threats within 24 hours

of deployment. No pre-configuration

required.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

9

Make People Your Strongest Defense.
Tessian warnings act as in-the-moment training for employees, continuously educating them about threats, reinforcing your policies, and nudging them toward safe behavior. Take the right educational interventions and targeted remedial actions at scale.

Take care, there is something unusual about this email.
Report as Malicious and Delete Mark as Safe
Tessian has flagged this email because the sender could be trying to impersonate another company. The sender's email domain "@xyzsupplies-invoices.com" is similar to "@xyzsupplies.com", a domain that your company has an existing email relationship with.
Urgent: Unpaid Invoice
SK Sandra Kim <sandra.kim@xyzsupplies-invoices.com>
Hi, The attached invoice is unpaid from last month. Please transfer funds asap. Thanks, Sandra XYZ Suppliers

Effortless and Non-Disruptive.
Easy to deploy, to manage, and to integrate with any email environment and enterprise security applications. You can set it and forget it, or partner with Tessian's dedicated team of security experts to optimize for your environment. Tessian is invisible to employees until they need it.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Platform Key Features and Benefits

10

Threat Prevention
BEHAVIORAL INTELLIGENCE
Tessian's behavioral intelligence leverages at least 12 months of historical data that includes the company's emails, company network, as well as Tessian's Global Threat Network, to detect all indicators of inbound and outbound email attacks.

PREVENT INBOUND EMAIL ATTACKS NOT DETECTED BY SECURE EMAIL GATEWAYS
Legacy approaches will scan for known malicious payloads such as links and attachments. This leaves these defenses vulnerable to zero-day threats, or attacks without payloads. Tessian will inspect the context of the email to determine indicators of an attack, notify the user, therefore not giving an opportunity of malware slipping through or the user to click. This moves Tessian up the kill chain to stop attacks.

CONTEXT-AWARE EMAIL SECURITY
Tessian uses natural language processing (NLP) algorithms to perform a content x-ray that detects indicators of attack such as malicious intent, impersonation, compromise, and payloads, resulting in more accurate security decisions. This, in turn, provides an alert that the end user will understand, helping them make the right decision. The Platform modules help you take proportional actions based on the risk level of the threat, warning users appropriately based on the severity of the risk.

Education and Awareness
IN-THE-MOMENT TRAINING
Non-disruptive in-the-moment training and awareness is provided to employees through contextualized, easy to understand warning messages.

RISK TRENDS DOWNWARD
Risk will quickly trend downward as users learn more about security through in-themoment warnings, becoming better at spotting attacks and lowering click-through rates on identified threats.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

11
Effective Data Loss Prevention
PREVENT DATA EXFILTRATION NOT DETECTED BY LEGACY DLP
Prevent accidental data breaches due to misdirected emails and missattached files prevention that is impossible with legacy DLP controls.
THREAT VISIBILITY AND ANALYTICS
Meet GDPR, CCPA, and other mandatory data protection regulatory requirements. Safeguard your intellectual property, comply with customer confidentiality agreements and eliminate the risk of reputational damage.
CONTEXT-AWARE EMAIL SECURITY
Get granular visibility into high risk data exfiltration events, trends, and threat actors for instant remediation.
Reduce Admin Overhead
RISK-BASED APPROACH
Tessian emphasizes risk-based protection, not a binary approach to classifying threats, which significantly reduces the burden on security ops teams. In-the-moment warnings take further burdens off the SOC to release to the inbox.
NO MORE TIME-CONSUMING, RIGID POLICIES
There is no need for admin teams to maintain a complex set of rules or establish pre-defined policies or configurations.
FLEXIBLE DEPLOYMENT AND SEAMLESS INTEGRATIONS
Flexible deployment options and seamless integrations with existing email security controls and legacy Secure Email Gateways (SEG), add-ins, and G-Suite and API/O365 API. Tessian's Human Layer Security Platform deploys in minutes and automatically prevents data breaches through email within 24 hours of deployment, across all devices, desktop and mobile. See all Tessian integrations 
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Machine Learning at Tessian

Technology Overview

12

Traditional machine learning methods that are used to detect threats at the machine layer aren't equipped to account for the complexities of human relationships and behaviors across businesses over time. There is no concept of "state" -- the additional variable that makes human-layer security problems so complex. This is why "stateful machine learning" models are critical to security stacks.

The People Problem
The problem is that people make mistakes, break the rules, and are easily hacked. When faced with overwhelming workloads, constant distractions, and schedules that have us running from meeting to meeting, we rarely have cybersecurity top of mind. And things we were taught in cybersecurity training go out the window in moments of stress. But one mistake could result in someone sharing sensitive data with the wrong person or falling victim to a phishing attack.
Securing the human layer is particularly challenging because no two humans are the same. We all communicate differently -- and with natural language, not static machine protocols. What's more, our relationships and behaviors change over time. We make new connections or take on projects. These complexities make solving human layer security problems substantially more difficult than addressing those at the machine layer -- we simply cannot codify human behavior with "if-this-then-that" logic.
The Time Factor
Tessian's machine learning algorithms analyze historical email data and build a unique security identity for every employee based on relationships and communication patterns. The best part is: these ML models get smarter and better over time as more data is ingested. This helps the technology establish what normal (and abnormal) looks like and allows Tessian to automatically predict and prevent security breaches on email across devices.

All analysis happens silently in the background and employees won't know it's there until they need it. Tessian stops threats, not business. And not flow.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Heuristic Models Machine Learning Models

Machine Intelligence Framework
Tessian uses a blend of machine learning and heuristic models to automatically determine if emails contain security threats based on the Tessian Data Layer, Content X-Ray and Behavioural Analytics insights.
13

Tessian Data Layer
Analyzing past and real-time email data, Tessian has a historical view on all email communications and relationships. For example, we can determine in real-time if the wrong recipient has been included on an outbound email; if a sensitive attachment is being sent to a personal, non-business email account; if an inbound email with a legitimatelooking domain is a spoof.

Samantha Walsh
ACME COMPANY IP 1.160.10.240

John Durant
XYZ SUPPLIERS IP 1.172.16.254

SENT VOLUME RECEIVED VOLUME RECIPROCITY RELATIONSHIP AGE TOPICS SALUTATION

Unknown Subdomain Possible Impersonation
Payment Request
Invoice Attached

Content X-Ray Urgent: Unpaid Invoice

Urgency in Subject

Samantha Walsh For every inbound and outbound email, our ML algorithms analyze
<samantha.walsh@xyzsupplies-invoices.com>
millions of data points, including:

Hi,

Using natural language processKeiynwgordt"oUnapanida" lyze historical email data, Tessian

The attached invoice is unpaid from last month.
Please transfer funds asap. understands how people normally communicate on email and what

Thanks,
Samantha Walsh XYZ Suppliers

topics they normally discuss. That way, our solutions can automatically detect anomalies in subject matter (i.e. project names) or sentiment (i.e.
External Supplier

INVOICE_BAT_89632.PDF

urgency), which might indicate a threat.

Take care, there is something unusual about this email.
Report as Malicious and Delete Mark as Safe
Tessian has flagged this email because the sender could be trying to impersonate another company. The sender's email domain "@xyzsupplies-invoices.com" is similar to "@xyzsupplies.com", a domain that your company has an existing email relationship with.
Urgent: Unpaid Invoice
SK Sandra Kim <sandra.kim@xyzsupplies-invoices.com>
Hi, The attached invoice is unpaid from last month. Please transfer funds asap. Thanks, Sandra XYZ Suppliers
TESSIAN DEFENDER

Project Tornado Documents
John Durant
<john.durant@company.com>
Tessian has flagged this email because it incluKdevien Ssmiathn<keovinm.smaithl@ocuomsparnye.ccomi>pient(s).
Unauthorized email accounts include: "kevin.smith@external.com" Would you still like to send this email?
Hi Kevin, I have attached all the financials for Project Tornado. Price is still in negociation, so please keep this confidential. Regards, John
LEGAL-ACQUISITION.DOC
TESSIAN GUARDIAN

Fw: Project Diamond Summary
Alice Foster
<alice.foster@lawfirm.com>
TessianAliche Faossterb<floostecrfakmeilyd@altichebilosg.ceomm> ail because it includes unauthorized recipient(s).
This is nBoetgpinerFmoritwteadrdbeydyEomuraiol Brgealonwiza: tion. _______________________________________ From: Marissa Smith <marissa.smith@lawfirm.com Date: 31 March 2019 at 11:39:21 BST To: Alice Foster <alice.foster@lawfirm.com> Subject: Project Diamond Summary
DIAMOND-SUMMARY-26-05.PDF
TESSIAN ENFORCER

In-the-Moment Training and Awareness
For both inbound and outbound email security, non-disruptive in-the-moment training and awareness is provided to employees through contextualized, easy to understand warning messages. An added benefit is that risk trends downward as users learn more about security through in-the-moment warnings, becoming better at spotting attacks and lowering click-through rates on identified threats and less sensitive data leaving your organization through misdirected emails and misattached files.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Metadata Overview

Tessian uses stateful machine learning to analyze historical and real-time email data

14

in order to understand users' behavior over email and identify when unusual behavior

is occurring.

As well as allowing for the prevention of these threats, the metadata is also analyzed in order to provide insights into breaches prevented, enhance the protection of the services and to analyze global threat trends.

TESSIAN PULLS METADATA INCLUDING:
Email Header Email Addresses Names Opening Salutations and Complimentary Closes Attachment Information* Project Names and Identifiers Email Recall Indicator Links Phrases indicating malicious intent Attachment indicator Common file extensions Phrases indicating the contents of attached files Attachment recall indicator Aggregate data
* Attachment content is analyzed, but not stored.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Inbound Email Security: Tessian Defender

Prevent Inbound Email Attacks that Bypass

15

Legacy Email Security Solutions.

How are you preventing advanced phishing, account takeover or ransomware attacks?

Email is typically the first to deliver initial URLs, in the form of an exploit kit or phishing website, attachments in the form of payloads, or a starting point for social engineering attacks, such as in the case of business email compromise or credential phishing attacks.
Tessian Defender is a comprehensive inbound email security solution that automatically prevents a wide range of attacks that bypass Secure Email Gateways, while providing in-the-moment training to drive employees toward secure email behavior.
Inbound Email Flow
In an inbound email flow, email arrives to the email client (exchange, 365, or G-suite) after completing any filtering by external gateways. Since the recipient is part of the security group, the email is routed by the Tessian inbound configuration and Journal Rule. Next, the Tessian inbound configuration (created by the Tessian script) sends a copy of the email to the Tessian Check Server (part of the Tessian Gateway).

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Product Differentiators

16

DEEP INSPECTION OF EMAIL CONTENT
Identify inbound email threats in real-time.
Defender protects against both known and unknown email attacks, including Business Email Compromise (BEC), Account Takeover (ATO), spear phishing, and all impersonation attacks that bypass Secure Email Gateways, Microsoft O365, and G-Suite.

Unknown Subdomain Possible Impersonation Payment Request
Invoice Attached

Urgent: Unpaid Invoice
SK Sandra Kim <sandra.kim@xyzsupplies-invoices.com>
Hi, The attached invoice is unpaid from last month. Please transfer funds asap. Thanks, Sandra XYZ Suppliers
INVOICE_BAT_89632.PDF

Urgency in Subject Account Takeover Detected
BEC Suspected External Supplier

Take care, there is something unusual about this email.
Report as Malicious and Delete Mark as Safe
Tessian has flagged this email because the sender could be trying to impersonate another company. The sender's email domain "@xyzsupplies-invoices.com" is similar to "@xyzsupplies.com", a domain that your company has an existing email relationship with.
Urgent: Unpaid Invoice
SK Sandra Kim <sandra.kim@xyzsupplies-invoices.com>
Hi, The attached invoice is unpaid from last month. Please transfer funds asap.
MITIGATThaEnksA, ND REMEDIATE Sandra
GranXuYZlSauprplievrsisibility to quickly prevent, mitigate and remediate inbound email attacks.
Defender removes the burden on the SOC and admins by automating repetitive tasks such as maintaining triage and review. This eliminates the need for human verification of email threats, reducing FTE requirements.

CONTINUOUS SECURITY AWARENESS TRAINING
In-the-moment training to stop email attacks where they start.
With Defender's in-the-moment training, organizations can educate and empower users to build continuous email security awareness.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Outbound Email Security: Tessian Enforcer

Automatically prevent sensitive data

17

exfiltration over email.

How do you ensure that employees do not send sensitive information to unauthorized or to their personal email accounts?
Whether it's an employee negligently sending emails to insecure personal email accounts to work on at home or a disgruntled employee maliciously stealing company intellectual property for personal gain while exiting the company, data exfiltration is a major problem in today's business environment.
Traditional approaches to prevent data exfiltration on email rely on manual data classification, a litany of pre-defined rules blacklists and retrospective incident investigation. Tackling the problem of data exfiltration by manually maintaining blacklists in a world of innumerable new freemail and personal domains is a losing game. Relying on machine based RegEx classification for sensitive content detection or human-in-the-loop quarantine leads to false positives, false negatives and significant administrative burden.
Tessian Enforcer analyzes millions of data points for every outbound email and detects anomalies that indicate data exfiltration before it leaves your organization. Enforcer's notification messages can be customized to reinforce security awareness and data protection policies through in-the-moment training.
Product Differentiators

IDENTIFY MALICIOUS ACTIVITY
See Threat Overviews for Data Exfiltration
Detailed overviews allow you to drill down into data exfiltration attempts, including unauthorized email attempts and unauthorized emails prevented. Email summaries show progress over time to report to executives and board members on risk reduction.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

18

Tessian has detected that this email is being sent to an unauthorized email account.
billy@andreson-blog.com
Would you still like to send the email? Please explain why you are sending this email:

CONTINUOUS SECURITY AWARENESS TRAINING
Automatically Detect and Prevent Data Exfiltration.
Real-time warnings are shown to employees when data exfiltration threats are detected. Warning triggers can be tailored to suit your company's security policies and workflow requirements; employees can be warned, emails can be blocked, or activity can be silently tracked. Employee interactions are also logged for inspection in the Tessian dashboard.

MITIGATE AND REMEDIATE
See Anomalous User Activity.
Enforcer takes granular visibility even further with the ability to deeply inspect anomalous activity. Anomalous User Activity allows you to easily spot patterns in Enforcer data that might be cases of severe data exfiltration. It does this by automatically identifying users with a high number of sensitive data exfiltration attempts compared to their normal behavior. This feature allows customers to quickly spot new anomalies, understand what happened in a particular event and triage emails that an individual user has sent during a particular period of time.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Outbound Email Security: Tessian Guardian

Automatically prevent accidental data loss caused by

19

misdirected emails and misattached files on email.

Do you have visibility into accidental data loss?

Misdirected emails are the number one data security incident reported to data protection regulators across the world. Every day, inadvertent human error on email leads to organizations putting their customer's data at risk, breaching mandatory industry and data protection regulation and losing mission critical intellectual property.
Tessian Guardian is the industry's first solution that automatically prevents accidental data loss from misdirected emails. Guardian analyzes millions of data points for every outbound email and detects anomalies that indicate whether the email is being sent to the wrong person before it leaves your organization.
Outbound Email Flow
In an outbound email flow with Gateway, emails are sent from the user inbox (Outlook, Mobile, OWA) to the Mail Client (365, G-Suite, Exchange). As the user is part of the Security group, the Tessian rules are applied. Tessian outbound rules (created by Tessian script) sends a copy of the email to the Tessian Check Service, which is part of the Tessian Gateway.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Product Differentiators

20

No Historical Relationship New Salutation for "Kevin"
Document Misattached

Project Tornado Documents
John Durant
<john.durant@company.com>
Kevin Smith <kevin.smith@external.com>
Hi Kevin, I have attached all the financials for Project Tornado. Price is still in negociation, so please keep this confidential. Regards, John
LEGAL-ACQUISITION.DOC

Sensitive Project Title
Project Tornado Keyword "Confidential"

Tessian's Human Layer Security Engine analyzes all outbound email in real-time and uses machine intelligence to automatically predict accidental data loss on email based on insights from the relationship graph, external data sources, deep inspection of the email content, and previous user behavior.
RECIPIENT ANALYSIS
Do any of the recipients look anomalous based on historical send/receive patterns and behavior?
CONTENT ANALYSIS
Does any of the email content look anomalous based on historical send/receive patterns and behavior?
ATTACHMENT ANALYSIS
How do the attachments correlate with the recipients included on this email?
SALUTATION ANALYSIS
Who is the email addressed to and how does this correlate with the recipients on this email?
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Threat Visibility and Intelligence: Tessian Human Layer Security Intelligence
21
Lower risks posed by employees' poor security decisions on email.
Built into Tessian's Human Layer Security Platform, Tessian HLS Intelligence offers insights and automated intelligence that enable rapid investigation of security events detected and prevented by the Tessian Human Layer Security Platform. Security and IT teams can use the remediation tools built within HLS Intelligence to ultimately lower their organization's risks in specific threat categories - accidental data loss, data exfiltration, and impersonation attacks.
Threat intelligence has traditionally been associated with external malicious actors -- an "outside-in" perspective identifying external adversaries, relying only on external data feeds. However, people within the organization pose just as much of a risk to data and systems, either by acting maliciously or as a result of simple human error. But security teams lack visibility into their internal human layer risks and drivers that exacerbate these risks. HLS Intelligence allows security and IT teams to now have full visibility and insight into internal actors and the risks specific to their organization.
With Tessian HLS Intelligence, security teams can now readily view curated security events with detailed threat breakdown, make informed prioritization decisions, and respond to threats faster while benchmarking risks against industry peers.
Product Differentiators
THREAT INSIGHTS
Threat insights on risk drivers with benchmarking against industry peers:
Easily view and quantify threats your organization faces, compare trends, and make informed prioritization decisions.
Benchmark your risk levels against industry peers and take necessary corrective actions to lower your risks in specific threat categories.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

22
THREAT INVESTIGATION
Automated threat intelligence for rapid investigation and response:
Reduce manual incident investigation time with detailed event data with complete threat breakdown and curated security event prioritization lists. Automatically unearth larger hidden threats behind disparate security events and eliminate security blind spots. Use Tessian API integrations to centralize and triage events in your preferred SIEM/ SOAR platforms.
THREAT REMEDIATION
Robust threat remediation tools that continuously improves your risk profile:
Quarantine or clawback unsafe emails from users' inboxes and remediate similar threats at scale with a single click. Future proof defenses by automatically blocking deny-listed domains on the Tessian ecosystem or adding to deny-lists with a single click. No rules required.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Insider Risk Management: Tessian Human Layer Risk Hub
23
Deeply understand your organization's email security posture with granular visibility and reporting.
Tessian's Human Layer Risk Hub is the risk management center of the HLS Platform. HLS Risk Hub enables security and risk management leaders to deeply understand their organization's email security posture by providing granular visibility and reporting into individual user risk levels and drivers.
What makes Risk Hub particularly unique and valuable is that it's taking all the data from the Tessian platform modules, as well as HLS Intelligence, and producing reports based on that actionable information, at a granular, per-individual level. You're then able to measure how actions impact human layer risk and present results to company executives and board members, as evidence of technology reducing risk, not simply reporting it. For more detailed information, please visit the Risk Hub product page of our website, and download the Risk Hub Datasheet.
Product Differentiators
UNIFIED PLATFORM
Platform Approach
The Human Layer Risk Hub offers protection, training, and risk analytics all in one platform. It delivers a broad spectrum of risk analytics across outbound and inbound email threats and hard to solve problems such as accidental data loss, data exfiltration and advanced phishing attacks, with laser focus on the human layer. Learn more about Tessian's technology 
SUPERIOR RISK ANALYTICS
Unique Risk Insights
Enriched individual risk profiles that are modeled with a broad range of signals from email usage patterns, relationship graphs, security decisions in real time as well as from 12 months of historical emails. Because of this unique data modeling, Tessian provides a profile that is contextually rich from day 1 of deployment.
DEFEND AGAINST DATA BREACHES
Defensible Audit
Detailed reporting and audit logs provide defensible proof against data breaches. If risk is identified, Tessian's Human Layer Risk Hub enables you to formally document all associated events such as exposure, owner, mitigation decisions and actions.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

How the Human Layer Risk Hub Improves Your Security Posture

HUMAN LAYER RISK HUB
The Behavior Intelligence Model
It all begins with Tessian's Behavior Intelligence Model (BIM). Tessian analyzes a broad range of signals from historical and real-time email data, uses identity data from MS directory for contextual insights, and builds a Behavior Intelligence Model - a complete picture of each individual risk profile across five key risk drivers and generates a risk score.

PREVENT

24

CHANGE BEHAVIOR

EDUCATE

REMEDIATE

SUPERIOR RISK ANALYTICS
Dynamic Risk Scoring
The BIM and the security risk scores are dynamically updated to represent an accurate individual risk profile in real time. The risk scores trend down when the user makes positive security decisions and trend up when poor security decisions are made, or if the user exhibits high-risk email security behavior. These scores and risk drivers are also aggregated at the user, department, and company level and are benchmarked against the Tessian network.
TESSIAN RECOMMENDED ACTIONS
Targeted Remediation
Our Human Layer Risk Hub's targeted remediation is a structured approach to identifying and mitigating email security threats. The Risk Hub enables you to:  Quickly view risk areas and drivers - high
risk users, high risk user groups  Easily prioritize mitigation actions  Make informed decision and take right interventions
with intelligent mitigation action recommendations
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Integrations and Deployment

API Integrations

25

API Integrations allow Tessian to establish a connection with a client's environment (and vice versa) by using an API. This allows us to not only perform rapid historical onboarding of user mailboxes but also provide more value to customers through API-specific features.
There are four main integrations supported:
 Microsoft O365 and Google Workspace - Tessian connects with a client's O365 and Google Workspace environments
 Tessian API - A client can connect and pull Tessian data feeds into another platform (e.g. SIEM)  API Defender Actions  API for Human Layer Risk Hub Data Feeds

Tessian O365 and G Suite Integrations
The Tessian integrations for O365 and G Suite allows Tessian to connect to part of your O365 or G Suite domain that you give it access to. This allows Tessian to analyze your users' mailboxes and detect the spear phishing emails they received that weren't blocked by your existing email security, or to detect past data exfiltration attempts.

Once you've specified which of your users' mailboxes you wish Tessian to analyze, the Tessian integrations will upload copies of emails that the specified users sent and received in the past 12 months, to Tessian's servers. There, metadata required for analysis is extracted from the emails. This metadata includes email headers, URLs, phrases indicating malicious intent, and attachment names. Tessian saves this metadata and never stores exact copies of the full email. Tessian's algorithms then analyze the extracted email metadata to produce a threat report.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Tessian API for SIEM and SOAR (HLS Intelligence)

26

The Tessian API gives authorized customers access to Tessian data directly, and can be integrated with SIEMs and other data tools. The Tessian API provides detailed information about the emails that triggered active filters across all purchased modules of Tessian's Human Layer Security Platform.
This includes but is not limited to data such as:
 Email sent/received time and date  The name of the triggered filter  The email sender and intended recipients  Whether a Tessian warning was shown to the end-user  The end user's response and subsequent action on seeing the warning

From here, you can access Tessian's developer documentation and an example script that you can use to call the API, and also create a token that will be used to authorize their API calls to receive their data.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

API Human Layer Risk Hub Data Feeds

27

The Human Layer Risk Hub provides risk scores for users calculated based on a number of factors related to the various Tessian modules.
The API integration can provide a richer experience for clients using the HLS Risk Hub by enabling the below additional features:

Group HLS Risk Scores
Clients can sync their Directory Groups to see a consolidated group level view of the risk scores based on the users within. This can be useful for getting a high level view of where risk might be present across the organization.

Enhanced User Profile
Clients can further enhance their HLS Risk Hub experience by enabling "Additional Data" in the Directory Sync API Integration. This will pull useful data on users such as role, department, manager and office location which can help provide more context when evaluating their risk scores. User profile pictures will also be pulled on demand with this option enabled.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

API Defender Actions
Customers can configure the O365 or Google Workspace API Integrations to unlock a variety of additional Defender functionality in the portal:
28
Viewing plaintext email bodies in the Defender event viewers:
When an admin opens a HLSI event view, Tessian connects to the user's mailbox and looks for the body of the email that Defender flagged and displays it in the portal. As soon as the admin closes the event view, Tessian deletes the email. This makes it much easier to understand if an email is a threat.

Downloading the full email:
Allows portal admins to download the full email that Defender flagged in .eml format.
Admins will be able to download the full original email, which includes the header, the body, and any attachments. This helps for more detailed analysis and sharing of a particular email internally.

Delete emails from user inboxes:
Admins can Delete suspicious emails from user inboxes directly from Defender events in the Tessian portal. The emails will be moved to a user's trash folder.
With this, admins can easily remediate burst attacks that Defender has flagged with a single click. This is useful to remediate a threat after it has been detected.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Infrastructure and Platform Security

The Tessian HLS Platform is built on Amazon Web Services with an industry leading

29

security and privacy framework at the core of our technology.

Platform Security
APPLICATION AUTHENTICATION
All API communication between the Tessian Server and client-side software is authenticated using unique API tokens and domain whitelisting.

SINGLE SIGN ON (SSO)
Access to the Tessian Platform can be managed through SSO.

2-FACTOR AUTHENTICATION (2FA)
Tessian Platform access can be configured to require Two Factor Authentication.

IP WHITELISTING
Tessian Platform access can be restricted to specific IP addresses.

THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

30
Infrastructure Security
HIGH AVAILABILITY ARCHITECTURE AND SCALABILITY
The Gateway is based on an SMTP engine that's designed to easily handle multiple inbound and outbound connections at scale. This is coupled with processing engines that extract the email metadata used to call our API to determine whether any action needs to be taken on the email. Servers are hosted on Amazon Web Services (AWS) on a highly secure account that's separate from our main platform; this is to isolate access and fully lock down this environment on its own VPC.
ENCRYPTED IN TRANSIT
All API communication between the Tessian Server and the client-side environment is encrypted using AES-256 bit encryption via an SSL/TLS protocol.
ENCRYPTED AT REST
All data stored within the Tessian database is encrypted at rest. By encrypting all data at rest, we ensure that if any disks were accessed or compromised, all data is fully encrypted and therefore unreadable.
TENANT SEPARATED SCHEMAS
Customer data is schema separated in Tessian databases. This ensures that data is never shared within the same tables and customers can easily request the removal of their schema from Tessian.
AMAZON WEB SERVICES (AWS)
Tessian's infrastructure is hosted on Amazon Web Services, widely recognized as the world's leading infrastructure as a service platform and used by some of the largest companies and governments worldwide.
DATA RESIDENCY
Tessian offers the option to host your data with Amazon Web Services in Ireland (Europe) or Oregon (US).
DATA RETENTION
Tessian can remove all customer data from the platform at their request.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Company Security, Certifications and Integrations
31
Tessian adopts a number of best practice procedures to secure our company, people and technology. In addition, Tessian holds numerous industry certifications as part of our ongoing commitment to the highest standards of information security.
Platform Security
PENETRATION TESTING
We conduct annual penetration testing with a top-tier 3rd party.
RED TEAMING
We work with a 3rd party security company on an ongoing basis who provide red teaming services as well as reconnaissance and vulnerability analysis and are involved in architecture design decisions.
SECURITY ENGINEERS
We have a dedicated team of security engineers who test our systems internally and write tools to empower our engineers to build securely.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

32
Security Certifications and Integrations
Find out more about Tessian Integrations and Compatibility  Tessian Protects Enterprise Organizations Just Like Yours 
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

Stop Threats. Not Business.

Tessian prevents security threats that

Secure Email Gateways and DLP platforms can't.

33

See Tessian in action. Automatically stop data breaches and security threats caused by employees on email.

REQUEST A DEMO 

Tessian's mission is to secure the human layer. Using machine learning technology, Tessian automatically stops data breaches and security threats caused by human error - like data exfiltration, accidental data loss, business email compromise and phishing attacks - with minimal disruption to employees' workflow. As a result, employees are empowered to do their best work, without security getting in their way. Founded in 2013, Tessian is backed by renowned investors like Sequoia, Accel, March Capital, and Balderton and has offices in San Francisco and London.
THE TESSIAN HUMAN LAYER SECURITY PLATFORM ARCHITECTURE

