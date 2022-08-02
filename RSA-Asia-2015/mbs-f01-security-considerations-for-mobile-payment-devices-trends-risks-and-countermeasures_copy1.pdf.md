SESSION ID: MBS-F01
Security Considerations for Mobile Payment Devices: Trends, Risks and Countermeasures

Wouter Veugelen
Director­ Cyber Security PwC Australia @veugelenw

Suhas Desai
Associate Director ­ Cyber Security PwC India @desai_suhas

#RSAC

#RSAC
Agenda
 Trends in mobile payments  Security risks in mobile payments applications and devices  Mitigation strategy through secure SDLC  Mobile security best practices
Disclaimer: This session is intended to educate about security best practices for payment applications and devices. Indicative security risks mitigation practices are given to address it during SDLC.
2

#RSAC
Trends in Mobile Payments

#RSAC
Trends in Mobile Payments

 Mobile payments in US alone predicted to reach $37 billion in 2015 and $808 billion by 20191
 Technology companies currently dominate
 Payment methods:
 Contactless payments  Cardless cash withdrawal  QR code payments  Wearable payments

1: Business Insider, BI Intelligence, US in-store mobile payments volume, June 2015

4

Mobile Payments Architecture
Contactless Payments

Contactless mobile payment terminal
User Mobile / Wearable device
Mobile payment application

Wireless

Back-end infrastructure

Wireless
Mobile Banking

#RSAC

#RSAC
Attack Vectors against Mobile Payment Devices
 Compromise of the mobile payment device  Phishing  Attacks directed through physical interfaces (USB)  Attacks directed through wireless interfaces (e.g. Wifi, Bluetooth, NFC,...)
 Compromise of the mobile payment application  Mobile application security vulnerabilities  Local device storage vulnerabilities  Server side web application or web services security vulnerabilities
 Compromise of the payment terminal infrastructure  Direct attacks against wireless or physical interfaces  Infrastructure security vulnerabilities  Embedded device security vulnerabilities  Application security vulnerabilities
 Compromise of the back-end infrastructure
6

#RSAC
Common Security Vulnerabilities

· Insecure fingerprint/card/iris data in storage / transit - captured through add-on devices
· Insecure Connection with Parent Device

· Weak access control to protect application functionality
· Weak authentication or session management
· Weak control to prevent intercept ion and manipulation of message traffic
· Injection vulnerabilities due to improper coding practices

· Weak authentication and authorisation controls
· Missing OS patches · Insufficient OS configuration hardening
· Insecure storage of critical information · UI impersonation though local data storage manipulation

· Weak encryption / clear text or encoded payloads
· Insufficient message integrity checks
· Lack of replay protection · Missing transaction authentication
checks
· Insecure cryptography key storage and usage · Data logging information disclosure

7

Security risks in Mobile

Payments Apps, Devices ,

#RSAC

Communication Channels &

Add-on Devices

#RSAC
Mobile Device Risks
I. Direct attack via physical interfaces (USB)
Wirelurker · Malware that monitors for, and attacks iOS
devices via USB on OSX
· Installs third-party applications or automatically generated malicious applications onto the device
· On non-jail broken iOS devices through enterprise provisioning. creation of enterprise provisioning profiles on their non-jail broken iPhones and iPads. A user would then need to manually launch the installed app, then tap "Trust"
9

#RSAC
Mobile Device Risks

II. Direct attack against wireless interfaces

Mobile Pwn2own · Every year at Mobile Pwn2own security
researchers aim to obtain remote privileged access to the latest generation of smart phones, either through a browser based exploit, or through an attack against the wireless interfaces (e.g. Wifi, Bluetooth, NFC). · Last event mobile Pwn2own event outcome:
· Android: Privileged access from NFC and Wifi
· iPhone: Privileged access from Wifi/Browser

Bluetooth LE

· Used by wearable devices

· Key exchange can be intercepted and traffic

decrypted

10

Ubertooth One

Proxmark3

Major risks in Mobile Applications

I. Insecure data storage

Authentication credentials

· Important data is not stored encrypted by the application (e.g. application configuration files, back-end database)
· Reliance on operating system security controls alone (e.g. keychain)
· Allowed privilege escalation within the application
· Allowed unauthorised access to PII

#RSAC
SQL database credentials

Plaintext application configuration settings 11

#RSAC
Major risks in Mobile Applications
II. Insecure payload

· Access to payment devices settings, transaction information that can be tampered with in transit

Use of basic encoding methods

12

#RSAC
Major risks in Mobile Applications

III. Reverse engineering

Authentication Bypass by patching the application

· Payment device root/jailbreak · Extract mobile application from the payment
device · Use decompilers and disassemblers to
application source code and understand business logic · Sensitive data disclosure
· e.g.: Extract certificates to bypass authentication
· Patch the application · e.g.: Always accept biometrical authentication (e.g. Touch ID) · e.g.: Disable jailbreak detection, application integrity checks, certificate pinning, debugger detection

Embedded Cryptographic keys 13

#RSAC
Major risks in Payment Devices

I. Unrestricted access to setting

Payment application

· No kiosk mode · Access to device settings · Root this device · View change file structure , settings, database · Access mobile payment application binary · Access logs

14

#RSAC
Major risks in Payment Devices

II. Communication Channels ­ Application SMS

· Application SMS

Clear text parameters

· Configure GSM Modem with Valid MSISDN

· Capture the SMS

· View /Modify SMS

· This is restricted scenario ­ Need SMSC, Application SMS generation and Older SMPP protocol Support

15

#RSAC
Major risks in Payment Devices
III. Communication Channels ­ USSD

· USSD Aggregators · USSD is secure over GSM channel · Review USSD data at aggregators · Review data in transit from aggregators to
payment gateways · Attempt XML injections

Analyse XML payload and perform XML injection

16

#RSAC
Major risks in Payment Devices
IV. Communication Channels ­ Bluetooth

· Bluetooth device is integrated on the payment device
· Verify pairing mechanism
· Verify discovery
· Verify auto-connect

Pairing without PIN CODE

17

#RSAC
Major risks in Payment Devices

V. Add-on devices ­ Fingerprint Scanner & Printers

· Fingerprint Validations

Printer Pairing without PIN / CODE and invalid receipt print

· Printer discovery and connections

· Fingerprint data storage

· Fingerprint data in transit

Fingerprint data storage and data transfer 18

Mitigation Strategy through

#RSAC

Secure SDLC

#RSAC
Program!
main() { int i=7; printf("%d",i++*i++); }
20

#RSAC
Common mistakes in source code

During payment application's source code development, below are common mistakes :
1. Hardcoded sensitive data 2. Cryptography usage 3. Exception & Error Handling 4. Logging 5. Improper Code Signing 6. Permissions 7. Configuration Files 8. Session Management

1 Hardcode PII, Cryptography Keys
2 Clear text messages , payloads
3 Session Management & Secure Release
Manifest Files Permissions Device Logs Code Signing Session management in on-offline modes

21

Secure SDLC Approach

Define Security Principals

Secure Development

#RSAC
Assess , Remediate and Secure Release

Secure Design

Mobile Apps Design local storage, communication channels and Platforms security

Understanding Understand mobile payment eco-system , business logic and customer usage

Design and Architecture Define security principals and incorporate it in design documents and architect

Secure Code
Payment Devices Design device OS and App security
Source Code Apply OWASP Mobile Security guidelines in source code development
Assessment & Secure release

22

Secure Release Ensure code signing, server security, device security controls and incidence management
Assessment & Remediation Assess Device and Apps and remediate security findings. Implement reusable components

Mobile Security best

#RSAC

practices

#RSAC
Mobile Security ­ Best Practices

Secure distribution and provisioning
Secure data integration
Prevent access to paid resources
Secure backend services
Protect data in transit

Authentication

Securing Mobile Apps

Authorisation
Session management Code Obfuscation

Data Storage & Protection

24

#RSAC
Mobile Security ­ Best Practices
 Authentication , Authorization and Session Management
 Strong password policy  Validate password and sessions if application needs to work in offline mode  Use salted password  CAPTCHA during registration  Unique session tokens to form valid and unique message payloads  NIST approved encryption/hashing algorithms  Two factor authentication (in case of financial transactions to be performed.)  Lower timeout for inactive session  Validate all messages/payloads received at backend / mobile application server and
prevent message replay attacks. These messages/payloads should be encrypted and should have combination of padding elements, session identifiers and timestamps.
25

#RSAC
Mobile Security ­ Best Practices
 Code Obfuscation
 Obfuscate all sensitive application code using either 3rd party commercial software or open source solutions where feasible
 Implement anti-debugging techniques  Ensure logging is disabled as logs may be interrogated other applications with read logs  Hide executable code using Address Space Layout Randomization (ASLR)
26

#RSAC
Mobile Security ­ Best Practices
 Data Storage and Protection
 Implement data encryption/hashing on the device and server.  Server side stored passcode to encrypt local keychain entries. Encrypted keychain values are send to the server
 Use NIST approved encryption standard algorithms to encrypt the sensitive data  Encryption keys shall never be in RAM. Instead, keys should be generated real time for
encryption/decryption as needed and discarded each time.  No sensitive data (e.g. passwords, keys etc.) in cache or logs  Use remote wipe APIs .  Do not reveal UDID, MSISDN, IMEI and PII
27

#RSAC
Mobile Security ­ Best Practices
 Protect Data in Transit
 Use secure communication channels  Use CA provided Certificates  Do not disable or ignore SSL chain validation  Verify communication channels (USSD, SMS, GPRS, IVRS) security (e.g. Secure SMP
protocol usages in case of SMS)
28

#RSAC
Mobile Security ­ Best Practices
 Secure backend services and the platform
 Implement Secure Backend API'S or services  Secure data transfer between the mobile device and web-server back- ends and other
external interfaces  Server and infrastructure hardening  Maintain and monitor application server logs  Access control for mobile platform
29

#RSAC
Mobile Security ­ Best Practices
 Prevent unauthorised access to paid-for resources
 Restrict use of internal APIs (premium rate phone calls, roaming data , NFC payments) to have privileged access on the user's device
 Ensure that wallet API call backs do not pass clear text account/pricing/ billing/item information.
 Logs shall be protected from unauthorized access.  Check for anomalous usage patterns in paid-for resource usage and trigger re-
authentication
30

#RSAC
Mobile Security ­ Best Practices
 Secure data integration with third party services and applications
 Validate the third party code/libraries integration  Consent mechanism during application install, data transit and opt-out functionalities.
31

#RSAC
Mobile Security ­ Best Practices
 Secure distribution and provisioning of mobile applications
 Provide applicable security updates, code fixes regularly  Distribute properly signed apps through authorized download centres only
32

#RSAC
Top 5 Practical Mitigations
 Server-side authentication for all sensitive information.  Sensitive local data storage encrypted with user secret.  Rolling key authentication linked to authorised device id.  Code obfuscation  Jailbreak detection
33

#RSAC
Thank You!
34

