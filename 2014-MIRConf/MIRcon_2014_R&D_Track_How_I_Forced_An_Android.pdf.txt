HOW I FORCED AN ANDROID VULNERABILITY INTO BYPASSING
MDM RESTRICTIONS + DIY MALWARE ANALYSIS
Zubair Ashraf Team Lead & Security Researcher IBM X-Force Advanced Research
@b0ut.m3
 Team Lead & Security Researcher @ IBM X-Force Research
@zashraf1337 securityintelligence.com/author/zubair-ashraf ca.linkedin.com/in/zubairashraf
1

IBM X-Force® Research and Development

Expert analysis and data sharing on the global threat landscape

Vulnerabi lity
Protectio n

Malware Analysis

Zero-day Research

IP Reputatio
n

URL / Web Filtering

Web Applicati
on Control

AntiSpam

The IBM X-Force Mission
 Monitor and evaluate the rapidly changing threat landscape  Research new attack techniques and develop protection for tomorrow's security challenges  Educate our customers and the general public  Integrate and distribute Threat Protection and Intelligence to make IBM solutions smarter
2

Agenda
 DIY Malware Analysis  Vulnerability Hunt  Exploitation

3

Android has Malware too 
4
5

Hon, my phone has been acting funny. You would know how to fix it, right?
6
Jim, we got a sample of a highly sophisticated Malware, can you take a look?
7

Android Malware Analysis
8
The installer
· APK files are like zip / jar files · contains manifest file in binary format · use this to convert to human readable
java ­jar AXMLPrinter2.jar AndroidManifest.xml
9

APK / Installer

Manifest file

Code / Classes.dex

10
Let's give it a run
 Mobisec sourceforge.net/p/mobisec  Notes on upgrading and installing additional tools
bit.ly/UpgradMobiSec  run it on top of your favorite virtualization product

11

Try the free tools and services
· It's a good idea to test the free tools and services · APKAnalyzer (apk-analyzer.net/) (dynamic) · Dexter (dexter.dexlabs.org) - (static)
12
Android Tools
SDK developer.android.com/sdk/exploring.html
AVD developer.android.com/tools/devices/managing-avds.htm
Emulator developer.android.com/tools/help/emulator.html
ADB developer.android.com/tools/help/adb.html
13

Let's get the emulator running
mobisec@Mobisec:/opt/mobisec/devtools/androi d-sdk/tools$ emulator-arm -avd Android_4.0.3 -scale 0.75 -debug all -logcat all -no-bootanim mobisec@Mobisec-VM:~$ adb install Malware/OBad/E1064BFD836E4C895B569B2DE470028 4.apk
14
Find the app!
15

Static Analysis of the apk
Package Name  logcat entries / compare before & after output of adb shell pm list packages
drozer - mwrinfosecurity.com/products/drozer/
16
Static Analysis of the apk
drozer - mwrinfosecurity.com/products/drozer/ cd app.package run info -a com.android.system.admin run attacksurface com.android.system.admin run manifest com.android.system.admin # More interestingly: run launchintent com.android.system.admin tells us that the launcher activity for this package com.android.system.admin.CCOIoll
17

Static Analysis of the apk
# Now if we wanted to manually launch this activity we can do so via: dz#app.activity> run start --component com.android.system.admin com.android.system.admin.CCOIoll
18
Static Analysis of the apk
# if we want to use the sdk tools only we can start this activity as: mobisec@Mobisec:~$ adb shell am start -a \ android.intent.category.LAUNCHER -n com.android.system.admin/.CCOIoll
19

Nothing happens on screen even by launching manually
20
Dynamic Analysis via Debugger
21

Debugging
photo from http://developer.android.com/tools/debugging/index.html
22
Debugging
 On mobisec: /opt/mobisec/devtools/android-sdk/tools/monitor
 Emulator side: devtools  Development Settings  Debug app wait for debugger
23

Debugging
mobisec@Mobisec:~$ jdb -attach localhost:8700  break on application entry point (using .jdbrc)  stop in com.android.system.admin.COcCccl.onCreate  trace go methods
 gives you entry / exit log
24
Debugging (caveat)
 last method entered  com.android.system.admin.COcCccl.onCreate
 app terminates  Following are excluded from trace by default
 "exclude"  configurable  java.*,javax.*,sun.*,com.sun.*
25

Debugging
 exit method not seen because of "exclude"  explicit breakpoint on  stop in java.lang.System.exit(int) Breakpoint hit: "thread=<1> main", java.lang.System.exit(), [1] java.lang.System.exit (System.java:181), pc = 0 [2] com.android.system.admin.COcCccl.onCreate (null), pc = 1,041
26

APK / Installer

Manifest file

Code / Classe.dex

27

Dex
Reference
http://www.strazzere.com/papers/DexEducation-PracticingSafeDex.pdf
28
Dex (Options ...)
 Dex  java jar  java decompiler  commercial decompiler like JEB
 www.android-decompiler.com  dex  IDA pro  work with smali - code.google.com/p/smali
 apktool - code.google.com/p/android-apktool/
29

Debugging at smali source level
 apktool version 2, supports this.
 java -jar apktool-cli-2.0.0-Beta5.jar d -d -o \ decompiled_with_apktool_2_with_debug \ d:\OBad\E1064BFD836E4C895B569B2DE4700284.apk
This will give you (among other things) java source files with smali code, e.g.
you will find COcCccl.java in decompiled_with_apktool_2_with_debug\smali\com\android\syst em\admin
30
Debugging at smali source level
code for onCreate you would see it as:
a=0;// # virtual methods a=0;// .method public onCreate()V a=0;// .locals 10 a=0;// a=0;// invoke-super {p0}, Landroid/app/Application;>onCreate()V a=0;// a=0;// invoke-direct {p0}, Lcom/android/system/admin/COcCccl;>oIOccOcl()Z
31

Debugging at smali source level
code for onCreate you would see it as contd... a=0;// move-result v0 a=0;// a=0;// #v0=(Boolean); a=0;// if-eqz v0, :cond_0 a=0;// a=0;// const/4 v0, 0x1 a=0;// a=0;// #v0=(One); a=0;// invoke-static {v0}, Ljava/lang/System;->exit(I)V
32
Repackaging into an apk
 verify the manifest file
 aapt p --debug-mode -M \ d:\decompiled_with_apktool_2_with_debug\AndroidMan ifest.xml
 refer to specs to resolve errors developer.android.com/guide/topics/manifest/manifestintro.html
33

Repackaging into an apk contd ...
D:\apktool_2\Apktool\brut.apktool\apktool-cli\build\libs>java -jar apktool-cli-2.0.0-Beta5.jar b -d -o E1064BFD836E4C895B569B2DE4700284_rebuilt_with_ap ktool_2_with_debug.apk d:\OBad\decompiled_with_apktool_2_with_debug  signing your apk - you can read the details on android
developer site, some reference commands below
34
Repackaging into an apk contd ...
 creating keystore D:\>"c:\Program Files\Java\jdk1.7.0_07\bin\keytool.exe" genkeypair -validity 10000 -dname "CN=IBM-XF,C=CA" keystore d:\downloads\MYKEYSTORE.keystore -storepass <keyPass> -keypass <Pass> -alias myXFKey -sigalg MD5withRSA -keyalg RSA -keysize 1024 -v
35

Repackaging into an apk contd ...
 signing apk D:\>"c:\Program Files\Java\jdk1.7.0_07\bin\jarsigner.exe" keystore d:\downloads\MYKEYSTORE.keystore -storepass <keyPass> -keypass <Pass> -digestalg SHA1 -sigalg MD5withRSA -verbose -certs E1_rebuilt_apktool_2_dbg.apk myXFKey
36
Repackaging into an apk contd ...
 zipalign - for optimization D:\>zipalign -v 4 "d:\E1064BFD836E4C895B569B2DE4700284_rebuilt_with _apktool_2_with_debug.apk" "d:\E1_rebuilt_with_apktool_2_with_debug_aligned.apk"
 verifying jar signature D:\>"c:\Program Files\Java\jdk1.7.0_07\bin\jarsigner.exe" verify -verbose -certs E1_rebuilt_apktool_2_dbg_aligned.apk
37

Debugging at smali source level
use /home/mobisec/Malware/OBAD/decompiled_with_apktool_ 2_with_debug/smali/
Breakpoint hit: "thread=<1> main", java.lang.System.exit(), line=181 bci=0
<1> main[1] wherei [1] java.lang.System.exit (System.java:181), pc = 0 [2] com.android.system.admin.COcCccl.onCreate (COcCccl.java:5,758), pc = 1,041
38
Debugging at smali source level (contd..)
# change frames, list source code, and examine variables <1> main[1] up <1> main[2] list 5,754 a=0;// 5,755 a=0;// const/4 v0, 0x0 5,756 a=0;// 5,757 a=0;// #v0=(Null); 5,758 => a=0;// invoke-static {v0}, Ljava/lang/System;->exit(I)V 5,759 a=0;// 5,760 a=0;// :cond_4 5,761 a=0;// #v0=(Boolean);
39

Debugging at smali source level (contd..)
Lcom/android/system/admin/COcCccl;>oCIlCll:Landroid/content/Context; 5,763 a=0;// <1> main[2] locals Method arguments: Local variables: v9 = "dmBt" v8 = instance of android.os.PowerManager(id=830019453032) v2 = instance of byte[3] (id=830019585672) v3 = "6311450ddea7b49349a92eeda1d528a5" v1 = "sdk"
40

Debugging at smali source level (contd..)

a=0;// #v1=(Reference,Ljava/lang/String;);

a=0;// invoke-virtual {v0, v1}, Ljava/lang/String;-

>equals(Ljava/lang/Object;)Z //v0

a=0;// move-result v0

a=0;// #v0=(Boolean);

Conditional jump?

a=0;// if-eqz v0, :cond_4

a=0;//

a=0;// const/4 v0, 0x0

a=0;// #v0=(Null);

a=0;// invoke-static {v0}, Ljava/lang/System;->exit(I)V

41

IDA Pro
Can disassemble dex files
42
IDA Pro
43

Exit if v0 equals v1, v1 comes from deobfuscating string
44
v0 - deobfuscation + reflection
Obfuscation
Reflection
45

Finding all reflection calls
use <source path> monitor print this monitor locals monitor where monitor suspend monitor cont monitor resume stop in java.lang.Class.getDeclaredField(java.lang.String) stop in java.lang.Class.getDeclaredMethod(java.lang.String,java.lang.Cl ass[])
46
Finding all reflection calls
stop in java.lang.Class.getField(java.lang.String) stop in java.lang.reflect.AccessibleObject.setAccessible(boolean) stop in java.lang.Runtime.exec(java.lang.String) stop in java.lang.Runtime.exec(java.lang.String[]) stop in java.lang.System.exit(int)
 you can also try stopping in all forms of exec call stop in java.lang.Runtime.exec(java.lang.String) stop in java.lang.Runtime.exec(java.lang.String[])
47

Finding all reflection calls
# fields accessed grep -E "name|this" \ OBAD_Reflection_Related_Code_Entries_Params_ST.txt
<1> main[1] this = "class android.app.ActivityManager$RunningAppProcessInfo" name = "processName" ... this = "class android.os.Build" name = "BRAND" <1> main[1] this = "class android.os.Build" name = "DEVICE"
48

Finding all reflection calls

# code places where os/dev specific fields were accessed D:\>grep -E "name| \[1\]| \[2]" OBAD_Reflection_Related_Code_Entries_Params_ST.txt

...

name = "MODEL"

[1] java.lang.Class.getField (Class.java:782)

[2] com.android.system.admin.COcCccl.onCreate

(COcCccl.java:5,683)

...

This was the reflection for

the exit we are investigating

49

Emulator Detection
various properties - adb shell get prop compare the output with an actual device
50
Defeating Emulator Detection
 Modify the smali code fortiguard.com/sites/default/files/insomnidroid.pdf by @cryptax
 github.com/poliva/ldpreloadhook by @timstrazz  Hack AOSP code
51

Hacking AOSP code
source.android.com/source/index.html
zashraf@ubuntu-10-x64:~/Android/src_4.3_r3$ diff ./frameworks/base/core/java/android/os/Build.java.modified ./frameworks/base/core/java/android/os/Build.java.orig < import android.util.Log; < public static String getString(String property) { < String p = SystemProperties.get(property, UNKNOWN); < Log.i("XF_IBM", "getString called for "+ property +" returning :" + p ); < if (!property.equals("ro.product.model") && !p.equals("sdk")) < { < p = "Galaxy Nexus"; < Log.i("XF_IBM", " Hooking return of SDK"); < }
52
Hacking AOSP code
< if (!property.equals("ro.product.name") && !p.equals("sdk")) < { < p = "yakju"; < Log.i("XF_IBM", " Hooking return of SDK") ; < } < return p; --> private static String getString(String property) { > return SystemProperties.get(property, UNKNOWN);
53

Hacking AOSP code
target "aosp_arm-eng" compile and obtained a fresh system.img file in out/target/product/generic/
54
Hacking AOSP code
Creating a new AVD for emulator to run the custom built system.img Create copies of android-18 in system-images and platforms sub directories under your sdk root direcotry. (I named the copies android-18_customized)+ Copy over the newly build system.img under the system-images folder (for my mobisec default config it was /opt/mobisec/devtools/android-sdk/system-images/android18_customized/armeabi-v7)
55

Hacking AOSP code
* Make the following edits: * in platform subdirectory diff -r android-18/source.properties android18_customized/source.properties 8c8 < Platform.Version=4.3 --> Platform.Version=4.3_Custom 14c14 < AndroidVersion.ApiLevel=18 --> AndroidVersion.ApiLevel=18_custom
56
Hacking AOSP code
* Make the following edits too: in system-images: diff -r android-18/source.properties android18_customized/source.properties 8c8 < Platform.Version=4.3 --> Platform.Version=4.3_Custom 14c14 < AndroidVersion.ApiLevel=18 --> AndroidVersion.ApiLevel=18_custom
57

Hacking AOSP code
emulator-arm -avd Nexus_4_on_4.3_abi_18 -scale 0.75 debug all -logcat all -no-boot-anim
58
The persistent begging starts
59

60
Sales / Marketing
Won't take No for an answer
61

62
Let's launch the app now
63

No launcher
64
No Device Admin?
65

We would expect something like this
66
Can we see OBAD in app list and uninstall it?
67

Let's try the command line
mobisec@Mobisec-VM:~/Malware/OBAD$ adb uninstall com.android.system.admin Failure mobisec@Mobisec-VM:~/Malware/OBAD$ adb logcat -d -b main -b events | grep admin | tail -1 W/PackageManager( 277): Not removing package com.android.system.admin: has active device admin
May be from command line - `adb'
68
Back to debugging
69

Hey! you are slowing us down
70
ACTIVITY NOT RESPONDING (ANR)
W/ActivityManager( 291): Timeout executing service: ServiceRecord{421b03d8 u0 com.android.system.admin/.MainService} ... W/ActivityManager( 291): Killing ProcessRecord{421b77a0 1129:com.android.system.admin/u0a10053}: background ANR
71

Let's Patch (1 of 2)

./frameworks/base/services/java/com/android/server/am/ActiveServices.java

< if (!proc.debugging)

<

mAm.appNotResponding(proc, null, null, false, anrMessage);

< else

<

Slog.w(TAG, "prevented ANR on debuggee app - Hijacked ANR

appnotresponding call for debugged app");

<

---

> mAm.appNotResponding(proc, null, null, false, anrMessage);

72

Let's Patch (1 of 2)

./frameworks/base/services/java/com/android/server/am/ActiveServices

.java

< if (!proc.debugging)

<

mAm.appNotResponding(proc, null, null, false, anrMessage);

< else

<

Slog.w(TAG, "prevented ANR on debuggee app - Hijacked ANR

appnotresponding call for debugged app");

<

---

> mAm.appNotResponding(proc, null, null, false, anrMessage);

73

Let's Patch (2 of 2)
~/Android/src_4.3_r3/frameworks/base/services/java/com/androi d/server/am/BroadcastQueue.java

< if (!app.debugging)

<

mHandler.post(new AppNotResponding(app,

anrMessage));

< else

<

Slog.w(TAG, "prevented ANR on (broadcast) debuggee

app - Hijacked ANR appnotresponding call for debugged app");

---

> mHandler.post(new AppNotResponding(app,

anrMessage));
74

Tracing (incl Reflection) but avoiding other java code
exclude android.os.*,org.apache.*,java.lang.D*,java.lang.N*,java.lang.P*,j ava.lang.U*,java.lang.F*,java.lang.Ru*,java.lang.E*,java.lang.T*,j ava.lang.V*,java.lang.I*,java.lang.A*,java.lang.S*,java.lang.B*,jav a.lang.ref.*,java.lang.C*,java.lang.O*,java.lang.S*,java.lang.V*,ja vax.*,sun.*,com.sun.*,java.s*,java.u*,java.s*,java.n*,java.i*,java.l ang.reflect.A*,java.lang.reflect.C*,java.lang.reflect.F*,java.lang.re flect.Method.g*,java.lang.reflect.Method.<*

75

Launcher Hider
Breakpoint hit: "thread=<1> main",
android.app.ApplicationPackageManager.setComponentEn abledSetting
<1> main[1] wherei [1]
android.app.ApplicationPackageManager.setComponentEnabledSettin g (ApplicationPackageManager.java:1,262), pc = 0 ...
[3] java.lang.reflect.Method.invoke (Method.java:525), pc = 17 [4] com.android.system.admin.cCoIOIOo.ollIIIc (null), pc = 748
76
Launcher Hider
Breakpoint hit: "thread=<1> main",
<1> main[1] locals Method arguments: componentName = instance of android.content.ComponentName(id=830033869864) Local variables: newState = 2 flags = 1
<1> main[1] print componentName componentName = "ComponentInfo{com.android.system.admin/com.android.s ystem.admin.cCoIOIOo}"
77

Let's hunt the code that hides it from Device Admin List
78
Checkout the patch history ... or ...
79

Find Relevant Code
Launch Settings -> Security -> Device Administrators Check out the logs: adb logcat -d -b events
I/am_new_intent( 276): [0,1106566944,17,com.android.settings/.Settings,android.intent.action. MAIN,NULL,NULL,274726912] I/am_resume_activity( 276): [0,1106900904,17,com.android.settings/.Settings] I/am_on_resume_called( 1118): [0,com.android.settings.Settings]
80
Find Relevant Code (contd...)
search for these strings at androidxref.com
following along you will arrive at packages/apps/Settings/src/com/android/settings/ DeviceAdminSettings.java
81

Find Relevant Code (contd...)
check out the function
void updateList()
and the conditions for something to appear in device admin list
82
Device Admin Vulnerability
getActivity().getPackageManager().queryBroadcastReceive
rs(Intent(DeviceAdminReceiver.ACTION_DEVICE _ADMIN_ENABLED), ...
83

Device Admin Vulnerability
getActivity().getPackageManager().queryBroadcastReceive
rs(Intent(DeviceAdminReceiver.ACTION_DEVICE _ADMIN_ENABLED), ...
84
Hackers won't follow the specs unless they have to
85

What they should do
To use the Device Administration API, the application's manifest must include the following: A subclass of DeviceAdminReceiver that includes the following: oThe BIND_DEVICE_ADMIN permission. oThe ability to respond to the ACTION_DEVICE_ADMIN_ENABLED intent, expressed in the manifest as an intent filter.
86
What they actually did
<receiver "System" =".OCllCoO"> <meta-data "android.app.device_admin"
="@2130968576"> </meta-data> <intent-filter> <action
name="com.strain.admin.DEVICE_ADMIN_ENABLED">
</action> </intent-filter> </receiver>
87

What they actually did
instead of android.app.action.DEVICE_ADMIN_ENABLED
name="com.strain.admin.DEVICE_ADMIN_ENABLED">
88
What's next
89

Device Admin Vulnerability
services/java/com/android/server/ DevicePolicyManagerService.java
90
Device Admin Vulnerability
When adding an Admin policy.mAdminMap.put(adminReceiver, newAdmin); and policy.mAdminList.add(newAdmin);
91

Please make sure you take ALL your stuff with you
92
Device Admin Vulnerability
removeActiveAdminLocked 1.policy.mAdminList.remove(admin); 2.policy.mAdminMap.remove(adminReceiver);
93

ALL THE TIME! even when in RUSH
Please make sure you take ALL your stuff with you
94
Device Admin Vulnerability
private void handlePackagesChanged(int userHandle) { removed = true; policy.mAdminList.remove(i);
95

Device Admin Vulnerability
private void handlePackagesChanged(int userHandle) { removed = true; policy.mAdminList.remove(i);
and who will clean up the mAdminMap for you
96
Device Admin Vulnerability
This code path gets executed when you DISABLE the device admin component
97

Device Admin Vulnerability
All we have so far is a leak / bad coding practice
98
Device Admin Vulnerability
Is this a vulnerability?
99

Device Admin Vulnerability
Is there a code path that consults mAdminMap but not mAdminList ?
100
Device Admin Vulnerability
getActiveAdminUncheckedLocked  getActiveAdminForCallerLocked
(ComponentName who, int reqPolicy) with "who" parameter being non null
101

Device Admin Vulnerability
getActiveAdminUncheckedLocked is used by isAdminActive
102
Device Admin Vulnerability
So can we exploit it?
103

104
Gartner:
DID YOU KNOW? By 2016, 20% of enterprise BYOD programs will fail due to deployment of mobile device management (MDM) measures that are too restrictive.
105

How about typing a 14 character password while driving?
106
Exploiting the Device Admin Vulnerability
enable device admin disable the device admin component At this point, from the data structure and code
perspective, device admin's isAdminEnabled will still return true
107

Exploiting the Device Admin Vulnerability
pm.setComponentEnabledSetting( this.getWho(context),
PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP);
108
Exploiting the Device Admin Vulnerability
Uninstall the app (it will still be in the mAdminMap)
109

Exploiting the Device Admin Vulnerability
Now, install the original app
110
111

BUT
112
113

BUT it may not necessarily work with MDM
114
115

isActivePasswordSufficient
116
isActivePasswordSufficient
public boolean isActivePasswordSufficient(int userHandle) {
enforceCrossUserPermission(userHandle); synchronized (this) {
// This API can only be called by an active device admin,
DevicePolicyData policy = getUserData(userHandle); // so try to retrieve it to check that the caller is one. getActiveAdminForCallerLocked(null,
DeviceAdminInfo.USES_POLICY_LIMIT_PASSWORD);
117

getActiveAdminForCallerLocked
ActiveAdmin getActiveAdminForCallerLocked (ComponentName who, int reqPolicy) throws SecurityException { if (who != null) { ... } else { final int N = policy.mAdminList.size();
118
getActiveAdminForCallerLocked
else { final int N = policy.mAdminList.size(); for (int i=0; i<N; i++) { ActiveAdmin admin = policy.mAdminList.get(i); if (admin.getUid() == callingUid && admin.info.usesPolicy(reqPolicy)) { return admin; } } throw new SecurityException
119

getActiveAdminForCallerLocked
else { final int N = policy.mAdminList.size(); for (int i=0; i<N; i++) { ActiveAdmin admin = policy.mAdminList.get(i); if (admin.getUid() == callingUid && admin.info.usesPolicy(reqPolicy)) { return admin; } } throw new SecurityException
120
There is a way
121

sharedUID
active device admin with same policies and same UID - sharedUID
if (admin.getUid() == callingUid && admin.info.usesPolicy(reqPolicy)) {
122
Extended Hack
Modify AndroidManifest.xml of the MDM -add android:sharedUserId attribute repackage and self sign
123

Extended Hack
Create a different device admin -same sharedUid -same policies -install and activate it
124
Extended Hack
Do everything else as before -but using the self signed MDM apk with sharedUID
125

126
COMPLIANT != SECURE
127

128
Lessons
Don't make it really painful to use the device code protection verifying app signatures
129

Further Learning
 https://github.com/strazzere/android-unpacker  https://github.com/strazzere/android-
unpacker/blob/master/AHPL0.pdf
130
First to The Creator
131

Loved ones, X-Force & MIRCon and YOU
132
Questions?
@zashraf1337 securityintelligence.com/author/zubair-ashraf ca.linkedin.com/in/zubairashraf
133

