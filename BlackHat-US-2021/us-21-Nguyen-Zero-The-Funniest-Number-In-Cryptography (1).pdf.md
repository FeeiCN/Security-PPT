Zero - The Funniest Number in Cryptography
Nguyen Thoi Minh Quan

Agenda
 Terminology  High level attack idea: 0 signature and "splitting zero" attack  BLS signature  BLS Aggregate Signature  Bypass Ethereum py_ecc's 0 check.  "Splitting zero" attacks against crypto libraries & standard draft.
This is my personal research, and hence it does not represent the views of my employer.

0-related bugs
 BLS draft v4 in IETF (aka Standard draft)  4 crypto libraries: Ethereum/py_ecc,
Herumi/bls, Sigp/milagro_bls, Supranational/blst

Signature verification
 Private key: x, public key: X, message: m  Signature = Sign(x, m)  Signature verification: Check f(, X, m) ?= 0

What's up with 0? Check f(, X, m) ?= 0 0 * a = 0, a

Aggregate Signature

1= Sign(x1, m1) 2= Sign(x2, m2)

Aggregator

 = 1 + 2

Verifier

Check f((X1,X2),(m1, m2), ) ?= 0

Aggregate Signature

1 Check 1 ?=0
2 Check 2 ?=0

Aggregator

 = 1 + 2

Verifier

Check f((X1,X2),(m1, m2), ) ?= 0

"Splitting zero" attack: What if 1 = 1, 2 = -1?

Elliptic Curve
P

Q

R'

P + Q = R
R

Elliptic Curve Group Structure
 Addition: P + Q  Zero point: P + 0 = 0 + P = P  nG = G + G + ... + G = 0, n is the order of the point.  Group (0, G, 2G, ..., (n - 1)G)

Pairing

P
Pairing: maps 2 points to a number
Q e(P, Q)
-2 -1 0 1 2 3

Pairing
 e(P + Q, R) = e(P, R) * (Q, R)  e(aP, bQ)= e(P, Q)ab  e(aP, bQ) = e(P, Q)ab = e(abP, Q)= e(bP, aQ)  e(0, X) = 1 = e(Y, 0), X, Y

BLS signature
m

H *x
H(m)
*x G

 = x*H(m) X=x*G

BLS signature
 Signature  = xH(m)  Verify signature: e(, G) ?= e(H(m), X)  Why? e(, G) = e(xH(m), G) = e(H(m), G)x = e(H(m), xG) = e(H(m), X)

0 signature & public key
 When X = 0,  = 0: e(, G) = e(0, G) = 1 = e(H(m), 0) = e(H(m), X), m
 The signature is valid for all messages.

Standard draft requests checking for 0. Can we bypass the check?

Bypass Ethereum py_cc check for 0

12345
Check ?= 0

25410
Doesn't check

34231
Doesn't check

P

Ethereum py_ecc: 0 signature & public key (Demo)

BLS Aggregate Signature

1= x1H(m1) 2= x2H(m2)
n= xnH(mn)

Aggregator

 = 1 +...+ n

Verifier

e(, G) ?= e(H(m1),X1) *...* e(Xn, H(mn))

BLS Aggregate Signature Verification
 e(, G) ?= e(H(m1), X1) * e(H(m2), X2 )  Why?
e(, G) = e(x1H(m1) + x2H(m2), G) = e(x1H(m1), G) * e(x2H(m2), G) = e(H(m1), x1G) * e(H(m2), x2G) = e(H(m1), X1) * e(H(m2), X2)

BLS FastAggregateVerify: Special Case m1 = m2 = m
 e(H(m1), X1) * e( H(m2), X2) = e( H(m), X1) * e( H(m), X2) = e(H(m), X1+ X2)  e(G, ) ?= e( H(m), X1 + X2)

"Splitting Zero" Attack against Milagro & Herumi's BLS FastAggregateVerify
 e(, G) ?= e(H(m), X1 + X2)  X1 + X2 = 0 &  = 0:
e(, G) = e(0, G) = 1 = e(H(m), 0) = e(H(m), X1 + X2), m  The aggregate signature is valid for all messages.

Milagro bls's Splitting Zero Attack (Demo)

"Splitting Zero" Attack against AggregateVerify in Standard Draft
 e(1+ ... + n, G) ?= e(H(m1), X1) * ...* e(H(mn),Xn)  The "standard draft" is vulnerable to X1 + X2 = 0 attack
 All libraries ethereum/py_ecc, milagro/bls, supranational/blst, herumi/bls are vulnerable.

"Splitting Zero" attack against Standard Draft and Libraries

If 1 = x1H(m1) is a valid signature of message m1 then when X2 + X3 = 0, 1 is a valid aggregate signature for (m1, m, m) for all m.

If  is a valid signature for (m1, m2, m2) then when X2 + X3 = 0,  is also a valid signature for all (m1, m3, m3) for all m3.

"Splitting Zero" Attack against Supranational blst's And Standard Draft (Demo)

Standard Draft's Consensus Bug
 FastAggregateVerify((X1, X2), m, 0) = False, X1 + X2 = 0  AggregateVerify((X1, X2), (m, m), 0) = True

Supranational blst and Standard Draft's Consensus Bug (Demo)

"Splitting Zero" Attack. Why is it dangerous?

For the aggregate signature case, the attackers' private keys x1, x2 are randomized, so the attackers protect the secrecy of their private keys and the attack cost is free.

Detecting colluded keys are difficult because it's equivalent to finding solution a1X1 + a2X2 + ... + anXn = 0 where ai = 0, 1.

The verifier only verifies the aggregate signature, but it never sees or verifies single signatures, so it never be sure what happened.

Thanks for your attention!

Appendix (miscellaneous 0-related bug)
 0-length signature or 0-length message ( go and rust binding supranational/blst): crashed
 inverse(0) mod p = 0, but inverse(p) mod p = 1 in Ethereum py_cc

