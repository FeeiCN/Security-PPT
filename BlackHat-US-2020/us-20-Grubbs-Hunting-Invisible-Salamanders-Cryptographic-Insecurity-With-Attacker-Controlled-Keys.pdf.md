Hunting Invisible Salamanders:
Cryptographic (in)Security with Attacker-Controlled Keys
Paul Grubbs
Cornell Tech, New York University, University of Michigan
1

About Me

Now: PhD student in Computer Science at Cornell's NYC campus

This fall: starting postdoc at NYU

Next fall: starting as junior professor at Michigan EECS

2

This Talk
Intended audience: those who design, implement, and use cryptography. Others will find talk interesting and enjoyable but may lack some context.

This is a talk about cryptography. Some of the slides involve math.

This symbol: if you don't understand all the details, don't worry about it!

3

Authenticated Encryption

Cat Picture
???

Agree on random key
Encrypt message with using authenticated encryption (AE)
(Galois/Counter Mode, Chacha20/Poly1305)
Core of protocols like TLS, IPSec, SSH

If key is random + hidden: AE hides cat pictures, prevents modifications

4

New Settings, New Needs
Attacker Message

Attacker chooses key(s)
Encrypt message with using authenticated encryption (AE)
(Galois/Counter Mode, Chacha20/Poly1305)
Increasingly important setting for AE:
· Password-Based Encryption/PAKE · E2EE Group Messaging · Abuse Reporting in Encrypted Messaging

Key isn't random + hidden! What security do we need? What security do we expect?
5

Overview
Describe "attacker-controlled keys" setting + examples, explain committing security property AE needs
Many widely-used AE schemes are not committing: can break for GCM, ChaCha20/Poly1305, others
Attacks resulting from non-committing AE:
- Inconsistent plaintexts in multi-receiver encryption - Invisible salamanders in Facebook's message franking - Key recovery via partitioning oracle attacks
Based on these research papers: Message Franking via Committing Authenticated Encryption
G., Lu, Ristenpart. IACR CRYPTO17. https://eprint.iacr.org/2017/664
Fast Message Franking: From Invisible Salamanders to Encryptment
Dodis, G., Ristenpart, Woodage. IACR CRYPTO18. https://eprint.iacr.org/2019/016
Partitioning Oracle Attacks
Len, G., Ristenpart. In submission.
6

Overview
Describe "attacker-controlled keys" setting + examples, explain committing security property AE needs
Many widely-used AE schemes are not committing: can break for GCM, ChaCha20/Poly1305, others
Attacks resulting from non-committing AE:
- Inconsistent plaintexts in multi-receiver encryption - Invisible salamanders in Facebook's message franking - Key recovery via partitioning oracle attacks
Based on these research papers: Message Franking via Committing Authenticated Encryption
G., Lu, Ristenpart. IACR CRYPTO17. https://eprint.iacr.org/2017/664
Fast Message Franking: From Invisible Salamanders to Encryptment
Dodis, G., Ristenpart, Woodage. IACR CRYPTO18. https://eprint.iacr.org/2019/016
Partitioning Oracle Attacks
Len, G., Ristenpart. In submission.
7

Attacker-Controlled Keys
Cat Picture

is hidden, has lots of randomness

Try to learn message or change decryption output

Attacker Message
Message and encryption key both chosen by adversary
8

Example: Password-based AE

They're using password1!
123 456

Guess Can't decrypt!

...

password1

Guess Decryption succeeded!

password1

Brute-force feasible if key is not very random (e.g. password/PIN) or if side channel leaks key bits

If attacker doesn't know decryption key, can learn using (online)
brute-force attack

9

Example: Reporting Plaintexts

Can't let the auditor see records...

Fraudulent Records

Attacker chooses encryption and decryption key: tries to lie about ciphertext contents

Auditor

AE.Decrypt(

, ) Fraudulent Records

Decrypt outputs something other than fraudulent records

10

Committing Security for AE

Useful to imagine AE as a lockbox

Intuition holds for hidden random key:
· Can't see inside (confidentiality) · Can't change contents (integrity)

???

No matter the key, only one thing can come out when it's unlocked

11

Committing Security for AE

Useful to imagine AE as a lockbox

Intuition holds for hidden random key:
· Can't see inside (confidentiality) · Can't change contents (integrity)
Without this, AE lockboxes could unlock many ways...

Committing security binds attacker to a single AE decryption, prevents invisible salamanders in ciphertexts

12

Reporting Salamanders
Committing AE

If AE is committing, attacker can't lie about plaintext by
choosing different key

Auditor

AE.Decrypt(

,

Committing AE

)

Decrypt fails - can't report salamanders

13

Overview
Describe "attacker-controlled keys" setting + examples, explain committing security property AE needs
Many widely-used AE schemes are not committing: can break for GCM, ChaCha20/Poly1305, others
Attacks resulting from non-committing AE:
- Inconsistent plaintexts in multi-receiver encryption - Invisible salamanders in Facebook's message franking - Key recovery via partitioning oracle attacks
Based on these research papers: Message Franking via Committing Authenticated Encryption
G., Lu, Ristenpart. IACR CRYPTO17. https://eprint.iacr.org/2017/664
Fast Message Franking: From Invisible Salamanders to Encryptment
Dodis, G., Ristenpart, Woodage. IACR CRYPTO18. https://eprint.iacr.org/2019/016
Partitioning Oracle Attacks
Len, G., Ristenpart. In submission.
14

Invisible Salamanders for CTR Mode

Derive Pad IV
Derive Pad'

=

=

Plaintext

Pad
Ciphertext

Pad'
Plaintext'
15

Galois/Counter Mode (GCM)

GCM is a fast, modern AE.

NIST/IEEE/ISO standard

Message

Uses AES-CTR + message authentication code (MAC) to prevent tampering

AES-CTR

Decryption recomputes, checks tag, fails if tags do not match

Output IV Message

To get invisible salamanders for GCM, need to find IV Message with same MAC
output Tag for and

AES-CTR

Salamander

Input
MAC
Tag
MAC
Input
16

Colliding GCM's MAC

MAC is polynomial evaluation + XOR.

Fast but not collision-resistant (cf. SHA-256)

IV

1. Split ciphertext into blocks (coefficients) 2. Compute hash point (H) and pad (Pad) 3. Evaluate polynomial at H, then XOR Pad
(`len' is encoded ciphertext length)

MAC( , IV

):

1. C1 = Blocks(

)

2.

H = AES( , 0) Pad = AES( , IV )

3.

Tag = C1*H2 + len*H + Pad

Tag

17

Colliding GCM's MAC

Tag is a "simple" algebraic function of ciphertext:

solve one equation to collide for two keys

IV

1. Choose any IV 2. For key , derive H1, Pad1 3. For key , derive H2, Pad2 4. Set tag equations equal, solve for C1:
C1*H12 + len*H1 + Pad1 = C1*H22 + len*H2 + Pad2
5. Let Message be C1 , recompute Tag 6. Output IV Message Tag

MAC( , IV

):

C1 = Blocks(

)

H = AES( , 0)

Pad = AES( , IV )

Tag = C1*H2 + len*H + Pad

Tag
Not true for collision-resistant
hashes like SHA-256

C1*(H12 + H22) = len*(H1 + H2) + Pad1 + Pad2 C1 = [len*(H1 + H2) + Pad1 + Pad2]*(H12 + H22)-1

2x = 6 x = 3

One equation, one unknown!

18

From Two Keys to Many

Colliding GCM's MAC on two keys is pretty easy.

Can even collide many (>>2) keys: use interpolation

IV

!"#!  !$ !

 + ! +   !

   =



%"#!  %$ "

 + " +   "

As many variables as ciphertext blocks: One equation

can solve when m  k in O(k2) time

per key

MAC( , IV

):

C1 , ..., Cm = Blocks(

)

H = AES( , 0)

Pad = AES( , IV ) Tag =  CHm+2- + len*H + Pad

Tag

C1*H12 + len*H1 + Pad1 = C1*H22 + len*H2 + Pad2

C1*(H12 + H22) = len*(H1 + H2) + Pad1 + Pad2

PolPyo13ly0n5om(lLibiaisnloMediaAuCrmsA,aNrlegaCveLeb)r,yrGacCoMm-mSIoVn, e: tc.

C1 = [len*(H1 + H2) + Pad1 + Pad2]*(H12 + H22)-1

19

</math>

Colliding GCM's MAC on two keys is pretty easy.

Can even collide many (>>2) keys: use interpolation

IV

!"#!  !$ !

 + ! +   !

   =



MAC( , IV

):

C1 , ..., Cm = Blocks(

)

H = AES( , 0)

%"#!

1.

W%$idely"-usedAE+sch"e+mes

are"

not

Pad
committing Tag

= AES( , IV ) =  CHm+2- +

len*H

+

Pad

Ascamnasnoy23lvv..ear(wCOitahhrbnoaeuleefngtshcimnatihpsgehcyiienkaprrvhietnieesfirOnixtbee(tklxfeco2t)arbstunailsmoelhcaeikanmsvT:aLeSn/1IdP0OSe0enrc,esp/0Seef0SorqH0rku!s)eat+ythiioennmvisisibeleassyalamandeTrasg

C1*H12 + len*(HE.1g.+, mPyadco1ll=eaCg1u*eHg2e2n+erlaetend*oHn2e+wPitahd1231,072 correct decryptions)

C1*(H12 + H22) = len*(H1 + H2) + Pad1 + Pad2

PolPyo13ly0n5om(lLibiaisnloMediaAuCrmsA,aNrlegaCevLeb)r,yrGacCoMm-mSIoVn, e: tc.

C1 = [len*(H1 + H2) + Pad1 + Pad2]*(H12 + H22)-1

20

Overview
Describe "attacker-controlled keys" setting + examples, explain committing security property AE needs
Many widely-used AE schemes are not committing: can break for GCM, ChaCha20/Poly1305, others
Attacks resulting from non-committing AE:
- Inconsistent plaintexts in multi-receiver encryption - Invisible salamanders in Facebook's message franking - Key recovery via partitioning oracle attacks
Based on these research papers: Message Franking via Committing Authenticated Encryption
G., Lu, Ristenpart. IACR CRYPTO17. https://eprint.iacr.org/2017/664
Fast Message Franking: From Invisible Salamanders to Encryptment
Dodis, G., Ristenpart, Woodage. IACR CRYPTO18. https://eprint.iacr.org/2019/016
Partitioning Oracle Attacks
Len, G., Ristenpart. In submission.
21

Multi-Receiver Encryption
In group messaging applications, senders must encrypt and send messages to group Keys shared pairwise; only one ciphertext
22

Multi-Receiver Encryption
In group messaging applications, senders must encrypt and send messages to group Keys shared pairwise; only one ciphertext Used by Whatsapp, Keybase, others
Cat Picture

Cat Picture

Cat Picture

23

Multi-Receiver Encryption

In group messaging applications, senders must encrypt and send messages to group
Keys shared pairwise; only one ciphertext

Theoretical attack. Unclear if these are vulnerable (homework!)

Used by Whatsapp, Keybase, others

If encryption is not committing: send different keys, ciphertext with invisible salamander

Message

Different receivers see different messages!

Message

Message

24

Abuse Reporting for Encrypted Messaging

!%$#!
[Facebook 2016]: Reporting via ad-hoc proof of contents: message franking

!%$#!

!%$#!

They said !%$#!

Service can't tell if "!%$#!" was sent. Need secure reporting of message content

Attack: use of non-committing encryption means any sender could
have sent unreportable content
25

Facebook's Message Franking Protocol

!%$#!
1.

!%$#!
2.

!%$#!
3.

Message franking: 1. GCM Encrypt w/sender-chosen per-message key 2. Facebook stores, forwards ciphertexts 3. Report all recent keys, FB
decrypts unique ciphertexts
26

Evading Message Franking

!%$#! !%$#!
2. Send !%$#!
twice with /
1. Craft GCM ciphertext !%$#! :
· Decrypts under to innocuous image · Decrypts under to abusive image

!%$#!

!%$#!

!%$#!

4. Only the innocuous
image appears in report to Facebook!

3. receiver
sees both

Message franking: 1. Encrypt w/sender-chosen per-message key 2. Facebook stores, forwards ciphertexts 3. Report all recent keys, FB
decrypts unique ciphertexts
27

Crafting the Ciphertext

Proof of concept: ciphertext which decrypts to valid JPEG under and valid BMP under

Decrypt with K1
Decrypt with K2

ff d8 ff fe CL0,CL1 C0 , C1 , C2 , C3 C4 , C5
42 4d L0 , L1 00 00
12 3

1. Image headers 2. BMP length and
comment header 3. Comment length

Junk BMP ctxt Padding BMP data

JPEG data ff d9 (JPEG)

JPEG ctxt

Junk

(BMP)

Abusive JPEG receiver sees, but not in abuse report

Innocuous BMP in abuse report

Partitioning Oracles

123 456
password1

...

Guess Can't decrypt!
Guess Decryption succeeded!

Use of non-committing AE with passwords can lead to partitioning oracles: speedup for online brute-force key recovery for AE

password1 29

123 456
password1

Partitioning Oracles
Guess Decryption succeeded! Check two guesses with one ciphertext

password1

Use of non-committing AE with passwords can lead to partitioning oracles: speedup for online brute-force key recovery for AE
Worst-case exponential reduction in guesses! E.g., one million passwords = only 20 guesses

Found partitioning oracle attacks on: · Shadowsocks UDP proxying · Incorrect OPAQUE prototypes Latent vulnerabilities elsewhere
30

Preventing Invisible Salamanders
Committing AE schemes do exist! E.g., CTR-then-HMAC (done correctly) Not standardized, nor widely available in libraries
(also can be less efficient than non-committing AE)
Needed only if attacker-controlled keys are part of threat model
31

Conclusion
Describe "attacker-controlled keys" setting + examples, explain committing security property AE needs

Thanks for listening! Any
questions?

Many widely-used AE schemes are not committing: can break for GCM, ChaCha20/Poly1305, others

Attacks resulting from non-committing AE:
- Inconsistent plaintexts in multi-receiver encryption - Invisible salamanders in Facebook's message franking - Key recovery via partitioning oracle attacks
Based on these research papers: Message Franking via Committing Authenticated Encryption
G., Lu, Ristenpart. IACR CRYPTO17. https://eprint.iacr.org/2017/664
Fast Message Franking: From Invisible Salamanders to Encryptment
Dodis, G., Ristenpart, Woodage. IACR CRYPTO18. https://eprint.iacr.org/2019/016
Partitioning Oracle Attacks
Len, G., Ristenpart. In submission.

Special thanks to all my coauthors, and Hugo Krawczyk, Katriel CohnGordon, and BlackHat organizers
32

33

