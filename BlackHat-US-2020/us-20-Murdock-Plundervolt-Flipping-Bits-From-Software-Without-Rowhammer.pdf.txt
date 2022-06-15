ROOT privileges for web apps!

DRAM organisation

3

bank 0
chip
row 0 row 1 row 2 ... row 32767
row buffer

DRAM organisation
bank 0
row 0 row 1 row 2 ... row 32767
row buffer

4
64k cells 1 capacitor, 1 transitor each

Rowhammer
DRAM bank
11111111111111 11111111111111 11111111111111 11111111111111
... 11111111111111
row buffer

5
· Cells leak  need refresh · Max. refresh interval to guarantee
data integrity · Cells leak faster upon proximate
accesses  Rowhammer

Rowhammer

activate

DRAM bank
11111111111111 11111111111111 11111111111111 11111111111111
... 11111111111111
row bbuuffffeer

6
· Cells leak  need refresh · Max. refresh interval to guarantee
data integrity copy · Cells leak faster upon proximate
accesses  Rowhammer

Rowhammer

7

activate

DRAM bank
11111111111111 11111111111111 11111111111111 11111111111111
... 11111111111111
row bbuuffffeer

· Cells leak  need refresh

· Max. refresh interval to guarantee data integrity

· Cells leak faster upon proximate

copy

accesses  Rowhammer

Rowhammer

activate

DRAM bank
11111111111111 11111111111111 11111111111111 11111111111111
... 11111111111111
row bbuuffffeer

8
· Cells leak  need refresh · Max. refresh interval to guarantee
data integrity copy · Cells leak faster upon proximate
accesses  Rowhammer

Rowhammer

9

activate

DRAM bank
11111111111111 11111111111111 11111111111111 11111111111111
... 11111111111111
row bbuuffffeer

· Cells leak  need refresh

· Max. refresh interval to guarantee data integrity

· Cells leak faster upon proximate

copy

accesses  Rowhammer

Rowhammer
DRAM bank
11111111111111 11111111111111 10111110101111 11111111111111
... 11111111111111
row bbuuffffeer

10
bit flips in row 2!
· Cells leak  need refresh · Max. refresh interval to guarantee
data integrity · Cells leak faster upon proximate
accesses  Rowhammer

Search for page with flip

11

Row 0

Row 23

Hammering memory locations in different rows

Search for page with flip

12

Row 0

Row 23

Hammering memory locations in different rows

Search for page with flip

13

Row 0

Row 23

Hammering memory locations in different rows

Search for page with flip

14

Row 0

Row 23

Hammering memory locations in different rows

Search for page with flip

15

Row 0

Row 23

Hammering memory locations in different rows

Search for page with flip

16

Row 0

Row 23

Hammering memory locations in different rows

Search for page with flip

17

Row 0

Row 23

Hammering memory locations in different rows

Search for page with flip

18

Row 0

Row 23

Hammering memory locations in different rows

Search for page with flip

19

Row 0

Row 23

Hammering memory locations in different rows

Page Table Example

0x7000 ­ 0x7FFF 0x6000 ­ 0x6FFF 0x5000 ­ 0x5FFF 0x4000 ­ 0x4FFF 0x3000 ­ 0x3FFF 0x2000 ­ 0x2FFF 0x1000 ­ 0x1FFF
0x0 ­ 0xFFF

PTE 7 PTE 6 PTE 5 PTE 4 PTE 3 PTE 2 PTE 1 PTE 0

20
Page Table Page Table User Page Page Table Page Table Page Table Kernel Page Page Table Page Table Page Table

Page Table Example

0x7000 ­ 0x7FFF 0x6000 ­ 0x6FFF 0x5000 ­ 0x5FFF 0x4000 ­ 0x4FFF 0x3000 ­ 0x3FFF 0x2000 ­ 0x2FFF 0x1000 ­ 0x1FFF
0x0 ­ 0xFFF

PTE 7 PTE 6 PTE 5 PTE 4 PTE 3 PTE 2 PTE 1 PTE 0

21
Page Table Page Table User Page Page Table Page Table Page Table Kernel Page Page Table Page Table Page Table

Page Table Example

0x7000 ­ 0x7FFF 0x6000 ­ 0x6FFF 0x5000 ­ 0x5FFF 0x4000 ­ 0x4FFF 0x3000 ­ 0x3FFF 0x2000 ­ 0x2FFF 0x1000 ­ 0x1FFF
0x0 ­ 0xFFF

PTE 7 PTE 6 PTE 5 PTE 4 PTE 3 PTE 2 PTE 1 PTE 0

22
Page Table Page Table User Page Page Table Page Table Page Table Kernel Page Page Table Page Table Page Table

Code Page Example
JE
01110100

23
HLT
1 1110100

Code Page Example
JE
01110100

24
XORB
00110100

Code Page Example
JE
01110100

25
PUSHQ
01010100

Code Page Example
JE
01110100

26
<prefix>
01100100

Code Page Example
JE
01110100

27
JL
01111 100

Code Page Example
JE
01110100

28
JO
01110000

Code Page Example
JE
01110100

29
JBE
0 1 1 1 0 11 0

Code Page Example
JE
01110100

30
JNE
0 1 1 1 0 1 01

Rowhammer

31

· DDR3 affected · DDR4 affected · Even ECC affected despite error correction!
· Can SGX's integrity protection prevent Rowhammer?

Plundervolt: Flipping Bits from Software
without Rowhammer
Kit Murdock, Daniel Gruss, David Oswald
#BHUSA @BLACKHATEVENTS

Memory Mapped Registers

34

Software
Memory-mapped Re ter
Hardware

DVFS

CLKSCREW

36

Adrian Tang et al. "CLKSCREW: exposing the perils of security-oblivious energy management" In: USENIX Security Symposium 2017

CLKscrew attack

add.w (a0)+,d1

cmp.l a0,d0

bcc.s l p

m a.l 1 ,a1

cmp.w (a1),d1

b .w

csm

37
2+2=5

Trustzone v normal world

38

Frequency & Volt e e ul tor

ru t one tru te co e

or l untru te co e

CPU Core

CLKSCREW

39

· Infer secret AES key that was stored within Trustzone · Trick Trustzone into loading a self-signed app

VoltJockey

40

Pengfei Qiu et al. "VoltJockey: Breaching TrustZone by Software-Controlled Voltage Manipulation over Multi-core Frequencies"
In: CCS 2019

ARM

What about Intel?

42

45

Intel Power Management

46

msr 0x150

Static & dynamic voltage

47

Will it fault?

48

uint64_t multiplier uint64_t correct uint 64_t var

= 0x1122334455667788; = 0xdeadbeef*multiplier; = 0xdeadbeef*multiplier;

// start undervolting

while ( var == correct ) {
var = 0xdeadbeef * multiplier; } // stop undervolting // Can we ever get here? uint64_t flipped_bits = var ^ correct;

Intel SGX

SGX

52

Untrusted part Create Enclave
Call Trusted Function
...

Call gate

Trusted part Trusted Function
Return

Operating System

Physical Memory

53

Memory Encryption
Engine

EPC
Encrypted Memory

54
· Bit flips in the EPC? · Integrity check fails! ·  Lock up memory controller ·  System halts immediately (no exploit, but DoS!)

Will Plundervolt work in SGX?

RSA Basics

58

ChineIsn······etiemPUEDPPRlurnune'ivpbcbstcerarlrluiiyyclctmseepepktKttek/xem/VeaSdeyayeyi:igcre:nCemhinfd,yanrnd,mypnmppt,neeqateeoslrseslgtsiarToaagcgpehnehossyeswdwoitueihtrhseppfreomiuvbsarltiecoRtkkhpeeSeyytAimisation

RSA Signature/Decryption with CRT

59

n = p ×q
M = Cd mod n

dp = d mod p - 1 dq = d mod q - 1

mp = Cdp mod p

M'

mq = Cdq mod q

M = (p-1 mod q)× (mq - mp)× p + mp

Fault Attack on CRT-RSA

60

· Bellcore: gcd(M' - M , n) · Lenstra: gcd((M')e - C, n) · yields p or q (and dividing n by it gives the other)

RSA Decryption

61

// Start undervolting uint8_t rsa_dec_ecall(int iterations) {
//Waitforfirstfault trigger_ fault(iterations);
//Actualdecryption ipps RSA_ Decrypt(ct,dec,pPrv,scratch Buffer); } // Stop undervolting

What else can we break?

AES basics

65

· Symmetric key crypto
· Encrypt messages for transfer over public channel and data for (untrusted) storage
· 4 ×4 byte state, 10 rounds: SubBytes, ShiftRows, MixColumns, AddRoundKey
· HW-accelerated with AES-NI

AES inside SGX

66

Differential Fault Analysis Attack

Differential Fault Attack on AES

68

68

Proof-of-concept

69

// Start undervolting do {
plaintext= <randomlygenerated>; result 1=aes 128 _encryption(plaintext); result 2=aes 128 _encryption(plaintext);
} while(result1 == result 2) // Stop undervolting

It's not just crypto!

Memory Corruption

73

struct_ foo_ t *foo = &arr[offset]; foo->foo = enclave_ secret;

Memory Corruption

74

foo = arr + offset * 0x24

How difficult to fault is it?

Idle & crash voltage ­ Intel(R) Core i3-7100U CPU 78

Voltage (V)

1.1

1.0

Idle Crash

0.9

0.8

0.7

0.6

0.5 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4
Frequency (GHz)

Idle, error & crash voltages ­ Intel Core i3-7100U 80

Voltage (V)

1.1

1.0

Idle Errors Crash

0.9

0.8

0.7

0.6

0.5 0.4 0.6 0.8 1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.4
Frequency (GHz)

Error & crash voltages ­ Intel Core i3-7100U

81

0.70
Errors Crash
0.65

Voltage (V)

0.60

0.55

0.50

0.7

0.9

1.1

1.3

1.5

1.7

Frequency (GHz)

Faulting

82

Code Name Skylake
Kaby Lake
Kaby Lake-R
Coffee Lake-R

Model No i7-6700K i7-7700HQ i3-7100U-A i3-7100U-B i3-7100U-C i7-8650U-A i7-8650U-B i7-8550U i9-9900U

Frequency Tested 2.0GHz 2.0GHz 1.0GHz 2.0GHz 2.0GHz 1.9GHz 1.9GHz 2.6GHz 3.6GHz

Two Intel Core i3-7100U CPUs

83

Two Intel Core i3-7100U CPUs

84

Faulting

85

All faults were injected at normal ambient temperature

More undervolting
· Idle cores · More crashes!

Less undervolting
· Cores maxed · Fewer crashes

Faulting some random stuff

Concurrent work

Concurrent Work

91

Kenjar, Zijo et al "V0LTpwn: Attacking x86 Processor Integrity from Software"
In: USENIX Security Symposium 2020
Qiu, P at al. "Breaking SGX by software-controlled voltage-induced hardware faults." In AsianHOST 2019

Summary

92

· A new type of attack against Intel · Breaks the integrity of SGX · Within SGX
· Retrieve keys using AES-NI · Retrieve RSA key · Induce memory corruption in bug free code · Make enclave write secrets to untrusted memory

Acknowledgements

93

This research is partially funded by the Research Fund KU Leuven, and by the Agency for Innovation and Entrepreneurship (Flanders). Jo Van Bulck is supported by a grant of the Research Foundation ­ Flanders (FWO). This research is partially funded by the Engineering and Physical Sciences Research Council (EPSRC) under grants EP/R012598/1, EP/R008000/1, and by the European Union's Horizon 2020 research and innovation programme under grant agreements No. 779391 (FutureTPM) and No. 681402 (SOPHIA).

Thank you

