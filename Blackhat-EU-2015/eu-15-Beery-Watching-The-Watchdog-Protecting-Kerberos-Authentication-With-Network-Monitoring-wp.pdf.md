WATCHING THE WATCHDOG: PROTECTING KERBEROS AUTHENTICATION WITH NETWORK MONITORING
Authors: Tal Be'ery, Sr. Security Research Manager, Microsoft Michael Cherny, Sr. Security Researcher, Microsoft
November 2015

Contents
Intro ........................................................................................................................................................ 3 The Kerberos protocol ............................................................................................................................. 4
Kerberos Message Flow ....................................................................................................................... 4 The Kerberos TGT ................................................................................................................................ 5 Network Monitoring of the Kerberos Protocol ..................................................................................... 6 Forged Key: The Skeleton Key Malware ................................................................................................... 7 The Skeleton Key Malware Technical details ........................................................................................ 7 Kerberos Pre-Authentication ............................................................................................................... 8 Network-Based Detection of the Skeleton Key Malware .................................................................... 10
Passive downgrade detection ........................................................................................................ 10 Active downgrade detection .......................................................................................................... 11 Forged Ticket: The Golden Ticket Attack ................................................................................................ 12 Attack Details .................................................................................................................................... 12 Network Based Detection of the Golden Ticket Attack ....................................................................... 12 Forged PAC: The MS14-068 Attack ........................................................................................................ 15 The vulnerability: PAC can be signed without the key ........................................................................ 15 The Exploit ........................................................................................................................................ 17 Network Based Detection of MS14-068 Forged PAC .......................................................................... 19 Forged PAC revisited: The Diamond PAC................................................................................................ 20 Diamond PAC Generation and Injection ............................................................................................. 20 Network Based Detection of the Diamond PAC Attack ....................................................................... 21

Intro
Being the default authentication protocol for Windows-based networks, the Kerberos protocol is a prime target for attackers, especially for APTs attackers, seeking to steal the user's identity and steal secrets from the enterprise's data center.
Recently, it seems that hacker had progressed from merely stealing Kerberos related tokens in order to steal the identity of the domain users, to forgery attacks in order to gain even greater powers within the domain.
In this document we will explore in detail three different forging techniques and how they can be detected by using Network monitoring.
These forging techniques were recently used by attackers to subvert different elements of the Kerberos protocol:
 Forged key: Skeleton Key  Forget Ticket: Golden Ticket  Forged PAC: MS14-068
We will also suggest the "Diamond PAC" attack, a novel variant of the Golden Ticket and Forged PAC attacks and its detection using network monitoring, again.

The Kerberos protocol
Kerberos is an Authentication and Authorization protocol, standardized and maintained by the IETF (mainly in RFC 41201) and implemented by many Operating Systems (OS), including but not limited to Windows, Linux and Mac OSX. The Kerberos authentication and authorization protocol enables the transparent Single Sign On (SSO) experience. The SSO enables users to actively authenticate (i.e. provide their password) only once even though they access various services.
Kerberos Message Flow
The Kerberos authentication and authorization protocol works in the following manner:
Figure 1 Kerberos Authentication Flow
1. The user provides the Domain Name, user and password to access their computer. 2. The computer authenticates to the Authentication Server (AS) residing on the Key Domain Controller
(KDC). Accordingly, the KDC provides the computer with a Ticket Granting Ticket (TGT). The TGT is an identifier which enables the computer to request access to services without having the user to resupply their credentials.
1 https://www.ietf.org/rfc/rfc4120.txt

3. Each time the computer attempts to access a service, it first identifies itself to the Domain Controller (DC), residing on the KDC, with the TGT as provided earlier by the AS. The DC, through its Ticket Granting Server (TGS), provides the user with a ticket for the particular requested service.
4. The user provides the service ticket to the service. Since the ticket was validated by the TGS, the service grants authorization. Accordingly, the connection between the user and the service is established.
In Windows networks the KDC is implemented in the Active Directory (AD) service on the Domain Controller (DC) server. Therefore we will use KDC, AD and DC interchangeably throughout this document. Note that for subsequent authorizations requests only steps 3 and 4 are repeated and the Authentication Server (AS) is not involved in these transactions. The provided TGT is used as a proof that a successful authentication had taken place. The user credentials are only used in the preliminary authentication stage. From thereafter, the Kerberos protocol only uses the TGT ticket. On the one hand, this feature improves the efficiency of the protocol. On the other hand, however, the TGT ticket becomes a single point of failure in the authentication and authorization process.
The Kerberos TGT
The Kerberos TGT contains all of the user's relevant authentication and authorization information. This information enables the KDC to rely solely on the ticket information, without any need to make any further queries, thus improving the protocol's efficiency.
In particular, the TGT ticket contains the following fields:
 Name: The user's name the ticket is associated with  Start time and End time: marks the validity period of the ticket. By default, in Windows networks,
the validity period is set to ten hours.  Authorization-data: Authorization data details the user's privileges and access rights. In Windows,
the authorization data take the form of a Privilege Attribute Certificate (PAC) object. PAC2 is a "Microsoft-specific authorization data present in the authorization data field of a ticket. The PAC contains several logical components, including group membership data for authorization,
2 http://msdn.microsoft.com/en-us/library/a61a2ecd-de81-4586-8db6063873dd4910#privilege_attribute_certificate

alternate credentials for non-Kerberos authentication protocols, and policy control information for supporting interactive logon."
To protect the TGT ticket from being fiddled with, the TGT ticket is encrypted with a key that is known to only the AS and the KDC. In Active Directory, this key is generated from the KRBTGT service account credentials.
Network Monitoring of the Kerberos Protocol
The network monitoring of the Kerberos protocol can be achieved through a passive Security Device (SD), monitoring Kerberos traffic through a network's switch port-mirroring.
Passively Listening to Kerberos Traffic
Kerberos Traffic SD
Main frame

Printer Smart Phone

Kerberos Traffic Kerberos Traffic

Kerberos Traffic

Active Directory (Kerberos Server)

Kerberos Traffic
PC
Figure 2 Network Monitoring of the Kerberos Protocol
Due to the standardization of the protocol, the same SD can monitor the Kerberos traffic, regardless of the hardware and operating system of the originating device. We will show below, that even though some portions of the Kerberos traffic are encrypted, the SD can detect the discussed attack, with no prior knowledge of Kerberos secrets.

Forged Key: The Skeleton Key Malware
On January, Dell Secureworks had shared a report3 on an advanced attack campaign utilizing a dedicated DC malware, named "Skeleton Key" Malware. The Skeleton Key malware modifies the DC behavior to accept authentications specifying a secret "Skeleton key" (i.e. "master key") password, thus enabling the attackers to login from any computer as any domain user without installing any additional malware while keeping the original users' authentication behavior.
The Skeleton Key Malware Technical details
Skeleton Key has been designed to meet the following principles:
1. Domain user can still login with their user name and password so it won't be noticed. 2. Attacker can login as any domain user with Skeleton Key password. 3. Otherwise, the login would fail, i.e. if the domain user is neither using the correct password nor
the Skeleton Key password, the login would fail.
To do so, the malware changes to the usual password validation process within the DC. If the usual check against the user's key has failed an additional check that uses the attackers key is performed.
However, there is one more challenge to tampering with Kerberos authentication: Kerberos newer encryption types (such as AES) require that a salt string (usually the user name) would be added to the key derivation function, to make the same passwords of different users create non-identical encryption keys.
To support a salt-enabled key-derivation function, the malware would need to either:
 Compute all of the domain users' Skeleton Key offline and store them, which requires a lot of memory; or
 Compute the relevant user's Skeleton Key in real-time, which is likely to cause performance issues on the DC, as the AES key derivation function (PBKDF24) is designed to be costly.
Therefore, the Skeleton Key malware chooses to support only RC4-HMAC based Kerberos authentication, as RC4-HMAC`s key-derivation function does not involve a user-based salt. As a result, the Skeleton RC4-HMAC key remains the same for all users, which greatly simplifies the malware's implementation.
Therefore, to support Skeleton Key for Kerberos authentication, the malware:  Hooks SamIRetrieveMultiplePrimaryCredentials() to make sure the users will authenticate using
RC4-HMAC encryption instead of AES encryption. Hooked SamIRetrieveMultiplePrimaryCredentials() checks for package name "Kerberos-Newer-Keys5", it returns STATUS_DS_NO_ATTRIBUTE_OR_VALUE to effectively disable AES based authentication.  Patches CDLocateCSystem(unsigned int dwEtype, PCRYPTO_SYSTEM *ppcsSystem) in cryptdll.dll. The patched CDLocateCSystem() hooks the Decrypt and Initialize function pointers fields in CRYPTO_SYSTEM structure for dwEtype == 0x17 (RC4_HMAC) .The hooked Decrypt function first calls the original Decrypt function to make sure the users can still logon with their original user
3 http://www.secureworks.com/cyber-threat-intelligence/threats/skeleton-key-malware-analysis/ 4 http://en.wikipedia.org/wiki/PBKDF2 5 https://msdn.microsoft.com/en-us/library/cc941808.aspx

name and password. If this fails, it replaces the password hash with the supplied Skeleton Key RC4HMAC key and calls the original Decrypt function again. In this second call, decryption function will return success (NT_SUCCESS) if the skeleton password RC4-HMAC key was used to encrypt. Hence the attacker can always pass the Kerberos authentication successfully with the Skeleton Key password. As a result of the publication, a very similar Skeleton key functionality was added to Mimikatz6 which means that it is easily available to attackers.
Figure 3 Mimikatz support for Skeleton Key
Kerberos Pre-Authentication
In Kerberos the server uses pre-authentication in order to validate the user identity before sending any encrypted data, encrypted with the user long-term key, derived from user's password. When using passwords to authenticate, the pre-authentication method is the encrypted time-stamp. The user encrypts the current time-stamp with its long-term key as a proof of password knowledge. To support this process, a handshake phase must be supported by the protocol:
 To determine a common encryption algorithm: Since the Kerberos protocol supports multiple encryption algorithms, a handshake phase is needed to determine an encryption types (EType) that can be used by both sides of the transaction.
 To determine the user's salt: Salt is a unique, non-secret string added to the password in the key derivation function, in order to ensure that two different users having the same password will
6 https://github.com/gentilkiwi/mimikatz/releases/tag/2.0.0-alpha-20150117

not have the same key. The salt is determined per the encryption type. Some encryption algorithms does not support salt at all (RC4-HMAC) The Kerberos handshake phase details: 1. The client (In most cases the client is the Windows OS native client) first sends AS-REQ message detailing the encryption types supported by it
Figure 4 Initial AS-REQ with the client's supported ETypes
2. The DC responds with Kerberos error message, detailing (within the PA-ETYPE-INFO2 field) all the encryption types which the user keys are stored within the DC database and were also present in client's AS-REQ message.
Figure 5 DC's PA-ETYPE-INFO2

3. The client selects one of the DC returned encrypted types, encrypts the timestamp with it and sends it as pa-enc-timestamp in AS-REQ
Figure 6 Timestamp encrypted in the mutually agreed EType
Network-Based Detection of the Skeleton Key Malware
The Skeleton Key malware can be removed from the system after a successful infection, while leaving the compromised authentication in place. This can pose a challenge for antimalware engines to detect the compromise. However, it is still possible to detect the presence of Skeleton Key malware using "over the wire detection". The key for the over the wire detection is the fact that the malware downgrades the Kerberos encryption types supported by the DC. This detection method is only relevant for domains operating in a Domain Functional Level (DFL) that enables AES (DFL is greater or equal to 20087). The detection of encryption downgrade can be carried out in either a passive or an active manner. Passive downgrade detection A passive monitoring device situated in front of the DC, can monitor ingress and egress traffic and detect the attack using the following algorithm.
1. Get the client advertised E-Types from the user's AS-REQ and check for AES support. 2. Get the DC advertised E-Types from the PA-ETYPE-INFO2 in the corresponding DC Kerberos
Error. 3. If the client advertised its support for AES and the DC is known to have AES keys for this user,
and yet this encryption type does not appear in the DC advertised response, then it's a good indication that some external party had fiddled with the client keys stored in DC. Note that no access to the client's or DC's secrets (passwords) is required in order to implement this algorithm
7 https://technet.microsoft.com/en-us/library/understanding-active-directory-functionallevels%28v=ws.10%29.aspx

Figure 7 Network-based detection of the Skeleton key malware
Active downgrade detection An active approach to detection is to make an authentication request as a user using the AES encryption and observe a downgrade to RC4 by the DC. We had shared a publicly available standalone detection script8 which is capable of detecting such user-encryption downgrade on DC. The script works as follows:
1. Verifies whether the Domain Functional Level (DFL) of current domain supports AES (>= 2008). 2. Finds an AES supporting account (msds-supportedencryptiontypes9 >= 8). 3. Sends a Kerberos AS-REQ to all DCs with only AES EType supported. 4. If AS-REQ fails due to AES encryption not supported, then there's a good chance the DC is
infected. Note that no access to the client's or DC's secrets (passwords) is required in order to implement this algorithm.
Figure 8 Execution of the script on all DCs of a non-infected domain
8 https://gallery.technet.microsoft.com/Aorato-Skeleton-Key-24e46b73/ 9 https://msdn.microsoft.com/en-us/library/cc223853.aspx

Figure 9 Execution of the script on a Mimikatz Skeleton
Forged Ticket: The Golden Ticket Attack
Golden tickets are Kerberos TGTs forged by the attackers. The attacker can control every aspect of the forged ticket including the Ticket's user identity, permissions and ticket life time. Attackers typically set Golden Tickets to have an unusually long lifetime, which allows the possessing entity to keep using them for a long period without renewal. In addition to the lifetime, other important attributes of the ticket are typically forged to achieve other nefarious goals, such as assigning very high permissions, impersonating other users and even using non-existing user names.
Attack Details
In this Golden Ticket attack, the attacker:
1. Gains access to the Active Directory server itself 2. Steals the keys of the KRBTGT account from AD memory or hard drive. 3. Forges TGTs, using the KRBTGT key. Note that the forged ticket can contain arbitrary information
including excessive privileges and ticket end time, hence the "golden". 4. Copies ("pass") the forged ticket to a remote machine to impersonate the victim on that machine. 5. Connects to various enterprise services on behalf of the victim from the remote machine.
Technically, the attacker achieves this ability by providing the forged TGT on the remote machine as the authentication data for the authorization process on the TGS_REQ message.
Network Based Detection of the Golden Ticket Attack
A passive Security Device (SD), monitoring Kerberos traffic is able to recouple the authorization requests together with their original authentication transaction and thus detect such decoupling attacks against the Authentication and Authorization system.

The TGT is supplied to the client from the AD with AS_REP message and quoted by the client on the subsequent authorization requests in the TGS_REQ. The key to recoupling is the fact that TGT is quoted verbatim. Therefore, the SD is able to associate the relevant authentication information as expressed in the authentication transaction (the AS_REQ-AS_REP message exchange) with the authorization transaction (the TGS_REQ-TGS_REP message exchange). Note that the fact that TGT itself is encrypted is irrelevant for recoupling purposes as the SD does not need to know the contents of the TGT, just to be able to identify that it's the same across different transactions. The figures below shows a typical flow of a single AS_REP authentication message, followed by a series of TGS_REQ authorization messages, all have the same TGT value, denoted by the "enc_part" column.
Figure 10 Network capture of Kerberos AS_REP, "enc-part" is TGT

Figure 11 Network capture of Kerberos TGE_REQ, "enc-part" is TGT
Figure 12 Network capture of Kerberos traffic, "enc-part" is TGT, "info" is Kerberos message name
When the attacker uses the forged TGT in a TGS-REQ, the SD tries to retrieve the original authentication transaction that created the TGT but fails as there is none. The SD flags this transaction as "Golden Ticket" attack.

Figure 13 Network based detection of the Golden Ticket attack
Forged PAC: The MS14-068 Attack
On November 2014, a vulnerability in Windows PAC validation (CVE-2014-6324) was publicly disclosed. The vulnerability allows the attackers to forge the TGT PAC and assign arbitrary privileges to the ticket. The vulnerability is patched with the MS14-068 fix. It was later published10 that this vulnerability was used by Duqu attackers to exploit the internal network of Kaspersky Labs.
The vulnerability: PAC can be signed without the key
The security of the PAC is guaranteed by the "Two PAC_SIGNATURE_DATA structures are appended to the PAC which stores the server and KDC signatures.11" In the case of TGT's PAC the server is the KDC, so both signatures are of the KDC.
10https://securelist.com/files/2015/06/The_Mystery_of_Duqu_2_0_a_sophisticated_cyberespionage_actor_return s.pdf 11 [MS-PAC]

Figure 14 The three available signature algorithms by [MS-PAC]
The root cause of the vulnerability is that, by mistake, the function that checks the PAC signature accepts other signing algorithms besides the ones mentioned above. In Windows 2008 (and before) the KDC code for signing algorithms includes key-less hashes such as MD5, that does not provide any security against masquerading PACs. In Windows 2012, KDC code does not allow any key-less hashing algorithms, but some of the allowed algorithms were using relatively weak ciphers such as DES.

The Exploit
In order to exploit the vulnerability the attacker must include its forged PAC within a ticket. However, this mission cannot be accomplished in a trivial manner by merely substituting the existing PAC in a ticket with a forged one, as the tickets are encrypted with KRBTGT key for TGT tickets and the respective service key for a Service Ticket.
Therefore the attacker acts as follows:
1. Send an AS-REQ for a PAC-less ticket. The attacker does that by including the pre-authentication field of PA-PAC-REQUEST (128) and sets its value to false.

Figure 15 PA_PAC_REQUEST set to FALSE
2. As a result a PAC-less ticket is sent to the client 3. The attacker sends a TGS-REQ with the forged PAC (encapsulated with relevant headers) and
encrypted with the session key (or sub-session key, anyway it's encrypted), using the "encauthorization-data" field in TGS-REQ. In order to have the PAC properly resigned (and for convenience), the attacker requests a ticket for KRBTGT as it would create a general TGT ticket. However, for older unpatched servers vulnerable CVE-2011-0043 (see above) the attacker can request a service ticket to the victim service directly. We had verified it for an unpatched Windows XP SP3.

Commented [TB1]: Seems like the other potential way to add authorization data (=authorizationdata in authenticator) does not work.

Figure 16 The enc-authorization-data Field
4. The KDC embeds the PAC in the returned ticket (TGT or Service Ticket) in the TGS-REP without ANY validation (it does not have to be a syntactically legal PAC, it work fine with a BLOB).
5. For a TGT obtained as above, the attacker requests a Service Ticket with a TGS-REQ that includes the TGT which contains the forged PAC.
6. The KDC validates the PAC and resigns the PAC with a valid service and KDC signatures and embeds it in the returned Service Ticket in the TGS-REP.
Notes:
 Win2012 servers the attackers cannot sign the PAC with key-less hashes, however they are able to use the relatively weak DES cipher which can be bruteforced. Therefore the attacker needs to repeat stage 4 above until it succeeds in finding the right PAC.
 Requesting PAC-less ticket is mandatory for a successful exploit. If the ticket already contains a PAC, it disregards the PAC in the enc-authorization-data field.

Network Based Detection of MS14-068 Forged PAC
The detection is based on observing:
 An AS-REQ with a PA-PAC-REQUEST set to false.  Adding authorization data in a subsequent TGS message  The target service has its NA bit set to false, which means it requires PAC for authorization.
As noted above, having a PAC-less ticket is mandatory for a successful attack. When no PA-PACREQUEST is specified, the KDC returns a PAC. Therefore, attackers must explicitly send the PA-PACREQUEST and set it to FALSE.
Note, that if a client does not want a TGT or TGS to contain a PAC because the client or the target server does not support PAC, the client does not need to specify it explicitly as the AD knows which account support PAC by some AD attribute (NA flag12).
Therefore, if the targeted service had its NA bit set to FALSE, which means they require PAC for authorization, we can safely assume the added authorization data is indeed a PAC.
12 [MS-KILE]:
"To support all functionality of KILE, the account database MUST be extended to support the following additional information for each principal:
AuthorizationDataNotRequired: A Boolean setting to control when to include a PAC in the service ticket. KILE implementations that use an Active Directory for the account database SHOULD use the userAccountControl attribute ([MS-ADTS] section 2.2.16) NA flag. The default is FALSE."
"3.3.5.3 PAC Generation
In either of the following two cases, a PAC [MS-PAC] MUST be generated and included in the response by the KDC when the client has requested that a PAC be included. The request to include a PAC is expressed through the use of a KERB-PA-PAC-REQUEST (section 2.2.2) PA-DATA type that is set to TRUE:
 During an Authentication Service (AS) request that has been validated with pre-authentication and for which the account has AuthorizationDataNotRequired set to FALSE.
 During a TGS request that results in a service ticket unless the NA bit is set in the UserAccountControl field in the KERB_VALIDATION_INFO structure ([MS-PAC] section 2.5).
Otherwise, the response will not contain a PAC."
[MS-ADTS]:
"NA (ADS_UF_NO_AUTH_DATA_REQUIRED, 0x02000000): Used by the Kerberos protocol.
This bit indicates that when the Key Distribution Center (KDC) is issuing a service ticket for this account, the Privilege Attribute Certificate (PAC) MUST NOT be included. For more information, see [RFC4120]"

Figure 17 Network based detection of MS14-068 forged PAC
Forged PAC revisited: The Diamond PAC
Diamond PACs are attacker crafted PAC using a stolen KRBTGT key, which will typically assign high privileges to the user's account, regardless of its original permissions.
In contrast to Golden Ticket which also use a stolen KRBTGT key and contains a crafted PAC to provide high privileges to the attacker, a Diamond PAC does not craft a full Kerberos ticket, but use a standard Kerberos flow (the same flow of used by the MS14-068 exploit) to inject the crafted Golden PAC.
By doing so, the Golden PAC represents a more subtle version of the Golden Ticket attack and thus harder to detect. Detection rules designed to catch Golden Ticket attack based on the Kerberos traffic anomaly it creates of a user sending a valid TGS with no prior AS requests to obtain a TGT will not alert on the Diamond PAC attack.
Diamond PAC Generation and Injection
Similar to Golden Ticket, In order to successfully generate a golden PAC, several pieces of information must be provided:
 krbtgt account key: The most crucial component. The key is used to sign the PAC.  The TGT's authentication time: Authentication time is a mandatory part of the PAC as it is used
by Kerberos to identify the client and verify that the PAC corresponds to the ticket granted to that specific client. Inconsistent authentication time between PAC and encapsulating ticket results in a failed attack ­ PAC validation failed!  The SID of the domain: must be provided, as it's a part of the PAC.  A valid domain account credentials: A successful AS_REQ is the initial stage of the attack.

Once the Diamond PAC is created, it is injected into a valid Ticket in the same manner as described for the MS14-068 forged PAC exploit above. The difference is that the Diamond PAC is validly signed using the KRBTGT key
Network Based Detection of the Diamond PAC Attack
Since the Golden PAC attack is using a valid method to inject authorization data and signs the PAC with a valid key, it will be accepted even by servers or DCs patched for the MS14-068 exploit. Therefore, it seems that the only way to detect this attack is following the same logic suggested above to detect MS14-068 forged PAC attack:
1. An AS-REQ with a PA-PAC-REQUEST set to false. 2. Adding authorization data in a subsequent TGS message 3. The target service has its NA bit set to false, which means it requires PAC for authorization.

