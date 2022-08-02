Introduction to and survey of TLS Security
Aaron Zauner azet@azet.org
BetterCrypto.org
FIRST Conference 2015 - Berlin / June

Table of Contents
Motivation Background
Information Security and Cryptography Transport Layer Security Extensions and Trust History & Attacks IETF efforts Mitigation Conclusion

Motivation

BetterCrypto.org

TLS is something we deal with on a daily basis, so this is an obvious topic for education.
Keep in mind that these attacks are not only possible for nation-state actors, some of them I can mount on this very laptop.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 1/91

Motivation

BetterCrypto.org

https://www.trustworthyinternet.org/ssl- pulse
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 2/91

Motivation

BetterCrypto.org

https://www.trustworthyinternet.org/ssl- pulse
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 3/91

Motivation

BetterCrypto.org

https://www.trustworthyinternet.org/ssl- pulse
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 4/91

Motivation

BetterCrypto.org

https://www.trustworthyinternet.org/ssl- pulse
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 5/91

Background
Disclaimer

BetterCrypto.org

Unfortunately this is not a talk about InfoSec nor cryptography, so I will only cover the very basics needed to understand the topic properly. Background information on Information Security and Cryptography herein is fitted to TLS only.
I will recommend appropriate resources for those who want to gain a deeper understanding at the end of my talk.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 6/91

Background
Basics

BetterCrypto.org

Information Security mandates at minimum the following three properties in a secure protocol:
Confidentiality Integrity Availability (discussed later) ..this is commonly known as the "CIA triad" (seriously). You will see later on why these are paramount. The triad is usually extended by:
Authenticity & Non-repudiation

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 7/91

Background
Confidentiallity

BetterCrypto.org

Prevent unauthorized disclosure of information Encryption and Decryption of confidential data
Example: Rijndael cipher. Later renamed AES (Advanced Encryption Standard) after winning a NIST challenge by the same name.
Symmetric 128, 192 or 256 bit block cipher Stick figure guide to AES: http://www.moserware.com/ 2009/09/stick-figure-guide-to-advanced.html

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 8/91

Background
Confidentiallity: Block cipher modes

BetterCrypto.org

Block ciphers operate on fixed size blocks of data. Online communication is defined by streams of data.
Block cipher modes repeatedly apply a given cipher to a stream of data. Examples include:
Cipher-Block Chaining Mode (CBC) Counter Mode (CTR) Galois-Counter Mode (GCM) [authenticated] Counter with CBC-MAC (CCM) [authenticated] Offset Codebook Mode (OCB) [authenticated]

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 9/91

Background
Confidentiallity: Block cipher modes
CBC Mode (sequential):

BetterCrypto.org

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 10/91

Background
Confidentiallity: Block cipher modes
CTR Mode (parallel):

BetterCrypto.org

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 11/91

Background
Integrity

BetterCrypto.org

Assures consistency of data

e.g. tampered data will be detected (and may be discarded)

Cryptographic hash functions like SHA can provide integrity by acting as a Hash based Message Authentication Code (HMAC) on the message to be sent and recieved

Hash-functions need to be collission-resistant: Two different inputs should never produce the same hash!

Ideally messages should be encrypted first then MACed (encrypt-then-mac, ETM) to prevent against attacks (CCA, CPA) and to provide for integrity of ciphertexts and plaintexts. See: http://bit.ly/1kZA6WR

Authenticated Encryption with Associated Data (AEAD) can be

used instead (e.g. GCM, CCM, OCB)

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 12/91

Background
Authenticity & Non-repudiation

BetterCrypto.org

Assures that the involved parties are genuine i.e. are who they say they are
Injection attacks Man-In-The-Middle (MITM) attacks Various cryptographic attack vectors
Examples: RSA (Rivest, Shamir, Adleman) DSA (Digital Signature Algorithm) ECDSA (Elliptic Curve DSA) Ed25519 (http://ed25519.cr.yp.to) ElGamal Signature System

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 13/91

Background
Authenticity & Non-repudiation: RSA

BetterCrypto.org

RSA

Used for:

Signatures Certificates Authenticated Key-Exchanges (don't) Encryption

Security based on the difficulty of factoring integers:
p q are large prime numbers (e.g.  1024bits) N =p×q find factors of N

Best known algorithm (1994): General Number Field Sieve

Computational complexity for n-bits: O

exp

(

64 9

n)

1 3

(log

n)

2 3

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 14/91

Background
Authenticity & Non-repudiation: RSA

BetterCrypto.org

RSA Key Generation
integer N is the product of two large primes p and q
(N) = (p - 1)(q - 1) choose an integer e (usually 65537), such that
1 < e < (N) gcd(e (N)) = 1
Public Key: N (modulus), e (public exponent) Private Key: d  e-1 (mod (N))

gcd and  denote the Greatest Common Divisor (Euclidian algorithm) and Euler totient function, respectively.
Math background: Modular arithmetic. Proof: Euler's theorem and Fermat's little theorem.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 15/91

Background
Authenticity & Non-repudiation: RSA

BetterCrypto.org

Alice sends her public key (modulus N and exponent e) to Bob Bob sends his public key (modulus N and exponent e) to Alice

RSA Encryption:
Bob wants to send a message M to Alice, turns M into an integer m (0  m < N) using a common padding-scheme
..computes ciphertext c  me (mod N)

RSA Decryption:
Bob sends ciphertext to Alice
Alice computes m  cd (mod N) ..recoveres Bob's message M by reversing the common padding-scheme

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 16/91

Background
Authenticity & Non-repudiation: RSA padding

BetterCrypto.org

..a secure padding scheme is really important.
Example: Bleichenbacher attack on PKCS#1 http://tinyurl.com/bleichenbacher (real world SSLv3 attack)
Not going into that here has been explained in detail in a 31c3 talk yesterday, see also: http://tinyurl.com/rsa-padding

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 17/91

Background
Key Agreement

BetterCrypto.org

A key exchange algorithm exchanges cryptographic keys (i.e. shared secrets) among parties which want to communicate confidentialy.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 18/91

Background
Key Agreement: Diffie-Hellman

BetterCrypto.org

The Diffie-Hellman key exchange algorithm (1976) was the first scheme devised to exchange cryptographic keys among multiple parties. It is the most widely used key exchange algorithm to this date.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 19/91

Background
Key Agreement: Diffie-Hellman

BetterCrypto.org

Alice and Bob want to communicate with each other and thus agree on a large prime number p and a generator g (0 < g < p)
Alice choses a secret integer x (private key) ..and calculates g x (mod p) as her public key Bob choses a secret integer y (private key) ..and calculates g y (mod p) as his public key

Math Background: Multiplicative group of integers modulo p https://en.wikipedia.org/wiki/Multiplicative_group_of_integers_modulo_n http://tinyurl.com/multiplicativegroupmodp

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 20/91

Background
Key Agreement: Diffie-Hellman

BetterCrypto.org

Alice and Bob exchange their public keys
Alice doesn't know Bob's y Bob doesn't know Alice's x
But,.. Alice however knows x and g y ..therefore calculates (g y )x (mod p) = g yx (mod p) Bob however knows y and g x ..therefore calculates (g x )y (mod p) = g xy (mod p)
They now have established a shared secret: g xy (mod p)

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 21/91

Background
Key Agreement: Forward secrecy

BetterCrypto.org

Forward secrecy (aka Perfect Forward Secrecy - PFS) ensures that only ephemeral session keys are used.
Even if a key is compromised in the future, not all communication that may have been recorded is compromised.
Simple, at the end of a session: Alice discards her public-key x Bob discards his public-key y
Hence: Ephemeral Diffie-Hellman (DHE and ECDHE).

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 22/91

Background
Ciphersuites

BetterCrypto.org

In SSL/TLS terminology; a ciphersuite combines the previously mentioned cryptographic techniques to work together and forms part of a secure (online) communication protocol

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 23/91

Background
Ciphersuites

BetterCrypto.org

Example: Elliptic Curve Diffie-Hellman (Ephemeral - PFS) RSA AES128 in Galois Counter Mode (GCM) SHA256
IANA standardized TLS parameters: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 24/91

Background
Ciphersuites

BetterCrypto.org

OpenSSL: ECDHE-RSA-AES128-GCM-SHA256

PolarSSL: TLS-ECDHE-RSA-WITH-AES-128-GCM-SHA256

GnuTLS: TLS_ECDHE_RSA_AES_128_GCM_SHA256

Apple Crypto Framework: TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256

Microsoft SChannel:
TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256_P256
(No ECDHE with RSA and GCM for Microsoft users, you get crappy ECDSA instead.)

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 25/91

Background
Transport Layer Security

BetterCrypto.org

Before talking about the history and attacks of TLS it just makes sense to point out how TLS actually works (TLS 1.2).

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 26/91

Background
Transport Layer Security: TLS records

BetterCrypto.org

TLS deals in "records". Different types of records exist: Handshake, ChangeCipherSpec, Application data and Alert.

In general TLS record looks like this:

1 Byte 1 Byte 1 Byte 1 Byte +--------+--------+--------+--------+

| type |

|

+--------+--------+-----------------+

|

version

|

length

|

+-----------------+-----------------+

|

message N

|

+-----------------------------------+

|

.

|

.

.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 27/91

Background
Transport Layer Security: TLS records

BetterCrypto.org

Handshake records do have a different message structure Alert records basically just send an error code (1 byte) and description (1 byte) instead of a full message.
Besides Handshake and ChangeCipherSpec records - any records may optionally contain a MAC and padding (up to 4 bytes each) at the end, depending on the previously negotiated ciphersuite.

For reference, see: https://en.wikipedia.org/wiki/Transport_Layer_Security#TLS_record

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 28/91

Background
Transport Layer Security: Handshake

BetterCrypto.org

[ Client ] ClientHello

-------->

[ Server ]

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 29/91

Background
Transport Layer Security: Handshake

BetterCrypto.org

[ Client ] ClientHello

--------> <--------

[ Server ]
ServerHello Certificate ServerKeyExchange CertificateRequest ServerHelloDone

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 30/91

Background
Transport Layer Security: Handshake

BetterCrypto.org

[ Client ] ClientHello

-------->

Certificate ClientKeyExchange CertificateVerify
[ ChangeCipherSpec ] Finished

<-------- -------->

[ Server ]
ServerHello Certificate ServerKeyExchange CertificateRequest ServerHelloDone

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 31/91

Background
Transport Layer Security: Handshake

BetterCrypto.org

[ Client ]
ClientHello
Certificate ClientKeyExchange CertificateVerify [ ChangeCipherSpec ] Finished

--------> <--------

[ Server ]
ServerHello Certificate ServerKeyExchange CertificateRequest ServerHelloDone

--------> <--------

[ ChangeCipherSpec ] Finished

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 32/91

Background
Transport Layer Security: Handshake

BetterCrypto.org

[ Client ]
ClientHello
Certificate ClientKeyExchange CertificateVerify [ ChangeCipherSpec ] Finished
Application Data
FIRST Conference 2015 - Berlin / June Aaron Zauner

--------> <--------

[ Server ]
ServerHello Certificate ServerKeyExchange CertificateRequest ServerHelloDone

-------->
<-------- <------->

[ ChangeCipherSpec ] Finished
Application Data

Introduction to and survey of TLS Security 33/91

Background
Session Resumption and False-start

BetterCrypto.org

Session-resumption and False-start are TLS extensions minimizing round-trip time and CPU cost.

Session-resumption:

An "abbreviated handshake" is used

Previously negotiated Handshake parameters are reused

False-start (somewhat deprecated):

Optional extension to send data before the Handshake is completed

After ChangeCipherSpec and Finished messages Client or Server data may be sent

Even if the other side has not acknowledged yet

For a good description see: http://chimera.labs.oreilly.com/books/1230000000545/ch04.html http://blog.cryptographyengineering.com/2012/04/so- long- false- start- we- hardly- knew- ya.html

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 34/91

Background
OCSP

BetterCrypto.org

Online Certificate Status Protocol (OCSP) is a mechanism to check for the validity and revocation of certificates.
OCSP has recieved a lot of critique: MITM attackers may also interfere with OCSP requests OCSP stapling can be used to mitigate this problem OCSP latency for large CAs is usually in the hundreds of milliseconds OCSP infrastructure completely broke down during Heartbleed

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 35/91

Background
HTTP Strict Transport Security

BetterCrypto.org

HTTP Strict Transport Security (HSTS) is a security policy that enforces HTTPS connections on following requests (e.g. upgrade every HTTP requests to HTTPS).
A small downside: the first HSTS header must be sent over HTTPS to ensure it cannot be tampered with.
Effectively disables ssl-stripping attacks.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 36/91

Background
TLS Renegotiation Indication Extension

BetterCrypto.org

RFC5746 defines a TLS extension that prevents for TLS Handshake renegotiaton attacks by sending a special Signaling Cipher Suite Value (SCSV) in the ClientHello which ties a renegotiation request to a TLS connection.
Called "Secure Renegotiation".

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 37/91

Background
SPDY, NPN, ALPN and so forth

BetterCrypto.org

Google drafted specifications for protocol upgrade to SPDY including NPN and ALPN which SPDY effectively relies on. SPDY is the basis for the work in the IETF HTTPBIS-WG that will standardize HTTP2.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 38/91

Background
Web-of-Trust and X.509

BetterCrypto.org

X.509, and Web-of-(mis)trust and ASN.1 would require a two hour talk on their own.
Certificate Authorities should and can not be trusted, they are known to behave maliciously at times, give away sub-CAs for DPI to large companies and nations and regularly fuck up their own security processes.
Read for example: http://www.certificate-transparency.org/what-is-ct

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 39/91

History & Attacks

BetterCrypto.org

Now that you have an idea of the necessary background, let's take a look at the history of TLS (in)security.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 40/91

History & Attacks
Internet Dark Ages

BetterCrypto.org

SSLv1 engineered at Netscape, never released to the public Kipp Hickman of Netscape introduces SSLv2 as an IETF draft back in 1995:
The SSL Protocol is designed to provide privacy between two communicating applications (a client and a server). Second, the protocol is designed to authenticate the server, and optionally the client. [...]

http://tools.ietf.org/html/draft- hickman- netscape- ssl- 00
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 41/91

History & Attacks
Internet Dark Ages

BetterCrypto.org

SSLv2 was fundamentally broken and badly designed. Basically full loss of Confidentiallity and integrity of on-wire data thus susceptible to MITM attacks, see: http://osvdb.org/56387
CipherSpec is sent in the clear
Size of Block-cipher padding is sent in the clear

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 42/91

History & Attacks
Internet Dark Ages

BetterCrypto.org

SSLv3 was introduced in 1996 by Paul Kocher, Phil Karlton and Alan Freier, utilizing an algoritm by Taher ElGamal, a known cryptographer and Chief Scientist at Netscape at the time: https://tools.ietf.org/html/rfc6101

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 43/91

History & Attacks
Internet Dark Ages

BetterCrypto.org

On a side note; back then the choice algorithms was limited and export ciphers (low security) common as recommended by NSA and mandated by US law. Google: "Bernstein vs. United States"
encryption algorithms (Confidentiality): NULL, FORTEZZA-CBC (NSA), IDEA-CBC, RC2-CBC-40 (40bit security), RC4-128, DES40-CBC (40bit security), DES-CBC (56bit security), Triple-DES-EDE-CBC
hash functions (integrity): NULL, MD5 and SHA

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 44/91

History & Attacks
Internet Dark Ages

BetterCrypto.org

David Wagner and Bruce Schneier publish a paper entitled "Analysis of the SSL 3.0 protocol":
Keyexchange algorithm rollback Protocol fallback to SSLv2 Protocol leaks known plaintexts - may be used in cryptanalysis Replay attacks on Anonymous DH (don't use it anyway!)

https://www.schneier.com/paper- ssl.pdf
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 45/91

History & Attacks
TLS appears

BetterCrypto.org

1999. The SSL protocol is renamed to TLS (version 1) with little improvements over SSLv3. The spec. is almost identical.
Diffie-Hellman, DSS and Triple-DES are now required by implementors most SSLv3 security issues are still present in TLS 1.0 (RFC2246)

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 46/91

History & Attacks
TLS gets padding attacks

BetterCrypto.org

2002. Vaudenay publishes a paper entitled "Security Flaws Induced by CBC Padding Applications to SSL, IPSEC, WTLS..."
Side-channel attack on CBC mode padding valid/invalid padding causes different reactions can be used to influence decryption operations introduces "padding oracle attacks" in SSL

http://www.iacr.org/cryptodb/archive/2002/EUROCRYPT/2850/2850.pdf

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 47/91

History & Attacks
TLS gets extended

BetterCrypto.org

2003. TLS extensions get specified in RFC3546. General: Extended Handshake, ClientHello and ServerHello Server Name Indication (SNI) for virtual hosting (SNI leaks metadata!) Certificate Status Request (CSR) support via OCSP (...)

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 48/91

History & Attacks
TLS gets timing attacks

BetterCrypto.org

2003. Brumley and Boneh publish a paper entitled "Remote timing attacks are practical".
Timing attack on RSA in SSL/TLS implementations (OpenSSL): Send specially crafted ClientKeyExchange message Mesure time between ClienyKeyExchange and Alert response do a bit of statistics retrieve Private Key

http://dl.acm.org/citation.cfm?id=1251354
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 49/91

History & Attacks
TLS gets padding oracle password retrieval

BetterCrypto.org

2003. Canvel, Hiltgen, Vaudenay, Vuagnoux publish "Password Interception in a SSL/TLS Channel".
Extend earlier work of Vaudenay and successfully intercept IMAP passwords in TLS channels.

http://www.iacr.org/cryptodb/archive/2003/CRYPTO/1069/1069.pdf

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 50/91

History & Attacks
TLS gets chosen plaintext attacks

BetterCrypto.org

2004 & 2006. Bard demonstrates Chosen-Plaintext Attacks against SSL and TLS1.0
Attack on CBC: CBC exchanges an Initialization Vector (IV) during Handshake these IVs turn out to be predictable PINs and Passwords can be decrypted VPNs/Proxies can also be used to accomplish this task

https://eprint.iacr.org/2004/111 https://eprint.iacr.org/2006/136
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 51/91

History & Attacks
TLS gets updated

BetterCrypto.org

2006. A new TLS protocol version is standardized: TLS 1.1 EXPORT ciphers removed Session resumption Protection against the CBC attacks by Bard IANA TLS parameters standardized (...)
(RFC4346)

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 52/91

History & Attacks
TLS gets modern crypto

BetterCrypto.org

2008. A new TLS protocol version is standardized: TLS 1.2 MD5/SHA1 removed as pseudorandom function (PRF) configurable PRFs in ciphersuites (e.g. SHA256) Authenticated encryption: CCM, GCM AES ciphersuites (...)
(RFC5246)

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 53/91

History & Attacks
Rouge CA Certificates

BetterCrypto.org

2008. Sotirov, Stevens, Appelbaum, Lenstra, Molnar, Osvik and de Weger present a paper based on earlier work by Lenstra et al. at 25c3 entitled "MD5 considered harmful today"
MD5 Hash-collision of a CA Certificate Create colliding (rouge) CA Certificates Generate any Certificate for MITM you want

http://www.win.tue.nl/hashclash/rogue- ca/ https://www.youtube.com/watch?v=PQcWyDgGUVg
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 54/91

History & Attacks
sslstrip

BetterCrypto.org

2009. Moxie Marlinspike releases sslstrip at BlackHat DC 2009.
Client connects to server Attacker intercepts session via MITM Attacker sends HTTP 301 (moved permanently) Attacker forwards requests to/from server via SSL/TLS Client receives data via unencrypted channel Attacker reads plaintext

http://www.thoughtcrime.org/software/sslstrip http://vimeo.com/50018478
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 55/91

History & Attacks
Null-prefix attacks against Certificates

BetterCrypto.org

2009. Moxie Marlinspike publishes "Null prefix Attacks against SSL/TLS Certificates".
Specially crafted domain strings trick CA checking null-terminate stuff in a domain name ex.: www.paypal.com\0.thoughtcrime.org is valid ex.: *\0.thoughtcrime.org is valid CA ignores prefix Client does not -> Certificate valid for prefix Moxie updated his sslsniff project to carry out this attack.

http://www.thoughtcrime.org/papers/null- prefix- attacks.pdf http://thoughtcrime.org/software/sslsniff
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 56/91

History & Attacks
SSLv2 Forbidden

BetterCrypto.org

2011. IETF publishes and standardized a RFC to prohibit negotiation and thus compatibility of SSLv2 in TLS1.0-1.2 entirely.

https://tools.ietf.org/html/rfc6176
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 57/91

History & Attacks
Comodo

BetterCrypto.org

2011. Comodo CA: Attacker issues 9 certificates via reseller account for popular domains (google.com, yahoo.com, live.com, skype.com [...])

https://www.comodo.com/Comodo- Fraud- Incident- 2011- 03- 23.html
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 58/91

History & Attacks
BEAST

BetterCrypto.org

2011. Doung and Rizzo publish the BEAST attack at ekoparty and demo a live attack on PayPal. Based on Bards earlier work on predictable IVs in CBC:
Phishing gets victim to visit a certain website Script on said website makes request to genuine site Attacker records encrypted cookie information Tries to guess session-cookie with known CBC attack Same Origin Policy (SOP) forbids this attack in client software. If SOP can be bypassed (as shown by the authors with Java's SOP) this attack is still practical.

http://vnhacker.blogspot.co.at/2011/09/beast.html
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 59/91

History & Attacks
Trustwave

BetterCrypto.org

2012. Trustwave CA: Trustwave sells subordinate CAs to big corporations to be used for Deep Packet Inspection.
A sub-CA can issue and fake any certificate for MITM attacks.

http://blog.spiderlabs.com/2012/02/clarifying- the- trustwave- ca- policy- update.html http://arstechnica.com/business/2012/02/ critics- slam- ssl- authority- for- minting- cert- used- to- impersonate- sites/

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 60/91

History & Attacks
DigiNotar

BetterCrypto.org

2012. DigiNotar CA: Attackers compromise DigiNotar in it's entirety.
attackers generate tons of certificates Google Chromes certificate store detects mismatches DigiNotar acknowledges breach DigiNotar files for bankrupcy FOX-IT never gets paid for the investigation

https://en.wikipedia.org/wiki/DigiNotar http://cryptome.org/0005/diginotar- insec.pdf http://nakedsecurity.sophos.com/2011/09/05/ operation- black- tulip- fox- its- report- on- the- diginotar- breach

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 61/91

History & Attacks
Certificate validation in non-browser software

BetterCrypto.org

2012. Georgiev, Iyengar, Jana, Anubhai, Boneh and Shmatikov publish a paper entitled "The most dangerous code in the world: validating SSL certificates in non-browser software"

Certificate validation vulnerabilities in:

OpenSSL

GnuTLS

JSSE

EC2 Java libraries & Amazon SDKs

PayPal SDKs

eCommerce/WebShop software

..cURL, PHP, Python, tons of Java middleware

https://crypto.stanford.edu/~dabo/pubs/abstracts/ssl- client- bugs.html

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 62/91

History & Attacks
CRIME

BetterCrypto.org

2012. Doung and Rizzo publish an attack against TLS Compression and SPDY titled CRIME.

MITM attacker sees length of compressed ciphertext compression has direct affect on the length attacker makes client compress/encrypt data (or uses known data) with secret data attacker compares correct guesses yield shorter messages due to compression repeat until done

This is only feasible for small amounts of data, e.g. session strings, cookies and so forth.

https://isecpartners.com/blog/2012/september/details- on- the- crime- attack.aspx

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 63/91

History & Attacks
TIME

BetterCrypto.org

2013. Be'ery and Shulman present TIME at BlackHat Europe. Extend on the CRIME Attack:
Attacker generates HTTP requests (XSS, injection,..) Attacker exploits SOP design flaw and measures RTT differences determines correct or failed guesses by SOP timing leak

https://media.blackhat.com/eu- 13/briefings/Beery/bh- eu- 13- a- perfect- crime- beery- wp.pdf https://www.youtube.com/watch?v=rTIpFfTp3- w

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 64/91

History & Attacks
Lucky13

BetterCrypto.org

2013. AlFardan and Paterson present a novel attack against CBC for TLS and DTLS based on timing analysis.
Attacker intercepts and modifies a message including padding Attacker tempers with the padding of the message MAC computation takes longer during decryption process Attacker repeats and measures Attacker performs padding oracle attack described earlier (Extremely latency sensitive attack)

http://www.isg.rhul.ac.uk/tls/Lucky13.html http://www.isg.rhul.ac.uk/tls/TLStiming.pdf
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 65/91

History & Attacks
RC4 Biases

BetterCrypto.org

2013. AlFardan, Bernstein, Paterson, Poettering and Schuldt publish a generic attack on the RC4 cipher for TLS and WPA.
Statistical biases in the first 257 bytes of ciphertext Recovery of the first 200 bytes after 228 to 232 encryption operations of the same plaintext
A broadcast attack: mounted on unique keys
May also be mounted with a single key with repeating target plaintexts
Only feasible for large amounts of data and very time consuming

http://www.isg.rhul.ac.uk/tls http://www.isg.rhul.ac.uk/tls/RC4biases.pdf
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 66/91

History & Attacks
NIST curves

BetterCrypto.org

2013 & 2014. Daniel J. Bernstein and Tanja Lange voice concern about the NIST Elliptic Cuves that are widely implemented and used in TLS for ECDH and ECDSA

NIST curves defined on recommendations by NSA's Jerry Solinas

Unclear why these curves and their parameters were chosen

NIST cites efficiency: more efficient and secure curves available

Possible mathematical backdoor through previous analysis and carefully chosen and unexplained parameters

Start SafeCurves project (ongoing)
http://www.hyperelliptic.org/tanja/vortraege/20130531.pdf http://cr.yp.to/talks/2013.09.16/slides- djb- 20130916- a4.pdf http://safecurves.cr.yp.to https://archive.org/details/ShmooCon2014_SafeCurves
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 67/91

History & Attacks
BREACH

BetterCrypto.org

2013. Gluck, Harris and Prado demonstrate yet another attack based on CRIME at BlackHat USA.
Very similar to CRIME but the attack works based on information leaks from HTTP compression instead of TLS compression.

http://breachattack.com https://www.youtube.com/watch?v=CoNKarq1IYA
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 68/91

History & Attacks
Unused Certificates in Truststores

BetterCrypto.org

2014. Perl, Fahl, Smith publish a paper entitled "You Won't Be Needing These Any More: On Removing Unused Certificates From Trust Stores"
Compared 48 mio. HTTP certificates 140 CA Certificates are unused in all major trust stores Of 426 trusted root certificates only 66% are even used

http://fc14.ifca.ai/papers/fc14_submission_100.pdf
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 69/91

History & Attacks
Triple Handshakes Considered Harmful

BetterCrypto.org

2014. Bhargavan, Delignat-Lavaud, Pironti, Langley and Ray present an attack one day before the IETF'89 meeting in London.
Limited to client-certificate authentication with renegotiation MITM attack on renegotiation with a three-way handshake Variations of the attack also discussed on their website Can't possibly fit this into one slide, homework: understand the attack by reading their excellent description on the website

https://secure- resumption.com https://secure- resumption.com/IETF- triple- handshakes.pdf
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 70/91

History & Attacks
Frankencerts

BetterCrypto.org

2014. Brubaker, Jana, Ray, Khurshid and Shmatikovy publish a paper entitled "Using Frankencerts for Automated Adversarial Testing of Certificate Validation in SSL/TLS Implementations"
Fuzzing of X.509 related code in all major implementations shows serious weaknesses in certificate validation and handling
OpenSSL, NSS, GnuTLS, MatrixSSL, PolarSSL, CyaSSL, cyptlib [...]

https://www.cs.utexas.edu/~shmat/shmat_oak14.pdf https://github.com/sumanj/frankencert
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 71/91

History & Attacks
Heartbleed

BetterCrypto.org

2014. Heartbleed is independently discovered by Codenomicon and a Google Security engineer.
Faulty implementation in OpenSSL of the TLS Heartbleed extension leaks memory content over the wire. This has been all over the media and discussed in detail all over the internet. People have successfully extracted sensitive information (password files et cetera) from victim memory.
I wrote an nmap plugin to scan for Heartbleed: https://github.com/azet/nmap-heartbleed

http://heartbleed.com
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 72/91

History & Attacks
Virtual Host Confusion

BetterCrypto.org

2014. At BlackHat Delignat-Lavaud presents an attack based on SSLv3 downgrade and sharing of session caches
Attacker forces downgrade to SSLv3 For SSLv3: larger deployments share session caches attacker exploits a server vulnerability where session caches are reused attacker requests different subdomain with SSLv3 using the same session vulnerable server will allow connection w/o authentication www.company.com vs git.company.com

https://bh.ht.vc
FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 73/91

History & Attacks
POODLE

BetterCrypto.org

2014. POODLE: Padding Oracle On Downgraded Legacy Encryption - OpenSSL/Google
MITM attacker downgrades to SSLv3 (once again) attacker does block duplication takes on average 256 requests to decrypt 1 byte (!) disabling SSLv3 or using the FALLBACK_SCSV TLS extension (draft) mitigates this issue entirely
https://www.openssl.org/~bodo/ssl- poodle.pdf

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 74/91

History & Attacks
SChannel RCE

BetterCrypto.org

Patch tuesday Nov. 2014: Remote Code Execution in Microsoft SChannel
Enables malicious attackers to initiate ClientCertificate exchange (even if unsupported) with payload in the signature
http://blog.beyondtrust.com/triggering- ms14- 066

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 75/91

History & Attacks
POODLE again

BetterCrypto.org

2014. POODLE on TLS 1.0-1.2 turns out some implementations (e.g. F5 load balancers) are vulnerable to POODLE even for TLS 1.0 - TLS 1.2 since TLS 1.1 this should have been mitigated entirely, but 3.6% of servers vulnerable
https://www.imperialviolet.org/2014/12/08/poodleagain.html https://vivaldi.net/blogs/entry/not- out- of- the- woods- yet- there- are- more- poodles

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 76/91

History & Attacks
Implementation Issues

BetterCrypto.org

There are tons of other issues with TLS stacks and software implementations that have not been discussed.

OpenSSL alone published 24 security advisories in 2014 until today.
Apple's GOTO fail GnuTLS GOTO fail various GnuTLS vulnerabilities wrong use of OpenSSL API in server and client software
... Clearly; a lot of people current have their eyes on this very topic.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 77/91

History & Attacks
Implementation Issues

BetterCrypto.org

For this crowd: It's up to you to find them and improve existing implementations, protocols and standards.

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 78/91

IETF efforts

BetterCrypto.org

Internet Society

|

Inte rnet Architecture Board

|

|

IETF ( 1 )

IRTF ( 2 )

|

|

Steering Group

Steering Group

|

|

|

|

|

|

WG WG WG . .

WG WG WG . .

1 - Internet Engineering Task Force 2 - Internet Research Task Force

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 79/91

IETF efforts
post-Snowden

BetterCrypto.org

After the Snowden Leaks appeared in press the IETF began discussion on how `'pervaisive monitoring" can be prevented
In September 2013 the `'PERPASS" (pervaisive, passive monitoring) mailing list was started
People started working on drafts to circumvent `'pervaisive monitoring": http://down.dsg.cs.tcd.ie/misc/perpass.txt

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 80/91

IETF efforts

BetterCrypto.org

IETF 89 was accompanied by a meeting on the topic (STRINT) with invited speakers on privacy, security and cryptography: https://www.w3.org/2014/strint/
`'strenghtening the internet against pervaisive monitoring"
a lot of good feedback and ideas
main takeaways: threat modeling, CFRG was tasked with TLS-WG guidance on choices of ciphers and which curves/parameters (ECC) to use
http://tools.ietf.org/html/draft- iab- strint- report- 00

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 81/91

IETF efforts
New WGs and documents being worked on

BetterCrypto.org

UTA-WG (utilizing TLS in applications): working BCPs on

how to properly use/implement TLS

TLS-WG (transport layer security): TLS 1.3,

chacha20-poly1305, DJB curves (ECC), FALLBACK_SCSV

extension,..

TCPINC (TCP increased security): working on standardization

of opportunistic encryption on the TCP layer (similar to

tcpcrypt)

DPRIVE (DNS private exchange): working on DNS privacy

features

IAB (internet architecture board): threat model, see:

https://tools.ietf.org/html/draft-iab-privsec-confidentiality-threat

TRANS (Public Notary Transparency): fight malicious

certificate authorities with certificate transparency, see:

www.certificate-transparency.org
FIRST Conference 2015 - Berlin / June
...Aaron Zauner

Introduction to and survey of TLS Security 82/91

IETF efforts
Curves Curves Curves

BetterCrypto.org

CFRG (cryptography forum research group within IRTF) is working on a standardized set of curves and curve parameters for IETF WGs: expected by the end of 2014 + Curve25519 (dan bernstein, et al.) + NUMS (microsoft) + ed448goldilocks (michael hamburg)
In comparison to NIST curves: most new proposals are plugable into existing standards and can be reused within protocols and IETF documents.

Good summary (by the Brainpool authors, so a bit biased): http://eprint.iacr.org/2014/832.pdf

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 83/91

IETF efforts

BetterCrypto.org

Certificate Transparency is now being worked on as an IETF standard: https://datatracker.ietf.org/wg/trans/charter/ discussion on mandatory encryption in HTTP2 (HTTPBIS-WG)

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 84/91

IETF efforts

BetterCrypto.org

On Nov. 14, 2014 Internet Architecture Board issued a statement recommending deploying encryption by default throughout the protocol stack in further developments.
Commended by Internet Society a day later.

https://www.iab.org/2014/11/14/iab- statement- on- internet- confidentiality/ http://www.internetsociety.org/news/ internet- society- commends- internet- architecture- board- recommendation- encryption- default

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 85/91

Mitigation
Get informed!

BetterCrypto.org

Luckily Mitigation does not require as much slides. Because it's rather simple:
Use current software and update regularly: Most of these attacks are fixed upstream Use peer-reviewed and solid configurations: Check out https://bettercrypto.org Listen to recommendations by security experts Audit your infrastructure (possibly even pay external contractors to take a look) Keep track of TLS security and evolving security standards and recommendations

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 86/91

Mitigation
Future work

BetterCrypto.org

IETF TLS-WG is currently working on TLS 1.3 to mitigate some of the issues and concerns raised.

Drafts like new SCSVs would effectively prevent protocol downgrade attacks. (constant-time) ciphers and curves and DH parameter negotiation have been proposed along with protocol improvements for efficiency, security and privacy. It's still in the making and worth to keep track of.

Cryptography libraries seem to be more actively audited now, which has resulted in some of the disclosures in the paths months.

http://www.ietf.org/proceedings/89/slides/slides- 89- tls- 5.pdf https://tools.ietf.org/html/draft- bmoeller- tls- downgrade- scsv http://tools.ietf.org/html/draft- agl- tls- chacha20poly1305 https://datatracker.ietf.org/doc/draft- gillmor- tls- negotiated- dl- dhe/?include_text=1

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 87/91

Mitigation
Future work

BetterCrypto.org

..and in Dec. 2014 W3C has established a working group to "secure the web through encryption": https://w3ctag.github.io/web-https

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 88/91

Mitigation
Distribute Trust

BetterCrypto.org

Certificate Transparency and HPKP are only a few examples of proposed solutions to tackle the issue of malicious certificate authorities, certificate forgery and MITM attacks.
Letsencrypt: Free, Secure, audited and distribtued CA by Cisco, Akamai, UMichigan, EFF and others Cloudflare Keyless SSL: Have keys on central HSMs/servers instead on each frontend. Certificate Transparency: distributed consent, monitoring and auditability of certificates and CAs in the wild HPKP pins keys to certificates to prevent MITM and certificate based attacks

https://letsencrypt.org/

https://www.cloudflare.com/keyless- ssl

http://www.certificate- transparency.org

hFtIRtSpTs:C/o/ndfaerteantcrea2c0k1e5r.-iBeetrfli.no/rgJu/ndeoc/draft-ietf-websec-key-pinning/Introduction to and survey of TLS Security

Aaron Zauner

89/91

Conclusion

BetterCrypto.org

"Trust the Math" (Schneier) Implementation is still a big issue Software bugs are a big issue Protocol design is hard and longsome We're going to see many more attacks on TLS TLS and Crypto improvements are being constantly worked on

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 90/91

T

.A

?

Twitter: @a_z_e_t

E-Mail: azet@azet.org

XMPP: azet@jabber.ccc.de

GitHub: https://github.com/azet

GPG Fingerprint: 7CB6 197E 385A 02DC 15D8 E223 E4DB 6492 FDB9 B5D5
[I have ECDSA (Brainpool) & EdDSA (Curve25519) subkeys as well.]

FIRST Conference 2015 - Berlin / June Aaron Zauner

Introduction to and survey of TLS Security 91/91

