eynterceptor
Press any key to continue...
Niels van Dijkhuizen [ NebulaH ] 2018

This presentation

About me

 Existing USB HID attacks / tools  What's wrong with them?  Available protections / mitigations  My implant PoC  Putting it into an attack scenario  Demo-time...

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Existing USB HID attacks / tools

2005 2010 2011 2014 2016 2017

KeyGhost USB keylogger Keylogger/PHUKD Hybrid
BadUSB 2.0 David Kierznowski
Niels van Dijkhuizen

PHUKD - Irongeek HAK5 USB Rubber Ducky
BadUSB - Karsten Nohl USBDriveby - Samy Kamkar
HAK5 Bash Bunny Cactus WHID injector
Keynterceptor NebulaH 2018

What's wrong with it?

Niels van Dijkhuizen

Kind of in-your-face!

Keynterceptor NebulaH 2018

What's wrong with it?
Requires either: · An unlocked and unattended computer · Very good social engineering skills

- Many payloads require direct internet access - Protection available

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Available protection mechanisms
USG Robert Fisk USBProxy Dominic Spill USBGuard Daniel Kopecek GoodDOG Tony DiCola Beamgun Josh Lospinoso USB keyboard guard G Data Duckhunt Pedro M. Sosa Linux patches GRSecurity

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

A new implant?
a HID attack that works with locked machines and bypasses known protection mechanisms

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Design requirements
1. The implant should be in-line with the keyboard and the host.
2. The implant should have notion of real-time.

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Maybe just not this small

and spice it up a bit...
3. The implant could use an over the air communication channel.

Niels van Dijkhuizen

NSA COTTONMOUTH-I, MOCCASIN

Keynterceptor NebulaH 2018

keyboard
USB host controller
Niels van Dijkhuizen

Hardware diagram

computer
MC with USB device
support Communi-
cations module

Teensy 2.0: Arduino-based MC

Real-time Clock

Maxim MAX3421E Maxim DS3132

433Mhz UART

EEPROM (nvram)

Keynterceptor NebulaH 2018

Keynterceptor PoC HW

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Keynterceptor PoC HW

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Bypassing protections: Device cloning

USB Standard Descriptor & USB HID Report Descriptors

#define STR_MANUFACTURER #define STR_PRODUCT #define ENDPOINT0_SIZE

L"Chicony" L"HP Elite USB Keyboard" 8

#define KEYBOARD_INTERFACE #define KEYBOARD_ENDPOINT #define KEYBOARD_SIZE #define KEYBOARD_BUFFER #define KEYBOARD_INTERVAL
Niels van Dijkhuizen

0 1 8 EP_DOUBLE_BUFFER 10

Keynterceptor NebulaH 2018

Bypassing protections: Human emulation

//Add random delays to avoid detection int r = rand() % 111; r += 8; delay(r);

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

+ wireless burst

Power consumption

min
+ LEDs

max

min

max

Keynterc. + keyb. Keynterceptor + 2 LEDs

voltage amps

Plain keyboard
Plain keyboard
Niels van Dijkhuizen

+ Keynterceptor
Keynterceptor NebulaH 2018

Niels van Dijkhuizen

BOM / Costs

Teensy 2.0

$ 16,00

433 MHz module

$ 4,00

USB Host module

$ 8,00

DS3231 RTC

$ 4,00

MCP1825S regulator

$ 1,00

Exp. print / LEDs / resistors $ 2,00

Total in US Dollars:

$ 35,00

Total in Euro's:

 30,00

Keynterceptor NebulaH 2018

Use-Cases
a. Control keyboard remotely OTA b. Autologin with captured creds c. Inject keystrokes after inactivity with chosen time-frame d. Block user input with RF kill-switch (for a take-down) e. <<insert scenario here>>

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Add-on for a full attack scenario
KeynterceptorCompanion: - Nanopi Neo - 433 MHz - 4G dongle

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

DEMO-Time...

New mitigations?
a. Multi-factor or challenge-response (like captcha's)
 with every unlocking action
b. Profiling / monitoring power consumption per device
(HW support is problematic )

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

USBGuard + power profiling PoC

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

USBGuard + power profiling PoC

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

USBGuard + power profiling PoC

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

USBGuard + power profiling PoC

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Keynterceptor attack feasible?

· 430 lines of C code · 85 lines of Python code · 301 lines of Perl code · some development euro's Future work? · Fit it inside real hardware · Have automatic descriptor cloning · Encrypt covert OTA communication channel
Niels van Dijkhuizen

Keynterceptor NebulaH 2018

Niels van Dijkhuizen

Keynterceptor NebulaH 2018

