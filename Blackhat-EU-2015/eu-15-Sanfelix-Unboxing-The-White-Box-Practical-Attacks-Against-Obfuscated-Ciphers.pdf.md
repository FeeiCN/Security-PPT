Who are we?
· All Principal Security Analyst @Riscure
· Cristofaro Mune
· Keywords: Software, Reversing, Exploit, Fault Injection... · Previous work on Mobile and Embedded Exploitation
· Eloi Sanfelix
· Keywords: Software security, RE, Exploiting, SCA/FI, CTF
· Job de Haas
· Keywords: Embedded, Side Channel Analysis, Fault Injection · All-round from network pentester to SoC evaluator

Introduction Key recovery attacks Conclusion

Introduction Key recovery attacks Conclusion

Black-Box Security

Encrypt
Observe Alter

Decrypt

Gray-Box Security

Encrypt
Observe Alter

Decrypt

Sign of the times...

Sign of the times...

White-Box Security

Encrypt
Observe Alter

Decrypt

White-Box Security

Encrypt
Observe Alter

Decrypt

White-Box Cryptography
· Protection against key extraction in the white-box security model
· A technique that allows merging a key into a given crypto algorithm:
· Described for the first time in 2002 by S. Chow et al. · Available for AES and DES
· Lookup tables used for applying mathematical transforms to data
· Remove the distinction between keys and crypto algorithm code.

Software in the White-Box context

Input Output

Business logic
I/O key
Crypto

Can be modified at will
Direct access

Software Protection

Input Output

Protected binary
Business logic
I/O
WBC

Obfuscation
· Control-flow obfuscation · Data obfuscation
Anti-analysis and anti-tamper
· Detect debugger/emulator · Detect hooks and modifications
Device binding
· Bind code to current device

Focus on this part only

How does WBC work?
Image source: whiteboxcrypto.com

WBC Construction: partial evaluation

in

key

in

S

T

out

out

WBC Construction: encoding

Internal encoding

in

in

DECODE

T

T'

ENCODE
out

out

Example code
Source: https://doar-e.github.io/

External encoding

E(INPUT)

WB AES

E'(OUTPUT)

ENCODE DECODE

ENCODE
Sending Process

DECOD E ENCOD E DECOD E ENCODE DECOD E ENCODE

S1 S2 ... Sn

DECODE
Receiving Process

Potential attacks on WBC (I)
Side channel analysis (SCA) / intermediate data analysis
Observe data here
and compare it to expected data here

Potential attacks on WBC (II)
Data manipulation ­ Fault Injection (FI)
Modify data here
and observe changes to the output

Potential attacks on WBC (III)
Process manipulation ­ Fault injection (FI)
Modify code flow here
and observe changes to the output

WBC attack literature
· Attacks for all academic WBC proposals
· Focus on key extraction · Type of transformations assumed known · Concrete transformation and key unknown
· In real life...
· we do not know much about the design
· Not many publicly documented SCA/FI on WBC
· Implementation-specific DFA paper in 2002 [2] · Recent generic DPA-like attack in [3]*
* Authors coined the term Differential Computational Analysis

Introduction Key recovery attacks Conclusion

Fault Injection Attacks ...on WBC

Differential Fault Analysis
CCoCroCrroerorcerrtcerrtecerctsetruserlusetlustlut lt FFauFauFlatulaytulyrtlyertyseruserulsetulstultlt

DFA computation for DES

K15

R16 = F(R15 , K16)  L15

L15

R1'155
K16

R'16 = F(R'15 , K16)  L15

RR'1166

L'1166

XOR

R16  R'16 = F(R15 , K16)  F(R'15 , K16)

Divide and conquer

L15'

K16

Independent 6-bit sub-keys
Independent 6-bit search

How to port DFA to WBC?

DFA attack process
1. Location of fault injection point 2. Fault injection and ciphertext collection
o Multiple options available
3. Fault analysis
o We use our own tools o Some AES DFA examples on GitHub

Stack space

STEP 1: Locating the injection point
Red: writes Green: reads Target area
Time

STEP 2: Fault injection

STEP 3: Analysis
DEMO

Summary DFA results

Implementation Fault injection

Results

Wyseur (DES) Hack.lu 2009
(AES) SSTIC 2012 (DES)
Karroumi (AES)
NSC 2013 (encoded AES)

Unicorn script
Debugger script
Modified lifted code
Modified source code
N/A

Broken in 40 faults Broken in 90 faults
Broken in 60 faults
Broken in 80 faults Not broken ­
encoding makes DFA not feasible

Side Channel Attacks ...on WBC

What is a DPA attack?
Differential Power Analysis attack First proposed in 1998 by Paul Kocher to attack on smart cards:  Measuring power consumption of a crypto execution  Take multiple measurements for different inputs  Infer information about the key from the difference of these

Differential trace

Group by known data 0 0 0 0
1 1 1
1

Average trace

Subtract Differential trace

Hypothesis testing

Divide and conquer

L1

K1

Independent 6-bit sub-keys
Independent 6-bit search

Generalization of SCA attacks

Take multiple "measurements" of behavior of crypto operations for
different data

Predict behavior for sub keys based on the same data and "leakage" model

Apply statistical methods to distinguish the "best" sub key · Difference of means · Correlation · Mutual Information analysis, Linear regression analysis, ...
Find correct guesses for all sub keys to determine key

To our surprise.... It works on White Box Crypto out-of-the-box!!!

SCA attack process
1. Instrument WBC to collect "measurements"
o Again:
2. Execute WBC with random inputs multiple times 3. Collect "measurement ­ input/output pairs" in useable
form 4. SCA Analysis

STEP1: Capture measurement
· Grab the data using any method that fits your target
· Instrument execution (eg. PIN, Valgrind) · Capture stack snapshots per crypto round (Hooking,
debugger) · Use emulators and record (QEMU, Unicorn, PANDA)
· Capture any information during execution that might leak
· All reads/writes to memory · Lower bits of addresses of memory accesses · All register contents

STEP2+3: Execute + Collect
· Provide/inject random input data, capture output data
· Program arguments · Use instrumentation from STEP 1
· Store it in a way that allows testing key guesses
· Store as single bit samples · Assure alignment between multiple captures

STEP 4: SCA Analysis
DEMO

Summary DPA results

Implementati Attacked

on

intermediate

Wyseur (DES)

Round output

Hack.lu 2009 (AES)

S-Box output

SSTIC 2012 (DES)

Round output

Karroumi (AES)

S-Box and GF(256) inverse

NSC 2013

(encoded

N/A

AES)

Results
Broken in 75 traces
Broken in 16 traces
Broken in 16 traces
Broken in ~2000 traces
Not broken

Results NXP [3] Broken in 65 traces Broken in 16 traces Broken in 16 traces
Broken in ~500 traces
Not broken ­ encoding
makes DPA not feasible

What does it mean?
No detailed knowledge required:
· Of WBC implementation · Where the WBC is processed exactly
Using a secret random output encoding is the only barrier But: These random encodings do not work for many real world applications

Introduction Key recovery attacks Conclusion

Is WBC broken and useless?
· SCA/FI on standard WBC very effective
· Broken several open-source and commercial implementations · Very limited knowledge required (SCA). RE skills might be
needed (FI) · Countermeasures and risk mitigation required
· But...
· More complex attacks than regular software crypto · Software protection layers can be a deterrent · With renewability it can be good enough

How to make it stronger?

Protected binary

Input

Business logic

Output

WBC

Robustness against advanced SW RE
Robustness against key extraction attacks (SCA, FI, algebraic, ...)

But how?
Side Channel Analysis attacks
· Must prevent statistical dependence between intermediates and key
· Typical countermeasures based on randomness difficult in white-box scenario
Differential Fault Analysis attacks
· Double-checks on encoded data  might be bypassed if detected!
· Carry redundant data along computation? · Break fault models by propagating faults?
Do you have any other ideas?

Thank you!!

References
[1] http://crypto.stanford.edu/DRM2002/whitebox.pdf [2] http://crypto.stanford.edu/DRM2002/drm1.pdf [3] https://eprint.iacr.org/2015/753 [4] https://www.cosic.esat.kuleuven.be/publications/thesis-152.pdf [5] https://www.cosic.esat.kuleuven.be/publications/thesis-235.pdf

