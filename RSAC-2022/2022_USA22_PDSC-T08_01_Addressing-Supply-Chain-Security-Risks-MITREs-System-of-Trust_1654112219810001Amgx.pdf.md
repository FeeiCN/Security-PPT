SESSION ID: PDSC-T08
Addressing Supply Chain Security Risks - MITRE's System of TrustTM
Robert Martin
Sr. Software and Supply Chain Assurance Prin. Eng. Cross Cutting Solutions and Innovation Dept. Cyber Solutions Innovation Center MITRE Labs
© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

#RSAC

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented.
Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

2

#RSAC
Supply Chain Example ­ Consumer Clothing

Agriculture (natural fibers)

Cotton

Wood

China USA India Pakistan Brazil Uzbekistan

USA Brazil Russia Sweden

Trims

China India Southeast Asia

Yarn

Textiles

Garments Manufacturer

Distributor

China Bangladesh Vietnam India Turkey

UK EU USA

Chemicals (synthetics)
USA Southeast Asia Middle East

China India Southeast Asia USA

China India USA Turkey South Korea

https://imgs.mongabay.com/wp-content/uploads/sites/20/2020/04/23100736/FF_Supplychain.png

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

Retailer

Consumer

UK EU USA

UK EU USA

Disposal

3

#RSAC
Supply Chains
Generic Supply Chain

Micro-

eSleoeafctftworoarndeics

Supply

</>

Chain

Code

Commit Build

Test

Package Release

Deploy

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

4

Supply Chains are Complex and Opaque
??

Customer

Integrating Manufacturer/
Supplier

Tier 2 Manufacturer/ Supplier

Supplier

COTS

Tier 2 Manufacturer/ Supplier

Tier 3 Manufacturer/ Supplier

Tier 2 Manufacturer/ Supplier

Tier 3 Manufacturer/ Supplier
US Tier 3 Manufacturer/
Supplier

Global

Tier 2 Manufacturer/ Supplier

Foreign

Software

Off-shore US

Foreign Location
Foreign Developers

Acquire
? ?

Supplier

Reuse

Develop In-house
?

Outsource
? ?
© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

#RSAC

Tier 4 Manufacturer/

?

Supplier

?

Tier 4 Manufacturer/ Supplier

? ?
?

Contractor

? ? ?

?

1956-1970 1970-1980 0.8k TEU 2.5k TEU

1980-1988 4k TEU

1988-2000 5k TEU

2000-2005 2006-present 8k TEU 15.5k TEU

#RSAC
Next... 18k TEU

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

6

#RSAC
Software is Ubiquitous, Assembled, and Critical

IT Risk

Operational Risk

Loss of data or capability

Loss of safety or reliability

Loss of property or lives

Scratch Built Software
Majority of products built with no 3rd Party dependencies
Traditional Computers

Assembled Software
Use of open source and 3rd party libraries, modules, frameworks, and services
Multi-party software updating/patching
Software Enabled Everything

Servers Desktops Laptops Tablets Switches

databases office apps e-mail browsers Routers

Healthcare Aeronautics Smart Energy
Oil & Gas Microgrids

Implantable Medical

Smart Munitions

Smart Manufacturing Intelligent Vehicles

Water Treatment Intelligent Shipping

Hydro Power Dam Management

Smart Cities Building Management

Autonomous Systems

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

7

#RSAC

Software Enabled Critical Infrastructure and Mission Capabilities...

Medical

Buildings

Aeronautics

Manufacturing

Vehicles

Energy

Shipping

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

#RSAC
Whether for Fish, Chips, or Software Supply Chain Trustworthiness: Intentional AanctdsUnintentional Acts.
Supplier

Supplier
System Integrator or Developer

Acquirer

Intentional acts
· Counterfeit products · Disruption, hijacking, theft, civil unrest,... · Malicious taint or insertion

Manufacturer
Supplier Supplier
Based on SEI/CMU materials

Unintentional acts
· Poor quality/tainted goods/shortages/weather disruptions
· Vulnerable software/hardware inserted unintentionally (components/modules w/weaknesses and/or known vulnerabilities)
Result of Supply Chain Attacks: Systems with adverse behaviors including functional degradation, data exfiltration, espionage, adversarial control and disruption.

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

9

Supply Chain Security Risk Management: Elements of Practice

Traditional SCRM (Logistics)

Organizational Operations and Risk Management

· Supplier Economic Viability

· Training/Professional Education/Awareness

· Fitness for Purpose (form, fit, function)

· Legal Authorities and Policy (General Counsel)

· Source of Materials (non electronic)

· Human Resources

· Inventory Management/Just-in-time

· Physical Security

· Vendor/supplier payment
· Third-party service providers Cyber-Supply Chain Risk Management (C-SCRM)

· Logistics

· Anti-Tamper · Shipping/Receiving

· Risk evaluation of tier 1 ­ tier n supplier · Flow-down of requirements to sub-tiers

· Source of materials (ICT/IoT) analysis

· Alternative sources (contingency planning)

· Transit/warehouse/loading dock security

· Bill of materials ­ analysis and tracking

· Blind buy strategies

· S/W and H/W risk analysis

· SCADA, IoT, IIoT lifecycle management

· Security architecture · Privacy · Data security · Phishing & Social Engineering

· Disposal/retirement planning and execution · Sustainment strategy/delegation to service provider · Cloud (SAAS, PAAS, IAAS) services · Anti-Tamper

· Criticality and dependency analysis

· Statutory compliance

· Network/workstation security

· Submission of documents

· Insider threats/Employee misconduct

· Program Protection Planning

· Product hygiene/Application of patches

· Budget/resource consideration

Traditional Cyber Security/Risk Management

Acquisition/Procurement

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

#RSAC

Open Question: What Supply Chain Risks to Manage?

#RSAC

COTS ICT

Trustworthy Goods
? ? ? ???? ?????? ???????? ???? ? Supplier ? ? ??? ??? ??? ? ?? ?? ? Data

High Value & High Unit cost COTS
Outsourced Services

SOFTWARE

Counterfeit Goods

Buyers/

Icons thanks to catkuro, Smartline, Pixel perfect, Smashicons, Eucalyp, and Freepik

Acquirers

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

11

#RSAC
Open Question: What Supply Chain Risks to Manage?

Project A

Project B

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

12

Supply Chain Risk Areas

Quality Culture of th#eRSSuApCplier

Natural Disasters and Hazards
Icons thanks to freepik

Floods Avalanche Drought Winds Heavy Rains Pandemics Earthquake Volcanoes Tornadoes Forest Fires Snow Thunderstorms Tsunamis

External Influences of the Supplier
3RD PARTY

Financial Stability of the Supplier Organizational Stature of the Supplier Susceptibility of the Supplier

Maliciousness of the Supplier Organizational Security

Human Hazards

Attackers & Counterfeits

Hijacking Corporate Corruption Traffic Congestion

Interdependent Civil Disruption Supply Chains
© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

National Corruption
13

#RSAC
Supply Chain Security (SCS) System of Trust (SoT) "What Supply Chain Risks to Manage?"
SoT - a strategic, widely-adoptable, holistic, data-driven analysis platform to assess supply chain security risks

Address Chaos, Align & Organize

Simplify, Tailor & Use

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

14

Trust Aspects

Suppliers

Risk Areas

Basis of Trust

#RSAC

External Influences Organizational Stature
Financial Stability Maliciousness
Organizational Security Quality Culture Susceptibility
Risk Areas
Hygiene Counterfeit Malicious Taint
Risk Areas
Security Reliability
Quality Integrity

·· PQ··· CcruOOIPoCeorrrdoToggsuduaatHmuicnnonaciitzznrtpdaaQtQawttriiubuaooiaaannelrenlelihhitsytdaaPyyssReroobccefdooqtofunnumcccirctreeeaeQrromnnnuiiiaengannnglggittcnesylaemebvirelerietlnynotltfoaliqptuaiiyodiittnys adsnehdbtcsipabsashsfelowdwointhlevel of

·
·
·

Q···CcFudSooooOOeoeooorrbsfggtSSSSutrtw,maaiooooeoaannnffffttttsriinwwwwzziepstgaaaaaaerPrrrrttbatiieeeeinrooselonnACDPenadnroesnhhurofyonsdiaavceimnsgesstoieansnaQgohhqtalneSyfiiuunssipnciaiCmcstttccooiyleoyeaiprrttnoyyy&llritrcrsooaPionatfftyleetbbcdtwiaeiigoeoninarkegnrrnredunt/apsairthngclyiepctloooroflcileranpwassotuiiotrsantsioinn

·· P·GrooOindersgu...taaocbntipilziRtayoetidosluniieltihietaconssachteeilswtoianrrydssohftiepaxipsbslicuilietiftinydings/ratings of financial

·
·
·

PQ·······KaoruoOOOISIIeCCnnfdeorrrsaTTgggufcddttyaaawicHHeonnnoqataaiiinnMzzzurrrSneddaaaaaoetttwwbtPciiieaooocaalrnnnneeuoprrneedrr-hhlfoaruiuaaPPapttcnceysstrrktooucgehhRtddroiiioerssuueefnttccssoocmottifrrluoioRSyyuerreentoorenclcecsffooueinnlSloanireecEittkttenryyConcpliPeln(eatodyipretmuufyorenbrsncelirlticasgoesnfsinllciifanoinegutdsneiitonelfronp(ramsKrta)htMiinoivnpePsst)igations

· ·NCInaofomtrmpioaantniyonhaaolsnccporonocdreurrcnutinmpgaRntui&ofDacnitnuvrerstinmfeonrmt laetvioenl systems not backed

·· Q··NuOuMeparsisgrtctaeiooingoninuzfliaangtbruiloayrleneldhpaagrcsococfeiovtsnascebceiorrlninntitynroaglsinnovcnenpetroordyutuctrnmoavneur fraacteturer information

· ··
··
·

VVV·········OPiPTuuunGOsStUcWm............lllrnnnryyooaesrrraesbeeeaognencgnatllerrrsasrseuiinkaaasrosniimatttsftbbbaiiiiiopeevzdsrscccniiifearciellltptoppuiiihtunaaiitttifnrorerityyyzootieaifntrllfoymdirlootactriruryoovistamaffnarcettaronfiuffttagoioiriiatEonmontinnrnineftklmiornaaansaocnxenigasnnnhnmoteliuyponccdioeovfowpfiiarndaoeaarcaicoaiunowrllsgotstgudyindsshftbrusaceaenttetceaaleoneirptfrdlebbtmoinimrrinrcoiirtsfsrllmagafoyiiiPtsttntrihyyoamnuhnoefittaantoopcticriepooitfmnsunznocrtoearsrraaoyeryrplnskistngttieeeosonddtmnfnwispa(nchrdcPfoilolctodueoEuneonircnonstPtntpcrrheetsoycrse)oliicvalel

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

15

MITRE Supply Chain Security System of Trust Risk Areas* **

#RSAC

MITRE's Supply Chain Security System of TrustTM https://www.mitre.org/publications/technical-papers/trusting-our-supplychains-a-comprehensive-data-driven-approach

* Supply Chain Security Top 75 Risk Areas Levels 1-4 ** System of Trust Expanding to Pharma, Food, and other types of Products

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

16

Taxonomy/Vocabulary

Analytic Methods

Flexible Technology Stack

Data Model
Piloting
11, 3, 1, 6, 22, 12, ...
Export to Spreadsheet for "Offline" Assessment

Risk Model Manager (RMM)
© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

#RSAC
17

Tying together SoT and RMM

Pilot 3

#RSAC
Pilot 1

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

18

Company 1 Company 5

Company 2 Company 6

Company 3 Company 7

Company 4

#RSAC

Company 8

Company 9

Company 10

Company 11

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

Applying
System of Trust Pilot 1: Companies of Interest
Supplier and Public Data Profile of the System of Trust
Using 5 Risk Categories With 26 Risk Factors
19

Company 10

#RSAC
13. Citizenship of Key Persons 14. Ownership Structure 15. National Corruption 16. Political Vulnerability 17. National Governance 18. Geopolitical Instability 19. PEP Members in Corporate Leadership

8. IT Security Status 9. Data Security Status

1. Solvency Ratio 2. Inventory Turnover 3. Liquidity + Cash Flow Risk 4. Corporate Payment Score 5. Mergers & Acquisition Risk 6. Gross Profit Margin 7. R&D Costs by Industry Sector

10. Intellectual Property Litigation 11. Sanction List Status 12. Fraud and Corruption

Applying Pilots 1, 2, 4 & 5
Supplier and Public Data Profile of the System of Trust
Using 5 Risk Categories With 26 Risk Factors

20. Natural Disasters 21. Geographic Concentration 22. Mergers & Acquisition Frequency 23. Operational Volatility 24. Sustainability 25. Corporate Ownership 26. Diversity and Inclusion

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

20

SoT's Risk Model Manager "Modes" ­ An Analogy

#RSAC

We should do a survey ­ we need a questionnaire!

Okay, but what questions should we ask?

here are all the questions you could potentially ask about supply chain security
risks

nice but I see something I want to change for the purposes of my survey

now I just need a subset of these questions to
create my questionnaire

now I just need to fill one of these out for every person I
interview!

View

Edit (optional)

Tailor

profiles

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

Assessments

SoT.MITREF.ourlgl SvoeTrs­ioRnisokf MSodTe­lRMisaknaMgoedrel Manager

#RSAC

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

22

SoT Risk Model Manager Platform Technical Architecture

#RSAC

Flexible Technology Stack

Risk Model Manager (RMM)

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

23

#RSAC

queries/ analyzes

Data Source
· data source type · availability scope · access method · cost

queries/ analyzes

Data Source
· data source type · availability scope · access method · cost

queries/ analyzes

Data Model

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

24

#RSAC
Building up Sources of Insight about Supply Chain Risks

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

25

Mapping SoT Risks to Assessment

SCS 9001

#RSAC

Information Sources / Standards

Along with DHS ICT SCRM Task Force Vendor Template, ISO/IEC 62443, and others, ...

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

26

#RSAC
GOAL for use of SoT in Industry and Government...

Top-Level Concerns Vendor/Product A

Malicious Taint

Organizational Security

Counterfeit

Maliciousness

Hygiene

Top-Level Concerns Vendor/Product B

Organizational Security

Malicious Taint

Counterfeit

Maliciousness

Hygiene

Quality Culture

Service Security Quality Culture

Service Security

Susceptibility

Service Quality

Organizational Stature

Service Integrity

Financial Stability

Service Reliability

External Influences

Susceptibility

Service Quality

Organizational Stature

Service Integrity

Financial Stability

Service Reliability

External Influences

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

27

Effective Supply Chain Trust Interactions

#RSAC

COTS ICT

Trustworthy Goods

High Value & High Unit cost COTS

Supplier

System of
Trust

Outsourced Services

Data

SOFTWARE

Counterfeit Goods

Icons thanks to catkuro, Smartline, Pixel perfect, Smashicons, Eucalyp, and Freepik

Buyers/ Acquirers

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-91

28

Software Supply Chain Integrity Attack (a.k.a SolarWinds)
1. Preparatory compromises at SolarWinds date back to October 2019. (Refs 11 & 12) 2. At some point there was a compromise of the build environment itself. 3. Malicious code sent in SolarWinds updates released between March and at least June 2020. (Refs 32 & 33) 4. Approximately 18,000 organizations receive the tainted updates and may have been targeted and impacted.

#RSAC

</>

Code Commit Build

Test

Package

Producer

1

2

3

Build and Distribution Infrastructure

Release

Deploy 4

Operate Monitor Consumer

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

29

#RSAC
Software Supply Chain Integrity

Jan 2021

Evidence Based Trust

SBOM

SBOM

SBOM

SBOM

SBOM

SBOM

SBOM

</>

Code Commit Build

Test

Package Release

Deploy Operate Monitor

Producer
Secure & Hardened Build and Distribution Infrastructure

Compare

Consumer Accept

https://www.mitre.org/sites/default/files/publications/pr-21-0278-deliver-uncompromised-securing-critical-software-supply-chains.pdf

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

30

Software Bill of Materials Standardization

Open source components
Developed components

ISO/IEC 5962:2021 SPDX®

OWASP CycloneDX

ISO/IEC 19770-2:2015 SWID tags

Libraries

Build Tools

Other documents:

Multimedia, text

Build process

Makefiles

Purchased components purchased
Micro Controller Firmware

Target Images

Generated code Execution

Dynamic libraries
External executables

Embedded System Image

Disk Images

Virtual Machine Images

Container Images

Package Feeds

SDKs & Build Tools

#RSAC
Usage Scenarios Around SBOMs
Refer, Transfer or Purchase
(definition of what it is)
Pedigree
(history of how it was produced)
Provenance
(chain of custody of it)
Integrity
(cryptographic basis of unalteredness)
Proper and Legal
(conditions about its use)
Known Sw Vulns
(known fixes are applied to it)
Assurance
(safe-secure-resilient)
SBoM of a SW Service
(SBoM of sw delivering service)
Supply Chain Sequence Integrity

https://www.mitre.org/publications/technical-papers/standardizing-sbom-within-the-sw-development-tooling-ecosystem

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

31

3.0 effort

#RSAC

https://github.com/spdx/spdx-3-model

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

32

#RSAC
Lowering Adoption Hurdles for SBOMs and more

SBOMs SBOMs SBOMs

SBOMs

· Medical Devices · Merchandise · Automobiles · Trains · Vessels/Boats · Building Mngt Sys · Software

· Agriculture and Food · Energy · Transportation · Chemical Industry · Postal and Shipping

· Water · Public Health · Telecommunications · Banking and Finance · Key Assets

End Users in Industry, Government, and Commerce

Product & Service Suppliers

ICT SCRM Task Force HBOM Working Group

INTEGRATED DEVELOPMENT ENVIRONMENTS (IDES)

SOFTWARE COMPOSITION ANALYSIS

SOURCE CODE & PACKAGE REPOSITORIES

FRAMEWORKS BUILD CHOREOGRAPHY

CLOUD TOOLS LIC MNGT

Tools & Capabilities for Software

INVENTORY MANAGEMENT SYSTEMS

PRODUCT LIFECYCLE MANAGEMENT (PLM) TOOLS

STANDARD OPERATING PROCEDURES

CAD SYSTEMS

CATALOG BUILDERS

BOM MANAGEMENT SYSTEMS

Tools & Capabilities for Hardware

3.0 effort

License Profile

Pedigree Profile

Provenance Profile

SW BOM Profile

HW BOM Profile

X Profile

Build Profile

Defects Profile

Core BOM

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

https://github.com/spdx/outreach/blob/ main/SPDX and 3T-SBOM Intro.pptx
33

Supply-chain Levels for Software Artifacts (SLSA)
SLSA guidelines have 4 levels of incremental and actionable things that software producers can claim to do to protect against specific integrity attacks
https://github.com/slsa-framework/slsa

#RSAC

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

34

#RSAC
Software Development and Assurance Lifecycle Phases

Operational Need

Delivered Capability

Business or Mission Analysis
CONOPS Analysis

Disposal Sustainment and Continuous Engineering

Stakeholder Needs & Requirements Definition

Requirements

Validate Solution

Operation

Attack Surface Analysis Architecture Review

System Requirements Definition Architecture Definition

Continuous Application Across Software Lifecycle

Design

Product

Validation Transition

Red Teaming Blue Teaming
Pen Testing

Design Review

Design Definition

Implementation

Attack Surface Analysis

System Analysis

Integration Verification

Dynamic Analysis Tool C Fuzz Testing

Code Review

Support Development

Static Analysis Tool B Static Analysis Tool A

NOTE: Lifecycle processes typically occur simultaneously, not in sequence; see ISO/IEC 15288 & 12207 NOTE: Implementation, Integration & Verification are often performed continuously & simultaneously with the aid of Integrated Development Environments (IDEs) & other tools.
Figure 3-2 from "Software Trustworthiness Best Practices," 2020, https://www.iiconsortium.org/pdf/Software_Trustworthiness_Best_Practices_Whitepaper_2020_03_23.pdf

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

35

Supply Chain Integrity Transparency

#RSAC

and Trust (SCITT)

Technologies leveraged:

· Claims/Evidence, Confidential Ledgers, Hardware Roots of

Trust, BOMs, CBOR (RFC 8949) and COSE (RFC 8152)

SCITT:

· defines minimum standards around the:

· preparation, storage, distribution, consumption,

validation and evaluation of arbitrary claims/evidence

about artifacts that are critical to maintaining the integrity of supply chains

· specifies an end-to-end system for validating arbitrary claim/evidence artifacts in terms of supply chains whose integrity has been proven.

· is applicable to both hardware (objects in the physical world) and software (digital) artifacts.

· does not define how artifacts are produced or distributed, nor the methods by which claims/evidence about artifacts are

produced prior to preparation for inclusion in SCITT.

https://github.com/ossf/wg-supply-chain-integrity

https://www.ietf.org/mailman/listinfo/scitt

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

36

SofTtwraanresSpSuauprppeplnylcyCyChahaniadninTInrStueesgctur(irStiytCyITRTis) ks

Example policy: · All commits
signed by approved developers

Policy Gate 
Producer </>



Example policy: · Source
provenance acceptable · Third-party packages match their BOMs


Example policy: · Build environment
BOM acceptable · Build output BOM
matches published package

Example policy: · Scan results
acceptable



Example policy: · Release approved · Build output BOM matches
deployment payload · Build configuration acceptable · No known unmitigated
vulnerabilities
 Consumer

Code

Commit

Build

Test

Package

Release

Deploy

Signed Evidence 
Example evidence: · Commit signature
proof

Example evidence: · Build trigger
record

Example evidence: · Build parameters · Build
environment BOM · Build output BOM

Example evidence: · SAST/DAST scan
results · Fuzz test results

Example evidence: Example evidence: · Release approval · Release completion

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-91

#RSAC
Policy Entries SCITT Ledger Evidence Entries
37

#RSAC
Example of SCITT in the Marketplace

Ledger Store web service

Policy 1  (e) Claim & Evidence 1  (e)



Supplier Attester
User

Artifact 1 (b) Claim & Evidence 1  (c)

Policy 1  (a) Artifact 1  (d)

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

38

SCITT Concepts
Transparent Governance

Signing Envelope Claims
Signature
Submied by Issuer

Ledger Service in TEE

Validates acceptance
criteria

Signing Envelope

Indexing service ... ...

#RSAC

Stored in Ledger

Claims
Signature Ledger
Countersignature

An Architecture for Trustworthy and Transparent Digital Supply Chains
https://datatracker.ietf.org/doc/html/draft-birkholz-scitt-architecture-00

STANDARD
BEST PRACTICE
REFERENCE IMPLEMENTATION
12
Countersigning COSE Envelopes in Transparency Services
https://datatracker.ietf.org/doc/html/draft-birkholz-scitt-receipts-00

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

39

#RSAC
Supply Chains ­ As multi-Stakeholder Network

BOM (SW & HW) Quality Info Pedigree Provenance

BOM (SW & HW) Quality Info Pedigree Provenance

BOM (SW & HW) Quality Info Pedigree Provenance

BOM (SW & HW) Quality Info Pedigree Provenance

BOM (SW & HW) Quality Info Pedigree Provenance

BOM (SW & HW) Quality Info Pedigree Provenance

Operations & Sustainment

https://www.iiconsortium.org/pdf/Trustworthiness_Framework_Foundations.pdf

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

40

Examples of System of Trust Engagements

#RSAC

Executive Acquisition Congressional Committees

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

41

#RSAC
System of Trust Plans with Sponsors and Industry

Assessment Capabilities for Sponsors, Industry and Academia

Training Sponsors & Industry on the SoT methodology, content, and platform

Standards and best practices oriented around SoT

Evolving SoT BoK with Domain SMEs to enhance Risk Factors

Mapping SoT to Industry and Government standards and assessment mechanisms

No-Cost* Licensing RMM tool & SoT content to Industry for integration in their own assessment practices and offerings

Active Feedback with communities on enhancements to SoT

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

42

#RSAC
Publications to date...

https://www.cutter.com/offer/ supply-chain-securitysystem-trust

https://www.mitre.org/ publications/technicalpapers/trusting-oursupply-chains-acomprehensive-datadriven-approach
https://www.mitre.org/sites/default/ files/publications/pr-21-0278deliver-uncompromised-securingcritical-software-supply-chains.pdf

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

https://www.mitre.org/ publications/technicalpapers/supply-chainsecurity-it'severyone's-business
43

SOT.MITRE.ORG

#RSAC

SoT@MITRE.ORG

© 2022 The MITRE Corporation. All rights reserved. Approved for Public Release; Distribution Unlimited. Case No: 21-01357-88

44

