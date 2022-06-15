SESSION ID: ACB-RO2
Blockchain and distributed ledger technologies Security risks, threats and vulnerabilities

Kurt Callewaert
Researchmanager Applied Computer Sciences HOWEST UNIVERSITY @KurtCallewaert Kurt.Callewaert@howest.be

#RSAC

Blockchain and distributed ledger technologies Are there still security risks, threats and vulnerabilities ?
2

#RSAC
Building blocks in Blockchain & DLT technology
3

#RSAC
Blockchain & Tracebility in the foodsector

Presenter's Company

Logo ­ replace or

4

delete on master slide

#RSAC
Blockchain functional view architecture

Presenter's Company

Logo ­ replace or

5

delete on master slide

Blockchain Model
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
6

Example block
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
7

Hashing
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
8

Blockchain implementations
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
9

Consensus model
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
10

Smartcontract or chaincode
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
11

Forking
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
12

#RSAC
CIA ... what are the results of the research project ?
13

Confidentiality
Network access : firewall , VPN , VLAN , IDS , ... Access control on application level Information Security Management System

According to the National Institute of Standards and Technology (NIST), confidentiality refers to "the property that sensitive information is not disclosed to unauthorized individuals, entities, or processes"

Cryptography : key generation PKI : Public Key Infrastructure Full encryption of the data blocks Authentication & authorization
controls
Key management key storage , key loss , key theft Wallet management  Key theft , unauthorised access to data Quantum resistant cryptography  SHA-256 replaced by SHA-384

Integrity

Integrity is defined as the "guarding against improper information modification or destruction, and includes ensuring information non-repudiation and authenticity"according to NIST

Data encryption - hash comparison ­ digital signing

Immutability -> sequential hashing and cryptography + distributed Consensus models Tracebility ­ non repudiation -> time stamped and digital signed

Smart contracts  S-SDLC Data quality  Trusted oracles : data feed third party service in smart contracts GDPR  Right to be forgotten Consensus Hijack  Fraudulent transactions - Sybil attaque

Availability

NIST defines availability as "ensuring timely and reliable access to and use of information"

No single point of failure  IP based DDos no effect Operational Resilience  Distributed nodes , peer to peer, 24/7
Global internet outage Scalability  unexpected growth of the DLT database Denial of Service  large volumes of small transactions

#RSAC
ISO/TC 307 Blockchain and distributed ledger technologies
17

#RSAC
Existing Threats
The first happens at the level of the transaction itself. In this category, the source of the threat is the behavior of a user, because of the user's incompetence or dishonesty. One example of this category is a double-spending attack.
The second happens at the level of transaction validation. In this category, the threat comes from the collective behavior of dishonest miners. One example in this category is the 51% attack problem.

Presenter's Company

Logo ­ replace or

18

delete on master slide

#RSAC
Existing vulnerabilities
User layer vulnerabilities
· User apps vulnerabilities · Admin apps vulnerabilities

Presenter's Company

Logo ­ replace or

19

delete on master slide

#RSAC
Existing vulnerabilities
API layer vulnerabilities
· External interfaces vulnerabilities · User API vulnerabilities · Admin API vulnerabilities

Presenter's Company

Logo ­ replace or

20

delete on master slide

Existing vulnerabilities

Platform layer vulnerabilities

· Consensus mechanism vulnerabilities

During Finney attack

Brute force attack

The race attack

Vector 76 or one-confirmation attack

Punitive and Feather Forking

Goldfinger attack

Selfish mining attack

Coin-hopping attack

Presenter's Company Logo ­ replace or
delete on master slide

Nothing at stake attack

#RSAC
21

Vector 76 or one-confirmation attack is a combination #RSAC of the race attack and the Finney attack
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Existing vulnerabilities
Platform layer vulnerabilities

· Membership services vulnerabilities

Sybil attack (multiple virtual identities)

· Event distribution vulnerabilities

· Crypto services vulnerabilities

· State management vulnerabilities

· Smart contract vulnerabilities

Presenter's Company

Logo ­ replace or

23

delete on master slide

Sybil attack (multiple virtual identities)

#RSAC

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Existing vulnerabilities

Infrastructure layer vulnerabilities · Storage vulnerabilities · P2P network vulnerabilities
Eclipse or net-split attack Tampering an adversary
Runtime environment vulnerabilities Vulnerability used by implementation flaw

Presenter's Company

Logo ­ replace or

25

delete on master slide

Eclipse or net-split attack
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

#RSAC
Existing risks

· Disclosure of private information and cryptographic keys
· Denial of service
· Forking in blockchain and DLT
· Compromise of Cryptography
· Data poisoning

Presenter's Company

Logo ­ replace or

27

delete on master slide

#RSAC
Conclusion

Apply What You Have Learned Today
New technologies bring new risks with them To do : Blockchain Preparation Audit Program 1. Pre-implementation 2. Governance 3. Development 4. Security 5. Transactions 6. Consensus
29

Blockchain Preparation Audit Program : Security

Wallet Management
Private keys are secured appropriately.
The enterprise has implemented a process for managing loss or theft of private keys.

Secure Coding
Source code repositories are secure.
Source code is reviewed for vulnerabilities.
Vulnerabilities identified during source-code reviews are properly managed in terms of mitigation, action plans and communication to relevant stakeholders.

30

Blockchain Preparation Audit Program : Security

Network-Vulnerability Management
A process is in place to manage blockchain network vulnerabilities.
The process for managing blockchain network vulnerabilities is operationally effective and demonstrable.

Endpoint Security
A process exists to manage endpoint security for devices using the blockchain solution.
The process for managing endpoint security is operationally effective and demonstrable.

31

Private keys are secured appropriately.
· Ensure that private keys are appropriately secured. Consider the following: a. Use of software (client side or online) vs. hardware wallets b. Use of hot (live) vs. cold storage (offline or airgap) c. Use of multifactor authentication d. Use of password to encrypt local storage e. Backup of private keys or 12-word phrase (i.e., master seed) f. Segregation of backup from primary use point · Ensure that the enterprise has a policy for securing private keys that has been approved by the relevant stakeholders. · Review logical access to determine whether appropriate personnel manage private keys; ensure that there is an adequate segregation of duties."
32

The enterprise has implemented a process for managing loss or theft of private keys.
Verify that the enterprise has an adequate insurance policy. Determine whether: a. Appropriate financial and reputational protection exists for the enterprise and its clients. b. Adequate subject matter experts have been consulted for input (e.g., experts in risk, legal and information security).
Verify that the enterprise communicates loss of private keys appropriately. a. Determine whether the enterprise has a process to notify appropriate parties--
both internal (e.g., senior management) and external (e.g., clients and regulators)--in the event that private keys are lost or stolen.
b. Verify that the process is consistent with the enterprise's incident-communication strategy and consistent with a response in the event of theft of sensitive customer data.
33

Source code repositories are secure.
For permissionless repositories (e.g., GitHub), ensure that security is reasonable. Consider the following: a. Reputation of repository (including known security incidents) b. Process for approving source-code changes (including input from core developer group,
community feedback, approval of changes) c. Activities of the repository and degree of community engagement (e.g., number of active
contributors, number of commits, pull requests, active issues, etc.) · For permissioned repositories (e.g., private or consortium), ensure that adequate security controls exist. Verify that: a. Appropriate security controls are in place for code repositories (e.g., segregation of duties,
approval process for changes, access controls). b. Policies and procedures are documented and understood by all parties, where code
repositories are shared by the enterprise via consortium.
34

Source code is reviewed for vulnerabilities.
Ensure that adequate code reviews take place. Verify the following: a. For permissionless blockchains, source code is vetted at least quarterly though
manual code review, penetration tests and/or automated scans. b. For permissioned blockchains, source code is reviewed in accordance with relevant
policies and procedures. c. Source code is independently reviewed by qualified security professionals with
experience in the enterprise's specific blockchain platform(s). · Determine whether appropriate stakeholders participate in the code review process (e.g., information security, information technology stakeholders).
35

Vulnerabilities identified during source-code reviews are properly managed in terms of mitigation, action plans and communication to relevant stakeholders.
Verify that an adequate remediation process is in place for identified source-code vulnerabilities. Determine whether:
a. For permissionless blockchains, the enterprise has considered appropriate actions (e.g., forking to a different blockchain, limiting certain transactions).
b. For permissioned blockchains, the enterprise has considered actions consistent with relevant policies and procedures. · Verify that the process for remediating blockchain source-code vulnerabilities has been approved by relevant stakeholders. · Select a sample of identified blockchain source-code vulnerabilities and verify adherence to the blockchain source-code remediation process.
36

A process is in place to manage blockchain network vulnerabilities
Review the blockchain network-vulnerability management process for adequacy. Determine whether the following provisions exist:
a. Monitoring for blockchain vulnerabilities (e.g., 51% attack, double-spend attack, malicious smart contracts, denial-of-service (DoS) attack, Sybil attack, packet sniffing) b. Periodic execution of automated vulnerability-assessment solution c. Remediation protocol for identified blockchain vulnerabilities (e.g., forking, halting transactions) d. Escalation protocol for identified vulnerabilities and a plan for communication to relevant stakeholders · Verify that the blockchain network-vulnerability management process has been approved by relevant stakeholders.
37

Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
38

