SESSION ID: MBS-F03
Mobile Security: All You Wanted To Know About Standards But Were Afraid To Ask

Hadi Nahari
Chief Security Architect NVIDIA
hadinahari

#RSAC

#RSAC
Background
 Trusted & secure computing base, cryptography, complex system analysis, HPC, massively scalable systems design, implementation, and governance
 Identity management, asset protection, information-assurance schemes, vulnerability assessment and threat analysis
 Enterprise & Embedded (Netscape, Sun Microsystems, USG, Motorola, Zaplet, MontaVista, eBay, PayPal, NVIDIA...)
 Author of "Web Commerce Security: Design and Development."  Currently Chief Security Architect at NVIDIA
2

#RSAC
Disclaimer
I'm not representing GP (GlobalPlatform), TCG (Trusted Computing Group), or ETSI (European Telecommunications Standards Institute), or my past/current/future employer in this session, thus the opinions do not reflect the official stance of the said-entities. Furthermore, the contents presented here are all based on publically-available material. Opinions are mine: your personal mileage may vary...
3

#RSAC
Agenda
 Motivations  Mobile & IoT  Standards
 GP*  TCG  ETSI
 Conclusion
4

#RSAC
Motivation

#RSAC
General Threat Landscape

>3,000,000,000,000

threats annually

legacy threats blocked

advanced threats
detected undetected

Standardization can help!

50%

25%

1.6 B
number of records lost globally in 2014
$236 M
recovery cost of Target breach (so far)
15 B
connected devices in 2015

25%

(avg. $27.3 loss per incident)

$110 BN
annual price tag of cybercrime

7

#RSAC
Mobile

#RSAC
Evolution
 Two-way radio  Mobile phone  06/29/2007: iPhone  !Smart phone  Tablets/Phablets enter the party  Everything starts looking the same  Mobile is being commoditized: transitioning out to IoT
9

#RSAC
Mobile Security Observations
 Mobile security posture is [kind of] stabilizing*  Core framework and device technologies are finally maturing
 ROT/COT, SEforAndroid, ARM TrustZone, Mobile TPM/HSM, e/SE, etc.  Foundation technologies have/are being commoditized  Ecosystem(s) consolidating:  SoC, OEM/ODM, Stack/OS, MNO, SP, MDM  Liability boundaries are clearer now than in early days  More capable [& cheaper] devices  more value-added auxiliary services  Mobile attack surface hardening  attackers transitioning to softer targets
10

#RSAC
IoT

#RSAC
IoT
 Controllers, processors, CPUs. No standard comm.
 ~standard comm. stack(s): still a mix (WiFi, BT, NFC, ZigBee, etc.)
 Apps and ecosystem  Transition to services  Scaled-up connection
 massive data generation
12

#RSAC
IoT Security Observations
 Lack of standardized orchestration layer  Heterogeneous security capabilities  Multi device management
 Prone to TOCTOU attacks, among others
 Dangerous "atomic" view of the IoT devices
 False sense of security
 Technologies, usecases, attacks, and standards still evolving
13

#RSAC
Standardization

#RSAC
Why Standardization?
 Inherently a political process based on coopetition model
 Most of the time, by mutually distrusting parties
 Similar to legislation: ineffective without meaningful implementation  General benefits
 Safety, reliability, business growth, interoperability, compatibility, repeatability, commoditization, support of policies & legislation
 Quality: security is a subset of QA  i.e. verifying that the specifications are met and nothing else
15

#RSAC
Many Standardization Organizations (SO)
16

#RSAC
GlobalPlatform (GP)

#RSAC
GP Charter
 Working across industries to identify, develop and publish specifications which facilitate the secure and interoperable deployment and management of multiple embedded applications on secure chip technologies
18

#RSAC
GP Specifications Categories
 Card: Configurations, Composition Model, Security Guidelines for Basic Applications, Amendments A, B, C, D, E, F, APIs, Requirements Docs, Alternative Frameworks
 Device: TEE, TEE System Architecture, Client API, Internal APIs, Trusted Applications APIs, Internal Core API, SE API, Trusted User Interface API, Protection Profile, TEE TA Debug Specs., SE Management, SE Remote Application Management, SEAC
 Systems: System Messaging Specification, Systems E2E Simplified Service Management Framework, ...
19

#RSAC
GP First Class Citizens: SE
 Secure Element (SE): a tamper-resistant platform (typically a onechip secure microcontroller) capable of securely hosting applications and their confidential and cryptographic data in accordance with the rules and security requirements set forth by a trusted authorities.
20

#RSAC
GP SE Relevant Specifications
21

#RSAC
GP SE Relevant Specifications
22

#RSAC
SE Security Observations
 Most prevalent form of hardware security chip  Limited processing and storage capabilities  Protection Profile (PP) defined and validated*  Standardized by GP & Smart Card Alliance  Majority of instances (UICC/SIM) use
proprietary* crypto algos (A3, A5, etc.)  Security interactions among different types of
SEs still somewhat wild and undefined  ROT, ACL, OTA, etc.?
23

#RSAC
TrustZone®
 A carve out within Application Processor (AP) for
 Running Trusted Applications (TA)  Providing HW-based isolation  Enabling privileged-access to
system resources
 NS bit in the SCR in CP15 sets the "security state" of the complex
 NS = 1  processor in non-secure  NS = 0  processor in secure state
24

#RSAC
GP First Class Citizens: TEE
 Trusted Execution Environment (TEE): a separate execution environment that runs alongside a Rich OS and hosts trusted services offered to that rich environment.
25

#RSAC
GP First Class Citizens: TrustZone®-based TEE
 Trusted Execution Environment (TEE): a separate execution environment that runs alongside a Rich OS and hosts trusted services offered to that rich environment.
26

#RSAC
TEE Software Stack: TrustedOS
27

#RSAC
GP TEE Relevant Specifications
28

#RSAC
GP TEE Relevant Specifications
29

TEE Security Observations
 Interaction model
 Dichotomized application  Secure World slave*
 Programming model
 Primitive (ANSI C)  Isolation: challenging
 Security model
 Prone to DOS attack  "Busy" Secure World
 Increasingly-complex TrustedOS*
 Trusty, TLK, <t-base, SecuriTEE, OP-TEE, etc.  Reliance on Secure Boot
30

#RSAC

#RSAC
GP Specifications Sum Up

Card
 Specifications  Application model  Lifecycle  Security

Device
 Specifications  TEE Architecture  REE/TEE Interaction
model  Security

Systems
 Messaging specifications
 E2E Simplified Service Management Framework
 Ecosystem, TSM

31

Trusted Computing Group

#RSAC

(TCG)

#RSAC
TCG Charter
 The Trusted Computing Group (TCG) is a non-for-profit organization formed to develop, define and promote open, vendorneutral, global industry standards, supportive of hardware-based root of trust, for interoperable trusted computing platforms
 Members include manufacturers, governments, and academics ­ Cloud computing, operating systems, security research, aeorospace, automotive, SoC, IoT, embedded systems, mobile phones, servers, PCs, laptops, tablets, memory, hard drives, etc.
33

TCG At A Glance
Solutions
 Authentication  Cloud Security  Data Protection  IoT  Mobile Security

#RSAC
First Class Citizens
 Trusted Platform Module (TPM)  Currently at TMP 2.0
 TCG Software Stack (TSS)
34

#RSAC
Other TCG Solutions

 Infrastructure  PC Client  Server  Storage  Trusted Mobility Solutions

 Trusted Multi-tenant Infrastructure  Trusted Network Communications  Network Access & Identity  Trusted Platform Module  Virtualized Platform

35

#RSAC
Notable Specifications & Resources
 Embedded Systems: TCG TPM 2.0 Library Profile for Automotive-Thin, TCG Guidelines for Security IoT
 Mobile: TPM 2.0 Mobile CRB (Command Response Buffer) Interface Specification, TCG TPM 2.0 Mobile Common Profile, TPM 2.0 Mobile Reference Architecture Specifications
 TSS: TSS TAB (TPM Access Broker) Interfaces and Resource Manager, TSS System Level API and TPM Command Transmission Interface Specification, TSS Feature API Specification, TSS Specification, TCG Architecture Overview
36

ETSI

(European

#RSAC

Telecommunications

Standards Institute)

#RSAC
ETSI Charter
 An independent, not-for-profit organizationETSI's Mission Statement describes the primary task to produce top-quality standards for information and communications technologies, including fixed, mobile, radio, converged, broadcast and Internet technologies.
 ETSI has a special role in Europe, including supporting European regulations and legislation through the creation of "Harmonised European Standards."
38

#RSAC
ETSI Technology Clusters
39

#RSAC
ETSI Standards Types

 European Standard (EN)  ETSI Standard (ES)  ETSI Guide (EG)  ETSI Technical Specification (TS)  ETSI Technical Report (TR)  ETSI Special Report (SR)

 ETSI Special Report (SR)  ETSI Group Specification (GS)  Harmonized Standards  Community Specifications

40

#RSAC
Notable Technologies & Standards
 M2M (Interoperability, Communications, Automotive, Smart Metering)
 Mobile (UMTS, 3GPP, GPRS, PCC)  Security (ESI, CAT, HCI, SWP, LI, SSD)
41

#RSAC
Putting It All Together

#RSAC
Apply
 If you're dealing with any of these use cases, then get acquainted with GlobalPlatform
 (mobile) payment, Trusted User Interface, DRM, HDCP, multiple TA
 If you rely on or interact with low-level [HW] system security constructs, then you must be well-versed with TCG standards
 If your products or services rely on telecommunications, and/or you operate in Europe, then follow ETSI
43

Thank You!
Hadi Nahari hnahari@nvidia.com
hadinahari
http://www.wiley.com/WileyCDA/WileyTitle/productCd-0470624469.html

#RSAC

