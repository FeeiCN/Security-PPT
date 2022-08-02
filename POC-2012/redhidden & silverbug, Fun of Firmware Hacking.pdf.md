Fu~n of Attacking Firmware
2012 POC
Silverbug RedHidden

WHAT ..

The image cannot be displayed. Your computer may not have enough memory to open the image, or the image may have been corrupted. Restart your computer, and then open the file again. If the red x still

The image cannot be displayed. Your computer may not have enough memory to open the image, or the image may have been corrupted. Restart your computer, and then open the file again. If the red x still appears, you may have to delete the image and then insert it again.

Firmware
a small program to control devices non-volatility memory device
Firmware update : fixing bugs or adding features ...

WHY ..
Provide new features Unlock hidden functionality
Find vulnerabilities Use for the malicious purpose
2011.01 SONY "PS Jailbreak" Geohot ­ release free jailbreak for v3.55 firmware Bypass SONY's security check with USB dongle Execute unsigned code
2011.09 CANON DSLR firmware hacking Magic Latern ­ release a custom firmware add-on (modified firmware) Photo and Video enthusiasts

WHY ..
2009. 10 Samung TV firmware hacking SamyGo-reverse engineering project for Samsung TV Firmware
Unlocked the ability to use non-Samsung WIFI dongles Improved playback from USB devices
Implemented NFS and SAMBA for sharing file over the network
2011.11 HP LaserJet Printer Vulnerability Researchers From Columbia University
Not check digital signatures before installing a firmware update Accept arbitrarily modified firmware
Erase its existing os and overwrite with a malicious one

WHY ..
2012 SECUINSIDE Wireless Router Hacking
IPTIME G104 - CGI Buffer Overflow Vulnerability ANYGATE ­ Execute Command with Non-Authentication
2012 VB2012 ADSL Modem Hacking
Fabio Assolini, Kaspersky ADSL Router CT-5367 ­ CSRF, UPNP/SNMP misconfiguration
2012 DEFCON Rooting SOHO Router
Zachary Cutlip, Tactical Network Solutions Netgear WNDR3700v3 ­ SQL Injection to MIPS Overflows
Adventures in Router Rootkits
Michael Coppola, VSR Netgear, Belkin, TRENDnet ­ Owning the Network

WHY ..

Wireless Router

Firmware Tools

rpef
Router Post-Exploitation Framework

Collection Info.
Router exploitation framework

Firmware Hacking Process

HOW ..

Recon Firm ware Image

Extract items From Imag
e

Find intere sting files

Debugging &
Reversing

Exploitation Repackaging

myfirm# binwalk, signsrch, offzip, trid myfirm# file, strings, hexdump, objdump myfirm# dd myfirm# firmware_mod_kit ..... myfirm# IDA, qemu, gdb ..... myfirm# extract tools, deflate tools.....

Firmware(Image) Structure

HOW ..

Firmware image

Boot Loader

Kernel

File System

Others

HOW ..

Firmware(Image) - BootLoader

Boot Loader

Kernel

File System

Others

- The first code that is executed every time a system reset - Initialize hardware and load the correct image from flash - Execute the Kernel - Placed in a part of flash or a separate EEPROM - For Embedded Devices,
- Das U-Boot, RedBoot - CFE, Adam2, PSPBoot - NetBoot(DWL7100AP) - VxWorks' own bootloader(Netgear WGT624) - ThreadX(D-Link)

HOW ..

BootLoader (ex) U-Boot
"Das U-Boot" - Universal Bootloader PowerPC, ARM, MIPS systems
mostly used to load and boot a kernel image U-Boot Image = <U-Boot Header> <Kernel Image>
http://www.denx.de/wiki/U-Boot http://sourceforge.net/project/u-boot
Image Create : mkimage

Firmware(Image) - Filesystem

HOW ..

Boot Loader

Kernel

File System

Others

Use flash memory as storage media Size and bootup time are very important Used with the enhanced compression, or the ability to execute file directly from flash For Embedded System,
- SquashFS, JFFS2 - cramFS, ext2 - YAFFS2, tmpfFS - PFS

FileSystem - SquashFS

HOW ..

Linux, read only compressed file system. Use zlib, lzo, xz (LZMA) compression for files, inodes, directories
max filesystem size : 2^64
packing/unpacking tool : - squashfs-tools (mksquashfs, unsquashfs)
- Re7zip - E-Pack Decompressor - https://github.com/vasi/squash.rb/blob/master/squash.rb - https://github.com/matteomattei/PySquashfsImage

FileSystem - cramFS

HOW ..

Linux, cram a file system onto a small ROM Read-only file system
Designed to be simple and small, and to compress things well Data stored in compress format ­ Zlib Meta data is not compressed Max file system size : 2^16(256MB)
cramFS = <superbloc><directory_structure><data>
Packing/unpacking tool : - cramfs tools : mkcramfs
- E-Pack Decompressor - Fsck.cramfs, mkfs.cramfs

File System ­ JFFS2

HOW ..

Linux, the journaling Flash file system v2, a log-based file system Read/Write File system
Add compression to JFFS Compress algorithm : zlib, runbin, rtime Designed for use on NOR and NAND flash devices
Packing/unpacking tool : - mkfs.jffs2
- E-Pack Decompressor - mtd-mods(projects)

HOW ..

Archive Format

Gzip(Zlib)
GNU Zip, primary compression format used by Unix-based system Compression Algorithm : DEFLATE Format = <Gzip header ><Deflate compressed Blocks><GZIP Footer> Header : 10byte ­ magic number, version, timestamp Footer : 8byte ­ CRC Checksum, uncompressed data length Magic Signature : \x1F\x8B uncompress : gzip ­d <.gz file>
LZMA
Lempel-Ziv-Markov chain algorithm Compression Algorithm : dictionary compression scheme(LZ77 variant) Magic Signature : \x5D\x00\x00\x80 Uncompress : lzma ­d <.lzma file>

Firmware Hacking (Demo)

HOW ..

# Target : IPTIME N8004 # Firmware Version : 7.72 (n8004_kr_7.72.bin) # Vulnerability : Get Administrator Password (p artial apply the patch)

0x00
[Boot Loader] U-boot uImage header
kernel image(LZMA)

0xF0000
[File System] SquashFS Files(LZMA)

0x2E09B2
Others

Recon the firmware image

HOW ..

HOW ..
Split the firmware image apart and then unpack

Find a bugs and vulnerability

HOW ..

Find a bugs and vulnerability

HOW ..

HOW ..

Firmware Repackaging Process

Recon Firm ware Image

Extract items From Imag
e

Modify the unpack ed file syst
em

Rebuild the file syst
em

Pad data &
update met adata

Conclusion
As the use of smart and portable devices increase, it's very easy for us to meet various firmware. Devices are smart, but not secure.
By firmware hacking research, you can do the following things :
Even though there is no known information, you can get the"DIY devices" that correspond to the purpose what you want.
You can find the potential security threat in the firmware.
let's start challenging from the firmware located around you.

