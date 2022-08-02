How current iOS research is done
· Third party iOS emulator on a remote server · Development fused iPhone · Off the shelf iPhone ­ jailbroken · Off the shelf iPhone ­ no jailbreak

iPhone panic log

Jonathan Afek
· Aleph Research group manager at HCL/AppScan · 15 years of experience in security research and low level development
including vulnerability research, Linux kernel, storage systems, WiFi systems and FW, security systems and more.

iOS on QEMU work done by @zhuowei (Worth Doing Badly)

Past Research ­ Worth Doing Badly (@zhuowei)
· Chosen version is iPhone X iOS 12 beta 4 · Extracted the kernel image and the device tree from the software update
package · kernel, device tree and the kernel boot arguments were loaded in memory · iOS RAMDisk was loaded in memory · UART serial output was achieved · Kernel was booted · Launchd was executed

Past Research ­ Worth Doing Badly (@zhuowei)

Goals of our project
· Booting iOS on QEMU with no kernel patches · Supporting hardware (disk, display, touch, sound, multiple CPUs, Interrupt
controllers, etc...) · Supporting different iOS versions · Conducting iOS security research · Learning about iOS and QEMU internals

Status of our project
· Booting Secure Monitor and the kernel (unpatched) · Executing a user-mode app over launchd · Running an interactive bash shell on an iOS kernel on QEMU · Supporting only on iOS 12.1 for iPhone 6s plus

DEMO - General use

Agenda
· Past public research on iOS on QEMU · iOS kernel boot process · Execution of non-apple executables with Trust Cache · Bash execution with launchd · UART interactive I/O · Next steps

iOS kernel boot process
· Start booting the kernelcache code in EL1 as done by @zhuowei · Crash on SMC instruction
(Secure Monitor Call)
e an

iOS kernel boot process
from https://developer.arm.com/docs/den0024/a/fundamentals-of-armv8

iOS kernel boot process
· Secure Monitor Loads at boot in EL3 · It resides in a secure memory location inaccessible from EL1 (kernel code) · It services SMC calls from the kernel (similar to how system calls from user
apps to the kernel are serviced) · It is responsible for KPP (Kernel Patch Protection) in our system

iOS kernel boot process
· The kernel needs a secure monitor to service its SMCs

iOS kernel boot process
Any ideas?

iOS kernel boot process
· iPhone X uses KTRR (hardware mechanism to prevent patches) and no longer uses a Secure Monitor for KPP (Kernel Patch Protection)
· Loading the Secure Monitor image for iOS 12.1 for iPhone 6s plus in EL3 and
start executing
· Loading the image at its preferred address (secure memory) with the image's boot args at the next page and start execution at the entry point in EL3

iOS kernel boot process
· Loading the Secure Monitor image for iOS 12.1 for iPhone 6s plus in EL3 and start executing
· Data abort for trying to parse the kernelcache Mach-O header to decide which areas need which protections

iOS kernel boot process

iOS kernel boot process
Kernel address space grows this way -> Lowest address kernel part Kernel Mach-O header Rest of kernel
Base address boot arg

iOS kernel boot process
· The kernel needs a secure monitor to service its SMCs · The secure monitor requires the base address boot arg to point to the kernel
Macho-O header

iOS kernel boot process
Any ideas?

iOS kernel boot process
Kernel address space grows this way -> Lowest address kernel part Kernel Mach-O header Rest of kernel
Base address boot arg

iOS kernel boot process
· Loading the Secure Monitor image for iOS 12.1 for iPhone 6s plus in EL3 and start executing
· Tried many different solutions such as changing the base address to the loaded MachO header address (above the lowest loaded section/driver)

iOS kernel boot process
· The kernel needs a secure monitor to service its SMCs · The secure monitor requires the base address boot arg to point to the kernel
Macho-O header · The base address boot arg needs to point to the lowest kernel address in
order for the kernel to operate properly

iOS kernel boot process
Any ideas?

iOS kernel boot process

Kernel address space grows this way ->

Another copy of raw kernel file beginning with the Mach-O header

Lowest address Kernel Mach-O header Rest of kernel
kernel part

Base address boot arg

iOS kernel boot process
And it works!

Agenda
· Past public research on iOS on QEMU · iOS kernel boot process · Execution of non-apple executables with Trust Cache · Bash execution with launchd · UART interactive I/O · Next steps

Trust Cache
52F8
?

Trust Cache Executables Hash List

1EC4

A971

Executable 1
34CB

Execution denied!

Trust Cache
52F8
?

Trust Cache Executables Hash List

1EC4

A971

Executable 2
1EC4

Execution allowed!

Trust Cache
· iOS has 3 different types of trust caches
· A list of hardcoded hashes approved in the kernelcache · A dynamic trust cache that can be loaded at runtime from a file · A static trust cache in memory pointed from the device tree

Trust Cache
· Top level CoreTrust validation where execution is decided

Trust Cache
· From there dive deeper into the static trust cache lookup

Trust Cache
· Using XREFs we can see that the static trust cache is set from here

· RE on the previous function reveals this trust cache structure
Trust Cache

Trust Cache
· Using XREFs we can see that this structure is read from the device tree

· Which Apple released the source code for
Trust Cache

Trust Cache
· Always works when only 1 hash in the list · Only some items work when more than 1 item is in the list

Trust Cache
Any ideas?

Trust Cache
· Reversing this code revealed a binary search code which means the hashes are expected to be sorted in this list

Trust Cache
And it works!

Agenda
· Past public research on iOS on QEMU · iOS kernel boot process · Execution of non-apple executables with Trust Cache · Bash execution with launchd · UART interactive I/O · Next steps

Bash on Launchd
· Mount the RAMDisk image on OSX · Remove all files in /System/Library/LaunchDaemons/ · Add a single file there for running bash (com.apple.bash.plist) · Add the bash executable to the RAMDisk · Add the bash executable to the Trust Cache · Unmount the RAMDisk and run QEMU

Bash on Launchd

Bash on Launchd
· System tries to execute bash · Logs show missing libraries required for bash

Bash on Launchd
Any ideas?

Bash on Launchd
· The RAMDisk image comes without the dynamic loader cache on it, which is a file that holds most of the common runtime libs for iOS
· Copy this file into the RAMDisk at the correct path from the full disk images

Bash on Launchd
Any ideas?

Bash on Launchd
· Debug /usr/lib/dyld (the dynamic loader) which is responsible for loading the dynamic loader cache

Bash on Launchd

Bash on Launchd
· Stepping through the execution path with gdb showed the error was in here

Bash on Launchd
· Since we have a kernel debugger in gdb we can step into the system call in the kernel

Bash on Launchd
· Stepping through this function we see that the call to _shared_region_map_and_slide() is the part that fails

· Stepping in that function reveals the error here
Bash on Launchd

Bash on Launchd
· The code validates that the cache file is owned by root · Mount the RAMDisk image in a different way to allow permission editing · Copy the cache file and chown to root

Bash on Launchd
And it works!

Agenda
· Past public research on iOS on QEMU · iOS kernel boot process · Execution of non-apple executables with Trust Cache · Bash execution with launchd · UART interactive I/O · Next steps

Interactive UART
· UART output only was already possible with previous research · Found where UART input is decided on in the kernel

Interactive UART
· Enabling UART input is decided based on bit #1 of a global var · The global var is read from the "serial" kernel boot arg

Interactive UART
· Setting the "serial" boot arg to 2

Interactive UART
And it works!

DEMO - Ghidra trace

Demo ­ Research a vulnerability ­ voucher_swap
· Research done by Brandon Azad · iOS 12.1 jailbreak · Trigger the vulnerability while debugging

Agenda
· Past public research on iOS on QEMU · iOS kernel boot process · Execution of non-apple executables with Trust Cache · Bash execution with launchd · UART interactive I/O · Next steps

Next steps and challenges
· IP communication · Non RAMDisk disk support · More hardware devices (disk, screen, touch, sound, comms, etc..) · Load all the regular iOS services in the original launchd dir instead of just
bash · More than a single CPU and an interrupt controller · More iOS versions and devices including KTRR, PAC and other features · More gdb scripts (allocation zones info, objects info, etc...) · Security research

Black Hat Sound Bytes
· Use the the project and contribute! https://github.com/alephsecurity · Check out our blog: https://alephsecurity.com · Follow us on twitter: @alephsecurity @JonathanAfek · Questions?

