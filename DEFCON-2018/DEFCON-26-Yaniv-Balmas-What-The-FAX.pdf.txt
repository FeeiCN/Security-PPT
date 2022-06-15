To:

DEFCON 26

Date: Aug-12 2018

Subject:

What The

Fax?!

Check Point Research

Received OK?

WhoAreWe?

Yaniv Balmas
"This should theoretically work"
Security Researcher
Check Point Software Technologies
@ynvb

Eyal Itkin
"That's cool."
Security Researcher
Check Point Software Technologies
@eyalitkin

1846

FAXHistory

Caselli Invents Machine Similar to Today's FAX

XEROX Introduces
the First Commercial FAX Machine

GammaFAX Brings
Computers Into FAX Network

1923

1980

1860
Alexaner Bain Sends An Image Over a Wire

Enter the RadioFAX.
Used by Navies

1966

1985

Group III  ITU-T Fax Standards T.30, T.4, T.6

Bac kToTh eFu t u re

Quality

Accessibility

Reliability

Authenticity

?

Bac kToTh eFu t u re

Bac kToTh eFu t u re

Bac kToTh eFu t u re

Bac kToTh eFu t u re

Bac kToTh eFu t u re

WTF?!

FaxToday
· Modern FAX is no longer a simple "FAX
Machines"

· The same old FAX technology is now
wrapped inside newer technologies

· ALL-IN-ONE printers are EVERYWHERE

The Security View
ALL-IN-ONE Printers

FAX Attack
ALL-IN-ONE Printers

FAX Attack
ALL-IN-ONE Printers

Challenge Accepted

What is the Target?

How can we Debug it?

How to Obtain the Code?
How Does FAX Even Work?

What is The OS?
Where to look for vulns?

AndTheWinnerIs

BreakingHW
SRAMs (e.g Some More Memory)
Flash ROM

BreakingHW

USB

WiFi

Electricity

Main CPU
SRAM
Battery

FAX Modem

ShowMeYourFirmware!
SERIAL DEBUG JTAG

TooEasy?

FirmwareUpgrade

How do you upgrade a printer
firmware?!
You Print it!

How do you upgrade a printer
firmware?!
You Print it!

PrintingTheFirmware

PrintingTheFirmware
NULL Decoder TIFF Decoder Delta Raw Decoder

WhenYou'reaHammer...

Sections

Loading Address

Section Name Location in Binary

IDon'tUnderstand
...

WhatISThis?!
· Probably a compression algorithm
 · A very bad one ...
 · Some mathematics

Let'sTakeALook

recu r s i ve l y

non pos i t

s iz

e

va r i ab l e - l en

gth

V L j peg .

FF 20 72 66 63 75 72 73 69 EF 76 65 6C 79 AE E0 6E 6F 6E DF 70 6F 73 69 74 FE 30 20 73 F7 69 7A 65 0E 32 76 61 72 69 FF 61 62 6C 65 2D 6C 65 6E F7 67 74 68 AD 33 00 00 56 4C FF 6A 70 65 67 2E

Let'sTakeALook

recu r s i ve l y

non pos i t

s iz

e

va r i ab l e - l en

gth

V L j peg .

FF 20 72 66 63 75 72 73 69 EF 76 65 6C 79 AE E0 6E 6F 6E DF 70 6F 73 69 74 FE 30 20 73 F7 69 7A 65 0E 32 76 61 72 69 FF 61 62 6C 65 2D 6C 65 6E F7 67 74 68 AD 33 00 00 56 4C FF 6A 70 65 67 2E

APattern?!

FF

EF

DF

FE 30

0E 32

FF

F7

AD 33

FF

AE E0 F7

APattern?!

FF

8 Bytes

EF 9 Bytes

DF

9 Bytes

F7

9 Bytes

FF

8 Bytes

F7 9 Bytes

FF 8 Bytes

DifferentAngle

F

F

FF 1 1 1 1 1 1 1 1

EF

1

F 11

1

0

E 11 1

F

D

DF 1 1 1 1 1 0

11

7
F7 1 1 1 0

F 11 11

FF

1

F 11

1

1

F 11

1

7
F7 1 1 1 0

F 11 11

TheMissingLink

F7

?AD??33?

Forward / Backward Pointer
 Dictionary
 Sliding Window

Softdisk

TheMissingLink

AD 33

A

D

3

3

1010110100110011

2771

3

Window Location

Data Length

MysterySolved
Sliding Window

Input Text Output Text

A BCDAB E FG

MysterySolved

Sliding Window A
Input Text

Output Text

A BCDAB E FG

A

MysterySolved

Sliding Window AB
Input Text

Output Text

A BCDAB E FG

AB

MysterySolved

Sliding Window ABC
Input Text

Output Text

A BCDAB E FG

ABC

MysterySolved

Sliding Window A BCD
Input Text

Output Text

A BCDAB E FG

A B CD

MysterySolved

Sliding Window A BCD
Input Text

Output Text

A BCDAB E FG

A B CD

MysterySolved

Sliding Window A BCD
Input Text

Output Text

A BCDAB E FG

A B CD

MysterySolved

Sliding Window A BCD
Input Text

Output Text

A BCDAB E FG

A B C D 00 02

MysterySolved

Sliding Window A BCDE
Input Text

Output Text

A BCDAB E FG

A B C D 00 02 E

MysterySolved

Sliding Window A BCDE F
Input Text

Output Text

A BCDAB E FG

A B C D 00 02 E F

MysterySolved

Sliding Window ABCDEF G
Input Text

Output Text

A BCDAB E FG

A B C D 00 02 E F G

MysterySolved

Sliding Window ABCDEF G
Input Text

A BCDAB E FG

Output Text

1111

0

111

A B C D 00 02 E F G

MysterySolved

Sliding Window ABCDEF G
Input Text

Output Text

A BCDAB E FG

EF A B C D 00 02 E F G

ThePrintingBeast
· 64,709 Functions
 · Most of the code not parsed by IDA
 · Indirect Calls, Dynamic Tables, BootLoader Functions

MakingSomeSense

Common Libraries

Tasks

mDNSResponder

tPrintFax

ThreadX - ARM9/
Green Hills

Spidermonkey

tT30

OpenSSL 1.0.1j (2014)

tFaxLog

gSOAP 2.7

tModem

libpng 1.2.29 (2008) tTB, tHTML, ...

System n' Stuff

Treck (IP, TCP/UDP, DNS, HTTP, ...)

2 Staged Boot Loader

MakingSomeSense

Common Libraries

Tasks

mDNSResponder

tPrintFax

ThreadX - ARM9/
Green Hills

tT30

OpenSSL 1.0S.p1ijd(2e0rm14o)nkey tFaxLog

gSOAP 2.7

tModem

libpng 1.2.29 (2008) tTB, tHTML, ...

System n' Stuff

Treck (IP, TCP/UDP, DNS, HTTP, ...)

2 Staged Boot Loader

JSOnAPrinter?!
· JavaScript is used in a module called PAC.
 · PAC - Proxy Auto Configuration
 · Used by a URL linking to a JS file in DHCP settings 
 · Top layer functionality was designed by HP

FakeURL

Yep...

T30
· aka "ITU-T Recommendation T.30" 
 · Procedures for document facsimile transmission in the
general switched telephone network 

· Defined the "heavy lifting" procedures relevant for all fax
sending functionality

· Designed at 1985
 · Last update at 2005

DynamicHell

TheUndebuggable
· How do we debug this hostile environment?
 · There are no native debugging facilities
 · We have no control over the execution flow
 · Hardware watch-dog is a serious problem

LuckyBreak
· Luck is a fundamental part of every research project
 · At July 19, SENRIO published an exploit dubbed "Devil's
Ivy"

· CVE-2017-9765 - RCE in gSOAP 2.7 - 2.8.47
 · And it seems our printer is vulnerable!

Devil'sIvy

DebuggingChallenges
· Need to read/write memory
 · Need to Execute code
 · Create a network tunnel between debugger/debuggee

DebuggingChallenges
· We have control over execution flow
 · Need to load our own code
 · Bypass memory protection
 · Embed debugging stub into current firmware

Scout
· We created our own instruction based debugger
 · Called - `Scout'
 · Supports x86, x64, ARM (ARM and Thumb mode)
 · Embedded mode for firmware
 · Linux kernel mode

H o wDo e sAFAX?

H o wDo e sAFAX?

PHASE 1 PHASE 2 PHASE 3 PHASE 4

Network Probing/ Interaction Ranging

Equalizer and Echo
Canceller Training

Training Phase

H o wDo e sAFAX?

PHASE A

PHASE B

Tunnel
Caller ID
Sender Caps (DIS)
Receiver Caps (DTC)
Data Transfer
End of page (EOP)
Msg Confirm (MCF)

PHASE C

HDLC

PHASE D

Tunnel

H o wDo e sAFAX?
T.30 HDLC

PHASE A PHASE B PHASE C PHASE D

H o wDo e sAFAX?
T.30 HDLC
FAX

Tunnel

PHASE A PHASE B PHASE C PHASE D

H o wDo e sAFAX?

TIFF Header
TIFF Body

G.3/G.4 T.30

PHASE A PHASE B PHASE C PHASE D

HDLC

Tunnel

PHASE A PHASE B PHASE C PHASE D

H o wDo e sAFAX?
T.30 Color Extension
HDLC
FAX

Tunnel

H o wDo e sAFAX?
JPEG Header
and Body
T.30 Color Extension
HDLC

PHASE A PHASE B PHASE C PHASE D

Tunnel

Vulnerability
· All the layers we showed can contain possible
vulnerabilities.

· The most convenient layer is the application one.
 · We started by inspecting the JPEG parsing capabilities.

JPEG
FF D8 FF E0 00 10 4A 46 49 46 00 01 02 00 00 64 . . . . . . . J F I F . . . . d
00 64 00 00 FF C4 0A 02 34 D3 2A 78 80 42 6D 2B . d . . . . . . 4 . * x . Bm+
FF DA 12 28 2A 6F 2B 81 6A 16 0F C8 9A 13 FF D9 . . . ( * 0 + . j . . . . . . .
SOI - Start Of Image APP0 - Application Specific
Size Data
DHT - Define Huffman Table
Size Data
SOS - Start Of Scan
Data
EOI - End Of Image

DHT
· Define Huffman Table
 · Defines 4X4 comparison matrix for the JPEG Image
FF C4 20 00 01 00 00 00 00 02 00 01 02 00 00 00 00 00 00 FF FF C4 0A 02 34 D3 2A 78 80 42 6D 2B

HEADER

SIZE 4X4 MATRIX

DATA

DHT
( FF C4 20 00 01 00 00 00 00 02 00 01 02 00 00 00 ) =6 00 00 00 FF FF C4 0A 02 34 D3 2A 78 80 42 6D 2B
· 4X4 Matrix values are summed
 · The product is used as a size value for data bytes
 · The data bytes are copied into a 256 bytes array located
on the stack

DHT
FF C4 20 00 01 00 00 00 00 02 00 01 02 00 00 00 00 00 00 FF FF C4 0A 02 34 D3 2A 78 80 42 6D 2B
6
Stack

256

CanYouSpotIt?

DHT

FF C4 20 FF FF FF FF FF FF FF FF FF FF FF FF FF

... FF FF FF FF FF C4 0A 02 34 D3 2A 78 80 42

2B

256

Stack

DHT
FF C4 20 FF FF FF FF FF FF FF FF FF FF FF FF FF
... FF FF FF FF FF C4 0A 02 34 D3 2A 78 80 42 ... 2B 4000
Stack
Overflow!!

256

ExploitChain
· Trivial stack overflow
 · No constraints ("forbidden bytes")
 · ~4,000 user controlled bytes
 · The file contains even more information we control...

Demo Time

Conclusions
· PSTN is still a valid attack surface in 2018!
 · FAX can be used as a gateway to internal networks
 · Old outdated protocols are not good for you...

WhatCanIDo?
· Patch your printers
 · Don't connect FAX where not needed
 · Segregate your printers from the rest of the network

STOP USING FAX

LittleHelpFromMyFriends

Lior
Oppenheim
oppenheim1

Yannay Livneh
Yannayli

Tamir Bahar
tmr232

Yoav Alon
yoavalon

fin.
ynvb EyalItkin

