SESSION ID: SEM-M04E
Identity and Access Management (IAM) Emerging Trends and Standards

Salah Machani
Director of Technology RSA #RSA

#RSAC

#RSAC
H5o0Cow-l6le0cmtiBveIalLyLnhIeyOldNdwoIirDgldEiwtNidaTelI(ITiDdICE)eSntities dPeor ayveoraug1e9bc1uusiAnreCrsCseeOnmUtpllNoyyTeeSh(LaasvtPeas?s)

Digital transformation is driving a new reality...

IDENTITY IS THE NEW PERIMETER

Public Domain

App Server App Server App Server

DMZ

Legacy

VPN

Service

Legacy App Server

Corp Network

Web Proxy

Public cloud
Vendor Service IDaaS

Untrusted Users & Devices

Vendor Service

#RSAC

How did IAM evolve over time

1960's
Employees

1990's
Employees & partners

2000's
Employees, partners & Consumers

2010's
People, Things & Relationships

On-premise enterprise apps

Partner apps & App in private clouds

Apps in public clouds

SaaS Shadow IT

Password
Centralized Directories

2-Factor Authentication

Biometrics

Passwordless MFA

Centralized, SSO WAM, WS-Fed

Centralized, Federated

BYO-ID,

SAML, OAuth, OIDC Decentralized ID, Self-sovereign

#RSAC

#RSAC
Digital transformation requires new methods to manage digital identity risk

#RSAC
The goal of IAM today
Ensure that the right people and "things" get access to the right
resources (applications, data, and so on) at the right times, from the right device and location for the right reasons.

 













Thing





 

Protected resources: apps, data, services, devices, etc.

#RSAC
IAM key functionality

Managing credentials for numerous apps within the same or cross domains

SSO

Allowing or denying access to resources for authenticated users

Federation
Authorization

Creating, updating, revoking, recovering or deleting identities and associated entitlements.

Authentication Management Identity Proofing

Authenticating once and accessing many applications
Verifying user credentials at the time of access
Verifying claimant real-world identity and binding it to a digital identity

#RSAC
New approaches to manage digital identity risk
Remote Identity Proofing Passwordless Authentication Identity Risk Analytics Federated Identity and SSO Identity-as-a-Service (IDaaS) Bring Your Own Identity (BYO-ID) Continuous Authentication Identity of Things Zero-Trust Self-Sovereign Identity

#RSAC
TREND#1: Remote identity proofing

In-Person

Remote

#RSAC
TREND#1: Remote identity proofing
METHODS

1
Resolution

2
Validation

3
Verification

UNKNOWN PERSON
Electronic Government Issued Documents
Enhanced Dynamic KBA

BYO-ID Trusted Identity

National Biometric Databases

Identity Reputation & Graph Analysis

Behavioral Analysis

Relevant Standards/Guidelines/Regulations
NIST 800-63-A, KYC, AML

KNOWN PERSON
Trusted Referee
Proof-OfPossession

#RSAC
TREND#1: Remote identity proofing
Benefits

Efficient onboarding and account creation processes

Flexible workforce

Reduced fraud and identity theft

Cost-effective and easier credential recovery processes

#RSAC
TREND#2: Passwordless authentication

A long-standing goal
Eliminating the need for centrally managed passwords

Gaining real market visibility
FIDO2 and W3C WebAuthn API support in browsers and platforms

FIDO2, U2F, UAF, CTAP

WebAuthn API

NIST 800-63-B

#RSAC
TREND#2: Passwordless authentication

Going from this...

To this...

MODERN AUTHENTICATION

Password

Push

Mobile OTP

Biometrics

Text Msg

Voice Call

HW Token

SW Token

FIDO

Proximity

Wearables

Providing same or higher authentication assurance levels

#RSAC
TREND#2: Passwordless authentication
TRADITIONAL ONLINE AUTHENTICATION

Something

Device

INTERNET
Authentication

Password

Password or hash

#RSAC
TREND#2: Passwordless authentication
HOW FIDO IS DIFFERENT

User verification
Require user gesture before private key can be used

Authenticator

Private key dedicated to one app or RP
...

Challenge
FIDO Authentication

MDS FIDO Server
!

Signed Response

Public key

TREND#2: Passwordless authentication
PASSWORDLESS AUTHENTICATION WITH FIDO

1
2
?
Authentication Challenge

Relying Party Application
3
Biometric User Verification

#RSAC
4
Authenticated Online

#RSAC
TREND#2: Passwordless authentication

FIDO Benefits

Convenience
· Simple gestures · Single authenticator for
multiple apps

Security
· No secrets on server · MITM protection · Phishing protection

Privacy
· No PII · Local biometric · Non-likability between RPs

#RSAC
TREND#3: Identity assurance with risk analytics

Identity Assurance

Identity Proofing

User Authentication

Threat Detection

Detect anomalous user behavior

#RSAC
TREND#3: Identity assurance with risk analytics

User Data

External Security Alerts

Device Data Activity Data Contextual Data

Analytics Engine

Authorization Decisions

Allow Challenge Deny

#RSAC
TREND#3: Identity assurance with risk analytics

Benefits

Reduce and manage risk
· Detecting insider threats · Stopping attackers using compromised
credentials

Provide a better CX and UX
· Reducing administration overhead of access policies
· Providing frictionless user experience when risk is low

#RSAC
TREND#4: Federated identity and SSO
EXPERIENCING RAPID ADOPTION

Well-established Federation protocols

· Increased adoption of the cloud · Increased number of applications and passwords · Increased workforce distribution

SAML
Need for seamless, secure and controlled access to applications across multiple security domains

#RSAC
TREND#4: Federated identity and SSO
HOW FEDERATED IDENTITY ADDRESSES THESE NEEDS?

RRRPePlying
Party

Three-Party Trust Relationship
Identity Information

Identity Provider

Single Sign On

Authentication User

#RSAC
TREND#4: Federated identity and SSO

Benefits

User
· Sign in once and access multiple applications
· Increased productivity

Relying Party
· Move user identity risk and liability to trusted thirdparty authorities

Identity Provider
· Link user identity to multiple relying parties
· Enforce enterprise policies · Enable SSO · Protect user personal info

#RSAC
TREND#5: IDaaS
IAM SERVICES HOSTED AND MANAGED BY A THIRD-PARTY CLOUD VENDOR

SSO Federation Authorization Authentication Management Identity Proofing

IDaaS

 Cloud-based multi-tenant architecture  Credential management  Modern authentication  Single-Sign on and federation  Identity risk analytics and intelligence

TREND#5: IDaaS
ON-PREM IAM

Remote/Mobile User

Cloud SSO

ID Federation

Desktop user

#RSAC

Internal Apps Internal Apps Internal Apps

Cloud On-premise

IAM On-prem

Directory

TREND#5: IDaaS
IAM AS A SERVICE
Portal SSO Remote/Mobile User
Portal SSO
Desktop user

IDaaS

#RSAC

Secure Connector
Directory

Internal Apps Internal Apps Internal Apps

Cloud On-premise

#RSAC
TREND#5: IDaaS

Benefits

Organizations
· Leverage advanced IAM capabilities · Manage applications and entitlements using
easy and simple tools · Fill security/identity management skills gaps · Reduce cost

Users
· Access the same apps using the same authenticaton methods from anywhere
· Leverage self-service interfaces

Putting it all together

RRPRePlying Party

Identity Information

IDaaS

Analytics Engine

Passwordless MFA Server

Identity Manager
With Federation

Cloud SSO Redirect Browser

Passwordless Authentication (FIDO-based)

Authenticator

#RSAC

#RSAC
Putting it all together ­ in action

#RSAC
Putting it all together ­ in action
APPLICATION PROVIDER LOGIN PAGE

#RSAC
Putting it all together ­ in action
IDAAS PROVIDER AUTHENTICATION PAGE ­ USING FIDO2/HELLO

#RSAC
Putting it all together ­ in action
RISK-BASED/STEP-UP AUTHENTICATION

#RSAC
Putting it all together ­ in action

NEXT SIX MONTHS THIS WEEK

Adapt Now!
DIGITAL TRANSFORMATION REQUIRES NEW METHODS TO MANAGE IDENTITY RISK
Attend relevant sessions on
· Digital identity risk management · Passwordless authentication · Identity analytics for risk awareness · Zero trust
Get familiar with emerging standards
· FIDO2, CTAP2 and W3C WebAuthn
Adopt or demand that your IDaaS provider adopts
· Passwordless authentication · Identity and risk analytics · Federation and SSO · Remote identity proofing

#RSAC

SESSION ID: SEM-M04E
Identity and Access Management (IAM) Emerging Trends and Standards

Salah Machani
Director of Technology RSA Salah.machani@rsa.com

#RSAC

