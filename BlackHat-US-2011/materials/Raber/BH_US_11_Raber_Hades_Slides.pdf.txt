Jason Raber Director of Cyber Research Lab
Riverside Research

¨ Why it's cool ¨ Output ¨ How it works ¨ Poor man's tutorial ¨ It slices, it dices, ... ¨ Where to get it

¨ "Some folks call it Hell, I call it Hades." ¨ Hooks both:
¡ DLL APIs ¡ Internal functions
¨ Motivation:
¡ Detours, WinAPIOverride without the weight
¨ Gets around a lot of anti-debugging tricks ¨ Free source code

(4) IP

OEP

Target Process
Foo2()

push ebp

5 bytes

mov ebp, esp mov eax, [ebp]

push eax

Foo2() jmp Trampoline push eax

Trampoline

(6)

(8)

pushad pushfd

// registers // flags

push 0x4098B0 // ID

jmp dword ptr MyHandler

MyHandler:

mov eax, 0x61 // ZwLoadDriver ID

mov edx, esp

_emit 0x0F // SYSENTER

_emit 0x34

Kernel LoadDriver()

(1) IP

Hades

(7)

1. Hook LoadDriver() 2. Copy Trampoline Code 3. Inject function reroute

push ebp mov ebp, esp mov eax, [ebp]
jmp ID+6

hooked_LoadDriver() print func, params restore_context()

IP (5)

User Kernel

(2)

(3)

DriverEntry()

Hook system call Register callback

add_hooks_for_data_mining()

reroute_function()

Trampoline

pushad

// registers

pushfd

// flags

push 0x4098B0 // ID

jmp dword ptr MyHandler

MyHandler:

mov eax, 0x61 // ZwLoadDriver ID

mov edx, esp

_emit 0x0F // SYSENTER

_emit 0x34

handle_hooked_calls()

hooked_ZwLoadDriver()

¨ ...it even debugs!
¨ If we can reroute function calls, why not instructions?
¡ Limited to one breakpoint right now ¡ One-time use breakpoint ¡ Modify away and share J

Make these modifications before adding breakpoint
hades.h
debugger.h

Short view Verbose view

Inject the runtime breakpoint

Breakpoint has been hit: handle_bp()

¨ Available from github
¡ https://github.com/jnraber/Hades
¨ POC: Jason Raber
¡ jraber@riversideresearch.org ¡ Work: 937-427-7080 ¡ Cell: 937-848-1143

