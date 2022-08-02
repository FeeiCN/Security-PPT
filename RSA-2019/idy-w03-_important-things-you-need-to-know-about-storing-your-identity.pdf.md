SESSION ID: IDY-W03
Understand Credential Security: Important Things You Need to Know About Storing Your Identity

Paula Januszkiewicz
CQURE: CEO, Penetration Tester / Security Expert CQURE Academy: Trainer MVP: Enterprise Security, MCT Microsoft Regional Director Contact: paula@cqure.us | http://cqure.us

#RSAC

#RSAC

#RSAC

#RSAC
Definition of credentials

Bootkey:
Class names for keys from HKLM\SYSTEM\CCS\Control\Lsa
$MACHINE.ACC (SYSTEM's Clear Text Password) DPAPI_SYSTEM (Master Keys) HKLM\SECURITY\Policy\Secrets

#RSAC
SAM/NTDS.dit (MD4 Hashes) C:\windows\system32\config C:\windows\system32\NTDS
LSA Secrets (Service Accounts) HKLM\SECURITY\Policy\Secrets
MSDCC2 (Cached Logon Data) HKLM\SECURITY\Cache

#RSAC
Are `cached credentials' safe?

#RSAC
Encrypted Cached Credentials: Legend
Encrypted Cached Credentials DK = PBKDF2(PRF, Password, Salt, c, dkLen)
Microsoft's implementation: MSDCC2= PBKDF2(HMAC-SHA1, DCC1, username, 10240, 16)

Cached Logons: It used to be like this...
The encryption algorithm is RC4. The hash is used to verify authentication is calculated as follows: DCC1 = MD4(MD4(Unicode(password)) . LowerUnicode(username)) is DCC1 = MD4(hashNTLM . LowerUnicode(username))
Before the attacks facilitated by pass-the-hash, we can only rejoice the "salting" by the username. There are a number pre-computed tables for users as Administrator facilitating attacks on these hashes.

#RSAC

Cached Logons: Now it is like this!
The encryption algorithm is AES128. The hash is used to verify authentication is calculated as follows: MSDCC2 = PBKDF2(HMAC-SHA1, Iterations, DCC1, LowerUnicode(username)) with DCC 1 calculated in the same way as for 2003 / XP.
There is actually not much of a difference with XP / 2003! No additional salting. PBKDF2 introduced a new variable: the number of iterations SHA1 with the same salt as before (username).

#RSAC

#RSAC
Cached Logons: Iterations
The number of iterations in PBKDF2, it is configurable through the registry:
HKEY_LOCAL_MACHINE\SECURITY\Cache DWORD (32) NL$IterationCount
If the number is less than 10240, it is a multiplier by 1024 (20 therefore gives 20480 iterations)
If the number is greater than 10240, it is the number of iterations (rounded to 1024)

#RSAC
Demo: Cached Credentials

#RSAC
Classic Data Protection API
Based on the following components:
Password, data blob, entropy
Is not prone to password resets!
Protects from outsiders when being in offline access Effectively protects users data
Stores the password history
You need to be able to get access to some of your passwords from the past
Conclusion:OSgreatly helpsustoprotectsecrets

#RSAC
Demo: Classic DPAPI
+ getting access to user's secrets in the domain

#RSAC
Demo: DPAPI Taken Further
+ Keepass

#RSAC
Demo: RDG Passwords
When centralization should be done with a bit more awareness

#RSAC
IIS Structure
HTTP.SYS

#RSAC
Application Pools
Used to group one or more Web Applications
Purpose: Assign resources, serve as a security sandbox
Use Worker Processes (w3wp.exe)
Their identity is defined in Application Pool settings Process requests to the applications
Passwords for AppPool identity can be 'decrypted' even offline
They are stored in the encrypted form in applicationHost.config
Conclusion: IIS relies it's security on Machine Keys (Local System)

#RSAC
Demo: Application Pools
Getting password from IIS configuration

#RSAC
IISWasKey
+ extracting the data from the registry

#RSAC
Services
Store configuration in the registry
Always need some identity to run the executable!
Local Security Authority (LSA) Secrets
Must be stored locally, especially when domain credentials are used Can be accessed when we impersonate to Local System
Their accounts should be monitored
If you cannot use gMSA, MSA, use subscription for svc_ accounts (naming convention)
Conclusion: Think twice before using an Administrative account, use gMSA

#RSAC
Demo: Services
Getting password from LSA Secrets

#RSAC
Chasing the obvious: NTDS.DIT, SAM
The above means: To read the clear text password you need to struggle!

#RSAC
Demo: SAM/NTDS.dit
Hash spree - offline

#RSAC

#RSAC
Two AMAZING discoveries!
Smart card logon is possible without a smart card
Private keys can be extracted from the PFX files without having a password

#RSAC
Kerberos Pre-Auth
Securing Yourself for a Rainy Day

#RSAC
DPAPI-NG
SID-Protected PFX Files... Unprotected

#RSAC
Credentials Security Takeways
Cryptography that relies on keys stored in the registry is as safe as your offline access.
We all know that they should log on to the Domain Controllers only. Who are they? Can we trust them?
...when extracted. In practice they are as safe as your approach.

Thank you!

SESSION ID:
Understand Credential Security: Important Things You Need to Know About Storing Your Identity

Paula Januszkiewicz
CQURE: CEO, Penetration Tester / Security Expert CQURE Academy: Trainer MVP: Enterprise Security, MCT Microsoft Regional Director Contact: paula@cqure.us | http://cqure.us

#RSAC

