"egg" - A Stealth fine grained code analyzer
Yuji Ukai - Chief Executive Officer Satoshi Tanda ­ Senior Engineer
Fourteenforty Research Institute, Inc.
http://www.fourteenforty.jp

Fourteenforty Research Institute, Inc.
Agenda
· Background and problems · Introduce "egg"
­ Demonstration its basic functions
· Implementation (Taint tracing approach in ring-0)
­ Demonstration of the taint tracing behavior
· Discuss a limitation of "egg" · Conclusion
2

Fourteenforty Research Institute, Inc.

Too many malwares!

100 90 80 70 60 50 40 30 20 10 0 2001 yr

The percentage of packed malwares

2003 yr

2005 yr

80% of malwares ware packed in 2007
2007 yr

· We can't manually analyze each malware. · Automatic approaches have become more important.
Source: 2001-2005 : McAfee Sage vol.1 issue 1 2007 : Panda Research (http://research.pandasecurity.com/malwareformation-statistics/)
3

Fourteenforty Research Institute, Inc.
Problems of traditional dynamic analyzers
· We can't get useful information for more intensive analysis. · We can't analyze a kernel mode code. · It's difficult to analyze a spreading malware over the process.
4

Fourteenforty Research Institute, Inc.
Innovative analyzers (based on VM environments)
· Innovative analyzers have already resolved the above problems
­ Anubis ­ Ether
· It's able to analyze a kernel mode code and perform an instruction level analysis.
­ BitBlaze and Renovo · Also these analyze a spreading malware automatically with approach called "taint tracing".
· However these systems are detected by VM detection techniques
5

Fourteenforty Research Institute, Inc.

Summary table of problems

Type of system

Traditional

Getting useful information Analyzing a kernel mode code Analyzing a spreading malware. Not affected by VM detection techniques

Insufficient Insufficient Insufficient Good

Innovative (Based on virtual environments)
Good Good Good Insufficient

· I developed "egg" to try and resolve these problems.

6

Fourteenforty Research Institute, Inc.
What is egg?
· "egg" is a dynamic analyzer based on a Windows device driver.
· egg has following capabilities: 1. It can obtain more detailed information. 2. It can analyze a kernel mode code. 3. It can automatically trace a spreading malware.
· Of course, It's not affected by VM detection techniques. · Also most common anti-debug tech can't detect "egg".
7

Fourteenforty Research Institute, Inc.

What kind of information does "egg" collect?

1. API arguments for IN, OUT (,INOUT), and return value

BOOL WINAPI ReadFile(

__in

HANDLE hFile,

__out

LPVOID lpBuffer,

__in

DWORD nNumberOfBytesToRead,

__out_opt LPDWORD lpNumberOfBytesRead,

__inout_opt LPOVERLAPPED lpOverlapped

);

8

Fourteenforty Research Institute, Inc.

What kind of information does "egg" collect?

1. API arguments for IN, OUT (,INOUT), and return value

BOOL WINAPI ReadFile(

__in

HANDLE hFile,

__out

LPVOID lpBuffer,

__in

DWORD nNumberOfBytesToRead,

__out_opt LPDWORD lpNumberOfBytesRead,

__inout_opt LPOVERLAPPED lpOverlapped

);

call to kernel32.dll!ReadFile( Arg 1 : 00000064 = File : ¥Device¥HarddiskVolume1¥WINDOWS¥(...) , Arg 3 : 00000800(2048)
)

9

Fourteenforty Research Institute, Inc.

What kind of information does "egg" collect?

1. API arguments for IN, OUT (,INOUT), and return value

BOOL WINAPI ReadFile(

__in

HANDLE hFile,

__out

LPVOID lpBuffer,

__in

DWORD nNumberOfBytesToRead,

__out_opt LPDWORD lpNumberOfBytesRead,

__inout_opt LPOVERLAPPED lpOverlapped

);

call to kernel32.dll!ReadFile( Arg 1 : 00000064 = File : ¥Device¥HarddiskVolume1¥WINDOWS¥(...) , Arg 3 : 00000800(2048)
)
returned from kernel32.dll!ReadFile( Arg 2 : 0012F184 - 0012F983 is dumped as ¥(...)¥(...)ReadFile_Arg02.bin
) => 00000001(1)
10

Fourteenforty Research Institute, Inc.

What kind of information does "egg" collect?

2. Callgraph 3. Branch information

Branch Info
(with IDA Pro)

Callgraph
(made with Graphviz)
11

Fourteenforty Research Institute, Inc.

What kind of information does "egg" collect?

2. Callgraph 3. Branch information

Branch Info
(with IDA Pro)

Callgraph
(made with Graphviz)
12

Fourteenforty Research Institute, Inc.

What kind of information does "egg" collect?

2. Callgraph 3. Branch information

Branch Info
(with IDA Pro)

Callgraph
(made with Graphviz)
13

Fourteenforty Research Institute, Inc.

What kind of information does "egg" collect?

2. Callgraph 3. Branch information

Branch Info
(with IDA Pro)

Callgraph
(made with Graphviz)
14

Fourteenforty Research Institute, Inc.
Demonstration of basic functions(movie)
· Analyzing sample.exe. · Sample.exe overwrites original beep driver (beep.sys). · Then restarts beep service to install this driver in the kernel. · "egg" analyzes sample.exe and the modified beep driver.
15

Fourteenforty Research Institute, Inc.
Implementation of the fine-grained code analysis
· Based on the page protection and the trap flag. · Published by the paper "Stealth Breakpoints". · We can run analysis codes for each instruction execution. · It can applies to both a kernel and user modes, and even
works transparently in the user mode code.
Stealth Breakpoints http://www.acsac.org/2005/abstracts/72.html
16

Fourteenforty Research Institute, Inc.

What is taint tracing?

· It can automatically trace suspicious elements. · A suspicious element is marked as tainted. · A taint automatically influences new elements that used
tainted elements.

Some suspicious sources

Tainted

NEW Tainted

NOT Tainted

17

Fourteenforty Research Institute, Inc.

An overview of taint tracing approach of "egg"
· egg takes a novel approach to implement the taint tracing. · In case of egg, "Elements" are Files, Virtual memory and
Threads.

1. Specify

2. Map in Mem

Taint

File

Taint Memory

4. Write to File
Taint File

Taint Memory

Thread

Taint Thread

3. Execute

4. Write to Mem

18

Fourteenforty Research Institute, Inc.

An overview of taint tracing approach of "egg"
· egg takes a novel approach to implement the taint tracing. · In case of egg, "Elements" are Files, Virtual memory and
Threads.

1. Specify

2. Map in Mem

Taint

File

Taint Memory

4. Write to File
Taint File

Taint Memory

Thread

Taint Thread

3. Execute

4. Write to Mem

19

Fourteenforty Research Institute, Inc.
Implementation of taint tracing in ring-0

Using API PsSetLoadImageNotifyRoutine

1. Specify

2. Map in Mem

Taint

File

Taint Memory

4. Write to File
Taint File

Taint Memory

Thread

Taint Thread

3. Execute

4. Write to Mem

20

Fourteenforty Research Institute, Inc.
Implementation of taint tracing in ring-0

Using the page protection (eXecute Disable bit)

1. Specify

2. Map in Mem

Taint

File

Taint Memory

4. Write to File
Taint File

Taint Memory

Thread

Taint Thread

3. Execute

4. Write to Mem

21

Fourteenforty Research Institute, Inc.
Implementation of taint tracing in ring-0

Using the File system filter driver

1. Specify

2. Map in Mem

Taint

File

Taint Memory

4. Write to File
Taint File

Taint Memory

Thread

Taint Thread

3. Execute

4. Write to Mem

22

Fourteenforty Research Institute, Inc.
Implementation of taint tracing in ring-0

Using the page protection (Write/Read bit)

1. Specify

2. Map in Mem

Taint

File

Taint Memory

4. Write to File
Taint File

Taint Memory

Thread

Taint Thread

3. Execute

4. Write to Mem

23

Fourteenforty Research Institute, Inc.

Implementation of taint tracing in ring-0

· For thread safety, egg hooks thread switching function (called SwapContext).
· Therefore egg can notice a thread switching.

Process Memory

Running on processor
Thread (not tainted)

Waiting
Thread (tainted)

Waiting
Thread (not tainted)

Process memory has not been modified yet.

24

Fourteenforty Research Institute, Inc.
Implementation of taint tracing in ring-0
· When taint thread becomes active, egg changes every process memory to read-only.

Process Memory

Running on processor
Thread (tainted)

Waiting
Thread (not tainted)

Waiting
Thread (not tainted)

Currently, process memory is read-only.
If a thread tries to write somewhere, the processor causes an exception. egg catches this exception as taint event.
25

Fourteenforty Research Institute, Inc.
Implementation of taint tracing in ring-0
· When taint thread becomes inactive, egg restores every page protection.

Process Memory

Running on processor
Thread (not tainted)

Waiting
Thread (not tainted)

Waiting
Thread (not tainted)

Process memory protection is restored.

26

Fourteenforty Research Institute, Inc.

Tracking the cross-process memory operation

· To trace cross-process memory operation, egg hooks context switching function (called KiSwapProcess).
· Therefore egg can notice cross-process memory operation.

malware.exe
Process Memory

Running on processor Thread (tainted)
CR3

explorer.exe
Process Memory

Read-only

Have not been changed
27

Fourteenforty Research Institute, Inc.
Tracking the cross-process memory operation
· When taint thread is running on other process memory, its process memory will be changed to read-only.

malware.exe
Process Memory

Running on processor Thread (tainted)
CR3

explorer.exe
Process Memory

egg can trace cross-process memory operation. (e.g. WriteProcessMemory)

Restored

Read-only
28

Fourteenforty Research Institute, Inc.
Demonstration of the taint tracing function(movie)
· The sample is the thread injection code.
· Sample malware called "injector.exe" injects to notepad.exe with VirtualAllocEx, WriteProcessMemory and CreateRemoteThread.
· Injected thread calls AllocConsole and WriteConsole in infinite loop.
· egg will trace the injected thread.
29

Fourteenforty Research Institute, Inc.
Problem of same privilege
· egg has limitation against kernel mode code.
­ egg is visible and breakable from kernel mode malware.
· This limitation is result of trade off for avoiding detection by the VM detection.
30

Fourteenforty Research Institute, Inc.

Conclusion

Type of system Getting useful information Analyzing a kernel mode code Analyzing a spreading malware. Not affected by VM detection techniques

egg Good Better Good Good

Traditional Insufficient Insufficient Insufficient Good

· We can save time by using egg.

Innovative Good Good Good Insufficient

· In the future, I will try to improve its stability and usability.

31

Thankyou! 
Fourteenforty Research Institute, Inc.  
http://www.fourteenforty.jp
  
32

