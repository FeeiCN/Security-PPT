Replacing SHA-2 with SHA-3 Enhances Generic Security of HMAC

Yusuke Naito
Mitsubishi Electric Corporation
Lei Wang
Shanghai Jiao Tong University

1
©2015 Mitsubishi Electric Corporation

SHA-2

 FIPS 180-4

 Inputs: arbitrary length

 Outputs: 224 bit, 256 bit, 384 bit, 512 bit

 Use Merkle-Damgard (MD) construction

 Iterates a compression function h

input m1

m2

ml

initial value IV

h

h

h

hash value (n bit)

=MD(m1||m2||...||ml)

 Hash functions with MD are vulnerable to the length extension attack
 HMAC was designed to convert the hash function with MD into a secure keyed hash function
2
©2015 Mitsubishi Electric Corporation

HMAC

 FIPS standard keyed hash (FIPS 198-1)  Call a hash function two times

Secret key
KI = K ipad

KO = K

message

 Used as  Key derivation function (KDF)

KI M

KO

opad

 Message authentication code (MAC)

Hash

 Widely used in e.g.,

Hash

 SSL, SSH, IPSec, TLS, IKE, etc

output

KDF MAC
3
©2015 Mitsubishi Electric Corporation

SHA-3

 Standardized at FIPS 202 (Aug. 2015)  Same interface as SHA-2
 Inputs: arbitrary length  Outputs: 224-bit, 256-bit, 384-bit, 512-bit  Use the sponge construction  Iterate a permutation P:{0,1}r+c{0,1} r+c

m1
0r P
0c

m2

r bit

P

c bit

ml
P

hash value (n bit)

4 ©2015 Mitsubishi Electric Corporation

Motivation
 FIPS 202
page 22

page 24

 SHA-2 may be replaced with SHA-3 in HMAC

KI M
SHA-2
SHA-3

KO
SHA-2
SHA-3
outupt

5 ©2015 Mitsubishi Electric Corporation

Question

Is there an advantage of replacing SHA-2 with SHA-3 in HMAC?

Security  PRF-security
 MAC-security (Unforgeability)

KI M
SHA-2
SHA-3

Generic Security
Assume that the underlying primitive has no structural fraw, i.e.,  SHA-2 Case
HMAC-MD using random oracle h  SHA-3 Case
HMAC-Sponge using random permutation P

KO
SHA-2
SHA-3
outupt
KDF MAC

6 ©2015 Mitsubishi Electric Corporation

Our Result
 Security of HMAC-MD (using random oracle h)  Proven in previous works
 Security of HMAC-Sponge (using random permutation P)  Not proven
 This paper  Prove the PRF- and MAC-security of HMAC-Sponge  Compare HMAC-Sponge with HMAC-MD in terms of the PRF- and MAC-security  Conclude that replacing SHA-2 with SHA-3 enhances the generic security of HMAC
7
©2015 Mitsubishi Electric Corporation

PRF-Security

Real
U
primitive

FK
HMAC function

R
Random Function

Ideal
U
primitive

D
distinguisher
0 or 1
 Indistinguishability between the real world and the ideal world  A distinguisher D interacts with
 (FK, U ) in the real world  (R , U ) in the ideal world  The advantage function is defined as
AdvPRF (D) := Pr[D=1 in the real world] HMAC - Pr[D=1 in the ideal world]
8
©2015 Mitsubishi Electric Corporation

MAC-Security

FK
HMAC function

VK
Vrification function

U
primitive

A
adversary
 An adversary A can interacts with (FK, VK ,U )  Verification function VK
 accept a pair (M, tag)  check the equality FK(M) = tag  return accept if the equality holds, and return reject otherwise  A cannot make a trivial query (M, tag) to VK,
that is, M has not been queried to FK  The advantage function is defined as
AdvmHMaAcC(A) := Pr[A makes a query to VK s.t. accept is returned]
9
©2015 Mitsubishi Electric Corporation

Security Parameters

PRF-Security
Real

U
primitive

FK
HMAC function

R
Random Function

Ideal
U
primitive

offline

online online
D
distinguisher

offline

MAC-Security

FK
HMAC function
online

VK
Vrification function

U
primitive

online
A
adversary

offline

0 or 1

Security Parameters  n: hash size  Q: number of offline queries (primitive queries )  q: number of online queries (construction queries)  l: maximum input length in blocks to HMAC

10
©2015 Mitsubishi Electric Corporation

PRF- and MAC-Security of HMAC-MD

HMAC-MD

KI

m1

ml

KO

IV

h

h

h
n bit

IV

h

h

outupt (n bit)

 The following bounds were proven.

 D: AdvPRHFMAC-M(DD) O(lq2/2n)



A:

Advmac (A) HMAC-MD

O(lq2/2n)

l×q2/2n
Collision in n-bit internal states

 HMAC-MD is PRF- and MAC-secure up to q = O(2n/2/l1/2)

11
©2015 Mitsubishi Electric Corporation

PRF- and MAC-Security of HMAC-Sponge

 HMAC-Sponge

KI

m1

ml

0r

P

P

0c

P
KO

0r

P

P

0c

 We prove that  D: AdvPRHMF AC-Spong(eD)O(q2/2n + (lq)2/2r+c + lqQ/2r+c)  A: AdvmHaMcAC-Sponge(A)O(nq/2n + (lq)2/2r+c + lqQ/2r+c)

outupt (n bit)

12
©2015 Mitsubishi Electric Corporation

Step 1: Ind. of HMAC-Sponge from HMAC-RF

Step 1

HMAC-Sponge

KI m1

0r

0c

P

P

ml

KO

P

0r

0c

P

P

HMAC-RF
M
random function
R1

random function
R2

P

online

P

D

offline

distinguisher

 The outputs of Sponge in HMAC are randomly drawn if the inputs are new  If the inputs are not new then one of the following events occurs
 Collision in inputs to P in HMAC-Sponge : O((lq)2/2r+c)  Collision in inputs to P between online and offline queries: O(lqQ/2r+c)  Indistinguisiable prob.: O((lq)2/2r+c + lqQ/2r+c)

We can analyze the security of HMAC-Sponge by using HMAC-RF

with the security loss O((lq)2/2r+c + lqQ/2r+c)

13
©2015 Mitsubishi Electric Corporation

Step 2: The PRF- and MAC- Security of HMAC-RF

Step 2
PRF-Security of HMAC-RF  If no collision occurs in then
all outputs of HMAC-RF are randomly drawn  PRF-advcollision prob. O(q2/2n)

R2 R1
HMAC-RF

R
Random Function

M

D

R1

distinguisher

R2

0 or 1

MAC-Security of HMAC-RF
 By an n-multi-collision analysis in A needs to guess an output of HMAC-RF from at least 2n/n output candidates
 MAC-adv O(q×n/2n)

R2 R1
HMAC-RF

VK
Vrification function

A
adversary

14
©2015 Mitsubishi Electric Corporation

Step 3: Combining Step 1 and Step 2

Step 3 PRF-Security of HMAC-Sponge

In SHA-3, 2n << 2r+c

 D: AdvPRHMFAC-Spong(eD)O((lq)2/2r+c + lqQ/2r+c + q2/2n) = O(q2/2n)

from Step 1

from Step 2

HMAC-Sponge is PRF-secure up to q = O(2n/2)

MAC-Security of HMAC-Sponge

In SHA-3, 2n << 2r+c

 D: AdvMHAMCAC-Spong(eD)O((lq)2/2r+c + lqQ/2r+c + nq/2n) = O(nq/2n)

from Step 1

from Step 2

HMAC-Sponge is MAC-secure up to q = O(2n/n)

15
©2015 Mitsubishi Electric Corporation

Conclusion

 HMAC-MD is PRF- and MAC-secure up to q = O(2n/2/l1/2)

 HMAC-Sponge is

 PRF-secure up to q = O(2n/2)

 MAC-secure up to q = O(2n/n)

 HMAC-SHA-2 vs. HMAC-SHA-3

PRF-Security

MAC-Security (Unforgeability)

Size n 224 256 384 512

HMAC-SHA-2 O(lq2/2n) min{2112, 2128/l1/2} 2128/l1/2 min{2192, 2128/l1/2} 2256/l1/2

HMAC-SHA-3 O(q2/2n) 2112 2128 2192 2256

Size n 224 256 384 512

HMAC-SHA-2 O(lq2/2n) min{2112, 2128/l1/2} 2128/l1/2 min{2192, 2128/l1/2} 2256/l1/2

HMAC-SHA-3 O(nq/2n) 2216.192... 2248 2375.415... 2503

Replacing SHA-2 with SHA-3 enhances generic security of HMAC!
16
©2015 Mitsubishi Electric Corporation

Thank You!
17
©2015 Mitsubishi Electric Corporation

Constrained PRFs for Unbounded Inputs
Hamza Abusalah, Georg Fuchsbauer, and Krzysztof Pietrzak
RSA Conference, 2016

Outline
1. Constrained Pseudorandom Functions (CPRFs) 2. Identity-Based Non-interactive Key Exchange 3. Unbounded-Input CPRFs

Pseudorandom Functions (PRFs)
[GGM86]

x

Fk(x) F

k

Pseudorandom Functions (PRFs)
[GGM86]

x Random y

x

Fk(x) F

k

Pseudorandom Functions (PRFs)
[GGM86]

x Random y

x

Fk(x) F

k

Unbounded-input PRFs [Goldreich04]: supports x  {0, 1}

Constrained Pseudorandom Functions (CPRFs)
[BW13],[KPTZ13],[BGI14]

k

S

Constr

kS

Constrained Pseudorandom Functions (CPRFs)
[BW13],[KPTZ13],[BGI14]

k

x

S

Constr

kS

F

Fk(x) if x  S



otherwise

Constrained Pseudorandom Functions (CPRFs)
[BW13],[KPTZ13],[BGI14]

k

x

S

Constr

kS

F

Fk(x) if x  S



otherwise

· Polynomial S: Any PRF F is a CPRF S = {x1, . . . , xp}, kS = {Fk(x1), . . . , Fk(xp)}

Constrained Pseudorandom Functions (CPRFs)
[BW13],[KPTZ13],[BGI14]

k

x

S

Constr

kS

F

Fk(x) if x  S



otherwise

· Polynomial S: Any PRF F is a CPRF S = {x1, . . . , xp}, kS = {Fk(x1), . . . , Fk(xp)}
· Superpolynomial S with short description?

Different Flavors of CPRFs
1. Puncturable [SW14]. S : x kS  Fk(x) if x = x

Different Flavors of CPRFs
1. Puncturable [SW14]. S : x kS  Fk(x) if x = x
2. Prefix-fixing [BW13]. S : v  {0, 1}m ?, e,g., v = 101??? kS  Fk(x) if x = 101 x

Different Flavors of CPRFs
1. Puncturable [SW14]. S : x kS  Fk(x) if x = x
2. Prefix-fixing [BW13]. S : v  {0, 1}m ?, e,g., v = 101??? kS  Fk(x) if x = 101 x
3. Bit-fixing [BW13]. S : v  {0, 1, ?}n, e.g., v = 1?010? kS  Fk(x) if x agrees with v on 0/1

Different Flavors of CPRFs
1. Puncturable [SW14]. S : x kS  Fk(x) if x = x
2. Prefix-fixing [BW13]. S : v  {0, 1}m ?, e,g., v = 101??? kS  Fk(x) if x = 101 x
3. Bit-fixing [BW13]. S : v  {0, 1, ?}n, e.g., v = 1?010? kS  Fk(x) if x agrees with v on 0/1
4. Circuit [BW13]. S : a circuit C kS  Fk(x) if C(x) = 1

Different Flavors of CPRFs
1. Puncturable [SW14]. S : x kS  Fk(x) if x = x
2. Prefix-fixing [BW13]. S : v  {0, 1}m ?, e,g., v = 101??? kS  Fk(x) if x = 101 x
3. Bit-fixing [BW13]. S : v  {0, 1, ?}n, e.g., v = 1?010? kS  Fk(x) if x agrees with v on 0/1
4. Circuit [BW13]. S : a circuit C kS  Fk(x) if C(x) = 1
5. This work:Turing Machine (TM). S : a TM M kS  Fk(x) if M (x) = 1
Accepts unbounded inputs x  {0, 1}

Identity-Based Non-interactive Key Exchange
a@mail b@mail c@mail
k
d@mail

Identity-Based Non-interactive Key Exchange

a@mail

a@mail

b@mail

ka
b@mail

kb

c@mail

c@mail

k

d@mail

kc
d@mail

kd

Identity-Based Non-interactive Key Exchange

a@mail

ka

a@mail

ka

kb

b@mail

b@mail

kb

c@mail

kc

c@mail

k

kc

d@mail

kd

d@mail

kd

Identity-Based Non-interactive Key Exchange

a@mail
ka

b@mail
kb

c@mail

kc

k

d@mail
kd

Identity-Based Non-interactive Key Exchange

ka ,kac

a@mail

b@mail
kb

c@mail

kc ,kac

k

d@mail
kd

Identity-Based Non-interactive Key Exchange

ka ,kac

a@mail

b@mail
kb

c@mail

kc ,kac

k

d@mail
kd

e@mail

ke

e@mail

ke

Identity-Based Non-interactive Key Exchange

ka ,kac

a@mail

b@mail
kb

c@mail

kc ,kac

k

d@mail
kd

e@mail
ke

Identity-Based Non-interactive Key Exchange

a@mail
ka ,kac ,kabe

kb ,kabe

b@mail

c@mail

kc ,kac

k

d@mail
kd

ke ,kabe

e@mail

Identity-Based Non-interactive Key Exchange

a@mail b@mail

Fk : {0, 1}  {0, 1}m

c@mail

d@mail

Identity-Based Non-interactive Key Exchange

a@mail b@mail

Fk : {0, 1}  {0, 1}m b@mail

c@mail

d@mail

Identity-Based Non-interactive Key Exchange

a@mail b@mail c@mail d@mail

Fk : {0, 1}  {0, 1}m
b@mail Mb@mail(x) =
1 if x = x b@mail x 0 otherwise

Identity-Based Non-interactive Key Exchange

a@mail

Fk : {0, 1}  {0, 1}m

b@mail

b@mail

c@mail d@mail

Mb@mail(x) =
1 if x = x b@mail x 0 otherwise

kMb@mail Constr

k

Identity-Based Non-interactive Key Exchange

a@mail
kMa@mail

b@mail
kMb@mail

c@mail

kMc@mail

k

d@mail
kMd@mail

e@mail
kMe@mail

Identity-Based Non-interactive Key Exchange

a@mail
kMa@mail
b@mail
kMb@mail
c@mail
kMc@mail
d@mail
kMd@mail
e@mail
kMe@mail

kabe := Fk(a@mail b@mail e@mail)
k

Identity-Based Non-interactive Key Exchange

a@mail
kMa@mail
b@mail
kMb@mail
c@mail
kMc@mail
d@mail
kMd@mail
e@mail
kMe@mail

kabe := Fk(a@mail b@mail e@mail)
k

Identity-Based Non-interactive Key Exchange

a@mail
kMa@mail
b@mail
kMb@mail
c@mail
kMc@mail
d@mail
kMd@mail
e@mail
kMe@mail

kabe := Fk(a@mail b@mail e@mail)
k

Identity-Based Non-interactive Key Exchange

a@mail
kMa@mail
b@mail
kMb@mail
c@mail
kMc@mail
d@mail
kMd@mail
e@mail
kMe@mail

kabe := Fk(a@mail b@mail e@mail)
k

TM CPRFs
1) A warm-up: a simple circuit CPRF assuming · Puncturable PRFs · Indistinguishability obfuscation

TM CPRFs
1) A warm-up: a simple circuit CPRF assuming · Puncturable PRFs · Indistinguishability obfuscation
2) A TM CPRF assuming · Punctured PRFs · Public coin differing input obfuscation · Succinct non-interactive arguments of knowledge
(SNARKs) · Collision resistant hashing

Program Obfuscation
[BGI+01]
Virtual Black Box
[BGI+01]
Differing Input
[BGI+01],[BCP14]
Public Coin Differing Input
[ISP15]
Indistinguishability
[BGI+01], [GGH+13]

Program Obfuscation
[BGI+01]

Virtual Black Box
[BGI+01]

Impossible
[BGI+01]

Differing Input
[BGI+01],[BCP14]

Implausible TM-impossible
[GGH+14] [BSW16]

Public Coin Differing Input
[ISP15]

Indistinguishability
[BGI+01], [GGH+13]

Program Obfuscation (1)
1) Functionality:

P

O

P~  P

x, P~(x) = P (x)

Program Obfuscation (1)
1) Functionality:

P

O

P~  P

x, P~(x) = P (x)

2) Indistinguishability obfuscation:

P0, P1

b?

P0  P1

|P0| = |P1|

Program Obfuscation (1)
1) Functionality:

P

O

P~  P

x, P~(x) = P (x)

2) Indistinguishability obfuscation: hard to guess b

P0, P1

b?

P0  P1

Pb

|P0| = |P1| b  {0, 1} P~b

P~b

O

Program Obfuscation (2)
1) Functionality:

P

O

2) Differing input obfuscation:

P~  P x, P~(x) = P (x)

r

Sampler P0, P1

|P0| = |P1|

Pb

b  {0, 1} P~b

O

Program Obfuscation (2)
1) Functionality:

P

O

P~  P

x, P~(x) = P (x)

2) Differing input obfuscation: hard to guess b if it's hard to find x, s.t. P0(x) = P1(x)

r

Sampler P0, P1

|P0| = |P1|

Pb

b?

P0, P1, P~b

b  {0, 1} P~b

O

Program Obfuscation (3)
1) Functionality:

P

O

P~  P

x, P~(x) = P (x)

2) Public coin differing input obfuscation: hard to guess b if it's hard to find x, s.t. P0(x) = P1(x)

r

Sampler P0, P1

|P0| = |P1|

Pb

b?

P0, P1, P~b

b  {0, 1} P~b

O

A Circuit CPRF
· PFk : {0, 1}n  {0, 1}m a puncturable PRF · iO an indistinguishibility obfuscator

A Circuit CPRF
· PFk : {0, 1}n  {0, 1}m a puncturable PRF · iO an indistinguishibility obfuscator Define a circuit CPRF F as:
Fk(x) := PFk(x)

A Circuit CPRF
· PFk : {0, 1}n  {0, 1}m a puncturable PRF · iO an indistinguishibility obfuscator Define a circuit CPRF F as:
Fk(x) := PFk(x) Constr(k, C)  kC :

Pk,C (x) :=

PFk(x) if C(x) = 1



otherwise

A Circuit CPRF
· PFk : {0, 1}n  {0, 1}m a puncturable PRF · iO an indistinguishibility obfuscator Define a circuit CPRF F as:
Fk(x) := PFk(x) Constr(k, C)  kC :

kC  iO Pk,C (x) :=

PFk(x) if C(x) = 1



otherwise

A Circuit CPRF
· PFk : {0, 1}n  {0, 1}m a puncturable PRF · iO an indistinguishibility obfuscator Define a circuit CPRF F as:
Fk(x) := PFk(x) Constr(k, C)  kC :

kC  iO Pk,C (x) :=

PFk(x) if C(x) = 1



otherwise

Thm 1. F is a secure circuit CPRF.

Towards a TM CPRF (1)

Constrained keys kC :



 PFk(x)



iO Pk,C (x) :=



if C(x) = 1 
Input Consistency  otherwise

Towards a TM CPRF (1)

Constrained keys kM :



 PFk(x)



iO Pk,M (x) :=



if M (x) = 1 
Input Consistency  otherwise

Towards a TM CPRF (1)

Constrained keys kM :



 PFk(x)



iO Pk,M (x) :=



if M (x) = 1 
Input Consistency  otherwise

iO for Turing machines [KLW15]

Towards a TM CPRF (1)

Constrained keys kM :



 PFk(x)



iO Pk,M (x) :=



if M (x) = 1 
Input Consistency  otherwise

iO for Turing machines [KLW15]

Security Proof: iO(Pk,M ) c iO(Pkx ,M ) where kx evalaues PF on all x = x

Towards a TM CPRF (1)

Constrained keys kM :



 PFk(x)



iO Pk,M (x) :=



if M (x) = 1 
Input Consistency  otherwise

iO for Turing machines [KLW15]

Security Proof: iO(Pk,M ) c iO(Pkx ,M ) where kx evalaues PF on all x = x
1) Pk,M  Pkx ,M

Towards a TM CPRF (1)

Constrained keys kM :



 PFk(x)



iO Pk,M (x) :=



if M (x) = 1 
Input Consistency  otherwise

iO for Turing machines [KLW15]

Security Proof: iO(Pk,M ) c iO(Pkx ,M ) where kx evalaues PF on all x = x
1) Pk,M  Pkx ,M 2) |Pk,M | =? |Pkx ,M |: For x  {0, 1}, kx unbounded

Towards a TM CPRF (2)
Let H: {0, 1}  {0, 1}n be a hash function.

 PFk(x)  Pk,M (x) := 

if M (x) = 1
Input Consistency
otherwise

Towards a TM CPRF (2)
Let H: {0, 1}  {0, 1}n be a hash function.

 PFk(H(x))  Pk,M (x) := 

if M (x) = 1
Input Consistency
otherwise

Towards a TM CPRF (2)
Let H: {0, 1}  {0, 1}n be a hash function.

 PFk(H(x))  Pk,M (x) := 

if M (x) = 1
Input Consistency
otherwise

1)|PkH(x

|
)

bounded:

kH(x )

is bounded even for x

 {0, 1}

Towards a TM CPRF (2)
Let H: {0, 1}  {0, 1}n be a hash function.

 PFk(H(x))  Pk,M (x) := 

if M (x) = 1
Input Consistency
otherwise

1)|PkH(x

|
)

bounded:

kH(x )

is bounded even for x

 {0, 1}

2) Pk,M  PkH(x ),M

Towards a TM CPRF (2)
Let H: {0, 1}  {0, 1}n be a hash function.

 PFk(H(x))  Pk,M (x) := 

if M (x) = 1
Input Consistency
otherwise

1)|PkH(x

|
)

bounded:

kH(x )

is bounded even for x

 {0, 1}

2) Pk,M  PkH(x ),M

Differing inputs: x = x s.t. H(x) = H(x ) := h

Pk,M (x, ) = PFk(h ) = Pkh ,M (x) = 

Towards a TM CPRF (2)
Let H: {0, 1}  {0, 1}n be a hash function.

 PFk(H(x))  Pk,M (x) := 

if M (x) = 1
Input Consistency
otherwise

1)|PkH(x

|
)

bounded:

kH(x )

is bounded even for x

 {0, 1}

2) Pk,M  PkH(x ),M

Differing inputs: x = x s.t. H(x) = H(x ) := h

Pk,M (x, ) = PFk(h ) = Pkh ,M (x) = 

Security proof: Public-coin diO for Turing machines [ISP15]

Instead of:

Towards a TM CPRF (3)



 PFk(H(x))



kM  diO Pk,M (x) :=



if M (x) = 1 
Input Consistency  otherwise

Instead of:

Towards a TM CPRF (3)



 PFk(H(x))



kM  diO Pk,M (x) :=



if M (x) = 1 
Input Consistency  otherwise

Pk(h, ) :=

PFk(h) if  proves h = H(x)  M (x) = 1



otherwise

Instead of:

Towards a TM CPRF (3)



 PFk(H(x))



kM  diO Pk,M (x) :=



if M (x) = 1 
Input Consistency  otherwise

Pk(h, ) :=

PFk(h) if  proves h = H(x)  M (x) = 1



otherwise

If  is a Succinct Non-interactive Argument of Knowledge (SNARK):
Security proof: Public-coin diO for circuits [ISP15]

A TM CPRF
· PFk : {0, 1}n  {0, 1}m a puncturable PRF · H : {0, 1}  {0, 1}n a collision resistant hash · SNARKs · A public-coin diO for circuits

A TM CPRF
· PFk : {0, 1}n  {0, 1}m a puncturable PRF · H : {0, 1}  {0, 1}n a collision resistant hash · SNARKs · A public-coin diO for circuits
Define a TM CPRF F as:
Fk(x) := PFk(H(x))

A TM CPRF
· PFk : {0, 1}n  {0, 1}m a puncturable PRF · H : {0, 1}  {0, 1}n a collision resistant hash · SNARKs · A public-coin diO for circuits
Define a TM CPRF F as:

Fk(x) := PFk(H(x)) Constr(k, M )  kM :

P (h, ) :=

PFk(h) if  SNARK: H(x) = h  M (x) = 1



otherwise

A TM CPRF
· PFk : {0, 1}n  {0, 1}m a puncturable PRF · H : {0, 1}  {0, 1}n a collision resistant hash · SNARKs · A public-coin diO for circuits
Define a TM CPRF F as:

Fk(x) := PFk(H(x)) Constr(k, M )  kM :

P (h, ) :=

PFk(h) if  SNARK: H(x) = h  M (x) = 1



otherwise

kM = P~  diO(P )

