Compromising online services by cracking voicemail systems
Martin Vigo
@martin_vigo | martinvigo.com

Amstrad CPC 6128 Captured while playing "La Abadía del crímen"
Martin Vigo
Product Security Lead
 From Galicia, Spain

Research | Scuba | Gin tonics

@martin_vigo - martinvigo.com

History

Year 1983 "Voice Mail" patent is granted

History: hacking voicemail systems
· When?
 · In the 80s

· What?
 · Mostly unused boxes that were part of business or cellular phone systems

· Why?
 · As an alternative to BSS
 · Used as a "home base" for communication
 · Provided a safe phone number for phreaks to give out to one another
 · http://audio.textfiles.com/conferences/PHREAKYBOYS

How?
back to ezines

"There is also the old "change the message" secret to make it say something to the effect of this line accepts all toll charges so you can bill third party calls to that number"
Hacking Answering Machines 1990 by Predat0r

"You can just enter all 2-digit combinations until you get the right one" ...
"A more sophisticated and fast way to do this is to take advantage of the fact that such machines typically do not read two numbers at a time, and discard them, but just look for the correct sequence"
Hacking Telephone Answering Machines by Doctor Pizz and Cybersperm

"Quickly Enter the following string: 1234567898765432135792468642973147419336699 4488552277539596372582838491817161511026203
040506070809001 (this is the shortest string for entering every
possible 2-digit combo.)"
Hacking AT&T Answering Machines Quick and Dirty by oleBuzzard

"Defaults For ASPEN Are: (E.G. Box is 888) ....
Use Normal Hacking Techniques: ------------------------------i.e. 1111 | \|/ 9999 1234 4321"
A Tutorial of Aspen Voice Mailbox Systems, by Slycath

Voicemail security in the 80s
· Default passwords
 · Common passwords
 · Bruteforceable passwords
 · Efficient bruteforcing sending multiple passwords at once
 · The greeting message is an attack vector

Voicemail security today
checklist time!

Voicemail security today

Default passwords

· Common passwords
 · Bruteforceable
passwords

· Efficient bruteforcing
by entering multiple passwords at once

· The greeting message
is an attack vector

· AT&T
 · 111111

· T-Mobile
 · Last four digits of the phone number

· Sprint
 · Last 7 digit of the phone number

· Verizon
 · Last 4 digits of the phone number
 · According to verizon.com/support/
smallbusiness/phone/ setupphone.htm

Voicemail security today

Default passwords


2012 Research study by Data Genetics http://www.datagenetics.com/blog/september32012

Common passwords


· Bruteforceable
passwords


· Efficient bruteforcing
by entering multiple passwords at once


· The greeting message
is an attack vector

Voicemail security today

Default passwords

Common passwords

Bruteforceable passwords

· Efficient bruteforcing
by entering multiple passwords at once

· The greeting message
is an attack vector

· AT&T
 · 4 to 10 digits

· T-Mobile
 · 4 to 7 digits

· Sprint
 · 4 to 10 digits

· Verizon
 · 4 to 6 digits

Voicemail security today

Default passwords

Common passwords

Bruteforceable passwords

Efficient bruteforcing by entering multiple passwords at once

· The greeting message
is an attack vector

· Can try 3 pins at a time
 · Without waiting for
prompt or error message

voicemailcracker.py
bruteforcing voicemails fast, cheap, easy, efficiently and undetected


voicemailcracker.py
· Fast
 · Uses Twilio's services to make hundreds of calls at a time

· Cheap
 · Entire 4 digits keyspace for $40
 · A 50% chance of correctly guessing a 4 digit PIN for $5
 · Check 1000 phone numbers for default PIN for $13

· Easy
 · Fully automated
 · Configured with specific payloads for major carriers

· Efficient
 · Optimizes bruteforcing
 · Tries multiple PINs in the same call
 · Uses existing research to prioritize default PINs, common PINs, patterns, etc.

Undetected

Straight to voicemail
· Multiple calls at the same time
 · It's how slydial service works in reality

· Call when phone is offline
 · OSINT
 · Airplane, movie theater, remote trip, Do Not Disturb
 · HLR Records
 · Queryable global GSM database
 · Provides mobile device information including connection status

· Use backdoor voicemail numbers · No need to dial victim's number!
 · AT&T: 408-307-5049
 · Verizon: 301-802-6245
 · T-Mobile: 805-637-7243
 · Sprint: 513-225-6245

voicemailcracker.py
· Fast
 · Uses Twilio's services to make hundreds of calls at a time

· Cheap
 · All 4 digits keyspace under $10

· Easy
 · Enter victim's phone number and wait for the PIN
 · Configured with specific payloads for major carriers

· Efficient
 · Optimizes bruteforcing
 · Tries multiple PINs in the same call
 · Uses existing research to prioritize default PINs, common PINs, patterns, etc.

· Undetected · Supports backdoor voicemail numbers

Demo
bruteforcing voicemail systems with voicemailcracker.py

Impact
so what?

What happens if you don't pick up?

Voicemail takes the call and records it!

Attack vector
1. Bruteforce voicemail system, ideally using backdoor numbers
 2. Ensure calls go straight to voicemail (call flooding, OSINT,
HLR records)
 3. Start password reset process using "call me" feature
 4. Listen to the recorded message containing the secret code
 5. Profit!
voicemailcracker.py can do all this for you!

Demo
compromising WhatsApp

We done? Not yet...

User interaction based protection
Please press any key to hear the code... Please press [ARANDOMKEY] to hear the code...
Please enter the code...

Can we beat this currently recommended
protection?

Hint

Another hint
Default passwords

Common passwords

Bruteforceable passwords

Efficient bruteforcing by entering multiple passwords at once

· The greeting message
is an attack vector

We can record DTMF tones as the greeting
message!

Attack vector
1. Bruteforce voicemail system, ideally using backdoor numbers
 2. Update greeting message according to the account to be hacked
 3. Ensure calls go straight to voicemail (call flooding, OSINT, HLR
records)
 4. Start password reset process using "call me" feature
 5. Listen to the recorded message containing the secret code
 6. Profit!
voicemailcracker.py can do all this for you!

Demo
compromising Paypal

Vulnerable services
small subset

Password reset

2FA

Verification

Open source

voicemailcracker.py limited edition
· Support for 1 carrier only
 · No bruteforcing
 · Change greeting message with specially crafted
payloads

· Retrieve messages containing the secret temp codes
Git repo: https://github.com/martinvigo

Recommendations

Recommendations for online services
· Don't use automated calls (or SMS) for security purposes
 · If not possible, detect answering machine and fail
 · Require user interaction before giving the secret

· with the hope that carriers ban DTMF tones from greeting messages

Recommendations for carriers
· Voicemail disabled by default
 · and can only be activated from the actual phone or online

· No default PIN
 · Don't allow common PINs
 · Detect abuse and bruteforce attempts
 · Don't process multiple PINs at once
 · Eliminate backdoor voicemail services 

· or don't allow access to login prompt from them

Recommendations for you
· Disable voicemail
 · or use longest possible, random PIN

· Don't provide phone number to online services unless
strictly required

· Use only 2FA apps

TL;DR
Automated phone calls are a common solution for password reset, 2FA and verification services. These can be compromised by leveraging old
weaknesses and current technology to exploit the weakest link, voicemail systems

Strong password policy 2FA enforced
Abuse/Bruteforce prevention A+ in OWASP Top 10 checklist Military grade crypto end to end
Lots of cyber

Password reset | 2FA | Verification over phone call

THANK YOU!
@martin_vigo martinvigo.com martinvigo@gmail.com linkedin.com/in/martinvigo github.com/martinvigo youtube.com/martinvigo

