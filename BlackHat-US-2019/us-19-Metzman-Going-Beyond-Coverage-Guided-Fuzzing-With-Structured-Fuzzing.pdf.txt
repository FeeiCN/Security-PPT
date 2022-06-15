Going Beyond Coverage-Guided Fuzzing with Structured Fuzzing
Jonathan Metzman (metzman@chromium.org)

Unstructured Fuzzing = Magic
2

3

Bio
 Jonathan Metzman  Representing myself, not Google.
 Chrome Security  ClusterFuzz
4

What is Structured Fuzzing?

Structure Unaware Structure Aware

Unguided

/dev/urandom

Coverage-Guided

AFL/libFuzzer (Unstructured
Fuzzing)

Script that generates HTML
files
Structured Fuzzing
5

Why Structured Fuzzing?
6

7

More Bugs: The Data
8

Fuzz Where (you think) the Bugs are

Regehr, John. "Levels of Fuzzing." Embedded in Academia, 22 Sept. 20193, https://blog.regehr.org/archives/1039

Arbitrary Bytes (Unstructured Fuzzer)

X

XX

Syntactically Valid

X (Structured Fuzzer)

X

XX

X

X

X

X X

X

X X X
10

With all Loops

Without Infinite Loops

11

With Barcodes

Without Barcodes

12

Integration Test Style Fuzzing

URLs

AppCache Status

API

Codes

Williamson, Ned. Attacking Chrome IPC.

13

https://media.ccc.de/v/35c3-9579-attacking_chrome_ipc.

Why Structured Fuzzing?
 More bugs  Fuzzing where the bugs are  Integration test style fuzzing
14

How?
15

Custom Mutators
16

Libprotobuf-mutator
17

Converting to a LibFuzzer Custom Mutator

Custom Mutator

Target

Custom Mutator

Target

Test case

Test case

Test case?

Corpus

Corpus
18

How: Three Options
 Custom mutator  Libprotobuf-mutator  Converting to a custom mutator
19

Conclusion
 Find more bugs with structured fuzzing  Use libprotobuf-mutator or custom mutators
20

Links
 Structure Aware Fuzzing  Libprotobuf-mutator  Examples:
 Appcache fuzzer  Skia fuzzer  SQLite fuzzer
21

