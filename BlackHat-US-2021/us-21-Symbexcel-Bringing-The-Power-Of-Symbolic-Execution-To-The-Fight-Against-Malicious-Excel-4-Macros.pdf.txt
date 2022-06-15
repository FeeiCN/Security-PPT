Symbexcel: Bringing the Power of Symbolic Execution to the Fight Against Malicious Excel 4 Macros
Giovanni Vigna, Nicola Ruaro, Fabio Pagani, Stefano Ortolani
Threat Analysis Unit, NSBU, VMware, Inc. University of California, Santa Barbara
August 2021

Who we are

Giovanni Vigna
Senior Director of threat Intelligence ­ VMware Professor of Computer Science ­ UCSB Founder - Shellphish

Nicola Ruaro
PhD Student ­ UCSB Member - Shellphish

Fabio Pagani
PostDoc Researcher ­ UCSB Member - Shellphish

Stefano Ortolani Threat Researcher ­ VMware

2

Excel 4.0/XLM Macros in Malware
A legacy of maliciousness
New trend in delivery malware Malware that is used to download or drop a more persistent payload
Primarily being delivered as email attachment Typically via XLS documents, but possible with certain OOXML types
Observed deploying commodity malware Trickbot, Danabot, Gozi, Zloader, etc.
We have been tracking this threat since the beginning of 2020 Set of obfuscation techniques in continuing evolution
3

What Are XL4 Macros?
Power to be abused
25+ year old feature of Excel Predecessor to/replaced by VBA macros
Large set of functions that can be used to interact with both an Excel workbook and the operating system (WinAPI access)
Robust, and easy to understand and create Resemble today's Excel formulas/functions Commonly used for benign purposes by older workbooks that have not migrated to VBA Legitimate business use for calculations

Standard Function XL4 Examples
4

What Are XL4 Macros?
Standard vs XL4 macros
Standard Formulas/Functions
Limited to workbook-related calculations/computations (math/stats) Interaction with components outside of the workbook NOT possible Enabled by default on all worksheets

XL4 Functions
Robust functionality that allows access to file system, registry, WinAPI, etc.
Replaced by VBA macros, but are still functional today
Must reside on an Excel 4.0-enabled macro sheet
5

XL4 Macro Essentials
Code and data
Control flow In an XL4 macro the entry point is the cell containing the Auto_Open label Once the Auto_Open cell is executed, control flow is passed to the cell directly below within the same column; this pattern repeats until interrupted This sequential line-by-line execution can be interrupted by transferring control to another cell via the functions GOTO, RUN, or a user-defined function
Data flow Data is often moved around macro sheets via the FORMULA and FORMULA.FILL functions These functions require a value to be written, and a reference of the destination cell
6

Example: Environmental Checks
Hidden macro sheet No obfuscated code Sandbox evasion routine:
User interaction Mouse capability Audio capability
Evasion Routine

Mouse Audio

Phishing Image
7

Example: Evasion Evolution
Extra protection Hides macro sheet with VeryHidden flag instead of Hidden
Extends evasion routine Checks display size/dimensions of workspace Height/width Another sandbox evasion attempt
Original evasion tricks

VeryHidden
New evasion trick: Display Size Check
Height: (13) Width: (14)

8

Example: Obfuscation
Obfuscation: Heavy usage of CHAR function Translates decimal to ASCII:
CHAR(76) = `L'
Build true payload one character at a time (concatenation)

All the CHARs.
9

Example: Time Dependency
Evasion: Must be executed on specific day of month Day of month is used in deobfuscation routine

Write day of month (+ 7) to cell X33
Deobfuscate payload through rotating hardcoded integers (by -17)

10

Example: Time Dependency
Executed on Incorrect Day
Executed on Correct Day
11

Example: Function Obfuscation
REGISTER is used to register windows function with custom names
Windows function are called using custom name
Use of label and cell address to access string
Evades static deobfuscator to extract useful strings like function name, DLL name, URLs, etc.

Custom function name referred using Label Function call using custom name
12

The Problem with Deobfuscation
Many techniques to obfuscate malware Some techniques hinder detection, some help Deobfuscating macros necessary for:
· Understanding possible behaviors · Extracting indicators of compromise (IoCs)
Extracting macros is a tedious, error-prone task
· Static analysis does not work · Dynamic analysis only sees one path at a time
Can we automate deobfuscation in the presence of environmental checks? How can we guess the "right values"?
13

The Power of Symbolic Execution
Technique to model multiple (all) possible executions Interpret the code, keeping input values symbolic If a conditional statement is found, fork a new state and add the appropriate constraint Once an interesting point in the execution is reached, use a constraint solver to obtain a set of values that satisfy the constraints Result: the deobfuscated code
14

Example
x = int(input()) y = x + 1 if y >= 10:
if x < 100: interesting_code()
else: error_1()
else: error_2()
15

Example
x = int(input()) y = x + 1 if y >= 10:
if x < 100: interesting_code()
else: error_1()
else: error_2()

State A Variables
x = <symval> Constraints
------
16

Example
x = int(input()) y = x + 1 if y >= 10:
if x < 100: interesting_code()
else: error_1()
else: error_2()

State A Variables
x = <symval> y = <symval> + 1
Constraints ------
17

Example
x = int(input()) y = x + 1 if y >= 10:
if x < 100: interesting_code()
else: error_1()
else: error_2()

State A
Variables x = <symval> y = <symval> + 1
Constraints ------

State AA
Variables x = <symval> y = <symval> + 1
Constraints y < 10

State AB
Variables x = <symval> y = <symval> + 1
Constraints y >= 10
18

Example
x = int(input()) y = x + 1 if y >= 10:
if x < 100: interesting_code()
else: error_1()
else: error_2()

State A

Variables

State AA

x = <symvSatla>te AB

Variablesy = <symval> + 1Variables

x = <symval> Constraints x = <symval>

y = <symval> + 1

y = <symval> + 1

------

Constraints

Constraints

y < 10

y >= 10

19

Example
x = int(input()) y = x + 1 if y >= 10:
if x < 100: interesting_code()
else: error_1()
else: error_2()

State A

Variables

State AA

x = <symvSatla>te AB

Variablesy = <symval> + 1Variables

x = <symval> Constraints x = <symval>

y = <symval> + 1

y = <symval> + 1

------

Constraints

Constraints

y < 10

y >= 10

State ABA
Variables x = <symval> y = <symval> + 1
Constraints y >= 10 x < 100

State ABB

Variables x = <symval> y = <symval> + 1

Constraints

y >= 10

x >= 100

20

Example
x = int(input()) y = x + 1 if y >= 10:
if x < 100: interesting_code()
else: error_1()
else: error_2()

State ABA Variables
x = <symval> y = <symval> + 1
Constraints y >= 10 x < 100
Concretized ABA
Variables x = 42
21

Wait, but how?

Confidential  ©2020 VMware, Inc.

Photo by Mika Baumeister on Unsplash

22

The Symbexcel Approach
23

Concrete Analysis
Good for post-infection analysis and de-obfuscation Does not "execute" the sample
Loads the XLS file Starts from the entry-point and interprets all the instructions Can use brute-force and forced execution to side-step the environment configuration
Example: XLMMacroDeobfuscator (kudos! to @DissectMalware)
https://github.com/DissectMalware/XLMMacroDeobfuscator
24

Symbolic Analysis
Concrete
Needs human input (e.g., what should be bruteforced?) Quickly gets ineffective when the search space is large

Symbolic
Understands how environment variables are used and propagated during the execution
Can reason more formally about the environment, and leverage this additional information to solve the constraints

25

Symbexcel Architecture
Loader Solver Backend

Simulation Manager

State
Environment Memory
Constraints

State

State

...

...

...

...

26

Symbexcel Architecture

1
Loader
3
Solver Backend

2
Simulation Manager

State
Environment Memory
Constraints

State

State

...

...

...

...

27

Loader

Loader

Simulation Manager

Solver Backend

Parses the XLS file (BIFF8) and loads it into memory Creates a simulation manager Initializes the memory and environment
xlrd2 (kudos! to @DissectMalware)
Static parsing Faster, but less robust

COM Server
Uses Windows Component Object Model
Interfaces directly with Excel, avoiding some evasion techniques

28

Simulation Manager
State orchestrator Initial state starts executing from the entry point Implements a step : State -> State function

Loader

Simulation Manager

Solver Backend

29

Simulation Manager - State

Loader

Simulation Manager

Solver Backend

Memory
Cell values Formulas (macros) Cell information Defined names

Environment
E.g., Window height, Operating System
Used by the malware authors for sandbox detection
The correct environment configuration is initially unknown, so we associate every environment variable with a symbolic variable

Constraints
E.g., Window height > 390 Characterize the malware execution Propagated to successors states

30

Simulation Manager - Step

Loader

Simulation Manager

Solver Backend

Parses each formula to generate an AST Extended Backus Normal Form (EBNF) grammar Look-Ahead LR (LALR) parser
Dispatches the execution to one of the formula handlers Handlers can update the memory, access the environment, add new constraints, create new branches (states)

31

Example
[A1] =CHAR(72)

Loader

Simulation Manager

Solver Backend

[A1]
[A2]
[A3]
Memory
[A4]
[A5]
[A6]

Environment

WORKSPACE13 WORKSPACE14
32

Example
[A1] =CHAR(72)
UPDATE THE MEMORY

Loader

Simulation Manager

Solver Backend

[A1]

H

[A2]

[A3]
Memory
[A4]

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14
33

Example
[A1] =CHAR(72) [A2] =GET.WORKSPACE(14)

Loader

Simulation Manager

Solver Backend

[A1]

H

[A2]

[A3]
Memory
[A4]

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14
34

Example
[A1] =CHAR(72) [A2] =GET.WORKSPACE(14)
ACCESS THE ENVIRONMENT

Loader

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

[A4]

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14
35

Example
[A1] =CHAR(72) [A2] =GET.WORKSPACE(14) [A3] =IF(GET.WORKSPACE(14) > 390, 75, 76)

Loader

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

[A4]

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14
36

Example

Loader

Simulation Manager

Solver Backend

[A1] =CHAR(72) [A2] =GET.WORKSPACE(14) [A3] =IF(GET.WORKSPACE(14) > 390, 75M, e7m6)ory

CREATE NEW BRANCHES

Environment

[A1]

H

[A2] WORKSPACE14

[A3]

75

[A4]

[A5]

[A6]

Memory

WORKSPACE13 WORKSPACE14

Environment

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4]

[A5]

[A6]

WORKSPACE13 WORKSPACE14

37

Example

Loader

Simulation Manager

Solver Backend

[A1] =CHAR(72) [A2] =GET.WORKSPACE(14) [A3] =IF(GET.WORKSPACE(14) > 390, 75M, e7m6)ory

ADD NEW CONSTRAINTS

Environment

[A1]

H

[A2] WORKSPACE14

[A3]

75

[A4]

[A5]

[A6]

Memory

WORKSPACE13 WORKSPACE14

Environment

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4]

[A5]

[A6]

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 > 390

Constraints

WORKSPACE14 <= 390 38

Example
[A1] =CHAR(72) [A2] =GET.WORKSPACE(14) [A3] =IF(GET.WORKSPACE(14) > 390, 75, 76) [A4] =INT(GET.WORKSPACE(14) > 390) + 84

Loader

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4]

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 39

Example

[A1] =CHAR(72) [A2] =GET.WORKSPACE(14) [A3] =IF(GET.WORKSPACE(14) > 390, 75, 76) [A4] =INT(GET.WORKSPACE(14) > 390) + 84

+

INT

84

>

GET.WORKSPACE(14)

390

Loader

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4]

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 40

Example

[A1] =CHAR(72) [A2] =GET.WORKSPACE(14) [A3] =IF(GET.WORKSPACE(14) > 390, 75, 76) [A4] =INT(GET.WORKSPACE(14) > 390) + 84

+

INT

84

>

GET.WORKSPACE(14)

390

Loader

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4]

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 41

Example

[A1] =CHAR(72) [A2] =GET.WORKSPACE(14) [A3] =IF(GET.WORKSPACE(14) > 390, 75, 76) [A4] =INT(GET.WORKSPACE(14) > 390) + 84

+

INT

84

>

GET.WORKSPACE(14)

390

Loader

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 42

Solver Backend

Loader

Simulation Manager

Solver Backend

We use z3 as our SMT solver backend The most interesting use-case is the execution of a symbolic payload

43

Solver Backend

Loader

Simulation Manager

Solver Backend

We use z3 as our SMT solver backend The most interesting use-case is the execution of a symbolic payload

Memory

BACK TO THE EXAMPLE!

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 44

Solver Backend

Loader

Simulation Manager

Solver Backend

We use z3 as our SMT solver backend The most interesting use-case is the execution of a symbolic payload

Memory

[A5] =FORMULA.FILL(A1&CHAR(A2)&CHAR(A3)&CHAR(A4), A6)

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 45

Solver Backend

Loader

Simulation Manager

Solver Backend

We use z3 as our SMT solver backend The most interesting use-case is the execution of a symbolic payload

Memory

[A5] =FORMULA.FILL(A1&CHAR(A2)&CHAR(A3)&CHAR(A4), A6)

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6]

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 46

Solver Backend

Loader

Simulation Manager

Solver Backend

We use z3 as our SMT solver backend The most interesting use-case is the execution of a symbolic payload

Memory

[A5] =FORMULA.FILL(A1&CHAR(A2)&CHAR(A3)&CHAR(A4), A6)

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6] SYMB_EXPR_2

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 47

Solver Backend

Loader

Simulation Manager

Solver Backend

We use z3 as our SMT solver backend The most interesting use-case is the execution of a symbolic payload
[A5] =FORMULA.FILL(A1&CHAR(A2)&CHAR(A3)&CHAR(A4), A6)
[A6] = ???

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6] SYMB_EXPR_2

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 48

Solver Backend

Loader

[A6] = ??? How many solutions?
[A1]  H [A2]  WORKSPACE14 (integer symbolic variable) [A3]  76 [A4]  (WORKSPACE14 > 390) + 84
WORKSPACE14  2^32 solutions (0, 1, -1, 2, -2...)

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6] SYMB_EXPR_2

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 49

Solver Backend

Loader

[A6] =??? How many solutions?
[A1]  H [A2]  WORKSPACE14 (integer symbolic variable) [A3]  76 CAN WE DO BETTER? [A4]  (WORKSPACE14 > 390) + 84
WORKSPACE14  2^32 solutions

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6] SYMB_EXPR_2

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 50

Observers

Loader

We strategically introduce observer variables to make constraint solving more manageable
An observer is an intermediate symbolic variable that "hides and observes" other sub-expressions in z3

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6] SYMB_EXPR_2

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 51

Observers

Loader

We strategically introduce observer variables to make constraint solving more manageable An observer is an intermediate symbolic variable that "hides and observes" other sub-expressions in z3
[A4]  (WORKSPACE14 > 390) + 84

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6] SYMB_EXPR_2

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 52

Observers

Loader

Simulation Manager

Solver Backend

We strategically introduce observer variables to make constraint solving more manageable
An observer is an intermediate symbolic variable that "hides and observes" other sub-expressions in z3

Memory

[A4]  (WORKSPACE14 > 390) + 84 OBSERVER = (WORKSPACE14 > 390) [A4]  OBSERVER + 84
Now z3 understands that this expression can have two solutions

at most

Environment

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6] SYMB_EXPR_2

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 53

Smart concretization

Loader

We use the XL4 grammar as an oracle to filter concretized results:

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6] SYMB_EXPR_2

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 54

Smart concretization

Loader

We use the XL4 grammar as an oracle to filter concretized results:

H>LT H?LT H@LT HALT HBLT HCLT

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6] SYMB_EXPR_2

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 55

Smart concretization

Loader

We use the XL4 grammar as an oracle to filter concretized results:

H>LT (invalid) H?LT (invalid) H@LT (invalid)
HALT
HBLT (invalid) HCLT (invalid)

Simulation Manager

Solver Backend

Memory

[A1]

H

[A2] WORKSPACE14

[A3]

76

[A4] SYMB_EXPR_1

[A5]

[A6]

HALT

Environment

WORKSPACE13 WORKSPACE14

Constraints

WORKSPACE14 <= 390 56

Malware Sample Analysis
57

Malware Sample Analysis

Error/Pruned Branch

Symbolic Payload

58

Malware Sample Analysis
Stage 1 Deobfuscation
Routine 1

Stage 2

Stage 4 Stage 3

Deobfuscation Routine 2

Error/Pruned Branch

Symbolic Payload

59

Malware Sample Analysis
Deobfuscation Routine 1: Implements a transposition cipher. Used to de-obfuscate the first stage
External loop through the payloads Internal loop through the characters

Error/Pruned Branch

Symbolic Payload

60

Malware Sample Analysis
Deobfuscation Routine 1: Implements a transposition cipher. Used to de-obfuscate the first stage
External loop through the payloads Internal loop through the characters

Error/Pruned Branch

Symbolic Payload

0 2 B2 1H
BH2 0 2 1
61

Malware Sample Analysis
Stage 1: Spawns a new process (Xlcall32:Excel4) and initializes the de-obfuscation of the next stage

Error/Pruned Branch

Symbolic Payload

62

Malware Sample Analysis
Deobfuscation Routine 2: Implements a Vigenere cipher. Used with different decryption keys to deobfuscate the next stages

Error/Pruned Branch

Symbolic Payload

63

Malware Sample Analysis
Deobfuscation Routine 2: Implements a Vigenere cipher. Used with different decryption keys to deobfuscate the next stages

Error/Pruned Branch

Symbolic Payload

AH1$ ! 8 ++++++ 1 0 1 12 17 -7 ====== BH2 0 2 1
BH2 0 2 1
64

Malware Sample Analysis

Stage 2: Writes the first 5 characters of the final decryption key. The malware uses different evasion techniques:
Alternate Data Streams (ADT)
Environment Configuration
System Clock

This sample will not de-obfuscate correctly if it detects an analysis sandbox

Error/Pruned Branch

Symbolic Payload

65

Malware Sample Analysis
Deobfuscation Routine 2

Error/Pruned Branch

Symbolic Payload

AGB 2 1H ++++++ 11? ? ? ? ====== B H B+? 2+? 1+? H+?
BH2 0 2 1
66

Malware Sample Analysis
Stage 3: This stage is mostly symbolic (deobfuscated using the key from stage 2), and writes the 6th and 7th characters of the final decryption key. The malware uses more evasion techniques at this stage:
File System Implementation Excel Macro Security Setting

Error/Pruned Branch

Symbolic Payload

67

Malware Sample Analysis
Deobfuscation Routine 2

Error/Pruned Branch

Symbolic Payload

AGB 2 1H ++++++ 11? ? ? ? ====== B H B+? 2+? 1+? H+?
BH2 0 2 1
68

Malware Sample Analysis
Stage 4: This stage is also completely symbolic. This is the final stage, and will download and register a malicious Windows DLL using rundll32.exe
If the first download fails, the sample is configured to use a backup C&C server

Error/Pruned Branch

Symbolic Payload

69

Malware Sample Analysis

Stage 1
Deobfuscation Routine 1

Stage 2

Stage 4 Stage 3

Deobfuscation Routine 2

70

Malware Sample Analysis

Stage 1
Deobfuscation Routine 1

Stage 2

Stage 4 Stage 3

Deobfuscation Routine 2

IOCs

C:\\Users\\Public\\Documents\\QQKuHA.txt C:\Windows\system32\rundll32.exe https://derocktech.com/k.php https://solemnenterprise.com/k.php

71

Evaluation
72

Evaluation
We collect and analyze 4700 samples reported in the last 6 months (480 clusters) Many samples still have a low detection rate in VirusTotal Some are still undetected
73

Evaluation
Concrete Deobfuscator Symbexcel

Samples correctly deobfuscated
1865
3698

Clusters correctly deobfuscated
324
450
74

Evaluation
Concrete Deobfuscator Symbexcel

Symbolic Samples correctly deobfuscated
3
682

Symbolic Clusters correctly deobfuscated
3
119
75

Conclusion
76

Conclusion
XL4 Macros are an ongoing and evolving threat Difficult to analyze and detect accurately Symbolic Execution allows to analyze samples that would otherwise be impossible to de-obfuscate concretely
Accurate de-obfuscation Accurate classification
77

Thank You
Any questions?

