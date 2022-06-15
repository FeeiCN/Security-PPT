Alexandru Blanda Intel OTC Security SQE

A fuzzing approach

· Set of basic methods and concepts for fuzzing in Android

Real-life fuzzing campaigns

· Fuzzing Stagefright · Fuzzing the Android installer

Alternatives · Fuzzing with AFL in Android

Data generation

Execute/run test

Log process

Triage mechanism

Analyze & debug crashes

$ adb shell log -p F ­t <Component> <test_case_index> *** <reproducibility_info>
$ adb shell logcat ­v time *:F
01-16 17:46:12.240 F/<Component> (PID): <test_case_index> *** <reproducibility_info> 01-16 17:46:19.676 F/<Component> (PID): <test_case_index> *** <reproducibility_info> 01-16 17:46:24.328 F/<Component> (PID): <test_case_index> *** <reproducibility_info> 17:46:24.405 F/libc (8321): Fatal signal 11 (SIGSEGV) at 0x18 (code=1), thread 831 (process_name) 01-16 17:46:25.128 F/<Component> (PID): <test_case_index> *** <reproducibility_info> 01-16 17:46:55.933 F/<Component> (PID): <test_case_index> *** <reproducibility_info>

pid: 3438, tid: 3438, name: stagefright >>> stagefright <<< signal 11 (SIGSEGV), code 1 (SEGV_MAPERR), fault addr deadbaad Abort message: 'invalid address or address of corrupt block 0x8004d748 passed to dlfree'
eax b3ee0ff8 ebx b7b18f38 ecx b7b1d900 edx b3ee0ff8 esi 8004d748 edi af6d4dee xcs 00000073 xds 0000007b xes 0000007b xfs 00000000 xss 0000007b eip b7a7202c ebp bffff418 esp bffff3d0 flags 00010286
backtrace: #00 pc 0001402c /system/lib/libc.so (dlfree+1948) #01 pc 0000d630 /system/lib/libc.so (free+32) #02 pc 000dcf1c /system/lib/libstagefright.so
(android::MediaBuffer::~MediaBuffer()+108) #03 pc 000dd6eb /system/lib/libstagefright.so
(android::MediaBuffer::release()+267) #04 pc 000ddf7b /system/lib/libstagefright.so
(android::MediaBufferGroup::~MediaBufferGroup()+187)

1. Parse generated logs · Identify input that causes crashes
2. Retest crashing input
3. For each identified test case · Grab generated tombstone · Parse tombstone ­ get the PC value · Check if PC value has been previously encountered · Save tombstone and input if issue is unique

pid: 3438, tid: 3438, name: stagefright >>> stagefright <<< signal 11 (SIGSEGV), code 1 (SEGV_MAPERR), fault addr deadbaad Abort message: 'invalid address or address of corrupt block 0x8004d748 passed to dlfree'
eax b3ee0ff8 ebx b7b18f38 ecx b7b1d900 edx b3ee0ff8 esi 8004d748 edi af6d4dee xcs 00000073 xds 0000007b xes 0000007b xfs 00000000 xss 0000007b eip b7a7202c ebp bffff418 esp bffff3d0 flags 00010286
backtrace: #00 pc 0001402c /system/lib/libc.so (dlfree+1948) #01 pc 0000d630 /system/lib/libc.so (free+32) #02 pc 000dcf1c /system/lib/libstagefright.so
(android::MediaBuffer::~MediaBuffer()+108) #03 pc 000dd6eb /system/lib/libstagefright.so
(android::MediaBuffer::release()+267) #04 pc 000ddf7b /system/lib/libstagefright.so
(android::MediaBufferGroup::~MediaBufferGroup()+187)

<6>[73801.130320] stagefright[12469]: segfault at 14 ip 00000000f72a5fff sp 00000000fff98710 error 4 in libstagefright.so[f71c6000+1b5000]
<6>[73794.579462] stagefright[12455]: segfault at c ip 00000000f728bcfe sp 00000000ff9d6f90 error 6 in libstagefright.so[f71e8000+1b5000]

/* * Page fault error code bits: * * bit 0 == 0: no page found * bit 1 == 0: read access * bit 2 == 0: kernel-mode access * bit 3 == * bit 4 == */

1: protection fault 1: write access 1: user-mode access 1: use of reserved bit detected 1: fault was an instruction fetch

$ gdbserver :5039 --attach <process_pid> OR
$ gdbserver :5039 /path/to/executable <options> (ex: gdbserver :5039 /system/bin/stagefright -a file.mp3)
$ adb forward tcp:5039 tcp:5039 $ gdb
(gdb) target remote :5039 (from the gdb shell) (gdb) continue (to resume process execution)
(gdb) set solib-absolute-prefixdb /path/to/tree/out/target/product/<product_id>/symbols/ (gdb) set solib-search-path /path/to/tree/out/target/product/<product_id>/symbols/system/lib/

backtrace: #00 pc 0001402c /system/lib/libc.so (dlfree+1948) #01 pc 0000d630 /system/lib/libc.so (free+32) #02 pc 000dcf1c /system/lib/libstagefright.so
(android::MediaBuffer::~MediaBuffer()+108)
$ addr2line -f -e /path/to/tree/out/target/product/<product_id>/symbols/system/lib/libstagefright.s o 000dcf1c

Binary streams containing complex data Large variety of audio and video players and associated
media codecs User perception that media files are harmless
Media playback doesn't require special permissions

root@android:/ # stagefright -h usage: stagefright -h(elp) -a(udio) -n repetitions -l(ist) components -m max-number-of-frames-to-decode in each pass -p(rofiles) dump decoder profiles supported -t(humbnail) extract video thumbnail or album art -s(oftware) prefer software codec -r(hardware) force to use hardware codec -o playback audio -w(rite) filename (write to .mp4 file) -x display a histogram of decoding times/fps (video only) -S allocate buffers from a surface -T allocate buffers from a surface texture -d(ump) filename (raw stream data to a file) -D(ump) filename (decoded PCM data to a file)

04-14 05:02:07.698 F/Stagefright(20222): - sp_stagefright *** 958 Filename:zzuf.32732.c8jZzT.mp4 04-14 05:02:13.382 F/Stagefright(20255): - sp_stagefright *** 959 Filename:zzuf.26772.zh7c8g.mkv 04-14 05:02:13.527 F/libc (20256): Fatal signal 11 (SIGSEGV), code 1, fault addr 0x0 in tid 20256 (stagefright) 04-14 05:02:20.820 F/Stagefright(20270): - sp_stagefright *** 960 Filename:zzuf.12260.ayDuIA.mpg 04-14 05:02:21.259 F/Stagefright(20281): - sp_stagefright *** 961 Filename:zzuf.6488.F8drye.mp4

Attractive target ­ process runs with high system privileges
Method for unprivileged users to send input to system components
Check for issues that are not discovered during regular validation

Lollipop

ART

dex2oat

KitKat Dalvik dexopt

06-26 17:43:05.568 F/dexopt (14769): - sp_lib.py - APK_id = imangi.templerun.apk seed = radamsa -s 1927 06-26 17:43:29.732 F/dexopt (14881): - sp_lib.py - APK_id = imangi.templerun.apk combination = radamsa -s 2086 06-26 17:43:54.620 F/dexopt (14988): - sp_lib.py - APK_id = imangi.templerun.apk seed = radamsa -s 5011 06-26 17:44:19.763 F/dexopt (15105): - sp_lib.py - APK_id = imangi.templerun.apk seed = radamsa -s 1543 06-26 17:44:43.524 F/dexopt (15215): - sp_lib.py - APK_id = imangi.templerun.apk seed = radamsa -s 9090 06-26 17:44:44.079 F/libc (15227): Fatal signal 11 (SIGSEGV) at 0xaa4c04f8 (code=1), thread 15227 (mangi.templerun) 06-26 17:45:09.950 F/dexopt (15338): - sp_lib.py - APK_id = imangi.templerun.apk seed = radamsa -s 8098 06-26 17:45:33.771 F/dexopt (15451): - sp_lib.py - APK_id = imangi.templerun.apk seed = radamsa -s 1069 06-26 17:45:59.802 F/dexopt (15570): - sp_lib.py - APK_id = imangi.templerun.apk seed = radamsa -s 8925

Usage: dex2oat [options]... -j<number>: specifies the number of threads used for compilation. --dex-file=<dex-file>: specifies a .dex file to compile. --zip-fd=<file-descriptor>: specifies a file descriptor of a zip file
containing a classes.dex file to compile. --zip-location=<zip-location>: specifies a symbolic name for the file --oat-file=<file.oat>: specifies the oat output destination via a filename. --oat-fd=<number>: specifies the oat output destination via a file descriptor. --oat-location=<oat-name>: specifies a symbolic name for the file corresponding
to the file descriptor specified by --oat-fd. ... ... ...

09-29 11:32:20.460 F/dex2oat ( 8041): - sp_libd.py - dex_id = com.evernote.apk seed = radamsa -s 1012528 09-29 11:32:33.405 F/dex2oat ( 8054): - sp_libd.py - dex_id = com.evernote.apk seed = radamsa -s 6186726 09-29 11:32:46.277 F/dex2oat ( 8066): - sp_libd.py - dex_id = com.evernote.apk seed = radamsa -s 7338683 09-29 11:32:49.121 F/libc (15227): Fatal signal 11 (SIGSEGV) at 0xaa4c0302 (code=1), thread 15227 (evernote) 09-29 11:32:57.249 F/dex2oat ( 8079): - sp_libd.py - dex_id = com.evernote.apk seed = radamsa -s 231131 09-29 11:33:08.528 F/dex2oat ( 8093): - sp_libd.py - dex_id = com.evernote.apk seed = radamsa -s 4456070

01-03 13:24:13.511 I/dex2oat ( 5671): dex2oat --dex-file=test7.dex --oatfile=output.oat 01-03 13:24:13.125 W/dex2oat ( 5671): Failed to open .dex from file 'test7.dex': verify
dex file 'test7.dex': Bad checksum (790931db, expected 745631bc) 01-03 13:24:13.115 E/dex2oat ( 5671): Failed to open some dex files: 1 01-03 13:24:13.447 I/dex2oat ( 5671): dex2oat took 255.693ms (threads: 4)
01-03 03:22:23.581 I/dex2oat ( 5671): dex2oat --dex-file=test7.dex --oatfile=output.oat 01-03 03:22:23.635 W/dex2oat ( 5671): Failed to open .dex from file 'test7.dex': verify
dex file 'test7.dex': Bad file size (143221ab, expected 435611cd) 01-03 03:22:23.635 E/dex2oat ( 5671): Failed to open some dex files: 1 01-03 03:22:23.837 I/dex2oat ( 5671): dex2oat took 255.693ms (threads: 4)
01-03 04:21:13.181 I/dex2oat ( 5671): dex2oat --dex-file=test7.dex --oatfile=output.oat 01-03 04:21:13.235 W/dex2oat ( 5671): Failed to open .dex from file 'test7.dex': verify
dex file 'test7.dex': Invalid header size (7f, expected 70) 01-03 04:21:13.641 E/dex2oat ( 5671): Failed to open some dex files: 1 01-03 04:21:13.857 I/dex2oat ( 5671): dex2oat took 255.693ms (threads: 4)

struct dex_magic magic uint checksum SHA1 signature[20] uint file_size uint header_size uint endian_tag uint link_size uint link_off uint map_off uint string_ids_size uint string_ids_off uint type_ids_size uint type_ids_off uint proto_ids_size uint proto_ids_off uint field_ids_size uint field_ids_off uint method_ids_size uint method_ids_off uint class_defs_size uint class_defs_off uint data_size uint data_off

dex 035 0h

8h

Magic value

B3D20217h 8h

4h

Alder32 checksum of rest of file

6DB8EDA7748C2h59FDC5C1947h5226850S6HFDA-3139siCg0n2aCtuFr1e of rest of file

1430508 20h

4h

File size in bytes

112 24h

4h

Header size in bytes

12345678h 28h

4h

Endianness tag

0 2Ch

4h

Size of link section

0 30h

4h

File offset of link section

1430336 34h

4h

File offset of map list

11029 38h

4h

Count of strings in the string ID list

112 3Ch

4h

File offset of string ID list

2068 40h

4h

Count of types in the type ID list

44228 44h

4h

File offset of type ID list

2592 48h

4h

Count of items in the method prototype ID list

52500 4Ch

4h

File offset of method prototype ID list

5335 50h

4h

Count of items in the field ID list

83604 54h

4h

File offset of field ID list

12925 58h

4h

Count of items in the method ID list

126284 5Ch

4h

File offset of method ID list

1427 60h

4h

Count of items in the class definitions list

229684 64h

4h

File offset of class definitions list

1155160 68h

4h

Size of data section in bytes

275348 6Ch

4h

File offset of data section

Magic number (constant value) Checksum (needs to be computed) SHA1 signature (needs to be computed) File size (needs to be computed)
Header size (constant value) Endian tag (constant value)

Magic number (constant value) Checksum (needs to be computed) SHA1 signature (needs to be computed) File size (needs to be computed)
Header size (constant value) Endian tag (constant value)

Map offset (needs to be computed)
Data size (needs to be computed)

09-19 11:57:00.346 F/dex2oat_bff(16102): - sp_libd.py - dex_id = zzuf.16185.sOaX7i.dex 09-19 11:57:01.193 F/dex2oat_bff(16113): - sp_libd.py - dex_id = zzuf.2554.pfKpqy.dex 09-19 11:57:03.488 F/dex2oat_bff(16125): - sp_libd.py - dex_id = zzuf.4460.JGEqFa.dex 09-19 11:57:04.218 F/libc (16127): Fatal signal 11 (SIGSEGV) at 0xaa2c14f4 (code=1), thread 16127 (evernote) 09-19 11:57:05.767 F/dex2oat_bff(16136): - sp_libd.py - dex_id = zzuf.17117.vuTEiB.dex 09-19 11:57:08.651 F/dex2oat_bff(16146): - sp_libd.py - dex_id = zzuf.5671.gHcnXq.dex 09-19 11:57:12.293 F/dex2oat_bff(16157): - sp_libd.py - dex_id = zzuf.28549.ArCcd7.dex 09-19 11:57:14.143 F/dex2oat_bff(16167): - sp_libd.py - dex_id = zzuf.1524.kHO8eC.dex

1. Check device prerequisites 1) Root 2) Remount 3) Push afl target binary 4) Load initial seeds 5) Set scalling governor
2. Eliminate crashing test cases from initial seeds on each device
1) Run AFL in a loop with timeout 2) Identify crashing test case and delete it from input folder 3) Restart AFL with timeout -> if crash occurs goto 2) else goto 4) 4) No crash occurred after the timeout -> AFL successfully started -> kill the process 3. Restart the AFL process with clean input directory and redirect output to /dev/null

