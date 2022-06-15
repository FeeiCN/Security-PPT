#RSAC
SESSION ID: OST-T01
Sigstore, the Open Source Software Signing Service
Luke Hinds
Security Engineering Lead, Office of the CTO Red Hat

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other co-sponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Speaker Intro
Luke Hinds
 Founder of sigstore  OpenSSF TAC Member  Confidential Computing Board  Bug bounty programs (kubernetes)
3

What is a software supply chain??

Build systems (CI, Compliers)
Code reviewers

package
Artifact (container,.)
Code Dependency

Consumers / End Users

#RSAC
4

#RSAC
Software Supply Chain Attacks

Developers

Build systems (CI, Compliers)

 Replay / freeze attacks

 Compromised keys

 Account Compromise

 Swapped hashes

 Compromise of build systems

 Easy reconnaissance (open configuration)

 Typosquatting

Code reviewers

 Developer Burnout `act out'

package
Artifact (container,.)
Code Dependency

Consumers / End Users

5

#RSAC
Software Supply Chain Attacks
650%
Increase in supply chain attacks in 2021
Sonatype's State of the Software Supply Chain
6

#RSAC
What can be done?
7

#RSAC
Who is signing?
What gaps are present?
1. A significant lack of code signing adoption 1. A lack of credible & trustworthy provenance 1. Key management still a challenge!
8

#RSAC
Digital Signatures
So what does software signing get us?
9

#RSAC
So what does software signing get us?
Verifies integrity of content (signature cannot be verified if even 1 bit is altered)
10

#RSAC
So what does software signing get us?
Non-repudiation (i.e. entity that possesses the private key can not state that they did not sign the artifact)
11

#RSAC
So what does software signing get us?
Authentication: if a private key is conceptually bound to an identity, the sender of signed messages can be assumed
12

#RSAC
So what does software signing get us?
If signature includes a (third-party signed) timestamp, consumers can have greater assurances of when the artifact was signed
13

Who is signing (Critical Projects)?

Syst em
Linux Kernel Node.js Core Kubernetes Python OpenSSL

Sig ning Tools
PGP PHP sigstore PGP PGP

Trust Mod e l
Mostly TOFU (trust on first use) PKs in git repo (insecure) sigstore Keys on website (insecure) Keys on website (insecure)

#RSAC
14

Who is signing (Package Managers)?

Syst em
PyPi NPM Maven Central Containers Go Ruby Crates.io

Sig na t ure s
Optional PHP Required PGP N/A Optional No

Cert Syst ems
PGP NA PGP/x509 PGP/x509
x509 No

In Use
Rarely 0% 100% Rarely
Rarely No

#RSAC
15

#RSAC
So why are we not signing?
16

#RSAC
So why are we not signing!?
Managing security of private keys is difficult and expensive
17

#RSAC
So why are we not signing!?
Handling key rotation and key compromise
18

#RSAC
So why are we not signing!?
Fear of Key compromise
19

#RSAC
So why are we not signing!?
Costs!
20

#RSAC
So why are we not signing!?
Tooling is cumbersome to use and has not been modernised...
21

#RSAC
What if signing and key management were greatly simplified and provided for free to all?
22

#RSAC
Why reinvent the wheel?
Case Study: HTTPS
23

#RSAC
HTTPS based websites 2015 - 2020
source: scotthelme.co.uk
24

#RSAC
What happened in 2015 and beyond?
25

What happened in 2015 and beyond?

September, 2015 October, 2015 July, 2018 November, 2020

First Let's Encrypt Certificate issued Trusted by all major browsers Chrome v68 (non HTTPS "insecure") Firefox 83 introduces HTTPS-Only Mode

#RSAC
26

#RSAC
Browsers Close in...
27

#RSAC
What if we could do the same for software?
28

#RSAC
What is sigstore?
 Under the OpenSSF (open source software foundation)
 Provides software signing as a public good service
 Combination of services and clients
 Can be deployed privately / internal network
29

#RSAC
sigstore projects
· Fulcio: CA issues code signing certificates based on OIDC identity
· Rekor: signature transparency log - append-only, immutable · Cosign: container signing tool · Many other clients: maven, rust, ruby gems, python..
30

#RSAC
Other formats supported
 OpenID Connect Signing  KMS (AWS, Azure, GCP, Vault)  PKCS11 (YubiKey, HSM)  Algs RSA, ECDSA, Ed25519, GPG
31

#RSAC
sigstore OIDC signing
32

#RSAC
sigstore ODIC signing
GitHub Action:
"Subject Alternative Name": "https://github.com/lukehinds/widgets/.github/workflows/dock er-publish.yml@refs/heads/main"
Email:
"Subject Alternative Name": "lhinds@redhat.com"
33

sigstore public transparency log

{ "t ype": "rekord", "apiVersion": "0 .0 .1", "spec": { "signature": { "format": "pgp", "URL": "https:/ / example/ release/ my_release.tar.gz.sig", "publicKey": { "url": "https:/ / example/ keys/ public_key.pgp" }, }, "dat a": { "url": "https:/ / example/ release/ my_release.tar.gz", "hash": {"algorithm": "sha256", "value": "83jfj8we89903uhejw88..." } } }
}

Entry can be validated by "inclusion proof" using signed tree hash)

Root Hash
(AB+CD)
09us09ud09jupoij3p49sd

Hash(A+B)
a7a9u09usdfdr434tfd

Hash(B+D)
848jf0s099409f08us

Hash A
e908u09u093408yd
{ "Type" : { "ns": "rekord" , "version" : "0.1", "spec" : "https://github.com/projectrekor/rekor/rekord_spec.txt" "URL": "https://example/release/my_release.tar.gz" , "SHA": "SHA256" , "PublicKey": "PUBLIC_KEY", "Signature": "SIG"
}

Hash B
dhu09u0d9u90fsu
{ "Type" : { "ns": "rekord" , "version" : "0.1", "spec" : "https://github.com/projectrekor/rekor/rekord_spec.txt" "URL": "https://example/release/my_release.tar.gz" , "SHA": "SHA256" , "PublicKey": "PUBLIC_KEY", "Signature": "SIG"
}

Hash C
s09u09u09jupojde
{ "Type" : { "ns": "dd" , "version" : "0.1", "spec" : "https://github.com/asdd/rekor/rekord_spec.txt" "URL": "https://example/release/asd.tar.gz" , "SHA": "SHA256" , "PublicKey": "PUBLIC_KEY", "Signature": "SIG"
}

Hash D
56gf9u0 9u30 9u9w
{ "Type" : { "ns": "asddasd" , "version" : "0.1", "spec" : "https://gi/rekord_spec.txt" "URL": "https://example/release.tar.gz" , "SHA": "SHA256" , "PublicKey": "PUBLIC_KEY", "Signature": "SIG"
}

#RSAC

34

logs are publically transparent?

 Publicly verifiable  Has my key been used?  Has my OIDC been used?  What is the blast radius of a
key compromise?  Who has signed X digest?

Root Hash
(AB+CD)
09us09ud09jupoij3p49sd

Hash(A+B)
a7a9u09usdfdr434tfd

Hash(B+D)
848jf0s099409f08us

Hash A
e908u09u093408yd
{ "Type" : { "ns": "rekord" , "version" : "0.1", "spec" : "https://github.com/projectrekor/rekor/rekord_spec.txt" "URL": "https://example/release/my_release.tar.gz" , "SHA": "SHA256" , "PublicKey": "PUBLIC_KEY", "Signature": "SIG"
}

Hash B
dhu09u0d9u90fsu
{ "Type" : { "ns": "rekord" , "version" : "0.1", "spec" : "https://github.com/projectrekor/rekor/rekord_spec.txt" "URL": "https://example/release/my_release.tar.gz" , "SHA": "SHA256" , "PublicKey": "PUBLIC_KEY", "Signature": "SIG"
}

Hash C
s09u09u09jupojde
{ "Type" : { "ns": "dd" , "version" : "0.1", "spec" : "https://github.com/asdd/rekor/rekord_spec.txt" "URL": "https://example/release/asd.tar.gz" , "SHA": "SHA256" , "PublicKey": "PUBLIC_KEY", "Signature": "SIG"
}

Hash D
56gf9u0 9u30 9u9w
{ "Type" : { "ns": "asddasd" , "version" : "0.1", "spec" : "https://gi/rekord_spec.txt" "URL": "https://example/release.tar.gz" , "SHA": "SHA256" , "PublicKey": "PUBLIC_KEY", "Signature": "SIG"
}

#RSAC
35

#RSAC
Open Source Adoption
36

#RSAC
GitHub Actions
37

#RSAC
Kubernetes
38

#RSAC
Maven Central
39

Many More

Other projects onboarding Ruby Gems PyPi Rust Crates JReleaser Alpine Linux Npm Nuget Maven Central Vitess

#RSAC
40

How to find us.
Project Website https://sigstore.dev
Slack https://sigstore.slack.com

#RSAC
code https://github.com/sigstore twitter https://twitter.com/projectsigstor e
41

