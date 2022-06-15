SecurityMetrics Guide to
PCI DSS Compliance
A Resource for Merchants and Service Providers to Become Compliant
[ SEVENTH EDITION ]

P2PE PA-QS P2PE PA-QS QSA

QQAPSPSFAAVI
ABOUT SECURITYMETRICS
We secure peace of mind for organizations that handle sensitive data. We have tested over 1 million systems for data security and compliance. Industry standards don't keep up with the threat landscape, which is why we hold our tools, training, and support to a higher, more thorough standard of performance and service. Never have a false sense of security.TM

2022 Guide to PCI DSS Compliance ­ About Us | 3
FOREWORD
No matter the advances in cyber security technology and despite government initiatives and regulations, attackers will continue to work to steal unprotected payment card data. Some organizations have simple, easy-to-correct vulnerabilities that could lead to data breaches. In other instances, organizations with intricate IT defenses and processes are overridden by an employee opening a phishing email. Our guide was specifically created to help merchants and service providers address the most problematic issues within the 12 PCI DSS requirements, including auditors' best practices and IT checklists. Our guide is not intended to be a legal brief on all requirements and aspects of PCI compliance. Rather, it approaches PCI from the perspective of a security analyst, focusing on how to protect your cardholder data. Thus, we recommend using it as a resource to help with your PCI compliance efforts. Ultimately, our goal is to help you better protect your data from inevitable future attacks.
MATT HALBLEIB
SecurityMetrics Audit Director CISSP | CISA | QSA (P2PE) | PA-QSA (P2PE)

2022 Guide to PCI DSS Compliance ­ About Us | 5

Text copyright © 2022 SecurityMetrics
All rights reserved. No part of this publication may be reproduced in any manner whatsoever without written permission from the publisher, except in the case of quotations embodied in critical articles or reviews.
All inquiries should be addressed to: SecurityMetrics 1275 West 1600 North Orem, UT 84057
Or contact: marketing@securitymetrics.com
Portions of this guide were adapted from material previously published on securitymetrics.com/blog and securitymetrics.com/learn.
International Standard Book Number: 978-1-7346465-5-9
The information described in this guide is presented as a reference and is not intended to replace security assessments, tests, and services performed by qualified security professionals, nor does it replace or supersede PCI DSS requirements. Users are encouraged to consult with their companies' IT professionals to determine their needs to procure security services tailored to those needs.

CONTENTS

Introduction 12

PCI DSS Compliance Overview

14

Understanding Your PCI DSS Responsibility

20

SAQ Overview

28

PCI DSS 4.0 

40

Implementing a PCI Compliant Remote Workforce Setup

60

Forensic Perspective

63

PCI DSS Requirements

72

Requirement 1

74

PROTECT YOUR SYSTEM WITH FIREWALLS

Requirement 2

84

USE ADEQUATE CONFIGURATION STANDARDS

Requirement 3

92

SECURE CARDHOLDER DATA

Requirement 4

100

SECURE DATA OVER OPEN AND PUBLIC NETWORKS

Requirement 5

106

PROTECT SYSTEMS WITH ANTI-VIRUS

Requirement 6

112

UPDATE YOUR SYSTEMS

Requirement 7

122

RESTRICT ACCESS

Requirement 8

128

USE UNIQUE ID CREDENTIALS

Requirement 9

136

ENSURE PHYSICAL SECURITY

Requirement 10

144

IMPLEMENT LOGGING AND LOG MONITORING

Requirement 11

152

CONDUCT VULNERABILITY SCANS AND PENETRATION TESTS

Requirement 12

166

START DOCUMENTATION AND RISK ASSESSMENTS

How to Prepare for a Data Breach

174

What to Include in an Incident Response Plan

182

Develop Your Incident Response Plan

190

Test Your Incident Response Plan

196

Data Breach Prevention Tools

200

Conclusion 204

PCI DSS Budget

206

Create a Security Culture

208

Contributors 212

Terms and Definitions

214

HOW TO READ THIS GUIDE
Whether you're a new employee with limited PCI knowledge or an experienced system administrator, our guide aims to help you secure your environment and for your organization to become compliant with PCI DSS requirements. We designed this document as a reference guide to address the most challenging aspects of PCI DSS compliance.
Depending on your background, job role, and your organization's needs, some sections in this guide may be more useful than others. Rather than reading our guide cover to cover, we recommend using it as a resource for your PCI compliance efforts.
The following chart displays an overview of the PCI Security Standards Council's Prioritized Approach. The Prioritized Approach offers organizations a risk-based roadmap to address issues on a priority basis, while also supporting organizational financial and operational planning.

2022 Guide to PCI DSS Compliance ­ How to Read this Guide | 9

The Prioritized Approach is broken down into the following six milestones (based on high-level compliance and security goals):

MILESTONES
1 2 3 4 5 6

GOALS
Remove sensitive authentication data and limit data retention Protect systems and networks, and be prepared to respond to a system breach Secure payment card applications
Monitor and control access to your systems
Protect stored cardholder data
Finalize compliance efforts, and ensure all controls are in place

NOTE
The information described in this guide is presented as a reference and is not intended to replace security assessments, tests, and services performed by qualified security professionals. Users are encouraged to consult with their companies' IT professionals to determine their needs to procure security services tailored to those needs.

PCI DSS REQUIREMENTS
Requirement 1 Protect Your System with Firewalls
Hardware firewalls Software firewalls Properly configure firewalls Network segmentation Test and monitor configuration
Requirement 2 Use Adequate Configuration Standards
Default password weaknesses System hardening System configuration management
Requirement 3 Secure Cardholder Data
Cardholder data trends Know where all cardholder data resides
Requirement 4 Secure Data Over Open and Public Networks
Stop using SSL/early TLS
Requirement 5 Protect Systems with Anti-Virus
Regularly update your anti-virus
Requirement 6 Update Your Systems
Regularly update and patch system(s) Establish software development processes Web application firewalls

MILESTONES 123456

2022 Guide to PCI DSS Compliance ­ How to Read this Guide | 11
Requirement 7 Restrict Access
Restrict access to cardholder data and systems
Requirement 8 Use Unique ID Credentials
Weak passwords and usernames Implement multi-factor authentication
Requirement 9 Ensure Physical Security
Control physical access to your workplace Keep track of POS terminals Train employees early and often Physical security best practices
Requirement 10 Implement Logging and Log Management
System logs and alerting Establishing log management Log management system rules
Requirement 11 Conduct Vulnerability Scans and Penetration Testing
Understand your environment Vulnerability scanning basics Penetration testing basics Vulnerability scanning vs. penetration testing
Requirement 12 Start Documentation and Risk Assessments
Regularly document business practices Establish a risk assessment process PCI DSS training best practices

2022 Guide to PCI DSS Compliance ­ Introduction | 13
INTRODUCTION

PCI DSS COMPLIANCE OVERVIEW
PAYMENT SECURITY
The Payment Card Industry Data Security Standard (PCI DSS) was established in 2006 by the major card brands (e.g., Visa, MasterCard, American Express, Discover Financial Services, JCB International).
All businesses that process, store, or transmit payment card data are required to implement the security standard to prevent cardholder data theft. The investigation of numerous credit card data compromises has confirmed that the security controls and processes required in the PCI DSS are essential to protecting cardholder data.
Merchants often have a difficult time attaining (or maintaining) compliance for a variety of reasons. Many smaller merchants believe it's too technical or costly, while others simply don't believe it's effective and refuse to comply.

2022 Guide to PCI DSS Compliance ­ Introduction | 15

REQUIREMENT 1
PROTECT YOUR SYSTEM WITH FIREWALLS
· Install a hardware and software firewall
· Configure firewalls for your environment
· Have strict firewall rules

REQUIREMENT 2
USE ADEQUATE CONFIGURATION STANDARDS
· Change default passwords
· Harden your systems
· Implement system configuration management

REQUIREMENT 3 PROTECT STORED DATA
· Find where card data is held · Craft your card flow diagram · Encrypt stored card data

REQUIREMENT 4
SECURE DATA OVER OPEN AND PUBLIC NETWORKS
· Know where data is transmitted and received
· Encrypt all transmitted cardholder data
· Stop using SSL and early TLS

REQUIREMENT 5
PROTECT SYSTEMS WITH ANTI-VIRUS
· Create a vulnerability management plan
· Regularly update anti-virus
· Maintain an up-to-date malware program

REQUIREMENT 6
UPDATE YOUR SYSTEMS
· Consistently update your systems
· Apply all critical/high patches to systems and software
· Establish secure software development processes

2022 Guide to PCI DSS Compliance ­ Introduction | 17

REQUIREMENT 7
RESTRICT ACCESS
· Restrict access to cardholder data
· Document who has access to the card data environment
· Establish a role-based access control system

REQUIREMENT 8
USE UNIQUE ID CREDENTIALS
· Use unique ID credentials for every employee
· Disable/delete inactive accounts
· Configure multi-factor authentication

REQUIREMENT 9
ENSURE PHYSICAL SECURITY
· Control physical access at your workplace
· Keep track of POS terminals · Train your employees often

REQUIREMENT 10
IMPLEMENT LOGGING AND LOG MONITORING
· Implement logging and alerting
· Establish log management
· Create log management system rules

REQUIREMENT 11
CONDUCT VULNERABILITY SCANS AND PENETRATION TESTING
· Know your environment
· Run vulnerability scans quarterly
· Conduct a penetration test

REQUIREMENT 12
START DOCUMENTATION AND RISK ASSESSMENTS
· Document policies and procedures for everything
· Implement a risk assessment process
· Create an incident response plan (IRP)

TOP 10

FAILING SAQ SECTIONS

We scanned our merchant database in search of the top 10 areas where SecurityMetrics merchant customers struggle to become compliant. Starting with the least adopted requirement, these are the results:

1

2

Requirement 12.1
Establish, publish, maintain, and disseminate a security policy.

Requirement 12.1.1
Review the security policy at least annually and update the policy when the environment changes.

3
Requirement 12.4
Ensure that the security policy and procedures clearly define information security responsibilities for all personnel.

4
Requirement 12.5.3
Establish, document, and distribute security incident response and escalation procedures to ensure timely and effective handling of all situations.

5
Requirement 12.6.a
Implement a formal security awareness program to make all personnel aware of the cardholder data security policy and procedures.

6
Requirement 12.10.1
Create an incident response plan to be implemented in the event of system breach.

2022 Guide to PCI DSS Compliance ­ Introduction | 19

In 2021, it took the average SecurityMetrics customer 20.33 days to reach PCI DSS compliance, with an average number of 0.98 support calls.

7
Requirement 12.8.5
Maintain information about which PCI DSS requirements are managed by each service provider, and which are managed by the entity.
8
Requirement 12.8.4
Maintain a program to monitor service providers' PCI DSS compliance status at least annually.
9
Requirement 12.3.1
Verify that the usage policies include processes for explicit approval from authorized parties to use the technologies.

10
Requirement 12.8.3
Verify that the usage policies define all critical devices and personnel authorized to use the devices.

UNDERSTANDING YOUR PCI DSS RESPONSIBILITY

In recent years, the PCI DSS introduced several changes, including changes to PCI scope definitions and SAQ categories. PCI scope deals with the people, processes, and technologies that must be tested and protected to become PCI compliant. An SAQ is simply a validation tool for merchants and service providers to self-evaluate their PCI DSS compliance.
If the people, process, or technology component stores, processes, or transmits cardholder data (or is connected to systems that do), it's considered in scope for PCI compliance. This means that PCI requirements apply and the system components must be protected.
System components likely in scope for your environment include:

· Networking devices · Servers · Switches

· Routers · Computing devices · Applications

Depending on the way you process, store, and transmit payment data, there are different SAQs that you must choose to fill out. For example, if you don't have a storefront and all products are sold online through a third party, you probably qualify for SAQ A or SAQ A-EP. These different SAQ types will be further explained later in this section.

2022 Guide to PCI DSS Compliance ­ Introduction | 21
PCI DSS SCOPING AND NETWORK SEGMENTATION SUPPLEMENT
In May 2017, the PCI Security Standards Council (SSC) released a supplemental guide for scoping and network segmentation. The purpose of this guidance was to help organizations identify the systems that need to be considered in scope for PCI DSS compliance and clarify how segmentation can reduce the number of in-scope systems. You need to understand your business environment--especially what systems are included and how those systems interact with sensitive data. You are then required to apply PCI DSS security requirements to all system components included in or connected to the cardholder data environment (CDE), which is "comprised of people, processes, and technologies that store, process, or transmit CHD or sensitive authentication data."

SCOPE YOUR ENVIRONMENT
When scoping your environment, start with the assumption that everything is in scope until it is verified that all necessary controls are in place and actually provide effective segmentation.
When performing your annual PCI DSS scope assessment, list and confirm all connected-to systems, which are system components that:
» Directly connect to the CDE (e.g., via internal network connectivity)
» Indirectly connect to the CDE (e.g., via connection to a jump server with CDE access)
» Impact configuration or security of the CDE (e.g., web redirection server, name resolution server)
» Provide security to the CDE (e.g., network traffic filtering, patch distribution, authentication management)
» Segment CDE systems from out-of-scope systems and networks (e.g., firewalls configured to block traffic from untrusted networks)
» Support PCI DSS requirements (e.g., time servers, audit log storage servers)
Make sure any changes to your environment are reflected in your annual scope assessment.

2022 Guide to PCI DSS Compliance ­ Introduction | 23

Without adequate network segmentation, your entire network is in scope of the PCI DSS assessment and applicable PCI requirements. Segmentation prevents out-of-scope systems from communicating with systems in the CDE or from impacting the security of the CDE.
An out-of-scope system is a system component that:
· Does NOT store, process, or transmit cardholder data · Is NOT in the same network segment as systems that store, process,
or transmit CHD · CANNOT connect to any system in the CDE · Does NOT meet any criteria describing connected-to or security-
impacting systems

To be considered out of scope, controls must be in place to provide reasonable assurance that the out-of-scope system cannot be used to compromise an in-scope system component.
Here are some examples of controls you can use:

· Host-based firewall and/or IDS/IPS · Physical access controls · Logical access controls · Multi-factor authentication

· Restricting administrative access
· Actively monitoring for suspicious network or system behavior

While not required, it's best practice to implement PCI DSS controls on out-of-scope systems to prevent them from being used for malicious purposes.

TIPS FROM AN AUDITOR
PCI DSS SCOPE

MATT HALBLEIB
SecurityMetrics Audit Director | CISSP | CISA | QSA (P2PE) | PA-QSA (P2PE)

To discover your PCI scope and what must be included for your PCI compliance, you need to identify anything that processes, stores, or transmits cardholder data, and then evaluate what people and systems are communicating with your systems.
In May 2017, the PCI Council released an informational supplement regarding PCI scoping. The document helps reinforce and clarify scoping points that have always been part of PCI scoping.

The document can help you work through your annual scoping exercise and can lead you to discover card flows and in-scope systems that you may have previously ignored.
In my experience performing PCI audits, entities often overlook the ancillary or support types of systems when doing their own PCI scoping. For instance, call centers usually pay little attention to QA systems, which often store cardholder data in the form of call recordings. These systems are in scope for all PCI requirements!

2022 Guide to PCI DSS Compliance ­ Introduction | 25

""There are always processes you might not realize that

Simple questions can help you begin the scoping process. For example, ask yourself:
· How do you collect money?
· Why do you handle card data?

"are in sco"pe. Don'tforgetpoweroutage
procedures where card data is sometimes taken down manually. For example, in most call centers, we've discovered that agents are typically unaware that card data

· How do you store, process, and transmit this data?

should never be written down. But when the application they use for

There are always processes you might not realize are in scope. For example, if you are a retail store that swipes cards, do you ever take card numbers over the phone or receive emails with card information? Are any paper orders received? Organizations often have finance, treasury, or risk

recording cardholder data freezes, they tend to resort to typing or writing it down in a temporary location and retrieving it later for entry. These temporary locations are rarely considered in an organization's PCI compliance efforts but can lead to increased risk and should be included in your PCI scope.

groups that have post-transaction

processes involving cardholder

data. It is important to include these

processes when determining scope.

Paper trails of hand-written information or photocopied payment card data can sometimes fill multiple rooms. Even if card data is ten years old, it is still in PCI scope.
If you access a web page for data entry, there's a decent chance card data can be found in temporary browser cache files. In addition, it's the website developer's responsibility to make sure websites don't generate cookies or temporary log files with sensitive data. However, you don't always have full control of your website, which is why it's important to evaluate all systems for cardholder data, even where you might not expect it to reside.

For organizations with web portals, if someone mistypes card data into an address or phone number field, it is still considered in PCI scope.
You might think your databases are set up to encrypt all cardholder data. However, servers you consider out of scope will often hold temporary files, log files, or back-ups with lots of unencrypted data. System administrator folders on file servers are also common culprits, as they often backup failing servers in a rush to prevent data loss without considering the PCI implications.

Do not panic if you find data where it does not belong.

Usually, organizations can find ways to fix processes and delete this sensitive data, rather than add servers to their scope. A simple way to find unencrypted card data is by running a card discovery tool, such as SecurityMetrics PANscan.

The next step in determining your PCI scope is to find everything that can communicate with the devices you have identified. This is often the hardest part about scoping because you may not understand what can communicate to your systems.

Organizations need to have methods to detect these mistakes and prevent or delete them. Some use a data loss prevention (DLP) solution to help them with this process.

2022 Guide to PCI DSS Compliance ­ Introduction | 27

Answer the following questions about your systems:
» How do you manage your systems? » How do you log in to them? » How do you backup your systems? » How do you connect to get reports? » How do you reset passwords? » How do you administer security controls
on your systems?

If you have a server that handles cardholder data, you must always consider what else communicates with that server. Do you have a database server in some other zone you consider out of scope but is reaching that web server to pull reports and save data? Anything that can initiate a connection to an in-scope server that handles cardholder data will be in scope for compliance.

In addition, if your system in the CDE initiates a communication out to a server in another zone, that server will also be in scope. There are very few exceptions to this.

SAQ 3.2.1 OVERVIEW

SAQ

DESCRIPTION

E-commerce website (third party)

· Fully outsourced card acceptance and processing

· Merchant website provides an iframe or URL

A

that redirects a consumer to a third-party

payment processor

· Merchant can't impact the security of the payment transaction

E-commerce website (direct post)

A-EP

· Merchant website accepts payment using direct

post or transparent redirect service

Processes cards via:
· Analog phone, fax, or stand-alone terminal
B
· Cellular phone (voice) or stand-alone terminal
· Knuckle buster/imprint machine

Processes cards via:

B-IP

· Internet-based stand-alone terminal isolated

from other devices on the network

Payment application systems connected to the Internet:

· Virtual terminal (Not C-VT eligible)

· IP terminal (Not B-IP eligible)

C

· Mobile device (smartphone/tablet) with a card

processing application or swipe device

· View or handle cardholder data via the Internet

· POS with tokenization

# OF ?S

VULN. SCAN

24

No

191

Yes

41

No

86

Yes

160

Yes

2022 Guide to PCI DSS Compliance ­ Introduction | 29

SAQ

DESCRIPTION

Processes cards:
· One at a time via keyboard into a virtual terminal
C-VT
· On an isolated network at one location
· No swipe device

# OF ?S

VULN. SCAN

83

No

Point-to-point encryption

· Validated PCI P2PE hardware payment terminal

P2PE

solution only

33

No

· Merchant specifies they qualify for the P2PE questionnaire

E-commerce website

· Merchant website accepts payment and does not use a direct post or transparent redirect service

D Electronic storage of card data

329

Yes

· POS system not utilizing tokenization or P2PE

· Merchant stores card data electronically (e.g., email, e-fax, recorded calls, etc.)

DETERMINE YOUR SAQ TYPE
How you process credit cards and handle cardholder data determines which of the 9 Self-Assessment Questionnaire (SAQ) types your business needs to fill out. Here are the different SAQ type requirements:

SAQ
A

· Your company only accepts card-not-present (e-commerce or mail/ telephone-order) transactions.
· All processing of cardholder data is entirely outsourced to a PCI DSS validated third-party service provider.
· Your company does not electronically store, process, or transmit any cardholder data on your systems or premises, but relies entirely on a third party(s) to handle all these functions.
· Your company has confirmed that all third-party(s) handling storage, processing, and transmission of cardholder data are PCI DSS compliant.
· Any cardholder data your company retains is on paper (such as printed reports or receipts), and these documents are not received electronically.

In summary, if your company has completely outsourced the collection and processing of cardholder data to a PCI DSS-compliant third-party provider and your employees never have access to full credit card numbers, there is a strong likelihood that the SAQ A is the appropriate SAQ for your environment.
Most SAQ A merchants have an e-commerce environment that has been fully outsourced to a third party or that either redirects the users browser to a PCI DSS-compliant payment gateway at checkout or makes use of a third-party iFrame for payment collection.

2022 Guide to PCI DSS Compliance ­ Introduction | 31

SAQ
A-EP

· Your company only accepts e-commerce transactions.
· All processing of cardholder data­with the exception of the payment page­is entirely outsourced to a PCI DSS validated third-party payment processor.

· Your e-commerce website does not receive cardholder data but controls how consumers­or their cardholder data­are redirected to a PCI DSS validated third-party payment processor.

· If the merchant website is hosted by a third-party provider, the provider is validated to all applicable PCI DSS requirements (e.g., including PCI DSS Appendix A if the provider is a shared hosting provider).

· Each element of the payment page(s) delivered to a consumer's browser originates from your website or a PCI DSS compliant service provider(s).

· Your company does not electronically store, process, or transmit any cardholder data on your systems or premises, but relies entirely on third parties to handle all of these functions.

· Your company has confirmed that all third parties handling storage, processing, and transmission of cardholder data are PCI DSS compliant.

· Any cardholder data your company retains is on paper (e.g., printed reports, receipts), and these documents are not received electronically.

Like most SAQ A merchants, SAQ A-EP merchants have an e-commerce payment environment where the collection and processing of cardholder data has been outsourced to a PCI DSS-compliant service provider. Unlike the SAQ A, SAQ A-EP websites control the flow of cardholder data to the service provider (typically using javascript or direct post methods).
If you have an e-commerce environment and you are not using a third-party iFrame or fully redirecting users to the service provider's website for payment collection but your website never receives cardholder data directly, the SAQ A-EP is likely the correct choice for your compliance documentation.

SAQ
B

· Your company only uses an imprint machine and/or uses only standalone, dial-out terminals (connected via a phone line to your processor) to take your customers' payment card information.
· Standalone, dial-out terminals are not connected to any other systems within your environment.

· Standalone, dial-out terminals are not connected to the Internet.

· Your company does not transmit cardholder data over a network (either an internal network or the Internet).

· Any cardholder data your company retains is on paper (e.g., printed reports, receipts), and these documents are not received electronically.

· Your company does not store cardholder data in an electronic format.

Most SAQ B merchants receive cardholder data in person and via mailorder/telephone-order transactions and process these payments using bank-provided payment terminals that are connected to analog phone lines. Cardholder data should never be received electronically (via email) or stored electronically. Be sure your terminals are not connected to VoIP connections.

2022 Guide to PCI DSS Compliance ­ Introduction | 33

SAQ
B-IP

· Your business only uses standalone, PTS-approved POI devices connected via IP to your payment processor to take your customers' payment card data.
· Standalone IP-connected POI devices are validated to the PTS POI program as listed on the PCI SSC website (excludes SCRs).

· Standalone IP-connected POI devices are not connected to any other systems within your environment.

· The only transmission of cardholder data is from PTS-approved POI devices to the payment processor.

· The POI device doesn't rely on any other device (e.g., computer, mobile phone, tablet) to connect to the payment processor.

· The business has only paper reports or paper copies of receipts with cardholder data, and these documents are not received electronically.

· Your company does not store cardholder data electronically.

Most SAQ B-IP merchants receive cardholder data in person and via mailorder/telephone-order transactions and process these payments using bank-provided terminals.
SAQ B-IP terminals are, however, connected to an IP network and transmit their data over the network instead of an analog connection. This allows for much faster processing times, but security controls must be in place to properly segment and protect payment data being transmitted over the network.

SAQ · Your business has a payment application system and an Internet connection on the same device and/or same local area network (LAN).

C

· The payment application system isn't connected to any other systems

within your environment.

· The POS environment isn't connected to other locations, and any LAN is for a single location only.

· Any cardholder data your business retains is on paper (e.g., printed reports, receipts), and these documents are not received electronically.

· Your company does not store cardholder data in an electronic format.

Typical SAQ C merchants receive cardholder data in person and via mailorder/telephone-order transactions that are processed using a Point-of-Sale system that is configured to not store the full PAN (credit card number). Typical POS solutions will have multiple POS workstations/registers connected to a back-end server (the server may be hosted by a vendor/thirdparty). The SAQ C is designed for a simple, single-location environment.
Merchants with multiple locations that are connected to the corporate office should be using the SAQ D.

2022 Guide to PCI DSS Compliance ­ Introduction | 35

SAQ
C-VT

· Your company only processes payments through a virtual payment terminal accessed by an Internet-connected web browser.
· Your company's virtual payment terminal solution is provided and hosted by a PCI DSS validated third-party service provider.
· Your company accesses the PCI DSS-compliant virtual payment terminal solution through a computer that is isolated in a single location and is not connected to other locations or systems within your environment.
· Your company's computer does not have software installed that causes cardholder data to be stored.
· Your company's computer does not have any attached hardware devices that are used to capture or store cardholder data via direct physical interaction with the payment card.
· Your company does not otherwise receive or transmit cardholder data electronically through any channels.
· Any cardholder data your company retains is on paper, and these documents are not received electronically.
· Your company does not store cardholder data in an electronic format.

Typically SAQ C-VT organizations receive cardholder data in person and via mail-order/telephone-order transactions and enter the payment information into a web-based virtual terminal using a workstation dedicated to processing payments.

SAQ · All payment processing is through a validated PCI P2PE solution approved and listed by the PCI SSC.

P2PE

· The only systems in the merchant environment that store, process, or transmit account data are the Point of Interaction (POI) devices, which are approved for use with the validated and PCI-listed P2PE solution.

· You do not otherwise receive or transmit cardholder data electronically.

· There's no legacy storage of electronic cardholder data in the environment.

· If your business stores cardholder data, this data is only in paper reports or copies of paper receipts and isn't received electronically.

· Your business has implemented all controls in the P2PE Instruction Manual (PIM) provided by the P2PE Solution Provider.

To reduce risk in a merchant payment environment and to minimize the efforts to maintain PCI DSS compliance, the PCI SSC has developed a standard for point-to-point encryption solutions. P2PE payment solutions will strongly encrypt cardholder data at the point of entry (e.g., POI device) and send the encrypted data to the P2PE solution provider for decryption and processing.
Typical SAQ P2PE merchants receive cardholder data in person and via mail-order/telephone-order transactions and process the payments using validated P2PE terminals (a list of validated P2PE solutions can be found on the PCI Council's website).

SERVICE PROVIDERS

2022 Guide to PCI DSS Compliance ­ Introduction | 37

SAQ
D

SAQ D applies to merchants who don't meet the criteria for any other SAQ type. This SAQ type handles merchants who store card information electronically and do not use a P2PE certified POS system.
Examples of SAQ D merchant types include:

MERCHANTS

· E-commerce merchants who accept cardholder data on their website.

· Merchants with electronic storage of cardholder data.

· Merchants that don't store cardholder data electronically but that do not meet the criteria of another SAQ type.

· Merchants with environments that might meet the criteria of another SAQ type, but that have additional PCI DSS requirements applicable to their environment.

SAQ
D

A service provider is a business entity that isn't a payment brand, but is directly involved in the processing, storage, or transmission of cardholder data on behalf of another organization.
Service providers can also provide services that control or could impact the security of cardholder data processed under another company's merchant account.

Examples of service providers who qualify for SAQ D include:

· A service provider that handles card data on behalf of another business.

· A service provider that provides managed firewalls in another entity's cardholder data environment.

· A service provider that hosts a business's e-commerce environment/ website or controls the flow of e-commerce data.

COMBINING MULTIPLE SAQS
Some merchants will have multiple payment flows that together may not fit any SAQ type besides the SAQ D. For instance, a merchant may have an outsourced e-commerce payment channel that would fit the SAQ A but may also accept card-present transactions using an analog-connected bank terminal (SAQ B).
A merchant with multiple payment channels will likely be required to complete the SAQ D as they would not be able to affirmatively answer the qualifying criteria questions when taking looking at their multiple payment channels together.
Some merchant banks will allow a merchant to assess each payment channel separately with the SAQ that matches each payment channel. So, in the case of an SAQ A + SAQ B combo environment, the merchant may be able to complete an SAQ A to cover their e-commerce channel and an SAQ B to cover the card-present payment channel and provide their bank with both SAQs.
If your merchant environment consists of two or more simple payment channels, it may be worth your time to have a conversation with your merchant bank to see if you would be able to assess each payment channel separately.

2022 Guide to PCI DSS Compliance ­ Introduction | 39
PCI DATA SECURITY ESSENTIALS EVALUATION TOOL FOR SMALL MERCHANTS
In 2018, the PCI council released a new payment security tool­the Data Security Essentials (DSE) Evaluation Tool­to simplify security evaluation and increase security awareness for eligible small merchants. The Data Security Essentials Evaluation Tool includes 15 new categories from the PCI Council­based on payment acceptance methods­which will help smaller merchants simplify their compliance process and get the most benefit from their efforts.
"Merchants are only eligible to use a Data Security Essentials evaluation if they have been notified by their acquirer [aka their merchant bank] that it is appropriate for them to do so."
To find out more information about DSE evaluations and your possible options, contact your merchant bank.

PCI DSS 4.0
PCI DSS 4.0 DEVELOPMENT AND IMPLEMENTATION TIMELINE
The adoption of PCI DSS version 4.0 includes an overlapping sunset date for PCI DSS version 3.2.1 so that the transition between versions will be smooth. The adjacent diagrams show PCI DSS 4.0 development and transition timelines we put together from information provided by the PCI Council. One thing to focus on is that ample time has been provided for the transition from PCI DSS 3.2.1 to PCI DSS 4.0.
In addition, many new requirements being added to the standard are future-dated in order to allow new processes to be developed before any new requirements will be enforced. We have included this section to give you a quick introduction to PCI DSS 4.0 and some of the larger changes. So, remain calm and keep progressing in your compliance efforts with the current version of the standard while you take some time to read and plan for PCI DSS 4.0.

2022 Guide to PCI DSS Compliance ­ Introduction | 41

PCI DSS 4.0

THE GOAL OF PCI DSS 4.0
Why did the PCI Council make a major rewrite of the PCI DSS when it is considered to be a fairly mature standard?
There are four major reasons for the changes: » Ensure the standard continues to meet the security needs of the payments industry
» Promote security as a continuous process
» Enhance validation methods and procedures
» Add flexibility and support of additional methodologies to achieve security
1. ENSURE THE STANDARD CONTINUES TO MEET THE SECURITY NEEDS OF THE PAYMENTS INDUSTRY
As time moves on, technology changes and so do the attack vectors of bad actors trying to compromise systems. It is important to keep up with this changing technology. PCI DSS 4.0 addresses these changes, from scoping to cloud computing. The following table shows some of the areas of further guidance and definition. This is not an exhaustive list but will give you some ideas of what has changed.

2022 Guide to PCI DSS Compliance ­ Introduction | 43

Areas of PCI DSS 4.0 evolution to stay current and relevant:

EVOLUTION AREA
Scoping
Protection of Cardholder Data Transmissions Anti-Phishing and Social Engineering
Risk Assessments
Authentication
Cloud Considerations

COMMENTS
Scoping guidance will be a more integral part of the standard itself by providing more detail on requirements for scoping validation. New requirements include tasks for organizations to verify their PCI DSS scope and some additional requirements for service providers.
There are continued enhancements to requirements for the protection of cardholder data in motion throughout the network.
The Council recognizes that phishing and social engineering are becoming bigger attack vectors. These are addressed in the PCI DSS 4.0 standard.
Requirements for performing risk assessments have been in PCI DSS for years; in version 4.0 these requirements expand and provide more detail for risk management as a whole. Additional requirements have been added to clarify the risk assessment process mentioned in section 12 of the standard.
The Council aligned more closely with some industry best practices in authentication, such as addressing password length, periodic change guidelines, and multifactor authentication enhancements. These revisions to password requirements help to accommodate different authentication options.
PCI DSS 4.0 now addresses cloud technology where it may apply in the standard. The Council has also reviewed Appendix A, which contains requirements for shared hosting providers, in order to update it with cloud technologies in mind.

PCI DSS 4.0

2. PROMOTE SECURITY AS A CONTINUOUS PROCESS
From the beginning, PCI DSS requirements were created to help organizations develop security best practice habits that would be followed year-round, rather than only during an annual assessment period. Many organizations have been able to make this transition to the mindset of security as a lifestyle, while others are still focused on passing an assessment and moving on. For example, there were changes to include more gathering of validation information over a period of time to support and ensure that a continuous security process is in place.
The release of the new 4.0 version may cause anxiety for those already familiar with the current PCI DSS requirements. Rest assured that the 12 core PCI DSS requirements remain fundamentally the same; version 4.0 is not a totally new standard.

2022 Guide to PCI DSS Compliance ­ Introduction | 45
3. ENHANCE VALIDATION METHODS AND PROCEDURES
The PCI Council has looked at validation methods and procedures to make sure they are meshing with the new PCI DSS 4.0 release. It is expected that the SAQ and AOC processes and contents will be evaluated and enhanced and released early in Q2 of 2022. It remains unclear how or if the new customized approach methods will be applicable to current SAQ validation methods.
4. ADD FLEXIBILITY AND SUPPORT OF ADDITIONAL METHODOLOGIES TO ACHIEVE SECURITY
QSAs sometimes get asked the question "our methods are secure, can't I meet this requirement another way?" The response had to be "We could look at defining a compensating control, but that is considered a temporary solution until you can meet the requirement the right way." Version 4.0 of the PCI standard will try to resolve this scenario by introducing the concept of validation of a security control using a customized approach. Companies that adequately meet requirements with existing controls can continue to use these controls as a viable way to achieve compliance. Past validation methodologies will now be known as a "defined approach." This is essentially what we have been doing for the past 16 years. Either approach option can be used for a PCI DSS requirement and approaches can even be mixed up within a single Report on Compliance (RoC).
PCI DSS 4.0

CUSTOMIZED APPROACH
PCI DSS 4.0 introduces the concept that not all security approaches are the same and that there may be many ways to achieve a security objective. Version 4.0 will allow customization of requirements and testing procedures in order to accommodate this.
Many companies have security solutions in place that may meet the intent of a security objective but not meet a specific requirement. This approach could let entities show how their specific solution meets the intent of the security objective and addresses the risk, and therefore provides an alternative way to meet the requirement.
This new approach will take the place of compensating controls in the PCI DSS 4.0 standard. The PCI council has stated that "Unlike compensating controls, customized validation will not require a business or technical justification for meeting the requirements using alternative methods, as the requirements will now be outcome-based."
Sounds simple, right? Well, maybe. This new validation method will most likely result in more assessment work initially for the entity in order to prepare documentation and risk assessment data for a QSA to evaluate. It will then require specialized testing procedures to be developed by the QSA and agreed upon by the entity (see adjacent chart).
The customized approach will not be for everyone and will be most suited for entities with mature security and risk assessment processes in place.
The custom process provides the advantage of defining a more permanent solution for compliance validation of specialized security controls. This is different from previous temporary compensating controls in earlier versions of the standard, where you had to document a justification for the control with a business or technical constraint.

2022 Guide to PCI DSS Compliance ­ Introduction | 47
Customized Approach Milestones:
PCI DSS 4.0

Relying on a security implementation you already have in place may save on new capital expenses, but it will require more work on your part. You will need to thoroughly document, test, and conduct risk analysis efforts to present to your QSA. The QSA then has to review your information to develop custom testing procedures­a process which will require more reporting from the entity. Therefore, an assessment using the Customized Approach will likely require more resources than an assessment using the defined approach, but it may be a more cost effective method when all aspects are considered. Be sure to look for a QSA with the depth and years of experience necessary to validate custom controls and develop appropriate testing procedures.
The Customized Approach method shouldn't be a way to disengage from your assessment. Rather, utilizing the Customized Approach should encourage working closely with your QSA.

2022 Guide to PCI DSS Compliance ­ Introduction | 49
CUSTOMIZED APPROACH AND RISK ASSESSMENTS
As mentioned in the previous section, the Customized Approach is now available. However, before jumping right in, larger organizations and risk assessment teams may want to look at the Defined Approach and Customized Approach so that they understand the differences between the two and can make the right decisions for their organization.
A lot of people are excited about the Customized Approach because it sounds easier to get compliant. In reality, it's going to be a pretty heavy lift. The Customized Approach requires a lot of work and effort to define what the actual requirements are and how to measure the requirements.
One of the biggest adjustments to PCI 4.0 is the increased use of risk assessments within the Customized and Defined Approaches. Risk assessments for a Customized Approach are a big part of the new standard. Instead of being a simple 15-minute process, organizations will need to follow a very structured formalized risk assessment.
In the past, people weren't certain about what risk assessments were or the associated requirements. We'd often ask questions like "have you had a meeting, or have you written a document, or have you done something that shows that you've thought about the risks in your system?"
Now, the expectation is that if you make a change in your environment (e.g., adding a new firewall), you need to do a risk assessment on that change.
If you don't have a lot of experience with a formal risk assessment, or don't have a risk department as part of your company, you may need initial help from a third party to get you going and learn how to do these things.
Formal risk assessments may not seem like a big change based on some of the other future dated requirements that have been added to the standard, but this change in PCI DSS 4.0 may result in additional effort in the transition process.
PCI DSS 4.0

KEY PCI DSS 4.0 REQUIREMENT UPDATES
Here's a quick overview of some key new requirement changes in each section of PCI DSS 4.0:
REQUIREMENT 1
There were no significant changes in this section.
REQUIREMENT 2
There were no significant changes in this section.
REQUIREMENT 3
Requirement 3.2.1 (March 31, 2025) In the past, if you stored sensitive authentication data before authorization, it was recommended that you should try to encrypt or protect it, but it wasn't required. Now, it is required.
Requirement 3.3.3 (March 31, 2025) Issuers now must encrypt the sensitive authentication data that they may be storing. This may not be a big deal for most issuers at this point, but may be difficult for some legacy systems where encryption software is not readily available.
Requirement 3.4.2 (March 31, 2025) If you're using remote access technology to access the cardholder data environment (CDE), then you must prevent the copy and relocation of PAN data. This has been mentioned before, but now it will be a requirement.
Previously, you could just have a policy addressing this, but now it needs to be enforced by some technology. There may be settings in your remote access software that have ways of preventing access to certain functions. Depending on what resources you have and your current processes, this requirement may or may not be difficult to implement.

2022 Guide to PCI DSS Compliance ­ Introduction | 51
Requirement 3.5.1.2 (March 31, 2025) This requirement discusses the removal of disk-level encryption as an option to protect card data. Now it can only be used for removable media (e.g., a USB drive, an external SSD). You can't use it anymore on your computer's hard drive or any kind of non-removable media. If you're using disk-level encryption for protection, you will need to make some changes. Requirement 3.5.5.1 (March 31, 2025) PCI DSS 4.0 also changes the security required on hashing functionality if your system is using a hash method for protecting card data. Organizations will need to use a keyed cryptographic hash method, which is different from most common hash algorithms in use. So you may need to change your hashing algorithm to something like HMAC, CMAC, or GMAC, with an effective cryptographic strength of at least 128-bits. A code change of this kind could take some effort so you may want to focus on this earlier rather than later.
REQUIREMENT 4 Requirement 4.2.1 (March 31, 2025)
A new requirement in this section will be to carefully document, track, and inventory SSL and TLS certificates in use for the transmission of sensitive data across public networks. Increased tracking will help ensure the certificates' continued strength and validity. So, it's just a new process and tracking that needs to be implemented.
PCI DSS 4.0

REQUIREMENT 5
Requirement 5.3.3 (March 31, 2025) Organizations will need to scan removable media used in the CDE. Since most antivirus solutions do this or have the capability, it may just require some configuration setting changes. Review the capabilities of the malware solution you are using to see if they have these capabilities.
Requirement 5.4.1 (March 31, 2025) One of the bigger changes is that a requirement to have automatic process mechanisms in place to detect and protect personnel against email phishing attacks has been added.
If you're doing your email in house, you may or may not have had all the controls in place for this yet. If you've outsourced emails, confirm with your provider and see what sort of protections they have against phishing attacks.
REQUIREMENT 6
Requirement 6.4.2 (March 31, 2025) In PCI DSS 3.2.1, a web application firewall or a process to do code reviews was required to protect web applications developed by a company. In March 2025, organizations will need to have a web application firewall in place for any web applications exposed to the Internet.
This standard has been a long time coming and shouldn't be surprising. There are many solutions, including cloud-based solutions, that can help with this requirement.

2022 Guide to PCI DSS Compliance ­ Introduction | 53
Requirement 6.4.3 (March 31, 2025) To reduce the possibility of malicious scripts making it onto payment pages, organizations need an inventory of all the known scripts used on those pages. This inventory must be documented and tracked to ensure that all the scripts used are authorized, and that the integrity has been validated. Review the guidance column for further information on this requirement.
REQUIREMENT 7 Requirements 7.2.4, 7.2.5, 7.2.5.1 (March 31, 2025)
Not much has changed in this section. It's the basic, role-based access control requirements, and most of the changes are just tightening account reviews and processes around reviews for systems, users, and applications.
REQUIREMENT 8 Requirement 8.3.6 (March 31, 2025)
To strengthen passwords, the minimum length of passwords is moving from 7 to 12 alpha and numeric characters. Depending on your applications, this could be a simple fix or it may require some code changes. So, start checking now to see if there are any systems in use in your CDE that would have difficulty with this future dated requirement.

PCI DSS 4.0

Requirement 8.3.10.1 (March 31, 2025) Another change in section eight around passwords pertains to service providers. Customers of service providers will now have to change their passwords every 90 days if you're using just a password for authentication (i.e - you are not using a multi-factor authentication).
Requirement 8.4.2 (March 31, 2025)
Multi-factor authentication will be required for all access to the CDE, not just from external locations. So this then would apply for internal administrative access to servers, firewalls, networking gear, etc.
Requirement 8.5.1 (March 31, 2025) PCI DSS 4.0 adds a new detail to MFA requirements that might be a bit tricky. Success of all the factors has to happen before authentication, and it can't be known from the process which factor has failed.
Presently, most systems ask for a username and password (i.e., something you know) and only move on to the second factor if you have the correct username/password. This will no longer be allowed.
Both factors will have to be presented and entered without revealing any information about which factor might have been wrong if authentication fails.
Requirement 8.6.2 (March 31, 2025) All application and system passwords that could be used for interactive login have additional approval and tracking controls on their use, and can no longer reside in a script or a file.
PCI DSS 4.0 SECTION 9
There were no significant changes in this section.

2022 Guide to PCI DSS Compliance ­ Introduction | 55
PCI DSS 4.0 SECTION 10 Requirement 10.4.1.1 (March 31, 2025)
Organizations can no longer review their logs manually. Few, if any, companies are manually reviewing logs anymore as it's just too much data to effectively review manually. There are many log review tools out there so it shouldn't be difficult to implement a solution. Manual review of logs is timeconsuming and easy to do poorly, so this is a good change. Requirement 10.7.2 (March 31, 2025) All organizations must now detect, alert, and promptly address failures of critical security control systems. This used to be only required for service providers, but has now been extended to everyone. This means that if you had a firewall or IDS system that went down for some reason, you would have to detect it, generate an alert, and respond to that alert. This update will require additional procedures for merchants to implement. We recommend that you start now to look for solutions.
PCI DSS 4.0 SECTION 11 Requirement 11.3.1.2 (March 31, 2025)
Internal vulnerability scanning must now be authenticated. This means that it's not just a scan of ports and services; now, if a service is exposed that requires a credential to access it (e.g., a web app), you need to use those credentials to gain access and test the authenticated port or service. An important part of this new requirement will be that the credentials used by the vulnerability assessment (VA) scanner must be entered in the system and stored securely. This will have to be a feature of the VA scanning solution and should be something you check with your vendor carefully on.
PCI DSS 4.0

Requirement 11.5.1.1 (March 31, 2025) Another requirement change for service providers was on IDS/IPS, so that systems detect and alert on any covert malware communication channels that are being used (i.e., DNS tunneling). This may represent a change to the IDS/ IPS system that you are currently using.
Requirement 11.6.1 (March 31, 2025) Probably one of the biggest things in section eleven was the addition of a requirement to implement a change and tamper detection mechanism for any payment pages. This requirement addition is a direct result of the increase in ecommerce skimming compromises seen on payment pages in recent years.
Before March 31, 2025, companies will have to deploy a solution that will detect changes to those pages (e.g., script additions, changes to known script and code).
This is a great addition to the standard and is absolutely needed for e-commerce websites.
PCI DSS 4.0 SECTION 12
Requirement 12.5.2 (Immediately Effective for 4.0 Assessments) An annual scoping of your card data environment was mentioned in the initial discussion section of previous versions of PCI DSS, but now the Council has moved that into the requirements matrix under section 12 and made it a trackable requirement effective immediately for version 4.0.
So a documented scoping exercise will have to be done by merchants annually, or after any significant changes to the in-scope environment (e.g., people, systems, processes).

2022 Guide to PCI DSS Compliance ­ Introduction | 57
Requirement 12.5.2.1 (March 31, 2025) New for service providers will be a future dated requirement to perform this scoping exercise at least every 6 months and after any organizational changes to the company.
Requirement 12.6.2 (March 31, 2025) Organizations will need to enforce a more formal Security Awareness Program, where before you could get by with some basic security training. Organizations will need to document and update their Security Awareness Program at least once every 12 months and as needed to address any new threats and vulnerabilities that may impact the security of their CDE or information provided to personnel about their role in protecting cardholder data.
Requirement 12.6.3.1 (March 31, 2025) The standard now expects a security training program to discuss specific threats and vulnerabilities in your environment, as well as acceptable use of end-user technologies. For example, if phishing is a big deal for your environment, then you need to address phishing in your training. The training program will also need to be reviewed and updated at least annually.
Requirement 12.10.7 (March 31, 2025) Incident response procedures will need to be initiated if stored payment account numbers (PAN) is detected anywhere it is not expected. This means that you are always on the watch for new or errant processes creating repositories of stored PAN outside of expected boundaries. Periodic review of processes dealing with card data and running a good data discovery tool will be needed to fully say you have satisfied this future-dated requirement.
PCI DSS 4.0

TAKEAWAYS
What are the most important things to focus on right now?
First, read the PCI DSS version 4.0 standard and get familiar with the bigger changes that could impact your compliance process. Then start formulating your plans right now to implement changes for version 4.0. There is plenty of time, so start early and you will not have problems making the transition. During this planning process don't forget to keep working hard to keep your current efforts going to be compliant to PCI DSS version 3.2.1.
Second, start thinking about how you are conducting your risk assessments. More formal risk assessment processes are required in version 4.0 and most organizations will have to add processes and gain skills to do this correctly. Start doing google searches on formal risk assessment and refer to the industry standards out there like NIST 800-30 and OCTAVE to begin getting familiar with them. It may be a good idea to consult with a QSA as you develop these processes.
QSA's will not be able to conduct a PCI DSS 4.0 assessment until after they have been formally trained by the PCI Council (expected mid-Summer 2022), so it is a bit too early to actually start on a formal assessment to PCI DSS version 4.0, but QSA's are happy to start consulting on questions you may have as you begin working on your version 4.0 compliance.
Finally, don't wait until 2024 to begin switching over to PCI DSS 4.0. Spread your efforts across the next couple of years and you will be just fine with the new requirements.

2022 Guide to PCI DSS Compliance ­ Introduction | 59
PCI DSS 4.0 SUMMARY
PCI DSS version 4.0 may seem daunting but is actually an improved way to counteract the techniques used by threat actors. Preparing for compliance to version 4.0 is straightforward if you are already working towards or maintaining compliance to PCI DSS 3.2.1.

PCI DSS 4.0

IMPLEMENTING A PCI COMPLIANT REMOTE WORKFORCE SETUP
Since the beginning of the COVID-19 pandemic, many companies have shifted to allowing employees to work from home. It is important to remember that if cardholder data is processed, transmitted, or stored by employees working from home, their home environment will be part of the organization's PCI scope.
THE SCOPE OF THE REMOTE WORK CDE
When scoping a work-from-home implementation where employees will be collecting or processing cardholder data, begin by mapping out the flow of cardholder data.
Questions to answer:
· How is data being received by the employees (e.g., over the phone, fax, Internet communications)?
· Once this data is received, how are employees processing the data? · What devices and network segments are involved in the transmission of
cardholder data? · Is cardholder data being stored electronically or on paper? · What type of voice communication channels are involved? · If cardholder data is received over the phone, are calls being recorded?

2022 Guide to PCI DSS Compliance ­ Introduction | 61
Realize that any system involved in the storage, processing, or transmission of cardholder data is in-scope for your environment, as is any system that can affect the security of these devices.
EXTENDING THE EXISTING CDE
Many organizations will already have an existing CDE with mature controls designed to protect customer data. When implementing a work-from-home scenario, attempt to leverage the tools and security controls that exist in the corporate environment. Assume that the employee's home network and computer are not a secure option for processing payments. You can maintain the security stance of your CDE by extending your CDE network via VPN connectivity and providing company-owned mobile devices that have been hardened and can be managed remotely. Also, keep in mind that split tunneling should be disabled in order to maintain proper network segmentation. Most enterprise phone deployments have moved to Voice over IP (VoIP). VoIP offers great flexibility that can also be leveraged in a work-fromhome scenario. If your CDE includes telephone-order options, send VoIP endpoints home with your employees that will extend your VoIP system over an encrypted connection (such as a VPN). For more information on protecting voice communications, see the PCI SSC's guidance on Protecting Telephone-based Payment Card Data.

RISK REDUCTION STRATEGIES
If you are unable to extend your CDE network to remote locations, implementing P2PE may be a good option to reduce both the cost of compliance and the risk to your customer's payment data. There are a variety of P2PE devices that can be used to input cardholder data. Some of these devices are standalone terminals, while others can be used as a USB connected keypad. Implementing a P2PE endpoint may allow you to keep the employees' computer and network out of scope for your environment.
CLOSE DATA SECURITY AND COMPLIANCE GAPS, GET A PCI DSS AUDIT.
Learn More

2022 Guide to PCI DSS Compliance ­ Introduction | 63
FORENSIC PERSPECTIVE
INTRODUCTION
SecurityMetrics Payment Card Industry Forensic Investigators (PFIs)* thoroughly analyze the point-of-sale (POS) or e-commerce environments of organizations that suspect a payment card data compromise. Through a forensic examination of the in-scope computer systems related to the processing of customer payment card information, data acquired from the breach site can reveal when and how the breach occurred, contributing vulnerabilities, and aspects of the IT environment out of compliance with the PCI DSS. SecurityMetrics Forensic Investigators have witnessed the rise and fall of popular attack trends over 20 consecutive years. Comparing 2021 forensic trends to previous years, SecurityMetrics' Forensic Investigators conducted more investigations of e-commerce environments than of point-of-sale (POS) environments. The following section will further discuss predicted trends for 2022.
*SecurityMetrics PFIs are Qualified Security Assessors, but do not perform a complete QSA audit of each PCI requirement during a PCI forensic investigation. PCI DSS requirement data is analyzed to the extent observed throughout the course of an investigation.

2022 Guide to PCI DSS Compliance ­ Introduction | 65

2022 Guide to PCI DSS Compliance ­ Introduction | 67

2022 Guide to PCI DSS Compliance ­ Introduction | 69

2022 FORENSIC PREDICTIONS
PREDICTION 1 PAYMENT IFRAME BREACH VIA BROWSER VULNERABILITY OR ZERO-DAY ATTACK
SecurityMetrics forensic investigators have continued to see a surge in iFrame compromises.
In a typical iFrame compromise, we often see where a customer attempts to make a purchase on an ecommerce website and an error message indicates that they need to re-enter their card information. In fact, there was no error. In the first form submission, the credit card data goes to the attacker; the second submission goes to the processor.
However, we predict that there will be more payment iFrame breaches with transparent payment completion (i.e., no suspicious pop up errors). These invisible heists will likely happen via zero-day browser exploits or other javascript based attacks.
By utilizing some of these zero-day attacks, the customer only needs to enter their information once. The attacker would then be able to collect their payment information and send it to the processor without the customer or merchant being aware that anything was amiss.
We're going to see iFrames broken through this method, where they use the browser itself to capture credit card data. Javascript libraries such as node. js and angular.js are also under constant threat.

PREDICTION 2 MOBILE DEVICES WILL BECOME A PRIMARY TARGET OF CREDIT CARD SKIMMERS
While never completely immune, mobile device processing (e.g., tablet, cell phone) to accept credit card transactions has been an area where we typically have not seen a lot of skimming.
However, as more and more ecommerce is happening on mobile devices, we expect mobile device processing will soon become card skimmers' new playground, both on the merchant side and customer side.
In the past we've seen a hacker tool (i.e., Inter) that was designed to insert skimmers on the checkout page inside of a desktop browser. Recently, this tool has been reconfigured (and renamed as MobileInter) to inject skimmers that run on your phone's browser instead of a desktop browser.

PREDICTION 3 INCREASE IN USE OF ANTI-FORENSIC TECHNIQUES OF CREDIT CARD SKIMMERS
The harder it is for a forensic analyst to detect an attack, the longer that attack goes on, with even more cardholder data being lost.
The range of tools being used covers data hiding (e.g., rootkits, encryption, steganography), artifact wiping (e.g., disk cleaner, free space and memory cleaners, prophylactic), trail obfuscation (e.g., log cleaners, spoofing, misinformation, zombied accounts, Trojan commands), and attacks against cyber forensics processes/tools (e.g., file signature altering, hash fooling, nested directories).
We're going to see more of this occurring on the mobile platform.
This is even more reason to regularly update your defensive tools (e.g., antivirus), since these tools will try to identify some of these attacks to the best of their ability.

2022 Guide to PCI DSS Compliance ­ Introduction | 71
PREDICTION 4 RISE OF RANSOMWARE WITHOUT ENCRYPTION
Ransomware traditionally will lock a computer and encrypt its files. If you want to access your files again, you have to pay the ransom.
However, there will be a shift from solely encrypting files to collecting and holding onto the confidentiality of your files, which are put at ransom.
Hackers will disclose that they've captured your data, and if you don't want your competitors to receive this information, have your information publicly disclosed, or for the sensitive information to be sold on the dark web, you will need to pay the ransom.
This shift is because more businesses have been following cyber security best practices, ensuring that they have backups that are current and disconnected from their network.
Because many organizations are better prepared to deal with the consequences of a traditional ransomware attack, the attackers were receiving fewer large ransoms, so cyber criminals are moving on to extortion.
In one case, we saw that a company paid to have their data unlocked, then had to pay to have the attackers not publish the data. The attackers then came back six months later saying, "We still have your data. We're going to need another payment in order to keep this information confidential." The bad thing is that they still have your data, and there could essentially be no end to them coming back for more money.

2022 Guide to PCI DSS Compliance ­ PCI DSS REQUIREMENTS | 73
PCI DSS REQUIREMENTS

REQUIREMENT 1
PROTECT YOUR SYSTEM WITH FIREWALLS
Network firewalls are vital for your security. A firewall's purpose is to filter potentially harmful Internet traffic and protect valuable sensitive data. Simply installing a firewall on your organization's network perimeter doesn't make you secure.

HARDWARE FIREWALLS

A hardware firewall­or perimeter

If your firewall is not

firewall­is typically installed at the

perimeter of an organization's network configured and maintained

to protect the internal networks from properly, your network is

the Internet. Hardware firewalls are not secure.

also used inside an environment to

create isolated network segments. Higher security internal

network segments are created to limit access to sensitive data from

unnecessary networks.

In summary, a properly configured hardware firewall acts as the first line of defense and blocks unwanted network access.

You also need a firewall between the systems that store sensitive data and other systems on your network. Typically, this is a second hardware firewall installed inside your corporate network to create a secure zone to further protect sensitive data.

PROS HARDWARE FIREWALL
Most robust security option
Protects an entire network Can segment internal parts of a network

CONS HARDWARE FIREWALL
Rules need to be carefully documented
Difficult to configure properly
Needs to be maintained and reviewed regularly

2022 Guide to PCI DSS Compliance ­ Requirement 1 | 75
1

SOFTWARE FIREWALLS
Many personal computers come with pre-installed software firewalls. This feature should be enabled and configured for any laptop computers that commonly connect to sensitive data networks.
For example, if a sales manager accidentally clicks on a phishing email scam, their computer's software firewall should stop the malware from propagating throughout the corporate network.

PROS SOFTWARE FIREWALL
Protects mobile workers when outside the corporate network
Easier to maintain and control
Inexpensive

CONS SOFTWARE FIREWALL
Should not replace hardware firewalls for network segmentation
Doesn't protect an entire network
Fewer security options

PROPERLY CONFIGURE FIREWALLS
A common mistake regarding firewalls is assuming they are a plug-andplay technology. After initial installation, additional effort is almost always necessary to restrict access and protect the CDE.
The end goal of firewall implementation is to filter potentially harmful Internet traffic and other untrusted networks to protect valuable confidential data. In e-commerce applications, a firewall should be used to limit traffic to only essential services needed for a functioning CDE. By identifying sensitive systems and isolating them through the proper use of firewalls (e.g., network segmentation), merchants can more precisely control what type of access is allowed in and out of these zones and more easily protect payment data.
In a recent data breach investigation conducted by SecurityMetrics Forensic Investigators, an organization had a sophisticated security and IT system. However, amongst 300 pages of firewall rules (with about 100 rules on every page), two incorrectly written firewall rules essentially negated the whole firewall, leaving the entire network exposed. It was through this vulnerability that the attacker accessed their network and stole sensitive data.

2022 Guide to PCI DSS Compliance ­ Requirement 1 | 77
1
FIREWALL CONFIGURATION BEST PRACTICES
1. CREATE FIREWALL CONFIGURATION STANDARDS: Before implementing firewall settings and rules on the hardware, carefully document settings and procedures such as: hardware security settings, port/service rules needed for business, justify the need for rules, consider both inbound and outbound traffic, etc.
2. TRUST BUT VERIFY: After implementing firewall rules/settings, test the firewall appropriately externally and internally to confirm settings are correct (e.g., pen test, scans).
3. LIMIT OUTBOUND TRAFFIC: Often, we worry too much about blocking inbound ports/services and forget that outbound traffic from inside the network should be limited to just what is needed. This limits hackers' paths for exfiltrating data.
4. PERSONAL FIREWALLS: Configure personal firewalls on mobile computing platforms to limit attack surfaces and minimize the propagation of malware when on unsecured networks.
5. MANAGEMENT: Only manage the firewall itself from within your network. Disable external management services unless they're part of a secure managed firewall infrastructure.

NETWORK SEGMENTATION
Merchants often set up flat networks, meaning everything inside the network can connect to everything else. They may have one firewall at the edge of their network, but that's it. There's no internal segmentation, making it a "flat network."
Flat networks make security difficult because if an attacker gets inside, they have access to everything.
Initial intrusion of many recent investigated data breaches began in areas of an organization's network that shouldn't have given the attacker access to the CDE. For example, since an organization's network was configured as a flat network, it was not difficult for the attacker(s) to migrate from the point of entry (e.g., employee laptop, work station) to the CDE or other sensitive systems.
Firewalls can be used to segment an organization's network. When businesses create a secure payment zone­firewalled off from the rest of the day-to-day business traffic­they can better ensure their CDE only communicates with known and trusted sources. This limits the size of the CDE and potentially lowers your PCI scope.
For example, you install and configure a multi-interface firewall at the edge of your network. From there, you create one interface on the firewall dedicated just to the systems that store, process, and transmit cardholder data. If that interface doesn't allow any other traffic in or out of any other zones, this is proper network segmentation.
Segmentation is not necessarily required in order to be compliant with PCI DSS. However, if you're looking for one of the easiest ways to reduce cost, effort, and time getting in-scope systems compliant, you may want to consider segmentation.
Segmentation can be tricky, especially for those without a technical security background. Consider having a security professional double-check all your segmentation work by performing regular segmentation checks.

2022 Guide to PCI DSS Compliance ­ Requirement 1 | 79

SSEEGGMMEENNTTEEDDNNEETTWWOROKREKXEAMX APLMEPLE

1

INTERNET

FIREWALL
CDE
SERVER DESKTOP PC
VLAN 1

NON-CDE
DESKTOP PC LAPTOP
VLAN 2

GUEST WIFI
SMARTPHONE TABLET
VLAN 3

TEST AND MONITOR CONFIGURATION
Rules and environments change over time, no matter the size of your organization. Firewall rules should be reviewed (and revised when necessary) over the course of a few months or at least every six months.

TIPS FROM AN AUDITOR
REQUIREMENT 1
ESTABLISH THOROUGH FIREWALL ARCHITECTURE

JEN STONE
SecurityMetrics Principal Security Analyst | CISSP | CISA | QSA | CCSFP | CHQP

Large environments typically have firewalls in place, at least at the network's perimeter. Make sure to choose firewalls that support the necessary configuration options to protect critical systems and provide segmentation between the CDE and other internal and external networks.

Smaller organizations sometimes struggle to understand firewalls, not having the necessary in-house expertise to configure and manage them correctly and securely. If this is the case, contract a PCI-validated thirdparty service provider to provide assistance, rather than simply deploying a firewall's default configuration and hoping for the best.

It may seem obvious, but leave as few holes as

It's best to start by having a "block everything" mentality, and then add exceptions as needed. PCI

possible in your firewall.

DSS requires you to document a valid business justification for any

communication allowed to or from the CDE. Spend the time to identify

the specific source and destination addresses your systems need to

communicate with for a given service or protocol.

2022 Guide to PCI DSS Compliance ­ Requirement 1 | 81

""Firewalls are a first line of defense, so pay special attention to the logs and

1

alerts firewalls

"genera"te. Don't just allow all access to the Internet because it's easier. Along the
same line, if you or any third parties remotely support your environment, limit that inbound access to specific sources and protocols.
Often, the volume of log data can be overwhelming, so some merchants turn logging off or send alert messages directly to the junk bin. It's

important (and required) to review firewall logs daily to identify patterns

and activity that indicate attempts to breach your security. There are many

good software packages available to help you deal with the volume of log

data and automate alerts. This will help you pick out the important data

that requires action.

For requirement 1, remember the following:
» Start with a "block everything" mentality, then work backward.

» Pay attention to what logs tell you.

» Review firewall configurations frequently and adjust as necessary.

REQUIREMENT 1 IT CHECKLIST
FIREWALL IMPLEMENTATION AND REVIEW
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· Firewall(s) · "Deny All" rule for all other inbound and outbound traffic (1.2.1.b) · Stateful inspection/dynamic packet filtering (1.3.5) · Documented business justification for each port or protocol allowed
through the firewall (1.1.6a)
THINGS YOU WILL NEED TO DO:
· Limit traffic into the CDE to that which is necessary. (1.2.1.a) · Position firewall(s) to prohibit direct inbound and outbound traffic from
the CDE. (1.3) · Create secure zone(s) for any card data storage, which must be separate
from DMZ. (1.3.6) · Explicitly authorize outbound connections from the CDE. (1.3.4) · Document all firewall policies and procedures.
(1.2.1.a, 1.2.1.b, 1.2.3, 1.3, 1.3.3, 1.3.5, 1.3.6) · Review firewall logs daily for potential breach activity

2022 Guide to PCI DSS Compliance ­ Requirement 1 | 83

THINGS YOU MAY NEED TO DO:

1

· Install a firewall between wireless networks and the CDE (wireless only). (1.2.3)

NOTES:

REQUIREMENT 2
USE ADEQUATE CONFIGURATION STANDARDS
DEFAULT PASSWORD WEAKNESSES
Out-of-the-box devices, such as routers or POS systems, come with factory settings like default usernames and passwords. Defaults make device installation and support easier, but they also mean every model originates with the same username and password. Default passwords are easy to guess, and many are published online.
Businesses are often unaware that default settings are used in their environment, due to third-party installation.
In one SecurityMetrics forensic investigation, it was discovered that a third-party IT vendor purposely left POS system default passwords in place to facilitate easier future system maintenance. Default passwords might make it easier for IT vendors to support a system without learning new passwords each time, but convenience is never a valid reason to forego security, nor will it reduce liability.
When defaults aren't changed, it provides attackers an easy gateway into a system, which is why changing vendor defaults on every system with exposure to your CDE is so vital.
Passwords must be changed every 90 days and contain at least seven characters, including numbers and letters.
Passwords that fall short of these criteria can easily be broken using a password-cracking tool.

2022 Guide to PCI DSS Compliance ­ Requirement 2 | 85
2
SYSTEM HARDENING
Any system used in your CDE needs to be hardened before it goes into production. The goal of hardening a system is to remove unnecessary functionality and configure what functionality is left in a secure manner. Every application, service, driver, feature, and setting installed on a system introduces vulnerabilities. According to requirement 2.2, you must "address all known security vulnerabilities and [be] consistent with industry-accepted system hardening standards." Here are some recommended resources for system hardening:
» Center for Internet Security (CIS) » International Organization for Standardization (ISO) » SysAdmin Audit Network Security (SANS) Institute » National Institute of Standards Technology (NIST)

SYSTEM CONFIGURATION MANAGEMENT
Consistency is key when trying to maintain a secure environment. Once system hardening standards and settings have been defined and documented, it is critical that they are applied to all systems in the environment in a consistent manner. Once each system and device in the environment has been appropriately configured, you still have work to do.
Make sure someone is responsible for keeping the inventory current and based on what is actually in use.
This way, applications and systems that are not approved for use in the CDE can be discovered and addressed.
Many organizations, especially larger ones, turn a system management software solution to assist in gathering and maintaining this inventory. These applications can scan and report on hardware and software used in a network and also detect when new devices are brought online. These tools are often able to enforce configuration and hardening options, alerting administrators when a system isn't compliant with your internal standard.

2022 Guide to PCI DSS Compliance ­ Requirement 2 | 87

CLOSE DATA

2

SECURITY AND

COMPLIANCE GAPS,

GET A PCI DSS AUDIT.

Learn More

TIPS FROM AN AUDITOR
REQUIREMENT 2
SYSTEM CONFIGURATION
JEN STONE
SecurityMetrics Principal Security Analyst | CISSP | CISA | QSA | CCSFP | CHQP You are required to use industry-accepted configuration and hardening standards when setting up systems that are part of your PCI scope. Configuration and hardening requirements apply to all computer systems, network devices, and applications used to process or secure card data. This may include things like web servers, database software, firewalls, point-ofsale systems, or workstations used to process credit card transactions. Examples of system hardening practices include:
· Disabling services and features you don't use · Uninstalling applications you don't need · Limiting systems to perform a single role · Removing or disabling default accounts · Changing default passwords · Configuring other security settings

2022 Guide to PCI DSS Compliance ­ Requirement 2 | 89
""Permitting 2 anything unnecessary to remain on your systems opens you up to
ad"ditional ris"ks. Often, organizations get overwhelmed trying to understand how and
where to begin implementing system configuration standards, especially in an environment that has expanded and changed over time.
The first step in securing your environment to meet PCI standards is to understand where credit card data is stored, processed, and transmitted. Begin by documenting the flow of cardholder data through your environment, making a list of each system, device, and application it touches along the way. Next, look at the systems and applications that, while not directly touching the data, can affect the security of those that do. Add this information to your documentation.
The key to effective system configuration and hardening is consistency. Once you have identified the systems and applications that need attention and documented a standard that meets your environment's requirements, make sure processes are in place to follow this standard as time goes on. Keep your standard and process up to date as your business changes and as you discover new threats and vulnerabilities.
Automated tools can simplify the task of enforcing configuration standards, allowing administrators to quickly discover systems that are out of compliance.

REQUIREMENT 2 IT CHECKLIST
CONFIGURATION STANDARDS
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· A secure way to access and manage systems in your environment (2.3) · An inventory of all hardware and software used in your CDE · Documented configuration standards for all types of systems in your CDE
THINGS YOU WILL NEED TO DO:
· Assign system administrator and knowledgeable personnel the responsibility of configuring system components. (2.2.4)
· Implement a system hardening guide that covers all system components of your CDE. (2.2.a)
· Disable and uninstall any unnecessary programs, services, guest accounts, scripts, drivers, features, subsystems, file systems, and web servers. Document which services and programs are allowed. (2.2.2, 2.2.3, 2.2.5)
· Change vendor-supplied default usernames and passwords. Remove or disable unnecessary default accounts before installing a system on the network (e.g., operating systems, security software, POS terminals, routers, firewalls, SNMP). (2.1.a, 2.1.b, 2.1.1.b, 2.1.1.c, 2.1.1.d, 2.1.1.e)
· Document security policies and operation procedures for managing vendor defaults and other security settings. Inventory all systems within scope of the payment application environment and keep inventory up to date. (2.4, 2.5)

2022 Guide to PCI DSS Compliance ­ Requirement 2 | 91

THINGS YOU MAY NEED TO DO:

· Use technologies, such as VPN, for web-based management and other non-

console administrative access. Ensure all traffic is encrypted according to

current standards. (2.1.1.d, 2.3)

2

· If wireless Internet is enabled in your CDE, change wireless default settings including encryption keys, passwords, and SNMP community strings. (2.1.1)

· Enable only one primary function per server (e.g., logging server, web server, DNS). (2.2.1)

NOTES:

REQUIREMENT 3
SECURE CARDHOLDER DATA
ENCRYPT CARDHOLDER DATA
According to requirement 3, stored card data must be encrypted using industry-accepted algorithms (e.g., AES-256). The problem is many organizations unknowingly store unencrypted primary account numbers (PAN), often because of misconfigured software.
Not only must card data be encrypted, but the encryption keys must also be protected. Not protecting the encryption key location using a solid PCI DSS encryption key management process is like storing your house key in your front door lock.

2022 Guide to PCI DSS Compliance ­ Requirement 3 | 93
Assign the responsibility of keeping unencrypted card data off your systems to an individual or team. Have this person or team define, document, and follow a process of periodic data discovery cycles to recheck and ensure systems remain clean of unencrypted card data.
2022 PANSCAN® DATA ANALYSIS 3
Storage of unencrypted payment card data increases an organization's risk and liability in the event of a data breach.
Since 2010, SecurityMetrics PANscan® has discovered over 3 billion unencrypted PANs on business networks. In 2021, users scanned over 2,500 computers and 208,444 GBs. Here are some key statistics:

KNOW WHERE ALL CARDHOLDER DATA RESIDES
An essential part of eliminating stored card data is using a valid cardholder data discovery tool and methodology. These tools help identify the location of unencrypted PAN so you can securely delete or encrypt it. They also help identify which processes or flows might need to be fixed.
Remember, payment card data can easily leak due to poor processes or misconfigured software. Start by looking where you think the data is, and then look where it shouldn't be.
You should create and document a current cardholder flow diagram for all card data flows in your organization. A CHD flow diagram is a graphical representation of how card data moves through an organization. As you define your environment, it's important to ask all organizations and departments if they receive cardholder information, and then define how their answers may change CHD flows.
To accurately craft your CHD flow diagram, ask yourself:
» What device(s) am I using for transactions? A virtual terminal? POS system?
» What happens to the card data after a transaction?
» When is data encrypted? Is it even encrypted at all?
» Do I store card data before it's sent to the processor for approval?
» How and when does settlement occur? Real time or end of day?
» How is data authorized and returned by the processor?

2022 Guide to PCI DSS Compliance ­ Requirement 3 | 95

» Is card data backed up on my system? Are backups encrypted? Is my backup server at a different data location?

» Where might card data be going or moved in

3

processes not part of authorization and settlement?

Once you identify new processes, you can begin to determine how to either fix the process or add it into your normal environment flow.
Below is a table which describes which CHD elements can and cannot be stored, as well as when encryption is required:

TYPE OF DATA
Cardholder Data
Sensitive Authentication Data

DATA ELEMENT
Primary account number (PAN)
Cardholder name Service code
Expiration date Full track data CAV2 / CVC2 /
CVV2 / CID PIN/PIN block

STORAGE ALLOWED

ENCRYPTION REQUIRED

Yes

Yes

Yes

No

Yes

No

Yes

No

No

Not allowed to store

No

Not allowed to store

No

Not allowed to store

TIPS FROM AN AUDITOR
REQUIREMENT 3
PROTECT CARDHOLDER DATA
BEN CHRISTENSEN
SecurityMetrics Senior Security Analyst | CISSP | CISA | QSA
Don't keep any data you don't need. If you only need the last four numbers of PAN, get rid of the rest! For each element of cardholder data, ask yourself if you really need it or if it is just nice to have. I have found that some companies have a lot of data they really don't need and never ask if they need it. The more data you keep, the higher the risk. IT should work closely with all business groups to decide what data the company needs, where to store it, and for how long. Data retention policies are key to ensuring that your data has the appropriate controls. Periodic assessments of data retention and data mappings should be performed. Data requirements might change over time, so check often.

2022 Guide to PCI DSS Compliance ­ Requirement 3 | 97

""Get rid of any data that you don't need, since the more data that's kept, the higher

3

""risk there is.

It is important to know what data you actually store, process, and/or transmit. If you don't know what you have, it is difficult to implement the correct controls around it. Data flow mapping helps you understand the data coming in to and out of your organization. Create data flow diagrams for your entire organization (on all information you deem sensitive), not just for your CDE environments. You might miss something if you only focus on the CDE and CHD.
In addition, use automated tools that can help you search for and find unencrypted CHD. You will be surprised what you find outside of your CDE. Run these tools often to ensure data is where it should be.

REQUIREMENT 3 IT CHECKLIST
SECURING CARDHOLDER DATA
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· A documented data retention policy · A data flow diagram
THINGS YOU WILL NEED TO DO:
· Have employees acknowledge their training and understanding of the policy. (3.1, 3.6.8, 3.7)
· Eliminate storage of sensitive authentication data after card authorization. (3.2.d, 3.2.1, 3.2.2, 3.2.3)
· Mask out PAN on customer receipts. (3.3) · Understand guidelines for handling and storing cardholder data.
THINGS YOU MAY NEED TO DO:
· If PAN data is stored for business or legal reasons, details must be masked, truncated, or secured by strong cryptography. (3.4)
· PAN storage should be accessible by as few employees as possible for business or legal reasons. This includes limited access to cryptographic keys, removable media, or hardcopy of stored details. (3.4.1, 3.5, 3.5.2, 3.5.3, 3.5.4, 3.6, 3.6.1, 3.6.2, 3.6.3, 3.6.4, 3.6.5, 3.6.6, 3.6.7)

NOTES:

2022 Guide to PCI DSS Compliance ­ Requirement 3 | 99

3

REQUIREMENT 4
SECURE DATA OVER OPEN AND PUBLIC NETWORKS
For requirement 4, you need to identify where you send cardholder data. The following are common places PAN are sent:
» Processors
» Backup servers
» Third parties that store or handle PAN
» Outsourced management of systems or infrastructure
» Corporate offices
You need to use encryption and have security policies in place when you transmit cardholder data over open, public networks.
STOP USING SSL/EARLY TLS
Based on vulnerabilities in web encryption, discontinue or remove all instances of SSL and early TLS, unless existing implementation is necessary for regular business operations. The only acceptable use of these outdated protocols is if your POS/POI hardware currently in use does not support later versions of secure TLS.
Your systems may still be using SSL and early TLS, so you should contact your terminal providers, gateways, service providers, vendors, and acquiring banks to determine if the applications and devices you use have this encryption protocol.

2022 Guide to PCI DSS Compliance ­ Requirement 4 | 101
Examples of applications that may still use SSL/early TLS include: » POS/POI hardware terminals
4 » Virtual payment terminals » Back-office servers » Web/application servers
The PCI Council believes that SSL and early TLS will no longer protect cardholder data.
Please note that organizations using POS/POI terminals with existing implementations of SSL and early TLS must ensure that the devices in use are not susceptible to any known exploits for these insecure protocols. Check with your merchant bank or POS/POI supplier if you have questions about that. Merchants that have older POS/POI terminals that still use the insecure SSL/TLS protocols still should have a Risk Mitigation and Migration Plan in place. According to the PCI Council, this document will "detail [your] plans for migrating to a secure protocol, and also describe controls [you have] in place to reduce the risk associated with SSL/early TLS until the migration is complete."

TIPS FROM AN AUDITOR
REQUIREMENT 4
SENDING DATA OVER OPEN AND PUBLIC NETWORKS
BEN CHRISTENSEN
SecurityMetrics Senior Security Analyst | CISSP | CISA | QSA
Build off of the data flow diagrams discussed in the tips in Requirement 3. Know exactly where CHD is coming from and being sent to inside and outside of your organization. Make sure your CHD is encrypted when transmitted over open public networks using strong and industry-accepted encryption technologies. Are you using strong encryption on all CDE impacting services? I have noticed that some companies are still using older technologies even though the latest is also supported. For example, CDE web servers using TLS 1.2 are still accepting connections using TLS 1.0. Disable all insecure protocols and encryption.

2022 Guide to PCI DSS Compliance ­ Requirement 4 | 103

""Organizations should leverage tools that can analyze web services and

4

report any

"" insecure setups.

Companies should also leverage tools that can analyze web services and report any insecure setups. You may not be aware of all your services accessible over the Internet. Run these tools often to help ensure you are using acceptable protocols and encryption strengths.

REQUIREMENT 4 IT CHECKLIST
TRANSMITTING CARDHOLDER DATA
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· An in-house policy to ensure you do not send unprotected PANs via end-user messaging technologies (4.2.b)
THINGS YOU WILL NEED TO DO:
· Check all related device configuration for proper encryption. Check with vendors to make sure supplied POS/POI devices are encrypting data appropriately. (Appendix A2)
· Validate that POS/POI devices are not susceptible to any known exploits. Devices and software used to process credit cards need to be PCI DSS compliant. (Appendix A2.1)
· Review all locations where CHD is transmitted or received. Examine system configurations. Review all devices and systems to ensure you use appropriate encryption within your CDE. You must safeguard sensitive cardholder data during transmission over open, public networks. (4.1, 4.1.1)
· Use only trusted keys and certificates. Check inbound/outbound transmissions and verify that encryption keys and certificates are valid. Use secure configurations and proper encryption strengths. Do not support insecure versions or configurations. This means you will continually need to check for the latest encryption vulnerabilities and update as needed. (4.1)
· Review and implement documented encryption standard best practices (4.1.1)

2022 Guide to PCI DSS Compliance ­ Requirement 4 | 105

· Review and implement policies and procedures for sending and receiving credit card data. (4.2.b)
· Examine system configuration and adjust encryption configuration as needed. (4.1, 4.1.1)

THINGS YOU MAY NEED TO DO:

· Make sure TLS is enabled whenever cardholder data is transmitted or

received through web-based services. (4.1.a, 4.1.e)

· Check wireless network encryption standards. (4.1.1)

4

· Examine keys and certificates. (4.1.b)

· If you are a service provider supporting older POS/POI terminals, review your Risk Mitigation and Migration Plan for environments that still need to use SSL and early TLS. (Appendix A2.2)

· Prohibit the use of WEP­an insecure wireless encryption standard. (4.1.1)

NOTES:

REQUIREMENT 5
PROTECT SYSTEMS WITH ANTI-VIRUS
REGULARLY UPDATE YOUR ANTI-VIRUS
Anti-virus software needs to be installed on all systems commonly affected by malware, regardless of its location. Make sure anti-virus or anti-malware programs are updated on a regular basis to detect known malware. Maintaining an up-to-date anti-malware program will prevent known malware from infecting systems.
Depending on your relationship with your POS vendor, they may or may not maintain your anti-virus scanning. If your vendor doesn't handle your antivirus, it's up to you to ensure regular scanning is conducted.
Using outside sources such as the United States Computer Emergency Readiness Team (US-CERT), SANS Institute, and vendor/anti-virus threat feeds, you can identify emerging malware and attacks on systems. Then configure systems to alert and report on suspicious activity, such as new files added to known malware directories or unauthorized access attempts.
Vigilant vulnerability management is the most effective way for you to proactively reduce the window of compromise, greatly narrowing the opportunity for hackers to successfully attack your systems and steal valuable data. As part of your vulnerability management strategy, make sure to include updated anti-virus software.

2022 Guide to PCI DSS Compliance ­ Requirement 5 | 107
CLOSE DATA SECURITY AND COMPLIANCE GAPS, GET A PCI DSS AUDIT.
5 Learn More

TIPS FROM AN AUDITOR
REQUIREMENT 5
IMPLEMENT AND UPDATE YOUR ANTI-VIRUS
MICHAEL OHRAN
SecurityMetrics Security Analyst | CISSP | CISA | QSA | SSF | SSL
System administrators have the responsibility of making sure their antivirus software, including the signatures, are up to date.
After a software upgrade, verify that signatures are able to be updated. The new software may use different firewall rules or directory permissions, requiring some system configuration changes to ensure signature updates continue.

2022 Guide to PCI DSS Compliance ­ Requirement 5 | 109
System admins need to make
sure their antivirus software are up to date.
""""5
PCI DSS requires anti-virus software to be installed on all systems that are commonly affected by malware (e.g., Windows). While Linux servers are often considered systems not commonly affected by malware, it's highly recommended that anti-virus software be installed for any web-facing Linux servers.

REQUIREMENT 5 IT CHECKLIST
ANTI-VIRUS UPDATES
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO DO:
· Deploy anti-virus software on commonly affected systems (5.1, 5.2) · Protect all systems against malware and regularly update anti-virus software
or programs. (5.1, 5.2.b) · Ensure anti-virus programs can detect, remove, and protect against all known
types of malicious software. (5.1.1) · Maintain and evaluate audit logs with IT staff. (5.2.c) · Set anti-virus program to scan automatically. (5.2.b) · Make sure anti-virus program is updated automatically (with definitions kept
current). (5.2.a, 5.2.b) · Ensure anti-virus program cannot be disabled or altered by users (i.e., admin
access only). (5.3) · Document and review malware procedures; review with necessary staff. (5.4) · Examine system configurations and periodically evaluate malware threats
to system. (5.1.2)

NOTES:

2022 Guide to PCI DSS Compliance ­ Requirement 5 | 111

5

REQUIREMENT 6
UPDATE YOUR SYSTEMS
REGULARLY UPDATE AND PATCH SYSTEM(S)
Application developers will never be perfect, which is why updates to patch security holes are frequently released. Once a threat actor knows they can get through a security hole, they pass that knowledge to other criminals who could then exploit this weakness until a patch has been deployed.
Quickly implementing security updates is crucial to your security posture. Patch all critical components in the card flow pathway, including:
» Internet browsers
» Firewalls
» Application software
» Databases
» POS terminals
» Operating systems
Older Windows systems can make it difficult for merchants to remain secure, especially when the manufacturer no longer supports a particular operating system or version (e.g., Windows 7, Windows Server 2008 R2).
Operating system updates often contain essential security enhancements that are specifically intended to correct recently exposed vulnerabilities. When using an unsupported OS that doesn't receive such updates and patches, the vulnerability potential increases exponentially.

2022 Guide to PCI DSS Compliance ­ Requirement 6 | 113

Be vigilant about consistently updating software associated with your system. Requirement 6.2 states that organizations must "install critical patches within a month of release" to maintain compliance. Don't forget about critical software installations like credit card payment applications and mobile devices. To stay up to date, ask your software vendors to put you on their patch and upgrade notification list.

Keep in mind that the more systems, computers,

and apps your company has, the more potential

6

vulnerabilities it may be exposed to.

Another way to stay on top of vulnerabilities is through vulnerability scanning, which is arguably the easiest way to discover software patch holes that cyber criminals would use to exploit, gain access to, and compromise an organization.

ESTABLISH SOFTWARE DEVELOPMENT PROCESSES
If you develop payment applications in house (e.g., e-commerce websites, POS applications), you must use strict development processes and secure coding guidelines as outlined in the PCI DSS. Don't forget to develop and test applications according to industry-accepted standards like the Open Web Application Security Project (OWASP).

Be vigilant about consistently updating the software associated with your system.

2022 Guide to PCI DSS Compliance ­ Requirement 6 | 115

WEB APPLICATION FIREWALLS
Requirement 6.6 requires public-facing web applications to regularly monitor, detect, and prevent web-based attacks, such as implementing web application firewalls (WAF) in front of public-facing web applications. Even though these solutions can't perform the many functions of an all-purpose network firewall (e.g., network segmentation), they specialize in one specific area: monitoring and blocking web-based traffic.

PROS WEB APPLICATION FIREWALL
Immediate response to web application security flaws
Protection for third-party modules used in web applications
Deployed as reverse proxies

CONS WEB APPLICATION FIREWALL
Requires more effort to set up
Possibly break critical business functions (if not careful)
May require some network re-configurations

A WAF can protect web applications that are visible or accessible from the Internet. Your web application firewall must be up to date, generate audit logs, and either block cyberattacks or generate a cyber security
6
alert if it detects attack patterns.

TIPS FROM AN AUDITOR
REQUIREMENT 6
SYSTEM UPDATING AND SOFTWARE DEVELOPMENT
MICHAEL OHRAN
SecurityMetrics Security Analyst | CISSP | CISA | QSA | SSF | SSL
System administrators have the responsibility to ensure that all system components (e.g., servers, firewalls, routers, workstations) and software are updated with critical security patches within 30 days of public release. If not, these components and software are vulnerable to malware and security exploits.
Quickly implementing security updates is crucial to your security postures.
Systems or software might be excluded from updates because they weren't able to communicate with the update server (e.g., WSUS, Puppet). This broken communication could have resulted from a network or system configuration change. It's imperative that system administrators are alerted when security updates fail.

2022 Guide to PCI DSS Compliance ­ Requirement 6 | 117
""It's imperative that system administrators are alerted when security "updates f"ail. 6
Another important subsection of requirement 6 is the need to have proper change control processes and procedures.
Change control processes should include at least the following:
» Development/test environments must be separate from production with proper access control in place to enforce access rights.
» Separation of duties must be implemented between personnel assigned to development/test environments and those assigned to production.
» Production data (e.g., live credit card numbers, live personally identifiable information) must never be used in test/development environments.
» All test data and accounts must be removed before a production environment becomes active.
» Change control procedures related to implementing security patches and software modifications must be documented.

2022 Guide to PCI DSS Compliance ­ Requirement 6 | 119

Companies need to embrace the idea of change control for their software development and system patching/updating.
There are four requirements detailed by the PCI Council of what a proper change control procedure must contain:
» Changes must have a documented explanation of what will be impacted by the change.
» Changes must have documented approval by authorized parties.
» Changes to an organization's production environment must undergo proper iterations of testing and QA before being released into production.
» Change control procedures must always include a back-out or roll-back procedure in case the updates go awry.

When developing software (e.g., web applications), it's crucial that organizations adopt industry-accepted standards or best practices for coding, such as OWASP. This will guide them 6 in enforcing secure coding practices in their application development process and keep software code safe from malicious vulnerabilities (e.g., cross-site scripting, SQL injection, insecure communications, CSRF).
Insecure communications, for example, was in the spotlight since SSL and TLS 1.0 are no longer considered acceptable protocols when data is being transmitted over open, public networks. Everyone should be on TLS 1.2 now.

REQUIREMENT 6 IT CHECKLIST
SOFTWARE UPDATES
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· Vendor supported programs, operating systems, and devices (6.2) · An update server (i.e., repository for systems to get updates) · A change management process
THINGS YOU WILL NEED TO DO:
· Have a process in place to keep up to date with the latest identified security vulnerabilities and their threat level. (6.1, 6.5.6)
· Install all vendor-supplied security patches on all system components. (6.2.a) · Ensure all security updates are installed within one month of release. (6.2.b)
THINGS YOU MAY NEED TO DO:
· Set up a manual or automatic schedule to install the latest security patches for all system components.

NOTES:

2022 Guide to PCI DSS Compliance ­ Requirement 6 | 121

6

REQUIREMENT 7
RESTRICT ACCESS
RESTRICT ACCESS TO CARDHOLDER DATA AND SYSTEMS
You should have a role-based access control (RBAC) system, which grants access to cardholder data and systems on a need-to-know basis. Configuring administrator and user accounts helps prevent exposing sensitive data to those who don't need to know this information.
PCI DSS requires a defined and up-to-date list of the roles with access to the cardholder data environment. On this list, you should include each role, the definition of each role, access to data resources, current privilege level, and what privilege level is necessary for each person to perform their normal business responsibilities. Users must fit into one of the roles you outline.
Have a defined and up-to-date list of roles with access to the card data environment.
User access isn't limited to your normal office staff. It applies to anyone needing access to your systems behind the desk, such as an IT group or maintenance professional. You need to define and document what kind of user permissions they have.

2022 Guide to PCI DSS Compliance ­ Requirement 7 | 123
CLOSE DATA SECURITY AND COMPLIANCE GAPS, GET A PCI DSS AUDIT.
Learn More
7

TIPS FROM AN AUDITOR
REQUIREMENT 7
RESTRICT ACCESS
MICHAEL OHRAN
SecurityMetrics Security Analyst | CISSP | CISA | QSA | SSF | SSL
This requirement is one of the oldest and most basic parts of the PCI DSS (and data security in general).
There's no new trend or solution. But not all organizations accurately comply with this requirement or have even tried role-based access at all.

2022 Guide to PCI DSS Compliance ­ Requirement 7 | 125
This is all you need to know: don't give access to people who don't need it.
""""7
This is all you need to know: don't give access to people (or services) who don't need it. Cardholder data and card systems should only be accessible to those that need that information to do their jobs. Once you've implemented access privileges, make sure to document it.

REQUIREMENT 7 IT CHECKLIST
ESTABLISH ACCESS CONTROL
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· Written policy detailing access controls for systems in the CDE (7.1, 7.3)
REQUIRED FEATURES:
· Documented access control policies based on job classification and function (7.1, 7.1.1, 7.1.2, 7.1.3)
· Roles and privilege levels defined (7.1, 7.1.1) · "Deny all" rule in place for access control systems (7.2.3)
THINGS YOU WILL NEED TO DO:
· Detail a written policy to include access to cardholder data based on job roles with privilege level, and approval/documentation of employee access. (7.1, 7.1.4)
· Document policies in place with each employees' role/access and train employees on their specific access level. (7.1, 7.3)

2022 Guide to PCI DSS Compliance ­ Requirement 7 | 127
THINGS YOU MAY NEED TO DO:
· Implement access controls on any systems where cardholder data is stored and handled. (7.2.1)
· Configure access controls to only allow authorized parties and deny all others without prior approval or access. (7.2.2, 7.2.3)
NOTES:
7

REQUIREMENT 8
USE UNIQUE ID CREDENTIALS
WEAK PASSWORDS AND USERNAMES
If a username or password doesn't meet the recommended security standards for length, uniqueness, and complexity, that password will be a vulnerability that could allow an attacker to gain access to your environment and sensitive information. A weak password is vulnerable to a brute-force attack of guessing the password to a user account. Once the attacker has gained access, they will then work to escalate their account privileges through a variety of attack vectors, including: a brute force attack leveraging a rainbow table, a social engineering campaign or through exploiting an unpatched vulnerability.
Having a nondescript username and a strong password will make guessing your login credentials exponentially more difficult.
PCI DSS specifies that passwords must be changed every 90 days (the new password cannot be the same as any of the previous four passwords used) and must be comprised of either at least seven characters of both numbers and letters or have the complexity and strength that is at least equivalent to seven characters of both numbers and letters.
Passwords that fall short of this criteria can easily be broken using a password-cracking tool. Computing power continues to increase and what seems like a good password may in reality be easy to break.
The longer the password and the more special characters allowed, the more difficult it will be for an attacker to crack a password.
With this security comes a risk posed by human nature. When a password is too hard to remember, it is often written down and placed in an easy to access location. Be sure to review and update your company password policy so that increasing the complexity doesn't undermine security objectives.

2022 Guide to PCI DSS Compliance ­ Requirement 8 | 129

ACCOUNT MANAGEMENT
PCI DSS requires the disabling of default accounts and having unique user and admin account names instead of using system defaults or common usernames (i.e., admin, an organization's name, or a combination of the two). A company is much more secure if an attacker has to first guess the username before cracking its corresponding password.
Be sure that an account lock-out is set to at most six consecutive failed login attempts within a 30-minute period. Requiring an administrator to manually unlock accounts will discourage automated hacking methods.
The more manual steps hackers have to go through, the more likely it is they will move on to an easier target.

IMPLEMENT MULTI-FACTOR AUTHENTICATION

8

System security should not be based solely on the complexity of a single password. No password should be considered uncrackable. That's why multi-factor authentication (MFA) is an effective solution to secure remote access and is a requirement under the PCI DSS.

Configuring multi-factor authentication requires at least two of the three following factors:

· Something you know (e.g., a username and password, PIN number) · Something you have (e.g., hardware token, smartcard) · Something you are (e.g., a fingerprint, ocular scan, voiceprint)

A few examples of effective multi-factor authentication for remote access could include:
· The remote user enters their username and password, and then must enter an authentication code that is available to them through an RSA token in their possession.

Password A

Password A

OTP

One-time Password

(OTP)

· The remote user enters a password and biometric to log in to a smartphone or laptop. The individual then provides a single authentication factor (e.g., another password, digital certificate, signed challenge response) to connect to the corporate network.

Password Biometric

OTP

Signed Challenge or Response

2022 Guide to PCI DSS Compliance ­ Requirement 8 | 131

Your authentication mechanisms should be out-of-band and independent of each other. There should be a physical separation between mechanisms so that access to one factor does not grant access to another, and if one factor is compromised, it does not affect the integrity and confidentiality of any other factor.

Additionally, make sure that you "incorporate multi-factor authentication

for all remote network access (both user and administrator, and including

third-party access for support or maintenance) originating from outside the

8

entity's network."

If a remote access application configuration only requires a username and password to access sensitive data or systems and devices that store, process, or transmit cardholder data, the application has been configured insecurely.

TIPS FROM AN AUDITOR
REQUIREMENT 8
USE UNIQUE ID CREDENTIALS
MICHAEL MAUGHAN
SecurityMetrics Security Analyst | CISSP | CISA | QSA Requirement 8 is all about having unique ID information. You must have your own unique ID credentials and account on your systems and devices so that you can prove with audit log files who committed the error or malicious action. With a shared account a malicious user would be hard to uniquely identify.
Do not use generic accounts, shared group passwords, or generic passwords.
As a system administrator, best practice is to have a regular account that is used for day-to-day work and a different administrative account when performing administrative functions. Security professionals recognize that passwords are no longer sufficient to secure data. While passwords are still required, they simply are not secure enough. You must set strong, long passwords.

2022 Guide to PCI DSS Compliance ­ Requirement 8 | 133

You need different passwords for every
different service
""""that you use.
To meet PCI requirements, a password must contain at least seven
characters and be complex, with both alphabetic and numeric characters.

An easy way to remember complex passwords is by using passphrases.

Passphrases are groups of words with spaces in between (e.g., "Star Wars

8

ROS 2019 was WAY better than TLJ 2017!"). A passphrase can contain

symbols and upper- and lower-case letters. It doesn't have to make sense

grammatically. Passphrases are generally easier to remember but more

difficult to crack than shorter passwords.

In addition to strong passphrases, password manager software can help you use different passwords for all of your accounts. Some password managers can even work across multiple devices through the use of a cloud-based service. You need different passwords for different services so that if one service gets compromised, it doesn't bleed into other sites' passwords.

If your email account password is compromised and you use the same password across several devices, or even use that email address to receive the reset password emails from several websites, you have a major security problem on your hands.

REQUIREMENT 8 IT CHECKLIST
ID CREDENTIALS
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· Multi-factor authentication for all remote access (8.3)
THINGS YOU WILL NEED TO DO:
· Monitor all remote access accounts used by vendors, business partners, or IT support personnel when the account is in use. (8.1.5.b)
· Disable all remote access accounts when not in use. (8.1.5.a) · Enable accounts used for remote access only when they are needed. (8.1.5.a) · Implement a multi-factor authentication solution for all remote access
sessions. · Configure multi-factor authentication with at least two of the following
methods (8.3): · Something you know (e.g., password and username) · Something you have (e.g., one-time password) · Something you are (e.g., fingerprint or retinal scan)

NOTES:

2022 Guide to PCI DSS Compliance ­ Requirement 8 | 135

8

REQUIREMENT 9
ENSURE PHYSICAL SECURITY
CONTROL PHYSICAL ACCESS AT YOUR WORKPLACE
Employees may think physical security only applies after hours. However, most data thefts (e.g., social engineering attacks) occur in the middle of the day.
Mitigate the risk of physical threats by implementing physical security policies and procedures that preserve onsite business security for your critical assets and data. For example, if you keep confidential information, products, or equipment in the workplace, secure these items in a locked area. If possible, limit outsider access to one monitored entrance, and (if applicable) require non-employees to wear visitor badges.
Don't store sensitive information in the open. Many companies that have services requiring repeat billing or batch processing keep physical copies of credit card information in easily accessible areas for convenience. While this collection of paper copies may make life easier, it puts valuable cardholder data at risk of theft unless appropriate controls are in place.
Employee access to sensitive areas should be controlled and must be related to an individual's job function.

2022 Guide to PCI DSS Compliance ­ Requirement 9 | 137

To comply with this PCI DSS requirement, you must document:
· Who has access to secure environments and why they need this access · What, when, where, and why devices are used · A list of authorized device users · Locations where the device is and is not allowed · What applications can be accessed on the device · Logging of access attempts

Access policy and procedure documentation must be kept up to date and followed, especially when individuals are terminated or their job roles and responsibilities change.

Best practice is not to allow these removable devices to leave the office,

but if they do, consider attaching external GPS tracking and remote wipe

9

technology on all laptops, tablets, external hard drives, flash drives, and

mobile devices.

The majority of physical data theft takes only minutes to plan and execute.

Make sure all workstations and mobile devices have an automated timeout or logout (e.g., a password-protected screensaver pops up on a computer after a set amount of time). This reduces the window of opportunity for unauthorized users to access data from these devices and systems when nobody is looking.

KEEP TRACK OF POS TERMINALS
Organizations that use POS POI systems, PIN pads, and mobile payment devices are required to do three new things:
1. Maintain an up-to-date list of all devices (9.9.1) including physical location, serial numbers, make, and model.
2. Periodically inspect devices (9.9.2). You should ensure device surfaces haven't been tampered with, make sure serial numbers match, and check that seals haven't been broken. This could be a very large task depending on the size of your organization. Whether you inspect devices every day or every month is based on your tampering risk level (e.g., publicly accessible 24/7 gas station terminals vs. a behind-the-counter card swipe device). Document your findings.
3. Provide staff awareness training (9.9.3) for staff who interact with card-present devices on a day-to-day basis (e.g., cashiers), and record the who, what, and when for future reference. Training should include how to report suspicious behavior and what to do when third parties claim they need to work on your system. For example, rather than assuming IT support staff came in last night to install a new device on the side of a terminal, employees should be trained to question if it's supposed to be there, and then to notify management (according to documented incident response policies and procedures).
TRAIN EMPLOYEES EARLY AND OFTEN
While you may understand how to protect customer card information, your employees may not. That's why regular security training is so important.
Social engineering is a serious threat to both small and large businesses. A social engineer uses social interaction to gain access to private areas, steal information, or perform malicious behavior. Employees fall for social engineering attacks more often than you may think.
For example, if someone walked into your storefront and said they were there to work on your network and needed you to lead them to the server room, would your employees think twice to verify their identity?

2022 Guide to PCI DSS Compliance ­ Requirement 9 | 139
Train your employees to question unusual behavior. Establish a communication and response policy in case of suspicious behavior. Train employees to stop and question anyone who does not work for the company, especially if the person tries to enter the back office or network areas.

PHYSICAL SECURITY BEST PRACTICES

Most physical security risks can be prevented with little effort. Here are a few suggestions to improve your physical security:

· While working on your risk assessment, look for physical security risks.

· Lock all office doors and applicable equipment (e.g., mobile devices) when not in use day and night.

· Require passwords to access computers and mobile devices.

· Encrypt your data or don't store data on these devices.

· Use screensavers and privacy monitors on computers.

· Install and use blinds in all office windows.

· Keep logs of who enters and leaves.

9

· Keep track of devices that go in and out.

· Have policies in place for stolen equipment (e.g., a good incident response plan).

· Train staff against social engineering.

· Limit access to CHD through role-based access.

· Have staff report suspicious activity and devices.

· Monitor sensitive areas with video cameras and store the video logs for appropriate durations.

TIPS FROM AN AUDITOR
REQUIREMENT 9
IMPROVE YOUR PHYSICAL SECURITY
MICHAEL MAUGHAN
SecurityMetrics Security Analyst | CISSP | CISA | QSA Having electronic access on doors, using cameras to monitor all entries and exits to secure areas, implementing multiple levels of access based on a business need, and approving visitor/employee access are all standard controls for physical security. Once you know what systems you need to protect, put controls in place that can log and restrict access to them (e.g., badge readers). A good risk assessment would determine an appropriate amount of money to spend on controls necessary to mitigate the identified risk. Today, you see more organizations hosting their systems in outsourced data centers. Data centers generally have great physical security because they pay attention to the basics. They use cameras to monitor all entries and exits, have multiple levels of access (e.g., lobby, mantrap, hallways, data floors, and cages) to segment physical areas and limit access only to individuals who have approved access. They also use different levels of authentication requiring both badge and biometrics (e.g., fingerprint, retina) for access.

2022 Guide to PCI DSS Compliance ­ Requirement 9 | 141

""Once you know what systems you need to protect, put controls in place that can

log and restrict

""access to them.
Digital IP-based cameras are becoming more common, making it easier and

more cost effective to deploy and monitor camera systems. These cameras

can take snapshots of people and then send those snapshots to security

9

supervisors for verification.

It's also necessary to protect card-swipe devices. Merchants must monitor these devices for tampering or complete replacement. Make sure attackers don't substitute, bypass, or steal your terminal. You and your employees must know what the tamper properties are (e.g., seals, appearance, weight) and test them often. Security best practice is to mount devices with tamperresistant stands and screws.

Lastly, it's important to have good security training for your management and employees. Help them understand malicious conduct and motivate them to report suspicious behavior and violations of company policy and procedures.

REQUIREMENT 9 IT CHECKLIST
IMPROVING PHYSICAL SECURITY
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· Policies and procedures that limit the access to your physical media and devices used for processing
THINGS YOU WILL NEED TO DO:
· Restrict access to any publicly accessible network jacks. (9.1.2) · Keep physical media secure and maintain strict control over any media being
moved within the facility and outside of it. (9.5, 9.5.1, 9.6.a) · Keep electronic media in a secure area with limited access (e.g., a locked
office clearly marked "Management Only") and require management approval before the media is moved from its secure location. (9.6.1, 9.6.3, 9.7) · Use a secure courier when sending media through the mail so the location of the media can be tracked. (9.6.2) · Destroy media in a way that it cannot be reconstructed; if the media is separated prior to destruction, keep the media in a locked container with a clear label of "To Be Shredded" or something similar. (9.8, 9.8.1) · Maintain a list of all devices used for processing, and train all employees to inspect devices for evidence of tampering. Training should include a process for verifying the identity of outside vendors wanting access to the machine, a process for reporting suspicious behavior around the machine, and a system to ensure employees know not to replace devices without management approval. (9.9.2, 9.9.3)

2022 Guide to PCI DSS Compliance ­ Requirement 9 | 143
THINGS YOU MAY NEED TO HAVE:
· A set process to train employees about proper device management and a way to report any suspicious behavior around the processing device.
· A secure location to keep media, including a second secure location, if business practice is to separate media no longer needed.
NOTES:
9

REQUIREMENT 10
IMPLEMENT LOGGING AND LOG MONITORING
SYSTEM LOGS AND ALERTING
System event logs are recorded pieces of information regarding the actions taken on computer systems like firewalls, office computers, or payment applications.
Log monitoring systems (e.g., Security Information and Event Management [SIEM] tools) oversee network activity, inspect system events, alert you to suspicious activity, and store user actions that occur inside your systems. Think of these tools as your lookout, providing you with data breach alerts. The raw log files are also known as audit records, audit trails, or event logs.
Most systems and software generate logs including operating systems, Internet browsers, POS systems, workstations, anti-malware, firewalls, and IDS/IPS. Some systems with logging capabilities do not automatically enable logging, so it's important to ensure all systems create and collect logs. Some systems generate logs but don't provide event log management solutions. Be aware of your system capabilities and install third-party log monitoring and management software as needed.
ESTABLISHING LOG MANAGEMENT
Logs should be collected and sent to a central location, whether an onsite logging server or an online service. Businesses should review their logs daily to search for errors, anomalies, or suspicious activities that deviate from the norm.
From a security perspective, the purpose of a log alert is to act as a red flag when something potentially malicious is happening. Reviewing logs regularly helps identify issues in your system.

2022 Guide to PCI DSS Compliance ­ Requirement 10 | 145

Given the large amount of log data generated by systems and networking devices, it's impractical to manually review all logs each day. Log monitoring software takes care of this issue by using rules to automate log review and only alert on events that might be real issues. Often this is done using real-time reporting software that alerts you via email or text when suspicious actions are detected.
Often, log monitoring software comes with default alerting templates to optimize monitoring and alerting functions immediately. However, not everyone's network and system designs are the same, and it's critical to correctly configure your alerting rules during setup.
Logs are only useful if they are regularly reviewed.

LOG MANAGEMENT SYSTEM RULES
Here are some event actions to consider when setting up your log management system rules:

· Password changes

· Data exported

· Unauthorized logins

· Shared access events

· Login failures

· Disconnected events

· New login events · Malware detection

· File auditing

· New service installation

10

· Malware attacks seen by IDS

· New user accounts

· Denial of service attacks · Errors on network devices · File name changes · File integrity changes · System object errors

· New processes started or running processes stopped
· Modified registry values
· Scans on your firewall's open and closed ports

To take advantage of log management, look at your security strategy and risk assessment and make sure the following steps are taken care of:
· Decide how and when to generate logs. · Secure your stored logs so they aren't maliciously altered by cybercriminals
or accidentally altered by well-intentioned employees. · Assign responsible personnel the duty to review logs daily. · Set up a team to review suspicious alerts and determine if they are incidents
or false positives. · Spend time to create rules for alert generation (don't just rely on a template). · Store logs for at least one year, with three months readily available. · Frequently check log collection to identify necessary adjustments. · Identify assets, risks, threats, and vulnerabilities and make sure that all are
monitored and settings are configured to generate alerts. · Confirm everything is being appropriately logged by testing the alert and
monitoring configurations.
Diligent log monitoring means that you'll have a quicker response time to security events and better security program effectiveness. Not only will log analysis and daily monitoring demonstrate your willingness to comply with PCI DSS requirements, but it will also help defend against internal and external threats.
Organizations should review their logs daily to search for errors, anomalies, or suspicious activities that deviate from the norm.

2022 Guide to PCI DSS Compliance ­ Requirement 10 | 147
CLOSE DATA SECURITY AND COMPLIANCE GAPS, GET A PCI DSS AUDIT.
Learn More
10

TIPS FROM AN AUDITOR
REQUIREMENT 10
AUDIT LOGS AND LOG MONITORING
MICHAEL MAUGHAN
SecurityMetrics Security Analyst | CISSP | CISA | QSA It's critical that you configure the log monitoring solution correctly so that the appropriate directories, files, security controls, and events are being monitored. Given the large amount of log data generated by systems, it's virtually impossible to manually analyze logs from more than one or two systems. You likely need SIEM tools to sift through logs and drill down into problems. In the past, SIEM systems were mainly utilized by large corporations, but smaller companies now realize system monitoring can help identify malicious activity and attacks. Organizations often struggle with good log review processes. Using SIEM tools can enable you to have real-time alerting to help you recognize a current attack and initiate your incident response plan. It is a good idea to test your alerting capabilities as part of your incident response test to ensure alerts are being generated and critical systems and applications are being appropriately monitored.

2022 Guide to PCI DSS Compliance ­ Requirement 10 | 149

""Regular log monitoring means a quicker response time to security events and improved security program
"effectivene"ss. To correlate events over multiple systems you must synchronize system
times. All systems should get their system time from internal time servers,
which in turn receive time from a trusted external source.

PCI DSS requires service providers to implement a process to detect and

respond to failures of critical security controls in a timely manner. You need

to be able to detect these failures and have defined incident responses in

10

place. Your response plans not only need to address the response to fix

the problem, but also identify risks created by the failure, find root causes,

document lessons learned, and implement any necessary changes to

prevent failures from happening again.

REQUIREMENT 10 IT CHECKLIST
LOGGING AND LOG MANAGEMENT
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· An automated audit log tracking all security-related events for all system components
· Audit logs that track: · Any action taken by an individual with root or administrative privileges (10.2.2) · Failed log-in attempts (10.2.4) · Changes to accounts­including elevation of privileges, account additions, and account deletions (10.2.5) · Identification of user, what the event type was, date and time of the event, whether the event was a success or failure, where the event originated from, and the name of affected data, system component, or resource (10.3.1-10.3.6)
THINGS YOU WILL NEED TO DO:
· Have a process in place to review logs and security events at least daily, in addition to any system component reviews, as defined by your organization for risk management strategy or other policies. (10.6.1.b, 10.6.2.b)
· Have a process in place to respond to anomalies and exceptions. (10.6.3.b) · Keep all audit log records for at least one year and keep the last three
months' logs readily available for analysis. (10.7.b, 10.7.c)

NOTES:

2022 Guide to PCI DSS Compliance ­ Requirement 10 | 151

10

REQUIREMENT 11
CONDUCT VULNERABILITY SCANS AND PENETRATION TESTS
UNDERSTAND YOUR ENVIRONMENT
The types of systems that make up a business's IT environment influences the kind of attacks to which they're susceptible; therefore, a security testing plan should be tailored to the environment.
Defects in web browsers, email clients, POS software, operating systems, and server interfaces can allow attackers to gain access to an environment. Installing security updates and patches for systems in the cardholder or sensitive data environments can help correct many of the newly found defects and vulnerabilities before attackers have the opportunity to leverage them. A vulnerability scanning process helps to identify vulnerabilities, so they can be corrected.
In the case of custom in-house applications, code testing and independent penetration testing can expose many of the weaknesses commonly found in application code (especially home-grown varieties).
These types of scans and tests are the best line of defense in identifying weaknesses so they can be corrected before deployment.

2022 Guide to PCI DSS Compliance ­ Requirement 11 | 153
VULNERABILITY SCANNING VS. PENETRATION TESTING
Some mistakenly believe vulnerability scans are the same as professional penetration tests. Here are the two biggest differences:
» A vulnerability scan is automated, while a penetration test includes a live person that runs tests against your network.
» A vulnerability scan only identifies vulnerabilities, while a penetration tester digs deeper to identify the root cause of the vulnerability that allows access to secure systems or stored sensitive data.
Vulnerability scans and penetration tests work together to encourage optimal network security.
Vulnerability scans are an easy way to gain weekly, monthly, or quarterly insight into the status of your systems, while penetration tests are a more thorough way to evaluate overall security.
11

VULNERABILITY SCANNING BASICS
A vulnerability scan is an automated, high-level test that looks for and reports potential vulnerabilities in systems and applications.
PCI DSS requires two types of vulnerability scanning: internal and external.
An external vulnerability scan is performed from outside of your network and identifies known weaknesses in perimeter network devices, servers, or applications. All external IPs and domains exposed in the CDE, or that can provide access to the CDE, are required to be scanned by a PCI Approved Scanning Vendor (ASV) at least quarterly.
An internal vulnerability scan is performed from within your network, and it looks at other hosts on the same network to identify internal vulnerabilities. These scans are also required to be performed at least quarterly for PCI compliance.
Think of your environment as a house. External vulnerability scanning is like checking to see if doors and windows are locked, while internal vulnerability scanning is like testing to see if bedroom and bathroom doors are locked.
Vulnerability scanning is an automated method to identify potential harmful vulnerabilities, so you can remediate processes to ensure network security.
Typically, vulnerability scanning tools will generate an extensive report of discovered vulnerabilities with references for further research on these vulnerabilities. Some reports even offer suggestions on how to fix discovered issues.

2022 Guide to PCI DSS Compliance ­ Requirement 11 | 155

Running vulnerability scans is like going to a doctor for a checkup. If the doctor discovers a potential health issue and makes a recommendation for treatment, it is up to the patient to follow the doctor's advice. Simply discovering the issue doesn't fix the problem. Act quickly on any discovered vulnerabilities to ensure security holes are plugged, and then re-scan to validate that the vulnerabilities have been successfully addressed.

PROS VULNERABILITY SCANNING
Quick, high-level look at possible vulnerabilities
Very affordable compared to penetration testing
Automatic (can be automated to run weekly, monthly, quarterly)

CONS VULNERABILITY SCANNING
False positives
Businesses must manually check each vulnerability before testing again
Does not confirm a vulnerability is possible to exploit

RUN EXTERNAL VULNERABILITY SCANS
For many organizations, external scans must be performed by a PCI ASV to validate PCI compliance.

An ASV is required to go through a rigorous yearly recertification process, during which each ASV runs their PCI scanning tool on PCI Councilapproved sites planted with vulnerabilities to test which vulnerabilities the tool finds and misses.

Remember, just because an ASV runs your external vulnerability scan, it

doesn't mean your organization is secure. After receiving your scan report,

11

you're responsible for fixing discovered vulnerabilities and then re-scanning

your environment until vulnerabilities have been properly addressed.

RUN INTERNAL VULNERABILITY SCANS
People often assume that if an ASV handles their external vulnerability scans, it means they're compliant. However, if your ASV currently performs your external quarterly scans, understand they're not likely handling your internal quarterly vulnerability scanning.
There are a variety of tools to help you comply with internal vulnerability scan requirements. For example, you can:
» Purchase an internal vulnerability scanning tool from your ASV or another service provider.
» Download an open source internal vulnerability scanning tool.
Keep in mind that the scanning tool you use still needs to be configured by a security expert after you purchase or download it.
Typically, if you purchase a vulnerability scanning tool or appliance, some support should be available. But if you download free scanning tools, take time to research and implement configuration best practices.
Remember, when it comes to vulnerability scanning, your organization is responsible for scan configuration, actual scanning, findings review, and vulnerability remediation.

2022 Guide to PCI DSS Compliance ­ Requirement 11 | 157

PENETRATION TESTING BASICS
Penetration testing takes vulnerability detection to the next level. Penetration testers are people that analyze networks and systems, identify potential vulnerabilities or coding errors, and try to exploit them. In simple terms, penetration testers attempt to break into your company's network by exploiting weaknesses the same way a hacker would. However, unlike a hacker, the penetration tester documents and communicates their methods so that you can fix vulnerabilities and improve security.
A penetration test is a thorough, live examination designed to exploit weaknesses in your system.
Depending on your SAQ, PCI DSS requirement 11.3 may require an annual internal and external penetration test, but even if not required, performing regular penetration testing is a security best practice. Anyone can request a penetration test to measure their business's security.
The time it takes to conduct a penetration test varies based on network size, system complexity, and the individual penetration test staff members assigned. A small environment can be completed in a few days, but a large environment can take several weeks.
Typically, penetration test reports contain a detailed description of attacks used, testing methodologies, and suggestions for remediation.
In addition to annual penetration tests, perform a penetration test whenever large infrastructure changes occur to check if these changes introduced new vulnerabilities.

PROS PENETRATION TESTING
Live, manual tests mean more accurate and thorough results
Rules out false positives

CONS PENETRATION TESTING Time (1 day to 3 weeks) Cost (around $15,000 to $30,000)

DIFFERENT TYPES OF PENETRATION TESTING
NETWORK PENETRATION TEST
The objective of a network penetration test is to identify security issues with the design, implementation, and maintenance of servers, workstations, and network services. PCI compliance requires these tests to be performed from both outside and within your environment, targeting the cardholder data environment at all access points.
Commonly identified security issues include:
· Misconfigured software, firewalls, and operating systems · Outdated software and operating systems · Insecure protocols · Weak authentication practices · Overly permissive access controls

MOBILE PENETRATION TEST
The objective of a mobile application penetration test is to identify security issues resulting from insecure development practices in the design, coding, and publishing of the software that supports a mobile application.
Commonly identified security issues include:

· Insecure local storage
· Information disclosures
· Injection vulnerabilities (e.g., SQL injection, cross-site scripting (XSS), remote code execution)

· Broken authentication (i.e., the login panel can be bypassed)
· Broken authorization (i.e., low-level accounts can access high-level functionality)

2022 Guide to PCI DSS Compliance ­ Requirement 11 | 159
SEGMENTATION CHECK
The objective of a segmentation check is to confirm that firewalls and other controls are preventing access to cardholder data and other sensitive environments as intended. Basically, segmentation checks confirm if network segmentation is set up properly. For service providers that use segmentation to limit PCI scope, you're required to conduct penetration tests on segmentation controls every six months and after any significant change to segmentation controls/methods. Commonly identified security issues include:
· TCP access is allowed where it should not be · ICMP (ping) access is allowed where it should not be

APPLICATION PENETRATION TEST
The objective of an application penetration test is to identify security issues resulting from insecure development practices in the design, coding, and publishing of the software.
Commonly identified security issues include:

· Injection vulnerabilities (e.g., SQL injection, cross-site scripting, remote

code execution)

· Broken authentication (i.e., the log-in panel can be bypassed)

11

· Broken authorization (i.e., low-level accounts can access high-level functionality)

· Improper error handling

· Vulnerable or outdated plugins, libraries, or other application dependencies

WIRELESS PENETRATION TEST
The objective of a wireless penetration test is to identify misconfigurations of authorized wireless infrastructure and the presence of unauthorized access points. Commonly identified security issues include:
· Insecure wireless encryption standards · Weak encryption passphrase · Unsupported wireless technology · Rogue and open access points
SOCIAL ENGINEERING
Social engineering assessment are used to test the effectiveness of an organization's security awareness training. The tester will use typical business scenarios and personnel interactions to identify gaps in established security policies or human error. The goal of the tester is that of an attacker: to take advantage of the employee and trick them into doing something they shouldn't. Commonly identified security issues include:
· Employee(s) clicked on malicious emails · Employee(s) allowed unauthorized individuals into secure areas · Employee(s) connected a randomly discarded or discovered USB to their
workstation · Employee(s) divulge sensitive or secret information

2022 Guide to PCI DSS Compliance ­ Requirement 11 | 161
FIND THE ROOT CAUSE OF YOUR VULNERABILITIES. GET A PENETRATION TEST.
Learn More
11

TIPS FROM AN AUDITOR
REQUIREMENT 11
PENETRATION TESTING
DAVID PAGE
SecurityMetrics Security Analyst | CISSP | CISA | QSA
If your organization is required to be PCI compliant, don't procrastinate beginning the penetration test process. Finding and engaging a good penetration testing partner can take more time than you realize.
In performing PCI DSS assessments, it is common to see an organization's penetration testing process, from start to finish, taking as long as everything else involved in the assessment combined.

2022 Guide to PCI DSS Compliance ­ Requirement 11 | 163
Perform a penetration test
at least yearly and after major
"""" network changes.

If you wait until your QSA is onsite, or until your SAQ is due, to discuss

penetration test scope, methodology, and objectives, you may be unable

to meet your PCI compliance deadlines. Start thinking about penetration testing months before your PCI deadlines.

Remember, the required annual penetration test can begin before your

11

PCI assessment, but you can't be validated as PCI compliant before the

testing is finished.

REQUIREMENT 11 IT CHECKLIST
VULNERABILITY SCANNING & PENETRATION TESTING
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· A process for detecting and identifying wireless access points on a quarterly basis. The method should be able to identify all of the following wireless access points: · WLAN cards inserted into system components · Portable or mobile devices attached to system components that create wireless access points (by USB or other means) · Wireless devices attached to a network port or device (11.1.a, 11.1.b, 11.1.c)
· An inventory of authorized wireless access points with listed business justifications (11.1.1)
· A defined process for performing quarterly vulnerability scans that addresses discovered vulnerabilities and includes re-scanning to confirm remediation (11.2)
· A defined penetration testing methodology that covers the perimeter of the CDE and any critical systems, both internal and external (11.3)
· An intrusion detection or prevention system that examines traffic at the perimeter of the CDE (11.4)
· A change-detection mechanism installed on systems within the CDE to detect unauthorized modifications to critical system files, configuration files, or content files (11.5)

2022 Guide to PCI DSS Compliance ­ Requirement 11 | 165

THINGS YOU WILL NEED TO DO:
· Run quarterly internal vulnerability scans using a qualified internal resource or external third party (in either case, organizational independence must exist), and then re-scan all scans until high-risk (as defined in requirement 6.1) vulnerabilities are resolved. (11.2.1)
· Run quarterly external vulnerability scans (through an ASV) and then re-scan until all scans obtain a passing status (i.e., no vulnerability scores over 4.0). (11.2.2)
· Run internal and external scans, using a qualified resource, after any significant change to the network, and re-scan until resolved:
· For external scans: No vulnerabilities scoring 4.0 or higher exist (11.2.2)
· For internal scans: All high-risk vulnerabilities are resolved (11.2.3)
· Configure your intrusion detection/prevention system according to the vendor's recommendations so that it is kept up to date and will alert you if potential compromises are detected. (11.4.c)
· Configure your change-detection mechanism to alert personnel to unauthorized modification of critical system files, configuration files, or content files; configure the tools to perform critical file comparisons at least weekly. (11.5.b)
· Have a process in place to daily respond to alerts generated by your intrusion detection/prevention and change-detection systems. (11.4.b, 11.5.1)

THINGS YOU MAY NEED TO DO:

· If wireless scanning is used to identify wireless access points, scans must be run at least quarterly. (11.1.c)

· If automated wireless monitoring is used, configure the system to generate

11

alerts to notify personnel if unauthorized devices are detected. (11.1.d)

· Create a plan of action in your business's incident response plan for responding to the detection of unauthorized wireless access points, and take action if unauthorized wireless access points are found. (11.1.2)

· If your organization is a service provider that uses network segmentation to limit PCI scope, make sure your penetration testing procedures confirm that segmentation is operational and isolates all out-of-scope systems from systems in your CDE every six months. (11.3.4.1)

REQUIREMENT 12
START DOCUMENTATION AND RISK ASSESSMENTS
REGULARLY DOCUMENT BUSINESS PRACTICES
Not only do policies and procedures need to be in place, but they also need to be documented. Policies should be written down and easily accessible by all employees.
Documentation helps protect your business from potential liability in the event of a breach. Thorough and accurately documented security policies and procedures help forensic investigators see what security measures your company has in place, and demonstrate your company's proactive and committed approach to security.
If you are a service provider, your executive management is required to implement a PCI DSS Charter. This charter must establish responsibility for the protection of cardholder data and grant authority to create and implement a PCI DSS compliance program, including overall accountability for maintaining PCI DSS compliance. It must also define how the person responsible for PCI DSS compliance will communicate with executive management.
Third parties (e.g., partners, vendors, service providers) that have access to your CDE or cardholder data present a risk to the security of your environment. You must have a list of all third-party service providers you use, the PCI requirements these service providers impact or manage on your behalf, a process for performing due diligence prior to engaging a third party, and a way to monitor the PCI compliance of each third party you've engaged.
For PCI compliance, documentation of all security measures and actions should be updated regularly.

2022 Guide to PCI DSS Compliance ­ Requirement 12 | 167
Documents you'll want to include in your security policy:
· Employee manuals · Policies and procedures · Technology usage policies · Third-party vendor agreements · Incident response plans

ESTABLISH A RISK ASSESSMENT PROCESS
PCI requires all entities to perform an annual risk assessment that identifies critical assets, threats, vulnerabilities, and risks. This exercise helps organizations identify, prioritize, and manage information security risks.

Organizations that take a proactive approach to security will use internal and external resources to identify critical assets, assess vulnerabilities and threats against those assets, and implement a risk management plan to mitigate those threats.

A risk assessment should occur at least annually and after significant changes in your environment or business processes.

Just because a system is vulnerable doesn't mean it's exploitable or even likely to be exploited. Some vulnerabilities may require so many preconditions that the risk of a successful attack is virtually zero.

Part of a risk assessment is to assign a ranking or score to identified

risks. This will help establish priorities and provide direction on what

vulnerabilities you should address first. Methodically identifying, ranking, and mitigating risks can decrease the time an attacker can access and

12

negatively affect your systems, and over time closes the door to the attack.

PCI DSS TRAINING BEST PRACTICES
If you think your employees know how to secure cardholder data and what they're required to do to be compliant, you're probably mistaken. In fact, most breaches can be traced back to human error. Although most workers aren't malicious, they often either forget security best practices or don't know exactly what they're required to do.
Unfortunately, many hackers will take advantage of human error to gain access to sensitive data. For example, when employees leave mobile devices in plain sight and unattended, they provide potential access to passwords, multi-factor authentication tokens, and other valuable information. Hackers may access networks because employees set up easy-to-guess passwords. And the list goes on.
Often, people are the weakest link in your overall security scheme.
By informing employees about and holding them accountable for their responsibilities, you can better protect your business and customers.
Employees need to be given specific rules and regular training. A security awareness program that includes regular training (e.g., brief monthly training or communications) will remind them of the importance of security, especially keeping them up to date with current security policies and practices.

2022 Guide to PCI DSS Compliance ­ Requirement 12 | 169
Here are some tips to help employees protect your sensitive data: » Communicate often: Focus each month on a different aspect of data security, such as passwords, social engineering, or email phishing.
» Give frequent reminders: Emphasize data security best practices to your employees through emails, newsletters, meetings, or webinars.
» Train employees on new policies ASAP: Newly hired employees should be trained on security and PCI policies as quickly as possible.
» Make training materials easily available: Intranet sites are a great way to provide access to training and policy information.
» Set clear expectations: Don't present training as a list of "Do Nots." Rather, help employees see that they all have a vested interest in protecting the organization and its business.
» Create incentives: Reward your employees for being proactive.
» Regularly test employees: Create an environment where employees aren't afraid to report suspicious behavior.
12

TIPS FROM AN AUDITOR
REQUIREMENT 12
PCI COMPLIANCE BASICS
DAVID PAGE
SecurityMetrics Security Analyst | CISSP | CISA | QSA
The risk assessment is where a lot of organizations struggle with PCI compliance. Many treat it as simply another item on the to-do list. In reality, a risk assessment can be the most important part of your overall security and compliance program, since it helps you identify systems, third parties, business processes, and people that are in scope for PCI compliance. Too many companies approach PCI as simply an "IT issue" and are surprised when they realize PCI compliance touches a lot of other business processes and practices. If you aren't doing a formal risk assessment now and are intimidated by the process, start small and plan to increase the scope of the review each year.

2022 Guide to PCI DSS Compliance ­ Requirement 12 | 171
""A risk assessment is a great starting point for establishing a successful security and PCI compliance ""program.

Another area of difficulty, especially for small organizations, is putting together a comprehensive and relevant security awareness program. Don't be afraid of what you don't know!

Even if you aren't a security expert yourself, there is a wealth of security-

related information available online, and many resources that make it easy

to present a polished training program to your employees. This is one area

12

where the help of an outside security expert or partner can be valuable.

REQUIREMENT 12 IT CHECKLIST
CORPORATE POLICY AND DOCUMENTATION
Assigned to:
Assignment date:
Completion date: 
THINGS YOU WILL NEED TO HAVE:
· Written compliance and security policies · Charter for PCI DSS compliance program · Service providers must perform quarterly reviews to confirm policies and
procedures are being followed
THINGS YOU WILL NEED TO DO:
· Ensure that each employee working in the CDE completes annual security awareness training. (12.6, 12.6.1)
THINGS YOU MAY NEED TO DO:
· Create a company policy documenting all critical devices and services within the payment processing environment. Some examples include laptops, tablets, email and Internet usage, remote access, and wireless access technologies. This policy should include acceptable uses and storage of these technologies. The general purpose of this policy is to thoroughly explain each employee's role in the CDE. Review your policy and lists annually. (12.1-12.4)
· Create and document an approval process for allowing employee access to technologies. Keep lists readily available and review them annually. (12.1-12.4)

2022 Guide to PCI DSS Compliance ­ Requirement 12 | 173
· Create an incident response plan in the event that cardholder data is compromised (12.10.1). Your plan should include the following: · Roles and contact strategies in the event of compromise · Specific incident response procedures · Business continuity and recovery procedures · Data backup processes · Analysis of legal requirements in reporting possible compromise · Critical systems coverage and response plans · Notification of merchant processor and payment card brands · Create and update a current list of third-party service providers (e.g., your IT provider, credit card machine vendor, and credit card receipt shredder)
· The following will need to be completed annually regarding your service providers (12.8, 12.8.1): · Establish a process for engaging with third-party providers. Best practice would be to contact them by phone rather than taking inbound calls. Work by appointment with service providers onsite. (12.8.3) · Obtain or update a written agreement from third-party providers acknowledging their responsibility for the cardholder information they possess. Ensure they are following PCI compliance requirements themselves. (12.8.2) · Establish a process for engaging new providers, including research prior to selecting a provider.
NOTES:

HOW TO PREPARE FOR A DATA BREACH

HOW TO PREPARE FOR A DATA BREACH

You can't afford to be unprepared for the aftermath of a data breach. It's up to you to control the situation, minimize damage to customers, reduce costs associated with a data breach, communicate properly to various authorities as set out by various standards and regulations, and protect your business.
The following section will help you better understand how to successfully stop payment card information from being stolen, mitigate damage, and restore operations as quickly as possible.
INCIDENT RESPONSE PLAN OVERVIEW

If your organization is breached, you may be liable for the following fines, losses, and costs:

DATA BREACH FINES Merchant processor compromise fine Card brand compromise fees Forensic investigation Onsite QSA assessments following the breach Free credit monitoring for affected individuals Card re-issuance penalties Security updates Lawyer fees Breach notification costs Technology repairs TOTAL POSSIBLE COST:

$5,000 ­ $50,000 $5,000 ­ $500,000 $12,000 ­ $100,000 $20,000 ­ $100,000 $10 ­ $30/card $3 ­ $10 per card $15,000+ $5,000+ $1,000+ $2,000+ $50,000 ­ $773,000+

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 177
Unfortunately, every organization will experience system attacks, with some of these attacks succeeding. A well-executed incident response plan can minimize breach impact, reduce fines, decrease negative press, and help you get back to business more quickly. In an ideal world (and if you're following PCI DSS requirements), you should already have an incident response plan in place, and employees should be trained to quickly deal with a data breach.
If there is no incident response plan, employees scramble to figure out what they're supposed to do, and that's when mistakes can occur.
For example, if employees wipe a system without first creating images of the compromised systems, then you would be prevented from learning what happened and what you can do to avoid re-infection.

INCIDENT RESPONSE PLAN PHASES
An incident response plan should be set up to address a suspected data breach in a series of phases with specific needs to be addressed. The incident response phases are:
» Phase 1: Prepare
» Phase 2: Identify
» Phase 3: Contain
» Phase 4: Eradicate
» Phase 5: Recover
» Phase 6: Review
It's important to discover a data breach quickly, identify where it's coming from, and pinpoint what it has affected.

INCIDENT RESPONSE PHASE TIMELINE

DATA BREACH PRE BREACH

PHASE 1 P R E PA R E

PHASE 2 I D E N T I F Y

PHASE 3 C O N TA I N

PHASE 4 E R A D I C AT E

POST BREACH
PHASE 5 RECOVER

PHASE 6 REVIEW

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 179

PHASE 1: PREPARE
Preparation often takes the most effort in your incident response planning, but it's by far the most crucial phase to protect your organization.
This ongoing phase includes the following steps:

· Ensure your employees receive proper training regarding their incident response roles and responsibilities.
· Develop and regularly conduct tabletop exercises (i.e., incident response drill scenarios) to evaluate your incident response plan.

· Ensure that all aspects of your incident response plan (e.g., training, hardware and software resources) are approved and funded in advance.

PHASE 2: IDENTIFY
Identification (or detection) is an ongoing process where you determine whether you've actually been breached by looking for deviations from normal operations and activities.
An organization normally learn they have been breached in one of four ways:

· The breach is discovered internally (e.g., review of intrusion detection system logs, alerting systems, system anomalies, or anti-virus scan malware alerts).
· Your bank informs you of a possible breach based on reports of customer credit card fraud.

· Law enforcement discovers the breach while investigating the sale of stolen card information.
· A customer complains to you because your organization was the last place they used their card before it began racking up fraudulent charges.

PHASE 3: CONTAIN AND DOCUMENT
When an organization becomes aware of a possible breach, it's understandable to want to fix it immediately.
However, without taking the proper steps and involving the right people, you can inadvertently destroy valuable forensic data. Forensic investigators use this data to determine how and when the breach occurred, as well as help devise a plan to prevent similar future attacks.
When you discover a breach, remember: don't panic, don't make hasty decisions, don't wipe and reinstall your systems (yet), and contact your forensic investigator to help you contain the breach.
Steps to consider during containment and documentation:
· Stop the leakage of sensitive data as soon as possible.
· Unplug affected systems from the network, rebuild clean new systems, and keep old systems offline. This is the best option if it's possible, it allows a forensic investigator to evaluate untouched systems. This is easier to do in virtual server environments but can be costly.
· If system replacement is not possible, the next main task will be documentation. This means you need to preserve as much information as possible for forensic analysis. If you know how to take a complete image of your system, please do so. If you know where the virus files are, copy that directory to a backup. Resort to screenshots or phone videos of behaviors as a last resort before taking action to change the systems.
· Call in a professional forensic investigator to help learn about the breach. In some industries, this may be a required step (such as when payment data is stolen), but it's always recommended to get forensic analysts involved, so you can develop better future processes.

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 181
PHASE 4: ERADICATE
After containing the incident, you need to find and remediate the policies, procedures, or technology that led to the breach. This means all malware should be properly removed, and systems should again be hardened, patched, and updated.
Whether you do this or bring in a third party to help you, it's important to be thorough. If any security issues or traces of malware remain in your systems, you may still be losing sensitive data (with your liability increasing).
PHASE 5: RECOVER
Recovering from a data breach is the process of restoring and returning affected systems and devices back into your business environment. During this time, it's important to get your systems and business operations up and running again as quickly as possible.
Remember to ensure all systems have been hardened, patched, replaced, and tested before you consider reintroducing the previously compromised systems back into your production environment.
PHASE 6: REVIEW
After the forensic investigation, meet with all incident response team members and discuss what you've learned from the data breach, reviewing the events in preparation for future attacks.
This is when you will analyze everything about the breach. Determine what worked well and what didn't in your response plan. Use this information to revise your plan.

WHAT TO INCLUDE IN AN INCIDENT RESPONSE PLAN
Creating an incident response plan can seem overwhelming. To help you accomplish this task, develop your incident response plan using smaller, more manageable procedures.
While every organization needs varying policies, training, and documents, there are a few itemized response lists that most organizations should include in their incident response plan:
» Emergency contact and communications list
» System backup and recovery processes list
» Forensic analysis list
» Jump bag list
» Security policy review list

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 183
EMERGENCY CONTACT AND COMMUNICATIONS LIST
Proper communication is critical to successfully managing a data breach, which is why you need to document a thorough emergency contact/ communications list. Your list should contain information about: who to contact, how to reach these contacts, the appropriate timelines to reach out, and what should be said to external parties. Make sure to document everyone that needs to be contacted in the event of a data breach, such as the following individuals and groups:
· Your response team · Your executive team · Your legal team · Your forensic company · Your public relations advisor(s) · Affected individuals · Law enforcement · Merchant processor

PUBLIC COMMUNICATIONS
Your incident response team should craft specific statements that target the various audiences, including a holding statement, press release, customer statement, and internal/employee statement. For example, you should have prepared emails and talking points ready to go after a data breach.
Your statements should address questions like:

Which locations were and are

impacted by the breach?

· How was the breach discovered? · Is any other sensitive data at risk? · How will the breach affect patients and the community? · What services or assistance (if any) will you provide your patients? · When will you be back up and running?

· What will you do to prevent data breaches from occurring again?

Identify in advance the party within your organization that is responsible for timely notifications that fulfill your state's specific requirements. This could be your inside legal counsel, newly hired breach management firm, or C-level executive. This person should be trained and notification templates should be written in advance.
Your public response to the data breach will be judged heavily, so review your statements thoroughly.

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 185
SYSTEM BACKUP AND RECOVERY PROCESSES LIST
Your system backup and recovery processes list will help you deal with the technical aspects of a data breach.
Here are some things that should be included: » Process for disconnecting from the Internet (e.g., who is responsible to decide whether or not to disconnect)
» System configuration diagrams that include information like device descriptions, IP addresses, and OS information
» Process for switching to redundant systems and preserving evidence
» Process for preserving evidence (e.g., logs, time stamps)
» Practices to test the full system backup and system recovery
» Steps to test and verify that any compromised systems are clean and fully functional
This list helps you preserve any compromised data, quickly handle a data breach, and preserve your systems through backups. By creating and implementing this list, your organization can lessen further data loss and help you return to normal operations as quickly as possible.

FORENSIC ANALYSIS LIST
A forensics analysis list is for organizations that use in-house forensic investigations resources.
Your forensic team will need to know where to look for irregular behavior and how to access system security and event logs. You might need multiple lists based on your different operating systems and functionalities (e.g., server, database).
Your forensic team may need the following tools:
· Data acquisition tools · Write-blockers · Clean/wiped USB hard drives · Cabling for all connections that they could experience in your environment · Other forensic analysis tools (e.g., EnCase, FTK, X-Ways)
If your organization doesn't have access to an experienced computer forensic examiner in-house, you will want to consider hiring a forensic firm, vetting them in advance with pre-completed agreements. This vetting process helps ensure you get an experienced forensic investigator when you need it.

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 187
JUMP BAG LIST
Your jump bag list is for grab-and-go responses (i.e., when you need to respond to a breach quickly). This list should include overall responses and actions that employees need to take immediately after a breach. Your list will keep your plan organized and prevent mistakes caused by panic.
Here are some things to include in your jump bag: » Incident handler's journal to document the incident (e.g., who, what, where, when, why)
» Incident response team contact list
» USB hard drives and write-blockers
» USB multi-hub
» Flashlight, pens, and notebooks
» All of your documented lists
» USB containing bootable versions of your operating system(s)
» Computer and network tool kit
» Hard duplicators with write-block capabilities
» Forensic tools and software (if you decide to use inhouse forensic investigations resources)

SECURITY POLICY REVIEW LIST
Your security policy review list deals with your response to a breach and its aftermath. This list helps you analyze the breach and shows you what changes need to be made.
Your security policy review list should include documentation of the following things:

· When the breach was detected, by whom, and through what method
· Scope of the incident and affected systems
· Data that was put at risk
· How the breach was contained and eradicated

· Work performed or changes made to systems during recovery
· Areas where the incident response plan was effective
· Areas that need improvement (e.g., which security controls failed, necessary security awareness program changes)

The purpose of this list is to document the entire incident, what was done, what worked, what didn't, and what was learned.
You should look at where your security controls failed and how to improve them.

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 189
THINK YOU'VE HAD A DATA BREACH? LEARN MORE ABOUT SECURITYMETRICS FORENSIC INVESTIGATIONS.
Learn More

DEVELOP YOUR INCIDENT RESPONSE PLAN
Developing and implementing a thorough incident response plan will help your business handle a data breach quickly and efficiently, while also minimizing the damage from a data breach.
STEP 1: IDENTIFY AND PRIORITIZE ASSETS
Start by identifying and documenting where your organization keeps its crucial data assets. Assess what would cause your organization to suffer heavy losses if it was stolen or damaged.
After identifying critical assets, prioritize them according to the importance and highest risk (e.g., risks based on your annual risk assessment), quantifying your asset values. This will help justify your security budget and show executives what needs to be protected and why it's essential to do so.

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 191

STEP 2: IDENTIFY POTENTIAL RISKS
Determine what risks and attacks are the greatest current threats against your systems. Keep in mind that these risks will be different for every organization.
For organizations that process data online, improper coding could be their biggest risk. For a brick-and-mortar organization that offers Wi-Fi for their customers, their biggest risk may be improper network access. Some organizations may place a higher priority on ensuring physical security, while others may focus on securing their remote access applications.
Here are examples of a few possible risks:

· External or removable media: Malware executed from removable media (e.g., flash drive, CD)
· Attrition: Employs brute force methods (e.g., DDoS, password cracking)
· Web: Malware executed from a site or web-based app (e.g., drive-by download)

· Email security: Malware executed via email message or attachment (e.g., malware, ransomware)
· Impersonation: Replacement of something benign with something malicious (e.g., SQL injection attacks, rogue wireless access points)
· Loss or theft: Loss of computing device or media (e.g., laptop, smartphone)

STEP 3: ESTABLISH PROCEDURES
If you don't have established procedures, a panicked employee may make detrimental security errors that could damage your organization.
Your data breach policies and procedures should include:
· A baseline of normal activity to help identify breaches · How to identify and contain a data breach · How to record information on a breach · Notification and communications plan · Defense approach · Employee training
Over time, you may need to adjust your policies according to your organization's needs. Some organizations might require a more robust notification and communication plan, while others might need help from outside resources. However, all organizations need to focus on employee training (e.g., your security policies and procedures).

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 193
STEP 4: SET UP A RESPONSE TEAM
Organize an incident response team that coordinates your organization's actions after discovering a data breach. Your team's goal should be to coordinate resources during a security incident to minimize impact and restore operations as quickly as possible.
Some of the necessary team roles are: » Team leader » Lead investigator » Communications leader » C-suite representative » IT director » Public relations » Documentations and timeline leader » Human resources » Legal representative » Breach response experts
Make sure your response team covers all aspects of your organization and understand their particular roles in the plan. Each member will bring a unique perspective to the table, and they should own specific data breach response roles that are documented to manage a crisis.

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 195

STEP 5: SELL THE PLAN
Your incident response team won't be effective without proper support and resources to follow your plan.

Security is not a bottom-up process. Management at the highest level (e.g., CEO, VP, CTO) must understand that security policies­like your incident response plan­must be implemented from the top and be pushed down. This is true for both enterprise organizations as well as mom-and-pop shops.

For enterprise organizations, executives need to be on board with your incident response plan. For smaller organizations, management needs to support additional resources for incident response.

The more effectively you present your goals, the easier it will be to obtain necessary funding to create, practice, and execute your incident response plan.

When presenting your incident response plan, focus on how your plan will benefit your organization (e.g., financial and brand benefits). For example, if you experience a data breach and manage the incident poorly, your company's reputation will likely receive irreparable brand damage.

STEP 6: TRAIN YOUR STAFF
Just having an incident response plan isn't enough. Employees need to be properly trained on your incident response plan and know what they're expected to do after a data breach. This means training your team on a regular basis to ensure they know how to respond.
The regular work routine makes it easy for staff to forget crucial security lessons and best practices.
Employees also need to understand their role in maintaining company security. To help them, teach employees to identify attacks such as phishing emails, spear phishing attacks, and social engineering efforts.

TEST YOUR INCIDENT RESPONSE PLAN
To help staff, regularly test their reactions through real-life simulations, also known as tabletop exercises. Tabletop exercises allow employees to learn about and practice their incident response roles when nothing is at stake, which can help you and your staff discover gaps in your incident response plan (e.g., communication issues).

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 197
TYPES OF TABLETOP EXERCISES
DISCUSSION-BASED EXERCISE
In a discussion-based tabletop exercise, incident response team members discuss response roles in hypothetical situations. This tabletop exercise is a great starting point because it doesn't require extensive preparation or resources, while it still tests your team's response to real-life scenarios without risk to your organization. However, this exercise can't fully test your incident response plan or your team's response roles.
SIMULATION EXERCISE
In a simulation exercise, your team tests their incident responses through a live walk-through test that has been highly choreographed and planned. This exercise allows participants to experience how events actually happen, helping your team better understand their roles. However, simulation exercises require a lot of time to plan and coordinate, while still not fully testing your team's capabilities.
PARALLEL TESTING
In parallel testing, your incident response team actually tests their incident response roles in a test environment. Parallel testing is the most realistic simulation and provides your team with the best feedback about their roles. Parallel testing is more expensive and requires more time planning than other exercises because you need to simulate an actual production environment, with realistic systems and networks.

CONDUCT A TABLETOP EXERCISE
Before conducting a tabletop exercise, determine your organization's needs by asking:
» Has your incident response team received adequate training about their roles and responsibilities?
» When did you last conduct a tabletop exercise?
» Have there been any recent organizational changes that might affect your incident response plan?
» Has there been any recent guidance or legislation that might impact your incident response plan?
Next, design your tabletop exercise around an incident response plan topic that you want to test. Identify any desired learning objectives and outcomes. From there, create and coordinate with your tabletop exercise staff (e.g., facilitator, participants, data collector) to schedule your tabletop exercise.

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 199
When designing your tabletop exercise, prepare the following exercise information in advance:
· A facilitator guide that documents your tabletop exercise's purpose, scope, objective, and scenario, including a list of questions to address your exercise's objectives.
· A participant briefing that includes the tabletop exercise agenda and logistics information.
· A participant guide that includes the same information as the facilitator guide, except it either doesn't include any of the questions or includes a shorter list of questions specifically designed to prepare participants.
· An after-action report that documents the evaluations, observations, and lessons learned from your tabletop exercise staff.
After conducting a tabletop exercise, set up a debrief meeting to discuss incident response successes and weaknesses. Your team's input will help you know where and how to make necessary revisions to your incident response plan and training processes.

DATA BREACH PREVENTION TOOLS
INSTALL AND REVIEW FILE INTEGRITY MONITORING SOFTWARE
File integrity monitoring (FIM) software is a great companion for your malware prevention controls. New malware comes out so frequently you can't just rely on anti-virus software to protect your systems. It often takes many months for a signature of newly detected malware to make it into the malware signature files, which allows it to be detected by antivirus software.
Configure FIM software to watch critical file directories for changes. FIM software is typically configured to monitor areas of a computer's file system where critical files are located. FIM tools will generate an alert that can be monitored when a file is changed.
Malware is software that consists of files that are copied to a target computer. Even if your anti-virus software cannot recognize the malware files' signatures, FIM software will detect that files have been written to your computer and will alert you to check and make sure you know what those files are. If the change was known (like a system update), then you don't need to worry. If not, chances are you have new malware added that could not be detected and can now be dealt with.
FIM can also be set up to check if web application code or files are or were modified by a threat actor.

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 201
Here are examples of some places where FIM should be set up to monitor:
· OS critical directories · Critical installed application directories · Web server and web application directories · User areas (if it's an employee-facing computer)

INSTALL INTRUSION DETECTION AND PREVENTION SYSTEMS
One of the reasons data breaches are so prevalent is a lack of proactive, comprehensive security dedicated to monitoring system irregularities, such as intrusion detection systems (IDS) and intrusion prevention systems (IPS).

Using these systems can help identify a suspected attack and help you locate security holes in your network that attackers used. Without the knowledge derived from IDS logs, it can be very difficult to find system vulnerabilities and determine if cardholder data was accessed or stolen.

By setting up alerts on an IDS, you can be warned as soon as suspicious activity is identified and be able to significantly minimize compromise risk within your organization. You may even stop a breach in its tracks.

For more preventive measures, you might consider an IPS, which also

monitors network activity for malicious activities, logs this information, and reports it; but

An IDS can help you detect a security breach

it can prevent and block many

as it is happening in

intrusions that are detected. An IPS real time.
can drop malicious packets, block

traffic from the malicious source address, and reset connections.

2022 Guide to PCI DSS Compliance ­ How to Prepare for a Data Breach | 203
DATA LOSS PREVENTION SOFTWARE
In addition to these, you should have data loss prevention (DLP) software in place. DLP software watches outgoing data streams for sensitive or critical data formats that should not be sent through a firewall, and it blocks this data from leaving your system.
Make sure to properly implement it so that your DLP knows where data is allowed to go, since if it's too restrictive, it might block critical transmissions to third party organizations.

2022 Guide to PCI DSS Compliance ­ Conclusion | 205
CONCLUSION

PCI DSS BUDGET
The cost of PCI compliance depends on your organization's structure. Here are a few variables that will factor into the cost of your overall compliance to the PCI DSS:
» Your business type (e.g., franchise, service provider, mom-and-pop shop): Each business type will have varying amounts of transactions, cardholder data, environment structure, risk levels, and merchant or service provider levels, meaning that each business will have different security requirements.
» Your organization size: Typically, the larger the organization, the more potential vulnerabilities it has. More staff members, more programs, more processes, more computers, more cardholder data, and more departments mean more cost.
» Your organization's environment: The type of processing systems, the brand of computers, the kind of firewalls, the model of back-end servers, etc. can all affect your PCI cost.
» Your organization's dedicated PCI staff and outside help: Even with a dedicated team, organizations usually require outside assistance or consulting to help them meet PCI requirements.

2022 Guide to PCI DSS Compliance ­ Conclusion | 207

The following are estimated annual PCI budgets:

SMALL ENTITY BUDGET Self-assessment questionnaire (SAQ) Vulnerability scan Training and policy development TOTAL POSSIBLE COST

$50-$200 $100-$150 per IP address $70 per employee $220+*

MEDIUM/LARGE ENTITY BUDGET Onsite audit Vulnerability scan Penetration testing Training and policy development TOTAL POSSIBLE COST

$40,000+ $800+ $15,000+ $5,000+ $60,800+*

* Keep in mind this budget doesn't include implementing and managing security controls, such as firewalls, encryption, and updating systems and equipment.

CREATE A SECURITY CULTURE
Unless someone oversees PCI on management's side (not just IT), PCI compliance won't happen. We often see departments within companies (e.g., networking, IT, HR, risk) expecting other departments to take charge of PCI compliance, which means nobody is in charge of it. Other times, organizations expect a third-party QSA to be the PCI project manager, which is not feasible because the QSA's role is to assess what is in place.
Security is not a bottom-up process. Management often says or implies that IT should "just get their organization secure." However, those placed in charge of PCI compliance and security may not have the means necessary to reach their goals.
For example, IT may not have the budget to implement adequate security policies and technologies (e.g., firewalls, FIM). Some may try to look for free software to fill in security gaps, but this process can be expensive due to the time it takes to implement and manage. In some instances, we have seen IT departments wanting their PCI auditor to purposely fail their compliance evaluations so they could prove their higher security budget needs. Obviously, it would have been better to focus on security from the top level down beforehand.
C-level management should support the PCI process. If you are a C-level executive, you should be involved with budgeting, assisting, and establishing a security culture from the top-down.
Additionally, organizations can sometimes focus on becoming "certified" as PCI compliant, while not actually addressing, monitoring, and regularly reviewing critical security controls and processes. Keep in mind that this attitude of just checking off SAQ questions doesn't make an organization PCI compliant, nor will it protect them from future data breaches.

2022 Guide to PCI DSS Compliance ­ Conclusion | 209
OVERCOME MANAGEMENT'S BUDGET CONCERNS
If you're having problems communicating budgetary needs to management, conduct a risk assessment before starting the PCI process. NIST 800-30 is a good risk assessment protocol to follow. At the end of your assessment, you'll have an idea of your compromise probability, how much a compromise would cost, and the impact a breach might have on your organization (including brand damage). Simply put, you need to find a way to show how much money weak security will cost the organization. For example, "if someone gains access to the system through X, this is how much it will cost and how much damage it will cause." Consider asking marketing or accounting teams for help delivering the message in more bottom-line terms.
If possible, work with a QSA to come up with security controls to address what tools you may need to implement.

TIPS FROM AN AUDITOR
PCI DSS RESPONSIBILITIES AND CHALLENGES
JEN STONE
SecurityMetrics Senior Security Analyst | CCSFP | MCIS | CISSP | CISA | QSA In my experience, small merchants and service providers tend to struggle with documenting and following policies and procedures. During a PCI DSS assessment, a QSA will verify that required policies and procedures are in place and being followed. Smaller merchants and service providers whose CDE consists of only a few machines often feel that they don't have time to document procedures. Unfortunately, it's not uncommon to perform a renewal assessment where the business neglected to maintain compliance due to employee turnover and lack of documentation. At a minimum, small merchants should set up a PCI email user or active directory account and add reminders in their calendar to perform security processes throughout the year (e.g., quarterly vulnerability assessment scans, semi-annual firewall reviews). The evidence collected from these tasks can then be sent to that PCI account for storage. This is a low-cost solution that can help key personnel keep PCI DSS compliance on their minds throughout the year. It will also help document necessary evidence for their annual self-assessment (or to their assessor).

2022 Guide to PCI DSS Compliance ­ Conclusion | 211
Large enterprise organizations usually document their policies and procedures sufficiently. They generally have specific and thorough change control processes, and they typically follow documented approval processes prior to implementing changes to their CDE. Unfortunately, due to their size and the different entities involved in their CDE management, their reaction time tends to be much slower, with different stakeholders often making contradictory decisions. When vulnerability scans or penetration tests identify weaknesses that may place their CDE at risk, it's not always apparent which group should be responsible for addressing these vulnerabilities.
To address some of these concerns, service providers are required to define a charter for the organization's compliance program, involving executive management. While this is only required for service providers, it's recommended that larger merchants follow this requirement as well.
Large organizations and service providers should establish an official PCI charter that describes the management and accountability of the organization's compliance program (requirement 12.4.1). Additionally, they should implement internal audit procedures to ensure security practices are properly in place throughout the year (requirement 10.8 and 12.11).
PCI compliance cannot just be an annual audit event.
Often, organizations are not leveraging many of the PCI requirements in a way that actually increases security for their CDE.
For instance, PCI requires log centralization and daily reviews. PCI also requires change detection or FIM on CDE systems to detect unauthorized changes to key files and directories. To achieve compliance, organizations might set up log monitoring and FIM, but then ignore every alert coming their way. They may technically have FIM and log monitoring in place, but these systems alone are not making their environments more secure.
If organizations do not take the necessary time and effort to respond to genuine alerts, the only thing they will gain are check marks on their SAQ.

CONTRIBUTORS

MATT HALBLEIB GARY GLOVER JEN STONE MICHAEL SIMPSON BENJAMIN CHRISTENSEN MICHAEL MAUGHAN DAVID PAGE MICHAEL OHRAN TREVOR HANSEN MARK MINER WINN OAKEY BRAD CALDWELL REBECCA CAMEAU MARJ ELDARD DAVID ELLIS AARON WILLIS BRADLEY SMITH CHANDLER LOVELAND JOSHUA BRANDEBERRY

JACOB THAYNE WHITNEY TAYLOR BRAD NELSON JEFF MCKENNA CHUCK BRAILSFORD DON ROBERTSON TYLER FARR SIDNIE ANDERSON RICH BUSHELL JON CLARK EMMA DUFF HUNTER STEFFEN SARAH KEMPLE KATHERINE BULLOCK EMORY FRENCH-FOLSOM BEN CALDWELL HIEDI BLACKWELDER ERIC SMITH

2022 Guide to PCI DSS Compliance ­ Conclusion | 213
We hope our PCI Guide will help you close your data security and compliance gaps. Please reach out
"" "" to us with any questions you have.

TERMS AND DEFINITIONS
Access Control List (ACL): A list of instructions for firewalls to know what to allow in and out of systems.
Advanced Encryption Standard (AES): Government encryption standard to secure sensitive electronic information.
Captured: Data is being recorded, gathered, or stored from an unauthorized source.
Card Verification Value (CVV/CSC/CVC/CAV): Element on a payment card that protects information on the magnetic stripe. Specific acronyms depend on the card brand.
Cardholder Data Environment (CDE): Any individual, software, system, or process that processes, stores, or transmits cardholder data.
Cardholder Data (CHD): Sensitive data found on payment cards, such as an account holder name or PAN data.
Chief Information Security Officer (CISO): Similar to a CSO, but with responsibility for IT rather than entity-wide security.
Chief Security Officer (CSO): Company position with responsibility towards PCI compliance, physical security, network security, and other security protocols.
Data Loss Prevention (DLP): A piece of software or strategy used to catch unencrypted data sent outside the network.
Exfiltrated: The unauthorized transfer of data from a system.
Federal Information Processing Standards (FIPS): US federal government standards for computer security that are publicly announced (e.g., encryption standards).

2022 Guide to PCI DSS Compliance ­ Conclusion | 215
File Integrity Monitoring (FIM): A way of checking software, systems, and applications in order to warn of potential malicious activity (e.g., when a file is changed). File Transfer Protocol (FTP): An insecure way to transfer computer files between computers through the Internet. (See SFTP) Firewall (FW): A system designed to screen incoming and outgoing network traffic. Hypertext Transfer Protocol (HTTP): A method of communication between servers and browsers. (See HTTPS) Hypertext Transfer Protocol Over Secure (HTTPS): A secure method of communication between servers and browsers. (See HTTP) Incident Response Plan (IRP): Policies and procedures to effectively limit the effects of a security breach. Information Technology (IT): Anything relating to networks, computers, and programming, including the people that work with those technologies. Internet Protocol (IP): Defines how computers send packets of data to each other. Intrusion Detection System (IDS): Types of systems that are used to monitor network traffic and report potential malicious activity. Intrusion Prevention System (IPS): Types of systems that­like an IDS­ monitors network traffic and reports potential malicious activity, but also prevents and blocks many detected.

Multi-Factor Authentication (MFA): Two out of three independent methods of authentication are required to verify a computer or network user. The three possible factors are:
· Something you know (e.g., a username and password)
· Something you have (e.g., an RSA token or one-time password token)
· Something you are (e.g., fingerprint or iris scan)
National Institute of Standards and Technology (NIST): Federal technology agency that assists in developing and applying technology, measurements, and standards (e.g., the NVD).
National Vulnerability Database (NVD): A repository of all known vulnerabilities, maintained by NIST.
Network Access Control (NAC): Restricts data that users, apps, and programs can access on a computer network.
Open Web Application Security Project (OWASP): A non-profit organization focused on software security improvement, often heard in the context of "OWASP Top 10"­a list of top threatening vulnerabilities.
Payment Card Industry Data Security Standard (PCI DSS): Requirements put together by the PCI SSC, required of all businesses that process, store, or transmit payment card data to help prevent cardholder data theft.
Payment Card Industry Security Standards Council (PCI SSC): An organization established in 2006 by Visa, MasterCard, American Express, Discover Financial Services, and JCB International to regulate cardholder data security.
Point-To-Point Encryption (P2PE): Payment card data encryption technology that makes data unreadable from the point of interaction to a merchant solution provider.
Primary Account Number (PAN): The 12 to 19 digits that identify a payment card. Also called a bank card number or payment card number.

2022 Guide to PCI DSS Compliance ­ Conclusion | 217
Qualified Security Assessor (QSA): Individuals and firms certified by the PCI SSC to perform PCI compliance assessments.
Risk: The likelihood a threat will trigger or exploit a vulnerability and the resulting impact on an organization.
Risk Assessment (RA): An assessment of the potential vulnerabilities, threats, and possible risk to the confidentiality, integrity, and availability of payment data held by an organization.
Risk Management Plan (RMP): The strategy to implement security measures to reduce risks and vulnerabilities to a reasonable and appropriate level.
Role-Based Access Control (RBAC): The act of restricting users' access to systems based on their role within an organization.
Secure File Transfer Protocol (SFTP): A secure way to encrypt data in transit. (See FTP)
Secure Socket Layer (SSL): Internet security standard for encrypting the link between a website and a browser to enable transmission of sensitive information (predecessor to TLS). (See TLS)
Self-Assessment Questionnaire (SAQ): A collection of questions used to document an entity's PCI DSS assessment results, based on their processing environment.
Threat: The potential for a person, event, or action to exploit a specific vulnerability.
Transport Layer Security (TLS): A more secure Internet security standard for encrypting the link between a website and a browser to enable transmission of sensitive information. (See SSL)
Two-Factor Authentication (TFA): (See MFA)

Virtual Private Network (VPN): A strategy of connecting remote computers to send and receive data securely over the Internet as if they were directly connected to the private network.
Vulnerability: A flaw or weakness in procedures, design, implementation, or security control that could result in a security breach.
Vulnerable: A state in which a weakness in a system, environment, software, or website could be exploited by an attacker.
Web Application Firewall (WAF): An application firewall that monitors, filters, and blocks HTTP traffic to and from a web application.
Wi-Fi Protected Access (WPA): A security protocol designed to secure wireless computer networks. (See WPA2)
Wi-Fi Protected Access II (WPA2): A more secure protocol version of WPA. (See WPA)
Wired Equivalent Privacy (WEP): An outdated and weak security algorithm for wireless networks.
Wireless Local Area Network (WLAN): A network that links to two or more devices wirelessly.

2022 Guide to PCI DSS Compliance ­ Conclusion | 219

2022 Guide to PCI DSS Compliance ­ Conclusion | 221

ABOUT SECURITYMETRICS
We secure peace of mind for organizations that handle sensitive data. We hold our tools, training, and support to a higher, more thorough standard of performance and service. Never have a false sense of security.TM
We are a PCI certified Approved Scanning Vendor (ASV), Qualified Security Assessor (QSA), Certified Forensic Investigator (PFI), and Managed Security provider with over 20 years of data security experience. From local shops to some of the world's largest brands, we help all businesses achieve data security through managed services, compliance mandates (PCI, HIPAA, GDPR), and security assessments (HITRUST consulting and assessments). We have tested over 1 million systems for data security and compliance. We are privately held and are headquartered in Orem, Utah, where we maintain a Security Operations Center (SOC) and 24/7 multilingual technical support.

CLOSE THE GAPS IN YOUR SECURITY AND COMPLIANCE. LEARN MORE ABOUT SECURITYMETRICS PCI AUDITS.
Learn More

