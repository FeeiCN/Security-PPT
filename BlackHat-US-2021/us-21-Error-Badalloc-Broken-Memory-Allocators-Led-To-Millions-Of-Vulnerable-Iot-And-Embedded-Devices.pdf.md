ERROR: BadAlloc! - Broken Memory Allocators Led to Millions of Vulnerable
IoT and Embedded Devices
#BHUSA @BlackHatEvents

Omri Ben-Bassat
Security Researcher
Azure Defender for IoT

Tamir Ariel
Security Researcher
Azure Defender for IoT
#BHUSA @BlackHatEvents

Index
· Intro · Quick Reminder ­ Integer Overflows · Memory Allocator 101 · Affected Products · Notable Examples · Technical Analysis Texas Instruments "SimpleLink" SDK · Exploitation SimpleLink POC · Demo · Mitigation techniques · Q&A

#BHUSA @BlackHatEvents

Quick Reminder
Integer Overflows
#BHUSA @BlackHatEvents

Sum
8 + 8 = ?? 4,294,967,295(0xffffffff) + 8 = 7
#BHUSA @BlackHatEvents

Sum
8 + 8 = 88 4,294,967,295(0xffffffff) + 8 = 7
#BHUSA @BlackHatEvents

Sum
8 + 8 = 88 4,294,967,295(0xffffffff) + 8 = 7
#BHUSA @BlackHatEvents

Sum
8 + 8 = 16 4,294,967,295(0xffffffff) + 8 = 7
#BHUSA @BlackHatEvents

Sum
8 + 8 = 16 4,294,967,295(232 - 1) + 8 = 7
#BHUSA @BlackHatEvents

Sum
8 + 8 = 16 4,294,967,295(232 - 1) + 8 = 7
(on 32-bit systems)
#BHUSA @BlackHatEvents

Multiplication
2 * 2 = 4 2,147,483,649(2232 + 1) * 2 = 2
#BHUSA @BlackHatEvents

Multiplication

2 * 2 = 4 2,147,483,649(2232 + 1) * 2 = 2
(on 32-bit systems)

#BHUSA @BlackHatEvents

Memory Allocator 101
#BHUSA @BlackHatEvents

Heap layout
· Free memory is managed by the allocator using a single/double linked list of free blocks.

Size

Data

Size

Next free cell

Previous free cell

Data

Size

Data Size

Data

Size

Next free cell

Previous free cell

Data

Size

Data

Size

Next free cell

Previous free cell

Data

Allocated

Free

#BHUSA @BlackHatEvents

Calculating total block size

1024 size malloc

Size
8 +

Data
1024

= 1032

#BHUSA @BlackHatEvents

What will happen if I ask for a large amount of space?

4,294,967,295

(232 - 1)

size

malloc

Size

Data

8 + 232 - 1 = 7

#BHUSA @BlackHatEvents

Calloc
232 2 +1
2

calloc size 2 *

malloc

232 2 +1

= 2

#BHUSA @BlackHatEvents

Good alloc
Alice

Server
Read_user_data(user_data, size) ...
Buf = malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Good alloc
Alice

Server
Read_user_data(user_data, size) ...
Buf = malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Good alloc
Alice

Server
Read_user_data(user_data, size) ...
Buf = malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Good alloc
Alice

Server
Read_user_data(user_data, size) ...
Buf = malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Good alloc
Alice

Server
Read_user_data(user_data, size) ...
Buf = malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Good alloc
Alice

Server
Read_user_data(user_data, size) ...
Buf = malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Good alloc
Alice Eve

Server
Read_user_data(user_data, size) ...
Buf = malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Good alloc
Alice Eve

Server
Read_user_data(user_data, size) ...
Buf = malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Good alloc
Alice Eve

Server
Read_user_data(user_data, size) ...
Buf = malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Bad alloc
Alice Eve

Server
Read_user_data(user_data, size) ...
Buf = bad_malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Bad alloc
Alice Eve

Server
Read_user_data(user_data, size) ...
Buf = bad_malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Bad alloc
Alice Eve

Server
Read_user_data(user_data, size) ...
Buf = bad_malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Bad alloc
Alice Eve

Server
Read_user_data(user_data, size) ...
Buf = bad_malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Bad alloc
Alice Eve

Server
Read_user_data(user_data, size) ...
Buf = bad_malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

Bad alloc
Alice Eve

Server
Read_user_data(user_data, size) ...
Buf = bad_malloc(size) If (buf != NULL)
memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
#BHUSA @BlackHatEvents

hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi
Bad ahlliohichihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi
hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi hihihihihihihihihihihihihihihihihihihihihihihSiehrihveihrihihihihihihihihihihi hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi AlicheihihihihihihihihihihihihihihihihihR...iehadih_uisher_ihdaitha(uihseri_hdiahta,ihsizieh) ihihihihihihihihi hihihihihihihihihihihihihihihihihihihihihBIfui(fbh=uifbh!a=diNh_mUiLhaLl)liohc(siihzei)hihihihihihihihihi hihihihihihihihihihihihihihihihihihihihihihihimrheetiumhrncip"hyo(kbi,hutfh,iahunsikehry_oiduha!t"iah, siizhe)ihihihihi hihihihihihihihihihihihihihihihihihihihihelishe ihihihihihihihihihihihihihihi
return "sorry too much data"
hihihihihihihihihihihihihihihihihih...ihihihihihihihihihihihihihihihihihihi hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi Evehihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi
#BHUSA @BlackHatEvents

Affected Products
#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

1985

2002

2007

2015

1991

2003

2014

Nuttx klibc

10/2020

2016

08/2021

BadAlloc vulnerability disclosed throw CISA
& MSRC

#BHUSA @BlackHatEvents

Notable Examples
#BHUSA @BlackHatEvents

VxWorks 5.1 - 1993

#BHUSA @BlackHatEvents

VxWorks 5.1 - 1993

#BHUSA @BlackHatEvents

VxWorks 5.1 - 1993

#BHUSA @BlackHatEvents

Klibc ­ 2002

#BHUSA @BlackHatEvents

Klibc ­ 2002

#BHUSA @BlackHatEvents

Klibc ­ 2002

#BHUSA @BlackHatEvents

Klibc ­ 2002

#BHUSA @BlackHatEvents

Klibc ­ 2002

#BHUSA @BlackHatEvents

Technical Analysis
Texas Instruments "SimpleLink" SDK
#BHUSA @BlackHatEvents

Texas Instruments "SimpleLink" SDK

#BHUSA @BlackHatEvents

Texas Instruments "SimpleLink" SDK

#BHUSA @BlackHatEvents

Texas Instruments "SimpleLink" SDK

#BHUSA @BlackHatEvents

Texas Instruments "SimpleLink" SDK

#BHUSA @BlackHatEvents

Texas Instruments "SimpleLink" SDK

#BHUSA @BlackHatEvents

Texas Instruments "SimpleLink" SDK

#BHUSA @BlackHatEvents

Calloc is safe

#BHUSA @BlackHatEvents

Calloc is safe

#BHUSA @BlackHatEvents

Calloc is safe

#BHUSA @BlackHatEvents

Malloc isn't

#BHUSA @BlackHatEvents

Malloc isn't

#BHUSA @BlackHatEvents

Malloc isn't

#BHUSA @BlackHatEvents

Exploitation
SimpleLink POC
#BHUSA @BlackHatEvents

Over-The-Air(OTA) Updates
#BHUSA @BlackHatEvents

Metadata File

#BHUSA @BlackHatEvents

Metadata File

#BHUSA @BlackHatEvents

Metadata File

#BHUSA @BlackHatEvents

Signature Verification

#BHUSA @BlackHatEvents

GetEntireFile

#BHUSA @BlackHatEvents

GetEntireFile

#BHUSA @BlackHatEvents

Heap overflow to CODE EXECUTION
· Heap Overflow · Find function pointer which we can override in memory. · Override "next free" pointer of next block to desired address. · Force another allocation with user-controlled data. · Force call to overridden function pointer.
#BHUSA @BlackHatEvents

Heap overflow to CODE EXECUTION

Size

Data Size Next free cell

Data

Size

Data Size

Data

Size

Next free cell

Data

Next

Size

Data Size free

cell

Data

Allocated

Free

#BHUSA @BlackHatEvents

Heap overflow to CODE EXECUTION

Size

AAAAAAAAAAAAAAAAAAAAA Data Size Next free cell

Data

Size

Data Size

Data

Size 0x2001ABCD

Data

Size

Function Pointer

Size

Next free cell

Data

0x2001ABCD

Allocated

Free

#BHUSA @BlackHatEvents

httpRequest

#BHUSA @BlackHatEvents

httpRequest

#BHUSA @BlackHatEvents

httpRequest

#BHUSA @BlackHatEvents

httpRequest

#BHUSA @BlackHatEvents

Demo

#BHUSA @BlackHatEvents

Mitigation techniques
#BHUSA @BlackHatEvents

Mitigation techniques
Recommended function to check ­ · malloc · calloc · realloc · memalign · valloc · pvalloc · aligned_alloc

#BHUSA @BlackHatEvents

Mitigation techniques
How should you do it? · Start by checking-out the advisory. · Reverse Engineer the binaries(always the best approach, in life). · Source code review if it's public. · "Unit tests" - compile a small application the verify the environment. It's also recommended to check the macros that are being used in these functions
#BHUSA @BlackHatEvents

Mitigation techniques
glibc

#BHUSA @BlackHatEvents

Mitigation techniques
glibc

#BHUSA @BlackHatEvents

Mitigation techniques
Embedded Artistry libc
#BHUSA @BlackHatEvents

Mitigation techniques
Embedded Artistry libc
1<<16 = 65536

SIZE_MAX = 0xffffffff

#BHUSA @BlackHatEvents

Mitigation techniques
musl
#BHUSA @BlackHatEvents

Mitigation techniques
musl
#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

Q&A

https://msrc-blog.microsoft.com/2021/04/29/badalloc-memory-allocation-vulnerabilities-could-affect-wide-range-of-iot-and-ot-devices-in-industrial-medical-and-enterprise-networks/

Bing for "ICSA-21-119-04"

#BHUSA @BlackHatEvents

