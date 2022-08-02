bootloader
 throber3@gmail.com


· 10 ·  · 2008-2010 comodo  · 2010- 2011  · 2011-  



·    ·      ·  Root   · bootloader


· bootloader  · bootloader  · bootloader  · bootloader attack vector  · bootloader 

bootloader 
· bootloader
Bootloader pcwindows  biosMBR,os loader bootloaderMBR os loader pc grub uboot

bootloader 
· bootloader  1. 2.(iphone)
(android) iphone: bootrom  key  android1.root 2.rom 3.knox

bootloader 
· 
bootloader  android android  iphonebootloader

bootloader 
· bootloader  (android) 1.PBL:prime bootladeriphone 
bootrom 2.SBL(1/2/3):secord bootloader 3.APPSBLHTC hboot,aboot 4.HLOS basehandradio 5.TZTrustZone

bootloader 
· bootloader  (iphone ) 1.BootRom: PBL, SecureROM 2.LLBLow Level Bootloader, checks the signature of iBoot 3 iBoot:stage 2 bootloader ,recovery mode 4.iBBSA stripped down version of iBoot 5.iBECperforming a restore from Fake
DFU in LLB.

bootloader
· Bootloader  1.rom  androidmbnimg 2. dump a.android  dump bootloader

bootloader
· bootloader  P1 dd if=/dev/block/mmcblk0p3 of=/sdcard/mnt/bootloader.img b.iphone  Limera1n Exploit dump
Bootrom 3. jtag  android jtag 

bootloader
· bootloader android sbl1 sbl1 ida 
 
1.bootloader cpu  2.bootloader 
3.

bootloader
· bootloader  android sbl1 1.bootloader cpu 
MSM8960   sbl1 0x2A000000 tz: 0x2a020000 sbL2 0x2E000000 sbl3:0x47f00000

bootloader
·  8960 Boot Architecture

bootloader
· bootloader  android  2.bootloader 

bootloader
· bootloader  android sbl1
3.
rom   (peelf entrypoint)  

bootloader 
· bootloader  android sbl1
0xF803D5A5    :0xF8000000

bootloader 
· boot  
1. 2.bootloader 3.bss  1. 2. 3. aFlash b

bootloader 
· bootloader  android  PBL(bootrom)sbl1-> sbl2-> tz->sbl3-> APPSBL(app bootloader)

bootloader 
· bootloader  iphone  1.iphone normal mode
2.iphone DFU mode
(Device Firmware Upgrade)

bootloader 
· bootloader  bootloader 
   os 

bootloader attack vector
· fastboot bootloader 
fastboot oem unlock fastboot boot 

bootloader attack vector
·  fastboot bypass   ·  1.boot.img  init.rc   2.bootloader rootkit 

bootloader attack vector
·  1.google Nexus one bootloader  2.Motorola Android TrustZone CVE-2013-3051  3.samsung-galaxy-s4 aboot 
 

bootloader attack vector
· boot.img init.rc  OldBoot boot.img init.rc 
 service imei_chk /sbin/imei_chk class core socket imei_chk stream 666

bootloader attack vector
·  bootloader rootkit 

bootloader attack vector
· google Nexus one bootloader  htc s-on, s-off,
 s-off,  s-on
Hboot kerenl kernel patch  

bootloader 
· google Nexus one bootloader  blackrose http://forum.xda-
developers.com/showthread.php?t=1270  http://hi.baidu.com/vessial/item/830e961
d2c2bea623e87ce47

bootloader 
· samsung-galaxy-s4 aboot  https://github.com/Berrrry/loki  http://blog.azimuthsecurity.com/2013/05/
exploiting-samsung-galaxy-s4-secure-boot.html

bootloader 
· Motorola Android TrustZone CVE-2013-3051
Qualcomm MSM8960 Motorola Razr HDRazr MAtrix HD MotorolaAndroid 4.1.2TrustZone   0x90x2 SMC bootloader

bootloader 
· Motorola Android TrustZone CVE-2013-3051 
Motorola token fastboot oem unlock [token] tokenmotorola bootloader  0x9 0x2 SMC

bootloader 
· Motorola Android TrustZone CVE-2013-3051  motopocalypse
http://vulnfactory.org/public/motopocalypse.zip
 http://blog.azimuthsecurity.com/2013/04/ unlocking-motorola-bootloader.html

bootloader 
· motopocalypse unlock  1. 2.smc_command ,
0x80202000 3. hook unix_seqpacket_ops ioctl 
payload 

bootloader 
· motopocalypse unlock  4.payload  socket(PF_LOCAL,SOCK_SEQPACKET, 0); ioctl(socket_fp, 0, 0) 5.payload 

bootloader 
· 1.1001,value 0xfffffc17 (-1001) if (global_flag) ret = -1001;

bootloader 
· 2.smc_command , 0x80202000smc 0x9

bootloader 
· 2.smc_command 0x9 bootloader

bootloader 
· 2.smc_command , 0x80202000

bootloader 
· 2.smc_command 0x2 bootloader

bootloader 
· 3.hook unix_seqpacket_ops ioctl  /proc/kallsyms
hook unix_seqpacket_ops  payload

bootloader 
· 4.payload 
socket unix_create case SOCK_SEQPACKET: sock->ops = &unix_seqpacket_ops;
hook  unix_seqpacket_ops ioctl ioctlhook payload

bootloader 
· 5.payload 

bootloader 
· 1.bootloader   Nexus onekernel Oldboot boot.img
· 2.bootloader  · 3.
kptr_restrict 


· bootloader rootkit · androidbootloader 


· 8960 Boot Architecture · http://blog.azimuthsecurity.com · Nexus OneBootloader
by xee · Androidbootloader by  · http://forum.xda-developers.com/



