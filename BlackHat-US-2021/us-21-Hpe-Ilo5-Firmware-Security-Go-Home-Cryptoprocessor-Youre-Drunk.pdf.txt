HPE iLO 5 security Go home cryptoprocessor, you're drunk!
Alexandre Gazet, Fabien Périgaud & Joffrey Czarny

Who we are

Alexandre Gazet
· Airbus security lab · Co-author of "Practical Reverse
Engineering" · Work in progress

Fabien Perigaud
· Reverse Engineering team Technical Lead @ Synacktiv
· Vulnerability researcher · CTF/challenge enthousiast in a
previous life

#BHUSA @BlackHatEvents

2

HPE Integrated Lights Out in a nutshell

#BHUSA @BlackHatEvents

3

Previous work

A well-known technology:
· Deep-dive analysis of HPE iLO4 and iLO512 · CVE-2017-12542: pre-auth RCE (iLO4) · CVE-2018-7078: updates signature verification bypass · CVE-2018-7113: secure boot bypass (iLO5) · Abuse of the DMA feature to compromise host OS from iLO3 · etc.

1 https://github.com/airbus- seclab/ilo4_toolbox 2Talks at RECON, SSTIC, ZeroNights 3 https://github.com/Synacktiv/pcileech_hpilo4_service

#BHUSA @BlackHatEvents

4

How it started
· Early 2020, new iLO5 firmware versions: 2.x · High entropy data blob  encrypted updates · Installation notes:
"Upgrading to iLO 5 version 2.10 is supported on servers with iLO 5 1.4x or later installed."
· "Transitional" 1.4x versions are unencrypted

#BHUSA @BlackHatEvents

5

Encryption
Objective(s) · Locate the implementation of the decryption · Re-implement the decryption mechanism · Update our firmware analysis toolbox

T-0

#BHUSA @BlackHatEvents

6

Where is the encryption implemented?

iLO5 ASIC (bootrom)

Secure Micro Boot 1.01

neba9 0.9.7

iLO 5 Kernel 00.09.53

userland 1.40.68

Boot chain? · Bootloaders and kernel stay the same between versions 1.3x and 1.4x

#BHUSA @BlackHatEvents

7

Where is the encryption implemented?

iLO5 ASIC (bootrom)

Secure Micro Boot 1.01

neba9 0.9.7

iLO 5 Kernel 00.09.53

userland 1.40.68

Firmware Update Manager (FUM) · Task/module in userland · Manages the cryptographic signature check and the updates writing in the flash memory · Discovery of the new decryption feature

#BHUSA @BlackHatEvents

8

New firmware layout
encrypted AES key (0x200 bytes)

encrypted blob

authentication tag (0x10 bytes)

AES initialization vector (0xC bytes)

· OpenSSL primitives: envelope encryption4 · Authenticated symmetric ciphering of the data, AES Galois/Counter Mode (GCM) · The symmetric key (AES) is sealed by a public key and asymmetric encryption
(RSA) ·  The RSA private key is required to "open the envelope"

4 https://wiki.openssl.org/index.php/EVP_Asymmetric_Encryption_and_Decryption_of_an_Envelope

#BHUSA @BlackHatEvents

9

RSA private key

· PEM base64, PKCS8 · The RSA private key is protected by a passphrase · OpenSSL: PEM_read_bio_RSAPrivateKey ·  a callback function provides the passphrase

#BHUSA @BlackHatEvents

10

When the passphrase meets the hardware

· Memory range 0x1F2xxxx  configuration registers from the iLO5 SOC (System-On-Chip) mapped into the userland task.
·  The HW_SECRET buffer is a "hardware" key

#BHUSA @BlackHatEvents

11

Hardware Key Extraction
Objective(s) · Exploit a vulnerability on iLO 5 · Read SOC registers · Re-implement decryption mechanism · Update our firmware analysis toolbox
T + 2 days

#BHUSA @BlackHatEvents

12

Pragmatism

· CVE-2018-7105 by Nicolas Iooss5 · Impacts iLO4 and iLO5 · "Remote execution of arbitrary code, Local Disclosure of Sensitive Information" · Format-string vulnerability in the proprietary SSH restricted shell
(post-authentication) · Exploitation code available for iLO4 ·  Port the first stage of the exploit to iLO5

5@fishilico: "Add SSH exploit for CVE-2018-7105" https://github.com/airbus- seclab/ilo4_toolbox/commit/430bfb95

#BHUSA @BlackHatEvents

13

Tricks and treats
Difficulties 1. Vulnerability is in the task ConAppCli  SOC secrets are not mapped in the task's context 2. Memory R/W primitive with some constraints: · Addresses with null-bytes forbidden · As well as some special chars ("\n", "\r", etc.)
Memory aesthete 1. Patch/hook a function pointer to call a primitive exposed by the OS ( mmap) 2. Double mapping (virtual-physical translation) to remove null-bytes

#BHUSA @BlackHatEvents

14

Introducing on-request memory mapping

memmap function 1. High level wrapper upon kernel primitives 2. But, depends upon structures defined in the task

#BHUSA @BlackHatEvents

15

Mapping descriptors

#BHUSA @BlackHatEvents

16

Mapping descriptors
Key points 1. Describe devices memory ranges 2. For example, mapping the kernel memory is not possible 3. And yes, the mappings table can be read and written from the task's context :)
struct MEM_RANGE {
void *phys_addr; void *virt_addr; unsigned __int64 mask; int field_10; int field_14; };

#BHUSA @BlackHatEvents

17

Double mapping for the win
Single-byte memory patch · From: MR_RANGE < 0xC0000000, 0x1F20000, 0x800000000, 0, 0> · To: MR_RANGE < 0xC0000000 , 0x1F21000, 0x800000000, 0, 0>
#BHUSA @BlackHatEvents

Physical memory
0xC000_0000

Virtual memory 0x1F2_0000
0x1F2_1000

18

I love it when a plan comes together

[+] dumping iLO HW keys: [+] MMU: memory mapping magic:
>> patch 0x2008@0xb8264 >> patch 0x1008@0xb824c >> patch 0x18@0xb818c >> patch 0xc00000@0xb8181 [+] command hooks: >> hook 0x70158@0xb0bec

>> 0xbf7fffc3@0x1f200d8 >> 0x01851c0d@0x1f20b01 >> 0x32f26410@0x1f20b08 >> 0x08000621@0x1f20b0c >> 0x8000009f@0x1f21810 >> 0x81001012@0x1f21840 >> 0x810010dc@0x1f21850 >> 0x81001121@0x1f21890

Hardware key extraction through a fmt-string over VPN  Firmware 2.x decrypted with success!!!

#BHUSA @BlackHatEvents

19

Layout of a 2.x firmware

0) Secure Micro Boot 2.02, type 0x03, size 0x00008000

1) Secure Micro Boot 2.02, type 0x03, size 0x00005424

2)

neba9 0.10.13, type 0x01, size 0x00005644

3)

neb926 0.3, type 0x02, size 0x00000ad0

4)

neba9 0.10.13, type 0x01, size 0x00005644

5)

neb926 0.3, type 0x02, size 0x00000ad0

6) iLO 5 Kernel 00.09.60, type 0x0b, size 0x000d6158

7) iLO 5 Kernel 00.09.60, type 0x0b, size 0x000d6158

8)

2.10.54, type 0x20, size 0x001dd9dc

9)

2.10.54, type 0x23, size 0x00f2ad0b

a)

2.10.54, type 0x22, size 0x004e7f2

Wait!!!! · 3 userland images · Previously 2 images only: main (type 0x20) et recovery (type 0x22) · (double) facepalm: the new type 0x23 is encrypted... · The type 0x20 is now minimalist, however not encrypted

#BHUSA @BlackHatEvents

20

That feeling when...

#BHUSA @BlackHatEvents

21

Second encryption layer
Objective(s) · Understand the second layer of encryption · Re-implement the second decryption layer · Update our firmware analysis toolbox
T + 1 week

#BHUSA @BlackHatEvents

22

Dissecting the new main image (type 0x20)

---------------[ Shared modules ]---------------

> mod 0x00 > mod 0x01 > mod 0x02 -

libINTEGRITY.so size libc.so size
libopenssl.so size

-----------------[ Tasks List ]-----------------

> task 01 - path keymgr.elf - size 0x00013588

· Single-task image · 3 libs including OpenSSL

#BHUSA @BlackHatEvents

23

An "augmented" bootchain

iLO5 ASIC (bootrom)

Secure Micro Boot 2.02

neba9 0.10.13

iLO 5 Kernel 00.09.60

stager (keymgr) 2.10.54
load and decrypt
secure (type 0x23)
2.10.54

#BHUSA @BlackHatEvents

24

We are looking for the Keymaker

#BHUSA @BlackHatEvents

25

Layout of an encrypted image
EC public key (0x200 bytes)

encrypted blob

authentication tag (0x10 bytes)

AES initialization vector (0xC bytes)
· A private key is reconstructed during the boot of keymgr · OpenSSL primitives: ECDH_compute_key, Elliptic Curve Diffie-Hellman · Used with the public key located in the image header to derive a shared secret · Authenticated symmetric encryption of the data (AES-GCM)

#BHUSA @BlackHatEvents

26

Private key reconstruction

SHA-512 iLO5 SOC

Boot Hash Hardware Key

SHA-384

Derivation seed

Key Derivation

keymgr: great reverse-engineering challenge
· X factor: a cryptoprocessor · Used operations: SHA384, AES-CTR, AES-GCM
· Two main steps: 1. Derivation of a seed from hardware values 2. A key scheduling function is fed with the seed

#BHUSA @BlackHatEvents

27

Key derivation is fun

0x30 bytes cmd
DERIVED_KEYX
DRBG init cmd
DRBG_SEED_LB
EC gen key
EC key 1

0x30 bytes hw based seed
context
cmd KEY_SCHEDULE

0x240 bytes

cmd DERIVED_KEYX

cmd DERIVED_KEYX

"Commands", wrapper over the cryptoprocessor:
· Derivation step (SHA384) parametrized by a key:
· "KEY_SCHEDULE" · "DERIVED_KEYX" · "DRBG_SEED_LB"

DRBG init
cmd DRBG_SEED_LB

DRBG init
cmd DRBG_SEED_LB

EC gen key

EC gen key

EC key 2

EC key 3

How to generate a deterministic key? · OpenSSL's EC_KEY_generate_key · Replacing default PRNG · Deterministic seed (output from the DERIVED_KEYX command)

#BHUSA @BlackHatEvents

28

We hang on
Objective · Offline generation of this key? (without the iLO hardware)
Fail Hard. Fail Fast. · Complete re-implementation in C, based on our static analysis · Hardware value extraction through the 1day fmt-string ·  decryption failure
Need to escalate · Interfacing with the cryptoprocessor · Step-by-step validation of the stages

#BHUSA @BlackHatEvents

29

Talking to the unknown
Objective(s) · Validate our understanding of the exchanges with the cryptoprocessor · Re-implement the second decryption layer · Update our firmware analysis toolbox
T + 2 weeks

#BHUSA @BlackHatEvents

30

Cryptoprocessor at a glance

+0x0 +0x10

ctrl flags (32-bits) offset (32-bits)

+0x40 +0x80

output buffer (0x30 bytes)

input buffer (0x80 bytes)

#BHUSA @BlackHatEvents

Control flags · SHA384_DIGEST_DATA_START · SHA384_DIGEST_MORE_DATA · SHA384_DIGEST_DATA_END · SHA384_DIGEST_CLEAR_OUTPUT
Offset · Auto-incremented during writes into the input buffer · Size of input data in bits
31

Communication with the cryptoprocessor
How? · Reading and writing the task's memory is enough
1-day to the rescue! · Re-use of the SSH format-string vulnerability · Mapping of the cryptoprocessor in the memory space · Interaction through the exploit's R/W primitives

#BHUSA @BlackHatEvents

32

Unexpected bugs! (1)
Bug #1: SHA384_DIGEST_MORE_DATA (UPDATE) · Expected behavior: update of the internal state of the digest with the current content of the input buffer · Observed behavior: if the input buffer has not been fully filled, data are ignored

Offset Flags Input

0 START

0x180 (0x30 bytes) UPDATE

0x580 (0xB0 bytes) DATA_END

BootHash

HardwareKey

0x00 0x30

0x80
Expected: SHA384( BootHash || HardwareKey ) Observed: SHA384( HardwareKey || HardwareKey[:len(BootHash)] )

#BHUSA @BlackHatEvents

33

Dropping a "secret"

SHA-512 iLO5 SOC

Boot Hash Hardware Key

SHA-384

Derivation seed

#BHUSA @BlackHatEvents

34

Dropping a "secret"

SHA-512 iLO5 SOC

Boot Hash Hardware Key

SHA-384

Derivation seed

#BHUSA @BlackHatEvents

35

Unexpected bugs! (2)
Bug #2: non-contiguous writes into the input buffer · Offset register auto-incremented with the number of input bits, without consideration for the position of the write in the input buffer · Internally the Offset value is used to read the data contiguously/linearly

Offset Flags Input

0 START

0x280 (0x50 octets) DATA_END
Reality Expected

Expected : SHA384( INPUT[:0x60] ) Observed : SHA384( INPUT[:0x50] )

#BHUSA @BlackHatEvents

36

Updating our implementation
Shall we perform a victory dance? · Taking these 2 bugs into account (re-implementing them in our code) · New epic failure, the computed key is still invalid

#BHUSA @BlackHatEvents

37

Debugging 101
Objective(s) · Find debug information to understand our failures · Grab this information · Fix our implementation

T + 3 weeks

#BHUSA @BlackHatEvents

38

printf() is our friend
Debug messages · Intermediary state · Final public key

#BHUSA @BlackHatEvents

39

Where's Waldo?
Goal · Debug information is printed on the UART output · Find UART on the Microserver

#BHUSA @BlackHatEvents

40

Yet another failure
At boot time
Key Schedule Validation: l03wN5OaDle9gyhfEJShR5jv0sKB0tfT25uk2U/vjxRA -----BEGIN PUBLIC KEY----MHYwEAYHKoZIzj0CAQYFK4EEACIDYgAE4StRIN6NFi6X000aNMLePDm0mYmXIpDf 03KrjkhWjZW8z3QNeyUXVNxHayZEKFL6Xk6vjkYYeJNdqg9yEzI0a2GK2emSgp4D RNgUyUpix0jq5+lluKXWUyFQ6rBJ45Dr -----END PUBLIC KEY-----
In our implementation
Key Schedule Validation: enRnbrYwZKTWBJF955yiy5VIbe4ROBE4g1EO5dOrYcVl
· Early failure in the derivation process · Noose is tightening

#BHUSA @BlackHatEvents

41

A new idea

Here be dragons

Key Schedule parameters

iLO5 SOC

Hardware Key

SHA-384

Derivation seed

SHA-384

Key Schedule Validation printf()

Theory · Constants in hardware registers have changed between versions 1.x and 2.x · We need better debugging capabilities

#BHUSA @BlackHatEvents

42

Hardware debugging
Objective(s) · Find debug ports · Use this access to read the hardware registers · Fix our implementation

T + 3 weeks

#BHUSA @BlackHatEvents

43

A strange port

On Microserver Gen10 motherboard · Spotted on HPE website · MICTOR port · Should allow JTAG debugging

#BHUSA @BlackHatEvents

44

Horror museum

In the end, we bought a correct adapter :)

#BHUSA @BlackHatEvents

45

Results
JTAG enumeration Device ID #1: 0101 1011101000000000 01000111011 1 (0x5BA00477) Device ID #2: 0000 0111100100100110 11110000111 1 (0x07926F0F)
Bad results · Problems with TDI · No solution found  we gave up · We are software guys, let's find a software solution!

#BHUSA @BlackHatEvents

46

0day hunting
Objective(s) · Find a new vulnerability in firmware versions 2.x · Read the SOC registers · Fix our implementation
T + 4 weeks

#BHUSA @BlackHatEvents

47

Attack surface

Target: 2.x firmwares · CHIF interface · Several tasks are reachable from the host · recovery image is unencrypted: the blackbox task is present

blackbox task

· Many command handlers
· Command 5: debug menu
· Text mode commands · Output on UART · Example:

bb fdump ( f i l e )

- Hex dump ' f i l e ' . A b s o l u t e path n e c e s s a r y

#BHUSA @BlackHatEvents

48

90's want their vulnerabilities back!

Massive usage of dangerous functions · sprintf · strcpy

#BHUSA @BlackHatEvents

49

Easy game
No mitigation · NX · ASLR · Stack cookies
Target fview command
char stack_buffer[64]; // [sp+5C0h] [bp-C0h]
if ( argc > 1 && !strcmp(argv[1], "fview") ) { if ( argv[2] ) { sprintf(stack_buffer , "/mnt/blackbox/data/%s", (const char *)argv[2]); return sub_19E04(stack_buffer); } return error("filename please.\n"); }

#BHUSA @BlackHatEvents

50

Exploitation plan
Shellcode execution
· Write a small shellcode in data section through command chdir · Simple strcpy of argv[2] at a fixed address in data section · Repeat command to handle null bytes · Small shellcode grabs SP value and jumps in the stack
· Put a kinda-arbitrary sized shellcode in the stack through the stack buffer overflow

Buffer Return @
Final Shellcode

Stager shellcode data

#BHUSA @BlackHatEvents

stack

51

A little disgression

#BHUSA @BlackHatEvents

52

Back to business
Reading "hardware" values ·  Values are the same as in older firmwares

#BHUSA @BlackHatEvents

53

Back to business
Reading "hardware" values ·  Values are the same as in older firmwares
Ripping keymgr code · Execution of two blocks of code · Comparison of the cryptoprocessor output buffer to our implementation

Key Schedule parameters

iLO5 SOC

Hardware Key

SHA-384

Derivation seed

SHA-384

Key Schedule Validation printf()

#BHUSA @BlackHatEvents

54

Back to business
Reading "hardware" values ·  Values are the same as in older firmwares
Ripping keymgr code · Execution of two blocks of code · Comparison of the cryptoprocessor output buffer to our implementation

Key Schedule parameters

iLO5 SOC

Hardware Key

SHA-384

Derivation seed

SHA-384

Values are the same

Key Schedule Validation printf()

#BHUSA @BlackHatEvents

55

To infinity...and beyond!
New theory · Our execution context is different from keymgr · We have to instrument keymgr

#BHUSA @BlackHatEvents

56

Secure boot bypass
Objective(s) · Create a modified firmware · Add debug hooks · Understand our mistakes · Finally, fix our implementation
T + 6 semaines

#BHUSA @BlackHatEvents

57

Good old CVE-2018-7113
Secure Boot bypass · CVE-2018-7113: allows loading an unsigned userland image · The plan: load a modified keymgr with an old vulnerable kernel

iLO5 ASIC (bootrom)

Secure Micro Boot 1.01 (fw 1.30)

neba9 0.9.7 (fw 1.30)
Text

iLO 5 Kernel (fw 1.30)

keymgr (fw 2.33)

keymgr boots! · Displays the same"Key Schedule Validation" as in a normal boot · If we apply minor modifications, it still boots!

#BHUSA @BlackHatEvents

58

Hardware hackers
Arbitrary firmware flashing · Either with a vulnerability: would need to reflash a valid firmware each time we want to flash a modified one · Either through hardware: easier, faster

#BHUSA @BlackHatEvents

59

Hook and printf
Hook setup · Debugging through printf() · Before the key schedule part · Dump the value encoded as base64 on UART
Hook

Key Schedule parameters

iLO5 SOC

Hardware Key

SHA-384

Derivation seed

SHA-384

Key Schedule Validation

· On UART:
Key Schedule coproc status: vOlzOt0Taev0yrxBtI3b33av1zWCZkwtEpnCI+WFCa7cZyqm0KmQT8+sxyduqPya

#BHUSA @BlackHatEvents

60

Comparison

Grabbed value
BC E9 73 3A DD 13 69 EB F4 CA BC 41 B4 8D DB DF 76 AF D7 35 82 66 4C 2D 12 99 C2 23 E5 85 09 AE DC 67 2A A6 D0 A9 90 4F CF AC C7 27 6E A8 FC 9A

Our implementation
8F D6 EA 44 DD 13 69 EB F4 CA BC 41 B4 8D DB DF 76 AF D7 35 82 66 4C 2D 12 99 C2 23 E5 85 09 AE DC 67 2A A6 D0 A9 90 4F CF AC C7 27 6E A8 FC 9A

Value is a SHA-384 hash. What is this magic?

#BHUSA @BlackHatEvents

61

Final bug Race condition
· No use of the cryptoprocessor synchonization mechanism · The copy loop starts before the cryptoprocessor ends its computing, and starts
copying an intermediary state

Checking the theory
· SHA-384 implementation in Python
· Print the intermediary state before the final .digest()
>>> sha384(HardwareKey + ctx_HardwareKey[:0x30]).hexdigest() FINAL STATE : bce9733a2cb047ecb74cd8d408507dbb7937cd5a4599ca655920362216d8a65a9 aa562b74b50e3bfdf5a26e88d15cece31574ffe3f5fa8217c9516988038505d '8 fd6ea44 dd1369ebf4cabc41b48ddbdf76afd73582664c2d1299c223e58509aedc672aa6d0a990 4fcfacc7276ea8fc9a'

#BHUSA @BlackHatEvents

62

Victory
Our decryption tool works! · Decryption of the first envelope · Decryption of the userland image · 4 new tasks · Few differences · "All that for this :)"
Tool is available! https://github.com/airbus-seclab/ilo4_toolbox

#BHUSA @BlackHatEvents

63

Objective(s) · Enjoy the victory · Bring balance to the Force

Conclusion

#BHUSA @BlackHatEvents

T + 2 months
64

Mission debrief
· Recovered the firmware analysis capability · Firmware encryption:
· Unclear added-value for the end-user · Particularly complex implementation · No use of a secure element · Buggy usage of the cryptoprocessor? · iLO5, the same intrinsic weaknesses: · OS primitives too permissive · Broken secure boot · Complete lack of modern mitigation techniques

#BHUSA @BlackHatEvents

65

Brace yourselves

· iLO5 are critical systems: · Patch · Isolate · Monitor
· Available fix: · 2.416 (March 26th, 2021) · "Critical - HPE requires users update to this version immediately."
· Security bulletin HPESBHF041337

6 https://support.hpe.com/hpesc/public/swd/detail?swItemId=MTX_9e149bcaae774cc190a26ea98e 7 https://support.hpe.com/hpesc/public/docDisplay?docId=hpesbhf04133en_us

#BHUSA @BlackHatEvents

66

Greetings!!!!

· Mark Menkhus and the Hewlett Packard Enterprise PSRT · Our teams at Synacktiv and Airbus for their valuable feedbacks and advices · Nicolas Iooss for his research · Raphaël, Xavier for the open-heart surgery on the ML110 server :) · Credits for the DOOM guy faces: Reinchard2 @ ZDoom board8

8 https://forum.zdoom.org/viewtopic.php?f=46&t=48921

#BHUSA @BlackHatEvents

67

KTHXBY!!!
Thank you for your attention

Questions?
To contact us: fabien [dot] perigaud [at] synacktiv [dot] com - @0xf4b
alexandre [dot] gazet [at] airbus [dot] com snorky [at] insomnihack [dot] net - @_Sn0rkY

#BHUSA @BlackHatEvents

68

