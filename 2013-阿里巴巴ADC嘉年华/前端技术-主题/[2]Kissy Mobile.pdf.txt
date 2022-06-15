 2013-07-14

http://mobile.kissyui.com

http://mobile.kissyui.com

 Mobile App Toolkit
http://demo.tmall.net/m/confirmOrder/index.html http://caipiao.m.taobao.com/lottery/h5/app.html
4

http://demo.tmall.net/m/confirmOrder/index.html
5

http://caipiao.m.taobao.com/lottery/h5/app.html

Mobile App Toolkit 
· WebView  · Hybird 

 Web App 

View & 

 NativeApp  & OPOA 

Slide/Tab// ""
http://docs.kissyui.com/kissy-gallery/gallery/slide

 View

 View

View(Page/Panel) 
· View ·  · View
­ Created(startup) ­ Ready(afterSlideIn) ­ Destory ­ Slideout(teardown) ­ FirstCreated(includeOnce)
14

View(Page/Panel) 
KISSY.use('mobile/app/1.2/',function(S, AppFramework){ // view AppFramework.startup(function(){ // Startup Code here }); AppFramework.teardown(function(){ // Teardown Code here });
});
15

App (window/activity) 
· View ·  · View · View · View ·...
16

App (window/activity) 
KISSY.use('mobile/app/1.2/',function(S, AppFramework){
AppFramework({ viewpath:'a.html' //  forcereload:true, // fullrangewidth:false, // pagecache:true,
});
});
17



PC  Mobile
·  · 

PC  Mobile
·  · 
­  ­ 


· A · B · C
·  · 

AppFramwork 
KISSY.use('mobile/app/1.2/',function(S, AppFramework){ // A  AppFramework.startup(function(){ // A's code });
}); ... KISSY.use('mobile/app/1.2/',function(S, AppFramework){
// B AppFramework.startup(function(){
// B's code }); });

AppFramwork 
KISSY.use('mobile/app/1.2/',function(S, AppFramework){ // A  AppFramework.startup(function(){ // A's code });
}); ... KISSY.use('mobile/app/1.2/',function(S, AppFramework){
// B AppFramework.startup(function(){
// B's code }); });

AppFramwork 
KISSY.use('mobile/app/1.2/',function(S, AppFramework){ // A  AppFramework.startup(function(){ // A's code });
}); ... KISSY.use('mobile/app/1.2/',function(S, AppFramework){
// B AppFramework.startup(function(){
// B's code }); });


· Android HTML5 History
­ history.pushState() ­ history.replaceState()
http://mobilehtml5.org/

a b

c

g
d 

f

e

a+b+c-d+f

a+b+c-d-e

h
a+b+c+g+h

 

a

b

a+b+c

c

g

d

h

f

e

abc



a b

c

a+b+c-d d

g h

f

e

abd



a b

c

g

d

h

f

e

a+b+c-d+f

abd f

+1

a b

c

g

a

h

f

e

a+b+c-a+f

aba f

""

a b

c

g

d history.back()

h

f

e

abd



a b

c

history.back()
g

d history.back()

h

f

e

abc



http://code.google.com/p/android/issues/detail?id=23979

http://mobilehtml5.org/

Hack!!!


· ViewPage · History · View
http://mobile.kissyui.com/mobile/app/1.2/demo/sdk/demo.html

H5/4-sdk.js Mobile App
Toolkit
Mobile App Toolkit SDK

View OPOA

View OPOA 

View OPOA 

 

 




Native 



OPOA 

webview




Native 



OPOA 

webview

M_Client.js (Native2H5)

Why not jQuery Mobile?

jQueryMobile 

Mobile App Toolkit
· / ·  · Web/ · http://iwomag.com

ref
· http://docs.kissyui.com/ · http://mobile.kissyui.com · https://github.com/jayli/slide

58

