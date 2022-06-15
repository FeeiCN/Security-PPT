#RSAC
SESSION ID: IDY-W09
Managing Decentralized Identities: A Relying Party Perspective
George Fletcher
Identity Standards Architect Capital One @gffletch

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

Introduction

#RSAC

3

#RSAC
Identity Patterns

Federated Identity Model
User credential

Identity Provider

Trust
Verifiable Credential

#RSAC
Relying Party
5

#RSAC
What is Decentralized Identity?

#RSAC
High Level Decentralized Identity Model

Verifiable Credential
Issuer

Holder
Trust

Proof
Verifier

7

#RSAC
Decentralized Identifier -- DID

did:example:123456789abcdefghi

{ "@context": "https://w3id.org/did/v1", "id": "did:example:123456789abcdefghi", "authentication": [{ // this key can be used to authenticate as did:...fghi "id": "did:example:123456789abcdefghi#keys-1", "type": "RsaVerificationKey2018", "controller": "did:example:123456789abcdefghi", "publicKeyPem": "----BEGIN PUBLIC KEY...END PUBLIC KEY----\r\n" }], "service": [{ "type": "ExampleService", "serviceEndpoint": "https://example.com/endpoint/8377464" }] }

8

#RSAC
Why change the model?
· Better end-to-end cryptographic trust · Possible privacy concern with the Federated Identity Provider
knowing where (which sites) the user is authenticating
­ Also which claims were presented to that relying party
· Easy conceptual model for users
9

#RSAC
Relying Parties
10

#RSAC
Relying Party Life-Cycle Management

#RSAC
Identifier indirection at the RP

Identities

RPID

First Name Last Name Gender

...

1234

George Fletcher Male

...

IDP
SSI Google

Username AuthN

Credential RPID

gffletch DID-Auth DID 13443453 OIDC

1234 2345

Credentials

#RSAC
Registration
13

Common Pattern: Registration

#RSAC
Provide Registration Information
Relying Party
Verify Mobile Phone

#RSAC
Possible SSI Registration Flow

Show QR Code w/ AuthN Challenge
Request Additional Claims

Scan QR Code

Claims

Relying Party

POST AuthN Response

#RSAC
What's Different: Data / Claims / Attributes
Data Availability
· What to require/request? · Zero Knowledge Proofs
Verified vs Unverified
· Which claims can be self-asserted? · Which claims does the RP want to be verifiable? · Who do you trust to verify a claim?
Lessons learned from the OpenID Connect rollout
16

What's Different: Protocol
Challenge / Response for registration
· Not "redirect based"; passive action by the RP (e.g. show QR code) · UX and Consent managed by the user's wallet · New protocols being developed in multiple organizations · OpenID Foundation is working on a number of specifications to help in this space
· Self-Issued OpenID Provider v2 · OpenID Connect for Verifiable Presentations
· Decentralized Identity Foundation
· Presentation Exchange 2.0.0
Lack of wallet content knowledge

#RSAC
17

#RSAC
Authentication
18

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

Relying Party

AuthN Response

What's Different: Protocol
Authentication Protocol
· Can use an "identifier first" flow to make the UX very similar · Options for direct connection to the SSI "wallet" (Agent)
Standardization
· OpenID Foundation: Self-Issued OpenID Provider v2 (SIOPv2) · Decentralized Identity Foundation: DID Authentication
· Merged work with the OpenID Foundation in December 2020
Should multiple authentication methods be supported?

#RSAC
22

#RSAC
Account Recovery
23

#RSAC
Common Pattern: Account Recovery

#RSAC
Possible SSI Account Recovery Flow
This Page Intentionally Left Blank

#RSAC
What's Different: Recovery Methods
Current SSI defined methods
· Back up private keys (e.g. DON'T LOSE THEM) · Back up mechanism defined by the Wallet provider
Is this really viable for a relying party?
· What about purchase recovery via credit-card on file?
What are the implications of allowing other recovery methods?
What are the best methods to use?
26

#RSAC
Account Linking
27

#RSAC
Account Linking
Connecting SSI identities to existing users: · Normal user authN + DID-Auth and
then a link action · RP needs to link the DID as a valid
identifier (alias) on the user's existing identity Is this a registration time only event? If so, how does the RP offer this to the user?
28

#RSAC
Privacy
2 9

#RSAC
The Coffee Shop Chronicles

#RSAC
Recognize & Serve
31

#RSAC
Trust

#RSAC
Selective Disclosure

#RSAC
Other Topics
34

Wallet Security & Trust

Software Trust

· Is the software a digital

wallet I trust?

Holder

Device Trust

· Is the software running on a device I'm willing to trust?
Issuer

#RSAC
Verifier

#RSAC
Fraud / Anti-abuse
36

#RSAC
Opportunities
37

#RSAC
Relying Parties will need to...

Final Thoughts

Support both identity models in parallel Minimize infrastructure impact Deal with rapid innovation in the space Handle the lack of standardization in the near term

Treat the Self-Sovereign Identifier (DID) as a reference to the RP Identity

38

#RSAC
Q&A
George Fletcher Identity Architect george.fletcher@capitalone.com
39

