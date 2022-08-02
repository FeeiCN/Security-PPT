.
Impersonate, Tamper, and Exploit

Alfonso De Gregorio
Founder, BeeWise
.

HITBSecConf 2015, Amsterdam, May 26th-29th, 2015

Web PKI is Fragile

Web PKI is Fragile
.

1/103

.

.

.

.

Discuss
/me @secYOUre
#illusoryTLS #HITB2015AMS

Web PKI is Fragile
.

6/103

First times are...
.

Web PKI is Fragile
.

7/103

If only we could notice them

Web PKI is Fragile
.

8/103

Web PKI is Fragile
.

Web PKI is Fragile

Web PKI is Fragile

9/103

.

PKI Dramas
. China Internet Network Information Center (CNNIC), 2015 . Lenovo, 2015 . National Informatics Centre of India, 2014 . ANSSI, 2013 . Trustwave, 2012 . Türktrust, 2011-2013 . DigiNotar, 2011 . Comodo, 2011 . Verisign, 2010

Web PKI is Fragile
.

10/103

Unsuspecting Users
.

Web PKI is Fragile
.

11/103

Remaining oblivious
.

Web PKI is Fragile
.

12/103

Silent Failure
.

Web PKI is Fragile
.

13/103

.

/me
At the intersection of so ware security and security so ware, exploring, and trying to contain, the space of unanticipated state.

Web PKI is Fragile
.

15/103

Secure Backdoor
Almost safe

Web PKI is Fragile
.

16/103

Agenda
1. Web PKI is Fragile
The sorrow state of the infrastructure we daily entrust our business upon
2. illusoryTLS
Nobody But Us Impersonate, Tamper, and Exploit
3. The Impact
Or, why one rotten apple spoils the whole barrel
4. A Backdoor Embedding Algorithm
Elligator turned to evil
5. Conclusions
The misery of our times

Web PKI is Fragile
.

17/103

Perspective
. Timely topic o en debated as matter for a government to legislate on

Web PKI is Fragile
.

18/103

Perspective
. Timely topic o en debated as matter for a government to legislate on . A space that some entities might have practically explored regardless of the
policy framework

Web PKI is Fragile
.

18/103

Perspective
. Timely topic o en debated as matter for a government to legislate on . A space that some entities might have practically explored regardless of the
policy framework
. Would we be able to notice if our communications were being exploited?

Web PKI is Fragile
.

18/103

Poll
.
Poll

Web PKI is Fragile
.

19/103

Poll
How many of you think that backdoors can be asymmetric?

Web PKI is Fragile
.

20/103

Poll
How many of you think that backdoors can be planted in data?

Web PKI is Fragile
.

21/103

Common View
. Backdoors are symmetric . Malicious logic in the target system code base . Everyone with knowledge about the internals of the backdoor can exploit it . Given enough skills and effort, code review can spot their presence

Web PKI is Fragile
.

22/103

Yet
. Backdoors can be asymmetric. Their complete code does not enable anyone, except those with access to the key-recovery system, to exploit the backdoor

Web PKI is Fragile
.

23/103

Yet
. Backdoors can be asymmetric. Their complete code does not enable anyone, except those with access to the key-recovery system, to exploit the backdoor
. Backdoors can be planted in data

Web PKI is Fragile
.

23/103

Backdoor is data, data is backdoor

Web PKI is Fragile
.

24/103

Scenario
. The entire X.509 Web PKI security architecture falls apart, if a single CA certificate with a secretly embedded backdoor enters the certificate store of relying parties

Web PKI is Fragile
.

25/103

Scenario
. . The entire X.509 Web PKI security architecture falls apart, if a single CA certificate with a secretly embedded backdoor enters the certificate store of relying parties
Have we sufficient assurance that this did not happen already?

Web PKI is Fragile
.

25/103

illusoryTLS

illusoryTLS
.

26/103

Underhanded Crypto Contest

..

" .The Underhanded Crypto Contest is a competition to write or modify crypto code that appears to be

secure, but actually does

something evil

".

illusoryTLS
.

27/103

illusoryTLS
. An instance of the Young and Yung elliptic curve asymmetric backdoor in RSA key generation

illusoryTLS
.

28/103

Security Outcome
The backdoor completely perverts the security guarantees provided by the TLS protocol, allowing the attacker to:
. Impersonate the endpoints (i.e., authentication failure)

illusoryTLS
.

29/103

Security Outcome
The backdoor completely perverts the security guarantees provided by the TLS protocol, allowing the attacker to:
. Impersonate the endpoints (i.e., authentication failure) . Tamper with their messages (i.e., integrity erosion)

illusoryTLS
.

29/103

Security Outcome
The backdoor completely perverts the security guarantees provided by the TLS protocol, allowing the attacker to:
. Impersonate the endpoints (i.e., authentication failure) . Tamper with their messages (i.e., integrity erosion) . Actively eavesdrop their communications (i.e., confidentiality loss)

illusoryTLS
.

29/103

Threat Model
The backdoor designer can:
. "Insert vulnerabilities into commercial encryption systems, IT systems, networks and endpoint communications devices used by targets."

illusoryTLS
.

30/103

Threat Model
The backdoor designer can:
. "Insert vulnerabilities into commercial encryption systems, IT systems, networks and endpoint communications devices used by targets."
. "influence policies, standard and specifications for commercial public key technologies."

illusoryTLS
.

30/103

Threat Model
The backdoor designer can:
. "Insert vulnerabilities into commercial encryption systems, IT systems, networks and endpoint communications devices used by targets."
. "influence policies, standard and specifications for commercial public key technologies."
. Interfere with the supply-chain

illusoryTLS
.

30/103

Threat Model
The backdoor designer can:
. "Insert vulnerabilities into commercial encryption systems, IT systems, networks and endpoint communications devices used by targets."
. "influence policies, standard and specifications for commercial public key technologies."
. Interfere with the supply-chain . Disregard everything about policy

illusoryTLS
.

30/103

Threat Model
The backdoor designer can:
. "Insert vulnerabilities into commercial encryption systems, IT systems, networks and endpoint communications devices used by targets."
. "influence policies, standard and specifications for commercial public key technologies."
. Interfere with the supply-chain . Disregard everything about policy . Or, she is simply in the position to build the security module used by the
Certification Authority for generating the key material

illusoryTLS
.

30/103

Three Modules
.

illusoryTLS
.

31/103

network-simple-tls
.

illusoryTLS
.

32/103

Echo service over TLS
.

illusoryTLS
.

33/103

Where is the backdoor?
If the client and server code is contributed by an open-source project
and it is used as-is, where is the backdoor?

illusoryTLS
.

34/103

Where is the backdoor?
.

illusoryTLS
.

35/103

A Covert Channel
. The upper order bits of the RSA modulus encode the asymmetric encryption of a seed generated at random

illusoryTLS
.

36/103

A Covert Channel
. The upper order bits of the RSA modulus encode the asymmetric encryption of a seed generated at random
. The same seed was used to generate one of the RSA primes of the CA public-key modulus

illusoryTLS
.

36/103

A Covert Channel
. The upper order bits of the RSA modulus encode the asymmetric encryption of a seed generated at random
. The same seed was used to generate one of the RSA primes of the CA public-key modulus
. The RSA modulus is at the same time a RSA public-key and an ciphertext that gives to the backdoor designer the ability to factor with ease the modulus

illusoryTLS
.

36/103

Where the backdoor is not
No backdoor was slipped into the cryptographic credentials issued to
the communicating endpoints

illusoryTLS
.

37/103

SETUP Attacks
.
illusoryTLS
.

. Notion introduced by Adam Young and Moti Yung at Crypto '96
. Young and Yung elliptic-curve asymmetric backdoor in RSA key generation
. Expands on `A Space Efficient Backdoor in RSA and its Applications', Selected Areas in Cryptography '05
. A working implementation at
http://cryptovirology.com
38/103

NOBUS
.
illusoryTLS
.

. The exploitation requires access to resources not embedded in the backdoor itself
. e.g., elliptic-curve private key . The vulnerability can be exploited
by the backdoor designer and by whoever gains access to the associated key-recovery system
39/103

How many of you believe that it is possible to forbid an enemy
intelligence organization from gaining access to a private key?

illusoryTLS
.

40/103

Indistinguishability
.

. Assuming ECDDH holds
. The backdoor key pairs appear to all probabilistic polynomial time algorithms like genuine RSA key pairs
. Black-box access to the key-generator does not allow detection

illusoryTLS
.

41/103

Forward Secrecy
.

. If a reverse-engineer breaches the key-generator, then the previously stolen information remains confidential

illusoryTLS
.

42/103

Reusability
.

. The backdoor can be used multiple times and against multiple targets

illusoryTLS
.

43/103

Impact

Impact
.

44/103

A Subtle Attack
.

. Break TLS security guarantees at will

Impact
.

45/103

A Subtle Attack
.

. Break TLS security guarantees at will
. Impersonation (e.g., authentication
failure)

Impact
.

45/103

A Subtle Attack
.

. Break TLS security guarantees at will . Impersonation (e.g., authentication
failure)
. Message tampering (e.g., integrity erosion)

Impact
.

45/103

A Subtle Attack
.

. Break TLS security guarantees at will . Impersonation (e.g., authentication
failure)
. Message tampering (e.g., integrity erosion) . Active eavesdropping of encrypted
communications (e.g., confidentiality loss)

Impact
.

45/103

A Subtle Attack
.

. Break TLS security guarantees at will . Impersonation (e.g., authentication
failure)
. Message tampering (e.g., integrity erosion) . Active eavesdropping of encrypted
communications (e.g., confidentiality loss)
. No need to have access to any private key
used by system actors

Impact
.

45/103

A Subtle Attack
.
Impact
.

. Break TLS security guarantees at will . Impersonation (e.g., authentication
failure)
. Message tampering (e.g., integrity erosion) . Active eavesdropping of encrypted
communications (e.g., confidentiality loss)
. No need to have access to any private key
used by system actors
. No need to tamper with the
communicating endpoints
45/103

A Subtle Attack
.
Impact
.

. Break TLS security guarantees at will . Impersonation (e.g., authentication
failure)
. Message tampering (e.g., integrity erosion) . Active eavesdropping of encrypted
communications (e.g., confidentiality loss)
. No need to have access to any private key
used by system actors
. No need to tamper with the
communicating endpoints
. Need to retain control over the
key-generation of the target RSA modulus
45/103

Is the malicious implementer a threat mitigated by IT product security certifications?

Impact
.

46/103

Fictional Security
.

A single CA certificate with a secretly embedded backdoor renders the entire TLS security fictional

Impact

47/103

.

One Rotten Apple...
.

One rotten apple...

Impact

48/103

.

... spoils the whole barrel
.

... spoils the whole barrel

Impact

49/103

.

Ethylene
.

Impact
.

50/103

Universal implicit cross-certification is the ethylene of trust

Impact
.

51/103

C2H4
.

Impact
.

52/103

Cross Certification
.

Impact
.

53/103

Cross Certification
.

. Cross certification enables entities in one public key infrastructure to trust entities in another PKI

Impact
.

54/103

Cross Certification
.

. Cross certification enables entities in one public key infrastructure to trust entities in another PKI
. This mutual trust relationship should be typically supported by a cross-certification agreement between the CAs in each PKI

Impact
.

54/103

Cross Certification
.
Impact
.

. Cross certification enables entities in one public key infrastructure to trust entities in another PKI
. This mutual trust relationship should be typically supported by a cross-certification agreement between the CAs in each PKI
. The agreement establishes the responsabilities and liability of each party
54/103

Explicit Cross Certification
. Each CA is required to issue a certificate to the other to establish a relationship in both directions
.

Impact
.

55/103

Explicit Cross Certification
. Each CA is required to issue a certificate to the other to establish a relationship in both directions
. The path of trust is not hierarchical, although the separate PKIs may be certificate hierarchies
.

Impact
.

55/103

Explicit Cross Certification

. Each CA is required to issue a certificate to the other to establish a relationship in both directions

. The path of trust is not hierarchical,

although the separate PKIs may be

certificate hierarchies

.

. A er two CAs have established and

specified the terms of trust and

issued the certificates to each

other, entities within the separate

PKIs can interact subject to the

policies specified in the certificates

Impact
.

55/103

.
But this is just in theory...

.
In practice:

Implicit Cross Certification
. Most current PKI so ware employs a form
of implicit cross certification in which all root CAs are equally trusted
.

Impact
.

58/103

Implicit Cross Certification
. Most current PKI so ware employs a form
of implicit cross certification in which all root CAs are equally trusted
. Equivalent to unbounded cross
certification among all CAs
.

Impact
.

58/103

Implicit Cross Certification

. Most current PKI so ware employs a form

of implicit cross certification in which all

root CAs are equally trusted

. Equivalent to unbounded cross

certification among all CAs

. Any certificate can be trivially replaced by

.

a masquereder's certificate from another

CA

Impact
.

58/103

Implicit Cross Certification

. Most current PKI so ware employs a form
of implicit cross certification in which all root CAs are equally trusted

. Equivalent to unbounded cross
certification among all CAs

. Any certificate can be trivially replaced by

.

a masquereder's certificate from another

CA

. The security of any certificate is reduced to

that of the least trustworthy CA, who can

issue bogus certificate to usurp the

legitimate one, at the same level of trust

Impact
.

58/103

CA Certificate in a MitM Proxy
.

Impact
.

59/103

Superfish Adware
.

Impact
.

60/103

PKI is Not Dead, Just Resting
.

Impact
.

61/103

.
Universal implicit cross-certification

.
Security

.
Ethylene

.
Rotting fruit

.
As weak as the weakest link

.
Multiple attackers attracted

.

.

.

.
Negating any meaningful security whatsoever

It is essential to have assurance about the security of each implementation
of vulnerable key-generation algorithm employed by trusted
credential issuers

Impact
.

72/103

Hundreds CAs
.

Impact

211 CA certificates installed

73/103

.

Have we sufficient assurance about the hundreds CA certificates we daily
entrust our business upon?

Impact
.

74/103

Requirements
.

. Publicly trusted certificates to be issued in compliance with European Standard EN 319 411-3

Impact
.

75/103

Requirements
.

. Publicly trusted certificates to be issued in compliance with European Standard EN 319 411-3
. CA key generation to be carried out within a device that meets the requirements identified by some approved PP

Impact
.

75/103

Requirements
.
Impact
.

. Publicly trusted certificates to be issued in compliance with European Standard EN 319 411-3
. CA key generation to be carried out within a device that meets the requirements identified by some approved PP
. CEN Workshop Agreement 14167, Part 2-3-4 are three of those PP
75/103

Requirements
.
Impact
.

. Publicly trusted certificates to be issued in compliance with European Standard EN 319 411-3
. CA key generation to be carried out within a device that meets the requirements identified by some approved PP
. CEN Workshop Agreement 14167, Part 2-3-4 are three of those PP
. EAL4 Augmented
75/103

Requirements
.
Impact
.

. Publicly trusted certificates to be issued in compliance with European Standard EN 319 411-3
. CA key generation to be carried out within a device that meets the requirements identified by some approved PP
. CEN Workshop Agreement 14167, Part 2-3-4 are three of those PP
. EAL4 Augmented . Augmentation from adherence to
ADV_IMP.2, AVA_CCA.1, and AVA_VLA.4
75/103

ADV_IMP.2, AVA_CCA.1, and AVA_VLA.4
. Focused on assessing the vulnerabilities in the TOE
.

Impact
.

76/103

ADV_IMP.2, AVA_CCA.1, and AVA_VLA.4

. Focused on assessing the vulnerabilities in the TOE

. Guaranteeing that the

implementation representation is

an accurate and complete

instantiation of the TSF

.

requirements

Impact
.

76/103

ADV_IMP.2, AVA_CCA.1, and AVA_VLA.4

. Focused on assessing the vulnerabilities in the TOE

. Guaranteeing that the

implementation representation is

an accurate and complete

instantiation of the TSF

.

requirements

. Special emphasis on identifying

covert channels and estimating

their capacity

Impact
.

76/103

ADV_IMP.2, AVA_CCA.1, and AVA_VLA.4

. Focused on assessing the vulnerabilities in the TOE

. Guaranteeing that the

implementation representation is

an accurate and complete

instantiation of the TSF

.

requirements

. Special emphasis on identifying

covert channels and estimating

their capacity

. SETUP attacks makes use of the key-generation as a covert channel for itself

Impact
.

76/103

Yet
.
Impact
.

. Developer is in charge for the vulnerability
assessment and documentation
77/103

Yet
.
Impact
.

. Developer is in charge for the vulnerability
assessment and documentation
. Conflicts with our threat model
77/103

Yet
.
Impact
.

. Developer is in charge for the vulnerability
assessment and documentation
. Conflicts with our threat model . The evaluator is le with the
documentation and the implementation representation to be assessed
77/103

Yet
.
Impact
.

. Developer is in charge for the vulnerability
assessment and documentation
. Conflicts with our threat model . The evaluator is le with the
documentation and the implementation representation to be assessed
. Can the presence of backdoor can be ruled
out at the required assurance level?
77/103

Yet
.
Impact
.

. Developer is in charge for the vulnerability
assessment and documentation
. Conflicts with our threat model . The evaluator is le with the
documentation and the implementation representation to be assessed
. Can the presence of backdoor can be ruled
out at the required assurance level?
. Formal methods required only at the two
highest levels (EAL6 and EAL7)
77/103

Yet
.
Impact
.

. Developer is in charge for the vulnerability
assessment and documentation
. Conflicts with our threat model . The evaluator is le with the
documentation and the implementation representation to be assessed
. Can the presence of backdoor can be ruled
out at the required assurance level?
. Formal methods required only at the two
highest levels (EAL6 and EAL7)
. Implementation representation may
render backdoor detection unlikely (e.g., HDL at design time, netlist at fabrication time)
77/103

Key Takeaway
As long as the implementations of RSA -- or, more generally, algorithms vulnerable to this class of attacks -- used by trusted entities (e.g., CA) cannot be audited by relying parties (e.g., x.509 end-entities), any trust-anchor for the same trusted entities (e.g.,
root certificate) is to be regarded as a potential backdoor

Impact
.

78/103

Key Takeaway - Ctd
As long as the implementation of algorithms adopted by CAs and vulnerable to this class of backdoors cannot be audited by relying
parties, the assurance provided by illusoryTLS (i.e., none whatsoever) is not any different from the assurance provided by
systems relying upon TLS and RSA certificates for origin authentication, confidentiality, and message integrity guarantees

Impact
.

79/103

Mitigations
. Key Pinning, RFC 7469, Public Key Pinning Extension for HTTP (HPKP), April 2015
. Certificate Transparency, RFC 6962, June 2013 . DANE, DNS-based Authentication of Named Entities, RFC 6698, August 2012 . Tack, Trust Assertions for Certificate Keys, dra -perrin-tls-tack-02.txt,
Expired . Proper explicit cross-certification

Impact
.

80/103

A Backdoor Embedding Algorithm

A Backdoor Embedding Algorithm
.

81/103

Subtleness
The subtleness of a backdoor planted in a cryptographic credential resides in the absence of malicious logic in the system whose security it erodes.

A Backdoor Embedding Algorithm
.

82/103

An attack variant
.

RyanC -- https://gist.github.com/ryancdotorg/18235723e926be0afbdd

A Backdoor Embedding Algorithm

83/103

.

Idea
1. Embed a Curve25519 public-key into the key-generator

A Backdoor Embedding Algorithm
.

84/103

Idea
1. Embed a Curve25519 public-key into the key-generator 2. Generate an ephemeral Curve25519 key at random

A Backdoor Embedding Algorithm
.

84/103

Idea
1. Embed a Curve25519 public-key into the key-generator 2. Generate an ephemeral Curve25519 key at random 3. Compute a shared secret using Elliptic Curve Diffie-Hellman

A Backdoor Embedding Algorithm
.

84/103

Idea
1. Embed a Curve25519 public-key into the key-generator 2. Generate an ephemeral Curve25519 key at random 3. Compute a shared secret using Elliptic Curve Diffie-Hellman 4. Use the shared secret to seed at cryptographically secure pseudo-random
number generator (CSPRNG) based on AES run in CTR mode

A Backdoor Embedding Algorithm
.

84/103

Idea
1. Embed a Curve25519 public-key into the key-generator 2. Generate an ephemeral Curve25519 key at random 3. Compute a shared secret using Elliptic Curve Diffie-Hellman 4. Use the shared secret to seed at cryptographically secure pseudo-random
number generator (CSPRNG) based on AES run in CTR mode 5. Generate a normal RSA key using the seeded CSPRNG

A Backdoor Embedding Algorithm
.

84/103

Idea
1. Embed a Curve25519 public-key into the key-generator 2. Generate an ephemeral Curve25519 key at random 3. Compute a shared secret using Elliptic Curve Diffie-Hellman 4. Use the shared secret to seed at cryptographically secure pseudo-random
number generator (CSPRNG) based on AES run in CTR mode 5. Generate a normal RSA key using the seeded CSPRNG 6. Replace 32-bytes of the generated modulus with the ephemeral Curve25519
public-key

A Backdoor Embedding Algorithm
.

84/103

Idea
1. Embed a Curve25519 public-key into the key-generator 2. Generate an ephemeral Curve25519 key at random 3. Compute a shared secret using Elliptic Curve Diffie-Hellman 4. Use the shared secret to seed at cryptographically secure pseudo-random
number generator (CSPRNG) based on AES run in CTR mode 5. Generate a normal RSA key using the seeded CSPRNG 6. Replace 32-bytes of the generated modulus with the ephemeral Curve25519
public-key 7. Use the original prime factors to compute two new primes leading to a new
modulus embedding the ephemeral public-key

A Backdoor Embedding Algorithm
.

84/103

Idea
1. Embed a Curve25519 public-key into the key-generator 2. Generate an ephemeral Curve25519 key at random 3. Compute a shared secret using Elliptic Curve Diffie-Hellman 4. Use the shared secret to seed at cryptographically secure pseudo-random
number generator (CSPRNG) based on AES run in CTR mode 5. Generate a normal RSA key using the seeded CSPRNG 6. Replace 32-bytes of the generated modulus with the ephemeral Curve25519
public-key 7. Use the original prime factors to compute two new primes leading to a new
modulus embedding the ephemeral public-key 8. Output the RSA key with the secretly embedded backdoor

A Backdoor Embedding Algorithm
.

84/103

Key Recovery
1. Extracts the ephemeral Curve25519 public-key from the target modulus

A Backdoor Embedding Algorithm
.

85/103

Key Recovery
1. Extracts the ephemeral Curve25519 public-key from the target modulus 2. Computes the shared secret via ECDH and using the private-key associated
to the public-key embedded in the key generator

A Backdoor Embedding Algorithm
.

85/103

Key Recovery
1. Extracts the ephemeral Curve25519 public-key from the target modulus 2. Computes the shared secret via ECDH and using the private-key associated
to the public-key embedded in the key generator 3. Uses the shared secret to seed the CSPRNG based on AES run in CTR mode

A Backdoor Embedding Algorithm
.

85/103

Key Recovery
1. Extracts the ephemeral Curve25519 public-key from the target modulus 2. Computes the shared secret via ECDH and using the private-key associated
to the public-key embedded in the key generator 3. Uses the shared secret to seed the CSPRNG based on AES run in CTR mode 4. Generates a normal RSA key using the seeded CSPRNG

A Backdoor Embedding Algorithm
.

85/103

Key Recovery
1. Extracts the ephemeral Curve25519 public-key from the target modulus 2. Computes the shared secret via ECDH and using the private-key associated
to the public-key embedded in the key generator 3. Uses the shared secret to seed the CSPRNG based on AES run in CTR mode 4. Generates a normal RSA key using the seeded CSPRNG 5. Replaces 32-bytes of the generated modulus with the ephemeral
Curve25519 public-key

A Backdoor Embedding Algorithm
.

85/103

Key Recovery
1. Extracts the ephemeral Curve25519 public-key from the target modulus 2. Computes the shared secret via ECDH and using the private-key associated
to the public-key embedded in the key generator 3. Uses the shared secret to seed the CSPRNG based on AES run in CTR mode 4. Generates a normal RSA key using the seeded CSPRNG 5. Replaces 32-bytes of the generated modulus with the ephemeral
Curve25519 public-key 6. Uses the original prime factors to compute two new primes leading to the
target modulus embedding the ephmeral public-key

A Backdoor Embedding Algorithm
.

85/103

Key Recovery
1. Extracts the ephemeral Curve25519 public-key from the target modulus 2. Computes the shared secret via ECDH and using the private-key associated
to the public-key embedded in the key generator 3. Uses the shared secret to seed the CSPRNG based on AES run in CTR mode 4. Generates a normal RSA key using the seeded CSPRNG 5. Replaces 32-bytes of the generated modulus with the ephemeral
Curve25519 public-key 6. Uses the original prime factors to compute two new primes leading to the
target modulus embedding the ephmeral public-key 7. Output the recovered RSA private key

A Backdoor Embedding Algorithm
.

85/103

Broken
.
A Backdoor Embedding Algorithm
.

. Although the idea is nice . The key pairs generated using this
algorithm fall short in terms of indistiguishability . It is easy to tell backdoored certificates apart from genuine RSA certificate using only black-box access
86/103

Does anybody see why this is the case?

A Backdoor Embedding Algorithm
.

87/103

Distinguishing Attack
. A public-key embedded into an RSA modulus

A Backdoor Embedding Algorithm
.

88/103

Distinguishing Attack
. A public-key embedded into an RSA modulus . Elliptic curve public-keys are points on the curve

A Backdoor Embedding Algorithm
.

88/103

Distinguishing Attack
. A public-key embedded into an RSA modulus . Elliptic curve public-keys are points on the curve . And elliptic curve points are easily distinguished from uniform random
strings

A Backdoor Embedding Algorithm
.

88/103

Distinguishing Attack
. A public-key embedded into an RSA modulus . Elliptic curve public-keys are points on the curve . And elliptic curve points are easily distinguished from uniform random
strings . A security evaluator could check if the coordinates encoded using the
candidate 32-byte substrings of the modulus satisfy the elliptic curve equation

A Backdoor Embedding Algorithm
.

88/103

Repairing the Backdoor
If we could make the elliptic curve points indistinguishable from random
strings, then the backdoor indistinguishability would be retained

A Backdoor Embedding Algorithm
.

89/103

Elligator
.
A Backdoor Embedding Algorithm
.

. Censorship sucks! . Daniel J. Bernstein, Anna Krasnova,
Mike Hamburg, Tanja Lange . an encoding for points on a single
curve as strings indistiguishable from uniform random strings . http://elligator.cr.yp.to
90/103

Inherently Dual Use
.

All cyber security technology is inherently dual use

A Backdoor Embedding Algorithm

91/103

.

Undetectability for Good or Ill

. Just like any and all cyber security tools

. Undetectability of curve points can

.

be used for good or ill

. For censorship-circumvention or surveillance

A Backdoor Embedding Algorithm
.

92/103

Between Offense and Defense
I believe we can positively contribute to the discussion and practice of
information security by walking the fine line between offense and defense

A Backdoor Embedding Algorithm
.

93/103

Code
. Website -- http://illusorytls.com
. illusoryTLS -- https://github.com/secYOUre/illusoryTLS . pyelligator -- https://github.com/secYOUre/pyelligator . rsaelligatorbd -- https://github.com/secYOUre/rsaelligatorbd

A Backdoor Embedding Algorithm
.

94/103

Elligator backdoor embedding
. Embed a Curve25519 public-key into the key-generator
. MASTER_PUB_HEX = '525e422e42c9c662362a7326c3c5c785ac7ef52e86782c4ac3c06887583e7a6f'
master_pub = unhexlify(MASTER_PUB_HEX)

A Backdoor Embedding Algorithm
.

95/103

Elligator backdoor embedding
. Generate an ephemeral Curve25519 key at random and the associated uniform representative string
while True:
. private = urandom(32)
(v, pub, rep) = elligator.scalarbasemult(private) if v:
break

A Backdoor Embedding Algorithm
.

95/103

Elligator backdoor embedding
. Compute a shared secret using ECDH . Use the shared secret to seed a CSPRNG based on AES run in CTR mode
# combine the ECDH keys to generate the seed
. seed = nacl.crypto_box_beforenm(master_pub, private)
prng = AESPRNG(seed)

A Backdoor Embedding Algorithm
.

95/103

Elligator backdoor embedding

. Generate a normal RSA key using the seeded CSPRNG

# deterministic key generation from seed

rsa = build_key(embed=rep, pos=80, randfunc=prng.randbytes)

...

.

def build_key(bits=2048, e=65537, embed='', pos=1, randfunc=None):

# generate base key

rsa = RSA.generate(bits, randfunc)

A Backdoor Embedding Algorithm
.

95/103

Elligator backdoor embedding

. Replace 32-bytes of the generated modulus with the representative string associated to the ephemeral Curve25519 public-key
# extract modulus as a string n_str = unhexlify(str(hex(rsa.n))[2:-1]) # embed data into the modulus
. n_hex = hexlify(replace_at(n_str, embed, pos))
... # overwrite some bytes in orig at a specificed offset def replace_at(orig, replace, offset):
return orig[0:offset] + replace + orig[offset+len(replace):]

A Backdoor Embedding Algorithm
.

95/103

Elligator backdoor embedding

. Use the original prime factors to compute to new primes leading to a new modulus embedding the uniform representative string

n = gmpy.mpz(n_hex, 16)

p = rsa.p

# compute a starting point to look for a new q value

pre_q = n / p

# use the next prime as the new q value

q = pre_q.next_prime() n=p*q

.

phi = (p-1) * (q-1)

# compute new private exponent

d = gmpy.invert(e, phi)

# make sure that p is smaller than q

if p > q:

(p, q) = (q, p)

A Backdoor Embedding Algorithm
.

95/103

Elligator backdoor embedding
. Output the backdoored RSA key
. return RSA.construct((long(n), long(e), long(d), long(p), long(q)))

A Backdoor Embedding Algorithm
.

95/103

Key Recovery
. Extracts the representative string from the target modulus
#Load an x.509 certificate from a file x509 = X509.load_cert(sys.argv[2]) # Pull the modulus out of the certificate
. orig_modulus = unhexlify(x509.get_pubkey().get_modulus())
(seed, rep) = recover_seed(key=sys.argv[1], modulus=orig_modulus, pos=80) ... def recover_seed(key='', modulus=None, pos=1): ... rep = modulus[pos:pos+32]
A Backdoor Embedding Algorithm
.

96/103

Key Recovery
. Maps the representative string to the candidate ephemeral Curve25519 public-key
. pub = elligator.representativetopublic(rep)

A Backdoor Embedding Algorithm
.

96/103

Key Recovery

. Computes the shared secret via ECDH and using the private-key associated to the public-key embedded in the key-generator
. Uses the shared secret to seed the CSPRNG based on AES run in CTR mode
def recover_seed(key='', modulus=None, pos=1): # recreate the master private key from the passphrase master = sha256(key).digest() ...
. # compute seed with master private and ephemeral public key
return (nacl.crypto_box_beforenm(pub, master), rep)
... (seed, rep) = recover_seed(key=sys.argv[1], modulus=orig_modulus, pos=80) prng = AESPRNG(seed)

A Backdoor Embedding Algorithm
.

96/103

Key Recovery

. Generates a normal RSA key using the seeded CSPRNG

# deterministic key generation from seed

rsa = build_key(embed=rep, pos=80, randfunc=prng.randbytes)

...

.

def build_key(bits=2048, e=65537, embed='', pos=1, randfunc=None):

# generate base key

rsa = RSA.generate(bits, randfunc)

A Backdoor Embedding Algorithm
.

96/103

Key Recovery
. Replaces 32-bytes of the generated modulus with the representative string found in the target modulus
# extract modulus as a string
. n_str = unhexlify(str(hex(rsa.n))[2:-1])
# embed data into the modulus n_hex = hexlify(replace_at(n_str, embed, pos))

A Backdoor Embedding Algorithm
.

96/103

Key Recovery

. Uses the original prime factors to compute two new primes leading to the target modulus embedding the uniform representative string

n = gmpy.mpz(n_hex, 16)

p = rsa.p

# compute a starting point to look for a new q value

pre_q = n / p

# use the next prime as the new q value

q = pre_q.next_prime() n=p*q

.

phi = (p-1) * (q-1)

# compute new private exponent

d = gmpy.invert(e, phi)

# make sure that p is smaller than q

if p > q:

(p, q) = (q, p)

A Backdoor Embedding Algorithm
.

96/103

Key Recovery
. Output the recovered RSA key
. return RSA.construct((long(n), long(e), long(d), long(p), long(q)))
... print rsa.exportKey()
A Backdoor Embedding Algorithm
.

96/103

Demo
A Backdoor Embedding Algorithm
.

97/103

Conclusions

Conclusions
.

98/103

.

" " .Though I am o en in the depths of misery, there is still calmness, pure harmony and music inside me. Vincent van Gogh.

" .Though we are o en in the depths of insecurity, there is still calmness, pure harmony and music inside us.

".

THANK. YOU

Q

?

Backup

Backup
.

104/103

Normal RSA Key Generation -- Young and Yung
1. Let e be the public RSA exponent (e.g., 216 + 1) 2. Choose a large number p randomly (e.g., 1024 bits long) 3. If p is composite or gcd(e, p - 1) = 1 then goto to step 1 4. Choose a large number q randomly (e.g., 1024 bits long) 5. If q is composite or gcd(e, p - 1) = 1 then goto to step 3 6. Output the public-key (N = pq, e) and the private-key p 7. The private exponent d is found by solving for (d, k) in ed + k(n) = 1 using
the extended Euclidean algorithm

Backup
.

105/103

RSA Encryption/Decryption -- Young and Yung
. N = p  q, where p and q are large primes known to the key owner . Everyone knows N and e . Let d be a privete key exponent where ed = 1mod(p - 1)(q - 1) . To encrypt m  Zn (a er padding) compute: c = memodN . To decrypt the ciphertext c compute: m = cdmodN . As far as we know: Only with known factorization given N and e, one can
find d

Backup
.

106/103

Elliptic Curve Decision Diffie-Hellman Problem
. Let C an elliptic-curve equation over the finite field Fq with prime order n . Let G be the base point of the curve . Given three point elements (xG), (yG) and (zG) . Decide whether (zG = xyG), or not . Where (x, y, z) are chosen randomly and 1 < x, y, z < n

Backup
.

107/103

