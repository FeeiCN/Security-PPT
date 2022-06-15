SESSION ID: IDY-F01
The Emperor's New Password Manager: Security Analysis of Password Managers

Zhiwei Li
* collaborated with Warren He, Devdatta Akhawe, and Dawn Song from UC Berkeley
Research Scientist Shape Security @liwaius

#RSAC

#RSAC
20 years later ...
2

#RSAC
3

#RSAC
4

#RSAC
Kids Cyber Safe?
5

#RSAC
Password Managers to the rescue
 Physically Effortless  Resilient to Phishing  Memorywise Effortless  Scalable for Users  Resilient to Physical Observation  Resilient to Throttled Guessing  Resilient to Unthrottled Guessing  Resilient to Leaks from Other Verifiers ...
6

Apps to Protect Your Array of Passwords

#RSAC

XXXX is a must-use freeware tool that supports multiple operating systems and browsers

XXXX Offers NSA-Level Protection for Your Passwords

Keep All of Your Logins Secure With XXXX

XXXX Never Forget a Password Again XXXX: Unbreakable Passwords That You Don't Have to Remember XXXX Surpasses Gmail for Top Productivity App XXXX Wins Best Mobile App at CES 2014

7

#RSAC
8

#RSAC
Are they truly secure?
 LastPass  RoboForm  My1login  PasswordBox  NeedMyPassword
9

#RSAC
How does it work?
Alice (User)
dropbox.com
10

#RSAC
Security Goals
 Master Account Security
 impossible for an attacker to authenticate as the user to the password manager
 Credential Database Security
 ensure the CIA of the credential database
 Unlinkability
 use of password manager should not allow colluding web applications to track a single user across websites
11

#RSAC
Threat model
 Web attacker
 control web servers  DNS domains  get a victim to visit controlled domains
12

#RSAC
Four classes of vulnerabilities

Bookmarklet

Web

Authorization

UI

Vulnerabilities Vulnerabilities Vulnerabilities Vulnerabilities

LastPass RoboForm

My1Login PasswordBox NeedMyPassword

Vulnerable Not discovered NA

NO product was safe against all four

13

#RSAC
Bookmarklet Vulnerabilities

#RSAC
Bookmarklet
 A bookmarklet is a snippet of JavaScript code
 install as a bookmark  when clicked, run in the context
of the current page  interact with a login form
15

#RSAC
Alice clicks bookmarklet, which includes _LASTPASS_RAND and h
16

#RSAC
Bookmarklet code is a stub that loads the main code from lastpass.com
17

#RSAC
Bookmarklet loads a LastPass page in an iframe
18

#RSAC
The iframe loads Alice's encrypted master key and encrypted credential for dropbox.com (specified
by a URL parameter). This is done using a <script> tag in the iframe.
19

#RSAC
PostMessage communicates the decryption key to the iframe, which decrypts the credential and
sends it back through PostMessage
20

#RSAC
LastPass Bookmarklet Attack
21

#RSAC
Leaking sensitive data into untrusted pages
 All password managers that support bookmarklet leak their credentials
 LastPass  RoboForm  My1login
22

#RSAC
Classic Web Vulnerabilities

#RSAC
Web Vulnerabilities
 Subtleties of the web platform  Focus on CSRF and XSS  CSRF vulnerabilities
 LastPass, RoboForm, and NeedMyPassword
 XSS vulnerability
 NeedMyPassword
24

#RSAC
LastPass CSRF Vulnerability
 OTP feature
 authentication code for the master account  only valid for one use
 Design flaw
25

#RSAC
h = hash(hash(alice|otp)|otp) rand_encrypted_key = encrypt(masterkey, hash(alice|otp))
26

OTP Attack

#RSAC
h = hash(hash(alice|otp)|any_otp) rand_encrypted_key = encrypt(dummy, hash(alice|any_otp))

The attacker can then log into Alice's master account to view unencrypted information and delete credentials
27

#RSAC
Authorization Vulnerabilities

#RSAC
Collaboration

 Ability to share passwords with a collaborator

Alice (User)

Bob (Collaborator)

 Alice requests to share a credential with Bob
 Password manager forwards the credential to Bob
 Both need accounts with the password manager

29

#RSAC
Authorization Vulnerabilities
 3 support credential sharing  Both My1login and PasswordBox
mistook authentication for authorization
30

#RSAC
31

#RSAC
PasswordBox
32

User Interface

#RSAC

Vulnerabilities

#RSAC
User Interface Vulnerabilities
 Resilient to Phishing
 a major benefit of password managers  detects application  (auto-)fill the right password
 Vulnerable
 LastPass  RoboForm
34

#RSAC
Logging into RoboForm
 Creates an iframe in the current web application to log in the user
 Attack
 block the iframe  spoof an authentication dialog  steal master credentials
iframe 35

#RSAC
LastPass UI Vulnerability
36

#RSAC
Mitigation

Apply Slide
 Bookmarklet Vulnerabilities
 loads the password manager code in an iframe  postMessage with the right target  consider DJS (Defensive JavaScript)
proposed by Karthikeyan Bhargavan
 Web Vulnerabilities
 Content Security Policy (CSP)  CSRF prevention
 Authorization Vulnerabilities
 simplify sharing logic
 UI Vulnerabilities
 manually open a new tab
38

#RSAC

#RSAC
Take Homes
 Design and implement with security in mind  Formalizing (better yet verifying) protocol pays off
39

#RSAC
Conclusions
 A wide spectrum of discovered vulnerabilities  logic mistakes  misunderstanding about the web security model  typical vulnerabilities like CSRF and XSS
 A single solution is unlikely
 Developing password manager entails a systematic, defense-indepth approach
40

#RSAC
Stay Tuned.
http://pepperword.com
41

