Breaking Secure Bootloaders

Talk Outline
Smartphones often use signature verification to protect their firmware This is implemented in bootloaders, which can also provide facilities for firmware updates Weaknesses in these update protocols can be exploited to bypass signature protections The core SoC and peripheral chips are both potential targets for attack

Biography
Christopher Wade
Security Consultant at Pen Test Partners
@Iskuri1 https://github.com/Iskuri
https://www.pentestpartners.com

Project One ­ The SDM660 Android Bootloader
I had purchased an Android phone to do mobile research I needed root access in order to use all of my testing tools This required unlocking the bootloader, which disables signature verification protection This required an unlock tool from the manufacturer

Custom Bootloader Unlock Functionality
Some smartphone manufacturers modify the bootloader to require custom tools for bootloader unlocking, or to remove bootloader unlocking entirely
This often requires creating a user account and waiting for a period of time
Unlocks are performed using custom USB fastboot commands
There are numerous reasons why these restrictions are placed on their hardware:
· Inexperienced users will not be tricked into deliberately weakening phone security · Third parties can't load the devices with malware before sale · The manufacturer can track who is unlocking their bootloaders

Common Android Bootloader Protection
Analysis of an unlock on the phone was performed using USBPCAP
An 0x100 byte signature was downloaded from the manufacturer's servers and sent to the phone
This was verified by the bootloader, which unlocked its restrictions
I decided to use an older phone to analyse this functionality
I set myself a challenge to break this functionality before the end of the seven day waiting period

Target Device
Mid-range phone released in 2017 Uses a Qualcomm Snapdragon 660 chipset ­ ARM64 architecture I had previously unlocked the bootloader, but could lock it again for the project Bootloader had been modified to add further custom functionality

Fastboot
Command interface for most Android bootloaders
Uses a basic USB interface ­ commands and responses are raw text
reboot flash: download: oem device-info oem unlock etc

Implementing Fastboot
Easy to implement using standard USB libraries
Sends ASCII commands and data via a USB bulk endpoint
Returns human-readable responses back asynchronously via a bulk endpoint
Libraries exist for this purpose, but are unnecessary

ABL Bootloader
Provides Fastboot USB interface and verifies and executes Android Operating System Accessed via ADB, or button combinations on boot Stored in "abl" partition on device as a UEFI Filesystem This can be extracted with the tool "uefi-firmware-parser", to find a Portable Executable Qualcomm's base bootloader has source code available, but can be modified by vendors

Analysing The Bootloader
Fastboot commands are stored in a table as text commands and function callbacks
This can aid in identifying any hidden or non-standard commands
Changes in functionality of commands is also easy to identify
Logging strings in code help with identifying functionality

Identifying A Potential Bootloader Weakness
The "flash:" command usually only flashes partitions on unlocked bootloaders
The command had been modified by the manufacturer to allow flashing of specific custom partitions when the bootloader was locked
These partitions were handled differently from those implemented directly by Qualcomm
There was potential for memory corruption or partition overwrites in this custom functionality

Implementing the flash: command

I made assumptions about the command sequence:

Actual command sequence:

My command sequence:

· download:<payload size> · <send payload> · flash:<partition>

· flash:<partition> · <send payload>

I accidentally left an incorrect "flash:" command after my command sequence

This resulted in the bootloader crashing after sending this second "flash:" command

The lack of a "download:" command before the payload was the likely cause

Analysis Of Crash
USB connectivity stopped functioning entirely
The phone required a hard reset ­ volume down + power for ten seconds
A smaller payload size was attempted ­ this did not crash the phone
A binary search approach was used to identify the maximum size without a crash
By rebooting the phone and sending sizes between a minimum and maximum value, the minimum size was found - 0x11bae0

Overwriting Memory
Due to the unusual memory size, this was assumed to be a buffer overflow
With no debugging available for the phone, identifying what memory was being overwritten would be difficult
The bootloader used stack canaries on all functions, which could potentially be triggered
The next byte was manually identified ­ 0x11bae1 bytes of data were sent, and the last byte value was incremented, if the phone didn't crash it was valid
The next byte was identified to be 0xff

Overwriting Memory
By constantly power cycling, incrementing the byte value, and moving to the next byte in the sequence, a reasonable facsimile of the memory could be generated
This would not be the exact memory in use, but enough to not crash the bootloader
Once this was generated, it could potentially be modified to gain code execution
A way of automating this process to retrieve more bytes was required

Automated Power Cycling
It was suggested that removal of the phone battery and a USB relay could automate power cycling the phone
This would require removing glue from the phone case to access the battery
Instead, a hair tie was wrapped around the power and volume down buttons
This caused a boot loop which allowed USB access for sufficient time to test the overflow

Memory Dumping
The custom fastboot tool was modified to attempt this memory dumping
It verified two key events ­ a "flashing failed" response from the command being sent to the phone, and whether it crashed afterwards
Each iteration took 10-30 seconds

Memory Dumping
The phone was left overnight performing this loop
This generated 0x34 bytes of data which did not crash the phone
The repeated byte values and lack of default stack canary meant that this was likely not to be the stack
All of the 32-bit words were found to be valid ARM64 opcodes

FF 43 02 51 60 02 00 0C 60 02 00 0C 60 02 00 0C 60 02 00 0C E8 00 00 B0 34 00 00 10 01 00 00 0A 08 0D 40 F9 00 00 00 08 C0 00 04 0B 60 02 00 0A D3 9F FF 97

Unknown Memory Analysis
Most opcodes, while valid operations, would not be the same as in the bootloader Stack management and branch operations would have to be almost exact Searching for the "SUB WSP" and "BL" opcodes in the bootloader yielded no results

ARM64 Features
ARM64 operations can often have unused bits flipped without altering functionality
Registers can be used in both 32-bit (Wx) and 64-bit (Xx) mode
Branch instructions can have conditions for jumping
These features could superficially allow for changes to the stack and branch handling instructions without altering functionality

Identifying Similar Instructions
I decided to use the "BL" instruction, it was likely to be less common than the stack
I performed a text search, removing the first nybble from the opcode
This would find branches in a similar relative address space to the dumped opcode
This identified a single valid instruction in the "crclist" parser, and opcodes that were similar to the memory dump

Outline Of Buffer Overflow
Analysis of the offsets showed that the bootloader was overwritten after 0x101000 bytes of data
The bootloader is executed from RAM, as demonstrated by this overflow
The original bootloader binary, found in the partition, could be fully written using the overflow to prevent any subsequent crashes
This binary could be modified to run any required unsigned code

Unlocking The Bootloader
To unlock the bootloader, it was necessary to jump to the code after the RSA check
A simple branch instruction could be generated to jump to the relative address of the bootloader unlock function
Online ARM64 assemblers are available to rapidly generate these opcodes
This process would be difficult to debug, but success would be easy to identify

Replicating The Vulnerability
I was able to procure a second smartphone which also used an SDM660 All bootloader unlocking functionality was disabled by the manufacturer on this device It was identified to use a similar signature verification approach to the original phone

Custom Bootloader Unlock
Using an OTA image, the bootloader was analysed
This showed the code which blocked the bootloader unlock
No hidden bootloader commands were identified on the device, however some OEM commands were noted

Differences In Memory Layout
Initially, the old crash was attempted The device still functioned, implying the vulnerability may not be present A much larger payload size was sent ­ 8MB This crashed the phone, implying that the memory layout was different to the original Manual analysis demonstrated that the bootloader was overwritten after 0x403000 bytes, different to the 0x101000 on the first device With this, a bootloader unlock could be rapidly developed

Patching Bootloader Unlock
A single branch instruction was identified, which sent an error response or unlocked the bootloader, depending on whether the signature was accurate
This could be replaced with a NOP instruction, bypassing this check
This allowed the bootloader to be unlocked, and the phone to be rooted
The vulnerability was disclosed directly to Qualcomm, due to its potential existence on all SDM660 based phones

Bypassing Qualcomm's Userdata Protection
Qualcomm's chips encrypt the "userdata" partition, even when no passwords or PINs are used
This prevents forensic chip-off analysis, and access to users' data via bootloader unlocking
If an unlocked bootloader tries to access the partition, it is identified as being "corrupted" and is formatted
Bypass of this protection could allow access to user data via physical access

Bypassing Qualcomm's Userdata Protection
Using Qualcomm's source code, this encryption process could be analysed Encryption keys are intentionally inaccessible, even with code execution The code uses an internal EFI API to decrypt the partition, which was unmodifiable The API verifies whether it is unlocked, and whether the firmware is signed

Time Of Check To Time Of Use
The "boot" fastboot command loads and executes Android images deployed via USB
It was noted that verification and execution of the image were two separate functions
There was a high likelihood that the image could be changed between verification and execution
This could bypass bootloader unlocking protections while accessing the encrypted partition

Modifying Boot
The "boot" command receives the full Android "boot" image, via the fastboot "download:" command
This is loaded into RAM, verified and executed
By patching the "boot" command, the behaviour could be altered for a TOCTOU attack
Instead of sending one image, two could be sent, and swapped after verification
A tool was created, which sent three pieces of data to achieve this: a four byte offset, a signed image, and an unsigned, malicious image

Patching In Functionality
The "boot" command does not function on locked bootloaders
The check for the lock state was replaced with an operation for moving the image pointer up by four bytes ­ to the signed image
The image at the moved pointer would then be verified

Patching In Functionality
Function calls occur between verification and booting
These are unnecessary to boot Android, and could be overwritten
This allowed for five spare instructions to be patched in
This would be sufficient to change to the unsigned image

Patching In Functionality
Four additional instructions were required:
· Move pointer back to start of payload - sub x19, x19, 4 · Read offset value - ldr w22, [x19] · Add offset value to pointer - add x19, x19, x22 · Push new pointer value to "Info" structure "ImageBuffer" pointer - str x19, [x21,#0xa0]
These would be sufficient to swap the signed image with the unsigned image
Patching this code and executing it was found to be effective, facilitating the TOCTOU attack
This could allow for running unsigned Android images without unlocking the bootloader

Tethered Root
Unlocking the bootloader wipes all user data
Permanent rooting exposes the device to greater risk
A device being permanently rooted is not a necessity for most phone users
By deploying a rooted Android image via this TOCTOU attack, these problems can be resolved, as rebooting will remove the root capabilities
These can easily be generated using the Magisk app

Lockscreen Bypass
By accessing the unencrypted userdata partition, one can remove lockscreen restrictions
By using a custom recovery image, such as TWRP, or by modifying the Operating System, it is possible to gain access to all apps and stored data

Backdooring Encrypted Phones
Via developer functionality, further encryption can be placed on the userdata partition
This adds a password requirement, which forces a password to be input as the device is booting
The Android "boot" image, where the kernel and root filesystem are stored, is not encrypted
It is possible to add a reverse shell to the image, to access the data later

Backdooring Encrypted Phones

Disclosure and Impact
The TOCTOU attack was disclosed to Qualcomm
The attack was only possible with the initial buffer overflow vulnerability
Patching of the phone to prevent this attack would be difficult, due to its usage of internal, unmodifiable APIs
These weaknesses could allow an attacker with physical access to an SDM660-based phone to bypass all bootloader locking mechanisms

Project Two ­ The NXP PN Series
The NXP PN series is a set of chips used for NFC communication in smartphones and embedded electronics
By breaking the firmware protections on these chips, one could add new NFC capabilities
The NXP PN series is extremely popular in smartphones, and any exploits would be transferrable to a large number of devices

NXP PN553
NFC chip used solely in mobile devices PN553 bears similarities with the PN547, PN548, PN551 and PN5180 All use a similar firmware update files and protocol All use ARM Cortex-M architecture Little public research available

Protocol
Communicates via I2C interface - /dev/nq-nci Utilises NCI for NFC communication, the standard NFC protocol Custom protocol in use for firmware updates Communication can be traced via ADB logcat

Forcing Firmware Updates
Tracing firmware updates can help in reverse engineering the protocol in use
Firmware updates only occur when signed firmware versions differ
Base Android image contains a main firmware image and recovery image libpn553_fw.so libpn553_rec.so
Swapping these files can force the update to occur
Each function can be traced against source code

Bootloader Firmware Update Protocol
Unique to NXP chips
Structure: 1 byte: Status 1 byte: Size 1 byte: Command x bytes: Parameters 2 bytes: CRC-16
Encapsulated in 0xfc byte chunks for large payloads

Interfacing with device files
Reads and writes to /dev/nq-nci translate to communication over I2C Chip can be configured via IOCTL functions These can set power mode and enable/disable firmware update mode

Firmware File Format
Firmware files are kept in ELF files ­ libpn553_fw.so This file has one sector, which contains binary formatted data This data contains the commands that run in sequence for firmware updates These commands can be extracted to rebuild the firmware image

Firmware Update Process
The C0 write command is used throughout
The first command contained unknown, high entropy data
All subsequent commands contained a 24-bit address, 16-bit size, data payload, and an unknown hash
These commands were required to be sent in the sequence they were stored in the update file

Stitching Firmware Updates
Memory addresses at the start of commands aided reconstruction of firmware
Firmware data was very small
Multiple references to code in inaccessible memory locations were noted
The core system functionality was likely to be stored in the bootloader

Memory Read Commands
Two commands were found to read back memory from the chip ­ A2 and E0
A2 was found to read memory from a provided address ­ limited only to memory that could be written during firmware updates
E0 was found to calculate checksums of memory, and provide four bytes of configuration data

RSA Public Key
Large block of random data was referenced in E0 memory dump ­ sized 0xC0 0x10001 (65537) was found after this block These could be the modulus and exponent for a public RSA key This size aided in identifying the signature of the firmware update

Unknown Hash
Block write commands end with a 256-bit hash This was assumed to be SHA-256, but did not match the contents of the packet Multiple other hashing algorithms were attempted, with no valid results It was identified that the hash was for the next block in the sequence

Hashing Process
The first C0 command contains a version number, SHA-256 hash, and signature of the hash
This is a hash of the next block, which contains an additional hash
This cascades through the firmware update, with each subsequent block having a matching hash
This guarantees that all written blocks are valid, without verifying the entire update at once
The final block has no hash, because it has no subsequent block

Fuzzing
Targeted fuzzing was performed on both the Firmware Update and NCI interfaces
The chip was found to contain hidden, vendor-specific configs, accessible via the standard NCI Config Write command
Bitwise incrementing values were written to these configurations, which prevented the main firmware from continuing to function, bricking the core functionality of the chip
The bootloader still functioned, but the configurations could not be overwritten

Weaknesses in the Firmware Update Process
It was noted that the last block of the firmware update could be written multiple times, despite the hash-chain
This implied that the hash of the previous block remained in memory
There was a potential opportunity for overwriting this hash in memory
An invalid command, the same size as a firmware update block, was sent between these packets
This prevented the last block from being written, implying the hash had been overwritten in memory

Bypassing Signature Verification
Modified hashes could be written in the right portion of memory
The ability to overwrite the hash meant that the hash chain could be broken
This would allow writing of arbitrary memory blocks to the chip, by generating a valid hash
This could bypass the signature verification mechanisms of firmware updates, and allow us to overwrite the broken config

Repairing the Firmware
Using a dump of the working config, the new config could be hashed and written This repaired the chip, and proved that arbitrary memory writes were possible The next goal was to dump the bootloader from the chip

Patching New Features
All standard functions were stored in the bootloader, with limited functionality in the firmware update
The NCI Version Number command was part of the firmware update
The version number was easy to identify in memory, and its function references
A function was called using the version number and a pointer
This was identified to be a memcpy function

Patching New Features
The Branch instruction to the function could be overridden to point to a custom function
Using C and the gcc "-c" flag, a custom function could be written
Its effect on the version number command could be observed after flashing
The lack of data in the response implied that it was a memcpy for the return message

Patching New Features
The location of RAM was assumed to be at 0x100000, due to the firmware referencing this address space
The overridden memcpy was changed to search for a unique value in RAM, sent in the NCI command
This provided a global pointer to command parameters at 0x100007
This could then set a pointer to arbitrary memory
Using this functionality, the bootloader could be dumped

Dumping The Bootloader
The entire memory was stitched from the read commands This could be disassembled, demonstrating it was valid This functionality could be extended to modify the core NFC functionality of the chip

Replicating The Vulnerability ­ PN5180
The PN5180 is a chip often used by hobbyists for NFC connectivity It has a similar architecture to the PN553, but uses a custom communication protocol Can be communicated with via an SPI interface and GPIO pins The firmware update process was the same, allowing the signature bypass to be replicated

Replicating The Vulnerability ­ PN5180
A command in the chip's communication protocol read memory from a specific part of the EEPROM
This pointer was found in the firmware payload
By overwriting this and redeploying the firmware, the chip's bootloader could be read, without functional code changes

Impact
The vulnerability was likely to be available on similar chipsets
This could allow an attacker with access to firmware updates to completely take over the chips
This would provide the capability to add custom and malicious NFC functionality
On smartphones, this would require full root access to the device
In hobbyist projects, this would expand the capabilities of the chip

Disclosure
The vulnerability was disclosed to NXP in June 2020 They confirmed that it affected multiple chips in their product line A long remediation period was requested, with public release permitted in August 2021 Alteration of a primary bootloader is a complex task, which could risk bricking the chip The current generation of NXP NFC products, including the SN series, are not affected Remediation across all affected chipsets was performed in phased rollouts

Conclusion
Special thanks to Qualcomm and NXP for remediating the findings Firmware signature protection is only as good as its implementation Common chips are great targets, as they have high impact Bootloader vulnerabilities are common, even in popular hardware

End

