ARMOpenBLAS 
 PerfXLab xianyi@perfxlab.com

BLAS
l Basic Linear Algebra Subprograms l 
- BLAS3- - BLAS2- - BLAS1-

BLAS
l Alexnet

OpenBLAS
l 2011forked from Gotoblas2 l  l 2016  l Linux l OpenHPC

OpenBLAS

l CPU - IntelAMD - ARMAArch64 - MIPS - IBM Power

l  - Linux - Windows - Mac OSX - FreeBSD - Android

OpenBLAS

OpenBLAS
l Intel Sandy Bridge

OpenBLAS
l 3A

GEMM

GEMM

GEMM

GEMM

GEMM

GEMM

GEMM

GEMM

GEMM
l  -  -  - SIMD

BLAS

l  Autotuning - ATLAS -  - 

l  - GotoBLAS/Ope nBLAS -  - 

Auto-tuning

AUGEM
l Automatically Generate Efficient Matrix kernel
l BLAS l x86 ISA
- SSEAVXAVX 2.0 l ARMv7 ISA
- Neon

AUGEM
l  - C
l  - 
l Template - 

CKernel

Input simple C code of gemm kernel

Output Optimized C code of gemm kernel

Template
Output Optimized C code of gemm kernel

Load:

tmp0 = ptr_A[0];

Load:

tmp1 = ptr_B[0];

Multiply: tmp2 = tmp0 * tmp1;

Add:

res0 = res0 + tmp2;

Load: tmp0 = C[j*LDC+i]; Add: res0 = res0 + tmp0; Store: C[j*LDC+i] = res0;

Template
l 6Template - 2

Template
l SIMD

mmUnrolledCOMP(ptr_A,0,2,ptr_B,0,2,(res0,res1,res2,res3)) mmCOMP(ptr_A,0,ptr_B,0,res0) 1.tmp0 = ptr_A[0]; 2.tmp1 = ptr_B[0]; 3.tmp2 = tmp0 * tmp1; 4.res0 = res0 + tmp2; mmCOMP(ptr_A,1,ptr_B,0,res1) 1.tmp0 = ptr_A[1]; 2.tmp1 = ptr_B[0]; 3.tmp2 = tmp1 * tmp1; 4.res1 = res1 + tmp2; mmCOMP(ptr_A,0,ptr_B,1,res2) 1.tmp0 = ptr_A[0]; 2.tmp1 = ptr_B[1]; 3.tmp2 = tmp0 * tmp1; 4.res2 = res2 + tmp2; mmCOMP(ptr_A,1,ptr_B,1,res3) 1.tmp0 = ptr_A[1]; 2.tmp1 = ptr_B[1]; 3.tmp2 = tmp0 * tmp1; 4.res3 = res3 + tmp2;

1. Vld ptr_A, 0, vec0 2. Vdup ptr_B, 0, vec1 3. Vmul vec0, vec1, vec2 4. Vadd vec2, vec3, vec3
1. Vld ptr_A, 0, vec4 2. Vdup ptr_B, 1, vec5 3. Vmul vec4, vec5, vec6 4. Vadd vec6, vec7, vec7

Template

l 
-  -A -B -C - 
-  -  X

1. Vld ptr_A, 0, vec0 2. Vdup ptr_B, 0, vec1 3. Vmul vec0, vec1, vec2 4. Vadd vec2, vec3, vec3 5. Vld ptr_A, 0, vec4 6. Vdup ptr_B, 1, vec5 7. Vmul vec4, vec5, vec6 8. Vadd vec6, vec7, vec7

Template

l 

1. Vld ptr_A, 0, reg0 2. Vdup ptr_B, 0, reg1 3. Vmul reg0, reg1, reg2 4. Vadd reg2, reg3, reg3 5. Vld ptr_A, 0, reg4 6. Vdup ptr_B, 1, reg5 7. Vmul reg4, reg5, reg6 8. Vadd reg6, reg7, reg7

Instructions

SSE

Vld array, offset, reg Vld offset(array),reg

Vst reg, array, offset Vst offset(array),reg

Vmul reg0,reg1,reg2 Vmov reg1,reg2

Vadd reg2,reg3,reg3 Vmul reg0,reg1

Vadd reg1,reg3

...

...

AVX Vld offset(array),reg Vst offset(array),reg Vmul reg0,reg1,reg2 Vadd reg2,reg3,reg3
...

1. Vld 0(ptr_A), reg0 2. Vdup 0(ptr_B), reg1 3. Vmov reg1,reg2 4. Vmul reg0, reg1 5. Vadd reg1, reg3 6. ...

1. Vld 0(ptr_A), reg0 2. Vdup 0(ptr_B), reg1 3. Vmul reg0, reg1, reg2 4. Vadd reg2, reg3, reg3 5. ...



l 
- 
l 
- reg_table - 

Algorithm of Template Optimizer

AUGEM

AUGEM
l DGEMM on Intel Sandy Bridge

AUGEM
l DGEMM on AMD Piledriver

AUGEM
l DGEMV BLAS2

AUGEM
l DAXPY (BLAS1)

PerfSGEMM on ARM
l SGEMM
- Neon SIMD - IEEE 754 - Round mode (Flush to Zero) - 
l AUGEM
- ARM · vmla.f32 c, a, b[d]

PerfSGEMM on ARM
l ARM Cortex A15 (2.32GHz)
- SGEMM - 3

PerfSGEMM on ARM
l 17DNN l Inference
- 1


l OpenBLAS
- BLAS
l AUGEM
-  - 
l PerfSGEMM
- ARMv7 - 


xianyi@perfxlab.com

