Neglected UI-Redressing

About Me
·  IDbe_n · Before 360 · Now  · web  RIM  html5  web 

Agenda
· UI-Redressing · Clickjacking · Dragjacking · Cursorjacking · UI-Redressing of HTML5 · Malicious use of UI-Redressing · 


 (XSS) (CSRF) HTML5UI-RedressingRMI





UI-Redressing


1. Clickjacking()


· Positon:absolutefixedrelative · opacity · Z-index · #-
tips iframe


Demo
http://mall.aliapp.com/follow.html http://mall.aliapp.com/clickjacking2.html

Wordpress clickjacking to shell

webcam-clickjacking

Clickjacking Bypass CSRF Protection
 1. GET 2. actionURL

2. Drag&Drop jacking

Drag & Drop
    HTML5 API  

Bypass The Same Origin Policy
  ""

Content Extraction
 1. URLURL  2. Hidden 3. (csrf-token)

How to do itnow
·  designModecontentEditable
·  Chromefirefox"view-source"

Cursorjacking
 http://mall.aliapp.com/cursor-jacking1.html http://mall.aliapp.com/cursor-jacking2.html

UI-Redressing of HTML5
· Html5 fullscreen http://mall.aliapp.com/flashfullscreen.html http://mall.aliapp.com/fullscreen.html

· Webkit x-webkit-speech http://mall.aliapp.com/webkitspeech.html can you bypass

Malicious use of UI-Redressing
·  ·  ·  · ......

XSIO

XSIO

XSIO

5. Clickjacking protection

· 38% if (top != self)

· 22.5% if (top.location != self.location)

· 13.5% if (top.location != location)



· 8% if (parent.frames.length > 0) · 5.5% if (window != top)

if (top.location != location) top.location = self.location ;

· 5.5% if (window.top !== window.self)

· 2% if (window.self != window.top)

· 2% if (parent && parent != window)

· 2% if (parent && parent.frames && parent.frames.length>0)

· 2%

if((self.parent&&!(self.parent===self))&&(self.parent.frames.length!=0))

Busting Frame busting
1. frame top.location  parent.location 2.  onbeforeunload  3. xssiexss filterchormexss audior 4. refererjs referer 5. iframe securityIE 6. iframe sandboxHTML5 7. designmode

The Best Javascript framebusting
<style> html {display:none;} </style> <script> if(self==top){
document.documentElement.style.display='block '; }else{
top.location=self.location; } </script>

X-FRAME-OPTIONS
 IFRAME
 " "IFRAME 

X-Frame-Options

Thank you

