Detecting (un)intentionally hidden injected Code by examining Page
Table Entries

Detecting (un)intentionally hidden injected Code by
examining Page Table Entries
Frank Block fblock@ernw.de

ernw-research.de

www.insinuator.net

@WEareTROOPERS

Agenda
· Short introduction on Code injections · Motivation · How to hide · How to detect · Conclusion

Code Injection: Why and How
· Possible reasons:
· The parent process might die after exploitation (e.g. heap spraying). · Malware does not want to be easily killed by a user (e.g. running ransomware). · Stealing/Manipulating data from the target process. · Hiding from the user/investigator. ·...
· A simple and common, but also noisy approach is this API sequence:
· OpenProcess, VirtualAllocEx, WriteProcessMemory and CreateRemoteThread

Evil Process
Evil.exe Malicious
Code

Victim Process
Victim.exe ntdll.dll

Evil Process
Evil.exe Malicious
Code

Victim Process
Victim.exe ntdll.dll

Evil Process
Evil.exe Malicious
Code

Victim Process
Victim.exe Malicious
Code ntdll.dll

Victim Process

New Thread
executes

Victim.exe
Malicious Code

ntdll.dll

Example malfind Output for Reflective DLL Injection
Process: svchost.exe Pid: 3564 Address: 0x13f6cd60000 Vad Tag: VadS Protection: EXECUTE_READWRITE Flags: PrivateMemory: 1, Protection: 6
0x13f6cd60000 4d 5a 90 00 03 00 00 00 04 00 00 00 ff ff 00 00 MZ.............. 0x13f6cd60010 b8 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00 ........@....... 0x13f6cd60020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................ 0x13f6cd60030 00 00 00 00 00 00 00 00 00 00 00 00 e8 00 00 00 ................

VAD struct ... StartingVpn EndingVpn ... u.VadFlags.ProtectionEnum ...

Victim Process
Victim.exe Malicious
Code ntdll.dll

The Starting Point for this Research
"One of the most misleading and poorly documented aspects of the Protection field from the VAD flags is that it's only the initial
protection specified for all pages in the range when they were first reserved or committed.
Thus, the current protection can be drastically different." Ligh et. al.[1]

malfind output for modified Reflective DLL Injection
Nothing to see here

VAD struct ... StartingVpn EndingVpn ... u.VadFlags.ProtectionEnum ...

Victim Process
Victim.exe ntdll.dll

ni al rotec on ea dOnl y
age O age O age O age O age O
...

ni al rotec on ea dOnl y
age O age age age age O
...

On trusting VADs contd.
· On the other hand we have the modification of mapped image files.
· Malware can use pages of mapped files for code too: EXECUTE_WRITECOPY
· Prior detection techniques at most compared the information from VADs and the PEB (Process Hollowing) or were looking for hooks.
· One exception: White et. al.[2]

Further Hiding Techniques
· Shared memory with EXECUTE_WRITECOPY protection · Mapped data files · Paged out pages: (un)intentional hiding

Current detection plugins
· Detection mainly based on VADs/memory
· malfind · hashtest
· Detection mainly based on other criteria (e.g. threads)
· threadmap · malthfind · hollowfind · malfofind · Psinfo · gargoyle

Hiding results
· With the VirtualAllocEx/VirtualProtectEx trick we've successfully hidden injected code from malfind, hashtest and Psinfo.
· ith paged out pages we've successfully hidden injected code from malfind, hashtest, Psinfo and malthfind.
· With shared memory/mapped data files with EXECUTE_WRITECOPY protection, we've successfully hidden injected code from malfind.
· Only hollowfind, malfofind and Psinfo were unimpressed by the hiding techniques in regards to Process Hollowing.

There are various flavors of Code Injections
· APC Injections · Process Hollowing · AtomBombing · Reflective DLL Injection ·...
· All have one aspect in common: They result in new/modified code/data in the target process's domain.

What are we looking for?
· Rootkit Paradox (Kornblum[3])
· In Essence: While the rootkit tries to hide its existence, in order to do nasty stuff, its code must (at least once) be locatable and executable.
· So, the goal is to identify any executable data in user space.

PTEs and the PFN Database
· PTE (Page Table Entry)
· 64bit (x64/x86- E) sized "struct", defining a physical page (if valid). · "The final truth", as the C U's decision on reading/writing/executing data from a
given address is dependent on the bits in its PTE.
· PFN Database is the physical point of view on the available pages.
· In our case mainly used to answer one question: Has this page been modified?

0
PML4

PML4E

...

Virtual Address

...

Table

PTE

63
Offset
Physical Address

CR3
Source: Intel® 64 and IA-32 Architectures Software Developer's Manual Volume 3A

0
PML4

Virtual Address

...

Table

63
Offset

PTE

PML4E

...

Physical Address

0

CR3

PW ...

PFN

Source: Intel® 64 and IA-32 Architectures Software Developer's Manual Volume 3A

63

...

X

PTE

0

MMPTE_HARDWARE

P=1 W

...

63

PFN

...X

MMPTE_TRANSITION

P=0 W ... Prot P=0 T=1

PFN

...

MMPTE_SOFTWARE

P=0 PL Prot P=0 T=0 ...
and more

PageFileHigh

PTEs and the PFN Database
· So what can we detect with those?
· Executable pages in general, no matter where they are (in mapped files, not related to any file, swapped out, ...).
· E.g. executed code on the stack in a DEP disabled process.
· Executable and Modified pages for mapped image files.
· And how?

Case study DEP
· When DEP is not active for a running process, code can get executed from pages with e.g. READWRITE protection.
· But per default, all non-executable pages have still the NX bit set. · If instructions should be fetched from such a page, an access violation
occurs and the OS takes over. · Windows will then unset the NX bit for that particular page and the CPU can
fetch instructions from it. · This makes it easy with our approach to identify those, as they stand out.

ta ck
... age age age
... age

ptenum Output for executed Code on Stack

Process: messagebox.exe Pid: 2508 Address: 0x460000
Vad Tag: VadS Protection: READWRITE
Flags: PrivateMemory: 1, Protection: 4
The Vadtype is: Private
1 non empty page(s) with a total size of 0x1000 bytes in this VAD were executable (and for mapped image files also modified).
Skipping the first 0x1ff000 bytes, as they are either not modified (only applies for mapped image files), empty or not executable.

0x65f000 00 00 00 00 90 f1 65 00 c7 15 6c 76 01 00 00 00 0x65f010 00 00 00 00 96 14 6c 76 57 0c 01 43 09 00 80 01 0x65f020 a9 14 6c 76 78 f0 65 00 00 00 00 00 00 00 00 00 0x65f030 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

......e...lv.... ......lvW..C.... ..lvx.e......... ................

ptenum Output for Reflective DLL Injection

Process: notepad.exe Pid: 4284 Address: 0x1400dea0000
Vad Tag: VadS Protection: READONLY
Flags: PrivateMemory: 1, Protection: 1
The Vadtype is: Private
22 non empty page(s) with a total size of 0x16000 bytes in this VAD were executable (and for mapped image files also modified).
Skipping the first 0x1000 bytes, as they are either not modified (only applies for mapped image files), empty or not executable.

0x1400dea1000 4d 5a 90 00 03 00 00 00 04 00 00 00 ff ff 00 00 0x1400dea1010 b8 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00 0x1400dea1020 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0x1400dea1030 00 00 00 00 00 00 00 00 00 00 00 00 10 01 00 00

MZ.............. ........@....... ................ ................

ptenum Output for Reflective DLL Injection with paged out Pages
Process: notepad.exe Pid: 4284 Address: 0x1400dea0000 Vad Tag: VadS Protection: READONLY PrivateMemory: 1, Protection: 1 The Vadtype is: Private 22 non empty page(s) with a total size of 0x16000 bytes in this VAD were executable (and for mapped image files also modified). Seems like all executable pages from this VAD are not available from the memory dump (e.g. because they have been paged out). So there is nothing to dump/disassemble here.

Limitations & Future Work
· This approach does not detect injected code/data in non executable pages ­ e.g. gargoyle.
· Does not work with paged out Paging Structures and no pagefile given (could do a fallback to malfind like approach ­ is however again prone to attacks).
· The amount of data to examine can be huge, mainly because of modified pages of mapped image files.
· Plugin is however suitable as:
· Improved malfind (with the --ignore_image_files option). · Before/After comparison.
· Usage in existing code injection plugins to improve their results. · Volatility version will be coming soon.

Black Hat Sound Bytes
· It is possible to hide from current code injection plugins with simple tricks.
· -> on't blindly trust s.
· To find executable memory reliably, Page Table Entries must be examined.
· There is a Rekall plugin now (ptenum) that does that for you.

Online Resources
· Links to the most current version of the ptenum plugin and all tools/data to reproduce the research results can be found here: https://github.com/fblock/BlackHat-EU-2019
· The research paper by me and Andreas Dewald, with more details, can be found here: https://www.sciencedirect.com/science/article/pii/S1742287619301574

I wanted to thank
· The people behind Rekall for their amazing work.
· The authors of olatility and "The rt Of Memory Forensics".
· The authors of all mentioned detection plugins.
· Last but not least Enrico Martignetti for his great book on Windows memory management " hat Makes t age? The indows 7 ( 6 ) irtual Memory Manager"

Thank you for your Attention
Questions/Criticism/Remarks/Suggestions?

Sources
· [1] Ligh, M.H., Case, A., Levy, J., Walters, A., 2014. The Art of Memory Forensics: Detecting Malware and Threats in Windows, Linux, and Mac Memory
· [2] Andrew White, Bradley Schatz, Ernest Foo, 2013. Integrity Verification of User Space Code, https://dfrws.org/file/206/download?token=jDpt_E9p
· [3] Jesse Kornblum, 2006. https://pdfs.semanticscholar.org/dd79/86995b903a9c1ba16e228f6debfc3cf 539cc.pdf

