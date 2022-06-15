With Friends like eBPF, who needs enemies ?
Guillaume Fournier Sylvain Baubeau
August 2021

2
About us
 Cloud Workload Security Team  Leverage eBPF to detect attacks at runtime  Integrated in the Datadog Agent

Sylvain Afchain
Staff Engineer
sylvain.afchain@datadoghq.com

Sylvain Baubeau
Staff Engineer & Team lead
sylvain.baubeau@datadoghq.com

Guillaume Fournier
Security Engineer
guillaume.fournier@datadoghq.com

BlackHat 2021

Agenda
 Introduction to eBPF  Abusing eBPF to build a rootkit
 Obfuscation  Persistent access  Command and Control  Data exfiltration  Container breakout  Detection and mitigation strategies

3
BlackHat 2021

Introduction to eBPF

4
BlackHat 2021

Introduction to eBPF
What is eBPF ?
 Extended Berkeley Packet Filter  Sandboxed programs in the Linux kernel  Initially designed for fast packet processing
 Use cases:  Kernel performance tracing  Network security and observability  Runtime security  etc

5

Falco

Tracee

BlackHat 2021

Introduction to eBPF
Step 1: Loading eBPF programs

6
BlackHat 2021

7
Introduction to eBPF
Step 2: Attaching eBPF programs

 Defines how a program should be triggered  ~ 30 program types (Kernel 5.13+)

 Depends on the program type

 BPF_PROG_TYPE_KPROBE  BPF_PROG_TYPE_TRACEPOINT  BPF_PROG_TYPE_SCHED_CLS  BPF_PROG_TYPE_XDP  etc

"perf_event_open" syscall Dedicated Netlink command

 Programs of different types can share the same eBPF maps

BlackHat 2021

8
Introduction to eBPF
eBPF internals: the verifier
The eBPF verifier ensures that eBPF programs will finish and won't crash.
 Directed Acyclic Graph  No unchecked dereferences  No unreachable code  Limited stack size (512 bytes)  Program size limit (1 million on 5.2+ kernels)  Bounded loops (5.2+ kernels)  ... and cryptic output ...
BlackHat 2021

Introduction to eBPF
eBPF internals: eBPF helpers
 Context helpers  bpf_get_current_task  bpf_get_current_pid_tgid  bpf_ktime_get_ns  etc

9
 Program type specific helpers  bpf_xdp_adjust_tail  bpf_csum_diff  bpf_l3_csum_replace  etc

 Map helpers  bpf_map_lookup_elem  bpf_map_delete_elem  etc

 Memory related helpers  bpf_probe_read  bpf_probe_write_user  etc

... ~160 helpers (kernel 5.13+)

BlackHat 2021

10
Abusing eBPF to build a rootkit
BlackHat 2021

Abusing eBPF to build a rootkit
Why ?
 Cannot crash the host  Minimal performance impact  Fun technical challenge  A growing number of vendors use eBPF  eBPF "safety" should not blind Security Administrators

Falco

Tracee

11
BlackHat 2021

Abusing eBPF to build a rootkit
Goals
 Trade off between latest BPF features / availability => Latest Ubuntu LTS, RHEL/CentOS
 KRSI and helpers such bpf_dpath may help

12
BlackHat 2021

13
Abusing eBPF to build a rootkit
Obfuscation
 Hide the rootkit process  eBPF programs are attached to a running process Our userspace rootkit has to stay resident  Detection through syscalls that accept pids as arguments : kill, waitpid, pidfd_open, ...
 Hide our BPF components:  programs  maps
BlackHat 2021

Abusing eBPF to build a rootkit
Program obfuscation
Demo

14
BlackHat 2021

Abusing eBPF to build a rootkit
Program obfuscation - Techniques
 bpf_probe_write_user  Corrupt syscall output  Minor and major page faults
 bpf_override_return  Block syscall  Alter syscall return value  But syscall was really executed by the kernel !

15
BlackHat 2021

16
Abusing eBPF to build a rootkit
File obfuscation - stat /proc/<rootkit-pid>/cmdline (1)
BlackHat 2021

17
Abusing eBPF to build a rootkit
Program obfuscation - stat /proc/<rootkit-pid>/exe (2)
BlackHat 2021

Abusing eBPF to build a rootkit
Program obfuscation
 Block signals  Hook on the kill syscall entry  Override the return value with ESRCH
 Block kernel modules

18
BlackHat 2021

Abusing eBPF to build a rootkit
BPF program obfuscation
Demo

19
BlackHat 2021

Abusing eBPF to build a rootkit
BPF program obfuscation
 bpf syscall  Programs:  BPF_PROG_GET_NEXT_ID  BPF_PROG_GET_FD_BY_ID  Maps:  BPF_MAP_GET_NEXT_ID  BPF_MAP_GET_FD_BY_ID  Hook on new prog / map to get the allocated ID
 Hook on read syscall and override the content

20
BlackHat 2021

Abusing eBPF to build a rootkit
BPF program obfuscation
 bpf_probe_write_user  message in kernel ring buffer  dmesg  journalctl -f  syscall syslog

21
BlackHat 2021

22
Abusing eBPF to build a rootkit
BPF program obfuscation
BlackHat 2021

Abusing eBPF to build a rootkit
Persistent access
 Self copy  Generate random name  Copy into /etc/rcS.d  Hide file
 Override content of sensitive files  SSH authorized_keys  passwd  crontab
 Persistent access to an application database

23
BlackHat 2021

Abusing eBPF to build a rootkit
Persistent access - uprobe
 eBPF on exported user space functions
 Alter a userspace daemon to introduce a backdoor
 Compared to ptrace  Works on all instances of the program  Safer  Easier to write

24
BlackHat 2021

Abusing eBPF to build a rootkit
Persistent access - postgresql
Demo

25
BlackHat 2021

26
Abusing eBPF to build a rootkit
Persistent access - postgresql

int md5_crypt_verify( const char *role, const char *shadow_pass, const char *client_pass, const char *md5_salt, int md5_salt_len, char **logdetail )

 md5_salt shadow_pass client_pass

MD5(role + password) MD5(shadow_pass + md5_salt)

challenge sent when user connects stored in database sent by the client

 new_md5_hash = bpf_map_lookup_elem(&postgres_roles, &creds.role);
if (new_md5_hash == NULL) return 0;
// copy db password onto the user input bpf_probe_write_user(shadow_pass, &new_md5_hash->md5, MD5_LEN);

BlackHat 2021

Abusing eBPF to build a rootkit
Command and control: introduction
 Requirements  Send commands to the rootkit  Exfiltrate data  Get remote access to infected hosts
 eBPF related challenges  Can't initiate a connection  Can't open a port
 ... but we can hijack an existing connection !

27
BlackHat 2021

28
Abusing eBPF to build a rootkit
Command and control: introduction  Setup  Simple webapp with AWS Classic Load Balancer  TLS resolution at the Load Balancer level  Goal: Implement C&C by hijacking the network traffic to the webapp
BlackHat 2021

Abusing eBPF to build a rootkit
Command and control: choosing a program type
BPF_PROG_TYPE_XDP

29 BPF_PROG_TYPE_SCHED_CLS

 Deep Packet Inspection  Ingress only  Can be offloaded to the NIC / driver  Can drop, allow, modify and retransmit
packets  Usually used for DDOS mitigation

 Deep Packet Inspection  Egress and Ingress  Attached to a network interface  Can drop, allow and modify packets  Often used to monitor & secure network
access at the container / pod level on k8s

BlackHat 2021

Abusing eBPF to build a rootkit
Command and control: choosing a program type
BPF_PROG_TYPE_XDP

30 BPF_PROG_TYPE_SCHED_CLS

 Deep Packet Inspection  Ingress only  Can be offloaded to the NIC / driver  Can drop, allow, modify and retransmit
packets  Usually used for DDOS mitigation

 Deep Packet Inspection  Egress and Ingress  Attached to a network interface  Can drop, allow and modify packets  Usually used to monitor & secure network
access at the container / pod level on k8s

Network packets can be hidden from the Kernel entirely !

BlackHat 2021

Abusing eBPF to build a rootkit
Command and control: choosing a program type
BPF_PROG_TYPE_XDP

31 BPF_PROG_TYPE_SCHED_CLS

 Deep Packet Inspection  Ingress only  Can be offloaded to the NIC / driver  Can drop, allow, modify and retransmit
packets  Usually used for DDOS mitigation

 Deep Packet Inspection  Egress and Ingress  Attached to a network interface  Can drop, allow and modify packets  Usually used to monitor & secure network
access at the container / pod level on k8s

Network packets can be hidden from the Kernel entirely !

Data can be exfiltrated with an eBPF TC classifier !
BlackHat 2021

32
Abusing eBPF to build a rootkit
Command and control: hijacking HTTP requests
BlackHat 2021

33
Abusing eBPF to build a rootkit
Command and control: hijacking HTTP requests
Demo
Sending Postgres credentials over C&C
BlackHat 2021

34
Abusing eBPF to build a rootkit
Data exfiltration
BlackHat 2021

Abusing eBPF to build a rootkit
Data exfiltration
 Multiple program types can share data through eBPF maps  Anything accessible to an eBPF program can be exfiltrated:
 File content  Environment variables  Database dumps  In-memory data  etc

35
BlackHat 2021

Abusing eBPF to build a rootkit
Data exfiltration
Demo
Exfiltration over HTTPS
Postgres credentials & /etc/passwd

36
BlackHat 2021

Abusing eBPF to build a rootkit
DNS spoofing
The same technique applies to any unencrypted network protocol ...

37
BlackHat 2021

38
Abusing eBPF to build a rootkit
Container breakout 1: escaping through a pipe
The rootkit can detect and take over pipes between 2 processes
 Kprobes and Tracepoint programs are not constrained to cgroups or namespaces  Required access:
 CAP_SYS_ADMIN (or CAP_BPF + CAP_PERFMON depending on the kernel version)  CAP_SYS_RESOURCE & CAP_NET_ADMIN & shared net namespace (optional)  Default Seccomp profile activated  Default AppArmor profile:
 Activated for the raw_tracepoint variant  Deactivated for the kprobe variant
BlackHat 2021

39
Abusing eBPF to build a rootkit
Container breakout 1: escaping through a pipe
BlackHat 2021

40
Abusing eBPF to build a rootkit
Container breakout 1: escaping through a pipe

Demo
curl https://.../my_script.sh | bash

Disclaimer: for the demo, we added CAP_NET_ADMIN, CAP_SYS_RESOURCE and shared the host network namespace to enable
C&C

BlackHat 2021

41
Abusing eBPF to build a rootkit
Container breakout 2: Docker shenanigans
The rootkit switches Docker images at runtime
 We use a Uprobe on the Docker Daemon on "ParseNormalizedNamed" to switch the Pause container image with a rogue image.
 Uprobe programs are not constrained to cgroups or namespaces  Required access:
 CAP_SYS_ADMIN (or CAP_BPF + CAP_PERFMON depending on the kernel version)  CAP_SYS_RESOURCE & CAP_NET_ADMIN & shared net namespace (optional)  Default Seccomp profile activated  Default AppArmor deactivated  The host root directory has to be shared with the container
BlackHat 2021

42
Abusing eBPF to build a rootkit
Container breakout 2: Docker shenanigans
BlackHat 2021

Abusing eBPF to build a rootkit
Container breakout 2: Docker shenanigans
Demo
Let's hit Pause for a minute

43
BlackHat 2021

Detection and mitigation

44
BlackHat 2021

Detection and mitigation
Step 1: assessing an eBPF based third party vendor
 Audit & assessment  Ask to see the code ! (GPL)  Look for sensitive eBPF patterns:  program types  eBPF helpers  cross program types communication
 Useful tool: "ebpfkit-monitor"  parses ELF files and extract eBPF related information  https://github.com/Gui774ume/ebpfkit-monitor

45
BlackHat 2021

46
Detection and mitigation
Step 1: assessing an eBPF based third party vendor

"ebpfkit-monitor" can list eBPF programs with sensitive eBPF helpers

BlackHat 2021

47
Detection and mitigation
Step 1: assessing an eBPF based third party vendor

"ebpfkit-monitor" shows suspicious cross program types communications

BlackHat 2021

Detection and mitigation
Step 2: runtime mitigation
 Monitor accesses to the "bpf" syscall  Keep an audit trail  "ebpfkit-monitor" can help !
 Protect accesses to the "bpf" syscall:  Block bpf syscalls from unknown processes  Reject programs with sensitive eBPF helpers or patterns  Sign your eBPF programs (https://lwn.net/Articles/853489)  "ebpfkit-monitor" can help !
 Prevent unencrypted network communications even within your internal network

48
BlackHat 2021

49
Detection and mitigation
Step 3: Detection & Investigation
 It is technically possible to write a perfect eBPF rootkit *  But:
 look for actions that a rootkit would have to block / lie about to protect itself  (if you can) load a kernel module to list eBPF programs  (if you can) load eBPF programs to detect abnormal kernel behaviors  monitor network traffic anomalies at the infrastructure level  Disclaimer: our rootkit is far from perfect !

* with enough time, motivation, insanity, and absolute hatred for life.

BlackHat 2021

Thanks !
"ebpfkit" source code: https://github.com/Gui774ume/ebpfkit "ebpfkit-monitor" source code: https://github.com/Gui774ume/ebpfkit-monitor

