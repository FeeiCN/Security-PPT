Cloning 3G/4G SIM Cards with a PC and an Oscilloscope: Lessons Learned in Physical Security
Yu Yu joint work with Junrong Liu, F-X Standaert, Zheng Guo
Dawu Gu, Sun Wei, Yijie Ge, Xinjun Xie

Lab of Cryptology and Computer Security

Some recent updates
"When the NSA and GCHQ compromised the security of potentially billions of phones (3G/4G encryption relies on the shared secret resident on the SIM), they not only screwed the manufacturer, they screwed all of us, because the only way to address the security compromise is to recall and replace every SIM."

Outline
· Background
1) 2G/3G/4G, (U)SIM Security 2) Cryptology, 2G/GSM AKA protocol
· Our work
1) 3G/4G AKA protocol and MILENAGE algorithm 2) Side Channel Attack / Differential Power Analysis 3) Our strategy 4) Results
· Sound bytes

Outline
· Background
1) 2G/3G/4G, (U)SIM Security 2) Cryptology, 2G/GSM AKA protocol
· Our work
1) 3G/4G AKA protocol and MILENAGE algorithm 2) Side Channel Attack / Differential Power Analysis 3) Our strategy 4) Results
· Sound bytes

Background
Cellular networks (1-4G)
· 1G: analogue signal
· 2G: GSM vs. CDMA digital signal
· 3G/4G: UMTS/LTE high-speed data transmission

What is a (U)SIM card?
· (U)SIM = (Universal) Subscriber Identity Module · (U)SIM is a smart card (a mini computer). · SIM stores ICCID (serial number), IMSI (USER id),
secrets, etc. · Secret on 2G SIM: master key K. · Secrets on 3G/4G USIM:
master key K, and OPc, r1, r2, ..., r5, c1, ..., c5. · Currently, 2G  3G/4G  5G · Any cryptography in (U)SIM?

Security compromised by revealed/stolen secrets

Outline
· Background
1) 2G/3G/4G, (U)SIM Security 2) Cryptology, 2G/GSM AKA protocol
· Our work
1) 3G/4G and MILENAGE algorithm 2) Side Channel Attack / Differential Power Analysis 3) Our strategy 4) Results
· Sound bytes

Cryptology in a nutshell

Cryptology = "Cryptography" + "Cryptanalysis"

· Cryptography (designing

)

The design of crypto-systems that help preserve various aspects of information security such as confidentiality, integrity, authenticity and non-repudiation.

· Cryptanalysis (code-breaking).
1. Mathematical: break a crypto-system mathematically. 2. Physical: break the implementation of a crypto-system. Attacks in real life are often physical.

input

crypto-system

output

What cryptography is needed for (U)SIM?

· AKA (Authentication and Key Agreement)

· Authentication is a process that ensures and confirms a user's identity.

· Bob authenticates Alice by Challenge-and-Response.

Alice: k

"I am Alice"

Bob: k

R

RES=Enck (R)

RES

Check if RES=Enck (R)

· Key Agreement (term not precise): deriving session key from master key.

· How to do Key Agreement: use same protocol above

(use partial Enck(R) for RES and the rest as session key)

The 2G GSM AKA Protocol
AKA algorithm: COMP128-1 (A3+A8) Encryption algorithm (optional) : A5 Insecurity: 1. COMP128-1 is fatally flawed (narrow pipe attacks [BGW98]) 2. Only one-way authentication (spoofing base stations, DEFCON 2010) 3. Subject to side-channel attacks (DPA attacks [RRST02,ZYSQ13])

Outline
· Background
1) 2G/3G/4G, (U)SIM Security 2) Cryptology, 2G/GSM AKA protocol
· Our work
1) 3G/4G AKA protocol and MILENAGE algorithm 2) Side Channel Attack / Differential Power Analysis 3) Our strategy 4) Results
· Sound bytes

Security improvement of 3G/4G over 2G

2G

Authentication Algorithm

flawed COMP128-1

Authentication One-way (base station mechanism authenticates the SIM)

Secrets

The master key K

3G/4G
MILENAGE, in turn based on AES-128, which is mathematically secure
Mutual authentication (preventing spoofed base stations attacks)
The master key K The tweak value OPc More operator-defined values: r1, ..., r5, c1, ..., c5 (more secrets = better security?)

Is 3G/4G secure in practice?

3G/4G AKA Protocol
MILENAGE Algorithm
Mutual Authentication

MILENAGE Algorithm

USIM

AuC

RAND

AUTN

f5

SQN  AK

AMF

MAC

AK



SQN K

f1

f2

f3

f4

XMAC

RES

CK

IK

Verify MAC = XMAC Verify that SQN is in the correct range

Outline
· Background
1) 2G/3G/4G, (U)SIM Security 2) Cryptology, 2G/GSM AKA protocol
· Our work
1) 3G/4G AKA protocol and MILENAGE algorithm 2) Side Channel Attack / Differential Power Analysis 3) Our strategy 4) Results
· Sound bytes

SCA (Side Channel Attack)

EM

Power

consumption

Time

Crypto System

Heat

Sound

Power Analysis
· SPA (Simple Power Analysis)
Deduce algorithm-related information by simply observing a single power trace.
· DPA (Differential Power Analysis)
Intermediate value
Known input +
Guessed key byte
Test if the guessed key byte is correct or not (hypothesis testing)

Measurement Setup

PC + Software SCAnalyzer

Oscilloscope

Power Recorder

Outline
· Background
1) 2G/3G/4G, (U)SIM Security 2) Cryptology, 2G/GSM AKA protocol
· Our work
1) 3G/4G AKA protocol and MILENAGE algorithm 2) Side Channel Attack / Differential Power Analysis 3) Our strategy 4) Results
· Sound bytes

What Do We Need
K + OPc + r1,c1, r2,c2 (recovery of r3,c3,r4,c4,r5,c5 is likewise)

How to recover them?
· The strategy: divide-and-conquer
· Recover the secrets K, OPc, r1,c1, ..., r5, c5 one at a time using power analysis.
· For each secret, work on its key bytes independently and then combine.
 for secret {K, Oc, c1, c2, ..., c5 } do a standard DPA
 for secret {r1, r2, ..., r5 } do a divide-and-conquer PA

Where to Attack

Case 1: Use standard
(public) r1~r5,c1~c5

f5(function to generate AK)

Case 2: Use customized
(secret) r1~r5,c1~c5

flow of f5+f1

Analysis Process Step1: Collect Power Trace
Identify the segment of interest using SPA and zoom-in for further analysis.

Analysis Process Step2: Recover K and OPC

Standard DPA against AES only handles

with secret k.

How to adapt the attack to

with secrets k and OPc ?

The trick: consider Ek' with key k'=kOpc and plaintext RAND. (recall Ek first XORs its input with k due to AddRoundKey)
Attack 1st round

KOPc

Attack 2nd round K OPc

Analysis Process step3: Continue or Not?

Use standard Parameters for c1 r1 c2 r2

Compute correlation to locate round shifts and recover parameter r1/r2

Attack the next AES to recover c1/c2
Finally we obtain c1c2r1r2

How to recover the round shift parameter r?
· Consider 2 and write 2 = 8 + 
· First, assume  = 0, make a guess about  and correlate the resulting bytes to the power traces to test if the guess is correct or not.
· Second (when  is recovered), correlate the bytes to the traces again and identify the value of  from the sequence of correlations.

Outline
· Background
1) 2G/3G/4G, (U)SIM Security 2) Cryptology, 2G/GSM AKA protocol
· Our work
1) 3G/4G AKA protocol and MILENAGE algorithm 2) Side Channel Attack / Differential Power Analysis 3) Our strategy 4) Results
· Sound bytes

Results

Target USIM #1 #2 #3 #4 #5 #6 #7 #8

operator C1-1 C1-1 C1-1 C1-2 C2-1 C1-3 C1-3 C2-2

manufacturer C1-I C2-II C1-III C3-I C2-I C1-IV C1-II C2-II

technology 3G UMTS 3G UMTS 3G UMTS 3G UMTS 3G UMTS 4G LTE 4G LTE 4G LTE

secrets K, OPc K, OPc K, OPc K, OPc, r1,c1,...,r5,c5 K, OPc, r1,c1,...,r5,c5 K, OPc, r1,c1,...,r5,c5 K, OPc, r1,c1,...,r5,c5 K, OPc, r1,c1,...,r5,c5

Time needed for recovering the secrets ranges from 10 to 80 minutes, using 200 to 1000 power traces.
Note: the operators and manufacturers are anonymized.

Outline
· Background
1) 2G/3G/4G, (U)SIM Security 2) Cryptology, 2G/GSM AKA protocol
· Our work
1) 3G/4G AKA protocol and MILENAGE algorithm 2) Side Channel Attack / Differential Power Analysis 3) Our strategy 4) Results
· Sound bytes

Sound bytes
1. Cryptography. Adding tweaks (secret values) to a block cipher in addition to the encryption key does not necessarily add more security.
2. The Dilemma:
Low cost devices  limited budget for CC/EMVCo/FIPS security evaluations. Low-cost × huge volume = great impact / loss
3. Awareness of physical security for small embedded devices. Practical security requires BOTH: A mathematically secure (and publicly reviewed) algorithm. Sufficient countermeasures in place against physical attacks.

Thank you!

