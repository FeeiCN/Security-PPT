Fed Up Getting Shattered and Log Jammed?
A New Generation of Crypto is Coming
David Wong

Snefru MD4

Snefru MD4

Snefru
MD4 MD5

SHA-1

Merkle­Damgård

SHA-2

Snefru
MD4 MD5

SHA-1

Merkle­Damgård

SHA-2

Snefru MD4 MD5
Merkle­Damgård
SHA-1 SHA-2

Snefru
MD4 MD5

SHA-1

Merkle­Damgård

SHA-2

Keccak
BLAKE, Grøstl, JH, Skein

outline
· 1. Intro · 2. SHA-3 · 3. Strobe, a protocol framework derived from SHA-3 · 4. Noise, a full protocol framework not derived from SHA-3 · 5. Strobe + Noise = Disco

Part I: SHA-3
Big things have small beginnings

f
permutation-based cryptography

AES is a permutation

input output

AES

AES is a permutation

input output

AES

0

0

0

0

0

0

0

key

0 0

0

0

0

0

0

0

0

Sponge Construction
f

Sponge Construction

0

0

0

1

0

0

0

f

1

0

1

0

0

0

0

0

1

Sponge Construction

0 0
r0
0 0
0
c0
0

0

1

0

f

1

1

0 0 1

Sponge Construction

0 0
r0
0 0
0
c0
0

0

1

0

f

1

1

0 0 1

r

c

AES

0

0

0

0

0

0

0

key

0 0

0

0

0

0

0

0

0

Sponge Construction message

0

1

0

1

0

1

0

f

0

0

0

0

0

0

1

0

0

Sponge Construction message

0

0

0



0 f
0

0 0 0

Sponge Construction message

0

0

0



0

f

f

0

0 0 0

Sponge Construction message

0

0

0





0

f

f

0

0 0 0

Sponge Construction message

0

0

0





0

f

f

f

0

0 0 0

Sponge Construction message

0

0

0





0

f

f

f

0

0 0 0
absorbing

Sponge Construction

message

output

0

0

0





0

f

f

f

0

0 0 0
absorbing

Sponge Construction

message

output

0

0

0





0

f

f

f

f

0

0 0 0
absorbing

Sponge Construction

message

output

0

0

0





0

f

f

f

f

0

0 0 0
absorbing

Sponge Construction

message

output

0

0

0





0

f

f

f

f

f

0

0 0 0
absorbing

Sponge Construction

message

output

0

0

0





0

f

f

f

f

f

0

0 0 0
absorbing

squeezing

Part II: Strobe
From SHA-3 to protocols

Sponge Construction

message

output

0

0

0





0

f

f

f

f

f

0

0 0 0
absorbing

squeezing

0 0 0 0 0
0 0
init 0

Duplex Construction input output input output input output


f


f


f

duplexing

duplexing

duplexing

key

0 0 0 0 0 0 0
init 0


f
duplexing

Keyed-mode

key

0 0 0 0 0 0 0
init 0


f
duplexing

Keyed-mode secret part
leak

0 0 0 0 0 0 0
init 0

key ciphertext1

Encryption

 plaintext1


f

duplexing

0 0 0 0 0 0 0
init 0

Authenticated Encryption

key

ciphertext1

tag1

 plaintext1


f


f

duplexing

duplexing

0 0 0 0 0 0 0
init 0

Sessions

key

ciphertext1

tag1

ciphertext2

tag2

 plaintext1

 plaintext2


f


f



f

f

duplexing

duplexing

duplexing

duplexing

Strobe
myProtocol = Strobe_init("myWebsite.com") myProtocol.AD(sharedSecret) buffer = myProtocol.send_ENC("GET /") buffer += myProtocol.send_MAC(len=16) // send the buffer // receive a ciphertext message = myProtocol.recv_ENC(ciphertext[:-16]) ok = myProtocol.recv_MAC(ciphertext[-16:]) if !ok { // reset the connection }

Strobe
buffer = myProtocol.send_ENC(plaintext1) buffer += myProtocol.send_MAC(len=16) // send the buffer buffer = myProtocol.send_ENC(plaintext2) buffer += myProtocol.send_MAC(len=16) // send the buffer buffer = myProtocol.send_ENC(plaintext3) buffer += myProtocol.send_MAC(len=16) // send the buffer buffer = myProtocol.send_ENC(plaintext4) buffer += myProtocol.send_MAC(len=16) // send the buffer

Hash Function
myHash = Strobe_init("hash") myHash.AD("something to be hashed") hash = myHash.PRF(outputLen=16)

Key Derivation Function
KDF = Strobe_init("deriving keys") KDF.AD(keyExchangeOutput) keys = KDF.PRF(outputLen=32) key1 = keys[:16] key2 = keys[16:]

0 0 0 0 0 0 0
init 0

operation = AD


0 0 0 0 0 0 0
init 0

operation = AD
data = 010100...


0 0 0 0 0 0 0
init 0

operation = AD

operation = send_ENC

data = 010100...





0 0 0 0 0 0 0
init 0

operation = AD

operation = send_ENC

data = 010100...





f

0 0 0 0 0 0 0
init 0

operation = AD
data = 010100...


operation = send_ENC
data = hello ciphertext





f

0 0 0 0 0 0 0
init 0

operation = AD
data = 010100...


operation = send_ENC operation = send_MAC

data = hello ciphertext







tag len = 16

f

f

send_AEAD

0 0 0 0 0 0 0
init 0

operation = AD
data = 010100...


operation = send_ENC operation = send_MAC

data = hello ciphertext







tag len = 16

f

f

strobe.sourceforge.io
strobe.sourceforge.io

Strobe
· flexible framework to support a large number of protocols · large symmetric cryptography library · fits into tiny IoT devices (less than 1000 lines of code) · relies on strong SHA-3 standard

Part III: Noise
A modern protocol framework

TLS
· TLS is the de facto standard for securing communications · complex specification
· supported by other complex specs (asn.1, x509, extensions, ...) · design carrying a lot of legacy decisions · huge and scary libraries
· cumbersome configuration... · often dangerously re-implemented (custom implementations)
· or re-invented (proprietary protocols)

Complexity is the enemy of security

www.noiseprotocol.org

The Noise Protocol Framework
· it's a protocol framework to achieve something like TLS · "easy" to understand, to analyze, to extend and to implement · no need for a PKI · many handshakes to choose from (flexible) · it's straight forward to implement (<2k LOC)
· and small (18kb for Arduino by Virgil Security) · there are already libraries that you can leverage · minimal (or zero) configuration · if you have a good excuse not to use TLS, Noise is the answer

The crypto functions

· DH · 25519 · 448

· AEAD · Chacha20-Poly1305 · AES-GCM

· HASH · SHA-256 · SHA-512 · BLAKE2s · BLAKE2b

A simple state machine

Client

ephemeral key ephemeral key
handshake

Server

A simple state machine

Client
Diffie-Hellman() keys

ephemeral key ephemeral key

Server

handshake Diffie-Hellman() keys

A simple state machine

Client
Diffie-Hellman() keys

ephemeral key ephemeral key

Server

handshake Diffie-Hellman()

encrypted data

keys

encrypted data

post-handshake

A simple state machine

Client
ee keys

e e
handshake
encrypted data encrypted data
post-handshake

Server
ee keys

Handshake Patterns
 e  e, ee

Handshake Patterns
Noise_NN():  e  e, ee

Tokens
· e: ephemeral key · s: static key · ee: DH(client ephemeral key, server ephemeral key) · es: DH(client ephemeral key, server static key) · se: DH(client static key, server ephemeral key) · ss: DH(client static key, server static key) · psk: pre-shared key

Handshake Pattern

No static key for the client

Static key for the server Xmitted ("transmitted") to the client

Noise_NX(rs):  e  e, ee, s, es

Noise_NX(rs):  e  e, ee, s, es

Client

Server

Noise_NX(rs):  e  e, ee, s, es

Client

epublic

Server

Noise_NX(rs):  e  e, ee, s, es

Client

epublic payload1

Server

Noise_NX(rs):  e  e, ee, s, es

Client

epublic payload1

Server

republic

Noise_NX(rs):  e  e, ee, s, es

Client

epublic payload1

Server

republic

Noise_NX(rs):  e  e, ee, s, es

Client

epublic payload1

Server

republic EK1(s)

Noise_NX(rs):  e  e, ee, s, es

Client

epublic payload1

Server

republic EK1(s)

Noise_NX(rs):  e  e, ee, s, es

Client

epublic payload1

Server

republic EK1(s) EK2(payload2)

CipherState SymmetricState HandshakeState

ck

h HASH

"Noise_NX_25519_AESGCM_SHA256"

Initialization

DH(e, re)
HKDF

HASH

e GENERATE_KEYPAIR() e.public_key

epublic

n=0 k1 ck
DH(e, rs)

h
HASH

payload1

payload1 republic

n=0 k2 CipherState n=0 k

HKDF
ck
HKDF

CipherState n=0 k

h
HASH
h
HASH
h
HASH
h

re

republic

re.public_key

h

rs

DecryptWithAd()

Ek1(rspublic)

Ek1(rspublic) Ek2(payload2)

Ek1(rspublic)

h

payload2

DecryptWithAd()

Ek2(payload2)

Ek2(payload2)

Part IV: Noise + Strobe = Disco
A modern cryptographic {protocol, library} based on SHA-3 and Curve25519

StrobeState
InitStrobe()

send_CLR()

payload1

send_CLR()

republic
DH(e, re)

recv_CLR() AD()

E(rspublic)

recv_AEAD()

DH(e, rs)

AD()

E(payload2)

recv_AEAD()

StrobeState
...

StrobeState
...

HandshakeState
"Noise_NX_25519_AESGCM_SHA256"
e GENERATE_KEYPAIR() e.public_key
re.public_key
rs.public_key
payload2

Initialization epublic
payload1 republic
E(rspublic) E(payload2)

StrobeState
send_AEAD() send_AEAD() send_AEAD() send_AEAD() send_AEAD() send_AEAD() send_AEAD()

StrobeState
recv_AEAD() recv_AEAD() recv_AEAD() recv_AEAD() recv_AEAD() recv_AEAD() recv_AEAD()

no need for IVs or nonces

StrobeState



HandshakeState
"Noise_NX_25519_AESGCM_SHA256"
e GENERATE_KEYPAIR() e.public_key

 payload1  republic re.public_key  DH(e, re)
 rs.public_key
E(rspublic)
tag
 DH(e, rs)
 rs.public_key
E(rspublic)
tag

Initialization epublic
payload1 republic
E(rspublic), tag E(payload2), tag

The state of Disco
· Noise is still a draft · Strobe is alpha (v1.0.2) · Disco is a draft specification extending Noise (experimental) · libDisco is a plug-and-play protocol+library
· the Golang library is here: www.discrocrypto.com · it's ~1000 lines of code
· ~2000 lines of code with Strobe · +2000 lines of code with X25519 ·  Disco and libdisco are still experimental · we need more eyes, more interoperability testing, ... ·  THIS IS NOT REPLACING TLS

I write about crypto at www.cryptologie.net
I tweet my mind on twitter.com/lyon01_david

and I work here

