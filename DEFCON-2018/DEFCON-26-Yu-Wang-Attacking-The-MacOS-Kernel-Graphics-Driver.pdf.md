Attacking the macOS Kernel Graphics Driver
wang yu Didi Research America

- About me - Background

9 Years, 3 Billion Miles: The Journey of New Horizons
Pluto Flyby: The Story of a Lifetime, NASA, 2016 New Horizons Team Reacts to Latest Image of Pluto, NASA, 2015

- Weapon X rootkit - Rubilyn rootkit - OS X/Crisis DAVINCI rootkit (Hacking Team)
https://github.com/hackedteam/driver-macos - Inficere rootkit
https://github.com/enzolovesbacon/inficere - Uninformed volume 4 - Abusing Mach on Mac OS X - Phrack magazine #64 - Mac OS X wars - a XNU Hope - Phrack magazine #66 - Developing Mac OS X Kernel Rootkits - Phrack magazine #69 - Revisiting Mac OS X Kernel Rootkits

- Process/Dynamic library - File/Configuration - Kernel kext module - Network traffic - User mode/Kernel mode communication mechanism

- Doubly-linked list manipulation - DKOM(Direct Kernel Object Manipulation)/Hot Patch - Dispatch table hook/Inline hook - Mach-O format parser/Kernel symbol - Kernel exploitation

Windows/Android Linux/macOS Malware
Man in the Binder - He who Controls IPC, Controls the Droid, Black Hat Europe 2014

1. Anti-debugging ( object hook sys_ptrace ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/anti.c#L312
2. Hide process ( object hook sys_sysctl ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/anti.c#L335
3. Hide file ( object hook sys_getdirentries/sys_getdirentries64/sys_getdirentriesattr ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/anti.c#L471 https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/anti.c#L542 https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/anti.c#L547
4. Hide user ( object hook sys_open_nocancel/sys_read_nocancel ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/anti.c#L615 https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/anti.c#L635
5. Self-protection ( object hook sys_kill ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/anti.c#L448
6. Patch machine_thread_set_state https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/kpatch.c#L50
7. Patch kauth_authorize_process https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/kpatch.c#L142
8. Patch task_for_pid https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/kpatch.c#L95
9. EOP ( sys_seteuid ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/backdoor.c#L80
10. File system monitoring ( Kernel Authorization ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/file_monitor.c#L350
11. Network traffic monitoring ( ipf_addv4, not implemented yet ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/backdoor.c#L176

1. Use-After-Free vulnerability https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/inficere.c#L87 https://github.com/apple/darwin-xnu/blob/master/bsd/kern/uipc_socket.c#L1757
2. Hardcode ( syscall table ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/syscall.h
3. Hardcode ( object offset ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/kinfo.c#L115 https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/kinfo.c#L123 https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/kinfo.c#L131 https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/kinfo.c#L139
4. Lack of examination ( MALLOC ) https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/kctl.c#L170
5. Memory leak https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/kctl.c#L176
6. Kernel panic issue https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/cpu_protections.c#L66
7. Should use the "Inter-locked-xchg" https://github.com/enzolovesbacon/inficere/blob/master/kext/inficere/anti.c#L149

PLATINUM Continues to Evolve, Find Ways to Maintain Invisibility
https://blogs.technet.microsoft.com/mmpc/2017/06/07/platinum-continues-to-evolve-find-ways-to-maintain-invisibility/

"... Until this incident, no malware had been discovered misusing the AMT SOL feature for communication."

macOS Anti-Rootkit Technology

Kernel Module List Enumeration
[Agent.kext] : name=com.didi.agent, version=1.0.3, module base=0xffffff7f8e83f000, module size=0x21000. [Agent.kext] : name=com.vmware.kext.vmhgfs, version=0505.56.93, module base=0xffffff7f8e835000, module size=0xa000. [Agent.kext] : name=com.apple.driver.AudioAUUC, version=1.70, module base=0xffffff7f8e078000, module size=0x5000. [Agent.kext] : name=com.apple.driver.AppleTyMCEDriver, version=1.0.2d2, module base=0xffffff7f8e130000, module size=0x9000. [Agent.kext] : name=com.apple.filesystems.autofs, version=3.0, module base=0xffffff7f8dfb8000, module size=0x9000. [Agent.kext] : name=com.apple.kext.triggers, version=1.0, module base=0xffffff7f8dfb3000, module size=0x5000. [Agent.kext] : name=com.apple.driver.AppleOSXWatchdog, version=1, module base=0xffffff7f8e342000, module size=0x4000. [Agent.kext] : name=com.apple.driver.AppleHDAHardwareConfigDriver, version=274.12, module base=0xffffff7f8e4e5000, module size=0x2000. [Agent.kext] : name=com.apple.driver.AppleHDA, version=274.12, module base=0xffffff7f8e655000, module size=0xb3000. [Agent.kext] : name=com.apple.driver.DspFuncLib, version=274.12, module base=0xffffff7f8e51a000, module size=0x131000. [Agent.kext] : name=com.apple.kext.OSvKernDSPLib, version=525, module base=0xffffff7f8e507000, module size=0x13000. [Agent.kext] : name=com.apple.driver.AppleHDAController, version=274.12, module base=0xffffff7f8e4e9000, module size=0x1e000. [Agent.kext] : name=com.apple.iokit.IOHDAFamily, version=274.12, module base=0xffffff7f8e4d6000, module size=0xc000. [Agent.kext] : name=com.apple.iokit.IOAudioFamily, version=204.4, module base=0xffffff7f8e03f000, module size=0x31000. [Agent.kext] : name=com.apple.vecLib.kext, version=1.2.0, module base=0xffffff7f8dfc3000, module size=0x7c000. [Agent.kext] : name=com.apple.driver.AppleFIVRDriver, version=4.1.0, module base=0xffffff7f8e766000, module size=0x3000. [Agent.kext] : name=com.apple.iokit.IOBluetoothHostControllerUSBTransport, version=4.4.6f1, module base=0xffffff7f8dd9f000, module size=0x2c000. [Agent.kext] : name=com.apple.driver.ACPI_SMC_PlatformPlugin, version=1.0.0, module base=0xffffff7f8dbb3000, module size=0x11000. [Agent.kext] : name=com.apple.driver.IOPlatformPluginLegacy, version=1.0.0, module base=0xffffff7f8db84000, module size=0x12000. [Agent.kext] : name=com.apple.driver.IOPlatformPluginFamily, version=6.0.0d7, module base=0xffffff7f8db7a000, module size=0xa000. [Agent.kext] : name=com.apple.driver.AppleUpstreamUserClient, version=3.6.1, module base=0xffffff7f8e127000, module size=0x5000. [Agent.kext] : name=com.apple.driver.AppleMCCSControl, version=1.2.13, module base=0xffffff7f8e360000, module size=0xe000. [Agent.kext] : name=com.apple.driver.AppleSMBusController, version=1.0.14d1, module base=0xffffff7f8e34f000, module size=0xe000. [Agent.kext] : name=com.apple.iokit.IOSMBusFamily, version=1.1, module base=0xffffff7f8daff000, module size=0x4000. [Agent.kext] : name=com.apple.driver.pmtelemetry, version=1, module base=0xffffff7f8d4f6000, module size=0xb000. [Agent.kext] : name=com.apple.iokit.IOUserEthernet, version=1.0.1, module base=0xffffff7f8d626000, module size=0x6000. [Agent.kext] : name=com.apple.iokit.IOSurface, version=108.2.3, module base=0xffffff7f8daea000, module size=0x13000. [Agent.kext] : name=com.apple.iokit.IOBluetoothSerialManager, version=4.4.6f1, module base=0xffffff7f8dcb9000, module size=0xa000. [Agent.kext] : name=com.apple.iokit.IOSerialFamily, version=11, module base=0xffffff7f8db0e000, module size=0xe000. [Agent.kext] : name=com.apple.iokit.IOBluetoothFamily, version=4.4.6f1, module base=0xffffff7f8dcc9000, module size=0xc3000. [Agent.kext] : name=com.apple.Dont_Steal_Mac_OS_X, version=7.0.0, module base=0xffffff7f8de75000, module size=0x5000. [Agent.kext] : name=com.apple.driver.AppleSMC, version=3.1.9, module base=0xffffff7f8db98000, module size=0x19000.

Network Traffic Monitoring

[Agent.kext] : duration=128. 2709 seconds, 192.168.87.128:49222(mac 00:50:56:e2:df:7e)<->203.208.41.56:443(mac 00:0c:29:2e:2a:94), process(pid

0)=kernel_task, in=4 packets,4413 bytes, out=2 packets,467 bytes.

[Agent.kext] : Dump first IN packet.

-*> MEMORY DUMP <*-

+---------------------+--------------------------------------------------+-------------------+

|

ADDRESS

| 0 1 2 3 4 5 6 7 8 9 A B C D E F | 0123456789ABCDEF |

| --------------------+--------------------------------------------------+------------------ |

| 0xffffff8014e2ca70 | 00 0c 29 2e 2a 94 00 50 56 e2 df 7e 08 00 45 00 | ..).*..PV..~..E. |

| 0xffffff8014e2ca80 | bc 05 12 ce 00 00 80 06 15 29 cb d0 29 38 c0 a8 | .........)..)8.. |

| 0xffffff8014e2ca90 | 57 80 01 bb c0 46 a2 f1 0c f5 49 83 fb 81 50 18 | W....F....I...P. |

| 0xffffff8014e2caa0 | f0 fa 00 00 00 00 16 03 03 01 44 02 00 01 40 03 | ..........D...@. |

| 0xffffff8014e2cab0 | 03 59 3f 7f 92 13 a8 d5 35 61 e9 ff 03 bf 11 f1 | .Y?.....5a...... |

| 0xffffff8014e2cac0 | 91 f9 81 ad 16 10 43 7b ba 25 bb e6 da dc d4 8b | ......C{.%...... |

| 0xffffff8014e2cad0 | e5 00 c0 2b 00 01 18 ff 01 00 01 00 00 17 00 00 | ...+............ |

| 0xffffff8014e2cae0 | 00 23 00 00 00 12 00 f4 00 f2 00 77 00 ee 4b bd | .#.........w..K. |

| 0xffffff8014e2caf0 | b7 75 ce 60 ba e1 42 69 1f ab e1 9e 66 a3 0f 7e | .u.`..Bi....f..~ |

| 0xffffff8014e2cb00 | 5f b0 72 d8 83 00 c4 7b 89 7a a8 fd cb 00 00 01 | _.r....{.z...... |

| 0xffffff8014e2cb10 | 5c 5f b9 cf d5 00 00 04 03 00 48 30 46 02 21 00 | \_........H0F.!. |

| 0xffffff8014e2cb20 | f4 ae fc 46 6d fe a0 9f 45 0f 84 54 ce c5 8e 2e | ...Fm...E..T.... |

| 0xffffff8014e2cb30 | a3 68 96 ec bc 4a 7b b3 ad 4b 09 91 e3 80 74 d5 | .h...J{..K....t. |

| 0xffffff8014e2cb40 | 02 21 00 f9 9c e2 68 6b c5 49 94 b6 f9 36 54 b6 | .!....hk.I...6T. |

| 0xffffff8014e2cb50 | 90 fb 3a eb 59 4e 15 7c b7 bb 3c 15 fb 9f eb cf | ..:.YN.|..<..... |

| 0xffffff8014e2cb60 | f3 14 08 00 77 00 dd eb 1d 2b 7a 0d 4f a6 20 8b | ....w....+z.O. . |

| 0xffffff8014e2cb70 | 81 ad 81 68 70 7e 2e 8e 9d 01 d5 5c 88 8d 3d 11 | ...hp~.....\..=. |

| 0xffffff8014e2cb80 | c4 cd b6 ec be cc 00 00 01 5c 5f b9 ce 44 00 00 | .........\_..D.. |

| 0xffffff8014e2cb90 | 04 03 00 48 30 46 02 21 00 e3 1b 6c 4d ec 61 1c | ...H0F.!...lM.a. |

| 0xffffff8014e2cba0 | 10 68 49 26 95 01 f7 aa 63 07 60 39 81 08 73 82 | .hI&....c.`9..s. |

| 0xffffff8014e2cbb0 | 11 a0 35 13 67 45 8d 02 27 02 21 00 92 30 46 10 | ..5.gE..'.!..0F. |

| 0xffffff8014e2cbc0 | 5f d7 bf 25 84 5b ac 59 f0 80 8f e8 57 22 cd 17 | _..%.[.Y....W".. |

| 0xffffff8014e2cbd0 | 37 85 cc 49 91 68 66 f5 9d 37 e3 ac 00 10 00 05 | 7..I.hf..7...... |

| 0xffffff8014e2cbe0 | 00 03 02 68 32 75 50 00 00 00 0b 00 02 01 00 16 | ...h2uP......... |

..................

Process Creation Monitoring

..................

| 0xffffff80674533d0 | 33 35 35 33 3b 32 2c 31 30 2c 33 35 35 33 3b 32 | 3553;2,10,3553;2 |

| 0xffffff80674533e0 | 2c 31 31 2c 33 35 35 33 3b 32 2c 31 32 2c 33 34 | ,11,3553;2,12,34 |

| 0xffffff80674533f0 | 30 33 37 3b 32 2c 31 33 2c 33 35 35 33 3b 32 2c | 037;2,13,3553;2, |

| 0xffffff8067453400 | 31 34 2c 33 34 30 33 37 3b 32 2c 31 35 2c 33 34 | 14,34037;2,15,34 |

| 0xffffff8067453410 | 30 33 37 3b 33 2c 30 2c 33 35 35 33 3b 33 2c 31 | 037;3,0,3553;3,1 |

| 0xffffff8067453420 | 2c 33 35 35 33 3b 33 2c 32 2c 33 35 35 33 3b 33 | ,3553;3,2,3553;3 |

| 0xffffff8067453430 | 2c 33 2c 33 35 35 33 3b 33 2c 34 2c 33 35 35 33 | ,3,3553;3,4,3553 |

| 0xffffff8067453440 | 3b 33 2c 35 2c 33 34 30 33 37 3b 33 2c 36 2c 33 | ;3,5,34037;3,6,3 |

| 0xffffff8067453450 | 35 35 33 3b 33 2c 37 2c 33 35 35 33 3b 33 2c 38 | 553;3,7,3553;3,8 |

| 0xffffff8067453460 | 2c 33 35 35 33 3b 33 2c 39 2c 33 35 35 33 3b 33 | ,3553;3,9,3553;3 |

| 0xffffff8067453470 | 2c 31 30 2c 33 35 35 33 3b 33 2c 31 31 2c 33 35 | ,10,3553;3,11,35 |

| 0xffffff8067453480 | 35 33 3b 33 2c 31 32 2c 33 34 30 33 37 3b 33 2c | 53;3,12,34037;3, |

| 0xffffff8067453490 | 31 33 2c 33 35 35 33 3b 33 2c 31 34 2c 33 34 30 | 13,3553;3,14,340 |

| 0xffffff80674534a0 | 33 37 3b 33 2c 31 35 2c 33 34 30 33 37 00 2d 2d | 37;3,15,34037.-- |

| 0xffffff80674534b0 | 73 65 72 76 69 63 65 2d 72 65 71 75 65 73 74 2d | service-request- |

| 0xffffff80674534c0 | 63 68 61 6e 6e 65 6c 2d 74 6f 6b 65 6e 3d 37 31 | channel-token=71 |

| 0xffffff80674534d0 | 38 31 37 42 46 31 36 30 45 34 45 30 38 44 45 44 | 817BF160E4E08DED |

| 0xffffff80674534e0 | 36 38 39 32 33 43 41 43 37 37 46 36 30 37 00 2d | 68923CAC77F607.- |

| 0xffffff80674534f0 | 2d 72 65 6e 64 65 72 65 72 2d 63 6c 69 65 6e 74 | -renderer-client |

| 0xffffff8067453500 | 2d 69 64 3d 39

| -id=9

|

+---------------------+--------------------------------------------------+-------------------+

[Agent.kext] : action=KAUTH_FILEOP_EXEC, uid=501, process(pid 538)=Google Chrome, parent(ppid 1)=launchd, path=/Applications/Google

Chrome.app/Contents/Versions/57.0.2987.98/Google Chrome Helper.app/Contents/MacOS/Google Chrome Helper, command line=/Applications/Google

Chrome.app/Contents/Versions/57.0.2987.98/Google Chrome Helper.app/Contents/MacOS/Google Chrome Helper --type=renderer --field-trial-handle=1 --

primordial-pipe-token=71817BF160E4E08DED68923CAC77F607 --lang=en-US --enable-offline-auto-reload --enable-offline-auto-reload-visible-only --

enable-pinch --num-raster-threads=1 --enable-zero-copy --enable-gpu-memory-buffer-compositor-resources --content-image-texture-

target=0,0,3553;0,1,3553;0,2,3553;0,3,3553;0,4,3553;0,5,3553;0,6,3553;0,7,3553;0,8,3553;0,9,3553;0,10,34037;0,11,34037;0,12,34037;0,13,3553;0,14

,3553;0,15,3553;1,0,3553;1,1,3553;1,2,3553;1,3,3553;1,4,3553;1,5,3553;1,6,3553;1,7,3553;1,8,3553;1,9,3553;1,10,34037;1,11,34037;1,12,34037;1,13,

3553;1,14,3553;1,15,3553;2,0,3553;2,1,3553;2,2,3553;2,3,3553;2,4,3553;2,5,34037;2,6,3553;2,7,3553;2,8,3553;2,9,3553;2,10,3553;2,11,3553;2,12,340

37;2,13,3553;2,14,34037;2,15,34037;3,0,3553;3,1,3553;3,2,3553;3,3,3553;3,4,3553;3,5,34037;3,6,3553;3,7,3553;3,8,3553;3,9,3553;3,10,3553;3,11,355

3;3,12,34037;3,13,3553;3,14,34037;3,15,34037 --service-request-channel-token=71817BF160E4E08DED68923CAC77F607 --renderer-client-id=9.

DEMO : macOS Kernel Agent

Kernel Authorization Technical Note TN2127
https://developer.apple.com/library/content/technotes/tn2127/_index.html
https://v2dev.sartle.com/sites/default/files/images/blog/tumblr_inline_nhtxaveT4p1sthg2o.jpg

Kernel Call Stack/Disassembler Library

-*> MEMORY DUMP <*-

+---------------------+--------------------------------------+-------------------+

|

ADDRESS

| 7 6 5 4 3 2 1 0 F E D C B A 9 8 | 0123456789ABCDEF |

| --------------------+--------------------------------------+------------------ |

| 0xffffff806c17bba0 | ffffff80`6c17bc00 ffffff80`0cd45f23 | ...l....#_...... |

| 0xffffff806c17bbb0 | 00000000`00000000 ffffff80`12e11000 | ................ |

| 0xffffff806c17bbc0 | ffffff80`1329c710 ffffff80`12e11000 | ..)............. |

| 0xffffff806c17bbd0 | 00000016`d51f0016 ffffff80`0d0832d0 | .........2...... |

| 0xffffff806c17bbe0 | ffffff80`135e2a08 00000000`00000000 | .*^............. |

| 0xffffff806c17bbf0 | ffffff80`1c290878 ffffff80`1c290808 | x.).......)..... |

| 0xffffff806c17bc00 | ffffff80`6c17bcb0 ffffff80`0cd6536d | ...l....mS...... |

| 0xffffff806c17bc10 | ffffff80`00000008 ffffff80`1329c710 | ..........)..... |

| 0xffffff806c17bc20 | ffffff80`6c17bc68 ffffff80`15c7ba78 | h..l....x....... |

| 0xffffff806c17bc30 | ffffff80`15c7bad0 ffffff80`15c7ba78 | ........x....... |

| 0xffffff806c17bc40 | 00000000`00000000 ffffff80`135e2a00 | .........*^..... |

| 0xffffff806c17bc50 | 00000000`00000001 ffffff80`15c7ba78 | ........x....... |

| 0xffffff806c17bc60 | ffffff80`67453010 00000000`00000000 | .0Eg............ |

| 0xffffff806c17bc70 | ffffff80`67453010 ffffff80`0cd54aa6 | .0Eg.....J...... |

| 0xffffff806c17bc80 | 3ec19f54`d51f0016 ffffff80`1c290800 | ....T..>..)..... |

| 0xffffff806c17bc90 | 00000000`00000000 00000000`00000000 | ................ |

| 0xffffff806c17bca0 | ffffff80`1c290808 ffffff80`15c7ba78 | ..).....x....... |

| 0xffffff806c17bcb0 | ffffff80`6c17bf50 ffffff80`0cd638de | P..l.....8...... |

| 0xffffff806c17bcc0 | ffffff80`6c17bf18 ffffff80`16f82058 | ...l....X ...... |

| 0xffffff806c17bcd0 | ffffff80`6c17bd70 ffffff80`15029000 | p..l............ |

| 0xffffff806c17bce0 | 00000000`0000400c 00000001`6c17bce8 | .@.........l.... |

| 0xffffff806c17bcf0 | ffffff80`1c290800 00000000`00000001 | ..)............. |

| 0xffffff806c17bd00 | 00007f8e`2a193338 ffffff80`15029040 | 83.*....@....... |

| 0xffffff806c17bd10 | 00000000`00000000 ffffff80`1c290808 | ..........)..... |

| 0xffffff806c17bd20 | ffffff80`15c7ba78 00000000`00000001 | x............... |

| 0xffffff806c17bd30 | ffffff80`15c7ba78 00000000`00000800 | x............... |

| 0xffffff806c17bd40 | ffffff80`6c17be70 00000000`000000f6 | p..l............ |

+---------------------+--------------------------------------+-------------------+

[Agent.kext] : Disassemble the exec_activate_image(). (01) 55 PUSH RBP (03) 4889e5 MOV RBP, RSP (02) 4157 PUSH R15 (02) 4156 PUSH R14 (02) 4155 PUSH R13 (02) 4154 PUSH R12 (01) 53 PUSH RBX (04) 4883ec78 SUB RSP, 0x78 (03) 4989ff MOV R15, RDI ....

Mandiant Monitor.app/osxAgent
Documented data structure image_params: https://developer.apple.com/reference/kernel/image_params
https://www.fireeye.com/services/freeware/monitor.html

Mandatory Access Control Framework Technical Q&A QA1574
https://developer.apple.com/library/content/qa/qa1574/_index.html https://github.com/apple/darwin-xnu/blob/xnu-4570.1.46/security/mac_policy.h#L84 https://github.com/apple/darwin-xnu/blob/xnu-4570.1.46/security/mac_base.c#L778 https://github.com/apple/darwin-xnu/blob/xnu-4570.1.46/security/mac_base.c#L782
https://v2dev.sartle.com/sites/default/files/images/blog/tumblr_inline_nhtxaveT4p1sthg2o.jpg

Mandiant Monitor.app/osxAgent

Kernel Inline Hook ( the OSKext::start )

(lldb) di -b -n OSKext::start kernel.development`OSKext::start:
0xffffff800ce1aa00 <+0>: 55 0xffffff800ce1aa01 <+1>: 48 89 e5 0xffffff800ce1aa04 <+4>: 41 57 0xffffff800ce1aa06 <+6>: 41 56 0xffffff800ce1aa08 <+8>: 41 55 0xffffff800ce1aa0a <+10>: 41 54 0xffffff800ce1aa0c <+12>: 53 0xffffff800ce1aa0d <+13>: 48 83 ec 28 0xffffff800ce1aa11 <+17>: 41 89 f6 0xffffff800ce1aa14 <+20>: 49 89 ff 0xffffff800ce1aa17 <+23>: 49 8b 07 .................. 0xffffff800ce1adfd <+1021>: 4c 8b 65 c0 0xffffff800ce1ae01 <+1025>: 49 8b 7f 48 0xffffff800ce1ae05 <+1029>: 4c 89 e6 0xffffff800ce1ae08 <+1032>: ff 55 b0 .................. 0xffffff800ce1ae60 <+1120>: 5b 0xffffff800ce1ae61 <+1121>: 41 5c 0xffffff800ce1ae63 <+1123>: 41 5d 0xffffff800ce1ae65 <+1125>: 41 5e 0xffffff800ce1ae67 <+1127>: 41 5f 0xffffff800ce1ae69 <+1129>: 5d 0xffffff800ce1ae6a <+1130>: c3

pushq movq pushq pushq pushq pushq pushq subq movl movq movq

%rbp %rsp, %rbp %r15 %r14 %r13 %r12 %rbx $0x28, %rsp %esi, %r14d %rdi, %r15 (%r15), %rax

movq movq movq callq

-0x40(%rbp), %r12 0x48(%r15), %rdi %r12, %rsi *-0x50(%rbp)

popq popq popq popq popq popq retq

%rbx %r12 %r13 %r14 %r15 %rbp

Kernel Kext Driver Entry
http://simpsons.wikia.com/wiki/File:Woo_hoo!_poster.jpg

Pre and Post Callback Handler

(lldb) di -b -n OSKext::start kernel.development`OSKext::start:
0xffffff800ce1aa00 <+0>: 55 0xffffff800ce1aa01 <+1>: 48 89 e5 0xffffff800ce1aa04 <+4>: 41 57 0xffffff800ce1aa06 <+6>: 41 56 0xffffff800ce1aa08 <+8>: 41 55 0xffffff800ce1aa0a <+10>: 41 54 0xffffff800ce1aa0c <+12>: 53 0xffffff800ce1aa0d <+13>: 48 83 ec 28 0xffffff800ce1aa11 <+17>: 41 89 f6 0xffffff800ce1aa14 <+20>: 49 89 ff 0xffffff800ce1aa17 <+23>: 49 8b 07 .................. 0xffffff800ce1adfd <+1021>: 4c 8b 65 c0 0xffffff800ce1ae01 <+1025>: 49 8b 7f 48 0xffffff800ce1ae05 <+1029>: 4c 89 e6 0xffffff800ce1ae08 <+1032>: ff 55 b0 .................. 0xffffff800ce1ae60 <+1120>: 5b 0xffffff800ce1ae61 <+1121>: 41 5c 0xffffff800ce1ae63 <+1123>: 41 5d 0xffffff800ce1ae65 <+1125>: 41 5e 0xffffff800ce1ae67 <+1127>: 41 5f 0xffffff800ce1ae69 <+1129>: 5d 0xffffff800ce1ae6a <+1130>: c3

pushq movq pushq pushq pushq pushq pushq subq movl movq movq

%rbp %rsp, %rbp %r15 %r14 %r13 %r12 %rbx $0x28, %rsp %esi, %r14d %rdi, %r15 (%r15), %rax

movq movq movq callq

-0x40(%rbp), %r12 0x48(%r15), %rdi %r12, %rsi *-0x50(%rbp)

popq popq popq popq popq popq retq

%rbx %r12 %r13 %r14 %r15 %rbp

Pre Callback Post Callback

Inline Hook Handler

Kernel Kext Driver Entry

DEMO : Pre and Post Kernel Inline Hook

macOS Kernel Debugging

Kernel Debugging is an Interesting Topic

Kernel Debugging is an Interesting Topic

A Smooth Sea Never Made A Skilled Sailor iOS Kernel Debugging
iOS Kernel Exploitation, Black Hat Europe 2011

A Smooth Sea Never Made A Skilled Sailor
https://github.com/kashifmin/KashKernel_4.2/blob/master/mediatek/platform/mt6589/kernel/drivers/mmc-host/mt_sd_misc.c#L990
Android/Linux Kernel Debugging

comma.ai/George Hotz

From Panics to Kernel Zero-day Vulnerabilities

well, well, well... kernel panics
lldb Kernel Debugging, Session 707, WWDC 2012

Real War is Not a Game

llvm clang compiler

GCC compiler (with the "-kext" and "-lkmod" arguments)

DEMO : Arbitrary Kernel Memory Read/Write Zero-day Vulnerabilities

DEMO : Arbitrary Kernel Memory Read/Write Zero-day Vulnerabilities

DEMO : Arbitrary Kernel Memory Read/Write Zero-day Vulnerabilities

The End

Think Deeply

Q&A
wang yu Didi Research America

