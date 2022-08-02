Fuzzing Kernel Drivers with Interface Awareness
By Jake Corina and Chris Salls

Linux Kernel
- Generally:
User Space

System Calls

Kernel Space

- Kernel takes care of many things (process management, memory management, filesystems, device control, etc).
- Device handling is done in the kernel.

Device Drivers
- Generally implemented as kernel modules - There must be an interface exported to userland - Same as standard interface - How is this done? - "Everything is a file" - Special device files on disk

Operations on Files
- Let's look at how it's done for a "normal" file. - Common syscalls: open, read, write, lseek, etc. - file_operations structure -- "fops", "f_ops"

Device Files
- As we said, device drivers generally create special files on disk to represent the physical device (for which they drive).
- How is this done? - What's the process, from device registration, to having a file to
talk to?

Request a region of char device numbers. Place the allocated region into IspDevNo. Associate the range with ISP_DEV_NAME

Request a region of char device numbers. Place the allocated region into IspDevNo. Associate the range with ISP_DEV_NAME

Associate the allocated device with IspFileOper, a file_operations structure.

Add the device to the system. At this point, the device is "live".

Ioctl(s)
- Input Output Control. - System call to allow device operations that can't be well
modeled as a "normal" syscall.

Things to Note
- Modular: Allows vendors to add support for hardware! - Security implications? - Where is this especially prevalent?

Android
- Based on Linux. - Dominates the smartphone OS market. 86.8% of the market in
2016 Q3 (Source: IDC, Nov 2016) - LOTS of hardware to support  Lots of drivers - So what, are drivers really an issue?

(Jeffrey Vander Stoep of Android Security. 2016. Android: protecting the kernel. In Linux Security Summit. Linux Foundation.)

Why?
- Well defined interface - Which syscall is the problem?

(Jeffrey Vander Stoep of Android Security. 2016. Android: protecting the kernel. In Linux Security Summit. Linux Foundation.)

Ioctl

ioctl(int fd, unsigned long command, unsigned long param);

copy_from_user(void * to, void __user * from, unsigned long n)

Solutions
- Static Analysis
- Tons of false positives, huge amount of work to manually check every warning.
- Dynamic Analysis
- Fuzzing

Fuzzing
- General idea: send random input to a program in hopes of triggering a bug
- Guaranteed real bugs, and we have a POC to go with it! :)

Kernel Fuzzing
- Model each syscall so we know how to call it and what to pass as arguments
- This is very hard for ioctls - Recovering this interface requires LOTS of manual effort, and
as such, ioctls are often neglected when fuzzing. - Even with a recovered interface, it can be very hard to generate
the correct arguments (super complex structs with embedded substructs, pointers, etc).

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers
Inputs: Cmd: 43256 Param: 65443
Cmd: 1337 Param: 123654
Cmd: 1337 Param:  4
Cmd: 1337 Param:  500

Fuzzing Drivers

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

Fuzzing Drivers
Inputs:
Cmd: 1337 Param:  [564645, 0...]
Cmd: 1337 Param:  [77, 321...]

DIFUZE
- Our system that attempts to solve this problem automatically.

DIFUZE
- Our system that attempts to solve this problem automatically.

DIFUZE
- Our system that attempts to solve this problem automatically.

Build Process Instrumentation
- For the majority of our analyses we use LLVM - Want LLVM bitcode - Linux Kernel uses GCC - Build the kernel normally with the provided makefile - Capture output (build commands) - Transform GCC commands to Clang commands - Link bitcode files

DIFUZE
- Our system that attempts to solve this problem automatically.

"Operations" Structure Recovery
- List of "operation" structures - Grep for definitions in includes - Use c2xml on relevant header files - Recover .unlocked_ioctl offset

Ioctl Handler Recovery
- Run analyses on the linked driver bitcode files and search for uses of the "operations" structures.
- Look for assignments at the offsets recovered - If found, we've found the ioctl handler for that driver, and we
store the name.

DIFUZE
- Our system that attempts to solve this problem automatically.

Device Name Recovery
- Where is this device file and what is it called? - Recall our journey through the registration of a device. - If there's a device file created, it must be associated with the
operations structure we've found! - We use analysis to recover static names

Dynamic Names
- Unfortunately the names aren't always static. - We miss dynamic names and must fallback to manual analysis.

DIFUZE
- Our system that attempts to solve this problem automatically.

Command Value + Type Recovery
- Found the ioctl handler function, we run LLVM analyses on the function.
- Know the arguments of interest. - We search for equality comparisons on "command", and keep
track of the constraints on a given path. - Search for copy_from_user using "param" - If found, we find the type associated with the first argument. - Follow functions that are passed "param" and/or "command"

Command Value: ISP_BUFFER_CTRL

Command Value: ISP_BUFFER_CTRL

Command Value: ISP_BUFFER_CTRL

Command Value: ISP_BUFFER_CTRL

Command Value: ISP_BUFFER_CTRL

Command Value: ISP_BUFFER_CTRL

Command Value: ISP_BUFFER_CTRL

Command Value: ISP_BUFFER_CTRL

Command Value: ISP_BUFFER_CTRL Type: ISP_BUFFER_CTRL_STRUCT

DIFUZE
- Our system that attempts to solve this problem automatically.

Structure Definition Recovery
- Have the GCC build commands - Know the file we're looking at - Use GCC command with -E - Get a HUGE (40k+ line) file which somewhere will include the
structure definition. - Run our good friend c2xml on the file and get an equally
massive xml file. - Python passes to extract the struct + struct dependencies,
account for padding, recover enum values, etc.

Summary

Source

Bitcode

Device Names

Ioctl Handler

Commands

Argument Types

Type Definitions

XML Spec

Awesome!
- Now we're entirely interface aware. - We know where the device file is, we know what commands we
can pass it, and we know what arguments those commands take. - Need instances of those structures so that we can actually exercise the behaviour of the device.

DIFUZE
- Our system that attempts to solve this problem automatically.

DIFUZE
- Our system that attempts to solve this problem automatically.

Structure Generation
- Harder than it seems - Embedded structures and pointers

0 1
3

2 4

DIFUZE
- Our system that attempts to solve this problem automatically.

Type Specific Value Generation
- Generate value(s) for each field in the structure
- Note that since we now have the type information, we can be intelligent about this!

DIFUZE
- Our system that attempts to solve this problem automatically.

MangoFuzz
- Written in Python - Consumes XML spec file(s) - XML spec files detail the interface information (device path,
ioctl command ID, target argument, and argument definition) - Outputs binary blobs, an array of mappings (if needed), and
interface info

XML Spec (jpit)

DIFUZE
- Our system that attempts to solve this problem automatically.

On Device Execution
- When it comes time to actually call ioctl(), it needs to be done on the device itself.
- Must be an actual execution component running on the device. - We connect the analysis host and the device via ADB (Android
Debug Bridge).

On Device Execution
- The executor runs on the device and listens for data that will be sent by the fuzzer component
- At this point, it will map the binary data into memory, and do the necessary pointer fixups.
- It will then open the device file specified, and call ioctl() with the command value sent, and the now memory mapped argument/structure

How do we detect a bug?
- Device reboots - the kernel backtrace/oops is saved in
/sys/fs/pstore/console-ramoops - We use this to triage crashes

Time To Test!
Manufacturer Google HTC HTC Huawei Huawei Samsung Sony

Device Pixel
E9 Plus One M9 P9 Lite Honor 8 Galaxy S6 Xperia XA

Chipset Qualcomm Mediatek Qualcomm
Huawei Huawei Samsung Mediatek

Device Name Recovery

Ioctl Handlers 789

Device Names Automatically Identified 469

- We automatically identify device names for roughly 60% of the ioctl handlers.
- Most of these misses come from mainline drivers, which have a tendency to use dynamic names.

Type + Command ID Recovery

Command ID's Recovered

Long/CTU

User Argument Types

Scalar

Struct Struct w/ Pointers

3565

1688

526

961

390

- For 47% of the commands, the user argument is used either as C Long, or is used as an address for copy_to_user, in these cases, no type recovery is needed.
- For the rest (53%), the user argument should be a pointer. - Command ID recovery. Random sample verification of 5 ioctls
for each phone (35 total handlers). 90% accuracy.

Fuzzing Evaluation

- 4 variants

- Syzkaller with:

- Extracted Device Path

(PATH)

- Extracted Device Path and Ioctl Numbers

(PATH+NUM)

- Extracted Device Path, Ioctl Numbers, and Structures (DIFUZES)

- MangoFuzz

- Extracted Device Path, Ioctl Numbers, and Structures (DIFUZEM)

Fuzzing Results

E9 Plus Galaxy S6
Honor 8 One M9 P9 Lite
Pixel Xperia XA
Total

PATH 0 0 0 0 1 2 3

PATH+NUM 4 1 3 2 2 10 22

DIFUZEs 6 2 3 5 5 13 34

DIFUZEm Total Unique

6

6

0

0

2

2

2

3

5

6

3

5

12

14

30

36

Some Fun Bugs

M4U Out Of Bounds Write
free_id set to -1
Incorrect else and free_id is still -1 Out of Bounds write to index -1

BUG() - CVE-2017-0636
Saw the following in the last kmsg:
"Unable to handle kernel paging request at virtual address 0000dead"

BUG() - CVE-2017-0636

BUG() - CVE-2017-0636
mmap(0xd000, ...) = 0xd000 Bypass assert and trigger memory corruption

CVE-2017-15307
- Suddenly, fuzzer could no longer find device - Serial Number had changed to "^RDO>l"

Conclusion
- Driver fuzzing can yield a lot of bugs - Modelling the interface correctly is important - DIFUZE automatically extracts this info to make fuzzing easy

Questions?

