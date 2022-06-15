Android

http://weibo.com/fattestmonkey
2013.1.12


 AndroidAPK  
 Apk unpackaging  Decompiling  Resource and code manipulation  Repackaging and signing
 Case study ­ geinimi 
 

Android
·Java in SDK Coding ·C/CPP in NDK
·Compiling to Dalvik (DEX-Files)
Compiling
·Packaging as signed APK
packaging

APK
APK ZIP
assets META-INF
Manifest.mf Cert.rsa Cert.sf
res AndroidManifest.xml classes.dex resources.arsc



APKTool d

manipulati

APK

APKTool b

SMALI

on

Classes.dex

dex2 jar

Classes.jar Jd-gui

java



unpackaging
 apktool  Apktool d <file.apk> [<dstdir>]

Resource and code manipulation

   

sdxml apk smail 

smali
new-instance v5, Ljava/lang/String; const/4 v6, 0x0 invoke-direct {v5, v3, v6, v4}, Ljava/lang/String;><init>([BII)V v3 = 0x1fa3 v3 = v5.equals(v3); const-string v3, "hello"->"" invoke-virtual {v5, v3}, Ljava/lang/String;>equals(Ljava/lang/Object;)Z move-result v3

AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.netease.is.helloandroid" android:versionCode="1" android:versionName="1.0" > <uses-sdk android:minSdkVersion="8" android:targetSdkVersion="15" /> <application android:icon="@drawable/ic_launcher" android:label="@string/app_name" android:theme="@style/AppTheme" > <activity android:name=".MainActivity" -> another activity android:label="@string/title_activity_main" > <intent-filter> <action android:name="android.intent.action.MAIN" /> <category android:name="android.intent.category.LAUNCHER" /> </intent-filter> </activity> </application>
</manifest>

Repackaging
 apktool  Apktool b <srcdir>

signing with certification
 keytooljarsigner
 autosign


         

Case study Geinimi 


 File: MonkeyJump2.apk  Md5:
e0106a0f1e687834ad3c91e599ace1be  Sha1:
179e1c69ceaf2a98fdca1817a3f3f1fa2823 6b13

AndroidManifest.xml 

AndroidManifest.xml 


   client.smali
   server.smali




 dsms  smsrecord  call  showurl  install:// and install - Download an APK ; trigger installation  updateHost ­ Updates the server list with a new list supplied by the
server.  changeFrequency ­ Changes the frequency preference for checking into
the server.  skipTime ­ Controls the delay between command execution.  applist ­ Delivers a list of installed applications to the server.  contactlist ­ Dumps contact information including display name, last
access time, and phone number about all device contacts to the server.


  ­ 
  .so     ProGuard
  ­ 
   
  ­ 

 
         




 Apktool  Smali/baksmali  Dex2jar  jd-gui  sqlitebrowser


       


 Dalvik Debug Monitor ­ Android SDK  DroidBox ­ Application sandbox  TaintDroid ­ Application sandbox  Android Reverse Engineering (A.R.E.)
Virtual Machine  Network traffic
 WireShark  Tcpdump  Shark for Root


 
 http://aq.163.com
 
 http://weibo.com/163security

