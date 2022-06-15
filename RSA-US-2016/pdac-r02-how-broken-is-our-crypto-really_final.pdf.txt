SESSION ID: PDAC-R02
How Broken Is Our Crypto Really?
#RSAC

Martijn Grooten
Editor, Security Researcher Virus Bulletin @martijn_grooten

#RSAC
How Broken Is Our Crypto Really?

(SC Magazine)

(ZDNet)

(IBM Security Intelligence)
2

#RSAC
How Broken is Our Crypto Really?
Or: what do we mean when we say as cryptographic protocol is "broken"?
3

#RSAC
What is this talk about?
Broken algorithms and protocols and the likeliness of these being exploited.
Diffie Hellman / Logjam SSL3 / POODLE RC4 / NOMORE SHA-1
4

#RSAC
What is this talk NOT about?
An excuse not to use the latest and greatest cryptographic protocols Implementation issues Short keys and downgrade attacks Dual_EC_DRBG
5

#RSAC
Dual_EC_DRBG
This algorithm (likely) contains a backdoor This backdoor can be (and likely has been) exploited This backdoor was (likely) inserted deliberately This is an exception
6

#RSAC
Introducing Alice and Bob

Alice

Eve

Bob

Authentication (SHA-1)

Key agreement (Diffie-Hellman)

Encrypted data-exchange (SSL3, RC4)

7

#RSAC
HTTP and HTTPS: ideal for crypto-attacks
Alice visits https://target.website/ and also http://example.com/ With a MitM-position, Eve can freely insert JavaScript into http://example.com/ to force Alice to make certain requests This is ideal for many crypto-attacks, but doesn't work in other protocols (SMTP, SSH etc.)
8

#RSAC
Diffie-Hellman and the LogJam attack

#RSAC
Agreeing on protocol standards

Alice and Bob publicly agree on a "group" g to be used.

g?

OK!

10

#RSAC
Generating private keys

Alice chooses a (large) random number a. Bob chooses a (large) random number b. Both are kept secret.

a

b

11

#RSAC
Computing public keys

Using a `mechanism', Alice computes a number ga. Bob computes a number gb. Both numbers are shared publicly.

ga

gb

12

#RSAC
Who knows what?

Alice knows a, ga, gb. Bob knows b, ga, gb. Eve knows ga, gb.

ga gb

13

#RSAC
Generating the public key
Alice combines a and gb to compute (gb)a. Bob combines b and ga to compute (ga)b. Mathematics is kind to us:
(gb)a = (ga)b This is the secret key they will use. The key is broken if Eve can compute a from ga (or b from gb).
14

#RSAC
Nothing is impossible
Like most cryptographic algorithms, Diffie-Hellman can be broken. It is just very expensive to do so. Breaking 1024-bit Diffie-Hellman costs about $100m. No one will ever pay that to crack a single key!
15

#RSAC
So how would such an attack work?
Most of the attack involves computations specific only to the group g. Only a small (and cheap) part of the attack targets the specific numbers ga and gb. So what if most Alices and Bobs use the same group g?
16

#RSAC
Guess what?
Many Alices and Bobs do indeed use same group g: e.g. some HTTPS, VPN implementations. For $100m worth of "preparations" you can crack all these implementations at once, in (near) real-time. This is the "LogJam" attack. It is believed that this is how the NSA has broken many VPN connections.
17

#RSAC
Is Diffie-Hellman broken?
Diffie-Hellman has not been broken! 2048-bit Diffie-Hellman is very secure. 1024-bit Diffie-Hellman with a unique g is secure in practice. (But it's best avoided.)
18

#RSAC
SSL3 and POODLE

#RSAC
Block cipher encryption in SSLv3
Electronic Codebook (ECB)
20

#RSAC
Block cipher encryption in SSLv3
Cipher Block Chaining (CBC)
21

#RSAC
"Tidying up" the plaintext
Add a MAC to "avoid tampering" Add padding to fill up final block
22

#RSAC
Padding
?? ? ? ?5

whatever

size of rest of padding

23

#RSAC
If padding fills last block
In HTTPS, Eve can make sure Alice's request looks like this She can also replace the final block with a previous block
24

#RSAC
Bob decrypts the last block
? ??? ? ? ??
Bob accepts this only if the final byte is "correct". This happens once every 256 times. If it fails, the connection is reset and Eve can try again. If it succeeds Eve can compute one byte of the plaintext.
25

#RSAC
HTTP(S) requests are predictable

POST /xxxx HTTP/1.1 Host: target.website Cookie: ??????????
xxxxxxxxx

Eve can force this to vary to ensure the padding fills the last block...
...and for this to be the final byte of a block.
And thus "construct" the cookie byte by byte.

26

#RSAC
POODLE attack on SSLv3
Makes it very easy for Eve to compute the session cookie (under reasonable circumstances) Does not allow Eve to decrypt the full request, or any part of the response. Does not work against other protocols. Session hijacks are very bad. But they usually don't give you the keys to the kingdom.
27

#RSAC
RC4 and the NOMORE attack

Stream ciphers: RC4
29

#RSAC
Key stream Plaintext
("XOR") Ciphertext

#RSAC
The RC4 algorithm
for i from 0 to 255; S[i] := i; endfor j := 0; for i from 0 to 255; j := (j + S[i] + key[i mod keylength]) mod 256; swap values of S[i] and S[j]; endfor;
i := 0; j := 0 while GeneratingOutput:
i := (i + 1) mod 256; j := (j + S[i]) mod 256; swap values of S[i] and S[j]; K := S[(S[i] + S[j]) mod 256]; output K; endwhile
30

#RSAC
RC4
Easy to implement, especially in software Very popular in malware! "Too good to be true" ­ W. Diffie
31

#RSAC
A bias in the second byte
There is a very obvious bias in the second byte of an RC4 keystream: its value is 0 twice as likely as one would expect. It takes a few thousand encryptions of the same plaintext for Eve to be certain of the second byte. That is really bad. It is never useful.
32

#RSAC
More biases
There are many pairs and triplets of bytes with a small bias. It takes much more than a thousand encryptions to know these bytes in the plaintext.
33

#RSAC
The NOMORE attack
Eve forces Alice to make the same HTTPS request a very large number of times. After ~75 hours, she still isn't sure of the plaintext. But she has enough candidates for the cookie that she can brute-force the cookie.
34

#RSAC
The NOMORE attack
This requires certain conditions about the cookie to be met. The attack can not be sped up by using fast computers! Still only gives you a (session) cookie. This will never be used in practice.
35

#RSAC
Conclusion so far
Diffie-Hellman is safe, but choose a large and/or unique group. Avoid SSLv3 for HTTPS because of POODLE. There are better alternatives to RC4, but in general, the algorithm has not been broken.
36

#RSAC
SHA-1

#RSAC
Hashing algorithms
Turns an arbitrary sequence of bytes into a fixed-length block that gives no information about the original. MD5, SHA-1, SHA-256
md5(US constitution) = 8fc81ba27fae09ff613b5edbf865fd63 md5("hello world") = 5eb63bbbe01eeed093cb22bb8f5acdc3 md5("Hello world") = 3e25960a79dbc69b674cd4ec67a72c62
38

#RSAC
X.509 certificates

Information on certificate

Information on signer

hash

Public key Signature

39

#RSAC
Bob sends to Alice
His certificate "something" unique A signature of "something", signed with the private key corresponding to the public key in his certificate. Now Alice knows this is the certificate belonging to the person she's talking to. How does she know this is Bob?
40

#RSAC
Bob authenticates to Alice

"something" sig("something")

Intermediate certificate

Root certificate

The Root certificate is stored on Alice's computer (or browser).

41

#RSAC
What could go wrong?

Information on certificate Information on signer
Public key Signature

If Eve could forge a certificate with the very same hash as hash that of Bob's, she could add the signature of Bob's certificate and authenticate as Bob.

42

#RSAC
From difficult to easy

Find a certificate with the same SHA-1 hash as a given

This is what Eve wants

certificate.

Find an arbitrary block of bytes with SHA-1 hash value equal to that of another block.

Find two blocks with the same SHA-1 hash ("collision").

Find a hash collision for a weaker form of SHA-1 ("free start collision").

This is where we are now (Marc Stevens)
43

Why the panic?

A brief history of MD5:

"The presented attack does not yet threaten practical applications of MD5, but it comes rather close".
Dobbertin, 1996.

"I know, I know."

44

#RSAC
Flame malware, 2012

#RSAC
Phasing out SHA-1 in certificates
Certificates can last for many years; we can't just stop accepting them from one day to the next. Upgrading your certificates won't prevent people from impersonating you! The phasing out will last several years. Phasing out has already hurt people. Flame-like attacks have been mitigated.
45

#RSAC
Conclusions

#RSAC
Why bother?
Attacks only get better, they never get worse. I may be wrong!
It shows that you care.
47

#RSAC
So what is the problem?
A false sense of insecurity. A false sense of security.
A cryptographic protocol is unlikely going to be the weakest link in your organisation!
48

#RSAC
Is there ever an excuse for weak crypto?
No! Well, OK but only if
The alternative is worse You really understand the attacks You can respond to new threats quickly Example: Google supporting SSL3 for encrypted SMTP.
49

#RSAC
What to do?
Do inform yourself about new attacks. Do upgrade to the latest and greatest crypto. Don't panic. Do remember that you undoubtedly have bigger problems than the crypto protocols you are using.
50

#RSAC
Thank you!
martijn.grooten@virusbtn.com @martijn_grooten https://www.lapsedordinary.net/rsa2016/

