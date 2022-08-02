2015--8 

¡  of Baidu X--TeamID neobyte
¡ webjavaandroid ...

Intent Intent Action/Component/Data PendingIntent parseUri
3

¡ AndroidjavaIPCIntent IPCAPP
§ APPAPP § ActivityServiceBroadcast § IntentActionComponent
Intent § IntentExtrasData


Action

Compo

Intent
... Data

Extras

¡ IntentappAPP Intent
¡ 
§ Webview JsInterface § SQL injection § Path Traversal § 

Action

Compo

Intent
... Data

Extras

 

¡ http://oasam.org/en/oasam/oasam--dv--data--validation/oasam--dv--007-- intent--injection
¡ If user's input is loaded in a dynamic manner in the Intent data, a malicious user could manipulate such data in order to execute code through it. In particular, the existence of dynamic data must be checked while including such data in an Intent, especially through the following Intent methods: addCategory(), setAction(), setClass(), setClassName(), setComponent(), setData() and setDataAndType().



App
Intent

startService

Activity Service

Receiver

¡ Intent
§ 
§ 
¡ 
§ APPIntent Intent
§ SystemAPPIntent IPC launchAnyWhere, BroadcastAnyWhere

¡ Intent
§  § 
¡ 
§ JSintent § intent

Intent
nintent nIntent ngetParcelable() nnew Intent(intent)
PendingIntent
npendingintent intentAPP 

Action/Compo/Data
nintent nAction nComponent nData
parseUri
n Intent.parseUriString Intent Intent

· java bytecode  · class
· 4.4.4class dex2jar3class

Intent Intent Action/Component/Data PendingIntent parseUri
11

¡ AccountManagerAPP intentactivityIPC
 http://blogs.360.cn/360mobile/2014/08/19/launchanywhere--google--bug-- 7699048/ 
¡ intent
android.accounts.AccountManager$AmsTask$Response.onResult(Bundle)

¡ Intentintentintent intentIPCàintent
¡ IntentBytecode
android.accounts.AccountManager$AmsTask$Response.onResult(Bundle)

¡ findbugsBytecodecheckcast castintent

¡ Android 4.4106Intentcheckcast intent launchAnywhere0day...

¡ ChooserActivityIntentAPPSystem ActivitylaunchAnywhere
¡ FrameworkActivity ChooserActivity com.android.internal.app.ChooserActivity (4.4.4

¡ activityintentEXTRA_INTENT EXTRA_INITIAL_INTENTSintentintent super.onCreate

¡ supercom.android.internal.app.ResolverActivity intent

¡ 20124.1 EXTRA_INTENTEXTRA_INITIAL_INTENTS EXTRA_INITIAL_INTENTSlaunchAnywhere
¡ https://android.googlesource.com/platform/frameworks/base/+/5320eb8 938098c9824093f7f842a0a97bbc190a4%5E%21/#F4

¡ launch...
¡ http://developer.android.com/guide/topics/manifest/activity-- element.html#multi
Whether an instance of the activity can be launched into the process of the component that started it -- "true" if it can be, and "false" if not. The default value is "false". Normally, a new instance of an activity is launched into the process of the application that defined it

¡ com.android.server.am.ActivityRecord ¡ com.android.server.am.PendingIntentRecord

¡ com.android.server.am.ActivityManagerService ¡ com.android.server.am.ActivityStackSupervisor

¡ com.android.server.am.ActivityStackSupervisor

¡ pendingintentChooserActivity systemlaunchintent

¡ system Activity Activity
¡ Demo
 

¡ 2014--09--15Android...
Thanks for the report. This issue was previously reported to us by another researcher. We're testing a fix for the next release of Android. We ask that you keep this issue confidential until our fix is released.
¡  com.android.internal.app.ResolverActivitystartActivityAsCaller
¡ Fix issue #14617210: Apps can gain access to any ContentProvider with grantUriPermissions (no user interaction required) https://android.googlesource.com/platform/frameworks/base/+/028ceeb 472801bcfa5844fc89ed0da8463098824

¡ https://android.googlesource.com/platform/frameworks/base/+/android-- 5.1.1_r8/packages/Shell/src/com/android/shell/BugreportWarningActivity.java

¡ https://android.googlesource.com/platform/packages/apps/Camera2/+/android-- 5.1.1_r8/src/com/android/camera/ProxyLauncher.java

¡ https://android.googlesource.com/platform/packages/apps/Settings/+/android-- 5.1.1_r8/src/com/android/settings/users/AppRestrictionsFragment.java

¡ https://android.googlesource.com/platform/packages/apps/Browser/+/android-- 5.1.1_r8/src/com/android/browser/widget/BookmarkWidgetProxy.java

Intent Intent Action/Component/Data PendingIntent parseUri
31

¡ Action/Component/Data Intent 
¡ intent 

Action

Compo

Intent
... Data

Extras

¡ curesecCVE--2013--6272
<4.4.2http://blog.curesec.com/article/blog/35.html
com.android.phone.PhoneGlobals$NotificationBroadcastReceiver

¡ java ¡ sourcebinder ¡ sink setAction(), setClass(), setClassName(), setComponent(), setData()
setDataAndType() ¡  ¡ >1k0dayJ

¡ WapPushManagerSQLIntent wappush
¡ 2014--10--112014--11--8
com.android.smspush.WapPushManager

¡ wappush sms ¡ SQLsettingscomponent

¡ 4.4.4POC
0891683108200105f04408a00156 08860104216092902512237B0605 040b8423f00A065603B081EAAF2 720756e696f6e2073656c65637420 302c27636f6d2e616e64726f6964 2e73657474696e6773272c27636f6 d2e616e64726f69642e736574746 96e67732e53657474696e6773272c 302c302c302d2d200002066A008 509036D6F62696C65746964696E 67732E636F6D2F0001

Intent Intent Action/Component/Data PendingIntent parseUri
37

¡ PendingIntent
§ Pending § intent § context
¡ Aintent BBA intent
¡ ABA contextintent
Bintent = intent

¡ PendingIntent android.content.Intent.fillin()

¡ 

§ BComponent

§ AIntentactionBaction
¡ AIntentcomponentactionB IntentBExtras A-->B-->Intent
pkg, data, type, categoryintent

Action

Intent

Extras

Compo

...

Data

 

¡ http://developer.android.com/reference/android/app/PendingIntent.html
By giving a PendingIntent to another application, you are granting it the right to perform the operation you have specified as if the other application was yourself (with the same permissions and identity). As such, you should be careful about how you build the PendingIntent: almost always, for example, the base Intent you supply should have the component name explicitly set to one of your own components, to ensure it is ultimately sent there and nowhere else.

¡ method
§ PendingIntentgetActivitygetBroadcastgetService createPendingResultgetActivities
§ methodIntentComponentintent setClasssetClassNamesetComponent
§ methodIntentactionintent  setAction
§ method putExtraPendingIntentintent

¡ Android 4.415235 0day...

¡ SettingsPendingIntent appsystemaction
¡ 2014--9--22014--9--10
com.android.settings.accounts.AddAccountSettings.addAccount(String)

¡  
¡   
¡  Demo   

¡ https://android.googlesource.com/platform/frameworks/base/+/android-- 5.1.1_r8/keystore/java/android/security/KeyChain.java

¡ https://android.googlesource.com/platform/frameworks/opt/telephony/+/android-- 5.1.1_r8/src/java/com/android/internal/telephony/gsm/GsmServiceStateTracker.java

Intent Intent Action/Component/Data PendingIntent parseUri
47

¡ https://developer.chrome.com/multidevice/android/intents
A little known feature in Android lets you launch apps directly from a web page via an Android Intent. Only activities that have the category filter, android.intent.category.BROWSABLE are able to be invoked using this method as it indicates that the application is safe to open from the Browser.
intentURI: android.content.Intent.parseUri() intent:
HOST/URI--path // Optional host #Intent;
package=[string]; action=[string]; category=[string]; component=[string]; scheme=[string]; end;
 [1] http://www.mbsd.jp/Whitepaper/IntentScheme.pdf [2] http://drops.wooyun.org/papers/2893

¡ com.android.webview.chromium.WebViewContentsClientAdapter.java

¡ intent.parseUri ¡ Android 4.49 ¡ Chrome0day...

¡ Intentactionintent activity
¡ uricomponentactionactivity BROWSABLE
¡ 2014--10--9Chrome2014--10--9

¡ Chrome Android <=37.0.2062.117
<script> var url = "intent:#Intent;action=com.google.android.apps.auth enticator.AUTHENTICATE;S.url=javascript:eval(decode URIComponent('location%3D%22http%3A%2F%2Fww w.baidu.com%2F%22%3Bwindow.onload%3Dfunction() %20%7Balert(document.cookie)%7D%3B'));SEL;compo nent=com.android.chrome/com.google.android.apps.c hrome.help.HelpActivity;end"; location.href = url; </script>

¡  https://code.google.com/p/chromiu m/issues/detail?id=421817
¡  POC

¡ Intent 
¡ Intent4Intent Action/Component/DataPendingIntent parseUri
¡ 4 
¡ OSChrome0day Android Chrome
¡ Androidhttp://source.android.com/devices/tech/security/overview/acknowledgements.html ¡ Chromehttp://googlechromereleases.blogspot.com/2014/11/stable--channel--update_18.html

¡ 

