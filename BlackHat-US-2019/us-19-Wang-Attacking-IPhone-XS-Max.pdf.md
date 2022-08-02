Attacking iPhone XS Max
Tielei Wang and Hao Xu

About us
· Tielei Wang and Hao Xu (@windknown) · Co-founders of Team Pangu · Known for releasing jailbreak tools for iOS 7-9 · Organizers of MOSEC (Mobile Security Conference) at Shanghai

Outline
· UNIX Socket Bind Race Vulnerability in XNU · Exploit the Bug on iPhone Prior to A12 · PAC Implementation and Effectiveness · Re-exploit the Bug on iPhone XS Max · Conclusion

Unix Domain Socket
· A UNIX socket is an inter-process communication mechanism that allows
bidirectional data exchange between processes running on the same machine.

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to write. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Connect the socket to the path. */ connect(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Write to the socket. */ write(sock, buf, 1024);
close(sock);
A simple client

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

From the kernel point of view

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

please refer to xnu source code for more details
socket socket_common socreate_internal soalloc unp_attach
From the kernel point of view

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

proc_t 
p_fd ...
struct fileglob ...
fg_data ...

struct filedesc
fd_ofiles ...

struct fileproc * 0 struct fileproc * 1 struct fileproc * 2
...
struct fileproc *

struct fileproc
... f_fglob
...

struct socket
so_proto so_pcb
 so_usecount

struct unpcb
... unp_socket unp_vnode
...

struct protosw

... pr_lock pr_unlock
...

a number of function pointers

From the kernel point of view

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

struct socket
so_proto so_pcb
 so_usecount

struct unpcb
... unp_socket unp_vnode
...

From the kernel point of view

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

bind sobindlock socket_lock unp_bind socket_unlock
From the kernel point of view

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);

Note that unp_bind is surrounded by socket_(un)lock so it is unraceable?
bind sobindlock socket_lock unp_bind socket_unlock

A simple server

From the kernel point of view

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

struct socket
so_proto so_pcb
 so_usecount

struct unpcb ...
unp_socket unp_vnode
...
struct vnode VSOCK v_socket ...

From the kernel point of view

Race Condition
· The creation of a vnode is time
consuming
· unp_bind has a temporary unlock

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

bind

This unlock makes bind raceable

sobindlock socket_lock

unp_bind

socket_unlock

vnode_create

socket_lock

vp->v_socket = unp->unp_socket; unp->unp_vnode = vp;

socket_unlock

From the kernel point of view

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);

/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);

/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));

/* Read from the socket. */ read(sock, buf, 1024);
close(sock);

Thread 1

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "2.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */
Threraeda(dsoc2k, buf, 1024);
close(sock);

bind the socket to two file paths in parallel

struct socket
so_proto so_pcb
 so_usecount

struct unpcb
... unp_socket unp_vnode
...

we can make a socket binding to two vnodes (two references)

struct vnode VSOCK v_socket ...
struct vnode VSOCK v_socket ...
bind the socket to two file paths in parallel

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

close soo_close soclose
From the kernel point of view

int sock; struct sockaddr_un name; char buf[1024]; /* Create socket from which to read. */ sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Create name. */ name.sun_family = AF_UNIX; strcpy(name.sun_path, "1.txt"); name.sun_len = strlen(name.sun_path);
/* Bind socket to the path. */ bind(sock, (struct sockaddr *)&name,
SUN_LEN(&name));
/* Read from the socket. */ read(sock, buf, 1024);
close(sock);
A simple server

One of the vnodes will hold a dangling pointer

freed memory
so_proto so_pcb
 so_usecount

freed memory
... unp_socket unp_vnode
...

struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...
From the kernel point of view

int sock; sock = socket(AF_UNIX, SOCK_DGRAM, 0);
/* Connect the socket to the path1. */ connect(sock, (struct sockaddr *)&name1,
SUN_LEN(&name)); /* Connect the socket to the path2. */ connect(sock, (struct sockaddr *)&name2,
SUN_LEN(&name));

connect 

unp_connect

Trigger UAF by connecting two names

From the kernel point of view

freed memory
so_proto so_pcb
 so_usecount

freed memory
... unp_socket unp_vnode
...

struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...
The dangling pointer in one of the vnodes will pass into socket_lock()

sock = socket(AF_UNIX, SOCK_DGRAM, 0); sock2 = socket(AF_UNIX, SOCK_DGRAM, 0);

in parallel

bind(sock, (struct sockaddr *) &server1, sizeof(struct sockaddr_un)))

bind(sock, (struct sockaddr *) &server2, sizeof(struct sockaddr_un)))

close(sock)
connect(sock2, (struct sockaddr *) &server1, sizeof(struct sockaddr_un)) connect(sock2, (struct sockaddr *) &server2, sizeof(struct sockaddr_un))
The race condition bug results in a UAF

The fix
· Fixed in iOS 12.2
· Still raceable, but adding extra checks to make sure two vnodes will only
keep one reference to the socket
· No public CVE
if(unp->unp_vnode==NULL){ vp->v_socket = unp->unp_socket; unp->unp_vnode = vp;
}

The pattern
· More and more bugs caused by temporary unlocks were discovered,
implying an important bug pattern
· CVE-2019-6205, Ian Beer, https://googleprojectzero.blogspot.com/
2019/04/splitting-atoms-in-xnu.html
· CVE-2017-6979, Adam Donenfeld, https://blog.zimperium.com/ziva-
video-audio-ios-kernel-exploit/

Outline
· UNIX Socket Bind Race Vulnerability in XNU · Exploit the Bug on iPhone Prior to A12 · PAC Implementation and Effectiveness · Re-exploit the Bug on iPhone XS Max · Conclusion

UAF, let's look at the USE

UAF, let's look at the USE
fetch and call a function pointer through two deferences to a freed socket

UAF, let's look at the USE

fetch and call a function pointer through two deferences to a freed socket

save a return address to the freed socket

Binary version may be better

fetch and call a function pointer through two deferences to a freed socket

save a return address to the freed socket

Create a number of sockets

Exploit the race condition in unp_bind to construct two vnodes holding a dangling pointer, pointing to one of the sockets
struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...

Close all the sockets, and trigger zone_gc()
struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...

a fixed or leaked heap address

Spray controllable data (fake sockets), make sure offset 0x18 in fake sockets pointing to a fixed/leaked heap address
1. Heap address leaks are not very hard on iOS
2. After spraying a large volume of data, occupying a fixed heap address is quite likely

+0x18

struct vnode
VSOCK 0 ...
struct vnode VSOCK v_socket ...

a fixed or leaked heap address
0 +0x68
If offset 0x68 in the fixed heap address is 0, the following instructions will be executed while connecting to the two vnodes

+0x18

struct vnode
VSOCK 0 ...
struct vnode VSOCK v_socket ...

a fixed or leaked heap address
0 +0x68

+0x18

Code pointer is leaked!

+0x258 returned address

struct vnode
VSOCK 0 ...
struct vnode VSOCK v_socket ...

a fixed or leaked heap address
0x4141414141414141 +0x68
If offset 0x68 in the fixed heap address is not 0, the following instructions will be executed while connecting to the two vnodes again

+0x18

struct vnode
VSOCK 0 ...
struct vnode VSOCK v_socket ...

+0x18

a fixed or leaked heap address 0x4141414141414141 +0x68
PC control is achieved. The rest of work is to chain ROP gadgets...
struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...

The exploit does NOT work on A12

(*so->so_proto->pr_lock)(so, refcount, lr_saved);

Instructions on old devices

Instructions on A12 devices

(*so->so_proto->pr_lock)(so, refcount, lr_saved);

Instructions on old devices

Instructions on A12 devices

Hijack control flow by controlling X8 Cannot hijack control flow by controlling X8

Outline
· UNIX Socket Bind Race Vulnerability in XNU · Exploit the Bug on iPhone Prior to A12 · PAC Implementation and Effectiveness · Re-exploit the Bug on iPhone XS Max · Conclusion

Much excellent research and disclosure
· Ivan Krsti. Behind the scenes of iOS and Mac Security, Blackhat USA 2019. · Brandon Azad, A study in PAC, MOSEC 2019. · Bradon Azad, https://googleprojectzero.blogspot.com/2019/02/examining-pointer-authentication-
on.html
· Ian Beer, Escaping userspace sandboxes with PAC, https://googleprojectzero.blogspot.com/2019/04/
splitting-atoms-in-xnu.html
· Marco Grassi and Liang Chen, 2PAC 2Furious: Envisioning an iOS Compromise in 2019, Infiltrate 2019. · Xiaolong Bai and Min Zheng, HackPac: Hacking Pointer Authentication in iOS User Space, Defcon 2019. · Qualcomm, https://www.qualcomm.com/media/documents/files/whitepaper-pointer-authentication-
on-armv8-3.pdf

PAC (Pointer Authentication Code)

· Introduced in ARM v8.3
· Hardware based solution for pointer integrity
· Encode authentication code in unused bits of a pointer, and verify the code
before using the pointer

25

39

a 64bits pointer

PAC (Pointer Authentication Code)

25

39

modifier

PAC* instructions

APDAKey APDBKey APIAKey APIBKey APGAKey

PAC'ed pointer

PAC (Pointer Authentication Code)
PAC'ed pointer

modifier

AUT* instructions

APDAKey APDBKey APIAKey APIBKey APGAKey

original pointer

PAC (Pointer Authentication Code)
PAC'ed pointer

modifier

AUT* instructions

APDAKey APDBKey APIAKey APIBKey APGAKey

invalid pointer with error code

(*so->so_proto->pr_lock)(so, refcount, lr_saved);
BLRAAZ = AUTIAZ + BLR Filling X8 with arbitrary code gadget, AUTIAZ will yield an invalid address, leading to a kernel panic

Outline
· UNIX Socket Bind Race Vulnerability in XNU · Exploit the Bug on iPhone Prior to A12 · PAC Implementation and Effectiveness · Re-exploit the Bug on iPhone XS Max · Conclusion

Recap
int sock; sock = socket(AF_UNIX, SOCK_DGRAM, 0); /* Connect the socket to the path1. */ connect(sock, (struct sockaddr *)&name1,
SUN_LEN(&name)); /* Connect the socket to the path2. */ connect(sock, (struct sockaddr *)&name2,
SUN_LEN(&name));

connect 

unp_connect

Trigger UAF by connecting two names

From the kernel point of view

Take another look at unp_connect
First use of the freed socket
Note that we can safely return from socket_lock, if we avoid the function pointer call

Take another look at unp_connect
Second use of the freed socket

UAF, let's look at the second USE
struct socket
so_proto so_pcb
 so_usecount
socket_unlock is very similar to socket_lock, except when so->so_usecount turns to 0

sofreelastref
· sofreelastref has a lot of cleanup, but eventually calls kfree
socket_unlock sofreelastref sodealloc FREE_ZONE kfree
The race condition bug results in a UAF The UAF results in a double free

Create a number of sockets

Exploit the race condition in unp_bind to construct two vnodes holding a dangling pointer, pointing to one of the sockets
struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...

Close all the sockets, and trigger zone_gc()
struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...

a fixed or leaked heap address
Spray controllable data (fake sockets), make sure offset 0x18 in fake sockets pointing to a fixed/leaked heap address

+0x18

struct vnode
VSOCK 0 ...
struct vnode VSOCK v_socket ...

a fixed or leaked heap address

0

0

+0x68 +0x70

Connect to the two vnodes.

Avoid invoking the two function pointers, and

go to kfree in sofreelastref.

The OSdata is freed now, as if it were a socket
struct vnode
VSOCK 0 ...

+0x18

struct vnode VSOCK v_socket ...

+0x18

a fixed or leaked heap address

0

0

+0x68 +0x70

Spray a number of OOL ports descriptors via mach_msg. Occupy the freed OSData with OOL ports buffer

mach_msg_ool_ports_descriptor_t
struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...

Free all the OSData

a fixed or leaked heap address

0

0

+0x68 +0x70

The OOL ports buffer is freed, as if it were OSData

mach_msg_ool_ports_descriptor_t
struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...

a fixed or leaked heap address
fake port
Spray a number of OSData again. Occupy the freed OOL ports buffer, and refill with a pointer pointing to a fake port struct
mach_msg_ool_ports_descriptor_t
struct vnode VSOCK 0 ...
struct vnode VSOCK v_socket ...

fake port
Build a fake kernel task object, we gain an arbitrary kernel read and write (tfp0)
Kernel

mach_port_t
Receive all the mach messages, gain a send right to a fake port
So far so good. Can we win the game without a fight with PAC?
Userspace

Got troubles while adding trust caches
· With tfp0, adding trust caches is quit straightforward on old devices
· by adding adhoc hashes, we can avoid code signature validations on our
executables
· But on A12 devices, we got a new type panic when adding hashes
panic(cpu 3 caller 0xfffffff013cb2880): \"pmap_enter_options_internal: page locked down, \" \"pmap=0xfffffff013cd40a0, v=0xffffffe04a27c000, pn=2108823, prot=0x3, fault_type=0x3, flags=0x0, wired=1, options=0x9\"
· Apparently, there are other mitigations

APRR
· More protections on kernel heap memory · Protected kernel heap memory could only be written from approved
kernel code
· New PPL* segments introduced

__PPLTEXT
· Contains code for · Pmap related functions · Code signature related functions · Trust cache related functions ·...
· Code in __PPLTEXT cannot be executed unless a special register ("#4, c15,
c2, #1) is set to 0x4455445564666677

__PPLTRAMP
· The only entry point to set the special register "#4, c15, c2, #1" to
0x4455445564666677
· Dispatch calls to functions in __PPLTEXT

tfp0's write capability for kernel image

Code
W Data

Code

Data

W

Code
__PPLTEXT
W PPLDATA

Data

W

Before iPhone 7

Since iPhone 7 (KTRR introduced)

Since iPhone XS (APRR introduced)

Adding dynamic trust caches needs a code execution

Look for unprotected control flow transfer points
· Indirected function calls · Context switches · Interrupt handlers ·...
Please refer to Brandon Azad, "A study in PAC", MOSEC 2019 for more bypass methods

thread_exception_return jumps to our eyes
· thread_exception_return is used to return a thread from the kernel to
usermode
· When eret instruction is executed, the CPU restores PSTATE from the
SPSR, and branches to the address held in the ELR.

thread_exception_return jumps to our eyes

LDR LDR LDR LDR MSR MSR ... ERET

X0, [SP,#arg_108] W1, [SP,#arg_110] W2, [SP,#arg_340] W3, [SP,#arg_340+4] #0, c4, c0, #1, X0 ; [>] ELR_EL1 (Exception Link Register (EL1)) #0, c4, c0, #0, X1 ; [>] SPSR_EL1 (Saved Program Status Register (EL1))

thread_exception_return jumps to our eyes

LDR LDR LDR LDR MSR MSR ... ERET

X0, [SP,#arg_108] W1, [SP,#arg_110]

if we can control the memory loads

W2, [SP,#arg_340]

W3, [SP,#arg_340+4]

#0, c4, c0, #1, X0 ; [>] ELR_EL1 (Exception Link Register (EL1))

#0, c4, c0, #0, X1 ; [>] SPSR_EL1 (Saved Program Status Register (EL1))

eret to arbitrary kernel address at EL1

thread_exception_return jumps to our eyes

LDR LDR LDR LDR MSR MSR ... BL .... ERET

X0, [SP,#arg_108] W1, [SP,#arg_110] W2, [SP,#arg_340] W3, [SP,#arg_340+4] #0, c4, c0, #1, X0 ; [>] ELR_EL1 (Exception Link Register (EL1)) #0, c4, c0, #0, X1 ; [>] SPSR_EL1 (Saved Program Status Register (EL1))

jopdetector

However, there is a special function

Let's check this jopdetector
jop detector is supposed to check the integrity of the saved thread context

Let's check this jopdetector
But wait, a mismatch of hash values does not lead to a panic because of an early return

What can we do
· Make a thread trapping into the kernel and waiting for return (e.g.,
waiting for a mach msg)
· Change the saved thread context (ELR_EL1 and SPSR_EL1) based on
tfp0
· Make the thread return (e.g., sending a msg) · Gain arbitrary code execution in the kernel via eret · Call ppl_ loadTrustCache (0x25) to load our own dynamic trust cache

Got ssh on iPhone XS Max

The fix

Black Hat Sound Bytes
· Temporary unlock is becoming an source of race condition bugs · PAC+PPL is great, but does not end the memory war · A good design needs a good, complete implementation

Thank you!

