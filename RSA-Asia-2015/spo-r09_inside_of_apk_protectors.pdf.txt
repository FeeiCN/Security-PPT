SESSION ID: SPO-R09
Inside of APK Protectors

Bob Pan
Mobile Security Expert Alibaba
pxb1988@gmail.com

#RSAC

#RSAC
Agenda
 What is APK Protector  Tools to reverse engineer an APK
 Anti-tools by APK Protector
 The hide and seek game between APK Protector and hacker  Q&A
2

#RSAC
#define APK_PROTECTOR
 Post-Developing  Easy to apply
 Everyone can use
 Hard to break
3

#RSAC
Anti-Tools
4

#RSAC
dex2jar
 Convert back dex to jar
 Decompile with existing decompiler E.x. Jd-gui
5

#RSAC
smali/baksmali
 Disassemble dex file  Easy to modify dex
6

#RSAC
apktool
 Extract resources
 Disassemble dex
 Smali based
7

#RSAC
JEB
 Interactive decompiler  Extract resources
 Apktool based
8

#RSAC
Anti-apktool
 Bug: headerSize not handled properly
9

#RSAC
Anti-JEB
 Bug: special class name "pnf.this.object.does.not.Exist"
10

Anti-emulation
 Battery/Signal status  IMEI  Properties
 "sdk" in Build.PRODUCT  Files
 /system/bin/qemud  /dev/socket/qemud  /dev/qemu_pipe  Goldfish kernel

#RSAC
 Qemu specific behavior
 Binary transform
http://www.dexlabs.org/blog/btdetect
 Low level cache
https://bluebox.com/technical/androidemulator-detection-by-observing-low-levelcaching-behavior

11

#RSAC
Anti-debug
 Anti-ptrace
 PTRACE_ME  A trace B trace C
 Check for /proc/pid/status
 State: T (tracing stop)  TracerPid: xxxx
 Check for process named gdb
12

#RSAC
Game: Hide and Seek
13

#RSAC
Gen.1 ­ Hiding entire apk in resources
q
14

#RSAC
Gen.1 ­ Hiding entire apk in resources
15

#RSAC
Gen.1 ­ Hiding entire apk in resources
 Payload takes effect after install/update
Intent i = new Intent(Intent.ACTION_VIEW); i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK); i.setDataAndType(Uri.parse("file://" + apkfile),
"application/vnd.android.package-archive"); ctx.startActivity(i);
 User interaction required  Easy to detect by anti-malware
16

#RSAC
Gen.2 ­ Load dex separately
 Load dex with the Java Reflection API
cl = new DexPathClassLoader("/sdcard/extra.jar",...); clz = cl.loadClass("com.test.Action"); Action action = (Action)clz.newInstance();
 A simple fix to MethodID size limit ( < 65535 )
 Choose class carefully in secondary dex
17

#RSAC
Gen.2.1 ­ Modify the default ClassLoader

 Inject secondary dex to ClassLoader

classes.dex

classes.dex second.dex

 Same with Multidex in android support

 Load Stub Application

ctx.mOuterContext ctx.mPackageInfo.mApplication

ctx.mPackageInfo.mActivityThread.mInitialApplication
 Restore the Application ctx.mPackageInfo.mActivityThread.mAllApplications

18

#RSAC
Become an APK Protector
a
After:
19

How it works
Load Stub dex

Init StubApplication

#RSAC
Decrypt and load the 2nd dex

Continue Loading Main Activity

Replace StubApplication
with original Application
20

Init original Application

#RSAC
Weakness
 Dex must be extracted to file system  Odex is generated to file system
 Almost equal to dex file  It's easy to recover to dex by Smali/baksmali
 Quick fix: delete the dex/odex files !
21

#RSAC
Gen.2.3 ­ Hijack read/write function
 Tool like Cydia Substrate  Encrypt before write to file system  Decrypt before read to memory
22

#RSAC
Gen.2.4 ­ Load dex on the fly
23

#RSAC
Wait a sec.
 dvmDexFileOpenPartial is the key
 Hack it we get the dex again !
 Dex is still alive in memory
 Continuously  Get the Memory = Get the dex
24

#RSAC
Dumping by GDB
 Connect to target process by gdb -- <pid>  gcore to dump entire memory
25

#RSAC
Dumping by /proc/pid/mem
 ptrace to pause target thread  Search `dex.035' on each item /proc/pid/maps  Read out data from /proc/pid/mem
 android-unpacker by strazzere
 https://github.com/strazzere/android-unpacker
26

#RSAC
Gen.2.5 ­ Wipe the dex header
27

Gen.3 ­ Strip code from dex file

 Restore before execute

ClassDef

 None continuously

 Can't dump as offset + size

CodeItem

 Need rebuild dex

Dex File

#RSAC
ClassData Encoded Method

CodeItem

28

Gen.3.1 ­ Restore code internally

 Restore to dalvik internal Method struct
 Travel all Method struct before rebuild dex

ClassDef Dex File

Method

#RSAC
ClassData Encoded Method
CodeItem

29

#RSAC
Gen.3.2 ­ Restore code when need

Mark method as native

Build fresh Method struct
on JNI

CallxxxMethod
back to original code

 jmethodID is a pointer to Method struct  Harder to dump
 Need trigger all method invocation to get code

30

#RSAC
All-in-one roadmap to hide dex

 Load dex separately

 Delete dex after load  Hijack read/write  Load dex on the fly  Wipe dex header

 Strip code from dex  Restore code internally  Restore code when need

?  Transform instruction
 Customize VM

Gen 2. Protect in dex level

Gen 3. Protect in method level

Gen 4. Protect in instruction level

31

#RSAC
Summary
 Easy to use  Tricks in dalvik to hide dex  Tool bugs to prevent from disassemble  Stop most of beginners  It can be broken, but takes a lot of time  Need one ? Try http://jaq.alibaba.com
32

Q & A

#RSAC

pxb1988@gmail.com

#RSAC
Apply: Build your own Apk Protector
 Multi-dex is a good start point  You can find everything on these slides and Google  Have fun
34

#RSAC
Reference
 Reports from teammates in Alibaba.  STRAZZERE&SAWYER: ANDROID HACKER PROTECTION
LEVEL 0  STRAZZERE: Dex Education: Practicing Safe Dex  http://bbs.pediy.com/showthread.php?p=1353353
35

