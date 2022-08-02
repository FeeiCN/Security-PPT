Chip Chop - Smashing the Mobile Phone Secure Chip for Fun and Digital Forensics

Gunnar Alendal
Norwegian University of Science and Technology (NTNU) @gradoisageek

#BHUSA @BlackHatEvents

Digital forensics (simplified)

Seize

Acquisition

Identifying and seizing, e.g. devices, hard drives, ...

Extract data to be analysed =

Digital Forensics Acquisition (DFA)

Analysis
Identify and analyse data relevant to investigation

Report
Report on positive and negative findings
#BHUSA @BlackHatEvents

Digital Forensic Acquisition (DFA)
pixabay.com

Before

pixabay.com

Now

pixabay.com

Android Security 101

Untrusted & Trusted worlds

Towers preventing DFA
<= Galaxy S10
"Breaking Samsung's Root of Trust: Exploiting Samsung S10 S-Boot" Jeff Chao / Black Hat 2020

Towers preventing DFA
>= Galaxy S20

1 + 1 = Digital Forensic Acquisition
This talk

Break REE + break

=> DFA

#BHUSA @BlackHatEvents

(embedded) Secure Element - eSE
 Model in Galaxy S20 (Exynos): S3K250AF *  Separate HW chip  Protects encryption key material  Prevents brute force from compromised system ("root")
 Break eSE => gain access to encryption key material
* Full paper presented @DFRWS USA 2021: "Chip Chop - Smashing the Mobile Phone Secure Chip for Fun and Digital Forensics"
#BHUSA @BlackHatEvents

Android File-based Encryption (FBE)

Android FBE States

Device Encrypted (DE)
Credential Encrypted (CE)

Device Encrypted (DE)
Credential Encrypted (CE)

Device Encrypted (DE)
Credential Encrypted (CE)

Device off

Power on / no unlock Before-first-unlock (BFU)

Power on / first unlock After-first-unlock (AFU)
#BHUSA @BlackHatEvents

Android FBE States & eSE

Device Encrypted (DE)
Credential Encrypted (CE)

Device Encrypted (DE)
Credential Encrypted (CE)

Device Encrypted (DE)
Credential Encrypted (CE)

Device off

Power on / no unlock Before-first-unlock (BFU)

Power on / first unlock After-first-unlock (AFU)
#BHUSA @BlackHatEvents

Attack phase 1: "root" REE

Device Encrypted (DE)
Credential Encrypted (CE)

E.g. break secure boot

Device Encrypted (DE)
Credential Encrypted (CE)

Device Encrypted (DE)
Credential Encrypted (CE)

Device off

Power on / no unlock Before-first-unlock (BFU)

Power on / first unlock After-first-unlock (AFU)
#BHUSA @BlackHatEvents

Attack phase 2: eSE: Force BFU to AFU

Device Encrypted (DE)
Credential Encrypted (CE)

Device Encrypted (DE)
Credential Encrypted (CE)

BFU => AFU: Break eSE

Device Encrypted (DE)
Credential Encrypted (CE)

Device off

Power on / no unlock Before-first-unlock (BFU)

Power on / first unlock After-first-unlock (AFU)
#BHUSA @BlackHatEvents

BFU => AFU

w/ weaver

eSE

pw/pin/pattern +
SALT (DE) +
SECRET (eSE) =
AFU

Brute force
eSE
pw/pin/pattern =
BruteForce( SALT (DE) +
CHALLENGE (eSE) )

Attack Summary*
*Executive edition

Attacking the FBE (CE)
REE
1. Break REE: "root" / SALT 2. Attack eSE
3. Get CHALLENGE + (SECRET) 4. Off-device brute force pw/pin/pattern

#BHUSA @BlackHatEvents

Off-device brute force pw/pin/pattern

for pin in all_pins:

# KDF(PIN, SALT)

computePasswordTokenRes = scrypt.hash(pin,SALT,N=scryptN,r=scryptR,p=scryptP,buflen=PASSWORD_TOKEN_LENGTH)

# Generate CHALLENGE candidate

sha512

= hashlib.sha512(PERSONALISATION_WEAVER_KEY)

sha512.update(computePasswordTokenRes)

personalisedHash

= sha512.digest()

# Compare candidate CHALLENGE with stolen CHALLENGE

if personalisedHash[:stolenCHALLENGELen] ==stolenCHALLENGE:

print("\n=================================\n")

print("

Correct pin is: %s"%pin)

print("\n=================================\n\n")

print(" pwdToken

hash : " + computePasswordTokenRes.hex())

print(" weaver CHALLENGE hash : " + personalisedHash[:stolenCHALLENGELen].hex())

#BHUSA @BlackHatEvents

The eSE attack
from 0 to 0-day

Enter S3K250AF eSE!
 Introduced 2020 in Galaxy S20 models (Exynos)  Black box IC  ARM BE8 THUMB  252 kB on-board flash + 16 kB RAM  CC EAL 5+ certification  Designed to protect against HW attacks, like Side-Channel attacks  Brute force protection
 Features: Weaver / SecNVM / Device Attestation / Keystore / ..
#BHUSA @BlackHatEvents

eSE = "Black box"
REE
 REE talks to eSE  hermesd process  Frida instrumentation  Reimplement in chip_breaker
 Talks APDU  Just like a SIM card  APDU handlers in eSE FW
 Reverse engineer REE commands  REE .so + small FW part  We can talk "dirty" to it!
 But no debug / info leak  Locate oracles!

#BHUSA @BlackHatEvents

Info leak Oracles needed

Oracle 1
REE
 APDU handler error:  APDU response w/error code  Error = APDU SW (Status Word)
 APDU handler crash:  No APDU response!
#BHUSA @BlackHatEvents

Oracle 2
 Promising eSE ADPU handlers:  APDU_readWeaver Send CHALLENGE  APDU_writeWeaver Set CHALLENGE / SECRET

11

nC

nC nS

CHALLENGE

SECRET

nS

REE

#BHUSA @BlackHatEvents

Oracle 2 (simplified)
 APDU_writeWeaver First: Set CHALLENGE / SECRET

Normally

11

32

32 32

f0b90d..1c1b

2bf11f..d582

32

What if?
11 1 1 255 1
"Secret" 32

#BHUSA @BlackHatEvents

Oracle 2 (actual)
 APDU_writeWeaver First: Set CHALLENGE / SECRET

11 1

32

4

4

1 40 1 "Secret" + 000..0

1

204

Footer overwrite trick

#BHUSA @BlackHatEvents

Oracle 2
 APDU_readWeaver Second: Send CHALLENGE

Send:

1

32

32

f0b90d..1c1b

Receive: 32
2bf11f..d582

Send: 11
11
Receive: 204
"Secret" + stack dataaaaaaaaaaaaaa
#BHUSA @BlackHatEvents

Oracle 2 - Stack leak!
"Secret"

SECRET(32)

0000 0010 0020 0030 0040 0050 0060 0070

53 65 63 72 65 74 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 D0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 05 01 22 49 31 20 00 14 28 20 00 27 C0 00 00 00 00 20 00 14 80 FF FF FF FF 00 02 85 F9 20 00 14 80 20 00 27 C0 00 02 85 8B 00 00 00 00 20 00 0B 50 00 00 00 00 FF FF FF FF 00 01 04 7F 00 00 00 00

Data addresses (RAM)

Code addresses (flash) (ARM THUMB)
#BHUSA @BlackHatEvents

Oracle 2 features
 Leak RAM address range + pointers  Leak CODE (flash) address range + pointers  Stack layout of APDU_readWeaver  Enable dynamic reverse engineering  Further experimenting different APDU handlers  BlindROP / DarkROP like testing

#BHUSA @BlackHatEvents

From Oracle to 0-day
 APDU_writeWeaver Set CHALLENGE / SECRET

11 1 1 255 1
4141414141...41 255
What if?

Oracle 1 hit! ==>
APDU_writeWeaver crashed?
#BHUSA @BlackHatEvents

S3K250AF Attack so far
 Have stack leak, but only for APDU_readWeaver  APDU_writeWeaver triggers Oracle 1 on n > 84
S
 Back to skool:  "Smashing the stack for fun and profit" (Aleph One,1996)
 Next move, alternative 1:  secret[84:88] assumed code pointer?  Brute force => hit ROP gadget w/ no Oracle 1 trigger
 Next move, alternative 2:  Assume stack APDU_readWeaver ~= APDU_writeWeaver  Manual stack guesstimating

#BHUSA @BlackHatEvents

Alternative 2: stack guesstimating
 Partial S3K250AF FW found on Galaxy S20 filesystem  Most of FW is encrypted :(
 Contains unencrypted "dev" version of IWEA code  IWEA is short for IWEAVER
 APDU_readWeaver_dev disassembly possible  APDU_writeWeaver_dev disassembly possible
 We can "simulate" stack use, and hope it fits "prod" code on chip  <trial and error>
#BHUSA @BlackHatEvents

Stack layout found

Victory!
 Stack layout of APDU_writeWeaver guessed!  Know position of return address (PC) POP'ed from stack!  We can set R4-R7 and PC to return properly!  Can now overflow stack and control execution on S3K250AF eSE!  Pwned!
#BHUSA @BlackHatEvents

APDU_writeWeaver Stack smash!

APDU_writeWeaver

secret[84:88]

#BHUSA @BlackHatEvents

Next goal: Execute something useful
 One ROP to rule them all  Dumps 16 bytes from arbitrary address

MOVS STR STR MOVS STRB MOV STRB POP

R0, #0x10 ; size to read. Fixed size 0x10.

R7, [R4] ; R7 is address to read => We control R7!

R0, [R4,#4] ; Store size

R0, #0x90 ; SW1 => SW is just return code (Status Word). 0x90 == "Success"

R0, [R4,#8] ; Store SW1

R0, R5

; SW2

R5, [R4,#9] ; Store SW2

{R1-R7,PC} ; pop and return =>We get 0x10 bytes from arbitrary address!

#BHUSA @BlackHatEvents

chip_breaker
 Dump CHALLENGE  Remove "root" REE
requirement

Full eSE flash dump
 We dump all code + metadata  We dump all sensitive data
 "11: IWEAVER": CHALLENGE + SECRET
 Off-device brute force: Check!  Digital Forensic Acquisition: Check!

#BHUSA @BlackHatEvents

Mission accomplished!

But wait! Can we do more?
 We can achieve arbitrary code execution (ACE)  RAM/Stack is executable!  Return-to-APDU-buffer => ACE / (RCE)
shellcode

#BHUSA @BlackHatEvents

Arbitrary code execution
 We can read flash + RAM  Dump hardcoded AES key => Used for FW encryption  No more encrypted FW updates  No FW code or sensitive data safe
 We can write flash + RAM  No eSE Secure Boot!  Persistent(!) changes to any eSE feature  Set up C build env.  "Breaking Samsung firmware, or turning your S8/S9/S10 into a DIY Proxmark" - Christopher Wade
#BHUSA @BlackHatEvents

Write persistent changes => New attack variant?
 eSE only attack  Remove "root" REE
requirement

Towers preventing DFA
>= Galaxy S20

Potential "HW Trojan" attack

Device Encrypted (DE)
Credential Encrypted (CE)

Device Encrypted (DE)
Credential Encrypted (CE)

BFU => AFU: Brute force

Device Encrypted (DE)
Credential Encrypted (CE)

Device off

BFU

AFU
#BHUSA @BlackHatEvents

"HW Trojan" attack PoC demo
 Rubber Ducky HID simulation
 Send all PINs  No timeouts!
Unpatched

Patched: eSE brute force protection
removed
Music: @dubmood

ToDo: Test actual chip off, attack, chip on

Certification 
Security?
"In theory, there is no difference between theory and practice, while in practice, there is"
- Benjamin Brewster

CC EAL 5+ AVA_VAN.5
 Security Goals in "Security Target":  SG1 => Integrity of user data  SG2 => Confidentiality of user data  SG3 => Correct operation

Broken by our attack

 AVA_VAN.5:  "A methodical vulnerability analysis is performed by the evaluator to ascertain the presence of potential vulnerabilities"  A certified stack smashing buffer overflow?

#BHUSA @BlackHatEvents

Intended vs. achieved security
 S3K250AF meant to protect against state level actors  Broken by 1 researcher, no special tools, ~1 month
 FW encryption AES key revealed  No encrypted OTA possible for fielded devices
 Can fielded S3K250AF devices regain trust?  Can we create undetectable / unremovable eSE FW modifications?
#BHUSA @BlackHatEvents

Black Hat Sound Bytes
 One old skool stack buffer overflow to break the S3K250AF eSE  Patched by Samsung (CVE-2020-28341 / SVE-2020-18632)
 CC EAL 5+ AVA_VAN.5 gives no guarantees of achieved security  Digital Forensic Acquisition in 2021: Finding and exploiting 0-days
#BHUSA @BlackHatEvents

Thank you
(see full paper for details)
Gunnar Alendal @gradoisageek
Thanks: Geir Olav Dyrkolbotn, Stefan Axelsson, @zutle, @dubmood (music) and Samsung

#BHUSA @BlackHatEvents

