SESSION ID: MBS-R04
Mobile CA State of the Union
#RSAC

Andrew Blaich
Lead Security Analyst Bluebox Security @ablaich
Jeff Forristal
CTO Bluebox Security @j4istal

#RSAC
Objectives
What are CAs and how do they secure your communications? How can CAs be classified? What are the top apps doing to verify trust? How can you apply what you've learned?
2

#RSAC
What is a CA?
Certificate Authorities are the providers of trust for our communications over the Internet.
The Internet's security is built on top of trusted secure transactions CAs provide assurance of the identity of a web server (trust chain) Self-signed certs do not provide this assurance
3

#RSAC
What is the trust chain?

#RSAC
Trusted Certificate Chain
Verified == Trusted Chain The root CA to verify this chain is installed on the device, thus making the chain verifiable and trusted.
5

#RSAC
Site Verification - Success

Trust Store CA-A

Are you Google.com?
Yes, CA-A says I am. TRUSTED CONNECTION

Google

6

#RSAC
Un-trusted Certificate Chain
Un-verified == Un-Trusted Chain
The root CA to verify this chain is missing from the device making the trust chain un-verifiable.
7

#RSAC
Site Verification - Failure

Trust Store CA-A

Are you Google.com?

"Google"

Yes, CA-M says I am.

NOT A TRUSTED CONNECTION

8

#RSAC
Un-trusted Certificate Chain
9

#RSAC
Certificate Authorities on mobile

#RSAC
How many root certs?

OS (2015) Android 5.* iOS 8.* - iOS 8.* Trusted - iOS 8.* Always Ask - iOS 8.* Blocked

Cert Count 162 223 210 13 17

OS (2016) as of January 8, 2016 Android 6.*
iOS 9.*
- iOS 9.* Trusted
- iOS 9.* Always Ask
- iOS 9.* Blocked

Cert Count 158 200 187 13 18

11

#RSAC
OS Version Distribution

iOS Versions
6% 17%
77%
iOS 9 iOS 8 Earlier

Android Versions
2.50% 2.80% 1.20%

23.90%

34.10%

35.50%

Android 6 Android 4.4.* Android 4.0.*

Android 5.* Android 4.1.* - 4.3.* Android 2

12

#RSAC
Root Cert Changes ­ Long Tail
"...it will likely take years to reduce the number of users and devices at risk from certificates issued by Symantec from this root..." - Ryan Sleevi
13

#RSAC
Root Cert Changes - OEMs
BlackBerry Priv (Android)
17 Supplemental Certificates: att_suplcert1_v0.der
SHA-1 Hash: A1:DB:63:93:91:6F:17:E4:18: 55:09:40:04:15:C7:02:40:B0: AE:6B
14

#RSAC
Root Cert Changes - Let's Encrypt
How does your browser or device already trust Let's Encrypt? ISRG Root X1 is not yet trusted in most browsers (or devices), e.g.
https://bugzilla.mozilla.org/show_bug.cgi?id=1204656 https://code.google.com/p/chromium/issues/detail?id=53 https://code.google.com/p/android/issues/detail?id=1863 121672
Source: https://letsencrypt.org/certificates/
15

#RSAC
SHA-1 Deprecation
Community Controversy Among the mobile platforms, Android added SHA256 support in version 2.3. Earlier versions--still used in large numbers-- support only SHA1.
Firefox 43 does not validate against new SHA-1 CAs from 1/1/2016 or after (reverted)
When will mobile apps enforce the deprecation of SHA-1?
16

#RSAC
Microsoft Trusted Roots Removal

Original

Updated

Source: http://social.technet.microsoft.com/wiki/contents/articles/31680.microsoft-trusted-root-certificate-program-updates.aspx
17

#RSAC
CA Classifications

#RSAC
CA Classifications
Known Failures in Keeping Trust Government-Based Roots of Trust Cause for Concern Artificial Constraints Everything else
19

#RSAC
Known Failures with CAs
Highlights in failures of trust:
Symantec [2015] CNNIC/MCS Holdings [2015] Comodo [2011] DigiNotar [2011] GlobalSign [2011] India CCA [2014] RapidSSL (indirect) [2008]
20

#RSAC
Artificial Constraints

Cert Subject

Reason For Constraint

CN=IGC/A,OU=DCSSI,O=PM/SGDN,L=Paris,S T=France,C=FR

Issued several un-authorized certificates for Google domains. TLD restrictions: .fr (France), .gp (Guadeloupe) , .gf (Guyane) , .mq (Martinique) , .re (Réunion) , .yt (Mayotte), .pm (Saint-Pierre et Miquelon) , .bl (Saint Barthélemy) , .mf (Saint Martin) , .wf (Wallis et Futuna) , .pf (Polynésie française) , .nc (Nouvelle Calédonie) , .tf (Terres australes et antarctiques françaises)]

21

#RSAC
Artificial Constraints ­cont'd.
22

#RSAC
CA Cryptography Analysis

#RSAC
Public Key-Size

Key Type/Size RSA / 1024 bit
RSA / 2048 bit RSA/ 4096 bit Elliptic Curve

2015 15

2016 5

Notable Entities
GTE CyberTrust, Equifax, VeriSign, ValiCert, Entrust

101

96

14

46

6

11

N/A
N/A
GeoTrust, VeriSign, COMODO, Thawte, Entrust, AffirmTrust

24

#RSAC
Hash Algorithm

Signature Algorithm md5WithRSAEncryption

2015 6

sha1WithRSAEncryption 115

sha256WithRSAEncryption 28

sha384WithRSAEncryption 1

ecdsa-with-SHA256

0

ecdsa-with-SHA384

6

2016 2
98 43 4 1 10
25

Notable Entities GTE CyberTrust (expires 2018), NetLock (expires 2019)
N/A N/A N/A GlobalSign GeoTrust, VeriSign, COMODO, Thawte, Entrust, AffirmTrust, ...

#RSAC
CA Consolidation

Symantec Owned Entity GeoTrust VeriSign TC Trust Center Thawte Equifax Total:

2015

2016

7
7
3
5
3
Symantec controls 24 of the total 156 certificates or ~15% ownership of the Android roots of trust

7
6
0
3
1
Symantec controls 17 of the total 158 certificates or ~11% ownership of the Android roots of trust

Source: https://bluebox.com/questioning-the-chain-of-trust-investigations-into-the-root-certificates-on-mobile-devices/ 26

#RSAC
Case Study: Mobile Apps and Trust

#RSAC
Mobile apps and trust
Who are the top Android apps trusting? Most apps trust the certificates on your device
Your browser may distrust the CNNIC root cert, but your mobile app may trust it Some apps even disable hostname verifications (trusting everything)
28

#RSAC
Top Android Apps

X509HostnameVerifier

% of Apps

ALLOW_ALL_HOSTNAME

35% (29% 1st party code; 86% 3rd party code)

e.g. Facebook, Baidu, Conviva, Comscore, Nielson,...

STRICT_HOSTNAME

30.31%

BROWSER_COMPATIBLE_HOSTNAME 19.29%

Other Features Custom Trust Store

Number of Apps 6.30% Average: 13 CAs; Min: 1 CA (8 apps); Max: 129 CAs (1 app)

29

#RSAC
Protecting Yourself

#RSAC
Protecting yourself
Beware of government controlled root CAs, example: Kazakhstan (December 2015)
User installed (at this time)
http://www.zdnet.com/article/kazakhstan-forces-its-citizens-into-installing-internet-backdoors/
https://bugzilla.mozilla.org/show_bug.cgi?id=1232689
31

#RSAC
Managing your Security
Traveling or worried about security?
Remove or disable any CAs that concern you (government, deprecated, or others) Test that the sites you need access to work with your restricted CA list
Be wary of installing iOS profiles, device admin apps, or 3rd party certificates Check your Security (Android) and Profile (iOS) settings Some organizations use these to manage your device (check with your IT department) Manage/disable root access when traveling (malware can exploit this)
Disable/remove apps you don't need (they're chatty and may be using insecure communications) Beware of free / un-secured WiFi
32

#RSAC
Managing your CAs
Android:
System Settings Settings -> Security -> Trusted credentials Disable or Enable each CA
Programmatically or via shell (requires root access)
iOS:
No manual method on iOS Programmatically or via shell
(requires root access)
33

#RSAC
Bluebox Trust Managers
https://bluebox.com/technical/trust-managers/
34

#RSAC
Apply
Executive / Management Team
Secure the apps and data your company and employees use Always use secure communications and apps; be aware of the trust chain
Developer
Apply browser strategies for root certs to your app Check, Validate, and enforce the expected chain of trust to your servers
Consumer
Review, disable, and remove certificates you don't trust Keep your trust store up to date
35

#RSAC
Summary
CAs provide the trust for the internet's security model CAs are known to have failures in trust Mobile operating systems vary with their support for the vast number of CAs Mobile apps should not rely on the device (or CAs) to be trustable Users can take action to reduce the amount of 3rd parties they trust. Protect yourself
36

#RSAC
Q&A
Contact us
Andrew Blaich Lead Security Analyst at Bluebox Security Twitter: @ablaich Email: andrew@bluebox.com
Jeff Forristal CTO at Bluebox Security Twitter: @j4istal Email: jeff@bluebox.com
37

#RSAC
References
https://bluebox.com/questioning-the-chain-of-trustinvestigations-into-the-root-certificates-on-mobile-devices/ https://bluebox.com/technical/trust-managers/
38

