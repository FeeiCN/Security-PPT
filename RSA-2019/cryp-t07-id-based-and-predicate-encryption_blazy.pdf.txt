SESSION ID: CRYP-T07
Downgradable Identity-based Encryption and Applications

Olivier Blazy, Paul Germouty, Duong Hieu Phan
Associate Professor, Xlim, University of Limoges, France http://www.blazy.eu

#RSAC

#RSAC
Context Model Generic Transformations Construction
2

General Context

#RSAC
Identity-Based Encryption
4

#RSAC
History of IBE
Shamir `84 Boneh-Franklin, Cocks `01 Boneh-Boyen, Waters '05 Waters '09, Chen-Wee, Blazy ­Kiltz-Pan
5

#RSAC
So Many Variants
Hierarchical IBE Wildcarded IBE Wicked IBE ...
6

#RSAC
Relations ?
7

#RSAC
Relations ?
8

Model

#RSAC
Identity-Based Encryption
4 algorithms:
­ Keygen: Generates mpk, msk ­ USKGen(id, msk): Generates usk[id] ­ Enc(mpk,id): Generates a capsule C leading to a key K for id ­ Dec(C,usk[id]): Recovers K' from C
10

#RSAC
Downgradable Identity-Based Encryption
5 algorithms:
­ Keygen: Generates mpk, msk ­ USKGen(id, msk): Generates usk[id] ­ Enc(mpk,id): Generates a capsule C leading to a key K for id ­ Dec(C,usk[id]): Recovers K' from C ­ USKDown(usk[id],id'): Return usk[id'] if id' << id
­ Given a key for an id, one can deduce a key for id' if id' can be obtained by replacing some 1 in id by 0. (101 << 111)
11

#RSAC
Downgradable Identity-Based Encryption
12

Transformations

#RSAC
Wildcard Identity-Based Encryption
Allows * in targeted identities
14

#RSAC
Wildcard Identity-Based Encryption
15

#RSAC
Hierarchical Identity-Based Encryption
Allows to derive keys for lower level
­ This means * at the end of original identities
16

#RSAC
Hierarchical Identity-Based Encryption
17

#RSAC
Wicked Identity-Based Encryption
Allows to derive keys for lower level
­ This means * in the original identities
18

#RSAC
Wicked Identity-Based Encryption
19

#RSAC
Transformations
All those transformations are tight However they use a space of size 4 for a ternary alphabet.
­ It could be improve, but would not drastically improve the tightness
20

#RSAC
Attribute-Based Encryption
User keys have 1 where they have the attribute Ciphertext have a 0 where an attribute is not mandatory If the policy < attributes, a user can properly downgrade his key
21

Construction

#RSAC
Downgradable Identity-Based Encryption
Can be constructed by adapting BKP'14
­ Can be instantiated under any k-MDDH assumption (SXDH, Dlin,...)
­ Depending on the use case, it is possible to ensure that the downgraded key is indistinguishable from a fresh one.
­ Encapsulation is only k+1 elements (k=1 for SXDH) ­ Same goes for user keys
23

#RSAC
Wicked / Wildcard Identity-Based Encryption
24

#RSAC
Attribute-Based Encryption
25

#RSAC
Conclusion
Another IBE related primitive
­ However it can be tightly linked to the others ­ So any progress on DIBE should lead to progress to the other primitive
Can DIBE be achiever in a Post Quantum world? How to avoid the DNF limitation for ABE
26

Thank you
Any questions?

