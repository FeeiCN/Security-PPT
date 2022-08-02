The development of Windows 8 followed the Security Development Lifecycle (SDL)
which defines best practices for secure software design, implementation, and
testing.

Windows 8 includes new protections against root and boot kits. UEFI systems
prevent malware from starting before Windows and protects the remainder of the boot process, including early launch
antimalware software.

Windows 8 includes numerous security features, such as mitigations, that make it difficult and costly for malware authors to develop reliable exploits for vulnerabilities.

Windows Defender is shipped with every edition of Windows 8 and Internet
Explorer's Application reputation features have been moved into the platform such that users are protected regardless of the
browser they use.

4

Attackers want to maximize ROI

Use sandboxing to protect user privacy & data

CheaFpinlydfainndd vulneerlaimbiilnitaietes (theyvuolnleyranbeielidty
ocnlaes) ses

Attacker Return

=

Gains per use

X

-

Opportunities to use

Cost to acquire vulnerability +
Cost to weaponize

We want to minimize ROI

wMfinoUamdrxseiouienxmwspiwtmiielnzooilinegefzitdmettaiohmnaewettetrayctko

Break cookbook Chetaepclhyndiqevueelsop&
meaxkpeloeitxsploits unreliable

Today we will describe exploit mitigation improvements in Windows 8 that increase the cost of developing reliable exploits 5

Stack-based vulnerability

VOID Function(LPCSTR Input) { CHAR Buffer[256]; strcpy(Buffer, Input);
}

Linear return address overwrite
GS v1
(2002)

Linear local variable overwrite

GS v1.1
(2003)

GS v2
(2005)

GS v3
(2010)

Linear parameter overwrite

Linear SEH record overwrite

SafeSEH
(2003)
SEHOP
(2008)

Non-linear/ backward overwrites (e.g. a[n] = 0)

Stack-based exploitation and mitigation techniques

Control of Instruction
Pointer
6

Heap-based vulnerability

VOID Function(LPCSTR Input) { PCHAR *Buffer = malloc(256); strcpy(Buffer, Input);
}

Coalesce unlink
overwrite
Safe unlinking
(2004)

FreeList[] attacks

Heap-based exploitation and mitigation techniques

Lookaside list attacks

Heap cache attacks

LFH FreeEntryOffse
t attack

Application specific data
overwrites

Use-after-free/ Double free/ Dangling pointer

Vista heap hardening
(2006)
Overwrite or control a function pointer

Control of Instruction
Pointer
7

Control of Instruction
Pointer

eip=41414141 esp=0023f7dc ebp=0023f808...

cs=0023 ss=002b ds=002b es=002b fs=...

41414141 ??

???

Execute code from
stack

Execute code from heap (incl. heap spray)

DEP
(2004)

Executing arbitrary code after gaining control of EIP

Execute JIT'd code
(JIT spray)

Execute code from a loaded image

IE9 JS JIT mitigation
s
(2011)

Return-into-libc (many variants)

Return oriented programming (ROP)

Predictable mappings/info
leaks

ASLR
(2006)
Arbitrary code execution
8

Most systems are not compromised by exploits

· About 6% of MSRT detections were likely caused by exploits [29]
· Updates were available for more than a year for most of the exploited issues [29]

Most exploits target third · 11 of 13 CVEs targeted by popular exploit kits in 2011 were for issues

party applications

in non-Microsoft applications [27]

Most exploits target older versions of Windows (e.g.
XP)

· Only 5% of 184 sampled exploits succeeded on Windows 7 [28] · ASLR and other mitigations in Windows 7 make exploitation costly [30]

Most exploits fail when mitigations are enabled

· 14 of 19 exploits from popular exploit kits fail with DEP enabled [27] · 89% of 184 sampled exploits failed with EMET enabled on XP [28]

Exploits that bypass mitigations & target the latest products do exist

· Zero-day issues were exploited in sophisticated attacks (Stuxnet, Duqu) · Exploits were written for Chrome and IE9 for Pwn2Own 2012

Bottom line: we must continue to increase the cost of exploitation for attackers

9

Objec&ves     
Mi5gate  en5re   classes  of  
vulnerabili5es     
Break  known   exploita5on   techniques  
   Increase     the  cost  of   exploita5on  in   key  domains  

Code  Genera5on  Security   Address  Space  Layout  Randomiza5on  
Windows  Heap   Windows  Kernel   Default  Se=ngs  

10

Enhanced  /GS,  range  checks,  sealed  op5miza5on,  and  virtual  table  guard  
11

"

1

"

"

"
12
"

CHAR Buffer[256]; UINT i; // possibly attacker controlled

if (i >= ARRAYSIZE(Buffer)) {

 compiler inserted

__report_rangecheckfailure();

}

Buffer[i] = 0;

" "
13

Without sealed

COptionElement *optionElement; optionElement->IsEnabled();

With sealed

mov rax,qword ptr [rcx] call qword ptr [rax+920h]

call CElement::IsEnabled

" "

14

Probabilis5c  mi5ga5on  for  vulnerabili5es  that  enable  vtable  ptr  corrup5on  

IE10  has  enabled   this  for  a  handful  of   key  classes  in     mshtml.dll  

Enabled  by  adding  an  annota5on  to  a  C+ +  class  

CElement::`vWable'   VirtualMethod1   VirtualMethod2   VirtualMethod3   VirtualMethod4  
...   _vtguard  

mshtml!CElement::Doc:   63700e70  mov          eax,dword  ptr  [ecx]   63700e72  cmp          [eax+1B8h],offset  mshtml!_vtguard     63700e7c  jne          mshtml!CElement::Doc+0x18  (63700e88)   63700e7e  call        dword  ptr  [eax+0ACh]   63700e84  mov          eax,dword  ptr  [eax+0Ch]   63700e87  ret   63700e88  call        mshtml!__report_gsfailure  

Extra  entry  added  to  vtable.     ASLR  makes  this  entry's  value  
unknown  to  the  a@acker.  

Check  added  at  virtual  method  call  sites.     If  vtable[vtguard_vte]  !=  vtguard     then  terminate  the  process.  

15  

Force ASLR, bottom-up/top-down randomization, and high entropy
16

"

"

2

"

3

"

4

"

5

17

0:000>  !dh  dirapi   ...   4B4C111C  &me  date  stamp  Mon  Jan  11  22:05:16  2010   ...           1000  base  of  code                     ----------  new  ----------   68000000  image  base           1000  sec&on  alignment   ...   00001000  size  of  heap  commit                 0    DLL  characteris&cs       187A80  [        402F]  address  [size]  of  Export  Directory       1869F4  [            C8]  address  [size]  of  Import  Directory       19B000  [      12178]  address  [size]  of  Resource  Directory  

Images  are  not     randomized  unless  the     DYNAMIC_BASE  bit  is  set  

" "
"
Outcome:  aaackers  can  no  longer  rely  on  non--ASLR  images  
18  

Top--down  alloca5ons  
(PEBs,  TEBs,  MEM_TOP_DOWN)  

Windows  7  
· Heaps  and  stacks  are  randomized   · PEBs/TEBs  are  randomized,  but  with  limited  entropy   · VirtualAlloc  and  MapViewOfFile  are  not  randomized   · Predictable  memory  regions  can  exist  as  a  result  

Address  space  

Boaom--up  alloca5ons  
(stacks,  heaps,  mapped  files,  VirtualAlloc,  etc)  

Windows  8  
· All  boaom--up/top--down  alloca5ons  are  randomized   · Accomplished  by  biasing  start  address  of  alloca5ons   · PEBs/TEBs  now  receive  much  more  entropy   · Both  are  opt--in  (EXE  must  be  dynamicbase)  

Outcome:  predictable  memory  regions  have  been  eliminated  

19  

ASLR in Windows 8 takes advantage of the large address space (8TB) of 64-bit processes

High entropy bottom-up
randomization

· 1 TB of variance in bottom-up start address · Breaks traditional address space spraying (heap/JIT) · Processes must opt-in to receive this behavior

High entropy top-down
randomization

· 8 GB of variance in top-down start address · Automatically enabled if top-down randomization is on

High entropy image
randomization

· Images based above 4 GB receive more entropy · All system images have been moved above 4 GB

Outcome: probability of guessing an address is decreased and disclosures of memory addresses must include more than the low 32 bits

20

Entropy (in bits) by region

Windows 7
32-bit 64-bit

Bottom-up allocations (opt-in)

0

0

Stacks

14

14

Heaps

5

5

Top-down allocations (opt-in)

0

0

PEBs/TEBs

4

4

EXE images

8

8

DLL images

8

8

Non-ASLR DLL images (opt-in)

0

0

*  64--bit  DLLs  based  below   4GB  receive  14  bits,  EXEs   below  4GB  receive  8  bits  

ASLR  entropy  is  the  same  for  both     32--bit  and  64--bit  processes     on  Windows  7  

Windows 8

32-bit

64-bit

64-bit (HE)

8

8

24

17

17

33

8

8

24

8

17

17

8

17

17

8

17*

17*

8

19*

19*

8

8

24

64--bit  processes  receive  much  more   entropy  on  Windows  8,  especially  with  
high  entropy  (HE)  enabled    

21  

"

" 0:000> u ntdll!NtWriteVirtualMemory L6 ntdll!NtWriteVirtualMemory:

4 6 6a214724 b802000000
6a214729 e803000000

mov call

eax,2 ntdll!NtWriteVirtualMemory+0xd

(6a214731)

6a21472e c21400

ret

14h

6a214731 8bd4

mov

edx,esp

6a214733 0f34

sysenter

6a214735 c3

ret

0:000> dd 7ffe0300 L1

7ffe0300 00000000

22

Integrity checks, guard pages, and allocation order randomization
23

11

"

9

"

7

"

7

"

8 12

10
"

24

The general design of the Windows heap is unchanged in Windows 8
HeapAlloc(heap, flags, size)
Frontend allocator (LFH)
Used for sizes <= 16KB
Backend allocator
Used by frontend and for sizes less than 512K (x86) or 1MB (x64)
Virtual memory allocator
Used by backend and for large allocation sizes
Kernel memory manager 25

Change in Windows 8

Impact

LFH is now a bitmap-based allocator

LinkOffset corruption no longer possible [8]

Multiple catch-all EH blocks removed

Exceptions are no longer swallowed

HEAP handle can no longer be freed

Prevents attacks that try to corrupt HEAP handle state [7]

HEAP CommitRoutine encoded with global Prevents attacks that enable reliable

key

control of the CommitRoutine pointer [7]

Validation of extended block header

Prevents unintended free of in-use heap blocks [7]

Busy blocks cannot be allocated

Prevents various attacks that reallocate an in-use block [8,11]

Heap encoding is now enabled in kernel mode

Better protection of heap entry headers [19]

Outcome: attacking metadata used by the heap is now even more difficult

26

" "

PAGE_NOACC

... Heap memory

ESS

Heap memory ...

Guard page

" " "
27

" "
Windows  7  LFH  block  alloca5on  behavior   O   T  
Windows  8  LFH  block  alloca5on  behavior   T  
" " "

10
O   28

DEP, ASLR, SMEP/PXN, NULL dereference protection, and pool integrity checks
29

" "

"

"

"

13

"

14 21

30

Many  kernel  memory  regions  were  unnecessarily  executable  in  Windows  7  and  prior  

x86 (PAE)

Win7 Win8

Paged pool

X

X

Non-paged pool

X

X

Non-paged pool (NX) N/A NX

Session pool

X

X

Image data sections

X

X

Kernel stacks

NX NX

Idle/DPC/Initial stacks X NX

Page table pages

X NX

PFN database

X NX

System cache

X NX

Shared user data

X NX

HAL heap

X NX

X  =  executable      NX  =  non--executable  

x64

Win7 Win8

NX NX

X

X

N/A NX

NX NX

NX NX

NX NX

X NX

X NX

X NX

X NX

X NX

X NX

ARM
Win8
NX X NX NX NX NX NX NX NX NX NX NX

Windows  8  introduces   NonPagedPoolNx  for   non--executable  non-- paged  pool  alloca&ons  
(default  on  ARM)  
NX  HAL  heap  and   NonPagedPoolNx  break  
the  assump&ons  of   exploits  for  MS09--050  
31

" "
" " "
32

" " "

"

"

15

33

"
" "
" " "
34

"
13
" " " "
35

"

"

16

"

"

"

"

17 18

36
22

ARM, Inbox, Modern style apps, IE 10, the new Office, and other applications
37

All  applicable  mi5ga5ons  are  enabled  on  ARM  

DEP ASLR (images) ASLR (force relocate)
ASLR (bottom-up) ASLR (top-down)

On On N/A (all images are ASLR) On On

ARM  PE  images   must  opt--in  to     DEP  and  ASLR  
   Kernel  will  fail   to  load  images  
that  do  not  

ASLR (high entropy)

N/A (not 64-bit)

SEHOP

N/A (not needed)

Heap termination

On

Kernel NULL

On

dereference

Kernel SMEP

On

Lack  of  applica5on  compa5bility  concerns  enables  us  to  be  more  aggressive  
38

All  applicable  mi5ga5ons  are  enabled  for  Windows  Modern  style  apps  

Default settings for Windows 8 client

32 bit (x86)

Modern Inbox IE1 Default

apps

0

64 bit (x64)

Modern Inbox IE1 Default

apps

0

DEP

On

On On OptIn

On

On On OptIn

ASLR (images)

On

On On OptIn

On

On On OptIn

ASLR (force relocate)

On

OptIn On OptIn

On

OptIn On OptIn

ASLR (bottom-up)

On

On On OptIn

On

On On OptIn

ASLR (top-down)

On

On On OptIn

On

On On OptIn

ASLR (high entropy)

N/A

N/A N/A N/A

On

On On OptIn

SEHOP

On

On On OptIn

N/A

N/A N/A N/A

Internet  Explorer  10  and  the  new  Office  also  enable  all  applicable  mi5ga5ons  

Heap termination

On

On On OptIn

On

On On On

39  

Opt-in methods · "MitigationOptions" Image File Execution Option (IFEO) · Process creation attribute (via UpdateProcThreadAttribute) · SetProcessMitigationPolicy API · Linker flag

Opt-in mitigation

IFEO Proc Attr API

Bottom-up randomization

Yes

Yes

No

Top-down randomization

No

No

No

Bottom-up randomization (high entropy)

Yes

Yes

No

ASLR

No

No

No

Force ASLR

Yes

Yes Yes

DEP

Yes

Yes Yes

SEHOP

Yes

Yes

No

Heap termination

Yes

Yes Yes

* EXEs with a subsystem version >= 6.2 will automatically enable these mitigations

Linker flag /DYNAMICBASE (on EXE) /DYNAMICBASE (on EXE)
/HIGHENTROPYVA (on EXE)
/DYNAMICBASE None
/NXCOMPAT (on EXE) None* None*
40

" "

"

"

"

"

20

41

"

"

Enhanced Protected Mode

"

31

"

"

NonPagedPoolNx

42

Many individuals have worked very hard to deliver the improvements we discussed

Windows

Charles Chen, Greg Colombo, Jason Garms, Stephen Hufnagel, Arun Kishan, Joe Laughlin, Pavel Lebedynskiy, John Lin, Gov Maharaj, Hari Pulapaka, Pierre-Yves Santerre, Neeraj Singh, Evan Tice, Valeriy Tsuryk, Suma Uppuluri, Landy Wang, Matthew Woolman

CLR/Silverlight Reid Borsuk, Jesse Collins, Jeffrey Cooperstein, Nick Kramer

Visual Studio

Jonathan Caves, Tanveer Gani, Mark Hall, Lawrence Joel, Louis Lafreniere, Mark Levine, Steve Lucco, Mark Roberts, Andre Vachon, YongKang Zhu

Internet Explorer David Fields, Forbes Higman, Eric Lawrence, Zach Murphy, Justin Rogers

Microsoft Research
Microsoft Security Engineering Center

Richard Black, Miguel Castro, Manuel Costa, Ben Livshits, Jay Stokes, Ben Zorn
Eugene Bobukh, Tim Burrell, Thomas Garnier, Nitin Kumar Goel, John Lambert, Dave Probert, Tony Rice, Richard Shupak, Julien Vanegue, Greg Wroblewski
44

Contact us at switech@microsoft.com
Were you fascinated by the topics discussed in this presentation? We are hiring.
http://www.microsoft-careers.com/go/Trustworthy-Computing-Jobs/194701/ 45

46

hap://blogs.technet.com/b/srd/archive/2009/03/20/enhanced--gs--in--visual--studio--2010.aspx hap://dev.metasploit.com/redmine/projects/framework/repository/revisions/master/entry/modules/exploits/windows/ browser/adobe_cooltype_sing.rb hap://www.seman5scope.com/research/BHDC2010/BHDC--2010--Paper.pdf
hap://www.eeye.com/eEyeDigitalSecurity/media/ResearchPapers/eeyeMRV--Oct2006.pdf hap://nietmenja.blogspot.com/2010/03/win32--aslr--round--2.html
hap://www.lateralsecurity.com/downloads/hawkes_ruxcon--nov--2008.pdf hap://illma5cs.com/Understanding_the_LFH_Slides.pdf
hap://www.phreedom.org/research/heap--feng--shui/heap--feng--shui.html hap://blogs.technet.com/b/srd/archive/2009/08/04/preven5ng--the--exploita5on--of--user--mode--heap--corrup5on-- vulnerabili5es.aspx hap://conference.hitb.org/hitbsecconf2012ams/materials/D2T2%20--%20Steven%20Seeley%20--%20Ghost%20In%20the %20Windows%207%20Allocator.pdf
47

haps://media.blackhat.com/bh--dc--11/Mandt/BlackHat_DC_2011_Mandt_kernelpool--wp.pdf

hap://blog.piotrbania.com/2009/10/351--packets--from--trampoline.html

hap://j00ru.vexillium.org/?p=783 hap://sota.gen.nz/veh/

hap://j00ru.vexillium.org/?p=690

hap://www.uninformed.org/?v=7&a=2&t=sumry

hap://mista.nu/research/mandt--win32k--slides.pdf

hap://blogs.technet.com/b/srd/archive/2011/12/13/more--informa5on--on--ms11--087.aspx hap://j00ru.vexillium.org/?p=762

48

hap://blogs.technet.com/b/srd/archive/2010/12/08/on--the--effec5veness--of--dep--and--aslr.aspx hap://vimeo.com/31548167
hap://www.microsoW.com/en--us/download/details.aspx?id=29569 hap://www.microsoW.com/en--us/download/details.aspx?id=27605 hap://www.microsoW.com/en--us/download/details.aspx?id=26788 hap://blogs.msdn.com/b/sdl/archive/2011/12/02/security.aspx
49

