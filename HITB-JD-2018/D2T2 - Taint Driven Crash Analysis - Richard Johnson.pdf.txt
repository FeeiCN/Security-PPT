Taint Driven Crash Analysis
Hack In The Box Beijing 2018 Richard Johnson
rjohnson@fuzzing.io

· Richard Johnson
Research Lead @richinseattle rjohnson@fuzzing.io

whoami
· Cisco Talos :: Vulndev
­ Third party vulnerability research
­ Microsoft ­ Apple ­ Oracle ­ Adobe ­ Google ­ IBM, HP, Intel
­ Security tool development
­ Fuzzers, Crash Triage
­ Mitigation development

Root Cause Analysis
· Execution Path
· What code paths were executed · What parts of the execution interacted with external data
· Input Determination
· Which input bytes influence the crash
· Root Cause
· Which line of code needs to be patched

Common Vulnerability Analysis Scenarios
· Fuzzing
· Spray `n Pray · Grammar-based · "Fuzzing with Code Fragments"
· Static Analysis
· Intra-procedural Analysis · Manual code review
· Third Party
· In-the-wild exploitation · Vulnerability response teams · Vulnerability brokers

Previous Tooling
· Execution Path
· Process Stalker, CoverIt (hexblog), BlockCov, IDA PIN Block Trace · Bitblaze, Taintgrind, VDT
· Input Determination
· delta, tmin, diff
· Exploitability
· !exploitable · CrashWrangler · CERT Triage Tools

Automation Methods
· Execution Path
· Code Coverage · Taint Analysis
· Input Determination
· Slicing
· Exploitability
· Symbolic Execution · Abstract Interpretation

Automation Methods
· Execution Path
· Code Coverage · Taint Analysis
· Input Determination
· Slicing

Taint Analysis

Concept
· Formally ­ Information Flow Analysis
· Type of dataflow analysis · Can be static or dynamic, often hybrid · Applied to track user controlled data through execution
· Methodology
· Define taint sources · Single-step execution · Apply taint propagation policy for each instruction · Apply taint checks (if any)

Concept
· Define Taint Sources
· Hook I/O Functions · Look for taint sources
· File name, network ip:port, etc · Track tainted file descriptor
· Single-step · Add future data reads from
taint source descriptors to the taint tracking engine · Apply taint policy on each instruction

Concept
· Define Taint Sources
· Hook I/O Functions · Look for taint sources
· File name, network ip:port, etc · Track tainted file descriptor
· Single-step · Add future data reads from
taint source descriptors to the taint tracking engine · Apply taint policy on each instruction

EXPLICIT TAINT PROPAGATION
A = TAINT() B = A C = B + 1 D = C * B E = *(D)
IMPLICIT TAINT PROPAGATION
A = TAINT() IF A > B:
C = TRUE ELSE:
C = FALSE

Implementation Details
· We will utilize Intel PIN to perform dynamic binary translation to instrument a target binary for tracing
· Binary translation is a robust program modification technique
· JIT for hardware ISAs
· PIN supplies a robust API and framework for binary instrumentation
· Supports easily hooking I/O functions for taint sources · High performance single-stepping · Supports instrumenting at instruction level for taint propagation / checks

Implementation Details
· We need to look for user defined taint sources returned from system calls and then single step watching memory propagate throughout the program
· To achieve our taint tracing we forked the PIN tool from the Binary Analysis Platform from Carnegie-Mellon University
· Worked with the authors of BAP since early 2012 to improve the tracer so it performs acceptably against complex COTS software targets on Windows
· Added code coverage and memory dump collection

Implementation Details ­ Trace Format
· The log is saved as a custom binary format with embedded protobuf structures. We use `piqi' to define the structures and compile to protobuf
root@d14e0cf39781:/moflow/bap/libtracewrap/libtrace/piqi-files# cat stdframe.piqi .include [
.module types ]
% Frame representing the execution of a single assembly instruction .record [

Implementation Details ­ Trace Format
% Address of the instruction .field [
.type address .code 1 ]
% Thread id that executed the instruction .field [
.type thread-id .code 2 ]

Implementation Details ­ Trace Format
% Raw bytes of the instruction .field [
.name rawbytes .type binary .code 3 ]

Implementation Details ­ Trace Format
% Operands values read by the instruction .field [
.name operand-pre-list .type operand-value-list .code 4 ]

Implementation Details ­ Trace Format
% Operands values written by the instruction .field [
.name operand-post-list .type operand-value-list .code 5 .optional ]

Implementation Details
· Taint Propagation Policy
· Tree of tainted references to registers and bytes of memory are individually tracked
· If input operands contain taint, propagate to all output operands · No control flow tainting · Optionally taint index registers
· All index registers for LEA instructions are tainted
· No support for MMX, Floating point FCMOV, SSE PREFETCH

Design Considerations
· Taint Policy
· Implicit Information Flows
· Over-tainting
· Most common when applying implicit taint via control flow
· Under-tainting
· If control flow taint is ignored
· Performance
· Execution Speed
· Analysis on each instruction is expensive · Avoid context switching
· Memory Overhead

Taint Tracer Usage
root@d14e0cf39781:/moflow/slicer# ../bap/pin/pin -t ../tracer/gentrace32.so -help -./demo/demo
Pin tools switches
-bb_file [default ] Store the set of visited BBs in a text file
-coverage_track [default false] Enable coverage tracking (only unique BBs)
-exn_file [default ] Store info about exception in a text file
-follow_progs Follow the given program names if they are exec'd

Taint Tracer Usage
-freq [default 10000] Report value of eip every n instructions.
-log_key_frames [default false] Periodically output key frames containing important program
values -log_limit [default 0]
Number of instructions to limit logging to. -log_syscalls [default false]
Log system calls (even those unrelated to taint)

Taint Tracer Usage
-logall_after [default false] Log all (even untainted) instructions after the first tainted instruction
-logall_before [default false] Log all (even untainted) instructions before and after the first tainted instruction
-logfile [default pintool.log] The log file path and file name
-logone_after [default false] Log the first instruction outside of the log range (taint-start/end), and then exit.

Taint Tracer Usage
-o [default out.bpt] Trace file to output to.
-skip_taints [default 0] Skip this many taint introductions
-snapshot_file [default ] File name for memory snapshot
-stack_dump [default 0] How many bytes of stack to dump on exception

Taint Tracer Usage
-taint_args [default false] Command-line arguments will be considered tainted
-taint_env Environment variables to be considered tainted
-taint_files Consider the given files as being tainted
-taint_indices [default false] Values loaded with tainted memory indices will be considered tainted
-taint_net [default false] Everything read from network sockets will be considered tainted

Taint Tracer Usage
-trig_count [default 0] Number of times trigger will be executed before activating.
-trig_mod [default ] Module that trigger point is in.
-unique_logfile [default 0] The log file names will contain the pid
-visited_bb_file [default ] Do not log hits to BBs listed in this file

Taint Tracer Usage
-trig_count [default 0] Number of times trigger will be executed before activating.
-trig_mod [default ] Module that trigger point is in.
-unique_logfile [default 0] The log file names will contain the pid
-visited_bb_file [default ] Do not log hits to BBs listed in this file

· Addresses with a taint value of -1 have merged paths from multiple bytes from the user supplied input
· Positive integers correspond to byte offsets in the original input
· Non-tainted addresses would hold a 0 in that field so offsets are base 1, not base 0

· When an exception occurs the crash context is saved along with memory
· Each allocated page is written to disk for later automated crash analysis

Trace Slicing

Taint Slicing for Root Cause Analysis
· Now we have collected all instructions that interacted with user data, the values of that data for each instruction, and a snapshot of memory at a crash
· We will construct a dataflow dependency graph that holds all relationships between the instructions and the memory values through out the lifetime of the program
· Finally we will select a byte on that graph and find the path from exception back to the original input offset and value

Concept
· Methodology
· Collect trace · Convert trace to BAP IL · Select location and value of interest (register or memory address) · Select direction of slice · Follow dependencies in desired direction to produce sub-graph

Concept
· Trace slicing finds the sub-graph of dependencies between two nodes
· All nodes that influence or are influenced by specified node can be isolated · Reachability Problem
· Forward Slicing
· Slice forward to determine instructions influenced by selected value
· Backward Slicing
· Slice backward to locate the instructions influencing a value · Collect constraints to determine the degree of control over the value

Forward Slicing

· Slice forward to determine instructions influenced by a value

stmt

S

S = {v} For each stmt in statements:
If vars(stmt.rhs) Ç S != Æ then S := S È {stmt.lhs}
Return S

el_size, el_count, el_data = read() {el_size}

total_size = el_size * el_count

{el_size, total_size}

buf = malloc(total_size) while count < el_count
offset = count * el_size

{el_size, total_size} {el_size, total_size} {el_size, total_size, offset}

data_offset = el_data + offset {el_size, total_size, offset, data_offset}

buf_offset = buf + offset
memcpy(buf_offset, data_offset, el_size)

{el_size, total_size, offset, data_offset, buf_offset}
{el_size, total_size, offset, data_offset, buf_offset}

Backward Slicing

· Slice backward to locate the instructions influencing a value

stmt

S

S = {v} For each stmt in reverse(statements):
If {stmt.lhs} Ç S != Æ then S := S È vars(stmt.rhs)
Return S

el_size, el_count, el_data = read() {data_offset, el_data, offset, count, el_size}

total_size = el_size * el_count

{data_offset, el_data, offset, count, el_size}

buf = malloc(total_size) while count < el_count
offset = count * el_size

{data_offset, el_data, offset, count, el_size} {data_offset, el_data, offset, count, el_size} {data_offset, el_data, offset, count, el_size}

data_offset = el_data + offset {data_offset, el_data, offset}

buf_offset = buf + offset

{data_offset}

memcpy(buf_offset, data_offset, el_size)

{data_offset}

· To perform slicing on native assembly language we need to understand the semantics of every instruction
· This is tedious and error prone, especially when support for multiple architectures is desired
· A common solution for this problem is to use an intermediate assembly language that expands complex instructions to simplified RISC like architecture with all side effects explicit

Implementation Details

· BAP includes an intermediate assembly language definition called BIL · BIL expands each native assembly instruction into a sequence of
instructions representing each side effect · Each instruction is easier to analyze and side effects are explicit · We only have to handle assignments of the form var := exp

program ::= stmt*

stmt

::= var := exp | jmp(exp) | cjmp(exp,exp,exp)

| halt(exp) | assert(exp) | label label_kind

| special(string)

Implementation Details

· BAP includes an intermediate assembly language definition called BIL · BIL expands each native assembly instruction into a sequence of
instructions representing each side effect · Each instruction is easier to analyze and side effects are explicit · We only have to handle assignments of the form var := exp

.text:08048887 .text:08048887 .text:08048887 .text:08048887 .text:08048887 .text:08048887 .text:08048887 .text:08048887 .text:08048887

mov edx, [edi+11223344h] ; ; @context "R_EDX" = 0x1000, 0, u32, wr ; @context "R_EDI" = 0x11, 1, u32, rd ; @context "mem[0x11223355]" = 0x0, 0, u8, rd ; @context "mem[0x11223356]" = 0x0, 0, u8, rd ; @context "mem[0x11223357]" = 0x0, 0, u8, rd ; @context "mem[0x11223358]" = 0x0, 0, u8, rd ; label pc_0x8048887 ; R_EDX:u32 = mem:?u32[R_EDI:u32 + 0x11223344:u32, e_little]:u32

Slicing with moflow
· Get the prebuilt docker image:

Slicing with moflow
· First we will record the taint trace and then we will convert to the BAP intermediate language.
· We will use concrete substitution (concretization) to load the values that were in memory into the IL
· BAP is capable of doing fully static analysis but for our purposes of crash analysis we want to use the memory values

Slicing with moflow
· First we will record the taint trace and then we will convert to the BAP intermediate language.
· We will use concrete substitution (concretization) to load the values that were in memory into the IL
· BAP is capable of doing fully static analysis but for our purposes of crash analysis we want to use the memory values

Slicing with moflow
· root@d14e0cf39781:/moflow/slicer# sudo ../bap/pin/pin -t ../tracer/gentrace32.so -taint_indices -taint_files input.txt -snapshotfile /tmp/demo.snapshot -o /tmp/demo.trace -- ./demo/demo tlv demo/input.txt 2>/dev/null
· total_size: 65535, record_count 1111638594
· root@d14e0cf39781:/moflow/slicer# ../utils/iltrans -trace /tmp/demo.trace -trace-concrete-subst -trace-dsa -pp-ast /tmp/demo.trace.il
· Concrete Substitution Run: Done! (0.412670 seconds)

Slicing with moflow
· We now have a file in /tmp/demo.trace.il that is plaintext. We could have output bjson, json, protobuf, or plaintext
· We see taint introduced at the top

Slicing with moflow
· On the next slide we will skip down to the first instruction executed after the read() system call returns.
· Before the first instruction description we see there are variable names given to each byte that was read in.
· Each time a memory location is written to it will get a new variable name assigned. This is called a Static Single Assignment form and simplifies our slicing
· These are in the form dsa_["mem"|"REG"]_[address]_1_[unique ID]

Slicing with moflow
· We now have a file in /tmp/demo.trace.il that is plaintext. We could have output bjson, json, protobuf, or plaintext
· We see taint introduced at the top

Slicing with moflow
· That is a little cumbersome at first glance so let's break it down
· This shows the values of EAX which was read, dereferenced, and written back in to EAX.
· The memory value in EAX that was dereferenced is shown on the last line. The field after the byte value is `1' meaning it is the first byte from our input file

Slicing with moflow
· Lets quickly take a look at the exception that we were tracing in the debugger

· We crashed in a memcpy. We know that if the user controls any of the arguments to a memcpy this could be a potentially exploitable bug
· We are not interested in the internals of libc, we can see that memcpy was called from our main image, so lets just get the tainted instructions in our main image

· One of these instructions required some sanity checking before the user controlled operands were passed as arguments to memcpy
root@d14e0cf39781:/moflow/slicer# grep "addr 0x804" /tmp/demo.trace.il addr 0x80488a0 @asm "mov edx,DWORD PTR [eax+0x8]" @tid "0" addr 0x80488a6 @asm "mov eax,DWORD PTR [eax+0x4]" @tid "0" addr 0x80488a9 @asm "mov DWORD PTR [esp+0x8],edx" @tid "0" addr 0x80488ad @asm "mov DWORD PTR [esp+0x4],eax" @tid "0" addr 0x80488dc @asm "mov eax,DWORD PTR [eax+0x4]" @tid "0" addr 0x80488df @asm "mov DWORD PTR [esp+0x8],eax" @tid "0" addr 0x80488e3 @asm "mov eax,DWORD PTR [ebp+0x8]" @tid "0" addr 0x80488e6 @asm "mov DWORD PTR [esp+0x4],eax" @tid "0"

· We could run the tool three times, slicing back on any byte from each of the three memcpy parameters. In the last instructions executed before calling memcpy we see that the instructions that were setting the "src" and "size" parameters to memcpy were tainted.
root@d14e0cf39781:/moflow/slicer# grep "addr 0x804" /tmp/demo.trace.il addr 0x80488a0 @asm "mov edx,DWORD PTR [eax+0x8]" @tid "0" addr 0x80488a6 @asm "mov eax,DWORD PTR [eax+0x4]" @tid "0" addr 0x80488a9 @asm "mov DWORD PTR [esp+0x8],edx" @tid "0" addr 0x80488ad @asm "mov DWORD PTR [esp+0x4],eax" @tid "0" addr 0x80488dc @asm "mov eax,DWORD PTR [eax+0x4]" @tid "0" addr 0x80488df @asm "mov DWORD PTR [esp+0x8],eax" @tid "0" addr 0x80488e3 @asm "mov eax,DWORD PTR [ebp+0x8]" @tid "0" addr 0x80488e6 @asm "mov DWORD PTR [esp+0x4],eax" @tid "0"

· EAX is being moved to the stack, so lets see the instruction before the mov to ESP+8 and grab the variable name of a memory byte that EAX was pointing to

· The dsa_mem variable names are the expected input for our slicer so we can pick one and now get a slice of only the instructions that touched that byte of data
· We see the path from libc copying the file from fread into a buffer and then copying values from that buffer to the length parameter to memcpy()

· Now we examine the operands to that first instruction to see the byte offsets in the file. They are shown below as byte 5, 6, 7, and 8 which are base 1. We can see the value was 65535 which was too large and undhecked , resulting in a ReadAV
root@d14e0cf39781:/moflow/slicer# ./slicer -il /tmp/demo.trace.il -var dsa_mem_ffffd20b_1_24602 2>/dev/null | grep -A10 0xddaf3506 addr 0xddaf3506 @asm "rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]" @tid "0" @context "R_EDI_32" = 0xffffd260, 0, u32, rd @context "R_ESI_32" = 0xdda0a004, 0, u32, rd @context "R_ECX_32" = 0xff, -1, u32, rw @context "R_EFLAGS" = 0x246, 0, u32, rd @context "mem32[0xdda0a004]" = 0xff, 5, u8, rd @context "mem32[0xdda0a005]" = 0xff, 6, u8, rd @context "mem32[0xdda0a006]" = 0x0, 7, u8, rd @context "mem32[0xdda0a007]" = 0x0, 8, u8, rd

Thank you!
rjohnson@fuzzing.io https://moflow.org https://github.com/moflow

