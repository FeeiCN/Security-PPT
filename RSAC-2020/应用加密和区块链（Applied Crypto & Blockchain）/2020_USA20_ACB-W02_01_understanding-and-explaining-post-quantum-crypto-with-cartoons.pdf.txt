SESSION ID: ACB-W02
Understanding and Explaining PostQuantum Crypto with Cartoons

Klaus Schmeh
Consultant cryptovision @cryptovision

#RSAC

Please welcome ...

A quantum computer!

Hello!

Quantum computer
Based on quantum mechanics

Schrödinger`s cat

Quantum bit

Dead and alive at the same time

0 and 1 at the same time

What are you good at?

Extremely many computations in parallel, if there is only one result
Examples: · Find element in large set · Find optimal solution

What are you not good at?

Sorting.
Because sorting has more than one result.

What are you especially good at?

Prime factorization!

Prime multiplication 1723 = ? simple

Prime factorization 377 = ?? difficult

Prime multiplication is a one-way- function

RSA is based on prime multiplication

1723 = 391

Alice`s private key

Alice`s public key

In practice, prime numbers have ~2048 bits

I can break RSA within seconds.
Up to a key length of 5 bit.
Future versions will be more powerful.

Thank you for coming!

Klaus Schmeh, Chief Editor Marketing at
cryptovision.

My books

A quantum computer can break RSA and other crypto
systems!
We need to look at alternatives!

Six families of crypto algorithms are considered quantum-proof.

lattice-based code-based hash-based

non-commutative multivariate isogeny-based

None of these is in wide-spread use.

We are going to look at three of them in detail.

Please welcome ...

Mr. Snail!

Can you explain latticebased crypto to us?

I even can explain lettucebased crypto.
Lattice-based

Lettuce field: known as lattice in mathematics.

Lettuce field

Lettuces (lattice points)

Base vectors
b a
,,Good" Base (almost vertical)

c d
Base vectors ,,Bad" base
(almost parallel)

The snail-lettuce problem

c d
b a

Which lettuce is closest?
Easy to answer in the twodimensional case
But what if the room has 250-dimensions?
Easy to answer, if good base is known
Difficult to answer, if only bad base is known

This is a one-way function

Placing snail in a lettuce field is easy

c

d

Finding next lettuce is

difficult (with bad base)

Lattice-based encryption

Goldreich-Goldwasser-Halevi encryption (GGH)
Bob

c
d
Alice`s public key bad base

message
b a

Attacker can`t decrypt, because he knows only bad base

Alice`s private key good base
Alice can decrypt, because she knows
good base

Is GGH quantum-proof?
Yes.

Is GGH secure?

No, it`s broken.
But there are other latticebased methods.

E.g., Learning with Errors (LWE) methods.
At first sight, LWE has nothing to do with
lattices ...

Here`s an equation system.

294·x + 629·y + 321·z = 38 701·x + 29·y + 91·z = 462 613·x + 339·y + 201·z = 636

This also works with modular arithmetics.

294·x + 629·y + 321·z = 38 701·x + 29·y + 91·z = 462 613·x + 339·y + 201·z = 636

(mod 797) (mod 797) (mod 797)

Now there are more equations than variables (overdefined).
We only look at systems where a solution exists.

294·x + 629·y + 321·z = 38 701·x + 29·y + 91·z = 462 613·x + 339·y + 201·z = 636 256·x + 94·y + 115·z = 522 704·x + 629·y + 322·z = 477 391·x + 23·y + 743·z = 213 290·x + 620·y + 201·z = 40 211·x + 339·y + 381·z = 510

(mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797)

Solution: x=3, y=7, z=6!

294·x + 629·y + 321·z = 38 701·x + 29·y + 91·z = 462 613·x + 339·y + 201·z = 636 256·x + 94·y + 115·z = 522 704·x + 629·y + 322·z = 477 391·x + 23·y + 743·z = 213 290·x + 620·y + 201·z = 40 211·x + 339·y + 381·z = 510

(mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797)

Next, we add errors
on right side!
Errors are small.

Error 294·x + 629·y + 321·z = 38 +1 701·x + 29·y + 91·z = 462 -2 613·x + 339·y + 201·z = 636 256·x + 94·y + 115·z = 522 +1 704·x + 629·y + 322·z = 477 391·x + 23·y + 743·z = 213 -1 290·x + 620·y + 201·z = 40 +2 211·x + 339·y + 381·z = 510 +1

(mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797)

Next, we hide the errors.

Error 294·x + 629·y + 321·z = 398 +1 701·x + 29·y + 91·z = 446620 -2 613·x + 339·y + 201·z = 636 256·x + 94·y + 115·z = 5223 +1 704·x + 629·y + 322·z = 477 391·x + 23·y + 743·z = 2132 -1 290·x + 620·y + 201·z = 420 +2 211·x + 339·y + 381·z = 5101 +1

(mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797)

Can errors be found without knowing x,
y, and z?

Learning with Errors (LWE) Problem

294·x + 629·y + 321·z = 398 +1 701·x + 29·y + 91·z = 446620 -2 613·x + 339·y + 201·z = 636 256·x + 94·y + 115·z = 5223 +1 704·x + 629·y + 322·z = 477 391·x + 23·y + 743·z = 2132 -1 290·x + 620·y + 201·z = 420 +2 211·x + 339·y + 381·z = 5101 +1

(mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797) (mod 797)

Yes, but it`s laborious!

This leads us to a one-way function!

,,Learning with Errors" one-way function

Adding errors is easy

Finding errors is difficult

This can be used for asymmetric encryption!

Regev encryption
Bob

Alice`s private key: x=3, y=7, z=6

Alice`s public key: 294·x + 629·y + 321·z = 39

(mod 797)

701·x + 29·y + 91·z = 460

(mod 797)

613·x + 339·y + 201·z = 636

(mod 797)

256·x + 94·y + 115·z = 523

(mod 797)

704·x + 629·y + 322·z = 477

(mod 797)

391·x + 23·y + 743·z = 212

(mod 797)

290·x + 620·y + 201·z = 42

(mod 797)

211·x + 339·y + 381·z = 511

(mod 797)

Alice`s private key: x=3, y=7, z=6

Alice`s public key: 294·x + 629·y + 321·z = 39

(mod 797)

7+01·x + 2+9·y + +91·z = 4+60

(mod 797)

613·x + 339·y + 201·z = 636

(mod 797)

256·x + 94·y + 115·z = 523

(mod 797)

Bob

7+04·x + 62+9·y + 3+22·z = 4+77

(mod 797)

391·x + 23·y + 743·z = 212

(mod 797)

290·x + 620·y + 201·z = 42 2=11·x + 33=9·y + 3=81·z = 5=11 400·x + 791·y + 723·z = 717

(mod 797) (mod 797) (mod 797)

How Bob encrypts 1 Bit

Encrypt 0: add 1 (small error) to the result
400B·xo+b791·y + 723·z = 718 (mod 797)

Encrypt 1: add 399 (big error) to the result
400·x + 791·y + 723·z = 319 (mod 797)

Alice

Knows x,y,z (private key) Checks whether error is big or small

Attacker needs to invert Learning
400·x w+i7th9E1r·ryors+o7n2e3-w·zay=f7un1c7tion

(mod 797)

Nice algorithm, but it encrypts only one bit.

There are more effective LWE variants.

What has Regev got to do with lettices?

I`ll show you.

Equation system corresponds with
lettuce field
Every column
is a vector

message=0 message=1
Encryption 0: close to the lettuce 1: not close to the lettuce
Decryption Alice knows x, y, z  she knows closest lettuce  she knows whether 0 or 1
Attacker needs to solve snail-lettuce problem

Are there other latticebased methods?

Yes, NTRU, Peikert, New Hope, ...

Thanks, Mr. Snail!

Our next guest is a rocket scientist.

Hello!

Code-based

Please explain code-based cryptography to us.

Yes, this isn`t rocket science.
Code-based
I need to start with error-correcting codes.

0101001010101001101010101
How can we avoid this?
Parity bits
01010011 00101000 11000101

0101001010101001101010101
How can we avoid this?
Three-times code
01010010 01010010 01010010

0101001010101001101010101

Parity bits
00101000 Error-detecting code

Three-times code
01010010 01010010 01010010 Error-correcting code

We need better error-correcting codes than this one.

Linear errorcorrecting codes

10101 ·
5 bit

1 0 1 0 1 1 0 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 1 0 1 0 1 1 0 1
5×9 matrix

= 1111010111
9 bit

Linear errorcorrecting codes

1 0 1 0 1
5 bit

Matrix multiplication

11110101 1
9 bit

1 0 1 0
4 bit

Matrix multiplication

1 1 1 1 0 1 0 1 1 0
10 bit

General:

Sounds good, but how does the error correction work?

With an error detection algorithm.
Code-based

There are exceptions if the matrix is chosen properly!

1 0 1 0 1

Matrix multiplication

1 0 1 1 1 1 0 1 1

1 01 1 1 10 1 0 1 1
Error detection algorithm
1 0 1 1 1 1 0 1 1
Inverse matrix multiplication
1 0 1 0 1

10101 ·
5 bit

1 0 1 0 1 1 0 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 1 0 1 0 1 1 0 1
5×9 matrix

= 1111010111
9 bit

Many different matrices can be used.

Some allow for efficient error correction (good matrix).

Most don`t (bad matrix).

A good matrix can be turned into a bad one!

This can be used for encryption!

1 0 1 0 1 1 0 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 1 0 1 0 1 1 0 1
Blend matrix

1 0 1 0 1 1 0 1 0 0 1 0 1 1 0 0 0 0 1 0 0 1 0 1 1 0 0 0 1 0 0 0 0 0 1 1 1 1 0 1
Good matrix

0 0 1 0 1 1 0 1 1 0 1 1 1 1 0 1
01100101 =
0 0 1 0 1 0 0 1 1 0 1 0 0 1 0 0
Blend matrix

0 0 1 0 1 1 0 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1 1 0 1 0 1 1 0 1 1 0 1 0 1 0 0 1
Bad matrix

McEliece encryption

1 0 1 0 1 1 0 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 1 0 1 0 1 1 0 1
Blend matrix

1 0 1 0 1 1 0 1 0 0 1 0 1 1 0 0 0 0 1 0 0 1 0 1 1 0 0 0 1 0 0 0 0 0 1 1 1 1 0 1
Good matrix

0 0 1 0 1 1 0 1 1 0 1 1 1 1 0 1
01100101 =
0 0 1 0 1 0 0 1 1 0 1 0 0 1 0 0
Blend matrix

0 0 1 0 1 1 0 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1 1 0 1 0 1 1 0 1 1 0 1 0 1 0 0 1
Bad matrix

Alice`s private key

Alice`s public key

Comparison with RSA
RSA

Private key
p,q (prime numbers)

Public key
p·q

McElliece

1 0 1 0 1 1 0 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1
, 1 0 1 0 1 1 0 1
Blend matrix

10101101 00101101

00101100 10111101

00100101 01100101

10001000 00101001

, 0 0 1 1 1 1 0 1
Good matrix

1 0 1 0 0 1 0 0 Blend matrix

1 0 1 0 1 1 0 1 1 0 1 0 1 1 0 1 0 0 1 0 0 1 0 1 0 0 1 0 1 0 0 1 1 0 1 0 1 1 0 1
Blend matrix

1 0 1 0 1 1 0 1 0 0 1 0 1 1 0 0 0 0 1 0 0 1 0 1 1 0 0 0 1 0 0 0 0 0 1 1 1 1 0 1
Good matrix

0 0 1 0 1 1 0 1 1 0 1 1 1 1 0 1 0 1 1 0 0 1 0 1 0 0 1 0 1 0 0 1 1 0 1 0 0 1 0 0
Blend matrix

McEliece encryption

Bob Alice

Error (random)

Secret message
101110111101
Matrix multiplication with Alice`s public key
01011110 01010110101101 111101
Attacker needs to find error with difficult correction
0101111010101101110111101
Error correction with Alice`s private key
Secret message
101110111101

Which parameters are used in practice?

I`ll show you.

Parameters used in practice

5413 bit
010111101010110111011110110101011011101111011000110101011011................10101101110111101

Alice`s public key

6960 bit

Overhead: 1547 bit

0100111101011011011101110101101000110111101010 110111011110110100110110101..............1110101101010110111101111001

Bob introduces 119 errors Length of public key: ~1MB

1 MB key length?

RSA only needs 2KB.

That`s the disadvantage.

But it`s quantum-proof.

Thanks for coming, Mr. rocket scientist!

Next guest: an island sales man!

Hello!

$15000

Tell us about your work.

$15000

$10,000 $15,000

You want to by an island?

Yes, but I want to look at it first

Yes, I buy / No, I don`t buy
Both can cheat!
Alice can send a ,,yes" and later say it was a ,,no".
Salesman can say ,,it was a yes", though it was a"no".

Alice`s private
key

combination safe 1
or combination safe 2

Alice needs to publish half of her private key
=> Can only be used once

safe 1
Alice`s public
key
Yes, I buy. Alice

safe 2
No, I don`t buy. Alice

This method can also be used digitally.
Keys can only be used once.

Hash-based signatures

Hashing function (e.g., SHA-2)

I buy Alice
I don`t buy Alice
I buy Alice I don`t buy
Alice

Random number 1 Alice`s private
Random number 2 key
Hash of random number 1 Alice`s public
key Hash of random number 2

To sign a bit, Alice publishes message 1 or message 2

Looks pretty laborious.

For only one bit.

There are ways to improve t$h15i0s00
method.

Anyway: hash-based signatures have long signatures or
long keys
But they are provably secure

Where will hash-based signatures be used?

As a security anchor, e.g., in sate$l1li5t0e00s

Thanks, Mr. island salesman.

$15000

Six families of crypto algorithms are considered quantum-proof.

lattice-based code-based hash-based

non-commutative multivariate isogeny-based

Can be explained with a Rubik`s cube.

Non-commutative algorithms
A: move sequence B: move sequence

Find X, for which: X+A-X = B

X

A

-X

B

??

?

?

?? =

Finding solution is very laborious

The ladder problem

Multivariate algorithms

wall

room

wall

z y
2m
x
Find x

This is about a labyrinth.

Isogeny-based algorithms

Six families of crypto algorithms are considered quantum-proof.

lattice-based code-based hash-based

non-commutative multivariate isogeny-based

US authority NIST is holding a competition!

Post-Quantum-Wettbewerb
69 algorithms handed in, 26 still in The best shall be chosen until 2023

Lattice-based and code-based are the most popular ones.

NIST competition isogeny others

non-commutative hash

1 2

1

6

lattice

multivariate 11

27

21
code

This was my postquantum overview.
We`ll see some of these algorithms in
practice.

Enjoy RSA 2020!
www.cryptovision.com

