Constant-Time Dynamic Symmetric Searchable Encryption from Constrained
Functional Encryption
Prof. Dr. Sebastian Gajek NEC Research Labs and FUAS

ger an is a game ch
2

Searchable Encryption (SENC)
Search for word and receive a file
Encrypted Index + Files
3

Designing a SENC system means to juggle with
requirements
privacy functionality
scalability

Privacy

· Pattern (Information leaked)
­ One-Time1 (weakest): Database learns after first query the search token
­ Search: Database does not learn that
same search word is queried ­ Access2 (strongest): Database does not
learn that same data is queried

Search for word
and receive a file

· Attack Model (Database is our foe)
­ Honest-but-curious (weakest): Honest, but tries to infer information from protocol executions (passive)
­ Covert: When dishonest, some odds to detect curiosity (rational)
­ Malicious (strongest): Dishonest, tries everything to derive information (active)

1 Curtmola et al. Symmetric Searchable Encryption, CCS´06 2 Goldreich, Ostrovsky: Software Protection and Simulation on Oblivious RAMs, STOC'95

Functionality

· Database
­ Static: Database supports search and retrieval of (multiple) files
­ Dynamic: Database supports addition
and deletion of (multiple) words and files

Search for word
and receive a file

· Query language
­ Single-word: each token allows for searching for a single word
­ Multi-word: each token allows for searching multiple words (ideally, query for some CNF/DNF formula)
­ Nearest-word: each token allows for searching multiple words, each word wi close to some word wj, i.e. |wi-wj|<  (e.g., range queries)

Scalability

· Performance
­ Non-parallelizable: no gain by sharing search over multiple clouds
­ Parallelizable: performance gain by multiple cloud
· Generality
­ Specific: SENC system is a mash-up of cryptographic algorithms and data structures (e.g. CryptDB)
­ Self-containted: SENC system is a framework of cryptographic algorithms and data structures

Search for word
and receive a file

Our Schemes

Privacy One-Time Search Access
Functionality Search/Retrieve Add/Delete words Add/Delete files
Scalability Performance Generality

Honest-Curious Single-Word Parallelizable

Covert Multiple-Word Self-Contained

Malicious Nearest-Word

Key Idea(s)
· A searchable encryption framework ­ Cryotographic layer · provides functionality and privacy · implemented by constrained functional encryption (for inner-product functions) ­ Data (structure) layer · provides functionality and scalability · implements search on trees, (unlinked) lists, matrices, graphs, ...

(Constrained) Functional Encryption
C:=Encrypt(MSK, x)

C

SKf:=KeyGen(MSK, f) SKf

f(x):=Decrypt(SKf, x)

(Constrained) Functional Encryption
C:=Encrypt(MSK, x)
C

SKf:=KeyGen(MSK, f)

SKf

SKf constrained to decrypt a particular ciphertext

f(x):=Decrypt(SKf, C)

Our Result
Assume the subgroup membership problem holds, then there exists a secure1 constrained functional encryption system for the class of inner product functions
1 Security game similar to predicate-private encryption [Shi-Waters, TCC'09]

Scheme #1
Data Structure: Binary Tree
13

Technique (1)

· Binary tree of depth log|W|=n

E(k00, b00)

0

1

E(k01, b01)

0

1

E(k11, b11)

0

1

E(k02, b02) E(k12, b12) E(k22, b01) E(k32, b32)

...

...

...

...

0

1

bucket containing all pointers matching word w=(w0,..,wn-1)

w0 w1 w2 ... wn-1
14

Our Technique (2)
· Search query q for single w=(w0,..,wn-1)

Row: Query to word wi

E(k0, w0)

sk0

...

...

ski

...

E(kn-1, wn-1)

skn-1

· Decryption key ski=ki*ki
· Can only decrypt if correct evaluation of product performed

Scheme #2
Data Structure: (Unlinked) List
16

Our Technique (1)
· Database look-up Matrix Mnxm

Row: Pointer to word wi

Column: Pointer to file fj

E(k11, b11)

...

E(k1m, b1m)

E(kn1, bn1)

...

E(knm, bnm)

i  n, j  m: bij=1 if and only if fj contains word wi

Our Technique (2)
· Search query q for multiple words wi

Row: Query to word wi

E(k0, b0) ... ...
E(kn, bn)

i  n: bi=1 if and only if we query for word wi

Our Technique (3)

· Search on Encrypted Data
­ Matrix multiplication p=qTA

T
E(k0, b0) ... ...
E(kn, bn)

E(k11, b11)

...

E(k1m, b1m)

E(kn1, bn1)

...

E(knm, bnm)

­ Decryption key skj=SUM(ki*kij)
· Can only decrypt if correct evaluation of inner product performed

Performance Evaluation
· Implemented scheme based on group G · of composite order N=pqr and symmetric pairing · of prime order N=p and asymmetric pairing

Group N=pqr N=p

Ciphertext Size 3076 bit 2*254 bit

Search word 1.23 s 0.73 ms

Security 128 bit 128 bit

20

Conclusion
· Searchable encryption requires to find a tradeoff between privacy, functionality and scalability
· Our protocol framework is tailored towards privacy and functionality
· Yet many optimisations are not explored (e.g. clustering of matrices)
21

SESSION ID: CRYP-T11
Private Large-Scale Databases with Distributed Searchable Symmetric Encryption
#RSAC

Authors: Yuval Ishai Eyal Kushilevitz Steve Lu Rafail Ostrovsky
Speaker: Steve Lu
Senior Researcher Stealth Software Technologies, Inc.

A Story
In 2004...

Stealth Software

Technologies Inc.

2

#RSAC

#RSAC
A Story
In 2004...

Whatever happens in Vegas stays in Vegas?

Stealth Software

Technologies Inc.

3

#RSAC
Motivating Problem
Server

Stealth Software Technologies Inc.

Client
4

Motivating Problem
Server

#RSAC
Untrusted Cloud Service

Stealth Software Technologies Inc.

Client
5

#RSAC
Privacy Goals

Protect the privacy of the Server holding the Database (from Cloud and Client)

Protect the privacy of Client queries (from Cloud and Server)

Server can specify private policies that enforce queries

Modeled as a 3-party computation, with security in the semihonest (honest-but-curious) model against any single corrupted party

Stealth Software

Technologies Inc.

6

#RSAC
Additional Goals
Query Functionality Leverages the Cloud Scales! Goes Fast! ...

Stealth Software

Technologies Inc.

7

#RSAC
Background and Model

#RSAC
Data Format
First Last DOB Photo Fingerprint John Smith 12/3/45
Jane Doe 6/7/89

...

...

...

...

...

Searchable Attributes
Stealth Software
Technologies Inc. (First, Last, DOB, ...)

Rich Data (Photo, Fingerprint, ...)

Review of Crypto Primitives

Name
Private Information Retrieval(PIR)
[Chor-Kushilevitz-GoldreichSudan95, KushilevitzOstrovsky97,...]
Oblivious RAM(ORAM)
[Goldreich-Ostrovsky96,...]
Searchable Symmetric Encryption(SSE)
[Curtmola-Garay-KamaraOstrovsky06,...]

Properties

Complexity

Leakage

#RSAC

Stealth Software

Technologies Inc.

10

#RSAC
Review of Crypto Primitives

Name
Private Information Retrieval(PIR)
[Chor-Kushilevitz-GoldreichSudan95, KushilevitzOstrovsky97,...]
Oblivious RAM(ORAM)
[Goldreich-Ostrovsky96,...]
Searchable Symmetric Encryption(SSE)
[Curtmola-Garay-KamaraOstrovsky06,...]

Properties
Privately fetch index i from array

Complexity
Low comm. Linear server work, mostly bitwise ops

Leakage Sizes only

Stealth Software

Technologies Inc.

11

#RSAC
Review of Crypto Primitives

Name
Private Information Retrieval(PIR)
[Chor-Kushilevitz-GoldreichSudan95, KushilevitzOstrovsky97,...]
Oblivious RAM(ORAM)
[Goldreich-Ostrovsky96,...]
Searchable Symmetric Encryption(SSE)
[Curtmola-Garay-KamaraOstrovsky06,...]

Properties Privately fetch index i from array
Compiles program into one that hides data and access

Complexity
Low comm. Linear server work, mostly bitwise ops

Leakage Sizes only

Low comm.

Sizes only

polylog work,

symmetric-key ops

Stealth Software

Technologies Inc.

12

#RSAC
Review of Crypto Primitives

Name
Private Information Retrieval(PIR)
[Chor-Kushilevitz-GoldreichSudan95, KushilevitzOstrovsky97,...]
Oblivious RAM(ORAM)
[Goldreich-Ostrovsky96,...]
Searchable Symmetric Encryption(SSE)
[Curtmola-Garay-KamaraOstrovsky06,...]

Properties Privately fetch index i from array
Compiles program into one that hides data and access Search on encrypted data

Complexity
Low comm. Linear server work, mostly bitwise ops

Leakage Sizes only

Low comm. polylog work, symmetric-key ops
Very low comm/comp, symmetric-key ops

Sizes only
Sizes and some access "metadata"

Stealth Software

Technologies Inc.

13

#RSAC
Recent Advances

(2-server) PIR Subpolynomial [Dvir-Gopi15] Distributed Point Functions [Gilboa-Ishai14,Boyle-Gilboa-Ishai15]
ORAM Asymptotic [Kushilevitz-Lu-Ostrovsky12] Circuit complexity [Wang-Chan-Shi15] Distributed [Lu-Ostrovsky13A] Non-interactive (Garbled RAM) [Lu-Ostrovsky13B, Gentry-Halevi-Lu-Ostrovsky-Raykova-Wichs14, Garg-Lu-OstrovskyScafuro15, Garg-Lu-Ostrovsky15]
Searchable Symmetric Encryption Large Scale [Cash-Jarecki-Jutla-Krawczyk-Rosu-Steiner13, Cash-Jaeger-Jarecki-Jutla-Krawczyk-Rosu-Steiner14, PappasKrell-Vo-Kolesnikov-Malkin-Choi-George-Keromytis-Bellovin14, Faber-Jarecki-Karwczyk-Nguyen-Rosu-Steiner15, Fisc-VoKrell-Kumarasubramanian-Klesnikov-Malkin-Bellovin15] Dynamic [Kamara-Papamanthou-Roeder12, Kamara-Papamanthou13, Naveed-Prabhakaran-Gunter14]

Stealth Software

Technologies Inc.

14

#RSAC
Recent Advances

(2-server) PIR Subpolynomial [Dvir-Gopi15]
Can we leverage Distributed Point Functions [Gilboa-Ishai14,Boyle-Gilboa-Ishai15]
ORAM
these advances Asymptotic [Kushilevitz-Lu-Ostrovsky12]
Circuit complexity [Wang-Chan-Shi15]
and get the best Distributed [Lu-Ostrovsky13A]
Non-interactive (Garbled RAM): [Lu-Ostrovsky13B, Gentry-Halevi-Lu-Ostrovsky-Raykova-Wichs14, Garg-Lu-OstrovskyScafuro15, Garg-Lu-Ostrovsky15]
of all worlds? Searchable Symmetric Encryption
Large Scale [Cash-Jarecki-Jutla-Krawczyk-Rosu-Steiner13, Cash-Jaeger-Jarecki-Jutla-Krawczyk-Rosu-Steiner14, PappasKrell-Vo-Kolesnikov-Malkin-Choi-George-Keromytis-Bellovin14, Faber-Jarecki-Karwczyk-Nguyen-Rosu-Steiner15, Fisc-VoKrell-Kumarasubramanian-Klesnikov-Malkin-Bellovin15] Dynamic [Kamara-Papamanthou-Roeder12, Kamara-Papamanthou13, Naveed-Prabhakaran-Gunter14]

Stealth Software

Technologies Inc.

15

#RSAC
Our Results

We create a private SSE scheme that only leaks sizes (and query types), assuming semi-honest (honest-but-curious) model with no collusion.
Privacy is modeled via the ideal/real paradigm from secure computation literature
Supports range, substring, Boolean,... queries
Supports simple deny policies
Supports updates

Stealth Software

Technologies Inc.

16

#RSAC
Our Construction

#RSAC
Overview
Setup Query Updates Policy

Stealth Software

Technologies Inc.

18

Setup
Server

#RSAC
Cloud

CREATE TABLE foo ( id INT(8) RANGE, name CHAR(20) RANGE WILDCARD SUBSTRING(5), income INT(8) RANGE, birthdate CHAR(10) RANGE SUBSTRING(4), description CHAR(1000) );
Stealth Software Technologies Inc.

Client
19

Query
Server

#RSAC
Cloud

Stealth Software Technologies Inc.

SELECT * FROM table WHERE name = 'Alice';
SELECT * FROM table WHERE birthdate BETWEEN '1970' AND '1975-12-31';
Client SELECT id FROM table WHERE name LIKE 'Car_l';
SELECT * FROM table WHERE birthdate LIKE '%-05-%'; 20

Update
Server

#RSAC
Cloud

INSERT INTO table VALUES (4, 'Carol', 123456, '1970-05-17', NULL); DELETE FROM table WHERE id = 4;
Stealth Software Technologies Inc.

Client
21

Policies
Server

#RSAC
Cloud

Deny all range queries
Deny wildcard queries on 'birthdate'
Deny all queries on 'gender'
Stealth Software Technologies Inc.

Client
22

#RSAC
High Level Idea
Setup: Server stores encrypted database and encrypted indices (B-tree) in Cloud Query: Use a combination of PIR, ORAM, and secure computation techniques to traverse tree privately Updates: Create a mini-database and intermittently merge Policies: Interweave policy enforcement with query mechanism

Stealth Software

Technologies Inc.

23

#RSAC
High Level Idea

Setup: Server stores encrypted database and encrypted indices (B-tree) in Cloud
Query: Use a combinatUionnlikoefoPuItRso,uOrcReAdM, and secure computation techniquestsotroaogwternaodvfaeCtrlaise:entt'rsee privately Updates: Create a miniC-dlieanttab(aansdeCalonudd)intermittently merge
must never see
Policies: Interweave poldiceycreynptfeodrcinedmexent with query mechanism
values nor unqueried data

Stealth Software

Technologies Inc.

24

#RSAC
High Level Idea
Setup: Server stores encrypted database and encrypted indices (B-tree) in Cloud Query: Use a combination of PIR, ORAM, and secure computation techniques to traverse tree privately Updates: Create a mini-database and intermittently merge Policies: Interweave policy enforcement with query mechanism

Stealth Software

Technologies Inc.

25

#RSAC
Structure of Setup
First John Jane
...

Stealth Software

Technologies Inc.

26

#RSAC
Binary Tree Example For Range Query
5

3

1

1

3

4

4

5

10

8

8

10

15

15

16

Stealth Software

Technologies Inc.

27

#RSAC
Binary Tree Example

Stealth Software

Technologies Inc.

28

#RSAC
Binary Tree Example

Stealth Software

Technologies Inc.

29

#RSAC
Main Traversal Technique

PIR to fetch ......

Secure "Millionaires" to step down

ORAM to fetch

Stealth Software Technologies Inc.

Must be secret-shared
30

#RSAC
Reminder: Secret Sharing/One-Time Pad
M  R = C
One-time pad, R is random key, used only once, C perfectly hides M
M = C  R
C and R form a secret sharing of M, each perfectly hiding M

Stealth Software

Technologies Inc.

31

#RSAC
Main Traversal Technique (Details)

1

4

8

15

Stealth Software Technologies Inc.

Query:5
32

Recursive Assumption

Secret Sharing
0x1=0x3+0x2 0x2 (mod 4)

0x0

0x1

0x2

1

4

8

#RSAC
0x3 15

Stealth Software Technologies Inc.

0x3

Query:5

33

Virtual Rotation

0x0

0x1

1

4

Rotate by 0x2 0x2 (virtually)
0x2
8

#RSAC
0x3 15

Stealth Software Technologies Inc.

0x3

Query:5

34

Virtual Rotation

Rotate by 0x2 0x2 (virtually)

0x0

0x1

0x2

8

15

1

#RSAC
0x3 4

Stealth Software Technologies Inc.

0x3

Query:5

35

Use PIR to fetch

0x2

0x0

0x1

0x2

8

15

1

#RSAC
0x3 4

Stealth Software Technologies Inc.

Use PIR to fetch location 0x3

0x3

Query:5

Note: Cloud must pad with R

36

#RSAC
Special Purpose Secure Computation

PIR returns a block B containing (value=4,Lptr,Rptr)

Client holds: Secret key k, Query=5, Result of PIR X=Ek(B)  R Cloud holds: R

Need to securely compute F(k,Query,X;R):
Set B=Dk(X  R) (Custom protocol for this) Return (q>B.value) ? B.Rptr : B.Lptr (Millionaires problem!)

Final caveat: must return secret shared output

Stealth Software

Technologies Inc.

37

Completing the Recursion

#RSAC
Cloud

Stealth Software Technologies Inc.

R

Key k

Query:5

F

Block X
38

#RSAC
Completing the Recursion

0x0

1

0x0

0x1

0x1

4

0x2

0x3

0x2

8

0Fx4

0x5

0x3

15

0x6

0x7

Stealth Software Technologies Inc.

Query:5
39

#RSAC
Completing the Recursion

0x0

1

0x0

0x1

0x7

0x1

0x2

4

0x2

0x3

8

0Fx4

0x5

Secret Sharing
0x3=0x7+0x4 (mod 8)
0x4

Query:5

0x3

15

0x6

0x7

Stealth Software

Technologies Inc.

40

#RSAC
Summary and Conclusion

#RSAC
Summary
We constructed a new SSE scheme that supports a wide variety of queries and can enforce policies and support updates
Combination of several techniques including PIR, ORAM, and secure computation
We implemented the solution, and for large queries we are only 5x slower than MySQL (smaller queries have overhead of up to 100x, but actual time is under 1 second)

Stealth Software

Technologies Inc.

42

#RSAC
Apply What You Have Learned Today

Within 1 month you should:
Identify scenario where this setting occurs Further research our paper and others
Within 3 months you should:
Understand and identify acceptable and unacceptable leakage amongst secure database solutions
Within 6 months you should:
Have a broader understanding of different solutions Discuss applying this technology to suit your needs

Stealth Software

Technologies Inc.

43

#RSAC
THANK YOU!
Full version available on ePrint (2015/1190): eprint.iacr.org/2015/1190

