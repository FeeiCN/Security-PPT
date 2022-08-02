Relocation Bonus
Attacking the Windows Loader Makes Analysts Switch Careers
1 / 67

Introduction

Relocation Bonus - Introduction

2 / 67

Introduction
Nick Cano

Relocation Bonus - Introduction

2 / 67

Introduction
Nick Cano
25 years old

Relocation Bonus - Introduction

2 / 67

Introduction
Nick Cano
25 years old Senior Security Architect at Cylance

Relocation Bonus - Introduction

2 / 67

Introduction
Nick Cano
25 years old Senior Security Architect at Cylance Author of Game Hacking: Developing Autonomous Bots for Online Games

Relocation Bonus - Introduction

2 / 67

Introduction
Nick Cano
25 years old Senior Security Architect at Cylance Author of Game Hacking: Developing Autonomous Bots for Online Games Pluralsight Instructor, Modern C++ Secure Coding Practices: Const Correctness

Relocation Bonus - Introduction

2 / 67

Introduction
Nick Cano
25 years old Senior Security Architect at Cylance Author of Game Hacking: Developing Autonomous Bots for Online Games Pluralsight Instructor, Modern C++ Secure Coding Practices: Const Correctness
Relocation Bonus

Relocation Bonus - Introduction

2 / 67

Introduction
Nick Cano
25 years old Senior Security Architect at Cylance Author of Game Hacking: Developing Autonomous Bots for Online Games Pluralsight Instructor, Modern C++ Secure Coding Practices: Const Correctness
Relocation Bonus
A look into the Windows Portable Executable (PE) header and how it can be weaponized to destroy parsers, disassemblers, and other tools

Relocation Bonus - Introduction

2 / 67

Introduction
Nick Cano
25 years old Senior Security Architect at Cylance Author of Game Hacking: Developing Autonomous Bots for Online Games Pluralsight Instructor, Modern C++ Secure Coding Practices: Const Correctness
Relocation Bonus
A look into the Windows Portable Executable (PE) header and how it can be weaponized to destroy parsers, disassemblers, and other tools A PE rebuilder that takes any 32bit PE then obfuscates and rebuilds it using the attack

Relocation Bonus - Introduction

2 / 67

Why Attack Relocations?

Relocation Bonus - How Did I Get Here?

3 / 67

Why Attack Relocations?

Relocation Bonus - How Did I Get Here?

3 / 67

Why Attack Relocations?

Relocation Bonus - How Did I Get Here?

4 / 67

Why Attack Relocations?

Relocation Bonus - How Did I Get Here?

5 / 67

Why Attack Relocations?

Relocation Bonus - How Did I Get Here?

6 / 67

Why Attack Relocations?

Relocation Bonus - How Did I Get Here?

7 / 67

Why Attack Relocations?
its broken for no reason

Relocation Bonus - How Did I Get Here?

7 / 67

Why Attack Relocations?

its broken for no reason

relocations corrupted the patched code

Relocation Bonus - How Did I Get Here?

7 / 67

Why Attack Relocations?

its broken for no reason

relocations corrupted the patched code

don't patch code that is relocated

Relocation Bonus - How Did I Get Here?

7 / 67

Why Attack Relocations?

its broken for no reason

relocations corrupted the patched code

don't patch code that is relocated
Relocation Bonus - How Did I Get Here?

relocations can be weaponized to hide my arsenal in the bowels of the machine

7 / 67

Mission Statement

Relocation Bonus - Crafting The Attack

8 / 67

Mission Statement

Relocation Bonus - Crafting The Attack

8 / 67

What Are Relocations?

Relocation Bonus - Crafting The Attack

9 / 67

What Are Relocations?
Relocations exist to enable dynamic mapping, specifically ASLR

Relocation Bonus - Crafting The Attack

9 / 67

What Are Relocations?
Relocations exist to enable dynamic mapping, specifically ASLR

Relocation Bonus - Crafting The Attack

9 / 67

What Are Relocations?
Relocations exist to enable dynamic mapping, specifically ASLR

Relocation Bonus - Crafting The Attack

10 / 67

What Are Relocations?
Relocations exist to enable dynamic mapping, specifically ASLR

Relocation Bonus - Crafting The Attack

11 / 67

What Are Relocations?
Relocations exist to enable dynamic mapping, specifically ASLR

Relocation Bonus - Crafting The Attack

12 / 67

PE Header Sidebar

Relocation Bonus - Crafting The Attack

13 / 67

PE Header Sidebar

Relocation Bonus - Crafting The Attack

13 / 67

PE Header Sidebar

Relocation Bonus - Crafting The Attack

14 / 67

PE Header Sidebar

Relocation Bonus - Crafting The Attack

15 / 67

PE Header Sidebar

Relocation Bonus - Crafting The Attack

16 / 67

How Do Relocations Work?

Relocation Bonus - Crafting The Attack

17 / 67

How Do Relocations Work?

Relocation Bonus - Crafting The Attack

18 / 67

How Do Relocations Work?
VirtualAddress points to first reloc block

Relocation Bonus - Crafting The Attack

19 / 67

How Do Relocations Work?
VirtualAddress points to first reloc block Size is the size, in bytes, of all blocks

Relocation Bonus - Crafting The Attack

20 / 67

How Do Relocations Work?
VirtualAddress points to first reloc block
Size is the size, in bytes, of all blocks
(uint16_t)0x0000 marks the end of each block

Relocation Bonus - Crafting The Attack

21 / 67

How Do Relocations Work?

Relocation Bonus - Crafting The Attack

22 / 67

How Do Relocations Work?

Relocation Bonus - Crafting The Attack

23 / 67

How Do Relocations Work?

Relocation Bonus - Crafting The Attack

24 / 67

How Do Relocations Work?

Relocation Bonus - Crafting The Attack

25 / 67

How Do Relocations Work?

Relocation Bonus - Crafting The Attack

26 / 67

How Do Relocations Work?

Relocation Bonus - Crafting The Attack

27 / 67

How Do Relocations Work?

Something like this

delta = base - desiredBase;

(

reloc : relocs) {

block = (base + reloc.VirtualAddress);

(

entry : reloc.entries) {

adr = block + entry.offset;

(entry.type == IMAGE_REL_BASED_HIGHLOW) // <- this

*((

*)adr) += delta;

(entry.type == IMAGE_REL_BASED_DIR64)

*((

*)adr) += delta;

(entry.type == IMAGE_REL_BASED_HIGH)

*((

*)adr) += (

)((delta >> 16) & 0xFFFF);

(entry.type == IMAGE_REL_BASED_LOW)

*((

*)adr) += (

)delta;

}

}

Relocation Bonus - Crafting The Attack

27 / 67

Controlling Relocations

Relocation Bonus - Crafting The Attack

28 / 67

Controlling Relocations
Relocations simply use a += operation on data at a specified address

Relocation Bonus - Crafting The Attack

28 / 67

Controlling Relocations
Relocations simply use a += operation on data at a specified address The right-hand side of this operation will be delta

Relocation Bonus - Crafting The Attack

28 / 67

Controlling Relocations
Relocations simply use a += operation on data at a specified address The right-hand side of this operation will be delta delta is defined as base - desiredBase

Relocation Bonus - Crafting The Attack

28 / 67

Controlling Relocations
Relocations simply use a += operation on data at a specified address The right-hand side of this operation will be delta delta is defined as base - desiredBase Conclusion: to abuse relocations, base must be preselected, giving a predictable delta. This means ASLR must be tricked.

Relocation Bonus - Crafting The Attack

28 / 67

ASLR Preselection

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR delta is dependant on desiredBase

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR
delta is dependant on desiredBase
Conclusion: because of how delta is derived, desiredBase must be made to force ASLR mapping at a predetermined address which isn't desiredBase itself.

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR delta is dependant on desiredBase Conclusion: because of how delta is derived, desiredBase must be made to force ASLR mapping at a predetermined address which isn't desiredBase itself. Knowing this, I tried desiredBase as:

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR delta is dependant on desiredBase Conclusion: because of how delta is derived, desiredBase must be made to force ASLR mapping at a predetermined address which isn't desiredBase itself. Knowing this, I tried desiredBase as: 0xFFFFFFFF

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR delta is dependant on desiredBase Conclusion: because of how delta is derived, desiredBase must be made to force ASLR mapping at a predetermined address which isn't desiredBase itself. Knowing this, I tried desiredBase as: 0xFFFFFFFF: PE fails to load; invalid header

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR delta is dependant on desiredBase Conclusion: because of how delta is derived, desiredBase must be made to force ASLR mapping at a predetermined address which isn't desiredBase itself. Knowing this, I tried desiredBase as: 0xFFFFFFFF: PE fails to load; invalid header 0x00000000

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR delta is dependant on desiredBase Conclusion: because of how delta is derived, desiredBase must be made to force ASLR mapping at a predetermined address which isn't desiredBase itself. Knowing this, I tried desiredBase as: 0xFFFFFFFF: PE fails to load; invalid header 0x00000000: PE fails to load; invalid header

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR delta is dependant on desiredBase Conclusion: because of how delta is derived, desiredBase must be made to force ASLR mapping at a predetermined address which isn't desiredBase itself. Knowing this, I tried desiredBase as: 0xFFFFFFFF: PE fails to load; invalid header 0x00000000: PE fails to load; invalid header 0xFFFF0000

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection
desiredBase is the only means of controlling ASLR delta is dependant on desiredBase Conclusion: because of how delta is derived, desiredBase must be made to force ASLR mapping at a predetermined address which isn't desiredBase itself. Knowing this, I tried desiredBase as: 0xFFFFFFFF: PE fails to load; invalid header 0x00000000: PE fails to load; invalid header 0xFFFF0000: PE loads at base 0x00010000

Relocation Bonus - Crafting The Attack

29 / 67

ASLR Preselection

desiredBase is the only means of controlling ASLR delta is dependant on desiredBase Conclusion: because of how delta is derived, desiredBase must be made to force ASLR mapping at a predetermined address which isn't desiredBase itself. Knowing this, I tried desiredBase as: 0xFFFFFFFF: PE fails to load; invalid header 0x00000000: PE fails to load; invalid header 0xFFFF0000: PE loads at base 0x00010000
As I later learned, Corkami had already figured all of this out: https://github.com/corkami/pocs/

Relocation Bonus - Crafting The Attack

29 / 67

PE Loader Breakdown

Relocation Bonus - Crafting The Attack

30 / 67

PE Loader Breakdown

Relocation Bonus - Crafting The Attack

30 / 67

PE Loader Breakdown

Relocation Bonus - Crafting The Attack

31 / 67

PE Loader Breakdown

Relocation Bonus - Crafting The Attack

32 / 67

Targets For Relocation Obfuscation

Relocation Bonus - Crafting The Attack

33 / 67

Targets For Relocation Obfuscation
Import Table is loaded post-reloc

Relocation Bonus - Crafting The Attack

33 / 67

Targets For Relocation Obfuscation
Import Table is loaded post-reloc Many sections are mapped pre-reloc, but not used until execution which is post-reloc

Relocation Bonus - Crafting The Attack

33 / 67

Targets For Relocation Obfuscation
Import Table is loaded post-reloc
Many sections are mapped pre-reloc, but not used until execution which is post-reloc
entryPoint isn't used until execution, post-reloc; the memory will be read-only, however, unless DEP is off

Relocation Bonus - Crafting The Attack

33 / 67

Targets For Relocation Obfuscation
Import Table is loaded post-reloc
Many sections are mapped pre-reloc, but not used until execution which is post-reloc
entryPoint isn't used until execution, post-reloc; the memory will be read-only, however, unless DEP is off
Conclusion: can mangle imports, code and resource sections, and optionally the entryPoint if DEP is off on the target machine.

Relocation Bonus - Crafting The Attack

33 / 67

Targets For Relocation Obfuscation

Relocation Bonus - Crafting The Attack

34 / 67

Targets For Relocation Obfuscation

Relocation Bonus - Crafting The Attack

34 / 67

Targets For Relocation Obfuscation

Relocation Bonus - Crafting The Attack

35 / 67

The Final Attack
Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files.

Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files. Load target PE file

Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files.
Load target PE file Apply original relocations for base of 0x00010000

Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files.
Load target PE file Apply original relocations for base of 0x00010000 Turn ASLR off by flipping a bit in the PE Header

Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files.
Load target PE file Apply original relocations for base of 0x00010000 Turn ASLR off by flipping a bit in the PE Header Set desiredBase to 0xFFFF0000

Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files.
Load target PE file Apply original relocations for base of 0x00010000 Turn ASLR off by flipping a bit in the PE Header Set desiredBase to 0xFFFF0000 Loop over data to obfuscate in uint32_t-sized chunks, decrementing each by 0x00010000 - 0xFFFF0000 (expected value of delta)

Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files.
Load target PE file Apply original relocations for base of 0x00010000 Turn ASLR off by flipping a bit in the PE Header Set desiredBase to 0xFFFF0000 Loop over data to obfuscate in uint32_t-sized chunks, decrementing each by 0x00010000 - 0xFFFF0000 (expected value of delta) Discard original relocations table

Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files.
Load target PE file Apply original relocations for base of 0x00010000 Turn ASLR off by flipping a bit in the PE Header Set desiredBase to 0xFFFF0000 Loop over data to obfuscate in uint32_t-sized chunks, decrementing each by 0x00010000 - 0xFFFF0000 (expected value of delta) Discard original relocations table Generate new relocations table containg the location of each decrement done inside of the loop (using IMAGE_REL_BASED_HIGHLOW)

Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files.
Load target PE file Apply original relocations for base of 0x00010000 Turn ASLR off by flipping a bit in the PE Header Set desiredBase to 0xFFFF0000 Loop over data to obfuscate in uint32_t-sized chunks, decrementing each by 0x00010000 - 0xFFFF0000 (expected value of delta) Discard original relocations table Generate new relocations table containg the location of each decrement done inside of the loop (using IMAGE_REL_BASED_HIGHLOW) Save new PE file to disk

Relocation Bonus - Crafting The Attack

36 / 67

The Final Attack
Due to the nature of the attack, it works best as a tool which rebuilds regular PE files.
Load target PE file Apply original relocations for base of 0x00010000 Turn ASLR off by flipping a bit in the PE Header Set desiredBase to 0xFFFF0000 Loop over data to obfuscate in uint32_t-sized chunks, decrementing each by 0x00010000 - 0xFFFF0000 (expected value of delta) Discard original relocations table Generate new relocations table containg the location of each decrement done inside of the loop (using IMAGE_REL_BASED_HIGHLOW) Save new PE file to disk ??? profit

Relocation Bonus - Crafting The Attack

36 / 67

37 / 67

Testing The Attack
Relocation Bonus - Rejected by Windows 10

38 / 67

Testing The Attack
Windows 7
Relocation Bonus - Rejected by Windows 10

38 / 67

Testing The Attack
Windows 7 ... works !
Relocation Bonus - Rejected by Windows 10

38 / 67

Testing The Attack
Windows 7 ... works ! Windows 8
Relocation Bonus - Rejected by Windows 10

38 / 67

Testing The Attack
Windows 7 ... works ! Windows 8 ... nobody uses this shit
Relocation Bonus - Rejected by Windows 10

38 / 67

Testing The Attack
Windows 7 ... works ! Windows 8 ... nobody uses this shit Windows 10
Relocation Bonus - Rejected by Windows 10

38 / 67

Testing The Attack
Windows 7 ... works ! Windows 8 ... nobody uses this shit Windows 10
Relocation Bonus - Rejected by Windows 10

38 / 67

Testing The Attack
Windows 7 ... works ! Windows 8 ... nobody uses this shit Windows 10
Relocation Bonus - Rejected by Windows 10

38 / 67

THE END
39 / 67

Exploring New Terrain

Relocation Bonus - Rejected by Windows 10

40 / 67

Exploring New Terrain
Embed PE copies for all possible base addresses

Relocation Bonus - Rejected by Windows 10

40 / 67

Exploring New Terrain
Embed PE copies for all possible base addresses ... way too big

Relocation Bonus - Rejected by Windows 10

40 / 67

Exploring New Terrain
Embed PE copies for all possible base addresses ... way too big Tweaking ASLR Configuration

Relocation Bonus - Rejected by Windows 10

40 / 67

Exploring New Terrain
Embed PE copies for all possible base addresses ... way too big Tweaking ASLR Configuration ... works!

Relocation Bonus - Rejected by Windows 10

40 / 67

Exploring New Terrain
Embed PE copies for all possible base addresses ... way too big Tweaking ASLR Configuration ... works!
Set Mandatory ASLR to On

Relocation Bonus - Rejected by Windows 10

40 / 67

Exploring New Terrain
Embed PE copies for all possible base addresses ... way too big Tweaking ASLR Configuration ... works!
Set Mandatory ASLR to On Set Bottom-Up ASLR to Off

Relocation Bonus - Rejected by Windows 10

40 / 67

Exploring New Terrain
Embed PE copies for all possible base addresses ... way too big Tweaking ASLR Configuration ... works!
Set Mandatory ASLR to On Set Bottom-Up ASLR to Off
[HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ Image File Execution Options\NAME_OF_EXE] "MitigationAuditOptions"=hex:00,00,00,00,00,00,00,00,\
00,00,00,00,00,00,00,00 "MitigationOptions"=hex:00,01,22,00,00,00,00,00,\
00,00,00,00,00,00,00,00

Relocation Bonus - Rejected by Windows 10

40 / 67

Exploring New Terrain
Embed PE copies for all possible base addresses ... way too big Tweaking ASLR Configuration ... works!
Set Mandatory ASLR to On Set Bottom-Up ASLR to Off
[HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ Image File Execution Options\NAME_OF_EXE] "MitigationAuditOptions"=hex:00,00,00,00,00,00,00,00,\
00,00,00,00,00,00,00,00 "MitigationOptions"=hex:00,01,22,00,00,00,00,00,\
00,00,00,00,00,00,00,00
Conclusion: it can work on Windows 10
Relocation Bonus - Rejected by Windows 10

40 / 67

Exploring New Terrain
Embed PE copies for all possible base addresses ... way too big Tweaking ASLR Configuration ... works!
Set Mandatory ASLR to On Set Bottom-Up ASLR to Off
[HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ Image File Execution Options\NAME_OF_EXE] "MitigationAuditOptions"=hex:00,00,00,00,00,00,00,00,\
00,00,00,00,00,00,00,00 "MitigationOptions"=hex:00,01,22,00,00,00,00,00,\
00,00,00,00,00,00,00,00
Conclusion: it can work on Windows 10, but I don't like it
Relocation Bonus - Rejected by Windows 10

40 / 67

A New Hope
Relocation Bonus - Rejected by Windows 10

41 / 67

A New Hope
Relocation Bonus - Rejected by Windows 10

41 / 67

A New Hope
Relocation Bonus - Rejected by Windows 10

42 / 67

A New Hope
Relocation Bonus - Rejected by Windows 10

43 / 67

A New Hope
Relocation Bonus - Rejected by Windows 10

44 / 67

A New Hope
Relocation Bonus - Rejected by Windows 10

45 / 67

Preselection via File Mapping Invalidation

Relocation Bonus - Rejected by Windows 10

46 / 67

Preselection via File Mapping Invalidation

Relocation Bonus - Rejected by Windows 10

46 / 67

Preselection via File Mapping Invalidation

Relocation Bonus - Rejected by Windows 10

47 / 67

Preselection via File Mapping Invalidation

Relocation Bonus - Rejected by Windows 10

48 / 67

Preselection via File Mapping Invalidation

Relocation Bonus - Rejected by Windows 10

49 / 67

Preselection via File Mapping Invalidation

Relocation Bonus - Rejected by Windows 10

50 / 67

Preselection via File Mapping Invalidation

Relocation Bonus - Rejected by Windows 10

51 / 67

Preselection via File Mapping Invalidation

Relocation Bonus - Rejected by Windows 10

52 / 67

Preselection via File Mapping Invalidation

Relocation Bonus - Rejected by Windows 10

53 / 67

Weaponization
Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must:
Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must: Create a new section with enough room for the code

Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must:
Create a new section with enough room for the code Embed the code inside of this new section

Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must: Create a new section with enough room for the code Embed the code inside of this new section Inform the embedded code of the true EntryPoint
Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must: Create a new section with enough room for the code Embed the code inside of this new section Inform the embedded code of the true EntryPoint Overwrite EntryPoint to point to the embedded code
Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must: Create a new section with enough room for the code Embed the code inside of this new section Inform the embedded code of the true EntryPoint Overwrite EntryPoint to point to the embedded code
Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must: Create a new section with enough room for the code Embed the code inside of this new section Inform the embedded code of the true EntryPoint Overwrite EntryPoint to point to the embedded code
For this to work, the ASLR preselection code must be:
Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must: Create a new section with enough room for the code Embed the code inside of this new section Inform the embedded code of the true EntryPoint Overwrite EntryPoint to point to the embedded code
For this to work, the ASLR preselection code must be: Position-agnostic
Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must: Create a new section with enough room for the code Embed the code inside of this new section Inform the embedded code of the true EntryPoint Overwrite EntryPoint to point to the embedded code
For this to work, the ASLR preselection code must be: Position-agnostic Generically embeddable in any PE
Relocation Bonus - Rejected by Windows 10

54 / 67

Weaponization
The tool must: Create a new section with enough room for the code Embed the code inside of this new section Inform the embedded code of the true EntryPoint Overwrite EntryPoint to point to the embedded code
For this to work, the ASLR preselection code must be: Position-agnostic Generically embeddable in any PE
Relocation Bonus - Rejected by Windows 10

54 / 67

55 / 67

56 / 67

Weaponization
Relocation Bonus - Rejected by Windows 10

57 / 67

Weaponization
It works!
Relocation Bonus - Rejected by Windows 10

57 / 67

Weaponization
It works!
Caveats
Relocation Bonus - Rejected by Windows 10

57 / 67

Weaponization
It works!
Caveats
It can be slow, averaging of 200 iterations to land
Relocation Bonus - Rejected by Windows 10

58 / 67

Weaponization
It works!
Caveats
It can be slow, averaging of 200 iterations to land Imports can't be obfuscated
Relocation Bonus - Rejected by Windows 10

59 / 67

Weaponization
It works!
Caveats
It can be slow, averaging of 200 iterations to land Imports can't be obfuscated

Advantages

Relocation Bonus - Rejected by Windows 10

60 / 67

Weaponization
It works!
Caveats
It can be slow, averaging of 200 iterations to land Imports can't be obfuscated

Advantages
Base can be anything, not just 0x00010000!

Relocation Bonus - Rejected by Windows 10

61 / 67

Weaponization
It works!
Caveats
It can be slow, averaging of 200 iterations to land Imports can't be obfuscated

Advantages
Base can be anything, not just 0x00010000!
As a side effect, some form of symbolic execution is needed to discover the intended base in order to fix up the file for analysis.

Relocation Bonus - Rejected by Windows 10

62 / 67

63 / 67

Use Cases
Relocation Bonus - Wrap Up

64 / 67

Use Cases
Annoying analysts
Relocation Bonus - Wrap Up

64 / 67

Use Cases
Annoying analysts Breaking automated static analysis systems
Relocation Bonus - Wrap Up

64 / 67

Use Cases
Annoying analysts Breaking automated static analysis systems Breaking tools
Relocation Bonus - Wrap Up

64 / 67

Use Cases
Annoying analysts Breaking automated static analysis systems Breaking tools Breaking AV Parsers
Relocation Bonus - Wrap Up

64 / 67

Potential Improvements

Relocation Bonus - Wrap Up

65 / 67

Potential Improvements
More obfuscations

Relocation Bonus - Wrap Up

65 / 67

Potential Improvements
More obfuscations New targets

Relocation Bonus - Wrap Up

65 / 67

Potential Improvements
More obfuscations New targets Multiple passes
Relocation Bonus - Wrap Up

65 / 67

Potential Improvements
More obfuscations New targets Multiple passes
Header Scrambling
Relocation Bonus - Wrap Up

65 / 67

Potential Improvements
More obfuscations New targets Multiple passes
Header Scrambling Combining with runtime packers
Relocation Bonus - Wrap Up

65 / 67

Potential Improvements
More obfuscations New targets Multiple passes
Header Scrambling Combining with runtime packers Support for 64bit binaries
Relocation Bonus - Wrap Up

65 / 67

Potential Improvements
More obfuscations New targets Multiple passes
Header Scrambling Combining with runtime packers Support for 64bit binaries Support for DLLs
Relocation Bonus - Wrap Up

65 / 67

Potential Improvements
More obfuscations New targets Multiple passes
Header Scrambling Combining with runtime packers Support for 64bit binaries Support for DLLs Selective obfuscations
Relocation Bonus - Wrap Up

65 / 67

THE END
66 / 67

Find Me

Source Code

https://nickcano.com

https://github.com/nickcano/RelocBonus

https://github.com/nickcano

https://github.com/nickcano/RelocBonusSlides

https://twitter.com/nickcano93

https://nostarch.com/gamehacking https://pluralsight.com/authors/nick-cano

Resources

https://msdn.microsoft.com/en-us/library/ms809762.aspx https://github.com/corkami/pocs/tree/master/PE

Relocation Bonus - Wrap Up

67 / 67

