StarCraft: Remastered
Emulating a buffer overflow for fun and profit

A note before we begin
Blizzard Entertainment in no way endorses or condones reverse engineering of our properties.
The exercises herein were conducted to understand the methods used to create unlicensed behaviors.

About Me: Elias Bachaalany
· Anti-Cheat Engineer, Blizzard Entertainment
· Previously worked at Hex-Rays and Microsoft
· Technical writer: · Practical Reverse Engineering, Antivirus Hackers Handbook · Batchography
· Passionate about reverse engineering and low-level programming on MS-Windows
· Interested in debuggers, emulators, API hooking, dynamic binary instrumentation and virtualization technologies
· Contact · Email: ebachaalany at blizzard.com · Twitter: @0xeb

Comrades on the adventure
My colleagues · Guillaume Breuil, Yi Deng, Chris Genova, Mark
Chandler, James Touton, Pete Stilwell, Zak Bennett and Grant Davies Tools · SCMDraft2 map editor - Henrik Arlinghaus · trgk (Trigger King) - https://github.com/phu54321/ · MPQ tools ­ Ladislav Zezula · BWAPI - Adam Heinermann · IDA Pro - Hex-Rays · Diaphora ­ Joxean Koret · EUDEnabler and the EUDDB - Farty1Billion http://farty1billion.dyndns.org/EUDDB/
South Korean map makers and tools community · Kongze1004 ­ Random Tower Defense map author · Sksljh2091 ­ Mario Exodus map author · Jacksell12, Deation, Sato
Community Sites · TeamLiquid, StarEdit Network, Naver.com

Sorry if I missed anyone!

Backstory /1
· StarCraft is a science fiction RTS (real-time strategy)
· Released for PC and Mac on March 31, 1998
· StarCraft: Brood War - Expansion pack released on November 30, 1998
· Significant patches to this talk: · 1.16.1 - 01/21/2009 ­ Last patch for 8 years · 1.18.0 - 04/18/2017 ­ First modern patch · 1.20.0 ­ 08/14/2017 ­ StarCraft: Remastered · 1.21.0 ­ 12/07/2017 ­ EUD reintroduced via emulation

Backstory /2
· StarCraft had various buffer overflow bugs, but one was related to a particular trigger condition and action: · The Extended Unit Death trigger Ø Or simply: EUD
· Blizzard did not update StarCraft between 2009 and early 2017 · The community re-enabled the bug with custom launchers and tools
· Patch 1.17 was slated for release but was held back because it would break mods, tools, and launchers: · wMode · wLauncher, ChaosLauncher · BWAPI ­ Plugin to write AI bots that play StarCraft

Backstory /3
· StarCraft maps based on EUD triggers thrived among the South Korean map makers community
· The EUD triggers: · Are encoded in the map file · Allowed arbitrary memory read and write: · The majority of the public EUD maps in circulation have hardcoded addresses compatible with StarCraft 1.16.1 on Windows Ø I am not aware of any EUD maps for the MacOS version of the game
· The EUD exploit allowed modders to author maps that modify the game radically: · Random Tower Defense · Mario Exodus Map · Etc.

Random Tower Defense ­ EUD map

Bouncing Ball EUD map (SC 1.16.1)

Bouncing Ball EUD map (SC:R w/ emulation)

· The Mario Exodus map author created a level editor!
· The map was developed using trgk's epScript language and compiler

StarCraft map file format
· They are just MPQ archives · The MPQ format has been extensively reverse engineered and documented by the community
· They contain various files: · They contain custom WAV audio used by the map · staredit/scenario.chk ß The actual map chunk file · This file contains the triggers chunk · It contains strings table chunk · It contains a chunk describing buildings and units · Etc.

Map file in MPQ Editor
· Ladik's MPQ editor can be used to view or modify the contents of an MPQ map file
http://zezula.net/en/mpq/download.html
Note the chunk file: "staredit/scenario.chk"

Scenario chunk file /1
· Made of one or more chunks:

· Chunk header is followed by the chunk body · The game parses each chunk based on its ID:

Scenario chunk file /2
· Some chunks might have their own sub-headers
· The strings chunk is such an example:

Scenario chunk file /3
· The strings chunk can be used to hide data not used by the game directly
· When CK_HDR.ckSize > ( sizeof(the complete TStrTbl header) + strlen(of all strings in the table) )
· The modders hide additional triggers in the cave area of the string chunk

Scenario chunk file /4
· This screenshot shows the last string in the strings table · That's not the chunk's end though, it is just the string table's end · The remaining bytes are additional triggers inserted by the EUD trigger compiler
· https://github.com/phu54321/

What are triggers? /1
· They are a set of conditions and actions that get evaluated during the game loop
· There are trigger conditions that tell you when: · A certain time period has elapsed (timers) · Player resources reached a certain amount · A map location has been reached · Etc.
· When all the trigger conditions are fulfilled, then you can do actions such as: · Play WAV file · Display a message · Create, kill, move a unit, etc. · Change unit owner and health points · Give player resources · Etc.

What are triggers? /2
· Triggers are stored inside the map chunk file
· The triggers chunk is simply an array of _trigger structs
· Each trigger has an array of the CONDITION and ACTION structures
· The dwPlayer and wType fields are user controlled Ø They are used to read/write out-of-bounds inside an array
· The bOpCode field dictates the trigger condition and action type

What are triggers? /3
· The bOpCode field is used to select which condition or action to execute:

What are triggers? /4
· Each trigger condition is evaluated, then the actions are performed if all conditions succeed:

What are triggers? /5

What are triggers? /6
· Classic (visual) trigger editor (SCMDraft 2.0 ­ by Henrik Arlinghaus)
· Note the large values: · UnitID · Death table index · Etc.

What are triggers? /7
· Text trigger editor
· A private build of SCMDraft shows the EUD overflow addresses

The buffer overflow /1
· The buffer overflow bug in question is found in the "Extended Unit Death" trigger code: · The death_count() trigger condition · à Read anywhere primitive
· The set/add/sub_death_count() trigger action · à Write anywhere primitive
· Triggers are read as-is from the chunk file and stored in a doubly-linked list:

The buffer overflow /2
· A death condition with out-of-bounds unit type (wType) or player number (dwPlayer) causes the read anywhere primitive

The buffer overflow /3
· A set death action causes a write anywhere and provide the following primitives: · [mem] += lQuantity · [mem] -= lQuantity · [mem] = lQuantity

The buffer overflow /4
· An example of EUD triggers found inside an EUD map:

EUD map emulation ­ Problem statement
· Given a StarCraft map that contains malformed input that triggers a read/write anywhere: · Is there is a way to emulate the buffer overflow in a newer game version where: · The buffer overflow bug is fixed · Some addresses no longer exist in the new game version · Some addresses refer to new/different data structure format
?
· Can the emulator work on different architectures and operating systems?

Three steps solution
1. Identify · Identify / trace all the addresses used by an EUD map · Build a table of the addresses and identify what they represent in the game source code
2. Intercept · Intercept all out-of-bounds access · Redirect access using a translation table · Old address à New address
3. Emulate 1. Missing memory addresses should be handled by code 2. Dangerous memory changes should be filtered / changed accordingly (pointers, function callbacks, etc.)

Implementation challenges
1. Identify · Unfortunately, we did not have private or public symbols for StarCraft 1.16.1. I had to start reversing the game executable from scratch · How can I tell what addresses the maps are accessing? · What is the goal/intent behind a memory access?
2. Intercept 1. No problems here. Luckily, we can funnel all the out-of-bounds read/writes to the emulation layer
3. Emulate 1. Handle basic memory access emulation 2. Emulate addresses that are no longer present 3. Emulate incompatible structure types

Identify ­ Reversing the game /1
1. Reverse engineering efforts were impeded by the lack of debugging symbols: · Reverse engineered the game client from scratch · Used the closest source code snapshot for 1.16.1 · Found the right compiler (VS 2003) and the approximate optimization switches Ø Now I have debugging symbols for a binary that is very close to the public build
2. I used binary diffing plugins for IDA Pro 1. PatchDiff2 - Tenable Network Security, Inc 2. Diaphora - http://diaphora.re/

Identify ­ Reversing the game /2
· Binary diffing was limited: · Mismatched functions between the diffed binaries · Global variables were not identified · Optimized code and inlined functions made diffing harder
· Resorted to manual reverse engineering to bridge the limitations from BinDiffing
· Used scripting to automate the reversing task · Lots of IDAPython scripting was involved

Source code vs Disassembly view

Source code vs Hex-Rays pseudo-code

Automating data structure recovery

Identify ­ Statically identify all addresses /1
· StarCraft Remastered collects game telemetry (including map information, etc.)
· As of October 2017, we had around ~603,773 total unique maps played · Of which 17,916 were EUD maps (i.e. contained out of bounds indices)
· After I managed to reverse engineer enough of the game, I wrote a tool to process all the maps, identify EUD maps and dump the out-of-bounds EUD addresses

Identify ­ Statically identify all addresses /2

Identify ­ Statically identify all addresses /3
· After aggregating the unique EUD addresses across all of the 17k EUD maps, I ended up with around ~800 variables used by popular EUD maps
· I wrote an IDAPython script to emit a table for all the unique addresses, their names and sizes

Identify ­ Statically identify all addresses /4
· Static address discovery was not enough: · Some EUD maps were dereferencing pointers and reaching into the heap · Some structures are complicated and linked to other structures (linked lists, TCtrl*, TDialog*, etc.)
· Need more tools: · I realized the need for a dynamic EUD address tracer · I also needed a way to single step / debug triggers
· I developed an EUDTracer, a DLL that hooks the game and instruments all the relevant trigger handling code

Identify ­ Dynamic tracer /1
· The instrumented game binary calls into the tracer DLL upon each read/write

Identify ­ Dynamic tracer /2
· The Python table containing EUD addresses is passed to a source code generator to emit C code and tables
· The tracer uses that table to account for memory access

Identify ­ Dynamic tracer /3
· When the game loads an EUD map, the tracer DLL intercepts all out-of-bounds access
· Any unknown address triggers a breakpoint for further analysis and identification
· After I identify an unknown address, I add it to the Python table which is used to update the tracer's EUD items table

Identify ­ Dynamic tracer /4
· The tracer's main role is to guarantee that all the addresses referred to from the EUD map are accounted for

Identify ­ More debugging tools
· Having a way to record all accessed EUD addresses was not enough to understand the intent behind the access
· I had no real way to debug an EUD map: · I needed a way to nicely represent an EUD address · I needed to single step after each trigger · I needed a way to convert a series of read/write primitives to pseudo-code

Identify ­ EUD address to symbolic name /1
· If I wanted to trace triggers, I needed to have a way to convert an address to a nice variable representation
· So what is the symbolic representation of: · 0x5187E8 + (0xC * 3) + 4? Ø gCards[3].pBtns

Identify ­ EUD address to symbolic name /2
· With the help of the Hex-Rays decompiler and other metadata, I wrote the function "R" to resolve an address into a nice symbolic name
Ø If the array's indices are based on enums, then "R" will properly show the enum name instead of a numeric index

Identify ­ Static pseudocode generator /1
· SCMDraft trigger editor textually represents the trigger script:

Identify ­ Static pseudocode generator /2
· I wrote a converter from the triggers text to C pseudo-code
(convert triggers to an AST and then emit as C pseudo-code)

Identify ­ Static pseudocode generator /3
· Trigger text converted to C pseudo-code (trig2cpp()):

Identify ­ Dynamic pseudocode generator /1
· With IDA's conditional breakpoints and the Appcall feature, I wrote a dynamic pseudocode generator: · It helps debug the map trigger logic during runtime · It helps in the discovery and understanding of dynamic triggers (generated by the EUD compiler from trgk)
· Conditional breakpoints are set at strategic entrypoints (pre, in and post trigger execution)

Identify ­ Dynamic pseudocode generator /2
· Conditional breakpoints dynamically build the AST on access

Demo ­ Dynamic pseudocode generator /1
· The debug script has a `Single step' switch to break after each trigger · Pseudocode is emitted on the fly

Demo ­ Dynamic pseudocode generator /2
· The "Single step" switch can be configured to print the pseudocode on the fly as the map triggers executes without suspending the game

Intercept /1
In the first step (identify): 1. We built all the required static and dynamic tracers
2. We created the EUD table with all known addresses and their symbolic names
3. We have enough tools to identify any address and trace where it came from
Now we need to intercept the out-of-bounds access in the new code base

Intercept /2
Read primitives interception

Write primitives interception

Intercept /3
· From the emulator's perspective, all EUD map logic boils down to two actions:

1. Read anywhere 2. Write anywhere

à value = read_vmem(eud_addr) à write_vmem(eud_addr, value)

Emulate
In basic scenarios, the emulation is very simple: 1. Compute the full virtual address (EUD
address) from the dwPlayer and wType indices
2. From the EUD address, find the equivalent new address (backing data) in the current game version
3. Compute the offset and read or write from/to the new address

Emulate ­ Variables mapping /1
· Let's extend the previous Python table and attach the source file name were each variable is located
· The table defines: virtual address, item size, source file name, emulation flags, and backing variable name

Emulate ­ Variables mapping /2
Running the EUD table generation script patches the source code and exports all referenced variables:

Emulate ­ Variables mapping /3
Exported variables example:

Emulate ­ Variables mapping /4
No need to make static variables global: · The generator has an option that lets you pick a name for the exported variable

Emulate ­ The EUD table /1
· The "eud_table.cpp" is autogenerated from the Python table. It refers to all the exported variables from various source code files
· It is used to populate the emulator's virtual memory layout
· Items also have associated flags that instruct the emulator which EUD adapter handles which address
· Note: the "g_nothing" variables are alignment bytes in SC 1.16.1. The map makers use that space for storing variables
· A "nullptr" backing data almost always indicates that the variable is to be handled purely by an adapter code

Emulate ­ The EUD table /2
· The "eud_extern.h" is autogenerated from the Python table
· It exposes all the known EUD variables · Very handy for accessing static variables from anywhere in the code when needed

Emulator architecture /1

StarCraft Remastered
Real game memory Virtual SC 1.16.1 memory EUD Emulator
Shadow table
Virtual Memory EUD address
Û
Handlers mapping table

EUD Table {addr1, size1, backing_data1, handler_flags1} {addr2, size2, backing_data2, handler_flags2} {addr3, size3, backing_data3, handler_flags3} ...
EUD Adapters

Data structure #1 adapter

Data structure #n adapter ...

Due to the nature of the overflow, the following restrictions apply: · An EUD address is always 4 bytes aligned · An EUD value is a 32bits integer

Emulator architecture /2
Shadow table · It contains the needed memory contents
from the SC 1.16.1 binary
Virtual memory · It uses the address-to-handlers lookup table · It maps an EUD address range to an EUD
table entry à EUD handler/adapter
· The table entry for an EUD item describes: · The backing data (the new variable address, if present) · The flags which tell the emulator which EUD adapter (handler) to use for emulation

Emulator architecture /3
A specialized EUD adapter is needed when: · Handling non-standard data types · When dealing with EUD addresses that no longer map
to anything in the new game client

The following 5 virtual methods are exposed

· read_vmem()

à Return a 32bits value

· write_vmem()

à Write a 32bits value

· backup()

à Item specific backup code

· restore()

à Item specific restore code

· deferred_write() à Invoked after all the triggers

have executed. Gives a chance

to batch process writes

EUD adapters ­ Basic /1
The basic EUD adapter (eud_vmemitem_t class) handles basic data types: 1. The emulator computes the full EUD address 2. Finds the new variable's base address and converts the EUD address to an offset 3. The appropriate adapter is then called with the desired offset to read/write from/to
This simple translation approach works nicely for basic types

EUD adapters ­ Basic /2
The basic (pass-thru) adapter is good for most cases: · Byte, Word, Dword · The emulator can cross boundaries between two items · Basic types arrays are also supported

UWORD a[2]

UWORD b[4]

Reading a value from the end involves reading from two different adapters (handlers)

Wait a minute, we need one more primitive!
· We covered two primitives:
1. *mem asg_op = const · asg_op à += , = , -=
2. if (*mem cmp_op const) { actions ... } · cmp_op à ==, >=, <=
· How do we get the following primitive? · *mem1 asg_op *mem2
Using binary search!

The *a = *b primitive
· Trigger condition: 1. Probes the value of src_var
· Trigger action: 1. Increments the value of dst_var 2. Decrement the value of src_var 3. src_var's value eventually reaches zero 4. Backup changes into var_copy
The same primitive is repeated to copy var_copy back to dst_var
This primitive is expensive and generates lots of triggers

EUD adapters ­ Pointers /1
· Pointers are 32bits in SC 1.16.1
· Obviously, we cannot just use the passthru basic emulation · Pointers have to be translated from EUD virtual addresses to real addresses
· The primitive "*ptr1 = *ptr2" invoked from the EUD triggers will spoil the pointer value until the binary search is over · What to do with incomplete pointer values?

EUD adapters ­ Pointers /2
· Changes to a physical pointer value should not take effect unless the virtual pointer value passes a "pointer validity check function" à Does the virtual pointer have a proper real pointer equivalent?
· Rely on the shadow pointer value when working with incomplete virtual pointer values for future reads / writes:

Real memory

EUD virtual memory

void *game_ptr; uint32_t game_ptr;

uint32_t game_ptr_shadow; bool game_ptr_dirty;

EUD adapters ­ Pointers /3
· The eud_cobject_ptr_adapter_t is constructed with backing data pointing to a reference to a real pointer that we want to expose to the EUD emulator

EUD adapters ­ Function pointers /1
· What about EUD logic that does function pointer arithmetic?

EUD adapters ­ Function pointers /2
· Pointer arithmetic make sense only in the EUD virtual memory addressing space
· For the real pointer addressing we have to translate to proper pointers and account for function prototype compatibility
· Basic implementation idea: 1. vaddr += voffs 2. paddr = find_real_fptr(vaddr, function_prototype_id) 3. if (paddr != nullptr) à struct.pFn = paddr;
· In the emulator, such cases are handled with the eud_struct_with_ptr_adapter_t
Virtual function pointers and their prototypes table

EUD adapters ­ Incompatible structures /1
· Various data structures have changed between SC 1.16.1 and SC:R
· Pass-thru adapters are not helpful in this case
· A specialized adapter is needed to convert between both structures: · Read operation: translates from physical structure to virtual structure · Write operation: translates from virtual structure to physical structure

EUD adapters ­ Incompatible structures /2

EUD adapters ­ Linked lists
· In SC 1.16.1 · Triggers were stored in a Storm linked list data structure · Storm is a library that provides containers and platform independent functionality
· In SC:R · Triggers are stored as blz::list<_trigger> · `blz' is the equivalent of STL's std namespace
· Other structures in the old game also use Storm lists while the new game uses different containers

EUD adapters ­ Triggers /1
Because triggers are hard to program, the South Korean hacker (nicknamed Trigger King / trgk) wrote a trigger compiler:
1. You write proper logic in a JavaScript/Python like language called epScript
2. The epScript gets compiled into a bunch of triggers and is then injected into the appropriate map chunks
3. Map containing triggers compiled with epScript can be identified using the bootstrap code that links regular triggers into the dynamic triggers (inside the strings table)

EUD adapters ­ Triggers /2
· epScript is a very powerful language: · The Mario Exodus EUD map was written in that language
· Its compiler hides additional triggers in the cave area of the strings chunk: Ø Making it hard to reverse-engineer compiled triggers Ø One needs to write a triggers decompiler to recover the logic
· Compiled triggers are self-modifying and very optimized: Ø Loops, function calls and other control flow related functionality are implement using self-modifying triggers that change the trigger node links (next and prev links)

EUD adapters ­ Triggers /3
· EUD maps locate the pointer to the string table (gpMapStr) and adds a constant offset pointing to the additional dynamic triggers inside the string table (see slide 17)
· EUD maps then patch the m_prevlink and m_next links as needed to introduce as many triggers as needed · Inserting new triggers dynamically was never supported in StarCraft. Only the EUD emulator allows such activity.
· Compiled/dynamic triggers are the basis of complex and elaborate EUD maps · Therefore, supporting dynamic triggers was the first thing added to the EUD emulator

EUD adapters ­ Triggers /4
· From the emulator's perspective, there are two kinds of triggers: · Initial triggers originating from the triggers chunk · Dynamic triggers linked to the triggers list by patching their node links
· When StarCraft needs to execute triggers after each game loop: · The emulator knows how to serve both static triggers and dynamic EUD triggers · The emulator does not replicate the backing data (the trigger node data) whenever possible

SC:R à blz::list<_trigger> : SC1.16: stormlist<_trigger> :
String table: (Dynamic triggers inserted at the end of the strings table)

_trigger0
_trigger0
shadow: prev|next

_trigger1
_trigger1
shadow: prev|next

... _triggerN
... _triggerN
shadow: prev|next

Strings chunk data Actual string table (TStrTbl)

Extra chunk data: dynamic triggers

EUD adapters ­ Triggers /5
The Storm node EUD adapter hosts the node links as shadow variables

EUD adapters ­ Triggers /6
· The Storm list adapter implements an STL compatible iterator
· From the iterator's perspective, any node pointers outside the list has their node links and data in the virtual memory

EUD adapters ­ Partial buffers
· Partial buffers adapters are used whenever the virtual item size is greater than the physical item size:

SC 1.16.1 item (virtual):

data

SC:R item (physical):

smaller data

unmapped

· The adapter serves the mapped data when the access offset is within the mapped range · It will serve zeros w/o failing when the unmapped area is accessed

EUD adapters ­ Deferred writes /1
1. Certain adapters resort to using deferred writes as means to speed-up the emulation
2. The EUD map writes in chunks of 4 bytes at a time Ø We don't want to re-construct real game data while the EUD map is still writing the changes
3. Instead, a write handler simply passes-thru the writes to a temporary buffer and marks the adapter as dirty · (Reads from dirty offsets are served from the temporary buffer for consistency)
4. After all triggers are executed in that game loop, the emulator invokes all the dirty adapters' deferred write callbacks
5. Inside the deferred write callback, the temporary buffer is then used to reconstruct the real structures used by the game. The adapter dirty flag is then cleared.

EUD adapters ­ Deferred writes /2
Deferred write example adapter:
1. The status text adapter lets the EUD maps write to a temporary buffer
2. Afterwards, the adapter reconstructs the proper status text structures that are compatible with the new game (SC:R) code

EUD adapters ­ Bounded array elements /1
· Various game data variables are integer arrays
· Sometimes, the elements in the array must have bounded values · Naturally, the pass-thru (basic) adapter is not suitable (because no validation takes place)
· The bounded array adapter also leverage a shadow array table for all the elements that have incomplete / invalid values
· Only after the written values are valid (within the specified bounds) then changes are reflected into the backing data

EUD adapters ­ Bounded array elements /2
· The Unit Flingy array's values have an upper bound of 209

EUD adapters ­ Full adapters list /1
Throughout the creation of the EUD emulator, various adapters were devised whenever a new problem is encountered:
· eud_adapter_cards · Supports total customization of units command cards
· eud_adapter_csprites and eud_adapter_cunit · Allows controlled modifications into the CSprite and CUnit structures
· eud_adapter_group · Allows bitmap shuffling inside certain game animation frames
· eud_adapter_keytable · Allows EUD maps to intercept key presses (`a', `s', `w', `d', key up and key down for example)

EUD adapters ­ Full adapters list /2
· eud_adapter_mpq · Allows support for protected maps. · Refer to MPQ frozen maps: https://github.com/phu54321/euddraft/tree/ master/freeze
· eud_adapter_msgtbl · Read access into the in-game chat messages ("Chatting War" EUD maps)
· eud_adapter_partial_buffer · Various non-emulated or no longer existent variables are handled with this adapter
· eud_adapter_playerdata · Lets EUD maps read player information (name, race, color, etc.)

EUD adapters ­ Full adapters list /3
· eud_adapter_pointers · All pointer related adaption code · Supports partial pointers (backed by shadow values)
· eud_adapter_stattxt · Unit status text and hotkeys manipulation
· eud_adapter_stormlist · Allows high-level emulation of Storm lists
· eud_adapter_structwithptr · Used to emulate structures that contain a mix of basic types (pass-thru) and pointers (incomplete pointers + virtual <-> physical conversion)
· eud_adapter_triggers · Supports dynamic triggers emulation

Questions?

