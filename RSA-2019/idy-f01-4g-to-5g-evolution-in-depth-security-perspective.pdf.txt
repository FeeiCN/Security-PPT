SESSION ID: IDY-F01
4G to 5G Evolution: In-Depth Security Perspective

Dr. Anand R. Prasad
Chief Information Security Officer Rakuten Mobile Network @AnandRPrasad2

#RSAC

#RSAC
Objectives
Introduction 4G security and issues 5G security details and virtualization considerations 5G security next steps Apply and Summary
2

Introduction

#RSAC
3GPP and Specifications Timeline
3GPP is the mobile communications specifications group 3GPP SA3 is the working group that develops mobile communications security specifications

Specification Release Year

3G
TS 33.102 Release 3
2000

4G
TS 33.401 & 402 Release 8 2009

5G NonStandalone
TS 33.401 Release 15
2017

5G Phase-1

5G Phase-2

TS 33.501 Release 15
2018

TS 33.501 + ? Release 16 2019

4

#RSAC
Mobile Network Security ­ Introduction

Service

Subscriber Identity Module (SIM)

IMSI: International Mobile Subscriber Identity

Radio

Mobile Equipment (ME)

Network Base-Station

User Equipment

(UE)

Other network e.g.
WiFi

New radio network

Service Layer

Core Network

Foreign Network

Internet

Home subscriber subsystem (HSS)

Legacy radio networks

Non Access Stratum Access Stratum RRC

Access Stratum UP

RRC: Radio Resource Control

Security, standardized UP: User Plane

5

or otherwise

4G Security and Issues

4G Security: Architecture
(IV)
Service

Service Layer

#RSAC

USIM

(III)

(I)

(I)

ME
(I)

User Equipment

(I)
(I)
Radio eNB Network
(II)

· Mutual authentication · Integrity for control plane · Confidentiality optional for both control and user planes · Privacy provisioned by temporary identity

Core Network MME

(I) (II)
HSS

 Network access security (I)  Network domain security (II)  User domain security (III)  Application domain security (IV)  Visibility and configurability of
security (V)

7
USIM: Universal Subscriber Identity Module; ME: Mobile Equipment; MME: Mobility Management Entity; HSS: Home Subscriber Subsystem

Potential Threats on 4G
· IMSI in clear · Temporary identity not changed · No UP integrity protection · Bid-down to GSM

#RSAC
Interconnect threats due to SS7 & Diameter

Rogue eNodeB /

MitM

Radio Network

eNodeB

Core Network

Foreign Network

8

5G Security

#RSAC
3GPP 5G Specification Phases
Enhanced Mobile Broadband (eMBB)

Phase 1

3GPP phase based 5G specification

Phase 2

massive Machine Type Communication (mMTC)

Ultra Reliable Low Latency Communication
(URLLC)
10

Service Based Architecture (SBA)
SBA and network slicing bring cloud and NFV technologies to mobile network

3rd Party

ARPF: Authentication credential Repository and Processing Function SEAF: SEcurity Anchor Function SIDF: Subscription Identifier De-concealing Function

Network Slice
Selection

Network

Network

Exxposure Repository

Policy Control

User Data Management

Application

NSSF

NEF

Nnssf

Nnef

Nausf

NRF
Nnrf Namf

PCF
Npcf Nsmf

SIDF/AURDPMF/UDM AF

Nudm

Naf

Service Based Interface (SBI)

Security Edge Protection Proxy
SEPP

AUSF AMAFM/SFEAF

SMF

Authentication Access &

Server

Mob. Mgt.

Session Mgt.

Control Plane

N1

N4

N2 N2

Network Slicing

Non-3GPP Access

N3IWF

#RSAC
Other operator

N3
gNB

F1
DU
Distributed Unit
11

CU
Central Unit

UPF
User Plane

N6

DN

(Data Network)

Overview of 5G Phase-I Security

5G Phase-I Security

Unified Accessagnostic Authentication

Increased Home Control

RAN Security ­ DU-CU Split

5GS ­ EPS Interworking
Security

Primary Authentication

Enhanced Subscriber
Privacy

Service Based Architecture

NonStandalone

Secondary Authentication

Visibility and Configurability

Initial NAS Message Protection

12

PLMN Interconnect Security - SEPP

#RSAC

#RSAC
Security Functions in 5G Architecture

Serving network root key is

Verifies UE

derived at SEAF

authentication & stores

NAS security terminates in AMF Interconnect key for future re-use

traffic security

Subscription identity de-concealment

Non-3GPP Access

N3IWF

UE

DU

CU

Core Network

(Serving Network) S

S

AMF SEAF

E P

E P

P

P

Core Network (Home Network)

ARPF

AUSF

SIDF UDM

UDR

gNB
AS terminates at CU & N3IWF No security function is performed at DU

Subscription data (UDR) and credentials (ARPF) used by UDM for authentication credential generation, user identification etc.

AMF: ARPF: AUSF: CU: DU: N3IWF:

Access Management Function

Authentication credential Repository & Processing Function

AUthentication Server Function

Central Unit

Distributed Unit

13

Non-3GPP Inter Working Function

SEAF: SEPP: SIDF: UDM: UDR: UE:

SEcurity Anchor Function SEcurity Protection Proxy Subscription Identifier De-concealing Function Unified Data Management Unified Data Repository User Equipment

#RSAC
Trust-Model

Non-3GPP Access

Core Network

N3IWF

(Serving Network)

S

S

USIM ME

DU

CU

AMF SEAF

E P

E P

P

P

Core Network (Home Network)

ARPF

AUSF

SIDF UDM

UDR

AMF: ARPF: AUSF: CU: DU: ME: USIM:

Access Management Function

Authentication credential Repository & Processing Function

AUthentication Server Function

Central Unit

Distributed Unit

Mobile Equipment

14

Universal Subscriber Identity Module

N3IWF: SEAF: SEPP: SIDF: UDM: UDR: UE:

Non-3GPP Inter Working Function SEcurity Anchor Function SEcurity Protection Proxy Subscription Identifier De-concealing Function Unified Data Management Unified Data Repository User Equipment

Identities
SUPI

#RSAC
Subscription Permanent Identifier (SUPI) can be either IMSI or Network Access Identifier (NAI)

NAI

IMSI

Subscription Concealed Identifier (SUCI) is home network identifier and encrypted Mobile Subscriber Identity Number (MSIN)

MCC MNC

MSIN ECIES

5G-Globally Unique Temporary UE Identity (5GGUTI)
Refresh
HN Public key

MCC MNC Encrypted MSIN SUCI

ECIES: HN: MCC: MNC:

Elliptic Curve Integrated Encryption Scheme Home Network Mobile Country Code Mobile Network Code
15

#RSAC
Key Hierarchy

KN3IWF
KgNB, NH

KAMF

KSEAF

KNASint

KNASenc

5G AKA
KAUSF

CK, IK

K

KAUSF

CK',IK'

EAP AKA'

KRRint
USIM K

KRRCenc

KUPint

KUPenc

N3IWF

Core Network (Serving Network)

CU ME

AMF SEAF

Rest

AMF: ARPF: AUSF: CU: ME: USIM:

Access Management Function

Authentication credential Repository & Processing Function

AUthentication Server Function

Central Unit

Mobile Equipment Universal Subscriber Identity Module

16

S

S

E

E

P

P

P

P

Core Network (Home Network)

ARPF

AUSF

SIDF UDM

UDR

N3IWF: SEAF: SEPP: SIDF: UDM: UDR: UE:

Non-3GPP Inter Working Function SEcurity Anchor Function SEcurity Protection Proxy Subscription Identifier De-concealing Function Unified Data Management Unified Data Repository User Equipment

#RSAC
Non-Standalone (NSA) Security

4G Core Network

· For fast availability of 5G · gNB connected to existing 4G core network · gNB (5G) keys are derived from eNB (4G) key · UP integrity protection not available

eNB (4G)

gNB (5G)

KeNB

KDF

KgNB

KRRint

KRRCenc

KUPint

KUPenc

KDF: Key Derivation Function

17

#RSAC
Security Associations

3rd Party

ARPF: Authentication credential Repository and Processing Function

Service based architecture security AUSF: AUthentication Function

NSSF

NEF

Nnssf

Nnef

NRF
Nnrf

PCF
Npcf

Nausf

Namf

Nsmf

SIDF/ARPF/UDM
Nudm

AF
Naf SEPP

CU: Central Unit DN: Data Network DU: Distributed Unit

AUSF

AMF/SEAF

SMF

SEAF: SEcurity Anchor Function

N1

N2

N4

SIDF: Subscription Identifier De-concealing Function
UDM: Unified Data Management

F1

UE

DU

CU

N3

UPF

N6

gNB

UPF: User Plane Function
DN

Primary authentication Secondary authentication 18

NAS Confidentiality/Integrity RRC Confidentiality/Integrity UP Confidentiality/Integrity

#RSAC

Primary Authentication based on 5G AKA

UE

SEAF

SUCI or 5G-GUTI

SUPI / SUCI SN Name

AUSF

ARPF/UDM

· 5G Home Environment Authentication

Vector (HE AV):

AV Request (SUPI / SUCI, SN Name)

(RAND, AUTN, (X)RES*, KAUSF)

De-conceal SUCI and Select

· (X)RES* = KDF (CK|IK, (X)RES)

Authentication method · 5G Authentication Vector:

Generate AV SUPI, 5G HE AV Store XRES* Derive HXRES*

(RAND, AUTN, HXRES*, KSEAF) · H(X)RES* = KDF (RAND, (X)RES*)
· ME derives RES* from RES & CK,IK

Auth. Req. (RAND, AUTN) Verify AUTN

5G AV

· KSEAF is bound to the serving network name (SN-name)

Derive RES* Auth. Resp. (RES*)

· ngKSI: Key Set Identifier in 5G

Derive HRES*
HRES* =? HXRES* RES*

Auth. Success (ngKSI, ABBA)

RES* =? XRES* Result (SUPI, KSEAF)

19

· ABBA: Anti-Bidding down Between Architectures parameter provides protection against bidding down of security features from higher to a lower release

Enhanced Subscriber Privacy

SUPI

SUCI

#RSAC

SUCI

SUPI

USIM ME
UE

N3IWF CU

Core Network

(Serving Network) S

S

AMF SEAF

E P

E P

P

P

Core Network (Home Network)

ARPF

AUSF

SIDF UDM

UDR

USIM or ME derive SUCI from SUPI & SIDF SUPI from SUCI

Home Network Public Key is stored in USIM

AMF: ARPF: AUSF: CU: DU: ME: N3IWF:

Access Management Function

Authentication credential Repository & Processing Function

AUthentication Server Function

Central Unit

Distributed Unit

Mobile Equipment

20

Non 3GPP Inter Working Function

SEAF: SEPP: SIDF: UDM: UDR: UE: USIM:

SEcurity Anchor Function SEcurity Protection Proxy Subscription Identifier De-concealing Function Unified Data Management Unified Data Repository User Equipment Universal Subscriber Identity Module

#RSAC
Interconnect Security

N32-c interface for capability and policy negotiation between Security Protection Proxies (SEPPs)
N32-f interface for exchanging messages.
­ SEPPs receive HTTP request and rewrite to JSON ­ SEPPs apply end-to-end integrity and confidentiality protection

JSON Object Integrity protected
Encrypted

Symmetric keys N32-c (TLS)

IPX 1 Modifications IPX 2 Modifications

NF1

SEPP1

N32-f association

SEPP2

NF2

HTTP2

JSON

IPX1

IPX2
JSON
21

HTTP2

Virtualization Security

#RSAC
Threats ­ Summary

OSS/BSS Service, VNF & Infra Descr.

EMS 1

EMS x

VNF 1

VNF x

NFVI Virtual
Computing Storage Network

Virtualization Layer

NFVO VNF Manager
VIM

· Data manipulation · Privilege misuse · Package modification · Rogue VNF · Malicious code or tenant · Configuration modification · Resource allocation issues · Image tampering · Catalogue information exploit · Uploading malicious images

Hardware Resources Computing Storage Network
Data tampering Unauthorized Access

NFV MANO
Flooding, Routing attack
Unwiped data
23

#RSAC
Mitigation ­ Summary

OSS/BSS Service, VNF & Infra Descr.

EMS 1

EMS x

VNF 1

VNF x

NFVI Virtual
Computing Storage Network

Virtualization Layer

Hardware Resources Computing Storage Network

NFVO
VNF Manager

· Secure boot and chain of trust · Remote attestation · Secure crash · Security assurance, signing and
verification of image · VNF isolation · Tenant and administrator isolation

VIM NFV MANO

24

5G Security Next Steps

3GPP 5G Phase-2 Security

Phase 1

· Long-term key update · 256 bits keys usage · Security Assurance · Network slicing security · Location services security · Security for 5G URLLC · Security for Vertical & LAN
Services

Phase 2

massive Machine Type Communication (mMTC)
26

#RSAC
Enhanced Mobile Broadband (eMBB)
Ultra Reliable Low Latency Communication
(URLLC)

Apply

#RSAC
Apply
Service providers (mobile operators, IT, digitization ­ IoT etc.)
­ Understand your organization's connectivity needs and security requirements
­ Map the requirements to 5G and virtualization ­ Develop appropriate management and automated control mechanisms
Vendors
­ Verify 5G products security assurance requirements from 3GPP ­ Optimize implementation for virtualization ­ Consider security based on changing customer network architecture
28

Privacy

Deployment

Migration & Interworking

Design

Lawful Interception

#RSAC

Business

Regulation

Implementation

Operations & Management

Usage

Platform

Holistic security from first step
Specification

29

Summary

#RSAC
Summary
4G security and issues 5G security and how 4G security issue are mitigated 5G security details and virtualization considerations 5G security next steps
31

#RSAC
References
Journal of ICT Standardization, River Publishers, https://www.riverpublishers.com/journal.php?j=JICTS
­ 5G non-standard aspects, vol 5 issue 3 ­ 3GPP 5G specifications, vol 6 issue 1
3GPP SA3 specifications: http://www.3gpp.org/DynaReport/33-series.htm
­ 3GPP TS 33.401, "Technical Specification Group Services and System Aspects: 3GPP System Architecture Evolution (SAE) Security architecture", Release 15, v 15.3.0, March. 2018.
­ 3GPP TS 33.501, "Security architecture and procedures for 5G system", Release 15, v 15.0.0, March 2018.
Ravishankar Borgaonkar, Altaf Shaik, N. Asokan, ValAeri Niemi, Jean-Pierre Seifert, LTE and IMSI catcher myths, https://www.blackhat.com/docs/eu-15/materials/eu-15-Borgaonkar-LTE-And-IMSI-Catcher-Myths.pdf David Rupprecht, Katharina Kohls, Thorsten Holz, and Christina Pöpper, Breaking LTE on Layer Two, https://alterattack.net/ Ravishankar Borgaonkar, Lucca Hirschi, Shinjo Park, and Altaf Shaik, New Privacy Threat on 3G, 4G, and Upcoming 5G AKA Protocols, https://eprint.iacr.org/2018/1175.pdf Tobias Engel. (December 2014). "SS7: Locate. Track. Manipulate", http://berlin.ccc.de/~tobias/31c3-ss7-locatetrack-manipulate.pdf GSMA RIFS: "Diameter Roaming Security - Proposed Permanent Reference Document".
32

Questions?
Anand R. Prasad <anand@ieee.org> @AnandRPrasad2 https://jp.linkedin.com/in/arprasad

