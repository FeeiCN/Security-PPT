Android 
360 

 - 
LinuxUIDGID

user

Process

File

 - 

 - 

Permission

Android Runtime

UID/GID

Linux Kernel

 - 
Permission

 - 
APK

signature

permission

 - 
Master Key
1. APP 2.APPandroid:sharedUserId  android.uid.systemUID 3. root

 - 
Android Runtime
AndroidAPKLinuxUID AndroidPermissionLinuxGID AndroidSignatureAPKUIDGID

APP

APP





 

IPC 



HTTPS SQLlite Action Activity

WebView Intent Broadcast



APP 
APP

APP 
AndroidManifest.xml intent()

APP 
drozeradb shell

APP 
drozercontent provider

APP 
app

APP 


APP 
IntentIPC&

APP 
smail & java & dex 

APP 
web

APP 
· HOOK - ,HOOK · DEBUG ­  · Reverse ­

APP 
HOOK 

APP 
HOOK APP X509TrustManager

APP 
· Smail Debug manifestandroid:debuggable="true",
$ apktool d -d -o out app.apk $ apktool b -d -o out
· Make any application debuggable HOOKdebugFlags
public ProcessStartResult start(final String processClass, final String niceName, int uid, int gid, int[] gids, int debugFlags, int mountExternal, int targetSdkVersion, String seInfo, String[] zygoteArgs) ...... if ((debugFlags & Zygote.DEBUG_ENABLE_DEBUGGER) != 0) { argsForZygote.add("--enabledebugger"); }
android.os.Process50x11)

APP 
./androgexf.py -i YOURAPP.apk -o YOURAPP.gexf APP

APP 
permission

APP 

APP 

APP 

final String url = getIntent().getStringExtra("url"); wSettings.setJavaScriptEnabled(false): if (!url.startsWith("file:")){
wSettings.setJavaScriptEnabled(true); }

JavaScript

final String url = getIntent().getStringExtra("url");
String loadUrl = "about:blank"; if (!url.startsWith("file:")) {
loadUrl = url }



APP 
build api level 

APP 
protobufamf3xmpp

APP 
APPlogcat

Thanks!

