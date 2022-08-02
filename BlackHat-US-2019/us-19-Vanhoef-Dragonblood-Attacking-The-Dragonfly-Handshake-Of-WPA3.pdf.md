Dragonblood: Attacking the Dragonfly Handshake of WPA3
Mathy Vanhoef and Eyal Ronen Black Hat USA. Las Vegas, USA, 7 August 2019.

Introduction: password-based authentication

Dictionary attacks, WPA2 no forward secrecy

Routers: self-signed certs or plaintext

Needs Public Key Infrastructure

Trust-on-first-usage by key pinning

 None are ideal, are there better solutions?
2

Password Authenticated Key Exchanges (PAKEs)

Provide mutual authentication

Negotiate session key

Forward secrecy & prevent offline dictionary attacks

Protect against server compromise

 We focus on WPA3's Dragonfly handshake
3

Dragonfly

Convert password to elliptic curve point P

Convert password to elliptic curve point P

Commit phase

Confirm phase

4

With MODP groups: hash-to-group
for (counter = 1; counter < 256; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue P = (-1)/ if P > 1: return P
In practice always true
5

With MODP groups: hash-to-group
for (counter = 1; counter < 256; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue
P = (P-1r)o/blem: value >= p
if P > 1: return P
In practice always true
6

With MODP groups: hash-to-group
for (counter = 1; counter < 256; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue P = (-1)/ if P > 1: return P
7

With MODP groups: hash-to-group
for (counter = 1; counter < 256; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue P = (-1)/ if P > 1: return P
No timing leak countermeasures despite warnings by IETF & CFRG!
8

IETF mailing list in 2010
"[..] susceptible to side channel (timing) attacks and may leak the shared password. I'd therefore recommend [..] a deterministic algorithm."
"I'm not so sure how important that is [..] doesn't leak the shared password [..] not a trivial attack."
9

What information is leaked?
for (counter = 1; counter < 256; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue P = (-1)/ if P > 1: return P
 Measure #iterations for various addresses
10

What information is leaked?
for (counter = 1; counter < 256; counter++) value = hash(pw, counter, addr1, addr2)
if value >=Spp:ocoofntcilnieuent address to obtain P = (d-if1f)e/rent execution & leak new data
if P > 1: return P
 Measure #iterations for various addresses
11

Raspberry Pi 1 B+: differences are measurable
12

Raspberry Pi 1 B+: differences are measurable
Hostap (WPA3): ~75 measurements / address iwd (EAP-pwd): ~30 measurements / address
13

Leaked information: #iterations needed

Client address

addrA

Measured

14

Leaked information: #iterations needed

Client address

addrA

Measured

Password 1

Password 2

Password 3
15

Leaked information: #iterations needed

Client address

addrA

Measured

Password 1

Password 2

Password 3
16

Leaked information: #iterations needed

Client address

addrA

addrB

Measured

Password 1

Password 2

Password 3
17

Leaked information: #iterations needed

Client address

addrA

addrB

Measured

Password 1

Password 2

Password 3
18

Leaked information: #iterations needed

Client address

addrA

addrB

addrC

Measured

Password 1

Password 2

Password 3
19

Leaked information: #iterations needed

Client address

addrA

addrB

addrC

Measured

Password 1

Password 2
Need ~17 addresses to test ~107 passwords
Password 3
20

Leaked information: #iterations needed

Client address

addrA

addrB

addrC

Measured
PassFwoordr1ms a signature of the password

Password 2
Need ~17 addresses to test ~107 passwords
Password 3
21

What about elliptic curves?
Hash-to-group with elliptic curves also affected? > By default Dragonfly uses NIST curves > Timing leaks for NIST curves are mitigated
Dragonfly also supports Brainpool curves > After our initial disclosure, the Wi-Fi Alliace private created
guidelines that state these are secure to use > Bad news: Brainpool curves in Dragonfly are insecure
22

Hash-to-curve
for (counter = 1; counter < k or not x; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue y_sqr = value^3 + a * value + b if is_quadratic_residue(y_sqr) and not x: x = value pw = random()
y = sqrt(x^3 + a * x + b) return (x, y)
23

Hash-to-curve
for (counter = 1; counter < k or not x; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue
y_sqr P= rvoablulee^m3 :+nao*svoalluuteio+nbfor y
if is_quadratic_residue(y_sqr) and not x: x = value pw = random()
y = sqrt(x^3 + a * x + b) return (x, y)
24

Hash-to-curve
for (counter = 1; counter < k or not x; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue y_sqr = value^3 + a * value + b if is_quadratic_residue(y_sqr) and not x: x = value pw = random()
y = sqrt(x^3 + a * x + b) return (x, y)
25

Hash-to-curve
for (counter = 1; counter < k or not x; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue y_sqr = value^3 + a * value + b if is_quadratic_residue(y_sqr) and not x: x = value pw = random()
y = sqrt(x^3 + a * x + b) return (x, y)
26

Hash-to-curve
for (counter = 1; counter < k or not x; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue
y_sqPr r=obvalleume^:3d+iffae*revnatlupea+ssbwords if ish_aquvaedrdaitfifce_rreensitdeuex(eyc_suqtri)onantdimnoet x:
x = value pw = random() y = sqrt(x^3 + a * x + b) return (x, y)
27

Hash-to-curve
for (counter = 1; counter < k or not x; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue y_sqr = value^3 + a * value + b if is_quadratic_residue(y_sqr) and not x: x = value pw = random()
y = sqrt(x^3 +aA*lwx a+ybs)execute at return (x, y) least k iterations
28

Hash-to-curve

for (counter = 1; counter < k or not x; counter++)

value = hash(pw, counter, addr1, addr2)

if value >= p: continue

y_sqr = value^3 + a * value + b

if is_quadratic_residue(y_sqr) and not x:

x = value pw = random()

In case quadratic test

y = sqrt(x^3 + a * x + b)is not constant time

return (x, y)

29

Hash-to-curve
for (counter = 1; counter < k or not x; counter++) value = hash(pw, counter, addr1, addr2) if value >= p: continue
y_sqr = vaPlureo^b3le+ma:*vavaluluee >+=bp
if is_quadratic_residue(y_sqr) and not x: x = value pw = random()
y = sqrt(x^3 + a * x + b) return (x, y)
30

Hash-to-curve
for (counter = 1; counteMra<y bkeotrruneoftorx; counter++) value = hash(pw, coBurnatienrp,ooaldcdur1rv,easd!dr2)
if value >= p: continue y_sqr = value^3 + a * value + b if is_quadratic_residue(y_sqr) and not x:
x = value pw = random() y = sqrt(x^3 + a * x + b) return (x, y)
31

Hash-to-curve

for (counter = 1; counteMra<y bkeotrruneoftorx; counter++) value = hash(pw, coBurnatienrp,ooaldcdur1rv,easd!dr2)

if value >= p: continue

y_sqr = value^3 + a * value + b

if is_quadratic_residue(y_sqr) and not x:

x = value

Quadratic test may be skipped

pw = random()

y = sqrt(x^3 + a * x + b)

return (x, y)

32

Hash-to-curve

for (counter = 1; counteMra<y bkeotrruneoftorx; counter++) value = hash(pw, coBurnatienrp,ooaldcdur1rv,easd!dr2)

if value >= p: continue

y_sqr = value^3 + a * value + b

if is_quadratic_residue(y_sqr) and not x:

x = value

Quadratic test may be skipped

pw = random()

y A= rsaqnrdto(mx^3#(e+xtara*itexra+tiob)ns) rethuarvne (axt,ooy)big hash output
33

Influence of extra iterations
Execution 1
34

Influence of extra iterations
Execution 1 Execution 2 Execution 3 Execution 4
35

Influence of extra iterations
Execution 1 Execution 2 Execution 3 Execution 4
36

Influence of extra iterations
Execution 1 Execution 2 Execution 3 Execution 4
Variance ~ when password element was found
37

Influence of extra iterations
Execution 1 Execution 2 Execution 3 Execution 4
Variance ~ when password element was found Average ~ when found and #iterations with big hash
 Again forms a signature of the password
38

Raspberry Pi 1 B+
39

Raspberry Pi 1 B+
Hostap (WPA3): ~300 measurements / address
40

Cache Attacks
41

Recap: methodology used
1. Inspect implementations: WPA3 and EAP-pwd 2. Attacks specific to WPA3 3. Side-channel attacks
 Analyse timing attacks warned by IETF & CFRG  Find new timing leaks by auditing the standard  Cache-attacks & use MicroWalk[WMES18] for automatic detection
4. Use leaks to brute-force the password
42

Recap: methodology used
1. Inspect implementations: WPA3 and EAP-pwd 2. Attacks specific to WPA3 3. Side-channel attacks
 Analyse timing attacks warned by IETF & CFRG  Find new timing leaks by auditing the standard  Cache-attacks & use MicroWalk[WMES18] for automatic detection
4. Use leaks to brute-force the password
43

Hash-to-curve: QuadUrsateicaRsecslidoucek to detect in for (counter = 1; couwntheric<h kiteorrantoitonx;wceouanrteer++)
value = hash(pw, counter, addr1, addr2) if value >= p: continue y_sqr = value^3 + a * value + b if is_quadratic_residue(y_sqr) and not x:
x = value pw = random()
y = sqNrtI(SxT^3c+urave*sx: +usbe) Flush+Reload to retduernte(cxt,ify)code is executed in 1st iteration
44

Hash-to-curve: BrainUpsoeolabsigchloaschk to detect in for (counter = 1; couwntheric<h kiteorrantoitonx;wceouanrteer++)
value = hash(pw, counter, addr1, addr2) if value >= p: continue y_sqr = value^3 + a * value + b if is_quadratic_residue(y_sqr) and not x:
x = value
Brainppw o=orla:nudsome()Flush+Reload to detect y = sqirftc(xo^d3 e+ isa e* xxec+ ubt)ed in 1st iteration
return (x, y)
45

Cache-attacks in Practice
NIST curve attack ( when P was found) > Simplified variant of a cache template attack > Works against client and AP!
Brainpool Attack ( when hash output too big) > Simplified variant of a cache template attack > Against hostap patched against NIST curve attack > Confirmed that hostap with Brainpool was still vulnerable
46

Brute-force Attacks
47

Brute-force Attack Overview
Recap of our dictionary attacks: > Use signature to detect wrong passwords
Improve performance using GPU code: > We can brute-force  passwords for $1 > MODP / Brainpool: all 8 symbols costs $67 > NIST curves: all 8 symbols costs $14k
48

Detailed Analysis: See Paper
> Estimate required #(spoofed MAC addresses):
> Offline brute-force cost:
49

Implementation Inspection
50

Implementation Vulnerabilities I
Attacker sends point not on curve: > Force session key in small subgroup > Recover session key & bypass authentication > EAP-pwd vulnerable. For WPA3 only iwd affected.
Reflect received scalar and element: > Can authenticate as any victim > But cannot recover session key > All EAP-pwd servers vulnerable
51

Implementation Vulnerabilities II
Bad randomness: > Can recover password element P > Aruba's EAP-pwd client for Windows is affected > With WPA2 bad randomness has lower impact!
Side-channels: > FreeRADIUS aborts if >10 iterations are needed > Aruba's EAP-pwd aborts if >30 are needed > Use leaked info to recover password
52

Timing Leak Defenses
Extra iterations in elliptic curve variant > EAP-pwd RFC doesn't contain this defense > Got added to 802.11 standard in a later revision
Is this defense implemented? > Most EAP-pwd implementations vulnerable > iwd uses  = 20 and Cypress' firmware uses  = 8 > Defense is too costly on lightweight devices
53

Wi-Fi Specific Attacks
54

Denial-of-Service Attack

Convert password to elliptic curve point P

Convert password to elliptic curve point P

AP converts password to EC point when client connects
> Conversion is computationally expensive (k = 40) > Forging 8 connections/sec saturates AP's CPU
55

Why is Dragonfly so inefficient?

Normally any crypto overhead is avoided: > Slow adoption of HTTPS due to overhead > LTE doesn't authenticate data packets

How did an inefficient protocol got standardized?

2011

Standardized efficient version

2012

Added extra iterations

2016

Added quadratic test

2018 Became WPA3 because "no alternative"
56

Downgrade Against WPA3-Transition
Transition mode: WPA2/3 use the same password > WPA2's handshake detects downgrades  forward secrecy > Performing partial WPA2 handshake  dictionary attacks
Solution is to remember which networks support WPA3 > Similar to trust on first use of SSH & HSTS > Implemented by Pixel 3 and Linux's NetworkManager > Wi-Fi Alliance's mitigation: separate WPA2/3 networks
57

Other Downgrade Attacks
Handshake can be performed with multiple curves > Initiator proposes curve & responder accepts/rejects > Spoof reject messages to downgrade used curve
Design flaw, all client & AP implementations vulnerable
58

Group Downgrade Attack
59

Group Downgrade Attack
60

Group Downgrade Attack
61

Other Downgrade Attacks
Implementation-specific dictionary attacks > Clone WPA3-only network & advertise it only supports WPA2 > Galaxy S10 & iwd connected using the WPA3-only password > Results in trivial dictionary attack
62

Disclosure
63

Notification of affected parties
Notified parties early with hope to influence WPA3 > Initially met with resistance, treated as impementation flaws > Asked to edit conclusion: "So, please: a list or a retraction." > Several minor leaks during embargo
64

Disclosure Process
Wi-Fi Alliance released implementation guidelines > Still had timing leaks with Brainpool  2nd disclosure round > Countermeasures too expensive on lightweight devices
WPA3 and EAP-pwd standards are now being updated: > Use Shallue-Woestijne-Ulas, and secure MODP groups > Based on the hash-to-curve draft RFC > Allow offline computation of password element
65

Disclosure Process
Wi-Fi Alliance released implementation guidelines > Still had timing leaks with Brainpool  2nd disclosure round > Countermeasures too expensive on lightweight devices
WPA3 and EAP-pwd standards are now being updated: > Use Shallue-Woestijne-Ulas, and secure MODP groups
> Based on thMe ihgahsht-troe-csuurvletdirnaftWRFPCA3.1??
> Allow offline computation of password element
66

Thank you! Questions?
> WPA3 vulnerable to side-channels > Countermeasures are very costly > Still vulnerable after 1st disclosure > Hard to implement securely > Standard is being updated
https://wpa3.mathyvanhoef.com
67

