SESSION ID: CRYP-W02
Tight Reductions for Diffie-Hellman Variants in the Algebraic Group Model
Taiga Mizuide1, Atsushi Takayasu1,2, Tsuyoshi Takagi1
1The University of Tokyo, Japan 2National Institute of Advanced Industrial Science and Technology, Japan
#RSAC

#RSAC
Summary of Our Result
In this talk, we show tight equivalences between the DL and several DiffieHellman variants in the algebraic group model defined in [FKL@Crypto'18]. The results imply information theoretic lower bounds for solving the Diffie-Hellman variants in the generic group model. The most advantage is that we obtain the results through very very very simple techniques.
2/23

#RSAC
Discrete Logarithm Problem
 Discrete Logarithm (DL) Problem Input: , ,  and  = ;    Solution: 
3/23

#RSAC
Discrete Logarithm Problem
 Discrete Logarithm (DL) Problem Input: , ,  and  = ;    Solution: 
· Numerous cryptographic protocols have been proposed over cyclic groups  by assuming that the DL problem is computationally infeasible in the groups (e.g., elliptic curves).
3/23

#RSAC
Discrete Logarithm Problem
 Discrete Logarithm (DL) Problem Input: , ,  and  = ;    Solution: 
· Numerous cryptographic protocols have been proposed over cyclic groups  by assuming that the DL problem is computationally infeasible in the groups (e.g., elliptic curves).
· A number of DL algorithms have been proposed; · sub-exponential algorithms (e.g., NFS) working in specific groups, · ( ) time algorithms working in any cyclic groups.
3/23

#RSAC
Discrete Logarithm Problem
 Discrete Logarithm (DL) Problem Input: , ,  and  = ;    Solution: 
· Numerous cryptographic protocols have been proposed over cyclic groups  by assuming that the DL problem is computationally infeasible in the groups (e.g., elliptic curves).
· A number of DL algorithms have been proposed; · sub-exponential algorithms (e.g., NFS) working in specific groups, · ( ) time algorithms working in any cyclic groups.
· The latter is called generic algorithms, where ( ) times group operations is proved to be an information theoretic lower bound [Shoup@EC'97].
3/23

#RSAC
Diffie-Hellman Problem and Its Variants
 Computational Diffie-Hellman (CDH) Problem Input: , ,  and 1 = 1, 2 = 2 ; (1, 2)  2 Solution: 12
4/23

#RSAC
Diffie-Hellman Problem and Its Variants
 Computational Diffie-Hellman (CDH) Problem [DH@IEEE TIT'76] Input: , ,  and 1 = 1, 2 = 2 ; (1, 2)  2 Solution: 12
 k-Exponent Diffie-Hellman (k-EDH) Problem [MW@Crypto'96],[BDS@AC'98] Input: , ,  and  = ;    Solution: 
 k-Party Diffie-Hellman (k-PDH) Problem [Bis@IET Information Security'08] Input: , ,  and 1 = 1, ... ,  =  ; 1, ... ,    Solution: 1
 and so on
4/23

#RSAC
Diffie-Hellman Problem and Its Variants

 Computational Diffie-Hellman (CDH) Problem [DH@IEEE TIT'76] Input: , ,  and 1 = 1, 2 = 2 ; (1, 2)  2 Solution: 12

 k-Exponent Diffie-Hellman (k-EDH) Problem [MW@Crypto'96],[BDS@AC'98] Input: , ,  and  = ;    Solution: 

 k-Party Diffie-Hellman (k-PDH) Problem [Bis@IET Information Security'08] Input: , ,  and 1 = 1, ... ,  =  ; 1, ... ,    Solution: 1

 and so on

 We should try to study computational complexities of these problems. If possible, we want to

make computational reductions from the DL to these problems although it seems infeasible in

the standard computational models...

4/23

#RSAC
Generic Group Model (GGM)
 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary is not able to exploit group specific structures, is able to receive group elements only via abstract handles.
5/23

#RSAC
Generic Group Model (GGM)

 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary
is not able to exploit group specific structures,
is able to receive group elements only via abstract handles.

, ,    1 and  =  ; (1, 2)  2

, , , 1, 2

5/23

#RSAC
Generic Group Model (GGM)

 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary
is not able to exploit group specific structures,
is able to receive group elements only via abstract handles.

, ,    1 and  =  ; (1, 2)  2

, , , 1, 2

5/23

#RSAC
Generic Group Model (GGM)

 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary
is not able to exploit group specific structures,
is able to receive group elements only via abstract handles.

, ,    1 and  =  ; (1, 2)  2
00   01  1 02  2

, , , 1, 2 , , 00, 01, 02

5/23

Generic Group Model (GGM)

 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary
is not able to exploit group specific structures,
is able to receive group elements only via abstract handles.

, ,    1 and  =  ; (1, 2)  2
00   01  1 02  2

, , , 1, 2 , , 00, 01, 02

5/23

#RSAC


Generic Group Model (GGM)

 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary
is not able to exploit group specific structures,
is able to receive group elements only via abstract handles.

, ,    1 and  =  ; (1, 2)  2
00   01  1 02  2

, , , 1, 2 , , 00, 01, 02

01, 02 04

#RSAC

1  2 = 1+2
04  1+2

5/23

Generic Group Model (GGM)

 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary
is not able to exploit group specific structures,
is able to receive group elements only via abstract handles.

, ,    1 and  =  ; (1, 2)  2
00   01  1 02  2

, , , 1, 2 , , 00, 01, 02

01, 02 04
01,   

05

#RSAC

1  2 = 1+2
04  1+2
1  = 1
05  1

5/23

Generic Group Model (GGM)

 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary
is not able to exploit group specific structures,
is able to receive group elements only via abstract handles.

, ,    1 and  =  ; (1, 2)  2
00   01  1 02  2

, , , 1, 2 , , 00, 01, 02
XX

01, 02 04
01,    05

#RSAC

1  2 = 1+2
04  1+2
1  = 1
05  1

5/23

#RSAC
Generic Group Model (GGM)
 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary is not able to exploit group specific structures, is able to receive group elements only via abstract handles.
6/23

#RSAC
Generic Group Model (GGM)
 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary is not able to exploit group specific structures, is able to receive group elements only via abstract handles.
 Advantage of GGM Generic algorithms work in any groups. Information theoretic lower bounds for computational problems (e.g., ( ) for the DL).
6/23

#RSAC
Generic Group Model (GGM)
 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary is not able to exploit group specific structures, is able to receive group elements only via abstract handles.
 Advantage of GGM Generic algorithms work in any groups. Information theoretic lower bounds for computational problems (e.g., ( ) for the DL).
 Disadvantage of GGM There may be faster algorithms in concrete groups (e.g., sub-exponential DL algorithms).
6/23

#RSAC
Generic Group Model (GGM)
 Generic Group Model (GGM) [Shoup@EC'97] Restricted computational model, where a generic adversary is not able to exploit group specific structures, is able to receive group elements only via abstract handles.
 Advantage of GGM Generic algorithms work in any groups. Information theoretic lower bounds for computational problems (e.g., ( ) for the DL).
 Disadvantage of GGM There may be faster algorithms in concrete groups (e.g., sub-exponential DL algorithms).
Can we obtain similar results in less restricted computational model?
6/23

#RSAC
Algebraic Group Model (AGM)
 Algebraic Group Model (AGM) recently defined in [Fuchsbauer-Kiltz-Loss@Crypto'18], where an algebraic adversary is able to exploit group specific structures unlike the GGM, is able to compute group operation of given elements like the GGM.
7/23

#RSAC
Algebraic Group Model (AGM)

 Algebraic Group Model (AGM) recently defined in [Fuchsbauer-Kiltz-Loss@Crypto'18], where an algebraic adversary
is able to exploit group specific structures unlike the GGM,
is able to compute group operation of given elements like the GGM.

, ,    1 and  =  ; (1, 2)  2

, , , 1, 2

7/23

#RSAC
Algebraic Group Model (AGM)

 Algebraic Group Model (AGM) recently defined in [Fuchsbauer-Kiltz-Loss@Crypto'18], where an algebraic adversary
is able to exploit group specific structures unlike the GGM,
is able to compute group operation of given elements like the GGM.

, ,    1 and  =  ; (1, 2)  2

, , , 1, 2

  01122  = 0, 1, 2  3

7/23

#RSAC
Algebraic Group Model (AGM)

 Algebraic Group Model (AGM) recently defined in [Fuchsbauer-Kiltz-Loss@Crypto'18], where an algebraic adversary
is able to exploit group specific structures unlike the GGM,
is able to compute group operation of given elements like the GGM.

, ,    1 and  =  ; (1, 2)  2

, , , 1, 2 (, )

  01122  = 0, 1, 2  3

7/23

#RSAC
Algebraic Group Model (AGM)

 Algebraic Group Model (AGM) recently defined in [Fuchsbauer-Kiltz-Loss@Crypto'18], where an algebraic adversary
is able to exploit group specific structures unlike the GGM,
is able to compute group operation of given elements like the GGM.

, ,    1 and  =  ; (1, 2)  2

, , , 1, 2 (, )

  01122  = 0, 1, 2  3

 Advantage of AGM AGM lies in between the standard model and the GGM. AGM is able to derive information theoretic lower bounds in the GGM under simple analysis.
7/23

#RSAC
Previous Results
 [Fuchsbauer-Kiltz-Loss@Crypto'18] Tight reduction from the DL to the CDH (Non-tight) reduction from the DL to the (interactive) strong Diffie-Hellman problem (equivalent to IND-CCA security of Hashed ElGamal encryption scheme in the ROM) (Non-tight) reduction from the DL to the (interactive) LRSW problem (equivalent to UF-CMA security of Camenisch-Lysyanskaya signatures) IND-CCA1 security of the ElGamal encryption scheme under the q-DDH assumption UF-CMA security of Boneh-Lynn-Shacham signatures under the DL assumption The security of Groth's ZK-SNARK under the q-DL assumption
8/23

#RSAC
Previous Results
 [Fuchsbauer-Kiltz-Loss@Crypto'18] Tight reduction from the DL to the CDH (Non-tight) reduction from the DL to the (interactive) strong Diffie-Hellman problem (equivalent to IND-CCA security of Hashed ElGamal encryption scheme in the ROM) (Non-tight) reduction from the DL to the (interactive) LRSW problem (equivalent to UF-CMA security of Camenisch-Lysyanskaya signatures) IND-CCA1 security of the ElGamal encryption scheme under the q-DDH assumption UF-CMA security of Boneh-Lynn-Shacham signatures under the DL assumption The security of Groth's ZK-SNARK under the q-DL assumption
Can we obtain similar results for other computational problems?
8/23

#RSAC
Our Results
We successfully provide tight reductions from the DL to the CDH, k-EDH, k-PDH, k-linear, BDH. We formalize master theorems to indicate when our technique is applicable. The tightness is not an advantage but a limitation of our results. We continue the research for the Matrix CDH and the kernel Matrix DH.
9/23

#RSAC
Our Results

We successfully provide tight reductions from the DL to the CDH, k-EDH, k-PDH, k-linear, BDH. We formalize master theorems to indicate when our technique is applicable. The tightness is not an advantage but a limitation of our results. We continue the research for the Matrix CDH and the kernel Matrix DH.

 FKL Reduction
DL
 Our Reduction

standard AGM
DL

SDH
standard AGM
9/23

standard standard
CDH

CDH

#RSAC
FKL Reduction: DL to CDH

 Constructing a DL algorithm by using a SDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

10/23

#RSAC
FKL Reduction: DL to CDH

 Constructing a DL algorithm by using a SDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 

10/23

#RSAC
FKL Reduction: DL to CDH

 Constructing a DL algorithm by using a SDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 

  01  = 0, 1  2

10/23

#RSAC
FKL Reduction: DL to CDH

 Constructing a DL algorithm by using a SDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , ,  (, )

  01  = 0, 1  2

10/23

#RSAC
FKL Reduction: DL to CDH

 Constructing a DL algorithm by using a SDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , ,  (, )

  01  = 0, 1  2

2 = 01 = 0+1

10/23

#RSAC
FKL Reduction: DL to CDH

 Constructing a DL algorithm by using a SDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , ,  (, )

  01  = 0, 1  2

2 - 1 - 0 = 0 mod 

2 = 01 = 0+1

10/23

#RSAC
FKL Reduction: DL to CDH

 Constructing a DL algorithm by using a SDH algorithm in the AGM only once

, ,    1 and  = ;   

, , ,  

, , ,  (, )

  01  = 0, 1  2

2 - 1 - 0 = 0 mod 

2 = 01 = 0+1

10/23

#RSAC
FKL Reduction: DL to CDH

 Constructing a DL algorithm by using a SDH algorithm in the AGM only once

, ,    1 and  = ;   

, , ,  

, , ,  (, )

  01  = 0, 1  2

2 - 1 - 0 = 0 mod 

2 = 01 = 0+1

 The reduction in the AGM implies the computational equivalence between the DL and the CDH.  Information theoretic lower bounds of the CDH in the GGM is ( ) group operations since
the above reduction is tight.
10/23

#RSAC
Our Direct Reduction: DL to CDH

 Constructing a DL algorithm by using a CDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

11/23

#RSAC
Our Direct Reduction: DL to CDH

 Constructing a DL algorithm by using a CDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

   1   = , 2     = +

11/23

#RSAC
Our Direct Reduction: DL to CDH

 Constructing a DL algorithm by using a CDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 1, 2

   1   = , 2     = +

11/23

#RSAC
Our Direct Reduction: DL to CDH

 Constructing a DL algorithm by using a CDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 1, 2

  01122  = 0, 1, 2  3

   1   = , 2     = +

11/23

#RSAC
Our Direct Reduction: DL to CDH

 Constructing a DL algorithm by using a CDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 1, 2 (, )

  01122  = 0, 1, 2  3

   1   = , 2     = +

11/23

#RSAC
Our Direct Reduction: DL to CDH

 Constructing a DL algorithm by using a CDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 1, 2 (, )

  01122  = 0, 1, 2  3

   1   = , 2     = +

12 = 01122 = 0+11+22
(+) = 0+1+2(+)

11/23

#RSAC
Our Direct Reduction: DL to CDH

 Constructing a DL algorithm by using a CDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 1, 2 (, )

  01122  = 0, 1, 2  3

   1   = , 2     = +

12 = 01122 = 0+11+22
(+) = 0+1+2(+)

  +  = 0 + 1 + 2( + ) mod   2 +  - 1 - 2  - 0 + 2 = 0 mod 

11/23

#RSAC
Our Direct Reduction: DL to CDH

 Constructing a DL algorithm by using a CDH algorithm in the AGM only once

, ,    1 and  = ;   

, , ,  

, , , 1, 2 (, )

  01122  = 0, 1, 2  3

   1   = , 2     = +

12 = 01122 = 0+11+22
(+) = 0+1+2(+)

  +  = 0 + 1 + 2( + ) mod   2 +  - 1 - 2  - 0 + 2 = 0 mod 

11/23

#RSAC
Our Direct Reduction: DL to k-EDH

 Constructing a DL algorithm by using a k-EDH algorithm in the AGM only once

, ,    1 and  = ;   

, , ,  

, , ,  (, )

  01  = 0, 1  2

 = 1 + 0 mod 

 = 01 = 0+1

12/23

#RSAC
Our Direct Reduction: DL to k-PDH

 Constructing a DL algorithm by using a k-PDH algorithm in the AGM only once

, ,    1 and  = ;   

, , ,  

, , ,  (, )

  011    = 0, 1, ... ,   +1

2, ... ,   -1 1  ,      = +

1 = 011   = 0+11++
 +2  + = 0+1+2 +2 ++(+)

  + 2   +  = 0 + 1 + 2  +  +  +   +  mod 

13/23

#RSAC
Our Direct Reduction: DL to BDH

 Constructing a DL algorithm by using a BDH algorithm in the AGM only once

, , , ,    1  = ;   

, , , , , 

14/23

#RSAC
Our Direct Reduction: DL to BDH

 Constructing a DL algorithm by using a BDH algorithm in the AGM only once

, , , ,    1  = ;   

, , , , , 

, , , , , 

2, 3  2 1  ,      = +

14/23

#RSAC
Our Direct Reduction: DL to BDH

 Constructing a DL algorithm by using a BDH algorithm in the AGM only once

, , , ,    1  = ;   

, , , , , 

, , , , , 
(, )

   ,  0 , 1 1
  = 0, 1, ...  10

2, 3  2 1  ,      = +

14/23

#RSAC
Our Direct Reduction: DL to BDH

 Constructing a DL algorithm by using a BDH algorithm in the AGM only once

, , , ,    1  = ;   

, , , , , 

, , , , , 
(, )

   ,  0 , 1 1
  = 0, 1, ...  10

2, 3  2 1  ,      = +  ,   =  ,  0 , 1 1  , 2 2 , 3 3 1, 1 4 1, 2 5 1, 3 6  2, 2 7 2, 3 8 3, 3 9   + 2  + 3 = 0 + 1 + 2  + 2 + 3  + 3 + 42 + 5  + 2 + 6  + 3 +7  + 2 2 + 8  + 2  + 3 + 9  + 3 2 mod 
14/23

#RSAC
Our Direct Reduction: DL to BDH

 Constructing a DL algorithm by using a BDH algorithm in the AGM only once

, , , ,    1  = ;   

, , , , , 


, , , , , 
(, )

   ,  0 , 1 1
  = 0, 1, ...  10

2, 3  2 1  ,      = +  ,   =  ,  0 , 1 1  , 2 2 , 3 3 1, 1 4 1, 2 5 1, 3 6  2, 2 7 2, 3 8 3, 3 9   + 2  + 3 = 0 + 1 + 2  + 2 + 3  + 3 + 42 + 5  + 2 + 6  + 3 +7  + 2 2 + 8  + 2  + 3 + 9  + 3 2 mod 
14/23

#RSAC
Obtaining Non-zero Modular Equations
1 = , 2 = +2, 3 = +3  ,   =  ,  0 , 1 1  , 2 2 , 3 3 1, 1 4 1, 2 5 1, 3 6  2, 2 7 2, 3 8 3, 3 9
  + 2  + 3 = 0 + 1 + 2  + 2 + 3  + 3 + 42 + 5  + 2 + 6  + 3 +7  + 2 2 + 8  + 2  + 3 + 9  + 3 2 mod 
15/23

#RSAC
Obtaining Non-zero Modular Equations
1 = , 2 = +2, 3 = +3  ,   =  ,  0 , 1 1  , 2 2 , 3 3 1, 1 4 1, 2 5 1, 3 6  2, 2 7 2, 3 8 3, 3 9
  + 2  + 3 = 0 + 1 + 2  + 2 + 3  + 3 + 42 + 5  + 2 + 6  + 3 +7  + 2 2 + 8  + 2  + 3 + 9  + 3 2 mod 
· The degree of the left hand side of the modular equation is 3. · The degree of the right hand side of the modular equation is at most 2.
15/23

#RSAC
Obtaining Non-zero Modular Equations
1 = , 2 = +2, 3 = +3  ,   =  ,  0 , 1 1  , 2 2 , 3 3 1, 1 4 1, 2 5 1, 3 6  2, 2 7 2, 3 8 3, 3 9
  + 2  + 3 = 0 + 1 + 2  + 2 + 3  + 3 + 42 + 5  + 2 + 6  + 3 +7  + 2 2 + 8  + 2  + 3 + 9  + 3 2 mod 
· The degree of the left hand side of the modular equation is 3. · The degree of the right hand side of the modular equation is at most 2.
3 + 2 + 3 - 4 - 5 - 6 - 7 - 8 - 9 2 + 23 - 1 - 2 - 3 - 25 - 36 - 227 - 2 + 3 8 - 239  - 0 + 22 + 33 + 227 + 238 + 329 = 0 mod 
15/23

#RSAC
Obtaining Non-zero Modular Equations
1 = , 2 = +2, 3 = +3
 ,   =  ,  0 , 1 1  , 2 2 , 3 3 1, 1 4 1, 2 5 1, 3 6  2, 2 7 2, 3 8 3, 3 9
  + 2  + 3 = 0 + 1 + 2  + 2 + 3  + 3 + 42 + 5  + 2 + 6  + 3 +7  + 2 2 + 8  + 2  + 3 + 9  + 3 2 mod 
· The degree of the left hand side of the modular equation is 3. · The degree of the right hand side of the modular equation is at most 2.
3 + 2 + 3 - 4 - 5 - 6 - 7 - 8 - 9 2 + 23 - 1 - 2 - 3 - 25 - 36 - 227 - 2 + 3 8 - 239  - 0 + 22 + 33 + 227 + 238 + 329 = 0 mod  · The modular polynomial has to be non-zero.
15/23

#RSAC
Our Direct Reduction: DL to CDH

 Constructing a DL algorithm by using a CDH algorithm in the AGM only once

, ,    1 and  = ;   

, , ,  

, , , 1, 2 (, )

  01122  = 0, 1, 2  3

   1   = , 2     = +

12 = 01122 = 0+11+22
(+) = 0+1+2(+)

  +  = 0 + 1 + 2( + ) mod   2 +  - 1 - 2  - 0 + 2 = 0 mod 

16/23

#RSAC
Our Direct Reduction: DL to k-EDH

 Constructing a DL algorithm by using a k-EDH algorithm in the AGM only once

, ,    1 and  = ;   

, , ,  

, , ,  (, )

  01  = 0, 1  2

 = 1 + 0 mod 

 = 01 = 0+1

17/23

#RSAC
Our Direct Reduction: DL to k-PDH

 Constructing a DL algorithm by using a k-PDH algorithm in the AGM only once

, ,    1 and  = ;   

, , ,  

, , ,  (, )

  011    = 0, 1, ... ,   +1

2, ... ,   -1 1  ,      = +

1 = 011   = 0+11++
 +2  + = 0+1+2 +2 ++(+)

  + 2   +  = 0 + 1 + 2  +  +  +   +  mod 

18/23

#RSAC
Master Theorem in Cyclic Groups
 Generalized Computational Diffie-Hellman (GDH) Problem Input: , ,  and  = (1,...,,1,...,) ; (1, ... , , 1, ... , )  + Solution: (1,...,)
19/23

#RSAC
Master Theorem in Cyclic Groups
 Generalized Computational Diffie-Hellman (GDH) Problem Input: , ,  and  = (1,...,,1,...,) ; (1, ... , , 1, ... , )  + Solution: (1,...,)
 Computational Diffie-Hellman (CDH) Problem Input: , ,  and 1 = 1, 2 = 2 ; (1, 2)  2 Solution: 12
 k-Exponent Diffie-Hellman (k-EDH) Problem Input: , ,  and  = ;    Solution: 
 k-Party Diffie-Hellman (k-PDH) Problem Input: , ,  and 1 = 1, ... ,  =  ; 1, ... ,    Solution: 1
19/23

#RSAC
Master Theorem in Cyclic Groups
 Generalized Computational Diffie-Hellman (GDH) Problem Input: , ,  and  = (1,...,,1,...,) ; (1, ... , , 1, ... , )  + Solution: (1,...,)
20/23

#RSAC
Master Theorem in Cyclic Groups
 Generalized Computational Diffie-Hellman (GDH) Problem Input: , ,  and  = (1,...,,1,...,) ; (1, ... , , 1, ... , )  + Solution: (1,...,)
We can provide a reduction from the DL to the GDH when deg1,...,  1, ... , , 1, ... ,  = 0 or 1 (to embed the DL solution into GDH instance) deg  1, ... ,   0 and 1 (so that the modular polynomial is non-zero)
20/23

#RSAC
Our Direct Reduction: DL to GDH

 Constructing a DL algorithm by using a GDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

21/23

#RSAC
Our Direct Reduction: DL to GDH

 Constructing a DL algorithm by using a GDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 

1, ... ,    1, ... , -1   1  ,    +   = (1,...,,1,...,)

21/23

#RSAC
Our Direct Reduction: DL to GDH

 Constructing a DL algorithm by using a GDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 

1, ... ,    1, ... , -1   1  ,    +   = (1,...,,1,...,)
deg1,...,  1, ... , , 1, ... ,  = 0 or 1 (to embed the DL solution into GDH instance)
21/23

#RSAC
Our Direct Reduction: DL to GDH

 Constructing a DL algorithm by using a GDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , , 

22/23

#RSAC
Our Direct Reduction: DL to GDH

 Constructing a DL algorithm by using a GDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , ,  (, )

  011   = 0, 1, ...  

 1, ... ,  = 0 +  1, ... , , 1, ... ,  mod 

22/23

#RSAC
Our Direct Reduction: DL to GDH

 Constructing a DL algorithm by using a GDH algorithm in the AGM only once

, ,    1 and  = ;   

, , , 

, , ,  (, )

  011   = 0, 1, ...  

 1, ... ,  = 0 +  1, ... , , 1, ... ,  mod 

· deg1,...,  1, ... , , 1, ... ,  = 0 or 1 (to embed the DL solution into GDH instance)
· deg  1, ... ,   0 and 1 (so that the modular polynomial is non-zero)

The modular polynomial is non-zero!

22/23

#RSAC
Our Direct Reduction: DL to GDH

 Constructing a DL algorithm by using a GDH algorithm in the AGM only once

, ,    1 and  = ;   

, , ,  

, , ,  (, )

  011   = 0, 1, ...  

 1, ... ,  = 0 +  1, ... , , 1, ... ,  mod 

· deg1,...,  1, ... , , 1, ... ,  = 0 or 1 (to embed the DL solution into GDH instance)
· deg  1, ... ,   0 and 1 (so that the modular polynomial is non-zero)

The modular polynomial is non-zero!

22/23

#RSAC
Conclusion
We provided tight reductions from the DL to several variants of Diffie-Hellman problems in the AGM defined by [FKL@Crypto'18].
We define the AGM in symmetric bilinear groups by following [FKL@Crypto'18]'s definition in cyclic groups. We formalized master theorems to indicate the Diffie-Hellman variants that can be reduced to from the DL by following our approach. Our master theorem does not include the k-linear problem. Therefore, we provided an tailormade reduction for the k-linear problem.
As future works, we try to study the Matrix CDH and the Kernel Matrix DH. Other interesting future works are analogous results in composite-order groups, decision problems, or non-tight reductions.
23/23

