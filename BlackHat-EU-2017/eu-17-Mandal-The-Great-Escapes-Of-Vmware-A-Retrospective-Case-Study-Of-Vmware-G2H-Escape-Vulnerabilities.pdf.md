THE GREAT ESCAPES OF VMWARE: A RETROSPECTIVE CASE STUDY OF VMWARE GUEST-TO-HOST ESCAPE VULNERABILITIES
Presented By : Debasish Mandal & Yakun Zhang
#BHEU / @BLACKHATEVENTS

About Us: Debasish Mandal
 Security researcher on McAfee IPS Vulnerability Research Team.  Working in information security industry for past six years.  At first was mostly focused on penetration testing of web applications and networks.  Last three years at McAfee/Intel Security, primary focus has shifted to vulnerability
research, reverse engineering, exploits, and advanced exploitation techniques.  In spare time, do security bug hunting, blogging.  http://www.debasish.in/  https://securingtomorrow.mcafee.com/author/debasish-mandal/  @debasishm89
#BHEU / @BLACKHATEVENTS

About Us: Yakun Zhang
 Security researcher on McAfee IPS Vulnerability Research Team.  Malware analyst in the past.  Focus on software and Linux kernel security.  @VigiZhang
#BHEU / @BLACKHATEVENTS

Agenda
 Why VMWare Patch Analysis?  Popular VMWare Workstation/Fusion Attack Surfaces  Attack Surface: RPC  Attack Surface: Virtual Printer  Attack Surface: Graphics  VMWare Workstation/Fusion Vulnerability Trend  Takeaways
#BHEU / @BLACKHATEVENTS

Why VMWare Patch Analysis?
 Virtual machine escapes are not good.  One of the most popular virtualization software with rich functionalities and features.  Targeted in much exploitation content such as Pwn2Own, Pwnfest, etc.
#BHEU / @BLACKHATEVENTS

What's being targeted in VMWare Workstation/Fusion?

 Data collected from last year in VMWare Workstation/Fusion security advisories.
 Silently patched bugs are not included.  The numbers are mostly based on the
CVE(s) present in official VMware security advisories.
#BHEU / @BLACKHATEVENTS

Most Targeted Components

10%

20%

30% 40%

RPC SVGA Virtual Printer Other

VMWare Workstation Attack Surfaces
 RPC  Virtual Printer  Graphics (SVGA ­ II)
#BHEU / @BLACKHATEVENTS

ATTACK SURFACE: RPC
#BHEU / @BLACKHATEVENTS

VM-Tools & VMWare RPC
 VMware tools need to be installed on the guest OS to fully utilize RPC capabilities.
 In guest OS vmtoolsd.exe responsible for various RPC related operations.
 vmtoolsd.exe process starts when guest starts.
#BHEU / @BLACKHATEVENTS

Guest RPC Mechanism
 To make an RPC call, the guest application can directly interact with an interface, named VM Backdoor.
 vmtools.dll provides high-level RPC API(s).  Application can invoke API(s) exported by vmtools.dll
(on Windows).
 RpcOut *RpcOut_Construct(..);  Bool RpcOut_start(..);  Bool RpcOut_send(..);  Bool RpcOut_stop(..);
#BHEU / @BLACKHATEVENTS

VM Backdoor

 VMware Backdoor is the lowest component of RPC implementation.

 Backdoor is a special I/O port specific to VMware.

mov eax, 564D5868h

; vmware magic bytes

mov ebx, command-specific-parameter

mov cx, backdoor-command-number

mov dx, 5658h

; the vmware I/O Port

in eax, dx

 Command list: https://sites.google.com/site/chitchatvmback/backdoor

 In vmtools, vmtools!Backdoor() function takes care of this.
#BHEU / @BLACKHATEVENTS

RPC Packet
 For different guest operations VMware has different RPC packet structures.  Guest RPC packet starts with an RPC command string.  Based on the RPC command, host ­ vmware-vmx.exe process decides how to process the
RPC packet.  The screenshot shows a raw RPC packet structure in memory with the command
vmx.tools.get_version_status
#BHEU / @BLACKHATEVENTS

RPC Packet Handling in Host
 Each running virtual machine has a separate user mode process called vmware-vmx.exe.
 Most of the VMware workstation virtualization codes are present in vmware-vmx.exe.
 It handles most of the events invoked by the guest operating system including RPC calls
 One of the most complex binaries in VMware Workstation with rich features; hence very attack prone.
 Considered as most popular gateway to escape from a VMware virtual machine.
#BHEU / @BLACKHATEVENTS

Sending Custom RPC Packets From Guest to Host
 Using vmtools.dll API(s) we can send and receive RPC packets from guest to host.
#BHEU / @BLACKHATEVENTS

RPC Layer Vulnerabilities Fixed in VMware Workstation/Fusion in Recent Past

 VMSA-2016-0019 (Patched version 12.5.2) : The drag-and-drop (DnD) function in VMware Workstation and Fusion has an out-of-bounds memory access vulnerability.
 VMSA-2017-0005 (Patched Version 12.5.4 ): The drag-and-drop function in VMware Workstation and Fusion has an out-of-bounds memory access vulnerability.

VMware Advisory VMSA-2016-0019 VMSA-2017-0005
#BHEU / @BLACKHATEVENTS

Unpatched Version 12.5.1 12.5.3

Patched Version 12.5.2 12.5.4

RPC Bug 1: OOB in Drag and Drop

Untrusted
Vulnerable Code

Patch

#BHEU / @BLACKHATEVENTS

Achieving OOB Read

 In the RPC structure payloadSize is in our control.
 Send an RPC packet with a large payloadSize but no payload.
 memcpy() overreads some memory from RPC packet buffer.

#BHEU / @BLACKHATEVENTS

DnDCPMsgHdrV4 addrId binary

cmd type src sessionId status param1
Binary Size Payload offset Payload size

1. Send RPC Packet with following characteristics · packet->payloadSize = 0x500 · packet payload = NULL
payload buffer Other Heap Block

Achieving OOB Write

 We have to send at least two RPC packets to the host with the same sessionID.

 Host will allocate new buffer to append payload of two RPC packets

 Packet 1:

 packet->sessionID = 0xdeaddead.  packet->binarySize = 0x10000.

OOB Write

 packet->payloadOffset = 0x0.

 packet->payloadSize = 0x500.

 Packet 2:

 packet->sessionID = 0xdeaddead.

 packet->binarySize = 0x10100.

 packet->payloadOffset = 0x500.

 packet->payloadSize = 0xFC00.

#BHEU / @BLACKHATEVENTS

1. After first packet new payload buffer will be created of size 0x10000
2. 0x500 bytes of payload will be copied to that buffer.
3. After second packet a same payload buffer will be used and 0xFC00 bytes of payload will be copied.
4. Since 0x500 + 0xFC00 = 0x10100 which is > 0x10000 (We have 0x100 byte OOB write)

0x500

0xFC00

0x10000

Info. Leak Using OOB Write Over RPC

vftable

vftable

vftable

vftable

vftable

vftable

 Required for ASLR bypass.
1. We allocate desired heap chunks.

Fig 1

2. We trigger the overflow and change the length to the string object, which is accessible from guest.
3. We read back the yellow block from guest, which will have the vftable address of the green object.

Fig 2 Fig 3

4. From that we calculate the base of vmware-vmx.exe.

5. Thanks to Chaitin Security Research Lab

#BHEU / @BLACKHATEVENTS

Overflow Chunk Controlled string DND or CP Object

Bug 2: Yet another OOB in Drag and Drop
· Discovered by Chaitin Security Research Lab. · This bug is almost identical to the bug we just discussed. · But it was present in DnDCP version 3. · To be able to trigger this bug DnDCP version has to be
downgraded to version 3 from 4. · tools.capability.dnd_version 3 · vmx.capability.dnd_version · tools.capability.copypaste_version 3 · vmx.capability.copypaste_version
#BHEU / @BLACKHATEVENTS

Bug 3: Use After Free
1. Set DnD version to 2 by sending following RPC commands to host · tools.capability.dnd_version 2 · vmx.capability.dnd_version
2. Set DnD version to 3 by sending following RPC commands to the host · tools.capability.dnd_version 3 · vmx.capability.dnd_version
3. Host will register version 3 RPC and free function pointers, registered for different v2 RPCs.
4. Although the function pointers are freed. The associated RPC callbacks remain active.
5. When any of these RPC commands, invoked, the existing callbacks will try to reuse a freed pointer, leading to use after free.
#BHEU / @BLACKHATEVENTS

Struct rpc_struct { uint64 *rpcCommand; uint64 commandLen; void *rpcCallback; uint64 *relatedBuffer; uint64 flags;
};
· tools.capability.dnd_version 2 · vmx.capability.dnd_version · tools.capability.dnd_version 3 · vmx.capability.dnd_version
And any of these RPC call:
· dnd.ready · dnd.feedback · dnd.setGuestFileRoot · dnd.enter · dnd.data.set · dnd.transport · copypaste.transport

How Could These Issues be Identified

 RPC commands are documented and can be found in open-vm-tools as well as vmware_vmx.exe binary (through reverse engineering).
 RPC packet structures of different guest-to-host operations are well defined and documented in open vmtools: https://github.com/vmware/open-vm-tools.
#BHEU / @BLACKHATEVENTS

Collect valid RPC commands & Packet
Structures
Mutate RPC Packets in Guest
Send RPC Packet from Guest to Host
Monitor host vm process(vmware_vmx) for
interesting events

ATTACK SURFACE: VIRTUAL PRINTER (EMF HANDLING)
#BHEU / @BLACKHATEVENTS

VMware Virtual Printer

 Allows guest virtual machine to print documents using printing device available at the host.

 Not a default feature. Need to enable this option before VMware boots.

A print job

 Guest uses COM1 port to talk to Host.

EMFSPOOL

 vmware-vmx.exe communicates with vprintproxy.exe using named pipes.

EMF

 EMFSPOOL file stores print jobs processed from guest to host.

EMR EMR EMR

 EMFSPOOL file contains EMF file, which is the content to be printed.

 vprintproxy.exe loads tpview.dll to preview the print.

 It will parse the EMF file and render the preview.

#BHEU / @BLACKHATEVENTS

VMware Virtual Printer

Guest Host

VM

VM

COM1 Named Pipes
vmware-vmx.exe

VM
vprintproxy.exe tpview.dll

#BHEU / @BLACKHATEVENTS

Print preview

Triggering the Print Preview
 Thanks to Kostya's work.  The variable devmode
contains device settings.  Argument emf as input file.  Code structure can be
changed to turn it into a fuzzer.
#BHEU / @BLACKHATEVENTS

EMF

EMF Header

 Enhanced Metafile Format.  Stores device-independent representations of graphics images.  Used by Internet Explorer, Microsoft Office, printer drivers, etc.  Mainly composed of EMF header and EMR (EMF records) structures.  JPEG file will be embedded in EMF file.

EMF Record EMF Record
...

EMF Record

#BHEU / @BLACKHATEVENTS

EMF EoF Record

EMR
Some EMR types example:
 Properties and definitions for representing the EMF file.  Grouped into many categories (bitmap, clipping,
control, OpenGL, transform, etc.).  Well-documented in the official MS-EMF article.
#BHEU / @BLACKHATEVENTS

Issues in Recent Past

 In VMware Workstation Version 11.1, Kostya of Google Security Team found a lot of vulnerabilities in tpview.dll.
 He leveraged one stack overflow vulnerability in tpview.dll JPEG2000 handling function to a full VMware escape exploit.
 In 2016, j00ru did some fuzzing on the same module and discovered three vulnerabilities: CVE-2016-7082, CVE-2016-7083, CVE-2016-7084. Thanks to j00ru's great work.

VMware Advisory VMSA-2016-0014

Unpatched Version 12.1.1

Patched Version 12.5.0

#BHEU / @BLACKHATEVENTS

Double Free in EMR_SMALLTEXTOUTW (CVE-2016-7082)

 Present in tpview.dll EMR_SMALLTEXTOUTW handling function.
 Problem is how to bypass *(a3+44) check.
 Add a registry key on the host: "HKLM\SOFTWARE\ThinPrint\TPView"
 Create a DWORD "ClipRect" set value as "0".
#BHEU / @BLACKHATEVENTS

Double free

Double Free in EMR_SMALLTEXTOUTW (CVE-2016-7082)

 $edi is the pointer.  Before stepping over the second free(),
the buffer is already freed.  Double free makes heap error.
#BHEU / @BLACKHATEVENTS

This is the second free() Already freed

Patch for CVE-2016-7082

 No patch, no fix  Should have been patched in Version 12.5.0 (VMSA-2016-0014)  Still exists in Version 14.0.0 (as of Nov. 2017)

v12.1.1 vs v12.5.0

#BHEU / @BLACKHATEVENTS

Double Free in EMR_SMALLTEXTOUTW (CVE-2016-7082)
 Demo
#BHEU / @BLACKHATEVENTS

Out of Bounds memset() in TrueTypeFont Embedded EMFSPOOL (CVE-2016-7083)

 Memory corruption vulnerability when handling TrueTypeFont embedded EMFSPOOL file.

 In EMFSPOOL, after EMF content we need to add the EMRI_ENGINE_FONT structure, which contains the TrueTypeFont file.

 tpview.dll parses TrueTypeFont, gets NameTable structure, and extracts its NameBuffer and

NameSize.

 memset(NameBuffer, 0, NameSize).

EMFSPOOL EMF

TTF file

 No check for the NameSize. Out of bounds memset().

#BHEU / @BLACKHATEVENTS

Out of Bounds memset() in TrueTypeFont Embedded EMF (CVE-2016-7083)

No check to restrict v7 value

No check for v7. $edi holds NameSize and the value is 0xFFFFFFFF. memset() triggers crash.
memset(eax, 0, 0xffffffff)

#BHEU / @BLACKHATEVENTS

Patch for CVE-2016-7083

 Added necessary checks before memset().
#BHEU / @BLACKHATEVENTS

Before the memset()

Many Vulnerabilities in JPEG2000 Decompression (CVE-2016-7084)
 A set of vulnerabilities was patched under one CVE.  j00ru discovered about 40 crashes in the JPEG2000 handling function.  Understanding of JPEG2000 structure and its decompression algorithm is required.
#BHEU / @BLACKHATEVENTS

Out of Bounds Write Vulnerability in JPEG2000 Decompression (CVE-2016-7084)

 Bug was present in tpview.dll JP2_decompress_Image function.

Old value +

another value

=

New value

 A while loop takes up the values in a heap

buffer, adds some calculated values, and

Buffer

refills them to the heap buffer.

 The heap entry size is 0xB0. Filling operation starts from the heap user offset 0x8.

 (0xB0 - 0x8 - 0x8) = 0xA0 = 0x28 * 4.

 The loop count from 0x0 to 0x27. Should be less than 0x28.

 No check for the loop count.

 OOB write to next heap entry.

#BHEU / @BLACKHATEVENTS

Out of Bounds Write Vulnerability in JPEG2000 Decompression (CVE-2016-7084)

 This is the 0x30 (42nd) write. The loop count is 0x29.
 When the loop count was 0x28, it was an OOB write, however $edi was 0x0. No impact on the memory.
 In this time, loop count is 0x29, $edi is 0xe.
 It tries to add 0xe to 0x3a02b94, which belongs to the next heap entry.
#BHEU / @BLACKHATEVENTS

edx = 0x28

edx = 0x29

Next heap entry

Patch for CVE-2016-7084
 Necessary checks were added.  v29 cannot be greater or equal
to v13[3].
#BHEU / @BLACKHATEVENTS

More Fuzzing
 VMware virtual printer is an important attack surface for VMware escape.  Because it has many types of complex EMR structures, EMF is an appropriate fuzzing
target.  Thanks to Kostya's work. We need to only mutate EMF file structure and capture crashes.
1. Create classes for all of EMR types structures. 2. Mutate EMR class members. Randomly combine the EMR structures in the crafted EMF. 3. Save the crafted EMF PoC file. 4. Push for printing. 5. On host, deploy a monitoring engine to monitor vprintproxy.exe for crash. 6. Go to step 1.
 Found a couple of interesting issues.
#BHEU / @BLACKHATEVENTS

ATTACK SURFACE: GRAPHICS COMPONENTS (SVGA ­ II)
#BHEU / @BLACKHATEVENTS

VMware SVGA II
 VMware SVGA II is virtual graphics card.  It's completely virtual PCI device; no real
hardware device exists.  Supports basic 2D frame buffer & 3D
Acceleration .  Provides few memory ranges that the
guest OS can use to communicate with the emulated device (SVGA II Virtual GPU).
#BHEU / @BLACKHATEVENTS

Without vmtools installed
With vmtools installed

VMware SVGA II Device Architecture

 We are mainly interested in following:
 Frame Buffer: Used only to draw twodimensional content on screen.
 First in first out (FIFO) memory queue: Using this FIFO memory queue, the guest directs GPU to process 2D/3D commands.
 These memory ranges mapped in vmware_vmx.exe in host.
 Diagram source: https://github.com/prepare/vmwaresvga/blob/master/doc/gpu-wiov.pdf
#BHEU / @BLACKHATEVENTS

vmware-vmx.exe 2D Framebuffer
FIFO

SVGA FIFO Commands

SVGA 2D Commands

SVGA 3D Commands (svga3d_reg.h)

#BHEU / @BLACKHATEVENTS

History of Security Bugs in FIFO Commands: Cloudburst by Kostya Kortchinsky

 Bug was present in SVGA_CMD_RECT_COPY.
 This command copies a rectangle (source) to a given destination inside frame buffer.
 Guest frame buffer is mapped in host process vmware_vmx.exe.
 First from guest we resolve address of frame buffer.
 When source rectangle address is out of the frame buffer of guest, we can read arbitrary memory from vmware_vmx.exe in frame buffer.
 When destination rectangle is out of the frame buffer, we can achieve arbitrary overwrite in vmware_vmx.exe.
#BHEU / @BLACKHATEVENTS

SRC DST

What Has Changed Now?
 2D and 3D commands were well audited in the past. (We are not saying there are no bugs.)
 Our recent VMware security patch analysis reveals attackers/vulnerability researchers shifted their focus to more complex graphics components, for example graphics shaders.
 Shaders under VMware are a huge attack surface because of their complexity.
#BHEU / @BLACKHATEVENTS

What Are Shaders?
#BHEU / @BLACKHATEVENTS

Shaders

 A shader is a special type of computer program that is used for graphics special effects.
 Usually written in HLSL (Microsoft for the Direct3D) or GLSL (OpenGL standard) shading language.
 Shaders written in HLSL can be compiled using Shader compiler D3DCompiler_47!D3DCompileFromFile

Input: Output:

#BHEU / @BLACKHATEVENTS

Life of a Shader

Shader Compiler

Shader Bytecode

#BHEU / @BLACKHATEVENTS

Intermediate shader assembly
language
Render

Shader inside VMware Workstation

Guest Operating System (User) d3d11.dll

Guest OS (Kernel)

App.

Shader Bytecode

SVGA 3D CMD Buffer

VMware Virtual SVGA
Device

FIFO

Host (OS)

Guest shader to Host shader
translation

vmware_ vmx.exe

Host GPU Driver

vm3dum_**.dll
#BHEU / @BLACKHATEVENTS

Passing Shader bytecode from guest to host via `SVGA3D' Protocol
#BHEU / @BLACKHATEVENTS

Shader Bytecode handling in Host
 Compiled shader byte-code received at the host OS (vmware-vmx).
 Guest Shader byte code is parsed and translated into host Shader byte code.
 Remember when there is parser, there is bugs. 
 A list of SM4 instructions: https://msdn.microsoft.com/enus/library/windows/desktop/bb943976(v=vs. 85).aspx
#BHEU / @BLACKHATEVENTS

Vulnerabilities in Virtual GPU

 Several advisories for SVGA components have been published in recent months.  Makes it obvious SVGA attack surface is pretty hot among vulnerability researchers. 

VMware Advisory VMSA-2016-0019 VMSA-2017-0006 VMSA-2017-0015.2

Patched Version 12.5.2 12.5.4 12.5.6

Unpatched Version 12.5.3 12.5.5 12.5.7

#BHEU / @BLACKHATEVENTS

SVGA Patch 1(Workstation 12.5.4 -> 12.5.5):
0x69 is opcode for dcl_indexableTemp
Instruction
#BHEU / @BLACKHATEVENTS

Heap OOB Write
OOB Write
#BHEU / @BLACKHATEVENTS

Demo: SVGA Memory Corruption
#BHEU / @BLACKHATEVENTS

SM4 `dcl_constantbuffer' Instruction Parsing (0x59) Bug

#BHEU / @BLACKHATEVENTS

OOB Write Fixed In 12.5.5

Other SVGA Issues fixed in 12.5.5
SM4 dcl_immediateConstantBuffer

#BHEU / @BLACKHATEVENTS

Security Patch

Possible Security Issue fixed in SM1 `op_call' instruction parser in version 12.5.3?
#BHEU / @BLACKHATEVENTS

What Could be Next?
 More Bug(s) in SVGA II graphics implementation.  Unity feature in Workstation and Fusion are quite complex & can have bugs helping G2H
escape.  Virtual Machine Communication Interface (VMCI).  Every virtual (emulated) device.
#BHEU / @BLACKHATEVENTS

Black Hat Sound Bytes
 VM escapes are real! We cannot feel safe while executing untrusted code inside virtualization software.
 As with other software (for example, Internet Explorer), when virtualization software was developed, VM escapes were not seen as a problem. This is the perfect time to make security improvements in core virtualization tools--keeping in mind the attack surface, overall virtualization security, and escapes.
 In terms of the exploitation mitigation/prevention, VMware is relatively weak, for example it's still lack of CFG protection, but we believe VMware will improve in this aspect very soon.
 Start focusing on Virtual Machine attack surface minimization by detaching unused/unimportant virtualization components from virtual machines.
#BHEU / @BLACKHATEVENTS

Other Works and Recommended Reads
 VMware SVGA II documentation  "Wandering through the Shady Corners of VMware Workstation/Fusion," by comsecuris  "50 Shades of Fuzzing," by Peter Hlavaty and Marco Grassi  "Cloudburst: Hacking 3D (and Breaking Out of VMware)," by Kostya Kortchinsky  "VMware Escapology: How to Houdini the Hypervisor," by ZDI  MS-EMF documentation  "Escaping VMware Workstation through COM1," by Kostya Kortchinsky  "An Analysis of the EMF Attack Surface & Recent Vulnerabilities," by Mateusz "j00ru" Jurczyk  Analyzing a Patch of a Virtual Machine Escape on VMware ­ McAfee Labs  Vmware security advisories : https://www.vmware.com/in/security/advisories.html
#BHEU / @BLACKHATEVENTS

Questions?
 Thanks for your valuable time and attention.  We would like to thank Bing Sun and the entire IDT Research team.  Send questions to:
 Debasish Mandal (Debasish_Mandal@McAfee.com)  Yakun Zhang (Yakun_Zhang@McAfee.com)
#BHEU / @BLACKHATEVENTS

