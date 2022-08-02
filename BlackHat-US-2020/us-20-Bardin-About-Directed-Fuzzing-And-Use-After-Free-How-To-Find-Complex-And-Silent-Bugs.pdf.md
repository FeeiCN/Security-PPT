About Directed Fuzzing and Use-After-Free: How to Find Complex & Silent Bugs?
Manh-Dung Nguyen, Sébastien Bardin, Matthieu Lemerre (CEA LIST) Richard Bonichon (Tweag I/O)
Roland Groz (Université Grenoble Alpes)
#BHUSA @BLACKHATEVENTS

Who Are We?
Sébastien Bardin
sebastien.bardin@cea.fr Senior Researcher at CEA LIST
Université Paris-Saclay

Manh-Dung Nguyen
@dungnm1710 manh-dung.nguyen@cea.fr PhD Student at CEA LIST & UGA

#BHUSA @BLACKHATEVENTS
2

What's The Talk About?

 Fuzzing is great for finding vulnerabilities in the wild

 Directed fuzzing is a slightly different setting
 Goal = reach a specific target  Bug reproduction, patch-oriented testing

 The problem: Current fuzzing techniques are bad for some classes of issues
 Here: "Use-After-Free" (UAF)  Important: sensitive info leaks, data corruption or first step to other attacks

 Proposal: A directed fuzzing approach tailored to UAF bugs
 and applications to patch-oriented testing  and a tour on UAF and (directed) fuzzing

#BHUSA @BLACKHATEVENTS
3

Use-After-Free
 Heap element is used after having been freed  Critical exploits & serious consequences
 Data corruption  Information leaks  Denial-of-service attacks

# UAF bugs in National Vulnerability Database

#BHUSA @BLACKHATEVENTS
4

Teaser
free
alloc use

 PoC: `AFU'  no crash  Bug Target: 14 (alloc)  17  6  3
(free)  19 (use)  Timeout: 6h

AFL-QEMU AFLGo (binary) (source)

UAFuzz (binary)

(6 hours)

(6 hours) (~ 20 mins)

#BHUSA @BLACKHATEVENTS
5

1. Context
-- about fuzzing, directed fuzzing
#BHUSA @BLACKHATEVENTS
6

Code-level Flaws: Fuzzing is The New Hype
#BHUSA @BLACKHATEVENTS
7

As Its Core, Fuzzing is Random Testing
-- and it starts a long time ago
#BHUSA @BLACKHATEVENTS
8

Now: Three Shades of Fuzzing
· The original taste · Scale but dumb

· Smart but don't scale too much

· The new prodigy · Try to be smart & scale

#BHUSA @BLACKHATEVENTS
9

Principle of Grey/Black Fuzzing

Choose "good" inputs Mutations Observe & compute score
Greybox observes more

The art, science, and engineering of fuzzing: A survey (Manès et al. 2019)

#BHUSA @BLACKHATEVENTS
10

No Silver Bullet

Complex Code Structure

Complex Bugs

Target-oriented Testing?
#BHUSA @BLACKHATEVENTS
11

Directed Greybox Fuzzing (DGF)
 Input: code + target (trace, code location)
 Goal = Cover the target
 AFLGo (2017), Hawkeye (2018)
 Applications:  Bug reproduction  Patch-oriented testing  Static analysis report confirmation

#BHUSA @BLACKHATEVENTS
12

Coverage-guided Greybox Fuzzing AFL

Edge ID

Initial Testsuite

Execution characteristics

Crash-based

Instrumentation Binary
Instrumentation

Seed Selection

Power Schedule

Fuzzing Loop

Triage
Triage

Bugs

#BHUSA @BLACKHATEVENTS
13

Directed Greybox Fuzzing AFLGo, Hawkeye

Edge ID + Distance

Targets

Seed Distance

Execution characteristics

Initial Testsuite

Distance-guided

Crash-based

Binary

Instrumentation

Instrumentation

Seed Selection

Power Schedule

Fuzzing Loop

Triage

Bugs

Triage
#BHUSA @BLACKHATEVENTS
14

2. Back to Use-After-Free (UAF)
#BHUSA @BLACKHATEVENTS
15

Why is Detecting UAF Hard for Fuzzing?

 Rarely found by fuzzers
 Complexity: 3 events in sequence spanning multiple functions
 Temporal & Spatial constraints: extremely difficult to meet in practice
 Silence: no segmentation fault

# UAF bugs found (1%) by OSS-Fuzz in 2017

#BHUSA @BLACKHATEVENTS
16

Recall: Motivation

 PoC: `AFU'  no crash  Bug Target: 14 (alloc)  17  6  3
(free)  19 (use)  Timeout: 6h

AFL-QEMU AFLGo (binary) (source)

UAFuzz (binary)

(6 hours)

(6 hours) (~ 20 mins)

#BHUSA @BLACKHATEVENTS
17

#BHUSA @BLACKHATEVENTS

3. UAFuzz: Directed Fuzzing for UAF
#BHUSA @BLACKHATEVENTS
19

Existing DGF: #1 No Ordering & No Prioritization

Treat everything equally

Targets

Seed Distance

No order

Initial Testsuite

Treat edges equally

Binary

Instrumentation

Instrumentation
Slow

Seed Selection

Power Schedule

Fuzzing Loop

Triage

Triage

UAF Bugs

#BHUSA @BLACKHATEVENTS
20

Existing DGF: #2 Crash Assumption

Treat everything equally

Targets

Seed Distance

No order

Initial Testsuite

Treat edges equally

Expensive sanitizer-based
triage

Binary

Instrumentation

Instrumentation
Slow

Seed Selection

Power Schedule

Fuzzing Loop

Triage

Triage

UAF Bugs

#BHUSA @BLACKHATEVENTS
21

Overview of UAFuzz [tailor every fuzzing step to UAF]

Edge ID + Distance (UAF-based)

Execution characteristics

Binary

Targets Similarity
Seed Distance

Initial Testsuite

Cut-edge Coverage

Pre-triage for free

Targets

Instrumentation

Instrumentation
Fast

Seed Selection

Power Schedule

Fuzzing Loop

Triage

UAF Bugs

Triage
#BHUSA @BLACKHATEVENTS
22

Key Insights of UAFuzz
 Seed Selection: based on similarity and ordering of input trace  Power Schedule: based on 3 seed metrics dedicated to UAF
 [function level] UAF-based Distance: Prioritize call traces covering UAF events  [edge level] Cut-edge Coverage: Cover edge destinations reaching targets  [basic block level] Target Similarity: Cover targets

 Triage only potential inputs covering all locations & pre-filter for free

 Fast precomputation at binary-level

#BHUSA @BLACKHATEVENTS
23

UAF Bug Target
Stack Traces of CVE-2018-20623
// stack trace for the bad Use ==4440== Invalid read of size 1 ==4440== at 0x40A8383: vfprintf (vfprintf.c:1632) ==4440== by 0x40A8670: buffered_vfprintf (vfprintf.c:2320) ==4440== by 0x40A62D0: vfprintf (vfprintf.c:1293) [6] ==4440== by 0x80AA58A: error (elfcomm.c:43) [5] ==4440== by 0x8085384: process_archive (readelf.c:19063) [1] ==4440== by 0x8085A57: process_file (readelf.c:19242) [0] ==4440== by 0x8085C6E: main (readelf.c:19318)
// stack trace for the Free ==4440== Address 0x421fdc8 is 0 bytes inside a block of size 86 free'd ==4440== at 0x402D358: free (in vgpreload_memcheck-x86-linux.so) [4] ==4440== by 0x80857B4: process_archive (readelf.c:19178) [1] ==4440== by 0x8085A57: process_file (readelf.c:19242) [0] ==4440== by 0x8085C6E: main (readelf.c:19318)
// stack trace for the Alloc ==4440== Block was alloc'd at ==4440== at 0x402C17C: malloc (in vgpreload\_memcheck-x86-linux.so) [3] ==4440== by 0x80AC687: make_qualified_name (elfcomm.c:906) [2] ==4440== by 0x80854BD: process_archive (readelf.c:19089) [1] ==4440== by 0x8085A57: process_file (readelf.c:19242) [0] ==4440== by 0x8085C6E: main (readelf.c:19318)

Dynamic Calling Tree
Bug Trace Flattening
UAF Bug Target:
0 (0x8085C6E, main)  1 (0x8085A57, process_file)  2 (0x80854BD, process_archive)  3 (0x80AC687, make_qualified_name)  4 (0x80857B4, process_archive)  5 (0x8085384, process_archive)  6 (0x80AA58A, error)
#BHUSA @BLACKHATEVENTS
24

UAF-based Distance Metric
 Existing works compute seed distance  regardless of target ordering  regardless of UAF characteristic: call traces may contain in sequence alloc/free function and reach use function

 Intuition: UAFuzz favors the shortest path that is likely to cover more than 2 UAF events in sequence
 Statically identify and decrease weights of (caller, callee) in Call Graph
 Ex: favored call traces <main, f2, fuse>, <main, f1, f3, fuse>

Example of Call Graph, favored pairs (caller, callee) are in red
#BHUSA @BLACKHATEVENTS
25

Cut-edge Coverage Metric
ep
 Existing works treat edges equally in terms of reaching in sequence targets

 Cut-edge  Edge destinations are more likely to reach the next target in the bug trace  Approximately identify via static intraprocedural analysis of CFGs
 Intuition: UAFuzz favors inputs exercising more cut edges via a score depending on # covered cut edges and their hit counts

 call f1
 call f2
Control Flow Graph, cut edges are in blue
#BHUSA @BLACKHATEVENTS
26

Target Similarity Metric

 Existing works select seeds to be mutated regardless of
number of covered target locations
 Target Similarity Metric
 Prefix: more precise  Bag: less precise, but consider the whole trace
 Intuition: Seed Selection heuristic based on both prefix and bag metrics
 Select more frequently max-reaching inputs that have highest value of this metric (most similar to the bug trace) so far

0 1 2 3 4 5

trace of input s: 0  1  2  3  7  8  5

alloc

...

free

use
Bug Trace : 0 (alloc)  1  2 (free)  3  4  5 (use)

#BHUSA @BLACKHATEVENTS
27

Power Schedule
Intuition: UAFuzz assigns more energy (a.k.a, # mutants) to
 seeds that are closer (using UAF-based Distance)  seeds that are more similar to the bug trace (using Target Similarity Metric)  seeds that make better decisions at critical code junctions (using Cut-edge
Coverage Metric)
#BHUSA @BLACKHATEVENTS
28

Pre-filter
 Existing works simply send all fuzzed inputs to the bug triager
 Potential inputs: cover in sequence all target locations in the bug trace  UAFuzz triages only potential inputs & safely discards others
 Available for free after the fuzzing process via Target Similarity Metric  Saving a huge amount of time in bug triaging
#BHUSA @BLACKHATEVENTS
29

Implementation

AFL-QEMU

Support more open-source binary disassemblers

#BHUSA @BLACKHATEVENTS
30

4. Experimental Evaluation
#BHUSA @BLACKHATEVENTS
31

Evaluations
 Bug Reproduction
 Time-to-Exposure, # bugs found, overhead, # triaging inputs
 Patch-Oriented Testing

 Evaluated fuzzers
 UAFuzz (BINSEC & AFL-QEMU)  AFL-QEMU  AFLGo (source - level) // Manh-Dung co-author  Our implementations AFLGoB & HawkeyeB
 Benchmark
 13 UAF bugs of real-world programs

#BHUSA @BLACKHATEVENTS
32

Bug Reproduction: Fuzzing Performance

 Total success runs vs. 2nd best AFLGoB: +34% in total, up to +300%
 Time-to-Exposure (TTE) vs. 2nd best AFLGoB: 2.0x, avg 6.7x, max 43x
 Vargha-Delaney metric vs. 2nd best AFLGoB: avg 0.78

Bug-reproducing performance of binary-based DGFs

UAFuzz outperforms state-of-the-art directed fuzzers in terms of UAF bugs reproduction with a high confidence level
#BHUSA @BLACKHATEVENTS
33

Bug Reproduction: Overhead

 Instrumentation overhead
 15x faster in total than AFLGo-source
 Runtime overhead
 UAFuzz has the same total executions done compared to AFL-QEMU

Global Overhead

UAFUZZ enjoys both a lightweight instrumentation time and a minimal runtime overhead

#BHUSA @BLACKHATEVENTS
34

Bug Reproduction: Triage

 Total triaging inputs
 UAFuzz only triages potential inputs (9.2% in total ­ sparing up to 99.76% of input seeds for confirmation)
 Total triaging time
 UAFuzz only spends several seconds (avg 6s; 17x over AFLGoB, max 130x)

Bug Triaging Performance

UAFuzz reduces a large portion (i.e., more than 90%) of triaging inputs in the post-processing phase
#BHUSA @BLACKHATEVENTS
35

5. Patch-Oriented Testing
#BHUSA @BLACKHATEVENTS
36

Patch-Oriented Testing
How to find  Identify recently discovered UAF bugs  Manually extract call instructions in bug traces  Guide the directed fuzzer on the patch code

Targets
 Incomplete patches,
regression bugs
 Weak parts of code

UAFuzz has been proven effective in a patch-oriented setting, allowing to find 30 new bugs (4 incomplete patches, 7 CVEs) in 6 open-source programs
#BHUSA @BLACKHATEVENTS
37

Patch-Oriented Testing: Zero-day Bugs
#BHUSA @BLACKHATEVENTS
38

Buggy Patch in GNU Patch CVE-2019-20633

Using the bug trace of CVE-2018-6952 produced by Valgrind, we found an incomplete fix of GNU Patch with
one different call in red

#BHUSA @BLACKHATEVENTS
39

6. Conclusion

#BHUSA @BLACKHATEVENTS
40

Conclusion & Takeaways
 UAFuzz: A directed fuzzing framework to detect UAF bugs at binary level  Find more bugs in bug reproduction than state-of-the-art tools  New bugs and CVEs in patch-oriented testing
1. Directed Fuzzing exists, and it is practical -- should be integrated into dev. process in addition to standard fuzzing
2. Recent trend toward dedicated fuzzers (UAFuzz, PerfFuzz, MemLock ...) -- perform better than general fuzzers
3. Patch-oriented fuzzing is bigger than patch testing 4. Patching a PoC is not enough, we should find and fix variants of the bug class
#BHUSA @BLACKHATEVENTS
41

Thank you ! Q & A
Manh-Dung Nguyen, Sébastien Bardin, Matthieu Lemerre (CEA LIST) Richard Bonichon (Tweag I/O)
Roland Groz (Université Grenoble Alpes)
~~~
Paper: Binary-level Directed Fuzzing for Use-After-Free Vulnerabilities (RAID'20) UAFuzz: https://github.com/strongcourage/uafuzz
UAF Fuzzing Benchmark: https://github.com/strongcourage/uafbench BINSEC v0.3: https://binsec.github.io/

Partially funded by European H2020 project C4IIOT

#BHUSA @BLACKHATEVENTS

