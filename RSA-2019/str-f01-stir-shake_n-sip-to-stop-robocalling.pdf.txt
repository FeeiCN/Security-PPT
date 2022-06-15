SESSION ID: STR-F01
STIR SHAKE'N SIP to Stop Robocalling
Daksha Bhasker Senior Security Architect Comcast NBC Universal
#RSAC

#RSAC
We've all been to the Islands
...For Free

Where Are We At in the US?

#RSAC

Source: Robocall Index by Youmail

Americans lost an estimated $9.5B in Phone scams in 2017 - Harris Poll/ Truecaller survey -

Source: https://blog.truecaller.com/2017/04/19/truecaller-us-spam-report-2017/

Youmail: https://robocallindex.com/

4

#RSAC

Caller ID Spoofing

Robocalling

E.T. Phone Home
Not All Calls Are Equal
5

#RSAC
What Makes Spam Easier to Stop?

E-mail Spam

Illegal Robocalls

6

#RSAC
What's in it for (Illegal) Robocallers?

Payments from hire-aRobocall Service

$$$ scammed from victims

Micropayments per Robocall

7

#RSAC
Robocallers make money even when calls are not answered.

Source: WSJ: Why Robocallers Win Even if You Don't Answer

8

#RSAC
Impacts Are Felt

Citizens/Consumers

Businesses
9

SP Networks

#RSAC
Business Case for Addressing the Issues
Global VoIP market to grow to $190B by 2024 TDM inching towards EOL
Robocall and scams are one-third of all calls
10

2. One Cold STIR SHAKEN Framework Please

STIR
Secure Telephone Identity Revisited

#RSAC
SHAKEN
Signature-based Handling of Asserted information using toKENs

STIR SHAKEN Authenticates Calls that Traverse SIP Networks

IETF 3GPP TSPs

Industry ATIS SIP Forum Regulators Int'l Partners Others

12

Phone Technologies

POTS Single Line

Mobiles

IP-PBX

Calling Card

VoIP

GW

TDM/SS7 Gateways IP/SIP

VoIP

POTS

GW

Int'l PBX

Calling Card

VoIP

Scope of STIR SHAKEN: IP/SIP calls 50% of suspect illegal Robocalls are IP based

POTS

Int'l

Source: 2018 Robocall Investigation Report ­ Transaction Network Services 13

#RSAC
ILEC
Cable ISPs
Wireless Carriers Hosted/OTT
VoIP IP Backbone
Providers
CLEC

#RSAC
STIR SHAKEN Framework Basic Flow

STIR Authentication
Service

Signed INVITE

STIR Verification Service

Certificate Repository

Bob's UA

Domain A

Originating Service Provider
Source: ATIS, RFC 8224

Domain B

Alice's UA

Terminating Service Provider

14

#RSAC
SHAKEN Reference Architecture

Certificate Provisioning
Authority

HTTPS

SECURE KEY
STORE

AUTHENTICATION SERVER
HTTPS STI - AS

CERTIFICATE REPOSITORY
STI-CR
VERIFICATION SERVER
HTTPS STI - VS

CALL VALIDATION TREATMENT
CVT

SKS

SIP CALL SESSION CONTROL FUNCTION

SIP

CSCF

SIP

SIP

SIP

CSCF SIP

SIP

SIP UA

USER AGENT

RTP

IBCF/

IBCF/

TrGW

TrGW

RTP

SIP UA

RTP

USER AGENT

Service Provider A Originating/Authorization

INTERCONNECTIONSeBrOvicReDPEroRvider B CONTROL FUNCTTerImOiNnating/Verification

Logical view based on 3GPP IMS architecture

Source: ATIS1000074, ATIS0300116

15

SHAKEN Reference Call Flow

#RSAC

Certificate Provisioning
Authority

HTTPS

STI-CR 9

STI - AS

3

SKS

24

CSCF

5

6

1

SIP

SIP UA RTP

IBCF/

TrGW

RTP

STI - VS 8 11

7
IBCF/ TrGW

CSCF RTP

Service Provider A Originating/Authorization

Service Provider B Terminating/Verification

Logical view based on 3GPP IMS Architecture

Source: ATIS 1000074, ATIS0300116

16

10 CVT
12 SIP UA

Signing Provider Signing Provider Signing Provider

Attestation Levels
Gateway

Partial

Has no relationship with the initiator of the call e.g. International Gateway

Can authenticate the customer and has NOT verified association with the TN being used

Full

#RSAC

Has direct authenticated relationship with customer and has verified the TN being used

17

3. A STIR & SHAKEN Mixer
Security Architecture Appetizers

Voice Attacks
Vishing

#RSAC
TN Impersonation

Invalid Unallocated Numbers
SPIT

Voicemail Hacking

Security Professionals are here to help

Swatting

Reference: RFC 8226, 7340

19

Security Architecture Considerations
56

#RSAC
1 Infrastructure 2 Data Sensitivity

7

7

3 Security Zone

4 Protocols

5 SHAKEN Cert framework

9

46

6 Tokens

8

8

7 Caches

8 GWs and UAs

1 2 3 10

9 Key Management
10 Privacy

20

#RSAC
1 Infrastructure
Is it a bird? plane? or cocktail?

Physical Appliances

Private or Public Cloud Deployments

Availability: Scalability, Resiliency, Redundancy

21

2 Data Sensitivity
Top Secret

#RSAC

PII

Non-Public

Public

· Private Keys

· Customer Identifiers · Infrastructure Specs · Customer Name · System Config info · Customer Address · IP Address

· Public Keys

22

3
Trusted STI -AS Restricted
SKS

Security Zone

#RSAC
Zero Trust

DMZ

Untrusted

Service Providers

SIP UA

Control Plane Access & Encryption at Identity Rest + Transit

Monitoring

STI -CR

SIP UA

CVT STI -VS

STI -AS

STI -CR

STI -VS

CVT

SKS

CSCF

CSCF

23

#RSAC
4 Protocols

Signaling

Media

SIP

RTP

Over UDP OR TCP?

WWW
http

24

Management
SNMP

#RSAC

4 Protocols: SIP, RTP

SIP Server

Token

SIP Client

RTP
Audio/Video Streaming SRTP

SIP Client

Unauthorized Eavesdropping

Encrypt the control plane

MiTM

Encrypt Real Time media transmission

Call manipulation

Refer Reference Architecture to note SIP/RTP flows

Reference: RFC 3261, RFC 3550

25

5 SHAKEN Certificate Management Architecture (I)

#RSAC

Service Provider (KMS)
Generate public/ private key pair

Create Certificate Signing Request (CSR)

SP Public Key CSR, SP code token

STI-CA

STI-PA
STI-PA maintains a current list of all authorized certificate issuers

Verify Identity
CA Public Key Certificate
Generate Token(JWT) signed with SP Private Key & SIP INVITE
Source: Based on ATIS-1000080, ATIS-1000084 26

Create Certificate

The set of telephone numbers for which a particular certificate is valid is expressed in the certificate

#RSAC
5 Note Worthy Cert Specs for STIR SHAKEN Framework

· Every call is not necessarily uniquely signed

· STIR SHAKEN Certificates are short-lived

· CA charging model is TBD

· Solution may not deal with CRL or OCSP

· Validation that message is signed by Trusted Root CA is crucial

27

#RSAC
6 Tokens ­ Security Considerations

Service Provider Code Tokens
JSON Web Tokens (JWT)

Persona Assertion Tokens PASSporT

28

#RSAC
6 Tokens ­ Security Considerations

Base64URL(UTF(JWS Protected Header)).Base64URL(JWS Payload).Base64URL(JWS Signature)

Characteristics
JWTs maybe created without signature
Support for encrypted JWTs is Optional

Exploits
Replay Attacks
Cut-and-paste Attacks

Reference: ATIS-1000080, RFC 7519

29

7 Cache Considerations
What happens when a Verification Service cannot reach the STI-CR?

STI -CA
Cache KMS

#RSAC

In the US, roundtrip latency <100ms

Cache

STI -CR

STI -VS

When large volumes of telephone calls need to be signed by the Authentication Service at high speed?

SKS

STI -AS

Cache

Millions of incoming calls
requiring Authentication IMS

Service Provider A Originating/Authorizing

Caching of Public Keys (STI-SP CA), Private Keys (?!)

Reference: RFC 7234

30

IMS
Service Provider B Terminating/Verifying

#RSAC
8 Intermediaries/Gateways 9 UE

**Caller Verified STIR Identity Support

End to end retention of SIP headers No SIP header rewrites Equipment updates for above

Attestation: Full, Partial, Gateway `Verstat' tel URI parameter support

31

#RSAC
There is No Silver Bullet. Take a Multilayered Approach.

Nomorobo Hiya Youmail

STIR SHAKEN (IP/SIP only)

Voice Experts + Cybersecurity + Every Consumer +
Industry
32

#RSAC
APPLY

Consumers Enterprises Service Providers Equipment vendors

In the Next 30 Days
·Find out what voice technology you use? · What equipment is in place?
E.g.: POTS, IP-PBX, TDM or SIP Note: Some VoIP applications use proprietary protocols
·What solutions are used to address Robocalling? ·Do you use contact centres? ·What technologies are used there? ·Consider participating in Standards Development:
ATIS, SIP Forum, IP-NNI joint task force, IETFs, other

33

APPLY
Consumers

#RSAC
In the Next 60 Days
Leverage Services available to protect yourself from phone scams.

Enterprises Service Providers
Equipment vendors

Inquire where your voice experts are with STIR SHAKEN · Will equipment in your environment need updates? · Are your suppliers engaged in STIR SHAKEN?
Inquire where your voice experts are with STIR SHAKEN · What kind of solution is being planned? · Vendor equipment? Inhouse development? Opensource? · What levels of attestation will you provide? · How will you present this to customers?
Inquire with your team where they are with STIR SHAKEN? · Do equipment features support STIR-SHAKEN? · Are there upgrades to Infrastructure being planned? · Gateways, SBCs, UEs

34

APPLY
Consumers

#RSAC
In the Next 90 Days and BEYOND
· Leverage Services available to protect yourself from phone scams. · Lookout for signs of deployment of STIR SHAKEN · Your service provider may require you to opt-in for this feature · Are there new indicators of call attestation on your callerID display?

· Partner with the voice experts to review security architectures

Enterprises

for STIR SHAKEN

Service Providers

Equipment vendors · Share your security expertise for secure implementation of

STIR SHAKEN

35

#RSAC
Session Objectives
Enhance your familiarity with the Robocalling problem and related voice crimes
Review the STIR SHAKEN Framework
Security Architecture considerations for STIR SHAKEN
36

#RSAC
Thank You!
CONTACT:
daksha_bhasker@comcast.com Senior Cybersecurity Architect Comcast (215) 280-5216
Shout Out To Women in Cybersecurity
37

Daksha Bhasker, P.Eng(CIE), MBA, CISM, CISSP, CCSK Senior Security Architect, Comcast
Daksha has over fifteen years experience in the telecommunications service provider industry with roles in both business management and technology development, accountable for complex solution architectures and security systems development. Her security work spans carrier scale voice, video, data and security solutions. Prior to joining Comcast she worked at Bell Canada developing their cyber threat intelligence platform, and securing cloud deployments. Daksha holds an M.S in computer systems engineering from Irkutsk State Technical University, Russia, and an MBA in electronic commerce from the University of New Brunswick, Canada. She has various publications in international security journals and contributes to security standards development. She is an advocate for women in cybersecurity.

APPENDIX

References, Standards, Documents
ATIS-1000074, Signature-based Handling of Asserted Information using Tokens (SHAKEN) ATIS-1000080, Signature-based Handling of Asserted information using toKENs (SHAKEN): Governance Model and Certificate Management ATIS-0300251, Codes for Identification of Service Providers for Information Exchange ATIS-1000084, Technical Report on Operational and Management Considerations for SHAKEN STI Certification Authorities and Policy Administrators ATIS-1000081, Technical Report on a Framework for Display of Verified Caller ID RFC7340, Secure Telephone Identity problem statements and Requirements RFC8224, Authenticated Identity Management in the Session Initiation Protocol, RFC8225, Personal Assertion Token (PASSporT), RFC8226, Secure Telephone Identity Credentials: Certificates, RFC 3261, SIP: Session Initiation Protocol Industry Robocall Strike Force Report Martini Recipes

#RSAC

40

In Canada
· Rules for Robocalling have some differences

#RSAC
· And Yet...
In 2018 the BBB reported that Canadians lost >$100 million to scams most over the phone

41

5 SHAKEN Certificate Management Architecture (II)

Governance

STI-PA

Validates the token has been signed by STI-PA

HTTPS

STI-CA

Some Carriers may establish own CAs**

STI-PA is the trust anchor of the SHAKEN ecosystem

Service Provider Code Token

ACME

SP -KMS

Public Key Certificate

STI - CR

SKS

HTTPS

HTTPS

HTTPS

STI - AS

STI - VS

List of Valid CAs
For the Authentication services (STI-AS) to sign calls they must hold a private key corresponding to a certificate with authority over the calling number.
ATIS 1000080 42

#RSAC

#RSAC
9 Secure Key Store (SKS)

Envelope Encryption

Key Vault
43

HSM

10 Privacy Considerations
Telephone Numbers CNAM

#RSAC
Phone Directory Yellow Pages

Data Custodians and Data Owners have different responsibilities and privileges
44

Limitations

Scope of Impact

Originating Terminating Mitigation of

Network

Network Spoofing

PSTN

PSTN

No impact

SIP-Domestic SIP-Domestic Significant impact

SIP-Domestic PSTN

Potential impact

PSTN

SIP-Domestic No impact

SIP-International PSTN

No impact

SIP-International SIP-Domestic Little impact

#RSAC
SIP only scope International calls will have low attestation Testing is underway Differences in US/Canadian CNAM operations may cause interop issues.

Solutions itself continues to be developed and evolved
45

Shout Out To Women in Cybersecurity

#RSAC

HAPPY INTERNATIONAL WOMEN's DAY!

A stunning exhibit at the Barnes Foundation in Philadelphia
46

