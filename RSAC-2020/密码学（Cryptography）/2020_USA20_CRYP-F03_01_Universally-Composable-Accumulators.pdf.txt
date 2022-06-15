SESSION ID: CRYP-F03
Universally Composable Accumulators
Foteini Baldimtsi, Ran Canetti, Sophia Yakoubov

Sophia Yakoubov
Postdoc Aarhus University @sophiay135

#RSAC

#RSAC
Our Contributions

Accumulators are used in...
­ (Anonymous) Credentials ­ Cryptocurrencies ­ Group and Ring Signatures

Definition styles:

Statement
Proof of secure use in system

Game-Based Definitions Simple
Hard

2

UC Definitions
Complex Easy

#RSAC
Our Contributions
First UC definition for accumulators Proof of equivalence of game-based and UC definitions

Statement
Proof of secure use in system

Game-Based Definitions Simple
Hard

= UC Definitions
Complex Easy

3

#RSAC
Our Contributions
First UC definition for accumulators Proof of equivalence of game-based and UC definitions
­ Best of both worlds! ­ All existing constructions are automatically UC-secure

Statement
Proof of secure use in system

Game-Based Definitions Simple
Hard

= UC Definitions
Complex Easy

4

#RSAC
Our Contributions

First UC definition for accumulators

Proof of equivalence of game-based and UC definitions

Demonstration of Composition

­ Modular accumulators

­ Anonymous credentials

Game-Based Definitions

Statement

Simple

Proof of secure use Hard in system

= UC Definitions
Complex Easy

5

OUTLINE

#RSAC
What is an accumulator? First UC definition for accumulators Proof of equivalence of game-based and UC definitions Demonstration of Composition
6

OUTLINE

#RSAC
What is an accumulator? First UC definition for accumulators Proof of equivalence of game-based and UC definitions Demonstration of Composition
7

OUTLINE

#RSAC
What is an accumulator? First UC definition for accumulators Proof of equivalence of game-based and UC definitions Demonstration of Composition
8

#RSAC
Application: Credentials
Alice Bob
9

#RSAC
Application: Credentials
I'm Alice, a member of the gym!
Yep, you're on Merlin's list. Go ahead.
Alice Bob
10

#RSAC
Application: Credentials
!!!
Alice Bob
11

Accumulators: a digest of set S

Can I have the

S = {Alice, Bob, ...}

membership witness

for "Alice"?

Witness wA

S

#RSAC
wA

12

Application: Credentials
I'm Alice, a member of the gym! wA
So you are. Go ahead.

#RSAC
wA

S
13

Everything is

#RSAC

an Accumulator!

Merkle Trees

S

h1
Aplikce
A

Go ahead.

S
14

Everything is

#RSAC

an Accumulator!

Merkle Trees
Digital Signatures

Merlin's signature  on "Alice"

Go ahead.

S = PKM
15

Everything is

Strong Add

#RSAC

an Accumulator!

Merkle Trees



Digital Signatures  

16

Everything is

Strong Add

#RSAC

an Accumulator!

Merkle Trees



Digital Signatures  

RSA Accumulator
­ p1, p2 secret primes ­ n = p1p2 ­ S = v (mod n)

^"Alice" ^"Bob"

wA

wB

 "Charlie"

17

Everything is

Strong Add

#RSAC

an Accumulator!

Merkle Trees



Digital Signatures  

RSA Accumulator 
­ p1, p2 secret primes ­ n = p1p2 ­ S = v (mod n)

^"Alice" ^"Bob"

wA

wB

 "Charlie"

18

Everything is

Strong Add Del Hiding

#RSAC

an Accumulator!

Update Message

Merkle Trees

 

-

Digital Signatures  RSA Accumulator 
­ p1, p2 secret primes ­ n = p1p2 ­ S = v (mod n)
^"Alice" ^"Bob"

wA

wB

 

 
Can I join?

wC  v v  v"Charlie" mod n
 "Charlie"

19

Everything is

Strong Add Del Hiding Proofs of

#RSAC

an Accumulator!

Update

Non-

Message Membership

Merkle Trees

 

-



Digital Signatures    



RSA Accumulator   





There are many other interesting accumulator properties!

20

OUTLINE

#RSAC
What is an accumulator? First UC definition for accumulators Proof of equivalence of game-based and UC definitions Demonstration of Composition
21

#RSAC

Universal Composability

Real World

Environment

protocol

22

#RSAC

Universal Composability

Ideal World

Environment

functionality interfaces
Functionality
23

#RSAC
Universal Composability
Environment

protocol

functionality interfaces
Functionality

???

New UC definition: describe what the function2a4lity does

#RSAC
UC Signature Definition

Requesting algorithms from the adversary ensures VERIFY consistency

This is intuitive: if the functionality never has to substitute algorithms' outputs...
­ The algorithms satisfy correctness and soundness (classical definitions)
­ This is indistinguishable from a real execution (UC security)

SIGN, VERIFY algorithms?

SIGN, VERIFY interfaces
Signature Functionality

SIGN, VERIFY
I'll use these, except as necessary for correctness and
soundness

25

#RSAC

UC Accumulator Definition

Same principle as for signatures!

Requesting algorithms from the adversary ensures VERIFY consistency
This is intuitive: if the functionality never has to substitute algorithms' outputs...
­ The algorithms satisfy correctness and soundness (classical definitions) ­ This is indistinguishable from a real execution (UC security)

Accumulator Functionality

UPDATE, VERIFY, ... algorithms?
UPDATE, VERIFY, ...
I'll use these, except as necessary for correctness and
soundness

26

#RSAC
See the paper for the full
functionality 
27

OUTLINE

#RSAC
What is an accumulator? First UC definition for accumulators Proof of equivalence of game-based and UC definitions Demonstration of Composition
­ Modular accumulators ­ Anonymous credentials
28

OUTLINE

#RSAC
What is an accumulator? First UC definition for accumulators Proof of equivalence of game-based and UC definitions Demonstration of Composition
­ Modular accumulators ­ Anonymous credentials
29

Everything is

Strong Add Del Hiding Proofs of

#RSAC

an Accumulator!

Update

Non-

Message Membership

Merkle Trees

 

-



Digital Signatures    



RSA Accumulator    



30

Everything is

Strong Add Del Hiding Proofs of

#RSAC

an Accumulator!

Update

Non-

Message Membership

Merkle Trees

 

-



Digital Signatures    



RSA Accumulator    



WANT





31

#RSAC
Composition: Braavos
Adding "Alice": Pick random R
("Alice", R) R

A1
SIGNATURES
32

A2 RSA

#RSAC
Composition: Braavos

R, witness w1 that (R, "Alice") in A1, witness w2 that R in A2
Go ahead.

A1 ("Alice", R)
SIGNATURES
33

A2 R
RSA

#RSAC
Composition: Braavos
Deleting "Alice":

A1 ("Alice", R)
SIGNATURES
34

A2 R
RSA

Composition:

Strong Add Del Hiding Proofs of

#RSAC

Braavos

Update

Non-

Message Membership

Merkle Trees

 

-



Digital Signatures    



RSA Accumulator    



We can achieve better efficiency by using CL-RSA-B instead

Braavos

A1 ("Alice", R)




A2 R

SIGNATURES

RSA

35

OUTLINE

#RSAC
What is an accumulator? First UC definition for accumulators Proof of equivalence of game-based and UC definitions Demonstration of Composition
­ Modular accumulators ­ Anonymous credentials
37

#RSAC
Composition: Anonymous Credentials
We can build revocable anonymous credentials by combining...
­ An hiding update message (HUM) accumulator, e.g. Braavos ­ Zero knowledge proofs
38

Composition: Anonymous Credentials
Zero knowledge proof of knowledge of skA, pkA, w such that... · skA matches pkA · pkA is in the accumulator

Hiding update messages ensure that no-one learns who gets
added or deleted!

Go ahead.

39

#RSAC
skA, pkA

OUTLINE

#RSAC
What is an accumulator? First UC definition for accumulators Proof of equivalence of game-based and UC definitions Demonstration of Composition
40

