SESSION ID: HTA-F01
To Swipe or Not to Swipe: A Challenge for Your Fingers

Yulong Zhang
Senior Software Research Engineer FireEye Labs

Tao Wei
Senior Manager, Advanced Research FireEye Labs

#RSAC

#RSAC
Functionalities Using Fingerprints
 Authentication
 System screen unlock  Login in FIDO alliances' services
 Authorization
 iTunes/App store pay  Apple Pay  Transaction authorization using FIDO
2

#RSAC
Risk: Fingerprints Never Expire
 Password leaked? Fine, you can easily replace it with a new one.  Fingerprint leaked? Well, it is leaked for the rest of your life.  Moreover, it is associated with your identity record, immigration
history, etc.
3

#RSAC
Existing Optical Attacks
 Fingerprints can be stolen from its owner if a person touched any object with a polished surface like glass or a smartphone screen.
 Fingerprints can even be extracted from a waving hands photo.  Attackers can spoof fingerprints accordingly using electrically
conductive materials.
Figures from C. Shoude et al. Fingerprint Spoof Detection By NIR Optical Analysis. July 2011.

#RSAC
System Attacks against Fingerprints?!
This talk will show attacks on Android devices:
 Confused Authorization Attack  Bypass pay authorizations protected by fingerprints
 Fingerprint DB Manipulating  Fingerprint Sensor Spying Attack
 Collect fingerprints through malware
5

#RSAC
Outline
 Design of Android Fingerprint Frameworks
 Fingerprint Recognition  Mobile Fingerprint Frameworks
 System Attacks against Fingerprints
 Confused Authorization Attack  Fingerprint DB Manipulating  Fingerprint Sensor Spying Attack
 Takeaways
6

#RSAC
Outline
 Design of Android Fingerprint Frameworks
 Fingerprint Recognition  Mobile Fingerprint Frameworks
 System Attacks against Fingerprints
 Confused Authorization Attack  Fingerprint DB Manipulating  Fingerprint Sensor Spying Attack
 Takeaways
7

#RSAC
Fingerprint Recognition

#RSAC
Fingerprint Recognition: Minutiae Extraction

Grayscale Image

Phase Image

Skeleton Image

Minutiae

Figures from J. Feng and A. Jain, Fingerprint Reconstruction: From Minutiae to Phase IEEE TRANSACTIONS ON PATTERN ANALYSIS AND MACHINE INTELLIGENCE, VOL. 33, NO. 2, FEBRUARY 2011

#RSAC
Fingerprint Recognition: Minutiae Matching

Mobile Fingerprint

#RSAC

Frameworks

#RSAC
Fingerprint Framework without TrustZone

Java

App

Fingerprint Service

Native User Space

Native Fingerprint Libraries

Encrypted Fingerprint (Feature) DB

Kernel Space

Fingerprint Sensor Driver

Hardware
12

Threat: Rooting Attacks

Java

App

Fingerprint Service

Native User Space

Native Fingerprint Libraries

Kernel Space

Fingerprint Sensor Driver

Hardware
13

#RSAC
Encrypted Fingerprint (Feature) DB
Attackers can steal your fingerprints
either from memory or from storage!

How to Defend against Rooting Attacks?

#RSAC

TrustZone

 Separate the system to the Normal World, and the Secure World

 Contain potential compromises in the Normal World

Physical Isolation

Normal World
Normal World User Mode

TrustZone (Secure World)
Secure World User Mode

SMC
Normal World Kernel Mode

Monitor

Secure World Kernel Mode

Normal Memory

World Shared Memory (WSM)

Secure Memory

14

#RSAC
Fingerprint Framework with TrustZone

Java App

Intermediate Service

Fingerprint Service

Fingerprint (Feature) DB

Native

Native

Fingerprint

User Space Libraries

TrustZone Daemon

Fingerprint Trustlet

SPI Driver

Kernel Space

TrustZone Driver

Monitor

TrustZone Microkernel

Hardware
15

#RSAC
Rooting Attackers Cannot Access Fingerprints in TrustZone

Java App

Intermediate Service

Fingerprint Service

Native User Space

Native Oops... Fingerprint
Libraries

TrustZone Daemon

Fingerprint (Feature) DB

Fingerprint Trustlet

SPI Driver

Kernel Space

TrustZone Driver

Monitor

TrustZone Microkernel

Hardware
16

Fingerprint Authorization Framework with TrustZone

App

Fingerprint Service

TrustZone Daemon User Space

Encrypted Fingerprint (Feature) DB

Secure Key Store
Fingerprint Trustlet

#RSAC
SPI Driver

Kernel Space

TrustZone Driver

Monitor

TrustZone Microkernel

Hardware
17

#RSAC
FIDO Alliance
18

#RSAC
Outline
 Design of Android Fingerprint Frameworks
 Fingerprint Recognition  Mobile Fingerprint Frameworks
 System Attacks against Fingerprints
 Confused Authorization Attack  Fingerprint DB Manipulating  Fingerprint Sensor Spying Attack
 Takeaways
19

Confused Authorization

#RSAC

Attack

#RSAC
Confused Authorization Attack

Authentication
 Who you are (Passport)

Authorization
 What you can do (Visa)

Figures from Wikipedia

#RSAC
Authenticating
Figures from fcssllc.com
22

#RSAC
Authorizing
Figures from dailytech.com
23

#RSAC
Authorizing: Context!
Figures from dailytech.com
24

#RSAC
To Swipe or Not To Swipe, without A Context?
Figures from dailytech.com
25

#RSAC
What are your fingerprints?
OR
26

#RSAC
Confused Authorization Attack
 Do you ever have a second thought when you swipe to unlock the device?
It can enable background attacker to steal your money from your PayPal account!!!

Confused

#RSAC

Authorization

Attack

28

#RSAC
Confused Authorization Attack
 Question
How can I testify what's happening behind the finger swiping?
You can't tell...
What's the difference of swiping to unlock the device with swiping to authorize a transaction?
You can't tell...
29

#RSAC
Confused Authorization Attack
 Applications often mistakenly treat authorization as authentication, and fail to provide context proofs for authorization.
 Without proper context proof, the attacker can mislead the victim to authorize a malicious transaction by disguising it as an authentication or another transaction.

#RSAC
Protections
 Long term: unlike authentication, authorization needs trusted contexts
 The modules in TrustZone (trustlets) should provide such supports  The current FIDO framework doesn't support it yet.
 Short term:
 Upgrade your system to the latest version to fix all the known vulnerabilities.
 Only install popular apps from Google Play on your phone with fingerprint sensors
31

#RSAC
Fingerprint DB Manipulating

#RSAC
Fingerprint Settings
 How can you attest that only 3 fingerprints were registered?

Fingerprint Framework

App

Fingerprint Service

TrustZone Daemon User Space

Encrypted Fingerprint (Feature) DB

Kernel Space

TrustZone Driver

#RSAC

Secure Key Store
Fingerprint Trustlet

SPI Driver

Monitor

TrustZone Microkernel

Hardware
34

Fingerprint DB Manipulating

App

Fingerprint Service

TrustZone Daemon User Space

Encrypted Fingerprint (Feature) DB

Kernel Space

TrustZone Driver

#RSAC

Secure Key Store
Fingerprint Trustlet

SPI Driver

Monitor

TrustZone Microkernel

Hardware
35

Fingerprint DB Manipulating

Fingerprint Service

Encrypted Fingerprint (Feature) DB

#RSAC
TrustZone

36

#RSAC
Fingerprint DB Manipulating
 TrustZone just scans a fingerprint and matches it against encrypted fingerprints fed from the normal world
 It knows nothing about the number of fingerprints stored by the normal world
 An attacker can tamper the normal world framework to stealthily pre-embed special fingerprint blob (maybe fake)
 So he/she can unlock the device or authorize other operations  Leave no explicit traces

Fingerprint Sensor Spying

#RSAC

Attack

Fingerprint Framework with TrustZone

App

Fingerprint Service

TrustZone Daemon User Space

Encrypted Fingerprint (Feature) DB

Secure Key Store
Fingerprint Trustlet

#RSAC
SPI Driver

Kernel Space

TrustZone Driver

Monitor

TrustZone Microkernel

Hardware
39

#RSAC
How about the isolation of fingerprint sensor devices?

App

Fingerprint Service

TrustZone Daemon User Space

Encrypted Fingerprint (Feature) DB

Secure Key Store
Fingerprint Trustlet

SPI Driver

Kernel Space

TrustZone Driver

Monitor

TrustZone Microkernel

Hardware

?

40

One Fingerprint Framework with TrustZone

App

Fingerprint Service

Encrypted Fingerprint (Feature) DB

Secure Key Store

User Space

TrustZone Daemon

Fingerprint Trustlet

#RSAC
SPI Driver

SPI Kernel Space Driver

TrustZone Driver

Monitor

TrustZone Microkernel

Hardware
41

Malware can read directly from the sensor

Malware

Encrypted Fingerprint (Feature) DB

Secure Key Store

User Space

TrustZone Daemon

Fingerprint Trustlet

#RSAC
SPI Driver

SPI Kernel Space Driver

TrustZone Driver

Monitor

TrustZone Microkernel

Hardware
42

#RSAC
Fingerprint Sensor Spying Attack
Demo!
 While it is a really big challenge to reverse-engineer all the fingerprint operations, we made it.
43

#RSAC
Protections
 Long term:
 Isolate fingerprint sensors securely
 Short term:
 Upgrade your system to the latest version to fix all the known vulnerabilities
 Only install popular apps from Google Play on your phone with fingerprint sensors
44

#RSAC
Conclusions

#RSAC
Key Takeaways
 Mobile devices with fingerprint sensors are more and more popular  But they still have severe security challenges, such as
 Confused Authorization Attacks  Rooted kernel in normal world  TrustZone security flaws
 Such security flaws can lead fingerprint leakages  Industry should pay more attention to audit existing design and
implementations of fingerprint frameworks
46

#RSAC
Recommendations I
 Stick to mobile device vendors with timely patching/upgrading to the latest version (e.g. Android Lollipop), and always keep your device up to date
 Always install popular apps from reliable sources  Enterprise/government users should seek for professional services
to get protections against advanced targeted attacks
47

#RSAC
Recommendations II
 Mobile device vendors should improve the security design of the fingerprint auth framework
 Improved recognition algorithm against fake fingerprint attacks  Better protection of both fingerprint data and the devices  Differentiating authorization with authentication
 The existing fingerprint auth standard should be further improved to provide more detailed and secured guidelines for developers to follow
 Given a security standard, vendors still need professional security vetting/audits to enforce secure implementations
48

Q & A
#RSAC
Yulong Zhang, Zhaofeng Chen, Hui Xue, Tao Wei FireEye Inc.
49

