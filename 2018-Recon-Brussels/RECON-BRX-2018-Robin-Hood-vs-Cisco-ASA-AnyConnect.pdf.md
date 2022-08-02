Robin Hood vs Cisco ASA Anyconnect
Recon Brussels ­ February 2018

Speaker
· Cedric Halbronn (@saidelike) · Previously worked at Sogeti ESEC Lab · Currently in Exploit Development Group (EDG) at NCC Group
· Vulnerability research · Reverse engineering · Exploit development

Agenda
· Find a pre-auth 0-day in a Cisco ASA firewall · Prove Remote Code Execution · How to protect against 0-day?
https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20180129-asa1

Cisco ASA firewalls
· Entry point to most enterprises · ASA != IOS
· ASA = Linux + a single "lina" binary / x86 or x86_64
· dlmalloc or ptmalloc heap allocator [1]
· IOS = proprietary operating system / PowerPC
[1] https://github.com/nccgroup/asafw/blob/master/README.md#mitigation-summary

SSL VPN
· WebVPN: client-less (browser) · AnyConnect: client on Windows, OS X, Linux,
Android, iPhone OS
SSL SSL

IKE VPN
· A.k.a. IPSec · Typically static point-to-point VPNs
IKEv1 or IKEv2
· Also supported by native Windows client or even AnyConnect?
Source: https://www.cisco.com/c/en/us/support/docs/security-vpn/webvpn-ssl-vpn/119208-config-asa-00.html#anc17

Previous work
· 2014
· Various WebVPN ASA version leaks (Alec Stuart)
· 2016
· CVE-2016-1287: heap overflow in IKE Cisco fragmentation (Exodus Intel) · CVE-2016-6366: SNMP OID stack overflow (Shadow Brokers)
· 2017
· Cisco ASA series on NCC blog in 8-parts (so far )
https://www.nccgroup.trust/uk/about-us/newsroom-and-events/blogs/2017/september/cisco-asa-series-part-one-intro-to-the-cisco-asa/ https://github.com/nccgroup/asatools

Vulnerability & feng-shui overview
IKEv1 WebVPN/AnyConnect
SSL

The bigger the worse?

· What license to buy?

50 IKE sessions 250 IKE sessions
750 IKE sessions 5000 IKE sessions

· An IKE session limits the quantity of data sent as IKE fragments to 0x8000 bytes · More sessions  more feng shui · Exploit is more reliable against expensive Cisco hardware and license · Possible to rob from the rich and give to the poor · So I named my vulnerabilityexploit: Robin Hood
Source: https://www.cisco.com/c/en/us/td/docs/security/asa/asa97/configuration/vpn/asa-97-vpn-config/vpn-ike.html#ID-2441-00000058

Finding a bug

Sniffing SSL AnyConnect
Burp (or similar)
· First message sent by AnyConnect client
XML

Supported XML tags
Reverse engineering
· Initial sample contains all supported tags
 Input mutation fuzzing

Fuzzing architecture
· Spray/pray/prey 
Mutated XML packet (radamsa) Ping (still alive?) NO  save packet
· Speed: 1 test / few seconds... · No gdb attached, is that not slow enough?

https://github.com/aoh/radamsa

The wall is on fire...
· Want to start fuzzing before going on leave... · ASA firewall keeps crashing

Understanding the bug

Triage
· asadbg-assisted
· https://github.com/nccgroup/asadbg
Connect GDB Fire testcase
Save crash info

Replay with gdb script
# will be called next time it stops. Should be when it crashes # so we log stuff define hook-stop
set logging file %CRASH_LOG_FILE% set logging on set logging redirect on set logging overwrite on sync bbt ir set logging off set logging redirect off end
continue
# below will be executed after it breaks because of a crash # and this allows us to exit gdb detach quit

One crash to rule them all
· All the same crash · Both ASAv 64-bit / ASA 32-bit

The smaller the better
· Fits in a tweet
AnyConnect Host Scan: https://www.cisco.com/c/en/us/td/docs/security/asa/asa84/configuration/guide/asa_84_cli_config/vpn_hostscan.html

Back to the trace
· What is it?
· Crash in free() · Invalid heap metadata? · Heap overflow? · UAF? · Double free? · Other?
· Interesting functions
· *auth_process_client* · *FreeParser*

2 days reversing later...
· aggregateAuthParseBuf
· Receive the XML / initialize the libexpat parser
· Cisco-specific callbacks registered
· aggregateAuthStartHandler: called when XML tag opened · aggregateAuthDataHandler: called when XML data parsed · aggregateAuthEndHandler: called when XML tag closed

Data handler

Data handler
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

Data handler
XML 1
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

Data handler
Allocated chunk
XML 1
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

Data handler
XML tag data copied in chunk
1
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

Data handler
Chunk is freed
1
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

Data handler
XML tag data dangling pointer retained by Cisco callback
1
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

Data handler
XML tag data dangling pointer retained by Cisco callback
1
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

Data handler

XML tag data dangling pointer retained by Cisco callback

1

XML 2

· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it

· Tags' data copied and appended in the same chunk

 double-free vulnerability on 0x2040-byte chunk

Data handler
XML tag data appended in free chunk
12
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

Data handler
XML tag data appended in free chunk
12
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

Data handler
Chunk is freed (double-free)
12
· First packet with <host-scan-reply> tag
· Allocate heap buffer for data, copy data, free it (but dangling pointer)
· Second packet with <host-scan-reply> tag
· No reallocation, copy data, free it
· Tags' data copied and appended in the same chunk  double-free vulnerability on 0x2040-byte chunk

assert() due to invalid metadata

· Inline metadata/header for heap chunks
Hchunk H chunk H Free chunk Hchunk

prev_foot = 0x8180d4d0

head mh_magic

= 0x1d0 (CINUSE|PINUSE) = 0xa11c0123

Allocated

mh_len

= 0x1a4

mh_refcount = 0x0

chunk header

mh_unused = 0x0

mh_fd_link = 0xacb85b30

mh_bk_link = 0xa8800604

allocator_pc = 0x86816b3

free_pc

= 0x868161d

Same offset

prev_foot = 0x8180d4d0

head

= 0x30 (PINUSE)

fd

= 0xac825ab8

bk

= 0xa880005c

mh_refcount = 0xf3ee0123

mh_unused = 0x0

mh_fd_link = 0x0

mh_bk_link = 0x0

allocator_pc = 0x0

free_pc

= 0x0

Free chunk header

· Hence why our fuzzer caught it!

Exploiting the bug like RobinHood

Objective: mirror write

· Allocated chunks hold pointers to alloc lists

prev_foot = 0x8180d4d0

head

= 0x1d0 (CINUSE|PINUSE)

mh_magic

= 0xa11c0123

mh_len

= 0x1a4

mh_refcount = 0x0

mh_unused = 0x0

mh_fd_link = 0xacb85b30

mh_bk_link = 0xa8800604

allocator_pc = 0x86816b3

free_pc

= 0x868161d

· Target mempool alloc lists to get a mirror write

· No safe unlinking on Cisco specific metadata on all ASA versions

· Even if dlmalloc or ptmalloc had safe unlinking for free chunks

· Mirror write: unlinking an element from a doubly-linked list will trigger two write operations
· One operation is the useful one, the other is a side effect · Constraint: both need to be writable addresses

· Was already abused in 2016 by Exodus Intel

Exploit strategy
Use double free  Create confusion state on the heap  Overflow some memory
 Overwrite linked list pointers  Trigger mirror write primitives
 Overwrite a function pointer  Get RCE

Use what you got
· Leverage what you learnt from CVE-2016-1287 (IKE heap overflow)
· IKEv1 feng shui is quite reliable · IKE fragmentation can be used to overflow memory

· Simple IKE reassembly

Seqno=1

Seqno=2

Seqno=3
LastFrag=1

Reassembled packet

1

2

3

https://www.nccgroup.trust/uk/about-us/newsroom-and-events/blogs/2017/november/cisco-asa-series-part-eight-exploiting-the-cve-2016-1287-heap-overflowover-ikev1/

Primitive 1 - Hole creation with IKEv1
· Session 1: fill holes · Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole

Primitive 1 - Hole creation with IKEv1
· Session 1: fill holes · Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole
sess1

Primitive 1 - Hole creation with IKEv1
· Session 1: fill holes · Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole
sess1 sess1

Primitive 1 - Hole creation with IKEv1
· Session 1: fill holes · Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole
SeqNo=1
sess1 sess1 sess2

Primitive 1 - Hole creation with IKEv1
· Session 1: fill holes · Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole
SeqNo=1
sess1 sess1 sess2 sess1

Primitive 1 - Hole creation with IKEv1
· Session 1: fill holes · Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole
SeqNo=1
sess1 sess1 sess2 sess1 sess1

Primitive 1 - Hole creation with IKEv1
· Session 1: fill holes · Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole

SeqNo=1
sess1 sess1 sess2 sess1 sess1

SeqNo=2
sess2
LastFrag=1

Primitive 1 - Hole creation with IKEv1
· Session 1: fill holes · Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole

SeqNo=1
sess1 sess1 sess2 sess1 sess1

reass
SeqNo=2
sess2
LastFrag=1

Primitive 1 - Hole creation with IKEv1

· Session 1: fill holes
· Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole

sess1 sess1

SeqNo=1
sessr2eass

sess1 sess1

SeqNo=2
sess2
LastFrag=1

Primitive 1 - Hole creation with IKEv1

· Session 1: fill holes
· Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole

sess1 sess1

SeqNo=1 SeqNo=2
sessr2easssess2
LastFrag=1
sess1 sess1

Primitive 1 - Hole creation with IKEv1
· Session 1: fill holes · Session 2: only two fragments
· Frag 1: future hole · Frag 2: trigger reassembly, hence creating hole

sess1 sess1

sess1 sess1

Primitive 2 - Overflow with IKEv1
Note: for the sake of simplicity, we do not show sequence numbers anymore

Primitive 2 - Overflow with IKEv1
Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

Primitive 2 - Overflow with IKEv1
Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)
sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1
LastFrag=1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1
LastFrag=1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1
LastFrag=1

Reassembled packet

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1
LastFrag=1

Reassembled packet sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1
LastFrag=1

Reassembled packet sess1 sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1
LastFrag=1

Reassembled packet sess1 sess1 sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1
LastFrag=1

Reassembled packet Heap overflow sess1 sess1 sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

sess1

sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

sess1

sess1

sess1
LastFrag=1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

sess1

sess1

sess1
LastFrag=1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

sess1

sess1

sess1
LastFrag=1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

sess1

sess1

sess1
LastFrag=1

Reassembled packet

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

sess1

sess1

sess1
LastFrag=1

Reassembled packet sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

sess1

sess1

sess1
LastFrag=1

Reassembled packet sess1 sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore 1. Reduce the accumulated length (CVE-2016-1287)

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

sess1

sess1

sess1
LastFrag=1

Reassembled packet

sess1 sess1

sess1

Primitive 2 - Overflow with IKEv1

Note: for the sake of simplicity, we do not show sequence numbers anymore

1. Reduce the accumulated length (CVE-2016-1287)
N-18

sess1

sess1

sess1

Reassembled packet Heap overflow

LastFrag=1

sess1 sess1 sess1

2. Increase fragment length (overflow primitive)

N

sess1

sess1

sess1

Reassembled packet

Heap overflow

LastFrag=1

sess1

sess1 N+18

sess1

Limited overflow (18-byte on 32-bit)

Primitive 3 ­ Repeatable free with XML
· XML data allocated for first packet, then freed · Allocate IKEv1 fragment in same hole · Free IKEv1 fragment using the double free primitive · Allocate another IKEv1 fragment in same hole  Interesting confusion state

feng feng

feng feng

Primitive 3 ­ Repeatable free with XML
· XML data allocated for first packet, then freed · Allocate IKEv1 fragment in same hole · Free IKEv1 fragment using the double free primitive · Allocate another IKEv1 fragment in same hole  Interesting confusion state

feng

feng

XML tag data

feng

feng

Primitive 3 ­ Repeatable free with XML

· XML data allocated for first packet, then freed · Allocate IKEv1 fragment in same hole · Free IKEv1 fragment using the double free primitive · Allocate another IKEv1 fragment in same hole  Interesting confusion state

XML tag data dangling pointer

feng feng

feng feng

Primitive 3 ­ Repeatable free with XML
· XML data allocated for first packet, then freed · Allocate IKEv1 fragment in same hole · Free IKEv1 fragment using the double free primitive · Allocate another IKEv1 fragment in same hole  Interesting confusion state
XML tag data dangling pointer
feng feng sess F feng feng

Primitive 3 ­ Repeatable free with XML

· XML data allocated for first packet, then freed · Allocate IKEv1 fragment in same hole · Free IKEv1 fragment using the double free primitive · Allocate another IKEv1 fragment in same hole  Interesting confusion state

XML tag data dangling pointer

session frag

feng feng sess F feng feng

Primitive 3 ­ Repeatable free with XML

· XML data allocated for first packet, then freed

· Allocate IKEv1 fragment in same hole

· Free IKEv1 fragment using the double free primitive

· Allocate another IKEv1 fragment in same hole  Interesting confusion state

XML tag data dangling pointer

session frag

feng feng sess F feng feng

XML packet 2

Primitive 3 ­ Repeatable free with XML

· XML data allocated for first packet, then freed · Allocate IKEv1 fragment in same hole · Free IKEv1 fragment using the double free primitive · Allocate another IKEv1 fragment in same hole  Interesting confusion state

XML tag data dangling pointer

session frag

feng feng

feng feng

Primitive 3 ­ Repeatable free with XML

· XML data allocated for first packet, then freed

· Allocate IKEv1 fragment in same hole

· Free IKEv1 fragment using the double free primitive

· Allocate another IKEv1 fragment in same hole

 Interesting confusion state

XML tag data dangling pointer

"confused" session frag replacement frag

feng feng repl feng feng

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions

...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators

0x2040
feng

...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators

0x2040
feng

0x2040
feng

...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation

0x2040
feng

0x2040
feng

0x2040
creat1

...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation

0x2040
feng

0x2040
feng

0x2040
creat1

0x2040
feng

...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation

0x2040
feng

0x2040
feng

0x2040
creat1

0x2040
feng

0x2040
creat2

...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation

0x2040

0x2040

0x2040

0x2040

0x2040

0x2040

feng feng creat1 feng creat2 creat2

...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes

0x2040

0x2040

0x2040

0x2040

0x2040

0x2040

0x2040

feng feng creat1 feng creat2 creat2 target1

...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes

0x2040
feng

0x2040
feng

0x2040
creat1

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes

0x2040
feng

0x2040
feng

0x2040
creat1

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

creat1
LastFrag=1

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

XML packet 1

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes

0x2040
feng

0x2040
feng

0x2040
XML tag

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data dangling pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data dangling pointer

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled

0x2040
feng

0x2040
feng

0x2040
sess F

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data dangling pointer session frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled

0x2040
feng

0x2040
feng

0x2040
sess F

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data dangling pointer session frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled

0x2040
feng

0x2040
feng

0x2040
sess F

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

XML packet 2

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data dangling pointer session frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag

0x2040
feng

0x2040
feng

0x2040
repl

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag

0x2040
feng

0x2040
feng

0x2040
repl

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag

0x2040
feng

0x2040
feng

0x2040
repl

0x2040
feng

0x2040
creat2

0x2040
creat2

0x2040
target1

0x2040
target2
...

creat2
LastFrag=1

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag

0x2040
feng

0x2040
feng

0x2040
repl

0x2040
feng

0x2040

0x2040

0x2040
target1

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag

0x2040
feng

0x2040
feng

0x2040
repl

0x2040
feng

0x2040

0x2040

0x2040
target1

0x2040
target2
...

sess
LastFrag=1

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag · Purple: reassembled packet

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040
R

0x2040
F

0x2040
target1

0x4050

0x30

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag · Purple: reassembled packet

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040

0x2040

0x2040

R

F target1

0x4050

0x20d0

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag · Purple: reassembled packet

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040

0x2040

0x2040

F target1

0x6120

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag · Purple: reassembled packet · Grey: overlapping packet

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040

0x2040
O

0x2040
target1

0x6120

0x2040
target2
...

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag · Purple: reassembled packet · Grey: overlapping packet

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040

0x2040

0x2040

0x2040

O

Htarget1 Htarget2 ...

0x6120

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag · Purple: reassembled packet · Grey: overlapping packet

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040

0x2040

0x2040

0x2040

O

Htarget1 Htarget2 ...

0x6120

target2
LastFrag=1

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag · Purple: reassembled packet · Grey: overlapping packet

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040

0x2040

0x2040

0x2040

O

Htarget1 H

...

0x6120



Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag · Purple: reassembled packet · Grey: overlapping packet

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040

0x2040

0x2040

0x2040

O

Htarget1 H

...

target1

0x6120


LastFrag=1

Adjacent on the heap

Somewhere else on the heap

Exploit in a (coco)nut shell

· Hole creation primitive with IKEv1 · Allocate XML data in hole / freed at the end · Allocate fragment in same hole · Repeatable free primitive with XML · Allocate fragment with larger size in same hole · Trigger reassembly  corrupt linked list pointers · Trigger mirror writes  corrupt a function pointer
XML tag data "confused" dangling pointer session frag replacement frag

Robin Hood uses IKEv1 sessions · Blue: separators · Green: hole creation · Orange: targets for mirror writes · Red: confused session reassembled · Brown: replacement frag · Purple: reassembled packet · Grey: overlapping packet

0x2040
feng

0x2040
feng

0x2040

0x2040
feng

0x2040

0x2040

0x2040

0x2040

O

H

H

...

0x6120





Adjacent on the heap

Somewhere else on the heap

Key facts

· We need sess/repl frags in same hole with len(repl) > len(sess)

(gdb) dlchunk 0xad854108 -c 2 -p 0x44

0xad854108 M sz:0x02030 fl:CP alloc_pc:ike_receiver_process_data+0x3ed 0x6262 bb

0xad856138 F sz:0x00010 fl:-P 0x0000 hex(07c8)

(gdb) python print(frag_payload(0xad854108+0x28+0x1c))

struct frag_payload @ 0xad85414c {

next_payload

= 0x0

critical_bit
payload_length id seqno last_frag

= 0x0
= 0x1fe6 = 0x10 = 0x2 = 0x1

(gdb) dlchunk 0xad854108 -c 1 -p 0x44

0xad854108 M sz:0x02040 fl:CP alloc_pc:ike_receiver_process_data+0x3ed 0x6666 ff

(gdb) python print(frag_payload(0xad854108+0x28+0x1c))

struct frag_payload @ 0xad85414c {

next_payload

= 0x0

critical_bit

= 0x0

payload_length = 0x1ff2

id

= 0x20

seqno

= 0x2

last_frag

= 0x1

· We leave a small free chunk behind sess

· Confusion state: IKEv1 frags with different length in same chunk

"confused" session frag replacement frag

feng

sess F feng repl

Key facts (2)

· Overlapping chunk's size dictates max number of mirror writes

0x2040
feng

0x2040

0x2040

overlapping

0x2040
target1

0x2040
target2

0x6120

· For a given session, total accumulated length needs < 0x8000
· XML buffer used by double free primitive is 0x2040 chunk · With 0x2040 chunks, it means maximum 2 mirror writes (see above)

· Solution is to change the granularity and use 0x810 chunks

0x810 0x810

0x2850

0x810 0x810 0x810

overlapping

0x810 0x810

0x48f0 0x810 0x810

Other approaches
1. Having one frag / the reassembled packet in the same chunk
· But when reassembly fails, results in another double-free 
2. XML data is appended with strncat()
· Overwrite first fragment to change its length? · Need a strncat()-friendly character · Can't use very large length due to reassembly incomplete check · But still need to allocate something else anyway to avoid double-free
· Took 2 weeks to build an exploit
· Prior to that, took months to write asatools

Conclusions

Lessons learnt
· Fuzzing just the tags list is enough to find the bug
· Radamsa was useless in our case
· Working exploit on 32-bit (no ASLR/DEP)
· Note: some old 64-bit don't have ASLR either [1] 
· 7-year old bug? ­ AnyConnect Host Scan available since 2011
· Cisco-specific handlers, not libexpat
· IKEv1 frag primitive to overflow memory / create mirror writes
· Confusion state: one chunk used for two different IKEv1 packets
· IKEv1 feng shui useful for any heap-based bug
[1] https://github.com/nccgroup/asafw/blob/master/README.md#mitigation-summary

Next steps
· WebVPN/AnyConnect exploit only (not relying on IKEv1)? · Turn a repeatable free into a memory revelation primitive?
· Bypass ASLR on recent 64-bit? · Something like BENIGNCERTAIN on Cisco IOS [1]?
· XML grammar-based fuzzer to find new 0-day?
· Support for tags, attributes, etc.
[1] https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20160916-ikev1

Protect against 0-day vulnerabilities?

Questions
· Special thanks to
· My colleague Aaron Adams for the help on exploiting this  · Terri Grant from Cisco PSIRT for handling this
· Contact
· @saidelike · cedric(dot)halbronn(at)nccgroup(dot)trust

