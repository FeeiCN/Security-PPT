2019

APT
Ju Zhu



Ju Zhu /

Mabel Guo /

9+ 7+0DaynDay Hunt CVEGoogleAppleFacebook SpeakerBlackHatCodeBlueCSS

 / iOS


CONTENTS

01
PART 01


02
PART 02


03
PART 03
iOS

04
PART 04


PART 01
APT

APT
  


BYODBring Your Own Device

APT



Windows

MacOS

iOS

Android



1











2











3











Win7Win10 

3264

APT



PE

Office

PDF

Mach-O

plist

APK

1













2













3













Mach-O <-  plistiOS RansomwareDeath Profile

PART 02



 MacOS iOSAndroid




 


MacOS Darling

Cuckoo Sandbox   

iOS
Corellium
  

Android Anbox

Cuckoo Droid   

MacOS
 Darling-- Cuckoo Sandbox--

PART 03
iOS

iOS
  


Mach-O 


plist Death Profile



API

Loader & Run Mach-O

Foundation



libobjc.so

libxml2.so

libdispatch.so



libc.so

libc++abi.so

libc++.so



QemuArm v7

DockerAarch 64

LinuxAarch 64

HardwareAarch 64




Segment

VM Protection -> VMP

slide + text_vm_addr TEXT

DATA

LLVM

Loader & Run

LINKEDIT 


 Foundation.framework


main Load Commands--LC_MAIN
 =  + slide + text_vm_addr

Rebase

Lazy Symbol PointerCFString

Pointer

Pointer

Lazy Symbol Pointer

0x100007F9C

->

slide + 0x100007F9C

CFString

0x100007FA8

->

slide + 0x100007FA8

API
Lazy Symbol Pointer <- 





NSLog

slide + 0x100007F9C

->

NSLog@libFoundatio n.so

API






 ODMOriginal Design Manufacturer

PART 04



Ju Zhu

