Debug for bug: Crack and Hack Apple Core by itself
Lilang Wu, Moony Li

About US
 Lilang Wu  4 years security experience  macOS/iOS malware/vulnerability  Fuzzing project
 BH USA 2018, BH EU 2018, HITB, CodeBlue

About US
 Moony Li  9 years security experience  macOS/iOS/Android malware/ vulnerability  0Day/NDay hunting/exploit
 BH EU 2015, BH USA2018, BH EU 2018, BH ASIA 2018, HITB, CodeBlue

Agenda
 Kernel Debugger Overview  The Introduction of LLDBFuzzer  Attack Surfaces on Graphic Extensions  Practice and Demo  Vulnerabilities Found  Implement a Debugger for Hackintosh  Conclusion

Agenda
 Kernel Debugger Overview  The Introduction of LLDBFuzzer  Attack Surfaces on Graphic Extensions  Practice and Demo  Vulnerabilities Found  Implement a Debugger for Hackintosh  Conclusion

Kernel Debugger Overview
 KDP a remote debugger protocol  Active by change boot-args  Only a single IOKernelDebugger can be activated at a given time  Ethernet Debugging, Firewire Debugging, Serial Debugging

Kernel Debugging Overview

Ethernet Driver

NetworkingFamily.kext

BSD Kernel

Ethernet Driver

receivePacket sendPacket

kdp_poll kdp_reply

Debugger Loop
Debugger world

BSD Kernel

Kernel Bootstrap

smp_init()

kernel_thread_creat()

kdp_i386_trap()

handle_debugger_trap()

kdp_raise_exception()

kdp_init()

kdp_handler()

kdp_register_send_receive()

kdp_poll()

kdp_reply()

receive = kdp_en_recv_pkt send = kdp_en_send_pkt

kdp_receive_data()

kdp_send_data()

Kdp Packet Process kdp.c

IONetworkingFamily.kext

IONetworking

IONetworkController:: attachDebuggerClient()

IOKernelDebugger ::debugger()

IOKernelDebugger ::init()

handleActivationChange

Thread

Ethernet Driver

BCM5701Enet

AppleBCM5701Ethenet.kext

kdp_register_send_receive()

txHandler

rxHandler

virtual void receivePacket() virtual void sendPacket()

Debugging UDP Packet Follow

BCM5701Enet

virtual void receivePacket() virtual void sendPacket()

receive = kdp_en_recv_pkt send = kdp_en_send_pkt

kdp_poll kdp_reply

LLDB World

Debugger ToolSet for macOS
 API Wrappers for basic lldb Scripting Bridge APIs
 Performance reports plugin  Main logic to load plugin and
debug commands  Debug commands implementation

Agenda
 Kernel Debugger Overview  The Introduction of LLDBFuzzer  Attack Surfaces on Graphic Extensions  Practice and Demo  Vulnerabilities Found  Implement a Debugger for Hackintosh  Conclusion

LLDBFuzzer OverView

Probe Setup
 Actually, make breakpoints
 By address/function name
 Ignore times
 Condition bp not works
 Controlled by FuzzSwitch

Fuzz Executor
 Intercept the fuzz probe and capture the input data buffer;  Read the input data buffer, mutate it and write them to kernel memory  Continue the interface, check the return value and monitor the fuzzing
status  If crash, send the core dump and panic log to fuzz server and restart the
target machine

Fuzz Mutation
 FUZZ_FREQUENCY  FLIP_N_RAND_LIMIT  FLIP_N_RAND_MIN  FLIP_NRAND_MAX  FLIP_MIN_BYTES  FLIP_MAX_BYTES
 Add you own mutation strategy

Fuzz Mutation

Crash Monitor
 Embedded lldb toolset is powerful  Fruitful python plugin


Data Generating on Target Machine
 Purpose  Touch more deep code coverage
 Methodology  Generating valid data and code execution (with context)
 Implementation  Apple Script based app test  Enrich kinds of corpuses around attack interface  Browser, 3D game engine, benchmark ...as you think


Data Generating Tricks
 Embedded Apple Script is powerful  Automatic app test  Timely reboot from kernel
 In case of kernel hang but not crash

Agenda
 Kernel Debugger Overview  The Introduction of LLDBFuzzer  Attack Surfaces on Graphic Extensions  Practice and Demo  Vulnerabilities Found  Implement a Debugger for Hackintosh  Conclusion

 Graphic Drivers  AMD  Intel

IOAccelerator Class Diagram for AMD Driver

Usual Attack Surfaces
 AMDRadeonX4000_AMDPitcairnGraphicsAccelerator  List all connection types and their services;  newUserClient  Get all the external methods of each services;  IOUserClient::externalMethod()  IOUserClient::getTargetAndMethodForIndex() ...  Refer to:  https://conference.hitb.org/hitbsecconf2019ams/sessions/fresh-apples-researching-new-attackinterfaces-on-ios-and-osx/#

Hidden Attack Surfaces
 Interfaces which are protected by filter drivers for Intel Graphic Driver, which has been introduced in YU WANG's DEFCON 26 topic;
 Interfaces whose arguments are controlled by the share memory;  Interfaces which can not be indirectly touched by user space processes, but
can be access by Safari etc. special processes

Hidden Attack Surfaces
 Interfaces which are protected by filter drivers for Intel Graphic Driver, which has introduced in YU WANG's DEFCON 26 topic;
 Interfaces whose arguments are controlled by the share memory;  Interfaces which can not be indirectly touched by user space processes, but
can be access by Safari etc. special processes

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options);

kern_return_t IOConnectMapMemory64(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options);

The virtual address of the beginning of the buffer IOBufferMemoryDescriptor::getBytesNoCopy()

Copy share memory data into cmdinfo

Token process methods

Influence methods in AMDRadeonX4000 kext
 AMDRadeonX4000_AMDSIGLContext::ati_token_process_methods  Total 33
 AMDRadeonX4000_AMDSIGLContext::ati_token_discard_methods  Total 33

Pattern

--- omitted code --IOConnectMapMemory64(...,*atAddress, ...); (dword)*atAddress = 0x41414141; ... --- omitted code ---

--- omitted code --v1 = this->buffer; v2= this->share_memory_data + offset; memcpy(v1, v2, len); call_func(v1) --- omitted code ---

Fuzz Methodology
 Be familiar with the data structure in IOAccelCommandStreamInfo object  Set the fuzz probe at the critical function, here is
IOAccelContext2::processSidebandBuffer()  Mutation the proper bytes in this object  Continue the kernel process

Hidden Attack Surfaces
 Interfaces which are protected by filter drivers for Intel Graphic Driver, which has introduced in YU WANG's DEFCON 26 topic;
 Interfaces whose arguments are controlled by the share memory;  Interfaces which can not be touched directly by user space processes, but can
be access by Safari etc. special processes

Private Connection Type

 IOFramebuffer::newUserClient()

enum {

// connection types for IOServiceOpen

kIOFBServerConnectType

= 0,

kIOFBSharedConnectType

= 1,

kIOFBDiagnoseConnectType

= 2,

};

Hidden Functions

Fuzz Methodology
 Similar with the passive fuzz for the is_io_connect_method()  Set the fuzz probe in the function is_io_connect_method  Mutation the proper bytes in its scalar input and inband input  Continue the kernel process
 Similar with the processSidebandBuffer function fuzz  Research the arguments structure first and fuzz each function separately

Agenda
 Kernel Debugger Overview  The Introduction of LLDBFuzzer  Attack Surfaces on Graphic Extensions  Practice and Demo  Vulnerabilities Found  Implement a Debugger for Hackintosh  Conclusion

Agenda
 Kernel Debugger Overview  The Introduction of LLDBFuzzer  Attack Surfaces on Graphic Extensions  Practice and Demo  Vulnerabilities Found  Implement a Debugger for Hackintosh  Conclusion

CVE-2019-8519 - OOB in AMD Driver
* thread #1, stop reason = signal SIGSTOP * frame #0: 0xffffff7fa00965d3 AMDRadeonX4000`AMDRadeonX4000_AMDAccelResource::initialize(IOAccelNewResourceArgs*, unsigned long long) + 1525 frame #1: 0xffffff7f9fea346b IOAcceleratorFamily2`IOAccelSharedUserClient2::new_resource(IOAccelNewResourceArgs*, IOAccelNewResourceReturnData*,
unsigned long long, unsigned int*) + 1893 frame #2: 0xffffff7f9fea4a41 IOAcceleratorFamily2`IOAccelSharedUserClient2::s_new_resource(IOAccelSharedUserClient2*, void*,
IOExternalMethodArguments*) + 151 frame #3: 0xffffff801d625ab8 kernel.development`IOUserClient::externalMethod(this=<unavailable>, selector=<unavailable>, args=0xffffff83dd4b3b58,
dispatch=0xffffff7f9fee8260, target=0xffffff80854fd780, reference=0x0000000000000000) at IOUserClient.cpp:5358 [opt] frame #4: 0xffffff7f9fea4d98 IOAcceleratorFamily2`IOAccelSharedUserClient2::externalMethod(unsigned int, IOExternalMethodArguments*,
IOExternalMethodDispatch*, OSObject*, void*) + 120 frame #5: 0xffffff801d62eb7f kernel.development`::is_io_connect_method(connection=0xffffff80854fd780, selector=0, scalar_input=<unavailable>,
scalar_inputCnt=<unavailable>, inband_input=<unavailable>, inband_inputCnt=2424, ool_input=0, ool_input_size=0, inband_output="", inband_outputCnt=0xffffff806ba03e0c, scalar_output=0xffffff83dd4b3ce0, scalar_outputCnt=0xffffff83dd4b3cdc, ool_output=0, ool_output_size=0xffffff8085919d5c) at IOUserClient.cpp:3994 [opt]
frame #6: 0xffffff801cfbbce4 kernel.development`_Xio_connect_method(InHeadP=<unavailable>, OutHeadP=0xffffff806ba03de0) at device_server.c:8379 [opt] frame #7: 0xffffff801ce8d27d kernel.development`ipc_kobject_server(request=0xffffff8085919000, option=<unavailable>) at ipc_kobject.c:359 [opt] frame #8: 0xffffff801ce59465 kernel.development`ipc_kmsg_send(kmsg=0xffffff8085919000, option=3, send_timeout=0) at ipc_kmsg.c:1832 [opt]

__text:000000000000E58E loc_E58E:

; CODE XREF: AMDRadeonX4000_AMDAccelResource::initialize(IOAccelNewResourceArgs *,ulong long)+58Dj

__text:000000000000E58E

mov ecx, [r15+0F8h]

__text:000000000000E595

test rcx, rcx

__text:000000000000E598

jz short loc_E603

__text:000000000000E59A

shl rcx, 3

__text:000000000000E59E

lea rdi, [rcx+rcx*2]

__text:000000000000E5A2

call _IOMalloc

__text:000000000000E5A7

mov [r12+178h], rax --- rax== buffer address which create by IOMalloc

------- (a)

__text:000000000000E5AF

test rax, rax

__text:000000000000E5B2

jz short loc_E62A

__text:000000000000E5B4

or byte ptr [r12+186h], 8

__text:000000000000E5BD

mov ecx, [r15+0F8h] --------r15==structureInput, ecx=( (uint32_t*) structureInput+62)

---------(b)

__text:000000000000E5C4

mov [r12+180h], ecx

__text:000000000000E5CC

test rcx, rcx

------ test rcx, if zero, break

----------(c)

__text:000000000000E5CF

jz short loc_E639

__text:000000000000E5D1

xor edx, edx

------- index

---------(d)

__text:000000000000E5D3

__text:000000000000E5D3 loc_E5D3:

; CODE XREF: AMDRadeonX4000_AMDAccelResource::initialize(IOAccelNewResourceArgs *,ulong long)+621j

__text:000000000000E5D3

mov rsi, [r15+rdx+98h] ---- mov structureInput+rdx+0x98 to rsi

__text:000000000000E5DB

mov [rax+rdx], rsi

----mov rsi to rax+rdx, rax== buffer address which create by IOMalloc ----------(g) crash point

__text:000000000000E5DF

mov rsi, [r15+rdx+0A0h]

__text:000000000000E5E7

mov [rax+rdx+8], rsi

__text:000000000000E5EC

mov esi, [r15+rdx+0A8h]

__text:000000000000E5F4

mov [rax+rdx+10h], esi

__text:000000000000E5F8

add rdx, 18h

-------(e)

__text:000000000000E5FC

dec rcx

----decrease rcx value

--------(f)

__text:000000000000E5FF

jnz short loc_E5D3

CVE-2019-8692 - Another OOB in AMD Driver
* thread #1, stop reason = signal SIGSTOP frame #0: 0xffffff7f9dcd9459 AMDRadeonX4000`AMDRadeonX4000_AMDAccelResource::initialize(IOAccelNewResourceArgs*, unsigned long long) + 947 frame #1: 0xffffff7f9dc345ee IOAcceleratorFamily2`IOAccelSharedUserClient2::new_resource(IOAccelNewResourceArgs*,
IOAccelNewResourceReturnData*, unsigned long long, unsigned int*) + 1886 frame #2: 0xffffff7f9dc35bb5 IOAcceleratorFamily2`IOAccelSharedUserClient2::s_new_resource(IOAccelSharedUserClient2*, void*,
IOExternalMethodArguments*) + 151 frame #3: 0xffffff801b424978 kernel.development`IOUserClient::externalMethod(this=<unavailable>, selector=<unavailable>, args=0xffffffa76a5bb9b8,
dispatch=0xffffff7f9dc79260, target=<unavailable>, reference=<unavailable>) at IOUserClient.cpp:5689 [opt] frame #4: 0xffffff7f9dc35f0b IOAcceleratorFamily2`IOAccelSharedUserClient2::externalMethod(unsigned int, IOExternalMethodArguments*,
IOExternalMethodDispatch*, OSObject*, void*) + 119 * frame #5: 0xffffff801b42da02 kernel.development`::is_io_connect_method(connection=<unavailable>, selector=0, scalar_input=<unavailable>, scalar_inputCnt=<unavailable>, inband_input=<unavailable>, inband_inputCnt=2424, ool_input=0, ool_input_size=0, inband_output="", inband_outputCnt=0xffffff80bf24e60c, scalar_output=0xffffffa76a5bbce0, scalar_outputCnt=0xffffffa76a5bbcdc, ool_output=0, ool_output_size=0xffffff80beec9d5c) at IOUserClient.cpp:4304 [opt] frame #6: 0xffffff801adbc386 kernel.development`_Xio_connect_method(InHeadP=<unavailable>, OutHeadP=0xffffff80bf24e5e0) at device_server.c:8379 [opt] frame #7: 0xffffff801ac948fd kernel.development`ipc_kobject_server(request=0xffffff80beec9000, option=3) at ipc_kobject.c:361 [opt] frame #8: 0xffffff801ac6088e kernel.development`ipc_kmsg_send(kmsg=0xffffff80beec9000, option=3, send_timeout=0) at ipc_kmsg.c:1868 [opt] frame #9: 0xffffff801ac800e3 kernel.development`mach_msg_overwrite_trap(args=<unavailable>) at mach_msg.c:553 [opt] frame #10: 0xffffff801adf702b kernel.development`mach_call_munger64(state=0xffffff80bd7429a0) at bsd_i386.c:580 [opt] frame #11: 0xffffff801ac2a476 kernel.development`hndl_mach_scall64 + 22

- - - a)

- - - b)

- - - c)

CVE-2019-8635 - Double Free in AMD Driver
* thread #1, stop reason = signal SIGSTOP frame #0: 0xffffff7f8d7adc37 IOAcceleratorFamily2`IOAccelResource2::clientRelease(IOAccelShared2*) + 13 frame #1: 0xffffff7f8d880dad AMDRadeonX4000`AMDRadeonX4000_AMDSIGLContext::process_StretchTex2Tex(IOAccelCommandStreamInfo&) + 2893 frame #2: 0xffffff7f8d79b5d5 IOAcceleratorFamily2`IOAccelContext2::processSidebandBuffer(IOAccelCommandDescriptor*, bool) + 273 frame #3: 0xffffff7f8d8885e4 AMDRadeonX4000`AMDRadeonX4000_AMDSIGLContext::processSidebandBuffer(IOAccelCommandDescriptor*, bool) + 182 frame #4: 0xffffff7f8d79bae7 IOAcceleratorFamily2`IOAccelContext2::processDataBuffers(unsigned int) + 85 frame #5: 0xffffff7f8d7a2380 IOAcceleratorFamily2`IOAccelGLContext2::processDataBuffers(unsigned int) + 804 frame #6: 0xffffff7f8d798c30 IOAcceleratorFamily2`IOAccelContext2::submit_data_buffers(IOAccelContextSubmitDataBuffersIn*,
IOAccelContextSubmitDataBuffersOut*, unsigned long long, unsigned long long*) + 1208 frame #7: 0xffffff800b027a3c kernel.development`::shim_io_connect_method_structureI_structureO(method=<unavailable>, object=<unavailable>,
input=<unavailable>, inputCount=<unavailable>, output=<unavailable>, outputCount=0xffffff8742023968) at IOUserClient.cpp:0 [opt] frame #8: 0xffffff800b025ca0 kernel.development`IOUserClient::externalMethod(this=<unavailable>, selector=<unavailable>, args=0xffffff87420239b8,
dispatch=0x0000000000000000, target=0x0000000000000000, reference=<unavailable>) at IOUserClient.cpp:5459 [opt] * frame #9: 0xffffff800b02ebff kernel.development`::is_io_connect_method(connection=0xffffff80b094e000, selector=2, scalar_input=<unavailable>,
scalar_inputCnt=<unavailable>, inband_input=<unavailable>, inband_inputCnt=136, ool_input=0, ool_input_size=0, inband_output="", inband_outputCnt=0xffffff80b0d81e0c, scalar_output=0xffffff8742023ce0, scalar_outputCnt=0xffffff8742023cdc, ool_output=0, ool_output_size=0xffffff80ab5c7574) at IOUserClient.cpp:3994 [opt]
frame #10: 0xffffff800a9bbd64 kernel.development`_Xio_connect_method(InHeadP=<unavailable>, OutHeadP=0xffffff8742023ce0) at device_server.c:8379 [opt] frame #11: 0xffffff800a88d27d kernel.development`ipc_kobject_server(request=0xffffff80ab5c7400, option=<unavailable>) at ipc_kobject.c:359 [opt] frame #12: 0xffffff800a859465 kernel.development`ipc_kmsg_send(kmsg=0xffffff80ab5c7400, option=3, send_timeout=0) at ipc_kmsg.c:1832 [opt] frame #13: 0xffffff800a878a75 kernel.development`mach_msg_overwrite_trap(args=<unavailable>) at mach_msg.c:549 [opt] frame #14: 0xffffff800a9f63a3 kernel.development`mach_call_munger64(state=0xffffff80af471bc0) at bsd_i386.c:573 [opt] frame #15: 0xffffff800a823486 kernel.development`hndl_mach_scall64 + 22
https://blog.trendmicro.com/trendlabs-security-intelligence/cve-2019-8635-double-free-vulnerability-in-apple-macos-lets-attackers-escalate-system-privileges-and-execute-arbitrary-code/

- - - a) - - - b)

- - - a) - - - b)

- - - a) - - - b)

CVE-2019-8635 - Another Double Free in AMD Driver

CVE-2019-8691 - OOB in AMD Driver
(lldb) bt * thread #1, stop reason = signal SIGSTOP
* frame #0: 0xffffff7f849d49a0 AMDRadeonX4000`AMDRadeonX4000_AMDAccelResource::AndXorByteFlag(unsigned short, unsigned char, unsigned char) + 164
frame #1: 0xffffff7f849dad9d AMDRadeonX4000`AMDRadeonX4000_AMDAccelSharedUserClient::RsrcAndXorByteFlag(AMDRsrcAndXorByteFlagPacket const*, unsigned long long*) + 275
frame #2: 0xffffff8001c27a3c kernel.development`::shim_io_connect_method_structureI_structureO(method=<unavailable>, object=<unavailable>, input=<unavailable>, inputCount=<unavailable>, output=<unavailable>, outputCount=0xffffffa77393bab8) at IOUserClient.cpp:0:9 [opt]
frame #3: 0xffffff8001c25ca0 kernel.development`IOUserClient::externalMethod(this=<unavailable>, selector=<unavailable>, args=0xffffffa77393bb58, dispatch=0x0000000000000000, target=0x0000000000000000, reference=<unavailable>) at IOUserClient.cpp:5459:9 [opt]
frame #4: 0xffffff7f8493af0b IOAcceleratorFamily2`IOAccelSharedUserClient2::externalMethod(unsigned int, IOExternalMethodArguments*, IOExternalMethodDispatch*, OSObject*, void*) + 119
frame #5: 0xffffff8001c2ebff kernel.development`::is_io_connect_method(connection=0xffffff80bff43fd0, selector=262, scalar_input=<unavailable>, scalar_inputCnt=<unavailable>, inband_input=<unavailable>, inband_inputCnt=12, ool_input=0, ool_input_size=0, inband_output="", inband_outputCnt=0xffffff80bfc3260c, scalar_output=0xffffffa77393bce0, scalar_outputCnt=0xffffffa77393bcdc, ool_output=0, ool_output_size=0xffffff809d1e0b0c) at IOUserClient.cpp:3994:19 [opt]
frame #6: 0xffffff80015bbd64 kernel.development`_Xio_connect_method(InHeadP=<unavailable>, OutHeadP=0xffffff80bfc325e0) at device_server.c:8379:18 [opt] frame #7: 0xffffff800148d27d kernel.development`ipc_kobject_server(request=0xffffff809d1e0a40, option=<unavailable>) at ipc_kobject.c:359:3 [opt] frame #8: 0xffffff8001459465 kernel.development`ipc_kmsg_send(kmsg=0xffffff809d1e0a40, option=3, send_timeout=0) at ipc_kmsg.c:1832:10 [opt] frame #9: 0xffffff8001478a75 kernel.development`mach_msg_overwrite_trap(args=<unavailable>) at mach_msg.c:549:8 [opt] frame #10: 0xffffff80015f63a3 kernel.development`mach_call_munger64(state=0xffffff80be434b20) at bsd_i386.c:573:24 [opt] frame #11: 0xffffff8001423486 kernel.development`hndl_mach_scall64 + 22

- - - a)

AMDRadeonX4000_AMDAccelResource::AndXorByteFlag(*this, (word*)structureInput, (byte*)structureInput +2,

(byte*)structureInput +3)

...

__text:00000000000148FC __text:00000000000148FD __text:0000000000014900

push rbp mov rbp, rsp push r15

__text:0000000000014902

push r14

__text:0000000000014904

push r13

__text:0000000000014906

push r12

__text:0000000000014908 __text:0000000000014909 __text:000000000001490A __text:000000000001490D __text:0000000000014910 __text:0000000000014913

push push mov mov mov mov

rbx

rax

r15d, edx

r12d, esi

// r12 = psi = (word*)structureInput

r13, rdi

ebx, [rdi+1D0h]

-----a)

__text:0000000000014919

cmp ebx, esi

__text:000000000001491B

ja short loc_1498B

--- omitted code ---

__text:000000000001498B loc_1498B:

; CODE XREF: AMDRadeonX4000_AMDAccelResource::AndXorByteFlag(ushort,uchar,uchar)+1Fj

__text:000000000001498B

mov eax, 0E00002BDh

__text:0000000000014990

cmp ebx, r12d

__text:0000000000014993

jbe short loc_149AD

__text:0000000000014995

mov rax, [r13+1C8h] //here, rax is the value which rdi+0x1c8 point to a buffer start address

-----b

__text:000000000001499C

movzx edx, r12w

// edx = r12w

----c)

__text:00000000000149A0

and r15b, [rax+rdx] // oob here crash point2. ---d)

__text:00000000000149A4

xor r15b, cl

__text:00000000000149A7

mov [rax+rdx], r15b

__text:00000000000149AB

xor eax, eax

__text:00000000000149AD

__text:00000000000149AD loc_149AD:

; CODE XREF: AMDRadeonX4000_AMDAccelResource::AndXorByteFlag(ushort,uchar,uchar)+97j

__text:00000000000149AD

add rsp, 8

__text:00000000000149B1

pop rbx

--- omitted code ---

__text:00000000000149BB __ZN31AMDRadeonX4000_AMDAccelResource14AndXorByteFlagEthh endp

CVE-2019-8616 - Execute Arbitrary Code bug in Intel Graphics Driver
(lldb) bt * thread #1, stop reason = signal SIGSTOP
* frame #0: 0xffffff8012ba4050 kernel.development`memcpy + 11 frame #1: 0xffffff7f98f0358b AppleIntelHD5000Graphics`IntelAccelerator::newGTT(unsigned int**, bool, IGAccelTask&) + 173 frame #2: 0xffffff7f98eebce8 AppleIntelHD5000Graphics`IntelPPGTT::init(IntelAccelerator&, bool, IGAccelTask&) + 24 frame #3: 0xffffff7f98ef47dc AppleIntelHD5000Graphics`IGAccelTask::prepare(IntelAccelerator&) + 38 frame #4: 0xffffff7f98f0348b AppleIntelHD5000Graphics`IntelAccelerator::createUserGPUTask() + 219 frame #5: 0xffffff7f98980382 IOAcceleratorFamily2`IOAccelShared2::init(IOGraphicsAccelerator2*, task*) + 48 frame #6: 0xffffff7f9899513b IOAcceleratorFamily2`IOGraphicsAccelerator2::createShared(task*) + 51 frame #7: 0xffffff7f98983921 IOAcceleratorFamily2`IOAccelSharedUserClient2::sharedStart() + 43 frame #8: 0xffffff7f98ee4e22 AppleIntelHD5000Graphics`IGAccelSharedUserClient::sharedStart() + 22 frame #9: 0xffffff7f9898191a IOAcceleratorFamily2`IOAccelSharedUserClient2::start(IOService*) + 156 frame #10: 0xffffff7f98994a1a IOAcceleratorFamily2`IOGraphicsAccelerator2::newUserClient(task*, void*, unsigned int, IOUserClient**) + 1088 frame #11: 0xffffff80133c9bc1 kernel.development`IOService::newUserClient(this=0xffffff8037dc4800, owningTask=0xffffff803be31760, securityID=0xffffff803be31760,
type=6, properties=0x0000000000000000, handler=0xffffff9214a2bd10) at IOService.cpp:5856 [opt] frame #12: 0xffffff801342ce60 kernel.development`::is_io_service_open_extended(_service=0xffffff8037dc4800, owningTask=0xffffff803be31760, connect_type=6,
ndr=<unavailable>, properties=<unavailable>, propertiesCnt=<unavailable>, result=0xffffff804e2b9bb8, connection=0xffffff9214a2bd60) at IOUserClient.cpp:3491 [opt] frame #13: 0xffffff8012dba714 kernel.development`_Xio_service_open_extended(InHeadP=0xffffff8046905504, OutHeadP=0xffffff804e2b9b7c) at device_server.c:8003 [opt] frame #14: 0xffffff8012c8c27d kernel.development`ipc_kobject_server(request=0xffffff80469054a0, option=<unavailable>) at ipc_kobject.c:359 [opt] frame #15: 0xffffff8012c58465 kernel.development`ipc_kmsg_send(kmsg=0xffffff80469054a0, option=3, send_timeout=0) at ipc_kmsg.c:1832 [opt] frame #16: 0xffffff8012c77a75 kernel.development`mach_msg_overwrite_trap(args=<unavailable>) at mach_msg.c:549 [opt] frame #17: 0xffffff8012df52c3 kernel.development`mach_call_munger64(state=0xffffff803c0fea00) at bsd_i386.c:573 [opt] frame #18: 0xffffff8012c22486 kernel.development`hndl_mach_scall64 + 22

Agenda
 Kernel Debugger Overview  The Introduction of LLDBFuzzer  Attack Surfaces on Graphic Extensions  Practice and Demo  Vulnerabilities Found  Implement a Debugger for Hackintosh  Conclusion

Why?
To fuzz in Hackintosh

Open Source Network Drivers

RTL8100.kext RTL8111.kext IntelMausiEthernet.kext
AppleIntelE1000.kext AtherosE2200Ethernet.kext

RTL8107ERTL810XRTL8139 Realtek RTL8111/8168 B/C/D/E/F/G/H 82578LM82578LC82578DM82578DC82579LM82579V I217LMI217VI218LMI218VI218LM2I218V2I218LM3I219V
I219LMI219V2I219LM2I219LM2 Intel series 82540, 82541, 82542, 82543, 82544, 82545, 82546, 82547, 82578 (P55/H55) 82579 (P67/H67) 82574L 82571 82572 82573 82574 82583 I217V
AR816xAR817xKiller E220xKiller E2400Killer E2500

SmallTree-Intel-211-AT-PCIe-GBE.kext

Intel I211

AppleIGB.kext
FakePCIID_BCM57XX_as_BCM57765. kext

Intel 82575, 82576, 82580, dh89xxcc, i350, i210 and i211 BCM57XX

FakePCIID_Intel_GbX.kext

Small Tree drivers for Intel chipset

Implement a Kernel Debugger
 Kernel Debugger is working in the polling mode  For polling mode, we should override the following functions:

Implement a Kernel Debugger
 Reverse the AppleBCM5701Ethernet extension
 Step 1: Initialize a kernel debugger object and attach it  Step 2: Enable the polling mode in the function setInputPacketPollingEnable  Step 3: Implement the pollInputPackets function  Step 4: Implement the enable() and disable() virtual methods in
IONetworkController  Step 5: Implement the sendPacket() and receivePacket() virtual methods in
IONetworkController;

pollInputPackets  receivePacket  serviceRxInterrupt

Receive Register
Reset Receive Register

Receive packet

append into msg

Enqueue
Y

N

isKDPPacket

N

isValid

Y

Replace
Copy/Replace packet

Update packet

buffer physical Addr

Copy

N

Last

packet?

Y

Check msg checksum

Encode msg with VLAN tag

Set the msg len

sendPacket Function
 it firstly allocate a packet with a data buffer;
 move the send pkt info to the newly allocate buffer and set its length;
 calling the transmitPacket to send the packet;
 calling the transmitKick function to update the related status registers;

Reference
 RTL8111::outputStart in RealtekRTL8111.cpp or  IntelMausi::outputStart function in IntelMausiEthernet.cpp

Send Packet

Copy packet to mbuf

get physical segments

prepare segment header

Checksum Operation

prepare segment header

prepare segment command bit

prepare segment command bit

Get VLAN tag and update command bit

fill data for segments

Update polling bits in register

References
 https://blog.quarkslab.com/an-overview-of-macos-kernel-debugging.html  https://developer.apple.com/library/archive/documentation/Darwin/
Conceptual/KernelProgramming/build/build.html  https://developer.apple.com/documentation/kernel/
iokerneldebugger?language=objc  https://github.com/aerror2/IntelMausiEthernetWithKernelDebugger

Agenda
 Kernel Debugger Overview  The Introduction of LLDBFuzzer  Attack Surfaces on Graphic Extensions  Practice and Demo  Vulnerabilities Founded  Implement a Debugger for Hackintosh  Conclusion

 Introduce the architecture of lldb debugger, and show our debugger fuzz implementation and usage. Also, we introduce two kinds of hidden interfaces in Graphic drivers and show how to fuzz them. Next, we introduce some bugs we have found. Last, we introduce the methodology to implement a kernel debugger base on open source network driver.

 Moony Li
 E-mail: 411527096@qq.com  Twitter: @Flyic
 Lilang Wu
 E-mail: 574407955@qq.com  Twitter: @Lilang_Wu

Questions?

