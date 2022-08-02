Web 
 &  F2E of Taobao & eTao
2012-07-07

 F2E of Taobao http://jayli.github.com Web Developer & Translator

 F2E of eTao http://weibo.com/mario

1999

2005

2008



 Objective-C


www


www

·  · MediaQuery ·  ·  ·  · Dom ·  ·...

http://wiki.ued.taobao.net/doku.php?id=ued.bj:f2e:rd

http://www.alistapart.com/articles/responsive-web-design


·  ·  · URL ·  ·  ·...

320 480 768 1024

...
 

 + 
.wrapper { width:100%;
}
.wrapper .item { float:left;
}

960px

520px

200px

200px

20px


20px

90%

50%

20%

20%

5%

5%



http://wiki.ued.taobao.net

http://taobao.7m.cn/

?


Fewer Features

1

2

3

   

http://wt.taobao.com

 ViewPort Meta
<meta name="viewport" content=" width=device-width, initial-scale=1">

ViewPort Meta 
· width=device-width · user-scalable=1 · initial-scale=1 · maximum-scale=1 · minimum-scale=1

Layout viewport
Visual viewport = Layout viewport

ViewPort 
<meta name="viewport" content=" width=device-width, initial-scale=1, maximum-scale=1">
<meta name="viewport" content=" width=device-width, initial-scale=1">

ViewPort 
<meta name="viewport" content=" width=device-width, initial-scale=1, maximum-scale=1">
<meta name="viewport" content=" width=device-width, initial-scale=1">

Media Query CSS
/* PC */
/* iPad 960 */ @media only screen and (max-width: 959px) {}
/* iPad 960 */ @media only screen and (min-width: 768px) and (max-width: 959px) {}
/* iPhone  */ @media only screen and (max-width: 767px) {}
/* iPhone  */ @media only screen and (min-width: 480px) and (max-width: 767px) {}
/* iphone4  */ @media only screen and (max-width: 479px) {}

MediaQuery
·  · 

MediaQuery
·  · 


MediaQuery
· 
· 


1

2

Skeleton CSSGrid System
http://www.getskeleton.com

reset.css 
body { font-family: tahoma,arial,\5b8b\4f53,sans-serif;
}
html { -webkit-text-size-adjust: 100%;
}

iOS + Helvetica
Android + Droid Sans



1 2

1.

2.

http://www.flickr.com/photos/zhangsj/6126931247/

HighRes.png

HighRes.png LowRes.png

<style> .selector-to-img{
width:100px;height:100px; background:url('img-pc.png`) no-repeat center; } @media only screen and /*tablet*/ { background:url('img-tablet.png') no-repeat center; } @media only screen and /*mobile*/ { background:url('img-mobile.png') no-repeat center; } </style>
<img src="space.gif" class="selector-to-img" />

2

1

2html

Pic_sum.jpg Pic_m.jpg Pic_b.jpg Pic_80x40.jpg Pic_120x120.jpg Pic_160x160.jpg ...

}   25


http://jayli.github.com/gallery/rd/responsive.html


http://jayli.github.com/gallery/rd/responsive.html

.pic { background-image:url("url.png"); width:30px;height:30px;
} @media only screen and /*tablet or mobile*/ {
.pic { width:20px;height:20px; background-position:x y;
} }
<img src="space.gif" class="pic" />



RESS
"" Responsive Design + Server Side Components
http://www.slideshare.net/4nd3rsen/ress-responsive-design-server-sidecomponents-10084972

ServerSide
ClientSide
@media only screen and /*1*/ { /* 1*/
} @media only screen and /*2*/ {
/* 2*/ } @media only screen and /*3*/ {
/* 3*/ }

ServerSide
if($Device1){ //1 echo $style1;
}else if($Device2){ //2 echo $style2;
}else if($Device3){ //3 echo $style3;
}
ClientSide

""


http://caipiao.m.taobao.com

<!doctype html> <html manifest="http://www.../pad-sport-cache.php"> <head> <!--ViewPortMeta--> <meta name="viewport" content="
width=device-width, initial-scale=1, maximum-scale=1"> <!----> <meta name="format-detection" content="telephone=no" /> <!----> <meta name="apple-mobile-web-app-capable" content="yes" /> <link rel="apple-touch-icon" sizes="72x72" href="http://cdn/img-72-72.png" /> </head> ...

<!doctype html> <html manifest="http://www.../pad-sport-cache.php"> <head> <!--ViewPortMeta--> <meta name="viewport" content="
width=device-width, initial-scale=1, maximum-scale=1"> <!----> <meta name="format-detection" content="telephone=no" /> <!----> <meta name="apple-mobile-web-app-capable" content="yes" /> <link rel="apple-touch-icon" sizes="72x72" href="http://cdn/img-72-72.png" /> </head> ...

<!doctype html> <html manifest="http://www.../pad-sport-cache.php"> <head> <!--ViewPortMeta--> <meta name="viewport" content="
width=device-width, initial-scale=1, maximum-scale=1"> <!----> <meta name="format-detection" content="telephone=no" /> <!----> <meta name="apple-mobile-web-app-capable" content="yes" /> <link rel="apple-touch-icon" sizes="72x72" href="http://cdn/img-72-72.png" /> </head> ...

<!doctype html> <html manifest="http://www.../pad-sport-cache.php"> <head> <!--ViewPortMeta--> <meta name="viewport" content="
width=device-width, initial-scale=1, maximum-scale=1"> <!----> <meta name="format-detection" content="telephone=no" /> <!----> <meta name="apple-mobile-web-app-capable" content="yes" /> <link rel="apple-touch-icon" sizes="72x72" href="http://cdn/img-72-72.png" /> </head> ...

<!doctype html> <html manifest="http://www.../pad-sport-cache.php"> <head> <!--ViewPortMeta--> <meta name="viewport" content="
width=device-width, initial-scale=1, maximum-scale=1"> <!----> <meta name="format-detection" content="telephone=no" /> <!----> <meta name="apple-mobile-web-app-capable" content="yes" /> <link rel="apple-touch-icon" sizes="72x72" href="http://cdn/img-72-72.png" /> </head> ...

<!doctype html> <html manifest="http://www.../pad-sport-cache.php"> <head> <!--ViewPortMeta--> <meta name="viewport" content="
width=device-width, initial-scale=1, maximum-scale=1"> <!----> <meta name="format-detection" content="telephone=no" /> <!----> <meta name="apple-mobile-web-app-capable" content="yes" /> <link rel="apple-touch-icon" sizes="72x72" href="http://cdn/img-72-72.png" /> </head> ...

http://www.taobao.com/go/chn/minfo/index.html

 
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<!--email--> <meta name="format-detection"
content="address=no;email=no" /> <!----> <link rel="apple-touch-icon-precomposed"
href="http://cdn/img-114-114.png"> <link rel="apple-touch-startup-image"
href="http://cdn/img-320-460.png">

 
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<!--email--> <meta name="format-detection"
content="address=no;email=no" /> <!----> <link rel="apple-touch-icon-precomposed"
href="http://cdn/img-114-114.png"> <link rel="apple-touch-startup-image"
href="http://cdn/img-320-460.png">

 
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<!--email--> <meta name="format-detection"
content="address=no;email=no" /> <!----> <link rel="apple-touch-icon-precomposed"
href="http://cdn/img-114-114.png"> <link rel="apple-touch-startup-image"
href="http://cdn/img-320-460.png">

 
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<!--email--> <meta name="format-detection"
content="address=no;email=no" /> <!----> <link rel="apple-touch-icon-precomposed"
href="http://cdn/img-114-114.png"> <link rel="apple-touch-startup-image"
href="http://cdn/img-320-460.png">

 
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<!--email--> <meta name="format-detection"
content="address=no;email=no" /> <!----> <link rel="apple-touch-icon-precomposed"
href="http://cdn/img-114-114.png"> <link rel="apple-touch-startup-image"
href="http://cdn/img-320-460.png">


AppApp
http://caipiao.m.taobao.com

icon

icon

apple-touch-icon-precomposed
/
apple-touch-icon
,


apple-touch-icon apple-touch-icon-precomposed


 Slide/Switchable touch
 click

YUI Slide
http://jayli.github.com/gallery/yuislide/

touch
if ('ontouchstart' in document.documentElement) { node.delegate('touchstart`, function(e){ var x = e.changedTouches[0].clientX; //... }); node.delegate('touchend`, function(e){ var x = e.changedTouches[0].clientX; //... }); node.delegate("touchmove",function(e){ var current_x = e.touches[0].pageX; }); //...
}

touch
if ('ontouchstart' in document.documentElement) { node.delegate('touchstart`, function(e){ var x = e.changedTouches[0].clientX; //... }); node.delegate('touchend`, function(e){ var x = e.changedTouches[0].clientX; //... }); node.delegate("touchmove",function(e){ var current_x = e.touches[0].pageX; }); //...
}

touch
if ('ontouchstart' in document.documentElement) { node.delegate('touchstart`, function(e){ var x = e.changedTouches[0].clientX; //... }); node.delegate('touchend`, function(e){ var x = e.changedTouches[0].clientX; //... }); node.delegate("touchmove",function(e){ var current_x = e.touches[0].pageX; }); //...
}


if(window.DeviceMotionEvent) { window.addEventListener('devicemotion',function(e){ var acceleration = e.accelerationIncludingGravity; var x = acceleration.x, y = acceleration.y, z = acceleration.z; //... },false);
}

HTML5  Native App ?

HTML5  Native App ?
1Web App 
Native App 
2Web App 
Native AppWeb App

PhoneGap 
HTML5 App
http://phonegap.com/

HTML5 App + NativeApp
HTML5+NativeApp

HTML5 App + NativeApp
Native App HTML5 App
Far More than PhoneGap...

Web



iOS Android


iPhone 4S iPhone 4 iPhone 3GS Glaxy Note Nexus One MOTO XT615 HTC Legend

CPU
A5 800MHZ A4 800MHZ
S5PC100 600MHZ Exynos  1.4GHZ
 1GHZ  800MHZ  600MHZ

RAM
512M 512M 256M
1G 512M 512M 384M



iPhone 3GS 5%

iPhone 4S
29%

iPhone4 66%

iPhone

 12%
600MHZ 19%

1GHZ 45%

800MHZ 24%

Andoid(CPU)

2012-4

iOSAndroid

iOS Android


iOS 4.3+ Older iOS Android 2.2+ Older Android



JS

Web Core

Nitro *

Web Core JavaScript Core

Web Core

V8

Web Core JavaScript Core

iOS 5.1 iOS 5.0 iOS 4.3 iOS 4.2 iOS 4.1

Android 4.0 Android 2.3 Android 2.2 Android 3.0

iOS

Android

2012-4

So...
1 2
http://is.gd/hApzIp
3 4 5HTML5 OPOA

...
PC
1 2

Web App 
1. CPU & RAM · Reflow & Repaint · CSS3 ·  · JS · JS ·  · HTML5
2.  Network


1.  2. CPU

Reflow & Repaint
(Layout & Paint)
http://www.stubbornella.org/content/2009/03/27/reflows-repaints-cssperformance-making-your-javascript-slow
http://www-archive.mozilla.org/newlayout/doc/reflow.html

Reflow & Repaint
1. off-document DOM 2.  3. Dom 4. Dom 5. Dom

Reflow & Repaint
1. off-document DOM 2.  3. Dom 4. Dom 5. Dom

Reflow & Repaint
1. off-document DOM 2.  3. Dom 4. Dom 5. Dom

1.off-document:
var fragment = document.createDocumentFragment(), list = [`foo','bar','baz'],elem,contents;
for (var i = 0; i<list.length; i++){ elem = document.createElement(`div'); content = document.createTextNode(list[i]); fragment.appendChild(content);
}
document.body.appendChild(fragment);

1.off-document:
var fragment = document.createDocumentFragment(), list = [`foo','bar','baz'],elem,contents;
for (var i = 0; i<list.length; i++){ elem = document.createElement(`div'); content = document.createTextNode(list[i]); fragment.appendChild(content);
}
document.body.appendChild(fragment);

1.off-document:
var tmpnode = document.getElementById(`container'), clone = tmpnode.cloneNode(true), list = [`foo','bar','baz'],elem,contents;
clone.setAttribute(`width','50%');
for(var i = 0; i<list.length; i++){ elem = document.createElement(`div'); content = document.createTextNode(list[i]); clone.appendChild(elem);
}
original.parentNode.replaceChild(clone,original);

1.off-document:
var tmpnode = document.getElementById(`container'), clone = tmpnode.cloneNode(true), list = [`foo','bar','baz'],elem,contents;
clone.setAttribute(`width','50%');
for(var i = 0; i<list.length; i++){ elem = document.createElement(`div'); content = document.createTextNode(list[i]); clone.appendChild(elem);
}
original.parentNode.replaceChild(clone,original);

off-document:block-none-block
var subElem = document.create(`div'), elem = document.getElementById(`animated');
elem.style.display = `none'; elem.appendChild(subElem); elem.style.width = `320px'; elem.style.display = `block';

off-document:block-none-block
var subElem = document.create(`div'), elem = document.getElementById(`animated');
elem.style.display = `none'; elem.appendChild(subElem); elem.style.width = `320px'; elem.style.display = `block';

2.
<style type="text/css"> div { background:white; color:black; } div.active { background:blue; color:white; }
</style>
<script> $(`#styled').addClass(`active');
</script>

3.
.selector1 { position:absolute;
}
.selector2 { position:fixed;
}

4.Dom
1reflow/reflow 2DOM

5.DOM
Dom,

CSS3 
http://simonjonsson.com/dev/css3-performance-test http://www.pubnub.com/blog/css3-performance-optimizations


·  · Box shadow · Text indent · Gradients · Background-size · Translate3D & GPU
CPU reflowrepaint


1.  
2. iScroll

http://fav.m.taobao.com/h5proxy-fav.htm

iScroll
iScroll render(reflow+repaint)script
http://fav.m.taobao.com/h5proxy-fav.htm

iScroll
iScrollCPU
http://fav.m.taobao.com/h5proxy-fav.htm

iScroll
Scroll,CPU
http://fav.m.taobao.com/h5proxy-fav.htm

iScroll.js
http://cubiq.org/iscroll-4

CSS3 



1, left/top  2, CSS3 Transform 2d 3, CSS3 Transform 3d

1, JavaScript (setInterval)  2, CSS3 Transition  3, CSS3 Animation 


<div id="Test">,300px</div>
<script> var el = $(`#Test'), i = 0; var s = setTimeout(function(){ i += 1; el.css(`top',i+'px');
if(i >= 300){ clearTimeout(s); return false;
} setTimeout(arguments.callee,20); },20); </script>


<div id="Test">,300px</div>
<script> var el = $(`#Test'), i = 0; var s = setTimeout(function(){ i += 1; el.css('-webkit-transform', 'translateY('+i+'px)');
if(i >= 300){ clearTimeout(s); return false;
} setTimeout(arguments.callee,20); },20); </script>


<div id="Test">,300px</div>
<script> var el = $(`#Test'), i = 0; var s = setTimeout(function(){ i += 1; el.css(`-webkit-transform', 'translate3d(0,'+i+'px,0)'); if(i >= 300){ clearTimeout(s); return false; } setTimeout(arguments.callee,20); },20);
</script>

CSS3 Anim 
.run { -webkit-transform:translate3d(0,300px,0); -webkit-animation-duration: .4s; -webkit-animation-iteration-count: 1; -webkit-animation-name:anim-top;
}
@-webkit-keyframes anim-top { from { top:0; } to { top:300px; }
}

CSS3 Anim 
.run { -webkit-transform:translate3d(0,300px,0); -webkit-animation-duration: .4s; -webkit-animation-iteration-count: 1; -webkit-animation-name:anim-top;
}
@-webkit-keyframes anim-top { from { -webkit-transform:translateY(0px); } to { -webkit-transform:translateY(300px); }
}

CSS3 Anim 
.run { -webkit-transform:translate3d(0,300px,0); -webkit-animation-duration: .4s; -webkit-animation-iteration-count: 1; -webkit-animation-name:anim-top;
}
@-webkit-keyframes anim-top { from { -webkit-transform:translate3d(0,0,0); } to { -webkit-transform:translate3d(0,300px,0); }
}

CSS3 Transition 
.test { top:0; -webkit-transition-property:top; -webkit-transition-duration:.4s; -webkit-transition-timing-function: linear;
} .test.run {
top:300px; }
<script> $(`.test').addClass(`run');
</script>

CSS3 Transition 
.test { top:0; -webkit-transition-property:top; -webkit-transition-duration:.4s; -webkit-transition-timing-function: linear;
} .test.run {
-webkit-transform:translateY(300px); }
<script> $(`.test').addClass(`run');
</script>

CSS3 Transition 
.test { top:0; -webkit-transition-property:top; -webkit-transition-duration:.4s; -webkit-transition-timing-function: linear;
} .test.run {
-webkit-transform:translate3d(0,300px,0); }
<script> $(`.test').addClass(`run');
</script>



iOS

Android

Time(ms) smooth Time(ms) smooth

absolute

1400+

N

1000+

N

JavaScript translateY 1400+

N

1000+

Y

translate3D

690

Y

1000+

Y

absolute

500

N

430

N

Animation translateY

470

Y

433

Y

translate3D

470

Y

433

Y

absolute

430

N

408

N

Transition translateY

470

Y

417

Y

translate3D

460

Y

413

Y



iOS

Android

Time(ms) smooth Time(ms) smooth

absolute

1400+

N

1000+

N

JavaScript translateY 1400+

N

1000+

Y

translate3D

690

Y

1000+

Y

absolute

500

N

430

N

Animation translateY

470

Y

433

Y

translate3D

470

Y

433

Y

absolute

430

N

408

N

Transition translateY

470

Y

417

Y

translate3D

460

Y

413

Y



iOS

Android

Time(ms) smooth Time(ms) smooth

absolute

1400+

N

1000+

N

JavaScript translateY 1400+

N

1000+

Y

translate3D

690

Y

1000+

Y

absolute

500

N

430

N

Animation translateY

470

Y

433

Y

translate3D

470

Y

433

Y

absolute

430

N

408

N

Transition translateY

470

Y

417

Y

translate3D

460

Y

413

Y



iOS

Android

Time(ms) smooth Time(ms) smooth

absolute

1400+

N

1000+

N

JavaScript translateY 1400+

N

1000+

Y

translate3D

690

Y

1000+

Y

absolute

500

N

430

N

Animation translateY

470

Y

433

Y

translate3D

470

Y

433

Y

absolute

430

N

408

N

Transition translateY

470

Y

417

Y

translate3D

460

Y

413

Y

Transform-Translate3d
GPU 
Why
http://www.slideshare.net/lijing00333/graphic-programming-in-js

JS code... JS(JS) ()
X window OS kernel


setInterval(anim,10);
CPU  
CPU
GPU
GPU

JS code... JS(JS)

() X window

CSS3 transitiConSS3Transition


WebGL API

CSS3 transition transform

OS kernel



JS code... JS(JS)

() X window

CSS3 transitiConSS3Transition


WebGL API

CSS3 transition transform

OS kernel

 CPU GPU

GPU 



CPU

Browser

 Memory 

GPU
http://www.khronos.org/webgl/ http://zh.wikipedia.org/wiki/

http://m.taobao.com/


1. GPU3D
2.Mobile Safari1 1024x1024
3. 
4.iOS BUG


· max-width:1024px 
·  · 
-webkit-backface-visibility:hidden; -webkit-transform-style:preserve-3d;
http://jsfiddle.net/besteric/NrAYy/embedded/result%2Ccss/ http://ued.taobao.com/blog/2012/01/06/ChromeTransitionBug

JavaScript
·  ·  · Dom ·  · Dom ·  ·...
http://www.nczonline.net/blog/2009/01/13/speed-up-your-javascript-part-1 http://www.developer.nokia.com/Community/Wiki/JavaScript_Performance_Best_
Practices http://www.html5rocks.com/en/tutorials/speed/quick/


· JPEGJPEG > PNG > GIF ·  · AjaxJS · JS · Reflowrepaint · WebGLTranslate3D ·  · 
http://www2012.wwwconference.org/proceedings/proceedings/p41.pdf


· CPU · Reflowrepaint · GPU · CSS3 · JavaScript ·  ·  ·  ·  · 

 vs 


http://blog.cloudfour.com/css-media-query-for-mobile-is-fools-gold/


· Chrome Developer Tools · Mobile Perf bookmarklet
· Firebug Lite / Page Resources / DOM Monster / SpriteMe / CSSess / Zoompf
· Yslow Mobile · PageSpeed Insights · ICY · iWebInspector · Android Webkit Console (Android 2.2+) · Remote Debugging for Mobile Safari · Weinre · Adobe Shadow · JSPerf · SunSpider · Mobile Browser Concurrency Test




Web App

V8

  HEM

Modernizr


Module A

Module B

Module
C

Module D

http://stackoverflow.com/questions/6768474/how-can-i-detect-which-javascriptengine-v8-or-jsc-is-used-at-runtime-in-andro

Clever View

placeholder fake-src IMG

Current View

Scroll

fake-src IMG script

http://engineering.linkedin.com/linkedin-ipad-5-techniques-smooth-infinitescrolling-html5

""

Android 2.2+

API

Android 4.0+

navigator.connection

Window.performance

IMG 







Offline/2G/3G/WIFI //

 

HTML5 Web App

78 TaoMobile 
//


Web OPOA 
728 D2


Thanks
////// /
//////

http://www.flickr.com/photos/wintan29/3641254652/ http://www.flickr.com/photos/samuel-leo/3550983108/sizes/s/in/photostream http://www.flickr.com/photos/morinkovo_fotky/4168850871/sizes/z/in/photostream
http://www.flickr.com/photos/contactink/3062292337/ http://www.flickr.com/photos/onemillion/3979984655
http://www.flickr.com/photos/polvero/4232984120 http://www.flickr.com/photos/bramus/5918434508/ http://www.flickr.com/photos/wired_gr/5824553327/ http://www.flickr.com/photos/macprime/3204702518/ http://www.flickr.com/photos/gpayne85/3202258029/ http://www.flickr.com/photos/27457302@N07/3487724038/ http://www.flickr.com/photos/gorimon/3536710606/ http://www.flickr.com/photos/massimiliana/1436809029/

 F2E of Taobao http://jayli.github.com Web Developer & Translator

 F2E of eTao http://weibo.com/mario

