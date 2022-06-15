"" 



  SSLabIISP

""(What is Double-Fetch?)

 (Address Space Separation)

0x00000000

3 GB

/ (User / Program Address Space)

 (Kernel Address Space)
32 A Typical Address Space Separation Scheme with a 32-bit Virtual Address Space

1 GB

0xC0000000 0xFFFFFFFF

 (How To Do A Single Fetch?)

0x00000000

3 GB

/ (User / Program Address Space)

0xDEADBEEF

 (Kernel Address Space)

void kfunc (int __user *uptr, int *kptr) {
...... }

Uninitialized

32 A Typical Address Space Separation Scheme with a 32-bit Virtual Address Space

1 GB

0xC0000000 0xFFFFFFFF

 (How To Do A Single Fetch?)

0x00000000

3 GB

/ (User / Program Address Space)

0xDEADBEEF

 (Kernel Address Space)

void kfunc (int __user *uptr, int *kptr) {
...... }

Uninitialized

32 A Typical Address Space Separation Scheme with a 32-bit Virtual Address Space

1 GB

0xC0000000 0xFFFFFFFF

XXXXXX (No Dereference on Userspace Pointers)

0x00000000

3 GB

/ (User / Program Address Space)

0xDEADBEEF

 (Kernel Address Space)

void kfunc (int __user *uptr, int *kptr) { *kptr = *uptr; ......
}

0UxnDinEiAtiDalBizEeEdF

32 A Typical Address Space Separation Scheme with a 32-bit Virtual Address Space

1 GB

0xC0000000 0xFFFFFFFF

 (Transfer Functions)

0x00000000

3 GB

/ (User / Program Address Space)

0xDEADBEEF

 (Kernel Address Space)

void kfunc (int __user *uptr, int *kptr) { copy_from_user(kptr, uptr, 4); ......
}

0UxnDinEiAtiDalBizEeEdF

32 A Typical Address Space Separation Scheme with a 32-bit Virtual Address Space

1 GB

0xC0000000 0xFFFFFFFF

 (Shared Userspace Pointer Across Threads)

0x00000000

3 GB

......

/ (User / Program Address Space)

0xDEADBEEF

 (Kernel Address Space)

void kfunc (int __user *uptr, int *kptr) { copy_from_user(kptr, uptr, 4); ......
}

0UxnDinEiAtiDalBizEeEdF

32 A Typical Address Space Separation Scheme with a 32-bit Virtual Address Space

1 GB

0xC0000000 0xFFFFFFFF

 (Shared Userspace Pointer Across Threads)

0x00000000

3 GB

......

/ (User / Program Address Space)

0xDEADBEEF

 (Kernel Address Space)

void kfunc (int __user *uptr, int *kptr) { copy_from_user(kptr, uptr, 4); ......
}

0UxnDinEiAtiDalBizEeEdF

32 A Typical Address Space Separation Scheme with a 32-bit Virtual Address Space

1 GB

0xC0000000 0xFFFFFFFF

""(Why Double-Fetch?)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

?? bytes

""(Why Double-Fetch?)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

?? bytes 30 4 bytes

""(Why Double-Fetch?)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

?? bytes 30 4 bytes
30

""(Why Double-Fetch?)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

?? bytes 30 4 bytes
30

""(Why Double-Fetch?)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

30 bytes 30 4 bytes
30

""(Why Double-Fetch?)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

30 bytes 30 4 bytes 30
30

""(Why Double-Fetch?)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

30 bytes 30 4 bytes 30
30

"" (What Can Go Wrong in This Process?)

 (Right After the First Fetch)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

?? bytes 30 4 bytes
30

 (Race Condition in The Userspace)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

30 bytes
65535
4 bytes
30

 (Right After the Second Fetch)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

30 bytes
65535
4 bytes 30
65535

`size' (When Exploits Happen)

1 static int perf_copy_attr_simplified 2 (struct perf_event_attr __user *uattr, 3 struct perf_event_attr *attr) {

4
5 u32 size;

6

7 // first fetch

8 if (get_user(size, &uattr->size))

9

return -EFAULT;

10

11 // sanity checks

12 if (size > PAGE_SIZE ||

13

size < PERF_ATTR_SIZE_VER0)

14

return -EINVAL;

15

16 // second fetch

17 if (copy_from_user(attr, uattr, size))

18

return -EFAULT;

19
20 ...... 21 }

22
23 // BUG: when attr->size is used later 24 memcpy(buf, attr, attr->size);

30 bytes
65535
4 bytes 30
65535
 Kernel information leak!

"" (Root Cause of Double-Fetch Bugs)
-  - (FALSE ASSUMED ATOMICITY IN SYSCALL EXECUTION)
- "" - (IN ESSENCE, A TIME-OF-CHECK-TO-TIME-OF-USE (TOCTOU) BUG)

"" (Double-Fetch is Prevalent in Kernels)
-  - (SIZE CHECKING) -  - (DEPENDENCY LOOKUP) - / - (PROTOCOL/SIGNATURE CHECKING) -  - (INFORMATION GUESSING) - ......

""2:  (Case 2: Dependency Lookup)
Adapted from __mptctl_ioctl in file drivers/message/fusion/mptctl.c

""2:  (Case 2: Dependency Lookup)
Acquire mutex lock for ioc 01 Perform do_fw_download for ioc 02 Release mutex lock for ioc 01 Adapted from __mptctl_ioctl in file drivers/message/fusion/mptctl.c

""3:  (Case 3: Protocol/Signature Check)
Adapted from do_tls_setsockopt_tx in file net/tls/tls_main.c

""4:  (Case 4: Information Guessing)
Adapted from con_font_set in file drivers/tty/vt/vt.c

"" (Prior Works)

 (Kernel)  (Analysis)  (Method)
"" (Patten)
 (Code Coverage)
 (Manual Effort)

Bochspwn (BlackHat'13)

DECAF (arXiv'17)

Pengfei et. al., (Security'17)

Windows

Linux

Linux, FreeBSD

 (Dynamic)

 (Dynamic)

 (Static)

 (VMI)

 (Kernel fuzzing)

 (Lexical Code Matching)

 
(Memory access timing)

 (Cache side channel)

 
(Size checking)

 (Low)

 (Low)

 (High)

"""" (Manual checking required to differentiate double-fetch cases and bugs)

"" (Prior Works)

 (Kernel)  (Analysis)  (Method)
"" (Patten)
 (Code Coverage)
 (Manual Effort)

Bochspwn (BlackHat'13)

DECAF (arXiv'17)

Pengfei et. al., (Security'17)

Deadline (IEEE SP'18)

Windows

Linux

Linux, FreeBSD

Linux, FreeBSD

 (Dynamic)

 (Dynamic)

 (Static)

 (Static)

 (VMI)

 (Kernel fuzzing)





(Lexical Code Matching) (Symbolic Execution)

 
(Memory access timing)

 (Cache side channel)

 ""





(Size checking)

(Formal definitions)

 (Low)

 (Low)

 (High)

 (High)

""""



(Manual checking required to differentiate double-fetch cases and bugs) (No manual checking)

"" (Double-Fetch Bugs: A Formal Definition)

 (A, S) . A ­  S ­ 

Fetch: A pair (A, S), where

A - the starting address of the fetch,

S

- the size of memory copied into kernel.


-  A0  A1 < A0

(A0, + S0

S0) 
||

(A1, A1 

S1) A0 <

OAv1-eAr+l0apSpA1 e1 d<-fAe0tc+hS:0Tw||o

fetches, (A0, A1  A0 < A1

S0) and + S1

(A1,

S1),

-

 (A01, S01)  (A01,

S01,

0)

-

The The

overlapped memory region is marked as copied value during 1st fetch is (A01, S01,

(A01, 0)

S01)

-  (A01, S01, 1) - The copied value during 2nd fetch is (A01, S01, 1)

""(A01, S01, 0) != (A01, S01, 1)
An intuitive (but imprecise) definition of "double-fetch": (A01, S01, 0) != (A01, S01, 1)

"" (Double-Fetch Bugs: A Formal Definition)
 V  (A01, S01)  V 
Control dependence: A variable V  (A01, S01) and V must satisfy a set of constraints before the second fetch can happen.

"" (Double-Fetch Bugs: A Formal Definition)
 V  (A01, S01)  V 
Control dependence: A variable V  (A01, S01) and V must satisfy a set of constraints before the second fetch can happen.
V (Overlapped variable V):
header.version
V (The constraint V must satisfy):
header.version == TLS_1_2_VERSION
V (The expectation for V after second fetch)
full->version == TLS_1_2_VERSION

"" (Double-Fetch Bugs: A Formal Definition)
 V  (A01, S01)  V 
 Data dependence: A variable V  (A01, S01) and V is consumed before or on the second fetch (e.g., involved in calculation, passed to function calls, etc).

"" (Double-Fetch Bugs: A Formal Definition)
 V  (A01, S01)  V 
Data dependence: A variable V  (A01, S01) and V is consumed before or on the second fetch (e.g., involved in calculation, passed to function calls, etc).
V (Overlapped variable V):
khdr.iocnum
V (The statement where V is consumed):
mpt_verify_adapter(khdr.iocnum, &iocp)
V (The expectation for V after second fetch)
kfwdl.iocnum == khdr.iocnum

"" (Double-Fetch Bugs: A Formal Definition)
1. 
Two fetches from userspace memory that cover an overlapped region.
2.  
A relation must exist on the overlapped region between the two fetches. The relation can be either controldependence or data-dependence.
3. 
We cannot prove that the relation established after first fetch still holds after the second fetch.

 (How to Find Double-Fetch Bugs?)
1. ""
Find as many double-fetch pairs as possible, construct the code paths associated with each pair.
2. ""
Symbolically check each code path and determine whether the two fetches makes a double-fetch bug.

"" (Fetch Pair Collection)
 Goal: Statically enumerate all pairs of fetches that could possibly occur.

"" (Fetch Pair Collection)


(Start from a fetch)

static void enclosing_function( struct msg_hdr __user *uptr, struct msg_full *kptr
) { ... ... ... ... ... ... ... if (copy_from_user(kptr, uptr, size)) return -EFAULT; ...
}

"" (Fetch Pair Collection)


(Search through the reaching instructions)

static void enclosing_function( struct msg_hdr __user *uptr, struct msg_full *kptr
) { ... ... ... ... ... ... ... if (copy_from_user(kptr, uptr, size)) return -EFAULT; ...
}

"" (Fetch Pair Collection)

[]
"" [Case 1]
Found another fetch

static void enclosing_function( struct msg_hdr __user *uptr, struct msg_full *kptr
) { ... ... if (get_user(size, &uptr->size)) return -EFAULT; ... ... ... if (copy_from_user(kptr, uptr, size)) return -EFAULT; ...
}

"" (Fetch Pair Collection)

[]
"" [Case 2]
Found a fetch-involved function

static void enclosing_function( struct msg_hdr __user *uptr, struct msg_full *kptr
) { ... ... size = get_size_from_user(uptr); ... ... ... ... if (copy_from_user(kptr, uptr, size)) return -EFAULT; ...
}

"" (Fetch Pair Collection)

static void enclosing_function(

struct msg_hdr __user *uptr,

struct msg_full *kptr

) {

...

[]

...

""

...

[Case 3]

...

o fetch-related instruction found ...

...

...

if (copy_from_user(kptr, uptr, size))

return -EFAULT;

...

}

 (Symbolic Checking)
  Goal: Symbolically execute the code path that connects two fetches and determine whether the two fetches satisfy all the criteria set in formal definition of double-fetch bug

 (Symbolic Checking)

 (Symbolic Checking)

 (Symbolic Checking)

 (Symbolic Checking)

 (Symbolic Checking)

 (Symbolic Checking)

 (Symbolic Checking)

 (Symbolic Checking)
  Please refer to our paper for a comprehensive demonstration on how Deadline handles loop unrolling and pointer resolving

 (Findings)
1. 24 24 Bugs found in total.
· 23LINUX1FREEBSD
23 bugs in Linux kernel and 1 in FreeBSD kernel
2. 10 10 bugs have been patched with the fix we provide
3. 5 5 bugs are acknowledged, we are still working on the fix
4. 7 7 bugs are pending for review
5. 2""
2 bugs are marked as "won't fix"

"" (Patching Double-Fetch Bugs)
1.  Override the second fetch

"" (Patching Double-Fetch Bugs)
2.  Abort on change detected

"" (Patching Double-Fetch Bugs)
3.  Refactor overlapped copies into incremental copies.

"" (Patching Double-Fetch Bugs)
4.  Refactor overlapped copies into a single-fetch.

"" (Generic Patch for Double-Fetch Bugs)
"" 
Unfortunately, not all double-fetch bugs can be patched with these patterns. Some requires heavy refactoring of existing codebase or re-designing of structs, which requires substantial manual effort.
"DECAF" INTEL CPUTSX
Recently, DECAF has provided a promising solution in using TSX-based techniques to ensure user space memory access automaticity in syscall execution.

 (Conclusion)
 
Detecting double-fetch bugs without a precise and formal definition has led to many false alerts and tremendous manual effort.
DEADLINE"" TEE
Application beyond kernels: hypervisors, browsers, TEE, etc.
 
Logic bugs are on the rise! We hope that more logic bugs can be modeled and checked systematically

 

