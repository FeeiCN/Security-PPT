#RSAC
SESSION ID: TECH-R05
How to Secure Private 5G Networks
Srinivasan Balasubramanian
Distinguished Member, CTO Office Head of Standards & IP srini@celona.io @celona

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Introduction
A guide to bringing enterprise IT and cellular communications onto a common platform or infrastructure. Topics:
­ Shared spectrum for private networks ­ Zero Trust Architecture (ZTA) ­ ZT in 5G ­ Mobile Security and Network Access Control ­ Inter application, function, node security
Appendix
­ 3GPP Architecture and Security Framework ­ SEVEN TENETS OF THE NIST ZERO TRUST ARCHITECTURE ­ References
3

#RSAC
Shared spectrum for private networks
4

#RSAC
Shared spectrum for private networks
Citizens Broadband Radio Service (CBRS) is band 48 operating in the mid band spectrum : 150MHz; Spectrum allocation coordinated through a central entity: Spectrum Access System (SAS) Allows for regular LTE / NR devices to camp on enterprise networks Model being considered for in other bands: 3.1GHz to 3.45GHz; 6GHz; Approach being used across the globe ­ both static and dynamic methods
5

#RSAC
Zero Trust Architecture (ZTA)
6

ZTA ­ Key Concepts

#RSAC

Remove inherent trust

From perimeter security to deeper
integration

Zero trust is a continually
ongoing process.

Enable NaaS

With Applications, APIs, and User

Develop an API strategy.

Not an abrupt replacement with a
single solution.

Evolve with the capability and behavioral use of the network

Contextual and granular behavioral
monitoring

Clear and established verification
methods

Guidelines for enforcing policies

HW and SW

Databases of applications and user information
7

ZTA Realization

API an integral part development

Each API call is authenticated

Policies to access resources

APIs as thirdparty ownership

#RSAC

ZT frameworks guidelines

5G LAN is naturally adapted for ZT realization

Understand enterprise needs

Understand the protection
already available

Prioritize the highest value
assets.

Determine the gaps and strategize

Continuously monitoring
8

#RSAC
ZT in 5G

#RSAC
Key challenges addressed by 5GLAN
Spectrum management Coverage Deficiencies Device Capacity Quality of Service Data Security Mobility
Device Onboarding
10

What is 5GLAN
RAT Choice Simplicity IT-friendly Flexible

#RSAC
Carefully choose wireless technology or risk of dealing with performance, reliability and security issues.
Combining conventional wireless LANs with advanced LTE/5G NR technology, supporting seamless wireless connectivity
Overlay atop existing enterprise networks, fully integrated that includes indoor and outdoor small cell access points
Easy to use alternative to traditional wireless systems that are cost effective

Need for ZT early on
Threat vectors

#RSAC
Remains the same ­ Network, Users, Email, Applications (Web or Cloud), Remote
access nodes, Mobile devices, Data in motion and at rest (enterprise data)

Increased exposure

Multiple technologies with different security levels;
Multi-Access Edge (MEC)
The disaggregated nature of 5G with Service Based Architecture
Newer services enabled through LTE/5G NR
Network exposure functions (NEFs) and interfaces create a larger attack surface

#RSAC
Support Your Zero Trust Strategy with 5G LAN

Strong Device Identification
Mutual Authentication
End-to-End Encryption

Known, fixed endpoint identification supports authentication and asset management
Between endpoints and 5G LAN, plus infrastructure components to one another
Over the air, through the 5G LAN, enterprise LAN, and to any private or public cloud

AES Ciphering

IPSec Tunnel

TLS Tunnel

#RSAC

TPM
Mutual auth
SIM

CA based auth
CA based auth

The 5G LAN infrastructure includes strong mutual authentication and encryption along the full data
path, wireless and wired.

#RSAC
Network segmentation as a ZT realization with 5GLAN

Segmentation

Segment over the air and through public and private networks

Quality of Service

Guarantee availability and SLAs for critical applications

Extensible Architecture

Native microservices based platform with APIs for extensibility and integrations

#RSAC
Maintain Data Privacy

Data Path Control for Privacy and Compliance
Privacy Promise

Enterprise data stays 100% under your control, alleviating privacy concerns of public 5G and private solutions from MNOs.
Never have access to data payloads and does not sell, share, or monetize any client or meta data.

Preserved Privacy with Neutral Host Networks

For organizations pursuing NHN, private connections are segregated and secured from public connections.
16

#RSAC
ZT with SBA use in 5GC

ZT with CUPS

#RSAC

18

#RSAC
Mobile Security and Network Access Control

#RSAC
3GPP Authentication Protocol

3GPP defines an Authentication and Key Agreement (AKA)
protocol

Supports authentication, message integrity, and
message confidentiality

Challenge-andresponse mutual authentication
protocol

Uses key shared between a subscriber and a home network

Cryptographic keys derived post
authentication and encrypts signaling and
user plane traffic

20

Primary User Authentication
Primary authentication

PKI based on symmetric keys with SIM based credentials

5G NR also allows for TLS / TTLS with public key certification that can be SIM or non-SIM
based

Transported on EAPan IETF established
protocol

4G LTE: AKA;

5G NR: 5G-AKA, AKA';

Beyond 3GPP: certificates, preshared keys, and username/password

#RSAC

#RSAC
Secondary User Authentication

Secondary authentication

Authorization during the set-up
of user plane connections

Delegates the
authorization to a 3rd party

Allows for layered security policies instead of just a front door entry

Enables sponsored connectivity

#RSAC
Security Framework ­ 4G / 5G

#RSAC
Security Framework ­ Wi-Fi
24

#RSAC
5G authentication improvements over 4G
5G Authentication improvements over 4G

Gaps in 4G

Unified authentication
framework

Concealed identity protection

Enhanced homenetwork control

Improved key separation in key
derivation.

Open framework supporting multiple
authentication methods

UE identity sent in the open

Authentication done by serving
network

Enables wireless (including Wi-Fi)
and wireline convergence

Allows for nonUSIM based credentials

25

#RSAC
Device credential management
26

#RSAC
Inter application, function, node security
27

#RSAC
Service Based Architecture

#RSAC
Edgeless
29

#RSAC
Edge Compute and Multi Cloud
30

#RSAC
How to apply what we went over today
Determining the service needs of the enterprise
­ Identify the required SLO of the different services ­ Identify the resources that need to be protected ­ Identify user groups and the isolation of access and information exchange ­ Identify the inbound and outbound roaming and secure accesses required
Determining the capability of individual RAT
­ Find the right RAT that will meet the current and future needs of the enterprise
Identify the threat vectors in the system Design the network to meet the SLO of the different services while addressing the threat vectors
31

#RSAC
Appendix
32

#RSAC
3GPP Architecture and Security Framework
33

#RSAC
4G / 5G Network Architecture

#RSAC
4G and 5G Authentication summary view
35

#RSAC
SEVEN TENETS OF THE NIST ZERO TRUST ARCHITECTURE
36

#RSAC
SEVEN TENETS OF THE NIST ZERO TRUST ARCHITECTURE
All data sources and computing services are considered resources. All communication is secured regardless of network location. Access to individual enterprise resources is granted on a per-session basis. Access to resources is determined by dynamic policy and may include other behavioral and environmental attributes. The enterprise monitors and measures the integrity and security posture of all owned and associated assets. All resource authentication and authorization are dynamic and strictly enforced before access is allowed. The enterprise collects as much information as possible about the current state of assets, network infrastructure, and communications and uses it to improve its security posture.

#RSAC
References
38

#RSAC
IETF References
Internet Engineering Task Force, "Improved Extensible Authentication Protocol Method for 3rd Generation Authentication and Key Agreement (EAP-AKA')," Request for Comments (RFC) 5448 (May 2009).
Internet Engineering Task Force, "Extensible Authentication Protocol (EAP)," Request for Comments (RFC) 3748 (June 2004).
Internet Engineering Task Force, "The EAP-TLS Authentication Protocol," Request for Comments (RFC) 5216 (March 2008).

#RSAC
3GPP Specification References
3GPP, "3GPP System Architecture Evolution (SAE)--Security Architecture" (Release 15), technical specification (TS) 33.401, v15.2.0 (September 2018). 3GPP, "Security Architecture and Procedures for 5G System" (Release 15), technical specification (TS) 33.501, v15.5.0 (September 2018).
­ provides additional authentication methods using EAP framework
23.502 38.331 31.102
­ outlines characteristics of USIM application
31.103 ISIM TR 33.899
­ secure storage and processing can be UICC and Smart Secure Platform (SSP)
TR 31.890 allows for legacy UICC to be used for 5G access.
40

#RSAC
GSMA References
eSIM: The What and How of Remote SIM Provisioning. GSMA paper ISO/IEC 7816 smart card standard. SGP.21 V2.2 SPG.22 V2.2.2
41

#RSAC
Conference Paper References
Zhenhua Li, Weiwei Wang, Christo Wilson, Jian Chen, Chen Qian, Taeho Jung, Lan Zhang, Kebin Liu, Xiangyang Li, and Yunhao Liu, "FBS-Radar: Uncovering Fake Base Stations at Scale in the Wild," Proceedings of the Internet Society Symposium on Network and Distributed System Security (NDSS) (February 2017). Altaf Shaik, Ravishankar Borgaonkar, N. Asokan, Valtteri Niemi, and Jean-Pierre Seifert, "Practical Attacks Against Privacy and Availability in 4G/LTE Mobile Communication Systems," Proceedings of the Internet Society Symposium on Network and Distributed System Security (NDSS) (Feburary 2016). Byeongdo Hong, Sangwook Bae, and Yongdae Kim, "GUTI Reallocation Demystified: Cellular Location Tracking with Changing Temporary Identifier," Proceedings of the Internet Society Symposium on Network and Distributed System Security (NDSS) (February 2018). David Basin, Jannik Dreier, Lucca Hirschi, Sasa Radomirovic, Ralf Sasse, and Vincent Stettler, "A Formal Analysis of 5G Authentication," Proceedings of the 2018 ACM SIGSAC Conference on Computer and Communications Security (CCS '18) (October 2018).
42

