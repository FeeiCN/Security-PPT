FIRST CONTACT: New vulnerabilities in contactless payments

TO GOOD
To be true?

NEO BANKS
The big banking boom

SORT FACTS FROM FICTION
"I could accidently pay for someone else's shopping"

WE TAKE SECURITY
At face value

HAS FRAUD REDUCED?
"Contactless payments have resulted in a fraud reduction"

Sharks and Tigers

CONTACTLESS, A MODERN FORM OF PAYMENT?

NFC is(n't) different
o NFC includes legacy modes (magstripe) that CHIP didn't.
o NFC uses the same key and same areas of memory on the CHIP as CHIP inserted.

ARE PAYMENTS STANDARDISED?

EMV KERNELS

APDU

FORMAT OF COMMUNICATION
Value 2PAY.SYS.DDF 01
TLV = Tag Length Value

1. Reading The PPSE
?

Proximity Payment System Environment

2. Card responds with AID
" "

Application Identifier

3. Terminal selects AID

Application Identifier

4. Card provides PDOL
Currency Amount UN TTQ

Processing Options Data Object List

5. Terminal sends requested data

"GENERATE AC"

Currency Amount UN TTQ

MSD? EMV chip? qVSDC? CDCVM?

6. Card provides Application Cryptogram
ATC Track2 Equiv CTQ
Online Pin? Signature? CDCVM?

7. Terminal conducts risk analysis

CVM?

Config CTQ TTQ

"Limits" Floor limit No CDCVM CDCVM CVM
Acquirer

WHAT SECURITY MEASURES ARE IMPLEMENTED IN A TRANSACTION?

RISK ANALYSIS
· Card authentication · Transaction authorisation (cryptogram) · Cardholder verification (CVM)
Tap & Go limits
· regulated by country · set up on the terminal · are not mandatory

HOW "SOFT LIMITS" ARE IMPLEMENTED

HOW "HARD LIMITS" ARE IMPLEMENTED
UK VISA cards will ask to insert the chip if CVM is required

HOW "SOFT LIMITS" ARE IMPLEMENTED
3 different types of limits on the terminal

HOW "HARD LIMITS" ARE IMPLEMENTED

VISA HAS A VULNERABILITY

WHERE IS THE VULNERABILITY?
No currency/date
! No CTQ/TTQ

5. Terminal sends requested data

"GENERATE AC"

Currency Amount UN TTQ

£ 100 AC6F38DE CVM REQUIRED=1

Declines Transaction
6. Card provides Application Cryptogram
ATC Track2 Equiv CTQ
Declined

5. Terminal sends requested data

"GENERATE AC"

Currency Amount UN TTQ

£ 100 1203946 CVM REQUIRED=1

Change 1 to 0

6. Card provides Application Cryptogram

ATC Track2 Equiv CTQ

Cryptogram is sent to terminal!

7. Terminal conducts risk analysis

Fails on CTQ

Config CTQ TTQ

"Limits" Floor limit No CDCVM CDCVM CVM £30
Acquirer

CDCVM ­ CONSUMER DEVICE CVM
· Introduced with Apple Pay · Represents the idea of CVM · Fingerprint or PIN · Much higher than Tap & Go limits
(£5,500)

6. Card provides Application Cryptogram

ATC Track2 Equiv CTQ

Change from 0 to 1

Config CDCVM limit=£5,500

CDCVM=0

2. Change CTQ "CDCVM Performed" value from 0 to 1
ATC Track2 Equiv CTQ
CDCVM=1

1. Change TTQ "CVM Required" value from 1 to 0

Currency Amount UN TTQ

CVM REQUIRED=0

Acquirer

Demo

VALUE - £95,000,000 VOLUME - 434,991

HOW MANY ARE AFFECTED?

All VISA cards all cryptograms
are affected
Only 2 banks blocked £31 transactions*
* can be bypassed

12 VOISnAlyc2ards UK, EU, US, Asia
Min - £31 Max - £100
Tested in multiple places

Raspberry PI

PN532

MITM PROXY FOR STEALTH
https://github.com/jmarroyo/ApduSenderContactLess https://github.com/dimalinux/SwipeYours

WHY IS ONLY VISA AFFECTED?

9f02 amount 5f2a currency 9f37 UN 82 AIP 9f36 ATC CVR (part of 9f10)

9f03 amount, other 95 TVR 9f1a terminal country 9a date 9c type 9f27 CID

£1.00

ALL BRANDS HAVE A VULNERABILITY

"GENERATE AC"

Currency Amount UN TTQ

£ 100 AC6F38DE CVM REQUIRED

What if this is weak?

"GENERATE AC"

Currency Amount UN TTQ

£ 100 AAAAAAAA CVM REQUIRED

What if this is predictable?

ATC Track2 Equiv CTQ
ATC increments with each transaction

Currency Amount UN

£ 10 AAAAAAAA

Currency Amount UN

£ 10 AAAAAAAA

Currency Amount UN

£ 10 AAAAAAAA

ATC Track2 Equiv
ATC Track2 Equiv
ATC Track2 Equiv

Block ATC jumping Block equal ATC

Allow ATC jumping Allow equal ATC

STEAL A CARD OR A TRANSACTION?

HOW MANY ARE AFFECTED?

It's not a VISA/MC issue
11 MC 7 VISA allow replay

O2n1lyM2C 10 VISA cards*
* UK, EU, US, Asia
Max delay - 11d Max replays - 12

SCA for contactless
Two-factor authentication Insert card and use PIN Should be made occasionally Cumulative limits (£150) Issuing bank is in charge

How to bypass SCA cumulative limits
Change the type of transaction Contactless becomes EMV
Pretend to be a phone With CDCVM flag
Be a phone

WHAT ABOUT CONSUMER DEVICES?

GPAY HAS A VULNERABILITY FOR VISA

CTQ "CDCVM Performed" value is always 1 for consumer devices
ATC Track2 Equiv CTQ
CDCVM=1

1. Change TTQ "CVM Required" value from 1 to 0

Currency Amount UN TTQ

CVM REQUIRED=1 0

Acquirer

CONCLUSIONS

U.S. ALSO AFFECTED
$50.00 ­ No CVM $10,000.00 - CDCVM
https://www.paypalobjects.com/webstatic/mobile/pph/sw_repo_app/us/miura/m010/prod/7/contactless.cfg

THE GOOD NEWS

Safe inside

BLAME GAME

Hot potato "ouch"

IN CONCLUSION

Three vulnerabilities Visa will not issue a fix Google will not issue a fix Contactless, less secure than CHIP Not all card brands are the same Contactless fraud is real Someone has to pay...who will it be?

NEXT STEPS
· AmEx · WeChat · Secure Elements · HCE

PAYMENT RESOURCES
securingpayments.com leigh-annegalloway.com
Whitepaper available here

Illustrations (mostly)

CONTACT
@a66ot @L_AGalloway

