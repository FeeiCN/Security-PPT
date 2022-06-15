SWIPING THROUGH MODERN SECURITY FEATURES

jeudi 11 avril 13

HITB Amsterdam, April 11th, 2013

REACHING THE KERNEL

· Run unsigned code outside the sandbox · Get around ASLR · Take control of the kernel

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

REACHING THE KERNEL

· Run unsigned code outside the sandbox · Get around ASLR · Take control of the kernel

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

RUNNING CODE OUTSIDE THE SANDBOX
· Disable code signing · Convince launchctl/launchd to run a
program as root

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

iOS 6.1 launchctl HARDENING
· LaunchDaemons are now loaded from the signed dyld cache.
· LaunchDaemons on the filesystem are ignored.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

launchctl 6.1 WEAKNESSES

· /etc/launchd.conf is still available · Used for jailbreaks since Corona untether
· /etc/launchd.conf able to execute any launchd command (with the exception of loading filesystem LaunchDaemons).
· bsexec can run arbitrary programs.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

RUNNING UNSIGNED CODE
· Write to root file system (specifically /etc/launchd.conf)
· Disable code signing · Convince launchctl/launchd to run a
program as root

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

RUNNING UNSIGNED CODE
· Write to root file system (specifically /etc/launchd.conf)
· Disable code signing · Convince launchctl/launchd to run a
program as root

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

EVASI0N INJECTION
Remounting the root filesystem without being root and putting the evasi0n untether payload in place

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

INJECTION STEPS

· Remount root filesystem · Write /etc/launchd.conf · Upload evasi0n untether payload

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

REMOUNTING ROOT FS

· launchctl can be used to make launchd run
commands
· Uses control socket /var/tmp/launchd/sock · But only root has access to that socket
-- unless we change the permissions

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

REMOUNTING ROOT FS
· We need to: · execute launchctl command · change launchd control socket permissions
(since we're not root)

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

EXECUTING LAUNCHCTL

· We can run a command with the tap of an icon by replacing an app binary with a shell script containing a specific shebang:
#!/bin/launchctl
· To not mess up any existing app we use one of the hidden apps for our purpose  DemoApp.app

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

ADDING EVASI0N ICON

· Adding an app requires modification of /var/mobile/Library/Caches/ com.apple.mobile.installation.plist
· holds state of all apps (also system apps) · not accessible using AFC · not included in backup · luckily the file_relay service can be used to
retrieve it

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

/var/mobile/Library/Caches/com.apple.mobile.installation.plist

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

ADDING EVASI0N ICON

· Now, we need to write back com.apple.mobile.installation.plist
· file_relay service does not provide upload functionality
· Write anywhere vulnerability required  MobileBackup2 directory traversal

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

ABOUT MOBILEBACKUP2

· MobileBackup2 has a set of backup domains · Backup domains define 'allowed' paths · Adding arbitrary files is not possible everywhere · But there are several usable paths, e.g.
MediaDomain:Media/Recordings
(/var/mobile/Media/Recordings)

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

ABOUT MOBILEBACKUP2

· Backup restore process changed with iOS 6 · Files are created in /var/tmp, staged (renamed)
to another directory in /var, and finally renamed to its destination
· Obviously limits writing files to /var partition since rename doesn't work across filesystems

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

DIRECTORY TRAVERSAL

· For accessing a path outside the allowed ones we just add a symlink to the backup, e.g.: Media/Recordings/haxx with haxx pointing to /var/mobile
· When the backup is restored, MB2 restores
Media/Recordings/haxx/DemoApp.app
but it actually writes
/var/mobile/DemoApp.app

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

ADDING EVASI0N ICON

· So to finally add the icon we use MB2 to write what we need:

/var/mobile/Library/Caches/ com.apple.mobile.installation.plist
/var/mobile/DemoApp.app /var/mobile/DemoApp.app/DemoApp /var/mobile/DemoApp.app/Info.plist /var/mobile/DemoApp.app/Icon.png /var/mobile/DemoApp.app/Icon@2x.png ...
· Reboot device...

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

EXECUTING LAUNCHCTL

· The replaced DemoApp binary we just injected with MB2 is a script with the following shebang:
#!/bin/launchctl submit -l remount -- /sbin/mount -v -t hfs -o rw /dev/
disk0s1s1
· But wait! where's the mount point parameter?

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

EXECUTING LAUNCHCTL

· The icon tap will result in the app's path being appended as last parameter to the command line · Mount target is app `binary' at first, so mount fails initially
· To resolve this we just replace the DemoApp 'binary' with a symlink (using MB2):
/var/mobile/DemoApp.app/DemoApp -> /
· Since launchd restarts the job automatically the remount should succeed after a while

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

REMOUNTING ROOT FS
· We need to: · execute launchctl command · change launchd control socket permissions
(since we're not root)

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

CHANGING PERMISSIONS

· Why not use MB2 directory traversal? · MB2 doesn't allow changing permissions
on existing files - just re-creating them
· MB2 can't create socket files · ... but we still need MB2 to help out

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

TIMEZONE VULNERABILITY
· Flaw in lockdownd:

· chmod("/private/var/db/timezone", 0777); · no further checks · executed every launch

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

TIMEZONE VULNERABILITY

· Use MB2 directory traversal to add /var/db/timezone symlink pointing to the file to chmod
· Crash lockdownd by sending a malformed property list to make it relaunch and perform the actual chmod

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

REMOUNTING ROOT FS
· We need to: · execute launchctl command · change launchd control socket permissions
(since we're not root)

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

INJECTION STEPS

· Remount root filesystem · Write /etc/launchd.conf · Upload evasi0n untether payload

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

WRITING launchd.conf

· To write the /etc/launchd.conf we could just use the MB2 directory traversal, couldn't we?
· As mentioned earlier MB2 does not allow restoring files outside /var
· Unlike regular files MB2 creates symlinks directly in the staging directory

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

WRITING launchd.conf

· Allows to create a symlink /etc/launchd.conf whilst creating it as a regular file will fail
· launchd will still load the file pointed to by the /etc/launchd.conf symlink on startup

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

INJECTION STEPS

· Remount root filesystem · Write /etc/launchd.conf · Upload evasi0n untether payload

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

UPLOADING EVASI0N PAYLOAD

· Since we already have the MB2 directory traversal, we just use it to upload the untether payload to the unique location /var/evasi0n
· Finally we use AFC to upload the Cydia package to
/var/mobile/Media/evasi0n-install

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

INJECTION STEPS

· Remount root filesystem · Write /etc/launchd.conf · Upload evasi0n untether payload

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

REBOOT TO UNTETHER!

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

iOS CODE SIGNING
Weaknesses

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

PROTECTIONS
· when loading binaries · when accessing executable pages · when accessing signed pages

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

SIGNED PAGE ACCESS
· Enforced in vm_fault_enter · Dependent on "CS blobs" being registered by
loader.
· Blobs indicate ranges of the file/vnode that is signed and their hashes.
· No blobs loaded? No checking is done.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

EXECUTABLE PAGE ACCESS
· Enforced in vm_fault_enter · If a process tries to access an executable page that
is not signed it is killed.
· (depending on CS_KILL, but it is set for every single binary on iOS)

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

LOADING CODE
· Code loaded through two primary paths: · Executables are loaded by kernel · dylibs are loaded by dyld
· Each path has to validate what they load is signed separately.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

LOADING A BINARY

· Kernel gets an execve syscall. MAC hooks for the AMFI kext are set in this method call tree.
· mpo_vnode_check_exec is called which sets CS_HARD and CS_KILL
· Kernel loads CS blobs from Mach-O · mpo_vnode_check_signature calls amfid, a
userland daemon, to do the validation
· If signature checking fails, kernel kills the process

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

LOADING A DYLIB
· If a dylib being loaded is code signed, its blobs are loaded into the CS blobs for the current process.
· dyld calls fcntl(F_ADDFILESIGS)

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

amfid

libmis.dylib

DEPENDENCIES

com.apple.driver.AppleMobileFileIntegrity

mpo_vnode_check_signature

mpo_vnode_check_exec

uip->cs_blobs

execve

CS_KILL

fcntl(F_ADDFILESIGS)

jeudi 11 avril 13

dyld

vm_fault_enter

kernel

AMFID
· All binaries shipped with iOS have hashes in the kernel. · No chicken-and-egg problem with amfid loading.
· amfid uses a library (libmis.dylib) to verify the code signature on binaries.
· If it passes, amfid replies to the kernel, and kernel continues loading the binary.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

WEAKNESSES
· CS blobs are validated in amfid, outside the kernel.
· As long as amfid gives permission, the kernel accepts any CS blob as valid.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

amfid

libmis.dylib

weak part

com.apple.driver.AppleMobileFileIntegrity

mpo_vnode_check_signature

mpo_vnode_check_exec

uip->cs_blobs

execve

CS_KILL

fcntl(F_ADDFILESIGS)

jeudi 11 avril 13

dyld

vm_fault_enter

kernel

RUNNING UNSIGNED CODE
· Write to root file system (specifically /etc/launchd.conf)
· Convince amfid to okay our program · Convince launchctl/launchd to run a
program as root

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

DYLIB LOADING

· dyld takes care of loading the dependent libraries in Mach-O.
· dyld also handles dlopen and other dynamic loading calls.
· dyld runs inside the process using it, so it has only the permissions every process has. · Conversely, every process has to be able to do what dyld can do.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

CAN WE LOAD UNSIGNED DYLIBS?

· dyld tries to prevent this by requiring the Mach-O header of dylibs to be executable.
· Accessing unsigned executable pages causes the process to die.
· Note: you cannot step around this with no code segments... there has to be at least one.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

REQUIRES MACH-O HEADER TO BE EXECUTABLE?

· Actually, it requires any load command segment that spans the file offsets where the Mach-O header is to:
· Span at least the entire Mach-O header file offsets.
· Be executable. · And there must be at least one such segment.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

OF COURSE...
· Who says the Mach-O header actually used by dyld has to be at the front of the file?

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

NOW WHAT?
· We can override functions!

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

INTERPOSITION

execve Kernel

AMFI kext Kernel

verify_code_directory amfid

MISValidateSignature libmis.dylib

· We can just override MISValidateSignature to always return 0!

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

amfid

libmis.dylib

FAIL!

com.apple.driver.AppleMobileFileIntegrity

mpo_vnode_check_signature

mpo_vnode_check_exec

uip->cs_blobs

execve

CS_KILL

fcntl(F_ADDFILESIGS)

jeudi 11 avril 13

dyld

vm_fault_enter

kernel

RUNNING UNSIGNED CODE
· Write to root file system (specifically /etc/launchd.conf)
· Convince amfid to okay our program · Convince launchctl/launchd to run a
program as root

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

DISABLED CODE SIGNING
· Using a « simple » dylib with no executable pages, we interposed the daemon responsible of the code signing enforcement
· It didn't require any memory corruption at the userland level
· The whole code signing design is so complicated that it had to be logical mistakes

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

REAL WORLD EXAMPLE
evasi0n's /etc/launchd.conf

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

THE BOSS FIGHT
Enough sneaking around.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

EVASI0N BINARY

· 5001 lines of slightly over-engineered C and Objective-C code
· 1719 lines for dynamically finding offsets. · 876 lines for exploit primitives. · 671 lines for main exploit logic/patching. · 318 lines for primitives using task_for_pid
0 after it is enabled.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

KERNEL VULNERABILITIES

· USB -- the eternal source of vulnerabilities · IOUSBDeviceInterface has not just one, but
two useful vulnerabilities
· evasi0n creates some exploit primitives from these two vulnerabilities
· These primitives are then combined to implement the remaining kernel exploits

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

KERNEL VULNERABILITIES
· stallPipe (and others) naively takes a pointer to a kernel object as an argument.
· createData returns a kernel address as the mapToken.

http://iphonedevwiki.net/index.php?title=IOUSBDeviceFamily

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

KERNEL VULNERABILITIES
· stallPipe (and others) naively takes a pointer to a kernel object as an argument.
· createData returns a kernel address as the mapToken.

Oh, come on...

http://iphonedevwiki.net/index.php?title=IOUSBDeviceFamily

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

EXPLOITING stallPipe

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

EXPLOITING stallPipe

· stallPipe can be misused to call arbitrary functions · We'll need to craft an object that:
· Is accessible from the kernel (i.e. in kernel memory)
· Exists at an address known to us · Also need to know the address of the function
we'll use it with

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Not so fast! iOS6 mitigations...

· Kernel can no longer directly access userland memory in iOS 6! · In previous iOS versions, we could (and did) merely malloc an object in userland and provide it to stallPipe
· KASLR makes it challenging to find objects in kernel memory, let alone modify them
· KASLR makes it hard to find what to call

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Evading mitigations with createData
· createData creates an IOMemoryMap and gives us its kernel address
· Like all IOKit objects, it's in a kalloc zone · Because of IOMemoryMap's size, it is always in kalloc.
88
· If we call createData enough times, a new kalloc.88 page will be created, and future allocations will be consecutive in the same page
· Then we can predict the address of next allocation in kalloc.88

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Evading mitigations with createData
· What can we do with the address of the next allocation in kalloc.88? · Deliberately trigger an allocation using the mach_msg OOL descriptors technique described by Mark Dowd and Tarjei Mandt at HITB2012KUL · We can then control the contents of kernel memory at a known location

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

WRITING TO KERNEL

· Send mach msgs with

OOL memory descriptors without

OOL 1

receiving them.

· Small OOL memory

descriptors will be

OOL 2

copied into kernel

memory in kalloc'ed

buffers.

· Buffers will deallocate when message received

vm_map_copy_t our data
vm_map_copy_t our data ...

Swiping through modern security features, HITB, AMS 2013

@evad3rs

jeudi 11 avril 13

A TIGHT SQUEEZE
· kalloc.88 has 0x58 bytes · vm_map_copy_t has 0x30 bytes · We can only write 0x28 bytes

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

call_indirect: Call function with referenced argument

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

WHAT TO CALL?

· Need to get around KASLR. · iOS 6 feature that shifts the start of the kernel by
a randomized amount determined by the bootloader.
· Only need to leak address of one known location to get around it.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

KASLR WEAKNESS?

· Exception vectors are not moved:They're always at 0xFFFF0000.
· The code there hides all addresses. · Exception handlers are in processor structs.
Pointers to them are in thread ID CPU registers inaccessible from userland.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

WEIRD EFFECTS

· With another KASLR workaround and IOUSB bug, you can leak kernel memory of unknown kernel one dword at a time through panic logs.
· Didn't work on iPad mini for some reason: CRC error.
· Tried to jump to exception vector to see if that helps.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

JUMPING TO DATA ABORT

· Kernel didn't panic! · Program crashed instead! · Crash log seemed to contain the KERNEL thread
register state!
· Why?

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

· How does XNU distinguish userland crashes from kernel mode crashes?
· CPSR register in ARM contains the current processor state, include `mode bits' which indicate User, FIQ, IRQ, Supervisor, Abort, Undefined or System mode.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

· ARM has a banked SPSR register that saves CPSR when an exception occurred.
· e.g. when a data abort occurs, current CPSR is saved to SPSRABRT before data abort handler is called.
· Of course, the instruction to read any of the SPSR registers is the same.

Swiping through modern security features, HITB, AMS 2013

@evad3rs

jeudi 11 avril 13

· XNU tries to check what the CPSR during the exception was. · If mode is 0, CPSR was user, crash the current thread. · If mode is not 0, CPSR was system, panic the system.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

· If you jump to data abort directly, SPSR is not SPSRABRT, it is SPSRSVC which contains the CPSR when the stallPipe syscall was called!
· Mode bits of SPSR is therefore 0.The kernel believes the user thread just crashed and dutifully dumps the kernel registers as if they were user registers.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

CUSTOM HANDLER
· More precisely, it calls the exception handlers you can register from userland. · CrashReporter is such a handler. · We can also register a handler for an individual thread, and catch the `crashes' for that thread.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

EVIL SHENANIGANS

· `Crash' the kernel once from stallPipe, get the address of stallPipe_1!
· KASLR defeated. · `Crash' using call_indirect and dereferenced
value of an address of our choosing is in R1, which we can read!
· Kernel read-anywhere.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

CAVEAT

· Each `crash' leaks one object from kalloc.6144. · Do it too much and you'll panic.
· Caused by how IOConnectCall works. · Each call is actually a mach msg to the IOKit
server: MIG call to io_connect_method_*
· ipc_kobject_server is eventually called by mach_msg to dispatch it. It allocates a large ipc_kmsg for the error reply and saves the pointer on the stack.

Swiping through modern security features, HITB, AMS 2013

@evad3rs

jeudi 11 avril 13

· When the `crash' happens, the thread exits through thread_exception_return from the data abort handler instead of unwinding normally.
· Stack pointer lost forever! · 226 lines of code to manually search kalloc
zones for lost ipc_kmsg and deallocate it.
· Normally just need one `crash' per boot, so only leak 6144 bytes per boot -- not too bad.
· So why fix it? · Because @planetbeing is OCD.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

WRITE-ANYWHERE PRIMITIVE

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

READ-ANYWHERE PRIMITIVE (SMALL)

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

READ-ANYWHERE PRIMITIVE (LARGE)
· Corrupt one of the OOL descriptor's vm_map_copy_t structure so that it is tricked into giving us back a copy of arbitrary kernel memory. · Also one of Mark Dowd and Tarjei Mandt's ideas from HITB2012KUL

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

OOL CORRUPTION

· If we use call_direct on memmove, first argument of memmove points to &table[4].
· If we write past the vm_map_copy_t buffer, we will hit the vm_map_copy_t structure for the last OOL descriptor we allocated (since kalloc allocates from bottom of page, up).
· We allocate 20 OOL descriptors. Previously, it didn't matter which one the kernel actually used. Now it does.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

OOL CORRUPTION
· Find index of OOL descriptor KernelBufferAddress points to by doing a read using the small kernel read anywhere primitive. · The OOL descriptor with contents that does not match the others is the one that KernelBufferAddress points to.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

OOL 19 vm_map_copy_t OOL 19 data
... OOL KernelBufferIndex + 1 vm_map_copy_t Fake vm_map_copy_t data! OOL KernelBufferIndex vm_map_copy_t Fake pipe object OOL KernelBufferIndex - 1 vm_map_copy_t Fake pipe object
... OOL 0 vm_map_copy_t OOL 0 data
Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

OOL 19 vm_map_copy_t OOL 19 data
... OOL KernelBufferIndex + 1 vm_map_copy_t Fake vm_map_copy_t data! OOL KernelBufferIndex vm_map_copy_t Fake pipe object Fake vm_map_copy_t data! Fake pipe object
... OOL 0 vm_map_copy_t OOL 0 data
Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

PUTTING IT ALL TOGETHER

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

· Wait for IOUSBDeviceClient driver to come up.

· Crash kernel once using call_indirect(data abort) and thread exception handling to get current boot's offset of stallPipe_1. Calculate KASLR offset.

· Load cached memmove offset or find memmove by reading default_pager() function (always first function in iOS XNU) and looking for memset. memmove is right above memset.

· Load other cached offsets or use memmove in more reliable read-anywhere primitive to dynamically find them.

Swiping through modern security features, HITB, AMS 2013

@evad3rs

jeudi 11 avril 13

· Get around kernel W^X by directly patching kernel hardware page tables to make patch targets in kernel text writable.
· Call kernel flush TLB function. · Requires kernel-read anywhere to walk tables. · Patch task_for_pid to enable task_for_pid
for PID 0 (kernel_task) to be called.
· Install shell code stub to syscall 0 to avoid using IOUSB again due to potential race conditions with kalloc'ed mach_msg OOL descriptors.
· Do rest of the patches using vm_write/vm_read calls. Use shell code stub to flush caches, etc.

Swiping through modern security features, HITB, AMS 2013

@evad3rs

jeudi 11 avril 13

· Clean up · Fix the kalloc leak from jumping to the
exception vectors.
· Stick around until USB device descriptors fully initialized.
· Due to sloppy programming of the driver, USB device descriptors must be configured before the first driver user client is shut down, or they can never be configured again.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

IMPROVEMENTS FOR THE FUTURE

· Reusable patch finding routines that make it easier to find needed offsets in the era of PIC · https://github.com/planetbeing/ios-jailbreakpatchfinder
· Internationalized jailbreak software to serve the growing non-English speaking jailbreak community.

Swiping through modern security features, HITB, AMS 2013
jeudi 11 avril 13

@evad3rs

