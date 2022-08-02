SESSION ID: CDS-R02
The Secret Life of Data: Protecting Sensitive Information, Mobile to Cloud

Dan Griffin
President JW Secure, Inc. @JWSdan

#RSAC

#RSAC
WWNSAD?
 Intelligence agencies have been public about:
o Inevitability of mobile computing o Support need for cloud-based services, even when using secret data
in the field
 What works for them can work for you

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC

#RSAC
Building blocks of security
 What is a TPM?  What is "measured boot"?  What is "remote attestation"?

Measured Boot +

#RSAC

Remote Attestation

#RSAC
What is measured boot?

#RSAC
What is remote attestation?

#RSAC
DEMO
 Sample application #1: reduce fraud in mobile/consumer scenarios
12

#RSAC
Cloud services demand ID
 Enterprise: BYOD  Consumer
o Targeted advertising o eCommerce, mobile banking, etc.
 Most user IDs are static & cached on a device
o That only works for low-value purchases o How do you improve ID for high-value purchases?
13

#RSAC
Low friction authentication
 Each additional screen requires user input
o Slows down the process while user re-orients o Causes more users to abandon the web site
 In contrast, progressive authentication
o Lets users investigate a site using just cookies o Defers questions until information is needed o Reduces user drop out from frustration
14

#RSAC
Splash screen
 The screen a user sees when app launched  Similar data in the launch tile
15

#RSAC
User sign in
 User name can be taken from cookie  Account details are hidden until the user enters a password
16

#RSAC
Enrollment: 1
 The first time the app is used the user must activate the app  When this button is pressed, an SMS message is sent to the phone # on file
17

#RSAC
Enrollment: 2
 After the user gets the pin from the SMS message, it is entered  After this, the user proceeds as with a normal sign-in procedure
18

#RSAC
After sign in
 The user sees all account information
19

#RSAC
User tries to move money
 When user goes to move $ out of account, the health of the device is checked
20

#RSAC
Remediation needed
 If the device is not healthy enough to allow money transfer, the user is directed to a site to fix the problem
21

#RSAC
Protecting cloud data with attestation
 Data or access key is hardware encrypted
 Key is bound to specific authenticated TPM  Device must be policy compliant for key to work  Otherwise data cannot be viewed and network resources cannot
be accessed

#RSAC
DEMO
 Sample application #2: protect cloud data
23

#RSAC
Policy-enforced file access
 BYOD  Download sensitive files from document repository  Leave laptop in back of taxi
24

#RSAC
Device authorization for SharePoint
25

#RSAC
Device authorization for SharePoint
26

#RSAC
Device authorization telemetry
27

#RSAC
Device authorization for SharePoint

SharePoint

ADFS

1
Registration Portal

Custom Attribute Store
62

Data Repository

3

Web Browser

4

5
Client Agent

Health Service

Client

28

#RSAC
Device authorization for SharePoint

SharePoint

1

4

Certificate Authority

Registration Portal

Web Browser

3

2
Client Agent

Registration Authority

Client

29

#RSAC
Weaknesses of TPM remote platform attestation
 Provisioning
o Secure supply chain? o TPM EK database o Patching delay and whitelist maintenance (firmware and drivers)
 Integrity of the TPM hardware
o Capping - electron microscopes o Migration trend from hardware to firmware

#RSAC
Attestation Data Flow Diagram

#RSAC
Recent developments
 Measurement-bound keys o "Trusted Tamperproof Time on Mobile Devices" o See http://www.jwsecure.com/dan
 Commercial availability o JW Secure StrongNet o Google Chromebook o Intel Trust Attestation Solution o Microsoft TPM Key Attestation

#RSAC
Next steps
 Audit current systems
o How do you prevent stolen credentials? o Do you depend on encryption alone? o Who has admin access to critical systems? o Is your BYOD policy managed tightly, or is it increasing your risk? o Are you relying on static passwords and traditional antivirus
programs? o Do you authenticate computers as well as users?

#RSAC
In summary, you can:
 Continuously enforce security policy in hardware, firmware and software
 Ensure that sensitive data is always encrypted--everywhere  Enable strong authentication of users and computers  Mitigate credential theft

#RSAC

#RSAC
Questions?
Call or email me with questions, or to request a demo of StrongNet: dan@jwsecure.com +1 206 683 6551 @JWSdan
JW Secure provides custom security software development services.

