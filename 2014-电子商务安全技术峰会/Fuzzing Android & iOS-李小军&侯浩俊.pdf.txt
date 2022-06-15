Fuzzing Android & iOS
 OGC557

Android
·  ·  · 

Android
· 
: http://en.wikipedia.org/wiki/Android_version_history

Android
· 
: http://android.scap.org.cn/

Android
: http://android.scap.org.cn/

Android
·  · 


·  · 

1DAY
· AndroidPC
· 1DAY
· 1day
­ CVE-2012-0056 Linux/proc/pid/mem 
­ CVE-2013-1773 LinuxVFAT ......


· Android
­ CVE-2009-1185CVE-2009-2692CVE-20111149CVE-2011-1823CVE-2011-3874 setuid CVE-2012-0056CVE-2012-6422 CVE-2013-1773 ...


· 1day
­ Linux ­ Fuzzing Android
· 


· Android
­  ­ 
egFuzzing system call

Fuzzing system call
· 6
· 

Fuzzing system call
· [0][255]~[9][255] · [10][511]~[19][511] · [20][1023]~[29][1023] · [30][2047]~[39][2047]
· [40][4095]~[49][4095]

Fuzzing system call
int mkdir(const char *pathname, mode_t mode); · Fuzz pathname

Fuzzing system call

Fuzzing system call
· Fuzz mode


· 
· Android 


­ CVE-2010-1807, CVE-2010-1119 Android 2.0/2.1 Webkit Use-After-Free
­ WebviewJavaScript ­ Adobe Flash 


· 1day
­ egCVE-2010-1119
· 

ADBFuzzer
· TargetFirefox Mobile on Android

ADB

Firef ox Mobil e


WebSocket

PC

Android



ADBFuzzer
· Firefox Mobile
· ADBpc-> android device

ADBFuzzer
· WebSocketandroid device->pc
­ Send tests ­ Logs/messages ­ Send commands

ADBFuzzer
· ADB
­ mozdevice, DeviceManagerADB
· dump
­ Firefox Mobileminidump ­ minidump_stackwalkaddr2line

BrowserFuzzer
· Targetwebkit within the Chrome for Android
· HTML5
­ Eg:(Typed Array)

BrowserFuzzer
· Trigger code
· Typed Array
­ Int8ArrayUinit8ArrayInt16Array Uint16ArrayInt32ArrayUint32Array Float32ArrayFloat64Array

· Fuzzing

BrowserFuzzer

BrowserFuzzer
· Pc
­ Web ­ js ­ adb http ­ 
· Logcat · Debuggerd
-- find`SIGSEGV'

AndroidFuzzing
· ActivityServiceBroadcast Receiver Cotent Provider
·  ·  ·...


Intent fuzzing
· Intent
­ Action
·  AndroidManifest.xml , <intent-filter>...</intent-filter> · 
const strings --> action  Actions
­ Data
· <intent-filter>URL ActionFuzz uri(tel:http:mailto:content:
)
­ Extras
· putExtras(key,value)getXXXXExtras() · ASOP, HookAPIROMs,

Intent fuzzing
· PcClient
­ Intent ­ ServerFuzzing ­ 
· Server
­ Intent ­ hookAPI

Intent fuzzing
· hookAPI getIntExtras(...)getStringExtras(...) getShortExtra(...)getShortArrayExtra(...)...
ActivityManagerService checkPermission(String permission,int
pid,int uid)

Content Provider Fuzzing
· 
· 
­  ­ SQLiteSQL
· 
­ 

Content Provider Fuzzing

APP2 Activity2
Activity2

APP3

Activity3

...

APP1

Content Provider

Activity1_1
...
Activity1_n

SQLite

XML

FILE

...

Content Provider Fuzzing
· Fuzzing
­ Provider ­ URISQL ­ SQLite
·  ·  · Hook SQLite APIs  · 

Content Provider Fuzzing
· Fuzzing Intent · pcClient · Server


· DOS
­ Fuzzing the Phone in your Phone
· 
­ Fuzzing Bluetooth:Crash-testing bluetoothenabled devices
· GSM
­ MobiDeke: Fuzzing the GSM Protocol Stack
· NFC
­ Vulnerability Analysis and Attacks on NFCenabled Mobile Phones


· 
­ ComDroidCHEXDroidChecker WoodpeckerMalloDroid ContentScope...
· 
­ DrozerIntent SnifferIntent Fuzzer ASEFAFE...


·  · UI · 

NEXT
iOS 

iOS 
·  · iOS


· AndroidARM OSXLinux
·  AndroidiOS304 Webkit
· Android 


·  ...
· Safari Appstore
· 1dayMac OSXPCSafari iOS


· iOS  iOS
· XSS 
·  

Safari
· Safari  
· WebkitHTML PDFJPEGPPTXLS 

Safari
· 
­ wushi

iOS
· iOS · OSXiOSiOSOSX
OSXBSD (XNU)
­ MachLow level abstraction of kernel
­ BSDHigh level abstraction of kernel
­ IOKitApple

iOS

· BSD

­  File System, Socket

­ POSIX API 

­  /usr/include/sys/syscOSaObljeclt .h

· IOKit

OS data containers

OSMetaClass

­  ­ 

IOkit Helper classes

IORegistryEntry IOService

IOkit superclasses

iOS
· Mach API
InP->Head.msgh_request_port = host;
· InP->Head.msgh_reply_port = mig_get_reply_port();
· InP->Head.msgh_id = 200; · msg_result = mach_msg(&InP->Head,
MACH_SEND_MSG|MACH_RCV_MSG|MACH_MSG_O PTION_NONE, (mach_msg_size_t)sizeof(Request), (mach_msg_size_t)sizeof(Reply), InP>Head.msgh_reply_port, MACH_MSG_TIMEOUT_NONE, MACH_PORT_NULL);

iOS
· 
­ XNU ­  ­ fuzz

Fuzz iokit
· 
­ osx ­ IOServiceMatching("IOReportHub"); ­ IOServiceOpen(service, mach_task_self(), connnection_type,
&connection); ­ selector=3; ­ input[0]=0x4444; ­ IOConnectCallMethod(connection, selector,input, 1, 0, 0,
NULL,NULL, NULL, NULL); ­ CVE-2014-1355

Fuzz iokit

· 

­ Ioreg 

­ Fuzz 

­ IOConnectCallMethod(

­ mach_port_t connection,

// In

­ uint32_t

selector,

// In

­ const uint64_t *input,

// In

­ uint32_t

inputCnt,

// In

­ const void *inputStruct,

// In

­ size_t

inputStructCnt, // In

­ uint64_t

*output,

// Out

­ uint32_t

*outputCnt,

// In/Out

­ void

*outputStruct,

// Out

­ size_t

*outputStructCnt) // In/Out

Fuzz 
· Syscall · Ioctl · Mach api · 
· Ole Henry Halvorsen& Douglas Clarke OS X and iOS Kernel Programming

· 
· -se · -pangu · CVE





