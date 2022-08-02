SESSION ID: IDY-F02
12 Ways to Hack MFA
Roger A. Grimes
Data-Driven Defense Evangelist KnowBe4, Inc. @rogeragrimes

#RSAC

Roger A. Grimes
Data-Driven Defense Evangelist
KnowBe4, Inc.

#RSAC
About Roger
· Data-Driven Defense Evangelist for KnowBe4, Inc. · 30-years plus in computer security · Expertise in host and network security, IdM, crypto,
APT, honeypots, cloud security
· PKI, smartcards, MFA, biometrics, since 1998 · Consultant to world's largest and smallest
companies and militaries for decades
· Previous worked for Foundstone, McAfee, Microsoft · Written 10 books and over 1000 magazine articles · InfoWorld and CSO weekly security columnist since
2005
Certifications passed include: · CPA · CISSP, CISM, CISA · MCSE: Security, MCP, MVP · CEH, TISCA, Security+, CHFI · yada, yada

#RSAC
Today's Presentation
· Multi-Factor Authentication Intro · Hacking MFA · Defending Against MFA Attacks

Multi-Factor Authentication Intro

#RSAC
Introduction to Multi-Factor Authentication

Factors

· Something You Know · Password, PIN, Connect the Dots, etc.
· Something You Have · USB token, smartcard, RFID transmitter, dongle, etc.
· Something You Are · Biometrics, fingerprints, retina scan, smell

· Location, behavior, etc.

#RSAC
Introduction to Multi-Factor Authentication

Factors

· Single Factor · Two Factor (2FA) · Multi-Factor (MFA)

· 2-3 factors

· Two or more of the same factor isn't as strong as different types of factors

Main MFA Types

#RSAC
Introduction to Multi-Factor Authentication
Implementation in:
· "In-Band" · Factor sent/validated using same channel as your authentication access check/app
· "Out-of-Band" · Factor sent/validated using separate communication channel

#RSAC
Introduction to Multi-Factor Authentication

Auth vs. Auth

1-way vs. 2-way Authentication can be: · One-way
· server-only or client-only · Most common type · Vast majority of web sites use one-way authentication, where server has to prove its identity to
client before client will conduct business with it · With MFA, client is usually proving identity to server
· But because server is not authenticated, rogue servers can be involved · Two-way (mutual)
· Both server and client must authenticate to each other · Not as common, but more secure · Two-way may use different auth methods and/or factors for each side

#RSAC
Introduction to Multi-Factor Authentication

Factors

· All things considered, MFA is usually better than 1FA · We all should strive to use MFA wherever and whenever possible

· But MFA isn't unhackable

First, we need to understand some basic concepts to better understand hacking MFA

#RSAC

Introduction to Multi-Factor Authentication

Auth vs. Auth

· Identifier/Identity · Unique label within a common namespace · indicates a specific account/subject/user/device/group/service/daemon, etc.
· Authentication

· Process of providing one or more factors that only the subject knows, thus proving ownership and control of the identity
· Authorization

· Process of comparing the now authenticated subject's access (token) against previously permissioned/secured resources to determine subject access

#RSAC

Introduction to Multi-Factor Authentication

Auth vs. Auth

Hugely Important Point to Understand · No matter how I authenticate (e.g. one-factor, multi-Factor, biometrics, etc.),
rarely does the authorization use the same authentication token
· They are completely different processes, often not linked at all to each other
· Many MFA hacks are based on this delineation For example · Even if I authentication to Microsoft Windows using biometrics or a
smartcard, after I successfully authenticate, an LM, NTLM, or Kerberos token is used for authorization/access control · No matter how I authenticate to a web site, the authorization token is likely to be a text-based cookie (e.g. session token)

Hacking MFA

General

#RSAC
MFA Hacks
Main Hacking Methods · Social Engineering · Technical Attack against underlying technology
· Some of the attacks are both · Often insecure transitioning between linked steps (e.g. identity,
authentication, and authorization)
Some MFA solutions are better than others, but there is no such thing as "unhackable"

Network Session Hijacking

#RSAC
MFA Hacks
· Usually requires Man-in-the-Middle (MitM) attacker · Attacker puts themselves inside of the communication stream
between legitimate sender and receiver · Doesn't usually care about authentication that much · Just wants to steal resulting, legitimate access session token after
successful authentication · On web sites, session tokens are usually represented by a "cookie"
(a simple text file containing information unique for the user/device and that unique session) · Session token usually just good for session

Network Session Hijacking

#RSAC
MFA Hacks
Network Session Hijacking Proxy Theft 1. Bad guy convinces person to visit rogue (usually name-alike)
web site, which proxies input to real web site 2. Prompts user to put in MFA credentials 3. User puts in credentials, which bad guy relays to real web site 4. Bad guy logs into real site, and drops legitimate user 5. Takes control over user's account 6. Changes anything user could use to take back control

#RSAC

MFA Hacks

Network Session Hijacking

Kevin Mitnick Hack Demo

https://blog.knowbe4.com/heads-up-new-exploit-hacks-linkedin-2-factor-auth.-see-this-kevin-mitnick-video

#RSAC

MFA Hacks

Network Session Hijacking

Real-World Example 1. x

#RSAC

MFA Hacks

Network Session Hijacking

Real-World Example

https://newsroom.mastercard.com/2018/01/17/dispelling-the-myths-the-reality-about-contactless-security-2

Endpoint Attacks

#RSAC
MFA Hacks
Man-in-the-Endpoint Attacks If endpoint gets compromised, MFA isn't going to help you · Attacker can just do everything they want that the user is
allowed to do after successful authentication · Start a second hidden browser session · Directly steal session cookies · Insert backdoors · Invalidate protection all together

Endpoint Attacks

#RSAC
MFA Hacks
Man-in-the-Endpoint Attacks · Start up a second session that the user isn't even aware
· Ex. Bancos trojans

Subject Hijack

#RSAC
MFA Hacks
· Every MFA token or product is uniquely tied to a subject that is supposed to be using the MFA device/software
· If the hacker can take over the subject's identifier within the same namespace, they may be able to use stolen identifier with another MFA token/software
· And system will allow a completely unrelated MFA token/software to authenticate and track the fake user as the real user across the system
· Examples: · Email hijacking · Smartcard/Active Directory hijacking

Subject Hijack Example Summary

#RSAC
MFA Hacks
Example Attack ­ Microsoft Smartcard Identifier Hijacking - Summary Active Directory integrated smartcards are linked to UPNs 1. Low-privileged HelpDesk admin switches UPNs with SuperAdmin 2. HelpDesk admin logs in using their own HelpDesk smartcard and PIN 3. Viola! HelpDesk admin becomes SuperAdmin, including all group
memberships 4. HelpDesk performs malicious actions 5. System tracks all actions as SuperAdmin 6. When HelpDesk is finished, they logout, and switch UPNs back. No one
knows the difference Does your log mgmt. system track and alert on UPN updates?

#RSAC
MFA Hacks

Subject Hijack Example Demo Video

Example Attack ­ Microsoft Smartcard Identifier Hijacking

https://youtu.be/OLQ3lAMuokI

Subject Hijack

#RSAC
Subject Hacks
Defenses · Realize that any critical attribute (like subject) involved with
authentication can be abused · Review and least privilege permissions on critical attributes
· For example, UPN in AD allow to change is given to: Enterprise Admins, Domain Admins, Administrators, System, and anyone with Full Control, Write, or Write Public-Information in AD
· Audit and alert on critical attribute changes · Use MFA systems with 1:1 mappings

SIM Swapping

#RSAC
MFA Hacks
SIM Basics · SIM stands for Subscriber Identity Module · Most cell phone SIM cards store the cell phone network's
information and the subscriber's (user/owner) information, plus can store app data · If you move the SIM card (or its info) to another cell phone, it transfers your phone number and other info to that other cell phone · Once done, "old" phone stops working

SIM Swapping Attacks

#RSAC
MFA Hacks
· Many, especially early, MFA methods included sending additional authentication code via a user's cell phone short message service (SMS)
· A SIM swapping attack can steal/transfer the user's cell phone operations to another phone, allowing the attacker to get the sent the SMS code

· NIST (in SP 800-63) does not accept SMS codes as valid authentication because of how easy it is to hack

SIM Swapping Attacks

#RSAC
MFA Hacks
· Has been successfully used in many of the world's biggest personal attacks

SIM Swapping Attacks

#RSAC
MFA Hacks
SIM Swapping Attack · Attackers (using different methods) successfully transfer your SIM
information to their cell phone · Often done by using social engineering:
· To your cell phone network provider's tech support · At local phone store or over phone · May start with successful vishing/phishing to victim to retrieve
necessary cell phone account info · Information may be collected by reviewing victim's social media
accounts

SIM Swapping

#RSAC
MFA Hacks
SIM Swapping Attack (con't)
· Once SIM criminals have gathered enough info on victim, they call/visit the victim's cellphone provider and claim that the SIM card has been lost or damaged or buy new phones using your identity
· They activate another SIM card/number using your info · Most vendors ask for additional information, that usually the thief
has learned, such as account pin/password, address, last four of ssn, and/or answers to password reset questions · Once transferred, thief has control of phone and SMS

SIM Swapping

#RSAC
MFA Hacks
SIM Swapping Attack (con't)
· Then thief logs into your MFA account, and gets sent SMS code, which they can respond with

SIM Swapping

#RSAC
MFA Hacks
SIM Swapping Attack (con't)
· Defense: Use non-SMS-based apps · App travels with authenticated user, not phone number or SIM · Can't be as easily transferred by 3rd party without your knowledge or participation · Not perfect, but stops easy SIM-swapping attacks

Duplicate Code Generator

#RSAC
MFA Hacks
· Most MFA code-generating tokens start with a (randomly) generated (permanently) stored "seed" or "shared secret" value, which is then incremented by some sort of counter/algorithm which generates all subsequent values · Known as one-time passwords (OTP) · "Will never be repeated again"
· Unique user/device identifier usually involved · May also use current time/date to "randomly" generated code good
only for a particular time interval · Known as time-based one-time passwords (TOTP)

Duplicate Code Generator

#RSAC
MFA Hacks
· Shared secret will always be present in at least two places (e.g. source database/verifier and device itself)
· Attackers that learn seed/shared secret and algorithm can generate duplicate/identical code generators that match the victim's code generator

Real-Life Example: Chinese APT, RSA, and Lockheed Martin attack

Duplicate Code Generator

#RSAC

MFA Hacks

· Shared secret will always be

present in at least two places

Taken from Cain & Abel hacking tool

(e.g. source database/verifier and

device itself)

· Attackers that learn seed/shared

secret and algorithm can

generate duplicate/identical code

generators that match the victim's

code generator

Not Required/ Downgrade Attacks

#RSAC
MFA Hacks
· If you still have a 1FA solution for a site or service, and it can still be used, then it's like you don't really have MFA
· Many sites and services that allow MFA, don't require it · If your MFA comes with a non-MFA "master key" or code, then
that code can be stolen · Which means attacker can use non-MFA credential to access · May allow both more secure and less secure MFA methods,
but you likely can't force only one method

Not Required/ Recovery Attacks

#RSAC
MFA Hacks
· ALL logon recovery methods are far less secure than MFA · Can bypass many MFA requirements by answering much less
secure password reset answers · Attackers can spoof your registered recovery phone number
and automatically be authenticate to some services/voicemail systems

Not Required/ Recovery Questions

#RSAC
MFA Hacks
The worst recovery method on the planet is password recovery questions · Usually REQUIRED by many web sites, you can't create a new
account without them

Not Required/ Recovery Questions

#RSAC
MFA Hacks
Problem: Answers can often be easily guessed by hackers · Great Google paper called Secrets, Lies, and Account Recovery: Lessons
from the Use of Personal Knowledge Questions at Google
· http://www.a51.nl/sites/default/files/pdf/43783.pdf · For example, some recovery questions can be guessed on first
try 20% of the time · 40% of people were unable to successfully recall their own
recovery answers · 16% of answers could be found in person's social media profile · Attack has been involved in many well known attacks (e.g. Sarah Palin's compromised email)

#RSAC

Not Required/ Recovery Questions

MFA Hacks
Solution: Never answer the questions with the real answers!

Unfortunate that means you have to record them somewhere else just like passwords (password managers help with this)

#RSAC
Rogue Recoveries

SMS Rogue Recovery

Hacking Into Your Email Using Recovery Methods
SMS Recovery Hack · Hacker Must Know Your Email Address · Hacker Must Know Your Phone Number

#RSAC
Rogue Recoveries

SMS Rogue Recovery

Hacking Into Your Email Using Recovery Methods
SMS Recovery Hack - Steps 1. Hacker sends you a text pretending to be from your email
provider asking for your forthcoming SMS PIN reset code

#RSAC
Rogue Recoveries

SMS Rogue Recovery

Hacking Into Your Email Using Recovery Methods
SMS Recovery Hack - Steps 2. Hacker forces your email account into SMS PIN recovery
mode

SMS Rogue Recovery

#RSAC
Rogue Recoveries
Hacking Into Your Email Using Recovery Methods
SMS Recovery Hack - Steps 3. You get text from vendor with your reset code, which you then
send to other number

#RSAC
Rogue Recoveries

SMS Rogue Recovery

Hacking Into Your Email Using Recovery Methods
SMS Recovery Hack - Steps 4. Hacker uses your SMS PIN code to login to your email
account and take it over

Note: To be fair, Google has some of the best recovery options of any email provider, including that it can send a non-SMS message to your phone before the hacker can even get to the SMS code screen to get Google to send an SMS message

SMS Rogue Recovery

#RSAC
Rogue Recoveries
Defenses
· Be aware of rogue recovery messages · Recognize when SMS recovery PINs should be typed into
browsers, not (usually) back into SMS · Use MFA when possible · Try to avoid alternate email-based recovery methods · Try to avoid SMS-based recovery based methods · Try to minimize public posting of phone numbers related to
your recovery account methods

Social Engineer Tech Support

#RSAC
MFA Hacks
· There have been many real-world instances where the user had MFA to a particular web site or service, maybe even required that it be used;
· And hackers socially engineered tech support into disabling it and resetting password, using other information they had learned
· Hackers like to use "stressor" events to achieve their goals · Humans just want to help, and will bypass policy and controls
to do so

Social Engineer Tech Support

#RSAC
MFA Hacks
Great Example Check out the "Crying baby" social engineering live demo video: https://www.youtube.com/watch?v=lc7scxvKQOo

Buggy MFA

#RSAC
MFA Hacks
2017 ROCA vulnerability · Sometimes a single bug impacts hundreds of millions of
otherwise unrelated MFA devices · Huge bug making any MFA product (smartcards, TPM chips,
Yubikeys, etc.) with Infineon-generated RSA key lengths of 2048 or smaller (which is most of them), easy to extract the PRIVATE key from public key. · Still tens to hundreds of millions of devices impacted

Defending Against MFA Attacks

Defenses

#RSAC
Defending Against MFA Attacks
Social Defenses · Realize nothing is unhackable · Include MFA hacking awareness into your security awareness
training · Share this slide deck with co-workers and mgmt. · Don't get tricked into clicking on rogue links · Block rogue links as much as possible · Make sure URL is legitimate

Defenses

#RSAC
Defending Against MFA Attacks
Technical Defenses · Enable REQUIRED MFA whenever possible · Don't use SMS-based MFA whenever possible · Use "1:1" MFA solutions, which require client-side to be pre-registered with
server · Use/require 2-way, mutual, authentication whenever possible
· Ex. FIDO U2F's Channel or Token Binding · Does your MFA solution specifically fight session token theft and/or malicious
replays (i.e. replay resistant) · Can your MFA vendor's support help be socially engineered? · Make sure MFA vendors use secure development lifecycle (SDL) in their
programming · Make sure MFA has "bad attempt throttling" or "account lockout" enabled

Defenses

#RSAC
Defending Against MFA Attacks
Technical Defenses (con't) · Spread factors across different "channels" or "bands" (in-band/out-band) · Protect and audit identity attributes used by MFA for unique identification of
MFA logons · Don't answer password reset questions using the honest answers. · Encourage and use sites and services to use dynamic authentication, where
additional factors are requested for higher risk circumstances · Understand the risks of "shared secret" systems · For transaction-based authentication, need to send user all critical details
out-of-band before confirmation is transmitted/required

Lessons

#RSAC
Key Takeaways
· MFA isn't unhackable · MFA does not prevent phishing or social engineering from
being successful · MFA is good. Everyone should use it when they can, but it
isn't unbreakable · If you use or consider going to MFA, security awareness
training has still got to be a big part of your overall security defense

Read More

For More Information
· Applied Cryptography Group · https://crypto.stanford.edu/
· Quest to Replace Passwords whitepaper · https://www.microsoft.com/en-us/research/wpcontent/uploads/2016/02/QuestToReplacePasswords.pdf
· Joseph Bonneau · http://jbonneau.com/
· NIST Digital Identity Guides · https://pages.nist.gov/800-63-3/
· Check to see if a web site supports MFA · https://twofactorauth.org/
· FIDO Alliance · https://fidoalliance.org/

#RSAC

#RSAC
Resources
» Learn More at www.KnowBe4.com/Resources «

#RSAC
Apply What You Have Learned Today
Today
­ Understand that any MFA solution can be hacked ­ Think about how you need to change technical and education solutions
After
­ Update security awareness training to include "MFA hack" awareness ­ Make sure management understands MFA is not a security "Holy Grail" ­ Select best-fit, hack-resistant, MFA solutions
56

