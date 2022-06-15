Infecting the Embedded Supply Chain
Zach Miller Alex Kissinger
Somerset Recon

Introduction - Who We Are
Zach:  Reverse Engineering, Pen Testing  Twitter: @bit_twidd1er Alex:  Barista that occasionally does security things @ Somerset Recon  Cappuccinos, Hardware Hacking, Reverse Engineering
Somerset Recon

Introduction - Somerset Recon
 @SomersetRecon  https://somersetrecon.com/contact
Somerset Recon

Previous Research - Electronic Safe Lock Analysis
 Discovered vulnerabilities in the mobile application and wire protocol of the SecuRam Prologic B01 Bluetooth electronic safe lock
 Capture and decode PIN numbers transmitted wirelessly  Brute force PIN numbers over the wire
Somerset Recon

Previous Research - Hello Barbie
 Security analysis on the Mattel Hello Barbie doll  Identified several vulnerabilities affecting the device and associated
web and mobile technologies
Somerset Recon

These are all embedded devices
Somerset Recon

Where are embedded devices?

Embedded

???

General Purpose

Somerset Recon

Industries Develop Embedded Devices
 Automotive  Industrial  Medical  Communications  Digital Consumer  Etc.
Somerset Recon

What do these embedded devices have in common???
Somerset Recon

They all utilize embedded debuggers for their development
Somerset Recon

Our Targets
Somerset Recon

Our Targets
Somerset Recon

Segger J-Link Debug Probe
 JTAG/SWD/SWO/etc.  In Circuit Emulator (ICE)  In Circuit System Programmer (ICSP)  Supports ARM/ARM Cortex, RISC-V, RX targets  USB and Ethernet  Cross platform toolchain  "Ultrafast" download/upload to flash  Unlimited software breakpoints
"SEGGER J-Links are the most widely used line of debug probes available today"- www.segger.com
Somerset Recon

Segger Software
 J-Link Software Package  J-Link GDB Server RTOS Plugin SDK  SystemView - Real-time Analysis and Visualization  Ozone Graphical Debugger  J-Scope Data Analysis and Visualization Tool  Much more... We focused on the J-Link Software Package
Somerset Recon

J-Link Software
"All-in-one debugging solution"  J-Link Commander (Command line tool)  J-Link GDB Server  J-Link Remote Server  J-Mem Memory Viewer  J-Flash  Much more...
Somerset Recon

Segger J-Link Setup
Somerset Recon

Segger J-Link - Attack Surface Hardware Debug Probes
 Firmware
Software Packages that Interact with Debug probes
 USB Driver  Lots of user-mode applications  Full-blown IDE
Somerset Recon

Hardware
Somerset Recon

Segger J-Link - Hardware
 How it works  Extracting firmware  Feature diffs between devices  Security mechanisms
 Is it open?
Somerset Recon

Segger J-Link - Hardware
J-Link EDU V9.3
Somerset Recon

Segger J-Link - Hardware
Somerset Recon

Segger J-Link - Hardware
Somerset Recon

Segger J-Link - Hardware
Somerset Recon

Segger J-Link - Hardware
 Tag-ConnectTM?
Somerset Recon

Segger J-Link - Debugging a J-Link with a J-Link
 Security and Flash bits set in flash  Refuses to connect and erase  Other ways around this?
Somerset Recon

Segger J-Link - Debugging a J-Link with a J-Link
 J-Link Mini EDU MCU Reference Manual  Chips are cool
Somerset Recon

J-Link Desktop Software
Somerset Recon

Vulnerability Research - Reverse Engineering
 A lot of cross-compiled code  Some interesting custom string-manipulation stuff (more on this later)  A lot of uses of dangerous functions  Mostly basic applications, nothing that complicated going on
Somerset Recon

Vulnerability Research - Reverse Engineering
Analysis of binary protections:  DEP/NX enabled  ASLR enabled  PIE is not enabled  No stack canaries in *nix binaries, stack canaries present in Windows  SafeSEH used in Windows binaries  No Symbols
Somerset Recon

Vulnerability Research - Fuzzing
Set up fuzzers to test various input vectors  Files  Network interfaces  Command line args
Used peach to do generational fuzzing  A lot of structured, text-based formats  A lot of interesting code paths that needed magic numbers to reach
Somerset Recon

Vulnerability Research - Fuzzing
 Tens of thousands of crashes  Core files everywhere
 Lots of exploitable crashes  ...but also tons of duplicate crashes  We had issues keeping J-Link
devices attached to VMs
Somerset Recon

Vulnerability Research - Fuzzing
Issues keeping J-Link attached to VM:  After a crash the J-Link devices enter a bad state and are disconnected
from the fuzzing VM  We created a crash monitor to trigger on any crash while fuzzing
 Have the monitor run a script to check if J-Link had fallen off the VM
 If so, use libvirt to reattach the J-Link if needed
Somerset Recon

Local Exploits
Somerset Recon

CVE-2018-9094 - Format String Vulnerability  J-Flash tool  Found interesting custom printf style functions
implemented in J-Link
Somerset Recon

CVE-2018-9094 - Custom String Formatting Accepts limited subset of format specifiers  Accepts basic specifiers: %d, %x, %p, %u, ...  Doesn't accept the %n family of specifiers  Accepts precision arguments: .number
Somerset Recon

CVE-2018-9094 - Format String Vulnerability
JFlashSPI_CL.exe -open xAAAA%X%X%X%X%X%X%X%X%X%X%X%X%X%X%X%X%X%X%X%X% X%X%X%X%X%X%X%s
Somerset Recon

CVE-2018-9094 - Impact  Lack of %n format specifiers reduces severity of
this vulnerability
 Potentially could be leveraged as part of an exploit chain as a primitive to read arbitrary memory
Somerset Recon

CVE-2018-9095 - Discovery
 J-Link Commander tool  Found via fuzzing and made up most of our exploitable crashes (>99%)  Traditional stack buffer overflow  Reads each line of a file into 512 byte stack buffer
Somerset Recon

CVE-2018-9095 - Triage
$ gdb -c core GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1 ... [New LWP 1928] Core was generated by `JLink_Linux_V630b_i386/JLinkExe -CommandFile payload'. Program terminated with signal SIGSEGV, Segmentation fault. #0 0xb7613456 in ?? () gdb-peda$ bt #0 0xb7613456 in ?? () #1 0x41414141 in ?? () ... Backtrace stopped: previous frame inner to this frame (corrupt stack?)
Somerset Recon

CVE-2018-9095 - Exploitation
Steps to exploitation: 1. Control over return address 2. Get the address of Libc 3. Use that to get the address of system() 4. Call system() with arguments 5. Bob's your uncle.
Somerset Recon

CVE-2018-9095 - Triage
1. Control over return address  Used GDB Peda to calculate offset  Other cool tools (radare2, pwntools, patter_create.rb) out there can
utilize cyclic patterns (De Bruijn sequence) to calculate offsets
Somerset Recon

CVE-2018-9095 - Triage
 ROP gadgets  ROPGadget Tool  Grep like a madman  Ropper  Z3  Manually Searching/Custom Tools  Bad bytes are bad
Somerset Recon

CVE-2018-9095 - Triage
2. Get the address of Libc
 Used pwntools to dump all got.plt symbols  Search through ROP gadgets for uses  ROP gymnastics to dereference it
//Chain pseudo 0x804ae7c: esi = **libc 0x0804ae79: eax = esi, esi = **libc 0x0804d0b3: eax += *eax 0x8048e87: eax -= esi
Somerset Recon

>>> for x in

elf.plt:

...

print x

...

lseek

malloc

clock_gettime

dlsym

memset

strcat

__libc_start_main

printf

fgets

CVE-2018-9095 - Triage
3. Use that to get the address of system()  The system() function was not called in text, used to the
"__libc_start_main" symbol instead  GDB to calculate the offsets  Lack of gadgets at this point
 ROP gymnastics to get the proper value in EAX
//Chain pseudo 0x0804b193: eax += 0x5b000000, esi = 0x5b000000-off_to_sys 0x8048e87: eax -= esi
Somerset Recon

CVE-2018-9095 - Triage
4. Call system()  Wanted it to be reliable and reproducible for CVE  DEP/NX is annoying  What string argument do we pass to system()?
//Chain pseudo 0x08049841: push esi; call eax;
Somerset Recon

CVE-2018-9095 - Triage
4. Call system() with arguments $ strings JLinkExe | grep "sh$" fflush SWOFlush .gnu.hash
That'll work...
Somerset Recon

CVE-2018-9095 - PoC
 Craft malicious J-Link command files that can be sent to victim  Local code execution  32-bit JLinkExe binary  i386 and amd64 Linux systems  ROP
 ASLR bypass  Ret2libc  Reverse shell is doable, but requires ROPing in Libc
Somerset Recon

CVE-2018-9095 - Use Case
Somerset Recon

CVE-2018-9097 - Settings File Overflow
Very similar to previous exploit
JLinkExe executable reads a "SettingsFile"  Reads in settings file and passes to libjlinkarm.so.6.30.2 to update
settings  libjlinkarm.so.6.30.2 has a buffer overrun in BSS segment  Used the overflow to overwrite a function pointer in BSS segment
Somerset Recon

Remote Exploits
Somerset Recon

CVE-2018-9096 - Discovery
 JLinkRemoteServer tool  Opens up a bunch of ports:

$ sudo netstat -tulpn | grep JLinkRemote

tcp

0

0 0.0.0.0:24

tcp

0

0 127.0.0.1:19080

tcp

0

0 0.0.0.0:19020

tcp

0

0 127.0.0.1:19021

tcp

0

0 127.0.0.1:19030

tcp

0

0 0.0.0.0:23

0.0.0.0:* 0.0.0.0:* 0.0.0.0:* 0.0.0.0:* 0.0.0.0:* 0.0.0.0:*

LISTEN LISTEN LISTEN LISTEN LISTEN LISTEN

31417/./JLinkRemote 31417/./JLinkRemote 31417/./JLinkRemote 31417/./JLinkRemote 31417/./JLinkRemote 31417/./JLinkRemote

Somerset Recon

CVE-2018-9096 - Discovery
 JLinkRemoteServer tool  Opens up a bunch of ports:

$ sudo netstat -tulpn | grep JLinkRemote

tcp

0

0 0.0.0.0:24

tcp

0

0 127.0.0.1:19080

tcp

0

0 0.0.0.0:19020

tcp

0

0 127.0.0.1:19021

tcp

0

0 127.0.0.1:19030

tcp

0

0 0.0.0.0:23

0.0.0.0:* 0.0.0.0:* 0.0.0.0:* 0.0.0.0:* 0.0.0.0:* 0.0.0.0:*

LISTEN LISTEN LISTEN LISTEN LISTEN LISTEN

31417/./JLinkRemote 31417/./JLinkRemote 31417/./JLinkRemote 31417/./JLinkRemote 31417/./JLinkRemote 31417/./JLinkRemote

Somerset Recon

Telnet?

CVE-2018-9096 - Discovery
 Reverse engineering revealed it was actually a built-in Telnet server:
 Allows Telnet connections which provide similar functionality to the Tunnel server
Somerset Recon

CVE-2018-9096 - Discovery
Fuzzing of the Telnet server revealed an interesting crash: JLinkRemoteServ[31402]: segfault at 41414141 ip 41414141...
Somerset Recon

CVE-2018-9096 - Triage
Additional RE and triage revealed the following about this vulnerability:  Stack buffer overflow  Crashes are not consistent due to race condition  Limited amount of space to work with (48 byte maximum ROP chain
length)  ASLR + DEP/NX but no PIE  Additional user-controlled data were found in program memory
Somerset Recon

CVE-2018-9096 - Exploitation
 Traditional techniques used to set up the call to system()  NX was bypassed using ROP chain  ROP chain bypassed ASLR using GOT dereference of libc function call  ROP chain then calculates address of system() based on offset from base of libc
 Main issue was getting arbitrary user-controlled strings as argument to system()
Somerset Recon

CVE-2018-9096 - Exploitation
 User-controlled strings were consistently found in one of either two static locations that were 72 bytes apart from each other  We were unable to predict which location will store the user-controlled string
 How do we consistently setup the argument to system() to run our command?
Somerset Recon

CVE-2018-9096 - SPACE SLEDS
Somerset Recon

CVE-2018-9096 - SPACE SLEDS
 Inspired by NOP sled techniques used to increase the reliability of exploits
 Concept: Prepend spaces to the user-controlled command string in order to create some overlap between the two command strings
 Use the address of the overlapping command strings as the argument to system()
Somerset Recon

CVE-2018-9096 - Demo
Somerset Recon

CVE-2018-9093 - Tunnel Server Backdoor
 JLinkRemoteServer tool  "[P]rovides a tunneling mode which allows remote connections to a
J-Link/J-Trace from any computer, even from outside the local network."
Somerset Recon

CVE-2018-9093 - Tunnel Server Backdoor
"I wonder if there are any weaknesses with their auth?"
Somerset Recon

CVE-2018-9093 - Tunnel Server Backdoor
 Registers all detected J-Link device serial number with Segger server  Segger server accepts connections and proxies traffic back to
registered devices based off of serial numbers  Uses hardcoded magic numbers and no authentication
 J-Link device -> proxy server: Magic number = 0x11223344  Debugging client -> proxy server: Magic number = 0x55667788
Somerset Recon

CVE-2018-9093 - Serial Number Analysis
 But brute forcing all of the serial numbers would be too hard...right?  Serial numbers are 9 decimal digits - 10 billion possibilities
 Assuming 10 serial numbers/second it would take >31 years to try all possible S/Ns
 Is there some way to shrink the space?
 How are Segger serial numbers assigned?  Where do the serial numbers begin?
 How can we find J-Link serial numbers?
Somerset Recon

CVE-2018-9093 - Serial Number Analysis Google "Segger J-Link" images:
Somerset Recon

CVE-2018-9093 - Serial Number Analysis Phone a friend and ask for their serial numbers?
Somerset Recon

CVE-2018-9093 - Serial Number Analysis
 From search results combined with devices we own we were able to find about about 30 J-Link serial numbers
 From those results several patterns emerged
Somerset Recon

CVE-2018-9093 - Serial Number Analysis
 86: Model  10: Version  00743:
Incremented per device
Somerset Recon

CVE-2018-9093 - Serial Number Analysis
Serial Number Analysis Results:
 Good coverage of serial number space is possible with ~100,000 serial numbers  Reduces time to brute force from over 31 years to less than 3 hours
Somerset Recon

CVE-2018-9093 - Impact  Demo
Somerset Recon

CVE-2018-9093 - Impact Once connected to a J-Link Device one can:  Flash new firmware to a device  Read existing firmware ...
( ~  °)
Somerset Recon

Disclosure
Somerset Recon

Disclosure
April 4, 2018 - Disclosed vulnerabilities to Segger April 5, 2018 - Segger responds acknowledging vulnerabilities April 9, 2018 - Segger releases patches for most of the vulnerabilities April 10, 2018 - Founder & CTO responds thanking us
Somerset Recon

Summary of Vulnerabilities
 Vulnerabilities in J-Link tunnel server opens backdoor to attached J-Links and can compromise the state of your devices and your network
 Vulnerabilities in the JLinkRemoteServer allow an attacker to gain full remote code execution
 No authentication for JLinkRemoteServer or JLinkGDBServer which allows downloading and flashing of embedded devices
 Traffic is not encrypted to JLinkRemoteServer or tunnel server
 Vulnerabilities in file parsing allow an attacker who distributes malicious J-Link files (command files or settings files) to gain execution on the machine that parses those files
Somerset Recon

Conclusions
 Developers should always use the PIE flag to make memory corruption more difficult
 Several unknown vulnerabilities were discovered that affect the J-Link Debugger family and its associated software
 Given that these devices play a critical role in the embedded supply chain, additional security protection should be implemented to protect the users and consumers
 Segger's response was encouraging  No cease and desist  Quickly patched many of the vulnerabilities
 Don't trust any remote debugging server Somerset Recon

BUT WAIT THERE'S MORE!
 Revisiting J-Link hardware via firmware flashing process  Crafting firmware malware
Somerset Recon

J-Link Updating Process
 J-Link Commander will ask you if you'd like to update your connected J-Link Debug Probe  We figured out how the update process works
 We reversed the USB protocol
Somerset Recon

J-Link Updating Process
 Firmware is checked on the device before flashing, but not very well  Hint: It uses dates  Can this be bad?
 Firmware is not signed and can be modified How could this be bad?
Somerset Recon

Malware
Consider a piece of malware that gets circulated via email, etc.:  Runs silently  Flashes any J-Link connected to the computer  Exits cleanly
Somerset Recon

Malware - DEMO  Demo
Somerset Recon

Questions?
We will be posting slides, source code, and additional info:  Slides and POCs: https://github.com/Somerset-Recon  Blog post: https://www.somersetrecon.com/blog Contact:  @SomersetRecon  https://www.somersetrecon.com/contact
Somerset Recon

