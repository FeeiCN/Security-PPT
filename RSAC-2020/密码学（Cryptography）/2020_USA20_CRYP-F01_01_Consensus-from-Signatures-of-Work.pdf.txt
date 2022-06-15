SESSION ID: CRYP-F01
Traceable Inner Product Func<onal Encryp<on

Xuan Thanh Do 1,2, Duong Hieu Phan 2, David Pointcheval 3
1 Vietnam Na1onal University, Vietnam 2 XLIM, University of Limoges, France 3 Ecole normale supérieure / PSL, Paris, France

#RSAC

Func<onal Encryp<on
[SW05,BSW11]

#RSAC

f skf

Exemples of function f · Average value
· Statistical value

Decrypt skf ,

= f

2

#RSAC
Func<onal Encryp<on in Mul<-user seNng

Decrypt skf ,

= f
3

Problem with the same key: Untraceable Pirate Decoder
Personal functional key
Remark:
When f(x) = x
Classical Traitor Tracing

#RSAC
Traceable Func<onal Encryp<on
Traceability: From a pirate decoder for a func1on f, find out a traitor.
4

#RSAC
Traceable IPFE
Functional encryption for general circuit: based on iO Efficient Construction for inner product functions (IPFE) [ABCP15] ­ For a vector x  = (x1, ..., xk), user is given a key skx ­ For a vector y  = (y1, ..., yk):
Decrypt(skx, Encrypt( y )) = < x , y  > = ki=1xiyi
This work: Efficient construction for Traceable IPFE Tools: Combining ElGamal-based IPFE and Traitor Tracing
5

ElGamal Encryp<on
y= g 
g

#RSAC

Setup: G = < g > of order q
Secret key:

Public key:

  q

g, y = g

Ciphertext:

Decryption:

(gr, yrm), where r  q

Compute (gr) = yr and recover m

6

#RSAC
Elgamal Encryp<on -> Mul<-user (Boneh-Franklin '01)
y= g



g

Public key: (y, h1, ..., hk)  Gk+1 User key: a representation (1, ..., k) of y in the basis (h1, ..., hk):

Ciphertext:

y = h11...hkk (yrm, h1r, ..., hkr), where r  q

Decryption: Each user can compute yr from (h1r, ..., hkr) and recover m

7

#RSAC
Elgamal Encryp<on -> IPFE [ABCP '15]

Master secret Public key:

key

MSK = s pk =



= (s1, (h1 =

..., gs1,

User key for vector x  = (x1, ..., xk):

sk) ..., skx

hk =

= <

gsk) s, x

 Gk >=

ki=1sixi

Enc(pk, y  = (y1, ..., yk)) = (gr, h1rg1y, ..., hkrgky), where r  q

Decryption: remove « ElGamal 's mask » (gr)<s, x > = ki=1((gir)si)xi = ki=1(hir)xi, thus:

(h1rgy1)x1 × ... × (hkrgky)xk (gr)skx

=

(h1r)x1 × ... × (hkr)xk (g r)(s1x1+...+sk xk)

× g< x , y >

=

g< x , y >

Problem: one key for each function!
Idea: randomized keys for computing (gr)<s, x >
8

#RSAC
Our technique: Adding BF tracing to IPFE
g<s, x >

b1

b2

b3

b3 bk

Public key:
User  is

pk = (b1
associated

= gt1, ..., bk = gtk,
to a public codeword

h1 

=


for vector x  = (x1, ..., xk), user's secret key

gs1, ..., hk = gsk) = (1, ..., k) : tk x ,  = s, x  /

 t

G2k ,   .

(tk x , i)ki=1 is a representation of g<s, x > in the basis (b1, ..., bk)

Enc(pk, y
Decryption:



= (y1, ..., yk)) remove gr<s, x

= (b1r,
> from

..., bkr, b1r, ...,

bhk1rrgw1yi,th...(t,khxkrg, ky),i)wki=h1ere

r



q

9

#RSAC
The use of pairings

When the secret keys are scalars:

from tk x 1 ,1 =
one can compute

s, x 1  t,   1
tk x 2 ,2

tk = and
tk

x

x 2 ,1 2 ,1  tk x

s, x 2 
t,   1
1 ,2

= tk x 1 ,1

and

tk x 1 ,2 =

s, x 1  t,   2

.

Corrupting 2k keys then break the master secret key

Solution: ­ put t x ,  in the exponent sk x ,  = gtk x , 
­ decryption will then be performed in the target group of the pairing.

10

#RSAC
Security
Confidentiality: selective security under the BDDH assumption
Tracing: Black-box confirmation from the linear tracing technique
 = {tk1, ..., tkt}, t  k, for a fixed vector x  = (x1, ..., xk):
i = {(H1aGy1, ..., HkaGyk, g1z1, ..., g1zk) a  q, z  kq, z, tkj  j  = as, x  , j  [i]}
i) Without the key tki: i and i-1 are indistinguishable ii) 0 is indistinguishable from Random iii) t is indistinguishable from Normal ciphertexts that the Pirate can decrypt There exists i: gap in probability of decrypting i and i-1  i is a traitor.
11

#RSAC
Conclusion
Open technical problems:
­ Stronger security (with more general security, adaptive security, unbounded collusion)
­ More general functions (e.g., quadratic function).
Perspectives:
­ Decentralized setting: Multi-client setting for traceable IPFE ­ Integrating revocation.
12

