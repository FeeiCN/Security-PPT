A Decade After Bleichenbacher '06, RSA Signature Forgery Still Works
Sze Yiu Chau Purdue University schau@purdue.edu

Who am I?
· Born and raised in Hong Kong
· PhD in CS from Purdue · Joining CUHK IE as AP in 2020 · Interests: (in)secure design and implementations of protocols

A little brain teaser
SSH

What is common among these protocols?

They all have RFCs

They're all security-critical

They all CAN benefit from PKCS#1 v1.5 RSA signatures

Textbook RSA signature

· Signing message m:

m

H(m)

H(m)d mod n S

where d = private exponent n = modulus

· Given (S, m, e, n), verifying S is a valid signature of m

S Se mod n

where e = public exponent

=?

H(m)

Beyond textbook RSA
· Reality is more complex than that 1. Which H() to use?
· SHA-1, SHA-2 family, SHA-3 family ...
2. n is usually much longer than H(m)
· |n|  2048-bit · |SHA-1| = 160-bit, |SHA-256| = 256-bit
· Need meta-data and padding
picture borrowed from http://www.howtobeadad.com/2016/29188/reality-vision-for-parents

Beyond textbook RSA
· The PKCS#1 family of standards · Both encryption and signature schemes
· version 2+ adapted schemes from Bellare et al.
· For signatures, PKCS#1 v1.5 most widely used
· e.g. certificates of Google, Wikipedia

PKCS#1 v1.5 Signature Scheme

· Signing:
m H(m) H(m)d H(m)d mod n
k kd kd mod n

For signature, BT (Block Type) = 0x01

0x00 BT PB 0x00 AS

PB (Padding Bytes) = 0xFF 0xFF ... 0xFF

?

· At least 8-byte long · Pad k to the size of n

AS is a DER-encoded ASN.1 structure, containing: · Meta-data describing H() · The actual H(m)
S

PKCS#1 v1.5 Signature Scheme
· Encoded AS looks like this:
30 21 30 09 06 05 2B 0E 03 02 1A 05 00 04 14 2A AE 6C 35 C9 4F CF B4 15 DB E9 5F 40 8B 9C E9 1E E8 46 ED
· H() = SHA-1(), m = "hello world" · altogether 35 bytes
· DER encoded object is a tree of <T,L,V> triplets

PKCS#1 v1.5 Signature Scheme
· Encoded AS looks like this:
TL
30 21 30 09 06 05 2B 0E 03 02 1A 05 00 04 14 2A AE 6C
V 35 C9 4F CF B4 15 DB E9 5F 40 8B 9C E9 1E E8 46 ED
· H() = SHA-1(), m = "hello world" · altogether 35 bytes
· DER encoded object is a tree of <T,L,V> triplets

PKCS#1 v1.5 Signature Scheme

· Encoded AS looks like this:

TL

30 21 T L

30 09

V 06 05 2B 0E 03 02 1A 05 00

V

04 DB

14 E9

2A 5F

AE 40

6C 8B

35 9C

C9 E9

4F 1E

CF E8

B4 46

15 ED

· H() = SHA-1(), m = "hello world" · altogether 35 bytes
· DER encoded object is a tree of <T,L,V> triplets

PKCS#1 v1.5 Signature Scheme

· Encoded AS looks like this:

TL

30 21 T L

30 09 T L

V

06 05 2B 0E 03 02 1A

05 00

V

04 DB

14 E9

2A 5F

AE 40

6C 8B

35 9C

C9 E9

4F 1E

CF E8

B4 46

15 ED

OID of SHA-1 null parameter

· H() = SHA-1(), m = "hello world" · altogether 35 bytes
· DER encoded object is a tree of <T,L,V> triplets

PKCS#1 v1.5 Signature Scheme

· Encoded AS looks like this:

TL

30 21 T L

30 09 T L

V

06 05 2B 0E 03 02 1A

T L 05 00

04 14 2A AE 6C 35 C9 4F CF B4 15

DB E9 5F 40 8B 9C E9 1E E8 46 ED

V

OID of SHA-1 null parameter
SHA-1("hello world")

· H() = SHA-1(), m = "hello world" · altogether 35 bytes
· DER encoded object is a tree of <T,L,V> triplets

PKCS#1 v1.5 Signature Scheme

· Encoded AS looks like this:

TL

30 21 T L

30 09 T L

V

06 05 2B 0E 03 02 1A

T L 05 00

04 14 2A AE 6C 35 C9 4F CF B4 15

DB E9 5F 40 8B 9C E9 1E E8 46 ED

V

· H() = SHA-1(), m = "hello world" · altogether 35 bytes
· DER encoded object is a tree of <T,L,V> triplets

PKCS#1 v1.5 Signature Scheme

· Given (S, m, e, n), verifier computes H(m) and r = Se mod n

m H(m)
r = Se mod nk kd
kd mod nS

=?
0x00 BT PB 0x00 AS
Check if r is well-formed?
All kinds of leniencies ...

RSA and Factorization
Given (e,n) can we find d?
· ed = 1 (mod) (n) d is the multiplicative inverse of e mod (n)
· if we know (n) = (p-1)(q-1) then easy to find d (use Extended Euclidean Algorithm)
· if we know n = pq then easy to find (n)

Bleichenbacher's low exponent attack

· Yet another crypto attack attributed to D. Bleichenbacher · CRYPTO 2006 rump session · Some implementations accept malformed r'

r' 0x00 BT PB 0x00 AS

Garbage

· Existential forgery possible when e is small · Generate signatures for some m without d

Bleichenbacher's low exponent attack
· A contributing factor to the push for bigger e (e.g. 65537)
· Smaller e more efficient for signature verifier
· e = 3 prescribed in some protocols
e.g. DNSSEC [RFC3110, Sect. 4]

A little brain teaser
SSH

What is common among these protocols?

They all have RFCs

They're all security-critical

suffer
They all CAN benefit from PKCS#1 v1.5 RSA signatures

Why was the attack possible?
· Problem: verifier accept malformed input w/ GARBAGE unchecked
· Can be in many different locations, not only at the end
0x00 BT PB 0x00 AS
· Longer modulus makes forgery easier
· More GARBAGE bits to use · Can handle longer hashes / slightly larger e

To find these attacks
· Want to see how input bytes are being checked
0x00 BT PB 0x00 AS
· If enough unchecked GARBAGE then

Automatically generate concolic test cases
· Observation: size of components exhibit linear relations
· e.g.  length(components)) = |n|; ASN.1 DER
· Programmatically capture such linear constraints · Ask Symbolic Execution to find satisfiable solutions
· Based on that, automatically pack symbolic/concrete components into test buffers
pictures borrowed from https://www.memecenter.com/fun/160/Find-x and https://askascientist.co.uk/health/viruses-mutate/

Testing with Symbolic Execution
· Symbolic Execution with concolic test cases
· Very useful abstraction · What and how things are being checked in code?
· Formulas can help cross-validate implementations

Finding root causes
· Locate the piece of code that imposes wrong constraints · Can we go from formula abstraction back to code? · Constraint Provenance Tracking
· Keep a mapping of <clause, source-level origin> · Function filtering, e.g. memcmp() · Tiny space & time overhead

Implementations Tested

Name - Version axTLS - 2.1.3 BearSSL - 0.4 BoringSSL ­ 3112 Dropbear SSH ­ 2017.75 GnuTLS ­ 3.5.12 LibreSSL ­ 2.5.4 libtomcrypt ­ 1.16 MatrixSSL ­ 3.9.1 (Certificate) MatrixSSL ­ 3.9.1 (CRL) mbedTLS ­ 2.4.2 OpenSSH ­ 7.7 OpenSSL ­ 1.0.2l Openswan ­ 2.6.50 * PuTTY ­ 0.7 strongSwan ­ 5.6.3 * wolfSSL ­ 3.11.0

Overly lenient YES No No No No No YES YES YES YES No No YES No YES No

Practical exploit under small e YES YES No No No YES YES -

Discussion of signature forgery assumes e = 3 and SHA-1, attacks also applicable to newer hash algorithms
* configured to use their own internal implementations of PKCS#1 v1.5

Leniency in Openswan 2.6.50

· Ignoring padding bytes [CVE-2018-15836]

· Simple oversight, severe implications

· Exploitable for signature forgery

·

Use this r'

/** all numbers below are hexadecimals **/ 00 01 GARBAGE 00 30 21 ... ... 04 16 SHA-1(m')

· Want: (a + b)3 = a3 + 3a2b + 3b2a + b3, s.t.

· MSBs of a3 give what is before GARBAGE

· LSBs of b3 give what is after GARBAGE

· (LSBs of a3) + 3a2b + 3b2a + (MSBs of b3) stay in GARBAGE

· fake signature S' = (a+b)

New unit test in Openswan

Leniency in strongSwan 5.6.3
1. Not checking AlgorithmParameter [CVE-2018-16152]
· classical flaw found in GnuTLS, Firefox years ago · Exploitable for signature forgery
· hide GARBAGE in AlgorithmParameter · follow the Openswan attack algorithm
· adjust what a3 and b3 represent, fake signature S' = (a+b)

Leniency in strongSwan 5.6.3

2. Accept trailing bytes after Algorithm OID [CVE-2018-16151] · interestingly, Algorithm OID is not matched exactly · a variant of longest prefix match

/* [AlgorithmIdentifier] */ 30 09
06 05 2B 0E 03 02 1A 05 00

/* [AlgorithmIdentifier] */ 30 0C
06 08 2B 0E 03 02 1A AB CD EF 05 00

both would be recognized as OID of SHA-1

· knowing this, one can hide GARBAGE there
· follow the Openswan attack algorithm
· adjust what a3 and b3 represent, fake signature S' = (a+b)

Leniency in strongSwan 5.6.3
3. Accepting less than 8 bytes of padding
· Can be used to make the other attacks easier
· Use no padding, gain more bytes for GARBAGE

strongSwan Security Update

· Some key generation programs still forces e=3 · e.g., ipsec_rsasigkey on Ubuntu

Leniency in axTLS 2.1.3
1. Accepting trailing GARBAGE [CVE-2018-16150]
· original Bleichenbacher '06 forgery also works

Leniency in axTLS 2.1.3
2. Ignoring prefix bytes
· First 10 bytes are not checked at all

Leniency in axTLS 2.1.3
2. Ignoring prefix bytes
· First 10 bytes directly skipped · Make forgery easier, use this r' (first 90 bits are all zeros)
/** all numbers below are hexadecimals **/ 00 00 00 00 00 00 00 00 00 00 00 30 21 ... ... 04 16 SHA-1(m') GARBAGE
· Reduce the distance between two consecutive cubes
· Easier to find S'

Leniency in axTLS 2.1.3

3. Ignoring AS.AlgorithmIdentifier [CVE-2018-16253]

/** all numbers below are hexadecimals **/

/* [AS.DigestInfo] */

30 21

/* [AlgorithmIdentifier] */

30 09 06 05 2B 0E 03 02 1A 05 00

this whole chunk is skipped ...

/* [Digest] */

04 14

/* H(m), H()=SHA-1(), m = "hello world" */

2A AE 6C 35 C9 4F CF B4 15 DB

E9 5F 40 8B 9C E9 1E E8 46 ED

· Probably because certificates have an explicit signature algorithm field, which gives H()

Leniency in axTLS 2.1.3
3. Ignoring AS.AlgorithmIdentifier [CVE-2018-16253]
· Just because H() is known from outside · Doesn't mean it can be skipped

·

Use this r'

/** all numbers below are hexadecimals 00 01 FF FF FF FF FF FF FF FF 00

**/

30 5D 30 5B GARBAGE 04 16 SHA-1(m')

· hide GARBAGE in AlgorithmIdentifier

· follow the Openswan attack algorithm

· adjust what a3 and b3 represent, fake signature S' = (a+b)

Leniency in axTLS 2.1.3

4. Trusting the declared ASN.1 DER lengths w/o sanity checks [CVE-2018-
16149]

/** all numbers below are hexadecimals **/

/* [AS.DigestInfo] */

30 w

/* [AlgorithmIdentifier] */

30 x 06 u 2B 0E 03 02 1A 05 y

put absurdly large values to trick verifier into reading from illegal addresses

/* [Digest] */

04 z

/* H(m), H()=SHA-1(), m = "hello world" */

2A AE 6C 35 C9 4F CF B4 15 DB

E9 5F 40 8B 9C E9 1E E8 46 ED

· DoS PoC: making z exceptionally large crashed the verifier

Leniency in axTLS 2.1.3
4. Trusting the declared ASN.1 DER lengths w/o sanity checks [CVE-2018-16149]
· DoS PoC: making z exceptionally large crashed the verifier
· Particularly damaging · axTLS does certificate chain validation bottom-up · Even if no small e in the wild
· any MITM can inject a fake certificate with e = 3 · crash verifier during chain traversal

patching axTLS
ESP8266

Leniency in libtomcrypt 1.16
1. Accepting trailing GARBAGE
· original Bleichenbacher '06 forgery also works
2. Accepting less than 8 bytes of padding
· Use no padding, gain more bytes for GARBAGE
· Make signature forgery easier
· Flaws independently found by other researchers, fixed in v1.18

Leniency in MatrixSSL 3.9.1 (CRL)

1. Mishandling Algorithm OID

/** all numbers below are hexadecimals **/

/* [AS.DigestInfo] */

30 w

/* [AlgorithmIdentifier] */

30 x 06 u 2B 0E 03 02 1A 05 y

can take arbitraily any values

/* [Digest] */

04 z

/* H(m), H()=SHA-1(), m = "hello world" */

2A AE 6C 35 C9 4F CF B4 15 DB

E9 5F 40 8B 9C E9 1E E8 46 ED

· Some bytes in the middle of AS can take any values
· Depends on choice of H(), SHA-1: 5 bytes, SHA-256: 9 bytes
· Doesn't seem to be numerous enough for practical attacks

Other leniencies

· Lax checks on ASN.1 DER lengths in MatrixSSL(CRL)

/** all numbers below are hexadecimals **/

/* [AS.DigestInfo] */

30 w

/* [AlgorithmIdentifier] */

30 x

many possible values

06 u 2B 0E 03 02 1A

will be accepted

05 y

/* [Digest] */

04 z

/* H(m), H()=SHA-1(), m = "hello world" */

2A AE 6C 35 C9 4F CF B4 15 DB

E9 5F 40 8B 9C E9 1E E8 46 ED

· Some bits in the middle of AS can take any values

· Doesn't seem to be numerous enough for practical attacks

· Variants of this leniency also found in mbedTLS, libtomcrypt, MatrixSSL (Certificate)

Leniency in MatrixSSL 3.9.1

Summary
· RSA signature verification should be robust regardless of the choice of e · Flawed verification can break authentication in different scenarios
· To analyze this, we extend symbolic execution with · Automatic generation of concolic test cases · Constraint Provenance Tracking
· Found new variants of Bleichenbacher '06 attacks after more than a decade, 6 new CVEs · And some other unwarranted leniencies

Lessons Learned
· Corner-cutting is not cool · Learn from previous mistakes
· Parsing is hard

Moosa Yahyazadeh Aniket Kate

Omar Chowdhury Ninghui Li

