Marina Simakov Yaron Zinar

Marina Simakov (@simakov_marina)
· Senior Security Researcher @Preempt · M.Sc. in computer science, with several published articles, with a main area of
expertise in graph theory · Previously worked as a Security Researcher @Microsoft · Spoke at various security conferences such as Black Hat, Blue Hat IL and DefCon
Yaron Zinar (@YaronZi)
· Senior Security Researcher Lead @Preempt · M.Sc. in Computer Science with a focus on statistical analysis · Spent over 12 years at leading companies such as Google and Microsoft · Among his team latest finding are CVE-2017-8563, CVE-2018-0886, CVE-2019-
1040 and CVE-2019-1019
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

1. Introduction:
§ Common attacks on Active Directory
§ NTLM
§ Design weaknesses § NTLM Relay § Offered mitigations
2. Vulnerabilities
§ Known vulnerabilities
§ LDAPS Relay § CVE-2015-0005
§ New vulnerabilities
§ Your session key is my session key § Drop the MIC § EPA bypass

3. Detections
§ Known detections
§ Logs § Network traffic
§ New detections
§ Encrypted data § NTLM Relay deterministic
detection
4. Takeaways

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Main secrets storage of the domain
§ Stores password hashes of all accounts § In charge of authenticating accounts against domain resources
§ Authentication protocols
§ LDAP § NTLM § Kerberos
§ Common attacks
§ Golden & Silver Ticket § Forged PAC § PTT § PTH § NTLM Relay
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

(1) NTLM Negotiate (2) NTLM Challenge (3) NTLM Authenticate

Client Machine

Server

(4) NETLOGON (5) Approve/Reject

DC

Authentication is not bound to the target server!
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

(1) NTLM Negotiate (4) NTLM Challenge (5) NTLM Authenticate

Attacked Target

Client Machine

Server

DC

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Mitigations:
§ SMB Signing § LDAP Signing § EPA (Enhanced Protection for Authentication) § LDAPS channel binding § Server SPN target name validation § Hardened UNC Paths
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ SMB & LDAP signing
§ After the authentication, all communication between client and server will be signed
§ The signing key is derived from the authenticating account's password hash § The client calculates the session key by itself § The server receives the session key from the DC in the NETLOGON
response § An attacker with relay capabilities has no way of retrieving the session key
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ SMB & LDAP signing
Packet not signed correctly
(1) NTLM Negotiate (4) NTLM Challenge (5) NTLM Authenticate

+Session Key (Hash Derived)
Attacked Target

Client Machine

Server

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

DC

§ EPA (Enhanced Protection for Authentication)
§ RFC 5056 § Binds the NTLM authentication to the secure channel over which the
authentication occurs § The final NTLM authentication packet contains a hash of the target service's
certificate, signed with the user's password hash § An attacker with relay capabilities is using a different certificate than the
attacked target, hence the client will respond with an incompatible certificate hash value
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ EPA (Enhanced Protection for Authentication)

Client Machine

(1) TLS Session (2) NTLM Negotiate (5) NTLM Challenge (6) NTLM Authenticate
User signs the Server's certificate

Server

Attacked Target
Incorrect certificate hash!

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

DC

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ LDAPS Relay (CVE-2017-8563)
§ Discovered by Preempt in 2017 https://blog.preempt.com/new-ldap-rdp-relay-vulnerabilities-in-ntlm
§ Group Policy Object (GPO) - "Domain Controller: LDAP server signing requirements"
§ Requires LDAP sessions to be signed OR § Requires session to be encrypted via TLS (LDAPS)
§ TLS does not protect from credential forwarding!
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ CVE-2015-0005
§ Discovered by Core Security (@agsolino) § DC didn't verify target server identity § Allows NTLM Relay even when Signing is required

Attacked Target
+Session Key (Hash Derived)

(1) NTLM Negotiate (4) NTLM Challenge (5) NTLM Authenticate

(9) NETLOGON (10) Approve + Session Key

Client Machine

Server

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

DC

§ CVE-2015-0005
§ NTLM Challenge message:
§ Contains identifying information about the target computer
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ CVE-2015-0005
§ NTLM Authenticate message:
§ User calculates HMAC_MD5 based on the challenge message using his NT Hash
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ CVE-2015-0005 ­ Fix:
§ Microsoft issued a fix in MS15-027
§ The fix validated that the computer which established the secure connection is the same as the target in the NTLM Authenticate request

Attacked Target
+Session Key (Hash Derived)

(1) NTLM Negotiate (4) NTLM Challenge (5) NTLM Authenticate

Client Machine

Server

(9) NETLOGON (10) DENY!
Target hostname mismatch!

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

DC

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Your session key is my session key
§ Retrieve the session key for any NTLM authentication § Bypasses the MS15-027 fix
§ Drop the MIC
§ Modify session requirements (such as signing) § Overcome the MIC protection
§ EPA bypass
§ Relay authentication to servers which require EPA § Modify packets to bypass the EPA protection
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Your session key is my session key
§ MS15-027 fix validates target NetBIOS name § But what is the target NetBIOS name field is missing?

Original challenge:

Modified challenge:

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Your session key is my session key
§ The client responds with an NTLM_AUTHENTICATE message with target NetBIOS field missing
§ The NETLOGON message is sent without this field § The domain controller responds with a session key!
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Your session key is my session key
§ But what if the NTLM AUTHENTICATE message includes a MIC? § MIC: Message integrity for the NTLM NEGOTIATE, NTLM CHALLENGE, and
NTLM AUTHENTICATE § MIC = HMAC_MD5(SessionKey, ConcatenationOf(
NTLM_NEGOTIATE, NTLM_CHALLENGE, NTLM_AUTHENTICATE))
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Your session key is my session key
§ Overcoming the MIC problem:
§ By removing the target hostname we are able to retrieve the session key § We have all 3 NTLM messages § The client provides a MIC which is based on the modified NTLM_CHALLENGE
message § We recalculate the MIC based on the original NTLM_CHALLENGE message
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Your session key is my session key

Attacked Target

+Session Key (Hash Derived)

(1) NTLM Negotiate
(4) NTLM Challenge remove target name
(5) NTLM Authenticate

(6) NETLOGON (7) Approve + Session Key

Client Machine

Server

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

DC

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Your session key is my session key ­ Fix:
§ Windows servers deny requests which do not include a target
§ Issues:
§ NTLMv1
§ messages do not have av_pairs -> no target field § Such authentication requests remain vulnerable to the attack
§ Non-Windows targets are still vulnerable § Patching is not enough
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Drop the MIC
§ MIC = HMAC_MD5(SessionKey, ConcatenationOf( NTLM_NEGOTIATE, NTLM_CHALLENGE, NTLM_AUTHENTICATE))
§ If client & server negotiate session privacy/integrity, attackers cannot take over the session
§ The MIC protects the NTLM negotiation from tampering
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Drop the MIC
§ SMB clients turn on the signing negotiation flag by default & use a MIC § It is not possible (or at least, not trivial) to relay SMB to another protocol which
relies on this negotiation flag (in contrast to other protocols such as HTTP)
§ How can we overcome this obstacle?
§ MIC can be modified only if the session key is known § Otherwise, it can be simply removed J § [In order to remove the MIC, the version needs to be removed as well, as well as
some negotiation flags]
§ Result: It is possible to tamper with any stage of the NTLM authentication flow when removing the MIC
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Drop the MIC
Original NTLM_AUTHENTICATE:

Modified NTLM_AUTHENTICATE:

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Drop the MIC

(1) NTLM Negotiate Signing supported
(4) NTLM Challenge No signing negotiated
(5) NTLM Authenticate Includes MIC
Client Machine

Server

Attacked Target
DC

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Drop the MIC - Problem
§ The MIC presence is notified in the msvAvFlags attribute in the NTLM authentication message
§ msvAvFlags is signed with the user's password hash
§ Even if the corresponding bit is set, the target server does not verify that the MIC is indeed present
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ MIC bypass - Fix:
§ If msvAvFlags indicate that a MIC is present, verify its presence.
§ Issues:
§ Some clients don't add a MIC by default (Firefox on Linux or MacOS) § These clients are still vulnerable to NTLM session tampering § More serious issue:
CVE-2019-1166 ­ Drop The MIC 2 J
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ EPA (Enhanced Protection for Authentication) bypass
§ EPA binds authentication packets to a secure TLS channel
§ Servers protected by EPA:
§ AD-FS § OWA § LDAPS § Other HTTP servers (e.g. Sharepoint)
§ Unfortunately by default, EPA is disabled on all of the above servers § In most cases, these servers are vulnerable to much simpler attack
vectors
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ EPA (Enhanced Protection for Authentication) bypass
§ Adds a Channel Bindings field to the NTLM_AUTHENTICATE message based on the target server certificate
§ Prevents attackers from relaying the authentication to another server
§ Modification requires knowledge of the user's NT HASH
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ EPA (Enhanced Protection for Authentication) bypass
§ Modifying the Channel Bindings in the NTLM_AUTHENTICATE message is not possible
§ But what if we add a Channel Bindings field to the NTLM_CHALLENGE message before we send it to the client?
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ EPA (Enhanced Protection for Authentication) bypass
§ Client will add our crafted field to the NTLM_AUTHENTICATE message!
§ Additional fields would be added to the message, including a second Channel Binding
§ Server takes the first Channel Binding for verification
§ What if the NTLM_AUTHENTICATE message includes a MIC?
§ DROP THE MIC!
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ EPA (Enhanced Protection for Authentication) bypass

(1) NTLM Negotiate
(4) NTLM Challenge Inject Channel Binding
(5) NTLM Authenticate Rouge Channel Binding MIC
Client Machine

Server

Attacked Target

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

DC

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ EPA bypass - Fix:
§ Servers deny authentication requests which include more than one channel binding value
§ Issues:
§ Some clients don't support EPA & don't add a MIC (Firefox on Linux or MacOS)
§ These clients are still vulnerable to the EPA bypass § One such client is enough to make the entire domain vulnerable
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Common data sources used today:
§ Raw network traffic § Event logs
§ Proposed data source:
§ Encrypted traffic

Attack
Golden & Silver ticket
Attack tools (BloodHound) NTLM relay

Known Detections
- Weak encryption type - Ticket lifetime
- LDAP queries - ETW - Heuristic detections
based on anomalous NTLM access

New Detections - Ticket contents (PAC)
- LDAPS traffic
- NETLOGON message source + decrypted content

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Deterministic NTLM Relay Detection
§ An NTLM_AUTHENTICATE request includes the target of the authentication § The NTProofStr ensures attackers are unable to modify this field
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Deterministic NTLM Relay Detection

NETLOGON channel established by a different machine
than the target in the request

(1) NTLM Negotiate
(4) NTLM Challenge
(5) NTLM Authenticate Target: Server
Client Machine

Server

Attacked Target
DC

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Deterministic NTLM Relay Detection
§ Requirements:
§ Domain controllers sniffers / agents § Decrypt NETLOGON messages
§ Extract the hashes of all computers in the domain
§ Associate an SPN / IP to the corresponding machine
§ Uncovered scenario:
§ MITM: NETLOGON channel would be established with the same machine name as in the NTLM_AUTHENTICATE message
§ The Kerberos protocol is also vulnerable to this scenario (if signing is not negotiated)
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ Patch all vulnerable machines! § Restrict NTLM usage as much as possible
§ NTLM authentication is susceptible to NTLM relay attacks § Always prefer Kerberos usage
§ Disable NTLMv1 in your environment
§ Configure the GPO `Network security: LAN Manager authentication level' to: `Send NTLMv2 response only. Refuse LM & NTLM'
§ https://docs.microsoft.com/en-us/windows/security/threat-protection/securitypolicy-settings/network-security-lan-manager-authentication-level
§ Incorporate NTLM relay mitigations:
§ SMB & LDAP signing § LDAP channel binding § EPA
§ Incorporate advanced detections in your domain
§ NTLM relay detection § Consider using encrypted traffic to gain stronger defensive capabilities
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

§ The Preempt Research Team
§ Eyal Karni (@eyal_karni) § Sagi Sheinfeld
§ Alberto Solino (@agsolino)
§ Some of the vulnerabilities are merged into impacket! § https://github.com/SecureAuthCorp/impacket
<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

<FINDING A NEEDLE IN AN ENCRYPTED HAYSTACK. MARINA SIMAKOV & YARON ZINAR. BLACK HAT USA 2019>

