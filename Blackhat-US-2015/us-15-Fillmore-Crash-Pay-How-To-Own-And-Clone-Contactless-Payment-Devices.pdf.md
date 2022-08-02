Crash and Pay: Owning and Cloning Payment Devices

Agenda
· Basics of an EMV payment transaction · Review of Attacks · Cloning A Mastercard · Cloning A VISA · EMV Issues · ApplePay · Tools Used · Software Developed · Key takeaways from this talk

Definitions

ATC

Application Transaction Counter

Monotonic counter of transactions performed

UN CVV/ CVC dCVV/ CVC3 TTQ PAN PSE AID
PDOL
AFL AIP

Unpredictable Number

Random number used in transaction

Card Verification Value (VISA)/ Card Verification Code (Mastercard) CVV3(MasterCard)/ dynamic CVV(Visa) Terminal Transaction Qualifiers (Visa) Personal Account Number Payment Systems Environment Application Identifier
Processing Data Options List
Application File Locator Application Interchange Profile

Used to prevent alteration of data on the card.
Used to prevent alteration of card data and prevent cloning of cards. Indicates what kind of card verification the terminal supports Account Number assigned to the user Tells terminal that the card is a banking card Tells terminal what brands the card supports (MasterCard, Visa etc.) List of tags we need the terminal to send the card (amount, UN etc.). Indicate what records the terminal needs to read. Field to tell the terminal what authentications the card supports

The Payment Transaction Flow

Transaction Initialization

Contactless Card

Terminal

6F2F840E325041592 E5359532E44444630 31A51DBF0C1A61184 F07A0000000041010 870101500A4D41535 44552434152449000
6F388407A00000000 41010A52D500A4D41 53544552434152448 701015F2D02656E9F 1101019F120A32382 044656772656573BF 0C059F4D020B0A900

00A404000E3250 41592E5359532E 444446303100
00A4040007A000 000004101000

Get Transaction Parameters and Records

Contactless Card

Terminal

771282025880940 C08010100100101 01180102009000
706A9F6C0200019F65021C 009F660203FE9F6B135444 XXXXXXXX0108D150220100 00000000000F9F6701059F 6206000000001C009F6306 0000000003FE5629423534 3434333433333031343630 3130385E202F5E31353032 3230313030303030303030 30303030309F640105900

80A8000002830000 00B2010C00

MasterCard Magstripe Transaction

Contactless Card

Terminal

771282025880940 C08010100100101 01180102009000

802A8E800412345 67800
770F9F610241179 F600204B09F3602 02E6900

MasterCard M/CHIP Transaction

Contactless Card

Terminal

7081A05713544434330146 0108D15022011920000000 000F5A0854443433014601 085F24031502285F250310 11235F280200365F340101 8C219F02069F03069F1A02 95055F2A029A039C019F37 049F35019F45029F4C089F 34038D0C910A8A0295059F 37049F4C088E0E00000000 0000000042031E031F039F 07023D009F080200029F0D 05F0508408009F0E050000 0000009F0F05F070848000 9F420200369F4A0182900 7081E08F01059F32010390 81B0B1F425CF818E9625C9 A6336C05D04DF2EF341C64 B47FA94AF66BFF42349E1C 56CA58C6715BEB39DE1F9B EE49234D9005FD65A7F3FF

00B2011400 00B2010C00

MasterCard M/CHIP Transaction

Contactless Card

Terminal

7081B39381B0A455185406 53E0EE09852748D010715F 130075B87A3C0B483C5297 D5DD3864ABFBEAF70EE6B3 A1FF829CCC44610D0972AC 67A6DB9A0D1F88C809DAE4 BA34AF5D3290D5AD128D28 D6B9B0D913D9571C2E53DD 702C5A4574B2E22F9B568D EE97688C89EF146CAE0DEF C5C8CAA66FE0AA519B4BCD 226DB89E1728B1105D8A1C AE35F9DF01FD05D13D7991 44C187968EEF600012DBC4 7672FFF80EA099DDB2DD5A 3CCF6E4D50307A358F3C53 848AF3B12257900
70049F470103900

00B2021C00 00B2010C00

MasterCard M/CHIP Transaction

Contactless Card

Terminal

7081949F46819022DC74BE C45F5C94B20A42260D7DF6 450CCA89BA64873A91DA5E 4EB12B112C71C1CEA58064 4EF61E315F06371924718D A74D5204F3489AAAA929F1 20E7CBC51DB0B25D0E7CFC DC74394E3630941C05BBDF C39898286F582190CD09D2 658B00565ED56C50C465EF BD7847E6162C913C5F6976 D24EBDC5719D9A1A809246 14DA7E5AD5E324C3798DC1 268C481BB66D42FC900
88E672EF9E10EA7E900

00B2021C00 0084000000

MasterCard M/CHIP Transaction

Contactless Card

Terminal

7781819F2701809F360208 D99F4B6052382F51D261DB ED1D801A1FED56D2DA279F 4EA048FE0FFB296875D5DA 056D606582849307A9EAF2 1D96FAF9648C80AF50118F 40495877DD6D6E32A404CB C0B67D48490216D7307361 D5B380909F7B6CC45D311F 2C9AC08802944528B35AA0 859F10120210A040012200 00000000000000000000FF 900

80AE90002B00000 000000100000000 000000360000000 000003614010100 000000001100008 8E672EF9E10EA7E 00000000

A Review of Attacks

Steal Someone's Card
· This is the major form of fraud from contactless transactions.
· Contactless (and Chip in the US) require no authentication.
· Limited by transaction amounts
­ £20 in the UK ­ AUD$80 in Australia etc.

Relay Attack
· Contactless/contact transactions contain no distance bounding protections.
· Made easier with the emergence of native support for Host Card Emulation on Android
See the talks and papers: · 2007 ­ "Keep Your Enemies Close: Distance Bounding
Against Smartcard Relay Attacks." Saar Drimer and Steven J. Murdoch @ Cambridge · 2012 - "NFC Hacking: The Easy Way" Eddie Lee @ Defcon · 2015 ­ "Relay Attacks in EMV Contactless Cards with Android OTS Devices" Ricardo Rodriguez and Pepe Vila @ HITB

Solutions

Card Cloning

Why?
Cards are mini HSMs
· Cards have hardware crypto accelerators and key storage.
· Physical protections against attack · Small attack surface · Normally EAL CC 5+ certified
­ Semiformally Designed and Tested ­ Includes testing for side-channel attacks

Dynamic CVCs

Key Name

Description

KDCVC3 ICC Derived Key for CVC3 Symmetric Key used for

Generation

generating the CVC3

MKAC

ICC Application Cryptogram Symmetric Key used to derive the

Master Key

session key for generation of the

Application Cryptogram

SKAC ICC Application Cryptogram Symmetric Key used to generate

Session Key

the Application Cryptogram

Dynamic Signing

TC/ARCQ data elements
Amount Authorized(Numeric)
...
Unpredictable Number
Application Interchange Profile Application Transaction Counter
Transaction Data
PDOL Elements
CDOL Elements CID
Application Transaction Counter Issuer Application Data

Encrypted by AC Session Key(SKAC)
ICC Dynamic Data ICC Dynamic Number Length ICC Dynamic Number Cryptogram Information Data TC or ARQC Transaction Data Hash Code
Hashed with SHA-1

Signed with ICC Private Key
Dynamic Application Data Signed Data Format
Hash Algorithm Indicator ICC Dynamic Data Length ICC Dynamic Data
Pad Pattern
Unpredictable Number

Talk over?

Transaction Cloning
· Full chip based EMV transaction take time · Requires upstream equipment to support
(terminal upgrades, new HSMs etc.). · So the contactless standards includes modes to
support old equipment and quick transactions. · Key to the cloning of transactions is the
"Magstripe" modes · These are designed to be used with equipment
that can only support magnetic card data · MasterCard ­ Magstripe Mode · VISA ­ dCVV and CVN17

Cloning Transactions

MasterCard
Magstripe Mode
· Magstripe mode consists of the terminal generating track data similar to the physical magstripe.
· We get the card to generate a dynamic CVV that the terminal insert into the track.
· This is sent off to the payment processor for verification.
· The weaknesses is how the CVVs are generated

MasterCard

Compute Cryptographic Checksum

CLA INS P1 P2 Lc Data

Le

00 2A 8E 80 Var. UDOL related data

00

eIMKcvc3(PAN)

Issuer
IVCVC3

Terminal
Unpredictable Number

Card
ATC

3DES

CVC3

MasterCard
Forming the UN
Length of UN = NumBitsSet(Ktrack) ­ Ttrack
Ktrack = Number of non zero bits in the track 1 bit map Ttrack = Number of digits of ATC to be included
CVV is formatted as Binary Coded Decimal.
Take a UN of 4 bytes:  4 bytes binary = 232 values = 4,294,967,296  4 bytes BCD = 108 values = 100,000,000  UN length of 2 = 102 values = 100

MasterCard
How to clone a transaction
1. Read and copy card records 2. Generate dictionary of COMPUTE CRYPTOGRAPHIC
CHECKSUM responses for all possible terminal random numbers 3. Flip the M/CHIP support bit (tag 82) 4. Replay stored records to the terminal 5. Look up UN returned by the terminal in the dictionary 6. Collect purchase and get out of there.

MasterCard How long does it take?
https://github.com/peterfillmore/Check-Paypass-Random-Number

Demo

MasterCard The flaw is built into the system
Paypass ­ M/Chip Requirements 2013

Fixes
· Attack can be detected on the card issuers side
­ ATC will jump.
· Card issuers need to issue cards with UN lengths of at least 4.
· Issuers should prompt for a second factor of authentication on failed transaction
­ PIN, Insert Chip Card
· Payment Processors should reject non M/Chip transactions over contactless.
· Terminals must be tested on RNG generation

Cloning a VISA

VISA Modes
 Dynamic CVV - dCVV  Legacy magstripe equivalent mode  Terrible, broken on release
 Cryptogram Version Number 17 - CVN17  Updated to magstripe equivalent mode  Lot better than dCVV
 Quick Visa Smart Debit/Credit - qVSDC  Reduced EMV mode  Defined in standard for speed
 Visa Smart Debit/Credit - VSDC  Full EMV mode (i.e. CDA)  Slower ­ requires card to be in field for complete transaction

VISA Modes
9F66 - TTQ ­ Terminal Transaction Qualifier

dCVV Mode

dCVV algorithm

Cloning
1. Read and copy card records 2. Turn the magstripe bit on (set AIP
bytes to 0x0080 3. Replay stored records to the
terminal 4. Collect purchase and get out of
there.

Demo

Prevention
· Requires explicit support from the terminal · This mode has been obsoleted by the CVN17 method · Requires that the terminal support dCVV mode. · So the payment processor should disable dCVV mode on the
terminal. · Issued cards should not support this mode (my debit VISA card
only supports fDDA modes)

CVN17
· Here we use the "Get Processing Options" command to generate the Application Cryptogram
· This is transmitted separately from the track data · Also contains amounts, currency and a terminal
UN

Inbuilt EMV Issues

Terminals
 EMV Only terminals require no tamper resistance.  Certification only covers interoperability
 Does the terminal play well?
 Terminals are not required to be tested for any logical security
 Update mechanisms are not defined by EMVco

UNs
Are an integral part of EMV security ­ yet: UN is not defined to be generated by a cryptographic
random number source Frequently will include a date or counter value

Apple Pay

Hardware

AMS AS3923 Power Booster

NXP 65v10

PN548

Secure Element

Software

Applications

Frameworks

Passkit

Nearfield. framework

Daemons
nfcd seld

PasskitUI

Passkit. Framework

passd

Hardware Drivers
PN548 Drivers PN548_HAL.d
ylib
PN548_API.dyl ib
PN548. dylib

NFC Hardware
Secure Element
· Holds the token, keys, certificates and commands needed to perform a transaction
· Can be managed remotely by the issuer · Loaded over a remote connection by the card issuer
PN548 Controller
· Handles the rest of the transaction · Interfaces with the secure element to perform the
transaction · Performs the transaction by itself. · Returns the necessary values back as EMV data to the
Nearfield.Framework to form the payment token.

PKPaymentToken
Transaction ID Payment Network Payment Token Data
Signature Encrypted Payment Data
Expiry Date PAN
EMV Data
https://github.com/beatty/applepay_crypto_demo

Dump Approved AIDs
Peters-iPhone:~ root# ps aux | grep "passd" mobile 284 ... /System/Library/Frameworks/PassKit.framework/passd Peters-iPhone:~ root# cycript -p 284 cy# mySE = [[PDSecureElement alloc] init] #"<PDSecureElement: 0x13f6894d0>" cy# mySE.secureElementCards @[#"<NFCard: 0x13f681700> { aid=A00000000410100100000001 family=0x0(UNKNOWN) lifecycle=0x7(selectable) activation=0x80(nonactivatable) authTransient=YES }",#"<NFCard: 0x13f646d40> { aid=A00000000310100100000001 family=0x0(UNKNOWN) lifecycle=0x7(selectable) activation=0x0(deactivated) authTransient=YES }",#"<NFCard: 0x13f59c9f0> { aid=A00000002501090100000001 family=0x0(UNKNOWN) lifecycle=0x7(selectable) activation=0x0(deactivated) authTransient=YES }"]

Is it vulnerable?
· Yes! · The NFC controller handles all the transaction when
enabled. · However either the user has to authorize the payment
with touch ID or passcode · Or using a jailbroken device that has malware that has
enabled the transaction · Additionally any purchase over the contactless limit will
be verified through "Consumer Device Cardholder Verification Method" (CDCVM) https://support.apple.com/en-au/HT202527

Tools Used

ACR-122U
Around AUD$60 off ebay Reads lost of stuff. Fickle ­ loves to crash, horrible drivers Can be made to support card emulation Good to get started understanding stuff Lots of limitations ­ like limited APDU length(~260 bytes), Stuck with what the interface chip gives you. No command chaining support (at least in RFIDIOT)

Proxmark 3
 Available for around US$200  Supports 125/134KHz, 13.56MHz.  FPGA handles raw signals,  ARM higher protocol stuff  Super powerful/Super Painful  API is a bit hairy  Lots of bugs! But good development community.
My fork of proxmark to handle EMV Stuff https://github.com/peterfillmore/proxmark3

Android Phones with NFC
· Prior to 4.4.4 (KitKat) Card Emulation not officially supported. But Cyanogen mod lets you.
· NXP chip supports emulation but not in official AOSP , watch out for pre 2013 android NFC phones
· Broadcom chip does, which was added in Nexus 4, Samsung Galaxy S4 etc.
· Better then ACR-122U cos its less buggy ­ but limited to chip support stuff ­ can't spoof UID ­ limited by internal buffer lengths (2472 in Nexus4).

Software I've developed

Additions to RFIDiot

https://github.com/peterfillmore/RFIDIOt

Added on scripts to perform contactless transactions for MasterCard and VISA cards

MasterCard:

MagStripe M/Chip

$python ChAP-paypass.py -dv -C MSR $python ChAP-paypass.py -dv -C MCHIP

VISA:

dCVV CVN17 fDDA0 EMV

$python ChAP-paywave.py -dv -C dCVV $python ChAP-paywave.py -dv -C CVN17 $python ChAP-paywave.py -dv -C fDDA0 $python ChAP-paywave.py -dv -C EMV

NFC Fuzzing
https://github.com/peterfillmore/EMVFuzzer
· Work in progress · Uses Sully generated text files as input · Requires a rooted phone ­ need to
programmatically power cycle the NFC from the command line. · I want to try and incorporate this into a Better solution ­ feel free to fork!

NFC Fuzzing
https://github.com/peterfillmore/EMVFuzzer
· Work in progress · Uses Sully generated text files as
input · Requires a rooted phone ­ need
to programmatically power cycle the NFC from the command line. · I want to try and incorporate this into a better solution · Feel free to fork!

Final Thoughts

Thanks
Pwpiwi@proxmark3 ­ Putting up with my complaining and fixing the Proxmark3 code Adam Laurie for writing the RFIDidiot Tool ­ major help in learning this stuff. Android team for adding HCE and allowing developers to access NFC Hardware iOS hackers for developing awesome tools ­ you know who they are.
Credits and References
"Don't Stand So Close To Me, An analysis of the NFC attack surface" ­ Charlie Miller 2012 "PinPadPwn" ­ Nils & Rafael Dominguez Vega Pin Pads, 2012 "Credit Card Fraud - The Contactless Generation" Kristian Paget, 2012 "Mission Mpossible" ­Nils and Jon Butler 2013 "Cloning Credit Cards: A combined pre-play and downgrade attack on EMV Contactless" - Michael Roland 2013 Standards - http://www.emvco.com Utilities - http://www.emvlab.org/tlvutils/ http://www.cl.cam.ac.uk/research/security/

Key Takeaways
· You can't clone cards (economically) · You can clone transactions · Legacy support reduces EMV security · Random numbers aint random. · Current standards do not mitigate these attacks
sufficiently · EMV Terminals and software are a huge worry · ApplePay is a solid implementation of existing
technologies.

