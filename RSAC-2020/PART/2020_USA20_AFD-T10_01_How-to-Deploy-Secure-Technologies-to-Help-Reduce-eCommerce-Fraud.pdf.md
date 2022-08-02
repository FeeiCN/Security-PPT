SESSION ID: AFD-T10
How to Deploy Secure Technologies to Help Reduce E-Commerce Fraud

Bill Newhouse
Senior Cybersecurity Engineer National Institute of Standards and Technology National Cybersecurity Center of Excellence @cybernewhouse

#RSAC

#RSAC
Learning Objectives
Frame cybersecurity risks in retail and hospitality sectors Learn how to leverage NIST's Cybersecurity Framework to mitigate online fraud Explore what technologies can improve cybersecurity and reduce online fraud
2

#RSAC
The Online Retail/Hospitality Landscape & Threats to E-Commerce

#RSAC
Retail & Hospitality Landscape
Online sales rapidly accelerating, while in-store sales slow
­ Black Friday/Cyber Monday online sales up 20% from previous year ­ In store purchases fell 3% during same period
(source: Reuters)
Mobile purchases also rapidly accelerating
­ Mobiles sales will account for $45% of e-commerce by 2020
(https://www.businessinsider.com/mobile-commerce-shopping-trends-stats)
Hospitality organizations (hotels) are rapidly embracing IoT and other connected technologies to improve guest experiences.
4

#RSAC
5

#RSAC
E-Commerce Under Threat
Malicious actors shift from using stolen credit card data in stores at the checkout counter to using stolen credit card data for fraudulent online shopping.
6

#RSAC
E-Commerce Under Threat
Retail fraud attempts have TRIPLED since 2017 and each $1 of fraud costs a retailer $3.13.
Source: LexisNexis® Risk Solutions 2019 True Cost of Fraud SM Study - Retail Edition Available: https://risk.lexisnexis.com/insights-resources/research/2019-true-cost-of-fraud-study-e-commerce-retail-edition
7

#RSAC
E-Commerce Fraud Scenarios
Data Breaches ­ when sensitive data is leaked from a secure location to an untrusted environment Phishing or spoofing ­ when a scammer uses fake email, text messages, or copycat websites to steal your identity or personal information Credit card fraud ­ when scammers obtain money or property through the unauthorized use of a credit or debit card or card number
8

#RSAC
9

#RSAC
Accelerate adoption of secure technologies: collaborate with innovators to provide real-world, standards-based cybersecurity capabilities that address business needs

#RSAC
NIST Special Publication 1800-17
Multifactor Authentication for E-Commerce Deploying risk-based, Fast Identity Online (FIDO) multifactor authentication to protect online purchases

#RSAC
Protecting the E-Commerce Ecosystem

Customer

Online Shopping Platform
12

Retail Back Office

#RSAC
Project Capability Goals
Integrate MFA into online shopping systems
Mitigate potential exposure to online fraud
Integrate into a variety of retail-information technology architectures Provide authentication options to retailers:
­ Capabilities that assess and mitigate a retailer's shopping transaction risk factors
­ Alert retailer staff to potential threats, and adjust authentication mechanisms as needed
13

#RSAC
E-Commerce Fraud Vulnerabilities
E-Commerce organizations can be susceptible to the following vulnerabilities if they possess the certain characteristics.
Credential stuffing:
­ allow multiple incorrect logins without account lockouts ­ purchasers have reused the same password on multiple systems
Account takeover:
­ accept weak passwords ­ allow multiple incorrect logins without account lockouts ­ account password-reset options are easily circumvented
14

#RSAC
Moving Beyond Passwords
"Since most users choose short passwords to facilitate memorization and ease of entry, passwords typically have fewer characters than cryptographic keys. Furthermore, whereas systems choose keys at random, users attempting to choose memorable passwords will often select from a very small subset of the possible passwords of a given length, and many will choose very similar values.
As such, whereas cryptographic keys are typically long enough to make network-based guessing attacks untenable, user-chosen passwords may be vulnerable, especially if no defenses are in place."
­ NIST Special Publication 800-63-3, Digital Identity Guidelines
15

#RSAC
Standards
NIST Cybersecurity Framework Fast Identity Online (FIDO)
16

SP 1800-17 Products and Technology

Component

Specific Product

Retailer E-Commerce Platform Magento Open Source version 2.1.8

Cybersecurity Framework Subcategories
· PR.AC-1
· PR.AC-7
· RS.AN-1

U2F/Risk Assessment Module Magfido risk assessment policy rules · ID.RA-4

and process module

· ID.RA-5

Risk Engine Multifactor Authentication Mechanism
Multifactor Authenticator
Logging / Reporting Dashboard

RSA Adaptive Authentication (Cloud) 13.1
StrongKey SKCE version 2.0 opensource FIDO U2F Server and TokenOne cloud-based authentication Yubico YubiKey NEO Security Key USB-A ports & Near-field communication (NFC) active devices; TokenOne smartphone application authenticator Splunk Enterprise version 6.6.1

· ID.RA-4 · ID.RA-5 · PR.AC-1 · PR.AC-7
· PR.AC-1 · PR.AC-7
· DE.CM-1

17

#RSAC

#RSAC
Mapping to Standards (example from NIST SP 1800-17)

Cybersecurity Framework v1.1

Function

Category

Subcategory

PROTECT (PR)

Identity Management, Authentication, and Access Control (PR.AC)

ID.RA-4: Potential business impacts and likelihoods are identified
ID.RA-5: Threats, vulnerabilities, likelihoods, and impacts are used to determine risk

Standards and Best Practices Alignment

NIST SP 800-53 Rev 4

ISO/IEC

NIST SP 800-181 NICE

Security and Privacy

27001:2013

Framework Work Role

Controls

AC-1 and AC-2: Access

A.9.2.1, A.9.2.2, OM-ANA-001: Systems Security

Control Family

A.9.2.3, A.9.2.4, Analyst

IA-1 - IA-11: Identification A.9.2.6, A.9.3.1, PR-CDA-001: Cyber Defense and Authentication Family A.9.4.2, A.9.4.3 Analyst
OM-ADM-001: System

Administrator

OV-PMA-003: Product Support Manager

SP-DEV-001: Software Developer

18

SP 1800-17 Reference Architecture

Returning Purchaser

Returning Purchaser

Returning Purchaser Computer

HTTPS

Retailer E-Commerce Platform Administrator Authentication
E-Commerce Platform, Authentication, and Logging
Solution Services
Authentication Server Cloud-Based

Retailer E-Commerce
Platform

Risk Assessment
Redirect Module CryptoEngine Plug-In

TLS HTTPS

FIDO U2F Server
Cloud-Based Risk Engine

Retailer Database
19

Logging and Reporting Dashboard

#RSAC

#RSAC
Benefits of Implementing NIST SP 1800-17
The NCCoE's practice guide to Multifactor Authentication for ECommerce can help your organization: · reduce online fraudulent purchases · show customers that the organization is committed to its security · protect your e-commerce systems
· provide greater situational awareness · avoid system-administrator-account takeover through phishing
· implement the example solutions by using our step-by-step guide
20

NCCoE Portfolio
· Attribute Based Access Control (SP 1800-3)
· Consumer/Retail: Multifactor Authentication for e-Commerce (SP 1800-17)
· Data Integrity: Identifying and Protecting
· Data Integrity: Detecting and Responding
· Data Integrity: Recovering (SP 1800-11)
· Derived PIV Credentials (SP 1800-12)
· DNS-Based Email Security (SP 1800-6)
· Energy: Identity and Access Management (SP 1800-2)

#RSAC

· Energy: Situational Awareness (SP 1800-7)
· Financial Services: Access Rights Management (SP 1800-9)
· Financial Services: IT Asset Management (SP 1800-5)
· Healthcare: Securing Electronic Health Records on Mobile Devices (SP 1800-1)
· Healthcare: Securing Wireless Infusion Pumps (SP 1800-8)
· Healthcare: Securing Picture Archiving and Communication Systems (PACS) (SP 1800-24)
· Healthcare: Securing Telehealth Remote Patient Monitoring Ecosystem
· Hospitality: Securing Property Management Systems (SP 1800-27)

· Manufacturing: Capabilities Assessment for Securing Manufacturing Industrial Control Systems
· Mobile Device Security: Cloud and Hybrid Builds (SP 1800-4)
· Mobile Device Security: Enterprise Builds (SP 1800-21)
· Mobile Threat Catalogue
· Privacy-Enhanced Identity Federation
· Public Safety/First Responder: Mobile Application SSO
· Secure Inter-Domain Routing
· TLS Server Certificate Mgmt
· Transportation: Maritime: Oil & Natural Gas
· Trusted Geolocation in the Cloud (NISTIR 7904)

21

#RSAC
Detailed Reference Architectures Available
22

#RSAC
U.S. Department of Commerce National Institute of Standards and Technology (NIST) Information Technology Laboratory Applied Cybersecurity Division
National Cybersecurity Center of Excellence (NCCoE) Cybersecurity Framework Trusted Identities National Initiative for Cybersecurity Education (NICE) Privacy Framework

#RSAC
Cybersecurity Framework consists of standards, guidelines, and best practices to manage cybersecurity-related risks.
https://www.nist.gov/cyberframework
NICE Framework - a taxonomy and common lexicon that describes cybersecurity work and workers
24

#RSAC
Workforce Needs to Implement SP 1800-17
25

#RSAC
Security and Privacy
Are you addressing privacy risks and the growth in regulations regarding privacy?

#RSAC
NIST Privacy Framework
27

#RSAC
NIST Privacy Framework
28

#RSAC
Summary
Frame cybersecurity risks in retail and hospitality sectors Learn how to leverage NIST's Cybersecurity Framework to mitigate online fraud Explore what technologies can improve cybersecurity and reduce online fraud
29

#RSAC
Questions?

