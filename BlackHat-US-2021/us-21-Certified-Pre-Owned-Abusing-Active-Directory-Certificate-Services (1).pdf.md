@harmj0y

Certified Pre-Owned
Abusing Active Directory Certificate Services

@tifkin_

1

2
tl;dr
 Background  Account Persistence  Domain Escalation  Persistence with "Golden" Certificates

3
Active Directory Certificate Services
 AD CS is a server role that functions as Microsoft's public key infrastructure (PKI) implementation
- Used by organization for smart cards, SSL certificates, code signing, etc.
 Clients send certificate signing requests (CSRs) to an (enterprise) CA, which signs issued certificates using the private key for the CA certificate

4
NTAuthCertificates
This is the root of domain-based certificate auth!

5
Certificate Enrollment

6
Certificate Templates
 CAs issue certificates with "blueprint" settings defined by certificate templates (stored as AD objects)

7
Subject Alternative Names (SANs)
 Allows additional identities to be bound to a certificate beyond the Subject
 Can be dangerous when combined with certificates that allow domain authentication!
- AD maps certificates to user accounts using the SAN

8
Aren't Smartcards Required?
 No! Rubeus and Kekeo support Kerberos authentication using certificates via PKINIT
- Schannel authentication also supports certificates (e.g., LDAPS)

Account Persistence
a.k.a. Long Term LSASS-less Credential Theft
9

10
"Passive" Certificate Theft
 If hardware protection is not used, existing user/machine certificates are stored using DPAPI
- Mimikatz and SharpDPAPI can steal such certs/private keys

11
"Active" Certificate Theft
 Users/machines can enroll in any template they have Enroll permissions for
- By default the User and Machine templates are available
 We want a template that allows for AD authentication
- Lets us get a user's TGT (and NTLM!) - Lets us compromise a computer through RBCD/S4U2Self
 We can enroll through DCOM (Certify), RPC, and AD CS web endpoints

12

13
Offensive Advantages
 Doesn't touch lsass.exe's memory!
 Doesn't need elevation (for user contexts)!
 Few existing detection methods! (*currently* lesser known technique : )
 Separate credential material from passwords
- Works even if an account changes its password! - Long lifetime. By default, User/Machine templates issue
certificates valid for 1 year.

Domain Escalation
Domain User  Enterprise Admin
14

15
Template Misconfigurations: General Requirements
 The Enterprise CA grants low-privileged users enrollment rights
 Low privileged users can enroll in the template
- Specified by the certificate template AD object's security descriptor
 Manager approval is disabled
 No "authorized signatures" are required

16
Key Misconfiguration: Templates that Process User-Supplied SANs
1. An attacker can specify an arbitrary SAN when requesting a certificate
2. The certificate enables domain authentication 3. The CA creates and signs a certificate using
the attacker-supplied SAN
Then the attacker can become any account in the domain!

17
Escalation Scenarios
 ESC1
- General Requirements - [PKINIT] Client Authentication, Smart Card Logon, Any
Purpose, or No EKU (i.e., EKU allows auth) - The ENROLLEE_SUPPLIES_SUBJECT flag
 ESC2
- General requirements - The Any Purpose EKU or No EKU
 ESC3
- General requirements + no "enrollment agent restrictions" - The Certificate Request Agent EKU - Enrollment rights to template with a few other requirements

18

19
Escalation Scenarios (cont.)
 ESC4
- Vulnerable certificate template access control
 ESC5
- Vulnerable PKI object access control
 ESC6
- EDITF_ATTRIBUTESUBJECTALTNAME2 flag set on a CA - (Allows CSRs for ANY template to specify a SAN!)
 ESC7
- Vulnerable CA access control - The ManageCA permission can be used to fixate ESC6

ESC8 - NTLM Relay to HTTP

20

Enrollment Endpoints

 AD CS web enrollment endpoints are optional roles (but commonly installed)
- All of these endpoints are vulnerable to NTLM relay!

 If there is a user-enrollable auth template:
- Extends the window for user NTLM relay scenarios

 If there is a machine-enrollable auth template:
- Combine with printer bug for coerced auth - I.e., take over ANY system in the domain running the
spooler service!

22
"
"We determined your finding is valid but does not meet our bar for a security update release."
-MSRC

Domain Persistence
"One Certificate To Rule Them All"
23

24
Stealing CA Private Keys
 If the private key for a CA's certificate is not protected by a TPM/HSM, it's protected by DPAPI
- CAs sign issued certificates with this key
 If we can steal private key of any CA cert in NTAuthCertificates, we can forge our own certificates as anyone in the domain!
 These forged certs can't be revoked!
- The certs are never actually "issued"! - Forged certs work as long as the CA cert is still valid :)

25

26
Bonus: PKINIT -> NTLM
 As part of [MS-PKCA], for backwards compatibility a legitimate certificate can be used to retrieve the associated user/computer's NTLM hash
- First publicly/offensively detailed by @gentilkiwi - Recently integrated into Rubeus by @_ethicalchaos_ and
@exploitph
 If we combine this with "golden" certificates, we have an alternative way to obtain NTLM credentials for any active user/computer (i.e., an alternative to DCSync)

27

28
Summary
 AD CS has a lot of abuse potential!
- User credential theft/machine persistence - Domain escalation and persistence
 Our 140 page whitepaper has complete details
- Includes extensive defensive information and additional architectural considerations
- https://bit.ly/3xLziQ9
 Certify and ForgeCert are now live in the GhostPack Github organization, along with PSPKIAudit for auditing your environment

29
Acknowledgements
 Previous work (see the paper for complete details):
- Benjamin Delpy, PKISolutions, Christoph Falta, CQURE, Keyfactor, @Elkement, Carl Sörqvist, Brad Hill
 Ceri Coburn for PKINIT related Rubeus additions
 Special thanks to Mark Gamache for collaborating with us on parts of this work

30
Questions?

