De-anonymizing Programmers from Source Code and Binaries

Rachel Greenstadt @ragreens
Associate Professor Drexel University

Aylin Caliskan @aylin_cim
Assistant Professor George Washington University

August 10, 2018

1

Stylometry

Natural language
English English as a second language
Translated text Underground forum text
August 10, 2018

Artificial language

Programming languages

Python

C/C++

Source code
Binary executables
2

Stylometry

Natural language
FBI Expert witnesses
European high-tech crime units
August 10, 2018

Artificial language
DARPA Expert witnesses US Army Research Laboratory
3

Why de-anonymize programmers?

August 10, 2018

4

Source code stylometry
Iran confirms death sentence for 'porn site' web programmer.

No technical difference between

August 10, 2018

security-enhancing and privacy-infringing

5

Source code stylometry

A machine learning classification task

Application

Learner

Setting

Software forensics

Multiclass

Open world

Stylometric plagiarism detection Multiclass

Closed world

Copyright investigation

Two-class

Closed world

Authorship verification

Two-class/One-class One-class open world

August 10, 2018

6

Language Processing
Source Code

Supervised Machine Learning
Identifying Programmer Fingerprints

Privacy and Security Implications

De-anonymizing Programmers

A

B

C

D

Fuzzy Parsing

Random Forest Classifier

August 10, 2018

7

De-anonymizing programmers

Principled method & robust syntactic feature set

Application

Classes

Stylometric plagiarism detection 250 class

Large scale de-anonymization 1,600 class

Copyright investigation

Two-class

Authorship verification

Two-class/One-class

Open world problem

Multi-class

Instances 2,250 14,400
540 2,240
420

Accuracy 98% 94% 100% 91% 96%

August 10, 2018

8

Source code stylometry

1,600 contestants ­ C++

preprocessing

fuzzy AST parser

A

B

C

D

extract features

De-anonymized Programmers
August 10, 2018

majority vote

random forest
9

Features
Source code

Abstract syntax tree

August 10, 2018

10

Case 1: Authorship attribution
· Who is this anonymous programmer? · Who is Satoshi?

August 10, 2018

11

Case 1: Authorship attribution
· If only we had a suspect set for Satoshi...
Train on the suspect set to de-anonymize the
train initial Bitcoin author test

August 10, 2018

Satoshi = git contributor
12

Case 1: Authorship attribution

· 94% accuracy in identifying 1,600 authors of 14,400 anonymous

program files.

Train on 1,600 authors

to identify the

train authors of 14,400 files

test

August 10, 2018

94% accuracy
13

Case 2: C++ Obfuscation - STUNNIX

August 10, 2018

14

Case 2: C++ Obfuscation - STUNNIX

Same set of 25 authors with 225 program files Original source code STUNNIX-Obfuscated source code

Classification Accuracy 97% 97%

August 10, 2018

15

Case 2: C Obfuscation - TIGRESS

August 10, 2018

16

Case 2: C Obfuscation - TIGRESS

August 10, 2018

17

Case 2: C Obfuscation - TIGRESS

August 10, 2018

Same set of 20 authors with 180 program files Original C source code TIGRESS-Obfuscated source code

Classification Accuracy 96% 67%

18

Case 3: Authorship verification

· Is this source code really written by this programmer?
Train on 8 files from Mallory and one file from authors A, B, C, D, E, F, G, and H.

Mallory M M M M M M M

X1 X2 X3 X4 X5 X6 M M MMMM

A BCD E F G H
August 10, 2018

Test on 6 files that belong to Mallory and 6 files that belong to 6 random authors.
93% accuracy in 80 sets of experiments
19

What about executable binaries?

Source Code
#include <cstdio> #include <algorithm> using namespace std; #define For(i,a,b) for(int i = a; i < b; i++) #define FOR(i,a,b) for(int i = b-1; i >= a; i--) double nextDouble() {
double x; scanf("%lf", &x); return x;} int nextInt() { int x; scanf("%d", &x); return x; } int n; double a1[1001], a2[1001]; int main() { freopen("D-small-attempt0.in", "r", stdin); freopen("D-small.out", "w", stdout); int tt = nextInt(); For(t,1,tt+1) {
int n = nextInt();
. . .

Compiled code looks cryptic
00100000 00000000 00001000 00000000 00101000 00000000 00000000 00000000 00110100 00000000 00000000 00000000 00000100 00001000 00000000 00000001 00000000 00000000 00000000 00000001 00000000 00000000 00000101 00000000 00000000 00000000 00000100 00000000 00000000 00000000 00000011 00000000 00000000 00000000 00110100 00000001 00000000 00000000 00110100 10000001 00000100 00001000 00000000 00000000 00010011 00000000 00000000 00000000 00000100 00000000 00000000 00000000 00000001 00000000 00000000 00000000 00000001 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 10000000 00000100 00001000 00000000 10000000 00000100 00001000 11001000 00010111 00000000 00000000 11001000 00010111 00000000 00000000 00000101 00000000 00000000 00000000
. . .

August 10, 2018

20

August 10, 2018

21

August 10, 2018

22

Features: Assembly
Disassembly

Assembly Features Assembly unigrams Assembly bigrams Assembly trigrams Two consecutive assembly lines

August 10, 2018

23

Features: Syntactic

August 10, 2018

24

Features: Control flow

August 10, 2018

25

Dimensionality Reduction
· Information gain criterion
· Keep features that reduce entropy ­ see (a) · Reduce dimension from ~700,000 to ~2,000

August 10, 2018

26

Dimensionality Reduction

· Information gain criterion

· Correlation based feature selection

· Keep features that reduce entropy ­ see (a) · Keep features with low inter-class correlation

· Reduce dimension from ~700,000 to ~2,000 · Reduce dimension from ~2,000 to 53

August 10, 2018

27

Predictive features

August 10, 2018

28

Optimizations and stripping symbols

Number of programmers 100 100 100 100 100

Number of training samples 8 8 8 8 8

Compiler optimization level None 1 2 3 Stripped symbols

Accuracy
96% 93% 89% 89% 72%

August 10, 2018

29

Obfuscation
1. Bogus control flow insertion

2. Instruction substitution

3. Control flow flattening

August 10, 2018

30

Obfuscation
1. Bogus control flow insertion

2. Instruction substitution

Open-LLVM obfuscations reduce de-anonymization a3c.cCuornatrcoyl folofw Flattening
100 programmers from 96% to 88%.

August 10, 2018

31

Large scale programmer de-anonymization

August 10, 2018

32

GitHub and Nulled.IO
· De-anonymizing 50 GitHub programmers
· with 65% accuracy.
· De-anonymizing 6 malicious programmers
· Nulled.IO hackers and malware authors · with 100% accuracy.

August 10, 2018

33

Programmer De-anonymization on GitHub
 Single authored GitHub repositories  The repository has at least 500 lines of code

161 439 3,438 2 - 8 2 - 344

Compile repositories

50

542

65%

50

450

97%

August 10, 2018

34

Collaborative Code

August 10, 2018

35

Segment and Account Attribution
 Sometimes we only care who wrote a small piece of code  Sometimes we want to deanonymize a pseudonymous account
 Without whole files belonging to it, only small pieces
 In these cases, we can only attribute small segments, or "snippets"
 Using the manual feature set
 Large, sparse features (3,407 nonzero out of 369,097 total)

August 10, 2018

36

Segment attribution results
73% accuracy (average sample 4.9 lines of code)

August 10, 2018

37

Accuracy vs LOC

August 10, 2018

38

Attribute accounts not individual commits?
Works much much better! - close to 100% after 4 snippets

August 10, 2018

39

Deep Learning AST Representations
Using AST features allowed us to get good results.

August 10, 2018

But....
A Tree is not a feature!
40

We manually chose features of the ASTs

August 10, 2018

41

Can a deep neural net do better?
 Embedding Layer
 Map AST nodes to feature vectors
 Subtree Layers
 Learn the structure of the AST
 Subtree LSTM  Subtree BiLSTM (bidirectional)
 Softmax Layer
 Generate a probability distribution of the programmers

August 10, 2018

42

Long Short-Term Memory Networks

Recurrent neural networks (RNNs)
 Handle sequential input  Add feedback loops to remember
information

LSTMs add memory cells  Sequential long-term dependencies  Use gates to control flow of
information

What should I remember? What should I ignore? What should I forget?

August 10, 2018

43

Results
Using only AST features (No lexical or layout features)

Random Forest Linear SVM LSTM BiLSTM
August 10, 2018

Python (25 programmers) 86.00 77.20 92.00 96.00

Python (70 programmers) 72.90 61.28 86.36 88.86

C++ (10 programmers) 75.90 73.50 80.00 85.00

44

So what?
 Learn better AST representations without feature engineering  Language independent - any programming language that supports
ASTs
Future work  Combine with Random Forests and fuller feature sets
 Better results or just overlap with other features?

August 10, 2018

45

What about other languages?
Porting requires AST parser and lexical/layout features

Similar accuracies so far (on GCJ dataset)

Results with just AST vary

August 10, 2018

46

Train on one language test on another?
 This is something we'd like to try  Need either universal intermediate
AST representation or pairwise  Babblefish project (doesn't appear
to be ready yet)

August 10, 2018

47

Interesting Software Engineering Insights

August 10, 2018

48

What about attributing groups?

Looked at

team programming competition

Teams compete on sets of problems

Preliminary results:

118 Codeforces teams, at least 20 submissions each
 10-fold cross-validation: 67.2% accuracy  20-fold cross-validation: 67.8% accuracy

Difficult because they are likely splitting up the problems completely Future work: code repositories

August 10, 2018

49

Difficult vs. Easy Tasks
Implementing harder functionality makes programming style more unique.Same set of 62 authors
Classification Accura
Same set of 62 programmers Classification Accuracy
Solving 7 Easy Problems 90%
Solving 7 Harder Problems 95%

August 10, 2018

50

Effect of Programming Skill?

Programmers who got further in the GCJ Contest were easier to attribute.Same set of 62 authors
Classification Accura
Same set of 62 programmers Classification Accuracy

Less Advanced Coders

80%

More Advanced Coders

95%

August 10, 2018

51

How does coding style change over time?
 92% accuracy, train and test on 2012  88% accuracy, train on 2012, test on 2014

August 10, 2018

52

Coding style by country?

GCJ files (in javascript) written by programmers in Canada and China
 84 files  91.9% classification accuracy

August 10, 2018

53

Future Applications

 Find malicious code authors
 anonymous contributors
 Write better obfuscators
 target AST directly
 Find authors who write vulnerable code
 open source code
 Find who to recruit directly
 from git commits

August 10, 2018

54

Thanks to collaborators
Bander Alsulami, Edwin Dauber, Richard Harang, Andrew Liu, Spiros Mancoridis, Arvind Narayanan, Frederica Nelson, Mosfiqur Rahman, Dennis Rollke, Konrad Rieck, Gregory G. Shearer, Clare Voss, Michael J. Weisman, Fabian Yamaguchi

August 10, 2018

55

Contact information
Aylin Caliskan @aylin_cim aylin@gwu.edu

and Q & A
Rachel Greenstadt @ragreens
greenstadt@gmail.com

Source code authorship attribution: https://github.com/calaylin/bda
Javascript authorship attribution: https://github.com/dns43/CodeStylometry/tree/master/SCAA/src
Binary authorship attribution: https://github.com/calaylin/bda

August 10, 2018

56

Related Work

Comparison to related work

Author Instances Size

Average LOC

Language Fetaures

Method

Result

MacDonell 7

351

et al.

Frantzeskou et al. 8

107

148

C++

145

Java

Elenbogen and 12

83

Seliya

Shevertalov et. al. 20

N/A

100

C++

N/A

Java

Frantzeskou et al. 30

333

172

Java

Ding and 46

225

Samadzadeh

N/A

Java

Ours 35

315

68

C++

Ours 250

2,250

77

C++

Ours 1,600

14,400

70

C++

August 10, 2018

lexical & layout
lexical & layout
lexical & layout
lexical & layout
lexical & layout
lexical & layout
lexical & layout & syntactic

Case-based reasoning
Nearest neighbor
C4.5 decision tree

88.0% 100.0% 74.7%

Genetic algorithm Nearest neighbor Nearest neighbor
Random forest

80% 96.9% 75.2% 100.0% 98.0% 93.6%
57

Comparison to related work

Related Work

Author Size

Frantzeskou 30 et al.

Instances 333

Average LOC
172

Language Java

Fetaures
lexical & layout

Method
Nearest neighbor

Result 96.9%

Ding and 46

225

Samadzadeh

N/A

Java

lexical & Nearest 75.2% layout neighbor

Ours 35

315

68

C++

Ours 250 2,250

77

C++

Ours 1,600 14,400 70

C++

lexical & Random layout & forest syntactic

100.0% 98.0% 93.6%

August 10, 2018

58

Comparison to related work

Related Work

Author Instance Average Language Fetaures Method

Size

s

LOC

Frantzeskou 30

333

et al.

172

Java

lexical & Nearest layout neighbor

Ding and 46

225

Samadzadeh

N/A

Java

lexical & Nearest layout neighbor

Ours 35

315

68

C++

Ours 250 2,250 77

C++

Ours 1,600 14,400 70

C++

lexical & Random layout & forest syntactic

Result 96.9%
75.2%
100.0% 98.0% 93.6%

August 10, 2018

59

Related Work

Comparison to related work

Author Size

Instances

Average LOC

Language

Fetaures

Method

MacDonell 7

351

et al.

Frantzeskou et al. 8

107

Elenbogen and 12

83

Seliya

148

C++

145

Java

100

C++

lexical & layout
lexical & layout
lexical & layout

Case-based reasoning
Nearest neighbor
C4.5 decision tree

Shevertalov et. al. 20

N/A

Frantzeskou et al. 30

333

Ding and 46

225

Samadzadeh

N/A

Java

172

Java

N/A

Java

lexical & layout
lexical & layout
lexical & layout

Genetic algorithm
Nearest neighbor
Nearest neighbor

Ours 35

315

68

C++

Ours 250

2,250

77

C++

August 10, 2018

lexical & layout & syntactic

Random forest
Random forest

Result
88.0% 100.0% 74.7%
80% 96.9% 55.2%
100.0% 98.0%
60

Language Processing
Source Code

Supervised Machine Learning
Identifying Programmer Fingerprints

Privacy and Security Implications

De-anonymizing Programmers

A

B

C

D

Publications

Fuzzy Parsing

Random Forest Classifier

Usenix 2015: Aylin Caliskan-Islam, Richard Harang, Andrew Liu, Arvind Narayanan, Clare Voss, Fabian Yamaguchi, and Rachel Greenstadt. De-anonymizing Programmers via Code Stylometry. 24th Usenix Security Symposium (Usenix 2015).

August 10, 2018

61

Publications & Code on github
NDSS 2018: Aylin Caliskan, Fabian Yamaguchi, Edwin Dauber, Richard Harang, Konrad Rieck, Rachel Greenstadt, and Arvind Narayanan. When Coding Style Survives Compilation: De-anonymizing Programmers from Executable Binaries (NDSS 2018).
Usenix 2015: Aylin Caliskan-Islam, Richard Harang, Andrew Liu, Arvind Narayanan, Clare Voss, Fabian Yamaguchi, and Rachel Greenstadt.
62
De-anonymizing Programmers via Code Stylometry. 24th Usenix Security Symposium (Usenix 2015).

Source code stylometry

·Everyone learns coding on an individual basis, as a result code in a unique way,
which makes de-anonymization possible.

·Software engineering insights
· programmer style changes while implementing sophisticated functionality · differences in coding styles of programmers with different skill sets
·Identify malicious programmers.

August 10, 2018

63

Case 2: Obfuscation
· Who is the programmer of this obfuscated source code? · Code is obfuscated to become unrecognizable. · Our authorship attribution technique is impervious to common off-the-shelf source code obfuscators.

August 10, 2018

64

Case 3: Copyright investigation
· Copyleft programs are free but licensed · Did this programmer take a copyleft code and distribute it commercially?
· Jacobsen vs Katzer (Java Model Railroad Interface)
· Two-class machine learning classification task
· Class 1: the copyleft code · Class 2: the copyright code

August 10, 2018

65

Case 3: Copyright investigation

Jacobsen

Katzer

30 pairs of authors each with 9 program files Classification Accuracy

August 10, 2018

Two-class task 100%

66

Case 5: Coding style throughout years
· Is programming style consistent? · If yes, we can use code from different years for authorship attribution.

2012

2014

...
August 10, 2018

...
67

Case 5: Coding style throughout years
· Is programming style consistent? · If yes, we can use code from different years for authorship attribution.

2012

2014

...
August 10, 2018

...
68

Case 5: Coding style throughout years
· Coding style is preserved up to some degree throughout years.

train

Train on 25 authors from 2012 to identify the author of 25 files in 2014
test

August 10, 2018

96% accuracy
69

Case 5: Coding style throughout years

· 98% accuracy, train and test in 2014

· 96% accuracy, train on 2012, test on 2014

train

Train on 25 authors from 2012 to identify the author of 25 files in 2014
test

August 10, 2018

96% accuracy
70

Case 6: Difficult tasks & advanced coders
· Insights about programmers and coding style:
· Implementing harder functionality makes programming style more unique

Same set of 62 authors Solving 7 easy problems

Classification Accuracy
98%

Solving 7 more difficult problems 99%

August 10, 2018

71

Case 6: Difficult tasks & advanced coders
· Insights about programmers and coding style.
· Better programmers have more distinct coding style

Two sets of 62 authors Less advanced programmers More advanced programmers

Classification Accuracy 97%
98%

August 10, 2018

72

Case 7: Generalizing the approach - python

Feature set: Using `only' the Python equivalents of syntactic features

Application Python programmer de-anonymization Top-5 relaxed classification Python programmer de-anonymization Top-5 relaxed classification

Programmers
229 229 23 23

Instances 2,061 2,061
207 207

Result 53.9% 75.7% 87.9% 99.5%

August 10, 2018

73

Comparison to related work

600 contestants ­ C++

preprocessing

fuzzy AST parser

A

B

C

D

de-anonymized programmers
August 10, 2018

majority vote

extract features
random forest
74

Comparison to related work

Related Work

Number of Programmers

Number of Training Samples

Classifier

Rosenblum et al. 20

8-16

SVM

Accuracy
77%

This work

20

8

SVM

90%

This work

20

8

Random forest 99%

Rosenblum et al. 191

8-16

SVM

51%

This work

191

8

Random forest 92%

This work

600

8

Random forest 83%

August 10, 2018

75

Amount of Training Data Required for De-anonymizing 100 Programmers

August 10, 2018

76

Reducing Suspect Set Size: Top-n Classification

August 10, 2018

77

Open world: Classification thresholds for verification

August 10, 2018

78

Reconstructing original features
· Original vs predicted features
· Average cos similarity: 0.81

· Original vs decompiled features · Average cos similarity: 0.35

August 10, 2018

This suggests that original features are transformed but not entirely lost in compilation.
79

Ongoing work - DARPA
· Malware author attribution · Dataset with ground truth · Automated malware analysis

August 10, 2018

80

Future work
· De-anonymizing collaborative code
· Group fingerprint vs individual fingerprint
· Anonymizing source code
· Obfuscation is not designed for anonymization

August 10, 2018

81

Underground forums

· Micro-text · L33t sp34k · Multi-lingual · Products · Doppelgänger Finder
· Carders

No technical difference between security-enhancing and privacy-infringing

August 10, 2018

82

