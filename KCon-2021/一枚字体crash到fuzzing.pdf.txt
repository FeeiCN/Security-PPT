CRASHFUZZING


CONTENTS
1fuzzing
2fuzzingcrash
3apple fuzzing
4fuzzing
5fuzzing 0 1

PART 01
fuzzing
0 2


2020fuzzing2020fuzzing  20202020fuzzing FormatFuzzeraflsmartfuzzing fuzzingaflsmartFormatFuzzer aflsmart fuzzingFormartfuzzer
https://zhuanlan.zhihu.com/p/344008210
0 1

Formartfuzzer Formartfuzzer https://uds-se.github.io/FormatFuzzer/
0 1

PART 02
fuzzing crash
0 2

Formartfuzzer Formartfuzzer 13

Formartfuzzer

010 Editor bt 

PNG AVI BMP GIF ........

ttf bt 

ffcompile 



 
0 1

ttf 19table TrueType  2 330
0 1

010 Editor ttfname
0 1

TTF 010 BT 21 table

010 editor bt



ttf 

pfp 

0 1

fuzzing macos ? /System/Applications/Font Book.app/Contents/MacOS/Font Book
0 1

ttf Font Book
0 1

fuzzing start ?  1 2 3crashcrash
0 1

fuzzing
ttf 
font book crash


#/bin/bash for I in {1..200000};do
./ttf-fuzzer fuzz test.ttf sleep 1s ./test test.ttf & echo "sleep start\n" sleep 1s echo "kill start\n" ps -efww|grep -w 'Font'|grep -v grep|cut -c 7-17|xargs kill -9 done echo "over\n" exit 0

0 1

24fuzzing..... fuzzingcrash
0 1

crash  1head.unitsPerEm = 0  16  16384   2name.nameID = 1()
font book 
0 1

fuzzingcrash Formartfuzzer  smart_replacesmart_deletesmart_insert smart_abstractsmart_swapfuzzing .jpg
0 1

2 x 24h fuzzing...... 0 crash.....
0 1

 1table  2 3fuzzing
apple 
0 1

PART 03
apple  fuzzing
0 2

apple  Core Text Core Text  Core Graphics (CG)   Quartz OS X  iOS 
0 1

CoreText  CTFrameSetterCTFrameCTFrameCTFrame
CTFrameCGPath()
CTLineCTFrameCTLineCTLine
CTRunCTLineCTRunCTLine AttachmentCTRunCTLine
0 1

apple 
func CTFontCreateWithName(_ name: CFString, _ size: CGFloat, _ matrix: UnsafePointer<CGAffineTransform>?) -> CTFont
CGFontRef CGFontCreateWithDataProvider(CGDataProviderRef provider);
func CTFontCreateWithGraphicsFont(_ graphicsFont: CGFont, _ size: CGFloat, _ matrix: UnsafePointer<CGAffineTransform>?, _ attributes: CTFontDescriptor?) -> CTFont
0 1

 Core Text  ( CFAttributedStringRef)  ( CGPathRef) "" CFMutableAttributedStringRef attributeRef = CFAttributedStringCreateMutable(kCFAllocatorDefault, 0); void CFAttributedStringSetAttribute(CFMutableAttributedStringRef attributeRef , CFRange range, CFStringRef attrName, CFTypeRef value);
0 1

 framesetter  CTFramesetterCTFrame framesetter    func CTFramesetterCreateWithAttributedString(_ attrString: CFAttributedString) -> CTFramesetter
0 1

api

1CTLine 

CTLineLine 



CTLineCreateWithAttributedStringCTLineDraw

2CTTypesetter



CTTypesetterCreateWithAttributedString

3CTGlyphInfo

 Unicode  ID 

CTGlyphInfoCreateWithGlyph

CTRunDraw

0 1

google TinyInst TinyInst  Windows32  64  macOS64 TinyInst aflTinyInstinter xen
0 1

fuzzing 
Formartfuzzer + AFL + TinyInst ? -> apple font frame
fuzzing start 
1 2 3crashcrash 4
0 1

2 x 24h fuzzing .... 1 crash get .....
0 1

core text ttf
0 1

 Formartfuzzer 
1010 btttf
2
3
fuzzingfuzzing 
0 1

PART 04
fuzzing 
0 2

 aflsmartpeach->chunkchunk Formartfuzzer010bt 
0 1

 

ttf 



  



  

   



ttf

0 1

 aflsmart
Formatfuzzer

 

peach

 



chunk 



 

0 1

 1Formartfuzzerbt SHORTLONGLONG LONG
2
3 4btoffsetlength
0 1

 9table
0 1



1 1 -> 0 -> 

2: 1 : type : data

if(data)

{

1:type D: data

}

else

{

0

}

0 1

 3: 1 : type struc struc numberofContours -> endPtsOfContours[numberofContours ]
4: 1 :xxxxtype data 5 4:type numb number
0 1

 Table Head cmapglyf 
0 1

ttfglyf
0 1

ttfcmap
0 1

 ->

 1 2 


1-> 2afl 

aflsmart fuzzing

0 1

fuzzing 

Formartfuzzer + AFL + TinyInst +  ? -> apple font frame

fuzzing start 

1

2

3crashcrash

4

5

0 1

PART 05
fuzzing
0 2

ttf 1   www.dafont.comwww.fontsquirrel.com www.myfonts.com 2issue crash 3
2w+
0 1

  1

2

3ttf table

4ttf table

5ttf table

6afl 

0 1

fuzzing fuzzing7bugs
0 1


0 1

fuzzing.......
0 1

poc https://github.com/sunglinl/ttffuzz
0 1


KCon 
MA N O E U VR E

