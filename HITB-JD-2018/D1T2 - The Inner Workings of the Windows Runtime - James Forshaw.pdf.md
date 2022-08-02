James Forshaw @tiraniddo
https://www.flickr.com/photos/giuseppemilo/40760404654

Who am I?
 Researcher in Google's Project Zero  Specialize in Windows
 Especially local privilege escalation  Logical vulnerability specialist
 Author of a book on attacking network protocols
 @tiraniddo on Twitter.
2

Why Talk About Windows Runtime?
Understand the Technology Aid to Reverse Engineering Improve Security Research
3

Background Research
https://www.troopers.de/downloads/troopers17/TR17_Demystifying_%20COM.pdf
4
https://conference.hitb.org/hitbsecconf2012ams/materials/D1T2%20-%20Sebastien%20Renaud%20and%20Kevin%20Szkudlapski%20-%20WinRT.pdf

This Talk is based on Windows 10 1803/1809
5

OleViewDotNet
6
https://github.com/tyranid/oleviewdotnet

What's the Windows Runtime (WinRT)?
UWP Application
Windows Runtime
COM Runtime
RPC Runtime Win32 (KERNEL32/USER32/GDI32)
7

COM Joins Everything Together

JavaScript

JavaScript

C

C

COM

C++

C++

.NET
Component Consumer

.NET

Component Provider

8

IInspectable the New Root of Evil

MIDL_INTERFACE("AF86E2E0-B12D-4c6a-9C5A-D7AA65101E90")

IInspectable : public IUnknown {

public:

HRESULT GetIids( ULONG *iidCount,

Get a list of interface IDs supported by class.

IID **iids);

HRESULT GetRuntimeClassName( HSTRING *className);

Get class name.

HRESULT GetTrustLevel( TrustLevel *trustLevel);
};

Get class trust level.
9

Activation Factories
 Component classes can't be directly `newed' so WinRT defines a factory interface, IActivationFactory. Does not use IClassFactory.
DEFINE_GUID(IID_ActivationFactory, "00000035-0000-0000-C000-000000000046");
struct IActivationFactory : public IUnknown { HRESULT ActivateInstance( IInspectable **instance );
};
10

Activation Factories and Instances

HRESULT RoGetActivationFactory(

HSTRING

activatableClassId,

REFIID LPVOID*

iid, factory);

Abbreviated as ACID

HRESULT RoActivateInstance(

HSTRING

activatableClassId,

IInspectable** instance,

);

Example ACID: "Windows.Foundation.Uri" 11

Runtime Class Registry Keys

System Windows Runtime
Classes
HKEY_LOCAL_MACHINE\Software\Classes

Per-App Runtime Extension Classes
HKEY_CURRENT_USER\Software\Classes

Per-App Runtime Classes
%ProgramData%\Package\ActivationStore.dat
12

Runtime Extension Classes

Contract ID Windows.Launch Windows.Protocol Windows.BackgroundTasks Windows.File Windows.Search

Description Default Application Launch URI Protocol Handler Background Task Launch and pass a file object Search request

13

Class Trust Levels
HRESULT GetTrustLevel(TrustLevel *trustLevel);

Full Trust Partial Trust
Base Trust

Can only be created in a fully trusted context Can be created in a sandbox context through a broker Can be created in any context
14

Base Trust Class

System Service RPCSS
DCOM Activator

Base Trust Class

AppContainer Sandbox

15

Partial Trust Class
Runtime Broker Partial Trust Class Normal User Level

System Service RPCSS
DCOM Activator

AppContainer Sandbox

16

DEMO 1
17

Application Manifest XML

Package

Identity

<Package>

<Identity Name="Microsoft.MicrosoftEdge"

Publisher="CN=Microsoft Corporation, ..."

Version="44.17763.1.0"

ProcessorArchitecture="neutral"/>

<Applications>

<Application Id="MicrosoftEdge"

Executable="MicrosoftEdge.exe"

EntryPoint="MicrosoftEdge.App">

...

</Application>

</Applications> </Package>

Application

Launch

18

Application Activation
SIHOST Application
Activator

System Service RPCSS

EXPLORER

Call ActivateApplication over DCOM

Normal User Level
19

Application Activation
SIHOST Application
Activator

System Service
RPCSS
Process State Manager

EXPLORER Normal User Level

Create a new Application Host

HOST ID: XYZ
20

Application Activation
SIHOST Application
Activator

System Service RPCSS
DCOM Activator

EXPLORER Normal User Level

Create Application via Activator

HOST ID: XYZ

AppContainer Sandbox

21

Application Activation
SIHOST Application
Activator

System Service RPCSS

EXPLORER Normal User Level

Pass Arguments to Application

HOST ID: XYZ

AppContainer Sandbox

22

WinRT Activation Properties

ActivationPropertiesIn
CustomHeader
Property 1 Property 2 Property 3 Property 4

struct ComWinRTActivationPropertiesData {

HSTRING activatableClassId;

HSTRING packageFullName;

ULONGLONG userContext;

PBLOB

rtbProcessMitigationPolicyBlob;

};

struct ExtensionActivationContextPropertiesData {

ULONGLONG hostId;

ULONGLONG userContext;

GUID

componentProcessId;

ULONGLONG racActivationTokenId;

PBLOB

lpacAttributes;

ULONGLONG consoleHandlesId;

ULONGLONG aamActivationId;

};

23

Extension Activation
// Exported as Ordinal #65 HRESULT RoGetExtensionRegistration(
HSTRING contractId, HSTRING packageId, HSTRING activatableClassId, IExtensionRegistration **extensionRegistration);
IExtensionRegistration* reg =; RoGetExtensionRegistration("Windows.Launch",
"Pkg_1.0.0.0_xxxxxxxxx", "App", &reg); reg->set_HostId(12345678); IInspectable* obj; reg->Activate(&obj);
24

AppContainer Access Token Attributes
Caller needs SeTcbPrivilege to add or modify security attributes.

Application Host ID

System Application ID

Package Flags

Low Privilege App

Container

25

Building the System Application ID

Component Package Name Publisher ID Package Family Name Package Full Name Package Moniker Package-Relative App ID Application User Model ID

Example Microsoft.MicrosoftEdge 8wekyb3d8bbwe Microsoft.MicrosoftEdge_8wekyb3d8bbwe Microsoft.MicrosoftEdge_44.17763.1.0_neutral__8wekyb3d8bbwe Same as Package Full Name App Microsoft.MicrosoftEdge_8wekyb3d8bbwe!App
26

AppContainer SID and Capabilities
Package Family Name and
Package SID
<Capabilities> <Capability Name="internetClient"/> <Capability Name="privateNetworkClientServer"/> <rescap:Capability Name="childWebContent"/> <rescap:Capability Name="confirmAppClose"/> <rescap:Capability Name="lpacCom"/> ... <DeviceCapability Name="location"/> <DeviceCapability Name="microphone"/> <DeviceCapability Name="webcam"/>
</Capabilities>
27

DEMO 2
28

Reverse Engineering Native Components
29

Windows Metadata
C:\Windows\System32\WinMetadata
30

Combining Interfaces

Factory Object

class RuntimeClass {
// Default constructor. public RuntimeClass();
// Constructor with parameter. public RuntimeClass(int p); // Static method. public static int A();
// Instance method. public int B(); }

Instance Object

31

Combining Interfaces
class RuntimeClass { // Default constructor. public RuntimeClass(); // Constructor with parameter. public RuntimeClass(int p); // Static method. public static int A(); // Instance method. public int B();
}

Factory Object
interface IActivationFactory { HRESULT ActivateInstance( IInspectable **instance );
}
Instance Object
interface IRuntimeClass { HRESULT B(int* retval);
} 32

Combining Interfaces
class RuntimeClass { // Default constructor. public RuntimeClass(); // Constructor with parameter. public RuntimeClass(int p); // Static method. public static int A(); // Instance method. public int B();
}

Factory Object
interface IActivationFactory { HRESULT ActivateInstance( IInspectable **instance );
}
interface IRuntimeClassFactory { HRESULT ActivateInstanceWithParam( int p, IRuntimeClass** instance);
}
interface IRuntimeClassStatics { HRESULT A(int* retval);
}
Instance Object
interface IRuntimeClass { HRESULT B(int* retval);
} 33

Finding the Implementation Binary
Get object for the class
PS> $cls = Get-ComRuntimeClass -Name "Class.Name"
If In-Process get DLL path
PS> $cls.DllPath
If OOP NormalExe get Server Exe Path
PS> $cls.ServerEntry.ExePath
If OOP service get Service name
PS> $cls.ServerEntry.ServiceName
34

Activation Entry Points
Exported from a DLL

HRESULT DllGetActivationFactory(

HSTRING

activatableClassId,

IActivationFactory **factory

);

Called in an EXE

HRESULT RoRegisterActivationFactories(

HSTRING

*activatableClassIds,

PFNGETACTIVATIONFACTORY *activationFactoryCallbacks,

UINT32

count,

RO_REGISTRATION_COOKIE *cookie

); 35

C++ Application Frameworks

C++/CX (Custom C++ dialect)
void App::OnLaunched(LaunchActivatedEventArgs^ e) { Handler^ handler = ref new Handler(); handler->HandleLaunch("Launched");
}
C++/WRL (C++ 11)
HRESULT App::OnLauncher(ILaunchActivatedEventArgs* e) { ComPtr<IHandler> handler; HRESULT hr = Make<Handler>(&handler) if (FAILED(hr)) return hr; HStringReference str(L"OnLaunched"); return handler->HandleLaunch(str.Get());
}

C++/WINRT (C++ 17)

void App::OnLaunched(LaunchActivatedEventArgs const& e) {

Handler handler = Handler();

handler.HandleLaunch(hstring(L"Launched"));

}

36

IDL File
namespace WRLClass { [uuid(E74F1CF0-59C7-4CA6-BDE5-0F9DED9B4EF7), version(1.0), exclusiveto(WinRTClass)] interface IWinRTClass : IInspectable { HRESULT Add([in] int a, [in] int b, [out, retval] int* value); }
[version(1.0), activatable(1.0)] runtimeclass WinRTClass {
[default] interface IWinRTClass; } }
37

C++/WRL Implementation

class WinRTClass : public RuntimeClass<IWinRTClass> {

InspectableClass(L"WRLClass.WinRTClass", BaseTrust)

public: HRESULT STDMETHODCALLTYPE Add( /* [in] */int a,

Define base implementation of
IInspectable

/* [in] */int b,

/* [retval, out] */int * value

) override {

*value = a + b; return S_OK;

Interface Implementation

}

};

Define

ActivatableClass(WinRTClass);

ActivationFactory

38

Finding Implemented Interfaces

HRESULT QueryInterface(REFIID riid, void** ppv) {

bool handled = false;

HRESULT hr = CustomQueryInterface(riid, ppv, &handled);

if (FAILED(hr) || handled)

return hr;

Overridable

Custom QI

return Super::AsIID(this, riid, ppv);

}

Call AsIID

helper

method

39

AsIID Helper

Variadic Template

HRESULT AsIID(RuntimeClass<IT...>* implements, REFIID riid, void **ppv) {
HRESULT hr = E_NOINTERFACE; if (riid == __uuidof(IUnknown)
|| riid == __uuidof(IInspectable)) { *ppv = implements->CastToUnknown(); hr = S_OK;
} else { hr = implements->CanCastTo(riid, ppv);
} if (SUCCEEDED(hr))
static_cast<IUnknown*>(*ppv)->AddRef(); return hr; }

Handle Base Case
Specific CanCastTo
40

CanCastTo Helper

Variadic Template Expanded

HRESULT RuntimeClass<I1, I2, I3> CanCastTo(REFIID riid,

void* ppv) {

if (riid == __uuidof(I1)) {

ppv = static_cast<I1*>(this);

} else if (riid == __uuidof(I2)) {

ppv = static_cast<I2*>(this);

} else if (riid == __uuidof(I3)) { ppv = static_cast<I2*>(this);

Test Each Interface

} else {

return E_NOINTERFACE;

}

return S_OK;

} 41

String Handles (HSTRING)

typedef struct HSTRING__{

int unused;

} HSTRING__;

Opaque string handle structure.

// Declare the HSTRING handle for C/C++ typedef HSTRING__* HSTRING;

WindowsCreateString( PCNZWCH sourceString,
UINT32 length,
HSTRING *string );
Reference counted on the heap.

WindowsCreateStringReference(

PCWSTR

sourceString,

UINT32

length,

HSTRING_HEADER *hstringHeader,

HSTRING

*string

);

Scoped on the stack.

42

The Real HSTRING

struct HSTRING_HEADER_INTERNAL {

WINDOWS_RUNTIME_HSTRING_FLAGS flags;

unsigned int length;

Used for stack scoped

unsigned int padding1; "reference" strings.

unsigned int padding2;

const wchar_t *stringRef; struct STRING_OPAQUE {

};

HSTRING_HEADER_INTERNAL header;

volatile int refcount;

wchar_t string[1]; Inline string data and

PCWSTR WindowsGetStringRawBuf}f;er(

reference count for use on the heap

HSTRING string,

UINT32 *length

Call to get raw buffer and length.

);

43

Create a new instance of a COM object.
PS> $obj = New-ComObject -Class $cls
Get all known interfaces for a class.
PS> $intf = Get-ComClassInterface $cls
Get proxy information for a list of interfaces.
PS> $prx = $intf | Get-ComProxy
Format the COM proxies as text.
PS> $prx | Format-ComProxy
44

Debugging Applications
Get all registered Windows.Launch Extensions
PS> Get-ComRuntimeExtension -Launch | ` Select PackageId, AppId
Start a package and debug it.
PS> windbg.exe -plmPackage PKGID -plmApp APPID
Enable debugging for a package
PS> plmdebug.exe /enableDebug PKGID DBGPATH.EXE
45

DEMO 3
46

Windows Runtime Security
47

Sandbox Escape OOP Attack Surface

User Process

System Service Service Process

Interactive User Class

OOP Runtime Class

Runtime Broker Partial Trust Class Normal User Level

AppContainer Sandbox

48

Get list of partial trust classes
PS> Get-ComRuntimeClass -TrustLevel PartialTrust

Get Interactive User classes
PS> Get-ComRuntimeServer -IdentityType SessionUser ` | Select -ExpandProperty Classes

Get svchost hosted classes
PS> Get-ComRuntimeServer -ServerType SvchostService ` | Select -ExpandProperty Classes

Get EXE hosted classes

PS> Get-ComRuntimeServer -ServerType ExeService `

| Select -ExpandProperty Classes

49

Partial Trust Class Default Permissions
PS> Show-ComSecurityDescriptor -RuntimeDefault
Allows all AC at the same user to access the class.
50

Class Specific Permissions
PS> Show-ComSecurityDescriptor $cls

Adds the lpacAppExperience capability

51

Finding Accessible Classes
PS> Get-ComRuntimeClass | Select-ComAccess -pid X
52

Package Name Checks

BOOL BrokerAuthenticateCOMCaller() {

HANDLE token;

CoImpersonateClient();

OpenThreadToken(GetCurrentThread(), TOKEN_QUERY, &token);

WCHAR family_name[255]; ULONG family_name_length = 255;

Reads from WIN://SYSAPPID

NTSTATUS status = RtlQueryPackageClaims(token,

family_name, &family_name_length);

if (NT_SUCCESS(status))

return wcsicmp(package_name, L"MicrosoftEdge") == 0;

return FALSE;

}

53

Incorrect Capability or Missing Security Checks

HANDLE CheckedCreateFile(string path) {
// Get client token. HANDLE token; CoImpersonateClient(); OpenThreadToken(GetCurrentThread(), &token);

HANDLE ret = INVALID_HANDLE_VALUE; if (CapabilityCheck(token, L"internetClient")) {
ret = CreateFile(path, ...); }

return ret; }

But opening a file.

Checking for internetClient capability
54

HSTRING is a Counted String
UINT32 length; PCWSTR str = WindowsGetStringRawBuffer(hString,
&length); // Might not be equal. assert(wcslen(str) == length);
HRESULT WindowsStringHasEmbeddedNull( HSTRING string, BOOL *hasEmbedNull
);
55

TOCTOU in Marshaled Interfaces Takes Generic

HRESULT StartViewer(IFileObject file) {

interface

if (file.GetPath().EndsWith(".exe"))

return E_ACCESS_DENIED;

First call returns

safe filename.

ShellExecute(file.GetPath());

}

class MyFileObject : IFileObject {

bool _returned = false;

string GetPath() {

Second call returns unsafe filename.

if (_returned) return "calc.exe";

_returned = true;

return "safe.txt";

}

}

56

Inject a DLL Into Running Process
Only Store signed DLLs can be loaded
57

DEMO 4
58

Conclusions
 All based on familiar COM programming paradigms  The Windows Runtime has many interesting attack surfaces
 Attack surface which might be accessible remotely  Plenty of Sandbox to User and User to System privilege escalation routes
 Tooling is not quite there, making an effort with OleViewDotNet
59

60

