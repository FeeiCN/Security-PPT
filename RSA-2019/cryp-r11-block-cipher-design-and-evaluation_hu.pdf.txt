SESSION ID: CRYP-R11
Automatic Search for A Variant of Division Property Using Three Subsets

Kai Hu* and Meiqin Wang
Key Lab of Cryptologic Technology and Information Security, Ministry of Education, Shandong University

#RSAC

OUTLINE
1. Background of Division Property and Automatic Search 2. Motivation and Contribution 3. A Variant of Three-Subset Division Property (VTDP) 4. Automatic Search for VTDP 5. Applications 6. Summary

OUTLINE
1. Background of Division Property and Automatic Search 2. Motivation and Contribution 3. A Variant of Three-Subset Division Property (VTDP) 4. Automatic Search for VTDP 5. Applications 6. Summary

#RSAC
What is Division Property (DP)? A technique to find integral distinguishers easily and efficiently
Proposed by Yosuke Todo at Eurocrypt'15
Divided into Word-based DP and Bit-Based DP Bit-Based DP is divided into Two-Subset and Three-Subset
4

#RSAC
What is Three-Subset Bit-Based Division Property
Sum all the ciphertexts together
Two-Subset DP indicates the sum of one bit of all the ciphertexts is
0 or Unknown
Three-Subset DP indicates the sum of one bit of all the ciphertexts is
0 or 1 or Unknown
Three-Subset DP is more accurate than any other division property
5

#RSAC
What is Automatic Search?
Tools from graph theory can solve constraint problems Transform cryptologic problems into constraint problems Solve the constraint problems

#RSAC
Why Automatic Search is Needed? C(python, etc.)-programming will cost too much time to write
Not easy to optimize for the efficiency
Concentration can be focused on the problem itself
...
7

#RSAC
Automatic Search for Two-Subset Division Property Xiang et al. modeled two-subset DP based MILP@Asiacrypt16
8

#RSAC
Difficult to Model Three-Subset Division Property

Propagation Rules of XOR for Two-Subset and Three-Subset DP are
ESSENTIALLY DIFFERENT!
Two-Subset Division Property
  ( + , , , ... , )

Three-Subset Division Property






 + , , , ... , 

Removed if exits

9

#RSAC
Why Is It So Difficult?
At any time, the automatic search tool can process only one trial
Blue Trails should be removed but cannot
Division Trails
10

OUTLINE
1. Background of Division Property and Automatic Search 2. Motivation and Contribution 3. A Variant of Three-Subset Division Property (VTDP) 4. Automatic Search for VTDP 5. Applications 6. Summary

#RSAC
Motivations
Three-Subset Division Property can find more distinguishers It still cannot be modeled by automatic search methods
Contributions
A new division property is proposed More integral distinguishers than two-subset division property Improvement of the results of SIMON, SPECK and KATAN
12

OUTLINE
1. Background of Division Property and Automatic Search 2. Motivation and Contribution 3. A Variant of Three-Subset Division Property (VTDP) 4. Automatic Search for VTDP 5. Applications 6. Summary

#RSAC
Variant Three-Subset Division Property
14

#RSAC
Variant XOR Propagation Rules

Duplicated vectors will not be removed






 + , , , ... , 

   + , , , ... , 

15

#RSAC
Relationship of OTDP and VTDP
16

#RSAC
Relationship between VTDP and OTDP
 More bits are indicated unknown  Some even-parity bits are
indicated Odd-parity
17

OUTLINE
1. Background of Division Property and Automatic Search 2. Motivation and Contribution 3. A Variant of Three-Subset Division Property (VTDP) 4. Automatic Search for VTDP 5. Applications 6. Summary

#RSAC
Propagation Rule of Key-XOR
Some new vectors are generated from  and appended into 
   ,  = (0, 1, ... ,   , ... , s-1) for  = 0
, , ,   { , , ,  , , , ,  , (, , , )}
 Two problems in automatic search model?  How to generate the new vectors?  How to insert them into  ?
19

#RSAC
Models of Key-XOR for Three-subset Division Property
20

#RSAC
Initial Rules for Three-subset Division Property
21

#RSAC
Stopping Rules for Three-subset Division Property
22

OUTLINE
1. Background of Division Property and Automatic Search 2. Motivation and Contribution 3. A Variant of Three-Subset Division Property (VTDP) 4. Automatic Search for VTDP 5. Applications 6. Summary

#RSAC
Applications on Some Ciphers
24

OUTLINE
1. Background of Division Property and Automatic Search 2. Motivation and Contribution 3. A Variant of Three-Subset Division Property (VTDP) 4. Automatic Search for VTDP 5. Applications 6. Summary

#RSAC
Summary
A new division property that can find more distinguishers Automatic search model of the variant division property It may bring some new insights into bit-based division
property
26

Thanks for Your Attention!

