Another Road Leads to the Host: From a Message to VM Escape on Nvidia vGPU
Wenxiang Qian, Tencent Blade Team
#BHUSA @BlackHatEvents

About Me
 Wenxiang Qian (@leonwxqian)  Senior security researcher of Tencent Blade Team  Doing security research in many fields including virtualization, web browser, IoT  Interested in and studying fuzzer developing and machine learning  Book author
#BHUSA @BlackHatEvents

Tencent Blade Team
 Founded by Tencent Security Platform Department in 2017  Focus on security research in the fields of AIoT, mobile devices, cloud virtualization,
blockchain, etc  Reported 200+ vulnerabilities to vendors such as Google, Apple, Microsoft, Amazon  https://blade.tencent.com
#BHUSA @BlackHatEvents

Agenda · Introduce GPU virtualization and vGPU
· Structures of the vGPU software suite · VRPC message and how to send a message manually · Findings in VRPC handling process · Conclusion

#BHUSA @BlackHatEvents

What is GPU Virtualization?
· Allow users to share a GPU card in their own VMs
· Deliver high-performance graphics and computing power
to virtual desktops at a much cheaper cost of operation
· Used in AI, deep learning, data science, and even cloud gaming ...

https://en.wikipedia.org/wiki/GPU_virtualization

#BHUSA @BlackHatEvents

An Introduction on Nvidia vGPU
· Used in a cloud or enterprise data center server · Virtual GPUs to be shared across multiple virtual machines · Used by many famous cloud service providers (https://docs.nvidia.com/grid/cloud-service-
support.html)
· Restricted to certain datacenter and high-end Tesla, Quadro cards
#BHUSA @BlackHatEvents

The Structures of the Installers
· The installers are obtained from NVIDIA Enterprise Application Hub · Two installers for the host and the guest
· NVIDIA-Linux-x86_64-*-vgpu-kvm.run (Host) · NVIDIA-Linux-x86_64-*-grid.run (Guest)
· The nvidia.ko(both guest/host) has some open-sourced files
· Critical code logic are closed-source  *.o_binary
· Other components are closed-source
· nvidia-vgpu-mgr · libnvidia-vgpu.so.*  The "vGPU plugin"

#BHUSA @BlackHatEvents

The nvidia-vgpu-mgr
· Running as a daemon · Spawns itself when a guest machine is started*
· Not spawned if the guest is using PCI-passthrough mode or not using vGPU · Spawns only if using it as type=`mdev' (mediated device pass-through)
· Loads libnvidia-vgpu.so.* · Communicates with the driver on host · The libnvidia-vgpu.so.* is responsible with
communicating with the guest
· Process the guest call, a mechanism called `VRPC'
· Sent from the guest nvida.ko · Processed by libnvidia-vgpu.so

#BHUSA @BlackHatEvents

The libnvidia-vgpu.so.*
· The vGPU plugin · Receive and process the vGPU request · Receive data from virtio ring buffer
· VRPC message size is limited to 4096 bytes
when fetching
· Reuse same global variable of 4096 bytes to
store VRPC message
· Check if it is legit · Calls rpc_message_handler

#BHUSA @BlackHatEvents

Simplified Model

Qemu

libnvidia-vgpu.so

nvidia.ko (guest)

VF nvidia-vgpu- char dev.

IO

vfio

vgpu vfio

nvidia-vgpumgr

ioctl

Guest system

notifies

/dev/nvidiactl

...

nvidia.ko RW mapped memory (host)

Operates

/dev/nvidia0

#BHUSA @BlackHatEvents

Structure of A VRPC Message

Index (as unsigned int[]) We'll Call It...

Offset in Bytes

[0]

head[0]

0-3

[1]

...

4-7 (0x4)

[2]

8-11 (0x8)

[3]

12-15 (0xC)

[4]

16-19 (0x10)

[5]

20-23 (0x14)

[6]

24-27 (0x18)

[7]

28-31 (0x1C)

[8]

body[0]

32-35 (0x20)

[9]

body[1]

36-39 (0x24)

...

...

...

Legal Value
0x3000000 `CPRV' signature (VRPC)
Packet size VRPC command No. -1 -1 Reserved Reserved
...
#BHUSA @BlackHatEvents

How VRPC is Handled
· 1. Copy the VRPC message from ring buffer to local global buffer (4096 bytes max) · 2. Extra check if VRPC message is legit
· Check if (32 bytes < Size < 4096 bytes) · Check if signature == `CPRV' · Check if message can be parsed in current system/architecture
· 3. Call handlers to process the message · 4. Check if any error occurs during the processing
· If so, generates error message · 5. Return the result to the guest machine
#BHUSA @BlackHatEvents

Fuzzer for the Error Processing
· There's an interesting step before the message handler ends ­ Error Processing · It will create error information if the handler didn't return 0 (success)
This step
#BHUSA @BlackHatEvents

The Error Handler
· The input is the VRPC message · We extracted all structures of VRPC messages · These structures will be used in the error message processor · The rest code logic are copied as-is · The fuzzing engine will fill the fake RPC packet · Found one crash, but it is fixed in the newer version
· The structures described VRPC message one-to-one
· Helps understanding each message
· We'll upload to our GitHub repo later

#BHUSA @BlackHatEvents

Important VRPC Messages

0x1 rpc_set_guest_system_info
vgxVersionMajorNum vgxVersionMinorNum guestDriverVersionBufferLength guestVersionBufferLength guestTitleBufferLength
guestClNum guestDriverVersion
guestVersion guestTitle
0x20 rpc_alloc_share_device
hClient hDevice hClass params

0x2 rpc_alloc_root
hClient processID processName
0x35 rpc_update_pde_2
hClient hwres_hDevice
pdeBuffer params

0x1A rpc_dma_control
params dma_params
0x3C rpc_get_engine_utilization
hClient hObject
cmd Params

(We listed part of VRPC messages in this slide, check our repo to get the full list)

#BHUSA @BlackHatEvents

Locate the RPC Message Handler
· Locate this string to find the handler (We'll call it rpc_message_handler)
#BHUSA @BlackHatEvents

Get the Function Table
· rpc_message_handler ­ call different
functions according to "VRPC_msg_no (head[3])" section
· The easiest way to get the function
list is to set a breakpoint here:
· Grab the func_table and calculate their symbols

#BHUSA @BlackHatEvents

Send a VRPC Message From the Guest
· To avoid complexity, we choose to patch the guest driver nvidia.ko · We already know there's a `CPRV' signature · Search for the same signature in the guest driver · Found this preparing the VRPC message.
· It fills the VRPC message header · a2 : RPC message command number · a3 : required size (add 32 bytes for msg head later)

#BHUSA @BlackHatEvents

Send a VRPC Message From the Guest
· Using the Xref, we can find this pattern: · Function that sends VRPC msg is located
· According to the prepare_vrpc_msg, · (a2+608) is where it stores the message
· body[0] = (a2+608) + 32 · body[1] = (a2+608) + 36 · ......

#BHUSA @BlackHatEvents

Read Return Value in the Guest
· The send_vrpc_msg sends and waits for the host to return · You can read the return value here too · Here's an example of reading the return value:
Where to patch: _nv000777rm(...)
#BHUSA @BlackHatEvents

ioctl Processing in Host Kernel
· The entry of ioctl is open sourced · Filename: kernel/nvidia/nv.c · rm_ioctl is closed-source, provided by *.o_binary · Almost all the ioctl sent from the handler in vgpu-mgr
is rm_ioctl
· rm stands for "Resource Manager"

#BHUSA @BlackHatEvents

What Does the ioctl Sender Looks Like?
· Message 0x35 as an example (We'll describe it later) · It will send a struct of 64 bytes to the driver · Its command is 0x80180F, you can disassemble it easily using IOC_SIZE/IOC_NR
#BHUSA @BlackHatEvents

Is there an ASLR?
· Yes, partially
· The loaded .so and heap/stack's load address is randomized · The nvidia-vgpu-mgr is not randomized
· Main process acts like a server, child process is spawned by fork()ing · nvidia-vgpu-mgr is multi-threaded · Child process is single-thread-like if guest is in text mode · Memory layout is almost the same when the child is spawned every time · nvidia-vgpu-mgr disabled ASLR on itself
· To adapt to some old nvidia.ko logics? (which can be spotted in nvidia.ko)

#BHUSA @BlackHatEvents

Find Something to Bypass ASLR (of libnvidia-vgpu.so)
· After marked ~70% of critical functions of message handler · IDA  Produce .c file · Find code pattern in the produced .c file:
· It's writing something into VRPC buffer · The written data has one of following type:
· QWORD QWORD* void* · The written address will still be left in the return values
· 3 was found, and one of them is...
#BHUSA @BlackHatEvents

0x35 - rpc_update_pde_2 ­ Leak Stack Pointer
· Message 0x35 ­ rpc_update_pde_2 will leak a stack pointer
· Only if it survives the NvRmControl (send an ioctl)
· 64-byte structure, we used a gdb script to fuzz it
#BHUSA @BlackHatEvents

Using GDB Script to Fuzz the ioctl
· No need to fuzzing it blindly (brute forcing 64 bytes results in unrealistic 25664 tries = · Many places are using hDevice and hClient · We used Message 0x2 and 0x20 to create two fake hDevice & hClient handles · You can set e.g., hDevice = 0x77777777, hClient = 0x5555 · Two values are random placed in the 64 byte-structure
· Four Three possibilities: · [hDevice, hClient] is used · Only [hDevice] is used · Only [hClient] is used · None is used
· And we finally passed the check

)
#BHUSA @BlackHatEvents

Let's Get Some Memory Corruptions
· 0x1A - rpc_dma_control · DMA on VRPC ­ that's doubled happiness! · The DMA handler is a big function, and it generally do these things:
1. Check if DMA operation command number is legal 2. Check if handles are legit 3. Call malloc(dma_control_get_param_size(cmd)) to prepare a buffer for DMA operation 4. Call preparing function to copy data from VRPC buffer to the prepared buffer 5. Call NvRmControl to send data to nvidia.ko(host) to process data 6. Do some work after it succussed 7. Call finish function to copy data back to VRPC buffer

#BHUSA @BlackHatEvents

When It Comes to Copy...
· No restrictions on memory copy:

SKIP COPY
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21

C6370101

C6370102

#BHUSA @BlackHatEvents

A Classical Heap Buffer Overflow
· What's next to the overflown area? · An interesting heap chunk lays after the malloced buffer
· Some pointers inside this area · Set access breakpoint on them, after the VRPC returns,
this code triggered bp:
nvidia-vgpu-mgr (main binary), sub_403860

#BHUSA @BlackHatEvents

What's the Code Doing?
· Iterates over the VMA linked list, and find the one to free · After it passes the ioctl 0xC020464F · It will call "set_item_value"
nvidia-vgpu-mgr (main binary), sub_403860

#BHUSA @BlackHatEvents

set_item_value
· Let's check the most important part of this function · It removes current node from the linked list · Literally doing classical textbook: p->next->prev = p->prev; p->prev->next = p->next; · Deja-vus on old malloc's "unlink"?
#BHUSA @BlackHatEvents

Interference the Unlinking Process

· "p"(Node being unlinked) can be controlled (through buffer overflow)

· All pointers in color are controllable

p->next->prev = p->prev; p->prev->next = p->next;

· Calls mmap/munmap according to the value in p immediately after p is unlinked

· p->prev is not referred after p->prev->next
· p->prev = .mmap.got MINUS offset of "next" · p->next = 1st ROP gadget · p->prev->next = p->next overwrites .mmap.got
· But..
· p->next->prev = p->prev requires ROP gadget has RWX privilege · RWX is rarely seen now, does it exist?

p->next= p->next->prev=

For example:

44556677

ROP1

445566CD ROP1+0x56

#BHUSA @BlackHatEvents

Lots of RWX Pages
· Don't know why but its stack has RWX privilege

· The data on stack can also be treated as code · Searched stack memory for ROP gadgets, but nothing (good) found · Put the code manually

#BHUSA @BlackHatEvents

Put a ROP Gadget on Stack
· Some functions have declared very big structure on stack · 0x3C - rpc_get_engine_utilization is one of them
· Variables are 47200+ bytes deep in stack
· Puts body[6] to rsp+0xB888, then exits (return error) · Only necessary operations (to put a ROP gadget) are performed, neat & perfect!
#BHUSA @BlackHatEvents

Buffer of C6370101

How to Chain Them Together?

Fake Stack

· We'll write ROP gadget 1 on stack
· 48 89 F4 C3 MOV RSP, RSI; RET; · Stack pivot & Jump to the 2nd ROP gadget
· Set mmap.got to the address of ROP 1

Overflown area
p

· RSI is the "len" argument of mmap (addr of mmap already controlled by us)

· len is also obtained from p(QWORD)

· Set len to addr of our fake stack (overflown area after p)

· "Holes" on "stack"

· Because 0xC6370101 copies data discontinuously

#BHUSA @BlackHatEvents

Jumping Over Holes
· Holes everywhere · Holes are consisted by 4 bytes of zeros · Either it is in the data, or it is in our fake stack
· Treat it as number 0 · Using part of it as higher 4 bytes of address
(The nvidia-vgpu-mgr loads at 0x400000)
· Find a proper gadget to POP them into registers · Or just RET X to skip them

Image Source : Wikipedia #BHUSA @BlackHatEvents

Patching the Guest Kernel Driver
· Patch the guest nvidia.ko to send the
malicious VRPC message
· Painful because we need to write a lot
of MOV DWORD PTR[RAX + ..], DATA
· RAX is the addr of VRPC buffer
· And we also need to calculating lots of
addresses
· Use a program to help us calculate
and write those values

Placeholders
#BHUSA @BlackHatEvents

Trigger the Vulnerability
Method 1
Hypervisor doesn't exit when rebooting guest
· Send msg 0x02 to create a fake hDevice handle(By
replacing guest nvidia.ko with patched one)
· Reboot guest to send the VRPC message
· Send msg 0x35 to leak an address and bypass ASLR
· Reboot guest
· Send msg 0x3C to put our gadget on stack
· Reboot guest
· Send msg 0x20 to create a fake hClient handle
· Send msg 0x1A to trigger the heap data overflow, in
a row with 0x20

Method 2

Otherwise Send msg 0x02
I will call following steps as "LOAD" rmmod the nvidia_drm nvidia_modeset nvidia in the guest kill 9 the nvidia-gridd process Replace .ko file with patched one insmod the overwritten nvidia.ko sudo service start nvidia-gridd to send the VRPC message rmmod nvidia

LOAD

Send msg 0x35

LOAD

Send msg 0x3C

LOAD

Send 0x20, 0x1A in a row

#BHUSA @BlackHatEvents

#BHUSA @BlackHatEvents

Security Best Practice in Using vGPU
· Most important: Update your software regularly
· The nvidia-vgpu-mgr is running in root
· But you can use your firewall to restrict what it can do · Use Host Intrusion Prevention System (HIPS) to monitor host
· Administrator should monitor strange crashes on host machine · When there's a 0-day, some hotfix patches(work-arounds) could be applied
· For example, NOP some vulnerable functions that are not frequently used
#BHUSA @BlackHatEvents

CVEs and Timeline
· Reported Feb 2021, Fixed April 2021:
· CVE-2021-1082 - OOB Issue In Nvidia vGPU Manager · CVE-2021-1084 - OOB Issue In Nvidia vGPU Manager and Guest Kernel · CVE-2021-1087 - Information Leak In Nvidia vGPU Manager
· Another vulnerability are scheduled to be fixed in the end of July
· This talk is recorded earlier · Details of it are not mentioned in this talk due to responsible vulnerability disclosure · It's an independent vulnerability found by fuzzing, the exploit chain of this talk didn't use it
· Please refer to : https://nvidia.custhelp.com/app/answers/detail/a_id/5172 to update your software
#BHUSA @BlackHatEvents

Thank you!
Website: https://blade.tencent.com Email: blade@tencent.com
Github: https://github.com/tencentbladeteam

#BHUSA @BlackHatEvents

