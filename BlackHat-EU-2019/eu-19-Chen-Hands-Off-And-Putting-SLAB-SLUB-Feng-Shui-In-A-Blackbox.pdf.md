Hands Off and Putting SLAB/SLUB Feng Shui
in Blackbox
Yueqi (Lewis) Chen

Who We Are

Yueqi Chen @Lewis_Chen_ - Ph.D. Student, Pennsylvania State University - Looking for 2020 Summer internship

Xinyu Xing - Assistant Professor, Pennsylvania State University - Visiting Scholar, JD.com

Jimmy Su - Senior Director, JD Security Research Center in Silicon Valley
2

Linux Kernel is Security-critical But Buggy
"Civilization runs on Linux"[1][2]
- Android (2e9 users) - cloud servers, desktops - cars, transportation - power generation - nuclear submarines, etc.
Linux kernel is buggy
- 631 CVEs in two years (2017, 2018) - 4100+ official bug fixes in 2017

[1] SLTS project, https://lwn.net/Articles/749530/

3

[2] "Syzbot and the Tale of Thousand Kernel Bugs" - Dmitry Vyukov, Google

Harsh Reality: Cannot Patch All Bugs Immediately
Google Syzbot[3] , on Nov 24th
- 459 not fixed, 92 fix pending, 55 in moderation - # of bug reports increases 200 bugs/month

Practical solution to minimize the damage: prioritize patching of security bugs based on exploitability

[3] syzbot https://syzkaller.appspot.com/upstream

4

Workflow of Determine Exploitability

slab (kernel heap) Vul Obj
PoC: Slab-out-of-bound write

Step 1 Step 2

fptr

benign addr

Vul Obj

Vic Obj

Allocate a victim object next to the vulnerable object

fptr

malicious addr

Vul Obj

Vic Obj

Trigger the security bug to tamper "fptr"

Step 3

fptr

malicious addr

Vul Obj

Vic Obj

Dereference "fptr" to hijack control flow

Example: Exploit A Slab Out-of-bound Write in Three Steps 5

Challenges of Developing Exploits

1. Which kernel object is useful for exploitation
- similar size/same type to be allocated to the same cache as the vulnerable object
- e.g, enclose ptr whose offset is within corruption range

fptr

benign addr

Vul Obj

Vic Obj

Allocate a victim object next to the vulnerable object

6

Challenges of Developing Exploits

1. Which kernel object is useful for
exploitation
- similar size/same type to be
2. Howalltooca(tdeed)taolltohceatseamaendcache as the derveuflneerreanbcleeoubsjeecftul objects
- eS.ygs, teenmclocsaell psterquwehnocsee, oafrgfsuemteinsts within corruption range

fptr

benign addr

Vul Obj

Vic Obj

Allocate a victim object next to the vulnerable object

fptr malicious addr

Vul Obj

Vic Obj

Dereference "fptr" to hijack control flow

7

Challenges of Developing Exploits

1. Which kernel object is useful for
exploitation
- similar size/same type to be
2. Howalltooca(tdeed)taolltohceatseamaendcache as the derveuflneerreanbcleeoubsjeecftul objects
- eS.ygs, teenmclocsaell psterquwehnocsee, oafrgfsuemteinsts
3. Howitthoinmcaonrirpuupltaiotne rsalnagbeto reach desired layout
- unexpected (de)allocation along with vulnerable/victim object makes side-effect to slab layout

Vul Obj

fptr malicious addr
Vic Obj

Desired Slab Layout

fptr benign addr

Vul Obj

Target

Vic Obj

Situation 1: Target slot is unoccupied

fptr benign addr

Vul Obj Side-effect

Vic Obj

Situation 2: Target slot is occupied

8

Roadmap
Part I: Build A Kernel Object Database
- Include the kernel objects useful for exploitation and system calls and arguments that (de)allocate and dereference them (Challenge 1&2)
Part II: Adjust Slab Layout Systematically
- Deal with unoccupied/occupied situations respectively (Challenge 3)
Part III: Tricks
- Create an initial slab cache - Calculate side-effect layout - Shorten exploitation window
9

A Straightforward Solution to Challenges 1&2

Run kernel regression test
Monitor (de)allocation, dereference of objects in kernel
Correlate the object's operations to the system calls

Regression test
Syscall
Kernel
Allocation Deallocation Dereference

Correlation
Monitor

This solution can't be directly applied to kernel.
10

Problems With the Straightforward Solution
Huge codebase
- # of objects is large while not all of them are useful e.g., in a running kernel, 109, 000 objects and 846, 000 pointers[4]
- Over 300 system calls with various combinations of arguments - Complex runtime context and dependency between system calls
Asynchronous mechanism
- e.g, Read-Copy-Update (RCU) callback, dereference is registered first and triggered after a grace period
Multitask system
- Noise: other user-space processes, kernel threads, and hardware interrupts can also (de)allocate and dereference objects 11
[4] Back to the Whiteboard: a Principled Approach for the Assessment and Design of Memory Forensic Techniques, USENIX Security '19

Overview - Our Solution to Challenge 1&2
User Space

 Static Analysis to identify useful objects, sites of interest (allocation, deallocation, dereference), potential system calls
 Fuzzing Kernel to confirm system calls and complete arguments

Syscall 1 Syscall 2 ... Syscall n

Allocation Dereference

Kernel Space
Deallocation

Kernel Call Graph
12

Static Analysis - Useful Objects and Sites of Interest

Victim Object - enclose a function pointer or a
data object pointer - once written, the adversaries
can hijack control flow
Dereference Site - indirect call - asynchronous callback

struct file_operations { ... int (*llseek)(struct file*, loff_t, int); ...
}
struct file { ... const struct file_operations *f_op; ...
}
file->f_op->llseek(...);
kfree_rcu(...);

13

Static Analysis - Useful Objects and Sites of Interest

Spray Object - most content can be controlled - copy_from_user() migrates data
from user space to kernel space

SYSCALL_DEFINE5(add_key, ..., const void __user*, _payload, ...)
{ ... void* payload = kmalloc(plen, GFP_KERNEL); copy_from_user(payload, _payload, plen); ...
}

14

Static Analysis - Potential System Calls

Reachable analysis over a customized type-matching kernel call graph - delete function nodes in .init.text
section - delete call edges between
independent modules according to KConfig - add asynchronous callbacks to the graph

SyS_brk SyS_setsockopt ... SyS_write

enable_mcast

other kernel functions

ip_mc_join_group ip_mc_join_group_ssm
__ip_mc_join_group Allocation Site
Kernel Call Graph
15

Kernel Fuzzing - Eliminate Noise

Instrument checking at sites of interest to eliminate following noises:
Source 1: Objects of the same type from fuzzing executor sock2
Source 2: 1. Other processes' syscalls read, write 2. Kernel threads rcu_sched kthreadd 3. Hardware interrupt net_rx_softirq

...

fuzzing exec

compiz

sock1, sock2

read, write

Kernel

rcu_sched

kthreadd

net_rx_softirq

Hardware

16

Evaluation

Static Analysis

Kernel Fuzzing

Victim/Spray Object Victim Object

Spray Avg. time

(alloc/dealloc/deref) Object (min)

Total

124/4

75/20/29

4

2

# of identified objects/syscalls (v4.15, defnoconfig + 32 other modules)

17

Roadmap
Part I: Build A Kernel Object Database
- Include the kernel objects useful for exploitation and system calls and arguments that (de)allocate and dereference them (Challenge 1&2)
Part II: Adjust Slab Layout Systematically
- Deal with unoccupied/occupied situations respectively (Challenge 3)
Part III: Tricks
- Create an initial slab cache - Calculate side-effect layout - Shorten exploitation window
18

Working Fashion of SLAB/SLUB Allocator

A single list organizes free slots
Allocation retrieve from the freelist head
Deallocation recycle to the freelist head

freelist
Free Slot

Free Slot

freelist

Obj

Free Slot

Free Slot Free Slot

freelist
Free Slot

Free Slot

Free Slot

Both allocation and deallocation are at the freelist head

19

Situation 1 - Target Slot is Unoccupied

Initial State
1
1. Allocate the Vul Obj
2
2. Allocate the Vic Obj

freelist
Free Slot
1

Free Slot
2

freelist

Vul Obj

Free Slot
2

Target
3
Target
3

Vul Obj

freelist

Vic Obj
2

Target
3

Reason: too few allocations

20

Situation 1 - Our Solution

Initial State

freelist
Free Slot
1

Free Slot
2

Target
3

1
1. Allocate the Vul Obj
2
2. Allocate a dummy object from the database
3
3. Allocate the Vic Obj

freelist

Vul Obj

Free Slot
2

Target
3

Vul Obj

freelist

Dummy

Target
3

Vul Obj

Dummy

Vic Obj
3

21

Situation 2 - Target Slot is Occupied

Initial State

freelist
Free Slot
1

1

2

1. Allocate the Vul Obj and the S-E Obj

Vul Obj

3
2. Allocate the Vic Obj

Vul Obj

Target
2

Free Slot
3

freelist

S-E Obj

Free Slot
3

S-E Obj

Vic Obj
3

Reason: too many allocations

22

Situation 2 - Straightforward But Wrong Solution

freelist

Initial State

Free Slot

Target

Free Slot

1

2

3

1.

Problems with straightforward solution Alloca-te tNheoVgule1OnbejraanldstyhsecSa-lE2lsOabnjd arguVmuleOnbtjs for

freelist
dS-eEaOllbojcationFree

Slot

-

Vul Obj can also be freed along with the

S-E Obj 3

-1
2. Deallocate the S-E Obj

freelist

Vul Obj

Target
2

Free Slot
3

3-1 = 2
3. Allocate the Vic Obj

Vul Obj

freelist

Vic Obj
2

Free Slot
3

23

Situation 2 - Our Solution

Initial State

freelist
Free Slot
1

1. Allocate three dummy objects

Dummy 1

freelist

2. Deallocate the dummy object

in the order 2nd, 3rd, 1st

Free Slot

1

Target
2
Dummy 2
Target
3

Free Slot
3
Dummy 3
Free Slot
2

Our solution is to reorganize the freelist, switching the target slot's order from 2nd to 3rd
24

Situation 2 - Our Solution (cont.)

freelist

New Initial State

1

2

1. Allocate the Vul Obj and the S-E Obj

Free Slot

Target

1

3

freelist

Vul Obj

Target
3

3
2. Allocate the Vic Obj

Vul Obj

Vic Obj
3

Free Slot
2
S-E Obj
S-E Obj

25

Evaluation Set
27 vulnerabilities (the largest evaluation set so far) - 26 CVEs, 1 Wild - 13 UAF, 4 Double Free, 10 Slab Out-of-bound Write - 18 with public exploits, 9 with NO public exploits
26

Evaluation Results
18 cases with public exploits - 15 successful cases - 8 additional unique exploits on avg.
Diversify the ways to exploitation
9 cases with NO public exploits - 3 successful cases - 25 unique exploits in total
Potentially escalate exploitability
27

Evaluation Results (cont.)
9 failure cases - 6 cases, PoC manifests limited capability
Future work: continue exploring more capability of security bugs
- 3 cases, vulnerability is in special caches
Future work: include more modules for analysis
28

Roadmap
Part I: Build A Kernel Object Database
- Include the kernel objects useful for exploitation and system calls and arguments that (de)allocate and dereference them (Challenge 1&2)
Part II: Adjust Slab Layout Systematically
- Deal with unoccupied/occupied situations respectively (Challenge 3)
Part III: Tricks
- Create an initial slab cache - Calculate side-effect layout - Shorten exploitation window
29

Tricks
 Create an initial slab cache
 so that slots are chained sequentially  defragmentation
 Calculate side-effect layout
 ftrace logs calling to allocation/deallocation  analyze log to calculate layout before manipulation
 Shorten exploit window
 to minimize influence of other kernel activities on layout  put critical operation after defragmentation
30

Summary & Conclusion
Summary:
1. Identifies objects useful for kernel exploitation 2. Reorganizes slab and obtains the desired layout
Conclusion:
1. Empower the capability of developing working exploits 2. Potentially escalate exploitability and benefit its assessment for Linux kernel bugs
31

DEMO
32

Thank You !
Yueqi Chen Twitter: @Lewis_Chen_ Email: ychen@ist.psu.edu Personal Page: http://www.personal.psu.edu/yxc431 Looking for 2020 summer internship
33

