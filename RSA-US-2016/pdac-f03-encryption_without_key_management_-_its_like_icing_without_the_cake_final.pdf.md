SESSION ID: PDAC-F03
Encryption without key management ­ It's like Icing without the cake
#RSAC

Saikat Saha
Sr. Principal Product Manager Database Security Oracle Corporation
Tony Cox
Director, Strategy & Alliances Cryptsoft

#RSAC
Icing Without The Cake
Encryption and related security technologies Highly important, mandated and exciting!
Key Management Absolutely critical, but boring.
2

#RSAC
Agenda
Encryption - Core to Data Security Key Management Challenges and Regulations What is Key Management? KMIP Fundamental and Evolution (1.0, 1.1 & 1.2) KMIP Implementation and Interoperability KMIP Future (1.3, 1.4 & beyond) How to "Apply"?
3

#RSAC
Encryption - Core to Data Security

#RSAC
Encryption ­ the icing

#RSAC
Encryption is Everywhere
Encryption is critical to data security
- Data-at-rest - Data-in-transit
Data-at-rest Encryption
- Application encryption - Database encryption - File encryption - Disk/Storage encryption
Encryption is mainstream now!
6

#RSAC
Management Challenges: Proliferation

Primary Data Center

Failover Data Center
7

#RSAC
Key Management Challenges and Regulations

#RSAC
The Challenges of Key Management

Management
· Proliferation of encryption wallets and keys · Authorized sharing of keys · Key availability, retention, and recovery · Custody of keys and key storage files

Regulations · Physical separation of keys from encrypted data · Periodic key rotations · Monitoring and auditing of keys · Long-term retention of keys and encrypted data
9

Regulatory Drivers
PCI DSS v3.1
April 2015 3.5 Store cryptographic keys in a secure form (3.5.2), in the fewest
possible locations (3.5.3) and with access restricted to the fewest possible custodians (3.5.1) 3.6 Verify that key-management procedures are implemented for periodic key changes (3.6.4) And more!
10

#RSAC
10

#RSAC
Regulatory Drivers contd...

HIPAA ­ The US Health Insurance Portability and Accountability act (HIPAA) of 1996 HITECH ­ Health Information Technology for Economic and Clinical Health (HITECH) act
164.312 (a)(2)(iv) 164.312 (e)(2)(ii) 164.312(e)(2)(i) 164.312(c)(2) Encryption and Decryption, Integrity, Mechanism to Authenticate electronic health information
164.312 (a)(2)(iv) 164.312 (e)(2)(i) Encryption and Decryption, Integrity Controls Effective Key management and protection must be demonstrated to support the encrypted state of data

11

11

Regulatory Drivers contd...
GDPR : Global Data Protection Regulation
EEA : European Economic Area Controller
ARTICLE 30: ENCRYPTION AND PSEUDONYMISATION The controller and the processor ... as appropriate: the pseudonymisation and encryption of personal data
ARTICLE 28: Each controller and, if any, the controller's representative, shall maintain a record of processing activities under its responsibility
EEA 54a: Methods to restrict processing of personal data could include ... making the selected data unavailable to users or temporarily removing published data from a website
12

#RSAC
12

Encryption is the easy part

Security Surveillance Encryption

Key Points
 Encryption is easy, fast, ubiquitous  Encryption is inexpensive
Deploying encryption solutions is easy

Regulatory

Legislative

Encryption is now ubiquitous
Encryption is in software Encryption is in hardware Encryption libraries are easily supported Encryption is cheap and easy to use Encryption is fast (AES-NI, line rate, encrypting HBAs, et.al)

13

#RSAC

Key management is hard
Key Points
 Key loss results in data loss  Key compromise results in data compromise
Key management is critically important

Key Management
Problem

Management costs are increasing Balancing security with accessibility is hard Encryption key usage and proliferation is growing Different keys have different usage requirements Management of encryption keys and seed records is technically difficult

14

#RSAC

KMIP is the solution
What is the solution?

#RSAC
Key Point
 KMIP is the solution to your key management problem

- Leave it to specialist security vendors

Designed by the industry's most experienced vendors

- Use independent conformance testing programs - Avoid platform and technology lock-in

Active on-going standards development / evolution

- Externalise the problem from your domain

Deployed in wide range of products from multiple vendors

- Use open vendor neutral standards

Successful transition from standard into products

- Avoids vendor lock-in

Open standard under open management (OASIS)

Multiple independent interoperable implementations

15

#RSAC
What is Key Management?

Key Management - the cake
Lifecycle management
Standards compliance Authentication
Audit & reporting
17

#RSAC
Key storage Cryptographic services Attributes / Metadata
Policy

#RSAC
What is Key Management?
Lifecycle management
Minimum operation set ­ Create, Register, Destroy, Rekey KMIP has a very rich set of operations (40+ operations) KMIP Specifies NIST 800-57 states and transitions
18

#RSAC
What is Key Management?
Key storage
Simple flat file Detailed register Secured (kek or keystore encryption) Offload (HSM/EKM)
19

#RSAC
What is Key Management?
Attributes / Metadata
KMIP allows for an almost unlimited number of attributes per key (object) Multiple attribute types Custom attribute types (usually best avoided)
20

#RSAC
What is Key Management?

Authentication
User access Device access Admin access

KMIP Clients

21

#RSAC
What is Key Management?
Cryptographic Services
Provide a richer set of functionality KMIP operations include:
Encrypt & Decrypt Sign & Verify Hash, MAC & MAC verify Supplement or replace HSMs
22

#RSAC
What is Key Management?
Audit & Reporting
Used to answer a range of questions: How many keys? Of what type? Used for what? Used how often? Used by who/what?
Forms the basis of compliance reporting
23

#RSAC
What is Key Management?
Policy
Authorisation Scheduling Compliance enforcement
24

#RSAC
What is Key Management?
Standards compliance
Minimum standards (NIST etc) Ideal = KMIP
Open standard under open management (OASIS) Active standards development / evolution Designed by the industry's most experienced vendors Deployed in wide range of products from multiple vendors
25

#RSAC
KMIP Background and Evolution

#RSAC
KMIP Request / Response Model

Enterprise Key Manager

Request Header

Get

Unique Identifier

Response Header

Symmetric Key

Unique Identifier

Key Value

Host

Name: XYZ SSN: 1234567890 Acct No: 45YT-658 Status: Gold
Unencrypted data

Encrypting Storage

@!$%!%!%!%%^& *&^%$#&%$#$%*!^ @*%$*^^^^%$@*) %#*@(*$%%%%#@
Encrypted data

27

#RSAC
Authentication

Authentication is external to the protocol

All servers should support at least

TLS V1.0

Authentication message field contains the Credential Base Object

Client or server certificate in the case of TLS
Host

SSL/TLS

Enterprise Key Manager

@!$%!%!%!%%^& *&^%$#&%$#$%*!^ @*%$*^^^^%$@*)
Identity %#*@(*$%%%%#@
certificate

@!$%!%!%!%%^& *&^%$#&%$#$%*!^ @*%$*^^^^%$@*) %#*@(*$%%%%#@
Identity
certificate

28

#RSAC
KMIP Fundamentals
29

#RSAC
KMIP Fundamentals
Message Encoding
Binary Tag-Type-Length-Value format Optional JSON and XML encoding in KMIP1.2
30

#RSAC
KMIP Specification Development

OASIS KMIP 1.0 ­ Oct 2010

OASIS KMIP 1.2 ­ May 2015

Full NIST life-cycle support

PGP Key Object Type

Symmetric, PublicKey, PrivateKey, Certificate, SecretData, SplitKey, Opaque
Small set of profiles

Alternative Name Cryptographic Services Attestation

OASIS KMIP 1.1 ­ Jan 2013

Create/Join SplitKeys

DiscoverVersions, ReKeyKeyPair

External Key Handling (MDO)

Fresh and Object Group Member

HTTPS transport

QueryExtensionList, QueryExtensionMap JSON and XML encoding

Profiles with test cases

31

KMIP Progression

Specifications and Interoperability

Key Points

KMIP Interoperability Demonstration ­ RSA 2015 Cryptsoft, Dell, HP, IBM, P6R, Fornetix, Thales, Vormetric

 Mature open standard  Continuous development

KMIP Interoperability Demonstration ­ RSA 2014 Cryptsoft, Dell, HP, IBM, P6R, Safenet, Thales, Vormetric
KMIP Interoperability Demonstration ­ RSA 2013 Cryptsoft, HP, IBM, Quintessence Labs, Townsend Security,
Thales, Vormetric

2015
 KMIP Technical Committee Face-to-Face  KMIP v1.2 OASIS Specification
2014
 KMIP Technical Committee Face-to-Face
2013  KMIP v1.3 Committee Draft

KMIP Interoperability Demonstration ­ RSA 2012 Cryptsoft, IBM, NetApp, Quintessence Labs, Safenet, Thales

 KMIP v1.1 OASIS Specification  KMIP v1.2 Committee Draft

KMIP Interoperability Demonstration ­ RSA 2011 Cryptsoft, Emulex, HDD, HP, IBM, RSA/EMC, Safenet

2012
 KMIP v1.2 Scope Agreed
2011
 KMIP v1.1 OASIS Specification Final Committee Draft

2010
 KMIP v1.0 OASIS Specification
2009
 SKMP renamed Key Management Interoperability Protocol (KMIP)
2007  Moves to OASIS as the KMIP Technical Committee
 Standard Key Management Protocol (SKMP) specification formed

Time

32

#RSAC

#RSAC
KMIP Implementation and Interoperability

#RSAC
KMIP Market Adoption

Discreet KMIP Implementations

KMIP Adoption by Market
35 30 25 20 15 10
5 0
2H-10 1H-11 2H-11 1H-12 2H-12 1H-13 2H-13 1H-14 2H-14 1H-15 2H-15 1H-16
34

Storage Security & Infrastructure Cloud

KMIP Deployments

Storage
 Disk Arrays, Flash Storage Arrays, NAS Appliances
 Tape Libraries, Virtual Tape Libraries
 Encrypting Switches  Storage Key Managers  Storage Controllers  Storage Operating Systems

Infrastructure and Security
 Key Managers
 Hardware security modules
 Encryption Gateways
 Virtualization Managers
 Virtual Storage Controllers
 Network Computing Appliances

Cloud
 Key Managers  Compliance Platforms  Information Managers  Enterprise Gateways and
Security  Enterprise Authentication  Endpoint Security

#RSAC

35

#RSAC
KMIP Interop Testing

KMIP Servers KMIP Clients

Interop Network 36

Test Cases passed

KMIP Interop Testing 2016
2016 KMIP Interoperability Test Results
900 800 700 600 500 400 300 200 100
0
TTLV HTTPS JSON XML
37

#RSAC

KMIP Interop Testing
Pre-RSA Conference KMIP Interop Test Runs
25000

20000

Completed Test Runs

15000 10000

Test Runs

5000

0 RSA 2012 Tests

RSA 2013 Tests

RSA 2014 Tests
38

RSA2015 Tests

RSA2016 Tests

#RSAC

#RSAC
KMIP Conformance
KMIP Conformance Testing program
Run by Storage Networking Industry Association (SNIA) within the Storage Security Industry Forum (SSIF) http://www.snia.org/forums/ssif/kmip Program is gaining momentum with tests completed by:
Cryptsoft (1 Server SDK, 1 Client SDK) HPE (1 Server, 1 tape library) IBM (1 server) More in the queue....
39

#RSAC
KMIP Future

#RSAC
KMIP 1.3

Adjustments to improve interoperability
Deprecated Template Managed Object
Deprecated Default Operation Policy
Generic Transparent EC Key Types
Query RNG/DRBG information
RNG Attribute

Query options for validation information (FIPS140,CC)
Query options for profiles supported
Cryptographic Services streaming support
One-time Pad
Locate Offset+Limit
Automated client registration

41

#RSAC
KMIP 1.4

Accepted

Under discussion

PKCS#12 key format export option
Query option for Server Batch Handling
Batch Undo Batch Continue

PKCS#12 import General import/export Error handling Certificate Attributes Multiple CAs Request/Response Correlation Sensitive Attribute Handling

42

#RSAC
How to "Apply"?

#RSAC
Encryption and Key Management - Summary

Key Management Essential Boring Standardized Range of deployment options Well defined usage Widely supported industry standard
44

Encryption and related security technologies
Mandatory Requirement Exciting adjectives Many exciting form factors Well defined usage Solutions are widely available and varied Many solutions use proprietary key storage/management

