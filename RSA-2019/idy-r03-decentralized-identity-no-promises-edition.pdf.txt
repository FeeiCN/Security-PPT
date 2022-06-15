SESSION ID: IDY-R03
Decentralized Identity: No Promises Edition

Pamela Dingle
Director of Identity Standards Microsoft @pamelarosiedee

Preeti Rastogi
Principal Software Engineer Microsoft @PreetiRastogi13

#RSAC

#RSAC
Cast of Characters

Preeti Rastogi

Pamela Dingle

Developed my first online application using CICS on Mainframes
3 years as a developer in antimalware security products
9 years as a security architect for enterprise mobile management
Now part of the Decentralized Identity Engineering team at Microsoft

Installed my first directory in '99
Wrote OSS RP code for infocards back in the day
8 years as an identity architect, 8 years in CTO office
Now running a team of experts who design identity standards for Microsoft

We come from Different Perspectives

#RSAC

Photo credit: David Guyler https://www.flickr.com/photos/daviegee/16840203586

Preeti

Photo credit: David Guyler https://www.flickr.com/photos/daviegee/16840203586

#RSAC
--- Excerpt from a Jan 22, 2018 blog by Peggy Johnson
https://blogs.microsoft.com/blog/2018/01/22/partnering-for-a-path-to-digital-identity/

#RSAC
Pam
Protest drove change
Inspiration for the Laws of Identity
First version was not 'consumer-grade'
(and some people liked it that way)
Taught us about Discovery UX
http://www.identityblog.com/stories/2005/05/13/TheLawsOfIdentity.pdf

#RSAC
Three ways to Get Around when you travel 7

Photo Credit: Hernan Pinera https://www.flickr.com/photos/hernanpc/8139327438/

#RSAC
1. Local

Photo credit: Bernard Spragg https://www.flickr.com/photos/volvob12b/14333164242/

#RSAC
2. All Inclusive

Photo credit: Wessel Blokzijl https://www.flickr.com/photos/wblokzijl/44967804132/

#RSAC
3. Yours

Photo credit: Pamela Dingle https://www.flickr.com/photos/pamelarosiedee/6889169915

Scenario: Own and control your identity
Alice wants to buy a house!!!
11

#RSAC
The User Agent generates keys

Identity Hub
User
Universal Resolver

User Agent

Bitcoin

Sovrin

Ethereum

#RSAC
Alice creates a Decentralized ID on the blockchain

Identity Hub
User
Universal Resolver

did:example:string1
User Agent

DID Registration

DID Document

Bitcoin

Sovrin

Ethereum

#RSAC
Alice logs on to the bank and starts a loan application

Identity Hub
User
Universal Resolver

Sign-In With DID
DID Authentication
User Agent

FabriKamBank

DID Resolution

DID Resolution

Bitcoin

Sovrin

Ethereum

Alice goes to her company to get signed employment details #RSAC

Identity Hub
User
Universal Resolver

Signs in with DID
User Agent
Position : Software Engineer Group: Decentralized Identity Years:12 Salary: 100
Verifiable Credentials

Contoso Company

Bitcoin

Sovrin

Ethereum

#RSAC
The User Agent signs and stores it in Alice's identity hub

Identity Hub

Verifiable Credentials

User

Universal Resolver

User Agent

FabrikamBank

Bitcoin

Sovrin

Ethereum

Now Alice can present her signed employment details #RSAC to the bank

Identity Hub

Verifiable Credentials

User

Universal Resolver

User Agent

Fabrikam Bank

Bitcoin

Sovrin

Ethereum

Decentralized Identity Building Blocks

Identity Hub

DID Authentication

VerifiabUlseeCrsredentials
Universal Resolver

User Agent
W3C Decentralized Identifiers

DID Registration
Distributed Systems
Blockchains and Ledgers

#RSAC
People, Apps, and Devices

How can an individual participate in a public key cryptography driven interaction model?

#RSAC
The Trust Model behind Decentralized Identity

Publish user-controlled public keys

­ A ledger-stored document is immutable*

!

o Once confirmed, a given document (transaction) cannot be deleted

or changed

o Updates require a new transaction hashed to the old with private keys

An immutable document on a ledger has advantages (also disadvantages)
­ Unlikely that any one entity can make your document disappear
o IFF your ledger stays healthy and has reasonable byzantine tolerance
­ Discovery document itself contains no PII ­ BUT corresponding identifier is public. Public identifiers can
be correlated

3 ,
1
/

#RSAC
The Immutable Bit ­ DID Document

/ "": , 3 ." " 
 

S

B

B K D RR

:L " D L

I 2L: KB B : B G. "#

IN EB . 1

,-0 1 /- . 0 1 /- .

8K8G

PG K B K D RR

:L "

T

3S

I 2L: B G: NK N A G B : B G "#

IN EB .

DL

T

S

I

2 G I BG

L K B G I BG A IL

:BG

CL GE

T

* Real doc, edited for brevity

#RSAC
Decentralized Identifiers (DIDs)
did:method:<specific-idstring>
A collision-free unique ID Method is a documented algorithm that describes how a specific idstring can 'resolve' to a document on a ledger Specification: https://w3c-ccg.github.io/did-spec/

DID Methods
Deterministic representation
Specification link encoded in DID Document @context
Open source "driver" code registered with universal resolver at http://uniresolver.io

#RSAC

Method

DID Prefix

Sovrin

did:sov:

Bitcoin Reference did:btcr:

DLT/Network Sovrin Bitcoin

Ethereum UPort Blockstack Veres One Ockam

did:uport: did:stack: did:v1: did:ockam:

Ethereum Ethereum Veres One Ockam

Full list of DID methods at https://w3c-ccg.github.io/did-method-registry

#RSAC
BTCR DID Method (https://w3c-ccg.github.io/didm/btcr)

did:btcr:TXREF-EXT(TX)

Defining org: W3C credentials community group (W3C CCG)
Ledger: Bitcoin (public permissionless)
Resolution:
­ DID-specific identifier is a TX ref ­ Once the base TX is located, newer blocks
are walked if they exist ­ DID document is the last TX in the chain
Great intro by Kim Hamilton Duffy:
https://www.youtube.com/watch?v=SBesOFNlLoo

24

DEMO ­ BTCR Registering and Resolving a DID
BTCR Playground
https://weboftrustinfo.github.io/btcr-tx-playground.github.io/
25

#RSAC
Proof of control of Decentralized Identifiers

Challenge & Response

Transport Protocols
­ HTTP Post ­ QR Code ­ Mobile Deep Link ­ JavaScript Browser API ­ BlueTooth ­ NFC

Diagram source: Markus Sabadello, https://www.youtube.com/watch?v=Yq8yFYdCnxU

#RSAC
Various forms of DID Auth Interactions
Diagram Source: https://github.com/WebOfTrustInfo/rwot6-santabarbara/blob/master/final-documents/did-auth.md

DEMO ­ Proof of control of DID
28

#RSAC
Authenticating with DIDs via Self-Issued OIDC

Challenge
HTTP/1.1 302 Found Location: openid://?
scope=openid &request= {
"iss": "did:doc:bankapplication", "response_type": "id_token", "client_id": "app://claims", "scope": "openid", "state": af0ifjsldkj "nonce": "drnEJZTtfh", "claims":{
"id_token":{ "age": {"essential": true}
} } } &state=af0ifjsldkj
Self-issued OpenID Connect is built into the core specification
Uses JWS/JWE
Compatible with centralized systems!

Response
HTTP/1.1 302 Found Location: app://claims# id_token=eyJ0 ... NiJ9.eyJ1c ... I6IjIifX0.DeWt4Qu ... ZXso &state=af0ifjsldkj=
Payload:
{
"iss": "https://self-issued.me", "sub": [Base64UrlEncoded Thumbprint], "aud": "app://claims", "nonce": "drnEJZTtfh", "state": af0ifjsldkj, "exp": 1311281970, "iat": 1311280970, "sub_jwk": { "kty":"RSA", "n": "0vx7agoebGcQSuuPiLJXZptN9nndrQmbXEps2aiAFbWhM78LhWx 4cbbfAAtVT86zwu1RK7aPFFxuhDR1L6tSoc_BJECPebWKRXjBZCiFV4n3oknjhMs tn64tZ_2W-5JsGY4Hc5n9yBXArwl93lqt7_RN5w6Cf0h4QyQ5v-65YGjQR0_FDW2 QvzqY368QQMicAtaSqzs8KJZgnYb9c7d0zgdAZHzu6qMQvRL5hajrn1n91CbOpbI SD08qNLyrdkt-bFTWhAI4vMQFh6WeZu0fM4lFd2NcRwr3XPksINHaQ-G_xBniIqb w0Ls1jF44-csFCur-kEgU8awapJzKnqDKgw", "e":"AQAB" }, "did": "did:ion:EiDhJDBj8OHAyENIS5Bbyn0MYPSb4wUCps9Hi7sj_-V0BQ" "age": 35 }

#RSAC
Swimlane (to look at later)

#RSAC
uPort
· Built on Ethereum · uPort Identity
· Keypair or Smart Contract address
· Main 3 components · Smart Contracts · Developer libraries · Mobile app
· Personal data stored offchain: IPFS, AWS, Azure, Dropbox
Diagram courtesy of uPort

#RSAC
Verifiable Credentials https://w3c.github.io/vc-data-model/

Issuer
Contoso Company

 
 

Holder
Identity Owner Alice


  
 

Verifier
Fabrikam Bank

did:ethr:0xbc3ae59... did:ethr:0xf4123f7... did:ethr:0x0a8a7e8...

Diagram adapted from link in title

DEMO ­ uPort Exchange of Verifiable Credentials
33

uPort : Creation and Issuance of Verifiable Credentials #RSAC
Diagram Source : https://developer.uport.me/credentials/createverification

uPort : Verifiable Presentation

#RSAC

Diagram Source : https://developer.uport.me/credentials/createverification

#RSAC
Sovrin [DID method, Foundation, Ledger]
Defining orgs:
­ Indy Hyperledger Project ­ Sovrin Foundation & Alliance ­ Evernym
Ledger: Sovrin ledger (public permissioned)
­ 4 different ledgers
Resolution:
­ standard Sovrin GET_NYM transaction, validated at multiple validators or signature of aggregator score validated
Diagram Source: https://www.evernym.com/wp-content/uploads/2017/07/The-Technical-Foundations-of-Sovrin.pdf

#RSAC
What Have we Shown You
Stuff that is reasonably standardized now
­ DIDs, DID documents, DID resolver
Stuff that needs to be standardized
­ DID auth, pairwise identifiers
Stuff that should be standardized
­ DID registration, Account Recovery
The community is working hard to ensure their worlds can intersect ­ there is work to do but lots of energy to see it done

#RSAC
How can You Apply this Knowledge
Join the Decentralized Identity Foundation: http://identity.foundation
Go get your own DID!
­ uPort Getting Started: http://developer.uport.me ­ BTCR Playground: https://weboftrustinfo.github.io/btcr-tx-playground.github.io/ ­ Indy Hyperledger Walkthrough: https://github.com/hyperledger/indy-sdk/blob/master/docs/getting-started/indy-walkthrough.md ­ Ockam SDK: https://github.com/ockam-network/ockam ­ Veres One Quickstart: https://veres.one/developers/guides/
Have an informed opinion
­ Know the difference between PII off-chain and Trust data on-chain ­ If you hate it, get involved and change what you hate ­ If you love it, get involved and make it better
If you want to understand the ideology behind Self-sovereign identity (built on the technology of decentralized identity) try this video: https://youtu.be/2g6KSv1aeuI

Thank You ­ Questions?
@pamelarosiedee @decentralizedID aka.ms/didwhitepaper

