Mess with the best, die like the rest (mode)

Volodymyr Pikhur @vpikhur

REcon Brussels 2018

1

About
· Been doing RE for more than 15 years · Privately wrote multiple tools for deobfuscation and binary analysis, PE unpackers, software VM disassemblers/decompilers, etc. · Kernel and hypervisor based security exploitation · First time public speaker
· Past 5 years been learning hardware · Starting from basics Firmware, SPI, UART, etc. · Silicon decapsulation, fault injection · Past year+ been working on HW for sidechannel analysis.

Why doing this?
· Learning and a challange. · Hardware and silicon isn't your magic black box. · Sony has no bug bounties. · I've been sitting on this for 2 years.

REcon Brussels 2018

3

Why presenting here? FAKE NEWS!

REcon Brussels 2018

4

Agenda

· WebKit exploitation · FreeBSD x86_64 exploitation · Hardware and firmware · Dumping FreeBSD ARM kernel of southbridge · Running user code on ARM · FreeBSD ARM exploitation · Hardware attacks and kernel bootloader extraction · Future research

REcon Brussels 2018

5

Finding WebKit exploit

REcon Brussels 2018

6

Changelog open for all!

REcon Brussels 2018

7

The Hunt for Red October

Use existing exploit CVE-2012-3748

https://www.exploit-db.com/exploits/28081/

REcon Brussels 2018

9

ROP ONLY no RWX memory!

JIT how does it work? (magnets?)

child

WebProcess

JSC-Compiler

IPC

RX JIT Code

RW JIT Code

REcon Brussels 2018

11

· Create RWX JIT shared memory (SHM)
· Create alias of this SHM with RW access
· Map RX JIT SHM using original FD
· Map RW JIT SHM using alias.
· Map RX 0x30000000
· Map RW 0x30100000
· Pthead_create

REcon Brussels 2018

12

RWX without JIT

Start

End

prot maxprot Info

0x000007ff3e4000 - 0x000007ff3e8000 0

3stack guard

0x000007ff3e8000 - 0x000007ff5e8000 3

3 Thread1

0x000007ff5e8000 - 0x000007ff5ec000 0

3stack guard

0x000007ff5ec000 - 0x000007ff7ec000 3

3 Thread2

0x000007ff7ec000 - 0x000007ff7f0000

0

3stack guard

0x000007ff7f0000 - 0x000007ff9f0000

3

3 Thread3

0x000007ff9f0000 - 0x000007ff9f4000

0

3stack guard

0x000007ff9f4000 - 0x000007ffbf4000

3

3 Thread4

0x000007ffdf8000 - 0x000007ffdfc000

0

33

0x000007ffdfc000 - 0x000007ffffc000

3

3main stack

0x000007ffffc000 - 0x00000800000000 5

37

REcon Brussels 2018

13

Privilege escalation

· Kernel
· Syscall exploitation is difficult black box isn't fun  · Maximum what we can get are info leaks in FreeBSD
· Kernel callstack using sysctl KERN_PROC_KSTACK ( requires two threads ) · Pointer leak ( CVE-2014-8476 )
· Services
· Still in their own jail but have more priviledges able to call more syscalls
· Bugs are present but unable to get code exec
· Multiple crashes via IPC

REcon Brussels 2018

14

Kernel code execution
· BadIRET (CVE-2014-9322, CVE-2015-5675) · CVE-2015-5675 ( 2015-08-25 ) · https://www.freebsd.org/security/advisories/FreeBSD-SA15:21.amd64.asc · CVE-2014-9322
· Rafal's excellent guide on this bug
· https://blogs.bromium.com/exploiting-badiret-vulnerability-cve-2014-9322linux-kernel-privilege-escalation/

REcon Brussels 2018

15

FreeBSD PoC

· "This is a POC to reproduce vulnerability. No exploitation here, just simple kernel panic."
· https://www.exploitdb.com/exploits/36266/

REcon Brussels 2018

16

Rafal's IDT pointer redirection

· Rafal's approach
action = &t->sighand->action[sig-1]; action->sa.sa_handler = SIG_DFL; // SIG_DFL = 0
· IDT overwrite
· Overwrite #PF handler address in IDT · IDT[#PF] = 0xFFFFFFFF'XXXXXXXX · IDT[#PF] = 0x00000000'XXXXXXXX
· FreeBSD increment primitive
· td->td_critnest++ · 0xFFFFFFFF + 1 = 0x0

REcon Brussels 2018

17

PoC implementation #SS -> #PF -> pcb_onfault

REcon Brussels 2018

18

BadIRET FreeBSD PoC implementation

REcon Brussels 2018

19

Hardware overview
DDR3

AMD APU

PCIe x4

SB Marvell
SoC

HDD WIFI/BT
BD USB
ETH

GDDR5

SPI FLASH

UART/IO

https://wikidevi.com/wiki/Marvell https://media.ccc.de/v/33c3-7946-console_hacking_2016

REcon Brussels 2018

20

2MB Southbridge FW
30MB AMD x86 FW AMD SP SAMU

SPI Flash Firmware
· Marvell SoC "Aeolia/Belize/Baikal"
· C0000001 (IPL ­ SRAM) aka EMC · C0010001 (KBL ­ DDR3) aka EAP · Torus WIFI/BT · NVS ( config etc. )
· AMD APU
· AES XTS encrypted with per console key · Secure Loader/Kernel/Modules · X86 BIOS/Kernel

HDD structure overview

· 15 GPT partitions
· Encrypted with two sets of keys
· AMD SP
· X86 Services/Modules/GUI C# Mono · Updates
· Southbridge
· User files - 400GB+ UFS2
· User files, Games, Settings, Browser history ;)
· EAP ARM User - 128MB FAT · EAP ARM Kernel - not a FS ( encrypted/signed blob )

REcon Brussels 2018

22

Boot/Power sequence
Marvell SoC

RestMode PCIe Root Complex

BootROM

C0000001 EMC SRAM

C0010001 EAP KBL
DDR3

EAP KERNEL HDD DDR3

EAP USER DDR3

AMD BootROM PCIe Endpoint

REcon Brussels 2018

23

Cold Boot without cooling
· DDR3 memory is directly mapped at 0xfffffe0080000000
· sbram0: <Aeolia DDR3 memory> mem 0x80000000-0xbfffffff at device 20.6 on pci0
· DRAM stays without power for very small period of time during power cycle which is enough that contents of DRAM persist hence an attacker is able to dump it!

REcon Brussels 2018

24

DDR3 Dump Analysis

Exception vectors 0x00000000
Free
L1/L2 Page Tables
Free
Free
Kernel User

Kernel unpacker

0x0FFFFFFF (256MB)

· Kernel · Contiguous · 1:1 mapping · Raw binary no ELF header · No ASLR
· Kernel unpacker · Minimal ELF binary · Custom compression
· User · ASLR on newer FW · HMAC-SHA256 signing >2.xx FW

REcon Brussels 2018

25

DDR3 Dump Analysis

0x00000000
Exception vectors
Free
L1/L2 Page Tables KBL
KBL Stack

· KBL · memset( bootp.kbl, 0, bootp.kbl_size );
· KBL Stack · Stack cookies · Return address to Kernel unpacker · Garbage · No keys! 

Kernel

User

Kernel unpacker

0x0FFFFFFF (256MB)

REcon Brussels 2018

26

Running code on ARM

· No signing required on 1.xx ( HMAC-SHA256 on 2.xx+ )
· Signing key still can be dumped from DRAM using cold boot on newer FW
· Crossbuild FreeBSD to support ARM
· Override some structures and types to match correct size Sony decided default one aren't good enough.
· Mount /eap_vsh and replace binary SceEapCore.elf
· No network and other things  · No RWX · LDSCRIPT
· Inject your payload inside the binary and place hook to spawn new thread!
· We are Root!

REcon Brussels 2018

27

Kernel code exec

· Limited number of syscalls even less than on x86 kernel
· NOT an x86 can't use BadIRET exploit
· No Sony's syscalls like sys_dlclose, sys_namedobj, etc.
· http://cturt.github.io/dlclose-overflow.html · https://fail0verflow.com/blog/2017/ps4-namedobj-exploit/
· Old exploits? I didn't find anything useful. 
· sys_kldload JACKPOT!
· Basic FreeBSD functionality to load kernel modules was left behind! · Load helloworld.ko module -> CRASH! 

REcon Brussels 2018

28

sys_kldload crash root cause analysis

· Bad ELF format?
· Correct kernel version?
· Did Sony change something?
· Trying different binaries gives inconsistent behavior
· Sometimes crashes sometimes not · Load success but no execution!?
· Malloc! ­ kernel uses malloc to allocate memory for kernel modules
· pmap_enter strips X bit and returns RW memory if ( prot & VM_PROT_WRITE )
prot = prot & ~VM_PROT_EXECUTE;

REcon Brussels 2018

29

ROP validation

· To validate that I have working kernel module I had to redirect entry point to executable code inside kernel itself
· BX LR - just return should not crash · Invalid pointer ­ should crash
· DECLARE_MODULE macro
· FreeBSD already points inside of kernel!
· MODULE_METADATA(_md_##name, MDT_MODULE, &data, #name); · SYSINIT(name##module, sub, order, module_register_init, &data);
· PC and R0 control
· void module_register_init(const void *arg)

REcon Brussels 2018

30

Arbitrary kernel code execution

1) Load 1st module
· Patch L1 table to make kernel pages RWX instead RX only
2) Load 2nd module
· patch pmap_enter and allow RWX memory · Conveniently when kernel loads new module it does TLB and cache invalidate · Otherwise if we would try to do write to kernel right after we patch L1 it
would crash so don't do ROP-chain.
3) Load 3rd module
· We able to load kernel module and run own kernel code · PROFIT! (SHOTS!)

REcon Brussels 2018

31

Now what!?
· Co-processor registers
· CP0, CP14, CP15 · CP14 - ARM debug registers available to software
· Data abort handler
· Allows to scan memory and resume if that memory is unavailable
· No other MMIO than what is already referenced in kernel · No 1MB register configuration space https://patchwork.kernel.org/patch/6169481/
· When no paging enabled ARM says it is undefined behavior
· I found hard limit of 256 failed aborts until unrecoverable crash
· Hangs on certain MMIO which requires power cycle manually

REcon Brussels 2018

32

Nothing except ability to run code in kernel

REcon Brussels 2018

33

Hardware specs
· What kernel tells us
· CPU: PJ4C B0 rev 1 (Marvell core) · CPU clock : 500MHz, DDR clock : 800MHz
· http://www.samsung.com/global/business/semiconductor/file/product/D S_K4B2G1646Q-BC_Rev103.pdf
· At least 400MHz

REcon Brussels 2018

34

Hardware attack vectors
· SoC glitch
· Try to glitch when memset is executed to prevent KBL clear
· Requires desoldering A LOT of decoupling capacitors · Unable to make it skip instructions
· DRAM glitch
· Address/Data corruption? · Address aliasing? · Bank Aliasing? · Prevent memory writes?

REcon Brussels 2018

35

DRAM attack vectors
· Address/Data corruption
· Need access to actual physical traces because it is BGA and data is deffirential they are located in inner layers
· No all address pins are exposed due to BGA package · Trying to glitch address pins resulted in `byteswap' instead of address change
· Address aliasing
· Short some pins to make them HIGH e.g A0 and A8 · Same problem pins not exposed · Probably should work on PC when attacking DIMMs

REcon Brussels 2018

36

DRAM attack vectors
· DRAM bank aliasing
· Similar to address aliasing except this time pins are exposed! · Connect e.g. B0 and B3 to make write happen to both · Disconnect when not needed ( when KBL finished decrypting ) · Read out secrets because they were written to both banks · It should work in theory but I couldn't make it working or maybe I didn't try
hard enough 

REcon Brussels 2018

37

DRAM data write prevention
· CKE Must be maintained HIGH throughout read and write accesses.

· CKE pin is exposed because requires pull-up resistor · Not just READ/WRITE also refresh and other commands

· https://twitter.com/vpikhur/status/680899967414763520 (Dec 2015) · Easy to identify the pin on target board with oscilloscope

REcon Brussels 2018

38

Recon mission

· Banana Pi · ARM · DDR3 1GB · Uboot
https://en.wikipedia.org /wiki/Banana_Pi

REcon Brussels 2018

39

Hardware tools

· Oscilloscope
· http://www.dreamsourcelab.com/order.html ($199) · Initially had pretty bad software now it's OKish · Drivers have no digital signature 
· Arduino Uno ($10)
· Signal sensing · Timing delays · Trigger
· MOSFET ($0)
· Connects CKE to GND on trigger to generate glitch

REcon Brussels 2018

40

Glitch setup

DDR3 @800MHz

REcon Brussels 2018

41

Memset glitch vs KBL glitch
· Impossible to guess when exactly it is happening
· HDD creates inconsistent delays · Even SSD doesn't work well enough
· KBL glitch (code injection)
· From main OS x86 using kexploit spray DDR3 memory with MOV PC, 0x3C and at 0x3C offset we place our payload
· Enter rest mode spray will remain in memory · Glitch when KBL gets loaded to gain code execution then dump KBL via UART
our payload

REcon Brussels 2018

42

UART log <= v1.05 FW

UART pinout on motherboard http://jaicrab.org/?&a=Ps4/Tools/UART

REcon Brussels 2018

43

SPI.CS and CKE analysis

REcon Brussels 2018

44

SPI.CS analysis

REcon Brussels 2018

45

Glitch after KBL decryption

KBL decryption end

KBL execution begin

REcon Brussels 2018

46

KBL message glitch debug

REcon Brussels 2018

47

Single instruction injection

REcon Brussels 2018

48

DEMO!

https://youtu.be/sMroXa-zYxk

REcon Brussels 2018

49

Conclusions
· Why it worked?
· I don't now ¯\_()_/¯ · KBL decryption is not in place
· KBL decryption doesn't overwrite itself could be related to KBL image parsing etc.
· CPU cache
· No all transactions were committed · Probably should use uncached memory accesses
· Don't hardcode HMAC and use same HMAC on every platform · Don't trust external memory

REcon Brussels 2018

50

Marvell SoC

· eBay and Ali is your friend.
· Much larger feature size 180nm?
· Would take a lot of time and ROI is unknown.

REcon Brussels 2018

51

AMD APU decapsulation

REcon Brussels 2018

· We need SEM things are really small 28nm!
52

REcon Brussels 2018

IR maybe?
· AMD(TSMC) silicon lacks doping it is susceptible to backside analysis using IR light.
· Laser fault injection is possible!
· Requires sophisticated optical stage.
53

REcon Brussels 2018

54

