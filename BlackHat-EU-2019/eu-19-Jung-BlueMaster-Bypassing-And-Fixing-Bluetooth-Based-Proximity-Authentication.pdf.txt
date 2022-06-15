BlueMaster: Bypassing and Fixing Bluetooth-based Proximity Authentication

Youngman Jung and Junbum Shin Samsung Electronics

Yeongjin Jang Oregon State University

Any opinions, findings, conclusions or recommendations expressed in this material are those of the authors and do not necessarily reflect
the views of Samsung Electronics and Oregon State University.

AGENDA

· Bluetooth-based Proximity Authentication · Preliminaries · Security Analysis - Prposed Approach · New Vulnerabilities · Mitigations · Conclusion

AGENDA

· Bluetooth-based Proximity Authentication · Preliminaries · Security Analysis ­ Proposed Approach · New Vulnerabilities · Mitigations · Conclusion

· Types of Authentication
· Having a securely paired Bluetooth device may serve as a proof of something you have · + Proximity Check: done by measuring the signal strength (RSSI) of the established Bluetooth connection
· Works within distance <100m
· Usage
· Android Smart Lock · Windows Dynamic Lock

· Types of Authentication
Use Bluetooth devices as Trusted Devices
· Having a securely paired Bluetooth device may serve as a proof of something you have · + Proximity Check: done by measuring the signal strength (RSSI) of the established Bluetooth connection
· Works within distance <100m
· Usage
· Android Smart Lock · Windows Dynamic Lock

· What is Android Smart Lock?
· A convenient main-screen unlock feature · Skip user authentication (passcode/fingerprint/face-recognition) if
any of pre-registered, trusted device is connected via Bluetooth (Proximity < 100m)

· When is it introduced?
· 2014 by Google, starting from Android 5.0 Lollipop

· How to use this?
· Pair and register a device as Trusted Device

Connection Established

DO NOT ASK PASSCODE

· What is Android Smart Lock?

· A convenient main-screen unlock feature

Usage - Android Smart Lock:

· Skip user authentication (passcode/fingerprint/facTeo-rreecpoglanciteioun)siefr authentication (e.g., passcode/fingerprint/face-unlock)
any of pre-registered, trusted device is connected via Bluetooth (Proximity < 100m)

· When is it introduced?
· 2014 by Google, starting from Android 5.0 Lollipop

· How to use this?
· Pair and register a device as Trusted Device

Connection Established

DO NOT ASK PASSCODE

· What is Windows Dynamic Lock?
· Automatically locks your PC when you goes out of range (e.g., having a restroom break at work) · Actually, Windows 10 measures distance between your smartphone and PC · By measuring the signal strength (RSSI) of the Bluetooth connection between two
· When is it introduced?
· 2017 by Microsoft (Windows 10, 1703)
· How users are using this?
· Pair and register a smartphone as a trusted device

· What is Windows Dynamic Lock?
· Automatically locks your PC when you goes out of range (e.g., having a restroom break at work) · Actually, Windows 10 measures distance between your smartphone and PC · By measuring the signal strength (RSSI) of the Bluetooth connection between two
· When is it introduced?
· 2017 by Microsoft (Windows 10, 1703)
· How users are using this?
· Pair and register a smartphone as a trusted device

· What is Windows Dynamic Lock?
· Automatically locks your PC when you goes out of range (e.g., having a restroom break at work) · Actually, Windows 10 measures distance between your smartphone and PC · By measuring the signal strength (RSSI) of the Bluetooth connection between two

· When is it introduced?
· 2017 by Microsoft (Windows 10, 1703)
· How users are using this?
· Pair and register a smartphone as a trusted device

If your smartphone moves away from your PC e.g., RSSI < -10db, then it will lock the PC dynamically

· What is Windows Dynamic Lock?
· Automatically locks your PC when you goes out ofUrasnaggee(e­.gW., hinavdiwngoasrDesytnroaommicbrLeoakckat:work) · Actually, Windows 10 measures distance betweenTyoouprrosmviadretpahonnaedadnidtiPoCnal security Layer to
the Lock screen
· By measuring the signal strength (RSSI) of the Bluetooth connection between two

· When is it introduced?
· 2017 by Microsoft (Windows 10, 1703)
· How users are using this?
· Pair and register a smartphone as a trusted device

If your smartphone moves away from your PC e.g., RSSI < -10db, then it will lock the PC dynamically

For Secure Bluetooth-based Proximity Authentication, We need answers to the following questions:
1. How can we utilize Bluetooth for Authentication? 2. How can we utilize Bluetooth for Proximity Checking?

Is there a Bluetooth Security Specification for à Communication Security

YES! Is there a Bluetooth Security Specification for
à Communication Security

Is there a Bluetooth Security Specification for à Proximity Authentication?

Is there a Bluetooth Security Specification for à Proximity Authentication?

NO!

Martin Hurfurt (`2015)

- Shows insecurity for Smart Lock using Trusted Device

because it uses a service not protected by Bluetooth Security

Beccaro and Collula (`2015)

- Same problems occur in 3rd party apps

Fixed by Google (`2015. 4)

Is it secure?

- Since Android 5.1 (Changelog (Line 8883))

AGENDA

· Bluetooth-based Proximity Authentication · Preliminaries
· Bluetooth Security 101 · Proximity Authentication vs. Bluetooth Security · Security Analysis ­ Our Approach · New Vulnerabilities · Mitigations · Conclusion

· Security Components (Security Mode 4) of Bluetooth BR/EDR*
* Bluetooth BR/EDR: for handling a lot of data, Bluetooth LE: for less power consumption

For a new device Pairing
(Link Key)
Pairing and Link Key Generation Authentication Confidentiality Service Security Levels (Service Level 4)

Re-connecting via Bluetooth (all except SDP*)

Authentication (Devide Authenticaiton)

Encryption (Service Data Protection)

* SDP: Service Discovery Protocol ß Not protected by Bluetooth Security

Secure?

Note

Yes

Secure Simple Pairing ­ Secure against MITM attack

(Elliptic Curve Diffie-Hellman public key cryptography, P-256)

Yes

Secure Authentication (Mutual Authentication using a link key)

Yes

AES CCM Encryption

Yes except SDP

Service Level 4 - Requires MITM protection and encryption using 128-bit equivalent strength for link and encryption keys

Bluetooth BR/EDR Architecture

APPLICATION

HOST

SDP

RFCOMM

... TCS-BIN

L2CAP

Host Controller Interface (HCI)

Link Manager

CONTROLLER

Baseband Resource Manager

Link Controller

BR/EDR Radio (PHY)

· SDP allows devices to discover what services each other support, and what parameters to use to connect to them.
· RFCOMM provides a simple reliable data stream to the user. · Many Bluetooth applications use RFCOMM because of its widespread support and publicly available API on most operating systems
· TCS (Telephony Control Protocol) and others

Insecure Secure

· Techniques to measure device proximity via Bluetooth
· Bluetooth Connection (~ 100 m) ­ Android Smart Lock, Windows Dynamic Lock

Type Class 1 Class 1.5 Class 2 Class 3

Operating Range ~100m ~30 m ~ 10 m ~ 1m

100 meters

· Signal Strength (RSSI) ­ Windows Dynamic Lock

RSSI

· RSSI is commonly used technique

to measure the distance between two devices

Free-space Path Loss

Distance

For a secure Bluetooth-based proximity authentication, We need to answer the following questions:
1. How can we use Bluetooth for Authentication securely? 2. How can we use Bluetooth for Proximity Checking securely?

Problem 1: How can we securely authenticate a trusted device via Bluetooth?

· MAC Address: AA:BB:CC:DD:EE:FF · Class of Device: Smart Watch · Device Name: JUNG's Watch ...

Connection

RSSI: -8 .. RSSI: -10..

Problem 2: How can we securely measure

RSSI: -12 .. the distance between two devices?

Bluetooth Components/Features used in Smart Lock/Dynamic Lock

Properties
MAC Address (Device Address)
Class of Device RSSI
Link Establishment Insecure Connection (SDP) (A Connection in Security Mode 4 - Level 0)
Secure Connection (e.g RFCOMM) (A connection in Security Mode 4 - Level 4)

Smart Lock
 X X X 


A Message over RFCOMM

X

Dynamic Lock
    

X

Bluetooth Components/Features used in Smart Lock/Dynamic Lock

Properties
MAC Address (Device Address)
Class of Device RSSI
Link Establishment Insecure Connection (SDP) (A Connection in Security Mode 4 - Level 0)
Secure Connection (e.g RFCOMM) (A connection in Security Mode 4 - Level 4)

Smart Lock
 X X X 


A Message over RFCOMM

X

Dynamic Lock
 Insecure  Insecure  Insecure  Insecure  Insecure
 Secure

X

Secure

Device Address (MAC Address)
· Devices can be identified using a device address (48 bits in length) àBe exposed in communication by definition, and can easily be manipulated (no security at all) à An attacker can easily spoof MAC address
# bdaddr ­i hci0 xx:xx:xx:xx:xx:xx
Class of Device (COD)
· A value representing the type of device (e.g. Headphone: Connected for calls and audio) · Informational purpose in the device discovery phase
à CoD is checked via an insecure connection SDP (No Security), and can easily be spoofed by attackers
Received Signal Strength Indicator (RSSI)
àIf RSSI is measured for an insecure connection, then the value itself is insecure, too

Security: Link Establishment, Insecure Connection, Secure Connection, and message over RFCOMM

StandBy

Connection Starts

Search for nearby devices

Establish connection

Inquiry

Request connection to specific device

Request connection to discovered device
Page

Link Establishment

Connection

Secure

RFCOMM, TCS
Determine whether it is secured according to targeted protocol

Secure Connection

SDP
Insecure
Connection

Properties
MAC Address (Device Address) Class of Device
RSSI
Link Establishment
Insecure Connection (SDP)
Secure Connection (e.g RFCOMM)
A Message over RFCOMM

Smart Lock
 X X X   X

Dynamic Lock
    
 X

Authentication
. . . .

Proximity (RSSI)
.
. Condi. Usable
.

.

.

Usable

.

Usable

.

These properties should not be used or should be used with care.

AGENDA

· Bluetooth-based Proximity Authentication · Preliminaries · Security Analysis - Proposed Approach · New Vulnerabilities · Mitigations · Conclusion

· Lesson #1
· Device authentication methods over Bluetooth that are relying on untrusted properties of a connection, such as the MAC Address, are insecure.
· Lesson #2
· Device proximity authentication methods over Bluetooth must check both device authentication and device proximity at the same time, via a secure channel.
· Our Hypothesis
· Failing to follow either Lesson 1 or 2 would result in an insecure authentication

Methodology:
Analyze Authentication State Transition for Connection Security Properties
· Understand Authentication/Authorization State
· When and how a device grants an access? · How a device authenticate the other (trusted, previously paired) devices? · How a device checks the proximity of the other device?
· Capture the corresponding connection state
· What is the security level of the connection when the authentication decision is made?

Authentication / Authorization State Diagram of Android Smart Lock

Authentication / Authorization State Diagram of Android Smart Lock
Attacker Spoof Trusted Device in Device Lock and Transit to Device Unlock

Connection State Diagram of Android Smart Lock
Bluetooth Connection State

StandBy

Link Establishment

Connection
isConnected() == True isEncrypted() == True
Secure Connection

Page Scan

Trusted Device State
StandBy

Page

Insecure Connection
isConnected() == True isEncrypted() == False
Smart Lock Activated with insecure state

Connection State Diagram of Android Smart Lock (Patched)
Bluetooth Connection State

StandBy

Link Establishment

Connection
isConnected() == True isEncrypted() == True
Secure Connection

Page Scan

Trusted Device State
StandBy

Page

Smart Lock Activation

Insecure Connection
isConnected() == True isEncrypted() == False

AGENDA

· Bluetooth-based Proximity Authentication · Preliminaries · Security Analysis ­ Proposed Approach · New Vulnerabilities
· Smart Lock · Dynamic Lock · Mitigations · Conclusion

· Google resolved the issue by adding additional check isEncrypted() == True
· Use only the connections from previously paired devices to enable Android Smart Lock
· Making an insecure Connection created by SDP can no longer unlock a device
Root Cause: "Bluetooth Connection" is not Secure
à Does every path become secured?

Authentication / Authorization State Diagram of Android Smart Lock (patched in 2015)
isConnected() è TRUE isEncrypted() è TRUE
isConnected() è TRUE isEncrypted() è Don't care!

DEMO TIME !
We will use Pixel 3 (Google Play Service XXXX) to demonstrate the vulnerability of Android Smart Lock.

Responsible Disclosure
· April 5 Report · April 16 Acceptance · July 17 Complete Patch

Authentication / Authorization State Diagram of Windows Dynamic Lock

Connection State Diagram of Windows Dynamic Lock
Bluetooth Connection State

Dynamic Lock Activation

StandBy

Link Establishment

Connection

Smartphone State
StandBy

Page Scan
Windows Dynamic Lock Checks: Class of Device == Smartphone
Page

Secure Connection
Insecure Connection
aaa

DEMO TIME !
We will use Surface Go (Windows 10 1909) to demonstrate the vulnerability of Windows Dynamic Lock.

Connection State Diagram of Windows Dynamic Lock
Bluetooth Connection State

Dynamic Lock Activation

StandBy

Link Establishment

Connection

Smartphone State
StandBy

Page Scan
Windows Dynamic Lock Checks: Class of Device == Smartphone
Page

Secure Connection
Insecure Connection
aaa

MAC Address Spoofing and CoD Manipulation
There's no PHONEs connected to me.
Dynamic Lock is NOT activated.

I'm Smart Watch !! I'm Smart Watch !! I'm Smart Watch !!
I'm Smart Watch !!

Proximity Manipulation

If an attacker attempts to connect to a laptop using SDP, the connection can be maintained and signal strength can be high.

Responsible Disclosure (May 14)
· Windows Dynamic Lock does not affect to the original security promise (by Microsoft) · Even if Windows Dynamic Lock is not activated, the laptop is locked by the lock screen timeout

AGENDA

· Bluetooth-based Proximity Authentication · Preliminaries · Security Analysis ­ Proposed Approach · New Vulnerabilities · Mitigations · Conclusion

Know what is provided by Bluetooth Security, and use only secure components of a Bluetooth connection. · Connecting to a previously paired, trusted device is not necessarily secure
· Bluetooth connection can be in one of security level (0 ­ 4) · Only the encrypted connection (Security Level 4) is secure and trusted
· When to use encrypted connection?
· Use only the encrypted connection for Authentication · If the functionality is not related to the device's security, you may use unencrypted connection

Completely Cut-off insecure authentication / connection state transition paths · Obtain the state diagram of both authentication and connection management logic · Analyze the diagram for any insecure state transition paths
· Identify and apply fix for all insecure paths
· Lesson: Google was aware of the root cause of the 2015 vulnerabilities, but its fix leaves an alternative path that misses security check (isEncrypted() == True)
Applying this Analysis in the Software Development Lifecycle (SDL) àVerify that authentication is not triggered by Untrusted Properties · Vulnerability Detection Tool
· Simulate the attack for detecting potential vulnerabilities

Bind insecure properties with SECURE components · Obtain RSSI only from encrypted connection
· Check if the connection is in the Security Level 4 before measuring RSSI

AGENDA

· Bluetooth-based Proximity Authentication · Preliminaries · Security Analysis ­ Proposed Approach · New Vulnerabilities · Mitigations · Conclusion

· Convenient Bluetooth-based proximity authentication methods could result in an insecure authentication · We propose a method to analyze the security of Bluetooth Authentication; the analysis requires tracking of the
status of both the authentication system and the Bluetooth connection to the device; any authorization by insecure data will result in improper authentication
· We discovered a new vulnerability in Android Smart Lock
· The vulnerability reported in 2015 was improperly fixed, allowing attackers bypass the lockscreen
· We discovered a new vulnerability in Windows Dynamic Lock
· It utilizes the MAC address and class-of-device to identify a trusted device, both of which are insecure properties · It utilizes RSSI value from a connection, however, does not check if the connection is trusted or not
· The root cause of the recurring issues is that authentication logic is relying on insecure components/values of Bluetooth connection
· We recommend developers to have a proper understanding and apply our analysis to their authentication methods

· Be sure to use only the trusted components for Bluetooth-based authentication
· Check if the connection is encrypted · Check if the RSSI value is measured for an encrypted connection
· Applying System-state/Bluetooth analysis in the Security Development Lifecycle (SDL)
· Take account the state of both the system and Bluetooth connection · SHOULD NOT authorize access if connection is untrusted
· SHOULD NOT have a state transition to authorized state via untrusted values
· Try our vulnerability detection tool to your favored Bluetooth authentication methods
· https://github.com/0-10000/ProximityAuth

Thank you
for your attention !
Please contact us by e-mail for more details

yman.jung@samsung.com junbum.shin@samsung.com yeongjin.jang@oregonstate.edu

