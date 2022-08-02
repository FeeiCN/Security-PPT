SESSION ID: MBS-R03
Decrease Your Circle of Trust: An Investigation of PKI CAs on Mobile Devices

Andrew Blaich, PhD
Lead Security Analyst Bluebox Security @ablaich

#RSAC

#RSAC
Who are you trusting?
 How much trust do you put in your phone?
 How many vendors have modified your OS?  How many applications and services are running on your device?  How many libraries are loaded for an app?  How many roots of trust exist for network connections?

#RSAC
Who are you trusting?
 How much trust do you put in your phone?
 How many vendors have modified your OS?  Google -> Samsung -> Qualcomm -> AT&T -> Others?
 How many applications and services are running on your device?  300+ apps/services on a Samsung Galaxy Note 3
 How many libraries are loaded for an app?  100+ shared libraries on a Samsung Galaxy Note 3
 How many entities are trusted for network connections?  150 + on Android  200+ on iOS

Circle of Trust
OEMs

Carriers

Libs

Trust

Component Suppliers

Apps

CAs

#RSAC
Circle

#RSAC
Trustable by Bluebox
Example of a brand new out of the box device and all the entities that you would trust on it.

#RSAC
Same device, different carriers

#RSAC

Circle of Trust
OEMs

Carriers

Libs

Trust

Component Suppliers

Apps

CAs

#RSAC
Circle

Circle of Trust
OEMs

Carriers

Libs

Trust

Component Suppliers

Apps

CAs

#RSAC
Circle

#RSAC
Secure Connections

Apps

CAs Network

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
...

#RSAC

#RSAC

#RSAC
Not only browsers...

#RSAC
Certificate Authorities
 What certificate authorities are on my device?  How many are there?  Who are these certificate authorities?  How did they get on my device?  What security concerns are there?

#RSAC
Objectives
 Learn more about who your device is trusting  Learn about the roles CAs play in secure communications  Learn the history behind these CAs  Learn how you can take action to decrease your circle of trust

Background -

#RSAC

Certificate Authorities

#RSAC
Body
 What is a CA?  How do they get on the device?  How many are there?  User installable vs. system pre-loaded (also talk about carrier and
OEM additions or removals)  iOS VPN and Android VPN case study

#RSAC
Certificate Authorities
 What is a certificate authority?
 They validate that who you are talking to is who they say they are

Trusted CAs: CA-A

Are you Google.com?

Yes, CA-A says I am.

TRUSTED CONNECTION

Google

#RSAC
Certificate Authorities
 What is a certificate authority?
 They validate that who you are talking to is who they say they are

Trusted CAs: CA-A

Are you Google.com?

Yes, CA-M says I am.

NOT TRUSTED CONNECTION

Google

#RSAC
CA Chain of Trust
 What is the chain of trust?

Trusted Certificate Chain

#RSAC
Verified == Trusted Chain
The root CA to verify this chain is installed on the device making the trust chain verifiable and thus it is considered a trusted and secured connection.

#RSAC
Un-trusted Certificate Chain
Un-verified == Un-Trusted Chain
The root CA to verify this chain is missing from this device making the trust chain un-verifiable and thus not-trusted and in-secure.

#RSAC
Types of Root CAs
 Pre-installed root CAs  User-installed root CAs

#RSAC
Why is this a concern?
 A malicious or compromised root CA can read your secure traffic
 CNNIC and MCS Holdings  Lenovo and Superfish ...

#RSAC
Pre-installed Root CAs

#RSAC
Root CA Approval Process
Root Certificate Programs

Mozilla

Microsoft

Apple

others

#RSAC
Mozilla Root CA Approval Process
Linux and Android are strongly tied to the Mozilla process.

#RSAC
CA Trust Infrastructure

 The effectiveness of the global PKI trust infrastructure relies on

keeping the designated roots of trust fully secure and operating

correctly.

Trusted Root CAs

CA -A

CA -B Compromised CA

Issue cert for *.google.com

No. Ok.

Issue cert for *.google.com

#RSAC
CAs on Mobile Devices

5.1

162 System

Installed

8.3

227 Certificates

#RSAC
Root CA Reference Links
 iOS:
 http://support.apple.com/en-us/HT204132  Trusted  Always Ask  Blocked
 Android:
 https://android.googlesource.com/platform/libcore/+/master/luni/src/ma in/files/cacerts/

#RSAC
CA Classifications
 Known Failures in Keeping Trust  Government-Based Roots of Trust  Cause for Concern  Artificial Constraints  Everything else

#RSAC
Known Failures

#RSAC
Known Failures with CAs
 "Hacked" CAs:
 CNNIC/MCS Holdings [2015]  Comodo [2011]  DigiNotar [2011]  GlobalSign [2011]  India CCA [2014]  RapidSSL (indirect) [2008]

#RSAC
Apple's Blocked CA List

CA Name TurkTrust
Entrust GTE CyberTrust Solutions DigiNotar Entrust Entrust

Reasons
Issued an inappropriate sub-CA cert that was used to issue a *.google.com cert
Issued a wildcard cert for Apple domains
Issued 4 sub-CA certs for DigiNotar
Issued itself another sub-CA cert
Issued 2 sub-CA certs for DigiNotar
Issued a sub-CA cert for Digicert Sdb. Bhd (practices of this CA in Malaysia were found to be inappropriate)

#RSAC
Apple's Blocked CA List ­ cont'd.

CA Name GTE Trustwave Xramp TurkTrust

Reasons Issued a sub-CA cert for Digicert Sdb. Bhd Issued a sub-CA cert to Micros Systems Issued a sub-CA cert to Trustwave Issued a sub-CA cert to KKTC Merkez Bankasi

#RSAC
Government CAs

#RSAC
Government Related CAs
Allowed to use an internal audit for
approval.

#RSAC
Causes for Concern - CAs

#RSAC
Causes for Concern

#RSAC
Causes for Concern ­ cont'd.

#RSAC
Causes for Concern ­ cont'd.

#RSAC
Artificial Constraints

#RSAC
Artificial Constraints

Cert Subject
CN=IGC/A,OU=DCSSI,O=PM/SGDN,L=Paris ,ST=France,C=FR

Reason For Constraint
Issued several un-authorized certificates for Google domains. TLD restrictions: .fr (France), .gp (Guadeloupe) , .gf (Guyane) , .mq (Martinique) , .re (Réunion) , .yt (Mayotte), .pm (Saint-Pierre et Miquelon) , .bl (Saint Barthélemy) , .mf (Saint Martin) , .wf (Wallis et Futuna) , .pf (Polynésie française) , .nc (Nouvelle Calédonie) , .tf (Terres australes et antarctiques françaises)]

#RSAC
Artificial Constraints ­cont'd.

#RSAC
Artificial Constraints ­cont'd.
?

#RSAC
Apple's Extended Trust

Type
US Federal Certificates

Count
5

Present on iOS, but requested 3 for removal on Mozilla/Android
Other Entities added by Apple 15

Notes
4 are not on Android 1 is under review by Mozilla
2 deprecated from AOL/Time Warner 1 deprecated from Danish IT
5 from Apple 3 from Denmark 2 from Swiss Government 2 from Belgium 1 from Cisco 1 from Czech Republic 1 from Canada

#RSAC
CA Cryptography Analysis

Public Key-Size

Key Type/Size Elliptic Curve

Count 6

RSA / 1024 bit

15

RSA / 2048 bit

101

RSA/ 4096 bit

14

#RSAC
Notable Entities GeoTrust, VeriSign, COMODO, Thawte, Entrust, AffirmTrust FNMT, GTE CyberTrust, Equifax, Netlock Halozatbiztonsagi, VeriSign, ValiCert, Thawte Consulting, Entrust N/A N/A

Hash Algorithm

Signature Algorithm ecdsa-with-SHA384

Count 6

md5WithRSAEncryption 6 sha1WithRSAEncryption 115 sha256WithRSAEncryption 28 sha384WithRSAEncryption 1

#RSAC
Notable Entities GeoTrust, VeriSign, COMODO, Thawte, Entrust, AffirmTrust GTE, Netlock, Equifax N/A N/A N/A

CA Consolidation
Symantec Owned Entity
GeoTrust Verisign TC Trust Center Network Solutions Thawte Equifax Total:

#RSAC
Number of Certificates on Android 7 7 3 1 5 3 Symantec controls 25 of the total 156 certificates or ~16% ownership of the Android roots of trust

#RSAC
CA Consolidation ­ cont'd.

#RSAC
CA Consolidation ­ cont'd.

#RSAC
Additional CAs
 Some OEMs and carriers add additional certificates into the ROM that are not found in AOSP:
 Sony Xperia running 4.4.4 includes two root certs for Sony
 iOS has several additional certificates that Android does not currently* have e.g.: Cisco and US Government

#RSAC
User-installed Root CAs

#RSAC
User installed root CAs

#RSAC
VPN Case-Study

#RSAC
VPN, Anonymization, Privacy Providers
 Looked at 10 of the top VPN Service Provider services in the Apple App Store and the Google Play Store:
 iOS ­ App Store  6 out of 10 of the iOS Apps used an MDM VPN Profile that DID install a 3rd party certificate
 Android ­Google Play Store  10 out of 10 of the Play Store apps did not install a 3rd party certificate

#RSAC
Decreasing your Trust Circle
 Android:
 Manually  Settings -> Security -> Trusted credentials  Disable or Enable each CA
 iOS:
 No direct method on iOS...

#RSAC
Bluebox Trust Managers
https://bluebox.com/technical/trust-managers/

#RSAC
Summary
 Learn more about who your device is trusting
 iOS and Android have an increasing amount of roots of trust
 Learn about the roles CAs play in secure communications
 Without a CA we cannot verify that who we are talking to is legitimate
 Learn the history behind these CAs
 Sometimes things go wrong with CAs
 Learn how you can take action to decrease your circle of trust
 Manual certificate management  Bluebox Trust Manager for iOS and Android

#RSAC
Apply
 Learn more about what your device is trusting:
 Trustable by Bluebox  (https://play.google.com/store/apps/details?id=com.bluebox.trust)
 View the root CAs on your device:
 Android System Settings  Bluebox Trust Manager (Android and iOS)
 Manage the root CAs on your device (root/jailbreak) required:
 Android System Settings  Bluebox Trust Manager (Android and iOS)

#RSAC
Q & A

