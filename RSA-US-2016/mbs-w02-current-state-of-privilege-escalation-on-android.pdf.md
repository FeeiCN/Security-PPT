SESSION ID: MBS-W02
Current State of Android Privilege Escalation
#RSAC

Ryan Welton
Research at NowSecure @fuzion24Security
Marco Grassi
Security Researcher at KEEN Team Former Security Researcher at NowSecure @marcograss

#RSAC
Who are we?

Ryan Welton Twitter: @fuzion24 Security Research @ NowSecure
2

Marco Grassi Twitter: @marcograss Security Researcher at KEEN Team Former Security Researcher at NowSecure

#RSAC
What is privilege escalation?
In general, it means gain more capabilities than you were granted. Android applications run in a sandbox as separate Linux users. Applications communicate with services via IPC to accomplish things and restricted by the permission model. Escalating privileges can include gaining code execution in mediaserver (as does stagefright bugs), system_server (as system user), or the ultimate privilege escalation: root with a good selinux context.
3

Why would you want to root your device?
Devices ship very locked down Remove carrier/OEM bloatware Install custom ROM like Cyanogenmod Enable restricted features like WiFi tethering
Change the behavior of applications. Using injection framework like xposed
Remove advertisements and tracking from applications (minminguard) Restrict data on app-by-app basis (Xprivacy) Hijacking Google IAPs =D Root applications Call recorder Change/modify/backup application data Ability to inspect the device to look for (other) vulnerabilities
4

#RSAC

Privilege Escalation vulnerabilities can harm you
Malevolent applications Gain full control of the phone and run a service that connects to c&c (RAT) Encrypt all app data, images, etc. and hold hostage for Bitcoin (ransomware) Stealth stalking of user / pervasive monitoring
Report user location Monitor camera/video/audio Listen to phone calls Monitor SMS
Law enforcement Forensically look at emmc Grab private application data Sidestep lockscreen (in some cases)
5

#RSAC

#RSAC
History of Android Exploitation
Symlink/logic bugs OEM Framework bugs
Stumproot Weaksauce Samsung Keyboard RCE
Weak kernel drivers with large attack surface
MSM Camera/audio drivers QSEE driver / Diag Driver
6

#RSAC
Past Exploits
ln -s /data/ <world writable root owned file> adb reboot echo `ro.kernel.qemu=1' > /data/local.prop adb reboot ??? profit
7

#RSAC
Kernel Exploitation - Weak kernel drivers
Qualcomm has market dominance. Kernel bugs here affect most devices.
IOCTLs that result in write-whatwhere, uncontrolled mmap, out of bounds array index, etc..
These bugs in device drivers (MSM Camera) were previously touchable via an unprivileged app
8

#RSAC
Kernel Exploitation

Create a service that interacts with the device drivers. Make apps request a permission to interact with that service and not directly to the device driver.

As the device driver attack surface shrinks, we've seen a move to exploit more generic vulnerabilities: Futex bug (towel root) / UAF in linux socket (ping pong)

These bugs are touchable from within the sandbox (in the case of towelroot, a very restricted sandbox)

TOWELROOT

9

#RSAC
OEM Modifications are disastrous (1/)
Diversification in a software ecosystem is not advantageous as it is in bio ecosystem AOSP is generally much more secure than any particular OEM. Divergence from AOSP causes longer patching cycles, slower updates, and a shorter lifespan. There are advantages to being able to quickly apply and release patching cycles. Heavy modifications that deviate from AOSP require extra time and energy to patch. Practical Android Exploitation by @jcase is a good resource for OEM bugs
10

#RSAC
OEM Modifications are disastrous
Stumproot
The emmc (/dev/block/mmcblk0) is writable by "lg_fota" group The group is added to any unprivileged app by requesting the permission: "com.lge.permission.ACCESS_LGFOTA" Search the emmc and replace a few lines of one of the shell scripts init runs Reboot to root
11

#RSAC
OEM Modifications are disastrous
Weaksauce
Unix socket (/dev/socket/dmagent) ran by root process (dmagent) opens and listens to commands CopyFileCtl copies files as root from arbitrary source to arbitrary destination
12

#RSAC
OEM Modifications are disastrous
Samsung / Swiftkey Remote Code as System
Samsung signed code from Swiftkey to run as system user Blindly download and extract Zip file with directory traversal Arbitrary file write as system user Overwrite dalvik-cache for system application Remote code execution as system user
13

#RSAC
OEM Modifications are disastrous
Samsung / Swiftkey Remote Code as System
Link: https://www.youtube.com/watch?v=uvvejToiWrY
14

#RSAC
OEM Modifications are disastrous
Samsung RCE from "endpoint security"
pwn2own was won on the S5 because of OEM framework customizations. Samsung added Absolute's "persistent endpoint security" to the framework An intent from UID 1000 gains you arbitrary method invocation with arbitrary args
15

#RSAC
OEM Modifications are disastrous
Android Volume Daemon Directory Traversal
Android Secure containers did not properly sanitize the container id and followed symlinks You could use this to mount over any folder on the system
Create a symlink : /data/local/tmp/blah.asec -> /sbin/ Create and mount a container named ../../../../../data/local/tmp/blah with vdc asec create Write a patched adbd to /sbin/ adbd is ran as root by init Restart adbd and your binary is ran
16

#RSAC
OEM Modifications are disastrous
Android Volume Daemon Directory Traversal (cont'd)
selinux policy properly blocked vold directory traversal without vold being patched in 4.4.3 Motorola modified (read: broke) this policy and allowed allowing the device to affect later versions of Android than it should have. This allowed the vold directory traversal to work on later versions of android that it should have: Motorola Pie Root
17

#RSAC
OEM Modifications are disastrous
OEM bugs/backdoors on Nexus devices (cont'd)
18

#RSAC
OEM Modifications are disastrous
Loose signing keys
OEMs can sign third party applications This greatly increases the attack surface as these apps have capabilities that normal applications cannot request If these apps have issues, your device is less secure Applications are not as tightly audited as they should be
19

#RSAC
OEM Modifications are disastrous
Loose signing keys (cont'd)
Certifi-gate, presented at BH USA 2015 by Check Point Independently found by us in July in the TeamViewer application plugin for Samsung devices. The plugin is signed with the OEM keys to access permissions protected with the "signature" access level, to inject events and grab the screen. They completely screwed up the IPC authentication, relying on a custom implementation.
20

#RSAC
OEM Modifications are disastrous
Loose signing keys ­ Teamviewer
A privileged add on is signed by every OEM that `bought into' Teamviewer X509Certificate.getSerialNumber() is used to check if the calling application is `signed' properly The serialNumber of an x509 cert can be arbitrarily set -- create your app and set the serial The vuln is kind of lame as it only gains you local touch input injection and screen cap Our POC is located at github.com/fuzion24/teamviewerpoc
21

#RSAC
OEM Modifications are disastrous
Loose signing keys ­ Teamviewer (cont'd)
Cisco AnyConnect -- signed as a system app with a busybox binary it wrote to disk An BackupManagerService vulnerability was exploited that restored malicious busybox binary over the original While Cisco Anyconnect wasn't the root cause of this issue, exploitation would have been more difficult without this app being signed with more privileges
22

#RSAC
Attacking system_server
system_server runs as system user system is the closest thing to root on android
Very few resources that you can't access with system
Access GPS/Camera/Mic/SMS Can load kernel modules?!! in some cases
Large attack surface Not particularly hardened or difficult to exploit
Forked from zygote -- same memory layout as all apps
23

#RSAC
Attacking system_server (cont'd)

system_server is also a very valuable target as a stepping stone to root
After system_server exploitation, you have a much larger attack surface
@retme7 did this with CVE2014-7911 and CVE-2014-4322
app -> system_server -> kernel
24

CVE-2014-7911 is a serialization issue in system_server  exploit to get system
CVE-2014-4322 is a bug in /dev/qseecom which requires system user to access

#RSAC
Attacking system_server (cont'd) - CVE-2015-1528
Integer overflow leading to heap corruption Multi-stage exploit of heap corruption mediaserver is not forked from zygote so ASLR bypass is a bit tricky surfaceflinger runs as system but needs a better selinux context, hence the jump to system_server Paper and POC
25

#RSAC
Serialization Issues
First published issue of this kind in 2014 was CVE-2014-7911 on FD mailing list
Bug present in all Android versions prior to 5.0 system_server run as system, so if we get code exec from a regular app, we escalated our privileges It's a vulnerability in AOSP, so it's not manufacturer specific, which is great for targeting a large number of devices :)
26

#RSAC
CVE-2014-7911: Regular Behavior
27

#RSAC
CVE-2014-7911: Bug
28

#RSAC
CVE-2014-7911: Triggering the Bug
29

#RSAC
CVE-2014-7911: Long Story Short
Very good writeup by Palo Alto:
http://researchcenter.paloa ltonetworks.com/2015/01/ cve-2014-7911-deep-diveanalysis-android-systemservice-vulnerabilityexploitation/
When the Garbage Collector kicks in, it will invoke finalize() on our object, which will call destroy() native method.
30

#RSAC
Generic Patterns and Problems in those exploits
In all those serialization exploits we will face some shared problems, so it's good to come up with techniques and reuse them
The first problem is that we need to bypass some mitigations, namely DEP and ASLR.
The second problem is that we need to influence the lifecycle of an object in a remote process (trigger the garbage collection reliably to make the memory corruption more deterministic, since the GC by itself, it's not.)
31

#RSAC
DEP/ASLR
The current state of mitigations in modern exploitation (at minimum) We will use ROP to defeat DEP, as soon as we've "defeated" ASLR.
(https://en/wikipedia.org/wiki/Returnoriented_programming)
32

ASLR on Android,

#RSAC

a weak opponent (in certain situations)

We need to locate our ROP gadgets system_server forks from zygote, as does our exploit app Same memory layout, so we can use our own memory layout to find ROP gadgets and use them So ASLR is not a problem for us anymore

33

#RSAC
How to Trigger the bug deterministically
To trigger the bug, the GC in system_server must kick in. but this is initially not in our control and depends on timing. Let's force a remote GC in system_server! We will use WakeLocks.
34

#RSAC
How to Trigger the bug deterministically
Very similar to browser's Javascript tricks to force GC
35

#RSAC
We need to allocate memory in system_server
Thankfully, we can do it with several Android APIs The Palo Alto guys do it with a very restrictive API:
builder will contain our heap ROP spray. However this is a debug API, it will require very special and suspicious permission, and user interaction to be able to use it, not very good for a real world exploit.
36

#RSAC
We need to allocate memory in system_server
User interaction required One shot call, we can not do it multiples times. Why is this a problem?
37

#RSAC
Binder transaction limits
So our ROP spray will just be 1mb with this approach unfortunately because 1 transaction only. Good enough for debugging purposes, with the help of a debugger we can tweak the exploit to dereference the heap spray and start our ROP chain. Not good enough for the real world, we will see after how to improve this and bypass the limitations.
38

#RSAC
Better Heap Spray, bigger and without user interaction
Current spray is one shot, sent as a string through addTestProvider We dig into the system server code to find some suitable API that allocates memory with our content and give us control over it's lifecycle (retain/release)
39

#RSAC
WakeLock
WakeLocks are perfect for us! Used to keep the device on, they have a string identifier in which our payload will end A process with WAKE_LOCK permission (very common) can allocate and release wake locks with APIs (acquire, release)
40

#RSAC
So finally we have a bigger spray It does not require user interaction or strange permissions We have more control over it
41

#RSAC
Demos
For demo purpose, we will just create a file as system user, and we will check that it succeeded, meaning we had code execution as system and escalated our privileges Payload:
42

#RSAC
Demos
For demo purpose, we will just create a file as system user, and we will check that it succeeded, meaning we had code execution as system and escalated our privileges Payload:
43

#RSAC
Demos
Demo Time various models and versions (just to show reliability)
Nexus 7 (2012) 4.1.2, 4.2.2 Nexus 7 (2013) 4.4.4
44

#RSAC
Demos
45

#RSAC
Moar Serialization bugs - X509Certificate
Conscrypt, a Java crypto lib, keeps pointers to native objects (arguably a bad idea)
OpenSSLX509Certificate extends a class which is serializable, making it serializable
`transient' keyword in Java tells the serializer/deserializer to ignore that field
46

#RSAC
Moar Serialization bugs - X509Certificate exploit
mContext is reference counted.
When OpenSSLX509Certificate is garbage collected, the finalize method decrements *(mContext + 0x10)
We can decrement any address that has a positive integer value
Write pointer to first ROP gadget over native function pointer callback
47

#RSAC
Moar Serialization bugs - X509Certificate exploit
This bug is even easier to exploit than -7911. When we trigger the function pointer pointing to our first ROP gadget, our ROP payload is pointed to by a register -- no need to heap spray We can find which register points to our buffer and which addresses our gadgets our at in our own process
48

#RSAC
Even Moar! Serialization Issues
There are still other unpatched issues related to deserialization in AOSP. Crash PoC demo on Android M 6.0 running on Nexus 7 2013. Responsibly disclosed, fix is on the way. It got low priority because reliable memory corruption was not achieved. Thanks to @flanker_hqd for the help on the PoC!
49

#RSAC
Quick Demo
50

#RSAC
We still need to go from system to root right?
From system_server we have more attack surface, in fact system_server is one of the most privileged context in the system. It has CAP_SYS_MODULE, so it's able to load modules into the kernel, even without being root! So if kernel modules support is enabled, it's trivial to code and compile a kernel module and load it and get root after getting system.
51

#RSAC
CVE-2014-4323 (with demo and PoC code)
write (almost)what-where, we can write a 24bits address (0x00XXXXXX) anywhere we want thanks to a vulnerability in the Qualcomm's mdp driver. Since that kind of address resides in userspace portion of memory and there is no PAN or PXN (equivalents of SMAP and SMEP on ARM), we can hijack a function pointer in the kernel and execute our code mapped in userspace, to achieve arbitrary kernel code execution. Details and writeup (credits for discovery and writeup to laginimaineb): http://bits-please.blogspot.com/2015/08/android-linuxkernel-privilege_26.html We are releasing a PoC since none wrote it so far
52

#RSAC
CVE-2014-4323 DEMO
PoC: https://github.com/marcograss/cve-2014-4323
53

#RSAC
Kernel issues are still alive and well (Amazon Fire Phone)
Kernel memory corruption issue triggerable from the sandbox
Responsibly disclosed (and now collaborating for a fix) with the Amazon Security Team Still unpatched, so we will not release any details in this presentation, just a panic demo from the sandbox. Stay tuned for the update and fix, so far the Amazon Security Team took this issue very seriously and reworked the implementation "the right way", not just applying a quick fix, kudos!
54

#RSAC
Fire OS DEMO
55

#RSAC
Kernel issues are still alive and well (Tegra touchscreen)
Kernel memory corruption issue triggerable from the sandbox on some devices, dep on the touchscreen device permissions and SELinux policy.
Responsibly disclosed to Blackphone first (different implementation that resulted in only a "panic" triggerable from the sandbox with 0 privileges) Then to AOSP for the tegra kernel line, where a more serious corruption could happen for a different implementation. However it was already internally fixed in 3.10 kernel branch
tmpbuf is allocated on kernel stack, and count is user controlled. Too bad that kernel stack is just 1-2 memory pages.
56

#RSAC
Ways forward
Modular, updatable components
Google Play updatable System Webview
Fast patching cycle(s) and decent support lifetimes
Android Handset Alliance -- dead? Device support is often measured on the order of months
System hardening
Copperhead OS // security concise fork of CM
Visibility into device vulnerabilities
Android VTS
57

Ways forward: Patching
Fast patching cycles are critical
Updates times are ridiculous Sometimes almost a year between updates OEMs blame carriers Carriers can blame OEMs, etc..
The lifetime of devices is extremely short Use a 3rd party ROM like CM Buy a Nexus device
Some OEMs agreed to monthly security updates (not HTC -it's unrealistic?!)
Arguably still too slow Lack of follow through on similar promises in the past Modularity of more system components like webview to update piecewise
58

#RSAC

#RSAC
Ways forward: ASLR and Hardening system_server
ASLR on android is still in a very poor state
Only a few bits of entropy in many cases
Attacking system_server locally isn't even probabilistic because of zygote forking model
People claimed to exploit Stagefright bugs in about a handful of tries
Combination of a few different issues including choice of heap allocator
Copperhead has done some nice nice work in this realm and changed the forking model of zygote to randomize mem layout of system_server
59

#RSAC
Ways forward: Copperhead
One of the few `secure device' projects that actually makes the device more secure Adds PaX kernel protections Changes the zygote forking mechanism to fix ASLR Swap heap allocator from jemalloc to OpenBSD malloc make heap exploitations more difficult ­ double free detection Enables integer overflow protections to prevent a class of stagefright-like bugs A technical overview here: https://copperhead.co/docs/technical_overview
60

#RSAC
Ways forward: Android VTS
Understand which vulnerabilities your device is susceptible to
In depth view into device vulnerabilities Designed in a way which will not cause system instabilities Open Source / community driven Can be used as a type of `report card' for OEM patching It should become a comprehensive suite to device security Sourcecode code and binary builds are located at : https://github.com/nowsecure/android-vts Download, run, and contribute :D
61

#RSAC
Ways forward: Android VTS
Understand which vulnerabilities your device is susceptible to
In depth view into device vulnerabilities Designed in a way which will not cause system instabilities Open Source / community driven Can be used as a type of `report card' for OEM patching It should become a comprehensive suite to device security Sourcecode code and binary builds are located at : https://github.com/nowsecure/android-vts Download, run, and contribute :D
62

#RSAC

Thank You
Ryan Welton Security Researcher, NowSecure ryan.g.welton@gmail.com Twitter: @fuzion24 github.com/fuzion24

Marco Grassi Security Researcher, KEEN Team Twitter: @marcograss

