SESSION ID: CRYP-R01
Faster homomorphic encryption is not enough: improved heuristic for multiplicative depth minimization of Boolean circuits
Pascal AUBRY
Research Engineer CEA, LIST
#RSAC

Privacy protection
Services
Private data

#RSAC
Healthcare Smart manufacturing Artificial Intelligence

Privacy protection
Services

#RSAC
Healthcare

Private data

Smart manufacturing

We want to ensure privacy of our data when using these services!

Artificial Intelligence

#RSAC
GRPD
Sanction: Up to 4% of the annual worldwide turnover of the preceding year
4

#RSAC
Homomorphic encryption
Theoretically perfectly suited to address these challenges
5

#RSAC
Homomorphic encryption
Theoretically perfectly suited to address these challenges
... but there are performance issues
6

#RSAC
Performance issues
Many ways to explore :
­ Using techniques such as fast bootstrapping when available ­ Using techniques such as batching when available ­ Using cryptosystem with cleartext domain larger than 2( when algorithm
allows it) ­ Faster homomorphically encryption schemes ­ Specially optimized FHE ­ Truly general purpose FHE works over 2:
Optimizing directly the Boolean circuit of the homomorphic program
· Minimizing the ciphertext size · Minimizing the execution time
7

#RSAC
BFV Schemes
FHE encryption is necessarily probabilistic
­ Ciphertexts have noise which grows after each operation:
Noise growth: multiplication >> addition Decryption is impossible above a certain noise level
­ Multiplicative Depth
Maximal number of sequential multiplications which are supported by a FHE instantiation Boolean circuit : max number of ANDs between input and output nodes
8

#RSAC
Multiplicative depth
Transformation from 2 to 2 Circuit can be developed as a EXOR sum of product
­ Upper bound to minimal multiplicative depth : 2() . ­ ... but the number of gates increase exponentially
9

#RSAC
Rewriting operators (Basics)
Associativity of AND: r=((a.b).c).d = (a.b).(c.d) Multiplicative depth is different for circuits with the same functionality
10

#RSAC
Rewriting operators (expert)
The equivalent Boolean equation is :
11

#RSAC
Condition to reduce multiplicative depth
Multiplicative depth of the output r, l(r), is reduced by one with this rewrite operator if :
12

#RSAC
Heuristic
13

#RSAC
Cone selection method
Combinatorial optimization problem
­ Known as DAG vertex deletion problem
DVD problem is UG-hard
Network flow based algorithm used to find min
14

#RSAC
Benchmark suite (EPFL Combinational Benchmark Suite)

Circuit name
adder div max
multiplier square arbiter i2c
mem_ctrl priority router

#input 256 128 512 128 64 256 147 1204 128 60

#output 129 128 130 128 128 129 142 1231 8 30
15

x depth 255 4253 204 254 247 87 15 110 203 21

#AND 509 25219 2832 14389 9147 11839 1161 44795 676 167

#RSAC
Experimental results

Circuits name

inital x depth # AND

adder div max
multiplier square arbiter i2c
mem_ctrl priority router

255 4253 204 254 247
87 15 110 203 21

509 25219 2832 14389 9147 11839 1161 44795 676 167

x depth
9 532 26 57 26 10
7 40 102 11

this work

# AND

ratio

16378

28.3

190855

8

7666

7.8

23059

4.5

11306

9.3

5183

8.7

1213

2.1

54816

2.4

876

2.0

198

1.9

time (s)
125 3731
14 31 13 43 0.1 85 0.5 0.0

previous work X depth # AND Time (s)

11 1436
27 59 28 42 8 45 102 11

1125 31645 4660 17942 10478 8582 1185 49175 1106 204

40.0 72000 1712 14810 9840 72000
7.3 66222 22.2
0.5

16

Run-time complexity

Circuit name

estimated FHE execution acceleration factor

this work

lowest depth

best

previous work

adder

44.91

408.29

419.52

div

10.98

40.26

7.66

max

32.04

61.03

48.53

multiplier

15.68

17.46

18.70

square

105.81

109.34

97.10

arbiter

257.93

257.93

6.69

i2c

5.16

5.16

3.93

mem_ctrl

7.43

7.43

6.32

priority

3.40

3.40

2.69

router

3.50

3.50

3.40

FHE speed-up obtained at lowest depth found

Best speed-up at the
non necessarly lowest
17 depth

#RSAC

#RSAC
Tf-idf ranking
Tf-idf score :
­ With
Developed with Cingulata toolchain
­ Implementation takes account of multiplicative depth
18

#RSAC
Summary
Homomorphic encryption is a solution for privacy protection There are performance issues One solution is working on Boolean circuit optimization We proposed an efficient method to do that We obtain speed-up for our applications There still are many perspectives
­ Heuristic improvements ­ Generalization to arithmetic circuits
19

#RSAC
Try it by yourself!
Homomorphic encryption : Cingulata
­ Cingulata (pronounced "tchingulata") is a compiler toolchain and RTE for running C++ programs over encrypted data by means of fully homomorphic encryption techniques.
­ Open source. ­ Support BFV and TFHE
­ Available on https://github.com/CEA-LIST/Cingulata
20

#RSAC
Cingulata

transform

execute

and optimize Cingulata API

homomorphically Boolean Circuits

Data stay private

#RSAC

#RSAC

#RSAC

