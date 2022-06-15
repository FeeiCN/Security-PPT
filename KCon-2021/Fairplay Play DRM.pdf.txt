FAIRPLAY DRM

DRM
0 1

Fairplay - DRM

 // App DRM2013 
0 1

Fairplay - DRM
Load Command
$ otool -l target | grep -i crypt cmd LC_ENCRYPTION_INFO_64
cryptoff 16384 cryptsize 4177920
cryptid 1
0 1

Fairplay - DRM
Fairplay Open - From Kernel
0 1

Fairplay - DRM

Fairplay Open - MIG

#include <mach/std_types.defs> #include <mach/mach_types.defs>
subsystem KernelUser unfreed 502;

FairplayIOKit

type unk1_t = struct[136] of char; type unk2_t = struct[84] of char;

routine fairplay_open(

fairplay_port : mach_port_t;

executable_path : pointer_t;

cpu_type cpu_subtype

: uint32_t; : uint32_t;

out supf

: pointer_t;

out unk_ool2 : pointer_t;

out unk1

: unk1_t;

out unk2

: unk2_t;

out supf_size : uint32_t;

out ool2_size : uint32_t;

out ukn3

: uint32_t);

fairplayd

0 1

Fairplay - DRM
Fairplay Open - fairplayd
$ tree .  SC_Info   target.sinf   target.supf  target
0 1

Fairplay - DRM
Fairplay Open - SINF

$ sinf_view.py SC_Info/target.sinf sinf.frma: game sinf.schm: itun sinf.schi.user: 0xdeadbeef sinf.schi.key : 0x00000002 sinf.schi.iviv: <***16 bytes IV***> sinf.schi.righ.veID: 0x00012345 sinf.schi.righ.plat: 0x00000000 sinf.schi.righ.aver: 0x11223344 sinf.schi.righ.tran: 0x11223344 sinf.schi.righ.sing: 0x00000000 sinf.schi.righ.song: 0x11223344 sinf.schi.righ.tool: P550 sinf.schi.righ.medi: 0x00000080 sinf.schi.righ.mode: 0x00000000 sinf.schi.righ.hi32: 0x00000002 sinf.schi.name:<***null terminated username, 256 bytes***> sinf.schi.priv: <***432 bytes encrypted data***> sinf.sign: <***128 bytes signature***>

0 1

Fairplay - DRM
Fairplay Open - SUPF

$ supf_view.py SC_Info/target.supf KeyPair Segments:
Segment 0x0: arm_v7, Keys: 0x3d0/4k, sha1sum = <code_sig> Segment 0x1: arm64, Keys: 0x3fc/4k, sha1sum = <code_sig>
Fairplay Certificate: <RSA 1024 Ceritificate, valid since 2008, expire at 2013>
RSA Signature: <128 bytes>

0 1

Fairplay - DRM
Fairplay Open - QA
1. RSA, RSA 3. SINF() 4. MIG + HookFairplayd 5. DRM/ 6. SINFsinf.signinstalld
0 1

Fairplay - DRM
Fairplay Decrypt - Kernel
0 1

Fairplay - DRM
Fairplay Decrypt - 
1. Fairplay page4096 bytes 2. aes-128-cbcFairplay Open 3. HW AES(S8000)
0 1

Fairplay - DRM
Fairplay Decrypt - Demo
0 1


0 1

Fairplay ­ 
 vs makeOpaque Constant Folding, Common Subexpression Elimination, Dead Code Elimination....
makeOpaque: 
Expression* makeOpaque(Expression* in)
0 1

Fairplay ­ 
makeOpaque: 
makeOpaque(true) => uint32_t x = random(); ( (x * x % 4) == 0 || (x * x % 4) ==1)
0 1

Fairplay ­ 
makeOpaque:  BogusCFG
if(makeOpaque(true)){ real_block();
}else{ fake_block();
}
0 1

Fairplay ­ 
makeOpaque: 
//a: 4872655123ra: 3980501275  uint32_t x = random(); uint32_t c = 0xbeefbeef; // -ra * c = 0x57f38dcb,  ((x * 4872655123) + 0xbeefbeef ) * 3980501275 + 0x57f38dcb == x
0 1

Fairplay ­ 
makeOpaque:MBA 
//OperationSet(+, - , * , & , | , ~) makeOpauqe(x ­ c) => (x ^ ~c) + ( (2 * x) & ~(2 * c + 1) ) + 1;
0 1

Fairplay ­ 
makeOpaque:IndirectBranch
//OperationSet(+, - , * , & , | , ~) jmp branch; => jmp global_branch_lut[index]; => jmp global_branch_lut[makeOpauqe(index)];
0 1

Fairplay ­ 
 ­ Call Graph 
Indirect Branch + Call Convention   LLVMInter-procedure 
0 1

Fairplay ­ 
 ­ Call Graph 
    
0 1

Fairplay ­ 
 ­ CFG

1. Indirect Branch 2. 
PAC Modifier 3. DYLD Chained Fixup
Modifier 4. 



0 1

Fairplay ­ 
 ­ CFG

1. Indirect Branch 2. 
PAC Modifier 3. DYLD Chained Fixup
Modifier 4. 



0 1

Fairplay ­ 
 ­ 
1. ,  
0 1

Fairplay ­ 
-""
1. FairplayIOKit 2. dyld  3. 
0 1

Fairplay ­ 
-

(trapfuzz)

(trapfuzz )

single-step

DTrace: exception-emulationrecover

0 1

Fairplay ­ 
-Demo
0 1

Fairplay ­ 
-
WIP macho WIP machoProfiler Update @ https://github.com/pwn0rz/fairplay_research
0 1


KCon 
M A N O E U V R E

