Forging the USB armory
Andrea Barisani
<andrea@inversepath.com>

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

2007: Unusual Car Navigation Tricks Injecting RDS-TMC Traffic Information Signals

2009: Sniff Keystrokes With Lasers/Voltmeters Side Channel Attacks Using Optical Sampling Of Mechanical Energy And Power Line Leakage

2011: Chip & PIN is definitely broken Credit card skimming and PIN harvesting in an EMV world

2013: Fully arbitrary 802.3 packet injection Maximizing the Ethernet attack surface
Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Designed for personal security applications  mass storage device with advanced features such as automatic encryption, virus scanning, host authentication and data selfdestruct  OpenSSH client and agent for untrusted hosts (kiosk)  router for end-to-end VPN tunneling, Tor  password manager with integrated web server  electronic wallet (e.g. pocket Bitcoin wallet)  authentication token  portable penetration testing platform  low level USB security testing

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

enhanced mass storage

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

enhanced mass storage

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

enhanced mass storage

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

SSH proxy

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

password manager
*trivial example, better options planned
Forging the USB armory

authentication token

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

USB device authenticates host

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Design goals
Compact USB powered device Fast CPU and generous RAM Secure boot Standard connectivity over USB Familiar developing/execution environment Open design

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Selecting the System on Chip (SoC)
Freescale i.MX53
 ARM® CortexTM-A8 800-1200 Mhz  almost all datasheets/manuals are public (no NDA required)  Freescale datasheets are "ok" (far better than other vendors)  ARM® TrustZone®, secure boot + storage + RAM  detailed power consumption guide available  excellent native support (Android, Debian, Ubuntu, FreeBSD)  good stock and production support guarantee

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Domain Separation

Nonsecure

user mode applications

privileged kernel

SMC

user mode applications
privileged kernel

Secure
secure device

Monitor mode

device driver

Copyright 2015 Inverse Path S.r.l.

Mastering ARM TrustZone with the USB armory

ARM® TrustZone®

Copyright 2015 Inverse Path S.r.l.

http://genode.org/documentation/articles/trustzone

Forging the USB armory

ARM® TrustZone®

Copyright 2015 Inverse Path S.r.l.

http://genode.org/documentation/articles/trustzone

Forging the USB armory

Development time-line 2014/03: schematics development begins (Freescale chosen) 2014/04: PCB layout for breakout/prototyping board 2014/08: alpha board order 2014/09: USB armory alpha board delivery & evaluation 2014/10: project announcement 2014/10: order for 7 optimized beta revisions 2014/11: beta boards delivery & evaluation 2014/11: design finalization, Mk I production candidate order 2014/12: Mk I delivery 2015/01: first batch production (1k) 2015/03: shipping begins!

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

http://inversepath.com/usbarmory
Forging the USB armory

USB armory - Open source flash-drive-sized computer  Freescale i.MX53 ARM® CortexTM-A8 800Mhz, 512MB DDR3 RAM  USB host powered (<500 mA) device with compact form factor (65 x 19 x 6 mm)  ARM® TrustZone®, secure boot + storage + RAM  microSD card slot  5-pin breakout header with GPIOs and UART  customizable LED, including secure mode detection  excellent native support (Debian, Ubuntu, Arch Linux ARM)  USB device emulation (CDC Ethernet, mass storage, HID, etc.)  Open Hardware & Software

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

device mode

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

host mode (stand-alone)
Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory


s
8L-NOUSBH,8L, 8L-DDR-LDO, 8L-DDR-NCP 6L, 6L-DDR-LDO, 6L-DDR-NCP
Mk I
Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

lessons learned #1 tiny inductors are fragile

Forging the USB armory

evil

good

lessons learned #2 (the five-second rule) gold plating traces cause under-voltage on hot swap

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

TrustZone Support (Genode)

Compiling and running Genode OS (>= 15.02):
git clone https://github.com/genodelabs/genode cd genode
./tool/create_builddir hw_usb_armory cd build/hw_usb_armory
# in etc/build.conf add "--include image/uboot" to RUN_OPT
make run/tz_vmm cp var/run/tz_vmm/uImage $SD_CARD_MNT
uboot> ext2load mmc 0:1 0x70200000 /boot/uImage-genode; bootm 0x70200000

Requires minimally patch Normal world kernel compiled as follows:
make ARCH=arm zImage LOADADDR=0x80008000 modules

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Secure Mode Monitor (LED example)

@ set GPIO4 to SECURE

movw r0, #0x33

movt r0, #0xff

ldr

r1, =CSU_CSL

add

r1, r1, #4

str

r0, [r1]

@ CSL1

@ set IOMUXC to SECURE

movw r0, #0x33

movt r0, #0xff

ldr

r1, =CSU_CSL

add

r1, r1, #20

str

r0, [r1]

@ CSL5

@ set OCRAM to SECURE

...

_secure_monitor:

mov

r10, #0xcafe

cmp

r0, r10

beq

smc_handler

beq

to_nonsecure

Copyright 2015 Inverse Path S.r.l.

TrustZone Support (Direct)
Forging the USB armory

TrustZone Support (Direct) Secure Mode Monitor (LED example)

smc_handler:

ldr mov movt str

r10, =IOMUX_LED r0, #1 r0, #0 r0, [r10]

@ set the pad to GPIO

ldr movw movt str

r10, =GPIO4_DIR r0, #0xffff r0, #0xffff r0, [r10]

@ set direction to output

ldr

r10, =GPIO4_DR

ldr

r0, [r10]

mvn

r0, r0

str

r0, [r10]

@ toggle LED output

movs pc, lr

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

TrustZone Support (Direct)
Secure Mode Monitor (LED example)
static int beg_for_led_switch(void) {
printk("dear smc, kindly switch the LED\n");
/* give control to the secure monitor */ asm volatile ("movw r0, #0xcafe"); asm volatile ("smc #0");
return 0; }
The LED is hardware restricted via TrustZone to Secure monitor control.

A trivial interface implementation between Nonsecure Linux and Secure monitor illustrates a simple request for LED switching.

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

INTERLOCK

http://github.com/inversepath/interlock

Open source file encryption front-end developed, but not limited to, usage with the USB armory.

Provides a web accessible file manager to unlock/lock LUKS encrypted partition and perform additional symmetric/asymmetric encryption on stored files.

Take advantage of disposable passwords, "nuking" option.

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

INTERLOCK

Design Goals

Clear separation between presentation and server layer to ease auditability and integration.

Minimum amount of external dependencies and footprint.

Encrypted volumes: LUKS encrypted partitions Asymmetric ciphers: OpenPGP Symmetric ciphers: AES-256-OFB w/ PBKDF2 + HMAC Security tokens: Time-based One-Time Password Algorithm
(Google Authenticator)

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Authentication credentials are directly tied to LUKS partition.

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Files can be further encrypted on the USB armory...

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

...and later downloaded.

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Logging out locks the encrypted partition.

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

Thank you!
Q & A
Andrea Barisani
<andrea@inversepath.com>

Copyright 2015 Inverse Path S.r.l.

Forging the USB armory

