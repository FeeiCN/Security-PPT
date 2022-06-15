SESSION ID: CRYP-W04
Efficient Culpably Sound NIZK Shuffle Argument without Random Oracles
#RSAC

Prastudy Fauzi
University of Tartu Joint work with Helger Lipmaa

#RSAC
Motivation: Electronic Voting

#RSAC
Motivation: Electronic Voting
Traditional voting
To ensure voter's privacy: shake the ballot box
3

#RSAC
Motivation: Electronic Voting
Electronic version
To ensure voter's privacy: shuffle the ciphertexts
4

#RSAC
Motivation: Electronic Voting
The shuffle is done by a mix-server

Original
 = (1, 2, 3)

Permutation

 =

1 2

2 1

3 3

Shuffled
 = 1 , 2 , 3
 = ()  (1; )

Shuffled ciphertexts must be re-randomized to hide 

5

#RSAC
Motivation: Electronic Voting
Issues to address:
You don't trust the mix-server Mix-server must provide proof that shuffle is done correctly Proof can be verified by anyone, at any time
The mix-server doesn't trust you Proof must not reveal the permutation to any verifier
6

#RSAC
How to Prove? How to Verify a Proof?

#RSAC
Interactive Zero-Knowledge Proof

Prover

a = f(w) random challenge c

Verifier

z = f(a, c)

Input: Witness w

Output: Verify(a, c, z)

Complete: If Prover is honest, Verifier should always accept Sound: If Prover is not honest, Verifier should reject proof Zero-knowledge: Verifier does not learn anything about the permutation from valid proof

8

#RSAC
Non-Interactive Zero-Knowledge

Prover CRS

Verifier

Input: Witness w

proof = f(w, CRS)

Output: Verify(proof, CRS)

Verifier's challenge c is incorporated into a (randomly generated) reference string This is called the common reference string (CRS) model

Alternative is the random oracle (RO) model (challenge c is replaced by a hash function)

9

#RSAC
Previous Work on NIZK Shuffle

#RSAC
Previous Work on NIZK Shuffle

|CRS| Communication
Prover's comp.
Verifier's comp. Model

[GL07] 2n + 8 15n + 120 (+3n)

[LZ13] 7n + 6 6n + 11 (+6n)

51n + 246

22n + 11 (+6n)

75n + 282 CRS

28n + 18 CRS

Daylight

|CRS|: number of group elements in the CRS Communication: number of group elements sent to the verifier Prover's comp.: number of exponentiations Verifier's comp.: number of pairings

11

[Gro10a] n + 1 3n
6n (+2n)
6n exp. RO + CRS

#RSAC
Previous Work on NIZK Shuffle

Soundness
Arg. of knowl.
PKE (knowledge assumption)

[GL07]

[LZ13]

Culpably sound White-box sound

No

Yes

No

Yes

?

[Gro10a]

Sound

Yes

No

Culpably sound: successful adversary + secret key can break security assumptions
Still acceptable, can assume some coalition of parties know secret key
White-box sound: successful adversary + random coins of all encrypters (e.g. voters) can break security assumptions
Weaker notion, can not only extract plaintexts, but also randomizers

12

#RSAC
Our Results

#RSAC
NIZK Shuffle Argument: Overview
Common input:  = 1, 2, 3,  ,  : set of ciphertexts before shuffle  = 1 , 2 , 3 ,  ,  : set of ciphertexts after shuffle
Private input: permutation , or equivalently, permutation matrix P Main idea: 1. Prove that there exists a permutation matrix P such that P = ,
where  =   ,  =   2. Find verification equations that hold only for honestly generated , 
14

#RSAC
Building Blocks

Commit to -tuples using the polynomial commitment scheme [Gro10b, Lip12]

1, 2,  ,   

 =

1, 2

()  =0

commit

1, 2,  ,   1 × 2

Bilinear maps, : 1 × 2  T Elgamal encryption,  ;  = (,  )
15

#RSAC
Step 1: Permutation Matrix Argument

P is permutation matrix iff:
Every row (transposed) is a unit vector
Every column sums to 1
16

(0 0 1 0 0 0) (0 2 0 0 0 0) (0 0 0 1 0 0) ( 1 -1 0 0 0 0 ) (0 0 0 0 0 1) (0 0 0 0 1 0)
(0 0 1 0 0 0) (0 1 0 0 0 0) (0 0 0 1 0 0) (0 1 0 0 0 0) (0 0 0 0 0 1) (0 0 0 0 1 0)

#RSAC
Step 1: Permutation Matrix Argument
Permutation Matrix argument for P = P is as follows:
A. Commit to every row of  Choose randomness s.t. =1  = 0
B. For each committed row  and its commitment: Prove it is a valid commitment to a unit vector
C. It can trivially checked that =1 (; ) = (1; 0)
17

#RSAC
Step 1B: Unit Vector Argument

 is unit vector iff every element is Boolean and sum to 1. This holds iff V +   0,2 +1, i.e.

(V +  - 1+1)  (V +  - 1+1) = 1+1,

where V =

2× 1

,b=

0 1

Use square span programs (SSP), similar to [DFGK14]

18

#RSAC
Step 2: Finding the Equations

Assume  = (). Consider the tautology





 ( , 2  ) =  (, 2-1()  )

=1

=1

Need privacy: the term 2-1()  reveals -1 
Commit to P = P-1, replace term by  ;  2

Induces extra "error" term  = (, , )

19

#RSAC
Step 2: Finding the Equations
Not yet sound!
Adversary can create "valid" ,  but : ( )  (  ) Fix: add similar equations using different polynomials (  )=0
This is finally culpably sound under a new Power Simultaneous Product (PSP) assumption
We prove this assumption holds in the generic bilinear group model
20

#RSAC
Additional Notes

Permutation matrix must be committed w.r.t.both sets of polynomials () =0, (  )=0
Need to prove they commit to same value
() =0, (  )=0 must be carefully chosen so the conditions of the PSP assumption are true

Such a choice exists

Assumptions: XDH, PKE, PCDH, TSDH, PSP

21

#RSAC
Efficiency of NIZK Shuffle

|CRS| Communication Prover's comp.
Verifier's comp.
Soundness Arg. of knowl. PKE (knowledge assumption)

[GL07] 2n + 8 15n + 120 (+3n)

[LZ13] 7n + 6 6n + 11 (+6n)

This work 8n + 17 7n + 2 (+2n)

[Gro10a] n + 1 3n

51n + 246 75n + 282 Culpably sound

22n + 11 (+6n) 16n + 3 (+2n)

6n (+2n)

[only 2n + 2 online]

28n + 18

18 n + 6

6n exp.

[only 8n + 4 online]

White-box sound Culpably sound Sound

No

Yes

Yes

Yes

No

Yes

Yes

No

22

#RSAC
Summary
Created efficient permutation matrix argument
From unit vector argument Using techniques from square span programs
Defined a new assumption (PSP) secure in the (bilinear) GGM Used the above to create efficient NIZK shuffle argument Future work:
Remove large overhead from "calibrating" verification equations Decrease the use of knowledge assumptions
23

#RSAC
Thank You!
Extended version: http://eprint.iacr.org/2015/1112. The authors were supported by the EU's Horizon 2020 research and innovation programme under grant agreement No 653497 (project PANORAMIX), and the Estonian Research Council.

Secure Audit Logs with Verifiable Excerpts
March, 2nd 2016 Gunnar Hartung
INSTITUTE OF THEORETICAL COMPUTER SCIENCE

KIT ­ University of the State of Baden-Wuerttemberg and National Laboratory of the Helmholtz Association

www.kit.edu

Outline
1 What is Secure Logging? 2 Secure Logging with Crypto 3 Excerpts 4 Security

(Seal Image Source: CC-0 by OpenIcons)

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 2/16

Introduction
What is Secure Logging?
Securing Log Files against retroactive modifications

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 3/16

Introduction
What is Secure Logging?
Securing Log Files against retroactive modifications
Why care?
paramount for system debugging/maintenance intrusion detection forensics after an intrusion Attackers cover their traces by editing log files. required/recommended by
DoD Orange Book [Lat85] NIST Handbook on Computer Security [NIS95] Common Criteria [CC12]

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 3/16

Why Excerpts?

Images: CC-0 by dagobert83, ClkerFreeVectorImages, mireyaqh, sheikh tuhin

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 4/16

Why Excerpts?

$

Images: CC-0 by dagobert83, ClkerFreeVectorImages, mireyaqh, sheikh tuhin

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 4/16

Why Excerpts?

$

Images: CC-0 by dagobert83, ClkerFreeVectorImages, mireyaqh, sheikh tuhin

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 4/16

Why Excerpts?

sues Bank

$

Images: CC-0 by dagobert83, ClkerFreeVectorImages, mireyaqh, sheikh tuhin

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 4/16

Why Excerpts?
log sfihleosws $

sues Bank

Images: CC-0 by dagobert83, ClkerFreeVectorImages, mireyaqh, sheikh tuhin

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 4/16

Why Excerpts?

sues Bank

log sfihleosws $

log files contains lots of confidential information

Images: CC-0 by dagobert83, ClkerFreeVectorImages, mireyaqh, sheikh tuhin

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 4/16

Why Excerpts?

sues Bank

log sfihleosws $

log files contains lots of confidential information very large, hard to analyze

Images: CC-0 by dagobert83, ClkerFreeVectorImages, mireyaqh, sheikh tuhin

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 4/16

Why Excerpts?

sues Bank

log sfihleosws $

log files contains lots of confidential information very large, hard to analyze
Excerpts solve both problems!

Images: CC-0 by dagobert83, ClkerFreeVectorImages, mireyaqh, sheikh tuhin

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 4/16

Standard Approaches
WORM Drives:
Standard drives with custom firmware
Images: CC-BY-2.0 by Till Dettmering, Public Domain via Wikipedia, Ocrho

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 5/16

Standard Approaches
WORM Drives:

Standard drives with custom firmware
Images: CC-BY-2.0 by Till Dettmering, Public Domain via Wikipedia, Ocrho
Crypto!

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 5/16

Model

Time

Images: CC-0 by OpenClipArtVectors, CC-BY-SA-4.0 International by www.elbpresse.de

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 6/16

Model

pk Setup sk
Images: CC-0 by OpenClipArtVectors, CC-BY-SA-4.0 International by www.elbpresse.de

Time

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 6/16

Model

pk Setup sk

Break In

Images: CC-0 by OpenClipArtVectors, CC-BY-SA-4.0 International by www.elbpresse.de

Time

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 6/16

Model

Attacker controls input to logging system

pk Setup sk

Break In

Images: CC-0 by OpenClipArtVectors, CC-BY-SA-4.0 International by www.elbpresse.de

Time

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 6/16

Model

Old log entries shall Attacker controls input

remain verifiable

to logging system

pk Setup sk

Break In

Images: CC-0 by OpenClipArtVectors, CC-BY-SA-4.0 International by www.elbpresse.de

Time

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 6/16

Model

Old log entries shall Attacker controls input

remain verifiable

to logging system

pk Setup

Break In

sk 1

sk2

···

skB

Images: CC-0 by OpenClipArtVectors, CC-BY-SA-4.0 International by www.elbpresse.de

Time

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 6/16

Model

Old log entries shall Attacker controls input

remain verifiable

to logging system

pk Setup

Break In skB

Images: CC-0 by OpenClipArtVectors, CC-BY-SA-4.0 International by www.elbpresse.de

Time

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 6/16

Secure Logging with Crypto
m1 m2 m3
[BY97], [SK98], [BY03], [Hol06]

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 7/16

Secure Logging with Crypto

m1

1

m2

2

m3

3

[BY97], [SK98], [BY03], [Hol06]

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 7/16

Secure Logging with Crypto

m1

1

(sk1)

m2

2

(sk1)

m3

3

(sk1)

[BY97], [SK98], [BY03], [Hol06]

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 7/16

Secure Logging with Crypto

m1

1

(sk1)

m3

3

(sk1)

[BY97], [SK98], [BY03], [Hol06]

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 7/16

Secure Logging with Crypto

1

m1

1

(sk1)

2

m2

2

(sk1)

3

m3

3

(sk1)

[BY97], [SK98], [BY03], [Hol06]

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 7/16

Secure Logging with Crypto

1

m1

1

(sk1)

2

m2

2

(sk1)

3

m3

3

(sk1)

[BY97], [SK98], [BY03], [Hol06] don't fully prevent truncation.

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 7/16

Secure Logging with Crypto

1

m1

1

2

m2

2

3

Switching to sk2

3

4

m3

4

[BY97], [SK98], [BY03], [Hol06] don't fully prevent truncation.

(sk1) (sk1) (sk1) (sk2)

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 7/16

Secure Logging with Crypto

1

m1

1

(sk1)

2

m2

2

(sk1)

3

Switching to sk2

3

(sk1)

4

m3

4

(sk2)

[BY97], [SK98], [BY03], [Hol06] don't fully prevent truncation.
(Fully preventing truncation is surprisingly hard. Solutions: [MT08], [YP09], [YPR12])

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 7/16

Secure Logging with Crypto

1

m1

1

(sk1)

2

m2

2

(sk1)

3

Switching to sk2

3

(sk1)

4

m3

4

(sk2)

[BY97], [SK98], [BY03], [Hol06] don't fully prevent truncation.
(Fully preventing truncation is surprisingly hard. Solutions: [MT08], [YP09], [YPR12])
Goal here: Prevent truncation to epoch before break-in.

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 7/16

Outline
1 What is Secure Logging? 2 Secure Logging with Crypto 3 Excerpts 4 Security

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 8/16

New Feature: Excerpts
Excerpts should be:
correct: all messages unchanged complete: all relevant log entries present in excerpt

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 9/16

New Feature: Excerpts
Excerpts should be:
correct: all messages unchanged complete: all relevant log entries present in excerpt
Which log entries are "relevant"?

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 9/16

New Feature: Excerpts
Excerpts should be:
correct: all messages unchanged complete: all relevant log entries present in excerpt
Which log entries are "relevant"?
Defined by application: assign each log entry to  1 categories, identified by name  excerpts for  1 entire categories "special" categories: All: contains all log entries EM: contains all epoch markers

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 9/16

Logging with Excerpts

All: 0 A: 0

m1

1

(sk1)

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 10/16

Logging with Excerpts

All: 0 A: 0

m1

All: 1 A: 1 B: 0 m2

1

(sk1)

2

(sk1)

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 10/16

Logging with Excerpts

All: 0 A: 0

m1

All: 1 A: 1 B: 0 m2

All: 2 B: 1

m3

1

(sk1)

2

(sk1)

3

(sk1)

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 10/16

Logging with Excerpts

All: 0 A: 0

m1

1

All: 1 A: 1 B: 0 m2

2

All: 2 B: 1

m3

3

All: 3

EM: 0

Switching to sk2. Counters: All: 3, A: 2, B: 2, EM: 0

4

(sk1) (sk1) (sk1) (sk1)

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 10/16

Logging with Excerpts

All: 0 A: 0

m1

All: 1 A: 1 B: 0 m2

1

(sk1)

2

(sk1)

All: 3

EM: 0

Switching to sk2. Counters: All: 3, A: 2, B: 2, EM: 0

4

(sk1)

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 10/16

Logging with Excerpts

All: 0 A: 0

m1

All: 1 A: 1 B: 0 m2

1

(sk1)

2

(sk1)

All: 3

EM: 0

Switching to sk2. Counters: All: 3, A: 2, B: 2, EM: 0

4

Excerpt

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

(sk1)
Security 10/16

Logging with Excerpts

All: 0 A: 0

m1

All: 1 A: 1 B: 0 m2

1

(sk1)

2

(sk1)

All: 3

EM: 0

Switching to sk2. Counters: All: 3, A: 2, B: 2, EM: 0

4

H(Excerpt), Category "A"

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

(sk1)
Security 10/16

Logging with Excerpts

All: 0 A: 0

m1

All: 1 A: 1 B: 0 m2

1

(sk1)

2

(sk1)

All: 3

EM: 0

Switching to sk2. Counters: All: 3, A: 2, B: 2, EM: 0

4

H(Excerpt), Category "A"

E

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

(sk1)
(sk2)
Security 10/16

Outline
1 What is Secure Logging? 2 Secure Logging with Crypto 3 Excerpts 4 Security

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 11/16

Security Experiment
Challenger

Images: CC-0 by sheikh tuhin, barretr, tiothy, CC-BY-SA-4.0 International by www.elbpresse.de

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 12/16

Security Experiment
Challenger

Images: CC-0 by sheikh tuhin, barretr, tiothy, CC-BY-SA-4.0 International by www.elbpresse.de

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 12/16

Security Experiment

Challenger

Oracles

Images: CC-0 by sheikh tuhin, barretr, tiothy, CC-BY-SA-4.0 International by www.elbpresse.de

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 12/16

Security Experiment

Challenger Shared State

Oracles

Images: CC-0 by sheikh tuhin, barretr, tiothy, CC-BY-SA-4.0 International by www.elbpresse.de

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 12/16

Security Experiment

Challenger Shared State

Oracles

Images: CC-0 by sheikh tuhin, barretr, tiothy, CC-BY-SA-4.0 International by www.elbpresse.de

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 12/16

Security Experiment

Challenger Shared State

Oracles
Append Next Epoch
Excerpt Break In

Images: CC-0 by sheikh tuhin, barretr, tiothy, CC-BY-SA-4.0 International by www.elbpresse.de

What is Secure Logging?

Secure Logging with Crypto

Excerpts

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Security 12/16

Security Definition
Trivial Forgeries:
excerpts requested from A's oracle if A got ski : pure continuations of the log file state from the most recent epoch switch
Definition (Security, informal)
A logging scheme is secure if no PPT adversary has a non-negligible chance of outputting a valid and non-trivial forgery in the above experiment.

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 13/16

Proving Security
Theorem (Informal)
If the above scheme is based on an EUF-CMA-secure signature scheme with forward-security, then it is secure according to the previous definition.
Proof Technique:
show that attacker must forge  1 signature if changing any information before last recent epoch switch copy that signature and output it as a forgery against the signature scheme = tight

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 14/16

Conclusion
Secure logging is important. Secure logging is hard. Mostly because of truncation. Excerpts can be useful. Excerpts can be verified securely.

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 15/16

Thank you. Questions?

Contact:

gunnar.hartung@kit.edu

PGP-Key ID: B1A7 C146

Fingerprint: 4C39 AC36 6FAD 9E52 3144

8352 9E37 381F B1A7 C146

S/MIME Cert: at

https://crypto.iti.kit.edu/?id=hartung&L=2

What is Secure Logging?

Secure Logging with Crypto

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Excerpts

Security 16/16

Backup Slides
Quotes on Secure Logging Go Forward-Secure Signatures Go Logging Schemes Go Security Proof Sketch Go References Go End Go

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 1/17

Quotes on Secure Logging

"Audit data must be protected from modification and unauthorized destruction to permit detection and after-the-fact investigations of security violations." -- [Lat85]
"It is particularly important to ensure the integrity of audit trail data against modification. [...] The audit trail files needs to be protected since, for example, intruders may try to `cover their tracks' by modifying audit trail records. " -- [NIS95, Section 18.3.1]
"[A product] shall protect the stored audit records in the audit trail from unauthorised deletion. [A product] shall be able to prevent/detect unauthorised modifications to the stored audit records in the audit trail." -- [CC12, Section 8.6].

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 2/17

Syntax of Forward-Secure Signatures
KeyGen(T ): Create a key pair (sk0, pk ), where sk0 is the initial secret key. (pk is constant for all epochs.) T is an upper bound on the number of epochs.
Update(ski ): Compute ski+1 from ski . (If i < T - 1. ski is expected to be erased securely.)
Sign(ski , m): Create a signature  for m with key ski . Verify(pk , i, m, ): Check if m was signed in epoch i.
1 is implicit.

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 3/17

Security Experiment

for a scheme FS, an attacker A, and T  poly()
Setup obtain (sk0, pk )  KeyGen(T ), give pk , T to A. Queries A interacts with the challenger:
may request signature  for arbitrary messages m may force the challenger to update the secret key may obtain one secret key ski
afterwards: no more queries allowed Forgery A outputs a message m, signature  and epoch
number i.

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 4/17

Security Definition

Definition (Trivial Forgeries)
A forgery is trivial iff: A requested a signature for m during epoch i or A obtained the secret key for an epoch i  i

Definition (Winning)
A wins an instance of the experiment if it outputs a valid and non-trivial forgery.

Definition (Security)
FS is secure if no PPT attacker A has non-negligible (in ) chance to win.

Back

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 5/17

Logging Schemes with Excerpts

KeyGen(T ): creates key pair sk0, pk .
Update(ski , M, ): compute ski+1 from ski . (If i < T - 1. ski is expected to be erased securely.) M is the current overall logfile, and  is the corresponding signature for it.
AppendAndSign(ski , (m, N), M, ): Creates a signature for the message m, which is inserted into the categories N.
Extract(ski , M, , N): Creates a signature for the excerpt for categories N of M.
Verify(pk , N, E, ): Checks an excerpt E for completeness and correctness.

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 6/17

New Feature: Excerpts

Definition (Category)
Let M (the log file) be a sequence of log entries (mi , Ni ). The category named  is the subsequence C(, M) of M that contains all entries with   Ni .
Definition (Excerpt)
Let M (the log file) be a sequence of log entries. An excerpt for categories N = {1, . . . , n} is the subsequence
E = C(, M) ,
N
where C(, M) is the category named . (For a proper adaptation of  to sequences.)

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 7/17

Proving Security
Theorem (Informal)
If the above scheme is based on an EUF-CMA-secure signature scheme with forward-security, then it is secure according to the previous definition.
Proof Technique:
show that attacker must forge  1 signature if changing any information before last recent epoch switch copy that signature and output it as a forgery against the signature scheme = tight

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 9/17

Proof (Sketch)
Reduction:
assume successful attacker A against logging scheme construct attacker B against FS show that B has non-negligible success probability
Emulation of the Experiment:
B must emulate the logging security experiment for A. B plays the forward-secure unforgeability game against FS.

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 10/17

Reduction
A's information:
input: pk , T

emulated by B through:
input: pk , T

Image: CC-BY-SA-3.0 Unported by Steschke, via Wikipedia

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 11/17

Reduction

A's information:
input: pk , T signature (logging) oracle

emulated by B through:
input: pk , T signature oracle

Image: CC-BY-SA-3.0 Unported by Steschke, via Wikipedia

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 11/17

Reduction

A's information:
input: pk , T signature (logging) oracle epoch switching

emulated by B through:
input: pk , T signature oracle epoch switching

Image: CC-BY-SA-3.0 Unported by Steschke, via Wikipedia

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 11/17

Reduction

A's information:
input: pk , T signature (logging) oracle epoch switching breaking in

emulated by B through:
input: pk , T signature oracle epoch switching breaking in

Image: CC-BY-SA-3.0 Unported by Steschke, via Wikipedia

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 11/17

Reduction

A's information:
input: pk , T signature (logging) oracle epoch switching breaking in excerpt oracle

emulated by B through:
input: pk , T signature oracle epoch switching breaking in signatures for individual log entries + signature oracle

Image: CC-BY-SA-3.0 Unported by Steschke, via Wikipedia

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 11/17

Reduction

A's information:
input: pk , T signature (logging) oracle epoch switching breaking in excerpt oracle

emulated by B through:
input: pk , T signature oracle epoch switching breaking in signatures for individual log entries + signature oracle

Left to Show: Any valid and non-trivial excerpt forgery contains a valid and non-trivial signature forgery.
Image: CC-BY-SA-3.0 Unported by Steschke, via Wikipedia

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 11/17

Forgeries
Case 1: i < iBreakIn epoch markers in excerpt E :
signature on (N, E ) valid for epoch i < iBreakIn. A never queried for a signature for E = B never queried for (N, E) (assuming proper encoding) = valid and non-trivial forgery on (N, E)
Case 2:  iBreakIn epoch markers in excerpt E :
 changed the excerpt wrt. a previous epoch i < iBreakIn restrict the discussion to epochs before break-in

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 12/17

Forgeries

Assume for contradiction:
All messages (including counters!) in forged excerpt were queried at signature oracle before.
Ensured by Verification:
no messages from other categories no duplicates message order = forged excerpt is subsequence of "real" excerpt. non-trivial = strict subsequence ( )
Verification checks for completeness = excerpt invalid = contradiction = A forged a signature
Back

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 13/17

References I
Mihir Bellare and Bennet S. Yee, Forward integrity for secure audit logs, Tech. report, University of California at San Diego, 1997.
Mihir Bellare and Bennet Yee, Forward-security in private-key cryptography, Topics in Cryptology -- CT-RSA 2003 (Marc Joye, ed.), Lecture Notes in Computer Science, vol. 2612, Springer Berlin Heidelberg, 2003, pp. 1­18 (English).
Common Criteria for Information Technology Security Evaluation, version 3.1 r4, part 2, September 2012, https://www.commoncriteriaportal.org/cc/.

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 14/17

References II
Jason E. Holt, Logcrypt: Forward security and public verification for secure audit logs, Proceedings of the 2006 Australasian Workshops on Grid Computing and e-Research ­ Volume 54 (Darlinghurst, Australia, Australia), ACSW Frontiers '06, Australian Computer Society, Inc., 2006, pp. 203­211.
Donald C. Latham (ed.), Department of defense trusted computer system evaluation criteria, US Department of Defense, December 1985, http://csrc.nist.gov/ publications/history/dod85.pdf.

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 15/17

References III

Di Ma and Gene Tsudik, A new approach to secure logging, Data and Applications Security XXII (Vijay Atluri, ed.), Lecture Notes in Computer Science, vol. 5094, Springer Berlin Heidelberg, 2008, pp. 48­63 (English).
An Introduction to Computer Security: The NIST handbook, October 1995, NIST Special Publication 800-12.
Bruce Schneier and John Kelsey, Cryptographic support for secure logs on untrusted machines, The Seventh USENIX Security Symposium Proceedings, 1998.
Attila A. Yavuz and Ning Peng, BAF: An efficient publicly verifiable secure audit logging scheme for distributed systems, Computer Security Applications Conference, 2009. ACSAC '09. Annual, Dec 2009, pp. 219­228.

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 16/17

References IV
Attila A. Yavuz, Ning Peng, and Michael K. Reiter, Efficient, compromise resilient and append-only cryptographic schemes for secure audit logging, Financial Cryptography and Data Security (Angelos D. Keromytis, ed.), Lecture Notes in Computer Science, vol. 7397, Springer Berlin Heidelberg, 2012, pp. 148­163 (English).

Quotes on Secure Logging

Forward-Secure Signatures

Gunnar Hartung ­ Secure Logging with Verifiable Excerpts

Logging Schemes

Security Proof Sketch

References 17/17

