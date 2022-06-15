Black Hat Europe 2019
ClusterFuzz
Fuzzing at Google Scale
Abhishek Arya Oliver Chang

About us
 Chrome Security team (Bugs--)  Abhishek Arya (@infernosec)
 Founding Chrome Security member  Founder of ClusterFuzz  Oliver Chang (@halbecaf)  Lead developer of ClusterFuzz  Tech lead for OSS-Fuzz
2

Fuzzing
 Effective at finding bugs by exploring unexpected states  Recent developments
 Coverage guided fuzzing  AFL started "smart fuzzing" (Nov'13)
 Making fuzzing more accessible  libFuzzer - in-process fuzzing (Jan'15)  OSS-Fuzz - free fuzzing for open source (Dec'16)
3

Fuzzing mythbusting
 Fuzzing is only for security researchers or security teams  Fuzzing only finds security vulnerabilities  We don't need fuzzers if our project is well unit-tested  Our project is secure if there are no open bugs
4

Scaling fuzzing
 How to fuzz effectively as a Defender?  Not just "more cores"
 Security teams can't write all fuzzers for the entire project  Bugs create triage burden
 Should seamlessly fit in software development lifecycle  Input: Commit unit-test like fuzzer in source  Output: Bugs, Fuzzing Statistics and Code Coverage
5

Fuzzing lifecycle

Manual
Write fuzzers

Automated
Upload builds

Build bucket Cloud Storage

Fuzzing

Find crash

De-duplicate Minimize Bisect

File bug

Fix bugs

Close bug

Test if fixed (daily)

6 Assign bug

ClusterFuzz
 Open source - https://github.com/google/clusterfuzz  Automates everything in the fuzzing lifecycle apart from
"fuzzer writing" and "bug fixing"  Runs 5,000 fuzzers on 25,000 cores, can scale more  Cross platform (Linux, macOS, Windows, Android)  Powers OSS-Fuzz and Google's fuzzing
7

Fuzzing lifecycle
1. Write fuzzers 2. Build fuzzers 3. Fuzz at scale 4. Triage crashes 5. Improving fuzzers
8

Step 1: Write fuzzers
9

Finding targets to fuzz
 Attack surface enumeration  e.g. Chrome
 Sandboxed renderer process  Direct untrusted input
 Privileged processes:  Fuzz IPC boundaries
 Third party libraries  Parsers, complicated processing of input data  VRP reports

?
10

Black box fuzzing
 Generation or mutation based, with rules specific to a particular format  e.g. A script that generates valid but randomized HTML files
 Slow (few execs/sec)  Significant effort to write (>1k LoC)

Corpus

Fuzzer

Target application

11

Black box fuzzing
 Chrome employs a number of custom black box fuzzers to do "integration" style testing  HTML/DOM fuzzers  JavaScript fuzzers  IPC fuzzers
 Gestures  Not guided by coverage
12

Grey box fuzzing

 Coverage-guided fuzzers  AFL  libFuzzer
 Better for testing more focused parts of codebase, akin to unit tests

Corpus

Fuzzing engine
Target function

Coverage feedback

13

Grey box fuzzing
 Unit test-like stubs, called "fuzz targets" (as little as 5 LoC)  Write once, run with multiple fuzzing engines (AFL, libFuzzer, etc)
extern "C" int LLVMFuzzerTestOneInput(const uint8_t *Data, size_t Size) {
DoSomethingInterestingWithMyAPI(Data, Size); return 0; }
14

Grey box fuzzing
 No need for mutation or generation logic  Fuzzing engine does mutation based on coverage feedback  Dictionaries/seed corpora can help a lot
 Written by developers to complement traditional unit testing  "Security is everyone's job now, not just the security team's." -- Werner Vogels, Amazon CTO
15

Black box vs grey box
 When to use grey box fuzzing?  Smaller, more targeted components  Encourage developers to write these  Preferred
 Black box fuzzing still necessary  Larger components  Non-deterministic targets  Integration testing
16

Structure aware fuzzing
 Bridges some gaps between grey box and black box fuzzing  Structure (protos) + rules = libprotobuf-mutator  Manual, cumbersome, but equally rewarding  Reference: Jonathan Metzman talk, Black Hat USA 2019
17

Structure aware fuzzing example

Structure
message SQLQueries { repeated CreateTable queries = 1;
}
message CreateTable { optional TempModifier temp_table = 1; required Table table = 2; required ColumnDef col_def = 3; repeated ColumnDef extra_col_defs = 4; repeated TableConstraint table_constraints = 5; required bool without_rowid = 6;
}
// Further definitions of TempModifier, Table, ColumnDef, and TableConstraint.

Rules
std::string CreateTableToString(const CreateTable& ct) { std::string ret("CREATE TABLE "); if (ct.has_temp_table()) { ret += TempModifierToString(ct.temp_table()); ret += " "; } ret += TableToString(ct.table()); ret += "("; ret += ColumnDefToString(ct.col_def());
....

DEFINE_BINARY_PROTO_FUZZER(const SQLQueries& sql_queries)

{

std::string queries = SQLQueriesToString(sql_queries);

sql_fuzzer::RunSQLQueries(queries);

}

18

Scaling fuzzer writing
 Key to scaling is not through cores, but through educating developers
 Documentation and examples for writing grey box fuzzers
 Provide guidance on efficient fuzzing  Seed corpora, dictionaries
 Make grey box fuzzing a first class citizen (like unit tests)
19

Step 2: Build fuzzers
20

Building fuzzers
 Use compile-time instrumentation  AddressSanitizer, MemorySanitizer, etc...  Coverage instrumentation  2x~ performance penalty
 Link with a fuzzing engine or driver  libFuzzer: clang -fsanitize=address,fuzzer ...
21

Building fuzzers (cont)
 Make sure that release version is fuzzed  Assertions etc are often noisy when fuzzing  (Optional) Add debug version for assertion coverage
 Optimization level matters  Speed vs more edges
 Builds should be continuous  Ideally produced as artifacts of existing CI infrastructure
22

Step 3: Fuzz at scale
23

Fuzzing task management

Preemptible VMs
Write new crashes

Task queue
Non-preemptible VMs
DB Process crashes: - Minimize - Bisect - etc
24

Picking targets
 Large projects can have thousands of fuzz targets  Automatic fuzz target discovery  Prioritize based on fuzz target quality
 Productive target > Unproductive target > Target with startup issues
 Prioritize based on sanitizer importance  ASan > MSan > Others (UBSan / CFI / TSAN)
25

Corpus management

Download

Global corpus

Corpus pruning
Distillation

Quarantine

Sync new files (new coverage)

Other corpora

Cross-pollination

Other corpora

Fuzzing

26

Fuzzing strategies
 No perfect search heuristic  Corpus subset  Value profiling  Custom mutators  Limiting maximum length of inputs
 Corpus enhancement techniques  Radamsa mutator  Recurrent neural network mutator (ML-based)
27

Fuzzing strategy selection
 Multi-armed bandit (MAB)  Waste fewer resources on bad fuzzing strategies  Choose strategy combinations that improved coverage  Some runs use strategies with a default weight  Act as dynamic input to MAB model  Rest of runs use strategies based on MAB optimizations
28

Step 4: Triage crashes
29

De-duplication
 Based on stacktraces  (Crash type, Crash state, Security flag) tuple
 Pick top 3 "interesting" frames as the crash state  Include debug and release assertions  Exclude inline frames, common library and debug funcs
 Ignore stacktrace for OOMs and Timeouts  Used for immediate de-duplication
30

De-duplication
[1:1:1030:FATAL:layout_inline.h(399)]Security DCHECK failed: !object || (object->IsLayoutInline()). ==1==ERROR: AddressSanitizer: ABRT on unknown address 0x053900000001 (pc 0x7f24f8426428 ...)
#0 0x7f24f8426427 in gsignal /build/glibc-Cl5G7W/glibc-2.23/sysdeps/unix/sysv/linux/raise.c:54 #1 0xb599eb3 in logging::LogMessage::~LogMessage()base/logging.cc:876:7 #2 0x14171df5 in ToLayoutInline third_party/blink/renderer/core/layout/layout_inline.h:39:91 #3 0x14171df5 in blink::LayoutBox::ContainingBlockLogicalWidthForPositioned(...) #4 0x1417b923 in blink::LayoutBox::ComputePositionedLogicalWidth(...)
!object || (object->IsLayoutInline()) in layout_inline.h blink::LayoutBox::ContainingBlockLogicalWidthForPositioned blink::LayoutBox::ComputePositionedLogicalWidth
31

Grouping
 Second stage of de-duplication (slower)  Same crash can manifest with a slightly
different signature  Use Levenshtein distance to group all
similar crashes  Works well with real world crashes
32

Testcase minimization
 Makes testcases less flaky and easier to root cause  Grey box fuzzers
 Often provide facilities for fast minimization  Black box fuzzers
 Delta debugging based testcase minimization  Slower out-of-process minimization, but parallelized
33

Bisection
 A large percent of bug finds are "regressions" (OSS-Fuzz: ~40%)  Early reverts are far easier than CVEs  Bisection based on simple binary search  Re-use same builds used for fuzzing

Good

?

Bad

34

Variant analysis
 A crash input can manifest with different signatures across sanitizers, fuzzing engines, platforms, architectures
 Automate analysis across all possible configs  Help with severity analysis
for (operand = 0, numBitsFound = 0, currentBit = 1 << ((opcodePTR->size * 8) - 1);
35

Automatic bug filing
 Automatic assignment of owner based on bisect results  If failed, assign to sub-product area bug queue
 Provide minimized reproducer, detailed crash report  "Fuzz-blocker" label if hurting fuzzer performance  File ONLY reproducible crashes
 Exception: frequent unreproducible crashes
36

Automatic bug filing
37

38

Prioritization
 Don't attempt to do deep analysis on bugs to figure out impact  Not scalable
 Assume all memory corruption are exploitable  Rough automated prioritization based on
 Type of crash (e.g. UaF vs null deref)  Where the crash occurs
 E.g. if the crash occurs in a sandboxed process
39

Fix verification
 Verify that fix actually causes a crash to stop reproducing  Perform a bisect to verify the commit which fixed the bug
 Useful for comparing different bugs with same root cause  Sometimes, an unrelated patch can fix the issue  Auto-close bugs once verified  Human errors can be common
40

Vulnerability reward program

 External PoCs can be uploaded to the fuzzing infrastructure

 Get same benefits of automated triage

 Deduplication, fix verification, etc  Fuzzer reward program
 Continuous bug reporting pipeline

$$$

 High-quality reports

41

Step 5: Improving fuzzers
42

Fuzzer statistics

>1000 =100%

>0

=0%
43

Crash statistics
44

Code coverage
 Separate coverage instrumented build (Clang Source Code Cov)  Run fuzz target with distilled corpus ->
Per-fuzz target / Aggregate project report
45

Other applications
46

Non-security bugs
 Correctness bugs via differential fuzzing, e.g. CryptoFuzz  Across different product implementations  Across different languages, compilers, optimizations  E.g. optimized ASM vs pure C
 Stability bugs  Denial-of-service attacks can be serious in many scenarios  Fixing stability bugs leads to a more productive fuzzer  Esp. leaks, ooms, timeouts, null-ptr dereferences
47

Design and development decisions
 Should we add this third party library to our project?  Require fuzzing or integration in OSS-Fuzz as prerequisite  How well are those endpoints fuzz tested? Coverage?
 Feedback to prioritize security mitigations  Sandboxing  Allocator hardening  etc
48

Results
49

Chrome, OSS and Google
 Overall 40,000 bugs found  Vulnerabilities found: 5000+ in Chrome, 3500+ in OSS-Fuzz  Vulnerabilities fixed: Chrome (98.6%), OSS (91.4%)  Methodology works for both large projects (Chrome, Google)
and smaller projects in OSS-Fuzz (250+)  Developer evangelism - tech talks, contests, etc
50

Results outside of Google
51

Future plans
52

Future plans
 Fuzzing as part of Continuous Integration (CI) to catch regressions before check-in
 Alternate solution to artificial fuzzer benchmarks (e.g. LAVA-M)  Continue to improve fuzzing efficiency - e.g. more focused
mutations using DataFlowSanitizer  Support for more languages (Java, Python, etc)
53

Conclusion
 Fuzzing should be an integral part of developer workflows  Not just for security researchers
 Different fuzzing engines and strategies can be combined effectively at scale
 Large projects with thousands of developers can be fuzzed effectively with a small team  Smaller projects can use the same methodology
54

