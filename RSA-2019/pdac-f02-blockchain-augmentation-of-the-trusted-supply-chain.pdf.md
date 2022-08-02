SESSION ID: PDAC-F02
Blockchain Augmentation of the Trusted Supply Chain

Tom Dodson
Supply Chain Security Architect Intel Corporation @totommyd

Eduardo Cabre
Product Development Engineering Manager Intel Corporation @edcabre

#RSAC

#RSAC
Agenda
Introduction Trusted Supply Chain on Blockchain Proof of Concept DEMO Conclusions and Summary Apply What You Learned
2

Trusted Supply Chain
An Introduction

#RSAC
Trusted Supply Chain - Introduction
Problem ­ Assurance of a device's origin in today's diverse manufacturing, logistics,
and just in time inventory. ­ Remote deployment and provisioning requires assurance in the Supply
Chain.
Solution ­ Use a Root of Trust to provide assurance of a device's origin ­ This Root of Trust establishes the foundation for a Trusted Supply Chain
(TSC) ­ Blockchain adds an additional layer of trust in the overall system supply
chain
We will show how we augmented the existing hardware root of trust with the implementation of a blockchain to establish a TSC.
4

#RSAC
Trusting the Supply Chain ­ Problem

"cyber security officials are concerned that computers and handheld devices could introduce compromised hardware into the Defense Department supply chain, posing cyber espionage risks, said officials familiar with the report."

500 Re-marked Engineering Samples crash Dublin, California school district network

Defense Federal Acquisition Regulation Supplement (DFARS)
252.246 - Contractor Counterfeit Electronic Part Detection and
Avoidance System: Design, operation, and maintenance of systems to detect and avoid counterfeit electronic parts and suspect counterfeit electronic parts.

#RSAC
Trusted Supply Chain ­ Value Proposition

Platform Manufacturer

Distribution

End User

· Counterfeit and substitution detection · Inventory Tracking
· Reduced cost with · Increase trust ·Ownership transfer records
· Attestation increases trust and capabilities of analytics

Enterprise

· Reduced maintenance and replacement cost · Remote proof allow remote key provisioning
· Keys allows trusted remote configuration · Proof of ownership enables remote provisioning and
configuration

#RSAC
Trusted Supply Chain Components

· Trusted Supply Chain (TSC) provides traceability for customer platforms

· The following are the traceability components

TSC COMPONENT

DETAILS

System-Level Traceability

· Supported by signed platform certificates · Linked to discrete Trusted Platform Module (TPM) on motherboard

· Supported by "as-built" report from Original Design Manufacturer (ODM)
Component-Level Traceability · ODM partnerships are vital to two-level traceability
· Blockchain provides component supplier level traceability

Statement of Conformance

· Attests to authenticity of system
· Signed by Platform Manufacturer · Blockchain provided statement of conformance

Customer Web Portal

· Provides customer access to signed files · Files available for download

7

#RSAC
Trusted Supply Chain Process ­ In Production

Component and
1 Platform Data Captured at ODM

Data Transmitted
2 to Intel Key Generation Services

Signed Certificates
3 Created & Stored on Intel Database

Signed Certificates
4 Available for Download, View, and Data Analytics

"As-Built" Data File

Component Data
(vendor, part #, serial #, validation history, ... )

"As-Built" Data File

Direct Platform Data File

Platform Snapshot Data
(e.g., model #, PCR data, processor, memory, disk, ...)

TPM Platform Certificate Data
File

Certificate Data
(Endorsement Key, Endorsement Key serial #, ... )

Direct Platform Data File
TPM Platform Certificate Data
File

Signed "As-Built" Data
Signed Platform Certificate
Signed Statement of Conformance

5 Auto Verify Tool (Web Download)

8

The TSC Supply Chain ­ Problem Statement

Suppliers
Suppliers
· Component Inventory · Ship components

· The component information (e.g., manufacturer, part number, batch number, distributor) is provided by the ODM through the "Honor System"
· Moving the Trusted Supply Chain to a Blockchain will allow component suppliers to also participate in the supply chain at the component level.
· Component Supplier participation will allow for the verification of the components used by the ODM factory to manufacture the system.
· VARs, Distributors, Resellers can now use the Distributed Application (DAPP) on the blockchain to establish the root of trust for each system.

#RSAC
Customer/ Retailer
· Point of Sale, Sell-thru · Inventory · Returns, Post-Sales

Manufacturing
· Builds Base Assemblies · Work In Process (WIP) · Creates Shipment
Manufacturer In or Out-Source

3rd Party Logistics
· Freight Forwarding · Customs Clearance · Consolidation · FG Inventory

Customer Data Centers

Distributors
· Break Bulk · Cross Dock · FG Inventory · Kit

· Forecast, Sales Orders · Goods Receipts · Inventory of New &
Returned Goods
Distributor

9

Trusted Supply Chain on the Blockchain
A decentralized model

Suppliers
Suppliers

TSC on Blockchain
TSC Private Ethereum * Network
Register Component

Register Platform

TSC DAPP Web App / API

Ownership Transfer

#RSAC

Customer/ Retailer

Auto Verify Tool

Platform Attestation

Platform Changes
TSC DAPP Web App / API

Manufacturing
Manufacturer In or Out-Source

TSC DAPP Web App / API
Ownership Transfer

Ownership Transfer

3rd Party Logistics

Distributors

* "Ethereum is an open-source, public, blockchain-based distributed computing platform and operating system featuring smart contract functionality." ­ Ethereum Foundation

Customer Data Centers
Distributor
11

#RSAC
System-Level Traceability
Supply chain level traceability based upon the Blockchain
­ Platform provenance starting at the component level ­ Extending into system level root of trust based upon Trusted Platform
System level traceability based on a hardware root of trust:
­ For example Trusted Platform Module (TPM) 2.0 on motherboard, or silicon traceability using Physical unclonable function (PUF)
­ Associates platform serial number with TPM serial number and public Endorsement Key (EK)
Software tools deployed during the manufacturing flow at the ODM:
­ Capture system information ­ Capture TPM Certificate (Including public EK)
12

TSC on Blockchain Proof of Concept
Architectural details

#RSAC
Proof of Concept (POC) Goals and Objectives
Conducted a proof of concept to determine the feasibility of productizing TSC on Blockchain Objectives:
­ Evaluate cost, performance, and security tradeoffs ­ Compare public versus private blockchain options ­ Evaluate extending TSC to additional participants (component suppliers,
distributors, resellers) ­ Gather expertise to develop Distributed Applications (DAPPs) ­ Develop designs for scalability and maintainability ­ Grow understanding of blockchain development ecosystem
14

TSC on Blockchain DAPP Architecture

Four tier architecture
­ Presentation: Web application, Bulk Upload Tool, AutoVerify Tool
­ Middle Tier: C#.NET libraries implement integration with Ethereum Application
­ Ethereum Application: Solidity Smart Contracts implement blockchain business logic
­ Ethereum Network: Set of nodes running private Ethereum blockchain.
Cloud Secure Storage
­ Middle Tier: provide integration with cloud storage
­ Secure Storage: Key Management Service, cloud storage

Ethereum Application

Middle Tier

Presentation

ODM OEM Distributor Reseller

Platform Owner

DAPP Owner

BulkUploadApplication

DAPP Web Application AutoVerifyTool

Admin Console

BaseContractDLL

MainContractDLL

AdminDLL

BlockchainFunctionsDLL

Nethereum .NET

StorageDLL
.NET Storage SDK

MainContract
PlatformDB Controller
PlatformDB

CMC

PermissionManager
PermissionDB Controller
PermissionDB

KMS
Cloud Storage

Ethereum Network (Geth Nodes)
15

Cloud Secure Storage

Cloud Secure Storage Middle Tier

#RSAC

TSC on Blockchain Architecture ­ Ethereum Application

· Method allows platform registration · File upload · Ownership Transfer

· Methods expose functionality · Access to middle tier · Access control rules

#RSAC

Entry point / interface

Controllers

· Controller abstract storage · Implement storage access methods

Storage

* Five Type Model developed by Monax [1]

16

TSC on Blockchain ­ Supply Chain Flows

Trusted Supply Chain Flow

ODM

OEM

Dist/Reseller

#RSAC
Platform Owner

· Platform Manufactured · Register Platform · Upload Platform Files · Transfers Ownership to OEM

· Retrieve platform data file · Verify Platforms · Transfer ownership to distributor

· Retrieve Platform Files · Modify platform · Generate platform files · Transfer ownership to end customer

· Retrieve platform data files · Platform attestation w/ AutoVerify Tool · Configure platform · Generate new platform Data Files w/ AutoVerify

DAPP Web Application
Ethereum Blockchain Cloud Secure Storage
17

AutoVerify

#RSAC
Auto Verify Tool
Blockchain Platform Validation:
­ Verifies that the platform TPM matches the platform certificate data file from the DAPP
­ Platform Attestation is confirmed by comparing the TPM module's Endorsement Key against the Endorsement Key stored in the platform certificate data file
­ Platform data file integrity provided by the blockchain
Direct Platform Components Validation:
­ The Auto Verify tool compares the "snapshot" of the platform component data taken during manufacturing and stored in the DAPP with a "snapshot" of the platform components taken at first boot
­ Any changes in system will be flagged and reported out to the customer in the tool ­ Additional platform "snapshots" can be generated and stored in the DAPP
throughout the Platform life cycle
18

Auto Verify Tool
Changes in the Platform Data between snapshots are Identified

#RSAC

Identified changes are displayed
19

DEMO
Video

#RSAC
21

TSC on Blockchain Proof of Concept
Performance and Security

#RSAC
Performance and Throughput Comparison

14.5 sec per block

Block mining time

14.5 sec per block

Confirmation time

10 confirmation blocks (145 sec confirmation)

10 confirmation blocks (145 sec confirmation)

8,000,000 gas per block

Block Gas Limit

320,000,000 gas per block

500,701 platforms / year

Theoretical Capacity
188,208,579 platforms / year

23

#RSAC
Security Comparison

Criteria Confidentiality
Privacy / Anonymity Trust Reliability

Public Ethereum

Private Ethereum

· End to end file encryption in transit and storage. · End to end file encryption in transit and

Uses cloud storage, based on KMS key.

storage. Uses cloud storage, based on KMS

· Depending on storage key management, access

key.

can be controlled so that only the authorized · Depending on key management, access can

users have access.

be controlled so that only the authorized

users have access.

· Additionally, private blockchain limits on-

blockchain data access to authorized parties

· Worst of all, pseudonymous at best. Anonymity · Pseudonymous. Anonymity exposure limited

easy to compromise in public internet.

only to network participants.

· Large decentralization. Massively distributed, · Limited decentralization. Small distribution,

allows independent confirmation, distributed

allows independent confirmation by

trust among entire public networks (thousands

individual participants.

of nodes)

· Highly reliable and available

· Reliability based on underlying

infrastructure.

24

TSC on Blockchain Proof of Concept
Findings and Observations

Development Ecosystem

Access to development tools, documentation, and sample code is challenging.

It is recommended to use patterns to enable scalability and maintenance.

Difficult to integrate tools and programming languages to develop the Ethereum application.

Recommended Tools:

Truffle Geth Ganache MIST Browser Nethereum 3.0

·Development framework ·https://github.com/trufflesuite/truffle
·Ethereum node in Go ·https://github.com/ethereum/go-ethereum/wiki/geth
·Run simulated dev network ·https://truffleframework.com/ganache
·Ethereum web browser ·https://github.com/ethereum/mist
·.NET DAPP integration library ·https://nethereum.com/
26

#RSAC

#RSAC
Challenges and Learnings
Little documentation available to address issues encountered during development. Nethereum is an excellent library for integrating C# code Research on blockchain security is limited. Few mathematical models exists to evaluate security of blockchain transactions. Transactional capacity on the Ethereum blockchain is limited. Private Ethereum configuration changes can be made to improve performance.
27

Conclusions and Summary

#RSAC
Conclusions and Recommendations
Conclusions
­ Increased platform security can be achieved by using blockchain for platform attestation
­ Data storage is now decentralized, no central party has access or control ­ Privacy in the blockchain is always a concern, private blockchain reduces exposure. ­ Developing blockchain security models is imperative as future work
Recommendations
­ Transfer supply chain management to the blockchain whenever possible ­ Private blockchain networks are better suited for supply chain solutions where
privacy and performance are required ­ Use off-chain sensitive data storage such as Cloud storage ­ Use blockchain to maintain integrity of data records
29

#RSAC
Summary
A Trusted Supply Chain is based on a hardware Root of Trust and the Blockchain
­ TPM provides hardware Root of Trust ­ Ethereum blockchain provides supply chain trust
End-user verifiable component authenticity backs up the hardware Root of Trust
­ Auto-Verify tool validates the system component ­ Blockchain provides data integrity and verification
Blockchain implementation of a Trusted Supply Chain is feasible
30

#RSAC
Apply What You Have Learned Today
Next week you should:
­ Consider your companies IT Components supply chains
In the first three months following this presentation you should:
­ Identify IT Components that have supply chain risk ­ Determine if there is an opportunity to incorporate TSC supply chain
Within six months you should:
­ Implement a blockchain based secure supply chain solution ­ Consider platforms that incorporate TSC ­ Review the Trusted Supply Chain on Blockchain POC whitepaper (located
here)
31

#RSAC
Helpful Resources
The Ethereum project (https://www.ethereum.org/) The Five Types Model Sample Project (https://github.com/harshpokharna/The-5Types-Model-Simple-Bank-System-Solidity) The Ethereum Blog (https://blog.ethereum.org/) Solidity Documentation (https://solidity.readthedocs.io/en/latest/index.html) Nethereum Documentation (https://nethereum.readthedocs.io/en/latest/) Smart Contract Programming Tutorial (https://medium.com/@ConsenSys/a-101noob-intro-to-programming-smart-contracts-on-ethereum-695d15c1dab4) Ethereum and Solidity (https://www.udemy.com/ethereum-and-solidity-thecomplete-developers-guide/)
32

#RSAC
References
Contacts:
­ Tom Dodson: tom.dodson@intel.com ­ Eduardo Cabre: eduardo.cabre@intel.com
Transparent Supply Chain
­ https://www.intel.com/content/www/us/en/servers/transparent-supplychain.html
Software Stacks
­ https://github.com/tpm2-software ­ https://sourceforge.net/projects/ibmtpm20tss/
A Practical Guide to TPM 2.0
­ https://www.apress.com/us/book/9781430265832

Support Slides

TSC on Blockchain ­ Supply Chain Flows
Trusted Supply Chain Flow

ODM

OEM

Dist/Reseller

#RSAC
Platform Owner

· Platform Manufactured · Register Platform in DAPP · Generates Platform File · Upload plat files to DAPP

· Ships platform to distributor
· Transfers Ownership to OEM

· Retrieve

· Verify Platform

platform data · Transfer

file

ownership to

dist

· Retrieve platform data files · Modify/upgrade platform · Generate new platform files · Upload plat files to DAPP

· Ship platform to end · Retrieve platform data

customer

files

· Transfer ownership · Platform attestation w/

to end customer

AutoVerify Tool

· Configure platform · Generate new
platform Data Files w/ AutoVerify

· Platform Registration · Platform Data Files · Ownership Information

·

Ownershi·p Platform Files·

Transfer

·

Verify platform

·

Platform Files
·

Transfer ownership

New Platform Files

· Platform Files

· New Platform Files

DAPP Web Application

AutoVerify

· Platform Information · Platform Data Files pointers

· Record New Owner

· Platform Verified · Record new owner

· Platform Data Files pointers

· Platform Data Files pointers

Ethereum Blockchain

· Platform Data Files

· Platform Files

· Platform Files · Platform Data Files

· Platform Files · Platform Data Files

Cloud Secure Storage

35

#RSAC
Intel provides these materials as-is, with no express or implied warranties. All products, dates, and figures specified are preliminary, based on current expectations, and are subject to change without notice. Intel, processors, chipsets, and desktop boards may contain design defects or errors known as errata, which may cause the product to deviate from published specifications. Current characterized errata are available on request. Intel technologies' features and benefits depend on system configuration and may require enabled hardware, software or service activation. Performance varies depending on system configuration. No product or component can be absolutely secure. Check with your system manufacturer or retailer or learn more at http://intel.com. Some results have been estimated or simulated using internal Intel analysis or architecture simulation or modeling, and provided to you for informational purposes. Any differences in your system hardware, software or configuration may affect your actual performance. Intel and the Intel logo are trademarks of Intel Corporation in the United States and other countries. *Other names and brands may be claimed as the property of others. © Intel Corporation
36

