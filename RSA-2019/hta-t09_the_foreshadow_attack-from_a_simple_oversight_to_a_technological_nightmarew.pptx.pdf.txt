SESSION ID: HTA-T09
The Foreshadow Attack: From a Simple Oversight to a Technological Nightmare
Dr Raoul Strackx, PhD
imec-DistriNet, KU Leuven, Belgium
#RSAC

#RSAC
Foreshadow Attacks
Independently discovered Team of KU Leuven, Belgium Team of Universities of Technion, Michigan and Adelaide and DATA61 Intel discovered other variants
foreshadowattack.eu
2

#RSAC
2018 was quite interesting...
source: https://software.intel.com/security-software-guidance/software-guidance 3

#RSAC
These were vulnerabilities in the processor itself Hence, virtually every application was effected!
This led to various reactions...

How we told our upper management at the university #RSAC (Nov '17)...
Source: https://pin.it/k4j53t23xiiqcd 5

#RSAC
How we told Intel (Jan '18)...
Source: https://pin.it/k4j53t23xiiqcd 6

How IT professionals reacted (to this class of

#RSAC

vulnerabilities)...

Source: https://pin.it/hehzyfhdsvnlkc 7

#RSAC
How do these attacks work, in general?

#RSAC
Side-Channel Attacks
Source: The Italian Job (imdb.com) 9

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: rotate Carrier: sound

Charleze Theron

Vault

Security flaw: Lever may produce sound
Sources: https://home.howstuffworks.com, imdb.com 10

#RSAC
How does the Foreshadow attack work?

#RSAC
Attacks
Foreshadow-OS
Foreshadow-VMM
Foreshadow-SGX Foreshadow-SMM All exploit the same vulnerability, but the attack model varies
12

#RSAC
Foreshadow-OS: Reading L1 data through bare-metal not-present pages

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: none
Carrier: cache changes

Foreshadow-OS

Other process' memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 14

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: none
Carrier: cache changes

Foreshadow-OS

Other process' memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 15

#RSAC
Setting: Attacker-controlled process
Attack model: Attacker operates within a malicious process Benign, bare-metal kernel ensures process isolation
Attack objective: Read data outside the process' address space
16

#RSAC
Background: How does process isolation work
MMU: map virtual address space to physical memory Protect physical memory by:
- Not providing a mapping - Restricting access
(e.g., U/S-bit)
17

#RSAC
Background: How does process isolation work
MMU: map virtual address space to physical memory Protect physical memory by:
- Not providing a mapping - Restricting access
(e.g., U/S-bit)
18

#RSAC
Background: How does process isolation work
Source: Intel 64 and IA-32 architectures software developer's manual 19

#RSAC
Background: How does process isolation work
Source: Intel 64 and IA-32 architectures software developer's manual 20

#RSAC
Background: How does process isolation work
"When P-bit is 0, the entry's physical address field may be reused to keep track of the swapped out page"
21

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: none
Carrier: cache changes

Foreshadow-OS

Other process' memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 22

#RSAC
The message carrier: How does the cache work?
Problem: Memory performance grows much slower than CPU performance Solution: Fast but small caches
- Intel 486: L1 cache ('89) - Pentium Pro: L1 & L2 cache ('95) - Today: L1, L2 & L3 caches
23

#RSAC
The message carrier: How does the cache work?
Problem: Memory performance grows much slower than CPU performance Solution: Fast but small caches
- Intel 486: L1 cache ('89) - Pentium Pro: L1 & L2 cache ('95) - Today: L1, L2 & L3 caches
24

#RSAC
The message carrier: How does the cache work?
Cache lines: 64B L1: virtually-indexed, physically tagged 64 sets, 8 ways
25

#RSAC
The message carrier: How does the cache work?
Manipulating the cache: Data accesses: load in all cache levels clflush: Flush data from all cache levels
Any timing results <146 cycles clearly hits the cache 26

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: none
Carrier: cache changes

Foreshadow-OS

Other process' memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 27

#RSAC
Background: Pipelining & Out of Order Execution
Split instruction in ops Use multiple execution ports Execute ops as soon as possible Reorder buffer ensures results/exceptions are visible in-order of instruction stream
28

#RSAC
The Security Flaw: Transient Execution
Transient execution: Faults are detected at last moment Instruction that should never be executed, may already have started
Key Issue: Not all side-effects of transient instructions are rolled back correctly! (e.g., cache changes)
29

#RSAC
The Security Flaw: Transient Execution
Transient execution: Faults are detected at last moment Instruction that should never be executed, may already have started
Key Issue: Not all side-effects of transient instructions are rolled back correctly! (e.g., cache changes)
30

#RSAC
The Security Flaw: Transient Execution
Transient execution: Faults are detected at last moment Instruction that should never be executed, may already have started
Key Issue: Not all side-effects of transient instructions are rolled back correctly! (e.g., cache changes)
31

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: none
Carrier: cache changes

Foreshadow-OS

Other process' memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 32

#RSAC
Foreshadow-OS: The exploit
33

#RSAC
Foreshadow-OS: The exploit
34

#RSAC
Who's Affected?
Intel Core processors of the last 7 years Intel server processors NOT AMD, not ARM
35

#RSAC
Impact of This Attack
Requirements: Secret data in L1D Page must be not-present  Must difficult attack, "easiest" to understand  Low impact!
36

Mitigations
Long term: Replace chips! Short term:
- Software approaches:  Ensure PTE entry do not point to existing physical address  Flush complete L1D cache
37

#RSAC
Source: xkcd.com

#RSAC
Mitigations
Long term: Replace chips! Short term:
- Software approaches:  Ensure PTE entry do not point to existing physical address  Flush complete L1D cache
38

#RSAC
Foreshadow-VMM: Reading physical L1 data through virtualized not-present pages...

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: manipulate PT
Carrier: cache changes

Foreshadow-VMM

Other VM's memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 40

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: manipulate PT
Carrier: cache changes

Foreshadow-VMM

Other VM's memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 41

#RSAC
Setting: Attacker-controlled VM
Multiple VMs on one physical server Attacker-controlled VM Hypervisor ensures VM isolation  Goal: read other VM's memory
42

#RSAC
How do extended page tables work
Adds another layer: - PT: guest-virtual addr.  guest-phys. addr. - EPT: guest-phys. addr.  host-phys. addr.
43

#RSAC
How do extended page tables work
Adds another layer: - PT: guest-virtual addr.  guest-phys. addr. - EPT: guest-phys. addr.  host-phys. addr.
44

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: manipulate PT
Carrier: cache changes

Foreshadow-VMM

Other VM's memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 45

The Security Flaw: Interpreting guest-physical as host- #RSAC physical addresses
VM-level: non-present PTE entry VMM-level: irrelevant Upon access:
- Tag data access as a violation - Pass guest-physical as host-physical
address to L1D cache - Continue transient execution!!  This breaks the VM's address space abstraction!
46

#RSAC
Foreshadow-VMM: The exploit
47

#RSAC
Impact of Foreshadow-VMM
Requirements: - Attacker must have full VM under her control - Secret data must reside in L1D
 Modest impact!
48

#RSAC
Impact of Foreshadow-VMM
Requirements: - Attacker must have full VM under her control - Secret data must reside in L1D  This may not be that complicated!!
 Modest impact!
49

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: manipulate PT
Carrier: cache changes

Foreshadow-VMM

Other VM's memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 50

#RSAC
Intel HyperThreading as an Enabler
Problem: Execution ports are still under-utilized Solution: Split physical core in two, duplicate
- register file - re-order buffer Shared: - Execution ports - L1 cache! (and other levels)
Up to 30% performance increase
source: https://www.cs.sfu.ca/~fedorova/Teaching/CMPT886/Spring2007/papers/hyper-threading.pdf
51

#RSAC
Intel HyperThreading as an Enabler
Problem: Execution ports are still under-utilized Solution: Split physical core in two, duplicate:
- register file - re-order buffer Shared: - Execution ports - L1 cache! (and other levels)
Up to 30% performance increase
source: https://www.cs.sfu.ca/~fedorova/Teaching/CMPT886/Spring2007/papers/hyper-threading.pdf
52

#RSAC
Impact of Foreshadow-VMM
Requirements: - Attacker must have full VM under her control - Secret data must reside in L1D  Just have a little bit of patience!
 High impact!
53

Mitigations
Long term: Replace chips! Short term:
- Make sure no secrets are in L1D cache -  Flush L1D before upon VM-entry -  Make sure no two different VMs execute on same
physical core  Disable HyperThreading  Patch VM scheduler
54

#RSAC
Source: xkcd.com

#RSAC
Mitigations ­ Disabling HyperThreading
source: https://www.intel.com/content/www/us/en/architecture-and-technology/l1tf.html 55

#RSAC
Mitigations ­ Update VM scheduler
source: https://www.intel.com/content/www/us/en/architecture-and-technology/l1tf.html 56

#RSAC
Foreshadow-SGX: Dismantling Intel SGX's security objectives

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: manipulate PT
Carrier: cache changes

Foreshadow-SGX

SGX enclave memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 58

#RSAC
Background: Intel SGX
Problem: Huge software TCB Solution: Protected-Module Architecture (e.g., Intel SGX) Only trust Intel hardware/enclaves Use cases:
- protecting finger prints, - DRM, - password vault, - ...
59

#RSAC
Background: Intel SGX
3 key properties: Isolation Secure Storage Attestation
60

#RSAC
Background: Intel SGX
Isolation Enclaves live in process' address space Only accessible through specific entry points Abort page semantics: Reading enclave memory outside the enclave results in -1.
61

#RSAC
Background: Intel SGX
Secure Storage: Enclaves die at power off Seal/Unseal confidential data Key derivation ensures unique key per enclave  Derived keys stored in enclave memory!
62

#RSAC
Background: Intel SGX
Attestation: Prove an enclave has been created correctly Both locally as remotely Local attestation as a building block for remote attestation
63

#RSAC
Background: Intel SGX
Attestation: Prove an enclave has been created correctly Both locally as remotely Local attestation as a building block for remote attestation
64

Side-Channel Attacks
Attacker

#RSAC
Victim

Action: manipulate PT
Carrier: cache changes

Foreshadow-SGX

SGX enclave memory

Source: xkcd.com

Security flaw: OoO execution leaves traces of transient instructions 65

#RSAC
The Attack Approach
Bypass abort page semantics Ensure data in L1D:
- Single-step through enclave - eldu instruction as a side effect loads
enclave page in L1D!
66

#RSAC
Impact of Foreshadow-SGX
Requirements: - Mark enclave page not-present - Call enclave/issue "special" SGX instruction  Completely breaks enclave isolation, sealed storage and remote/local attestation
67

#RSAC
Conclusion
· We were lucky Foreshadow was responsibly disclosed · Foreshadow breaks the virtual memory abstraction · Modern x86 processors have become too complex to completely understand · Need to completely rethink past design decisions
68

Questions?
Raoul Strackx raoul.strackx@cs.kuleuven.be @raoul_strackx

