Android 0day 
Moony Li of TrendMicro

Agenda

· 
­ 
· 
ü  ü 
ü APK Download ü  ü 
ü Misc
· Summary

3

Copyright 2019 Trend Micro Inc.

: @flyic_t https://github.com/silvermoonsecurity
-

Moony Li
 9+ WindowsMac AndroidiOS 

 BlackHat Europe 2016, Black Hat Asia 2018, Black Hat USA 2018 Arsenal, Black Hat Europe 2018, Blackhat USA 2019

4

Copyright 2019 Trend Micro Inc.

Android Mitigation 1/2

5

Copyright 2019 Trend Micro Inc.

Android Mitigation 2/2

Android 5(<=) PXN,Selinux

Android 6 Device-mapper-verity

Android 7 Integer Overflow Sanitization

Android 8

Post-init read-only memory,Hardened Usercopy,PAN,KASLR

Android 9 llvm-cfi,Integer Overflow Sanitization

Android Q(>=) lld linker,protect more of CFI

6

Copyright 2019 Trend Micro Inc.

Mitigation vs Vulnerability

7

Copyright 2019 Trend Micro Inc.

Migitation vs Exploit

exploits

pxn

pan

vendor

ooB

uaf

Race condition Interger overflow

Double free

Improper input

cfi /dev Sys call

Infomation Disclosure

selinux

text

alsr

8

Copyright 2019 Trend Micro Inc.

Get root
uClose selinux uaddr_limit uMod cred
Ø Uid,gid,Suid Ø Capabilities Ø Security Ø u:r:init:s0

Agenda
·  · 
ü  ü 
ü APK Download ü  ü 
ü Misc
· Summary

9

Copyright 2019 Trend Micro Inc.

  VS 

10

Copyright 2019 Trend Micro Inc.



...

 



×



UI

...

Download & execution

×

Misc

Emulation   ×
×

11

Copyright 2019 Trend Micro Inc.

 × 
×

Solution Overview 

12

Copyright 2019 Trend Micro Inc.

Solution Overview 

13

Copyright 2019 Trend Micro Inc.

Agenda
·  · 
ü  ü 
ü APK Download ü  ü 
ü Misc
· Summary

14

Copyright 2019 Trend Micro Inc.

APK sourcing of Google Play
Check In
mac address, IMEI code, network type, sim ca carrier information, hardware informationgsfID
Webview login
GPoAuth token master

Google Mobile Suite (Aka. GMS)
GooglePlayService.apk

15

Copyright 2019 Trend Micro Inc.

Download
market tokenAPK

Tips

· 
üIP ü
· 

Numbe r 1 imei 2 androidId 3 digest 4 checkin ... ...... 26 wIsInChina

Description

ü Pixel, Nexus, Samsung, Moto ..27 LplWearableDeviceRelated 29 yFetchSystemUpdates

üXposed,Frida+

üROM

16

Copyright 2019 Trend Micro Inc.

Agenda
·  · 
ü  ü 
ü APK Download ü  ü 
ü Misc
· Summary

17

Copyright 2019 Trend Micro Inc.

Pattern 
Ø N-Day 
Ø 0Day Exploit Ø 
ü Hack tool ü Bash

18

Copyright 2019 Trend Micro Inc.



Ø Rough  (1.7w)
ü  Ø Pattern  (17)
Ø Yara Rule
Ø  (More for researcher) ü CFGxref to xref from ü  ü ...

19

Copyright 2019 Trend Micro Inc.

DirtyCow in the wild

20

Copyright 2019 Trend Micro Inc.

In the Wild Exploit Hunt
·

· 300,000 malicious apps that carry the ZNIU malware in the wild by September 27, 2017
· Appears as a porn app

21

Copyright 2019 Trend Micro Inc.

DirtyCowPOC
Ø dirtycow
ü mmap ü * Madvise, 4 ü pthread_create ü pthread_join ü Open

22

Copyright 2019 Trend Micro Inc.

Exploit of DirtyCOW
· Race condition in copy-onwrite

· Main pattern:
­ "madvise" system must be contained in user mode
· Affiliation pattern:
­ map memory (e.g. mmap), multiple thread/process (e.g. fork, pthread_create) are optional.

23

Copyright 2019 Trend Micro Inc.

Yara Rule

24

Copyright 2019 Trend Micro Inc.

Agenda
·  · 
ü  ü 
ü APK Download ü  ü 
ü Misc
· Summary

25

Copyright 2019 Trend Micro Inc.

Module Components
· 1. Kernel Mode Detection
üFocus on kernel privilege escalation üSuch as UAF, double free, oob,...
· 2. User Mode Detection
üFocus on sandbox escape üSuch as RCE, mediaserverd vulnerabilities

26

Copyright 2019 Trend Micro Inc.

+

27

Copyright 2019 Trend Micro Inc.

Frida internal

28

Copyright 2019 Trend Micro Inc.


SaftyNet Heap Spray detection ROP detection Privilege Escalation detection

29

Copyright 2019 Trend Micro Inc.


SaftyNet Heap Spray detection ROP detection Privilege Escalation detection

30

Copyright 2019 Trend Micro Inc.

SaftyNet - CVE-2016-0846 for example

31

Copyright 2019 Trend Micro Inc.

Strategy of Kernel Mode detection
SaftyNet Heap Spray detection ROP detection Privilege Escalation detection

32

Copyright 2019 Trend Micro Inc.

Heap Spray Features
· I.Allocation
­ malloc/kmalloc/vmalloc/new/mmap...
· II.Copy/Mapp:
­ memcpy/physmap...
· III. Socket
­ sendmsg/sendmmsg/...

33

Copyright 2019 Trend Micro Inc.

HeapSpray

0x1000

0x1000

Page1

Page2

0x1000

0x1000

Page3

...

PageN

... match match
match

34

Copyright 2019 Trend Micro Inc.

Return when find x match

Heap Spray 
· Runtime Allocation
­ Hook kmallocmallocAPI  
· 
­ PageslabPattern

35

Copyright 2019 Trend Micro Inc.

DABox - CVE-2015-1538 detection(1/3)

36

Copyright 2019 Trend Micro Inc.

DABox - CVE-2015-1538 detection(2/3)
· Intercept the buffer allocated
· Check the buffer contents through the algorithm
· Check the match results whether hit the threshold

37

Copyright 2019 Trend Micro Inc.

DABox - CVE-2015-1538 detection(3/3)
· Detection results
Encap

38

Copyright 2019 Trend Micro Inc.

Strategy of Kernel Mode detection
SaftyNet Heap Spray detection ROP detection Privilege Escalation detection

39

Copyright 2019 Trend Micro Inc.

Arm Call Stack

40

Copyright 2019 Trend Micro Inc.

ROP Gadget

41

Copyright 2019 Trend Micro Inc.

ROP Gadget 

Vulnerability Point

Trigger Point

Callee/primiti ve detection

42

Copyright 2019 Trend Micro Inc.

Log CVE
ROP detection
commit_creds(prepare _kernel_cred (0));

Strategy of Kernel Mode detection
SaftyNet Heap Spray detection ROP detection Privilege Escalation detection

43

Copyright 2019 Trend Micro Inc.

Privilege Escalation 
· monitor the target process status after:
üProcess creation ("exec") üShell command execution ("/bin/bash xxx.sh") üSystem file modification (inotify) ü Logcat |grep "root successfully":) ü...

44

Copyright 2019 Trend Micro Inc.

CVE-2017-13315 Report
· Detection results
Encap

45

Copyright 2019 Trend Micro Inc.

Agenda
·  · 
ü  ü 
ü APK Download ü  ü 
ü Misc
· Summary

46

Copyright 2019 Trend Micro Inc.

Summary
· for(<++)
for(<++) ·  · ->->->Feedback

47

Copyright 2019 Trend Micro Inc.





Q&A

50

Copyright 2019 Trend Micro Inc.

: @flyic_t https://github.com/silvermoonsecurity

Moony Li
-  - 9+ - WindowsMac - AndroidiOS - 
 BlackHat Europe 2016, Black Hat Asia 2018, Black Hat USA 2018 Arsenal, Black Hat Europe 2018, Blackhat USA 2019

51

Copyright 2019 Trend Micro Inc.

