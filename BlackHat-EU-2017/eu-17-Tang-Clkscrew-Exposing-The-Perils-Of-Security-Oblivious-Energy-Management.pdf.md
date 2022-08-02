CLKSCREW
Exposing the Perils of Security-Oblivious Energy Management
Adrian Tang, Simha Sethumadhavan, Salvatore Stolfo
Columbia University

$> whoami

Adrian Tang -- Ph.D. candidate @ Columbia University
Member of - Intrusion Detection Systems Labs (IDS) - Computer Architecture and Security Technologies Lab (CASTL)
Interests - Reverse engineering - Bug hunting - Malware analysis
Security research mainly focusing on hardware-software interfaces

@0x0atang

https://0x0atang.github.io

Today's systems cannot exist without

Energy Management

Sun's surface

astronomical power density -> crazy hotspots!
Rocket nozzle

2

Nuclear reactor

Pentium III

Hot plate

Pentium II

Pentium Pro

Pentium i486

i386

Source: Adapted from S. Borkar (Intel)

Today's systems cannot exist without Energy Management

Industry

Academia
voltage

power
energy frequency
Source:Word-cloud from ISCA, ASPLOS, MICRO, HPCA (2000 - 2016)

Pervasive Essential
stay secure with Today's systems cannot exist without
Energy Management
Complicated

Exploiting software interfaces to Energy Management

Software-based attacker

Stretch operational limits

frequency

voltage

Induce faults
key decryption

Exploiting software interfaces to Energy Management

Software-based attacker

Stretch
Tradiotipoenraatliofanualltlimatittsacks
Need physical proximity Need separate equipment Soldering, crocodile clips, wire, etc

frequency

voltage

Induce faults
key decryption

CLKSCREW: Exposing the perils of security-oblivious Energy Management
New attack vector that exploits energy management Practical attack on trusted computing on ARM devices Impacts hundreds of millions of deployed devices Lessons for future energy management designs to be security-conscious

Outline
I. DVFS and Deep Dive into Hardware Regulators II. The CLKSCREW Attack III. Trustzone Attack 1: Secret AES Key Inference IV. Trustzone Attack 2:Tricking RSA Signature Validation V. Concluding Remarks

Dynamic Voltage and Frequency Scaling (DVFS)

Energy consumption

Frequency Voltage

DVFS

Hardware & Software Support for DVFS

Software
DVFS
Hardware

Power Governor Vendor Device Driver
Memory-Mapped Registers

Frequency Regulator

Voltage Regulator

Our Target
Nexus 6 - ARMv7 Quad-core 2.6GHz Snapdragon Krait SoC

Nexus 6 - HW Regulators and SW Interfaces

Frequency regulators

PLL (fixed rate)

SoC Processor (Nexus 6)

Clock Domain (per-core)
300 MHz 0

HFPLL (variable rate)

N

*

19.2 MHz

Clock 1 MUX

Half Divider

N/2 * 19.2 MHz 2

Core

N Multiplier

Source Selector

Voltage regulators

Voltage output to cores

Voltage output to other peripherals

0 1

PMA8084

2 3

PMIC

CCoCorCeoroer0er0e00
Voltage Domain (All cores)

Input
SPM (All cores)
Voltage Control

SoC Processor (Nexus 6)

Operating frequency and voltage can be configured via memory-mapped registers from software
https://github.com/0x0atang/clkscrew/blob/master/faultmin_SD805/glitch_sd805.c

First sign of trouble...
Curious crashes

Thinking out of the box...
Temperature matters

Do hardware regulators impose limits to frequency/voltage changes?

Freq / Voltage Operating Point Pairs (OPPs)
 Unintended computing behaviors  Software-controlled frequency and voltage settings  Verify frequency and voltage settings are indeed properly configured
Frequency: cat /d/clk/krait0_clk/measure Voltage: cat /d/regulator/krait0/voltage

Freq / Voltage Operating Point Pairs (OPPs)

Nexus 6

3.5 0axiPuP 233 9HnGor VtoFN 233
3.0
2.5

1HxuV 6

Frequency (GHz) )rHquHnFy (GHz)

2.0

1.5

1.0

Legend:
Vendor-recommended

0.5

0.0

0.5

0.6

0.7

0.8

0.9

1.0

1.1

1.2

1.3

9oOtagH (9)
Voltage (V)

Frequency / Voltage Operating Point Pairs (OPPs)

3.5
0axiPuP 233
9HnGor VtoFN 233 3.0

1HxuV 6

Frequency (GHz) )rHquHnFy (GHz)

No safeguard hardware limits

2.5

Lower voltage

2.0

Lower minimum required

frequency to induce instability

1.5

1.0

0.5
Legend:

Vendor-recommended

0.0

0.5

0.6

0.7

0.8

0.9

1.0

1.1

1.2

1.3

Max OPP reached before instability

9oOtagH (9)
Voltage (V)

Freq / Voltage Operating Point Pairs (OPPs)

Frequency (GHz) )rHquHnFy (GHz)
Fre)rHqquuHenFny (cGyHz()GHz)

2.5

Device `A' 1HxuV 6P (A57 FOuVtHr ForH)

0axiPuP 2PP

9HnGor VtoFN 2PP

2.0

1.5

1.0

0.05.65

0.70

0.75

0.80

0.85

0.90

0.95

1.00

1.05

9oOtagH (9)
Voltage (V)

3.0

Device `B' 3ixHO ("3HrforPanFH" FOuVtHr ForH)

0axiPuP 233

9HnGor VtoFk 233

2.5

2.0

1.5

1.0

0.5

0.00.3

0.4

0.5

0.6

0.7

0.8

0.9

1.0

9oOtagH (9)
Voltage (V)

Do regulators operate across security boundaries?
Trusted Execution Environments (TEE)

Is DVFS Trustzone-Aware? No!

CPU Core

Trustzone Trusted code

Normal Untrusted code

Frequency and voltage changes
Frequency & Voltage Regulators

Hardware-enforced isolation Regulator HW-SW interface

Outline
I. DVFS and Deep Dive into Hardware Regulators II. The CLKSCREW Attack III. Trustzone Attack 1: Secret AES Key Inference IV. Trustzone Attack 2:Tricking RSA Signature Validation V. Concluding Remarks

Can we attack Trustzone code execution using software-only control of the regulators?

Induce timing faults
confidentiality integrity availability

How do faults occur (due to over-raising frequency)?

CLK signal
input
1 input

flip-flop

1

output intermediate logic path input

flip-flop output

1

1 output

How do faults occur (due to over-raising frequency)?

CLK signal
input
0 input

flip-flop
output intermediate logic path input

flip-flop output
1 output

higher frequency



less time for data to propagate



timing violation `0' `1'

How dangerous are faults induced by software-based overclocking/undervolting?

Faults induced by software-based overclocking

Influence control flow

Expected: Authentication fails

Runtime Fault Attack: Induce authentication to pass

Faults induced by software-based overclocking
Influence data flow
Expected: Computation should return (0, 1, 2) Runtime Fault Attack: Corrupt result to (nan, 1, 2)

CLKSCREW Challenges & Solutions
#1: Regulator operating limits #2: Self-containment within same device #3: Noisy complex OS environment #4: Precise timing #5: Fine-grained timing resolution

CLKSCREW Challenges & Solutions

#1: Regulator operating limits #2: Self-containment within same device #3: Noisy complex OS environment #4: Precise timing #5: Fine-grained timing resolution

)rHquHnFy (GHz)

Addressed earlier in DVFS regulators

3.5
0axiPuP 233
9HnGor VtoFN 233 3.0

1HxuV 6

2.5

2.0

1.5

1.0

0.5

0.00.5

0.6

0.7

0.8

0.9

1.0

1.1

1.2

1.3

9oOtagH (9)

CLKSCREW Challenges & Solutions

#1: Regulator operating limits

#2: Self-containment within same device #3: Noisy complex OS environment #4: Precise timing #5: Fine-grained timing resolution

Cores have different frequency regulators Core pinning

Coretarget Coreattack

code execution to inject fault

star t

end

fault

fault

victim thread
attack thread

CLKSCREW Challenges & Solutions

#1: Regulator operating limits

#2: Self-containment within same device #3: Noisy complex OS environment #4: Precise timing #5: Fine-grained timing resolution

Core pinning Disable interrupts during attack

Coretarget Coreattack

code execution

to inject fault

victim

thread

star t

end

fault

fault attack

thread

disable

enable

interrupts

interrupts

CLKSCREW Challenges & Solutions

#1: Regulator operating limits

~1,100,000,000,000 clock cycles Victim thread

#2: Self-containment within same device

~65,000 clock cycles

#3: Noisy complex OS environment

asm volatile("1: subs %0, %0, #1 \n" " bhi 1b \n"::"r" (loops));

#4: Precise timing #5: Fine-grained timing resolution

High-precision timing loops in attack architecture
Cache-based execution timing profiling

Outline
I. DVFS and Deep Dive into Hardware Regulators II. The CLKSCREW Attack III. Trustzone Attack 1: Secret AES Key Inference IV. Trustzone Attack 2:Tricking RSA Signature Validation V. Concluding Remarks

Subverting Trustzone Isolation with CLKSCREW

I. Confidentiality Attack infer secret AES key stored within Trustzone

Trustzone

secret

AES

key decryption

Normal
plaintext ciphertext

II. Integrity Attack load self-signed app into Trustzone

Trustzone

==
verify & load app

#
SHA-256 hash

plaintext RSA hash decryption

Normal
signed app
app binary public key digital signature

Key Inference Attack:Threat Model

Victim app: AES decryption app executing in Trustzone Attacker's goal: Get secret AES key from outside Trustzone Attacker's capabilities: 1) Can repeatedly invoke the decryption app
2) Has software access to hardware regulators

Trustzone
CLKSCREW

secret key

AES Decryptor

Normal
plaintext
ciphertext

Key Inference Attack: Summary

Idea: Induce a fault during the AES decryption Infer key from a pair of correct and faulty plaintext

Trustzone

Correct

secret

AES

key decryption

Faulty

Trustzone
CLKSCREW

secret

AES

key decryption

Normal
ciphertext
Normal
cipher text

correct plaintext
Differential Fault Analysis [1]
faulty plaintext

secret key

[1] Tunstall et al. Differential Fault Analysis of the Advanced Encryption Standard using a Single Fault. In IFIP International Workshop on Information Security Theory and Practices (2011).

Key Inference Attack: CLKSCREW Parameters

Base voltage: 1.055V
High frequency: 3.69GHz Low frequency: 2.61GHz

Fault injection duration:
680 no-op loops (~39 sec)

Differential Fault Analysis needs CLKSCREW to deliver a one-byte fault to the 7th AES round

Key Inference Attack: Differential Fault Analysis
Check out code at: https://github.com/Daeinar/dfa-aes Fault
Propagation of fault induced in the input of 8th AES round Reduce key search space with a system of equations
Credits:Tunstall et al. Differential Fault Analysis of the Advanced Encryption Standard using a Single Fault. In IFIP International Workshop on Information Security Theory and Practices (2011).

Key Inference Attack:Timing Profiling
Execution timing of Trustzone code can be profiled with hardware cycle counters that are accessible outside of Trustzone

Normalized frequency

Key Inference Attack:Timing Profiling
How varied is the execution timing of the victim decryption app?
Victim AES Thread
Execution time (in clock cycles)
Not too much variability in terms of execution time

Key Inference Attack:Timing Profiling
Can we effectively control the timing of the fault delivery with no-op loops?
Attack Thread
Number of no-op loops is a good proxy to control timing of fault delivery

Key Inference Attack: Fault Model
Our fault model requires our attack to inject fault Exactly one AES round at the 7th round Corruption of exactly one byte

Key Inference Attack: Fault Model

Precision: How likely can we inject fault in exactly one AES round?

0.7

0.6

1ormalized frequency 1ormalized frequency

0.6

0.5

0.5

0.4

0.4 0.3
0.3

0.2 0.2

0.1

0.1

0.0 1 2 3 4 5 6 7 8 # of faulted AE6 rounds

0.0 1 3 5 7 9 11 13 15 # of faulted Eytes within one round

More than 60% of the resulting faults are precise enough to corrupt exactly one AES round

Key Inference Attack: Fault Model

1ormalized frequency 1ormalized frequency

Transience: How likely can we corrupt exactly one byte?

0.7 0.6 0.5 0.4 0.3 0.2 0.1 0.0 1 2 3 4 5 6 7 8
# of faulted AE6 rounds

0.6 0.5 0.4 0.3 0.2 0.1 0.0 1 3 5 7 9 11 13 15
# of faulted Eytes within one round

Out of the above faults that affect one AES round, more than half are transient enough to corrupt exactly one byte

Key Inference Attack: Results

CorruSted AE6 round

10

9

8

7

6

5

4

3

2

1

0

0.0

0.2

0.4

0.6

0.8

1.0

Cycle length ratio: ggNTattack/ggNTtarget

Controlling Fpdelay allows us to precisely time the delivery of the fault to the targeted AES round

Statistics: ~20 faulting attempts to induce one-byte fault to desired AES round. ~12 min on a 2.7GHz quad core CPU to generate 3650 key hypotheses

Outline
I. DVFS and Deep Dive into Hardware Regulators II. The CLKSCREW Attack III. Trustzone Attack 1: Secret AES Key Inference IV. Trustzone Attack 2:Tricking RSA Signature Validation V. Concluding Remarks

Real-world Apps in Trustzone

- Apps running in Trustzone are building blocks for security - Eg: widevine (DRM), keymaster (hardware-backed key storage)
- Trustzone apps loaded from binary blob files at runtime - Trustzone OS checks for a valid RSA signature before loading app

Trustzone
widevine process
keymaster process
:

Normal
widevine binary blob
file

widevine app
App binary Certificate chain of digital signatures Associated public keys in chain

RSA Signature Attack:Threat Model
To attack: RSA signature chain verification routine in Trustzone Attacker's goal:Trick routine into accepting a self-signed binary Attacker's capabilities: 1) Can repeatedly invoke Trustzone to load app
2) Has software access to hardware regulators 3) Know when the app has been loaded successfully

RSA Signature Attack: Summary

Idea: - Self-sign an app binary and invoke the app loading - Inject fault during signature verification - Corrupt RSA modulus used at runtime

Trustzone

==
verify & load app

#
SHA-256 hash

plaintext hash

RSA decryption

Normal
signed app
app binary public key digital signature

Attack Exploration and Formulation
Trustzone Apps: How to craft self-signed app binary files? Trustzone OS: How, where and when to inject the CLKSCREW fault?

Trustzone Apps: Format of Binary Files

- Trustzone firmware updates contain the Trustzone app binary files - App = a collection of files
= app.mdt + app.b00 + ... + app.b03

ELF Header Meta-data Certificate chain Signature blobs

Program code (split by sections)

Trustzone Apps: Format of Binary Files

.mdt file
ELF Header Program Headers Loader Meta-data .bXX File Hashes
Certificate Chain Cer tificate[0]

Certificate stored in proprietary Motorola HAB ("High Assurance Boot") binary format
Actual Certificate[1] in <widevine.mdt>
Subj: O=Motorola Inc, OU=Motorola PKI, CN=CSF CA 637-1 Issuer: O=Motorola Inc, OU=Motorola PKI, CN=APP 637-1-2; ...
Public exponent, e: 0x10001
Modulus, N: c44dc735f6682a261a0b8545a62dd13df4c646a5ed...

Cer tificate[1]

Signature: 3cc1961f0d833a6197bd5537ee3f7d784dcf5dfb83b0...

.mdt Signature

Code: https://github.com/0x0atang/clkscrew/blob/master/pycrypto/parse_mdt_certs.py

Credits: - Gal Beniamini: http://bits-please.blogspot.com/2016/04/exploring-qualcomms-secure-execution.html - Tal Aloni: http://vm1.duckdns.org/Public/Qualcomm-Secure-Boot/Qualcomm-Secure-Boot.htm

Attack Exploration and Formulation
Trustzone Apps: How to craft self-signed app binary files? Trustzone OS: How, where and when to inject the CLKSCREW fault?

Quick Review: How signatures are verified

Binary Data to protect

SHA-256-HASH(

)

#1

if ( #1 == #2 )

Cer tificate

RsaDecrypt( , )

#2

Signature: 0def2f02... Modulus, N2: c61364d7...

Root Trusted Key Modulus, N1: ae02d4f5... Embedded in Firmware (Trusted)

What if we modify the binary data (Our App)?

Binary Data to protect

SHA-256-HASH(

)

#1

if ( #1 == #2 )

Cer tificate

RsaDecrypt( , )

#2

Signature: 0def2f02... Modulus, N2: c61364d7...

Root Trusted Key Modulus, N1: ae02d4f5... Embedded in Firmware (Trusted)

Why do we need to inject fault at runtime?

We need #1 == #2
-- But root key N1 is fixed
RsaDecryptfaulted( , )

#1
if ( #1 == #2 )

Cer tificate

RsaDecrypt( , )

#2

Signature: 0def2f02... Modulus, N2: c61364d7...

Root Trusted Key Modulus, N1: ae02d4f5... Embedded in Firmware (Trusted)

Digging deep into the firmware

Nexus 6 Trustzone Firmware (Shamu Build: MOD31S)

Root Trusted Key Modulus, N1: ae02d4f5... Embedded in Firmware (Trusted)
Super Root Key (SRK) modulus 2048-bit RSA-2048

Digging deep into the firmware

public exponent

signature modulus
RsaDecrypt( S , N

(0x10001)
, e )

=

Se

mod

N

=

decrypted hash

Nexus 6 Trustzone Firmware (Shamu Build: MOD31S)

Digging deep into the firmware
public exponent signature modulus (0x10001)
RsaDecrypt( S , N , e )

Digging deep into the firmware
public exponent signature modulus (0x10001)
RsaDecrypt( S , N , e )
Reverse engineering approaches: Statically via IDA
-- Emulation using angr - http://angr.io/ - Dynamic code instrumentation on
Trustzone code on actual phones (more details in future!)

Digging deep into the firmware
public exponent signature modulus (0x10001)
RsaDecrypt( S , N , e )
- Computes modular exponentiation: Se mod N - Implemented with an efficient form of
multiplication called Montgomery Multiplication[1]
- Uses a memory-intensive function that reverses memory buffers
[1] KOC, C. K. High-speed RSA implementation.Tech. rep.,Technical Report, RSA Laboratories, 1994.

Digging deep into the firmware
public exponent signature modulus (0x10001)
RsaDecrypt( S , N , e ) Where to inject the runtime fault?
- Computes modular exponentiation: Se mod N - Implemented with an efficient form of
multiplication called Montgomery Multiplication[1]
- Uses a memory-intensive function that reverses memory buffers
[1] KOC, C. K. High-speed RSA implementation.Tech. rep.,Technical Report, RSA Laboratories, 1994.

Corrupting FlipEndianness with Runtime Fault
Nexus 6 Trustzone Firmware (Shamu Build: MOD31S)

Corrupting FlipEndianness with Runtime Fault

Base voltage: 1.055V High frequency: 4.10GHz

Fault injection duration:
5 no-op loops (~0.287 sec)

Low frequency: 2.68GHz

Expected modulus: ... bc099b4a ... Faulty modulus used: ... bc094a4a ...
Demo: https://asciinema.org/a/5vvn3s9nzula930xui1z7tg65 Code: https://github.com/0x0atang/clkscrew/blob/master/faultmin_SD805/

Digging deep into the firmware
public exponent signature modulus (0x10001)
RsaDecrypt( S , N , e ) Where to inject the runtime fault?
- Computes modular exponentiation: Se mod N - Implemented with an efficient form of
multiplication called Montgomery Multiplication[1]
- How to craft attack signature SA'? Uses a memory-intensive function that reverses memory buffers
[1] KOC, C. K. High-speed RSA implementation.Tech. rep.,Technical Report, RSA Laboratories, 1994.

How to craft attack signature?

Trickier than expected!!

Line 3: Line 4:

original N

corrupted/faulted N

Line 15: =
different moduli N's used (More cryptanalysis in white paper...)
https://github.com/0x0atang/clkscrew/blob/master/pycrypto/pycrypto.py

When (during execution) to inject fault?
- DecryptSig() is invoked 4 times when verifying an app - 1) SRK.modulus => CERT[0] - 2) CERT[0].modulus => cert chain meta-data - 3) CERT[0].modulus => CERT[1] - 4) CERT[1].modulus => .mdt file hashes
- We need a way to profile when invocation (4) executes within Trustzone - Attack Enabler: Memory accesses from outside Trustzone can evict cache
lines used by Trustzone code
Side-channel-based cache profiling

When (during execution) to inject fault?
- Instruction-cache Prime+Probe profiling more reliable than data-cache ones - More info on side-channel-based profiling attacks on ARM [1, 2, 3]
- I-Cache profiling not as convenient as D-Cache profiling - Instead of using memory read operations - Need to execute instructions at memory address congruent to cache sets we are monitoring - Create a JIT compiler -- Given a list of cache sets to monitor - Allocate a large chunk of executable memory - Chain relative BR branch instructions in addresses congruent to monitored cache sets
[1] GRUSS, D., SPREITZER, R., AND MANGARD, S. Cache Template Attacks: Automating Attacks on Inclusive Last-Level Caches. USENIX 2015 [2] LIPP, M., GRUSS, D., SPREITZER, R., MAURICE, C., AND MANGARD, S. Armageddon: Cache attacks on mobile devices. USENIX 2016. [3] ZHANG, X., XIAO,Y., AND ZHANG,Y. Return-Oriented Flush- Reload Side Channels on ARM and Their Implications for Android Devices. CCS 2016.

When (during execution) to inject fault?
- Sketch of I-Cache profiling - Pick a few code areas before the target victim code to monitor - Monitor for I-Cache eviction for these cache sets simultaneously (We monitor 4 sets) - Say E is the event when all these cache sets are found to be evicted - Track the next time E happens - Use an incrementing counter (as a high-precision timer) to track the duration between consecutive E's - Call this duration between consecutive E's -- g - Time-series g => a fine-grained proxy of Trustcode code execution

Timing-Based Code Execution Profiling
- 4) CERT[1].modulus => .mdt file hashes
Cache set eviction profile (Validation of the 4th RSA signature)

`Gap duration', g values

IDEA

Cache-profiling feature

feat_cache2

(Consecutive I-CacheCevricetiaonteinthearvnald, g-)crafted features based on g to help us fine-tune

the timing anchor

feat_cache1

k1 k2
SamSpamleplIeDID oovveer trimteime

Timing-Based Code Execution Profiling
- 4) CERT[1].modulus => .mdt file hashes
Cache set eviction profile (Validation of the 4th RSA signature)

`Gap duration', g values

Cache-profiling feature
(Consecutive I-Cache eviction interval, g)

feat_cache2
k2
SamSpamleplIeDID oovveer trimteime

feat_cache1
k1

Timing-Based Code Execution Profiling
Track a "Fault success" as successfully corrupting targeted N modulus Both feat_cache1 and feat_cache2 can influence success rate of faults

Timing-Based Code Execution Profiling
But these features alone are insufficient! Too much variability given any value of pre-fault delay loops, Fpdelay

Timing-Based Code Execution Profiling
But these features alone are insufficient! Too much variability given any value of pre-fault delay loops, Fpdelay
IDEA Instead of a fixed Fpdelay, devise an adaptive Fpdelay to target a
specific position within N

Timing-Based Code Execution Profiling
Sample lots of faulting parameters and resulting faulted buffer position, Fpos
Create a linear regression model based on the empirical observations: Fpos ~ featcache1 + featcache2 + Fpdelay + temperature + intercept
At runtime, we can then adjust our adaptive pre-fault delay loops, Fpdelay
f Fpdelay = ( Fpos, featcache1, featcache2, temperature, intercept)

Putting it together

30

FrequenFy of faults

25

20

15

10

5

0

0

50

100

150

200

250

3osition of first faulted byte in the Nrev buffer

Statistics:
- ~20% of faulting attempts (1153 out of 6000) result in a successful desired fault in the Nrev buffer we want These faults consist of 805 unique values, of which 38 (4.72%) are factorizable
-- One instance of the desired fault in ~65 faulting attempts

Summary of Attack Enablers
I. No hardware safeguard limits in regulators II. Large range of possible combinations of freq/volt for fault injection III. Cores deployed in different freq/volt domains IV. Hardware regulators operate across security boundaries V. Execution timing of Trustzone code can be profiled with hardware cycle
counter from outside Trustzone VII. Trustzone code execution can be profiled using side-channel-based
attacks, like Prime+Probe cache attacks

Outline
I. DVFS and Deep Dive into Hardware Regulators II. The CLKSCREW Attack III. Trustzone Attack 1: Secret AES Key Inference IV. Trustzone Attack 2:Tricking RSA Signature Validation V. Concluding Remarks

Attack Applicability to Other Platforms
Energy management mechanisms in the industry is trending towards finer-grained and increasingly heterogeneous designs
v8
Cloud computing providers

Possible Defenses
Hardware-Level Operating limits in hardware Separate cross-boundary regulators Microarchitectural Redundancy
Software-Level Randomization Code execution redundancy

Sound Bytes
New attack surface via energy management software interfaces
Not a hardware or software bug Fundamental design flaws in energy management mechanisms
Future energy management designs must take security into consideration

CLKSCREW
Exposing the Perils of Security-Oblivious Energy Management
Adrian Tang
Simha Sethumadhavan, Salvatore Stolfo
@0x0atang https://github.com/0x0atang/clkscrew https://0x0atang.github.io

