QAIS TEMEIZA &
DAVID OSWALD
Breaking Bootloaders on the Cheap

About Us
Qais Temeiza
Security Researcher Independent
@qaistemeiza

David Oswald
Associate Professor University of Birmingham, UK
@sublevado

Introduction
· Attackers have physical access to IoT/Embedded devices · Companies put locks in the devices called Code Protection · The ROM bootloader is responsible for checking if code
protection is enabled

Brief of our Research
· We analyzed the bootloaders of three widely used microcontrollers: STM8, STM32, and LPC1343
· We found a critical vulnerability in the LPC1343 bootloader · No appropriate checks for the code protection · To the best of our knowledge, the STM8 and STM32
bootloaders are secure against logical attacks

How Do Embedded Bootloaders Work?

Dumping the Bootloader
Memory Mapping Code

STM-8

Results for STM-8
· Blocks communication with the bootloader when code protection is enabled
· Loads the option byte from its region (0x004800) · Checks if the loaded value equals to 0xAA
Option Byte Loading Option Byte Comparison Invoke Bootloader Run User Code

STM-32

Results for STM-32
· A global code protection checking function that is called at the beginning of every command function
· Does not allow writing in memory even with the lowest code protection (RDP) level
· User code can access specific areas in RAM

LPC1343

Previous Research
· Chris Gerlinsky (@akacastor) did research on the LPC1343 · He managed to break CRP1 via a glitching attack · He found that CRP checks are done using the loaded CRP
value in RAM at address 0x10000184
RAM Address

LPC1343 Code Read Protection

Results for LPC1343
· Critical vulnerability in the LPC1343 write to RAM command, which lead to break the code protection
· Checks that write does not write to bootloader RAM · But no check if the write address is in the stack area !

LPC1343 Stack
0x1000 2000

0x1000 0300

0x1000 0000

CRP

LPC1343 Command Handler

Write to RAM Address Checking

LPC1343 No Stack Area Protection

Exploitation without CRP
· We kept overwriting addresses until we found the return address which is (0x10001F54)
· How? · We tried to branch the code to a function that will just print
some string as a POC

Exploitation with CRP
Call the Write command
Overwrite the return address with an address inside the read CMD function
Use a ROP gadget to prevent the device from crashing
Jump to the command handler and then repeat the exploit

Exploitation with CRP
Write CMD( )
Read CMD( ) Gadget
Some ISP( ) CMD Handler

Exploitation with CRP
Write CMD( )
CMD Handler Jump(0x1FFF1061)

Read CMD( )
Gadget ISP ( )

The Full Exploit

W 268443476 172 <- this sets the write address to 0x10001F54 then UUEncode and send to read from e.g. 0x000002FC:

Write CMD() PC Read Location

FB 0C FF 1F FF FF FF FF FF FF FF FF FC 02 00 00 BB 10 FF 1F BB 10 FF 1F BB 10 FF 1F BB 10 FF 1F 7F 11 FF 1F 00 00 00 00 81 0E FF 1F

Read CMD() PC Gadget PC

Demo (:

Summary
· We disclosed our findings to NXP -> documentation update · Bootloaders are fun and "easy" to reverse-engineer · Logical vulnerabilities are present in widely used devices · Off-the-shelf MCUs can be broken with low-cost methods
(for LPC1343 only a $5 serial-to-USB cable) · Full exploit and other codes can be found here:
https://github.com/qais744/LPC-ROP

Thanks! Questions?
Qais Temeiza (@qaistemeiza) qaiskhaled744@gmail.com
David Oswald (@sublevado) d.f.oswald@bham.ac.uk

