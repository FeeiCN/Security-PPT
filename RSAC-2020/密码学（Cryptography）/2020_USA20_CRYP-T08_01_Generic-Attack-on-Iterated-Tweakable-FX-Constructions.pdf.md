SESSION ID: CRYP-T08
Generic Attack on Iterated Tweakable FX Constructions

Ferdinand Sibleyras Ph.D. Student Inria, Paris, France
1

#RSAC

Introduc on
Permuta on
A bijec ve pseudorandom func on. P : {0, 1}n  {0, 1}n Example: Keccak-f
Block Cipher
A family of permuta ons indexed by a (secret) key. E : {0, 1} × {0, 1}n  {0, 1}n Example: AES, DES
2

#RSAC

x

P P(x)

k

m

E Ek(m)

#RSAC
Introduc on

Permuta on
A bijec ve pseudorandom func on. P : {0, 1}n  {0, 1}n Example: Keccak-f

x

P P(x)

Block Cipher
A family of permuta ons indexed by a (secret) key. E : {0, 1} × {0, 1}n  {0, 1}n Example: AES, DES

k

m

E Ek(m)

Tweakable Block Cipher

k

A family of permuta ons indexed by a key and a (public) tweak. ~E : {0, 1} × {0, 1} × {0, 1}n  {0, 1}n
Example: Deoxys, Skinny

t m

~E

~Ek(t, m)

2

#RSAC
Introduc on
All those primi ves are used for Authen cated Encryp on.
· Permuta on: Sponge based modes (Monkey duplex, Beetle, ...) · Block Cipher: Most common (GCM, CCM, ...) · Tweakable Block Cipher: Needed for analysis of OCB, XTS, PMAC, ...
3

#RSAC
Introduc on
All those primi ves are used for Authen cated Encryp on.
· Permuta on: Sponge based modes (Monkey duplex, Beetle, ...) · Block Cipher: Most common (GCM, CCM, ...) · Tweakable Block Cipher: Needed for analysis of OCB, XTS, PMAC, ...
2-Step Proofs
First prove a mode is secure using a Tweakable Block Cipher. Then build a Tweakable Block Cipher from an exis ng Block Cipher.
3

Introduc on

x

P P(x)

k

m

E Ek(m)

#RSAC

k

t m

~E ~Ek(t, m)

4

Introduc on

x

P P(x)

k

m

E Ek(m)

#RSAC

Fix tweak t k

t m

~E ~Ek(t, m)

4

Introduc on

#RSAC
k

x

P P(x)

Fix key k

Fix tweak t k

t m

~E ~Ek(t, m)

m

E Ek(m)

4

#RSAC
Introduc on

Even-Mansour

k

x

P P(x)

Fix key k

Fix tweak t k

t m

~E ~Ek(t, m)

m

E Ek(m)

4

#RSAC
Introduc on

Even-Mansour

k

x

P P(x)

Fix key k

m

E Ek(m)

Fix tweak t k

LRW1, LRW2, ~F[1], ~F[2], XHX, XHX2,...

t m

~E ~Ek(t, m)

4

#RSAC
LRW2[Liskov, Rivest, Wagner, 2011]
It uses:
· 1 n-bit AXU func on 0(k, t). · 2 secret values k, k.
0(k, t) k

m

E

Secure Tweakable Block Cipher up to 2n/2 calls. 5

~Ek(t, m)

XEX[Rogaway, 2004]

#RSAC

t × k

t × k

k

m

E

~Ek(t, m)

Uses Galois field mul plica on t × k for a secret value k. Preserves CCA security.
Secure Tweakable Block Cipher up to 2n/2 calls.

6

XE[Rogaway, 2004]

#RSAC

t × k k

m

E

~Ek(t, m)

Uses Galois field mul plica on t × k for a secret value k. Preserves CPA security.
Secure Tweakable Block Cipher up to 2n/2 calls.

7

2-step proof for PMAC

m1

m2

m-1

2 × k Ek

22 × k Ek

2-1 × k

···

Ek

0

...

Secret Value k = Ek(0) . PMAC uses XE as a tweakable block cipher.
8

m pad

#RSAC

1 × k Ek
MAC

2-step proof for PMAC

m1

m2

m-1

2 × k

22 × k

2-1 × k

Ek ~E(2, k)
0

Ek ~E(22, k)

···

Ek

~E(2-1, k)

...

Secret Value k = Ek(0) . PMAC uses XE as a tweakable block cipher.
8

m pad

#RSAC

1 × k
Ek ~E(1, k)
MAC

#RSAC
XHX[Jha, List, Minematsu, Mishra, Nandi]
It uses:
· 1 n-bit subkey 0(k, t). · 1 -bit subkey 1(k, t).

0(k, t)

1(k, t)

m

E

~Ek(t, m)

Typically 0 and 1 can use field mul plica on with a secret derived with k.

Allowing

rekeying

improves

the

security

up

to

2

n+ 2

.

9

XHX2[Lee, Lee]
It uses:
· 2 n-bit subkeys 0(k, t), 1(k, t). · 2 -bit subkeys 1(k, t), 2(k, t).

0(k, t)

1(k, t)

1(k, t)

2(k, t)

m

E

E

Cascade of two independant XHX.

Cascading

improves

the

security

up

to

2

2 3

(n+).

10

#RSAC
~Ek(t, m)

#RSAC
2-Round Tweakable FX
It uses:
· 3 n-bit subkeys 0(k, t), 1(k, t), 2(k, t). · 2 -bit subkeys 1(k, t), 2(k, t).

0(k, t)

1(k, t)

1(k, t)

2(k, t)

2(k, t)

m

E1

E2

~Ek(t, m)

Generaliza on
We don't assume anything on subkey func ons. = A ack works for any 2-round schemes !
11

#RSAC
Informa on Theore c Se ng
Proofs say an a acker needs at least this much data. Proofs can get be er, it is a lower bound. Informa on Theore c cryptanalysis shows an upper bound on the provable security. A proof is ght when cryptanalysis matches. Computa ons are irrelevant.
12

#RSAC
Informa on Theore c Se ng
Proofs say an a acker needs at least this much data. Proofs can get be er, it is a lower bound. Informa on Theore c cryptanalysis shows an upper bound on the provable security. A proof is ght when cryptanalysis matches. Computa ons are irrelevant.
Informa on Theore c Key Recovery
It's all about the query complexity. We count calls to tweakable block cipher ~Ek(·, ·) and block ciphers E1(·, ·), E2(·, ·). Computa on of subkey func ons are not counted. GOAL: Recover the master key k.
12

#RSAC
Our Result
How far can we hope to go by cascading and rekeying? Is the proof for XHX2 ght?
13

#RSAC
Our Result

How far can we hope to go by cascading and rekeying? Is the proof for XHX2 ght?

This work

Informa on theore c cryptanalysis.

Query

complexity

of

O(2

r r+1

(n+)

).

Show that XHX and XHX2 proofs are ght.

13

#RSAC
Our Strategy
We follow the same strategy as [Gazi, 2013] to improve and apply it in the tweakable block cipher se ng.
Strategy
Build a contradictory path for each wrong key guesses un l one is le .
14

#RSAC
Contradictory Path
1. Query c = ~Ek(t, m) for some (t, m). 2. Make a guess k of the master key k. 3. Compute c = ~Ek(t, m). 4. If c = c then Contradictory Path then k = k.

t m 0(k, t)
m

~Ek
1(k, t) E1

~Ek(t, m) 1(k, t)

2(k, t) E2

2(k, t) ~Ek(t, m)

15

#RSAC
Coun ng queries
· No issue with guessing all the keys in informa on theore c se ng. · However we can't make a block cipher query for each guess, it's too much ! · We need to store and reuse previous queries as much as we can.
Tweakable Block Cipher
As we can have security  2n we also can have online queries  2n !
16

#RSAC
Nota ons · n and  the block ciphers state and key size respec vely. · 0 the number of online queries to ~Ek(t, m). ·  the number of offline queries to E(k, m)..
Total Asympto c Query Complexity is O(0 + ).
17

#RSAC
Nota ons
· n and  the block ciphers state and key size respec vely. · 0 the number of online queries to ~Ek(t, m). ·  the number of offline queries to E(k, m)..
Total Asympto c Query Complexity is O(0 + ).
Non-Adapta ve Known Plaintext A ack
Observed 0 tweak/plaintext/ciphertext triples. Compute random /2 input/output of block ciphers under each -bit subkey.
17

Random Path Reconstru on for 2 Rounds

#RSAC

0(k, t)

1(k, t)

1(k, t)

2(k, t)

2(k, t)

t, m

x  E1(x)

y  E2(y)

~Ek(t, m)

SIZE: 0

/2

/2

0

18

Random Path Reconstru on for 2 Rounds

#RSAC

0(k, t)

1(k, t)

1(k, t)

2(k, t)

2(k, t)

t, m

x  E1(x)

y  E2(y)

~Ek(t, m)

SIZE: 0

/2

/2

0

18

Random Path Reconstru on for 2 Rounds

#RSAC

0(k, t)

1(k, t)

1(k, t)

2(k, t)

2(k, t)

t, m

x  E1(x)

y  E2(y)

~Ek(t, m)

SIZE: 0

/2

/2

0

18

Random Path Reconstru on for 2 Rounds

#RSAC

0(k, t)

1(k, t)

1(k, t)

2(k, t)

2(k, t)

t, m

x  E1(x)

y  E2(y)

~Ek(t, m)

SIZE: 0

/2

/2

0

#PATH:

0

18

Random Path Reconstru on for 2 Rounds

#RSAC

0(k, t)

1(k, t)

1(k, t)

2(k, t)

2(k, t)

t, m

x  E1(x)

y  E2(y)

~Ek(t, m)

SIZE: 0

/2

/2

0

#PATH:

0

0/2+n

18

Random Path Reconstru on for 2 Rounds

#RSAC

0(k, t)

1(k, t)

1(k, t)

2(k, t)

2(k, t)

t, m

x  E1(x)

y  E2(y)

~Ek(t, m)

SIZE: 0 #PATH:

/2

/2

0

0

0/2+n

02/22+2n

18

Random Path Reconstru on for 2 Rounds

#RSAC

0(k, t)

1(k, t)

1(k, t)

2(k, t)

2(k, t)

t, m

x  E1(x)

y  E2(y)

~Ek(t, m)

SIZE: 0 #PATH:

/2

/2

0

0

0/2+n

02/22+2n k = k ?

18

#RSAC
Query Complexity
The number of path we can reconstruct is 02/22+2n on average for all guesses k. We put 0 =  to minimize 0 + .

02/22+2n = 1

3/22+2n = 1

3 = 22+2n



=

2

2 3

(+n)

=

0

19

#RSAC
Query Complexity
The number of path we can reconstruct is 02/22+2n on average for all guesses k. We put 0 =  to minimize 0 + .

02/22+2n = 1

3/22+2n = 1

3 = 22+2n



=

2

2 3

(+n)

=

0

Result

The query complexity of the a

ack

is

O(2

2 3

(+n)).

19

#RSAC
Parameter Constraint

There is no issue with having 0 > 2n as the tweak can be of arbitrary size. However we need /2  1 for our previous reasoning to hold.

/2  1

2

2 3

(+n)

/2



1

2 3



+

2 3

n

-





0

- + 2n  0

  2n

20

#RSAC
Parameter Constraint

There is no issue with having 0 > 2n as the tweak can be of arbitrary size. However we need /2  1 for our previous reasoning to hold.

/2  1

2

2 3

(+n)

/2



1

2 3



+

2 3

n

-





0

- + 2n  0

  2n

Constraint
Cryptanalysis works when the block cipher key size is less or equal to twice the state size.
20

#RSAC
Generaliza on for r rounds

The a ack works for any number r of rounds.

Result

The query complexity of the a

ack

is

O(2

r r+1

(+n)).

Constraint
Cryptanalysis works when   rn.

21

#RSAC
Technical Details
Need to ensure that the right key k is detected while all the wrong guesses be dismissed. Possible false posi ve when the master key k is large !
22

#RSAC
Technical Details

Need to ensure that the right key k is detected while all the wrong guesses be dismissed. Possible false posi ve when the master key k is large ! Let k be a ~-bit value then:

Affined query complexity

The asympto

c

query

complexity

is

O(2

r r+1

(n+)

·

 r+1 ~/n).

It is s

ll

O(2

r r+1

(n+))

whenever

~

is

a

mul

ple of n.

Each tweak must give different subkey values for this key recovery to work but if not, then, we have a dis nguisher.

22

Results

Ref

Scheme r Proof Known A ack Our Generic A ack

[LisRivWag11] LRW2 [Mennink15] ~F[1] [Mennink16] XPX [JLMMN17] XHX [JLMMN17] GXHX

1 2n/2

2n/2

1

2

2 3

n

2n

1 2n/2

2n/2

1

2

1 2

(n+)

2

1 2

(n+)

1

2

1 2

(n+)

none

2

1 2

(n+)

2n (as  = n)

2n/2 (as  = 0)

2

1 2

(n+)

2

1 2

(n+)

[Mennink15] ~F[2]

1 2n

2n

N.A.

[LisRivWag11] LRW1 [LanShrTer12] CLRW2 [LeeLee18] XHX2

2 2n/2

2n/2

2 23n/4

23n/4

2

2

2 3

(n+)

none

2

2 3

(n+)

2

2 3

(n+)

2

2 3

(n+)

23

#RSAC

#RSAC
Take-Aways

· Cryptanalysis of the generalized tweakable FX construc on for r  1 rounds in

O(2

r r+1

(n+))

query

complexity

under

standard

assump

ons.

· Shows ghtness of proofs of GXHX and XHX2 which in turn show it is informa on

theore cally op mal for r = 1, 2 rounds.

· Gives a security upper-bound for this strategy with r  3 rounds.

24

#RSAC
Take-Aways

· Cryptanalysis of the generalized tweakable FX construc on for r  1 rounds in

O(2

r r+1

(n+))

query

complexity

under

standard

assump

ons.

· Shows ghtness of proofs of GXHX and XHX2 which in turn show it is informa on

theore cally op mal for r = 1, 2 rounds.

· Gives a security upper-bound for this strategy with r  3 rounds.

Open Ques ons:
· How simple can the subkey func ons be while maintaining security? · Can we prove security for r  3 rounds? · What concrete applica on for those improved schemes?

24

