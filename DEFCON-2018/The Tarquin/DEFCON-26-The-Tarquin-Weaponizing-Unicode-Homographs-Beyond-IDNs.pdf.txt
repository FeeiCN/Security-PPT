Weaponizing Unicode: Homographs Beyond IDNs
1

Who Am I
The Tarquin (aka Aaron M Brown) Senior Security Engineer Amazon.com
2

Disclaimers
3

4

WTF, Why?
"The human race will begin solving its problems on the day that it ceases taking itself so seriously." - Malaclypse the Younger
5

Scope, Context, and Prior Art
http://www.xn--exmple-qxe.com/
6

7

The Dark Corners of Unicode
 vs  vs  vs 
8

Quiz Time

Uppercase Greek Alpha u+0391
9

Quiz Time
i
Latin Small Letter Dotless I (u+0131) + Combining Dot Above (u+0307)
10

Quiz Time

Mathematical MonoSpace Capital Z u+1D689
11

Quiz Time

Rupee Sign, u+20A8
12

Not to be Confused With

Indian Rupee Sign, u+20B9
13

Quiz Time

Ogham letter Beith u+1681
14

Let's Hack Shit
15

Search and Indexing
16

Do you want to play a game
17

Defeating Plagiarism Detection
18

Defeating Plagiarism Detection
19

Lol text analysis
20

Lol text analysis
21

Lol spellcheck
22

Lesson 1: Unicode support usually just means "passed my unit tests".
23

Defeating ML Systems
"Explanations exist; they have existed for all time; there is always a wellknown solution to every human
problem [which is] neat, plausible, and wrong." - H. L. Mencken
24

Default Data Set
25

Homographs, in MY Training Set?
26

100% Homographs in Neg Training
27

10% Homographs in Neg Training
28

Sabotaging a Cinematic Masterwork
29

Sabotaging a Cinematic Masterwork
30

Sabotaging a Cinematic Masterwork
31

Lesson 2: ML overindexes on human-invisible patterns. If a human
could see them, we wouldn't be using ML.
32

33

But emojis aren't the real problem
34

Demo
35

Mitigation: Code Quality
36

Lesson 3: Homographs work because people take don't actually
see text; they see whatever it represents.
37

Canary Traps, And Repudiation
Canary Traps: because you want to know who's "singing"
38

Canary Traps, And Repudiation
39

Homographs, Canary Traps, And Repudiation
40

Homograph Bombs
Goód ñ evvs, h cke
41

And now, for the world's most boring demo...
42

Tool Intro: samesame
Because small, sharp tools are the best.
43

Tool Intro: samesame
44

Defense
"Every man takes the limits of his own field of vision for the limits of the world." - Arthur Schopenhauer
45

Demo Time!
46

OCR Defense
Why do this instead of $alternative?
47

Lesson 4: Defenses work best when they directly exploit attacker incentives
48

Conclusions!
Phenomenology is king. Hacking computer is fun; hacking people is more effective Unicode is a delightfully absurd monstrosity and I love it.
49

Greetz
Amazon colleagues especially David Gabler and Nikki Parekh The Additional Payphones Crew: cibyr, cobells, giskard, dirac, and turbo All the DefCon organizers, goons, and other crew
50

  & 
51

