SESSION ID: MBS-R09
Challenges in Android Supply Chain Analysis
Lukasz Siewierski (@maldr0id)
Reverse Engineer, Android Security (Google)
#RSAC

#RSAC
Agenda
· What does an Android device and system updates go through before its first public sale?
· What are technical challenges in analysing Android system images?
· Case studies
2

#RSAC
The journey of an Android device

#RSAC
The journey of an Android device
4

#RSAC
Approval process for Android devices

CTS (Compatibility Test Suite)

Ensuring compatibility with AOSP

Requirements for any devices that want to
GTS (GMS Requirements Test Suite) license Google apps

VTS (Vendor Test Suite) STS (Security Test Suite)

Compatibility with the Hardware Abstraction Layer (HAL)
Checks if security patches have been applied correctly

BTS (Build Test Suite)

Security review for malware and other harmful behaviors in binaries / framework

5

#RSAC
Android Compatibility Definition Document
List of requirements that must be met in order for devices to be compatible with the latest version of Android.
For example section 9 deals with "Security Model Compatibility" and contains subsections relating to: · Permissions · Premium SMS warning · Security Features (e.g. SELinux) · Data Storage Encryption · Automotive Vehicle System Isolation
6

#RSAC
Android system image analysis challenges

#RSAC
Case study #1
Device monitoring and dynamic analysis challenges

#RSAC
It started with an application

<receiver android:name="com.[redacted].receiver.AppMonitorReceiver"> <intent-filter> <action android:name="com.[redacted].appmonitor.app_onCreate"/> <action android:name="com.[redacted].appmonitor.app_onResume"/> <action android:name="com.[redacted].appmonitor.load_url"/> </intent-filter>
</receiver>

Odd intent names?

public void onReceive(android.content.Context context, android.content.Intent intent) { String action = intent.getAction(); if (action.equals(this.load_url_intent)) { addsURLAndPackNameToDatabase(context, intent);
}

public void addsURLAndPackNameToDatabase(android.content.Context context, android.content.Intent intent) {

Expects two extra fields

String url = intent.getStringExtra("url"); String packname = intent.getStringExtra("packname");

Adds data to the database

addURLInfoToDatabase(context, url, packname);

}

9

Additional (unused) method in the AOSP Activity class
private void sendNewAppBroadcast() { String lastpkg = System.getString(this.getContentResolver(), "lastpkg"); String curpkg = this.mActivityInfo.applicationInfo.packageName; if(lastpkg == null || !lastpkg.equals(curpkg)) { Intent it = new Intent(); it.setAction("com.[redacted].app_onResume"); it.putExtra("packname", curpkg); this.sendBroadcast(it); }
}
10

#RSAC

#RSAC
Additional (used) method in the AOSP WebView class

public void loadUrl(String url) { this.checkThread(); Log.d("WebView", "loadUrl=" + url); this.mProvider.loadUrl(url); Application initialApplication = AppGlobals.getInitialApplication(); if(initialApplication != null && (URLUtil.isNetworkUrl(url))) { Intent it = new Intent(); it.setAction("com.[redacted].load_url"); it.putExtra("url", url); it.putExtra("packname", initialApplication.getPackageName()); initialApplication.getApplicationContext().sendBroadcast(it); }
}
11

Regular code Appended code

#RSAC
We worked with the OEM to provide a system update which removes the additional code.
To protect users before they get the system update, the app that gathers information is disabled by Play Protect.

#RSAC
Dynamic analysis - challenges
· The apps need specific AOSP modifications in order to work · The apps need specific devices / drivers in order to work · The apps that you're trying to install are already on the device
(see below)
$ adb install com.android.systemui.apk adb: failed to install com.android.systemui.apk: Failure [INSTALL_FAILED_VERSION_DOWNGRADE]
$ adb install com.android.systemui.apk Failure [INSTALL_FAILED_OLDER_SDK]
$ adb install com.android.systemui.apk adb: failed to install com.android.systemui.apk: Failure [INSTALL_FAILED_UPDATE_INCOMPATIBLE: Package com.android.systemui signatures do not match the previously installed version; ignoring!]
13

#RSAC
Is there a way to make dynamic analysis work?
You have to use some of the same methods OEMs use: · Have your own modified Android image on the emulator · Sign apps with your own "platform" key · Install them in /system by moving the APK files to the /system
partition
However, if the Android framework is modified you don't have enough luck and you have to resort to static analysis, which leads us to...
14

#RSAC
Case study #2
Triada and the complexity of static analysis

Triada history
Triada rooting Trojan was first described by Kaspersky in March 2016

#RSAC

System level backdoor in summer 2017 (described by Dr Web in July 2017)
Since then we worked with the OEMs to remove Triada from all the devices, both old and new

This double XOR loop with two ASCII-printable passwords is one of the defining characteristic of Triada

Triada, from the early rooting trojan days was investing heavily in code injection and the system-level backdoor pushed it even further...

Backdooring the AOSP log function

Triada backdoored the log function to perform code injects

This line of code was added

Code was injected to com.android.systemui in order to have the GET_REAL_TASKS permission Code was also injected to com.android.vending to allow for these operations:

1.  2.  3.  4.  5.  6.  7.  8.  9.  10. 

1. download request 2. download result 3. install request (uses real, unpopular Google Play package names) 4. installation result 5. activation request 6. activation result 7. pull request 8. pull the results 9. uninstall request 10. uninstall result

17

#RSAC

Complex communication mechanisms

Play

C&C

Code injection

System UI Code injection

socket intent

#RSAC
C&C
Installed app

Java properties Framework backdoor
18

Log lines

#RSAC
We worked with all the affected OEMs to provide system updates which remove Triada.

#RSAC
Aside: how did it get on the device?
OEM (the company that sells the device)

sends a whole system image

sends back the system image... ... not mentioning Triada

3rd party vendors 3rd party vendors
(provide a3d3drriddtipopnaaratlryftevyaetnuvdreeosnr)sdors
(provide additional features) (provide additional features)
(companies that provide additional features)
20

adds additional features to the system image...
... including Triada

#RSAC
How to make static analysis work?
 Take a look at the whole system image (including binaries, services and non-standard file objects)
 Take a look at the framework files - they may have additional code
 Try to understand the ecosystem of a system image holistically which process interacts with which app and what are the SELinux rules, which brings us to...
21

#RSAC
Case study #3
App update framework and sometimes things aren't what they seem

App update framework
Binary running as root on the system image in the /bin directory
Executes in several stages (original naming): 0. check system directory 1. check debug status 2. check if rooted 3. register signal handler and do miscellaneous work 4. create communicate fifo 5. check main imei status 6. check dual sim status 7. add predefined system task 8. enter main loop
23

#RSAC
/data/[redacted]/fifo_in binary
/data/[redacted]/fifo_out

#RSAC
Two ways to pass the commands

Passed through the fifo_in file:
 run the argument as a shell script  kill a specific process by name or pid  execute arguments as a command  prints arguments to fifo_out  downloads a file

Passed as an argument:  remount the /system partition as rw  download a shell script file from the C&C and
executes it  upload any file to the remote server  print the version of the binary  execute a binary given as an argument

24

Dialer app creates commands
public static boolean handleCode(android.content.Context context, String code) { String command = 0; if (code.equals("*#9381#*")) { command = "#update{-g} [...] -upc\n"; } if (code.equals("*#9382#*")) { command = "#update{-g} [...] -upi\n"; }
... java.io.File fifo_in = new java.io.File("/data/[redacted]/fifo_in"); java.io.FileOutputStream task_pool = new java.io.FileOutputStream(fifo_in); byte[] to_write = command.getBytes(); task_pool.write(to_write, 0, to_write.length); task_pool.flush(); task_pool.close(); return true; } 25

#RSAC

#RSAC
... but it cannot be abused
Untrusted app cannot write into the fifo_in file due to SELinux

09-05 13:54:33.737 14164 14164 W com.[app_name]: type=1400 audit(0.0:249): avc: denied { write } for comm=77726974657220746872656164 name="fifo_in" dev="mmcblk0p20" ino=202404_JL.ver.0A.0a.11scontext=u:r:untrusted_app:s0:c512,c768 tcontext=u:object_r:[...]data_file:s0 tclass=fifo_file permissive=0

And the binary drops privileges...
if ( calling_uid ) {
printf("set uid to %d\n", calling_uid); setuid(calling_uid); }

if ( calling_gid ) {
printf("set gid to %d\n", calling_gid); setgid(calling_gid); }

26

#RSAC
We worked with the OEM to audit their security configurations and make sure it cannot be abused.

#RSAC
Can build fingerprint by itself be used to identify a device?
All of these build fingerprints are for non-CTS, non-Samsung devices
28

#RSAC
Are all the apps on /system preinstalled?
Rooting trojans can remount the /system partition and move there to avoid uninstallation.
Although Verified Boot prevents it on newer Android devices.
29

#RSAC
Summary

#RSAC
Summary: preinstalled statistics for 2019

2.5+
billion

devices protected

3+
million

preinstalled applications
scanned

31

50+ system images
thousand scanned

#RSAC
Researchers:
· We need more researchers working in the preinstalled app space.
· Understanding a few key differences when analyzing pre-installed apps versus user-space apps can help your analysis be more efficient.
· The Android ecosystem is vast with a diversity of OEMs & their customizations. This comes with new and exciting features for users, but also new and exciting challenges for security researchers.
32

#RSAC
Everyone else:
· Build Test Suite is used to scan all the system images for any preinstalled malware, including system image updates
· We are also using in-the-wild monitoring to find new malware, including preinstalled ones
· Google Play Protect alerts the user of any malware and removes or disables them
· We are also working with the OEMs to provide system updates which remove preinstalled malware
· Take a look at the Android Enterprise website at android.com/enterprise
33

#RSAC
Thank you!

