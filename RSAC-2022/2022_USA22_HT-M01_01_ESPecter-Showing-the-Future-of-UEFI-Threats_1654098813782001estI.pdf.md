#RSAC

SESSION ID: HT-M01
ESPecter: Showing the Future of UEFI Threats

Martin Smolár
Malware Researcher ESET @smolar_m

Jean-Ian Boutin
Director of Threat Research ESET @jiboutin

#RSAC
Disclaimer
Presentations are intended for educational purposes only and do not replace independent professional judgment. Statements of fact and opinions expressed are those of the presenters individually and, unless expressly stated to the contrary, are not the opinion or position of RSA® Conference, RSA Security LLC or any other co-sponsors. RSA Conference does not endorse or approve, and assumes no responsibility for, the content, accuracy or completeness of the information presented. Attendees should note that sessions may be audio- or video-recorded and may be published in various media, including print, audio and video formats without further notice. The presentation template and any media capture are subject to copyright protection.
©2022 RSA Conference LLC or its affiliates. All rights reserved. RSA Conference logo and other trademarks are proprietary. All rights reserved.
2

#RSAC

So why are attackers interested in the Unified Extensible Firmware Interface (UEFI)?

Detection is difficult

It can survive OS reinstallation

OS independent

3

#RSAC
UEFI Bootkit on ESP?
Can this trend TRANSFORM UEFI security?
4

#RSAC
5

#RSAC

Proprietary

BIOSes EFI

UEFI

2000

2005

6

UEFI Firmware location
(SPI Flash chip)
7

#RSAC
LoJax SPI Flash writing decision tree
F A I L
11

#RSAC
What's next?
12

ESP location (HDD/SSD)
Easy access

UEFI Firmware location
(SPI Flash chip)
Difficult access
13

#RSAC

#RSAC
Complexity of threat versus added benefit

ESP implants

SPI Flash implants

"Only" 1 protection (SecureBoot) Easy to deploy (less privileges required) Easier to discover/detect/remove Does not survive OS reinstall

Better persistence (survives OS reinstall) Harder to discover/detect Higher privileges required Harder to achieve ­ multiple level protections

Mistakes in implant implementation can turn victim's device into a brick

#RSAC
ESPecter analysis

#RSAC
EFI System Partition (ESP)

Partition 1 ­ OS (ntfs, ext4, ...) Partition 2 ­ Data (ntfs, ext4, ...) ESP partition ­ FAT32

GPT disk

BootOrder = 0002 0001 0003

/EFI/Microsoft/Boot/bootmgfw.efi /ubuntu/shimx64.efi

Boot0001 = /EFI/Microsoft/boot/bootmgfw.efi

/Vendor3/bootx64.efi

Boot0002 = /EFI/ubuntu/shimx64.efi

...

Boot0003 = /EFI/Vendor3/bootx64.efi

/EFI/Boot/bootx64.efi

17

SPI Flash firmware

#RSAC
3rd party apps/drivers

SEC
(Security) phase

PEI
(Pre-EFI Init) phase

PEI modules

DXE
(Driver Execution Environment)
phase

BDS
(Boot Device Selection) phase

TSL
(Transient System Load)
phase

DXE drivers
SMM modules

UEFI boot manager

SHIM, GRUB, Windows Boot manager...)

RT
(Run Time)
OS kernel

Boot process

#RSAC
ESPecter persistence
/EFI/Microsoft/Boot/bootmgfw.efi /EFI/Boot/bootx64.efi
Inject extra section
/EFI/Microsoft/Boot/bootmgfw.efi /EFI/Boot/bootx64.efi
19

#RSAC
ESPecter overview
2012 Legacy version
2020 UEFI version
20

Typical Windows boot flow

UEFI Firmware

Execute boot application from EFI partition based on the NVRAM variables
Transfer execution to OS loader using Archpx64TransferTo64BitApplicationAsm

Windows Boot Manager (bootmgfw.efi)

Transfer execution from OS loader to OS Kernel using OSIArchTransferToKernel

Windows OS loader (winload.efi)
Windows Kernel (ntoskrnl.exe)

#RSAC
21

Compromised Windows boot flow
UEFI Firmware
Execute boot application from EFI partition based on the NVRAM variables
Windows Boot Manager (bootmgfw.efi)
Transfer execution to OS loader using Archpx64TransferTo64BitApplicationAsm
Windows OS loader (winload.efi)
Transfer execution from OS loader to OS Kernel using OSIArchTransferToKernel
Windows Kernel (ntoskrnl.exe)
UEFI threats moving to the ESP: Introducing ESPecter bootkit

#RSAC
22

#RSAC
Disable Boot Manager's self integrity check
23

Driver signature enforcement disable
Original

#RSAC
Patched

PATCH CiOptions
24

#RSAC
ESPecter espionage
25

Attribution
?

#RSAC
Chinese speaking TA Low confidence

#RSAC
UEFI firmware security real-world problems
When standards meet reality

UEFI Secure Boot

UEFI Secure Boot Root of Trust Platform Initialization firmware
(SEC, PEI, DXE Core, DXE Dispatcher)
UEFI Secure Boot Vbyepriafiscsaetdion (db, dbx)

UEFI DXE/SMM
Drivers

UEFI Apps

Option ROMs

UEFI Bootloader
Apps

Verify UEFI OS Loader
Verify OS Kernel

#RSAC
28

Verified & Measured Boot

Root of Trust in hardware

CPU microcode

Verify and measure

OTP fuses

#RSAC
UEFI Secure Boot Root of Trust Platform Initialization firmware
(SEC, PEI, DXE Core, DXE Dispatcher, PK, KEK)
UEFI Secure Boot Verification (db, dbx) + measure

TPM

UEFI DXE/SMM
Drivers

UEFI Apps

Option ROMs

UEFI Bootloader
Apps

Verify and measure UEFI OS Loader
Verify and measure

OS Kernel

29

#RSAC
Protections work, BUT!
World is full of legacy and low-end devices Misconfigurations Vulnerabilities + End Of Development Support = vulnerable forever
30

#RSAC
Our latest discovery ­ Lenovo UEFI vulnerabilities
100+ Lenovo consumer laptops affected Forgotten drivers from manufacturing process
31

#RSAC
Our latest discovery ­ Lenovo UEFI Vulnerabilities
Activated from the user mode process ­ just create UEFI Variable CVE-2021-3971 - disable SPI flash protections CVE-2021-3972 ­ disable UEFI Secure Boot (and more)

Exploit CVE-2021-3971

Deploy LoJax/MoonBounce

Exploit CVE-2021-3972

Deploy ESPecter/FinSpy bootkit

32

#RSAC
UEFI firmware vulnerabilities
33

#RSAC
Vulnerable bootloaders ­ bypassing Secure Boot

BootHole Mickey Shkatov and Jesse Michael

@d_olex ValdikSS
34

#RSAC
The human element ­ SPI flash vs ESP implants

PROTECTED Ok, sure!

Just disable Boot Guard to make it work.

Against SPI flash

Implants

Once Intel® Boot Guard is enabled, there MUST be no way to disable it

35

#RSAC
The human element ­ SPI flash vs ESP implants

NOT PROTECTED Ok, sure!

Just disable UEFI Secure Boot to make it work.

Against

ESP Implants

One can be tricked to disable UEFI Secure Boot

36

#RSAC
The human element ­ ESP implants
37

#RSAC
UEFI Bootkits ­ future of the UEFI threats?

+

+

ESP easy access

Powerful threat

The human element

38

#RSAC
Protection & Detection (ESP implants)

Apply

#RSAC

UEFI Secure Boot with TPM auditing

+ UEFI
Secure Boot ON

+ Enable Full Disk Encryption with TPM support

TPM ready

on the Windows volume

Apply

#RSAC

UEFI Secure Boot with TPM auditing

UEFI Secure Boot OFF
Deploy UEFI Bootkit

41

Apply

#RSAC

Defenders ­ Assessing your platform security

FwHunt & uefi_r2
42

Apply

#RSAC

Defenders - ESP integrity monitoring

Compute baseline state from known good ESP state
ESP

Save baseline

Baseline ESP

43

Apply

#RSAC

Defenders - ESP integrity monitoring

Compute current ESP state
ESP

Compare with saved known
good state

No - Update baseline state Baseline ESP

Equals No

Malicious ?

Yes Yes - Remediate

44

Apply

#RSAC

Defenders - ESP integrity monitoring

File modified

Remediate

No Legitimate?

Yes

Update BASELINE DB

45

Apply

#RSAC

Defenders - ESP integrity monitoring

Modified UEFI driver or application

Remediate

in DB

No

AND

Yes

not in DBX

Update BASELINE DB

46

Apply

#RSAC

Defenders - ESP integrity monitoring

Legitimate configuration files modification (e.g. grub.cfg)

Load malicious chainloader module

Hyper-V Backdoor by @d_olex
BootHole Look for anomalies Mickey Shkatov and Jesse Michael
47

#RSAC
Remediation

Apply

#RSAC

Remediation

ESP easy to modify
49

Apply

#RSAC

Remediation

ESP easy to recover
50

Apply

#RSAC

Remediation

51

Apply

#RSAC

Remediation - ESPecter

Malicious files
· /EFI/Microsoft/Boot/bootmgfw.efi · /EFI/Boot/bootx64.efi

Cleanup
1. Boot into Windows recovery command line (from installation DVD/USB) 2. Identify windows installation volume 3. Delete malicious files on ESP 4. Recover boot files with BCDBoot.exe
bcdboot C:\Windows /p /v

52

#RSAC
Takeaways

#RSAC
Takeaways

SPI implants: detection is difficult,
but so is implementation and
deployment

ESP Implant: easy deployment Require "only" SecureBoot bypass Less persistent, but still control the early phase of the boot process

#RSAC

Martin Smolár
Malware Researcher
@smolar_m

Jean-Ian Boutin
Director of Threat Research
@jiboutin

55

#RSAC

Martin Smolár
Malware Researcher
@smolar_m

Anton Cherepanov
Senior Malware Researcher
@cherepanov74

Jean-Ian Boutin
Director of Threat Research
@jiboutin

56

