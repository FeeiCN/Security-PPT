Remote Timing Attacks on TPMs, AKA TPM-Fail
Daniel Moghimi

About Me
· Daniel Moghimi
· @danielmgmi · https://moghimi.org

· Security Researcher

· PhD Candidate @ WPI
· Microarchitectural Attacks · Side Channels · Breaking Crypto Implementations · Trusted Execution Environment (Intel SGX)

#BHUSA @BLACKHATEVENTS @DANIELMGMI

2

Thanks!
· Berk Sunar @ WPI · Nadia Heninger @ UCSD · Thomas Eisenbarth @ UzL · Jan Wichelmann @ UzL

#BHUSA @BLACKHATEVENTS @DANIELMGMI

3

Cryptanalysis
· Cryptosystem with an input m, output c, and secret k · Attacker tries to learn k by looking at (m, c)

#BHUSA @BLACKHATEVENTS @DANIELMGMI

k

m

c

Encrypt Decrypt
Sign

4

Cryptanalysis

· Cryptosystem with an input m, output c, and secret k · Attacker tries to learn k by looking at (m, c)
 : 1, 1 =  ×   = 1    = -1  +   

1 = 1-1  + 1   2 = 2-1  + 2  

k

m

c

Encrypt Decrypt
Sign

#BHUSA @BLACKHATEVENTS @DANIELMGMI

5

Cryptanalysis

· Cryptosystem with an input m, output c, and secret k · Attacker tries to learn k by looking at (m, c)

 : 1, 1 =  ×   = 1    = -1  +   
1= 2=  1 = -1  + 1   2 = -1  + 2  

k

m

c

Encrypt Decrypt
Sign

#BHUSA @BLACKHATEVENTS @DANIELMGMI

6

Cryptanalysis

· Cryptosystem with an input m, output c, and secret k · Attacker tries to learn k by looking at (m, c)

 : 1, 1 =  ×   = 1    = -1  +   
1= 2=  1 = -1  + 1   2 = -1  + 2  
2 - 1 = 2 - 1   

k

m

c

Encrypt Decrypt
Sign

#BHUSA @BLACKHATEVENTS @DANIELMGMI

7

Side-Channel Cryptanalysis
· Cryptosystem with an input m, output c, and secret k · Attacker tries to learn k by looking at (m, c) and signal s

#BHUSA @BLACKHATEVENTS @DANIELMGMI

s

k

m

c

Encrypt Decrypt
Sign

8

Side-Channel Attacks

· Channels
· Power Analysis · EM Analysis ·... · Timing Analysis · CPU Side Channels

· Threat Models:
· Physical Access · Local Access (Co-location) · Remote

#BHUSA @BLACKHATEVENTS @DANIELMGMI

9

Secure Elements
Software is insecure. Heartbleed?
Computers are just Evil?!

Untrusted /Bad Org.?
Rootkits? Ransomware?

#BHUSA @BLACKHATEVENTS @DANIELMGMI

Secure Elements
Software is insecure. Heartbleed? Computers are just Evil?!
#BHUSA @BLACKHATEVENTS @DANIELMGMI

Untrusted /Bad Org.?
Rootkits? Ransomware?
Hardware-based Root of Trust?!
11

Trusted Platform Module (TPM)
· Security Chip for Computers? · Tamper Resistant · Side-Channel Resistant · Crypto Co-processor

#BHUSA @BLACKHATEVENTS @DANIELMGMI

12

Trusted Platform Module (TPM)
· Security Chip for Computers? · Tamper Resistant · Side-Channel Resistant · Crypto Co-processor

#BHUSA @BLACKHATEVENTS @DANIELMGMI

Trusted Computing Base
13

Trusted Platform Module (TPM)
· Cryptographic Co-processor, specified by Trusted Computing Group
· Secure Storage · Integrity Measurement · TRNG · Hash Functions · Encryption
· Digital Signatures

#BHUSA @BLACKHATEVENTS @DANIELMGMI

14

TPM ­ Digital Signatures
· Applications
· Trusted Execution of Signing Operations · Remote Attestation

· TPM 2.0 supports Elliptic-Curve Digital Signature
· ECDSA · ECSchnorr · ECDAA (Anonymous Remote Attestation)

#BHUSA @BLACKHATEVENTS @DANIELMGMI

15

Trusted Computing Group
· https://trustedcomputinggroup .org/membership/certification/

· https://trustedcomputinggroup .org/membership/certification/ tpm-certified-products/

#BHUSA @BLACKHATEVENTS @DANIELMGMI

16

STMicroelectronics ST33TPHF2ESPI
· ST33TPHF2ESPI Data Brief
· https://www.st.com/resource/en/data_brief/st33tphf2espi.pdf

· ST33TPHF2ESPI CC Evaluation
· https://www.ssi.gouv.fr/uploads/2018/10/anssi-cible-cc-2018_41en.pdf

#BHUSA @BLACKHATEVENTS @DANIELMGMI

17

#BHUSA @BLACKHATEVENTS @DANIELMGMI

18

Are TPMs really sidechannel resistant?
19

High-resolution Timing Test
· TPM frequency ~= 32-120 MHz · CPU Frequency is more than 2 GHz

#BHUSA @BLACKHATEVENTS @DANIELMGMI

20

High-resolution Timing Test ­ Intel PTT (fTPM)

· Intel Platform Trust Technology (PTT)
· Integrated firmware-TPM inside the CPU package · Runs on top of Converged Security and
Management Engine (CSME) · Standalone low power processor · Has been around since Haswell

CPU

PCH

CSME

fTPM

#BHUSA @BLACKHATEVENTS @DANIELMGMI

21

High-resolution Timing Test ­ Intel PTT (fTPM)

· Intel Platform Trust Technology (PTT)
· Integrated firmware-TPM inside the CPU package · Runs on top of Converged Security and
Management Engine (CSME)

CPU

PCH

CSME

fTPM

Histogram

#BHUSA @BLACKHATEVENTS @DANIELMGMI

22

High-resolution Timing Test ­ Intel PTT (fTPM)
· Linux TPM Command Response Buffer (CRB) driver · Kernel Driver to increase the Resolution

CPU

PCH

CSME

fTPM

#BHUSA @BLACKHATEVENTS @DANIELMGMI

23

High-resolution Timing Test ­ ECDSA Nonce

· Intel fTPM: 4-bit Window Nonce Length Leakage
· ECDSA · ECSChnorr · BN-256 (ECDAA)

4.67

4.72

#BHUSA @BLACKHATEVENTS @DANIELMGMI

4.76

4.8

Nonce
0101000100111111...111 0000100100111111...111 1101000100111111...111 0000000000111111...111 0000000000001111...111
t 4.84
24

High-resolution Timing Test ­ ECDSA Nonce

· Intel fTPM: 4-bit Window Nonce Length Leakage
· ECDSA · ECSChnorr · BN-256 (ECDAA)

4.67

4.72

#BHUSA @BLACKHATEVENTS @DANIELMGMI

4.76

4.8

Nonce
0101000100111111...111 0000100100111111...111 1101000100111111...111 0000000000111111...111 0000000000001111...111
t 4.84
25

High-resolution Timing Test ­ ECDSA Nonce

· Intel fTPM: 4-bit Window Nonce Length Leakage
· ECDSA · ECSChnorr · BN-256 (ECDAA)

4.67

4.72

#BHUSA @BLACKHATEVENTS @DANIELMGMI

4.76

4.8

Nonce
0101000100111111...111 0000100100111111...111 1101000100111111...111 0000000000111111...111 0000000000001111...111
t 4.84
26

High-resolution Timing Test ­ ECDSA Nonce

· Intel fTPM: 4-bit Window Nonce Length Leakage
· ECDSA · ECSChnorr · BN-256 (ECDAA)

4.67

4.72

#BHUSA @BLACKHATEVENTS @DANIELMGMI

4.76

4.8

Nonce
0101000100111111...111 0000100100111111...111 1101000100111111...111 0000000000111111...111 0000000000001111...111
t 4.84
27

High-resolution Timing Test ­ ECDSA Nonce

· Intel fTPM: 4-bit Window Nonce Length Leakage
· ECDSA · ECSChnorr · BN-256 (ECDAA)

4.67

4.72

#BHUSA @BLACKHATEVENTS @DANIELMGMI

4.76

4.8

Nonce
0101000100111111...111 0000100100111111...111 1101000100111111...111 0000000000111111...111 0000000000001111...111
t 4.84
28

High-resolution Timing Test ­ ECDSA Nonce

· Intel fTPM: 4-bit Window Nonce Length Leakage
· ECDSA · ECSChnorr · BN-256 (ECDAA)

4.67

4.72

#BHUSA @BLACKHATEVENTS @DANIELMGMI

3.33 ms

4.76

4.8

Nonce
0101000100111111...111 0000100100111111...111 1101000100111111...111 0000000000111111...111 0000000000001111...111
t 4.84
29

DEMO, TIMING

#BHUSA @BLACKHATEVENTS @DANIELMGMI

30

High-resolution Timing Test - Analysis
· RSA and ECDSA timing test on 3 dedicated TPM and Intel fTPM · Various non-constant behaviour for both RSA and ECDSA

#BHUSA @BLACKHATEVENTS @DANIELMGMI

31

32

High-resolution Timing Test ­ ECDSA Nonce
· STMicro TPM: Bit-by-Bit Nonce Length Leakage

#BHUSA @BLACKHATEVENTS @DANIELMGMI

33

TPM-Fail ­ Recovering Private ECDSA Key
· TPM is programmed with an unknown key · We already have a template for .
1. Collect list of signatures (, ) and timing samples . 2. Filter signatures based on  and keeps (, ) with a known bias. 3. Lattice-based attack to recover private key , from signatures
with biased nonce .

#BHUSA @BLACKHATEVENTS @DANIELMGMI

34

Lattice and Hidden Number Problem
·  = -1  +   

#BHUSA @BLACKHATEVENTS @DANIELMGMI

35

Lattice and Hidden Number Problem
·  = -1  +     -1 - -1 - -1  0  

#BHUSA @BLACKHATEVENTS @DANIELMGMI

36

Lattice and Hidden Number Problem
·  = -1  +     -1 - -1 - -1  0   ·  = --1,  = --1   +  +  = 0

#BHUSA @BLACKHATEVENTS @DANIELMGMI

37

Lattice and Hidden Number Problem
·  = -1  +     -1 - -1 - -1  0   ·  = --1,  = --1   +  +  = 0 · Let  be the upper bound on ki and (, 0, 1 ... , ) is unknown

[1] Da#nBHBUoSnAeh@aBLnAdCKRHaAmTaEVraENthTnS a@mDAVNeInELkMaGteMsIan. Hardness of Computing the Most Significant Bits of Secret Keys in Diffie-Hellman and Related Schemes

38

Lattice and Hidden Number Problem

·  = -1  +     -1 - -1 - -1  0   ·  = --1,  = --1   +  +  = 0 · Let  be the upper bound on ki and (, 0, 1 ... , ) is unknown
· Lattice Construction:









1 2

... 

 

1 2 ... 



LLL/BKZ

#BHUSA @BLACKHATEVENTS @DANIELMGMI

39

DEMO LATTICE ATTACK
40

TPM-Fail ­ Key Recovery Results
· Intel fTPM
· ECDSA, ECSchnorr and BN-256 (ECDAA) · Three different threat model System, User, Network
· STMicroelectronics TPM
· CC EAL4+ Certified · Give you the key in 80 minutes

#BHUSA @BLACKHATEVENTS @DANIELMGMI

41

Timing difference for each window

(4.76e8 - 4.72e8)/3600e6 * 1000 = 1.11 ms

ping 192.168.1.x

average rtt 0.713 ms

ping 1.1.1.1 (Cloudflare DNS) average rtt 19.312 ms 42

TPM-Fail Case Study: StrongSwan VPN

VPN Client

VPN Server

TPM Device

#BHUSA @BLACKHATEVENTS @DANIELMGMI

43

TPM-Fail Case Study: StrongSwan VPN

VPN Client
_[ , , , ... ]

VPN Server

TPM Device

#BHUSA @BLACKHATEVENTS @DANIELMGMI

44

TPM-Fail Case Study: StrongSwan VPN

VPN Client
_[ , , , ... ]

VPN Server

_[ , , , ... ] - = ()

#BHUSA @BLACKHATEVENTS @DANIELMGMI

TPM Device
45

TPM-Fail Case Study: StrongSwan VPN

VPN Client
_[ , , , ... ]

VPN Server

_[ , , , ... ] - = ()

_[ , (, ... ) ]

#BHUSA @BLACKHATEVENTS @DANIELMGMI

TPM Device
46

TPM-Fail Case Study: StrongSwan VPN

VPN Client
_[ , , , ... ]

VPN Server

_[ , , , ... ] - = ()

_[ , (, ... ) ]

_[ , (, ... ) ]
#BHUSA @BLACKHATEVENTS @DANIELMGMI

TPM Device
47

TPM-Fail Case Study: StrongSwan VPN

VPN Client
_[ , , , ... ]

VPN Server

_[ , , , ... ] - = ()

_[ , (, ... ) ]

#BHUSA @BLACKHATEVENTS @DANIELMGMI

TPM Device
48

TPM-Fail Case Study: StrongSwan VPN

VPN Client
_[ , , , ... ]

VPN Server

_[ , , , ... ] - = ()

_[ , (, ... ) ]

_[ , (, ... ) ]
#BHUSA @BLACKHATEVENTS @DANIELMGMI

TPM Device
49

TPM-Fail Case Study: StrongSwan VPN Key Recovery
· Remote Key Recovery after about 44,000 handshake ~= 5 hours

#BHUSA @BLACKHATEVENTS @DANIELMGMI

50

Remote StrongSwan VPN

User Adversary

Remote Sample UDP App

System Adversary

51

CacheQuote [2]

#BHUSA @BLACKHATEVENTS @DANIELMGMI

[2] F Dall, G De Micheli, T Eisenbarth, D Genkin, N Heninger, A Moghimi, Y Yarom.

52

CacheQuote: Efficiently Recovering Long-term Secrets of SGX EPID via Cache Attacks

Cryptographic Implementation is Hard - ECDSA
 : 1, 1 =  ×   = 1    = -1  +   

#BHUSA @BLACKHATEVENTS @DANIELMGMI

53

Cryptographic Implementation is Hard - ECDSA
 : 1, 1 =  ×   = 1    = -1  +   

#BHUSA @BLACKHATEVENTS @DANIELMGMI

54

Cryptographic Implementation is Hard - ECDSA
 : 1, 1 =  ×   = 1    = -1  +     = 3  3 ×  = 2 + 

#BHUSA @BLACKHATEVENTS @DANIELMGMI

55

Cryptographic Implementation is Hard - ECDSA
 :
1, 1 =  ×   = 1    = -1  +     = 3  3 ×  = 2 +   = 7  7 ×  = 2 2 + 2 + 

#BHUSA @BLACKHATEVENTS @DANIELMGMI

56

Cryptographic Implementation is Hard - ECDSA
 :
1, 1 =  ×   = 1    = -1  +   
 = 3  3 ×  = 2 +   = 7  7 ×  = 2 2 + 2 +   = 7  23 ×  = 2 2(2(2) + ) +  + 

#BHUSA @BLACKHATEVENTS @DANIELMGMI

57

Cryptographic Implementation is Hard - ECDSA

 :

1, 1 =  ×   = 1    = -1  +   

 = 3  3 ×  = 2 +   = 7  7 ×  = 2 2 + 2 +   = 7  23 ×  = 2 2(2(2) + ) +  + 

//Scalar Mul: Add & Double Q = 0 R = G for k_b in k:
if k_b == 1: Q = add(Q, R)
R = double(R) return Q

#BHUSA @BLACKHATEVENTS @DANIELMGMI

58

Cryptographic Implementation is Hard
· Many Algorithms to do the same thing
· Scalar Multiplication
· Double-Add Algorithm · Montgomery Double-Add · Sliding Window · Fixed Window
· Unclear Threat Model
· What is a side channel? · Power Analysis, Timing, Cache?

#BHUSA @BLACKHATEVENTS @DANIELMGMI

59

Software Leakages
· Secret Dependent Control Flow
for(int i = 0; i < Bitlength(key); ++i)
· Secret Dependent Memory Access Pattern
state[i] = state[i] ^ sbox[roundKey[i]]
· Secret Dependent Timing, e.g: ARM Cortext-M3 umull

#BHUSA @BLACKHATEVENTS @DANIELMGMI

60

MicroWalk Goal
· Automated Analysis · Dynamic Approach · Binary-level Analysis:
· Leakages introduced by compilation · Closed-source libraries
· Locate leakage source at Instruction Level

#BHUSA @BLACKHATEVENTS @DANIELMGMI

61

MicroWalk Model
· In practice: Attacker measures
· Execution time for (int i = 0; i < bitlength(key); ++i) · Memory usage pattern state[i] = state[i] ^ sbox[roundKey[i]]
· In theory: Attacker gets access to execution trace with
· Executed instructions · Branch targets · Memory access offsets

#BHUSA @BLACKHATEVENTS @DANIELMGMI

62

MicroWalk Approach
· Generate set of random test cases and capture execution traces · Analysis A: Compute pairwise diffs

#BHUSA @BLACKHATEVENTS @DANIELMGMI

63

MicroWalk Approach
· Generate set of random test cases and capture execution traces · Analysis A: Compute pairwise diffs · Analysis B: Compute mutual information between execution trace
and input

#BHUSA @BLACKHATEVENTS @DANIELMGMI

64

MicroWalk Implementation
· Dynamic binary instrumentation using Intel Pin · Collect traces while program runs · Modules:
· Emulate other CPUs or disable certain capabilities (e.g. AES-NI) · Modify RDRAND output

#BHUSA @BLACKHATEVENTS @DANIELMGMI

65

MicroWalk Implementation
· Raw traces only contain absolute addresses of memory accesses 0x1111107A  sbox+0x7A
· Removal of uninteresting trace entries  considerable size reduction
· Modules:
· Configure memory address leakage granularity 0x156F  0x1540

#BHUSA @BLACKHATEVENTS @DANIELMGMI

66

MicroWalk Implementation
· Load and analyze preprocessed traces · Optionally pass results to visualization stage · Modules:
· Compute pairwise trace diffs · Calculate mutual information for each memory accessing instruction

#BHUSA @BLACKHATEVENTS @DANIELMGMI

67

Coordinated Disclosure - STMicroelectronics

· STMicroelectronics (CVE-2019-16863)
· 05/15/2019: Reported to ST · 05/17/2019: Acknowledged · Lots of calls/emails to clarify the disclosure process · 09/12/2019: Verified new version of STM TPM firmware · After 11/12/2019:
· HP and Lenovo have issued firmware updates. · ST released a list of affected devices.

05/15/2019: Report TPM Vuln to STM

09/12/2019: We verified new version
of STM TPM

05/17/2019: STM Acknowledged
#BHUSA @BLACKHATEVENTS @DANIELMGMI

Post 11/12/2019: HP

and Lenovo issued

firmware update

68

Coordinated Disclosure - Intel
· Intel (CVE-2019-11090)
· 02/01/2019: Reported to IPSIRT · 02/12/2019: Acknowledged (Outdated Intel IPP Crypto library) · 11/12/2019: Firmware Update for Intel Management Engine

02/01/2019: Reported fTPM Vulns to IPSIRT

11/12/2019: (CVE-201911090) Firmware Update
for CSME

02/12/2019:

Acknowledged Outdated

#BHUSA @BLACKHATEVENTS @DANIELMGMI

IPP Library

69

MicroWalk Analysis Results
· Rigorous Analysis of two Closed-source Libraries

· Intel IPP CVEs
· CVE-2018-12155 · CVE-2018-12156
06/22/2018: Report IPP Vulns
to IPSIRT

12/05/2018: CVE-2018-12155

02/12/2019: Acknowledged Outdated IPP
Library

06/25/2018: Acknowledged
the Receipt
#BHUSA @BLACKHATEVENTS @DANIELMGMI

02/01/2019: Report fTPM Vulns to IPSIRT

11/12/2019:

(CVE-2019-

11090) Firmware

Update for CSME

70

Questions?!

TPM-FAIL
https://tpm.fail/

https://github.com/ VernamLab/TPM-Fail

https://www.usenix.org/conference/us enixsecurity20/presentation/moghimi
#BHUSA @BLACKHATEVENTS @DANIELMGMI

https://github.com /UzL-ITS/Microwalk
71

