SESSION ID: MBS1-F03
API Abuse through Mobile Apps:
New Attacks, New Defenses

Skip Hovsmith
Principal Engineer CriticalBlue @SkipHovsmith

#RSAC

#RSAC
Apply What You Learn Today
Appreciate how mobile apps are used to abuse APIs Follow and later review a chain of exploits to get a feel for the types of attacks you will encounter Invest in continually keeping the cost of abusing your APIs higher than the value extracted by abusing them
2

#RSAC
The Dark API Economy
In 2018, Akamai observed:
­ 83% of CDN traffic was API content, not HTML.
­ Over 27B credential abuse attempts in 6 months
Gartner reports:
­ By 2022, API abuses will be the most-frequent attack vector resulting in data breaches for enterprise web applications.

#RSAC
Mobile Apps Rely on APIs
Traditional

Mobile

Shift from presentation markup to raw data transfer Stateless API calls are great for attackers

58% Mobile

Desktop 42%

#RSAC
API Abuse in the Mobile Market
1. Exploit a mobile app and channel to architect an API attack 2a. Use bots to launch high volume APIdriven attacks:
­ Fast or sustained data exfiltration ­ Account takeover attacks ­ Application-level denial of service attacks
2b. Use tampered apps to game the implicit API business model
­ Modify API call sequences for gain or frustration

#RSAC
API Abuse Defense Objectives
Prevent API reverse engineering Make it hard to construct a valid API call Make it hard enough that it's not worth it

#RSAC
Mobile Attack Surfaces

Attack Surface 1: User Credentials

Mobile App
QXBwcm9...

Attack Surface 3 : In Transit

Attack Surface 2: At Rest and At Run Time

API
Attack Surface 4: Accidental Leakage

OWASP Security Risks

Mobile Top Ten M1: Improper Platform Usage M2:Insecure Data Storage M3: Insecure Communication M4: Insecure Authentication M5: Insufficient Cryptography M6: Insecure Authorization M7: Client Code Quality M8: Code Tampering M9: Reverse Engineering M10: Extraneous Functionality

Enable

#RSAC
API Top Ten A1: Broken Object Level Access Control A2: Broken Authentication A3: Improper Data Filtering A4: Lack of Resources and Rate Limiting A5: Missing Fun/Resource Access Control A6: Mass Assignment A7: Security Misconfiguration A8: Injection A9: Improper Assets Management A10: Insufficient Logging and Monitoring

#RSAC
ShipFast and ShipRaider
A Hypothetical Package Delivery Service

#RSAC
The ShipFast Platform
ShipFast Driver's App (React Native) ShipFast REST API API Gateway ShipFast API Services Authentication Services
Public Repo: tbd

#RSAC
The ShipFast Driver's App
Driver assigned nearest shipment
Driver paid by distance driven and preestablished gratuity

API Sequence for Typical Package Delivery

Starts app, logs in
Get any active delivery
See available shipment
Accept shipment Pickup shipment Deliver shipment Collect gratuity!

ShipFast App

Auth Server

<credentials>

<UserTok> GET /shipments/active, Authorization=<UserTok>

404 or current shipment GET /shipments/nearest_shipment, Authz.., Lat=<m>, Lon=<n>

Shipment {id:<x>, desc:<y>, gratuity:<z>, <location>}

POST /shipments/update_state/<x>, Authz..., state=Accept POST /shipments/update_state/<x>, Authz..., state=Pickup POST /shipments/update_state/<x>, Authz..., state=Deliver
GET /shipments/delivered, Authz... Delivered shipment info

In Headers:

Authorization:

Bearer <access-token>

SF_API_Key: <api-key>

ShipFast Backend

#RSAC

#RSAC
The ShipRaider Driver's Assistant
Raider selects highest gratuity from nearby deliveries

API Sequence for Driver's Exploit

Starts app, logs in
Get any active delivery
See available shipment
Accept shipment Pickup shipment Deliver shipment Collect gratuity!

ShipFast App

Auth Server

<credentials>

<UserTok> GET /shipments/active, Authorization=<UserTok>

404 or current shipment GET /shipments/nearest_shipment, Authz.., Lat=<m>, Lon=<n>

Shipment {id:<x>, desc:<y>, gratuity:<z>, <location>}

POST /shipments/update_state/<x>, Authz..., state=Accept POST /shipments/update_state/<x>, Authz..., state=Pickup POST /shipments/update_state/<x>, Authz..., state=Deliver
GET /shipments/delivered, Authz... Delivered shipment info

In Headers:

Authorization:

Bearer <access-token>

SF_API_Key: <api-key>

ShipFast Backend

#RSAC

#RSAC
ShipFast Security Evolution

#RSAC
Initial Security Posture
OAuth2 Authorization Flow Static API Key in Code Bundle API calls over HTTPS
16

Common Back-End Defenses
Rate limiting
Data constraint checking

Filled by Maximum API Request Rate
Overflow Discarded
Drained by Actual API Request Rate

#RSAC

Calling pattern anomalies

Assume we can beat these statistical checks
17

#RSAC
Attack by Inspection
Attacker unzips app package Inspects index.android.bundle Finds API call fetches in code Finds API key in code User volunteers credentials Clones app with gratuity scanning
18

#RSAC
Defend Through Obfuscation
Obfuscate calling logic Obfuscate API calling & key strings Don't roll your own Do block debugging
For RN, use:
­ https://github.com/javascript-obfuscator/javascript-obfuscator
19

#RSAC
Attack using Man-in-the-Middle
Mobile App Intended Communication Channel API
Insert custom certificate in device trust store Show MitM proxy attack steps Easy to observe and modify API requests & responses

#RSAC
Defend by Pinning Channel
Client keeps whitelist of trusted certificates
Only accepts connections from a whitelisted certificate
Attacker cannot match a whitelisted certificate or know the certificate's private key
Use react-native-cert-pinner

#RSAC
Attack by Unpinning Channel
Use an instrumentation framework to hook the pinning decision function

#RSAC
Defend by Blocking Instrumentation
Block rooting and block hooking Change API key and/or API version!

#RSAC
Defeat by Product Manager
No Pinning!
­ Server certificates, their public keys or fingerprints are client secrets ­ Certificates may expire or be revoked, bricking the app ­ Updating the certificates on the client is a maintenance challenge

Defend by App-Level Message Protection

ShipFast App
Original Message
GET /shipments/active, Authorization=YXdlc29..., SF-APP_ID=QXBwcm9...

APP_SECRET

+

4ymoofRe0l87Q...

HMAC

Signature=GXbgtwg...

API Key: APP_ID APP_SECRET
GET /shipments/active, Authorization=YXdlc29..., SF-APP_ID=QXBwcm9..., SF-HMAC=GXbgtwg...

ShipFast API
Received Message GET /shipments/active, Authorization=YXdlc29..., SF-APP_ID=QXBwcm9..., SF-HMAC=GXbgtwg...

APP_SECRET

+

4ymoofRe0l87Q...

HMAC

== ?

Assume secret hidden somehow inside app Signing proves client possesses secret and request is untampered Secret not transmitted; only run time signature Responses can be signed; can use full encryption

#RSAC

#RSAC
Defend by Removing API Key from App Source
Download the API Key assuming Trust On First Use (TOFU) Store Key in secure storage (keystore/keychain) Use https://www.npmjs.com/package/react-native-secure-keystore

#RSAC
Attack by Finding HMAC Pieces
Use MitM to inspect API calls and find HMAC header Guess HMAC algorithm ­ HMAC-SHA256? Root phone and Inspect app's data stores Debug to find HMAC string in memory

#RSAC
Defend by Adding API Proxy
Define app-specific API between app & service Move 3rd party APIs and their API key insecurities to behind proxy server

#RSAC
Defend by using Secrets Service
Move secret from the app to a secrets service App receives a signed, short-lived JWT token on request Secret can be revoked or updated without touching app

#RSAC
How Does App Authenticate to Secrets Service?
User authentication not good enough Remotely attest code not tampered
­ Reliably perform non-replayable dynamic app integrity measurements ­ The app does not make or know the integrity decision
Verify security checks are in place (not rooted, not debugged, not emulator) Prototype by verifying package signature

#RSAC
Defend by Reintroducing Pinning Service
Securely grab pinning certificate from secrets service at app start up Not strictly necessary to update API key or version as the key was never seen in the app or the channel Add this to react-native-certificate-pinner package

#RSAC
Attacker Pivots to a Less Secure App
http://philjulianoillustration.com/comic/2010-04-28-bear-joke/

#RSAC
Authentication

OAuth2 Authorization Flow

Authorization Request Authorization Grant

Client

Authorization Grant Access Token

Access Token

Software App on User's Device

Protected Resource

Resource Owner

- Resource Owner is typically the user - Consents to authorization scope

Authorization Server

- Verifies Resource Owner identity - Issues tokens for access

Resource Server

- Holds the protected user resources - The API backend that provides content

#RSAC

#RSAC
Defend using PKCE
On mobile, prevent malicious party from intercepting authorization code Code challenge is hash of random value Mitigates against leaky client_secret Server compares with hash of code_verifier

#RSAC
Strengthen Oauth2 Using Secrets Service
Prevent fake apps from authenticating

#RSAC
Authorization in Context
Decide API authorization from multiple signals
­ User authentication ­ App authentication ­ Channel authentication ­ Device authentication ­ Behavioral profiles (time of day, location) ­ Mobile Captchas (accelerometer, touch)

#RSAC
API Abuse Defense Objectives
Prevent API reverse engineering Make it hard to construct a valid API call Make it hard enough that it's not worth it

#RSAC
Apply What You Learn Today
Appreciate how mobile apps are used to abuse APIs Follow and later review a chain of exploits to get a feel for the types of attacks you will encounter Invest in continually keeping the cost of abusing your APIs higher than the value extracted by abusing them
39

