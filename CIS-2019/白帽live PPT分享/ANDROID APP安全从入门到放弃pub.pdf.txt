

ANDROID APP
 

WHO AM I

CISPCISSPCISAWPMP
  Wechatunicotech


1 APP 2 APP 3 

1Part

APP

APP 



2019APP

APP

M1- M2- M3- M4-









M5-

M6- 

M7- 

M8-

M9-

M10- 

OWASP MOBILE TOP 10 2016

ANDROID 2018Android


YD/T 1438-2006  YD/T 2307-2011  JR/T 0092-2012 JR/T 0095-2012 NIST SP800-163 Vetting the Security of Mobile Applications OWASP

APP

2Part

APP

APP

 

 

 

 







APK

ANDROID

ANDROID





SSL

SQLite



 () 

Linux Kernel



AndroidManifest.xml

SDK

tools

platform-tools

build-tools

APKTOOL/Shakaapktool
https://ibotpeaches.github.io/Apktool/ http://www.rover12421.com/shakaapktool

   resources.arsc classes.dex9.png XML
  APK / JAR
  APK

smali/baksmali https://bitbucket.org/JesusFreke/smali/

 dex2jar/enjarify
https://github.com/pxb1988/dex2jar/ https://github.com/Storyyeller/enjarify

 JD-GUI http://java-decompiler.github.io/

JADX https://github.com/skylot/jadx/

 JEB https://www.pnfsoftware.com/

 Android Killer

 smalidea/Android Studio

 IDA Pro

 Xposed
https://repo.xposed.info/


http://www.cydiasubstrate.com/
Demohttps://github.com/zencodex/cydia-android-hook http://www.cydiasubstrate.com/id/20cf4700-6379-4a14-9bc2-853fde8cc9d1 SDKhttp://asdk.cydiasubstrate.com/zips/cydia_substrate-r2.zip

 FRIDA
https://www.frida.re/

 DROZER
https://labs.f-secure.com/tools/drozer/

DVM vs JVM



.java

javac

smali2java
.smali

smali baksmali

.class
dx
.dex

smali

v  v0
...
vM-N ...
vM-1

p 



v0

 

...

 

p0

 

... 

pN-1 N

JNI NATIVE

JNI Native

arm

ARM
     

arm


 ARM  Thumb

 USR  SYS  FIQ  IRQ  SVC  ABT  UND

IDA
 1.IDAdbgsrv/android_server 2.adb forward tcp:pc_port tcp:mobile_port

IDA
3 adb shell am start ­D ­n PackageName/ActivityName 4IDADebugger->Attach to Process



  Interpretation mode probe modeJITjust-in-time mode
   

Frida

Hook

Firda
device = frida.get_usb_device() device.on('spawn-added',spawn_added)
Firdahook

Java.perform(function x(){ var AMapLocation = Java.use("com.amap.api.location.AMapLocation"); AMapLocation.getLatitude.implementation = function(){ result = this.getLatitude(); console.log("AMapLocation getLatitude:"+result); console.log(printStack()); return result;
};

def spawn_added(spawn): if spawn.identifier.startswith("com.shtec.test"):

Hook

print('spawn_added:', spawn) hook(device,spawn.pid,"hook.js") device.resume(spawn.pid)

if(Java.available) { Java.perform(function(){ var application = Java.use("android.app.Application");

application.attach.overload('android.content.Context').implementation = function(context) {

var result = this.attach(context);

var classloader = context.getClassLoader(); // get classloader

Java.classFactory.loader = classloader;

Hook native

hook(); //hook return result;

Java.perform(function(){ var getString = undefined; exports = Module.enumerateExportsSync("libtest.so");

} }); }

for(i=0; i<exports.length; i++){

if(exports.name == "Java_com_example_hooktest_MainActivity_getString"){

getString = exports.address;

send("getInt is at " + getString);

break;

}

}

3 
Part



