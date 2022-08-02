SESSION ID: DSP-R01
Seven Grades of Perfect Forward Secrecy

Oleg Gryb
Sr. Manager, Security Engineering Samsung SSIC

#RSAC

#RSAC
PFS - Definitions

#RSAC
Classical PFS Definition
"Long-term secret keying material does not compromise the secrecy of the exchanged keys from earlier run"
W. Diffie, P. Oorchot, M.Wiener: Authentication and Authenticated Key Exchanges, 1992 http://people.scs.carleton.ca/~paulv/papers/sts-final.pdf
3

#RSAC
Session and Long-term Keys
Session Keys: · One time symmetric key used to encrypt all messages in a session. · Similar to a one time use password (OTP).
Long-term Keys: · Live longer than a session. It can actually live years. · Can be used to derive Session Key. · Idealistically stored in an HSM appliance, but it varies.
4

PFS ­ What it protects

#RSAC

against

Why PFS is important
Installing TCPDUMP on DD-WRT is easy: Emtunk's Blog
6

#RSAC
$0.01 per GB/month

Exploit, if PFS is not implemented

#RSAC

5% per month is free $0.01 per GB after that
7

#RSAC
TLS Handshakes

SSL Handshake without PFS

#RSAC
Session key is generated from Premaster, random numbers 'a' and 'b'.
Premaster is encrypted with long-term server's key
If long-term key is compromized,session key is compromized too.

9

PFS with traditional Diffie-Hellman

#RSAC

SrvKeyExchange will contain additional DHparams: p ­ big prime g ­ its primitive root: a coprime pk : g^ka(mod p) Ys=g^a mod p ­ this is server's public key

ClientKeyExchange will contain ClientDiffieHellmanPublic instead of RSA Premaster Secret: Yc=g^b mod p ­ this is client's public key

Where 'a' and 'b' random numbers picked up by Server and Client independently

Shared Secret = g^(ab) mod p = Ys^b mod p = Yc^a mod p

W. Diffie, M. Hellman: "New Direction in Cryptography", 1976 RFC 5246
10

Old DH ­ Performance Impact

#RSAC
At around 500 TPS response time for DH grows from 10ms to 10s
For traditional RSA everything runs smoothly until 2500 TPS
From Vincent Bernat's SSL/TLS blog

11

DH with Elliptic Curves

#RSAC

SrvKeyExchange will contain EC parameters It can be a pre-defined named curve, e.g. prime256v1, or explicitly defined curve with all necessary params:
p ­ big prime, which defines a field Fp ECurve (, ) (y^2 = x^3 + x + ) ­ short Weierstrass equation, defines E(Fp) ECPoint ­ base point G (generator) order - order of G (a min n for which nG is not defined) cofactor ­ order*cofactor = |E(Fp)| Public ECDH server key: Ys = aG

ClientKeyExchange will contain ClientECDiffieHellmanPublic with: Public ECDH client key: Yc = bG

Shared Secret = abG = aYc = bYs

An Efficient Protocol for Authenticated Key Agreement, 1998 RFC4492
12

ECDHE ­ Performance vs. RSA

#RSAC

On server side DHE three times slower than RSA 2048
For optimized ECDHE-64 the overhead is 15% only

From Vincent Bernat's SSL/TLS blog

13

TLS Cheatsheet

Handshake Algorithm

Public(*) params for session key

Private(*) params for session key

Long term key (LTK) usage

Attack complexity

Classic (RFC 5264)
DHE (RFC 5264)
ECDHE (RFC 4492)

Random a,b Public cert of LTK
p ­ big prime g ­ its primitive root
p ­ big prime G ­ base point r ­ order of G k ­ small cofactor ­ curve's param ­ curve's param

Premaster Secret(sent encrypted) LTK
Random, private a,b (a & b are never sent)
Random, private a,b (a & b are never sent)

Authentication and encryption
Authentication only
Authentication only

Same as attack on RSA/DSA based PKI
Same as discrete logarithm problem
Same as discrete logarithm problem

Speed

#RSAC

Still fastest

Times slower than RSA
Almost the same as classical RSA

14

#RSAC
PFS - Grades

Possible PFS Implementations

#RSAC

As discussed, we have three major options:

 No Diffie-Hellman  Older Diffie-Hellman without curves (DHE)  New Diffie-Hellman with curves (ECDHE)

In addition, server can also:
 Have preferred ciphers that fall to one of the categories above  It can support or not support newer and older DH protocols

16

PFS Grades

#RSAC

Supported PFS Only PFS Only PFS and non PFS PFS and non PFS DHE, ECDHE and non PFS DHE and non PFS PFS are not supported

Preferred ECDHE DHE ECDHE DHE Non PFS
Non PFS Non PFS (obviously)

Grade 1 2 3 4 5
6 7

17

PFS Grades ­ More Reasoning

#RSAC

Why preferred ciphers are important?

 Client can send a list of ciphers that it supports  Server will always select a preferred, even if client has a better cipher in the list

Why ECDHE vs DHE is important?

 Because of performance (see slides 7 and 9)  If we don't care about performance, we could consider the following grades equivalent: 1 and 2, 3 and 4, 5 and 6

You can reduce the number of grades to 4 if you care about security only, but it's probably not a wise thing to do, because too many security initiatives are stopped because of "poor performance". Example ­ old DHE itself vs. RSA.

18

#RSAC
PFS - Testing

Let us test them

#RSAC

Ten companies in each of the following industries have been selected:

 Manufacturing  Finance  Government  InfoSec  Defense  Health  Internet  Electronics  Education  Software

20

Notes on site selections

#RSAC

 How ­ Just Googled them, e.g. "top ten health providers"

 The biggest challenge ­ it was difficult to find SSL protected Websites in  Defense ­ everything is usually public at those   Exception ­ their job related portals

 Used a Python client with JSON configuration file

 Code for testing : sf.net/projects/pfschecker

21

Configuration file example

#RSAC

"statfile":"statfile.html", "ciphers":"ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCMSHA384:ECDHE-RSA-AES256-SHA384:ECDHEECDSA....", "baseline_ciphers":"AES128-SHA:RC4-MD5:RC4-SHA:AES256-SHA:DES-CBC3-SHA", "hosts":[ {"host":"www.bank1.com","port":443,"name":"Bank One","tag":"Finanace"}, {"host":"www.bank2.com","port":443,"name":"Bank Two","tag":"Finanace"}, {"host":"www.bank3.com","port":443,"name":"Bank Three","tag":"Finanace"}, {"host":"www.bank4.com","port":443,"name":"Bank Four","tag":"Finanace"},

22

Test results

#RSAC

23

Winners and Losers

#RSAC

Winners:  Internet  InfoSec  Defense  Education At least one has PFS as preferred:  Manufacturing  Government  Health PFS not implemented as preferred:  Finance  Electronics  Software

Some Thoughts:
 Finance organizations are usually very good when it comes to privacy or fraud, but do not adopt technology fast
 Internet companies might not be that good in privacy, but are quick in picking up new technologies including security
 Education/Universities are similar when it comes to innovations
 InfoSec, Defense ­ they ought to and could've been done even better IMO

24

Details for Internet Companies

#RSAC

 No difference in handshake time from client point of view  All major Internet companies graded as 3 or 4  Everyone supports all versions of TLS  Everyone uses the same fast preferred ECDHE cipher
Disappointment:  SSLv3 and TLSv1 support. I would love to see only TLSv1.2
25

Details for Finance Sector

#RSAC

 Too many companies (80%) don't support PFS at all (grade 7)  Poor support for the newer TLS versions (1.1 and 1.2)
26

What about Browser's Support for ECDHE

#RSAC

From Qualys Community Website
27

Six Months Later

#RSAC

28

You can make a difference

#RSAC

29

PFS ­ Getting to

#RSAC

Conclusions

Conclusion

#RSAC

 There is no any reason why you can't move your servers to category #3 or #4 (there is a fallback on non PFS)
 To move them to the the categories #1 or #2 (there is no fallback on non-PFS) a decision about not supporting legacy browsers should be made. That decision would make a perfect sense since it'll improve the overall security of web applications.
 Other factors to consider to make a decision about not supporting "legacy browsers":  They are less secure  You want to take the full advantage of HTML5  Upgrade to newer versions if usually free

Just Tell Them to Upgrade! No significant excuses have left.

31

There are always exceptions ...

#RSAC

PFS

32

There is only one grade of perfection

#RSAC

ECDHE

No Fallback on
Anything Less Perfect
33

Thanks for Coming !

#RSAC

Q & A Time
Oleg Gryb Sr. Manager, Security Engineering @ SSIC Twitter: @oleggryb
34

