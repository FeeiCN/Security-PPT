SESSION ID: SEC-F01
The New Key Management:
Unlocking the Safeguards of Keeping Keys Private

Jono Bergquist

Solutions Engineering Lead -

APJ

CloudFlare

#RSAC

#RSAC
Outline
 Why application-level TLS is important  Key management is the hardest part of TLS  How to use trusted computing for cryptography  Solving TLS key management with TPMs
2

#RSAC
The perimeter is porous
3

#RSAC
Traditional Network Security Topology
4

#RSAC
Traditional Network Security Topology
 Multiple internal services  Databases with customer data  Employee portals
 Cross-datacenter communication across Internet via VPN  All or nothing access
5

#RSAC
The perimeter is porous - VULCANDEATHGRIP
6

#RSAC
Traditional network topology
 VPN compromise makes application-to-application data readable
7

#RSAC
Web Application Security Topology
8

#RSAC
Edge Network
9

#RSAC
Mobile network
10

#RSAC
The modern corporate network
 Components  Website hosted on a SaaS/IaaS platform  Core business services  Loosely affiliated group of services hosted by third parties
11

#RSAC
The modern corporate network
 Access control  Third-party services  Federated identity (SAML, OAuth, etc.)  Single sign-on  Service-to-service authentication  Implicit via VPN  Token-based
12

#RSAC
Examples of application-to-application data
 Data breaches  User passwords  Customer data  HR Data  Customer lists  Proprietary intellectual property
 All from applications inside the network
13

#RSAC
The modern corporate network
 The perimeter is fuzzily defined  Move security to a higher level in the stack?
14

#RSAC
Application-layer Encryption
15

#RSAC
Encryption
 Corporate data should be encrypted
16

#RSAC
Encryption
 ...at rest  ...in transit  ...with authentication
17

#RSAC
Layer 3 Encryption
 IPsec tunnel/VPN  Expensive hardware  Does not scale to edge networks  Trust everyone
18

#RSAC
Layer 5/6 Encryption
 Kerberos  Web applications do not use it
 Transport Layer Security  Widely supported among a range of applications
19

#RSAC
Transport Layer Security (TLS)
 The protocol formerly known as SSL  Provides server-to-server encryption  Authentication via certificate validation
 Advantages  Cheap in software on modern processors (AES-NI)  Widely supported in service oriented software
20

#RSAC
Transport Layer Security (TLS)
 Challenges for application-to-application TLS  Building a system of trust  Key management
21

#RSAC
Building trust in applications
22

#RSAC
TLS without certificate validation
 Traditional man-in-the-middle attack
23

#RSAC
Trust Models for TLS
 Public Key Infrastructure model  Each application has:
 Public X.509 certificate  Corresponding private key
24

#RSAC
X.509 Public Key Infrastructure
25

#RSAC
Trust Models for TLS
 Session key used to encrypt connection  Private key used to
 Prove ownership of certificate  Authenticate session establishment  Validate certificates with a chain of trust
26

#RSAC 27

#RSAC
PKI-enabled applications
 Database access  Business services  Mobile applications
28

#RSAC
Private PKI
 Run your own internal Certificate Authority  Generate keys locally on endpoints  Use internal CA to create certificates
29

#RSAC
Different CAs for different domains
30

#RSAC 31

#RSAC
Tools
 OpenSSL  CFSSL
 CloudFlare's open source CA software  pki.io  EJBCA  Commercial options
32

#RSAC
Advantages
 Application data is encrypted in transit  Requests are authenticated  VPN failure is no longer catastrophic
33

#RSAC
The bootstrap problem
 Enrolling new servers  Authenticating requests for certificates
34

#RSAC
Dangers
 Keys live in memory and on disk  Can be stolen and applications impersonated
35

#RSAC
Trusting trusted computing
36

#RSAC
Protecting keys on servers
 Keep keys in hardware instead of software  Each machine needs its own hardware
 HSMs are prohibitively expensive  TPMs fit the bill ($15-$30 each)
37

#RSAC
Trusted Platform Module
38

#RSAC
Trusted Platform Module
 Most commonly used for Windows trusted boot
 List of features of TPM 1.2  Measured Boot  Random number generation  RSA 2048 private keys
39

#RSAC
Machine provisioning
40

#RSAC
Certificate issuance
41

#RSAC
Benefits
 Keys do not live in software  Safe from memory access (Heartbleed, DMA)  Safe from theft (TPM locked)  Safe from impersonation
42

#RSAC
Drawbacks
 Not all software supports TPM crypto  It is slooooow
43

#RSAC
Simple guide
44

#RSAC
How to set up secure application transport
 Create your own CA on a trusted machine or HSM  Create a key on your device TPM  Use TPM to create a certificate signing request (CSR)  Create certificate from CSR with CA
 Configure web server to use certificate and TPM for private key operation
 Go for it!
45

#RSAC
Action
46

#RSAC
What you can do right now
 Do your applications speak TLS?  If so, are they doing certificate validation?  Where are the private keys stored and managed?
47

#RSAC
What you can do in the next months
 Consider your attacker is an insider  Which backend applications accept connections?
 Suppose there is a firewall or VPN misconfiguration  Is any data is exposed?  What authentication is your database using?
48

#RSAC
What you can do in the next months
 Once TLS is activated, make sure it is configured properly  Certificate validation  TLS 1.2
 Start using C or Go services built on open source tools
49

