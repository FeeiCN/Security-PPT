berserkJS
@ 2012-07-07  D2

berserkJS
·  ·  ·  ·  PhantomJS  ·  · 
·  · 
· 

  T_T
 (HTTP Archive)  HAR  

·  Chrome / Safari

·  IE 

·  Firebug * NetExport  HAR 

FlashSoft FlashSoft FlashSoft FlashSoft














 plugin


 + plugin......





= =||| 

 Mac  JS 

......

berserkJS


· berserkJS  Qt C++ ·  webkit 
· 

·  ·  ·  DOM  JS ·  ·  WebKit  ·  · HTTP


 Qt  windows linux Mac OS 
* 



Boomerang 

Performance API 

PhantomJS



Yahoo! boomerang 
· boomerang  http://yahoo.github.com/boomerang/ ·  IE8+ 
Performance API 
· Performance API  http://www.w3.org/TR/performance-timeline/ ·  NavigationTiming API  Chrome7+ IE9+ FF7+ 
http://w3c-test.org/webperf/specs/NavigationTiming/
*PS ResocurceTiming API URL http://w3c-test.org/webperf/specs/ResourceTiming/ 

Performance API
  connectEnd-connectStart    

boomerang
  BOM DOM    

aoao



    
PhantomJS

 berserkJS 

 PhantomJS 

· PhantomJS  http://www.phantomjs.org/ ·  API

berserkJS
 JS  webkit  webkit  DOM/JS  Mouse Event API File System API   
base64
 CPU    GUI     API  

PhantomJS
 JS  webkit  webkit  DOM/JS   Mouse Event API File System Module WebServer Module Network Event callback 
1.6 base64
  commonJS   

 PhantomJS 

· PhantomJS 
var page = require(`webpage').create(), fs = require('fs'), content = ''; page.onLoadStarted = function () {
page.onResourceRequested = function (request) { content +='Request ' + JSON.stringify(request, undefined, 2));
}; page.onResourceReceived = function (response) {
content +='Receive ' + JSON.stringify(response, undefined, 2)); }; } page.onLoadFinished = function () { fs.write('c:\\a.txt', content, 'w') }; page.open('http://www.taobao.com'); // ...... //  DNS Waitting  = =||| // phantomJS  netsniff.js  DNS  -1 ...... //  130  HAR 

· berserkJS 
berserkJS --script=demo1.js --command=true

· berserkJS 
*  JSON 

· berserkJS  network  

App.networkData()[0]
· "url": < string > · "ResponseSize": <number> · "RequestStartTime ": <number> · "ResponseDuration": <number · "ResponseDNSLookupDuration": <number> · "ResponseWaitingDuration": <number> · "ResponseDownloadDuration": <number> · "ResponseMethod": < string > · ...... · "StatusCode": <string> · "Accept": <string> · "Cookie": <string> · ......
 72  



 PhantomJS  selector 


· berserkJS  network 

 App.selector.get() 

· App.selector.img() · App.selector.png() · App.selector.gif() · App.selector.ico() · App.selector.jpg() · App.selector.svg() · App.selector.doc() · App.selector.css() · App.selector.js() · App.selector.cookie() · App.selector.nonegzip() · App.selector.nonecache() · App.selector.nonecdn()

· App.selector.totaltimeout(duration <number>) · App.selector.waittimeout(duration <number>) · App.selector.downloadtimeout(duration <number>) · App.selector.dnstimeout(duration <number>) · App.selector.sizeout(size <number>) · App.selector.http200() · App.selector.http301() · App.selector.http302() · App.selector.http304() · App.selector.http404() · App.selector.fromcdn() // sina  CDN


· berserkJS  network  berserkJS --script=demo2.js
* App.selector.png().sizeout(1024 * 30).get();

· berserkJS  network 

 PhantomJS 

· PhantomJS  page.evaluate 
console.log('Page title is ' + page.evaluate(function () { return document.title;
}));
· berserkJS  webview.execScript  JSON 
var site = {topTen: 5, url: 'taobao'} sit = App.webview.execScript(function (obj) {
return {topTen: obj.topTen - 2, url: 'http://www.' + obj.url + '.com'}; }, site); console.log(JSON.stringify(sit));
 { "topTen": 3, "url": "http://www.taobao.com" }

·  __pageExtension.postMessage  message 
//  message  App.webview.addEventListener('message', function(w, l) {
if ('page' == l) { //  "this is a message"  alert(w.txt);
} }); App.webview.execScript(function(s) {
//  setTimeout(function() {
__pageExtension.postMessage({txt: "this is a message"}, "page"); }, 1000); });
*  JSON.stringifry  JSON.parse  object ......

· 
· consoleMessage   alert / confirm 
App.webview.addEventListener('consoleMessage', function(msg, lineNumber, sID) { alert(JSON.parse(msg).txt); // 
});
App.webview.addEventListener('alert', function(msg, lineNumber, sID) { alert(JSON.parse(msg).txt); //  alert 
});
App.webview.addEventListener('confirm', function(msg) { alert(JSON.parse(msg).txt); //  confirm 
});
App.webview.execScript(function(s) { //  setTimeout(function() { var jsonString = JSON.stringify({txt: "this is a message"}); alert( jsonString); confirm( jsonString); console.log( jsonString); }, 1000);
});

 PhantomJS base64

· 
phantomJS 
berserkJS --script=demo3.js --command=true

· 

·  base64 
berserkJS --script=demo4.js

·  base64 

 PhantomJS

·  ·  ·  · CPU

·  repaint 
berserkJS --script=demo5.js

·  repaint 

· 
berserkJS --script=demo6.js

· 

· 
berserkJS --script=demo7.js

· 

· 
1. :
1.  urlChanged  2.  14400  3.  250 ms  RGB  4.  12  12000 
2.  App.webview.setDetectionRects:
1.  urlChanged  2.  setDetectionRects  3.  250 ms  RGB  4.  12 

·  CPU  
· App.cpu()  App.memory() __pageExtension.cpu()  __pageExtension.memory() 

·  CPU  

berserkJS --script=demo8.js

 PhantomJS ......
· App.watchFile(flie , callback) · App.unWatcher(file | callbackHandle) · App.watchedFiles() · App.watcherClose() · ......

...... PhantomJS  GUI ......
*

 PhantomJS
......
·  ·   ·  ·  HTTP  ·  · ......

· 
*  Demo ......

· 
*  ......

· 
berserkJS --script=demo10.js --command=true
* App.readFile(path [, charset] )

· 

·  HTTP 
berserkJS --script=demo11.js

·  HTTP 
* JSXHR

· UA
· useSystemProxy([index]) · App.webview.setProxy(host[, type, userName, password]) · App.webview.clearProxy() · App.webview.setUserAgent(userAgent <string>)
*berserkJS 
·  berserkJS  API  
·  networkData  · ...... · UA

· 
App.webview.useSystemProxy()  App.webview.setProxy("127.0.0.1:8888")

berserkJS




Window  build 

https://github.com/tapir-dream/berserkJS

 API  http://tapir-dream.github.com/berserkJS/ /api/index.html

berserkJS



 --start=true
· berserkJS  js/conf/init.js  · init.js  conf.js 

·  config.js 
(function() { ...... return { global: [ namespace(`action.helper') //  ], //  automation: namespace('action.autoscript'), //  module: [ { path: namespace('module.none_gzip_doc'), args: [] }, ... ], completed: [ namespace(`action.report') //  ] };
});

· 
(function (data, max) { var supplant = App.helper.supplant;
var duration = {}; for (var i = 0, c = data.length; i < c; ++i) {
if (data[i].ResponseDuration > max) { duration[data[i].url] = data[i].ResponseDuration;
} }
var urls = Object.keys(duration); var count = urls.length; var message = " URL  ${max} ms: \n"; for (var i = 0; i < count; ++i) {
message += supplant("URL: ${url}, Duration: ${time} ms \n", { url: urls[i], time: duration[urls[i]]
}); } message = supplant(message, {max: max}); return message; });

· 


 Demo 
 --script   App.loadScript 
 App.args 

· loadScript  App.args
berserkJS --script=demo12.js weibo
*

berserkJS
·



berserkJS 

1. 



1. 

2. 





3. 


2. 

4. 



5. 



3. 

6.  7. 



8. 

9.  10. 

·  · 


·  ·  · Web
· ......

berserkJS


·  · UA ·  JS  · 


·  · JS ·  ·  · 

berserkJS


· Qt  QWebViewQWebPageQWebFrame  Webkit  · QtScript  Webkit  JS  JavaScriptCore  ·  ·  QtScript 
QtScript

PageScript QWebFrame QWebPage QWebView

C++ Class QNetworkReply QNetworkRquest
QNetworkAccessManager

  @winter 

Q&A
session
 >_<

 

