MacOS Big Sur

Bio Twitter(@peterpan980927)   iOS/macOS & KCon 2019 PPT &
0 1

Agenda

1.

Backgrounds

2.

Some case studies

3.

Mitigations overview & new features

4.

Attack macOS Big Sur

5.

Summary & Credit

0 2

Backgrounds

AppleOS Kernel XNU: X is not Unix(Hybrid Kernel)
1. Mach->(micro kernel) 2. BSD 3. IOKit
0 3

Mach Ports

Basic concepts

/osfmk/ipc/ipc_object.h struct ipc_port {

struct ipc_object ip_object;

1. Communication channels for IPC

...

2. 32bit number in userspace

};

3. ipc_port struct in kernel space

struct ipc_mqueue ip_messages;

4. Single receiver/One or Multiple Senders

struct ipc_object {

ipc_object_bits_t io_bits;

ipc_object_refs_t io_references;

lck_spin_t io_lock_data;

}___attribute__((aligned(8)));

0 4

Mach Ports Basic concepts

1. Many kernel data objects are wrapped with mach ports 2. E.g: Tasks(tfp0)/Driver instance(C++ obj)/clock/file_glob...

/osfmk/kern/ipc_kobject.h

#define IKOT_CLOCK

25

#define IKOT_IOKIT_CONNECT

29

#define IKOT_IOKIT_OBJECT

30

#define IKOT_VOUCHER

37

...

0 5

Mach Ports For IPC Overview
0 6

Apple Driver IOKit part
IOKitC++  ... RTTI
KEXTApple Driver
0 7

Apple Driver
Why?
1. Kexts run inside kernel, some can even reachable within the sandbox
2. Kext deprecated in WWDC 2019 3. System Extension replacing third party kext: DriverKit
NetworkExtensionEndpoint Security 4. Less developers, less attention
0 8

Apple Driver
Attack Surface
1. ExternalMethod(driver independent) 2. Notification Port(CVE-2020-9768) 3. SharedMemory(TOCTOU) 4. clientClose(CVE-2018-4326) 5. setProperties(CVE-2016-1835) Etc...
0 9

Apple Driver
Attack Surface
1. ExternalMethod(driver independent) 2. Notification Port(CVE-2020-9768) 3. SharedMemory(TOCTOU) 4. clientClose(CVE-2018-4326) 5. setProperties(CVE-2016-1835) Etc...
1 0

Apple Driver Attack Surface

http://homes.sice.indiana.edu/luyixing/bib/CCS20-iDEA.pdf

1 1

Case studies

Case Studies CVE-2016-1825(bazad)
1 2

Case Studies CVE-2018-4327(brightiup)
1 3

Case Studies CVE-2020-9768
registerNotificationPortport portport-1

https://proteas.github.io/ios/vulnerability/2020/03/27/analysis-of-CVE-2020-9768.html

1 4

Case Studies CVE-2020-9768
startDecoder portport 
1 5

From N day to 0 day

From N day to 0 day Inspiration examples
1 6

From N day to 0 day
Key point 1
Point: "it remained in the codebase and on all iPhones since 2014, reachable from the inside of any sandbox. You would have triggered it though if you had ever tried to use this code and called task_swap_mach_voucher with a valid voucher. "
1 7

From N day to 0 day Key point 2
Point: "Now a natural question comes into our mind: how many connections can a client connect to a host at mo st? With this question in mind, we created a simple test program that simply creates an MPTCP socket and connects to a host many times.
Our purpose is to figure out when we cannot create new connections. "
1 8

From N day to 0 day Key point 3
Point: "IO80211FamilyV2 is a brand new design for the mobile era.IO80211FamilyV2 and AppleBCMWLANCore integrate the original AirPort Brcm4331 / 4360 series drivers, with more features and better logic.Please also keep in mind, new features always mean new attack surfaces. "
1 9

From N day to 0 day Case 1
2 0

From N day to 0 day Case 1
2 1

From N day to 0 day Case 1(upper handle)
2 2

From N day to 0 day Case 2
2 3

From N day to 0 day Case 3
2 4

From N day to 0 day Case 3
2 5

From N day to 0 day Case 4
2 6

Mitigations Overview

Mitigations Overview
Old mitigations
1. PAN/PXN(SMAP/SMEP) 2. PAC 3. KASLR(kernel image/heap) 4. APRR(PPL/JIT) 5. KPP->KTRR 6. zone_require/task_conversion_eval...
2 7

Mitigations Overview
New mitigations
Kernel heap isolation - default.kalloc - data.kalloc - kext.kalloc - Temp(alias to default)

Auto-Zeroing

- Z_ZERO

- Zfree_clear_mem

2 8

Attack macOS Big Sur

Attack macOS Big Sur What we want? 1. EoP 2. Kernel Code Execution 3. 100% stable
2 9

Attack macOS Big Sur Kernel Debug?
3 0

Attack macOS Big Sur CVE-2021-1757
3 1

Attack macOS Big Sur CVE-2021-1757
3 2

Attack macOS Big Sur OOB Read
3 3

Attack macOS Big Sur
Faked struct
struct IOExternalMethod { IOService * object; IOMethod func; IOOptionBits flags; IOByteCount count0; IOByteCount count1;
};
3 4

Attack macOS Big Sur Faked struct
If (func & 1){ vtable+func(...)
} else { func(...)
}
3 5

Attack macOS Big Sur Panic Try
3 6

Attack macOS Big Sur Heap Spray
3 7

Attack macOS Big Sur Control more
3 8

Attack macOS Big Sur Type Conversion
3 9

Attack macOS Big Sur Type Conversion
4 0

Attack macOS Big Sur JOP+ROP
4 1

Attack macOS Big Sur Where is my slide?
1. Find another info leak 2. Use this bug to do a type
conversion
4 2

Attack macOS Big Sur Failed Attempts
1. Leak pointers/members to outputStruct?
2. Use indirect call to copy info to heap we control?
4 3

Attack macOS Big Sur Ret2leak!(Never forget about the return value)
4 4

Attack macOS Big Sur Heap Feng Shui
4 5

Show time

Attack macOS Big Sur Demo
4 6

Attack macOS Big Sur Demo
4 7

Summary & Credit

Summary
1. Simple problems can have serious impact on modern system 2. Code qualities should always be consistent with mitigations 3. Never limit yourself during developing the exploit
4 8

Credit
1. Google Project Zero/Pangu Team/Wangyu's slides 2. Examples used in this slide 3. Shrek_wzw/Proteas/ThomasKing2014's guidance and help
4 9


KCon 
MA N O E U VR E

