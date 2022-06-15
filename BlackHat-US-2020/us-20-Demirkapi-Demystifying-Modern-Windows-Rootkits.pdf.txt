Demystifying Modern Windows Rootkits
Bill Demirkapi Independent Security Researcher

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

1

Who Am I?
 18 years old  Sophomore at the Rochester Institute of Technology  Windows Internals  Mostly self-taught (with guidance)  Strong "Game Hacking" background

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

2

What Is This Talk About?
In this talk, we'll go over...  Loading a rootkit.  Communicating with a rootkit.  Abusing legitimate network communications.  An example rootkit I wrote and the design choices behind it.  Executing commands from kernel.  Tricks to cover up the filesystem trace of your rootkit.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

3

Introduction to Windows Rootkits

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

4

Windows Rootkits: An Overview
Why would you want to use a rootkit?  Kernel drivers have significant access to the machine.  Same privilege level as a typical kernel anti-virus.  Less mitigations and security solutions targeting kernel malware.  Anti-Virus often have less visibility into operations performed by
kernel drivers.  Kernel drivers are often ignored by anti-virus.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

5

Example: Treatment by Anti-Virus
Anti-virus tends to treat kernel drivers with significant trust compared to user-mode applications.
Excerpt from Malwarebytes' Process/Thread Handle callbacks

Excerpt from Carbon Black's Process/Thread Handle callbacks

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

6

Loading a Rootkit

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

7

Abuse Legitimate Drivers
There are a lot of "vulnerable" drivers. With some reversing knowledge, finding a "0-day" in a driver can be trivial.
Examples include...  Capcom's Anti-Cheat driver  Intel's NAL Driver  Microsoft themselves!

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

8

Abuse Legitimate Drivers
Using legitimate drivers has quite a few benefits too:
 You only need a few primitives to escalate privilege.  Finding a "vulnerable" driver is relatively trivial (OEM Drivers ).  Difficult to detect due to compatibility reasons.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

9

Abuse Legitimate Drivers
Abusing legitimate drivers comes with some strong drawbacks too...
 Major issue of compatibility across operating system versions depending on the primitives you have.
 Much more likely to run into stability issues.  The last thing you want is your malware to BSOD a victim.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

10

Just Buy a Certificate!
For some red teamers, buying a legitimate code signing certificate might be a good option.
 Useful for targeted attacks.  No stability concerns. But...  Potentially reveals your identity.  Can be blacklisted.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

11

Abuse Leaked Certificates

Instead of buying a certificate yourself, why not just use one from someone else?

 There are quite a few public leaked certificates available to download.  Almost has all the benefits of buying one without deanonymization.
But...  The leaked certificate you use can be detected in the future.  If the certificate was issued after July 29th, 2015, it won't work on
secure boot machines running certain versions of Windows 10.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

12

Abuse Leaked Certificates
In most cases, Windows doesn't care if your driver has a certificate that has expired or was revoked.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

13

Abuse Leaked Certificates
Several leaked certificates are already publicly posted, but it's not impossible to find your own.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

14

Abuse Leaked Certificates
Oh and the best part.... most of them are undetected by the bulk of AV:

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

15

Communicating with a Rootkit

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

16

Beacon Out to a C2
A tried and true method that comes with some downsides is to "call home".
 Firewalls can block or flag outgoing requests to unknown/suspicious IP Addresses or ports.
 Advanced Network Inspection can catch some exfiltration techniques that try to "blend in with the noise".

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

17

Open a Port
Some malware takes the route that the C2 connects to the victim directly to control it.
 Relatively simple to setup. But...  Could be blocked off by a firewall.  Difficult to "blend in with the noise".

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

18

Application Specific Hooking
More advanced malware may opt to hook a specific application's communication as a channel of communication.
 Difficult to detect, especially if using legitimate protocol. But...  It's not very flexible.  A machine might not have that service exposed.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

19

Choosing a Communication Method
What I want... 1. Limited detection vectors. 2. Flexibility for various environments.
My assumptions... 1. Victims machines will have some services exposed. 2. Inbound and outbound access may be monitored.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

20

Choosing a Communication Method
Application Specific Hooking was perfect for my needs, except for the flexibility.
Is there anyway we could change Application Specific Hooking to where it isn't dependent on any single application?

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

21

Abusing Legitimate Communication
What if instead of hooking an application directly, we...
 Hook network communication, similar to tools like Wireshark.  Place a special indicator in "malicious" packets, a "magic" constant.  Send these "malicious" packets to legitimate ports on the victim
machine.  Search packets for this "magic" constant to pass on data to our
malware.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

22

Hooking the User-Mode Network Stack

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

23

Hooking the Windows Winsock Driver
 A significant amount of services on Windows can be found in usermode, how can we globally intercept this traffic?
 Networking relating to WinSock is handled by Afd.sys, otherwise known as the "Ancillary Function Driver for WinSock".
 Reversing a few functions in mswsock.dll revealed that a bulk of the communication was done through IOCTLs. If we could intercept these requests, we could snoop in on the data being received.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

24

How Do Irps Know Where to Go?
When you call NtDeviceIoControlFile on a file handle to a device, how does the kernel determine what function to call?

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

25

Standard Methods of Intercepting Irps
There are a few ways we can intercept Irps, but let's look at two common methods.
1. Replace the Major Function you'd like to hook in the driver's object. 2. Perform a code hook directly on the dispatch handler.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

26

Picking a method
To pick the best method of hooking, here are a few common questions you should ask.
 How many detection vectors are you potentially exposed to?  How "usable" is the method?  How expensive would it be to detect the method?

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

27

Hook a Driver Object
 How many detection vectors are you potentially exposed to?
 Memory artifacts.
 How "usable" is the method?
 For stability, by replacing a single function with an interlocked exchange, this method should be stable.
 For compatibility, driver objects are well-documented and easy to find.
 How expensive would it be to detect the method?
 Inexpensive, all anti-virus would need to do is enumerate loaded drivers and check that the major functions are within the bounds of the driver.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

28

Hook a Driver's Dispatch Function
 How many detection vectors are you potentially exposed to?
 Memory artifacts.
 How "usable" is the method?
 Unless the function is exported, you will need to find the function yourself.  Not all drivers are compatible with this method due to PatchGuard.  HVCI incompatible.
 How expensive would it be to detect the method?
 Potentially inexpensive and several methods to detect hooking.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

29

Hooking File Objects
I wanted a method that was...  Undocumented.  Stable.  Relatively expensive to detect.
What if instead of hooking the original driver object, we hooked the file object instead?

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

30

How Do Irps Know Where to Go?

To retrieve the device associated with the Afd driver, the kernel calls IoGetRelatedDeviceObject.

typedef struct _FILE_OBJECT { CSHORT Type; CSHORT Size; PDEVICE_OBJECT DeviceObject; ... } FILE_OBJECT;

What's stopping us from overwriting this pointer?

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

31

Hooking File Objects
What we can do is... 1. Create our own device object and driver object. 2. Patch our copy of the driver object. 3. Replace the DeviceObject pointer of our file object with our own
device.
Let's talk about how we would go about doing this.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

32

Hooking File Objects
Let's start by finding a file object to hook. We're after handles to \Device\Afd, but how can we find these objects?
typedef enum _SYSTEM_INFORMATION_CLASS { ... SystemHandleInformation, ... } SYSTEM_INFORMATION_CLASS, *PSYSTEM_INFORMATION_CLASS;

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

33

Hooking File Objects
The SystemHandleInformation class allows us to query all handles on the system, including...  The process ID the handle belongs to.  The kernel pointer of the object associated with the handle.
If we open the Afd device ourselves, we can easily recognize file objects that are for the Afd device.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

34

Hooking File Objects

Before we can overwrite the DeviceObject member, we need to create our fake objects first. Fortunately, the kernel exports the function it uses itself to create these objects.

All we need to do is call ObCreateObject passing the IoDriverObjectType or IoDeviceObjectType to create our fake objects.

We can copy the existing objects over to contain the same member values.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

35

Hooking File Objects
With our fake objects created, we're almost ready to set the DeviceObject of the file object. First though, we need to hook our driver object.
We can use the standard "Hook a Driver Object" method, except instead of performing it on the original driver object, we'll use it on a fake driver object used exclusively for our hooks.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

36

Hooking File Objects
To prevent race conditions while replacing the device object member, the original device object we use inside of our hooked dispatch must be set at the same time we the DeviceObject member of the file object.
To do this, simply perform an interlocked exchange of the original device object and the device object our hook uses.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

37

Hooking File Objects
Now that we've hooked the file object, there is not much work left.
In our dispatch hook, we need to... 1. Check if we are hooking the MajorFunction being called.
1. If we are, call the hook function passing the original device object and original dispatch function for that MajorFunction.
2. Make sure to restore the original DeviceObject when the MajorFunction is IRP_MJ_CLEANUP.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

38

Hooking File Objects
 How many detection vectors are you potentially exposed to?
 Memory artifacts.
 How "usable" is the method?
 Most of the functions we use are at least semi-documented and unlikely to change significantly.
 How expensive would it be to detect the method?
 Expensive, an anti-virus would have to replicate our hooking process and enumerate file objects to determine if the device/driver object was swapped.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

39

How the Spectre Rootkit Abuses the User-Mode Network Stack

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

40

Abusing the Network
Using the File Object hook, we can now intercept Irps to the Afd driver.
This allows us to...  Intercept all user-mode networking traffic.  Send and receive our own data over any socket.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

41

Abusing the Network

To review, our existing plan is to...
 Hook network communication, similar to tools like Wireshark.
 Place a special indicator in "malicious" packets, a "magic" constant.
 Send these "malicious" packets to legitimate ports on the victim machine.
 Search packets for this "magic" constant to pass on data to our malware.

How can we actually retrieve the content of packets that are received?

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

42

Abusing the Network

For receive operations, an IOCTL with the code IOCTL_AFD_RECV is sent to the Afd driver. Here is the structure sent in the input buffer.
typedef struct _AFD_RECV_INFO { PAFD_WSABUF BufferArray; ULONG BufferCount; ULONG AfdFlags; ULONG TdiFlags; } AFD_RECV_INFO, * PAFD_RECV_INFO;
typedef struct _AFD_WSABUF { UINT len; PCHAR buf; } AFD_WSABUF, * PAFD_WSABUF;

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

43

Parsing Packets: Design
Let's talk about how the Spectre Rootkit was designed.
Spectre Rootkit Packet Structure Any prepended data Magic Constant Base Packet Structure
Optional Custom Structure Any appended data

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

44

Parsing Packets: Pre-Processing
Here is the process used when the Spectre Rootkit receives a packet.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

45

Parsing Packets: Processing
Before dispatching a packet, we need to create a complete packet.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

46

Packet Handlers
Before we go any further, let's talk about the concept of "Packet Handlers" in the Spectre Rootkit.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

47

Packet Handlers
An example of a packet handler included with the Spectre Rootkit is the PingPacketHandler. This handler is used to determine if a machine/port is infected.
The incoming packet has no actual data, other than indicating its Type is a Ping. The handler responds to the client with an empty base packet with the Type set to Ping.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

48

Parsing Packets: Dispatching
Once a packet is completely populated, the "packet dispatcher" will...

Here's why the "packet dispatcher" is awesome: by passing a pointer to itself to the relevant packet handler, that packet handler can recursively dispatch a new packet!

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

49

Packet Handlers: XorPacketHandler
The best way to explain the recursive nature of the "packet dispatcher" is through an example, such as the XorPacketHandler.
The XorPacketHandler takes a XOR_PACKET structure:

This XOR_PACKET does not actually perform a malicious operation. Instead, it acts as an encapsulating packet.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

50

Packet Handlers: XorPacketHandler
When the XorPacketHandler receives a packet, it will... 1. Use the XorKey to deobfuscate the XorContent. 2. Recursively dispatch the XorContent as a new packet.
The model that the Spectre Rootkit uses allows you to create infinite layers of encapsulation.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

51

Executing Commands
Let's take a look at how we can execute commands from our rootkit, a common feature seen in a variety of Windows malware.
Before we get into starting a process from a kernel driver, it's important to understand how we would execute commands from a user-mode context.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

52

Executing Commands: User-mode

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

53

Executing Commands: Kernel-mode
Let's start by creating the pipes we need to obtain output. Here is what CreatePipe does in the background...

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

54

Executing Commands: Kernel-mode
Now that we have pipes, we need to create the actual process. We'll use ZwCreateUserProcess because that's what kernelbase.dll uses itself to create processes.
Let's start with the attribute list for the process.  The most important attribute we have to set is
PsAttributeImageName. This will specify the image file name for the new process.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

55

Executing Commands: Kernel-mode
Next, we have to fill out a RTL_USER_PROCESS_PARAMETERS structure for the process.
In this structure, we need to set... 1. The window flags and the output handles to our pipes. 2. The current directory, the command line arguments, the process
image path, and the default desktop name.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

56

Executing Commands: Kernel-mode
From there, all it takes is a call to ZwCreateUserProcess to start the process.
Once the process has exited, similar to what we do in user-mode, we can call ZwReadFile to read the output from the unnamed pipe.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

57

Hiding a Rootkit

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

58

Introduction to Mini-Filters
Mini-filter drivers allow you to attach to volumes and intercept certain file I/O. This is performed by registering with the Filter Manager driver.

Source: Microsoft Docs

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

59

Introduction to Mini-Filters
Mini-filters can be useful to mask the presence of our rootkit on the filesystem.
For example, a mini-filter can direct all file access for a certain file to another file. We can use this functionality to redirect access to our driver file to another legitimate driver.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

60

Picking a method
To pick the best method of hooking, here are a few common questions you should ask.
 How many detection vectors are you potentially exposed to?  How "usable" is the method?  How expensive would it be to detect the method?

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

61

Become a Mini-Filter

The easiest way to abuse the functionality of a mini-filter is to become one yourself. Here are the minimum requirements for FltRegisterFilter:
1. Create [ServiceKey]\Instances
2. Create [ServiceKey]\Instances\[An instance name]
3. In [ServiceKey]\Instances add a "DefaultInstance" and set it to your instance name used in step 2.
4. In [ServiceKey]\Instances\[An instance name], add the "Altitude" and "Flags" values.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

62

Become a Mini-Filter
 How many detection vectors are you potentially exposed to?
 Registry and memory artifacts.
 How "usable" is the method?
 No concerns from stability or usability, this is how other legitimate drivers register as mini-filters.
 How expensive would it be to detect the method?
 Inexpensive. Besides the registry artifacts, drivers that are registered as minifilters can easily be enumerated through API such as FltEnumerateFilters.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

63

Hook a Mini-Filter
Another method is to simply hook an existing mini-filter. There are a couple of routes you could take.
 Code hook the callback for an existing filter.  Overwrite the FLT_REGISTRATION structure before the victim driver
uses it to have your own callback.  DKOM an existing filter instance and replace the original callback with
yours.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

64

Hook a Mini-Filter: Code Hook
One of the easiest way to intercept callbacks to an existing mini-filter is to simply perform a code hook.
This can be as simple as a jmp hook, but it comes with quite a few drawbacks, similar to those we saw in an earlier section where we discussed intercepting Irps.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

65

Hook a Mini-Filter: Code Hook
 How many detection vectors are you potentially exposed to?
 Memory artifacts.
 How "usable" is the method?
 Unless the function is exported, you will need to find the function yourself.  Not all drivers are compatible with this method due to PatchGuard.  HVCI incompatible.
 How expensive would it be to detect the method?
 Potentially inexpensive and several methods to detect hooking.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

66

Hook a Mini-Filter: DKOM
A semi-documented method of hooking an existing mini-filter is through DKOM.
You can enumerate filters and instances through the documented APIs FltEnumerateFilters and FltEnumerateInstances.
The function that gets called for a certain operation is specified in the CallbackNodes array in the FLT_INSTANCE structure.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

67

Hook a Mini-Filter: DKOM
 The CallbackNodes array index is associated with the major function you're hooking.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

68

Hook a Mini-Filter: DKOM
 How many detection vectors are you potentially exposed to?
 Memory artifacts.
 How "usable" is the method?
 For stability, although obtaining a FLT_INSTANCE structure is documented, the FLT_INSTANCE structure itself is undocumented.
 How expensive would it be to detect the method?
 Inexpensive, an anti-virus would need to occasionally enumerate registered filters and their instances for hooks in the CallbackNodes array.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

69

Example: Abusing a Mini-Filter
Let's say you want to protect a certain file, what's an example of redirecting access to it?

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

70

Wrap Up

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

71

Thanks to...

Alex Ionescu (@aionescu)  Long-time mentor very experienced with Windows Internals.

ReactOS  A fantastic reference for undocumented functions and structures.

Nemanja Mulasmajic (@0xNemi) and Vlad Ionescu (@ucsenoi)  Helped review this presentation.

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

72

Contact / Questions

Thanks for sticking around! Now is the time for any questions.

Twitter @BillDemirkapi Blog https://billdemirkapi.me Spectre Rootkit https://github.com/D4stiny/spectre

Demystifying Modern Windows Rootkits ­ Black Hat USA 2020

73

