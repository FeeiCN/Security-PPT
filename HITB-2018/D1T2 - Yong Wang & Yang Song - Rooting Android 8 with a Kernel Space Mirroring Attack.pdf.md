Mirror Mirror: Rooting Android 8 with a Kernel Space Mirroring Attack
WANG, YONG(@ThomasKing2014) Pandora Lab of Ali Security

Who am I

· WANG, YONG a.k.a. ThomasKing(@ThomasKing2014) · Security Engineer in Pandora Lab of Ali Security, Alibaba Group · Focus on Security Research of Android · Android vulnerability hunting and exploitation since 2015

HITB2018AMS

Pandora Lab of Ali security

Agenda
· Present Situation · YUV exploitation for Mediaserver · ReVent Rooting Solution · Kernel Space Mirroring Attack ­ KSMA · Conclusion
HITB2018AMS

Pandora Lab of Ali security

Agenda
· Present Situation · YUV exploitation for Mediaserver · ReVent Rooting Solution · Kernel Space Mirroring Attack ­ KSMA · Conclusion
HITB2018AMS

Pandora Lab of Ali security

Two ways
· Memory corruption vulnerabilities in drivers
· Lots of vulnerabilities (Android Bulletin) · Need to comprise an associated privileged process first · Fewer vulnerabilities in universal drivers (Binder, etc.)
· Memory corruption vulnerabilities in generic syscall
· Attractive · Not easy to discover a vulnerability

HITB2018AMS

Pandora Lab of Ali security

Privileged processes
· Fewer vulnerabilities
· Systemserver
· Capabilities per process
· Mediaserver
· More strict SELinux policies · ROP/JOP due to "EXEC_MEM" policy
· All daemons

Android 6

Android 7

HITB2018AMS

Pandora Lab of Ali security

Attack surface reduction
· Remove default access to debug features
· Perf subsystem
· Restrict app access to ioctl commands
· A small whitelist for Applications
· SECCOMP filter in Android 8
· Restrict the syscalls (add_key)
HITB2018AMS

Pandora Lab of Ali security

New mitigations in Android 8
· Privileged Access Never (PAN)
· No longer redirect a kernel pointer to user space
· Kernel Address Space Layout Randomization(kernel 4.4 and newer)
· Need to leak the kernel slide
· Post-init read-only memory
· Fewer kernel pointers can be overwritten
· Hardened usercopy
· Fewer vulnerabilities in drivers

HITB2018AMS

Pandora Lab of Ali security

Agenda
· Present Situation · YUV exploitation for Mediaserver · ReVent Rooting Solution · Kernel Space Mirroring Attack ­ KSMA · Conclusion
HITB2018AMS

Pandora Lab of Ali security

Why Mediaserver
· Android Bulletin 2017-03-01

HITB2018AMS

Pandora Lab of Ali security

Why Mediaserver
· Android Bulletin 2018-03-01

HITB2018AMS

Pandora Lab of Ali security

Android MediaPlayer
MediaPlayerService

MediaExtractor

MP3 Extractor

MPEG4 Extractor

...

MediaCodec OMX Codecs

AAC Codec

HEVC Codec

...

HITB2018AMS

Pandora Lab of Ali security

Hevc crash
· Weichao Sun(@sunblate), member of Pandora Lab

HITB2018AMS

Pandora Lab of Ali security

Hevc crash
HITB2018AMS

Pandora Lab of Ali security

CVE-2017-13277
· Android Bulletin 2018-04-01

HITB2018AMS

Pandora Lab of Ali security

Vulnerability analysis

HITB2018AMS

Pandora Lab of Ali security

Vulnerability analysis
HITB2018AMS

· i4_disp_wd · num_rows · num_cols · i4_disp_strd · i4_strd
Pandora Lab of Ali security

Vulnerability analysis
· i4_disp_strd
· mp4_width
· i4_strd
· mp4_height + PAD(0xa0)
· i4_disp_wd
· H.265 Sequence Parameter Set · sps->pic_width_in_luma_samples
· num_cols
· sps->pic_width_in_luma_samples
· num_rows
· sps->pic_height_in_luma_samples
HITB2018AMS

Pandora Lab of Ali security

Vulnerability analysis

HITB2018AMS

Pandora Lab of Ali security

Vulnerability analysis
· `0x80808080'
· luma and chroma buffers are filled with `0x80'
· Control PC register
· Skip the stack guard page · Overwrite some metadata in the thread stack
Output buffer Decoding thread
HITB2018AMS

Pandora Lab of Ali security

Pthread_internal_t

HITB2018AMS

Avoid `stack_guard_check'
Pandora Lab of Ali security

Memory layout

Output buffer Controllable length

Guard page 0x1000

Thread stack 0xfe000

Y

UV

pthread_internal_t

offset

number

Y

0

pic_h

U

size_Y

pic_h / 2

V

size_Y + size_UV

pic_h / 2

size_Y = m4_h * m4_w m4_w --- mp4_width

size_UV = size_Y / 4

m4_h --- mp4_height

size

interval

pic_w

m4_w

pic_w / 2

m4_w / 2

pic_w / 2

m4_w / 2

pic_h --- pic_height_in_luma_samples

pic_w --- pic_width_in_luma_samples

HITB2018AMS

Pandora Lab of Ali security

Y channel

Overwrite cleanup_stack pointer:

Cleanup_offset = buffer_size + 0x1000 + 0xfe000 ­ 0x1000 + 0x940 Cleanup_offset = mp4_width * (pic_height ­ 1)
Skip guard page:

mp4_width * i + pic_width < buffer_size OR mp4_width * i >= buffer_size + 0x1000

0 <= i < pic_height

Output buffer

Y HITB2018AMS

UV

Guard page

Thread stack

Y pthread_internal_t U V
Pandora Lab of Ali security

U channel

Overwrite cleanup_stack pointer:

Cleanup_offset = buffer_size + 0x1000 + 0xfe000 ­ 0x1000 + 0x940 Cleanup_offset = mp4_width * (pic_height ­ 1)
Skip guard page:

mp4_width * i + pic_width < buffer_size OR mp4_width * i >= buffer_size + 0x1000

0 <= i < pic_height

size_Y + (mp4_width / 2) * (pic_height / 2 - 1) + pic_width / 2 < buffer_size

Output buffer

Guard page

Thread stack

Y HITB2018AMS

UV

Y pthread_internal_t U V
Pandora Lab of Ali security

V channel

Overwrite cleanup_stack pointer:

Cleanup_offset = buffer_size + 0x1000 + 0xfe000 ­ 0x1000 + 0x940 Cleanup_offset = mp4_width * (pic_height ­ 1)
Skip guard page:

mp4_width * i + pic_width < buffer_size OR mp4_width * i >= buffer_size + 0x1000

0 <= i < pic_height

size_Y + (mp4_width / 2) * (pic_height / 2 - 1) + pic_width / 2 < buffer_size

size_Y + size_UV + size(mp4_width / 2) * (pic_height / 2 - 1) + pic_width / 2 < buffer_size

Output buffer

Guard page

Thread stack

Y HITB2018AMS

UV

Y pthread_internal_t U V
Pandora Lab of Ali security

Available combinations
· output_buffer: DA000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 108 · output_buffer: 14D000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 148 · output_buffer: 1C0000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 188 · output_buffer: 233000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 1C8 · output_buffer: 2A6000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 208 · output_buffer: 319000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 248 · output_buffer: 38C000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 288 · output_buffer: 3FF000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 2C8 · output_buffer: 472000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 308 · output_buffer: 4E5000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 348 · output_buffer: 558000, mp4_width: 1cc0, mp4_height: 20, pic_width: 20, pic_height: 388 ·...

HITB2018AMS

Pandora Lab of Ali security

Ideal memory layout
Input buffer Output buffer Decoding thread

0x80808080

HITB2018AMS

Pandora Lab of Ali security

Hijack the thread
· pthread_internal_t
HITB2018AMS

Pandora Lab of Ali security

Hijack the thread

HITB2018AMS

Pandora Lab of Ali security

Control PC register

HITB2018AMS

Pandora Lab of Ali security

SECCOMP sandbox

HITB2018AMS

Pandora Lab of Ali security

Escape the sandbox

HITB2018AMS

Pandora Lab of Ali security

Escape the sandbox

HITB2018AMS

Pandora Lab of Ali security

Escape the sandbox
HITB2018AMS

Mediaserver
Pandora Lab of Ali security

Demo
HITB2018AMS

Pandora Lab of Ali security

Next steps for rooting
· The beginning of another hard work
· CANNOT allocate RWX memory
· "EXEC_MEM" policy
· Convert the exploitation into "ROP" gadgets
· Many gaaaaaadgets are required
· Few drivers can be accessed
· Few vulnerabilities
HITB2018AMS

Pandora Lab of Ali security

Agenda
· Present Situation · YUV exploitation for Mediaserver · ReVent Rooting Solution · Kernel Space Mirroring Attack ­ KSMA · Conclusion
HITB2018AMS

Pandora Lab of Ali security

CVE-2017-7533
· Discovered as a bug by Leilei Lin · Exploitation for Android unknown by that time
· Shipped with kernel 3.18 ­ 4.4 · 64-bit devices
· Use-After-Free due to race condition
· Overwrite the next slab object with non-zero bytes · ReVent ­ [Re]name & E[vent]

HITB2018AMS

Pandora Lab of Ali security

Vulnerability analysis
· Monitor one file with actions(IN_ACCESS)
· inotify_init · inotify_add_watch
· When triggered:
· Calculate file name's length · Allocate a buffer for notification event · Copy file name to event buffer
· But the file can be renamed!

HITB2018AMS

Pandora Lab of Ali security

Vulnerability analysis
Thread-1
strlen(file_name)
kmalloc(alloc_len, GFP_KERNEL);
strcpy(event->name, file_name);

Thread-2
kfree_rcu(old_name, u.head); add_key("spray", payload, 0, 0, 0);

Heap overflow

HITB2018AMS

Pandora Lab of Ali security

Vulnerability analysis

Kmalloc-256

200

freed

...

freed

freed

...

200

200

...

249

freed

...

freed

200

...

249

freed

...

256

200

...

249

freed

...

256

200

...

44

freed

...

AAAA... T1: trigger

event

T1: kmalloc

BBBB... T2: rename

Non-zero T2: spray

Overflow T1: strcpy

HITB2018AMS

Pandora Lab of Ali security

Two main problems
· Victim object
· Kernel pointer in the head · Immunity to `\0' side effect
· Heap Fengshui
· Name/Event/Payload/Victim object · Victim object should be next to event
HITB2018AMS

Pandora Lab of Ali security

Pipe subsystem
· Time Of Check To Time Of Use
· The value and time are controllable when reading/writing

HITB2018AMS

Pandora Lab of Ali security

Pipe subsystem
· Time Of Check To Time Of Use
· The value and time are controllable when reading/writing
· readv/writev a pipe file
· Allocate, import iovecs and check boundary

HITB2018AMS

Pandora Lab of Ali security

Pipe subsystem
· Time Of Check To Time Of Use
· The value and time are controllable when reading/writing
· readv/writev a pipe file
· Allocate, import iovecs and check boundary · Invoke pipe_read/write callback · No data/space blocking in callback

HITB2018AMS

Pandora Lab of Ali security

Pipe subsystem
· Time Of Check To Time Of Use
· The value and time are controllable when reading/writing
· readv/writev a pipe file
· Allocate, import iovecs and check boundary · Invoke pipe_read/write callback · No data/space blocking in callback · No other boundary check

HITB2018AMS

Pandora Lab of Ali security

Pipe subsystem

· Time Of Check To Time Of Use
· The value and time are controllable when reading/writing

· readv/writev a pipe file

· Allocate, import iovecs and check boundary

· Invoke pipe_read/write callback

· No data/space blocking in callback · No other boundary check

User_addr Iov_len=8

...

iov_len=8

· IOVECs - ideal victim object

· Gain almost arbitrary R/W

Kernel_addr Iov_len=8

...

iov_len=8

HITB2018AMS

Pandora Lab of Ali security

Limitations
· Target kernel address may contain '0' bytes
· 0xFFFFFFC000D0E1CC · kernel data contains ideal callback pointers
· Spawn lots of threads
· The reading/writing threads block in callback function

HITB2018AMS

Pandora Lab of Ali security

Ideal heap layout

Kmalloc-256

1

freed

freed

freed

...

freed

freed

...

2

iovs

iovs

iovs

...

iovs

iovs

...

3

freed-iovs

iovs

freed-iovs

...

freed-iovs

iovs

...

4

name

iovs

freed-iovs

...

event

iovs

...

5

payload

iovs

name

...

event

iovs

...

6

payload

iovs

name

...

iovs

...

HITB2018AMS

Pandora Lab of Ali security

Shape the heap

· Many `hole's in the heap

freed

Obj-A

Obj-B

freed

freed

Obj-C

...

· Fill with events
· Full list

Event-1

Obj-A

Obj-B

Event-2 Event-3

Obj-C

...

· New empty list

freed

freed

freed

freed

freed

freed

...

HITB2018AMS

Pandora Lab of Ali security

Merge or not
· Freed buffer holes
· Trigger notifications with different actions · Not merge
· Freed-iovec buffers are not enough
· Trigger notifications with a same action · Merge
HITB2018AMS

Pandora Lab of Ali security

Bypassing PXN

ptmx_fops

Kernel space check_flags

0x40002000 0x40002028
0x40002048

0x40002000 kernel_sock_ioctl_end
User space

HITB2018AMS

Pandora Lab of Ali security

Android 7 devices
· Exploitation steps
· Step 0: Prepare resources and fill the buffer holes · Step 1: Spawn reading threads and shape the heap with iovec objects · Step 2: Spawn race threads · Step 3: Win the race
· fcntl(ptmx_fd, F_SETFL, 0x40002000) == 0x40002000
· Step 4: Overwrite uid, disable SELinux and spawn a ROOT shell

HITB2018AMS

Pandora Lab of Ali security

Android 8 devices
· Kernel Address Space Layout Randomization
· kernel 4.4 (Pixel 2)
· Privileged Access Never
· ARMv8.0 - Emulated · ARMv8.1 - Hardware feature

HITB2018AMS

Pandora Lab of Ali security

Bypassing KASLR
· Use objects instead of payload data
· Kernel func/data pointer at the offset 16 · No overflow · No such object 

Object-x Object-x

name

...

Object-x

...

HITB2018AMS

Pandora Lab of Ali security

Bypassing KASLR
· After a few days...
· `inode' field is at the offset 0x10 of event · `inode's are allocated in another heap

HITB2018AMS

Pandora Lab of Ali security

Bypassing KASLR
· After a few days...
· `inode' field is at the offset 0x10 of event · `inode's are allocated in another heap · `i_op' callback ­ kernel data pointer
· Kernel slide:
· Stage1: leak the address of a inode · Stage2: read `i_op' of this inode
HITB2018AMS

Pandora Lab of Ali security

PAN mitigation

ptmx_fops

Kernel space check_flags

kernel_sock_ioctl

0x40002000 0x40002028
0x40002048

0x40002000 kernel_sock_ioctl_end
User space

HITB2018AMS

Pandora Lab of Ali security

PXN and PAN
· Construct another ROP/JOP chain
· X0 is fully controllable · Writing additional payload for chain increases the crash rate
· CVE-2017-13164 (Discovered by me in 2016, fixed in Dec 2017)
· Born with Binder · Leak a kernel address filled with any payload reliably(< 4K)
· Goal
· Only a vulnerability · No ROP/JOP chain · Bypassing PXN and PAN

HITB2018AMS

Pandora Lab of Ali security

Agenda
· Present Situation · YUV exploitation for Mediaserver · ReVent Rooting Solution · Kernel Space Mirroring Attack ­ KSMA · Conclusion
HITB2018AMS

Pandora Lab of Ali security

Linux Page Table layout

Offset within Process PGD

Offset within PMD Page Frame

Offset within PTE Page Frame

Offset within Data Frame

pte_offset()

pte_t

pmd_offset()

pmd_t

Page Frame

pgd_offset()

pgd_t

mm_struct->pgd
HITB2018AMS

Pandora Lab of Ali security

ARMv8-64 address translation
· For Android
· 4KB granule · 39-bit (512GB) · Three levels
· TTBRx
· TTBR0 - user address
· Up to 0x0000_007F_FFFF_FFFF
· TTBR1 - kernel address
· Start from 0xFFFF_FF80_0000_0000
HITB2018AMS

Pandora Lab of Ali security

Descriptor formats
· ARMv8-64 level 0, level 1, and level 2 descriptor formats

HITB2018AMS

Pandora Lab of Ali security

Descriptor formats
· ARMv8-64 level 3 descriptor format

HITB2018AMS

Pandora Lab of Ali security

General view of address translation

No level 0 table for Android HITB2018AMS

Pandora Lab of Ali security

Attribute fields for RWX
· UXN or XN (Exception Level 0 & 1)
· Not executable in same translation regime
· PXN
· Not executable at EL1
· AP[2:1]
· Data Access Permissions
HITB2018AMS

Pandora Lab of Ali security

Data access permission
· `00'
· Kernel data region
· `10'
· Kernel text region
· `01' and `11'
· Seem useless because of PAN
· `01'
· A way to read/write the kernel virtual address
· Easy way to bypass PXN and PAN!
· Never appeared
HITB2018AMS

Pandora Lab of Ali security

Craft `01' combination
· Modify AP[2:1] attributes of a kernel address
· Look up each level of page table · Find the address of the associated page table entry · Set `01' combination
· Walk the page table
· Ability of arbitrary kernel memory reading/overwriting required
· Do you really need to walk the page table?

HITB2018AMS

Pandora Lab of Ali security

Principle of KSMA

Start of 1GB region
FFFFFFFFC0000000
FFFFFFC240000000 FFFFFFC200000000 FFFFFFC1C0000000 FFFFFFC180000000 FFFFFFC140000000
FFFFFFC080000000 FFFFFFC040000000 FFFFFFC000000000
FFFFFF8000000000

Level 1 table
0 ... 0 0 0 0 0 ... D_Table D_Table D_Table ... 0

HITB2018AMS

Text and Data Freed Pages

Freed Pages

Physical memory (3GB)

Pandora Lab of Ali security

Principle of KSMA

Start of 1GB region
FFFFFFFFC0000000
FFFFFFC240000000 FFFFFFC200000000 FFFFFFC1C0000000 FFFFFFC180000000 FFFFFFC140000000
FFFFFFC080000000 FFFFFFC040000000 FFFFFFC000000000
FFFFFF8000000000

Level 1 table
0 ... 0 D_Block 0 0 0 ... D_Table D_Table D_Table ... 0

FFFFFFC230002000

AP[2:1] = `01'

R/W from EL0 & EL1, break kernel isolation

PA: 30002000
Text and Data Freed Pages

Freed Pages

Physical memory (3GB)

R/W from EL1
FFFFFFC030002000

HITB2018AMS

Pandora Lab of Ali security

KSMA without KASLR
· Where to add a special block descriptor
· swapper_pg_dir is the pgd for the kernel
· Kernel mirroring base
· Entry address
· swapper_pg_dir + (Kernel_Mirroring_Base / 1G) * 8
· Kaddr to Mirroring Kaddr
· Mirroring_kaddr = Kernel_Mirroring_Base + (kaddr - PAGE_OFFSET)

HITB2018AMS

Pandora Lab of Ali security

KSMA with KASLR
· Where to add a special block descriptor
· swapper_pg_dir is the pgd for the kernel
· Kernel mirroring base
· Entry address
· (swapper_pg_dir + kernel_slide) + (Kernel_Mirroring_Base / 1G) * 8
· Kaddr to Mirroring Kaddr
· Mirroring_kaddr = Kernel_Mirroring_Base + (kaddr - PAGE_OFFSET)

HITB2018AMS

Pandora Lab of Ali security

ReVent with KSMA
· Exploitation for Android 8(with KASLR)
· Stage 1-2: Leak kernel heap and data pointers, calculate the kernel slide · Stage 3:
· Step1: Prepare a special block descriptor · Step2: Calculate the entry address (No `0' bytes) · Step3: Spawn race threads and win the race · Step4: Disable SELinux
· Write `0' to the mirroring addresses of `selinux_enable' and `selinux_enforcing'
· Step5: Patch a syscall
· Write shellcode to the mirroring address
· Step6: Invoke the syscall and spawn a ROOT shell
· Bypassing PXN and PAN · Bypassing `post-init read-only memory' constraint

HITB2018AMS

Pandora Lab of Ali security

Access kernel from EL0

HITB2018AMS

Pandora Lab of Ali security

KSMA for ARMv7a
· Section descriptor
· Block descriptor of ARMv8a
· AP[2:1] = `01'
HITB2018AMS

Pandora Lab of Ali security

Rooting Android 8 Demo
Google Pixel 2 XL

HITB2018AMS

Pandora Lab of Ali security

Agenda
· Present Situation · YUV exploitation for Mediaserver · ReVent Rooting Solution · Kernel Space Mirroring Attack ­ KSMA · Conclusion
HITB2018AMS

Pandora Lab of Ali security

Takeaways
· A YUV exploitation for Mediaserver is detailed. The ideas of exploitations are fresh and awesome.
· A new reliable root exploitation technique KSMA is introduced, which can break Android kernel isolation and bypass both PXN and PAN mitigations of Android 8.
· Nowadays, rooting large numbers of newest Android devices with a single vulnerability is becoming more and more difficult and challenging, but it is still possible.

HITB2018AMS

Pandora Lab of Ali security

References
· Your Move: Vulnerability Exploitation and Mitigation in Android · Protecting Android with more Linux kernel defenses · Seccomp filter in Android O · Hardening the Kernel in Android Oreo · Fuzzing Android: a recipe for uncovering vulnerabilities inside system components in Android(BlackHat eu-15) · https://source.android.com/security/bulletin/2017-03-01 · https://source.android.com/security/bulletin/2018-03-01 · https://source.android.com/security/bulletin/2018-04-01 · CVE-2017-7533 · http://seclists.org/oss-sec/2017/q3/240 · https://www.kernel.org/doc/gorman/html/understand/understand006.html · ARM® Architecture Reference Manual(ARMv8, for ARMv8-A architecture profile) · ret2dir: Rethinking Kernel Isola6on (USENIX 14') · ARM® Architecture Reference Manual(ARMv7-A and ARMv7-R edition)

HITB2018AMS

Pandora Lab of Ali security

Thank You
WANG, YONG a.k.a. ThomasKing(@ThomasKing2014)

