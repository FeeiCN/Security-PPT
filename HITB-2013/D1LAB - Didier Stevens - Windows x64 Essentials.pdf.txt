x64 Workshop Didier Stevens
Go to http://workshop-x64.DidierStevens.com

Unzip x64-workshop.zip to c:\workshop

Install:
 010EditorWin32Installer402.exe  nasm-2.10.05-installer.exe  SysinternalsSuite.zip  tdm64-gcc-4.7.1-2.exe  tdm-gcc-4.7.1-2.exe

Exercise 1: The litmus test

Start the following programs:  exercise-01-32.exe  exercise-01-64.exe

OK

Not OK

Take a look with Process Explorer Take a look with 010 Editor

Exercise 2: A C program

32 gcc: gcc -o exercise-02-32.exe exercise-02.c 64 gcc: gcc -o exercise-02-64.exe exercise-02.c

exercise-02-32.exe

exercise-02-64.exe

Exercise 3: A C dll

32 gcc: gcc -shared -o exercise-03-32.dll exercise-03.c 64 gcc: gcc -shared -o exercise-03-64.dll exercise-03.c

Exercise 4: Loading and injecting a dll

32 gcc: gcc -o exercise-04-32.exe exercise-04.c 64 gcc: gcc -o exercise-04-64.exe exercise-04.c

exercise-04-32.exe exercise-03-32.dll exercise-04-64.exe exercise-03-64.dll exercise-04-32.exe exercise-03-64.dll exercise-04-64.exe exercise-03-32.dll

exercise-04-32.exe exercise-03-32.dll exercise-04-64.exe exercise-03-64.dll exercise-04-32.exe exercise-03-64.dll exercise-04-64.exe exercise-03-32.dll

// // MessageId: ERROR_BAD_EXE_FORMAT // // MessageText: // // %1 is not a valid Win32 application. // #define ERROR_BAD_EXE_FORMAT

193L

Calc.exe, our favorite test dummy
Start calculator 64-bit and 32-bit: c:\windows\system32\calc.exe c:\windows\syswow64\calc.exe

inject-dll-32.exe 4352 exercise-03-32.dll inject-dll-64.exe 2624 exercise-03-64.dll inject-dll-32.exe 1472 exercise-03-64.dll* inject-dll-64.exe 1532 exercise-03-32.dll
* inspect memory

inject-dll-32.exe 4352 exercise-03-32.dll inject-dll-64.exe 2624 exercise-03-64.dll inject-dll-32.exe 1472 exercise-03-64.dll inject-dll-64.exe 1532 exercise-03-32.dll 76A44BC6

Exercise 5: Shellcode

nasm -o exercise-05-32.bin exercise-05-32.asm nasm -o exercise-05-64.bin exercise-05-64.asm

inject-shellcode-32.exe 1532 exercise-05-32.bin inject-shellcode-64.exe 1472 exercise-05-64.bin inject-shellcode-32.exe 3396 exercise-05-64.bin inject-shellcode-64.exe 4188 exercise-05-32.bin

inject-shellcode-32.exe 1532 exercise-05-32.bin inject-shellcode-64.exe 1472 exercise-05-64.bin inject-shellcode-32.exe 3396 exercise-05-64.bin inject-shellcode-64.exe 4188 exercise-05-32.bin

Exercise 6:
Drivers: Kernel Mode Code Signing

signtool.exe sign /v /sha1 95778C2392E6CDDAD3A725410AA7E13C6FC588EE /t http://timestamp.verisign.com/scripts/timestamp.dll ariad.sys
signtool.exe sign /v /ph /ac GSRCA.crt /sha1 95778C2392E6CDDAD3A725410AA7E13C6FC588EE /t http://timestamp.verisign.com/scripts/timestamp.dll ariad.sys

signtool verify /kp ariad-signed.sys Successfully verified: ariad-signed.sys
signtool verify /pa ariad-simple-signed.sys Successfully verified: ariad-simple-signed.sys

Exercise 7: WoW64

gcc -o exercise-07.exe exercise-07.c

Wow64DisableWow64FsRedirection
C:\Windows\System32 C:\Windows\SysWOW64

HKEY_LOCAL_MACHINE\SOFTWARE\ Microsoft\Windows
NT\CurrentVersion\Windows\AppInit_DLLs
HKEY_LOCAL_MACHINE\SOFTWARE\ Wow6432Node\
Microsoft\Windows NT\CurrentVersion\Windows\AppInit_DLLs

Exercise 8: VBA 64-bit

http://DidierStevensLabs.com
Windows x64 The Essentials videos: 25 PDF Analysis workshop videos: 25
White Hat Shellcode workshop videos: 25 Bundle of 3 workshops: 60

