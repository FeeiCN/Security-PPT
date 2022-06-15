CPU
--

CPUIn order pipeline)
· 1)  · 2 · 3)  · 4
(

x86 CPU decode
· 4-1-1-1 rules micro fusion & macro fusion, MS-Rom(>4 micro ops)
· Optimization rule · a) avoid multiple micro ops if front-end or
instruction cache miss or branch prediction is not bottle neck · b) static arrange pipeline to avoid 4-4-1-1-1-1 =>
4-1-1-4-1-1
· c) take full advantage of macro fusion · d) take use of L0 cache & decode queue ASP

x86 CPU Rename & allocation
 ( )
 N^2 ­ N 


x86 CPU Scheduler(continue)

X86 Execution Unit
 Avoid crossing domain(integer, SIMD integer and FP (both scalar and SIMD)
 Avoid Commit conflicts  Avoid resource pipeline compete  Avoid memory false dependence

memory intensifies aligned cases

memcpy 

32 1. Movq (%rsi), %rax 2. movq %rax, (%rdi) 3. movq 8(%rsi), %rax 4. movq %rax, 8(%rdi)
1. movq 8(%rsi), %rax 2. movq %rax, 8(%rdi) 3. movq (%rsi), %rax 4. movq %rax, (%rdi)

rsi  0xf004, rdi  0xe008  2 write 0xe008~0xe010  3 read 0xf00c~ 0xf014,  %rsi  rdi  
  2 write 0xe010~0xe018  3 read 0xf004~0xf00c

memcpy intensifies correct branch prediction

memcpy intensifies (small size) correct branch prediction
3264
* *3232~63 *(rsi) 16 xmm0 *rsi +1616 xmm1 *rsi +rdx - 3216 xmm2 *rsi +rdx - 1616 xmm3 *xmm0 (rdi) *xmm1 (rdi + 16) *xmm2 (rdi + rdx - 32) *xmm3 (rdi + rdx - 16) *

memcpy intensifies (middle size) correct branch prediction
rsi  rdx 128 128 
vmovups -0x80(%rsi, %rdx), %xmm0 ... vmovups -0x10(%rsi, %rdx), %xmm7 Vmovups %xmm0, -0x80(%rdi, %rdx) ... Vmovups %xmm7, -0x10(%rdi, %rdx)
Loop: Copy 128 byte
Sub 0x80, %rdx Jae L(Loop) ret

memcpy intensifies (large size) correct branch prediction
1) Rep movsb /*intel fast instruction */ 2) non-temporary instruction
  20% CPU2006 403.gcc  24%
3, 

