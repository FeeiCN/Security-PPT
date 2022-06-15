Virtunoid: Breaking out of KVM
Nelson Elhage
Black Hat USA 2011
July 27, 2011

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 1 / 42

Outline

1 KVM: Architecture overview Attack Surface
2 CVE-2011-1751: The bug
3 virtunoid.c: The exploit %rip control Getting to shellcode Bypassing ASLR
4 Conclusions and further research
5 Demo

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 2 / 42

KVM: Architecture overview
KVM: The components
kvm.ko kvm-intel.ko / kvm-amd.ko qemu-kvm

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 3 / 42

kvm.ko

KVM: Architecture overview

The core KVM kernel module Provides ioctls for communicating with the kernel module. Primarily responsible for emulating the virtual CPU and MMU Emulates a few devices in-kernel for efficiency. Contains an emulator for a subset of x86 used in handling certain traps (!)

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 4 / 42

KVM: Architecture overview
kvm-intel.ko / kvm-amd.ko
Provides support for Intel's VMX and AMD's SVM virtualization extensions. Relatively small compared to the rest of KVM (one .c file each)

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 5 / 42

qemu-kvm

KVM: Architecture overview

Provides the most direct user interface to KVM. Based on the classic qemu x86 emulator. Implements the bulk of the virtual devices a VM uses. Implements a wide variety of possible devices and buses. An order of magnitude more code than the kernel module.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 6 / 42

Control flow

KVM: Architecture overview

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 7 / 42

kvm.ko

KVM: Architecture overview Attack Surface

A tempting target ­ successful exploitation gets ring0 on the host without further escalation.
Much less code than qemu-kvm, and much of that is dedicated to interfacing with qemu-kvm, not the guest directly. The x86 emulator is an interesting target.
A number of bugs have been discovered allowing privesc within the guest. A lot of tricky code that is not often exercised. Not the target of this talk, but I have some ideas for future work.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 8 / 42

qemu-kvm

KVM: Architecture overview Attack Surface

A veritable goldmine of targets.
Hundreds of thousands of lines of device emulation code.
Emulated devices communicate directly with the guest via MMIO or IO ports, lots of attack surface.
Much of the code comes straight from qemu and is ancient. qemu-kvm is often sandboxed using SELinux or similar, meaning that successful exploitation will often require a second privesc within the host.
(Fortunately, Linux never has any of those)
Lots of bugs have been found here.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 9 / 42

CVE-2011-1751: The bug
RHSA-2011:0534-1
"It was found that the PIIX4 Power Management emulation layer in qemu-kvm did not properly check for hot plug eligibility during device removals. A privileged guest user could use this flaw to crash the guest or,
possibly, execute arbitrary code on the host. (CVE-2011-1751)"

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 10 / 42

CVE-2011-1751: The bug

d i f f --g i t a /hw/ a c p i p i i x 4 . c b/hw/ a c p i p i i x 4 . c

index 96 f5222 . . 6 c908ff 100644

--- a /hw/ a c p i p i i x 4 . c

+++ b/hw/ a c p i p i i x 4 . c

@@ -471 ,11 +471 ,13 @@ s t a t i c v o i d p c i e j w r i t e ( v o i d * opaque , u i n t 3 2 t addr , u i n t 3 2 t v a l )

BusState *bus = opaque ;

DeviceState *qdev , *next ;

PCIDevice *dev ;

+

PCIDeviceInfo *info ;

int slot = ffs ( val ) - 1;

QLIST FOREACH SAFE ( qdev , &bus->c h i l d r e n , s i b l i n g , n e x t ) {

d e v = DO UPCAST( P C I D e v i c e , qdev , qdev ) ;

-

i f ( PCI SLOT ( dev->d e v f n ) == s l o t ) {

+

i n f o = c o n t a i n e r o f ( qdev->i n f o , P C I D e v i c e I n f o , qdev ) ;

+

i f ( PCI SLOT ( dev->d e v f n ) == s l o t && ! i n f o ->n o h o t p l u g ) {

qdev free ( qdev );

}

}

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 11 / 42

PIIX4

CVE-2011-1751: The bug

The PIIX4 was a Southbridge chip used in many circa-2000 Intel chipsets.
The default southbridge emulated by qemu-kvm Includes ACPI support, a PCI-ISA bridge, an embedded MC146818 RTC, and much more.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 12 / 42

CVE-2011-1751: The bug
Device Hotplug
The PIIX4 supports PCI hotplug, implemented by writing values to IO port 0xae08. qemu-kvm emulates this by calling qdev_free(qdev);, which is supposed to make sure the device is properly disconnected. Certain devices don't properly support being hotplugged, but KVM previously didn't check this before freeing them.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 13 / 42

CVE-2011-1751: The bug
The PCI-ISA bridge
In particular, it should not be possible to unplug the ISA bridge. Among other things, the emulated MC146818 RTC hangs off the ISA bridge. KVM's emulated RTC is not designed to be unplugged; In particular, it leaves around dangling QEMUTimer objects when unplugged.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 14 / 42

CVE-2011-1751: The bug
The real-time clock
typedef s t r u c t RTCState { uint8 t cmos data [128]; ... /* second update */ int64 t next second time ; ... QEMUTimer * s e c o n d t i m e r ; QEMUTimer * s e c o n d t i m e r 2 ;
} RTCState ;

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 15 / 42

CVE-2011-1751: The bug
The real-time clock
s t a t i c int r t c i n i t f n ( ISADevice *dev )
{
RTCState * s = DO UPCAST( RTCState , dev , de v ) ;
... s->s e c o n d t i m e r = q e m u n e w t i m e r n s ( r t c c l o c k , r t c u p d a t e s e c o n d , s ) ; s->s e c o n d t i m e r 2 = q e m u n e w t i m e r n s ( r t c c l o c k , r t c u p d a t e s e c o n d 2 , s ) ; s->n e x t s e c o n d t i m e =
qemu get clock ns ( rtc clock ) + ( get ticks per sec () * 99) / 100;
q e m u m o d ti me r ( s->s e c o n d t i m e r 2 , s->n e x t s e c o n d t i m e ) ; ... }

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 16 / 42

QEMUTimer

CVE-2011-1751: The bug

s t r u c t QEMUTimer { QEMUClock * c l o c k ; i n t 6 4 t expire time ; /* in nanoseconds */ QEMUTimerCB * cb ; void *opaque ; s t r u c t QEMUTimer * n e x t ;
};

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 17 / 42

RTC timers

CVE-2011-1751: The bug

Update in progress 1s 1.1s
rtc_update_second2 (s->second_timer2) rtc_update_second (s->second_timer)

Update in progress 2s 2.1s
Time

rtc_update_second2

(s->second_timer2)

...

rtc_update_second

(s->second_timer)

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 18 / 42

Use-after-free

CVE-2011-1751: The bug

Unplugging the virtual RTC free()s the RTCState It doesn't free() or unregister either of the timers. So we're left with dangling pointers from the QEMUTimers

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 19 / 42

virtunoid.c: The exploit
1 KVM: Architecture overview Attack Surface
2 CVE-2011-1751: The bug
3 virtunoid.c: The exploit %rip control Getting to shellcode Bypassing ASLR
4 Conclusions and further research
5 Demo

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 20 / 42

virtunoid.c: The exploit %rip control
High-level TODO
Inject a controlled QEMUTimer into qemu-kvm at a known address Eject the emulated ISA bridge Force an allocation into the freed RTCState, with second_timer pointing at our dummy timer.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 21 / 42

Injecting data

virtunoid.c: The exploit %rip control

The guest's RAM is backed by a simple mmap()ed region inside the qemu-kvm process.
So we allocate an object in the guest, and compute
hva = physmem_base + (gva_to_gfn(gva) << PAGE_SHIFT) + page_offset(hva) hva host virtual address gva guest virtual address gfn guest frame (physical page) number
For now, assume we can guess physmem_base (e.g. no ASLR)

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 22 / 42

virtunoid.c: The exploit %rip control
fs/proc/task_mmu.c

/*

* / proc / pid /pagemap - an array mapping v i r t u a l pages to pfns

*

* For each page in the address space , this f i l e contains

* one 64- b i t e n t r y c o n s i s t i n g o f t h e f o l l o w i n g :

*

* B i t s 0-55 page f r a m e number (PFN) i f p r e s e n t

* B i t s 0-4 swap t y p e i f swapped

* B i t s 5-55 swap o f f s e t i f swapped

* B i t s 55-60 page s h i f t ( page s i z e = 1<<page s h i f t )

* Bit 61

reserved for future use

* Bit 62

page swapped

* Bit 63

page present

*/

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 23 / 42

virtunoid.c: The exploit %rip control
qemu-kvm userspace network stack
qemu-kvm contains a user-mode networking stack. Implements a DHCP server, DNS server, and a gateway NAT. The user-mode stack normally handles packets synchronously. To prevent recursion, if a second packet is emitted while handling a first packet, the second packet is queued, using malloc(). The virtual network gateway responds to ICMP ping.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 24 / 42

virtunoid.c: The exploit %rip control
Putting it all together
1 Allocate a fake QEMUTimer Point ->cb at the desired %rip. Set ->expire to something small (e.g. 0).
2 Calculate its address in the host. 3 Write 2 to IO port 0xae08 to eject the ISA bridge. 4 ping the emulated gateway with ICMP packets containing pointers to
your allocated timer in the host.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 25 / 42

virtunoid.c: The exploit Getting to shellcode
We've got %rip, now what?
Options: Get EIP = 0x41414141 and declare victory. Disable NX in my BIOS and call it good enough for a demo. Do a ROP pivot, ROP to victory. ????

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 26 / 42

virtunoid.c: The exploit Getting to shellcode
Another look at QEMUTimer
s t r u c t QEMUTimer { ... s t r u c t QEMUTimer * n e x t ; ...
};

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 27 / 42

virtunoid.c: The exploit Getting to shellcode
qemu_run_timers

s t a t i c v o i d q e m u r u n t i m e r s ( QEMUClock * c l o c k ) {
QEMUTimer ** p t i m e r h e a d , * t s ; int64 t current time ;

current time = qemu get clock ns ( clock ); p t i m e r h e a d = &a c t i v e t i m e r s [ c l o c k ->t y p e ] ; for (;;) {
ts = *ptimer head ; i f (! qemu timer expired ns ( ts , current time ))
break ; * p t i m e r h e a d = t s ->n e x t ; t s ->n e x t = NULL ;

t s ->cb ( t s ->opaque ) ; } }

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 28 / 42

Timer chains

virtunoid.c: The exploit Getting to shellcode

We don't just control %rip ­ we control a QEMUTimer object that is going to get dispatched by qemu_run_timers. In particular, we can control ->next. So we can chain fake timers, and make multiple one-argument calls in a row.
We can fake other structs to get the first argument.
qemu_run_timers doesn't touch %rsi in any version of qemu-kvm I've examined.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 29 / 42

virtunoid.c: The exploit Getting to shellcode
Getting to mprotect
Find a function ("F") that makes a three-arg function call based on struct(s) passed as arguments one and two. Construct appropriate fake structures. Construct a timer chain that
Does a call to set up %rsi based on a first argument in %rdi. Does a call to F that mprotect()s one or more pages in the guest physmem map. Calls shellcode stored in those pages.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 30 / 42

virtunoid.c: The exploit Getting to shellcode
Why this trickery?
Continued execution is dead simple. Reduced dependence on details of compiled code. I'm not that good at ROP :)

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 31 / 42

Addresses

virtunoid.c: The exploit Bypassing ASLR

We need at least two addresses
The base address of the qemu-kvm binary, to find code addresses. physmem_base, the address of the physical memory mapping inside qemu-kvm.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 32 / 42

Option A

virtunoid.c: The exploit Bypassing ASLR

Find an information leak.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 33 / 42

Option B

virtunoid.c: The exploit Bypassing ASLR

Assume non-PIE, and be clever.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 34 / 42

fw_cfg

virtunoid.c: The exploit Bypassing ASLR

Emulated IO ports 0x510 (address) and 0x511 (data) Used to communicate various tables to the qemu BIOS (e820 map, ACPI tables, etc) Also provides support for exporting writable tables to the BIOS. However, fw_cfg_write doesn't check if the target table is supposed to be writable!

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 35 / 42

hw/pc.c

virtunoid.c: The exploit Bypassing ASLR

static struct e820 table e820 table ; s t r u c t h p e t f w c o n f i g h p e t c f g = { . c o u n t = UINT8 MAX } ;
...
static void *bochs bios init ( void )
{ ... f w c f g = f w c f g i n i t ( BIOS CFG IOPORT , BIOS CFG IOPORT + 1 , 0 , 0 ) ;
f w c f g a d d b y t e s ( f w c f g , FW CFG E820 TABLE , ( u i n t 8 t *)& e 8 2 0 t a b l e ,
sizeof ( struct e820 table ));
f w c f g a d d b y t e s ( f w c f g , FW CFG HPET , ( u i n t 8 t *)& h p e t c f g ,
sizeof ( struct hpet fw config )); ... }

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 36 / 42

virtunoid.c: The exploit Bypassing ASLR
read4 your way to victory
Net result: nearly 500 writable bytes inside a static variable. mprotect needs a page-aligned address, so these aren't suitable for our shellcode. But, we can construct fake timer chains in this space to build a read4() primitive. Use that to find physmem_base Proceed as before.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 37 / 42

virtunoid.c: The exploit Bypassing ASLR
Repeated timer chaining
Previously, we ended timer chains with ->next = NULL. Instead, end them with a timer that calls rtc_update_second to reschedule the timer every second. Now we can execute a read4, update structures based on the result, and then hijack the list again.

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 38 / 42

Conclusions and further research
Possible hardening directions
Sandbox qemu-kvm (work underway well before this talk). Build qemu-kvm as PIE. Keep memory in a file in tmpfs and lazily mmap as-needed for DMA? XOR-encode key function pointers? More auditing and fuzzing of qemu-kvm!

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 39 / 42

Conclusions and further research
Future research directions
Fuzzing/auditing kvm.ko (That x86 emulator sketches me) Fingerprinting qemu-kvm versions Searching for infoleaks (Rosenbugs?)

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 40 / 42

Demo
It's demo time

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 41 / 42

Demo
Please Remember to Complete Your Feedback Form

Nelson Elhage (Black Hat USA 2011)

Virtunoid: Breaking out of KVM

July 27, 2011 42 / 42

