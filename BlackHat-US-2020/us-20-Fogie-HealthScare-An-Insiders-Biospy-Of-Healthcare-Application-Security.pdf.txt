An Insiders Biopsy of Healthcare Application Security Seth Fogie
Seth.fogie@pennmedicine.upenn.edu
#BHUSA @BLACKHATEVENTS

Seth Fogie
- 20+ Years Security - Airscanner - Whitewolf - Coseinc - Researcher/Writer
- 10+ Penn Medicine
`1-Day' Vulnerabilities
- H-ISAC is aware - Vendors are aware - No guarantee that all customers
are aware or can remediate.

16 Years Ago
No Vendor Names/ Products

Security History
- DICOM - HL7 - Biomedical
Goals
- Awareness to healthcare security/privacy /audit teams
- Provide guidance to software vendors
- Insight for security community

Alice and Bob at the Black Hat Clinic

What is a Patient Entertainment System?

· Unified Digital Display Platform for...

· Entertainment (movies/tv/etc.)

· Telehealth/Video Chat · Screencasting · Education · Meal ordering

· Access patient records · Impact patients
experience

· Nurse call

· Custom applications

Increased stress · Loss of data security & privacy ·

What is a Patient Entertainment System?
· Unified Digital Display Platform for...
· Entertainment (movies/tv/etc.) · Telehealth/Video Chat · Screencasting · Education · Meal ordering · Nurse call · Custom applications

Loading Screencast Client w/ No Authentication

Burp: Unauthenticated Patient/Room Request

Burp: Unauthenticated Access to Patient/Room XML Data

Testing Patient Entertainment System PIN Code

Burp: Upgrading HTTP session to WebSockets

Burp: Client  Server WebSockets Message PIN

TTeesstitninggPPINatfieronmt ECnltiernttainmSeernvteSryWstebmSoPcINkeCtoDdaeta

Client side generated/validated PIN works

Patient Entertainment System Findings
· Unauthenticated access to API to retrieve patient/room/etc. data · Client side generated `PIN' code also validated on client!?
Lessons Learned: Client side validation is not secure
Results: Screencast to any active device Patient Record: >500

What is Clinical Productivity Software?

· Administrative system to capture procedure notes for...

· Accuracy of reporting

· Coding

· Instructions

· Follow up workflow

· Improve EMR documentation · Auditing capabilities · Quality patient outcomes

· Access patient records · Modify critical data

· Reduce communication confusion

· Etc.

Higher costs for care · Incorrect or missing diagnosis · Loss of data security and privacy ·

What is Clinical Productivity Software?
· Administrative system to capture procedure notes for...
· Accuracy of reporting · Coding · Instructions · Follow up workflow · Improve EMR documentation · Auditing capabilities · Quality patient outcomes · Reduce communication confusion · Etc.

Decrypting Client Side Data

· dnSpy - .NET debugger and assembly editor

· Encrypt(ion) · Decrypt(ion) · Password · Backdoor · Authenticate · Hash · Secret · Seed

· PasswordUpdate · PasswordChange · Login · Failed · Username · Validate · Credential

Clinical Productivity System Findings
· Backdoor account (database and time based) · Default Credentials (database and local account) · Exposed credentials (xml, config file and service account) · Client side authentication/decryption code
· pusers.xml data/service account/database credentials
· Authentication response injection · Unauthenticated web services · Unauthenticated SQL `injection' · Password replay from unauthenticated API data
Lesson Learned: Client side code exposes secrets Results: Full application and server compromise  Patient Records: > 100,000

What is a Drug Dispensary?
· Centralized medicine management · Automated dispensing · Secure and safe storage of drugs · Tracking and auditing of narcotics · Inventory and diversion visibility

What is a Drug Dispensary?

· Centralized medicine management

· Automated dispensing

· Secure and safe storage of drugs

· Tracking and auditing of narcotics

· Inventory and diversion visibility

· Modify drug information · Access patient records · Steal drugs

Drug mis/overdose · Drug underdose (theft) · Loss of data security and privacy ·

What is a Drug Dispensary?
· Centralized medicine management · Automated dispensing · Secure and safe storage of drugs · Tracking and auditing of narcotics · Inventory and diversion visibility

Authenticated Users and Configuration Files

SQL Account Decryption
· Find the decryption code in DLL · Specify the DLL as a reference and access functions in the DLL · Call DecryptSqlCredentials function with parameters · Decrypt SQL credentials (default vendor password)

SQL sa Account Decryption

UA* Account Decryption
· Find the decryption code in an EXE · Copy/Paste required functions · Find hardcoded encryption key
· Decrypt UA_ credentials
· LAD ­ Local administrator · LHU ­ Local hospitaluser · RAD/RHU - administrator

Database Access & Credential Decryption
· SQL access  Dump user credentials  User credential decryption · ~10 default vendor passwords

Drug Cabinet System Findings
· Authenticated users share · Configuration file with encrypted strings · SQL sa and Server Administrator account · Username/Database extract and decrypt · System administrator access
 Lessons Learned:
· Server side secrets are still a threat · Vendors use defaults between client installations
Results: Full application, cabinet and server compromise
Patient Records: >100,000

Risk Scoreboard
· Impact ­ Significant (Patient safety and data) · Exploitability ­ Fairly Easy to Moderate (Open share to RVE code) · Patient Records Exposed - > 80,000
· Lessons Learned:
· Server side secrets are a threat if exposed to a client · Vendors use defaults between client installations

Temperature Monitoring

· FDA regulated temperatures of food, drugs, blood, etc.
· Hospitals, Blood Banks, Pharmaceutical, Laboratories, Biotech, IVF Labs, Forensic Labs, US Military and various Government Facilities

· Delete/modify sensor data · Disable monitoring
Poisoning · Ineffective medication ·

Temperature Monitoring
· FDA regulated temperatures of food, drugs, blood, etc.
· Hospitals, Blood Banks, Pharmaceutical, Laboratories, Biotech, IVF Labs, Forensic Labs, US Military and various Government Facilities

00012- Auth code Alpha1 - Password Alpha1 - Username

00034- Change code Alpha3 ­ Old password Alpha1 - Username Alpha4 ­ New Password

00067 ­ Add/Update user Alpha1 - Name Alpha7 - password General User - Group Alpha1 - Username

00042 ­ Get Group Details General User ­ Group name

Alpha Client Commands
· 00012 ­ Authenticate 00012|~|Amega1|~|Amega1|~|1209.8 · 00034 ­ Change passwords 00034|~|Alpha1|~|Alpha1|~|Alpha2 · 00042 ­ Dump group account details 00042|~|General User · 00067 ­ Create an account/Change account details (incl password) 00067|~|General User|~||~|Alpha1|~|Alpha1|~|Alpha7|~|998833|~|0|~|False · 00060 ­ Get User Details 00060|~|Alpha1

Temperature Monitoring System Findings
· Unauthenticated commands between client and server · Exposed IoT authentication code · Privileged escalation on IoT
Lessons Learned: Client/Server communication isn't always secure. IoT security can be very lacking.
Results: Full application/IoT compromise Patient Records: 0

Nurse Calling System

· Establishes communication workflow:

· Mobile devices · RTLS · Whiteboards and iTVs · Consoles

· Coordination of communication

· Nurses · Care teams · Emergency response
· Track presence and response for live event monitoring

· Access patient data · Take over nurse calling · Locate patients/Nurses

· Reporting for staff awareness and process improvement

Nurse swatting · Loss of data privacy security ·

Nurse Calling System
· Establishes communication workflow:
· Mobile devices · RTLS · Whiteboards and iTVs · Consoles
· Coordination of communication
· Nurses · Care teams · Emergency response
· Track presence and response for live event monitoring
· Reporting for staff awareness and process improvement

Result

Integer

Success

0

InvalidUsername

1

InvalidUserOrBarcode 2

InvalidPassword

3

PasswordExpired

4

UserInactivated

5

UserLockedout

6

UserLoggedIn

7

InvalidRole

8

Unknown

9

Launching binary in debug mode

Breaking at VerifyStaffLogin

Monitoring the result return variable

Modifying the result return value to `0'

Hardcoding the result return value

Hardcoding the result return value to `return 0'

Saving a patched version of the client

Opening the modified client with any password

Administrator interface of Nurse Call system

Call feature of Nurse Call system

Server side administrator portal

Hardcoded backdoors

Administrator interface of Nurse Call system

Nurse Call System Findings
· Numerous hardcoded server side credentials · Client side configuration database credentials
exposed · Client side authentication logic patchable · Server side hardcoded credentials in admin
portal
 Lessons Learned: .NET client side binaries can be debugged and patched to bypass authentication validation. Results: Full application compromise Patient Records: > 500

Clinical Imaging System

· Radiology reading of MRI (Magnetic resonance images) scans
· Assist in standards based, sophisticated analysis of images
· Automatic interpretation of data for lesion location and scoring
· Provides platform for tracking of lesions over time
· Audit and documentation integration

· Access patient data · Modify patient data · Delete patient data

Inaccurate diagnosis · Loss of data privacy security ·

Clinical Imaging System
· Radiology reading of MRI (Magnetic resonance images) scans
· Assist in standards based, sophisticated analysis of images
· Automatic interpretation of data for lesion location and scoring
· Provides platform for tracking of lesions over time
· Audit and documentation integration

IDA Review Process
· Look for interesting Authentication Hooks
· Password · Authentication · Login · Hash
· Functions of Interest
· InkrementAndCheckLoginAttempts · PasswordMatchesHash · PasswordValidator

PasswordMatchesHash PasswordIsValid

Patching the Binary

Function Usage (True condition) Usage (False condition) Password Check (current) Password Check (new) Opcode

JZ (Jump Zero)

JNZ (Jump Not Zero)

Jump if ZF 0

Jump if ZF not 0

If Alice == Bob, do not jump.

If Alice == Bob, jump

If Alice <> Bob, jump.

If Alice <> Bob, do not jump

If passwords match (ZF=1), jump

If password doesn't match (ZF=0), jump

0x74

0x75

Old New
Old New

Administrator Tool Patched

Imaging System Findings
· DB and Service account exposed due to insecure design
· Server administrator access via shared account
· Client side authentication logic
Lessons Learned: Almost any binary can be patched
Results: Full application and server compromise
Patient Records: > 1000

EMR
Datacenter

Downtime Device Security
· Encrypted hard drive · Generic authentication required · Patient Reports are encrypted · Access to reports require username/password (HIPAA
Compliance) · Username/password hashes stored locally in encrypted file

Decrypt & Export EMR Credential Data

Crack the Hash

123 4

5

6

JSMITH$3$10000$256$Rpxg10G7aqU=$TF2n5UK4euqIHQERURxln+koxlNXpopd3Rb++c/0Qqg=...

1 ­ Username 2 ­ Hash version (PBKDF2) 3 ­ Iterations 4 ­ SHA version 5 ­ Salt 6 ­ Password Hash

Note: Passwords are sniffed during authentication process Note: Passwords are UPPER cased

Cracking Downtime Device Hashes

Generic User Space

Service System Space

Report Decryption DLL User Table Decryption DLL Report/User Download DLL

Downtime Device Exe's

Privileged Escalation
Patching binary to run batch file as `system' user

Downtime Device Key Extract
· Each Downtime device syncs to a central server · Sync is protected by an encryption key · Encryption key is the same for all clients associated to that server · Encryption key is stored encrypted in the registry with the
ProtectedData Class
· Can we extract a decrypted key from a client? · Can we leverage that key to access reports from other servers?

Extracting downtime site key from device

Inserting stolen key into spoofed downtime device

Downtime Device Findings
· Patch binary to bypass authentication · Patch binary to extract user/password hash table · Patch binary to extra organizations downtime system key · Privileged escalation to administrator
Lessons Learned: Client side code is hard to secure Results: Downtime data and system compromise Patient Records: >13000

Findings Summary

System

Exploitation Method

Patient Entertainment

Burp/Web Scanning

Clinical Documentation

Burp/client binary reverse engineering

Drug Management System Temperature Monitoring

Binary reverse engineering/server access/database access
Wireshark monitoring/IoT

Nurse Call PACs

Server binary reverse engineering/client side debug and patching
Client side debug and patch (IDA)

Downtime system

Reverse engineer client/patch/debug

Issue Highlighted
Client side/validated PIN
Client side backdoor code
Proprietary algorithm used to encrypt secrets  Decrypt exposed encrypted credentials Insecure protocol design  Direct TCP client access to server (no auth) Client side authentication logic  Patchable .NET binary Client side authentication logic  Patchable C++ binary Client side authentication and insecure design  Patchable binary in .NET & LPE

Findings Summary
Records: 225,000 Dark Web: $2,250,000 - $225,000,000 Penalties: ?

Red Flag Indicators
· Default credentials · Plaintext credentials · Lack of hashed credentials in database · Exposed `secrets' via client side file review · Client/Server protocol design errors · OWASP 101 including APIs · Client side binary review issues (e.g. "backdoor", decrypt, keys, etc.) · Client side authentication (e.g. debug/patchable authentication) · Gut instinct

What are we doing at Penn Med?
· `Lite' pentests on all new products · Team based `Penn' Test Practices (CSO50 2020) · Strategic security application testing goals · Advanced Certification and Training Program · H-ISAC vulnerability notifications

Where to from here?
· Healthcare security members ­ we need to collaborate on these issues and share a lot more.
· Security community ­ healthcare needs your help raising awareness. On the next Pentest, recommend a review of an application in addition to the goal of Domain Admin.
· Healthcare application vendors ­ please don't make our jobs harder.

Thanks to Penn Medicine Security Team and Black Hat for making this possible!
"No Vendors Were Harmed"

