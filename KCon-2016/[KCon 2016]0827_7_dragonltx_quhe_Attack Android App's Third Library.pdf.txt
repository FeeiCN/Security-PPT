·  · 
 · windows
andrdoid

Alipay unLimit Security Team

dragonltx

About

·  
·  · 



1 

Agenda

2 Android 3 Fuzz Android
4 

5 Q&A

Part. 01

3

 | [ Hacker@KCon ]

 | [ Hacker@KCon ]

 | [ Hacker@KCon ]

Part. 02
Android
7

zxing
 App
2

zxing
2

sqlcipher
 sqlcipherload extension sqlload_extension

sqlcipher

TSRC
app app sql


chromium
Android Androidwebview (uxss,overflow,use after free,address bar spoof etc.)

chromium

chromium

530301/531891

chromium
530301/531891Android5.0webview/

stagefright
Android 
Android Appstagefright

stagefright

libupnp
UPnP UDP 1900
2

libupnp
2

ffmpeg
 ffmpeg
2

ffmpeg
2

ffmpeg CVE-2016-6920 0day
2

sdk
so so
2

Part. 03
Fuzz Android
25

Fuzz tools

Peach

http://www.peachfuzzer.com

MFFA honggfuzz

https://github.com/fuzzing/MFFA https://github.com/google/honggfuzz

AFL

http://lcamtuf.coredump.cx/afl/

Peach fuzz

http://bbs.pediy.com/showthread.php?t=176420

 

Peach

Android

Fuzz

Honggfuzz

AFL

  

  

MFFA + Peach
Peach
MFFA

peach pit MFFA MFFA

360 fuzz

360 fuzz

360 fuzz

skia fuzz
9-patch (also known as NinePatch) is an Android-specific extension to the PNG image format that allows for automatic scaling of images

skia fuzz

skia fuzzCVE-2015-1532 Reproduce

stagefright fuzz

build the module
frameworks/av/cmds/stagefright mma
push the module
/data/local/tmp/
run the module
./stagefright ­a ./stagefright -s

stagefright fuzz(CVE-2015-6599)

stagefright fuzz(CVE-2015-6599)

AFL + Peach + MFFA

linkage

Build the

· Your text in here android · Your text in here source

AFL

code

Build · Your text in here stagefright · Your text in here with afl

Run stagefright
with aflfuzz

· Your text in here · Your text in here

Peach

Create sample file based on afl corrupted
file

Run stagefright · Your text in here with MFFA · Your text in here

Advantage

More Based on

code

file

More

coverage specification efficiency

stagefright fuzz(CVE-2016-0842 Duplicate)

stagefright fuzz(CVE-2016-0842 Duplicate)

stagefright fuzz(CVE-2016-0842 Duplicate)

Part. 04

42


1 SDK



 

Q&A


() 
2

THANKS

