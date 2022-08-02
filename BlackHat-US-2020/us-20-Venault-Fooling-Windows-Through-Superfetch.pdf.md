Fooling Windows through Superfetch

Mathilde Venault & Baptiste David

#BHUSA @BLACKHATEVENTS

Who are we?
Mathilde VENAULT
venault@et.esiea.fr

Baptiste DAVID
bdavid@et.esiea.fr

Laval, France

#BHUSA @BLACKHATEVENTS

What is it?

Resource Monitor view
· SysMain = preloaded memory + preloaded processes + scenarios

#BHUSA @BLACKHATEVENTS

The service SysMain
 The main goal is to increase speed of user experience through: - Optimizing boot of the os. - Anlayzing software use & prelaunching programs the user might need next time.
 Misuse of language: « Superfetch » is only a part of SysMain, which is the name of the whole service. It is often called Superfetch because on older Windows versions, the service was called Superfetch.

SysMain properties
#BHUSA @BLACKHATEVENTS

SysMain's headquarters

C:\Windows\Prefetch directory
 SysMain stores its files on C:\Windows\Prefetch.

 This directory includes: - « ReadyBoot » directory related to the Readyboost driver functionalities. - Files related to the service (with .db and .pf extension): traces of Superfetch's activity. - A file named « Layout.ini » which is the key file to speed up the boot.

#BHUSA @BLACKHATEVENTS

Optimizing the boot
· The goal: find the quickest way for the OS to boot. · The list represents the best order to load the given files in
memory. · Begins with the kernel!

C:\Windows\Prefetch\Layout.ini
#BHUSA @BLACKHATEVENTS

Mechanism: memory paging
#BHUSA @BLACKHATEVENTS

Mechanism: page faults
#BHUSA @BLACKHATEVENTS

Mechanism: page faults
#BHUSA @BLACKHATEVENTS

Mechanism: page faults
#BHUSA @BLACKHATEVENTS

Mechanism: page faults
#BHUSA @BLACKHATEVENTS

Mechanism: reducing memory operations
 Superfetch aims at reducing the occurrence of page faults, which require time & operations from memory.
 To this end Superfetch: - Remembers page accesses. - Logs pages faults. - Maps to physical memory pages referenced whenever the relative program is launched.
#BHUSA @BLACKHATEVENTS

How does it work?
#BHUSA @BLACKHATEVENTS

Global architecture

#BHUSA @BLACKHATEVENTS

Agent Context (AgCx)
 Deals session information based on SID & Token User.
 Watches for context change: - hibernation (long pause). - standby (short pause). - fast user switching (change of user session).
 Takes a snapshot of the situation when this is about to change. Includes two types of disconnection: - Classic Disconnect (quitting & logging). - « Lazy Disconnect » (without quitting).

#BHUSA @BLACKHATEVENTS

Agent PfnDb (AgPd)
 Based on interactions with the Page Frame Number database (PFN).
 Logs page faults encountered by each program.
 Classifies responses (among others): - Is it a « private page »? (committed/non shared page) - Is the page from a background app?

#BHUSA @BLACKHATEVENTS

The PFN database
 Page Frame Number (PFN) is an array representing each physical page state of memory on the system (Active / Standby / Freed ...).
#BHUSA @BLACKHATEVENTS

Agent PfnDb (AgPd)
 Based on interactions with the Page Frame Number database (PFN).
 Logs page faults encountered by each program.
 Classifies responses: - Is it a « private page »? (committed page) - Is the page from a background app?

#BHUSA @BLACKHATEVENTS

Agent AppLaunch (AgAl) & Robust performance (AgRp)
 AgAl - Post processes data received from FileInfo to take future decisions. - Creates Markov chains to represent probabilities of pattern use.
 AgRp - Assures relevance of the databases: - Checks how many times/since when the data has been used. - Calculates a « pertinence threshold » depending on other scenario use.

#BHUSA @BLACKHATEVENTS

Agent Global (AgGl) & Agent AppLaunch (AgAl)
 AgGl - Organizes « histories » (individual history, fault history, global history). - Defines phases per days (morning/ weekdays, weekends..).
 AgAl - Make predictions depending on the Markov chains established before.

#BHUSA @BLACKHATEVENTS

Global architecture

#BHUSA @BLACKHATEVENTS

Types of Superfetch tasks

 Prefetch routines - « Non stop » job. - Processing traces (building & updating scenarios), predicting and pre launching, daily checks..

 Periodic saves - Each 3 days on average, but depends on the value to save. - Saving databases, updating registry keys...

 Idle tasks - Under special circumstances (cpu, disk & memory utilization + power supply). - Updating optimal layout ; launching « defrag.exe ­ s ­b »

#BHUSA @BLACKHATEVENTS

Surprising facts
 Influence of power supply: - During an « idle state », if there is no power supply detected Superfetch will not process what it first planned to do. - Depending on power supply, the decision of prefetching some applications will not be the same.
 More than 22 registry keys are frequently consulted, deleted and created, as a way of communication with the rest of the kernel or as internal markers. For instance, the date of the last optimal layout calculation is stored and checked by Superfetch in the registry.
 Superfetch has 5 different types of databases.. But at their initialization, we found out each is based on the others!
#BHUSA @BLACKHATEVENTS

API Internal database
#BHUSA @BLACKHATEVENTS

What about the prefetch files?
#BHUSA @BLACKHATEVENTS

File compression

 All the prefetch files, except AgAppLaunch.db, AgRobust.db, dynrespri.db & cadrespri.db are compressed.
 The files are compressed within the function RtlCompressBuffer() from NtosKrnl.lib.
 The compression format is the XPRESS_HUFFMAN format.

RtlCompressBuffer() prototype, msdn.com

#BHUSA @BLACKHATEVENTS

Database files: generalities
 Traces of agent's activity: way to build internal database.  One agent has 1 or more « .db ».  They are not always present on the prefetch directory.  Until now, their format was undocumented.

C:\Windows\Prefetch directory
#BHUSA @BLACKHATEVENTS

Database files: generalities
 AgAppLauch.db  AgCx_%SIDofUser.db  AgGlobalFaultHistory.db  AgForegroundAppHistory.db  AgGlobalHistory.db  AgGlUserActiveDays_%sid (assumption)  Dynamicreservedpriority.db

C:\Windows\Prefetch directory
#BHUSA @BLACKHATEVENTS

Database reading process
#BHUSA @BLACKHATEVENTS

Database files: compressed format

AgCx.db : original file (compressed)

#BHUSA @BLACKHATEVENTS

Database files: decompressed format

AgCx.db (decompressed)

#BHUSA @BLACKHATEVENTS

Database Parameters Type
 Parameters are defined for a specific FileType.
 16 different types of FileType.
 2 main uses: - offset calculation on the file. - database size parameters.

DatabaseParams in SysMain.sys
#BHUSA @BLACKHATEVENTS

Database Parameters
 Parameters are defined for a specific FileType.
 16 different types of FileType.
 2 main uses: - offset calculation on the file. - database size parameters.

DatabaseParams in SysMain.sys
#BHUSA @BLACKHATEVENTS

Database files: decompressed format

AgCx.db (decompressed)

#BHUSA @BLACKHATEVENTS

Scenario files: generalities
C:\Windows\Prefetch directory
 Each scenario file name is : « NameoftheApp ­ 8DIGITS.pf ».  File ending with .pf : trace of an application. One application could have one or more scenario files, depending
on the context of its execution.  Information defined on the registry : SOFTWARE\Microsoft\WindowsNT\CurrentVersion\Prefetcher
- MaxPrefetchFiles : by default 256. - MaxPrefetchFileSize : by default 10485760 bytes.
#BHUSA @BLACKHATEVENTS

Scenario files: construction
#BHUSA @BLACKHATEVENTS

Scenario files: names
 The name results from the full application path hashed with the following algorithm :
 Note that this algorithm depends on your Windows version. The following elements might change : - Initialization value of StringHashed. - Adding a modulo operation. - Adding a multiplier coefficient.

#BHUSA @BLACKHATEVENTS

Scenario files: construction
#BHUSA @BLACKHATEVENTS

The driver FileInfo
 The way to access information from ring 0 via a minifilter driver.
 Its main job is to provide name and information (read/write operations) about files.
 Follows each operation of every file for all processes, thanks to minifilter driver stream context.
 Splits a buffer formated in a format « NL », which is going to be translated to the final path.

Buffer sent by FileInfo to SysMain
#BHUSA @BLACKHATEVENTS

Scenario files: compressed format
Magic Number Decompressed Size
Scenario file : VLC.EXE-73B04BFB.pf (compressed)

#BHUSA @BLACKHATEVENTS

Scenario files: decompressed format

OS version

Prefetch signature

Exe Name

File Size

Number of paths registered
Last execution dates

Scenario file : VLC.EXE-73B04BFB.pf (decompressed)

Hash Offset where paths list begins
Count of execution

#BHUSA @BLACKHATEVENTS

Scenario files: content
 Contains the full paths of file needed to avoid page faults.
 In other words three kinds of file : - Every time consulted files, such as dll, dependencies. - Recent files such as personal files. - Cache files, because they are non-stop consulted.

Scenario file : VLC.EXE-5A3EF7FA.pf (decompressed)
#BHUSA @BLACKHATEVENTS

Scenario files: content
 Contains the full paths of file needed to avoid page faults.
 In other words three kinds of file : - Every time consulted files, such as dll, dependencies. - Recent files such as personal files. - Cache files, because they are non-stop consulted.

Scenario file : VLC.EXE-5A3EF7FA.pf (decompressed)

#BHUSA @BLACKHATEVENTS

The cache files
Windows Cache directory
 Superfetch references cache files.  Cache is a memory management which temporarily stores data to reduce access time to these data
later, in the cache files.
#BHUSA @BLACKHATEVENTS

What about the content of the file?

Extract of a cache file
 Superfetch references cache files ...  ... and cache files can contain data in cleartext files.

#BHUSA @BLACKHATEVENTS

What can be done?
 Track user activities.  Find personal file location.  View personal content.  Prove software installs.  But you can also protect yourself from this...

#BHUSA @BLACKHATEVENTS

Time to fool your OS!
#BHUSA @BLACKHATEVENTS

Exploit the scenarios

WinPrefetchView
 In 2010, Nirsoft built a tool to view the content of the scenario files.  Still... - The tool is close source.
- Information provided is only about .pf files. - Data cannot be edited...

#BHUSA @BLACKHATEVENTS

Our tool
 Open source!
 Possibility for .db and .pf to: - Compress; - Decompress; - View information; - Edit information...
 Possibility to hash with Windows 10 Superfetch algorithm.

#BHUSA @BLACKHATEVENTS

The roadmap to fool SysMain
 Choose a program's scenario.  Decompress it.  Edit the data.  Save & Compress it.  Replace the original scenario with the falsified one and let the magic happen!

#BHUSA @BLACKHATEVENTS

What if you want to avoid that?
#BHUSA @BLACKHATEVENTS

What Windows Internals says...
Windows Internals 7, Part 1.Chapter 5, p 414.
 Still, nowadays, whatever the value of EnablePrefetcher the scenario files keep on being updated.
#BHUSA @BLACKHATEVENTS

Another example: «PfSvSuperfetchCheckAndEnable»

PfSvSuperfetchCheckAndEnable() function from SysMain.dll

#BHUSA @BLACKHATEVENTS

The solution
 One way to disable SysMain is to manually set the startup type of the SysMain service in the Task Manager to "disabled".
SysMain properties
#BHUSA @BLACKHATEVENTS

Finally
 Extended documentation on SysMain mechanisms & databases.
 Multifunction tool, available on github at: MathildeVenault.
 Future research: - More interaction with drivers; - See further on Windows Cache; - Improving the tool.

#BHUSA @BLACKHATEVENTS

Any questions?
#BHUSA @BLACKHATEVENTS

