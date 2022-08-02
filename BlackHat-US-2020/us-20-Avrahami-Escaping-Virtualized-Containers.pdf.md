Escaping Virtualized Containers
Yuval Avrahami Palo Alto Networks

Agenda
 Containers 101  Kata Containers
 Virtualized Containers Runtime
 Break out of the Container
 Container Escopology
 Escape the VM  Takeaways

Classic Containers

vs

Kata

Containers

Container

Host

Container Guest VM

Containers

Restricted processes running in a separate filesystem

Shared Kernel - a Disturbing Attack Surface
 Unlike VMs, containers share the host's Kernel  Kernel vulnerabilities may lead to breakouts
Kernel

Kata Containers
Sandboxing Containers

Kata Containers
 Virtualized Containers  Encapsulates each container
inside a lightweight VM  Simple way to sandbox
containers
 Compatible runtime for Docker & Kubernetes

Use Cases
 Untrusted or targeted workloads  Multi-tenant environments
 Cloud Service Providers

Using Kata
(container engine)
docker

(container runtime)
runc

docker

Kata runtime

Trusted Container
Untrusted Container
Guest VM

$ docker run --runtime=kata ubuntu bash

Host
docker
Run a ctr config={...}
kata-runtime

Guest

image

image

Shared Directory

Spawn a VM

Virtual Machine Monitor
Qemu / Cloud Hypervisor (Intel) / Firecracker (Amazon)

Host
docker
config={...}
kata-runtime

Guest
Container kata-agent

image

image

Shared Directory

Virtual Machine Monitor
Qemu / Cloud Hypervisor (Intel) / Firecracker (Amazon)

Let's Escape!

Why?
 Fun and challenging
 Two isolation layers to break
 Learn about container security

Attack Scenarios
 Enterprises use Kata to contain untrusted / targeted containers
 We're that untrusted container
 Cloud Service Providers use Kata to segregate containers from different customers
 We're the evil customer running a malicious container

The Plan
 Escape the container  Break out of the VM

Malicious Container
Guest VM
Host

Scope
 Kata Containers is highly configurable
 Vulnerabilities won't work in every config, targeting standard
 Focus on simple single-container guests under Docker
 K8s+kata vulnerable to issues, exploitation gets complex
 Not an indictment against Kata

Escape the Container

Escape the Container
 Don't rely on a guest kernel privilege escalation
 Find a Kata-native issue

Malicious Container
kata-agent Guest Kernel

Container Escapology
In a nutshell

The Usual Suspects

config (what restrictions)

containerize

{ns, caps...}

engine

runtime

cmd

Container Escapology (in a nutshell)

config (what restrictions)

containerize

{ns, caps...}

engine

runtime

cmd

1) Setup of the containerized process (runtime issue)
 Untrusted variables: image, cmd, existing ctr
2) Running container isn't restricted enough (engine issue)
 Permissive engine defaults, new breakout technique

Kata Modifies the Container's Config
 Kata changes the config received from engine
 Config generated on host needs to adjusted for VM
 That's dangerous!

docker

Modifies configuration to suit VM

kata

config:

runtime

ns, cgroups, etc

Modified config

Container
kata-agent Guest VM

Malicious
Kata Modifies the Container's Config Container

 Kata discards several cgroups

kata-agent Guest Kernel

 Host and guest have different hardware resources

 Some cgroups don't make sense it the the guest

 blkio, device

 Cgroups are mainly about denying DoS

 Container DoSing the guest isn't an issue

Device cgroup
Not only DoS

Device cgroup
 Restricts container's access to system's devices  Kata doesn't enforce  What guest device can interest us?
 The hard disk!

Accessing Hard Disk / Block Devices?
 Container has CAP_MKNOD but no CAP_SYS_ADMIN - can't mount

Direct Device Access
 Directly reading / writing to device file
 Normally used to debug and fix corrupted hard disk  debugfs - ext2/3/4 filesystem debugger

Container can Modify Guest Hard Disk

 Did we breakout?  Not so fast
 Page cache and dentry cache
 Device-level changes may not be seen by guest processes!

Malicious Container
kata-agent Guest VM
Guest Hard Disk

Page & Dentry Cache

A

A

A

A

P

P

P

P

P

P

P

P

read(file) exec(bin) mmap(lib) getdents(dir)

cache hit cache miss

VFS

kata-agent

systemd

C T R

Guest Kernel
Guest outside ctr is static...

Not invoking new files

debugfs write(dev-file)

Userspace

Kernel

cache fetch

Page Cache
sh

Dentry Cache

Hard Disk

sh

Gaining Execution on Guest
 Guest is static - need to replace a running executable
 kata-agent, systemd  But those are already loaded to the page cache
 Force the guest kernel to free the page cache

Gaining Execution on Guest - Freeing Cache
 Container allocates small chunks of memory

Guest memory

Guest memory

Ask for a lot of memory

Used memory
kata-agent Page Cache

Small chunks

Used memory
kata-agent Page Cache

Container-to-Guest Attack

Our malicious container runs under Kata

CTR

kata-agent kata-agent kata-agent

Guest VM
Guest Page Cache
Guest Hard Disk

1. Container overwrites kata-agent on hard disk with malicious binary

evil CTR

kata-agent kata-agent kata-agent

Guest VM
Guest Page Cache
Guest Hard Disk

2. Container allocates small chunks to clear kata-agent from page cache

evil

malloc() malloc() ...

CTR

kata-agent kata-agent

Guest VM
Guest Page Cache
Guest Hard Disk

3. Execution passes back to kata-agent, kernel must read kata-agent binary from disk

evil CTR

kata-agent kata-agent kata-agent

Guest VM
Guest Page Cache
Guest Hard Disk

4. Kata-agent process now maps to our malicious binary

evil CTR

kata-agent kata-agent kata-agent

Guest VM
Guest Page Cache
Guest Hard Disk

Replacing a process binary mid-execution is tricky!

1. Container overwrites kata-agent on hard disk with garbage data
2. Container overwrites a non-cached binary -e.g. systemd-shutdown

evil CTR

kata-agent

Guest VM

kata-agent kata-agent

shutdown

Guest Page Cache
Guest Hard Disk

3. Container allocates small chunks to clear kata-agent from page cache

evil

malloc() malloc() ...

CTR

kata-agent

Guest VM

kata-agent

shutdown

Guest Page Cache
Guest Hard Disk

4. Execution passes back to kata-agent, kernel must read kata-agent binary from disk

evil CTR

kata-agent

Guest VM

kata-agent kata-agent

shutdown

Guest Page Cache
Guest Hard Disk

5. kata-agent process now maps to garbage data, and crashes

evil CTR

kata-agent

Guest VM

kata-agent kata-agent

shutdown

Guest Page Cache
Guest Hard Disk

6. A shutdown sequence is started, calling systemd-shutdown

evil CTR

kata-agent kata-agent

Guest VM

shutdown

Guests Page Cache
Guest Hard Disk

6. A shutdown sequence is started, calling systemd-shutdown

evil CTR

kata-agent kata-agent

Guest VM

shutdown shutdown

Guest Page Cache
Guest Hard Disk

7. Our malicious systemd-shutdown runs on the guest as root!

evil CTR

shutdown

Guest VM

kata-agent kata-agent

shutdown shutdown

Guest Page Cache
Guest Hard Disk

PoC
 Malicious systemd-shutdown will create a guest-is-now-malicious file in shared dir

Demo: container-to-guest escape

Container-to-Guest Breakout
 Breakout technique exploiting direct device access
 If you modify a container's config, you better be adding restrictions
 Container needs CAP_MKNOD
 Default in docker & k8s+containerd, not in k8s+crio
 CVE-2020-2023

Malicious Container
Guest VM
Host

Escaping the VM

VM Attack Surface
 kata-runtime parsing of kata-agent msgs

Host

Container

kata runtime

kata-agent

Shared Directory

Virtual Machine Monitor
Qemu / Cloud Hypervisor / Firecracker

Malicious Guest

VM Attack Surface
 kata-runtime parsing of kata-agent msgs  Issue with a VMM

Host

Container

kata runtime

kata-agent

Shared Directory

Virtual Machine Monitor
Qemu / Cloud Hypervisor / Firecracker

Malicious Guest

VM Attack Surface
 kata-runtime parsing of kata-agent msgs  Issue with a VMM (to be continued...)  Shared directory between the host & guest

Host

Container

kata runtime

kata-agent

Shared Directory

Virtual Machine Monitor
Qemu / Cloud Hypervisor / Firecracker

Malicious Guest

Shared Dir Attack Surface
 kata-runtime (host) operates on files in shared dir  Guest can control as much as host  Used to deliver the image to the guest

Shared Dir Attack Surface
1. kata-runtime bind-mounts ctr image to shared dir
2. Container starts 3. Container terminates
4. kata-runtime unmounts ctr image from shared dir
Both mount and unmount follow symlinks!

Unmount Redirection Guest-to-Host DoS

Unmount Redirection Attack

kata runtime

Malicious Container
evil

Shared Directory

Unmount Redirection Attack

kata runtime

Malicious Container
evil
symlink($id/rootfs, $target-on-host)
Shared Directory

Unmount Redirection Attack

kata runtime
umount($id/rootfs)

evil
symlink($id/rootfs, $target-on-host)

Shared Directory

Unmount - Guest-to-Host DoS
 Targeting `/' unmounts all mount points underneath it
 /proc, /sys, /dev, /tmp
 Host is unusable, can no longer run containers  CVE-2020-2024

Demo Guest-to-Host DoS

Image Mount Redirection Guest-to-Host RCE

Mount Redirection Attack

kata runtime

CreateSandbox sbx-id = XYZ

kata-agent

Shared Directory

Mount Redirection Attack

kata runtime

CreateSandbox sbx-id = XYZ

kata-agent
symlink(XYZ/rootfs, $target-on-host)

Shared Directory

Mount Redirection Attack

kata runtime

CreateSandbox sbx-id = XYZ

bind-mount($img, XYZ/rootfs)

Ack kata-agent
symlink(XYZ/rootfs, $target-on-host)

Shared Directory

Mount Redirection Attack

kata runtime

Attack requires guest

to be compromised

kata-agent

before container runs!

Shared Directory

Cloud Hypervisor

Cloud Hypervisor (CLH)
 One of the the 3 VMMs options  Kata didn't work after container-to-guest PoC on CLH  Inspected VM image, kata-agent had garbage data!

Cloud Hypervisor (CLH)
 One of the the 3 VMMs options  Kata didn't work after container-to-guest PoC on CLH  Inspected VM image, kata-agent had garbage data!

Malicious Container
kata-agent
Guest Hard Disk Cloud Hypervisor

VM image

Cloud Hypervisor
 One of the the 3 VMMs options  Kata didn't work after container-to-guest PoC on CLH  Inspected VM image, kata-agent had garbage data!

Malicious Container
kata-agent
Guest Hard Disk Cloud Hypervisor

VM image

Guest-to-Future-Guests RCE (CVE-2020-2025)
 Kata+CLH commits guest HD changes to VM image  A malicious guest can control all future sandboxes!
 By defaults, all VMMs use the same VM image
 That's bad for multi-tenancy

Malicious Container
kata-agent
Guest Hard Disk Cloud Hypervisor

VM image

Good Container
kata-agent
Guest Hard Disk Firecracker/QEMU

Back to Redirecting Image Mount
 Guest needed to be compromised before ctr runs  Malicious VM image = Guest malicious from boot
 Can create the malicious symlink!

Container-to-Host Code Execution
CVE-2020-2023 (Container-to-Guest) CVE-2020-2025 (CLH commits to VM image) CVE-2020-2026 (Mount Redirection)

Host

kata-runtime

Cloud Hypervisor VM image

Guest
Malicious Container kata-agent
Guest VM Guest Hard Disk

Host

kata-runtime

Cloud Hypervisor VM image

Guest
Malicious Container kata-agent
Guest VM Guest Hard Disk
Container overwrites kata-agent binary on disk
(CVE-2020-2023)

Host

kata-runtime

Cloud Hypervisor VM image

Malicious kata-agent committed to VM image
(CVE-2020-2025)

Guest
Malicious Container kata-agent
Guest VM Guest Hard Disk

Host

kata-runtime

Cloud Hypervisor VM image

Guest
Malicious Container kata-agent
Guest VM Guest Hard Disk

Next time the malicious container is run, the guest runs a our evil kata-agent

Second Guest Redirects Mount

kata runtime

CreateSandbox sbx-id = XYZ

kata-agent
symlink(XYZ/rootfs, $target-on-host)

Shared Directory

Second Guest Redirects Mount

kata runtime

CreateSandbox sbx-id = XYZ

bind-mount($img, XYZ/rootfs)

Ack kata-agent
symlink(XYZ/rootfs, $target-on-host)

Shared Directory

Demo: Container-to-Host Code Execution
CVE-2020-2023 (Container-to-Guest) CVE-2020-2025 (CLH commits to VM image) CVE-2020-2026 (Mount Redirection)

Got Code Execution on Host!

Shared Directory is a Big Attack Surface
 Issues with host apps using it
 mount & unmount redirection (CVE-2020-2024/6)
 Vulnerabilities within the mechanism itself
 Virtio-fs daemon - Ctr-to-Host DoS (CVE-2020-10717)

Summary of Vulnerabilities

 Container to Guest, device access, RCE

 Guest to Host, umount, DoS

 Guest to future Guests on CLH, RCE

 Guest to Host, mount, RCE

 Container to Host, virtio-fsd, DoS

Malicious Container

Guest VM

Host

Disclosure
 All issues were responsibly disclosed and fixed by Kata Containers maintainers
 CVE-2020-2023, CVE-2020-2024, CVE-2020-2025, CVE-2020-2026
 Read more at https://github.com/kata-containers/community/tree/master/V MT/KCSA

Takeaways
 Containers are only as secure as their configuration
 Apply best practices
 User namespaces / run as non-root
 Drop unused privileges
 Who really needs CAP_MKNOD?
 Sandboxes limit the attack surface, but aren't magic
 Enhancement, not a replacement  Enable security features
 Kata integrity checks

Questions?

DAX (simplified)

kata-agent

Process memory is directly mapped to device

DAX = Direct Device Access

Hard Disk

C T R
debugfs

Userspace Kernel

