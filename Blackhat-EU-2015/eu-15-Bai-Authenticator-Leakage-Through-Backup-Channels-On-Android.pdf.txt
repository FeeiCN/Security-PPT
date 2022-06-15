Authenticator Leakage Through Backup Channels on Android
Guangdong Bai
National University of Singapore

Web services are increasingly delivered through mobile apps ...
Social Networking Online Banking Email Service
2

Can't we simply use mobile browsers?
 Full use of device/APIs  Less programming limitation  Running faster
V.S.
 Cross platforms  Reusable browser
functionality (JS engine, ... )  Developed faster
3

Can't we simply use mobile browsers?
... the (mobile) browser has become a single application swimming in a sea of apps.
-- Flurry Insights
4

Therefore, mobile apps play the same role as web browsers

 Communication
protocols
GET HTTP/1.1

 Content rendering

Web Server

HTTP/1.1 200 Set-Cookie: cookie1=87654321; domain=.idp.com
---------------------------------------<body onload=foo()> <script>
var domain="http://www.sp.com/login"; var authToken="3fa09d24a3ce"; var uEmail="alice@idp.com"; var idpSign="2oOs5u29erIas..."; function foo(){
var message=uEmail+"&"+authToken+"&"+idpSign ; window.postMessage(domain, message); } </script> </body>

App

5

However, this is a non-trivial task...
 Communication
protocols

 Content rendering

App Web Server
· Security of communication protocols
­ Novel attack surface ­ Novel Trusted Computing Base (TCB)

· Code injection attacks
­ Have been extensively studied *CCS'13, CCS'14, ESORICS'15+
6

Focus of this talk: web authentication protocols on Android
· Implementation of web authentication schemes on Android
­ Authentication process ­ How authentication credentials (authenticators) are managed
· Backup channel: a new attack surface against web authentication on Android platform
­ Why backup is a dangerous functionality on Android ­ How to abuse backup channels
· Case studies and mitigations
7

Section 1. Web Authentication on Android

Web authentication: safeguard to web accounts
· Web Authentication
­ A process by server to confirm whether an entity (client) is who it declared ­ One of the mostly used web functionalities
9

How Android apps implement web authentication? · Our investigation
­ Goal: to learn approaches contemporary apps use to implement their authentication schemes
­ Focus: how authenticators are managed
­ Methodology: we have manually analyzed top-ranked 100 apps on Google Play (by reverse engineering and traffic analysis)
10

Result summary

TOP 100

66 with authentication
schemes

­ Basic authentication (40) ­ Single Sign-on (40) ­ Android Account Manager (16)

34 without authentication
schemes

Standalone apps e.g., news browsers, maps and video players

Figure source: http://geektechreviews.com/wp-content/uploads/2015/07/Top-10-Free-Android-Apps-Must-Have.jpg

11

Web authentication scheme #1: Basic authentication
· Basic authentication stands for traditional authentication schemes on the basis of
­ Knowledge (e.g., a password and security questions)
· 34 out of 40 apps use password-based schemes
­ Ownership (e.g., a hardware token and a mobile phone)
· 6 out of 40 apps use SMS-based one time password schemes
­ Inherence (e.g., fingerprint and retinal pattern)
· None is found · Fingerprint confidentiality at Black Hat US 2015 by Dr. Wei Tao
12

General process of basic authentication on desktop browsers

Web Server

UID/PWD

 Same origin policy (SOP)  Cookie Protection ...
Web Browser

· Authenticator
­ An authentication credential indicating client's login session ­ E.g., cookies, session ID, OAuth Token and OAuth Code
13

General process of basic authentication on Android apps

Web Server

UID/PWD

Restful API

Content Provider

Webview

Shared Preference

Android App

Internal Storage
/data/data/appname

14

Web authentication scheme #2: Single Sign-on
· Single Sign-On (SSO)
­ A kerberos-like single credential authentication scheme
­ BrowserID (Mozilla) ­ Facebook Connect
· 250+ Million users, 2,000,000 websites
­ OpenID
· one billion users, 50,000 websites
­...
15

Three parties in SSO
User

Identity Provider (IDP) e.g.,
Relying Party (RP) e.g.,

16

SSO in Android
· Relying Party (RP)
­ Application
· Identity provider (IDP)
­ SSO Service is released in form of SDK ­ E.g., Facebook Connect, Twitter ID
17

A concrete process: Facebook connect

Android RP app Facebook SDK
/app/app/RP

Facebook Server
Legend
Secret cookies OAuth
Access token

IDP app

Android
RP app Facebook
SDK

/app/app/IDP

/app/app/RP

18

Web authentication scheme #3: Android Account Manager
· Account Manager
­ An Android service which provides a delegated authentication service and centralized account/authenticator control
­ Pros
· Simplifies the process for the developer
­ By implementing some interface
· Can handle multiple token types for a single account
· Automatically background update (SyncAdapters)

http://blog.udinic.com/2013/04/24/write-your-own-android-authenticator/

19

Briefing how Account Manager works
· Developer needs only to ...
­ To create an AccountAuthenticator
· Add accounts, account types, auth token
­ To create an Activity
· Through which users enter credentials
· Account manager will ...
­ Manage authenticators
· Located in account.db in /data/system/users/0
­ Update authenticators on background
20

Security of authentication schemes
· Security of protocols in three layers
­ Design-level security: design and logic flaws
· A notorious example: flaws in Needham-Schroeder protocol · Protocol verification: theorem proving (Proverif), model checking (PAT)
­ Implementation-level security
· Implementation errors/bugs in the code · E.g., Google lD flaw: not all messages are cover in signature (IEEE S&P'12)
Guessable authenticators (NDSS'13)
­ Infrastructure-level security
· Exploits in the software stack (e.g., OS, file system) that the protocols rely upon · A previous study: password leakage through compromised ADB (Claud Xiao on
HITCON'14)
21

Let's look at infrastructure-level security of web authentication on Android

UID/PWD

Restful API

Content Provider

Webview

Shared Preference

Android App

Internal Storage
/data/data/appname

Basic Authentication

22

Let's look at infrastructure-level security of web authentication on Android
Facebook Server

Single Sign-on

Android RP app Facebook SDK
/app/app/RP

Legend
Secret cookies OAuth
Access token

IDP app

Android
RP app Facebook
SDK

/app/app/IDP

/app/app/RP

23

Let's look at infrastructure-level security of web authentication on Android

Basic Authentication Single Sign-on

The owner app's proprietary directory
/app/app/appname

Account Manager

System directory
/data/system/users/0

24

Isolation Mechanism in Android

Uname/password


Sandbox

/data/data/appname

Sandbox

What if the sandbox is bypassed?
25

Backup functionality has to violate sandbox mechanism

 Backup app



Sandbox

Sandbox

26

Section 2. Backup on Android

Two ways to implement backup on Android

 Backup app



· Root-based backup
­ Root the device and grant root privilege to the backup apps
· ADB-based backup

Sandbox

Sandbox

We consider only to backup an app's data located in its proprietary

28

folder, instead of the user's data can be accessed through APIs like

contacts and SMS messages

ADB-based backup
· ADB (Android Debug Bridge)
­ ADB is a versatile command line tool that lets users communicate with an emulator instance or connected Android-powered device.
­ Running on system level privilege
· Root > system > user
· How does ADB-based backup work?

1. adb shell

Android

2. app_process proxy System level

User level

proxy
Backup app
29

How backup can be a threat to authentication?

Globally readable storage

Channel #1: Backup data Leakage

Victim App

Backup App

ADB Proxy

Ccahpaanbnielilty#2Le: aBkaacgkeupMalicious App

30

A summary of leakage through the existing backup apps

Category Apps

My Backup

Root-based

Ultimate Backup

Ease Backup

ADB-based

Titanium Backup
Helium

Installs 1,000,000 - 5,000,000

Publicly Backup data Compromised Leakage accessible? encrypted? interfaces? possible?

SD card



--



500,000 - 1,000,000

SD card



--



100,000 - 500,000

SD card



--



10,000,000 - 50,000,000 SD card



--



1,000,000 - 5,000,000 SD card







31

Analyzing an ADB-based Backup App
· Helium
­ One of the best apps in 2013 (www.gizmap.com/best-android-apps-2013/30238)
­ Developer: ClockworkMod
· Developer of CyanogenMod Android OS · Has released 19 apps on Google Play, 15 million installs
32

Internals of Helium (obtained by reverse engineering)

Android
 am startservice
ShellRunner

Helium
ShellProxyService





Local Socket Server

settings.db
/data/data/helium

Legend control flow
data flow

33

Internals of Helium (obtained by reverse engineering)

Android
 am startservice
ShellRunner

Helium
ShellProxyService


 Local Socket Server
Legend control flow data flow

SD Card





 LocalBackup

settings.db

Main Activity

/data/data/helium



34

Internals of Helium (obtained by reverse engineering)

Android
 am startservice
ShellRunner

Helium
ShellProxyService


 Local Socket Server

Legend control flow
data flow

(iii)

SD Card





 LocalBackup

settings.db

Main Activity

/data/data/helium



(ii)

WebBackup
Asyn

(i)

HTTPServer

(iv)

35

Access Control Protocol in the ADB Proxy

ADB Proxy

Local Socket Server

Helium Main app

Code of broadcastPassword()

Code of ADB proxy

36

A logic flaw
ADB Proxy Local Socket Server

Helium Main app

Code of broadcastPassword()

Code of ADB proxy

37

How handleSocket() works?
handleSocket() {
try { while(true) { r = getRequest(); if (checkOTP(r)) serve(r); else throw exception; }
catch { // not terminate
} }
38

A logic flaw
ADB Proxy Local Socket Server

Helium Main app

Code of broadcastPassword()

Code of ADB proxy

39

Attack #1: Exploit the logic flaw

·

ShellRunner

User

AuthSniffer Attacker

ShellProxyService Monitor uninstall events

start uninstall
mHelium install
start

Helium uninstalled

Trick user to install mHelium

·

Monitor install events

Wrong token

Disadvantage of the attacker
­ Helium needs to be uninstalled ­ Attacker needs to install an
malware with the same name as Helium
Advantage of the attacker
­ Once obtaining the OTP, the attacker is able to backup the victim app at any time (active attack)
­ Once obtaining the OTP, the attacker is able to conduct other high-privileged actions (see http://developer.android.com/tools /help/adb.html)

40

Attack #2: Invoke the Web interface

HTTP Server on port 5000

URL http://IP:5000/api/package
http://IP:5000/api/backup.zip
http://IP:5000/api/restore.zip

Method GET
POST
POST

HTTP Body

Description

NULL

Fetch the list of installed apps

Name of the app Backup to backup

Backup data

Restore

41

Attack #2: Invoke the Web interface
HTTP Server on port 5000
· Disadvantage of the attacker
­ The HTTP server is closed by default and only open when web backup is used (semi-active attack)
­ Needs INTERNET permission
· Advantage of the attacker
­ Can backup target victim ­ Easier to implement than Attack #1
42

Attack #3: Access backup data on external storage
· Disadvantage of the attacker
­ Cannot chose target victim (passive attack)
· Advantage of the attacker
­ Easy to implement
43

Section 3. Impact and Case studies

Extent of the ADB backup
· The apps won't be backup by ADB proxy when
­ Using Android Account Manager for authentication ­ Android:allowBackup is false
· If a developer does not specify it in AndroidManifest.xml, it is true by default!!
­ Our study reveals that only ~10% apps specify it false.
45

How many apps are subject to these attacks?
· Data Set I
­ Top ranked 100 apps
· Data Set II
­ Randomly chosen 10 Categories of apps from Goolge Play ­ Top 10 apps from each category

Device 1 Victim App



Proxy

Web Server
?


Device 2




Helium


Attacker PC

46

How many apps are subject to these attacks?

Infected, 80
W/O Authentication,
83

Not infected, 37 Account
Manager, 23
W/O Backup, 14

47

Case study #1: Facebook App
POST https://b-api.facebook.com/method/auth.login HTTP/1.1 ... User-Agent: [FBAN/FB4A;FBAV/9.0.0.26.28;FBBV /2403143;FBDM/ email=alice.tester%40gmail.com&password=pwd&sig =452aca050cdce967a699e969076962f0&...

HTTP/1.1 200 OK

...

Content-Type: application/json

{"session_key":"5.71T...411696",

"access_token":"CAAAAUaZA...XW8ZD",

"session_cookies":[{"name":"c_user","value":" 100003708411696","expir

es":"Thu, 28 May 2015 10:11:48 GMT","domain":".facebook.com"},

,"name":"xs","value":"201:71TTJlPmwZwjXQ :2:1401271908:10025","expi

res":"Thu, 28 May 2015 10:11:48 GMT","domain":".facebook.com"},

... ]

...}

48

Identifying authenticators

access_token
c_user xs

Credentials in subsequent requests, e.g., posting a new post
Credentials indicating the user's login state

prefs_db /data/data/com.facebook.katana

49

Case study #2: Facebook Single Sign-on

Authentication Authorization

rpApp Facebook SDK
verification


user id/pwd
 c_user, xs

OAuth token

c_user, xs
 OAuth token

? user_info&OAuth token



user_info

Facebook Server

· Authorization: the user can control what information can be accessed by the rpApp. 50

Authenticators belonging to two origins?

Android
RP app Facebook SDK

Facebook Server c_user xs
OAuth token

facebook.com sp.com

/app/app/RP

· Facebook completely delegates the secrecy of its credentials to RP app?!

51

Using c_user and xs to log into user's account and completely violate authorization ...
52

Facebook's opinion
Facebook Security
But couldn't a malicious application with a WebView also steal usernames and passwords as they're submitted? Once the user is entering their credentials outside of a trusted browser, there's very little that we can do from our end to protect them. That's why it's so important that marketplaces like Google Play and Apple's App Store take steps to protect users from malicious applications.
53

Section 4. Mitigation

Suggestions to backup app developers
· Build secure ADB-based Backup
­ Prevent backup privilege from exposure
· Verified Access control of the ADB proxy · Secrecy of backup data
­ Follow the principle of least privilege
· Expose only backup/restore functionality
­ Manage lifecycle of ADB proxy
· ADB proxy never outlives the main app
55

Suggestions to web app developers
· Protect authenticators
­ Disable android:allowBackup if not necessary ­ Avoid storing password ­ Shorten authenticator lifetime
· Avoid implementation own authenticator management
­ Use Android Account Manager
56

Summary and Take-away
· The dilemma
­ Backup functionality v.s. Confidentiality ­ Push the boundary or break the sandbox?
· Authentication
­ Awareness of infrastructure-level attacks
57

References
· *CCS'13+ Wang, Rui, et al. "Unauthorized origin crossing on mobile platforms: Threats and mitigation."
· *CCS'14+ Jin, Xing, et al. "Code injection attacks on HTML5-based mobile apps: Characterization, detection and mitigation."
· *ESORICS'15+ Hassanshahi, Behnaz, et al. "Web-to-Application Injection Attacks on Android: Characterization and Detection."
· *IEEE S&P'12+ Wang, Rui, et al. "Signing me onto your accounts through facebook and google: A traffic-guided security study of commercially deployed single-sign-on web services."
· *NDSS'13+ Bai, Guangdong, et al. "AUTHSCAN: Automatic Extraction of Web Authentication Protocols from Implementations."
58

Thank you!
Bai Guangdong baiguangdong@gmail.com
59

