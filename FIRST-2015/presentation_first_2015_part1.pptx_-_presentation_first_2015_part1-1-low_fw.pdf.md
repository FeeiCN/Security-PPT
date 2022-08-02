BetterCrypto org
Applied Crypto Hardening

David Durvaux Aaron Kaplan Aaron Zauner

FIRST.org -- Berlin, June 20

Why better crypto?

But of course...
 It is not only the NSA, who intercepts  Other nations now have a blueprint (thanks
to Snowden) in case they did not have the
technical skills yet
 Criminals now have a blueprint,...  Everyone has!  So, what can we do?

on't give them anything for fre
It's your home, your fight!

W ho (authors of bettercrypto)

Agenda
 Part 1: BetterCrypto and the crypto world  Part 2: When Thinks Goes Wrong...

Agenda ­ Part 1
 Pieces of History  Introduction to BetterCrypto project  Cryptography in a nutshell  Practical Settings  Testing  Demo
Conclusion

Pieces of History

Historic ciphers
 Caesar Cipher  Vigenère Cipher

Mary Queen of Scots
 Trial against Queen
Elizabeth
 Was executed after
code was broken (15

Enigma
 Secret in code book

BetterCrypto

W hy?
 Crypto is cryptic  A lot of difficult concepts  A lot of algorithms  A lot of parameters ...

The Idea
 Really difficult for systems administrators  A "cookbook" can help!  That's BetterCrypo

That's not...
 A crypto course  A static document

In brief
 Community effort to produce best common practices for typical servers
 Continuous effort  From diverse areas of expertise: sysadmins,
cryptologists, developers, IT security pros
 Open Source (CC-BY-SA)  Open to comments / suggestions /
improvements

2 parts
 First part = configurations  The most important part  Cover as many tools as possible  Second part = theory  Explain and justify choose we made  Transparency

How to use the bettercrypto guid

Start

Introduction

No time (copy/paste)

yes

no
Read Theory (explains why we choose certain settings)

read Practical Recommendatio
re-read Practical Recommendatio

Crypto in a nutshell

Goals
 2 types of goals:  protect the content of the message
 Eavesdropping  Tampering
 identify the author (signatures)
 At least the one who controls the key
Can be combined

Symmetric Crypto
 The key is shared

"A very secret message"

"A very secret m

Cipher

dfjklsdfiezdazdqsdqsd

Unciphe

shared

shared

Asymmetric Crypto
 Public key is published  Private key H A S to be secured

"A very secret message"

"A very secret m

Cipher

dfjklsdfiezdazdqsdqsd

Unciphe

Bl ' P bli

Bl '

Signing
 Author's identity is proved
 Signed with the pr ivat e key

A very secret message" Hash

"A very secret message"

Hash

Sign

Cipher

dfjklsdfiezdazdqsdqsd

Uncipher

The asymmetric magic
 RSA "formula" : c = me mod(n)  with  c which is the ciphertext  m is the cleartext message  e and n are the public key  Decipher with m = cd mod(n)
d being the private key



Diffie-Helleman
How to share a secret key?

Secret: a Public: p & g
g^a mod p = A

send p & g

Secret

Secret Public: p

send A

send B g^ b mod

Ephemeral Diffie-Helleman
 Regular mode  Public and private keys are kept  Ephemeral mode  New keys are generated each time  By both parties

Hashing
 Take long piece of data and produce a
probably unique fingerprint
 Probability of collision for SHA1:  1 over
146150163733090291820368483271628
3019655932542976

TLS
Hello includes Random number Cipher suite
Finished 1st cipher message w
negotiated parameter Algorithm Key

Forward Secrecy-Motivation
 Lavabit example  Three letter agency (TLA) stores all ssl traffic  Someday TLA gains access to ssl-private key
(Brute Force, Physical Force)
 TLA can decrypt all stored traffic

Perfect Forward Secrecy
 DHE: Diffie Hellman Ephemeral  Ephemeral: new key for each execution of a key
exchange process
 SSL private-Key only for authentication  Alternative new ssl private key every x days months  Pro:
 Highest Security against future attacks  Contra:

Stream vs Block Cipher
 Stream cipher  Generate an "infinite" key stream  Difficult to correctly use  Re-use of keys  Faster  Block cipher  Encrypt by block with padding

RNGs
 RNGs are important.  Nadia Heninger et al / Lenstra et al  Entropy after startup: embedded devices

(p)RNGs
 Weak RNG  Dual EC_DRBG is BROKEN (backdoored, used in RSA-toolkit)  Intel RNG ? Recommendation: add System-Entropy (Network).
Entropy only goes up.
 Tools (eg. HaveGE ) http://dl.acm.org/citation.cfm?id=945516  RTFM
 when is the router key generated  Default Keys ?  Re-generate keys from time to time

Some algorithms
 Symetric Ciphering  AES(Rijndael)  Camellia  Asymetric Ciphering  RSA  PGP (GPG)

Some algorithms
 Hash  SHA1  SHA256  SHA512  Key Exchange  Diffie Helleman

Algorithm vs Implementation!
 Heartbleed  Debian bug in Openssl (randomness was
commented out)

Cost of encryption
me openssl enc -e -a -aes-128-cbc -in ./rfc791.t /tmp/rfc.aes -k "Super Key" -S 01EF 0m0.014s 0m0.004s 0m0.003s
me gpg -a -u 57AB3358 -r 77659F3E -e ./rfc791.tx 0m0.069s 0m0.048s 0m0.008s

Keylengths
On the choice between AES256 and AES128: I would never consider using AES256, just like I don't wear a helmet when I sit inside my car. It's too much bother for he epsilon improvement in security."
-- Vincent Rijmen in a personal mail exchange Dec 2013

Keylengths
 http://www.keylength.com/  Recommended Keylengths, Hashing algorithms,
etc.
 Currently:  RSA: >= 3248 bits (Ecrypt II)  ECC: >= 256  SHA 2+ (SHA 256,...)  AES128 is good enough

BetterCrypto CipherSuite
 2 cipher suites  version A  stronger  fewer supported clients  version B  weaker

Some general thoughts on settings
General
 Disable SSL 2.0 (weak algorithms)  Disable SSL 3.0 (BEAST vs IE/XP)  Enable TLS1.0 or preferably better  Disable TLS-Compression (SSL-CRIME Attack)  Implement HSTS(HTTP Strict Transport
Security)

Cipher Suite A
 TLS1.2  Perfect forward secrecy / ephemeral Diffie
Hellman
 Strong MACs (SHA-2) or  GCM as Authenticated Encryption scheme

CiperSuite B
 TLS1.2, TLS1.1, TLS1.0  Allowing SHA-1

Cipher Suite B

Compatibility (B suite)

Tools covered
 Webservers  Apache  lighttpd  nginx  Microsoft IIS

Tools covered
 SSH  Open SSH  Cisco ASA  Cisco IOS

Tools covered
 Mail servers  Dovecot  cyrus-imapd  Postfix  Exim

Tools covered
 VPN  IPSec  CheckPoint Firewall-1  OpenVPN  PPPTP  Cisco ASA  OpenSWAN

Tools covered
 PGP/GPG  IPMI/ILO  Instant Messaging  ejabberd  OTR  Charybdis

Tools covered
 Database systems  Oracle  MySQL  DB2  PostgreSQL

Tools covered
 Proxy  squid  Bluecoat  Pound  Kerberos

But...
 Microsoft products  MSExchange  MSLynx ...  Other major vendors

Mail Encryption
 GPG / PGP ­ end to end protection  Use public / private crypto to protect your emails  Chain of trust  Independent of the mail client / transport layer  Can be used to verify author and/or protect content

Let's have a look

Apache
Selecting cipher suites: Additionally:

Mail Server
 SMTP make use of opportunistic TLS  3 modes for mailservers  Mail Submission Agent (MSA)  Receiving Mail Transmission Agent (MX)  Sending Mail Transmission Agent
(SMTP client)

Mail Server
 Correct DNSconfiguration without
CNAMEs
 Enable encryption  NO self-signed certificates

SMTP client mode
 Hostname used as HELO must match the
PTR RR
 Setup a client certificate  Common name or alternate subject name
must match the PTR RR
 Don`t touch cipher suite

MSA
 Listen on port 587  Enforce SMTP AUTH  No SMTP AUTH on unencrypted
connections
 (use recommended cipher suites)

Postfix: MX & SMTP client
 In main.cf  Enable opportunistic TLS

Postfix: MSA
 Define ciper suite:
 Configure MSA SMTP:

Testing

How to test?- Tools
 openssl s_client (or gnutls-cli)  ssllabs.com: checks for servers as well as
clients
 xmpp.net  sslscan  SSLyze

Tools: openssl s_client
openssl s_client -showcerts ­connect git.bettercrypto.org: 443

Tools: sslscan

Tools: ssllabs

ssllabs (2)

Ssllabs (3)

Demo

GPG - Encryption
o "This is a really secret" \ gpg -a -u <your id>-r <his id> -e

GPG - Decryption
 Let's save the ciphered text to msg.asc  Then uncipher...
gpg -d msg.asc

GPG - Signing
echo "This is a really secret" \ | gpg -a -u <your id>-r <his id>-s

GPG ­ Check Signature
gpg --verify sig.asc
Differents way to sign / verify: ttps://www.gnupg.org/gph/en/manual/x135.html Other techniques
Clearsigned Documents

GPG Key generatio
gpg --gen-key
 Kind of Key  Keylength  Expiration Period

GPG ­ Key signing
gpg --sign-key -u <your ID> <his id>

GPG ­ Let's do it!
Let's do a key party!

GPG ­ Sending key
gpg --send-keys <key id>

GPG - Integration
 Enigmail (Thunderbird)  GPGMail (Apple Mail)  Symantec PGP ...

Other nice user tools
 Ciphered containers:
 TrueCrypt might want to switch now?  Apple's FileVault2
 Password containers
 KeePass  LastPass
...

Conclusion

Future ideas
 Configuration Generator (online)  Other tools  Other protocols

But...

Current state as of
2014/05/31
Solid basis with Variant (A) and (B) Public draft was widely presented at the
CCC, RIPE meeting, IETF Strint workshop,
Linuxdays, ..., M3AAWG
 Section ,, cipher suites" still a bit messy,
needs more work
 Need to convert to HTML

How to participate
 We need: cryptologists, sysadmins, hackers  Read the document, find bugs  Subscribe to the mailing list  Understand the cipher strings Variant (A) and (B) before
proposing some changes
 If you add content to a subsection, make a sample config with variant (B)
 Git repo is world-readable  We need:
 Add content to an subsection from the TODO list send us diffs

Thank you!
 BetterCrypto.org  https://git.bettercrypto.org/ach-master.git  http://lists.cert.at/cgi-bin/mailman/listinfo/ach
 Contact
 david@autopsit.org -- @ddurvaux  aaron@lo-res.org -- @KaplanAaron

More?

The asymmetric magic
 RSA "formula" : c = me mod(n)  with  c which is the ciphertext  m is the cleartext message  e and n are the public key  Decipher with m = cd mod(n)
d being the private key

Heartbleed
/* Enter response type, length and copy
*bp++ = TLS1_HB_RESPONSE; s2n(payload, bp); memcpy(bp, pl, payload);
 payload (pl) and payload_length (payload)
are controlled by attacker
 memcpy will copy a part of the victim
memory to the reply...

ECC
 Elliptic curve cryptography (ECC)  Finding the discrete logarithm of a random
elliptic curve element
 Only knowing a base point  Assumed to be hard  Reduced key length

Some thoughts on ECC
Currently this is under heavy debate Trust the Math eg. NIST P-256 (http://safecurves.cr.yp.to/rigid.html) Coefficients generated by hashing the unexplained seed c49d3608 86e70493 6a6678e1 139d26b7 819f7e90. Might have to change settings tomorrow Most Applications only work with NIST-Curves

