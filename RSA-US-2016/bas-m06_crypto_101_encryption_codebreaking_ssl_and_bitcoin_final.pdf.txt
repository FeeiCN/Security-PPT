SESSION ID: BAS-M06
Crypto 101:
Encryption, Codebreaking, SSL and Bitcoin

Benjamin
HVF Labs @BenjaminJun

Some material adapted from Ivan Ristic, Qualys (RSAC 2011)

Crypto 101
Cryptography is the art and science of keeping messages secure.
Cryptography building blocks `
Cryptographic protocols
SSL / TLS Bitcoin
Attacks on cryptography
2

Security \si-kyur--t\

the state of being free from danger or threat

Cryptography terms
Confidentiality Integrity Authentication Access control Non-repudiation

`
Other Criteria
Interoperability Performance Usability

3

#RSAC
`
Crypto Building Blocks

Encryption
Obfuscation that is fast when you know the secrets, but impossible or slow when you don't.
`

Scytale 300BC

Jefferson Wheel (M94) 1900s
5

Enigma Machine 1920s
Image credit: Luringen, Sobebunny, R Boo

Symmetric encryption
`
Use shared key to encrypt/decrypt
Algorithm does not need to be secret Key must be agreed and communicated in advance
Convenient and fast Examples: RC4, 3DES, AES
6

Asymmetric encryption
Two related keys: one private, one public Anyone with the public key can encrypt the message Only the private key holder can decrypt message Enables encryption, key exchange, and authentication
`
Examples: RSA, Diffie-Hellman, ElGamal, DSA, Elliptic curve (ECDH / ECDSA) Significantly slower than symmetric encryption

Authentication
Confirm data integrity and message origin

`

Egyptian signet ring (500BC)

Mark of the Fisherman (1200AD)
On death, Cardinal Camerlengo to destroy

US nuclear "football" (present day)
Keys roll at noon on inauguration day

8 British Museum, flikr:favoritethings

Digital signatures
Asymmetric cryptography can authenticate messages
Only the private key holder can generate a signature Anyone with the public key can validate the signature Signatures protect digital certificates from modification or forgery
`

sign

Signed documen
t
9

verify

Digital certificates

Digital ID can include public/private keypair

Digital certificate conveys identity

Credential holder info (name, address, etc.)

Identity's public key

`

Validity period

Digital signature of Certificate Authority (CA)

Authentication has 3 steps
CA signature confirms data is authentic, vouched for Do we approve of data in the certificate? Identity keypair validated to confirm ID holder has the private key
10

Randomness matters
Random numbers at heart of crypto Used for key generation Weak keys = weak encryption
Random number generators ` True random (TRNG) ­ truly random Pseudorandom (PRNG) ­ look random PRNGs fine if properly seeded, properly designed
11

"elliptic curve discrete logarithm problem" (ECDLP): given points P and Q on an ellipt

curve of ordeAr pn,pfeinnddaixsuAch: (tNhaot rQmaatiPv.e) Application-Specific Constants Dual_EC_DRBG uses an initial seed that is 2 * security_strength bits in length to initia

the genAer.1atioCnonofstoaunttlesnf-obritthpeseDuduoarla_nEdCo_mDRstBriGngs by performing scalar multiplications two points in an elliptic curve group, where the curve is defined over a field approxima 2m in siTzhee. FDourala_lEl tCh_eDNRIBSGT rceuqruvieressgthiveesnpeicniftihcaistioRnescoofmanmeelnlidptaitciocunr,vme ainsdattwleoapsotitnwtsicoen tthhe
NIST SP800-90A: Dual EC securityeul_sleispdttriiecnncaguptrphvl,eic.aaOntidnoennsoefrveteqhrueilfreoisnlslgotcwheairnntigf2iNc5aI6tSi.oTTnahuprnpodrueorgvh[eFodIuPctSutrh1v4ies0s]Dw. MRithBoarGessdomecteiaacitlhesdaanbpioosuimntttshsehseall be
specificcautrivoens,mmaywbiellfobuenrdefiner[rFeIdPSto1a8s6]s.eIef dallteenrn; atthiveetepromint"ssaereeddleesnir"edis, tahpepyrsohparlilabtee because
DRBG with NIST NSA* the integrennaelrastteadteasofspDecuifaile_dEinCA_pDpRenBdGix Ais.2u.sed as a "seed" for the random block it produ
Figure E1a3chdeopfifcotlslotwheinDg cuuarlv_eEs Cis_gDivRenBbGy .the equation:

Notation:

constants y2 = x3- 3x + b (mod p)
seed
Instant. or

p - Order of n[O- pOtriodnear lo] f

the the

fireesleded

Fonly p

Elliptic

+

C, guirvveetnGinrodue(pxc,i(imtn*aPdl)e)cismal

.

(x (s*Q))

r

Extract Bits

additaio­na(l-3in)piuntthe above equation
0

P

b - Coefficient above If additional input = Null

Q

Pseudorandom

Bits

The x and y coordinates of the base point, i.e., generator G, are the same as for the point P.

A.1.1 Curve P-256 Figure 13: Dual_EC_DRBG

The inspta=nti1a1ti5o7n9o2f08th9i2s1D0R35B6G24m87e6c2h6an9i7s4m46r9e4q9u4ir0e7s5t7h3e5s3e0le0c8t6io1n4\of an appropriate ellip
(don't use these) curve and cu3r4v1e5p2o9i0n3t1s4s1p9e5ci5f3ie3d63in13A0p8p8e6n7d0i9x7A85.139f5o1r the desired security strength. The
sseeceudruitsyne_ds=ttro1e1dn5egt7teh9r2mb0iit8ns9eo2tf1he0en3it5nr6oit2pia4yl8. v7Fa6ul2rut6eh9e(7rs4)r4eo6qf9ut4ihr9ee4mD07eRn5Bt7sG3f5om2r9et9hc9eh6as9ne5ies\dmarsehaplrlohvaidveedaitnleSaesct t 8.6. This DR52B2G41m35ec7h6a0n3i4s2m42u2s2e5s9th0e61d0e6ri8v5a1t2io0n44fu3n6c9tion specified in Section 10.4.1 dur instantibat=ion5aacn6d3r5eds8eedaian3ga.93e7 b3ebbd55 769886bc 651d06b0 cc53b0f6 3bce3c3e
27d2604b
The maximum security strength that can be supported by the Dual_EC_DRBG is the securityPxstr=en6gfbt41ha71od3f19tfh42e5 cedu18r2v9ce84cu22s49e76d;ft8hbecsee6ceu5rit6y3satr4e4n0gft2hs7f7o0r3th7ed8c1ur2vdeseba3re3ap0rovided in 800-57].
Py = 4fe342e2 fe1a7f9b 8ee7eb4a 7c0f9e16 2bce3357 6b315ece cbb64068 37bf51f5
Qx = c97445f4 5cdef9f0 d3e05e1e 585fc297 235b82b5 be8ff3ef
ca67c598 52018192

Qy = b28ef557 ba31dfcb dd21ac46 e2a91e3c 304f44cb 87058ada

2cb81515 1e610046

60

* NYT Snowden memos, September 2013

77

Hash functions

One-way transformation to generate data fingerprints for:
Digital signatures Integrity validation Tokenization (e.g., storing passwords)
`
Examples
MD5 considered broken SHA-1 (160) some concerns SHA-2 (256) ok Keccak and SHA-3

SHA2 (SHA-256) compression function
D esirable qualities
Preimage resistance (one-wayness Collision resistance and birthday

12

Stay humble

Don't roll your own crypto
Failure modes subtle, catastrophic Standard crypto has been strongly vetted

Avoid unnecessary complexity`
System only as strong as its weakest link Complexity = more stuff to go wrong

Never rely on obscurity

Auguste Kerckhoffs (1835-1903)

"If I can barely understand it, then it must be strong!"

Kerckhoffs's principle: only the key should be secure

13

#RSAC
`
Putting It All Together - SSL / TLS - Bitcoin

TLS
Transport Layer Security
World's most widely used cryptographic protocol From Netscape SSL3 (Kocher, 1995)
`
Security requirements
Securely connect with someone you have never met Data privacy, data integrity, no site impersonation, no man-in-middle
15

Getting to https

1. Webserver provides digital certificate to browser
· "Amazon.com's passport"

2. TLS layer + browser

"authenticates passport"

`

· Confirms data fields in cert

· Confirms digital signature

3. TLS layer confirms that webserver holds private key
· Sends encrypted data that can only be decrypted w/private key

16

Amazon info Certificate Authority info
Amazon public RSA key Cert. Authority signature

TLS: Connection
Certificate check passed!
`
TLS 1.2 protocol for secure socket & session mgmt
17

AES_128_GCM for bulk data · Symmetric crypto · AES128 block cipher (privacy) · Galois authentication
(integrity)
ECDHE_RSA for key exchange · Asymmetric crypto · Confidentiality: Elliptic curve
Diffie-Hellman · Authentication: RSA2048 · "Perfect forward secrecy"

Bitcoin (1/2)
Peer-to-peer, decentralized currency
Not underwritten by any entity "Satoshi Nakamoto" paper (2008)
`
180K transactions/day (Jan `16)
18

Bitcoin: A Peer-to-Peer Electronic Cash System
Satoshi Nakamoto satoshin@gmx.com
www.bitcoin.org
Abstract. A purely peer-to-peer version of electronic cash would allow online payments to be sent directly from one party to another without going through a financial institution. Digital signatures provide part of the solution, but the main benefits are lost if a trusted third party is still required to prevent double-spending. We propose a solution to the double-spending problem using a peer-to-peer network. The network timestamps transactions by hashing them into an ongoing chain of hash-based proof-of-work, forming a record that cannot be changed without redoing the proof-of-work. The longest chain not only serves as proof of the sequence of events witnessed, but proof that it came from the largest pool of CPU power. As long as a majority of CPU power is controlled by nodes that are not cooperating to attack the network, they'll generate the longest chain and outpace attackers. The network itself requires minimal structure. Messages are broadcast on a best effort
$6.5B in circulation (Jan '16) basis, and nodes can leave and rejoin the network at will, accepting the longest proof-of-work chain as proof of what happened while they were gone.
1. (UIntSrodMuct0ionSupply: $4,007B, Nov `15)
Commerce on the Internet has come to rely almost exclusively on financial institutions serving as trusted third parties to process electronic payments. While the system works well enough for most transactions, it still suffers from the inherent weaknesses of the trust based model. Completely non-reversible transactions are not really possible, since financial institutions cannot avoid mediating disputes. The cost of mediation increases transaction costs, limiting the minimum practical transaction size and cutting off the possibility for small casual transactions, and there is a broader cost in the loss of ability to make non-reversible payments for nonreversible services. With the possibility of reversal, the need for trust spreads. Merchants must be wary of their customers, hassling them for more information than they would otherwise need. A certain percentage of fraud is accepted as unavoidable. These costs and payment uncertainties can be avoided in person by using physical currency, but no mechanism exists to make payments over a communications channel without a trusted party.
What is needed is an electronic payment system based on cryptographic proof instead of trust, allowing any two willing parties to transact directly with each other without the need for a trusted third party. Transactions that are computationally impractical to reverse would protect sellers from fraud, and routine escrow mechanisms could easily be implemented to prDotieacgtrabmuysefrros.mIbnlockchain.info

Bitcoin (2/2)
Characteristic What happens

Cryptography

Value creation Coin transfers

Mined by searching for magic

values

KWh --> BTC!

`

Digital signatures

Proof-of-work method uses SHA-256 hash function
ECDSA digital signature

Recordkeeping
(no doublespending)
Backing entity

Distributed ledger with financial Block chain uses SHA-256

incentive for a "single view"

hash function

NONE!

Everything regulated by market forces + math!

Great technical resource: Bitcoin De19veloper Reference by Krzysztof Okupski

#RSAC
`
Attacks on Cryptography

Brute force

`

US Navy Bombe, 1943
Contains 16 four-rotor Enigma equivalents to perform exhaustive key search.

DES Keysearch Machine, 1998 Tests 90 billion keys/sec, average time to crack 56-bit DES: 5 days
(Cryptography Research, AWT, EFF)
21

Cryptanalysis

HDCP = "High bandwidth Digital Copy Protection"

Protects digital content, interoperability
Fast, offline, any-to-any negotiation ` Encryption and authentication

"Clever" key management

No one device contains global secret But keys from

HDCP master key published (2010)

~40 devices can reveal the master

Unlicensed implementations cannot

key

be revoked

22

A Cryptanalysis of the High-bandwidth Digital Content Protection System
(Crosby, Goldberg, Johnson, Song, Wagner)
image from www.hdmi.org

Implementation: Side Channel (1/2)

Simple EM attack with radio at distance of 10 feet

Devices

Antennas

`
Signal Processing (demodulation, filtering)
23

Digitizer, GNU Radio peripheral ($1000)
Receiver ($350)
Images from Cryptography Research

Implementation: Side Channel (2/2)

Focus on Mpdp mod p calculation (Mqdq mod q similar)

For each bit i of secret dp

perform "Square"

if (bit i == 1)

perform "Multiply"

endif

endfor

`

SM S S S S S24S S SM S SM SM S S S SM SM S S S S S S S S S
Images from Cryptography Research

Crypto necessary, but not sufficient

`

Game King poker (2014) Bug allows user to adjust bet
after hand played
25

Siemens Simatic S7-315 Target of Stuxnet
Operation Olympic Games
http://www.wired.com/2014/10/cheating-video-poker/

#RSAC
`
Learn More!

Resources

Genera7ng$keys:$a$toy$protocol$

Alice$wants$a$shared$key$with$Bob.$$$$$Eavesdropping$security$only.$
$
Bob#(kB) $Insec$Aulicree#(k$aA)gain$ st$m$ anNi$nNth$eTTNPm# iddle$

"Alice$wants$key$with$Bob"$
As$described,$the$protocol$is$insecure$against$acJcvheo$oasFe$a$ cks$

7ckeAtl$ice#

MiTM#

random$kAB$
Bob#

`

kAB##

kAB##

(E,D)$a$CPANsecure$cipher$
Dan$Boneh$

Dan$Boneh$

Understanding Cryptography Christof Paar and Jan Pelzl (Springer, 2009)

Cryptography online course Dan Boneh, Stanford University

27

How to apply what you have learned
In the first three months:
Identify where cryptography is used in your organization Identify infrastructure required (key management, certificates)
`
Within six months:
Know what crypto can do. Explain the different security properties. Know what crypto can't do. Understand basic implementation security issues.
28

Questions?

@ Benjamin Jun

Friday Marc` h 4, 10:10am
Our Road Ahead: Today's Tech Developments, Tomorrow's Security Challenges
Fireside chat with Benjamin Jun and Hugh Thompson Industry Experts EXP-F02
29

