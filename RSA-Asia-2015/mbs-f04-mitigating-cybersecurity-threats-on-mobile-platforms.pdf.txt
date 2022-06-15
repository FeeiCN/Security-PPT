SESSION ID: MBS-F04
Mitigating Cybersecurity Threats on Mobile Platforms
Selim Aissi, Taeho Kgil, Gyan Prakash
#RSAC

#RSAC
Agenda
 Threats  Mitigation  Summary
2

#RSAC
Threats

#RSAC
Cybersecurity Threats on Mobile Platforms
 Sensitive Information in primary stores (key, data) is leaked (Data Leakage)  Sensitive Information for data-in-use is leaked (Data Leakage)  Sensitive Information Not Cleared From Data-in-use (Data Leakage)  Primary stores (key, data) are tampered with and set to deterministic state
(Tampering)  Code Module, OS platform and device is cloned (Spoofing)  Code Module executing security capabilities tampered with (Tampering)  Denial of Service launched on Code Module (DOS)

#RSAC
Best Practices for Addressing those Threats
 Setting up clear and comprehensive Security Architecture Principles  Setting up clear, comprehensive, and achievable Security Objectives  Defining comprehensive Mitigating Security Controls  Translating those Controls into Platform Security Requirements

#RSAC
Mitigation

#RSAC
Security Architecture Principles
 Apply defense in depth (complete mediation)  Use a positive security model (fail-safe defaults, minimize attack surface)  Fail securely  Run with least privilege  Avoid security by obscurity (open design)  Keep security simple (verifiable, economy of mechanism)  Detect intrusions (compromise recording)  Establish secure defaults (psychological acceptability)  Don't trust external systems

#RSAC
Setting the Security Objectives
 Confidentiality and integrity of cryptographic keys  Confidentiality and integrity of cryptographic process  Confidentiality and integrity of data-at-rest  Confidentiality and integrity of data-in-transit  Confidentiality and integrity of application memory & storage  Confidentiality and integrity of virtual machine codes  Confidentiality and integrity of user input  Integrity of application codes
8

#RSAC
Mitigating Security Controls

Binary Immunization: resist, detect, minimize and repair from tampering

App Logic to Generate Cryptogram based on data elements in Secure Storage

Secure Storage: Host hardened Data, Key, Credential and DFP store

App Logic to establish mutually authenticated Secure Channel
9

#RSAC
Platform Security Requirements
 Hardware & Firmware Security
 Secure Boot  SIM Card Security
 E.g., Mobile Identity Assurance
 Trusted Execution Environment
 E.g., Trusted UI, Key Management, SIM lock, HD content protection
 Mobile Device Vendor Specific Native APIs
 E.g., SMART APIs
 OS Platform Security
 Application Signature Verification  Access Control & Application Isolation  Integrity Framework

#RSAC
Summary
 Setting up clear and comprehensive Security Architecture Principles  Setting up clear, comprehensive, and achievable Security Objectives  Defining comprehensive Mitigating Security Controls  Translating those Controls into Platform Security Requirements

