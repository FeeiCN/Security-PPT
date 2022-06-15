SESSION ID: HT-R03
Linguistic Passphrase Cracking
#RSAC

Peder Sparell
M.Sc. GPEN CHFI Simovits Consulting peder.sparell@simovits.com
Mikael Simovits
M.Sc. CISSP Simovits Consulting (CEO) mikael@simovits.com

#RSAC
Background
Implementation Objectives and entropy calculations Results

#RSAC
Background
Standards requirements/recommendations on long and complex/random passwords (e.g. within ISO27000 series and NIST Electronic Authentication Guideline) Increasing use of phrases as passwords Publicly available cracking software are not very effective on longer passwords or phrases > 2 words Languages are relatively predictable ­ not random Linguistically correct phrases - more effective cracking? How can language be modelled to generate/crack such phrases? Is it advisable to base a password policy on phrases?
3

#RSAC
Passwords ­ search scope/complexity

Number of possible combinations:  = 

Sometimes written as: 22()

Password Lowercase length
1 (base) 26

Lower + uppercase
52

Alfanumerical
62

6

228,2 (=3,1*108)

234,2 (=2,0*1010)

235,7 (=5,7*1010)

8

237,6 (=2,1*1011) 245,6 (=5,3*1013)

247,6 (=2,2*1014)

10

247,0 (=1,4*1014) 257,0 (=1,4*1017)

259,5 (=8,4*1017)

14

265,8 (=6,5*1019) 279,8 (=1,1*1024)

283,4 (=1,2*1025)

16

275,2 (=4,3*1022) 291,2 (=2,9*1027)

295,3 (=4,8*1028)

20

294,0 (=2,0*1028) 2114 (=2,1*1034)

2119 (=7,0*1035)

4

Alfanumerical + special chars
95
239,4 (=7,4*1011) 252,6 (=6,6*1015) 265,7 (=6,0*1019) 292,0 (=4,9*1027) 2105 (=4,4*1031) 2131 (=3,6*1039)

#RSAC
This works delimitations on passphrases
2 or more words (usually >=3) Assembled to a string without white spaces Lower case Examples:
The king shall rule -> thekingshallrule My brother rocks -> mybrotherrocks
5

#RSAC
Background
Implementation
Objectives and entropy calculations Results

Markov chains
A Markov process is a process where transitions to other states are determined by probability distribution based on the current state
A Markov chain is the resulting sequence of states from a Markov process

#RSAC

0,6
A
0,4

0,3
B
0,6 0,1

1,0

C

7

#RSAC
Markov chains of order m

A Markov chain of order m redefines the states to include a 'history' of m states

BA 1,0
1,0
CA State A

0,5
AB 0,3 State B
0,2
0,9 BB
0,1
1,0 BC State C

8

#RSAC
n-grams
n-grams are used for language modelling, using Markov chains of order n-1 n-grams are sequences containing n elements The elements could be characters or words Statistics for the probability distribution is generated from counting number of occurrences of n-grams in large texts Example: Statistics of 3-grams shows, for example, if character 'e' is more likely than character 'x' to follow a current state of 'th'
9

Implementation - Overview

Phrase generation

stdout

Text file
Cracker (e.g. HashCat)

10

#RSAC

Implementation - Phrase generation

Text source
Large text file in plain text. Ex: e-
book, corpus

n-gram extraction
Here the ngram statistics
are created

n-gram data
Text file containing statistics on number of occurrences of ngrams in the source text

Phrase generation
Here the phrases are generated using a Markov
process

Data out
Phrases, one per
line

11

#RSAC

Phase 1: n-gram extraction

At start-up, a text file to analyse is chosen, as well as the desired order and level of n-grams

Uses regular expressions

Punctuation marks (.,!?:) are replaced by a single dot (.) to represent sentence breaks

All characters are changed to lower case

Result: n-grams are saved to a text file together with their number of

occurrences

...

...

Examples (char/word):

arw 3 ary 137 as. 24 as_ 2382

the shelbyville runner 1 the sheldon penny 1 the shelf . 10 the shelf adaptors 1

asa 48

the shelf and 6

asb 7

the shelf are 1

asc 42

the shelf at 3

asd 7

...

ase 207

...

12

#RSAC

Phase 2: Phrase generation

Interval of desired phrase lengths can be set

Number of desired words can be set

...

The desired n-gram file is read and loaded

_th

to memory as in the example in the picture

Starting states (starting with '.') are loaded into a separate list

A threshold value decides if n-gram

should be loaded to the list or ignored

_ti

From every starting state the phrases are

built up char by char (or word by word), by

recursively going through the possible state

transitions and adding the new chars

(or words) to the current phrase until it is

long enough

...

13

6081

e

1727

a

727

i

235

r

206

o

22

u

155

m

16

n

10

d

8

e

4

c

3

g

#RSAC

#RSAC
Background Implementation
Objectives and entropy calculations
Results

#RSAC
Entropy of the English language

Different estimation suggestions:
1,75 bits/char 1,6 bits/char

NIST (National Institute of Standards & Technology) suggests:

First char:

4 bits

Char 2-8:

2 bits

Char 9-20:

1,5 bits

Char 21 and subsequent: 1 bit

Example: A 16 character phrase of the English language has (1*4)+(7*2)+(8*1,5) = 30 bits of entropy

15

#RSAC
Comparison entropy calculations

For every generated list of phrases we define:

Target entropy:  is calculated according to NIST:s interpretation of the entropy of the English language

Potential entropy:  = 2  X is the number of phrases in the list

Estimated entropy:

Efficiency:



=

   

 = 2

 

= 2 

- 2 

The objective is that the "potential" and especially the "estimated" entropy values are as close as possible to the "target" entropy.

16

#RSAC
Some case Illustrations
Enough number of phrases in list. About half of them are not valid phrases. Potential entropy is close to Target entropy, Estimated entropy is higher.
Large number of phrases in list. Covers the whole language, but many non valid phrases. Potential and Estimated entropy high.
Small number of phrases in list. All of them are valid phrases, but they do not cover the language. Potential entropy lower than Target entropy, Estimated entropy higher.
17

Background Implementation Objectives and entropy calculations
Results

#RSAC

Testing variables
Test sample basis contained of 66 hashes from passwords of length 10-20 n-gram statistics were generated from 3 different source texts
English news sites (3 million sentences) English Wikipedia (1 million sentences) General web sites/blogs etc. (1 million sentences) The input data values used for each list can be derived from the selected file names. Example: 'L20W6T5N3WNews' length of the phrases in the list/file is 20 (L20) phrases consists of exactly 6 words (W6) the threshold value is set to 5 (T5) n-grams of order 3 has been used (N3) n-grams on the word level has been used (C=char, W=words) text source is the one from news sites (Wiki, Web or News)
19

#RSAC

#RSAC
Results details ­ Phrase length 10

Phrase List
L10T100N5CNews L10T0N3WNews L10T1N3WNews

Time

Time Cracked

generation HashCat hashes

4.2 h 1.5 h 16 min

46 s 7/15 1 s 2/15 0 s 2/15

Possible outcomes (English)
221 (2.1 mil.)

Phrases Generated

Target Potential Estimated entropy entropy entropy

229.6 (825 mil.)

223.9 (15.2 mil.)

21

221.3 (2.6 mil.)

29.6

30.7

23.9

26.8

21.3

24.2

20

#RSAC
Results details ­ Phrase length 14

Phrase List

Time

Time Cracked

generation HashCat hashes

L14T3000N5CNews L14T1N8CWiki L14T1N3WNews

1.7 h

6 s 0/15

23.0 h

4 min 32s

2/15

20.2 h

31 s 2/15

Possible outcomes (English)
227 (134 mil.)

L14W-5T0N3WNews

24.0 h

45 s 2/15

Phrases Generated

Target Potential Estimated entropy Entropy entropy

226.4 (90 mil.)

230.8

(1865 mil.)

228.9

27

(505 mil.)

228.2 (312 mil.)

26.4

-

30.8

33.7

28.9

31.8

28.2

31.1

21

#RSAC
Results details ­ Phrase length 16

Phrase List

Time

Time Cracked

generation HashCat hashes

Possible outcomes (English)

L16W4T5N8CWiki

7.3 h

31 s

1

L16W5-6T5N8CWiki Total, group 1 L16W4T0N3WNews

34.7 h 42 h 9.2 h

3 min 37 s
4 min 8 s
6 s

0

1/24

<230 (<1 100 mil.)

4

L16W5T0N3WNews L16W6T1N3WNews Total, group 2 L16W5T0N3WWeb

79.5 h 58.7 h 147.4 h 16.6 h

10min 16 s
1 min 32 s
11min 54 s
13 s

1

0

5/24

<230 (<1 100 mil.)

1

22

Phrases Generated

Target Potential Estimated entropy Entropy entropy

228.8 (479 mil.)

230.3 (1 355 mil.)

230.8 (1 834 mil.)

<30

30.8

35.4

226.0 (67.5 mil.)

229.7 (887 mil.)

229.7 (851 mil.)

230.7 (1 806 mil.)

<30

30.7

33.0

227.6 (199 mil.)

#RSAC
Results details ­ Phrase length 20

Phrase List

Time

Time Cracked

generation HashCat hashes

Possible outcomes (English)

L20W6T40N8CWiki

12.8 h

18 s 0/12

L20W6T1N3WWeb L20W6T0N3WWeb L20W6T1N3WNews

52.2 h 960 h 550.5 h

2 min 14 s
29 min 9 s
39 min 3 s

0/12 <236
1/12 (<69 000 mil.)
1/12

Phrases Generated

Target Potential Estimated entropy Entropy entropy

227.9 (244 mil.)

27.9

-

229.4 (727 mil.)

29.4

-

233.0

<36

(8 500 mil.)

33.0

36.6

231.0 (2 131 mil.)

31.0

34.6

23

#RSAC
Phrase list efficiency

BITS

40

35

30

25

20

15

10

5

0

L10T100N5C News

L10T0N3WN ews

L10T1N3WN ews

L14T3000N5 CNews

L14T1N8CWi ki

L14T1N3WN ews

L14W5T0N3WNew
s

L16W46T5N8CWiki
(Group 1)

L16W4-6T01N3WNews (Group 2)

L20W6T40N 8CWiki

L20W6T1N3 WWeb

L20W6T0N3 WWeb

L20W6T1N3 WNews

Target entropy

21

21

21

27

27

27

27

30

30

36

36

36

36

Potential entropy

29.6

23.9

21.3

26.4

30.8

28.9

28.2

30.8

30.7

27.9

29.4

33

31

Estimated entropy 30.7

26.8

24.2

0

33.7

31.8

31.1

35.4

33

0

0

36.6

34.6

PHRASE LIST

24

#RSAC
Brute force comparison

100

90

80

70

60

50

47

40 30.7 30

20

10

0

47 26.8

47 24.2

Estimated entropy Brute-force 94

75.2

75.2

65.8

65.8

65.8

65.8

33.7

31.8

31.1

35.4

33

0

0

94

94

94

36.6

34.6

0

BITS

PHRASE LIST
25

#RSAC
LinkedIn cracking

Leaked hashes from LinkedIn 2012
Using the previously generated phrase lists
This was not the main objective of this work, so lists are not optimized
Estimates of the target scope (number of crackable passwords) of each length, based on passwords statistics on already cracked passwords (www.adeptus-mechanicus.com)
The target scope below still includes many words beyond the original target scope of this work (non -linguistically correct phrases)

Phrase length
10 14 16 20

Cracked hashes
18 269 (11%) 1 882 (10%) 612 (10%) 6 (9%)

Target scope
(estimated total no. of lowercase passwords)
168 000 18 300
6 100 68

26

#RSAC
Conclusions
Good results compared to brute-force Efficient ­ and can be further improved Lack of alternative publicly available methods Cracks about 10% of really long passwords Time-memory trade-off If a password policy is based on phrases, it should at least also require
Phrases longer than 20 characters Characters from all character sets (alphanumeric + special characters)
27

#RSAC
Future work & more info
Future work
Optimization of performance of the implementation Include upper case, numbers and special characters Etc.
More info
www.simovits.com peder.sparell@simovits.com
28

#RSAC
"Apply" slide
After this session we hope that you will know that passwords as a mean of authentication is more or less obsolete. It is possible to implement linguistic password cracking for long phrases and achieve viable results in a short time. You know where to begin if you want to carry this work further:
Source code available on Github: https://github.com/Sparell/Phraser
29

#RSAC
Thanks
peder.sparell@simovits.com mikael@simovits.com

