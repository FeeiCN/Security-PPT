SESSION ID: CRYP-F03
A Non-Interactive Shuffle Argument With Low Trust Assumptions
Antonis Aggelakis, Prastudy Fauzi, Georgios Korfiatis, Panos Louridas, Foteinos Mergoupis-Anagnou, Janno Siim, Michal Zajac

Janno Siim
Junior Research Fellow in Cryptography University of Tartu

#RSAC

#RSAC
Motivation

#RSAC
Internet Voting

V1

V2

Bulletin

V3

Board

V4

Mix-Net

Threshold Decryption

3

Mix-Net
Goal: anonymity (location privacy) for ciphertexts
   
Blinding:  ;    0;  =
(;  + )
4

#RSAC
   

Mix-Net
Goal: anonymity (location privacy) for ciphertexts
   

#RSAC
   

5

#RSAC
Mix-Net
Goal: anonymity (location privacy) for ciphertexts

















 

Solution: Zero-knowledge proof

6

#RSAC
Mix-Net
Goal: anonymity (location privacy) for ciphertexts























7

#RSAC
Zero-Knowledge Arguments

#RSAC
Zero-Knowledge Proof/Argument

Protocol between Prover and Verifier where
Prover proves to Verifier validity of some statement (soundness)
Prover does not leak any information besides validity (zeroknowledge)

Argument 

I believe!

P = NP!

9

#RSAC
More formally ...
Fix an NP-Language  Prover claims    Honest Prover knows witness  for  Properties:
­ Completeness ­ honest Prover's argument is accepted ­ Soundness ­ computationally hard to find accepting proof for    ­ Zero-Knowledge ­ proof can be simulated with a trapdoor
10

#RSAC
Shuffle Arguments
Best (non-interactive) shuffle arguments either require Random oracle model
­ Only a security heuristic
Common reference string (CRS) model
­ Trust in the setup phase
11

#RSAC
CRS Model

, 

Argument 



Accept/Reject

12

#RSAC
Idea
Take the `best' CRS model shuffle Reduce trust requirements as much as possible Recent techniques
­ Distributed CRS generation ­ Subversion zero-knowledge
13

#RSAC
Our Construction

#RSAC
FLSZ17 Shuffle Argument
Starting point: Shuffle argument by Fauzi et al. (Asiacrypt 2017) CRS model but no RO model Relatively efficient:
­ 100,000 ciphertexts proving + verification time < 2.5min
Strong assumptions and generic group model
15

#RSAC
Our Contributions
Simplifications in structure Weaker assumptions:
­ Generic group model -> algebraic group model ­ Less specialized assumptions
Less trust:
­ Modifications to CRS such that distributed CRS generation is possible (security with N-1 malicious parties)
­ CRS verification algorithm for zero-knowledge (ZK even with N malicious parties)
16

#RSAC
Pairings
Bilinear groups: 1, 2,  of size  with generators 1, 2,  Additive notation & bracket notation:
­   1  []1 ­   2  []2 ­     []
Bilinear map: []1 []2 = []
17

Structure
Prove that commitment  opens to (0, ... , 0,1,0, ... 0)

Unit Vector Argument

18

#RSAC
ZK: unconditional Knowledge soundness: power DL assumption in algebraic group model
Power DL: Given elements [, ... ,  ]1
find 

Structure

Prove that commitments
1, ...  open to a permutation matrix

opens

1

010

opens

2

100

opens 3

0

0

1

Unit Vector Argument Permutation Argument
19

#RSAC
ZK: unconditional Knowledge soundness: if unit vector argument is KS & commitment is binding

Structure
· Commit to permutation matrix
· Give permutation argument
· Show that permutation was used for shuffling

Unit Vector Argument Permutation Argument Shuffle Argument
20

#RSAC
ZK: unconditional Soundness: if permutation argument is KS & (variation
of) KerMDH assumption holds
KerMDH: Given matrix []1 find non-zero []2
s.t.  = 0

#RSAC
Distributed CRS Generation
Ben-Sasson et al. (S&P 15) and Abdolmaleki et al. (Africacrypt 19) proposed specialized CRS generation protocols Very efficient Tolerates N-1 malicious parties But only for specific pairing-based arguments Not directly applicable for FLSZ17 shuffle
21

#RSAC
Modification to CRS
Need to modify CRS of FLSZ17 Lots of ad-hoc tricks Example:
­ [    +   ()]2 where , ,    and () and () are polynomials
­ CRS generation requires that computation is done one multiplication and addition at the time
22

Example Continued []2 [  ]2

#RSAC

[]2

[(M)]a2ke

unit vector argument insecure







[    ]2

[    +   ()]2
23

[  ()]2

Example Continued Change unit v[ect]o2r argume[ntto ]2
use this element!


#RSAC
[]2 [()]2 

[    ]2





[2    +   ()]2 [    +   ()]2

[  ()]2

24

#RSAC
Subversion Zero-Knowledge
Zero-knowledge even if CRS is malicious Idea from Bellare et al. (AC 2016) and Abdolmaleki et al. (AC 2017)
­ Prover verifies well-formedness of CRS ­ In security proof trapdoor is extracted with knowledge assumption
25

#RSAC
Example: well-formedness check
Suppose [2]1, [  ]2, []1, [()]2 have been verified Then check that [2]1[  ]2 + []1[()]2= [1]1[2    +   ()]2
Knowledge assumption: If adversary outputs []1, []2, then he knows 
26

#RSAC
Prototype Implementation
By GRNET team Zeus I-voting system https://github.com/grnet/lta_shuffle
27

#RSAC
Conclusion
Improvement over state-of-the-art shuffle argument Reorganizing structure and weaker assumptions CRS generation protocol and verification algorithm:
­ Soundness holds if at least 1 party is honest ­ ZK holds even if all parties are malicious
28

#RSAC
Questions

