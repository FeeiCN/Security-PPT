SESSION ID: CRYP-R03
Poly-Logarithmic Side Channel Rank Estimation via Exponential Sampling

Liron David
School of Electrical Engineering Tel-Aviv University

Prof. Avishai Wool
School of Electrical Engineering Tel-Aviv University

#RSAC

#RSAC
Side Channel Attack
Reveals the secret key of an encryption algorithm by using the side information that leaks from its implementation. For example: ­ Power consumption ­ Electro-magnetic radiation ­ Sound ­ Cache ­...
2

#RSAC
Side Channel Attack
128 bits
Secret Key $%$#@!@#$%^&*&^%$%^&%^%#@$%^&$#@$%^&#@!#$!~!#%&$*&!^
3

#RSAC
Side Channel Attack
It is difficult to reveal all 128 bits in one try...
128 bits
Secret Key $%$#@!@#$%^&*&^%$%^&%^%#@$%^&$#@$%^&#@!#$!~!#%&$*&!^
4

#RSAC
Side Channel Attack
The attacker reveals a small part of bits each time · Denoted by subkeys
8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits 8 bits
Secret Key $%$#@!@#$%^&*&^%$%^&%^%#@$%^&$#@$%^&#@!#$!~!#%&$*&!^
5

Side Channel Attack
Secret Key

#RSAC

8 bits
$%$#@!@#
The first Subkey

8 bits
@$%^#&*!

8 bits
^*$*$&@%

Subkeys
00000000 00000001 00000010 00000011 00000100 00000101 00000110 00000111 00001000
... 11111110 11111111
6

Probabilities
0.00001 0.00004 0.00005 0.002 0.004 0.003 0.001 0.003 0.002
0.0004 0.0002

Side Channel Attack
Secret Key

#RSAC

8 bits
$%$#@!@#
The first Subkey

8 bits
@$%^#&*!

8 bits
^*$*$&@%

Subkeys

Probabilities

We sort the subkeys according to their probabilities in decreasing order...

00000100

0.004

00000101

0.003

00001000

0.002

00000110

0.001

00000111

0.003

00000000

0.00001

00000010

0.00005

11111110

0.0004

11111111

0000...0001

0.00004

00000011

0.0002 0.002

7

Side Channel Attack
Secret Key
Sorted subkeys in decreasing order of probabilites

#RSAC

8 bits
$%$#@!@#
The first Subkey

8 bits
@$%^#&*!

(P1,K1)
00010100 0.0010 10110111 0.005 11011011 0.005 01000011 0.0045 01110000 0.0043 11011010 0.003 10101110 0.003 01001111 0.002 10100110 0.0015

...
00000000
11111111

...
0.000001
0.000001

8

8 bits
^*$*$&@%

Side Channel Attack
Secret Key
Sorted subkeys in decreasing order of probabilites

#RSAC

8 bits
$%$#@!@#

8 bits
@$%^#&*!

8 bits
^*$*$&@%

The Second Subkey

00010100 10110111 11011011 01000011 01110000 11011010 10101110 01001111 10100110
...
00000000 11111111
9

(P1,K1)
0.0010 0.005 0.005 0.0045 0.0043 0.003 0.003 0.002 0.0015
...
0.000001 0.000001

00010100 10110111 11011011 01000011 01110000 11011010 10101110 01001111 10100110
...
00000000 11111111

(P2,K2)
0.0010 0.005 0.005 0.0045 0.0043 0.003 0.003 0.002 0.0015
...
0.000001 0.000001

Side Channel Attack
d independent subkey spaces (Ki,Pi) each of size N sorted in decreasing order of proabilities.

#RSAC
(P1,K1) (P2,K2) (P3,K3) ... (Pd,Kd)

10

#RSAC
Side Channel Attack
(P1,K1) (P2,K2) (P3,K3) ... (Pd,Kd)
The attacker goes over the full keys in sorted order from the most likely to the least, till he reaches the correct key. The probability of a full key is defined as (P1...d,K1...d) the product of its subkey's probabilities.
11

#RSAC
Side Channel Attack

An important question is:

(P1,K1) (P2,K2) (P3,K3) ... (Pd,Kd)

How many full keys the attacker needs to try before he reaches the correct key.

This allows estimating the strength of the chosen secret key after an attack has been performed.

(P1...d,K1...d)

12

#RSAC
Side Channel Attack

So assume we know
The correct key k* and its probability p*
The d subkey spaces (Ki,Pi)

(P1,K1) (P2,K2) (P3,K3) ... (Pd,Kd)

The goal : to estimate the number of full keys with probability higher than p*
This is rank(k*)

(P1...d,K1...d)

13

#RSAC
Side Channel Attack

The optimal solution
enumerates and counts the full keys in optimal-order
till reaches to k*

(P1,K1) (P2,K2) (P3,K3)

... (Pd,Kd)

(P1...d,K1...d)

14

#RSAC
Side Channel Attack

(P1,K1) (P2,K2) (P3,K3) ... (Pd,Kd)
However, key space size is 2128

Enumerating the whole key space in optimal-order is impossible

Hence, estimating a rank without enumeration is of great interest.

(P1...d,K1...d)

15

Our ESrank Algorithm: For d=2

Given The correct key k* whose probability is p* 2 subkeys (P1,K1), (P2,K2)
rank (k*) is the number of the pairs (i,j) such that P1[i]P2[j]  p*

. . .

N
3 2 1
1 2 3 ...

16

#RSAC
(P1,K1) (P2,K2)
N

Our ESrank Algorithm: For d=2

We sum the length of bars :
Start with i=1, j=N, decrease j till P1[i]P2[j]  p* then increment i and repeat till i=N or j=1
O(N) running time.

. . .

N
3 2 1
1 2 3 ...

17

#RSAC
(P1,K1) (P2,K2)
N

#RSAC

Our ESrank Algorithm: For d=2 with Sampling

To make this algorithm faster,

(P1,K1) (P2,K2)
1 2
4

we use exponential sampling.

8

Intuitively, sample indices at powers of  > 1.
16

For example, If =2 the sampled indices are: 1,2,4,8,16,32,...
32

18

#RSAC

Our ESrank Algorithm: For d=2 with Sampling

1

2

3

Since the power of  are not necessarily integers

4 6

9

maintain an invariant

on the ratio between sampled indices:

  13

> 

i'th sampled index

19

(i-1)'th sampled index 

 (i+1)'th sampled index

(i-1)'th sampled index > 

28

19

#RSAC

Our ESrank Algorithm: For d=2 with Sampling

1

2

3

The first indices might not maintain the invariant

4 6

since the ratio between consecutive indices is >  9

Let b be the smallest index

  13

> 

that maintains the invariant.

19

Take the first b indices without sampling

Sample the rest with ratio 
28

20

Our ESrank Algorithm: For d=2 with Sampling

b=2

1 2

4

 =2 8

> =2

b=2

1 2

3

4

6

9

 =1.5 13
16

If =2 and b=2 the sampled indices are: 1,2,4,8,16,32,...
32

19
For =1.5 and b=2 the sampled indices are: 1,2,3,4,6,9,13,19,28,...
28
21

#RSAC
> =1.5

#RSAC

Our ESrank Algorithm: For d=2 with Sampling

1

2

3

The sampled distribution is of size (log )

4 6

9

  13

> 

19

28 22

Our ESrank Algorithm: For d=2 with Sampling

Now, given

two sampled distibutions

N

and the correct key k*

#RSAC
(P1,K1) (P2,K2)

. . .

The goal: To calculate rank(k*)

b 1

1b

. . .

N

23

#RSAC
Our ESrank Algorithm: For d=2 with Sampling

We only have an access to

the sampled indices

N

(P1,K1) (P2,K2)

. . .

Therefore, we calculate: upper bound for rank(k*) lower bound for rank(k*)

b 1

1b

. . .

N

24

Our ESrank Algorithm: For d=2 with Sampling
We will calculate:
N
upper bound for rank(p*) lower bound for rank(p*)

#RSAC
(P1,K1) (P2,K2)

. . .

b 1

1b

. . .

N

25

Our ESrank Algorithm: For d=2 with Sampling
We will calculate:
N
upper bound for rank(p*) lower bound for rank(p*)

#RSAC
(P1,K1) (P2,K2)

. . .

b 1

1b

. . .

N

26

Our ESrank Algorithm: For d=2 with Sampling
We will calculate:
N
upper bound for rank(p*) lower bound for rank(p*)

#RSAC
(P1,K1) (P2,K2)

. . .

b 1

1b

. . .

N

27

Our ESrank Algorithm: For d=2 with Sampling
We will calculate:
N
upper bound for rank(p*) lower bound for rank(p*)

#RSAC
(P1,K1) (P2,K2)

. . .

b 1

1b

. . .

N

28

Our ESrank Algorithm: For d=2 with Sampling
We will calculate:
N
upper bound for rank(p*) lower bound for rank(p*)

#RSAC
(P1,K1) (P2,K2)

. . .

b 1

1b

. . .

N

29

Our ESrank Algorithm: For d=2 with Sampling
We will calculate:
N
upper bound for rank(p*) lower bound for rank(p*)

#RSAC
(P1,K1) (P2,K2)

. . .

b 1

1b

. . .

N

30

Our ESrank Algorithm: For d=2 with Sampling
We will calculate:
N
upper bound for rank(p*) lower bound for rank(p*)

#RSAC
(P1,K1) (P2,K2)

. . .

b 1

1b

. . .

N

31

Our ESrank Algorithm: For d=2 with Sampling
We will calculate:
N
upper bound for rank(p*) lower bound for rank(p*)

#RSAC
(P1,K1) (P2,K2)

. . .

b 1

1b

. . .

N

32

Our ESrank Algorithm: For d=2 with Sampling
We will calculate:
N
upper bound for rank(p*) lower bound for rank(p*)

#RSAC
(P1,K1) (P2,K2)

. . .

b 1

1b

. . .

N

33

#RSAC
Our ESrank Algorithm: For d=2 with Sampling

The running time is linear

in the size of the

N

sampled distribution,

. . .

Therefore  log 

The ratio between

the upper and the lower bounds

for a given correct key

b 1

is bounded by < 2

1b

. . .

(P1,K1) (P2,K2)
N

34

#RSAC
ERank For d>2
d subkey distributions

#RSAC
ERank For d>2
Sample each distribution s.t. the sampled indices maintain the invariant with  and b Therefore, each of size log 

#RSAC
ERank For d>2
Merge each two sampled distributions

ERank For d>2

 

> 

 

  > 
Merge

Two sampled distributions
Each maintains the sampling invariant with  and b
log 

38

#RSAC
> 
One sampled distribution maintains the sampling invariant with  and b log 2 = 2 log 

#RSAC

ERank For d>2

 

> 

Calculate the probabilities of all
>  the (x,y) pairs

Sort the pairs in decreasing order of probabilities

log 

log 
Sample with  and b

log 2 = 2 log 
39

log  2

log  2

Calculate the upper and lower bounds of the pairs in accumulative way, in one linear pass over the pairs log  2

#RSAC
ERank For d>2
Merge each two sampled distribution with  and b into one sampled merged distribution with  and b
40

#RSAC
ERank For d>2
The ratio between the final upper and lower bounds of a given key is bounded by < 2d-2
Apply ESRank for two-dimensions
41

#RSAC
Results
Our probability distributions are gathered from a specific SCA against AES with 128-bits keys. It contains d = 16 probability lists each of size N = 28 We merge them into d = 8 lists each of size N = 216 The distributions are sorted in non-increasing order of probability.
42

#RSAC
Results
We measured the upper bound, lower bound, time and space for each trace using ESrank and the Histogram rank estimation of Glowacz et al. [GGPSS15]. We run with different values of  and histogram size B.
43

Results - Accuracy
Excellent accuracy of less than 1 bit margin between ESrank lower and upper bounds
1.2

Accuracy (bits)

1 bits 1
The y-0a.8 xis is the ratio between ESrank0.6 upper and lower bounds (number of bits)
0.4

0.2

0 0

20

40 The x-60axis is the80 Histogra1m00 ranks 120

(number of bits) log(Rank) Gamma=1.05 Gamma=1.033 Gamma=1.025

44

#RSAC
=1.05 =1.033 =1.025
140

#RSAC
Results ­ Time and Space
ESrank performance is on-par with the Histogram algorithm:
ESrank algorithm gives: · Excellent accuracy of less
than 1 bit · in less than 1 second · on a standard laptop
using 6.5 MB RAM.
45

#RSAC
Conclusion
In this paper we propose a new, simple and effective new rank estimation method called ESrank. Our main idea is to use exponential sampling to drastically reduce the algorithm's complexity. We prove ESrank has a poly-logarithmic time- and spacecomplexity. ESrank is simple to build from scratch, and requires no algorithmic tools beyond a sorting function.
46

