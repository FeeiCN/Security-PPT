SESSION ID: HT-W02
Autonomous Hacking: The New Frontiers of Attack and Defense
#RSAC

Giovanni Vigna
CTO Lastline, Inc. @lastlinelabs

Hacking
2

#RSAC
?

#RSAC
Hacking Teams
3

#RSAC
Hacking What?
Security compromises can be achieved through different routes
4

#RSAC
Hacking the User
5

#RSAC
Hacking the Process
6

#RSAC
Hacking the Code
7

#RSAC
Hacking Binary Code
Low abstraction level No structured types No modules or clearly defined functions Compiler optimization and other artifacts can make the code more complex to analyze WYSIWYE: What you see is what you execute
8

#RSAC
Finding Vulnerabilities

Human

Semi-Automated

Fully Automated

#RSAC
Manual Analysis
"Look at the code and see what you can find" Requires substantial expertise
The analysis is as good as the person performing it
Allows for the identification of complex vulnerabilities (e.g., logic-based) Expensive, does not scale

#RSAC
Tool-Assisted Analysis
"Run these tools and verify/expand the results" Tools help in identifying areas of interest
By ruling out known code By identifying potential vulnerabilities
Since a human is involved, expertise and scale are still issues

#RSAC
Automated Analysis
"Run this tool and find the vulnerability"
... and possibly generate an exploit... ...and possibly generate a patch
Requires well-defined models for the vulnerabilities Can only detect the vulnerabilities that are modeled Can scale (not always!)

#RSAC
Automated Vulnerability Analysis
An algorithm that takes as input a code artifact (source code, byte-code, binary code) and identifies potential vulnerabilities
The Halting Problem: "the halting problem is the problem of determining, from a description of an arbitrary computer program and an input, whether the program will finish running or continue to run forever."
https://en.wikipedia.org/wiki/Halting_problem
Alan Turing proved that a general algorithm does not exist

#RSAC
Types of Vulnerability Analysis
Static Analysis
A form of abstract interpretation Does not execute the code
Dynamic Analysis
A form of concrete interpretation Executes the code (or a model of it)

#RSAC
Static Analysis
The goal of static analysis techniques is to characterize all possible runtime behaviors over all possible inputs without actually running the program Find possible bugs, or prove absence of certain kinds of vulnerabilities Static analysis has been around for a long while
Type checkers, compilers Formal verification
Challenges: soundness, precision, and scalability

#RSAC
Soundness and Completeness
Actual run-time behaviors P

#RSAC
Soundness and Completeness
Over-approximation (sound) Actual run-time behaviors
P

#RSAC
Soundness and Completeness
More precise over-approximation (sound)
Actual run-time behaviors P

#RSAC
Soundness and Completeness
Actual run-time behaviors P
Under-approximation (complete)

#RSAC
Soundness and Completeness
Actual run-time behaviors P Unsound, incomplete analysis

#RSAC
Example Analyses
Control-flow analysis: Find and reason about all possible control-flow transfers (sources and destinations) Data-flow analysis: Reason about how data flows at run-time (from sources to sinks) Data dependency analysis: Reason about how data influences other data Points-to analysis: Reason about what values can pointers take Alias analysis: Determine if two pointers might point to the same address Value -set analysis: Reason about what are all the possible values that variables can hold

#RSAC
Dynamic Analysis
Dynamic approaches are very precise for particular environment and inputs
You execute the code!
However they provide no guarantee of coverage
You evaluate only the part of a program that you exercise!

#RSAC
Example Analyses
Taint analysis Fuzzing Forward symbolic execution Concolic execution
23

#RSAC
Fuzzing
Fuzzing is an automated procedure to send inputs and record safety condition violations as crashes
Assumption: crashes are potentially exploitable
Several dimensions in the fuzzing space
How to supply inputs to the program under test? How to generate inputs? How to generate more "relevant" crashes? How to change inputs between runs?
Goal: maximized effectiveness of the process

Gray/White-box Fuzzing

Bugs (0-day)

Input Generator

Application Under Analysis

Crash

Feedback

Fuzzing Infrastructure

#RSAC
Crash Database

#RSAC
Fuzzing: American Fuzzy Lop

#RSAC
Fuzzing: American Fuzzy Lop
Instrumentation-guided genetic fuzzer developed by Michael Zalewski The instrumentation collects information at branch points
Supports the generation of inputs that improve coverage
Inputs that bring new paths are considered more interesting and queued for further exploration Inputs are chosen and mutated Unique crashes are identified using branch analysis (instead of stack summaries)

#RSAC
Symbolic Execution: angr
Framework for the analysis of binaries Supports a number of architectures
x86 (32 and 64), MIPS, ARM, PPC, etc.
http://angr.io https://github.com/angr angr@lists.cs.ucsb.edu

#RSAC
angr Components

angr

Binary Loader
Static Analysis Routines
Symbolic Execution Engine

Control-Flow Graph Data-Flow Analysis Value-Set Analysis
Forward Symbolic Execution Under-constrained SE

#RSAC
Symbolic Execution
"How do I trigger path X or condition Y?" Dynamic analysis
Input A? No. Input B? No. Input C? ... Based on concrete inputs to application
(Concrete) static analysis
You can't/You might be able to Based on various static techniques

#RSAC
Symbolic Execution
"How do I trigger path X or condition Y?" Interpret the application Track "constraints" on variables When the required condition is triggered, "concretize" to obtain a possible input

#RSAC
Concretization
Constraint solving Conversion from set of constraints to set of concrete values that satisfy them

Constraints
x >= 10 x < 100

Concretize

x = 42

#RSAC
Example
x = int(input()) if x >= 10:
if x < 100: vulnerable_code()
else: func_a()
else: func_b()

Example
x = int(input()) if x >= 10:
if x < 100: vulnerable_code()
else: func_a()
else: func_b()

State A Variables x = ??? Constraints ------

#RSAC

Example
x = int(input()) if x >= 10:
if x < 100: vulnerable_code()
else: func_a()
else: func_b()

#RSAC

State A Variables x = ??? Constraints ------

State AA Variables x = ??? Constraints x < 10

State AB Variables x = ??? Constraints x >= 10

Example
x = int(input()) if x >= 10:
if x < 100: vulnerable_code()
else: func_a()
else: func_b()

#RSAC

State AA Variables x = ??? Constraints x < 10

State AB Variables x = ??? Constraints x >= 10

Example
x = int(input()) if x >= 10:
if x < 100: vulnerable_code()
else: func_a()
else: func_b()

#RSAC

State AA Variables x = ??? Constraints x < 10

State AB Variables x = ??? Constraints x >= 10

State ABA
Variables x = ???
Constraints x >= 10 x < 100

State ABB
Variables x = ???
Constraints x >= 10 x >= 100

Example
x = int(input()) if x >= 10:
if x < 100: vulnerable_code()
else: func_a()
else: func_b()

State ABA Variables x = ??? Constraints x >= 10 x < 100
Concretized ABA
Variables x = 99

#RSAC

#RSAC
Putting It All Together
Fuzzing excels at producing general input Symbolic execution is able to satisfy complex path predicates for specific input Key insight: Combine both techniques to leverage their strengths and mitigate their weaknesses

#RSAC
Assisting Fuzzing with Symbolic Execution

Fuzzing
good at finding solutions for general
input

Symbolic Execution
good at find solutions for specific input

Driller

#RSAC
Test Cases

Driller
"Cheap" fuzzing coverage

#RSAC
Test Cases "X" "Y"

Driller
"Cheap" fuzzing coverage Dynamic Symbolic Execution

#RSAC

Test Cases "X"

!

"Y"

Driller
"Cheap" fuzzing coverage Dynamic Symbolic Execution
New test cases generated

#RSAC
Test Cases "X" "Y"
"CGC_MAGIC"

Driller
"Cheap" fuzzing coverage Dynamic Symbolic Execution
New test cases generated

#RSAC
Test Cases "X" "Y"
"CGC_MAGIC" "CGC_MAGICY"

#RSAC
Why Hacking?
Vulnerability analysis can be used
Offensively Defensively For fun (and profit)
Hacking competitions have become a popular venue for the application of breakthrough techniques in vulnerability analysis
DefCon CTF Pwn20wn

#RSAC
Many Competition Styles

Challenge-based
Should not be called "CTF"! Easy to organize Easy to scale Exclusively focused on attacking No real-time component

Interactive, online CTFs
Very difficult to organize
Require substantial infrastructure
Difficult to scale
Focused on both attacking and defending in real time

#RSAC
Current Interactive, Online CTFs
From ctftime.org: 100+ events listed Online attack-defense competitions:
UCSB iCTF 13 editions RuCTF 5 editions FAUST 1 edition

#RSAC
The iCTF Framework
Lessons learned from running iCTFs were the basis for building a framework The framework formalizes the structure of services and allows for the reuse of the infrastructure Available at:
http://github.com/ucsb-seclab/ictf-framework http://ictf.cs.ucsb.edu/framework

#RSAC
CTFs Are Playgrounds...
For people (hackers) For tools (attack, defense) But can they be used to advance science?
52

DARPA Competitions
Self-driving Cars

Robots

#RSAC

53

#RSAC
The DARPA Cyber Grand Challenge
Programs!
54

#RSAC
The DARPA Cyber Grand Challenge
55

#RSAC
The DARPA Cyber Grand Challenge
56

#RSAC
The DARPA Cyber Grand Challenge
CTF-style competition Autonomous Cyber-Reasoning Systems (CRS) attack and defend a number of services (binary programs) NO HUMAN IN THE LOOP A first qualification round decided who the 7 finalists are
Qualification comes with a $750,000 cash prize
The final event is scheduled for August 4, 2016 during DefCon
The top team will receive a $2,000,000 cash prize
57

#RSAC
Shellphish CGC Team
58

#RSAC
CGC Other Finalists

CodeJitsu disekt

CSDS

DeepRed

ForAllSecure
59

TECHx

#RSAC
CGC Participant Systems

CB
vulnerable program

POV
exploit
Cyber Reasoning
System
RB
patched program

60

#RSAC
The CGC Environment
Binaries run on a custom OS, called DECREE
Limited number of system calls
A POV has to demonstrate the ability:
To read a specific value from memory To set a register to a specific value
Not all rules have been finalized
61

#RSAC
The Shellphish CRS: ShellWePlayAGame?
CYBER GRAND CHALLENGE
62

The Shellphish CRS: ShellWePlayAGame?

PCAP CB

Autonomous processing
Autonomous vulnerability
scanning

Autonomous patching

Shellphish CRS

Test cases
Proposed POVs

POV
Autonomous service
resiliency
RB

Proposed RBs

63

#RSAC

#RSAC
May the Best CRS Win!
Patching cannot affect performance Patching cannot affect functionality When you are shooting blindfolded automatic weapons, it's easy to shoot yourself in the foot...
64

#RSAC
Fostering Research in Automated Hacking
The goal of the CGC is to foster the development of new attack and defense techniques that...
Automatically identify and exploit vulnerabilities in binary programs Automatically patch vulnerability and provide functionallyequivalent yet secure versions of a vulnerable binary
65

#RSAC
What Does All This Mean to YOU?
Novel automated analysis techniques will allow for
The identification of vulnerabilities (and, possibly, backdoors) in binaries before they are deployed The patching of binaries on-the-fly without having to wait for vendors' fixes Scale...
66

#RSAC
What Can I Do NOW?
Use CTFs (or other security competitions) to foster computer education in your company The iCTF Framework is free, open, and can be used to create sophisticated attack-defense security competition within your organization Familiarize yourself with vulnerability analysis tool and learn how to use them as integral part of your development process After all...
67

#RSAC
Human + Machine = WIN!
OMG, can't do stairs?!?
68

#RSAC
Q&A
69

#RSAC
Extra Slides

#RSAC
The iCTF Architecture

10.7.1.2 Team 1

Vulnerable Server

VPN Gateway

10.7.1.X

10.7.2.2
Vulnerable Server

Team 2
VPN Gateway

Team 21 10.7.21.2

...

VPN Gateway Vulnerable

Server

Team 22 10.7.22.2
VPN Gateway Vulnerable
Server

Allows teams to register and submit flags
Team Interface

VPN Server

For each tick, schedules scripts and compute scores
Gamebot

Shows the current scores to the teams
Scoreboard

Stores the state of the competition
Database

Runs the scripts to update flags and check for services
Scriptbot

#RSAC
Example: Simple Overflows
int main(int argc, char** argv) { char buf[256]; strcpy(buf, argv[1]); return 0;
}
Simplest detection approach: grep for strcpy
More rigorous:
Determine data flow from command-line argument to strcpy's parameter Determine size of source, destination buffers Model semantics of strcpy Check safety condition: len(argv[1]) < len(buf)

#RSAC
Fuzzing vs. Symbolic Execution

#RSAC
Exploration Process

The UCSB iCTFs

Year 2003 2004 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015

Theme Open-Source Windows UN Voting System Bass Tard Corporation Spam Museum Hillbilly Bank Copyright Mafia Softerror.com Terrorist Network Rise of the Botnet Rogue Nation of Litya Money Laundering SCADA Defense Nuclear Cyberwar Large-Scale Hacking Crowdsourced Evil

#RSAC
Teams 7 15 9 22 25 36 39 57 73 89 92
123 86 35

#RSAC
Branch Tracking
The instrumentation collects information about which branches are taken
The information is stored in a shared hash table. A branch from a previous location to the current location triggers the instrumentation code:
cur_location = <COMPILE_TIME_RANDOM>; shared_mem[cur_location ^ prev_location]++; prev_location = cur_location >> 1;

#RSAC
Branch Tracking
cur_location = <COMPILE_TIME_RANDOM>; shared_mem[cur_location ^ prev_location]++; prev_location = cur_location >> 1;
Note that the index in the hash is a combination of the previous and current location
The size of the shared memory is 64K
Big enough to avoid collisions Small enough to be fast and fit in memory caches
The shift of the marker for the current location allows for
Distinguishing A->B from B->A Distinguishing A->A from B->B

#RSAC
Branch Tracking
Branch tracking is a better metric for program exploration than plain basic block coverage
Consider the following cases, where A, B, C, D, E are code blocks:
A -> B -> C -> D -> E (tuples: AB, BC, CD, DE) A -> B -> D -> C -> E (tuples: AB, BD, DC, CE)
While the same amount of code is covered, but different paths are taken

#RSAC
Guiding Exploration
AFL maintains a global map of all the paths observed in all the executions up to the current one
When a mutated input file introduces tuple that were not observed before, the input file is queued for further processing
Inputs that do not generate new transitions, are discarded (even if the sequence has not been seen before)

#RSAC
Example
#1: A -> B -> C -> D -> E #2: A -> B -> C -> A -> E (C->A, A->E are new) #3: A -> B -> C -> A -> B -> C -> A -> B -> C -> D -> E (no new tuples)

#RSAC
Counting Branches
AFL keeps track of how many times a certain transition happens for each run
Buckets: 1, 2, 3, 4-7, 8-15, 16-31, 32-127, 128+
If a particular input causes a transition to move between buckets, then the input is deemed interesting and queues for processing
Buckets allow for emphasizing small changes (1 to 2) vs. not-sorelevant changes (67 to 70)

#RSAC
Processing Input
The interesting file (thousands) are added to the input queue
Usually 10-30% from the discovery of new transitions The rest from changes in the hit count
The input queue is analyzed so that a subset of the (best) files is marked as "favorite"
The files cover all the tuples The files have lowest latency and size

#RSAC
Prioritizing the Inputs
1. Choose a tuple from the ones observed so far and put it in a set
2. Select the input that caused the shortest execution and has the smallest size
3. Add all the transitions observed for that execution to the set
4. If the set does not covered all the previously observed transitions, goto 1

#RSAC
Prioritizing the Inputs
If there are new, yet-to-be-fuzzed favorites present in the queue, 99% of non-favored entries will be skipped to get to the favored ones
If there are no new favorites:
If the current non-favored entry was fuzzed before, it will be skipped 95% of the time If the current non-favored entry was not fuzzed before, the odds of skipping it are 75%
These values are chosen to balance queue cycling and diversity

#RSAC
Fuzzing Strategies
Sequential bit flips with varying lengths and stepovers
Sequential addition and subtraction of small integers
Sequential insertion of known interesting integers (0, 1, INT_MAX, etc.)
Stacked bit flips, insertions, deletions, arithmetic operations, and splicing of different test cases
It is also possible to provide dictionaries of known keywords to help in the fuzzing process

