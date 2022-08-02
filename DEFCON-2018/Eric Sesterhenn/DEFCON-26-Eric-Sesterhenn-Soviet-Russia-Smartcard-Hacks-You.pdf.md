Eric Sesterhenn <eric.sesterhenn@x41-dsec.de> 2018
X41 D-SEC GmbH
https://www.x41-dsec.de/

1 / 30

whoami

· Eric Sesterhenn · Principal Security Consultant · Pentesting/Code Auditing at X41

https://www.x41-dsec.de/

2 / 30

Disclaimer

· The issues presented here have been reported and fixed!
· These are open source projects - help them!
· I am not interested in testing / debugging proprietary stuff in my spare time.

DEF CON 2018

3 / 30

Targets
LINUX LOGIN
DEF CON 2018

4 / 30

Why?

· Smartcards control authentication! · Authentication runs as root! · Users and programmers
subconsciously trust the smartcard!

DEF CON 2018

5 / 30

Smartcards

User Smartcard
Reader

Login (pam)
Smartcard Driver (OpenSC)
Reader Driver (PC/SC)

DEF CON 2018

6 / 30

What is a Smartcard?

· Physical, tamper-proof device · Designed to keep information secret · Contains memory and a processor

https://en.wikipedia.org/wiki/Smart_card#/media/File:SmartCardPinout.svg

DEF CON 2018

7 / 30

Application Protocol Data Unit

· APDUs form the protocol to talk to smartcards
· ISO/IEC 7816-4 Identification cards - Integrated circuit cards
· T=0 is character oriented / T=1 is block-oriented
· Verify: 00 20 00 01 04 31323334

CLA INS P1 P2 LC Data 1 1 1 1 0-3 NC

DEF CON 2018

8 / 30

PC/SC API

· PC/SC API can be used on win and *nix
· Other libraries have a similar interface

LONG WINAPI SCardTransmit(

SCARDHANDLE

hCard,

LPCSCARD_IO_REQUEST pioSendPci,

LPCBYTE

pbSendBuffer,

DWORD

cbSendLength,

PSCARD_IO_REQUEST pioRecvPci,

LPBYTE

pbRecvBuffer,

LPDWORD

pcbRecvLength

);

DEF CON 2018

9 / 30

PKCS11

· PKCS11 is a platform independent API for cryptographic token
· Supported by OpenSSL, browsers,... (eg. via libp11)
· Windows uses smartcard Minidriver now
· Driver for each card, uses ATR to match

CK_RV C_FindObjectsInit( CK_SESSION_HANDLE hSession, CK_ATTRIBUTE_PTR pTemplate, CK_ULONG ulCount
);

DEF CON 2018

10 / 30

Smartcard Stack Summary

Application (pam) PKCS11 PC/SC APDU
Physical Card

DEF CON 2018

11 / 30

Smartcard for Sign-On

PAM

Smartcard

Get Certicates

Certicate

Validate Certicate and User

Revocation Check

CRL

Generate Nonce

Sign Request for Nonce

Signature

Check Signature Against Certicate

DEF CON 2018

CRL Server

12 / 30

Trust the Smartcard
· Driver developers trust the smartcard!
· Let's abuse that · Mess with the card responses
DEF CON 2018

13 / 30

# Bugs

Project

# Bugs

libykneomgr OpenSC pam_pkcs11 smartcardservices Yubico-Piv

1 Over 9000 ;-) 1 2 2

No, I did not fuzz the &$#?@! out of it... but guess which one I fuzzed the most ;-) Thanks to Frank Morgner for fixing!

DEF CON 2018

14 / 30

Apple Smartcardservices

do { cacreturn = cacToken.exchangeAPDU(command, sizeof(command), result, ,! resultLength); if ((cacreturn & 0xFF00) != 0x6300) CACError::check(cacreturn);
... memcpy(certificate + certificateLength, result, resultLength - 2); certificateLength += resultLength - 2; // Number of bytes to fetch next time around is in the last byte // returned. command[4] = cacreturn & 0xFF;
} while ((cacreturn & 0xFF00) == 0x6300);
DEF CON 2018

15 / 30

OpenSC - CryptoFlex
u8 buf[2048], *p = buf; size_t bufsize, keysize;
sc_format_path("I1012", &path); r = sc_select_file(card, &path, &file); if (r)
return 2; bufsize = file->size; sc_file_free(file); r = sc_read_binary(card, 0, buf, bufsize, 0);
DEF CON 2018

16 / 30

Popping calcs...

DEF CON 2018

17 / 30

Basic Smartcard Exploitation in 2018
· Basiccard gives you nice control,... yes BASIC!
· Example exploit (Kevin) will be released to the public at beVX
· Other methods would be SIMtrace or certain Javacards
DEF CON 2018

18 / 30

YUBICO PIV

if(*out_len + recv_len - 2 > max_out) { fprintf(stderr, ,! "Output buffer to small, wanted to write %lu, max was %lu.", ,! *out_len + recv_len - 2, max_out);
} if(out_data) {
memcpy(out_data, data, recv_len - 2); out_data += recv_len - 2; *out_len += recv_len - 2; }

DEF CON 2018

19 / 30

Logging in...

DEF CON 2018

20 / 30

Challenges in fuzzing a protocol
· Most modern fuzzers are file-oriented · Radamsa: Generates a corpus of files · Hongfuzz: passes a file (filename different each run) · libfuzzer: passes a buffer and length · AFL: passes a file
DEF CON 2018

21 / 30

Challenges in fuzzing a protocol

· SCardTransmit() tells us how much data it expects · Read this from a file on each call and error out if EOF · No complicated poll handling like for network sockets required

DEF CON 2018

22 / 30

How to fuzz - OpenSC

· reader-fuzzy.c · Implements a (virtual) smartcard
reader interface · Responds with malicious data read
from file (OPENSC_FUZZ_FILE) · Have fun with AFL
DEF CON 2018

American Fuzz Lop

pkcs11-tool -t

Fuzzing File Input

libopensc

reader-fuzzy.c

card-cac.c
23 / 30

How to fuzz - Winscard and PC/SC
· Winscard(.dll) on Linux and Unix · For proprietary code · Preload the library · Have fun with non-feedback fuzzers
(e.g. radamsa) or AFL in qemu mode
DEF CON 2018

24 / 30

How to fuzz - Winscard 2
· Tavis loadlibrary · Extended to support Winscard
drivers · Fuzz the windows drivers on linux
without all the overhead
DEF CON 2018

25 / 30

Smartcard fuzzing
· Released now! · https://github.com/x41sec/x41-
smartcard-fuzzing
DEF CON 2018

26 / 30

pam_pkcs11: Replay an Authentication

PAM

Smartcard

Get Certicates

Certicate

Validate Certicate and User

Revocation Check

CRL

Request Random Nonce

Nonce

Sign Request for Nonce

Signature

Check Signature Against Certicate

CRL Server

DEF CON 2018

27 / 30

Roadblocks

· Channel back to card is quite limited · Might need to use revocation list check for information leaks · Interaction during exploitation not possible with basiccard, get SIMtrace for
that · But: A single bitflip from false to true during login can be enough :)

DEF CON 2018

28 / 30

Takeaways / Conclusions

· Think about trust models! · Some security measures increase your attack surface big time! · Fuzz Everything! · Limit attack surface by disabling certain drivers. · Do not write drivers in C ;-)
DEF CON 2018

29 / 30

Thanks
· Q&A · https://github.com/x41sec/x41-smartcard-
fuzzing · eric.sesterhenn@x41-dsec.de · Sorry no Twitter... stalk me on LinkedIn if
you must ;-)
https://www.x41-dsec.de/

30 / 30

