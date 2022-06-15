NoJITsu: Locking Down JavaScript Engines
Taemin Park, Karel Dhondt, David Gens, Yeoul Na, Stijn Volckaert, Michael Franz Department of Computer Science, University of California, Irvine Department of Computer Science, imec-DistriNet, KU Leuven
#BHUSA @BLACKHATEVENTS

Web browser and JavaScript
· Web browsers become essential parts of our daily lives.
· JavaScript fosters rich interaction between browsers and web pages.

SpiderMonkey

V8

JavaScriptCore

Chakra

#BHUSA @BLACKHATEVENTS

Problems in JavaScript Engines
· JavaScript engines are written in an unsafe language such as C/C++.
· JavaScript engines automatically run any script embedded in a webpage.
· Attackers trigger a vulnerability to exploit a victim's machine.

JavaScript engine (C/C++)
#BHUSA @BLACKHATEVENTS

Vulnerable JavaScript Engines

· JavaScript engines are getting bigger · Hundred of vulnerabilities are found every year
Line of code in V8

C/C++

JavaScript

Others

#BHUSA @BLACKHATEVENTS

Semantic of a different start point

JIT Spraying Attack

Script
var y = ( 0x3c54d0d9 ^ 0x3c909058 ^ 0x3c59f46a ^ 0x3c90c801 ^ 0x3c9030d9 ^ 0x3c53535b ^ .......)

JIT'ed code Start here

JIT compile

B8D9D0543C 355890903C 356AF4593C 3501C8903C 35D930903C 355B53533C

Original semantic
MOV EAX,3C54D0D9 XOR EAX,3C909058 XOR EAX,3C59F46A XOR EAX,3C90C801 XOR EAX,3C9030D9 XOR EAX,3C53535B

· Embed malicious code in the huge number of constants with XOR operation

D9D0 FNOP 54 PUSH ESP 3c 35 CMP AL,35 58 POP EAX 90 NOP 90 NOP 3c 35 CMP AL,35 6a F4 PUSH -0C 59 POP ECX 3c 35 CMP AL,35 01c8 ADD EAX,ECX 90 NOP 3C 35 CMP AL,35 D930 FSTENV
DS:[EAX]

· Trigger a vulnerability to jump to the middle of code

Writing JIT-Spray Shellcode for fun and profit, Alexey Sintsov

#BHUSA @BLACKHATEVENTS

Athanasakis, M., Athanasopoulos, E., Polychronakis, M., Portokalidis, G., & Ioannidis, S. (2015). The Devil is in the Constants: Bypassing Defenses in Browser JIT Engines. Presented at the Proceedings 2015 Network and Distributed System Security Symposium.

Advanced Attacks and Defenses on
JIT'ed code
· Attack vectors from multi-threading environment - Corrupt JIT IR when it is being compiled - Write on JIT'ed region when JIT'ed code is emitted to memory

JIT IR JIT'ed code

JIT compilation unit

compile

Write

mprotect(W)

emit

Write

mprotect(R/X)

Song, C., Zhang, C., Wang, T., Lee, W., & Melski, D. (2015). Exploiting and Protecting Dynamic Code Generation. Presented at the Proceedings 2015 Network and Distributed System Security Symposium. Frassetto, T., Gens, D., Liebchen, C., & Sadeghi, A.-R. (2017). JITGuard: Hardening Just-in-time Compilers with SGX (pp. 2405­2419). New York, New York, USA: ACM

#BHUSA @BLACKHATEVENTS

Advanced Attacks and Defenses on JIT'ed code
· Putting JIT compilation into a separate process or trusted execution environment

Bytecode Interpreter

Isolation JIT IR
JIT'ed code

JIT compilation unit

compile

Write

mprotect(W)

emit

Write

mprotect(R/X)

JavaScript engine
Song, C., Zhang, C., Wang, T., Lee, W., & Melski, D. (2015). Exploiting and Protecting Dynamic Code Generation. Presented at the Proceedings 2015 Network and Distributed System Security Symposium. Frassetto, T., Gens, D., Liebchen, C., & Sadeghi, A.-R. (2017). JITGuard: Hardening Just-in-time Compilers with SGX (pp. 2405­2419). New York, New York, USA: ACM

#BHUSA @BLACKHATEVENTS

Contribution
· Bytecode interpreter attack - Corrupt the bytecode interpreter to execute arbitrary systems calls

· Defense mechanisms to protect JavaScript engines - The bytecode interpreter attack - Code-injection, code-reuse attacks

Comprehensive defense

Bytecode Interpreter

JIT compilation unit JIT IR
JIT'ed code

JavaScript engine

System call
Interpreter
Bytecode Sandboxed
Bytecode interpreter
attack
#BHUSA @BLACKHATEVENTS

Bytecode Execution Flow
Script

Bytecode Compiler
Interpreter Dispatcher Load / Store Arithmetic Function call

Load

1

Bytecode instruction

Bytecode Object Table

JS Object
Data

#BHUSA @BLACKHATEVENTS

Bytecode Execution Flow
Script

Bytecode Compiler
Interpreter Dispatcher Load / Store Arithmetic Function call

Load

1

Bytecode instruction

Bytecode Object Table

JS Object
Data

#BHUSA @BLACKHATEVENTS

Threat model
· Memory-corruption vulnerability - Arbitrary read / write capability
· Code-injection defense - WX enforced
· Light weight code-reuse defense - ASLR, coarse-grained CFI

#BHUSA @BLACKHATEVENTS

Bytecode Interpreter Attack

Script
foo(){ var1 = 365 cos(30) }

foo Bytecode Load argument 0 Load function 1 Call function

foo object Table 0 &Arg obj 1 &Func obj 2 &var1 obj

foo()

var1 obj Func obj Context obj Arg obj

365

&cos

30

(*cfuonsc) (&context , 3a0rg ) Interpreter

#BHUSA @BLACKHATEVENTS

Bytecode Interpreter Attack

Script
foo(){ var1 = 365 cos(30) }
vulnerability (){ arbitrary read / write
}
vul_buf = vulnerability() heap layout inference(vul_buf)
corrupt(vul_buf)
foo()

foo Bytecode Load argument 0 Load function 12 Call function

foo object Table 0 &Arg obj 1 &Func obj 2 &var1 obj

obj var1 obj Func obj Context obj Arg obj
.....

&s3y6st5em

&cos

"cmd"

30

s(y*scftuoensmc) ("(c&mcodn"t)ext , 3a0rg ) Interpreter

#BHUSA @BLACKHATEVENTS

Comprehensive Defense: NoJITsu

· Protect core data in script engine execution - Bytecode, object tables, data objects, JIT IR, and JIT'ed code
· Fine-Grained Memory access control over the core data. - Minimize the permission of data as small as possible - Challenge: Overhead from enforcing fine-grained memory access control

Bytecode Object Table

JavaScript Object
Data

JIT IR

JIT'ed code

#BHUSA @BLACKHATEVENTS

Intel Memory Protection Key

· Fine-grained memory access control through Intel Memory Protection Key · Intel MPK (Memory Protection Key)
- A new hardware feature to control the protection of memory - Fast permission change - Support execute-only permission
- Thread local

Key1, WReraitda-bolnely Key15, Read-only

Key6, Read-only

Key2, Writable

Key1, Writable Key15, Writable

Key1, Read-only Key6, Writable

Register Key2, Read-only

Key5, Execute-only

KKeeyy11,,RWearidt-aobnlely Memory (Thread1)

Key5, Read-only

Key1, Read-only
#BHUSA @BLACKHATEVENTS
Memory (Thread2)

Fine-grained Memory Access Control

Thread Write

Bytecode Object table JS Object

(R/W)

mprotect(W) Write Write
mprotect(R/X)

JIT IR

JIT'ed code

(R/X)

Legacy

#BHUSA @BLACKHATEVENTS

Fine-grained Memory Access Control Thread

Thread

Bytecode

Bytecode (R)

Write Object table

Object tables (R)

JS Object

(R/W)

JPSrOimbijteivcet Sensitiv(Re) object (R) object (R)

· mNpe·roetdHectootw(Wodp)oenWwwreitrfeiitnedwailJnlITdwIoRrwitefoinrslterguacltiwornistetoinesatrcuhctkiionndsofJJIdITTaIIRtRa(.R)

·

How

do

we implement permission changes

Write JIT'ed code

(R/X)

for

them.
JIT'ed

code

(X)

(X)

mprotect(R/X)

Legacy

NoJITSu

set_pkey(W,key) Write
set_pkey(R,key)
set_pkey(W,key) Write
set_pkey(X,key)

· Need to open write window for legal write instructions · How do we find all write instructions to each kind of data. · How do we implement permission changes for them.

#BHUSA @BLACKHATEVENTS

Bytecode, Object Table, JIT IR and

JIT'ed Code
· Bytecode, indirection table - Only need write permission at bytecode compilation
· JIT'ed code, JIT IR - Only need write permission at JIT compilation - JIT'ed code contains data needing read-permission (Jump table, Large constant)
JIT'ed code (Machine instruction + Data)

Compile_bytecode() {
..... ..... saved_pkru = set_pkru(W, key_bytecode)
write bytecode
recover_pkru(saved_pkru) ..... ..... }

Machine Instruction (Execute-only)

Data (Read-only)

#BHUSA @BLACKHATEVENTS

· There are a huge number of write access instructions to data object throughout a script code base.

JavaScript Object

There are a huge number of write access instructions to data object throughout a JavaScript code base.

Manual effort?

Static analysis?

JavaScript Engine code base
Data Object pool
JS Object pool

Dynamic analysis
Dynamic analysis

#BHUSA @BLACKHATEVENTS

JavaScript Object - Dynamic Analysis

foo(){ .... .... write instruction

write

Instrumented code

Segmentation fault

Became

}

writable?

((RWearidt-aobnlely))

Add function foo

JS Object pool

Custom signal handler
Is MPK violation?

Function list

#BHUSA @BLACKHATEVENTS

JavaScript Object - Enforcement

Dynamic Analysis Function list

saved_pkru = set_pkru(W, key_obj)

for(I = 0 ; I < 100000 ; i++) {

foo();

}

foo()

recover_pkru(saved_pkru)

{

saved_pkru = set_pkru(W, key_obj)

...

... recover_pkru(saved_pkru)

}

#BHUSA @BLACKHATEVENTS

Dynamic Analysis ­ Input Set
JavaScript Engine code base

JS Object pool

#BHUSA @BLACKHATEVENTS

Dynamic Analysis ­ Input Set
· Member accessor, Payload Accessor, Initialization accessor, GC accessor · Gateways to write on JS object and extensively shared among other functions · Use official JavaScript test suites as our input set
- Include test cases for kinds of objects
JavaScript Engine code base

Member accessor

Payload Accessor

Initialization accessor

GC accessor

JS Object pool

#BHUSA @BLACKHATEVENTS

· Pick only 1/6 of full test suites as input set for dynamic analysis · Successfully run full test suites without error
Accessing Coverage of Dynamic Analysis
· Pick only 1/6 of full test suites as input set for dynamic analysis · Successfully run full test suites without error

JIT test suites (6,000 test cases)

Full test suites (30,000 test cases)

Function list

JavaScript Engine with NoJITsu

#BHUSA @BLACKHATEVENTS

· Bytecode interpreter attack

Attack Analysis

Bytecode interpreter attack
Function call
System call

NoJITsu

Object Table Bytecode

Write

JS object Read-Only

#BHUSA @BLACKHATEVENTS

Attack Analysis
JIT code injection attacks

NoJITsu

R

JIT IR

W

E JIT'ed code W

compilJeIT compilation unit
compile
emit

#BHUSA @BLACKHATEVENTS

Attack Analysis
Advanced code-reuse attack (JIT-ROP)
NoJITsu

&Code pointer1

&Code pointer2 Code page1

&Code page3 Code page2

&Code page4 Code page3
Execute-Only

#BHUSA @BLACKHATEVENTS

Attack Analysis
JIT spraying - Combination of constant blinding and NoJITSu

JIT spraying JIT spraying + ROP style attack

Large constants Small constants

Constant blinding NoJITSu

#BHUSA @BLACKHATEVENTS

Performance Evaluation
· Implemented NoJITsu on Spidermonkey. · LongSpider benchmarks (longer version of the standard JavaScript benchmark suite) · Intel Xeon silver 4112 machine under Ubuntu 18.04.1 LTS
#BHUSA @BLACKHATEVENTS

Evaluation

5% overhead 3% overhead
#BHUSA @BLACKHATEVENTS

Conclusion
· Demonstrate a new attack that leverages the interpreter to execute arbitrary shell commands
· Propose NoJITsu, hardware-backed fine-grained memory access protection for JS engines
· Evaluate our defense, showing the effectiveness in code-reuse and injection attack and our bytecode interpreter attack on JS engines with a moderate overhead
#BHUSA @BLACKHATEVENTS

Thank you
Q&A

#BHUSA @BLACKHATEVENTS

