THE ACHILLES' HEEL OF CFI

 CFI CFI 
2 0 0 5   
0 1

 CFI CFI 
Clang CFI Microsoft Control Flow Guard Intel Control-Flow Enforcement Technology Microsoft eXtended Flow Guard
0 2

Clang CFI Clang CFI 

-fsanitize=cfi-cast-strict: Enables strict cast checks.

-fsanitize=cfi-derived-cast: Base-to-derived cast to the wrong dynamic type.

-fsanitize=cfi-unrelated-cast: Cast from void* or another unrelated type to the wrong dynamic type.

-fsanitize=cfi-nvcall: Non-virtual call via an object whose vptr is of the wrong dynamic type.

-fsanitize=cfi-vcall: Virtual call via an object whose vptr is of the wrong dynamic type.

-fsanitize=cfi-icall: Indirect call of a function with wrong dynamic type.

-fsanitize=cfi-mfcall: Indirect call via a member function pointer with wrong dynamic type

0 3

Clang CFI Clang CFI 
0 4

Clang CFI Clang CFI 
0 5

Clang CFI Clang CFI 
  Backward-Edge 
0 6

Microsoft Control Flow Guard CFG 
0 7

Microsoft Control Flow Guard CFG 
CFG  CFI   CFG   Backward-Edge 
0 8

Intel Control-Flow Enforcement Technology CET 
0 9

Intel Control-Flow Enforcement Technology CET 
 IBT  CFI   CFG  IBT
10

Microsoft eXtended Flow Guard XFG 
1 1

Microsoft eXtended Flow Guard XFG 
1 2

Microsoft eXtended Flow Guard  XFG
 fan-in fan-out  CFI  Variable Arguments Generic Function Object
13

JavaScript Function
function f() { alert("This is a JavaScript Function.");
} var o = f; o ();
14

JavaScript Function

Js::ScriptFunction

IR ecycler Visit ed Ob ject Fin alizab leOb ject

VFT* vftable; Type * type;

R ecyclab leOb ject Dyn amicOb ject J avascr ip t Fu n ct io n

Var* auxSlots; ArrayObject * objectArray;
ConstructorCache* constructorCache; FunctionInfo * functionInfo;

Scr ip t Fu n ct io n B ase

FrameDisplay* environment;

ActivationObjectEx * cachedScopeObj;

Scr ip t Fu n ct io n

bool hasInlineCaches;

15

JavaScript Function

template <class T> void OP_ProfiledCallI(const unaligned OpLayoutDynamicProfile<T>* playout) { OP_ProfileCallCommon(playout, OP_CallGetFunc(GetRegAllowStackVar(playout->Function)), Js::CallFlags_None, playout->profileId);
}
template <typename RegSlotType> Var InterpreterStackFrame::GetRegAllowStackVar(RegSlotType localRegisterID) const { Var value = m_localSlots[localRegisterID]; ValidateRegValue(value, true); return value;
}
RecyclableObject * InterpreterStackFrame::OP_CallGetFunc(Var target) { return JavascriptOperators::GetCallableObjectOrThrow(target, GetScriptContext());
}
16

JavaScript Function 

template <class T> void InterpreterStackFrame::OP_ProfileCallCommon(const unaligned T * playout, RecyclableObject * function

, unsigned flags, ProfileId profileId, InlineCacheIndex inlineCacheIndex, const Js::AuxArray<uint32> *spreadIndices) {

FunctionBody* functionBody = this->m_functionBody;

DynamicProfileInfo * dynamicProfileInfo= functionBody->GetDynamicProfileInfo();

FunctionInfo* functionInfo = function->GetTypeId() == TypeIds_Function ?

JavascriptFunction::FromVar(function)->GetFunctionInfo() : nullptr;

bool isConstructorCall = (CallFlags_New & flags) == CallFlags_New;

dynamicProfileInfo->RecordCallSiteInfo(functionBody, profileId, functionInfo, functionInfo?

static_cast<JavascriptFunction*>(function) : nullptr, playout->ArgCount, isConstructorCall, inlineCacheIndex);

OP_CallCommon<T>(playout, function, flags, spreadIndices);

if (playout->Return != Js::Constants::NoRegister) {

dynamicProfileInfo->RecordReturnTypeOnCallSiteInfo(functionBody, profileId, GetReg((RegSlot)playout->Return));

}

}

17

JavaScript Function 

void InterpreterStackFrame::OP_CallCommon(const unaligned T * playout, RecyclableObject * function, unsigned flags

, const Js::AuxArray<uint32> *spreadIndices){

...

flags |= CallFlags_NotUsed;

Arguments args(CallInfo((CallFlags)flags, argCount), m_outParams);

AssertMsg(static_cast<unsigned>(args.Info.Flags) == flags, "Flags don't fit into the CallInfo field?");

argCount = args.GetArgCountWithExtraArgs();

if (spreadIndices != nullptr) {

JavascriptFunction::CallSpreadFunction(function, args, spreadIndices);

} else {

JavascriptFunction::CallFunction<true>(function, function->GetEntryPoint(), args);

}

...

}

18

JavaScript Function 
19

JavaScript Function

JavascriptMethod RecyclableObject::GetEntryPoint() const { return this->GetType()->GetEntryPoint();
}
inline Type * GetType() const { return type;
}
JavascriptMethod GetEntryPoint() const { return entryPoint;
}
20

JavaScript Function

Js::ScriptFunctionType

Typ e Dyn amicTyp e Scr ip t Fu n ct io n Typ e

TypeId typeId; TypeFlagMask flags; JavascriptLibrary* javascriptLibrary; RecyclableObject* prototype; JavascriptMethod entryPoint; TypePropertyCache * propertyCache;

DynamicTypeHandler * typeHandler; bool isLocked; bool isShared; bool hasNoEnumerableProperties; bool isCachedForChangePrototype;

ProxyEntryPointInfo * entryPointInfo;

2 1

JavaScript Function Js::ScriptFunction
2 2

JavaScript Function Js::ScriptFunctionType
23

JavaScript Function NativeCodeGenerator::CheckCodeGenThunk
Nativ eC o d eGen erato r::C h eck C o deGen Th un k
24

JavaScript Function Js::ScriptFunctionType
2 5

DOM Function
window.alert("This is a DOM Function.");
26

DOM Function

Js::JavascriptExternalFunction



IR ecycler Visit ed Ob ject Fin alizab leOb ject R ecyclab leOb ject Dyn amicOb ject

VFT* vftable; Type * type;
Var* auxSlots; ArrayObject * objectArray;
ConstructorCache* constructorCache; FunctionInfo * functionInfo;

J avascr ip t Fu n ct io n

Var functionNameId;

R u n t imeFu n ct io n

UI NT64 flags; Var signature;

J avascr ip t Ext er n alFu n ct io n

void * callbackState;

ExternalMethod nativeMethod; ...

27

DOM Function Js::JavascriptExternalFunction
2 8

DOM Function Js::Type
29

DOM Function Js::JavascriptExternalFunction::ExternalFunctionThunk
3 0

DOM Function Js::JavascriptExternalFunction::ExternalFunctionThunk
3 1

DOM Getter/Setter Function
var s = document.createElement("script"); s.async = true;
3 2

DOM Getter/Setter Function DOM Object
33

DOM Getter/Setter Function Type
3 4

DOM Getter/Setter Function Prototype
35

DOM Getter/Setter Function Functions
3 6

DOM Getter/Setter Function Setter Function
3 7

 DiagnosticsResources
3 8

 alwaysRefreshFromServer 
3 9

 CFastDOM::CDiagnosticsResources::Profiler_Set_alwaysRefreshFromServer
40

 CFastDOM::CDiagnosticsResources::Trampoline_Set_alwaysRefreshFromServer
4 1

 CDiagnosticNetworkPatch::SetAlwaysRefreshFromServer
4 2

 SetRelocPtr
4 3


CFI   CFI  CFI 
4 4


KCon 
MA N O E U VR E

