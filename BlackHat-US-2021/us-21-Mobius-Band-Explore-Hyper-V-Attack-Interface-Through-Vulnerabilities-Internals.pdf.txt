Mobius Band: Explore Hyper-V Attack Interface through Vulnerabilities Internals
 Zhenhao Hong (@rthhh17) Ant Group Light-Year Security Lab, Ex-researcher @IceSword Lab, Qihoo 360
 Chuanjian Liao IceSword Lab, Qihoo 360
#BHUSA @BlackHatEvents

whoami

· Zhenhao Hong (@rthhh17)
· @Ant Group Light-Year Security Lab
· Ex-researcher @IceSword Lab, Qihoo 360
· Awarded the 2019-2020 MSRC Most Valuable Security Researchers

· Chuanjian Liao
· Technical Director @IceSword Lab, Qihoo 360

#BHUSA @BlackHatEvents

Agenda
· Hyper-V Architecture · Hyper-V Guest and Host Communication · Why Hyper-V is difficult · Vulnerabilities Details · Attack Interface · Concluding Thoughts

#BHUSA @BlackHatEvents

Hyper-V Architecture
#BHUSA @BlackHatEvents

Architecture
Root Partition VMWPs (Ring 3)
Ring 0 Host Drivers
VMBUS

Child Partition Ring 3 Ring 0
Guest Drivers
VMBUS

Hypervisor (Ring -1)

#BHUSA @BlackHatEvents

Architecture - Hypervisor
Hypervisor

hvix64.exe (Intel CPU)

hvax64.exe (AMD CPU)

Memory Management
VM-Exit Handlers

MSRs Virtualization Nested Virtualization

APIC Virtualization etc...
#BHUSA @BlackHatEvents

Architecture - VMBUS
Host Kernel Space(Ring 0) VMBUS Host
vmbusr.sys vmbkmclr.sys
winhvr.sys

Guest Kernel Space(Ring 0) VMBUS Guest
Linux : hv_vmbus.ko
Windows : vmbus.sys vmbkmcl.sys winhv.sys

NT (ntoskrnl.exe)

Guest Kernel

Hypervisor Ring -1 (hardware)

#BHUSA @BlackHatEvents

Architecture ­ Host Drivers

Network Virtualization vmswitch.sys vmsproxy.sys
vmsproxyhnic.sys
PCI Virtualization vpcivsp.sys

Host Drivers
VMBUS

Storage Virtualization storvsp.sys
vhdparser.sys vhdmp.sys
hvsocket hvsocket.sys hvsocketcontrol.sys
#BHUSA @BlackHatEvents

Architecture - VMWPs
vmconnect.exe (Virtual Machine Connection)
socket
VMWP.exe (Virtual Machine Worker Process)

Virtual Machine Integration Service

Dynamic Memory Controller

VM UI Devices

vmiccore.dll vmicvdev.dll

vmdynmem.dll

vmuidevices.dll

I/O Write

etc...
VMBUS

I/O Read

#BHUSA @BlackHatEvents

Hyper-V Guest and Host Communication
#BHUSA @BlackHatEvents

Communication
VMBUS initialize in Linux Guest.

#BHUSA @BlackHatEvents

Communication
VMBUS initialize in Linux Guest.

#BHUSA @BlackHatEvents

Communication
VMBUS device initialize. vmbus_open

alloc_pages hv_ringbuffer_init

Allocate continuous pages for VMBUS ringbuffer.

VMBUS ringbuffer initialize.

vmbus_open
vmbus_establish_gpadl
Establish a GPADL for the specified buffer. Use vmbus_post_msg send CHANNELMSG_GPADL_HEA DER & CHANNELMSG_GPADL_BOD Y message to Host

CHANNELMSG_OPEN CHANNEL
Use vmbus_post_msg send CHANNELMSG_OPENCHAN NEL message to Host

#BHUSA @BlackHatEvents

Communication
Send data to Host : vmbus_sendpacket
guestdata

hv_ringbuffer_write hv_signal_on_write
vmbus_setevent vmbus_set_event hv_do_fast_hypercall8

#BHUSA @BlackHatEvents

Communication
Send data to Host : vmbus_sevmncdallpacket
guestdata

hv_ringbuffer_write hv_signal_on_write
vmbus_setevent vmbus_set_event hv_do_fast_hypercall8

#BHUSA @BlackHatEvents

Communication
Receive data form Host : vmbus_on_event
#BHUSA @BlackHatEvents

Communication
Receive data form Host : vmbus_on_event
#BHUSA @BlackHatEvents

Communication
VMBUS in Host
There are two functions, vmbkmclr!KmclpVmbusManualIsr and vmbkmclr!KmclpVmbusIsr
vmbkmclr!KmclpVmbusIsr : distribute guest data to Host driver. (storvsp.sys vmswitch.sys ...)
vmbkmclr!KmclpVmbusManualIsr : distribute guest data to host usermode component. (vmuidevices.dll vmdynmem.dll vmicvdev.dll ...)
#BHUSA @BlackHatEvents

Communication
Data path to Ring0 (vmbkmclr!KmclpVmbusIsr) For example, storvsp.sys

Guest data

Guest data Size

#BHUSA @BlackHatEvents

Communication
Data path to Ring3 (vmbkmclr!KmclpVmbusManualIsr) For example, vmiccore.dll
#BHUSA @BlackHatEvents

Communication
Data path to Ring3 (vmbkmclr!KmclpVmbusManualIsr) For example, vmiccore.dll
#BHUSA @BlackHatEvents

Communication
Data path to Ring3 (vmbkmclr!KmclpVmbusManualIsr) For example, vmiccore.dll
#BHUSA @BlackHatEvents

Why Hyper-V is difficult
#BHUSA @BlackHatEvents

Compare with Win32k!EngRealizeBrush Integer Overflow (MS17-017)
win32k!EngRealizeBrush Integer Overflow Exploit
CreateBitmap allocate Bitmap object(size can be controlled) RegisterClassEx allocate LpszMenuName object(Pool feng-shui for ENGBRUSH
object) CreatePalette allocate Palette object(size can be controlled & abuse object
gaining memory R/W) DeleteObject & UnRegisterClass control object free(Pool feng-shui) We can control the content of Bitmap objects and Palette objects.(Construct
memory R/W)
#BHUSA @BlackHatEvents

Compare with Win32k!EngRealizeBrush Integer Overflow (MS17-017)

Traditional EoP

Hyper-V Exploit

Attack Interface

· ·

Lots of APIs. Ring0 read data from User-Mode address directly.

· ·

No APIs. All data is transmitted via VMBUS, Ring0 unable to read data from Guest memory space directly.

· Lots of objects can be abused so far.

Object Allocate · Allocate & Free kernel Object is easy control.

& Free

· Construct memory R/W by control the content of

kernel objects.

· No suitable object for abuse.(Still Finding...) · Unable to control object Allocate & Free directly. · Unable to control the timing of object Allocate &
Free.(Because of VMBUS mechanism) · There is very little content in the object that can be
controlled from Guest.

TOC/TOU

· Have a User-Mode pointer. · Fetch the pointer(User-Mode memory) more than
once.

· All data is transmitted via VMBUS, Ring0 unable to read data from Guest memory space directly.

#BHUSA @BlackHatEvents

Vulnerabilities details
#BHUSA @BlackHatEvents

CVE-2019-0620

#BHUSA @BlackHatEvents

CVE-2019-0620
Root cause : Into vmbkmclr!VmbChannelPacketComplete twice with SAME first parameter.
#BHUSA @BlackHatEvents

CVE-2019-0620
bp storvsp!VstorCompleteScsiRequest+0x2d7 "r @rcx;k;r @$thread;!pool @rcx;.echo ; g"
Trigger this issue, and see what happened in WinDbg.
#BHUSA @BlackHatEvents

CVE-2019-0620
bp storvsp!VstorCompleteScsiRequest+0x2d7 "r @rcx;k;r @$thread;!pool @rcx;.echo ; g"
Trigger this issue, and see what happened in WinDbg.
#BHUSA @BlackHatEvents

CVE-2019-0620
bp storvsp!VstorCompleteScsiRequest+0x2d7 "r @rcx;k;r @$thread;!pool @rcx;.echo ; g"
Trigger this issue, and see what happened in WinDbg.
#BHUSA @BlackHatEvents

CVE-2019-0620
The following Stack Backtrace can be trigger in normal procedure.
#BHUSA @BlackHatEvents

CVE-2019-0620
The following Stack Backtrace can be trigger only vhdmp! VhdmpiPerformExtraScsiActions second parameter offset 0x08's memory is not NULL.
#BHUSA @BlackHatEvents

CVE-2019-0620
The following Stack Backtrace can be trigger only vhdmp! VhdmpiPerformExtraScsiActions second parameter offset 0x08's memory is not NULL.
#BHUSA @BlackHatEvents

CVE-2019-0620
vhdmp!VhdmpiPerformExtraScsiActions second parameter offset 0x08's memory is set by vhdmp!VhdmpiCompleteOffloadRequest
2
#BHUSA @BlackHatEvents

CVE-2019-0620
vhdmp!VhdmpiPerformExtraScsiActions second parameter offset 0x08's memory is set by vhdmp!VhdmpiCompleteOffloadRequest
2
#BHUSA @BlackHatEvents

CVE-2019-0620
vhdmp!VhdmpiPerformExtraScsiActions second parameter offset 0x08's memory is set by vhdmp!VhdmpiCompleteOffloadRequest
2
vhdmp!VhdmpiPerformExtraScsiActions second parameter offset 0x08's memory is *(_QWORD *)(v20 + 0x20)
#BHUSA @BlackHatEvents

CVE-2019-0620
In vhdmp!VhdmpiCompleteOffloadRequest, where is *(struct VHD_SCSI_REQUEST **)(v6 + 0x58) be set?
#BHUSA @BlackHatEvents

CVE-2019-0620
In vhdmp!VhdmpiCompleteOffloadRequest, where is *(struct VHD_SCSI_REQUEST **)(v6 + 0x58) be set.
Guest Data
#BHUSA @BlackHatEvents

CVE-2019-0620
vhdmp!VhdmpiOffloadTableInsertLocked will insert an _VHD_OFFLOAD_OP object into OffloadTable.
vhdmp!VhdmpiScsiCommandWriteUsingToken will invoke vhdmp!VhdmpiOffloadTableInsertLocked.
#BHUSA @BlackHatEvents

CVE-2019-0620
vhdmp!VhdmpiOffloadTableInsertLocked will insert an _VHD_OFFLOAD_OP object into OffloadTable.
vhdmp!VhdmpiScsiCommandWriteUsingToken will invoke vhdmp!VhdmpiOffloadTableInsertLocked.
#BHUSA @BlackHatEvents

CVE-2019-0620
vhdmp!VhdmpiOffloadTableInsertLocked will insert an _VHD_OFFLOAD_OP object into OffloadTable.
vhdmp!VhdmpiScsiCommandWriteUsingToken will invoke vhdmp!VhdmpiOffloadTableInsertLocked.
#BHUSA @BlackHatEvents

CVE-2019-0620
vhdmp!VhdmpiOffloadTableInsertLocked will insert an _VHD_OFFLOAD_OP object into OffloadTable.
vhdmp!VhdmpiScsiCommandWriteUsingToken will invoke vhdmp!VhdmpiOffloadTableInsertLocked.
#BHUSA @BlackHatEvents

CVE-2019-0620

Guest Data

vhdmp!VhdmpiOffloadTableInsertLocked will insert an

_VHD_OFFLOAD_OP object into OffloadTable.

vhdmp!VhdmpiScsiCommandWriteUsingToken will invoke vhdmp!VhdmpiOffloadTableInsertLocked.

Insert into OffloadTable
#BHUSA @BlackHatEvents

CVE-2019-0620
Use vhdmp!VhdmpiScsiCommandWriteUsingToken & vhdmp! VhdmpiScsiCommandCopyOperationAbort pair can trigger the following Stack Backtrace.
#BHUSA @BlackHatEvents

CVE-2019-0620
vhdmp!VhdmpiScsiCommandCopyOperations

v5 is outcode in PoC Code

#BHUSA @BlackHatEvents

CVE-2019-0620 v5 can be controlled by Guest
vhdmp!VhdmpiScsiCommandCopyOperations

v5 is outcode in PoC Code

#BHUSA @BlackHatEvents

CVE-2019-0620
PoC Code

#BHUSA @BlackHatEvents

CVE-2019-0620
PoC Code

0x11 : vhdmp!VhdmpiScsiCommandWriteUsingToken 0x1C : vhdmp!VhdmpiScsiCommandCopyOperationAbort

Used for vhdmp!VhdmpiScsiCommandCopyOperationAbort Used for vhdmp!VhdmpiScsiCommandWriteUsingToken
#BHUSA @BlackHatEvents

CVE-2019-0620 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0620 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0620 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0620 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0620
Exploit thinking
· PoC has a chance to cause UAF. · Find suitable object for kernel pool Spray.
Why failed?
· No object of suitable size was found...

#BHUSA @BlackHatEvents

CVE-2019-0720

#BHUSA @BlackHatEvents

CVE-2019-0720
RtlDeleteElementGenericTableAvl's second parameter is the return value from RtlLookupElementGenericTableAvl
Delete from generic tab#lBeHaUnSdA fr@eBelackHatEvents

CVE-2019-0720
RtlDeleteElementGenericTableAvl not only deletes a specified element from a generic table, but also free the specified element.
vmbusr!ChUnmapGpadlView's second parameter is "gpadl_handle", "gpadl_handle" can be controlled by Guest Machine.
#BHUSA @BlackHatEvents

CVE-2019-0720
RtlDeleteElementGenericTableAvl not only deletes a specified element from a generic table, but also free the specified element.
vmbusr!ChUnmapGpadlView's second parameter is "gpadl_handle", "gpadl_handle" can be controlled by Guest Machine.
Reference: Linux Kernel Source Tree
#BHUSA @BlackHatEvents

CVE-2019-0720
Important information about vmbusr!ChUnmapGpadlView
vmbusr!ChUnmapGpadlView will running at a multithreaded environment; Actually Multi-core processor environment.
vmbusr!ChUnmapGpadlView second parameter controlled by Guest data(gpadl_handle), and the first parameter can be controlled by what channel we use indirectly;
#BHUSA @BlackHatEvents

CVE-2019-0720
State-1 State-2 State-3

Start State-1 State-2 State-3
End
#BHUSA @BlackHatEvents

CVE-2019-0720
· Assume the following situation:
There are two threads: ThreadA & ThreadB; Running on different CPUs. ThreadA & ThreadB will running to vmbusr!ChUnmapGpadlView at the
same time. Both of two threads call function vmbusr!ChUnmapGpadlView have
SAME parameter. ThreadA a little more faster than ThreadB.
#BHUSA @BlackHatEvents

CVE-2019-0720
· Steps ­ 1
ThreadA will first acquire the spinlock(spinlock address : v2+0x3c0) and into a critical region. (State-1)
 At the same time, ThreadB will waiting for the spinlock.

ThreadA Start

ThreadB

wait

Start

State-1

State-1

State-2

State-2

State-3 End

State-3
End
#BHUSA @BlackHatEvents

CVE-2019-0720
· Steps ­ 2
ThreadA call function RtlLookupElementGenericTableAvl and return a pointer PointerA. (State-1)
 Release the spinlock and exit the critical region.

ThreadA Start

ThreadB

wait

Start

State-1
PointerA
State-2

State-1 State-2

State-3 End

State-3
End
#BHUSA @BlackHatEvents

CVE-2019-0720
· Steps ­ 3
ThreadB acquire the same spinlock(spinlock address : v2+0x3c0) and into a critical region. (State-1)
wait
 ThreadA acquire spinlock and waiting for the spinlock. (State-2)

ThreadA Start
State-1
State-2
State-3

End

ThreadB Start
State-1
State-2
State-3 End
#BHUSA @BlackHatEvents

CVE-2019-0720
· Steps ­ 4

ThreadA Start

ThreadB call function RtlLookupElementGenericTableAvl and return a pointer PointerB. (State-1)
Release the spinlock and exit the wait critical region.
Two threads call function vmbusr!ChUnmapGpadlView have SAME parameter, PointerB == PointerA.

State-1 State-2 State-3
End

ThreadB Start
State-1
PointerB
State-2
State-3
End
#BHUSA @BlackHatEvents

CVE-2019-0720
· Steps ­ 5
ThreadA will acquire the spinlock(spinlock address : v2+0x3c0) at the second KeAcquireSpinLockRaiseToDpc and into a critical region. (State-3)
Call function vmbusr!ChDeleteGpadlViewIfUnrefer enced to free memory which PointerA points to, and delete the element(PointerA) from a generic table.
Release the spinlock and exit the critical region.

ThreadA Start
State-1

ThreadB Start
State-1

State-2
State-3
Free PointerA
End

State-2
wait
State-3
End
#BHUSA @BlackHatEvents

CVE-2019-0720
· Steps ­ 6
ThreadB will acquire the spinlock(spinlock address : v2+0x3c0) at the second KeAcquireSpinLockRaiseToDpc and into a critical region. (State-3)
Call function vmbusr!ChDeleteGpadlViewIfUnrefer enced to free memory which PointerB points to, and delete the element(PointerB) from a generic table.

ThreadA Start
State-1
State-2
State-3 End

ThreadB Start
State-1
State-2
State-3
Free PointerB
End
#BHUSA @BlackHatEvents

CVE-2019-0720
· Steps ­ 6
PointerA == PointerB vmbusr!ChDeleteGpadlViewIfUnre
ferenced will use an already freed memory's pointer as the second parameter. UAF!!!

ThreadA Start
State-1
State-2
State-3 End

ThreadB Start
State-1
State-2
State-3
Use freed PointerA
End
#BHUSA @BlackHatEvents

CVE-2019-0720
Two necessary conditions
Two non-interfering threads run to function vmbusr!ChUnmapGpadlView.
Two threads call function vmbusr!ChUnmapGpadlView have SAME parameters.
#BHUSA @BlackHatEvents

CVE-2019-0720
Fortunately the following are two threads' stack backtrace satisfy the necessary conditions.
#BHUSA @BlackHatEvents

CVE-2019-0720
Thread1 can be triggered by send NVSP_MSG1_TYPE_REVOKE_RECV_BUF nvsp_message message and CHANNELMSG_GPADL_TEARDOWN message in a guest machine.
#BHUSA @BlackHatEvents

CVE-2019-0720
Thread2 can be triggered by simulation press system reset key in a guest machine.
AND! "efi.reset_system(0, EFI_SUCCESS, 0, NULL);" can trigger an important thread to control above Thread1&Thread2 become two noninterfering threads. The following is the important thread's stack backtrace.
#BHUSA @BlackHatEvents

CVE-2019-0720
Thread2 can be trigger by simulation press system reset key in a guest machine.
AND! "efi.reset_system(0, EFI_SUCCESS, 0, NULL);" can trigger a important thread to control above Thread1&Thread2 became two noninterfering threads. The following is the important thread's stack traceback.
#BHUSA @BlackHatEvents

CVE-2019-0720
This important thread should running before Thread1&Thread2, so we should use the following codes in PoC to set function vmswitch!VmsVmNicPvtRevokeRecieveBufferWorkItem into a sleep state.
#BHUSA @BlackHatEvents

CVE-2019-0720
The principle of above code in PoC
Set function vmswitch!VmsVmNicPvtRevokeRecieveBufferWorkItem's second parameter offset 0xe0 's memory to a non-zero value, and this function will into a sleep state until offset 0xe0 's memory set to zero.
Fortunately, we can also use "efi.reset_system(0, EFI_SUCCESS, 0, NULL);" to set zero in offset 0xe0 's memory indirectly.
#BHUSA @BlackHatEvents

CVE-2019-0720
The principle of above code in PoC
Set function vmswitch!VmsVmNicPvtRevokeRecieveBufferWorkItem's second parameter offset 0xe0 's memory to a non-zero value, and this function will into a sleep state until offset 0xe0 's memory set to zero.
Fortunately, we can also use "efi.reset_system(0, EFI_SUCCESS, 0, NULL);" to set zero in offset 0xe0 's memory indirectly.
#BHUSA @BlackHatEvents

CVE-2019-0720
The principle of above code in PoC
Set function vmswitch!VmsVmNicPvtRevokeRecieveBufferWorkItem's second parameter offset 0xe0 's memory to a non-zero value, and this function will into a sleep state until offset 0xe0 's memory set to zero.
Fortunately, we can also use "efi.reset_system(0, EFI_SUCCESS, 0, NULL);" to set zero in offset 0xe0 's memory indirectly.
#BHUSA @BlackHatEvents

CVE-2019-0720 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0720 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0720 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0720 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0720 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0720 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2019-0720
Race condition : Because of VM shutdown, Host will auto recycle the VM resource. But we can also use some VM resource and do something. In this case, send a NVSP_MSG1_TYPE_REVOKE_RECV_BUF message when VM reset(efi.reset_system(0, EFI_SUCCESS, 0, NULL);).
In a word : Use Resource When Auto Recycle
#BHUSA @BlackHatEvents

CVE-2019-0720
Exploit thinking
I. Find suitable object for kernel pool Spray. II. But the time window between two threads is very short, kernel pool Spray is
not easy to succeed. III. Use interrupt to interfere with one of the threads, then cause thread switching,
increase the time window.
Why failed?
· The thread lock is a Spin Lock.
#BHUSA @BlackHatEvents

CVE-2020-16891

#BHUSA @BlackHatEvents

CVE-2020-16891

#BHUSA @BlackHatEvents

CVE-2020-16891
This vulnerability requires Windows Server category OS. Set "Network Adapter"-->"Hardware Acceleration"-->"Enable SR-
IOV" in the virtual machine settings. In the "Virtual Switch Manager", virtual network adapter should enable
"Enable single-root I/O virtualization" and select a network adapter that must support SR-IOV at the hardware level. For example, I select "Intel(R) Ethernet 10G 4P X540/I350 rNDC #2".
#BHUSA @BlackHatEvents

CVE-2020-16891
This vulnerability require Windows Server category OS. Set "Network Adapter"-->"Hardware Acceleration"-->"Enable SR-
IOV" in the virtual machine settings. In the "Virtual Switch Manager", virtual network adapter should enable
"Enable single-root I/O virtualzation" and select a network adapter that must support SR-IOV at the hardware level. For example, I select "Intel(R) Ethernet 10G 4P X540/I350 rNDC #2".
#BHUSA @BlackHatEvents

CVE-2020-16891
The issue exists in function vmwp!EmulatorVp::FlushGvaTranslationCache
#BHUSA @BlackHatEvents

CVE-2020-16891
The issue exists in function vmwp!EmulatorVp::FlushGvaTranslationCache
#BHUSA @BlackHatEvents

CVE-2020-16891
The issue exists in function vmwp!EmulatorVp::FlushGvaTranslationCache
#BHUSA @BlackHatEvents

CVE-2020-16891
 vmwp!EmulatorVp::FlushGvaTranslationCache+0x9e  vmwp!VND_HANDLER_CONTEXT::RemoveReference vmwp!Vml::VmSharableObject::DecrementUserCount
 If vmwp!VND_HANDLER_CONTEXT::RemoveReference first parameter offset-0x50's value is 1, vmwp!Vml::VmSharableObject::DecrementUserCount will free a VmbComMmioHandlerAdapter object of size 0xb0.
PS : The first parameter offset-0x50 is a reference counter's address, if the reference counter equal to 1, a VmbComMmioHandlerAdapter object will be recycled, and free a 0xb0 size heap chunk. In the following presentation, the
reference counter will be referred to as KEY_REF_COUNTER.
#BHUSA @BlackHatEvents

CVE-2020-16891
vmwp!VndCompletionHandler::HandleVndCallback can also invoke Vml::VmSharableObject::DecrementUserCount
vmwp!VndCompletionHandler::HandleVndCallback invoke Vml::VmSharableObject::DecrementUserCount to decrease an object's reference count.
 The KEY_REF_COUNTER can also be modified by function
Vml::VmSharableObject::DecrementUserCount at address vmwp!VndCompletionHandler::HandleVndCallback+0xAAE.
#BHUSA @BlackHatEvents

CVE-2020-16891
The PoC code is control vmwp.exe process runs to address vmwp!VndCompletionHandler::HandleVndCallback+0xAAE
#BHUSA @BlackHatEvents

CVE-2020-16891
The PoC code is control vmwp.exe process runs to address vmwp!EmulatorVp::FlushGvaTranslationCache+0x9e

What is virt_addr+0x1004 ?

#BHUSA @BlackHatEvents

CVE-2020-16891
The PoC code is control vmwp.exe process runs to address vmwp!EmulatorVp::FlushGvaTranslationCache+0x9e

What is virt_addr+0x1004 ?

#BHUSA @BlackHatEvents

CVE-2020-16891 debugging & trigger
#BHUSA @BlackHatEvents

CVE-2020-16891 debugging & trigger
KEY_REF_COUNTER
#BHUSA @BlackHatEvents

KEY_REF_COUNTER was decremented by 1 here.
CVE-2020-16891 debugging & trigger
KEKYE_YR_ERFE_FC_OCUONUTNETRER
#BHUSA @BlackHatEvents

KEY_REF_COUNTER was decremented by 1 here.
VmbComMmioHandlerAdapter object
CVE-2020-16891 debugging & trigger
KEYK_EKRYEE_YFR__ERCFEO_FCU_OCNUOTNUERTNETRER
#BHUSA @BlackHatEvents

KEY_REF_COUNTER was decremented by 1 here.
VmbComMmioHandlerAdapter object
CVE-2020-16891 debugging & trigger
Free VmbComMmioHandlerAdapter object here
KEYK_EKRYEE_YFR__ERCFEO_FCU_OCNUOTNUERTNETRER
#BHUSA @BlackHatEvents

KEY_REF_COUNTER was decremented by 1 here.
VmbComMmioHandlerAdapter object
CVE-2020-16891 debugging & trigger
Free VmbComMmioHandlerAdapter object here
Use freed memory
KEYK_EKRYEE_YFR__ERCFEO_FCU_OCNUOTNUERTNETRER
#BHUSA @BlackHatEvents

KEY_REF_COUNTER was decremented by 1 here.
VmbComMmioHandlerAdapter object
CVE-2020-16891 debugging & trigger
Free VmbComMmioHandlerAdapter object here
Use freed memory
KEYK_EKRYEE_YFR__ERCFEO_FCU_OCNUOTNUERTNETRER
#BHUSA @BlackHatEvents

CVE-2020-16891
Exploit thinking
· Find suitable object for heap Spray in a vmwp.exe process.
Why failed?
· Still finding...
#BHUSA @BlackHatEvents

Attack Interface
#BHUSA @BlackHatEvents

Attack Interface
VMWP.exe (Ring3)

Network
vmswitch.sys vmsproxy.sys vmsproxyhnic.sys
PCI
vpcivsp.sys

vmiccore.dll vmicvdev.dll vmuidevices.dll vmdynmem.dll
Host Kernel Space(Ring 0)

socket

vmconnect.exe Storage

R/W VMBUS Ringbuffer
R/W VMBUS Ringbuffer
vmcall

I/O write & read
R/W VMBUS Ringbuffer

storvsp.sys vhdparser.sys
vhdmp.sys

VMBUS
vmbusr.sys vmbkmclr.sys
winhvr.sys

hvsocket

R/W VMBUS Ringbuffer

hvsocket.sys hvsocketcontrol.sys

Interrupt injection

Hypervisor Ring -1 (hvix64.exe/hvax64.exe)

#BHUSA @BlackHatEvents

Attack Interface

· vmcall

· MSRs W/R

Guest Ring0

· APIC Address operation · Nested Virtual Machine

Interrupt

vmcall

Hypervisor Ring-1

· vmcall · MSRs virtualization · APIC virtualization · Nested virtualization · Guest Physical Address Translate

#BHUSA @BlackHatEvents

Attack Interface

VMCALL 0x5C HVCALL_POST_MESSAGE (vmbus_post_msg)

· CHANNELMSG_*

Guest Ring0

Interrupt

vmcall

Hypervisor Ring-1

· For example : CHANNELMSG_OPENCHANNEL CHANNELMSG_CLOSECHANNEL etc...

vmcall

Interrupt Process channel Message From Guest

Host VMBUS

· ChReceiveChannelMessage ChmOpenChannel ChmCloseChannel etc...

#BHUSA @BlackHatEvents

Attack Interface

VMCALL 0x5D HVCALL_SIGNAL_EVENT

· hv_netvsc.ko

Guest Ring0

Interrupt

vmcall

Hypervisor Ring-1

vmcall

Interrupt

Host VMBUS

Host Driver

· hv_storvsc.ko · pci-hyperv.ko

vmbus_sendpacket

· hv_sock.ko

Network :

· VmsVmNicPvtKmclProcessPacket, VmsVmNicPvtKmclProcessingComplete

Storage :

· VspPvtKmclProcessPacket, VspPvtKmclProcessingComplete

PCI :

· VirtualBusChannelProcessPacket

Hvsocket :

· VmbusTlXPartIndicateReceive

#BHUSA @BlackHatEvents

Attack Interface

VMCALL 0x5D HVCALL_SIGNAL_EVENT

· hv_utils.ko

Guest Ring0

Interrupt

vmcall

Hypervisor Ring-1

· hid_hyperv.ko, hyperv_keyboard.ko, hyperv_fb.ko · hv_balloon.ko · Remote Desktop Virtualization device

vmcall

Interrupt Integration Services :

Host VMBUS

· vmicvdev.dll vmiccore.dll

I/O read & write
VMWP.exe &
Vmconnect.exe

Keyboard, Mouse, Synthetic Video : · vmuidevices.dll Dynamic memory : · vmdynmem.dll

Remote Desktop Virtualization :

· vmconnect.exe

vmbus_sendpacket
#BHUSA @BlackHatEvents

Concluding Thoughts
#BHUSA @BlackHatEvents

Concluding Thoughts
Hyper-V still has low-hanging apples.
It makes more sense to find a way to exploit Hyper-V.
It makes sense to pay attention to Hyper-V updates. New features/new updates of some components may make it easier to find vulnerabilities. It is a easy way of Bug Hunting.
#BHUSA @BlackHatEvents

Concluding Thoughts
Potential Attack Interface
Packet Direct functions in vmswitch.sys Network Direct device PCI Pass-Through Hypervisor nested virtualization

#BHUSA @BlackHatEvents

Thank you for listening!
Twitter : @rthhh17
#BHUSA @BlackHatEvents

