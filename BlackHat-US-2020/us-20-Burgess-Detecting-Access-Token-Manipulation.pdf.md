Detecting Access Token Manipulation
William Burgess Security Research Engineer @joehowwolf

#whoami

#whoami
· Security researcher @ Elastic (formerly ENDGAME) · Former security consultant at MWR · Interests include Windows internals and everything undocumented,
reverse engineering, and development of endpoint protections · @joehowwolf

Objectives

Objectives
Help defence practitioners understand:
· How access tokens work in Windows environments · How attackers abuse legitimate Windows functionality to move
laterally and compromise entire Active Directory domains · Their capability to detect and respond to access token manipulation
within their environment

Agenda
1 Windows Security Internals 2 How Attackers Abuse Access Tokens 3 Detecting Access Token Manipulation

Agenda
1 Windows Security Internals 2 How Attackers Abuse Access Tokens 3 Detecting Access Token Manipulation

Agenda
1 Windows Security Internals 2 How Attackers Abuse Access Tokens 3 Detecting Access Token Manipulation

Windows Security Internals: Logon sessions and Access Tokens

Logon Sessions and Access Tokens
LSA ASTRO\cosmo
p4ssw0rd!4

Logon Sessions and Access Tokens

DC

LSA

ASTRO\cosmo p4ssw0rd!4

Logon Sessions and Access Tokens

DC

LSA

ASTRO\cosmo p4ssw0rd!4

Logon Sessions and Access Tokens

Interactive Logon Session for: ASTRO\cosmo

Access Token

DC

LSA

ASTRO\cosmo p4ssw0rd!4

Logon Sessions and Access Tokens

Interactive Logon Session for: ASTRO\cosmo
Logon Session: 00000000:01c7a354 User: ASTRO\cosmo Logon Type: Interactive Session: 1

Access Token
User: ASTRO\cosmo User SID: S-1-5-21-36...32-1106 AuthID: 00000000:01c7a354 Integrity: Medium

Programming Windows Security, Keith Brown (2000)

Logon Sessions and Access Tokens

Interactive Logon Session for: ASTRO\cosmo
Logon Session: 00000000:01c7a354 User: ASTRO\cosmo Logon Type: Interactive Session: 1

Access Token
User: ASTRO\cosmo User SID: S-1-5-21-36...32-1106 AuthID: 00000000:01c7a354 Integrity: Medium

Programming Windows Security, Keith Brown (2000)

Logon Sessions and Access Tokens
ASTRO\cosmo p4ssw0rd!4

Logon Sessions and Access Tokens
explorer.exe

ASTRO\cosmo p4ssw0rd!4

Primary Access Token

Interactive Session // Winsta0

Logon Sessions and Access Tokens
explorer.exe

Interactive Session // Winsta0

ASTRO\cosmo p4ssw0rd!4

Primary Access Token

cmd.exe

chrome.exe

Primary Access Token

Primary Access Token

Process Failure Modes, James Forshaw: https://www.youtube.com/watch?v=dB3seu4o24A

Logon Sessions and Access Tokens
explorer.exe

Interactive Session // Winsta0

ASTRO\cosmo p4ssw0rd!4

Primary Access Token

cmd.exe

chrome.exe

Primary Access Token

Restricted Access Token

https://chromium.googlesource.com/chromium/src/+/master/docs/design/sandbox.md

Logon Sessions and Access Tokens
explorer.exe

Interactive Session // Winsta0

ASTRO\cosmo p4ssw0rd!4

Primary Access Token

cmd.exe

chrome.exe

Primary Access Token

Restricted Access Token

file.txt

Logon Sessions and Access Tokens
explorer.exe

Interactive Session // Winsta0

ASTRO\cosmo p4ssw0rd!4

Primary Access Token

cmd.exe

chrome.exe

Primary Access Token

Restricted Access Token
Desired Access: READ_ONLY

file.txt

Logon Sessions and Access Tokens
explorer.exe

Interactive Session // Winsta0

ASTRO\cosmo p4ssw0rd!4

Primary Access Token

cmd.exe

chrome.exe

Primary Access Token

Restricted Access Token
Desired Access: READ_ONLY

file.txt

Security Descriptor

Windows Security Internals: Network Authentication

Network Authentication

Network Authentication
CLIENT
Primary Access Token
Interactive Logon Session for: ASTRO\cosmo

SERVER \\MISTAKENOT-DC-1

Network Authentication
CLIENT
Primary Access Token
Interactive Logon Session for: ASTRO\cosmo

SERVER \\MISTAKENOT-DC-1

Cached Credentials
https://clymb3r.wordpress.com/2013/11/03/powershell-and-token-impersonation/

Network Authentication

CLIENT
Primary Access Token

Attempt to access a network resource

Interactive Logon Session for: ASTRO\cosmo

Cached Credentials

SERVER \\MISTAKENOT-DC-1

Network Authentication

CLIENT
Primary Access Token

Attempt to access a network resource

Interactive Logon Session for: ASTRO\cosmo
Cached Credentials

Network authentication via Kerberos or
NTLM

SERVER \\MISTAKENOT-DC-1

Network Authentication

CLIENT
Primary Access Token

Attempt to access a network resource

Interactive Logon Session for: ASTRO\cosmo
Cached Credentials

Network authentication via Kerberos or
NTLM

SERVER

\\MISTAKENOT-DC-1

Network Logon Session for: ASTRO\cosmo

Impersonation
Access Token

Network Authentication

CLIENT
Primary Access Token

Attempt to access a network resource

Interactive Logon Session for: ASTRO\cosmo
Cached Credentials

Network authentication via Kerberos or
NTLM

SERVER

\\MISTAKENOT-DC-1

Network Logon Session for: ASTRO\cosmo

Impersonation
Access Token

NO CACHED CREDENTIALS

Impersonation

Impersonation
· From the server's perspective, we now have a handle to a token but how do we actually use it?
· Access tokens provide an abstraction for developers to make "localized changes" to the security context without affecting other processes*
· However, in multi-threaded applications, problems and difficult to debug race conditions may arise if different threads start enabling or disabling different privileges or modifying DACLS
· Impersonation allows a thread to switch to a different security context (by default threads will inherit the same security context as the primary token of the process)
*Programming Windows Security, Keith Brown (2000)

Impersonation

Primary Access Token

Thread 1

Thread 2

Thread 3

Thread 4

Impersonation

Primary Access Token

AdjustTokenPrivileges()

AdjustTokenPrivileges()

Thread 1

Thread 2

Thread 3

Thread 4

https://docs.microsoft.com/en-us/windows/win32/api/securitybaseapi/nf-securitybaseapi-adjusttokenprivileges

Impersonation

Primary Access Token

Thread 1
Impersonation Access Token

Thread 2

Thread 3

Thread 4

Network Authentication

1

2

3

4

5

User is re-authenticated over
the network (either NTLM or Kerberos)

A new network logon session for the user is
created

The server process is presented with an
impersonation token which links back to the
remote client's new logon session

The server can use this token to impersonate the client to perform
work on their behalf

All subsequent access checks will use the
remote client's access token

Network Authentication
· For most of Windows' communication protocols (RPC, DCOM, Named pipes) this process is handled automatically
· The server only needs to call the appropriate API in order to obtain a handle to the remote clients' security context (e.g. access token) and start impersonating the client via functions such as:
ImpersonateNamedPipeClient() RpcImpersonateClient() CoImpersonateClient() DdeImpersonateClient()
Programming Windows Security, Keith Brown (2000)

How Attackers Abuse Access Tokens
ATT&CK technique: T1134

Initial Compromise
· Situation: An attacker has obtained a foothold in a corporate network by phishing a business user
· They have a shell in the context of the compromised user (who has no privileges across the domain) and any attempts to authenticate remotely will use the compromised user's credentials (which are no good!)
· The attacker must move laterally but what can they do?

Token Manipulation: The `Art of the Possible'

1

Steal the token of an already logged-on privileged user (non-network logon)

2

Create a new logon session with stolen credentials and impersonate the returned token/spawn a new process with it

Change the cached credentials associated with their current 3 access token to stolen credentials (e.g. legitimately via an
API or by directly modifying lsass memory)

/NETONLY
The Curious NETONLY Flag...
https://blog.cobaltstrike.com/2015/12/16/windows-access-tokens-and-alternate-credentials/

/NETONLY
· The Windows API provides the LogonUserA/W() function(s) to create a new logon session for a given user (or principal)
· Both are wrappers around LogonUserExExW() in SspiCli.dll
BOOL LogonUserA( LPCSTR lpszUsername, LPCSTR lpszDomain, LPCSTR lpszPassword, DWORD dwLogonType, DWORD dwLogonProvider, PHANDLE phToken
);
dwLogonType = LOGON32_LOGON_INTERACTIVE
https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-logonusera https://docs.microsoft.com/en-us/windows/win32/secauthn/logonuserexexw

/NETONLY
· If you receive a primary token and wish to impersonate you must first convert it to an impersonation token via DuplicateTokenEx:

BOOL DuplicateTokenEx(

HANDLE

hExistingToken,

DWORD

dwDesiredAccess,

LPSECURITY_ATTRIBUTES

lpTokenAttributes,

SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,

TOKEN_TYPE

TokenType,

PHANDLE

phNewToken

);

TokenType = TokenImpersonate

https://docs.microsoft.com/en-us/windows/win32/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex

/NETONLY
· If you receive an impersonation token you can use either SetThreadToken or ImpersonateLoggedOnUser to enable the calling thread to impersonate the security context of the logged-on user
BOOL SetThreadToken( PHANDLE Thread, HANDLE Token
);
BOOL ImpersonateLoggedOnUser( HANDLE hToken
);
https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadtoken https://docs.microsoft.com/en-us/windows/win32/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser

/NETONLY
· If you receive an impersonation token you can use either SetThreadToken or ImpersonateLoggedOnUser to enable the calling thread to impersonate the security context of the logged-on user
· Both are wrappers around undoc NtSetInformationThread in Ntdll
BOOL SetThreadToken( PHANDLE Thread, HANDLE Token
);
BOOL ImpersonateLoggedOnUser( HANDLE hToken
);
http://undocumented.ntinternals.net/UserMode/Undocumented%20Functions/NT%20Objects/Thread/NtSetInformationThread.html

/NETONLY

dwLogonType

Token returned

Interactive (LOGON32_LOGON_INTERACTIVE)

Primary

Cache Credentials?

Is returned token elevated? (if admin)

Yes

No (UAC applies)

Interactive (RID-500/ Local Admin)

Primary

Yes

Yes

Network (LOGON32_LOGON_NETWORK)

Impersonation

No

Yes (+ all privs enabled)

Network (RID-500/ Local Admin)

Impersonation

No

Depends on remote UAC settings*

*See for more info: https://blueteamer.blogspot.com/2018/12/disabling-uac-remote-restrictions-to.html https://support.microsoft.com/en-gb/help/951016/description-of-user-account-control-and-remote-restrictions-in-windows

/NETONLY

BOOL LogonUserA( Administrator, ASTRO, x2yts68u!, LOGON32_LOGON_INTERACTIVE, ...
);

/NETONLY

BOOL LogonUserA( Administrator, ASTRO, x2yts68u!, LOGON32_LOGON_INTERACTIVE, ...
);

/NETONLY

BOOL LogonUserA( Administrator, ASTRO, x2yts68u!, LOGON32_LOGON_NEW_CREDENTIALS, ...
);

/NETONLY
Access Token
Interactive Logon Session for: ASTRO\cosmo
Cached Credentials for: ASTRO\cosmo

CLIENT

SERVER \\MISTAKENOT-DC-1

/NETONLY
Access Token

CLIENT

Interactive Logon Session for: ASTRO\cosmo

NewCredentials Logon Session for: ASTRO\cosmo

Cached Credentials for: ASTRO\cosmo

Cached Credentials for: ASTRO\Administrator

SERVER \\MISTAKENOT-DC-1

/NETONLY
Access Token

CLIENT

Attempt to access a network resource

Interactive Logon Session for: ASTRO\cosmo

NewCredentials Logon Session for: ASTRO\cosmo

SERVER \\MISTAKENOT-DC-1

Cached Credentials for: ASTRO\cosmo

Cached Credentials for: ASTRO\Administrator

/NETONLY
Access Token

CLIENT

Attempt to access a network resource

SERVER \\MISTAKENOT-DC-1

Interactive Logon Session for: ASTRO\cosmo
Cached Credentials for: ASTRO\cosmo

NewCredentials Logon Session for: ASTRO\cosmo
Cached Credentials for: ASTRO\Administrator

Network authentication via Kerberos or
NTLM

Network Logon Session for: ASTRO\Administrator

https://github.com/cobbr/Covenant/blob/1d1daaad77786a9eb7fb8c7be0fc56f75b653421/Covenant/Data/Tasks/MakeToken.task#L17

CreateProcessWithLogonW

· Can replicate the same behaviour with CreateProcessWithLogonW!

BOOL CreateProcessWithLogonW (

LPCWSTR

lpUsername,

LPCWSTR

lpDomain,

LPCWSTR

lpPassword,

DWORD

dwLogonFlags ,

LPCWSTR

lpApplicationName,

LPWSTR

lpCommandLine,

DWORD

dwCreationFlags,

LPVOID

lpEnvironment,

LPCWSTR

lpCurrentDirectory,

LPSTARTUPINFOW

lpStartupInfo,

LPPROCESS_INFORMATION lpProcessInformation

);

dwLogonFlags = LOGON_NETCREDENTIALS_ONLY
https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-createprocesswithlogonw

/NETONLY DEMO
The Curious NETONLY Flag...
https://blog.cobaltstrike.com/2015/12/16/windows-access-tokens-and-alternate-credentials/

Pass-The-Ticket
Taming the Three-Headed Dog...

Pass-The-Ticket

TGT for cosmo@ASTRO
Cached Kerberos credentials for ASTRO\cosmo

Interactive Logon Session for: ASTRO\cosmo

Primary Access Token

User: ASTRO\cosmo User SID: S-1-5-21-36...32-1106 AuthID: 00000000:01c7a354

https://posts.specterops.io/kerberosity-killed-the-domain-an-offensive-kerberos-overview-eb04b1402c61 https://en.wikipedia.org/wiki/Kerberos_(protocol)#Protocol

Pass-The-Ticket

TGT for Administrator@ASTRO
Cached Kerberos credentials for ASTRO\cosmo

Interactive Logon Session for: ASTRO\cosmo

Primary Access Token

User: ASTRO\cosmo User SID: S-1-5-21-36...32-1106 AuthID: 00000000:01c7a354

https://www.blackhat.com/docs/us-14/materials/us-14-Duckwall-Abusing-Microsoft-Kerberos-Sorry-You-Guys-Don't-Get-It.pdf https://github.com/GhostPack/Rubeus

Pass-The-Ticket

NTSTATUS LsaConnectUntrusted( PHANDLE LsaHandle
);

NTSTATUS LsaLookupAuthenticationPackage(

HANDLE

LsaHandle,

PLSA_STRING PackageName,

PULONG

AuthenticationPackage

);

PackageName = MICROSOFT_KERBEROS_NAME_A

https://docs.microsoft.com/en-us/windows/win32/api/ntsecapi/nf-ntsecapi-lsaconnectuntrusted https://docs.microsoft.com/en-us/windows/win32/api/ntsecapi/nf-ntsecapi-lsalookupauthenticationpackage

Pass-The-Ticket
LsaCallAuthenticationPackage()

NTSTATUS LsaCallAuthenticationPackage(

HANDLE LsaHandle,

ULONG

AuthenticationPackage,

PVOID

ProtocolSubmitBuffer,

ULONG

SubmitBufferLength,

PVOID

*ProtocolReturnBuffer,

PULONG ReturnBufferLength,

PNTSTATUS ProtocolStatus

);

https://docs.microsoft.com/en-us/windows/win32/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage https://github.com/GhostPack/Rubeus/blob/732303e2f182d25e81ae25b4351782b2d0f061d0/Rubeus/lib/LSA.cs#L855 https://github.com/gentilkiwi/mimikatz/blob/b008188f9fe5668b5dae80c210290c7efa872ffa/mimikatz/modules/kerberos/kuhl_m_kerberos.c#L54

Pass-The-Ticket
KerbSubmitTicketMessage
Typedef struct _KERB_SUBMIT_TKT_REQUEST { KERB_PROTOCOL_MESSAGE_TYPE MessageType; LUID LogonId; ULONG Flags; KERB_CRYPTO_KEY32 Key; ULONG KerbCredSize; ULONG KerbCredOffset;
} KERB_SUBMIT_TKT_REQUEST, *PKERB_SUBMIT_TKT_REQUEST
https://docs.microsoft.com/en-us/windows/win32/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type https://www.ietf.org/rfc/rfc4120.txt

Pass-The-Ticket DEMO
Taming the Three-Headed Dog...

Pass-The-Ticket
· You do not need privileges to change the TGT associated with your logon session
· You do not need to create additional logon sessions (unless you want to preserve your current TGT!)
· Also note that through LsaCallAuthenticationPackage() an attacker (in a high-integrity context*) can also enumerate/dump credentials (e.g. tickets) of other users without opening a handle to lsass
· Hence Kerberos ticket attacks represents a gap in any credential theft logic predicated on a kernel/user-mode object callback (i.e. opening a handle to lsass or reading lsass memory - e.g. Sysmon process access)
*https://www.harmj0y.net/blog/redteaming/rubeus-now-with-more-kekeo/

Overpass-The-Hash

Pass-the-hash
CLIENT
Access Token
Interactive Logon Session for: ASTRO\cosmo
LSASS (msv1_0.dll)
87976f70e6690b5289da518b7a1659f5

SERVER \\MISTAKENOT-DC-1

Pass-the-hash
CLIENT
Access Token
Interactive Logon Session for: ASTRO\cosmo

SERVER \\MISTAKENOT-DC-1

LSASS (msv1_0.dll)
c0f969f35beb20e8f09ce86ef42ccd51
https://www.slideshare.net/rootedcon/hernan-ochoa-wce-internals-rootedcon-2011 https://blog.xpnsec.com/exploring-mimikatz-part-1/

Pass-the-hash
CLIENT
Access Token
Interactive Logon Session for: ASTRO\cosmo
LSASS (msv1_0.dll)
c0f969f35beb20e8f09ce86ef42ccd51

Attempt to access a network resource

SERVER \\MISTAKENOT-DC-1

Pass-the-hash
CLIENT
Access Token
Interactive Logon Session for: ASTRO\cosmo
LSASS (msv1_0.dll)
c0f969f35beb20e8f09ce86ef42ccd51

Attempt to access a network resource
Network authentication via NTLM with
stolen hash

SERVER
\\MISTAKENOT-DC-1
Network Logon Session for: ASTRO\Administrator

Overpass-the-hash
CLIENT
Access Token
Interactive Logon Session for: ASTRO\cosmo
LSASS (kerberos.dll)
87976f70e6690b5289da518b7a1659f5 TGT for cosmo@ASTRO

KDC \\MISTAKENOT-DC-1

Overpass-the-hash
CLIENT
Access Token
Interactive Logon Session for: ASTRO\cosmo
LSASS (kerberos.dll)
c0f969f35beb20e8f09ce86ef42ccd51

KDC \\MISTAKENOT-DC-1

Overpass-the-hash
CLIENT
Access Token

Interactive Logon Session for: ASTRO\cosmo
LSASS (kerberos.dll)
c0f969f35beb20e8f09ce86ef42ccd51

AS-REQ

KDC \\MISTAKENOT-DC-1

Overpass-the-hash
CLIENT
Access Token

Interactive Logon Session for: ASTRO\cosmo

AS-REQ

KDC \\MISTAKENOT-DC-1

LSASS (kerberos.dll)
c0f969f35beb20e8f09ce86ef42ccd51
TGT for Administrator@ASTRO

AS-REP

https://www.blackhat.com/docs/us-14/materials/us-14-Duckwall-Abusing-Microsoft-Kerberos-Sorry-You-Guys-Don't-Get-It.pdf

Overpass-the-hash
Mimikatz workflow

1

2

3

4

5

Create a new sacrificial NETONLY process with junk credentials (which preserves current TGT and creates a new
logon session)

Acquire debug privilege or
impersonate a SYSTEM token

Open up a write handle to lsass

Patch in new NTLM hash associated with new sacrificial logon session

The normal Kerberos
authentication process starts and
returns a fully fledged TGT

https://github.com/gentilkiwi/mimikatz/blob/e10ec9aa5b42a2464b01c8843a5cc53bbcfe17ba/mimikatz/modules/sekurlsa/kuhl_m_sekurlsa.c#L880

Detecting Access Token Manipulation

Frida
· Dynamic instrumentation toolkit · Allows us to hook functions and write
custom and scriptable detection logic on the fly · Can capture arguments pre and post function call · Write detection logic based on parameters to functions or returned values/output buffers!

https://frida.re/

Frida
Basic JS hooking template:
// Obtain a Frida NativePointer to function of interest var functionX = Module.findExportByName("ntdll", "functionX")
// Start hooking function of interest Interceptor.attach(functionX, { onEnter: function (args, state) {
console.log("[+] Target process called functionX");
// Read args as required and implement detection logic },
onLeave: function (retval) { // Access output buffers or return values as required
}
https://github.com/sensepost/frida-windows-playground https://www.fuzzysecurity.com/tutorials/29.html

Detecting Access Token Manipulation

Technique
1. NETONLY

Signals
 CreateProcessWithLogonW  LogonUser + Impersonation

Other Telemetry Sources

/NETONLY Frida DEMO
The Curious NETONLY Flag...
https://blog.cobaltstrike.com/2015/12/16/windows-access-tokens-and-alternate-credentials/

Detecting Access Token Manipulation

Technique
1. NETONLY

Signals

Other Telemetry Sources

 CreateProcessWithLogonW  LogonUser + Impersonation

1. Windows Event Logs 2. Process events

Detecting Access Token Manipulation

Spawning a Process with the NETONLY Flag

Access Token
User: ASTRO\cosmo User SID: S-1-5-21-36...32-1106 AuthID: 00000000:01c7a354 Integrity: High/Medium
Ignore: Runas.exe ShellRunAs.exe etc..

CreateProcessWithLogonW() (NETONLY)
Access Token
User: ASTRO\cosmo User SID: S-1-5-21-36...32-1106 AuthID: 00000000:001b0e53

Spawning a Process as Another User

Access Token

CreateProcessWithLogonW() CreateProcessWithTokenW() CreateProcessAsUserA() (*Can spoof ppid)

User: ASTRO\cosmo User SID: S-1-5-21-36...32-1106 AuthID: 00000000:01c7a354 Integrity: High/Medium

Access Token

Ignore: Runas.exe ShellRunAs.exe etc..

User: ASTRO\Administrator User SID: S-1-5-21-36...32-500 AuthID: 00000000:001aa83d

https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-createprocesswithtokenw https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessasusera

Spawning a Suspicious/Unsigned Process as Another User
Sample EQL query:
sequence [process where integrity_level in ("low", "medium", "high") and not process_name in ("runas.exe", "ShellRunas.exe") ] by unique_pid [process where ( process_name in ("cmd.exe", "msbuild.exe", /* etc. */) or signature_status != "trusted" )] by unique_ppid
| filter events[0].user_sid != events[1].user_sid
https://eql.readthedocs.io/en/latest/query-guide/index.html

Detecting Access Token Manipulation

Technique
1. NETONLY 2. Pass-The-Ticket

Signals

Other Telemetry Sources

 CreateProcessWithLogonW  LogonUser + Impersonation

1. Windows Event Logs 2. Process events

 LsaCallAuthenticationPackage + KERB_SUBMIT_TKT_REQUEST

Pass-The-Ticket Frida DEMO
Taming the Three-Headed Dog...

Detecting Access Token Manipulation

Technique
1. NETONLY 2. Pass-The-Ticket

Signals

Other Telemetry Sources

 CreateProcessWithLogonW  LogonUser + Impersonation

1. Windows Event Logs 2. Process events

 LsaCallAuthenticationPackage + KERB_SUBMIT_TKT_REQUEST

Detecting Access Token Manipulation

Technique

Signals

Other Telemetry Sources

1. NETONLY 2. Pass-The-Ticket

 CreateProcessWithLogonW  LogonUser + Impersonation

1. Windows Event Logs 2. Process events

 LsaCallAuthenticationPackage + KERB_SUBMIT_TKT_REQUEST

3. Overpass-The-Hash

 CreateProcessWithLogonW  Impersonate SYSTEM token  Write handle access to lsass

Overpass-The-Hash Frida DEMO

Detecting Access Token Manipulation

Technique

Signals

Other Telemetry Sources

1. NETONLY

 CreateProcessWithLogonW  LogonUser + Impersonation

1. Windows Event Logs 2. Process events

2. Pass-The-Ticket

 LsaCallAuthenticationPackage + KERB_SUBMIT_TKT_REQUEST

3. Overpass-The-Hash

 CreateProcessWithLogonW  Impersonate SYSTEM token  Write handle access to lsass

1. Windows Event Logs 2. Process events 3. Sysmon Event ID 10: Process
Access to Lsass

Conclusion

Conclusion
· Windows Security can appear quite intimidating but is conceptually simple
· Irrespective of what tools are used or what authentication provider is abused, attackers act under a set of constraints that result in the same anomalous signals for access token manipulation
· The techniques shown in this presentation are not intended to be production ready but show the art of the possible from both an offensive and defensive perspective
· This can act as a springboard for defence practitioners to determine their own ability to detect and respond to these attacks and as ideas for future threat hunts

Thank You

