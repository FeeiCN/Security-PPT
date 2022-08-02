SESSION ID: TECH-T11
DEEP DIVE ANALYSIS OF ENTERPRISE NETWORK SECURITY MECHANISMS

Dr. Avril Salter, AJ1VA, CCNP-W, CCNA-S, CWNE-350
Independent Consultant Salter & Associates @AvrilSalterUSA

#RSAC

#RSAC
The question that
triggered this presentation

#RSAC
Why This Presentation Matters
Common Enterprise Issues
­ Ambiguous network security protocols in use
­ Diversity of solutions
Across business units Network line User / equipment
­ Hardware and software variances ­ Monitoring ­ Feature complexity

#RSAC
Session Outline and Learning Objectives

Network security protocols SSH TLS IPsec 802.1X

Evolutionary improvements Functionality Cryptographic algorithms Forward secrecy

Looking for commonalty to improve understanding

Gain insights into where things are going

4

#RSAC
Today's Presentation is Mostly Demonstrations

Wireshark

PCAPs

Open source tool for packet analysis https://tinyurl.com/qohs6lk

https://www.dropbox.com/sh/inxjtpt96lfxfng/ AABTZ2gnHMOD4m-ngaLpy5nla?dl=0

#RSAC
Things to Observe

Business goals drive the message flows

Multiple protocols or layers required to deliver network security

Same underlying security mechanisms

­ PSK, public/private cryptography

­ Sharing of keying material ­ Generate shared secret

Techniques that as security experts you are aware of

­ Encryption, message integrity

802.1X / EAP
Business Usage

#RSAC

Multiple Layers

TLS TTLS

......

PEAP

Extensible Authentication Protocol (EAP)

802.1X EAPOL

Logical Link Control (LLC)

802.11 / 802.3

Evolution
Wired
MACsec MACsec Key Agreement (MKA)

#RSAC

Wireless
WPA3 Personal Enterprise 128 AES 192 AES

SAE
PMF Mandatory

802.1X
PMF Mandatory

802.1X EAPOL
WPA3-Personal
Beacon (RSN AKM SAE) Authentication (ECC/FFC, scalar, element) Authentication (scalar, element) Authentication (successful, confirm, hash) Authentication (successful, confirm, hash) Association request (RSN SAE) Association response (successful) EAPOL (ANonce) EAPOL (SNonce, MIC) EAPOL (GTK, MIC) EAPOL (MIC)

#RSAC

WPA3-Enterprise AAA

802.1X
Beacon (RSN AKM 802.1X) Authentication (Open) Authentication (Successful) Association (RSN 802.1X) Association (successful) EAP Request identity EAP Response identity

AAA protocol e.g. RADIUS
RADIUS access req

e.g. PEAP / MS-CHAPv2
EAPOL-key (ANonce) EAPOL-key (SNonce, MIC) EAPOL-key (Encrypted GTK, MIC) EAPOL-key (Ack, MIC)

#RSAC
802.1X Demonstration

IPsec
Business Usage

#RSAC

Multiple Layers
IP Security Architecture

ESP

AH

Encryption algorithm

Combined algorithm

Integrity algorithm

IKE

Evolution of IKE
IKEv1
Phase 1 Main mode
­ IKE SA Negotiation ­ 6 Messages
Phase 2 Quick Mode
­ IPSec SA Negotiation ­ 3 messages
Validate peers
­ Pre-Shared Keys ­ Certificates

#RSAC
IKEv2
Phase 1
­ 4 messages ­ Encrypts after 2 messages
Phase 2 Creates first CHILD SA New DH values, encryption & hashing algorithms Adds EAP Possible future changes
­ Labeled IPsec

Quick mode

Evolution of IKE

Initiator

IKEv1

Responder

Main Mode

ISAKMP (Initiator SPI, SA proposal) ISAKMP (Initiator & recipient SPI, SA ) ISAKMP (nonce, key exchange) ISAKMP (nonce, key exchange) ISAKMP (encrypted authentication material) ISAKMP (encrypted authentication material) ISAKMP (Hash, SA proposal, nonce, Key Exchange) ISAKMP (Hash, SA accept, nonce, Key Exchange) ISAKMP (Hash)

Initiator

IKEv2

IKE_SA_INIT (SPI, SA, KE, Nonce) IKE_SA_INIT (SPIs, SA, KE, Nonce) IKE_AUTH (Auth , SA) IKE_AUTH

Optional EAP exchange CREATE_CHILD_SA CREATE_CHILD_SA

#RSAC
Responder

Encrypted

#RSAC
IKE v2 Demonstration

TLS
Business Usage

#RSAC
Multiple Layers
Record
Shared transport, confidentiality, integrity
TCP

Application
Transport upper layer protocols
Alert
Reports errors
Change Cipher
Change to negotiated parameters
Handshake
Negotiate security parameters,
authentication

#RSAC
Evolution of TLS

TLS1.2
IETF RFC 5246 Incrementally modified and enhanced Recommended version since 2008 Increasing number of attacks Performance concerns

TLS 1.3
IETF RFC 8446 Finalized March 2018 Major redesign Cryptographic changes
Supported encryption algorithms Messages to negotiate a session PSK with DHE

#RSAC
Evolution of TLS

TLS 1.2

TLS 1.3

Client Hello (cipher suites, extensions)

Server Hello (cipher suite, certificate)

Generate

Generate

handshake keys

handshake keys

Client Key Exchange (DH parameters)

Generate session keys
Change Cipher Spec (hash)
Application data

Generate session keys

Client Hello (cipher suites, shared key ext.)
Generate handshake & session keys
Server Hello (cipher suite, encrypted app. data)
Generate handshake & session keys Certificate, certificate verify
Application data

#RSAC
TLS 1.2 and TLS 1.3 Demonstration

Secure Shell (SSH)
Business Usage

#RSAC

Three layers

Connection Protocol
Multiplexes encrypted tunnel into logical channels

Authentication Protocol
Client (user) authentication

SSH

Transport Layer Protocol
Server (host) authentication, confidentiality, integrity, forward secrecy

TCP/IP

#RSAC
Evolution of SSH

SSHv2
Different protocol to SSHv1 Only host keys Stronger encryption ciphers Message integrity checking Support for public keys certificates OpenSSH

Extensions
Stronger cryptography
­ Elliptic curve ­ SHA-256, SHA-512
Negotiation mechanism RFC 8308

SSH
Public host key
Authenticate server & Derive symmetric
encryption and MAC keys

#RSAC

Client

Server

3-way TCP Handshake Client (identification string) Server (identification string) Client Key Exchange Init (supported algorithms) Server Key Exchange Init (supported algorithms) Client Key Exchange Init (typically DH) Server Key Exchange Reply (signature) Client New Keys

Private and public host keys
Derive symmetric encryption and MAC keys

Protected

Client login (user name, password)

#RSAC
SSH2 Demonstration

#RSAC
The Best Reference is the Specification

#RSAC
Next Steps

7 DAYS
Find

30 DAYS
Explore

90 DAYS
Discover

What protocols are you
using? · Get permission · Capture traffic

What fields attributes
are important? · Download technical
specifications · Look up definitions

What future access
needs are essential? · IoT · 5G

24

#RSAC
Thank you for listening 
www.linkedin.com/in/avrilsalter @avrilsalterUSA
25

