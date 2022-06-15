Mark Ermolov Maxim Goryachy
How to Hack a Turned-Off Computer, or Running Unsigned Code in
Intel Management Engine
0

We Are Going To...
· Reveal an Intel ME vulnerability (CVE-2017-5705,6,7) allowing arbitrary code execution
· Emphasize the dangers of such bugs in digitally signed firmware
· Show how we bypassed built-in exploitation mitigations
· Disclose architecture flaws in Intel ME
1

Who is Mark Ermolov
System programmer interested in security aspects of hardware, firmware, and low-level system software. Currently researching inner workings of Intel platforms (PCH, IOSF, iGPU).
@_markel__ mermolov{at}ptsecurity.com
2

Who is Maxim Goryachy
System and embedded developer and security researcher. Interested in cryptography, virtualization technologies, reverse engineering, and hardware.
@h0t_max mgoryachy{at}ptsecurity.com
3

Our Research Team

Maxim Goryachy Mark Ermolov

Tapping into the Core

Intel DCI Secret

Dmitry Sklyarov
4

Intel ME: Flash File System Explained
Intel ME: The Way of the Static Analysis

Agenda
· Intel Management Engine 11 overview · Known public vulnerabilities · Potential attack vectors · Vulnerability · Bypassing mitigation · Possible exploitation vectors · Demo
5

Intel Management Engine 11 Overview
6

Intel ME 11
· Excluding publications such as Dr. Ruan's book [PSTR14], ME is a partially documented Intel technology with proprietary firmware
· Root of trust for multiple security features such as PAVP, PTT and Boot Guard
· Has full access to many Intel hardware devices · Has hardware capabilities for interception of some user
activity · An integral component for all stages of the platform
operating cycle
7

Intel ME 11 Design
· Independent 32-bit processor core (x86) · Running own modified MINIX · Has a built-in Java machine [IMS14] · Interacts with CPU/iGPU/USB/DDR/PCI/... · Works when main CPU is powered down (M3 mode) · Starter code is burned in non-reprogrammable on-
die memory
8

Intel ME 11 ­ Related Technologies
· Intel Active Management Technology · Intel Protected Audio Video Path · Intel Platform Trust Technology · Intel Software Guard Extensions [PSTR14] · Intel Boot Guard · ...
9

Intel ME 11 ­ Related Technologies

SGX

PAVP

ME 11

AMT

Boot Guard
10

PTT fTPM

Known Public Vulnerabilities
11

AMT 1.0
2005
12

Known Public Vulnerabilities

Ring-3 rootkit (Q35) [IRR09]
AMT 6.0

Silent Bob is Silent (CVE-2017-5689) [ASM17]
AMT 11.0

2009 2010
Security evaluation of Intel's Active Management Technology [SMT10]

2015

2017

Known Public Vulnerabilities
· Alexander Tereshkin and Rafal Wojtczuk of Invisible Things Lab: Introducing Ring-3 Rootkits (code execution)
· Vassilios Ververis of the Royal Institute of Technology: Security Evaluation of Intel's Active Management Technology (AMT authentication bypass)
· Dmitriy Evdokimov, Alexander Ermolov, and Maksim Malyutin of Embedi: Silent Bob is Silent (AMT authentication bypass)
13

Over the past 12 years, only one vulnerability allowing execution of arbitrary code on ME has been found!
14

Now we have two of them!
15

Potential attack vectors (ways to impact)
16

How we can impact Intel ME
· Local communication interface (HECI) · Network (vPro only) · IPMI/MCTP · Host memory (UMA) · Firmware SPI layout · Internal file system
17

HECI
· Main interface for communication between host and ME
· Represented as PCI device · Transports dozens of ME service protocols · Undocumented; some protocol formats can be found in
coreboot · MEBx and BIOS use HECI to set up ME · Used by Intel tools for updating and manufacture-line
configuring
18

Network (vPro only)
· ME implements various industry-standard protocols (IP, HTTP, WPA2, KERBEROS)
· Has built-in full-fledged web and VNC servers · Complete platform control is exposed in XML-based
WSMAN protocol · Most functionality is in one large module (AMT)
19

UMA Currently UMA is encrypted by AES with integrity checking via unknown cyclic redundancy code
20

Firmware SPI Layout

· Has complex structure

· We found bugs in parsing procedures of signed

data (not exploitable if you don't have Intel's

private key)

evil

· Firmware code is generally not vulnerable to "evil SPI flash" attack

21

Internal Flash File System (MFS)
Have you attended Intel ME: Flash File System Explained
by Dmitry Sklyarov? ;)
22

Potential attack vectors (which modules?)
23

Access Control Model
· Process is a subject of access control · A process has statically defined access rights
 User and groups identity for file system access  List of allowed hardware resources  List of allowed kernel syscalls
24

Architecture Problems
 A process with permission to create new processes can spawn one more privileged than itself
 Access to some internal devices completely breaks the security model
25

Modules With High Privileges
· "ROM" · RBE · KERNEL · BUP · LOADMGR · PM
26

BUP is very tempting
27

BUP Overview
· First user-mode process · Exists on all platforms · Has access to security-sensitive hardware (e.g.,
DMA controller) · Can create new processes · Performs early platform initialization · Can bypass MFS protection (via SPI controller) · Builds basic configuration for all other processes
28

BUP: More Reasons
· One of the largest modules · Duplicates a lot of other modules' functionality · Processes large amount of configuration data · Interacts with the host via HECI
29

Trace Hub Initialization
void __cdecl bup_init_trace_hub() {
int err; // eax signed int npk_reg_idx; // ebx unsigned int bytes_read; // [esp+0h] [ebp-350h] unsigned int file_size; // [esp+4h] [ebp-34Ch] int si_features[5]; // [esp+8h] [ebp-348h] int ct_data[202]; // [esp+1Ch] [ebp-334h] 808 bytes int cookie; // [esp+344h] [ebp-Ch]
cookie = gRmlbCookie; memset(si_features, 0, 0x14u); bytes_read = 0; file_size = 0; if ( !(getDW_sel(0xBF, 0xE0u) & 0x1000000)
&& !bup_get_si_features(si_features) && !bup_dfs_get_file_size("/home/bup/ct", &file_size) ) { if ( file_size ) {
LOBYTE(err) = bup_dfs_read_file("/home/bup/ct", 0, ct_data, file_size, &bytes_read); npk_reg_idx = 0; if ( !err ) {
while ( npk_reg_idx < HIWORD(ct_data[1]) ) {
if ( HIBYTE(ct_data[2 * npk_reg_idx + 2]) == 1 ) putDW_sel(0xB7, ct_data[2 * npk_reg_idx + 2] & 0xFFFFF, ct_data[2 * npk_reg_idx + 3]);
if ( HIBYTE(ct_data[2 * npk_reg_idx + 2]) == 2 ) putDW_sel(0xBF, ct_data[2 * npk_reg_idx + 2] & 0xFFFFF, ct_data[2 * npk_reg_idx + 3]);
++npk_reg_idx; } bup_switch_tracer(0xB7, 0xBFu); } } } if ( gRmlbCookie != cookie ) sys_fault();
30 }

The Vulnerability
void __cdecl bup_init_trace_hub() { ...
int ct_data[202]; // [esp+1Ch] [ebp-334h] 808 bytes int cookie; // [esp+344h] [ebp-Ch]
cookie = gRmlbCookie; ...
if ( !(getDW_sel(0xBF, 0xE0u) & 0x1000000) && !bup_get_si_features(si_features) && !bup_dfs_get_file_size("/home/bup/ct", &file_size) )
{ if ( file_size ) { LOBYTE(err) = bup_dfs_read_file("/home/bup/ct", 0, ct_data, file_size, &bytes_read);
... if ( gRmlbCookie != cookie ) sys_fault();
}
31

808-byte Mystery
void __cdecl bup_init_trace_hub() { ...
int ct_data[202]; // [esp+1Ch] [ebp-334h] 808 bytes ... }
32

Trace Hub Configuration Binary

name .. ct df_cpu_info

mode opt cb uid gid offset 13C0 0000 0000 0003 0000 00003388 01E0 0009 0000 0003 015F 0000338B 01FF 0009 0004 0003 00CE 0000338B

mode

opt path

/home/

---rwxr----- ?--F /home/bup/ct

---rwxrwxrwx ?--F /home/bup/df_cpu_info

Not signed From fitc.cfg

33

Stack Guard
void __cdecl bup_init_trace_hub() { ...
int ct_data[202]; // [esp+1Ch] [ebp-334h] 808 bytes int cookie; // [esp+344h] [ebp-Ch]
cookie = gRmlbCookie; ...
if ( !(getDW_sel(0xBF, 0xE0u) & 0x1000000) && !bup_get_si_features(si_features) && !bup_dfs_get_file_size("/home/bup/ct", &file_size) )
{ if ( file_size ) { LOBYTE(err) = bup_dfs_read_file("/home/bup/ct", 0, ct_data, file_size, &bytes_read);
... if ( gRmlbCookie != cookie ) sys_fault();
}
34

Stack Guard Implementation
· Each process has unique value for stack cookie · Value is obtained from hardware random
number generator · Stored in nonvolatile process memory · If stack's copy of cookie is changed, process
terminates
35

Bypass mitigations
36

How to Bypass Stack Guard?
 Break random number generator  Intercept code flow before cookie checking
37

Break Random Number Generator

signed int InitRandDev() {
signed int i; // edx@1 signed int result; // eax@4
dev_rnd_seed = 0xDC80; dev_rnd_conf = 0x44050; RandDevPriming(0x190u); i = 1001; while ( !(dev_rand_sts & 1) ) {
if ( !--i ) return DEVERROR;
} result = DEVERROR; if ( (dev_rand_sts & 0xF) == 15 )
result = NOERROR; return result; }
38

If Random Number Generator is broken, RBE doesn't start at all

How to Bypass Stack Guard?
 Break random number generator  Intercept code flow before cookie checking
39

Code Flow (For C Programmers)
void __cdecl bup_init_trace_hub() { ...
LOBYTE(err) = bup_dfs_read_file("/home/bup/ct", 0, ct_data, file_size, &bytes_read); ... }
char __cdecl bup_dfs_read_file(char *file_name, int offset, char *buffer, unsigned int read_size, unsigned int *out_bytes_read) { ...
*out_bytes_read = read_size; LOBYTE(res) = bup_read_mfs_file(7, fitc_file_desc.data_offset + offset, out_bytes_read, sm_mem_id, 0); ... }
int __cdecl bup_read_mfs_file(BUP_MFS_DESC *mfs_desc, int file_number, unsigned int offset, unsigned int *size, int sm_block_idx, __int16 proc_thread_id) { ...
while ( 1 ) { if ( cur_offset >= read_size ) break;
... err = bup_mfs_read_data_chunks(mfs_desc, buffer, mfs_desc->data_chunks_offset + ((read_start_chunk_id - mfs_desc->total_files) << 6), block_chunks_count);
... err = sys_write_shared_mem(proc_thread_id, sm_block_idx, cur_offset, &buffer[chunk_offset], copy_size, copy_size);
... }
} ... }
signed int __cdecl sys_write_shared_mem(__int16 owner_proc_thread_id, int block_idx, int offset, char *src_data, unsigned int src_size, unsigned int write_size) { ...
sm_block_desc = sys_get_shared_mem_block(block_idx); ...
memcpy_s((sm_block_desc->start_addr + offset), sm_block_size - offset, src_data, write_size); ... }
40

Code Flow (For People)
bup_init_trace_hub bup_dfs_read_file bup_read_mfs_file sys_write_shared_mem
41

Inside sys_write_shared_mem

signed int __cdecl sys_write_shared_mem(...) { ...
sm_block_desc = sys_get_shared_mem_block(block_idx); ...
memcpy_s((sm_block_desc->start_addr_linked_block_idx + offset), sm_block_size - offset, src_data, write_size); ... }

[...]

int __cdecl sys_get_ctx_struct_addr(SYS_LIB_CTX_STRUCT_ID struct_id)

{ ...
sys_ctx_start_ptr = sys_get_tls_data_ptr(SYSLIB_GLB_SYS_CTX); switch ( struct_id ) {
case SYS_CTX_SHARED_MEM: addr = *sys_ctx_start_ptr + 0x68; break;
... }

sys_get_tls_data_ptr proc near

tls_idx = dword ptr 8

push mov mov

??? ebp
ebp, esp eax, large gs:0

mov

ecx, [ebp+tls_idx]

pop

ebp

lea

edx, ds:0[ecx*4]

return addr;

sub

eax, edx

}

retn

sys_get_tls_data_ptr endp

42

What is gs:[0]?

0 syslib ctx pointer
last error thread ID self pointer

-0x10 -0xC -8 -4 0

Thread Local Storage gs:[0]

43

0 ...
SYS_CTX_SHARED_MEM_CTRL +0x68

...

KERN_SHARED_MEM_DESC
...

+0x28

isisUUsseedd isUsed stsatratr_ta_daddrdersesss start_address
siszieze size
mmmimoi_os_esleelcetcotror mmio_selector
tatragregte_tt_htrheraeda_di_oi_oh_ahnadnldele target_thread_io_handle

0 +4 +8 +0xC +0x10

Serious Architecture Problem
Thread Local Storage resides at thread stack bottom
44

0x00000000 Stack grows 0xffffffff 45

Stack Layout

buffer
cookie ret address
callers' frames
unused syslib ctx ptr
last error thread ID self pointer
default heap

Overflow progress
Thread Local Storage gs:[0]

A New Hope
· Function bup_read_mfs_file gets address of destination buffer from syslib_context
· Reads file data and writes to destination by chunks iteratively
· We can get arbitrary write primitive replacing syslib_context pointer
· We can rewrite memcpy's return address
46

controlled destination of next chunk copy
47

Arbitrary Write Scheme

ret addr dst src count
buffer
new syslib ctx
new smem desc
syslib ctx ptr

memcpy frame (called by sys_shared_mem_write)
smem desc syslib ctx

Non-Executable Stack
48

Non-Executable Stack
Problem: Stack segment doesn't intersect with code segment
Solved: We found ROP gadgets for own process creation
49

Non-Executable Stack Bypass
· Create own code module and integrate it into firmware
· Using ROP, load the module into memory · Using ROP, create new process with highest
privileges
50

Vulnerability Overview
51

CVE-2017-5705,6,7
· CVSSv3: AV:L/AC:L/PR:H/UI:N/S:C/C:H/I:H/A:H (8.2 High)
· Attacker with local access to the system can load and execute arbitrary code
· Affected Intel® Management Engine (ME), Intel® Server Platform Services (SPS), and Intel® Trusted Execution Engine (TXE)
52

Affected Products
· 6th, 7th & 8th Generation Intel® CoreTM Processor Family · Intel® Xeon® Processor E3-1200 v5 & v6 Product Family · Intel® Xeon® Processor Scalable Family · Intel® Xeon® Processor W Family · Intel® Atom® C3000 Processor Family · Apollo Lake Intel® Atom Processor E3900 series · Apollo Lake Intel® PentiumTM · CeleronTM N and J series Processors
53

Possible Exploitation Vectors
54

Possible Exploitation Vectors
Restriction: Attacker needs write access to MFS partition of
ME SPI region
55

Ways to Rewrite ME SPI Region
· Mistakes in SPI flash region settings in SPI flash descriptor
· Via HMR-FPO HECI message  Manufacture mode  Attack on UEFI setup variable  DMA attack
· Security Descriptor Override jumper · SPI programmer · ...
56

Is Remote Exploitation Possible?
· Yes, if:  AMT is enabled on the target and attacker knows password*  BIOS has "Flash Rewrite Enable" option  BIOS password is blank or known *Attacker can use AMT authentication bypass vulnerability
(CVE-2017-5689)
57

BAD NEWS
58

Bad News ­ HAP
HAP is no cure-all
(for CVE-2017-5705,6,7)
*Mark Ermolov, Maxim Goryachy Disabling Intel ME 11 via undocumented mode [DMU17]
59

Bad News ­ Firmware Downgrade Intel Firmware Update against CVE-2017-5705,6,7 doesn't help because ROM allows ME downgrading
60

Bad News ­ TLS
ME 11.8.50.3399 TLS is still in at the same place
61

Demo time
62

Demo 1 AMT on non-vPro platform
63

Demo 2 JTAG for Intel ME
64

Demo 3 Hello from Intel ME
65

Intel ME 11 ­ Related Technologies
· Intel Active Management Technology · Intel Protected Audio Video Path · Intel Platform Trust Technology (fTPM) · Intel Software Guard Extensions · Intel Boot Guard
66

100% Protection?
Waiting for Intel Management Engine 13! (maybe Intel will remove it from PCH... ;)
67

Our Achievements
· Switched-on AMT on non-vPro systems · Activated JTAG for Intel ME via the vulnerability · Dumped starter code (aka ROM) · Recovered complete Huffman code for ME 11 · Extracted Integrity and Confidentiality Platform
Keys [FFS17] · Bypassed Intel Boot Guard
68

Kudos!
· Positive Technologies for allowing us to spend part of our working time on it!
· Dmitry Sklyarov · Plato Mavropoulos · People who have helped us but don't want
their names to be published ;)
69

Disclosure timeline
 27/06/2017 - Bug reported to Intel PSIRT  28/06/2017 - Intel started initial investigation  05/07/2017 - Intel requested proof-of-concept  06/07/2017 - Additional information sent to Intel PSIRT  17/07/2017 - Intel acknowledged the vulnerability  28/07/2017 - Bounty payment received  20/11/2017 - Intel published SA-00086 security advisory
70

References
[IMS14] Igor Skochinsky, Intel ME Secrets. Hidden code in your chipset and how to discover what exactly it does. Hex-Rays. RECON 2014.
[STW17] Dmitry Sklyarov, ME: The Way of the Static Analysis. Troopers 2017. [FFS17] Dmitry Sklyarov, Intel ME: flash file system explained, Black Hat Europe, 2017. [IRR09] Alexander Tereshkin, Rafal Wojtczuk, Introducing Ring-3 Rootkits. Black Hat USA, 2009
Las Vegas, NV. [SMT10] Vassilios Ververis, Security Evaluation of Intel's Active Management Technology, Sweden 2010
TRITA-ICT-EX-2010:37. [PSTR14] Xiaoyu Ruan, Platform Embedded Security Technology Revealed: Safeguarding the Future of
Computing with Intel Embedded Security and Management Engine, 2014, Apress, ISBN 978-14302-6572-6. [ASM17] Dmitriy Evdokimov, Alexander Ermolov, Maksim Malyutin, Intel AMT Stealth Breakthrough, Black Hat USA, 2017 Las Vegas, NV. [DMU17] Mark Ermolov, Maxim Goryachy, Disabling Intel ME 11 via undocumented mode, https://www.ptsecurity.com/upload/corporate/ww-en/analytics/Intel-ME-disable-eng.pdf, 2017.
71

Thank you! Questions?
Mark Ermolov Maxim Goryachy
72

