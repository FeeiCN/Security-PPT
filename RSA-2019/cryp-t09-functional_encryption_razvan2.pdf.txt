SESSION ID: CRYPTO-09
ROBUST ENCRYPTION, EXTENDED
Remi Geraud, David Naccache, and Razvan Rosie
ENS Paris, CNRS, INRIA, PSL Research University University of Luxembourg Corresponding author: razvan.rosie@ens.fr

#RSAC

#RSAC
Robustness in a nutshell
Robustness: ciphertext can't be decrypted under two different keys.

Presenter's Company

Logo ­ replace or

delete on master slide

2

Robustness ­ This Talk
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

#RSAC
Key-Robustness in a Nutshell
Robustness: ciphertext can't be decrypted under two different keys.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Key-Robustness in a Nutshell
Robustness: ciphertext can't be decrypted under two different keys.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Motivating Robustness
Digital Signatures from Symmetric Encryption: sk  (K, s) pk  Enc(K, s) -- contains the Symm. Enc. of s. o  (PRF(s, M), ) -- PRF evaluation + ZK proof for correctness.
Is the scheme unforgeable?
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Motivating Robustness
Digital Signatures from Symmetric Encryption: sk  (K, s) pk  Enc(K, s) -- contains the Symm. Enc. of s. o  (PRF(s, M), ) -- PRF evaluation + ZK proof for correctness.
Is the scheme unforgeable? Enc(K, s) = Enc(K', s' )  FORGE
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robustness - Covered Primitives
Presenter's Company Logo ­ replace or
delete on master slide

Warm Up: Robustness for Digital Signatures

Robust Digital Signatures
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

Robust Digital Signatures
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC

#RSAC
Robust Digital Signatures - Motivating Example
Consider the Boneh-Boyen signature scheme:
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - Motivating Example
Adversary A can always construct Having:
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - Motivating Example
Adversary A can always construct Having: Then, A can set t, x', y' such that:
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - Motivating Example
Adversary A can always construct
Having: Then, A can set t, x', y' such that:
There is always an M producing the same .
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - The Security Model
Strong Robustness (SROB): honestly generated 1 ,2. Goal: find (M, ) verifiable under 1 ,2.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - The Security Model
Complete Robustness (CROB): adversarially generated 1 ,2. Goal: find (M, ) verifiable under 1 ,2.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - Definitional Landscape
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - Definitional Landscape
EUF-secure scheme  SROB-secure.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - SROB from EUF
Any EUF secure signature scheme achieves SROB security security.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - CROB Transform
A CROB digital signature scheme can be achieved generically:
Let H denote a collision resistant hash function (i.e. constructed from claw-free permutations). Idea: "commit" to the public-key by hashing it. Attach the hash to the signature.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Digital Signatures - CROB Transform
Why is it CROB-secure?
If A comes up with (, M, 1 ,2). Such that verification passes under both , 1 ,2. It must be the case that: H(1) = H(2) (assumed to be hard).
Presenter's Company Logo ­ replace or
delete on master slide

Robustness for Functional Encryption

#RSAC
Functional Encryption - An example
Doctor

Medical Records

Receptionist

Presenter's Company Logo ­ replace or
delete on master slide

Insurance Agent

#RSAC
Functional Encryption - An example
Doctor

Medical Records

Receptionst

Presenter's Company Logo ­ replace or
delete on master slide

Insurance Agent

#RSAC
Functional Encryption - What is it
Want to compute f over some ciphertext and recover f(M). Ideally, no other information on M is leaked. A primitive with many potential applications.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Functional Encryption - Syntax
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Functional Encryption
Functional Encryption - Defining robustness
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Functional Encryption
Functional Encryption - Defining robustness
Issue: Trivially Satisfied by a Generic FE Scheme.
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Functional Encryption
What is the intuition of robustness for FE? Why are we defining this notion? Any real attacks?
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Functional Encryption
What is the intuition of robustness for FE? Why are we defining this notion? Any real attacks?
Consider the following inner-product FE scheme
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Functional Encryption
What is the intuition of robustness for FE? Why are we defining this notion? Any real attacks?
Consider the following inner-product FE scheme
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Functional Encryption
What is the intuition of robustness for FE? Why are we defining this notion? Any real attacks?
Consider the following inner-product FE scheme
Issue: same ciphertext decrypts under two different keys!
Presenter's Company Logo ­ replace or
delete on master slide

#RSAC
Robust Functional Encryption
A possible definition:
Robustness: ciphertext can't be decrypted under two different keys.

Presenter's Company

Logo ­ replace or

delete on master slide

34

#RSAC
Robust Functional Encryption
A possible definition:
Robustness: ciphertext can't be decrypted under two different keys. For FE: keys are issued via different master secret keys.

Presenter's Company

Logo ­ replace or

delete on master slide

35

#RSAC
Robust Functional Encryption - Security Model

Presenter's Company

Logo ­ replace or

delete on master slide

36

#RSAC
Robust Functional Encryption - Security Model

Winning conditions:

No ciphertext obtained for Authority 1 can be decrypted under a functional key obtained under Authority 2.

SROB for FE: adversary finds , 1 ,2 suchthat FE.Dec(skf1 , C) 6=   FE.Dec(skf2 , C) 6=  .

We have that FEROB  SROB.

Presenter's Company

Logo ­ replace or

delete on master slide

37

#RSAC
Robust Public-Key FE - Generic Transform

Presenter's Company

Logo ­ replace or

delete on master slide

38

#RSAC
Robust Public-Key FE - Generic Transform

FEROB : follows from

Presenter's Company

Logo ­ replace or

delete on master slide

39

#RSAC
Summary - Robust DS and FE
DS: signature can't be verified w.r.t. multiple keys.
FE: ciphertext can't be decrypted w.r.t. keys issued by different msk. Under correct key-generation any unforgeable DS scheme is SROB-secure. Generic constructions based on collision-resistant hashes and collision-resistant PRFs. FEROB: harder to achieve for Private-Key Functional Encryption.

Presenter's Company

Logo ­ replace or

delete on master slide

40

#RSAC
Summary - Robust DS and FE
DS: signature can't be verified w.r.t. multiple keys.
FE: ciphertext can't be decrypted w.r.t. keys issued by different msk. Under correct key-generation any unforgeable DS scheme is SROB-secure. Generic constructions based on collision-resistant hashes and collision-resistant PRFs. FEROB: harder to achieve for Private-Key Functional Encryption.

Presenter's Company

Logo ­ replace or

delete on master slide

41

