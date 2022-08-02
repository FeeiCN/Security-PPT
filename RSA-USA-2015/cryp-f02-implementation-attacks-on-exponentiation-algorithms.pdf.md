Exploiting Collisions in Addition Chain-based Exponentiation Algorithms Using a Single Trace

Exploiting Collisions in Addition Chain-based Exponentiation Algorithms Using a Single Trace
Neil Hanley, HeeSeok Kim and Michael Tunstall

Collision Attacks
· Referred to in the literature as:
 Bigmac attack (Walter 2002)  Horizontal-Vertical attacks  Correlation-collision attack
· Class of attacks looking for intermediate values that are the same at two points in an algorithm
 Identical operand(s) for operations  Result of one operation being used as the input to another operation
· We describe versions of these attacks applied to a single trace
 Applicable to blinded/ephemeral exponents

3

©2015 Rambus Cryptography Research Division

 We note that 0 in round  ...

4

©2015 Rambus Cryptography Research Division

 We note that 0 in round , will be the same as the first operand of the first operation in round  + 1.

5

©2015 Rambus Cryptography Research Division

Implementing an Attack

· We considered a single trace, taken during a 192-bit scalar multiplication
 Unknown (blinded) message  Single ephemeral exponent  Corresponding to an implementation of ECDSA
· First platform ARM7TDMI
 Clocked at 7.37 MHz  Assembly implementation of basic operations
· Second platform SASEBO-G
 Clocked at 24 MHz  Implementation in VHDL

6

©2015 Rambus Cryptography Research Division

Sample Trace ­ ARM7TDMI

7

©2015 Rambus Cryptography Research Division

Sample Trace ­ SASEBO-G

8

©2015 Rambus Cryptography Research Division

Attacking Joye's Add-Only Algorithm

· Break a trace into subtraces corresponding to individual operations
1, 2, 3, ... , 
· Generate a mean subtrace and subtract it from each subtrace. 1, 2, 3, ... , 
· We denote each these -point subtraces as
 = 1,1 ... 1,, 2,1 ... 2,, ... , ,1 ... ,
where:  = ,1 ... , - 1 ...  = 
· Generate a trace of correlation coefficients of the same size as the subtraces, assuming that the collision occurs in every round.
 =  2, 4, ... , -2 , 3, 5, ... , -1

9

©2015 Rambus Cryptography Research Division CONFIDENTIAL

Attacking Joye's Add-Only Algorithm
· There will be correlation indicating points that bear information · Many points will have spurious correlation
 Counters etc.
· To prevent this we randomly sort the set of subtraces and generate a second correlation trace
 =  2, 4, ... , -2 , 3, 5, ... , -1
· Subtract one correlation trace from the other point-by-point
10 ©2015 Rambus Cryptography Research Division CONFIDENTIAL

Example Correlation Trace
11 ©2015 Rambus Cryptography Research Division CONFIDENTIAL

Attacking Joye's Add-Only Algorithm
· We note the index of points that appear to correlate when the two operands are the same (at least some of the time)
· Extract the relevant points from each subtrace and use these points to determine whether there is any correlation for each pair of subtraces that could indicate a collision.
 = 1 ... -1 =  2, 3 ,  4, 5 , ... , (-2, -1 · Generates a correlation coefficient for each bit that we split into
hypotheses by comparing them to the mean correlation.
12 ©2015 Rambus Cryptography Research Division CONFIDENTIAL

 Again, we note that 0 in round  ...
13 ©2015 Rambus Cryptography Research Division CONFIDENTIAL

 Again, we note that 0 in round , will be the same as the first operand of the first operation in round  + 1, if round  contains a dummy operation.
 However, addition and doubling are different operations
14 ©2015 Rambus Cryptography Research Division CONFIDENTIAL

Attacking Coron's Double and Add Always
 We construct a matrix of correlation coefficients comparing all combinations of field multiplications
 We correlate traces assuming there is always a dummy operation  As previously, we are looking at the correlation of traces taken
during two consecutive operations  =  2, 4, ... , -2 , 3, 5, ... , -1
 However, an addition and doubling operation are typically different operations.
 If, for example, an addition has h, and a doubling operation has f field multiplications.
15 ©2015 Rambus Cryptography Research Division

Sample Trace ­ SASEBO-G
 We extract each subtraces corresponding to each individual field multiplication.
16 ©2015 Rambus Cryptography Research Division CONFIDENTIAL

Attacking Coron's Double and Add Always
1 ,1 1 ,2  1 , 2 ,1 2 ,2  2 ,
   ,1  ,2   ,
· Where each ,, for 1     and 1    , is a -point trace representing a field multiplication.
17 ©2015 Rambus Cryptography Research Division

Attacking Coron's Double and Add Always
· Construct a matrix assuming a dummy operation always occurs, and another where the random operations are compared
· The difference indicating what combination of points can detect a collision
· Applied to subtraces from individual loops giving correlation coefficients that can be use to determine bits of the scalar as previously  = 1 ... -1 =  2, 3 ,  4, 5 , ... , (-2, -1
18 ©2015 Rambus Cryptography Research Division

 We note that ¬ in round  ...
19 ©2015 Rambus Cryptography Research Division

 We note that ¬ in round  is used as an input to the second operation in round  + 1, if   +1.
20 ©2015 Rambus Cryptography Research Division

 Likewise,  in round  is used as an input to the second operation in round  + 1, if  = +1.
21 ©2015 Rambus Cryptography Research Division

Attacking the Montgomery Ladder
· Attack proceeds in the same manner as before · However, we are comparing the output of one operation with the
input of another · Given sets of subtraces we compare all the points in one trace with
all the points in the other.
· That is, if we assume that a trace taken during the computation of:
 A doubling operation comprises  points, and  An addition comprises  points.
22 ©2015 Rambus Cryptography Research Division CONFIDENTIAL

Attacking the Montgomery Ladder

1 ,1 1 ,2  1 ,

2 ,1 2 ,2  2 ,



 

 ,1  ,2   ,

· Where each , is the -th point from a doubling operation, for 1    , and -th point from an addition, for 1    .
23 ©2015 Rambus Cryptography Research Division

Attacking the Montgomery Ladder
· Construct a matrix assuming a dummy operation always occurs, and another where the random operations are compared
· The difference indicating what combination of points can detect a collision
· Applied to subtraces from individual loops giving correlation coefficients that can be use to determine bits of the scalar as previously  = 1 ... -1 =  2, 4 ,  4, 6 , ... , (-2, 
· Repeat for the second observation and take the strongest result.
24 ©2015 Rambus Cryptography Research Division CONFIDENTIAL

Success Rates for 192-bit Scalar Multiplication
· We define a practical attack as one with time complexity less than 254 (Biryukov et al. 2010)
· A trivial attack is, arbitrarily, set to 240 as requiring modest resources · Complexity can be derived from algorithms defined by Stinson (2002)
25 ©2015 Rambus Cryptography Research Division

Conclusion
· We demonstrate that collision attacks are a threat using a single trace.
 Applicable to blinded or ephemeral exponents.
· Given that one can, potentially, observe the use or reuse of variables all algorithms can be attacked.
· However, significant leakage is required for the attack to succeed. · One can readily test whether an implementation is vulnerable · Attacks can be prevented by adding noise
 Randomization of redundant representations  Algorithms some random ordering
26 ©2015 Rambus Cryptography Research Division

Example a 4-ary Exponentiation
27 ©2015 Rambus Cryptography Research Division

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results

Cold Boot Attacks in the Discrete Logarithm Setting
B. Poettering 1 & D. L. Sibborn 2
1Ruhr University of Bochum 2Royal Holloway, University of London
April, 2015

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Cold Boot Attacks

Usenix 2008 - Halderman et al. noted that DRAMs retain their contents for a while after power is lost.
Bits in memory can be extracted, but they will have errors.
0 bits will always flip with very low probability (<1%), but 1 bits will flip with much higher probability which increases with time.
For example

Original memory: Noisy memory:

11000101101101001 . . . 11100001100100001 . . .

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Cold Boot Attacks

Why is this a problem? Secrets may be stored in memory.

Important Question
Given a noisy key obtained from a cold boot attack, how can we recover the original key?

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Previous Approaches
This question has been addressed many times before. Most cold boot attacks consider the reconstruction of RSA private keys. There are attacks against symmetric schemes such as DES and AES. There is only one paper that discusses cold boot attacks in the discrete logarithm setting.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Cold Boot Attacks for Discrete Logarithm Keys

Cold boot attacks usually exploit redundancy in the private key's in-memory representation. E.g. in practice RSA private keys contain the parameters (p, q, d , dp, dq, qp-1) instead of just d . For previous DL cold boot attacks, the authors assumed there was no redundancy in the key. If we have redundancy, the previous attacks can be improved.
Important Question Are there any discrete logarithm implementations that contain
redundant information about the private key?

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Non-Adjacent Forms (NAFs)

The simplest NAF re-encodes a scalar x  {0, 1} as a string x  {0, 1, -1} +1. Binary expansion: 7 = 22 + 21 + 20 = 1112. Alternatively 7 = 23­20, so NAF(1112) = 1 0 0 - 1. The NAF is designed to reduce the number of additions.
For elliptic curves, subtractions are as efficient as additions.
A modified version of this NAF is used for OpenSSL elliptic curve implementations (called "windowed NAF").
The NAF is more efficient than the standard double-and-add algorithm.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Comb-Based Methods
Comb methods are designed to reduce the number of multiplications. They require some pre-computation that depends on a fixed base point. Basic combs are a re-ordering of the bits. PolarSSL employs a modified comb technique.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
The Attack Model

Neither OpenSSL nor PolarSSL explicitly states that the original private key should be discarded.
Hence, both the original key and its re-encoding (NAF or comb) will be contained in memory, at least for some time.
We assume an adversary has mounted a cold boot attack and obtains noisy versions of the key and its re-encoding.
We assume the adversary knows  and , where bits degrade according to the following channel:

0 d

1

-

E 

0

d

d

 d

1

1

-

d d  E

1

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
The Reconstruction Technique

The (textbook) NAF is constructed by starting from the least significant bits.
i.e., for the simplest NAF, the least t signed digits only rely on knowledge of the least t + 1 bits of the bit string.
For example, take the integer 7:

partial bit string : partial NAF 1 1  1 0 0 -1
1 1 1  0 0 0 -1 0 1 1 1  0 0 0 -1 0 0 1 1 1  1 0 0 -1

Comb encodings have a similar property.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
The Reconstruction Technique

Our reconstruction procedure will consider partial solutions for the private key (across a small section of bits).
For each candidate we can compute a partial re-encoding (NAF/comb).
We compare these candidate solutions (and their re-encodings) against the noisy information.
We keep a (possibly large) list of candidates for which the `correlation' is `good'. Candidates with bad correlation are discarded.
We then consider candidate solutions across a new section of bits, and repeat the procedure.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
The Reconstruction Technique (Example for NAFs)

Suppose we consider 2 bits at a time. We begin like this:

candidate, x 00 01 10 11

partial-NAF(x ) 0 1 0 -1

Correlation bad bad bad good

The second stage would then look like this:

candidate, x 0011 0111 1011 1111

partial-NAF(x ) 1 0 -1 0 0 -1 1 0 -1 0 0 -1

Correlation bad good bad good

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
The Reconstruction Technique

This process would repeat until the candidate solutions are all of equal size to the private key.
We can then compare each remaining candidate solution against the public key Q = aP.
If xP = Q for any candidate x, the algorithm outputs x as the private key. Otherwise the algorithm fails.
A similar technique applies to our comb reconstruction procedure.
Note, our actual OpenSSL reconstruction differs slightly from the description given here (please see the paper!).

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
How Do We Measure Correlation?
How is the correlation measured? However you like! We could use Hamming distance, Maximum-Likelihood, . . . We could measure the correlation of all bits, or only the newly-added bits, . . . BUT, we chose to use a multinomial test because it provides us with a neat theoretical analysis of success.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Multinomial Distributions

Multinomial distributions are a generalisation of binomial distributions.

Multinomial distributions have k mutually exclusive events.

Each of the k events has probability pi , and

k i =1

pi

=

1.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Multinomial Distributions
Consider a bowl of sweets from which we sample at random (with replacement):

Suppose we have four colours, with P(red) = 0.4, P(blue) = 0.3, P(yellow) = 0.2, P(green) = 0.1. If we pick 10 sweets randomly, what is the probability of picking:
5 red, 2 blue, 2 yellow, 1 green?
The multinomial distribution can tell us the probability of any combination of colours.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Multinomial Test
Suppose we pick 10 sweets at random and obtain: 0 red, 10 blue, 0 yellow, 0 green.
Can we be confident that the sweets were chosen from the previous bowl?

Maybe the sweets were chosen from another bowl.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Multinomial Test

The multinomial test is a way of deciding whether a set of observed values is consistent with a particular probability vector (for a specified confidence interval).
i.e., if we observe 4 red, 3 blue, 2 yellow, 1 green, is it likely that:
P(red) = 0.4, P(blue) = 0.3, P(yellow) = 0.2, P(green) = 0.1? These probabilities seem plausible.
However, if we observe 0 red, 10 blue, 0 yellow, 0 green, is it likely that:
P(red) = 0.4, P(blue) = 0.3, P(yellow) = 0.2, P(green) = 0.1? These probabilities seem highly unlikely!

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Multinomial Test

How does this help us?
Recall that our algorithm measures the `correlation' between our candidate key and the noisy bits.
Recall that in a cold boot attack the bits will degrade according to the following channel:

0 d

1

-

E 

0

d

d

 d

1

1

-

d d E

1

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Multinomial Test

Hence, there are four possible bit-pairs.
These are: 0  0, 0  1, 1  0 and 1  1.
These four pairs can be viewed as the colours red, blue, green and yellow of the previous example.
If we let pb denote the probability of a b-bit appearing in the original key (together with the re-encoding), then:
P(0  0) = p0(1 - ), P(0  1) = p0, P(1  0) = p1, P(1  1) = p1(1 - ).

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Multinomial Test
For each candidate solution, we perform a multinomial test. If the candidate's degradation is consistent with the probability vector (p0(1 - ), p0, p1, p1(1 - )), it is kept. Otherwise, the algorithm discards the candidate. The user can specify his own confidence interval for the multinomial test. This allows the user to recover the private key with an arbitrary success (with a trade-off between running-time). N.B. This test also works in the RSA setting (and others!).

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Experiments
We will shortly see some of our experimental results.
For each experiment we degraded 100 keys (each of length 160 bits).
We then used our algorithm to attempt to recover the original keys.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
OpenSSL (NAF) Experiments

For these experiments we set  = 0.001. (N.B. There are several extra parameters to the algorithm that are not displayed here.)



0.1 0.15 0.2 0.25 0.3

Predicted Success 0.15 0.15 0.02 0.01 0.01

Success

0.17 0.2 0.07 0.06 0.04

0 d

1

-

E 

0

d

d

 d

1

1

-

d d E

1

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
PolarSSL (comb) Experiments

For these experiments we set  = 0.001. (N.B. There are several extra parameters to the algorithm that are not displayed here.)



0.01 0.03 0.06 0.08 0.1

Predicted Success 0.73 0.17 0.04 0.01 0.01

Success

0.81 0.6 0.55 0.37 0.08

0 d

1

-

E 

0

d

d

 d

1

1

-

d d E

1

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Predicted Success vs Actual Success
There is sometimes a big discrepancy between the predicted success and the observed success! The predicted success is based on the chi-squared distribution. The distribution of the multinomial test converges to the chi-squared distribution. For small sample sizes, the convergence is poor. Due to the manner of convergence, the chi-squared test provides a lower bound on the multinomial success.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

Introduction NAFs and Combs Multinomial Distribution and Test Experimental Results
Conclusions

We have proposed practical key-recovery algorithms against OpenSSL and PolarSSL elliptic curve implementations.
Our algorithms allow keys to be recovered with a user-chosen success rate (at the expense of running-time).
The statistical test we use can be implemented with other key-recovery algorithms in other settings, such as RSA.
Our paper provides the first exposition of the PolarSSL encoding in the cryptographic literature.

B. Poettering & D. L. Sibborn

Cold boot attacks for DL

