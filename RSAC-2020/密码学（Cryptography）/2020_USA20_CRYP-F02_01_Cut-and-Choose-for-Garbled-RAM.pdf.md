SESSION ID: CRYP-F02
Cut-and-Choose for Garbled RAM

Peihan Miao
Research Scientist Visa Research

#RSAC

#RSAC
Secure Two-Party Computation







(, )

2

#RSAC
Secure Two-Party Computation for Circuits





(, )
3

#RSAC
Yao's Garbled Circuit [Yao'86]

Garble





Garble



Input keys



Oblivious



Transfer



 ,  =  , 

4

Yao's Garbled Circuit [Yao'86]

: 0 1 0 1 1

0 0 1 1

0 1

0 1

0 1

#RSAC

Garble

 
5

Yao's Garbled Circuit [Yao'86]

: 0 1 0 1 1

0 1

0 1 1

#RSAC

Garble



(01011)


6

#RSAC
Secure Two-Party Computation for Circuits





(, )
7

#RSAC
RAM (Random-Access Machine) Computation?




CPU

CPU

CPU



step

step

step

CPU state

CPU state

Program 

......

8

CPU

(, )

step

#RSAC
Secure Two-Party RAM Computation
Convert RAM program into a circuit?
­ RAM program with running time  ­ Turing machine with running time  3 ­ Circuit with size  3 log 
9

Secure Two-Party RAM Computation
Convert RAM program into a circuit?

#RSAC




CPU



step

CPU step

CPU

......

CPU

step

step

CPU state

CPU state

Circuit size could be exponentially larger than running time !
10

(, )

#RSAC
Can we do it more efficiently?
Yes, Garbled RAM [LO'13] ! Secure RAM computation [LO'13, GHLORW'14, GLOS'15,
GLO'15, GGMP'16, LO'17, KY'18, HY'19, CQ'19, ...]
11

Secure RAM Computation over Persistent Memory

1

1

1

1(1, 1)

#RSAC
1

12

Secure RAM Computation over Persistent Memory

2

2

2

21(2, 2)

#RSAC
12

13

Secure RAM Computation over Persistent Memory

3

3

3

#RSAC
2

14

#RSAC
Garbled RAM [LO'13]

1 1

 1 1, 1

1 1, 1 = 1  1, 1

15

#RSAC
Garbled RAM [LO'13]

2 2

2

1

2, 2

21 2, 2 = 21 2, 2

Size of garbled memory  =   Size and evaluation time of garbled program  =  
 ignores      , 

#RSAC
Can we do it from the weakest cryptographic assumption?
Yes, black-box garbled RAM [GLO'15] ! black-box use of OWFs, but only semi-honest secure
17

#RSAC
Can we make it maliciously secure?
Yes, [GMW'87] compiler: semi-honest  malicious requires generic zero-knowledge proofs, non-black-box use of OWFs
18

#RSAC
Can we make it maliciously secure while still making black-box use of OWFs?
Yes, this work!
19

#RSAC
Outline
Secure Two-Party RAM Computation
­ Convert RAM program into a circuit?
Garbled RAM [LO'13] Black-Box Garbled RAM [GLO'15] This Work: Malicious Security
­ Consistency Checks by Commitments ­ Cut-and-Choose on Gates
20

#RSAC
Black-Box Garbled RAM [GLO'15] 

21

#RSAC
Black-Box Garbled RAM [GLO'15]
0 1




0, 1

22

#RSAC
Malicious Alice?
0 1




0, 1

23

#RSAC
Malicious Alice?
0 1




garbage

24

#RSAC
How to avoid Alice cheating?
Cut-and-Choose!
25

#RSAC
Cut-and-Choose Technique
26

#RSAC
Cut-and-Choose for Yao's Garbled Circuit [LP'07]
Open 2, 3, 5
Evaluate over the rest garbled circuits, take majority
27

#RSAC
Cut-and-Choose for Garbled RAM
Open 2, 3
Evaluate over the rest garbled RAMs, take majority
28

#RSAC
Cut-and-Choose for Garbled RAM
Consistency?
Evaluate over the rest garbled RAMs, take majority
29

Consistency
0 1
Circuit 

0, 1
Circuit 
30

#RSAC

Consistency
0 1
Circuit 

0, 1
Circuit 
31

#RSAC

Consistency
0 = 0110 1

How to enforce Alice to provide 0 without revealing the bit 0?
0 1

#RSAC

Circuit 

Circuit 
32

#RSAC
Consistency Check by Commitments
XOR-homomorphic commitment [FJNT'15]    =       = 0


33

Consistency Check by Commitments
0 , 1 , 2 , 3 0 = 0123 1

0 || 0 1 || 1
0 1

 ||   || 

#RSAC

Circuit 

Circuit 
Open  0    0 ?
34

#RSAC
Outline
Secure Two-Party RAM Computation
­ Convert RAM program into a circuit?
Garbled RAM [LO'13] Black-Box Garbled RAM [GLO'15] This Work: Malicious Security
­ Consistency Checks by Commitments ­ Cut-and-Choose on Gates
35

#RSAC
Cut-and-Choose on Circuits?
Open 2, 3, 5
Evaluate over the rest garbled circuits, take majority
36

Issue 1
0 , 1 , 2 , 3 0 = 0123 1

 ||   || 
0 1

#RSAC

Circuit 

Circuit 

How to guarantee that Alice has committed correctly?

37

Issue 2

0,1 1,1

0,2 1,2

0,3 1,3

0, 1

1

2

3

Circuit 
38

#RSAC

Issue 2

0,1 1,1

0,2 1,2

0,3 1,3

#RSAC
0,1, 1,1, 0,2, 1,2, 0,3, 1,3

1

2

3

Circuit 
Input size may grow exponentially in the number of circuits!
39

#RSAC
Cut-and-Choose on Gates [NO'09]
Open 2, 3, 5,8,11
Soldering information
40

#RSAC
Summary
Secure Two-Party RAM Computation
­ Convert RAM program into a circuit?
Garbled RAM [LO'13] Black-Box Garbled RAM [GLO'15] This Work: Malicious Security
­ Consistency Checks by Commitments ­ Cut-and-Choose on Gates
41

#RSAC
Thank you!

