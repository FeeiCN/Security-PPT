ROPInjector: Using ReturnOriented Programming for Polymorphism and AV Evasion
G. Poulios, C. Ntantogian, C. Xenakis {gpoulios, dadoyan, xenakis}@unipi.gr

Overview
· Return Oriented Programming (ROP) has been used in the past explicitly for DEP evasion in software exploitation scenarios.
· We propose a completely different use of ROP! · We propose ROP as a polymorphic alternative to
achieve AV evasion!

+



1 PE

1 shellcode

M different variations

ROPInjector

· Local infection of benign PE executables with well-known alarming malicious code (i.e., shellcode)

Benign PE

Malware shellcode
\xfc\xe8\x89\x00\x00\...

ROPInjector
Carrier PE ROP'ed shellcode

Why ROP for AV evasion?
· Does not raise suspicious  Borrowed code (i.e., rop gadgets) is of course benign. The only possible detection footprint is the instructions (i.e., typically push) that insert the addresses of the ROP gadgets into the stack.
· Generic  ROP can be used to transform any given malware shellcode to a ROP-based equivalent.
· Polymorphism  Use different ROP gadgets or use same ROP gadgets found in different address

Challenges
1. The new resulting PE should evade antivirus detection 2. The benign PE should not be corrupted/damaged 3. The tool should be generic and completely automated 4. Should not require a writeable code section to mutate (i.e.,
execute ROP chain)
Challenges Accepted!

A quick historical overview

plain malware code
\x59\xE8\xFF\x6B\x5F\xFF\x6A\x0F\x59\xE8\xFF

string signatures
\x6B\x5F\xFF\x6A\x0F

A quick historical overview

plain malware code
simple obfuscation (NOPs/dead-code in-between)
\x59\xE8\xFF\x6B\x5F\x90\xFF\x90\x6A\x0F\x59\xE8
variability

string signatures
regex signatures
\x6B\x5F{\x90}*\xFF{\x90}*\x6A\x0F

A quick historical overview

plain malware code
simple obfuscation (NOPs/dead-code in-between)

oligomorphism

PC

. . .

\x6A\x0F\x59\xE8\0xFF

decoder

PC
\x6B\x5F**************
encoded payload

string signatures
regex signatures
static analysis (disassembly, CFGs)
if RWX and performs then alarm

A quick historical overview

plain malware code
simple obfuscation (NOPs/dead-code in-between)
oligomorphism

self-modifying code metamorphism

push eax

mov [esp-4],eax sub esp,4

string signatures
regex signatures
static analysis (disassembly, CFGs)
dynamic analysis (emulation, sandboxing, behavior-based signatures)

ROPInjector Steps
1. Shellcode analysis 2. Find ROP gadgets in PE 3. Transform shellcode to an equivalent ROP chain 4. Inject in PE missing ROP gadgets (if required) 5. Assemble ROP chain building code in PE 6. Patch the chain building code into the PE

STEP 1: Shellcode Analysis (1/3)
· The analysis of the shellcode aims to obtain various information so that it can safely replace shellcode instructions with gadgets
· In particular, for each instruction, ROPInjector likes to know:
­ what registers it reads, writes or sets ­ what registers are free to modify ­ its bitness (a mov al,X or a mov eax,X ?) ­ whether it is a branch (jmp, conditional, ret, call) ­ and if so, where it lands ­ whether it is a privileged instruction (e.g. sysenter, iret) ­ whether it contains a VA reference ­ whether it uses indirect addressing mode (e.g. mov [edi+4],
esi)

STEP 1: Shellcode analysis (2/3)
· Scaled Index Byte (SIB) enables complex indirect addressing modes
­ e.g. mov [eax+8*edi+10], ecx
· We want to avoid SIBs in the shellcode because they are:
­ long: >3 bytes  unlikely to be found in gadgets ­ rarely reusable ­ reserve at least 2 registers

STEP 1: Shellcode analysis (3/3)

· ROPInjector performs a technique that we call

it Unrolling of SIBs to transform them into

simpler instructions

mov eax, [ebx+ecx*2]

mov eax, ecx sal eax, 1 add eax, ebx mov eax, [eax]

· ecx is freed at this point · shorter instructions · reusable gadgets
(either found or injected)

· With this technique we achieve

­ increased chances of finding suitable gadgets

­ less gadgets being injected

STEP 2: Find ROP Gadgets in PE (1/2)

1. First find returns of type:

­ ret(n)

or

­ pop regX

jmp regX or

­ jmp regX

· used only if a "loader" gadget of the following form is also found: pop regX [any of the first 2 endings above]

2. Then search backwards for more candidate gadgets

STEP 2: Find ROP Gadgets in PE (2/2)
· ROPInjector automatically resolves redundant instructions in ROP gadgets, in order to avoid errors during execution of ROP code
· Maximize reusability of ROP gadgets · Avoid injecting unsafe ROP gadgets
­ modify non-free registers ­ are branches ­ write to the stack or modify esp ­ are privileged ­ use indirect addressing mode

STEP 3: Transform shellcode to ROP chain
· First, we translate shellcode instructions to an Intermediate Representation (IR).
· Next we translate ROP gadgets found in PE to an IR.
· Finally, a mapping is performed between the two IRs
­ 1 to 1 ­ 1 to many

STEP 3: Intermediate Representation

IR Type (20 in total) Semantics

ADD_IMM

regA += imm

Eligible instructions
add r8/16/32, imm8/16/32 add (e)ax/al, imm8/16/32 xor r8/16/32, 0 cmp r8/16/32, 0 inc r8/16/32 test ra32, rb32 (with ra == rb) test r8/16/32, 0xFF/FFFF/FFFFFFFF test (e)ax/al, 0xFF/FFFF/FFFFFFFF or ra32, rb32 (with ra == rb)

MOV_REG_IMM mov regA, imm
. . .

mov r8/16/32, imm8/16/32 imul r16/32, r16/32, 0 xor ra8/16/32, ra8/16/32 and r8/16/32, 0 and (e)ax/al, 0 or r8/16/32, 0xFF/FFFF/FFFFFFFF or (e)ax/al, 0xFF/FFFF/FFFFFFFF

STEP 3: Mapping examples

· 1-1 mapping example

­ Shellcode:

mov eax, 0  MOV_REG_IMM(eax, 0)
­ Gadget in PE:

and eax, 0

ret

 MOV_REG_IMM(eax, 0)

· 1-many mapping example

­ Shellcode:

add eax, 2  ADD_IMM(eax, 2)
­ Gadget in PE:

inc eax ret

 ADD_IMM(eax, 1)

1 to 1 IR
mapping
1 to 2 IR
mapping

STEP 4: Gadget Injection
· In some cases PE does not include the required ROP gadgets
· Simply injecting ROP gadgets would raise alarms using statistics
­ Presence of successive ret instructions
· To this end, ROPInjector inserts ROP gadgets scattered, and in a benign looking way to avoid alarms
­ 0xCC caves in .text section of PEs (padding space left by the linker) ­ Often preceded by a RET (due to function epilogue)

STEP 4: Gadget Injection
· Assuming missing gadget is mov ecx, eax and we find the following 0xCC cave:
<other instructions>
epilogue: mov esp, ebp pop ebp
return: ret(n) CCCCCCCCCCCCCCCCCCCCCC

STEP 4: Gadget Injection
· Assuming missing gadget is mov ecx, eax and we find the following 0xCC cave:
<other instructions> jmp epilogue mov ecx, eax jmp return epilogue: mov esp, ebp pop ebp return: ret(n) CCCCCCCC

STEP 4: Gadget Injection
· Assuming missing gadget is mov ecx, eax and we find the following 0xCC cave:
<other instructions> jmp epilogue mov ecx, eax jmp return epilogue: mov esp, ebp pop ebp return: ret(n) CCCCCCCC

Normal flow

STEP 4: Gadget Injection
· Assuming missing gadget is mov ecx, eax and we find the following 0xCC cave:
<other instructions> jmp epilogue mov ecx, eax jmp return epilogue: mov esp, ebp pop ebp return: ret(n) CCCCCCCC

ROP flow Normal flow

STEP 5 and 6: Assemble and patch the ROP chain into PE
· In step 5 we insert the code that loads the ROP chain onto the stack (mainly PUSH instructions)
· In step 6 we patch the new PE  ROPInjector extends the .text section (instead of adding a new one that would raise alarm) and then goes on to repair all RVAs and relocations in the PE.
· ROPInjector includes two different methods to pass control to the ROPed shellcode
­ Run first ­ Run last

STEP 6: PE Patching (1/2)

Before injection
NT Header Section Header
(.text) Section Header
(.data) Section Header
(.rsrc)
.text
.data
.rsrc

After Injection
NT Header
Section Header (.text)
Section Header (.data)
Section Header (.rsrc)

NT header checksum recalculated

.text

.data .rsrc

STEP 6: PE Patching (2/2)

Run first: NT Header
AddressOfEntryPoint
(1)
jmp-to-malware

. . .

Section .text

(2)

(3)

[malware code] [replaced code]
jmp-back

Run last:
(very good anti-emulation results)

Previous calls to
ExitProcess()
/ exit()

jmp-to-malware
Section .text

jmp-to-malware
[malware code] ExitProcess()

Evaluation
· Implemented in native Win32 C · 9 32bit executables
­ firefox.exe, java.exe, AcroRd32.exe, cmd.exe, notepad++.exe and more
· Various combinations
­ No patching at all ­ ROP'ed shellcode and run last ­ Intact shellcode passed control during exit (run last) ­ ROP'ed shellcode and delayed execution (20 secs via Win32 Sleep()) ­ Intact shellcode
· 2 of the most popular payloads of MSF
­ reverse TCP shell ­ meterpreter reverse TCP
· VirusTotal
­ at the time it employed 57 AVs

Evasion rate: reverse TCP shell

Evasion ratio

100%

90%

80%

70%

60%

50%

40% AcroRd32.exe

Acrobat.exe

Original file ROP-Exit Exit ROP-d20 Shellcode

cmd.exe

Rainmeter.exe

firefox.exe

java.exe

wmplayer.exe

nam.exe

notepad++.exe

Evasion rate: meterpreter reverse TCP

Evasion ratio

100%

90%

80%

70%

60%

50%

40% AcroRd32.exe

Acrobat.exe

Original file ROP-Exit Exit ROP-d20 Shellcode

cmd.exe

Rainmeter.exe

firefox.exe

java.exe

wmplayer.exe

nam.exe

notepad++.exe

Overall evasion results

Evasion ratio
100% 99,31% 88,99% 83,71% 74,33%

· 100% most of the times · 99.31% on average

100% 90% 80% 70% 60% 50% 40%

Original file ROP-Exit Exit ROP-d20 Shellcode Average evasion ratio

Black Hat Sound Bytes
· Current signature-based detection methods are no longer effective
­ we shown that by using ROP we can reduce the footprint to benign stack modifying instructions
· Behavioral analysis is tough to perform exhaustively
­ we shown how to easily bypass it by running right before process exit
· "Default distrust all" policy
­ Checksums and certificates is the poor user's last line of defense at the moment

