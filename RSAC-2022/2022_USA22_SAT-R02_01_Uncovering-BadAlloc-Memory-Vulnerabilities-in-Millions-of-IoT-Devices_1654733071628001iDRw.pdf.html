#RSAC

SESSION ID: SAT-R02
Uncovering "BadAlloc" Memory Vulnerabilities in Millions of IoT Devices

Omri Ben-Bassat
Security Researcher Section 52, Microsoft Defender for IoT,
Microsoft.

Tamir Ariel
Security Researcher Section 52, Microsoft Defender for IoT,
Microsoft.

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA Conference LLC or any other cosponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. The RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC
Index
Intro Quick Reminder ­ Integer Overflows Memory Allocator 101 Affected Products Notable Examples Technical Analysis Texas Instruments "SimpleLink" SDK Exploitation SimpleLink POC Demo Mitigation techniques Q&A
3

#RSAC
Quick Reminder
Integer Overflows

#RSAC
Summation
8 + 8 = ??
5

#RSAC
Summation
8 + 8 = 88
6

#RSAC
Summation
8 + 8 = 88
7

#RSAC
Summation
8 + 8 = 16
8

#RSAC
Summation
8 + 8 = 16 4,294,967,295(2^32-1) + 8 = 7
(on 32-bit systems)
9

#RSAC
Multiplication
2 * 2 = 4 2,147,483,649(2^31+1) * 2 = 2
(on 32-bit systems)
10

#RSAC
Memory Allocator
101

#RSAC
Heap Layout
Free memory is managed by the allocator using a single/double linked list of free blocks.

Size

Data

Size

Next free cell

Previous free cell

Data

Size

Data

Size

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

12

#RSAC
Calculating total block size

1024

malloc

Size

Data

8 + 1024 = 1032

13

#RSAC
What will happen if I ask for a very large chuck of memory?

4,294,967,295 (232 - 1)

malloc

Size

Data

8 + 232 - 1 = 7

14

#RSAC
calloc

231 + 1 2

calloc size

malloc

2 * 231 + 1 = 2

15

Good Alloc
Alice

#RSAC
Server
Read_user_data(user_data, size) ... Buf = malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
16

Good Alloc
Alice

#RSAC
Server
Read_user_data(user_data, size) ... Buf = malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
17

Good Alloc
Alice

#RSAC
Server
Read_user_data(user_data, size) ... Buf = malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
18

Good Alloc
Alice

#RSAC
Server
Read_user_data(user_data, size) ... Buf = malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
19

Good Alloc
Alice

#RSAC
Server
Read_user_data(user_data, size) ... Buf = malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
20

Good Alloc
Alice

#RSAC
Server
Read_user_data(user_data, size) ... Buf = malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
21

Good Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
22

Good Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
23

Good Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
24

Bad Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = bad_malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
25

Bad Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = bad_malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
26

Bad Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = bad_malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
27

Bad Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = bad_malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
28

Bad Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = bad_malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!"
(2^el3se2-1r)etu+rn8"so=rry7too much data"
...
29

Bad Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = bad_malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
30

Bad Alloc
Alice Eve

#RSAC
Server
Read_user_data(user_data, size) ... Buf = bad_malloc(size) If (buf != NULL) memcpy(buf, user_data, size) return "ok, thank you!" else return "sorry too much data" ...
31

#RSAC
Bad Alloc
hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi
hihihihihihihihihihihihihihihihihihihihihihihihihihihihiSheihrihviehirhihihihi
hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi
AhhliiihhciiehhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhiihhRiiehhaiidhh_iiuhh...siieBhhru_iihhfd=aiihhtbaiia(hhudiis_hhemrii_hhadliilhhaotciia(hh,siiiszhhieziie)hh) iihhii
hihihihihihihihihihihihihihihihihihihihihihihihihiIhf i(hbuihf !i=hNihUiLhLi)hihihihihi hihihihihihihihihihihihihihihihihihihihihihihihihihihihihmiheimhcihpyih(biuhf,ihusiheri_data, size) hihihihihihihihihihihihihihihihihihihihihihihihihiehlisheihihriehtiuhrnih"iohk,ihthihanihk iyou!" hihihihihihihihihihihihihihihihihihihihihihihihihihihihihriehtiuhrnih"ishorirhyihtoiohmi uch data" hihihihihihihihihihihihihihihihihihihihihihihihih...ihihihihihihihihihihihi hihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihihi
Eve
32

#RSAC
Affected Products

#RSAC
#BHUSA @BlackHatEvents

#RSAC

1985

2002

2007

2015

1991

2003

2014

NuttX klibc

10/2020 2016
BadAlloc vulnerability disclosed throw CISA
& MSRC
#BHUSA @BlackHatEvents

#RSAC
Notable Examples

#RSAC
VxWorks 5.1 - 1993
37

#RSAC
VxWorks 5.1 - 1993
38

#RSAC
VxWorks 5.1 - 1993
39

#RSAC
Klibc - 2002
40

#RSAC
Klibc - 2002
41

#RSAC
Klibc - 2002
42

#RSAC
Klibc - 2002
43

#RSAC
klibc - 2002
44

#RSAC
Technical Analysis
Texas Instruments "SimpleLink" SDK

#RSAC
Texas Instruments "SimpleLink" SDK
46

#RSAC
Texas Instruments "SimpleLink" SDK
47

#RSAC
Texas Instruments "SimpleLink" SDK
48

#RSAC
Texas Instruments "SimpleLink" SDK
49

#RSAC
Texas Instruments "SimpleLink" SDK
50

#RSAC
Texas Instruments "SimpleLink" SDK
51

#RSAC
Texas Instruments "SimpleLink" SDK
52

#RSAC
Texas Instruments "SimpleLink" SDK
53

#RSAC
calloc is safe
54

#RSAC
calloc is safe
55

#RSAC
calloc is safe
56

#RSAC
malloc isn't
57

#RSAC
malloc isn't
58

#RSAC
malloc isn't
59

#RSAC
Exploitation
SimpleLink POC

#RSAC
OTA(Over the Air) Updates
61

#RSAC
Bundle command signature file
62

#RSAC
Bundle command signature file
63

#RSAC
Bundle file parsing
64

#RSAC
GetEntireFile
65

#RSAC
GetEntireFile
66

#RSAC
heap corruption => code execution
Heap overflow Find function pointer which we can override in memory. Override "next free" pointer of next block to desired address. Force another allocation with user-controlled data. Force call to overridden function pointer.
67

#RSAC
heap corruption => code execution

Size

Data

Size

Next free cell

Data

Size

Data

Size

Data

Size Next free cell

Data

Size

Data

Size

Next free cell

Data

Allocated

Free

68

#RSAC
heap corruption => code execution

Size

Data

Size

Next free cell AAADaAtaAAAAAAAASiAzeAAAAAADaAtaAAAASAizAeAAAAADAatAaAAAAASiAze 0x2001ABCD

Data

Size

Function Pointer

Size

Next free cell

Data

Allocated

Free

69

#RSAC
httpRequest struct
70

#RSAC
httpRequest struct
71

#RSAC
httpRequest struct
72

#RSAC
httpRequest struct
73

#RSAC
Demo

#RSAC
#BHUSA @BlackHatEvents

#RSAC
Mitigation techniques
How should you do it?
­ Start by checking-out the advisory. ­ Reverse Engineer the binaries(always the best approach, in life). ­ Source code review if it's public. ­ "Unit tests" - compile a small application the verify the environment.
It's also recommended to check the macros that are being used in these functions.
76

#RSAC
Mitigation techniques
Recommended function to check ­
­ malloc ­ calloc ­ realloc ­ memalign ­ valloc ­ pvalloc ­ aligned_alloc
77

#RSAC
Mitigation techniques
glibc
78

#RSAC
Mitigation techniques
glibc
79

#RSAC
Mitigation techniques
Embedded Artistry libc
80

Mitigation techniques
Embedded Artistry libc
1<<16 = 65536

#RSAC
SIZE_MAX = 0xffffffff
81

#RSAC
Mitigation techniques
musl libc
82

#RSAC
Mitigation techniques
musl libc
83

#RSAC
Apply
RTOS vendors:
­ Map allocation functions such as malloc or calloc. ­ Option 1(preferred) - Add a check for integer overflow on requested
allocation. ­ Option 2 ­ limit max allocation size to prevent possible overflows.
RTOS users/application developers:
­ Check the advisory ICSA-21-119-04 to see if your system is effected. ­ Option 1(preferred) - Update your system and apply patches from vendor. ­ Option 2 ­ Update your system and apply patches from vendor.
84

#RSAC
Advisory
CVSS 9.8 28 CVE
85

Q&A

#RSAC

https://msrc-blog.microsoft.com/2021/04/29/badalloc-memory-allocation-vulnerabilities-could-affect-wide-range-of-iot-and-ot-devices-in-industrial-medical-and-enterprise-networks/
Bing for "ICSA-21-119-04"
86

