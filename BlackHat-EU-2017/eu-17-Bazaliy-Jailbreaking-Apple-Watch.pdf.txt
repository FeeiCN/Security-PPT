1

2

Jailbreaking

3 4

5

Apple Watch

6 7

8

9

10
Max Bazaliy 11

December 4-7, 2017

12

whoami

1

2

3

o Security researcher at Lookout

4

5

o iOS/tvOS/WatchOS jailbreak author

6

o Lead researcher on Pegasus exploit chain 7

8

o Focused on software and hardware

9

exploitation

10

11

December 4-7, 2017

12

What is Apple Watch ?

1

2

o Released in 2015

3

4

o Apple S1/S2/S3 processor

5

o ARMv7k 32 bit architecture

6

7

o 512/768 MB RAM

8

o One/Dual-core processor

9

10

o WatchOS

11

December 4-7, 2017

12

How does it work ?

1

2

3

4

o Fetch data from a phone

5

o Data transfer over Bluetooth

6 7

o Sync over Bluetooth and WiFi

8 9

10

11

December 4-7, 2017

12

Why to jailbreak a watch ?

1

2

3

4
o Access to file system (messages, emails..) 5

o Run debug tools on a watch (radare, frida)

6 7

o iPhone attack vector J

8

9

10

11

December 4-7, 2017

12

Apple Watch security

1

2

o Secure boot chain

3

4

o Mandatory Code Signing

5

o Sandbox

6

7

o Exploit Mitigations

8

o Data Protection

9

10

o Secure Enclave Processor

11

December 4-7, 2017

12

Possible attack vectors

1

2

3

4

o Memory corruption over Webkit

5

6

7

8

9

10

11

December 4-7, 2017

12

Possible attack vectors

1

2

3

4

o Memory corruption over Webkit

5

o Boot chain attack over usb (diags port J)

6 7

8

9

10

11

December 4-7, 2017

12

Possible attack vectors

1

2

3

4

o Memory corruption over Webkit

5

o Boot chain attack over usb (diags port J)

6 7

o Application extension based

8

9

10

11

December 4-7, 2017

12

Jailbreak step by step

1

2

o Get initial code execution

3

4

o Leak kernel base

5

o Dump whole kernel (for encrypted kernels)

6

7

o Find gadgets and setup primitives

8

o Disable security restrictions

9

10

o Run ssh client on a watch

11

December 4-7, 2017

12

Bugs of interest

1

2

o WatchOS 2.x

3

4

- CVE-2016-4656 & CVE-2016-4680

5

o WatchOS 3.1.2

6

7

- CVE-2017-2370

8

o WatchOS 4.0.1

9 10

- CVE-2017-13861 ? J

11

December 4-7, 2017

12

Leaking kernel base ­ WatchOS 2.x 1 2

o CVE-2016-4680

3

4

o Object constructor missing bounds checking 5

o OSNumber object with high number of bits

6

7

o Object length used to copy value from stack 8

o Kernel stack memory leaked

9

10

o Can be triggered from an app's sandbox

11

December 4-7, 2017

12

CVE-2016-4656 exploitation

13 14

15

o Kernel mode UAF in OSUnserializeBinary

16

17

o OSString object deallocated

18

o retain() called on deallocated object

19

20

o Fake object with fake vtable ­> code exec

21

o Can be triggered from an app's sandbox

22

23

December 4-7, 2017

24

Dumping WatchOS 2.x kernel

13

14

15

o Problem: No WatchOS 2.x kernel dumps 16

o No decryption keys for WatchOS kernels

17 18

o Idea: read kernel as OSString chunks

19

20

o vtable offset required to fake OSString 21

o vtable stored in __DATA.__const in kernel

22 23

December 4-7, 2017

24

13

14

15

16

17

18

19

20

21

22

23

December 4-7, 2017

24

Getting OSString vtable

13

14

o OSString vtable reference in OSUnserializeBinary! 15 16
o OSUnserializeBinary reference in OSUnserializeXML 17

18

19

20

21

22

23

December 4-7, 2017

24

Dumping kernel by panic logs

13

14

o We can control pointer to vtable

15 16

o Use address to leak as vtable address

17

o vtable will be dereferenced by retain() call

18 19

o Kernel will crash, but save panic log

20

o Address content appear in register state

21 22

23

December 4-7, 2017

24

It's fun !

13

14

15

16

17

18

19

20

21

22

23

December 4-7, 2017

24

Dumping kernel by 4 bytes

13

14

o Use address to leak as fake vtable address

15

o Watch will crash, wait until it restore

16

17

o ssh to a iPhone and run synchronization service

18

o Copy panic from Watch to iPhone and to Mac

19

o Parse panic, read 4 bytes and disassemble !

20

21

o Update address with 4 bytes delta and upload app 22

o Repeat

23

December 4-7, 2017

24

13

14

15

16

17

18

19

20

21

22

23

December 4-7, 2017

24

Next step ­ full kernel dump

13

14

15

o Now use fake OSString obj to read kernel 16

o Read data via IORegistryEntryGetProperty

17 18

19

20

o Leak kernel header, calculate kernel size 21

o Dump full kernel to userland by chunks

22 23

December 4-7, 2017

24

Next step ­ kernel symbolication 13 14

15

o Find and list all kexts

16 17

o Find sysent and resolve syscalls

18

19

o Find and resolve mach traps

20

o Resolve IOKit objects vtable

21 22

23

December 4-7, 2017

24

Next step ­ setting up primitives 13 14

15

16

o Scan kernel dump for gadgets

17

18

o Set up exec primitive

19

o Set up kernel read & write primitives

20 21

22

23

December 4-7, 2017

24

Jailbreaking Watch OS 3.x

13

14

15

o Kernels are not encrypted now

16

o No need to dump and symbolicate anymore

17 18

o New heap layout, some AMFI fixes

19

20

o More sandbox restrictions

21

o Vurnerable to CVE-2017-2370

22 23

December 4-7, 2017

24

CVE-2017-2370

25 26

o Kernel heap overflow

27

28

o mach_voucher_extract_attr_recipe

29

o Usermode pointer is used as copyin size arg 30 31
o We can corrupt mach message to get kernel RW 32

o Allocate userclient and read obj vtable -> KASLR 33

34

o Can be triggered from an app's sandbox

35

December 4-7, 2017

36

Next step ­ patchfinder

25

26

27

28

o String \ byte pattern + xref + analysis

29

o Simple arm emulator is helpful

30 31

o Resolve syscalls table, mach traps table 32 33

34

35

December 4-7, 2017

36

Getting root and sandbox bypass 25 26

27

o Patch setreuid (no KPP)

28 29

30

31

o patch ucred in proc structure in kernel

32

o patch sandbox label value in ucred

33 34

35

December 4-7, 2017

36

Getting kernel task

25

26

27

o Patch task_for_pid()

28

29

o Or save kernel sself in task bootstrap port 30

31
o Read it back via task_get_special_port() 32

o Restore original bootstrap port value

33

34

35

December 4-7, 2017

36

Disable codesign checks

25

26

27

o Patch _debug to 1

28

o patch _nl_symbol_ptr (got) entries

29

30

o Patch amfi variables

31 32

- cs_enforcement_disable

33

34

- allow_invalid_signatures

35

December 4-7, 2017

36

Remount rootfs

25

26

o Patch __mac_mount

27

28

o Change mount flags in rootfs vnode

29

30

31

o Patch lwvm is_write_protected check

32

33

o Patch PE_i_can_has_debugger in lwvm 34

35

December 4-7, 2017

36

Spawning ssh client

25

26

27

o Compile dropbear ssh client for ARMv7k 28 29
o Compile basic tools package for ARMv7k 30

o More restricted sandbox than iOS

31 32

o Null out WatchOS specific sandbox ops 33 34

35

December 4-7, 2017

36

ssh connection problem...

25

26

27

o WatchOS interfaces

28

29

"awdl0/ipv6" = "fe80::c837:8ff:fe60:90c2"; 30

31

"lo0/ipv4" = "127.0.0.1";

32

"lo0/ipv6" = "fe80::1";

33

"utun0/ipv6" = "fe80::face:5e30:271e:3cd3"; 34 35

December 4-7, 2017

36

25

26

27

28

29

30

31

32

33

34

35

December 4-7, 2017

36

Watch <-> iPhone port forwarding 25 26

NSDictionary *comm = @{!

27

@"Command" :@"StartForwardingServicePort",

@"ForwardedServiceName" :@"com.apple.syslog_relay",!

28

@"GizmoRemotePortNumber" :[NSNumber numberWithUnsignedShort: pt],!

@"IsServiceLowPriority" :@0,};!

29

!

AMDServiceConnectionSendMessage(serviceConnection,!

30

(__bridge CFPropertyListRef)(comm),

31

kCFPropertyListXMLFormat_v1_0);!

!

32

AMDServiceConnectionReceiveMessage(serviceConnection, &response,

(CFPropertyListFormat*)&format);!

33

!

NSNumber *iphone_port = response[@"CompanionProxyServicePort"];!

34

35

December 4-7, 2017

36

Black Hat Sound Bytes

25

26

27

28

29

30

31

32

33

34

35

December 4-7, 2017

36

SSH over WiFi

25

26

27

o Watch can be connected to 2.4Hz WiFi

28

29

o Can be a little bit tricky but it works

30

o iPhone is not involved at all J

31 32

o Just leak address and connect

33

34

35

December 4-7, 2017

36

Black Hat Sound Bytes

37

38

39

40

41

42

43

44

45

46

47

December 4-7, 2017

48

Apple Watch usage

37

38

39

o Watch has access to SMS, Calls, Health

40

o Photos and emails synced to Watch

41 42

o Access to GPS location

43

44

o Microphone usage

45

o Apple Pay

46 47

December 4-7, 2017

48

Post jailbreak

37

38

o Full access to jailbroken watch file system

39

40

- Messages

41

- Call history

42

43

- Contacts

44

- Emails

45

46

- GPS loacation

47

December 4-7, 2017

48

What's next ?

37

38

39

o Interpose or trampoline system functions 40

o Catch data on sync with a iPhone

41 42

o Call recordings

43

44

o Create tweaks for a watch

45

o Run frida and radare

46 47

December 4-7, 2017

48

Black Hat sound bytes

37

38

39

40
o WatchOS security is mostly equal to iOS 41

o Easier data forensics on a Watch

42

43

o Exploits became more valuable

44

45

46

47

December 4-7, 2017

48

37

38

39

40

@mbazaliy

41 42

43

44

45

46

47

December 4-7, 2017

48

