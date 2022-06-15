Amsterdam ­ April 12th, 2018

Piergiovanni Cipolloni
Security Advisor @Mediaservice.net S.r.l. (piergiovanni.cipolloni@mediaservice.net)
· ~ 20 years in Penetration Testing · Security researcher

Federico Dotta
Security Advisor @Mediaservice.net S.r.l. (federico.dotta@mediaservice.net)
· OSCP, CREST PEN, CSSLP · 8+ years in Penetration Testing · Focused on application security · Developer of sec tools:
https://github.com/federicodotta · Trainer

· Fixed client (web browser)
· Logic is usually mainly on the backend components
· Client-side application code is usually coded with interpreted languages
· Provisioned directly from the application server

· Custom compiled client · Logic is usually divided
between client and backend · Client-side application code can be interpreted or compiled · Provisioned from a trusted third party

It's almost impossible to properly test a complex mobile application without skills in:
· Reversing (compiled Java/C code for Android,ObjectiveC/Swift code for iOS applications)
· Instrumentation and debugging
· Development of custom plugins for your favorite HTTP Proxy (Burp Suite, OWASP ZAP)

· Suite of tools that helps penetration testers during assessments · It contains a lot of powerful tools: HTTP Proxy, Intruder (fuzzer),
a great automatic Scanner and a Repeater tool · Furthermore, it offers a server very useful to test external
service interactions (Collaborator) and a excellent session manager · It exports APIs to extend its functionalities, and consequently a huge number of plugins have been released by various developers to aid pentesters in almost any situation · It is de-facto standard for web application security testing.

From ZERO NIGHTS - http://2015.zeronights.org/assets/files/23-Ravnas.pdf

· Let's take as an example a mobile application that uses symmetric crypto with random keys in addition to TLS to encrypt the POST bodies of all requests
· These random keys could be generated from a secret stored inside mobile device's protected areas (Secure Enclave)
· Also, supposing we know the secrets and all the details regarding the employed encryption algorithm, a complex Burp Suite plugin would be necessary to decrypt incoming requests and encrypt outgoing ones

· It acts as a bridge between Burp Suite and Frida
· Allows to call mobile application's functions directly from Burp Suite using Frida
· It is possible to code simple Burp Suite plugins that call mobile application's functions in order to execute complex tasks (for example encryption, hashing, signing, encoding) without having to fully understand how these complex tasks are accomplished and without having to reimplement them in our plugin

Tester notebook Burp Suite
Brida
(Brida.jar)
Custom plugin with Brida stub (optional)

Pyro4
Pyro4 Server
(bridaService Pyro.py)

Mobile device Frida
Frida server
(script.js)

· Thanks to the «rpc» object of Frida it is possible to expose RPC-style functions
· From Burp Suite we call a Pyro function that acts as a bridge
· Pyro calls the selected Frida exported function and returns the result back to Burp Suite

· Dedicated tab to call Frida exported functions and methods
· Context menu entries that call Frida exported functions
· Dedicated tab that generates code stubs for custom plugins

· Integrated JS editor
· Integrated Frida console
· Dedicated tab to analyze target binary
· Graphical hooking of functions for inspection
· Graphical hooking of functions for replacement

· Objective-C classes and methods graphical tree (iOS only)
· Java classes and methods graphical tree (Android only)
· Library imports and exports on all Frida supported platforms!
· «Search» functionality on Objective-C and library imports and exports (Java not supported due to Frida's current limitation on the «API Resolver» component)

· By right-clicking on a method (Objective-C or Java) or an exported function it is possible to «inspect» that method/ function
· From the click onwards, every time that the inspected function is executed in the binary, input parameters and return value will be printed out in the integrated output console
· It is also possible to inspect an entire Objective-C or Java class (all the contained methods will be hooked)
· «Print Backtrace» option is also available

· By right-clicking on a method Objective-C or Java) or an exported function it is also possible to change the return value of that method/ function
· Integer, String, Boolean and pointer are the supported return types, at the moment
· This functionality can be very useful to quickly bypass some security features (like «SSL pinning» or «Jailbreak/Root check»)

· An application that encrypts the body of all requests and responses with a custom and heavily-obfuscated algorithm
· An application that signs the body of all requests
· An application that periodically executes a challengeresponse routine with the backend, computing the response based on complex and heavily-obfuscated logic

· Testing applications that employ complex security features as the ones described in the previous slide is a mess!
· The job usually requires:
· A lot of reversing to understand encryption and other security features (often heavily obfuscated!)
· A lot of coding, in order to re-implement those features in a Burp Suite plugin
· ... because if we don't implement a plugin for our favorite HTTP proxy we are not able to thoroughly pentest the backend!

· Handling these situations with Brida is simpler and faster:
· The reversing job is aimed only at finding functions used by the application to implement security features without the need to understand how these features are implemented nor how they work!
· We will still need to code a Burp Suite plugin, but a very simple one with few lines of code which only calls the mobile functions instead of having to re-implement them, thanks to Brida and Frida!
· We add an exported function to Frida JS that calls the mobile functions we need, and we call that exported function from our plugin

· Three different use cases
· Each use case is a simplification of a real situation we faced during penetration tests conducted on mobile applications
· In all those situations Brida was almost essential

· We have a simple iOS app that provides a search functionality
· If we click on the «Search» button, the results are printed below the search form

EK(«apple») Search

EK(«apple») Search

EK(«Red apple»)

Response

Request: EK(«apple») Response: EK(«Red apple»)

EK(«Red apple») Response

No inspection - NO tampering

decrypt( EK(«apple»))

EK(«apple») EK(«Red apple»)

EK(«apple») Search

EK(«apple») Search

EK(«Red apple») Response

Request: «apple» Response: «Red apple»
inspection

EK(«Red apple») Response

«lemon»

encrypt( EK(«lemon»))

EK(«apple») Search

EK(«lemon») Search

EK(«Lemon Sicily»)

Response

Old request: «apple» New request: «lemon»

tampering

EK(«Lemon Sicily») Response

· We have a simple iOS app with two buttons: «Register» and «Make request»
· Once registered, by clicking on the «Make request» button it is possible to get a Super Mario quote!

deviceId Register
OK

deviceId Register
OK

deviceId Get quote
Quote

deviceId Get quote
Quote

Get quote Challenge Response
Quote

Get quote Challenge Response
Quote

Request 1 Request ... Request 10 Request 11 Request 12 Request 13

Quote 1 Quote ... Quote 10 Challenge Challenge Challenge

No scanner - NO intruder

getResponse( Challenge)

Challenge

Request 10 Request 11
Response Request 12
OK SCANNER ­ OK INTRUDER

Quote 10 Challenge Quote 11 Quote 12

· We have a simple iOS app with a login form
· The application returns «User logged in» if the correct username and password are inserted, «Wrong username/password» otherwise

admin/EK(«password») Login

admin/EK(«password») Login

«User logged in» Response

«User logged in» Response

Request: admin/EK(«password»)

qwertee password 1234567 0000000 1111111
123qwe

Error Error Error Error Error Error

No scanner - NO intruder

encryptPassword («qwerty»)

qwerty

Ek(qwerty) Ek(password) Ek(1234567) Ek(0000000)
OK SCANNER - OK INTRUDER

Login failed Hello admin!
Login failed Login failed

· Brida repo: https://github.com/federicodotta/Brida · Brida releases: https://github.com/federicodotta/Brida/releases · Burp Suite: https://portswigger.net/burp · Frida: https://www.frida.re/ · Article that describes Brida (0.1):
https://techblog.mediaservice.net/2017/07/brida-advancedmobile-application-penetration-testing-with-frida/

CONGRATULATIONS MARIO!
AUTHORs FEDERICO DOTTA - Piergiovanni cipolloni
REVIEW MAURIZIO AGAZZINI - Marco Ivaldi
THANKS MATTIA VINCI
LICENSE CREATIVE COMMONS

Image LIST (ALL licensed UNDER CC 4.0)

http://pngimg.com/download/30587 http://pngimg.com/download/30532 http://pngimg.com/download/30516 http://pngimg.com/download/30540 http://pngimg.com/download/30595 http://pngimg.com/download/30521 http://pngimg.com/download/30534 http://pngimg.com/download/30545

http://pngimg.com/download/30551 http://pngimg.com/download/30555 http://pngimg.com/download/30548 http://pngimg.com/download/30539 http://pngimg.com/download/30480 http://pngimg.com/download/30588 http://pngimg.com/download/30584

Disclaimer
This presentation is neither owned by nor affiliated with Nintendo or the creators of the Mario franchise in any way. stuff related to super Mario is copyrighted by
Nintendo and other parties that have a direct proximity of relationship with the Mario franchise. The images used in this presentation are all released under Creative
commons 4.0 license.

