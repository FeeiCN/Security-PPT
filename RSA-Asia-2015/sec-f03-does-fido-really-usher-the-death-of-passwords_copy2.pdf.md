SESSION ID: SEC-F03
Does FIDO really usher in the Death of Passwords?

Salah Machani
Senior Technologist, Office of the CTO, RSA

Kayvan Alikhani
Senior Director of Technology, RSA

#RSAC

#RSAC
Agenda
 Introduction: Why FIDO?  FIDO Architecture, Security & Privacy  FIDO Adoption Challenges  Summary and Recommendations
2

#RSAC
Disclaimer
* The views expressed here are our own and not necessarily those of our company or FIDO Alliance
3

Why Fast

#RSAC

IDentity

Online?

#RSAC
Password Problems
TOO MANY TO REMEMBER, DIFFICULT TO TYPE, AND TOO VULNERABLE
RE-USED

PHISHED

KEYLOGGED

#RSAC
Today's Solution

One Time Codes (SMS or Device)
IMPROVE SECURITY BUT AREN'T EASY ENOUGH

DEVICE COST

SMS USABILITY
PROVISIONING

STILL PHISHABLE

FIDO Solution

#RSAC

 Second Factor Experience  Passwordless Experience

7

#RSAC
Second Factor Experience

ONLINE AUTH REQUEST

LOCAL DEVICE AUTH

SUCCESS

Login ID & Password

Insert Dongle & Press button

Done

#RSAC
Passwordless Experience

ONLINE AUTH REQUEST

LOCAL DEVICE AUTH

SUCCESS

Transaction Detail

Show a Biometric

Done

#RSAC
FIDO Primary Goals
 Standardize strong multi-factor authentication  Preserve end-user privacy  Unify end-user experience
10

#RSAC
FIDO in Identity & Access Management (IAM)

Single Sign-On Federation
AAuutthheenntticattiioonn
User Management Physical-to-digital identity

MODERN AUTHENTICATION

Passwords

Strong

Risk-Based

10

FIDO Architecture, Security

#RSAC

and Privacy

#RSAC
FIDO Authentication Frameworks
 FIDO 1.0
 Universal Second Factor (U2F)  Second Factor Experience  Universal Authentication Framework (UAF)  Passwordless Experience  Specs available to the public
 FIDO 2.0
 Second Factor and Passwordless Experiences  New technical working group  Mission: Future requirements and widespread interoperability
13

#RSAC
Common Design Considerations
 Decouple User Verification from Authentication Protocol  Use Asymmetric Key Cryptography  Accept Different Kinds of Authenticators

FIDO Authenticator

Local User Verification

Private Key

Authentication Protocol

14

Relying Party

FIDO Server
Public Key

#RSAC
FIDO U2F Components and Protocols

User Environment

U2F Authenticator

Browser

U2F Components

U2F Protocols

Relying Party

User Presence Sensor

U2F JavaScript API

Registration

Web Application

U2F Secure Element

Authentication

U2F Server

Connectors
USB NFC Bluetooth

U2F APDU
USB API NFC API Bluetooth API

User Public Keys & Handles

FIDO UAF Components an Protocols

User Environment
User Agent (Mobile, App, Browser)

Registration Authentication

UAF Components
Relying Party
Web Application

#RSAC UAF Protocols

FIDO Client
Windows, Mac, IOS, Android
Authenticator Abstraction

Confirmation Deregistration

FIDO Server

OS /Server Security
Components

FIDO Authenticators

FIDO
FIADuMOtheetSnatdeicaratatvoer r
Validation

Risk &
FIDOIdeSnteitryver
Systems

#RSAC
FIDO Protocol Flows

FIDO
Authenticator
17

FIDO Client
UAF & U2F
o Registration o Authentication
UAF-only
o Transaction Confirmation
o Deregistration*

FIDO Server

#RSAC
FIDO Registration

1

REGISTRATION BEGINS

USER APPROVAL

2

USER APPROVAL

4

REGISTRATION COMPLETE

NEW KEY PAIR CREATED

3

PUBLIC KEY REGISTERED
Using Public key Cryptography

#RSAC
FIDO Login

1

LOGIN

USER APPROVAL/VERIFICATION 2

Login

LOGIN CHALLENGE

4

LOGIN COMPLETE

LOGIN RESPONSE
Using Public key Cryptography

KEY SELECTED

3

#RSAC
FIDO as part of a complete IAM solution

User Agent
FIDO Client

1

1

FIDO Authenticator

Local Verification

Private Key

2
Identity Provider
SAML, OAuth2, OpenID connect, etc

Relying PaRrPetyalRyrPietnyalRygrietnylyging Party
3

FIDO Server

FIDO Meta-data
Service

Public Keys

#RSAC
Security
 No Phishing  No Man-In-The-Middle (MITM)  No Secrets/Private Keys on Server
21

#RSAC
Privacy
 No link-ability
 Relying party and account specific-keys
 No unique ID per-device
 No Biometric data on server  User Consent/Approval for all actions
22

#RSAC
Trust
 Verify Device Vendor  Verify Device Security Characteristics
 User Verification Methods  Key Protection Methods  Display Capabilities  Cryptography Algorithms, etc.
 Device certification program
23

FIDO Implementation

#RSAC

Challenges

#RSAC
Interoperability
 UAF and U2F  Further potential fragmentation with FIDO 2.0
25

#RSAC
New Infrastructure Investments
 Invest in new FIDO servers & (optional) Metadata services  Changes to your web/mobile applications
 Enrollment & Login workflow  Dependency on OS, Browser and device types/versions
 Last mile: Integrate with existing security IAM infrastructure  Different laws and regulations in different regions
26

#RSAC
Enterprise Adoption Challenges
 Change tied to IT `refresh' cycles (2-4 years) for such solutions
 Look for similar adoption cycles within the enterprise
 Support integration with enterprise security IAM infrastructure
 Authorization & Federation services  Blend-in as part of existing multi-factor framework/as part of assurance
policies  User, Device and Application Provisioning & Management process  Integrate with IWA (Active Directory, existing identity stores)
27

#RSAC
Security threats
 Many things are out of scope for FIDO but important to your infrastructure security
 Primary authentication (threat to Client, Server & RP)  Recovery (threat to RP)  Private Key protection (threat to Client)  Credential/Biometric data protection (threat to Client)  FIDO biometric authenticator "Strength"
28

#RSAC
User experience

 New experience: Registration, verification and recovery processes
 Necklace problem still exists
 Various RPs may restrict support for specific authenticators  Fragmentation, Various Acceptance Criteria & Assurance levels

Relying Party 1 Accepts

Relying Party 2 Accepts

User's device
29

#RSAC
Customer Support
 Help desk retraining  Authenticators life-cycle management issues  Expected increase in support calls  Evaluate authenticators assurance levels (e.g. biometrics)  Multi-authenticator support calls
 Authenticators can not be uniquely identified (by-design)  How to decommission a specific authenticator
30

#RSAC
Added Cost

User: Smartphone/tablet should be FIDOequipped/certified

RP / Enterprise: Add FIDO server, Metadata server, and integration into existing IAM

Identity Provider

FIDO Authenticator

SAML, OAuth2, OpenID Connect, etc.

Local User Verification Private
Key

Authentication Protocol
31

FIDO Server
Public Keys

FIDO Meta-data
Service

#RSAC
Summary

#RSAC
We're not there `yet'
 Utopia
 Devices: All have well designed, easy to use FIDO authenticators  Enterprise: All apps support FIDO authentication  Hackers: Leave device-side biometric authentication "alone"
 Reality (for the next ~3-5 years)
 Devices: Growing mix of different capabilities, makes & models  Enterprise: Hodgepodge of Auth protocols and standards  Hackers: Can't wait...
33

#RSAC
There's some convincing to do...
 Adoption
 As more companies deploy FIDO enabled solutions with positive feedback: Deployment & Usage
 Security
 Assurance: As FIDO authenticators provide meta-data to clearly `grade' each authenticator's Assurance Level
 Certification
 Rely on FIDO certification of larger number of authentication vendors
34

#RSAC
Recommendations

#RSAC
Recommendations for FIDO-aware solutions
 Take close attention to FIDO technical working groups
 Don't put all your eggs in one basket, throw a wider net
 Design around solutions that take advantage of the evolving mobile auth methods
 Avoid solely relying on a single  FIDO Factor/Method  FIDO supported Platform/OS
 Look for broad support and compliance
 Determine Risk
 Take advantage of solutions that include "User behavioral data" to make better decisions
 User location, network, device registration, usage and activity pattern
36

#RSAC
Recommendations for FIDO-aware solutions
 Survey your users with simple PoCs to see what FIDO method `works' for them
 Remember: Combining auth methods lowers the risk of each method:
 Improves chance of information being accessed by the right person
 It's a Balancing Act
 Blend FIDO with other auth methods based on user "role" & "action
37

#RSAC
Questions?
38

