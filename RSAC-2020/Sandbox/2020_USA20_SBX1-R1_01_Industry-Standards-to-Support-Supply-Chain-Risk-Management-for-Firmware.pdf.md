SESSION ID: SBX1-R1
Industry Standards to Support Supply Chain Risk Management for Firmware

Lawrence Reinert
Laboratory for Advanced Cybersecurity Research National Security Agency

Monty Wiseman
Cybersecurity, Controls & Optimization General Electric; GE Research Center @montywiseman32

#RSAC

Problem: Trusting the Supply Chain
Hardware and Firmware
#RSAC

Manual Supply Chain­Supplier to Receiving Platform Supplier

Need: Cryptographic methods to remotely prove the authenticity of a Platform's
hardware and firmware

Receiving

Current practice relies on trusting people and agreements

Inspecting Firmware at Scale

· Source: Platform Supplier · Updatable

· Source: Platform Supplier or 3rd party
· Updatable

Plat f/w

Opt ROMs

Boot Mgr

OS Loader

OS

Attester

Reset

Why do we care? · Detecting Counterfeit devices and device components · Firmware: Malware and Vulnerable Versions of older firmware
· Autonomous and Invisible Computing · Some modules run in parallel to the OS (e.g., SMI) or while the computer appears "off" (i.e., Suspend, Hibernate) · Firmware signing necessary (e.g. via UEFI Secure Boot) but only verifies module's source for updates · Verification keys are modifiable (in most configurations) · Does not provide explicit evidence of f/w integrity to (scalable) remote verifiers · Plat f/w configures all components (e.g. memory, USB, wireless devices, etc.)

Solving the Problem
Adding Trust in the Supply Chain (Platform Hardware and FW) using TCG Standards
#RSAC

TCG Standards: Hardware Supply Chain

Platform Supplier

Platform

Certificate

Receiving

EK Certificate

· TCG Endorsement Key & Platform Certs bind Supplier to platform · Provides Cryptographically bound Device Identity · Hardware Bill of Materials ­ lists components in device · Counterfeit detection · Component lists deter parts swapping

TCG Standards: Firmware Supply Chain

Platform Supplier

RIM

Platform Firmware

Receiving

Boot Configuration

OS loader

Option ROMs

...

· TCG Reference Integrity Manifests (RIM) · (aka Golden Measurements) · Provides references for detecting Firmware and Boot
Software modifications · Provides verifiable factory configuration settings

Comparing Expected (Golden) Values with Delivered

Platform Supplier

Extend SWID Tag to make it a RIM · SWID Tag an adopted ISO standard(1) · TCG added extensions:
· Reference Integrity Manifest (RIM) · Expected PCR Values

RIM
Platform Firmware Boot Configuration OS loader Option ROMs
...

Verifier

Plat f/w

Opt ROMs

Boot Mgr

OS Loader

OS

Attester

PCRs
RTM

Reset PCR

00

TPM Quote

PCRs (0..n)
07

TCG defines how firmware is "measured" into TPM
(1) ISO-IEC 19770-2 & NISTIR 8060: https://nvlpubs.nist.gov/nistpubs/ir/2016/NIST.IR.8060.pdf

Acceptance Test Using TCG Specifications Platform Supplier

Receiving

Platform Certificate
RIM
Platform Firmware Boot Configuration OS loader Option ROMs
...

Verifier

TPM Quote PCRs (0..n)

Summary and Demo
#RSAC

Achieving Trusted Supply Chain
Trusted Supply Chain can be achieved using open standards
­ Using Trusted Platform Modules (TPM) ­ Using TCG defined Certificates (Endorsement Key & Platform) ­ Reference (Golden) Measurements from a Trusted Source
E.g., the original platform supplier (OEM)
Open source software is available
11

Demo
Trusted Supply Chain: Hardware and Firmware
#RSAC

Example RIM ­ Based on DRAFT TCG Specification
https://trustedcomputinggroup.org/wpcontent/uploads/TCG_RIM_Model_v1-r13_2feb20.pdf

Action
#RSAC

Think
Do you know where your hardware platform "really" came from?
­ Can you identity all computers on your network ­ If they are malicious, will the software really identify itself?
Do you know if the firmware (or even OS, apps) is authentic?
­ Remember, the firmware's execution is long before the OS and any antimalware is running
Without trusted hardware there is now way to know
15

Download and Review
Industry Specification:
­ TCG Platform Certificate: https://trustedcomputinggroup.org/wpcontent/uploads/TCG-Platform-Attribute-Credential-Profile-Version-1.0.pdf
­ TCG Reference Integrity Manifest: https://trustedcomputinggroup.org/wpcontent/uploads/TCG_RIM_Model_v1-r13_2feb20.pdf
Get involved with Trusted Computing Group
­ More standards being developed in this area
Review Open Source projects
­ HIRS: https://github.com/nsacyber/HIRS ­ Go-Attestation: https://github.com/google/go-attestation
16

References

Software Identification tags
­ SWID tags support software inventory and asset management initiatives
­ ISO-IEC 19770-2
Requires purchase
­ NISTIR 8060
Describes SWID tags in sufficient detail for our purposes https://nvlpubs.nist.gov/nistpubs/ir/2016/NIST.IR.8060.pdf
­ CoSWID
https://datatracker.ietf.org/doc/draft-ietf-sacm-coswid
Records unique information about an installed software application
­ Its name, edition, version, etc. ­ whether it is part of a bundle and more

Tools:
­ https://tagvault.org/about/ ­ https://github.com/strongswan/swidGenerator
Other references:
­ https://csrc.nist.gov/Projects/Software-IdentificationSWID/management

17

