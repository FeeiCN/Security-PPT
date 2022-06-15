WebFirefox OS 
 dxue@mozilla.com

Outline
· Firefox OS  · WebAPI  · Web App  · 

Firefox OS 

Gaia: User Interface & APPS
Gecko: Mozilla Web Engine WebAPI's (Javascript)
Contacts NFC Camera Bluetooth SMS Telephony Audio Location Settings
OS Kernel (Gonk) Device Hardware

GONK

GECKO

GAIA

APPS

 



NFC





USB













Web API

Web API 

· WebTelephony · Open WebApps

· Keyboard/IME

· Vibration (W3C) · Device Storage

· Push Notification

· WebSMS

· Contacts

· Permissions

· Idle

· Mouse Lock (W3C)

· WebFM

· Screen Orientation · Web Bluetooth

· FileHandle

· Settings

· Network Infomation (W3C)· Network Stats

· Power Management · Battery Status (W3C) · WebPayment

· Mobile Connection · Alarm

· IndexedDB (W3C)

· TCP Socket

· Browser

· Archive

· Geolocation (W3C) · Time / Clock

· Wifi Infomation · Web Activities

 ­ 

 ­ 

Web App 

Web App 
·  (Hosted App)
­  manifest  ­  App  ­ 
·  (Packaged App)
­  zip  manifest.webapp ­ API ­ 

Web App manifest

Web App 

 ­ http://marketplace.firefox.com

Manifest URL

 ­ WebApps API
· WebApps Installation API
­ navigator.mozApps.install() ­ navigator.mozApps.installPackage() ­ navigator.mozApps.getSelf() ­ navigator.mozApps.getInstalled() ­ navigator.mozApps.checkInstalled()
· Web Apps Management API
­ navigator.mozApps.mgmt.getAll()





· IDE ­ Xcode ­ Visual Studio ­ Android Studio
·  ­ Notepad, ­ Eclipse ­ Vim ­ Komodo

· Firefox
· 
­ Firebug, Rainbow etc. ·  · QEMU  · Firefox OS 
­ B2G  ­ Gecko ­ 

QEMU 

QEMU 
 Firefox OS    Firefox OSPC
    Firefox OSEmulator
 EmulatorEmulator Emulator OK

QEMU 
test@ThinkPad:/home$ git clone git://github.com/mozilla-b2g/B2G.git test@ThinkPad:/home$ test@ThinkPad:/home$ test@ThinkPad:/home$ cd B2G test@ThinkPad:/home/B2G$ ./config.sh emulator test@ThinkPad:/home/B2G $ test@ThinkPad:/home/B2G $ test@ThinkPad:/home/B2G $ ./build.sh test@ThinkPad:/home/B2G $ test@ThinkPad:/home/B2G $ test@ThinkPad:/home/B2G $ ./run-emulator.sh

Firefox Desktop

Firefox Desktop
   Firefox OS
Gaia  Firefox OS DesktopQEMU Emulator
Device API   Firefox OS DesktopFirefox OS DeviceAPIFeature   Firefox OS Desktop  Firebug 

QEMU 
1http://ftp.mozilla.org/pub/mozilla.org/b2g/nightly/latest-mozilla-central/ 2git clone git://github.com/mozilla-b2g/gaia 3# In gaia directory
make profile 4/path/to/b2g -profile ~/gaia/profile

Simulator











Simulator
 FirefoxAddon Firefox OS Desktop
 Web AppFirefox OS
 DeviceAPIFeature 

Firefox Nightly

Firefox Nightly
 Firefox Nightly 
Gaia HTML5Nightly  Gaia SystemHomescreen 

Firefox Nightly
1http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central/ 2git clone git://github.com/mozilla-b2g/gaia 3# In gaia directory
DEBUG=1 make 4/path/to/firefox -profile ~/gaia/profile

Firefox OS Device

Firefox Nightly
 Firefox OS  Firefox OS   
  Gonk, Gecko Gaia
API

C/C++JS- Emscripten
· LLVM-to-JavaScript 
­  C/C++ LLVM
· C/C++  JavaScript · 3D 
­ OpenGL  WebGL
· LUA/CPython  C  Javascript
­ lua/python
· Android-PinyinIME  JS  Gaia
­ Native

C/C++JS- Emscripten
· structure,  
· if/elseswitchforwhile · 64bitInt ·  ·  · 
llvm js

C/C++JS- Emscripten
·  · 
 · 
 · 
js asm.js,webgl 

Android PinyinIME

JS

Native

  (ms)(ms)

a7

36

86

8

b 674 16086 843

380

c 948 24828 1278

620

d 736 17614 1038

440

e 85 1095

84

20

f 473 10497 587

200

g 613 14289 887

320

h 814 21237 1097

520

z 1431 37846 1945

1120

JS / Native 10.75
2.163157895 1.982258065 2.065909091
7.2 2.66 2.34375 1.957692308 1.725892857


· https://wiki.mozilla.org/B2G · https://wiki.mozilla.org/Gecko · https://wiki.mozilla.org/Gaia · http://en.wikipedia.org/wiki/Boot_to_Gecko · https://developer.mozilla.org/enUS/docs/Mozilla/Firefox_OS · https://developer.mozilla.org/en-US/docs/Apps/ · http://mozilla.com.cn/ https://github.com/kripken/emscripten https://github.com/kripken/emscripten/wiki


info-cn@mozilla.com @

Thanks!

