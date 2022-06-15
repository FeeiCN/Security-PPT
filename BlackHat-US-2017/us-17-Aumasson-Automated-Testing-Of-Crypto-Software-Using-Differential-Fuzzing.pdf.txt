Automated Testing of Crypto Software Using Differential Fuzzing
JP Aumasson, Yolan Romailler

About us

Researchers at Kudelski Security, based in Switzerland Applied crypto research, source code review, consulting, etc.

JP / @veorq
Presented at BH, Defcon, Infiltrate, Troopers, etc.
https://aumasson.jp

Yolan / @anomalroil
Master's thesis about automated testing of crypto
https://romailler.ch

Out in Oct. 2017, now in early access at http://nostarch.com

Roadmap
1. Testing crypto 2. The approach: differential fuzzing 3. A new tool: CDF
a. How it works b. Examples of tests c. Demo 4. Issues found 5. Conclusions

1 Testing crypto
Credit: https://unsplash.com/@sveninho

What do we want?
Testing functionality  Valid inputs give correct output  Invalid input trigger appropriate error Testing security  Program can't be abused  Cryptographic secrets won't leak

Testing what?
Code against code
 When porting to a new language or platform  Assume reference code is correct (not always true)  As many test values as you need + internal debug values
Code against specs
 When implementing a standard  Specs can be incomplete or ambiguous  Only a handful of test values

Automated testing

In order of complexity and coverage

 Static analyzers About code security, not correctness

 Test vectors

The more values, the more coverage

 Dumb fuzzing

Typically looks for crashes, e.g. afl

 Smart fuzzing

Protocol- or state machine-specific

 Formal verification Proves correctness / security properties

How to maximize the efficiency? (ease of use × coverage)

Towards cost-effective testing

Limitations of current methods
 Randomness quality  Timing leaks  Test vectors focus on valid inputs, not invalid ones  Parameters space rarely covered (key sizes, etc)  Software security  crypto security (logic bugs)
How to better address those in a single tool?

2 Approach: differential fuzzing
Credit: https://unsplash.com/@ja5on

New tool from old ideas
Testing crypto by comparing two implementations not new
New: tool to automate it for many different interfaces

Principle for hash functions, PRNG

Input generation (specific to function tested)

x

x

P1

P2

P1(x) == P2(x) ?

Principle for encryption

Input generation (specific to function tested)

Pub key

x
P1

P1(x)
P2

Priv Key

P2( P1(x) ) == x ?

Principle for signatures

Input generation (specific to function tested)

Priv key

x
P1

P1(x)
P2

Pub Key

P2( P1(x) ) == ok ?

3 A new tool: CDF
Credit: https://unsplash.com/@timstief

CDF ­ Crypto Differential Fuzzing
Command-line tool in Go  Native code, portable to Linux/macOS/Windows  Concurrency support, fast enough (not speed bottleneck) Language-agnostic  Takes an executable file (binary or script)  Can test crypto from any language or framework Started in May 2016, most code written in Sept '16 - March '17

Why using CDF?
 Correctness and security of implementations  Interoperability between implementations  Checks include
 Insecure parameters supported  Non-compliance with standards (e.g. FIPS)  Edge cases of specific algorithms (e.g. DSA)
CDF can replace test vectors, but not formal verification

Wycheproof ­ similar but different
From Google (Bleichenbacher, Duong, Kasper, Nguyen)
Announced in Dec. 2016, presented at RWC in Jan. 2017
 Extensive set of unit tests  Specific to Java's common crypto interface (so far)  Many bugs found in OpenJDK, BouncyCastle, etc.  Tests a single program, doesn't compare implementations
https://github.com/google/wycheproof

3.a How it works
Credit: https://unsplash.com/@pyeshtiaghi

So you want to test ECDSA?

Crypto++

How to deal with the different APIs?

OpenSSL Go/crypto

Generic ECDSA interface in CDF

 Public key = curve point P = (x, y)  Private key = number d, such that P = dG  Signature = pair of numbers (r, s)
ECDSA interface in CDF for CLI input, hex-encoded:

Signature Verification

Input x, y, d, m x, y, m, r, s

Output r, s True / False

CDF interfaces
 General API of CDF translatable to any tested software  Needed in order to support black-box testing Interfaces define the inputs and expected outputs for a given crypto functionality (hashing, RSA encryption, etc.) Not all inputs of an interface may be used by the tested software

How CDF works
CDF
CDF binary, compiled from Go

Executable files calling the software to be tested (e.g. libs)

Interface implementation
for P1

Interface implementation
for P2

Software tested, may be different libs, languages, etc.

P1
e.g. function in OpenSSL

P2
e.g. function in go/crypto

ECDSA interface for cryptography.io
sign + verify, 35 sLoC (.py)

ECDSA interface for Go's crypto package
sign + verify, 72 sLoC (.go)

ECDSA interface for OpenSSL
sign + verify, 124 sLoC (.c)

3.b Examples of tests
Credit: https://unsplash.com/@rubavi78

Simplest case: keyed hash (PRF, MAC)
 P1 and P2 do the same thing (hash a message using a key)  Compare P1 and P2 behavior on different input pairs:
 For different message lengths  For different key lengths  Checks distinct outputs with 00-padded keys (HMAC ...)

ECDSA
 P1 signs, P2 verifies, for different hash lengths  Check support of hashes larger than group size (truncation?)  Check degenerate cases (risks of forgery, DoS, key recovery)
 (0, 0) public key  0 private key  Hash = 0 and signature = (x, x)

Example of ECDSA test

RSA encryption
 P1 encrypts, P2 decrypts, for different message lengths  Checks
 Exponents lengths supported, detecting max length  Support of small private exponents d  Support for messages larger than the modulus  Detects timing leaks

Timing leaks detection
Based on dudect ­ https://github.com/oreparaz/dudect
 Searches statistical evidence of timing discrepancies between two classes of input values (e.g. valid and invalid ciphertexts)
 Leverages Welch's t-test  dudect entirely rewritten in Go

3.c Demo
Credit: https://unsplash.com/@rubavi78

4 Issues found
Credit: https://unsplash.com/@toddcravens

Findings summary

Focus on widely used libraries, only tested few components Number of issues discovered:

OAEP ECDSA DSA

go/crypto OpenSSL

2

0

2

2

3

2

mbedTLS 0 2 n.a.

PyCrypto 0 n.a. 3

Crypto++ 0 0 0

Impressive defense in depth in Crypto++...

DSA (Go, OpenSSL, PyCrypto)
CDF detected the following:
 DoS on attacker-provided parameters upon verification  Invalid signature issuance on invalid domain parameters  Always-valid signatures issuance and verification on invalid
domain parameters

(EC)DSA FIPS compliance: signature

(EC)DSA FIPS compliance: verification

Infinite loop in DSA signing (Go, OpenSSL)

Domain params (p, q, g), secret key x, pubkey yx mod p

1... Generate a random k, 1 < k < q 2. Calculate r = ( gk mod p ) mod q 3.. . If r = 0, goto 1. 4. Calculate s = k- 1 ( H(m) + xr) mod q 5. If s = 0, goto 1. 6. Return the signature ( r, s )

What if g = 0 ?

Infinite loop in DSA (Go)

Infinite loop in DSA (Go)

Fix implemented by the Go team: Bound the number of iterations

Timing leak in RSA-OAEP (Go)
Potential timing leak in RSA-OAEP decryption, noted in Go's source code comments, which we experimentally confirmed
Go's OAEP potentially vulnerable to Manger's attack...  Seems unexploitable (we measured leaks of nanoseconds..)  Too many measurements needed to exploit it, even locally  Timing leak  timing attack

General observations
Most crypto libraries...
 Lack sanity checks and parameters validation  Don't strictly conform to standards  Support weak parameters

5 Conclusions
Credit: https://unsplash.com/@martinjphoto

CDF is a new tool that...
 Tests the correctness and security of crypto software  Is in Go, portable, and supporting software any language  Uses differential fuzzing, to compare different
implementations of the same functionality  Found issues in widely used crypto libraries

TODO: CDF needs more...
 Interfaces, in order to test more crypto functionalities  Tests, like unit tests from Wycheproof missing in CDF  Applications, to find bugs in crypto software/libs  Testing, to find bugs in CDF

Thank you!
Get CDF at https://github.com/kudelskisecurity/cdf "Besides black art, there is only automation and mechanization."
--Federico García Lorca

