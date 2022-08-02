Android Crash & Treasure
    Keen  Team  

Android Kernel  Linux Kernel
· 
­ udev ­ Init/dev ­ pagefile J
· 
­ ashmem pmem ­ wakelock, alarm ­ ......

Android Kernel

Android Kernel
· ELF · ELF bundle
­ iOS kernel ­ 
· IDA 
·  è

Android Kernel
· /proc/kallsymskernel symbol
· patch/proc/sys/kernel/ kptr_restrict1symbol
· exploit
h)ps://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=455cd5ab305c90ffc422dd2e0E634730942b257  

Android Kernel
· /proc/sys/kernel/ kptr_restrict0 
· IDA loader · kallsyms
 · è



Fuzzing
·  · 
­mmap() logic issue [Framaroot] ­memory corruption [Qualcomm MSM] · Dumb Fuzzing


· Android ·  · root

 ­ mmap
· Framaroot v1.9.1,root .
/dev/exynos-mem "Sam" /dev/DspBridge "Gemli" /dev/s5p-smem "Merry" /dev/exynos-mem "Frodo" /dev/video1 "Aragorn" /dev/graphics/fb "Legolas" /dev/msm_camera "Gandalf" /dev/camera-isp "Boromir" /dev/memalloc "Pippin" /dev/amjpegdec "Gollum" /dev/camera-sysr "Faramir" /dev/Vcodec "Barahir"
h)p://forum.xda--developers.com/showthread.php?t=2130276

 ­ mmap
· /dev/Vcodecmmap  .
/mediatek/plaLorm/mt6582/kernel/drivers/videocodec/videocodec_kernel_driver.c

 ­ mmap
· Root

mmap
·  mmap
·  

kallsyms
· kallsyms "%pK"
·  "%p"
· setresuid

setresuid
· setresuid 
· root

 ­ 
· Qualcomm MSM 
­ CVE-2013-2596 ­ CVE-2013-2597 ­ CVE-2013-4738 ­ CVE-2013-4739 ­ CVE-2013-6123 ­ ...

 ­ 
· CVE--2013--4738 


 ­ 
· CVE--2013--6123 


Dumb Fuzzing
· iOS · API 
1. ioctl (fd, cmd, arg) 2. copy_from_user(*to, *from, length) 3. copy_to_user(*to, *from, length)

Dumb Fuzzing
int ioctl(int fd, int cmd, ...)

Dumb Fuzzing

· copy_from_user() & copy_to_user() · page fault 

static inline unsigned long __must_check copy_from_user(void *to, const void __user *from, unsigned long n) {
if (access_ok(VERIFY_READ, from, n))
n = __copy_from_user(to, from, n); return n; }

static inline unsigned long __must_check copy_to_user(void __user *to, const void *from, unsigned long n) {
if (access_ok(VERIFY_WRITE, to, n)) n = __copy_to_user(to, from, n);
return n; }

#define __copy_from_user(to,from,n) #define __copy_to_user(to,from,n)

(memcpy(to, (void __force *)from, n), 0) (memcpy((void __force *)to, from, n), 0)

Dumb Fuzzing
· Dumb Fuzzer

CrashCrash
· Crash

Dumb Fuzzing
· Android
­ last_kmsg
· Crash · CrashPointer
Dereference

Dumb Fuzzing
""

· ioctl cmd · ioctlarg · cmdarg

HexRaysCodeXplorer
· HexRaysCodeXplorer
­ Hex-Rays SDK  .
­ Win32/Gapz Bootkit[RECon'13 ZeroNights'13]
http://rehints.com/2013-09-02-Type-REconstruction-in-HexRaysCodeXplorer.html

HexRaysCodeXplorer
·  · 
· Hex Rays"" · HexRaysCodeXplorer

Hex-Rays SDK
· Hex--Rays SDK 
­ Hex-Rays ctree API 
­ ctreecitem_t ctype_t,item 

Hex-Rays SDK
*(DWORD *)(a1 + 12) = 0xEFCDAB89;

Hex-Rays SDK

· citem_t80+

· citem_t

enum ctype_t 

{

cot_asg

= 2, ///< x = y

cot_add

= 35, ///< x + y

cot_sub

= 36, ///< x ­ y

cot_cast

= 48, ///< (type)x

cot_ptr

= 51, ///< *x, access size in 'ptrsize'

cot_call

= 57, ///< x(...)

cot_idx

= 58, ///< x[y]

cot_memref = 59, ///< x.m

cot_memptr = 60, ///< x->m, access size in 'ptrsize'

};

HexRaysCodeXplorer
· 
­  ­  ­ 


· 1
v6 = arg; v8 = _copy_from_user((int)&v209, (void *)v6, 4); if ( !v8 ) {
_xlog_printk((int)off_C002EFCC, (int)((char *)off_C002EFCC - 728), v209, v79);
clkmux_sel(1u, v209, (int)off_C002EFD0, v80); return v8; }


· 
1.  2. 
 3. 



ISP_ioctl 



· 2
· HexRaysCodeXplorer · v4
16,(v4+16)
v69 = (DWORD*)((char *)v4 + 16);


· 
1. cot_addcot_sub 
2. cot_cast

case cot_add: case cot_sub: {
if (expr->y->op == cot_num) {
field.offset = expr->op==cot_add ? int32(expr->y->numval()) : 0-int32(expr->y->numval()); } }


· 3
v4 = arg; v154 = _copy_from_user((int)&v232, (void *)v4, 44); if ( !v154 ) {
m4u_query_mva(v232, v233, v234, (int)&v235, v3); //todo... }


· 
1. cot_call 
2. cot_call  
3.  memcpymemzerocopy_from_user 4
4.  


· cot_call
­  ­  ­ 
( )


· memcpy
Field field = {0}; if (strcmp(s,"memcpy") == 0) {
carg_t arg = arglist->at(2); if (arg.op == cot_num) {
field.offset = 0; field.typesize = 1; field.count = int32(arg.numval()); } cfield->fields.insert(field); }


Q  &  A

