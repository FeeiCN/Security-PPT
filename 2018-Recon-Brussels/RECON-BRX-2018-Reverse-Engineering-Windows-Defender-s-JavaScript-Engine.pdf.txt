Reverse Engineering Windows Defender's JavaScript Engine
Alexei Bulazel @0xAlexei
REcon Brussels 2018

About Me
 Security researcher at River Loop Security  RPI / RPISEC 2015 graduate  Longtime REcon attendee, first time presenter  Prior work on AV emulator analysis - "AVLeak"
Twitter: @0xAlexei

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Discussion 5. Conclusion

Motivation

 Tavis and Natalie at P0 dropped some awesome bugs
 Interest in JS engines, but I hadn't written JS since college
 I had reverse engineered AVs before, but never Defender
 This was a personal research project 

Windows Defender
 Microsoft's built-in antivirus software
 Now the name seems to cover all mitigations / security controls built into Windows
 Runs as NT AUTHORITY\SYSTEM
 Unsandboxed
 Built from many scanning subsystems stuck together

Windows Defender
 Microsoft's built-in antivirus software
 Now the name seems to cover all mitigations / security controls built into Windows
 Runs as NT AUTHORITY\SYSTEM
 Unsandboxed
 Built from many scanning subsystems stuck together
Focus: REing the JavaScript engine dedicated to scanning potentially malicious JavaScript, ~2% of Defender's code

JS Engines
Modern JS Engines  Open source  Highly complex  Often integrated with
browsers

JS Engines
Modern JS Engines  Open source  Highly complex  Often integrated with
browsers

Defender's JS Engine  Binary  Complex but tractable for RE
from binary  Standalone with some minor
browser emulation

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Discussion 5. Conclusion

Binaries
mpam-fe.exe released monthly:
 mpengine.dll
"Microsoft Malware Protection Engine"
 MPSigStub.exe
"Microsoft Malware Protection Signature Update Stub"

 5/23 (P0 bugs fixed)  6/20  7/19  8/23  9/27

 11/1  12/6 (UK NCSC
bugs fixed)  1/18 (latest)

 mpasbase.vdm  mpasdlta.vdm 

 mpavbase.vdm  mpavdlta.vdm

32 & 64-bit builds

Tools
 Static reversing in IDA with PDBs   BinDiff / Diaphora diffing patches  Dynamic analysis with JS shell
harness and WinDBG

Static Analysis - mpengine.dll
 45,000+ functions total  JS Engine is ~1,200 functions  Microsoft publishes PDBs!

Shell

Custom Loaders
Challenges:  Introspection  Protected process  System stability  Scanning on demand  Code reachability may be
configuration / heuristics dependent
"Repeated vs. single-round games in security" Halvar Flake, BSides Zurich Keynote

Custom Loaders
Challenges:  Introspection  Protected process  System stability  Scanning on demand  Code reachability may be
configuration / heuristics dependent
Solution:  Custom loader  Call directly into
functions that initiate scanning
"Repeated vs. single-round games in security" Halvar Flake, BSides Zurich Keynote

Loader and Shell
 Collab with Rolf Rolles, based on a shell written in D released by @TheWack0lian on Twitter
 Use LoadLibrary on Windows
 WinDbg works natively
 Patch constructor for  JsRuntimeState::JsRuntimeState()
 Provide a custom VTable implementing analysis callbacks  Print to stdout on "print" events  Log other events
 Directly call to start scan
JavaScriptInterpreter::eval( const char *input,  unsigned int inputSize, JavaScriptInterpreter::Params *params)

Loader and Shell Windows Binary

Loader and Shell Windows Binary

MpEngine.dll

Loader and Shell Windows Binary

MpEngine.dll JS Emulator

Loader and Shell Windows Binary

MpEngine.dll JS Emulator
JavaScriptInterpreter::eval

Loader and Shell Windows Binary

MpEngine.dll JS Emulator
JavaScriptInterpreter::eval
JsRuntimeState:: JsRuntimeState()

Loader and Shell

Windows Binary

Add Custom VTable

VTable
Analyz e
...

Print to stdout

MpEngine.dll JS Emulator
JavaScriptInterpreter::eval
JsRuntimeState:: JsRuntimeState()

Loader and Shell

Windows Binary

Add Custom VTable

VTable
Analyz e
...

Print to stdout

MpEngine.dll JS Emulator
JavaScriptInterpreter::eval
JsRuntimeState:: JsRuntimeState()

JS Input (function (){

i++){

for (var i = 0; i < 10;

log(i); }

})()

WinDbg

Tavis Ormandy's loadlibrary
 PE loader for Linux
 Shim out implementations for Windows API imported functions  Go through full initialization process
 mpscript tool exposes the JS engine  Hook the __rsignal function that tells MpEngine to scan
something
 Scan a buffer, it gets detected as JS and subsequently analyzed
 Hook _strtod to get output
 function log(msg){ parseFloat('__log: ' + msg);}
https://github.com/taviso/loadlibrary

Taviso's loadlibrary https://github.com/taviso/loadlibrary
Linux mpscript Binary

Taviso's loadlibrary https://github.com/taviso/loadlibrary

Linux mpscript Binary

MpEngine.dll

Taviso's loadlibrary https://github.com/taviso/loadlibrary

Linux mpscript Binary

 WinAPI Emulation

MpEngine.dll IAT

Taviso's loadlibrary https://github.com/taviso/loadlibrary

Linux mpscript Binary

 WinAPI Emulation

MpEngine.dll IAT

JS Emulator

Taviso's loadlibrary https://github.com/taviso/loadlibrary

Linux mpscript Binary

 WinAPI Emulation

MpEngine.dll IAT

JsDelegateObject_Global:: parseFloat

_strtod

JS Emulator

Taviso's loadlibrary https://github.com/taviso/loadlibrary

Linux mpscript Binary

 WinAPI Emulation

MpEngine.dll IAT

JsDelegateObject_Global:: parseFloat

Print to stdout

_strtod

JS Emulator

Taviso's loadlibrary https://github.com/taviso/loadlibrary

Linux mpscript Binary

 WinAPI Emulation

MpEngine.dll IAT

JsDelegateObject_Global:: parseFloat

Print to stdout

JS Input

function log(msg){

msg);

parseFloat('__log: ' +

}

for (var i = 0; i < 10; i++){ log(i);
}

[highly entropic HTML/JS/CSS]

_strtod

JS Emulator

Taviso's loadlibrary https://github.com/taviso/loadlibrary

Linux mpscript Binary

 WinAPI Emulation

MpEngine.dll IAT

JsDelegateObject_Global:: parseFloat

Print to stdout

JS Input

function log(msg){

msg);

parseFloat('__log: ' +

}

for (var i = 0; i < 10; i++){ log(i);
}

[highly entropic HTML/JS/CSS]

_strtod __rsignal

JS Emulator

Our Shell vs loadlibrary

Engine

Our Shell

Taviso's loadlibrary
https://github.com/taviso/loadlibrary

Platform / Debugger

Windows WinDbg with native PDBs

Linux GDB with custom symbol files

Initialization None, just LoadLibrary the DLL Full, requires corresponding VDM files

Scanning

Direct call into JS engine

Call main entry point for any AV scan

Output

Hooked VTable, using AV callbacks Function hook for _strtod

Configuratio Relies on default emulation

n

parameters set in engine

Get parameters from VDM files

Demo 1
(function() { var msg = "Hello REcon"; for (var i = 0; i < 5; i++) { print(i + ":" + msg) }
})()

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering
a. JS Language b. Types c. Memory Management d. Fingerprinting
4. Vulnerability Discussion 5. Conclusion

JS Engine
 Proprietary, best I can tell no shared code with other engines
 Focus on JS language implementation, not full browser emulation
 Code is interpreted, not JITed  Written in C++  Single-threaded  AV Emulator
 Time & memory constrained  Analysis callbacks
 ~1200 functions

ECMAScript 3-ish Language Features

Implemented  if / else  try / catch  for-in  switch statements (broken! - no fallthrough)  var declarations  Regular expressions  Error objects  Function scoping  Hoisting  Object literals  JS: timeouts

Not Implemented  for-of  Getter / setter methods  Collections: set, map  Classes  Proxies  Reflect  Generators / yield
statement  let declarations  Promises  Typed arrays

Parsing & Evaluation
NdndParseData struct is populated with EMCAScript-specific parsing functions and parameters

Parsing & Evaluation After parsing - everything passes through JsTree::run Parsing and run may be invoked multiple times during execution - user defined callbacks, timeouts, evals, etc...
NdndParseData struct is populated with EMCAScript-specific parsing functions and parameters

Parsing & Evaluation After parsing - everything passes through JsTree::run Parsing and run may be invoked multiple times during execution - user defined callbacks, timeouts, evals, etc...
Various ::eval functions implement the interpretation of JS statements
NdndParseData struct is populated with EMCAScript-specific parsing functions and parameters

Example Stack Trace During Callback
(function(){ var x = new Array(1,2,3); x.toString = function(){ return isNaN("foobar") }; var y = new String(x);
})()

Example Stack Trace During Callback

Stack Trace (Upside Down) - breakpoint on isNan
Initial evaluation JavaScriptInterpreter::eval JsTree::run JsNewExprTree::eval

(function(){ var x = new Array(1,2,3); x.toString = function(){ return isNaN("foobar") }; var y = new String(x);
})()

Example Stack Trace During Callback

Stack Trace (Upside Down) - breakpoint on isNan
Initial evaluation JavaScriptInterpreter::eval JsTree::run JsNewExprTree::eval
Allocating a new String preInvokeFunctionThrows JsConstructor_String::call newStringObjectThrows newStringObjectThrowsT<JsStringObject>

(function(){ var x = new Array(1,2,3); x.toString = function(){ return isNaN("foobar") }; var y = new String(x);
})()

Example Stack Trace During Callback

Stack Trace (Upside Down) - breakpoint on isNan
Initial evaluation JavaScriptInterpreter::eval JsTree::run JsNewExprTree::eval
Allocating a new String preInvokeFunctionThrows JsConstructor_String::call newStringObjectThrows newStringObjectThrowsT<JsStringObject>

(function(){ var x = new Array(1,2,3); x.toString = function(){ return isNaN("foobar") }; var y = new String(x);
})()

Reentrance into JS state for .toString JsTree::run JsCallExprTree::eval preInvokeFunctionThrows JsFunctionProxyObject<JsDelegateObject_Global>::call JsDelegateObject_Global::delegate JsDelegateObject_Global::isNan

Regex Engine
 Regex engine accessible from JS
 Regex parsing and compiling system - big attack surface

mpscript> (function(){ var str = "Hello REcon!"; var i = str.search(/REcon/i); print(i)
})() triggerEvent(): str_valueof triggerEvent(): str_search print(): 6

Antivirus Integration
 NscriptJSMonitor class implements callbacks used to monitor execution for antivirus purposes  NscriptJSMonitor::analyse receives info about specific script actions
 JsRuntimeState::triggerEvent is called to register events (function calls)

JsRuntimeState Large struct that stores entire JS runtime state: variables, function
arguments, global utility functions, timeouts, execution parameters, etc...

dt mpengine!JsRuntimeState

+0x000 __VFN_table : Ptr32

+0x004 m_callStack

: Ptr32 CallStack

+0x008 m_heap

: JsHeap

+0x070 m_exeCtxStack :

std::vector<JsRuntimeState::ExecutionContext,std::

allocator<JsRuntimeState::ExecutionContext> >

+0x07c m_globalObj

: Ptr32 JsObject

+0x080 m_complType

:

JsRuntimeState::CompletionType

+0x084 m_complValue

: Uint4B

+0x088 m_complTarget : Uint4B

+0x08c m_labelStack

: std::vector<unsigned

int,std::allocator<unsigned int> >

+0x098 m_conversionValue : Uint4B

+0x09c m_conversionValueType : JsValueType

+0x0a0 m_builtins

:

std::vector<JsRuntimeState::Builtin,std::allocator

<JsRuntimeState::Builtin> >

+0x0ac m_callerPropHash : Uint4B

+0x0b0 m_callerValue : Uint4B

+0x0b4 m_callerDepth : Uint4B

+0x0b8 m_exeLimit

: Uint4B

+0x0bc m_exeCounter

: Uint4B

+0x0c0 m_regexpLimit : Uint4B

+0x0c4 m_runLevel

: Uint4B

+0x0c8 m_domWrapper

: Ptr32

HtmlDocumentProvider

+0x0cc m_emptyPageDom : HtmlDocument

+0x0dc m_monitor

: Ptr32

JsEvaluationMonitor

+0x0e0 m_builder

: ProgramTree

+0x0e4 m_monitorHeartBeatIsHappy : Bool

+0x0e8 m_monitorHeartBeatDelayCount : Uint4B

+0x0ec m_shortEventBuf : [80] Char

+0x13c m_logBuf

: Ptr32 Char

+0x140 m_timeOutCallBacks :

std::list<JsRuntimeState::TimeOutCallBack,std:

:allocator<JsRuntimeState::TimeOutCallBack> >

+0x148 m_nextCallBackId : Int4B

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering
a. JS Language b. Types c. Memory Management d. Fingerprinting
4. Vulnerability Discussion 5. Conclusion

dt mpengine!JsObject

+0x00 __VFN_table +0x04 isValid +0x08 m_type

: Ptr32 : Bool : JsValueType

Parent class for JS object types

+0x0c m_propertyNames

:

std::map<

unsigned int,

std::basic_string<char,std::char_traits<char>,std::allocator<char> > const ,

std::less<unsigned int>,

std::allocator<std::pair<unsigned int const ,

std::basic_string<char,std::char_traits<char>,std::allocator<char> > const > > >

+0x14 m_properties

:

std::map<

unsigned int,

JsObject::Property,

std::less<unsigned int>,

std::allocator<std::pair<unsigned int const ,JsObject::Property> > >

+0x1c m_propertyArray

: std::vector<unsigned int,std::allocator<unsigned int> >

+0x28 m_htmlDoc

: HtmlDocument::Iterator

+0x30 m_proto

: Ptr32 JsObject

+0x34 m_class

: Ptr32 Char

+0x38 m_value

: Uint4B

Enum JsValueType
0. Empty 1. Undefined 2. Null 3. Boolean 4. String 5. Number 6. Date (present in PDBs, but not used, instead compared by class "Date") 7. Object 8. FunctionObject 9. RegExpObject a. Reference b. List c. BadValueType

dt mpengine!JsArrayObject

+0x00 __VFN_table

: Ptr32

+0x04 isValid

: Bool

+0x08 m_type

: JsValueType

+0x0c m_propertyNames

:

std::map<

unsigned int,

std::basic_string<char,std::char_traits<char>,std::allocator<char> > const ,

std::less<unsigned int>,

std::allocator<std::pair<unsigned int const ,

std::basic_string<char,std::char_traits<char>,std::allocator<char> > const > > >

+0x14 m_properties

:

std::map<

unsigned int,

JsObject::Property,

std::less<unsigned int>,

std::allocator<std::pair<unsigned int const ,JsObject::Property> > >

+0x1c m_propertyArray

: std::vector<unsigned int,std::allocator<unsigned int> >

+0x28 m_htmlDoc

: HtmlDocument::Iterator

+0x30 m_proto

: Ptr32 JsObject

+0x34 m_class

: Ptr32 Char

+0x38 m_value

: Uint4B

+0x3c m_lengthPropHash

: Uint4B

dt mpengine!JsRegExpObject

+0x00 __VFN_table +0x04 isValid

: Ptr32 : Bool

+0x08 m_type

: JsValueType

+0x0c m_propertyNames

:

std::map<

unsigned int,

std::basic_string<char,std::char_traits<char>,std::allocator<char> > const ,

std::less<unsigned int>,

std::allocator<std::pair<unsigned int const ,

std::basic_string<char,std::char_traits<char>,std::allocator<char> > const > > >

+0x14 m_properties

:

std::map<

unsigned int,

JsObject::Property,

std::less<unsigned int>,

std::allocator<std::pair<unsigned int const ,JsObject::Property> > >

+0x1c m_propertyArray

: std::vector<unsigned int,std::allocator<unsigned int> >

+0x28 m_htmlDoc

: HtmlDocument::Iterator

+0x30 m_proto +0x34 m_class

: Ptr32 JsObject : Ptr32 Char

+0x38 m_value

: Uint4B

+0x3c m_patStr

:

std::basic_string<char,std::char_traits<char>,std::allocator<char> >

+0x54 m_flags

: Uint4B

dt mpengine!JsObject

+0x00 __VFN_table : Ptr32

+0x04 isValid

: Bool

+0x08 m_type

: JsValueType

+0x0c m_propertyNames : std::map<...>

+0x14 m_properties : std::map<...>

+0x28 m_htmlDoc

: HtmlDocument::...

+0x30 m_proto

: Ptr32 JsObject

+0x34 m_class

: Ptr32 Char

+0x38 m_value

: Uint4B

"Date"

dt mpengine!JsDate

+0x00 __VFN_table : Ptr32

+0x04 isValid : Bool

+0x08 m_type

: JsValueType

+0x10 m_time

: Int8B

String Primitive Types
 JsBufString
 char * buffer
 JsSubString
 Reference to some slice of another string
 JsRefString
 Reference to a .data section string
 JsConcatString
 Tree of concatenated string elements

dt mpengine!JsConcatString

+0x00 __VFN_table : Ptr32

+0x04 isValid : Bool

+0x08 m_type

: JsValueType

+0x0c m_numBytes : Uint4B

+0x10 m_lhs

: Uint4B

+0x14 m_rhs

: Uint4B

+0x18 m_refDepth : Uint4B

dt mpengine!JsBufString

+0x00 __VFN_table : Ptr32

+0x04 isValid : Bool

+0x08 m_type

: JsValueType

+0x0c m_numBytes : Uint4B

+0x10 m_str

: Ptr32 Char

dt mpengine!JsSubString

+0x00 __VFN_table : Ptr32

+0x04 isValid : Bool

+0x08 m_type

: JsValueType

+0x0c m_numBytes : Uint4B

+0x10 m_parent : Uint4B

+0x14 m_offset : Uint4B

+0x18 m_refDepth : Uint4B

dt mpengine!JsRefString

+0x00 __VFN_table : Ptr32

+0x04 isValid : Bool

+0x08 m_type

: JsValueType

+0x0c m_numBytes : Uint4B

+0x10 m_str

: Ptr32 Char

Method Dispatch Each JS object class has a delegate function that dispatches calls to object methods

Unimplemented Methods
Object.prototype:  toLocaleString  propertyIsEnumerable  isPrototypeOf
Array.prototype:  toLocaleString  unshift  concat (for sparse arrays)  sort

Number.prototype:  toLocaleString  toPrecision  toFixed  toExponential
String.prototype.localeCompare encodeURI

Demo 2

(function() { var i = 0; switch (i) { case 0: print("0"); case 1: print("1"); }
})()

(function() { var x = [3, 2, 1]; x.sort()
})()

(function() { String(parseFloat([1, 2, 3].join())).toString()
})()

Type Checking
Explicit Checking  m_type  m_class

Type Checking
Explicit Checking  m_type  m_class

Type Checking
Explicit Checking  m_type  m_class

Casting

Type Checking
Explicit Checking  m_type  m_class

Casting Duck Typing

Type Checking
Explicit Checking  m_type  m_class

Casting
Redefinition?
(function x(){ var x = new Array(); x.foo = (new Date()).getMonth; x.foo();
})() triggerEvent(): err_typeerror triggerEvent(): error_tostring Log(): <NA>: 0: uncaught exception: TypeError: Date.prototype.getMonth() must be called only for Dates

Duck Typing

DOM Emulation
 Objects may have m_html pointer to HtmlDocument::Iterator for iteration over std::vector of HtmlDocument::Impl::Node objects

dt mpengine!HtmlDocument::Impl::Node +0x00 type : HtmlDocument::NodeType +0x04 name : std::pair<char const *,unsigned int> +0x0c data : std::pair<char const *,unsigned int> +0x14 html : std::pair<char const *,unsigned int> +0x1c parent : Uint4B +0x20 nextSibling : Uint4B +0x24 firstKid : Uint4B +0x28 lastKid : Uint4B

 "document" object declared globally to allow HTML interaction

 Minimal implementation allows creation and manipulation of document elements

Object Properties
 JavaScript objects are associative arrays mapping property name  value
 Backed by std::_Tree
 Strings and sparse array numeric properties are hashed to index into map
 Not maintained for primitive non-object types

dt mpengine!JsObject

+0x00 __VFN_table +0x04 isValid +0x08 m_type

: Ptr32 : Bool : JsValueType

Parent class for JS object types

+0x0c m_propertyNames

:

std::map<

unsigned int,

std::basic_string<char,std::char_traits<char>,std::allocator<char> > const ,

std::less<unsigned int>,

std::allocator<std::pair<unsigned int const ,

std::basic_string<char,std::char_traits<char>,std::allocator<char> > const > > >

+0x14 m_properties

:

std::map<

unsigned int,

JsObject::Property,

std::less<unsigned int>,

std::allocator<std::pair<unsigned int const ,JsObject::Property> > >

+0x1c m_propertyArray

: std::vector<unsigned int,std::allocator<unsigned int> >

+0x28 m_htmlDoc

: HtmlDocument::Iterator

+0x30 m_proto

: Ptr32 JsObject

+0x34 m_class

: Ptr32 Char

+0x38 m_value

: Uint4B

Sparse vs. Dense Array Storage
+0x14 m_properties
 "Sparse"  std::map of hash(property)  value  Stores string values and nonsequential
numeric properties  Numbers converted to string and hashed
 hash("foo")  "bar"  hash("12")  "abc"
+0x0c m_propertyNames
 std::map of hash(property)  name  Stores property names
 hash("foo")  "foo"

+0x1c m_propertyArray
 "Dense"  std::vector of values  Stores sequentially numbered
properties from 0 to end value
 [0,1,2]
var x = [0,1,2]; x.foo = "bar"; x[12] = "abc";

Property Hashing

Property Hashing

Property Hashing

Brute Forcing a Hash Collision

Brute Forcing a Hash Collision
hash("length") == hash("fyW093")

JsArrayObject::putUpdateLengthThrows
 Fires on any update of Array object properties, checks for update of hash("length")
 Manages arrays when "length" property is changed
 Erases elements from the array if indexed above the new length

Demo 3

(function() {

var x = [1, 2, 3];

print(x.length); // 3

print(x);

// "1,2,3"

x.fyW093 = 5; print(x.fyW093); print(x.length); print(x);

// 5 // 5 // "1,2,3,,"

x.fyW093 = 1; print(x); print(x.length) })()

// "1" // 1

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering
a. JS Language b. Types c. Memory Management d. Fingerprinting
4. Vulnerability Discussion 5. Conclusion

Memory Management
 Memory safe types - std::vector and std::map  Homogeneous Array sizes (no typed arrays)  No optimizations for object property get / set, fallback on
std:: library operations  Raw arrays used for JSBufString objects, but few
chances for controlled allocation sizes

Heap Management
Allocations stored in std::vector<JsHeapObject*>

Garbage Collection

Garbage Collection

Garbage Collection
Mark-and-Sweep Garbage Collection

Garbage Collection
Mark-and-Sweep Garbage Collection
Project Zero beat me to it - 2 Days Later...

BinDiffing

BinDiffing

BinDiffing

Heap Teardown After Emulation
JsRuntimeState::~JsRuntimeState destructor tears down the JS heap with JsHeap::~JsHeap

JsBufString char Array Backing
 char arrays used for storage backing JsBufString - not std::vector
 Arrays allocated then assigned to JsBufString with initByReceipt
 Only allocated in a few places, done safely

Bug - escape() is broken

Bug - escape() is broken
escape("%")

Bug - escape() is broken
escape("%")

Buffer size = 3 * numBytes 3 = 3*1

Bug - escape() is broken
escape("%")

Buffer size = 3 * numBytes 3 = 3*1

"%" should escape to 3 characters

Bug - escape() is broken
escape("%")

Buffer size = 3 * numBytes 3 = 3*1

"%" should escape to 3 characters

3 >= 3, function returns early to avoid a buffer overflow

Bug - escape() is broken
escape("%")

Buffer size = 3 * numBytes 3 = 3*1

"%" should escape to 3 characters

3 >= 3, function returns early to avoid a buffer overflow
escape()ing any single character element fails - similar problems in other escape related functions

Demo 4
(function() { print(escape("%a")); print(escape("%"));
})()

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering
a. JS Language b. Types c. Memory Management d. Fingerprinting
4. Vulnerability Discussion 5. Conclusion

Fingerprinting
Unique traits that identify the Defender JS engine
function (){ if (DetectDefender()) { return; } else { MaliciousCode(); }
}

Fingerprinting

Unique traits that identify the Defender JS engine

function (){ if (DetectDefender())
{
return; }
else
{
MaliciousCode(); }
}

function (){ if (DetectDefender())
{
ExploitDefender(); }
else
{
... }
}

Hardcoded Values
mpscript>(function(){ print(navigator.userAgent);
})() print(): Mozilla/5.0 (compatible; MSIE 6.0; Windows NT 5.1) 
> log(document.referrer) http://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web
mpscript> (function (){ var x = new Date();  print(x);
})() triggerEvent(): date_tostring print(): Mon 19 Mar 2012 01:29:10 UTC 

Instantiating Non-Objects
mpscript> (function (){ var x = new isFinite();  print(x);
})() JavaScriptLog(): [object Object]

mpscript> (function (){ var x = new eval();  print(x);
})() JavaScriptLog(): [object Object]

(function (){ var x = new print(); print(x) })() JavaScriptLog(): [object Object]
(function (){ var x = new isNaN (); print(x) })() JavaScriptLog(): [object Object]

Typos
mpscript> (function (){  try{ var x = new CollectGarbage(); }  catch(e){ print(e); }
})()
JavaScriptLog(): TypeError: collectGarbage() is not a constructor
(collectGarbage() throws an exception, undefined)

Elements Are Functions
mpscript> (function x(){ var x = document.createElement("p"); print(typeof(x));
})() print(): function

Multiple Error Handlers
(function x(){ var x = new Object(); x.foo = (new String()).valueOf; x.foo()
})() triggerEvent(): err_typeerror triggerEvent(): error_tostring Log(): uncaught exception: TypeError: String.prototype.toString and String.prototype.valueOf must be called only for Strings
(function x(){ var x = new navigator.javaEnabled();
})() JavaScriptLog(): TypeError: Navigator.javaEnabled() and Navigator.taintEnabled() are not a constructors

BUG, should never happen
mpscript> (function x(){ var num = new Number(1);  var node = document.createTextNode("node");  var elem = document.createElement("element");  num.appendChild = elem.appendChild; num.appendChild(node); 
})()
triggerEvent(): err_typeerror triggerEvent(): error_tostring Log(): uncaught exception: TypeError: node.insertBefore() 
`this' object must be DOM Object (BUG, should never happen)
Also works for node.appendChild()

Other
(function(){ print("A") print("B") // no semicolon seperator
})() print(): A print(): B
(function (){ var myFunction = function namedFunction(){}; print(myFunction.name);
})() print(): undefined
(function x(){ var x = new Array(); x.getTimezoneOffset = (new Date()).getTimezoneOffset; print(x.getTimezoneOffset())
})() JavaScriptLog(): 0

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Discussion 5. Conclusion

May 2017
(new Error()).toString.call({message: 0x41414141 >> 1})

Understanding P0's Vulnerability
JsDelegateObject_Error:: toString
Initial validation

Understanding P0's Vulnerability
JsDelegateObject_Error:: toString
Initial validation
Get this.message

Understanding P0's Vulnerability
JsDelegateObject_Error:: toString
Initial validation
Get this.message
Pass this.message to function expecting JsString

Understanding P0's Vulnerability
JsRuntimeState::triggerShortStrEvent is an AV monitoring callback
JsString::numBytes type confusion
Treat unvalidated input as JsString

Understanding P0's Vulnerability
JsRuntimeState::triggerShortStrEvent is an AV monitoring callback
JsString::numBytes type confusion
Treat unvalidated input as JsString

Patch & Discussion
Patched by adding explicit type checking that message type is String

Patch & Discussion

Patched by adding explicit type checking that message type is String

"message" only used during initialization and toString

Attack Surface Reduction
Language:  Complex ECMAScript features avoided
 eg: Array.prototype.sort

Attack Surface Reduction
Language:  Complex ECMAScript features avoided
 eg: Array.prototype.sort
Data Structures:  Few controlled allocations
 Integer overflow checked
 One array implementation  Capped array lengths  std::vector backing JS arrays

Attack Surface Reduction
Language:  Complex ECMAScript features avoided
 eg: Array.prototype.sort
Data Structures:  Few controlled allocations
 Integer overflow checked
 One array implementation  Capped array lengths  std::vector backing JS arrays
Implementation:  Callbacks into JS runtime avoided  Single threaded  Little DOM implementation  Extensive type checking (other than P0's bug)  No JIT  No GC

Attack Surface Reduction

Language:  Complex ECMAScript features avoided
 eg: Array.prototype.sort

Data Structures:  Few controlled allocations
 Integer overflow checked
 One array implementation  Capped array lengths  std::vector backing JS arrays
Implementation:  Callbacks into JS runtime avoided  Single threaded  Little DOM implementation  Extensive type checking (other than P0's bug)  No JIT  No GC

Overall:  Simplicity and ease of implementation  Take advantage of being inside an AV  Break the runtime in the interest of
security  Soon to be sandboxed...

Outline
1. Introduction 2. Tooling & Process 3. Reverse Engineering 4. Vulnerability Discussion 5. Conclusion

The Remaining 98% 43,000+ Functions

The Remaining 98% 43,000+ Functions
Unpackers

The Remaining 98% 43,000+ Functions
Unpackers
Parsers

The Remaining 98% 43,000+ Functions
Unpackers

Windows Emulator
 x86, x64, & ARM
 Lifted to IL for emulation
 WinAPI & NT Kernel emulation

Parsers

The Remaining 98% 43,000+ Functions
Unpackers

Windows Emulator
 x86, x64, & ARM
 Lifted to IL for emulation
 WinAPI & NT Kernel emulation

Parsers

Tip: the Lua engine is for signatures don't waste your time trying to do VR like I did

Conclusion

Twitter: @0xAlexei

 Defender is a great target for reverse engineering - much easier than other AVs
 This is just 2% of MpEngine.dll - and just the highlights of my JS research
 Hope to talk about the Windows x86/x64/ ARM binary emulator soon... 
 Building custom tools is necessary for this sort of research

Alexei Bulazel
Thank You:  Rolf Rolles - shell collaborator  Tavis Ormandy & Natalie
Silvanovich / P0 - exposing the engine and answering a some questions  @thewack0lian - initial shell  Joxean Koret - OG AV hacker  REcon team

 Perception of vulnerability vs. reality  Sandboxing will help security

Backup Slides

Foreign Function Interface
 FFI handling functions seem like a good target for VR
 Not user reachable - never declared in declareGlobalProperties
 addForeignSupport called during engine initialization, but did not observe FFI functions ever actually being added
 Purpose / reachability remains unclear

Timers
 Inspired by looking a ways of getting execution during JsString::initByVector - maybe fire a timed function?
 Single threaded architecture

Timers
 Inspired by looking a ways of getting execution during JsString::initByVector - maybe fire a timed function?
 Single threaded architecture
 setTimeout()- set a function to be called in some number of ms, returns ID number
 clearTimeout()- delete a timeout by ID number

Timers
 Inspired by looking a ways of getting execution during JsString::initByVector - maybe fire a timed function?
 Single threaded architecture
 setTimeout()- set a function to be called in some number of ms, returns ID number
 clearTimeout()- delete a timeout by ID number
 Idea: maybe timer callbacks will get serviced during execution?  Use one to change the vector while it is being copied

Analyzing setTimeout()
 Callbacks stored in a doubly linked list  O(1) insertion / removal  Ordered by timeout time
 Callbacks numbered sequentially from 0  100  Max 101 callbacks ever

Timeout Dispatch
 Dispatched after JsTree::run in JsRuntimeState:: runExPostFactoEvents
 Actual timeout times are not respected, but timeouts fire in order

Timeout Dispatch
 Dispatched after JsTree::run in JsRuntimeState:: runExPostFactoEvents
 Actual timeout times are not respected, but timeouts fire in order

Pop the first list entry

Timeout Dispatch
 Dispatched after JsTree::run in JsRuntimeState:: runExPostFactoEvents
 Actual timeout times are not respected, but timeouts fire in order

Pop the first list entry
Handling specific to callback being a string or a function

Timeout Dispatch
 Dispatched after JsTree::run in JsRuntimeState:: runExPostFactoEvents
 Actual timeout times are not respected, but timeouts fire in order

Pop the first list entry
Handling specific to callback being a string or a function
Actually run the function

Vulnerability Ideas
 Firing during JsString::initByVector - not going to work

Vulnerability Ideas
 Firing during JsString::initByVector - not going to work
 Another idea: UAF if we can free callbacks with clearTimeout() during traversal

Vulnerability Ideas
 Firing during JsString::initByVector - not going to work
 Another idea: UAF if we can free callbacks with clearTimeout() during traversal  Single-threaded

Vulnerability Ideas
 Firing during JsString::initByVector - not going to work
 Another idea: UAF if we can free callbacks with clearTimeout() during traversal  Single-threaded  Loop only maintains a pointer to the head, not to individual elements

Vulnerability Ideas
 Firing during JsString::initByVector - not going to work
 Another idea: UAF if we can free callbacks with clearTimeout() during traversal  Single-threaded  Loop only maintains a pointer to the head, not to individual elements

JsString::initByVector

Creates a new string from an array of strings

mpscript> (function(){

var x = new Array(1,2,"A","B");

var y = new String(x);

print(y);

})()

triggerEvent(): array_join

triggerEvent(): str_valueof

print(): 1,2,A,B

print(): undefined

Log():

<NA>: 0: execution took 68 ticks

Log():

<NA>: 0: final memory used 9KB

Log():

<NA>: 0: total of 0 GCs performed

Ended. Result code: 0

JsString::initByVector

JsString::initByVector
Sum the byte lengths of each vector element

JsString::initByVector
Sum the byte lengths of each vector element
allocate a buffer of size of the sum of lengths

JsString::initByVector
Sum the byte lengths of each vector element
allocate a buffer of size of the sum of lengths Copy each vector element into the allocated buffer

JsString::initByVector
Sum the byte lengths of each vector element
allocate a buffer of size of the sum of lengths Copy each vector element into the allocated buffer
TOCTOU?

JsString::initByVector

numBytes does not callback into JS
unsigned int overflow checking

Sum the byte lengths of each vector element
allocate a buffer of size of the sum of lengths
Copy each vector element into the allocated buffer

TOCTOU?

JsString::initByVector

numBytes does not callback into JS
unsigned int overflow checking
getValueType does not callback into JS

Sum the byte lengths of each vector element
allocate a buffer of size of the sum of lengths
Copy each vector element into the allocated buffer

TOCTOU?

JsString::initByVector

numBytes does not callback into JS
unsigned int overflow checking
getValueType does not callback into JS
VT call, but no VT functions callback into JS
Js[Buf, Concat, Ref, Sub]String:: localCopyToBuffer

Sum the byte lengths of each vector element
allocate a buffer of size of the sum of lengths Copy each vector element into the allocated buffer
TOCTOU?

