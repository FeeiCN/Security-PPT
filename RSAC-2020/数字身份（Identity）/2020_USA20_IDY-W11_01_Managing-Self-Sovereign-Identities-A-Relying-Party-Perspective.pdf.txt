SESSION ID: IDY-W11
Managing Self-Sovereign Identities: A Relying Party Perspective

George Fletcher
Identity Standards Architect Verizon Media Inc. @gffletch

#RSAC

#RSAC
Introduction
2

#RSAC
Quick SSI Introduction

Federated Identity Model
User credential

Identity Provider

Trust
Verifiable Credential

#RSAC
Relying Party
4

#RSAC
What is Self-Sovereign Identity?

High Level SSI Model

Verifiable Credential
Issuer

Holder
Trust

#RSAC
Proof
Verifier
6

#RSAC
Decentralized Identifier -- DID

did:example:123456789abcdefghi

{ "@context": "https://w3id.org/did/v1", "id": "did:example:123456789abcdefghi", "authentication": [{
// this key can be used to authenticate as did:...fghi "id": "did:example:123456789abcdefghi#keys-1", "type": "RsaVerificationKey2018", "controller": "did:example:123456789abcdefghi", "publicKeyPem": "-----BEGIN PUBLIC KEY...END PUBLIC KEY-----\r\n" }], "service": [{ "type": "ExampleService", "serviceEndpoint": "https://example.com/endpoint/8377464" }] }
7

#RSAC
Why change the model?
Better end-to-end cryptographic trust Possible privacy concern with the Federated Identity Provider knowing where (which sites) the user is authenticating
­ Also which claims were presented to that relying party
Easy conceptual model for users
8

#RSAC
Relying Parties
9

#RSAC
Relying Party Life-Cycle Management

#RSAC

Identifier indirection at the RP

Identities

RPID

First Name Last Name Gender ...

1234

George Fletcher Male

...

IDP SSI Google

Username AuthN gffletch DID-Auth 13443453 OIDC

Credential RPID

DID

1234

2345

Credentials

#RSAC
Registration
12

Common Pattern: Registration

#RSAC
Provide Registration Information
Relying Party
Verify Mobile Phone

Possible SSI Registration Flow

#RSAC

Show QR Code w/ AuthN Challenge
Request Additional Claims

Scan QR Code

Claims

Relying Party

POST AuthN Response

What's Different: Data / Claims / Attributes
Data Availability · What to require/request? · Zero Knowledge Proofs
Verified vs Unverified · Which claims can be self -asserted? · Which claims does the RP want to be verifiable? · Who do you trust to verify a claim?
Lessons learned from the OpenID Connect rollout

#RSAC
15

What's Different: Protocol
Challenge / Response for registration · Based on DID -Auth · UX is closer to a "social login" or federation flow for registration
Lack of standardization · No standard for requesting claims

#RSAC
16

#RSAC
Authentication
17

#RSAC
Common Pattern: Authentication

#RSAC
Possible SSI Authentication Flow

Show QR Code w/ AuthN Challenge

Scan QR Code

Signed In

Relying Party

POST AuthN Response

#RSAC
Possible SSI Authentication Flow

Request Username

Signed In
Push AuthN Challenge
AuthN Response

Relying Party

What's Different: Protocol
Authentication Protocol · Can use an "identifier first" flow to make the UX very similar · Options for direct connection to the SSI "wallet" (Agent)
Lack of standardization · DID-Auth defines the structure of the flow · Each DID method defines its own syntax
Should multiple authentication methods be supported?

#RSAC
21

#RSAC
Account Recovery
22

#RSAC
Common Pattern: Account Recovery

#RSAC
Possible SSI Account Recovery Flow
This Page Intentionally Left blank

What's Different: Recovery Methods
Current SSI defined methods · back up private keys (e.g. DON'T LOSE THEM) Is this really viable for a relying party? · What about purchase recovery via credit -card on file? What are the implications of allowing other recovery methods? What are the best methods to use?

#RSAC
25

#RSAC
Account Linking
26

Account Linking
Connecting SSI identities to existing users: · Normal user authN + DID-Auth and then a
link action · RP needs to link the DID as a valid identifier
(alias) on the user's existing identity Is this a registration time only event? If so, how does the RP offer this to the user?

#RSAC
27

#RSAC
Privacy
2 8

#RSAC
The Coffee Shop Chronicles

#RSAC
Recognize & Serve
30

#RSAC
Trust

#RSAC
Selective Disclosure

#RSAC
Other Topics
33

#RSAC
Fraud / Anti-abuse
34

#RSAC
Opportunities
35

Relying Parties will need to...

Final Thoughts

Support both identity models in parallel Minimize infra s truc ture impa c t De a l with ra pid innova tion in the s p a c e Ha ndle the la c k of s ta nda rdiza tion in the ne a r te rm

Treat the Self -Sovereign Identifier (DID) as a reference to the RP Identity

#RSAC
36

Q&A
George Fletcher Identity Standards Architect george.fletcher@verizonmedia.com

#RSAC
37

