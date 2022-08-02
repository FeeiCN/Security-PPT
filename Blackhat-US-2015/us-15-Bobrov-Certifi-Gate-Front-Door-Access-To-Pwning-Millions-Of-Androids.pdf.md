CERTIFIGATE
Front Door Access to Pwning hundreds of Millions of Androids
Avi Bashan Ohad Bobrov
1

AG EN DA

· Mobile Threats and Research Motivation · Mobile Remote Support Tool Overview · Pwning Mobile Remote Support Tool · Conclusions · Q&A

2

ABOUT US
OHAD BOBROV  Decade of experience researching and working in the mobile security space  Former Co Founder & CTO @Lacoon Mobile Security  Mobile Threat Prevention Area Manager @Check Point  Presented in BH SP, InfoSec, etc
AVI BASHAN  Security researcher for over a decade in the PC and mobile areas  Technical Leader @Check Point  Former CISO & Security Researcher @Lacoon
MAJOR CONTRIBUTORS
 Pavel Berengoltz  Daniel Brodie  Andrey Polkovnichenko  Denis Voznyuk
3

MOBILE REMOTE ACCESS TROJAN (mRAT)
· Used by malicious threat actors · Provides unauthorized and stealth access to mobile devices · Known mRATs
4

mRAT CAPABILITY ANALYSIS
mRAT
5

mRAT CAPABILITY ANALYSIS

App Installation

...

mRAT

... Screen Access

User Input Control

Exploit Usage

6

mRAT CAPABILITY ANALYSIS

App Installation

? mRAT

... ... Screen Access

User Input Control

Exploit Usage

7

mRAT CAPABILITY ANALYSIS

App Installation

mRST mRAT

... ... Screen Access

User Input Control

Exploit Usage

8

MOBILE REMOTE SUPPORT TOOLS (mRST)
· IT Departments · Used by Mobile Carriers · Device Manufacturers Main Players
9

MOBILE REMOTE SUPPORT Tools Overview
10

ANDROID PERMISSION MODEL 101
ANDROID IS A MODERN OS
 Sandboxing features  Permission based access
 Must be obtained to access a resource
 User can view upon app installation
 `Take it or leave it' approach
11

ANDROID PERMISSION MODEL 101

SOME PERMISSIONS are considered "privileged"

Permissions INSTALL_PACKAGES READ_FRAME_BUFFER ACCESS_SURFACE_FLINGER INJECT_EVENTS

Action App installation Screen access
User Input Control

GRANTED ONLY TO PRIVILEGED SYSTEMS APPS
ROM Pre-installed apps located under /system/priv-app Apps signed with the OEM's certificate

12

mRST PERMISSIONS

· Access Internet · Get device network info · Query installed app list · Access to device storage · Install apps · Capture screen · User input control

PRIVILEGED PERMISSIONS

13

ANDROID CUSTOMIZATION CHAIN

AOSP

OEMs Carriers

14

mRST ARCHITECTURE

MAIN APP
 Signed by mRST
developer
 Regular permissions  Network
connection
 User interface

Binder
Verification Mechanism?

PLUGIN
 Signed by OEM  privileged
permissions
 Exported service  No user interaction

15

WHAT'S THE PROBLEM
WITH A PLUGIN?
· Signed by the OEM · Obtained from Google Play ; Pre-Installed · Designed to communicate with other apps · VALIDATION CODE IS RE-INVENTED BY EACH VENDOR!
16

WHAT DID WE FIND?
17

TEAM VIEWER OVERVIEW
18

TEAM VIEWER'S PLUGIN
· App connects to plugin over Binder · Plugin needs to verify connection to
TeamViewer's main app · Plugin compares the connecting
app's certificate serial number to a hardcoded serial number
19

WHERE'S WALDO?
20

RFC 2459
Internet X.509 Public Key Infrastructure
4.1.2.2 Serial number The serial number is an integer assigned by the CA to each certificate. It MUST be unique for each certificate issued by a given CA (i.e., the issuer name and serial number identify a unique certificate)
21

ANDROID APPS SIGNATURE
· Who signs applications on Android? · Where do they get the certificate?
· So..
22

Pwned!
23

24

DEMO TIME!
25

RSUPPORT OVERVIEW
Samsung & LG ship the plugin pre-installed
· LG G4, G3, G2 and G Pro 2 · Samsung Galaxy S5 and S4 (Some ROMs) · And more!

RSupport CODE OVERVIEW
The plugin compares the connecting app's certificate hash code to a hardcoded hash code
Get the certificate hashCode
27

RSupport CODE OVERVIEW (Cont.)
Try to compare it to a few hash codes, if it's equal - continue
28

HASHCODE?
· But wait, what is the Signature's hashCode?
MD5? SHA1? SHA256? CRC32???
Android is open source, so we can just see it's implementation
29

HASHCODE!

Executes the Arrays.hashCode function on the certificate

32-bit signed integer

Only 232 ~= 4 Bilion Possibilities!
30

32

WHAT
ELSE?
· We found multiple vulnerable plugins · We didn't check them all
Left as an exercise for the reader
· Verification flaw is not limited to mRSTs
33

mRST PLUGIN ANOTHER ANGLE
· Found a problem in one of the vendor's main app
· Allowed us to manipulate the main app logic, in order to take control of the OEM signed plugin
34

COMMUNITAKE VULNERABILITY
Main app allows changing settings by SMS
One of the commands can modify the subdomain of the CnC server
<xxx>.communitake.com
The subdomain can be altered without requiring authentication
The app does not sanitize the subdomain properly
Enables the addition of the '/' character to the subdomain
35

COMMUNITAKE VULNERABILITY (CONT.)
· An attacker can send a command which changes the CnC server to a malicious CNC server
· Enabling them to take full control of the device with a single SMS message without user intervention!

DEMO TIME!
37

VULNERABILITIES DISCLOSURE TIMELINE

MID APRIL
Reported to Vendors, OEMs, Google

MID APRIL ­ MAY
Got responses from most of the vendors, which started to work on resolving the issues

MAY ­ JUNE
New version of the plugins were uploaded to the Play Store

AUGUST
Still waiting for some vendors responses..

38

CONCLUSION
Android's eco-system is flawed · Google moved the responsibility to the OEMs · No way to patch it
Hundred of millions of Android devices are vulnerable
39

SO WHAT SHOULD I DO?
· Check if you device is on the list of vulnerable OEMs
Can be found in our blog post
· Check if you have one of the plugins installed
Remove it (If you can)
40

A LAYERED MOBILE SECURITY APPROACH

VULNERABILITY ASSESSMENT

· System, OEM and 3rd party apps, and plugins
· Continues monitoring

THREAT DETECTION

· Horizontal escalation from 3rd party apps

RISK MITIGATION

· Alert user to remove vulnerable plugins · Track patching progress

41

CERTIFI-GATE SCANNER
Google Play
42

QUESTIONS?
43

