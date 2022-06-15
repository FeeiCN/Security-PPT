Hacking Toshiba Laptops
Or how to mess up your firmware security
REcon Brussels 2018

whois
Serge Bazanski
Freelancer in devops & (hardware) security. Twitter: @q3k IRC: q3k @ freenode.net

Michal Kowalczyk
Vice-captain @ Dragon Sector Researcher @ Invisible Things Lab Reverse engineer, amateur cryptanalyst
Twitter: @dsredford IRC: Redford @ freenode.net

Toshiba Portégé R100

Intel Pentium M 1 GHz 256MB RAM

But there's a catch...

Quite the catch, actually. CMOS clear jumper? None to be found. Yank out the battery? Password still there.
Take a door key and pass it over the pins of things that look like flash chips hopefully causing a checksum failure and resetting the password? Nice try. No luck, though.

A-ha!

BIOS analysis

How to get the BIOS code?
Physical memory? Not with a locked-down laptop. Dump of the flash chip? Ugh.
Unpack some updates? Let's see.

Unpacking the updates https://support.toshiba.com/

7-Zip

+
254 KB of compressed data

Decompression Unknown format
Default unpacker is a 16-bit EXE There's an alternative one, 32-bit!

Decompression

BuIsFileCompressed BuGetFileSize BuDecodeFile

Decompression
Just ~50 lines of C!
... BuIsFileCompressed(compressed, &is_compressed); if (is_compressed) {
BuDecodeFile(compressed, fsize, decompressed); } ...

The result

Dumping the BIOS flash

Where to start looking

Chip Safari

RAM

Flash

Google it

Interfacing to flash chips
In-circuit: test pads or protocol that permits multi-master access
Out-of-circuit (?): desolder, attach to breakout/clip, use main communication interface

Custom breakout board
KiCAD (or $whatever, really) PCB design. Thermal transfer for DIY PCB manufacturing. Hot air gun to desolder, soldering station to
re-solder.

Tools you'll need

3eur

150eur

50eur

Hackerspace
25eur p/m + BYOB

FPGA board (Spartan 3E) Kabelsalat
Flash

Setup

PC

UART (2 wires)

FPGA Devboard

Gimme block X

1kB of data

A/A Mux (~30 wires)

Flash Breakout Board

X * 1024 Data word

X * 1024 + 4 Data word

X * 1024 + ... Data word

Setup issues

Mixed them up.

PC

UART (2 wires)

FPGA Devboard

Gimme block X

Forgot checksums

1kB of data

A/A Mux (~30 wires)

Flash Breakout Board

X * 1024 Data word

X * 1024 + 4 Data word

X * 1024 + ... Data word

But why the FPGA?
Using an FPGA was unnecessary - just needed a bunch of I/O. Comparatively difficult to develop for. And to debug.
Should've gone for a uC with a bunch of I/O or with a multiplexer.
But at least now we know ¯\_()_/¯ .

BIOS code analysis

How to start?

CPU mode? Entry point? Memory map?

CPU start
"A hardware reset sets each processor's registers to a known state and places the processor in real-address mode."
Intel® 64 and IA-32 Architectures Software Developer's Manual Volume 3

CPU start
We start at the address: CS:EIP = CS.Base + EIP = 0xFFFFFFF0 Real Mode  physical address. A20 enabled.
So, what's there?

Memory mapping
Northbridge: Intel Odem MCH-M No info about that region  let's check the
southbridge

Memory mapping Southbridge: Intel ICH4-M
FWH = Firmware Hub = BIOS flash Out dump has exactly 0x80000 bytes!

Even more mappings... ...

Entry point

FFFFFFF0: jmp far FC00:3FA0

000FFFA0: jmp far FC00:00A2

000FC0A2: 000FC0A3: 000FC0A4: 000FC0A6:

cli cld mov al, 2 out 92h, al ; Enable A20
...

BIOS RE: Initialization No stack! (and also no RAM)
16-bit Protected Mode + Unreal Mode Checksums
RAM initialization Self-copying into RAM

BIOS RE: Initialization
16-bit Protected Mode  segments! We have to find and parse GDT
Only then we can analyze the code

BIOS RE: The password check

BIOS RE: The password check
Everything eventually lands up in one function f(in_buf)  out_buf
After long analysis: all bytes are sent to I/O ports 62h and 66h

BIOS RE: The password check From the southbridge manual:
Table 6-2. Fixed I/O Ranges Decoded by Intel ICH4

"Microcontroller"???

EC/KBC
CPU Intel Pentium M
HDD Ethernet

GPU Trident XP4
Northbridge Intel Odem
MCH-M
Southbridge Intel ICH4-M

RAM
Audio BIOS

PSC

EC/KBC Renesas M306K9FC
LRP

Battery Keyboard Touchpad

LPC

EC: Dump

How to obtain the code?

Updates!

EC: Dump No updates available
BIOS changelog: nothing about the EC Maybe a similar laptop model? Portégé S100!

EC: Updates

Inside: 3 update blobs (different versions)

EC: Update installer Uses ports 62h & 66h
Sends the 1st part (~2,5KB) Sends the 2nd part (~100KB)

EC: Update blob It's decoded inside EC - no code available :( Let's try some analysis!

EC: Update blob - analysis High entropy  encryption or compression No regularities in trigrams  encryption Size always divisible by 8  encryption
Longest repeated substring is short  if encryption, then not ECB

EC: Update blob - analysis Looks like a dead-end...

Serge, could you please desolder something again...?

EC..?

One last breakout later...

Let's dump this thing.

EC: Programming Protocol

Programmer

SCLK RXD TXD Busy

M16C

EC: Programming Protocol

EC: Programming Protocol
Programmer

M16C

Flash Page X? Flash Page X

Not so fast

EC: Programming Protocol
Programmer ID Check (K0...K6) Status?
Status (Unlocked/locked)
Flash Page X? Flash Page X

M16C

Side channel attacks?
Fault injection?

Not so fast.

Software level `side' channels

An PIN unlock request does not result in any immediate success/failure transmission, but...

Hmm.

EC: M16C bootloader bug Let's run some quick tests.

EC: M16C bootloader bug

Response time (s)

EC: M16C bootloader bug
Byte

Well that's not good.

EC: M16C Bootloader bug

Programmer

Response time measurement

M16C

Average time + 3s

ID Check - 00 FF FF FF FF FF FF ID Check - 01 FF FF FF FF FF FF ID Check - 02 FF FF FF FF FF FF ID Check - .. FF FF FF FF FF FF ID Check - FE FF FF FF FF FF FF ID Check - FF FF FF FF FF FF FF

EC: M16C Bootloader bug

Programmer

Response time measurement

M16C

Average time + 3s
Ergo, the first byte of the key is 02.

ID Check - 00 FF FF FF FF FF FF ID Check - 01 FF FF FF FF FF FF ID Check - 02 FF FF FF FF FF FF ID Check - .. FF FF FF FF FF FF ID Check - FE FF FF FF FF FF FF ID Check - FF FF FF FF FF FF FF

EC: M16C Bootloader bug
Thus, we can enumerate all bytes of the key one by one, using the timing difference for each correct byte to reduce our search to just 0x100*7 checks.
And we get the key.

EC: M16C Bootloader bug

EC: M16C Bootloader bug
FPGA (iCE40)
(EC) M16C

EC: M16C Bootloader bug
PoC || GTFO
https://github.com/q3k/m16c-interface/
(note: doesn't work for all M16Cs... yet)

EC: RE

Code (~700 functions)

R/O data Crypto Bootloader

EC: RE Much simpler code than in the BIOS No strings
We're looking for LPC communication and BIOS-call table

EC: RE Finding the table is easy
~100 different BIOS<->EC calls We know the numbers of the interesting calls 
let's analyze the handlers! Sounds easy...?

EC: RE of the handlers Manual context-switching
No common call convention Handlers aren't split into functions Jumps to the middle of other functions

Password check: BIOS out_buf = call_EC(
func=0x24, in_buf=MD5(input)[:8] + pwd_type )
out_buf[0] == 0  success

Password check: EC

Let's look at the handler on the EC side...

...6 levels down the call hierarchy:

BMGEU/C p6_4, p6 BSET pd6_4, pd6 JSR.W set_p6_5 JSR.W clear_p6_5

I/O on pins 40 & 41

Password check: EC Oh, come on... :(

Password check: EC This time it's only an EEPROM :)
EC reads one block, decrypts it and compares with the received MD5

Challenge/Response Screw it, we're looking for a universal attack Let's look at the challenge/response!

Challenge: BIOS
out_buf = call_EC( func=0x1A, in_buf=rdtsc() + MD5(pc_serial)[:8]
) challenge = bytes_to_string(out_buf)

Challenge: EC

RDTSC Entropy pool

PC_SERIAL_MD5

7 random bytes

Checksum

ENC

DEC

CHALL 1

CHALL 2

Response: BIOS out_buf = call_EC(
func=0x1B, in_buf=string_to_bytes(user_input) )
out_buf[0]  success/fail

RESP 1

RESP 2 7 bytes CHK

PC_SERIAL_MD5

CHALL 2

Verify checksum
DEC

DEC

ENC

== 0?

EC: Encryption

ENC? DEC?

EC: Encryption A custom 64-bit block cipher
INPUT (8B)

KEY A (256B)

ENC

KEY B (128B)

OUTPUT (8B)

Challenge/Response We just need to rewrite it in Python and ...

DEMO!

EC: Update system Let's decrypt the updates!

EC: Update system Uh, symmetric signatures? We can generate our own!

So, how's it like on their newer laptops?

If it ain't broke, don't fix it!

(that applies to keys, too)

Impact
Unlocking any (business) laptop. Permanent rootkit in the EC.
We can attack the host from the EC.

Rootkit in EC?
DMA to the host via LPC (not supported by this particular EC) . Keylogging & storage.
USB-Rubber-Ducky-like (key/mouse injection). BIOS exploitation via the internal API.

Official Toshiba statement (from 2017-11-02)
Toshiba is working on a temporary BIOS update that can be used to prevent the security issue that has been raised and expects to release this update on its website within the next 2 weeks.
Toshiba plans to start the release of a permanent fix for some models from January, 2018 and will complete the releases of permanent fix for all applicable models by the end of March 2018.

Questions?

https://q3k.org/slides-recon-2018.pdf

