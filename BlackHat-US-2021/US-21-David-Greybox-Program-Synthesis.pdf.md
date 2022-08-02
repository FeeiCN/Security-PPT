Greybox Program Synthesis: A New Approach to Attack Dataflow Obfuscation
Robin David
<rdavid@quarkslab.com>
1 #BHUSA @BlackHatEvents

About me
Software Security Engineer @ Quarkslab Primarily interested in attacking obfuscation and automating bug discovery
2

Agenda
I. Introduction II. Synthesis Primer
 Usages  Application to software deobfuscation
III. Greybox Synthesis
 Algorithm overview  black-box I/O oracle  whitebox AST search
IV. Table generation V. Implementation in QSynthesis (deobfuscation up-to reassembled instructions)
 implementation & reassembly  IDA integration
VI. Use-cases VII. Conclusion
3

Introduction
(obfuscation techniques)
4

Obfuscation

What ?
Transformation of a program P in a semantically equivalent P'
harder to understand
Why ?
To protect intellectual property from reverse-engineering
How ?
By hiding valuable assets of the program (which are usually)

program logic algorithms
(referred as control-flow)

program data

keys, strings, constants...

(referred as data-flow)

5

Obfuscation Diversity
Control-Flow Obfuscation
Hiding the logic and algorithm of the program
virtualization, opaque predicates, CFG-flattening, split, merge, packing,
implicit flow, MBA, loop-unrolling...


Data-Flow Obfuscation
Hiding data: constants, strings, APIs, keys etc.
data encoding, MBA, arithmetic encoding, whitebox, array
split/fold/merge, variable splitting...

((((((a  ¬b ) + b) <<

1)  ¬ ((a  b) -

 a + b

(a  b))) << 1) - ((((a  ¬b) + b) <<

1)  ((a  b) - (a 

b))))

6

Data Obfuscation (data-flow)

 This work focuses on data-flow and more especially MBA (Mixed Boolean Arithmetic)
(but many other transformation exists like: data encoding, whitebox, variable splitting/merging ..)

obfuscation

a + b

Deobfuscation?

((((((a  ¬b ) + b) << 1)  ¬ ((a  b) - (a  b))) << 1) - ((((a  ¬b) + b) << 1)  ((a  b) - (a 
b))))

Problem

Reversing the transformation is hard (unlike many control-flow obfuscation, solution is not boolean)

7

Deobfuscation Problems

Deobfuscating data-flow expressions on real-world obfuscated programs yield two distinct research problems.

PB #1
Locating the data to deobfuscate and knowing what to deobfuscate
(depends on what you're looking for
in the binary).
(This is specific to each binary and is mostly manual)

PB #2 Deobfuscating the data obtained after it gets located (in our context a data-flow expression).
(Synthesis only addresses this issue !)
8

Synthesis primer
9

Program Synthesis
 Program synthesis consists in automatically deriving a program from
A high-level specification (typically its semantic through its I/O behaviour) Additional constraints:
 Compilation: a faster program  Deobfuscation: a smaller or more readable program

Program (for which the semantic
is the specification)

Synthesis constraint (fitness function which optimizes speed, size, etc..)

New program (satisfying the specification and constraints)
10

Synthesis for Superoptimization

Synthesis is used in a variety of domains. Applied on program analysis it is mostly used for optimization (known as super-optimization)
or deobfuscation.
Superoptimizers

at core level the same issue

Souper: superoptimizer for LLVM IR (backed by SMT solving)

STOKE: stochastic superoptimizer at

assembly level (x86_64)

11

Synthesis for Deobfuscation

Multiple approaches exist, templates, stochastics (e.g MCTS), solver-based, enumerative approaches, search-based (S-Metaheuristics) etc...

2014
Rolf Rolles, template-based and solver-based approaches
2016

Syntia Monte-Carlo Search Tree based approach

2020

Xyntia Search-based approach using S-Metaheuristics (expected CCS 2021)

MSynth Implementation of QSynth
algorithm with MIASM framework

SSPAM Approach based on pattern matching rewriting rules and
arithmetic simplification (not synthesis per se)

2017
F.Biondi et al. SMT based approach
to defeat MBAs

QSynth Offline enumerative search based approach
(our approach)

2021
LOKI (obfuscation oriented) discuss how to defeat synthesis approaches
12

Greybox Synthesis
(design & principles of our algorithm)
13

Synthesis algorithm

Our algorithm is based on an enumerative approach backed by symbolic execution and a synthesis (itself based
on two sub-components)

program

Symbolic Execution

expr

Synthesis I/O Oracle precomputed table
AST simplification algorithm

expr' 14

Symbolic Execution

 We use symbolic execution as a means of extracting data-flow expressions of registers or

memory at arbitrary locations in the program. The symbolic execution can either be static or

dynamic.

Can backtrack expressions up to program entry

Avoid having to execute the program

Assembly

mov

rax, rsi

xor

rax, 0xFFFFFFFFFFFFFFFF

or

rax, rdi

mov

rcx, rdi

xor

rcx, 0xFFFFFFFFFFFFFFFF

and

rcx, rsi

mov

rdx, rdi

SE

and

rdx, rsi

xor

rdx, 0xFFFFFFFFFFFFFFFF

or

rdi, rsi

add

rax, rcx

sub

rax, rdx

add

rax, rdi

retn

Intermediate Representation

rax0 := rsi rax1 := rax  0xFFFFFFFFFFFFFFFF rax2 := rax1 | rdi rcx0 := rdi rcx1 := rcx0  0xFFFFFFFFFFFFFFFF rcx2 := rcx1 & rsi rdx0 := rdi rdx1 := rdx0 & rsi rdx2 := rdx1  0xFFFFFFFFFFFFFFFF rdi0 := rdi | rsi rax3 := rax2 + rcx2 rax4 := rax3 - rdx2 rax5 := rax4 + rdi0

rax5

AST

15

Our synthesis algorithm

Our algorithm is a greybox synthesizer based on two components

An AST simplification algorithm that can use various
strategies

An I/O oracle based on an offline enumerative search backed by a pre-computed
table

expr

Synthesis
(sub-)AST

I/O Oracle

AST simplification algorithm

synthesised precomputed table expr AST

expr'

Whitebox component

Blackbox component

16

Blackbox vs Whitebox in Synthesis (for deobfuscation)

Blackbox
relates to approaches considering expressions to synthesize as blackboxes and only interacting with them through their input/ouput behavior
+ only influenced by semantic complexity - large search space - boolean result (fully synthesized or not at all)

((((((a  ¬b ) + b) << 1)  ¬ ((a  b) - (a  b))) << 1) - ((((a  ¬b) + b) << 1)  ((a  b) - (a  b))))
Whitebox
relates to approaches manipulating the semantic of the expression through its syntactic representation (usually the AST of the semantic)
+ the exact semantic is considered - influenced by syntactic complexity + enable sub-expressions synthesis
17

Blackbox I/O Synthesis Oracle

Blackbox I/O Oracle

set of pseudorandom inputs

AB i1 0 1

Vin =

i2 -1 3 i3 4 1

A + B


o1 o2 o3
Vout = 1 2 5


o1 o2 o3 125

Equivalent !

Pre-computed tables

Given a grammar with some operators (+, -, |,
&, ..), and variables (a, b, c..), derives all
possible expressions (up to a given bound) and evaluate them on Vin to obtain a function:
Vout  expr

Vout <1, 2, 5> <-1,-4, 3> <1, -1, 5>
....

expr
A + B A - B A | B
....

 generated once, and ensures O(log(n)) synthesis  Unsound but equivalence can be checked by SMT

 What happens if it cannot synthesize the root node ?

18

Whitebox AST search

If it cannot synthesize root node it aims at simplifying sub-expressions to obtain at least a partial synthesis (while with an I/O oracle the result is boolean).
Thus an AST search algorithm will iterate through the graph looking for sub-nodes to synthesize.
Original strategy

Algorithm
1. Search a node to synthesize 2. if find one, replaces it by a
temporary placeholder 3. if not, replaces it also 4. repeat the search until having
substituted all nodes 5. recursively replace placeholders
by the corresponding AST (synthesized or original)

https://youtu.be/ID_PEVseecI

This simplification strategy have some complexity issues (yet it
provides optimal results)
19

New AST search strategies
Top-Down (Divide & Conquer)
Single DFS traversal of the AST. Ensures linearity of the simplification of the algorithm (while original one was quadratic in the worst case).

Top-Down & Bottom-Up
Like Top-Down but if a node gets synthesized attempts to re-synthesize its parents by means of reducing the variable cardinal.

https://youtu.be/VQRg3LHC6Lw

https://youtu.be/G1lBOqmwLaI

20

Algorithm Visualization
21
https://youtu.be/Nz8KC1HtgiI

Algorithm Visualization

https://youtu.be/9MHeGtc3Uhc

22

Algorithm Visualization
23

Table generation
(aka generating a potent I/O oracle)
24

Table Generation

 Table generation requires evaluating millions of expressions and keeping millions of Vout vectors to ignore identical ones (by construction we generate from smaller to larger expressions).

Improvements:
Memoization of all evaluated expressions (thus A+B is evaluated only once for all,
when combined with another expression like A+B-C the memoïzed result is reused for evaluation)
JITTing of expressions evaluation. Evaluation made on native integers (not using Python). For that uses dragonFFI (could also have used numpy).

reach 25K exprs/sec



We now have a table with 375 million entries
(last year we had ~3 millions)

(Generated with a 235 GB RAM machine :p)

25

Table Storage

pickle

Python object serialization module

Python ORM for databases like sqlite

Key Value database (by Google)

 Requires loading the whole table
 Parsing is slow on large object
 Ok for small tables but limited for larger ones



 If Vout primary key, insertion is linear in number of entries.
 If not, lookup is linear in the number of entries
 Not suitable for such large tables



 Store keys as "tries" to ensure O(log(n)) access
 Automatic caching mechanism
 Best suited for our need

(format used by MSynth)

122 µs

 We also made a REST API (using FastAPI) to serve Level-DB database content

26

Expression Normalization

 Tables are limited by the enumerative approach, combining some variables (a, b, c..) with some operators (+, -, & ...). Thus no constants in sight. To improve expression diversity we performed two experiments.

Expression Linearization
Goal: Representing expressions as normalized equations. For that, uses SymPy a library for symbolic maths.

Original

Linearized

a - (c - a)

2*a - c

(a-b) - (a + a) -a - b

a + (b * b)

b2 + a

...

...

Pros/Cons:

 introduces constants !



 annihilates generation performances  introduces power operators

 only works on pure arithmetic

expressions

we thus do not use it in practice

27

Expression Learning

Problem What if the synthesized expression is larger than the one in input ?

expr

Synthesis
I/O Oracle
precomputed table

expr'

28

Expression Learning

Problem What if the synthesized expression is larger than the one in input ?

expr

Synthesis
I/O Oracle
precomputed table

expr'

We can update the table with the smaller expr

It introduces constants !

Input Expr
(a*a) - 1 -1 + a (b ^ a) - 1

Output Expr' (in table)  ((a*a) + a) + (~a)  (~a + a) + (~(-a))  (~a + a) + (b ^ a)

 We also now introduce simple constants in our table generation process

29

Benchmarks
30

Paper benchmarks
Comparison with Syntia

Against Tigress

 Results were promising !

31

Benchmarks improvements
32

Benchmarks improvements
 Paper: Original results
 Syntia: ED + EA (very simple)  EA: EncodeArithmetic 
MBA  VR-EA: Virtualization + EA  EA-ED: EA + EncodeData
33

Benchmarks improvements

Better average simplification than original implementation
(90% for EA-ED)

Speed improvement ranging from 31% to 67%
34

Implementation
(in the QSynthesis utility)
35

QSynthesis

llvmlite

Used for reassembly features
(bit vector IR in ANF form)

Arybo

FastAPI
To serve a table as a REST API

Triton
Dynamic Symbolic Execution framework

Qtrace

QBDI

Dynamic Binary Instrumentation Framework

QSynthesis Framework
(developed in Python)

Dynamic Tracing Framework & Time Travel Debugger (TTD)
dragonffi
For the JITTing of expression evaluation
(during table generation)

IDA Pro
Integrated as a plugin

Level-DB

As database for table

storage

36

IDA Integration
37
https://youtu.be/AwZs56YajJw

Use-Cases
(getting our hands dirty!)
38

Attacking YANSOllvm

Transforms:
 VM: transforms basic operators (+, ..) with function calls
 Merge: merges all internal linkage functions in a single one
 Flattening: CFG flattening  Connect: splits basic blocks
and uses switch to add false branches  ObfCon: obfuscates constants with MBAs  BB2func: splits & extracts basic blocks in new functions  ObfCall: changes internal linkage function calling convention

https://github.com/emc2314/YANSOllvm

 There are plenty of other Obfuscator-LLVM derivatives used in the wild

39

YANSOllvm: VM obfuscation
Synthesized and reassembled to
lea rax, [rsi+rdi] ret
 We then could go further by removing calls and replacing them by the operation directly
40

YANSOllvm: MBA used

OpaqueConstant

MBAs

 ((~x | 0x7AFAFA69) & 0xA061440) + ((x & 0x1050504) | 0x1010104) == 185013572
 p1*(x|any)**2 != p2*(y|any)**2
 x + y = x^y + 2*(x & y)
 x ^ y = (x|~y) - 3*(~(x|y)) + 2*(~x) - y

x + y (x|~y)+(~x&y)-(~(x&y))+(x|y) x - y x + ~y + 1 x << y / x >a y / x >l y / x & y -(~(x&y)) + (~x|y) + (x&~y) x | y (x^y) + y - (~x&y) x ^ y x + y - ((x&y) << 1)

About MBA & constants:

expression using constants: a & 0xdeadbeef   tables do not contains constants

constants:

0xd00dfeed

  can synthesize it !

41

Example: Opaque Constant
blackbox I/O optimization If the evaluation of all inputs produces the same output, thus the expression encodes a constant.

Value synthesized
 0x0
42

Windows Warbird
 Part of the Windows kernel is known to be obfuscated with a framework called Warbird. More specifically PatchGuard features are obfuscated. We gave a very quick look at the PatchGuardInit function.

*thanks Damien for pinpointing me that function

43

Windows Warbird

 Deobfuscating it would require a deeper understanding of the function and more time!

(more detailed analyses of Warbird here & here)

44

Messaging Application
Contains beautiful MBAs 
45

Messaging Application

 We managed to synthesize many MBAs (but as usual it is mixed with other transformations and we do not

really know what we are synthesizing)

46

Conclusion
47

QSynthesis Conclusion
Greybox algorithm The greybox algorithm strongly reduces the need for huge tables
and enable opportunistically synthesizing sub-expressions
(thus tables shall be more representative than exhaustive introducing constants etc)
Next plans
Breaking MBA using constants (we have ideas on mechanisms that can be integrated
within the synthesis algorithm but with some ad-hoc checks)
Restoring original simplification algorithm potency (by fixing some complexity induced by Triton)
48

Takeaways
Breaking the obfuscation is crucial as it is the first step before further reversing
Synthesis only help on a sub-part of the deobfuscation process:  it addresses PB#2: deobfuscating a data-flow expression  but do not addresses PB#1: locating the data to deobfuscate
We do use these techniques to assess and continuously improve the strength of our own obfuscator (Quarks AppShield) (As usual) what makes obfuscation potent is carefully mixing obfuscation passes
49

Acknowledgement
Luigi Coniglio how kickstarted that approach in our dynamic tracing framework Qtrace
Jonathan Salwan that tweaked Triton to make it more efficient on this kind of use-cases My Quarkslab's colleagues, and people of the synthesis community with whom I had stimulating discussions
50

Thank you ! Q & A
rdavid@quarkslab.com @RobinDavid1
51

