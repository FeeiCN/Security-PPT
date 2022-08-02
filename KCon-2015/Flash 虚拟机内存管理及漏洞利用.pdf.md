Flash
Hearmen 

AVM2  CVE-2015-0313 CVE-2015-3043 CVE-2015-5119



uCVE-2015-3043



AVM2 
uAVM2       flash player        ActionScript 3 AVM2
uJitflash 

ActionScript 3
AVM 2 

ActionScript 3 

Constant pool bytecode


JIT 

uavm2overview



AVM2 
uMMgc
u/
u GC

AVM2 

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

4k

HeapBlock HeapBlock HeapBlock HeapBlock HeapBlock

FreeLists
Free[0] Free[1] Free[2] Free[3] Free[4] Free[5] ......
Free[30]

GCHeap

1 block 2 block 3 block 4 block 5 block 6 block
128 block

1 block 2 block 3 block 4 block 5 block 6 block
... block

1 block 2 block 3 block 4 block 5 block 6 block
... block

1 block 2 block 3 block 4 block 5 block 6 block
... block

CVE-2015-0313
ByteArray.Clear()


 Vectorlength shellcode 

ByteArray
uByteArrayObject uBuffer uBuffer4k uFixedMalloc

FixedMalloc
FixedMalloc::Alloc(size) {
if(size < kLargestAlloc) // 32bit 2032 FindAllocate(size)->FixedAlloc()
else LargeAlloc(size)
}

FixedBlock

FixedAlloc

m_firstBlock FixedBlock

FixedAllo c

m_firstFree

FixedBlock

FixedBlock

firstFree
Free item

Free item

FixedBlock

Uint Vector



data data Data_1 data data

Worker

data data Data_2 data data

Main

data

data

FixedBlock

si32

Block Head

data

Vector<uint>

data

Vector<uint>

Vector<uint>

FixedBlock


uByteArray.clear
ØGCHeapHeapBlockfreelist ØGCHeapfreelist

CVE-2015-3043
ØFlashFlvNellymoser<tag>buffer 
Ø0x2000
Ø 



Vector<uint> Vector<uint>
Free Vector<uint> Vector<uint>

flv

Vector<uint> Vector<uint>
Corrupt Buffer
Vector<uint> Vector<uint>



Vector<uint> Vector<uint> Corrupt Obj Vector<uint> Vector<Obj>

Object Vector

GC::Alloc
GC::Alloc {
if(size < kLargestAlloc) //1968 GCAlloc()
else GCLargeAlooc::Alloc()
}

GCBlock

GCAlloc

m_firstBlock GCBlock

GCAlloc

m_firstFree

GCBlock

GCBlock

firstFree Free item

Free item

m_qlist Free

Free

Free

Free

item

item

item

item

GCBlock

GCLargeBlock

CVE-2015-5119



Class2


uObject Vector uGC Vector
uObj -> Vector[ i ]

uNo ROP uAS uBypass CFG



FunctionObject
uAS uFunction.apply ; Function.callFunction

FunctionObject
uCoreFunctionObject

AS3_call

uAS API
u       
u       

Demo

Flash_18_0_0_209/232
u Vector u  u 

uUint Vector



uObject Vector

u



uString u/ u

uVectorObject



u

uCookielength

uVector<uint>Cookie



