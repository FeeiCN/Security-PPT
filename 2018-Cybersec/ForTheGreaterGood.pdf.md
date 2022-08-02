LEVERAGING VMWARE'S RPC INTERFACE FOR FUN AND PROFIT
1

Agenda
· Introduction · VMware General Architecture (Simplified) · Host <-> Guest Communication
­ Backdoor Interface
· VM RPC Interface
­ Functions ­ Recording Guest -> Host RPC requests
· Developing tools to query the RPC Interface
­ C++ ­ Python
· C Extension · CTypes
· VMware UAF Exploitation
­ Controlling Freed Objects ­ Finding Exploit primitives ­ Demo
· Conclusion
2

Introductions
3

Abdul-Aziz Hariri
· BS in Computer Sciences ­ University of Balamand · Currently a Senior Security Researcher at ZDI
­ Root Cause analysis / Vulnerability Research / Exploit development ­ ZDI Case Lead ­ Pwn2Own Preparation / Judging entries
· Past Experiences
­ Bits Arabia, Insight-Tech and Morgan Stanley
· Past research:
­ Pwn4Fun 2014 renderer exploit writer ­ Microsoft Bounty submission ­ Patents on Exploit Mitigation Technologies ­ Adobe Reader research
· Twitter: @abdhariri
4

Jasiel Spelman
· BA in Computer Science ­ University of Texas at Austin · Currently a Senior Security Researcher at ZDI
­ Root Cause analysis / Vulnerability Research / Exploit development ­ ZDI Research Lead ­ Pwn2Own Invigilator
· Past Experiences
­ TippingPoint Digital Vaccine team
· Past research:
­ Pwn4Fun 2014 sandbox escape exploit writer ­ Patents on zero day protection technologies ­ Windows kernel information leaks ­ Adobe Flash RE & RCE vulnerabilities
· Twitter: @WanderingGlitch
5

Brian Gorenc
· BS in Computer Engineering ­ Texas A&M University · MS in Software Engineering ­ Southern Methodist University · Director of Vulnerability Research at Trend Micro
­ Leads the Zero Day Initiative ­ Organizes Pwn2Own ­ Approver of Payments
· Past Experiences
­ Lead Developer at Lockheed Martin
· Past research:
­ Microsoft Bounty submission ­ Patents on Exploit Mitigation Technologies ­ Bug hunting in many products
· Twitter: @MaliciousInput
6

VMware General Architecture
7

VMware General Architecture (Simplified*)

Hypervisor

Management Layer

vmware-vmx

vmware-vmx

I/O

I/O

What's going on here?

CPU

CPU
Guest

vmware tools libs
Guest

8

* very

Good Question
· As it turns out, quite a bit · Regardless of whether VMware tools are installed
9

Host <-> Guest Communication
10

Host <-> Guest Communication
· Communication is done by accessing special I/O ports · VMware implements an interface called "Backdoor"
­ Hijacks the IN/OUT instructions ­ Supports multiple commands ­ Supports two protocols: RPCI and TCLO ­ Can be used to extract host information ­ Can be used to send Guest->Host RPC requests
· The Backdoor interface is enabled by default
11

Host <-> Guest Communication - Backdoor
· Supports multiple commands/functions
­ The commands can be found in the open-vm-tools on github
­ backdoor_def.h defines these commands
· The guest can invoke more of these commands than you think...
12

Host <-> Guest Communication - Backdoor
· Invoking Backdoor functions is simple:

mov eax, 564D5868h /* magic number */

mov ebx, command-specific-parameter

mov cx, command-number /* 1001e = RPC */

mov dx, 5658h

/* VMware I/O port */

in eax, dx

13

Host <-> Guest Communication - Backdoor

Hypervisor (host)

Backdoor Channel
Low-bandwidth
RPCI
High-bandwidth
Other

Guest (vm)

TCLO
Backdoor Channel
14

Host <-> Guest Communication - RPCI
· Supports multiple commands
­ Rpctool.exe can be used to query some of the commands.
­ Rpctool.exe is open source and can be found in the open-vm-tools
­ These RPC commands can be found in vmwarevmx.exe and sprinkled throughout the open-vmtools source
15

Host <-> Guest Communication - RPCI
16

Host <-> Guest Communication ­ Summary
· Backdoor Interface is used for Host/Guest communication · Hijacks in/out instructions · RPCI is used from guest -> host · TCLO is used from host -> guest · RPCI commands can be found in vmware-vmx{.exe} · open-vm-tools is a goldmine!
17

VM RPC Interface
18

GuestRPC
· The RPC requests are sent through the "backdoor" channel · Specifically, the BDOOR_CMD_MESSAGE (0x1E) · The Guest Messages are defined in guest_msg_def.h · GuestRPC supports multiple message types:
19

GuestRPC

· Example of a simple GuestRPC message:
mov eax, 0x564D5868 mov ecx, 0x001e //MESSAGE_TYPE_OPEN mov edx, 0x5658 mov ebx, 0xC9435052 in eax, dx
mov eax, 0x564D5868 mov ecx, 0x1001e //MESSAGE_TYPE_SENDSIZE mov edx, 0x5658 mov ebx, SIZE in eax, dx

mov eax, 0x564D5868 mov ecx, 0x6001e //MESSAGE_TYPE_CLOSE mov edx, 0x5658 mov ebx, SIZE in eax, dx

20

GuestRPC
· GuestRPC requests are are parsed within vmware-vmx{.exe} · GuestRPC Messages/Functions are also implemented inside vmware-vmx{.exe}
· If we look closely inside GuestRPC_Funcs we will notice the following:
21

GuestRPC ­ ExecRPCRequest
· The function takes the RPC request as an argument · Checks if the RPC function being passed is valid · Checks if we have enough permissions to execute the
function · Executes it
22

GuestRPC ­ Sniffing RPC Requests
· Since this is exactly where RPC requests are parsed, we can actually hook this function and sniff the requests being sent
· For this task we used pykd 
­ Set a breakpoint on the ExecRPCRequest function ­ A pointer pointing to the request is set in the r8 register ­ The length of the request is set in the r9 register
· Should look similar to the following
23

GuestRPC ­ Sniffing RPC Requests - DEMO
· DEMO
24

Developing tools to query the RPC Interface
25

Tools Dev
· One of the challenging problems with VMware and RPC is tools development for:
­ Case analysis ­ Exploit development ­ Fuzzing
· While we can definitely use the open-vm-tools to develop tools in C++, there are still challenges:
­ There are functions that definitely needs to be implemented in ASM ­ Without ASM we'll need to use the exports from vmtools.dll
· Still a little bit of a hustle
26

Tools Dev - C++, take 1
· Add the open-vm-tools headers to the Include Directories
27

Tools Dev - C++, take 2
· Assembly..Since some function are not fully implemented in the tools, thus in order to step out of the vmtools.dll we'd need to implement some functions in ASM
28

Tools Dev - C++, take 2, continued
· As for implementing a function to send RPC requests through the backdoor channel in ASM, it should be pretty simple
29

Tools Dev
· All that is still not enough · We need something for FAST tools development · Python? Yup, we implemented simple ways to send RPC requests through
python:
­ C Extensions ­ Ctypes
· Unfortunately, Josh (@kernelsmith) (our DevOps manager) wanted to implement something similar in Ruby.
30

Tools Dev ­ Python, C Extensions
· C Extensions are awesome · It's a shared Library (.pyd) on Windows which exports an initialization
function · The shared library can be imported from python
31

Tools Dev ­ Python, C Extensions
32

Tools Dev ­ Python, CTypes
· Ctypes provides C compatible data types · Allows calling functions in DLLs or shared libraries
33

Fuzzing the RPC Interface
34

Fuzzing the RPC Interface
· Fuzzing the RPC interface requires tooling both on the GuestOS and the HostOS
· Some problems that we'd need to tackle:
­ Detecting Crashes from the host (Mostly debugging vmware-vmx in this case) ­ Testcase generation (can be on the GuestOS but we want the guest to stay light) ­ GuestOS VM(s) management from the HostOS
35

Fuzzing the RPC Interface

Framework

start mutator

Manage through vmrun

Agent

attach vmx
monitor
Host
Send test cases

VMWare WorkStation

36

Fuzzing the RPC Interface - InMemory
· Since we know exactly were the RPC requests are being parsed, we can actually do InMemory fuzzing:
­ Hook ExecRPCRequest (on the HostOS) ­ Modify the RPC request before it gets parsed ­ Wait for crashes
· Additional tooling required:
­ Crash Detection (From HostOS) ­ Record modifications (From the HostOS)
37

Fuzzing the RPC Interface - InMemory
DEMO
38

VMware Drag and Drop UAF
39

VMware DnD UAF ­ Root Cause
· The Free is triggered when the DnD version is changed multiple times · The re-use happens when a random DnD function is called after the Free · The PoC is relatively simple:
40

VMware DnD UAF ­ Root Cause
· If triggered successfully we should end up in a crash similar to the following:
· To verify further, !heap ­p ­a @RCX will show us where the Free happened:
41

VMware DnD UAF ­ Root Cause
· Next, we will need to get the size of the Free'd object · In order to do that, we will need to break right before the Free happens and run
!heap ­p ­a on the address before it gets Freed
42

VMware DnD UAF ­ Exploiting the vulnerability
· First we will need to find a way to control the Freed object before it gets re-used
· This can be done by sending an arbitrary GuestRPC request through the backdoor channel
· For example through the tools.capability.guest_temp_directory RPC function
43

VMware DnD UAF ­ Exploiting the vulnerability
· Next question is where should I put my ROP chain? Should I heap spray? · The answer was in the unity.window.contents.start RPC function
44

VMware DnD UAF ­ Exploiting the vulnerability
· What does the plan of action look like now?
­ Send a unity.window.contents.start request with a ROP chain that sets RSP to RDI. ­ Trigger the free. ­ Overwrite the freed object with another one. The freed object should contain the address of
vmware_vmx+0xb870f8. ­ Trigger the re-use using a request that contains the ROP chain to gain RCE.
· There is an RWX region in vmware-vmx, so you know what the ROP chain should do ;)
45

VMware DnD UAF
46

Conclusion
47

49

