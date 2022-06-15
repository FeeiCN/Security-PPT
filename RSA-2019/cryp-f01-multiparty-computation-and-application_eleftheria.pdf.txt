SESSION ID: CRYP-F01
Multiparty Computation and Application

Eleftheria Makri
Lecturer/Researcher Imec-COSIC, KU Leuven, BE & Saxion University of Applied Sciences, NL @MakriEleftheria

#RSAC

EPIC: Efficient Private Image Classification (or: Learning from the Masters)
E. Makri, D. Rotaru, N. P. Smart, F. Vercauteren

#RSAC
EPIC: Efficient Private Image Classification
4

#RSAC
Feature Extraction
5

Transfer Learning Feature Extraction (or: Learning from #RSAC the Masters)
6

#RSAC
7

EPIC Security
Active Security EPIC

#RSAC

vs.

Passive Security

All other protocols in the related work

8

#RSAC
Step 1: Create the ML model

Alice
Inception­v3 CNN

Linear SVM

Dragos Rotaru

9

9

#RSAC
Step 2: Alice secret shares the ML model


 Alice

Charlie Bob

10

#RSAC
Step 2: Alice secret shares the ML model



 Charlie

Alice

Bob

Dragos

Rotaru

+ + = 1 2 3

11

#RSAC
Step 3: Bob extracts features

Bob
Inception­v3 CNN

Features



Dragos Rotaru

12

12

#RSAC
Step 4: Bob secret shares features

 Alice

 Charlie

Bob

Dragos Rotaru

13

Step 4: Bob secret shares features

 

Alice



Bob

+ + 1

2

3

  Charlie
Dragos Rotaru
= CNN-Feat(

14

#RSAC
)

#RSAC
Step 5: Parties use MPC to help Charlie compute label of SVM-Alice(Bob-Image)

 

Alice


 Charlie



Bob

15

#RSAC
Step 5: Parties use MPC to help Charlie compute label of SVM-Alice(Bob-Image)

 

Alice


 Charlie
***"Florist"***



Bob

16

#RSAC
Video of the Demo of our work will appear here
17

#RSAC
EPIC Performance ­ Simple Variant

Computation Cost

Runtimes (s)

4

3.5

3

2.5

2

1.5

1

0.5

0 CIFAR-10
(88.8% accuracy)

MIT-67 (72.2% accuracy)

Caltech-101 (91.4% accuracy)

Offline Online Total

Communication Cost

Communication (MB)
300

250

200

150

100

50

0 CIFAR-10
(88.8% accuracy)

MIT-67 (72.2% accuracy)

Caltech-101 (91.4% accuracy)

Offline Online Total

18

Performance of the state-of-the-art private image

#RSAC

classification

Computation Cost

Communication Cost

Runtimes (s)
1000

Communication (MB)
10000

100

1000

10 100

1

MiniONN*

0.1

(81.61% accuracy)

Gazelle** (81.61% accuracy)

EPIC (88.8% accuracy)

10

0.01 0.001

Offline Online Total

1 MiniONN*
(81.61% accuracy) 0.1

Gazelle** (81.61% accuracy)

EPIC (88.8% accuracy)

Offline Online Total

* Jian Liu, Mika Juuti, Yao Lu, N. Asokan. Oblivious Neural Network Predictions via MiniONN Transformations. In Proceedings of the 2017 ACM SIGSAC Conference on Computer and Communications Security (pp. 619-631). ACM.

** Chiraag Juvekar, Vinod Vaikuntanathan, and Anantha Chandrakasan. GAZELLE: A low latency framework for secure neural network inference. In 27th USENIX Security Symposium (USENIX Security '18), Baltimore, MD, 2018.

USENIX Association.

19

#RSAC
EPIC Efficiency Gain over the state-of-the-art
EPIC vs. Gazelle1 on CIFAR-10:
­ 34 times faster runtime; ­ 50 times improvement of communication cost; ­ 7% higher classification accuracy.
EPIC vs. Gazelle1 with the same accuracy:
­ 700 times faster runtime; ­ 500 times improvement of communication cost.
1 Chiraag Juvekar, Vinod Vaikuntanathan, and Anantha Chandrakasan. GAZELLE: A low latency framework for secure neural network inference. In 27th USENIX Security Symposium (USENIX Security '18), Baltimore, MD, 2018. USENIX Association.
20

#RSAC
Now what?
What would transform EPIC to a LEGENDARY solution?
­ Maintain security ­ Maintain or increase efficiency ­ Increase accuracy!
Any ideas on how to do this (using MPC)?
­ Talk to me during the break, or ­ Contact me offline at: eleftheria.makri@esat.kuleuven.be
21

