Chrome 
 

Chrome 
1.  2.  3.  4. 

Chrome
ChromeAPT0day 

Chrome

GoogleChromeV850%V8 V8 

CVE CVE-2021-21148 CVE-2021-21166 CVE-2021-21193 CVE-2021-21224 CVE-2021-21206 CVE-2021-21220 CVE-2021-30554 CVE-2021-30551 CVE-2021-30563 CVE-2021-37975 CVE-2021-37976

 Heap buffer overflow in V8. Object lifecycle issue in audio. Use after free in Blink. Type Confusion in V8. Use after free in Blink. Insufficient validation of untrusted input in V8 for x86_64. Use after free in WebGL. Type Confusion in V8. Type Confusion in V8. Use after free in V8. Information leak in core.

Chrome
Google   

1. 

V8js
Ignition IgnitionV8JavaScriptAST BytecodeBytecodeIgnition

V8js
Turbofan IgnitionTurbofanJIT

Turbofan
 JITJITBytecode
add("a","b","c"); ?

Turbofan

Turbofan

Graph Building

Native Context Specialization
& Inlining

Typer &
Typed Optimization

General Optimization

Code Generation

Turbofan
 

Turbofan
 

SimplifiedLoweringPhase

Turbofan

· Propagate · Truncation

· Retype ·  representation
· Lower · representationUseInfoop 

SimplifiedLoweringPhase

Turbofan

· Propagate · Truncation representation
· Retype · output
· Lower · outputrepresentationop 

InstructionSelectionPhase

Turbofan

· SimplifiedLoweringPhase

· DeoptimizeFrameStateDescriptor 

InstructionSelectionPhase
FrameState StateValueDescriptor  
· OP StateValueDescriptor
· TypedObjectState  StateValueList 

CodeGenerator

Turbofan

· AssembleCodePhaseinstruction
·  FrameStateDescriptor  Translation  FrameStateDescriptor 

Translation

CodeGenerator

· StackFrameBytecode 

· StateValue


 Turbofan  ·  · StackFrame · Bytecode


·  · Deoptimizer · Output Frame · 


 Output Frame


 Deoptimizer
 TranslatedValue
Materialize


2. 


· CVE-2020-6512

CVE-2020-6512
Patch
·  TranslatedValuesmi HeapNumber
· smi 

CVE-2020-6512
· obj · obj obj
https://chromium.googlesource.com/v8/v8.git/+/d8bc3362a9db69263254407b4ebab2dbd756ad96/test/mjsunit/compiler/regress-1084820.js

CVE-2020-6512
EscapeAnylasis field Phi

CVE-2020-6512
SimplifiedLowering    · Undefined · - 5000000000 ~ 1000000000  151:Phi kRepTagged

CVE-2020-6512
EffectLinearization ChangeFloat64ToTagged 
· Word32 · smi · HeapNumber

CVE-2020-6512
MaterializeHeapObjects  my_property smimap propertymap representation



 ·  ·  ·  · smiHeapObject


· CVE-2021-21195

CVE-2021-21195
 ·  · V8

CVE-2021-21195
exception stack trace mechanism · JSError · Function · 

CVE-2021-21195
JS · JSError ·  · MaterializeHeapObjects

CVE-2021-21195
JS · JSError ·  · MaterializeHeapObjects
https://chromium.googlesource.com/v8/v8/+/3353a7d0b017146d543434be4036a81aaf7d25ae/test/mjsunit/compiler/regress-1182647.js

Array.prototype.shift

CVE-2021-21195


 ·  ·  · 

3. 


 MaterializeHeapObjects V8 
·  · 

CVE-2020-6512
Release 
DescriptorArraymy_property HeapObject 0x424242420x21212121 smi


  smi
V8smiHeapObject 




 1.  39: CheckMaps maps 2.  42: CheckMaps  obj.my_property 
map smiHeapObject 



 · smi · smi CheckMaps  map 




·  ·  map 


 M80V864V832 32 · V84GB ·  V832r13V8 
V8


 V8 Isolate4GV8  RegionAllocator  FreeList 



V85 



OldSpaceCodeSpaceMapSpacePagedSpaceSpace RegionAllocator freelist  freelist 


  PagedSpace  V8 


 
·  (JS) · Map (MapSpacemap)





map 

RCE
 
1.  2. 

RCE
String StringONE_BYTE_INTERNALIZED_STRING_TYPE +  var a = "AAAAAAAA"

RCE
String
String A lastIndexOf(ArrayMap) 
· Victim Array
· Array element

4. 


·  ·  · 


Reference
1. https://docs.google.com/presentation/d/1Z6oCocRASCfTqGq1GCo1jbULDGS-wnzxkbVF7Up0u0/htmlpresent
2. https://doar-e.github.io/blog/2020/11/17/modern-attacks-on-the-chrome-browseroptimizations-and-deoptimizations/
3. https://juejin.cn/post/6844904152561106958 4. https://bugs.chromium.org/p/chromium/issues/detail?id=1182647 5. https://bugs.chromium.org/p/chromium/issues/detail?id=1084820 6. https://docs.google.com/presentation/d/1Z9iIHojKDrXvZ27gRX51UxHD-
bKf1QcPzSijntpMJBM/edit#slide=id.g19134d40cb_0_10 7. https://docs.google.com/presentation/d/1H1lLsbclvzyOF3IUR05ZUaZcqDxo7_-
8f4yJoxdMooU/edit#slide=id.g18ceb14729_0_221

