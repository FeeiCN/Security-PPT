Fasten your seatbelts: We are escaping iOS 11 sandbox!
Min(Spark) Zheng & Xiaolong Bai @ Alibaba Security Lab

Whoami

· SparkZheng @ Twitterspark @ Weibo · Alibaba Security Expert · CUHK PhD, Blue-lotus and Insight-labs · iOS 9.3.4 & iOS 11.3.1 OverSky Jailbreak (Private)
· Xiaolong Bai (bxl1989 @ Twitter&Weibo) · Alibaba Security Engineer · Ph.D. graduated from Tsinghua University · Published papers on S&P, Usenix Security, CCS, NDSS
Alibaba Security

iOS System Overview

System
System Libs Frameworks IPC System Services
Kernel

· Application - in sandbox - few attack surfaces to kernel - only basic system info - memory info(e.g., sharedcache)
· Userland - all system info - more attack surfaces to kernel
· Kernel - Control the device

Alibaba Security

Sandbox

· Apple`s Sandbox was introduced as "SeatBelt" in MacOS 10.5 which provides the first full fledged implementation of a MACF policy.

· From its inception, the policy hooked dozens of operations. The number of hooks has been growing steadily when new system calls or newly discovered threats appeared (tables from *OS internals):

Version 34 120 211/220 300 358 459 592 763

XNU 1510 1699 2107 2422 2782 3216 3789 4570

System Version macOS 10.6 macOS 10.7 iOS 6/macOS 10.8 iOS 7/macOS 10.9 iOS 8/macOS 10.10 iOS 9/macOS 10.11 iOS 10/macOS 10.12 iOS 11/macOS 10.13

Hook Count 92 98 105 109 113 119 126/124 132/131

Alibaba Security

Sandbox Profiles
· In MacOS, profiles are visible and stored in /System/Library/Sandbox/Profiles. In iOS, the profiles were hard-compiled into /usr/libexec/sandboxd. It's hard to decode the sandbox profiles, but we can traverse all mach services to get the mach-lookup list according to the return value (e.g., through sbtool by Jonathan Levin).
Alibaba Security

Mach Service Name -> Binary
· In order to find vulnerabilities, we need to disassemble and analyze the binaries which contain the handler functions of related mach services. /System/Library/LaunchDaemons contains the configuration plist of most mach services. In the plist files, "ProgramArguments" shows the path of the binary and "MachServices"shows the related mach services.
Alibaba Security

Mach, XPC and NSXPC
· Mach messages contain typed data, which can include port rights and references to large regions of memory. XPC msg is built on top of Mach msg and NSXPC msg is built on top of XPC msg.
· Through Mach msg, sandboxed app can communicate with unsandboxed Mach (MIG) services, XPC services and NSXPC services.

sandbox APP
sandbox APP

Mach Services
XPC services
NSXPC services
Alibaba Security

XPC: Arbitrary File Move CVE-2015-7037
· com.apple.PersistentURLTranslator.Gatekeeper /System/Library/Frameworks/AssetsLibrary.framework/Support/assetsd
· This service has path traversal vulnerability that an app can mv folders outside the sandbox with mobile privilege (used in Pangu9 for jailbreak).
Alibaba Security

NSXPC: Arbitrary SQLite File Query Outside the Sandbox
· com.apple.medialibraryd.xpc (/System/Library/PrivateFrameworks/MusicLibrary.framework/Support/medialibra ryd)
POC:
· The sandboxed app can use [[connection remoteObjectProxy] beginTransactionForDatabaseAtPath] method to connect arbitrary SQLite files on the system and then use [[connection remoteObjectProxy] executeQuery] to execute SQL commands.
Alibaba Security

NSXPC: Code Execution Through fts3_tokenizer()
· Medialibraryd service has SQLite fts3_tokenizer vulnerability. · Use fts3_tokenizer('simple') to leak information:
· Use fts3_tokenizer('simple', addr) to register a callback address for the tokenizer:
Alibaba Security

NSXPC: Code Execution Through fts3_tokenizer()
· Use ``PRAGMA soft_heap_limit=0x4141414141414141"to control PC:

· This vulnerability is used in our private iOS 9.3.4 jailbreak.

Alibaba Security

Mach Service: Bluetoothd
· There are 132 functions (start from 0xFA300) in the "com.apple.server.bluetooth" Mach service of bluetoothd.

· Bluetoothd communicate with sandboxed apps and other unsandboxed processes (e.g., SpringBoard) through "com.apple.server.Bluetooth".

Bluetoothd

Apps
SpringBoard
sharingd

Alibaba Security

Mach Service: Bluetoothd
· A process can use BTSessionAttach to create a session_token for bluetoothd and then use BTLocalDeviceAddCallbacks to register a callback for event notification.

Bluetoothd

Apps

SpringBoard

0xFA300 BTSessionAttach
ses_token_1

0xFA303 BTLocalDeviceAddCallbacks with ses_token_1 and callback1 addr
invoke callback1

0xFA300 BTSessionAttach
ses_token_2

0xFA303 BTLocalDeviceAddCallbacks with ses_token_2 and callback2 addr
invoke callback2

Alibaba Security

Mach Service: Bluetoothd CVE-2018-4087 by @raniXCH
· However, Bluetoothd only uses the session token to identify the process which means we can use a sandboxed app to hijack a communication between bluetoothd and unsandboxed processes through the session token.

Bluetoothd

Apps

SpringBoard

0xFA300 BTSessionAttach
ses_token_2

0xFA303 BTLocalDeviceAddCallbacks with ses_token_2 and callback2 addr

0xFA303 BTLocalDeviceAddCallbacks with ses_token_2 and callback2 addr

invoke callback2

PC control!

Alibaba Security

Mach Service: Bluetoothd CVE-2018-4087
· The problem is the ses_token is too easy to be brute forced. It only has 0x10000 (0x0000 - 0xFFFF) possible values.

· Apple fixed this problem by adding a user_id (=arc4random()) to each session, only the process knows the user_id and bluetoothd will check the map[ses_token] == user_id.

Bluetoothd

SpringBoard

0xFA300 BTSessionAttach with user_id
ses_token_1
0xFA303 BTLocalDeviceAddCallbacks with ses_token_1 , user_id and callback1 addr
invoke callback1

User_id?

Alibaba Security

Mach Service: Bluetoothd 0-day bugs
· As we mentioned before, a user_id = arc4random() = [0x00000000-0xFFFFFFFF]. If we know the session_token, we can still hijack the communication through the user_id brute force.

· But it takes a very long long time (about 12 hours) ... · Wait...what if there are other callback registration functions without a user_id?

· Bingo! 0xFA365 BTAccessoryManagerAddCallbacks()!

Alibaba Security

Mach Service: Bluetoothd 0-day bugs
· However, after sending message to bluetoothd through BTAccessoryManagerAddCallbacks(), nothing happened!
· Finally, I found the problem. The callback event can be triggered only when the iOS device connects to a new device which means we need to trigger the callback by click the Bluetooth device manually.
Click!
Alibaba Security

Mach Service: Bluetoothd 0-day bugs
· CallBacks 1(a long long time), CallBacks 2(hard to trigger), CallBacks 3 Again! Yes, we found a new function with callbacks and it's easy to trigger!
· 0xFA329 BTDiscoveryAgentCreate() can create a callback for the discovery agent and then we can use 0xFA32B BTDiscoveryAgentStartScan() to trigger the callback without manual click!
Alibaba Security

PC Control -> Control the Process in a Classic Way
· The goal is not only control the PC pointer but the process as well.

· Next step is to create a ROP chain and do a heap spray for the target process.

· In this case, we use

ROP ROP ROP ROP

ROP ROP ROP ROP

PC

ROP ROP ROP ROP

MACH_MSGH_BITS_COMPLEX Mach msg with MACH_MSG_OOL_DESCRIPTOR memory.

ROP ROP ROP

ROP ROP ROP

ROP ROP ROP

ROP ROP ROP

· If we send the msg and don't receive the msg, the ROP chain will stay in the target's memory space persistently.

Memory

· After several tests, we can find a MAGIC_ADDR which is 0x105400000.

Alibaba Security

PC Control -> Control the Process in a Classic Way
· Controlled registers: X3,X4,X5,X19,X20. And last BR is X4:
Stack pivot ?
· Until now, we can only do BOP (JOP). But it's hard for us to control the program flow. So, we need a stack pivot to control the stack and change BOP -> ROP.
Alibaba Security

PC Control -> Control the Process in a Classic Way
· A great stack pivot gadget can be found at libsystem_platform.dylib: Control X0 -> x19 & x20

· If we can control x0, then we can control sp.

Control X0 -> x2 & x29 Control X2 -> SP RET!
Alibaba Security

PC Control -> Control the Process in an Elegant Way
· Now we can ROP (e.g., steal files, open a sandboxed IOKit userclient)!
Task port?
· But ROP is not elegant. We want the task port to control everything!
Alibaba Security

Mach Port 101
· A port provides an endpoint for IPC. Messages can be sent to a port or received from it:
· Ports can contain rights and port rights can be passed in messages. · The most important port for one process is mach_task_self(). One can control the
memory and all registers of the process through its task port.
Alibaba Security

Mach Port 101
task_port

· We can use mach_vm_allocate(target_task_port, &remote_addr, remote_size, 1) to allocate memory in a remote process.

mach_msg

· mach_vm_write(target_task_port, remote_address, local_address, length) can be used to copy data into a remote process.

process

· thread_create_running(target_task_port, ARM_THREAD_STATE64, &thread_state, stateCnt, &thread_port) can be use to create a new thread in a remote process.
· Therefore, if we can get one process's task port. We can easily control the whole process through mach msg.
Alibaba Security

Get the task port!
· Let's try to get the task port of the remote process.

Pwn app

BTd port

Launchd

Bluetoothd

Send 0x1000 ports with pwn apps's send right Send ROP through heap spray
Use vulnerability to control the pc of BTd Use ROP to send mach msgs contain mach_task_self()
Control the target process through its task port

Alibaba Security

Get the task port!
Some tricks learn from Mach_portal:
· We can use mach_port_insert_right(mach_task_self(), port, port, MACH_MSG_TYPE_MAKE_SEND) to insert a send right to the port. And this port can be send by OOL message with MACH_MSG_PORT_DESCRIPTOR type.
· In most time, mach_task_self() returns 0x103, so we can just use 0x103 without ROP (to call mach_task_self()).
· In order to send the task port to our pwn app, we need to know the port number of our pwn app. But we cannot use launchd to help us. Luckily, the port number can be guessed by (0x103+0x100*N). That's why we send 0x1000 ports to the remote process (in order to increase the successful rate).
Alibaba Security

DEMO
Remotely malloc memory in the target process:

Remotely execute functions in the target process:

Alibaba Security

iOS 11 mitigation
iOS 11 (not in macOS 10.13) extended the limit to the use of all task ports for app processes:

But ROPs always work in user mode.

Alibaba Security

Function Call Primitive
A generic primitive for function calls with arbitrary parameters in CoreFoundation:
0-N parameters : X0-X7 and stack
X8->Function Call
Return to X30
Alibaba Security

DEMO
· Attack iOS kernel through unsandboxed IOKit userclient on iOS 11.3
· Break Kernel slide and gain arbitrary kernel R/W ability on iOS 11.3:
Alibaba Security

DEMO
· Achieve root shell and jailbreak on iOS 11.3: https://www.youtube.com/watch?v=Kt5JXBvRJ5o
Alibaba Security

Conclusion
· We introduce the basic conception of iOS sandbox and summarize several classic ways to escape the iOS sandbox.
· Based on an old bluetoothd vulnerability, we find two new zero-day sandbox escape vulnerabilities on the latest iOS version.
· We present a classic way to do heap spray , stack pivot and ROP in the iOS userland.
· We show how to get and control the task port of the remote process during the exploit.
Alibaba Security

Reference
· *OS Internals & Jtool: http://newosxbook.com/ · Pangu 9 Internals: https://www.blackhat.com/docs/us-16/materials/us-
16-Wang-Pangu-9-Internals.pdf · triple_fetch by IanBeer: https://bugs.chromium.org/p/project-
zero/issues/detail?id=1247 · CVE-2018-4087: https://blog.zimperium.com/cve-2018-4087-poc-
escaping-sandbox-misleading-bluetoothd/
Alibaba Security

Thanks

