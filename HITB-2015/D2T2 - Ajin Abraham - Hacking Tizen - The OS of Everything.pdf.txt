HACKING TIZEN
THE OS OF EVERYTHING
AJIN ABRAHAM | @ajinabraham

WHOMAI
· Application Security Engineer ,Yodlee · Blogs at opensecurity.in · Spoken at NULLCON, ClubHack,
OWASP AppSec, BlackHat, Ground Zero Summit.... · Loves to learn NEW things.

DISCLAIMER
· All Images, Logos and Trademark belongs to their respective owners.
· All vulnerabilities discussed are responsibly disclosed to Tizen Security community.
· Personal View/Research, doesn't reflect the views of my employer.

AGENDA
· What is Tizen · Why Tizen? · Types of Tizen Application · Tizen Architecture · Tizen Application Structure · Tizen Security Model · Sandbox ­ SMACK · WebKit2 on Tizen · Quick Comparison ­
Android vs Tizen vs iOS

· Hacking Tizen * Android vs Tizen Web App * Shellshock * Issues in DEP * Broken ASLR * CSP Bypass * URL Spoofing/Content Injection
· Pentesting Methodology * Static Analysis * Dynamic Analysis * Network Analysis
· Security Concerns in Tizen · Conclusion

TIZEN : The OS of Everything
IoT (Internet of Things) Tizen ­A Linux Foundation Project.

"
Why TIZEN?

Source:  h$p://'  mesofindia.india'mes.com/tech/tech--news/Micromax--beats--Samsung--becomes--Indias--No--1--mobile-- vendor--Report/ar'cleshow/39630245.cms  

Source:  h$p://www.theverge.com/2013/11/12/5093588/'zen--open--opera'ng--system--partners--with--36--companies  

Source:  h*p://www./zenexperts.com/2015/04/samsung--2015--/zen--tv--range--now--available--at--currys--in--the--uk/  

"

THE FAMILY

TYPES OF TIZEN APLICATIONS

+
WEB API

NATIVE

Web

Native

+
NATIVE

Hybrid

+
WEB API

Supports Android application with Tizen Application Compatibility Layer (ACL).

TIZEN ARCHITECTURE

Tizen  Web  App  .wgt  
Tizen  Web  Framework   (HTML5  +  Tizen  Web  API)  

Tizen  Na/ve  App  .tpk  
Tizen  Na've  Framework   (C++  API)  

Framework  

Core  

Kernel  

Linux  Kernel  &  Drivers  

Web API = Standard HTML5 + Tizen Device API

TIZEN APPLICATION STRUCTURE

INSTAL DIRECTORY

NATIVE APPS (.TPK)
.tpk  
Install Location

WEB APPS (.WGT)

HYBRID APP(.TPK)

TIZEN  SECURITY  MODEL
· Non root applications · All applications run under same non-root user ID, app. · Most of the middleware daemons will run as non-root user.
· Application sandboxing · All applications are sandboxed by SMACK. · An application is allowed to read or write files in it's home directory and shared media directory (/opt/usr/media) · Each application unable to send IPC and sockets, r/w other application files.
· Permission Model/Least privilege · All applications will have manifest file describing privileges. · Manifest file describes also SMACK labels and rule.
· Application Signing ­ Author and Distributor · Tizen CSP for Web Apps ­Web Apps have additional layer of security
with Content Security Policy. · Encrypt HTML, JS and CSS stored in Device - Encrypts at Install time
and Runtime decryption. · Content Security Framework ­ Provides API for AVs.

SMACK
SIMPLIFIED MANDATORY ACCESS CONTROL KERNEL
"
"what's  mine  is  mine;  what's  yours   is  yours."     
SMACK allows you to add controlled exception to this basic rule.

Web1 Web app 1

Web2
Web app 2

Native1 Native App (uid: app)

Web Runtime (uid: app)

Native Framework

SMACK LABEL
Daemon
Some Daemon (uid:root)

Web1 Kernel

Web2

File System

Native 1

SMACK TERMS
­ Subject à Any Running Process (Have Smack Label) ­ Object à File, IPC, Sockets, Process ­ Access à Read (r), Write (w), Execute (e), Append (a) , Lock (l), Transmute (t)
41,000 SMACK Rules in Tizen 2.2.1 !!
   From Tizen 3.X: ( Smack Three domain Model, Cynara)

NATIVE  APPS  ­  MANIFEST.XML

WEB  APPS  ­  CONFIG.XML

WEBKIT2 ON TIZEN
· Tizen WebApps runs on WebKit2
· New API Layer over WebKit
· Supports Split Process Model, Like your Chrome Tabs

QUICK COMPARISON

· Apps identified by UID · Permission : AndroidManifest.xml · Binder IPC using Intents · SELinux · Signed by Developer

· Users identified by UID (app) · Permission: Manifest.xml & Config.xml · MessagePort IPC using socket · SMACK & CSP · Content Security Framework · Signed by Developer & Distributor

· All Apps run under user "mobile". · No permission model. Ask for Permission at Runtime. · URL Schemes, x-callback URL, Extension, XPC based IPC · Powerbox, Seatbelt · Signed by Distributor

RESEARCH FOCUS
Tizen 2.2.1 and IVI 3.0 OS Memory Protection Tizen CSP and WebKit

ANDROID WEB APP vs. TIZEN WEB APP
· Tizen Web Apps are powerful and feature rich.
· In Android Web Apps in WebView and can interact with Device features using addJavascriptInterface.
· In Tizen, It provides Web API that allows to leverage Device features and are protected using privileges and CSP.

OVER PRIVILEGED ANDROID APP VS TIZEN APP

Android

Tizen

WebView

WebApp

ADDJAVASCRIPTINTERFACE

BLUETOOTH PERMISSION NFC PERMISSION

BLUETOOTH PRIVILEGE NFC PRIVILEGE

DEVELOPER EXPOSES API TO BRIDGE

BLUETOOTH API

NFC API

BLUETOOTH

NFC

BLUETOOTH

NFC

SCENARIO  :  XSS  

Android
XSS
WebView

XSS CSP

Tizen
WebApp

ADDJAVASCRIPTINTERFACE

BLUETOOTH PERMISSION NFC PERMISSION

BLUETOOTH PRIVILEGE NFC PRIVILEGE

DEVELOPER EXPOSES API TO BRIDGE

BLUETOOTH API NFC API

BLUETOOTH

NFC

BLUETOOTH

NFC

LIKE  ANY  LINUX  DISTRO  :  SHELLSHOCK  

DEP
· When Data Execution Prevention is enabled, data on stack should be nonexecutable.
· Prevents Shellcode at Stack from Executing.
· But DEP is not seen in action.

e DEMO

ASLR
· As per documentation ASLR is fully implemented in Tizen 2.1 itself. · Already Broken in Tizen 2.1 , discovered by Shuichiro Suzuki · /proc/sys/kernel/randomize_va_space is set to 2 which tell us that ASLR is enabled. · The personality value at /proc/self/personality is set to 00040000.
which corresponds to (ADDR_NO_RANDOMIZE) disables ASLR. · InTizen 2.2, /proc/self/personality is set to 00000000
· PIE (position-independent executable). So this will make the native application ASLR enabled.
· But due to implementation issues, it was still found that ASLR is still in broken state. · /proc/<pid>/maps ­Address of heap, stack and main modules remain the same.

e DEMO

URL SPOOFING/CONTENT INJECTION
· Open  a  new  window  with  URL   h$ps://facebook.com  and  assign  it  to  a   variable  w.  
· Try  to  write  "<h1>You  've  been  Hacked</ h1>"  to  DOM  using  w.document.write()  
· Focus  the  window.  

e DEMO

CSP BYPASS
Content-Security-Policy: default-src 'self'; script-src 'self'
· We create a script tag with JavaScript nullbyte prepended to a SCRIPT URL.
· Tricks the browser and load the Script from a different domain and Bypass CSP.

e DEMO

PENTESTING METHDOLOGIES

Whitebox
Access to Source and Knowledge about the application

Blackbox
No access to Source and no idea about the application

Further Classification
 Static Analysis  Dynamic Analysis  Network Analysis

STATIC ANALYSIS
·Certificate Signature Analysis ­ Developer and Distributor ·Manifest Analysis ­ manifest.xml/config.xml
* Unwanted Privileges. * CSP is proper or not. * Smack Labels and Rules
·Decompile Native App
* Apps Compiled with CLANG/CLANG++ compiler. * LLVM decompiler - tizen_tpk_decompiler.py (make use of Retdec API).
·Code Review
* Weak Encryption, Crypto, Plaintext Information, SSL Overriding, Insecure File Storage, Client Side SQLi/XSS.
* Pretty much OWASP Mobile Top 10.
·Couple of tools - https://github.com/ajinabraham/tizen-security

DYNAMIC ANALYSIS
· Enable Developer Mode - *#84936# · Run the App in Device/Tizen VM or Web
Simulator. · Sensitive data shared during IPC, Sensitive
files written at Runtime, Temp files etc. · Directories/ Files/DB with chmod 777 access. · Tools: Dynamic Analyzer much like android
ddms/Android Device Monitor, sdb ­ The adb equivalent for Tizen.

NETWORK ANALYSIS
· Installing SSL Certificate and HTTPS Traffic Decryption with a Proxy like Burp/ Fiddler.
· Install Certificate to User Certificate Store: Settings -> About device -> Manage certificates -> User certificates -> Install.
· OWASP Top 10 Web Risks

INSTALLING CA CERT TO TRUSTED CERT STORE
· Installing CA in Device · Trusted CA Certificates are stored under /etc/ssl/certs · Filename: <8HEXChars.0> in PEM format. · Copy the CA certificate to /etc/ssl/certs and it's trusted.

MOBILE SECURITY FRAMEWORK
 Automated Mobile Application Pentest and Code Review Framework.
 Currently Supports Android and iOS.  Tizen support is on the way.  Download: https://github.com/ajinabraham/YSO-Mobile-Security-
Framework/

SECURITY CONCERNS

· WebKit = Bugs!!

· "WebKit is basically a collection of use-after-frees that

somehow manages to render HTML (probably via a

buffer overflow in WebGL)"

-the grugq

· HTML Web APIs are powerful, Improper CSP and XSS=owned !!

· Too much SMACK Rules ­ High chance that developers will mess up. Will be reduced from Tizen 3.

CONCLUSION
· Security Model/Architecture wise they put lot of effort compared to Android or other Operating Systems.
· They made it so complex (SMACK rules) that people can easily mess up.
· Looks promising if they can fix some silly implementation bugs.

THANKS
 Thanks to Yodlee and my awesome manager, Sachin for all the support and encouragement.
 Presentation template by SlidesCarnival & Unsplash

QUESTIONS?
Ajin Abraham
@ajinabraham
http://opensecurty.in

